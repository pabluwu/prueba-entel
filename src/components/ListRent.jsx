import { Container } from "./styled/Container"
import { Paragraph } from "./styled/Paragraph"
import { useSelector } from "react-redux"
import { Table } from "./styled/Table";
import { Td } from "./styled/Td";
import { Th } from "./styled/Th";
import { ButtonTable } from "./styled/ButtonTable";
import { useDispatch } from "react-redux";
import { deleteRent } from "../store/rent/slice";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

export default function ListRent() {

    const dispatch = useDispatch();

    const rents = useSelector(({ rents }) => {
        return [...rents].sort((a, b) => {
            return new Date(b.created_at) - new Date(a.created_at)
        });
    })

    const handleDelete = (id) => {
        dispatch(deleteRent(id));
        toast.success('Eliminado correctamente', {
            position: "top-left",
            autoClose: 2000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
            theme: "light",
        });
    };


    return (
        <Container textalign='start'>
            <h2 style={{ color: '#191919' }}>Lista Formulario</h2>
            <Paragraph fontWeight='normal'>Lorem Ipsum is simply dummy text of The printing and typesetting industry. Lorem Ipsum has been The bed industry's standard dummy text ever since.</Paragraph>
            <Table>
                <thead>
                    <tr>
                        <Th>Name</Th>
                        <Th>Rut</Th>
                        <Th>Patente</Th>
                        <Th>Marca</Th>
                        <Th>Modelo</Th>
                        <Th>Precio</Th>
                        <Th>Eliminar</Th>
                    </tr>
                </thead>
                <tbody>
                    {rents.slice(0, 10).map((item) => (
                        <tr key={item.id}>
                            <Td>{item.name}</Td>
                            <Td>{item.rut}</Td>
                            <Td>{item.patente}</Td>
                            <Td>{item.marca}</Td>
                            <Td>{item.modelo}</Td>
                            <Td>{item.precio}</Td>
                            <Td>
                                <ButtonTable onClick={() => (handleDelete(item.id))} type="button">
                                    <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9 9.49136C9.55228 9.49136 10 9.93908 10 10.4914V19.4914C10 20.0436 9.55228 20.4914 9 20.4914C8.44771 20.4914 8 20.0436 8 19.4914V10.4914C8 9.93908 8.44771 9.49136 9 9.49136Z" fill="#002EFF" />
                                        <path d="M16 10.4914C16 9.93908 15.5523 9.49136 15 9.49136C14.4477 9.49136 14 9.93908 14 10.4914V19.4914C14 20.0436 14.4477 20.4914 15 20.4914C15.5523 20.4914 16 20.0436 16 19.4914V10.4914Z" fill="#002EFF" />
                                        <path fillRule="evenodd" clipRule="evenodd" d="M10 0.475006C7.79086 0.475006 6 2.26587 6 4.47501V5.47501H3V5.47916H1.01355C0.461265 5.47916 0.0135498 5.92687 0.0135498 6.47916C0.0135498 7.03144 0.461266 7.47916 1.01355 7.47916H3V20.475C3 22.6841 4.79086 24.475 7 24.475H17C19.2091 24.475 21 22.6841 21 20.475V7.47916H23.0135C23.5658 7.47916 24.0135 7.03144 24.0135 6.47916C24.0135 5.92687 23.5658 5.47916 23.0135 5.47916H21V5.47501H18V4.47501C18 2.26587 16.2091 0.475006 14 0.475006H10ZM16 5.47501V4.47501C16 3.37044 15.1046 2.47501 14 2.47501H10C8.89543 2.47501 8 3.37044 8 4.47501V5.47501H16ZM19 7.47916H5V20.475C5 21.5796 5.89543 22.475 7 22.475H17C18.1046 22.475 19 21.5796 19 20.475V7.47916Z" fill="#002EFF" />
                                    </svg>
                                </ButtonTable>

                            </Td>
                        </tr>
                    ))}
                </tbody>
            </Table>
            <Paragraph textalign='center'>Mostrando registros del 1 al {(rents.length < 9 ? rents.length : '10')} de un total de {rents.length} registros.</Paragraph>
            <ToastContainer/>
        </Container>
    )
}