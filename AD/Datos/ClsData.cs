using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Web.Script.Serialization;

namespace AD.Datos
{
    public class ClsData
    {
        #region DECLARACIONES
        private string _Conexion = System.Configuration.ConfigurationManager.ConnectionStrings["cnxBAC"].ConnectionString;
        private string _ConexionMembers = System.Configuration.ConfigurationManager.ConnectionStrings["cnxBAC"].ConnectionString;
        private SqlConnection _Cnn;
        private SqlCommand _Cmd;
        private SqlDataAdapter _SqlDa;
        private SqlDataReader _SqlDr;
        private SqlTransaction _SqlTra;
        private DataTable _Dt;
        private DataSet _Ds;

        public SqlCommand CMD
        {
            get
            {
                return _Cmd;
            }
            set
            {
                _Cmd = value;
            }
        }

        public SqlConnection CNN
        {
            get
            {
                return _Cnn;
            }
            set
            {
                _Cnn = value;
            }
        }

        public string CONECTION
        {
            get
            {
                return _Conexion;
            }
            set
            {
                _Conexion = value;
            }
        }

        public string CONECTION_MEMBERS
        {
            get
            {
                return _ConexionMembers;
            }
            set
            {
                _ConexionMembers = value;
            }
        }


        public DataSet DS
        {
            get
            {
                return _Ds;
            }
            set
            {
                _Ds = value;
            }
        }

        public DataTable DT
        {
            get
            {
                return _Dt;
            }
            set
            {
                _Dt = value;
            }
        }

        public SqlDataAdapter SQLDA
        {
            get
            {
                return _SqlDa;
            }
            set
            {
                _SqlDa = value;
            }
        }

        public SqlDataReader SQLDR
        {
            get
            {
                return _SqlDr;
            }
            set
            {
                _SqlDr = value;
            }
        }
        public SqlTransaction SQLTRA
        {
            get
            {
                return _SqlTra;
            }
            set
            {
                _SqlTra = value;
            }
        }
        #endregion
        #region METODOS
        public void OPERATIONS(string pSql)
        {
            OPEN_CONNECTION(CONECTION);
            CMD = new SqlCommand();
            CMD.CommandType = CommandType.Text;
            CMD.CommandText = pSql;
            CMD.Connection = CNN;
            CMD.ExecuteNonQuery();
            CLOSE_CONNECTION();
        }
        public void OPERATIONS(string pSql, string pConnection)
        {
            OPEN_CONNECTION(pConnection);
            CMD = new SqlCommand();
            CMD.CommandType = CommandType.Text;
            CMD.CommandText = pSql;
            CMD.Connection = CNN;
            CMD.ExecuteNonQuery();
            CLOSE_CONNECTION();
        }
        public DataTable GET_DT(string pSQL, string pConnection)
        {
            SQLDA = new SqlDataAdapter(pSQL, pConnection);
            DT = new DataTable();
            SQLDA.Fill(DT);

            return DT;
        }
        public DataSet GET_DS(string pSQL, string pConnection)
        {
            SQLDA = new SqlDataAdapter(pSQL, pConnection);
            DS = new DataSet();
            SQLDA.Fill(DS);

            return DS;
        }
        public void OPEN_CONNECTION(string pConnection)
        {
            CNN = new SqlConnection(pConnection);
            if (CNN.State == ConnectionState.Closed)
                CNN.Open();
        }
        public void CLOSE_CONNECTION()
        {
            if (CNN.State == ConnectionState.Open)
                CNN.Close();
        }



        public String fGetJson(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new
            System.Web.Script.Serialization.JavaScriptSerializer();
            serializer.MaxJsonLength = 999999999;
            List<Dictionary<string, object>> rows =
              new List<Dictionary<string, object>>();
            Dictionary<string, object> row = null;

            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName.Trim(), dr[col].ToString().Replace("'", "\\"));
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }
        public String fGetJson(DataSet ds)
        {
            string[] dtNames = new string[ds.Tables.Count];
            string[] dtRows = new string[ds.Tables.Count];
            int i = 0;
            foreach (DataTable dt in ds.Tables)
            {
                dtNames[i] = dt.TableName;
                dtRows[i] = fGetJson(dt);
                i++;
            }

            string dsJson = "";
            i = 0;
            foreach (string name in dtNames) { if (i > 0) { dsJson += ","; } dsJson += "\"" + name + "\":" + dtRows[i] + ""; i++; }
            dsJson = "{" + dsJson + "}";

            return dsJson;
        }
        #endregion
    }
}




