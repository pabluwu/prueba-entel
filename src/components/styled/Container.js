import styled from 'styled-components';

export const Container = styled.div`
    height: auto;
    padding: 50px 20px;
    text-align: ${props => props.textAlign ? props.textAlign : 'center'};
`;