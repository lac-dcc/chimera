// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 *  EMAC dual port RAM for remote monitoring
-*/

module emac_rmon_dpram (
    input               clk     , 
    //port-a for RMON  
    input   [5:0]       addra   ,
    input   [31:0]      dina    ,
    output  [31:0]      douta   ,
    input               wea     ,
    //port-b for HOST
    input   [5:0]       addrb   ,
    output  [31:0]      doutb   
);
    //++
    //internal signals                                                              
    //--

    wire            clka;
    wire            clkb;
    assign          clka=clk;
    assign  #2      clkb=clk;

    //instantiating dual-port RAM
    dpram #(32,6,2**6) u_dpram
    (    
        .data_a         (dina           ),  
        .wren_a         (wea            ),  
        .address_a      (addra          ),  
        .clock_a        (clka           ),  
        .q_a            (douta          ),  

        .data_b         (32'b0          ),  
        .wren_b         (1'b0           ),  
        .address_b      (addrb          ),  
        .clock_b        (clkb           ),  
        .q_b            (doutb          )
    ); 

endmodule

