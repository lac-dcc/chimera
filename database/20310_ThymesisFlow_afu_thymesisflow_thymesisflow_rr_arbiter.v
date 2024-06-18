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
// File Name          :  thymesisflow_rr_arbiter
// Project            :  ThymesisFlow disagreggated memory
//                       Round robin arbiter
// ******************************************************************************************************************************
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_rr_arbiter
 #(parameter SIZE = 2) (

    input              clock                   // Clock - samples & launches data on rising edge
  , input              reset_n                //  Active Low

  // fifo_in AXI-STREAM 
   , input  [SIZE-1:0]  request_vector
   , input              request_nxt
   , output [SIZE-1:0]  selected

);

reg [SIZE-1:0] masked_req_vector;//snapshot of the request input.


//masked req vector
always @(posedge(clock))
begin
  if (reset_n == 1'b0) //Reset active 
     begin
       masked_req_vector <= 2'b0;
     end
  else if ((request_nxt == 1'b1) && (masked_req_vector == 2'b0)) //active
     begin
       masked_req_vector <= (request_vector ^ selected) & request_vector;  //empty mask means no history or rollover - so we just remove previous selection.
     end
  else if ((request_nxt == 1'b1))
     begin
       masked_req_vector <= (masked_req_vector ^ selected) & request_vector; //
     end
end

//Combinational to return selection immediately
assign selected = (masked_req_vector == 2'b0) ? request_vector & (~request_vector + 1) : masked_req_vector & (~masked_req_vector + 1); 

endmodule
