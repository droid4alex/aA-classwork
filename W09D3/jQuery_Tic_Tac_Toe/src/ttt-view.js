class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on('click', 'li', (e) => {
      const $square = $(e.target);
      this.makeMove($square);
    })
  }

  makeMove($square) {
    let str = $square.attr('id').slice(2);
    let arr = str.split("");
    let x = parseInt(arr[0]);
    let y = parseInt(arr[1]);
    let pos = [x, y];
  
    this.game.playMove(pos);
    // alert(this.game.currentPlayer);
    $square.addClass('selected');
 // $('.bucket-list').html('<p>wassuuuuuup</p>')
  // $('.bucket-list').text('hi')
    if (this.game.currentPlayer === 'o'){
      $square.addClass('o');
      $('.o').html('O')
    }
    else {
      $square.addClass('x');
      $('.x').html('X')
    }
    if (this.game.isOver()){
      alert('Its over');
    }
    
  }

  setupBoard() {
    const $ul = $('<ul></ul>');
    for (let i = 0; i < 3; i++){
      for (let j = 0; j < 3; j++) {
        let str = i.toString() + j.toString();
        // console.log(str);
        const $li = $('<li id="li' + str + '"></li>');
        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
