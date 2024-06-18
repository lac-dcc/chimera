// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Program8_4 (clk, rst, address, out0, out1, out2, out3);
    parameter UUID = 0;
    parameter NAME = "";
    parameter MAX_WORD_COUNT = 256;
    parameter DEFAULT_FILE_NAME = "test_jumps.mem";
    parameter ARG_SIG = "FILE_NAME=%s";
    reg [1024*8:0] hex_file;
    input clk;
    input rst;
    input [7:0] address;
    output reg [7:0] out0;
    output reg [7:0] out1;
    output reg [7:0] out2;
    output reg [7:0] out3;

    reg [7:0] mem [0:MAX_WORD_COUNT];
    
    integer fd;
    integer i;

    initial begin
        hex_file = DEFAULT_FILE_NAME;
        i = ($value$plusargs(ARG_SIG, hexfile));
        $display("loading %0s", hexfile);
        fd = $fopen(hexfile, "r");
        if (fd) begin
            i = 0;
            while (!$feof(fd) && i < MAX_WORD_COUNT) begin
                mem[i] = $fgetc(fd);
                i = i + 1;
            end
            $display("read %0d bytes", i);
        end else begin
            $display("file not found");
        end
        $fclose(fd);
        out0 = 8'b0000_0000;
        out1 = 8'b0000_0000;
        out2 = 8'b0000_0000;
        out3 = 8'b0000_0000;
    end

    always @ (address or rst) begin
        if (rst) begin
            out0 = 8'b0000_0000;
            out1 = 8'b0000_0000;
            out2 = 8'b0000_0000;
            out3 = 8'b0000_0000;
        end else begin
            out0 = mem[address];
            out1 = mem[address+1];
            out2 = mem[address+2];
            out3 = mem[address+3];
        end
    end
endmodule
