const View = require('./ttt-view.js')// require appropriate file
const Game = require('../../Tic_Tac_Toe_Node_solution/game.js')// require appropriate file

  $(() => {
    // Your code here
    const game = new Game();
    let $el = $('.ttt')
    const view = new View(game, $el);
  });

// You shouldn't have to change anything in the Tic Tac Node solution but read and refer to it!

// Complete the require statements in src / index.js to require ttt - view and the game as dependencies. When webpack processes index.js(the entry file), it will include all required files within main.js(the output file).

// Webpack will output the bundled file as dist / main.js, for which we have included a script tag in index.html.

// Open a new terminal tab or window and run webpack--watch--mode = development.The--watch flag directs webpack to re - bundle your app whenever you save a bundled file.