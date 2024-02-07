import React from "react"
import { useState } from "react"
import { ContainerForm } from "./styled/ContainerForm"
import { Paragraph } from "./styled/Paragraph"
import { Row } from "./styled/Row"
import { Col } from "./styled/Col"
import { Input } from "./styled/Input"
import { Label } from "./styled/Label"
import { Select } from "./styled/Select"
import { Span } from "./styled/Span"
import { ButtonForm } from "./styled/ButtonForm"

import { useDispatch, useSelector } from "react-redux"
import { addRent } from "../store/rent/slice"
import ErrorLabel from "./ErrorLabel"
import { required } from "../validators/required"
import { patentValidator } from '../validators/patente'
import { rutValidator } from "../validators/rut"
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';


export default function FormIngreso() {

    const [errors, setErrors] = useState({})

    const marcas = useSelector((state) => state.marcas);
    const modelos = useSelector((state) => state.modelos);

    const [marca, setMarca] = useState("");

    const handleMarcaChange = (e) => {
        setMarca(e.target.value);
    };

    const dispatch = useDispatch();

    const handleSubmit = ((event) => {
        event.preventDefault();
        const form = event.target;
        const formData = new FormData(form);

        const name = formData.get('name');
        const rut = formData.get('rut');
        const patente = formData.get('patente');
        const marca = formData.get('marca');
        const modelo = formData.get('modelo');
        const precio = formData.get('precio');

        const newError = {
            name: required(name),
            patente: required(patente) || patentValidator(6, patente),
            rut: rutValidator(rut)
        };

        const formHasError = Object.values(newError).some(error => error);

        setErrors(newError);

        if (!formHasError) {
            dispatch(addRent({ name, rut, patente, marca, modelo, precio }));
            toast.success('Registro agregado correctamente', {
                position: "top-left",
                autoClose: 2000,
                hideProgressBar: false,
                closeOnClick: true,
                pauseOnHover: true,
                draggable: true,
                progress: undefined,
                theme: "light",
            });
            form.reset();
        };

    });

    const [rutValue, setRutValue] = useState("");

    const handleRutInput = ((event) => {
        const formattedRut = formatRut(event.target.value);
        setRutValue(formattedRut);
    });

    function formatRut(value) {
        if (!value) return value;
        const rutDigitsOnly = value.replace(/[^\dKk]/g, '');
        const formattedRut = rutDigitsOnly.replace(/^(\d{1,2})(\d{3})(\d{3})([0-9Kk])$/, '$1.$2.$3-$4');

        return formattedRut;
    }

    return (
        <ContainerForm>
            <h1>Nuevo Formulario</h1>
            <Paragraph fontWeight="normal">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the bed industry's standard dummy text ever since.
            </Paragraph>
            <form onSubmit={handleSubmit}>
                <Paragraph fontWeight="bold">Datos de vendedor:</Paragraph>
                <Row>
                    <Col col="1" className="form-control">
                        <Input type="text" name="name" />
                        <Label htmlFor="Name">Name <Span>*</Span></Label>
                        <ErrorLabel text={errors.name} />
                    </Col>
                    <Col col="3">
                        <Input type="text" onChange={handleRutInput} value={rutValue} maxLength="12" name="rut" />
                        <Label htmlFor="Rut">Rut <Span>*</Span></Label>
                        <ErrorLabel text={errors.rut} />
                    </Col>

                </Row>
                <Paragraph fontWeight="bold">Datos del vehiculo:</Paragraph>
                <Row>
                    <Col>
                        <Input type="text" name="patente" required />
                        <Label htmlFor="Patente">Patente del vehículo <Span>*</Span></Label>
                        <ErrorLabel text={errors.patente} />
                    </Col>
                    <Col>
                        <Select type="text" name="marca" onChange={handleMarcaChange} value={marca} required>
                            {marcas.map((item) => (
                                <option key={item.id} value={item.nombre}>{item.nombre}</option>
                            ))}
                        </Select>

                        <Label htmlFor="Marca">Marca del vehículo <Span>*</Span></Label>
                    </Col>
                    <Col>
                        <Select type="text" name="modelo" disabled={marca === ""} required>
                            {modelos.map((item) => (
                                (marca == item.nombre_marca) ? <option key={item.id} value={item.nombre}>{item.nombre}</option> : ""
                            ))}
                        </Select>

                        <Label htmlFor="Modelo">Modelo del vehículo <Span>*</Span></Label>

                    </Col>
                    <Col>
                        <Input type="number" name="precio" required />
                        <Label htmlFor="Precio">Precio del vehículo <Span>*</Span></Label>
                        {/* <ErrorLabel text={'} /> */}
                    </Col>

                </Row>
                <div style={{ textAlign: "end" }}>
                    <ButtonForm type="submit">Enviar</ButtonForm>
                </div>

            </form>
            <ToastContainer />
        </ContainerForm>
    )
}