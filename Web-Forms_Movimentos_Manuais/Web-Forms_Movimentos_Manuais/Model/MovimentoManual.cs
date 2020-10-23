using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Forms_Movimentos_Manuais.Model
{
    public class MovimentoManual
    {
        public int datMes { get; set; }
        public int datAno { get; set; }
        public decimal numLancameto { get; set; }
        public string codProduto { get; set; }
        public string codCosif { get; set; }
        public string desDescricao { get; set; }
        public DateTime datMovimento { get; set; }
        public string codUsuario { get; set; }
        public decimal valValor { get; set; }

        public MovimentoManual()
        {
        }

        public MovimentoManual(int datMes, int datAno, decimal numLancameto, string codProduto, string codCosif, string desDescricao, DateTime datMovimento, string codUsuario, string valValor)
        {
            this.datMes = datMes;
            this.datAno = datAno;
            this.numLancameto = numLancameto;
            this.codProduto = codProduto;
            this.codCosif = codCosif;
            this.desDescricao = desDescricao;
            this.datMovimento = datMovimento;
            this.codUsuario = codUsuario;
            this.valValor = decimal.Parse(valValor.Replace("R$", ""));
        }
    }
}