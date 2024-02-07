import { createSlice } from "@reduxjs/toolkit";

const initialState = [
    {
        id: "1",
        name: "Pepito",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2023-08-15T12:00:00.000Z"
      },
      {
        id: "2",
        name: "Juanito",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2021-05-27T08:30:00.000Z"
      },
      {
        id: "3",
        name: "Carlos",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2022-11-10T15:45:00.000Z"
      },
      {
        id: "4",
        name: "Roberto",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2024-02-01T18:20:00.000Z"
      },
      {
        id: "5",
        name: "Luis",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2020-12-05T10:10:00.000Z"
      },
      {
        id: "6",
        name: "Diego",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2023-01-20T14:55:00.000Z"
      },
      {
        id: "7",
        name: "Miguel",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2022-07-18T09:40:00.000Z"
      },
      {
        id: "8",
        name: "Pedro",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2021-09-30T16:25:00.000Z"
      },
      {
        id: "9",
        name: "Manuel",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2023-04-12T11:15:00.000Z"
      },
      {
        id: "10",
        name: "Javier",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2020-10-08T13:35:00.000Z"
      },
      {
        id: "11",
        name: "Francisco",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2022-06-14T07:20:00.000Z"
      },
      {
        id: "12",
        name: "Andres",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2023-10-22T17:50:00.000Z"
      },
      {
        id: "13",
        name: "Santiago",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2020-08-02T06:45:00.000Z"
      },
      {
        id: "14",
        name: "Gonzalo",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2021-12-19T20:05:00.000Z"
      },
      {
        id: "15",
        name: "Cristian",
        rut: "12.123.123-k",
        patente: "CK-GD-98",
        marca: "Audi",
        modelo: "R8",
        precio: "100$",
        created_at: "2022-03-28T11:30:00.000Z"
      }
];

export const rentSlice = createSlice({
    name: 'rent',
    initialState,
    reducers: {
        addRent: (state, action) =>{
            const id = crypto.randomUUID()
            const created_at = new Date().toISOString();
            return [ ... state, { id, ...action.payload, created_at}]
        },
        deleteRent: (state, action) =>{
            const id = action.payload;
            return state.filter((rent)=> rent.id !== id)
        }
    },
})
export const { addRent, deleteRent } = rentSlice.actions;
export default rentSlice.reducer;