using Modelo;
using Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Controlador.Controllers
{
    public class UsuarioController : ApiController
    {
        // GET: api/Usuario
        [EnableCors(origins:"*",headers:"*", methods:"*")]
        public List<Usuario> Get()
        {
            UsuraioServicios usuarioServicio = null;
            List<Usuario> listaUsuarios;
            try
            {
                usuarioServicio = new UsuraioServicios();
                listaUsuarios =  usuarioServicio.ListaUsuarios();
            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            return listaUsuarios;
        }

        // GET: api/Usuario/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Usuario
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Usuario/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Usuario/5
        public void Delete(int id)
        {
        }
    }
}
