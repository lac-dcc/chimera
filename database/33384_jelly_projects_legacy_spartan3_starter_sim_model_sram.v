// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

`timescale 1ns / 1ps


module model_sram
		(
			ce_n, we_n, oe_n, addr, data
		);
	parameter	ADDR_WIDTH = 18;
	parameter	DATA_WIDTH = 8;
	localparam	MEM_SIZE   = (1 << ADDR_WIDTH);

	input						ce_n;
	input						we_n;
	input						oe_n;
	input	[ADDR_WIDTH-1:0]	addr;
	inout	[DATA_WIDTH-1:0]	data;
	
	reg		[DATA_WIDTH-1:0]	mem		[0:MEM_SIZE-1];
	

	reg							dly_ce_n;
	reg							dly_oe_n;
	reg		[ADDR_WIDTH-1:0]	dly_addr;
	reg		[DATA_WIDTH-1:0]	dly_data;
	always @* begin
		dly_ce_n <= #1 ce_n;
		dly_oe_n <= #1 oe_n;
		dly_addr <= #1 addr;
		dly_data <= #1 data;
	end
	
	integer		i;
	always @ ( posedge we_n ) begin
		if ( ~dly_ce_n ) begin
			mem[dly_addr] <= dly_data;
//			$display("[asram] write %x %x", dly_addr, dly_data);
		end
	end
	
	assign data = (~dly_ce_n & ~dly_oe_n) ? mem[dly_addr] : {DATA_WIDTH{1'bz}};
	
///	always @ ( negedge oe_n ) begin
//		$display("read %x %x", addr, mem[addr]);
//	end
	
endmodule
