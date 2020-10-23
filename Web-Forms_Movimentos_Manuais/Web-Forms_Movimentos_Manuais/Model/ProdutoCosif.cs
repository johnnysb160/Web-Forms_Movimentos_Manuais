using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Forms_Movimentos_Manuais.Model
{
    public class ProdutoCosif
    {
        public string codClassificacao { get; set; }
        public string codCosif { get; set; }
        public string codProduto { get; set; }

        public ProdutoCosif()
        {
        }

        public ProdutoCosif(string codClassificacao, string codCosif, string codProduto)
        {
            this.codClassificacao = codClassificacao;
            this.codCosif = codCosif;
            this.codProduto = codProduto;
        }
    }
}