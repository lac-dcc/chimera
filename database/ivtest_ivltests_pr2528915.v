// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module mainp_tb;

reg clk=0;
integer usb_stream;
// reg [15:0] out_usb_stream;

always @(posedge clk) begin
        // This should generate an error, not crash.
	$fwrite(usb_stream, "%c", out_usb_stream[7:0]);
end

endmodule
