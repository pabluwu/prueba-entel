import { createSlice } from "@reduxjs/toolkit";

const initialState = [
    {
        id: "1",
        nombre: "Tesla"
    },
    {
        id: "2",
        nombre: "Toyota"
    },
    {
        id: "3",
        nombre: "Suzuki"
    },
];

export const marcaSlice = createSlice({
    name: 'marca',
    initialState,
    reducers: {}
})
// export const { addRent, deleteRent } = rentSlice.actions;
export default marcaSlice.reducer;