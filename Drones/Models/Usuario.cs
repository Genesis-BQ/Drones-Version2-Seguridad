﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Drones.Models
{
    public class Usuario
    {
        public int Identificacion { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El apellido es obligatorio")]
        public string Apellido { get; set; }

        [Required(ErrorMessage = "La residencia es obligatoria")]
        public string Residencia { get; set; }

        [Required(ErrorMessage = "El teléfono es obligatorio")]
        public int Telefono { get; set; }

        [Required(ErrorMessage = "El correo electrónico es obligatorio")]
        [EmailAddress(ErrorMessage = "El correo electrónico no tiene un formato válido")]
        public string Correo { get; set; }

        [Required(ErrorMessage = "La contraseña es obligatoria")]
        public string Contraseña { get; set; }

        // Propiedades para las preguntas y respuestas
        [Required(ErrorMessage = "La pregunta 1 es obligatoria")]
        public string Pregunta1 { get; set; }

        [Required(ErrorMessage = "La respuesta 1 es obligatoria")]
        public string Respuesta1 { get; set; }

        [Required(ErrorMessage = "La pregunta 2 es obligatoria")]
        public string Pregunta2 { get; set; }

        [Required(ErrorMessage = "La respuesta 2 es obligatoria")]
        public string Respuesta2 { get; set; }

        [Required(ErrorMessage = "La pregunta 3 es obligatoria")]
        public string Pregunta3 { get; set; }

        [Required(ErrorMessage = "La respuesta 3 es obligatoria")]
        public string Respuesta3 { get; set; }
    }

}