Use Empresa

select nombreEmpleado from TEmpleado
where idEmpleado = '115170749'


select idEmpleado from TEmpleado
where apellidosEmpleado = 'SALAS LOPEZ'


Select E.nombreEmpleado, E.idEmpleado, H.horasTrabajadas from TEmpleado E, THoras H
Where E.idEmpleado = H.idEmpleado


select top 1 E.nombreEmpleado, E.idEmpleado, H.horasTrabajadas, E.salarioEmpleado from TEmpleado E, THoras H
where E.idEmpleado = H.idEmpleado order by H.horasTrabajadas desc


CREATE FUNCTION regresaMayor (@numero1 INT, @numero2 INT)
RETURNS INT
AS
BEGIN
  DECLARE @mayor INT;
  SET @mayor = CASE
               WHEN @numero1 > @numero2 THEN @numero1
               ELSE @numero2
             END;
  RETURN @mayor;
END;

SELECT dbo.regresaMayor(2, 4) AS mayor

Use BDLaNacion
------------Procedimiento Almacenado Bryan------------
CREATE PROCEDURE Sp_Multiplicacion
  @numero1 int,
  @numero2 int
AS
BEGIN
  DECLARE @resultado int;
  SET @resultado = @numero1 * @numero2;
  SELECT @resultado AS resultado;
END;

EXEC Sp_Multiplicacion @numero1 = 10, @numero2 = 20;


------------Procedimiento Almacenado Clase------------
create procedure SP_MultiplicacionClase
@num1 int, @num2 int, @multi int output
as
	set @multi = @num1 * @num2
go

declare @num1 int
declare @num2 int 
declare @resultado int
set @num1 = 100
set @num2 = 23

execute SP_MultiplicacionClase @num1,@num2, @resultado output
print 'El resultado es: '
print @resultado


-------------Procedimiento Almacenado Bryan------------
CREATE PROCEDURE SP_factorial
  @numero INT
AS
BEGIN
  DECLARE @resultado INT;
  SET @resultado = 1;
  WHILE @numero > 0
  BEGIN
    SET @resultado = @resultado * @numero;
    SET @numero = @numero - 1;
  END
  SELECT @resultado AS factorial;
END;

EXEC SP_factorial @numero = 3;


-------------Procedimiento Almacenado Clase------------
/*int n, i = 1, factorial = 1;
        out.println("Ingrese un numero entero: ");
        n = Integer.parseInt(in.readLine());
        while (i <= n) {
            factorial = factorial * i;
            i++;

        }
        out.println("El factorial de " + n + " es:" + factorial);*/

create procedure SP_FactorialClase
@numFactorial int, @factorial int output
as
	declare @contador int
	set @contador = 1
	set @factorial = 1
	while @contador <= @numFactorial
	begin
		set @factorial = @factorial*@contador
		set @contador = @contador + 1 
	end

go

declare @resultadoFac int
execute SP_FactorialClase 3, @resultadoFac output
print 'El resultado de 3! es: '
print @resultadoFac

-------------Procedimiento Almacenado Bryan------------
CREATE PROCEDURE SP_Periodicidad
    @periodicidad VARCHAR(255)
AS
BEGIN
    SELECT COUNT(TProducto.idProducto) AS TotalProductos
    FROM TProducto, TPeriodicidad
    WHERE TProducto.idPeriodicidad = TPeriodicidad.idPeriodicidad and TPeriodicidad.periodicidad = @periodicidad;
END

EXEC SP_Periodicidad 'Diario';
-------------Procedimiento Almacenado Clase------------
CREATE PROCEDURE SP_Productos
AS
BEGIN
  DECLARE @resultado INT;
  SET @resultado = 1;
 
  END
  SELECT @resultado AS Resultado;
END;

EXEC SP_factorial @numero = 3;