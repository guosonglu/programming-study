import React from 'react'
import ReactDOM from 'react-dom/client'
import {
    createBrowserRouter,
    RouterProvider,
} from "react-router-dom";
import './index.css'
import Root, {
    loader as rootLoader,
    action as rootAction
} from "./routes/root.jsx";
import ErrorPage from "./error-page.jsx";
import Contact, {
    loader as contactLoader,
    action as contactAction,
} from "./routes/contact.jsx";
import EditContact,{action as editAction,} from "./routes/edit.jsx";
import { action as destroyAction } from "./routes/destroy";
import Index from "./routes/index.jsx";

const router = createBrowserRouter([
    {
        path: "/",
        element: <Root/>,
        errorElement: <ErrorPage/>,
        loader: rootLoader,
        action: rootAction,
        children: [
            {
                errorElement: <ErrorPage />,
                children: [
                    { index: true, element: <Index /> },
                    {
                        path: "contacts/:contactId",
                        element: <Contact />,
                        loader: contactLoader,
                        action: contactAction,
                    },
                    /* the rest of the routes */
                ],
            },
            { index: true, element: <Index /> },
            {
                path: "contacts/:contactId",
                element: <Contact/>,
                loader: contactLoader,
                action: contactAction,
            },
            {
                path: "contacts/:contactId/edit",
                element: <EditContact />,
                loader: contactLoader,
                action: editAction,
            },
            {
                path: "contacts/:contactId/destroy",
                action: destroyAction,
                errorElement: <div>Oops! There was an error.</div>,
            },
        ],
    }
]);

ReactDOM.createRoot(document.getElementById('root')).render(
    <React.StrictMode>
        <RouterProvider router={router}/>
    </React.StrictMode>,
)
