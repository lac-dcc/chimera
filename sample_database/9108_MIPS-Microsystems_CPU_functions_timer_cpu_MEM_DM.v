// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`timescale 1ns / 1ps

module DM(clk,reset,DMWe,ADDR,DM_WD,WPC,byte_op,half_op,byte_addr,RD);
//interface
	input clk;
	input reset;
	
	input DMWe;
	
	input [31:0] ADDR;
	input [31:0] DM_WD;
	
	input [31:0] WPC;
	
	input byte_op;	//deal with byte
	input half_op;	//deal with half word

	input [1:0] byte_addr;  //byte position in a word
	
	output [31:0] RD;	//output RD_RAW

//sequential logic
	wire [12:2] addr;
/*
	reg [31:0] DMMem[0:2047];

	integer i;

	initial
		begin
			begin
				i=0;
				while(i<2048)
					begin
						DMMem[i]=0;	//DMMem can be modified inside function
						i=i+1;
					end
			end
		end
	*/
	
	assign addr=ADDR[12:2];			//change byte addr into word addr

/*
//load
	assign RD=DMMem[addr];

//store
	always @(posedge clk)
		begin
			if(reset)
				begin
					i=0;
					while(i<2048)
						begin
						DMMem[i]<=0;
							i=i+1;
						end
				end
			else if(DMWe&&ADDR<=32'h0000_1fff)
				begin
					if(byte_op) 
						begin
							DMMem[addr][(byte_addr*8)+:8]<=DM_WD[7:0];
							case(byte_addr)
								0:#0 $display("%d@%h: *%h <= %h",$time,WPC, addr*4,{DMMem[addr][31:8],DM_WD[7:0]});
								1:#0 $display("%d@%h: *%h <= %h",$time,WPC, addr*4,{DMMem[addr][31:16],DM_WD[7:0],DMMem[addr][7:0]});
								2:#0 $display("%d@%h: *%h <= %h",$time,WPC, addr*4,{DMMem[addr][31:24],DM_WD[7:0],DMMem[addr][15:0]});
								3:#0 $display("%d@%h: *%h <= %h",$time,WPC, addr*4,{DM_WD[7:0],DMMem[addr][23:0]});
							endcase
						end
					else if(half_op)
						begin
							DMMem[addr][(byte_addr*8)+:16]<=DM_WD[15:0];
							case(byte_addr)
								0:#0 $display("%d@%h: *%h <= %h",$time,WPC, addr*4,{DMMem[addr][31:16],DM_WD[15:0]});
								2:#0 $display("%d@%h: *%h <= %h",$time,WPC, addr*4,{DM_WD[15:0],DMMem[addr][15:0]});
							endcase
						end
					else 
						begin
							DMMem[addr]<=DM_WD;
							#0 $display("%d@%h: *%h <= %h", $time, WPC, addr*4,DM_WD);
						end
				end
			else
				begin
					DMMem[addr]<=DMMem[addr];
				end
		end
*/
	
	reg [3:0] BE;
	reg [31:0] dina;
	
	always @(*)
		begin
			if(DMWe&&ADDR<=32'h0000_1fff)
				begin
					if(byte_op) 
						begin
							dina={DM_WD[7:0],DM_WD[7:0],DM_WD[7:0],DM_WD[7:0]};
							if(byte_addr==0)BE=4'b0001;
							else if(byte_addr==1)BE=4'b0010;
							else if(byte_addr==2)BE=4'b0100;
							else if(byte_addr==3)BE=4'b1000;
							else BE=0;
						end
					else if(half_op)
						begin
							dina={DM_WD[15:0],DM_WD[15:0]};
							if(byte_addr==0)BE=4'b0011;
							else if(byte_addr==2)BE=4'b1100;
							else BE=4'b0000;
						end
					else 
						begin
							dina=DM_WD;
							BE=4'b1111;
						end
				end
			else 
				begin
					BE=4'b0000;
					dina=0;
				end
		end

	IP_DM DMMem (
		  .clka(clk),		// input clka
		  .rsta(reset), 	// input rsta
		  .wea(BE), 		// input [3 : 0] wea
		  .addra(addr), 	// input [10 : 0] addra
		  .dina(dina), 		// input [31 : 0] dina
		  .douta(RD) 	 	// output [31 : 0] douta
	);

endmodule
