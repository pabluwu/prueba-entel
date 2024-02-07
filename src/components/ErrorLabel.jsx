import { ErrorIndicator } from "./styled/ErrorIndicator"

export default function ErrorLabel({text}){
    return (
        <div style={{height: '14px'}}>
            {text && <ErrorIndicator >{text}</ErrorIndicator>}
        </div>
    )
}