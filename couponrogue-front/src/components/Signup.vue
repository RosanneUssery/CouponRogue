<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Sign Up</h3>
      <form @submit.prevent="signup">
        <div class="text-red" v-if="error">{{ error }}</div>

        <div class="mb-6">
          <label for="userName" class="label">E-mail Address</label>
          <input type="email" v-model="userName" class="input" id="userName" placeholder="youremail@here">
        </div>

        <div class="mb-6">
          <label for="password" class="label">Password</label>
          <input type="password" v-model="password" class="input" id="password" placeholder="Password">
        </div>

        <div class="mb-6">
          <label for="password_confirmation" class="label">Password Confirmation</label>
          <input type="password" v-model="password_confirmation" class="input" id="password_confirmation" placeholder="Password Confirmation">
        </div>
        <button type="submit">Sign Up</button>

        <div class="my-4"><router-link to="/" class="link-grey">Sign In</router-link></div>
      </form>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'Signup',
    data () {
      return {
        userName: '',
        password: '',
        password_confirmation: '',
        error: '',
        componentKey: 0,
      }
    },
    created () {
      this.checkedSignedIn()
    },
    updated () {
      this.checkedSignedIn()
    },
    methods: {
      signup () {
        this.$http.plain.post('/signup', { userName: this.userName, password: this.password, password_confirmation: this.password_confirmation })
          .then(response => this.signupSuccessful(response))
          .catch(error => this.signupFailed(error))
      },
      signupSuccessful (response) {
        if (!response.data.csrf) {
          this.signupFailed(response)
          return
        }
        localStorage.csrf = response.data.csrf
        localStorage.signedIn = true
        this.$store.commit("logInUser")
        this.error = ''
        this.$router.replace('/newgame')
      },
      signupFailed (error) {
        this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
        delete localStorage.csrf
        delete localStorage.signedIn
      },
      checkedSignedIn () {
        if (localStorage.signedIn) {
          this.$router.replace('/newgame')
        }
      }
    }
  }
</script>
