import cosas.* 
import cuentas.*


object casaDePepeYJulian {
	const cosas = []
	var property cuenta = cuentaCorriente

	method cosas() {
	  return cosas
	}
	method comprar(cosa) {
		//primero calculo si puedo comprar (lo que puede fallar)
	  cuenta.extraer(cosa.precio())
	  cosas.add(cosa)
	}

	method cantidadDeCosasCompradas() {
	  return cosas.size()
	}

	method tieneAlgun(categoria) {
	  return cosas.any({cosa => cosa.categoria()==categoria})
	}

	method vieneDeComprar(categoria) {
	  return not cosas.isEmpty() and cosas.last().categoria() == categoria
	}

	method esDerrochona() {
	  return self.montoTotalDeCosas() >= 9000
	}

	method montoTotalDeCosas() {
	  return cosas.sum({cosa => cosa.precio()})
	}

	method compraMasCara() {
	  return cosas.max({cosa => cosa.precio()})
	}

	method comprados(categoria) {
	  return cosas.filter({cosa => cosa.categoria() == categoria})
	}

	method malaEpoca() {
		//return cosas.all({cosa => cosa.categoria() == comida})
	  return cosas.all({cosa => cosa.categoria().escomestible()})
	}

	method queFaltaComprar(lista) {
	  return lista.filter({cosa => not cosas.contains(cosa)})
	}

	method faltaComida() {
	  return self.comprados(comida).size() <= 2
	}

	method categoriasCompradas() {
	  return cosas.map({cosa => cosa.categoria()}).asSet()
	}
}
