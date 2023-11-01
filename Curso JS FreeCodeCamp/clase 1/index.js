function mostrarCotizador() {
    // Seleccionamos y ocultamos las secciones que no queremos mostrar
    document.querySelectorAll('header, section:not(#cotizador)').forEach(el => {
        el.style.display = 'none';
    });

    // Mostramos la sección del cotizador
    const cotizadorSection = document.getElementById('cotizador');
    cotizadorSection.style.display = 'block';

    // Ocultamos la sección de resultados cuando se muestra el cotizador
    document.getElementById('resultado').style.display = 'none';
}

function regresarAlMenuPrincipal() {
    // Ocultamos la sección de datosViajeros
    document.getElementById('datosViajeros').style.display = 'none';
    
    // Mostramos las secciones del menú principal y ocultamos las otras secciones
    document.querySelectorAll('header, section').forEach(el => {
        if (el.id === 'cotizador' || el.id === 'datosViajeros') {
            el.style.display = 'none';
        } else {
            el.style.display = 'block';
        }
    });
}
function toggleMenu() {
    var menu = document.querySelector('.menu');
    menu.classList.toggle('active');
}


function calcularCotizacion() {
    const ciudad = document.getElementById('ciudad').value;
    const tipoServicio = document.getElementById('tipoServicio').value;
    const viajeros = parseInt(document.getElementById('viajeros').value);
    
    const tarifas = {
        bogota: {
            empresarial: 60000,
            traslados: 70000,
            turistico: 70000,
            escolar: 100000,
            eventos: 100000
        },
        medellin: {
            empresarial: 50000,
            traslados: 100000,
            turistico: 120000,
            escolar: 80000,
            eventos: 120000
        },
        cartagena: {
            empresarial: 60000,
            traslados: 50000,
            turistico: 100000,
            escolar: 100000,
            eventos: 100000
        }
    };

    const valorBase = tarifas[ciudad][tipoServicio];
    const totalCotizacion = valorBase * viajeros;

    // Formateo del resultado a pesos colombianos
    const resultadoFormateado = new Intl.NumberFormat('es-CO', {
        style: 'currency',
        currency: 'COP'
    }).format(totalCotizacion);

    document.getElementById('valorCotizacion').innerText = resultadoFormateado;
    document.getElementById('resultado').style.display = 'block';
}

document.addEventListener('DOMContentLoaded', function() {
    // Ocultamos secciones no necesarias al inicio
    document.getElementById('resultado').style.display = 'none';
    if(document.getElementById('datosViajeros')) {
        document.getElementById('datosViajeros').style.display = 'none';
    }

    // Agregar listener al botón Reservar
    const btnReservar = document.getElementById('btnReservar');
    if (btnReservar) {
        btnReservar.addEventListener('click', function() {
            // Ocultamos todas las secciones
            document.querySelectorAll('section').forEach(el => {
                el.style.display = 'none';
            });
            
            // Mostramos solamente la sección de datos del viajero
            document.getElementById('datosViajeros').style.display = 'block';
        });
    }

    // Agregar listener al botón de cálculo
    const btnCalcular = document.getElementById('btnCalcular');
    if (btnCalcular) {
        btnCalcular.addEventListener('click', calcularCotizacion);
    }

    // Agregar listener al botón Volver en la sección datosViajeros
    const btnVolver = document.getElementById('btnVolver');
    if (btnVolver) {
        btnVolver.addEventListener('click', regresarAlMenuPrincipal);
    }
    
});
