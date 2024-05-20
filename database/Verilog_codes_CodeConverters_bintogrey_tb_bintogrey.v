// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_bintogrey;
    reg [3:0] bin_in;
    wire [3:0] grey_out;

    bintogrey dut (
        .bin_in(bin_in),
        .grey_out(grey_out)
    );

    initial begin
        $dumpfile("bintogrey.vcd");
        $dumpvars(0);
        #10;
        $monitor("Binary Input: %b, Grey Output: %b", bin_in, grey_out);

        bin_in = 4'b0000;
        #10;
        bin_in = 4'b0001;
        #10;
        bin_in = 4'b0010;
        #10;
        bin_in = 4'b0100;
        #10;
        bin_in = 4'b1001;
        #10;
        bin_in = 4'b1010;
        #10;
        $finish;
    end
endmodule
