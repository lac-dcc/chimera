module counter(
    input Clock,
    output reg [3:0] Q
    );
	 
always @(posedge Clock)
begin
	Q <= Q + 1;
end

endmodule
