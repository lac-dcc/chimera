// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : alut.v
//Title       : ALUT top level
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
module alut
(   
   // Inputs
   pclk,
   n_p_reset,
   psel,            
   penable,       
   pwrite,         
   paddr,           
   pwdata,          

   // Outputs
   prdata  
);

   parameter   DW = 83;          // width of data busses
   parameter   DD = 256;         // depth of RAM


   // APB Inputs
   input             pclk;               // APB clock                          
   input             n_p_reset;          // Reset                              
   input             psel;               // Module select signal               
   input             penable;            // Enable signal                      
   input             pwrite;             // Write when HIGH and read when LOW  
   input [6:0]       paddr;              // Address bus for read write         
   input [31:0]      pwdata;             // APB write bus                      

   output [31:0]     prdata;             // APB read bus                       

   wire              pclk;               // APB clock                           
   wire [7:0]        mem_addr_add;       // hash address for R/W to memory     
   wire              mem_write_add;      // R/W flag (write = high)            
   wire [DW-1:0]     mem_write_data_add; // write data for memory             
   wire [7:0]        mem_addr_age;       // hash address for R/W to memory     
   wire              mem_write_age;      // R/W flag (write = high)            
   wire [DW-1:0]     mem_write_data_age; // write data for memory             
   wire [DW-1:0]     mem_read_data_add;  // read data from mem                 
   wire [DW-1:0]     mem_read_data_age;  // read data from mem  
   wire [31:0]       curr_time;          // current time
   wire              active;             // status[0] adress checker active
   wire              inval_in_prog;      // status[1] 
   wire              reused;             // status[2] ALUT location overwritten
   wire [4:0]        d_port;             // calculated destination port for tx
   wire [47:0]       lst_inv_addr_nrm;   // last invalidated addr normal op
   wire [1:0]        lst_inv_port_nrm;   // last invalidated port normal op
   wire [47:0]       lst_inv_addr_cmd;   // last invalidated addr via cmd
   wire [1:0]        lst_inv_port_cmd;   // last invalidated port via cmd
   wire [47:0]       mac_addr;           // address of the switch
   wire [47:0]       d_addr;             // address of frame to be checked
   wire [47:0]       s_addr;             // address of frame to be stored
   wire [1:0]        s_port;             // source port of current frame
   wire [31:0]       best_bfr_age;       // best before age
   wire [7:0]        div_clk;            // programmed clock divider value
   wire [1:0]        command;            // command bus
   wire [31:0]       prdata;             // APB read bus
   wire              age_confirmed;      // valid flag from age checker        
   wire              age_ok;             // result from age checker 
   wire              clear_reused;       // read/clear flag for reused signal           
   wire              check_age;          // request flag for age check
   wire [31:0]       last_accessed;      // time field sent for age check




alut_reg_bank i_alut_reg_bank
(   
   // Inputs
   .pclk(pclk),
   .n_p_reset(n_p_reset),
   .psel(psel),            
   .penable(penable),       
   .pwrite(pwrite),         
   .paddr(paddr),           
   .pwdata(pwdata),          
   .curr_time(curr_time),
   .add_check_active(add_check_active),
   .age_check_active(age_check_active),
   .inval_in_prog(inval_in_prog),
   .reused(reused),
   .d_port(d_port),
   .lst_inv_addr_nrm(lst_inv_addr_nrm),
   .lst_inv_port_nrm(lst_inv_port_nrm),
   .lst_inv_addr_cmd(lst_inv_addr_cmd),
   .lst_inv_port_cmd(lst_inv_port_cmd),

   // Outputs
   .mac_addr(mac_addr),    
   .d_addr(d_addr),   
   .s_addr(s_addr),    
   .s_port(s_port),    
   .best_bfr_age(best_bfr_age),
   .div_clk(div_clk),     
   .command(command), 
   .prdata(prdata),  
   .clear_reused(clear_reused)           
);


alut_addr_checker i_alut_addr_checker
(   
   // Inputs
   .pclk(pclk),
   .n_p_reset(n_p_reset),
   .command(command),
   .mac_addr(mac_addr),
   .d_addr(d_addr),
   .s_addr(s_addr),
   .s_port(s_port),
   .curr_time(curr_time),
   .mem_read_data_add(mem_read_data_add),
   .age_confirmed(age_confirmed),
   .age_ok(age_ok),
   .clear_reused(clear_reused),

   //outputs
   .d_port(d_port),
   .add_check_active(add_check_active),
   .mem_addr_add(mem_addr_add),
   .mem_write_add(mem_write_add),
   .mem_write_data_add(mem_write_data_add),
   .lst_inv_addr_nrm(lst_inv_addr_nrm),
   .lst_inv_port_nrm(lst_inv_port_nrm),
   .check_age(check_age),
   .last_accessed(last_accessed),
   .reused(reused)
);


alut_age_checker i_alut_age_checker
(   
   // Inputs
   .pclk(pclk),
   .n_p_reset(n_p_reset),
   .command(command),          
   .div_clk(div_clk),          
   .mem_read_data_age(mem_read_data_age),
   .check_age(check_age),        
   .last_accessed(last_accessed), 
   .best_bfr_age(best_bfr_age),   
   .add_check_active(add_check_active),

   // outputs
   .curr_time(curr_time),         
   .mem_addr_age(mem_addr_age),      
   .mem_write_age(mem_write_age),     
   .mem_write_data_age(mem_write_data_age),
   .lst_inv_addr_cmd(lst_inv_addr_cmd),  
   .lst_inv_port_cmd(lst_inv_port_cmd),  
   .age_confirmed(age_confirmed),     
   .age_ok(age_ok),
   .inval_in_prog(inval_in_prog),            
   .age_check_active(age_check_active)
);   


alut_mem i_alut_mem
(   
   // Inputs
   .pclk(pclk),
   .mem_addr_add(mem_addr_add),
   .mem_write_add(mem_write_add),
   .mem_write_data_add(mem_write_data_add),
   .mem_addr_age(mem_addr_age),
   .mem_write_age(mem_write_age),
   .mem_write_data_age(mem_write_data_age),

   .mem_read_data_add(mem_read_data_add),  
   .mem_read_data_age(mem_read_data_age)
);   



`ifdef ABV_ON
// psl default clock = (posedge pclk);

// ASSUMPTIONS

// ASSERTION CHECKS
// the invalidate aged in progress flag and the active flag 
// should never both be set.
// psl assert_inval_in_prog_active : assert never (inval_in_prog & active);

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

`endif


endmodule
