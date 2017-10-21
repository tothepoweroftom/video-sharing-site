/* eslint-disable no-undef */
import React from "react";
import PropTypes from "prop-types";

import Navbar from "./Navbar.jsx";
import TrendingVideo from "./TrendingVideo.jsx";

class Trending extends React.Component {
    constructor(props) {
        super(props);
        this.state = {videos: null};
    }

    componentDidMount() {
        $.getJSON("http://localhost:8000/api/trending", (data) => {
            if (data.success)
                this.setState({videos: data.videos});
        });
    }

    render() {
        let content;
        if (!this.state.videos)
            content = <h5>Loading...</h5>;
        else {
            content = this.state.videos.map((element, index) => {
                <TrendingVideo key={index}
                    thumbnail={element.thumbnail}
                    title={element.title}
                    user={element.username}
                    views={element.views} // TODO: Convert this to string
                    age={element.age} // This is also present in the SELECT query
                    desc={element.description} />;
            });
        }
        // TODO: This should also render a Link component to link to the
        // actual video.
        return (
            <div>
                <Navbar dp={this.props.user ? this.props.user.dp : "http://localhost:8000/account_circle.png"} />
                <div className="row" style={{position: "absolute", top: "100px", width: "25%"}}>
                    {content}
                </div>
            </div>
        );
    }
}

Trending.propTypes = {
    user: PropTypes.object
};

export default Trending;