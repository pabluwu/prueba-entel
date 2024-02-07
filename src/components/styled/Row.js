import styled from 'styled-components';

export const Row = styled.div`
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 10px;
    border-bottom: solid 1px #CCCCCC;

    @media (width < 768px ){
        grid-template-columns: 1fr;
    }
`