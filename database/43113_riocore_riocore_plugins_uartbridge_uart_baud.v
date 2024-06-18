// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0

/* verilator lint_off WIDTHTRUNC */
/* verilator lint_off WIDTHEXPAND */

module uart_baud(
	input clk, enable,
	output tick  // generate a tick at the specified baud rate * oversampling
);
    parameter ClkFrequency = 12000000;
    parameter Baud = 2000000;
    parameter Oversampling = 1;

    function integer log2(input integer v); begin log2=0; while(v>>log2) log2=log2+1; end endfunction
    localparam AccWidth = log2(ClkFrequency/Baud)+8;  // +/- 2% max timing error over a byte
    reg [AccWidth:0] Acc = 0;
    localparam ShiftLimiter = log2(Baud*Oversampling >> (31-AccWidth));  // this makes sure Inc calculation doesn't overflow
    localparam Inc = ((Baud*Oversampling << (AccWidth-ShiftLimiter))+(ClkFrequency>>(ShiftLimiter+1)))/(ClkFrequency>>ShiftLimiter);
    always @(posedge clk) if(enable) Acc <= Acc[AccWidth-1:0] + Inc[AccWidth:0]; else Acc <= Inc[AccWidth:0];
    assign tick = Acc[AccWidth];
endmodule
