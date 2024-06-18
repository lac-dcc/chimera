// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/* From PR#722
 * If bounds checking is in a 16bit field, this will crash.
 */
module test;

    reg [65536 : 0] mem;
    integer i;

    initial begin
        i = 65536;
        mem[i] = 1;
        if (mem[i] !== 1) begin
            $display ("FAILED -- bit %0d (%b)", i, mem[i]);
            $finish;
        end
        $display("PASSED");
    end

endmodule
