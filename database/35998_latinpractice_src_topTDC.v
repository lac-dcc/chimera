// This program was cloned from: https://github.com/jferrer08/latinpractice
// License: Apache License 2.0

`timescale 1ns / 1ps

module topTDC(clk, stop, reset, tx, eot);

input clk;
input stop;
input reset;

//output [7:0] dato;
output tx,eot;

//estados
reg [2:0] estado, edo_futuro;
parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;
parameter s5 = 3'b101;

reg stc;	//start de cuenta
reg stt; //stt para bloque transmisor
wire [7:0] aux;
reg [7:0] temp;
reg bandera;

contadorTDC contador(.start(stc), .clk(clk), .cuenta(aux));
RS232_TX transmisor(.D(temp), .reset(reset), .EOT(eot), .clk(clk), .STT(stt), .TX(tx));


//cambio de estados
always @(posedge clk)
begin
	if (reset)
		estado <= s0;
	else
		estado <= edo_futuro;
end

///
always @(*)
begin
	case (estado)
		s0:
		begin
			if (stop)
			begin
				edo_futuro = s1;
				stc = 1'b1;
				bandera = 1'b0;
				stt = 1'b0;
			end
			else
			begin
				edo_futuro = s0;
				stc = 1'b0;
				bandera = 1'b0;
				stt = 1'b0;
			end
		end
		s1:
		begin
			if (stop)
			begin
				edo_futuro = s1;
				stc = 1'b1;	//inicio cuenta
				bandera = 1'b0;
				stt = 1'b0;
			end
			else
			begin
				edo_futuro = s2;
				stc = 1'b0;
				bandera = 1'b1;	//almaceno cuenta en variable aux
				stt = 1'b0;
			end
		end
		s2:
		begin
			edo_futuro = s3;
			stc = 1'b0;		//termino cuenta
			stt = 1'b1;		//inicio transmision
			bandera = 1'b0;
		end
		s3:
		begin
			edo_futuro = s4;
			stc = 1'b0;		//termino cuenta
			bandera = 1'b0;
			stt = 1'b0;
		end
		s4:
		begin
			edo_futuro = s5;
			stt = 1'b0;		//terminimo transmision
			stc = 1'b0;		//termino cuenta
			bandera = 1'b0;
		end
		s5:
		begin
			stt = 1'b0;
						
			if (eot==1'b1)
			begin
				edo_futuro = s0;
				bandera = 1'b0;
				stc = 1'b0;		//termino cuenta				
			end
			else
			begin
				edo_futuro = s5;
				bandera = 1'b0;
				stc = 1'b0;		//termino cuenta
			end
		end
	endcase
end

always @(posedge clk)
begin
	if(bandera == 1'b1)
		temp <= aux;
	else
		temp <= temp;
end

//assign dato = temp;

endmodule
