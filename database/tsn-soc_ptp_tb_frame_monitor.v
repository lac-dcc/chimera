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
 * ethernet frame monitor
-*/

`include "ptpv2_defines.v"

module frame_monitor (
    input             clk,

    input             dump_finish_i,
    input             mii_mode_i,

    input             data_en_i,
    input             data_er_i,
    input [7:0]       data_i
);
    reg  [7:0]        rcvd_frame[255:0];
    reg  [3:0]        first_nibble;
    reg  [7:0]        data;
    reg  [11:0]       eth_count;
    reg               data_en_z1;

    integer           logfile;
    integer           broadcast;
    integer           frame_len, i, j;

    integer           sof_pos;
    reg               get_sof_done;


    initial begin
        #1;
        logfile  = $fopen("./ptpv2-frame.dat") ;  
        broadcast = logfile;   //1 | logfile; 

        frame_len = 0 ;
        i = 0 ;
        j = 0 ;

        first_nibble = 0 ;
        data = 0 ;
        eth_count  = 0 ;
        data_en_z1 = 0 ;

        sof_pos = 0;
        get_sof_done = 1'b0;

        wait(dump_finish_i == 1'b1);
        $fclose(logfile);
    end

    always @(posedge clk) begin
        if(data_en_i == 1'b1)
            eth_count <= eth_count + 1;
        else
            eth_count <= 12'd0;
    end

    always @(posedge clk) data_en_z1 <= data_en_i;

    always @(posedge clk) begin
        if(data_en_i == 1'b1) begin
            if(mii_mode_i == 1'b0) begin  //1000M 
                rcvd_frame[frame_len] = data_i[7:0];
                frame_len = frame_len + 1;

                if(data_i[7:0] == 8'hd5 && get_sof_done == 1'b0) begin
                    sof_pos = frame_len;
                    get_sof_done = 1'b1;
                end
            end
            else begin                  //10/100M 
                if(eth_count[0] == 1'b0) 
                    first_nibble = data_i[3:0];
                else begin
                    data = {data_i[3:0], first_nibble[3:0]};
                    rcvd_frame[frame_len] = data[7:0];
                    frame_len = frame_len + 1; 

                    if(data[7:0] == 8'hd5 && get_sof_done == 1'b0) begin
                        sof_pos = frame_len;
                        get_sof_done = 1'b1;
                    end
                end
            end
        end
        else if(data_en_z1 == 1'b1 && data_en_i == 1'b0) begin  //end of frame
            for(i = sof_pos; i < frame_len; i = i+4) begin
                j = i - sof_pos;
                if((i+4) <= frame_len) 
                    $fdisplay(broadcast, "%h  %h %h %h %h", j, rcvd_frame[i], rcvd_frame[i+1], rcvd_frame[i+2], rcvd_frame[i+3]);  
                else if((i+3) == frame_len)
                    $fdisplay(broadcast, "%h  %h %h %h", j, rcvd_frame[i], rcvd_frame[i+1], rcvd_frame[i+2]);  
                else if((i+2) == frame_len)
                    $fdisplay(broadcast, "%h  %h %h", j, rcvd_frame[i], rcvd_frame[i+1]);  
                else if((i+1) == frame_len)
                    $fdisplay(broadcast, "%h  %h", j, rcvd_frame[i]);  
            end

            $fdisplay(broadcast, "   ");
            frame_len = 0;
            get_sof_done = 1'b0;
        end
    end  
endmodule


