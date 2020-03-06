<?php 
    require_once '../load.php';

    $pdo = Database::getInstance()->getConnection();
    $mov_genres_query = 'SELECT * FROM tbl_genres';
    $movie_get = $pdo->prepare($mov_genres_query);
    $movie_get->execute();

    $mov_rating_query = 'SELECT * FROM tbl_arating';
    $rating_get = $pdo->prepare($mov_rating_query);
    $rating_get->execute();
    

    if(isset($_POST['submit'])){
        $cover = trim($_POST['cover']);
        $title = trim($_POST['title']);
        $genres = $_POST['genres'];
        $rating = trim($_POST['rating']);
        $director_first = trim($_POST['directorfirst']);
        $director_last = trim($_POST['directorlast']);
        $cast_first = $_POST['castfirst'];
        $cast_last = $_POST['castlast'];
        $cast_role = $_POST['castrole'];
        $year = trim($_POST['year']);
        $runtime = trim($_POST['runtime']);
        $synopsis = trim($_POST['synopsis']);
        $trailer = trim($_POST['trailer']);
        $release = trim($_POST['release']);

        if( empty($cover) || empty($title) || empty($genres) || empty($rating) || empty($director_first) || empty($director_last) || empty($cast_first) || empty($cast_last) || empty($cast_role) || empty($year) || empty($runtime) || empty($synopsis) || empty($trailer) || empty($release) ){
            $message = 'Please fill required fields!';
        }else{
            //All data pre processed, and good to go
            $message = createMovie($cover, $title, $genres, $rating, $director_first, $director_last, $cast_first, $cast_last, $cast_role, $year, $runtime, $synopsis, $trailer, $release);
        }
    }
?>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Movie</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
</head>
<body>
  <div class=container>
    <h2>Add Movie</h2>
    <?php echo !empty($message)? $message:''; ?>
    <form action="add_movie.php" method="post">
        <div class="form-group row">
          <label class="col-sm-2">Cover</label>
          <div class="col-sm-4">
            <input class="form-control" type="text" name="cover" placeholder="cover.jpg" value="">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Title</label>
          <div class="col-sm-4"> 
            <input class="form-control" type="text" name="title" value="">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Genre</label>
          <div class="col-sm-4">
            <select id="first_level" name="genres[]" multiple="multiple" class="form-control">
              <?php
                while($rows = $movie_get->fetch(PDO::FETCH_ASSOC)){
                  $genre_id = $rows['genre_id'];
                  $genre_name = $rows['genre_name'];
                  echo "<option value='$genre_id'>$genre_name</option>";
                }
              ?>
            </select>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Movie Rating</label>
          <div class="col-sm-4">
            <select name="rating" class="form-control">
              <?php
                while($rating_rows = $rating_get->fetch(PDO::FETCH_ASSOC)){
                  $rating_id = $rating_rows['arating_id'];
                  $rating_name = $rating_rows['arating_name'];
                  echo "<option value='$rating_id'>$rating_name</option>";
                }
              ?>
            </select>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Director</label>
          <div class="col-sm-4">
            <input class="form-control" type="text" name="directorfirst" placeholder="First" value="">
          </div>
          <div class="col-sm-4">
            <input class="form-control" type="text" name="directorlast" placeholder="Last" value="">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Cast</label>
          <table class="table" id="dynamic_field">  
              <tr>
                  <td><input type="text" name="castfirst[]" placeholder="Cast First Name" class="form-control"></td>  
                  <td><input type="text" name="castlast[]" placeholder="Cast Last Name" class="form-control"></td> 
                  <td><input type="text" name="castrole[]" placeholder="Cast Role" class="form-control"></td> 
                  <td><button type="button" name="add" id="add" class="btn btn-success btn-block">Add More</button></td>  
              </tr>
          </table>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Year</label>
          <div class="col-sm-4">
            <input class="form-control" type="text" name="year" value="">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Runtime</label>
          <div class="col-sm-4">
            <input class="form-control" type="text" name="runtime" value="">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Synopsis</label>
          <div class="col-sm-4">
            <textarea class="form-control" name="synopsis" rows="5"></textarea>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Trailer</label>
          <div class="col-sm-4">
            <input class="form-control" type="text" name="trailer" placeholder="cover.mp4" value="">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">Release</label>
          <div class="col-sm-4">
            <input class="form-control" type="text" name="release" value="">
          </div>
        </div>

        <button type="submit" class="btn btn-primary" name="submit">Create Movie</button>
    </form>
  </div>
</body>
<script>
  $(document).ready(function(){

    $('#first_level').multiselect({
      nonSelectedText:'Select Genres'
    });

  });
</script>
<script>  
  $(document).ready(function(){  
      var i=1;  
      $('#add').click(function(){  
          i++;  
          $('#dynamic_field').append('<tr id="row'+i+'"><td><input type="text" name="castfirst[]" placeholder="Cast First Name" class="form-control name_list" /></td><td><input type="text" name="castlast[]" placeholder="Cast Last Name" class="form-control name_list" /></td><td><input type="text" name="castrole[]" placeholder="Cast Role" class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove btn-block">Remove</button></td></tr>');  
      });
      $(document).on('click', '.btn_remove', function(){  
          var button_id = $(this).attr("id");   
          $('#row'+button_id+'').remove();  
      });
  });  
</script>
</html>