// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

/*-----------------------------------------------\
The address decoder is used to generate a selector signal to select ROM or RAM.
1FFFH -- 1800H RAM
17FFH -- 0000H ROM
\-----------------------------------------------*/

module addr_decode (
	input [12:0] addr , // Address
	output reg ram_sel,
	output reg rom_sel
);
	always @(addr) begin
		casex(addr)
		13'b1_1xxx_xxxx_xxxx : 
			{rom_sel, ram_sel} <= 2'b01 ;
		13'b0_xxxx_xxxx_xxxx :
			{rom_sel, ram_sel} <= 2'b10 ;
		13'b1_0xxx_xxxx_xxxx :
			{rom_sel, ram_sel} <= 2'b10 ;
		default :
			{rom_sel, ram_sel} <= 2'b00 ;
		endcase	
	end

endmodule
    