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
//------------------------------------------------------------------------
//--
//-- TITLE:    ocx_bram_infer.v
//-- FUNCTION: 128x512 Xilinx BRAM
//--
//------------------------------------------------------------------------


module ocx_bram_infer(
    input clka,
    input clkb,    
    input ena,
    input enb,
    input wea,
    input rstb,        
    //input regceb,
    input [6:0] addra,
    input [6:0]  addrb,
    input [512-1:0] dina,
    output [512-1:0] doutb,
    output sbiterr,        
    output dbiterr,        
    output wire [6:0] rdaddrecc
    );
    
  (* ram_style="block" *)   
    // wizard generated memory has 2 clocks, use clka for both ports
    wire  clk;
    assign clk = clka; 
    //wire rstb;
    wire regceb;         
    //assign rstb = 1'b0;
    assign regceb  = 1'b1;
    assign sbiterr = 1'b0;
    assign dbiterr = 1'b0;
    assign rdaddrecc = {7{1'b0}};
   
      //  Xilinx Simple Dual Port Single Clock RAM
      //  This code implements a parameterizable SDP single clock memory.
      //  If a reset or enable is not necessary, it may be tied off or removed from the code.
    
      parameter RAM_WIDTH = 512;                  // Specify RAM data width
      parameter RAM_DEPTH = 128;                  // Specify RAM depth (number of entries)
      parameter RAM_PERFORMANCE = "HIGH_PERFORMANCE"; // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
      parameter INIT_FILE = "";                       // Specify name/location of RAM initialization file if using one (leave blank if not)
  
      reg [RAM_WIDTH-1:0] ram_sdp [RAM_DEPTH-1:0];
      reg [RAM_WIDTH-1:0] ram_sdp_data = {RAM_WIDTH{1'b0}};
    
      // The following code either initializes the memory values to a specified file or to all zeros to match hardware
      generate
        if (INIT_FILE != "") begin: use_init_file
          initial
            $readmemh(INIT_FILE, ram_sdp, 0, RAM_DEPTH-1);
        end else begin: init_bram_to_zero
          integer ram_index;
          initial
            for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
              ram_sdp[ram_index] = {RAM_WIDTH{1'b0}};
        end
      endgenerate
    
      always @(posedge clk) begin
        if (wea)
          ram_sdp[addra] <= dina;
        if (enb)
          ram_sdp_data <= ram_sdp[addrb];
      end
    
      //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
      generate
        if (RAM_PERFORMANCE == "LOW______LATENCY") begin: no_output_register
    
          // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
           assign doutb = ram_sdp_data;
    
        end else begin: output_register
    
          // The following is a 2 clock cycle read latency with improve clock-to-out timing
    
          reg [RAM_WIDTH-1:0] doutb_reg = {RAM_WIDTH{1'b0}};
    
          always @(posedge clk)
            if (rstb)
              doutb_reg <= {RAM_WIDTH{1'b0}};
            else if (regceb)
              doutb_reg <= ram_sdp_data;
    
          assign doutb = doutb_reg;
    
        end
      endgenerate
    
      //  The following function calculates the address width based on specified RAM depth
      function integer clogb2;
        input integer depth;
          for (clogb2=0; depth>0; clogb2=clogb2+1)
            depth = depth >> 1;
      endfunction 
 
    
endmodule
