// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
//------------------------------------------------------------------------
//--
//-- TITLE:    ocx_dlx_rx_lane.v
//-- FUNCTION: Deskews and unscrambles the received data and captures
//--           link training information on a per lane basis
//--
//------------------------------------------------------------------------


//-- (* PIN_DEFAULT_POWER_DOMAIN="VDN", PIN_DEFAULT_GROUND_DOMAIN="GND" *)
module ocx_dlx_rx_lane (

  //-- phy interface through rx
  valid_in              // < input  
 ,header_in             // < input  
 ,data_in               // < input  
 ,slip_out              // > output 

  //-- part 1 interface through rx
 ,found_pattern_a       // < input
 ,found_pattern_b       // < input
 ,found_sync_pattern    // < input
 ,ctl_header            // > output
 ,find_a                // > output
 ,find_b                // > output
 ,find_first_b          // > output    //-- found enough A to look for an inverted pattern B.
 ,nghbr_data_in         // < input
 ,nghbr_data_out        // < output

  //-- rx interface
 ,rx_clk_in             // < input  
 ,rx_reset              // < input  
 ,rx_data_out           // > output 
 ,rx_tx_last_byte_ts3   // > output  [7:0]
 ,training_enable       // < input  
 ,phy_training          // < input  
 ,deskew_enable         // < input  

 ,deskew_all_valid      // < input  
 ,deskew_reset          // < input  
 ,deskew_valid          // > output 
 ,deskew_overflow       // > output 
 ,x4_hold_data          // < input

 ,pattern_a             // > output 
 ,pattern_b             // > output 
 ,pattern_sync          // > output 
 ,pattern_TS1           // > output 
 ,pattern_TS2           // > output 
 ,pattern_TS3           // > output 
 ,block_lock            // > output 
 ,data_flit             // > output 

//--  ,gnd                   // <> inout
//--  ,vdn                   // <> inout

);

//!! Bugspray Include : ocx_dlx_rx_lane ;

//-- phy interface through rx
input           valid_in;       //-- data from phy is valid
input [1:0]     header_in;      //-- header from the phy                           
input [63:0]    data_in;        //-- data from the phy
output          slip_out;       //-- tell phy to slip

//-- part 1 interface through rx
input           found_pattern_a;
input           found_pattern_b;
input           found_sync_pattern;
output          ctl_header;
output          find_a;
output          find_b;
output          find_first_b;

//-- rx interface
input           rx_clk_in;              //-- clock used by rx
input           rx_reset;               //-- reset command from rx
output [63:0]   rx_data_out;            //-- data to the rx
input  [63:0]   nghbr_data_in;          //-- data from the next phy in pair
output [63:0]   nghbr_data_out;         //-- data for the next phy in pair
output [7:0]    rx_tx_last_byte_ts3;    //-- did the other end train?
input           training_enable;        //-- tell lane to train
input           phy_training;           //-- phy is training so ignore all data
input           deskew_enable;          //-- begin looking for deskew

input           deskew_all_valid;       //-- begin passing data out and lock pointers, all lanes are aligned
input           deskew_reset;           //-- reset deskew buffer, some lane overflowed
output          deskew_valid;           //-- data in deskew buffer for this lane (found a deskew block)
output          deskew_overflow;        //-- deskew buffer overflowed on this lane
input           x4_hold_data;           //-- Hold input data for extra cycle so it can be used next time

output          pattern_a;      //-- aligned pattern A's detected on this lane for at least 64 cycles
output          pattern_b;      //-- pattern B's detected on this lane for at least 64 cycles
output          pattern_sync;   //-- sync pattern detected on this lane in this cycle
output          pattern_TS1;    //-- aligned TS1 pattern detected on this lane this cycle
output          pattern_TS2;    //-- 8 aligned TS2 pattern have been detected on this lane
output          pattern_TS3;    //-- 8 aligned TS3 pattern have been detected on this lane
output          block_lock;     //-- lane is block locked
output          data_flit;      //-- lane is seeing a data flit

//-- inout gnd;
//-- (* GROUND_PIN="1" *)
//-- wire gnd;

//-- inout vdn;
//-- (* POWER_PIN="1" *)
//-- wire vdn;

//---------------------------------------- declarations ------------------------------------------------
//-- pattern A, B, sync
reg             count_pattern_a_q;      //-- in the state of finding pattern A's
reg             count_pattern_b_q;      //-- in the state of finding pattern B's
reg  [6:0]      a_cntr_q;               //-- counter for pattern A
reg  [6:0]      b_cntr_q;               //-- counter for pattern B
reg  [3:0]      pattern_b_cntr_q;       //-- count cycles between pattern B's
reg             pattern_a_q    ;            //-- latch before outputting pattern A detected on this lane
reg             pattern_b_q    ;            //-- latch before outputting pattern B detected on this lane
reg             pattern_sync_q ;         //-- latch before outputting sync pattern detected on this lane

wire            count_pattern_a_din;
wire            count_pattern_b_din;
wire [6:0]      a_cntr_din;
wire [6:0]      b_cntr_din;
wire [3:0]      pattern_b_cntr_din;
wire            pattern_a_din;
wire            pattern_b_din;
wire            pattern_sync_din;

wire            count_pattern_a;        //-- state of finding pattern A's
wire            count_pattern_b;        //-- state of finding pattern B's
wire            rcv_pattern_b;          //-- found a pattern B recently enough

wire            phy_training_done;      //-- phy_training went low, start ts1 receive
wire            reset;                  //-- reset/re-train

//-- TS blocks
reg             phy_training_d1_q;      //-- phy_training input delayed one cycle (needed to detect falling edge)
reg             find_ts_q;              //-- in the state of finding TS's
reg  [3:0]      ts1_cntr_q;             //-- for state of finding TS1's
reg  [3:0]      ts2_cntr_q;             //-- count 8 TS2's
reg  [3:0]      ts3_cntr_q;             //-- count 8 TS3's
reg             pattern_TS1_q;          //-- latch before outputting TS1's detected on this lane
reg             pattern_TS2_q;          //-- latch before outputting 8 TS2's detected on this lane
reg             pattern_TS3_q;          //-- latch before outputting 8 TS3's detected on this lane

wire            phy_training_d1_din;
wire            find_ts_din;
wire [3:0]      ts1_cntr_din;
wire [3:0]      ts2_cntr_din;
wire [3:0]      ts3_cntr_din;
wire            pattern_TS1_din;
wire            pattern_TS2_din;
wire            pattern_TS3_din;

wire            find_ts;                //-- in the state of finding TS's
wire [1:0]      ts_type;                //-- TS 1, 2, or 3
wire            found_data_flit;        //-- header 01 detected in current beat

//---- block lock
reg             find_header_q;          //-- sync pattern seen; now find the header in TS1 blocks and block align
reg             block_locked_q;         //-- latch before outputing block align is complete
reg  [6:0]      header_cntr_q;          //-- count 64 cycles seeing the header aligned

wire            find_header_din;
wire            block_locked_din;
wire [6:0]      header_cntr_din;

wire            find_header;            //-- search for header in TS1 blocks and align the block
wire            found_header;           //-- header is aligned
//wire            header_slip;            //-- slip to align the header
wire            block_locked;           //-- block align complete

//---- descrambling lfsr
reg  [0:22]     lfsr_q;                 //-- current lfsr value, loaded with final lfsr or advanced from last state
reg             lfsr_locked_q ;          //-- lfsr locked when receive 8 good TS
reg             lfsr_running_q;         //-- looking for 8 good TS sets in a row, or normal operation
reg  [0:2]      lfsr_cntr_q;            //-- the counter for the 8 good TS sets
reg  [1:0]      ts_type_d1_q;           //-- the type of TS received last cycle
reg  [1:0]      ts_type_d1c_q;           //-- copy_1
reg             bad_ts_d1_q;            //-- last cycle was neither a TS nor deskew block
reg             bad_ts_d2_q;            //-- last cycle was neither a TS nor deskew block

wire [0:22]     lfsr_din;
wire            lfsr_locked_din;
wire            lfsr_running_din;
wire [0:2]      lfsr_cntr_din;
wire [1:0]      ts_type_d1_din;
wire [1:0]      ts_type_d1c_din;
wire            bad_ts_d1_din;
wire            bad_ts_d2_din;

wire [0:47]     init_data_in;
wire [0:47]     raw_sequence1x;         //-- raw sequence used for scrambling
wire [0:47]     raw_sequence2x;
wire [0:47]     raw_sequence1;          //-- raw sequence with each byte reverse
wire [0:47]     raw_sequence2;
wire [0:22]     initial_lfsr1;
wire [0:22]     initial_lfsr2;
wire [0:22]     final_lfsr1;
wire [0:22]     final_lfsr2;
wire [23:47]    prbs_pattern1;
wire [23:47]    prbs_pattern2;
wire [0:4]      match_pat1;
wire [0:4]      match_pat2;
wire            match_pattern1;
wire            match_pattern2;
wire [0:63]     descramble;             //-- the prbs XOR'ed with the data to scramble it
wire [0:63]     descrambled_data_raw;   //-- descrambled and pre-reordering bytes
wire [0:63] 	descrambled_data;       //-- descrambled data
wire [63:0]     pre_deskew_data;        //-- optionally reordered descrambled data put into the deskew buffer
wire [63:0]     deskewed_data;          //-- data taken from deskew buffer and passed to rx
wire            lfsr_advance;
wire		lfsr_init_check;
wire            load_pattern1;
wire            load_pattern2;
wire            lfsr_lock;
wire            lfsr_unlock;            //-- unlock the lfsr and trigger re-init
wire            data_aligned;           //-- data is valid and header is aligned (can be used for lfsr lock)
wire            is_any_TS;              //-- is a TS 1, 2, or 3
wire            is_same_TS;             //-- is the same TS (1, 2, or 3) as last cycle
wire            bad_ts;                 //-- not a TS or deskew

//---- deskew
//--reg  [63:0]     deskewed_data_d0_q;       //-- the deskew buffer can hold 4 blocks
reg  [63:0]     deskew_buffer0_q;       //-- the deskew buffer can hold 4 blocks
reg  [63:0]     deskew_buffer1_q;
reg  [63:0]     deskew_buffer2_q;
reg  [63:0]     deskew_buffer3_q;
reg  [2:0]      deskew_write_ptr_q;     //-- write pointer into the deskew buffer
reg  [2:0]      deskew_read_ptr_q ;      //-- read pointer from the deskew buffer
//--reg             data_flit_q   ;           //-- make sure data_flit output aligns with data since rx cannot see header
reg             data_flit0_q   ;           //-- make sure data_flit output aligns with data since rx cannot see header
reg             data_flit1_q   ;
reg             data_flit2_q   ;
reg             data_flit3_q   ;
reg             deskew_found_q ;         //-- found a deskew block and thus have stuff in the buffer even if not locked
reg             deskew_locked_q;        //-- deskew locked with other lanes (normal operation)
reg             valid_q        ;

wire            valid_din;
//--wire [63:0]     deskewed_data_d0_din;
wire [63:0]     deskew_buffer0_din;
wire [63:0]     deskew_buffer1_din;
wire [63:0]     deskew_buffer2_din;
wire [63:0]     deskew_buffer3_din;
wire [2:0]      deskew_write_ptr_din;
wire [2:0]      deskew_read_ptr_din;
//--wire            data_flit_din;
wire            data_flit0_din;
wire            data_flit1_din;
wire            data_flit2_din;
wire            data_flit3_din;
wire            deskew_found_din;
wire            deskew_locked_din;

wire            is_deskew_din;              //-- is a deskew block
reg             is_deskew_q;
wire            found_pattern_a_din;
reg             found_pattern_a_q;
wire [7:0]      rx_tx_last_byte_ts3_din;
reg  [7:0]      rx_tx_last_byte_ts3_q;
wire            found_pattern_b_din;
reg             found_pattern_b_q;
//wire            is_deskew;              //-- is a deskew block
wire            deskew_found;           //-- deskew block found this cycle
wire            deskew_write;           //-- perform a write this cycle
wire            deskew_read;            //-- perform a read this cycle
wire [2:0]      deskew_diff;            //-- amount of data in deskew buffer, used to detect overflow and upcoming invalid cycles
//wire            deskew_done;            //-- have seen 8 matching deskew blocks
wire            deskew_lock;            //-- lock alignment; according to rx, we are lined up with the other lanes
wire            slip;
wire            found_header_din;
reg              found_header_q;

//---------------------------------------- end declarations ------------------------------------------------
//---------------------------------------- functions ------------------------------------------------
//-- reverse functions
function [63:0] reverse64 (input [63:0] forward);
  integer i;
  for (i=0; i<=63; i=i+1)
    reverse64[63-i] = forward[i];
endfunction
function [22:0] reverse23 (input [22:0] forward);
  integer i;
  for (i=0; i<=22; i=i+1)
    reverse23[22-i] = forward[i];
endfunction
function [15:0] reverse16 (input [15:0] forward);
  integer i;
  for (i=0; i<=15; i=i+1)
    reverse16[15-i] = forward[i];
endfunction
function [7:0] reverse8 (input [7:0] forward);
  integer i;
  for (i=0; i<=7; i=i+1)
    reverse8[7-i] = forward[i];
endfunction

//-- lfsr functions
function [0:22] advance64;      //-- advance the 23 bit lfsr by 64 bits
input [0:22] lfsr;
begin 
advance64[22] =    lfsr[2]  ^ lfsr[4]  ^ lfsr[6]  ^ lfsr[13] ^ lfsr[15] ^ lfsr[18] ^
                   lfsr[19] ^ lfsr[20] ^ lfsr[22];
advance64[21] =    lfsr[1]  ^ lfsr[3]  ^ lfsr[5]  ^ lfsr[12] ^ lfsr[14] ^ lfsr[17] ^
                   lfsr[18] ^ lfsr[19] ^ lfsr[21];
advance64[20] =    lfsr[0]  ^ lfsr[2]  ^ lfsr[4]  ^ lfsr[11] ^ lfsr[13] ^ lfsr[16] ^
                   lfsr[17] ^ lfsr[18] ^ lfsr[20];
advance64[19] =    lfsr[3]  ^ lfsr[6]  ^ lfsr[10] ^ lfsr[12] ^ lfsr[14] ^ lfsr[15] ^
                   lfsr[16] ^ lfsr[19] ^ lfsr[20] ^ lfsr[22];
advance64[18] =    lfsr[2]  ^ lfsr[5]  ^ lfsr[9]  ^ lfsr[11] ^ lfsr[13] ^ lfsr[14] ^
                   lfsr[15] ^ lfsr[18] ^ lfsr[19] ^ lfsr[21];
advance64[17] =    lfsr[1]  ^ lfsr[4]  ^ lfsr[8]  ^ lfsr[10] ^ lfsr[12] ^ lfsr[13] ^
                   lfsr[14] ^ lfsr[17] ^ lfsr[18] ^ lfsr[20];
advance64[16] =    lfsr[0]  ^ lfsr[3]  ^ lfsr[7]  ^ lfsr[9]  ^ lfsr[11] ^ lfsr[12] ^
                   lfsr[13] ^ lfsr[16] ^ lfsr[17] ^ lfsr[19];
advance64[15] =    lfsr[1]  ^ lfsr[2]  ^ lfsr[8]  ^ lfsr[10] ^ lfsr[11] ^ lfsr[12] ^
                   lfsr[14] ^ lfsr[15] ^ lfsr[16] ^ lfsr[17] ^ lfsr[18] ^ lfsr[20] ^ lfsr[22];
advance64[14] =    lfsr[0]  ^ lfsr[1]  ^ lfsr[7]  ^ lfsr[9]  ^ lfsr[10] ^ lfsr[11] ^
                   lfsr[13] ^ lfsr[14] ^ lfsr[15] ^ lfsr[16] ^ lfsr[17] ^ lfsr[19] ^ lfsr[21];
advance64[13] =    lfsr[0]  ^ lfsr[1]  ^ lfsr[8]  ^ lfsr[9]  ^ lfsr[10] ^ lfsr[12] ^
                   lfsr[13] ^ lfsr[15] ^ lfsr[16] ^ lfsr[17] ^ lfsr[18] ^ lfsr[22];
advance64[12] =    lfsr[0]  ^ lfsr[1]  ^ lfsr[6]  ^ lfsr[7]  ^ lfsr[8]  ^ lfsr[9]  ^
                   lfsr[11] ^ lfsr[12] ^ lfsr[15] ^ lfsr[16] ^ lfsr[20] ^ lfsr[21] ^ lfsr[22];
advance64[11] =    lfsr[0]  ^ lfsr[1]  ^ lfsr[5]  ^ lfsr[7]  ^ lfsr[8]  ^ lfsr[10] ^
                   lfsr[11] ^ lfsr[15] ^ lfsr[17] ^ lfsr[19] ^ lfsr[21] ^ lfsr[22];
advance64[10] =    lfsr[0]  ^ lfsr[1]  ^ lfsr[4]  ^ lfsr[7]  ^ lfsr[9]  ^ lfsr[10] ^
                   lfsr[16] ^ lfsr[17] ^ lfsr[18] ^ lfsr[21] ^ lfsr[22];
advance64[9]  =    lfsr[0]  ^ lfsr[1]  ^ lfsr[3]  ^ lfsr[8]  ^ lfsr[9]  ^ lfsr[14] ^
                   lfsr[15] ^ lfsr[16] ^ lfsr[21] ^ lfsr[22];
advance64[8]  =    lfsr[0]  ^ lfsr[1]  ^ lfsr[2]  ^ lfsr[6]  ^ lfsr[7]  ^ lfsr[8]  ^
                   lfsr[13] ^ lfsr[15] ^ lfsr[17] ^ lfsr[21] ^ lfsr[22];
advance64[7]  =    lfsr[0]  ^ lfsr[5]  ^ lfsr[7]  ^ lfsr[12] ^ lfsr[16] ^ lfsr[17] ^
                   lfsr[21] ^ lfsr[22];
advance64[6]  =    lfsr[1]  ^ lfsr[4]  ^ lfsr[11] ^ lfsr[14] ^ lfsr[15] ^ lfsr[16] ^
                   lfsr[17] ^ lfsr[21] ^ lfsr[22];
advance64[5]  =    lfsr[0]  ^ lfsr[3]  ^ lfsr[10] ^ lfsr[13] ^ lfsr[14] ^ lfsr[15] ^
                   lfsr[16] ^ lfsr[20] ^ lfsr[21];
advance64[4]  =    lfsr[1]  ^ lfsr[2]  ^ lfsr[6]  ^ lfsr[9]  ^ lfsr[12] ^ lfsr[13] ^
                   lfsr[15] ^ lfsr[17] ^ lfsr[19] ^ lfsr[22];
advance64[3]  =    lfsr[0]  ^ lfsr[1]  ^ lfsr[5]  ^ lfsr[8]  ^ lfsr[11] ^ lfsr[12] ^
                   lfsr[14] ^ lfsr[16] ^ lfsr[18] ^ lfsr[21];
advance64[2]  =    lfsr[0]  ^ lfsr[1]  ^ lfsr[4]  ^ lfsr[6]  ^ lfsr[7]  ^ lfsr[10] ^
                   lfsr[11] ^ lfsr[13] ^ lfsr[14] ^ lfsr[15] ^ lfsr[22];
advance64[1]  =    lfsr[0]  ^ lfsr[1]  ^ lfsr[3]  ^ lfsr[5]  ^ lfsr[9]  ^ lfsr[10] ^
                   lfsr[12] ^ lfsr[13] ^ lfsr[17] ^ lfsr[20] ^ lfsr[21] ^ lfsr[22];
advance64[0]  =    lfsr[0]  ^ lfsr[1]  ^ lfsr[2]  ^ lfsr[4]  ^ lfsr[6]  ^ lfsr[8]  ^
                   lfsr[9]  ^ lfsr[11] ^ lfsr[12] ^ lfsr[14] ^ lfsr[16] ^ lfsr[17] ^
                   lfsr[19] ^ lfsr[21] ^ lfsr[22];


end 
endfunction

function [0:63] next64;         //-- get the next 64 bits from the 23 bit lfsr (doesn't advance the lfsr)
input [0:22] lfsr_q;
begin
  next64[0]    = lfsr_q[22];
  next64[1]    = lfsr_q[21];
  next64[2]    = lfsr_q[20];
  next64[3]    = lfsr_q[19];
  next64[4]    = lfsr_q[18];
  next64[5]    = lfsr_q[17];
  next64[6]    = lfsr_q[16];
  next64[7]    = lfsr_q[15];
  next64[8]    = lfsr_q[14];
  next64[9]    = lfsr_q[13];
  next64[10]   = lfsr_q[12];
  next64[11]   = lfsr_q[11];
  next64[12]   = lfsr_q[10];
  next64[13]   = lfsr_q[9];
  next64[14]   = lfsr_q[8];
  next64[15]   = lfsr_q[7];
  next64[16]   = lfsr_q[6];
  next64[17]   = lfsr_q[5];
  next64[18]   = lfsr_q[4];
  next64[19]   = lfsr_q[3];
  next64[20]   = lfsr_q[2];
  next64[21]   = lfsr_q[1];
  next64[22]   = lfsr_q[0];
  next64[23]   = lfsr_q[1]  ^ lfsr_q[6]  ^ lfsr_q[14] ^ lfsr_q[17] ^ lfsr_q[20] ^ lfsr_q[22];
  next64[24]   = lfsr_q[0]  ^ lfsr_q[5]  ^ lfsr_q[13] ^ lfsr_q[16] ^ lfsr_q[19] ^ lfsr_q[21];
  next64[25]   = lfsr_q[1]  ^ lfsr_q[4]  ^ lfsr_q[6]  ^ lfsr_q[12] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[22];
  next64[26]   = lfsr_q[0]  ^ lfsr_q[3]  ^ lfsr_q[5]  ^ lfsr_q[11] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[21];
  next64[27]   = lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[4]  ^ lfsr_q[6]  ^ lfsr_q[10] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[22];
  next64[28]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[3]  ^ lfsr_q[5]  ^ lfsr_q[9]  ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[21];
  next64[29]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[4]  ^ lfsr_q[6]  ^ lfsr_q[8]  ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[22];
  next64[30]   = lfsr_q[0]  ^ lfsr_q[3]  ^ lfsr_q[5]  ^ lfsr_q[6]  ^ lfsr_q[7]  ^ lfsr_q[9]  ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[31]   = lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[4]  ^ lfsr_q[5]  ^ lfsr_q[8]  ^ lfsr_q[9]  ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[32]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[3]  ^ lfsr_q[4]  ^ lfsr_q[7]  ^ lfsr_q[8]  ^ lfsr_q[9]  ^ lfsr_q[10] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[21];
  next64[33]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[3]  ^ lfsr_q[7]  ^ lfsr_q[8]  ^ lfsr_q[9]  ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[15] ^ lfsr_q[19] ^ lfsr_q[22];
  next64[34]   = lfsr_q[0]  ^ lfsr_q[2]  ^ lfsr_q[7]  ^ lfsr_q[8]  ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[35]   = lfsr_q[7]  ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[36]   = lfsr_q[6]  ^ lfsr_q[9]  ^ lfsr_q[10] ^ lfsr_q[13] ^ lfsr_q[15] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[21];
  next64[37]   = lfsr_q[5]  ^ lfsr_q[8]  ^ lfsr_q[9]  ^ lfsr_q[12] ^ lfsr_q[14] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[20];
  next64[38]   = lfsr_q[4]  ^ lfsr_q[7]  ^ lfsr_q[8]  ^ lfsr_q[11] ^ lfsr_q[13] ^ lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[19];
  next64[39]   = lfsr_q[3]  ^ lfsr_q[6]  ^ lfsr_q[7]  ^ lfsr_q[10] ^ lfsr_q[12] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[18];
  next64[40]   = lfsr_q[2]  ^ lfsr_q[5]  ^ lfsr_q[6]  ^ lfsr_q[9]  ^ lfsr_q[11] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[17];
  next64[41]   = lfsr_q[1]  ^ lfsr_q[4]  ^ lfsr_q[5]  ^ lfsr_q[8]  ^ lfsr_q[10] ^ lfsr_q[13] ^ lfsr_q[15] ^ lfsr_q[16];
  next64[42]   = lfsr_q[0]  ^ lfsr_q[3]  ^ lfsr_q[4]  ^ lfsr_q[7]  ^ lfsr_q[9]  ^ lfsr_q[12] ^ lfsr_q[14] ^ lfsr_q[15];
  next64[43]   = lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[3]  ^ lfsr_q[8]  ^ lfsr_q[11] ^ lfsr_q[13] ^ lfsr_q[17] ^ lfsr_q[20] ^ lfsr_q[22];
  next64[44]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[7]  ^ lfsr_q[10] ^ lfsr_q[12] ^ lfsr_q[16] ^ lfsr_q[19] ^ lfsr_q[21];
  next64[45]   = lfsr_q[0]  ^ lfsr_q[9]  ^ lfsr_q[11] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[22];
  next64[46]   = lfsr_q[1]  ^ lfsr_q[6]  ^ lfsr_q[8]  ^ lfsr_q[10] ^ lfsr_q[13] ^ lfsr_q[16] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[47]   = lfsr_q[0]  ^ lfsr_q[5]  ^ lfsr_q[7]  ^ lfsr_q[9]  ^ lfsr_q[12] ^ lfsr_q[15] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[21];
  next64[48]   = lfsr_q[1]  ^ lfsr_q[4]  ^ lfsr_q[8]  ^ lfsr_q[11] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[22];
  next64[49]   = lfsr_q[0]  ^ lfsr_q[3]  ^ lfsr_q[7]  ^ lfsr_q[10] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[21];
  next64[50]   = lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[9]  ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[22];
  next64[51]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[8]  ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[21];
  next64[52]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[6]  ^ lfsr_q[7]  ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[17] ^ lfsr_q[22];
  next64[53]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[5]  ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[54]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[4]  ^ lfsr_q[6]  ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[55]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[3]  ^ lfsr_q[5]  ^ lfsr_q[6]  ^ lfsr_q[9]  ^ lfsr_q[10] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[56]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[4]  ^ lfsr_q[5]  ^ lfsr_q[6]  ^ lfsr_q[8]  ^ lfsr_q[9]  ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[57]   = lfsr_q[0]  ^ lfsr_q[3]  ^ lfsr_q[4]  ^ lfsr_q[5]  ^ lfsr_q[6]  ^ lfsr_q[7]  ^ lfsr_q[8]  ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[58]   = lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[3]  ^ lfsr_q[4]  ^ lfsr_q[5]  ^ lfsr_q[7]  ^ lfsr_q[9]  ^ lfsr_q[10] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[59]   = lfsr_q[0]  ^ lfsr_q[1]  ^ lfsr_q[2]  ^ lfsr_q[3]  ^ lfsr_q[4]  ^ lfsr_q[6]  ^ lfsr_q[8]  ^ lfsr_q[9]  ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[20] ^ lfsr_q[21];
  next64[60]   = lfsr_q[0]  ^ lfsr_q[2]  ^ lfsr_q[3]  ^ lfsr_q[5]  ^ lfsr_q[6]  ^ lfsr_q[7]  ^ lfsr_q[8]  ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[22];
  next64[61]   = lfsr_q[2]  ^ lfsr_q[4]  ^ lfsr_q[5]  ^ lfsr_q[7]  ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22];
  next64[62]   = lfsr_q[1]  ^ lfsr_q[3]  ^ lfsr_q[4]  ^ lfsr_q[6]  ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[21];
  next64[63]   = lfsr_q[0]  ^ lfsr_q[2]  ^ lfsr_q[3]  ^ lfsr_q[5]  ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[20];
end
endfunction

//---------------------------------------- end functions ------------------------------------------------
//---------------------------------------- states ------------------------------------------------

assign valid_din = valid_in;
assign reset = rx_reset;

assign phy_training_d1_din = phy_training;
assign phy_training_done = (~phy_training & phy_training_d1_q);                 //-- falling edge of phy_training


assign count_pattern_a = phy_training & ~reset;    //-- find and count pattern A's so long as we are training

assign found_pattern_a_din = found_pattern_a;  //-- added to fix timing                                                                 
assign found_pattern_b_din = found_pattern_b & a_cntr_q[6];  //-- added to fix timing (ensuring we are seeing enough A's before finding a B.                                                                

assign count_pattern_b = ( (count_pattern_a_q & found_pattern_b_q) | count_pattern_b_q ) & phy_training & ~reset;      //-- find and count pattern B's from the time we find one til we are done training
assign find_ts =  training_enable;                                    //-- enter state when phy done training, maintain until training complete
//-- assign find_ts = ( phy_training_done | (find_ts_q & training_enable) ) & ~reset;                                        //-- enter state when phy done training, maintain until training complete
//-- Note: sync pattern only comes on one lane, so exit find b state when phy training goes low

assign count_pattern_a_din = count_pattern_a;
assign count_pattern_b_din = count_pattern_b;
assign find_ts_din = find_ts;

//-- Note: these are used by the lanes to determine when slipping is allowed
assign find_a = count_pattern_a & ~count_pattern_b;     //-- training starts up through found a pattern B
assign find_b = count_pattern_b & ~find_ts;             //-- found pattern B up through find ts
assign find_first_b = a_cntr_q[6] & ~count_pattern_b & ~find_ts;         //-- found enough A to look for an inverted pattern B.
//---------------------------------------- end states ------------------------------------------------
//---------------------------------------- rx training outputs ----------------------------------------------

assign a_cntr_din[6:0] = ( (count_pattern_a_din & ~count_pattern_a_q) | reset )                 ? 7'b0000000 :                     //-- enter find pattern A state -> clear counter
                         ( valid_q & count_pattern_a &  found_pattern_a_q & ~a_cntr_q[6] )     ? (a_cntr_q[6:0] + 7'b0000001) :   //-- found pattern A and counter not maxed (64) -> increment counter
                         ( valid_q & count_pattern_a & ~found_pattern_a_q & |(a_cntr_q[6:0]) ) ? (a_cntr_q[6:0] - 7'b0000001) :   //-- didn't find pattern A and cntr>0 -> decrement counter
                                                                                                   a_cntr_q[6:0];                  //-- default, including not valid, counter at limit -> maintain previous value

assign b_cntr_din[6:0] = reset                                                                                             ? 7'b0000001 :                    //-- reset to 0 (the first B pattern doesn't get counted, so we are adding in the reset count
                         (valid_in & count_pattern_b &  rcv_pattern_b & ~(b_cntr_q[3] & b_cntr_q[2]))                      ? (b_cntr_q[6:0] + 7'b0000001) :  //-- Allow B count to go to 12 before stopping so that if we miss a 'B' due to a bit flip, we can still find the synd
                         (valid_in & count_pattern_b & (pattern_b_cntr_q[3:0] == 4'b0000) & (b_cntr_q[6:0]) != 7'b0000000) ? (b_cntr_q[6:0] - 7'b0000001) :  //-- didn't find pattern B recently enough and cntr>0 -> decrement counter
                                                                                                                              b_cntr_q[6:0];                 //-- default, including not valid, counter at limit -> maintain previous value

assign rcv_pattern_b = count_pattern_b & ( found_pattern_b_q & (pattern_b_cntr_q[3:0] != 4'b0000) );                                    //-- looking for pattern B and found one this time or recently enough

assign pattern_b_cntr_din[3:0] = reset                                                    ? 4'b0000 :                           //-- reset to 0
                                 ( valid_q & count_pattern_b & found_pattern_b_q )        ? 4'b1000 :                           //-- find pattern B and found pattern B -> reset counter to 8
                                 ( valid_q & count_pattern_b )                            ? (pattern_b_cntr_q[3:0] - 4'b0001) : //-- find pattern B and not found pattern B and cntr>0 -> decrement counter by 1
                                                                                              pattern_b_cntr_q[3:0];            //-- default, including invalid, no pattern B while cntr=0, or not training -> carry over previous value
//-- eventually support 128/130 encoding, would need to set counter to 16 when found pattern B's

assign pattern_a_din = ( (count_pattern_a & a_cntr_q[4]) | found_pattern_b_q | (pattern_a_q & |(a_cntr_q[6:0])) ) & ~reset & phy_training;     //-- enter if finding pattern A and counter's reached 16 or found a pattern B, maintain til counter reaches 0 or reset or not training
assign pattern_b_din = ( (count_pattern_b & b_cntr_q[3]) | (pattern_b_q & |(b_cntr_q[6:0])) ) & ~reset & phy_training;                       //-- enter if finding pattern B and cntr's reached 64, maintain until counter reaches 0 or reset or not training
assign pattern_sync_din = ( (count_pattern_b_q & found_sync_pattern & b_cntr_q[3]) | pattern_sync_q ) & ~reset & phy_training;                             //-- set when see sync pattern after seeing pattern B's, maintain until reset or not training 

assign pattern_a        = pattern_a_q;
assign pattern_b        = pattern_b_q;
assign pattern_sync     = pattern_sync_q;


assign ts1_cntr_din[3:0] = ( reset | ~training_enable )                                              ? 4'b0000 :                      //-- reset -> zero
                           ( valid_in & find_ts &   ~ts_type_d1c_q[1] & ts_type_d1c_q[0]  & ~ts1_cntr_q[3] )     ? (ts1_cntr_q[3:0] + 4'b0001) :  //-- is TS1 and counter is not maxed (8) -> increment the counter
                           ( valid_in & find_ts & ~(~ts_type_d1c_q[1] & ts_type_d1c_q[0]) & |(ts1_cntr_q[3:0]) ) ? (ts1_cntr_q[3:0] - 4'b0001) :  //-- looking for ts and not a TS1 and cntr>0 -> decrement counter
                                                                                                        ts1_cntr_q[3:0];              //-- default, including invalid, counter at limit -> carry over previous value

assign ts2_cntr_din[3:0] = ( reset | ~training_enable )                                       ? 4'b0000 :                     //-- reset -> zero
                           ( valid_in & find_ts & ts_type_d1c_q[1] & ~ts_type_d1c_q[0] & ~ts2_cntr_q[3] ) ? (ts2_cntr_q[3:0] + 4'b0001) : //-- is TS2 and counter is not maxed (8) -> increment the counter
                                                                                                 ts2_cntr_q[3:0];             //-- default, including invalid, counter at limit -> carry over previous value

assign ts3_cntr_din[3:0] = ( reset | ~training_enable )                                       ? 4'b0000 :                     //-- reset -> zero
                           ( valid_in & find_ts & ((ts_type_d1c_q[1] &  ts_type_d1c_q[0]) | (found_data_flit & ts2_cntr_q[3])) & ~ts3_cntr_q[3] ) ? (ts3_cntr_q[3:0] + 4'b0001) : //-- is TS3 and counter is not maxed (8) -> increment the counter
                                                                                                 ts3_cntr_q[3:0];             //-- default, including invalid, counter at limit -> carry over previous value

assign pattern_TS1_din          = |(ts1_cntr_q[3:0]) & training_enable;       //-- find ts and ts1 counter is > 0
assign pattern_TS2_din          = ts2_cntr_din[3] & training_enable;          //-- enter on find ts and ts2 counter reached 8, maintain until reset or training complete
assign pattern_TS3_din          = ts3_cntr_din[3] & training_enable;          //-- enter on find ts and ts3 counter reached 8, maintain until reset or training complete
assign block_locked_din         = (block_locked | block_locked_q) & ~reset;             //-- set when block lock complete and maintain unless reset

//-- Note: tx cannot send TS2's until block_lock and deskew_done, which ensures that all 3 state machines are locked and the link is ready to go (deskew blocks can't be read properly until lfsr is locked)
assign pattern_TS1      = pattern_TS1_q;
assign pattern_TS2      = pattern_TS2_q;
assign pattern_TS3      = pattern_TS3_q;
assign block_lock       = block_locked_q;
//---------------------------------------- end rx training outputs ----------------------------------------------
//---------------------------------------- TS and deskew blocks ----------------------------------------------

assign ts_type[1:0] = (descrambled_data[0:63] == 64'h4B4A4A4A4A4A4A4A) ? 2'b01 :        //-- TS1
                      (descrambled_data[0:47] == 48'h4B4545454545)     ? 2'b10 :        //-- TS2
                      (descrambled_data[0:47] == 48'h4B4141414141)     ? 2'b11 :        //-- TS3
                      2'b00;                                                            //-- not a TS

//-- look at last byte of ts3 packet to see if other end trained.
assign rx_tx_last_byte_ts3_din[7:0] = ts_type[1] ? descrambled_data[56:63] : 8'h00;
assign rx_tx_last_byte_ts3[7:0]     = rx_tx_last_byte_ts3_q[7:0];

assign is_any_TS = valid_in & (ts_type[1] | ts_type[0]);                                                //-- is some type of (valid) TS
assign is_same_TS = (ts_type[1:0] == ts_type_d1_q[1:0]);                                                //-- this cycles' TS is the same type as last round
assign ts_type_d1_din[1:0] = ({2{valid_in}} & ts_type[1:0]) | ({2{~valid_in}} & ts_type_d1_q[1:0]);     //-- if valid, update with this cycle's value; if not valid, carry over past value
assign ts_type_d1c_din[1:0] = ts_type[1:0];  //-- straight delay

assign is_deskew_din = data_aligned & (descrambled_data[0:39] == 40'h4B1E1E1E1E);           //-- is a deskew block

assign bad_ts = valid_in & ~is_any_TS & ~is_deskew_q;                                     //-- deskew don't count as bad ts; if not valid, carry over past value
assign bad_ts_d1_din = (~valid_in & bad_ts_d1_q) | (valid_in & bad_ts);                 //-- need 2 bad TS to unlock
assign bad_ts_d2_din = (~valid_in & bad_ts_d2_q) | (valid_in & bad_ts_d1_q);                 //-- need 2 bad TS to unlock
//---------------------------------------- end TS and deskew blocks ----------------------------------------------
//---------------------------------------- block lock state machine ----------------------------------------------

assign header_cntr_din[6:0] = ( reset )                        ? 7'b0000000 :                            //-- reset to 0
                              ( ~valid_in )                    ? ( header_cntr_q[6:0] ) :                //-- not valid -> carry over past value
                              ( find_header_q & found_header ) ? (header_cntr_q[6:0] + 7'b0000001) :     //-- found what we were looking for -> increment counter
                                                                 7'b0000000;                             //-- default, including didn't find expected header, not training -> reset or don't use counter

assign find_header     = ~reset & ( (phy_training_done | find_header_q) & ~block_locked );   //-- enter when phy_training goes low, maintain till block lock achieved
assign find_header_din = find_header;

//-- ctl_header is used for retrain only.  Hide the two cycles when header is not valid.
assign found_header_din = ~valid_in ? found_header_q:
                                      found_header;

assign ctl_header      = found_header_q;

//-- 4/6 assign ctl_header      = found_header;
assign found_header    = header_in[1] & ~header_in[0];             //-- "10" is the control header we are looking for (slip if looking for header and don't find it done by pattern A logic)
assign slip            = valid_in & find_header & ~found_header;       //-- slip to align the header
assign slip_out        = slip;         //-- slip to align the header
assign block_locked    = find_header_q & header_cntr_q[6];         //-- find header state, counter has made it to 64 -> signal block lock complete
//---------------------------------------- end block lock state machine ----------------------------------------------
//---------------------------------------- deskew state machine and buffer ----------------------------------------------

assign deskew_found_din = deskew_found;
assign deskew_found = deskew_enable & (is_deskew_q | deskew_found_q) & ~deskew_reset;     //-- keep track of the fact that we have seen a deskew block, clear on deskew reset
assign deskew_valid = ( ~deskew_locked_q & deskew_found ) |                             //-- not locked: let rx know we have stuff (starting with a deskew block) in the deskew buffer, clear on reset
                      (  deskew_locked_q & ~( ((deskew_diff[2:0] == 3'b001) & ~valid_in) |   //-- locked: not valid if read pointer is only 1 behind write pointer and we are not writing valid data this cycle, or
                                              &(~deskew_diff[2:0]) ) );                 //--  if read pointer has caught up to write pointer (diff=0)
//-- Note: if deskew_valid = 0 is output to rx, rx will tell all lanes not to read next cycle, giving this lane a chance to buffer some valid data

assign deskew_locked_din = (deskew_locked_q | deskew_lock) & ~reset & ~deskew_reset;    //-- lock and maintain locked state unless re-train
assign deskew_lock = deskew_enable & deskew_found;                      //-- looking for deskew and got the all valid from the rx
//--assign deskew_lock = deskew_enable & deskew_all_valid;                  //-- looking for deskew and got the all valid from the rx

assign deskew_write = valid_in & (deskew_locked_q | deskew_found);      //-- valid data and either alignment locked or have seen a deskew block -> store into deskew buffer
assign deskew_read = deskew_all_valid;                                  //-- all lanes have valid data -> read data from deskew buffer to rx
assign deskew_write_ptr_din[2:0] = ( deskew_reset | reset ) ? 3'b000 :                    //-- reset -> clear
                                   ( deskew_write )         ? (deskew_write_ptr_q[2:0] + 3'b001) :   //-- do a write -> increment
                                                              deskew_write_ptr_q[2:0];                             //-- default, including not valid_in -> maintain previous value
assign deskew_read_ptr_din[2:0] = ( deskew_reset | reset ) ? 3'b000 :                     //-- reset -> clear
                                  ( deskew_read )          ? (deskew_read_ptr_q[2:0] + 3'b001) :      //-- do a read -> increment
                                                              deskew_read_ptr_q[2:0];                               //-- default, including not all valid -> maintain previous value

assign deskew_diff = deskew_write_ptr_q[2:0] - deskew_read_ptr_q[2:0];
assign deskew_overflow = ( deskew_diff[2] & (~deskew_read | deskew_diff[1] | deskew_diff[0]) );         //-- overflow if write pointer passes read pointer; difference is >4 or =4 and not reading this cycle
//-- Note: it cannot happen that read pointer passes write pointer since deskew_write must be true at least one cycle before deskew_read becomes true, since it is latched in the rxdf

//--assign pre_deskew_data[63:0] = (~header_in[1] & header_in[0]) ? {descrambled_data[48:63], descrambled_data[32:47], descrambled_data[16:31], descrambled_data[0:15]} :   //-- if data header ("01"), reverse order
assign pre_deskew_data[63:0] = (~header_in[1] & header_in[0]) ? {descrambled_data[56:63], descrambled_data[48:55], descrambled_data[40:47], descrambled_data[32:39],
                                                                 descrambled_data[24:31], descrambled_data[16:23], descrambled_data[ 8:15], descrambled_data[ 0: 7]} :   //-- if data header ("01"), reverse order
                               descrambled_data[0:63];

//-- 11/9/16 use buffer 0 to delay the neighbors data one cycle
assign deskew_buffer0_din[63:0] =  x4_hold_data & deskew_all_valid                    ? nghbr_data_in[63:0]:
                                   x4_hold_data                                       ? deskew_buffer0_q[63:0]:
                                  (deskew_write & (deskew_write_ptr_q[1:0] == 2'b00)) ? pre_deskew_data[63:0] :
                                                                                        deskew_buffer0_q[63:0];     //-- write to block, or maintain current value

assign deskew_buffer1_din[63:0] =  x4_hold_data & deskew_all_valid                    ? nghbr_data_in[63:0]:
                                   x4_hold_data                                       ? deskew_buffer1_q[63:0]:
                                  (deskew_write & (deskew_write_ptr_q[1:0] == 2'b01)) ? pre_deskew_data[63:0] :
                                                                                        deskew_buffer1_q[63:0];     //-- write to block, or maintain current value

assign deskew_buffer2_din[63:0] =  x4_hold_data & deskew_all_valid                    ? nghbr_data_in[63:0]:
                                   x4_hold_data                                       ? deskew_buffer2_q[63:0]:
                                  (deskew_write & (deskew_write_ptr_q[1:0] == 2'b10)) ? pre_deskew_data[63:0] :
                                                                                        deskew_buffer2_q[63:0];     //-- write to block, or maintain current value

assign deskew_buffer3_din[63:0] =  x4_hold_data & deskew_all_valid                    ? nghbr_data_in[63:0]:
                                   x4_hold_data                                       ? deskew_buffer3_q[63:0]:
                                  (deskew_write & (deskew_write_ptr_q[1:0] == 2'b11)) ? pre_deskew_data[63:0] :
                                                                                        deskew_buffer3_q[63:0];     //-- write to block, or maintain current value

//-- use buffer 0 to delay the neighbors data one cycle
assign nghbr_data_out[63:0] = deskewed_data[63:0];


assign deskewed_data[63:0] = 
                             ( {64{deskew_read_ptr_q[1:0] == 2'b00}} & (deskew_buffer0_q[63:0]) ) |     //-- read block, which is passed out to rx
                             ( {64{deskew_read_ptr_q[1:0] == 2'b01}} & (deskew_buffer1_q[63:0]) ) |
                             ( {64{deskew_read_ptr_q[1:0] == 2'b10}} & (deskew_buffer2_q[63:0]) ) |
                             ( {64{deskew_read_ptr_q[1:0] == 2'b11}} & (deskew_buffer3_q[63:0]) );

//-- add a cycle of delay to all crc to be calculated in 1 cycle
//--assign deskewed_data_d0_din[63:0] = deskewed_data[63:0];
//--assign rx_data_out[63:0] =  deskewed_data_d0_q[63:0];         //-- data from phy has been (possibly inverted,) byte-reversed, descrambled, and deskewed, just latched in replay buffer now output to rx

assign rx_data_out[63:0] =  deskewed_data[63:0];         //-- data from phy has been (possibly inverted,) byte-reversed, descrambled, and deskewed, just latched in replay buffer now output to rx

//-- Note: data_flit must be buffered with the data it corresponds to so it lines up when passed to the rx, who cannot see the header
assign found_data_flit = ~header_in[1] & header_in[0];  //-- data header is "01"

assign data_flit0_din = reset                                                 ? 1'b0:
                        ( deskew_write & (deskew_write_ptr_q[1:0] == 2'b00) ) ? found_data_flit:
                                                                                data_flit0_q;
assign data_flit1_din = reset                                                 ? 1'b0:
                        ( deskew_write & (deskew_write_ptr_q[1:0] == 2'b01) ) ? found_data_flit :
                                                                                data_flit1_q;
assign data_flit2_din = reset                                                 ? 1'b0:
                        ( deskew_write & (deskew_write_ptr_q[1:0] == 2'b10) ) ? found_data_flit :
                                                                                data_flit2_q;
assign data_flit3_din = reset                                                 ? 1'b0:
                        ( deskew_write & (deskew_write_ptr_q[1:0] == 2'b11) ) ? found_data_flit :
                                                                                data_flit3_q;

//-- output flag that this is a 'data_flit'
assign data_flit = 
                  ((deskew_read_ptr_q[1:0] == 2'b00) &  deskew_read & data_flit0_q) |  //-- read data_flit out to rx
                  ((deskew_read_ptr_q[1:0] == 2'b01) & ~deskew_read & data_flit0_q) |  //-- read data_flit out to rx

                  ((deskew_read_ptr_q[1:0] == 2'b01) &  deskew_read & data_flit1_q) |
                  ((deskew_read_ptr_q[1:0] == 2'b10) & ~deskew_read & data_flit1_q) |

                  ((deskew_read_ptr_q[1:0] == 2'b10) &  deskew_read & data_flit2_q) |
                  ((deskew_read_ptr_q[1:0] == 2'b11) & ~deskew_read & data_flit2_q) |

                  ((deskew_read_ptr_q[1:0] == 2'b11) &  deskew_read & data_flit3_q) |
                  ((deskew_read_ptr_q[1:0] == 2'b00) & ~deskew_read & data_flit3_q);


//---------------------------------------- end deskew state machine and buffer ----------------------------------------------
//---------------------------------------- descramble lfsr state machine ----------------------------------------------

//-- Note: data_aligned means data is valid from phy and has valid "10" header; we can use it for descramble lock even if we're not block locked just yet
assign data_aligned = valid_in & (block_locked_q | (find_ts & found_header));

assign lfsr_din[0:22] = ~valid_in     ? lfsr_q[0:22]:                //-- this cycle invalid -> carry over past value
                        load_pattern1 ? final_lfsr1[0:22]:           //-- load initial LFSR pattern 1
                        load_pattern2 ? final_lfsr2[0:22]:           //-- load initial LFSR pattern 2
                        lfsr_advance  ? advance64(lfsr_q[0:22]):     //-- advance LFSR 64 bits
                        ~lfsr_unlock  ? lfsr_q[0:22]:                //-- otherwise hold, but clear if unlock
                                        23'b0;  

assign lfsr_cntr_din[0:2] = ( ~valid_in )                                                               ? lfsr_cntr_q[0:2] :              //-- cycle not valid -> don't count it
                            ( data_aligned & lfsr_running_q & ~lfsr_locked_q & is_any_TS & is_same_TS ) ? (lfsr_cntr_q[0:2] + 3'b001) :   //-- finding 8 same TS in a row -> increment
                                                                                                           3'b000;                       //-- default, including not aligned, found different TS, are locked -> zero / disable

assign descramble[0:63] = next64(lfsr_q[0:22]);                         //-- get the PseudoRandom Bit Sequence for this block

assign descrambled_data_raw[0:63] = data_in[63:0] ^ descramble[0:63];   //-- XOR the PRBS with the scrambled data to recover the original data

assign descrambled_data[0:63] = { reverse8(descrambled_data_raw[ 0: 7]), reverse8(descrambled_data_raw[ 8:15]), reverse8(descrambled_data_raw[16:23]), reverse8(descrambled_data_raw[24:31]),  //-- reverse each byte
                                  reverse8(descrambled_data_raw[32:39]), reverse8(descrambled_data_raw[40:47]), reverse8(descrambled_data_raw[48:55]), reverse8(descrambled_data_raw[56:63]) };

assign init_data_in[0:47] = { reverse8(data_in[63:56]), reverse8(data_in[55:48]), reverse8(data_in[47:40]), reverse8(data_in[39:32]),  //-- reverse each byte
                                  reverse8(data_in[31:24]), reverse8(data_in[23:16])};

//-- Note: descrambled_data is next put into the deskew buffer

//-- manage the lfsr state
assign lfsr_running_din = (valid_in & (load_pattern1 | load_pattern2 | lfsr_running_q) & ~lfsr_unlock) | (~valid_in & lfsr_running_q);      //-- set when loading pattern, hold unless unlock
assign lfsr_advance = data_aligned & lfsr_running_q;                                            //-- set when valid data and running
assign lfsr_locked_din  = (lfsr_lock | lfsr_locked_q) & ~lfsr_unlock;                           //-- lock when get the 8 good TS in a row

assign lfsr_lock = lfsr_running_q & (&(lfsr_cntr_din[0:2]));      //-- lock the LFSR if get 8 good TS in a row (counter makes it up to 7 = 111)

assign lfsr_unlock = ( lfsr_running_q & ~lfsr_locked_q & bad_ts_d2_q & bad_ts_d1_q )                 //-- second bad TS unlocks (trigger re-init)
                     | slip | reset;                                                        //-- also unlock if slip to align header or reset

assign lfsr_init_check = ~lfsr_running_q & data_aligned;        //-- re-init when have valid data and not already running (just unlocked)
assign load_pattern1 = match_pattern1 & lfsr_init_check;        //-- load init value if we matched pattern 1 and are ready to re-init
assign load_pattern2 = match_pattern2 & lfsr_init_check;        //-- load init value if we matched pattern 2 and are ready to re-init

//-- first 6 bytes of block received for initializing descrambling XORed with the TS pattern gives the raw PRBS sequence used for scrambling
assign raw_sequence1x[0:47] = init_data_in[0:47] ^ 48'h4B4A4A4A4A4A;
assign raw_sequence2x[0:47] = init_data_in[0:47] ^ 48'h4B4545454545;

assign raw_sequence1[0:47] = { reverse8(raw_sequence1x[ 0: 7]), reverse8(raw_sequence1x[ 8:15]), reverse8(raw_sequence1x[16:23]),       //-- put back in transmit order (reverse bytes again)
                               reverse8(raw_sequence1x[24:31]), reverse8(raw_sequence1x[32:39]), reverse8(raw_sequence1x[40:47]) };
assign raw_sequence2[0:47] = { reverse8(raw_sequence2x[ 0: 7]), reverse8(raw_sequence2x[ 8:15]), reverse8(raw_sequence2x[16:23]),
                               reverse8(raw_sequence2x[24:31]), reverse8(raw_sequence2x[32:39]), reverse8(raw_sequence2x[40:47]) };

//-- initial LFSR value for this block would be the first 23 bits, but reversed (last bit of LFSR sent first)
assign initial_lfsr1[0:22] = reverse23(raw_sequence1[0:22]);
//-- advance this LFSR 64 bits to get the final value (for the next block)
assign final_lfsr1[0:22] = advance64(initial_lfsr1[0:22]);
//-- the scramble sequence from this LFSR value (first 23 bits are the initial value of the LFSR and don't matter)
assign prbs_pattern1[23]   = initial_lfsr1[1]  ^ initial_lfsr1[6]  ^ initial_lfsr1[14] ^ initial_lfsr1[17] ^ initial_lfsr1[20] ^ initial_lfsr1[22];
assign prbs_pattern1[24]   = initial_lfsr1[0]  ^ initial_lfsr1[5]  ^ initial_lfsr1[13] ^ initial_lfsr1[16] ^ initial_lfsr1[19] ^ initial_lfsr1[21];
assign prbs_pattern1[25]   = initial_lfsr1[1]  ^ initial_lfsr1[4]  ^ initial_lfsr1[6]  ^ initial_lfsr1[12] ^ initial_lfsr1[14] ^ initial_lfsr1[15] ^ initial_lfsr1[17] ^ initial_lfsr1[18] ^ initial_lfsr1[22];
assign prbs_pattern1[26]   = initial_lfsr1[0]  ^ initial_lfsr1[3]  ^ initial_lfsr1[5]  ^ initial_lfsr1[11] ^ initial_lfsr1[13] ^ initial_lfsr1[14] ^ initial_lfsr1[16] ^ initial_lfsr1[17] ^ initial_lfsr1[21];
assign prbs_pattern1[27]   = initial_lfsr1[1]  ^ initial_lfsr1[2]  ^ initial_lfsr1[4]  ^ initial_lfsr1[6]  ^ initial_lfsr1[10] ^ initial_lfsr1[12] ^ initial_lfsr1[13] ^ initial_lfsr1[14] ^ initial_lfsr1[15] ^ initial_lfsr1[16] ^ initial_lfsr1[17] ^ initial_lfsr1[22];
assign prbs_pattern1[28]   = initial_lfsr1[0]  ^ initial_lfsr1[1]  ^ initial_lfsr1[3]  ^ initial_lfsr1[5]  ^ initial_lfsr1[9]  ^ initial_lfsr1[11] ^ initial_lfsr1[12] ^ initial_lfsr1[13] ^ initial_lfsr1[14] ^ initial_lfsr1[15] ^ initial_lfsr1[16] ^ initial_lfsr1[21];
assign prbs_pattern1[29]   = initial_lfsr1[0]  ^ initial_lfsr1[1]  ^ initial_lfsr1[2]  ^ initial_lfsr1[4]  ^ initial_lfsr1[6]  ^ initial_lfsr1[8]  ^ initial_lfsr1[10] ^ initial_lfsr1[11] ^ initial_lfsr1[12] ^ initial_lfsr1[13] ^ initial_lfsr1[15] ^ initial_lfsr1[17] ^ initial_lfsr1[22];
assign prbs_pattern1[30]   = initial_lfsr1[0]  ^ initial_lfsr1[3]  ^ initial_lfsr1[5]  ^ initial_lfsr1[6]  ^ initial_lfsr1[7]  ^ initial_lfsr1[9]  ^ initial_lfsr1[10] ^ initial_lfsr1[11] ^ initial_lfsr1[12] ^ initial_lfsr1[16] ^ initial_lfsr1[17] ^ initial_lfsr1[20] ^ initial_lfsr1[21] ^ initial_lfsr1[22];
assign prbs_pattern1[31]   = initial_lfsr1[1]  ^ initial_lfsr1[2]  ^ initial_lfsr1[4]  ^ initial_lfsr1[5]  ^ initial_lfsr1[8]  ^ initial_lfsr1[9]  ^ initial_lfsr1[10] ^ initial_lfsr1[11] ^ initial_lfsr1[14] ^ initial_lfsr1[15] ^ initial_lfsr1[16] ^ initial_lfsr1[17] ^ initial_lfsr1[19] ^ initial_lfsr1[21] ^ initial_lfsr1[22];
assign prbs_pattern1[32]   = initial_lfsr1[0]  ^ initial_lfsr1[1]  ^ initial_lfsr1[3]  ^ initial_lfsr1[4]  ^ initial_lfsr1[7]  ^ initial_lfsr1[8]  ^ initial_lfsr1[9]  ^ initial_lfsr1[10] ^ initial_lfsr1[13] ^ initial_lfsr1[14] ^ initial_lfsr1[15] ^ initial_lfsr1[16] ^ initial_lfsr1[18] ^ initial_lfsr1[20] ^ initial_lfsr1[21];
assign prbs_pattern1[33]   = initial_lfsr1[0]  ^ initial_lfsr1[1]  ^ initial_lfsr1[2]  ^ initial_lfsr1[3]  ^ initial_lfsr1[7]  ^ initial_lfsr1[8]  ^ initial_lfsr1[9]  ^ initial_lfsr1[12] ^ initial_lfsr1[13] ^ initial_lfsr1[15] ^ initial_lfsr1[19] ^ initial_lfsr1[22];
assign prbs_pattern1[34]   = initial_lfsr1[0]  ^ initial_lfsr1[2]  ^ initial_lfsr1[7]  ^ initial_lfsr1[8]  ^ initial_lfsr1[11] ^ initial_lfsr1[12] ^ initial_lfsr1[17] ^ initial_lfsr1[18] ^ initial_lfsr1[20] ^ initial_lfsr1[21] ^ initial_lfsr1[22];
assign prbs_pattern1[35]   = initial_lfsr1[7]  ^ initial_lfsr1[10] ^ initial_lfsr1[11] ^ initial_lfsr1[14] ^ initial_lfsr1[16] ^ initial_lfsr1[19] ^ initial_lfsr1[21] ^ initial_lfsr1[22];
assign prbs_pattern1[36]   = initial_lfsr1[6]  ^ initial_lfsr1[9]  ^ initial_lfsr1[10] ^ initial_lfsr1[13] ^ initial_lfsr1[15] ^ initial_lfsr1[18] ^ initial_lfsr1[20] ^ initial_lfsr1[21];
assign prbs_pattern1[37]   = initial_lfsr1[5]  ^ initial_lfsr1[8]  ^ initial_lfsr1[9]  ^ initial_lfsr1[12] ^ initial_lfsr1[14] ^ initial_lfsr1[17] ^ initial_lfsr1[19] ^ initial_lfsr1[20];
assign prbs_pattern1[38]   = initial_lfsr1[4]  ^ initial_lfsr1[7]  ^ initial_lfsr1[8]  ^ initial_lfsr1[11] ^ initial_lfsr1[13] ^ initial_lfsr1[16] ^ initial_lfsr1[18] ^ initial_lfsr1[19];
assign prbs_pattern1[39]   = initial_lfsr1[3]  ^ initial_lfsr1[6]  ^ initial_lfsr1[7]  ^ initial_lfsr1[10] ^ initial_lfsr1[12] ^ initial_lfsr1[15] ^ initial_lfsr1[17] ^ initial_lfsr1[18];
assign prbs_pattern1[40]   = initial_lfsr1[2]  ^ initial_lfsr1[5]  ^ initial_lfsr1[6]  ^ initial_lfsr1[9]  ^ initial_lfsr1[11] ^ initial_lfsr1[14] ^ initial_lfsr1[16] ^ initial_lfsr1[17];
assign prbs_pattern1[41]   = initial_lfsr1[1]  ^ initial_lfsr1[4]  ^ initial_lfsr1[5]  ^ initial_lfsr1[8]  ^ initial_lfsr1[10] ^ initial_lfsr1[13] ^ initial_lfsr1[15] ^ initial_lfsr1[16];
assign prbs_pattern1[42]   = initial_lfsr1[0]  ^ initial_lfsr1[3]  ^ initial_lfsr1[4]  ^ initial_lfsr1[7]  ^ initial_lfsr1[9]  ^ initial_lfsr1[12] ^ initial_lfsr1[14] ^ initial_lfsr1[15];
assign prbs_pattern1[43]   = initial_lfsr1[1]  ^ initial_lfsr1[2]  ^ initial_lfsr1[3]  ^ initial_lfsr1[8]  ^ initial_lfsr1[11] ^ initial_lfsr1[13] ^ initial_lfsr1[17] ^ initial_lfsr1[20] ^ initial_lfsr1[22];
assign prbs_pattern1[44]   = initial_lfsr1[0]  ^ initial_lfsr1[1]  ^ initial_lfsr1[2]  ^ initial_lfsr1[7]  ^ initial_lfsr1[10] ^ initial_lfsr1[12] ^ initial_lfsr1[16] ^ initial_lfsr1[19] ^ initial_lfsr1[21];
assign prbs_pattern1[45]   = initial_lfsr1[0]  ^ initial_lfsr1[9]  ^ initial_lfsr1[11] ^ initial_lfsr1[14] ^ initial_lfsr1[15] ^ initial_lfsr1[17] ^ initial_lfsr1[18] ^ initial_lfsr1[22];
assign prbs_pattern1[46]   = initial_lfsr1[1]  ^ initial_lfsr1[6]  ^ initial_lfsr1[8]  ^ initial_lfsr1[10] ^ initial_lfsr1[13] ^ initial_lfsr1[16] ^ initial_lfsr1[20] ^ initial_lfsr1[21] ^ initial_lfsr1[22];
assign prbs_pattern1[47]   = initial_lfsr1[0]  ^ initial_lfsr1[5]  ^ initial_lfsr1[7]  ^ initial_lfsr1[9]  ^ initial_lfsr1[12] ^ initial_lfsr1[15] ^ initial_lfsr1[19] ^ initial_lfsr1[20] ^ initial_lfsr1[21];

//-- good initialization if matches
//-- 9/22 assign match_pat1[0] = (prbs_pattern1[23:27] == raw_sequence1[23:27]);
//-- 9/22 assign match_pat1[1] = (prbs_pattern1[28:32] == raw_sequence1[28:32]);
//-- 9/22 assign match_pat1[2] = (prbs_pattern1[33:37] == raw_sequence1[33:37]);
//-- 9/22 assign match_pat1[3] = (prbs_pattern1[38:42] == raw_sequence1[38:42]);
//-- 9/22 assign match_pat1[4] = (prbs_pattern1[43:47] == raw_sequence1[43:47]);
assign match_pat1[0] = 1'b1;
assign match_pat1[1] = 1'b1;
assign match_pat1[2] = 1'b1;
assign match_pat1[3] = 1'b1;
assign match_pat1[4] = (prbs_pattern1[35:42] == raw_sequence1[35:42]);

assign match_pattern1 = match_pat1[0] & match_pat1[1] & match_pat1[2] & match_pat1[3] & match_pat1[4];


//-- initial LFSR value for this block would be the first 23 bits, but reversed (last bit of LFSR sent first)
assign initial_lfsr2[0:22] = reverse23(raw_sequence2[0:22]);
//-- advance this LFSR 64 bits to get the final value (for the next block)
assign final_lfsr2[0:22] = advance64(initial_lfsr2[0:22]);
//-- the scramble sequence from this LFSR value (first 23 bits are the initial value of the LFSR and don't matter)

assign prbs_pattern2[23]   = initial_lfsr2[1]  ^ initial_lfsr2[6]  ^ initial_lfsr2[14] ^ initial_lfsr2[17] ^ initial_lfsr2[20] ^ initial_lfsr2[22];
assign prbs_pattern2[24]   = initial_lfsr2[0]  ^ initial_lfsr2[5]  ^ initial_lfsr2[13] ^ initial_lfsr2[16] ^ initial_lfsr2[19] ^ initial_lfsr2[21];
assign prbs_pattern2[25]   = initial_lfsr2[1]  ^ initial_lfsr2[4]  ^ initial_lfsr2[6]  ^ initial_lfsr2[12] ^ initial_lfsr2[14] ^ initial_lfsr2[15] ^ initial_lfsr2[17] ^ initial_lfsr2[18] ^ initial_lfsr2[22];
assign prbs_pattern2[26]   = initial_lfsr2[0]  ^ initial_lfsr2[3]  ^ initial_lfsr2[5]  ^ initial_lfsr2[11] ^ initial_lfsr2[13] ^ initial_lfsr2[14] ^ initial_lfsr2[16] ^ initial_lfsr2[17] ^ initial_lfsr2[21];
assign prbs_pattern2[27]   = initial_lfsr2[1]  ^ initial_lfsr2[2]  ^ initial_lfsr2[4]  ^ initial_lfsr2[6]  ^ initial_lfsr2[10] ^ initial_lfsr2[12] ^ initial_lfsr2[13] ^ initial_lfsr2[14] ^ initial_lfsr2[15] ^ initial_lfsr2[16] ^ initial_lfsr2[17] ^ initial_lfsr2[22];
assign prbs_pattern2[28]   = initial_lfsr2[0]  ^ initial_lfsr2[1]  ^ initial_lfsr2[3]  ^ initial_lfsr2[5]  ^ initial_lfsr2[9]  ^ initial_lfsr2[11] ^ initial_lfsr2[12] ^ initial_lfsr2[13] ^ initial_lfsr2[14] ^ initial_lfsr2[15] ^ initial_lfsr2[16] ^ initial_lfsr2[21];
assign prbs_pattern2[29]   = initial_lfsr2[0]  ^ initial_lfsr2[1]  ^ initial_lfsr2[2]  ^ initial_lfsr2[4]  ^ initial_lfsr2[6]  ^ initial_lfsr2[8]  ^ initial_lfsr2[10] ^ initial_lfsr2[11] ^ initial_lfsr2[12] ^ initial_lfsr2[13] ^ initial_lfsr2[15] ^ initial_lfsr2[17] ^ initial_lfsr2[22];
assign prbs_pattern2[30]   = initial_lfsr2[0]  ^ initial_lfsr2[3]  ^ initial_lfsr2[5]  ^ initial_lfsr2[6]  ^ initial_lfsr2[7]  ^ initial_lfsr2[9]  ^ initial_lfsr2[10] ^ initial_lfsr2[11] ^ initial_lfsr2[12] ^ initial_lfsr2[16] ^ initial_lfsr2[17] ^ initial_lfsr2[20] ^ initial_lfsr2[21] ^ initial_lfsr2[22];
assign prbs_pattern2[31]   = initial_lfsr2[1]  ^ initial_lfsr2[2]  ^ initial_lfsr2[4]  ^ initial_lfsr2[5]  ^ initial_lfsr2[8]  ^ initial_lfsr2[9]  ^ initial_lfsr2[10] ^ initial_lfsr2[11] ^ initial_lfsr2[14] ^ initial_lfsr2[15] ^ initial_lfsr2[16] ^ initial_lfsr2[17] ^ initial_lfsr2[19] ^ initial_lfsr2[21] ^ initial_lfsr2[22];
assign prbs_pattern2[32]   = initial_lfsr2[0]  ^ initial_lfsr2[1]  ^ initial_lfsr2[3]  ^ initial_lfsr2[4]  ^ initial_lfsr2[7]  ^ initial_lfsr2[8]  ^ initial_lfsr2[9]  ^ initial_lfsr2[10] ^ initial_lfsr2[13] ^ initial_lfsr2[14] ^ initial_lfsr2[15] ^ initial_lfsr2[16] ^ initial_lfsr2[18] ^ initial_lfsr2[20] ^ initial_lfsr2[21];
assign prbs_pattern2[33]   = initial_lfsr2[0]  ^ initial_lfsr2[1]  ^ initial_lfsr2[2]  ^ initial_lfsr2[3]  ^ initial_lfsr2[7]  ^ initial_lfsr2[8]  ^ initial_lfsr2[9]  ^ initial_lfsr2[12] ^ initial_lfsr2[13] ^ initial_lfsr2[15] ^ initial_lfsr2[19] ^ initial_lfsr2[22];
assign prbs_pattern2[34]   = initial_lfsr2[0]  ^ initial_lfsr2[2]  ^ initial_lfsr2[7]  ^ initial_lfsr2[8]  ^ initial_lfsr2[11] ^ initial_lfsr2[12] ^ initial_lfsr2[17] ^ initial_lfsr2[18] ^ initial_lfsr2[20] ^ initial_lfsr2[21] ^ initial_lfsr2[22];
assign prbs_pattern2[35]   = initial_lfsr2[7]  ^ initial_lfsr2[10] ^ initial_lfsr2[11] ^ initial_lfsr2[14] ^ initial_lfsr2[16] ^ initial_lfsr2[19] ^ initial_lfsr2[21] ^ initial_lfsr2[22];
assign prbs_pattern2[36]   = initial_lfsr2[6]  ^ initial_lfsr2[9]  ^ initial_lfsr2[10] ^ initial_lfsr2[13] ^ initial_lfsr2[15] ^ initial_lfsr2[18] ^ initial_lfsr2[20] ^ initial_lfsr2[21];
assign prbs_pattern2[37]   = initial_lfsr2[5]  ^ initial_lfsr2[8]  ^ initial_lfsr2[9]  ^ initial_lfsr2[12] ^ initial_lfsr2[14] ^ initial_lfsr2[17] ^ initial_lfsr2[19] ^ initial_lfsr2[20];
assign prbs_pattern2[38]   = initial_lfsr2[4]  ^ initial_lfsr2[7]  ^ initial_lfsr2[8]  ^ initial_lfsr2[11] ^ initial_lfsr2[13] ^ initial_lfsr2[16] ^ initial_lfsr2[18] ^ initial_lfsr2[19];
assign prbs_pattern2[39]   = initial_lfsr2[3]  ^ initial_lfsr2[6]  ^ initial_lfsr2[7]  ^ initial_lfsr2[10] ^ initial_lfsr2[12] ^ initial_lfsr2[15] ^ initial_lfsr2[17] ^ initial_lfsr2[18];
assign prbs_pattern2[40]   = initial_lfsr2[2]  ^ initial_lfsr2[5]  ^ initial_lfsr2[6]  ^ initial_lfsr2[9]  ^ initial_lfsr2[11] ^ initial_lfsr2[14] ^ initial_lfsr2[16] ^ initial_lfsr2[17];
assign prbs_pattern2[41]   = initial_lfsr2[1]  ^ initial_lfsr2[4]  ^ initial_lfsr2[5]  ^ initial_lfsr2[8]  ^ initial_lfsr2[10] ^ initial_lfsr2[13] ^ initial_lfsr2[15] ^ initial_lfsr2[16];
assign prbs_pattern2[42]   = initial_lfsr2[0]  ^ initial_lfsr2[3]  ^ initial_lfsr2[4]  ^ initial_lfsr2[7]  ^ initial_lfsr2[9]  ^ initial_lfsr2[12] ^ initial_lfsr2[14] ^ initial_lfsr2[15];
assign prbs_pattern2[43]   = initial_lfsr2[1]  ^ initial_lfsr2[2]  ^ initial_lfsr2[3]  ^ initial_lfsr2[8]  ^ initial_lfsr2[11] ^ initial_lfsr2[13] ^ initial_lfsr2[17] ^ initial_lfsr2[20] ^ initial_lfsr2[22];
assign prbs_pattern2[44]   = initial_lfsr2[0]  ^ initial_lfsr2[1]  ^ initial_lfsr2[2]  ^ initial_lfsr2[7]  ^ initial_lfsr2[10] ^ initial_lfsr2[12] ^ initial_lfsr2[16] ^ initial_lfsr2[19] ^ initial_lfsr2[21];
assign prbs_pattern2[45]   = initial_lfsr2[0]  ^ initial_lfsr2[9]  ^ initial_lfsr2[11] ^ initial_lfsr2[14] ^ initial_lfsr2[15] ^ initial_lfsr2[17] ^ initial_lfsr2[18] ^ initial_lfsr2[22];
assign prbs_pattern2[46]   = initial_lfsr2[1]  ^ initial_lfsr2[6]  ^ initial_lfsr2[8]  ^ initial_lfsr2[10] ^ initial_lfsr2[13] ^ initial_lfsr2[16] ^ initial_lfsr2[20] ^ initial_lfsr2[21] ^ initial_lfsr2[22];
assign prbs_pattern2[47]   = initial_lfsr2[0]  ^ initial_lfsr2[5]  ^ initial_lfsr2[7]  ^ initial_lfsr2[9]  ^ initial_lfsr2[12] ^ initial_lfsr2[15] ^ initial_lfsr2[19] ^ initial_lfsr2[20] ^ initial_lfsr2[21];

//-- good initialization if matches
//-- 9/22 assign match_pat2[0] = (prbs_pattern2[23:27] == raw_sequence2[23:27]);
//-- 9/22 assign match_pat2[1] = (prbs_pattern2[28:32] == raw_sequence2[28:32]);
//-- 9/22 assign match_pat2[2] = (prbs_pattern2[33:37] == raw_sequence2[33:37]);
//-- 9/22 assign match_pat2[3] = (prbs_pattern2[38:42] == raw_sequence2[38:42]);
//-- 9/22 assign match_pat2[4] = (prbs_pattern2[43:47] == raw_sequence2[43:47]);
assign match_pat2[0] = 1'b1;
assign match_pat2[1] = 1'b1;
assign match_pat2[2] = 1'b1;
assign match_pat2[3] = 1'b1;
assign match_pat2[4] = (prbs_pattern2[35:42] == raw_sequence2[35:42]);
assign match_pattern2 = match_pat2[0] & match_pat2[1] & match_pat2[2] & match_pat2[3] & match_pat2[4];

//---------------------------------------- end descramble lfsr state machine ----------------------------------------------
always @(posedge rx_clk_in) begin
count_pattern_a_q       <= count_pattern_a_din;
count_pattern_b_q       <= count_pattern_b_din;
find_ts_q               <= find_ts_din;
phy_training_d1_q       <= phy_training_d1_din;
lfsr_q[0:22]            <= lfsr_din[0:22];
lfsr_locked_q           <= lfsr_locked_din;
lfsr_running_q          <= lfsr_running_din;
lfsr_cntr_q[0:2]        <= lfsr_cntr_din[0:2];
deskew_buffer0_q[63:0]  <= deskew_buffer0_din[63:0];
deskew_buffer1_q[63:0]  <= deskew_buffer1_din[63:0];
deskew_buffer2_q[63:0]  <= deskew_buffer2_din[63:0];
deskew_buffer3_q[63:0]  <= deskew_buffer3_din[63:0];
deskew_write_ptr_q[2:0] <= deskew_write_ptr_din[2:0];
deskew_read_ptr_q[2:0]  <= deskew_read_ptr_din[2:0];
//--deskewed_data_d0_q[63:0] <= deskewed_data_d0_din[63:0];
//--data_flit_q             <= data_flit_din;
data_flit0_q            <= data_flit0_din;
data_flit1_q            <= data_flit1_din;
data_flit2_q            <= data_flit2_din;
data_flit3_q            <= data_flit3_din;
deskew_found_q          <= deskew_found_din;
deskew_locked_q         <= deskew_locked_din;
find_header_q           <= find_header_din;
header_cntr_q[6:0]      <= header_cntr_din[6:0];
ts_type_d1_q[1:0]       <= ts_type_d1_din[1:0];
ts_type_d1c_q[1:0]      <= ts_type_d1c_din[1:0];
bad_ts_d1_q             <= bad_ts_d1_din;
bad_ts_d2_q             <= bad_ts_d2_din;
pattern_a_q             <= pattern_a_din;
pattern_b_q             <= pattern_b_din;
a_cntr_q[6:0]           <= a_cntr_din[6:0];
b_cntr_q[6:0]           <= b_cntr_din[6:0];
pattern_b_cntr_q[3:0]   <= pattern_b_cntr_din[3:0];
pattern_sync_q          <= pattern_sync_din;
pattern_TS1_q           <= pattern_TS1_din;
pattern_TS2_q           <= pattern_TS2_din;
pattern_TS3_q           <= pattern_TS3_din;
ts1_cntr_q[3:0]         <= ts1_cntr_din[3:0];
ts2_cntr_q[3:0]         <= ts2_cntr_din[3:0];
ts3_cntr_q[3:0]         <= ts3_cntr_din[3:0];
block_locked_q          <= block_locked_din;
is_deskew_q             <= is_deskew_din; 
found_pattern_a_q       <= found_pattern_a_din;
found_pattern_b_q       <= found_pattern_b_din;
rx_tx_last_byte_ts3_q   <= rx_tx_last_byte_ts3_din;
valid_q                 <= valid_din;
found_header_q          <= found_header_din;
end


endmodule //-- ocx_dlx_rx_lane
