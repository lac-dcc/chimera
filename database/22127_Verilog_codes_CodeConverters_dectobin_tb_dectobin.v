// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_dectobin;
reg [3:0] decimal;
wire [3:0] binary;

dectobin uut (.decimal(decimal), .binary(binary));

initial begin
    $dumpfile("dectobin.vcd");
    $dumpvars(0, tb_dectobin);
    $monitor($time," Input: %d, Output: %b", decimal, binary);
    decimal = 4'b0000;
    #10 decimal = 4'b0001;
    #10 decimal = 4'b0010;
    #10 decimal = 4'b0011;
    #10 decimal = 4'b0100;
    #10 decimal = 4'b0101;
    #10 decimal = 4'b0110;
    #10 decimal = 4'b0111;
    #10 decimal = 4'b1000;
    #10 decimal = 4'b1001;
    #10 $finish;
end
endmodule