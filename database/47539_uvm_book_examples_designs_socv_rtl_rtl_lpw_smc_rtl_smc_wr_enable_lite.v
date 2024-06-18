// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : smc_wr_enable_lite.v
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


  module smc_wr_enable_lite (

                      //inputs                      

                      n_sys_reset,
                      r_full,
                      n_r_we,
                      n_r_wr,

                      //outputs

                      smc_n_we,
                      smc_n_wr);

//I/O
   
   input             n_sys_reset;   //system reset
   input             r_full;    // Full cycle write strobe
   input [3:0]       n_r_we;    //write enable from smc_strobe
   input             n_r_wr;    //write strobe from smc_strobe
   output [3:0]      smc_n_we;  // write enable (active low)
   output            smc_n_wr;  // write strobe (active low)
   
   
//output reg declaration.
   
   reg [3:0]          smc_n_we;
   reg                smc_n_wr;

//----------------------------------------------------------------------
// negedge strobes with clock.
//----------------------------------------------------------------------
      

//----------------------------------------------------------------------
      
//--------------------------------------------------------------------
// Gate Write strobes with clock.
//--------------------------------------------------------------------

  always @(r_full or n_r_we)
  
  begin
  
     smc_n_we[0] = ((~r_full  ) | n_r_we[0] );

     smc_n_we[1] = ((~r_full  ) | n_r_we[1] );

     smc_n_we[2] = ((~r_full  ) | n_r_we[2] );

     smc_n_we[3] = ((~r_full  ) | n_r_we[3] );

  
  end

//--------------------------------------------------------------------   
//write strobe generation
//--------------------------------------------------------------------   

  always @(n_r_wr or r_full )
  
     begin
  
        smc_n_wr = ((~r_full ) | n_r_wr );
       
     end

endmodule // smc_wr_enable

