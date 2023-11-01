class productos{
    static contadorProductos=0;
    constructor(nombre,precio){
        this._idProducto = ++ productos.contadorProductos;
        this._nombre = nombre;
        this._precio = precio
    }
    get idProducto(){
        return this._idProducto;
    }
    get nombre(){
        return this._nombre;
    }
    set nombre(nombre){
        this._nombre = nombre;
    }
    get precio(){
        return this._precio;
    }
    set precio(precio){
        this._precio = precio;
    }
    mostrarDatos(){
        return `idproducto: ${this._idProducto}, nombre ${this._nombre}, precio ${this._precio}`
    }
}
class Orden{
    static contadorOrdenes=0;
    static get MaxProductos(){
        return 5;
    }
    constructor(){
        this._idOrden = ++Orden.contadorOrdenes;
        this._productos=[];
    }
    get idOrden(){
        return this._idOrden;
    }
    addProductos(producto){
        if(this._productos.length<Orden.MaxProductos){
            this._productos.push(producto)
        }
        else{
            alert("no se puede agregar mas de 5 productos")
        }
    }
    calcularTotal(){
        let total=0;
        for(let producto of this._productos){
            total+=producto.precio;
        }
        return total;
    }
    mostrarOrden(){
        let listaProductosAgregados =""
        for (let producto of this._productos){
            listaProductosAgregados+="\n{" + producto.mostrarDatos()+"}"
        }
        console.log(`orden: ${this._idOrden}, Total:$${this.calcularTotal()}, Productos: ${listaProductosAgregados}`)
    }
}
let producto1= new productos("Cerveza", 20);
let producto2= new productos("Laptop", 32);
let producto3= new productos("Teclado", 44);
let producto4= new productos("mouse", 64);

let orden1 = new Orden();
orden1.addProductos(producto1)
orden1.addProductos(producto2)
orden1.addProductos(producto3)
orden1.addProductos(producto4)
orden1.addProductos(producto4)
orden1.addProductos(producto4)


orden1.mostrarOrden();