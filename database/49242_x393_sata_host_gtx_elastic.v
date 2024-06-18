// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>gtx_elastic
 * @file gtx_elastic.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief elastic buffer implementation
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * gtx_elastic.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * gtx_elastic.v file is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
module gtx_elastic #(
    parameter DEPTH_LOG2 = 4, // 3,   // => 8 total rows
    parameter OFFSET = 8 // 4        // distance between read and write pointers, = wr_ptr - rd_ptr
)
(
    input   wire    rst,
    input   wire    wclk,
    input   wire    rclk,

    input   wire            isaligned_in,
    input   wire    [1:0]   charisk_in,
    input   wire    [1:0]   notintable_in,
    input   wire    [1:0]   disperror_in,
    input   wire    [15:0]  data_in,

    output  wire            isaligned_out,
    output  wire    [1:0]   charisk_out,
    output  wire    [1:0]   notintable_out,
    output  wire    [1:0]   disperror_out,
    output  wire    [15:0]  data_out,

//  strobes LAST word in a dword primitive
    output  wire    lword_strobe,

//  status outputs, just in case
    output  wire    full,
    output  wire    empty
);
// gather inputs and outputs
wire    [22:0]  indata;
wire    [22:0]  outdata;
assign  indata          = {isaligned_in, notintable_in, disperror_in, charisk_in, data_in};
assign  isaligned_out   = outdata[22];
assign  notintable_out  = outdata[21:20];
assign  disperror_out   = outdata[19:18];
assign  charisk_out     = outdata[17:16];
assign  data_out        = outdata[15:0];

localparam HI = DEPTH_LOG2 - 1; // hi bus index
/*
 * buffer itself
 */
// data storage
reg     [22:0]  ram [(1 << DEPTH_LOG2) - 1:0];
// data to/from fifo
wire    [22:0]  inram;
reg     [22:0]  outram;
// adresses in their natural clock domains
reg     [HI:0]  rd_addr;
reg     [HI:0]  wr_addr;
// incremened addresses
wire    [HI:0]  wr_next_addr;
wire    [HI:0]  rd_next_addr;
// gray coded addresses
reg     [HI:0]  rd_addr_gr;
reg     [HI:0]  wr_addr_gr;
// anti-metastability shift registers for gray-coded addresses
reg     [HI:0]  rd_addr_gr_r;
reg     [HI:0]  wr_addr_gr_r;
reg     [HI:0]  rd_addr_gr_rr;
reg     [HI:0]  wr_addr_gr_rr;
// resynced to opposite clks addresses 
wire    [HI:0]  rd_addr_r;
wire    [HI:0]  wr_addr_r;
// fifo states
//wire            full;      // MAY BE full. ~full -> MUST NOT be full
//wire            empty;     // MAY BE empty. ~empty -> MUST NOT be empty
wire            re;
wire            we;

assign  wr_next_addr = wr_addr + 1'b1;
assign  rd_next_addr = rd_addr + 1'b1;
// wclk domain counters
always @ (posedge wclk)
begin
    wr_addr        <= rst ? {DEPTH_LOG2{1'b0}} : we ? wr_next_addr : wr_addr;
    wr_addr_gr     <= rst ? {DEPTH_LOG2{1'b0}} : we ? wr_next_addr ^ {1'b0, wr_next_addr[HI:1]} : wr_addr_gr;
end
// rclk domain counters
always @ (posedge rclk)
begin
    rd_addr        <= rst ? {DEPTH_LOG2{1'b0}} : re ? rd_next_addr : rd_addr;
    rd_addr_gr     <= rst ? {DEPTH_LOG2{1'b0}} : re ? rd_next_addr ^ {1'b0, rd_next_addr[HI:1]} : rd_addr_gr;
end
// write address -> rclk (rd) domain to compare 
always @ (posedge rclk)
begin
    wr_addr_gr_r   <= rst ? {DEPTH_LOG2{1'b0}} : wr_addr_gr;
    wr_addr_gr_rr  <= rst ? {DEPTH_LOG2{1'b0}} : wr_addr_gr_r;
end
// read address -> wclk (wr) domain to compare 
always @ (posedge wclk)
begin
    rd_addr_gr_r   <= rst ? {DEPTH_LOG2{1'b0}} : rd_addr_gr;
    rd_addr_gr_rr  <= rst ? {DEPTH_LOG2{1'b0}} : rd_addr_gr_r;
end
// translate resynced write address into ordinary (non-gray) address
genvar ii;
generate
for (ii = 0; ii <= HI; ii = ii + 1)
begin: wr_antigray
    assign  wr_addr_r[ii] = ^wr_addr_gr_rr[HI:ii];
end
endgenerate
// translate resynced read address into ordinary (non-gray) address
generate
for (ii = 0; ii <= HI; ii = ii + 1)
begin: rd_antigray
    assign  rd_addr_r[ii] = ^rd_addr_gr_rr[HI:ii];
end
endgenerate
// so we've got the following:
// wclk domain: wr_addr   - current write address
//              rd_addr_r - read address some wclk ticks ago
//  => we can say if the fifo have the possibility to be full
//     since actual rd_addr could only be incremented
//
// rclk domain: rd_addr   - current read address
//              wr_addr_r - write address some rclk ticks ago
//  => we can say if the fifo have the possibility to be empty
//     since actual wr_addr could only be incremented
assign  full   = wr_addr   == rd_addr_r + 1'b1;
assign  empty  = wr_addr_r == rd_addr;

always @ (posedge rclk)
    outram <= ram[rd_addr];

always @ (posedge wclk)
    if (we)
        ram[wr_addr] <= inram;

// elactic part
// control fifo state @ rclk domain
// sends a pulse to wclk domain for every necessary ALIGNP removal
// waits for response from wclk domain of a successful removal
// pauses fifo read and inserts ALIGNP

// @ rclk
// calculating an offset - a distance between write and read pointers
wire    [HI:0]  current_offset; 
assign  current_offset = wr_addr_r - rd_addr;

// more records in fifo than expected on 1 primitive = 2 words = 2 records
wire    offset_more_on_1;
// more records in fifo than expected on 2 primitives or more = 4 words + = 4 records + 
wire    offset_more_on_2;
// less records than expected - can insert a lot of alignes instantly, so exact count is not important
wire    offset_less;

// doesnt bother if offset is more on 1 word. 
assign  offset_more_on_1 = current_offset == (OFFSET + 2) | current_offset == (OFFSET + 3);
assign  offset_more_on_2 = (current_offset > (OFFSET + 1)) & ~offset_more_on_1;
assign  offset_less      = current_offset < OFFSET;

`ifdef ENABLE_CHECKERS
    always @ (posedge clk)
        if (offset_less & (offset_more_on_1 | offset_more_on_1)) begin
            $display("Error in %m. Wrong offset calculations");
            $finish;
        end
`endif

/*
 * Case when we need to get rid of extra elements in fifo
 */

// control part @ rclk
wire    rmv_ack_rclk;

wire    state_idle_rmv;
reg     state_rmv1_req;
reg     state_rmv2_req;
reg     state_wait_ack;
wire    set_rmv1_req;
wire    set_rmv2_req;
wire    set_wait_ack;
wire    clr_rmv1_req;
wire    clr_rmv2_req;
wire    clr_wait_ack;

assign  state_idle_rmv = ~state_rmv1_req & ~state_rmv2_req & ~state_wait_ack;

assign  set_rmv1_req = state_idle_rmv & offset_more_on_1;
assign  set_rmv2_req = state_idle_rmv & offset_more_on_2;
assign  set_wait_ack = state_rmv1_req | state_rmv2_req;
assign  clr_rmv1_req = set_wait_ack;
assign  clr_rmv2_req = set_wait_ack;
assign  clr_wait_ack = rmv_ack_rclk;

always @ (posedge rclk)
begin
    state_rmv1_req <= (state_rmv1_req | set_rmv1_req) & ~clr_rmv1_req & ~rst;
    state_rmv2_req <= (state_rmv2_req | set_rmv2_req) & ~clr_rmv2_req & ~rst;
    state_wait_ack <= (state_wait_ack | set_wait_ack) & ~clr_wait_ack & ~rst;
end

`ifdef ENABLE_CHECKERS
    always @ (posedge rclk)
        if (~rst)
        if ((4'h0 
            + state_rmv1_req 
            + state_rmv2_req
            + state_wait_ack
            + state_idle_rmv
            ) == 4'h1) begin
            // all good
        end
        else
        begin
            $display("Error in %m: wrong fsm states: %b", {state_rmv1_req, state_rmv2_req, state_wait_ack, state_idle_rmv});
            $finish;
        end
`endif

// align removal logic @ wclk
// we MUST compare current and next data pack even if the current one is a comma because
// the next data word could be either valid ALIGNP's or any other 2 bytes, which shall tell
// link layer that incorrect primitive has been received, so it can't be skipped
// also NO DISPARITY ERROR would be dropped
reg [22:0]  indata_r;
always @ (posedge wclk)
    indata_r <= indata;

// align is stored in a buffer right now
// ALIGNP  = 7B4A4ABC
// charisk :  0 0 0 1
// notintbl:  0 0 0 0
// disperr:   0 0 0 0
wire    align_det;
assign  align_det = {indata[15:0], indata_r[15:0]}   == 32'h7B4A4ABC
                  & {indata[17:16], indata_r[17:16]} == 4'b0001
                  & {indata[19:18], indata_r[19:18]} == 4'b0000
                  & {indata[21:20], indata_r[21:20]} == 4'b0000;

// fsm
/*
 * bypass --req1--> wait for align --------------------------------------------------------> skip 1 primitive -> send ack -> bypass
 *  \                                                                                   |                          /\
 *  req2--> wait for align -> skip 1 primitive -> wait until next   ------align in buf--+                           |
 *                                                prim is in buffer --not align in buf------------------------------+ 
 */
wire    skip_write;
wire    rmv1_req_wclk;
wire    rmv2_req_wclk;
reg     next_prim_loaded;

wire    state_bypass_rmv;
reg     state_wait1_align;
reg     state_skip1_align;
reg     state_wait2_align;
reg     state_skip2_align;
reg     state_wait_next_p;
reg     state_send_ack;
wire    set_wait1_align;
wire    set_skip1_align;
wire    set_wait2_align;
wire    set_skip2_align;
wire    set_wait_next_p;
wire    set_send_ack;
wire    clr_wait1_align;
wire    clr_skip1_align;
wire    clr_wait2_align;
wire    clr_skip2_align;
wire    clr_wait_next_p;
wire    clr_send_ack;

always @ (posedge wclk)
    next_prim_loaded <= state_wait_next_p;

assign  state_bypass_rmv = ~state_wait1_align & ~state_skip1_align & ~state_wait2_align & ~state_skip2_align & ~state_wait_next_p & ~state_send_ack;

assign  set_wait1_align = state_bypass_rmv & rmv1_req_wclk & ~rmv2_req_wclk;
assign  set_skip1_align = state_wait1_align & align_det | state_wait_next_p & next_prim_loaded & align_det;
assign  set_wait2_align = state_bypass_rmv & rmv2_req_wclk;
assign  set_skip2_align = state_wait2_align & align_det;
assign  set_wait_next_p = state_skip2_align;
assign  set_send_ack    = state_skip1_align | state_wait_next_p & next_prim_loaded & ~align_det; // 1 cycle skip - while set_skip1, 2nd cycle - while state_skip1
assign  clr_wait1_align = set_skip1_align;
assign  clr_skip1_align = set_send_ack;
assign  clr_wait2_align = set_skip2_align;
assign  clr_skip2_align = set_wait_next_p;
assign  clr_wait_next_p = set_send_ack | set_skip1_align;
assign  clr_send_ack    = state_send_ack;

always @ (posedge wclk)
begin
    state_wait1_align <= (state_wait1_align | set_wait1_align) & ~clr_wait1_align & ~rst;
    state_skip1_align <= (state_skip1_align | set_skip1_align) & ~clr_skip1_align & ~rst;
    state_wait2_align <= (state_wait2_align | set_wait2_align) & ~clr_wait2_align & ~rst;
    state_skip2_align <= (state_skip2_align | set_skip2_align) & ~clr_skip2_align & ~rst;
    state_wait_next_p <= (state_wait_next_p | set_wait_next_p) & ~clr_wait_next_p & ~rst;
    state_send_ack    <= (state_send_ack    | set_send_ack   ) & ~clr_send_ack    & ~rst;
end

assign  skip_write  = set_skip1_align | state_skip1_align;
assign  inram       = indata_r;
assign  we          = ~skip_write;

// cross-domain messaging

// just to simplify an algorithm, we don't serialize a request to remove 2 ALIGNP,
// instead make 2 independent request lines
pulse_cross_clock remove1_req(
	.rst        (rst),
	.src_clk    (rclk),
	.dst_clk    (wclk),
	.in_pulse   (state_rmv1_req),
	.out_pulse  (rmv1_req_wclk),
	.busy       ()
);
pulse_cross_clock remove2_req(
	.rst        (rst),
	.src_clk    (rclk),
	.dst_clk    (wclk),
	.in_pulse   (state_rmv2_req),
	.out_pulse  (rmv2_req_wclk),
	.busy       ()
);
// removal request ack
pulse_cross_clock remove_ack(
	.rst        (rst),
	.src_clk    (wclk),
	.dst_clk    (rclk),
	.in_pulse   (state_send_ack),
	.out_pulse  (rmv_ack_rclk),
	.busy       ()
);

// insert additional ALINGPs to head @ rclk
// 1 way to implement - search for align primitive at the head of fifo, and insert enough alignes right after detected one
// 2nd way - continiously send a pulse, indicating 1st word of each primitive.
// Choosing the 1st way

// start algorithm after fifo gets in a stable state - let it fill to predefined offset count
reg     fifo_stable;
always @ (posedge rclk)
    fifo_stable <= rst ? 1'b0 : ~fifo_stable & ~offset_less | fifo_stable;

// once again check if the current half-primitive is a part of an align
// no need to latch the whole outram

// indicator, that @ previous clock cycle there was a first word of ALIGNP
reg     align_1st;
always @ (posedge rclk)
    align_1st <= outram[15:0]  == 16'h4ABC 
               & outram[17:16] == 2'b01
               & outram[19:18] == 2'b00
               & outram[21:20] == 2'b00;
// indicates that current word is a second word of ALIGNP
wire    align_2nd;
assign  align_2nd = outram[15:0]  == 16'h7B4A
                  & outram[17:16] == 2'b00
                  & outram[19:18] == 2'b00
                  & outram[21:20] == 2'b00;
// whole align primitive is the last thing we read from fifo
reg     read_align;
wire    pause_read;
always @ (posedge rclk)
    read_align  <= rst ? 1'b0 : pause_read | align_1st & align_2nd;


// just to alternate alignp's words, = 0 => 1st word, = 1 => 2nd word
reg     align_altern;

// also pause when offset gets ok, but only 1st word of alignp is sent - need to send 2nd word
assign  pause_read = read_align & offset_less & fifo_stable | align_altern;
always @ (posedge rclk)
    align_altern <= rst | ~pause_read ? 1'b0 : ~align_altern;

// choose 1 of 2 words of ALIGNP
wire    [22:0]  align_word;
assign  align_word = {outram[22], 22'h007B4A} & {23{align_altern}} | {outram[22], 22'h014ABC} & {23{~align_altern}};

// output data would be valid the next clock they are issued
reg     pause_read_r;
always @ (posedge rclk)
    pause_read_r <= pause_read;
// read when compensation is not issued and when fifo gets required fullfillment
assign  re = ~pause_read & fifo_stable;
assign  outdata = {23{~pause_read_r}} & outram | {23{pause_read_r}} & align_word;
// indicates last cycle before the next primitive
wire    fword_strobe_correction;
reg     fword_strobe;
`ifdef SIMULATION
assign  fword_strobe_correction = (align_1st === 1'bx || align_2nd === 1'bx) ? 1'b0 : align_1st & align_2nd ;
`else
assign  fword_strobe_correction = align_1st & align_2nd;
`endif
always @ (posedge rclk)
    fword_strobe <= rst ? 1'b0 : fword_strobe_correction ? 1'b1 : lword_strobe;

assign  lword_strobe = ~fword_strobe;

endmodule
