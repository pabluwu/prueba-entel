import {  configureStore } from '@reduxjs/toolkit'
import rentsReducer from './rent/slice'
import marcasReducer from './marca/slice'
import modelosReducer from './modelo/slice'


export const store = configureStore({
    reducer: {
        rents : rentsReducer,
        marcas: marcasReducer,
        modelos: modelosReducer,
    },
    
})