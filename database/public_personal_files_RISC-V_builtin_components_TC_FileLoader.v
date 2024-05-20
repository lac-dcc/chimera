// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_FileLoader (clk, rst, en, address, out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter MAX_WORD_COUNT = 1024*1024;
    parameter DEFAULT_FILE_NAME = "test_jumps.mem";
    parameter ARG_SIG = "FILE_NAME=%s";
    integer filebytes;
    reg [1024*4:0] hexfile;
    
    input clk;
    input rst;
    input en;
    input [63:0] address;
    output reg [63:0] out;

    reg [7:0] mem [0:MAX_WORD_COUNT];
    integer fd;
    integer fsize;
    integer data;
    integer i;
    
    initial begin
        hexfile = DEFAULT_FILE_NAME;
        filebytes = MAX_WORD_COUNT;

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
        out = {64{1'b0}};

        //fid = $fopen(hexfile, "rb");
        //if (fid == 0) begin
        //    $display("cannot open file");
        //    $stop;
        //end
        //fsize = $fseek(fid, 0, 2);
        //if (fsize == -1) begin
        //    $display("cannot move file pointer");
        //    $stop;
        //end
        //fsize = $ftell(fid);
        //$display("file is %0d bytes", fsize); 
        //$fseek(fid, 0, 0);
        //data = $fread(fid, mem[0]);
        //$display("read %0d vectors\n", data);
        //data = $fcloser(fid);
        //$fclose(fid);
    end

    always @ (address or en or rst) begin
        if (rst || !en) begin
            out = {64{1'b0}};
        end else if (address == {64{1'b1}}) begin
            out = filebytes;
        end else begin
            if (address < MAX_WORD_COUNT)
                out[7:0] = mem[address];
            else
                out[7:0] = {8{1'b0}};
            if (address+1 < MAX_WORD_COUNT)
                out[15:8] = mem[address+1];
            else
                out[15:8] = {8{1'b0}};
            if (address+2 < MAX_WORD_COUNT)
                out[23:16] = mem[address+2];
            else
                out[23:16] = {8{1'b0}};
            if (address+3 < MAX_WORD_COUNT)
                out[31:24] = mem[address+3];
            else
                out[31:24] = {8{1'b0}};
            if (address+4 < MAX_WORD_COUNT)
                out[39:32] = mem[address+4];
            else
                out[39:32] = {8{1'b0}};
            if (address+5 < MAX_WORD_COUNT)
                out[47:40] = mem[address+5];
            else
                out[47:40] = {8{1'b0}};
            if (address+6 < MAX_WORD_COUNT)
                out[55:48] = mem[address+6];
            else
                out[55:48] = {8{1'b0}};
            if (address+7 < MAX_WORD_COUNT)
                out[63:56] = mem[address+7];
            else
                out[63:56] = {8{1'b0}};
        end
    end
endmodule
