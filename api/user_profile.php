<?php 
    require_once 'load.php';

    $id = $_SESSION['user_id'];
    $user = getSingleUser($id);
    $details = $user->fetch(PDO::FETCH_ASSOC);

    $out['message'] = $details;

    echo json_encode($out);