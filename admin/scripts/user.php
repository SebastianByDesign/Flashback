<?php 
function createUser($fname, $username, $password, $email){
    $pdo = Database::getInstance()->getConnection();

    $create_user_query = 'INSERT INTO tbl_user(user_fname, user_name, user_pass, user_email)';
    $create_user_query .= ' VALUES(:fname, :username, :password, :email)';
    $create_user_set = $pdo->prepare($create_user_query);
    $create_user_result = $create_user_set->execute(
        array(
            ':fname'=>$fname,
            ':username'=>$username,
            ':password'=>$password,
            ':email'=>$email
        )
    );

    if($create_user_result){
        redirect_to('index.php');
    }else{
        return 'This individual sucks!';
    }
}

function getSingleUser($id){
    $pdo = Database::getInstance()->getConnection();

    $fetch_user_query = 'SELECT * FROM tbl_user WHERE user_id =:id';
    $fetch_user_set = $pdo->prepare($fetch_user_query);
    $fetch_user_set->execute(
        array(
            ':id'=>$id
        )
    );

    if($fetch_user_set){
        return $fetch_user_set;
    } else {
        return false;
    }
}

function editUser($fname, $username, $password, $email){
    $pdo = Database::getInstance()->getConnection();

    $edit_user_query = 'UPDATE tbl_user SET user_fname = :fname, user_lname = :lname, user_uname = :username, user_pass = :password, user_email = :email';
    $edit_user_set = $pdo->prepare($create_user_query);
    $edit_user_set->execute(
        array(
            ':fname'=>$fname,
            ':lname'=>$lname,
            ':username'=>$username,
            ':password'=>$password,
            ':email'=>$email
        )
    );

    if($create_user_result){
        redirect_to('index.php');
    }else{
        return 'There was an error in updating your information';
    }
}