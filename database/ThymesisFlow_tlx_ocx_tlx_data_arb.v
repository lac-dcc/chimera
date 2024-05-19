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
// Create Date: 07/07/2016 09:33:16 AM
// Design Name: 
// Module Name: tlx_data_arb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_data_arb(
    input tlx_clk,
    input reset_n,
    input crc_error,
    input bookend_flit_v,    //bookend ctl flit validated data
    output dcp0_data_v,
    output dcp1_data_v,
    output [511:0] dcp0_data,
    output [511:0] dcp1_data,
    output good_crc,
    output crc_flush_done,
    output crc_flush_inprog,
    output cfg_data_v,
    output cfg_data_cnt_v,
    output [31:0] cfg_data_bus,
    input  control_parsing_end, 
    input  control_parsing_start,   
    input [511:0] pars_data_flit,
    input pars_data_valid,
    input [3:0] run_length,
    input [1:0] data_arb_vc_v,
    input data_arb_cfg_hint,
    input [3:0] data_arb_cfg_offset,
    input [1:0] data_arb_flit_cnt
    );
//Signal Declarations
wire [511:0] dcp1_data_wire;

wire [1:0] data_arb_vc_v_din;
reg  [1:0] data_arb_vc_v_dout;
wire [2:0] data_arb_flit_cnt_din;
reg  [2:0] data_arb_flit_cnt_dout;
wire [2:0] data_arb_flit_cnt_dout_m1;
wire [511:0] data_pipe0_din,data_pipe1_din,data_pipe2_din,data_pipe3_din,data_pipe4_din,data_pipe5_din,data_pipe6_din,data_pipe7_din, data_pipe8_din, data_pipe9_din;
reg  [511:0] data_pipe0_dout, data_pipe1_dout, data_pipe2_dout, data_pipe3_dout, data_pipe4_dout, data_pipe5_dout, data_pipe6_dout, data_pipe7_dout, data_pipe8_dout, data_pipe9_dout;
wire [3:0] shift_reg_value;
wire data_vc_v;
wire [9:0] pipe_v_din;
reg  [9:0] pipe_v_dout;
wire rd_stg4_v_clone_dcp0,rd_stg3_v_clone_dcp0,rd_stg5_v_clone_dcp0, rd_stg6_v_clone_dcp0, rd_stg9_v_clone_dcp0;
wire rd_stg4_v_clone_dcp1,rd_stg3_v_clone_dcp1,rd_stg5_v_clone_dcp1, rd_stg6_v_clone_dcp1, rd_stg9_v_clone_dcp1;
wire rd_stg4_v_clone_cfg,rd_stg3_v_clone_cfg,rd_stg5_v_clone_cfg, rd_stg6_v_clone_cfg, rd_stg9_v_clone_cfg;
wire vc_shift_decr,vc_shift_incr;
wire [3:0] vc_shift_minus1, vc_shift_plus;
wire [3:0] vc_shift_load_ptr_din;
reg  [3:0] vc_shift_load_ptr_dout, vc_shift_load_ptr_dout_clone_dcp1, vc_shift_load_ptr_dout_clone_dcp0,vc_shift_load_ptr_dout_clone_cfg;
wire [15:0] vc_shift_din;
reg  [15:0] vc_shift_dout;
wire [15:0] vc_shift_verified_din;
reg  [15:0] vc_shift_verified_dout;
wire [15:0] cfg_shift_din;
reg  [15:0] cfg_shift_dout;
wire [15:0] cfg_shift_verified_din;
reg  [15:0] cfg_shift_verified_dout;
wire bookend_flit_din;
reg  bookend_flit_dout;
wire [8:0] good_crc_shift_din;
reg  [8:0] good_crc_shift_dout;
wire crc_flush_inprog_din;
reg  crc_flush_inprog_dout;
wire crc_flush_done_wire;
reg  [3:0] run_length_hold_dout;
wire [3:0] run_length_hold_din;
wire crc_error_din;
reg  crc_error_dout;
wire ctl_flit_parse_done_din;
reg  ctl_flit_parse_done_dout;
reg  crc_error_s2_dout;
wire crc_error_s2_din;
reg  crc_error_s3_dout;
wire crc_error_s3_din;
reg  [3:0] vc_shift_verif_ptr_dout;
wire [3:0] vc_shift_verif_ptr_din;
reg  data_arb_cfg_hint_dout;
wire data_arb_cfg_hint_din;
reg  [1:0] cfg_offset_wr_ptr_dout;
wire [1:0] cfg_offset_wr_ptr_din;
wire cfg_offset_incr;
wire cfg_offset_decr;
wire cfg_offset_hold;
reg  [31:0] cfg_data_bus_reg;
reg [3:0] cfg_offset_shift0_dout;
wire [3:0] cfg_offset_shift0_din;
reg [3:0] cfg_offset_shift1_dout;
wire [3:0] cfg_offset_shift1_din;
reg [3:0] cfg_offset_shift2_dout;
wire [3:0] cfg_offset_shift2_din;
reg [3:0] cfg_offset_shift3_dout;
wire [3:0] cfg_offset_shift3_din;
reg [3:0] cfg_offset_verif_shift0_dout;
wire [3:0] cfg_offset_verif_shift0_din;
reg [3:0] cfg_offset_verif_shift1_dout;
wire [3:0] cfg_offset_verif_shift1_din;
reg [3:0] cfg_offset_verif_shift2_dout;
wire [3:0] cfg_offset_verif_shift2_din;
reg [3:0] cfg_offset_verif_shift3_dout;
wire [3:0] cfg_offset_verif_shift3_din;
wire cfg_shift;
wire cfg_wr;
wire cfg_data_v_din;
reg  cfg_data_v_dout;
wire [511:0] cfg_data_bus_din;
reg  [511:0] cfg_data_bus_dout;
wire [3:0] data_arb_cfg_offset_din;
reg  [3:0] data_arb_cfg_offset_dout;
wire cfg_data_v_s1_din;
reg  cfg_data_v_s1_dout;
wire [1:0] cfg_offset_verif_ptr_din;
reg  [1:0] cfg_offset_verif_ptr_dout;
wire crc_reset;
reg  [9:0] pipe_v_clone_dout;
reg  [9:0] pipe_v_clone_cfg_dout;
wire [19:0]  vc_shift_verified_shifted_temp;
wire [18:0]  vc_shifted_reg_value_temp_1;
wire [19:0]  vc_shifted_reg_value_temp_0;
wire [19:0]  cfg_shifted_reg_verified_temp;
parameter [15:0] vc0_mask = 16'hFF;
always @(posedge tlx_clk) //latch instantiations 
    begin
        if(!reset_n)
        begin
            data_arb_cfg_hint_dout            <= 1'b0;
            cfg_shift_verified_dout           <= 16'b0;
            cfg_shift_dout                    <= 16'b0;                      
            data_arb_vc_v_dout[1:0]           <= 2'b0;
            data_arb_flit_cnt_dout            <= 3'b0;
            data_pipe0_dout[511:0]            <= 512'b0;
            data_pipe1_dout[511:0]            <= 512'b0;
            data_pipe2_dout[511:0]            <= 512'b0;
            data_pipe3_dout[511:0]            <= 512'b0;
            data_pipe4_dout[511:0]            <= 512'b0;
            data_pipe5_dout[511:0]            <= 512'b0;
            data_pipe6_dout[511:0]            <= 512'b0;
            data_pipe7_dout[511:0]            <= 512'b0;
            data_pipe8_dout[511:0]            <= 512'b0;
            data_pipe9_dout[511:0]            <= 512'b0;
            vc_shift_dout[15:0]               <= 16'b0;
            vc_shift_load_ptr_dout_clone_cfg[3:0] <= 4'b0;
            vc_shift_load_ptr_dout_clone_dcp1[3:0] <= 4'b0;
            vc_shift_load_ptr_dout_clone_dcp0[3:0] <= 4'b0;
            vc_shift_verified_dout[15:0]      <= 16'b0;
            vc_shift_load_ptr_dout[3:0]       <= 4'b0;
            pipe_v_dout[9:0]                  <= 10'b0;
            pipe_v_clone_dout[9:0]            <= 10'b0;
            pipe_v_clone_cfg_dout[9:0]        <= 10'b0;
            bookend_flit_dout                 <= 1'b0;
            good_crc_shift_dout               <= 9'b0;
            crc_flush_inprog_dout             <= 1'b0;
            run_length_hold_dout              <= 4'b0;
            crc_error_dout                    <= 1'b0;
            crc_error_s2_dout                 <= 1'b0;
            crc_error_s3_dout                 <= 1'b0;
            ctl_flit_parse_done_dout          <= 1'b0;
            vc_shift_verif_ptr_dout[3:0]      <= 4'b0;
            cfg_offset_wr_ptr_dout[1:0]       <= 2'b0;
            cfg_data_bus_reg[31:0]            <= 32'b0;
            cfg_offset_shift0_dout            <= 4'b0;
            cfg_offset_shift1_dout            <= 4'b0;
            cfg_offset_shift2_dout            <= 4'b0;
            cfg_offset_shift3_dout            <= 4'b0;
            cfg_offset_verif_shift0_dout            <= 4'b0;
            cfg_offset_verif_shift1_dout            <= 4'b0;
            cfg_offset_verif_shift2_dout            <= 4'b0;
            cfg_offset_verif_shift3_dout            <= 4'b0;            
            cfg_data_v_dout                   <= 1'b0;
            cfg_data_bus_dout[511:0]          <= 512'b0;
            data_arb_cfg_offset_dout[3:0]     <= 4'b0;
            cfg_data_v_s1_dout                <= 1'b0;
            cfg_offset_verif_ptr_dout         <= 2'b0;
        end
        else
        begin
            bookend_flit_dout      <= bookend_flit_din;
            data_arb_vc_v_dout     <= data_arb_vc_v_din;
            data_arb_flit_cnt_dout <= data_arb_flit_cnt_din;
            data_pipe0_dout[511:0] <= data_pipe0_din[511:0];
            data_pipe1_dout[511:0] <= data_pipe1_din[511:0];
            data_pipe2_dout[511:0] <= data_pipe2_din[511:0];
            data_pipe3_dout[511:0] <= data_pipe3_din[511:0];
            data_pipe4_dout[511:0] <= data_pipe4_din[511:0];
            data_pipe5_dout[511:0] <= data_pipe5_din[511:0];
            data_pipe6_dout[511:0] <= data_pipe6_din[511:0];
            data_pipe7_dout[511:0] <= data_pipe7_din[511:0];
            data_pipe8_dout[511:0] <= data_pipe8_din[511:0];
            data_pipe9_dout[511:0] <= data_pipe9_din[511:0];
            vc_shift_dout[15:0] <= vc_shift_din[15:0];
            vc_shift_verified_dout[15:0] <= vc_shift_verified_din[15:0];
            vc_shift_load_ptr_dout[3:0] <= vc_shift_load_ptr_din[3:0];
            vc_shift_load_ptr_dout_clone_cfg[3:0] <= vc_shift_load_ptr_din[3:0];
            vc_shift_load_ptr_dout_clone_dcp1[3:0] <= vc_shift_load_ptr_din[3:0];
            vc_shift_load_ptr_dout_clone_dcp0[3:0] <= vc_shift_load_ptr_din[3:0];
            pipe_v_dout[9:0] <= pipe_v_din[9:0];
            pipe_v_clone_dout[9:0] <= pipe_v_din[9:0];
            pipe_v_clone_cfg_dout[9:0] <= pipe_v_din[9:0];
            good_crc_shift_dout[8:0] <= good_crc_shift_din[8:0];
            crc_flush_inprog_dout <= crc_flush_inprog_din;
            run_length_hold_dout <= run_length_hold_din;
            crc_error_dout <= crc_error_din;
            crc_error_s2_dout <= crc_error_s2_din;
            crc_error_s3_dout <= crc_error_s3_din;
            ctl_flit_parse_done_dout <= ctl_flit_parse_done_din;
            vc_shift_verif_ptr_dout[3:0]  <= vc_shift_verif_ptr_din[3:0];
            cfg_shift_verified_dout[15:0]     <= cfg_shift_verified_din[15:0];
            cfg_shift_dout[15:0]              <= cfg_shift_din[15:0]; 
            data_arb_cfg_hint_dout            <= data_arb_cfg_hint_din;  
            cfg_offset_wr_ptr_dout            <= cfg_offset_wr_ptr_din;           
            cfg_offset_shift0_dout            <= cfg_offset_shift0_din;
            cfg_offset_shift1_dout            <= cfg_offset_shift1_din;
            cfg_offset_shift2_dout            <= cfg_offset_shift2_din;
            cfg_offset_shift3_dout            <= cfg_offset_shift3_din;
            cfg_offset_verif_shift0_dout            <= cfg_offset_verif_shift0_din;
            cfg_offset_verif_shift1_dout            <= cfg_offset_verif_shift1_din;
            cfg_offset_verif_shift2_dout            <= cfg_offset_verif_shift2_din;
            cfg_offset_verif_shift3_dout            <= cfg_offset_verif_shift3_din;
            cfg_data_v_dout                   <= cfg_data_v_din;
            cfg_data_bus_dout[511:0]          <= cfg_data_bus_din[511:0];
            data_arb_cfg_offset_dout[3:0]     <= data_arb_cfg_offset_din[3:0];
            cfg_data_v_s1_dout                <= cfg_data_v_s1_din;
            cfg_offset_verif_ptr_dout         <= cfg_offset_verif_ptr_din;
          case ( cfg_offset_shift0_dout[3:0] )        
            4'b0000:  cfg_data_bus_reg <= cfg_data_bus_dout[ 31:  0];
            4'b0001:  cfg_data_bus_reg <= cfg_data_bus_dout[ 63: 32];
            4'b0010:  cfg_data_bus_reg <= cfg_data_bus_dout[ 95: 64];
            4'b0011:  cfg_data_bus_reg <= cfg_data_bus_dout[127: 96];
            4'b0100:  cfg_data_bus_reg <= cfg_data_bus_dout[159:128];
            4'b0101:  cfg_data_bus_reg <= cfg_data_bus_dout[191:160];
            4'b0110:  cfg_data_bus_reg <= cfg_data_bus_dout[223:192];
            4'b0111:  cfg_data_bus_reg <= cfg_data_bus_dout[255:224];
            4'b1000:  cfg_data_bus_reg <= cfg_data_bus_dout[287:256];
            4'b1001:  cfg_data_bus_reg <= cfg_data_bus_dout[319:288];
            4'b1010:  cfg_data_bus_reg <= cfg_data_bus_dout[351:320];
            4'b1011:  cfg_data_bus_reg <= cfg_data_bus_dout[383:352];
            4'b1100:  cfg_data_bus_reg <= cfg_data_bus_dout[415:384];
            4'b1101:  cfg_data_bus_reg <= cfg_data_bus_dout[447:416];
            4'b1110:  cfg_data_bus_reg <= cfg_data_bus_dout[479:448];
            4'b1111:  cfg_data_bus_reg <= cfg_data_bus_dout[511:480];
            default:  cfg_data_bus_reg <= 32'hBADDBADD;    // Short for 'BAD Data, BAD Data'
          endcase                     
        end
    end   
//Unused signals
wire unused_intentionally;
assign unused_intentionally = (| {pipe_v_clone_dout[2:0],
vc_shift_verified_shifted_temp[19:16],
vc_shifted_reg_value_temp_1[18:16],
vc_shifted_reg_value_temp_0[19:16],
cfg_shifted_reg_verified_temp[19:16],
cfg_offset_verif_shift2_dout[3:0],
cfg_offset_verif_shift3_dout[3:0],
pipe_v_clone_cfg_dout[2:0]} );

//Protect data valids with good crc
assign crc_error_din = crc_error;
assign crc_error_s2_din = crc_error_dout;
assign crc_error_s3_din = crc_error_s2_dout;
assign ctl_flit_parse_done_din = control_parsing_end ? 1'b1 :
                                 control_parsing_start ? 1'b0 : ctl_flit_parse_done_dout;
assign good_crc_shift_din = bookend_flit_v ? 9'b111111111 : good_crc_shift_dout <<< 1;   
assign crc_flush_inprog_din = (|(good_crc_shift_dout[8:0] & pipe_v_dout[9:1])) && crc_error_dout ? 1'b1 :
                             !(|(good_crc_shift_dout[8:0] & pipe_v_dout[9:1])) ? 1'b0 : crc_flush_inprog_dout;
assign crc_flush_done_wire = ~crc_flush_inprog_din & crc_flush_inprog_dout; //falling edge of inprogress 
//Valid data pipe
assign pipe_v_din[0] = crc_error_dout ? 1'b0 : pars_data_valid;
assign pipe_v_din[1] = crc_error_dout && ~good_crc_shift_dout[0] ? 1'b0 : pipe_v_dout[0];
assign pipe_v_din[2] = crc_error_dout && ~good_crc_shift_dout[1] ? 1'b0 : pipe_v_dout[1];
assign pipe_v_din[3] = crc_error_dout && ~good_crc_shift_dout[2] ? 1'b0 : pipe_v_dout[2];
assign pipe_v_din[4] = crc_error_dout && ~good_crc_shift_dout[3] ? 1'b0 : (pipe_v_dout[3] & ~rd_stg3_v_clone_dcp1);
assign pipe_v_din[5] = crc_error_dout && ~good_crc_shift_dout[4] ? 1'b0 : (pipe_v_dout[4] & ~rd_stg4_v_clone_dcp1);
assign pipe_v_din[6] = crc_error_dout && ~good_crc_shift_dout[5] ? 1'b0 : (pipe_v_dout[5] & ~rd_stg5_v_clone_dcp1);
assign pipe_v_din[7] = crc_error_dout && ~good_crc_shift_dout[6] ? 1'b0 : (pipe_v_dout[6] & ~rd_stg6_v_clone_dcp1);
assign pipe_v_din[8] = crc_error_dout && ~good_crc_shift_dout[7] ? 1'b0 : pipe_v_dout[7];
assign pipe_v_din[9] = crc_error_dout && ~good_crc_shift_dout[8] ? 1'b0 : pipe_v_dout[8];

//Error command fell through Sim only?
//assign err_data_dropped = pipe_v_dout[9] & ~rd_stg9_v_clone_dcp1; 

//Data Pipeline
assign data_pipe0_din[511:0] = pars_data_flit[511:0];
assign data_pipe1_din[511:0] = data_pipe0_dout[511:0];
assign data_pipe2_din[511:0] = data_pipe1_dout[511:0];
assign data_pipe3_din[511:0] = data_pipe2_dout[511:0];
assign data_pipe4_din[511:0] = data_pipe3_dout[511:0];
assign data_pipe5_din[511:0] = data_pipe4_dout[511:0];
assign data_pipe6_din[511:0] = data_pipe5_dout[511:0];
assign data_pipe7_din[511:0] = data_pipe6_dout[511:0];
assign data_pipe8_din[511:0] = data_pipe7_dout[511:0];
assign data_pipe9_din[511:0] = data_pipe8_dout[511:0];
//VC information
assign data_arb_vc_v_din = data_arb_vc_v;
assign data_arb_flit_cnt_din[2:0] = (data_arb_flit_cnt == 2'b01) ? 3'b001 : //64B of data
                                    (data_arb_flit_cnt == 2'b10) ? 3'b010 : //128B of data
                                    (data_arb_flit_cnt == 2'b11) ? 3'b100 : 3'b000; //256B of data
assign data_vc_v = |data_arb_vc_v_dout;
assign shift_reg_value[3:0] = (data_arb_flit_cnt_dout == 3'b001) ? 4'b0001 : //64B of data
                              (data_arb_flit_cnt_dout == 3'b010) ? 4'b0011 : //128B of data
                              (data_arb_flit_cnt_dout == 3'b100) ? 4'b1111 : 4'b0000; //256B of data
//VC Shift Register
assign vc_shift_minus1[3:0] = vc_shift_load_ptr_dout[3:0] - 4'b0001;

assign data_arb_flit_cnt_dout_m1[2:0] = (data_arb_flit_cnt_dout[2:0] - 3'b001);
assign vc_shift_plus[3:0] = data_vc_v && (rd_stg4_v_clone_dcp0 || rd_stg3_v_clone_dcp1 || rd_stg5_v_clone_dcp1 || rd_stg6_v_clone_dcp1 || rd_stg9_v_clone_dcp1) ? {1'b0,data_arb_flit_cnt_dout_m1[2:0]} + vc_shift_load_ptr_dout[3:0] : //NJO changed dcp0 clone for timing test
                            data_vc_v ? {1'b0,data_arb_flit_cnt_dout[2:0]} + vc_shift_load_ptr_dout[3:0] : 4'b0;
assign vc_shift_incr = data_vc_v;
assign vc_shift_decr = (rd_stg4_v_clone_dcp1 | rd_stg3_v_clone_dcp1 | rd_stg5_v_clone_dcp1 | rd_stg6_v_clone_dcp1 | rd_stg9_v_clone_dcp1);        
assign run_length_hold_din = (run_length > 4'b0) ? run_length : run_length_hold_dout;     

assign vc_shift_verif_ptr_din[3:0] = control_parsing_start && data_vc_v ? {1'b0, data_arb_flit_cnt_dout}   :
                                     control_parsing_start ? 4'b0 :
                                     data_vc_v ? vc_shift_verif_ptr_dout + {1'b0,data_arb_flit_cnt_dout} : vc_shift_verif_ptr_dout;                          
assign vc_shift_load_ptr_din[3:0] = (ctl_flit_parse_done_dout && crc_error_s3_dout && ~(control_parsing_start || bookend_flit_v || crc_flush_inprog_dout)) ? run_length_hold_dout :
                                    vc_shift_incr ? vc_shift_plus :
                                    vc_shift_decr ? vc_shift_minus1 : vc_shift_load_ptr_dout;

//-----------                          
// assign vc_shift_verified_din[15:0] = control_parsing_start && data_arb_vc_v_dout[1] ? {12'b0,shift_reg_value} :
//                                      control_parsing_start && data_arb_vc_v_dout[0] ? 16'b0 :
//                                      data_arb_vc_v_dout[1] ? vc_shift_verified_dout[15:0] |  (shift_reg_value[3:0] <<< vc_shift_verif_ptr_dout[3:0]) :
//                                      data_arb_vc_v_dout[0] ? vc_shift_verified_dout[15:0] & ((shift_reg_value[3:0] <<< vc_shift_verif_ptr_dout[3:0]) ^ vc0_mask) :
//                                      vc_shift_verified_dout;

//assign vc_shift_verified_shifted_temp[19:0] = (shift_reg_value[3:0] <<< vc_shift_verif_ptr_dout[3:0]);
assign vc_shift_verified_shifted_temp[19:0] = ({16'b0, shift_reg_value[3:0]} <<< vc_shift_verif_ptr_dout[3:0]);
assign vc_shift_verified_din[15:0] = control_parsing_start && data_arb_vc_v_dout[1] ? {12'b0,shift_reg_value} :
                                     control_parsing_start && data_arb_vc_v_dout[0] ? 16'b0 :
                                     data_arb_vc_v_dout[1] ? vc_shift_verified_dout[15:0] |  (vc_shift_verified_shifted_temp[15:0]) :
                                     data_arb_vc_v_dout[0] ? vc_shift_verified_dout[15:0] & ((vc_shift_verified_shifted_temp[15:0]) ^ vc0_mask) :
                                     vc_shift_verified_dout;
//-----------                          
                                  
                                  
//-----------                          
// assign vc_shift_din[15:0] = (ctl_flit_parse_done_dout && crc_error_s3_dout && ~(control_parsing_start || crc_flush_inprog_dout)) ? vc_shift_verified_dout :
//                             data_arb_vc_v_dout[1] && vc_shift_decr ? (vc_shift_dout[15:0] >> 1) |  (shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-4'h1)) :
//                             data_arb_vc_v_dout[0] && vc_shift_decr ? (vc_shift_dout[15:0] >> 1) & ((shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-4'h1)) ^ vc0_mask) : 
//                             data_arb_vc_v_dout[1] ? vc_shift_dout[15:0] |  (shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]) :
//                             data_arb_vc_v_dout[0] ? vc_shift_dout[15:0] & ((shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]) ^ vc0_mask) : 
//                             vc_shift_decr ? vc_shift_dout >> 1 : vc_shift_dout;

//assign vc_shifted_reg_value_temp_1[18:0] = (shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-4'h1));
//assign vc_shifted_reg_value_temp_0[19:0] = (shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]);
assign vc_shifted_reg_value_temp_1[18:0] = ({15'b0, shift_reg_value[3:0]} <<< (vc_shift_load_ptr_dout[3:0]-4'h1));
assign vc_shifted_reg_value_temp_0[19:0] = ({16'b0, shift_reg_value[3:0]} <<< vc_shift_load_ptr_dout[3:0]);
assign vc_shift_din[15:0] = (ctl_flit_parse_done_dout && crc_error_s3_dout && ~(control_parsing_start || crc_flush_inprog_dout)) ? vc_shift_verified_dout :
                            data_arb_vc_v_dout[1] && vc_shift_decr ? (vc_shift_dout[15:0] >> 1) |  (vc_shifted_reg_value_temp_1[15:0]) :
                            data_arb_vc_v_dout[0] && vc_shift_decr ? (vc_shift_dout[15:0] >> 1) & ((vc_shifted_reg_value_temp_1[15:0]) ^ vc0_mask) : 
                            data_arb_vc_v_dout[1] ? vc_shift_dout[15:0] |  (vc_shifted_reg_value_temp_0[15:0]) :
                            data_arb_vc_v_dout[0] ? vc_shift_dout[15:0] & ((vc_shifted_reg_value_temp_0[15:0]) ^ vc0_mask) : 
                            vc_shift_decr ? vc_shift_dout >> 1 : vc_shift_dout;
//-----------                          
                                  

//Config hint shift register  
assign crc_reset = (ctl_flit_parse_done_dout & crc_error_s3_dout & ~(control_parsing_start | crc_flush_inprog_dout));
assign data_arb_cfg_hint_din = data_arb_cfg_hint;
                      
//-----------                          
// assign cfg_shift_din[15:0] = (ctl_flit_parse_done_dout && crc_error_s3_dout && ~(control_parsing_start || crc_flush_inprog_dout)) ? cfg_shift_verified_dout :                            
//                             data_arb_cfg_hint_dout && vc_shift_decr ? (cfg_shift_dout[15:0] >> 1) | (shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-1)) :                             
//                             data_arb_cfg_hint_dout ? cfg_shift_dout[15:0] | (shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]) :
//                             |data_arb_vc_v_dout && vc_shift_decr ? (cfg_shift_dout[15:0] >> 1) & ((shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-1)) ^ vc0_mask) :
//                             |data_arb_vc_v_dout ? cfg_shift_dout[15:0] & ((shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]) ^ vc0_mask) : 
//                            vc_shift_decr ? cfg_shift_dout >> 1 : cfg_shift_dout;

// assign cfg_shifted_reg_value_temp_1[18:0] = (shift_reg_value[3:0] <<< (vc_shift_load_ptr_dout[3:0]-4'h1));
// assign cfg_shifted_reg_value_temp_0[19:0] = (shift_reg_value[3:0] <<< vc_shift_load_ptr_dout[3:0]);
assign cfg_shift_din[15:0] = (ctl_flit_parse_done_dout && crc_error_s3_dout && ~(control_parsing_start || crc_flush_inprog_dout)) ? cfg_shift_verified_dout :                            
                            data_arb_cfg_hint_dout && vc_shift_decr ? (cfg_shift_dout[15:0] >> 1) |  (vc_shifted_reg_value_temp_1[15:0]) :                             
                            data_arb_cfg_hint_dout ? cfg_shift_dout[15:0] | (vc_shifted_reg_value_temp_0[15:0]) :
                            |data_arb_vc_v_dout && vc_shift_decr    ? (cfg_shift_dout[15:0] >> 1) & ((vc_shifted_reg_value_temp_1[15:0]) ^ vc0_mask) :
                            |data_arb_vc_v_dout    ? cfg_shift_dout[15:0] & ((vc_shifted_reg_value_temp_0[15:0]) ^ vc0_mask) : 
                            vc_shift_decr ? cfg_shift_dout >> 1 : cfg_shift_dout;

//-----------
                    
//-----------
// assign cfg_shift_verified_din[15:0] = control_parsing_start && data_arb_cfg_hint_dout ? {12'b0,shift_reg_value} :
//                                    control_parsing_start && |data_arb_vc_v_dout ? 16'b0 :
//                                    data_arb_cfg_hint_dout ? cfg_shift_verified_dout[15:0] | (shift_reg_value[3:0] <<< vc_shift_verif_ptr_dout[3:0]) :
//                                    |data_arb_vc_v_dout ? cfg_shift_verified_dout[15:0] & ((shift_reg_value[3:0] <<< vc_shift_verif_ptr_dout[3:0]) ^ vc0_mask) :
//                                    cfg_shift_verified_dout;

//assign cfg_shifted_reg_verified_temp[19:0] = (shift_reg_value[3:0] <<< vc_shift_verif_ptr_dout[3:0]);
assign cfg_shifted_reg_verified_temp[19:0] = ({16'b0, shift_reg_value[3:0]} <<< vc_shift_verif_ptr_dout[3:0]);
assign cfg_shift_verified_din[15:0] = control_parsing_start && data_arb_cfg_hint_dout ? {12'b0,shift_reg_value} :
                                   control_parsing_start && |data_arb_vc_v_dout ? 16'b0 :
                                   data_arb_cfg_hint_dout ? cfg_shift_verified_dout[15:0] |  (cfg_shifted_reg_verified_temp[15:0]) :
                                   |data_arb_vc_v_dout    ? cfg_shift_verified_dout[15:0] & ((cfg_shifted_reg_verified_temp[15:0]) ^ vc0_mask) :
                                   cfg_shift_verified_dout;
//-----------

assign data_arb_cfg_offset_din = data_arb_cfg_offset;
assign cfg_offset_incr = data_arb_cfg_hint_dout;
assign cfg_offset_decr = cfg_data_v_dout;
assign cfg_offset_hold = data_arb_cfg_hint_dout & cfg_data_v_dout;
assign cfg_offset_wr_ptr_din[1:0] =  crc_reset ? cfg_offset_verif_ptr_dout:
                                     cfg_offset_hold ? cfg_offset_wr_ptr_dout:
                                     cfg_offset_incr ? cfg_offset_wr_ptr_dout + 2'b01:
                                     cfg_offset_decr ? cfg_offset_wr_ptr_dout - 2'b01: cfg_offset_wr_ptr_dout;
assign cfg_offset_verif_ptr_din[1:0] = control_parsing_start && cfg_offset_incr ? 2'b01: //indicates start of a new frame
                                       cfg_offset_incr ? cfg_offset_verif_ptr_dout + 2'b01: 
                                       control_parsing_start ? 2'b00 : cfg_offset_verif_ptr_dout;                                     
assign cfg_shift = cfg_data_v_dout;
assign cfg_wr = data_arb_cfg_hint_dout;                                     
assign cfg_offset_shift0_din[3:0] = crc_reset ? cfg_offset_verif_shift0_dout :
                                    cfg_offset_hold && (cfg_offset_wr_ptr_dout - 2'b01 == 2'b00) ? data_arb_cfg_offset_dout:
                                    cfg_wr && (cfg_offset_wr_ptr_dout == 2'b00) ? data_arb_cfg_offset_dout :
                                    cfg_shift ? cfg_offset_shift1_dout : cfg_offset_shift0_dout;
assign cfg_offset_shift1_din[3:0] = crc_reset ? cfg_offset_verif_shift1_dout :
                                    cfg_offset_hold && (cfg_offset_wr_ptr_dout - 2'b01 == 2'b01) ? data_arb_cfg_offset_dout:
                                    cfg_wr && (cfg_offset_wr_ptr_dout == 2'b01) ? data_arb_cfg_offset_dout :
                                    cfg_shift ? cfg_offset_shift2_dout : cfg_offset_shift1_dout; 
assign cfg_offset_shift2_din[3:0] = crc_reset ? cfg_offset_verif_shift0_dout :
                                    cfg_offset_hold && (cfg_offset_wr_ptr_dout - 2'b01 == 2'b10) ? data_arb_cfg_offset_dout:
                                    cfg_wr && (cfg_offset_wr_ptr_dout == 2'b10) ? data_arb_cfg_offset_dout :
                                    cfg_shift ? cfg_offset_shift3_dout : cfg_offset_shift2_dout;
assign cfg_offset_shift3_din[3:0] = crc_reset ? cfg_offset_verif_shift0_dout :
                                    cfg_offset_hold && (cfg_offset_wr_ptr_dout - 2'b01 == 2'b11) ? data_arb_cfg_offset_dout:
                                    cfg_wr && (cfg_offset_wr_ptr_dout == 2'b11) ? data_arb_cfg_offset_dout :
                                    cfg_shift ? 4'h0 : cfg_offset_shift3_dout; 
//Verified shift register                                    
assign cfg_offset_verif_shift0_din[3:0] = bookend_flit_v ? 4'h0 :
                                          cfg_wr && (cfg_offset_wr_ptr_dout == 2'b00) ? data_arb_cfg_offset_dout : cfg_offset_verif_shift0_dout;
assign cfg_offset_verif_shift1_din[3:0] = bookend_flit_v ? 4'h0 :
                                          cfg_wr && (cfg_offset_wr_ptr_dout == 2'b01) ? data_arb_cfg_offset_dout : cfg_offset_verif_shift1_dout;                                           
assign cfg_offset_verif_shift2_din[3:0] = bookend_flit_v ? 4'h0 :
                                          cfg_wr && (cfg_offset_wr_ptr_dout == 2'b10) ? data_arb_cfg_offset_dout : cfg_offset_verif_shift2_dout;
assign cfg_offset_verif_shift3_din[3:0] = bookend_flit_v ? 4'h0 :
                                          cfg_wr && (cfg_offset_wr_ptr_dout == 2'b11) ? data_arb_cfg_offset_dout :cfg_offset_verif_shift3_dout;                                                                                                                                      
//Pull data from exits
assign rd_stg9_v_clone_dcp0 = pipe_v_dout[9] & (vc_shift_load_ptr_dout_clone_dcp0 > 4'b0);
assign rd_stg6_v_clone_dcp0 = pipe_v_dout[6] & ~(|pipe_v_dout[9:7]) & (vc_shift_load_ptr_dout_clone_dcp0 > 4'b0);
assign rd_stg5_v_clone_dcp0 = pipe_v_dout[5] & ~(|pipe_v_dout[9:6]) & (vc_shift_load_ptr_dout_clone_dcp0 > 4'b0);
assign rd_stg4_v_clone_dcp0 = pipe_v_dout[4] & ~(|pipe_v_dout[9:5]) & (vc_shift_load_ptr_dout_clone_dcp0 > 4'b0);
assign rd_stg3_v_clone_dcp0 = pipe_v_dout[3] & ~(|pipe_v_dout[9:4]) & (vc_shift_load_ptr_dout_clone_dcp0 > 4'b0);


assign rd_stg9_v_clone_dcp1 = pipe_v_clone_dout[9] & vc_shift_load_ptr_dout_clone_dcp1 > 4'b0;
assign rd_stg6_v_clone_dcp1 = pipe_v_clone_dout[6] & ~(|pipe_v_clone_dout[9:7]) & vc_shift_load_ptr_dout_clone_dcp1 > 4'b0;
assign rd_stg5_v_clone_dcp1 = pipe_v_clone_dout[5] & ~(|pipe_v_clone_dout[9:6]) & vc_shift_load_ptr_dout_clone_dcp1 > 4'b0;
assign rd_stg4_v_clone_dcp1 = pipe_v_clone_dout[4] & ~(|pipe_v_clone_dout[9:5]) & vc_shift_load_ptr_dout_clone_dcp1 > 4'b0;
assign rd_stg3_v_clone_dcp1 = pipe_v_clone_dout[3] & ~(|pipe_v_clone_dout[9:4]) & vc_shift_load_ptr_dout_clone_dcp1 > 4'b0;

assign rd_stg9_v_clone_cfg = pipe_v_clone_cfg_dout[9] & vc_shift_load_ptr_dout_clone_cfg > 4'b0;
assign rd_stg6_v_clone_cfg = pipe_v_clone_cfg_dout[6] & ~(|pipe_v_clone_cfg_dout[9:7]) & vc_shift_load_ptr_dout_clone_cfg > 4'b0;
assign rd_stg5_v_clone_cfg = pipe_v_clone_cfg_dout[5] & ~(|pipe_v_clone_cfg_dout[9:6]) & vc_shift_load_ptr_dout_clone_cfg > 4'b0;
assign rd_stg4_v_clone_cfg = pipe_v_clone_cfg_dout[4] & ~(|pipe_v_clone_cfg_dout[9:5]) & vc_shift_load_ptr_dout_clone_cfg > 4'b0;
assign rd_stg3_v_clone_cfg = pipe_v_clone_cfg_dout[3] & ~(|pipe_v_clone_cfg_dout[9:4]) & vc_shift_load_ptr_dout_clone_cfg > 4'b0;



assign dcp0_data_v = (rd_stg4_v_clone_dcp0 | rd_stg3_v_clone_dcp0 | rd_stg5_v_clone_dcp0 | rd_stg6_v_clone_dcp0 | rd_stg9_v_clone_dcp0) & ~vc_shift_dout[0];
assign dcp1_data_v = (rd_stg4_v_clone_dcp1 | rd_stg3_v_clone_dcp1 | rd_stg5_v_clone_dcp1 | rd_stg6_v_clone_dcp1 | rd_stg9_v_clone_dcp1) & (vc_shift_dout[0] & ~cfg_shift_dout[0]);

assign dcp0_data = (rd_stg9_v_clone_dcp0) ? data_pipe9_dout :
                   (rd_stg6_v_clone_dcp0) ? data_pipe6_dout :
                   (rd_stg5_v_clone_dcp0) ? data_pipe5_dout :
                   (rd_stg3_v_clone_dcp0) ? data_pipe3_dout :
                   (rd_stg4_v_clone_dcp0) ? data_pipe4_dout : 512'b0; 
                   
assign dcp1_data_wire = (rd_stg9_v_clone_dcp1) ? data_pipe9_dout :
                   (rd_stg6_v_clone_dcp1) ? data_pipe6_dout :
                   (rd_stg5_v_clone_dcp1) ? data_pipe5_dout :
                   (rd_stg3_v_clone_dcp1) ? data_pipe3_dout :
                   (rd_stg4_v_clone_dcp1) ? data_pipe4_dout : 512'b0;
assign dcp1_data = dcp1_data_wire;
//                   
assign bookend_flit_din = (pars_data_valid || crc_error) ? 1'b0 :
                          (bookend_flit_v) ? 1'b1 : bookend_flit_dout;                            
assign good_crc = bookend_flit_dout | (|(good_crc_shift_dout[8:0] & pipe_v_dout[9:1]));  
assign crc_flush_done = crc_flush_done_wire;
assign crc_flush_inprog = crc_flush_inprog_din;    

assign cfg_data_v_din = (rd_stg4_v_clone_cfg | rd_stg3_v_clone_cfg | rd_stg5_v_clone_cfg | rd_stg6_v_clone_cfg | rd_stg9_v_clone_cfg) & (vc_shift_dout[0] & cfg_shift_dout[0]);
assign cfg_data_v_s1_din = cfg_data_v_dout & ~crc_reset;
assign cfg_data_v = cfg_data_v_s1_dout;                                       
assign cfg_data_bus_din = dcp1_data_wire;
assign cfg_data_bus = cfg_data_bus_reg;
assign cfg_data_cnt_v = cfg_data_v_din; //Need to send cfg valid to cmd logic to meet timing
endmodule




