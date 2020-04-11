<template>
    <b-row class="splashback">
        <b-col cols="4" class="leftsplash">
            <b-row>
                <b-col class="align-self-end">
                    <img src="images/logo.png">
                    <h2>Where Movies Meet Music</h2>

                    <b-form-group label="Email address" label-for="exampleInputEmail1">
                        <b-form-input type="email" id="exampleInputEmail1" required placeholder="Enter email">
                        </b-form-input>
                    </b-form-group>

                    <b-form-group label="Password" label-for="exampleInputPassword1">
                        <b-form-input type="password" id="exampleInputPassword1" required placeholder="Enter password">
                        </b-form-input>
                    </b-form-group>
                    <br>
                    <b-button type="submit" variant="primary" class="submit">Submit</b-button>
                    <br>
                    <br>
                    <b-button type="button" variant="primary" class="signup">Sign Up</b-button>
                </b-col>
            
            </b-row>
        </b-col>
        <div class="col-sm-8 rightsplash">
            
        </div>
    </b-row>
</template>

<style scoped lang="scss">
  .row {
    margin-left: 0;
    margin-right: 0;
  }

  .splashback{
    height: 100vh;
    text-align: center;

    .leftsplash{
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: rgba(0,0,0,0.7);
      color: white;

      img {
        margin-bottom: 15px;
      }
    }

    .rightsplash{
      background-image: url(/images/Bg.jpg);
      background-position: center;
      background-size: cover;
    }
  }


</style>
