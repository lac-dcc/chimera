// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

/*

reset...init...save.start_write.stop_write.restore.start_read(compare).stop_read.loop

error...

*/

module tester
(
	input         clk,
	input         rst_n,

	input  [1:0]  sz,
	input  [1:0]  chip,

	output reg [31:0] passcount,
	output reg [31:0] failcount,

	output        DRAM_CLK,
	inout  [15:0] DRAM_DQ,
	output [12:0] DRAM_ADDR,
	output        DRAM_LDQM,DRAM_UDQM,
	output        DRAM_WE_N,
	output        DRAM_CAS_N,
	output        DRAM_RAS_N,
	output        DRAM_CS_N,
	output        DRAM_BA_0,
	output        DRAM_BA_1
);


reg rnd_save,rnd_restore; // rnd_vec_gen control
wire [15:0] rnd_out; // rnd_vec_gen output

rnd_vec_gen my_rnd
(
	.clk(clk),
	.next(dram_ready),
	.save(rnd_save),
	.restore(rnd_restore),
	.out(rnd_out)
);


reg dram_start,dram_rnw;
wire dram_done,dram_ready;
wire [15:0] dram_rdat;

sdram my_dram
(
	.rst_n(sdram_rst_n),
	.clk(clk),
	.sz(sz),
	.chip(chip),
	.start(dram_start),
	.rnw(dram_rnw),
	.done(dram_done),
	.ready(dram_ready),
	.rdat(dram_rdat),
	.wdat(rnd_out),
	.DRAM_CLK(DRAM_CLK),
	.DRAM_DQ(DRAM_DQ),
	.DRAM_ADDR(DRAM_ADDR),
	.DRAM_CS_N(DRAM_CS_N),
	.DRAM_RAS_N(DRAM_RAS_N),
	.DRAM_CAS_N(DRAM_CAS_N),
	.DRAM_WE_N(DRAM_WE_N),
	.DRAM_LDQM(DRAM_LDQM),
	.DRAM_UDQM(DRAM_UDQM),
	.DRAM_BA_0(DRAM_BA_0),
	.DRAM_BA_1(DRAM_BA_1)
);


// FSM states and registers
reg [3:0] curr_state,next_state;

localparam RESET        = 4'h0;
localparam INIT1        = 4'h1;
localparam INIT2        = 4'h2;
localparam BEGIN_WRITE1 = 4'h3;
localparam BEGIN_WRITE2 = 4'h4;
localparam BEGIN_WRITE3 = 4'h5;
localparam BEGIN_WRITE4 = 4'h6;
localparam WRITE        = 4'h7;
localparam BEGIN_READ1  = 4'h8;
localparam BEGIN_READ2  = 4'h9;
localparam BEGIN_READ3  = 4'hA;
localparam BEGIN_READ4  = 4'hB;
localparam READ         = 4'hC;
localparam END_READ     = 4'hD;
localparam INC_PASSES   = 4'hE;


// FSM dispatcher

always @* begin
	case( curr_state )

		RESET:   next_state <= INIT1;
		INIT1:
				if( dram_done )
					next_state <= INIT2;
				else
					next_state <= INIT1;

		INIT2:        next_state <= BEGIN_WRITE1;
		BEGIN_WRITE1: next_state <= BEGIN_WRITE2;
		BEGIN_WRITE2: next_state <= BEGIN_WRITE3;
		BEGIN_WRITE3: next_state <= BEGIN_WRITE4;
		BEGIN_WRITE4: next_state <= WRITE;
		WRITE:
				if( dram_done )
					next_state <= BEGIN_READ1;
				else
					next_state <= WRITE;

		BEGIN_READ1: next_state <= BEGIN_READ2;
		BEGIN_READ2: next_state <= BEGIN_READ3;
		BEGIN_READ3: next_state <= BEGIN_READ4;
		BEGIN_READ4: next_state <= READ;
		READ:
				if( dram_done )
				  next_state <= END_READ;
				else
				  next_state <= READ;

		END_READ:    next_state <= INC_PASSES;
		INC_PASSES:  next_state <= BEGIN_WRITE1;

		default: next_state <= RESET;
	endcase
end


// FSM controller
reg sdram_rst_n = 0;
always @(posedge clk) begin : fsm_controller_block
	reg        check_in_progress; // when 1 - enables errors checking
	reg        reset_req = 1;
	reg [31:0] rst_cnt;

	if (check_in_progress & dram_ready & (dram_rdat!=rnd_out)) failcount <= failcount + 1;
	 
	curr_state <= ( reset_req & dram_done ) ? RESET : next_state;
	if(~rst_n) begin
		reset_req <= 1;
		rst_cnt <= 0;
	end
	
	if(~rst_n || reset_req) begin
		check_in_progress <= 0;
		passcount <= 0;
		failcount <= 0;
	end

	case( curr_state )

	//////////////////////////////////////////////////
	RESET: begin
		// various initializings begin

		check_in_progress <= 0;

		rnd_save <= 0;
		rnd_restore <= 0;

		dram_start <= 0;
		reset_req <= 0;
		sdram_rst_n <= 0;
		rst_cnt <= 0;
		if(rst_cnt < 5000000) begin
			rst_cnt <= rst_cnt + 1;
			curr_state <= RESET;
		end
	end

	INIT1: begin
		dram_start  <= 0; // end dram start
		sdram_rst_n <= 1;
	end

	//////////////////////////////////////////////////
	BEGIN_WRITE1: begin
		rnd_save <= 1;
		dram_rnw <= 0;
	end

	BEGIN_WRITE2: begin
		rnd_save   <= 0;
		dram_start <= 1;
	end

	BEGIN_WRITE3: begin
		dram_start <= 0;
	end

	//////////////////////////////////////////////////
	BEGIN_READ1: begin
		rnd_restore <= 1;
		dram_rnw <= 1;
	end

	BEGIN_READ2: begin
		rnd_restore <= 0;
		dram_start <= 1;
	end

	BEGIN_READ3: begin
		dram_start <= 0;
		check_in_progress <= 1;
	end

	END_READ: begin
		check_in_progress <= 0;
	end

	INC_PASSES: begin
		passcount <= passcount + 1;
	end

	endcase
end

endmodule
