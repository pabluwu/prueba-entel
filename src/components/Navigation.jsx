import { ButtonNav } from "./styled/ButtonNav.js";
import { Nav } from "./styled/Nav.js";


export default function Navigation() {


    return (
        <Nav>
            <ButtonNav
                to="/">Formulario
            </ButtonNav>
            <div className="spacer"></div>
            <ButtonNav
                to="/list">Lista formulario
            </ButtonNav>
        </Nav>
    )
};