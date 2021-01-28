import React from 'react';
import ReactDOM from 'react-dom';

import Game from './game';
import * as Minesweeper from '../minesweeper';

document.addEventListener('DOMContentLoaded', () => {
    const reactRoot = document.getElementById('react-root');
    ReactDOM.render(<Game/>, reactRoot);
});
console.log('webpack is running');