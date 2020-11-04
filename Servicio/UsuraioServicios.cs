using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;

namespace Servicio
{
    public class UsuraioServicios
    {
        public List<Usuario> ListaUsuarios()
        {
            List<Usuario> listaUsuarios = null;
            Usuario usuario = null;
            AccesoDatos conexion = null;
            string consulta;
            try
            {
                consulta = "SELECT [id], [nombre], [apellido], [correo], [usr], [pwd], [idPerfil], [avatar], [sexo], [fechaNacimiento], [estado] FROM [dbo].[usuarios]";
                listaUsuarios = new List<Usuario>();
                conexion = new AccesoDatos();
                conexion.Conectar();
                conexion.EjecutarConsulta(consulta);
                while (conexion.lector.Read())
                {
                    usuario = new Usuario();
                    usuario.Id = (long)conexion.lector["id"];
                    usuario.Nombre = (string)conexion.lector["nombre"];
                    usuario.Apellido = (string)conexion.lector["apellido"];
                    usuario.Correo = (string)conexion.lector["correo"];
                    usuario.Usr = (string)conexion.lector["usr"];
                    usuario.Pwd = (string)conexion.lector["pwd"];
                    usuario.IdPerfil = (long)conexion.lector["idPerfil"];
                    usuario.Avatar = (string)conexion.lector["avatar"];
                    usuario.Sexo = (bool)conexion.lector["sexo"];
                    usuario.FechaNacimiento = (DateTime)conexion.lector["fechaNacimiento"];
                    usuario.Estado = (bool)conexion.lector["estado"];
                    listaUsuarios.Add(usuario);
                }

            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            finally
            {
                if (conexion != null)
                {
                    conexion.Desconectar();
                    conexion = null;
                }
                if (usuario != null)
                {
                    usuario = null;
                }
            }  

            return listaUsuarios;
        }
    }
}
