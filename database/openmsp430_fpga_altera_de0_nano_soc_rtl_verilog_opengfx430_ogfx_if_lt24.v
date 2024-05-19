// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

//----------------------------------------------------------------------------
// Copyright (C) 2015 Authors
//
// This source file may be used and distributed without restriction provided
// that this copyright statement is not removed from the file and that any
// derivative work contains the original copyright notice and the associated
// disclaimer.
//
// This source file is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation; either version 2.1 of the License, or
// (at your option) any later version.
//
// This source is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this source; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
//----------------------------------------------------------------------------
//
// *File Name: ogfx_if_lt24.v
//
// *Module Description:
//                      Interface to the LT24 LCD display.
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev$
// $LastChangedBy$
// $LastChangedDate$
//----------------------------------------------------------------------------
`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_defines.v"
`endif

module  ogfx_if_lt24 (

// OUTPUTs
    event_fsm_done_o,                              // Event  - FSM is done
    event_fsm_start_o,                             // Event  - FSM is starting

    lt24_cs_n_o,                                   // LT24 Chip select (Active low)
    lt24_d_o,                                      // LT24 Data output
    lt24_d_en_o,                                   // LT24 Data output enable
    lt24_rd_n_o,                                   // LT24 Read strobe (Active low)
    lt24_rs_o,                                     // LT24 Command/Param selection (Cmd=0/Param=1)
    lt24_wr_n_o,                                   // LT24 Write strobe (Active low)

    refresh_active_o,                              // Display refresh on going
    refresh_data_request_o,                        // Display refresh new data request

    status_o,                                      // Status - FSM

// INPUTs
    mclk,                                          // Main system clock
    puc_rst,                                       // Main system reset

    cfg_lt24_clk_div_i,                            // Clock Divider configuration for LT24 interface
    cfg_lt24_display_size_i,                       // Display size (number of pixels)
    cfg_lt24_refresh_i,                            // Refresh rate configuration for LT24 interface
    cfg_lt24_refresh_sync_en_i,                    // Refresh sync enable configuration for LT24 interface
    cfg_lt24_refresh_sync_val_i,                   // Refresh sync value configuration for LT24 interface

    cmd_dfill_i,                                   // Display refresh data
    cmd_dfill_trig_i,                              // Trigger a full display refresh

    cmd_generic_cmd_val_i,                         // Generic command value
    cmd_generic_has_param_i,                       // Generic command to be sent has parameter(s)
    cmd_generic_param_val_i,                       // Generic command parameter value
    cmd_generic_trig_i,                            // Trigger generic command transmit (or new parameter available)

    cmd_refresh_i,                                 // Display refresh command

    lt24_d_i,                                      // LT24 Data input

    refresh_data_i,                                // Display refresh data
    refresh_data_ready_i                           // Display refresh new data is ready
);

// OUTPUTs
//=========
output              event_fsm_done_o;              // LT24 FSM done event
output              event_fsm_start_o;             // LT24 FSM start event

output              lt24_cs_n_o;                   // LT24 Chip select (Active low)
output       [15:0] lt24_d_o;                      // LT24 Data output
output              lt24_d_en_o;                   // LT24 Data output enable
output              lt24_rd_n_o;                   // LT24 Read strobe (Active low)
output              lt24_rs_o;                     // LT24 Command/Param selection (Cmd=0/Param=1)
output              lt24_wr_n_o;                   // LT24 Write strobe (Active low)

output              refresh_active_o;              // Display refresh on going
output              refresh_data_request_o;        // Display refresh new data request

output        [4:0] status_o;                      // LT24 FSM Status

// INPUTs
//=========
input               mclk;                          // Main system clock
input               puc_rst;                       // Main system reset

input         [2:0] cfg_lt24_clk_div_i;            // Clock Divider configuration for LT24 interface
input [`SPIX_MSB:0] cfg_lt24_display_size_i;       // Display size (number of pixels)
input        [11:0] cfg_lt24_refresh_i;            // Refresh rate configuration for LT24 interface
input               cfg_lt24_refresh_sync_en_i;    // Refresh sync enable configuration for LT24 interface
input         [9:0] cfg_lt24_refresh_sync_val_i;   // Refresh sync value configuration for LT24 interface

input        [15:0] cmd_dfill_i;                   // Display refresh data
input               cmd_dfill_trig_i;              // Trigger a full display refresh

input         [7:0] cmd_generic_cmd_val_i;         // Generic command value
input               cmd_generic_has_param_i;       // Generic command to be sent has parameter(s)
input        [15:0] cmd_generic_param_val_i;       // Generic command parameter value
input               cmd_generic_trig_i;            // Trigger generic command transmit (or new parameter available)

input               cmd_refresh_i;                 // Display refresh command

input        [15:0] lt24_d_i;                      // LT24 Data input

input        [15:0] refresh_data_i;                // Display refresh data
input               refresh_data_ready_i;          // Display refresh new data is ready


//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

// State machine registers
reg          [4:0] lt24_state;
reg          [4:0] lt24_state_nxt;

// Others
reg                refresh_trigger;
wire               status_gts_match;

// State definition
parameter          STATE_IDLE                =   0,    // IDLE state

                   STATE_CMD_LO              =   1,    // Generic command to LT24
                   STATE_CMD_HI              =   2,
                   STATE_CMD_PARAM_LO        =   3,
                   STATE_CMD_PARAM_HI        =   4,
                   STATE_CMD_PARAM_WAIT      =   5,

                   STATE_RAMWR_INIT_CMD_LO   =   6,    // Initialize display buffer with data
                   STATE_RAMWR_INIT_CMD_HI   =   7,
                   STATE_RAMWR_INIT_DATA_LO  =   8,
                   STATE_RAMWR_INIT_DATA_HI  =   9,

                   STATE_SCANLINE_CMD_LO     =  10,    // Wait for right scanline
                   STATE_SCANLINE_CMD_HI     =  11,
                   STATE_SCANLINE_DUMMY_LO   =  12,
                   STATE_SCANLINE_DUMMY_HI   =  13,
                   STATE_SCANLINE_GTS1_LO    =  14,
                   STATE_SCANLINE_GTS1_HI    =  15,
                   STATE_SCANLINE_GTS2_LO    =  16,
                   STATE_SCANLINE_GTS2_HI    =  17,


                   STATE_RAMWR_REFR_CMD_LO   =  18,    // Refresh display buffer
                   STATE_RAMWR_REFR_CMD_HI   =  19,
                   STATE_RAMWR_REFR_WAIT     =  20,
                   STATE_RAMWR_REFR_DATA_LO  =  21,
                   STATE_RAMWR_REFR_DATA_HI  =  22;


//============================================================================
// 5) STATE MACHINE SENDING IMAGE DATA TO A SPECIFIED DISPLAY
//============================================================================

//--------------------------------
// LT24 Controller Clock Timer
//--------------------------------
reg [3:0] lt24_timer;

wire      lt24_timer_done = lt24_d_en_o ? (lt24_timer == {1'b0, cfg_lt24_clk_div_i}) :
                                          (lt24_timer == {cfg_lt24_clk_div_i, 1'b0}) ; // Use slower timing for read accesses

wire      lt24_timer_run  = (lt24_state     != STATE_IDLE)            &
                            (lt24_state     != STATE_CMD_PARAM_WAIT)  &
                            (lt24_state     != STATE_RAMWR_REFR_WAIT) &
                            ~lt24_timer_done;

wire      lt24_timer_init = (lt24_timer_done                          &                                                   // Init if counter reaches limit:
                           !((lt24_state    == STATE_CMD_PARAM_HI)    & cmd_generic_has_param_i) &                        //    -> if not moving to STATE_CMD_PARAM_WAIT
                           !((lt24_state    == STATE_CMD_PARAM_WAIT)))                           |                        //    -> if not in STATE_CMD_PARAM_WAIT
                            ((lt24_state    == STATE_CMD_PARAM_WAIT)  & (cmd_generic_trig_i | ~cmd_generic_has_param_i)); // Init when leaving the STATE_CMD_PARAM_WAIT state

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)              lt24_timer <= 4'h0;
  else if (lt24_timer_init) lt24_timer <= 4'h0;
  else if (lt24_timer_run)  lt24_timer <= lt24_timer+4'h1;


//--------------------------------
// Pixel counter
//--------------------------------
reg [`SPIX_MSB:0] lt24_pixel_cnt;

wire              lt24_pixel_cnt_run  = (lt24_state==STATE_RAMWR_INIT_DATA_HI) |
                                        (lt24_state==STATE_RAMWR_REFR_DATA_HI);

wire              lt24_pixel_cnt_done = (lt24_pixel_cnt==1) | (lt24_pixel_cnt==0);

wire              lt24_pixel_cnt_init = (lt24_state==STATE_RAMWR_INIT_CMD_HI) |
                                        (lt24_state==STATE_RAMWR_REFR_CMD_HI) |
                                        (lt24_pixel_cnt_done & lt24_pixel_cnt_run);

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                      lt24_pixel_cnt <= {`SPIX_MSB+1{1'h0}};
  else if (lt24_timer_init)
    begin
       if (lt24_pixel_cnt_init)     lt24_pixel_cnt <= cfg_lt24_display_size_i;
       else if (lt24_pixel_cnt_run) lt24_pixel_cnt <= lt24_pixel_cnt-{{`SPIX_MSB{1'h0}},1'b1};
    end


//--------------------------------
// States Transitions
//--------------------------------
always @(lt24_state or cmd_dfill_trig_i or cmd_generic_trig_i or refresh_trigger or cfg_lt24_refresh_sync_en_i or status_gts_match or refresh_data_request_o or cmd_generic_has_param_i or lt24_timer_done or lt24_pixel_cnt_done)
    case(lt24_state)
      STATE_IDLE               :  lt24_state_nxt =  cmd_dfill_trig_i           ? STATE_RAMWR_INIT_CMD_LO  :
                                                    refresh_trigger            ?
                                                   (cfg_lt24_refresh_sync_en_i ? STATE_SCANLINE_CMD_LO    : STATE_RAMWR_REFR_CMD_LO) :
                                                    cmd_generic_trig_i         ? STATE_CMD_LO             : STATE_IDLE               ;

      // GENERIC COMMANDS
      STATE_CMD_LO             :  lt24_state_nxt = ~lt24_timer_done            ? STATE_CMD_LO             : STATE_CMD_HI             ;
      STATE_CMD_HI             :  lt24_state_nxt = ~lt24_timer_done            ? STATE_CMD_HI             :
                                                    cmd_generic_has_param_i    ? STATE_CMD_PARAM_LO       : STATE_IDLE               ;

      STATE_CMD_PARAM_LO       :  lt24_state_nxt = ~lt24_timer_done            ? STATE_CMD_PARAM_LO       : STATE_CMD_PARAM_HI       ;
      STATE_CMD_PARAM_HI       :  lt24_state_nxt = ~lt24_timer_done            ? STATE_CMD_PARAM_HI       :
                                                    cmd_generic_has_param_i    ? STATE_CMD_PARAM_WAIT     : STATE_IDLE               ;

      STATE_CMD_PARAM_WAIT     :  lt24_state_nxt =  cmd_generic_trig_i         ? STATE_CMD_PARAM_LO       :
                                                    cmd_generic_has_param_i    ? STATE_CMD_PARAM_WAIT     : STATE_IDLE               ;

      // MEMORY INITIALIZATION
      STATE_RAMWR_INIT_CMD_LO  :  lt24_state_nxt = ~lt24_timer_done            ? STATE_RAMWR_INIT_CMD_LO  : STATE_RAMWR_INIT_CMD_HI  ;
      STATE_RAMWR_INIT_CMD_HI  :  lt24_state_nxt = ~lt24_timer_done            ? STATE_RAMWR_INIT_CMD_HI  : STATE_RAMWR_INIT_DATA_LO ;

      STATE_RAMWR_INIT_DATA_LO :  lt24_state_nxt = ~lt24_timer_done            ? STATE_RAMWR_INIT_DATA_LO : STATE_RAMWR_INIT_DATA_HI ;
      STATE_RAMWR_INIT_DATA_HI :  lt24_state_nxt =  lt24_timer_done      &
                                                    lt24_pixel_cnt_done        ? STATE_IDLE               :
                                                   ~lt24_timer_done            ? STATE_RAMWR_INIT_DATA_HI : STATE_RAMWR_INIT_DATA_LO ;

      // WAIT FOR RIGHT SCANLINE BEFORE REFRESH
      STATE_SCANLINE_CMD_LO    :  lt24_state_nxt = ~lt24_timer_done            ? STATE_SCANLINE_CMD_LO    : STATE_SCANLINE_CMD_HI    ;
      STATE_SCANLINE_CMD_HI    :  lt24_state_nxt = ~lt24_timer_done            ? STATE_SCANLINE_CMD_HI    : STATE_SCANLINE_DUMMY_LO  ;

      STATE_SCANLINE_DUMMY_LO  :  lt24_state_nxt = ~lt24_timer_done            ? STATE_SCANLINE_DUMMY_LO  : STATE_SCANLINE_DUMMY_HI  ;
      STATE_SCANLINE_DUMMY_HI  :  lt24_state_nxt = ~lt24_timer_done            ? STATE_SCANLINE_DUMMY_HI  : STATE_SCANLINE_GTS1_LO   ;

      STATE_SCANLINE_GTS1_LO   :  lt24_state_nxt = ~lt24_timer_done            ? STATE_SCANLINE_GTS1_LO   : STATE_SCANLINE_GTS1_HI   ;
      STATE_SCANLINE_GTS1_HI   :  lt24_state_nxt = ~lt24_timer_done            ? STATE_SCANLINE_GTS1_HI   : STATE_SCANLINE_GTS2_LO   ;

      STATE_SCANLINE_GTS2_LO   :  lt24_state_nxt = ~lt24_timer_done            ? STATE_SCANLINE_GTS2_LO   : STATE_SCANLINE_GTS2_HI   ;
      STATE_SCANLINE_GTS2_HI   :  lt24_state_nxt = ~lt24_timer_done            ? STATE_SCANLINE_GTS2_HI   :
                                                   (status_gts_match |
                                                  ~cfg_lt24_refresh_sync_en_i) ? STATE_RAMWR_REFR_CMD_LO  : STATE_SCANLINE_CMD_LO    ;

      // FRAME REFRESH
      STATE_RAMWR_REFR_CMD_LO  :  lt24_state_nxt = ~lt24_timer_done            ? STATE_RAMWR_REFR_CMD_LO  : STATE_RAMWR_REFR_CMD_HI  ;
      STATE_RAMWR_REFR_CMD_HI  :  lt24_state_nxt = ~lt24_timer_done            ? STATE_RAMWR_REFR_CMD_HI  :
                                                   ~refresh_data_request_o     ? STATE_RAMWR_REFR_DATA_LO : STATE_RAMWR_REFR_WAIT    ;

      STATE_RAMWR_REFR_WAIT    :  lt24_state_nxt = ~refresh_data_request_o     ? STATE_RAMWR_REFR_DATA_LO : STATE_RAMWR_REFR_WAIT    ;

      STATE_RAMWR_REFR_DATA_LO :  lt24_state_nxt = ~lt24_timer_done            ? STATE_RAMWR_REFR_DATA_LO : STATE_RAMWR_REFR_DATA_HI ;
      STATE_RAMWR_REFR_DATA_HI :  lt24_state_nxt =  lt24_timer_done    &
                                                    lt24_pixel_cnt_done        ? STATE_IDLE               :
                                                   ~lt24_timer_done            ? STATE_RAMWR_REFR_DATA_HI :
                                                   ~refresh_data_request_o     ? STATE_RAMWR_REFR_DATA_LO : STATE_RAMWR_REFR_WAIT    ;

    // pragma coverage off
      default                  :  lt24_state_nxt =  STATE_IDLE;
    // pragma coverage on
    endcase

// State machine
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) lt24_state  <= STATE_IDLE;
  else         lt24_state  <= lt24_state_nxt;


// Output status
assign   status_o[0]             =  (lt24_state != STATE_IDLE);                                                            // LT24 FSM BUSY

assign   status_o[1]             =  (lt24_state == STATE_CMD_PARAM_WAIT);                                                  // LT24 Waits for command parameter

assign   status_o[2]             =  (lt24_state == STATE_RAMWR_REFR_CMD_LO)  | (lt24_state == STATE_RAMWR_REFR_CMD_HI)  |  // LT24 REFRESH BUSY
                                    (lt24_state == STATE_RAMWR_REFR_DATA_LO) | (lt24_state == STATE_RAMWR_REFR_DATA_HI) |
                                    (lt24_state == STATE_RAMWR_REFR_WAIT);

assign   status_o[3]             =  (lt24_state == STATE_SCANLINE_CMD_LO)    | (lt24_state == STATE_SCANLINE_CMD_HI)    |  // LT24 WAIT FOR SCANLINE
                                    (lt24_state == STATE_SCANLINE_DUMMY_LO)  | (lt24_state == STATE_SCANLINE_DUMMY_HI)  |
                                    (lt24_state == STATE_SCANLINE_GTS1_LO)   | (lt24_state == STATE_SCANLINE_GTS1_HI)   |
                                    (lt24_state == STATE_SCANLINE_GTS2_LO)   | (lt24_state == STATE_SCANLINE_GTS2_HI);

assign   status_o[4]             =  (lt24_state == STATE_RAMWR_INIT_CMD_LO)  | (lt24_state == STATE_RAMWR_INIT_CMD_HI)  |  // LT24 INIT BUSY
                                    (lt24_state == STATE_RAMWR_INIT_DATA_LO) | (lt24_state == STATE_RAMWR_INIT_DATA_HI);

assign   refresh_active_o        =  status_o[2];


// Refresh data request
wire     refresh_data_request_set = ((lt24_state == STATE_RAMWR_REFR_CMD_LO)  & (lt24_state_nxt == STATE_RAMWR_REFR_CMD_HI))  |
                                    ((lt24_state == STATE_RAMWR_REFR_DATA_LO) & (lt24_state_nxt == STATE_RAMWR_REFR_DATA_HI)) |
                                     (lt24_state == STATE_RAMWR_REFR_WAIT);
wire     refresh_data_request_clr = refresh_data_ready_i;
reg      refresh_data_request_reg;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) refresh_data_request_reg <= 1'b0;
  else         refresh_data_request_reg <= refresh_data_request_clr ? 1'b0 :
                                         refresh_data_request_set ? 1'b1 : refresh_data_request_reg;

assign   refresh_data_request_o  = refresh_data_request_reg & ~refresh_data_ready_i;

assign   event_fsm_start_o       =  (lt24_state_nxt != STATE_IDLE) & (lt24_state     == STATE_IDLE);
assign   event_fsm_done_o        =  (lt24_state     != STATE_IDLE) & (lt24_state_nxt == STATE_IDLE);


//============================================================================
// 6) LT24 CONTROLLER OUTPUT ASSIGNMENT
//============================================================================

// LT24 Chip select (active low)
reg  lt24_cs_n_o;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) lt24_cs_n_o <= 1'b1;
  else         lt24_cs_n_o <= (lt24_state_nxt==STATE_IDLE);

// Command (0) or Data (1)
reg  lt24_rs_o;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) lt24_rs_o   <= 1'b1;
  else         lt24_rs_o   <= ~((lt24_state_nxt==STATE_CMD_LO)            | (lt24_state_nxt==STATE_CMD_HI)            |
                                (lt24_state_nxt==STATE_SCANLINE_CMD_LO)   | (lt24_state_nxt==STATE_SCANLINE_CMD_HI)   |
                                (lt24_state_nxt==STATE_RAMWR_INIT_CMD_LO) | (lt24_state_nxt==STATE_RAMWR_INIT_CMD_HI) |
                                (lt24_state_nxt==STATE_RAMWR_REFR_CMD_LO) | (lt24_state_nxt==STATE_RAMWR_REFR_CMD_HI));

// LT24 Write strobe (Active low)
reg  lt24_wr_n_o;

wire lt24_wr_n_clr = (lt24_state_nxt==STATE_CMD_LO)            | (lt24_state_nxt==STATE_CMD_PARAM_LO)       | (lt24_state_nxt==STATE_SCANLINE_CMD_LO) |
                     (lt24_state_nxt==STATE_RAMWR_INIT_CMD_LO) | (lt24_state_nxt==STATE_RAMWR_INIT_DATA_LO) |
                     (lt24_state_nxt==STATE_RAMWR_REFR_CMD_LO) | (lt24_state_nxt==STATE_RAMWR_REFR_DATA_LO);

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)              lt24_wr_n_o <= 1'b1;
  else if (lt24_wr_n_clr)   lt24_wr_n_o <= 1'b0;
  else                      lt24_wr_n_o <= 1'b1;

// LT24 Read strobe (active low)
reg  lt24_rd_n_o;

wire lt24_rd_n_clr = (lt24_state_nxt==STATE_SCANLINE_DUMMY_LO) |
                     (lt24_state_nxt==STATE_SCANLINE_GTS1_LO)  | (lt24_state_nxt==STATE_SCANLINE_GTS2_LO);

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)              lt24_rd_n_o <= 1'b1;
  else if (lt24_rd_n_clr)   lt24_rd_n_o <= 1'b0;
  else                      lt24_rd_n_o <= 1'b1;


// LT24 Data
reg [15:0] lt24_d_nxt;
always @(lt24_state_nxt or cmd_generic_cmd_val_i or cmd_generic_param_val_i or lt24_d_o or cmd_dfill_i or refresh_data_i)
  case(lt24_state_nxt)
    STATE_IDLE               : lt24_d_nxt = 16'h0000;

    STATE_CMD_LO,
    STATE_CMD_HI	     : lt24_d_nxt = {8'h00, cmd_generic_cmd_val_i};
    STATE_CMD_PARAM_LO,
    STATE_CMD_PARAM_HI	     : lt24_d_nxt = cmd_generic_param_val_i;
    STATE_CMD_PARAM_WAIT     : lt24_d_nxt = lt24_d_o;

    STATE_RAMWR_INIT_CMD_LO,
    STATE_RAMWR_INIT_CMD_HI  : lt24_d_nxt = 16'h002C;
    STATE_RAMWR_INIT_DATA_LO,
    STATE_RAMWR_INIT_DATA_HI : lt24_d_nxt = cmd_dfill_i;

    STATE_SCANLINE_CMD_LO,
    STATE_SCANLINE_CMD_HI    : lt24_d_nxt = 16'h0045;

    STATE_RAMWR_REFR_CMD_LO,
    STATE_RAMWR_REFR_CMD_HI  : lt24_d_nxt = 16'h002C;
    STATE_RAMWR_REFR_DATA_LO : lt24_d_nxt = refresh_data_i;
    STATE_RAMWR_REFR_DATA_HI : lt24_d_nxt = lt24_d_o;
    STATE_RAMWR_REFR_WAIT    : lt24_d_nxt = lt24_d_o;

    // pragma coverage off
    default                  : lt24_d_nxt = 16'h0000;
    // pragma coverage on
  endcase

reg [15:0] lt24_d_o;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) lt24_d_o <= 16'h0000;
  else         lt24_d_o <= lt24_d_nxt;

// Output enable
reg lt24_d_en_o;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst) lt24_d_en_o <= 1'h0;       // Don't drive output during reset
  else         lt24_d_en_o <= ~((lt24_state_nxt == STATE_SCANLINE_DUMMY_LO) |
				(lt24_state_nxt == STATE_SCANLINE_DUMMY_HI) |
				(lt24_state_nxt == STATE_SCANLINE_GTS1_LO ) |
				(lt24_state_nxt == STATE_SCANLINE_GTS1_HI ) |
				(lt24_state_nxt == STATE_SCANLINE_GTS2_LO ) |
				(lt24_state_nxt == STATE_SCANLINE_GTS2_HI ));

//============================================================================
// 7) LT24 GTS VALUE (i.e. CURRENT SCAN LINE)
//============================================================================

reg  [1:0] status_gts_msb;
wire       status_gts_msb_wr  = ((lt24_state == STATE_SCANLINE_GTS1_LO) & (lt24_state_nxt == STATE_SCANLINE_GTS1_HI));
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                status_gts_msb <= 2'h0;
  else if (status_gts_msb_wr) status_gts_msb <= lt24_d_i[1:0];

reg  [7:0] status_gts_lsb;
wire       status_gts_lsb_wr  = ((lt24_state == STATE_SCANLINE_GTS2_LO) & (lt24_state_nxt == STATE_SCANLINE_GTS2_HI));
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                status_gts_lsb <= 8'h00;
  else if (status_gts_lsb_wr) status_gts_lsb <= lt24_d_i[7:0];

wire [7:0] unused_lt24_d_15_8 = lt24_d_i[15:8];
wire [9:0] status_gts         = {status_gts_msb, status_gts_lsb};

assign     status_gts_match   = (status_gts == cfg_lt24_refresh_sync_val_i);

//============================================================================
// 8) REFRESH TIMER & TRIGGER
//============================================================================

// Refresh Timer
reg [23:0] refresh_timer;
wire       refresh_timer_disable = (cfg_lt24_refresh_i==12'h000) | ~cmd_refresh_i;
wire       refresh_timer_done    = (refresh_timer[23:12]==cfg_lt24_refresh_i);

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                    refresh_timer <= 24'h000000;
  else if (refresh_timer_disable) refresh_timer <= 24'h000000;
  else if (refresh_timer_done)    refresh_timer <= 24'h000000;
  else                            refresh_timer <= refresh_timer + 24'h1;

// Refresh Trigger
wire       refresh_trigger_set = (lt24_state==STATE_IDLE) & cmd_refresh_i & (refresh_timer==24'h000000);
wire       refresh_trigger_clr = (lt24_state==STATE_RAMWR_REFR_CMD_LO);

always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                  refresh_trigger <= 1'b0;
  else if (refresh_trigger_set) refresh_trigger <= 1'b1;
  else if (refresh_trigger_clr) refresh_trigger <= 1'b0;

endmodule // ogfx_if_lt24

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
