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

// File Name          :  thymesisflow_32_bckpressure_egress
// Project            :  ThymesisFlow disagreggated memory
//                       Implements an credit scheme to guard overflows of remote endpoints. 
//                       this side receives returned credits of the ingress side and returns them
//                       while it consumes a credit of the remote side for each flit it sends out. 
// ******************************************************************************************************************************
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_32B_bckpressure_egress (

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
  
  //Credit manager interface
  , input      [7:0]    port_creds_avail         
  , output              port_consume_creds
  , output     [7:0]    port_initial_creds
  , input      [7:0]    local_rx_creds
  , output              local_rx_getall


);

parameter INIT_CREDS_COUNT = 8'hfe;
`define OCX_FLIT_CMD_CREDS   34:27

reg [255:0]  outdata_q;
reg          outdata_vld;
 


assign  port_initial_creds =  INIT_CREDS_COUNT; 

//port ready signals
wire bckpr_off; //if even one credit is available bckpr is off (= 1'b1)
wire port_rdy;

assign bckpr_off = | port_creds_avail;
//If the next queue is not ready or no credits are available then 
//this flit should be forwarded.
assign port_rdy = ((bckpr_out_tready == 1'b1) && (bckpr_off == 1'b1));

assign  bckpr_out_tdata  = outdata_q; 
//protect the valid in case port is considered not ready because credits run out. 
//the credits protect the remote queue so the local may be still able to receive. 
//if bckpr_out_tready is high. 
assign  bckpr_out_tvalid = outdata_vld & bckpr_off; 
 
//Encoding of the various flit cases based on OpenCAPI TL/TLx protocol
reg  [1:0] ocapi_sm;

parameter CMDFLIT     = 2'b01;
parameter DATAFLIT    = 2'b10;

wire   is_cmd;
assign is_cmd = ocapi_sm[0];

wire is_data;
assign is_data = ocapi_sm[1];

assign bckpr_in_tready = port_rdy;

wire [1:0] cmd_dl;
assign cmd_dl  = bckpr_in_tdata[167:166]; //according to the mapping

wire [1:0] resp_dl;
assign resp_dl = bckpr_in_tdata[227:226];

//Check command types
wire   is_writecmd;
assign is_writecmd = bckpr_in_tdata[253];

wire   is_respRok;
assign is_respRok  = ((bckpr_in_tdata[250] == 1'b1) && (bckpr_in_tdata[248] == 1'b0));

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
              if ((port_rdy == 1'b1) && (bckpr_in_tvalid == 1'b1) &&
                                                ((is_writecmd == 1'b1) || (is_respRok == 1'b1))) //Commands with dataflits
                 begin
                    ocapi_sm    <= DATAFLIT;
                    dflit_size  <= 3'b100;
                 end
            end
       DATAFLIT:                                   
	    begin
              if ((port_rdy == 1'b1) && (bckpr_in_tvalid == 1'b1) && (dflit_size != 3'b001)) //Commands with dataflits
                     dflit_size <= dflit_size - 3'b001;
                 else if ((port_rdy == 1'b1) && (bckpr_in_tvalid == 1'b1))
                     ocapi_sm  <= CMDFLIT; 
            end
    endcase
end    


//Timing closure permitting this should be converted to combinational.
always @(posedge(clock))
begin
  if ((is_cmd == 1'b1) && (bckpr_in_tvalid == 1'b1) && (port_rdy == 1'b1)) //Cmd flit out
     begin
        outdata_q[255:35]               <= bckpr_in_tdata[255:35];//or resp is located at the higher part
        outdata_q[`OCX_FLIT_CMD_CREDS]  <= local_rx_creds; //adding local credits to be returned.
        outdata_q[26:0]                 <= bckpr_in_tdata[26:0];
        outdata_vld                     <= 1'b1;
     end 
  else if ((is_data == 1'b1) && (bckpr_in_tvalid == 1'b1) && (port_rdy == 1'b1)) //Data flit out
     begin
        outdata_q                       <= bckpr_in_tdata;
        outdata_vld                     <= 1'b1;
     end
  else
     begin
        outdata_q                       <=  (port_rdy == 1'b1) ? 256'b0 : outdata_q;
        outdata_vld                     <=  (port_rdy == 1'b1) ? 1'b0   : outdata_vld;
     end
end


//credit consumption handling in the same cycle with combinational logic
assign port_consume_creds =  ((port_rdy == 1'b1)  && (bckpr_in_tvalid == 1'b1));

assign local_rx_getall    =  ((port_rdy == 1'b1) && (bckpr_in_tvalid == 1'b1) && (is_cmd == 1'b1));                                                                                                                                       
                            
endmodule
