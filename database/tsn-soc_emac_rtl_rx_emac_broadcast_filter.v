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
 *  EMAC broadcast filter using leaky bucket algorithm
 *  r_BroadcastBucketDepth_i/r_BroadcastBucketInterval_i determines maximal
 *  broadcast packets throughput.
-*/

module emac_broadcast_filter (    
    input               rst_n                       ,
    input               clk                         ,
    //emac_rx_ctrl interface               
    input               broadcast_ptr_i             ,
    output reg          broadcast_drop_o            ,
    //Host interface
    input               r_BroadcastFilterEn_i       ,
    input  [15:0]       r_BroadcastBucketDepth_i    ,
    input  [15:0]       r_BroadcastBucketInterval_i 
);
    //++  
    //internal signals                                                                
    //--  

    reg     [15:0]  time_counter            ;
    reg     [15:0]  broadcast_counter        ;

    //++
    //leaky bucket algorithm
    //--

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            time_counter <= 0;
        else if(time_counter == r_BroadcastBucketInterval_i)
            time_counter <= 0;
        else
            time_counter <= time_counter + 1;
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            broadcast_counter <= 0;
        else if(time_counter == r_BroadcastBucketInterval_i)
            broadcast_counter <= 0;
        else if (broadcast_ptr_i && broadcast_counter != r_BroadcastBucketDepth_i)
            broadcast_counter <= broadcast_counter + 1;
    end
                
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            broadcast_drop_o <= 0;
        else if(r_BroadcastFilterEn_i && broadcast_counter == r_BroadcastBucketDepth_i)
            broadcast_drop_o <= 1;
        else
            broadcast_drop_o <= 0;
    end

endmodule

