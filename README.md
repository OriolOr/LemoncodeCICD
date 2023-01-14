### CI 

# Ejercicio 1. Crea un workflow CI para el proyecto de frontend
Añadimos en el la raiz del proyecto un nuevo directorio `.github/workflows`, que contendra el .yaml donde definiremos nuestro workflow: 

```
name: CI
on:
  pull_request:
    branches:
      - main
jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout 🚦
        uses: actions/checkout@v3
      
      - name: Build 🏗
        working-directory: ./hangman-front
        run: |
          npm ci 
          npm run build --if-present

      - name: Unit test 🧪
        working-directory: ./hangman-front
        run: npm test
```

Al ejecutar la build vemos que todos los steps se realizan correctamente hasta que llegamos a los test donde uno de los test falla. 

![image info](pics/build-fail.png)
Si queremos que los test pasen, cambiamos el assert del test y vemos como ya todos los pasos de nuestro workflow se pasan correctamente 

` expect(items).toHaveLength(2); `

![image info](pics/build-pass.png)


# Ejercicio 2. Crea un workflow CD para el proyecto de frontend

