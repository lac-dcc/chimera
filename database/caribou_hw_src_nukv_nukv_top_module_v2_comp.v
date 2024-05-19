// This program was cloned from: https://github.com/fpgasystems/caribou
// License: GNU General Public License v3.0

//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------


`default_nettype none

module nukv_Top_Module_v2_Comp #(	
	parameter META_WIDTH = 96,
	parameter VALUE_WIDTH = 512,
	parameter MEMORY_WIDTH = 512,
	parameter KEY_WIDTH = 128,
	parameter HEADER_WIDTH = 42,	
    parameter HASHTABLE_MEM_SIZE = 24,
    parameter VALUESTORE_MEM_SIZE = 25,
    parameter SUPPORT_SCANS = 1,
    parameter DECOMPRESS_ENGINES = 16,
    parameter CONDITION_EVALS = 4,
    parameter REGEX_ENABLED = 1,
	parameter IS_SIM = 0
)(
	// Clock
	input wire         clk,    
	input wire         rst,

	
	// Memcached Request Input
	input  wire [127:0] s_axis_tdata,
	input  wire         s_axis_tvalid,
	input wire 			s_axis_tlast,
	output wire         s_axis_tready,

	// Memcached Response Output
	output wire [127:0] m_axis_tdata,
	output wire         m_axis_tvalid,
	output wire 		m_axis_tlast,
	input  wire         m_axis_tready,

	// HashTable DRAM Connection

	// ht_rd:     Pull Input, 1536b
	input  wire [511:0] ht_rd_data,
	input  wire          ht_rd_empty,
	input  wire          ht_rd_almost_empty,
	output wire          ht_rd_read,

	// ht_rd_cmd: Push Output, 10b
	output wire [63:0] ht_rd_cmd_data,
	output wire        ht_rd_cmd_valid,
	input  wire        ht_rd_cmd_stall,

	// ht_wr:     Push Output, 1536b
	output wire [511:0] ht_wr_data,
	output wire          ht_wr_valid,
	input  wire          ht_wr_stall,

	// ht_wr_cmd: Push Output, 10b
	output wire [63:0] ht_wr_cmd_data,
	output wire        ht_wr_cmd_valid,
	input  wire        ht_wr_cmd_stall,

	// Update DRAM Connection

	// upd_rd:     Pull Input, 1536b
	input  wire [MEMORY_WIDTH-1:0] upd_rd_data,
	input  wire          upd_rd_empty,
	input  wire          upd_rd_almost_empty,
	output wire          upd_rd_read,

	// upd_rd_cmd: Push Output, 10b
	output wire [63:0] upd_rd_cmd_data,
	output wire        upd_rd_cmd_valid,
	input  wire        upd_rd_cmd_stall,

	// upd_wr:     Push Output, 1536b
	output wire [511:0] upd_wr_data,
	output wire          upd_wr_valid,
	input  wire          upd_wr_stall,

	// upd_wr_cmd: Push Output, 10b
	output wire [63:0] upd_wr_cmd_data,
	output wire        upd_wr_cmd_valid,
	input  wire        upd_wr_cmd_stall,

	output wire [63:0] p_rdcmd_data,
	output wire         p_rdcmd_valid,
	input  wire         p_rdcmd_ready,

	input wire [512-1:0]  p_rd_data,
	input wire         p_rd_valid,
	output  wire         p_rd_ready,	

	output wire [512-1:0] p_wr_data,
	output wire         p_wr_valid,
	input  wire         p_wr_ready,

	output wire [63:0] p_wrcmd_data,
	output wire         p_wrcmd_valid,
	input  wire         p_wrcmd_ready,


	output wire [63:0] b_rdcmd_data,
	output wire         b_rdcmd_valid,
	input  wire         b_rdcmd_ready,

	input wire [512-1:0]  b_rd_data,
	input wire         b_rd_valid,
	output  wire         b_rd_ready,	

	output wire [512-1:0] b_wr_data,
	output wire         b_wr_valid,
	input  wire         b_wr_ready,

	output wire [63:0] b_wrcmd_data,
	output wire         b_wrcmd_valid,
	input  wire         b_wrcmd_ready,
	
	output wire [7:0]        debug
);


wire [31:0] rdcmd_data;
wire        rdcmd_valid;
wire        rdcmd_stall;
wire        rdcmd_ready;

wire [31:0] wrcmd_data;
wire        wrcmd_valid;
wire        wrcmd_stall;
wire        wrcmd_ready;


wire [39:0] upd_rdcmd_data;
wire        upd_rdcmd_ready;

wire [39:0] upd_wrcmd_data;
wire        upd_wrcmd_ready;

wire [15:0] mreq_data;
wire mreq_valid;
wire mreq_ready;

wire [15:0] mreq_data_b;
wire mreq_valid_b;
wire mreq_ready_b;

wire [31:0] malloc_data;
wire malloc_valid;
wire malloc_failed;
wire malloc_ready;

wire [31:0] free_data;
wire [15:0] free_size;
wire free_valid;
wire free_ready;
wire free_wipe;

wire [31:0] malloc_data_b;
wire [31+1:0] malloc_data_full_b;
wire malloc_valid_b;
wire malloc_failed_b;
wire malloc_ready_b;

wire [31+16+1:0] free_data_full_b;
wire [31:0] free_data_b;
wire [15:0] free_size_b;
wire free_valid_b;
wire free_ready_b;
wire free_wipe_b;

wire [63:0] key_data;
wire key_last;
wire key_valid;
wire key_ready;

wire [META_WIDTH-1:0] meta_data;
wire meta_valid;
wire meta_ready;


wire [1+63:0] tohash_data;
wire tohash_valid;
wire tohash_ready;

wire [31:0] fromhash_data;
wire fromhash_valid;
wire fromhash_ready;

wire [63:0] hash_one_data;
wire hash_one_valid;
wire hash_one_ready;

wire[31:0] secondhash_data;
wire secondhash_valid;
wire secondhash_ready;

wire[63:0] hash_two_data;
wire hash_two_valid;
wire hash_two_ready;

reg [KEY_WIDTH-1:0] widekey_assembly;
reg [KEY_WIDTH-1:0] widekey_data;
reg widekey_valid;
wire widekey_ready;

wire [KEY_WIDTH-1:0] widekey_b_data;
wire widekey_b_valid;
wire widekey_b_ready;


wire [META_WIDTH-1:0] meta_b_data;
wire meta_b_valid;
wire meta_b_ready;

wire [KEY_WIDTH+META_WIDTH+64-1:0] keywhash_data;
wire keywhash_valid;
wire keywhash_ready;

wire [KEY_WIDTH+META_WIDTH+64-1:0] towrite_b_data;
wire towrite_b_valid;
wire towrite_b_ready;

wire [KEY_WIDTH+META_WIDTH+64-1:0] writeout_data;
wire writeout_valid;
wire writeout_ready;

wire [KEY_WIDTH+META_WIDTH+HEADER_WIDTH-1:0] writeout_b_data;
wire writeout_b_valid;
wire writeout_b_ready;

wire [KEY_WIDTH+META_WIDTH+HEADER_WIDTH-1:0] fromset_data;
wire fromset_valid;
wire fromset_ready;

wire [KEY_WIDTH+META_WIDTH+HEADER_WIDTH-1:0] fromset_b_data;
wire fromset_b_valid;
wire fromset_b_ready;

wire [KEY_WIDTH+META_WIDTH+64-1:0] towrite_data;
wire towrite_valid;
wire towrite_ready;

wire [KEY_WIDTH+META_WIDTH+64-1:0] writefb_data;
wire writefb_valid;
wire writefb_ready;


wire [KEY_WIDTH+META_WIDTH+64-1:0] writefb_b_data;
wire writefb_b_valid;
wire writefb_b_ready;

wire [KEY_WIDTH+META_WIDTH+64-1:0] feedbwhash_data;
wire feedbwhash_valid;
wire feedbwhash_ready;

wire [VALUE_WIDTH-1:0] value_data;
wire [15:0] value_length;
wire value_last;
wire value_valid;
wire value_ready;
wire value_almost_full;

wire [VALUE_WIDTH+16+1-1:0] value_b_data;
wire [15:0] value_b_length;
wire value_b_last;
wire value_b_valid;
wire value_b_ready;

wire[VALUE_WIDTH-1:0] value_read_data;
wire value_read_valid;
wire value_read_last;
wire value_read_ready;

wire [63:0] setter_rdcmd_data;
wire        setter_rdcmd_valid;
wire        setter_rdcmd_ready;

wire [63:0] scan_rdcmd_data;
wire        scan_rdcmd_valid;
wire        scan_rdcmd_ready;

wire scan_kickoff;
wire scan_reading;
reg scan_mode_on;
reg rst_regex_after_scan;
wire [31:0] scan_readsissued;
reg [31:0] scan_readsprocessed;
wire scan_valid;
wire[31:0] scan_addr;
wire[7:0] scan_cnt;
wire scan_ready;

wire pe_cmd_ready;
wire pe_cmd_valid;
wire[15:0] pe_cmd_data;
wire[95:0] pe_cmd_meta;


wire [511:0] value_frompred_data;
wire        value_frompred_ready;
wire        value_frompred_valid;
wire        value_frompred_drop;
wire        value_frompred_last;

wire [511:0] value_frompipe_data;
wire        value_frompipe_ready;
wire        value_frompipe_valid;
wire        value_frompipe_drop;
wire        value_frompipe_last;

wire [511:0] value_frompred_b_data;
wire        value_frompred_b_ready;
wire        value_frompred_b_valid;

wire value_read_almostfull_int;
reg scan_pause;


wire sh_in_buf_ready;
wire sh_in_ready;
wire sh_in_valid;
wire sh_in_choice;
wire[63:0] sh_in_data;

wire hash_two_in_ready;
wire write_feedback_channel_ready;

   reg[31:0]                    input_counter;

wire[127:0] input_buf_data;
wire input_buf_last;
wire input_buf_valid;
wire input_buf_ready;

wire[127:0] final_out_data;
wire final_out_valid;
wire final_out_ready;
wire final_out_last;

wire decision_is_valid;
wire decision_is_drop;
wire read_decision;

wire clk_faster; // 2*156MHz Clock for regex
wire clkout0;
wire fbclk;
wire fclk_locked;
reg  frst = 1;
reg rst_faster = 1;

PLLE2_BASE #(
  .BANDWIDTH("OPTIMIZED"),  // OPTIMIZED, HIGH, LOW
  .CLKFBOUT_MULT(10),        // Multiply value for all CLKOUT, (2-64)
  .CLKFBOUT_PHASE(0.0),     // Phase offset in degrees of CLKFB, (-360.000-360.000).
  .CLKIN1_PERIOD(6.400),      // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
  // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
  .CLKOUT0_DIVIDE(5),
  .CLKOUT1_DIVIDE(1),
  .CLKOUT2_DIVIDE(1),
  .CLKOUT3_DIVIDE(1),
  .CLKOUT4_DIVIDE(1),
  .CLKOUT5_DIVIDE(1),
  // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
  .CLKOUT0_DUTY_CYCLE(0.5),
  .CLKOUT1_DUTY_CYCLE(0.5),
  .CLKOUT2_DUTY_CYCLE(0.5),
  .CLKOUT3_DUTY_CYCLE(0.5),
  .CLKOUT4_DUTY_CYCLE(0.5),
  .CLKOUT5_DUTY_CYCLE(0.5),
  // CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
  .CLKOUT0_PHASE(0.0),
  .CLKOUT1_PHASE(0.0),
  .CLKOUT2_PHASE(0.0),
  .CLKOUT3_PHASE(0.0),
  .CLKOUT4_PHASE(0.0),
  .CLKOUT5_PHASE(0.0),
  .DIVCLK_DIVIDE(1),        // Master division value, (1-56)
  .REF_JITTER1(0.0),        // Reference input jitter in UI, (0.000-0.999).
  .STARTUP_WAIT("FALSE")    // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
)
PLLE2_BASE_inst (
  // Clock Outputs: 1-bit (each) output: User configurable clock outputs
  .CLKOUT0(clk_faster),   // 1-bit output: CLKOUT0
  .CLKOUT1(),   // 1-bit output: CLKOUT1
  .CLKOUT2(),   // 1-bit output: CLKOUT2
  .CLKOUT3(),   // 1-bit output: CLKOUT3
  .CLKOUT4(),   // 1-bit output: CLKOUT4
  .CLKOUT5(),   // 1-bit output: CLKOUT5
  // Feedback Clocks: 1-bit (each) output: Clock feedback ports
  .CLKFBOUT(fbclk), // 1-bit output: Feedback clock
  .LOCKED(fclk_locked),     // 1-bit output: LOCK
  .CLKIN1(clk),     // 1-bit input: Input clock
  // Control Ports: 1-bit (each) input: PLL control ports
  .PWRDWN(1'b0),     // 1-bit input: Power-down
  .RST(1'b0),           // 1-bit input: Reset
  // Feedback Clocks: 1-bit (each) input: Clock feedback ports
  .CLKFBIN(fbclk)    // 1-bit input: Feedback clock
);

reg rst_regd;

always @(posedge clk) begin
    rst_regd <= rst;
end


reg rst_faster0;
reg lockedx;

always @(posedge clk_faster) begin     
    frst <= rst_regd;    
    rst_faster0 <= frst;

    lockedx <= ~fclk_locked;

    rst_faster <= rst_faster0 | lockedx;
end


nukv_fifogen #(
    .DATA_SIZE(129),
    .ADDR_BITS(8)
) fifo_inputbuf (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata({s_axis_tdata,s_axis_tlast}),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    
    .m_axis_tdata({input_buf_data,input_buf_last}),
    .m_axis_tvalid(input_buf_valid),
    .m_axis_tready(input_buf_ready)
);


nukv_RequestSplit  #(
    .SPECIAL_ARE_UPDATES(0)
    )
    splitter
    (
	.clk(clk),
	.rst(rst),
	.s_axis_tdata(input_buf_data),
	.s_axis_tvalid(input_buf_valid),
	.s_axis_tready(input_buf_ready),
	.s_axis_tlast(input_buf_last),


	.key_data(key_data),
	.key_valid(key_valid),
	.key_last(key_last),
	.key_ready(key_ready),

	.meta_data(meta_data),
	.meta_valid(meta_valid),
	.meta_ready(meta_ready),

	.value_data(value_data),
	.value_valid(value_valid),
	.value_length(value_length),
	.value_last(value_last),
	.value_ready(value_ready),
	.value_almost_full(value_almost_full),

	.malloc_data(),
	.malloc_valid(),
	.malloc_ready(1'b1),

	._debug()
);


nukv_fifogen #(
    .DATA_SIZE(VALUE_WIDTH+16+1),
    .ADDR_BITS(10)
) fifo_value (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata({value_last, value_length, value_data}),
    .s_axis_tvalid(value_valid),
    .s_axis_tready(value_ready),
    .s_axis_talmostfull(value_almost_full),
    
    .m_axis_tdata(value_b_data),
    .m_axis_tvalid(value_b_valid),
    .m_axis_tready(value_b_ready)
);

assign value_b_length = value_b_data[VALUE_WIDTH +: 16];
assign value_b_last = value_b_data[VALUE_WIDTH+16];

nukv_fifogen #(
    .DATA_SIZE(META_WIDTH),
    .ADDR_BITS(8)
) fifo_meta_delayer (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(meta_data),
    .s_axis_tvalid(meta_valid),
    .s_axis_tready(meta_ready),
    
    .m_axis_tdata(meta_b_data),
    .m_axis_tvalid(meta_b_valid),
    .m_axis_tready(meta_b_ready)
);

wire hash_one_in_ready;

assign key_ready = hash_one_in_ready & widekey_ready;

kvs_ht_Hash_v2 #(
        .MEMORY_WIDTH(HASHTABLE_MEM_SIZE)
    ) hash_number_one (
        .clk(clk),
        .rst(rst),

        .in_valid(key_valid & widekey_ready),
        .in_ready(hash_one_in_ready),
        .in_data(key_data),
        .in_last(key_last),

        .out_valid(hash_one_valid),
        .out_ready(hash_one_ready | ~hash_one_valid),
        .out_data1(hash_one_data[31:0]),
        .out_data2(hash_one_data[63:32])
    );



always @(posedge clk) begin
	if (rst) begin
		widekey_data <= 0;
		widekey_assembly <= 0;
		widekey_valid <= 0;				
	end
	else begin
		if (widekey_valid==1 && widekey_ready==1) begin
			widekey_valid <= 0;
		end 

		if (widekey_valid==0 && widekey_ready==1 && key_valid==1 && hash_one_in_ready==1) begin

			if (widekey_assembly==0) begin
				widekey_assembly[63:0] <= key_data;
			end else begin
				widekey_assembly <= {widekey_assembly[KEY_WIDTH-64-1:0],key_data};
			end

			if (key_last==1) begin
				widekey_data <= {widekey_assembly[KEY_WIDTH-64-1:0],key_data};
				widekey_valid <= 1;
				widekey_assembly <= 0;
			end
		end
	end
end

nukv_fifogen #(
    .DATA_SIZE(KEY_WIDTH),
    .ADDR_BITS(6)
) fifo_widekey_delayer (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(widekey_data),
    .s_axis_tvalid(widekey_valid),
    .s_axis_tready(widekey_ready),
    
    .m_axis_tdata(widekey_b_data),
    .m_axis_tvalid(widekey_b_valid),
    .m_axis_tready(widekey_b_ready)
);

assign keywhash_valid = widekey_b_valid & hash_one_valid & meta_b_valid;
assign widekey_b_ready = keywhash_ready & keywhash_valid ;
assign hash_one_ready = keywhash_ready & keywhash_valid;
assign meta_b_ready = keywhash_ready & keywhash_valid;
assign keywhash_data = {hash_one_data,meta_b_data,widekey_b_data};


kvs_ht_Hash_v2 #(
        .MEMORY_WIDTH(HASHTABLE_MEM_SIZE)
    ) hash_number_two (
        .clk(clk),
        .rst(rst),

        .in_valid(writefb_valid & write_feedback_channel_ready),
        .in_ready(hash_two_in_ready),
        .in_data(writefb_data[63:0]),
        .in_last(1'b1),

        .out_valid(hash_two_valid),
        .out_ready(hash_two_ready | ~hash_two_valid),
        .out_data1(hash_two_data[31:0]),
        .out_data2(hash_two_data[63:32])
    );


assign feedbwhash_data = {hash_two_data, writefb_b_data[KEY_WIDTH+META_WIDTH-1:0]};
assign feedbwhash_valid = writefb_b_valid & hash_two_valid;

assign hash_two_ready = feedbwhash_ready & feedbwhash_valid;
assign writefb_b_ready = feedbwhash_ready & feedbwhash_valid;

nukv_HT_Read_v2 #(
        .MEMADDR_WIDTH(HASHTABLE_MEM_SIZE)
    )
    readmodule
(
   	.clk(clk),
   	.rst(rst),

   	.input_data(keywhash_data),
   	.input_valid(keywhash_valid),    
   	.input_ready(keywhash_ready),

   	.feedback_data(feedbwhash_data),
   	.feedback_valid(feedbwhash_valid),
   	.feedback_ready(feedbwhash_ready),

   	.output_data(towrite_data),
   	.output_valid(towrite_valid),
   	.output_ready(towrite_ready),

   	.rdcmd_data(rdcmd_data),
   	.rdcmd_valid(rdcmd_valid),
   	.rdcmd_ready(rdcmd_ready)
);

wire[VALUE_WIDTH-1:0] ht_buf_rd_data;
wire ht_buf_rd_ready;
wire ht_buf_rd_valid;

wire ht_rd_ready;
wire ht_rd_almostfull;
wire ht_rd_isvalid;

assign ht_rd_read = ~ht_rd_almostfull & ht_rd_ready & ~ht_rd_empty;
assign ht_rd_isvalid = ~ht_rd_empty & ht_rd_read;


wire[VALUE_WIDTH-1:0] ht_read_data_int;
wire ht_read_valid_int;
wire ht_read_ready_int;

nukv_fifogen #(
    .DATA_SIZE(VALUE_WIDTH),
    .ADDR_BITS(7)
) fifo_ht_rd (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(ht_rd_data),
    .s_axis_tvalid(ht_rd_isvalid),
    .s_axis_tready(ht_rd_ready),
    .s_axis_talmostfull(ht_rd_almostfull),

    .m_axis_tdata(ht_buf_rd_data),
    .m_axis_tvalid(ht_buf_rd_valid),
    .m_axis_tready(ht_buf_rd_ready)
    
    //.m_axis_tdata(ht_read_data_int),
    //.m_axis_tvalid(ht_read_valid_int),
    //.m_axis_tready(ht_read_ready_int)
);

/*
nukv_fifogen #(
    .DATA_SIZE(VALUE_WIDTH),
    .ADDR_BITS(6)
) fifo_ht_rd2 (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(ht_read_data_int),
    .s_axis_tvalid(ht_read_valid_int),
    .s_axis_tready(ht_read_ready_int),
    
    .m_axis_tdata(ht_buf_rd_data),
    .m_axis_tvalid(ht_buf_rd_valid),
    .m_axis_tready(ht_buf_rd_ready)
);
*/

nukv_fifogen #(
    .DATA_SIZE(KEY_WIDTH+META_WIDTH+64),
    .ADDR_BITS(6)
) fifo_towrite_delayer (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(towrite_data),
    .s_axis_tvalid(towrite_valid),
    .s_axis_tready(towrite_ready),
    
    .m_axis_tdata(towrite_b_data),
    .m_axis_tvalid(towrite_b_valid),
    .m_axis_tready(towrite_b_ready)
);

nukv_fifogen #(
    .DATA_SIZE(KEY_WIDTH+META_WIDTH+64),
    .ADDR_BITS(6)
) fifo_feedback_delayer (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(writefb_data),
    .s_axis_tvalid(writefb_valid & write_feedback_channel_ready),
    .s_axis_tready(writefb_ready),
    
    .m_axis_tdata(writefb_b_data),
    .m_axis_tvalid(writefb_b_valid),
    .m_axis_tready(writefb_b_ready)
);

assign write_feedback_channel_ready = writefb_ready & hash_two_in_ready;

nukv_HT_Write_v2 #(
    .IS_SIM(IS_SIM),
    .MEMADDR_WIDTH(HASHTABLE_MEM_SIZE)
    ) 
writemodule 
(
	.clk(clk),
	.rst(rst),

	.input_data(towrite_b_data),
	.input_valid(towrite_b_valid),
	.input_ready(towrite_b_ready),

	.feedback_data(writefb_data),
	.feedback_valid(writefb_valid),
	.feedback_ready(write_feedback_channel_ready),

	.output_data(writeout_data),
	.output_valid(writeout_valid),
	.output_ready(writeout_ready),

    .malloc_req_valid(mreq_valid),
    .malloc_req_size (mreq_data),
    .malloc_req_ready(mreq_ready),

	.malloc_pointer(malloc_data_b),
	.malloc_valid(malloc_valid_b),
	.malloc_failed(malloc_failed_b),
	.malloc_ready(malloc_ready_b),

	.free_pointer(free_data),
	.free_size(free_size),
	.free_valid(free_valid),
	.free_ready(free_ready),
	.free_wipe(free_wipe),

	.rd_data(ht_buf_rd_data),
	.rd_valid(ht_buf_rd_valid),
	.rd_ready(ht_buf_rd_ready),

	.wr_data(ht_wr_data),
	.wr_valid(ht_wr_valid),
	.wr_ready(~ht_wr_stall),

	.wrcmd_data(wrcmd_data),
	.wrcmd_valid(wrcmd_valid),
	.wrcmd_ready(wrcmd_ready)

);    

nukv_fifogen #(
    .DATA_SIZE(49),
    .ADDR_BITS(6)
) fifo_freepointers (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata({free_wipe,free_data,free_size}),
    .s_axis_tvalid(free_valid),
    .s_axis_tready(free_ready),
    
    .m_axis_tdata(free_data_full_b),
    .m_axis_tvalid(free_valid_b),
    .m_axis_tready(free_ready_b)
);
assign free_wipe_b = free_data_full_b[32+16];
assign free_data_b = free_data_full_b[32+16-1:16];
assign free_size_b = free_data_full_b[15:0];

nukv_fifogen #(
    .DATA_SIZE(65),
    .ADDR_BITS(6)
) fifo_mallocpointers (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata({malloc_failed,malloc_data}),
    .s_axis_tvalid(malloc_valid),
    .s_axis_tready(malloc_ready),
    
    .m_axis_tdata(malloc_data_full_b),
    .m_axis_tvalid(malloc_valid_b),
    .m_axis_tready(malloc_ready_b)
);

assign malloc_failed_b = malloc_data_full_b[32];
assign malloc_data_b = malloc_data_full_b[31:0];

wire [31:0] p_rdcmd_data_short;
wire [31:0] p_wrcmd_data_short;
wire [31:0] b_rdcmd_data_short;
wire [7:0]  b_rdcmd_cnt;
wire [31:0] b_wrcmd_data_short;


nukv_fifogen #(
    .DATA_SIZE(16),
    .ADDR_BITS(6)
) fifo_malloc_request (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(mreq_data),
    .s_axis_tvalid(mreq_valid),
    .s_axis_tready(mreq_ready),
    
    .m_axis_tdata(mreq_data_b),
    .m_axis_tvalid(mreq_valid_b),
    .m_axis_tready(mreq_ready_b)
);
/*
wire[511:0] p_rd_data_b;
wire p_rd_ready_b;
wire p_rd_valid_b;

nukv_fifogen #(
    .DATA_SIZE(512),
    .ADDR_BITS(6)
) fifo_pread_data (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(p_rd_data),
    .s_axis_tvalid(p_rd_valid),
    .s_axis_tready(p_rd_ready),
    
    .m_axis_tdata(p_rd_data_b),
    .m_axis_tvalid(p_rd_valid_b),
    .m_axis_tready(p_rd_ready_b)
);*/
/*
wire[511:0] b_rd_data_b;
wire b_rd_ready_b;
wire b_rd_valid_b;

nukv_fifogen #(
    .DATA_SIZE(512),
    .ADDR_BITS(6)
) fifo_bread_data (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(b_rd_data),
    .s_axis_tvalid(b_rd_valid),
    .s_axis_tready(b_rd_ready),
    
    .m_axis_tdata(b_rd_data_b),
    .m_axis_tvalid(b_rd_valid_b),
    .m_axis_tready(b_rd_ready_b)
);*/

wire malloc_error_valid;
wire[7:0] malloc_error_state;

nukv_Malloc #(
				.IS_SIM(IS_SIM), 
				.SUPPORT_SCANS(SUPPORT_SCANS),
                .MAX_MEMORY_SIZE(VALUESTORE_MEM_SIZE)
	) 
	mallocmodule
    (
	.clk(clk),
	.rst(rst),

	.req_data(mreq_data_b),
	.req_valid(mreq_valid_b),
	.req_ready(mreq_ready_b),

	.malloc_pointer(malloc_data),
	.malloc_valid(malloc_valid),
	.malloc_failed(malloc_failed),
	.malloc_ready(malloc_ready),

	.free_pointer(free_data_b),
	.free_size(free_size_b),
	.free_valid(free_valid_b),
	.free_ready(free_ready_b),
	.free_wipe(free_wipe_b),

	.p_rdcmd_data(p_rdcmd_data_short),
	.p_rdcmd_valid(p_rdcmd_valid),
	.p_rdcmd_ready(p_rdcmd_ready),

	.p_rd_data(p_rd_data),
	.p_rd_valid(p_rd_valid),
	.p_rd_ready(p_rd_ready),	

	.p_wr_data(p_wr_data),
	.p_wr_valid(p_wr_valid),
	.p_wr_ready(p_wr_ready),

	.p_wrcmd_data(p_wrcmd_data_short),
	.p_wrcmd_valid(p_wrcmd_valid),
	.p_wrcmd_ready(p_wrcmd_ready),


	.b_rdcmd_data(b_rdcmd_data_short),
    .b_rdcmd_cnt(b_rdcmd_cnt),
	.b_rdcmd_valid(b_rdcmd_valid),
	.b_rdcmd_ready(b_rdcmd_ready),

	.b_rd_data(b_rd_data),
	.b_rd_valid(b_rd_valid),
	.b_rd_ready(b_rd_ready),	

	.b_wr_data(b_wr_data),
	.b_wr_valid(b_wr_valid),
	.b_wr_ready(b_wr_ready),

	.b_wrcmd_data(b_wrcmd_data_short),
	.b_wrcmd_valid(b_wrcmd_valid),
	.b_wrcmd_ready(b_wrcmd_ready),

	.scan_start(scan_kickoff),

	.is_scanning(scan_reading),
	.scan_numlines(scan_readsissued),

	.scan_valid(scan_valid),
	.scan_addr(scan_addr),
	.scan_cnt(scan_cnt),
	.scan_ready(scan_ready),

	.scan_pause(SUPPORT_SCANS==1 ? scan_pause : 0),

    .error_memory(malloc_error_valid),
    .error_state(malloc_error_state)
);


always @(posedge clk) begin
	if (SUPPORT_SCANS==1) begin

		if (rst) begin
			scan_mode_on <= 0;		
			scan_readsprocessed <= 0;
			rst_regex_after_scan <= 0;
		end
		else begin
		      rst_regex_after_scan <= 0;
		
		  
			if (scan_mode_on==0 && scan_reading==1) begin
				scan_mode_on <= 1;
				scan_readsprocessed <= 0;
			end

      // this only works if all values are <64B!!!
			if (scan_mode_on==1 && decision_is_valid==1 && read_decision==1) begin
				scan_readsprocessed <= scan_readsprocessed +1;
			end

			if (scan_mode_on==1 && scan_reading==0 && scan_readsprocessed==scan_readsissued) begin
				scan_mode_on <= 0;
				rst_regex_after_scan <= 1;
			end
		end


	end else begin
		scan_mode_on <= 0;
		rst_regex_after_scan <= 0;
	end
end

assign scan_ready = scan_rdcmd_ready;
assign scan_rdcmd_valid = scan_valid;
assign scan_rdcmd_data = {scan_cnt, scan_addr};

assign b_rdcmd_data ={24'b000000000000000100000001, b_rdcmd_cnt[7:0], 4'b0000, b_rdcmd_data_short[27:0]};
assign b_wrcmd_data ={24'b000000000000000100000001, 8'b00000001, 4'b0000, b_wrcmd_data_short[27:0]};
assign p_rdcmd_data ={24'b000000000000000100000001, 8'b00000001, 4'b0000, p_rdcmd_data_short[27:0]};
assign p_wrcmd_data ={24'b000000000000000100000001, 8'b00000001, 4'b0000, p_wrcmd_data_short[27:0]};




assign ht_rd_cmd_data ={24'b000000000000000100000001, 8'b00000001, 4'b0000, 4'b0000, rdcmd_data[23:0]};
assign ht_rd_cmd_valid = rdcmd_valid;
assign rdcmd_ready = ~ht_rd_cmd_stall;

assign ht_wr_cmd_data ={24'b000000000000000100000001, 8'b00000001, 4'b0000, 4'b0000, wrcmd_data[23:0]};
assign ht_wr_cmd_valid = wrcmd_valid;
assign wrcmd_ready = ~ht_wr_cmd_stall;

nukv_fifogen #(
    .DATA_SIZE(KEY_WIDTH+META_WIDTH+42),
    .ADDR_BITS(5)
) fifo_write_to_set (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata({writeout_data[KEY_WIDTH +: META_WIDTH], writeout_data[KEY_WIDTH+META_WIDTH +: 42], writeout_data[KEY_WIDTH-1:0]}),
    .s_axis_tvalid(writeout_valid),
    .s_axis_tready(writeout_ready),
    
    .m_axis_tdata(writeout_b_data),
    .m_axis_tvalid(writeout_b_valid),
    .m_axis_tready(writeout_b_ready)
);


wire predconf_valid;
wire predconf_scan;
wire predconf_ready;
wire[96+511:0] predconf_data;

wire predconf_b_valid;
wire predconf_b_scan;
wire predconf_b_ready;
wire[96+511:0] predconf_b_data;
wire[1+511+96:0] predconf_b_fulldata;

assign setter_rdcmd_ready = (scan_mode_on == 1 && SUPPORT_SCANS==1) ? 0 : upd_rdcmd_ready;
assign scan_rdcmd_ready = (scan_mode_on == 1 && SUPPORT_SCANS==1) ? upd_rdcmd_ready : 0;

assign upd_rdcmd_data = (scan_mode_on == 1 && SUPPORT_SCANS==1) ? scan_rdcmd_data : setter_rdcmd_data;
assign upd_rd_cmd_valid = (scan_mode_on == 1 && SUPPORT_SCANS==1) ? scan_rdcmd_valid : setter_rdcmd_valid;

nukv_Value_Set #(.SUPPORT_SCANS(SUPPORT_SCANS)) 
	valuesetter
	(
	.clk(clk),
	.rst(rst),

	.input_data(writeout_b_data),
	.input_valid(writeout_b_valid),
	.input_ready(writeout_b_ready),

	.value_data(value_b_data[VALUE_WIDTH-1:0]),
	.value_valid(value_b_valid),
	.value_ready(value_b_ready),

	.output_data(fromset_data),
	.output_valid(fromset_valid),
	.output_ready(fromset_ready),

	.wrcmd_data(upd_wrcmd_data),
	.wrcmd_valid(upd_wr_cmd_valid),
	.wrcmd_ready(upd_wrcmd_ready),

	.wr_data(upd_wr_data),
	.wr_valid(upd_wr_valid),
	.wr_ready(~upd_wr_stall),

	.rdcmd_data(setter_rdcmd_data) ,
	.rdcmd_valid(setter_rdcmd_valid),
	.rdcmd_ready(setter_rdcmd_ready),

	.pe_valid(predconf_valid),
	.pe_scan(predconf_scan),
	.pe_ready(predconf_ready),
	.pe_data(predconf_data),

	.scan_start(scan_kickoff),
	.scan_mode(scan_mode_on)

);




wire[VALUE_WIDTH-1:0] value_read_data_int;
wire value_read_valid_int;
wire value_read_ready_int;
wire value_read_almostfull_int2;



always @(posedge clk) begin
	if (rst) begin
		
		scan_pause <= 0;	
	end
	else begin
		

        if (scan_readsissued>0 && scan_readsissued-scan_readsprocessed> (IS_SIM==1 ? 64 : 200)) begin
            scan_pause <= 1;            
        end else begin
            scan_pause <= 0;
        end
		
	end
end



wire[511:0] value_read_data_buf;
wire value_read_ready_buf;
wire value_read_valid_buf;

wire upd_ready;
assign upd_rd_read = upd_ready & ~upd_rd_empty;





wire toget_ready;
assign fromset_ready = (scan_mode_on==0 || SUPPORT_SCANS==0) ? toget_ready : 0;
assign pe_cmd_ready =  (scan_mode_on==0 || SUPPORT_SCANS==0) ? 0 : toget_ready;

nukv_fifogen #(
    .DATA_SIZE(KEY_WIDTH+META_WIDTH+HEADER_WIDTH),
    .ADDR_BITS(7)
) fifo_output_from_set (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata((scan_mode_on==0 || SUPPORT_SCANS==0) ? fromset_data : {8'b00001111, pe_cmd_meta[0 +: 88], 1'b0, pe_cmd_data[9:0], 159'd0}),
    .s_axis_tvalid((scan_mode_on==0 || SUPPORT_SCANS==0) ? fromset_valid : pe_cmd_valid),
    .s_axis_tready(toget_ready),
    
    .m_axis_tdata(fromset_b_data),
    .m_axis_tvalid(fromset_b_valid),
    .m_axis_tready(fromset_b_ready)
);

wire predconf_regex_ready;
wire predconf_pred0_ready;
wire predconf_predother_ready;
assign predconf_b_ready = predconf_regex_ready & predconf_predother_ready;

nukv_fifogen #(
    .DATA_SIZE(512+96+1),
    .ADDR_BITS(7)
) fifo_output_conf_pe (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata({predconf_data, predconf_scan}),
    .s_axis_tvalid(predconf_valid),
    .s_axis_tready(predconf_ready),
    
    .m_axis_tdata(predconf_b_fulldata),
    .m_axis_tvalid(predconf_b_valid),
    .m_axis_tready(predconf_b_ready)
);

assign predconf_b_scan = predconf_b_fulldata[0];
assign predconf_b_data = predconf_b_fulldata[1 +: 512+96];

wire pred_eval_error;

// begin DECOMP

wire[511:0] decompress_in_data;
wire[DECOMPRESS_ENGINES-1:0] decompress_in_valid;
wire[DECOMPRESS_ENGINES-1:0] decompress_in_ready;

wire[511:0] decompress_interm_data [0:DECOMPRESS_ENGINES-1];
wire[DECOMPRESS_ENGINES-1:0] decompress_interm_valid;
wire[DECOMPRESS_ENGINES-1:0] decompress_interm_ready;

wire[511:0] decompress_out_data[0:DECOMPRESS_ENGINES-1];
wire[DECOMPRESS_ENGINES-1:0] decompress_out_valid;
wire[DECOMPRESS_ENGINES-1:0] decompress_out_ready;
wire[DECOMPRESS_ENGINES-1:0] decompress_out_last;

wire[511:0] decompress_comb_data[0:DECOMPRESS_ENGINES-1];
wire[DECOMPRESS_ENGINES-1:0] decompress_comb_valid;
wire[DECOMPRESS_ENGINES-1:0] decompress_comb_last;

reg[5:0] decompress_in_rrid;
reg[5:0] decompress_out_rrid;


generate 
    if (DECOMPRESS_ENGINES>0) begin


        nukv_fifogen #(
            .DATA_SIZE(VALUE_WIDTH),
            .ADDR_BITS(9)
        ) fifo_valuedatafrommemory (
            .clk(clk),
            .rst(rst),
            
            .s_axis_tdata(upd_rd_data),
            .s_axis_tvalid(~upd_rd_empty),
            .s_axis_tready(upd_ready),
            .s_axis_talmostfull(value_read_almostfull_int2),
            
            .m_axis_tdata(value_read_data_buf),
            .m_axis_tvalid(value_read_valid_buf),
            .m_axis_tready(value_read_ready_buf)
        );

        



        assign value_read_ready_buf = decompress_in_ready[decompress_in_rrid];
        assign decompress_in_data = value_read_data_buf;

        always @(posedge clk) begin
            if (rst) begin
               decompress_in_rrid <=0;
                
            end
            else begin
                if (value_read_valid_buf==1 && value_read_ready_buf==1) begin
                    decompress_in_rrid <= decompress_in_rrid+1;
                    if (decompress_in_rrid==DECOMPRESS_ENGINES-1) begin
                        decompress_in_rrid <= 0;
                    end
                end
            end
        end
    


        genvar xx;
    
        for (xx=0; xx<DECOMPRESS_ENGINES; xx=xx+1)
        begin : decompression
    
          assign decompress_in_valid[xx +: 1] = xx==decompress_in_rrid ?  value_read_valid_buf : 0;
          


            fifo_generator_512_shallow_async fifo_values (
              .s_aclk(clk),
              .m_aclk(clk_faster),
              .s_aresetn(~rst),
              
              .s_axis_tdata(decompress_in_data),
              .s_axis_tvalid(decompress_in_valid[xx +: 1]),
              .s_axis_tready(decompress_in_ready[xx +: 1]),            
                
              .m_axis_tdata(decompress_interm_data[xx]),
              .m_axis_tvalid(decompress_interm_valid[xx +: 1]),
              .m_axis_tready(decompress_interm_ready[xx +: 1])
            );
    
            nukv_Decompress decompress_unit (
                   .clk(clk_faster),
                   .rst(rst_faster),
    
                    .input_valid(decompress_interm_valid[xx +: 1]),
                    .input_ready(decompress_interm_ready[xx +: 1]),
                    .input_data(decompress_interm_data[xx]),
                    .input_last(1),
    
                    .output_valid(decompress_out_valid[xx +: 1]),
                    .output_ready(decompress_out_ready[xx +: 1]),
                    .output_data(decompress_out_data[xx]),
                    .output_last(decompress_out_last[xx +: 1])
                );        

            fifo_generator_512_shallow_async fifo_decompressed_values (
                .s_aclk(clk_faster),
                .m_aclk(clk),
                .s_aresetn(~rst_faster),

                .s_axis_tdata(decompress_out_data[xx]),
                .s_axis_tvalid(decompress_out_valid[xx +: 1]),
                .s_axis_tready(decompress_out_ready[xx +: 1]),
                .s_axis_tuser(decompress_out_last[xx +: 1]),
                
                .m_axis_tdata(decompress_comb_data[xx]),
                .m_axis_tvalid(decompress_comb_valid[xx +: 1]),
                .m_axis_tready(xx==decompress_out_rrid ?  value_read_ready : 0),
                .m_axis_tuser(decompress_comb_last[xx +: 1 ])

            );
        end

        always @(posedge clk) begin
            if (rst) begin
               decompress_out_rrid <=0;
                
            end
            else begin
                if (value_read_ready==1 && value_read_valid==1 && value_read_last==1) begin
                    decompress_out_rrid <= decompress_out_rrid+1;
                    if (decompress_out_rrid==DECOMPRESS_ENGINES-1) begin
                        decompress_out_rrid <= 0;
                    end
                end
            end
        end

        assign value_read_data = decompress_comb_data[decompress_out_rrid];
        assign value_read_valid = decompress_comb_valid[decompress_out_rrid +: 1];
        assign value_read_last = decompress_comb_last[decompress_out_rrid +: 1];

      end else begin


        nukv_fifogen #(
            .DATA_SIZE(VALUE_WIDTH),
            .ADDR_BITS(9)
        ) fifo_valuedatafrommemory (
            .clk(clk),
            .rst(rst),
            
            .s_axis_tdata(upd_rd_data),
            .s_axis_tvalid(~upd_rd_empty),
            .s_axis_tready(upd_ready),
            .s_axis_talmostfull(value_read_almostfull_int2),
            
            .m_axis_tdata(value_read_data_buf),
            .m_axis_tvalid(value_read_valid_buf),
            .m_axis_tready(value_read_ready_buf)
        );

        assign value_read_ready_buf = value_read_ready;
        assign value_read_valid = value_read_valid_buf;
        assign value_read_data = value_read_data_buf;
        assign value_read_last = 0;    
        
    end
endgenerate



//end DECOMP







wire [513:0] regexin_data;
wire regexin_valid;
wire regexin_ready;
wire regexin_prebuf_ready;

wire[511:0] regexconf_data;
wire regexconf_valid;
wire regexconf_ready;

wire regexout_data;
wire regexout_valid;
wire regexout_ready;

wire buffer_violation;

wire before_get_ready;
wire before_get_almfull;
wire condin_ready;

wire cond_valid;
wire cond_ready;
wire cond_drop;

assign buffer_violation = ~cond_ready & before_get_ready;


nukv_Predicate_Eval_Pipeline_v2 
        #(.SUPPORT_SCANS(SUPPORT_SCANS),
          .PIPE_DEPTH(CONDITION_EVALS) 
        ) pred_eval_pipe (

    .clk(clk),
    .rst(rst),
    
    .pred_data({predconf_b_data[META_WIDTH+MEMORY_WIDTH-1 : META_WIDTH], predconf_b_data[META_WIDTH-1:0]}),
    .pred_valid(predconf_b_valid & predconf_b_ready),
    .pred_ready(predconf_predother_ready),
    .pred_scan((SUPPORT_SCANS==1) ? predconf_b_scan : 0),

    .value_data(value_read_data),
    .value_last(value_read_last), 
    .value_drop(0),
    .value_valid(value_read_valid),
    .value_ready(value_read_ready),

    .output_valid(value_frompred_valid),
    .output_ready(value_frompred_ready),
    .output_data(value_frompred_data),
    .output_last(value_frompred_last),
    .output_drop(value_frompred_drop),

    .scan_on_outside(scan_mode_on),

    .cmd_valid(pe_cmd_valid),
    .cmd_length(pe_cmd_data),
    .cmd_meta(pe_cmd_meta),
    .cmd_ready(pe_cmd_ready), 
    
    .error_input(pred_eval_error)

        );


// REGEX ---------------------------------------------------
wire toregex_ready;

assign value_frompred_ready = toregex_ready & condin_ready & before_get_ready;

fifo_generator_512_shallow_sync 
//#(
//    .DATA_SIZE(512+1),
//    .ADDR_BITS(7)
//) 
fifo_toward_regex (
    .s_aclk(clk),
    .s_aresetn(~rst),
    
    .s_axis_tdata(value_frompred_data),
    .s_axis_tvalid(value_frompred_valid & value_frompred_ready),
    .s_axis_tready(toregex_ready),
    .s_axis_tuser(value_frompred_drop),
    .s_axis_tlast(value_frompred_last),
    
    .m_axis_tdata(regexin_data[511:0]),
    .m_axis_tvalid(regexin_valid),
    .m_axis_tready(regexin_ready),
    .m_axis_tuser(regexin_data[513]),
    .m_axis_tlast(regexin_data[512])
);

assign regexconf_data[512-48*CONDITION_EVALS-1:0] = predconf_b_data[META_WIDTH+48*CONDITION_EVALS +: (512-48*CONDITION_EVALS)];
assign regexconf_data[511] = scan_mode_on;
assign regexconf_valid = predconf_b_valid & predconf_b_ready;
assign predconf_regex_ready = regexconf_ready;

wire [511:0] regexconf_buf_data;
wire regexconf_buf_valid;
wire regexconf_buf_ready;

//nukv_fifogen_async_clock #(
//    .DATA_SIZE(512),
//    .ADDR_BITS(7)
//) 
fifo_generator_512_shallow_sync 
fifo_config_regex (
    .s_aclk(clk),
    .s_aresetn(~rst),
    
    .s_axis_tdata(regexconf_data),
    .s_axis_tvalid(regexconf_valid),
    .s_axis_tready(regexconf_ready),
    .s_axis_tlast(1'b1),
   
     .m_axis_tdata(regexconf_buf_data),
    .m_axis_tvalid(regexconf_buf_valid),
    .m_axis_tready(regexconf_buf_ready),
    .m_axis_tlast()
);


wire regexout_int_data;
wire regexout_int_valid;
wire regexout_int_ready;

kvs_vs_RegexTop_FastClockInside regex_module (
    .clk(clk),
    .rst(rst | rst_regex_after_scan),

    .fast_clk(clk_faster),
    .fast_rst(rst_faster),

    .input_data(regexin_data[511:0]),
    .input_valid(regexin_valid),
    .input_last(regexin_data[512]),
    .input_ready(regexin_ready),

    .config_data(regexconf_buf_data),
    .config_valid(regexconf_buf_valid),
    .config_ready(regexconf_buf_ready),

    .found_loc(regexout_int_data),
    .found_valid(regexout_int_valid),
    .found_ready(regexout_int_ready)
);

//nukv_fifogen_async_clock #(
    //.DATA_SIZE(1),
//    .ADDR_BITS(8)
//)
fifo_generator_1byte_sync 
 fifo_decision_from_regex (
    .s_aclk(clk),
    .s_aresetn(~rst),
    
    .s_axis_tdata(regexout_int_data),
    .s_axis_tvalid(regexout_int_valid),
    .s_axis_tready(regexout_int_ready),
    
    .m_axis_tdata(regexout_data),
    .m_axis_tvalid(regexout_valid),
    .m_axis_tready(regexout_ready)
);


nukv_fifogen #(
    .DATA_SIZE(MEMORY_WIDTH),
    .ADDR_BITS(8)
) fifo_value_from_pe (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(value_frompred_data),
    .s_axis_tvalid(value_frompred_valid & value_frompred_ready),
    .s_axis_tready(before_get_ready),

    .m_axis_tdata(value_frompred_b_data),
    .m_axis_tvalid(value_frompred_b_valid),
    .m_axis_tready(value_frompred_b_ready)
);



nukv_fifogen #(
    .DATA_SIZE(1),
    .ADDR_BITS(8)
) fifo_decision_from_pe (
    .clk(clk),
    .rst(rst),
    
    .s_axis_tdata(value_frompred_drop),
    .s_axis_tvalid(value_frompred_valid & value_frompred_ready & value_frompred_last ),
    .s_axis_tready(condin_ready),
    
    .m_axis_tdata(cond_drop),
    .m_axis_tvalid(cond_valid),
    .m_axis_tready(cond_ready)
);



assign decision_is_valid = cond_valid & regexout_valid;
assign decision_is_drop = cond_drop | ~regexout_data;
assign cond_ready = read_decision & decision_is_valid;
assign regexout_ready = read_decision & decision_is_valid;


nukv_Value_Get #(.SUPPORT_SCANS(SUPPORT_SCANS)) 
	valuegetter
	(
	.clk(clk),
	.rst(rst),

	.input_data(fromset_b_data),
	.input_valid(fromset_b_valid),
	.input_ready(fromset_b_ready),

	.value_data(value_frompred_b_data),
	.value_valid(value_frompred_b_valid),
	.value_ready(value_frompred_b_ready),

	.cond_valid(decision_is_valid),
	.cond_drop(decision_is_drop),
	.cond_ready(read_decision), 

	.output_data(final_out_data[127:0]),
	.output_valid(final_out_valid),
	.output_ready(final_out_ready),
	.output_last(final_out_last),

	.scan_mode(scan_mode_on)

);


 assign m_axis_tvalid = (final_out_data[64+:16]==16'h7fff) ? 0 : final_out_valid;
 assign m_axis_tlast = final_out_last;
 assign m_axis_tdata = final_out_data;
 assign final_out_ready = m_axis_tready;

assign upd_rd_cmd_data ={24'b000000000000000100000001, upd_rdcmd_data[39:32], 4'b0000, 3'b001, upd_rdcmd_data[24:0]};
assign upd_rdcmd_ready = ~upd_rd_cmd_stall;

assign upd_wr_cmd_data ={24'b000000000000000100000001, upd_wrcmd_data[39:32], 4'b0000, 3'b001, upd_wrcmd_data[24:0]};
assign upd_wrcmd_ready = ~upd_wr_cmd_stall;

reg[31:0] rdaddr_aux;
reg[191:0] data_aux;




   // -------------------------------------------------
   /*  */


   wire [35:0] 				    control0, control1;
   reg [255:0] 			    data;
   reg [255:0] 				    debug_r;
   reg [255:0] 				    debug_r2;
   reg [255:0] 				    debug_r3;
   wire [63:0] 				    vio_cmd;
   reg [63:0] 				    vio_cmd_r;
   
   reg old_scan_mode;

   reg [31:0] condcnt;
   reg [31:0] regxcnt;
   reg [31:0] diffrescnt;


   always @(posedge clk) begin

        if (rst==1) begin
            input_counter<=0;
            old_scan_mode <= 0;
            condcnt <= 0;
            regxcnt <= 0;
        end else begin
            //if(debug_r[2:0]==3'b111) begin
                input_counter<= input_counter+1;
            //end
        

          if (value_frompred_valid==1 && value_frompred_ready==1 && value_frompred_last==1 && condin_ready==1) begin
            condcnt <= condcnt +1;          
          end

          if (regexout_int_valid==1 && regexout_int_ready==1) begin
            regxcnt <= regxcnt+1;
          end
        end 
        
        old_scan_mode <= scan_mode_on;

        if (regxcnt > condcnt) begin
          diffrescnt <= regxcnt - condcnt;
        end
        else begin
          diffrescnt <= condcnt - regxcnt;
        end

      //data_aux <= {regexin_data[63:0],diffrescnt};
      data_aux <= {value_read_data[0 +: 64], s_axis_tdata[63:0]};
      
      
      debug_r[0] <=  s_axis_tvalid  ;
      debug_r[1] <=  s_axis_tready;
      debug_r[2] <=  s_axis_tlast;
      debug_r[3] <=   key_valid ;
      debug_r[4] <=   key_ready;
      debug_r[5] <=    meta_valid;
      debug_r[6] <=    meta_ready;
      debug_r[7] <=    value_valid;
      debug_r[8] <=    value_ready;
      debug_r[9] <=    mreq_valid;
      debug_r[10] <=    mreq_ready;
      debug_r[11] <=    keywhash_valid;
      debug_r[12] <=    keywhash_ready;
      debug_r[13] <=    feedbwhash_valid;
      debug_r[14] <=    feedbwhash_ready;
      debug_r[15] <=    towrite_valid;
      debug_r[16] <=    towrite_ready;
      debug_r[17] <=    rdcmd_valid;
      debug_r[18] <=    rdcmd_ready;
      debug_r[19] <=    writeout_valid;
      debug_r[20] <=    writeout_ready;
      

      
      debug_r[21] <=    p_rd_valid;
      debug_r[22] <=    p_rd_ready;
      //debug_r[23] <=    (b_rd_data==0 ? 0 : 1);            
      
      
      debug_r[24] <=    free_valid;
      debug_r[25] <=    free_ready;
      debug_r[26] <=    ht_buf_rd_valid;
      debug_r[27] <=    ht_buf_rd_ready;
      debug_r[28] <=    ht_wr_valid;
      debug_r[29] <=    ht_wr_stall;
      debug_r[30] <=    wrcmd_valid;
      debug_r[31] <=    wrcmd_ready;
      debug_r[32] <=    writeout_b_valid;
      debug_r[33] <=    writeout_b_ready;
      debug_r[34] <=    value_b_valid;
      debug_r[35] <=    value_b_ready;
      debug_r[36] <=    upd_wr_cmd_valid;
      debug_r[37] <=    ~upd_wr_cmd_stall;
      debug_r[38] <=    b_rdcmd_valid;
      debug_r[39] <=    b_rdcmd_ready;
      debug_r[40] <=    b_rd_valid;
      debug_r[41] <=    b_rd_ready;
      debug_r[42] <=    upd_rd_cmd_valid;
      debug_r[43] <=    ~upd_rd_cmd_stall;
      debug_r[44] <=    fromset_b_valid;
      debug_r[45] <=    fromset_b_ready;
      debug_r[46] <=    value_read_valid;
      debug_r[47] <=    value_read_ready;
      debug_r[48] <=    m_axis_tvalid;
      debug_r[49] <=    m_axis_tlast;
      debug_r[50] <=    m_axis_tready;

      debug_r[51] <= (old_scan_mode != scan_mode_on) ? 1'b1: 1'b0;
      debug_r[52] <= scan_reading;
      debug_r[53] <= scan_pause;
      debug_r[54] <= value_read_almostfull_int;
      
      debug_r[56] <= pred_eval_error;

      //debug_r[57] <= malloc_error_valid;

      //debug_r[58] <= malloc_valid;

      //debug_r[64 +: 32] <= {malloc_error_state};

      //                        71                       70                    69              68           67          66              65          64  
      debug_r[64 +: 8] <= {value_frompred_b_ready,value_frompred_b_valid,regexout_ready, regexout_valid, cond_ready, cond_valid, regexin_ready, regexin_valid};
    
      //debug_r[96 +: 16] <= diffrescnt[15:0];
        
      debug_r[128 +: 128] <= data_aux;


      
      debug_r2 <= debug_r;
      debug_r3 <= debug_r2;
      data <= debug_r3;
   end

   
   icon icon_inst(
		  .CONTROL0(control0),
		  .CONTROL1(control1)
		  );
   
   vio vio_inst(
		.CONTROL(control1),
		.CLK(clk),
		.SYNC_OUT(vio_cmd)
		//     .SYNC_OUT()
		);
   
   ila_256 ila_256_inst(
			.CONTROL(control0),
			.CLK(clk),
			.TRIG0(data)
			);
			
 /**/

endmodule

`default_nettype wire