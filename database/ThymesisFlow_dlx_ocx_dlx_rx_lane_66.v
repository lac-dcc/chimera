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
//-- TITLE:    ocx_dlx_rx_lane_66.v
//-- FUNCTION: Detects A, B, and sync patterns received on the OpenCAPI
//--           link by the Xilinx Synchronous Gearbox on a per lane basis
//--
//------------------------------------------------------------------------
 
//-- (* PIN_DEFAULT_POWER_DOMAIN="VDN", PIN_DEFAULT_GROUND_DOMAIN="GND" *)
module ocx_dlx_rx_lane_66 (

  ln_valid_in           // < input
 ,ln_header_in          // < input
 ,ln_data_in            // < input
 ,ln_slip_out           // > output

 ,slip_in               // < input
 ,ln_data_out           // > output
 ,ln_header_out         // > output
 ,ln_valid_out          // > output
 ,lane_inverted         // > output

 ,found_pattern_a       // > output
 ,found_pattern_b       // > output
 ,found_sync_pattern    // > output
 ,find_a                // < input
 ,find_b                // < input
 ,find_first_b          // < input

 ,rx_clk_in             // < input
 ,rx_reset              // < input

//--  ,gnd                   // <> inout
//--  ,vdn                   // <> inout

);

//!! Bugspray Include : ocx_dlx_rx_lane_66 ;

//-- phy interface through rx
input           ln_valid_in;            //-- data from phy is valid
input  [1:0]    ln_header_in;           //-- header from the phy                           
input  [63:0]   ln_data_in;             //-- data from the phy
output [63:0]   ln_data_out;            //-- data to the common lane
output          ln_slip_out;            //-- tell phy to slip

//-- lane common interface through rx
input           slip_in;                //-- common lane needs to slip to align header
output [1:0]    ln_header_out;          //-- header to the common lane
output          ln_valid_out;           //-- tell common lane if data is valid
output          lane_inverted;          //-- This lane is inverted
    
output          found_pattern_a;        //-- aligned pattern A's detected on this lane
output          found_pattern_b;        //-- pattern B detected on this lane
output          found_sync_pattern;     //-- sync pattern detected on this lane
input           find_a;                 //-- tell lane to find patterns A/B (map to find_pattern_a_q in common lane)
input           find_b;                 //-- tell lane to find pattern B/sync (map to find_pattern_b_q in common lane)
input           find_first_b;           //-- tell lane to find pattern B/sync (map to find_pattern_b_q in common lane)

//-- rx interface
input           rx_clk_in;              //-- clock used by rx
input           rx_reset;               //-- reset command from rx

//-- inout gnd;
//-- (* GROUND_PIN="1" *)
//-- wire gnd;

//-- inout vdn;
//-- (* POWER_PIN="1" *)
//-- wire vdn;


//---------------------------------------- declarations ------------------------------------------------
//-- latch phy inputs

reg             ln_valid_q     ;         //-- latch input valid signal
reg  [63:0]     ln_data_q      ;        //-- latch input data
reg  [1:0]      ln_header_q    ;         //-- latch input header
reg             ln_slip_q      ;         //-- latch output slip command
reg             need_slip_d1_q ;         //-- need slip two cycles in a row to actually slip
reg             need_slip_d2_q ;         //-- need slip two cycles in a row to actually slip
reg             need_slip_d3_q ;         //-- need slip two cycles in a row to actually slip
reg             need_slip_d4_q ;         //-- need slip two cycles in a row to actually slip
reg             need_slip_d5_q ;         //-- need slip two cycles in a row to actually slip
reg             need_slip_d6_q ;         //-- need slip two cycles in a row to actually slip
reg             found_pattern_a_dly1_q ;
reg             found_pattern_a_dly2_q ;
reg             found_pattern_a_dly3_q ;
reg [2:0]       post_slip_cnt_q        ;

wire            ln_valid_din;
wire [63:0]     ln_data_din;
wire [1:0]      ln_header_din;
wire            ln_slip_din;
wire            need_slip_d1_din;
wire            need_slip_d2_din;
wire            need_slip_d3_din;
wire            need_slip_d4_din;
wire            need_slip_d5_din;
wire            need_slip_d6_din;
wire            found_pattern_a_dly1_din;
wire            found_pattern_a_dly2_din;
wire            found_pattern_a_dly3_din;
wire [2:0]      post_slip_cnt_din;

wire            valid_in;               //-- data from the phy is valid this cycle
wire [1:0]      header;                 //-- header from the phy
wire            ab_slip;              //-- slip to align pattern A/B
wire            need_slip;

wire [63:0]     data_beat;              //-- the (possibly inverted) beat of data currently being processed

//-- find pattern A, B, sync
reg  [2:0]      cycle_cntr_q                   ;         //-- what cycle number we're on while finding patterns A and B (8 possible)
reg             found_partial_pattern_b1_q     ;         //-- used to detect pattern B's that fall on beat boundaries
reg             found_partial_pattern_b2_q     ;         //-- used to detect pattern B's that fall on beat boundaries
reg             found_partial_inv_pattern_b1_q ;         //-- used to detect inverted pattern B's that fall on beat boundaries
reg             found_partial_inv_pattern_b2_q ;         //-- used to detect inverted pattern B's that fall on beat boundaries
reg             found_partial_sync1_q          ;         //-- used to detect sync patterns that fall on beat boundaries
reg             found_partial_sync2_q          ;         //-- used to detect sync patterns that fall on beat boundaries
reg             lane_inverted_q                ;         //-- data on this lane is inverted from the phy

wire [2:0]      cycle_cntr_din;
wire            found_partial_pattern_b1_din;
wire            found_partial_pattern_b2_din;
wire            found_partial_inv_pattern_b1_din;
wire            found_partial_inv_pattern_b2_din;
wire            found_partial_sync1_din;
wire            found_partial_sync2_din;
wire            lane_inverted_din;

wire [3:0]      found_a;                //-- found pattern A in each of the 4 slots
wire            found_pattern_a;        //-- FF00 aligned with current pointer
wire            found_pattern_b_internal;        //-- standard or inverted pattern B detected in current beat
wire            found_pattern_a_int;        //-- FF00 aligned with current pointer
wire            found_std_pattern_b;    //-- FFFF0000 detected in current beat
wire            found_inv_pattern_b;    //-- 0000FFFF detected in current beat (invert lane from here on out and slip 8 to realign)
wire            found_sync_pattern;     //-- FF0000FF detected in current beat

//---------------------------------------- end declarations ------------------------------------------------
//---------------------------------------- latch phy inputs/outputs ------------------------------------------------



//-- internal signals
//-- phy inputs
assign ln_valid_din             = ln_valid_in;
assign ln_header_din[1:0]       = {2{lane_inverted_q}}  ^ ln_header_in[1:0];
assign ln_data_din[63:0]        = {64{lane_inverted_q}} ^ ln_data_in[63:0];

assign valid_in                 = ln_valid_q;
assign ln_slip_out              = ln_slip_q;

assign data_beat[63:0] = ln_data_q[63:0];                                 //-- invert data if necessary (lane_inverted_q set by pattern B logic)
assign header[1:0]     = ln_header_q[1:0];                                //-- invert data if necessary (lane_inverted_q set by pattern B logic)

//-- wait for pattern to become valid after the slip (it can take up to 6 cycles for the slip to take affect)
assign post_slip_cnt_din[2:0] =  ln_slip_q              ? 3'b110:
                                |(post_slip_cnt_q[2:0]) ? post_slip_cnt_q[2:0] - 3'b001:
                                                          3'b000;

assign ln_slip_din              = (need_slip & ~(need_slip_d1_q | need_slip_d2_q | need_slip_d3_q | need_slip_d4_q | need_slip_d5_q | need_slip_d6_q));
assign need_slip = valid_in & (ab_slip | slip_in) & ~(need_slip_d1_q | need_slip_d2_q | need_slip_d3_q | need_slip_d4_q | need_slip_d5_q | need_slip_d6_q);

assign need_slip_d1_din = ((valid_in & need_slip)      | (~valid_in & need_slip_d1_q));
assign need_slip_d2_din = ((valid_in & need_slip_d1_q) | (~valid_in & need_slip_d2_q));
assign need_slip_d3_din = ((valid_in & need_slip_d2_q) | (~valid_in & need_slip_d3_q));
assign need_slip_d4_din = ((valid_in & need_slip_d3_q) | (~valid_in & need_slip_d4_q));
assign need_slip_d5_din = ((valid_in & need_slip_d4_q) | (~valid_in & need_slip_d5_q));
assign need_slip_d6_din = ((valid_in & need_slip_d5_q) | (~valid_in & need_slip_d6_q));

//---------end Version 1

//---------Version 2 (if phy handles latching)
//-- always @(posedge rx_clk_in) begin
//-- ln_slip_q               <= ln_slip_din;
//-- end

//-- Note: slip command cannot be high 2 cycles in a row
//-- assign need_slip = valid_in & (ab_slip | slip_in) & ~ln_slip_q;
//-- assign ln_slip_out = need_slip;
//-- assign ln_slip_din = ln_slip_out;

//-- internal signals
//-- assign valid_in = ln_valid_in;
//-- assign data_in[63:0] = ln_data_in[63:0];
//-- assign header[1:0] = ln_header_in[1:0];
//---------end Version 2



//-- Note: I don't think it matters if we look for pattern A's before we are phase aligned because we won't find them til we are phase aligned.
//--  If it does matter, add phase_align_done and delay_reset_done inputs (consult p240 of the Xilinx doc) and use them to limit find_a and find_b
//-- p240 of the Xilinx doc:
//-- RX phase alignment done. When the auto RX phase and delay alignment are used, the second
//-- rising edge of RXPHALIGNDONE detected after RXDLYSRESETDONE assertion indicates RX phase
//-- and delay alignment are done. The alignment of data in RXDATA can change after the second
//-- rising edge of RXPHALIGNDONE.


//-- rx/lane outputs
assign ln_valid_out     = valid_in;
assign ln_data_out      = data_beat[63:0];
assign ln_header_out    = header[1:0];
//---------------------------------------- end latch phy inputs/outputs ------------------------------------------------
//---------------------------------------- pattern A, B, and sync ----------------------------------------------

//-- Note: data_beat[63:0] is the (possibly inverted) data from the phy in the current cycle, used to find patterns A, B, and sync

assign cycle_cntr_din[2:0] =  (~find_a & ~find_b)              ?  3'b000                   :
                              ( valid_in & (find_a | find_b) ) ? (cycle_cntr_q[2:0] + 3'b001) :                      //-- valid and pattern a or b -> increment
                                                                 (cycle_cntr_q[2:0] );                               //-- default, including not valid or not training -> no change


assign found_pattern_a_int = &(found_a[3:0]) ;       //-- pattern A in all 4 spots 
assign found_pattern_a = found_pattern_a_int;

assign found_a[0] = ( (cycle_cntr_q[2:0] == 3'd0) & (&(  data_beat[63:57]                   )) & (&(~data_beat[55:49])) ) |       //-- cycle 0: 1111 111x 0000 000x
                    ( (cycle_cntr_q[2:0] == 3'd1) & (&( {data_beat[63:59], data_beat[49:48]})) & (&(~data_beat[57:51])) ) |       //-- cycle 1: 1111 1x00 0000 0x11
                    ( (cycle_cntr_q[2:0] == 3'd2) & (&( {data_beat[63:61], data_beat[51:48]})) & (&(~data_beat[59:53])) ) |       //-- cycle 2: 111x 0000 000x 1111
                    ( (cycle_cntr_q[2:0] == 3'd3) & (&( {data_beat[63],    data_beat[53:48]})) & (&(~data_beat[61:55])) ) |       //-- cycle 3: 1x00 0000 0x11 1111
                    ( (cycle_cntr_q[2:0] == 3'd4) & (&( ~data_beat[63:57]                   )) & (&( data_beat[55:49])) ) |       //-- cycle 4: 0000 000x 1111 111x
                    ( (cycle_cntr_q[2:0] == 3'd5) & (&(~{data_beat[63:59], data_beat[49:48]})) & (&( data_beat[57:51])) ) |       //-- cycle 5: 0000 0x11 1111 1x00
                    ( (cycle_cntr_q[2:0] == 3'd6) & (&(~{data_beat[63:61], data_beat[51:48]})) & (&( data_beat[59:53])) ) |       //-- cycle 6: 000x 1111 111x 0000
                    ( (cycle_cntr_q[2:0] == 3'd7) & (&(~{data_beat[63],    data_beat[53:48]})) & (&( data_beat[61:55])) );        //-- cycle 7: 0x11 1111 1x00 0000

assign found_a[1] = ( (cycle_cntr_q[2:0] == 3'd0) & (&(  data_beat[47:41]                   )) & (&(~data_beat[39:33])) ) |       //-- cycle 0: 1111 111x 0000 000x
                    ( (cycle_cntr_q[2:0] == 3'd1) & (&( {data_beat[47:43], data_beat[33:32]})) & (&(~data_beat[41:35])) ) |       //-- cycle 1: 1111 1x00 0000 0x11
                    ( (cycle_cntr_q[2:0] == 3'd2) & (&( {data_beat[47:45], data_beat[35:32]})) & (&(~data_beat[43:37])) ) |       //-- cycle 2: 111x 0000 000x 1111
                    ( (cycle_cntr_q[2:0] == 3'd3) & (&( {data_beat[47],    data_beat[37:32]})) & (&(~data_beat[45:39])) ) |       //-- cycle 3: 1x00 0000 0x11 1111
                    ( (cycle_cntr_q[2:0] == 3'd4) & (&( ~data_beat[47:41]                   )) & (&( data_beat[39:33])) ) |       //-- cycle 4: 0000 000x 1111 111x
                    ( (cycle_cntr_q[2:0] == 3'd5) & (&(~{data_beat[47:43], data_beat[33:32]})) & (&( data_beat[41:35])) ) |       //-- cycle 5: 0000 0x11 1111 1x00
                    ( (cycle_cntr_q[2:0] == 3'd6) & (&(~{data_beat[47:45], data_beat[35:32]})) & (&( data_beat[43:37])) ) |       //-- cycle 6: 000x 1111 111x 0000
                    ( (cycle_cntr_q[2:0] == 3'd7) & (&(~{data_beat[47],    data_beat[37:32]})) & (&( data_beat[45:39])) );        //-- cycle 7: 0x11 1111 1x00 0000

assign found_a[2] = ( (cycle_cntr_q[2:0] == 3'd0) & (&(  data_beat[31:25]                   )) & (&(~data_beat[23:17])) ) |       //-- cycle 0: 1111 111x 0000 000x
                    ( (cycle_cntr_q[2:0] == 3'd1) & (&( {data_beat[31:27], data_beat[17:16]})) & (&(~data_beat[25:19])) ) |       //-- cycle 1: 1111 1x00 0000 0x11
                    ( (cycle_cntr_q[2:0] == 3'd2) & (&( {data_beat[31:29], data_beat[19:16]})) & (&(~data_beat[27:21])) ) |       //-- cycle 2: 111x 0000 000x 1111
                    ( (cycle_cntr_q[2:0] == 3'd3) & (&( {data_beat[31],    data_beat[21:16]})) & (&(~data_beat[29:23])) ) |       //-- cycle 3: 1x00 0000 0x11 1111
                    ( (cycle_cntr_q[2:0] == 3'd4) & (&( ~data_beat[31:25]                   )) & (&( data_beat[23:17])) ) |       //-- cycle 4: 0000 000x 1111 111x
                    ( (cycle_cntr_q[2:0] == 3'd5) & (&(~{data_beat[31:27], data_beat[17:16]})) & (&( data_beat[25:19])) ) |       //-- cycle 5: 0000 0x11 1111 1x00
                    ( (cycle_cntr_q[2:0] == 3'd6) & (&(~{data_beat[31:29], data_beat[19:16]})) & (&( data_beat[27:21])) ) |       //-- cycle 6: 000x 1111 111x 0000
                    ( (cycle_cntr_q[2:0] == 3'd7) & (&(~{data_beat[31],    data_beat[21:16]})) & (&( data_beat[29:23])) );        //-- cycle 7: 0x11 1111 1x00 0000

assign found_a[3] = ( (cycle_cntr_q[2:0] == 3'd0) & (&(  data_beat[15: 9]                 ))   & (&(~data_beat[ 7:1])) ) |        //-- cycle 0: 1111 111x 0000 000x
                    ( (cycle_cntr_q[2:0] == 3'd1) & (&( {data_beat[15:11], data_beat[1:0]}))   & (&(~data_beat[ 9:3])) ) |        //-- cycle 1: 1111 1x00 0000 0x11
                    ( (cycle_cntr_q[2:0] == 3'd2) & (&( {data_beat[15:13], data_beat[3:0]}))   & (&(~data_beat[11:5])) ) |        //-- cycle 2: 111x 0000 000x 1111
                    ( (cycle_cntr_q[2:0] == 3'd3) & (&( {data_beat[15],    data_beat[5:0]}))   & (&(~data_beat[13:7])) ) |        //-- cycle 3: 1x00 0000 0x11 1111
                    ( (cycle_cntr_q[2:0] == 3'd4) & (&( ~data_beat[15: 9]                 ))   & (&( data_beat[ 7:1])) ) |        //-- cycle 4: 0000 000x 1111 111x
                    ( (cycle_cntr_q[2:0] == 3'd5) & (&(~{data_beat[15:11], data_beat[1:0]}))   & (&( data_beat[ 9:3])) ) |        //-- cycle 5: 0000 0x11 1111 1x00
                    ( (cycle_cntr_q[2:0] == 3'd6) & (&(~{data_beat[15:13], data_beat[3:0]}))   & (&( data_beat[11:5])) ) |        //-- cycle 6: 000x 1111 111x 0000
                    ( (cycle_cntr_q[2:0] == 3'd7) & (&(~{data_beat[15],    data_beat[5:0]}))   & (&( data_beat[13:7])) );         //-- cycle 7: 0x11 1111 1x00 0000


assign found_partial_pattern_b1_din = ( ~valid_in ) ? found_partial_pattern_b1_q :      //-- if data is not valid, carry over past value
                                      (( (cycle_cntr_q[2:0] == 3'd0) & (&(data_beat[15:1 ]))                         ) |          //--      FFFF at end of pattern in cycle 0
                                       ( (cycle_cntr_q[2:0] == 3'd1) & (&(data_beat[17:3 ])) & (  ~data_beat[0   ]  )) |          //--    3 FFFC at end of pattern in cycle 1
                                       ( (cycle_cntr_q[2:0] == 3'd2) & (&(data_beat[19:5 ])) & (&(~data_beat[2:0 ]) )) |          //--    F FFF0 at end of pattern in cycle 2
                                       ( (cycle_cntr_q[2:0] == 3'd3) & (&(data_beat[21:7 ])) & (&(~data_beat[4:0 ]) )) |          //--   3F FFC0 at end of pattern in cycle 3
                                       ( (cycle_cntr_q[2:0] == 3'd4) & (&(data_beat[23:9 ])) & (&(~data_beat[6:0 ]) )) |          //--   FF FF00 at end of pattern in cycle 4
                                       ( (cycle_cntr_q[2:0] == 3'd5) & (&(data_beat[25:11])) & (&(~data_beat[8:0 ]) )) |          //--  3FF FC00 at end of pattern in cycle 5
                                       ( (cycle_cntr_q[2:0] == 3'd6) & (&(data_beat[27:13])) & (&(~data_beat[10:0]) )) |          //--  FFF F000 at end of pattern in cycle 6
                                       ( (cycle_cntr_q[2:0] == 3'd7) & (&(data_beat[29:15])) & (&(~data_beat[12:0]) )));          //-- 3FFF C000 at end of pattern in cycle 7

assign found_partial_pattern_b2_din = ( ~valid_in ) ? found_partial_pattern_b2_q :                              //-- if data is not valid, carry over past value
                                      (( (cycle_cntr_q[2:0] == 3'd1) & data_beat[1] & data_beat[0] ) |          //--    3 at end of pattern in cycle 1
                                       ( (cycle_cntr_q[2:0] == 3'd2) & (&(data_beat[3:0 ])) ) |                 //--    F at end of pattern in cycle 2
                                       ( (cycle_cntr_q[2:0] == 3'd3) & (&(data_beat[5:0 ])) ) |                 //--   3F at end of pattern in cycle 3
                                       ( (cycle_cntr_q[2:0] == 3'd4) & (&(data_beat[7:0 ])) ) |                 //--   FF at end of pattern in cycle 4
                                       ( (cycle_cntr_q[2:0] == 3'd5) & (&(data_beat[9:0 ])) ) |                 //--  3FF at end of pattern in cycle 5
                                       ( (cycle_cntr_q[2:0] == 3'd6) & (&(data_beat[11:0])) ) |                 //--  FFF at end of pattern in cycle 6
                                       ( (cycle_cntr_q[2:0] == 3'd7) & (&(data_beat[13:0])) ));                 //-- 3FFF at end of pattern in cycle 7

assign found_std_pattern_b = (((cycle_cntr_q[2:0] == 3'd0) & (&(data_beat[63:49])) & (&(~data_beat[47:33]))   ) |                                                     //-- FFFF 0000 -- first possible spot   1111 1111 1111 111x 0000 0000 0000 000x
                             ( (cycle_cntr_q[2:0] == 3'd0) & (&(data_beat[47:33])) & (&(~data_beat[31:17]))   ) |                                                     //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd0) & (&(data_beat[31:17])) & (&(~data_beat[15:1 ]))   ) |                                                     //-- FFFF 0000 -- third possible spot
                             ( (cycle_cntr_q[2:0] == 3'd0) & found_partial_pattern_b1_q & (&(~header[1]))   )   |                                                     //-- 3FFF C000 last time and (0x) this time
                             ( (cycle_cntr_q[2:0] == 3'd0) & found_partial_pattern_b2_q & (&( header[1])) & (&(~data_beat[63:49])) ) |                              //-- 3FFF last time and (1x) 0000 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd1) & (&(data_beat[49:35])) & (&(~data_beat[33:19])) ) |                                                       //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd1) & (&(data_beat[33:19])) & (&(~data_beat[17:3 ])) ) |                                                       //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd1) & found_partial_pattern_b1_q & (&(~header[1:0])) & (&(~data_beat[63:51]))   ) |                            //-- FFFF last time and (00) 0003 this time
                             ( (cycle_cntr_q[2:0] == 3'd1) & (&(header[1:0]))         & (&(data_beat[63:51])) & (&(~data_beat[49:35])) ) |                            //-- none last time and (11) FFFC 0003 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd2) & (&(data_beat[51:37])) & (&(~data_beat[35:21])) ) |                                                       //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd2) & (&(data_beat[35:21])) & (&(~data_beat[19:5 ])) ) |                                                       //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd2) & found_partial_pattern_b1_q & (&(~header[1:0])) & (&(~data_beat[63:53])) ) |                              //-- found 3 FFFC last time and (00) 000 this time
                             ( (cycle_cntr_q[2:0] == 3'd2) & found_partial_pattern_b2_q & (&( header[1:0])) & (&( data_beat[63:53])) & (&(~data_beat[51:37])) ) |     //-- found 3 last time and (11) FFF0 000 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd3) & (&(data_beat[53:39])) & (&(~data_beat[37:23])) ) |                                                       //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd3) & (&(data_beat[37:23])) & (&(~data_beat[21:7 ])) ) |                                                       //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd3) & found_partial_pattern_b1_q & (&(~header[1:0])) & (&(~data_beat[63:55])) ) |                              //-- found F FFF0 last time and (00) 003 this time
                             ( (cycle_cntr_q[2:0] == 3'd3) & found_partial_pattern_b2_q & (&( header[1:0])) & (&( data_beat[63:55])) & (&(~data_beat[53:39])) ) |     //-- found F last time and (11) FFC0 003 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd4) & (&(data_beat[55:41])) & (&(~data_beat[39:25])) ) |                                                       //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd4) & (&(data_beat[39:25])) & (&(~data_beat[23:9 ])) ) |                                                       //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd4) & found_partial_pattern_b1_q & (&(~header[1:0])) & (&(~data_beat[63:57])) ) |                              //-- found 3F FFC0 last time and (00) 00 this time
                             ( (cycle_cntr_q[2:0] == 3'd4) & found_partial_pattern_b2_q & (&( header[1:0])) & (&( data_beat[63:57])) & (&(~data_beat[55:41])) ) |     //-- found 3F last time and (11) FF00 00 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd5) & (&(data_beat[57:43])) & (&(~data_beat[41:27])) ) |                                                       //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd5) & (&(data_beat[41:27])) & (&(~data_beat[25:11])) ) |                                                       //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd5) & found_partial_pattern_b1_q & (&(~header[1:0])) & (&(~data_beat[63:59])) ) |                              //-- found FF FF00 last time and (00) 03 this time
                             ( (cycle_cntr_q[2:0] == 3'd5) & found_partial_pattern_b2_q & (&( header[1:0])) & (&( data_beat[63:59])) & (&(~data_beat[57:43])) ) |     //-- found FF last time and (11) FC00 03 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd6) & (&(data_beat[59:45])) & (&(~data_beat[43:29])) ) |                                                       //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd6) & (&(data_beat[43:29])) & (&(~data_beat[27:13])) ) |                                                       //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd6) & found_partial_pattern_b1_q & (&(~header[1:0])) & (&(~data_beat[63:61])) ) |                              //-- found 3FF FC00 last time and (00) 0 this time
                             ( (cycle_cntr_q[2:0] == 3'd6) & found_partial_pattern_b2_q & (&( header[1:0])) & (&( data_beat[63:61])) & (&(~data_beat[59:45])) ) |     //-- found 3FF last time and (11) F000 0 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd7) & (&(data_beat[61:47])) & (&(~data_beat[45:31])) ) |                                                       //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd7) & (&(data_beat[45:31])) & (&(~data_beat[29:15])) ) |                                                       //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd7) & found_partial_pattern_b1_q & (&(~header[1:0])) & (~data_beat[63]) ) |                                    //-- found FFF F000 last time and (00) 3 this time
                             ( (cycle_cntr_q[2:0] == 3'd7) & found_partial_pattern_b2_q & (&( header[1:0])) &  data_beat[63] & (&(~data_beat[61:47])) ));             //-- found FFF last time and (11) C000 3 this time
                                                                                                                                                                      
assign found_partial_inv_pattern_b1_din = ( ~valid_in ) ? found_partial_inv_pattern_b1_q :                                           //-- if data is not valid, carry over past value
                                         (( (cycle_cntr_q[2:0] == 3'd4) & (&(~data_beat[15:1 ]))                         ) |         //--      FFFF at end of pattern in cycle 0
                                          ( (cycle_cntr_q[2:0] == 3'd5) & (&(~data_beat[17:3 ])) & (  data_beat[0   ]  )) |          //--    3 FFFC at end of pattern in cycle 1
                                          ( (cycle_cntr_q[2:0] == 3'd6) & (&(~data_beat[19:5 ])) & (&(data_beat[2:0 ]) )) |          //--    F FFF0 at end of pattern in cycle 2
                                          ( (cycle_cntr_q[2:0] == 3'd7) & (&(~data_beat[21:7 ])) & (&(data_beat[4:0 ]) )) |          //--   3F FFC0 at end of pattern in cycle 3
                                          ( (cycle_cntr_q[2:0] == 3'd0) & (&(~data_beat[23:9 ])) & (&(data_beat[6:0 ]) )) |          //--   FF FF00 at end of pattern in cycle 4
                                          ( (cycle_cntr_q[2:0] == 3'd1) & (&(~data_beat[25:11])) & (&(data_beat[8:0 ]) )) |          //--  3FF FC00 at end of pattern in cycle 5
                                          ( (cycle_cntr_q[2:0] == 3'd2) & (&(~data_beat[27:13])) & (&(data_beat[10:0]) )) |          //--  FFF F000 at end of pattern in cycle 6
                                          ( (cycle_cntr_q[2:0] == 3'd3) & (&(~data_beat[29:15])) & (&(data_beat[12:0]) )));          //-- 3FFF C000 at end of pattern in cycle 7

assign found_partial_inv_pattern_b2_din = ( ~valid_in ) ? found_partial_inv_pattern_b2_q :                          //-- if data is not valid, carry over past value
                                         (( (cycle_cntr_q[2:0] == 3'd5) & ~data_beat[1] & ~data_beat[0] ) |         //--    3 at end of pattern in cycle 1
                                          ( (cycle_cntr_q[2:0] == 3'd6) & (&(~data_beat[3:0 ])) ) |                 //--    F at end of pattern in cycle 2
                                          ( (cycle_cntr_q[2:0] == 3'd7) & (&(~data_beat[5:0 ])) ) |                 //--   3F at end of pattern in cycle 3
                                          ( (cycle_cntr_q[2:0] == 3'd0) & (&(~data_beat[7:0 ])) ) |                 //--   FF at end of pattern in cycle 4
                                          ( (cycle_cntr_q[2:0] == 3'd1) & (&(~data_beat[9:0 ])) ) |                 //--  3FF at end of pattern in cycle 5
                                          ( (cycle_cntr_q[2:0] == 3'd2) & (&(~data_beat[11:0])) ) |                 //--  FFF at end of pattern in cycle 6
                                          ( (cycle_cntr_q[2:0] == 3'd3) & (&(~data_beat[13:0])) ));                 //-- 3FFF at end of pattern in cycle 7

assign found_inv_pattern_b = (((cycle_cntr_q[2:0] == 3'd4) & (&(~data_beat[63:49])) & (&(data_beat[47:33]))   ) |                                                     //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd4) & (&(~data_beat[47:33])) & (&(data_beat[31:17]))   ) |                                                     //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd4) & (&(~data_beat[31:17])) & (&(data_beat[15:1 ]))   ) |                                                     //-- FFFF 0000 -- third possible spot
                             ( (cycle_cntr_q[2:0] == 3'd4) & found_partial_inv_pattern_b1_q & (&(header[1]))  ) |                                                    //-- 3FFF C000 last time and (0x) this time
                             ( (cycle_cntr_q[2:0] == 3'd4) & found_partial_inv_pattern_b2_q & (&( ~header[1])) & (&(data_beat[63:49])) ) |                           //-- 3FFF last time and (1x) 0000 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd5) & (&(~data_beat[49:35])) & (&(data_beat[33:19])) ) |                                                       //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd5) & (&(~data_beat[33:19])) & (&(data_beat[17:3 ])) ) |                                                       //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd5) & found_partial_inv_pattern_b1_q & (&(header[1:0])) & (&(data_beat[63:51]))   ) |                         //-- FFFF last time and (00) 0003 this time
                             ( (cycle_cntr_q[2:0] == 3'd5) & (&(~header[1:0]))         & (&(~data_beat[63:51])) & (&(data_beat[49:35])) ) |                            //-- none last time and (11) FFFC 0003 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd6) & (&(~data_beat[51:37])) & (&(data_beat[35:21])) ) |                                                          //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd6) & (&(~data_beat[35:21])) & (&(data_beat[19:5 ])) ) |                                                          //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd6) & found_partial_inv_pattern_b1_q & (&(header[1:0])) & (&(data_beat[63:53])) ) |                              //-- found 3 FFFC last time and (00) 000 this time
                             ( (cycle_cntr_q[2:0] == 3'd6) & found_partial_inv_pattern_b2_q & (&( ~header[1:0])) & (&( ~data_beat[63:53])) & (&(data_beat[51:37])) ) |    //-- found 3 last time and (11) FFF0 000 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd7) & (&(~data_beat[53:39])) & (&(data_beat[37:23])) ) |                                                           //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd7) & (&(~data_beat[37:23])) & (&(data_beat[21:7 ])) ) |                                                          //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd7) & found_partial_inv_pattern_b1_q & (&(header[1:0])) & (&(data_beat[63:55])) ) |                              //-- found F FFF0 last time and (00) 003 this time
                             ( (cycle_cntr_q[2:0] == 3'd7) & found_partial_inv_pattern_b2_q & (&( ~header[1:0])) & (&( ~data_beat[63:55])) & (&(data_beat[53:39])) ) |    //-- found F last time and (11) FFC0 003 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd0) & (&(~data_beat[55:41])) & (&(data_beat[39:25])) ) |                                                            //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd0) & (&(~data_beat[39:25])) & (&(data_beat[23:9 ])) ) |                                                          //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd0) & found_partial_inv_pattern_b1_q & (&(header[1:0])) & (&(data_beat[63:57])) ) |                              //-- found 3F FFC0 last time and (00) 00 this time
                             ( (cycle_cntr_q[2:0] == 3'd0) & found_partial_inv_pattern_b2_q & (&( ~header[1:0])) & (&( ~data_beat[63:57])) & (&(data_beat[55:41])) ) |    //-- found 3F last time and (11) FF00 00 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd1) & (&(~data_beat[57:43])) & (&(data_beat[41:27])) ) |                                                          //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd1) & (&(~data_beat[41:27])) & (&(data_beat[25:11])) ) |                                                          //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd1) & found_partial_inv_pattern_b1_q & (&(header[1:0])) & (&(data_beat[63:59])) ) |                              //-- found FF FF00 last time and (00) 03 this time
                             ( (cycle_cntr_q[2:0] == 3'd1) & found_partial_inv_pattern_b2_q & (&( ~header[1:0])) & (&( ~data_beat[63:59])) & (&(data_beat[57:43])) ) |    //-- found FF last time and (11) FC00 03 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd2) & (&(~data_beat[59:45])) & (&(data_beat[43:29])) ) |                                                          //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd2) & (&(~data_beat[43:29])) & (&(data_beat[27:13])) ) |                                                          //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd2) & found_partial_inv_pattern_b1_q & (&(header[1:0])) & (&(data_beat[63:61])) ) |                              //-- found 3FF FC00 last time and (00) 0 this time
                             ( (cycle_cntr_q[2:0] == 3'd2) & found_partial_inv_pattern_b2_q & (&( ~header[1:0])) & (&( ~data_beat[63:61])) & (&(data_beat[59:45])) ) |    //-- found 3FF last time and (11) F000 0 this time
                                                                                                                                                                      
                             ( (cycle_cntr_q[2:0] == 3'd3) & (&(~data_beat[61:47])) & (&(data_beat[45:31])) ) |                                                          //-- FFFF 0000 -- first possible spot
                             ( (cycle_cntr_q[2:0] == 3'd3) & (&(~data_beat[45:31])) & (&(data_beat[29:15])) ) |                                                          //-- FFFF 0000 -- second possible spot
                             ( (cycle_cntr_q[2:0] == 3'd3) & found_partial_inv_pattern_b1_q & (&(header[1:0])) & (data_beat[63]) ) |                                    //-- found FFF F000 last time and (00) 3 this time
                             ( (cycle_cntr_q[2:0] == 3'd3) & found_partial_inv_pattern_b2_q & (&( ~header[1:0])) &  ~data_beat[63] & (&(data_beat[61:47])) ));            //-- found FFF last time and (11) C000 3 this time
                                                                                                                                                                      
assign found_pattern_b_internal = (found_std_pattern_b | found_inv_pattern_b) & ~(|(post_slip_cnt_q[2:0]));     //-- found standard or inverted pattern B this cycle
assign found_pattern_b          = found_pattern_b_internal;

assign found_partial_sync1_din = ( ~valid_in ) ? found_partial_sync1_q :                                                                                              //-- if data is not valid, carry over past value
                                 (( (cycle_cntr_q[2:0] == 3'd0) & (&(data_beat[15: 9])) & (&(~data_beat[ 7:0])) ) |                                                   //--      FF00 at end of pattern in cycle 0
                                  ( (cycle_cntr_q[2:0] == 3'd1) & (&(data_beat[17:11])) & (&(~data_beat[ 9:0])) ) |                                                   //--    3 FC00 at end of pattern in cycle 1
                                  ( (cycle_cntr_q[2:0] == 3'd2) & (&(data_beat[19:13])) & (&(~data_beat[11:0])) ) |                                                   //--    F F000 at end of pattern in cycle 2
                                  ( (cycle_cntr_q[2:0] == 3'd3) & (&(data_beat[21:15])) & (&(~data_beat[13:0])) ) |                                                   //--   3F C000 at end of pattern in cycle 3
                                  ( (cycle_cntr_q[2:0] == 3'd4) & (&(data_beat[23:17])) & (&(~data_beat[15:1])) ) |                                                   //--   FF 0000 at end of pattern in cycle 4
                                  ( (cycle_cntr_q[2:0] == 3'd5) & (&(data_beat[25:19])) & (&(~data_beat[17:3])) & (&(data_beat[1:0])) ) |                             //--  3FC 0003 at end of pattern in cycle 5
                                  ( (cycle_cntr_q[2:0] == 3'd6) & (&(data_beat[27:21])) & (&(~data_beat[19:5])) & (&(data_beat[3:0])) ) |                             //--  FF0 000F at end of pattern in cycle 6
                                  ( (cycle_cntr_q[2:0] == 3'd7) & (&(data_beat[29:23])) & (&(~data_beat[21:7])) & (&(data_beat[5:0])) ));                             //-- 3FC0 003F at end of pattern in cycle 7
                                                                                                                                                                    
assign found_partial_sync2_din = ( ~valid_in ) ? found_partial_sync2_q :                                                                                              //-- if data is not valid, carry over past value
                                 (( (cycle_cntr_q[2:0] == 3'd1) & (&(data_beat[ 1:0])) ) |                                                                            //--    3 at end of pattern in cycle 1
                                  ( (cycle_cntr_q[2:0] == 3'd2) & (&(data_beat[ 3:0])) ) |                                                                            //--    F at end of pattern in cycle 2
                                  ( (cycle_cntr_q[2:0] == 3'd3) & (&(data_beat[ 5:0])) ) |                                                                            //--   3F at end of pattern in cycle 3
                                  ( (cycle_cntr_q[2:0] == 3'd4) & (&(data_beat[ 7:1])) ) |                                                                            //--   FF at end of pattern in cycle 4
                                  ( (cycle_cntr_q[2:0] == 3'd5) & (&(data_beat[ 9:3])) & (&(~data_beat[1:0])) ) |                                                     //--  3FC at end of pattern in cycle 5
                                  ( (cycle_cntr_q[2:0] == 3'd6) & (&(data_beat[11:5])) & (&(~data_beat[3:0])) ) |                                                     //--  FF0 at end of pattern in cycle 6
                                  ( (cycle_cntr_q[2:0] == 3'd7) & (&(data_beat[13:7])) & (&(~data_beat[5:0])) ));                                                     //-- 3FC0 at end of pattern in cycle 7

assign found_sync_pattern = ~(|(post_slip_cnt_q[2:0])) &                                                                                                                                //-- Gate with delay after slip (wait for valid data)
                           (( (cycle_cntr_q[2:0] == 3'd0) & (&(data_beat[63:57])) & (&(~data_beat[55:41])) & (&(data_beat[39:33])) ) |                                                //-- FF00 00FF -- first possible spot
                            ( (cycle_cntr_q[2:0] == 3'd0) & (&(data_beat[47:41])) & (&(~data_beat[39:25])) & (&(data_beat[23:17])) ) |                                                //-- FF00 00FF -- second possible spot
                            ( (cycle_cntr_q[2:0] == 3'd0) & (&(data_beat[31:25])) & (&(~data_beat[23: 9])) & (&(data_beat[ 7: 1])) ) |                                                //-- FF00 00FF -- third possible spot
                            ( (cycle_cntr_q[2:0] == 3'd0) & found_partial_sync1_q & (&( header[1:0])) ) |                                                                             //-- found 3FC0 003F last time and (11) this time
                            ( (cycle_cntr_q[2:0] == 3'd0) & found_partial_sync2_q & (&(~header[1:0])) & (&(~data_beat[63:57])) & (&(data_beat[55:49])) ) |                            //-- found 3FC0 last time and (00) 00FF this time

                            ( (cycle_cntr_q[2:0] == 3'd1) & (&(data_beat[49:43])) & (&(~data_beat[41:27])) & (&(data_beat[25:19])) ) |                                                //-- FF00 00FF -- first possible spot
                            ( (cycle_cntr_q[2:0] == 3'd1) & (&(data_beat[33:27])) & (&(~data_beat[25:11])) & (&(data_beat[ 9: 3])) ) |                                                //-- FF00 00FF -- second possible spot
                            ( (cycle_cntr_q[2:0] == 3'd1) & found_partial_sync1_q & (&(~header[1:0])) & (&(~data_beat[63:59])) & (&( data_beat[57:51])) ) |                           //-- found FF00 last time and (00) 03FC this time
                            ( (cycle_cntr_q[2:0] == 3'd1) & (&( header[1:0])) & (&( data_beat[63:59])) & (&(~data_beat[57:43])) & (&(data_beat[41:35])) ) |   //-- found none last time and (11) FC00 03FC this time

                            ( (cycle_cntr_q[2:0] == 3'd2) & (&(data_beat[51:45])) & (&(~data_beat[43:29])) & (&(data_beat[27:21])) ) |                                                //-- FF00 00FF -- first possible spot
                            ( (cycle_cntr_q[2:0] == 3'd2) & (&(data_beat[35:29])) & (&(~data_beat[27:13])) & (&(data_beat[11: 5])) ) |                                                //-- FF00 00FF -- second possible spot
                            ( (cycle_cntr_q[2:0] == 3'd2) & found_partial_sync1_q & (&(~header[1:0])) & (&(~data_beat[63:61])) & (&( data_beat[59:53])) ) |                           //-- found 3 FC00 last time and (00) 0FF this time
                            ( (cycle_cntr_q[2:0] == 3'd2) & found_partial_sync2_q & (&( header[1:0])) & (&( data_beat[63:61])) & (&(~data_beat[59:45])) & (&(data_beat[43:37])) ) |   //-- found 3 last time and (11) F000 0FF this time

                            ( (cycle_cntr_q[2:0] == 3'd3) & (&(data_beat[53:47])) & (&(~data_beat[45:31])) & (&(data_beat[29:23])) ) |                                                //-- FF00 00FF -- first possible spot
                            ( (cycle_cntr_q[2:0] == 3'd3) & (&(data_beat[37:31])) & (&(~data_beat[29:15])) & (&(data_beat[13: 7])) ) |                                                //-- FF00 00FF -- second possible spot
                            ( (cycle_cntr_q[2:0] == 3'd3) & found_partial_sync1_q & (&(~header[1:0])) & (~data_beat[63]) & (&( data_beat[61:55])) ) |                                 //-- found F F000 last time and (00) 3FC this time
                            ( (cycle_cntr_q[2:0] == 3'd3) & found_partial_sync2_q & (&( header[1:0])) &   data_beat[63]  & (&(~data_beat[61:47])) & (&(data_beat[45:39])) ) |         //-- found F last time and (11) C000 3FC this time

                            ( (cycle_cntr_q[2:0] == 3'd4) & (&(data_beat[55:49])) & (&(~data_beat[47:33])) & (&(data_beat[31:25])) ) |                                                //-- FF00 00FF -- first possible spot
                            ( (cycle_cntr_q[2:0] == 3'd4) & (&(data_beat[39:33])) & (&(~data_beat[31:17])) & (&(data_beat[15: 9])) ) |                                                //-- FF00 00FF -- second possible spot
                            ( (cycle_cntr_q[2:0] == 3'd4) & found_partial_sync1_q & (&(~header[1])) & (&( data_beat[63:57])) ) |                                                      //-- found 3F C000 last time and (00) FF this time
                            ( (cycle_cntr_q[2:0] == 3'd4) & found_partial_sync2_q & (&( header[1])) & (&(~data_beat[63:49])) & (&(data_beat[47:41])) ) |                              //-- found 3F last time and (11) 0000 FF this time

                            ( (cycle_cntr_q[2:0] == 3'd5) & (&(data_beat[57:51])) & (&(~data_beat[49:35])) & (&(data_beat[33:27])) ) |                                                //-- FF00 00FF -- first possible spot
                            ( (cycle_cntr_q[2:0] == 3'd5) & (&(data_beat[41:35])) & (&(~data_beat[33:19])) & (&(data_beat[17:11])) ) |                                                //-- FF00 00FF -- second possible spot
                            ( (cycle_cntr_q[2:0] == 3'd5) & found_partial_sync1_q & (&( header[1:0])) & (&( data_beat[63:59])) ) |                                                    //-- found FF 0000 last time and (11) FC this time
                            ( (cycle_cntr_q[2:0] == 3'd5) & found_partial_sync2_q & (&(~header[1:0])) & (&(~data_beat[63:51])) & (&(data_beat[49:43])) ) |                            //-- found FF last time and (00) 0003 FC this time

                            ( (cycle_cntr_q[2:0] == 3'd6) & (&(data_beat[59:53])) & (&(~data_beat[51:37])) & (&(data_beat[35:29])) ) |                                                //-- FF00 00FF -- first possible spot
                            ( (cycle_cntr_q[2:0] == 3'd6) & (&(data_beat[43:37])) & (&(~data_beat[35:21])) & (&(data_beat[19:13])) ) |                                                //-- FF00 00FF -- second possible spot
                            ( (cycle_cntr_q[2:0] == 3'd6) & found_partial_sync1_q & (&( header[1:0])) & (&( data_beat[63:61])) ) |                                                    //-- found 3FC 0003 last time and (11) F this time
                            ( (cycle_cntr_q[2:0] == 3'd6) & found_partial_sync2_q & (&(~header[1:0])) & (&(~data_beat[63:53])) & (&(data_beat[51:45])) ) |                            //-- found 3FC last time and (00) 000F F this time

                            ( (cycle_cntr_q[2:0] == 3'd7) & (&(data_beat[61:55]))   & (&(~data_beat[53:39])) & (&(data_beat[37:31])) ) |                                              //-- FF00 00FF -- first possible spot
                            ( (cycle_cntr_q[2:0] == 3'd7) & (&(data_beat[45:39]))   & (&(~data_beat[37:23])) & (&(data_beat[21:15])) ) |                                              //-- FF00 00FF -- second possible spot
                            ( (cycle_cntr_q[2:0] == 3'd7) & found_partial_sync1_q & (&( header[1:0])) & data_beat[63] ) |                                                             //-- found FF0 000F last time and (11) C this time
                            ( (cycle_cntr_q[2:0] == 3'd7) & found_partial_sync2_q & (&(~header[1:0])) & (&(~data_beat[63:55])) & (&(data_beat[53:47])) ));                            //-- found FF0 last time and (00) 003F C this time

assign found_pattern_a_dly1_din = found_pattern_a_int;
assign found_pattern_a_dly2_din = found_pattern_a_dly1_q;
assign found_pattern_a_dly3_din = found_pattern_a_dly2_q;

assign ab_slip = ((find_a | find_b) & ~found_pattern_a_int & ~found_pattern_a_dly1_q & ~found_pattern_a_dly2_q & ~found_pattern_a_dly3_q & ~found_pattern_b_internal & ~(|(post_slip_cnt_q[2:0])));      //-- not aligned to find what we're looking for for 3 cycles in a row and only during pat A -> need to slip and counter has counted down to zero after last slip.

//-- Note: if first pattern B found is inverted, invert the lane and slip to realign pattern A/standard pattern B
assign lane_inverted_din = (lane_inverted_q | (find_first_b & found_inv_pattern_b) & ~(|(post_slip_cnt_q[2:0]))) & ~rx_reset;      //-- first pattern B found is an inverted pattern B -> invert data from here on out, reset if re-training begins

assign lane_inverted = lane_inverted_q;
//---------------------------------------- end pattern A, B, and sync ----------------------------------------------

//---------Version 1 (with latches)
always @(posedge rx_clk_in) begin
  ln_valid_q              <= ln_valid_din;
  ln_data_q[63:0]         <= ln_data_din[63:0];
  ln_header_q[1:0]        <= ln_header_din[1:0];
  ln_slip_q               <= ln_slip_din;
  need_slip_d1_q          <= need_slip_d1_din;
  need_slip_d2_q          <= need_slip_d2_din;
  need_slip_d3_q          <= need_slip_d3_din;
  need_slip_d4_q          <= need_slip_d4_din;
  need_slip_d5_q          <= need_slip_d5_din;
  need_slip_d6_q          <= need_slip_d6_din;
  found_pattern_a_dly1_q  <= found_pattern_a_dly1_din;
  found_pattern_a_dly2_q  <= found_pattern_a_dly2_din;
  found_pattern_a_dly3_q  <= found_pattern_a_dly3_din;
  post_slip_cnt_q[2:0]    <= post_slip_cnt_din[2:0];
  cycle_cntr_q[2:0]               <= cycle_cntr_din[2:0];
  lane_inverted_q                 <= lane_inverted_din;
  found_partial_pattern_b1_q      <= found_partial_pattern_b1_din;        //-- majority of the pattern falls at the end of the first cycle
  found_partial_pattern_b2_q      <= found_partial_pattern_b2_din;        //-- majority of the patterns falls at beginning of second cycle
  found_partial_inv_pattern_b1_q  <= found_partial_inv_pattern_b1_din;
  found_partial_inv_pattern_b2_q  <= found_partial_inv_pattern_b2_din;
  found_partial_sync1_q           <= found_partial_sync1_din;
  found_partial_sync2_q           <= found_partial_sync2_din;
end
  
endmodule //-- ocx_dlx_rx_lane_66
