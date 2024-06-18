// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>oob_dev
 * @file oob_dev.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief sata oob unit implementation
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * oob_dev.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * oob_dev.v file is distributed in the hope that it will be useful,
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
/*
 * For now both device and host shall be set up to SATA2 speeds.
 * Need to think how to change speed grades on fly (either to broaden 
 * data iface width or to change RXRATE/TXRATE)
 */
// All references to doc = to SerialATA_Revision_2_6_Gold.pdf
module oob_dev #(
    parameter DATA_BYTE_WIDTH = 4,
    parameter CLK_SPEED_GRADE = 2, // 1 - 75 Mhz, 2 - 150Mhz, 4 - 300Mhz
    parameter TEST_ELIDLE =      2,      // test transmitting eidle between data rates (number of times)
    parameter ELIDLE_DELAY =    'h28, // 80,    // counter cycles
    parameter ELIDLE_DURATION = 'h80    // counter cycles
)
(
    // sata clk = usrclk2
    input   wire    clk,
    // reset oob
    input   wire    rst,

    input   wire    gtx_ready,
    // oob responses
    input   wire    rxcominitdet_in,
    input   wire    rxcomwakedet_in,
    input   wire    rxelecidle_in,
    // oob issues
    output  reg     txcominit,
    output  reg     txcomwake,
    output  reg     txelecidle,

    output  wire    txpcsreset_req,
    input   wire    recal_tx_done,

    // output data stream to gtx
    output  wire    [DATA_BYTE_WIDTH*8 - 1:0] txdata_out,
    output  wire    [DATA_BYTE_WIDTH - 1:0]   txcharisk_out,
    // input data from gtx
    input   wire    [DATA_BYTE_WIDTH*8 - 1:0] rxdata_in,
    input   wire    [DATA_BYTE_WIDTH - 1:0]   rxcharisk_in,

    output  wire    link_up
);

localparam  STATE_RESET             = 0;
localparam  STATE_COMINIT           = 1;
localparam  STATE_AWAITCOMWAKE      = 2;
localparam  STATE_AWAITNOCOMWAKE    = 3;
localparam  STATE_CALIBRATE         = 4;
localparam  STATE_COMWAKE           = 5;
localparam  STATE_RECAL             = 55;
localparam  STATE_SENDALIGN         = 6;
localparam  STATE_EIDLE_RATE        = 65; 
localparam  STATE_READY             = 7;
localparam  STATE_PARTIAL           = 8;
localparam  STATE_SLUMBER           = 9;
localparam  STATE_REDUCESPEED       = 10;
localparam  STATE_ERROR             = 11;


reg     [31:0]  rate_change_cntr;
reg             was_txelecidle;
reg     [9:0]   state;
wire    retry_interval_elapsed;
wire    wait_interval_elapsed;
wire    elidle_rate_delay_elapsed; 
wire    elidle_rate_duration_elapsed; 
wire    nocomwake;
wire    [31:0]  align;
wire    [31:0]  sync;

assign  align = {8'b01111011, 8'b01001010, 8'b01001010, 8'b10111100}; // {D27.3, D10.2, D10.2, K28.5}
assign  sync  = {8'b10110101, 8'b10110101, 8'b10010101, 8'b01111100}; // {D21.5, D21.5, D21.4, K28.3}

reg [31:0]  nocomwake_timer;
assign  nocomwake = nocomwake_timer == 32'd38;
always @ (posedge clk)
    nocomwake_timer <= rst | rxcomwakedet_in ? 32'h0 : nocomwake ? nocomwake_timer : nocomwake_timer + 1'b1;

reg [31:0]  retry_timer;
assign  retry_interval_elapsed = retry_timer == 32'd1000;
always @ (posedge clk)
    retry_timer <= rst | ~(state == STATE_AWAITCOMWAKE) ? 32'h0 : retry_timer + 1'b1;

reg [31:0]  wait_timer;
assign  wait_interval_elapsed =   wait_timer == 32'd4096;
assign elidle_rate_delay_elapsed = wait_timer == ELIDLE_DELAY;
always @ (posedge clk)
    wait_timer <= rst | ~(state == STATE_SENDALIGN) ? 32'h0 : wait_timer + 1'b1;
reg [31:0] elidle_timer;
assign elidle_rate_duration_elapsed = elidle_timer == ELIDLE_DURATION;    
always @ (posedge clk)
    elidle_timer <= rst | ~(state == STATE_EIDLE_RATE) ? 32'h0 : elidle_timer + 1'b1;

always @ (posedge clk) begin
    was_txelecidle <= txelecidle;
    if (rst)                                rate_change_cntr <= 0;
    else if (txelecidle && !was_txelecidle) rate_change_cntr <= rate_change_cntr + 1;  
end


reg [31:0]  data;
reg [3:0]   isk;

assign  link_up = state == STATE_READY;

assign  txdata_out      = data;
assign  txcharisk_out   = isk;

// buf inputs from gtx
reg rxcominitdet;
reg rxcomwakedet;
reg rxelecidle;
reg [31:0]  rxdata; 
reg [3:0]   rxcharisk;
always @ (posedge clk)
begin
    rxcominitdet <= rxcominitdet_in;
    rxcomwakedet <= rxcomwakedet_in;
    rxelecidle   <= rxelecidle_in;
    rxdata       <= rxdata_in;
    rxcharisk    <= rxcharisk_in;
end

reg [9:0] txelecidle_cnt;

wire    aligndet;
wire    syncdet;
assign  aligndet = ~|(rxdata ^ {8'b01111011, 8'b01001010, 8'b01001010, 8'b10111100}) & ~|(rxcharisk ^ 4'h1); // {D27.3, D10.2, D10.2, K28.5}
assign  syncdet  = ~|(rxdata ^ {8'b10110101, 8'b10110101, 8'b10010101, 8'b01111100}) & ~|(rxcharisk ^ 4'h1); // {D21.5, D21.5, D21.4, K28.3}

assign  txpcsreset_req = state == STATE_RECAL & (txelecidle_cnt == 10'd160);

always @ (posedge clk)
    if (rst | (~gtx_ready & ~(state == STATE_RECAL)))
    begin
        state       <= STATE_RESET;
        txelecidle  <= 1'b1;
        txcominit   <= 1'b0;
        txcomwake   <= 1'b0;
        txelecidle_cnt <= 10'h0;
    end
    else
        case (state)
        STATE_RESET:
        begin
            if (rxcominitdet) begin
                txelecidle_cnt <= 10'h0;
                state       <= STATE_COMINIT;
                txelecidle  <= 1'b1;
                txcominit   <= 1'b0;
                txcomwake   <= 1'b0;
            end
        end
        STATE_COMINIT:
        begin
            state       <= STATE_AWAITCOMWAKE;
            txcominit   <= 1'b1;
        end
        STATE_AWAITCOMWAKE:
        begin
            txcominit   <= 1'b0;
            if (rxcomwakedet)
                state   <= STATE_AWAITNOCOMWAKE;
            else 
            if (retry_interval_elapsed)
                state   <= STATE_RESET;
            else
                state   <= STATE_AWAITCOMWAKE;
        end
        STATE_AWAITNOCOMWAKE:
        begin
            if (nocomwake)
            begin
                state   <= STATE_CALIBRATE;
            end
        end
        STATE_CALIBRATE:
        begin
            state   <= STATE_COMWAKE;
        end
        STATE_COMWAKE:
        begin
            txcomwake   <= 1'b1;
            state       <= STATE_RECAL;
            txelecidle_cnt <= 10'h0;
        end
        STATE_RECAL:
        begin
            data    <= align;
            isk     <= 4'h1;
            txcomwake   <= 1'b0;
            // txcomwake period = 213.333 ns times let's say 10 pulses => 2133.333 ns = 160 cycles of 75Mhz
            if (txelecidle_cnt == 10'd160) begin
                txelecidle  <= 1'b0;
            end
            else begin
                txelecidle_cnt <= txelecidle_cnt + 1'b1;
            end
            if (recal_tx_done) begin
                state   <= STATE_SENDALIGN;
            end
        end
        STATE_SENDALIGN:
        begin
            txelecidle <= 1'b0;
            data    <= align;
            isk     <= 4'h1;
            if (aligndet)
                state   <= STATE_READY;
            else 
            if (wait_interval_elapsed)
                state   <= STATE_ERROR;
            else if ((rate_change_cntr < TEST_ELIDLE) && elidle_rate_delay_elapsed)
                state   <= STATE_EIDLE_RATE;
            else 
                state   <= STATE_SENDALIGN;
        end

        STATE_EIDLE_RATE:
        begin
            txelecidle <= 1'b1;
            data    <= 0; // align; // 'bz;
            isk     <= 4'h1;
            if (elidle_rate_duration_elapsed)
                state   <= STATE_SENDALIGN;
        end
        
        STATE_READY:
        begin
            txelecidle <= 1'b0;
            data    <= sync;
            isk     <= 4'h1;
            if (rxelecidle_in)
                state   <= STATE_ERROR;
        end
        STATE_ERROR:
        begin
            txelecidle <= 1'b0;
            state   <= STATE_RESET;
        end
        endcase


































































































/*



// 873.8 us error timer
// = 2621400 SATA2 serial ticks (period = 0.000333 us)
// = 131070 ticks @ 150Mhz
// = 65535  ticks @ 75Mhz 
localparam  [19:0]  CLK_TO_TIMER_CONTRIB = CLK_SPEED_GRADE == 1 ? 20'h4 :
                                           CLK_SPEED_GRADE == 2 ? 20'h2 :
                                           CLK_SPEED_GRADE == 4 ? 20'h1 : 20'h1;
`ifdef SIMULATION                                           
localparam  [19:0]  TIMER_LIMIT = 19'd200;
`else
localparam  [19:0]  TIMER_LIMIT = 19'd262140;
`endif
reg     [19:0]  timer;
wire            timer_clr;
wire            timer_fin;

// latching inputs from gtx
reg     rxcominitdet;
reg     rxcomwakedet;
reg     rxelecidle;
reg     [DATA_BYTE_WIDTH*8 - 1:0] rxdata;
reg     [DATA_BYTE_WIDTH - 1:0]   rxcharisk;

// primitives detection
wire    detected_alignp;
wire    detected_syncp;

// fsm, doc p265,266
wire    state_idle;
reg     state_wait_cominit;
reg     state_wait_comwake;
reg     state_wait_align;
reg     state_wait_synp;
reg     state_wait_linkup;
reg     state_error;

wire    set_wait_cominit;
wire    set_wait_comwake;
wire    set_wait_align;
wire    set_wait_synp;
wire    set_wait_linkup;
wire    set_error;
wire    clr_wait_cominit;
wire    clr_wait_comwake;
wire    clr_wait_align;
wire    clr_wait_synp;
wire    clr_wait_linkup;
wire    clr_error;

assign  state_idle = ~state_wait_cominit & ~state_wait_comwake & ~state_wait_align & ~state_wait_synp & ~state_wait_linkup & ~state_error;
always @ (posedge clk)
begin
    state_wait_cominit  <= (state_wait_cominit | set_wait_cominit) & ~clr_wait_cominit & ~rst;
    state_wait_comwake  <= (state_wait_comwake | set_wait_comwake) & ~clr_wait_comwake & ~rst;
    state_wait_align    <= (state_wait_align   | set_wait_align  ) & ~clr_wait_align   & ~rst;
    state_wait_synp     <= (state_wait_synp    | set_wait_synp   ) & ~clr_wait_synp    & ~rst;
    state_wait_linkup   <= (state_wait_linkup  | set_wait_linkup ) & ~clr_wait_linkup  & ~rst;
    state_error         <= (state_error        | set_error       ) & ~clr_error        & ~rst;
end

assign  set_wait_cominit = state_idle & oob_start & ~cominit_req;
assign  set_wait_comwake = state_idle & cominit_req & cominit_allow | state_wait_cominit & rxcominitdet;
assign  set_wait_align   = state_wait_comwake & rxcomwakedet;
assign  set_wait_synp    = state_wait_align & detected_alignp;
assign  set_wait_linkup  = state_wait_synp & detected_syncp;
assign  set_error        = timer_fin & (state_wait_cominit | state_wait_comwake | state_wait_align | state_wait_synp);
assign  clr_wait_cominit = set_wait_comwake | set_error;
assign  clr_wait_comwake = set_wait_align | set_error;
assign  clr_wait_align   = set_wait_synp | set_error;
assign  clr_wait_synp    = set_wait_linkup | set_error;
assign  clr_wait_linkup  = state_wait_linkup; //TODO not so important, but still have to trace 3 back-to-back non alignp primitives
assign  clr_error        = state_error;

// waiting timeout timer
assign  timer_fin = timer == TIMER_LIMIT;
assign  timer_clr = set_error | state_error | state_idle;
always @ (posedge clk)
    timer <= rst | timer_clr ? 20'h0 : timer + CLK_TO_TIMER_CONTRIB;

// something is wrong with speed grades if the host cannot lock to device's alignp stream
assign  oob_incompatible = state_wait_align & set_error;

// oob sequence is done, everything is okay
assign  oob_done = set_wait_linkup;

// noone responds to cominits
assign  oob_silence = set_error & state_wait_cominit;

// other timeouts
assign  oob_error = set_error & ~oob_silence & ~oob_incompatible;

// obvioud
assign  oob_busy = ~state_idle;

// set gtx controls
reg     txelecidle_r;
always @ (posedge clk)
    txelecidle_r <= rst ? 1'b1 : clr_wait_cominit ? 1'b0 : set_wait_cominit ? 1'b1 : txelecidle_r;

assign  txcominit  = set_wait_cominit;
assign  txcomwake  = set_wait_comwake;
assign  txelecidle = set_wait_cominit | txelecidle_r;

// indicate if link up condition was made
assign  link_up = clr_wait_linkup;

// link goes down when line is idle
reg     rxelecidle_r;
reg     rxelecidle_rr;
always @ (posedge clk)
begin
    rxelecidle_rr   <= rxelecidle_r;
    rxelecidle_r    <= rxelecidle;
end

assign  link_down = rxelecidle_rr;

// indicate that device is requesting for oob
reg     cominit_req_r;
wire    cominit_req_set;

assign  cominit_req_set = state_idle & rxcominitdet;
always @ (posedge clk)
    cominit_req_r <= (cominit_req_r | cominit_req_set) & ~(cominit_allow & cominit_req) & ~rst;
assign  cominit_req = cominit_req_set | cominit_req_r;

// detect which primitives sends the device after comwake was done
generate 
    if (DATA_BYTE_WIDTH == 2)
    begin
        reg detected_alignp_f;
        always @ (posedge clk)
            detected_alignp_f <= rst | ~state_wait_align ? 1'b0 : 
                                 ~|(rxdata ^ {8'b01001010, 8'b10111100}) & ~|(rxcharisk ^ 2'b01); // {D10.2, K28.5}
        assign detected_alignp = detected_alignp_f & ~|(rxdata ^ {8'b01111011, 8'b01001010}) & ~|(rxcharisk ^ 2'b00); // {D27.3, D10.2}
        
        reg detected_syncp_f;
        always @ (posedge clk)
            detected_syncp_f <= rst | ~state_wait_synp ? 1'b0 : 
                                ~|(rxdata ^ {8'b10010101, 8'b01111100}) & ~|(rxcharisk ^ 2'b01); // {D21.4, K28.3}
        assign detected_syncp = detected_syncp_f & ~|(rxdata ^ {8'b10110101, 8'b10110101}) & ~|(rxcharisk ^ 2'b00); // {D21.5, D21.5}
    end
    else
    if (DATA_BYTE_WIDTH == 4)
    begin
        assign detected_alignp = ~|(rxdata ^ {8'b01111011, 8'b01001010, 8'b01001010, 8'b10111100}) & ~|(rxcharisk ^ 4'h1); // {D27.3, D10.2, D10.2, K28.5}
        assign detected_syncp  = ~|(rxdata ^ {8'b10110101, 8'b10110101, 8'b10010101, 8'b01111100}) & ~|(rxcharisk ^ 4'h1); // {D21.5, D21.5, D21.4, K28.3}
    end
    else
    if (DATA_BYTE_WIDTH == 8)
    begin
        assign detected_alignp = ~|(rxdata ^ {2{8'b01111011, 8'b01001010, 8'b01001010, 8'b10111100}}) & ~|(rxcharisk ^ 8'h11); // {D27.3, D10.2, D10.2, K28.5}
        assign detected_syncp  = ~|(rxdata ^ {2{8'b10110101, 8'b10110101, 8'b10010101, 8'b01111100}}) & ~|(rxcharisk ^ 8'h11); // {D21.5, D21.5, D21.4, K28.3}
    end
    else
    begin
        always @ (posedge clk)
        begin
            $display("%m oob module works only with 16/32/64 gtx input data width");
            $finish;
        end
    end
endgenerate

// buf inputs from gtx
always @ (posedge clk)
begin
    rxcominitdet <= rxcominitdet_in;
    rxcomwakedet <= rxcomwakedet_in;
    rxelecidle   <= rxelecidle_in;
    rxdata       <= rxdata_in;
    rxcharisk    <= rxcharisk_in;
end

// set data outputs to upper levels
assign  rxdata_out    = rxdata;
assign  rxcharisk_out = rxcharisk;

// as depicted @ doc, p264, figure 163, have to insert D10.2 and align primitives after
// getting comwake from device
reg     [DATA_BYTE_WIDTH*8 - 1:0] txdata;
reg     [DATA_BYTE_WIDTH - 1:0]   txcharisk;
wire    [DATA_BYTE_WIDTH*8 - 1:0] txdata_d102;
wire    [DATA_BYTE_WIDTH - 1:0]   txcharisk_d102;
wire    [DATA_BYTE_WIDTH*8 - 1:0] txdata_align;
wire    [DATA_BYTE_WIDTH - 1:0]   txcharisk_align;

always @ (posedge clk)
begin
    txdata      <= state_wait_align ? txdata_d102 :
                   state_wait_synp  ? txdata_align : txdata_in;
    txcharisk   <= state_wait_align ? txcharisk_d102 :
                   state_wait_synp  ? txcharisk_align : txcharisk_in;
end

// Continious D10.2 primitive
assign  txcharisk_d102  = {DATA_BYTE_WIDTH{1'b0}};
assign  txdata_d102     = {DATA_BYTE_WIDTH{8'b01001010}};

// Align primitive: K28.5 + D10.2 + D10.2 + D27.3
generate 
    if (DATA_BYTE_WIDTH == 2)
    begin
        reg align_odd;
        always @ (posedge clk)
            align_odd <= rst | ~state_wait_synp ? 1'b0 : ~align_odd;
        
        assign txcharisk_align  = align_odd ? 2'b01 : 2'b00;
        assign txdata_align     = align_odd ? {8'b01001010, 8'b10111100} : // {D10.2, K28.5}
                                              {8'b01111011, 8'b01001010}; // {D27.3, D10.2}
    end
    else
    if (DATA_BYTE_WIDTH == 4)
    begin
        assign txcharisk_align  = 4'h1;
        assign txdata_align     = {8'b01111011, 8'b01001010, 8'b01001010, 8'b10111100}; // {D27.3, D10.2, D10.2, K28.5}
    end
    else
    if (DATA_BYTE_WIDTH == 8)
    begin
        assign txcharisk_align  = 8'h11;
        assign txdata_align     = {2{8'b01111011, 8'b01001010, 8'b01001010, 8'b10111100}}; // 2x{D27.3, D10.2, D10.2, K28.5}
    end
    else
        always @ (posedge clk)
        begin
            $display("%m oob module works only with 16/32/64 gtx input data width");
            $finish;
        end
endgenerate

// set data outputs to gtx
assign  txdata_out    = txdata;
assign  txcharisk_out = txcharisk;
*/
endmodule
