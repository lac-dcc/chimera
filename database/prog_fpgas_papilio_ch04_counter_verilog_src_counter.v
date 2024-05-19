// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

module counter(
    input Clock,
    output reg [3:0] Q
    );
	 
always @(posedge Clock)
begin
	Q <= Q + 1;
end

endmodule
