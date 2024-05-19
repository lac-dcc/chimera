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
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_llc_ingress_driver (

    input              clock                   // Clock - samples & launches data on rising edge
  , input              reset_n                //  Active Low

  // 32B incoming data Interface
  , input   [255:0]     driver_in_tdata
  , input               driver_in_tvalid
  , output              driver_in_tready

  // 32B AXI-STREAM 
  , output  [255:0]     driver_out_tdata     
  , output              driver_out_tvalid         
  , input               driver_out_tready
);


reg [255:0]  outdata_q;
reg          outdata_vld;
 
assign  driver_out_tdata  = outdata_q; 
assign  driver_out_tvalid = outdata_vld; 



//Encoding of the various flit cases based on OpenCAPI TL/TLx protocol
reg  [1:0] ocapi_sm;

parameter CMDFLIT     = 2'b01;
parameter DATAFLIT    = 2'b10;

wire   is_cmd;
assign is_cmd = ocapi_sm[0];

wire   is_data;
assign is_data = ocapi_sm[1];


wire [1:0] cmd_dl;
assign cmd_dl  = driver_in_tdata[167:166]; //according to the mapping

wire [1:0] resp_dl;
assign resp_dl = driver_in_tdata[227:226];

//Check command types
wire   is_writecmd;
assign is_writecmd = driver_in_tdata[253];

wire   is_readcmd;
assign is_readcmd = driver_in_tdata[252];

wire   is_nopcmd;
assign is_nopcmd  =  ((driver_in_tdata[254] == 1'b1) && (driver_in_tdata[249] == 1'b0));

wire   is_respRok;
assign is_respRok  = ((driver_in_tdata[250] == 1'b1) && (driver_in_tdata[248] == 1'b0));

wire   is_respWok;
assign is_respWok  = ((driver_in_tdata[251] == 1'b1) && (driver_in_tdata[248] == 1'b0));

//we eat up nop cmds here so the other side does not have to be ready to process those. -- this is interfaced to aurora parser so it needs to be always ready
assign driver_in_tready = (driver_out_tready == 1'b1) || ((is_nopcmd == 1'b1) && (is_cmd == 1'b1) && (driver_in_tvalid == 1'b1)); 

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
              if ((driver_out_tready == 1'b1) && (driver_in_tvalid == 1'b1) &&
                                                ((is_writecmd == 1'b1) || (is_respRok == 1'b1))) //Commands with dataflits
                 begin
                    ocapi_sm    <= DATAFLIT;
                    dflit_size  <= 3'b100;
                 end
            end
       DATAFLIT:                                   
	    begin
              if ((driver_out_tready == 1'b1) && (driver_in_tvalid == 1'b1) && (dflit_size != 3'b001)) //Commands with dataflits
                     dflit_size <= dflit_size - 3'b001;
                 else if ((driver_out_tready == 1'b1) && (driver_in_tvalid == 1'b1))
                     ocapi_sm  <= CMDFLIT; 
            end
    endcase
end    


//Data and command 
always @(posedge(clock))
begin  //this is the first network Rx moduls so make sure only allowed commands get through.
  if (reset_n == 1'b0) 
    begin
       outdata_q   <= 256'b0;
       outdata_vld <= 1'b0;
    end
  else if ((is_cmd == 1'b1) && (driver_in_tvalid == 1'b1) && (driver_out_tready == 1'b1) && (is_nopcmd == 1'b0)) //Cmd flit out
     begin
        outdata_q                 <= driver_in_tdata;
        outdata_vld               <= 1'b1;
     end 
  else if ((is_data == 1'b1) && (driver_in_tvalid == 1'b1) && (driver_out_tready == 1'b1)) //Data flit out
     begin
        outdata_q                 <= driver_in_tdata;
        outdata_vld               <= 1'b1;
     end
  else if (driver_out_tready == 1'b1)
     begin
        outdata_q                 <= 256'b0;
        outdata_vld               <=   1'b0;
     end
end

                            
endmodule
