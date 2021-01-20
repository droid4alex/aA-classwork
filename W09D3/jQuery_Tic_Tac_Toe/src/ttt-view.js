class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    
  }

  makeMove($square) {}

  setupBoard() {
    const $ul = $('<ul></ul>');
    for (let i = 0; i < 3; i++){
      for (let j = 0; j < 3; j++) {
        const $li = $('<li class="col'+i+'"></li>');
        $ul.append($li);
      }
    }
    // <ul>
    // <li></li> x9
    // </ul>
    // $li.text('test');

    this.$el.append($ul);
  }
}

module.exports = View;
