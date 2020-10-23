using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Web_Forms_Movimentos_Manuais.Model;

namespace Web_Forms_Movimentos_Manuais.DAL
{
    public class LoginComandos
    {
        public string mensagem = "";
        SqlCommand cmd = new SqlCommand();
        Conexao conec = new Conexao();

        public string InserirMovimento(MovimentoManual movManual)
        {
            try
            {
                cmd.Connection = conec.Conectar();
                cmd = new SqlCommand("PROC_CRUD", conec.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mes", SqlDbType.Real).Value = movManual.datMes;
                cmd.Parameters.Add("@ano", SqlDbType.Real).Value = movManual.datAno;
                cmd.Parameters.Add("@produto", SqlDbType.Char).Value = movManual.codProduto;
                cmd.Parameters.Add("@cosif", SqlDbType.Char).Value = movManual.codCosif;
                cmd.Parameters.Add("@descricao", SqlDbType.VarChar).Value = movManual.desDescricao;
                cmd.Parameters.Add("@valor", SqlDbType.Real).Value = movManual.valValor;
                cmd.Parameters.Add("@Acao", SqlDbType.VarChar).Value = "Inserir";
                cmd.ExecuteNonQuery();
                this.mensagem = "Cadastrado com sucesso";
                conec.Desconectar();

            }
            catch (SqlException e)
            {

                this.mensagem = "Erro com o Banco de Dados" + e.Message;
            }

            return mensagem;
        }

        public List<ProcGrid> ListarGrid()
        {
            List<ProcGrid> ListaGrid = new List<ProcGrid>();
            try
            {
                DataTable TabelaDataTable = new DataTable();
                cmd.Connection = conec.Conectar();
                cmd = new SqlCommand("PROC_CRUD", conec.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Acao", SqlDbType.VarChar).Value = "Consultar";

                SqlDataReader ListaReader = cmd.ExecuteReader();
                TabelaDataTable.Load(ListaReader);

                foreach (DataRow obj in TabelaDataTable.Rows)
                {
                    int datMes = int.Parse(obj[0].ToString());
                    int datAno = int.Parse(obj[1].ToString());
                    string codProduto = obj[2].ToString();
                    string desProduto = obj[3].ToString();
                    int numLancamento = int.Parse(obj[4].ToString());
                    string desDescricao = obj[5].ToString();
                    double valValor = double.Parse(obj[6].ToString());
                    ListaGrid.Add(new ProcGrid(datMes, datAno, codProduto, desProduto, numLancamento, desDescricao, valValor));
                }
                conec.Desconectar();
            }
            catch (SqlException e)
            {
                this.mensagem = "Erro com o Banco de Dados" + e.Message;
            }
            return ListaGrid;
        }

        public List<Produto> CarregarProdutos()
        {
            List<Produto> ListaProdutos = new List<Produto>();
            try
            {
                DataTable TabelaDataTable = new DataTable();
                cmd.Connection = conec.Conectar();
                cmd = new SqlCommand("PROC_CRUD", conec.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Acao", SqlDbType.VarChar).Value = "CarregarProdutos";

                SqlDataReader ListaReader = cmd.ExecuteReader();
                TabelaDataTable.Load(ListaReader);

                foreach (DataRow obj in TabelaDataTable.Rows)
                {
                    string codProduto = obj[0].ToString();
                    string desProduto = obj[1].ToString();
                    ListaProdutos.Add(new Produto(codProduto, desProduto));
                }
                conec.Desconectar(); ;
            }
            catch (SqlException e)
            {
                this.mensagem = "Erro com o Banco de Dados" + e.Message;
            }
            return ListaProdutos;
        }

        public List<ProdutoCosif> CarregarCodCosif()
        {
            List<ProdutoCosif> ListaCodCosif = new List<ProdutoCosif>();
            try
            {
                DataTable TabelaDataTable = new DataTable();
                cmd.Connection = conec.Conectar();
                cmd = new SqlCommand("PROC_CRUD", conec.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Acao", SqlDbType.VarChar).Value = "CarregarCodCosif";

                SqlDataReader ListaReader = cmd.ExecuteReader();
                TabelaDataTable.Load(ListaReader);

                foreach (DataRow obj in TabelaDataTable.Rows)
                {
                    string codClassificacao = obj[0].ToString();
                    string codCosif = obj[1].ToString();
                    string codProduto = obj[2].ToString();
                    ListaCodCosif.Add(new ProdutoCosif(codClassificacao, codCosif, codProduto));
                }
                conec.Desconectar(); ;
            }
            catch (SqlException e)
            {
                this.mensagem = "Erro com o Banco de Dados" + e.Message;
            }
            return ListaCodCosif;
        }
    }
}