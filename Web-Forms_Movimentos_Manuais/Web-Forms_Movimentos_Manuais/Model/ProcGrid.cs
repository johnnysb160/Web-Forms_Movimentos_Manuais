using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Forms_Movimentos_Manuais.Model
{
    public class ProcGrid
    {
        public int datMes { get; set; }
        public int datAno { get; set; }
        public string codProduto { get; set; }
        public string desProduto { get; set; }
        public decimal numLancamento { get; set; }
        public string desDescricao { get; set; }
        public double valValor { get; set; }

        public ProcGrid()
        {
        }

        public ProcGrid(int datMes, int datAno, string codProdutp, string desProduto, decimal numLancamento, string desDescricao, double valValor)
        {
            this.datMes = datMes;
            this.datAno = datAno;
            this.codProduto = codProdutp;
            this.desProduto = desProduto;
            this.numLancamento = numLancamento;
            this.desDescricao = desDescricao;
            this.valValor = valValor;
        }
    }
}