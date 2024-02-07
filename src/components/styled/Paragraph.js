import styled from 'styled-components';

export const Paragraph = styled.p`
font-weight:  ${props => props.fontWeight ? props.fontWeight : 'regular'}; 
margin-bottom: 40px;
font-size: 18px;
text-align: ${props => props.textalign ? props.textalign : 'start'}
`;