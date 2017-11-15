import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util';
import { receiveSearchGiphys, fSearchGiphys } from './actions/giphy_actions';

export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);

    window.store = store;
    window.fSearchGiphys = fSearchGiphys;
    window.receiveSearchGiphys = receiveSearchGiphys;
    window.fetchSearchGiphys = fetchSearchGiphys;
});
