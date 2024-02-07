import styled from 'styled-components';

export const Col = styled.div`
    grid-column: ${props => props.col ? props.col+"/3" : 0};
    position: relative;
    margin-bottom: 30px;

    @media (width < 768px ){
        grid-column: 1;
    }
`;