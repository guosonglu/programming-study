//{% raw %}
import React from 'react';
import {Card} from "antd";
import FCom from "./FCom";

function ManageAListOfRefs(props) {
    return (
        <div>
            <Card title={"函数式组件"}>
                <FCom/>
            </Card>
        </div>
    );
}

export default ManageAListOfRefs;
//{% endraw %}
