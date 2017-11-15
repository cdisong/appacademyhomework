import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fSearchGiphys } from '../actions/giphy_actions';

const mapStateToProps = state => {
    return { giphys: state.giphys };
};

const mapDispatchToProps = dispatch => {
    return { fSearchGiphys: searchTerm => dispatch(fSearchGiphys(searchTerm)) };
};

export default connect(
    mapStateToProps, 
    mapDispatchToProps
)(GiphysSearch);