//=======================================================================
// Project Polyphony
//
// File:
//   tb_task.v
//
// Abstract:
//   testbench task
//
//  Created:
//    6 October 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

task reset;
  begin
    rst_x = 0;
    repeat (10) @(posedge clk);
    @(negedge clk);
    rst_x = 1;
    @(posedge clk);
  end
endtask

task save_frame_buffer;
    input [23:0] adrs;
    input [15:0] width;
    input [15:0] height;
    input [64*8:1] file_name;
    integer x;
    integer y;
    integer fp;
    reg [1:0]  stat;
    reg        hw_sel;
    reg [1:0]  bank_sel;
    reg [19:0] adr_bank;
    reg [23:0] adr_pix;

    reg [31:0] tmp_data32;
    reg [15:0] tmp_data;
    reg [7:0]  cr;
    reg [7:0]  cg;
    reg [7:0]  cb;
    reg [7:0]  ca;
    begin
        $display("saving rendering result in the AXI Slave Memory...");
        fp = $fopen(file_name);
        for (y = 0; y < height; y = y + 1) begin
            for (x = 0; x < width; x = x + 1) begin
                adr_pix = adrs[23:1] + width * y + x;  // per 16bit (per pixel)
                hw_sel = adr_pix[0];      // lsb selects half word
                tmp_data32 = top.u_axi_slave_mem.r_mem[adr_pix[23:1]];
                tmp_data = (hw_sel) ? tmp_data32[31:16] : tmp_data32[15:0];
	        //$display("x,y,adr,adr32s = %h %h %h %h",x,y,adr_pix[23:1],tmp_data);
                cr = {tmp_data[15:11],tmp_data[15:13]};
                cg = {tmp_data[10:5],tmp_data[10:9]};
                cb = {tmp_data[4:0],tmp_data[4:2]};
                ca = 8'hff;
                $fwrite(fp,"%h\n", {ca,cb,cg,cr});
            end
       end
       $fclose(fp);
    end
endtask

task save_frame_buffer64;
    input [23:0] adrs;
    input [15:0] width;
    input [15:0] height;
    input [64*8:1] file_name;
    integer x;
    integer y;
    integer fp;
    reg [1:0]  stat;
    reg [1:0]  hw_sel;
    reg [1:0]  bank_sel;
    reg [19:0] adr_bank;
    reg [23:0] adr_pix;

    reg [63:0] tmp_data64;
    reg [15:0] tmp_data;
    reg [7:0]  cr;
    reg [7:0]  cg;
    reg [7:0]  cb;
    reg [7:0]  ca;
    begin
        $display("saving rendering result in the AXI Slave Memory...");
        fp = $fopen(file_name);
        for (y = 0; y < height; y = y + 1) begin
            for (x = 0; x < width; x = x + 1) begin
                adr_pix = adrs[23:1] + width * y + x;  // per 16bit (per pixel)
                hw_sel = adr_pix[1:0];      // lsb selects half word
                tmp_data64 = top.u_axi_slave_mem.r_mem[adr_pix[23:2]];
                tmp_data = (hw_sel == 'd1) ? tmp_data64[31:16] :
			   (hw_sel == 'd2) ? tmp_data64[47:32] :
			   (hw_sel == 'd3) ? tmp_data64[63:48] :
                                             tmp_data64[15:0];
	        //$display("x,y,adr,adr32s = %h %h %h %h",x,y,adr_pix[23:1],tmp_data);
                cr = {tmp_data[15:11],tmp_data[15:13]};
                cg = {tmp_data[10:5],tmp_data[10:9]};
                cb = {tmp_data[4:0],tmp_data[4:2]};
                ca = 8'hff;
                $fwrite(fp,"%h\n", {ca,cb,cg,cr});
            end
       end
       $fclose(fp);
    end
endtask
