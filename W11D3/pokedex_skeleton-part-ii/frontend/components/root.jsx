import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter } from 'react-router-dom/cjs/react-router-dom.min';
import App from './app';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <App />
    </HashRouter>      
  </Provider>
);

export default Root;