﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Entities;
using Data.Database;
using Util.CustomException;

namespace Business.Logic
{
    public class CursoLogic:BusinessLogic
    {

        private CursoAdapter CursoData;

        public CursoLogic()
        {
            CursoData = new CursoAdapter();
        }

        public Curso GetOne(int ID)
        {
            try
            {
                Curso curso = CursoData.GetOne(ID);
                curso.CupoDisponible = curso.Cupo - curso.CupoDisponible; //La cantidad de inscripciones la recupere previamente en CupoDisponible.
                return curso;
            }
            catch ( NotFoundException ex )
            {
                throw ex;
            }
            catch ( Exception ex )
            {
                throw new CustomException(ex);
            }

        }

        public void Save(Curso c)
        {
            CursoData.Save(c);
        }
        public void Delete(int ID) 
        {
            try
            {
                CursoData.Delete(ID);
            }
            catch (DeleteException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw new CustomException(ex);
            }
        }

        public List<Curso> GetAll()
        {
            List<Curso> lista = CursoData.GetAll();
            return lista;
        }

        public List<Curso> GetCursosPorMateria(int idMateria)
        {
            List<Curso> listaConMateria = new List<Curso>();
            try
            {
                List<Curso> listaCompleta = CursoData.GetAll();
               

                foreach (Curso c in listaCompleta)
                {
                    if (c.IdMateria == idMateria)
                    {
                        listaConMateria.Add(c);
                    }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }

            return listaConMateria;

            
        }

    }
}
