import { createSlice } from "@reduxjs/toolkit";

const initialState = [
    {
        id: "1",
        nombre_marca: "Tesla",
        nombre: "Model 3"
    },
    {
        id: "2",
        nombre_marca: "Tesla",
        nombre: "Model Y"
    },
    {
        id: "3",
        nombre_marca: "Tesla",
        nombre: "Model X"
    },
    {
        id: "4",
        nombre_marca: "Toyota",
        nombre: "Corolla"
    },
    {
        id: "5",
        nombre_marca: "Toyota",
        nombre: "Yaris"
    },
    {
        id: "6",
        nombre_marca: "Toyota",
        nombre: "Hilux"
    },
    {
        id: "7",
        nombre_marca: "Suzuki",
        nombre: "Celerio"
    },
    {
        id: "8",
        nombre_marca: "Suzuki",
        nombre: "Alto"
    },
    {
        id: "9",
        nombre_marca: "Suzuki",
        nombre: "Baleno"
    }
];

export const modeloSlice = createSlice({
    name: 'modelo',
    initialState,
    reducers: {}
})
// export const { addRent, deleteRent } = rentSlice.actions;
export default modeloSlice.reducer;