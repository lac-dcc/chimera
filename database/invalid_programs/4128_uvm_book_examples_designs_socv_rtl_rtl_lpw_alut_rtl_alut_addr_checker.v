// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : alut_addr_checker.v
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

// compiler directives
`include "alut_defines.v"


module alut_addr_checker
(   
   // Inputs
   pclk,
   n_p_reset,
   command,
   mac_addr,
   d_addr,
   s_addr,
   s_port,
   curr_time,
   mem_read_data_add,
   age_confirmed,
   age_ok,
   clear_reused,

   //outputs
   d_port,
   add_check_active,
   mem_addr_add,
   mem_write_add,
   mem_write_data_add,
   lst_inv_addr_nrm,
   lst_inv_port_nrm,
   check_age,
   last_accessed,
   reused
);



   input               pclk;               // APB clock                           
   input               n_p_reset;          // Reset                               
   input [1:0]         command;            // command bus                        
   input [47:0]        mac_addr;           // address of the switch              
   input [47:0]        d_addr;             // address of frame to be checked     
   input [47:0]        s_addr;             // address of frame to be stored      
   input [1:0]         s_port;             // source port of current frame       
   input [31:0]        curr_time;          // current time,for storing in mem    
   input [82:0]        mem_read_data_add;  // read data from mem                 
   input               age_confirmed;      // valid flag from age checker        
   input               age_ok;             // result from age checker 
   input               clear_reused;       // read/clear flag for reused signal           

   output [4:0]        d_port;             // calculated destination port for tx 
   output              add_check_active;   // bit 0 of status register           
   output [7:0]        mem_addr_add;       // hash address for R/W to memory     
   output              mem_write_add;      // R/W flag (write = high)            
   output [82:0]       mem_write_data_add; // write data for memory             
   output [47:0]       lst_inv_addr_nrm;   // last invalidated addr normal op    
   output [1:0]        lst_inv_port_nrm;   // last invalidated port normal op    
   output              check_age;          // request flag for age check
   output [31:0]       last_accessed;      // time field sent for age check
   output              reused;             // indicates ALUT location overwritten

   reg   [2:0]         add_chk_state;      // current address checker state
   reg   [2:0]         nxt_add_chk_state;  // current address checker state
   reg   [4:0]         d_port;             // calculated destination port for tx 
   reg   [3:0]         port_mem;           // bitwise conversion of 2bit port
   reg   [7:0]         mem_addr_add;       // hash address for R/W to memory
   reg                 mem_write_add;      // R/W flag (write = high)            
   reg                 reused;             // indicates ALUT location overwritten
   reg   [47:0]        lst_inv_addr_nrm;   // last invalidated addr normal op    
   reg   [1:0]         lst_inv_port_nrm;   // last invalidated port normal op    
   reg                 check_age;          // request flag for age checker
   reg   [31:0]        last_accessed;      // time field sent for age check


   wire   [7:0]        s_addr_hash;        // hash of address for storing
   wire   [7:0]        d_addr_hash;        // hash of address for checking
   wire   [82:0]       mem_write_data_add; // write data for memory  
   wire                add_check_active;   // bit 0 of status register           


// Parameters for Address Checking FSM states
   parameter idle           = 3'b000;
   parameter mac_addr_chk   = 3'b001;
   parameter read_dest_add  = 3'b010;
   parameter valid_chk      = 3'b011;
   parameter age_chk        = 3'b100;
   parameter addr_chk       = 3'b101;
   parameter read_src_add   = 3'b110;
   parameter write_src      = 3'b111;


// -----------------------------------------------------------------------------
//   Hash conversion of source and destination addresses
// -----------------------------------------------------------------------------
   assign s_addr_hash = s_addr[7:0] ^ s_addr[15:8] ^ s_addr[23:16] ^
                        s_addr[31:24] ^ s_addr[39:32] ^ s_addr[47:40];

   assign d_addr_hash = d_addr[7:0] ^ d_addr[15:8] ^ d_addr[23:16] ^
                        d_addr[31:24] ^ d_addr[39:32] ^ d_addr[47:40];



// -----------------------------------------------------------------------------
//   State Machine For handling the destination address checking process and
//   and storing of new source address and port values.
// -----------------------------------------------------------------------------
always @ (command or add_chk_state or age_confirmed or age_ok)
   begin
      case (add_chk_state)
      
      idle:
         if (command == 2'b01)
            nxt_add_chk_state = mac_addr_chk;
         else
            nxt_add_chk_state = idle;

      mac_addr_chk:   // check if destination address match MAC switch address
         if (d_addr == mac_addr)
            nxt_add_chk_state = idle;  // return dest port as 5'b1_0000
         else
            nxt_add_chk_state = read_dest_add;

      read_dest_add:       // read data from memory using hash of destination address
            nxt_add_chk_state = valid_chk;

      valid_chk:      // check if read data had valid bit set
         nxt_add_chk_state = age_chk;

      age_chk:        // request age checker to check if still in date
         if (age_confirmed)
            nxt_add_chk_state = addr_chk;
         else
            nxt_add_chk_state = age_chk; 

      addr_chk:       // perform compare between dest and read addresses
            nxt_add_chk_state = read_src_add; // return read port from ALUT mem

      read_src_add:   // read from memory location about to be overwritten
            nxt_add_chk_state = write_src; 

      write_src:      // write new source data (addr and port) to memory
            nxt_add_chk_state = idle; 

      default:
            nxt_add_chk_state = idle;
      endcase
   end


// destination check FSM current state
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      add_chk_state <= idle;
   else
      add_chk_state <= nxt_add_chk_state;
   end



// -----------------------------------------------------------------------------
//   Generate returned value of port for sending new frame to
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      d_port <= 5'b0_1111;
   else if ((add_chk_state == mac_addr_chk) & (d_addr == mac_addr))
      d_port <= 5'b1_0000;
   else if (((add_chk_state == valid_chk) & ~mem_read_data_add[82]) |
            ((add_chk_state == age_chk) & ~(age_confirmed & age_ok)) |
            ((add_chk_state == addr_chk) & (d_addr != mem_read_data_add[47:0])))
      d_port <= 5'b0_1111 & ~( 1 << s_port );
   else if ((add_chk_state == addr_chk) & (d_addr == mem_read_data_add[47:0]))
      d_port <= {1'b0, port_mem} & ~( 1 << s_port );
   else
      d_port <= d_port;
   end


// -----------------------------------------------------------------------------
//   convert read port source value from 2bits to bitwise 4 bits
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset)
      port_mem <= 4'b1111;
   else begin
      case (mem_read_data_add[49:48])
         2'b00: port_mem <= 4'b0001;
         2'b01: port_mem <= 4'b0010;
         2'b10: port_mem <= 4'b0100;
         2'b11: port_mem <= 4'b1000;
      endcase
   end
   end
   


// -----------------------------------------------------------------------------
//   Set active bit of status, decoded off add_chk_state
// -----------------------------------------------------------------------------
assign add_check_active = (add_chk_state != 3'b000);


// -----------------------------------------------------------------------------
//   Generate memory addressing signals.
//   The check address command will be taken as the indication from SW that the 
//   source fields (address and port) can be written to memory. 
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset) 
   begin
       mem_write_add <= 1'b0;
       mem_addr_add  <= 8'd0;
   end
   else if (add_chk_state == read_dest_add)
   begin
       mem_write_add <= 1'b0;
       mem_addr_add  <= d_addr_hash;
   end
// Need to set address two cycles before check
   else if ( (add_chk_state == age_chk) && age_confirmed )
   begin
       mem_write_add <= 1'b0;
       mem_addr_add  <= s_addr_hash;
   end
   else if (add_chk_state == write_src)
   begin
       mem_write_add <= 1'b1;
       mem_addr_add  <= s_addr_hash;
   end
   else
   begin
       mem_write_add <= 1'b0;
       mem_addr_add  <= d_addr_hash;
   end
   end


// -----------------------------------------------------------------------------
//   Generate databus for writing to memory
//   Data written to memory from address checker will always be valid
// -----------------------------------------------------------------------------
assign mem_write_data_add = {1'b1, curr_time, s_port, s_addr};



// -----------------------------------------------------------------------------
//   Evaluate read back data that is about to be overwritten with new source 
//   address and port values. Decide whether the reused flag must be set and
//   last_inval address and port values updated.
//   reused needs to be implemented as read and clear
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset) 
   begin
      reused <= 1'b0;
      lst_inv_addr_nrm <= 48'd0;
      lst_inv_port_nrm <= 2'd0;
   end
   else if ((add_chk_state == read_src_add) & mem_read_data_add[82] &
            (s_addr != mem_read_data_add[47:0]))
   begin
      reused <= 1'b1;
      lst_inv_addr_nrm <= mem_read_data_add[47:0];
      lst_inv_port_nrm <= mem_read_data_add[49:48];
   end
   else if (clear_reused)
   begin
      reused <= 1'b0;
      lst_inv_addr_nrm <= lst_inv_addr_nrm;
      lst_inv_port_nrm <= lst_inv_addr_nrm;
   end
   else 
   begin
      reused <= reused;
      lst_inv_addr_nrm <= lst_inv_addr_nrm;
      lst_inv_port_nrm <= lst_inv_addr_nrm;
   end
   end


// -----------------------------------------------------------------------------
//   Generate signals for age checker to perform in-date check
// -----------------------------------------------------------------------------
always @ (posedge pclk or negedge n_p_reset)
   begin
   if (~n_p_reset) 
   begin
      check_age <= 1'b0;  
      last_accessed <= 32'd0;
   end
   else if (check_age)
   begin
      check_age <= 1'b0;  
      last_accessed <= mem_read_data_add[81:50];
   end
   else if (add_chk_state == age_chk)
   begin
      check_age <= 1'b1;  
      last_accessed <= mem_read_data_add[81:50];
   end
   else 
   begin
      check_age <= 1'b0;  
      last_accessed <= 32'd0;
   end
   end


`ifdef ABV_ON

// psl default clock = (posedge pclk);

// ASSERTION CHECKS
/* Commented out as also checking in toplevel
// it should never be possible for the destination port to indicate the MAC
// switch address and one of the other 4 Ethernets
// psl assert_valid_dest_port : assert never (d_port[4] & |{d_port[3:0]});


// COVER SANITY CHECKS
// check all values of destination port can be returned.
// psl cover_d_port_0 : cover { d_port == 5'b0_0001 };
// psl cover_d_port_1 : cover { d_port == 5'b0_0010 };
// psl cover_d_port_2 : cover { d_port == 5'b0_0100 };
// psl cover_d_port_3 : cover { d_port == 5'b0_1000 };
// psl cover_d_port_4 : cover { d_port == 5'b1_0000 };
// psl cover_d_port_all : cover { d_port == 5'b0_1111 };
*/
`endif


endmodule 









