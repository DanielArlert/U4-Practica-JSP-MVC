create database ferreteria_db;

use ferreteria_db;

create table producto(
	id_producto int(5) not null  auto_increment,
	nombre_producto varchar(20) not null,
	precio_compra int(5) not null,
	precio_venta int(5) not null,
	marca varchar(20),
	stock int(5) not null,
	constraint producto_key primary key (id_producto)
);

insert into producto(nombre_producto, precio_compra, precio_venta, marca, stock) values
	('Martillo', 50, 100, 'Truper', 75),
	('Cinta metrica', 75, 150, 'Stanley', 75),
	('Broca HSS', 30, 60, 'Toolcraft', 75),
	('Alambre galvanizado', 75, 150, 'Toolcraft', 75),
	('Clavo', 1, 5, 'Fifa', 5000),
	('Tornillo de madera', 1, 5, 'Veker', 5000),
	('Tornillo 6', 1, 5, 'Veker', 5000),
	('Rondana con neopreo', 1, 5, 'Celta', 5000),
	('Grapa recta de cable', 1, 5, 'Fulgore', 5000),
	('Pasador mauser', 1, 5, 'Carpi', 5000);
/*select * from producto;*/




create table cliente(
	id_cliente numeric(5) not null,
	nombre_cliente varchar(20) not null,
	apellidop_cliente varchar(20) not null,
	apellidom_cliente varchar(20) not null,
	calle varchar(25) not null,
	numero numeric(5),
	ciudad varchar(20) not null,
	telefono numeric(10) unique,
	constraint cliente_key primary key (id_cliente)
);

create table proveedor(
	id_proveedor numeric(5) not null,
	nombre_proveedor varchar(20) not null,
	apellidop_proveedor varchar(20) not null,
	apellidom_proveedor varchar(20) not null,
	correo varchar(30) unique,
	constraint proveedor_key primary key (id_proveedor)
);

create table venta(
	folio_venta numeric(5) not null,
	id_cliente numeric(5) not null,
	fecha date,
	total numeric(8,2),
	constraint fventa_key primary key (folio_venta),
	constraint id_cliente foreign key (id_cliente)
	references cliente(id_cliente) match simple on update no action on delete no action
);

create table entrega(
	folio_entrega numeric(5) not null,
	id_proveedor numeric(5) not null,
	fecha date,
	total numeric(8,2),
	constraint fentrega_key primary key (folio_entrega),
	constraint id_proveedor foreign key (id_proveedor)
	references proveedor(id_proveedor) match simple on update no action on delete no action
);

create table detalle_venta(
	folio_venta numeric(5) not null,
	id_producto numeric(5) not null,
	cantidad_pieza numeric(5) not null,
	total_pieza numeric(8,2),
	constraint id_producto foreign key (id_producto)
	references producto (id_producto) match simple on update no action on delete no action
);

create table detalle_entrega(
	folio_entrega numeric(5) not null,
	id_producto numeric(5) not null,
	cantidad_pieza numeric(5) not null,
	total_pieza numeric(8,2),
	constraint id_producto foreign key (id_producto)
	references producto (id_producto) match simple on update no action on delete no action
);





/******************************************************************************************************/

create sequence cliente_seq start with 1 increment by 1 minvalue 1 maxvalue 10000 cycle;
alter table cliente alter column id_cliente set default nextval('cliente_seq');

create sequence rol_seq start with 1 increment by 1 minvalue 1 maxvalue 10000 cycle;
alter table rol alter column id_rol set default nextval('rol_seq');

create sequence usuario_seq start with 1 increment by 1 minvalue 1 maxvalue 10000 cycle;
alter table usuario alter column id_usuario set default nextval('usuario_seq');

create sequence proveedor_seq start with 1 increment by 1 minvalue 1 maxvalue 10000 cycle;
alter table proveedor alter column id_proveedor set default nextval('proveedor_seq');

insert into cliente(nombre_cliente, apellidop_cliente, apellidom_cliente, calle, numero, ciudad, telefono) values
	('Roberto', 'Arlt', 'Laiseca', 'Matamoros', 15, 'Patzcuaro', 4349007086),
	('Ricardo', 'Piglia', 'Cohen', 'Guerrero', 25, 'Quiroga', 4346451653),
	('Ernesto', 'Sabato', 'Alamada', 'Mina', 35, 'Tzintzuntzan', 4342676341),
	('Leopoldo', 'Lugones', 'Harwicz', 'Bravo', 45, 'Morelia', 4346549462),
	('Silvina', 'Ocampo', 'Mairal', 'Aldama', 55, 'Patzcuaro', 4344019533),
	('Ariana', 'Harwicz', 'Lugones', 'Victoria', 15, 'Quiroga', 4346866870),
	('Pedro', 'Mairal', 'Ocampo', 'Galeana', 25, 'Tzintzuntzan', 4344570907),
	('Selva', 'Alamada', 'Sabato', 'Iturbide', 35, 'Morelia', 4349419851),
	('Marcelo', 'Cohen', 'Piglia', 'Torres', 45, 'Tzintzuntzan', 4345200080),
	('Alberto', 'Laiseca', 'Arlt', 'Bustamante', 55, 'Patzcuaro', 4344772750);
/*select * from cliente;*/

insert into proveedor(nombre_proveedor, apellidop_proveedor, apellidom_proveedor, correo) values
	('Stephen', 'King', 'Machado', 'sking@gmail.com'),
	('Julio', 'Cortazar', 'Alas', 'jcortazar@gmail.com'),
	('Julio', 'Verne', 'Aleixandre', 'jverne@gmail.com'),
	('Antonio', 'Machado', 'Altolaguirre', 'amachado@gmail.com'),
	('Francisco', 'Ayala', 'Verne', 'fayala@gmail.com'),
	('Vicente', 'Aleixandre', 'Leon', 'valeixandre@gmail.com'),
	('Manuel', 'Altolaguirre', 'Ayala', 'mltolaguirre@gmail.com'),
	('Leopoldo', 'Alas', 'Rosa', 'lalas@gmail.com'),
	('Rafael', 'Alberti', 'King', 'ralberti@gmail.com'),
	('Jose', 'Machado', 'Cortazar', 'jamachado@gmail.com');
/*select * from proveedor;*/

insert into venta(folio_venta, id_cliente, fecha, total) values 
	(1, 1, '17/06/2021', 310);
/*select * from venta;*/

insert into entrega(folio_entrega, id_proveedor, fecha, total) values 
	(1, 1, '17/05/2021', 2500);
/*select * from entrega;*/

insert into detalle_venta(folio_venta, id_producto, cantidad_pieza, total_pieza) values 
	(1, 1, 1, 100),
	(1, 2, 1, 150),
	(1, 3, 1, 60);
/*select * from detalle_venta;*/

insert into detalle_entrega(folio_entrega, id_producto, cantidad_pieza, total_pieza) values 
	(1, 1, 50, 2500);
/*select * from detalle_entrega;*/



create view FacturaVentas as 
select folio_venta, nombre_cliente, apellidop_cliente, apellidom_cliente, total, fecha 
from (select * from venta) as ven,
	(select id_cliente, nombre_cliente, apellidop_cliente, apellidom_cliente from cliente) as cli
where ven.id_cliente=cli.id_cliente;
/*select * from FacturaVentas;*/

create view DetalleFacturaVentas as 
select venta.folio_venta, nombre_producto, det.cantidad_pieza, det.total_pieza, fecha 
from (select id_producto, nombre_producto from producto) as pro,
	(select * from detalle_venta) as det,
	(select * from venta) as venta,
	(select id_cliente from cliente) as cli 
where pro.id_producto=det.id_producto and venta.folio_venta=det.folio_venta and venta.id_cliente=cli.id_cliente;
/*select * from DetalleFacturaVentas;*/

create view FolioVentaSiguiente as select (MAX(folio_venta)+1) as FVS from venta;
/*select * from FolioVentaSiguiente;*/


create view FacturaEntregas as 
select folio_entrega, nombre_proveedor, apellidop_proveedor, apellidom_proveedor, total, fecha 
from (select * from entrega) as ent,
	(select id_proveedor, nombre_proveedor, apellidop_proveedor, apellidom_proveedor from proveedor) as prov
where ent.id_proveedor=prov.id_proveedor;
/*select * from FacturaEntregas;*/

create view DetalleFacturaEntregas as 
select entrega.folio_entrega, nombre_producto, det.cantidad_pieza, det.total_pieza, fecha 
from (select id_producto, nombre_producto from producto) as pro,
	(select * from detalle_entrega) as det,
	(select * from entrega) as entrega,
	(select id_proveedor from proveedor) as prov
where pro.id_producto=det.id_producto and entrega.folio_entrega=det.folio_entrega and entrega.id_proveedor=prov.id_proveedor;
/*select * from DetalleFacturaEntregas;*/

create view FolioEntregaSiguiente as select (MAX(folio_entrega)+1) as FES from entrega;
/*select * from FolioEntregaSiguiente;*/





create user almacenista with password '19092010';
grant usage on proveedor_seq, producto_seq to almacenista;
grant select on detalle_entrega, entrega to almacenista;
grant insert on detalle_entrega, entrega to almacenista;
grant update on detalle_entrega, entrega to almacenista;
grant all privileges on proveedor, producto to almacenista;
grant select on FacturaEntregas to almacenista;
grant select on DetalleFacturaEntregas to almacenista;
grant select on FolioEntregaSiguiente to almacenista;



create user cajero with password '19092020';
grant usage on cliente_seq, producto_seq to cajero;
grant select on detalle_venta, venta, producto to cajero;
grant insert on detalle_venta, venta to cajero;
grant update on detalle_venta, venta, producto to cajero;
grant all privileges on cliente to cajero;
grant select on FacturaVentas to cajero;
grant select on DetalleFacturaVentas to cajero;
grant select on FolioVentaSiguiente to cajero;





create or replace function registro_det_venta()
returns trigger as 
$registro_det_venta$
	begin
	
		if(new.cantidad_pieza>0) then	
			update detalle_venta 
				set total_pieza = 
					(select precio_venta from producto where id_producto = new.id_producto) 
						* new.cantidad_pieza
						where detalle_venta.id_producto = new.id_producto 
							and detalle_venta.folio_venta = new.folio_venta;
					
			update producto
				set stock = 
					(select stock from producto where id_producto = new.id_producto) - new.cantidad_pieza
						where producto.id_producto = new.id_producto;	
				
            return new;
            
		end if;

		return null;
	end; 
$registro_det_venta$ language 'plpgsql';

create trigger registro_det_venta after insert on detalle_venta 
for each row execute procedure registro_det_venta();
	
	/*Se insertan los productos uno a uno para poder verificar el stock.
	insert into detalle_venta(folio_venta, id_producto, cantidad_pieza) values  (2, 2, 1); */
    


create or replace function registro_venta()
returns trigger as 
$registro_venta$
	begin

		if(new.id_cliente>0) then	
			update venta 
				set total = (select sum(total_pieza) from detalle_venta where folio_venta = new.folio_venta)
					where venta.folio_venta = new.folio_venta and venta.id_cliente = new.id_cliente;
							
			update venta 
				set fecha = now()
				where venta.folio_venta = new.folio_venta;

			return new;
		end if;

		return null;
	end; 
$registro_venta$ language 'plpgsql';

create trigger registro_venta after insert on venta 
for each row execute procedure registro_venta();

    /*Se registra la segunda venta.
	insert into venta(folio_venta, id_cliente) values (2, 2); */



create or replace function registro_det_entrega()
returns trigger as 
$registro_det_entrega$
	begin

		if(new.cantidad_pieza>0) then		
			update detalle_entrega 
				set total_pieza = 
					(select precio_compra from producto where id_producto = new.id_producto) 
					* new.cantidad_pieza
						where detalle_entrega.id_producto = new.id_producto 
							and detalle_entrega.folio_entrega = new.folio_entrega;
					
			update producto
				set stock = 
					(select stock from producto where id_producto = new.id_producto) + new.cantidad_pieza
						where producto.id_producto = new.id_producto;	

			return new;
		end if;
            
		return null;
	end; 
$registro_det_entrega$ language 'plpgsql';

create trigger registro_det_entrega after insert on detalle_entrega 
for each row execute procedure registro_det_entrega();

	/*Se insertan los productos uno a uno para añadir al stock.
	insert into detalle_entrega(folio_entrega, id_producto, cantidad_pieza) values (2, 2, 75); */



create or replace function registro_entrega()
returns trigger as 
$registro_entrega$

	begin
		if(new.id_proveedor>0) then	
			update entrega 
				set total = (select sum(total_pieza) from detalle_entrega where folio_entrega = new.folio_entrega)
					where entrega.folio_entrega = new.folio_entrega and entrega.id_proveedor = new.id_proveedor;
							
			update entrega 
				set fecha = now()
					where entrega.folio_entrega = new.folio_entrega;

			return new;
        end if;
        
		return null;
	end; 
$registro_entrega$ language 'plpgsql';

create trigger registro_entrega after insert on entrega 
for each row execute procedure registro_entrega();

	/*Se registra la segunda entrega.
	insert into entrega(folio_entrega, id_proveedor) values (2, 2); */







/*
revoke all privileges on all tables in schema public from cajero;
revoke all privileges on all sequences in schema public from cajero;
revoke all privileges on all functions in schema public from cajero;

revoke all privileges on all tables in schema public from almacenista;
revoke all privileges on all sequences in schema public from almacenista;
revoke all privileges on all functions in schema public from almacenista;
*/

/*
SELECT id_producto, nombre_producto, stock FROM producto WHERE stock < 100;


SELECT v.id_cliente, nombre_cliente, apellidop_cliente, apellidom_cliente, calle, numero, ciudad, telefono FROM
        (select * from cliente) AS cli,
        (select id_cliente from venta) AS v
    WHERE v.id_cliente=cli.id_cliente 
    GROUP BY    v.id_cliente, nombre_cliente, apellidop_cliente, apellidom_cliente, calle, numero, ciudad, telefono 
    ORDER BY count(nombre_cliente) DESC LIMIT 3;


SELECT * FROM venta FROM extract(MONTH FROM fecha) = mes;


SELECT * FROM  entrega FROM extract(MONTH FROM fecha) = mes;

SELECT v.id_producto, nombre_producto, marca, stock FROM
        (SELECT id_producto, nombre_producto, marca, stock FROM producto) AS p,
        (SELECT id_producto FROM detalle_venta) AS v
        WHERE v.id_producto=p.id_producto 
            GROUP BY v.id_producto, nombre_producto, marca, stock 
                ORDER BY count(nombre_producto) DESC LIMIT 1

*/

