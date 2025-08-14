import {checkuser} from "@/lib/checkUser";
export default function Navbar() {
    const user = checkuser();
    return (
        <div>
            <nav className="navbar navbar-expand-lg navbar-light bg-light">
                <a className="navbar-brand" href="#">Navbar</a></nav>
        </div>
    )
}