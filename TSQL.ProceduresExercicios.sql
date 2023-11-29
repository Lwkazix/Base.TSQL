use Romullus;
--------------------------------------------------------------------
go
Create procedure AumentoIF OBJECT_ID('AlterarSenha','P') is not null
drop procedure AlterarSenha;
go
---------------------------------------------------------------------
create procedure AlterarSenha
@UsuarioID Int ,
@NovaSenha varchar(32)
as 
begin
update Usuario set Senha=@NovaSenha
where Usuario.ID = @UsuarioID
end ;
select*from Usuario;
exec AlterarSenha @usuarioID= 1, @NovaSenha='333xzx';
if OBJECT_ID('Seleção','P') is not null
drop procedure Seleção;
---------------------------------------------------------------------
go
create procedure Seleção
@id int
as 
begin
Select Logradouro,Numero,Complemento ,Nomebairro,NomeCidade,NomeUF,SiglaUF
from Cidade
INNER join UF on Cidade.fkUFID= UF.ID
INNER JOIN Bairro on Cidade.ID=BairrO.fkCidadeID
INNER Join Endereco on Endereco.fkBairroID =Cidade.fkUFID
where Cidade.ID= @id;
end;
GO;
Select* from Cidade;
EXEC Seleção @id=3;
select * from Imovel;
--------------------------------------------------------------------
go
create procedure ImagensporImovel
@imovelID int 
as
begin
select* 
from Imagem
where fkImovelID= @imovelID;
end;
exec ImagensporImovel @imovelID=3;
---------------------------------------------------------------------
go 
create procedure inserirlogin
@ID int,
@Email varchar(100),
@Senha nchar(32),
@Campo int
as
begin
insert into 
Login (ID ,Email,Senha,Campo)
values (@ID,@Email,@Senha,@Campo);
END;
SELECT* FROM LOGIN;
Exec inserirlogin @ID=11, @Email='carlos321@gmail.com',@Senha='332659m',@Campo=1;
----------------------------------------------------------------------
go 
create procedure Deletarlogin
@ID int
as
begin 
delete dbo.Login 
where @ID=ID;
END;
EXEC Deletarlogin @ID= 9;
-----------------------------------------------------------------------
go
create procedure ImoveisTipoAnuncio
@IdTipo int
as
begin 
Select * 
from Imovel
join TipoAnuncio
on Imovel.fkTipoAnuncioID =TipoAnuncio.ID
where fkTipoAnuncioID=@IdTipo;
end;
exec ImoveisTipoAnuncio @IdTipo=2;
----------------------------------------------------------------------
go
Create procedure Aumento
@FatorAumento float
as
begin
update imovel 
set Valorimovel= Valorimovel * @FatorAumento
end;
exec Aumento @FatorAumento=1.5;
Select * from imovel
----------------------------------------------------------------------
go
create procedure InserirUsuario
@ID int,
@Nome varchar(120),
@Senha nchar(32),
@Email varchar(100),
@Fk int 
as
begin
insert into Usuario(ID,Nome,Senha,DataHoraCriacao,DataHoraUltimoAcesso,Email,fkTipoUsuarioID)
values(@ID,@Nome,@Senha,getdate(),GETDATE(),@Email,@Fk);
end;
exec InserirUsuario @ID=11,@Nome='Ronaldo Sousa',@Senha='12365kli',@Email='RonaldoSousa@gmail.com'
,@fk=2;
------------------------------------------------------------------------
go 
create procedure Deletarimoveis
@nomecidade varchar(60)
as 
begin 
delete Imovel 
from Imovel
join endereco on imovel.fkEnderecoID = Endereco.ID
join bairro on endereco.fkBairroID= bairro.ID
join cidade on bairro.fkCidadeID= cidade.ID
join UF on cidade.fkUFID= UF.ID
where @nomecidade=Nome_cidade;
end;
exec Deletarimoveis @nomecidade = 'Salvador';
IF OBJECT_ID('AlterarSenha','P') is not null
drop procedure AlterarSenha;
-------------------------------------------------------------------------
go
create procedure AlterarSenha
@UsuarioID Int ,
@NovaSenha varchar(32)
as 
begin
update Usuario set Senha=@NovaSenha
where Usuario.ID = @UsuarioID
end ;
select*from Usuario;
exec AlterarSenha @usuarioID= 1, @NovaSenha='333xzx';
if OBJECT_ID('Seleção','P') is not null
drop procedure Seleção;
--------------------------------------------------------------------------
go
create procedure Seleção
@id int
as 
begin
Select Logradouro,Numero,Complemento ,Nomebairro,NomeCidade,NomeUF,SiglaUF
from Cidade
INNER join UF on Cidade.fkUFID= UF.ID
INNER JOIN Bairro on Cidade.ID=BairrO.fkCidadeID
INNER Join Endereco on Endereco.fkBairroID =Cidade.fkUFID
where Cidade.ID= @id;
end;
GO;
Select* from Cidade;
EXEC Seleção @id=3;
select * from Imovel;
-------------------------------------------------------------------------
go
create procedure ImagensporImovel
@imovelID int 
as
begin
select* 
from Imagem
where fkImovelID= @imovelID;
end;
exec ImagensporImovel @imovelID=3;
go 
create procedure inserirlogin
@ID int,
@Email varchar(100),
@Senha nchar(32),
@Campo int
as
begin
insert into 
Login (ID ,Email,Senha,Campo)
values (@ID,@Email,@Senha,@Campo);
END;
SELECT* FROM LOGIN;
Exec inserirlogin @ID=11, @Email='carlos321@gmail.com',@Senha='332659m',@Campo=1;
--------------------------------------------------------------------------
go 
create procedure Deletarlogin
@ID int
as
begin 
delete dbo.Login 
where @ID=ID;
END;
EXEC Deletarlogin @ID= 9;
--------------------------------------------------------------------------
go
create procedure ImoveisTipoAnuncio
@IdTipo int
as
begin 
Select * 
from Imovel
join TipoAnuncio
on Imovel.fkTipoAnuncioID =TipoAnuncio.ID
where fkTipoAnuncioID=@IdTipo;
end;
exec ImoveisTipoAnuncio @IdTipo=2;
@FatorAumento float
as
begin
update imovel 
set Valorimovel= Valorimovel * @FatorAumento
end;
exec Aumento @FatorAumento=1.5;
Select * from imovel;
--------------------------------------------------------------------------
go
create procedure InserirUsuario
@ID int,
@Nome varchar(120),
@Senha nchar(32),
@Email varchar(100),
@Fk int 
as
begin
insert into Usuario(ID,Nome,Senha,DataHoraCriacao,DataHoraUltimoAcesso,Email,fkTipoUsuarioID)
values(@ID,@Nome,@Senha,getdate(),GETDATE(),@Email,@Fk);
end;
exec InserirUsuario @ID=11,@Nome='Ronaldo Sousa',@Senha='12365kli',@Email='RonaldoSousa@gmail.com'
,@fk=2;
---------------------------------------------------------------------------
go 
create procedure Deletarimoveis
@nomecidade varchar(60)
as 
begin 
delete Imovel 
from Imovel
join endereco on imovel.fkEnderecoID = Endereco.ID
join bairro on endereco.fkBairroID= bairro.ID
join cidade on bairro.fkCidadeID= cidade.ID
join UF on cidade.fkUFID= UF.ID
where @nomecidade=Nome_cidade;
end;
exec Deletarimoveis @nomecidade = 'Rio de Janeiro';