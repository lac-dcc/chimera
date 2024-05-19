// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module IM(clk,PC,Ins);
//interface
	input clk;

	input [31:0] PC;
	
	output [31:0] Ins;
	
//combinational logic
	wire [10:0] addr;	//the binary width of 2048 is 11
	
	//reg [31:0] InsMem[0:2047];
	
	//integer i;
	
	/*
	initial				//set IM to all-zero and get Ins from code.txt
		begin
			i=0;
			while(i<2048)
				begin
					InsMem[i]=0;
					i=i+1;
				end
			$readmemh("code.txt",InsMem);
			$readmemh("code_handler.txt",InsMem,1120,2047);
		end
	*/
	
	assign addr=(PC-32'h0000_3000)>>2;	
	//assign Ins=InsMem[addr];
	
	IP_IM InsMem (
		.clka(clk),			// input clka
		.wea(4'b0000), 		 	// input [3 : 0] wea
		.addra(addr), 		// input [10 : 0] addra
		.dina(0), 			// input [31 : 0] dina
		.douta(Ins) 		// output [31 : 0] douta
	);
	
endmodule
