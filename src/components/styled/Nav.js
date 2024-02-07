import styled from 'styled-components';

export const Nav = styled.nav`
    display:flex;
    align-items: center;
    justify-content: end;
    padding: 50px 20px;
    box-shadow: 0px 7px 10px 0px rgba(0,0,0,0.68);

    @media (width < 768px){
        .spacer{
            height: 40px;
            width: 2px;
            background-color: #D7D7D7;
        }
    }

    
`;