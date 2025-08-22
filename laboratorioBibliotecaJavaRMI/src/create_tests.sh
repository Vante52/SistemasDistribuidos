#!/bin/bash

# Script para crear archivos de prueba automáticamente
# Compatible con el sistema de biblioteca actualizado

echo "🔧 Creando archivos de prueba para el sistema de biblioteca..."

# Archivo 1: Solo préstamos
cat > test_prestamos.txt << EOF
P, Machine Learning, 2270
P, Artificial Intelligence, 2260
P, Data Bases, 2234
P, Programming Languages, 2240
P, Computer Networks, 2250
Q, Salir, 0
EOF

# Archivo 2: Solo devoluciones
cat > test_devoluciones.txt << EOF
D, Operating Systems, 2233
D, Machine Learning, 2270
D, Computer Networks, 2250
D, Data Bases, 2234
Q, Salir, 0
EOF

# Archivo 3: Solo renovaciones
cat > test_renovaciones.txt << EOF
R, Operating Systems, 2233
R, Machine Learning, 2270
R, Computer Networks, 2250
R, Programming Languages, 2240
Q, Salir, 0
EOF

# Archivo 4: Operaciones mixtas (flujo completo)
cat > test_mixto.txt << EOF
P, Artificial Intelligence, 2260
P, Data Bases, 2234
D, Operating Systems, 2233
R, Machine Learning, 2270
P, Programming Languages, 2240
D, Computer Networks, 2250
R, Data Bases, 2234
P, Operating Systems, 2233
Q, Salir, 0
EOF

# Archivo 5: Casos de error y límites
cat > test_errores.txt << EOF
P, Libro Inexistente, 9999
P, Machine Learning, 2270
P, Machine Learning, 2270
P, Machine Learning, 2270
P, Machine Learning, 2270
P, Machine Learning, 2270
P, Machine Learning, 2270
D, Artificial Intelligence, 2260
R, Programming Languages, 2240
P, Operating Systems, 2233
Q, Salir, 0
EOF

# Archivo 6: Stress test (operaciones intensivas)
cat > test_stress.txt << EOF
P, Machine Learning, 2270
P, Machine Learning, 2270
P, Machine Learning, 2270
D, Machine Learning, 2270
R, Machine Learning, 2270
P, Artificial Intelligence, 2260
P, Artificial Intelligence, 2260
D, Artificial Intelligence, 2260
D, Artificial Intelligence, 2260
P, Data Bases, 2234
P, Data Bases, 2234
D, Data Bases, 2234
R, Data Bases, 2234
P, Operating Systems, 2233
P, Operating Systems, 2233
P, Operating Systems, 2233
P, Operating Systems, 2233
D, Operating Systems, 2233
D, Operating Systems, 2233
R, Operating Systems, 2233
P, Computer Networks, 2250
P, Computer Networks, 2250
P, Computer Networks, 2250
D, Computer Networks, 2250
R, Computer Networks, 2250
P, Programming Languages, 2240
D, Programming Languages, 2240
R, Programming Languages, 2240
Q, Salir, 0
EOF

# Archivo 7: Flujo realista de biblioteca
cat > test_flujo_realista.txt << EOF
P, Machine Learning, 2270
P, Artificial Intelligence, 2260
P, Computer Networks, 2250
R, Machine Learning, 2270
P, Data Bases, 2234
D, Artificial Intelligence, 2260
P, Programming Languages, 2240
R, Computer Networks, 2250
D, Machine Learning, 2270
P, Operating Systems, 2233
Q, Salir, 0
EOF

# Crear backup de la base de datos original
if [ -f "db_file.txt" ]; then
    cp db_file.txt db_file_backup.txt
    echo "✅ Backup de db_file.txt creado como db_file_backup.txt"
else
    echo "⚠️  Advertencia: db_file.txt no encontrado, no se pudo crear backup"
fi

# Hacer el script ejecutable
chmod +x "$0"

echo ""
echo "✅ Archivos de prueba creados exitosamente:"
echo "  📝 test_prestamos.txt      (Solo préstamos)"
echo "  📝 test_devoluciones.txt   (Solo devoluciones)"
echo "  📝 test_renovaciones.txt   (Solo renovaciones)"
echo "  📝 test_mixto.txt          (Operaciones mixtas)"
echo "  📝 test_errores.txt        (Casos de error)"
echo "  📝 test_stress.txt         (Prueba de estrés)"
echo "  📝 test_flujo_realista.txt (Flujo realista)"
echo "  💾 db_file_backup.txt      (Backup de BD)"

echo ""
echo "🚀 INSTRUCCIONES DE USO:"
echo ""
echo "1️⃣  COMPILAR:"
echo "   make all"
echo ""
echo "2️⃣  TERMINAL 1 - Servidor (en una terminal):"
echo "   make run-receptor"
echo "   (El servidor quedará esperando peticiones)"
echo ""
echo "3️⃣  TERMINAL 2 - Cliente (en otra terminal):"
echo "   make test-prestamos     # Prueba solo préstamos"
echo "   make test-devoluciones  # Prueba solo devoluciones"
echo "   make test-renovaciones  # Prueba solo renovaciones"
echo "   make test-mixto         # Prueba operaciones mixtas"
echo "   make test-errores       # Prueba casos de error"
echo "   make test-stress        # Prueba de estrés"
echo ""
echo "   O ejecutar manualmente:"
echo "   ./solicitud -p pipe_solicitud -i test_prestamos.txt"
echo ""
echo "4️⃣  COMANDOS DEL SERVIDOR:"
echo "   r = Ver reporte de transacciones"
echo "   s = Salir del servidor"
echo ""
echo "5️⃣  RESTAURAR BASE DE DATOS:"
echo "   make restore-db  (restaura desde backup)"
echo ""
echo "6️⃣  LIMPIAR:"
echo "   make clean       (limpia archivos compilados)"
echo "   make clean-pipes (limpia tuberías del sistema)"

echo ""
echo "🔍 NOTA: Para ver todos los comandos disponibles ejecuta 'make help'"