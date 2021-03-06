﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Util
{
    public class TiposDatos
    {
        private TiposDePersona _TipoDePersona;
        public TiposDePersona TipoDePersona
        {
            get { return _TipoDePersona; }
            set { _TipoDePersona = value; }
        }

        public enum TiposDePersona
        {
            Docente,
            Alumno,
            Administrador
        }

        private States _State;
        public States State
        {
            get { return _State; }
            set { _State = value; }
        }

        public enum States
        {
            Deleted,
            New,
            Modified,
            Unmodified
        }

        private TiposCargos _Cargo;

        public TiposCargos Cargo
        {
            get { return _Cargo; }
            set { _Cargo = value; }
        }

        public enum TiposCargos
        {
            ProfesorTeoria,
            ProfesorPractica,
            AyudanteCatedra
        }

        private FormModes _FormMode;

        public FormModes FormMode
        {
            get { return _FormMode; }
            set { _FormMode = value; }
        }

        public enum FormModes
        {
            Alta,
            Baja,
            Modificacion,
            Consulta
        }

        private EstadosAlumnos _EstadoAlumno;
        public EstadosAlumnos EstadoAlumno { get; set; }
        public enum EstadosAlumnos
        {
            regular,
            inscripto,
            no_inscripto,
            libre,
            aprobada

        }
    }
}
