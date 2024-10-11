// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

`timescale 1ns/1ps 
module MEM (clk,rst,we,MemtoRegM,dump,mem_wmask,addrData,addrInstr,wd,rd,readInstr,exception, cause, mtval);

input clk, rst, we, dump, MemtoRegM;
input [3:0] mem_wmask;
input [31:0] addrData,addrInstr; 
input [31:0]wd;
output [31:0] rd, readInstr;
output reg exception;
output reg [4:0] cause;
output reg [31:0] mtval;
//exception
always @ * begin
if (!rst) begin
    if(addrInstr[1:0]!=0) begin //instruction address misaligned
        exception = 1;
        cause = 5'd0;
        mtval = addrInstr;
    end
    else if((((addrData[0]!=0 )&&((mem_wmask === 4'b0011) || (mem_wmask === 4'b1100))) || 
            ((addrData[1:0] !=0)&& (mem_wmask === 4'b1111))) && (we)) begin 
                //Store address misaligned for sw and sh
        exception = 1;
        cause = 5'd6;
        mtval = addrData;
    end
    else if((((addrData[0]!=0 )&&((mem_wmask == 4'b0011) || (mem_wmask == 4'b1100))) || 
            ((addrData[1:0] !=0)&& (mem_wmask == 4'b1111))) && (MemtoRegM)) begin 
                //load address misaligned for lw and lh
        exception = 1;
        cause = 5'd4;
        mtval = addrData;
    end
    else if(|readInstr === 1'bx ) begin //instruction access fault
        exception = 1;
        cause = 5'd1;
        mtval = addrInstr;
    end
    else if (((|rd === 1'bx) || (|rd === 1'bz)) && (MemtoRegM)) begin 
        exception = 1; //Load access fault
        cause = 5'd5;
        mtval = addrData;
    end
    else if( (we) && ( (|wd === 1'bx) || (|wd === 1'bz))) begin
        exception = 1;//store access fault
        cause = 5'd7;
        mtval = addrData;
    end
    else begin
        exception = 0;
    end
end
end

reg [31:0] mem [65536:0];

integer i;
integer dump_file;

always @ (negedge clk) begin
    if (we) begin
        if (mem_wmask[0]) mem[addrData][ 7:0 ] <= wd[ 7:0 ];
        if (mem_wmask[1]) mem[addrData][15:8 ] <= wd[15:8 ];
        if (mem_wmask[2]) mem[addrData][23:16] <= wd[23:16];
        if (mem_wmask[3]) mem[addrData][31:24] <= wd[31:24];  
    end
end
always @(!clk) begin 
    if(we) begin
        $display("Memory write");
        $display("Simtime = %g, addr(memory cell decimal) = %d, data(hex) = %h",$time,addrData,mem[addrData]);
    end
end

assign rd = (rst) ? 32'd0 : mem[addrData[31:2]];
assign readInstr = (rst) ? 32'd0 : mem[addrInstr[31:2]];


initial begin
// Initialize all memory cells to zero by default
        for (i = 0; i < 65536; i = i + 1) begin
            mem[i] = 32'd0;
        end

    $readmemh("memfile.hex",mem);
    mem[2048] = 32'h73; //ebreak
    mem[4096] = 32'h87654321;
    mem[4097] = 32'h08345678;
    mem[5000]= 32'h84755779;

    //dump file for testing
    dump_file = $fopen("memory_dump.txt", "w");
    if (dump_file == 0) begin
        $display("Error: Unable to open file for writing.");
        $finish;
    end
end


always @(posedge clk) begin
    if (dump) begin
        for (i = 0; i < 65536; i = i + 1) begin
            $fwrite(dump_file, "mem[%3d] = %h\n", i, mem[i]);
        end
        $fflush(dump_file);
        $display("Memory dumped to memory_dump.txt");
    end
end

endmodule
