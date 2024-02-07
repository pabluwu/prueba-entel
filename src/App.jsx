import { useEffect, useState } from 'react'
import './App.css'
import Navigation from './components/Navigation'
import Banner from './components/Banner'
import FormIngreso from './components/Form'

function App() {
  return (
    <>
      <Navigation></Navigation>
      <Banner></Banner>
      <FormIngreso></FormIngreso>
    </>
  )
}

export default App
