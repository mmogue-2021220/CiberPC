drop database if exists DBCyberPC;
create database DBCyberPC;

Use    DBCyberPC;


Create table Empleado(
	codigoEmpleado int not null auto_increment,
	nombresEmpleado varchar(100) not null,
	apellidoEmpleado varchar(100) not null,
	DPIEmpleado varchar(100) not null,
	primary key PK_codigoEmpleado (codigoEmpleado)
	
);

create table Marcas(
    codigoMarca int not null,
    nombreMarca varchar(255) not null,
    numeroContacto varchar(8)  not null,
    primary key PK_codigoMarca (codigoMarca)
);

create table TipoUsuario(
    codigoTipoUsuario int not null auto_increment,
    tipoUsuario varchar(255) not null,
	primary key PK_codigoTipoUsuario (codigoTipoUsuario)
);

Create table Usuario(
	codigoUsuario int not null auto_increment,
    codigoTipoUsuario int not null,
	primary key PK_codigoUsuario (codigoUsuario),
	constraint FK_Usuario_TipoUsuario foreign key (codigoTipoUsuario) references TipoUsuario (codigoTipoUsuario)
);


create table TipoProducto(
    codigoTipoProducto int not null,
    codigoMarca int not null,
    descripcion varchar (255)  not null,
    primary key PK_codigoTipoProducto (codigoTipoProducto),
	constraint FK_TipoProducto_Marcas foreign key (codigoMarca) references Marcas(codigoMarca)
);

create table Productos(
    codigoProducto int not null,
    nombreProducto varchar(255)  not null,
    stock int not null,
    precio int not null,
    codigoTipoProducto int not null,
    primary key PK_codigoProducto (codigoProducto),
    constraint FK_Productos_TipoProducto foreign key (codigoTipoProducto) references TipoProducto(codigoTipoProducto)
);

create table FormasDePago(
    codigoFormaPago int not null,
    formaDePago varchar(100) not null,
    primary key PK_FormasDePago (codigoFormaPago)
);



create table Cliente(
    codigoCliente int not null,
    nombreCliete varchar(150) not null,
    apellidoCliente varchar(150) not null,
    telefonoCliente varchar(8) not null,
    primary key PK_codigoCliente (codigoCliente)
);

create table Factura(
    codigoFactura int not null,
    fechaFactura date not null,
    codigoCliente int not null,
    codigoFormaPago int not null,
    primary key Pk_codigoFactura (codigoFactura),
    constraint FK_Factura_Cliente foreign key (codigoCliente) references Cliente (codigoCliente),
    constraint FK_Factura_FormasDePago foreign key (codigoFormaPago) references FormasDePago(codigoFormaPago)
);

create table DetalleFactura(
	codigoDetalleFac int not null,
    detalles varchar(150) not null,
    codigoFactura int not null,
    codigoProducto int not null,
    primary key PK_codigoDetalleFac (codigoDetalleFac),
    constraint PK_DetalleFactura_Factura foreign key (codigoFactura) references Factura (codigoFactura),
    constraint PK_DetalleFactura_Productos foreign key (codigoProducto) references Productos (codigoProducto)
);