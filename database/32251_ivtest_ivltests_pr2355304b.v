// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test2 ();
    reg [1:0] d;

    always @(posedge |d) begin
        $display ("PASSED");
    end
    initial begin
        d=0;
        # 1;
        d=6'b01;
    end
endmodule
