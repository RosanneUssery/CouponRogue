<template>
  <header class="bg-grey-lighter py-4">
    <div class="container m-auto flex flex-wrap justify-end">
      <div class="flex-1 flex items-center">

        <h1><a href="/">Coupon Rogue</a></h1>
        <h2>$ave the Day!</h2>

      </div>
      <div>
        <router-link to="/" v-if="!checkSignIn" ><button>Log in</button></router-link>
        <router-link to="/signup" v-if="!checkSignIn"><button>Sign Up</button></router-link>
        <router-link to="/newgame" v-if="checkSignIn" ><button>New Game</button></router-link>
        <router-link to="/stats"  v-if="checkSignIn" ><button>Your Stats</button></router-link>
        <a href="#" @click.prevent="signOut" v-if="checkSignIn"><button>Log out</button></a>
      </div>
    </div>
  </header>
</template>

<script>
  export default {
    name: 'Header',
    // created: function () {
    //   console.log(this.$store.state.loggedIn)
    //   this.checkSignIn()
    // },
    computed: {
      checkSignIn () {
        return this.$store.state.loggedIn
      }
    },
    methods: {
      setError (error, text) {
        this.error = (error.response && error.response.data && error.response.data.error) || text
      },
      signedIn () {
        return localStorage.signedIn
      },
      signOut () {
        this.$http.secured.delete('/login')
          .then(response => {
            this.$store.commit("logOutUser")
            delete localStorage.csrf
            delete localStorage.signedIn
            this.$router.replace('/')
          })
          .catch(error => this.setError(error, 'Cannot sign out'))
      }
    }
  }
</script>

<style module>
.navButton {
  border: none;
  border-radius: 2px;
}

</style>
