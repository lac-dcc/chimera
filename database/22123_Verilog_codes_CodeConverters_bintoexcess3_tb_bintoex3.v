// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_bintoex3;
reg [3:0] binary;
wire [3:0] excess3;

bintoex3 uut (.binary(binary), .excess3(excess3));
initial begin
    $dumpfile("bintoex3.vcd");
    $dumpvars(0, tb_bintoex3);
    $monitor($time, " Binary Input: %b, Excess-3 Output: %b", binary, excess3);

    binary = 4'b0000;
    #10 binary = 4'b0001;
    #10 binary = 4'b0010;
    #10 binary = 4'b0011;
    #10 binary = 4'b0100;
    #10 binary = 4'b0101;
    #10 binary = 4'b0110;
    #10 binary = 4'b0111;
    #10 binary = 4'b1000;
    #10 binary = 4'b1001;
    #10 binary = 4'b1010;
    #10 binary = 4'b1011;
    #10 binary = 4'b1100;
    #10 binary = 4'b1101;
    #10 binary = 4'b1110;
    #10 binary = 4'b1111;
    #10 $finish;
end
endmodule