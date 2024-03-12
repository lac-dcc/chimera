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

module byteen_converter
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
     output reg [31:0]       readdata_out,
     output reg              readdatavalid_out,
     input wire [3:0]        byteenable_in,
     output wire             waitrequest_out,

     output wire [OADDR-1:0] addr_out,
     output wire             write_out,
     output wire [7:0]       writedata_out,
     output wire             read_out,
     input wire [7:0]        readdata_in,
     input wire              readdatavalid_in,
     input wire              waitrequest_in
     );

    function [2:0] cnt_bit;
        input [3:0]          data;
        integer              index;
        begin
            cnt_bit = 0;
            for(index = 0; index < 4; index = index + 1)
              if(data[index])
                cnt_bit = cnt_bit + 1;
        end
    endfunction

    // data
    // data[8] = valid bit
    reg [IADDR-1:0] addr0;
    reg [8:0]       data0; // not used
    reg [8:0]       data1; // data1
    reg [8:0]       data2; // data2
    reg [8:0]       data3; // data3

    reg             write_mode, read_mode;

    assign addr_out = (data1[8]) ? addr0 | 1 :
                      (data2[8]) ? addr0 | 2 :
                      (data3[8]) ? addr0 | 3 :
                      (byteenable_in[0]) ? addr_in :
                      (byteenable_in[1]) ? addr_in | 1 :
                      (byteenable_in[2]) ? addr_in | 2 :
                      (byteenable_in[3]) ? addr_in | 3 : 0;

    assign writedata_out = (data1[8] && write_mode) ? data1[7:0] :
                           (data2[8] && write_mode) ? data2[7:0] :
                           (data3[8] && write_mode) ? data3[7:0] :
                           (byteenable_in[0]) ? writedata_in[7:0] :
                           (byteenable_in[1]) ? writedata_in[15:8] :
                           (byteenable_in[2]) ? writedata_in[23:16] :
                           (byteenable_in[3]) ? writedata_in[31:24] : 0;

    assign write_out = (!read_mode) && ((write_in && byteenable_in != 0) || write_mode);
    assign read_out  = (!write_mode) && ((read_in && byteenable_in != 0) || read_mode);

    assign waitrequest_out = waitrequest_in || read_mode || write_mode;

    always @(posedge clk_sys) begin
        if(rst) begin
            {data1, data2, data3} <= 0;
            {write_mode, read_mode} <= 0;
        end else if(data1[8]) begin
            data1 <= 0;
            write_mode <= write_mode && (data2[8] || data3[8]);
            read_mode  <= read_mode && (data2[8] || data3[8]);
        end else if(data2[8]) begin
            data2 <= 0;
            write_mode <= write_mode && (data3[8]);
            read_mode  <= read_mode && (data3[8]);
        end else if(data3[8]) begin
            data3 <= 0;
            write_mode <= 0;
            read_mode  <= 0;
        end else if(cnt_bit(byteenable_in) > 1 && (write_in || read_in)) begin
            write_mode <= write_in;
            read_mode  <= read_in;
            addr0 <= addr_in;

            data1[8]   <= (byteenable_in[0]   && byteenable_in[1]) ? 1 : 0;
            data2[8]   <= (byteenable_in[1:0] && byteenable_in[2]) ? 1 : 0;
            data3[8]   <= (byteenable_in[2:0] && byteenable_in[3]) ? 1 : 0;

            data1[7:0] <= (byteenable_in[0]   && byteenable_in[1]) ? writedata_in[15: 8] : 0;
            data2[7:0] <= (byteenable_in[1:0] && byteenable_in[2]) ? writedata_in[23:16] : 0;
            data3[7:0] <= (byteenable_in[2:0] && byteenable_in[3]) ? writedata_in[31:24] : 0;
        end
    end


    /////////////////////////////////////////////////////////////////////////
    reg [3:0] rflag;

    always @(posedge clk_sys) begin
        if(rst) begin
            rflag <= 0;
            readdata_out <= 0;
            readdatavalid_out <= 0;
        end else begin
            if(rflag[0] && readdatavalid_in) begin
                rflag <= (read_in && !waitrequest_out) ? byteenable_in : {rflag[3:1], 1'b0};

                readdata_out <= {readdata_out[31:8], readdata_in};
                readdatavalid_out <= !(rflag[3:1]);
            end else if(rflag[1] && readdatavalid_in) begin
                rflag <= (read_in && !waitrequest_out) ? byteenable_in : {rflag[3:2], 2'b0};

                readdata_out <= {readdata_out[31:16], readdata_in, readdata_out[7:0]};
                readdatavalid_out <= !(rflag[3:2]);
            end else if(rflag[2] && readdatavalid_in) begin
                rflag <= (read_in && !waitrequest_out) ? byteenable_in : {rflag[3], 3'b0};

                readdata_out <= {readdata_out[31:24], readdata_in[7:0], readdata_out[15:0]};
                readdatavalid_out <= !(rflag[3]);
            end else if(rflag[3] && readdatavalid_in) begin
                rflag <= (read_in && !waitrequest_out) ? byteenable_in : 0;

                readdata_out <= {readdata_in[7:0], readdata_out[23:0]};
                readdatavalid_out <= 1;
            end else if(read_in && !waitrequest_out) begin
                rflag <= byteenable_in;
                readdatavalid_out <= 0;
            end else begin
                readdatavalid_out <= 0;
            end
        end
    end
endmodule
