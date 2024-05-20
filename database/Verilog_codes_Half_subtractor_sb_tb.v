// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

// Half Subtractor Testbench
module sb_tb;
    reg a, b;
    wire diff, borrow;

    // Instantiate the Half Subtractor module
    half_subtractor sb_inst(.a(a), .b(b), .diff(diff), .borrow(borrow));

    // Apply test inputs
    initial begin
        $dumpfile("half_subtractor.vcd"); // Specify the dumpfile name
        $dumpvars(0, sb_tb); // Dump all variables

        $display("Half Subtractor Testbench");
        $display("-------------------------");
        $display("Inputs\t|\tOutputs");
        $display("-------------------------");

        // Test case 1
        a = 0; b = 0;
        #10;
        $display("%b %b\t|\t%b %b", a, b, diff, borrow);

        // Test case 2
        a = 0; b = 1;
        #10;
        $display("%b %b\t|\t%b %b", a, b, diff, borrow);

        // Test case 3
        a = 1; b = 0;
        #10;
        $display("%b %b\t|\t%b %b", a, b, diff, borrow);

        // Test case 4
        a = 1; b = 1;
        #10;
        $display("%b %b\t|\t%b %b", a, b, diff, borrow);

        $finish;
    end
endmodule
