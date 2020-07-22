<template>
  <header class="bg-grey-lighter py-4">
    <div class="container m-auto flex flex-wrap items-center justify-end">
      <div class="flex-1 flex items-center">

        <a href="/" class="uppercase text-lg-center font-mono pl-4 font-semibold no-underline text-indigo-dark hover:text-indigo-darker">Coupon Rogue</a>
      </div>
      <div>
        <b-button variant="dark"><router-link to="/" class="link-grey px-2 no-underline" v-if="!signedIn()">Log in</router-link></b-button>
        <router-link to="/signup" class="link-grey px-2 no-underline" v-if="!signedIn()">
          <Test/>
        </router-link>
        <router-link to="/newgame" class="link-grey px-2 no-underline" v-if="signedIn()"><b-button variant="dark">New Game</b-button></router-link>
        <b-button variant="dark"><router-link to="/stats" class="link-grey px-2 no-underline" v-if="signedIn()">Your Stats</router-link></b-button>
        <b-button variant="dark"><a href="#" @click.prevent="signOut" class="link-grey px-2 no-underline" v-if="signedIn()">Log out</a></b-button>
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
