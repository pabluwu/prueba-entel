export const patentValidator = (length, text) => {
  if(text === '') return 'El campo es requerido'
  if(text.length < length) return 'El campo es menor al permitido'
  if(text.length > length) return 'El campo es mayor al permitido'
};
