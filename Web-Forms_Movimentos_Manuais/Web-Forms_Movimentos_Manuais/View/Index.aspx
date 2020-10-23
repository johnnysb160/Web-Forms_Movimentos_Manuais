<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web_Forms_Movimentos_Manuais.View.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">

    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 67px;
        }

        .auto-style2 {
            width: 67px;
            height: 88px;
        }

        .auto-style3 {
            height: 88px;
        }

        .auto-style6 {
            height: 33px;
        }

        .auto-style7 {
            width: 268435520px;
        }
    </style>
</head>
<body>
    <form id="FormMovimentoManual" runat="server">
        <nav class="bg-light">
            <h3 style="text-align: center">Sistema com Cadastro de Produtos (WebForms - ASP.NET - MySql)</h3>
        </nav>

        <div>
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:Label Text="Mês " runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtMes" runat="server" Width="180px" Enabled="False" />
                    </td>
                    <td></td>
                    <td>
                        <asp:Label Text="Ano " runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtAno" runat="server" Width="180px" Enabled="False" />
                    </td>
                    <td rowspan="6" colspan="4" class="auto-style7">
                        <asp:Image ID="Image1" runat="server" Height="148px" Width="198px" ImageUrl="~/Content/relatorio.png" /></td>
                </tr>

                <tr>
                    <td class="auto-style1">
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
                    <td class="auto-style1">
                        <asp:Label Text="Valor " runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtValor" runat="server" Width="180px" Enabled="False" />
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Descrição " runat="server" />
                    </td>
                    <td colspan="5" class="auto-style3">
                        <asp:TextBox ID="txtDescricao" runat="server" Width="417px" Enabled="False" Height="87px" TextMode="MultiLine" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:Button Text="Limpar" ID="btnLimpar" runat="server" OnClick="btnLimpar_Click" Enabled="False" /></td>

                    <td>
                        <asp:Button Text="Novo" ID="btnNovo" runat="server" OnClick="btnNovo_Click" Enabled="True" /></td>
                    <td>
                        <asp:Button Text="Incluir" ID="btnIncluir" runat="server" OnClick="btnIncluir_Click" Enabled="False" /></td>
                </tr>
                <tr>
                    <td colspan="2">
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
    </form>
</body>
</html>
