# Guía Completa de Pruebas - Sistema de Préstamo de Libros

## 🔧 Preparación Inicial

### 1. Compilar el proyecto
```bash
make clean && make
```

### 2. Verificar archivos base
```bash
# Verificar que existan estos archivos:
ls -la db_file.txt instrucciones.txt
```

---

## 📋 FASE 1: Pruebas con Archivo de Instrucciones

### Preparar archivos de prueba diferentes

#### Archivo 1: `test_prestamos.txt` (Solo préstamos)
```
P, Machine Learning, 2270
P, Artificial Intelligence, 2260
P, Data Bases, 2234
P, Programming Languages, 2240
Q, Salir, 0
```

#### Archivo 2: `test_devoluciones.txt` (Solo devoluciones)
```
D, Operating Systems, 2233
D, Machine Learning, 2270
D, Computer Networks, 2250
Q, Salir, 0
```

#### Archivo 3: `test_renovaciones.txt` (Solo renovaciones)
```
R, Operating Systems, 2233
R, Machine Learning, 2270
R, Computer Networks, 2250
Q, Salir, 0
```

#### Archivo 4: `test_mixto.txt` (Operaciones mixtas)
```
P, Artificial Intelligence, 2260
D, Operating Systems, 2233
R, Machine Learning, 2270
P, Data Bases, 2234
D, Computer Networks, 2250
P, Programming Languages, 2240
Q, Salir, 0
```

#### Archivo 5: `test_errores.txt` (Casos de error)
```
P, Libro Inexistente, 9999
D, Artificial Intelligence, 2260
R, Programming Languages, 2240
P, Operating Systems, 2233
Q, Salir, 0
```

### Comandos para ejecutar cada prueba:

#### Prueba 1: Solo Préstamos
```bash
# Terminal 1:
./cliente -p pipe_test1 -f db_file.txt -v

# Terminal 2:
./servidor -p pipe_test1 -i test_prestamos.txt
```

#### Prueba 2: Solo Devoluciones
```bash
# Terminal 1:
./cliente -p pipe_test2 -f db_file.txt -v

# Terminal 2:
./servidor -p pipe_test2 -i test_devoluciones.txt
```

#### Prueba 3: Solo Renovaciones
```bash
# Terminal 1:
./cliente -p pipe_test3 -f db_file.txt -v

# Terminal 2:
./servidor -p pipe_test3 -i test_renovaciones.txt
```

#### Prueba 4: Mixto
```bash
# Terminal 1:
./cliente -p pipe_test4 -f db_file.txt -v

# Terminal 2:
./servidor -p pipe_test4 -i test_mixto.txt
```

#### Prueba 5: Casos de Error
```bash
# Terminal 1:
./cliente -p pipe_test5 -f db_file.txt -v

# Terminal 2:
./servidor -p pipe_test5 -i test_errores.txt
```

---

## 🎮 FASE 2: Pruebas Interactivas

### Prueba Básica Interactiva
```bash
# Terminal 1:
./cliente -p pipe_interactive -f db_file.txt -v

# Terminal 2:
./servidor -p pipe_interactive
```

#### Secuencia de pruebas interactivas:

**Escenario 1: Préstamos exitosos**
```
1. Seleccionar opción: 1 (Préstamo)
2. Nombre: Machine Learning
3. ISBN: 2270
4. Verificar respuesta del servidor
```

**Escenario 2: Devolución exitosa**
```
1. Seleccionar opción: 3 (Devolución)
2. Nombre: Operating Systems
3. ISBN: 2233
4. Verificar respuesta del servidor
```

**Escenario 3: Renovación exitosa**
```
1. Seleccionar opción: 2 (Renovación)
2. Nombre: Machine Learning
3. ISBN: 2270
4. Verificar respuesta del servidor
```

**Escenario 4: Casos de error**
```
1. Préstamo de libro inexistente:
   - Opción: 1
   - Nombre: Libro Falso
   - ISBN: 9999

2. Devolución de libro ya disponible:
   - Opción: 3
   - Nombre: Artificial Intelligence
   - ISBN: 2260

3. Renovación de libro no prestado:
   - Opción: 2
   - Nombre: Programming Languages
   - ISBN: 2240
```

---

## 🧵 FASE 3: Pruebas de Concurrencia y Hilos

### Prueba de Reportes (Hilo 2)
```bash
# Terminal 1 - Cliente:
./cliente -p pipe_concurrent -f db_file.txt -v

# Terminal 2 - Servidor (envía varias operaciones):
./servidor -p pipe_concurrent -i test_mixto.txt

# En Terminal 1 (mientras se ejecutan operaciones):
# Presionar 'r' + Enter para ver reportes
# Presionar 's' + Enter para salir
```

### Prueba de Múltiples Servidores Simultáneos
```bash
# Terminal 1:
./cliente -p pipe_multi -f db_file.txt -v

# Terminal 2:
./servidor -p pipe_multi -i test_prestamos.txt &

# Terminal 3:
./servidor -p pipe_multi -i test_devoluciones.txt &

# Terminal 4:
./servidor -p pipe_multi -i test_renovaciones.txt &
```

---

## 📋 Checklist de Funcionalidades a Verificar

### ✅ Operaciones Básicas
- [ ] Préstamo exitoso (P)
- [ ] Devolución exitosa (D)
- [ ] Renovación exitosa (R)
- [ ] Salida del programa (Q)

### ✅ Manejo de Errores
- [ ] Libro inexistente
- [ ] ISBN inválido
- [ ] No hay ejemplares disponibles
- [ ] Intentar devolver libro ya disponible
- [ ] Intentar renovar libro no prestado

### ✅ Interfaz y Modos
- [ ] Modo archivo (-i)
- [ ] Modo interactivo
- [ ] Menú interactivo funcional
- [ ] Respuestas del servidor visibles

### ✅ Concurrencia
- [ ] Múltiples operaciones simultáneas
- [ ] Reportes (comando 'r')
- [ ] Salida controlada (comando 's')
- [ ] Buffer circular funciona

### ✅ Persistencia
- [ ] Cambios guardados en db_file.txt
- [ ] Fechas actualizadas correctamente
- [ ] Estados cambiados correctamente

### ✅ Comunicación
- [ ] Pipes creados correctamente
- [ ] Mensajes enviados y recibidos
- [ ] Manejo de múltiples servidores

---

## 🚨 Comandos de Limpieza
```bash
# Limpiar pipes:
rm -f /tmp/pipe*

# Restaurar base de datos original:
cp db_file_backup.txt db_file.txt

# Limpiar archivos de prueba:
rm -f test_*.txt

# Matar procesos si quedan colgados:
pkill -f cliente
pkill -f servidor
```