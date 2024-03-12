module data_selector(
    input A,
    input B,
    input SEL,
    output reg Q
    );

always @(A or B or SEL)
begin
	if (SEL) 
		Q = A;
	else
		Q = B;
end

endmodule
