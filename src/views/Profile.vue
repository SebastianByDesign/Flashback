<template>
    <b-row class="splashback">
        <b-col cols="4" class="leftsplash">
            <b-row>
                <b-col class="align-self-end">
                    <h2>Update Profile</h2>
                    <br>
                    <b-form>
                      <b-form-group label="First Name" label-for="exampleInputFirst1">
                          <b-form-input type="text" v-model="logDetails.fname" id="exampleInputFirst1" v-bind:placeholder="user.fname">
                          </b-form-input>
                      </b-form-group>
                      <b-form-group label="Last Name" label-for="exampleInputLast1">
                          <b-form-input type="text" v-model="logDetails.lname" id="exampleInputLast1" v-bind:placeholder="user.lname">
                          </b-form-input>
                      </b-form-group>
                      <b-form-group label="Email" label-for="exampleInputEmail1">
                          <b-form-input type="email" v-model="logDetails.email" id="exampleInputEmail1" v-bind:placeholder="user.email">
                          </b-form-input>
                      </b-form-group>
                      <b-form-group label="Username" label-for="exampleInputUsername1">
                          <b-form-input type="text" v-model="logDetails.username" id="exampleInputUsername1" v-bind:placeholder="user.username">
                          </b-form-input>
                      </b-form-group>
                      <b-form-group label="Password" label-for="exampleInputPassword1">
                          <b-form-input type="password" v-model="logDetails.password" id="exampleInputPassword1" placeholder="Enter new password">
                          </b-form-input>
                      </b-form-group>
                      <b-button @click="updateProfile(); clearMessage();" variant="primary" class="submit">Submit</b-button>
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
    name: 'Profile',
    data: function() {
      return {
        user: {fname: '', lname: '', username: '', password: '', email: ''},
        successMessage: null,
        errorMessage: null,
        logDetails: {fname: '', lname: '', username: '', password: '', email: ''}
      }
    },
    async mounted() {
      axios.get('/api/user_profile.php').then(
        response => {
          this.user = response.data.message;
        },
        err => {
          console.log(err);
        }
      )
    },
    methods: {
      updateProfile(){
        var form_data = new FormData();
        for(var key in this.logDetails){
          form_data.append(key, this.logDetails[key]);
        }
        axios.post('api/user_update.php', form_data)
          .then((response) => {
            console.log(response);
            if(response.data.error){
              this.errorMessage = response.data.message;
            } else {
              this.successMessage = response.data.message.message;
              this.logDetails = {fname: '', lname: '', username: '', password: '', email: ''};
              this.$router.push('/')
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
