// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : power_ctrl_sm_lab1.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------
module power_ctrl_sm (

    // Clocks & Reset
    pclk,
    nprst,

    // Register Control inputs
    L1_module_req,
    set_status_module,
    clr_status_module,

    // Module control outputs
    rstn_non_srpg_module,
    gate_clk_module,
    isolate_module,
    save_edge,
    restore_edge,
    pwr1_on,
    pwr2_on

);

input    pclk;
input    nprst;

input    L1_module_req;
output   set_status_module;
output   clr_status_module;
    
output   rstn_non_srpg_module;
output   gate_clk_module;
output   isolate_module;
output   pwr1_on;
output   pwr2_on;
output save_edge;
output restore_edge;

wire    set_status_module;
wire    clr_status_module;

wire    rstn_non_srpg_module;
reg     gate_clk_module;
reg     isolate_module;
reg     pwr1_on;
reg     pwr2_on;

reg save_edge;

reg restore_edge;
   
// FSM state
reg  [3:0] currentState, nextState;
reg     rstn_non_srpg;

parameter Init = 0; 
parameter Clk_off = 1; 
parameter Wait1 = 2; 
parameter Isolate = 3; 
parameter Save_edge = 4; 
parameter Pre_pwr_off = 5; 
parameter Pwr_off = 6; 
parameter Pwr_on1 = 7; 
parameter Pwr_on2 = 8; 
parameter Restore_edge = 9; 
parameter Wait2 = 10; 
parameter De_isolate = 11; 
parameter Clk_on = 12; 
parameter Wait3 = 13; 
parameter Rst_clr = 14;


// Power Shut Off State Machine

// FSM combinational process
always @  (currentState or L1_module_req)
  begin
    case (currentState)

      // Commence PSO once the L1 req bit is set.
      Init:
        if (L1_module_req == 1'b1)
          nextState = Clk_off;         // Gate the module's clocks off
        else
          nextState = Init;            // Keep waiting in Init state
        
      Clk_off :
        nextState = Wait1;             // Wait for one cycle
 
      Wait1  :                         // Wait for clk gating to take effect
        nextState = Isolate;           // Start the isolation process
          
      Isolate :
        nextState = Save_edge;
        
      Save_edge :
        nextState = Pre_pwr_off;

      Pre_pwr_off :
        nextState = Pwr_off;
      // Exit PSO once the L1 req bit is clear.

      Pwr_off :
        if (L1_module_req == 1'b0)
          nextState = Pwr_on1;         // Resume power if the L1_module_req bit is cleared
        else
          nextState = Pwr_off;         // Wait until the L1_module_req bit is cleared
        
      Pwr_on1 :
        nextState = Pwr_on2;
          
      Pwr_on2 :
        nextState = Restore_edge;
          
      Restore_edge :
        nextState = Wait2;

      Wait2 :
        nextState = De_isolate;
          
      De_isolate :
        nextState = Clk_on;
          
      Clk_on :
        nextState = Wait3;
          
      Wait3  :                         // Wait for clock to resume
        nextState = Rst_clr ;     
 
      Rst_clr :
        nextState = Init;
        
      default  :                       // Catch all
        nextState = Init; 
        
    endcase
  end


  // Signals Sequential process - gate_clk_module
always @ (posedge pclk or negedge nprst)
  begin
    if (~nprst)
      gate_clk_module <= 1'b0;
    else 
      if (nextState == Clk_on | nextState == Wait3 | nextState == Rst_clr | 
          nextState == Init)
          gate_clk_module <= 1'b0;
      else
          gate_clk_module <= 1'b1;
  end

// Signals Sequential process - rstn_non_srpg
always @ (posedge pclk or negedge nprst)
  begin
    if (~nprst)
      rstn_non_srpg <= 1'b0;
    else
      if ( nextState == Init | nextState == Clk_off | nextState == Wait1 | 
           nextState == Isolate | nextState == Save_edge | nextState == Pre_pwr_off | nextState == Rst_clr)
        rstn_non_srpg <= 1'b1;
      else
        rstn_non_srpg <= 1'b0;
   end


// Signals Sequential process - pwr1_on & pwr2_on
always @ (posedge pclk or negedge nprst)
  begin
    if (~nprst)
      pwr1_on <=  1'b1;  // power gates 1 & 2 are on
    else
      if (nextState == Pwr_off )
        pwr1_on <= 1'b0;  // shut off both power gates 1 & 2
      else
        pwr1_on <= 1'b1;
  end


// Signals Sequential process - pwr1_on & pwr2_on
always @ (posedge pclk or negedge nprst)
  begin
    if (~nprst)
       pwr2_on <= 1'b1;      // power gates 1 & 2 are on
    else
      if (nextState == Pwr_off | nextState == Pwr_on1)
        pwr2_on <= 1'b0;     // shut off both power gates 1 & 2
      else
        pwr2_on <= 1'b1;
   end


// Signals Sequential process - isolate_module 
always @ (posedge pclk or negedge nprst)
  begin
    if (~nprst)
        isolate_module <= 1'b0;
    else
      if (nextState == Isolate | nextState == Save_edge | nextState == Pre_pwr_off |  nextState == Pwr_off | nextState == Pwr_on1 |
          nextState == Pwr_on2 | nextState == Restore_edge | nextState == Wait2)
         isolate_module <= 1'b1;       // Activate the isolate and retain signals
      else
         isolate_module <= 1'b0;        
   end    

// enabling save edge
always @ (posedge pclk or negedge nprst)
  begin
    if (~nprst)
        save_edge <= 1'b0;
    else
      if (nextState == Save_edge )
         save_edge <= 1'b1;       // Activate the isolate and retain signals
      else
         save_edge <= 1'b0;        
   end    

// enabling restore edge
always @ (posedge pclk or negedge nprst)
  begin
    if (~nprst)
        restore_edge <= 1'b0;
    else
      if (nextState == Restore_edge)
         restore_edge <= 1'b1;       // Activate the isolate and retain signals
      else
         restore_edge <= 1'b0;        
   end    


// FSM Sequential process
always @ (posedge pclk or negedge nprst)
  begin
    if (~nprst)
      currentState <= Init;
    else
      currentState <= nextState;
  end


// Reset for non-SRPG FFs is a combination of the nprst and the reset during PSO
assign  rstn_non_srpg_module = rstn_non_srpg & nprst;

assign  set_status_module = (nextState == Clk_off);    // Set the L1 status bit  
assign  clr_status_module = (currentState == Rst_clr); // Clear the L1 status bit  
  

`ifdef LP_ABV_ON

// psl default clock = (posedge pclk);

// Never have the set and clear status signals both set
// psl output_no_set_and_clear : assert never {set_status_module & clr_status_module};

// Add Gated clk and isolation assertion here


//
//
// Reset signal for Non-SRPG FFs and POWER signal for
// SMC should become LOW on clock cycle after Isolate 
// signal is activated
// psl output_pd_seq_stg_2:
//    assert always
//    {rose(isolate_module)} |=>
//    {[*2]; {{fell(rstn_non_srpg_module)} && {fell(pwr1_on)}} }
//    abort(~nprst);
//
//
// Whenever pwr1_on goes to LOW pwr2_on should also go to LOW
// psl output_pwr2_low:
//    assert always
//    { fell(pwr1_on) } |->  { fell(pwr2_on) }
//    abort(~nprst);
//
//
// Whenever pwr1_on becomes HIGH , On Next clock cycle pwr2_on
// should also become HIGH
// psl output_pwr2_high:
//    assert always
//    { rose(pwr1_on) } |=>  { (pwr2_on) }
//    abort(~nprst);
//
`endif


endmodule
