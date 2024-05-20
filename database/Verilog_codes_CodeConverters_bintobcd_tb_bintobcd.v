// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_bintobcd;

reg [3:0] binary;
wire [3:0] bcd;

bintobcd UUT(
    .binary(binary),
    .bcd(bcd)
);

initial begin
    $dumpfile("bintobcd.vcd");
    $dumpvars(0);
    $monitor("Binary: %b, BCD: %b", binary, bcd);
    
    binary = 4'b0000; #10;
    binary = 4'b0001; #10;
    binary = 4'b0010; #10;
    binary = 4'b0011; #10;
    binary = 4'b0100; #10;
    binary = 4'b0101; #10;
    binary = 4'b0110; #10;
    binary = 4'b0111; #10;
    binary = 4'b1000; #10;
    binary = 4'b1001; #10;
    $finish;
end

endmodule