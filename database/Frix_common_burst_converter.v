/*
 * Copyright (c) 2015, Arch Laboratory
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

module burst_converter
  #(
    parameter IADDR = 32,
    parameter OADDR = 32
    )
    (
     input wire              clk_sys,
     input wire              rst,

     input wire [IADDR-1:0]  addr_in,
     input wire              write_in,
     input wire [31:0]       writedata_in,
     input wire              read_in,
     output wire [31:0]      readdata_out,
     output wire             readdatavalid_out,
     input wire [3:0]        byteenable_in,
     input wire [2:0]        burstcount_in,
     output wire             waitrequest_out,

     output wire [OADDR-1:0] addr_out,
     output wire             write_out,
     output wire [31:0]      writedata_out,
     output wire             read_out,
     input wire [31:0]       readdata_in,
     input wire              readdatavalid_in,
     output wire [3:0]       byteenable_out,
     input wire              waitrequest_in
     );


    // data
    // data[8] = valid bit
    reg [IADDR-1:0]          raddr, waddr;
    reg [3:0]                rcount, wcount;

    assign addr_out = (rcount[1]) ? raddr + 4 :
                      (rcount[2]) ? raddr + 8 :
                      (rcount[3]) ? raddr + 12 :
                      (wcount[1]) ? waddr + 4 :
                      (wcount[2]) ? waddr + 8 :
                      (wcount[3]) ? waddr + 12 : addr_in;

    assign writedata_out = writedata_in;
    assign byteenable_out = byteenable_in;

    assign write_out = write_in;
    assign read_out  = (read_in && burstcount_in != 0) || rcount;

    assign readdata_out = readdata_in;
    assign readdatavalid_out = readdatavalid_in;
    assign waitrequest_out = waitrequest_in;

    /////////////////////////////////////////////////////////////////////////
    // burst write
    /////////////////////////////////////////////////////////////////////////
    always @(posedge clk_sys) begin
        if(rst) begin
            wcount <= 0;
            waddr <= 0;
        end else if(wcount[1] && !waitrequest_in) begin
            wcount[1] <= 0;
        end else if(wcount[2] && !waitrequest_in) begin
            wcount[2] <= 0;
        end else if(wcount[3] && !waitrequest_in) begin
            wcount[3] <= 0;
        end else if(burstcount_in > 1 && write_in && !waitrequest_out) begin
            waddr <= addr_in;

            wcount <= (burstcount_in == 4) ? 4'b1110 :
                      (burstcount_in == 3) ? 4'b0110 :
                      (burstcount_in == 2) ? 4'b0010 : 0;
        end
    end

    /////////////////////////////////////////////////////////////////////////
    // burst read
    /////////////////////////////////////////////////////////////////////////
    always @(posedge clk_sys) begin
        if(rst) begin
            rcount <= 0;
            raddr <= 0;
        end else if(rcount[1] && !waitrequest_in) begin
            rcount[1] <= 0;
        end else if(rcount[2] && !waitrequest_in) begin
            rcount[2] <= 0;
        end else if(rcount[3] && !waitrequest_in) begin
            rcount[3] <= 0;
        end else if(burstcount_in > 1 && read_in && !waitrequest_out) begin
            raddr <= addr_in;

            rcount <= (burstcount_in == 4) ? 4'b1110 :
                      (burstcount_in == 3) ? 4'b0110 :
                      (burstcount_in == 2) ? 4'b0010 : 0;
        end
    end
endmodule
