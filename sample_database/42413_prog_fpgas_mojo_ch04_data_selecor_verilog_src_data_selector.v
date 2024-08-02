// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

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
