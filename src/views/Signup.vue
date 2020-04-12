<template>
    <b-row class="splashback">
        <b-col cols="4" class="leftsplash">
            <b-row>
                <b-col class="align-self-end">
                    <h2>Sign Up</h2>
                    <br>
                    <b-form>
                      <b-form-group label="First Name" label-for="exampleInputFirst1">
                          <b-form-input type="text" v-model="logDetails.fname" id="exampleInputFirst1" required placeholder="Enter first name">
                          </b-form-input>
                      </b-form-group>
                      <b-form-group label="Last Name" label-for="exampleInputLast1">
                          <b-form-input type="text" v-model="logDetails.lname" id="exampleInputLast1" required placeholder="Enter last name">
                          </b-form-input>
                      </b-form-group>
                      <b-form-group label="Email" label-for="exampleInputEmail1">
                          <b-form-input type="email" v-model="logDetails.email" id="exampleInputEmail1" required placeholder="Enter email">
                          </b-form-input>
                      </b-form-group>
                      <b-form-group label="Username" label-for="exampleInputUsername1">
                          <b-form-input type="text" v-model="logDetails.username" id="exampleInputUsername1" required placeholder="Enter username">
                          </b-form-input>
                      </b-form-group>
                      <b-form-group label="Password" label-for="exampleInputPassword1">
                          <b-form-input type="password" v-model="logDetails.password" id="exampleInputPassword1" required placeholder="Enter password">
                          </b-form-input>
                      </b-form-group>
                      <b-button @click="signUp();" variant="primary" class="submit">Submit</b-button>
                    </b-form>
                    <br>
                    <div class="alert alert-danger text-center" v-if="errorMessage">
                      <button type="button" class="close" @click="clearMessage();"><span aria-hidden="true">&times;</span></button>
                      <span class="glyphicon glyphicon-alert"></span> {{ errorMessage }}
                    </div>

                    <div class="alert alert-success text-center" v-if="successMessage">
                      <button type="button" class="close" @click="clearMessage();"><span aria-hidden="true">&times;</span></button>
                      <span class="glyphicon glyphicon-check"></span> {{ successMessage }}
                    </div>
                </b-col>
            </b-row>
        </b-col>
        <div class="col-sm-8 rightsplash"></div>
    </b-row>
</template>

<script>
  import Vue from 'vue'
  import axios from 'axios'
  import VueAxios from 'vue-axios'

  Vue.use(VueAxios, axios)

  export default {
    name: 'Signup',
    data: function() {
      return {
        successMessage: null,
        errorMessage: null,
        logDetails: {fname: '', lname: '', username: '', password: '', email: ''}
      }
    },
    methods: {
      signUp(){
        var form_data = new FormData();
        for(var key in this.logDetails){
          form_data.append(key, this.logDetails[key]);
        }
        axios.post('api/user_signup.php', form_data)
          .then((response) => {
            console.log(response);
            if(response.data.message.error){
              console.log(response.data.message.message);
              this.errorMessage = response.data.message.message;
            } else {
              this.successMessage = response.data.message.message;
              this.logDetails = {fname: '', lname: '', username: '', password: '', email: ''};
              //localStorage.isAuthenticated = true;
              //this.$router.push('/Login')
            }
          })
          .catch((error) => {
            console.log(error);
          });
      },

      clearMessage(){
        this.errorMessage = '';
        this.successMessage = '';
      },
    }
  }
</script>

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

      a {
        text-decoration: none;

        &:hover {
          color: white;
        }
      }
    }

    .rightsplash{
      background-image: url(/images/Bg.jpg);
      background-position: center;
      background-size: cover;
    }
  }
</style>
