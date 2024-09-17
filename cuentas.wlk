object cuentaCorriente {
  var saldo = 0

  method saldo() {
	  return saldo
	}

	method depositar(dinero) {
	  saldo = saldo + dinero 
	}

    method validarExctracion(dinero) {
      if (dinero > saldo){
            self.error("el saldo " + saldo + " es insuficiente" + dinero)
      }
    }

	method retirar(dinero) {
        self.validarExctracion(dinero)
		saldo = saldo - dinero
	  
	}
}
object cuentaConGastos {
  var saldo = 0
  var costoPorOperacion = 20

  method costoPorOperacion(precio) {
	costoPorOperacion = precio
	}

	method saldo() {
	  return saldo
	}
	method depositar(dinero) {
	  saldo = saldo + (dinero - costoPorOperacion).max(0) 
      //el max 0 pq si yo quiero ingresar dinero menor a los que me cuesta
	}
}

object cuentaCombinada {
  var property primaria = cuentaConGastos
  var property secundaria = cuentaCorriente

  method saldo() {
    return primaria.saldo() + secundaria.saldo()
  } 

  method depositar(dinero) {
    primaria.depositar(dinero)
  }

  method extraer(dinero) {
    const cuenta = if (primaria.saldo() == dinero ) primaria else secundaria
     cuenta.retirar(dinero)
  }
}