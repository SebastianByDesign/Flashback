<?php 
    require_once 'load.php';

    if(isset($_SESSION['user_id'])){
        $id = $_SESSION['user_id'];
        $fname = trim($_POST['fname']);
        $lname = trim($_POST['lname']);
        $username = trim($_POST['username']);
        $password = trim($_POST['password']);
        $email = trim($_POST['email']);

        if(empty($email) || empty($password) || empty($username) || empty($lname) || empty($fname)){
            $out['message'] = 'Please fill the required fields';
            $out['error'] = true;
        }else{
            $out['message'] = editUser($id, $fname, $lname, $username, $password, $email);
        }    
    }

    echo json_encode($out);