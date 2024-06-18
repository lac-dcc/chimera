// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_dectobcd;

reg [3:0] dec_in;
wire [3:0] bcd_out;

dectobcd dut (
    .dec_in(dec_in),
    .bcd_out(bcd_out)
);
initial begin
    $dumpfile("dectobcd.vcd");
    $dumpvars(0);
    #10;
    $monitor("Decimal Input: %d, BCD Output: %b", dec_in, bcd_out);

    dec_in = 4'b0000;
    #10;
    dec_in = 4'b0001;
    #10;
    dec_in = 4'b0010;
    #10;
    dec_in = 4'b0100;
    #10;
    dec_in = 4'b1001;
    #10;
    dec_in = 4'b1010;
    #10;
    $finish;

end
endmodule
