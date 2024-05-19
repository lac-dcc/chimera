// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>oob
 * @file oob.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief sata oob unit implementation
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * oob.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * oob.v file is distributed in the hope that it will be useful,
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
module oob #(
    parameter DATA_BYTE_WIDTH = 4,
    parameter CLK_SPEED_GRADE = 1 // 1 - 75 Mhz, 2 - 150Mhz, 4 - 300Mhz
)
(
    output  reg  [11:0] debug,
    input   wire    clk,                                      // sata clk = usrclk2
    input   wire    rst,                                      // reset oob
    // oob responses
    input   wire    rxcominitdet_in,
    input   wire    rxcomwakedet_in,
    input   wire    rxelecidle_in,
    // oob issues
    output  wire    txcominit,
    output  wire    txcomwake,
    output  wire    txelecidle,
    output  wire    txpcsreset_req,                           // partial tx reset
    input   wire    recal_tx_done,
    output  wire    rxreset_req,                              // rx reset (after rxelecidle -> 0)
    input   wire    rxreset_ack,
    
    // Andrey: adding new signal and state - after RX is operational try re-align clock
    output  wire    clk_phase_align_req,                      // Request GTX to align SIPO parallel clock and user- provided RXUSRCLK
    input   wire    clk_phase_align_ack,                      // GTX aligned clock phase (DEBUG - not always clear when it works or not)   
    
    input   wire    [DATA_BYTE_WIDTH*8 - 1:0] txdata_in,      // input data stream (if any data during OOB setting => ignored)
    input   wire    [DATA_BYTE_WIDTH - 1:0]   txcharisk_in,
    
    output  wire    [DATA_BYTE_WIDTH*8 - 1:0] txdata_out,    // output data stream to gtx
    output  wire    [DATA_BYTE_WIDTH - 1:0]   txcharisk_out,
    
    input   wire    [DATA_BYTE_WIDTH*8 - 1:0] rxdata_in,     // input data from gtx
    input   wire    [DATA_BYTE_WIDTH - 1:0]   rxcharisk_in,
    
    output  wire    [DATA_BYTE_WIDTH*8 - 1:0] rxdata_out,    // bypassed data from gtx
    output  wire    [DATA_BYTE_WIDTH - 1:0]   rxcharisk_out,
    
    input   wire    oob_start,                               // oob sequence needs to be issued
    output  wire    oob_done,                                // connection established, all further data is valid
    output  wire    oob_busy,                                // oob can't handle new start request
    output  wire    link_up,                                 // doc p265, link is established after 3back-to-back non-ALIGNp
    output  wire    link_down,                               // link goes down - if rxelecidle
    output  wire    cominit_req,                             // the device itself sends cominit
    input   wire    cominit_allow,                           // allow to respond to cominit

    // status information to handle by a control block if any exists
    
    output  wire    oob_incompatible,                        // incompatible host-device speed grades (host cannot lock to alignp)
    output  wire    oob_error,                               // timeout in an unexpected place
    output  wire    oob_silence                              // noone responds to our cominits
    
    ,output debug_detected_alignp

`ifdef OOB_MULTISPEED
    //TODO
    // !!Implement it later on, ref to gen.adjustment fsm in the notebook!!

    // speed grade control
    ,
    // current speed grade, dynamic instead of static parameter
    input   wire    [2:0]   speed_grade,
    // clock to be adjusted to best speed
    input   wire    adj_clk,
    // ask for slower protocol clock
    output  wire    speed_down_req,
    input   wire    speed_down_ack,
    // reset speedgrade to the fastest one
    output  wire    speed_rst_req,
    input   wire    speed_rst_ack
`endif //OOB_MULTISPEED
);

assign debug_detected_alignp = detected_alignp;

`ifdef SIMULATION
    reg [639:0] HOST_OOB_TITLE ='bz; // to show human-readable state in the GTKWave
`endif



// 873.8 us error timer
// = 2621400 SATA2 serial ticks (period = 0.000333 us)
// = 131070 ticks @ 150Mhz
// = 65535  ticks @ 75Mhz 
localparam  [19:0]  CLK_TO_TIMER_CONTRIB = CLK_SPEED_GRADE == 1 ? 20'h4 :
                                           CLK_SPEED_GRADE == 2 ? 20'h2 :
                                           CLK_SPEED_GRADE == 4 ? 20'h1 : 20'h1;
                                           
localparam  RXDLYSRESET_CYCLES = 5; // minimum - 50ns
reg  [RXDLYSRESET_CYCLES-1:0] rxdlysreset_r;

assign clk_phase_align_req = rxdlysreset_r[RXDLYSRESET_CYCLES-1];
                                          
`ifdef SIMULATION                                           
localparam  [19:0]  TIMER_LIMIT = 19'd20000;
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
localparam NUM_CON_ALIGNS = 2; // just for debugging 1024;
reg  [1:0]  detected_alignp_cntr; // count detected ALIGNp - do not respond yet
///localparam NUM_CON_ALIGNS = 1024; // just for debugging 1024;
///reg [12:0]  detected_alignp_cntr; // count detected ALIGNp - do not respond yet
reg     detected_alignp_r; // debugging - N-th ALIGNp primitive
wire    detected_syncp;

// wait until device's cominit is done
reg     cominit_req_l;
reg     rxcominitdet_l;
reg     rxcomwakedet_l;
wire    rxcominit_done;
wire    rxcomwake_done;
reg     [9:0]   rxcom_timer;
// for 75MHz : period of cominit = 426.7 ns = 32 ticks => need to wait x6 pulses + 1 as an insurance => 224 clock cycles. Same thoughts for comwake
localparam  COMINIT_DONE_TIME = 896; // 300Mhz cycles
localparam  COMWAKE_DONE_TIME = 448; // 300Mhz cycles


// wait until rxelecidle is not stable (more or less) deasserted
// let's say, if rxelecidle = 0 longer, than 2 comwake burst duration (2 * 106.7 ns), elecidle is stable and we're receiving some data
// 2 * 106.7ns = 64 clock cycles @ 300 MHz, 32 @ 150, 16 @ 75
// rxelecidle is synchronous to sata host clk, sooo some idle raises can occur insensibly. Still, it means line issues, 
// not affecting the fact, oob was done and a stage when device sends alignps started
reg [7:0]   eidle_timer;
wire        eidle_timer_done;

// fsm, doc p265,266
wire    state_idle;
reg     state_wait_cominit;
reg     state_wait_comwake;
reg     state_recal_tx;
reg     state_wait_eidle;
reg     state_wait_rxrst;
reg     state_wait_align;
reg     state_wait_clk_align;
reg     state_wait_align2; // after clocks aligned
reg     state_wait_synp;
reg     state_wait_linkup;
reg     state_error;

wire    set_wait_cominit;
wire    set_wait_comwake;
wire    set_recal_tx;
wire    set_wait_eidle;
wire    set_wait_rxrst;
wire    set_wait_align;
wire    set_wait_clk_align;
wire    set_wait_align2;
wire    set_wait_synp;
wire    set_wait_linkup;
wire    set_error;
wire    clr_wait_cominit;
wire    clr_wait_comwake;
wire    clr_recal_tx;
wire    clr_wait_eidle;
wire    clr_wait_rxrst;
wire    clr_wait_align;
wire    clr_wait_clk_align;
wire    clr_wait_align2;
wire    clr_wait_synp;
wire    clr_wait_linkup;
wire    clr_error;

always @ (posedge clk) begin
    if      (rst || rxelecidle)  rxdlysreset_r <= 0;
    else if (set_wait_clk_align) rxdlysreset_r <= ~0;
    else                         rxdlysreset_r <= rxdlysreset_r << 1; 
end

reg was_rxelecidle_waiting_reset;
always @ (posedge clk) begin
    if      (rst || set_wait_eidle)          was_rxelecidle_waiting_reset <= 0;
    else if (state_wait_rxrst && rxelecidle) was_rxelecidle_waiting_reset <= 1;
end
assign  state_idle = ~state_wait_cominit &
                     ~state_wait_comwake &
                     ~state_wait_align &
                     ~state_wait_clk_align &
                     ~state_wait_align2 &
                     ~state_wait_synp &
                     ~state_wait_linkup &
                     ~state_error &
                     ~state_recal_tx &
                     ~state_wait_rxrst &
                     ~state_wait_eidle;
always @ (posedge clk)
begin
    state_wait_cominit   <= (state_wait_cominit   | set_wait_cominit  ) & ~clr_wait_cominit   & ~rst;
    state_wait_comwake   <= (state_wait_comwake   | set_wait_comwake  ) & ~clr_wait_comwake   & ~rst;
    state_recal_tx       <= (state_recal_tx       | set_recal_tx      ) & ~clr_recal_tx       & ~rst;
    state_wait_eidle     <= (state_wait_eidle     | set_wait_eidle    ) & ~clr_wait_eidle     & ~rst;
    state_wait_rxrst     <= (state_wait_rxrst     | set_wait_rxrst    ) & ~clr_wait_rxrst     & ~rst;
    state_wait_align     <= (state_wait_align     | set_wait_align    ) & ~clr_wait_align     & ~rst;
    state_wait_clk_align <= (state_wait_clk_align | set_wait_clk_align) & ~clr_wait_clk_align & ~rst;
    state_wait_align2    <= (state_wait_align2    | set_wait_align2   ) & ~clr_wait_align2    & ~rst;
    state_wait_synp      <= (state_wait_synp      | set_wait_synp     ) & ~clr_wait_synp      & ~rst;
    state_wait_linkup    <= (state_wait_linkup    | set_wait_linkup   ) & ~clr_wait_linkup    & ~rst;
    state_error          <= (state_error          | set_error         ) & ~clr_error          & ~rst;
end

assign  set_wait_cominit   = state_idle & oob_start & ~cominit_req;
assign  set_wait_comwake   = state_idle & cominit_req_l & cominit_allow & rxcominit_done | state_wait_cominit & rxcominitdet_l & rxcominit_done;
assign  set_recal_tx       = state_wait_comwake & rxcomwakedet_l & rxcomwake_done;
///assign  set_wait_eidle     = state_recal_tx & recal_tx_done;
assign  set_wait_eidle     = (state_recal_tx & recal_tx_done) |
                             (rxelecidle & 
                              (state_wait_align | state_wait_clk_align | state_wait_align2 | (state_wait_rxrst & rxreset_ack & was_rxelecidle_waiting_reset) ));
assign  set_wait_rxrst     = state_wait_eidle & eidle_timer_done;
///assign  set_wait_align     = state_wait_rxrst & rxreset_ack;
///assign  set_wait_clk_align = state_wait_align & (detected_alignp_r);
///assign  set_wait_align2    = state_wait_clk_align & clk_phase_align_ack;
assign  set_wait_align     = state_wait_rxrst & rxreset_ack & ~rxelecidle;
assign  set_wait_clk_align = state_wait_align & (detected_alignp_r) & ~rxelecidle;
assign  set_wait_align2    = state_wait_clk_align & clk_phase_align_ack & ~rxelecidle;



//assign  set_wait_synp    = state_wait_align & detected_alignp;
assign  set_wait_synp    = state_wait_align2 & (detected_alignp_r); // N previous were both ALIGNp
assign  set_wait_linkup  = state_wait_synp & detected_syncp;
assign  set_error        = timer_fin & (state_wait_cominit |
                                        state_wait_comwake |
                                        state_recal_tx |
                                        state_wait_eidle |
                                        state_wait_rxrst |
                                        state_wait_align |
                                        state_wait_clk_align |
                                        state_wait_align2 |
                                        state_wait_synp/* | state_wait_linkup*/);

assign  clr_wait_cominit   = set_wait_comwake   | set_error;
assign  clr_wait_comwake   = set_recal_tx       | set_error;
assign  clr_recal_tx       = set_wait_eidle     | set_error;
assign  clr_wait_eidle     = set_wait_rxrst     | set_error;
///assign  clr_wait_rxrst     = set_wait_align     | set_error;
assign  clr_wait_rxrst     = state_wait_rxrst & rxreset_ack; 

///assign  clr_wait_align     = set_wait_clk_align | set_error;
///assign  clr_wait_clk_align = set_wait_align2    | set_error;
///assign  clr_wait_align2    = set_wait_synp      | set_error;
assign  clr_wait_align     = set_wait_clk_align | set_error | rxelecidle;
assign  clr_wait_clk_align = set_wait_align2    | set_error | rxelecidle;
assign  clr_wait_align2    = set_wait_synp      | set_error | rxelecidle;



assign  clr_wait_synp      = set_wait_linkup    | set_error;
assign  clr_wait_linkup    = state_wait_linkup; //TODO not so important, but still have to trace 3 back-to-back non alignp primitives
assign  clr_error          = state_error;

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

// ask for recalibration
assign  txpcsreset_req = state_recal_tx;

// ask for rxreset
assign  rxreset_req = state_wait_rxrst;

// set gtx controls
reg     txelecidle_r;
always @ (posedge clk)
    txelecidle_r <= rst ? 1'b1 : /*clr_wait_cominit */ clr_wait_comwake ? 1'b0 : set_wait_cominit ? 1'b1 : txelecidle_r;

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

// primitives
wire    [63:0]  alignp  = {8'b01111011, 8'b01001010, 8'b01001010, 8'b10111100, 8'b01111011, 8'b01001010, 8'b01001010, 8'b10111100};
wire    [63:0]  syncp   = {8'b10110101, 8'b10110101, 8'b10010101, 8'b01111100, 8'b10110101, 8'b10110101, 8'b10010101, 8'b01111100};

// detect which primitives sends the device after comwake was done
generate 
    if (DATA_BYTE_WIDTH == 2)
    begin
        reg detected_alignp_f;
        always @ (posedge clk)
            detected_alignp_f <= rst | ~state_wait_align ? 1'b0 : 
                                 ~|(rxdata[15:0] ^ alignp[15:0]) & ~|(rxcharisk[1:0] ^ 2'b01); // {D10.2, K28.5}
        assign detected_alignp = detected_alignp_f & ~|(rxdata[15:0] ^ alignp[31:16]) & ~|(rxcharisk[1:0] ^ 2'b00); // {D27.3, D10.2}  // S uppressThisWarning VEditor -warning would be fixed in future releases
        
        reg detected_syncp_f;
        always @ (posedge clk)
            detected_syncp_f <= rst | ~state_wait_synp ? 1'b0 : 
                                ~|(rxdata[15:0] ^ syncp[15:0]) & ~|(rxcharisk[1:0] ^ 2'b01); // {D21.4, K28.3}
        assign detected_syncp = detected_syncp_f & ~|(rxdata[15:0] ^ syncp[31:16]) & ~|(rxcharisk[1:0] ^ 2'b00); // {D21.5, D21.5}  // S uppressThisWarning VEditor -warning would be fixed in future releases
    end
    else
    if (DATA_BYTE_WIDTH == 4)
    begin
        assign detected_alignp = ~|(rxdata[31:0] ^ alignp[31:0]) & ~|(rxcharisk[3:0] ^ 4'h1); // {D27.3, D10.2, D10.2, K28.5}  // S uppressThisWarning VEditor -warning would be fixed in future releases
        assign detected_syncp  = ~|(rxdata[31:0] ^ syncp[31:0])  & ~|(rxcharisk[3:0] ^ 4'h1); // {D21.5, D21.5, D21.4, K28.3}  // S uppressThisWarning VEditor -warning would be fixed in future releases
    end
    else
    if (DATA_BYTE_WIDTH == 8)
    begin
        assign detected_alignp = ~|(rxdata[63:0] ^ alignp[63:0]) & ~|(rxcharisk[7:0] ^ 8'h11); // {D27.3, D10.2, D10.2, K28.5}  // SuppressThisWarning VEditor -warning would be fixed in future releases
        assign detected_syncp  = ~|(rxdata[63:0] ^ syncp[63:0])  & ~|(rxcharisk[7:0] ^ 8'h11); // {D21.5, D21.5, D21.4, K28.3}  // SuppressThisWarning VEditor -warning would be fixed in future releases
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

// calculate an aproximate time when oob burst shall be done
assign  rxcominit_done = rxcom_timer == COMINIT_DONE_TIME & state_wait_cominit;
assign  rxcomwake_done = rxcom_timer == COMWAKE_DONE_TIME & state_wait_comwake;

always @ (posedge clk) begin
    cominit_req_l   <= rst | rxcominit_done | ~state_idle         ? 1'b0 : cominit_req    ? 1'b1 : cominit_req_l;
    rxcominitdet_l  <= rst | rxcominit_done | ~state_wait_cominit ? 1'b0 : rxcominitdet   ? 1'b1 : rxcominitdet_l;
    rxcomwakedet_l  <= rst | rxcomwake_done | ~state_wait_comwake ? 1'b0 : rxcomwakedet   ? 1'b1 : rxcomwakedet_l;
end

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
                   state_wait_rxrst ? txdata_d102 :
                   state_wait_synp  ? txdata_align : txdata_in;
    txcharisk   <= state_wait_align ? txcharisk_d102 :
                   state_wait_rxrst ? txcharisk_d102 :
                   state_wait_synp  ? txcharisk_align : txcharisk_in;
end

// Continious D10.2 primitive
assign  txcharisk_d102  = {DATA_BYTE_WIDTH{1'b0}};
assign  txdata_d102     = {DATA_BYTE_WIDTH{8'b01001010}};   // SuppressThisWarning VEditor -warning would be fixed in future releases

// Align primitive: K28.5 + D10.2 + D10.2 + D27.3
generate 
    if (DATA_BYTE_WIDTH == 2)
    begin
        reg align_odd;
        always @ (posedge clk)
            align_odd <= rst | ~state_wait_synp ? 1'b0 : ~align_odd;
        
        assign txcharisk_align[DATA_BYTE_WIDTH - 1:0]   = align_odd ? 2'b01 : 2'b00;                    // SuppressThisWarning VEditor -warning would be fixed in future releases
        assign txdata_align[DATA_BYTE_WIDTH*8 - 1:0]    = align_odd ? alignp[15:0] : // {D10.2, K28.5}  // SuppressThisWarning VEditor -warning would be fixed in future releases
                                                                      alignp[31:16]; // {D27.3, D10.2}  // SuppressThisWarning VEditor -warning would be fixed in future releases
    end
    else
    if (DATA_BYTE_WIDTH == 4)
    begin
        assign txcharisk_align[DATA_BYTE_WIDTH - 1:0]   = 4'h1;
        assign txdata_align[DATA_BYTE_WIDTH*8 - 1:0]    = alignp[DATA_BYTE_WIDTH*8 - 1:0]; // {D27.3, D10.2, D10.2, K28.5}
    end
    else
    if (DATA_BYTE_WIDTH == 8)
    begin
        assign txcharisk_align[DATA_BYTE_WIDTH - 1:0]   = 8'h11;  // SuppressThisWarning VEditor -warning would be fixed in future releases
        assign txdata_align[DATA_BYTE_WIDTH*8 - 1:0]    = alignp[DATA_BYTE_WIDTH*8 - 1:0]; // 2x{D27.3, D10.2, D10.2, K28.5}
    end
    else
        always @ (posedge clk)
        begin
            $display("%m oob module works only with 16/32/64 gtx input data width");
            $finish;
        end
endgenerate

`ifdef SIMULATION
// info msgs
always @ (posedge clk) 
begin
    if (txcominit) begin
        HOST_OOB_TITLE = "Issued cominit";
        $display("[Host] OOB:         %s @%t",HOST_OOB_TITLE,$time);
    end
    if (txcomwake) begin
        HOST_OOB_TITLE = "Issued comwake";
        $display("[Host] OOB:         %s @%t",HOST_OOB_TITLE,$time);
    end
    if (state_wait_linkup) begin
        HOST_OOB_TITLE = "Link is up";
        $display("[Host] OOB:         %s @%t",HOST_OOB_TITLE,$time);
    end
    if (set_wait_synp) begin
        HOST_OOB_TITLE = "Started continious align sending";
        $display("[Host] OOB:         %s @%t",HOST_OOB_TITLE,$time);
    end
end
`endif

always @ (posedge clk)
    rxcom_timer <= rst | rxcominit_done & state_wait_cominit | rxcomwake_done & state_wait_comwake | rxcominitdet & state_wait_cominit | rxcomwakedet & state_wait_comwake ? 10'h0 : cominit_req_l & state_idle | rxcominitdet_l & state_wait_cominit | rxcomwakedet_l & state_wait_comwake ? rxcom_timer + CLK_TO_TIMER_CONTRIB[9:0] : 10'h0;

// set data outputs to gtx
assign  txdata_out    = txdata;
assign  txcharisk_out = txcharisk;

// rxelectidle timer logic
assign  eidle_timer_done = eidle_timer == 64;
always @ (posedge clk)
    eidle_timer <= rst | rxelecidle | ~state_wait_eidle ? 8'b0 : eidle_timer + CLK_TO_TIMER_CONTRIB[7:0];
    
always @ (posedge clk) begin
    if (rst || !detected_alignp)    detected_alignp_cntr <= NUM_CON_ALIGNS;
    else if (|detected_alignp_cntr) detected_alignp_cntr <= detected_alignp_cntr -1;
    detected_alignp_r <= detected_alignp_cntr == 0;
end

always @ (posedge clk)
    debug <= rst ? 12'h000 : { 
                                state_idle,
                                state_wait_cominit,
                                state_wait_comwake,
                                state_recal_tx,
                                state_wait_eidle,
                                state_wait_rxrst,
                                state_wait_align,
                                state_wait_synp,
                                state_wait_linkup,
                                state_error,
                                oob_start,
                                oob_error} | debug;
                             

endmodule
