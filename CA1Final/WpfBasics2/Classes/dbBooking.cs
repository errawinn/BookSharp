using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace BookSharp.Classes
{
    //MAKES GETTING, INSERTING INTO, UPDATING, and DELETING from database more efficient:

    class dbBooking
    {


        //connection string for connecting to sql database 
        public string connectionString = "Data Source = " + Environment.MachineName + "\\SQLEXPRESS;database=APPD_CA2;" +
            "integrated security=true";



        // GETS DATATABLE filled with data from database --> based on command text string inputted e.g. select * from tblTour
        public DataTable getDataTable(string commandText)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        conn.ConnectionString = connectionString;
                        comm.Connection = conn;
                        comm.CommandText = commandText;
                        da.SelectCommand = comm;

                        DataTable table = new DataTable();
                        try
                        {
                            conn.Open();
                            da.Fill(table);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("dbTable:" + ex.Message);
                        }
                        finally
                        {
                            conn.Close();
                        }

                        return table;
                    }
                }
            }
        }



        //INSERTS a row to specified database table --> using variables stored in a List 
        public void addRow(List<Object> addArray, string tblName)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.ConnectionString = connectionString;
                    conn.Open();
                    cmd.Connection = conn;
                    string values = "";
                    try
                    {
                        int count = 0;
                        foreach (var element in addArray)
                        {
                            //auto generate string using count for command text
                            values += "@a" + count + ",";
                            cmd.Parameters.AddWithValue("@a" + count, element);
                            count++;
                        }

                        values = values.Remove(values.Length - 1);

                        cmd.CommandText = "INSERT INTO " + tblName + " VALUES( " + values + ")"; //@InA is a variable name - must have @

                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("dbAdd: " + ex.Message);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
        }



        //UPDATES a row of specified database table --> using variables stored in a List and properties of a Class object
        public void updateRow(List<Object> List, string tblName, string condition, Object objClass)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.ConnectionString = connectionString;

                    try
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        Type infoType = objClass.GetType();
                        PropertyInfo[] properties = infoType.GetProperties();


                        string random = "@a", command = "";
                        int count = 0;
                        foreach (PropertyInfo property in properties)
                        {
                            //auto generate string using count for command text
                            random += count;

                            command += property.Name + "= " + random + ","; // e.g. email= @a2, username= @a2,

                            cmd.Parameters.AddWithValue(random, List[count]);

                            count++;
                        }

                        command = command.Remove(command.Length - 1); //remove last comma

                        cmd.CommandText = "UPDATE " + tblName + " SET " + command + condition; // e.g. UPDATE tblCart SET email= @email, username= @username WHERE ...

                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("dbUpdate: " + ex.Message);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }

            }
        }



        //DELETES a row from a database table using a condition string
        public void deleteRow(string tblName,  List<Object> valuesArray, List<string> columnNameArray) //condition e.g. WHERE username = @username AND username = @username
        {
            using (SqlConnection conn = new SqlConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.ConnectionString = connectionString;
                    try
                    {
                        conn.Open();
                        cmd.Connection = conn;

       
                        string command = "";
                        int count = 0;
                        if (valuesArray.Count != 0) {

                            foreach (string columnName in columnNameArray)
                            {
                                string parameter = "@" + columnName;

                                if (count < 1) //if only one WHERE condition
                                {
                                    command += " WHERE " + columnName + " = " + parameter;
                                }
                                else //if more than one
                                {
                                    command += " AND " + columnName + " = " + parameter;
                                }
                              
                                cmd.Parameters.AddWithValue(parameter, valuesArray[count]);
                                count++;
                            }

                        }

                        cmd.CommandText = "DELETE FROM " + tblName + command; //final command text

                        cmd.ExecuteNonQuery(); //execute to database

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("dbDelete: " + ex.Message);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
        }

    }
}



