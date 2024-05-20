// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

module register_file(data,rs1,rs2,rsd,rw,out1,out2,clk);
reg [31:0] reg_file [31:0];
input clk;
input [4:0]rsd;
input [4:0]rs1;
input [4:0]rs2;
input [31:0] data;
input rw;
output [31:0]out1;
output [31:0]out2;
reg [31:0]outbuffer1;
reg [31:0]outbuffer2;

initial begin
    reg_file[0] = 32'b0;
    reg_file[1] = 32'b0;
    reg_file[2] = 32'b1;
    reg_file[3] = 32'b1;
    reg_file[4] = 32'b0;
    reg_file[5] = 32'b0;
    reg_file[6] = 32'b0;
    reg_file[7] = 32'b0;
    reg_file[8] = 32'b0;
    reg_file[9] = 32'b0;
    reg_file[10] = 32'b0;
    reg_file[11] = 32'b0;
    reg_file[12] = 32'b0;
    reg_file[13] = 32'b0;
    reg_file[14] = 32'b0;
    reg_file[15] = 32'b0;
    reg_file[16] = 32'b0;
    reg_file[17] = 32'b0;
    reg_file[18] = 32'b0;
    reg_file[19] = 32'b0;
    reg_file[20] = 32'b0;
    reg_file[21] = 32'b0;
    reg_file[22] = 32'b0;
    reg_file[23] = 32'b0;
    reg_file[24] = 32'b0;
    reg_file[25] = 32'b0;
    reg_file[26] = 32'b0;
    reg_file[27] = 32'b0;
    reg_file[28] = 32'b0;
    reg_file[29] = 32'b0;
    reg_file[30] = 32'b0;
    reg_file[31] = 32'b0;
end

always @(*) begin
    if (rw==1'b1 && rsd!=1'b0) begin
        reg_file[rsd] <= data;
        $display("wrote %d to %d reg",data,rsd);
    end
    outbuffer1 <= reg_file[rs1];
    outbuffer2 <= reg_file[rs2];
    $display("read %d from %d reg",outbuffer1,rs1);
    
end
assign out1 = outbuffer1;
assign out2 = outbuffer2;
endmodule