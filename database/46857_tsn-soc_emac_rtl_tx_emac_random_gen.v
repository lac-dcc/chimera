// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
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
 * EMAC random number generator for half duplex backoff 
-*/

module emac_random_gen ( 
    input               rst_n             ,
    input               clk               ,
    input               init_i            ,
    input   [3:0]       retry_cnt_i       ,
    output  reg         random_time_meet_o   
);
    parameter SLOT_CYCLES = 64; //512 bits /8, FIXME
    //As to slotTime, refer to IEEE 802.3-2018, clause 4.4.2, page 161.
    //for 10/100M Ethernet, slotTime = 512 bit times.
    //for 1000M Ethernet, slotTime = 4096 bit times.
    //this design support 1Gb/s Ethernet full duplex only.

    //++
    //internal signals                                                              
    //--

    reg [9:0]       random_sequence ;
    reg [9:0]       rand_x          ;
    reg [9:0]       random_counter  ;
    reg [7:0]       slot_time_counter; 

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            random_sequence <= 0;
        else
            random_sequence <= {random_sequence[8:0], ~(random_sequence[2] ^ random_sequence[9])};
    end
        
    always @(*) begin
        case (retry_cnt_i)
            4'h0    :   rand_x = {9'b0,random_sequence[0]};
            4'h1    :   rand_x = {8'b0,random_sequence[1:0]};     
            4'h2    :   rand_x = {7'b0,random_sequence[2:0]};
            4'h3    :   rand_x = {6'b0,random_sequence[3:0]};
            4'h4    :   rand_x = {5'b0,random_sequence[4:0]};
            4'h5    :   rand_x = {4'b0,random_sequence[5:0]};
            4'h6    :   rand_x = {3'b0,random_sequence[6:0]};
            4'h7    :   rand_x = {2'b0,random_sequence[7:0]};
            4'h8    :   rand_x = {1'b0,random_sequence[8:0]};
            4'h9    :   rand_x = {     random_sequence[9:0]};  
            default :   rand_x = {     random_sequence[9:0]};
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            slot_time_counter <= 0;
        else if(init_i || slot_time_counter >= (SLOT_CYCLES-1))
            slot_time_counter <= 0;
        else if(!random_time_meet_o)
            slot_time_counter <= slot_time_counter + 1;
    end
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            random_counter <= 0;
        else if(init_i)
            random_counter <= rand_x;
        else if(random_counter != 0 && slot_time_counter == (SLOT_CYCLES-1))
            random_counter <= random_counter - 1 ;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            random_time_meet_o <= 1;
        else if(init_i)
            random_time_meet_o <= 0;
        else if(random_counter == 0)
            random_time_meet_o <= 1;
    end
        
endmodule



