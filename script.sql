USE [AllsoftTelcelPrueba]
GO
/****** Object:  StoredProcedure [dbo].[Activacion_Agregar_SolicitudNumeros]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para agregar Solicitudes de Números al Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Activacion_Agregar_SolicitudNumeros]

@Analista varchar(150),
@Campana varchar(50),
@NumeroPromocion varchar(50),
@NombreCliente varchar(50),
@Estado varchar(50),
@Ciudad varchar(50),
@LadaRequerida int,
@NumeroAsignado varchar(50),
@Observacion varchar(250),
@FechaAsignacion datetime

AS
BEGIN

	SET NOCOUNT ON;
	
INSERT INTO [dbo].[Activaciones_SolicitudNumero]
           ([Analista]
           ,[Campana]
           ,[NumeroPromocion]
           ,[NombreCliente]
           ,[Estado]
           ,[Ciudad]
           ,[LadaRequerida]
           ,[NumeroAsignado]
           ,[Observacion]
           ,[FechaAsignacion])
     VALUES
           (@Analista,
			@Campana,
			@NumeroPromocion,
			@NombreCliente,
			@Estado,
			@Ciudad,
			@LadaRequerida,
			@NumeroAsignado,
			@Observacion,
			@FechaAsignacion)	
END







GO
/****** Object:  StoredProcedure [dbo].[Activacion_Editar_SolicitudNumeros]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Actualiza los dados de las solicitudes de Números hechas a Telcel>
-- =============================================
CREATE PROCEDURE [dbo].[Activacion_Editar_SolicitudNumeros]

@SolicitudNumeroID int,
@Analista varchar(150),
@Campana varchar(50),
@NumeroPromocion varchar(50),
@NombreCliente varchar(50),
@Estado varchar(50), 
@Ciudad varchar(50), 
@LadaRequerida int, 
@NumeroAsignado  varchar(50), 
@Observacion  varchar(250)

AS
BEGIN
	SET NOCOUNT ON;
   
UPDATE [dbo].[Activaciones_SolicitudNumero]
   SET [Analista] = @Analista
      ,[Campana] = @Campana
      ,[NumeroPromocion] = @NumeroPromocion
      ,[NombreCliente] = @NombreCliente
      ,[Estado] = @Estado 
      ,[Ciudad] = @Ciudad 
      ,[LadaRequerida] = @LadaRequerida
      ,[NumeroAsignado] = @NumeroAsignado
      ,[Observacion] = @Observacion

 WHERE SolicitudNumeroID = @SolicitudNumeroID

END








GO
/****** Object:  StoredProcedure [dbo].[Activacion_Obtener_SolicitudNumeros]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene el detalle de todos las solicitudes de números hechas al almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Activacion_Obtener_SolicitudNumeros]
--@TopRegistros int

AS
BEGIN
	SET NOCOUNT ON;
    
      select * from Activaciones_SolicitudNumero 
END






GO
/****** Object:  StoredProcedure [dbo].[Activacion_SolicitudNumeros]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene los dados de las solicitudes de Números>
-- =============================================
CREATE PROCEDURE [dbo].[Activacion_SolicitudNumeros]

@SolicitudNumeroID int
AS
BEGIN
	SET NOCOUNT ON;
    select * from Activaciones_SolicitudNumero
	where SolicitudNumeroID = @SolicitudNumeroID
END








GO
/****** Object:  StoredProcedure [dbo].[actualizar_insertar]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizar_insertar] 
	@transa as int,
	@datoid as int,
	@campaid as int,
	@proyeid as int,
	@compaid as int,
	@moduid as int,
	@nom as varchar(10),
	@app as varchar(10),
	@apm as varchar(10),
	@edad as varchar(10),
	@sexo as varchar(10),
	@telefono as varchar(10),
	@coloni as int,
	@estado as int,
	@municipio as int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	set @transa = 50;
	set @datoid =1;
	set @campaid =1;
	set	@proyeid =1;
	set @compaid =1
	set @moduid =1;
	set @nom = 'danya';
	set @app ='justo';
	set @apm ='patiño';
	set @edad = 20;
	set @sexo ='mujer';
	set @telefono = 2223342547;
	set @coloni =7;
	set @estado =1;
	set @municipio =3
--	SET NOCOUNT ON;
    -- Insert statements for procedure here
	IF EXISTS(SELECT TransaccionID FROM Transaccion_CAMPANAPRUEBA WHERE TransaccionID = @transa)
INSERT INTO Transaccion_CAMPANAPRUEBA (DatoID,CampanaID,ProyectoID,CompaniaID, ModuloID, Nombre,Apellido_Paterno,Apellido_Materno,Edad,
Direccion,Telefono, Colonias,Estado, Municipios) VALUES ( @datoid,@campaid,@proyeid,@compaid,@moduid,@nom,@app,@apm,@edad,@sexo,
@telefono,@coloni,@estado,@municipio)
ELSE
UPDATE Transaccion_CAMPANAPRUEBA
 SET DatoID = @datoid,
     CampanaID = @campaid,
	 ProyectoID = @proyeid,
	 CompaniaID =@compaid,
	 ModuloID =@moduid,
	 Nombre =@nom,
	 Apellido_Paterno =@app,
	 Apellido_Materno =@apm,
	 Edad= @edad,
	 Direccion=@sexo,
	 Telefono=@telefono,
	 Colonias=@coloni,
	 Estado=@estado,
	 Municipios=@municipio
     WHERE TransaccionID = @transa
	

END







GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Respaldo_Transaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <10-Agosto-2015>
-- Description:	<Actualiza el respado de la informacion de la transaccion>
-- =============================================
CREATE PROCEDURE [dbo].[Actualizar_Respaldo_Transaccion]
(@RespaldoID as int,@ModuloID as int,  @TransaccionID as int, @Respaldo as text)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update RespaldoAllsoft
	set Respaldo= @Respaldo, TransaccionID=@TransaccionID
	where RespaldoID=@RespaldoID and ModuloID = @ModuloID
END






GO
/****** Object:  StoredProcedure [dbo].[Agendado_Atendido]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <7-Septiembre-2015>
-- Description:	<Indica que un agendado ha sido atendido>
-- =============================================
create PROCEDURE [dbo].[Agendado_Atendido]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int, @AgendadoID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @NombreTabla as varchar(max);
	select @NombreTabla= NomTablaAgendados from Global_TablasCampana
	where CampanaID= @CampanaID

	declare @Consulta as Varchar(max);
	set @Consulta ='update '+ @NombreTabla +
	' set Mostrado=1, Finalizado=1  where Agendado ='+ convert(varchar, @AgendadoID);
	exec(@Consulta)
	
END



GO
/****** Object:  StoredProcedure [dbo].[Agendado_Select_Datos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Agendado_Select_Datos]
	-- Add the parameters for the stored procedure here
	(@IDTransaccion as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from datosprueba where datosprueba.idtransaccion= @IDTransaccion
END







GO
/****** Object:  StoredProcedure [dbo].[Agendado_Visto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <7-Septiembre-2015>
-- Description:	<Indica que un agendado ha sido visto>
-- =============================================
Create PROCEDURE [dbo].[Agendado_Visto]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int, @AgendadoID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @NombreTabla as varchar(max);
	select @NombreTabla= NomTablaAgendados from Global_TablasCampana
	where CampanaID= @CampanaID

	declare @Consulta as Varchar(max);
	set @Consulta ='update '+ @NombreTabla +
	' set Mostrado=1 where Agendado ='+ convert(varchar, @AgendadoID);
	exec(@Consulta)
END



GO
/****** Object:  StoredProcedure [dbo].[Agendados_Insert_Atendido]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Agendados_Insert_Atendido]
	-- Add the parameters for the stored procedure here
	@AgendadoID int
AS
BEGIN
	-- Insert statements for procedure here
	begin Tran EstatusAtendido
	Begin Try
	UPDATE Agendados
	set Atendido_Estatus='True'
	where  Agendados.AgendadosID= @AgendadoID
	commit Tran EstatusAtendido
	End Try
	Begin Catch
	rollback Tran EstatusAtendido
	End Catch
END







GO
/****** Object:  StoredProcedure [dbo].[Agendados_Insert_Visto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Agendados_Insert_Visto]
	@AgendadoID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	begin Tran EstatusVisto
	Begin Try
	UPDATE Agendados
	set Visto_Estatus='True'
	where  Agendados.AgendadosID= @AgendadoID
	commit Tran EstatusVisto
	End Try
	Begin Catch
	rollback Tran EstatusVisto
	End Catch
	
END







GO
/****** Object:  StoredProcedure [dbo].[Agendados_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Agendados_Select]
	-- Add the parameters for the stored procedure here
	
	
	
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	declare @Fecha datetime;
    
		
		--set @locate='Error al Cancelar la venta'
    -- Insert statements for procedure here
	set @Fecha = (Select convert (varchar(48),GETUTCDATE(),113))
	
	

SELECT *
FROM (datosprueba inner join Agendados
    on datosprueba.idatosprueba=Agendados.TransaccionID )
	inner join transaccion_prueba on datosprueba.idatosprueba= transaccion_prueba.idtransaccionprueba
	where Agendados.FechaAgendado=@Fecha






COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END









GO
/****** Object:  StoredProcedure [dbo].[Agendados_select_AgentesNoDisponibles]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Agendados_select_AgentesNoDisponibles]
	-- SELECCIONA  
	@NomTabla as varchar(50),
	@ReportaA as varchar(10),
	@Fecha as varchar(12),
	@hora as varchar(12)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Exec(N'select distinct t1.Personal, (t2.Nombre+' +'''  '''+ '+t2.ApellidoPaterno +' +'''  '''+ '+ t2.ApellidoMaterno) as  Nombrecompleto from '+ @NomTabla +' t1 inner join [AFT].dbo.Personal t2 on t1.Personal COLLATE DATABASE_DEFAULT=t2.Personal COLLATE DATABASE_DEFAULT INNER JOIN [AFT].[dbo].[AsesoreEstatusDuracion] t3 on t2.Personal=t3.Personal INNER JOIN [AFT].[dbo].[AsesoresEstatus] t4 on t3.idestatus=t4.idestatus where ReportaA='''+@ReportaA+''' and t2.Estatus='''+'Alta'+''' and t4.estatus='''+'Disponible'+''' and t1.Hora_Agendados= CONVERT(time,('''+@hora+''')) and t1.Fecha_Agendado = CONVERT(date,('''+@Fecha+'''))'); 

END






GO
/****** Object:  StoredProcedure [dbo].[Agendados_Select_NoVisto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Agendados_Select_NoVisto]
	-- Add the parameters for the stored procedure here
	(@CompaniaID smallInt, @ProyectoID smallint,@CampanaID smallint,
	 @AgenteID smallint, @Fecha datetime)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from ( Agendados inner join transaccion_prueba on Agendados.idtransaccion =transaccion_prueba.idtransaccion)
	where transaccion_prueba.CompañiaID= @CompaniaID and  transaccion_prueba.ProyectoID = @ProyectoID and  transaccion_prueba.CampañaID=@CampanaID and
	transaccion_prueba.AgenteID=@AgenteID and  Agendados.FechaAgendado <= @Fecha and Agendados.Atendido_Estatus= 'False'
	and Agendados.Visto_Estatus= 'False'
END







GO
/****** Object:  StoredProcedure [dbo].[AgendadosCampana_select_PersonalID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AgendadosCampana_select_PersonalID]
	-- Add the parameters for the stored procedure here
	@tablaAgendado as varchar(50),
	@empleadoID as varchar(10),
	@f1 as varchar(12),
	@f2 as varchar(12)
AS
BEGIN
DECLARE @FE1 AS VARCHAR(15);
DECLARE @FE2 AS VARCHAR(15);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @FE1=(convert(date, @f1, 103));
    SET @FE2=(convert(date, @f2, 103));
    -- Insert statements for procedure here
	Exec(N'select * from '+@tablaAgendado+' WHERE Fecha_Alta BETWEEN '''+@FE1+''' AND '''+@FE2+''' and Personal='''+@empleadoID+'''');

END






GO
/****** Object:  StoredProcedure [dbo].[AgendadosCampana_selectID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE  [dbo].[AgendadosCampana_selectID]
	-- Add the parameters for the stored procedure here
	@agendadoID AS bigint,
	@nombreTabla as varchar(50)
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC(N'SELECT * FROM '+ @nombreTabla +' WHERE Agendado='+@agendadoID);
END






GO
/****** Object:  StoredProcedure [dbo].[AgendadosCampana_update_Personal]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[AgendadosCampana_update_Personal]
	-- Add the parameters for the stored procedure here
	@agendadoID AS bigint,
	@NuevoPersonal as varchar(10),
	@NombreTabla as varchar(50)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	exec(N'UPDATE '+@NombreTabla+ ' SET Personal='''+ @NuevoPersonal+''' WHERE Agendado='+@agendadoID);
END






GO
/****** Object:  StoredProcedure [dbo].[AgendadosReasignacion_select_agenteDisponible]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AgendadosReasignacion_select_agenteDisponible]
	-- Add the parameters for the stored procedure here
	@NomTabla as varchar(50),
	@ReportaA as varchar(10),
	@Fecha as varchar(12),
	@hora as varchar(10)
AS
BEGIN
	SET NOCOUNT ON;

--Falta asignar el servidor cuando se tome el AFT real y asignas el id de la campaña correcta en la tabla AsesoresEstatusDuracion(and tab3.id_campana=9)
EXEC(N'select tab.Personal as personal, (tab2.Nombre+' +'''  '''+ '+tab2.ApellidoPaterno +' +'''  '''+ '+ tab2.ApellidoMaterno) as  Nombrecompleto from [Allsoft].[dbo].['+@NomTabla+'] tab inner join [10.128.108.50].[AFT].[dbo].[Personal] tab2 on tab.Personal  COLLATE DATABASE_DEFAULT=tab2.Personal  COLLATE DATABASE_DEFAULT inner join [10.128.108.50].[AFT].[dbo].[AsesoreEstatusDuracion] tab3 on tab2.Personal=tab3.Personal inner join [10.128.108.50].[AFT].[dbo].[AsesoresEstatus] tab4 on tab3.idestatus=tab4.idestatus where  ReportaA='''+@ReportaA+''' and tab2.Estatus='''+'Alta'+''' and tab4.estatus='''+'Disponible'+''' and tab.Fecha_Agendado = CONVERT(date,('''+@Fecha+''')) and tab.Hora_Agendados!= CONVERT(time,('''+@hora+''')) group by tab.Personal, tab2.Nombre,tab2.ApellidoPaterno,tab2.ApellidoMaterno');


--EXEC(N'select tab.Personal, (tab2.Nombre'+' '+'tab2.ApellidoPaterno'+' '+'tab2.ApellidoMaterno) as Nombrecompleto from [Allsoft].[dbo].['+@NomTabla+'] tab inner join [AFT].[dbo].[Personal] tab2 on tab.Personal  COLLATE DATABASE_DEFAULT=tab2.Personal  COLLATE DATABASE_DEFAULT inner join [AFT].[dbo].[AsesoreEstatusDuracion] tab3 on tab2.Personal=tab3.Personal inner join [AFT].[dbo].[AsesoresEstatus] tab4 on tab3.idestatus=tab4.idestatus where  ReportaA='+@ReportaA+' and tab2.Estatus=Alta and tab4.estatus=Disponible and tab.Fecha_Agendado!= CONVERT(date,('+@Fecha+')) and tab.Hora_Agendados!= CONVERT(time,('+@hora+')) group by tab.Personal, tab2.Nombre,tab2.ApellidoPaterno,tab2.ApellidoMaterno');

END







GO
/****** Object:  StoredProcedure [dbo].[AgendadosReasignacion_select_agentesMasVentas]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AgendadosReasignacion_select_agentesMasVentas]
	-- Add the parameters for the stored procedure here
	@f1 as varchar(50),
    @f2 as  varchar(50),
	@nombreDC as varchar(50),
	@nombreDV as varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
    -- Insert statements for procedure here
exec('select COUNT(tab2.Personal) as contador, tab2.Personal, (tab3.Nombre+' +'''  '''+ '+tab3.ApellidoPaterno +' +'''  '''+ '+ tab3.ApellidoMaterno) AS NombreCompleto from '+ @nombreDC+' tab1 inner join '+ @nombreDV +' tab2 on tab1.TransaccionID=tab2.TransaccionID inner join [10.128.108.50].[AFT].[dbo].[Personal] tab3 on tab3.Personal  COLLATE DATABASE_DEFAULT=tab2.Personal  COLLATE DATABASE_DEFAULT where tab2.Fecha_Alta BETWEEN '''+@f1+''' AND '''+@f2+''' group by tab2.Personal, tab3.Nombre, tab3.ApellidoPaterno, tab3.ApellidoMaterno order by contador desc');

--EXEC(N'select COUNT(tab3.Personal) as contador, tab2.Personal, (tab2.Nombre+' +'''  '''+ '+tab2.ApellidoPaterno +' +'''  '''+ '+ tab2.ApellidoMaterno) AS NombreCompleto from '+ @nombreDC+' tab1 inner join '+ @nombreDV +' tab3 on tab1.TransaccionID=tab3.TransaccionID inner join [AFT].[dbo].[Personal] tab2 on tab2.Personal  COLLATE DATABASE_DEFAULT=tab3.Personal  COLLATE DATABASE_DEFAULT where tab1.Fecha_Alta BETWEEN CONVERT(datetime,('''+@fec1+''')) AND CONVERT(datetime,('''+@fec2+''')) group by tab3.Personal, tab2.Nombre, tab2.ApellidoPaterno, tab2.ApellidoMaterno order by contador desc');
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Almacen_Campana_INSERT_Rel]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--Genera las relaciones entre las campañas y los almacenes a los que pertenecen
-- =============================================
CREATE PROCEDURE [dbo].[Alm_Almacen_Campana_INSERT_Rel]
@AlmacenID int,
@CampanaID int,
@Responsable varchar(50)
AS
DECLARE @RelacionID AS INT;

BEGIN

SET @RelacionID = (SELECT ISNULL(MAX(RelacionID),0) FROM [dbo].[Alm_Almacen_Campana]) + 1;
 
	INSERT INTO [dbo].[Alm_Almacen_Campana]
           ([RelacionID],[AlmacenID],[CampanaID],[FechaAlta],[FechaUltModificacion],[Personal],[Estatus])
     VALUES
           (@RelacionID,
            @AlmacenID, 
            @CampanaID, 
            GETDATE(),
            GETDATE(),
            @Responsable,1)
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Almacenes_GET_Almacenes]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--================================================
--Permite seleccionar los datos de los almacenes
--================================================
CREATE PROCEDURE [dbo].[Alm_Almacenes_GET_Almacenes]
AS
BEGIN
	SET NOCOUNT ON;
    SELECT * From Alm_Almacenes
	ORDER BY AlmacenID asc
END







GO
/****** Object:  StoredProcedure [dbo].[Alm_Almacenes_GET_AlmacenesID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--================================================
--Permite seleccionar los datos de los almacenes
--================================================
CREATE PROCEDURE [dbo].[Alm_Almacenes_GET_AlmacenesID]
AS
BEGIN
	SET NOCOUNT ON;
    SELECT AlmacenID, Nombre From Alm_Almacenes WHERE Estatus = 1
	ORDER BY AlmacenID asc
END







GO
/****** Object:  StoredProcedure [dbo].[Alm_Almacenes_SET_Almacenes]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================
--Permite Activar o desactivar los Almacenes de la base de datos
--====================================================
CREATE PROCEDURE [dbo].[Alm_Almacenes_SET_Almacenes]
@AlmacenID int
AS
BEGIN
DECLARE @Bandera AS INT = 0, @Estatus smallint=0, @Stock float=0

BEGIN TRAN TR_Alm_Almacenes_SET_Almacenes
BEGIN TRY
	SELECT @Stock=Stock, @Estatus=Estatus FROM Alm_Almacenes WHERE AlmacenID = @AlmacenID

	IF (@Estatus=0)
	BEGIN
		UPDATE Alm_Almacenes SET Estatus=1 WHERE AlmacenID = @AlmacenID
		SELECT Bandera=0, Msj='Almacén activado exitosamente!.'
	END
	ELSE
	BEGIN
		IF (@Stock) > 0
		BEGIN
			SELECT Bandera=-1, Msj='No se puede desactivar un almacén con Stock mayor a 0.'
		END
		ELSE
		BEGIN			
			UPDATE Alm_Almacenes SET Estatus=0 WHERE AlmacenID = @AlmacenID
			SELECT Bandera=0, Msj='Almacén desactivado exitosamente!.'
		END
	END
	
	COMMIT TRAN TR_Alm_Almacenes_SET_Almacenes
END TRY
BEGIN CATCH
	ROLLBACK TRAN TR_Alm_Almacenes_SET_Almacenes
	         SELECT Bandera=-2, Msj='Rollback tran: '+ERROR_MESSAGE()
END CATCH
END





GO
/****** Object:  StoredProcedure [dbo].[Alm_Color_GET_Color]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================
--Retorna todas los Colores con Estatus Alta
--===============================================
CREATE PROCEDURE [dbo].[Alm_Color_GET_Color]
AS
BEGIN
	SET NOCOUNT ON;
    SELECT * From Alm_Color
	ORDER BY ColorID asc
END







GO
/****** Object:  StoredProcedure [dbo].[Alm_Gama_Producto_GET_GamaProducto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=======================================================
--Permite seleccionar las Gamas de productos de la base de datos
--=======================================================

CREATE PROCEDURE [dbo].[Alm_Gama_Producto_GET_GamaProducto]

AS
BEGIN
     SELECT * FROM Alm_Gama_Producto 
	 WHERE Estatus = 1 
END





GO
/****** Object:  StoredProcedure [dbo].[Alm_Global_Campana_GET_CampanasAlmacen]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Retorna todas las campañas consumen en almacén seleccionado por el usuario
-- =============================================

CREATE PROCEDURE [dbo].[Alm_Global_Campana_GET_CampanasAlmacen]
@AlmacenID int
AS
BEGIN
SET NOCOUNT ON;
SELECT CampanaID,Nombre,Descripcion from Global_Campana
WHERE AlmacenID = @AlmacenID
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Marca_GET_Marcas]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================
--Retorna todas las Marcas con Estatus Alta
--===============================================
CREATE PROCEDURE [dbo].[Alm_Marca_GET_Marcas]
@AlmacenID int
AS
BEGIN
	SET NOCOUNT ON;
    SELECT * From Alm_Marca WHERE AlmacenID = @AlmacenID
	ORDER BY MarcaID asc
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Marca_GET_MarcasID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================
--Retorna todas las Marcas con Estatus Alta que pertenezcan al almacén proporcionado
--===============================================
CREATE PROCEDURE [dbo].[Alm_Marca_GET_MarcasID]
@AlmacenID int
AS
BEGIN
	SET NOCOUNT ON;
    SELECT MarcaID , Nombre From Alm_Marca
	WHERE AlmacenID = @AlmacenID
	ORDER BY MarcaID asc
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Material_GET_Material]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================
--Retorna todos los Materiales con Estatus Alta
--===============================================
CREATE PROCEDURE [dbo].[Alm_Material_GET_Material]
AS
BEGIN
	SET NOCOUNT ON;
    SELECT * From Alm_Material
	WHERE Estatus = 1
	ORDER BY MaterialID asc
END







GO
/****** Object:  StoredProcedure [dbo].[Alm_Material_GET_Materiales]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================
--Retorna todos los Materiales con Estatus Alta
--===============================================
CREATE PROCEDURE [dbo].[Alm_Material_GET_Materiales]
@AlmacenID int,
@MarcaID int,
@ModeloID int
AS
BEGIN
	SET NOCOUNT ON;
    SELECT * From Alm_Material
	WHERE Estatus = 1 
	AND AlmacenId = @AlmacenID
	AND MarcaID = @MarcaID
	AND ModeloID = @ModeloID
	ORDER BY MaterialID asc
END







GO
/****** Object:  StoredProcedure [dbo].[Alm_Material_GET_MaterialID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=======================================================
--Permite seleccionar Materiales de la base de datos
--=======================================================

CREATE PROCEDURE [dbo].[Alm_Material_GET_MaterialID]
@AlmacenID int,
@MarcaID int,
@ModeloID int
AS
BEGIN
SELECT MaterialID, Nombre From Alm_Material
WHERE ALmacenID = @AlmacenID AND MarcaID = @MarcaID AND ModeloID = @ModeloId

END





GO
/****** Object:  StoredProcedure [dbo].[Alm_Modelo_GET_Modelos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--================================================
--Permite seleccionar los modelos que corresponden a la Marca y el Almacen
--================================================
CREATE PROCEDURE [dbo].[Alm_Modelo_GET_Modelos]
@AlmacenID int,
@MarcaID int
AS
BEGIN
	SET NOCOUNT ON;
    SELECT * From Alm_Modelo 
	WHERE Estatus = 1 
	AND ALmacenID = @AlmacenID AND  MarcaID = @MarcaID
	ORDER BY AlmacenID asc
END







GO
/****** Object:  StoredProcedure [dbo].[Alm_Modelo_GET_ModelosID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--================================================
--Permite seleccionar los modelos que corresponden a la Marca y el Almacen
--================================================
CREATE PROCEDURE [dbo].[Alm_Modelo_GET_ModelosID]
@AlmacenID int,
@MarcaID int
AS
BEGIN
	SET NOCOUNT ON;
    SELECT ModeloID,Nombre  From Alm_Modelo 
	WHERE Estatus = 1 
	AND ALmacenID = @AlmacenID AND  MarcaID = @MarcaID
	ORDER BY AlmacenID asc
END







GO
/****** Object:  StoredProcedure [dbo].[Alm_Productos_GET_ProductosAlmacen]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Obtiene todos los productos con estatus indistinto que pertenecen a
-- al almacén indicada por el usuario
-- =============================================
CREATE PROCEDURE [dbo].[Alm_Productos_GET_ProductosAlmacen]
@AlmacenID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ProductoID,Descripcion 
	FROM  Alm_Producto
    WHERE TipoProductoID <> 4 AND AlmacenID = @AlmacenID
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Productos_GET_ProductosCampana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Obtiene todos los productos con estatus indistinto que pertenecen a
-- la campaña indicada por el usuario
-- =============================================
CREATE PROCEDURE [dbo].[Alm_Productos_GET_ProductosCampana]
@CampanaID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT p.ProductoID,p.Descripcion FROM Alm_Producto p INNER JOIN Alm_Almacen_Campana rel
    ON p.AlmacenID = rel.AlmacenID 
    WHERE  p.Estatus = 1 
	       AND p.TipoProductoID <> 4
		   AND rel.CampanaID = @CampanaID
    
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Productos_GET_Promocionales]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Obtiene todos los promocionales que corresponden
-- a la campaña indicada por el usuario
-- =============================================
CREATE PROCEDURE [dbo].[Alm_Productos_GET_Promocionales]
@CampanaID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT p.ProductoID,p.Descripcion FROM Alm_Producto p INNER JOIN Alm_Almacen_Campana rel
    ON p.AlmacenID = rel.AlmacenID 
    WHERE p.Estatus=1 
	      AND P.TipoProductoID = 4
	      AND rel.CampanaID = @CampanaID    
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Proveedor_GET_Proveedores]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=======================================================
--Permite selecionar los Proveedores de la base de datos
--=======================================================

CREATE PROCEDURE [dbo].[Alm_Proveedor_GET_Proveedores]
AS
BEGIN
SELECT *  from Alm_Proveedor
WHERE Estatus = 1
END





GO
/****** Object:  StoredProcedure [dbo].[Alm_Proveedor_INSERT_Proveedor]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=======================================================
--Permite agregar Proveedores de productos a la base de datos
--=======================================================

CREATE PROCEDURE [dbo].[Alm_Proveedor_INSERT_Proveedor]
@Nombre varchar(250),
@Descripcion varchar(500),
@Direccion varchar(500),
@TelOficina varchar(15),
@TelCelular varchar(15),
@RFC varchar(10)


AS
BEGIN
DECLARE @bandera AS INT = (SELECT 0)
DECLARE @ProveedorID AS INT 
SELECT  @ProveedorID = (SELECT MAX(ProveedorID) 
                       FROM Alm_Proveedor) + 1

BEGIN TRAN TR_INSERT_Proveedor
BEGIN TRY
         IF NOT EXISTS (SELECT Nombre FROM [Alm_Proveedor]  
                        WHERE Nombre = @Nombre)
         BEGIN
             INSERT INTO [dbo].[Alm_Proveedor]
                    ([ProveedorID],[Nombre],[Descripcion],[Direccion],[TelOficina],[TelCelular],[RFC],[FechaAlta],[FechaUltModificacion]
                    ,[Estatus])
             VALUES
                   (@ProveedorID,UPPER(@Nombre),UPPER(@Descripcion),UPPER(@Direccion),@TelOficina,@TelCelular,@RFC,GETDATE(),GETDATE(),1)
             SELECT Bandera=0, Msj='Proveedor registrado exitosamente!.'
         END
            ELSE
                BEGIN
                SELECT Bandera=-1, Msj='Proveedor registrado anteriormente, verifique información!!'
                END
COMMIT TRAN TR_INSERT_Proveedor
END TRY
BEGIN CATCH
  ROLLBACK TRAN TR_INSERT_Proveedor 
           SELECT Bandera =-2 , Msj= 'Rollback tran: ' + ERROR_MESSAGE()
END CATCH
END





GO
/****** Object:  StoredProcedure [dbo].[Alm_Subalmacen_GET_Subalmacen]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Permite seleccionar todos los subalamcenes 
-- =============================================
CREATE PROCEDURE [dbo].[Alm_Subalmacen_GET_Subalmacen]

AS
BEGIN

	SET NOCOUNT ON;

	SELECT * From Alm_Subalmacen
    WHERE Estatus = 1
END






GO
/****** Object:  StoredProcedure [dbo].[Alm_Subalmacen_INSERT_Subalmacen]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=======================================================
--Permite agregar Subalmacenes a la base de datos
--=======================================================

CREATE PROCEDURE [dbo].[Alm_Subalmacen_INSERT_Subalmacen]
@AlmacenID int,
@Nombre varchar(150),
@Descripcion varchar(500),
@Tipo varchar(50)
AS
BEGIN
DECLARE @bandera AS INT = (SELECT 0)
DECLARE @SubAlmacenID AS INT 
SELECT  @SubAlmacenID = (SELECT MAX(SubAlmacenID) 
                         FROM Alm_Subalmacen) + 1

BEGIN TRAN TR_INSERT_Subalmacen
BEGIN TRY
         IF NOT EXISTS (SELECT Nombre FROM Alm_Subalmacen  
                        WHERE Nombre = @Nombre)
         BEGIN
             INSERT INTO [dbo].[Alm_Subalmacen]
                   ([SubAlmacenID],[AlmacenID],[Nombre],[Descripcion],[FechaAlta],
				    [FechaUltModificacion],[Tipo],[Estatus])
             VALUES
                   (@SubAlmacenID,@AlmacenID,UPPER(@Nombre),UPPER(@Descripcion),GETDATE(),GETDATE(),
                    UPPER(@Tipo),1)
             SELECT Bandera=0, Msj='SubAlmacen registrado exitosamente'
         END
            ELSE
                BEGIN
                SELECT Bandera=-1, Msj='SubAlmacen registrado anteriormente, verifique información!!'
                END
COMMIT TRAN TR_INSERT_Subalmacen
END TRY
BEGIN CATCH
  ROLLBACK TRAN TR_INSERT_Subalmacen 
           SELECT Bandera =-2 , Msj= 'Rollback tran: ' + ERROR_MESSAGE()
END CATCH
END





GO
/****** Object:  StoredProcedure [dbo].[Almacen_Agregar_Articulos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para inserción de artículos en el almacén>
-- =============================================

CREATE PROCEDURE [dbo].[Almacen_Agregar_Articulos] 
@Cantidad int,
@CatalogoTipoEquipoID varchar(50),
@Material varchar(50),
@CatalogoMarcaID varchar(50),
@CatalogoModeloID varchar(50),
@CatalogoEstatusID varchar(50),
@ArticuloPromocional varchar(300),
@NombreCampana varchar(50)

AS
BEGIN

	SET NOCOUNT ON;

DECLARE @CantidadAuxiliar INT
SET @CantidadAuxiliar = 0

---Ciclo de iteraciones para agregar n cantidad de artículos, se dan de alta de este modo 
---para poder identificarlos uno por uno durante todo el proceso de venta

WHILE (@CantidadAuxiliar < @Cantidad)

BEGIN

	INSERT INTO [dbo].[Almacen_Catalogo_Articulos]

           ([CatalogoTipoEquipoID]
		   ,[Material]
           ,[CatalogoMarcaID]
           ,[CatalogoModeloID]
           ,[CatalogoEstatusID]
           ,[ArticuloPromocional]
		   ,[NombreCampana])
     VALUES
           (@CatalogoTipoEquipoID,
		    @Material,
		    @CatalogoMarcaID,
			@CatalogoModeloID, 
            @CatalogoEstatusID,
			@ArticuloPromocional,
			@NombreCampana)

SET @CantidadAuxiliar = @CantidadAuxiliar + 1
END
END






GO
/****** Object:  StoredProcedure [dbo].[Almacen_Agregar_Familias]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para inserción de familias de artículos en el almacén>
-- =============================================

CREATE PROCEDURE [dbo].[Almacen_Agregar_Familias] 

	@NombreFamilia varchar(100),
	@CatalogoEstatusID int,
	@CatalogoProveedorID int,
	@Prefijo nchar(10)

AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO [dbo].[Almacen_Catalogo_Familia]
           ([NombreFamilia]
           ,[CatalogoEstatusID]
           ,[CatalogoProveedorID]
           ,[Prefijo])
     VALUES
           (@NombreFamilia,
            @CatalogoEstatusID,
            @CatalogoProveedorID,
            @Prefijo)
END






GO
/****** Object:  StoredProcedure [dbo].[Almacen_Agregar_Marcas]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para inserción de Marcas de artículos en el almacén>
-- =============================================

CREATE PROCEDURE [dbo].[Almacen_Agregar_Marcas] 
@NombreMarca varchar(100)
--@CatalogoMarcaID int,
--@NombreMarca varchar(100),
--@CatalogoEstatusID int,
--@CatalogoFamiliaID int,
--@Prefijo nchar(10),
--@TipoEquipoID int

AS
BEGIN

	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT NombreMarca 
	               FROM Almacen_Catalogo_Marca
				   WHERE NombreMarca = @NombreMarca)
    BEGIN
	INSERT INTO [dbo].[Almacen_Catalogo_Marca]
           --([CatalogoMarcaID],[NombreMarca],[CatalogoEstatusID],[CatalogoFamiliaID],[Prefijo],[TipoEquipoID])
		   (NombreMarca,CatalogoEstatusID,CatalogoFamiliaID,Prefijo)
    VALUES
           --(@CatalogoMarcaID,@NombreMarca,@CatalogoEstatusID,@CatalogoFamiliaID,@Prefijo,@TipoEquipoID)
		   (@NombreMarca,1,1,'AA')
	END
END






GO
/****** Object:  StoredProcedure [dbo].[Almacen_Agregar_Modelos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para inserción de Modelos de artículos en el almacén>
-- =============================================

CREATE PROCEDURE [dbo].[Almacen_Agregar_Modelos] 
@NombreModelo varchar(100),
@CatalogoMarcaID varchar(100)
AS
BEGIN

	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT NombreModelo 
	               FROM Almacen_Catalogo_Modelo
				   WHERE NombreModelo = @NombreModelo)
    BEGIN
	INSERT INTO [dbo].[Almacen_Catalogo_Modelo]
           ([NombreModelo]
           ,[CatalogoEstatusID]
           ,[CatalogoMarcaID]
           ,[CatalogoFamiliaID]
           ,[Prefijo]
           ,[Descripcion]
           ,[Capacidad]
           ,[Color])
     VALUES
           (@NombreModelo
           ,1
           ,@CatalogoMarcaID
           ,1
           ,'AA'
           ,@NombreModelo
           ,''
           ,'')
END
END





GO
/****** Object:  StoredProcedure [dbo].[Almacen_Agregar_Pedidos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para inserción de pedidos de artículos>
-- =============================================

CREATE PROCEDURE [dbo].[Almacen_Agregar_Pedidos] 
@Material varchar(50),
@Estatus varchar(50),
@Descripcion varchar(150),
@Existencias int,
@Pedido int,
@Campana varchar(100)

AS
BEGIN

	SET NOCOUNT ON;

INSERT INTO [dbo].[Almacen_Pedido]
           ([Material]
           ,[Estatus]
           ,[Descripcion]
           ,[Existencias]
           ,[Pedido]
           ,[Campana]
		   ,[Autorizado])
     VALUES
           (@Material,@Estatus,@Descripcion,@Existencias,@Pedido,@Campana,0)
END





GO
/****** Object:  StoredProcedure [dbo].[Almacen_AgregarInventario]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <23-06-2015>
-- Description:	<Permite agregar un artículo al inventario>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_AgregarInventario]
	 @CatalogoTipoEquipoID int,
	 @CatalogoMarcaID int,
	 @CatalogoModeloID int,
	 @CatalogoEstatusID int,
	 @ArticuloPromocional varchar(300),
	 @PlanFinanciamientoID int,
	 @NombreCampana varchar(50)
AS
BEGIN

	SET NOCOUNT ON;
	
INSERT INTO [dbo].[Almacen_Catalogo_Articulos]
       (--[CatalogoArticuloID],
           [CatalogoTipoEquipoID],[CatalogoMarcaID],[CatalogoModeloID],[CatalogoEstatusID],
           [ArticuloPromocional],[PlanFinanciamientoID],[NombreCampana])
     VALUES
           (--<CatalogoArticuloID, int,>,
            @CatalogoTipoEquipoID,@CatalogoMarcaID,@CatalogoModeloID, @CatalogoEstatusID,
			@ArticuloPromocional,@PlanFinanciamientoID,@NombreCampana)
END








GO
/****** Object:  StoredProcedure [dbo].[Almacen_Articulos_Detalle]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene el detalle de todos los Artículos dados de Alta en el Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Articulos_Detalle]
--@TopRegistros int

AS
BEGIN
	SET NOCOUNT ON;
    
	--select top(@TopRegistros)  TE.TipoEquipo as TipoEquipo,
	--                CatalogoArticuloID,ArticuloPromocional,
	--                M.NombreMarca as Marca,
	--				F.NombreFamilia as Familia,
 --                   Mo.NombreModelo as Modelo,
	--				E.NombreEstatus as Estatus

	--from Almacen_Catalogo_Articulos as CA

	--inner join Almacen_Catalogo_TipoEquipo as TE on CA.CatalogoTipoEquipoID = TE.CatalogoTipoEquipoID --TipoEquipo
	--inner join Almacen_Catalogo_Marca as M	on CA.CatalogoMarcaID = M.CatalogoMarcaID    --Marca
	--inner join Almacen_Catalogo_Familia F on CA.CatalogoFamiliaID = F.CatalogoFamiliaID  --Familia
	--inner join Almacen_Catalogo_Modelo Mo on CA.CatalogoModeloID = Mo.CatalogoModeloID   --Modelo
	--inner join Almacen_Catalogo_Estatus E on CA.CatalogoEstatusID = E.CatalogoEstatusID  --Estatus
 --   where CA.CatalogoModeloID = @CatalogoModeloID
      select * from Almacen_Catalogo_Articulos 
END







GO
/****** Object:  StoredProcedure [dbo].[Almacen_Articulos_Detalle_Serie]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene el detalle de un artículo con una serie asignada en el Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Articulos_Detalle_Serie]
@NumeroSerie int

AS
BEGIN
	SET NOCOUNT ON;
    
      select * from Almacen_Catalogo_Articulos 
	  where CatalogoArticuloID = @NumeroSerie
END






GO
/****** Object:  StoredProcedure [dbo].[Almacen_CargarSeriesPrepago]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para inserción de datos en el almacén Prepago>
-- =============================================

CREATE PROCEDURE [dbo].[Almacen_CargarSeriesPrepago] 
@Material varchar(50),
@CatalogoMarcaID varchar(50),
@CatalogoEstatusID varchar(50),
@Descripcion varchar(50),
@Serie varchar(100),
@DescripcionExtra varchar(100),
@Operador varchar(100)

AS
BEGIN

	SET NOCOUNT ON;
	
INSERT INTO [dbo].[Almacen_Prepago]
           ([Material],[CatalogoMarcaID],[CatalogoEstatusID],[Descripcion],[Serie],[DescripcionExtra],[Operador])
VALUES
      (@Material,@CatalogoMarcaID,@CatalogoEstatusID,@Descripcion,@Serie,@DescripcionExtra,@Operador)

END







GO
/****** Object:  StoredProcedure [dbo].[Almacen_Editar_ArticulosSerie]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para modificar artículos según la serie asignada por el almacén>
-- =============================================

CREATE PROCEDURE [dbo].[Almacen_Editar_ArticulosSerie] 
@CatalogoArticuloID int,
@CatalogoTipoEquipoID varchar(50),
@CatalogoMarcaID varchar(50),
@CatalogoModeloID varchar(50),
@CatalogoEstatusID varchar(50),
@ArticuloPromocional varchar(300),
@NombreCampana varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

UPDATE 
      [dbo].[Almacen_Catalogo_Articulos]
  SET [CatalogoTipoEquipoID] = @CatalogoTipoEquipoID,
      [CatalogoMarcaID] = @CatalogoMarcaID,
      [CatalogoModeloID] = @CatalogoModeloID,
      [CatalogoEstatusID] = @CatalogoEstatusID,
      [ArticuloPromocional] = @ArticuloPromocional,
	  [NombreCampana] = @NombreCampana
 WHERE CatalogoArticuloID = @CatalogoArticuloID
END







GO
/****** Object:  StoredProcedure [dbo].[Almacen_Editar_AutorizacionPedido]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para AUtorizar los pedidos seleccionados por el usuario>
-- =============================================

CREATE  PROCEDURE [dbo].[Almacen_Editar_AutorizacionPedido]
@AlmacenPedidoID int,
@Autorizado varchar(50)

AS
BEGIN

	SET NOCOUNT ON;

UPDATE 
      [dbo].[Almacen_Pedido]
  SET Autorizado =@Autorizado
  WHERE AlmacenPedidoID = @AlmacenPedidoID
END


select * from Almacen_Pedido





GO
/****** Object:  StoredProcedure [dbo].[Almacen_Editar_Pedido]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcantara>
-- Create date: <07_07_2015>
-- Description:	<Procedimiento para modificar los pedidos seleccionados por el usuario>
-- =============================================

CREATE  PROCEDURE [dbo].[Almacen_Editar_Pedido] 
@AlmacenPedidoID int,
@Pedido varchar(50),
@Campana varchar(50)

AS
BEGIN

	SET NOCOUNT ON;

UPDATE 
      [dbo].[Almacen_Pedido]
  SET Pedido = @Pedido, Campana=@Campana
  WHERE AlmacenPedidoID = @AlmacenPedidoID
END






GO
/****** Object:  StoredProcedure [dbo].[Almacen_Inventario_Series]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene el detalle de todos las series dadas de Alta en el Almacén de Prepago>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Inventario_Series]
--@TopRegistros int

AS
BEGIN
	SET NOCOUNT ON;
    
      select * from Almacen_Prepago 
END





GO
/****** Object:  StoredProcedure [dbo].[Almacen_Leer_Campana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene los nombres de todas las Campañas dadas de Alta en el Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Leer_Campana]
AS
BEGIN
	SET NOCOUNT ON;
    SELECT [CampanaID]
      ,[ProyectoID]
      ,[CompaniaID]
      ,[TipoCampanaID]
      ,[Nombre]
      ,[Descripcion]
      ,[MetaVentas]
      ,[Archivo]
      ,[Fecha_Alta]
      ,[Fecha_Baja]
      ,[Estado]
  FROM [dbo].[Global_Campana]
  WHERE Estado=1
END







GO
/****** Object:  StoredProcedure [dbo].[Almacen_Obtener_Estatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene los nombres de todos los Estatus dados de Alta en el Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Obtener_Estatus]
AS
BEGIN
	SET NOCOUNT ON;
    select * from Almacen_Catalogo_Estatus
END







GO
/****** Object:  StoredProcedure [dbo].[Almacen_Obtener_Familias]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene los nombres de todas las Familias dadas de Alta en el Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Obtener_Familias]
AS
BEGIN
	SET NOCOUNT ON;
    select * from Almacen_Catalogo_Familia
END








GO
/****** Object:  StoredProcedure [dbo].[Almacen_Obtener_Marcas]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene los nombres de todas las Marcas dadas de Alta en el Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Obtener_Marcas]
AS
BEGIN
	SET NOCOUNT ON;
    select * from Almacen_Catalogo_Marca
	order by NombreMarca asc
END







GO
/****** Object:  StoredProcedure [dbo].[Almacen_Obtener_Modelos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene los nombres de todas las Marcas dadas de Alta en el Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Obtener_Modelos]
AS
BEGIN
	SET NOCOUNT ON;
    select * from Almacen_Catalogo_Modelo
END







GO
/****** Object:  StoredProcedure [dbo].[Almacen_Obtener_Pedidos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene la lista de Pedidos realizados por las campañas de Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Obtener_Pedidos]
--@TopRegistros int

AS
BEGIN
	SET NOCOUNT ON;
        select * from Almacen_Pedido
END






GO
/****** Object:  StoredProcedure [dbo].[Almacen_Obtener_PedidosDetalle]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene la lista de Pedidos realizados por las campañas de Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Obtener_PedidosDetalle]
@AlmacenPedidoID int

AS
BEGIN
	SET NOCOUNT ON;
        select * from Almacen_Pedido
		where AlmacenPedidoID = @AlmacenPedidoID
END






GO
/****** Object:  StoredProcedure [dbo].[Almacen_Obtener_TipoEquipo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene los Tipos de Equipo dadas de Alta en el Almacén>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Obtener_TipoEquipo]
AS
BEGIN
	SET NOCOUNT ON;
    select * from Almacen_Catalogo_TipoEquipo
END








GO
/****** Object:  StoredProcedure [dbo].[Almacen_Pospago_GetData]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Almacen_Pospago_GetData]
@Opc int=0, @Campaign varchar(50)=''
AS
BEGIN
	if @Opc = 0
	begin
		select * from [dbo].[Almacen_Catalogo_Articulos] where NombreCampana=@Campaign
	end
END 






GO
/****** Object:  StoredProcedure [dbo].[Almacen_Prepago_Detalle_Serie]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Karina Flores Alcántara>
-- Create date: <2015-06-24>
-- Description:	<Obtiene el detalle de un artículo con una serie asignada en el Almacén Prepago>
-- =============================================
CREATE PROCEDURE [dbo].[Almacen_Prepago_Detalle_Serie]
@NumeroSerie varchar(50)

AS
BEGIN
	SET NOCOUNT ON;
    
      select * from Almacen_Prepago 
	  where Serie = @NumeroSerie
END





GO
/****** Object:  StoredProcedure [dbo].[Almacen_SetInvTransaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Almacen_SetInvTransaccion]
@Area varchar(50)='',@CampanaID int=0,@TransaccionID int=0,@ArticuloID int=0, @PlanID varchar(50)='', @Responsable varchar(20)=''
AS
BEGIN
	BEGIN TRAN TR_Almacen_SetInvTransaccion
	BEGIN TRY
		INSERT INTO InventarioTransacciones(Area,CampanaID,TransaccionID,ArticuloID,PlanID,Responsable,Capturado,Estatus) VALUES(@Area,@CampanaID,@TransaccionID,@ArticuloID,@PlanID,@Responsable,GETDATE(),1)
		IF @Area = 'POSPAGO'
		BEGIN 
			UPDATE Almacen_Catalogo_Articulos SET CatalogoEstatusID='APARTADO' WHERE CatalogoArticuloID=@ArticuloID
		END
		IF @Area = 'PREPAGO'
		BEGIN 
			UPDATE Almacen_Prepago SET CatalogoEstatusID='APARTADO' WHERE AlmacenPrepagoID=@ArticuloID
		END
		COMMIT TRAN TR_Almacen_SetInvTransaccion
		SELECT Res=1, Way='Successful Transaction!'
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN TR_Almacen_SetInvTransaccion
		SELECT Res=0, Way='Rollback: ' + ERROR_MESSAGE()
	END CATCH
END






GO
/****** Object:  StoredProcedure [dbo].[AsignarVentaCampana_update_Personal]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE  [dbo].[AsignarVentaCampana_update_Personal]
	-- Add the parameters for the stored procedure here
	@transaccionID AS bigint,
	@NuevoPersonal as varchar(10),
	@NombreTabla as varchar(50)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	exec(N'UPDATE '+@NombreTabla+ ' SET Personal='''+ @NuevoPersonal+''' WHERE TransaccionID='+@transaccionID);
END



GO
/****** Object:  StoredProcedure [dbo].[Borrar_Respaldo_Transaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Borrar_Respaldo_Transaccion]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int,@ModuloID as int, @Personal as varchar(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update RespaldoAllsoft set Respaldo= null
	where  CampanaID=@CampanaID and Personal=@Personal and ModuloID= @ModuloID

END





GO
/****** Object:  StoredProcedure [dbo].[Busqueda_AgendadoAMD]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Busqueda_AgendadoAMD]
	 @campana as varchar(100),
	 @personal as varchar (10),
	 @ano as varchar(4),
	 @mes as varchar(20)
	 
	 
	 
AS
BEGIN
Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	SET NOCOUNT ON;
	declare @nomtabla as varchar (200)
	declare @consulta as nvarchar(max)
	declare @idcampana as varchar(20)
	
	--set @personal = 'E009925'
	--set @año = 2015
	--set @campana =
	--set @mes = 08
	--set @dia = 28

    set @idcampana = (select CampanaID from Global_TablasCampana where CampanaID=@campana)
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID=@campana)
	
    set @consulta=N'(SELECT  Agendado,TransaccionID,CompaniaID,ProyectoID,CampanaID,Personal,YEAR(Fecha_Agendado) as ANOS, MONTH(Fecha_Agendado) as MES , DAY(Fecha_Agendado) as DIA  from dbo.Agendados_Cliente_excelente where YEAR(Fecha_Agendado) = ' + @ano +' and MONTH(Fecha_Agendado) = '+ @mes +' and CampanaID = '+@campana +' and CompaniaID = 1 and Personal = ''' + @personal +''')'
	--select (@consulta)
	exec (@consulta)
	--SELECT  Agendado,TransaccionID,CompaniaID,ProyectoID,CampanaID,PersonalID,YEAR(Fecha_Agendado) as ANOS, MONTH(Fecha_Agendado) as MES , DAY(Fecha_Agendado) as DIA  from dbo.Agendados_Cliente_excelente where MONTH(Fecha_Agendado) = 7 and CampanaID = 1 and CompaniaID = 1 and PersonalID =1
	COMMIT TRAN Tadd
    SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	--select @msg

END







GO
/****** Object:  StoredProcedure [dbo].[Busqueda_Agendados_Dia]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Busqueda_Agendados_Dia]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	SET NOCOUNT ON;
	declare @dia as varchar(20), @mes as varchar(20), @hora as varchar(10)
	declare @campana as varchar(100)
	declare @nomtabla as varchar (200)
	declare @consulta as varchar(max)
	declare @idcampana as varchar(20)

	set @campana = 5
	set @mes = 07
	set @dia = 28
    set @idcampana = (select CampanaID from Global_TablasCampana where CampanaID=@campana)
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID=5)
    -- Insert statements for procedure here 
	SET @consulta=' SELECT Agendado,TransaccionID,CompaniaID,ProyectoID,CampanaID,PersonalID,YEAR(Fecha_Agendado) as ANOS, MONTH(Fecha_Agendado) as MES, DAY(Fecha_Agendado) as DIA from '+ @nomtabla +' where day(Fecha_Agendado) = ' + @dia + '  and MONTH(Fecha_Agendado) = '+ @mes +'  
	and CampanaID = 1 and CompaniaID = 1 and PersonalID =1'
	--select (@consulta)
	exec (@consulta)




	COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	--select @msg

END







GO
/****** Object:  StoredProcedure [dbo].[BUSQUEDA_PORHORA]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BUSQUEDA_PORHORA] 
	-- Add the parameters for the stored procedure here
	@campana as varchar(100),
	@personal as varchar(10),
	@anos as varchar(4),
	@mes as varchar(2),
	@dia as varchar(2)
	--@hora as varchar(8) 
AS
BEGIN
Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd                                                                   
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	SET NOCOUNT ON;
	
	
	declare @nomtabla as varchar (200)
	declare @consulta as varchar(max)
	declare @idcampana as varchar(20)
	
	

    set @idcampana = (select CampanaID from Global_TablasCampana where CampanaID=@campana)
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID = @campana)
	set @consulta = N'(SELECT Agendado,TransaccionID,Personal,YEAR(Fecha_Agendado) as ANOS, MONTH(Fecha_Agendado) as MES, DAY(Fecha_Agendado) as DIA, DATEPART( hour , Hora_Agendados )as HORAs, DATEPART(MINUTE,Hora_Agendados) AS MINUTOS
	from ' + @nomtabla +' where day(Fecha_Agendado)= '+ @dia + ' and YEAR(Fecha_Agendado) = ' +  @anos + ' and MONTH(Fecha_Agendado) = ' + @mes + ' and CampanaID = ' + @campana+ ' and Personal = '''+@personal+''')';
	--select (@consulta)
	--SELECT Agendado,TransaccionID,CompaniaID,ProyectoID,CampanaID,PersonalID,YEAR(Fecha_Agendado) as ANOS, MONTH(Fecha_Agendado) as MES, DAY(Fecha_Agendado) as DIA, convert(varchar (5),Hora_Agendados) as HORA, DATEPART( hour , Hora_Agendados )as HORAs, DATEPART(mi,Hora_Agendados) AS MINUTOS
	--from Agendados_Campana_nueva1 where day(Fecha_Agendado)= 28 and MONTH(Fecha_Agendado) = 07 and CampanaID =  1 and CompaniaID = 1 and PersonalID = 1;
	
	--select (@consulta)
	exec (@consulta)

	COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END







GO
/****** Object:  StoredProcedure [dbo].[CalendarioMensajeria_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[CalendarioMensajeria_update] 
	-- Add the parameters for the stored procedure here
	@ID as smallint,
	@dv as tinyint,
	@dp as tinyint,
	@dem as tinyint,
	@dec as tinyint,
	@corte as tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update Catalogo_CalendarioMensajeria set DiaVenta=@dv, DiaPortabilidad=@dp, DiaEntregaMensajeria=@dem, DiaEntregaCliente=@dec, Corte=@corte,FecBaja=default where CalendarioMensajeriaID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CalendarioMensjeria_CambioEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CalendarioMensjeria_CambioEstatus] 
	-- Add the parameters for the stored procedure here
	@ID as smallint
AS
declare @est bit;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @est=(select estatus from Catalogo_CalendarioMensajeria where CalendarioMensajeriaID=@ID);
	if(@est=1)
		update Catalogo_CalendarioMensajeria set estatus=0, FecBaja=default where CalendarioMensajeriaID=@ID
	else
	update Catalogo_CalendarioMensajeria set estatus=1,FecBaja=default where CalendarioMensajeriaID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CalendariosMensajeria_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CalendariosMensajeria_insert]
	-- Add the parameters for the stored procedure here
	
	@proveedor as int,
	@dVenta as tinyint,
	 @dPorta as tinyint,
	 @dEntregaMensajeria as tinyint,
	 @dEntregaCliente as tinyint,
	 @corte as tinyint
AS
BEGIN
declare @id smallint;
declare @idCat int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @idCat=(select CatalogoID FROM CatalogoItem where CatalogoItemID=@proveedor);
	set @id=(select ISNULL(max(CalendarioMensajeriaID),0) from Catalogo_CalendarioMensajeria)+1;
	insert into Catalogo_CalendarioMensajeria(CalendarioMensajeriaID, CatalogoID_P, ProvedorMensajeriaID, DiaVenta, DiaPortabilidad, DiaEntregaMensajeria, DiaEntregaCliente, Corte)values(@id, @idCat,@proveedor, @dVenta, @dPorta, @dEntregaMensajeria, @dEntregaCliente, @corte)
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CalendariosMensajeria_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CalendariosMensajeria_select]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- Insert statements for procedure here
	select Catalogo_CalendarioMensajeria.*, CatalogoItem.Nombre as proveedor from Catalogo_CalendarioMensajeria inner join CatalogoItem on Catalogo_CalendarioMensajeria.ProvedorMensajeriaID=CatalogoItem.CatalogoItemID
END







GO
/****** Object:  StoredProcedure [dbo].[CalendariosMensajeria_select_Proveedor]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CalendariosMensajeria_select_Proveedor]
	-- Add the parameters for the stored procedure here
	@cp as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- Insert statements for procedure here
	select CatalogoItem.Nombre as proveedor, estado.Nombre as estadoN, Catalogo_CoberturaMensajeria.*, Catalogo_CalendarioMensajeria.* from Catalogo_CalendarioMensajeria inner join CatalogoItem on Catalogo_CalendarioMensajeria.ProvedorMensajeriaID=CatalogoItem.CatalogoItemID inner join Catalogo_CoberturaMensajeria on Catalogo_CoberturaMensajeria.ProvedorMensajeriaID=CatalogoItem.CatalogoItemID inner join CatalogoItem estado on Catalogo_CoberturaMensajeria.EstadoID=estado.CatalogoItemID where CP=@cp
END







GO
/****** Object:  StoredProcedure [dbo].[CalendariosMensajeria_selectID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CalendariosMensajeria_selectID]
	-- Add the parameters for the stored procedure here
	@Calendario AS smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- Insert statements for procedure here
	select Catalogo_CalendarioMensajeria.*, CatalogoItem.Nombre as proveedor from Catalogo_CalendarioMensajeria inner join CatalogoItem on Catalogo_CalendarioMensajeria.ProvedorMensajeriaID=CatalogoItem.CatalogoItemID where CalendarioMensajeriaID=@Calendario
END







GO
/****** Object:  StoredProcedure [dbo].[campaña all-soft de ventas_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[campaña all-soft de ventas_Insert] @Transaccionid BIGINT AS BEGIN SET NOCOUNT ON;
			                  INSERT INTO [dbo].[campaña all-soft de ventas](TransaccionID) VALUES (@Transaccionid) END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_ActualizaProfecos_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		danya justop
-- Create date: 06072015
-- Description:	inserta numeros profeco desde un excel
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_ActualizaProfecos_Insert] 
	-- Add the parameters for the stored procedure here
	@NombreTabla as varchar(max),@CompaniaID as int,@ProyectoID as int,@CampanaID as int, @datoProfeco as varchar(max),@fecha as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Consulta as nvarchar(max)
	SET @Consulta= 'DECLARE @ID AS INT
	SET @ID=(SELECT ISNULL(MAX(Datoid),0) FROM '+@NombreTabla+')+1;
	INSERT INTO '+@NombreTabla+ ' (Datoid,CompaniaID,ProyectoID,CampanaID,Telefono,Fecha) 
	VALUES(@ID, '+ CONVERT(VARCHAR(5),@CompaniaID)+ ', '+ CONVERT(VARCHAR(5),@ProyectoID)+ ', '+ CONVERT(VARCHAR(5),@CampanaID)+ ', '+@datoProfeco+ ', CONVERT(DATETIME,'''+@fecha+'''))'
	select (@Consulta)
	EXEC(@Consulta)
END







GO
/****** Object:  StoredProcedure [dbo].[Cargas_AsignarAPersonal_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DANYA JUSTO
-- Create date: 26082015
-- Description:	PERMITE ASIGNAR LOS NUMEROS QUE HAN SIDO CARGADOS DE UN EXCEL A CIERTO AGENTE EN ESPECIAL
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_AsignarAPersonal_update]
	-- Add the parameters for the stored procedure here
	@nombreTablaDato as varchar(max),@dbHistorialID as int,@personal  as varchar(10),@minimo as Varchar(max),@maximo as varchar(max)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  --declare @maximo VARCHAR(MAX)
  --declare @minimo VARCHAR(MAX)
  declare @consulta nvarchar (max)
  --set @maximo=N'(SELECT MAX(DatoID) FROM '+ @nombreTablaDato +' WHERE DBHistorialID='+CONVERT(VARCHAR(5),@dbHistorialID)+')'
  
  ---set @minimo=N'(SELECT MIN(DatoID) FROM '+ @nombreTablaDato +' WHERE DBHistorialID='+CONVERT(VARCHAR(5),@dbHistorialID)+')'
  set @consulta= N' UPDATE '+@nombreTablaDato+' SET AsignadoA='''+CONVERT(VARCHAR(10),@personal)+''' WHERE ( DatoID BETWEEN '+ @minimo + ' AND ' + @maximo+') AND DBHistorialID='+CONVERT(VARCHAR(5),@dbHistorialID)
  
  EXEC (@consulta)
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_ConfiguracionStatusLlamada_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_ConfiguracionStatusLlamada_Insert]
	-- Add the parameters for the stored procedure here
	@llamadaStatus SMALLINT,
	@llamadaSubestatus SMALLINT,
	@llamadaTipificasion SMALLINT,
	@compania SMALLINT,
	@proyecto SMALLINT,
	@campana SMALLINT,
	@nivel4 SMALLINT,
	@regla SMALLINT,
	@procede BIT
	
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @idconfig AS BIGINT;
	DECLARE @idNumConfig as bigint
	DECLARE @msg AS NVARCHAR(100)
	DECLARE @tablaDato as varchar(max)
	DECLARE @update as varchar (max)
	BEGIN TRAN Transaccion

		BEGIN TRY

			SET @idconfig =(SELECT ISNULL(MAX(ConfiguracionID),0) FROM dbo.Global_ConfiguracionStatusLlamadaBase) + 1;
			SET @idNumConfig=(SELECT ISNULL(MAX(NumeroConfiguracion),0) FROM dbo.Global_ConfiguracionStatusLlamadaBase)+1;
			SELECT (@idNumConfig)
			INSERT INTO dbo.Global_ConfiguracionStatusLlamadaBase(ConfiguracionID, NumeroConfiguracion,LlamadaStatusID, LlamadaSubestatusID, LlamadaTipificacionID, CompaniaID, ProyectoID, CampanaID, LlamadaStatus4ID, ReglaID, Procede) VALUES (@idconfig, @idNumConfig,@llamadaStatus, @llamadaSubestatus, @llamadaTipificasion, @compania, @proyecto, @campana, @nivel4, @regla, @procede)
			

			SELECT 'Guardado Exitoso.' AS Mensaje

			--SELECT 1 AS Valor

			--SELECT * FROM dbo.Global_ConfiguracionStatusLlamadaBase
			--SELECT @msg AS mensaje

			COMMIT TRAN Transaccion

		 END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN Transaccion
			SELECT 'Ocurrio un Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.' AS Mensaje
			SELECT 0 AS Valor
		END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[Cargas_ConfiguracionStatusLlamada_Select_nombres]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		danua justo
-- Create date: 30/09/2015
-- Description:	selecciona los filtros y sus reglas
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_ConfiguracionStatusLlamada_Select_nombres]
	-- Add the parameters for the stored procedure here
	@idCompania as int,@idProyecto as int,@idCampana as int, @idbase as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRAN Transaccion

		BEGIN TRY

SELECT l.ConfiguracionID,l.llamadastatusid,l.llamadasubestatusid,l.llamadatipificacionid,l.LlamadaStatus4ID,r.ReglaID,c.nombre as nombreStatusID,g.nombre as nombreSubstatusID,t.nombre as nombreTipificacionID,s.nombre as nombreStatus4ID,procede,r.descripcion as nombreReglaID,l.Status FROM dbo.Global_ConfiguracionStatusLlamadaBase as l 
inner join Global_LlamadaStatus as c on l.llamadastatusid=c.llamadastatusid 
inner join Global_LlamadaSubestatus as g on l.llamadasubestatusid=g.llamadasubestatusid
inner join Global_LlamadaTipificacion as t on l.llamadatipificacionid=t.llamadatipificacionid
inner join Global_LlamadaStatusNivel4 as s on l.llamadastatus4id=s.llamadastatus4id
inner join Global_ReglasStatus as r on l.reglaid=r.reglaid
WHERE CompaniaID =@idCompania AND ProyectoID =@idProyecto AND CampanaID = @idCampana AND l.dbhistorialid=@idbase

SELECT 'Consulta Exitosa.' AS Mensaje

COMMIT TRAN Transaccion

		 END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN Transaccion
			SELECT 'Ocurrio un Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.' AS Mensaje
			SELECT 0 AS Valor
		END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[Cargas_consultaFiltroActivo_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DANYA JUSTO
-- Create date: 13/08/2015
-- Description:	RECIBE EL ID DE LA BASE SELECCIONADA Y CONSULTA EL FILTRO QUE TIENE ACTUALMENTE ACTIVO
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_consultaFiltroActivo_select]
	-- Add the parameters for the stored procedure here
	@dbHistorial as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @filtroId varchar(max)
	SET @filtroId=(SELECT FiltroID FROM Catalogo_Db_Historial WHERE DBHistorialID=@dbHistorial)
	
	DECLARE @consulta varchar(max)
	SET @consulta='SELECT Filtro FROM Global_FiltrosBD WHERE FiltroID='+@filtroId+' AND Estatus=1'
	
	EXEC (@consulta)
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_ConsultaFiltros_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Danya Justo
-- Create date: 25/08/2015
-- Description:	RETORNA LA INFORMACIÓN DE UN FILTRO SELECIONADO
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_ConsultaFiltros_select]
	-- Add the parameters for the stored procedure here
	@filtroID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT F.Filtro,D.[ciclo]
      ,D.[vigenciaBase]
      ,D.[permiteDuplicados]
      ,D.[lapsoMarcacion] from [Global_FiltrosBD] AS D
	  
	  INNER JOIN Global_FiltrosBD AS F ON F.FiltroID=@filtroID where D.FiltroID=@filtroID
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_DbHistorial_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 DANYA JUSTO
-- Create date:  29052015
-- Description:	 LLENA LOS DATOS DE LA TABLA DB_HISTORIAL
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_DbHistorial_insert] 
	-- Add the parameters for the stored procedure here
	@CompaniaId as int, @ProyectoId as int, @CampanaId as int, @Ruta as varchar(100), @Correo as bit, @Ip as varchar (20), 
	@Personal as varchar (7),@FechaCreacion as datetime,@Estatus as int, @TipoBase as int,@CatalogoId as int=-1,
	 @TipoCatalogoId as int=-1, @OrigenID as int,@EstadoID AS INT
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	DECLARE @ID AS INT
	SET NOCOUNT ON;
	SET @ID=(SELECT ISNULL(MAX(DBHistorialID),0) FROM Catalogo_Db_Historial)+1
    -- Insert statements for procedure here
	
	 INSERT INTO Catalogo_Db_Historial (DBHistorialID,CampanaID,CompaniaID,ProyectoID, fechacreacion,rutaarchivo,estatus,correo,subidos,repetidos,profeco,marcacion,ip,personal,tipobase,CatalogoID,TipoCatalogoID,OrigenID,EstadoID) 
	 VALUES(@ID,@CampanaId,@CompaniaId,@ProyectoId,@FechaCreacion,@Ruta,@Estatus, @Correo,-1,-1,-1,0,@Ip,@Personal,@TipoBase,@CatalogoId,@TipoCatalogoId,@OrigenID,@EstadoID)
	 SELECT @ID as i
END







GO
/****** Object:  StoredProcedure [dbo].[Cargas_encuentraDuplicados_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		danya justo
-- Create date: 29072015
-- Description:	Indica si un numero es duplicado al ser cargado desde un excel
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_encuentraDuplicados_select] 
	-- Add the parameters for the stored procedure here
	@nombreColumnaDato AS VARCHAR(MAX), --Nombre o etiqueta de la columna designada como principal en la tabla de Dato contacto de la campaña
	@tablaDatoContacto as varchar (max),--Nombre de la tabla DatoContacto que pertenece a la campaña
	@datoPrincipal as varchar (20) --Numero de telefono o lo que sea considerado dato principal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	 DECLARE @consulta as varchar(max)
	 SET  @consulta= 'SELECT COUNT ('+@nombreColumnaDato+') as duplicado FROM '+@tablaDatoContacto+' WHERE '+@nombreColumnaDato+'='+@datoPrincipal
	 --+' UPDATE '+ @nombreTablaDato+' SET Duplicado=1 WHERE '+@nombreColumnaDatoPrincipal+'='+@datoPrincipal
	--select @consulta
	exec (@consulta)

	  
END




GO
/****** Object:  StoredProcedure [dbo].[Cargas_EncuentraProfecos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DANYA JUSTO
-- Create date: 30062015
-- Description:	busca si existe un numero dentro de la tabla profeco
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_EncuentraProfecos_select] 
	-- Add the parameters for the stored procedure here
	--@nombreColumnaDatoPrincipal as varchar (max) --Columna Telefono de la tabla Profeco
	 @tablaDatoContacto as varchar (max)--Nombre de la tabla DatoContacto que pertenece a la campaña
	,@datoPrincipal as varchar(20),--Numero de telefono o lo que sea considerado dato principal
	 @nombreTablaDato as varchar(max), --Nombre de la tabla Profeco perteneciente a la campaña
	 @nombreColumnaDato AS VARCHAR(MAX) --Nombre o etiqueta de la columna designada como principal en la tabla de Dato contacto de la campaña
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @Consulta as nvarchar(max)
	SET @Consulta=N'SELECT Telefono as dProfeco FROM '+ @nombreTablaDato+ ' WHERE Telefono=' + @datoPrincipal  --' UPDATE '+ @tablaDatoContacto+' SET Profeco=1 WHERE '+@nombreColumnaDato+'='+@datoPrincipal
	--select @Consulta
	EXEC(@Consulta)
END





GO
/****** Object:  StoredProcedure [dbo].[Cargas_Estados_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		danya justo
-- Create date: 14072015
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_Estados_select] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from CatalogoItem where CatalogoID='2'
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_FiltrosActivos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DANYA JUSTO
-- Create date: 15/07/2015
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_FiltrosActivos_select]
	-- Add the parameters for the stored procedure here
	@campanaId as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT FiltroID, Filtro FROM Global_FiltrosBD WHERE Estatus=1 and CampanaID=@campanaId
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_GetAllAdjuntos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_GetAllAdjuntos_select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Carga_adjuntos
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_GetallDBHistorial_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Danya Justo
-- Create date: 15062015
-- Description:	Obtiene la tabla db historial
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_GetallDBHistorial_select] 
	-- Add the parameters for the stored procedure here
	@campanaId as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DBHistorialID], h.CampanaID,c.Nombre as nCampana,[fechacreacion]
      ,[rutaarchivo],h.[estatus],[subidos],[repetidos],[profeco]
      ,[marcacion],[personal],[tipobase],t.[NomTablaDato], t.NomTablaProfeco FROM [Catalogo_Db_Historial]as h 

	  INNER JOIN Global_TablasCampana AS t on h.CampanaID=t.CampanaID
	  INNER JOIN Global_Campana as c on h.CampanaID=c.CampanaID
	  --INNER JOIN Global_Compania as a on h.CompaniaID=a.CompaniaID
	  --INNER JOIN Global_Proyecto as p on h.ProyectoID=p.ProyectoID
       
	  WHERE h.CampanaID=@campanaId and h.tipobase=0 and h.estatus=2 order by fechacreacion desc
END







GO
/****** Object:  StoredProcedure [dbo].[Cargas_GetCatalogos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_GetCatalogos_select]
	-- Add the parameters for the stored procedure here
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CatalogoID, [TipoCatalogoID],[OrigenID],[Nombre] FROM Familia_Catalogos WHERE Nombre!='Origen'
END







GO
/****** Object:  StoredProcedure [dbo].[Cargas_GetNombresTablas_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		danya justo
-- Create date: 10/06/2015
-- Description:	ayuda a la creacion de filtros para las cargas de excel
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_GetNombresTablas_select]
	-- Add the parameters for the stored procedure here
	@DBHistorialID AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


SELECT [DBHistorialID]
   --   ,h.[CampanaID]
   --   ,h.[CompaniaID]
   --   ,h.[ProyectoID]
   --   ,[fechacreacion]
   --   ,[rutaarchivo]
   --   ,h.[estatus]
   --   ,[correo]
   --   ,[subidos]
   --   ,[repetidos]
   --   ,[profeco]
   --   ,[marcacion]
   --   ,[ip]
   --   ,[personal]
   --   ,[tipobase]
	  --,[CatalogoID]
   --   ,[TipoCatalogoID]
	  --,[OrigenID]
	  --,[EstadoID]
	  ,c.[NomTablaDato]as nombreCampana
	  ,c.NomTablaProfeco as nombreProfeco
  FROM [dbo].[Catalogo_Db_Historial] as h
   INNER JOIN Global_TablasCampana as c ON c.CampanaID=h.CampanaID
   where DBHistorialID=@DBHistorialID

END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_iDConfiguracionBase_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_iDConfiguracionBase_insert]
	-- Add the parameters for the stored procedure here
	@DBHistorialID AS INT, @CompaniaID AS INT, @ProyectoID AS INT, @CampanaID AS INT, @FiltroID AS INT,@Estatus AS BIT,@Personal AS VARCHAR (8)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	

	DECLARE @FiltroIDDBHistorial AS INT 
	SET @FiltroIDDBHistorial=(SELECT FiltroID FROM Catalogo_Db_Historial WHERE DBHistorialID=@DBHistorialID AND CompaniaID=@CompaniaID AND ProyectoID=@ProyectoID AND CampanaID=@CampanaID)
	UPDATE Global_BDFiltros SET Estatus=0 WHERE DBHistorialID=@DBHistorialID AND CompaniaID=@CompaniaID AND ProyectoID=@ProyectoID AND CampanaID=@CampanaID AND FiltroID=@FiltroIDDBHistorial
	
	DECLARE @ID AS INT
	SET @ID=(SELECT ISNULL(MAX(ID),0) FROM Global_BDFiltros)+1;
	INSERT INTO Global_BDFiltros (ID,DBHistorialID,CompaniaID,ProyectoID,CampanaID,FiltroID,Estatus,Personal,Fecha_Cambio) 
	VALUES(@ID, @DBHistorialID,@CompaniaID,@ProyectoID,@CampanaID,@FiltroID,@Estatus,@Personal,GETDATE());
	
	UPDATE Catalogo_Db_Historial SET FiltroID=@FiltroID WHERE DBHistorialID=@DBHistorialID

	DECLARE @numToques AS INT
	SET @numToques= (SELECT Ciclo FROM Global_FiltrosBD WHERE FiltroID=@FiltroID)
	DECLARE @nombreTabla VARCHAR (MAX)
	SET @nombreTabla=(SELECT NomTablaDato FROM Global_TablasCampana WHERE CompaniaID=@CompaniaID AND ProyectoID=@ProyectoID AND CampanaID=@CampanaID AND Estatus=1 )
	
	DECLARE @consulta VARCHAR (MAX)
	SET @consulta='UPDATE '+ @nombreTabla+' SET Ciclo='+CONVERT(VARCHAR(5),@numToques)+' WHERE DBHistorialID='+CONVERT(VARCHAR(5),@DBHistorialID)+''
	EXEC(@consulta)
	
	
END





GO
/****** Object:  StoredProcedure [dbo].[Cargas_InsertaPrimerConfiguracionStatusLlamada_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DANYA JUSTO
-- Create date: 13102015
-- Description:	CUANDO UNA BASE ES CARGADA SE LE ASIGNA LA CONFIGURACION DE ESTATUS DE LLAMADA GLOBAL, PARA QUE PUEDA SER EDITADA POR EL SUPERVISOR
-- =============================================
create PROCEDURE [dbo].[Cargas_InsertaPrimerConfiguracionStatusLlamada_insert]
	-- Add the parameters for the stored procedure here
	@compID as int, @proyID as int, @campID as int, @histID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @LlamadaStatusID as int
declare @LlamadaSubestatusID as int
declare @LlamadaTipificacionID as int 
declare @LlamadaStatus4ID as int
declare @CompaniaID as int 
declare @ProyectoID as int
declare @CampanaID as int
declare @Procede as bit
declare @ReglaID as int
declare @DBHistorialID as int=@histID


declare @IDConfig as int
set @IDConfig=(SELECT ISNULL(MAX([NumeroConfiguracion]),0) FROM Global_ConfiguracionStatusLlamadaBase)+1


DECLARE ProdInfo CURSOR FOR SELECT [LlamadaStatusID]
      ,[LlamadaSubestatusID]
      ,[LlamadaTipificacionID]
      ,[LlamadaStatus4ID]
      ,[CompaniaID]
      ,[ProyectoID]
      ,[CampanaID]
      ,[Procede]
      ,[ReglaID] FROM Global_ConfiguracionStatusLlamada where CompaniaID=@compID and ProyectoID=@proyID and CampanaID=@campID

OPEN ProdInfo

FETCH NEXT FROM ProdInfo INTO @LlamadaStatusID,@LlamadaSubestatusID,@LlamadaTipificacionID,@LlamadaStatus4ID,@CompaniaID,@ProyectoID,@CampanaID,@Procede,@ReglaID

WHILE @@fetch_status = 0
BEGIN
    --PRINT @LlamadaStatusID,@LlamadaSubestatusID,@LlamadaTipificacionID,@LlamadaStatus4ID,@CompaniaID,@ProyectoID,@CampanaID,@Procede,@ReglaID

   -- FETCH NEXT FROM ProdInfo INTO @LlamadaStatusID,@LlamadaSubestatusID,@LlamadaTipificacionID,@LlamadaStatus4ID,@CompaniaID,@ProyectoID,@CampanaID,@Procede,@ReglaID
	DECLARE @ID AS INT
	SET @ID=(SELECT ISNULL(MAX(ConfiguracionID),0) FROM Global_ConfiguracionStatusLlamadaBase)+1
	Insert Into Global_ConfiguracionStatusLlamadaBASE (ConfiguracionID,[NumeroConfiguracion],[DBHistorialID],[LlamadaStatusID]
      ,[LlamadaSubestatusID]
      ,[LlamadaTipificacionID]
      ,[LlamadaStatus4ID]
      ,[CompaniaID]
      ,[ProyectoID]
      ,[CampanaID]
      ,[Procede]
      ,[ReglaID])
        Values(@ID,@IDConfig,@DBHistorialID,@LlamadaStatusID,@LlamadaSubestatusID,@LlamadaTipificacionID,@LlamadaStatus4ID,@CompaniaID,@ProyectoID,@CampanaID,@Procede,@ReglaID)
        
        Fetch Next from ProdInfo INTO @LlamadaStatusID,@LlamadaSubestatusID,@LlamadaTipificacionID,@LlamadaStatus4ID,@CompaniaID,@ProyectoID,@CampanaID,@Procede,@ReglaID
END

CLOSE ProdInfo

DEALLOCATE ProdInfo
END

GO
/****** Object:  StoredProcedure [dbo].[Cargas_insertArchivoAdjunto_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_insertArchivoAdjunto_insert] 
	-- Add the parameters for the stored procedure here
    @nombreArchivo as varchar(max),@rutaArchivo as varchar(max), @fechaCarga as datetime, @personal as Varchar(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure he
	DECLARE @ID AS INT
	SET @ID=(SELECT ISNULL(MAX(Id),0) FROM Carga_adjuntos)+1;
	INSERT INTO Carga_adjuntos (Id,nombreAdjunto,rutaAdjunto,fechaCarga,personal) 
	VALUES(@ID,@nombreArchivo,@rutaArchivo,@fechaCarga,@personal)
	
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_obtenerCorreos_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		danya justo
-- Create date: 23092015
-- Description:	retorna los correos 
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_obtenerCorreos_Select]
	-- Add the parameters for the stored procedure here
	@CampanaId as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.CorreoPara,c.CorreoCC,c.CorreoCCO from [10.10.5.237].[AFT].dbo.campanas as c
	inner join [10.10.5.237].[AFT].dbo.Relation_AFT_AllSoft as a on a.CampanaID_AllSoft=@CampanaId
	where a.CampanaID_AFT=c.id_campana
END


GO
/****** Object:  StoredProcedure [dbo].[Cargas_ObtenerEstatusActual_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		danya justo
-- Create date: 02062015
-- Description:	obtiene los estatus 1 de las campañas
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_ObtenerEstatusActual_select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


SELECT [CampanaID],[ProyectoID],[CompaniaID],[Nombre],[Estado]
    

  FROM [dbo].[Global_Campana] WHERE Estado=1


END








GO
/****** Object:  StoredProcedure [dbo].[Cargas_Obtenernumero_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_Obtenernumero_select]
	-- Add the parameters for the stored procedure here
	@nombreTablaDato VARCHAR (max),
    @nombreColumnaDato AS VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	DECLARE @numero VARCHAR (max)
	DECLARE @msg AS VARCHAR(200)
	SET @numero='
	BEGIN TRAN Transaccion

		BEGIN TRY

		 DECLARE @numero VARCHAR(10); SET @numero= (select top 1 '+@nombreColumnaDato+'  from ' + @nombreTablaDato + ' as d INNER JOIN Catalogo_Db_Historial AS c on c.DBHistorialID=d.DBHistorialID
		where d.Profeco=0 and StatusDato=0 and d.Agendado=0 and d.Duplicado=0 and c.marcacion=1 and c.estatus=2 and c.tipobase=0 ORDER BY NEWID())
	              update '+ @nombreTablaDato+' set StatusDato=1,Fecha_Tomado=GETDATE() where ' +@nombreColumnaDato+' = @numero and Duplicado=0 and Agendado=0;
				  select (@numero) as datoContacto; select DatoID from '+@nombreTablaDato+' where '+@nombreColumnaDato+'=@numero and Duplicado=0 and Agendado=0
				  
				DECLARE @msg AS VARCHAR(200);
				SET @msg = ''Datos Insertados.''
			--SELECT @msg AS Mensaje
		
		COMMIT TRAN Transaccion

	    END TRY
	    BEGIN CATCH
			ROLLBACK TRAN Transaccion
			SET @msg = ''Error SQL : '' + ERROR_MESSAGE() + '' en la línea '' + CONVERT(NVARCHAR(255), ERROR_LINE() ) 
			
			--SELECT @msg AS Mensaje
			
	    END CATCH'
	

	exec (@numero)
	
	END



GO
/****** Object:  StoredProcedure [dbo].[Cargas_ObtieneLimites_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_ObtieneLimites_select]
	-- Add the parameters for the stored procedure here
	@nombreTablaDato as varchar(max),@dbHistorialID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @maximo VARCHAR(MAX)
    
    -- Insert statements for procedure here
	SET @maximo=N'(SELECT MAX(DatoID) as maximo FROM '+ @nombreTablaDato +' WHERE DBHistorialID='+CONVERT(VARCHAR(5),@dbHistorialID)+' AND AsignadoA=''0'') (SELECT MIN(DatoID) as minimo FROM '+ @nombreTablaDato +' WHERE DBHistorialID='+CONVERT(VARCHAR(5),@dbHistorialID)+' AND AsignadoA=''0'')'
    
	EXEC (@maximo)
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_UpdateConfiguracionBase_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_UpdateConfiguracionBase_update] 
	-- Add the parameters for the stored procedure here
	
	@numToques as int,
	@vigenciaBase as datetime,
	@muestraDuplicados as varchar(2), 
	@lapsoMarcacion as int,
	@personal as varchar(7),
	--@personalModif as varchar(7),
	@nombreFiltro as varchar (max),
	@campanaId as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ID AS INT SET @ID=(SELECT ISNULL(MAX(FiltroID),0) FROM Global_FiltrosBD)+1; 
	INSERT INTO Global_FiltrosBD (FiltroID, Filtro,CampanaID,Personal, Personal_Modif, Fecha_Alta, Fecha_Modif, Fecha_Baja, Estatus, ciclo, vigenciaBase, permiteDuplicados, lapsoMarcacion) 
	VALUES (@ID,@nombreFiltro, @campanaId, @personal,null, GETDATE(), null, NULL, 1,CONVERT (VARCHAR(MAX),@numToques),@vigenciaBase, @muestraDuplicados, CONVERT (VARCHAR(MAX), @lapsoMarcacion))
		
END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_updateContadorBase_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_updateContadorBase_update] 
	-- Add the parameters for the stored procedure here
	--@dbHistorial AS INT, @nombreTablaDatoContacto as varchar(max)
	AS
	DECLARE @ID INT
	
	SET @ID=1
	DECLARE @maxrow INT
	SET @maxrow=(select COUNT(*)DBHistorialID from DatoContacto_Cliente_excelente where DBHistorialID=20)
	
	WHILE (@ID<=@maxrow)
		BEGIN
		
		UPDATE DatoContacto_Cliente_excelente SET ContadorBase=@ID WHERE DBHistorialID=20
		SET @ID=@ID+1

END






GO
/****** Object:  StoredProcedure [dbo].[Cargas_ValidarExistenciaItem_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Danya Justo
-- Create date: 06082015
-- Description:	VALIDA LA EXISTENCIA DE ITEMS IGUALES ANTES DE SER CARGADOS A LA TABLA
-- =============================================
CREATE PROCEDURE [dbo].[Cargas_ValidarExistenciaItem_select] 
	-- Add the parameters for the stored procedure here
	@CatalogoID AS INT, @origenItem as int,@nombre as varchar(50),@desc as varchar(250)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM CatalogoItem as nombre where CatalogoID=@CatalogoID AND OrigenItem=@origenItem and Nombre=@nombre
END






GO
/****** Object:  StoredProcedure [dbo].[CargasActualizarEstatus_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DANYA JUSTO
-- Create date: 29052015
-- Description:	ACTUALIZA ESTATUS DE LA CARGA DE BASE EXCEL
-- =============================================
CREATE PROCEDURE [dbo].[CargasActualizarEstatus_update]
	-- Add the parameters for the stored procedure here

	@estatus AS  INT, @DBHistorialID AS BIGINT, @subidos as int, @profeco as int, @repetidos as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Catalogo_Db_Historial
	SET estatus=@estatus, subidos=@subidos, profeco=@profeco, repetidos=@repetidos WHERE DBHistorialID = @DBHistorialID
	
END







GO
/****** Object:  StoredProcedure [dbo].[CargasCambia_Marcacion_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DANYA JUSTO
-- Create date: 18062015
-- Description:	CAMBIA 'MARCACION' PARA INDICAR SI SE HARAN LLAMADAS A LA BASE
-- =============================================
CREATE PROCEDURE [dbo].[CargasCambia_Marcacion_update]
	-- Add the parameters for the stored procedure here
	@DBHistorialID AS INT,
	@Marcacion AS BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Catalogo_Db_Historial
	SET marcacion=@Marcacion WHERE DBHistorialID=@DBHistorialID
END







GO
/****** Object:  StoredProcedure [dbo].[CargasDb_Historial_select_Ruta]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DANYA JUSTO
-- Create date: 01062015
-- Description:	VERIFICA EN LA COLUMNA RUTAARCHIVO SI LA NUEVA BASE A CARGAR HA SIDO CARGADA PREVIAMENTE
-- =============================================
CREATE PROCEDURE	[dbo].[CargasDb_Historial_select_Ruta]
	-- Add the parameters for the stored procedure here
	@Ruta as varchar (200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
 
SELECT CASE 

	WHEN COUNT (*) >0
	
	THEN 1
	ELSE 0

    END as existe
	FROM [dbo].[Catalogo_Db_Historial] 
    WHERE rutaarchivo=@Ruta
  
  END







GO
/****** Object:  StoredProcedure [dbo].[CargasGetCamposCampana_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CargasGetCamposCampana_select] 
	-- Add the parameters for the stored procedure here	
	@CampanaID INT
AS
BEGIN
		SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [Columna_Excel],[Principal],d.Nombre as [Nombre_Tipo_Control_Catalogo], d.TipoDato
FROM [dbo].[Global_CampanaDato] as c
 
 INNER JOIN Global_CatalogoDatos as d  on d.DatoID=c.DatoID  WHERE CampanaID=@CampanaID AND [Cargar_Desde_Excel]=1 and TipoSeleccion='Ninguno'


END








GO
/****** Object:  StoredProcedure [dbo].[CargasObtenerBaseID_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		danya justo
-- Create date: 27/05/2015

-- =============================================
CREATE PROCEDURE [dbo].[CargasObtenerBaseID_select]
	-- Add the parameters for the stored procedure here
	@DBHistorialID AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


SELECT [DBHistorialID]
      ,h.[CampanaID]
      ,h.[CompaniaID]
      ,h.[ProyectoID]
      ,[fechacreacion]
      ,[rutaarchivo]
      ,h.[estatus]
      ,[correo]
      ,[subidos]
      ,[repetidos]
      ,[profeco]
      ,[marcacion]
      ,[ip]
      ,[personal]
      ,[tipobase]
	  ,[CatalogoID]
      ,[TipoCatalogoID]
	  ,[OrigenID]
	  ,[EstadoID]
	  ,c.Nombre	 
  FROM [dbo].[Catalogo_Db_Historial] as h

  inner join Global_Campana as c on h.CampanaID=c.CampanaID
   
where DBHistorialID=@DBHistorialID





END








GO
/****** Object:  StoredProcedure [dbo].[Catalogo_CoberturaMensajeria_CambioEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Catalogo_CoberturaMensajeria_CambioEstatus] 
	-- Add the parameters for the stored procedure here
	@ID as smallint
AS
declare @est bit;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @est=(select estatus from Catalogo_CoberturaMensajeria where CoberturaMensajeriaID=@ID);
	if(@est=1)
		update Catalogo_CoberturaMensajeria set estatus=0, FechaModificacion=default where CoberturaMensajeriaID=@ID
	else
	update Catalogo_CoberturaMensajeria set estatus=1,FechaModificacion=default where CoberturaMensajeriaID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[Catalogo_CoberturaMensajeria_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Catalogo_CoberturaMensajeria_insert]
	-- Add the parameters for the stored procedure here
	@Proveedor AS INT,
	@Estadoid AS INT,
	@cp as varchar(5),
	@CiudadID as INT,
	@coloniaID as INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @id int;
	declare @idCatP int;
	declare @idCatE int;
	DECLARE @Ciudad varchar(40);
	declare @colonia varchar(40);
	SET NOCOUNT ON;
	set @Ciudad=(select Nombre from CatalogoItem where CatalogoItemID=@CiudadID);
	set @colonia=(select Nombre from CatalogoItem where CatalogoItemID=@coloniaID);
	set @id=(select ISNULL(max(CoberturaMensajeriaID), 0) from Catalogo_CoberturaMensajeria)+1;
	set @idCatE=(select CatalogoID FROM CatalogoItem where CatalogoItemID=@Estadoid);
	set @idCatP=(select CatalogoID FROM CatalogoItem where CatalogoItemID=@Proveedor);
    -- Insert statements for procedure here
	insert into Catalogo_CoberturaMensajeria(CoberturaMensajeriaID, CatalogoID_P, ProvedorMensajeriaID, CatalogoID_E, EstadoID, CP, Ciudad_Municipio, Colonia) values(@id, @idCatP, @Proveedor, @idCatE, @Estadoid,@cp, @Ciudad, @colonia)
END







GO
/****** Object:  StoredProcedure [dbo].[Catalogo_CoberturaMensajeria_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Catalogo_CoberturaMensajeria_select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Catalogo_CoberturaMensajeria.*, CatalogoItem.Nombre as p, cat.Nombre as e from CatalogoItem inner join Catalogo_CoberturaMensajeria on Catalogo_CoberturaMensajeria.ProvedorMensajeriaID=CatalogoItem.CatalogoItemID inner join CatalogoItem cat on Catalogo_CoberturaMensajeria.EstadoID=cat.CatalogoItemID
END







GO
/****** Object:  StoredProcedure [dbo].[Catalogo_CoberturaMensajeria_selectID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Catalogo_CoberturaMensajeria_selectID]
@ID as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Catalogo_CoberturaMensajeria.*, CatalogoItem.Nombre as p, cat.Nombre as e from CatalogoItem inner join Catalogo_CoberturaMensajeria on Catalogo_CoberturaMensajeria.ProvedorMensajeriaID=CatalogoItem.CatalogoItemID inner join CatalogoItem cat on Catalogo_CoberturaMensajeria.EstadoID=cat.CatalogoItemID where CoberturaMensajeriaID=@ID
END







GO
/****** Object:  StoredProcedure [dbo].[Catalogo_SucursalCAC_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Catalogo_SucursalCAC_insert]
	-- Add the parameters for the stored procedure here
	
	@nom as varchar(40),
	@Estadoid AS varchar(40),
	@CiudadID as varchar(40),
	@coloniaID as varchar(40),
	@cp as varchar(5),
	@calle as varchar(40),
	@numE as varchar(10),
	@numI as varchar(10),
	@Ecalle as varchar(40),
	@Ycalle as varchar(40),
	@lada as varchar(5),
	@tel as varchar(10),
	@horario as varchar(80),
	@tiempoT as varchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @idSC int;

	SET NOCOUNT ON;
	
	set @idSC=(select ISNULL(max(SucursalCACID), 0) from Catalogo_SucursalCAC)+1;
    -- Insert statements for procedure here
	insert into Catalogo_SucursalCAC(SucursalCACID, Nombre, Estado, Ciudad, Colonia, CP, Calle, NumExterior, NumInterior, EntreCalle, YCalle,Lada, Telefono, Horario_Atencion, Tiempo_Traslado) values(@idSC, @nom, @Estadoid, @CiudadID, @coloniaID, @cp, @calle, @numE, @numI, @Ecalle, @Ycalle,@lada, @tel, @horario, @tiempoT)
END







GO
/****** Object:  StoredProcedure [dbo].[Catalogo_SucursalCAC_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Catalogo_SucursalCAC_select]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	select Catalogo_SucursalCAC.* from Catalogo_SucursalCAC 
END







GO
/****** Object:  StoredProcedure [dbo].[Catalogo_SucursalCAC_selectID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Catalogo_SucursalCAC_selectID]
	-- Add the parameters for the stored procedure here
	@Sucursalid AS INT
AS
BEGIN
	select Catalogo_SucursalCAC.* from Catalogo_SucursalCAC where SucursalCACID=@Sucursalid
END







GO
/****** Object:  StoredProcedure [dbo].[Catalogo_SucursalCAC_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Catalogo_SucursalCAC_update]
	-- Add the parameters for the stored procedure here
	@cacID as smallint,
	@cp as varchar(5),
	@calle as varchar(40),
	@nExt  as varchar(10),
	@nInt as varchar(10),
	@eCalle as varchar(40),
	@yCalle as varchar(40),
	@lada as tinyint,
	@tel as varchar(10),
	@horario as varchar(20),
	@tiempo as varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Catalogo_SucursalCAC set CP=@cp, Calle=@calle, NumExterior=@nExt, NumInterior=@nInt, EntreCalle=@eCalle, YCalle=@yCalle, Lada=@lada, Telefono=@tel, Horario_Atencion=@horario, Tiempo_Traslado=@tiempo, FechaBaja = default where SucursalCACID=@cacID
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoCombinacionStatus_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoCombinacionStatus_Insert]
      @procesoid AS SMALLINT,
      @moduloid AS SMALLINT,
	  @statusid AS SMALLINT,
	  @subestatusid AS SMALLINT,
	  @tipificacionid AS SMALLINT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @id =(SELECT ISNULL(MAX(ConvinacionID),0) FROM dbo.Catalogo_CombinacionStatus) + 1;
	INSERT INTO dbo.Catalogo_CombinacionStatus(ConvinacionID, ModuloID, StatusID, SubestatusID, TipificacionID, ProcesoID) VALUES (@id, @moduloid, @statusid, @subestatusid, @tipificacionid, @procesoid)

	SELECT * FROM dbo.Catalogo_CombinacionStatus
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoCombinacionStatus_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoCombinacionStatus_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Catalogo_CombinacionStatus
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoEstados_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoEstados_select]
	-- Add the parameters for the stored procedure here
	@idCatalogo as int
AS
BEGIN
 select * from CatalogoItem where CatalogoID=@idCatalogo
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoFamilia_CambioEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[CatalogoFamilia_CambioEstatus] 
	-- Add the parameters for the stored procedure here
	@ID as smallint
AS
declare @est bit;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @est=(select estatus from Familia_Catalogos where CatalogoID=@ID);
	if(@est=1)
		update Familia_Catalogos set estatus=0, FecModificacion=default where CatalogoID=@ID
	else
	update Familia_Catalogos set estatus=1,FecModificacion=default where CatalogoID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoFamilia_selectxProyecto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoFamilia_selectxProyecto]
	-- Add the parameters for the stored procedure here
	
	@proyecto as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Familia_Catalogos where ProyectoID=@proyecto AND estatus=1  
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_CambioEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[CatalogoItem_CambioEstatus] 
	-- Add the parameters for the stored procedure here
	@ID as int
AS
declare @est bit;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @est=(select estatus from CatalogoItem where CatalogoItemID=@ID);
	if(@est=1)
		update CatalogoItem set estatus=0, FecModificacion=default where CatalogoItemID=@ID
	else
	update CatalogoItem set estatus=1,FecModificacion=default where CatalogoItemID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_insert]
	-- Add the parameters for the stored procedure here
	@CatalogoID AS INT, 
	@origenItem as int,
	@nombre as varchar(300),
	 @desc as text,
	 @Personal as varchar(7)
AS
BEGIN
declare @id int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @id=(select ISNULL(max(CatalogoItemID),0) from CatalogoItem)+1;
	insert into CatalogoItem(CatalogoItemID, CatalogoID,OrigenItem, Nombre, Descripcion, Personal)values(@id, @CatalogoID,@origenItem, @nombre, @desc, @Personal)
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_Insert_DibujarControles]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_Insert_DibujarControles]
	(@Compania smallint, @Proyecto smallint )
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Familia_Catalogos inner join CatalogoItem on Familia_Catalogos.CatalogoID= CatalogoItem.CatalogoID
	where Familia_Catalogos.CompaniaID=@Compania and Familia_Catalogos.ProyectoID= @Proyecto
	and Familia_Catalogos.estatus='True' and CatalogoItem.estatus='True' 
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_select]
	-- Add the parameters for the stored procedure here
AS
BEGIN
 select CatalogoItem.*, Familia_Catalogos.Nombre as familia, cat.Nombre as origen from Familia_Catalogos  inner join  CatalogoItem  on CatalogoItem.CatalogoID=Familia_Catalogos.CatalogoID inner join CatalogoItem cat on cat.CatalogoItemID=CatalogoItem.OrigenItem
 END
 /*select CatalogoItem.*, item.Nombre as nomItem, Familia_Catalogos.Nombre as nomFamilia from CatalogoItem item inner join CatalogoItem on item.OrigenItem=CatalogoItem.CatalogoItemID inner join Familia_Catalogos on CatalogoItem.CatalogoID=Familia_Catalogos.CatalogoID*/







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_Select_1]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_Select_1]
	-- Add the parameters for the stored procedure here
	(@CatalogoID as smallint)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CatalogoItem where CatalogoItem.CatalogoID= @CatalogoID
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_select_FamiliaCatalogos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_select_FamiliaCatalogos]
	-- Add the parameters for the stored procedure here
	@IDcatalogo as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @orig int;
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	set @orig=(select OrigenID from Familia_Catalogos where CatalogoID=@IDcatalogo);
	select * from CatalogoItem where CatalogoID=@orig and estatus=1;
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_select_ItemID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_select_ItemID]
	-- Add the parameters for the stored procedure here
	@IDItem as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	select * from CatalogoItem where OrigenItem=@IDItem and estatus=1;
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_Select_Origen]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[CatalogoItem_Select_Origen]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  Familia_Catalogos.Nombre as NombreCatalogo, Familia_Catalogos.CatalogoID,Familia_Catalogos.TipoCatalogoID, Familia_Catalogos.OrigenID ,  CatalogoItem.* 
	from Familia_Catalogos familia inner join Familia_Catalogos on familia.CatalogoID = Familia_Catalogos.OrigenID 
    inner join CatalogoItem on Familia_Catalogos.CatalogoID = CatalogoItem.CatalogoID
    where Familia_Catalogos.estatus=1 and Familia_Catalogos.CompaniaID= @CompaniaID and Familia_Catalogos.ProyectoID= @ProyectoID
    and Familia_Catalogos.TipoCatalogoID=0 and CatalogoItem.estatus=1 
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_select_Registros]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_select_Registros]
	-- Add the parameters for the stored procedure here
	@idCatalogo as int
AS
BEGIN
 select * from CatalogoItem where CatalogoID=@idCatalogo and estatus=1
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_select_RegistrosFamilia]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_select_RegistrosFamilia]
	-- Add the parameters for the stored procedure here
	@idCatalogo as int
AS
BEGIN
  select CatalogoItem.*, Familia_Catalogos.Nombre as familia, cat.Nombre as origen from Familia_Catalogos  inner join  CatalogoItem  on CatalogoItem.CatalogoID=Familia_Catalogos.CatalogoID inner join CatalogoItem cat on cat.CatalogoItemID=CatalogoItem.OrigenItem where CatalogoItem.CatalogoID=@idCatalogo order by cat.Nombre asc
 end









GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_selectID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoItem_selectID]
	-- Add the parameters for the stored procedure here
	@itemID AS INT
AS
BEGIN
  select CatalogoItem.*, Familia_Catalogos.Nombre as familia, cat.Nombre as origen from Familia_Catalogos  inner join  CatalogoItem  on CatalogoItem.CatalogoID=Familia_Catalogos.CatalogoID inner join CatalogoItem cat on cat.CatalogoItemID=CatalogoItem.OrigenItem where CatalogoItem.CatalogoItemID=@itemID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoItem_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[CatalogoItem_update] 
	-- Add the parameters for the stored procedure here
	@ID as smallint,
	@desc as text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update CatalogoItem set descripcion=@desc,FecModificacion=default where CatalogoItemID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoModulo_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoModulo_Insert]
	@nombre AS VARCHAR(30),
	@descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @id =(SELECT ISNULL(MAX(ModuloID),0) FROM dbo.Catalogo_Modulo) + 1;
	INSERT INTO dbo.Catalogo_Modulo(ModuloID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Catalogo_Modulo
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoModulo_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoModulo_Select] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM dbo.Catalogo_Modulo
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoNivel_CambioEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoNivel_CambioEstatus] 
	-- Add the parameters for the stored procedure here
	@NivelID as smallint
AS
declare @est bit;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @est=(select estatus from Nivel_Catalogos where TipoCatalogoID=@NivelID);
	if(@est=1)
		update Nivel_Catalogos set estatus=0, FechaMod=default where TipoCatalogoID=@NivelID
	else
	update Nivel_Catalogos set estatus=1,FechaMod=default where TipoCatalogoID=@NivelID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoNivel_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoNivel_insert]
	-- Add the parameters for the stored procedure here
	@nombre as varchar(50),
	@desc as text
AS
BEGIN

declare @id smallint;

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
set @id=(select ISNULL (max(TipoCatalogoID),0) as idc from Nivel_Catalogos)+1;
	insert into Nivel_Catalogos(TipoCatalogoID, nombre, descripcion) values(@id, @nombre, @desc)
END






GO
/****** Object:  StoredProcedure [dbo].[CatalogoNivel_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoNivel_select] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Nivel_Catalogos
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoNivel_selectActivos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoNivel_selectActivos] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Nivel_Catalogos where estatus=1 

END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoNivel_selectID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoNivel_selectID] 
	-- Add the parameters for the stored procedure here
	@NivelID as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Nivel_Catalogos where TipoCatalogoID=@NivelID
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoNivel_selectT]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogoNivel_selectT] 
	-- Add the parameters for the stored procedure here

AS
	 declare @a varchar(10);
	  declare @i varchar(10);
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	set @a='Activo';
	set @i='Inactivo';
	SELECT *, @i as est2 from Nivel_Catalogos where estatus=0
	select *, @a as est1 from Nivel_Catalogos where estatus=1;
	
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoProceso_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoProceso_Insert]
   @nombre AS VARCHAR(30),
   @descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @id =(SELECT ISNULL(MAX(ProcesoID),0) FROM dbo.Catalogo_Proceso) + 1;

	INSERT INTO dbo.Catalogo_Proceso(ProcesoID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

    SELECT * FROM dbo.Catalogo_Proceso
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoProcesos_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoProcesos_Select] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM dbo.Catalogo_Proceso
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoStatus_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoStatus_Insert]
	 @nombre AS VARCHAR(50),
	 @descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @id =(SELECT ISNULL(MAX(StatusID),0) FROM dbo.Catalogo_Status) + 1;
    INSERT INTO dbo.Catalogo_Status(StatusID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Catalogo_Status
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoStatus_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoStatus_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM dbo.Catalogo_Status
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoStatusLlamada_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoStatusLlamada_Insert]
	@nombre AS VARCHAR(50),
	@descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET @id =(SELECT ISNULL(MAX(LlamadaStatusID),0) FROM dbo.Global_LlamadaStatus) + 1;
    INSERT INTO dbo.Global_LlamadaStatus(LlamadaStatusID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Global_LlamadaStatus
END






GO
/****** Object:  StoredProcedure [dbo].[CatalogoStatusLlamada_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoStatusLlamada_Select] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM dbo.Global_LlamadaStatus ORDER BY Nombre ASC
END






GO
/****** Object:  StoredProcedure [dbo].[CatalogoSubestatus_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoSubestatus_Insert]
	 @nombre AS VARCHAR(50),
	 @descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET @id =(SELECT ISNULL(MAX(SubestatusID),0) FROM dbo.Catalogo_Subestatus) + 1;
	INSERT INTO dbo.Catalogo_Subestatus(SubestatusID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Catalogo_Subestatus
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoSubestatus_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoSubestatus_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM dbo.Catalogo_Subestatus
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoSubestatusLlamada_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoSubestatusLlamada_Insert]
	@nombre AS VARCHAR(50),
	@descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET @id =(SELECT ISNULL(MAX(LlamadaSubestatusID),0) FROM dbo.Global_LlamadaSubestatus) + 1;
	INSERT INTO dbo.Global_LlamadaSubestatus(LlamadaSubestatusID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Global_LlamadaSubestatus
END






GO
/****** Object:  StoredProcedure [dbo].[CatalogoSubestatusLlamada_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoSubestatusLlamada_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM dbo.Global_LlamadaSubestatus ORDER BY Nombre ASC
END






GO
/****** Object:  StoredProcedure [dbo].[CatalogoSucursalCAC_CambioEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[CatalogoSucursalCAC_CambioEstatus] 
	-- Add the parameters for the stored procedure here
	@ID as smallint
AS
declare @est bit;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @est=(select estatus from Catalogo_SucursalCAC where SucursalCACID=@ID);
	if(@est=1)
		update Catalogo_SucursalCAC set estatus=0, FechaBaja=default where SucursalCACID=@ID
	else
	update Catalogo_SucursalCAC set estatus=1,FechaBaja=default where SucursalCACID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoTipificacion_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoTipificacion_Insert]
	 @nombre AS VARCHAR(50),
	 @descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @id =(SELECT ISNULL(MAX(TipificacionID),0) FROM dbo.Catalogo_Tipificacion) + 1;
    INSERT INTO dbo.Catalogo_Tipificacion(TipificacionID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Catalogo_Tipificacion
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoTipificacion_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoTipificacion_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Catalogo_Tipificacion
END







GO
/****** Object:  StoredProcedure [dbo].[CatalogoTipificacionLlamada_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoTipificacionLlamada_Insert] 
	@nombre AS VARCHAR(50),
	@descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET @id =(SELECT ISNULL(MAX(LlamadaTipificacionID),0) FROM dbo.Global_LlamadaTipificacion) + 1;
    INSERT INTO dbo.Global_LlamadaTipificacion(LlamadaTipificacionID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Global_LlamadaTipificacion
END






GO
/****** Object:  StoredProcedure [dbo].[CatalogoTipificacionLlamada_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoTipificacionLlamada_Select] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM dbo.Global_LlamadaTipificacion ORDER BY Nombre ASC
END






GO
/****** Object:  StoredProcedure [dbo].[CoberturaMensajeria_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[CoberturaMensajeria_insert]
	-- Add the parameters for the stored procedure here
	
	@proveedor as int,
	@estado AS int,
	@cp as varchar(5),
	@CiudadID as INT,
	@coloniaID as INT
AS
BEGIN
declare @id smallint;
declare @idCProveedor int;
declare @idCEstado int;
DECLARE @Ciudad varchar(40);
declare @colonia varchar(40);

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @idCProveedor=(select CatalogoID FROM CatalogoItem where CatalogoItemID=@proveedor);
	set @idCEstado=(select CatalogoID FROM CatalogoItem where CatalogoItemID=@estado);
	set @Ciudad=(select Nombre from CatalogoItem where CatalogoItemID=@CiudadID);
	set @colonia=(select Nombre from CatalogoItem where CatalogoItemID=@coloniaID);

	set @id=(select ISNULL(max(CoberturaMensajeriaID),0) from Catalogo_CoberturaMensajeria)+1;
	insert into Catalogo_CoberturaMensajeria(CoberturaMensajeriaID, CatalogoID_P, ProvedorMensajeriaID, CatalogoID_E, EstadoID, CP, Ciudad_Municipio, Colonia)values(@id, @idCProveedor, @proveedor, @idCEstado, @estado, @cp, @Ciudad, @colonia)
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[CombinacionStatusLlamada_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CombinacionStatusLlamada_Insert]
	-- Add the parameters for the stored procedure here
	@statusid AS SMALLINT,
	@subestatusid AS SMALLINT,
	@tipificacionid AS SMALLINT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET @id =(SELECT ISNULL(MAX(ConvinacionID),0) FROM dbo.Catalogo_CombinacionStatus) + 1;
	INSERT INTO dbo.Catalogo_CombinacionStatus(ConvinacionID, StatusID, SubestatusID, TipificacionID) VALUES (@id, @statusid, @subestatusid, @tipificacionid)

	SELECT * FROM dbo.Catalogo_CombinacionStatus
END






GO
/****** Object:  StoredProcedure [dbo].[Datos_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Datos_Select] 
    @moduloID as int,
    @campanaID AS int,
	@proyectoID as int,
	@compañia as int
	

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
    
		
		--set @locate='Error al Cancelar la venta'
    -- Insert statements for procedure here
	

select DISTINCT  Global_Modulo_Datos.ModuloID,
				 Global_Modulo_Datos.DatoID,
				 Global_Modulo_Datos.CampanaID,
				 Global_Modulo_Datos.ProyectoID,
				 Global_Modulo_Datos.CompaniaID, 
				 Global_Modulo_Datos.ModuloID,
				 Global_CatalogoDatos.Nombre,
				 Global_CatalogoDatos.TipoDato,
				 Global_CampanaDato.Principal,
				 Global_TablasCampana.NomTablaTransaccionDC as NombreCampanaDC,
				 Global_TablasCampana.NomTablaTransaccionDV as NombreCampanaDV,
				 Global_TablasCampana.NomTablaTransaccionHDC as NombreCampanaHDC,
				 Global_TablasCampana.NomTablaTransaccionHDV as NombreCampanaHDV,
				 Global_TablasCampana.NomTablaErrores as NombreCampanaErrores
 from Global_Modulo_Datos inner join Global_CatalogoDatos 
 on
 Global_CatalogoDatos.DatoID= Global_Modulo_Datos.DatoID
 inner join  Global_CampanaDato on Global_CampanaDato.DatoID= Global_CatalogoDatos.DatoID
 inner join Global_TablasCampana on Global_TablasCampana.CampanaID= Global_Modulo_Datos.CampanaID and
				 Global_Modulo_Datos.ModuloID = @moduloID and
				 Global_Modulo_Datos.CampanaID= @campanaID and
				 Global_Modulo_Datos.ProyectoID= @proyectoID and
				 Global_Modulo_Datos.CompaniaID= @compañia
				 where Global_Modulo_Datos.Estatus=1				 
 order by DatoID asc
 
select  CampanaID,ProyectoID, CompaniaID,Nombre As NombreEncuesta, TipoDato TipoEncuesta from Global_CatalogoDatosEncuesta
where banderacolumtransaccion = 1 and estatus = 1 and TipoDato <> 'etiqueta' and CampanaID = @campanaID


   
COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END







GO
/****** Object:  StoredProcedure [dbo].[Datos_Select_Servicios]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Datos_Select_Servicios]	-- Add the parameters for the stored procedure here
	(@CompaniaID as int,@ProyectoID as int, @CampanaID as int, @BloqueID as int)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Global_CatalogoDatosEncuesta.CatalogoDatosEncuestaID, Global_CatalogoDatosEncuesta.Nombre as NombreControl, Global_CatalogoDatosEncuesta.TipoDato, Global_CatalogoDatosEncuesta.Tipo_Control as TipoControl , Global_CatalogoDatosEncuesta.Disparador as DisparadorControl,Global_CatalogoDatosEncuesta.Etiqueta as Etiqueta_Campo,Global_CatalogoDatosEncuesta.Style,
Global_CatalogoDatosEncuesta.Orden_Tab as OrdenSecundario,Global_CatalogoDatosEncuesta.Reglas,
Global_CatalogoDatosEncuesta.banderacolumtransaccion,Global_CatalogoDatosEncuesta.FamiliaCatalogoIdInicio as CatalogoInicio,Global_CatalogoDatosEncuesta.ItemPrecarga
	from Global_CatalogoDatosEncuesta
where Global_CatalogoDatosEncuesta.CompaniaID = @CompaniaID and Global_CatalogoDatosEncuesta.ProyectoID= @ProyectoID and  
 Global_CatalogoDatosEncuesta.CampanaID= @CampanaID   and  estatus = 1 and BloqueDatosID = @BloqueID order by Global_CatalogoDatosEncuesta.Orden_Tab
END






GO
/****** Object:  StoredProcedure [dbo].[Datos_Select1]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Datos_Select1]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int,@ProyectoID as int,@CampanaID as int,@ModuloID as int)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
 select DISTINCT Global_Modulo_Datos.ModuloID,
				 Global_Modulo_Datos.DatoID,
				 Global_Modulo_Datos.CampanaID,
				 Global_Modulo_Datos.ProyectoID,
				 Global_Modulo_Datos.CompaniaID, 
				 Global_CatalogoDatos.Nombre,
				 Global_CatalogoDatos.TipoDato
 from Global_Modulo_Datos inner join Global_CatalogoDatos on Global_CatalogoDatos.DatoID= Global_Modulo_Datos.DatoID and 
				 Global_Modulo_Datos.ModuloID =@CompaniaID and
				 Global_Modulo_Datos.CampanaID=@ProyectoID and
				 Global_Modulo_Datos.ProyectoID=@CampanaID and
				 Global_Modulo_Datos.CompaniaID=@ModuloID 
				 where Global_Modulo_Datos.Estatus=1				 
 order by DatoID asc
END







GO
/****** Object:  StoredProcedure [dbo].[DATOSTRANSACCION_SELECT]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DATOSTRANSACCION_SELECT]
	-- Add the parameters for the stored procedure here
	@TRANS AS VARCHAR(MAX) = '',
	@CAMPANA AS VARCHAR (MAX) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @NOMDV AS VARCHAR (MAX)
	DECLARE @NOMDC AS VARCHAR (MAX)
	DECLARE @TRANTODODV AS VARCHAR (MAX)
	DECLARE @TRANTODODC AS VARCHAR (MAX)

	DECLARE @TRANDATOCONTACTO AS VARCHAR (MAX)
	DECLARE @DATOCONTACTO AS VARCHAR (MAX)
	

	set @DATOCONTACTO = (select NomTablaDato  from Global_TablasCampana where CampanaID=@campana);
	set @NOMDV = (select NomTablaTransaccionDV  from Global_TablasCampana where CampanaID=@campana);
	set @NOMDC = (select NomTablaTransaccionDC  from Global_TablasCampana where CampanaID=@campana);
   -- -- Insert statements for procedure here
   -- SET @TRANDATOCONTACTO = ('SELECT d.Nombre as [Nombre_Tipo_Control_Catalogo] FROM [dbo].[Global_CampanaDato] as c 
   --INNER JOIN Global_CatalogoDatos as d  on d.DatoID=c.DatoID  WHERE CampanaID= '+@CAMPANA +' AND [Cargar_Desde_Excel]=1 and TipoSeleccion=Ninguno')
SET @TRANTODODC = ('SELECT * FROM '+ @NOMDC+' WHERE TransaccionID='+@TRANS)
EXEC (@TRANTODODC )
SET @TRANTODODV = (' SELECT * FROM '+ @NOMDV+' WHERE TransaccionID='+@TRANS)
EXEC (@TRANTODODV )

END



GO
/****** Object:  StoredProcedure [dbo].[DATOSTRANSACCIONDATOCONTACTO_SELECT]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DATOSTRANSACCIONDATOCONTACTO_SELECT]
	@campana AS VARCHAR (MAX) = '',
	@DATOID AS VARCHAR (MAX) =''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @NOMDV AS VARCHAR (MAX)
	DECLARE @NOMDC AS VARCHAR (MAX)
	DECLARE @TRANTODODV AS VARCHAR (MAX)
	DECLARE @TRANTODODC AS VARCHAR (MAX)
	DECLARE @TRANDATOCONTACTO AS VARCHAR (MAX)
	DECLARE @DATOCONTACTO AS VARCHAR (MAX)
	DECLARE @DATOCONTACTOTODO AS VARCHAR (MAX)

	set @DATOCONTACTO = (select NomTablaDato  from Global_TablasCampana where CampanaID=@campana);
	set @NOMDV = (select NomTablaTransaccionDV  from Global_TablasCampana where CampanaID=@campana);
	set @NOMDC = (select NomTablaTransaccionDC  from Global_TablasCampana where CampanaID=@campana);
    -- Insert statements for procedure here
   

DECLARE @campos as table (pregunta varchar (max))
declare @columnas nvarchar (max)
SET @columnas=''
--insert into @campos (pregunta) VALUES ('troll')
insert into @campos (pregunta)
SELECT d.Nombre as [Nombre_Tipo_Control_Catalogo] FROM [dbo].[Global_CampanaDato] as c INNER JOIN Global_CatalogoDatos as d  on d.DatoID=c.DatoID  WHERE CampanaID=1 AND [Cargar_Desde_Excel]=1 and TipoSeleccion='Ninguno'
SELECT @columnas = (@columnas + COALESCE('['+CAST(pregunta AS VARCHAR(MAX))+ '],','')) FROM @campos
--SELECT * from @campos 
SET @columnas = left(@columnas,LEN(@columnas)-1)
--select (@columnas)

declare @CadenaSQL nvarchar (max)
SET @CadenaSQL = N' select '+@columnas+' from '+@DATOCONTACTO
--select @CadenaSQL 
--INSERT INTO @Preguntas SELECT  Pregunta,Respuesta  FROM VW_RespuestasTipificacion_Texto  WHERE IDInteracion  ='+@IDInteraction+' ORDER BY IDBloque 
 EXECUTE sp_executesql @CadenaSQL
END



GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogo_selectID_origen]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FamiliaCatalogo_selectID_origen]
	-- Add the parameters for the stored procedure here
	@catalogoID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Familia_Catalogos where OrigenID=@catalogoID and estatus=1
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogo_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogo_update] 
	-- Add the parameters for the stored procedure here
	@ID as smallint,
	@desc as text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update Familia_Catalogos set descripcion=@desc,FecModificacion=default where CatalogoID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_Activos_seleccionXProyecto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[FamiliaCatalogos_Activos_seleccionXProyecto]
	-- Add the parameters for the stored procedure here
	@proyecto as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select familia.Nombre as _nom, Nivel_Catalogos.nombre as _nivel, Familia_Catalogos.* from Familia_Catalogos familia inner join Familia_Catalogos on familia.CatalogoID=Familia_Catalogos.OrigenID inner join Nivel_Catalogos on Familia_Catalogos.TipoCatalogoID=Nivel_Catalogos.TipoCatalogoID where Familia_Catalogos.CatalogoID!=1  and Familia_Catalogos.ProyectoID=@proyecto and Familia_Catalogos.estatus=1
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FamiliaCatalogos_insert]
	-- Add the parameters for the stored procedure here
	
	@tipoCatalogoid as smallint,
	@origen as int,
	@nombre as varchar(50),
	@desc as text,
	@compania as smallint,
	@proyectoID as smallint,
	@personal as varchar(7)
AS
BEGIN

declare @id int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
set @id=(select ISNULL (max(CatalogoID),0) as idc from Familia_Catalogos)+1;
	insert into Familia_Catalogos(CatalogoID, TipoCatalogoID, OrigenID, Nombre, Descripcion, CompaniaID, ProyectoID, Personal) values(@id,@tipoCatalogoid, @origen, @nombre, @desc,@compania, @proyectoID, @personal)
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_seleccionXCompanias]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_seleccionXCompanias]
	-- Add the parameters for the stored procedure here
	@compania as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select familia.Nombre as _nom, Nivel_Catalogos.nombre as _nivel, Familia_Catalogos.* from Familia_Catalogos familia inner join Familia_Catalogos on familia.CatalogoID=Familia_Catalogos.OrigenID inner join Nivel_Catalogos on Familia_Catalogos.TipoCatalogoID=Nivel_Catalogos.TipoCatalogoID where Familia_Catalogos.CatalogoID!=1  and Familia_Catalogos.CompaniaID=@compania and Familia_Catalogos.ProyectoID=0
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_seleccionXProyecto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_seleccionXProyecto]
	-- Add the parameters for the stored procedure here
	@proyecto as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select familia.Nombre as _nom, Nivel_Catalogos.nombre as _nivel, Familia_Catalogos.* from Familia_Catalogos familia inner join Familia_Catalogos on familia.CatalogoID=Familia_Catalogos.OrigenID inner join Nivel_Catalogos on Familia_Catalogos.TipoCatalogoID=Nivel_Catalogos.TipoCatalogoID where Familia_Catalogos.CatalogoID!=1  and Familia_Catalogos.ProyectoID=@proyecto
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select familia.Nombre as _nom, Nivel_Catalogos.nombre as _nivel, Familia_Catalogos.* from Familia_Catalogos familia inner join Familia_Catalogos on familia.CatalogoID=Familia_Catalogos.OrigenID inner join Nivel_Catalogos on Familia_Catalogos.TipoCatalogoID=Nivel_Catalogos.TipoCatalogoID 
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_Select_1]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_Select_1]
	-- Add the parameters for the stored procedure here
	
	(@CatalogoFamiliaID as int, @CatalogoID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Familia_Catalogos.CatalogoID, Familia_Catalogos.TipoCatalogoID,Familia_Catalogos.Nombre as NombreCatalogo, Familia_Catalogos.Triger as DisparadorGrupo, 
CatalogoItem.CatalogoItemID, CatalogoItem.Nombre as NombreItem, CatalogoItem.Triger as DisparadorItem  from Familia_Catalogos
 inner join CatalogoItem on Familia_Catalogos.CatalogoID = CatalogoItem.CatalogoID   where 
	Familia_Catalogos.CatalogoID = @CatalogoFamiliaID and CatalogoITem.OrigenItem = @CatalogoID and Familia_Catalogos.estatus=1 and CatalogoItem.estatus=1	 
	
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_select_Companias]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_select_Companias]
	-- Add the parameters for the stored procedure here
	@compania as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select * from Familia_Catalogos where estatus=1 and CatalogoID!=1  and CompaniaID=@compania and ProyectoID=0
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_select_ID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_select_ID]
	-- Add the parameters for the stored procedure here
	@id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select familia.Nombre as _nom, Nivel_Catalogos.nombre as _nivel, Familia_Catalogos.* from Familia_Catalogos familia inner join Familia_Catalogos on familia.CatalogoID=Familia_Catalogos.OrigenID inner join Nivel_Catalogos on Familia_Catalogos.TipoCatalogoID=Nivel_Catalogos.TipoCatalogoID where Familia_Catalogos.CatalogoID=@id
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_selectActivos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_selectActivos]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select * from Familia_Catalogos where estatus=1 and CatalogoID!=1 and OrigenID=1
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_selectID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_selectID]
	-- Add the parameters for the stored procedure here
	@idCatalogo as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select familia.Nombre as _nom, Nivel_Catalogos.nombre as _nivel, Familia_Catalogos.* from Familia_Catalogos familia inner join Familia_Catalogos on familia.CatalogoID=Familia_Catalogos.OrigenID inner join Nivel_Catalogos on Familia_Catalogos.TipoCatalogoID=Nivel_Catalogos.TipoCatalogoID where Familia_Catalogos.CatalogoID=@idCatalogo
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_selectNombre_CatalogoHijo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_selectNombre_CatalogoHijo]
	-- Add the parameters for the stored procedure here
	@catalogo as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Familia_Catalogos  where OrigenID=@catalogo;
	
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_selectNombre_CatalogoPadre]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FamiliaCatalogos_selectNombre_CatalogoPadre]
	-- Add the parameters for the stored procedure here
	@catalogo as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
declare @id int;
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
set @id=(SELECT OrigenID FROM Familia_Catalogos  where CatalogoID=@catalogo);
	SELECT Nombre FROM Familia_Catalogos  where CatalogoID= @id;
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogos_selectNumRegistros_CatalogoHijo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[FamiliaCatalogos_selectNumRegistros_CatalogoHijo]
	-- Add the parameters for the stored procedure here
	@catalogo as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select COUNT(*) as totaL FROM Familia_Catalogos WHERE OrigenID=@catalogo;
END







GO
/****** Object:  StoredProcedure [dbo].[FamiliaCatalogosPadre_select_Companias]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[FamiliaCatalogosPadre_select_Companias]
	-- Add the parameters for the stored procedure here
	@compania as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select * from Familia_Catalogos where estatus=1 and CatalogoID!=1  and CompaniaID=@compania and ProyectoID=0 and OrigenID=1
END







GO
/****** Object:  StoredProcedure [dbo].[Generar_NuevaTransaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <06-Septiembre-2015>
-- Description:	<Genera una nueva Transaccion>
-- =============================================
CREATE PROCEDURE [dbo].[Generar_NuevaTransaccion]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int,@ProyectoID as int, @CampanaID as int, @ProcesoID  as int, @ModuloID as int, @StatusID as int,
            @SubestatusID as int, @TipificacionID as int, @StatusNivel4ID as int, @LlamadaStatusID as int, @LlamadaSubestatusID as int,
			@LlamadaTipificacionID as int,@LlamadaStatusNivel4ID as int, @DatoID as int, @Personal as Varchar(max))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
BEGIN TRAN Insertar_PreTransaccion
BEGIN TRY
	SET NOCOUNT ON;
	declare @nombreTablaDVT as Varchar(max);	 
	select @nombreTablaDVT= Global_TablasCampana.NomTablaTransaccionDV from  Global_TablasCampana
	where Global_TablasCampana.CampanaID=@CampanaID
	declare @Consulta as Varchar(max);
	
	set @Consulta='declare @idTransaccion as int;
	set @idTransaccion=(select  isnull(max(TransaccionID),0) + 1 from '+@nombreTablaDVT+');
	insert into '+@nombreTablaDVT+'(TransaccionID, CompaniaID,ProyectoID,CampanaID,ProcesoID,ModuloID,StatusID,SubestatusID,
	TipificacionID,Status4ID,LlamadaStatusID,LlamadaSubestatusID,LlamadaTipificacionID,LlamadaStatus4ID, DatoID, Personal,ReglaID) 
	values( convert(varchar, @idTransaccion) ,'+ convert(varchar, @CompaniaID)+','+ convert( varchar, @ProyectoID)+','+ CONVERT(varchar, @CampanaID)+
	',' + convert(varchar, @ProcesoID)+ ',' + convert( varchar, @ModuloID)+ ','+ convert(varchar,@StatusID)+','+
	convert(varchar,@SubestatusID)+','+ convert(varchar,@TipificacionID)+','+ convert(varchar,@StatusNivel4ID) +','+ convert(varchar,@LlamadaStatusID)+','+
	convert(varchar,@LlamadaSubestatusID)+','+ convert(varchar,@LlamadaTipificacionID)+','+ convert(varchar,@LlamadaStatusNivel4ID)+','+ convert(varchar,@DatoID)+','''+
	@Personal+''',  ISNULL((select ReglaID from Global_ReglasStatus where ReglaID=(select ReglaID from Global_ConfiguracionStatusLlamada
	where CampanaID=' + CONVERT(varchar, @CampanaID)+'  and LlamadaStatusID= ' + convert(varchar,@LlamadaStatusID) + 'and LlamadaSubestatusID= ' + 
	convert(varchar,@LlamadaSubestatusID) +' and LlamadaTipificacionID='+convert(varchar,@LlamadaTipificacionID) +' and LlamadaStatus4ID='+ convert(varchar, @LlamadaStatusNivel4ID) + ')),0))
	select  @idTransaccion as TransaccionID';
	exec( @Consulta);
	COMMIT TRAN Insertar_PreTransaccion
END TRY
BEGIN CATCH
  ROLLBACK TRAN Insertar_PreTransaccion          
END CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[getGrabarMenuiu]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGrabarMenuiu]
@menuId varchar(5),
@descripcion varchar(150),
@accion varchar(150),
@controlador varchar(150),
@idmenupadre varchar(5),
@menutipoId varchar(5),
@estado varchar(5)
AS
BEGIN
DECLARE @id int
SELECT @id=MAX(menuId) FROM menuAllsoft
IF @id is null
begin
	set @id=1;
end
begin
	set @id = @id +1;
end


IF @menuId = '0'
	BEGIN
		IF @idmenupadre = '0'
		INSERT INTO menuAllsoft
			(
				menuId,
				descripcion,
				accion,
				controlador,
				idmenupadre,
				menutipoId,
				estado
			)
			VALUES
			(
				@id,
				@descripcion,
				'',
				'',
				@id,
				@menutipoId,
				@estado
			)
		ELSE

		INSERT INTO menuAllsoft
			(
				menuId,
				descripcion,
				accion,
				controlador,
				idmenupadre,
				menutipoId,
				estado
			)
			VALUES
			(
				@id,
				@descripcion,
				@accion,
				@controlador,
				@idmenupadre,
				@menutipoId,
				@estado
			)
	END
ELSE
	BEGIN
		IF @idmenupadre = '0'
			UPDATE menuAllsoft SET 
			descripcion = @descripcion, 
			accion = '',
			controlador = '',
			idmenupadre = @menuId,
			menutipoId = @menutipoId,
			estado = @estado
			WHERE menuId = @menuId
		ELSE
			UPDATE menuAllsoft SET 
			descripcion = @descripcion, 
			accion = @accion,
			controlador = @controlador,
			idmenupadre = @idmenupadre,
			menutipoId = @menutipoId,
			estado = @estado
			WHERE menuId = @menuId
	END
END





GO
/****** Object:  StoredProcedure [dbo].[getLogeo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLogeo]
@personal varchar(10),
@clave varchar(10)
AS
BEGIN
	EXEC Login_AFTApp @personal, @clave, 0 ,0
END





GO
/****** Object:  StoredProcedure [dbo].[getMenu]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMenu]
AS
BEGIN
	SELECT
		menuid, descripcion, idmenupadre, orden, accion, controlador, estado
	FROM 
		menuAllsoft
	WHERE estado=1
END





GO
/****** Object:  StoredProcedure [dbo].[getMenuAll]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMenuAll]
AS
BEGIN
	SELECT
		menuid, descripcion, idmenupadre, orden, accion, controlador, estado
	FROM 
		menuAllsoft
END





GO
/****** Object:  StoredProcedure [dbo].[getMenuEstado]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from menuAllsoft where estado=1
--select * from menuAllsoft where menuid = idmenupadre AND estado=1
----getMenutipo
--getMenu
CREATE PROCEDURE [dbo].[getMenuEstado]
@menuId INT,
@estado INT
AS
BEGIN
	UPDATE menuAllsoft SET estado = @estado WHERE menuId = @menuId
END





GO
/****** Object:  StoredProcedure [dbo].[getMenuSelecModificar]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMenuSelecModificar]
@menuId INT
AS
BEGIN
SELECT * FROM menuAllsoft WHERE menuId = @menuId
END





GO
/****** Object:  StoredProcedure [dbo].[getMenuSelectPadre]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMenuSelectPadre]
AS
BEGIN
	SELECT
		*
	FROM 
		menuAllsoft 
	WHERE 
		menuid = idmenupadre AND estado=1
END





GO
/****** Object:  StoredProcedure [dbo].[getMenutipo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from menuAllsoft where estado=1
--select * from menuAllsoft where menuid = idmenupadre AND estado=1
CREATE PROCEDURE [dbo].[getMenutipo]
AS
BEGIN
	SELECT * FROM menuTipo WHERE estatus=1
END





GO
/****** Object:  StoredProcedure [dbo].[Global_CampanaDato_select_DatoPrincipal]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Global_CampanaDato_select_DatoPrincipal] 
	-- Add the parameters for the stored procedure here
	 @campanaID as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Nombre as datoPrincipal_ from Global_CampanaDato inner join Global_CatalogoDatos on Global_CampanaDato.DatoID=Global_CatalogoDatos.DatoID where Principal=1 and CampanaID=@campanaID
END






GO
/****** Object:  StoredProcedure [dbo].[Global_Estatus_Modulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Global_Estatus_Modulo] 
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select distinct  Global_ModuloSiguiente.StatusID as SubEstatus , Catalogo_Status.Nombre as Nombre  
from Global_ModuloSiguiente inner join Catalogo_Status on Global_ModuloSiguiente.StatusID= Catalogo_Status.StatusID
where Global_ModuloSiguiente.CompaniaID=@CompaniaID and Global_ModuloSiguiente.ProyectoID=@ProyectoID
and Global_ModuloSiguiente.CampanaID=@CampanaID and Global_ModuloSiguiente.ModuloID=@ModuloID
END






GO
/****** Object:  StoredProcedure [dbo].[Global_FamiliaCatalogos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Global_FamiliaCatalogos_select]
AS
BEGIN
	SET NOCOUNT ON;

	select familia.Nombre as _nom, Nivel_Catalogos.nombre as _nivel, Familia_Catalogos.* from Familia_Catalogos familia inner join Familia_Catalogos on familia.CatalogoID=Familia_Catalogos.OrigenID inner join Nivel_Catalogos on Familia_Catalogos.TipoCatalogoID=Nivel_Catalogos.TipoCatalogoID Order by Nombre
END

GO
/****** Object:  StoredProcedure [dbo].[Global_GuardaPropiedadesModulosDatos_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Global_GuardaPropiedadesModulosDatos_update]
@campaniaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloqueid tinyint,
@datoid smallint,
@campanadatoid int,
@moduloid smallint,
@seccionesdatosid smallint,
@requerido bit,
@disparador text
as
begin
	if(@seccionesdatosid = 0)
	begin
		update Global_Modulo_Datos set SeccionesDatosID = null, Requerido_Obligatorio = @requerido, Disparador = @disparador 
		where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
		and BloqueDatosID = @bloqueid and DatoID = @datoid and CampanaDatoID = @campanadatoid and ModuloID = @moduloid;
	end
	else
	begin
		update Global_Modulo_Datos set SeccionesDatosID = @seccionesdatosid, Requerido_Obligatorio = @requerido, Disparador = @disparador 
		where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
		and BloqueDatosID = @bloqueid and DatoID = @datoid and CampanaDatoID = @campanadatoid and ModuloID = @moduloid;

		
		update Global_Modulo_Datos set SeccionesDatosID = @seccionesdatosid where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
		and BloqueDatosID = @bloqueid and DatoID = @datoid and CampanaDatoID = @campanadatoid;
	end
end






GO
/****** Object:  StoredProcedure [dbo].[Global_MetaVentas_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	selecciona el numero de ventas por campaña
-- =============================================
CREATE PROCEDURE [dbo].[Global_MetaVentas_select]
	-- Add the parameters for the stored procedure here
@campana as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select MetaVentas from  Global_Campana where CampanaID=@campana
END






GO
/****** Object:  StoredProcedure [dbo].[Global_MetaVentas_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Actualiza el numero de ventas por campaña
-- =============================================
CREATE PROCEDURE [dbo].[Global_MetaVentas_update]
	-- Add the parameters for the stored procedure here
@campana as int,
@ventas as tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Global_Campana set MetaVentas=@ventas where CampanaID=@campana
END






GO
/****** Object:  StoredProcedure [dbo].[Global_select_Estatus_Modulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Global_select_Estatus_Modulo]
	-- Add the parameters for the stored procedure here
	@campania as smallint,
	@modulo smallint
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	select DISTINCT Catalogo_Status.Nombre as nombre, Catalogo_Status.StatusID as idEstatus from Catalogo_Status 
	inner join Global_ModuloSiguiente on Catalogo_Status.StatusID=Global_ModuloSiguiente.StatusID 
	where ModuloSiguiente=@modulo and CampanaID=@campania  and  Visible= 1
	 --and Catalogo_Status.StatusID!=1 and Catalogo_Status.StatusID!=2
END






GO
/****** Object:  StoredProcedure [dbo].[Global_Select_Estatus4Modulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Global_Select_Estatus4Modulo] 
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int,@EstatusID as int,@SubEstatusID as int, @TipificacionID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   -- Insert statements for procedure here
	select distinct  Global_ModuloSiguiente.TipificacionID as Estatus4Modulo , Catalogo_Tipificacion.Nombre 
from Global_ModuloSiguiente inner join Catalogo_Tipificacion on Global_ModuloSiguiente.TipificacionID = Catalogo_Tipificacion.TipificacionID
where Global_ModuloSiguiente.CompaniaID= @CompaniaID and Global_ModuloSiguiente.ProyectoID= @ProyectoID
and Global_ModuloSiguiente.CampanaID= @CampanaID  and 
Global_ModuloSiguiente.StatusID= @EstatusID and Global_ModuloSiguiente.SubestatusID= @SubEstatusID  and Global_ModuloSiguiente.TipificacionID = @TipificacionID
END






GO
/****** Object:  StoredProcedure [dbo].[Global_select_EstatusModulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Global_select_EstatusModulo]
	-- Add the parameters for the stored procedure here
	@campania as smallint
AS
BEGIN
declare @modulo smallint;

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @modulo=2;
    -- Insert statements for procedure here
	select DISTINCT Catalogo_Status.Nombre as nombre, Catalogo_Status.StatusID as idEstatus from Catalogo_Status inner join Global_ModuloSiguiente on Catalogo_Status.StatusID=Global_ModuloSiguiente.StatusID where ModuloSiguiente=2 and CampanaID=@campania --and Catalogo_Status.StatusID!=1 and Catalogo_Status.StatusID!=2
END






GO
/****** Object:  StoredProcedure [dbo].[Global_select_EstatusModulo_Osw]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <12-junio-2015>
-- Description:	<Obtiene l lista de estatus configurados para el modulo en turno>
-- =============================================
CREATE PROCEDURE [dbo].[Global_select_EstatusModulo_Osw] 
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select distinct  Global_ModuloSiguiente.StatusID as Estatus , Catalogo_Status.Nombre as Nombre  
from Global_ModuloSiguiente inner join Catalogo_Status on Global_ModuloSiguiente.StatusID= Catalogo_Status.StatusID
where Global_ModuloSiguiente.CompaniaID=@CompaniaID and Global_ModuloSiguiente.ProyectoID=@ProyectoID
and Global_ModuloSiguiente.CampanaID=@CampanaID and Global_ModuloSiguiente.ModuloID=@ModuloID and  Global_ModuloSiguiente.Visible=1
END






GO
/****** Object:  StoredProcedure [dbo].[Global_Select_LlamadaEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Global_Select_LlamadaEstatus]
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct Global_ConfiguracionStatusLlamada.LlamadaStatusID as Estatus, Global_LlamadaStatus.Nombre  from Global_ConfiguracionStatusLlamada
inner join Global_LlamadaStatus on Global_ConfiguracionStatusLlamada.LlamadaStatusID= Global_LlamadaStatus.LlamadaStatusID 
where Global_ConfiguracionStatusLlamada.CompaniaID=@CompaniaID and Global_ConfiguracionStatusLlamada.ProyectoID= @ProyectoID
and Global_ConfiguracionStatusLlamada.CampanaID= @CampanaID 
--and Global_ConfiguracionStatusLlamada.ModuloID= @ModuloID
END






GO
/****** Object:  StoredProcedure [dbo].[Global_Select_LlamadaEstatus4]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Global_Select_LlamadaEstatus4]
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @EstatusID as int, @SubEstatusID as int, @TipificacionID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select distinct Global_ConfiguracionStatusLlamada.LlamadaStatus4ID as LlamadaStatus4ID, Global_LlamadaStatusNivel4.Nombre  from Global_ConfiguracionStatusLlamada
inner join Global_LlamadaStatusNivel4 on Global_ConfiguracionStatusLlamada.LlamadaStatus4ID = Global_LlamadaStatusNivel4.LlamadaStatus4ID 
where Global_ConfiguracionStatusLlamada.CompaniaID=@CompaniaID and Global_ConfiguracionStatusLlamada.ProyectoID= @ProyectoID
and Global_ConfiguracionStatusLlamada.CampanaID= @CampanaID  and Global_ConfiguracionStatusLlamada.LlamadaStatusID= @EstatusID and Global_ConfiguracionStatusLlamada.LlamadaSubestatusID= @SubEstatusID
and Global_ConfiguracionStatusLlamada.LlamadaTipificacionID=@TipificacionID
--and Global_ConfiguracionStatusLlamada.ModuloID= @ModuloID
END






GO
/****** Object:  StoredProcedure [dbo].[Global_Select_LlamadaSubEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Global_Select_LlamadaSubEstatus]
	--(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int,@EstatusID as int)
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @EstatusID as int)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct Global_ConfiguracionStatusLlamada.LlamadaSubestatusID as SubEstatus, Global_LlamadaSubestatus.Nombre  from Global_ConfiguracionStatusLlamada
inner join Global_LlamadaSubestatus on Global_ConfiguracionStatusLlamada.LlamadaSubestatusID= Global_LlamadaSubestatus.LlamadaSubestatusID 
where Global_ConfiguracionStatusLlamada.CompaniaID=@CompaniaID and Global_ConfiguracionStatusLlamada.ProyectoID= @ProyectoID
and Global_ConfiguracionStatusLlamada.CampanaID= @CampanaID and Global_ConfiguracionStatusLlamada.LlamadaStatusID= @EstatusID
--and Global_ConfiguracionStatusLlamada.ModuloID= @ModuloID 
END






GO
/****** Object:  StoredProcedure [dbo].[Global_Select_LlamadaTipificaciones]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <Create Date,,>
-- Description:	<Obtiene el tercer nivel de los estatus de llamada>
-- =============================================
CREATE PROCEDURE [dbo].[Global_Select_LlamadaTipificaciones]
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int,@EstatusID as int, @SubEstatusID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct Global_ConfiguracionStatusLlamada.LlamadaTipificacionID as Tipificaciones, Global_LlamadaTipificacion.Nombre  from Global_ConfiguracionStatusLlamada
inner join Global_LlamadaTipificacion on Global_ConfiguracionStatusLlamada.LlamadaTipificacionID = Global_LlamadaTipificacion.LlamadaTipificacionID 
where Global_ConfiguracionStatusLlamada.CompaniaID=@CompaniaID and Global_ConfiguracionStatusLlamada.ProyectoID= @ProyectoID
and Global_ConfiguracionStatusLlamada.CampanaID= @CampanaID  and Global_ConfiguracionStatusLlamada.LlamadaStatusID= @EstatusID and Global_ConfiguracionStatusLlamada.LlamadaSubestatusID= @SubEstatusID
--and Global_ConfiguracionStatusLlamada.ModuloID= @ModuloID
END






GO
/****** Object:  StoredProcedure [dbo].[Global_Select_SubEstatusModulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<OSwaldo Sanchez Melos >
-- Create date: <!2-Junio-2015>
-- Description:	<Obtiene la lista de SubEstatus que se configuraron para un modulo>
-- =============================================
CREATE PROCEDURE [dbo].[Global_Select_SubEstatusModulo]
	
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int,@EstatusID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select distinct  Global_ModuloSiguiente.SubestatusID as SubEstatusID , Catalogo_Subestatus.Nombre 
from Global_ModuloSiguiente inner join Catalogo_Subestatus on Global_ModuloSiguiente.SubestatusID = Catalogo_Subestatus.SubestatusID
where Global_ModuloSiguiente.CompaniaID=@CompaniaID and Global_ModuloSiguiente.ProyectoID=@ProyectoID
and Global_ModuloSiguiente.CampanaID=@CampanaID and Global_ModuloSiguiente.ModuloID=@ModuloID and Global_ModuloSiguiente.StatusID=@EstatusID
and Global_ModuloSiguiente.Visible=1
END






GO
/****** Object:  StoredProcedure [dbo].[Global_Select_TipificacionesModulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <22 de Julio de 2015>
-- Description:	<Obtiene las tipificaciones para determinado SubEstatus de determinado Estatus de una determinada Campaña>
-- =============================================
CREATE PROCEDURE [dbo].[Global_Select_TipificacionesModulo]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @EstatusID as int,@SubEstatusID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct  Global_ModuloSiguiente.TipificacionID as TipificacionID , Catalogo_Tipificacion.Nombre 
from Global_ModuloSiguiente inner join Catalogo_Tipificacion on Global_ModuloSiguiente.TipificacionID = Catalogo_Tipificacion.TipificacionID
where Global_ModuloSiguiente.CompaniaID= @CompaniaID and Global_ModuloSiguiente.ProyectoID= @ProyectoID
and Global_ModuloSiguiente.CampanaID= @CampanaID and Global_ModuloSiguiente.StatusID= @EstatusID and Global_ModuloSiguiente.SubestatusID= @SubEstatusID
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalActivaDato_insert_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[GlobalActivaDato_insert_update]
@campaniaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloqueid tinyint,
@datoid smallint,
@campanadatoid int,
@moduloid smallint,
@accion tinyint
as
declare @count tinyint;
declare @tabulacion tinyint;
set @tabulacion = 0;
declare @seccionesdatosid smallint;
set @seccionesdatosid = 0;
begin
	
	if(@accion = 1)
	begin
		set @count =(select Count(*) from Global_Modulo_Datos 
		where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
		and BloqueDatosID = @bloqueid and DatoID = @datoid and CampanaDatoID = @campanadatoid and ModuloID = @moduloid);

		    set @tabulacion = (select Distinct Orden_Tabulacion from Global_Modulo_Datos where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
			and CampanaDatoID = @campanadatoid);
			set @seccionesdatosid = (select Distinct SeccionesDatosID from Global_Modulo_Datos where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
			and CampanaDatoID = @campanadatoid and ModuloID <> @moduloid);

			if(@tabulacion = '')
			begin
				set @tabulacion = 0;
			end

			if(@seccionesdatosid = '')
			begin
				set @seccionesdatosid = 0;
			end

		if(@count = 1)
		begin
			set @tabulacion = (select MAX(Orden_Tabulacion) from Global_Modulo_Datos where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
			and DatoID = @datoid);

			update Global_Modulo_Datos set Estatus = 1, Orden_Tabulacion = @tabulacion where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
			and BloqueDatosID = @bloqueid and DatoID = @datoid and CampanaDatoID = @campanadatoid and ModuloID = @moduloid;

			update Global_Modulo_Datos set Orden_Tabulacion = @tabulacion, SeccionesDatosID = @seccionesdatosid where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
			and BloqueDatosID = @bloqueid and DatoID = @datoid and CampanaDatoID = @campanadatoid ;
		end
		else
		begin

			insert into Global_Modulo_Datos (CampanaID, ProyectoID, CompaniaID, BloqueDatosID, DatoID, CampanaDatoID, ModuloID, Requerido_Obligatorio, Orden_Tabulacion,
			Disparador, Origen ,Destino ,Estatus) values (@campaniaid, @proyectoid, @companiaid, @bloqueid, @datoid, @campanadatoid, @moduloid, 0,0,' ',0,0,1);

			update Global_Modulo_Datos set Orden_Tabulacion = @tabulacion, SeccionesDatosID = @seccionesdatosid where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
			and BloqueDatosID = @bloqueid and DatoID = @datoid and CampanaDatoID = @campanadatoid and ModuloID = @moduloid;
		end
	end
	else
	begin
		update Global_Modulo_Datos set Estatus = 0 , Orden_Tabulacion = 0, SeccionesDatosID = null where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
		and BloqueDatosID = @bloqueid and DatoID = @datoid and CampanaDatoID = @campanadatoid and ModuloID = @moduloid;
	end
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalActivaDatoEncuestaCreaColumna_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalActivaDatoEncuestaCreaColumna_update]
@datoencuestaid int,
@campanaid smallint,
@bloqueid tinyint,
@accion tinyint
as
declare @banderaexistereg tinyint;
declare @tablatransaccion varchar(250);
declare @tablahtransaccion varchar(250);
declare @nombredato varchar(250);
declare @tipodato varchar(20);
declare @resultado varchar(MAX);
declare @banderaactiva bit;
begin
	begin tran creacolumna
		begin try

			set @banderaactiva = ( select banderacolumtransaccion from Global_CatalogoDatosEncuesta where CatalogoDatosEncuestaID = @datoencuestaid and CampanaID = @campanaid);

			if( @banderaactiva = 0)
			begin
					set @tablatransaccion = (select NomTablaTransaccionDC from Global_TablasCampana where CampanaID = @campanaid);
					set @tablahtransaccion = (select NomTablaTransaccionHDC from Global_TablasCampana where CampanaID = @campanaid);
					set @nombredato = (select Nombre from Global_CatalogoDatosEncuesta where CatalogoDatosEncuestaID = @datoencuestaid and CampanaID = @campanaid);
					set @tipodato = (select TipoDato from Global_CatalogoDatosEncuesta where CatalogoDatosEncuestaID = @datoencuestaid and CampanaID = @campanaid);
					if(@tipodato != 'etiqueta')
					begin
				    update Global_CatalogoDatosEncuesta set banderacolumtransaccion = 1, estatus = 1 where CatalogoDatosEncuestaID = @datoencuestaid and CampanaID = @campanaid;
					EXEC( 'Alter table ' + @tablatransaccion + ' add ' + @nombredato + ' ' + @tipodato +' ;')
					EXEC( 'Alter table ' + @tablahtransaccion + ' add ' + @nombredato + ' ' + @tipodato +' ;')
				    set @resultado = 'Se activo correctamente y se creo columna';
					end
					else
					begin
					update Global_CatalogoDatosEncuesta set banderacolumtransaccion = 1, estatus = 1 where CatalogoDatosEncuestaID = @datoencuestaid and CampanaID = @campanaid;
					set @resultado = 'Se activo correctamente';
					end
			end
			else
			begin
					if(@accion = 1)
					begin
					update Global_CatalogoDatosEncuesta set estatus = 1 where CatalogoDatosEncuestaID = @datoencuestaid and CampanaID = @campanaid;
					set @resultado = 'Se activo correctamente';
					end
					else
					begin
					update Global_CatalogoDatosEncuesta set estatus = 0 where CatalogoDatosEncuestaID = @datoencuestaid and CampanaID = @campanaid;
					set @resultado = 'Se desactivo correctamente';
					end
			end
			commit tran creacolumna
			select (@resultado) as Resultado;
		end try
		begin catch
			set @resultado = 'error';
			select (@resultado) as Resultado;
			ROLlBACK TRAN creacolumna
		end catch
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalActivaHerramientas_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalActivaHerramientas_update]
@columna varchar(50),
@companiaid smallint,
@proyectoid smallint,
@campaniaid smallint,
@moduloid smallint,
@accion tinyint
as
declare @mensaje varchar(150);
begin
	
		if(@columna = 'BanderaAgendados')
		begin
			update Global_ModuloSiguiente set BanderaAgendados = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Agendados'; 
		end
		if(@columna = 'BanderaEstatusLlamada')
		begin
			update Global_ModuloSiguiente set BanderaEstatusLlamada = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Estatus Llamada';
		end
		if(@columna = 'BanderaBandejaErrores')
		begin
			update Global_ModuloSiguiente set BanderaBandejaErrores = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Bandeja Errores';  
		end
		if(@columna = 'BanderaBandejaVentas')
		begin
			update Global_ModuloSiguiente set BanderaBandejaVentas = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Bandeja Ventas';  
		end
		if(@columna = 'BanderaBandejaValidador')
		begin
			update Global_ModuloSiguiente set BanderaBandejaValidador = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Bandeja Validador';  
		end
		if(@columna = 'BanderaTableroResultados')
		begin
			update Global_ModuloSiguiente set BanderaTableroResultados = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente TableroResultados';  
		end
		if(@columna = 'BanderaAlmacen')
		begin
			update Global_ModuloSiguiente set BanderaAlmacen = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Almacen';  
		end
		if(@columna = 'BanderaImpresion')
		begin
			update Global_ModuloSiguiente set BanderaImpresion = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Impresion';  
		end
		if(@columna = 'BanderaAlmacenOfertar')
		begin
			update Global_ModuloSiguiente set BanderaAlmacenOfertar = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Ofertar';
		end
		if(@columna = 'BanderaBotonGuardar')
		begin
			update Global_ModuloSiguiente set BanderaBotonGuardar = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Boton Guardar';
		end
		if(@columna = 'BanderaPredictivo')
		begin
			update Global_ModuloSiguiente set BanderaPredictivo = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Predictivo';
		end
		if(@columna = 'BanderaFolio')
		begin
			update Global_ModuloSiguiente set BanderaFolio = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Folio';
		end
		if(@columna = 'BanderaControlMarcacion')
		begin
			update Global_ModuloSiguiente set BanderaControlMarcacion = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Control de Marcación';
		end
		if(@columna = 'BanderaRespaldo')
		begin
			update Global_ModuloSiguiente set BanderaRespaldo = @accion where CompaniaID = @companiaid 
			and ProyectoID = @proyectoid and CampanaID = @campaniaid and ModuloID = @moduloid;
			set @mensaje = 'Actualizo Correctamente Respaldo';
		end

		select (@mensaje) as Mensaje;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalActivaSubDatos_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalActivaSubDatos_update]
@campanasubdatosid int,
@accion tinyint,
@campanaid smallint
as
declare @bancolumtransaccion bit;
declare @banestatus bit;
declare @tablatransaccion varchar(250);
declare @tablahtransaccion varchar(250);
declare @nombredato varchar(MAX);
declare @tipodato varchar(20);
declare @mensaje varchar(150);
begin
		set @bancolumtransaccion = (select banderacolumtransaccion from Global_CampanaSubDatos where CampanaSubDatosID = @campanasubdatosid);
		set @tablatransaccion = (select NomTablaTransaccionDC from Global_TablasCampana where CampanaID = @campanaid);
		set @tablahtransaccion = (select NomTablaTransaccionHDC from Global_TablasCampana where CampanaID = @campanaid);
		set @nombredato = (select Nombre from Global_CampanaSubDatos where CampanaSubDatosID = @campanasubdatosid);
		set @tipodato = (select TipoDato from Global_CampanaSubDatos where CampanaSubDatosID = @campanasubdatosid);

		if(@accion = 1)
		begin
			if(@bancolumtransaccion = 1)
			begin
					update Global_CampanaSubDatos set estatus = 1 where CampanaSubDatosID = @campanasubdatosid;
					set @mensaje = 'Se Activo';
			end
			else
			begin
					update Global_CampanaSubDatos set banderacolumtransaccion = 1 ,estatus = 1 where CampanaSubDatosID = @campanasubdatosid;
					EXEC( 'Alter table ' + @tablatransaccion + ' add ' + @nombredato + ' ' + @tipodato +' ;')
					EXEC( 'Alter table ' + @tablahtransaccion + ' add ' + @nombredato + ' ' + @tipodato +' ;')
					set @mensaje = 'Se Activo';
			end
		end
		else
		begin
		update Global_CampanaSubDatos set estatus = 0 where CampanaSubDatosID = @campanasubdatosid;
		set @mensaje = 'Se Desactivo';
		end
		select (@mensaje) as Mensaje;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalActualizaConfiguracionCampanaDato_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalActualizaConfiguracionCampanaDato_insert]
@campanaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloqueid tinyint,
@datoid smallint,
@disparador Text,
@tipocontrol Text,
@etiqueta_campo varchar(100),
@saltoslineapropdato tinyint,
@cargar_desde_excel bit,
@columna_excel varchar(30),
@principal bit,
@style Text,
@reglas Text,
@tiposeleccion varchar(10),
@tablainicio varchar(200),
@seleccioncatalogoid int,
@seleccioncatalogoidant int,
@itemprecarga int,
@banderacascada bit,
@seleccioncatalogoidsig int,
@controlsiguiente varchar(50),
@banderabandeja bit,
@banderabandejasupervisor bit,
@activasubbloque bit,
@mismosubbloque bit
as

declare @campanadatoid int;
declare @pk int;
declare @nomtabladato varchar(200);
declare @cadenaaltertable varchar(MAX);
declare @nombredato varchar(50);
declare @tipodato varchar(20);
declare @estabancoldatocontac bit 
declare @resultado varchar(20);
declare @bandera_columna_excel bit;
begin
	begin tran creacolumna
		begin try

				set @nomtabladato = (select NomTablaDato from Global_TablasCampana where CampanaID = @campanaid );
				set @nombredato = (select Nombre from Global_CatalogoDatos where DatoID = @datoid and BloqueDatosID = @bloqueid);
				set @tipodato = (select TipoDato from Global_CatalogoDatos where DatoID = @datoid and BloqueDatosID = @bloqueid);
				set @bandera_columna_excel = (select banderacolumdatocontacto from Global_CampanaDato where CampanaID = @campanaid and ProyectoID = @proyectoid and 
						 CompaniaID = @companiaid and BloqueDatosID = @bloqueid and DatoID = @datoid)				

				if(@cargar_desde_excel = 1 and @bandera_columna_excel = 0)
				begin

				 Update Global_CampanaDato set Disparador = @disparador, TipoControl = @tipocontrol, Etiqueta_Campo = @etiqueta_campo, SaltosLinea = @saltoslineapropdato, Cargar_Desde_Excel = @cargar_desde_excel,
				 Columna_Excel = @columna_excel, Principal = @principal, Style = @style, Reglas = @reglas, banderacolumdatocontacto = 1, TipoSeleccion = @tiposeleccion, TablaOrigenCatalogo = @tablainicio, FamiliaCatalogoIdInicio = @seleccioncatalogoid,
				  FamiliaCatalogoIdAnterior = @seleccioncatalogoidant, ItemPrecarga = @itemprecarga, BanderaCascada = @banderacascada, FamiliaCatalogoIdSiguiente = @seleccioncatalogoidsig, ControlSiguiente = @controlsiguiente,
				   BanderaBandeja = @banderabandeja, BanderaSubBloque = @activasubbloque, BanderaBandejaSupervisor = @banderabandejasupervisor, BanderaMismoBloque = @mismosubbloque
				 where CampanaID = @campanaid and ProyectoID = @proyectoid and CompaniaID = @companiaid and BloqueDatosID = @bloqueid and DatoID = @datoid;

			     EXEC( 'Alter table ' + @nomtabladato + ' add ' + @nombredato + ' ' + @tipodato +' ;')

				end
				else
				begin

				Update Global_CampanaDato set Disparador = @disparador, TipoControl = @tipocontrol, Etiqueta_Campo = @etiqueta_campo, SaltosLinea = @saltoslineapropdato, Cargar_Desde_Excel = @cargar_desde_excel,
				 Columna_Excel = @columna_excel, Principal = @principal, Style = @style, Reglas = @reglas, TipoSeleccion = @tiposeleccion, TablaOrigenCatalogo = @tablainicio, FamiliaCatalogoIdInicio = @seleccioncatalogoid,
				  FamiliaCatalogoIdAnterior = @seleccioncatalogoidant, ItemPrecarga = @itemprecarga, BanderaCascada = @banderacascada, FamiliaCatalogoIdSiguiente = @seleccioncatalogoidsig, ControlSiguiente = @controlsiguiente, 
				  BanderaBandeja = @banderabandeja, BanderaSubBloque = @activasubbloque, BanderaBandejaSupervisor = @banderabandejasupervisor, BanderaMismoBloque = @mismosubbloque
				where CampanaID = @campanaid and ProyectoID = @proyectoid and CompaniaID = @companiaid and BloqueDatosID = @bloqueid and DatoID = @datoid;

				end
				set @resultado = 'Se actualizo dato';

			commit tran creacolumna
			select (@resultado) as Resultado;
		end try
		begin catch
			ROLlBACK TRAN creacolumna
		end catch
end







GO
/****** Object:  StoredProcedure [dbo].[GlobalActualizaConfiguracionEncuestaDato_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalActualizaConfiguracionEncuestaDato_insert]
@bloqueid tinyint,
@campanaid smallint,
@proyectoid smallint,
@companiaid smallint,
@datoencuestaid int,
@nombre varchar(250),
@etiqueta text,
@saltolinea tinyint,
@style text,
@reglas text,
@disparador text,
@tipo_control text,
@tipo_dato varchar(20),
@tiposeleccion varchar(10),
@seleccioncatalogoid int,
@tablaorigencatalogo varchar(200),
@seleccioncatalogoidant int,
@itemprecarga int,
@banderacascada bit,
@seleccioncatalogoidsig int,
@controlsiguiente varchar(50),
@activasubbloque bit,
@mismosubbloque bit
as
declare @mensaje varchar(100);
begin
		update Global_CatalogoDatosEncuesta set  
		Etiqueta = @etiqueta, 
		Style = @style, 
		Reglas = @reglas, 
		Disparador = @disparador, 
		Tipo_Control = @tipo_control,
		SaltosLinea = @saltolinea,
		TipoSeleccion = @tiposeleccion,
		TablaOrigenCatalogo = @tablaorigencatalogo, 
		FamiliaCatalogoIdInicio = @seleccioncatalogoid,
		FamiliaCatalogoIdAnterior = @seleccioncatalogoidant,
		ItemPrecarga = @itemprecarga,
		BanderaCascada = @banderacascada,
		FamiliaCatalogoIdSiguiente = @seleccioncatalogoidsig,
		ControlSiguiente = @controlsiguiente,
		BanderaSubBloque = @activasubbloque, 
		BanderaMismoBloque = @mismosubbloque
		where CatalogoDatosEncuestaID = @datoencuestaid and CampanaID = @campanaid;

		set @mensaje = 'Actualizo correctamente'
		select (@mensaje) as Mensaje;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalActualizaConfiguracionSubDato_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalActualizaConfiguracionSubDato_insert]
@campanasubdatosid int,
@campanaid smallint,
@nombre varchar(250),
@etiqueta text,
@style text,
@reglas text,
@disparador text,
@tipo_control text,
@saltoslinea tinyint,
@tipo_dato varchar(20),
@tiposeleccion varchar(10),
@tablaorigencatalogo varchar(200),
@familiacatalogoidinicio int,
@familiacatalogoidanterior int,
@itemprecarga int,
@banderacascada bit,
@familiacatalogoidsiguiente int,
@controlsiguiente varchar(250),
@banderasubbloque bit,
@banderamismobloque bit
as
declare @mensaje varchar(100);
begin
		update Global_CampanaSubDatos set  
		Nombre = @nombre, Etiqueta = @etiqueta, Style = @style, Reglas = @reglas, Disparador = @disparador, Tipo_Control = @tipo_control, SaltosLinea = @saltoslinea,
		TipoDato = @tipo_dato, TipoSeleccion = @tiposeleccion, TablaOrigenCatalogo = @tablaorigencatalogo, FamiliaCatalogoIdInicio = @familiacatalogoidinicio,
		 FamiliaCatalogoIdAnterior = @familiacatalogoidanterior, ItemPrecarga = @itemprecarga, BanderaCascada = @banderacascada, 
		 FamiliaCatalogoIdSiguiente = @familiacatalogoidsiguiente, ControlSiguiente = @controlsiguiente, BanderaSubBloque = @banderasubbloque,
		  BanderaMismoBloque = @banderamismobloque
		where CampanaSubDatosID = @campanasubdatosid and CampanaID = @campanaid;

		set @mensaje = 'Actualizo correctamente'
		select (@mensaje) as Mensaje;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalActualizaTabulacionDato_Update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GlobalActualizaTabulacionDato_Update]
@campaniaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloquedatosid tinyint,
@campanadatoid int,
@moduloid smallint,
@tabulacion tinyint
as
declare @count tinyint;
begin
	set @count = (select COUNT(*) from Global_Modulo_Datos where CampanaID = @campaniaid and ProyectoID = @proyectoid 
		and CompaniaID = @companiaid and BloqueDatosID = @bloquedatosid and Orden_Tabulacion = @tabulacion);
	if(@count = 0 and @tabulacion > 0)
	begin
		Update Global_Modulo_Datos set Orden_Tabulacion = @tabulacion where CampanaID = @campaniaid and ProyectoID = @proyectoid 
		and CompaniaID = @companiaid and BloqueDatosID = @bloquedatosid and CampanaDatoID = @campanadatoid;
	end
end







GO
/****** Object:  StoredProcedure [dbo].[GlobalCampana_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalCampana_Insert]
    @companiaid SMALLINT,
	@proyectoid SMALLINT,
	@tipocampana TINYINT,
	@nombre VARCHAR(30),
	@descripcion TEXT,
	@NombreTabla VARCHAR(200),
	@Almacen Bit,
	@NumAlmacen INT
AS
    DECLARE @idcampana AS SMALLINT;
	DECLARE @msg AS VARCHAR(200);
	DECLARE @NomTD AS VARCHAR(200);
	DECLARE @NomTTDC AS VARCHAR(200);
	DECLARE @NomTTDV AS VARCHAR(200);
	DECLARE @NomTTHDV AS VARCHAR(200);
	DECLARE @NomTTHDC AS VARCHAR(200);
	DECLARE @NomTP AS VARCHAR(200);
	DECLARE @NomTAR AS VARCHAR(200);
	DECLARE @nomTErrores AS VARCHAR(200);
	DECLARE @nomTHAgendado AS VARCHAR(200);
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 BEGIN TRAN Transaccion

		BEGIN TRY

		    SET @NomTD = 'DatoContacto_' + @NombreTabla;
			SET @NomTTDC = 'TransaccionDatosCliente_' + @NombreTabla;
			SET @NomTTDV = 'TransaccionDatosVenta_' + @NombreTabla;
			SET @NomTTHDV = 'TransaccionHistorialDV_'+@NombreTabla;
			SET @NomTTHDC = 'TransaccionHistorialDC_'+@NombreTabla;
			SET @NomTP = 'Profeco_' + @NombreTabla;
			SET @NomTAR = 'Agendados_'+@NombreTabla;
			SET @nomTErrores = 'Errores_'+@NombreTabla;
			SET @nomTHAgendado = 'HistorialAgendados_'+@NombreTabla;
			
			SET @idcampana =(SELECT ISNULL(MAX(CampanaID),0) FROM dbo.Global_Campana) + 1;
			INSERT INTO dbo.Global_Campana(CampanaID, ProyectoID, CompaniaID, TipoCampanaID, Nombre, Descripcion, Almacen, AlmacenID) VALUES (@idcampana, @proyectoid, @companiaid, @tipocampana, @nombre, @descripcion, @Almacen, @NumAlmacen)

            INSERT INTO dbo.Global_TablasCampana(CompaniaID, ProyectoID, CampanaID, NomTablaDato, NomTablaProfeco, NomTablaTransaccionDV, NomTablaTransaccionDC, NomTablaTransaccionHDV, NomTablaTransaccionHDC, NomTablaAgendados, NomTablaErrores ) VALUES (@companiaid, @proyectoid, @idcampana, @NomTD, @NomTP, @NomTTDV, @NomTTDC, @NomTTHDV, @NomTTHDC, @NomTAR, @nomTErrores)

		   --crear tabla de dato contacto
		    EXEC('CREATE TABLE [dbo].[' + @NomTD + '](DatoID BIGINT PRIMARY KEY NOT NULL,
			                                            CompaniaID SMALLINT NOT NULL,
														ProyectoID SMALLINT NOT NULL,
														CampanaID SMALLINT NOT NULL,
														DBHistorialID BIGINT,
														Ciclo TINYINT NOT NULL,
														Profeco BIT NOT NULL,
														Agendado BIT NULL DEFAULT (0),
														Referido BIT NULL DEFAULT (0),
														Duplicado BIT NOT NULL,
														StatusDato BIT NOT NULL DEFAULT(0),
														TransaccionID BIGINT DEFAULT(0),
														AsignadoA VARCHAR(10) DEFAULT(0),
														Fecha_Tomado VARCHAR(50),
														ConfiguracionID BIGINT,
														FOREIGN KEY (CampanaID, ProyectoID, CompaniaID) REFERENCES dbo.Global_Campana(CampanaID, ProyectoID, CompaniaID)
														);')
            --Crear tabla Profeco
			EXEC(N'CREATE TABLE [dbo].[' + @NomTP + N'](DatoID BIGINT PRIMARY KEY NOT NULL,
			                                            CompaniaID SMALLINT NOT NULL,
														ProyectoID SMALLINT NOT NULL,
														CampanaID SMALLINT NOT NULL,
														Telefono VARCHAR(MAX) NOT NULL,
														Fecha DATETIME NOT NULL,
														FOREIGN KEY (CampanaID, ProyectoID, CompaniaID) REFERENCES dbo.Global_Campana(CampanaID, ProyectoID, CompaniaID)
														);')

            --crear tabla de transaccion de datos de venta
			EXEC(N'CREATE TABLE [dbo].[' + @NomTTDV + N'](TransaccionID BIGINT PRIMARY KEY NOT NULL,
			                                            CompaniaID SMALLINT NOT NULL,
														ProyectoID SMALLINT NOT NULL,
														CampanaID SMALLINT NOT NULL,
														ProcesoID SMALLINT NOT NULL,
														ModuloID SMALLINT NOT NULL,
														StatusID SMALLINT NOT NULL,
														SubestatusID SMALLINT NOT NULL,
														TipificacionID SMALLINT NOT NULL,
														Status4ID SMALLINT NOT NULL,
														ReglaStatusModulo TINYINT NOT NULL,
														LlamadaStatusID SMALLINT NOT NULL,
														LlamadaSubestatusID SMALLINT NOT NULL,
														LlamadaTipificacionID SMALLINT NOT NULL,
														LlamadaStatus4ID SMALLINT NOT NULL,
														ReglaStatusLlamada TINYINT NOT NULL,
														DatoID BIGINT NULL,
														Personal VARCHAR(10) NOT NULL,
														BloqueID SMALLINT,
														BandejaOcupado BIT DEFAULT (0),
														Fecha_Alta DATETIME NOT NULL DEFAULT (GETDATE()),
														Status BIT NOT NULL DEFAULT (1),
														FOREIGN KEY (CampanaID, ProyectoID, CompaniaID) REFERENCES dbo.Global_Campana(CampanaID, ProyectoID, CompaniaID),
														FOREIGN KEY (StatusID) REFERENCES dbo.Catalogo_Status(StatusID),
														FOREIGN KEY (SubestatusID) REFERENCES dbo.Catalogo_Subestatus(SubestatusID),
														FOREIGN KEY (TipificacionID) REFERENCES dbo.Catalogo_Tipificacion (TipificacionID),
														FOREIGN KEY (Status4ID) REFERENCES dbo.Catalogo_StatusNivel4 (Statusnivel4ID),
														FOREIGN KEY (LlamadaStatusID) REFERENCES dbo.Global_LlamadaStatus(LlamadaStatusID),
														FOREIGN KEY (LlamadaSubestatusID) REFERENCES dbo.Global_LlamadaSubestatus(LlamadaSubestatusID),
														FOREIGN KEY (LlamadaTipificacionID) REFERENCES dbo.Global_LlamadaTipificacion (LlamadaTipificacionID),
														FOREIGN KEY (LlamadaStatus4ID) REFERENCES dbo.Global_LlamadaStatusNivel4 (LlamadaStatus4ID)
														);')
	        
			--crear tabla de transaccion de datos de cliente
			EXEC(N'CREATE TABLE [dbo].[' + @NomTTDC + N'](TransaccionDatosID BIGINT PRIMARY KEY NOT NULL,
			                                            TransaccionID BIGINT NOT NULL,
														FOREIGN KEY (TransaccionID) REFERENCES dbo.' + @NomTTDV + N'(TransaccionID)
														);')

			--crear tabla de transaccion historial de datos de venta
			EXEC(N'CREATE TABLE [dbo].[' + @NomTTHDV + N'](TransaccionHDVID BIGINT PRIMARY KEY NOT NULL,
														TransaccionID BIGINT NOT NULL,
			                                            CompaniaID SMALLINT NOT NULL,
														ProyectoID SMALLINT NOT NULL,
														CampanaID SMALLINT NOT NULL,
														ProcesoID SMALLINT NOT NULL,
														ModuloID SMALLINT NOT NULL,
														StatusID SMALLINT NOT NULL,
														SubestatusID SMALLINT NOT NULL,
														TipificacionID SMALLINT NOT NULL,
														Status4ID SMALLINT NOT NULL,
														ReglaStatusModulo TINYINT NOT NULL,
														LlamadaStatusID SMALLINT NOT NULL,
														LlamadaSubestatusID SMALLINT NOT NULL,
														LlamadaTipificacionID SMALLINT NOT NULL,
														LlamadaStatus4ID SMALLINT NOT NULL,
														ReglaStatusLlamada TINYINT NOT NULL,
														DatoID BIGINT NULL,
														Personal VARCHAR(10) NOT NULL,
														BloqueID SMALLINT,
														BandejaOcupado BIT DEFAULT (0),
														Fecha_Alta DATETIME NOT NULL DEFAULT (GETDATE()),
														Status BIT NOT NULL DEFAULT (1),
														FOREIGN KEY (CampanaID, ProyectoID, CompaniaID) REFERENCES dbo.Global_Campana(CampanaID, ProyectoID, CompaniaID),
														FOREIGN KEY (StatusID) REFERENCES dbo.Catalogo_Status(StatusID),
														FOREIGN KEY (SubestatusID) REFERENCES dbo.Catalogo_Subestatus(SubestatusID),
														FOREIGN KEY (TipificacionID) REFERENCES dbo.Catalogo_Tipificacion (TipificacionID),
														FOREIGN KEY (Status4ID) REFERENCES dbo.Catalogo_StatusNivel4 (Statusnivel4ID),
														FOREIGN KEY (LlamadaStatusID) REFERENCES dbo.Global_LlamadaStatus(LlamadaStatusID),
														FOREIGN KEY (LlamadaSubestatusID) REFERENCES dbo.Global_LlamadaSubestatus(LlamadaSubestatusID),
														FOREIGN KEY (LlamadaTipificacionID) REFERENCES dbo.Global_LlamadaTipificacion (LlamadaTipificacionID),
														FOREIGN KEY (LlamadaStatus4ID) REFERENCES dbo.Global_LlamadaStatusNivel4 (LlamadaStatus4ID),
														FOREIGN KEY (TransaccionID) REFERENCES dbo.' + @NomTTDV + N'(TransaccionID)
														);')

			--crear tabla de transaccion historial de datos de cliente
			EXEC(N'CREATE TABLE [dbo].[' + @NomTTHDC + N'](HistorialDCID BIGINT PRIMARY KEY NOT NULL,
			                                                TransaccionHDVID BIGINT NOT NULL,
															FOREIGN KEY (TransaccionHDVID) REFERENCES ' + @NomTTHDV + N'(TransaccionHDVID)
															);')
															

            EXEC('CREATE TABLE [dbo].['+ @NomTAR +'](Agendado BIGINT PRIMARY KEY NOT NULL,
			                                         TransaccionID BIGINT NULL,
			                                         CompaniaID SMALLINT NOT NULL,
													 ProyectoID SMALLINT NOT NULL,
													 CampanaID SMALLINT NOT NULL,
													 ModuloID SMALLINT,
													 DatoID BIGINT NOT NULL, 
													 Personal VARCHAR(10) NOT NULL,
													 Nombre VARCHAR(50),
													 ApellidoPaterno VARCHAR(50),
													 ApellidoMaterno VARCHAR(50),
													 NumeroReferencia VARCHAR(10),
													 NumeroReferido VARCHAR(10),
													 EstatusAgendado SMALLINT,
													 EstatusAR BIT NOT NULL,
													 Fecha_Agendado DATE NOT NULL,
													 Hora_Agendados TIME NOT NULL,
													 Descripcion TEXT,
													 DescripcionAgendado TEXT,
													 Fecha_Alta DATETIME NOT NULL DEFAULT (GETDATE()),
													 Fecha_Baja DATETIME,
													 Status BIT NOT NULL DEFAULT (1),
													 FOREIGN KEY (CampanaID, ProyectoID, CompaniaID) REFERENCES dbo.Global_Campana(CampanaID, ProyectoID, CompaniaID),
													 FOREIGN KEY (DatoID) REFERENCES dbo.' + @NomTD + '(DatoID)
													);')

		    EXEC('CREATE TABLE [dbo].['+ @nomTHAgendado +'](HistorialAgendado BIGINT PRIMARY KEY NOT NULL,
			                                         Agendado BIGINT NOT NULL,
			                                         TransaccionID BIGINT NULL,
			                                         CompaniaID SMALLINT NOT NULL,
													 ProyectoID SMALLINT NOT NULL,
													 CampanaID SMALLINT NOT NULL,
													 DatoID BIGINT NOT NULL, 
													 Personal VARCHAR(10) NOT NULL,
													 Nombre VARCHAR(50),
													 ApellidoPaterno VARCHAR(50),
													 ApellidoMaterno VARCHAR(50),
													 NumeroReferencia VARCHAR(10),
													 NumeroReferido VARCHAR(10),
													 EstatusAgendado SMALLINT,
													 EstatusAR BIT NOT NULL,
													 Fecha_Agendado DATE NOT NULL,
													 Hora_Agendados TIME NOT NULL,
													 Descripcion TEXT,
													 DescripcionAgendado TEXT,
													 Fecha_Alta DATETIME NOT NULL DEFAULT (GETDATE()),
													 Fecha_Baja DATETIME,
													 Status BIT NOT NULL DEFAULT (1),
													 FOREIGN KEY (Agendado) REFERENCES dbo.' + @NomTAR + '(Agendado),
													 FOREIGN KEY (CampanaID, ProyectoID, CompaniaID) REFERENCES dbo.Global_Campana(CampanaID, ProyectoID, CompaniaID),
													 FOREIGN KEY (DatoID) REFERENCES dbo.' + @NomTD + '(DatoID)
													);')


			EXEC('CREATE TABLE [dbo].['+ @nomTErrores +'](ErrorID BIGINT PRIMARY KEY NOT NULL,
			                                              HistorialDCID BIGINT NOT NULL,
														  CampoID SMALLINT NOT NULL,
														  ModuloID SMALLINT NOT NULL,
														  Descripcion TEXT NOT NULL,
														  Fecha_Alta DATETIME NOT NULL DEFAULT (GETDATE()),
													      Fecha_Baja DATETIME,
													      Status BIT NOT NULL DEFAULT (1),
														  FOREIGN KEY (HistorialDCID) REFERENCES ' + @NomTTHDC + N'(HistorialDCID)
														  )')
			SET @msg = 'La campaña fue creada .'
			SELECT @msg AS Mensaje, @idcampana As CampanaID
		
		COMMIT TRAN Transaccion

	    END TRY
	    BEGIN CATCH
			ROLLBACK TRAN Transaccion
			SET @msg = 'Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
			SET @idcampana = 0
			SELECT @msg AS Mensaje, @idcampana As CampanaID
			/*SELECT
				ERROR_NUMBER() AS ErrorNumber
				,ERROR_SEVERITY() AS ErrorSeverity
				,ERROR_STATE() AS ErrorState
				,ERROR_PROCEDURE() AS ErrorProcedure
				,ERROR_LINE() AS ErrorLine
				,ERROR_MESSAGE() AS ErrorMessage;*/
	    END CATCH
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalCampana_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalCampana_Select] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_Campana
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalCampana_Select_CampanaID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalCampana_Select_CampanaID]
    @campanaid SMALLINT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM dbo.Global_Campana WHERE CampanaID = @campanaid
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalCampana_Select_Proyectoid]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GlobalCampana_Select_Proyectoid]
	@proyectoid SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT * FROM dbo.Global_Campana WHERE ProyectoID = @proyectoid
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalCompania_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalCompania_Insert] 
	@nombre VARCHAR(30),
	@descripcion TEXT
AS
declare @id smallint;
BEGIN
	SET NOCOUNT ON;
	SET @id =(SELECT ISNULL(MAX(CompaniaID),0) AS id FROM dbo.Global_Compania) + 1;

	INSERT INTO DBO.Global_Compania(CompaniaID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalCompania_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalCompania_Select]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM dbo.Global_Compania
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalConfiguracionStatusLlamada_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalConfiguracionStatusLlamada_Insert]
	@llamadaStatus SMALLINT,
	@llamadaSubestatus SMALLINT,
	@llamadaTipificasion SMALLINT,
	@compania SMALLINT,
	@proyecto SMALLINT,
	@campana SMALLINT,
	@nivel4 SMALLINT,
	@regla SMALLINT,
	@procede BIT
AS
    DECLARE @idconfig AS BIGINT;
	DECLARE @msg AS NVARCHAR(100)
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRAN Transaccion

		BEGIN TRY

			SET @idconfig =(SELECT ISNULL(MAX(ConfiguracionSLlamadaID),0) FROM dbo.Global_ConfiguracionStatusLlamada) + 1;
			INSERT INTO dbo.Global_ConfiguracionStatusLlamada(ConfiguracionSLlamadaID, LlamadaStatusID, LlamadaSubestatusID, LlamadaTipificacionID, CompaniaID, ProyectoID, CampanaID, LlamadaStatus4ID, ReglaID, Procede) VALUES (@idconfig, @llamadaStatus, @llamadaSubestatus, @llamadaTipificasion, @compania, @proyecto, @campana, @nivel4, @regla, @procede)
        
		
			SELECT 'Guardado Exitoso.' AS Mensaje

			SELECT 1 AS Valor

			SELECT * FROM dbo.Global_ConfiguracionStatusLlamada
			--SELECT @msg AS mensaje

			COMMIT TRAN Transaccion

		 END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN Transaccion
			SELECT 'Ocurrio un Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.' AS Mensaje
			SELECT 0 AS Valor
		END CATCH
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalConfiguracionStatusLlamada_Select_ids]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalConfiguracionStatusLlamada_Select_ids]
	@idCompania AS SMALLINT,
	@idProyecto AS SMALLINT,
	@idCampana AS SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_ConfiguracionStatusLlamada WHERE CompaniaID = @idCompania AND ProyectoID = @idProyecto AND CampanaID = @idCampana
END



GO
/****** Object:  StoredProcedure [dbo].[GlobalConfiguracionStatusLlamada_Update_status]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalConfiguracionStatusLlamada_Update_status] 
	-- Add the parameters for the stored procedure here
	@idConfi BIGINT
AS
DECLARE @var BIT;
DECLARE @Msg VARCHAR(50);
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @var = (SELECT Status FROM dbo.Global_ConfiguracionStatusLlamada WHERE ConfiguracionSLlamadaID = @idConfi)
	
	IF(@var = 1)
	BEGIN
	   UPDATE dbo.Global_ConfiguracionStatusLlamada SET Status = 0 WHERE ConfiguracionSLlamadaID = @idConfi
	   SET @Msg = ('la configuracion fue desactivada');
	 END
	ELSE 
	BEGIN
	   UPDATE dbo.Global_ConfiguracionStatusLlamada SET Status = 1  WHERE ConfiguracionSLlamadaID = @idConfi
	   SET @Msg = ('la configuracion fue activada');
	END

	SELECT @Msg AS MEnsaje
END



GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaBloqueCampanias_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaBloqueCampanias_select]
@bloquedatosid tinyint
as
begin
select DISTINCT CampanaID, BloqueDatosID, ProyectoID, CompaniaID from Global_BloqueDatosCampana where BloqueDatosID = @bloquedatosid and Estatus = 1;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaBloqueDatos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaBloqueDatos_select]
as
begin
	select * from Global_BloqueDatos;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaBloqueDatosID_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaBloqueDatosID_select]
@BloqueDatosID tinyint
as
begin
	select BloqueDatosID, Nombre, Descripcion, Fecha_Alta, ISNULL(Fecha_Baja,0) as Fecha_Baja, Estatus, TipoBloque from Global_BloqueDatos
	where BloqueDatosID = @BloqueDatosID;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaCampanaDato_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaCampanaDato_select]
@campaniaid SMALLINT,
@proyectoid SMALLINT,
@companiaid SMALLINT,
@bloqueid TINYINT,
@datoid SMALLINT
as
begin
select CampanaID, ProyectoID, CompaniaID, BloqueDatosID, DatoID, CampanaDatoID,
Disparador, TipoControl, ISNULL(Etiqueta_Campo,0) as Etiqueta_Campo, 
ISNULL(Etiqueta_Campo,0) as Etiqueta_Campo, ISNULL(SaltosLinea,0) as SaltosLinea,
ISNULL(Cargar_Desde_Excel,0) as Cargar_Desde_Excel, 
ISNULL(Columna_Excel,0) as Columna_Excel, ISNULL(Principal,0) as Principal, ISNULL(Fecha_Alta,0) as Fecha_Alta, 
ISNULL(Fecha_Baja,0) as Fecha_Baja, Style, ISNULL(Orden_Tab,0) as Orden_Tab, Reglas, ISNULL(TipoSeleccion,0) as TipoSeleccion, ISNULL(TablaOrigenCatalogo,0) as TablaOrigenCatalogo
, ISNULL(FamiliaCatalogoIdInicio,0) as FamiliaCatalogoIdInicio, ISNULL(ItemPrecarga,0) as ItemPrecarga, ISNULL(BanderaCascada,0) as BanderaCascada,
 ISNULL(FamiliaCatalogoIdSiguiente,0) as FamiliaCatalogoIdSiguiente, ISNULL(ControlSiguiente,0) as ControlSiguiente, ISNULL(BanderaSubBloque,0) as BanderaSubBloque, 
 ISNULL(FamiliaCatalogoIdAnterior,0) as FamiliaCatalogoIdAnterior, ISNULL(BanderaBandeja,0) as BanderaBandeja, ISNULL(BanderaBandejaSupervisor,0) as BanderaBandejaSupervisor, ISNULL(BanderaMismoBloque,0) as BanderaMismoBloque
from Global_CampanaDato 
where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid and BloqueDatosID = @bloqueid and DatoID = @datoid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaCampaniaID_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaCampaniaID_select]
@campaniaid smallint
as
begin
select * from Global_Campana where CampanaID = @campaniaid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaCampanias_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaCampanias_select]
as
begin
	select * from Global_Campana;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaControlesConfigurados_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GlobalConsultaControlesConfigurados_select]
@campanaid smallint
as
begin
select cd.CampanaDatoID, ct.DatoID, ct.Nombre from Global_CampanaDato as cd FULL OUTER JOIN Global_CatalogoDatos as ct ON
cd.DatoID = ct.DatoID where cd.CampanaID = @campanaid;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaControlesEncuesta_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaControlesEncuesta_select]
@campanaid smallint
as
begin
select Nombre, CatalogoDatosEncuestaID from Global_CatalogoDatosEncuesta where CampanaID = @campanaid and TipoDato != 'etiqueta';
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaDatoActivo_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaDatoActivo_Select]
@campaniaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloquedatosid tinyint,
@datoid smallint,
@campanadatoid int,
@moduloid smallint
as
begin
select Estatus, ISNULL(SeccionesDatosID,0) as SeccionesDatosID, Orden_Tabulacion from Global_Modulo_Datos
where CampanaID = @campaniaid and ProyectoID = @proyectoid 
and CompaniaID = @companiaid and BloqueDatosID = @bloquedatosid 
and DatoID = @datoid and CampanaDatoID = @campanadatoid 
and ModuloID = @moduloid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaDatoConfigurado_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaDatoConfigurado_select]
@campaniaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloquedatosid tinyint,
@datoid smallint
as
begin
select ISNULL(CampanaDatoID,0) as CampanaDatoID, ISNULL(BanderaSubBloque,0) as BanderaSubBloque, ISNULL(TipoSeleccion,0) as TipoSeleccion, ISNULL(FamiliaCatalogoIdInicio,0) as FamiliaCatalogoIdInicio, ISNULL(BanderaMismoBloque,0) as BanderaMismoBloque from Global_CampanaDato 
where CampanaID = @campaniaid 
and ProyectoID = @proyectoid
and CompaniaID = @companiaid
and BloqueDatosID = @bloquedatosid
and DatoID = @datoid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaDatos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaDatos_select]
@bloquedatosid tinyint
as
begin
	select 
	 DatoID,
	 BloqueDatosID,
	 Nombre,
	 TipoDato, 
	 Descripcion,
	 Fecha_Alta, 
	 ISNULL(Fecha_Baja,0) as Fecha_Baja, 
	 Estatus 
	 from Global_CatalogoDatos
	 where BloqueDatosID = @bloquedatosid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaDatosActivados_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaDatosActivados_select]
@bloquedatosid tinyint,
@campanaid smallint
as
begin
/*SELECT *  
FROM Global_CatalogoDatos as ca
left JOIN Global_CampanaDato as cd
ON ca.DatoID = cd.DatoID where ca.BloqueDatosID = @bloquedatosid and cd.CampanaID = @campanaid;*/
SELECT a.DatoID, a.BloqueDatosID, a.Nombre, a.TipoDato, a.Descripcion, a.Fecha_Alta, Estatus, 
ISNULL(b.CampanaDatoID,0) as CampanaDatoID, ISNULL(b.TipoSeleccion,0) as TipoSeleccion, ISNULL(b.FamiliaCatalogoIdInicio,0) as FamiliaCatalogoIdInicio, 
ISNULL(b.BanderaSubBloque,0) as BanderaSubBloque, ISNULL(b.BanderaMismoBloque,0) as BanderaMismoBloque
FROM 
Global_CatalogoDatos a FULL JOIN (SELECT * FROM Global_CampanaDato c WHERE c.CampanaID=@campanaid )  b on a.DatoID = b.DatoID
WHERE
a.BloqueDatosID = @bloquedatosid;

end





GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaDatosEncuesta_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaDatosEncuesta_select]
@campaniaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloqueid tinyint
as
begin
	select * from Global_CatalogoDatosEncuesta where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid and BloqueDatosID = @bloqueid ORDER BY Orden_Tab ASC;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaDatosEncuestaID_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GlobalConsultaDatosEncuestaID_select]
@campaniaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloqueid tinyint,
@datoencuestaid smallint
as
begin
	select * from Global_CatalogoDatosEncuesta where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid and BloqueDatosID = @bloqueid and CatalogoDatosEncuestaID = @datoencuestaid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaDatosID_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaDatosID_select]
@datosid smallint
as
begin
	select 
	 DatoID,
	 BloqueDatosID,
	 Nombre,
	 TipoDato, 
	 Descripcion,
	 Fecha_Alta, 
	 ISNULL(Fecha_Baja,0) as Fecha_Baja, 
	 Estatus 
	 from Global_CatalogoDatos
	 where DatoID = @datosid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaHerramientasModulos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaHerramientasModulos_select]
@companiaid smallint,
@proyectoid smallint,
@campaniaid smallint,
@moduloid smallint
as
begin
	select Distinct mo.ModuloID, mo.Nombre, ms.ModoluSiguienteID,0, 
	ISNULL(ms.BanderaAgendados,0) as BanderaAgendados, ISNULL(ms.BanderaBandejaErrores,0) as BanderaBandejaErrores, 
	ISNULL(ms.BanderaBandejaValidador,0) as BanderaBandejaValidador, ISNULL(ms.BanderaBandejaVentas,0) as BanderaBandejaVentas, 
	ISNULL(ms.BanderaEstatusLlamada,0) as BanderaEstatusLlamada, ISNULL(ms.BanderaTableroResultados,0) as BanderaTableroResultados, 
	ISNULL(ms.BanderaAlmacen,0) as BanderaAlmacen, ISNULL(ms.BanderaImpresion,0) as BanderaImpresion, ISNULL(ms.BanderaAlmacenOfertar,0) as BanderaAlmacenOfertar,
	ISNULL(ms.BanderaBotonGuardar,0) as BanderaBotonGuardar, ISNULL(ms.BanderaPredictivo,0) as BanderaPredictivo, ISNULL(ms.BanderaFolio,0) as BanderaFolio, 
	ISNULL(ms.BanderaControlMarcacion,0) as BanderaControlMarcacion, ISNULL(ms.BanderaRespaldo,0) as BanderaRespaldo
	from Global_ModuloSiguiente as ms inner join Catalogo_Modulo as mo on ms.ModuloID = mo.ModuloID
	where ms.CompaniaID = @companiaid and ms.ProyectoID = @proyectoid and ms.CampanaID = @campaniaid 
	and ms.ModuloID = @moduloid; 
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaModuloDatos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GlobalConsultaModuloDatos_select]
@campaniaid smallint,
@proyectoid smallint,
@companiaid smallint,
@datoid smallint,
@moduloid smallint,
@bloquedatosid tinyint,
@campanadatoid int
as
begin
		select * from Global_Modulo_Datos where CampanaID = @campaniaid and ProyectoID = @proyectoid and CompaniaID = @companiaid 
		and BloqueDatosID = @bloquedatosid and DatoID = @datoid and CampanaDatoID = @campanadatoid and ModuloID = @moduloid
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaModulos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaModulos_select]
@campaniaid SMALLINT
as
begin
	select Distinct mo.ModuloID, mo.Nombre from Global_ModuloSiguiente as ms inner join 
	Catalogo_Modulo as mo on
	ms.ModuloID = mo.ModuloID
	where ms.CampanaID = @campaniaid; 
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaModulosActivos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaModulosActivos_select]
@campaniaid SMALLINT,
@moduloid SMALLINT,
@bloquedatosid Tinyint
as
declare @conteo tinyint;
begin
set @conteo = (select COUNT(*) from Global_BloqueDatosCampana 
where CampanaID = @campaniaid 
and ModuloID = @moduloid 
and BloqueDatosID = @bloquedatosid
and Estatus = 1);

select @conteo as Conteo;

end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaOrdenBloques_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GlobalConsultaOrdenBloques_select]
@campaniaid SMALLINT,
@moduloid SMALLINT,
@bloquedatosid Tinyint
as
begin
select Orden from Global_BloqueDatosCampana 
where CampanaID = @campaniaid 
and ModuloID = @moduloid 
and BloqueDatosID = @bloquedatosid
and Estatus = 1;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaSeccionesCampana_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalConsultaSeccionesCampana_Select]
@campanaid smallint,
@seccionesdatosid smallint
as
begin
	select Estatus, Orden, OcultaSeccionActiva from Global_SeccionesCampana where CampanaID = @campanaid and SeccionesDatosID = @seccionesdatosid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaSeccionesDatos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GlobalConsultaSeccionesDatos_select]
@bloqueid tinyint
as
begin
select * from Global_SeccionesDatos where BloqueDatosID = @bloqueid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaSubDatos_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GlobalConsultaSubDatos_select]
@tablaorigen varchar(50),
@columna varchar(50),
@idcolumna int,
@campanaid smallint
as
begin
	if(@columna = 'CatalogoDatosEncuestaID')
		begin
				select * from Global_CampanaSubDatos where Tabla_Origen = @tablaorigen and 
				CatalogoDatosEncuestaID = @idcolumna and CampanaID = @campanaid ORDER BY Orden_Tab ASC;
		end
		/*if(@columna = 'DatosEncuestaSelectId')
		begin
				select * from Global_CampanaSubDatos where Tabla_Origen = @tablaorigen and 
				DatosEncuestaSelectId = @idcolumna and CampanaID = @campanaid ORDER BY Orden_Tab ASC;
		end*/
		if(@columna = 'CampanaDatoID')
		begin
				select * from Global_CampanaSubDatos where Tabla_Origen = @tablaorigen and 
				CampanaDatoID = @idcolumna and CampanaID = @campanaid ORDER BY Orden_Tab ASC;
		end
		/*if(@columna = 'CampanaDatoSelectId')
		begin
				select * from Global_CampanaSubDatos where Tabla_Origen = @tablaorigen and 
				CampanaDatoSelectId = @idcolumna and CampanaID = @campanaid ORDER BY Orden_Tab ASC;
		end*/
		if(@columna = 'CampanaSubDatosIDAnt')
		begin
				select * from Global_CampanaSubDatos where Tabla_Origen = @tablaorigen and 
				CampanaSubDatosIDAnt = @idcolumna and CampanaID = @campanaid ORDER BY Orden_Tab ASC;
		end
		/*if(@columna = 'CampanaSubDatosSelectID')
		begin
				select * from Global_CampanaSubDatos where Tabla_Origen = @tablaorigen and 
				CampanaSubDatosSelectID = @idcolumna and CampanaID = @campanaid ORDER BY Orden_Tab ASC;
		end*/
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalConsultaSubDatosID_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GlobalConsultaSubDatosID_select]
@campanasubdatosid int
as
begin
				select * from Global_CampanaSubDatos where CampanaSubDatosID = @campanasubdatosid;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalCreaBloqueDatos_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalCreaBloqueDatos_insert]
@nombre varchar(30),
@descripcion text,
@tipobloque varchar(10),
@proyectoid smallint,
@companiaid smallint
as
declare @id tinyint;
declare @existenombre tinyint;
declare @resultado varchar(250);
declare @estatus bit;
set @estatus = 1;
begin
	set @existenombre = (select COUNT(*) from Global_BloqueDatos where Nombre = @nombre);
		if( @existenombre = 0)
		begin
			set @id = (select ISNULL(MAX(BloqueDatosID),0) as BloqueDatosID from Global_BloqueDatos);
			set @id = @id + 1;
			insert into Global_BloqueDatos (BloqueDatosID,Nombre,Descripcion,Estatus,TipoBloque,ProyectoID,CompaniaID) 
			values (@id,@nombre,@descripcion,@estatus,@tipobloque,@proyectoid,@companiaid);
			set @resultado = 'El bloque'+ @nombre + 'se creo correctamente';
		end
		else
		begin
			set @resultado = 'El bloque '+ @nombre + ' ya existe, intenta con otro nombre';
		end

		select @resultado;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalCreaDatos_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalCreaDatos_insert]
@bloquedatosid tinyint,
@nombre varchar(50),
@tipodato varchar(20),
@descripcion text,
@proyectoid smallint
as
declare @id smallint;
declare @existenombre tinyint;
declare @inserto varchar(100);
declare @estatus bit;
set @estatus = 1;
declare @bannombrencuesta tinyint;
declare @banderanombresubcontrol tinyint;
begin
	set @existenombre = (select COUNT(*) from Global_CatalogoDatos where Nombre = @nombre and ProyectoID = @proyectoid);
	set @bannombrencuesta = ( select Count(*) from Global_CatalogoDatosEncuesta where Nombre = @nombre and ProyectoID = @proyectoid);
    set @banderanombresubcontrol = ( select Count(*) from Global_CampanaSubDatos where Nombre like @nombre and ProyectoID = @proyectoid);
		if( @existenombre = 0 and @bannombrencuesta = 0 and @banderanombresubcontrol = 0)
		begin
			set @id = (select ISNULL(MAX(DatoID),0) as DatoID from Global_CatalogoDatos);
			set @id = @id + 1;
			insert into Global_CatalogoDatos (DatoID,BloqueDatosID,Nombre,TipoDato,Descripcion,Estatus,ProyectoID) 
			values (@id,@bloquedatosid,@nombre,@tipodato,@descripcion,@estatus,@proyectoid);
			set @inserto = 'Se creo correctamente';
		end
		else
		begin
			set @inserto = 'El nombre de campo ya existe en el sistema, ingrese otro.';
		end

		select @inserto;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalCreaDatosConsultaCatalogoAnterior_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalCreaDatosConsultaCatalogoAnterior_select]
@catalogoid int
as
declare @origenid int;
begin
	set @origenid = (select OrigenID from Familia_Catalogos where CatalogoID = @catalogoid);
	select * from Familia_Catalogos where CatalogoID = @origenid;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalCreaDatosConsultaCatalogoItem_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalCreaDatosConsultaCatalogoItem_select]
@catalogoid int
as
begin
	select * from CatalogoItem where CatalogoID = @catalogoid ORDER BY Nombre ASC;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalCreaDatosConsultaCatalogoSiguiente_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GlobalCreaDatosConsultaCatalogoSiguiente_select]
@origenid int
as
begin
	select * from Familia_Catalogos where OrigenID = @origenid;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalDatosCampana_Select_Bloques]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalDatosCampana_Select_Bloques]
	-- Add the parameters for the stored procedure here
	(@CompaniaID int, @ProyectoID int,@CampanaID int,@ModuloID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Global_BloqueDatosCampana.BloqueDatosID, Global_BloqueDatos.Nombre,Global_BloqueDatos.TipoBloque
 from Global_BloqueDatos left join Global_BloqueDatosCampana on Global_BloqueDatos.BloqueDatosID= Global_BloqueDatosCampana.BloqueDatosID
where  Global_BloqueDatosCampana.CampanaID=@CampanaID and Global_BloqueDatosCampana.ProyectoID= @ProyectoID and
Global_BloqueDatosCampana.CompaniaID=@CompaniaID and Global_BloqueDatosCampana.ModuloID=@ModuloID and Global_BloqueDatosCampana.Estatus=1 and Global_BloqueDatos.Estatus=1 
order by Global_BloqueDatosCampana.Orden
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalDatosCampana_Select_Controles]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalDatosCampana_Select_Controles]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int, @BloqueID as int,
	@SeccionID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select  Global_CampanaDato.DatoID, Global_CampanaDato.TipoControl,Global_CampanaDato.Principal, Global_CampanaDato.Disparador as DisparadorControl,Global_CampanaDato.Etiqueta_Campo,Global_CampanaDato.Style,
Global_CampanaDato.Orden_Tab as OrdenSecundario,Global_CampanaDato.Reglas, Global_CampanaDato.SaltosLinea,
Global_CampanaDato.TablaCascadaSiguiente, Global_CampanaDato.TablaOrigenCatalogo, Global_CampanaDato.TipoSeleccion, Global_CampanaDato.FamiliaCatalogoIdInicio as CatalogoInicio,
Global_CampanaDato.ItemPrecarga, Global_CampanaDato.TipoSeleccion, Global_CampanaDato.BanderaCascada, Global_CampanaDato.FamiliaCatalogoIdSiguiente, Global_CampanaDato.ControlSiguiente,
Global_CampanaDato.banderacolumdatocontacto,Global_CampanaDato.banderacolumtransaccion, Global_CampanaDato.FamiliaCatalogoIdInicio as CatalogoInicio,Global_CampanaDato.ItemPrecarga,
Global_Modulo_Datos.Orden_Tabulacion as OrdenPrimario,Global_Modulo_Datos.Requerido_Obligatorio,
Global_Modulo_Datos.Disparador as DisparadorModulo, Global_Modulo_Datos.Origen,Global_Modulo_Datos.Destino,
Global_SeccionesDatos.Nombre as SeccionNombre, Global_CatalogoDatos.Nombre as NombreControl
from Global_CampanaDato left join Global_CatalogoDatos on Global_CatalogoDatos.DatoID= Global_CampanaDato.DatoID
 left join Global_Modulo_Datos on Global_CampanaDato.CampanaDatoID=Global_Modulo_Datos.CampanaDatoID
left join Global_SeccionesDatos on Global_SeccionesDatos.SeccionesDatosID = Global_Modulo_Datos.SeccionesDatosID
left join Global_BloqueDatos on Global_SeccionesDatos.BloqueDatosID= Global_BloqueDatos.BloqueDatosID
where Global_CampanaDato.CompaniaID=@CompaniaID and  Global_CampanaDato.ProyectoID=@ProyectoID and  Global_CampanaDato.CampanaID= @CampanaID and Global_Modulo_Datos.ModuloID=@ModuloID and 
Global_CampanaDato.BloqueDatosID= @BloqueID and Global_SeccionesDatos.SeccionesDatosID= @SeccionID and Global_Modulo_Datos.Estatus=1 order By Global_Modulo_Datos.Orden_Tabulacion
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalDatosCampana_Select_Encuesta]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <10-Agosto-2015>
-- Description:	<Obtiene la configuracion de las encuestas>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalDatosCampana_Select_Encuesta]-- Add the parameters for the stored procedure here
	(@CompaniaID as int,@ProyectoID as int, @CampanaID as int, @BloqueID as int)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Global_CatalogoDatosEncuesta.Tipo_Control as TipoControl, Global_CatalogoDatosEncuesta.Disparador as DisparadorControl,
Global_CatalogoDatosEncuesta.Etiqueta as Etiqueta_Campo, Global_CatalogoDatosEncuesta.Style,
Global_CatalogoDatosEncuesta.Orden_Tab as OrdenSecundario,Global_CatalogoDatosEncuesta.Reglas,
Global_CatalogoDatosEncuesta.TablaCascadaSiguiente, Global_CatalogoDatosEncuesta.TablaOrigenCatalogo, 
Global_CatalogoDatosEncuesta.TipoSeleccion, Global_CatalogoDatosEncuesta.FamiliaCatalogoIdInicio as CatalogoInicio,
Global_CatalogoDatosEncuesta.ItemPrecarga, Global_CatalogoDatosEncuesta.TipoSeleccion, Global_CatalogoDatosEncuesta.BanderaCascada, 
Global_CatalogoDatosEncuesta.FamiliaCatalogoIdSiguiente, Global_CatalogoDatosEncuesta.ControlSiguiente,
Global_CatalogoDatosEncuesta.FamiliaCatalogoIdInicio as CatalogoInicio,Global_CatalogoDatosEncuesta.ItemPrecarga,
Global_CatalogoDatosEncuesta.Disparador as DisparadorModulo, 
Global_CatalogoDatosEncuesta.Nombre as SeccionNombre, Global_CatalogoDatosEncuesta.Nombre as NombreControl,
Global_CatalogoDatosEncuesta.TipoDato
from Global_CatalogoDatosEncuesta
where Global_CatalogoDatosEncuesta.CompaniaID = @CompaniaID and Global_CatalogoDatosEncuesta.ProyectoID= @ProyectoID and  
 Global_CatalogoDatosEncuesta.CampanaID= @CampanaID   and  estatus = 1 and BloqueDatosID = @BloqueID order by Global_CatalogoDatosEncuesta.Orden_Tab
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalDatosCampana_Select_Secciones]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalDatosCampana_Select_Secciones]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as Int,@ProyectoID as int, @CampanaID as int,@ModuloID as int,@BloqueID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  select distinct Global_Modulo_Datos.SeccionesDatosID, 
 (select Nombre from  Global_SeccionesDatos where Global_SeccionesDatos.SeccionesDatosID=Global_Modulo_Datos.SeccionesDatosID ) as Nombre, 
 Global_SeccionesCampana.Orden, OcultaSeccionActiva 
  from Global_Modulo_Datos
 inner join Global_SeccionesCampana on Global_Modulo_Datos.SeccionesDatosID = Global_SeccionesCampana.SeccionesDatosID
 where  Global_Modulo_Datos.CompaniaID= @CompaniaID and Global_Modulo_Datos.ProyectoID = @ProyectoID and  Global_Modulo_Datos.CampanaID= @CampanaID and 
 Global_Modulo_Datos.ModuloID=@ModuloID and Global_Modulo_Datos.BloqueDatosID= @BloqueID   and 
 Global_SeccionesCampana.Estatus=1 
 order by Global_SeccionesCampana.Orden  asc 



END







GO
/****** Object:  StoredProcedure [dbo].[GlobalEditaBloqueDatos_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalEditaBloqueDatos_update]
@bloquedatosid tinyint,
@nombre varchar(30),
@descripcion text
as
declare @resultado varchar(250); 
begin
	update Global_BloqueDatos 
	set Nombre = @nombre, 
	Descripcion = @descripcion
	where 
	BloqueDatosID = @bloquedatosid;

	set @resultado = 'El bloque ' + @nombre + ' Actualizo correctamente';

	select @resultado;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalEditaDatos_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalEditaDatos_update]
@datoid smallint,
@bloquedatosid tinyint,
@nombre varchar(50),
@tipodato varchar(20),
@descripcion text
as
declare @resultado varchar(250);
begin
	update Global_CatalogoDatos set 
	Descripcion = @descripcion
	where
	DatoID = @datoid;

	set @resultado = 'Dato actualizado correctamente';

	select @resultado;

end






GO
/****** Object:  StoredProcedure [dbo].[GlobalEliminaSubCampo_delete]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalEliminaSubCampo_delete]
@campanasubdatosid int
as
declare @bancolumnacreada bit;
declare @mensaje varchar(150);
begin
	set @bancolumnacreada = (select banderacolumtransaccion from Global_CampanaSubDatos where CampanaSubDatosID = @campanasubdatosid);

	if( @bancolumnacreada = 0)
	begin
		delete from Global_CampanaSubDatos where CampanaSubDatosID = @campanasubdatosid;
		set @mensaje = 'Registro Eliminado Correctamente';
	end
	else
	begin
		set @mensaje = 'Ya no es posible eliminar el registro, solo puede ser desactivado';
	end
	select (@mensaje) as Mensaje;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalEstatusBloqueActivo_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalEstatusBloqueActivo_update]
@campaniaid SMALLINT,
@bloquedatosid tinyint,
@moduloid SMALLINT,
@estatus bit
as
begin
 Update Global_BloqueDatosCampana set Estatus = @estatus, Orden = 0, Fecha_Baja = GETDATE ( ) where
 CampanaID = @campaniaid and BloqueDatosID = @bloquedatosid and ModuloID = @moduloid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalGuardaConfiguracionCampanaDato_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalGuardaConfiguracionCampanaDato_insert]
@campanaid smallint,
@proyectoid smallint,
@companiaid smallint,
@bloqueid tinyint,
@datoid smallint,
@disparador Text,
@tipocontrol Text,
@etiqueta_campo varchar(100),
@saltoslineapropdato tinyint,
@cargar_desde_excel bit,
@columna_excel varchar(30),
@principal bit,
@style Text,
@reglas Text,
@tiposeleccion varchar(10),
@tablainicio varchar(200),
@seleccioncatalogoid int,
@seleccioncatalogoidant int,
@itemprecarga int,
@banderacascada bit,
@seleccioncatalogoidsig int,
@controlsiguiente varchar(50),
@banderabandeja bit,
@banderabandejasupervisor bit,
@activasubbloque bit,
@mismosubbloque bit
as
declare @count tinyint;
declare @campanadatoid int;
declare @pk int;
declare @tablatransaccion varchar(250);
declare @tablahtransaccion varchar(250);
declare @nomtabladato varchar(250);
declare @cadenaaltertable varchar(MAX);
declare @nombredato varchar(250);
declare @tipodato varchar(20);
declare @estabancoldatocontac bit 
declare @resultado varchar(MAX);
declare @cadena varchar(MAX);
begin
	begin tran creacolumna
		begin try
			set @count =(select COUNT(*) from Global_CampanaDato where CampanaID = @campanaid and ProyectoID = @proyectoid and 
						 CompaniaID = @companiaid and BloqueDatosID = @bloqueid and DatoID = @datoid);
			if(@count = 0)
			begin
				set @tablatransaccion = (select NomTablaTransaccionDC from Global_TablasCampana where CampanaID = @campanaid);
				set @tablahtransaccion = (select NomTablaTransaccionHDC from Global_TablasCampana where CampanaID = @campanaid);
				set @nomtabladato = (select NomTablaDato from Global_TablasCampana where CampanaID = @campanaid );
				set @nombredato = (select Nombre from Global_CatalogoDatos where DatoID = @datoid and BloqueDatosID = @bloqueid);
				set @tipodato = (select TipoDato from Global_CatalogoDatos where DatoID = @datoid and BloqueDatosID = @bloqueid);
				set @pk = (select ISNULL(MAX(CampanaDatoID),0) from Global_CampanaDato);
				set @pk = @pk + 1;
				set @cadena = 'Alter table ' + @tablatransaccion + ' add ' + @nombredato + ' ' + @tipodato +' ;';

				insert into Global_CampanaDato 
				(CampanaID, ProyectoID, CompaniaID, BloqueDatosID, DatoID, CampanaDatoID, Disparador, TipoControl, Etiqueta_Campo, SaltosLinea, Cargar_Desde_Excel,
				 Columna_Excel, Principal, Style, Orden_Tab, Reglas, banderacolumtransaccion, banderacolumdatocontacto, TipoSeleccion, TablaOrigenCatalogo, FamiliaCatalogoIdInicio, 
				 FamiliaCatalogoIdAnterior, ItemPrecarga, BanderaCascada, TablaCascadaSiguiente, FamiliaCatalogoIdSiguiente, ControlSiguiente, BanderaSubBloque, BanderaBandeja, BanderaBandejaSupervisor, BanderaMismoBloque) 
				values 
				(@campanaid,@proyectoid,@companiaid,@bloqueid,@datoid,@pk,@disparador,@tipocontrol,@etiqueta_campo,@saltoslineapropdato,@cargar_desde_excel,
				@columna_excel,@principal,@style,0,@reglas,1,@cargar_desde_excel,@tiposeleccion,@tablainicio,@seleccioncatalogoid,
				@seleccioncatalogoidant,@itemprecarga,@banderacascada,'dbo.FamiliaCatalogoIdInicio',@seleccioncatalogoidsig,@controlsiguiente,@activasubbloque,@banderabandeja,@banderabandejasupervisor,@mismosubbloque);

				EXEC( 'Alter table ' + @tablatransaccion + ' add ' + @nombredato + ' ' + @tipodato +' ;')
				EXEC( 'Alter table ' + @tablahtransaccion + ' add ' + @nombredato + ' ' + @tipodato +' ;')

				if(@cargar_desde_excel = 1)
				begin
					EXEC( 'Alter table ' + @nomtabladato + ' add ' + @nombredato + ' ' + @tipodato +' ;')
				end
				set @resultado = 'Inserto';
			end
			else
			begin
				set @resultado = 'ya existe';
			end
			commit tran creacolumna
			select (@resultado) as Resultado;
		end try
		begin catch
			ROLlBACK TRAN creacolumna
		end catch
end







GO
/****** Object:  StoredProcedure [dbo].[GlobalGuardaConfiguracionEncuestaDato_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalGuardaConfiguracionEncuestaDato_insert]
@bloqueid tinyint,
@campanaid smallint,
@proyectoid smallint,
@companiaid smallint,
@nombre varchar(250),
@etiqueta text,
@saltolinea tinyint,
@style text,
@reglas text,
@disparador text,
@tipo_control text,
@tipo_dato varchar(20),
@tiposeleccion varchar(10),
@seleccioncatalogoid int,
@tablaorigencatalogo varchar(200),
@seleccioncatalogoidant int,
@itemprecarga int,
@banderacascada bit,
@seleccioncatalogoidsig int,
@controlsiguiente varchar(50),
@activasubbloque bit,
@mismosubbloque bit
as
declare @pk int;
declare @bannombrecontrolencuesta tinyint;
declare @bandatogeneralnombrecontrol tinyint;
declare @banderanombresubcontrol tinyint;
declare @mensaje varchar(150);
begin
	    set @bannombrecontrolencuesta = ( select Count(*) from Global_CatalogoDatosEncuesta where Nombre = @nombre and CampanaID = @campanaid and ProyectoID = @proyectoid);
		set @bandatogeneralnombrecontrol = ( select Count(*) from Global_CatalogoDatos where Nombre = @nombre and ProyectoID = @proyectoid);
		set @banderanombresubcontrol = ( select Count(*) from Global_CampanaSubDatos where Nombre like @nombre and CampanaID = @campanaid and ProyectoID = @proyectoid);
		if(@bannombrecontrolencuesta = 0 and @bandatogeneralnombrecontrol = 0 and @banderanombresubcontrol = 0)
		begin
		set @pk = (select ISNULL(MAX(CatalogoDatosEncuestaID),0) from Global_CatalogoDatosEncuesta);
		set @pk = @pk + 1;
		insert into Global_CatalogoDatosEncuesta (CatalogoDatosEncuestaID, BloqueDatosID, CampanaID, ProyectoID, CompaniaID, 
		Nombre, Etiqueta, Style, Orden_Tab, Reglas, 
		Disparador, Tipo_Control, SaltosLinea, TipoDato, banderacolumtransaccion, estatus, TipoSeleccion, TablaOrigenCatalogo, FamiliaCatalogoIdInicio,
		 FamiliaCatalogoIdAnterior, ItemPrecarga, BanderaCascada, TablaCascadaSiguiente, FamiliaCatalogoIdSiguiente, ControlSiguiente, 
		 BanderaSubBloque, BanderaMismoBloque) 
		values (@pk,@bloqueid,@campanaid,@proyectoid,@companiaid,@nombre,@etiqueta, 
		@style,0,@reglas,@disparador,@tipo_control,@saltolinea,@tipo_dato,0,0,@tiposeleccion,@tablaorigencatalogo,@seleccioncatalogoid,@seleccioncatalogoidant,
		@itemprecarga,@banderacascada,'dbo.FamiliaCatalogoIdInicio',@seleccioncatalogoidsig,@controlsiguiente,@activasubbloque,@mismosubbloque);
		set @mensaje = 'Se creo correctamente'
		select (@mensaje) as Mensaje;
		end
		else
		begin
		set @mensaje = 'El nombre de campo ya existe en el sistema, ingrese otro.'
		select (@mensaje) as Mensaje;
		end
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalGuardaConfiguracionSubDato_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalGuardaConfiguracionSubDato_insert]
@controlpadre text,
@tablaorigen varchar(50),
@columna varchar(50),
@idcolumna int,
@campanaid smallint,
@proyectoid smallint,
@nombre text,
@etiqueta text,
@style text,
@reglas text,
@disparador text,
@tipo_control text,
@saltoslinea tinyint,
@tipo_dato varchar(20),
@tiposeleccion varchar(10),
@tablaorigencatalogo varchar(200),
@familiacatalogoidinicio int,
@familiacatalogoidanterior int,
@itemprecarga int,
@banderacascada bit,
@familiacatalogoidsiguiente int,
@controlsiguiente varchar(250),
@banderasubbloque bit,
@banderamismobloque bit
as
declare @pk int;
declare @bannombrecontrolencuesta tinyint;
declare @bandatogeneralnombrecontrol tinyint;
declare @banderanombresubcontrol tinyint;
declare @mensaje varchar(250);
declare @control varchar(max);
declare @cadenacontrol varchar(max);
begin
		set @control = @nombre;
		set @bannombrecontrolencuesta = ( select Count(*) from Global_CatalogoDatosEncuesta where Nombre = @control and CampanaID = @campanaid and ProyectoID = @proyectoid);
		set @bandatogeneralnombrecontrol = ( select Count(*) from Global_CatalogoDatos where Nombre = @control and ProyectoID = @proyectoid);
		set @banderanombresubcontrol = ( select Count(*) from Global_CampanaSubDatos where Nombre LIKE @nombre and CampanaID = @campanaid and ProyectoID = @proyectoid);
		if(@bannombrecontrolencuesta = 0 and @bandatogeneralnombrecontrol = 0 and @banderanombresubcontrol = 0)
		begin
		set @pk = (select ISNULL(MAX(CampanaSubDatosID),0) from Global_CampanaSubDatos);
		set @pk = @pk + 1;

			if(@columna = 'CatalogoDatosEncuestaID')
			begin
				insert into Global_CampanaSubDatos (CampanaSubDatosID, Tabla_Origen, CatalogoDatosEncuestaID, CampanaID, Nombre, Etiqueta, Style, Orden_Tab, Reglas, 
				Disparador, Tipo_Control, SaltosLinea, TipoDato, banderacolumtransaccion, estatus, TipoSeleccion, TablaOrigenCatalogo, FamiliaCatalogoIdInicio, 
				FamiliaCatalogoIdAnterior, ItemPrecarga, BanderaCascada, TablaCascadaSiguiente, FamiliaCatalogoIdSiguiente, ControlSiguiente, 
				BanderaSubBloque, BanderaMismoBloque, ControlPadre, ProyectoID, ItemPadre) 
				values (@pk,@tablaorigen,@idcolumna,@campanaid,@nombre,@etiqueta,@style,0,@reglas,@disparador,@tipo_control,@saltoslinea,@tipo_dato,0,0,@tiposeleccion,@tablaorigencatalogo,
				@familiacatalogoidinicio,@familiacatalogoidanterior,@itemprecarga,@banderacascada,'Familia_Catalogos',@familiacatalogoidsiguiente,
				@controlsiguiente,@banderasubbloque,@banderamismobloque,@controlpadre,@proyectoid,0);
			end
			else
			begin
					if(@columna = 'CampanaDatoID')
					begin
						insert into Global_CampanaSubDatos (CampanaSubDatosID, Tabla_Origen, CampanaDatoID, CampanaID, Nombre, Etiqueta, Style, Orden_Tab, Reglas, 
						Disparador, Tipo_Control, SaltosLinea, TipoDato, banderacolumtransaccion, estatus, TipoSeleccion, TablaOrigenCatalogo, FamiliaCatalogoIdInicio, 
						FamiliaCatalogoIdAnterior, ItemPrecarga, BanderaCascada, TablaCascadaSiguiente, FamiliaCatalogoIdSiguiente, ControlSiguiente, 
						BanderaSubBloque, BanderaMismoBloque, ControlPadre, ProyectoID, ItemPadre) 
						values (@pk,@tablaorigen,@idcolumna,@campanaid,@nombre,@etiqueta,@style,0,@reglas,@disparador,@tipo_control,@saltoslinea,@tipo_dato,0,0,@tiposeleccion,@tablaorigencatalogo,
						@familiacatalogoidinicio,@familiacatalogoidanterior,@itemprecarga,@banderacascada,'Familia_Catalogos',@familiacatalogoidsiguiente,
						@controlsiguiente,@banderasubbloque,@banderamismobloque,@controlpadre,@proyectoid,0);
					end
					else
					begin
							if(@columna = 'CampanaSubDatosIDAnt')
							begin
								insert into Global_CampanaSubDatos (CampanaSubDatosID, Tabla_Origen, CampanaSubDatosIDAnt, CampanaID, Nombre, Etiqueta, Style, Orden_Tab, Reglas, 
								Disparador, Tipo_Control, SaltosLinea, TipoDato, banderacolumtransaccion, estatus, TipoSeleccion, TablaOrigenCatalogo, FamiliaCatalogoIdInicio, 
								FamiliaCatalogoIdAnterior, ItemPrecarga, BanderaCascada, TablaCascadaSiguiente, FamiliaCatalogoIdSiguiente, ControlSiguiente, 
								BanderaSubBloque, BanderaMismoBloque, ControlPadre, ProyectoID, ItemPadre) 
								values (@pk,@tablaorigen,@idcolumna,@campanaid,@nombre,@etiqueta,@style,0,@reglas,@disparador,@tipo_control,@saltoslinea,@tipo_dato,0,0,@tiposeleccion,@tablaorigencatalogo,
								@familiacatalogoidinicio,@familiacatalogoidanterior,@itemprecarga,@banderacascada,'Familia_Catalogos',@familiacatalogoidsiguiente,
								@controlsiguiente,@banderasubbloque,@banderamismobloque,@controlpadre,@proyectoid,0);
							end
					end
			end
			set @mensaje = 'Se creo correctamente';
		end
		else
		begin
		set @mensaje = 'El nombre de campo ya existe en el sistema, ingrese otro.'
		end

		select (@mensaje) as Mensaje;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalGuardaSeccion_insert_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalGuardaSeccion_insert_update]
@seccionid smallint,
@bloqueid tinyint,
@nombre varchar(150),
@descripcion varchar(150),
@accion varchar(20)
as
declare @existenombre tinyint;
declare @id smallint;
declare @mensaje varchar(20);
begin
	if(@accion = 'Insertar')
	begin
			set @existenombre = (select COUNT(*) from Global_BloqueDatos where Nombre = @nombre);
			if( @existenombre = 0)
			begin

			set @id = (select ISNULL(MAX(SeccionesDatosID),0) as SeccionesDatosID from Global_SeccionesDatos);
			set @id = @id + 1;
			Insert into Global_SeccionesDatos (SeccionesDatosID, BloqueDatosID, Nombre, Descripcion, Estatus) 
			values (@id, @bloqueid, @nombre, @descripcion, 1);
			set @mensaje = 'inserto';
			select @mensaje as Mensaje;
			end
	end
	else
	begin
		update Global_SeccionesDatos set Nombre = @nombre, Descripcion = @descripcion WHERE SeccionesDatosID = @seccionid;
		set @mensaje = 'actualizo';
		select @mensaje as Mensaje;
	end
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalInsertaBloqueActivo_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalInsertaBloqueActivo_insert]
@companiaid SMALLINT,
@proyectoid SMALLINT,
@campaniaid SMALLINT,
@bloquedatosid tinyint,
@moduloid SMALLINT
as
declare @estatus tinyint;
set @estatus = 1;
declare @orden tinyint;
set @orden = 0;
begin
	insert into Global_BloqueDatosCampana (CompaniaID, ProyectoID, CampanaID, BloqueDatosID, ModuloID, Estatus, Orden) 
	values (@companiaid, @proyectoid, @campaniaid, @bloquedatosid, @moduloid, @estatus, @orden);
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalInsertaSeccionesCampana_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalInsertaSeccionesCampana_insert]
@seccionesdatosid smallint,
@campanaid smallint,
@accion tinyint,
@bloqueid tinyint
as
declare @count tinyint;
declare @pk smallint;
set @count = 0;
begin
	set @count = (select COUNT(*) from Global_SeccionesCampana where SeccionesDatosID = @seccionesdatosid and CampanaID = @campanaid);
	if(@count > 0)
	begin
			if(@accion = 0)
			begin
			update Global_SeccionesCampana set Estatus = 0, Orden = 0 where  SeccionesDatosID = @seccionesdatosid and CampanaID = @campanaid;
			end
			else
			begin
			update Global_SeccionesCampana set Estatus = 1 where  SeccionesDatosID = @seccionesdatosid and CampanaID = @campanaid;
			end 
	end
	else
	begin
		    set @pk = (select ISNULL(MAX(SeccionesCampana),0) from Global_SeccionesCampana);
			set @pk = @pk + 1;
			insert into Global_SeccionesCampana (SeccionesCampana, SeccionesDatosID, CampanaID, Estatus, Orden, BloqueDatosID) values (@pk,@seccionesdatosid,@campanaid,1,0,@bloqueid);
	end
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalItemPadre_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GlobalItemPadre_update]
@campanasubdatosid int,
@catalogoitemid int
as
declare @mensaje varchar(150);
begin
	update Global_CampanaSubDatos set ItemPadre = @catalogoitemid where CampanaSubDatosID = @campanasubdatosid;
	set @mensaje = 'Actualizo';

	select (@mensaje) as Mensaje;
end 





GO
/****** Object:  StoredProcedure [dbo].[GlobalLlamadaStatusNivel4_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalLlamadaStatusNivel4_Insert]
	@nombre AS VARCHAR(50),
	 @descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET @id =(SELECT ISNULL(MAX(LlamadaStatus4ID),0) FROM dbo.Global_LlamadaStatusNivel4) + 1;
	INSERT INTO dbo.Global_LlamadaStatusNivel4(LlamadaStatus4ID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Global_LlamadaStatusNivel4
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalLlamadaStatusNivel4_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalLlamadaStatusNivel4_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_LlamadaStatusNivel4 ORDER BY Nombre ASC
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalMensajes_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Irvin González Rosario,>
-- Create date: <Create Date, 7-08-2015,>
-- Description:	<Description, Inserta un mensaje y regresa una lista de los mensajes entre usuario que los envia y el que los resive,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalMensajes_Insert] 
	@companiaid SMALLINT,
	@proyectoid SMALLINT,
	@campanaid SMALLINT,
	@mensaje TEXT,
	@deusuario VARCHAR(10),
	@parausuario VARCHAR(10)
AS
DECLARE @Msg SMALLINT
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @Msg =(SELECT ISNULL(MAX(MensajeID),0) FROM dbo.Global_Mensaje) + 1;
	INSERT INTO dbo.Global_Mensaje(MensajeID, CompaniaID, ProyectoID, CampanaID, Mensaje, DeUsuario, ParaUsuario) VALUES(@Msg, @companiaid, @proyectoid, @campanaid, @mensaje, @deusuario, @parausuario);
	--SELECT * FROM dbo.Global_Mensaje WHERE DeUsuario = @deusuario AND ParaUsuario = @parausuario;
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalMensajes_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Irvin González Rosario>
-- Create date: <Create Date,, 11-08-2015>
-- Description:	<Description,,Regresara los ultimos 20 mensajes de una conversacion entre dos usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalMensajes_Select]
	@deusuario VARCHAR(10),
	@parausuario VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT TOP 20 * FROM dbo.Global_Mensaje WHERE (DeUsuario = @deusuario AND ParaUsuario = @parausuario) OR (DeUsuario = @parausuario AND ParaUsuario = @deusuario) ORDER BY MensajeID DESC;
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalModuloSiguiente_Insert_1]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalModuloSiguiente_Insert_1]
  @companiaid SMALLINT,
  @proyectoid SMALLINT,
  @campanaid SMALLINT,
  @procesoid SMALLINT,
  @moduloid SMALLINT,
  @statusid SMALLINT,
  @subestatusid SMALLINT,
  @tipificacionid SMALLINT,
  @status4 SMALLINT,
  @modsiguiente SMALLINT,
  @regla TINYINT
AS
DECLARE @MSGid AS BIGINT;
DECLARE @msg AS VARCHAR(200);
DECLARE @id AS SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRAN Transaccion

		BEGIN TRY

			SET @MSGid = (SELECT ISNULL(MAX(ModoluSiguienteID),0) AS idMax FROM dbo.Global_ModuloSiguiente)+1

			INSERT INTO dbo.Global_ModuloSiguiente(ModoluSiguienteID, 
															CompaniaID, 
															ProyectoID, 
															CampanaID,
															ProcesoID, 
															ModuloID, 
															StatusID, 
															SubestatusID, 
															TipificacionID,
															StatusNivel4,
															ModuloSiguiente,
															ReglaID) VALUES (@MSGid, @companiaid, @proyectoid, @campanaid, @procesoid, @moduloid, @statusid, @subestatusid, @tipificacionid, @status4, @modsiguiente, @regla)
        SET @msg = 'Nueva Configuracion activada .'
		SET @id = 1
			SELECT @msg AS Mensaje, @id As CampanaID
		
		COMMIT TRAN Transaccion

	    END TRY
	    BEGIN CATCH
			ROLLBACK TRAN Transaccion
			SET @msg = 'Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
			SET @id = 0
			SELECT @msg AS Mensaje, @id As CampanaID
	    END CATCH
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalModuloSiguiente_Select_IDMAX]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalModuloSiguiente_Select_IDMAX] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ISNULL(MAX(ModoluSiguienteID),0) AS idMax FROM dbo.Global_ModuloSiguiente
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalModuloSiguiente_Select_ids]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalModuloSiguiente_Select_ids]
	@idCompania AS SMALLINT,
	@idProyecto AS SMALLINT,
	@idCampana AS SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_ModuloSiguiente WHERE CompaniaID = @idCompania AND ProyectoID = @idProyecto AND CampanaID = @idCampana
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalModuloSiguiente_Update_Estatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalModuloSiguiente_Update_Estatus]
	@idMSiguiente BIGINT
AS
DECLARE @var BIT;
DECLARE @Msg VARCHAR(50);
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @var = (SELECT Estatus FROM dbo.Global_ModuloSiguiente WHERE ModoluSiguienteID = @idMSiguiente)
	
	IF(@var = 1)
	BEGIN
	   UPDATE dbo.Global_ModuloSiguiente SET Estatus = 0 WHERE ModoluSiguienteID = @idMSiguiente
	   SET @Msg = ('la configuracion fue desactivada');
	 END
	ELSE 
	BEGIN
	   UPDATE dbo.Global_ModuloSiguiente SET Estatus = 1  WHERE ModoluSiguienteID = @idMSiguiente
	   SET @Msg = ('la configuracion fue activada');
	END

	SELECT @Msg AS MEnsaje

END







GO
/****** Object:  StoredProcedure [dbo].[GlobalModuloSiguiente_Update_Visible]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalModuloSiguiente_Update_Visible] 
	-- Add the parameters for the stored procedure here
	@idMSiguiente BIGINT
AS
DECLARE @var BIT;
DECLARE @Msg VARCHAR(50);
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @var = (SELECT Visible FROM dbo.Global_ModuloSiguiente WHERE ModoluSiguienteID = @idMSiguiente)
	
	IF(@var = 1)
	BEGIN
	   UPDATE dbo.Global_ModuloSiguiente SET Visible = 0 WHERE ModoluSiguienteID = @idMSiguiente
	   SET @Msg = ('la configuracion no es visible');
	 END
	ELSE 
	BEGIN
	   UPDATE dbo.Global_ModuloSiguiente SET Visible = 1  WHERE ModoluSiguienteID = @idMSiguiente
	   SET @Msg = ('la configuracion es visible');
	END

	SELECT @Msg AS MEnsaje
END



GO
/****** Object:  StoredProcedure [dbo].[GlobalMuestraOrdenaSecciones_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalMuestraOrdenaSecciones_select]
@bloqueid tinyint
as
begin
select 
*
from Global_SeccionesDatos where BloqueDatosID = @bloqueid;
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalOcultaSeccionActiva_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GlobalOcultaSeccionActiva_update]
@seccionesdatosid smallint,
@campanaid smallint,
@accion tinyint,
@bloqueid tinyint
as
begin

			if(@accion = 0)
			begin
			update Global_SeccionesCampana set OcultaSeccionActiva = 0 where  SeccionesDatosID = @seccionesdatosid and CampanaID = @campanaid;
			end
			else
			begin
			update Global_SeccionesCampana set OcultaSeccionActiva = 1 where  SeccionesDatosID = @seccionesdatosid and CampanaID = @campanaid;
			end 
end

GO
/****** Object:  StoredProcedure [dbo].[GlobalOrdenaDatosEncuesta_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalOrdenaDatosEncuesta_update]
@datoencuestaid int,
@bloqueid tinyint,
@campanaid smallint,
@orden smallint
as
declare @bandera smallint;
begin
	set @bandera = (select COUNT(*) from Global_CatalogoDatosEncuesta where Orden_Tab = @orden and BloqueDatosID = @bloqueid and CampanaID = @campanaid);
	if(@bandera = 0 and @orden > 0)
	begin
	update Global_CatalogoDatosEncuesta set Orden_Tab = @orden where CatalogoDatosEncuestaID = @datoencuestaid;
	end
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalOrdenaSubDatos_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalOrdenaSubDatos_update]
@controlpadre text,
@campanasubdatosid int,
@orden tinyint,
@campanaid smallint
as
declare @existeorden tinyint;
declare @mensaje varchar(50);
begin
	set @existeorden = (select COUNT(*) from Global_CampanaSubDatos where Orden_Tab = @orden and CampanaID = @campanaid and ControlPadre like @controlpadre);
	if(@existeorden = 0)
	begin
		update Global_CampanaSubDatos set Orden_Tab = @orden where CampanaSubDatosID = @campanasubdatosid;
		set @mensaje = 'Actualizo';
	end
	else
	begin
		set @mensaje = 'No Actualizo';
	end
			select (@mensaje) as Mensaje;
end





GO
/****** Object:  StoredProcedure [dbo].[GlobalOrdenSeccionesCampana_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalOrdenSeccionesCampana_update]
@seccionesdatosid smallint,
@campanaid smallint,
@orden tinyint,
@bloqueid tinyint
as
declare @count tinyint;
begin
	set @count = (select COUNT(*) from Global_SeccionesCampana where CampanaID = @campanaid and Orden = @orden and BloqueDatosID = @bloqueid);
	if(@count = 0 and @orden > 0)
	begin
	update Global_SeccionesCampana set Orden = @orden where CampanaID = @campanaid and SeccionesDatosID = @seccionesdatosid;
	end
end






GO
/****** Object:  StoredProcedure [dbo].[GlobalPerfilPersonal_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalPerfilPersonal_Insert]
	-- Add the parameters for the stored procedure here
	@Personal VARCHAR(10),
	@compania TINYINT,
	@proyecto TINYINT,
	@campana TINYINT,
	@proceso TINYINT,
	@modulos VARCHAR(30)
AS
	DECLARE @id AS BIGINT;
	DECLARE @msg AS NVARCHAR(100)
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY

			SET @id =(SELECT ISNULL(MAX(PerfilID),0) FROM dbo.Global_Perfiles) + 1;
			INSERT INTO dbo.Global_Perfiles(PerfilID, Personal, CompaniaID, ProyectoID, CampanaID, ProcesoID, Modulos) VALUES (@id, @Personal, @compania, @proyecto, @campana, @proceso, @modulos)
        
			SELECT 'Perfil creado.' AS Mensaje

			SELECT 1 AS Valor

			SELECT * FROM dbo.Global_Perfiles WHERE Personal = @Personal
			--SELECT @msg AS mensaje

			COMMIT TRAN Transaccion

		 END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN Transaccion
			SELECT 'Ocurrio un Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.' AS Mensaje
			SELECT 0 AS Valor
		END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[GlobalPerfilPersonal_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalPerfilPersonal_Select]
	-- Add the parameters for the stored procedure here
	@Personal VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_Perfiles WHERE Personal = @Personal
END


GO
/****** Object:  StoredProcedure [dbo].[GlobalPersonal_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalPersonal_Insert] 
	@personal VARCHAR(10),
	@Apaterno VARCHAR(30),
	@Amaterno VARCHAR(30),
	@nombre VARCHAR(30),
	@reportaANom VARCHAR(100),
	@reportaA VARCHAR(10),
	@categoria VARCHAR(50),
	@area	VARCHAR(50),
	@rolID TINYINT
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRAN Transaccion

		BEGIN TRY
			
			INSERT INTO dbo.Global_Personal(Personal, RolID, ApellidoPaterno, ApellidoMaterno, Nombre, ReportaANom, ReportaA, Categoria, Area) VALUES (@personal, @rolID, @Apaterno, @Amaterno, @nombre, @reportaANom, @reportaA, @categoria, @area)
        
			SELECT 'Se guardo el usuario exitosamente.' AS Mensaje

			SELECT 1 AS Valor

			SELECT * FROM dbo.Global_Personal
			COMMIT TRAN Transaccion
		END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN Transaccion
			SELECT 'Ocurrio un Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.' AS Mensaje
			SELECT 0 AS Valor
		END CATCH
	
END


GO
/****** Object:  StoredProcedure [dbo].[GlobalPersonal_Select_id]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalPersonal_Select_id]
	-- Add the parameters for the stored procedure here
	@Personal VARCHAR(10)
AS
DECLARE @Existe TINYINT; 
DECLARE @Msg VARCHAR(50);
DECLARE @Valor TINYINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRAN Transaccion
		BEGIN TRY

			SET @Existe = (SELECT CASE WHEN COUNT (*) >0 THEN 1 ELSE 0 END FROM dbo.Global_Personal WHERE Personal = @Personal)

			IF(@Existe = 0)
				BEGIN
				   SET @Msg = ('No se encontro el usuario en la sistema Allsoft');
				   SET @Valor = 0;
				   SELECT @Msg AS Mensaje
				   SELECT @Valor AS Valor
				 END
				ELSE 
				BEGIN
				   SET @Msg = ('El usuario fue encontrado en el sistema Allsoft');
				   SET @Valor = 1;
				   SELECT @Msg AS Mensaje
				   SELECT @Valor AS Valor
				   SELECT * FROM dbo.Global_Personal WHERE Personal = @Personal
				   
				END
			COMMIT TRAN Transaccion
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN Transaccion
			SELECT 'Ocurrio un Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.' AS Mensaje
			SELECT 0 AS Valor
		END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[GlobalPersonalAFT_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalPersonalAFT_Select] 
	-- Add the parameters for the stored procedure here
	@Personal VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select P.Personal, P.Nombre ,P.ApellidoPaterno, P.ApellidoMaterno ,P2.Personal AS ReportA ,P2.Nombre+' '+P2.ApellidoPaterno+' '+P2.ApellidoMaterno ReportaA, P.Puesto, P.Area, P.Estatus, CAST(P.FechaAlta as date) FechaAlta FROM [AFT].dbo.Personal P INNER JOIN [AFT].dbo.Personal P2 on P.ReportaA=P2.Personal where P.Personal=@Personal
END

GO
/****** Object:  StoredProcedure [dbo].[GlobalPersonalConexion_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalPersonalConexion_Select] 
	-- Add the parameters for the stored procedure here
	@Personal VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT P.Personal, P.Nombre+' '+P.ApellidoPaterno+' '+P.ApellidoMaterno Nombre, P.ReportaA, P.RolID, P.Area, PF.CampanaID FROM dbo.Global_Personal P INNER JOIN dbo.Global_Perfiles PF ON P.Personal = PF.Personal WHERE P.Personal = @Personal
END

GO
/****** Object:  StoredProcedure [dbo].[GlobalProcesoDCampana_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalProcesoDCampana_Select]
	@campanaID AS TINYINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     SELECT Catalogo_Proceso.ProcesoID, Catalogo_Proceso.Nombre FROM Catalogo_Proceso inner join Global_ModuloSiguiente ON Catalogo_Proceso.ProcesoID=Global_ModuloSiguiente.ProcesoID WHERE Global_ModuloSiguiente.CampanaID=@campanaID GROUP BY Catalogo_Proceso.ProcesoID, Catalogo_Proceso.Nombre 
END


GO
/****** Object:  StoredProcedure [dbo].[GlobalProyecto_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[GlobalProyecto_Insert]
    @companiaid SMALLINT,
	@nombre VARCHAR(30),
	@descripcion TEXT
	
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SET @id =(SELECT ISNULL(MAX(ProyectoID),0) FROM dbo.Global_Proyecto) + 1;

	INSERT INTO DBO.Global_Proyecto(ProyectoID, CompaniaID, Nombre, Descripcion) VALUES (@id, @companiaid, @nombre, @descripcion)
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalProyecto_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalProyecto_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_Proyecto
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalProyecto_Select_companiaid]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalProyecto_Select_companiaid]
	@companiaid SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT * FROM dbo.Global_Proyecto WHERE CompaniaID = @companiaid
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalProyecto_Select_ProyectoID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalProyecto_Select_ProyectoID] 
	@Proyectoid SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_Proyecto WHERE ProyectoID = @Proyectoid
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalReglasStatus_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalReglasStatus_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM dbo.Global_ReglasStatus
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalReglaStatus_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalReglaStatus_Insert] 
	-- Add the parameters for the stored procedure here
	@Agenda VARCHAR(5),
	@Dias TINYINT,
	@LiberaDato VARCHAR(5),
	@FinalizaTran VARCHAR(5),
	@Descripcion TEXT
AS
	DECLARE @idRegla AS BIGINT;
	DECLARE @msg AS NVARCHAR(100)
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRAN Transaccion

		BEGIN TRY

			SET @idRegla =(SELECT ISNULL(MAX(ReglaID),0) FROM dbo.Global_ReglasStatus) + 1;
			INSERT INTO dbo.Global_ReglasStatus(ReglaID, Agenda, Dias, LiberaDatoPrincipal, FinalizaTransaccion, Descripcion) VALUES (@idRegla, @Agenda, @Dias, @LiberaDato, @FinalizaTran, @Descripcion)
        
			SELECT 'Regla Creada.' AS Mensaje

			SELECT 1 AS Valor

			SELECT * FROM dbo.Global_ReglasStatus
			--SELECT @msg AS mensaje

			COMMIT TRAN Transaccion

		 END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN Transaccion
			SELECT 'Ocurrio un Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.' AS Mensaje
			SELECT 0 AS Valor
		END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[GlobalRolesPersonal_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalRolesPersonal_Select] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_RolesPersonal
END


GO
/****** Object:  StoredProcedure [dbo].[GlobalStatusNivel4_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalStatusNivel4_Insert]
	 @nombre AS VARCHAR(50),
	 @descripcion AS TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET @id =(SELECT ISNULL(MAX(Statusnivel4ID),0) FROM dbo.Catalogo_StatusNivel4) + 1;
	INSERT INTO dbo.Catalogo_StatusNivel4(Statusnivel4ID, Nombre, Descripcion) VALUES (@id, @nombre, @descripcion)

	SELECT * FROM dbo.Catalogo_StatusNivel4
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalStatusNivel4_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalStatusNivel4_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Catalogo_StatusNivel4
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTablasCampana_select_Campana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTablasCampana_select_Campana]
	-- Add the parameters for the stored procedure here
	@campanaID AS smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Global_TablasCampana where CampanaID=@campanaID

END







GO
/****** Object:  StoredProcedure [dbo].[GlobalTipoCampana_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTipoCampana_Insert] 
	-- Add the parameters for the stored procedure here
	@nombre VARCHAR(50),
	@descripcion TEXT
AS
DECLARE @id SMALLINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRAN Transaccion

		BEGIN TRY
			SET @id =(SELECT ISNULL(MAX(TipoCampanaID),0) FROM dbo.Global_TipoCampana) + 1;

			INSERT INTO DBO.Global_TipoCampana(TipoCampanaID, Tipo, Descripcion) VALUES (@id, @nombre, @descripcion)
			SELECT 'Tipo de Campaña creado.' AS Mensaje

			SELECT 1 AS Valor

			SELECT * FROM dbo.Global_TipoCampana
			--SELECT @msg AS mensaje

			COMMIT TRAN Transaccion

		 END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN Transaccion
			SELECT 'Ocurrio un Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.' AS Mensaje
			SELECT 0 AS Valor
		END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[GlobalTipoCampana_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GlobalTipoCampana_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_TipoCampana
END







GO
/****** Object:  StoredProcedure [dbo].[GlobalTodaInfoPersonal]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTodaInfoPersonal] 
	-- Add the parameters for the stored procedure here
	@Personal VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Global_Personal WHERE Personal = @Personal

	SELECT * FROM dbo.Global_Perfiles WHERE Personal = @Personal AND Estatus = 1
END

GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_CamposBandejaSuper]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GlobalTransaccion_select_CamposBandejaSuper]
	-- Add the parameters for the stored procedure here
	@campanaID as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select Global_CatalogoDatos.Nombre as nombreCampo, Global_CampanaDato.Etiqueta_Campo as etiqueta from Global_CatalogoDatos inner join Global_CampanaDato on Global_CatalogoDatos.DatoID = Global_CampanaDato.DatoID where BanderaBandejaSupervisor=1 and CampanaID=@campanaID
END


GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_CamposEncabezadoBandeja]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_CamposEncabezadoBandeja]
	-- Add the parameters for the stored procedure here
	@campanaID as smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Global_CatalogoDatos.Nombre as nombreCampo, Global_CampanaDato.Etiqueta_Campo as etiqueta, Global_CampanaDato.FamiliaCatalogoIdInicio as fam from Global_CatalogoDatos inner join Global_CampanaDato on Global_CatalogoDatos.DatoID = Global_CampanaDato.DatoID where BanderaBandeja=1 and CampanaID=@campanaID
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_CamposTabla]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_CamposTabla]
	-- Add the parameters for the stored procedure here
	@nombreDC as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COLUMN_NAME as nombre FROM information_schema.columns WHERE table_name = @nombreDC
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_datoPrincipal]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_datoPrincipal]
	-- Add the parameters for the stored procedure here
	@nombreDV as varchar(50),
	@nombreDC as varchar(50),
	@modulo as smallint,
	@estatus as smallint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	--EXEC(N'select * from '+@nombreDV +'INNER join '+@nombreDC+' on '+@nombreDV+'.TransaccionID='+@nombreDC+'.TransaccionID where ModuloID='+@modulo)
--EXEC(N'select * from '+@nombreDV +' INNER join '+@nombreDC+' on '+@nombreDV+'.TransaccionID='+@nombreDC+'.TransaccionID where ModuloID='+@moduloAntID + ' and StatusID ='+ @estatus+' and SubestatusID='+ @subestatus+ ' and TipificacionID='+@tipificacion);	
--EXEC(N'select '+@nombreDC+'.TransaccionID, '+ @datoPrincipal+' as pricipal from '+@nombreDV +' INNER join '+@nombreDC+' on '+@nombreDV+'.TransaccionID='+@nombreDC+'.TransaccionID where ModuloID='+@moduloAntID + ' and StatusID ='+ @estatus+' and SubestatusID='+ @subestatus+ ' and TipificacionID='+@tipificacion);	
EXEC(N'select DISTINCT '+@nombreDC+'.* from Global_ModuloSiguiente inner join '+@nombreDV+' on Global_ModuloSiguiente.StatusID='+@nombreDV+'.StatusID and Global_ModuloSiguiente.SubestatusID='+@nombreDV+'.SubestatusID and Global_ModuloSiguiente.TipificacionID='+@nombreDV+'.TipificacionID inner join '+@nombreDC+' on '+ @nombreDV+'.TransaccionID='+@nombreDC+'.TransaccionID where Global_ModuloSiguiente.ModuloSiguiente='+@modulo+' and Global_ModuloSiguiente.StatusID= '+@estatus);

END







GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_datosBandeja]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_datosBandeja]
	-- Add the parameters for the stored procedure here
	@campos_s as varchar(400),
	@nombreDV as varchar(50),
	@nombreDC as varchar(50),
	@modulo as smallint,
	@estatus as smallint,
	@campana as varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
--EXEC(N'SELECT DISTINCT '+@nombreDC+'.TransaccionID, '+@campos_s+'  FROM Global_ModuloSiguiente inner Join '+@nombreDV+' ventas on Global_ModuloSiguiente.StatusID=ventas.StatusID and Global_ModuloSiguiente.SubestatusID=ventas.SubestatusID and Global_ModuloSiguiente.TipificacionID=ventas.TipificacionID and Global_ModuloSiguiente.CampanaID=ventas.CampanaID INNER JOIN Global_ConfiguracionStatusLlamada ON Global_ConfiguracionStatusLlamada.LlamadaStatusID=ventas.LlamadaStatusID AND Global_ConfiguracionStatusLlamada.LlamadaSubestatusID=ventas.LlamadaSubestatusID AND Global_ConfiguracionStatusLlamada.LlamadaTipificacionID =ventas.LlamadaTipificacionID inner join '+@nombreDC+' ON ventas.TransaccionID='+@nombreDC+'.TransaccionID WHERE Procede=1 and ventas.CampanaID='+@campana+' and Global_ConfiguracionStatusLlamada.CampanaID= '+@campana+' and Global_ModuloSiguiente.StatusID= '+@estatus+' and Global_ModuloSiguiente.ModuloSiguiente='+@modulo);
--EXEC(N'SELECT DISTINCT '+@nombreDC+'.TransaccionID, '+@campos_s+'  FROM Global_ModuloSiguiente inner Join '+@nombreDV+' ventas on Global_ModuloSiguiente.StatusID=ventas.StatusID and Global_ModuloSiguiente.SubestatusID=ventas.SubestatusID and Global_ModuloSiguiente.TipificacionID=ventas.TipificacionID and Global_ModuloSiguiente. StatusNivel4= ventas. Status4ID and Global_ModuloSiguiente.CampanaID=ventas.CampanaID INNER JOIN Global_ConfiguracionStatusLlamada ON Global_ConfiguracionStatusLlamada.LlamadaStatusID=ventas.LlamadaStatusID AND Global_ConfiguracionStatusLlamada.LlamadaSubestatusID=ventas.LlamadaSubestatusID AND Global_ConfiguracionStatusLlamada.LlamadaTipificacionID =ventas.LlamadaTipificacionID and Global_ConfiguracionStatusLlamada. LlamadaStatus4ID= ventas. LlamadaStatus4ID inner join '+@nombreDC+' ON ventas.TransaccionID='+@nombreDC+'.TransaccionID WHERE Procede=1 and ventas.CampanaID='+@campana+' and Global_ConfiguracionStatusLlamada.CampanaID= '+@campana+' and Global_ModuloSiguiente.StatusID= '+@estatus+' and Global_ModuloSiguiente.ModuloSiguiente='+@modulo);

EXEC(N'SELECT DISTINCT '+@nombreDC+'.TransaccionID, '+@campos_s+', CS.Nombre as estatus, Csu.Nombre as subestatus, CT.Nombre as tipificacion, CS4.Nombre as nivel4 FROM Global_ModuloSiguiente inner Join '+@nombreDV+' ventas on Global_ModuloSiguiente.StatusID=ventas.StatusID and Global_ModuloSiguiente.SubestatusID=ventas.SubestatusID and Global_ModuloSiguiente.TipificacionID=ventas.TipificacionID and Global_ModuloSiguiente.StatusNivel4= ventas.Status4ID and Global_ModuloSiguiente.CampanaID=ventas.CampanaID INNER JOIN Global_ConfiguracionStatusLlamada ON Global_ConfiguracionStatusLlamada.LlamadaStatusID=ventas.LlamadaStatusID AND Global_ConfiguracionStatusLlamada.LlamadaSubestatusID=ventas.LlamadaSubestatusID AND Global_ConfiguracionStatusLlamada.LlamadaTipificacionID =ventas.LlamadaTipificacionID and Global_ConfiguracionStatusLlamada.LlamadaStatus4ID= ventas.LlamadaStatus4ID inner join '+@nombreDC+' ON ventas.TransaccionID='+@nombreDC+'.TransaccionID inner join Catalogo_Status CS on ventas.Status=CS.StatusID inner join Catalogo_Subestatus Csu on ventas.SubestatusID=Csu.SubestatusID inner join Catalogo_Tipificacion CT on ventas.TipificacionID=CT.TipificacionID inner join Catalogo_StatusNivel4 CS4 on ventas.Status4ID=CS4.Statusnivel4ID WHERE Procede=1 and ventas.CampanaID='+@campana+' and Global_ConfiguracionStatusLlamada.CampanaID= '+@campana+' and Global_ModuloSiguiente.StatusID= '+@estatus+' and Global_ModuloSiguiente.ModuloSiguiente='+@modulo);

END







GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_datosBandejaEmpleado]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_datosBandejaEmpleado]
	-- Add the parameters for the stored procedure here
	@campos_s as varchar(max),
	@nombreDV as varchar(max),
	@nombreDC as varchar(max),
	@modulo as varchar(10),
	@estatus as varchar(10),
	@campana as varchar(10),
	@PersonalID as varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
--EXEC(N'SELECT DISTINCT '+@nombreDC+'.TransaccionID, '+@campos_s+'  FROM Global_ModuloSiguiente inner Join '+@nombreDV+' ventas on Global_ModuloSiguiente.StatusID=ventas.StatusID and Global_ModuloSiguiente.SubestatusID=ventas.SubestatusID and Global_ModuloSiguiente.TipificacionID=ventas.TipificacionID and Global_ModuloSiguiente.CampanaID=ventas.CampanaID INNER JOIN Global_ConfiguracionStatusLlamada ON Global_ConfiguracionStatusLlamada.LlamadaStatusID=ventas.LlamadaStatusID AND Global_ConfiguracionStatusLlamada.LlamadaSubestatusID=ventas.LlamadaSubestatusID AND Global_ConfiguracionStatusLlamada.LlamadaTipificacionID =ventas.LlamadaTipificacionID inner join '+@nombreDC+' ON ventas.TransaccionID='+@nombreDC+'.TransaccionID WHERE Procede=1 and ventas.CampanaID='+@campana+' and Global_ConfiguracionStatusLlamada.CampanaID= '+@campana+' and Global_ModuloSiguiente.StatusID= '+@estatus+' and  ventas.Personal='''+@PersonalID+''' and Global_ModuloSiguiente.ModuloSiguiente='+@modulo);
--exec(N'SELECT DISTINCT '+@nombreDC+'.TransaccionID, '+@campos_s+'  FROM Global_ModuloSiguiente inner Join '+@nombreDV+' ventas on Global_ModuloSiguiente.StatusID=ventas.StatusID and Global_ModuloSiguiente.SubestatusID=ventas.SubestatusID and Global_ModuloSiguiente.TipificacionID=ventas.TipificacionID and Global_ModuloSiguiente.StatusNivel4= ventas.Status4ID  and Global_ModuloSiguiente.CampanaID=ventas.CampanaID INNER JOIN Global_ConfiguracionStatusLlamada ON Global_ConfiguracionStatusLlamada.LlamadaStatusID=ventas.LlamadaStatusID AND Global_ConfiguracionStatusLlamada.LlamadaSubestatusID=ventas.LlamadaSubestatusID AND Global_ConfiguracionStatusLlamada.LlamadaTipificacionID =ventas.LlamadaTipificacionID and Global_ConfiguracionStatusLlamada.LlamadaStatus4ID= ventas.LlamadaStatus4ID inner join '+@nombreDC+' ON ventas.TransaccionID='+@nombreDC+'.TransaccionID WHERE Procede=1 and ventas.CampanaID='+@campana+' and Global_ConfiguracionStatusLlamada.CampanaID= '+@campana+' and Global_ModuloSiguiente.StatusID= '+@estatus+' and  ventas.Personal='''+@PersonalID+''' and Global_ModuloSiguiente.ModuloSiguiente='+@modulo);
exec(N'SELECT distinct '+@nombreDC+'.TransaccionID, '+@campos_s+'  FROM Global_ModuloSiguiente inner Join '+@nombreDV+' ventas on Global_ModuloSiguiente.StatusID=ventas.StatusID and Global_ModuloSiguiente.SubestatusID=ventas.SubestatusID and Global_ModuloSiguiente.TipificacionID=ventas.TipificacionID and Global_ModuloSiguiente.StatusNivel4= ventas.Status4ID  and Global_ModuloSiguiente.CampanaID=ventas.CampanaID INNER JOIN Global_ConfiguracionStatusLlamada ON Global_ConfiguracionStatusLlamada.LlamadaStatusID=ventas.LlamadaStatusID AND Global_ConfiguracionStatusLlamada.LlamadaSubestatusID=ventas.LlamadaSubestatusID AND Global_ConfiguracionStatusLlamada.LlamadaTipificacionID =ventas.LlamadaTipificacionID and Global_ConfiguracionStatusLlamada.LlamadaStatus4ID= ventas.LlamadaStatus4ID inner join '+@nombreDC+' ON ventas.TransaccionID='+@nombreDC+'.TransaccionID WHERE Procede=1 and ventas.CampanaID='+@campana+' and Global_ConfiguracionStatusLlamada.CampanaID= '+@campana+' and Global_ModuloSiguiente.StatusID= '+@estatus+' and  ventas.Personal='''+@PersonalID+''' and Global_ModuloSiguiente.ModuloSiguiente='+@modulo+'');

DECLARE @a as varchar(max)

END







GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_datosBandejaSuper]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_datosBandejaSuper]
	-- Add the parameters for the stored procedure here
	@campos_s as varchar(max),
	@nombreDV as varchar(50),
	@nombreDC as varchar(50),
	 @f1 as varchar(12),
	 @f2 as  varchar(12)

AS
BEGIN
	DECLARE @FE1 AS VARCHAR(15);
    DECLARE @FE2 AS VARCHAR(15);
	SET NOCOUNT ON;
	SET @FE1=(convert(date, @f1, 103));
    SET @FE2=(convert(date, @f2, 103));

EXEC(N'select TDV.Personal AS PERSONAL, CM.Nombre AS MODULO, C_S.Nombre AS ESTATUS1, C_SUB.Nombre AS ESTATUS2, CT.Nombre AS ESTATUS3, CS4.Nombre AS ESTATUS4, TDV.TransaccionID AS TRANSACCION, ' +@campos_s+ ' 
FROM Catalogo_Modulo CM
INNER JOIN '+ @nombreDV +' TDV on CM.ModuloID=TDV.ModuloID
INNER JOIN '+@nombreDC+' on TDV.TransaccionID=TransaccionDatosCliente_ANTICHURN.TransaccionID 
INNER JOIN Catalogo_Status C_S on TDV.StatusID=C_S.StatusID 
INNER JOIN Catalogo_Subestatus C_SUB ON TDV.SubestatusID=C_SUB.SubestatusID
INNER JOIN Catalogo_Tipificacion CT ON TDV.TipificacionID=CT.TipificacionID
INNER JOIN Catalogo_StatusNivel4 CS4 ON TDV.Status4ID=CS4.Statusnivel4ID
WHERE TDV.Fecha_Alta BETWEEN '''+ @FE1 +''' AND '''+ @FE2+'''');
END



GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_Errores]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_Errores]
	-- Add the parameters for the stored procedure here
@nombreDV as varchar(50),
@nombreDC as varchar(50),
@errores as varchar(50),
@historialDC as varchar(50),
@historialDV as varchar(50),
@HistorialDCID as smallint

AS
BEGIN
DECLARE @CONSULTA varchar(1000);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	set @CONSULTA='(SELECT Global_CatalogoDatos.Nombre as Campo,'+@errores+'.Descripcion as descripcionError, '+@errores+'.ErrorID from '+@nombreDC+' inner join '+ @nombreDV + ' on ' + @nombreDC+'.TransaccionID= '+ @nombreDV + '.TransaccionID inner join '+@historialDV+' on '+@nombreDV+'.TransaccionID='+@historialDV+'.TransaccionID inner join '+@historialDC+' on '+@historialDV+'.TransaccionHDVID='+@historialDC+'.TransaccionHDVID inner join '+ @errores+' on '+@historialDC+'.HistorialDCID='+@errores+'.HistorialDCID inner join Global_CatalogoDatos on Global_CatalogoDatos.DatoID='+@errores+'.CampoID where '+@errores +'.HistorialDCID= '+ CONVERT(NVARCHAR(255), @HistorialDCID )+')';
	exec(@CONSULTA);
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_Select_GeneralLlamadas]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_Select_GeneralLlamadas]
	-- Add the parameters for the stored procedure here
	 @nombreDV as varchar(50),
	 @f1 as varchar(50),
	 @f2 as  varchar(50)
AS
BEGIN
declare @reglaID as smallint;
DECLARE @FE1 AS VARCHAR(15);
DECLARE @FE2 AS VARCHAR(15);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
set @reglaID=(select ReglaID from Global_ReglasStatus where FinalizaTransaccion=1);
--EXEC(N'select COUNT(Personal) as Procede, Personal from '+@nombreDV+' TDV inner join Global_ConfiguracionStatusLlamada GCSL on TDV.LlamadaStatusID=GCSL.LlamadaStatusID AND TDV.LlamadaSubestatusID=GCSL.LlamadaSubestatusID AND TDV.LlamadaTipificacionID=GCSL.LlamadaTipificacionID and TDV.CampanaID=GCSL.CampanaID WHERE Procede=1 AND GCSL.CampanaID='+@campana+' and TDV.Fecha_Alta  BETWEEN '''+@f1+''' AND '''+@f2+''' group by Personal');

SET @FE1=(convert(date, @f1, 103));
SET @FE2=(convert(date, @f2, 103));
EXEC(N'select COUNT(TransaccionID) as procede from '+@nombreDV+' TDV inner join Global_ConfiguracionStatusLlamada GCSL on TDV.LlamadaStatusID=GCSL.LlamadaStatusID AND TDV.LlamadaSubestatusID=GCSL.LlamadaSubestatusID AND TDV.LlamadaTipificacionID=GCSL.LlamadaTipificacionID and TDV.CampanaID=GCSL.CampanaID WHERE Procede=1 AND TDV.Fecha_Alta  BETWEEN '''+@FE1+''' AND '''+@FE2+'''');

EXEC(N'select COUNT(TransaccionID) as noprocede from '+@nombreDV+' TDV inner join Global_ConfiguracionStatusLlamada GCSL on TDV.LlamadaStatusID=GCSL.LlamadaStatusID AND TDV.LlamadaSubestatusID=GCSL.LlamadaSubestatusID AND TDV.LlamadaTipificacionID=GCSL.LlamadaTipificacionID and TDV.CampanaID=GCSL.CampanaID WHERE Procede=0 AND TDV.Fecha_Alta  BETWEEN '''+@FE1+''' AND '''+@FE2+'''');

EXEC(N'select COUNT(TransaccionID) as total from '+@nombreDV+' TDV WHERE TDV.Fecha_Alta  BETWEEN '''+@FE1+''' AND '''+@FE2+'''');

EXEC(N'select COUNT(TransaccionID) as Finalizadas from '+ @nombreDV+' where ReglaStatusModulo='+@reglaID+' and Fecha_Alta between '''+@FE1+''' and '''+@FE2+'''');
END




GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_InformacionTransaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_InformacionTransaccion]
	-- Add the parameters for the stored procedure here
@nombreDV as varchar(50),
@nombreDC as varchar(50),
@errores as varchar(50),
@historialDC as varchar(50),
@historialDV as varchar(50),
@transaccionID as smallint

AS
BEGIN
declare @hitorial smallint;
DECLARE @CONSULTA varchar(1000);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	set @CONSULTA='(SELECT max('+@errores+'.HistorialDCID) as id from '+@nombreDC+' inner join '+ @nombreDV + ' on ' + @nombreDC+'.TransaccionID= '+ @nombreDV + '.TransaccionID inner join '+@historialDV+' on '+@nombreDV+'.TransaccionID='+@historialDV+'.TransaccionID inner join '+@historialDC+' on '+@historialDV+'.TransaccionHDVID='+@historialDC+'.TransaccionHDVID inner join '+ @errores+' on '+@historialDC+'.HistorialDCID='+@errores+'.HistorialDCID inner join Global_CatalogoDatos on Global_CatalogoDatos.DatoID='+@errores+'.CampoID where '+@nombreDC+'.TransaccionID='+ CONVERT(NVARCHAR(255),@transaccionID )+')';
	exec(@CONSULTA);

	EXEC(N'select * from '+ @nombreDC+ ' where TransaccionID='+ @transaccionID)

	EXEC(N'select * from '+@nombreDV+' where TransaccionID='+ @transaccionID)

END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_Select_LlamadasFinalizadas]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_Select_LlamadasFinalizadas]
	-- Add the parameters for the stored procedure here
	 @nombreDV as varchar(50),
	 @f1 as varchar(50),
	 @f2 as  varchar(50)
AS
BEGIN
declare @reglaID as smallint;
DECLARE @FE1 AS VARCHAR(15);
    DECLARE @FE2 AS VARCHAR(15);
	SET NOCOUNT ON;
	SET @FE1=(convert(date, @f1, 103));
    SET @FE2=(convert(date, @f2, 103));
	set @reglaID=(select ReglaID from Global_ReglasStatus where FinalizaTransaccion=1);
    -- Insert statements for procedure here
--EXEC(N'select COUNT(Personal) as Procede, Personal from '+@nombreDV+' TDV inner join Global_ConfiguracionStatusLlamada GCSL on TDV.LlamadaStatusID=GCSL.LlamadaStatusID AND TDV.LlamadaSubestatusID=GCSL.LlamadaSubestatusID AND TDV.LlamadaTipificacionID=GCSL.LlamadaTipificacionID and TDV.CampanaID=GCSL.CampanaID WHERE Procede=1 AND GCSL.CampanaID='+@campana+' and TDV.Fecha_Alta  BETWEEN '''+@f1+''' AND '''+@f2+''' group by Personal');
EXEC(N'select COUNT(TDV.Personal) as Contador, TDV.Personal as Empleado, AFTP.Nombre+' +'''  '''+ '+AFTP.ApellidoPaterno+' +'''  '''+ '+AFTP.ApellidoMaterno NombreCompleto from [10.128.108.50].[AFT].dbo.Personal AFTP inner join '+@nombreDV+' TDV on AFTP.Personal COLLATE DATABASE_DEFAULT =TDV.Personal WHERE ReglaStatusModulo='+@reglaID+' and TDV.Fecha_Alta  BETWEEN '''+@FE1+''' AND '''+@FE2+''' group by TDV.Personal, AFTP.Nombre, AFTP.ApellidoPaterno, AFTP.ApellidoMaterno');

END



GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_Select_LlamadasNoProceden]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_Select_LlamadasNoProceden]
	-- Add the parameters for the stored procedure here
	 @nombreDV as varchar(50),
	 @f1 as varchar(50),
	 @f2 as  varchar(50),
	 @campana as varchar(10)
AS
BEGIN
	DECLARE @FE1 AS VARCHAR(15);
    DECLARE @FE2 AS VARCHAR(15);
	SET NOCOUNT ON;
	SET @FE1=(convert(date, @f1, 103));
    SET @FE2=(convert(date, @f2, 103));

    -- Insert statements for procedure here
--EXEC(N'select COUNT(Personal) as Procede, Personal from '+@nombreDV+' TDV inner join Global_ConfiguracionStatusLlamada GCSL on TDV.LlamadaStatusID=GCSL.LlamadaStatusID AND TDV.LlamadaSubestatusID=GCSL.LlamadaSubestatusID AND TDV.LlamadaTipificacionID=GCSL.LlamadaTipificacionID and TDV.CampanaID=GCSL.CampanaID WHERE Procede=0 AND GCSL.CampanaID='+@campana+' and TDV.Fecha_Alta  BETWEEN '''+@f1+''' AND '''+@f2+''' group by Personal');
EXEC(N'select COUNT(TDV.Personal) as Contador, TDV.Personal as Empleado, AFTP.Nombre+' +'''  '''+ '+AFTP.ApellidoPaterno+' +'''  '''+ '+AFTP.ApellidoMaterno NombreCompleto from [10.128.108.50].[AFT].dbo.Personal AFTP inner join '+@nombreDV+' TDV on AFTP.Personal COLLATE DATABASE_DEFAULT =TDV.Personal COLLATE DATABASE_DEFAULT inner join Global_ConfiguracionStatusLlamada GCSL on TDV.LlamadaStatusID=GCSL.LlamadaStatusID AND TDV.LlamadaSubestatusID=GCSL.LlamadaSubestatusID AND TDV.LlamadaTipificacionID=GCSL.LlamadaTipificacionID and TDV.CampanaID=GCSL.CampanaID WHERE Procede=0 AND GCSL.CampanaID='+@campana+' and TDV.Fecha_Alta  BETWEEN '''+@FE1+''' AND '''+@FE2+''' group by TDV.Personal, AFTP.Nombre, AFTP.ApellidoPaterno, AFTP.ApellidoMaterno');


END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_Select_LlamadasQueProceden]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_Select_LlamadasQueProceden]
	-- Add the parameters for the stored procedure here
	 @nombreDV as varchar(50),
	 @f1 as varchar(50),
	 @f2 as  varchar(50),
	 @campana as varchar(10)
AS
BEGIN
	DECLARE @FE1 AS VARCHAR(15);
    DECLARE @FE2 AS VARCHAR(15);
	SET NOCOUNT ON;
	SET @FE1=(convert(date, @f1, 103));
    SET @FE2=(convert(date, @f2, 103));

    -- Insert statements for procedure here
--EXEC(N'select COUNT(Personal) as Procede, Personal from '+@nombreDV+' TDV inner join Global_ConfiguracionStatusLlamada GCSL on TDV.LlamadaStatusID=GCSL.LlamadaStatusID AND TDV.LlamadaSubestatusID=GCSL.LlamadaSubestatusID AND TDV.LlamadaTipificacionID=GCSL.LlamadaTipificacionID and TDV.CampanaID=GCSL.CampanaID WHERE Procede=1 AND GCSL.CampanaID='+@campana+' and TDV.Fecha_Alta  BETWEEN '''+@f1+''' AND '''+@f2+''' group by Personal');
EXEC(N'select COUNT(TDV.Personal) as Contador, TDV.Personal as Empleado, AFTP.Nombre+' +'''  '''+ '+AFTP.ApellidoPaterno+' +'''  '''+ '+AFTP.ApellidoMaterno NombreCompleto from [10.128.108.50].[AFT].dbo.Personal AFTP inner join '+@nombreDV+' TDV on AFTP.Personal COLLATE DATABASE_DEFAULT =TDV.Personal COLLATE DATABASE_DEFAULT inner join Global_ConfiguracionStatusLlamada GCSL on TDV.LlamadaStatusID=GCSL.LlamadaStatusID AND TDV.LlamadaSubestatusID=GCSL.LlamadaSubestatusID AND TDV.LlamadaTipificacionID=GCSL.LlamadaTipificacionID and TDV.CampanaID=GCSL.CampanaID WHERE Procede=1 AND GCSL.CampanaID='+@campana+' and TDV.Fecha_Alta  BETWEEN '''+@FE1+''' AND '''+@FE2+''' group by TDV.Personal, AFTP.Nombre, AFTP.ApellidoPaterno, AFTP.ApellidoMaterno');


END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_select_TransaccionID]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_select_TransaccionID]
	-- Add the parameters for the stored procedure here
	@TransaccionID as int,
	@nombreDC as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC(N'SELECT * from '+@nombreDC+' where TransaccionID='+@TransaccionID);
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_TotalLlamadasPorAgente]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_TotalLlamadasPorAgente]
	-- Add the parameters for the stored procedure here
	@f1 as varchar(50),
    @f2 as  varchar(50),
	@nombreDC as varchar(50),
	@nombreDV as varchar(50)
AS
BEGIN
DECLARE @FE1 AS VARCHAR(15);
DECLARE @FE2 AS VARCHAR(15);
	SET NOCOUNT ON;
	SET @FE1=(convert(date, @f1, 103));
    SET @FE2=(convert(date, @f2, 103));
    -- Insert statements for procedure here
	--EXEC(N'select COUNT(Personal) as contador, Personal from '+@nombreDV+' TDV inner join '+@nombreDC+' TDC on TDV.TransaccionID=TDC.TransaccionID WHERE TDV.Fecha_Alta  BETWEEN '''+@f1+''' AND '''+@f2+'''  group by Personal');
	EXEC(N'select COUNT(TDV.Personal) as contador, TDV.Personal as empleado, AFTP.Nombre+' +'''  '''+ '+AFTP.ApellidoPaterno+' +'''  '''+ '+AFTP.ApellidoMaterno NombreCompleto from [10.128.108.50].[AFT].dbo.Personal AFTP inner join '+@nombreDV+' TDV on AFTP.Personal COLLATE DATABASE_DEFAULT =TDV.Personal COLLATE DATABASE_DEFAULT inner join '+@nombreDC+' TDC on TDV.TransaccionID=TDC.TransaccionID WHERE TDV.Fecha_Alta  BETWEEN '''+@FE1+''' AND '''+@FE2+'''  group by TDV.Personal, AFTP.Nombre, AFTP.ApellidoPaterno, AFTP.ApellidoMaterno');

END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTransaccion_VentasAgentesBajas]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTransaccion_VentasAgentesBajas]
	-- Add the parameters for the stored procedure here
	
	@nombreDV as varchar(50),
	@f1 as varchar(50),
    @f2 as  varchar(50)
AS
BEGIN
	
	DECLARE @FE1 AS VARCHAR(15);
    DECLARE @FE2 AS VARCHAR(15);
	SET NOCOUNT ON;
	SET @FE1=(convert(date, @f1, 103));
    SET @FE2=(convert(date, @f2, 103));
    -- Insert statements for procedure here
	EXEC(N'	SELECT TDV.Personal, CM.Nombre AS MODULO, C_S.Nombre AS ESTATUS , C_SUB.Nombre AS NIVEL2, CT.Nombre AS NIVEL3, CS4.Nombre AS NIVEL4, TDV.TransaccionID
	 FROM [10.128.108.50].[AFT].dbo.Personal AFTP INNER JOIN '+@nombreDV+'
	TDV ON AFTP.Personal COLLATE DATABASE_DEFAULT=TDV.Personal COLLATE DATABASE_DEFAULT
	INNER JOIN Catalogo_Modulo CM on CM.ModuloID=TDV.ModuloID
	INNER JOIN Catalogo_Status C_S on TDV.StatusID=C_S.StatusID 
	INNER JOIN Catalogo_Subestatus C_SUB ON TDV.SubestatusID=C_SUB.SubestatusID
	INNER JOIN Catalogo_Tipificacion CT ON TDV.TipificacionID=CT.TipificacionID
	INNER JOIN Catalogo_StatusNivel4 CS4 ON TDV.Status4ID=CS4.Statusnivel4ID
	WHERE AFTP.Estatus='+'''BAJA'''+' AND TDV.Fecha_Alta BETWEEN '''+@FE1+''' AND  '''+@FE2+'''')
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalTrnsaccion_ValidarCatalogo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>Verifica si el campo es un catalogo o no
-- =============================================
CREATE PROCEDURE [dbo].[GlobalTrnsaccion_ValidarCatalogo]
	-- Add the parameters for the stored procedure here
	@campana as smallint,
	 @NombreCampo as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CamD.FamiliaCatalogoIdInicio from Global_CampanaDato CamD inner join Global_CatalogoDatos CatD on CamD.DatoID= CatD.DatoID where CatD.Nombre=@NombreCampo and CampanaID=@campana
END






GO
/****** Object:  StoredProcedure [dbo].[GlobalVerificaPosicionBloque_select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalVerificaPosicionBloque_select]
@campaniaid SMALLINT,
@bloqueid tinyint,
@moduloid SMALLINT,
@orden tinyint
as
declare @conteo tinyint;
begin
set @conteo = (select COUNT(*) from Global_BloqueDatosCampana 
where CampanaID = @campaniaid and ModuloID = @moduloid and Orden = @orden and Estatus = 1);
	if(@conteo = 0 and @orden > 0)
	begin
		update Global_BloqueDatosCampana set Orden = @orden where CampanaID = @campaniaid and ModuloID = @moduloid and BloqueDatosID = @bloqueid;
	end	
	select @conteo as Conteo;
end






GO
/****** Object:  StoredProcedure [dbo].[GolbalCampana_select_CatalogoModulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GolbalCampana_select_CatalogoModulo]
	-- Add the parameters for the stored procedure here
	@campanaID AS smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Catalogo_Modulo.ModuloID, Catalogo_Modulo.Nombre from Catalogo_Modulo inner join Global_ModuloSiguiente on Catalogo_Modulo.ModuloID=Global_ModuloSiguiente.ModuloID where Global_ModuloSiguiente.CampanaID=@campanaID group by Catalogo_Modulo.ModuloID, Catalogo_Modulo.Nombre 
	--select Catalogo_Modulo.ModuloID, Catalogo_Modulo.Nombre, COUNT(Catalogo_Modulo.ModuloID) from Catalogo_Modulo inner join Global_ModuloSiguiente on Catalogo_Modulo.ModuloID=Global_ModuloSiguiente.ModuloID where StatusID !=1 and SubestatusID!=1 and TipificacionID!=1 and  CampanaID=1 group by Catalogo_Modulo.ModuloID, Catalogo_Modulo.Nombre 

END







GO
/****** Object:  StoredProcedure [dbo].[grabarMenu]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[grabarMenu]
@menuId varchar(5),
@descripcion varchar(150),
@accion varchar(150),
@controlador varchar(150),
@idmenupadre varchar(5),
@menutipoId varchar(5),
@estado varchar(5)
AS
BEGIN
DECLARE @id int
IF @id is null
begin
	set @id=1;
end
begin
	set @id = @id +1;
end
SELECT @id=MAX(menuId) FROM menuAllsoft

IF @menuId = '0'
	BEGIN
		INSERT INTO menuAllsoft
		(
			menuId,
			descripcion,
			accion,
			controlador,
			idmenupadre,
			menutipoId,
			estado
		)
		VALUES
		(
			@id,
			@descripcion,
			@accion,
			@controlador,
			@idmenupadre,
			@menutipoId,
			@estado
		)
	END
ELSE
	BEGIN
		UPDATE menuAllsoft SET 
		descripcion = @descripcion, 
		accion = @accion,
		controlador = @controlador,
		idmenupadre = @idmenupadre,
		menutipoId = @menutipoId,
		estado = @estado
		WHERE menuId = @menuId
	END
END





GO
/****** Object:  StoredProcedure [dbo].[Inserta_Numeros_insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inserta_Numeros_insert]
	-- Add the parameters for the stored procedure here
	@CampanaID  as int,@companiaID as int,@proyectoID as int,@proceso as int,@modulo as int,@personal as varchar(8), @nombreColumnaDato varchar (max),@dato as varchar (10)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	declare @tablaDatoContacto varchar (max)
	DECLARE @tablaDatosCliente varchar(max)
	declare @tablaDatosVenta varchar (max)
	declare @tablaHDatosVenta varchar (max)
	declare @tablaHDatosCliente varchar (max)
	DECLARE @consulta varchar (max)
	DECLARE @msg AS VARCHAR(200);
	select @tablaDatoContacto=NomTablaDato, @tablaDatosVenta=NomTablaTransaccionDV, @tablaDatosCliente=NomTablaTransaccionDC,@tablaHDatosCliente=NomTablaTransaccionHDC,@tablaHDatosVenta=NomTablaTransaccionHDV from Global_TablasCampana where CampanaID=@CampanaID
	
	
	DECLARE @campos as table (pregunta varchar (max))
	DECLARE @columnas nvarchar (max)
	SET @columnas=''

	INSERT INTO @campos (pregunta)
	SELECT d.Nombre as [Nombre_Tipo_Control_Catalogo] FROM [dbo].[Global_CampanaDato] as c INNER JOIN Global_CatalogoDatos as d  on d.DatoID=c.DatoID  WHERE CampanaID=@CampanaID AND [Cargar_Desde_Excel]=1 and TipoSeleccion='Ninguno'
	SELECT @columnas = (@columnas + COALESCE('['+CAST(pregunta AS VARCHAR(MAX))+ '],','')) FROM @campos

	SET @columnas = left(@columnas,LEN(@columnas)-1)

	set @consulta=('
		BEGIN TRAN Transaccion

		BEGIN TRY

	DECLARE @idB AS INT
	SET @idB=(SELECT ISNULL(MAX(DatoID),0) FROM '+@tablaDatoContacto+')+1;
	INSERT INTO '+ @tablaDatoContacto+ ' (DatoID,CompaniaID,ProyectoID,CampanaID,DBHistorialID,Ciclo,Profeco,Agendado,Referido,Duplicado,StatusDato,TransaccionID,AsignadoA,Fecha_Tomado,ConfiguracionID,TELEFONO)
	VALUES (@idB,'+convert (varchar,@companiaID)+','+ convert ( varchar,@proyectoID)+','+convert ( varchar,@CampanaID)+', 0,null,0,0,0,0,0,NULL,null,GETDATE(),null,'''+@dato+''')
	select @idB as DatoID

	declare @id AS INT;SET @id=(SELECT ISNULL(MAX(TransaccionID),0) FROM '+@tablaDatosVenta+')+1; INSERT INTO ' +@tablaDatosVenta+' (TransaccionID,CompaniaID,ProyectoID,CampanaID,ProcesoID,ModuloID,StatusID,SubestatusID,TipificacionID,Status4ID,ReglaStatusModulo,LlamadaStatusID,LlamadaSubestatusID,LlamadaTipificacionID,LlamadaStatus4ID,ReglaStatusLlamada,DatoID,Personal,BloqueID)
	VALUES(@id,'+convert (varchar,@companiaID)+','+ convert ( varchar,@proyectoID)+','+convert ( varchar,@CampanaID)+','+convert (varchar,@proceso)+','+convert (varchar,@modulo)+',1,1,1,1,0,1,1,1,1,1,@idB,'''+@personal+''',1);
	UPDATE '+@tablaDatoContacto+' SET TransaccionID = @id where '+@nombreColumnaDato+'='''+@dato+''' and Duplicado=0 and Agendado=0 and TransaccionID is null; 
	select @id as TransaccionID

	DECLARE @idT AS INT;SET @idT=(SELECT ISNULL(MAX(TransaccionDatosID),0) FROM '+@tablaDatosCliente+')+1;
	INSERT INTO '+@tablaDatosCliente+'(TransaccionDatosID,TransaccionID,'+@columnas+')  
	select @idT,@id,'+@columnas+' from '+@tablaDatoContacto+' inner join '+@tablaDatosVenta+' on '+@tablaDatosVenta+'.TransaccionID=@id WHERE '+@tablaDatoContacto+'.TransaccionID=@id and '+@tablaDatosVenta+'.ReglaStatusModulo=0 and '+@tablaDatosVenta+'.ReglaStatusLlamada=1 and '+@tablaDatoContacto+'.TransaccionID=@id and '+@tablaDatoContacto+'.'+@nombreColumnaDato+'='''+@dato+'''

	
	DECLARE @idH AS INT;SET @idH=(SELECT ISNULL(MAX(TransaccionHDVID),0) FROM '+@tablaHDatosVenta+')+1;
	INSERT INTO '+@tablaHDatosVenta+' (TransaccionHDVID,TransaccionID,CompaniaID,ProyectoID,CampanaID,ProcesoID,ModuloID,StatusID,SubestatusID,TipificacionID,Status4ID,ReglaStatusModulo,LlamadaStatusID,LlamadaSubestatusID,LlamadaTipificacionID,LlamadaStatus4ID, ReglaStatusLlamada ,DatoID,Personal,BloqueID) 
	VALUES(@idH, @idT,'+convert(varchar,@companiaID)+','+convert (varchar,@proyectoID)+','+convert(varchar,@CampanaID)+','+convert(varchar,@proceso)+','+convert (varchar,@modulo)+',1,1,1,1,1,1,1,1,1,1,@idB,'''+@personal+''',1); 

	DECLARE @IDTRANDCID AS INT; SET NOCOUNT ON;  
	SET @IDTRANDCID=(SELECT ISNULL(MAX(TransaccionHDVID),0) FROM '+@tablaHDatosCliente+')+ 1; 
	INSERT INTO '+@tablaHDatosCliente+' (HistorialDCID,TransaccionHDVID,'+@columnas+')
	select @IDTRANDCID, @idH,'+@columnas+' from '+@tablaDatoContacto+' inner join '+@tablaDatosVenta+' on '+@tablaDatosVenta+'.TransaccionID=@id WHERE '+@tablaDatoContacto+'.TransaccionID=@id and '+@tablaDatosVenta+'.ReglaStatusModulo=0 and '+@tablaDatosVenta+'.ReglaStatusLlamada=1 and '+@tablaDatoContacto+'.TransaccionID=@id and '+@tablaDatoContacto+'.'+@nombreColumnaDato+'='''+@dato+'''
	
	DECLARE @msg AS VARCHAR(200);
	SET @msg = ''Datos Insertados.''
			--SELECT @msg AS Mensaje
		
		COMMIT TRAN Transaccion

	    END TRY
	    BEGIN CATCH
			ROLLBACK TRAN Transaccion
			SET @msg = ''Error SQL : '' + ERROR_MESSAGE() + '' en la línea '' + CONVERT(NVARCHAR(255), ERROR_LINE() ) 
			
			--SELECT @msg AS Mensaje
			
	    END CATCH
	--SELECT @id AS ''ID'',@idT AS ''ID TDC'', @idH as ''idHdv'', @IDTRANDCID  as ''1235''')
	
	exec (@consulta)

	
END

GO
/****** Object:  StoredProcedure [dbo].[Insertar_Agendado]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <7 de Septiembre de 2015>
-- Description:	<Inserta un agendado para una determinada campaña>
-- =============================================
CREATE PROCEDURE [dbo].[Insertar_Agendado]
	  @TransaccionID  as int=0,
        @CompaniaID as int,
		@ProyectoID as int,
        @CampanaID  as int,
		@ModuloID as int,
		@Personal as varchar(10),
		@PrincipalReferido as varchar(max),
		@DatoID as int=0,
		@EstatusAgendado as bit,
		@EstatusReferido as bit,
        @Fecha as dateTime,
        @Nombre as varchar(50)='',
        @ApellidoP as varchar(50)='',
        @ApellidoM as varchar(50)='',   
		@PrincipalQueRefiere as varchar(max)='',    
        @Descripcion as VARCHAR(MAX)='' ,
		@DescripcionAgendado as VARCHAR(MAX)='' 

AS
BEGIN

    declare @msg AS VARCHAR(100), @locate as varchar(50)	
	SET NOCOUNT ON;
	declare @consulta nvarchar(max);
	declare @consulta1 varchar(max);
	declare @nomtabla varchar(200);	
	declare @nomtablahis varchar(200);
	--declare @agendadoID as varchar(max);
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID=@campanaID)
	--set @nomtablahis = (select NomTablaHistorialAgendado from Global_TablasCampana where CampanaID=9)
	--select(@nomtabla)
	SET LANGUAGE spanish;
	SET @consulta = N'Insert into ' + @nomtabla + '(Agendado,TransaccionID,CompaniaID, ProyectoID, CampanaID, ModuloID, DatoID,Personal,EstatusAgendado,EstatusAR,Nombre, 
	 ApellidoPaterno,ApellidoMaterno, NumeroReferencia, NumeroReferido, Descripcion, DescripcionAgendado, Fecha_Agendado) 
	 values ((SELECT ISNULL(MAX(Agendado),0) FROM '+@nomtabla+')+1,' + CONVERT(varchar,@transaccionID) + ',' + CONVERT(varchar,@companiaID) + ',' + 
	 CONVERT(varchar(10),@proyectoID) + ',' +CONVERT(varchar,@campanaID) + ',' + convert(varchar,@ModuloID)+ ',' + convert(varchar,@datoID) + ','''+ convert(varchar,@Personal) + ''',' +  
	 convert(varchar(MAX),@EstatusAgendado)+ ',' + convert(varchar,@EstatusReferido) + ',''' + @nombre + ''',''' + @apellidoP + ''',''' + @apellidoM + ''',''' +
	  @PrincipalQueRefiere + ''',''' + @PrincipalReferido + ''',''' + @descripcion + ''',''' + @DescripcionAgendado + ''','''+convert(varchar,  @Fecha, 126 )+ ''')'
	
	Exec (@consulta)
	
END



GO
/****** Object:  StoredProcedure [dbo].[Insertar_Respaldo_Transaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <10-Agosto-2015>
-- Description:	<SP que inserta el respaldo de un transaccion en curso.>
-- =============================================
CREATE PROCEDURE [dbo].[Insertar_Respaldo_Transaccion]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int,@Personal as varchar(10),@ModuloID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	



	SET NOCOUNT ON;


	declare @RespaldoIDCreado  as int;
	Select   @RespaldoIDCreado = isnull(RespaldoID,0) from RespaldoAllsoft
	where Personal= @Personal and RespaldoAllsoft.CampanaID= @CampanaId and ModuloID= @ModuloID and Respaldo is null
	if  @RespaldoIDCreado>0
	begin
		select @RespaldoIDCreado as RespaldoID;
	end
	else
	 begin
		declare @RespaldoID int 
		set @RespaldoID = (select MAX(RespaldoAllsoft.RespaldoID) from RespaldoAllsoft)
		set @RespaldoID = isnull(@RespaldoID,0)+1
	
		-- Insert statements for procedure here
		insert into RespaldoAllsoft(RespaldoID,CampanaID,Personal,ModuloID) values(@RespaldoID,@CampanaID,@Personal,@ModuloID)
		select @RespaldoID as RespaldoID;
	 end
	
END






GO
/****** Object:  StoredProcedure [dbo].[Insertar_Transaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insertar_Transaccion]
	-- Add the parameters for the stored procedure here
	@CampanaID  as int,@companiaID as int,@proyectoID as int,@proceso as int,@modulo as int,@personal as varchar(8), @nombreColumnaDato varchar (max),@datoID as varchar (max),@dato as varchar (10)
as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRAN Transaccion

		BEGIN TRY
    -- Insert statements for procedure here
	declare @tablaDatoContacto varchar (max)
	DECLARE @tablaDatosCliente varchar(max)
	declare @tablaDatosVenta varchar (max)
	declare @tablaHDatosVenta varchar (max)
	declare @tablaHDatosCliente varchar (max)
	DECLARE @msg AS VARCHAR(200)

	select @tablaDatoContacto=NomTablaDato, @tablaDatosVenta=NomTablaTransaccionDV, @tablaDatosCliente=NomTablaTransaccionDC,@tablaHDatosCliente=NomTablaTransaccionHDC,@tablaHDatosVenta=NomTablaTransaccionHDV from Global_TablasCampana where CampanaID=@CampanaID
	
	DECLARE @consulta varchar (max)
	  DECLARE @campos as table (pregunta varchar (max))
	DECLARE @columnas nvarchar (max)
	SET @columnas=''

	INSERT INTO @campos (pregunta)
	SELECT d.Nombre as [Nombre_Tipo_Control_Catalogo] FROM [dbo].[Global_CampanaDato] as c INNER JOIN Global_CatalogoDatos as d  on d.DatoID=c.DatoID  WHERE CampanaID=@CampanaID AND [Cargar_Desde_Excel]=1 and TipoSeleccion='Ninguno'
	SELECT @columnas = (@columnas + COALESCE('['+CAST(pregunta AS VARCHAR(MAX))+ '],','')) FROM @campos

	SET @columnas = left(@columnas,LEN(@columnas)-1)

	set @consulta=('

	declare @id AS INT;SET @id=(SELECT ISNULL(MAX(TransaccionID),0) FROM '+@tablaDatosVenta+')+1; INSERT INTO ' +@tablaDatosVenta+' (TransaccionID,CompaniaID,ProyectoID,CampanaID,ProcesoID,ModuloID,StatusID,SubestatusID,TipificacionID,Status4ID,ReglaStatusModulo,LlamadaStatusID,LlamadaSubestatusID,LlamadaTipificacionID,LlamadaStatus4ID,ReglaStatusLlamada,DatoID,Personal,BloqueID)
	VALUES(@id,'+convert (varchar,@companiaID)+','+ convert ( varchar,@proyectoID)+','+convert ( varchar,@CampanaID)+','+convert (varchar,@proceso)+','+convert (varchar,@modulo)+',1,1,1,1,0,1,1,1,1,1,'+@datoID+','''+@personal+''',1);
	UPDATE '+@tablaDatoContacto+' SET TransaccionID = @id where '+@nombreColumnaDato+'='''+@dato+''' and Duplicado=0 and Agendado=0 and TransaccionID is null; 
	select @id as TransaccionID

	DECLARE @idT AS INT;SET @idT=(SELECT ISNULL(MAX(TransaccionDatosID),0) FROM '+@tablaDatosCliente+')+1;
	INSERT INTO '+@tablaDatosCliente+'(TransaccionDatosID,TransaccionID,'+@columnas+')  
	select TOP 1 @idT,@id,'+@columnas+' from '+@tablaDatoContacto+' inner join '+@tablaDatosVenta+' on '+@tablaDatosVenta+'.TransaccionID=@id WHERE '+@tablaDatoContacto+'.TransaccionID=@id and '+@tablaDatosVenta+'.ReglaStatusModulo=0
	
	DECLARE @idH AS INT;SET @idH=(SELECT ISNULL(MAX(TransaccionHDVID),0) FROM '+@tablaHDatosVenta+')+1;
	INSERT INTO '+@tablaHDatosVenta+' (TransaccionHDVID,TransaccionID,CompaniaID,ProyectoID,CampanaID,ProcesoID,ModuloID,StatusID,SubestatusID,TipificacionID,Status4ID,ReglaStatusModulo,LlamadaStatusID,LlamadaSubestatusID,LlamadaTipificacionID,LlamadaStatus4ID, ReglaStatusLlamada ,DatoID,Personal,BloqueID) 
	VALUES(@idH, @idT,'+convert(varchar,@companiaID)+','+convert (varchar,@proyectoID)+','+convert(varchar,@CampanaID)+','+convert(varchar,@proceso)+','+convert (varchar,@modulo)+',1,1,1,1,1,1,1,1,1,1,'+@datoID+','''+@personal+''',1); 

	DECLARE @IDTRANDCID AS INT; SET NOCOUNT ON;  
	SET @IDTRANDCID=(SELECT ISNULL(MAX(TransaccionHDVID),0) FROM '+@tablaHDatosCliente+')+ 1; 
	INSERT INTO '+@tablaHDatosCliente+' (HistorialDCID,TransaccionHDVID ,'+@columnas+')
	select top 1 @IDTRANDCID, @idH,'+@columnas+' from '+@tablaDatoContacto+' inner join '+@tablaDatosVenta+' on '+@tablaDatosVenta+'.TransaccionID=@id WHERE '+@tablaDatoContacto+'.TransaccionID=@id and '+@tablaDatosVenta+'.ReglaStatusModulo=0
	
	
	--SELECT @id AS ''ID'',@idT AS ''ID TDC'', @idH as ''idHdv'', @IDTRANDCID  as ''1235''')

exec (@consulta)
	SET @msg = 'Transacción Insertada.'
			--SELECT @msg AS Mensaje
		
		COMMIT TRAN Transaccion

	    END TRY
	    BEGIN CATCH
			ROLLBACK TRAN Transaccion
			SET @msg = 'Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
			
			SELECT @msg AS Mensaje
			
	    END CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[Login_AFTApp]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Login_AFTApp]
	-- Add the parameters for the stored procedure here
	@Personal varchar(10)='', @Password varchar(50)='', @IP varchar(20)='',@LoginFrom int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Verificamos si el asesor existe dentro de la entidad de passwords

    -- Insert statements for procedure here
	declare @Permiso smallint = 0, @Motivo varchar(250)='', @Estado bit,@PC_IP_Name varchar(50), @Profile smallint=1,@AllSoft varchar(50)='http://10.128.110.24:8045?', @Dashboard varchar(50)='http://dashboard.com?',@UserName varchar(250)='',@id_campanaAFT int=0,@CampanaName varchar(250)=''
	--=====================================================================================
	-- Los perfiles correspondientes son: 1: Agente (Solo Allsoft), 2: Supervisor (Allsoft y Dashboard), 3: Cordinador o Superior (Dashboard)
	select @Profile = case when Puesto like 'AGENTE%' or Puesto like 'ANALISTA%' then 1 
	when Puesto like 'SUPERVISOR%' then 2 
	when Puesto like 'COORDINADOR%' then 3 END from [AFT].[dbo].Personal where Personal=@Personal
	select top 1 @Estado=Estado,@PC_IP_Name=IP from [AFT].[dbo].RegistroEstatus where Personal=@Personal and CAST(FechaRegistro as date)=CAST(GETDATE() as date) order by FechaRegistro desc
	select @Estado = case when @Estado is null then 0 else @Estado end,@PC_IP_Name = case when @PC_IP_Name is null then 'Not IP and PC Name' else 'IP:' + @PC_IP_Name end
	select @UserName=Personal +' '+ Nombre + ' ' + ApellidoPaterno from [AFT].[dbo].Personal where Personal=@Personal
	select @UserName = case when @UserName is null then 'NOT NAME' else @UserName end
	select top 1 @id_campanaAFT = B.id_campana, @CampanaName = C.Nombre from [AFT].[dbo].Relation_AFT_AllSoft A inner join [AFT].[dbo].usarioscampanas B on A.CampanaID_AFT=B.id_campana inner join [AFT].[dbo].Global_Campana C on C.CampanaID=A.CampanaID_AllSoft where B.Personal=@Personal and B.estatus=1
	--=====================================================================================
	--Identificar si el asesor existe en la base de datos
	if (select count(*) from [AFT].[dbo].Personal where Personal=@Personal) > 0
	begin
		-- Primero pregunto si la Password es igual a su número de empleado
		if (Select Password from [AFT].[dbo].PasswordManager where Personal=@Personal)=@Personal
		begin
			--indicamos que tiene que actualizar el password
			select @Permiso=2,@Motivo=@Personal+' Bienvenido a Grupo E-Contact, te sugerimos actualices tu contraseña para poder evitar un mal uso de tu sesión de AFT y sistemas internos.'
			select @Permiso Permiso,@Motivo Motivo
		end
		else
		begin
			-- Preguntamos si su password sigue vijente
			declare @Dias smallint=0,@Expired smallint=30
			select @Dias = DATEDIFF(DAY,LastUpdate,GETDATE()) from [AFT].[dbo].PasswordManager where Personal=@Personal
			if (@Expired-@Dias) > -1
			begin
				--Preguntamos si la passowrd es correcta
				if (select Password from [AFT].[dbo].PasswordManager where Personal=@Personal) = @Password
				begin 
					select @Permiso = 1
					--Verificamos que tenga acceso a AFT
					if (select count(*) from [AFT].[dbo].usarioscampanas where Personal=@Personal and estatus=1) > 0
					begin
						if @id_campanaAFT is null Or @id_campanaAFT = 0
						begin
							select @Permiso=0,@Motivo='No hay relación de áreas de trabajo entre AFT y Allsoft. Notifica esto a Equipo Desarrollo.'
							select @Permiso Permiso,@Motivo Motivo
						end
						else
						begin
							--Verificamos si el asesor no tienen otra sesión abierta en equipo diferente
							if @Estado = 1
							begin 
								select @Permiso=0,@Motivo='Ya tienes una sesión abierta en la siguiente ubicación ' + @PC_IP_Name
							end
							else
							begin
								select @Permiso=1,@Motivo='Acceso correcto!'			
							end				
							--Obtenemos la información para para la configuración del AllSoft				
							select @Permiso Permiso,@Motivo Motivo,@UserName Username,@id_campanaAFT id_campanaAFT,@CampanaName CampanaName,@Personal Usuario,@Password Contrasena,@Profile Perfil,@AllSoft Allsoft,@Dashboard Dashboard,@Estado Estado,@PC_IP_Name Equipo
							select B.id_campana, C.*,B.ModuloID Module from [AFT].[dbo].Relation_AFT_AllSoft A inner join [AFT].[dbo].usarioscampanas B on A.CampanaID_AFT=B.id_campana inner join [AFT].[dbo].Global_Campana C on C.CampanaID=A.CampanaID_AllSoft where B.Personal=@Personal
						end	
					end
					else
					begin
						select @Permiso=0, @Motivo='Sin acceso a campaña, solicita a supervisión tu acceso!'
						select @Permiso Permiso,@Motivo Motivo
					end
				end
				else
				begin
					select @Permiso = 0, @Motivo='Contraseña invalida, intentalo de nuevo por favor!'
					select @Permiso Permiso,@Motivo Motivo
				end
			end
			else
			begin
				-- Mostramos la opción de la contraseña ha expirado
				select @Permiso=3, @Motivo='Tu contraseña ha expirado, por favor actualiza tu contraseña en este momento'
				select @Permiso Permiso,@Motivo Motivo
			end			
		end		
	end
	else
	begin 
		select @Permiso=0, @Motivo='No existe personal '+ @Personal +' en base de datos!'
		select @Permiso Permiso,@Motivo Motivo
	end
END


GO
/****** Object:  StoredProcedure [dbo].[ModuloPrincipal_Campana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <11:40 22 de julio de 2015>
-- Description:	<Obtiene cual de todos los modulos son principales>
-- =============================================
CREATE PROCEDURE [dbo].[ModuloPrincipal_Campana]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @registros  int;
set @registros = (select count(*) from Global_ModuloSiguiente
where Global_ModuloSiguiente.CompaniaID= @CompaniaID and Global_ModuloSiguiente.ProyectoID= @ProyectoID and Global_ModuloSiguiente.CampanaID= @CampanaID and
 Global_ModuloSiguiente.ModuloID=@ModuloID and  Global_ModuloSiguiente.StatusID=1)
select @registros as Resultado;
END






GO
/****** Object:  StoredProcedure [dbo].[NivelCatalogo_update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NivelCatalogo_update] 
	-- Add the parameters for the stored procedure here
	@ID as smallint,
	@desc as text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update Nivel_Catalogos set descripcion=@desc,FechaMod=default where TipoCatalogoID=@ID
    -- Insert statements for procedure here
	
END







GO
/****** Object:  StoredProcedure [dbo].[Obtener_Agendado]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <7 de Septiembre de 2015>
-- Description:	<Obtiene un agendado para cualquier campaña>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Agendado]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int, @ModuloID as int, @Personal as varchar(10),@FechaBuscada as datetime)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	SET LANGUAGE spanish;

    -- Insert statements for procedure here
	declare @NombreTabla as varchar(max);
	declare @Consulta as varchar(max);
	select @NombreTabla=NomTablaAgendados from Global_TablasCampana
	where CampanaID = @CampanaID	
	set @Consulta= N'select top 1 * from ' + @NombreTabla+
	' where Personal='''+ @Personal +
	''' and ModuloID='+ CONVERT(varchar, @ModuloID)+ '  and Fecha_Agendado< ''' +convert(varchar, @FechaBuscada,121) +
	''' and  Mostrado = 0 and finalizado=0  order  by  Fecha_Agendado Asc' ;	
	exec( @Consulta);
END



GO
/****** Object:  StoredProcedure [dbo].[Obtener_Catalogo_Cac]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <10:16 24 de Agosto de 2015>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Catalogo_Cac]
as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Catalogo_SucursalCAC
END






GO
/****** Object:  StoredProcedure [dbo].[Obtener_Configuracion_Herramientas]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: < 25- AGosto- 2015>
-- Description:	< Obtiene una configuracion de las herramientas que se han creado en Allsoft>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Configuracion_Herramientas]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int, @ModuloID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1 isnull( BanderaAlmacen,0) as BanderaAlmacen,
isnull(BanderaBandejaValidador,0) as BanderaBandejaValidador,
isnull(BanderaTableroResultados,0) as BanderaTableroResultados,
isnull(BanderaAgendados,0) as BanderaAgendados ,
isnull(BanderaEstatusLLamada,0) as BanderaEstatusLLamada,
isnull(BanderaBandejaErrores,0) as BanderaBandejaErrores,
isnull(BanderaImpresion,0) as BanderaImpresion,
isnull(BanderaBandejaVentas,0) as BanderaBandejaVentas,
isnull(BanderaAlmacenOfertar,0) as BanderaAlmacenOfertar,
isnull(BanderaAlmacenLiberarOferta,0) as BanderaAlmacenLiberarOferta ,
 isnull(BanderaFolio,0) as BanderaFolio,
 isnull(BanderaControlMarcacion,0) as BanderaControlMarcacion,
 isnull(BanderaPredictivo,0) as BanderaPredictivo
from Global_ModuloSiguiente
where CampanaID=@CampanaID and ModuloID=@ModuloID
END






GO
/****** Object:  StoredProcedure [dbo].[Obtener_Estatus_Modulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Estatus_Modulo]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select distinct  Global_ModuloSiguiente.ModoluSiguienteID As ModuloSiguiente, Global_ModuloSiguiente.StatusID as EstatusID, Catalogo_Status.Nombre as Nombre  
from Global_ModuloSiguiente inner join Catalogo_Status on Global_ModuloSiguiente.StatusID= Catalogo_Status.StatusID
where Global_ModuloSiguiente.CompaniaID=@CompaniaID and Global_ModuloSiguiente.ProyectoID=@ProyectoID
and Global_ModuloSiguiente.CampanaID=@CampanaID and Global_ModuloSiguiente.ModuloID=@ModuloID
END






GO
/****** Object:  StoredProcedure [dbo].[Obtener_HoraServidor]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <06 de Septiembre "015>
-- Description:	<Obtiene la hora del servidor>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_HoraServidor]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select convert(varchar, GETDATE(),120) as HoraServidor
END




GO
/****** Object:  StoredProcedure [dbo].[Obtener_Listado_UltimosEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <4-Sep-2015>
-- Description:	<Obtiene el listado de los estatus de una transaccion>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Listado_UltimosEstatus] 
	-- Add the parameters for the stored procedure here
	(@CampanaID as int, @TransaccionID as int, @noRegistros as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   declare @nombreTablaHDV as Varchar(max);

    select @nombreTablaHDV= NomTablaTransaccionHDV   from Global_TablasCampana where campanaID=@CampanaID;
	declare @Consulta as varchar(max)	
	set @Consulta = 'select top '+ CONVERT(varchar,  @noRegistros) +'( select Nombre from Catalogo_Status where Catalogo_Status.StatusID= LlamadaStatusID) as LlamadaStatusID ,
	(select Nombre from Catalogo_Status where Catalogo_Status.StatusID= LlamadaSubEstatusID) as LlamadaSubEstatusID, 
	(select Nombre from Catalogo_Status where Catalogo_Status.StatusID= LlamadaTipificacionID) as LlamadaTipificacionID,
	(select Nombre from Catalogo_Status where Catalogo_Status.StatusID= LlamadaStatus4ID) as LlamadaStatus4ID '
	+ 'from ' +@nombreTablaHDV +' where TransaccionID=' + convert(varchar,@TransaccionID ) + 'order by TransaccionHDVID  desc';	

	exec(@Consulta);
	
END






GO
/****** Object:  StoredProcedure [dbo].[Obtener_Nombre_Campana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <11-Septiembre-2015>
-- Description:	<Obtiene el nombre de la campaña>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Nombre_Campana]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Nombre, Descripcion from Global_Campana  
	where Global_campana.CampanaID= @CampanaID
END



GO
/****** Object:  StoredProcedure [dbo].[Obtener_Nombre_Modulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <11:18 27 de Julio de 2015>
-- Description:	<Se obtiene el nombre de un modulo>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Nombre_Modulo]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int, @ModuloID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Catalogo_Modulo.Nombre, Catalogo_Modulo.Descripcion from Catalogo_Modulo
	where Catalogo_Modulo.ModuloID = @ModuloID

	SELECT Global_Campana.Nombre, Global_Campana.Descripcion from Global_Campana
	where Global_Campana.CampanaID =  @CampanaID
END






GO
/****** Object:  StoredProcedure [dbo].[Obtener_Registro_CatalogoCAC]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Registro_CatalogoCAC]
	@SucursalCacID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select Nombre,Estado,Ciudad,Colonia, Cp, Calle,NumExterior,NumInterior,EntreCalle,
YCalle,Lada,Telefono,Horario_Atencion,Tiempo_Traslado 
from Catalogo_SucursalCAC 
where SucursalCACID=@SucursalCACID and Estatus=1


END






GO
/****** Object:  StoredProcedure [dbo].[Obtener_ReglaEstatusLlamada]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_ReglaEstatusLlamada]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int, @LlamadaStatusID as int, 
	@LlamadaSubestatusID as int,@LlamadaTipificacionID as int, @LlamadaStatus4ID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select ReglaID, Agenda,Dias,FinalizaTransaccion,Descripcion from 
Global_ReglasStatus where ReglaID=(select ReglaID from 
Global_ConfiguracionStatusLlamada
where CampanaID=@CampanaID  and 
LlamadaStatusID=@LlamadaStatusID and LlamadaSubestatusID=@LlamadaSubestatusID and LlamadaTipificacionID=@LlamadaTipificacionID and LlamadaStatus4ID=@LlamadaStatus4ID)
END






GO
/****** Object:  StoredProcedure [dbo].[Obtener_Respaldo_Transaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos	>
-- Create date: <10-Agosto-2015>
-- Description:	<Obtengo si existe un respaldo  de un transaccion para un determinado personal 
--en un campaña especifica. Nota: Solo debe existir si exitio alguna contigencia.>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Respaldo_Transaccion]
	-- Add the parameters for the stored procedure here
	(@CampanaID	 as int, @Personal as varchar(10), @ModuloID as int)
As 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select RespaldoID,Respaldo from RespaldoAllsoft
	where Personal= @Personal and RespaldoAllsoft.CampanaID= @CampanaId and ModuloID= @ModuloID and Respaldo is not null
	END





GO
/****** Object:  StoredProcedure [dbo].[Obtener_Transaccion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <7 de Septiembre de 2015>
-- Description:	<Obtiene los datos de la transaccion de una campaña especifica>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Transaccion]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int, @TransaccionID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @nombreTablaDVT as varchar(max);
	declare @nombreTablaDCT as varchar(max);
	declare @Consulta as varchar(max);
	declare @Consulta1 as varchar(max);
	select @nombreTablaDVT=NomTablaTransaccionDV , @nombreTablaDCT=NomTablaTransaccionDC from Global_TablasCampana
	where CampanaID = @CampanaID	
	
	set @Consulta = 'select '+@nombreTablaDVT +'. * from '+ @nombreTablaDVT +' inner join ' + @nombreTablaDCT + ' on '+ @nombreTablaDCT+ '.TransaccionID = '+ @nombreTablaDVT+ 
	'.TransaccionID  where ' + @nombreTablaDVT+'.TransaccionID= '''+ CONVERT(varchar, @TransaccionID)+''' and  
	(select LiberaDatoPrincipal from Global_ReglasStatus where 
	Global_ReglasStatus.ReglaID= '+ @nombreTablaDVT+'.ReglaStatusLlamada ) = 0
	and  (select FinalizaTransaccion from Global_ReglasStatus where 
	Global_ReglasStatus.ReglaID= '+@nombreTablaDVT + '.ReglaStatusModulo ) = 0'; 	
	SELECT (@Consulta)
	exec( @Consulta);

	set @Consulta1 = 'select '+@nombreTablaDCT +'.* from '+ @nombreTablaDCT +' inner join ' + @nombreTablaDVT + ' on '+ @nombreTablaDVT+ '.TransaccionID = '+ @nombreTablaDCT+ 
	'.TransaccionID  where '+@nombreTablaDCT+'.TransaccionID= '''+ CONVERT(varchar, @TransaccionID)+''' and  
	(select LiberaDatoPrincipal from Global_ReglasStatus where 
	Global_ReglasStatus.ReglaID= '+ @nombreTablaDVT+'.ReglaStatusLlamada ) = 0
	and  (select FinalizaTransaccion from Global_ReglasStatus where 
	Global_ReglasStatus.ReglaID= '+@nombreTablaDVT + '.ReglaStatusModulo ) = 0'; 		
	exec( @Consulta1);
END



GO
/****** Object:  StoredProcedure [dbo].[Obtener_Transaccion_Datos_Cliente]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <3:50 17-Agosto-2015>
-- Description:	<Obtiene solo los datos de la tabla de TransaccionDatosVenta de una campaña especifica>
-- =============================================
CREATE PROCEDURE [dbo].[Obtener_Transaccion_Datos_Cliente]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int,   @ValorDatoPrincipal as Varchar(max))
AS
BEGIN
  declare @selectBuscarT  varchar(max);

declare @DatoPrincipalID int;
declare @NombreCampoPrincipal Varchar(max);

declare @nombreTablaDCT as Varchar(max);
declare @nombreTablaDVT as Varchar(max);

select @DatoPrincipalID = Global_CampanaDato.DatoID from Global_CampanaDato
where Global_CampanaDato.CampanaID=@CampanaID and 
Global_CampanaDato.Principal=1 

select @NombreCampoPrincipal = Global_CatalogoDatos.Nombre from Global_CatalogoDatos
where Global_CatalogoDatos.DatoID=@DatoPrincipalID

select @nombreTablaDCT= Global_TablasCampana.NomTablaTransaccionDC, @nombreTablaDVT = Global_TablasCampana.NomTablaTransaccionDV from  Global_TablasCampana
where Global_TablasCampana.CampanaID=@CampanaID
--Nota: Aun falta indicar si una transaccion esta en proceso y si esta en proceso de que no la puede tomar.
set @selectBuscarT = 'select '+@nombreTablaDCT +'.* from '+ @nombreTablaDCT +' inner join ' + @nombreTablaDVT + ' on '+ @nombreTablaDCT+ '.TransaccionID = '+ @nombreTablaDVT+ 
'.TransaccionID  where ' + @NombreCampoPrincipal +'= '''+ CONVERT(varchar, @ValorDatoPrincipal )+''' and  
 (select LiberaDatoPrincipal from Global_ReglasStatus where 
	Global_ReglasStatus.ReglaID= '+ @nombreTablaDVT+'.ReglaStatusLlamada ) = 0
	and  (select FinalizaTransaccion from Global_ReglasStatus where 
	Global_ReglasStatus.ReglaID= '+@nombreTablaDVT + '.ReglaStatusModulo) = 0' ;
exec(@selectBuscarT)


END





GO
/****** Object:  StoredProcedure [dbo].[Obtener_Transaccion_Datos_Venta]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	-- =============================================
	-- Author:		<Oswaldo Sanchez Melos>
	-- Create date: <3:50 17-Agosto-2015>
	-- Description:	<Obtiene solo los datos de la tabla de TransaccionDatosVenta de una campaña especifica>
	-- =============================================
	CREATE PROCEDURE [dbo].[Obtener_Transaccion_Datos_Venta]
		-- Add the parameters for the stored procedure here
		(@CampanaID as int, @ValorDatoPrincipal as Varchar(max))
	AS
	BEGIN
	  declare @selectBuscarT  varchar(max);

	declare @DatoPrincipalID int;
	declare @NombreCampoPrincipal Varchar(max);

	declare @nombreTablaDCT as Varchar(max);
	declare @nombreTablaDVT as Varchar(max);

	select @DatoPrincipalID = Global_CampanaDato.DatoID from Global_CampanaDato
	where Global_CampanaDato.CampanaID=@CampanaID and 
	Global_CampanaDato.Principal=1 

	select @NombreCampoPrincipal = Global_CatalogoDatos.Nombre from Global_CatalogoDatos
	where Global_CatalogoDatos.DatoID=@DatoPrincipalID

	select @nombreTablaDCT= Global_TablasCampana.NomTablaTransaccionDC, @nombreTablaDVT = Global_TablasCampana.NomTablaTransaccionDV from  Global_TablasCampana
	where Global_TablasCampana.CampanaID=@CampanaID
	--Nota: Aun falta indicar si una transaccion esta en proceso y si esta en proceso de que no la puede tomar.
	
	
	set @selectBuscarT = 'select '+@nombreTablaDVT +'.* from '+ @nombreTablaDVT +' inner join ' + @nombreTablaDCT + ' on '+ @nombreTablaDCT+ '.TransaccionID = '+ @nombreTablaDVT+ 
	'.TransaccionID  where ' + @NombreCampoPrincipal +'= '''+ CONVERT(varchar, @ValorDatoPrincipal )+''' and  
    (select LiberaDatoPrincipal from Global_ReglasStatus where 
	Global_ReglasStatus.ReglaID= '+ @nombreTablaDVT+'.ReglaStatusLlamada ) = 0
	and  (select FinalizaTransaccion from Global_ReglasStatus where 
	Global_ReglasStatus.ReglaID= '+@nombreTablaDVT + '.ReglaStatusModulo) = 0';
	exec(@selectBuscarT)



	END





GO
/****** Object:  StoredProcedure [dbo].[ObtenerConfiguracionBandeja]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerConfiguracionBandeja]
	-- Add the parameters for the stored procedure here
	(@CompaniaID as int, @ProyectoID as int, @CampanaID as int, @ModuloID as int )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  Global_CampanaDato.Etiqueta_Campo
from Global_CampanaDato left join Global_CatalogoDatos on Global_CatalogoDatos.DatoID= Global_CampanaDato.DatoID
 left join Global_Modulo_Datos on Global_CampanaDato.CampanaDatoID=Global_Modulo_Datos.CampanaDatoID
left join Global_SeccionesDatos on Global_SeccionesDatos.SeccionesDatosID = Global_Modulo_Datos.SeccionesDatosID
left join Global_BloqueDatos on Global_SeccionesDatos.BloqueDatosID= Global_BloqueDatos.BloqueDatosID
where Global_CampanaDato.CompaniaID= @CompaniaID  and  Global_CampanaDato.ProyectoID= @ProyectoID and  Global_CampanaDato.CampanaID= @CampanaID and Global_Modulo_Datos.ModuloID=@ModuloID  
END






GO
/****** Object:  StoredProcedure [dbo].[ObtenerNumeroBaseDatos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerNumeroBaseDatos]
	-- Add the parameters for the stored procedure here
	(@CampanaID as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @nombreTablaDatoContacto as Varchar(max);
select @nombreTablaDatoContacto= NomTablaDato from Global_TablasCampana where CampanaID=@CampanaID
declare @BuscarNumeroContacto as varchar(max);

set @BuscarNumeroContacto ='if exists( select top 1 DatoID from '+ @nombreTablaDatoContacto +'  where  (DATEDIFF(minute, dateadd(MINUTE, 60 ,  FechaTomado) , GETDATE()) > 0 or FechaTomado is null)  and( Ciclo< 4 or Ciclo is null))
begin
declare @NumeroID as output;
select top 1 @NumeroID=DatoID from ' + @nombreTablaDatoContacto +' where  (DATEDIFF(minute, dateadd(MINUTE, 60 ,  FechaTomado), GETDATE()) > 0 or FechaTomado is null)  and( Ciclo< 4 or Ciclo is null);
update '+@nombreTablaDatoContacto +'  set   FechaTomado= getdate() where datoid= @NumeroID
select @NumeroID as NumeroID
select top 1 * from '+@nombreTablaDatoContacto+' where  DatoID= @NumeroID
end
else
begin
print  ''No hay registros''
end'
exec (@BuscarNumeroContacto)

END






GO
/****** Object:  StoredProcedure [dbo].[ObtenerTransaccion_SELECT]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerTransaccion_SELECT]
	-- Add the parameters for the stored procedure here
	@numero AS VARCHAR(MAX) ='',
	@campana as varchar(max)=''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRAN Transaccion

		BEGIN TRY
	DECLARE @DATOCONTACTO AS VARCHAR(MAX)
	declare @nomdv as varchar (max)
	DECLARE @TRANS AS VARCHAR (MAX)
	DECLARE @ColumnaDato as varchar (max)
	DECLARE @msg AS VARCHAR(200);

	--select NomTablaTransaccionDV, NomTablaTransaccionDC, NomTablaDato from Global_TablasCampana
	set @DATOCONTACTO = (select NomTablaDato  from Global_TablasCampana where CampanaID=@campana);
	set @nomdv = (select NomTablaTransaccionDV from Global_TablasCampana where CampanaID=@campana)
	set @ColumnaDato=(SELECT d.Nombre as columnaDato FROM [dbo].[Global_CampanaDato] as c INNER JOIN Global_CatalogoDatos as d  on d.DatoID=c.DatoID where CampanaID=@campana and Principal=1)
    -- Insert statements for procedure here
    SET @TRANS = 'select '+@DATOCONTACTO+'.TransaccionID from '+@DATOCONTACTO +' inner join '+ @nomdv +' on '+@nomdv+'.TransaccionID = '+@DATOCONTACTO+'.TransaccionID where '+@DATOCONTACTO+'.'+@ColumnaDato+' = '''+@numero+''' and '+@nomdv+'.ReglaStatusModulo = 0'
    --select (@TRANS)
	--SE OBTIENE LA TRANSACCION QUE SE INSERTO EN LA BASE DE DATOS--
    
	exec (@TRANS)
  SET @msg = 'Transacción Identificada.'
			--SELECT @msg AS Mensaje
		
		COMMIT TRAN Transaccion

	    END TRY
	    BEGIN CATCH
			ROLLBACK TRAN Transaccion
			SET @msg = 'Error SQL : ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
			
			--SELECT @msg AS Mensaje
			
	    END CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[ReAgendar_DatoPrincipal]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Oswaldo Sanchez Melos>
-- Create date: <7 de Septiembre 2015>
-- Description:	<Reagenda un numero>
-- =============================================
CREATE PROCEDURE [dbo].[ReAgendar_DatoPrincipal] 
	-- Add the parameters for the stored procedure here
	(@CampanaID as int,@AgendadoID as int,@NuevaFecha as DateTime)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SET LANGUAGE spanish;
	Declare @NombreTabla as Varchar(max);
	select  @NombreTabla=NomTablaAgendados from Global_TablasCampana
	where CampanaID= @CampanaID
	declare @Consulta as varchar(max);
	set @Consulta= 'update '+ @NombreTabla +' 	set Fecha_Agendado= '''+ convert(varchar, @NuevaFecha,126)+ ''' where Agendado = '+convert(varchar, @AgendadoID)	
	exec(@Consulta)
END



GO
/****** Object:  StoredProcedure [dbo].[Referidos_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Referidos_Insert] 
	@idreferido as bigint,
	@Rtelefono as varchar(10),
	@Rnombre as varchar(30),
	@RapellidoP as varchar(30),
	@RapellidoM as varchar(30),
	@Rfecha as datetime,
	@Rdescripción as varchar(500),
	@RBorrado as bit

AS
BEGIN
set @RBorrado = 0;

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
    
		
		--set @locate='Error al Cancelar la venta'
    -- Insert statements for procedure here
	INSERT INTO dbo.Referidos(ReferidosID,Numero,Nombre,ApellidoP,ApellidoM,FechaAgendamiento,Descripccion,Borrado)
    VALUES (@idreferido,@Rtelefono,@Rnombre,@RapellidoP,@RapellidoM,@Rfecha,@Rdescripción,@RBorrado)
   
COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END







GO
/****** Object:  StoredProcedure [dbo].[Reglas_De_Guardado_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Reglas_De_Guardado_Select] 
	-- Add the parameters for the stored procedure here
	@llamadaStatusID as int,
	@llamadaSubestatusID as int,
	@llamadaTipificacionID as int,
	@llamadaSubestatus4id as int,
	@companiaID as int,
	@proyectoID as int,
	@campanaID as int
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
    
		
		--set @locate='Error al Cancelar la venta'
    -- Insert statements for procedure here
	

select ReglaID from Global_ConfiguracionStatusLlamada
where LlamadaStatusID = @llamadaStatusID and
      LlamadaSubestatusID = @llamadaSubestatusID and
	  LlamadaTipificacionID = @llamadaTipificacionID and
	  LlamadaStatus4ID = @llamadaSubestatus4id and
	  CompaniaID = @companiaID and
	  ProyectoID = @proyectoID and
	  CampanaID = @campanaID  


   
COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END








GO
/****** Object:  StoredProcedure [dbo].[ValidacionPruebaCampaña1_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ValidacionPruebaCampaña1_Insert]
	-- Add the parameters for the stored procedure here
	(@Nombre as varchar(max), @ApellidoPaterno as Varchar(max),
	@ApellidoMaterno as varchar(max), @Sexo as bit, @Nacimiento as Varchar(max))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	begin tran Validacion
	begin try
	declare @id as int;
	set @id = (select MAX(ValidacionPruebaCampaña1.IDValidacion) from ValidacionPruebaCampaña1)
	set @id=(@id+1)
		insert into ValidacionPruebaCampaña1(IDValidacion,Nombre,ApellidoPaterno,ApellidoMaterno,Sexo,Nacimiento,EstatusVisto,EstatusAtendido)values(@id ,@Nombre, @ApellidoPaterno,@ApellidoMaterno,
		@Sexo,@Nacimiento,0,0)
		commit tran Validacion
	end try
	begin catch
	 rollback tran Validacion
	end catch
END







GO
/****** Object:  StoredProcedure [dbo].[ValidarExistenciaCAC]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidarExistenciaCAC]

	@nom as varchar(40),
	@Estadoid AS varchar(40),
	@CiudadID as varchar(40),
	@coloniaID as varchar(40),
	@cp as varchar(5),
	@calle as varchar(40),
	@numE as  varchar(10),
	@numI as  varchar(10),
	@Ecalle as varchar(40),
	@Ycalle as varchar(40),
	@lada as varchar(5),
	@tel as varchar(10),
	@horario as varchar(20),
	@tiempoT as varchar(20)	

AS
BEGIN
SET NOCOUNT ON;

select COUNT(*) as numero from Catalogo_SucursalCAC where Estado like '%'+@Estadoid+'%' and Nombre like '%'+@nom+'%' and Ciudad like '%'+@CiudadID+'%' and Colonia like '%'+@coloniaID+'%' and CP like '%'+@cp+'%' and Calle like '%'+@calle+'%' and NumExterior=@numE and NumInterior=@numI and EntreCalle like '%'+@Ecalle+'%' and YCalle like '%'+@Ycalle+'%' and Lada=@lada and Telefono like '%'+@tel+'%' and Horario_Atencion like '%'+@horario+'%' and Tiempo_Traslado like '%'+@tiempoT+'%'
	END
	






GO
/****** Object:  StoredProcedure [dbo].[ValidarExistenciaCalendario]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidarExistenciaCalendario]
@proveedor as int,
@dVenta as tinyint,
@dPorta as tinyint,
@dEntregaMensajeria as tinyint,
@dEntregaCliente as tinyint,
@corte as tinyint		

AS
BEGIN
SET NOCOUNT ON;
select COUNT(*) as numero from Catalogo_CalendarioMensajeria where ProvedorMensajeriaID=@proveedor and DiaVenta=@dVenta and DiaPortabilidad=@dPorta and DiaEntregaMensajeria=@dEntregaMensajeria and DiaEntregaCliente=@dEntregaCliente and Corte=@corte
	END






GO
/****** Object:  StoredProcedure [dbo].[ValidarExistenciaCobertura]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ValidarExistenciaCobertura]

@Proveedor AS INT,
@Estadoid AS INT,
@cp as varchar(5),
@CiudadID as INT,
@coloniaID as INT	

AS
BEGIN
DECLARE @Ciudad varchar(40);
declare @colonia varchar(40);
SET NOCOUNT ON;
set @Ciudad=(select Nombre from CatalogoItem where CatalogoItemID=@CiudadID);
set @colonia=(select Nombre from CatalogoItem where CatalogoItemID=@coloniaID);
select COUNT(*) as numero from Catalogo_CoberturaMensajeria where ProvedorMensajeriaID=@proveedor and EstadoID=@Estadoid and CP like '%'+@cp+'%' and Ciudad_Municipio like '%'+@Ciudad+'%' and Colonia like '%'+@colonia+'%'
	END
	






GO
/****** Object:  StoredProcedure [dbo].[ValidarExistenciaFamiliaCatalogos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidarExistenciaFamiliaCatalogos]
@tipoCatalogoid as smallint,
	@origen as int,
	@nombre as varchar(50),
	@desc as varchar(300),
	@compania as smallint,
	@proyectoID as smallint

AS
BEGIN
SET NOCOUNT ON;
select COUNT(*) as numero from Familia_Catalogos where TipoCatalogoID=@tipoCatalogoid AND OrigenID=@origen and Nombre like '%'+@nombre+'%' and CompaniaID=@compania and ProyectoID=@proyectoID
END






GO
/****** Object:  StoredProcedure [dbo].[ValidarExistenciaItem]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidarExistenciaItem]
@CatalogoID AS INT, 
@origenItem as int,
@nombre as varchar(300),
@desc as varchar(250)

AS
BEGIN
SET NOCOUNT ON;
select COUNT(*) as numero from CatalogoItem where CatalogoID=@CatalogoID AND OrigenItem=@origenItem and Nombre like '%'+@nombre+'%'
END






GO
/****** Object:  StoredProcedure [dbo].[ValidarNivel]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidarNivel]
@nivel as smallint
AS
BEGIN
SELECT COUNT(*) as contador FROM Familia_Catalogos where TipoCatalogoID=@nivel
end









GO
/****** Object:  StoredProcedure [dbo].[ValidarRegistrosNivel]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ValidarRegistrosNivel]
@nombre as varchar(50),
@desc  as varchar(300)
AS
BEGIN
SELECT COUNT(*) as numero FROM Nivel_Catalogos where nombre like '%'+@nombre+'%' and descripcion like '%'+@desc+'%'
end









GO
/****** Object:  StoredProcedure [dbo].[Venta_Agendado_SRegla_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Venta_Agendado_SRegla_Insert]
		-- Add the parameters for the stored procedure here
	    @transaccionID  as varchar(10) ='',
        @companiaID as varchar(10) ='',
		@proyectoID as varchar(10) ='',
        @campanaID  as varchar(10)='',
		@datoID as varchar(10)='',
        @persanalID as varchar(10)='',
        @numreferencia as VARCHAR(10)='',
        @fechaagendada as varchar(10),
        @horaagendada as varchar(5)

AS
BEGIN
Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	SET NOCOUNT ON;
	declare @consulta nvarchar(max);
	declare @consulta1 varchar(max);
	declare @nomtabla varchar(200);
	declare @nomtablahis varchar(200);
	declare @reglafecha as varchar(20);
	declare	@estatusAR as varchar(5)=''
	

	set @estatusAR = '0'
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID=@campanaID)
	SET @consulta = N'DECLARE @ID AS varchar(max) SET @ID=(SELECT ISNULL(MAX(Agendado),0) FROM '+@nomtabla+')+1; Insert into ' + @nomtabla + '(Agendado,TransaccionID,CompaniaID, ProyectoID, CampanaID, DatoID,Personal,EstatusAR, NumeroReferencia,Fecha_Agendado, Hora_Agendados) values (@ID,' + CONVERT(varchar(10),@transaccionID) + ',' + CONVERT(varchar(10),@companiaID) + ',' + CONVERT(varchar(10),@proyectoID) + ',' + CONVERT(varchar(10),@campanaID) + ',' + convert(varchar(10),@datoID) + ','+ convert(varchar(10),@persanalID) + ',''' + convert(varchar(5),@estatusAR) + ''',''' + @numreferencia	 + ''',convert(datetime,'''+ @fechaagendada + ''',103)' + ',convert(time,'''+  @horaagendada +''',108))'
	--	select (@consulta)
	Exec (@consulta)
	COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	--select @msg

END






GO
/****** Object:  StoredProcedure [dbo].[Ventas_ActualizarDatoContacto_Update]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ventas_ActualizarDatoContacto_Update]
	-- Add the parameters for the stored procedure here
	@campana as smallint,
	@dato as varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @nomtabla as varchar(max)
	declare @consulta as varchar(max)
	select NomTablaDato from Global_TablasCampana
	set @nomtabla = (select NomTablaDato from Global_TablasCampana where CampanaID=@campana)
	set @consulta = ('update '+ @nomtabla +' set StatusDato = ''True'' where DatoID = '+@dato+'')
	--select(@consulta)
	exec(@consulta)
END



GO
/****** Object:  StoredProcedure [dbo].[Ventas_Agendados_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ventas_Agendados_Insert] 
	-- Add the parameters for the stored procedure here
	 @CompaniaID as int,
	 @ProyectoID as int,
	 @CampanaID as int,
	 @ModuloID as int,
	 @Personal as varchar(10),
	 @TransaccionID as int=0,
	 @PrincipalReferido as varchar(max),
	 @DatoID as int=0,
	 @EstatusAgendado as bit=0,
	 @EstatusReferido as bit=0,
	 @Fecha as DateTime,
	 @Hora as Time(7),
	 @Nombre as varchar(30)='',
	 @ApellidoP as varchar(30)='',
	 @ApellidoM as varchar(30)='',
	 @PrincipalQueRefiere as varchar(max)='',
	 @Descripcion as varchar(30)=''
	
AS
BEGIN

    declare @msg AS VARCHAR(100), @locate as varchar(50)
	SET NOCOUNT ON;
	declare @consulta nvarchar(max);
	declare @nombreTabla varchar(200);	
	declare @reglafecha as varchar(20);	
	set @reglafecha = CONVERT (varchar(10), getdate()+ @Fecha, 103);
	

	select @nombreTabla=NomTablaAgendados from Global_TablasCampana where CampanaID=@campanaID

	set @consulta = N'INSERT INTO '+ @nombreTabla + '(Agendado, CompaniaID,ProyectoID, CampanaID, ModuloID, Personal, TransaccionID,
    NumeroReferido, DatoID,EstatusAgendado,EstatusAR,Fecha_Agendado,Nombre,ApellidoPaterno,ApellidoMaterno,NumeroReferencia,Descripcion)
	   VALUES((select ISNULL(max(Agendado), 0) from ' + @nombreTabla+' ) + 1,'+convert(VARCHAR, @CompaniaID) +', '+convert(VARCHAR, @ProyectoID)+','+
	    convert(VARCHAR, @CampanaID)+','+convert(VARCHAR, @ModuloID) +','+
   ''''+ @Personal+''','+ convert(VARCHAR, @TransaccionID)+ ','''+ @PrincipalReferido +''','+ convert(VARCHAR, @DatoID )+','+ convert(VARCHAR, @EstatusAgendado )+','+
   convert(VARCHAR, @EstatusReferido)+ ','''+ convert(varchar, @Fecha,121)+''',' + ''''+ @Nombre+ ''','+ '''' + @ApellidoP + ''','+ ''''+
    @ApellidoP + ''','+''''+@PrincipalQueRefiere +''',' + ''''+ @Descripcion+''')';


 
 select @consulta
 exec(@consulta)
	
	select (@consulta)
	


END






GO
/****** Object:  StoredProcedure [dbo].[Ventas_AlertasAgendados_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ventas_AlertasAgendados_Select]
@campana as varchar(max)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	SET NOCOUNT ON;
	declare @nomtabla as varchar(100);
	declare @consulta as varchar(300);
	declare @minant time, @mindes time
    set @minant = DATEADD(MINUTE, -60, GETDATE()) 
    set @mindes = DATEADD(MINUTE, +60, GETDATE()) 

    -- Insert statements for procedure here
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID=@campana);
	set @consulta =('SELECT * from' + @nomtabla +'where Hora_Agendados BETWEEN ' + convert(varchar(10), @minant) + 'and'+  convert(varchar(10),@mindes) +'')
	--set @consulta = select * from +  @nomtabla + '
    --where TransaccionID IS NULL and CampanaID=1 and PersonalID=1'


	select (@consulta)
   	Exec (@consulta)
COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END





GO
/****** Object:  StoredProcedure [dbo].[Ventas_Busqueda_Agendados]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ventas_Busqueda_Agendados]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	SET NOCOUNT ON;
	declare @nomtabla as varchar(100);
	declare @consulta as varchar(200);

    -- Insert statements for procedure here
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID=5);
	set @consulta = 'select * from' +  @nomtabla + '
    where TransaccionID IS NULL and CampanaID=1 and PersonalID=1'
	select (@consulta)
   	Exec (@consulta)
COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END








GO
/****** Object:  StoredProcedure [dbo].[VENTAS_INSERTRANSACCIONDATOCONTACTO_UPDATE]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VENTAS_INSERTRANSACCIONDATOCONTACTO_UPDATE]
	-- Add the parameters for the stored procedure here
	@campana as smallint,
	@dato as varchar(max),
	@transaccion as varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @nomtabla as varchar(max)
	declare @consulta as varchar(max)
	select NomTablaDato from Global_TablasCampana
	set @nomtabla = (select NomTablaDato from Global_TablasCampana where CampanaID=@campana)
	set @consulta = ('update '+ @nomtabla +' set TransaccionID  = '+@transaccion+' where DatoID = '+@dato+'')
	--select(@consulta)
	exec(@consulta)
END



GO
/****** Object:  StoredProcedure [dbo].[Ventas_Reglas_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ventas_Reglas_Select]
	-- Add the parameters for the stored procedure here
	@reglaID as int
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
    
		 
		select Agenda,Dias, LiberaDatoPrincipal, FinalizaTransaccion from Global_ReglasStatus where ReglaID = @reglaID
		--set @locate='Error al Cancelar la venta'
    -- Insert statements for procedure here
COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END








GO
/****** Object:  StoredProcedure [dbo].[Ventas_Transaccion_Select]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ventas_Transaccion_Select]
	-- Add the parameters for the stored procedure here
	 @transaccion as varchar(10) = '',
	 @compania as varchar (10) = '',
	 @proyecto as varchar (10) ='',
     @campana as varchar (10)= '',
	 @personal as varchar(10) =''

AS
BEGIN
Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	SET NOCOUNT ON;
	declare @nomtablaTransaccionC as nvarchar (max)
	declare @nomtablaTransaccionV as nvarchar (max)
	declare @nomtablaAgendadosT as nvarchar (max)
	declare @nomtablaAgendadosH as nvarchar (max)

	declare @consulta as nvarchar(max)
	
	set @transaccion = 1;
	set @compania = 1;
	set @proyecto = 1;
    set @campana = 9;
	set @personal = 'E009925';
	--set @año = 2015

	--set @mes = 08
	--set @dia = 28
	
	SET @nomtablaTransaccionV = (select NomTablaTransaccionDV from Global_TablasCampana where CampanaID = @campana)
	set @nomtablaTransaccionC = (select NomTablaTransaccionDC from Global_TablasCampana where CampanaID= @campana)
	set @nomtablaAgendadosT   = (select NomTablaAgendados from Global_TablasCampana where CampanaID = @campana)
	set @nomtablaAgendadosH   = (select NomTablaHistorialAgendado from Global_TablasCampana where CampanaID = @campana)
	
    set @consulta = N'(select '+@nomtablaTransaccionV+'.*, '+@nomtablaTransaccionC+'.*  from '+@nomtablaAgendadosT+' inner join '+@nomtablaTransaccionC+' on '+@nomtablaAgendadosT+'.TransaccionID  = '+@nomtablaTransaccionC+'.TransaccionID inner join '+@nomtablaTransaccionV+' on '+@nomtablaAgendadosT+'.TransaccionID = '+@nomtablaTransaccionV+'.TransaccionID where '+@nomtablaAgendadosT+'.TransaccionID = '+ @transaccion +' and '+@nomtablaAgendadosT+'.CompaniaID = '+ @compania +' and '+@nomtablaAgendadosT+'.ProyectoID = '+ @proyecto +' and '+@nomtablaAgendadosT+'.CampanaID = '+ @campana +' and '+@nomtablaAgendadosT+'.Personal = '''+ @personal +''')'
	--select (@consulta)
	exec (@consulta)
	--SELECT  Agendado,TransaccionID,CompaniaID,ProyectoID,CampanaID,PersonalID,YEAR(Fecha_Agendado) as ANOS, MONTH(Fecha_Agendado) as MES , DAY(Fecha_Agendado) as DIA  from dbo.Agendados_Cliente_excelente where MONTH(Fecha_Agendado) = 7 and CampanaID = 1 and CompaniaID = 1 and PersonalID =1
	COMMIT TRAN Tadd
    SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	--select @msg

END







GO
/****** Object:  StoredProcedure [dbo].[Ventas_Transaccion_Select_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ventas_Transaccion_Select_Insert]
	-- Add the parameters for the stored procedure here
	@transaccion as smallint,
	@campana as smallint
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
    declare @nomtc as varchar(max);
	declare @nomtv as varchar (max);
	--declare @contv as nvarchar(max);
	--declare @contc as nvarchar(max);
	set @nomtv = (select NomTablaTransaccionDV from Global_TablasCampana where CampanaID= @campana)
	set @nomtc = (select NomTablaTransaccionDC from Global_TablasCampana where CampanaID= @campana)
	--select (@nomtv)
	--select (@nomtc)
	--exec(@nomtv)
	--exec(@nomtc)
	--set @locate='Error al Cancelar la venta'
    -- Insert statements for procedure here
	
	--set @contv = N'(select * from '+ @nomtv +' where TransaccionID = '+ @transaccion+')'
	--set @contc = N'(select * from '+ @nomtc +' where TransaccionID = '+ @transaccion+ ')'
	--select (@contv)
	--select (@contc)
	exec   (N'(select * from '+ @nomtv +' where TransaccionID = '+ @transaccion+')')
	exec   (N'(select * from '+ @nomtc +' where TransaccionID = '+ @transaccion+ ')')

COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	select @msg

END







GO
/****** Object:  StoredProcedure [dbo].[VENTAS_UPDATEAGENDADOS_FINALIZADO]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VENTAS_UPDATEAGENDADOS_FINALIZADO] 
	-- Add the parameters for the stored procedure here
	@campana as smallint,
	@dato as varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @nomtabla as varchar(max)
	declare @consulta as varchar(max)
	select NomTablaDato from Global_TablasCampana
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID=@campana)
	set @consulta = ('update '+ @nomtabla +' set Finalizado = ''True'' where DatoID = '+@dato+'')
	select(@consulta)
	exec(@consulta)
END



GO
/****** Object:  StoredProcedure [dbo].[VentasReferidos_Insert]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VentasReferidos_Insert]

        
        @transaccionID  as varchar(10) ='',
        @companiaID as varchar(10) ='',
		@proyectoID as varchar(10) ='',
        @campanaID  as varchar(10)='',
		@datoID as varchar(10)='',
        @persanalID as varchar(10)='',
        @nombre as varchar(50)='',
        @apellidoP as varchar(50)='',
        @apellidoM as varchar(50)='',
        @numreferencia as VARCHAR(10)='',
        @numreferido as VARCHAR(10)='',
        @descripcion as VARCHAR(MAX)='',
        @fechaagendada as varchar(10),
        @horaagendada as varchar(5),
		@estatusAR as varchar(5)='',
		@estatusaAgendado as varchar(MAX) ='',
		@descripcionagendado as varchar(MAX)=''
		
	

AS
BEGIN
Begin Try -- Sentencias de la transaccion  a cachar
	Begin Tran Tadd
    declare @msg AS VARCHAR(100), @locate as varchar(50)
	--set @transaccionID=1;
	--set @companiaID =1;
	--set @proyectoID=1;
	--set @campanaID =1;
	--set @datoID =1;
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	declare @consulta nvarchar(max);
	declare @consulta1 varchar(max);
	declare @nomtabla varchar(200);
	declare @nomtablahis varchar(200);
	--declare @agendadoID as varchar(max);
	set @nomtabla = (select NomTablaAgendados from Global_TablasCampana where CampanaID=@campanaID)
	--set @nomtablahis = (select NomTablaHistorialAgendado from Global_TablasCampana where CampanaID=9)
	--select(@nomtabla)
	set @estatusAR = 1
	SET @consulta = N'DECLARE @ID AS varchar(max) SET @ID=(SELECT ISNULL(MAX(Agendado),0) FROM '+@nomtabla+')+1; Insert into ' + @nomtabla + '(Agendado,TransaccionID,CompaniaID, ProyectoID, CampanaID, DatoID,Personal,EstatusAgendado,EstatusAR,Nombre, ApellidoPaterno,ApellidoMaterno, NumeroReferencia, NumeroReferido, Descripcion, DescripcionAgendado, Fecha_Agendado, Hora_Agendados) values (@ID,' + CONVERT(varchar(10),@transaccionID) + ',' + CONVERT(varchar(10),@companiaID) + ',' + CONVERT(varchar(10),@proyectoID) + ',' + CONVERT(varchar(10),@campanaID) + ',' + convert(varchar(10),@datoID) + ','+ convert(varchar(10),@persanalID) + ',''' +  convert(varchar(MAX),@estatusaAgendado) + ''',' + convert(varchar(5),@estatusAR) + ',''' + @nombre + ''',''' + @apellidoP + ''',''' + @apellidoM + ''',''' + @numreferencia + ''',''' + @numreferido + ''',''' + @descripcion + ''',''' + @descripcionagendado + ''',convert(datetime,'''+ @fechaagendada + ''',103)' + ',convert(time,'''+  @horaagendada +''',108))'
	select (@consulta)
	Exec (@consulta)
	--select (@consulta)
    --SET @consulta1 = 'declare @historialagendadoID AS VARCHAR(30); set  @historialagendadoID = (select ISNULL(MAX (HistorialAgendado),0) from '+  @nomtablahis + ') + 1; Insert into ' + @nomtablahis + '(HistorialAgendado,Agendado,TransaccionID,CompaniaID, ProyectoID, CampanaID, DatoID,PersonalID,EstatusAgendado,EstatusAR,Nombre, ApellidoPaterno,ApellidoMaterno, NumeroReferencia, NumeroReferido,Descripcion,DescripcionAgendado,Fecha_Agendado,Hora_Agendados) values(  @historialagendadoID ,' + CONVERT(varchar(10),@agendadoID) + ',' + CONVERT(varchar(10),@transaccionID) + ',' + CONVERT(varchar(10),@companiaID) + ',' + CONVERT(varchar(10),@proyectoID) + ',' +CONVERT(varchar(10),@campanaID) +',' + convert(varchar(10),@datoID) + ','+ convert (varchar(10),@persanalID) + ','+ convert (varchar(5),@estatusaAgendado) + ','+ convert (varchar(5),@estatusAR) + ',''' + @nombre + ''',''' + @apellidoP + ''','''+ @apellidoM + ''','''+ @numreferencia + ''',''' + @numreferido +''','''+ @descripcion +''','''+ @descripcionagendado + ''',''' + CONVERT(VARCHAR(30),@fechaagendada)+''',''' + CONVERT(VARCHAR(30),@horaagendada)+''')' 
	--Exec (@consulta1)
COMMIT TRAN Tadd
	 SET @msg = 'success' 
	End try

    Begin Catch
--SI OCURRE ALGUN ERROR DURANTE LA EJECUCION DE LAS INSTRUCCIONES SE DESHACE LA TRANSACCION
        Rollback TRAN Tadd
        SET @msg =ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- @locate + ', details: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

		

    End Catch

	--select @msg

END






GO
/****** Object:  Table [dbo].[Agendados_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agendados_YO_SOY_TELCEL](
	[Agendado] [bigint] NOT NULL,
	[TransaccionID] [bigint] NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[ModuloID] [smallint] NULL,
	[DatoID] [bigint] NOT NULL,
	[Personal] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[NumeroReferencia] [varchar](10) NULL,
	[NumeroReferido] [varchar](10) NULL,
	[EstatusAgendado] [smallint] NULL,
	[EstatusAR] [bit] NOT NULL,
	[Fecha_Agendado] [date] NOT NULL,
	[Hora_Agendados] [time](7) NOT NULL,
	[Descripcion] [text] NULL,
	[DescripcionAgendado] [text] NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Mostrado] [bit] NOT NULL,
	[Finalizado] [bit] NOT NULL,
 CONSTRAINT [PK__Agendado__B9D5FB0B3337C503] PRIMARY KEY CLUSTERED 
(
	[Agendado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Almacenes]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Almacenes](
	[AlmacenID] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](500) NULL,
	[Stock] [float] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Almacenes] PRIMARY KEY CLUSTERED 
(
	[AlmacenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Color]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Color](
	[ColorID] [int] NOT NULL,
	[MaterialID] [int] NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Color] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Gama_Producto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Gama_Producto](
	[GamaProductoID] [int] NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Gama_Producto] PRIMARY KEY CLUSTERED 
(
	[GamaProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Marca]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Marca](
	[MarcaID] [int] NOT NULL,
	[AlmacenID] [int] NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Marca] PRIMARY KEY CLUSTERED 
(
	[MarcaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Material]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Material](
	[MaterialID] [int] NOT NULL,
	[AlmacenID] [int] NULL,
	[MarcaID] [int] NULL,
	[ModeloID] [int] NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Material] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Modelo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Modelo](
	[ModeloID] [int] NOT NULL,
	[AlmacenID] [int] NULL,
	[MarcaID] [int] NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Modelo] PRIMARY KEY CLUSTERED 
(
	[ModeloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Precio_Producto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alm_Precio_Producto](
	[PrecioProductoID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[PrecioPublico] [decimal](8, 2) NULL,
	[PrecioProveedor] [decimal](8, 2) NULL,
	[PrecioMayoreo] [decimal](8, 2) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Precio_Producto] PRIMARY KEY CLUSTERED 
(
	[PrecioProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Alm_Producto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Producto](
	[ProductoID] [int] NOT NULL,
	[AlmacenID] [int] NULL,
	[MarcaID] [int] NULL,
	[ModeloID] [int] NULL,
	[MaterialID] [int] NULL,
	[ColorID] [int] NULL,
	[TipoProductoID] [int] NULL,
	[ProveedorID] [int] NULL,
	[GamaProductoID] [int] NULL,
	[Descripcion] [varchar](500) NULL,
	[Volumen] [float] NULL,
	[Peso] [float] NULL,
	[UnidadEntrada] [varchar](10) NULL,
	[UnidadSalida] [varchar](10) NULL,
	[FactorUnidad] [float] NULL,
	[StockMax] [float] NULL,
	[StockMin] [float] NULL,
	[StockReal] [float] NULL,
	[Descontinuidad] [bit] NULL,
	[OrdenComPendiente] [float] NULL,
	[UnidadesVendidas] [float] NULL,
	[VentasGlobal] [float] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Proveedor]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Proveedor](
	[ProveedorID] [int] NOT NULL,
	[Nombre] [varchar](250) NULL,
	[Descripcion] [varchar](500) NULL,
	[Direccion] [varchar](500) NULL,
	[TelOficina] [varchar](15) NULL,
	[TelCelular] [varchar](15) NULL,
	[RFC] [varchar](10) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Proveedor] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Subalmacen]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Subalmacen](
	[SubAlmacenID] [int] NOT NULL,
	[AlmacenID] [int] NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Tipo] [varchar](50) NULL,
	[StockMin] [float] NULL,
	[StockMax] [float] NULL,
	[StockReal] [float] NULL,
	[PorRecibir] [float] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Subalmacen] PRIMARY KEY CLUSTERED 
(
	[SubAlmacenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alm_Tipo_producto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alm_Tipo_producto](
	[TipoProductoID] [int] NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaUltModificacion] [datetime] NULL,
	[Estatus] [smallint] NULL,
 CONSTRAINT [PK_Alm_Tipo_producto] PRIMARY KEY CLUSTERED 
(
	[TipoProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_Articulos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_Articulos](
	[CatalogoArticuloID] [int] IDENTITY(1,1) NOT NULL,
	[Material] [varchar](50) NULL,
	[CatalogoTipoEquipoID] [varchar](50) NOT NULL,
	[CatalogoMarcaID] [varchar](50) NOT NULL,
	[CatalogoFamiliaID] [varchar](50) NULL,
	[CatalogoModeloID] [varchar](50) NOT NULL,
	[CatalogoEstatusID] [varchar](50) NOT NULL,
	[ArticuloPromocional] [varchar](300) NULL,
	[PlanFinanciamientoID] [varchar](50) NULL,
	[TipoAlmacen] [varchar](50) NULL,
	[SerieAlmacen] [varchar](100) NULL,
	[NombreCampana] [varchar](50) NULL,
 CONSTRAINT [PK_Almacen_Catalogo_Articulos] PRIMARY KEY CLUSTERED 
(
	[CatalogoArticuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_Devoluciones]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_Devoluciones](
	[CatalogoDevolucionID] [int] NOT NULL,
	[MotivoDevolucion] [varchar](250) NOT NULL,
	[CatalogoEstatusID] [int] NOT NULL,
 CONSTRAINT [PK_Almacen_Catalogo_Devoluciones] PRIMARY KEY CLUSTERED 
(
	[CatalogoDevolucionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_Estatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_Estatus](
	[CatalogoEstatusID] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstatus] [varchar](30) NOT NULL,
	[DescripcionEstatus] [varchar](100) NOT NULL,
	[DescripcionExtra] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Almacen_Catalogo_Estatus] PRIMARY KEY CLUSTERED 
(
	[CatalogoEstatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_Familia]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_Familia](
	[CatalogoFamiliaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreFamilia] [varchar](100) NOT NULL,
	[CatalogoEstatusID] [int] NOT NULL,
	[CatalogoProveedorID] [int] NOT NULL,
	[Prefijo] [nchar](10) NULL,
 CONSTRAINT [PK_Almacen_Catalogo_Familia] PRIMARY KEY CLUSTERED 
(
	[CatalogoFamiliaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_Marca]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_Marca](
	[CatalogoMarcaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreMarca] [varchar](100) NOT NULL,
	[CatalogoEstatusID] [int] NOT NULL,
	[CatalogoFamiliaID] [int] NOT NULL,
	[Prefijo] [nchar](10) NOT NULL,
	[TipoEquipoID] [int] NULL,
 CONSTRAINT [PK_Almacen_Catalogo_Marca] PRIMARY KEY CLUSTERED 
(
	[CatalogoMarcaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_Modelo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_Modelo](
	[CatalogoModeloID] [int] IDENTITY(1,1) NOT NULL,
	[NombreModelo] [varchar](100) NOT NULL,
	[CatalogoEstatusID] [int] NOT NULL,
	[CatalogoMarcaID] [varchar](100) NOT NULL,
	[CatalogoFamiliaID] [int] NOT NULL,
	[Prefijo] [nchar](10) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Capacidad] [varchar](30) NULL,
	[Color] [varchar](20) NULL,
 CONSTRAINT [PK_Almacen_Catalogo_Modelo] PRIMARY KEY CLUSTERED 
(
	[CatalogoModeloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_PromocionPortabilidad]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_PromocionPortabilidad](
	[PromocionPortacionID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[DetallePromocion] [varchar](200) NOT NULL,
	[Disponibles] [int] NOT NULL,
 CONSTRAINT [PK_Almacen_PromocionPortabilidad] PRIMARY KEY CLUSTERED 
(
	[PromocionPortacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_Proveedor]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_Proveedor](
	[CatalogoProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[NombreProveedor] [varchar](100) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[CatalogoEstatusID] [int] NULL,
 CONSTRAINT [PK_Almacen_Catalogo_Proveedores] PRIMARY KEY CLUSTERED 
(
	[CatalogoProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_SubEstatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_SubEstatus](
	[CatalogoSubEstatusID] [int] IDENTITY(1,1) NOT NULL,
	[NombreSubEstatus] [varchar](50) NOT NULL,
	[DescripcionSubEstatus] [varchar](100) NOT NULL,
	[DescripcionExtra] [varchar](100) NULL,
 CONSTRAINT [PK_Almacen_Catalogo_SubEstatus] PRIMARY KEY CLUSTERED 
(
	[CatalogoSubEstatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_TipoAlmacen]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_TipoAlmacen](
	[CatalogoTipoAlmacenID] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoAlmacen] [varchar](100) NOT NULL,
	[CatalogoEstatusID] [int] NOT NULL,
	[Ubicacion] [varchar](100) NOT NULL,
	[CodigoPostalID] [int] NULL,
 CONSTRAINT [PK_Almacen_Catalogo_TipoAlmacen] PRIMARY KEY CLUSTERED 
(
	[CatalogoTipoAlmacenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Catalogo_TipoEquipo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Catalogo_TipoEquipo](
	[CatalogoTipoEquipoID] [int] IDENTITY(1,1) NOT NULL,
	[TipoEquipo] [varchar](50) NOT NULL,
	[CatalogoEstatusID] [int] NOT NULL,
 CONSTRAINT [PK_Almacen_Catalogo_TipoEquipo] PRIMARY KEY CLUSTERED 
(
	[CatalogoTipoEquipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Codigos_Postales]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Codigos_Postales](
	[CodigoPostalID] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[Colonia] [varchar](50) NOT NULL,
	[Asentamiento] [varchar](50) NULL,
	[Zona] [varchar](50) NULL,
	[CP] [int] NOT NULL,
	[Ciudad] [varchar](250) NULL,
	[UsuarioAlta] [varchar](50) NULL,
 CONSTRAINT [PK_CodigoPostalID] PRIMARY KEY CLUSTERED 
(
	[CodigoPostalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Insercion_Historico]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Insercion_Historico](
	[InsercionHistoricoID] [int] IDENTITY(1,1) NOT NULL,
	[Origen] [varchar](150) NOT NULL,
	[RutaNombre] [varchar](50) NOT NULL,
	[NumeroEmpleado] [nchar](10) NOT NULL,
	[NumeroObjetos] [smallint] NOT NULL,
	[FechaInsercion] [datetime] NOT NULL,
 CONSTRAINT [PK_Almacen_Insercion] PRIMARY KEY CLUSTERED 
(
	[InsercionHistoricoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Inventario]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Inventario](
	[Homoclave] [varchar](50) NOT NULL,
	[Serie] [varchar](100) NOT NULL,
	[InsercionHistoricoID] [int] NOT NULL,
	[CatalogoModeloID] [int] NOT NULL,
	[CatalogoMarcaID] [int] NOT NULL,
	[NombreEquipo] [varchar](100) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[CatalogoFamiliaID] [int] NOT NULL,
	[CatalogoEstatusID] [int] NOT NULL,
	[CatalogoSubEstatusID] [int] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_Almacen_Inventario] PRIMARY KEY CLUSTERED 
(
	[Homoclave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Layout_Prepago]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Layout_Prepago](
	[InventarioPrepagoID] [int] NOT NULL,
	[CampoExcel] [varchar](50) NOT NULL,
	[Principal] [varchar](50) NOT NULL,
	[CampoBase] [varchar](50) NOT NULL,
	[TipoDato] [varchar](150) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_Pedido]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Pedido](
	[AlmacenPedidoID] [int] IDENTITY(1,1) NOT NULL,
	[Material] [varchar](50) NOT NULL,
	[Estatus] [varchar](50) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[Existencias] [int] NOT NULL,
	[Pedido] [int] NOT NULL,
	[Campana] [varchar](100) NOT NULL,
	[Autorizado] [int] NULL,
 CONSTRAINT [PK_Almacen_Pedido] PRIMARY KEY CLUSTERED 
(
	[AlmacenPedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_PlanFinanciamiento]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen_PlanFinanciamiento](
	[PlanFinanciamientoID] [int] IDENTITY(1,1) NOT NULL,
	[CatalogoModeloID] [int] NOT NULL,
	[CatalogoPlazoID] [int] NOT NULL,
 CONSTRAINT [PK_Almacen_Plan_Financiamiento] PRIMARY KEY CLUSTERED 
(
	[PlanFinanciamientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Almacen_PlazoCotizacion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen_PlazoCotizacion](
	[CatalogoPlazoID] [int] IDENTITY(1,1) NOT NULL,
	[Plazo24Meses] [float] NOT NULL,
	[Plazo18Meses] [float] NOT NULL,
	[Plazo12Meses] [float] NOT NULL,
	[Plazo6Meses] [float] NOT NULL,
 CONSTRAINT [PK_Almacen_PlazoCotizacion] PRIMARY KEY CLUSTERED 
(
	[CatalogoPlazoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Almacen_Prepago]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_Prepago](
	[AlmacenPrepagoID] [int] NOT NULL,
	[Material] [varchar](50) NULL,
	[CatalogoMarcaID] [varchar](50) NOT NULL,
	[CatalogoEstatusID] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Serie] [varchar](100) NULL,
	[DescripcionExtra] [varchar](100) NULL,
	[Operador] [varchar](50) NULL,
 CONSTRAINT [PK_Almacen_Prepago] PRIMARY KEY CLUSTERED 
(
	[AlmacenPrepagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Almacen_TransaccionHistorico]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen_TransaccionHistorico](
	[TransaccionHistoricoID] [int] IDENTITY(1,1) NOT NULL,
	[Homoclave] [varchar](50) NOT NULL,
	[CatalogoEstatusID] [int] NOT NULL,
	[MotivoEstatus] [varchar](200) NOT NULL,
	[Campaña] [int] NOT NULL,
	[NumeroEmpleado] [nchar](10) NOT NULL,
	[FechaTransaccion] [datetime] NOT NULL,
 CONSTRAINT [PK_Almacen_TransaccionHistorico] PRIMARY KEY CLUSTERED 
(
	[TransaccionHistoricoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carga_adjuntos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carga_adjuntos](
	[Id] [int] NULL,
	[nombreAdjunto] [nvarchar](max) NULL,
	[rutaAdjunto] [nvarchar](max) NULL,
	[fechaCarga] [datetime] NULL,
	[personal] [nvarchar](8) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalogo_CalendarioMensajeria]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_CalendarioMensajeria](
	[CalendarioMensajeriaID] [smallint] NOT NULL,
	[CatalogoID_P] [int] NOT NULL,
	[ProvedorMensajeriaID] [int] NOT NULL,
	[DiaVenta] [tinyint] NULL,
	[DiaPortabilidad] [tinyint] NULL,
	[DiaEntregaMensajeria] [tinyint] NULL,
	[DiaEntregaCliente] [tinyint] NULL,
	[Corte] [tinyint] NULL,
	[Estatus] [bit] NULL,
	[FecAlta] [datetime] NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [XPKCalendario_Mensajeria] PRIMARY KEY CLUSTERED 
(
	[CalendarioMensajeriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalogo_CoberturaMensajeria]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_CoberturaMensajeria](
	[CoberturaMensajeriaID] [smallint] NOT NULL,
	[CatalogoID_P] [int] NOT NULL,
	[ProvedorMensajeriaID] [int] NOT NULL,
	[CatalogoID_E] [int] NOT NULL,
	[EstadoID] [int] NOT NULL,
	[CP] [varchar](5) NULL,
	[Ciudad_Municipio] [varchar](40) NULL,
	[Colonia] [varchar](40) NULL,
	[Estatus] [bit] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Catalogo_CoberturaMensajeria] PRIMARY KEY CLUSTERED 
(
	[CoberturaMensajeriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogo_CombinacionStatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_CombinacionStatus](
	[ConvinacionID] [int] NOT NULL,
	[ModuloID] [smallint] NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[SubestatusID] [smallint] NOT NULL,
	[TipificacionID] [smallint] NOT NULL,
	[ProcesoID] [smallint] NULL,
	[Fecha_Alata] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Global_CombinacionStatus] PRIMARY KEY CLUSTERED 
(
	[ConvinacionID] ASC,
	[ModuloID] ASC,
	[StatusID] ASC,
	[SubestatusID] ASC,
	[TipificacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalogo_Db_Historial]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_Db_Historial](
	[DBHistorialID] [bigint] NOT NULL,
	[CampanaID] [smallint] NULL,
	[CompaniaID] [smallint] NULL,
	[ProyectoID] [smallint] NULL,
	[fechacreacion] [datetime] NOT NULL,
	[rutaarchivo] [varchar](150) NOT NULL,
	[estatus] [int] NOT NULL,
	[correo] [bit] NOT NULL,
	[subidos] [int] NOT NULL,
	[repetidos] [int] NOT NULL,
	[profeco] [int] NULL,
	[marcacion] [bit] NOT NULL,
	[ip] [nvarchar](50) NOT NULL,
	[personal] [varchar](10) NOT NULL,
	[tipobase] [int] NULL,
	[CatalogoID] [smallint] NULL,
	[TipoCatalogoID] [smallint] NULL,
	[OrigenID] [int] NULL,
	[EstadoID] [int] NULL,
	[FiltroID] [int] NULL,
 CONSTRAINT [PK_Catalogo_Db_Historial_1] PRIMARY KEY CLUSTERED 
(
	[DBHistorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogo_historial]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_historial](
	[Catalogo_HistorialID] [int] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[CatalogoID] [int] NOT NULL,
	[CatalogoItemID] [int] NOT NULL,
 CONSTRAINT [PK_Catalogo_historial] PRIMARY KEY CLUSTERED 
(
	[Catalogo_HistorialID] ASC,
	[CompaniaID] ASC,
	[ProyectoID] ASC,
	[CampanaID] ASC,
	[CatalogoID] ASC,
	[CatalogoItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalogo_Modulo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_Modulo](
	[ModuloID] [smallint] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Catalogo_Modulo] PRIMARY KEY CLUSTERED 
(
	[ModuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogo_Proceso]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_Proceso](
	[ProcesoID] [smallint] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_ALta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Catalogo_Proceso] PRIMARY KEY CLUSTERED 
(
	[ProcesoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogo_Status]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_Status](
	[StatusID] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Disparador] [nchar](10) NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Catalogo_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogo_StatusNivel4]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_StatusNivel4](
	[Statusnivel4ID] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_ALta] [date] NOT NULL,
	[Fecha_Baja] [date] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Catalogo_StatusNivel4] PRIMARY KEY CLUSTERED 
(
	[Statusnivel4ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogo_Subestatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_Subestatus](
	[SubestatusID] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Catalogo_Subestatus] PRIMARY KEY CLUSTERED 
(
	[SubestatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogo_SucursalCAC]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_SucursalCAC](
	[SucursalCACID] [smallint] NOT NULL,
	[Nombre] [varchar](40) NULL,
	[Estado] [varchar](40) NOT NULL,
	[Ciudad] [varchar](40) NULL,
	[Colonia] [varchar](40) NULL,
	[CP] [varchar](5) NULL,
	[Calle] [varchar](40) NULL,
	[NumExterior] [varchar](50) NULL,
	[NumInterior] [varchar](100) NULL,
	[EntreCalle] [varchar](40) NULL,
	[YCalle] [varchar](40) NULL,
	[Lada] [varchar](5) NULL,
	[Telefono] [varchar](10) NULL,
	[Horario_Atencion] [varchar](80) NULL,
	[Tiempo_Traslado] [varchar](20) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaBaja] [datetime] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Catalogo_SucursalCAC] PRIMARY KEY CLUSTERED 
(
	[SucursalCACID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogo_Tipificacion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo_Tipificacion](
	[TipificacionID] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_ALta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Catalogo_Tipificacion] PRIMARY KEY CLUSTERED 
(
	[TipificacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CatalogoItem]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CatalogoItem](
	[CatalogoItemID] [int] NOT NULL,
	[CatalogoID] [int] NOT NULL,
	[OrigenItem] [int] NULL,
	[Nombre] [varchar](500) NULL,
	[Descripcion] [text] NULL,
	[FecAlta] [datetime] NULL,
	[FecModificacion] [datetime] NULL,
	[Triger] [int] NULL,
	[Personal] [varchar](7) NULL,
	[estatus] [bit] NULL,
	[Estatus_Almacen] [int] NULL,
 CONSTRAINT [PK_CatalogoItem_1] PRIMARY KEY CLUSTERED 
(
	[CatalogoItemID] ASC,
	[CatalogoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatoContacto_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatoContacto_YO_SOY_TELCEL](
	[DatoID] [bigint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[DBHistorialID] [bigint] NULL,
	[Ciclo] [tinyint] NULL,
	[Profeco] [bit] NULL,
	[Agendado] [bit] NULL,
	[Referido] [bit] NULL,
	[Duplicado] [bit] NULL,
	[StatusDato] [bit] NULL,
	[TransaccionID] [bigint] NULL,
	[AsignadoA] [varchar](10) NULL,
	[Fecha_Tomado] [varchar](50) NULL,
	[ConfiguracionID] [bigint] NULL,
	[TELEFONO] [varchar](10) NULL,
 CONSTRAINT [PK__DatoCont__99753543AF0E09EF] PRIMARY KEY CLUSTERED 
(
	[DatoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Errores_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errores_YO_SOY_TELCEL](
	[ErrorID] [bigint] NOT NULL,
	[HistorialDCID] [bigint] NOT NULL,
	[CampoID] [smallint] NOT NULL,
	[ModuloID] [smallint] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Familia_Catalogos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Familia_Catalogos](
	[CatalogoID] [int] NOT NULL,
	[TipoCatalogoID] [smallint] NOT NULL,
	[OrigenID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [text] NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[FecAlta] [datetime] NULL,
	[FecModificacion] [datetime] NULL,
	[Triger] [smallint] NULL,
	[Personal] [varchar](7) NULL,
	[estatus] [bit] NULL,
 CONSTRAINT [PK_Catalogos_1] PRIMARY KEY CLUSTERED 
(
	[CatalogoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_BDFiltros]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_BDFiltros](
	[ID] [bigint] NOT NULL,
	[DBHistorialID] [bigint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[FiltroID] [smallint] NOT NULL,
	[Estatus] [bit] NOT NULL,
	[Personal] [nvarchar](50) NOT NULL,
	[Fecha_Cambio] [datetime] NOT NULL,
 CONSTRAINT [PK_Global_BDFiltros_1] PRIMARY KEY CLUSTERED 
(
	[DBHistorialID] ASC,
	[CompaniaID] ASC,
	[ProyectoID] ASC,
	[CampanaID] ASC,
	[FiltroID] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_BloqueDatos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_BloqueDatos](
	[BloqueDatosID] [tinyint] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
	[TipoBloque] [varchar](10) NULL,
	[ProyectoID] [smallint] NULL,
	[CompaniaID] [smallint] NULL,
 CONSTRAINT [PK_Global_BloqueDatos] PRIMARY KEY CLUSTERED 
(
	[BloqueDatosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_BloqueDatosCampana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_BloqueDatosCampana](
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[BloqueDatosID] [tinyint] NOT NULL,
	[ModuloID] [smallint] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
	[Orden] [tinyint] NULL,
 CONSTRAINT [PK_Global_BloqueDatosCampana] PRIMARY KEY CLUSTERED 
(
	[CompaniaID] ASC,
	[ProyectoID] ASC,
	[CampanaID] ASC,
	[BloqueDatosID] ASC,
	[ModuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_Campana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_Campana](
	[CampanaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[TipoCampanaID] [tinyint] NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[MetaVentas] [tinyint] NULL,
	[Archivo] [bit] NULL,
	[Almacen] [bit] NULL,
	[AlmacenID] [int] NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Global_Campana] PRIMARY KEY CLUSTERED 
(
	[CampanaID] ASC,
	[ProyectoID] ASC,
	[CompaniaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_CampanaDato]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_CampanaDato](
	[CampanaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[BloqueDatosID] [tinyint] NOT NULL,
	[DatoID] [smallint] NOT NULL,
	[CampanaDatoID] [int] NOT NULL,
	[Disparador] [text] NULL,
	[TipoControl] [text] NULL,
	[SaltosLinea] [tinyint] NULL,
	[Etiqueta_Campo] [varchar](100) NULL,
	[Cargar_Desde_Excel] [bit] NULL,
	[Columna_Excel] [varchar](30) NULL,
	[Principal] [bit] NULL,
	[Fecha_Alta] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL,
	[Style] [text] NULL,
	[Orden_Tab] [smallint] NULL,
	[Reglas] [text] NULL,
	[banderacolumtransaccion] [bit] NULL,
	[banderacolumdatocontacto] [bit] NULL,
	[TipoSeleccion] [varchar](10) NULL,
	[TablaOrigenCatalogo] [varchar](200) NULL,
	[FamiliaCatalogoIdInicio] [int] NULL,
	[ItemPrecarga] [int] NULL,
	[BanderaCascada] [bit] NULL,
	[TablaCascadaSiguiente] [varchar](200) NULL,
	[FamiliaCatalogoIdSiguiente] [int] NULL,
	[ControlSiguiente] [varchar](50) NULL,
	[BanderaSubBloque] [bit] NULL,
	[BanderaMismoBloque] [bit] NULL,
	[FamiliaCatalogoIdAnterior] [int] NULL,
	[BanderaBandeja] [bit] NULL,
	[BanderaBandejaSupervisor] [bit] NULL,
 CONSTRAINT [PK_Global_CampanaDato_1] PRIMARY KEY CLUSTERED 
(
	[CampanaID] ASC,
	[ProyectoID] ASC,
	[CompaniaID] ASC,
	[BloqueDatosID] ASC,
	[DatoID] ASC,
	[CampanaDatoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_CampanaOpcionCarga]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_CampanaOpcionCarga](
	[CampanaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[OpcionCargaID] [smallint] NOT NULL,
	[Valor_Opcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Global_CampanaOpcionCarga] PRIMARY KEY CLUSTERED 
(
	[CampanaID] ASC,
	[ProyectoID] ASC,
	[CompaniaID] ASC,
	[OpcionCargaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_CampanaSubDatos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_CampanaSubDatos](
	[CampanaSubDatosID] [int] NOT NULL,
	[Tabla_Origen] [varchar](50) NULL,
	[CatalogoDatosEncuestaID] [int] NULL,
	[CampanaDatoID] [int] NULL,
	[CampanaSubDatosIDAnt] [int] NULL,
	[Nombre] [text] NULL,
	[Etiqueta] [text] NULL,
	[Fecha_Alta] [datetime] NULL,
	[Style] [text] NULL,
	[Orden_Tab] [smallint] NULL,
	[Reglas] [text] NULL,
	[Disparador] [text] NULL,
	[Tipo_Control] [text] NULL,
	[SaltosLinea] [tinyint] NULL,
	[TipoDato] [varchar](20) NULL,
	[banderacolumtransaccion] [bit] NULL,
	[estatus] [bit] NULL,
	[TipoSeleccion] [varchar](10) NULL,
	[TablaOrigenCatalogo] [varchar](200) NULL,
	[FamiliaCatalogoIdInicio] [int] NULL,
	[FamiliaCatalogoIdAnterior] [int] NULL,
	[ItemPrecarga] [int] NULL,
	[BanderaCascada] [bit] NULL,
	[TablaCascadaSiguiente] [varchar](200) NULL,
	[FamiliaCatalogoIdSiguiente] [int] NULL,
	[ControlSiguiente] [varchar](50) NULL,
	[BanderaSubBloque] [bit] NULL,
	[BanderaMismoBloque] [bit] NULL,
	[Fecha_Baja] [datetime] NULL,
	[CampanaID] [smallint] NULL,
	[ControlPadre] [text] NULL,
	[ProyectoID] [smallint] NULL,
	[ItemPadre] [int] NULL,
 CONSTRAINT [PK_Global_CampanaSubDatos] PRIMARY KEY CLUSTERED 
(
	[CampanaSubDatosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_CatalogoDatos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_CatalogoDatos](
	[DatoID] [smallint] NOT NULL,
	[BloqueDatosID] [tinyint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[TipoDato] [varchar](20) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
	[ProyectoID] [smallint] NULL,
 CONSTRAINT [PK_Global_CatalogoDatos] PRIMARY KEY CLUSTERED 
(
	[DatoID] ASC,
	[BloqueDatosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_CatalogoDatosEncuesta]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_CatalogoDatosEncuesta](
	[CatalogoDatosEncuestaID] [int] NOT NULL,
	[BloqueDatosID] [tinyint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[Nombre] [varchar](250) NULL,
	[Etiqueta] [text] NULL,
	[Fecha_Alta] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL,
	[Style] [text] NULL,
	[Orden_Tab] [smallint] NULL,
	[Reglas] [text] NULL,
	[Disparador] [text] NULL,
	[Tipo_Control] [text] NULL,
	[SaltosLinea] [tinyint] NULL,
	[TipoDato] [varchar](20) NULL,
	[banderacolumtransaccion] [bit] NULL,
	[estatus] [bit] NULL,
	[TipoSeleccion] [varchar](10) NULL,
	[TablaOrigenCatalogo] [varchar](200) NULL,
	[FamiliaCatalogoIdInicio] [int] NULL,
	[ItemPrecarga] [int] NULL,
	[BanderaCascada] [bit] NULL,
	[TablaCascadaSiguiente] [varchar](200) NULL,
	[FamiliaCatalogoIdSiguiente] [int] NULL,
	[ControlSiguiente] [varchar](50) NULL,
	[BanderaSubBloque] [bit] NULL,
	[BanderaMismoBloque] [bit] NULL,
	[FamiliaCatalogoIdAnterior] [int] NULL,
 CONSTRAINT [PK_Global_CatalogoDatosEncuesta] PRIMARY KEY CLUSTERED 
(
	[CatalogoDatosEncuestaID] ASC,
	[BloqueDatosID] ASC,
	[CampanaID] ASC,
	[ProyectoID] ASC,
	[CompaniaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_CatalogoOpcionesCargar]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_CatalogoOpcionesCargar](
	[OpcionCargaID] [smallint] NOT NULL,
	[Opcion] [varchar](30) NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Global_CatalogoOpcionesCargar] PRIMARY KEY CLUSTERED 
(
	[OpcionCargaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_CatalogoSubDatos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_CatalogoSubDatos](
	[SubDatoID] [smallint] NOT NULL,
	[SubBloqueDatosID] [smallint] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[TipoDato] [varchar](20) NULL,
	[Descripcion] [text] NULL,
	[Fecha_Alta] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Global_CatalogoSubDatos] PRIMARY KEY CLUSTERED 
(
	[SubDatoID] ASC,
	[SubBloqueDatosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_Compania]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_Compania](
	[CompaniaID] [smallint] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Global_Compania] PRIMARY KEY CLUSTERED 
(
	[CompaniaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_ConfiguracionStatusLlamada]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_ConfiguracionStatusLlamada](
	[ConfiguracionSLlamadaID] [bigint] NOT NULL,
	[LlamadaStatusID] [smallint] NOT NULL,
	[LlamadaSubestatusID] [smallint] NOT NULL,
	[LlamadaTipificacionID] [smallint] NOT NULL,
	[LlamadaStatus4ID] [smallint] NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[Procede] [bit] NULL,
	[ReglaID] [smallint] NOT NULL,
	[Fecha_ALta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Global_ConfiguracionStatusLlamada] PRIMARY KEY CLUSTERED 
(
	[ConfiguracionSLlamadaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_ConfiguracionStatusLlamadaBase]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_ConfiguracionStatusLlamadaBase](
	[ConfiguracionID] [bigint] NOT NULL,
	[NumeroConfiguracion] [bigint] NOT NULL,
	[DBHistorialID] [bigint] NOT NULL,
	[LlamadaStatusID] [smallint] NOT NULL,
	[LlamadaSubestatusID] [smallint] NOT NULL,
	[LlamadaTipificacionID] [smallint] NOT NULL,
	[LlamadaStatus4ID] [smallint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[Procede] [bit] NOT NULL,
	[ReglaID] [smallint] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Global_ConfiguracionStatusLlamadaBase_1] PRIMARY KEY CLUSTERED 
(
	[ConfiguracionID] ASC,
	[NumeroConfiguracion] ASC,
	[DBHistorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_FiltrosBD]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_FiltrosBD](
	[FiltroID] [smallint] NOT NULL,
	[Filtro] [text] NOT NULL,
	[CampanaID] [int] NOT NULL,
	[Personal] [nvarchar](7) NULL,
	[Personal_Modif] [nvarchar](7) NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Modif] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
	[ciclo] [int] NULL,
	[vigenciaBase] [datetime] NULL,
	[permiteDuplicados] [bit] NULL,
	[lapsoMarcacion] [int] NULL,
 CONSTRAINT [PK_Global_FiltrosBD] PRIMARY KEY CLUSTERED 
(
	[FiltroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_JornadaLaboral]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_JornadaLaboral](
	[JornadaLaboralID] [tinyint] NOT NULL,
	[Etiqueta_horario] [varchar](30) NOT NULL,
	[Hora_inicio] [time](7) NOT NULL,
	[Hora_fin] [time](7) NOT NULL,
	[Lunes] [bit] NULL,
	[Martes] [bit] NULL,
	[Miercoles] [bit] NULL,
	[Jueves] [bit] NULL,
	[Viernes] [bit] NULL,
	[Sabado] [bit] NULL,
	[Domingo] [bit] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModif] [datetime] NULL,
	[estatus] [bit] NULL,
	[VentanaServicio] [varchar](30) NULL,
	[jornada] [time](7) NULL,
	[tiempobreak] [time](7) NULL,
	[Guardia] [varchar](30) NULL,
	[FechaApoyo] [datetime] NULL,
	[UnicoID] [tinyint] NULL,
	[RegistradoPor] [varchar](7) NULL,
 CONSTRAINT [PK_Jornada_Laboral] PRIMARY KEY CLUSTERED 
(
	[JornadaLaboralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_LlamadaStatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_LlamadaStatus](
	[LlamadaStatusID] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Global_LlamadaStatus] PRIMARY KEY CLUSTERED 
(
	[LlamadaStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_LlamadaStatusNivel4]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_LlamadaStatusNivel4](
	[LlamadaStatus4ID] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [date] NOT NULL,
	[Fecha_Baja] [date] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Global_LlamadaStatusNivel4] PRIMARY KEY CLUSTERED 
(
	[LlamadaStatus4ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_LlamadaSubestatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_LlamadaSubestatus](
	[LlamadaSubestatusID] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Global_LlamadaSubestatus] PRIMARY KEY CLUSTERED 
(
	[LlamadaSubestatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_LlamadaTipificacion]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_LlamadaTipificacion](
	[LlamadaTipificacionID] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Fecha_ALta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Global_LlamadaTipificacion] PRIMARY KEY CLUSTERED 
(
	[LlamadaTipificacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_Mensaje]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_Mensaje](
	[MensajeID] [bigint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[Mensaje] [text] NOT NULL,
	[DeUsuario] [varchar](10) NOT NULL,
	[ParaUsuario] [varchar](10) NOT NULL,
	[Fecha_ALta] [datetime] NOT NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Global_Mensaje] PRIMARY KEY CLUSTERED 
(
	[MensajeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_Modulo_Datos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_Modulo_Datos](
	[CampanaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[BloqueDatosID] [tinyint] NOT NULL,
	[DatoID] [smallint] NOT NULL,
	[CampanaDatoID] [int] NOT NULL,
	[ModuloID] [smallint] NOT NULL,
	[Orden_Tabulacion] [tinyint] NOT NULL,
	[Requerido_Obligatorio] [bit] NOT NULL,
	[Disparador] [text] NOT NULL,
	[Origen] [bigint] NOT NULL,
	[Destino] [bigint] NOT NULL,
	[Estatus] [bit] NULL,
	[SeccionesDatosID] [smallint] NULL,
 CONSTRAINT [PK_Global_Proceso_Datos] PRIMARY KEY CLUSTERED 
(
	[CampanaID] ASC,
	[ProyectoID] ASC,
	[CompaniaID] ASC,
	[BloqueDatosID] ASC,
	[DatoID] ASC,
	[CampanaDatoID] ASC,
	[ModuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_ModuloSiguiente]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_ModuloSiguiente](
	[ModoluSiguienteID] [bigint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[ProcesoID] [smallint] NULL,
	[ModuloID] [smallint] NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[SubestatusID] [smallint] NOT NULL,
	[TipificacionID] [smallint] NOT NULL,
	[StatusNivel4] [smallint] NOT NULL,
	[ModuloSiguiente] [smallint] NOT NULL,
	[ReglaID] [smallint] NOT NULL,
	[Visible] [bit] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NULL,
	[BanderaErrores] [bit] NULL,
	[BanderaAlmacen] [bit] NULL,
	[BanderaBandejaValidador] [bit] NULL,
	[BanderaTableroResultados] [bit] NULL,
	[BanderaAgendados] [bit] NULL,
	[BanderaEstatusLlamada] [bit] NULL,
	[BanderaBandejaErrores] [bit] NULL,
	[BanderaImpresion] [bit] NULL,
	[BanderaBandejaVentas] [bit] NULL,
	[BanderaAlmacenOfertar] [bit] NULL,
	[BanderaAlmacenLiberarOferta] [bit] NULL,
	[BanderaBotonGuardar] [bit] NULL,
	[BanderaPredictivo] [bit] NULL,
	[BanderaFolio] [bit] NULL,
	[BanderaControlMarcacion] [bit] NULL,
	[BanderaRespaldo] [bit] NULL,
 CONSTRAINT [PK_Global_ModuloSiguiente_1] PRIMARY KEY CLUSTERED 
(
	[ModoluSiguienteID] ASC,
	[CompaniaID] ASC,
	[ProyectoID] ASC,
	[CampanaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_Perfiles]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_Perfiles](
	[PerfilID] [int] NOT NULL,
	[Personal] [varchar](10) NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[ProcesoID] [smallint] NOT NULL,
	[Modulos] [varchar](30) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaBaja] [datetime] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[PerfilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_Personal]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_Personal](
	[Personal] [varchar](10) NOT NULL,
	[RolID] [tinyint] NULL,
	[ApellidoPaterno] [varchar](30) NULL,
	[ApellidoMaterno] [varchar](30) NULL,
	[Nombre] [varchar](30) NULL,
	[ReportaANom] [varchar](100) NULL,
	[ReportaA] [varchar](10) NULL,
	[Categoria] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaBaja] [datetime] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[Personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_Proyecto]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_Proyecto](
	[ProyectoID] [smallint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Global_Proyecto] PRIMARY KEY CLUSTERED 
(
	[ProyectoID] ASC,
	[CompaniaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_ReglasStatus]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_ReglasStatus](
	[ReglaID] [smallint] NOT NULL,
	[Agenda] [bit] NOT NULL,
	[Dias] [tinyint] NOT NULL,
	[LiberaDatoPrincipal] [bit] NULL,
	[FinalizaTransaccion] [bit] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [date] NOT NULL,
	[Fecha_Baja] [date] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Global_ReglasStatus] PRIMARY KEY CLUSTERED 
(
	[ReglaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_RolesPersonal]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_RolesPersonal](
	[RolID] [tinyint] NOT NULL,
	[Nombre_rol] [varchar](30) NULL,
	[MultiCampanas] [bit] NULL,
	[MultiModulos] [bit] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaBaja] [datetime] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Roles_personal] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_SeccionesCampana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global_SeccionesCampana](
	[SeccionesCampana] [smallint] NOT NULL,
	[SeccionesDatosID] [smallint] NULL,
	[CampanaID] [smallint] NULL,
	[Estatus] [bit] NULL,
	[Orden] [tinyint] NULL,
	[BloqueDatosID] [tinyint] NULL,
	[OcultaSeccionActiva] [bit] NULL,
 CONSTRAINT [PK_Global_SeccionesCampana] PRIMARY KEY CLUSTERED 
(
	[SeccionesCampana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Global_SeccionesDatos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_SeccionesDatos](
	[SeccionesDatosID] [smallint] NOT NULL,
	[BloqueDatosID] [tinyint] NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NOT NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Global_SeccionesDatos] PRIMARY KEY CLUSTERED 
(
	[SeccionesDatosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_SubBloqueDatos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_SubBloqueDatos](
	[SubBloqueDatosID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [text] NULL,
	[Fecha_Alta] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Global_SubBloqueDatos_1] PRIMARY KEY CLUSTERED 
(
	[SubBloqueDatosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_TablasCampana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_TablasCampana](
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[NomTablaDato] [varchar](200) NOT NULL,
	[NomTablaProfeco] [varchar](200) NULL,
	[NomTablaTransaccionDV] [varchar](200) NOT NULL,
	[NomTablaTransaccionDC] [varchar](200) NULL,
	[NomTablaTransaccionHDV] [varchar](200) NOT NULL,
	[NomTablaTransaccionHDC] [varchar](200) NULL,
	[NomTablaAgendados] [varchar](200) NULL,
	[NomTablaHistorialAgendado] [varchar](200) NULL,
	[NomTablaErrores] [varchar](200) NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Global_TablasCampana] PRIMARY KEY CLUSTERED 
(
	[CompaniaID] ASC,
	[ProyectoID] ASC,
	[CampanaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Global_TipoCampana]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Global_TipoCampana](
	[TipoCampanaID] [tinyint] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Global_TipoCampana] PRIMARY KEY CLUSTERED 
(
	[TipoCampanaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistorialAgendados_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistorialAgendados_YO_SOY_TELCEL](
	[HistorialAgendado] [bigint] NOT NULL,
	[Agendado] [bigint] NOT NULL,
	[TransaccionID] [bigint] NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[DatoID] [bigint] NOT NULL,
	[Personal] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[NumeroReferencia] [varchar](10) NULL,
	[NumeroReferido] [varchar](10) NULL,
	[EstatusAgendado] [smallint] NULL,
	[EstatusAR] [bit] NOT NULL,
	[Fecha_Agendado] [date] NOT NULL,
	[Hora_Agendados] [time](7) NOT NULL,
	[Descripcion] [text] NULL,
	[DescripcionAgendado] [text] NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Baja] [datetime] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HistorialAgendado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InventarioTransacciones]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventarioTransacciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Area] [varchar](50) NOT NULL,
	[CampanaID] [int] NOT NULL,
	[TransaccionID] [int] NOT NULL,
	[ArticuloID] [int] NOT NULL,
	[PlanID] [varchar](50) NULL,
	[Responsable] [varchar](20) NULL,
	[Capturado] [datetime] NOT NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_InventarioTransacciones] PRIMARY KEY CLUSTERED 
(
	[CampanaID] ASC,
	[TransaccionID] ASC,
	[ArticuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menuAllsoft]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menuAllsoft](
	[menuid] [int] NOT NULL,
	[descripcion] [varchar](150) NULL,
	[idmenupadre] [int] NULL,
	[orden] [int] NULL,
	[menuTipoId] [int] NULL,
	[script] [bit] NULL,
	[estado] [bit] NULL,
	[accion] [varchar](50) NULL,
	[controlador] [varchar](50) NULL,
	[fechaAlta] [date] NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK__menuAlls__3B5F7D5C8FEE3A57] PRIMARY KEY CLUSTERED 
(
	[menuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menuTipo]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menuTipo](
	[menuTipoId] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[estatus] [bit] NULL,
	[fechaAlta] [date] NULL,
	[fechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[menuTipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nivel_Catalogos]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nivel_Catalogos](
	[TipoCatalogoID] [smallint] NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [text] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaMod] [datetime] NULL,
	[estatus] [bit] NULL,
 CONSTRAINT [PK_TipoCatalogos] PRIMARY KEY CLUSTERED 
(
	[TipoCatalogoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profeco_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profeco_YO_SOY_TELCEL](
	[DatoID] [bigint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[Telefono] [varchar](max) NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DatoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RespaldoAllsoft]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RespaldoAllsoft](
	[RespaldoID] [int] NOT NULL,
	[CampanaID] [int] NOT NULL,
	[TransaccionID] [int] NULL,
	[Personal] [varchar](10) NOT NULL,
	[Respaldo] [text] NULL,
	[FechaRespaldo] [date] NULL,
	[ModuloID] [int] NULL,
 CONSTRAINT [PK_RespaldoAllsoft] PRIMARY KEY CLUSTERED 
(
	[RespaldoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransaccionDatosCliente_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransaccionDatosCliente_YO_SOY_TELCEL](
	[TransaccionDatosID] [bigint] NOT NULL,
	[TransaccionID] [bigint] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Color_de_piel] [varchar](10) NULL,
	[SEGMENTO] [varchar](100) NULL,
	[TELEFONO] [varchar](10) NULL,
	[ICONOGRAFIA_INICIAL] [varchar](50) NULL,
	[SWITCH_DATTEL] [varchar](10) NULL,
	[FECHA_SECAM] [datetime] NULL,
	[FOLIO] [varchar](10) NULL,
	[FECHA_HORA] [datetime] NULL,
	[NOMBRE_C] [varchar](50) NULL,
	[ALTA_BAJA_CAMBIO_NGR] [varchar](100) NULL,
	[NUMERO_GRATIS_1] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_1] [varchar](50) NULL,
	[NUMERO_GRATIS_2] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_2] [varchar](30) NULL,
	[NUMERO_GRATIS_3] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_3] [varchar](30) NULL,
	[NUMERO_GRATIS_4] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_4] [varchar](30) NULL,
	[NUMERO_GRATIS_5] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_5] [varchar](30) NULL,
	[NUMERO_FRECUENTE_1] [varchar](10) NULL,
	[NUMERO_FRECUENTE_2] [varchar](10) NULL,
	[NUMERO_FRECUENTE_3] [varchar](10) NULL,
	[NUMERO_FRECUENTE_4] [varchar](10) NULL,
	[NUMERO_FRECUENTE_5] [varchar](10) NULL,
	[NUMERO_FRECUENTE_6] [varchar](10) NULL,
	[NUMERO_FRECUENTE_7] [varchar](10) NULL,
	[NUMERO_FRECUENTE_8] [varchar](10) NULL,
	[NUMERO_FRECUENTE_9] [varchar](10) NULL,
	[NUMERO_BAJA] [varchar](10) NULL,
	[NUMERO_ALTA] [varchar](10) NULL,
	[MOTIVO_PORTACION] [varchar](50) NULL,
	[MOTIVO_PORTACION_SUB1] [varchar](50) NULL,
	[CP] [varchar](10) NULL,
	[DESCRIPCION_MOTIVO_PORTACION] [varchar](250) NULL,
	[DETALLE_PROMOCIONES] [varchar](50) NULL,
	[COMPANIA_PORTARA] [varchar](100) NULL,
	[REDES_SOCIALES] [varchar](200) NULL,
	[MEDIO_DE_CONTACTO] [varchar](200) NULL,
	[COMENTARIO_NGR] [text] NULL,
	[COMENTARIO_NUM_FREC] [text] NULL,
	[COMENTARIO_CAMBIO_GRATIS] [text] NULL,
	[ICONOGRAFIA_BOLETINES] [varchar](10) NULL,
	[AMIGO_OPTIMO_PLUS] [int] NULL,
	[AMIGO_ON_LIFE] [varchar](10) NULL,
	[INF_DE_TERCEROS_Y_PROOVEDORES] [int] NULL,
	[AMIGO_X_SEGUNDO] [int] NULL,
	[FIDELIDAD] [int] NULL,
	[AMIGO_PLUS] [int] NULL,
	[COBRO_POR_MINUTO] [int] NULL,
	[TIP_KIT_OPTIMO] [int] NULL,
	[AMIGO_OPTIMO] [int] NULL,
	[AMIGO_TU] [int] NULL,
	[LLAMADA_PATROCINADA] [int] NULL,
	[PAQUETE_100_Y_200] [int] NULL,
	[PAQUETE_DE_SMS] [int] NULL,
	[ADELANTA_SALDO] [int] NULL,
	[PAQUETE_DE_DATOS] [int] NULL,
	[SE_CANALIZA_A_264] [int] NULL,
	[ACLARACION_DE_SALDO] [int] NULL,
	[PROMOCION_REDES_SOCIALES] [int] NULL,
	[CLIENTE_DESEA_PLAN_TARIFARIO] [int] NULL,
	[NUMEROS_GRATIS] [int] NULL,
	[NUMEROS_FRECUENTES] [int] NULL,
	[GRABACION_PROMOCIONES] [int] NULL,
	[COMENTARIO_BOLETINES] [text] NULL,
	[CONTACTADOS] [varchar](10) NULL,
	[FIRMA_AGENTE] [varchar](150) NULL,
	[COMENTARIOS_PRINCIPAL] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransaccionDatosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL](
	[TransaccionID] [bigint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[ProcesoID] [smallint] NOT NULL,
	[ModuloID] [smallint] NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[SubestatusID] [smallint] NOT NULL,
	[TipificacionID] [smallint] NOT NULL,
	[Status4ID] [smallint] NOT NULL,
	[ReglaStatusModulo] [tinyint] NOT NULL,
	[LlamadaStatusID] [smallint] NOT NULL,
	[LlamadaSubestatusID] [smallint] NOT NULL,
	[LlamadaTipificacionID] [smallint] NOT NULL,
	[LlamadaStatus4ID] [smallint] NOT NULL,
	[ReglaStatusLlamada] [tinyint] NOT NULL,
	[DatoID] [bigint] NULL,
	[Personal] [varchar](10) NOT NULL,
	[BloqueID] [smallint] NULL,
	[BandejaOcupado] [bit] NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransaccionHistorialDC_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransaccionHistorialDC_YO_SOY_TELCEL](
	[HistorialDCID] [bigint] NOT NULL,
	[TransaccionHDVID] [bigint] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Color_de_piel] [varchar](10) NULL,
	[SEGMENTO] [varchar](100) NULL,
	[TELEFONO] [varchar](10) NULL,
	[ICONOGRAFIA_INICIAL] [varchar](50) NULL,
	[SWITCH_DATTEL] [varchar](10) NULL,
	[FECHA_SECAM] [datetime] NULL,
	[FOLIO] [varchar](10) NULL,
	[FECHA_HORA] [datetime] NULL,
	[NOMBRE_C] [varchar](50) NULL,
	[ALTA_BAJA_CAMBIO_NGR] [varchar](100) NULL,
	[NUMERO_GRATIS_1] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_1] [varchar](50) NULL,
	[NUMERO_GRATIS_2] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_2] [varchar](30) NULL,
	[NUMERO_GRATIS_3] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_3] [varchar](30) NULL,
	[NUMERO_GRATIS_4] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_4] [varchar](30) NULL,
	[NUMERO_GRATIS_5] [varchar](10) NULL,
	[TIPO_SERVICIO_NUMERO_GRATIS_5] [varchar](30) NULL,
	[NUMERO_FRECUENTE_1] [varchar](10) NULL,
	[NUMERO_FRECUENTE_2] [varchar](10) NULL,
	[NUMERO_FRECUENTE_3] [varchar](10) NULL,
	[NUMERO_FRECUENTE_4] [varchar](10) NULL,
	[NUMERO_FRECUENTE_5] [varchar](10) NULL,
	[NUMERO_FRECUENTE_6] [varchar](10) NULL,
	[NUMERO_FRECUENTE_7] [varchar](10) NULL,
	[NUMERO_FRECUENTE_8] [varchar](10) NULL,
	[NUMERO_FRECUENTE_9] [varchar](10) NULL,
	[NUMERO_BAJA] [varchar](10) NULL,
	[NUMERO_ALTA] [varchar](10) NULL,
	[MOTIVO_PORTACION] [varchar](50) NULL,
	[MOTIVO_PORTACION_SUB1] [varchar](50) NULL,
	[CP] [varchar](10) NULL,
	[DESCRIPCION_MOTIVO_PORTACION] [varchar](250) NULL,
	[DETALLE_PROMOCIONES] [varchar](50) NULL,
	[COMPANIA_PORTARA] [varchar](100) NULL,
	[REDES_SOCIALES] [varchar](200) NULL,
	[MEDIO_DE_CONTACTO] [varchar](200) NULL,
	[COMENTARIO_NGR] [text] NULL,
	[COMENTARIO_NUM_FREC] [text] NULL,
	[COMENTARIO_CAMBIO_GRATIS] [text] NULL,
	[ICONOGRAFIA_BOLETINES] [varchar](10) NULL,
	[AMIGO_OPTIMO_PLUS] [int] NULL,
	[AMIGO_ON_LIFE] [varchar](10) NULL,
	[INF_DE_TERCEROS_Y_PROOVEDORES] [int] NULL,
	[AMIGO_X_SEGUNDO] [int] NULL,
	[FIDELIDAD] [int] NULL,
	[AMIGO_PLUS] [int] NULL,
	[COBRO_POR_MINUTO] [int] NULL,
	[TIP_KIT_OPTIMO] [int] NULL,
	[AMIGO_OPTIMO] [int] NULL,
	[AMIGO_TU] [int] NULL,
	[LLAMADA_PATROCINADA] [int] NULL,
	[PAQUETE_100_Y_200] [int] NULL,
	[PAQUETE_DE_SMS] [int] NULL,
	[ADELANTA_SALDO] [int] NULL,
	[PAQUETE_DE_DATOS] [int] NULL,
	[SE_CANALIZA_A_264] [int] NULL,
	[ACLARACION_DE_SALDO] [int] NULL,
	[PROMOCION_REDES_SOCIALES] [int] NULL,
	[CLIENTE_DESEA_PLAN_TARIFARIO] [int] NULL,
	[NUMEROS_GRATIS] [int] NULL,
	[NUMEROS_FRECUENTES] [int] NULL,
	[GRABACION_PROMOCIONES] [int] NULL,
	[COMENTARIO_BOLETINES] [text] NULL,
	[CONTACTADOS] [varchar](10) NULL,
	[FIRMA_AGENTE] [varchar](150) NULL,
	[COMENTARIOS_PRINCIPAL] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[HistorialDCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]    Script Date: 15/10/2015 05:11:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL](
	[TransaccionHDVID] [bigint] NOT NULL,
	[TransaccionID] [bigint] NOT NULL,
	[CompaniaID] [smallint] NOT NULL,
	[ProyectoID] [smallint] NOT NULL,
	[CampanaID] [smallint] NOT NULL,
	[ProcesoID] [smallint] NOT NULL,
	[ModuloID] [smallint] NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[SubestatusID] [smallint] NOT NULL,
	[TipificacionID] [smallint] NOT NULL,
	[Status4ID] [smallint] NOT NULL,
	[ReglaStatusModulo] [tinyint] NOT NULL,
	[LlamadaStatusID] [smallint] NOT NULL,
	[LlamadaSubestatusID] [smallint] NOT NULL,
	[LlamadaTipificacionID] [smallint] NOT NULL,
	[LlamadaStatus4ID] [smallint] NOT NULL,
	[ReglaStatusLlamada] [tinyint] NOT NULL,
	[DatoID] [bigint] NULL,
	[Personal] [varchar](10) NOT NULL,
	[BloqueID] [smallint] NULL,
	[BandejaOcupado] [bit] NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransaccionHDVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Agendados_YO_SOY_TELCEL] ADD  CONSTRAINT [DF__Agendados__Fecha__4AF81212]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Agendados_YO_SOY_TELCEL] ADD  CONSTRAINT [DF__Agendados__Statu__4BEC364B]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Alm_Producto] ADD  CONSTRAINT [DF_Alm_Producto_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Alm_Subalmacen] ADD  CONSTRAINT [DF_Alm_Subalmacen_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Catalogo_CalendarioMensajeria] ADD  CONSTRAINT [DF_Catalogo_CalendarioMensajeria_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_CalendarioMensajeria] ADD  CONSTRAINT [DF_Catalogo_CalendarioMensajeria_FecAlta]  DEFAULT (getdate()) FOR [FecAlta]
GO
ALTER TABLE [dbo].[Catalogo_CalendarioMensajeria] ADD  CONSTRAINT [DF_Catalogo_CalendarioMensajeria_FecBaja]  DEFAULT (getdate()) FOR [FecBaja]
GO
ALTER TABLE [dbo].[Catalogo_CoberturaMensajeria] ADD  CONSTRAINT [DF_Catalogo_CoberturaMensajeria_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_CoberturaMensajeria] ADD  CONSTRAINT [DF_Catalogo_CoberturaMensajeria_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Catalogo_CoberturaMensajeria] ADD  CONSTRAINT [DF_Catalogo_CoberturaMensajeria_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus] ADD  CONSTRAINT [DF_Global_CombinacionStatus_Fecha_Alata]  DEFAULT (getdate()) FOR [Fecha_Alata]
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus] ADD  CONSTRAINT [DF_Global_CombinacionStatus_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_Modulo] ADD  CONSTRAINT [DF_Catalogo_Modulo_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Catalogo_Modulo] ADD  CONSTRAINT [DF_Catalogo_Modulo_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_Proceso] ADD  CONSTRAINT [DF_Catalogo_Proceso_Fecha_ALta]  DEFAULT (getdate()) FOR [Fecha_ALta]
GO
ALTER TABLE [dbo].[Catalogo_Proceso] ADD  CONSTRAINT [DF_Catalogo_Proceso_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_Status] ADD  CONSTRAINT [DF_Catalogo_Status_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Catalogo_Status] ADD  CONSTRAINT [DF_Catalogo_Status_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_StatusNivel4] ADD  CONSTRAINT [DF_Catalogo_StatusNivel4_Fecha_ALta]  DEFAULT (getdate()) FOR [Fecha_ALta]
GO
ALTER TABLE [dbo].[Catalogo_StatusNivel4] ADD  CONSTRAINT [DF_Catalogo_StatusNivel4_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_Subestatus] ADD  CONSTRAINT [DF_Catalogo_Subestatus_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Catalogo_Subestatus] ADD  CONSTRAINT [DF_Catalogo_Subestatus_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_SucursalCAC] ADD  CONSTRAINT [DF_Catalogo_SucursalCAC_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Catalogo_SucursalCAC] ADD  CONSTRAINT [DF_Catalogo_SucursalCAC_FechaBaja]  DEFAULT (getdate()) FOR [FechaBaja]
GO
ALTER TABLE [dbo].[Catalogo_SucursalCAC] ADD  CONSTRAINT [DF_Catalogo_SucursalCAC_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Catalogo_Tipificacion] ADD  CONSTRAINT [DF_Catalogo_Tipificacion_Fecha_ALta]  DEFAULT (getdate()) FOR [Fecha_ALta]
GO
ALTER TABLE [dbo].[Catalogo_Tipificacion] ADD  CONSTRAINT [DF_Catalogo_Tipificacion_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[CatalogoItem] ADD  CONSTRAINT [DF_CatalogoItem_FecAlta]  DEFAULT (getdate()) FOR [FecAlta]
GO
ALTER TABLE [dbo].[CatalogoItem] ADD  CONSTRAINT [DF_CatalogoItem_FecModificacion]  DEFAULT (getdate()) FOR [FecModificacion]
GO
ALTER TABLE [dbo].[CatalogoItem] ADD  CONSTRAINT [DF_CatalogoItem_Triger]  DEFAULT ((0)) FOR [Triger]
GO
ALTER TABLE [dbo].[CatalogoItem] ADD  CONSTRAINT [DF_CatalogoItem_estatus]  DEFAULT ((1)) FOR [estatus]
GO
ALTER TABLE [dbo].[CatalogoItem] ADD  CONSTRAINT [DF_CatalogoItem_Estatus_Almacen]  DEFAULT ((0)) FOR [Estatus_Almacen]
GO
ALTER TABLE [dbo].[DatoContacto_YO_SOY_TELCEL] ADD  CONSTRAINT [DF__DatoConta__Agend__1F198FD4]  DEFAULT ((0)) FOR [Agendado]
GO
ALTER TABLE [dbo].[DatoContacto_YO_SOY_TELCEL] ADD  CONSTRAINT [DF__DatoConta__Refer__200DB40D]  DEFAULT ((0)) FOR [Referido]
GO
ALTER TABLE [dbo].[DatoContacto_YO_SOY_TELCEL] ADD  CONSTRAINT [DF__DatoConta__Statu__2101D846]  DEFAULT ((0)) FOR [StatusDato]
GO
ALTER TABLE [dbo].[DatoContacto_YO_SOY_TELCEL] ADD  CONSTRAINT [DF__DatoConta__Trans__21F5FC7F]  DEFAULT ((0)) FOR [TransaccionID]
GO
ALTER TABLE [dbo].[DatoContacto_YO_SOY_TELCEL] ADD  CONSTRAINT [DF__DatoConta__Asign__22EA20B8]  DEFAULT ((0)) FOR [AsignadoA]
GO
ALTER TABLE [dbo].[Errores_YO_SOY_TELCEL] ADD  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Errores_YO_SOY_TELCEL] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Familia_Catalogos] ADD  CONSTRAINT [DF_Catalogos_FecAlta]  DEFAULT (getdate()) FOR [FecAlta]
GO
ALTER TABLE [dbo].[Familia_Catalogos] ADD  CONSTRAINT [DF_Catalogos_FecModificacion]  DEFAULT (getdate()) FOR [FecModificacion]
GO
ALTER TABLE [dbo].[Familia_Catalogos] ADD  CONSTRAINT [DF_Familia_Catalogos_Triger]  DEFAULT ((0)) FOR [Triger]
GO
ALTER TABLE [dbo].[Familia_Catalogos] ADD  CONSTRAINT [DF_Familia_Catalogos_estatus]  DEFAULT ((1)) FOR [estatus]
GO
ALTER TABLE [dbo].[Global_BloqueDatos] ADD  CONSTRAINT [DF_Global_BloqueDatos_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_BloqueDatos] ADD  CONSTRAINT [DF_Global_BloqueDatos_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_BloqueDatosCampana] ADD  CONSTRAINT [DF_Global_BloqueDatosCampana_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_BloqueDatosCampana] ADD  CONSTRAINT [DF_Global_BloqueDatosCampana_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_Campana] ADD  CONSTRAINT [DF_Global_Campana_MetaVentas]  DEFAULT ((0)) FOR [MetaVentas]
GO
ALTER TABLE [dbo].[Global_Campana] ADD  CONSTRAINT [DF_Global_Campana_Archivo]  DEFAULT ((0)) FOR [Archivo]
GO
ALTER TABLE [dbo].[Global_Campana] ADD  CONSTRAINT [DF_Global_Campana_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_Campana] ADD  CONSTRAINT [DF_Global_Campana_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Global_CampanaDato] ADD  CONSTRAINT [DF_Global_CampanaDato_SaltosLinea]  DEFAULT ((0)) FOR [SaltosLinea]
GO
ALTER TABLE [dbo].[Global_CampanaDato] ADD  CONSTRAINT [DF_Global_CampanaDato_Principal]  DEFAULT ((0)) FOR [Principal]
GO
ALTER TABLE [dbo].[Global_CampanaDato] ADD  CONSTRAINT [DF_Global_CampanaDato_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_CampanaSubDatos] ADD  CONSTRAINT [DF_Global_CampanaSubDatos_CatalogoDatosEncuestaID]  DEFAULT ((0)) FOR [CatalogoDatosEncuestaID]
GO
ALTER TABLE [dbo].[Global_CampanaSubDatos] ADD  CONSTRAINT [DF_Global_CampanaSubDatos_CampanaDatoID]  DEFAULT ((0)) FOR [CampanaDatoID]
GO
ALTER TABLE [dbo].[Global_CampanaSubDatos] ADD  CONSTRAINT [DF_Global_CampanaSubDatos_CampanaSubDatosIDAnt]  DEFAULT ((0)) FOR [CampanaSubDatosIDAnt]
GO
ALTER TABLE [dbo].[Global_CampanaSubDatos] ADD  CONSTRAINT [DF_Global_CampanaSubDatos_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_CatalogoDatos] ADD  CONSTRAINT [DF_Global_CatalogoDatos_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_CatalogoDatos] ADD  CONSTRAINT [DF_Global_CatalogoDatos_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_CatalogoDatosEncuesta] ADD  CONSTRAINT [DF_Global_CatalogoDatosEncuesta_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_CatalogoDatosEncuesta] ADD  CONSTRAINT [DF_Global_CatalogoDatosEncuesta_SaltosLinea]  DEFAULT ((0)) FOR [SaltosLinea]
GO
ALTER TABLE [dbo].[Global_CatalogoOpcionesCargar] ADD  CONSTRAINT [DF_Global_CatalogoOpcionesCargar_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_CatalogoOpcionesCargar] ADD  CONSTRAINT [DF_Global_CatalogoOpcionesCargar_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_CatalogoSubDatos] ADD  CONSTRAINT [DF_Global_CatalogoSubDatos_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_CatalogoSubDatos] ADD  CONSTRAINT [DF_Global_CatalogoSubDatos_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_Compania] ADD  CONSTRAINT [DF_Global_Compania_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_Compania] ADD  CONSTRAINT [DF_Global_Compania_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] ADD  CONSTRAINT [DF_Global_ConfiguracionStatusLlamada_Regla]  DEFAULT ((1)) FOR [ReglaID]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] ADD  CONSTRAINT [DF_Global_ConfiguracionStatusLlamada_Fecha_ALta]  DEFAULT (getdate()) FOR [Fecha_ALta]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] ADD  CONSTRAINT [DF_Global_ConfiguracionStatusLlamada_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamadaBase] ADD  CONSTRAINT [DF_Global_ConfiguracionStatusLlamadaBase_Procede]  DEFAULT ((1)) FOR [Procede]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamadaBase] ADD  CONSTRAINT [DF_Global_ConfiguracionStatusLlamadaBase_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamadaBase] ADD  CONSTRAINT [DF_Global_ConfiguracionStatusLlamadaBase_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Global_JornadaLaboral] ADD  CONSTRAINT [DF_Jornada_Laboral_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Global_JornadaLaboral] ADD  CONSTRAINT [DF_Jornada_Laboral_FechaModif]  DEFAULT (getdate()) FOR [FechaModif]
GO
ALTER TABLE [dbo].[Global_JornadaLaboral] ADD  CONSTRAINT [DF_Jornada_Laboral_estatus]  DEFAULT ((1)) FOR [estatus]
GO
ALTER TABLE [dbo].[Global_LlamadaStatus] ADD  CONSTRAINT [DF_Global_LlamadaStatus_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_LlamadaStatus] ADD  CONSTRAINT [DF_Global_LlamadaStatus_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Global_LlamadaStatusNivel4] ADD  CONSTRAINT [DF_Global_LlamadaStatusNivel4_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_LlamadaStatusNivel4] ADD  CONSTRAINT [DF_Global_LlamadaStatusNivel4_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Global_LlamadaSubestatus] ADD  CONSTRAINT [DF_Global_LlamadaSubestatus_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_LlamadaSubestatus] ADD  CONSTRAINT [DF_Global_LlamadaSubestatus_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Global_LlamadaTipificacion] ADD  CONSTRAINT [DF_Global_LlamadaTipificacion_Fecha_ALta]  DEFAULT (getdate()) FOR [Fecha_ALta]
GO
ALTER TABLE [dbo].[Global_LlamadaTipificacion] ADD  CONSTRAINT [DF_Global_LlamadaTipificacion_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Global_Mensaje] ADD  CONSTRAINT [DF_Global_Mensaje_Fecha_ALta]  DEFAULT (getdate()) FOR [Fecha_ALta]
GO
ALTER TABLE [dbo].[Global_Mensaje] ADD  CONSTRAINT [DF_Global_Mensaje_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_Visible]  DEFAULT ((1)) FOR [Visible]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Gloal_ProcesoSiguiente_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Gloal_ProcesoSiguiente_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaAlmacen]  DEFAULT ((0)) FOR [BanderaAlmacen]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaBandejaValidador]  DEFAULT ((0)) FOR [BanderaBandejaValidador]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaTableroResultados]  DEFAULT ((0)) FOR [BanderaTableroResultados]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaAgendados]  DEFAULT ((0)) FOR [BanderaAgendados]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaEstatusLlamada]  DEFAULT ((0)) FOR [BanderaEstatusLlamada]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaBandejaErrores]  DEFAULT ((0)) FOR [BanderaBandejaErrores]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaImpresion]  DEFAULT ((0)) FOR [BanderaImpresion]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaBandejaVentas]  DEFAULT ((0)) FOR [BanderaBandejaVentas]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaAlmacenOfertar]  DEFAULT ((0)) FOR [BanderaAlmacenOfertar]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaAlmacenLiberarOferta]  DEFAULT ((0)) FOR [BanderaAlmacenLiberarOferta]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaBotonGuardar]  DEFAULT ((0)) FOR [BanderaBotonGuardar]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaPredictivo]  DEFAULT ((0)) FOR [BanderaPredictivo]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaFolio]  DEFAULT ((0)) FOR [BanderaFolio]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaControlMarcacion]  DEFAULT ((0)) FOR [BanderaControlMarcacion]
GO
ALTER TABLE [dbo].[Global_ModuloSiguiente] ADD  CONSTRAINT [DF_Global_ModuloSiguiente_BanderaRespaldo]  DEFAULT ((0)) FOR [BanderaRespaldo]
GO
ALTER TABLE [dbo].[Global_Perfiles] ADD  CONSTRAINT [DF_Perfiles_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Global_Perfiles] ADD  CONSTRAINT [DF_Perfiles_estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_Personal] ADD  CONSTRAINT [DF_Global_Personal_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Global_Personal] ADD  CONSTRAINT [DF_Personal_estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_Proyecto] ADD  CONSTRAINT [DF_Global_Proyecto_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_Proyecto] ADD  CONSTRAINT [DF_Global_Proyecto_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Global_ReglasStatus] ADD  CONSTRAINT [DF_Global_ReglasStatus_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_ReglasStatus] ADD  CONSTRAINT [DF_Global_ReglasStatus_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Global_RolesPersonal] ADD  CONSTRAINT [DF_Roles_personal_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Global_RolesPersonal] ADD  CONSTRAINT [DF_Roles_personal_estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_SeccionesCampana] ADD  CONSTRAINT [DF_Global_SeccionesCampana_OcultaSeccionActiva]  DEFAULT ((0)) FOR [OcultaSeccionActiva]
GO
ALTER TABLE [dbo].[Global_SeccionesDatos] ADD  CONSTRAINT [DF_Global_SeccionesDatos_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_SeccionesDatos] ADD  CONSTRAINT [DF_Global_SeccionesDatos_Fecha_Baja]  DEFAULT (getdate()) FOR [Fecha_Baja]
GO
ALTER TABLE [dbo].[Global_SubBloqueDatos] ADD  CONSTRAINT [DF_Global_SubBloqueDatos_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_SubBloqueDatos] ADD  CONSTRAINT [DF_Global_SubBloqueDatos_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_TablasCampana] ADD  CONSTRAINT [DF_Global_TablasCampana_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Global_TablasCampana] ADD  CONSTRAINT [DF_Global_TablasCampana_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[Global_TipoCampana] ADD  CONSTRAINT [DF_Global_TipoCampana_Fecha_Alta]  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[Global_TipoCampana] ADD  CONSTRAINT [DF_Global_TipoCampana_Estatus]  DEFAULT ((1)) FOR [Estatus]
GO
ALTER TABLE [dbo].[HistorialAgendados_YO_SOY_TELCEL] ADD  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[HistorialAgendados_YO_SOY_TELCEL] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Nivel_Catalogos] ADD  CONSTRAINT [DF_NivelCatalogos_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Nivel_Catalogos] ADD  CONSTRAINT [DF_NivelCatalogos_FechaMod]  DEFAULT (getdate()) FOR [FechaMod]
GO
ALTER TABLE [dbo].[Nivel_Catalogos] ADD  CONSTRAINT [DF_Nivel_Catalogos_estatus]  DEFAULT ((1)) FOR [estatus]
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL] ADD  DEFAULT ((0)) FOR [BandejaOcupado]
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL] ADD  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL] ADD  DEFAULT ((0)) FOR [BandejaOcupado]
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL] ADD  DEFAULT (getdate()) FOR [Fecha_Alta]
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Agendados_YO_SOY_TELCEL]  WITH CHECK ADD  CONSTRAINT [FK__Agendados__DatoI__4DD47EBD] FOREIGN KEY([DatoID])
REFERENCES [dbo].[DatoContacto_YO_SOY_TELCEL] ([DatoID])
GO
ALTER TABLE [dbo].[Agendados_YO_SOY_TELCEL] CHECK CONSTRAINT [FK__Agendados__DatoI__4DD47EBD]
GO
ALTER TABLE [dbo].[Agendados_YO_SOY_TELCEL]  WITH CHECK ADD  CONSTRAINT [FK__Agendados_YO_SOY__4CE05A84] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Agendados_YO_SOY_TELCEL] CHECK CONSTRAINT [FK__Agendados_YO_SOY__4CE05A84]
GO
ALTER TABLE [dbo].[Alm_Color]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Color_Alm_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Alm_Material] ([MaterialID])
GO
ALTER TABLE [dbo].[Alm_Color] CHECK CONSTRAINT [FK_Alm_Color_Alm_Material]
GO
ALTER TABLE [dbo].[Alm_Marca]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Marca_Alm_Almacenes] FOREIGN KEY([AlmacenID])
REFERENCES [dbo].[Alm_Almacenes] ([AlmacenID])
GO
ALTER TABLE [dbo].[Alm_Marca] CHECK CONSTRAINT [FK_Alm_Marca_Alm_Almacenes]
GO
ALTER TABLE [dbo].[Alm_Marca]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Marca_Alm_Almacenes1] FOREIGN KEY([AlmacenID])
REFERENCES [dbo].[Alm_Almacenes] ([AlmacenID])
GO
ALTER TABLE [dbo].[Alm_Marca] CHECK CONSTRAINT [FK_Alm_Marca_Alm_Almacenes1]
GO
ALTER TABLE [dbo].[Alm_Material]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Material_Alm_Almacenes] FOREIGN KEY([AlmacenID])
REFERENCES [dbo].[Alm_Almacenes] ([AlmacenID])
GO
ALTER TABLE [dbo].[Alm_Material] CHECK CONSTRAINT [FK_Alm_Material_Alm_Almacenes]
GO
ALTER TABLE [dbo].[Alm_Material]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Material_Alm_Marca] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Alm_Marca] ([MarcaID])
GO
ALTER TABLE [dbo].[Alm_Material] CHECK CONSTRAINT [FK_Alm_Material_Alm_Marca]
GO
ALTER TABLE [dbo].[Alm_Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Modelo_Alm_Almacenes] FOREIGN KEY([AlmacenID])
REFERENCES [dbo].[Alm_Almacenes] ([AlmacenID])
GO
ALTER TABLE [dbo].[Alm_Modelo] CHECK CONSTRAINT [FK_Alm_Modelo_Alm_Almacenes]
GO
ALTER TABLE [dbo].[Alm_Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Modelo_Alm_Marca] FOREIGN KEY([MarcaID])
REFERENCES [dbo].[Alm_Marca] ([MarcaID])
GO
ALTER TABLE [dbo].[Alm_Modelo] CHECK CONSTRAINT [FK_Alm_Modelo_Alm_Marca]
GO
ALTER TABLE [dbo].[Alm_Precio_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Precio_Producto_Alm_Producto] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Alm_Producto] ([ProductoID])
GO
ALTER TABLE [dbo].[Alm_Precio_Producto] CHECK CONSTRAINT [FK_Alm_Precio_Producto_Alm_Producto]
GO
ALTER TABLE [dbo].[Alm_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Producto_Alm_Almacenes] FOREIGN KEY([AlmacenID])
REFERENCES [dbo].[Alm_Almacenes] ([AlmacenID])
GO
ALTER TABLE [dbo].[Alm_Producto] CHECK CONSTRAINT [FK_Alm_Producto_Alm_Almacenes]
GO
ALTER TABLE [dbo].[Alm_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Producto_Alm_Color] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Alm_Color] ([ColorID])
GO
ALTER TABLE [dbo].[Alm_Producto] CHECK CONSTRAINT [FK_Alm_Producto_Alm_Color]
GO
ALTER TABLE [dbo].[Alm_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Producto_Alm_Gama_Producto] FOREIGN KEY([GamaProductoID])
REFERENCES [dbo].[Alm_Gama_Producto] ([GamaProductoID])
GO
ALTER TABLE [dbo].[Alm_Producto] CHECK CONSTRAINT [FK_Alm_Producto_Alm_Gama_Producto]
GO
ALTER TABLE [dbo].[Alm_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Producto_Alm_Marca] FOREIGN KEY([MarcaID])
REFERENCES [dbo].[Alm_Marca] ([MarcaID])
GO
ALTER TABLE [dbo].[Alm_Producto] CHECK CONSTRAINT [FK_Alm_Producto_Alm_Marca]
GO
ALTER TABLE [dbo].[Alm_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Producto_Alm_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Alm_Material] ([MaterialID])
GO
ALTER TABLE [dbo].[Alm_Producto] CHECK CONSTRAINT [FK_Alm_Producto_Alm_Material]
GO
ALTER TABLE [dbo].[Alm_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Producto_Alm_Modelo] FOREIGN KEY([ModeloID])
REFERENCES [dbo].[Alm_Modelo] ([ModeloID])
GO
ALTER TABLE [dbo].[Alm_Producto] CHECK CONSTRAINT [FK_Alm_Producto_Alm_Modelo]
GO
ALTER TABLE [dbo].[Alm_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Producto_Alm_Proveedor] FOREIGN KEY([ProveedorID])
REFERENCES [dbo].[Alm_Proveedor] ([ProveedorID])
GO
ALTER TABLE [dbo].[Alm_Producto] CHECK CONSTRAINT [FK_Alm_Producto_Alm_Proveedor]
GO
ALTER TABLE [dbo].[Alm_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Producto_Alm_Tipo_producto] FOREIGN KEY([TipoProductoID])
REFERENCES [dbo].[Alm_Tipo_producto] ([TipoProductoID])
GO
ALTER TABLE [dbo].[Alm_Producto] CHECK CONSTRAINT [FK_Alm_Producto_Alm_Tipo_producto]
GO
ALTER TABLE [dbo].[Alm_Subalmacen]  WITH CHECK ADD  CONSTRAINT [FK_Alm_Subalmacen_Alm_Almacenes] FOREIGN KEY([AlmacenID])
REFERENCES [dbo].[Alm_Almacenes] ([AlmacenID])
GO
ALTER TABLE [dbo].[Alm_Subalmacen] CHECK CONSTRAINT [FK_Alm_Subalmacen_Alm_Almacenes]
GO
ALTER TABLE [dbo].[Catalogo_CalendarioMensajeria]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_CalendarioMensajeria_CatalogoItem] FOREIGN KEY([ProvedorMensajeriaID], [CatalogoID_P])
REFERENCES [dbo].[CatalogoItem] ([CatalogoItemID], [CatalogoID])
GO
ALTER TABLE [dbo].[Catalogo_CalendarioMensajeria] CHECK CONSTRAINT [FK_Catalogo_CalendarioMensajeria_CatalogoItem]
GO
ALTER TABLE [dbo].[Catalogo_CoberturaMensajeria]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_CoberturaMensajeria_CatalogoItem] FOREIGN KEY([ProvedorMensajeriaID], [CatalogoID_P])
REFERENCES [dbo].[CatalogoItem] ([CatalogoItemID], [CatalogoID])
GO
ALTER TABLE [dbo].[Catalogo_CoberturaMensajeria] CHECK CONSTRAINT [FK_Catalogo_CoberturaMensajeria_CatalogoItem]
GO
ALTER TABLE [dbo].[Catalogo_CoberturaMensajeria]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_CoberturaMensajeria_CatalogoItem1] FOREIGN KEY([EstadoID], [CatalogoID_E])
REFERENCES [dbo].[CatalogoItem] ([CatalogoItemID], [CatalogoID])
GO
ALTER TABLE [dbo].[Catalogo_CoberturaMensajeria] CHECK CONSTRAINT [FK_Catalogo_CoberturaMensajeria_CatalogoItem1]
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_CombinacionStatus_Catalogo_Proceso] FOREIGN KEY([ProcesoID])
REFERENCES [dbo].[Catalogo_Proceso] ([ProcesoID])
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus] CHECK CONSTRAINT [FK_Catalogo_CombinacionStatus_Catalogo_Proceso]
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus]  WITH CHECK ADD  CONSTRAINT [FK_Global_CombinacionStatus_Catalogo_Modulo] FOREIGN KEY([ModuloID])
REFERENCES [dbo].[Catalogo_Modulo] ([ModuloID])
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus] CHECK CONSTRAINT [FK_Global_CombinacionStatus_Catalogo_Modulo]
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus]  WITH CHECK ADD  CONSTRAINT [FK_Global_CombinacionStatus_Catalogo_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Catalogo_Status] ([StatusID])
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus] CHECK CONSTRAINT [FK_Global_CombinacionStatus_Catalogo_Status]
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus]  WITH CHECK ADD  CONSTRAINT [FK_Global_CombinacionStatus_Catalogo_Subestatus] FOREIGN KEY([SubestatusID])
REFERENCES [dbo].[Catalogo_Subestatus] ([SubestatusID])
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus] CHECK CONSTRAINT [FK_Global_CombinacionStatus_Catalogo_Subestatus]
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus]  WITH CHECK ADD  CONSTRAINT [FK_Global_CombinacionStatus_Catalogo_Tipificacion] FOREIGN KEY([TipificacionID])
REFERENCES [dbo].[Catalogo_Tipificacion] ([TipificacionID])
GO
ALTER TABLE [dbo].[Catalogo_CombinacionStatus] CHECK CONSTRAINT [FK_Global_CombinacionStatus_Catalogo_Tipificacion]
GO
ALTER TABLE [dbo].[Catalogo_historial]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_historial_CatalogoItem] FOREIGN KEY([CatalogoItemID], [CatalogoID])
REFERENCES [dbo].[CatalogoItem] ([CatalogoItemID], [CatalogoID])
GO
ALTER TABLE [dbo].[Catalogo_historial] CHECK CONSTRAINT [FK_Catalogo_historial_CatalogoItem]
GO
ALTER TABLE [dbo].[CatalogoItem]  WITH CHECK ADD  CONSTRAINT [FK_CatalogoItem_Catalogos1] FOREIGN KEY([CatalogoID])
REFERENCES [dbo].[Familia_Catalogos] ([CatalogoID])
GO
ALTER TABLE [dbo].[CatalogoItem] CHECK CONSTRAINT [FK_CatalogoItem_Catalogos1]
GO
ALTER TABLE [dbo].[DatoContacto_YO_SOY_TELCEL]  WITH CHECK ADD  CONSTRAINT [FK__DatoContacto_YO___23DE44F1] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[DatoContacto_YO_SOY_TELCEL] CHECK CONSTRAINT [FK__DatoContacto_YO___23DE44F1]
GO
ALTER TABLE [dbo].[Errores_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([HistorialDCID])
REFERENCES [dbo].[TransaccionHistorialDC_YO_SOY_TELCEL] ([HistorialDCID])
GO
ALTER TABLE [dbo].[Familia_Catalogos]  WITH CHECK ADD  CONSTRAINT [FK_Catalogos_TipoCatalogos1] FOREIGN KEY([TipoCatalogoID])
REFERENCES [dbo].[Nivel_Catalogos] ([TipoCatalogoID])
GO
ALTER TABLE [dbo].[Familia_Catalogos] CHECK CONSTRAINT [FK_Catalogos_TipoCatalogos1]
GO
ALTER TABLE [dbo].[Familia_Catalogos]  WITH CHECK ADD  CONSTRAINT [FK_Familia_Catalogos_Global_Compania] FOREIGN KEY([CompaniaID])
REFERENCES [dbo].[Global_Compania] ([CompaniaID])
GO
ALTER TABLE [dbo].[Familia_Catalogos] CHECK CONSTRAINT [FK_Familia_Catalogos_Global_Compania]
GO
ALTER TABLE [dbo].[Global_BDFiltros]  WITH CHECK ADD  CONSTRAINT [FK_Global_BDFiltros_Catalogo_Db_Historial1] FOREIGN KEY([DBHistorialID])
REFERENCES [dbo].[Catalogo_Db_Historial] ([DBHistorialID])
GO
ALTER TABLE [dbo].[Global_BDFiltros] CHECK CONSTRAINT [FK_Global_BDFiltros_Catalogo_Db_Historial1]
GO
ALTER TABLE [dbo].[Global_BDFiltros]  WITH CHECK ADD  CONSTRAINT [FK_Global_BDFiltros_Global_Campana] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_BDFiltros] CHECK CONSTRAINT [FK_Global_BDFiltros_Global_Campana]
GO
ALTER TABLE [dbo].[Global_BDFiltros]  WITH CHECK ADD  CONSTRAINT [FK_Global_BDFiltros_Global_FiltrosBD1] FOREIGN KEY([FiltroID])
REFERENCES [dbo].[Global_FiltrosBD] ([FiltroID])
GO
ALTER TABLE [dbo].[Global_BDFiltros] CHECK CONSTRAINT [FK_Global_BDFiltros_Global_FiltrosBD1]
GO
ALTER TABLE [dbo].[Global_BloqueDatos]  WITH CHECK ADD  CONSTRAINT [FK_Global_BloqueDatos_Global_Proyecto1] FOREIGN KEY([ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Proyecto] ([ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_BloqueDatos] CHECK CONSTRAINT [FK_Global_BloqueDatos_Global_Proyecto1]
GO
ALTER TABLE [dbo].[Global_BloqueDatosCampana]  WITH CHECK ADD  CONSTRAINT [FK_Global_BloqueDatosCampana_Catalogo_Modulo] FOREIGN KEY([ModuloID])
REFERENCES [dbo].[Catalogo_Modulo] ([ModuloID])
GO
ALTER TABLE [dbo].[Global_BloqueDatosCampana] CHECK CONSTRAINT [FK_Global_BloqueDatosCampana_Catalogo_Modulo]
GO
ALTER TABLE [dbo].[Global_BloqueDatosCampana]  WITH CHECK ADD  CONSTRAINT [FK_Global_BloqueDatosCampana_Global_BloqueDatos] FOREIGN KEY([BloqueDatosID])
REFERENCES [dbo].[Global_BloqueDatos] ([BloqueDatosID])
GO
ALTER TABLE [dbo].[Global_BloqueDatosCampana] CHECK CONSTRAINT [FK_Global_BloqueDatosCampana_Global_BloqueDatos]
GO
ALTER TABLE [dbo].[Global_BloqueDatosCampana]  WITH CHECK ADD  CONSTRAINT [FK_Global_BloqueDatosCampana_Global_Campana] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_BloqueDatosCampana] CHECK CONSTRAINT [FK_Global_BloqueDatosCampana_Global_Campana]
GO
ALTER TABLE [dbo].[Global_Campana]  WITH CHECK ADD  CONSTRAINT [FK_Global_Campana_Global_Proyecto] FOREIGN KEY([ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Proyecto] ([ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_Campana] CHECK CONSTRAINT [FK_Global_Campana_Global_Proyecto]
GO
ALTER TABLE [dbo].[Global_Campana]  WITH CHECK ADD  CONSTRAINT [FK_Global_Campana_Global_TipoCampana] FOREIGN KEY([TipoCampanaID])
REFERENCES [dbo].[Global_TipoCampana] ([TipoCampanaID])
GO
ALTER TABLE [dbo].[Global_Campana] CHECK CONSTRAINT [FK_Global_Campana_Global_TipoCampana]
GO
ALTER TABLE [dbo].[Global_CampanaDato]  WITH CHECK ADD  CONSTRAINT [FK_Global_CampanaDato_Global_Campana1] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_CampanaDato] CHECK CONSTRAINT [FK_Global_CampanaDato_Global_Campana1]
GO
ALTER TABLE [dbo].[Global_CampanaDato]  WITH CHECK ADD  CONSTRAINT [FK_Global_CampanaDato_Global_CatalogoDatos1] FOREIGN KEY([DatoID], [BloqueDatosID])
REFERENCES [dbo].[Global_CatalogoDatos] ([DatoID], [BloqueDatosID])
GO
ALTER TABLE [dbo].[Global_CampanaDato] CHECK CONSTRAINT [FK_Global_CampanaDato_Global_CatalogoDatos1]
GO
ALTER TABLE [dbo].[Global_CampanaOpcionCarga]  WITH CHECK ADD  CONSTRAINT [FK_Global_CampanaOpcionCarga_Global_Campana] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_CampanaOpcionCarga] CHECK CONSTRAINT [FK_Global_CampanaOpcionCarga_Global_Campana]
GO
ALTER TABLE [dbo].[Global_CampanaOpcionCarga]  WITH CHECK ADD  CONSTRAINT [FK_Global_CampanaOpcionCarga_Global_CatalogoOpcionesCargar] FOREIGN KEY([OpcionCargaID])
REFERENCES [dbo].[Global_CatalogoOpcionesCargar] ([OpcionCargaID])
GO
ALTER TABLE [dbo].[Global_CampanaOpcionCarga] CHECK CONSTRAINT [FK_Global_CampanaOpcionCarga_Global_CatalogoOpcionesCargar]
GO
ALTER TABLE [dbo].[Global_CatalogoDatos]  WITH CHECK ADD  CONSTRAINT [FK_Global_CatalogoDatos_Global_BloqueDatos] FOREIGN KEY([BloqueDatosID])
REFERENCES [dbo].[Global_BloqueDatos] ([BloqueDatosID])
GO
ALTER TABLE [dbo].[Global_CatalogoDatos] CHECK CONSTRAINT [FK_Global_CatalogoDatos_Global_BloqueDatos]
GO
ALTER TABLE [dbo].[Global_CatalogoDatosEncuesta]  WITH CHECK ADD  CONSTRAINT [FK_Global_CatalogoDatosEncuesta_Global_BloqueDatos] FOREIGN KEY([BloqueDatosID])
REFERENCES [dbo].[Global_BloqueDatos] ([BloqueDatosID])
GO
ALTER TABLE [dbo].[Global_CatalogoDatosEncuesta] CHECK CONSTRAINT [FK_Global_CatalogoDatosEncuesta_Global_BloqueDatos]
GO
ALTER TABLE [dbo].[Global_CatalogoDatosEncuesta]  WITH CHECK ADD  CONSTRAINT [FK_Global_CatalogoDatosEncuesta_Global_Campana] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_CatalogoDatosEncuesta] CHECK CONSTRAINT [FK_Global_CatalogoDatosEncuesta_Global_Campana]
GO
ALTER TABLE [dbo].[Global_CatalogoSubDatos]  WITH CHECK ADD  CONSTRAINT [FK_Global_CatalogoSubDatos_Global_SubBloqueDatos] FOREIGN KEY([SubBloqueDatosID])
REFERENCES [dbo].[Global_SubBloqueDatos] ([SubBloqueDatosID])
GO
ALTER TABLE [dbo].[Global_CatalogoSubDatos] CHECK CONSTRAINT [FK_Global_CatalogoSubDatos_Global_SubBloqueDatos]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada]  WITH CHECK ADD  CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_Campana] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] CHECK CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_Campana]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada]  WITH CHECK ADD  CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_LlamadaStatus] FOREIGN KEY([LlamadaStatusID])
REFERENCES [dbo].[Global_LlamadaStatus] ([LlamadaStatusID])
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] CHECK CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_LlamadaStatus]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada]  WITH CHECK ADD  CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_LlamadaStatusNivel4] FOREIGN KEY([LlamadaStatus4ID])
REFERENCES [dbo].[Global_LlamadaStatusNivel4] ([LlamadaStatus4ID])
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] CHECK CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_LlamadaStatusNivel4]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada]  WITH CHECK ADD  CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_LlamadaSubestatus] FOREIGN KEY([LlamadaSubestatusID])
REFERENCES [dbo].[Global_LlamadaSubestatus] ([LlamadaSubestatusID])
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] CHECK CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_LlamadaSubestatus]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada]  WITH CHECK ADD  CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_LlamadaTipificacion] FOREIGN KEY([LlamadaTipificacionID])
REFERENCES [dbo].[Global_LlamadaTipificacion] ([LlamadaTipificacionID])
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] CHECK CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_LlamadaTipificacion]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada]  WITH CHECK ADD  CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_ReglasStatus] FOREIGN KEY([ReglaID])
REFERENCES [dbo].[Global_ReglasStatus] ([ReglaID])
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamada] CHECK CONSTRAINT [FK_Global_ConfiguracionStatusLlamada_Global_ReglasStatus]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamadaBase]  WITH CHECK ADD  CONSTRAINT [FK_Global_ConfiguracionStatusLlamadaBase_Catalogo_Db_Historial] FOREIGN KEY([DBHistorialID])
REFERENCES [dbo].[Catalogo_Db_Historial] ([DBHistorialID])
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamadaBase] CHECK CONSTRAINT [FK_Global_ConfiguracionStatusLlamadaBase_Catalogo_Db_Historial]
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamadaBase]  WITH CHECK ADD  CONSTRAINT [FK_Global_ConfiguracionStatusLlamadaBase_Global_Campana] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_ConfiguracionStatusLlamadaBase] CHECK CONSTRAINT [FK_Global_ConfiguracionStatusLlamadaBase_Global_Campana]
GO
ALTER TABLE [dbo].[Global_Mensaje]  WITH CHECK ADD  CONSTRAINT [FK_Global_Mensaje_Global_Campana] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_Mensaje] CHECK CONSTRAINT [FK_Global_Mensaje_Global_Campana]
GO
ALTER TABLE [dbo].[Global_Modulo_Datos]  WITH CHECK ADD  CONSTRAINT [FK_Global_Modulo_Datos_Global_SeccionesDatos] FOREIGN KEY([SeccionesDatosID])
REFERENCES [dbo].[Global_SeccionesDatos] ([SeccionesDatosID])
GO
ALTER TABLE [dbo].[Global_Modulo_Datos] CHECK CONSTRAINT [FK_Global_Modulo_Datos_Global_SeccionesDatos]
GO
ALTER TABLE [dbo].[Global_Modulo_Datos]  WITH CHECK ADD  CONSTRAINT [FK_Global_Proceso_Datos_Catalogo_Modulo] FOREIGN KEY([ModuloID])
REFERENCES [dbo].[Catalogo_Modulo] ([ModuloID])
GO
ALTER TABLE [dbo].[Global_Modulo_Datos] CHECK CONSTRAINT [FK_Global_Proceso_Datos_Catalogo_Modulo]
GO
ALTER TABLE [dbo].[Global_Modulo_Datos]  WITH CHECK ADD  CONSTRAINT [FK_Global_Proceso_Datos_Global_CampanaDato] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID], [BloqueDatosID], [DatoID], [CampanaDatoID])
REFERENCES [dbo].[Global_CampanaDato] ([CampanaID], [ProyectoID], [CompaniaID], [BloqueDatosID], [DatoID], [CampanaDatoID])
GO
ALTER TABLE [dbo].[Global_Modulo_Datos] CHECK CONSTRAINT [FK_Global_Proceso_Datos_Global_CampanaDato]
GO
ALTER TABLE [dbo].[Global_Perfiles]  WITH CHECK ADD  CONSTRAINT [FK_Global_Perfiles_Global_Personal] FOREIGN KEY([Personal])
REFERENCES [dbo].[Global_Personal] ([Personal])
GO
ALTER TABLE [dbo].[Global_Perfiles] CHECK CONSTRAINT [FK_Global_Perfiles_Global_Personal]
GO
ALTER TABLE [dbo].[Global_Personal]  WITH CHECK ADD  CONSTRAINT [FK_Global_Personal_Global_RolesPersonal] FOREIGN KEY([RolID])
REFERENCES [dbo].[Global_RolesPersonal] ([RolID])
GO
ALTER TABLE [dbo].[Global_Personal] CHECK CONSTRAINT [FK_Global_Personal_Global_RolesPersonal]
GO
ALTER TABLE [dbo].[Global_Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Global_Proyecto_Global_Compania] FOREIGN KEY([CompaniaID])
REFERENCES [dbo].[Global_Compania] ([CompaniaID])
GO
ALTER TABLE [dbo].[Global_Proyecto] CHECK CONSTRAINT [FK_Global_Proyecto_Global_Compania]
GO
ALTER TABLE [dbo].[Global_SeccionesCampana]  WITH CHECK ADD  CONSTRAINT [FK_Global_SeccionesCampana_Global_SeccionesDatos] FOREIGN KEY([SeccionesDatosID])
REFERENCES [dbo].[Global_SeccionesDatos] ([SeccionesDatosID])
GO
ALTER TABLE [dbo].[Global_SeccionesCampana] CHECK CONSTRAINT [FK_Global_SeccionesCampana_Global_SeccionesDatos]
GO
ALTER TABLE [dbo].[Global_SeccionesDatos]  WITH CHECK ADD  CONSTRAINT [FK_Global_SeccionesDatos_Global_BloqueDatos] FOREIGN KEY([BloqueDatosID])
REFERENCES [dbo].[Global_BloqueDatos] ([BloqueDatosID])
GO
ALTER TABLE [dbo].[Global_SeccionesDatos] CHECK CONSTRAINT [FK_Global_SeccionesDatos_Global_BloqueDatos]
GO
ALTER TABLE [dbo].[Global_SubBloqueDatos]  WITH CHECK ADD  CONSTRAINT [FK_Global_SubBloqueDatos_Global_Proyecto] FOREIGN KEY([ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Proyecto] ([ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_SubBloqueDatos] CHECK CONSTRAINT [FK_Global_SubBloqueDatos_Global_Proyecto]
GO
ALTER TABLE [dbo].[Global_TablasCampana]  WITH CHECK ADD  CONSTRAINT [FK_Global_TablasCampana_Global_Campana] FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Global_TablasCampana] CHECK CONSTRAINT [FK_Global_TablasCampana_Global_Campana]
GO
ALTER TABLE [dbo].[HistorialAgendados_YO_SOY_TELCEL]  WITH CHECK ADD  CONSTRAINT [FK__Historial__Agend__529933DA] FOREIGN KEY([Agendado])
REFERENCES [dbo].[Agendados_YO_SOY_TELCEL] ([Agendado])
GO
ALTER TABLE [dbo].[HistorialAgendados_YO_SOY_TELCEL] CHECK CONSTRAINT [FK__Historial__Agend__529933DA]
GO
ALTER TABLE [dbo].[HistorialAgendados_YO_SOY_TELCEL]  WITH CHECK ADD  CONSTRAINT [FK__Historial__DatoI__54817C4C] FOREIGN KEY([DatoID])
REFERENCES [dbo].[DatoContacto_YO_SOY_TELCEL] ([DatoID])
GO
ALTER TABLE [dbo].[HistorialAgendados_YO_SOY_TELCEL] CHECK CONSTRAINT [FK__Historial__DatoI__54817C4C]
GO
ALTER TABLE [dbo].[HistorialAgendados_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[Profeco_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[TransaccionDatosCliente_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([TransaccionID])
REFERENCES [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL] ([TransaccionID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([LlamadaStatusID])
REFERENCES [dbo].[Global_LlamadaStatus] ([LlamadaStatusID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([LlamadaSubestatusID])
REFERENCES [dbo].[Global_LlamadaSubestatus] ([LlamadaSubestatusID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([LlamadaTipificacionID])
REFERENCES [dbo].[Global_LlamadaTipificacion] ([LlamadaTipificacionID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([LlamadaStatus4ID])
REFERENCES [dbo].[Global_LlamadaStatusNivel4] ([LlamadaStatus4ID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[Catalogo_Status] ([StatusID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([Status4ID])
REFERENCES [dbo].[Catalogo_StatusNivel4] ([Statusnivel4ID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([SubestatusID])
REFERENCES [dbo].[Catalogo_Subestatus] ([SubestatusID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([TipificacionID])
REFERENCES [dbo].[Catalogo_Tipificacion] ([TipificacionID])
GO
ALTER TABLE [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDC_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([TransaccionHDVID])
REFERENCES [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL] ([TransaccionHDVID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([LlamadaStatusID])
REFERENCES [dbo].[Global_LlamadaStatus] ([LlamadaStatusID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([LlamadaSubestatusID])
REFERENCES [dbo].[Global_LlamadaSubestatus] ([LlamadaSubestatusID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([LlamadaTipificacionID])
REFERENCES [dbo].[Global_LlamadaTipificacion] ([LlamadaTipificacionID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([LlamadaStatus4ID])
REFERENCES [dbo].[Global_LlamadaStatusNivel4] ([LlamadaStatus4ID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[Catalogo_Status] ([StatusID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([Status4ID])
REFERENCES [dbo].[Catalogo_StatusNivel4] ([Statusnivel4ID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([SubestatusID])
REFERENCES [dbo].[Catalogo_Subestatus] ([SubestatusID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([TipificacionID])
REFERENCES [dbo].[Catalogo_Tipificacion] ([TipificacionID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([TransaccionID])
REFERENCES [dbo].[TransaccionDatosVenta_YO_SOY_TELCEL] ([TransaccionID])
GO
ALTER TABLE [dbo].[TransaccionHistorialDV_YO_SOY_TELCEL]  WITH CHECK ADD FOREIGN KEY([CampanaID], [ProyectoID], [CompaniaID])
REFERENCES [dbo].[Global_Campana] ([CampanaID], [ProyectoID], [CompaniaID])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Amacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Almacenes', @level2type=N'COLUMN',@level2name=N'AlmacenID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Almacenes', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Almacenes', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de disponibilidad para ese almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Almacenes', @level2type=N'COLUMN',@level2name=N'Stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha y hora de alta del almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Almacenes', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificación del almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Almacenes', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus en el que se encuentra el almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Almacenes', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Color', @level2type=N'COLUMN',@level2name=N'ColorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Color', @level2type=N'COLUMN',@level2name=N'MaterialID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Color', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Color', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de alta del color al almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Color', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificación del color ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Color', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus de actividad del color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Color', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la gama' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Gama_Producto', @level2type=N'COLUMN',@level2name=N'GamaProductoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la gama' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Gama_Producto', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de la gama' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Gama_Producto', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de alta de la gama al almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Gama_Producto', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de la ultima modificación de la gama en el almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Gama_Producto', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus de actividad de la gama' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Gama_Producto', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Marca', @level2type=N'COLUMN',@level2name=N'MarcaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del almacén al cual corresponde la marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Marca', @level2type=N'COLUMN',@level2name=N'AlmacenID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Marca', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de la marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Marca', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ingreso de la marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Marca', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FEcha de ultima modificación de la marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Marca', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus de la marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Marca', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Material', @level2type=N'COLUMN',@level2name=N'MaterialID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del modelo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Material', @level2type=N'COLUMN',@level2name=N'ModeloID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Material', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Material', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de alta del material al almcén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Material', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificación del material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Material', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus del material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Material', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del modelo del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Modelo', @level2type=N'COLUMN',@level2name=N'ModeloID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la marca del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Modelo', @level2type=N'COLUMN',@level2name=N'MarcaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del modelo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Modelo', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del modelo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Modelo', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de alta del modelo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Modelo', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificación del modelo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Modelo', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus de modelo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Modelo', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del precio de producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Precio_Producto', @level2type=N'COLUMN',@level2name=N'PrecioProductoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del prodcuto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Precio_Producto', @level2type=N'COLUMN',@level2name=N'ProductoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio a publico del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Precio_Producto', @level2type=N'COLUMN',@level2name=N'PrecioPublico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio proporcionado por el proveedor ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Precio_Producto', @level2type=N'COLUMN',@level2name=N'PrecioProveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio determinado por el proveedor por productos en Mayoreo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Precio_Producto', @level2type=N'COLUMN',@level2name=N'PrecioMayoreo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de alta del precio del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Precio_Producto', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificación del precio del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Precio_Producto', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus de actividad del precio del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Precio_Producto', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'ProductoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Almacén al que corresponde' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'AlmacenID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la marca del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'MarcaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del modelo del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'ModeloID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del material del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'MaterialID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del color del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'ColorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del tipo de producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'TipoProductoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'ProveedorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la gama del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'GamaProductoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción detalle del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Volumen del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'Volumen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'Peso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unidade de entrada del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'UnidadEntrada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unidad de salida del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'UnidadSalida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica cual es la cantidad de el número de unidades de salida por el entrada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'FactorUnidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador de cantidad maxima de productos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'StockMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Disponibilidad minima que podria existir de este producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'StockMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Disponibilidad global de este producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'StockReal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bandera para identificar si el producto sigue activo y esta marcado como descontinuado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'Descontinuidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de ordenes de compra por efectuar de este producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'OrdenComPendiente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de unidades vendidas de este producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'UnidadesVendidas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de ventas globales efectuadas para este producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'VentasGlobal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus de actividad del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Producto', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'ProveedorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del provvedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dirección del proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'Direccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Teléfono de oficina del proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'TelOficina'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefono celular del proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'TelCelular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RFC Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'RFC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de alta del proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificación del proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus de actividad del proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Proveedor', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del subalmacen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Subalmacen', @level2type=N'COLUMN',@level2name=N'SubAlmacenID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Subalmacen', @level2type=N'COLUMN',@level2name=N'AlmacenID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del sub almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Subalmacen', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del sub almacen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Subalmacen', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Alta del sub almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Subalmacen', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de la ultima modificación de dicho sub almacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Subalmacen', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de sub almacén Entrada/Salida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Subalmacen', @level2type=N'COLUMN',@level2name=N'Tipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus en el que se encuentra el subalmacén' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Subalmacen', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Tipo de procto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Tipo_producto', @level2type=N'COLUMN',@level2name=N'TipoProductoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del tipo de Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Tipo_producto', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion del tipo de servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Tipo_producto', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de alta del tipo de producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Tipo_producto', @level2type=N'COLUMN',@level2name=N'FechaAlta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de la ultima modificación que sufrio el producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Tipo_producto', @level2type=N'COLUMN',@level2name=N'FechaUltModificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actividad del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alm_Tipo_producto', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifica de que Área se trata la venta, POSPAGO, PREPAGO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventarioTransacciones', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Campaña' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventarioTransacciones', @level2type=N'COLUMN',@level2name=N'CampanaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id de la Transacción que almacena la venta de esta Campaña' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventarioTransacciones', @level2type=N'COLUMN',@level2name=N'TransaccionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID del Articulo el cual se esta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventarioTransacciones', @level2type=N'COLUMN',@level2name=N'ArticuloID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del plan con el cual esta asiciado esta venta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventarioTransacciones', @level2type=N'COLUMN',@level2name=N'PlanID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de asesor que realizo esta asignación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventarioTransacciones', @level2type=N'COLUMN',@level2name=N'Responsable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha y hora en que se efectuo esta captura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventarioTransacciones', @level2type=N'COLUMN',@level2name=N'Capturado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus en ek que se encuentra la relación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventarioTransacciones', @level2type=N'COLUMN',@level2name=N'Estatus'
GO
