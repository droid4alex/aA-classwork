class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    const $ul = $('<ul></ul>');
    const $li = $('<li>test</li>');
    $li.text('test');
    $ul.append($li);
    this.$el.append($ul);
  }
}

module.exports = View;
