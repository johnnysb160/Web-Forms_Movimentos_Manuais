<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web_Forms_Movimentos_Manuais.View.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="shortcut icon" type="image/x-icon" href="~/Content/sales.ico" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">

    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 88px;
            height: 88px;
        }

        .auto-style3 {
            height: 88px;
        }

        .auto-style6 {
            height: 33px;
            width: 150px;
        }

        .auto-style7 {
            width: 268435520px;
        }

        .auto-style8 {
            margin-left: 50px;
        }

        .auto-style9 {
            height: 225px;
        }

        .auto-style10 {
            width: 88px;
        }

        .auto-style11 {
            width: 262px;
        }

        .auto-style12 {
            width: 1028px;
        }

        .auto-style13 {
            width: 328px;
            height: 31px;
        }

        .auto-style16 {
            width: 193px;
            height: 31px;
        }

        .auto-style17 {
            width: 176px;
            height: 31px;
        }

        .auto-style18 {
            width: 200px;
            height: 31px;
        }

        .auto-style19 {
            width: 150px;
        }
    </style>
</head>
<body>
    <form id="FormMovimentoManual" runat="server">
        <nav class="bg-light">
            <h3 style="text-align: center">
                <asp:Image ID="Image2" runat="server" Height="25px" ImageAlign="TextTop" ImageUrl="~/Content/Artistic-Search.ico" Width="28px" />
                &nbsp;Sistema de Consulta dos Movimentos Manuais (ASP.NET - CSS - C# - SQL Server)&nbsp;&nbsp;&nbsp;
                <asp:Button Text="Sair" ID="btnBSair" runat="server" OnClick="btnBSair_Click" class="btn btn-outline-danger my-2 my-sm-0" />
            </h3>
        </nav>

        <div>
            <table class="auto-style9" dir="auto">
                <tr>
                    <td rowspan="6" class="auto-style19"></td>
                </tr>
                <tr>
                    <td rowspan="6" class="auto-style11">
                        <asp:Image ID="Image4" runat="server" Height="70px" ImageUrl="~/Content/LogoSales.png" Width="206px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label Text="Mês " runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtMes" runat="server" Width="180px" Enabled="False" AutoCompleteType="Disabled" MaxLength="2" ToolTip="Digite o Mês" />
                    </td>

                    <td>
                        <asp:Label Text="Ano " runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtAno" runat="server" Width="180px" Enabled="False" AutoCompleteType="Disabled" MaxLength="4" ToolTip="Digite o Ano" />
                    </td>
                    <td rowspan="6" colspan="6" class="auto-style7">
                        <asp:Image ID="Image1" runat="server" Height="179px" Width="290px" ImageUrl="~/Content/relatorio.png" CssClass="auto-style8" /></td>
                </tr>

                <tr>
                    <td class="auto-style10">
                        <asp:Label Text="Produto " runat="server" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProduto" runat="server" Width="180px" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="ddlProduto_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label Text="Cosif " runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlCodCosif" runat="server" Width="180px" Enabled="False">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style10">
                        <asp:Label Text="Valor " runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtValor" runat="server" Width="180px" Enabled="False" AutoCompleteType="Disabled" ToolTip="Digite o Valor" />
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Descrição " runat="server" />
                    </td>
                    <td colspan="5" class="auto-style3">
                        <asp:TextBox ID="txtDescricao" runat="server" Width="411px" Enabled="False" Height="87px" TextMode="MultiLine" AutoCompleteType="Disabled" ToolTip="Digite a Descrição" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                </tr>
            </table>
            <table class="auto-style12">
                <tr>
                    <td class="auto-style13" style="width: 580px"></td>
                    <td class="auto-style16">
                        <asp:Button Text="Limpar" ID="btnLimpar" runat="server" OnClick="btnLimpar_Click" Enabled="False" /></td>
                    <td class="auto-style17">
                        <asp:Button Text="Novo" ID="btnNovo" runat="server" OnClick="btnNovo_Click" Enabled="True" /></td>
                    <td class="auto-style18">
                        <asp:Button Text="Incluir" ID="btnIncluir" runat="server" OnClick="btnIncluir_Click" Enabled="False" /></td>
                    <td>
                        <asp:Label Text="" ID="IDMessageError" runat="server" ForeColor="Red" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gridView" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#99CCFF" BorderColor="#999999" BorderWidth="2px" Font-Bold="False" Font-Overline="False" OnRowDataBound="gridView_RowDataBound">
                <AlternatingRowStyle HorizontalAlign="Left" />
                <Columns>
                    <asp:BoundField DataField="datMes" HeaderText="Mês" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" />
                    <asp:BoundField DataField="datAno" HeaderText="Ano" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" />
                    <asp:BoundField DataField="codProduto" HeaderText="Código do Produto" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" />
                    <asp:BoundField DataField="desProduto" HeaderText="Descrição do Produto" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="numLancamento" HeaderText="NR Lançamento" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" />
                    <asp:BoundField DataField="desDescricao" HeaderText="Descrição" ItemStyle-Width="35%" />
                    <asp:BoundField DataField="valValor" HeaderText="Valor" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:c}" ItemStyle-Width="15%" />
                </Columns>
                <EditRowStyle HorizontalAlign="Center" />
                <HeaderStyle BackColor="Silver" HorizontalAlign="Center" />
            </asp:GridView>
        </div>

        <nav class="bg-light">
            <h6 style="text-align: center">
                <br />
                <asp:Image ID="Image3" runat="server" Height="25px" ImageAlign="TextTop" ImageUrl="~/Content/search.ico" Width="28px" />
                &nbsp;Sistema de Consulta dos Movimentos Manuais - Por Johnny Barros
            </h6>
        </nav>
    </form>
</body>
</html>
