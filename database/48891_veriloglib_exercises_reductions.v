// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module reductions ();
    initial begin
        #10;
        $display("AND Reduction of 4'b1101 is: %b", &4'b1101);
        $display("NAND Reduction of 4'b1101 is: %b", ~&4'b1101);
        $display("OR Reduction of 4'b1101 is: %b", |4'b1101);
        $display("NOR Reduction of 4'b1101 is: %b", ~|4'b1101);
        $display("XOR Reduction of 4'b1101 is: %b", ^4'b1101);
        $display("XNOR Reduction of 4'b1101 is: %b", ~^4'b1101);
    end
endmodule
