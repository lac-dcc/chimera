// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_bcdtosev;
    reg [3:0] bcd_in;
    wire [6:0] sev_out; 

    bcdtosev dut (
        .bcd_in(bcd_in),
        .sev_out(sev_out)
    );
    initial begin
        $dumpfile("bcdtosev.vcd");
        $dumpvars(0);
        #10;
        $monitor("BCD Input: %b, 7-Segment Output: %b", bcd_in, sev_out);

        bcd_in = 4'b0000;
        #10;
        bcd_in = 4'b0001;
        #10;
        bcd_in = 4'b0010;
        #10;
        bcd_in = 4'b0100;
        #10;
        bcd_in = 4'b1001;
        #10;
        bcd_in = 4'b1010;
        #10;
        $finish;
    end
endmodule
