using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Forms_Movimentos_Manuais.Model
{
    public class Produto
    {
        public string codProduto { get; set; }
        public string desProduto { get; set; }

        public Produto()
        {
        }

        public Produto(string codProduto, string desProduto)
        {
            this.codProduto = codProduto;
            this.desProduto = desProduto;
        }
    }
}