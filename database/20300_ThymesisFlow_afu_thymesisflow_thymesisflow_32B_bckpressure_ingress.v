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
// File Name          :  thymesisflow_32B_bckpressure_ingress
// Project            :  ThymesisFlow disagreggated memory
//                       Ingress side of the credit scheme that protects the network facing serDES pipeline from overflows.
//                       It counts credits that have to be returned to the other side via the egress module of this side and
//                       also returns credits sent back from the other side.
// ******************************************************************************************************************************
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_32B_bckpressure_ingress (

    input              clock                   // Clock - samples & launches data on rising edge
  , input              reset_n                //  Active Low

  // 32B incoming data Interface
  , input   [255:0]     bckpr_in_tdata
  , input               bckpr_in_tvalid
  , output              bckpr_in_tready

  // 32B AXI-STREAM 
  , output  [255:0]     bckpr_out_tdata     
  , output              bckpr_out_tvalid         
  , input               bckpr_out_tready

  //Count local_rx_creds so you can send them back
  , output [7:0]       cnt_local_rx_creds
  , output [7:0]       local_creds_init

  //Return Credits of Remote Rx Ingress credits to local counter 
  , output [7:0]       ret_remote_rx_creds

);

parameter INIT_CREDS_COUNT = 8'h0;
`define OCX_FLIT_CMD_CREDS   34:27

reg [255:0]  outdata_q;
reg          outdata_vld;
 
assign  bckpr_out_tdata  = outdata_q; 
assign  bckpr_out_tvalid = outdata_vld; 

assign  local_creds_init =  INIT_CREDS_COUNT; 


//Encoding of the various flit cases based on OpenCAPI TL/TLx protocol
reg  [1:0] ocapi_sm;

parameter CMDFLIT     = 2'b01;
parameter DATAFLIT    = 2'b10;

wire   is_cmd;
assign is_cmd = ocapi_sm[0];

wire   is_data;
assign is_data = ocapi_sm[1];


wire [1:0] cmd_dl;
assign cmd_dl  = bckpr_in_tdata[167:166]; //according to the mapping

wire [1:0] resp_dl;
assign resp_dl = bckpr_in_tdata[227:226];

//Check command types
wire   is_writecmd;
assign is_writecmd = bckpr_in_tdata[253];


wire   is_respRok;
assign is_respRok  = ((bckpr_in_tdata[250] == 1'b1) && (bckpr_in_tdata[248] == 1'b0));

assign bckpr_in_tready = bckpr_out_tready; 

reg [2:0] dflit_size;


always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
      dflit_size     <= 3'b0;
      ocapi_sm       <= CMDFLIT;
    end
   else
    case (ocapi_sm) 
       CMDFLIT:                                   
	    begin
              if ((bckpr_out_tready == 1'b1) && (bckpr_in_tvalid == 1'b1) &&
                                                ((is_writecmd == 1'b1) || (is_respRok == 1'b1))) //Commands with dataflits
                 begin
                    ocapi_sm    <= DATAFLIT;
                    dflit_size  <= 3'b100;
                 end
            end
       DATAFLIT:                                   
	    begin
              if ((bckpr_out_tready == 1'b1) && (bckpr_in_tvalid == 1'b1) && (dflit_size != 3'b001) ) //Commands with dataflits
                     dflit_size <= dflit_size - 3'b001;
                 else if ((bckpr_out_tready == 1'b1) && (bckpr_in_tvalid == 1'b1))
                     ocapi_sm  <= CMDFLIT; 
            end
    endcase
end    


//Data and command 
always @(posedge(clock))
begin
  if ((is_cmd == 1'b1) && (bckpr_in_tvalid == 1'b1) && (bckpr_out_tready == 1'b1)) //Cmd flit out
     begin
        outdata_q                 <= bckpr_in_tdata;
        outdata_vld               <= 1'b1;
     end 
  else if ((is_data == 1'b1) && (bckpr_in_tvalid == 1'b1) && (bckpr_out_tready == 1'b1)) //Data flit out
     begin
        outdata_q                 <= bckpr_in_tdata;
        outdata_vld               <= 1'b1;
     end
  else
     begin
        outdata_q                 <= (bckpr_out_tready == 1'b1) ? 256'b0   :outdata_q;
        outdata_vld               <= (bckpr_out_tready == 1'b1) ?   1'b0   :outdata_vld;
     end
end

//return remote credits
assign ret_remote_rx_creds  = ((is_cmd == 1'b1) && (bckpr_in_tvalid == 1'b1) && (bckpr_out_tready == 1'b1)) ? bckpr_in_tdata[`OCX_FLIT_CMD_CREDS]: 8'b0;

//count local credits
assign cnt_local_rx_creds   = ((bckpr_in_tvalid == 1'b1) && (bckpr_out_tready == 1'b1)) ? 8'b1: 8'b0;
                            
endmodule
