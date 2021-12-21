using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace KitapSatisOtomasyonu
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=KitapSatis; user ID=postgres; password=14102000;");
        
        
        
        
        private void Form1_Load(object sender, EventArgs e)
        {
            //LİSTELE
            Listele();
        }

        private void Listele()
        {
            string sorgu = "select * from musteriler";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //EKLE
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("insert into musteriler (ad,soyad,il,ilce,bolge,adres,mail) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7)",baglanti);
            komut1.Parameters.AddWithValue("@p1", textBox1.Text);
            komut1.Parameters.AddWithValue("@p2", textBox2.Text);
            komut1.Parameters.AddWithValue("@p3", int.Parse(textBox3.Text));
            komut1.Parameters.AddWithValue("@p4", int.Parse(textBox4.Text));
            komut1.Parameters.AddWithValue("@p5", int.Parse(textBox5.Text));
            komut1.Parameters.AddWithValue("@p6", textBox6.Text);
            komut1.Parameters.AddWithValue("@p7", textBox7.Text);
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("EKleme Başarılı");
            //////////////////////
            Listele();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();



        }

        private void button3_Click(object sender, EventArgs e)
        {
            //SİL
            baglanti.Open();
            string sql = "DELETE FROM musteriler WHERE \"musteriId\"=@p8;";
            NpgsqlCommand komut2 = new NpgsqlCommand(sql, baglanti);
            komut2.Parameters.AddWithValue("@p8", int.Parse(silinecekTxt.Text));
            komut2.ExecuteNonQuery(); 
            baglanti.Close();
            MessageBox.Show("Silme İşlemi Başarılı");
            silinecekTxt.Clear();
            Listele();
           

        }

        private void button2_Click(object sender, EventArgs e)
        {
            //GÜNCELLE
            baglanti.Open();
            string sql = "UPDATE musteriler SET " +
                "ad=@p1,soyad=@p2,il=@p3,ilce=@p4,bolge=@p5,adres=@p6,mail=@p7 where \"musteriId\"=@p9;";
            NpgsqlCommand komut3 = new NpgsqlCommand(sql, baglanti);
            komut3.Parameters.AddWithValue("@p1", textBox1.Text);
            komut3.Parameters.AddWithValue("@p2", textBox2.Text);
            komut3.Parameters.AddWithValue("@p3", int.Parse(textBox3.Text));
            komut3.Parameters.AddWithValue("@p4", int.Parse(textBox4.Text));
            komut3.Parameters.AddWithValue("@p5", int.Parse(textBox5.Text));
            komut3.Parameters.AddWithValue("@p6", textBox6.Text);
            komut3.Parameters.AddWithValue("@p7", textBox7.Text);
            komut3.Parameters.AddWithValue("@p9", int.Parse(label8.Text));
            komut3.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("GÜNCELLEME İŞLEMİ BAŞARILI");
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            Listele();

        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            //DATAGRİDVİEW DAN SEÇTİĞİNİ TEXTBOXA YAZMA
            if(e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                textBox1.Text = row.Cells["ad"].Value.ToString();
                textBox2.Text = row.Cells["soyad"].Value.ToString();
                textBox3.Text = row.Cells["il"].Value.ToString();
                textBox4.Text = row.Cells["ilce"].Value.ToString();
                textBox5.Text = row.Cells["bolge"].Value.ToString();
                textBox6.Text = row.Cells["adres"].Value.ToString();
                textBox7.Text = row.Cells["mail"].Value.ToString();
                label8.Text = row.Cells["musteriId"].Value.ToString();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //ARAMA
            baglanti.Open();
            string sql = "Select * From musteriler WHERE ad like '%"+silinecekTxt.Text+"%'";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();


        }
    }
    }

