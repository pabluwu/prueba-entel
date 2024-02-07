import styled from 'styled-components';
import { NavLink } from 'react-router-dom';

export const ButtonNav = styled(NavLink)`
    background-color: #fff;
    border-radius: 4px;
    border: none;
    color: #002EFF;
    padding: 10px 20px;
    margin: 0 10px;
    text-decoration: none;
    border-radius: 20px;

    &.active{
        background-color: #F3F5FF;
    }
    @media (width < 768px){
        color: #0C0C0C;
        &.active{
            background-color: #ffffff;
            font-weight: bold;  
            border-bottom: solid 1px #0C0C0C;
            border-radius: 0;
        }
    }
`;