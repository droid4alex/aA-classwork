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
    $square.attr('id', 'id1');
    let div = document.getElementById('id1');
    let pos = div.getBoundingClientRect();
    alert("Coordinates: " + pos.left + "px, " + pos.top + "px");
    this.game.playMove(pos);
    
    $square.addClass('selected');
  }

  setupBoard() {
    const $ul = $('<ul></ul>');
    for (let i = 0; i < 3; i++){
      for (let j = 0; j < 3; j++) {
        const $li = $('<li class="col'+i+'"></li>');
        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
