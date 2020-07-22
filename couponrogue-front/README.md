# couponrogue-front

> A vue.js front-end app for a RoR backend app

#To-Do
* Implement `vuex` plugin to globally manage state for login/logout
    - This *should* solve the problem of the header not updating when the user logs out or logs in.
    - Alternately, find another way to solve this problem
* Create a NewGame vue file
* Create a Game vue file (for game in progress and to hold the logic for the game). This one may be _chonky_.
* Determine/research how we want to do random level generation logic for the game
* Set up game logic and monster logic
* Hook up Character from back end to NewGame page for character creation (code to spin up health/discount within parameters and input from user to name character, plus initialize to level 1 for player level and level 0 for game level)



## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report

# run unit tests
npm run unit

# run all tests
npm test
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).
