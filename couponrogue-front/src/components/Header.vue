<template>
  <header class="bg-grey-lighter py-4">
    <div class="container m-auto flex flex-wrap justify-end">
      <div class="flex-1 flex items-center">

        <h1><a href="/">Coupon Rogue</a></h1>
        <h2>$ave the Day!</h2>

      </div>
      <div>
        <router-link to="/" v-if="!signedIn()"><button>Log in</button></router-link>
        <router-link to="/signup" class="link-grey px-2 no-underline" v-if="!signedIn()"><button>Sign Up</button></router-link>
        <router-link to="/newgame" class="link-grey px-2 no-underline" v-if="signedIn()"><b-button variant="dark">New Game</b-button></router-link>
        <router-link to="/stats" class="link-grey px-2 no-underline" v-if="signedIn()"><button>Your Stats</button></router-link>
        <a href="#" @click.prevent="signOut" v-if="signedIn()"><button>Log out</button></a>
      </div>
    </div>
  </header>
</template>

<script>
  export default {
    name: 'Header',
    created () {
      this.signedIn()
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
