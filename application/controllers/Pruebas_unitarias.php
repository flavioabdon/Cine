// Módulo : Login 			Fecha: 6-6-2023
// Base de datos: Cine			Tabla: Usuario
// Descripción: Clase Controlador LoginTest que contiene cuatro métodos
// con diferentes tipos usuarios y contraseñas. 
<?php
class Pruebas_unitarias extends CI_Controller {
    public function test_login_exitoso() {
        $this->load->model('Usuario_model');
        $usuario = 'admin';
        $contrasena = 'e10adc3949ba59abbe56e057f20f883e';

        $result = $this->Usuario_model->verificar_usuario($usuario, $contrasena);

        $this->assertTrue($result);
    }

    public function test_login_usuario_invalido() {
        $this->load->model('Usuario_model');
        $usuario = 'usuario_no_existente';
        $contrasena = 'contrasena1';

        $result = $this->Usuario_model->verificar_usuario($usuario, $contrasena);

        $this->assertFalse($result);
    }

    public function test_login_contrasena_invalida() {
        $this->load->model('Usuario_model');
        $usuario = 'usuario1';
        $contrasena = 'contrasena_incorrecta';

        $result = $this->Usuario_model->verificar_usuario($usuario, $contrasena);

        $this->assertFalse($result);
    }

    public function test_login_campos_vacios() {
        $this->load->model('Usuario_model');
        $usuario = '';
        $contrasena = '';

        $result = $this->Usuario_model->verificar_usuario($usuario, $contrasena);

        $this->assertFalse($result);
    }
}
