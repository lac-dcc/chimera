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
// Title    : lpc_tlx_afu_credit_mgr.v
// Function : This file increments and decrements credits from TLX to AFU, that are used to manage transfers from
//            AFU to TLX. Credits from the TLX start with an initial value (loaded at reset), then decrement in
//            integer amounts as the AFU consumes them. Credits are incremented by 1 whenever a signal from the
//            TLX is active in a cycle. Underflow (want to consume more credits than are available) and overflow
//            (received credits exceed the maximum count) are checked and output as error conditions.
//
// Parameterization: The maximum size of the counter can be passed in as a static parameter.
//
// -------------------------------------------------------------------
// @@@  Module Declaration
// ==============================================================================================================================
module lpc_tlx_afu_credit_mgr
  #(parameter MSB = 2)     // Bit number of most significant bit. i.e. a 3 bit counter, [2:0] has MSB=2
(
    // -----------------------------------
    // Miscellaneous Ports
    // -----------------------------------
    input          clock
  , input          reset                       // (active high)
  , input          resync_credits              // Reset credit counts when 1, start capturing/sending new credits on 1->0 transition

    // -----------------------------------
    // Credits from TLX
    // -----------------------------------
  , input  [MSB:0] tlx_initial_credit          // Number of starting credits from TLX
  , input          tlx_credit                  // Increment 1 credit each cycle the TLX sets this to 1


    // -----------------------------------
    // Consumption of credits by AFU
    // -----------------------------------
  , input  [MSB:0] afu_consume_credit_0        // The AFU may have multiple state machines that need to consume credits
  , input  [MSB:0] afu_consume_credit_1        // IMPORTANT: When an input is not used, set it to all 0s
  , input  [MSB:0] afu_consume_credit_2
  , input  [MSB:0] afu_consume_credit_3
  , input  [MSB:0] afu_consume_credit_4
  , input  [MSB:0] afu_consume_credit_5
  , input  [MSB:0] afu_consume_credit_6
  , input  [MSB:0] afu_consume_credit_7

    // -----------------------------------
    // Reclaimation of credits by AFU
    // -----------------------------------
  , input  [MSB:0] afu_reclaim_credit_0

    // -----------------------------------
    // Information on credits
    // -----------------------------------
  , output [MSB:0] credits_available           // Number of credits currently available
  , output         credit_overflow             // Error - received excess credits from TLX
  , output         credit_underflow            // Error - want to consume more credits than are currently available

) ;

// ==============================================================================================================================
// @@@  Combine consume requests
// ==============================================================================================================================
// In the first generation of AFU, the AFU works on one command at a time. Thus only one state machine should be requesting
// consumption of credits at any given time. With the assumption an input will be all 0s when not in use, a simple OR gate
// can be used to combine the consumption requests into a single vector.
wire [MSB:0] consume_credits;
assign consume_credits = afu_consume_credit_0 |
                         afu_consume_credit_1 |
                         afu_consume_credit_2 |
                         afu_consume_credit_3 |
                         afu_consume_credit_4 |
                         afu_consume_credit_5 |
                         afu_consume_credit_6 |
                         afu_consume_credit_7 ;

// If the AFU becomes more sophisticated and starts handling operations in parallel, this mechanism will need to become
// an adder, to sum up all requests in each cycle. However in this case underflow becomes more likely one operation is not
// necessarily aware of what other operations require, so combined they could request more credits than available. Therefore
// the interface may need to change to a request/grant style, allowing each to take turns getting credits to avoid this situation.

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
    if (reset == 1'b1 || resync_credits == 1'b1)
      credit_reg <= {1'b0,tlx_initial_credit};
    else
      // Increment by bulk credit reclaimation, a single pulse to reclaim 1 credit, or decrement by bulk consumption
      credit_reg <= credit_reg + {1'b0,afu_reclaim_credit_0} + { zerovec, tlx_credit } - {1'b0,consume_credits};
  end

assign credits_available = credit_reg[MSB:0];                                    // Pass credits available to external logic
assign credit_overflow   = credit_reg[MSB+1];                                    // Overflow if accumulate more credits than should be allowed
assign credit_underflow  = (consume_credits > (credit_reg[MSB:0] + afu_reclaim_credit_0)) ? 1'b1 : 1'b0;  // Underflow if ask for more credits than are available

endmodule
