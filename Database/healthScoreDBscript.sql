CREATE DATABASE [HealthScorePredictor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HealthScorePredictor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HealthScorePredictor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HealthScorePredictor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HealthScorePredictor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HealthScorePredictor] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HealthScorePredictor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HealthScorePredictor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET ARITHABORT OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HealthScorePredictor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HealthScorePredictor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HealthScorePredictor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HealthScorePredictor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HealthScorePredictor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HealthScorePredictor] SET  MULTI_USER 
GO
ALTER DATABASE [HealthScorePredictor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HealthScorePredictor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HealthScorePredictor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HealthScorePredictor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HealthScorePredictor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HealthScorePredictor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HealthScorePredictor] SET QUERY_STORE = OFF
GO
USE [HealthScorePredictor]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Age] [int] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnoses]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnoses](
	[CustomerId] [int] NOT NULL,
	[Pulse] [real] NOT NULL,
	[HBP] [real] NOT NULL,
	[LBP] [real] NOT NULL,
	[Hemoglobin] [real] NOT NULL,
	[HBA1C_FBS] [real] NOT NULL,
	[Cholesterol] [real] NOT NULL,
	[Creatinine] [real] NOT NULL,
	[SGPT] [real] NOT NULL,
	[ECG_TMT] [nvarchar](max) NOT NULL,
	[MER] [nvarchar](max) NOT NULL,
	[BMI] [real] NOT NULL,
	[ESR] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disease]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disease](
	[CustomerId] [int] NOT NULL,
	[Diabetic] [nvarchar](100) NULL,
	[Obes] [nvarchar](100) NULL,
	[Kidney] [nvarchar](100) NULL,
	[Anaemia] [nvarchar](100) NULL,
	[Cardiac] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthScore]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthScore](
	[CId] [int] NULL,
	[HealthNo] [int] IDENTITY(1,1) NOT NULL,
	[Count] [int] NULL,
	[WellnessScore] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Diagnoses]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Disease]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[HealthScore]  WITH CHECK ADD FOREIGN KEY([CId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
/****** Object:  StoredProcedure [dbo].[Sp_DiagnosesDiseaseInsert]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[Sp_DiagnosesDiseaseInsert]
	(
   		 @CustomerId  INT,
     	 @Pulse       REAL,
    	 @HBP        REAL,
    	 @LBP        REAL,
   		 @Hemoglobin REAL,
   		 @HBA1C_FBS  REAL,
   		 @Cholesterol REAL,
   		 @Creatinine REAL,
    	 @SGPT       REAL,
   		 @ECG_TMT    NVARCHAR(MAX),
   		 @MER        NVARCHAR(MAX),
   		 @BMI        REAL,
   		 @ESR        REAL,
   		 @Diabetic   NVARCHAR(100),
   		 @Obes       NVARCHAR(100),
   		 @Kidney     NVARCHAR(100),
   		 @Anaemia    NVARCHAR(100),
   		 @Cardiac    NVARCHAR(100)
 
)
AS 
BEGIN 
     SET NOCOUNT ON
     INSERT INTO [Diagnoses]
          (CustomerId,Pulse,HBP,LBP,Hemoglobin,HBA1C_FBS,Cholesterol,Creatinine,SGPT,ECG_TMT,MER,BMI,ESR ) 
     VALUES 
          (@CustomerId,@Pulse, @HBP,@LBP, @Hemoglobin, @HBA1C_FBS,@Cholesterol,@Creatinine, @SGPT, @ECG_TMT, @MER,@BMI,@ESR)

 

        INSERT INTO Disease (CustomerId,Diabetic,Obes,Kidney,Anaemia,Cardiac)
        Values(  @CustomerId,@Diabetic, @Obes, @Kidney,  @Anaemia, @Cardiac) 
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertCustomers]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Sp_InsertCustomers]
(
   	@FirstName	  NVARCHAR(100),
	@LastName	  NVARCHAR(100), 
	@Age		  INT ,
	@Gender       VARCHAR(10) , 
	@Email        nVARCHAR(200),  
	@Password     NVARCHAR(50)
 )

AS 
BEGIN 
     SET NOCOUNT ON 

         INSERT INTO Customers(FirstName, LastName, Age, Gender,Email,[Password]) 
         VALUES  (@FirstName,@LastName,@Age,@Gender,@Email,@Password) 

END 
GO
/****** Object:  StoredProcedure [dbo].[Sp_Report]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Sp_Report]
	(
	   @CustomerId      INT 
	)
	  AS
	  BEGIN
	  SET NOCOUNT ON	
	 --=========================================
	 -- CREATED BY SACHIN VISHWAKARMA
	 --=========================================
	 DECLARE 
	          @Count          INT
			 ,@WellnessScore  INT
			 ,@Age            INT
			 ,@HBA1C_FBS      REAL
			 ,@Pulse          INT
			 ,@HBP            REAL
			 ,@BMI            REAL
			 ,@Creatinine     REAL
			 ,@Cholesterol    REAL
			 ,@Score  INT
			 

			 SET @Age =         (SELECT Age FROM Customers WHERE CustomerId = @CustomerId)
			 SET @HBA1C_FBS =   (SELECT HBA1C_FBS   FROM Diagnoses WHERE CustomerId = @CustomerId)
			 SET @Pulse =       (SELECT Pulse       FROM Diagnoses WHERE CustomerId = @CustomerId)
			 SET @HBP   =       (SELECT HBP         FROM Diagnoses WHERE CustomerId = @CustomerId)
			 SET @BMI   =       (SELECT BMI         FROM Diagnoses WHERE CustomerId = @CustomerId)
			 SET @Creatinine =  (SELECT Creatinine  FROM Diagnoses WHERE CustomerId = @CustomerId)
			 SET @Cholesterol = (SELECT Cholesterol  FROM Diagnoses WHERE CustomerId = @CustomerId)

			 DECLARE @C INT = 0;
			 DECLARE @P INT = 0;

			 IF (@Age >= 35 AND @HBA1C_FBS >= 6.0 AND @Pulse >= 75 AND @HBP >= 130)
			 BEGIN
			 SET @C = 1
			 SET @P = 7
			 END

			 IF (@Age >= 30 AND @BMI >= 30)
			 BEGIN
			 SET @C = 2
			 SET @P = 5
			 END

			 IF (@Creatinine >= 0.6 AND @Creatinine <= 1.3)
			 BEGIN
			 SET @C = 3
			 SET @P = 4
			 END

			 IF (@Cholesterol >= 120 AND @Creatinine <= 200)
			 BEGIN
			 SET @C = 4
			 SET @P = 2
			 END
			 	
			
			 ELSE 
			 BEGIN
			 SET @C = 5
			 SET @P = 1
			 END


       INSERT INTO HealthScore (CId,[Count],WellnessScore)
	   VALUES (@CustomerId,@C,@P)



      SELECT TOP 1 WellnessScore,[Count] ,HealthNo ,CId   
      FROM   HealthScore
      WHERE  CId = @CustomerId ORDER BY HealthNo DESC
	   
	   
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateRepostDetails]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateRepostDetails]
	-- Add the parameters for the stored procedure here
		@CustomerId  INT,
     	 @Pulse       REAL,
    	 @HBP        REAL,
    	 @LBP        REAL,
   		 @Hemoglobin REAL,
   		 @HBA1C_FBS  REAL,
   		 @Cholesterol REAL,
   		 @Creatinine REAL,
    	 @SGPT       REAL,
   		 @ECG_TMT    NVARCHAR(MAX),
   		 @MER        NVARCHAR(MAX),
   		 @BMI        REAL,
   		 @ESR        REAL,
   		 @Diabetic   NVARCHAR(100),
   		 @Obes       NVARCHAR(100),
   		 @Kidney     NVARCHAR(100),
   		 @Anaemia    NVARCHAR(100),
   		 @Cardiac    NVARCHAR(100)
AS
BEGIN
	Update [Diagnoses] set
          Pulse=@Pulse,HBP=@HBP,LBP=@LBP,Hemoglobin=@Hemoglobin,HBA1C_FBS=@HBA1C_FBS,Cholesterol=@Cholesterol,Creatinine=@Creatinine,SGPT=@SGPT,ECG_TMT=@ECG_TMT,MER=@MER,BMI=@BMI,ESR=@ESR  
     where CustomerId=@CustomerId

 

        update Disease set Diabetic=@Diabetic,Obes=@Obes,Kidney=@Kidney,Anaemia=@Anaemia,Cardiac=@Cardiac
          where CustomerId=@CustomerId
END
GO
/****** Object:  StoredProcedure [dbo].[SpDiagnosesInsert]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     PROCEDURE [dbo].[SpDiagnosesInsert] --@CustomerId=11,@Pulse=1,@HBP=1,@LBP=1,@Hemoglobin=1,@HBA1C_FBS=1,@Cholesterol=1,@Creatinine=1,@SGPT=1,@ECG_TMT='1',@MER='1',@BMI=1,@ESR=1
	(
   		 @CustomerId  INT,
     	 @Pulse      REAL,
    	 @HBP        REAL,
    	 @LBP        REAL,
   		 @Hemoglobin REAL,
   		 @HBA1C_FBS  REAL,   ---Leucocytes Count-WBC Total
   		 @Cholesterol REAL,     
   		 @Creatinine REAL,    --Basophils
    	 @SGPT       REAL,    -- set X
   		 @ECG_TMT    NVARCHAR(MAX), -- -- set X
   		 @MER        NVARCHAR(MAX),  ---- set X
   		 @BMI        REAL,
   		 @ESR        REAL    ---- set X
   		 
)
AS 
BEGIN 
     SET NOCOUNT ON
        DECLARE
		@Diabetic   NVARCHAR(100),
		@Obes       NVARCHAR(100),
		@Kidney     NVARCHAR(100),
		@Anaemia    NVARCHAR(100),
		@Cardiac    NVARCHAR(100),
		@Age        INT,
		@Count      INT = 0,
		@Score      INT = 0
		


		  SET   @Age =  (SELECT Age FROM Customers WHERE CustomerId = @CustomerId)
      
          INSERT INTO [Diagnoses]
          (CustomerId,Pulse,HBP,LBP,Hemoglobin,HBA1C_FBS,Cholesterol,Creatinine,SGPT,ECG_TMT,MER,BMI,ESR) 
          VALUES 
          (@CustomerId,@Pulse, @HBP,@LBP, @Hemoglobin, @HBA1C_FBS,@Cholesterol,@Creatinine,@SGPT,@ECG_TMT,@MER,@BMI,@ESR)


       IF (@Age >= 35 AND @HBA1C_FBS >= 6.0 AND @Pulse >= 75 AND @HBP >= 130)
	   BEGIN
	   SET @Diabetic = 'HIGH'
	   SET @Count = @Count + 1
	   END
	   ELSE
	   BEGIN
	   SET	
	   @Diabetic = 'LOW'
	   END
 
             IF (@Age >= 30 AND @BMI >= 30)
			 BEGIN
			 SET @Obes  = 'HIGH'
			 SET @Count = @Count + 1
			 END
			 ELSE
			 BEGIN
			 SET  @Obes = 'LOW'
			 END


       IF (@Creatinine < 0.6 OR @Creatinine > 1.3)
			 BEGIN
			 SET @Kidney = 'HIGH'
			 SET @Count = @Count + 1
			 END
			 ELSE
			 BEGIN
			 SET @Kidney = 'LOW'
			 END

	 IF (@Cholesterol <= 120 AND @Creatinine >= 200)
	 BEGIN
	 SET @Cardiac  = 'HIGH'
	 SET @Count = @Count + 1
	 END
	 ELSE
	 BEGIN
	 SET @Cardiac  = 'LOW'
	 END

			IF(@Hemoglobin < 12 OR @Hemoglobin > 18)
			BEGIN
			SET @Anaemia = 'HIGH'
            SET @Count = @Count + 1
			END
			ELSE
			BEGIN
			SET @Anaemia = 'LOW'
			END

         

        INSERT INTO Disease (CustomerId,Diabetic,Obes,Kidney,Anaemia,Cardiac)
        Values(  @CustomerId,@Diabetic, @Obes, @Kidney,  @Anaemia, @Cardiac) 

	
		 IF(@Count = 1) 
		 BEGIN
		 SET @Score = 7
		 END

		 IF(@Count = 2) 
		 BEGIN
		 SET @Score = 5
		 END

		 IF(@Count = 3) 
		 BEGIN
		 SET @Score = 4
		 END

		 IF(@Count = 4) 
		 BEGIN
		 SET @Score = 2
		 END

		 IF(@Count = 5) 
		 BEGIN
		 SET @Score = 1
		 END


         IF(@Count = 0) 
		 BEGIN
		 SET @Score = 10
		 END

		INSERT INTO HealthScore(CId,[Count],WellnessScore)
		VALUES(@CustomerId,@Count,@Score)


END

GO
/****** Object:  StoredProcedure [dbo].[SpDiagnosesUpdateDataByPdf]    Script Date: 4/19/2023 3:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create     PROCEDURE [dbo].[SpDiagnosesUpdateDataByPdf] --@CustomerId=5,@Pulse=1,@HBP=1,@LBP=1,@Hemoglobin=1,@HBA1C_FBS=1,@Cholesterol=1,@Creatinine=1,@SGPT=1,@ECG_TMT='1',@MER='1',@BMI=1,@ESR=1
	(
   		 @CustomerId  INT,
     	 @Pulse      REAL,
    	 @HBP        REAL,
    	 @LBP        REAL,
   		 @Hemoglobin REAL,
   		 @HBA1C_FBS  REAL,   ---Leucocytes Count-WBC Total
   		 @Cholesterol REAL,     
   		 @Creatinine REAL,    --Basophils
    	 @SGPT       REAL,    -- set X
   		 @ECG_TMT    NVARCHAR(MAX), -- -- set X
   		 @MER        NVARCHAR(MAX),  ---- set X
   		 @BMI        REAL,
   		 @ESR        REAL    ---- set X
   		 
)
AS 
BEGIN 
     SET NOCOUNT ON
        DECLARE
		@Diabetic   NVARCHAR(100),
		@Obes       NVARCHAR(100),
		@Kidney     NVARCHAR(100),
		@Anaemia    NVARCHAR(100),
		@Cardiac    NVARCHAR(100),
		@Age        INT,
		@Count      INT = 0,
		@Score      INT = 0
		


		  SET   @Age =  (SELECT Age FROM Customers WHERE CustomerId = @CustomerId)
      
          Update [Diagnoses] set
          Pulse=@Pulse,HBP=@HBP,LBP=@LBP,Hemoglobin=@Hemoglobin,HBA1C_FBS=@HBA1C_FBS,Cholesterol=@Cholesterol,Creatinine=@Creatinine,SGPT=@SGPT,ECG_TMT=@ECG_TMT,MER=@MER,BMI=@BMI,ESR=@ESR  
    		where CustomerId=@CustomerId

       IF (@Age >= 35 AND @HBA1C_FBS >= 6.0 AND @Pulse >= 75 AND @HBP >= 130)
	   BEGIN
	   SET @Diabetic = 'HIGH'
	   SET @Count = @Count + 1
	   END
	   ELSE
	   BEGIN
	   SET	
	   @Diabetic = 'LOW'
	   END
 
             IF (@Age >= 30 AND @BMI >= 30)
			 BEGIN
			 SET @Obes  = 'HIGH'
			 SET @Count = @Count + 1
			 END
			 ELSE
			 BEGIN
			 SET  @Obes = 'LOW'
			 END


       IF (@Creatinine < 0.6 OR @Creatinine > 1.3)
			 BEGIN
			 SET @Kidney = 'HIGH'
			 SET @Count = @Count + 1
			 END
			 ELSE
			 BEGIN
			 SET @Kidney = 'LOW'
			 END

	 IF (@Cholesterol <= 120 AND @Creatinine >= 200)
	 BEGIN
	 SET @Cardiac  = 'HIGH'
	 SET @Count = @Count + 1
	 END
	 ELSE
	 BEGIN
	 SET @Cardiac  = 'LOW'
	 END

			IF(@Hemoglobin < 12 OR @Hemoglobin > 18)
			BEGIN
			SET @Anaemia = 'HIGH'
            SET @Count = @Count + 1
			END
			ELSE
			BEGIN
			SET @Anaemia = 'LOW'
			END

         

        update Disease set Diabetic=@Diabetic,Obes=@Obes,Kidney=@Kidney,Anaemia=@Anaemia,Cardiac=@Cardiac
          where CustomerId=@CustomerId

	
		 IF(@Count = 1) 
		 BEGIN
		 SET @Score = 7
		 END

		 IF(@Count = 2) 
		 BEGIN
		 SET @Score = 5
		 END

		 IF(@Count = 3) 
		 BEGIN
		 SET @Score = 4
		 END

		 IF(@Count = 4) 
		 BEGIN
		 SET @Score = 2
		 END

		 IF(@Count = 5) 
		 BEGIN
		 SET @Score = 1
		 END


         IF(@Count = 0) 
		 BEGIN
		 SET @Score = 10
		 END

		INSERT INTO HealthScore(CId,[Count],WellnessScore)
		VALUES(@CustomerId,@Count,@Score)


		--SELECT TOP 1 * FROM HealthScore ORDER BY HealthNo DESC 
END
GO
USE [master]
GO
ALTER DATABASE [HealthScorePredictor] SET  READ_WRITE 
GO
