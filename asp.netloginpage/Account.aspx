﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="asp.netloginpage.Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btmLogout" runat="server" Text="Logout" OnClick="btmLogout_Click" style="width: 57px" />
            <asp:SqlDataSource ID="SqlDataSource1" UpdateCommand="Update Registration set [FirstName]=@FirstName,[LastName]=@LastName, [MobileNumber]=@MobileNumber, [Email]=@Email, [UserName]=@UserName where ([UserName] = @UserName)" runat="server" ConnectionString="<%$ ConnectionStrings:LoginDBConnectionString %>" SelectCommand="SELECT [FirstName], [LastName], [MobileNumber], [Email], [UserName] FROM [Registration] WHERE ([UserName] = @UserName)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
            </Columns>
        </asp:GridView>
             </div>
    <table style="margin:auto;border:5px solid white">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="BankID"></asp:Label></td>
            <td>
                <asp:TextBox ID="BankID" runat="server"></asp:TextBox></td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="accountNumber"></asp:Label></td>
            <td>
                <asp:TextBox ID="accountNumber" runat="server"></asp:TextBox></td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="isPrimary"></asp:Label></td>
            <td>
                <asp:TextBox ID="isPrimary" runat="server"></asp:TextBox></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="LinkBankAccount" OnClick="Button1_Click" />

            </td>
        </tr>
        </table>
        <div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" DeleteCommand="Delete from BankAccount where [bankID]=@bankID and [accountNumber]=@accountNumber and [UserName]=@UserName" ConnectionString="<%$ ConnectionStrings:LoginDBConnectionString %>" SelectCommand="SELECT [bankID], [accountNumber], [UserName], [IsPrimary] FROM [BankAccount] WHERE ([UserName] = @UserName)">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
            </div>
        <div>
        <asp:GridView ID="GridView2" runat="server"  AutoGenerateColumns="False"  DataKeyNames="bankID,accountNumber,UserName" DataSourceID="SqlDataSource2" AutoGenerateDeleteButton="True">
            <Columns>
                <asp:BoundField DataField="bankID" HeaderText="bankID" ReadOnly="True" SortExpression="bankID" />
                <asp:BoundField DataField="accountNumber" HeaderText="accountNumber" ReadOnly="True" SortExpression="accountNumber" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                <asp:BoundField DataField="IsPrimary" HeaderText="IsPrimary" SortExpression="IsPrimary" />
            </Columns>
            </asp:GridView>
       </div>

        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Go to Main Menu" />

    </form>
</body>
</html>
      