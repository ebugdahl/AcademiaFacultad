﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Entities;
using MySql.Data.MySqlClient;
using Util;
using Util.CustomException;

namespace Data.Database
{
    public class EspecialidadAdapter : Adapter
    {
        public List<Especialidad> GetAll()
        {
            List<Especialidad> listaEspecialidades = new List<Especialidad>();

            try
            {
                this.OpenConnection();
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM especialidades", MySqlConn);
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Especialidad e = new Especialidad();
                    e.Id = (int)reader["id_especialidad"];
                    e.Descripcion = (string)reader["desc_especialidad"];
                    listaEspecialidades.Add(e);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                throw new NotFoundException("especialidad", ex);
            }
            finally
            {
                this.CloseConnection();
            }

            return listaEspecialidades;
        }

        public Especialidad GetOne(int id)
        {
            Especialidad e;
            try
            {
                this.OpenConnection();
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM especialidades WHERE id_especialidad = @id", MySqlConn);
                cmd.Parameters.AddWithValue("@id", id);
                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    e = new Especialidad();
                    e.Id = id;
                    e.Descripcion = (string)reader["desc_especialidad"];
                    reader.Close();
                    return e;
                }
            }
            catch (Exception ex)
            {
                throw new NotFoundException("especialidad", ex);
            }
            finally
            {
                this.CloseConnection();
            }
            return null;
        }

        public void Save(Especialidad e)
        {

            if (e.State == TiposDatos.States.New)
            {
                this.Insert(e);
            }
            else if (e.State == TiposDatos.States.Modified)
            {
                this.Update(e);
            }
            else if (e.State == TiposDatos.States.Deleted)
            {
                this.Delete(e.Id);
            }
            else
            {
                e.State = TiposDatos.States.Unmodified;
            }

        }

        public void Insert(Especialidad e)
        {
            try
            {
                this.OpenConnection();
                MySqlCommand cmd = new MySqlCommand("INSERT INTO especialidades (desc_especialidad) VALUES (@descripcion); SELECT @@IDENTITY;", MySqlConn);
                cmd.Parameters.AddWithValue("@descripcion", e.Descripcion);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new InsertException("especialidad", ex);
            }
            finally
            {
                this.CloseConnection();
            }
        }

        public void Update(Especialidad e)
        {
            try
            {
                this.OpenConnection();
                MySqlCommand cmd = new MySqlCommand("UPDATE especialidades SET desc_especialidad = @descripcion WHERE id_especialidad = @idEspecialidad", MySqlConn);
                cmd.Parameters.AddWithValue("@descripcion", e.Descripcion);
                cmd.Parameters.AddWithValue("@idESpecialidad", e.Id);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new UpdateException("especialidad", ex);
            }
            finally
            {
                this.CloseConnection();
            }
        }

        public void Delete(int id)
        {
            try
            {
                this.OpenConnection();

                MySqlCommand cmd = new MySqlCommand("DELETE FROM especialidades WHERE id_especialidad = @id", MySqlConn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new DeleteException("especialidad", ex);
            }
            finally
            {
                this.CloseConnection();
            }
        }
    }
}
