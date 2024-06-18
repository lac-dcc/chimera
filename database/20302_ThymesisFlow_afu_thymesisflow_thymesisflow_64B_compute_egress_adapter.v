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
// Module designer: Dimitris Syrivelis
// Backup: Christian Pinto, Michele Gazzetti

`timescale 1ns / 10ps

// ******************************************************************************************************************************
// File Name          :  thymesisflow_64B_2x32B_bonding_egress
// Project            :  ThymesisFlow disagreggated memory
//                       Adapts the net_cmdfifo.v format to the 64B format and multiplexes in order command and dataflits for 
//                       network pipeline transmission
// ******************************************************************************************************************************
// ******************************************************************************************************************************
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_64B_compute_egress_adapter  (

    input               clock                   // Clock - samples & launches data on rising edge
  , input               reset_n                //  Active Low

  , input   [167:0]     adapter_in_cmd_tdata
  , input               adapter_in_cmd_tvalid
  , output              adapter_in_cmd_tready   

  // incoming data Interface with BDI
  , input   [519:0]     adapter_in_data_tdata
  , input               adapter_in_data_tvalid
  , output              adapter_in_data_tready

  // 64B AXI-STREAM 
  , output  [511:0]     adapter_out_tdata     
  , output              adapter_out_tvalid         
  , input               adapter_out_tready

);


//OCX_NET_CMD format           167:163 - AXI-S byte alignment ignored
`define OCX_NET_CMD_NETID      162:157
`define OCX_NET_CMD_OPCODE     156:149
`define OCX_NET_CMD_DL         148:147
`define OCX_NET_CMD_TAG        146:131
`define OCX_NET_CMD_PL         130:128
`define OCX_NET_CMD_BE         127:64
`define OCX_NET_CMD_EA          63:0


//OCX_FLIT_CMD format -- used for output
`define OCX_FLITO_NETID         296:291
`define OCX_FLITO_OPCODE        511:504
`define OCX_FLITO_DL            423:422
`define OCX_FLITO_ORIG_CAPPTAG  439:424
`define OCX_FLITO_PL            421:419
`define OCX_FLITO_BE            418:355
`define OCX_FLITO_EA            503:440


reg [511:0] output_q;
reg         output_q_vld;

assign adapter_out_tdata  = output_q;
assign adapter_out_tvalid = output_q_vld;

reg [1:0] ocapi_sm;
reg [2:0] dflit_size;

wire   is_writecmd;
assign is_writecmd = adapter_in_cmd_tdata[154];

wire  [1:0] cmd_dl;
assign cmd_dl = adapter_in_cmd_tdata[`OCX_NET_CMD_DL];

wire   is_cmd;
assign is_cmd = ocapi_sm[0];

wire   is_data;
assign is_data = ocapi_sm[1];

assign adapter_in_cmd_tready  = adapter_out_tready & is_cmd;
assign adapter_in_data_tready = adapter_out_tready & is_data;


parameter INPUT_CMD_RESP = 2'b01;
parameter INPUT_DATAFLIT = 2'b10;

//OpenCAPI protocol parsing
always @(posedge(clock))
begin
       if (reset_n == 1'b0)
    begin
      ocapi_sm                                     <= INPUT_CMD_RESP;
      dflit_size                                   <= 2'b00;
    end
   else
    case (ocapi_sm)
       INPUT_CMD_RESP:
            begin
              if ((adapter_in_cmd_tready == 1'b1) && (adapter_in_cmd_tvalid == 1'b1) && (is_writecmd == 1'b1))
                begin
                   dflit_size[2]                   <= cmd_dl[1]  &  cmd_dl[0];
                   dflit_size[1]                   <= cmd_dl[1]  & ~cmd_dl[0] ;
                   dflit_size[0]                   <= ~cmd_dl[1];
                   ocapi_sm                        <= INPUT_DATAFLIT;//next at input is cmd1
                end
            end
        INPUT_DATAFLIT:
            begin
              if ((adapter_in_data_tready == 1'b1) &&  (adapter_in_data_tvalid == 1'b1))
                begin
                   dflit_size                      <= dflit_size - 3'b001;
                   ocapi_sm                        <= (dflit_size == 3'b001)? INPUT_CMD_RESP : INPUT_DATAFLIT;  //next at input is  cmd0   
                end
            end
    endcase
end

//push data out
always @(posedge(clock))
begin
  if (reset_n == 1'b0)
    begin
      output_q     <= 512'b0;
      output_q_vld <=   1'b0;
    end
  else if ((adapter_in_cmd_tready == 1'b1)  && (adapter_in_cmd_tvalid == 1'b1))
    begin
       output_q[`OCX_FLITO_NETID]         <= adapter_in_cmd_tdata[`OCX_NET_CMD_NETID]; 
       output_q[`OCX_FLITO_OPCODE]        <= adapter_in_cmd_tdata[`OCX_NET_CMD_OPCODE]; 
       output_q[`OCX_FLITO_DL]            <= adapter_in_cmd_tdata[`OCX_NET_CMD_DL]; 
       output_q[`OCX_FLITO_ORIG_CAPPTAG]  <= adapter_in_cmd_tdata[`OCX_NET_CMD_TAG]; 
       output_q[`OCX_FLITO_PL]            <= adapter_in_cmd_tdata[`OCX_NET_CMD_PL]; 
       output_q[`OCX_FLITO_BE]            <= adapter_in_cmd_tdata[`OCX_NET_CMD_BE]; 
       output_q[`OCX_FLITO_EA]            <= adapter_in_cmd_tdata[`OCX_NET_CMD_EA]; 
       output_q_vld                       <= 1'b1;  
    end
  else if ((adapter_in_data_tready == 1'b1) &&  (adapter_in_data_tvalid == 1'b1))
    begin
       output_q                          <= adapter_in_data_tdata[511:0]; 
       output_q_vld                      <= 1'b1;
    end
  else if (adapter_out_tready == 1'b1)
       output_q_vld                      <= 1'b0;
end


endmodule


