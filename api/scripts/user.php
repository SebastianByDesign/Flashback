<?php 
function createUser($fname, $lname, $username, $password, $email){
    $pdo = Database::getInstance()->getConnection();
    
    $create_user_query = 'INSERT INTO tbl_user(fname, lname, username, pass, email, ip)';
    $create_user_query .= ' VALUES(:fname, :lname, :username, :password, :email, "no" )';
    $create_user_set = $pdo->prepare($create_user_query);
    $create_user_result = $create_user_set->execute(
        array(
            ':fname'=>$fname,
            ':lname'=>$lname,
            ':username'=>$username,
            ':password'=>$password,
            ':email'=>$email,
        )
    );

    if($create_user_result){
        $out['message'] = 'User created';
    }else{
        $out['message'] = 'An error occured, please contact the admin';
        $out['error'] = true;
    }

    return $out;
}

function getSingleUser($id){
    $pdo = Database::getInstance()->getConnection();

    $get_user_query = 'SELECT * FROM tbl_user WHERE ID = '.$id;
    $result = $pdo->query($get_user_query);

    if($result){
        return $result;
    }else{
        $out['message'] = 'There was a problem accessing the user';
        $out['error'] = true;
        return $out;
    }
}

function editUser($id, $fname, $lname, $username, $password, $email){
  $pdo = Database::getInstance()->getConnection();

  $update_user_query = 'UPDATE tbl_user SET fname = :fname, lname = :lname, username = :username,';
  $update_user_query .= ' pass = :password, email = :email WHERE ID = :id';
  $update_user_set = $pdo->prepare($update_user_query);
  $update_user_result = $update_user_set->execute(
      array(
          ':id'=>$id,
          ':fname'=>$fname,
          ':lname'=>$lname,
          ':username'=>$username,
          ':password'=>$password,
          ':email'=>$email,
      )
  );

  if($update_user_result){
      $out['message'] = 'Profile updated';
  }else{
      $out['message'] = 'There was a problem in updating the information';
      $out['error'] = true;
  }

  return $out;
}