// This program was cloned from: https://github.com/jferrer08/latinpractice
// License: Apache License 2.0

`timescale 1ns / 1ps

module RS232_TX(D, reset, clk, EOT, STT, TX);

parameter BaudRate=9600;
parameter reloj=50000000;
parameter conta=reloj/BaudRate;

input clk,reset,STT;
input [7:0] D;
output reg TX, EOT;

reg B,enable;	  				//Pulso Buad Rate emisor
reg [12:0] k;
reg [3:0] estado, nex_estado,M; 
reg [7:0] Dreg;
wire P;

always @(estado)
	begin
		if(estado == 0) begin EOT<=1'b1;	M<=4'b0000; enable<=1'b0;			end
		else if(estado == 1) begin EOT<=1'b0; M<=4'b0001; enable<=1'b1;	end
		else if(estado == 2) begin EOT<=1'b0; M<=4'b0010; enable<=1'b1;	end
		else if(estado == 3) begin EOT<=1'b0; M<=4'b0011; enable<=1'b1;	end
		else if(estado == 4) begin EOT<=1'b0; M<=4'b0100; enable<=1'b1;	end
		else if(estado == 5) begin EOT<=1'b0; M<=4'b0101; enable<=1'b1;	end
		else if(estado == 6) begin EOT<=1'b0; M<=4'b0110; enable<=1'b1;	end
		else if(estado == 7) begin EOT<=1'b0; M<=4'b0111; enable<=1'b1;	end
		else if(estado == 8) begin EOT<=1'b0; M<=4'b1000; enable<=1'b1;	end
		else if(estado == 9) begin EOT<=1'b0; M<=4'b1001; enable<=1'b1;	end
		else if(estado == 10) begin EOT<=1'b0; M<=4'b1010; enable<=1'b1;	end
		else if(estado == 11) begin EOT<=1'b0; M<=4'b0000; enable<=1'b1;	end
		else begin EOT<=1'b1; M<=4'b0000; enable<=1'b0; end
	end

always @(M,Dreg,P)
	begin
		case (M)
			4'b0000: TX<=1'b1;
			4'b0001: TX<=1'b0;
			4'b0010: TX<=Dreg[0];
			4'b0011: TX<=Dreg[1];
			4'b0100: TX<=Dreg[2];
			4'b0101: TX<=Dreg[3];
			4'b0110: TX<=Dreg[4];
			4'b0111: TX<=Dreg[5];
			4'b1000: TX<=Dreg[6];
			4'b1001: TX<=Dreg[7];
			4'b1010: TX<=P;
			default: TX<=1'b1;
		endcase
	end

always @(posedge clk) // generación de la señal Baudio
begin
	if (enable==1'b1)
   begin
		if (k>=(conta-1))
      begin
			k<=0;
         B<=1'b1;
      end
      else
		begin
			k<=k+1'b1;
         B<=1'b0;
      end
	end    
   else     
   begin
		k<=0;
      B<=0;
   end
end

assign P=~(Dreg[0]^Dreg[1]^Dreg[2]^Dreg[3]^Dreg[4]^Dreg[5]^Dreg[6]^Dreg[7]);	
		
always @(posedge clk, posedge reset)
begin
	if (reset) 
		estado<=0; 
	else 
		estado<=nex_estado;
end

always @(posedge clk, posedge reset)
begin
	if (reset)	
		Dreg<=0;
	else if (estado==1) 
		Dreg<=D;
	else 
		Dreg<=Dreg;
end

always @(estado or STT or B)
begin
	case (estado)
		0: begin
			if (STT)	nex_estado<=1;	else nex_estado<=0;
		end
		1: begin
			if (B) nex_estado<=2; else	nex_estado<=1;
		end
		2: begin
			if (B) nex_estado<=3; else	nex_estado<=2;
		end	
		3: begin
			if (B) nex_estado<=4; else	nex_estado<=3;
		end		 
		4: begin
			if (B) nex_estado<=5; else	nex_estado<=4;
		end	
		5: begin
			if (B) nex_estado<=6; else	nex_estado<=5;
		end	
		6: begin
			if (B) nex_estado<=7; else	nex_estado<=6;
		end
		7: begin
			if (B) nex_estado<=8; else	nex_estado<=7;
		end	
		8: begin
			if (B) nex_estado<=9; else	nex_estado<=8;
		end	
		9: begin
			if (B) nex_estado<=10; else nex_estado<=9;
		end	
		10: begin
			if (B) nex_estado<=11;	else	nex_estado<=10;
		end
		11: begin
			if (B) nex_estado<=0;	else	nex_estado<=11;
		end	
		default: nex_estado<=0;
	endcase
end

endmodule
