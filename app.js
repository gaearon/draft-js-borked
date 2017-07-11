import {Editor, EditorState} from 'draft-js';

class Test extends React.Component {
    constructor(props) {
        super(props);

        this.state = {editorState: EditorState.createEmpty()};
        this.onChange = (editorState) => this.setState({editorState});
    }

    render() {
        return (
            <div>
                <Editor editorState={this.state.editorState} onChange={this.onChange} />
            </div>
        )
    }
};

ReactDOM.render(
    <Test/>,
    document.getElementById("app")
);
