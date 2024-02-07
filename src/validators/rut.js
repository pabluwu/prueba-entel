export const rutValidator = (text) => {
    if(!text) return 'El campo es requerido';
    const rutRegex = /^[0-9]{1,2}\.?[0-9]{3}\.?[0-9]{3}-[0-9kK]$/;
    if(!text.match(rutRegex)) return 'El campo no posee un formato válido';
  }