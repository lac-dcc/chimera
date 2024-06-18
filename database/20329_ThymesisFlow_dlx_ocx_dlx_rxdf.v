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
//-- TITLE:    ocx_dlx_rxdf.v
//-- FUNCTION: RX side of OpenCAPI DLx
//--           
//------------------------------------------------------------------------

//-- (* PIN_DEFAULT_POWER_DOMAIN="VDN", PIN_DEFAULT_GROUND_DOMAIN="GND" *)
module ocx_dlx_rxdf (

//-- phy interface
  ln0_rx_valid                   // < input 
 ,ln0_rx_data                    // < input
 ,ln0_rx_header                  // < input
 ,ln0_rx_slip                    // > output
 ,ln1_rx_valid                   // < input 
 ,ln1_rx_data                    // < input
 ,ln1_rx_header                  // < input
 ,ln1_rx_slip                    // > output
 ,ln2_rx_valid                   // < input 
 ,ln2_rx_data                    // < input
 ,ln2_rx_header                  // < input
 ,ln2_rx_slip                    // > output
 ,ln3_rx_valid                   // < input 
 ,ln3_rx_data                    // < input
 ,ln3_rx_header                  // < input
 ,ln3_rx_slip                    // > output
 ,ln4_rx_valid                   // < input 
 ,ln4_rx_data                    // < input
 ,ln4_rx_header                  // < input
 ,ln4_rx_slip                    // > output
 ,ln5_rx_valid                   // < input 
 ,ln5_rx_data                    // < input
 ,ln5_rx_header                  // < input
 ,ln5_rx_slip                    // > output
 ,ln6_rx_valid                   // < input 
 ,ln6_rx_data                    // < input
 ,ln6_rx_header                  // < input
 ,ln6_rx_slip                    // > output
 ,ln7_rx_valid                   // < input 
 ,ln7_rx_data                    // < input
 ,ln7_rx_header                  // < input
 ,ln7_rx_slip                    // > output

//-- tlx interface
 ,dlx_tlx_flit_valid             // > output
 ,dlx_tlx_flit                   // > output 
 ,dlx_tlx_flit_crc_err           // > output
 ,dlx_tlx_link_up                // > output
 ,dlx_config_info                // > output
//-- tx interface
 ,tx_rx_reset                    // < input     
 ,train_ts2                      // < input     
 ,train_ts67                     // < input     
 ,rx_tx_retrain                  // > output  
 ,rx_tx_crc_error                // > output  
 ,rx_tx_nack                     // > output
 ,rx_tx_tx_ack_rtn               // > output
 ,rx_tx_rx_ack_inc               // > output
 ,rx_tx_tx_ack_ptr_vld           // > output
 ,rx_tx_tx_ack_ptr               // > output
 ,ln0_rx_tx_last_byte_ts3        // > output  [7:0]
 ,ln1_rx_tx_last_byte_ts3        // > output  [7:0]
 ,ln2_rx_tx_last_byte_ts3        // > output  [7:0]
 ,ln3_rx_tx_last_byte_ts3        // > output  [7:0]
 ,cfg_transmit_order            // --  < input

 ,rx_tx_tx_lane_swap             // > output
 ,rx_tx_deskew_done              // > output

 ,tx_rx_training                 // < input
 ,tx_rx_phy_training             // < input
 ,tx_rx_disabled_rx_lanes           // < input
// ,tx_rx_pattern_b_timer          // < input
 
 ,rx_tx_pattern_a                // > output 
 ,rx_tx_pattern_b                // > output 
 ,rx_tx_lane_inverted            // > output 
 ,rx_tx_sync                     // > output 
 ,rx_tx_TS1                      // > output 
 ,rx_tx_TS2                      // > output 
 ,rx_tx_TS3                      // > output 
 ,rx_tx_block_lock               // > output
 ,rx_tx_linkup                   // > output
// ,rx_tx_train_failed             // > output 

 ,opt_gckn                       // < input
//--  ,gnd                            // <> inout
//--  ,vdn                            // <> inout
);

//-- phy interface
input             ln0_rx_valid;                 //-- each lane's interface to the phy
input  [63:0]     ln0_rx_data;
input  [1:0]      ln0_rx_header;
output            ln0_rx_slip;                  //-- tell phy gearbox to slip to align data blocks on this lane
output [7:0]      ln0_rx_tx_last_byte_ts3;
input             ln1_rx_valid;
input  [63:0]     ln1_rx_data;
input  [1:0]      ln1_rx_header;
output            ln1_rx_slip;
output [7:0]      ln1_rx_tx_last_byte_ts3;
input             ln2_rx_valid;
input  [63:0]     ln2_rx_data;
input  [1:0]      ln2_rx_header;
output            ln2_rx_slip;
output [7:0]      ln2_rx_tx_last_byte_ts3;
input             ln3_rx_valid;
input  [63:0]     ln3_rx_data;
input  [1:0]      ln3_rx_header;
output            ln3_rx_slip;
output [7:0]      ln3_rx_tx_last_byte_ts3;
input             ln4_rx_valid;
input  [63:0]     ln4_rx_data;
input  [1:0]      ln4_rx_header;
output            ln4_rx_slip;
input             ln5_rx_valid;
input  [63:0]     ln5_rx_data;
input  [1:0]      ln5_rx_header;
output            ln5_rx_slip;
input             ln6_rx_valid;
input  [63:0]     ln6_rx_data;
input  [1:0]      ln6_rx_header;
output            ln6_rx_slip;
input             ln7_rx_valid;
input  [63:0]     ln7_rx_data;
input  [1:0]      ln7_rx_header;
output            ln7_rx_slip;

//-- tlx interface
output            dlx_tlx_flit_valid;           //-- tell tl flit is valid
output [511:0]    dlx_tlx_flit;                 //-- give tl flit data
output            dlx_tlx_flit_crc_err;         //-- tell tl crc error (discard collected corrupted data flits)
output            dlx_tlx_link_up;              //-- tell tl link is done training and ready to go!
output [31:0]     dlx_config_info;
//-- tx interface
input             tx_rx_reset;                  //-- reset the link and begin re-training
input             train_ts2;                    //-- training set is in ts2
input             train_ts67;                   //-- training set is in state 6 or 7
output            rx_tx_retrain;                //-- tell tx to retrain
output            rx_tx_crc_error;              //-- tell tx crc error
output            rx_tx_nack;                   //-- tell tx nack (replay)
output [4:0]      rx_tx_tx_ack_rtn;             //-- give tx the acks the other side sent
output [3:0]      rx_tx_rx_ack_inc;             //-- tell tx how many good flits we've received (acks to send to the other side)
output            rx_tx_tx_ack_ptr_vld;         //-- tell tx replay ack ptr is valid
output [6:0]      rx_tx_tx_ack_ptr;             //-- pass the acknowledge sequence number to the tx (where tx should start replaying from)

input             tx_rx_training;               //-- tell lanes to train
input             tx_rx_phy_training;           //-- phy is trianing, ignore data

//output [15:0]     rx_tx_remote_info;
input  [7:0]      tx_rx_disabled_rx_lanes;         //-- if running in degraded mode (N/A for now)
//input             tx_rx_pattern_b_timer;
input             cfg_transmit_order;

output [7:0]      rx_tx_pattern_a;              //-- tell tx each lane is receiving pattern A's for at least 64 cycles
output [7:0]      rx_tx_pattern_b;              //-- tell tx each lane is receiving pattern B's for at least 64 cycles
output [7:0]      rx_tx_lane_inverted;          //-- tell tx each lane received a sync pattern just now
output [7:0]      rx_tx_sync;                   //-- tell tx each lane received a sync pattern just now
output [7:0]      rx_tx_TS1;                    //-- tell tx each lane recieved a TS1 just now
output [7:0]      rx_tx_TS2;                    //-- tell tx each lane recieved a TS2 just now
output [7:0]      rx_tx_TS3;                    //-- tell tx each lane recieved a TS3 just now

output [7:0]      rx_tx_block_lock;             //-- tell tx each lane is block aligned
output            rx_tx_deskew_done;            //-- 8 in a row aligned and matching deskew blocks detected across all lanes
output            rx_tx_tx_lane_swap;           //-- lanes don't match their numbers
output            rx_tx_linkup;                 //-- tell tx link is done training and ready to go!
//output [7:0]      rx_tx_train_failed;           //--

input             opt_gckn;                     //-- clock

//-- inout gnd;
//-- (* GROUND_PIN="1" *)
//-- wire gnd;

//-- inout vdn;
//-- (* POWER_PIN="1" *)
//-- wire vdn;

//----------------------------------- control signals -------------------------------------------
reg     training_q     ;
reg     phy_training_q ;
reg     reset_q        ;

wire    training_din;
wire    phy_training_din;
wire    reset_din;

//wire    training;
wire    any_training;
wire    phy_training;
wire    reset;
wire    deskew_enable;
wire [7:0]  block_lock_int;
wire    training_enable;
wire    x4_rx_good_evens;
wire    x4_rx_good_odds;

always @(posedge opt_gckn) begin
training_q              <= training_din;
phy_training_q          <= phy_training_din;
reset_q                 <= reset_din;
end

assign training_din             = tx_rx_training;       //-- Note: training enable and phy training are latched in the rx and passed to the lanes
assign phy_training_din         = tx_rx_phy_training;
assign reset_din                = tx_rx_reset;

assign any_training     = training_q | phy_training_q; 
assign training_enable  = training_q;                   //-- Note: the data/header/valid from phy are passed to lanes and latched in the lanes, so they line up with training enable and phy training
assign phy_training     = phy_training_q;
assign reset            = reset_q;
assign deskew_enable         = &(block_lock_int[7:0] | tx_rx_disabled_rx_lanes[7:0]);     //-- once block locked, start deskew
assign rx_tx_block_lock[7:0] =  block_lock_int[7:0];

//----------------------------------- end control inputs -------------------------------------------
//----------------------------------- port map main -------------------------------------------
//-- data from phy, passed through the lane macro
wire [63:0]     ln0_data;
wire [63:0]     ln1_data;
wire [63:0]     ln2_data;
wire [63:0]     ln3_data;
wire [63:0]     ln4_data;
wire [63:0]     ln5_data;
wire [63:0]     ln6_data;
wire [63:0]     ln7_data;
//-- from lanes
wire [7:0]      data_flit;
wire [7:0]      deskew_valid;
wire [7:0]      deskew_overflow;
//wire [7:0]      disabled_lanes;
//wire [7:0]      train_failed;
wire            deskew_all_valid_l0;
wire            deskew_all_valid_l1;
wire            deskew_all_valid_l2;
wire            deskew_all_valid_l3;
wire            deskew_all_valid_l4;
wire            deskew_all_valid_l5;
wire            deskew_all_valid_l6;
wire            deskew_all_valid_l7;
wire            deskew_reset;
//wire [7:0]      block_lock;

wire [63:0]     nghbr_data_0to1;
wire [63:0]     nghbr_data_1to0;
wire [63:0]     nghbr_data_2to3;
wire [63:0]     nghbr_data_3to2;
wire [63:0]     nghbr_data_4to5;
wire [63:0]     nghbr_data_5to4;
wire [63:0]     nghbr_data_6to7;
wire [63:0]     nghbr_data_7to6;

//--wire [7:0]      unused2;
//--wire [7:0]      unused3;
wire [7:0]      unused4;
wire [7:0]      unused5;
wire [7:0]      unused6;
wire [7:0]      unused7;
wire [7:0]      ctl_header;

//-- output
wire linkup;
wire tl_linkup;
assign rx_tx_linkup = linkup;
assign dlx_tlx_link_up = tl_linkup;

ocx_dlx_rx_main main (
    .reset              ( reset )
   ,.training_enable    ( any_training )
   ,.train_ts2          ( train_ts2 )
   ,.train_ts67         ( train_ts67 )
   ,.rx_tx_retrain      ( rx_tx_retrain )

   ,.ln0_data           ( ln0_data )
   ,.ln1_data           ( ln1_data )
   ,.ln2_data           ( ln2_data )
   ,.ln3_data           ( ln3_data )
   ,.ln4_data           ( ln4_data )
   ,.ln5_data           ( ln5_data )
   ,.ln6_data           ( ln6_data )
   ,.ln7_data           ( ln7_data )
   ,.ctl_header         ( ctl_header[7:0] )
   ,.data_flit          ( data_flit[7:0] )
   ,.disabled_lanes     ( tx_rx_disabled_rx_lanes )
   ,.cfg_transmit_order ( cfg_transmit_order )

   ,.deskew_valid       ( deskew_valid[7:0] )
   ,.deskew_overflow    ( deskew_overflow[7:0] )
   ,.deskew_all_valid_l0   ( deskew_all_valid_l0 )
   ,.deskew_all_valid_l1   ( deskew_all_valid_l1 )
   ,.deskew_all_valid_l2   ( deskew_all_valid_l2 )
   ,.deskew_all_valid_l3   ( deskew_all_valid_l3 )
   ,.deskew_all_valid_l4   ( deskew_all_valid_l4 )
   ,.deskew_all_valid_l5   ( deskew_all_valid_l5 )
   ,.deskew_all_valid_l6   ( deskew_all_valid_l6 )
   ,.deskew_all_valid_l7   ( deskew_all_valid_l7 )
   ,.deskew_reset       ( deskew_reset )

   ,.flit_out           ( dlx_tlx_flit[511:0] )
   ,.valid_out          ( dlx_tlx_flit_valid )
   ,.tlx_crc_error      ( dlx_tlx_flit_crc_err )
   ,.tx_crc_error       ( rx_tx_crc_error )
   ,.rx_TS1             ( rx_tx_TS1[7:0])
   ,.x4_rx_good_evens   ( x4_rx_good_evens)
   ,.x4_rx_good_odds    ( x4_rx_good_odds)
 
   ,.nack_out           ( rx_tx_nack )
   ,.ack_ptr_vld_out    ( rx_tx_tx_ack_ptr_vld )
   ,.ack_ptr_out        ( rx_tx_tx_ack_ptr[6:0] )
   ,.ack_rtn_out        ( rx_tx_tx_ack_rtn )
   ,.ack_inc_out        ( rx_tx_rx_ack_inc )

   ,.deskew_done_out    ( rx_tx_deskew_done )
   ,.lane_swap_out      ( rx_tx_tx_lane_swap )
   ,.linkup_out         ( linkup )
   ,.tl_linkup_out      ( tl_linkup )
   ,.dlx_config_info    ( dlx_config_info )
   ,.rx_clk_in          ( opt_gckn )

//--    ,.gnd                ( gnd ) // <> inout
//--    ,.vdn                ( vdn ) // <> inout

);
//----------------------------------- end port map main -------------------------------------------
//----------------------------------- port map lanes -------------------------------------------
wire [7:0] found_a;
wire [7:0] found_b;
wire [7:0] found_sync;
wire [7:0] find_a;
wire [7:0] find_b;
wire [7:0] find_first_b;
wire [7:0] valid_ln;
wire [7:0] slip_ln;
//-------------------------------------------
wire [63:0] data_ln0;
wire [1:0] header_ln0;
ocx_dlx_rx_lane lane0 (
    //-- lane_64/66 interface
    .valid_in           ( valid_ln[0] )
   ,.data_in            ( data_ln0[63:0] )
   ,.header_in          ( header_ln0[1:0] )
   ,.slip_out           ( slip_ln[0] )

   ,.found_pattern_a    ( found_a[0] )
   ,.found_pattern_b    ( found_b[0] )
   ,.found_sync_pattern ( found_sync[0] )
   ,.ctl_header         ( ctl_header[0] )
   ,.find_a             ( find_a[0] )
   ,.find_b             ( find_b[0] )
   ,.find_first_b       ( find_first_b[0] )
   ,.nghbr_data_in      ( nghbr_data_1to0[63:0] )
   ,.nghbr_data_out     ( nghbr_data_0to1[63:0] )

    //-- rx interface
   ,.rx_clk_in           ( opt_gckn )
   ,.rx_reset            ( reset )
   ,.rx_data_out         ( ln0_data[63:0] )
   ,.rx_tx_last_byte_ts3 ( ln0_rx_tx_last_byte_ts3[7:0] )
   ,.data_flit           ( data_flit[0] )

   ,.training_enable    ( training_enable )
   ,.phy_training       ( phy_training )
   ,.deskew_enable      ( deskew_enable )

   ,.deskew_all_valid   ( deskew_all_valid_l0 )
   ,.deskew_reset       ( deskew_reset )
   ,.deskew_valid       ( deskew_valid[0] )
   ,.deskew_overflow    ( deskew_overflow[0] )
   ,.x4_hold_data       ( x4_rx_good_odds)
 
   //-- tx interface
   ,.pattern_a          ( rx_tx_pattern_a[0] )
   ,.pattern_b          ( rx_tx_pattern_b[0] )
   ,.pattern_sync       ( rx_tx_sync[0] )
   ,.pattern_TS1        ( rx_tx_TS1[0] )
   ,.pattern_TS2        ( rx_tx_TS2[0] )
   ,.pattern_TS3        ( rx_tx_TS3[0] )
   ,.block_lock         ( block_lock_int[0] )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
ocx_dlx_rx_lane_66 phy0 (
    //-- lane common interface
    .slip_in            ( slip_ln[0] )
   ,.ln_data_out        ( data_ln0[63:0] )
   ,.ln_header_out      ( header_ln0[1:0] )
   ,.ln_valid_out       ( valid_ln[0] )

   ,.found_pattern_a    ( found_a[0] )
   ,.found_pattern_b    ( found_b[0] )
   ,.found_sync_pattern ( found_sync[0] )
   ,.find_a             ( find_a[0] )
   ,.find_b             ( find_b[0] )
   ,.find_first_b       ( find_first_b[0] )
   ,.lane_inverted      ( rx_tx_lane_inverted[0] )
 
    //-- rx (phy) interface
   ,.ln_valid_in        ( ln0_rx_valid )
   ,.ln_data_in         ( ln0_rx_data[63:0] )
   ,.ln_header_in       ( ln0_rx_header[1:0] )
   ,.ln_slip_out        ( ln0_rx_slip )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
//-------------------------------------------
wire [63:0] data_ln1;
wire [1:0] header_ln1;
ocx_dlx_rx_lane lane1 (
    //-- lane_64/66 interface
    .valid_in           ( valid_ln[1] )
   ,.data_in            ( data_ln1[63:0] )
   ,.header_in          ( header_ln1[1:0] )
   ,.slip_out           ( slip_ln[1] )

   ,.found_pattern_a    ( found_a[1] )
   ,.found_pattern_b    ( found_b[1] )
   ,.found_sync_pattern ( found_sync[1] )
   ,.ctl_header         ( ctl_header[1] )
   ,.find_a             ( find_a[1] )
   ,.find_b             ( find_b[1] )
   ,.find_first_b       ( find_first_b[1] )
   ,.nghbr_data_in      ( nghbr_data_0to1[63:0] )
   ,.nghbr_data_out     ( nghbr_data_1to0[63:0] )

    //-- rx interface
   ,.rx_clk_in           ( opt_gckn )
   ,.rx_reset            ( reset )
   ,.rx_data_out         ( ln1_data[63:0] )
   ,.rx_tx_last_byte_ts3 ( ln1_rx_tx_last_byte_ts3[7:0] )
   ,.data_flit           ( data_flit[1] )

   ,.training_enable    ( training_enable )
   ,.phy_training       ( phy_training )
   ,.deskew_enable      ( deskew_enable )

   ,.deskew_all_valid   ( deskew_all_valid_l1 )
   ,.deskew_reset       ( deskew_reset )
   ,.deskew_valid       ( deskew_valid[1] )
   ,.deskew_overflow    ( deskew_overflow[1] )
   ,.x4_hold_data       ( x4_rx_good_evens)

   //-- tx interface
   ,.pattern_a          ( rx_tx_pattern_a[1] )
   ,.pattern_b          ( rx_tx_pattern_b[1] )
   ,.pattern_sync       ( rx_tx_sync[1] )
   ,.pattern_TS1        ( rx_tx_TS1[1] )
   ,.pattern_TS2        ( rx_tx_TS2[1] )
   ,.pattern_TS3        ( rx_tx_TS3[1] )
   ,.block_lock         ( block_lock_int[1] )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
ocx_dlx_rx_lane_66 phy1 (
    //-- lane common interface
    .slip_in            ( slip_ln[1] )
   ,.ln_data_out        ( data_ln1[63:0] )
   ,.ln_header_out      ( header_ln1[1:0] )
   ,.ln_valid_out       ( valid_ln[1] )

   ,.found_pattern_a    ( found_a[1] )
   ,.found_pattern_b    ( found_b[1] )
   ,.found_sync_pattern ( found_sync[1] )
   ,.find_a             ( find_a[1] )
   ,.find_b             ( find_b[1] )
   ,.find_first_b       ( find_first_b[1] )
   ,.lane_inverted      ( rx_tx_lane_inverted[1] )

    //-- rx (phy) interface
   ,.ln_valid_in        ( ln1_rx_valid )
   ,.ln_data_in         ( ln1_rx_data[63:0] )
   ,.ln_header_in       ( ln1_rx_header[1:0] )
   ,.ln_slip_out        ( ln1_rx_slip )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);//-------------------------------------------
wire [63:0] data_ln2;
wire [1:0] header_ln2;
ocx_dlx_rx_lane lane2 (
    //-- lane_64/66 interface
    .valid_in           ( valid_ln[2] )
   ,.data_in            ( data_ln2[63:0] )
   ,.header_in          ( header_ln2[1:0] )
   ,.slip_out           ( slip_ln[2] )

   ,.found_pattern_a    ( found_a[2] )
   ,.found_pattern_b    ( found_b[2] )
   ,.found_sync_pattern ( found_sync[2] )
   ,.ctl_header         ( ctl_header[2] )
   ,.find_a             ( find_a[2] )
   ,.find_b             ( find_b[2] )
   ,.find_first_b       ( find_first_b[2] )
   ,.nghbr_data_in      ( nghbr_data_3to2[63:0] )
   ,.nghbr_data_out     ( nghbr_data_2to3[63:0] )

    //-- rx interface
   ,.rx_clk_in           ( opt_gckn )
   ,.rx_reset            ( reset )
   ,.rx_data_out         ( ln2_data[63:0] )
   ,.rx_tx_last_byte_ts3 ( ln2_rx_tx_last_byte_ts3[7:0] )
   ,.data_flit           ( data_flit[2] )

   ,.training_enable    ( training_enable )
   ,.phy_training       ( phy_training )
   ,.deskew_enable      ( deskew_enable )

   ,.deskew_all_valid   ( deskew_all_valid_l2 )
   ,.deskew_reset       ( deskew_reset )
   ,.deskew_valid       ( deskew_valid[2] )
   ,.deskew_overflow    ( deskew_overflow[2] )
   ,.x4_hold_data       ( x4_rx_good_odds)

   //-- tx interface
   ,.pattern_a          ( rx_tx_pattern_a[2] )
   ,.pattern_b          ( rx_tx_pattern_b[2] )
   ,.pattern_sync       ( rx_tx_sync[2] )
   ,.pattern_TS1        ( rx_tx_TS1[2] )
   ,.pattern_TS2        ( rx_tx_TS2[2] )
   ,.pattern_TS3        ( rx_tx_TS3[2] )
   ,.block_lock         ( block_lock_int[2] )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
ocx_dlx_rx_lane_66 phy2 (
    //-- lane common interface
    .slip_in            ( slip_ln[2] )
   ,.ln_data_out        ( data_ln2[63:0] )
   ,.ln_header_out      ( header_ln2[1:0] )
   ,.ln_valid_out       ( valid_ln[2] )

   ,.found_pattern_a    ( found_a[2] )
   ,.found_pattern_b    ( found_b[2] )
   ,.found_sync_pattern ( found_sync[2] )
   ,.find_a             ( find_a[2] )
   ,.find_b             ( find_b[2] )
   ,.find_first_b       ( find_first_b[2] )
   ,.lane_inverted      ( rx_tx_lane_inverted[2] )

    //-- rx (phy) interface
   ,.ln_valid_in        ( ln2_rx_valid )
   ,.ln_data_in         ( ln2_rx_data[63:0] )
   ,.ln_header_in       ( ln2_rx_header[1:0] )
   ,.ln_slip_out        ( ln2_rx_slip )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);//-------------------------------------------
wire [63:0] data_ln3;
wire [1:0] header_ln3;
ocx_dlx_rx_lane lane3 (
    //-- lane_64/66 interface
    .valid_in           ( valid_ln[3] )
   ,.data_in            ( data_ln3[63:0] )
   ,.header_in          ( header_ln3[1:0] )
   ,.slip_out           ( slip_ln[3] )

   ,.found_pattern_a    ( found_a[3] )
   ,.found_pattern_b    ( found_b[3] )
   ,.found_sync_pattern ( found_sync[3] )
   ,.ctl_header         ( ctl_header[3] )
   ,.find_a             ( find_a[3] )
   ,.find_b             ( find_b[3] )
   ,.find_first_b       ( find_first_b[3] )
   ,.nghbr_data_in      ( nghbr_data_2to3[63:0] )
   ,.nghbr_data_out     ( nghbr_data_3to2[63:0] )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )
   ,.rx_data_out        ( ln3_data[63:0] )
   ,.rx_tx_last_byte_ts3 ( ln3_rx_tx_last_byte_ts3[7:0]  )
   ,.data_flit          ( data_flit[3] )

   ,.training_enable    ( training_enable )
   ,.phy_training       ( phy_training )
   ,.deskew_enable      ( deskew_enable )

   ,.deskew_all_valid   ( deskew_all_valid_l3 )
   ,.deskew_reset       ( deskew_reset )
   ,.deskew_valid       ( deskew_valid[3] )
   ,.deskew_overflow    ( deskew_overflow[3] )
   ,.x4_hold_data       ( x4_rx_good_evens)

   //-- tx interface
   ,.pattern_a          ( rx_tx_pattern_a[3] )
   ,.pattern_b          ( rx_tx_pattern_b[3] )
   ,.pattern_sync       ( rx_tx_sync[3] )
   ,.pattern_TS1        ( rx_tx_TS1[3] )
   ,.pattern_TS2        ( rx_tx_TS2[3] )
   ,.pattern_TS3        ( rx_tx_TS3[3] )
   ,.block_lock         ( block_lock_int[3] )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
ocx_dlx_rx_lane_66 phy3 (
    //-- lane common interface
    .slip_in            ( slip_ln[3] )
   ,.ln_data_out        ( data_ln3[63:0] )
   ,.ln_header_out      ( header_ln3[1:0] )
   ,.ln_valid_out       ( valid_ln[3] )

   ,.found_pattern_a    ( found_a[3] )
   ,.found_pattern_b    ( found_b[3] )
   ,.found_sync_pattern ( found_sync[3] )
   ,.find_a             ( find_a[3] )
   ,.find_b             ( find_b[3] )
   ,.find_first_b       ( find_first_b[3] )
   ,.lane_inverted      ( rx_tx_lane_inverted[3] )

    //-- rx (phy) interface
   ,.ln_valid_in        ( ln3_rx_valid )
   ,.ln_data_in         ( ln3_rx_data[63:0] )
   ,.ln_header_in       ( ln3_rx_header[1:0] )
   ,.ln_slip_out        ( ln3_rx_slip )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);//-------------------------------------------
wire [63:0] data_ln4;
wire [1:0] header_ln4;
ocx_dlx_rx_lane lane4 (
    //-- lane_64/66 interface
    .valid_in           ( valid_ln[4] )
   ,.data_in            ( data_ln4[63:0] )
   ,.header_in          ( header_ln4[1:0] )
   ,.slip_out           ( slip_ln[4] )

   ,.found_pattern_a    ( found_a[4] )
   ,.found_pattern_b    ( found_b[4] )
   ,.found_sync_pattern ( found_sync[4] )
   ,.ctl_header         ( ctl_header[4] )
   ,.find_a             ( find_a[4] )
   ,.find_b             ( find_b[4] )
   ,.find_first_b       ( find_first_b[4] )
   ,.nghbr_data_in      ( nghbr_data_5to4[63:0] )
   ,.nghbr_data_out     ( nghbr_data_4to5[63:0] )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )
   ,.rx_data_out        ( ln4_data[63:0] )
   ,.rx_tx_last_byte_ts3 ( unused4[7:0] )
   ,.data_flit          ( data_flit[4] )

   ,.training_enable    ( training_enable )
   ,.phy_training       ( phy_training )
   ,.deskew_enable      ( deskew_enable )

   ,.deskew_all_valid   ( deskew_all_valid_l4 )
   ,.deskew_reset       ( deskew_reset )
   ,.deskew_valid       ( deskew_valid[4] )
   ,.deskew_overflow    ( deskew_overflow[4] )
   ,.x4_hold_data       ( x4_rx_good_odds)

   //-- tx interface
   ,.pattern_a          ( rx_tx_pattern_a[4] )
   ,.pattern_b          ( rx_tx_pattern_b[4] )
   ,.pattern_sync       ( rx_tx_sync[4] )
   ,.pattern_TS1        ( rx_tx_TS1[4] )
   ,.pattern_TS2        ( rx_tx_TS2[4] )
   ,.pattern_TS3        ( rx_tx_TS3[4] )
   ,.block_lock         ( block_lock_int[4] )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
ocx_dlx_rx_lane_66 phy4 (
    //-- lane common interface
    .slip_in            ( slip_ln[4] )
   ,.ln_data_out        ( data_ln4[63:0] )
   ,.ln_header_out      ( header_ln4[1:0] )
   ,.ln_valid_out       ( valid_ln[4] )

   ,.found_pattern_a    ( found_a[4] )
   ,.found_pattern_b    ( found_b[4] )
   ,.found_sync_pattern ( found_sync[4] )
   ,.find_a             ( find_a[4] )
   ,.find_b             ( find_b[4] )
   ,.find_first_b       ( find_first_b[4] )
   ,.lane_inverted      ( rx_tx_lane_inverted[4] )

    //-- rx (phy) interface
   ,.ln_valid_in        ( ln4_rx_valid )
   ,.ln_data_in         ( ln4_rx_data[63:0] )
   ,.ln_header_in       ( ln4_rx_header[1:0] )
   ,.ln_slip_out        ( ln4_rx_slip )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);//-------------------------------------------
wire [63:0] data_ln5;
wire [1:0] header_ln5;
ocx_dlx_rx_lane lane5 (
    //-- lane_64/66 interface
    .valid_in           ( valid_ln[5] )
   ,.data_in            ( data_ln5[63:0] )
   ,.header_in          ( header_ln5[1:0] )
   ,.slip_out           ( slip_ln[5] )

   ,.found_pattern_a    ( found_a[5] )
   ,.found_pattern_b    ( found_b[5] )
   ,.found_sync_pattern ( found_sync[5] )
   ,.ctl_header         ( ctl_header[5] )
   ,.find_a             ( find_a[5] )
   ,.find_b             ( find_b[5] )
   ,.find_first_b       ( find_first_b[5] )
   ,.nghbr_data_in      ( nghbr_data_4to5[63:0] )
   ,.nghbr_data_out     ( nghbr_data_5to4[63:0] )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )
   ,.rx_data_out        ( ln5_data[63:0] )
   ,.rx_tx_last_byte_ts3 ( unused5[7:0]  )
   ,.data_flit          ( data_flit[5] )

   ,.training_enable    ( training_enable )
   ,.phy_training       ( phy_training )
   ,.deskew_enable      ( deskew_enable )

   ,.deskew_all_valid   ( deskew_all_valid_l5 )
   ,.deskew_reset       ( deskew_reset )
   ,.deskew_valid       ( deskew_valid[5] )
   ,.deskew_overflow    ( deskew_overflow[5] )
   ,.x4_hold_data       ( x4_rx_good_evens)

   //-- tx interface
   ,.pattern_a          ( rx_tx_pattern_a[5] )
   ,.pattern_b          ( rx_tx_pattern_b[5] )
   ,.pattern_sync       ( rx_tx_sync[5] )
   ,.pattern_TS1        ( rx_tx_TS1[5] )
   ,.pattern_TS2        ( rx_tx_TS2[5] )
   ,.pattern_TS3        ( rx_tx_TS3[5] )
   ,.block_lock         ( block_lock_int[5] )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
ocx_dlx_rx_lane_66 phy5 (
    //-- lane common interface
    .slip_in            ( slip_ln[5] )
   ,.ln_data_out        ( data_ln5[63:0] )
   ,.ln_header_out      ( header_ln5[1:0] )
   ,.ln_valid_out       ( valid_ln[5] )

   ,.found_pattern_a    ( found_a[5] )
   ,.found_pattern_b    ( found_b[5] )
   ,.found_sync_pattern ( found_sync[5] )
   ,.find_a             ( find_a[5] )
   ,.find_b             ( find_b[5] )
   ,.find_first_b       ( find_first_b[5] )
   ,.lane_inverted      ( rx_tx_lane_inverted[5] )

    //-- rx (phy) interface
   ,.ln_valid_in        ( ln5_rx_valid )
   ,.ln_data_in         ( ln5_rx_data[63:0] )
   ,.ln_header_in       ( ln5_rx_header[1:0] )
   ,.ln_slip_out        ( ln5_rx_slip )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);//-------------------------------------------
wire [63:0] data_ln6;
wire [1:0] header_ln6;
ocx_dlx_rx_lane lane6 (
    //-- lane_64/66 interface
    .valid_in           ( valid_ln[6] )
   ,.data_in            ( data_ln6[63:0] )
   ,.header_in          ( header_ln6[1:0] )
   ,.slip_out           ( slip_ln[6] )

   ,.found_pattern_a    ( found_a[6] )
   ,.found_pattern_b    ( found_b[6] )
   ,.found_sync_pattern ( found_sync[6] )
   ,.ctl_header         ( ctl_header[6] )
   ,.find_a             ( find_a[6] )
   ,.find_b             ( find_b[6] )
   ,.find_first_b       ( find_first_b[6] )
   ,.nghbr_data_in      ( nghbr_data_7to6[63:0] )
   ,.nghbr_data_out     ( nghbr_data_6to7[63:0] )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )
   ,.rx_data_out        ( ln6_data[63:0] )
   ,.rx_tx_last_byte_ts3 ( unused6[7:0] )
   ,.data_flit          ( data_flit[6] )

   ,.training_enable    ( training_enable )
   ,.phy_training       ( phy_training )
   ,.deskew_enable      ( deskew_enable )

   ,.deskew_all_valid   ( deskew_all_valid_l6 )
   ,.deskew_reset       ( deskew_reset )
   ,.deskew_valid       ( deskew_valid[6] )
   ,.deskew_overflow    ( deskew_overflow[6] )
   ,.x4_hold_data       ( x4_rx_good_odds)

   //-- tx interface
   ,.pattern_a          ( rx_tx_pattern_a[6] )
   ,.pattern_b          ( rx_tx_pattern_b[6] )
   ,.pattern_sync       ( rx_tx_sync[6] )
   ,.pattern_TS1        ( rx_tx_TS1[6] )
   ,.pattern_TS2        ( rx_tx_TS2[6] )
   ,.pattern_TS3        ( rx_tx_TS3[6] )
   ,.block_lock         ( block_lock_int[6] )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
ocx_dlx_rx_lane_66 phy6 (
    //-- lane common interface
    .slip_in            ( slip_ln[6] )
   ,.ln_data_out        ( data_ln6[63:0] )
   ,.ln_header_out      ( header_ln6[1:0] )
   ,.ln_valid_out       ( valid_ln[6] )

   ,.found_pattern_a    ( found_a[6] )
   ,.found_pattern_b    ( found_b[6] )
   ,.found_sync_pattern ( found_sync[6] )
   ,.find_a             ( find_a[6] )
   ,.find_b             ( find_b[6] )
   ,.find_first_b       ( find_first_b[6] )
   ,.lane_inverted      ( rx_tx_lane_inverted[6] )

    //-- rx (phy) interface
   ,.ln_valid_in        ( ln6_rx_valid )
   ,.ln_data_in         ( ln6_rx_data[63:0] )
   ,.ln_header_in       ( ln6_rx_header[1:0] )
   ,.ln_slip_out        ( ln6_rx_slip )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);//-------------------------------------------
wire [63:0] data_ln7;
wire [1:0] header_ln7;
ocx_dlx_rx_lane lane7 (
    //-- lane_64/66 interface
    .valid_in           ( valid_ln[7] )
   ,.data_in            ( data_ln7[63:0] )
   ,.header_in          ( header_ln7[1:0] )
   ,.slip_out           ( slip_ln[7] )

   ,.found_pattern_a    ( found_a[7] )
   ,.found_pattern_b    ( found_b[7] )
   ,.found_sync_pattern ( found_sync[7] )
   ,.ctl_header         ( ctl_header[7] )
   ,.find_a             ( find_a[7] )
   ,.find_b             ( find_b[7] )
   ,.find_first_b       ( find_first_b[7] )
   ,.nghbr_data_in      ( nghbr_data_6to7[63:0] )
   ,.nghbr_data_out     ( nghbr_data_7to6[63:0] )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )
   ,.rx_data_out        ( ln7_data[63:0] )
   ,.rx_tx_last_byte_ts3 ( unused7[7:0]  )
   ,.data_flit          ( data_flit[7] )

   ,.training_enable    ( training_enable )
   ,.phy_training       ( phy_training )
   ,.deskew_enable      ( deskew_enable )

   ,.deskew_all_valid   ( deskew_all_valid_l7 )
   ,.deskew_reset       ( deskew_reset )
   ,.deskew_valid       ( deskew_valid[7] )
   ,.deskew_overflow    ( deskew_overflow[7] )
   ,.x4_hold_data       ( x4_rx_good_evens)

   //-- tx interface
   ,.pattern_a          ( rx_tx_pattern_a[7] )
   ,.pattern_b          ( rx_tx_pattern_b[7] )
   ,.pattern_sync       ( rx_tx_sync[7] )
   ,.pattern_TS1        ( rx_tx_TS1[7] )
   ,.pattern_TS2        ( rx_tx_TS2[7] )
   ,.pattern_TS3        ( rx_tx_TS3[7] )
   ,.block_lock         ( block_lock_int[7] )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);
ocx_dlx_rx_lane_66 phy7 (
    //-- lane common interface
    .slip_in            ( slip_ln[7] )
   ,.ln_data_out        ( data_ln7[63:0] )
   ,.ln_header_out      ( header_ln7[1:0] )
   ,.ln_valid_out       ( valid_ln[7] )

   ,.found_pattern_a    ( found_a[7] )
   ,.found_pattern_b    ( found_b[7] )
   ,.found_sync_pattern ( found_sync[7] )
   ,.find_a             ( find_a[7] )
   ,.find_b             ( find_b[7] )
   ,.find_first_b       ( find_first_b[7] )
   ,.lane_inverted      ( rx_tx_lane_inverted[7] )

    //-- rx (phy) interface
   ,.ln_valid_in        ( ln7_rx_valid )
   ,.ln_data_in         ( ln7_rx_data[63:0] )
   ,.ln_header_in       ( ln7_rx_header[1:0] )
   ,.ln_slip_out        ( ln7_rx_slip )

    //-- rx interface
   ,.rx_clk_in          ( opt_gckn )
   ,.rx_reset           ( reset )

//--    ,.gnd                ( gnd )
//--    ,.vdn                ( vdn )
);

//----------------------------------- end port map lanes -------------------------------------------

endmodule //-- ocx_dlx_rxdf
