using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Forms_Movimentos_Manuais.DAL;
using Web_Forms_Movimentos_Manuais.Model;

namespace Web_Forms_Movimentos_Manuais.View
{
    public partial class Index : System.Web.UI.Page
    {
        LoginComandos loginComandos = new LoginComandos();
        protected void Page_Load(object sender, EventArgs e)
        {
           ListaGrid();
            if (ddlProduto.Text == "")
            {
                CarregaProdutos();
            }
            if (ddlCodCosif.Text == "")
            {
                CarregaCodCosif();
            }
            //txtMes.Attributes.Add("onkeypress", "if (event.keyCode < 48 || event.keyCode > 57) {event.keyCode = 0;}");
            btnBSair.Attributes.Add("onclick", "window.close();");
        }

        public void CarregaProdutos()
        {
            try
            {
                ddlProduto.DataSource = loginComandos.CarregarProdutos();
                ddlProduto.DataValueField = "codProduto";
                ddlProduto.DataTextField = "desProduto";
                ddlProduto.DataBind();
            }
            catch (SqlException e)
            {
                IDMessageError.Text = "Erro com o Banco de Dados" + e.Message;
            }
        }

        public void CarregaCodCosif()
        {
            try
            {
                ddlCodCosif.DataSource = loginComandos.CarregarCodCosif();
                ddlCodCosif.DataValueField = "codClassificacao";
                ddlCodCosif.DataTextField = "codCosif";
                ddlCodCosif.DataBind();
            }
            catch (SqlException e)
            {
                IDMessageError.Text = "Erro com o Banco de Dados" + e.Message;
            }
        }

        public void ListaGrid()
        {
            try
            {
                gridView.Visible = true;
                gridView.DataSource = loginComandos.ListarGrid();
                gridView.DataBind();
            }
            catch (SqlException e)
            {
                IDMessageError.Text = "Erro com o Banco de Dados" + e.Message;
            }
        }

        protected void btnNovo_Click(object sender, EventArgs e)
        {
            txtMes.Enabled = true;
            txtAno.Enabled = true;
            ddlProduto.Enabled = true;
            ddlCodCosif.Enabled = true;
            txtValor.Enabled = true;
            txtDescricao.Enabled = true;
            btnIncluir.Enabled = true;
            btnLimpar.Enabled = true;
            IDMessageError.Text = "";
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            txtMes.Enabled = false;
            txtMes.Text = "";
            txtAno.Enabled = false;
            txtAno.Text = "";
            ddlProduto.Enabled = false;
            ddlCodCosif.Enabled = false;
            txtValor.Enabled = false;
            txtValor.Text = "";
            txtDescricao.Enabled = false;
            txtDescricao.Text = "";
            btnIncluir.Enabled = false;
            btnLimpar.Enabled = false;
            IDMessageError.Text = "";
        }

        protected void btnIncluir_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMes.Text == "" || int.Parse(txtMes.Text) < 1 || int.Parse(txtMes.Text) > 12)
                {
                    IDMessageError.Text = "Campo Mês errado";
                    txtMes.Focus();
                    return;
                }
                if (txtAno.Text == "" || int.Parse(txtAno.Text) < 1990 || int.Parse(txtAno.Text) > 2030)
                {
                    IDMessageError.Text = "Campo Ano errado";
                    txtAno.Focus();
                    return;
                }
                if (txtValor.Text == "")
                {
                    IDMessageError.Text = "Campo Valor vazio";
                    txtValor.Focus();
                    return;
                }
                if (txtDescricao.Text == "")
                {
                    IDMessageError.Text = "Campo Descrição vazio";
                    txtDescricao.Focus();
                    return;
                }
                else
                {
                    MovimentoManual movManual = new MovimentoManual(int.Parse(txtMes.Text), int.Parse(txtAno.Text), 0, ddlProduto.SelectedValue.ToString(), ddlCodCosif.SelectedItem.Text, txtDescricao.Text, DateTime.Now, "", txtValor.Text);
                    string mensagem = loginComandos.InserirMovimento(movManual);
                    IDMessageError.Text = mensagem;
                    ListaGrid();
                    txtMes.Enabled = false;
                    txtMes.Text = "";
                    txtAno.Enabled = false;
                    txtAno.Text = "";
                    ddlProduto.Enabled = false;
                    ddlCodCosif.Enabled = false;
                    txtValor.Enabled = false;
                    txtValor.Text = "";
                    txtDescricao.Enabled = false;
                    txtDescricao.Text = "";
                    btnIncluir.Enabled = false;
                    btnLimpar.Enabled = false;
                }
            }
            catch (Exception)
            {
                IDMessageError.Text = loginComandos.mensagem;
            }
        }

        protected void ddlProduto_SelectedIndexChanged(object sender, EventArgs e)
        {
            var query = from p in loginComandos.CarregarCodCosif()
                        where p.codProduto == ddlProduto.SelectedValue.ToString()
                        select p;
            ddlCodCosif.DataSource = query.ToList();
            ddlCodCosif.DataValueField = "codClassificacao";
            ddlCodCosif.DataTextField = "codCosif";
            ddlCodCosif.DataBind();
        }

        protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
                    if (e.Row.RowIndex % 2 == 1)
                    {
                        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F9FFEF'");
                    }
                    else
                    {
                        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#EAEFE0'");
                    }
                    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#dcdcdc'");
                    break;
            }
        }

        protected void btnBSair_Click(object sender, EventArgs e)
        {
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Sair", "window.close()", true);
        }
    }
}