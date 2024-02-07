import { Container } from "./styled/Container"
import { Image } from "./styled/Image"
import BannerImagen from "../../public/Banner.jpg"

export default function Banner(){
    return (
        <Container>
            <Image src={BannerImagen} alt="" />
        </Container>
    )
}