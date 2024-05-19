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

`timescale 1ns / 1ps


// module implements credit manager logic that acts as housekeeping for backpressure credits.

// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module thymesisflow_credit_mgr
  #(parameter MSB = 2)     // Bit number of most significant bit. i.e. a 3 bit counter, [2:0] has MSB=2
(
    input          clock
  , input          resetn                       //active high
  , input          reset_counter

  , input  [MSB:0] initial_credits         // Number of starting credits from TLX
  , input  [MSB:0] returned_credits              // Increment 1 credit each cycle the TLX sets this to 1
  , input          get_all_credits

  , input          consume_credit

  , output [MSB:0] credits_available           // Number of credits currently available
  , output         credit_overflow             // Error - received excess credits from TLX
  , output         credit_underflow            // Error - want to consume more credits than are currently available

) ;


// ==============================================================================================================================
// @@@  Main counter
// ==============================================================================================================================
reg  [MSB+1:0] credit_reg;           // Make one bit larger so can check for overflow
wire   [MSB:0] zerovec;
wire [MSB+1:0] onevec;

assign zerovec = {(MSB+1){1'b0}};    // Define a string of 0s of the correct length to make comparisons easier to understand
assign onevec  = {zerovec, 1'b1};

always @(posedge(clock))
  begin
    if ((resetn == 1'b0) || (reset_counter == 1'b1))
      credit_reg <= {1'b0,initial_credits};
    else //get_all_credits gets all available credits (consume_credits has no effect in same cycle) else normal accounting is happening.
      credit_reg <= (get_all_credits == 1'b1) ?  {1'b0,returned_credits} : credit_reg + {1'b0,returned_credits} - {8'b0,consume_credit};
  end

assign credits_available = credit_reg[MSB:0];                                    // Pass credits available to external logic
assign credit_overflow   = credit_reg[MSB+1];                                    // Overflow if accumulate more credits than should be allowed
assign credit_underflow  = ({7'b0,consume_credit} > credit_reg[MSB:0]) ? 1'b1 : 1'b0;  // Underflow if ask for more credits than are available

endmodule
