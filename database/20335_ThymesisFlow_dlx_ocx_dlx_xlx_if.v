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
//-- TITLE:    ocx_dlx_xlx_if.v
//-- FUNCTION: Shim for reset logic between Xilinx GTY Transceivers
//--           and DLx logic
//--
//------------------------------------------------------------------------

module ocx_dlx_xlx_if(
// Clocks 
   clk_156_25MHz                // --  < input
  ,opt_gckn                     // --  < input
  
// Xilinx PHY Signals 
  ,ocde                         // --  > input
  ,hb_gtwiz_reset_all_in        // --  > input
  ,gtwiz_reset_all_out          // --  < output
  ,gtwiz_reset_rx_datapath_out  // --  < output
  ,gtwiz_reset_tx_done_in       // --  < input
  ,gtwiz_reset_rx_done_in       // --  < input
  ,gtwiz_buffbypass_tx_done_in  // --  < input
  ,gtwiz_buffbypass_rx_done_in  // --  < input
  ,gtwiz_userclk_tx_active_in   // --  < input
  ,gtwiz_userclk_rx_active_in   // --  < input
                        
// DLx Signals                        
  ,dlx_reset                    // --  < output
  ,io_pb_o0_rx_init_done        // --  < output
  ,pb_io_o0_rx_run_lane         // --  < input
  
  ,send_first                   // --  < input
  
  ,ln0_rx_valid_in              // --  < input
  ,ln1_rx_valid_in              // --  < input
  ,ln2_rx_valid_in              // --  < input
  ,ln3_rx_valid_in              // --  < input
  ,ln4_rx_valid_in              // --  < input
  ,ln5_rx_valid_in              // --  < input
  ,ln6_rx_valid_in              // --  < input
  ,ln7_rx_valid_in              // --  < input
  ,ln0_rx_valid_out             // --  > ouput
  ,ln1_rx_valid_out             // --  > ouput
  ,ln2_rx_valid_out             // --  > ouput
  ,ln3_rx_valid_out             // --  > ouput
  ,ln4_rx_valid_out             // --  > ouput
  ,ln5_rx_valid_out             // --  > ouput
  ,ln6_rx_valid_out             // --  > ouput
  ,ln7_rx_valid_out             // --  > ouput
);
input        clk_156_25MHz; // 156.25 MHz Clock
input        opt_gckn;      // 402    MHz clock, this clock is derived from the 156.25 MHz clock and runs on the Rx Clock domain

input        ocde;
input        hb_gtwiz_reset_all_in;
output       gtwiz_reset_all_out;
output       gtwiz_reset_rx_datapath_out;
input        gtwiz_reset_tx_done_in;
input        gtwiz_reset_rx_done_in;
input        gtwiz_buffbypass_tx_done_in;
input        gtwiz_buffbypass_rx_done_in;
input        gtwiz_userclk_tx_active_in;
input        gtwiz_userclk_rx_active_in;

output       dlx_reset;
output [7:0] io_pb_o0_rx_init_done;
input  [7:0] pb_io_o0_rx_run_lane;

input        send_first; // Signal used to indicate if the DLx should wait to transmit data before or after it starts receiving data.

input        ln0_rx_valid_in;
input        ln1_rx_valid_in;
input        ln2_rx_valid_in;
input        ln3_rx_valid_in;
input        ln4_rx_valid_in;
input        ln5_rx_valid_in;
input        ln6_rx_valid_in;
input        ln7_rx_valid_in;
output       ln0_rx_valid_out;
output       ln1_rx_valid_out;
output       ln2_rx_valid_out;
output       ln3_rx_valid_out;
output       ln4_rx_valid_out;
output       ln5_rx_valid_out;
output       ln6_rx_valid_out;
output       ln7_rx_valid_out;

//--************************************************************
//--Retrain Xilinx PHY for faster data rate
//--************************************************************
//--   Note:  After the sync pattern is detected, the Xilinx PHY receiver needs to be reset in order to center the eye
//--          at the faster data rate.  In order to do this, gtwiz_reset_rx_datapath_out needs to be asserted for a 
//--          minimum of one clock cycle of the clock used to source the design. For this design, 156.25 MHz Clock


parameter [2:0] find_sync        = 3'b000; //-- State that makes sure all the lanes have received the sync patter before resetting
                                           //-- the Xilinx transceiver and retraining the eye
parameter [2:0] hold_pulse       = 3'b001; //-- Holds the Xilinx transceiver's receiver in reset for a certain duration
                                           //-- Note: Minimum duration has to be as long as the clock used to source the PLLs
parameter [2:0] pulse_done       = 3'b010; //-- Transitions the Xilinx transceiver's receiver reset signal to low. 
reg       [2:0] pulse_count_q    ;
wire      [2:0] pulse_count_din; 
reg       [2:0] xtsm_q           ;
reg       [2:0] xtsm_din         ;

assign gtwiz_reset_rx_datapath_out = (xtsm_q == hold_pulse) ? 1'b1 : 1'b0;                                    

assign pulse_count_din[2:0]        = (xtsm_q == find_sync)  ? 3'b000              :
                                     (xtsm_q == hold_pulse) ? (pulse_count_q[2:0] + 3'b001) :
                                                              (pulse_count_q[2:0]);
 

//-- Reset Xilinx Transceiver's receiver state machine after sync pattern is detected and need to recenter eye at faster data rate
always @ (*)
begin
      case (xtsm_q[2:0])
        find_sync  : xtsm_din[2:0]   = (&pb_io_o0_rx_run_lane)   ? hold_pulse : 
                                                                   find_sync;   //-- Sync pattern detected, reset transceiver's receiver logic
        hold_pulse : xtsm_din[2:0]   = (pulse_count_q == 3'b111) ? pulse_done : 
                                                                   hold_pulse;  //-- after pulse is held for 7 clock cycles, transition low.                                              
        pulse_done : xtsm_din[2:0]   = (~gtwiz_reset_tx_done_in & ~gtwiz_buffbypass_tx_done_in)   ? find_sync  :
                                                                                                    pulse_done;  //-- Transceiver was reset --> DLx needs to retrain        
        default:     xtsm_din[2:0]   = find_sync;
      endcase 
end
      

 assign io_pb_o0_rx_init_done = (xtsm_q == pulse_done) ? {8{gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in & gtwiz_userclk_rx_active_in}} :
                                                          8'b0;

always @ (posedge opt_gckn) begin
  pulse_count_q <= pulse_count_din;
  xtsm_q        <= xtsm_din;
end



//--************************************************************
//--Determine when to first start sending pattern 'A' 
//--************************************************************
//--   Note: In the 2 DLx/Transceiver design, one DLx should start transmitting pattern 'A' first while the other one waits
//--         to receive it before it starts transmitting the same pattern 'A'.
//--
//--         send_first = 1'b0 : wait until the Xilinx receiver is initialized (receiving data) before transmitting pattern 'A'
//--         send_first = 1'b1 : start transmitting pattern 'A' as soon as the Xilinx transmitter is initialized

reg   rec_first_xtsm_q   ;
reg   rec_first_xtsm_din ;


assign dlx_reset = (send_first)                ? ~(gtwiz_reset_tx_done_in & gtwiz_buffbypass_tx_done_in) :
                   (rec_first_xtsm_q == 1'b0)  ? ~(gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) :
                                                1'b0;

always @ (*)
begin
      case (rec_first_xtsm_q)
        1'b0 :   rec_first_xtsm_din = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in)     ? 1'b1 : 1'b0;
        1'b1 :   rec_first_xtsm_din = (~gtwiz_reset_tx_done_in & ~gtwiz_buffbypass_tx_done_in)   ? 1'b0 : 1'b1;
        default: rec_first_xtsm_din = 1'b0;
      endcase
end
always @ (posedge opt_gckn) begin
  rec_first_xtsm_q <= rec_first_xtsm_din;
end
                   
//-- Debounce Circuit
reg  [7:0] ocde_q;
wire [7:0] ocde_din;
wire       reset_all_out;
wire       reset_all_out_din;
reg        reset_all_out_q;

assign ocde_din[7:0] = {ocde, ocde_q[7:1]};
assign reset_all_out = ((ocde_q[4:0] == 5'b11111) &  reset_all_out_q) ? 1'b0 :
                       ((ocde_q[4:0] == 5'b00000) & ~reset_all_out_q) ? 1'b1 :
                                                                        reset_all_out_q;
assign gtwiz_reset_all_out = reset_all_out_q; 
assign reset_all_out_din   = reset_all_out;

always @ (posedge clk_156_25MHz) begin
    ocde_q          <= ocde_din;
    reset_all_out_q <= reset_all_out_din;
end


//--************************************************************
//--Make sure lane valid signal is only true if transceiver is initialized
//--************************************************************
assign ln0_rx_valid_out = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) ? ln0_rx_valid_in : 1'b0;
assign ln1_rx_valid_out = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) ? ln1_rx_valid_in : 1'b0;                                                                                   
assign ln2_rx_valid_out = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) ? ln2_rx_valid_in : 1'b0;                                                                                   
assign ln3_rx_valid_out = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) ? ln3_rx_valid_in : 1'b0;                                                                                  
assign ln4_rx_valid_out = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) ? ln4_rx_valid_in : 1'b0;                                                                                   
assign ln5_rx_valid_out = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) ? ln5_rx_valid_in : 1'b0;                                                                                        
assign ln6_rx_valid_out = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) ? ln6_rx_valid_in : 1'b0;                                                                                        
assign ln7_rx_valid_out = (gtwiz_reset_rx_done_in & gtwiz_buffbypass_rx_done_in) ? ln7_rx_valid_in : 1'b0;    

                                                                           
endmodule // -- ocx_dlx_xlx_if
