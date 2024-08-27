--Обчислення суми двох чисел
GO
DECLARE @number1 INT = 10;
DECLARE @number2 INT = 20;
SELECT @number1 + @number2 AS SumResult;
--Переведення тексту в верхній регістр
GO 
DECLARE @text NVARCHAR(100) = 'какой то текст';
SELECT UPPER(@text) AS UpperCaseText;
--Розрахунок добутку числа на певну константу
GO
DECLARE @number INT = 5;
DECLARE @constant INT = 10;
SELECT @number * @constant AS ProductResult;
--Перевірка, чи є число парним
GO
DECLARE @number INT = 8; 
IF @number % 2 = 0
    PRINT 'парное';
ELSE
    PRINT 'непорное';
--Розрахунок віку на основі дати народження Створіть SQL-функцію, яка приймає дату народження користувача та розраховує його вік на даний момент.
GO
CREATE FUNCTION CalculateAge (@birthdate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @age INT;
    SET @age = DATEDIFF(YEAR, @birthdate, GETDATE());
    IF (MONTH(@birthdate) > MONTH(GETDATE())) OR (MONTH(@birthdate) = MONTH(GETDATE()) AND DAY(@birthdate) > DAY(GETDATE()))
    BEGIN
        SET @age = @age - 1;
    END
    RETURN @age;
END;
GO
SELECT dbo.CalculateAge('1991-05-20') AS Age;