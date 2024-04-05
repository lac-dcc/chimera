`include "tune.v"

module drammem(
	input	[9:0] ma,
	inout [15:0] d,
	input ras_n,
	input ucas_n,
	input lcas_n,
	input we_n
);

	parameter _verbose_ = 1;
	parameter _add_to_addr_ = 0;
	parameter _filter_out_ = 32'h91;
	parameter _init_ = 1;

	reg [15:0] array [0:1048575];
	reg [15:0] dout;

	reg [19:0] addr;

	wire cas_n;

	wire idle;

	reg was_ras;
	reg was_cas;
	reg ready;



	initial
	begin : clear_mem
		integer i;

		if( _init_ )
		begin
			for(i=0;i<1048576;i=i+1)
				array[i] = 16'hDEAD;
		end
	end





	always @(negedge ras_n)
		addr[9:0] <= ma[9:0];

	assign cas_n = ucas_n & lcas_n;
	always @(negedge cas_n)
	begin
		addr[19:10] <= ma[9:0];
	end

	always @(posedge cas_n, negedge cas_n)
		ready <= ~cas_n; // to introduce delta-cycle in ready to allow capturing of CAS address before proceeding data


	assign idle = ras_n & cas_n;

	always @(negedge ras_n, posedge idle)
	begin
		if( idle )
			was_ras <= 1'b0;
		else // negedge ras_n
			was_ras <= 1'b1;
	end

	always @(negedge cas_n, posedge idle)
	begin
		if( idle )
			was_cas <= 1'b0;
		else
			if( was_ras )
				was_cas <= 1'b1;
	end





	assign d = dout;

	always @*
	begin
		if( ready && was_ras && was_cas && we_n && (~idle) ) // idle here is to prevent races at the end of all previous signals, which cause redundant read at the end of write
		begin
			dout = array[addr];
`ifdef DRAMMEM_VERBOSE
			if( _verbose_ == 1 )
			begin
				if( addr != _filter_out_ )
					$display("DRAM read at %t: ($%h)=>$%h",$time,addr*2+_add_to_addr_,dout);
			end
`endif
		end
		else
		begin
			dout = 16'hZZZZ;
		end
	end


	always @*
		if( ready && was_ras && was_cas && (~we_n) && (~idle) )
		begin
			if( ~ucas_n )
				array[addr][15:8] = d[15:8];

			if( ~lcas_n )
				array[addr][7:0] = d[7:0];

`ifdef DRAMMEM_VERBOSE
			if( _verbose_ == 1 )
			begin
				if( addr != _filter_out_ )
					$display("DRAM written at %t: ($%h)<=$%h.$%h",$time,addr*2+_add_to_addr_,ucas_n?8'hXX:d[15:8],lcas_n?8'hXX:d[7:0]);
			end
`endif
		end




endmodule

