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
//-- TITLE:    ocx_dlx_tx_gbx.v
//-- FUNCTION: Formats data to send to Xilinx Synchronous Gearbox for 
//--           transmission on a per lane basis
//--
//------------------------------------------------------------------------

module ocx_dlx_tx_gbx (
    
     orx_otx_train_failed                 // -- <  input

    ,ctl_gb_train                         // -- <  input          // ---- link is being trained.  control sync headers should be sent
    ,ctl_gb_reset                         // -- <  input          // ---- reset all counter and pointer
    ,ctl_gb_seq                           // -- <  input  [6:0]   // ---- 33 cycle sequence counter,  every 33 cycle we need to pause to allow room for sync headers 

    ,que_gb_data                          // -- <  input  [63:0]

    ,dlx_phy_tx_seq                       // -- <  output [5:0]  --  Added for Xilinx
    ,dlx_phy_tx_header                    // -- <  output [1:0]  --  Added for Xilinx
    ,dlx_phy_tx_data                      // -- <  output [63:0]

    // ---- traing signals
    ,ctl_gb_tx_a_pattern                  // -- <  input  
    ,ctl_gb_tx_b_pattern                  // -- <  input
    ,ctl_gb_tx_sync_pattern               // -- <  input   
    ,ctl_gb_tx_zeros                      // -- <  input    

//--     ,gnd                                  // -- <> inout
//--     ,vdn                                  // -- <> inout
    ,dlx_clk                              // -- <  input  
    );

    input         orx_otx_train_failed;

    input         ctl_gb_train;
    input         ctl_gb_reset;
    input  [6:0]  ctl_gb_seq;

    input  [63:0] que_gb_data;
    output [5:0]  dlx_phy_tx_seq;
    output [1:0]  dlx_phy_tx_header;
    output [63:0] dlx_phy_tx_data;

    // ---- training signals
    input         ctl_gb_tx_a_pattern;
    input         ctl_gb_tx_b_pattern;
    input         ctl_gb_tx_sync_pattern;
    input         ctl_gb_tx_zeros;

    input dlx_clk;
//--     inout gnd;
//--     (* GROUND_PIN="1" *)
//--     wire gnd;

//--     inout vdn;
//--     (* POWER_PIN="1" *)
//--     wire vdn;

// -- begin logic here
    wire [1:0]   out_header_din;
    reg  [1:0]   out_header_q;
    wire [5:0]   out_seq_din;
    reg  [5:0]   out_seq_q;
    wire [63:0]  out_data_din;
    reg  [63:0]  out_data_q;
    wire [127:0] carry_over_data_din;
    reg  [127:0] carry_over_data_q;
    reg  [65:0]  gb_data; 
    wire [63:0]  phy_train_data;
    wire         phy_training;
    wire         disable_tx;
    assign phy_train_data[63:0]   = ctl_gb_tx_sync_pattern ?  64'hFF00FF00FF0000FF                                :    // -- sync pattern
                                    ctl_gb_tx_b_pattern    ?  64'hFF00FF00FFFF0000                                :    // -- pattern B
                                                              64'hFF00FF00FF00FF00                                ;    // -- pattern A

    assign carry_over_data_din[127:0] = {carry_over_data_q[63:0], phy_train_data[63:0]};

    always @ (ctl_gb_seq[5:0] or phy_train_data or carry_over_data_q[127:0])
begin
      case (ctl_gb_seq[5:0])
        6'b000000 : gb_data[65:0] = carry_over_data_q[127:62];
        6'b000001 : gb_data[65:0] = carry_over_data_q[125:60];
        6'b000010 : gb_data[65:0] = carry_over_data_q[123:58];
        6'b000011 : gb_data[65:0] = carry_over_data_q[121:56];
        6'b000100 : gb_data[65:0] = carry_over_data_q[119:54];
        6'b000101 : gb_data[65:0] = carry_over_data_q[117:52];
        6'b000110 : gb_data[65:0] = carry_over_data_q[115:50];
        6'b000111 : gb_data[65:0] = carry_over_data_q[113:48];
        6'b001000 : gb_data[65:0] = carry_over_data_q[111:46];
        6'b001001 : gb_data[65:0] = carry_over_data_q[109:44];
        6'b001010 : gb_data[65:0] = carry_over_data_q[107:42];
        6'b001011 : gb_data[65:0] = carry_over_data_q[105:40];
        6'b001100 : gb_data[65:0] = carry_over_data_q[103:38];
        6'b001101 : gb_data[65:0] = carry_over_data_q[101:36];
        6'b001110 : gb_data[65:0] = carry_over_data_q[ 99:34];
        6'b001111 : gb_data[65:0] = carry_over_data_q[ 97:32];
        6'b010000 : gb_data[65:0] = carry_over_data_q[ 95:30];
        6'b010001 : gb_data[65:0] = carry_over_data_q[ 93:28];
        6'b010010 : gb_data[65:0] = carry_over_data_q[ 91:26];
        6'b010011 : gb_data[65:0] = carry_over_data_q[ 89:24];
        6'b010100 : gb_data[65:0] = carry_over_data_q[ 87:22];
        6'b010101 : gb_data[65:0] = carry_over_data_q[ 85:20];
        6'b010110 : gb_data[65:0] = carry_over_data_q[ 83:18];
        6'b010111 : gb_data[65:0] = carry_over_data_q[ 81:16];
        6'b011000 : gb_data[65:0] = carry_over_data_q[ 79:14];
        6'b011001 : gb_data[65:0] = carry_over_data_q[ 77:12];
        6'b011010 : gb_data[65:0] = carry_over_data_q[ 75:10];
        6'b011011 : gb_data[65:0] = carry_over_data_q[ 73: 8];
        6'b011100 : gb_data[65:0] = carry_over_data_q[ 71: 6];
        6'b011101 : gb_data[65:0] = carry_over_data_q[ 69: 4];
        6'b011110 : gb_data[65:0] = carry_over_data_q[ 67: 2];
        6'b011111 : gb_data[65:0] = carry_over_data_q[ 65: 0];
        6'b100000 : gb_data[65:0] = {carry_over_data_q[63:0],phy_train_data[63:62]};
        6'b100001 : gb_data[65:0] = {carry_over_data_q[61:0],phy_train_data[63:60]};
        6'b100010 : gb_data[65:0] = {carry_over_data_q[59:0],phy_train_data[63:58]};
        6'b100011 : gb_data[65:0] = {carry_over_data_q[57:0],phy_train_data[63:56]};
        6'b100100 : gb_data[65:0] = {carry_over_data_q[55:0],phy_train_data[63:54]};
        6'b100101 : gb_data[65:0] = {carry_over_data_q[53:0],phy_train_data[63:52]};
        6'b100110 : gb_data[65:0] = {carry_over_data_q[51:0],phy_train_data[63:50]};
        6'b100111 : gb_data[65:0] = {carry_over_data_q[49:0],phy_train_data[63:48]};
        6'b101000 : gb_data[65:0] = {carry_over_data_q[47:0],phy_train_data[63:46]};
        6'b101001 : gb_data[65:0] = {carry_over_data_q[45:0],phy_train_data[63:44]};
        6'b101010 : gb_data[65:0] = {carry_over_data_q[43:0],phy_train_data[63:42]};
        6'b101011 : gb_data[65:0] = {carry_over_data_q[41:0],phy_train_data[63:40]};
        6'b101100 : gb_data[65:0] = {carry_over_data_q[39:0],phy_train_data[63:38]};
        6'b101101 : gb_data[65:0] = {carry_over_data_q[37:0],phy_train_data[63:36]};
        6'b101110 : gb_data[65:0] = {carry_over_data_q[35:0],phy_train_data[63:34]};
        6'b101111 : gb_data[65:0] = {carry_over_data_q[33:0],phy_train_data[63:32]};
        6'b110000 : gb_data[65:0] = {carry_over_data_q[31:0],phy_train_data[63:30]};
        6'b110001 : gb_data[65:0] = {carry_over_data_q[29:0],phy_train_data[63:28]};
        6'b110010 : gb_data[65:0] = {carry_over_data_q[27:0],phy_train_data[63:26]};
        6'b110011 : gb_data[65:0] = {carry_over_data_q[25:0],phy_train_data[63:24]};
        6'b110100 : gb_data[65:0] = {carry_over_data_q[23:0],phy_train_data[63:22]};
        6'b110101 : gb_data[65:0] = {carry_over_data_q[21:0],phy_train_data[63:20]};
        6'b110110 : gb_data[65:0] = {carry_over_data_q[19:0],phy_train_data[63:18]};
        6'b110111 : gb_data[65:0] = {carry_over_data_q[17:0],phy_train_data[63:16]};
        6'b111000 : gb_data[65:0] = {carry_over_data_q[15:0],phy_train_data[63:14]};
        6'b111001 : gb_data[65:0] = {carry_over_data_q[13:0],phy_train_data[63:12]};
        6'b111010 : gb_data[65:0] = {carry_over_data_q[11:0],phy_train_data[63:10]};
        6'b111011 : gb_data[65:0] = {carry_over_data_q[ 9:0],phy_train_data[63: 8]};
        6'b111100 : gb_data[65:0] = {carry_over_data_q[ 7:0],phy_train_data[63: 6]};
        6'b111101 : gb_data[65:0] = {carry_over_data_q[ 5:0],phy_train_data[63: 4]};
        6'b111110 : gb_data[65:0] = {carry_over_data_q[ 3:0],phy_train_data[63: 2]};
        6'b111111 : gb_data[65:0] = {carry_over_data_q[ 1:0],phy_train_data[63: 0]};
      endcase       
 end
     
    assign disable_tx             = ctl_gb_tx_zeros | orx_otx_train_failed | ctl_gb_reset ; 
    assign phy_training           = ctl_gb_tx_a_pattern | ctl_gb_tx_b_pattern | ctl_gb_tx_sync_pattern;


    assign out_seq_din[5:0]       = ctl_gb_seq[6:1];

    assign out_header_din[1:0]    = disable_tx          ?  2'b00                                              :    // -- drive zeros
                                    phy_training        ?  gb_data[65:64]                                     :    // -- phy training 
                                    ctl_gb_train        ?  2'b10                                              :    // -- control sync header
                                                           2'b01                                              ;    // -- data sync header  

    assign out_data_din[63:0]     = disable_tx          ?  64'h0000000000000000                               :    // -- drive zeros
                                    phy_training        ?  gb_data[63:0]                                      :    // -- phy training 
                                                           que_gb_data[63:0]                                  ;    // -- data from tx_que

    assign dlx_phy_tx_seq[5:0]    = out_seq_q[5:0];
    assign dlx_phy_tx_header[1:0] = out_header_q[1:0];
    assign dlx_phy_tx_data[63:0]  = out_data_q[63:0];


always @(posedge (dlx_clk)) begin
   out_header_q[1:0]          <= out_header_din[1:0];
   out_data_q[63:0]           <= out_data_din[63:0];
   carry_over_data_q[127:0]   <= carry_over_data_din[127:0]; 
   out_seq_q[5:0]             <= out_seq_din[5:0];
end

endmodule // -- ocx_dlx_tx_gbx
