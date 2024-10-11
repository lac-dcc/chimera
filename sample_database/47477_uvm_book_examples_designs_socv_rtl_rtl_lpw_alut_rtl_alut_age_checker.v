// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : alut_age_checker.v
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

module alut_age_checker
(   
   // Inputs
   pclk,
   n_p_reset,
   command,          
   div_clk,          
   mem_read_data_age,
   check_age,        
   last_accessed, 
   best_bfr_age,   
   add_check_active,

   // outputs
   curr_time,         
   mem_addr_age,      
   mem_write_age,     
   mem_write_data_age,
   lst_inv_addr_cmd,    
   lst_inv_port_cmd,  
   age_confirmed,     
   age_ok,
   inval_in_prog,  
   age_check_active          
);   

   input               pclk;               // APB clock                           
   input               n_p_reset;          // Reset                               
   input [1:0]         command;            // command bus                        
   input [7:0]         div_clk;            // clock divider value
   input [82:0]        mem_read_data_age;  // read data from memory             
   input               check_age;          // request flag for age check
   input [31:0]        last_accessed;      // time field sent for age check
   input [31:0]        best_bfr_age;       // best before age
   input               add_check_active;   // active flag from address checker

   output [31:0]       curr_time;          // current time,for storing in mem    
   output [7:0]        mem_addr_age;       // address for R/W to memory     
   output              mem_write_age;      // R/W flag (write = high)            
   output [82:0]       mem_write_data_age; // write data for memory             
   output [47:0]       lst_inv_addr_cmd;   // last invalidated addr normal op    
   output [1:0]        lst_inv_port_cmd;   // last invalidated port normal op    
   output              age_confirmed;      // validates age_ok result 
   output              age_ok;             // age checker result - set means in-date
   output              inval_in_prog;      // invalidation in progress
   output              age_check_active;   // bit 0 of status register           

   reg  [2:0]          age_chk_state;      // age checker FSM current state
   reg  [2:0]          nxt_age_chk_state;  // age checker FSM next state
   reg  [7:0]          mem_addr_age;     
   reg                 mem_write_age;    
   reg                 inval_in_prog;      // invalidation in progress
   reg  [7:0]          clk_div_cnt;        // clock divider counter
   reg  [31:0]         curr_time;          // current time,for storing in mem  
   reg                 age_confirmed;      // validates age_ok result 
   reg                 age_ok;             // age checker result - set means in-date
   reg [47:0]          lst_inv_addr_cmd;   // last invalidated addr normal op    
   reg [1:0]           lst_inv_port_cmd;   // last invalidated port normal op    

   wire  [82:0]        mem_write_data_age;
   wire  [31:0]        last_accessed_age;  // read back time by age checker
   wire  [31:0]        time_since_lst_acc_age;  // time since last accessed age
   wire  [31:0]        time_since_lst_acc; // time since last accessed address
   wire                age_check_active;   // bit 0 of status register           

// Parameters for Address Checking FSM states
   parameter idle           = 3'b000;
   parameter inval_aged_rd  = 3'b001;
   parameter inval_aged_wr  = 3'b010;
   parameter inval_all      = 3'b011;
   parameter age_chk        = 3'b100;

   parameter max_addr       = 8'hff;
   parameter max_cnt        = 32'hffff_ffff;

// -----------------------------------------------------------------------------
//   Generate current time counter
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      clk_div_cnt <= 8'd0;
   else if (clk_div_cnt == div_clk)
      clk_div_cnt <= 8'd0; 
   else 
      clk_div_cnt <= clk_div_cnt + 1'd1;
   end


always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      curr_time <= 32'd0;
   else if (clk_div_cnt == div_clk)
      curr_time <= curr_time + 1'd1;
   end


// -----------------------------------------------------------------------------
//   Age checker State Machine 
// -----------------------------------------------------------------------------
always @ (command or check_age or age_chk_state or age_confirmed or age_ok or
          mem_addr_age or mem_read_data_age[82])
   begin
      case (age_chk_state)
      
      idle:
         if (command == 2'b10)
            nxt_age_chk_state = inval_aged_rd;
         else if (command == 2'b11)
            nxt_age_chk_state = inval_all;
         else if (check_age)
            nxt_age_chk_state = age_chk;
         else
            nxt_age_chk_state = idle;

      inval_aged_rd:
            nxt_age_chk_state = age_chk;

      inval_aged_wr:
            nxt_age_chk_state = idle;

      inval_all:
         if (mem_addr_age != max_addr)
            nxt_age_chk_state = inval_all;  // move onto next address
         else
            nxt_age_chk_state = idle;

      age_chk:
         if (age_confirmed)
            begin
            if (add_check_active)                     // age check for addr chkr
               nxt_age_chk_state = idle;
            else if (~mem_read_data_age[82])      // invalid, check next location
               nxt_age_chk_state = inval_aged_rd; 
            else if (~age_ok & mem_read_data_age[82]) // out of date, clear 
               nxt_age_chk_state = inval_aged_wr;
            else if (mem_addr_age == max_addr)    // full check completed
               nxt_age_chk_state = idle;     
            else 
               nxt_age_chk_state = inval_aged_rd; // age ok, check next location 
            end       
         else
            nxt_age_chk_state = age_chk;

      default:
            nxt_age_chk_state = idle;
      endcase
   end



always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      age_chk_state <= idle;
   else
      age_chk_state <= nxt_age_chk_state;
   end


// -----------------------------------------------------------------------------
//   Generate memory RW bus for accessing array when requested to invalidate all
//   aged addresses and all addresses.
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
   begin
      mem_addr_age <= 8'd0;     
      mem_write_age <= 1'd0;    
   end
   else if (age_chk_state == inval_aged_rd)  // invalidate aged read
   begin
      mem_addr_age <= mem_addr_age + 1'd1;     
      mem_write_age <= 1'd0;    
   end
   else if (age_chk_state == inval_aged_wr)  // invalidate aged read
   begin
      mem_addr_age <= mem_addr_age;     
      mem_write_age <= 1'd1;    
   end
   else if (age_chk_state == inval_all)  // invalidate all
   begin
      mem_addr_age <= mem_addr_age + 1'd1;     
      mem_write_age <= 1'd1;    
   end
   else if (age_chk_state == age_chk)
   begin
      mem_addr_age <= mem_addr_age;     
      mem_write_age <= mem_write_age;    
   end
   else 
   begin
      mem_addr_age <= mem_addr_age;     
      mem_write_age <= 1'd0;    
   end
   end

// age checker will only ever write zero values to ALUT mem
assign mem_write_data_age = 83'd0;



// -----------------------------------------------------------------------------
//   Generate invalidate in progress flag (bit 1 of status register)
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      inval_in_prog <= 1'd0;
   else if (age_chk_state == inval_aged_wr) 
      inval_in_prog <= 1'd1;
   else if ((age_chk_state == age_chk) & (mem_addr_age == max_addr))
      inval_in_prog <= 1'd0;
   else
      inval_in_prog <= inval_in_prog;
   end


// -----------------------------------------------------------------------------
//   Calculate whether data is still in date.  Need to work out the real time
//   gap between current time and last accessed.  If this gap is greater than
//   the best before age, then the data is out of date. 
// -----------------------------------------------------------------------------
assign time_since_lst_acc = (curr_time > last_accessed) ? 
                            (curr_time - last_accessed) :  // no cnt wrapping
                            (curr_time + (max_cnt - last_accessed));

assign time_since_lst_acc_age = (curr_time > last_accessed_age) ? 
                                (curr_time - last_accessed_age) : // no wrapping
                                (curr_time + (max_cnt - last_accessed_age));


always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      begin
      age_ok <= 1'b0;
      age_confirmed <= 1'b0;
      end
   else if ((age_chk_state == age_chk) & add_check_active) 
      begin                                       // age checking for addr chkr
      if (best_bfr_age > time_since_lst_acc)      // still in date
         begin
         age_ok <= 1'b1;
         age_confirmed <= 1'b1;
         end
      else   // out of date
         begin
         age_ok <= 1'b0;
         age_confirmed <= 1'b1;
         end
      end
   else if ((age_chk_state == age_chk) & ~add_check_active)
      begin                                      // age checking for inval aged
      if (best_bfr_age > time_since_lst_acc_age) // still in date
         begin
         age_ok <= 1'b1;
         age_confirmed <= 1'b1;
         end
      else   // out of date
         begin
         age_ok <= 1'b0;
         age_confirmed <= 1'b1;
         end
      end
   else
      begin
      age_ok <= 1'b0;
      age_confirmed <= 1'b0;
      end
   end



// -----------------------------------------------------------------------------
//   Generate last address and port that was cleared in the invalid aged process
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      begin
      lst_inv_addr_cmd <= 48'd0;
      lst_inv_port_cmd <= 2'd0;
      end
   else if (age_chk_state == inval_aged_wr)
      begin
      lst_inv_addr_cmd <= mem_read_data_age[47:0];
      lst_inv_port_cmd <= mem_read_data_age[49:48];
      end
   else 
      begin
      lst_inv_addr_cmd <= lst_inv_addr_cmd;
      lst_inv_port_cmd <= lst_inv_port_cmd;
      end
   end


// -----------------------------------------------------------------------------
//   Set active bit of status, decoded off age_chk_state
// -----------------------------------------------------------------------------
assign age_check_active = (age_chk_state != 3'b000);

endmodule

