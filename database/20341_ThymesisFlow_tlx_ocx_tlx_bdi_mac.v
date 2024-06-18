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
`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2016 11:38:41 AM
// Design Name: 
// Module Name: ocx_tlx_bdi_mac
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Add single bit to mask register and merge the registers, Stage needed for bdi to be aligned with data due to array latency?
// 
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_bdi_mac
    #(
    parameter resp_addr_width = 8,
    parameter cmd_addr_width = 8,
    parameter [15:0] vc0_mask = 16'hFF
    )
    (
    input tlx_clk,
    input reset_n,
    input crc_error,
    input resp_data_fifo_rd_ena,
    input cmd_data_fifo_rd_ena,
    input [resp_addr_width-1:0] resp_data_fifo_rd_ptr,
    input [cmd_addr_width-1:0] cmd_data_fifo_rd_ptr,
    input [7:0] bad_data_indicator,
    input bookend_flit_v,
    input [1:0] data_arb_vc_v,
    input [1:0] data_arb_flit_cnt, 
    input [3:0] run_length,
    input ctl_flit_start,
    input bdi_cfg_hint,
    input cfg_rd_enable,
    output tlx_afu_cmd_data_bdi,
    output tlx_afu_cfg_data_bdi,    
    output tlx_afu_resp_data_bdi
    ); 
wire [resp_addr_width-1:0] vc0_bdi_run_cnt_din;
reg  [resp_addr_width-1:0] vc0_bdi_run_cnt_dout; 
wire [cmd_addr_width-1:0] vc1_bdi_run_cnt_din;
reg  [cmd_addr_width-1:0] vc1_bdi_run_cnt_dout; 
reg  vc0_bdi_reg [2**resp_addr_width-1:0]; 
reg  vc1_bdi_reg [2**cmd_addr_width-1:0];
reg  vc0_bdi_reg_s1; 
reg  vc1_bdi_reg_s1;
reg  vc0_bdi_reg_s2; 
reg  vc1_bdi_reg_s2;
reg  cfg_bdi_reg [2**cmd_addr_width-1:0];
reg  cfg_bdi_reg_s1; 
wire bdi_shift_decr,bdi_shift_incr;
wire [3:0] bdi_shift_minus1, bdi_shift_plus;
wire [3:0] bdi_shift_load_ptr_din;
reg  [3:0] bdi_shift_load_ptr_dout;
wire [15:0] bdi_shift_din;
reg  [15:0] bdi_shift_dout;
wire vc_shift_decr,vc_shift_incr;
wire [3:0] vc_shift_minus1, vc_shift_plus;
wire [3:0] vc_shift_load_ptr_din;
reg  [3:0] vc_shift_load_ptr_dout;
wire [3:0] run_length_s1_din;
reg  [3:0] run_length_s1_dout;
wire [3:0] run_length_s2_din;
reg  [3:0] run_length_s2_dout;
wire [3:0] run_length_hold_din;
reg  [3:0] run_length_hold_dout;
wire [15:0] vc_shift_din;
reg  [15:0] vc_shift_dout;
wire [1:0] data_arb_vc_v_din;
reg  [1:0] data_arb_vc_v_dout;
wire [2:0] data_arb_flit_cnt_din;
reg  [2:0] data_arb_flit_cnt_dout;
wire [3:0] data_arb_flit_cnt_minus1;
wire [3:0] shift_reg_value;
wire vc0_bdi_run_incr;
wire vc1_bdi_run_incr;
wire shift_enable;
wire [15:0] cfg_shift_din;
reg  [15:0] cfg_shift_dout;
wire bdi_cfg_hint_din;
reg  bdi_cfg_hint_dout;
wire cfg_bdi_run_incr;
wire [cmd_addr_width-1:0] cfg_bdi_run_cnt_din;
reg  [cmd_addr_width-1:0] cfg_bdi_run_cnt_dout; 
wire [cmd_addr_width-1:0] cfg_bdi_rd_cnt_din;
reg  [cmd_addr_width-1:0] cfg_bdi_rd_cnt_dout;
wire data_vc_v;
wire [21:0] bdi_shift_decr_incr_d;
wire [22:0] bdi_shift_incr_d;
wire [17:0] vc_shift_decr_d;
wire [18:0] vc_shift_same_d;
wire [17:0] cfg_shift_decr_d;
wire [18:0] cfg_shift_same_d;

integer i,j;
always @(posedge tlx_clk) //latch instantiations
    begin
    if(!reset_n)
    begin
        run_length_s1_dout <= 4'b0;
        run_length_s2_dout <= 4'b0;
        run_length_hold_dout <= 4'b0;
        bdi_shift_load_ptr_dout <= 4'b0;
        vc0_bdi_run_cnt_dout <= {resp_addr_width{1'b0}};
        vc1_bdi_run_cnt_dout <= {cmd_addr_width{1'b0}};
        data_arb_vc_v_dout                <= 2'b0;
        data_arb_flit_cnt_dout            <= 3'b0;            
        vc_shift_dout[15:0]               <= 16'b0;
        vc_shift_load_ptr_dout[3:0]       <= 4'b0;
        bdi_shift_dout <= 16'b0;
        vc1_bdi_reg_s1 <= 1'b0;
        vc1_bdi_reg_s2 <= 1'b0;
        vc0_bdi_reg_s1 <= 1'b0;
        vc0_bdi_reg_s2 <= 1'b0;
        bdi_cfg_hint_dout <= 1'b0;
        cfg_shift_dout[15:0] <= 16'b0;
        cfg_bdi_run_cnt_dout <= {cmd_addr_width{1'b0}};
        cfg_bdi_rd_cnt_dout <= {cmd_addr_width{1'b0}};
        for (j=0; j<(2**cmd_addr_width); j=j+1)    
        begin
            vc1_bdi_reg[j] <= 1'b0;

        end
        for (i=0; i<(2**resp_addr_width); i=i+1)    
        begin
            vc0_bdi_reg[i] <= 1'b0;            
        end
    end
    else            
    begin
        run_length_s1_dout <= run_length_s1_din;
        run_length_s2_dout <= run_length_s2_din;
        run_length_hold_dout <= run_length_hold_din;
        bdi_shift_load_ptr_dout <= bdi_shift_load_ptr_din;
        bdi_shift_dout <= bdi_shift_din;
        vc0_bdi_run_cnt_dout <= vc0_bdi_run_cnt_din;    
        vc1_bdi_run_cnt_dout <= vc1_bdi_run_cnt_din;            
        data_arb_vc_v_dout     <= data_arb_vc_v_din;
        data_arb_flit_cnt_dout <= data_arb_flit_cnt_din; 
        vc_shift_dout[15:0] <= vc_shift_din[15:0];
        vc_shift_load_ptr_dout[3:0] <= vc_shift_load_ptr_din[3:0];
        bdi_cfg_hint_dout <= bdi_cfg_hint_din;
        cfg_shift_dout[15:0] <= cfg_shift_din[15:0];
        cfg_bdi_run_cnt_dout <= cfg_bdi_run_cnt_din;
        cfg_bdi_rd_cnt_dout <= cfg_bdi_rd_cnt_din;
        //Resp BDI Register    
        if(!vc_shift_dout[0] && shift_enable) begin vc0_bdi_reg[vc0_bdi_run_cnt_dout] <= bdi_shift_dout[0]; end
        if(vc_shift_dout[0] && !cfg_shift_dout[0] && shift_enable) begin vc1_bdi_reg[vc1_bdi_run_cnt_dout] <= bdi_shift_dout[0];  end
        if(vc_shift_dout[0] &&  cfg_shift_dout[0] && shift_enable) begin cfg_bdi_reg[cfg_bdi_run_cnt_dout] <= bdi_shift_dout[0];  end
        //Assign output
        if(cmd_data_fifo_rd_ena) begin  vc1_bdi_reg_s1 <= vc1_bdi_reg[cmd_data_fifo_rd_ptr]; end
        else begin vc1_bdi_reg_s1 <= 1'b0; end
        vc1_bdi_reg_s2 <= vc1_bdi_reg_s1;
        
        if(resp_data_fifo_rd_ena) begin vc0_bdi_reg_s1 <= vc0_bdi_reg[resp_data_fifo_rd_ptr]; end
        else begin vc0_bdi_reg_s1 <= 1'b0; end
        vc0_bdi_reg_s2 <= vc0_bdi_reg_s1; 
        
        if(cfg_rd_enable) begin cfg_bdi_reg_s1 <= cfg_bdi_reg[cfg_bdi_rd_cnt_dout]; end
        else begin cfg_bdi_reg_s1 <= 1'b0; end             
    end       
end        
//Unused signals
wire unused_intentionally;
assign unused_intentionally = (| {crc_error,
vc0_bdi_reg_s2,
vc1_bdi_reg_s2,
bdi_shift_decr_incr_d[21:16],
bdi_shift_incr_d[22:16],
vc_shift_decr_d[17:16],
vc_shift_same_d[18:16],
cfg_shift_decr_d[17:16],
cfg_shift_same_d[18:16]} );

//
assign run_length_s1_din = run_length;
assign run_length_s2_din = run_length_s1_dout;
assign run_length_hold_din = ctl_flit_start && (run_length_s2_dout != 4'h0) ? run_length_s2_dout : run_length_hold_dout;
assign shift_enable = (bdi_shift_load_ptr_dout != 4'h0) & (vc_shift_load_ptr_dout != 4'h0) ;
//BDI Shift Register
assign bdi_shift_minus1[3:0] = bdi_shift_load_ptr_dout[3:0] - 4'b0001;
assign bdi_shift_plus[3:0] = (bookend_flit_v && shift_enable) ? bdi_shift_load_ptr_dout[3:0] + run_length_hold_dout[3:0] - 4'b0001 
                                                              : bdi_shift_load_ptr_dout[3:0] + run_length_hold_dout[3:0];
assign bdi_shift_incr = bookend_flit_v;
assign bdi_shift_decr = shift_enable;                                        
assign bdi_shift_load_ptr_din[3:0] = bdi_shift_incr ? bdi_shift_plus :
                                     bdi_shift_decr ? bdi_shift_minus1 : bdi_shift_load_ptr_dout;

//-----------
// assign bdi_shift_din[15:0] = bdi_shift_decr && bdi_shift_incr ? (bad_data_indicator[7:0] << (bdi_shift_load_ptr_dout[3:0] - 4'h1)) | ((bdi_shift_dout >> 1) & ~(vc0_mask << bdi_shift_load_ptr_dout)) :
//                             bdi_shift_decr ? bdi_shift_dout >>> 1 : 
//                             bdi_shift_incr ? (bad_data_indicator[7:0] << bdi_shift_load_ptr_dout[3:0]) | (bdi_shift_dout & ~(vc0_mask << bdi_shift_load_ptr_dout)) : bdi_shift_dout;

//assign bdi_shift_decr_incr_d[21:0] = (bad_data_indicator[7:0] << (bdi_shift_load_ptr_dout[3:0] - 4'h1));
//assign bdi_shift_incr_d[22:0]      = (bad_data_indicator[7:0] << bdi_shift_load_ptr_dout[3:0]);
  assign bdi_shift_decr_incr_d[21:0] = ({14'b0, bad_data_indicator[7:0]} << (bdi_shift_load_ptr_dout[3:0] - 4'h1));
  assign bdi_shift_incr_d[22:0]      = ({15'b0, bad_data_indicator[7:0]} << bdi_shift_load_ptr_dout[3:0]);
assign bdi_shift_din[15:0] = bdi_shift_decr && bdi_shift_incr ? (bdi_shift_decr_incr_d[15:0]) | ((bdi_shift_dout >> 1) & ~(vc0_mask << bdi_shift_load_ptr_dout)) :
                             bdi_shift_decr ? bdi_shift_dout >>> 1 : 
                             bdi_shift_incr ? (bdi_shift_incr_d[15:0]) | (bdi_shift_dout & ~(vc0_mask << bdi_shift_load_ptr_dout)) : bdi_shift_dout;
//-----------

//VC information
assign bdi_cfg_hint_din = bdi_cfg_hint;
assign data_arb_vc_v_din = data_arb_vc_v;
assign data_arb_flit_cnt_din[2:0] = (data_arb_flit_cnt == 2'b01) ? 3'b001 : //64B of data
                                    (data_arb_flit_cnt == 2'b10) ? 3'b010 : //128B of data
                                    (data_arb_flit_cnt == 2'b11) ? 3'b100 : 3'b000; //256B of data
assign data_vc_v = |data_arb_vc_v_dout;
assign shift_reg_value[3:0] = (data_arb_flit_cnt_dout == 3'b001) ? 4'b0001 : 
                              (data_arb_flit_cnt_dout == 3'b010) ? 4'b0011 :
                              (data_arb_flit_cnt_dout == 3'b011) ? 4'b1111 : 4'b0000;                                                            

assign data_arb_flit_cnt_minus1[3:0] = {1'b0, data_arb_flit_cnt_dout[2:0]} - 4'b0001;

//VC Shift Register
assign vc_shift_minus1[3:0] = vc_shift_load_ptr_dout[3:0] - 4'b0001;

// assign vc_shift_plus[3:0] = data_vc_v && (shift_enable) ? (data_arb_flit_cnt_dout - 2'b01) + vc_shift_load_ptr_dout[3:0] :
assign vc_shift_plus[3:0]    = data_vc_v && (shift_enable) ?  data_arb_flit_cnt_minus1[3:0]   + vc_shift_load_ptr_dout[3:0] :
                               data_vc_v ? {1'b0, data_arb_flit_cnt_dout[2:0]} + vc_shift_load_ptr_dout[3:0] : 4'b0;
assign vc_shift_incr = data_vc_v;
assign vc_shift_decr = shift_enable;
                                                                            
assign vc_shift_load_ptr_din[3:0] = vc_shift_incr ? vc_shift_plus :
                                    vc_shift_decr ? vc_shift_minus1 : vc_shift_load_ptr_dout; 
                                    
//-----------
// assign vc_shift_din[15:0] = data_arb_vc_v_dout[1] && vc_shift_decr ? (vc_shift_dout[15:0] >> 1) | (shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-1)) :
//                             data_arb_vc_v_dout[0] && vc_shift_decr ? (vc_shift_dout[15:0] >> 1) & ((shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-1)) ^ vc0_mask) : 
//                             data_arb_vc_v_dout[1] ? vc_shift_dout[15:0] | (shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]) :
//                             data_arb_vc_v_dout[0] ? vc_shift_dout[15:0] & ((shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]) ^ vc0_mask) : 
//                             vc_shift_decr ? vc_shift_dout >> 1 : vc_shift_dout;

//assign vc_shift_decr_d[17:0] = (shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-4'h1));
//assign vc_shift_same_d[18:0] = (shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]);
  assign vc_shift_decr_d[17:0] = ({14'b0, shift_reg_value[3:0]} <<< (vc_shift_load_ptr_dout[3:0]-4'h1));
  assign vc_shift_same_d[18:0] = ({15'b0, shift_reg_value[3:0]} <<< vc_shift_load_ptr_dout[3:0]);

assign vc_shift_din[15:0] = data_arb_vc_v_dout[1] && vc_shift_decr ? (vc_shift_dout[15:0] >> 1) | (vc_shift_decr_d[15:0]) :
                            data_arb_vc_v_dout[0] && vc_shift_decr ? (vc_shift_dout[15:0] >> 1) & ((vc_shift_decr_d[15:0]) ^ vc0_mask) : 
                            data_arb_vc_v_dout[1] ? vc_shift_dout[15:0] | (vc_shift_same_d[15:0]) :
                            data_arb_vc_v_dout[0] ? vc_shift_dout[15:0] & ((vc_shift_same_d[15:0]) ^ vc0_mask) : 
                            vc_shift_decr ? vc_shift_dout >> 1 : vc_shift_dout;

//-----------

//-----------
// assign cfg_shift_din[15:0] = bdi_cfg_hint_dout && vc_shift_decr ? (cfg_shift_dout[15:0] >> 1) | (shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-4'h1)) :                             
//                              bdi_cfg_hint_dout ? cfg_shift_dout[15:0] | (shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]) :
//                             |data_arb_vc_v_dout && vc_shift_decr ? (cfg_shift_dout[15:0] >> 1) & ((shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-4'h1)) ^ vc0_mask) :
//                             |data_arb_vc_v_dout ? cfg_shift_dout[15:0] & ((shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]) ^ vc0_mask) : 
//                             vc_shift_decr ? cfg_shift_dout >> 1 : cfg_shift_dout;

//assign cfg_shift_decr_d[17:0] = (shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-4'h1));
//assign cfg_shift_same_d[18:0] = (shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]);
  assign cfg_shift_decr_d[17:0] = ({14'b0, shift_reg_value[3:0]} <<< (vc_shift_load_ptr_dout[3:0]-4'h1));
  assign cfg_shift_same_d[18:0] = ({15'b0, shift_reg_value[3:0]} <<< vc_shift_load_ptr_dout[3:0]);

assign cfg_shift_din[15:0] = bdi_cfg_hint_dout && vc_shift_decr ? (cfg_shift_dout[15:0] >> 1) | (cfg_shift_decr_d[15:0]) :                             
                             bdi_cfg_hint_dout ? cfg_shift_dout[15:0] | (cfg_shift_same_d[15:0]) :
                            |data_arb_vc_v_dout && vc_shift_decr ? (cfg_shift_dout[15:0] >> 1) & ((cfg_shift_decr_d[15:0]) ^ vc0_mask) :
                            |data_arb_vc_v_dout ? cfg_shift_dout[15:0] & ((cfg_shift_same_d[15:0]) ^ vc0_mask) : 
                            vc_shift_decr ? cfg_shift_dout >> 1 : cfg_shift_dout;

//-----------

                          
//VC# BDI REGISTER
assign vc0_bdi_run_incr = shift_enable & !vc_shift_dout[0];                             
assign vc0_bdi_run_cnt_din = vc0_bdi_run_incr ?  vc0_bdi_run_cnt_dout + {{resp_addr_width-1{1'b0}}, 1'b1}: vc0_bdi_run_cnt_dout;
assign vc1_bdi_run_incr = shift_enable & vc_shift_dout[0] & !cfg_shift_dout[0]; 
assign vc1_bdi_run_cnt_din = vc1_bdi_run_incr ?  vc1_bdi_run_cnt_dout + {{cmd_addr_width-1{1'b0}}, 1'b1}: vc1_bdi_run_cnt_dout;      
assign cfg_bdi_run_incr = shift_enable & vc_shift_dout[0] & cfg_shift_dout[0]; 
assign cfg_bdi_run_cnt_din = cfg_bdi_run_incr ?  cfg_bdi_run_cnt_dout + {{cmd_addr_width-1{1'b0}}, 1'b1}: cfg_bdi_run_cnt_dout;
assign cfg_bdi_rd_cnt_din = cfg_rd_enable ? cfg_bdi_rd_cnt_dout + {{cmd_addr_width-1{1'b0}}, 1'b1}: cfg_bdi_rd_cnt_dout;                       
//Assign Output
assign tlx_afu_cmd_data_bdi = vc1_bdi_reg_s1;
assign tlx_afu_resp_data_bdi = vc0_bdi_reg_s1;
assign tlx_afu_cfg_data_bdi = cfg_bdi_reg_s1;                                              
endmodule

