<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class M_inicio_sesion extends CI_Model {
	function __construct(){
        parent::__construct();
    }

    public function verifica_login($usuario, $contrasena){
        $this->db->where('NombreUsuario', $usuario);
        $this->db->where('Contrasena', $contrasena);
        $query = $this->db->get('Usuario');

        if ($query->num_rows() > 0) {
            echo "true"; // Usuario y contraseña coinciden
        } else {
            echo 'false'; // Usuario y/o contraseña incorrectos
        }
    }
}