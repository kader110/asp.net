//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Faturalar
    {
        public int FaturaId { get; set; }
        public string UrunAd { get; set; }
        public Nullable<int> Miktar { get; set; }
        public Nullable<decimal> UrunBirimFiyat { get; set; }
        public Nullable<int> KullaniciID { get; set; }
        public Nullable<int> IsOrtaklariID { get; set; }
        public Nullable<decimal> ToplamFiyatKDV { get; set; }
    
        public virtual IsOrtaklari IsOrtaklari { get; set; }
        public virtual Kullanici Kullanici { get; set; }
    }
}
