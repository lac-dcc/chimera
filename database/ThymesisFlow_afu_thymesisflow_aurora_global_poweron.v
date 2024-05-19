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
module aurora_power_on_reset  (
    input              clock                   // Clock - needs to be the aurora init_clk and needs to be stable.
  , input              reset_n                   // needs to be active high early reset (ocde - would be fine)
  , input              sys_out_aurora_r   // Let's you know when to deassert rb
  , output             pma_init                // locally registered to meet timing.
  , output             rpb                // 
  , output             rout_n
) ;

reg pos_pma_init_q;
reg pos_reset_pb_q;
reg pos_reset_logic_n_q;

reg pow_pma_init_q;
reg pow_reset_pb_q;
reg pow_reset_logic_n_q;

reg ce_pma_init_q;
reg ce_reset_pb_q;
reg ce_reset_logic_n_q;

reg dsor_pma_init_q;
reg dsor_reset_pb_q;
reg dsor_reset_logic_n_q;

reg oor_pma_init_q;
reg oor_reset_pb_q;
reg oor_reset_logic_n_q;


reg[7:0] cycle_counter_poweron;
reg[7:0] cycle_counter_poweron2;
//These regs should go to the core
assign pma_init = pos_pma_init_q | pow_pma_init_q | ce_pma_init_q | dsor_pma_init_q | oor_pma_init_q;
assign rpb = pos_reset_pb_q | pow_reset_pb_q | ce_reset_pb_q | dsor_reset_pb_q | oor_reset_pb_q;
assign rout_n = pos_reset_logic_n_q | pow_reset_logic_n_q | ce_reset_logic_n_q | dsor_reset_logic_n_q | oor_reset_logic_n_q;

reg [2:0]  SM;
parameter  POWER_ON_SEQ = 3'b000;
parameter  POWER_ON_WAIT = 3'b001;
parameter  COUNTER_EXPIRED = 3'b010;
parameter  DETECT_SYS_OUT_RESET_HIGH = 3'b011;
parameter  OUT_OF_RESET = 3'b100;

always @(posedge(clock))     
  if (SM == POWER_ON_SEQ) 
      begin
         pos_reset_logic_n_q <= 1'b0;//Activate reset
         pos_pma_init_q <= 1'b1; //assert active low pma_init_q for power_on
         pos_reset_pb_q <= 1'b1; //assert pma_init_q for 
         cycle_counter_poweron <= 8'h20; 
      end 
  else 
      begin
         cycle_counter_poweron <= cycle_counter_poweron - 8'h01; 
         pos_reset_logic_n_q <= 1'b0;//invalidate for or gate
         pos_pma_init_q <= 1'b0; //invalidate for or gate
         pos_reset_pb_q <= 1'b0; //invalidatae for or gate
      end 

        
always @(posedge(clock))           
  if (SM == POWER_ON_WAIT) 
     begin
         pow_reset_logic_n_q <= 1'b0;//maintain reset
         pow_pma_init_q <= 1'b1; //maintain assert pma_init_q for power_on
         pow_reset_pb_q <= 1'b1; //maintain assert pma_init_q for 
     end
  else 
     begin
         pow_reset_logic_n_q <= 1'b0;
         pow_pma_init_q <= 1'b0; 
         pow_reset_pb_q <= 1'b0;  
     end

always @(posedge(clock))     
  if (SM == COUNTER_EXPIRED)
     begin
         ce_reset_logic_n_q <= 1'b0;//maintain reset
         ce_pma_init_q <= 1'b0; //deassert pma_init_q for power_on
         ce_reset_pb_q <= 1'b1; //maintain assert pma_init_q for 
         cycle_counter_poweron2 <= 8'h20;  
     end 
  else  
     begin
         cycle_counter_poweron2 <= cycle_counter_poweron2 - 8'h01; 
         ce_reset_logic_n_q <= 1'b0;
         ce_pma_init_q <= 1'b0; 
         ce_reset_pb_q <= 1'b0;  
     end 

always @(posedge(clock))     
   if (SM == DETECT_SYS_OUT_RESET_HIGH)
     begin 
         dsor_reset_logic_n_q <= 1'b0;//maintain reset
         dsor_pma_init_q <= 1'b0; //maintain deassert pma_init_q for power_on
         dsor_reset_pb_q <= 1'b1; //maintain assert
     end 
   else 
     begin 
          dsor_reset_logic_n_q <= 1'b0;
          dsor_pma_init_q <= 1'b0; 
          dsor_reset_pb_q <= 1'b0;  
     end 

always @(posedge(clock))     
   if(SM == OUT_OF_RESET)
     begin
         oor_reset_logic_n_q <= 1'b1;//deassert reset (active low)
         oor_pma_init_q <= 1'b0; //maintain deassert pma_init_q for power_on
         oor_reset_pb_q <= 1'b0; //deassert rb
     end
   else
     begin
         oor_reset_logic_n_q <= 1'b0;
         oor_pma_init_q <= 1'b0; 
         oor_reset_pb_q <= 1'b0; 
     end
  
//State machine handling
always @(posedge(clock))
  if (reset_n == 1'b0) 
     begin
          SM <= POWER_ON_SEQ; 
     end  
  else
    begin 
    case (SM)
      POWER_ON_SEQ:
          SM <= POWER_ON_WAIT; 
      POWER_ON_WAIT: 
          if (cycle_counter_poweron == 8'h0) 
               SM <= COUNTER_EXPIRED;
          else SM <= POWER_ON_WAIT;
      COUNTER_EXPIRED:
               SM <= DETECT_SYS_OUT_RESET_HIGH;
      DETECT_SYS_OUT_RESET_HIGH:
          if  (cycle_counter_poweron2 == 8'h0)
               SM <= OUT_OF_RESET;
          else SM <= DETECT_SYS_OUT_RESET_HIGH;    
      OUT_OF_RESET:
          SM <= OUT_OF_RESET; //lock in this state permanently.             
    endcase
   end
endmodule
