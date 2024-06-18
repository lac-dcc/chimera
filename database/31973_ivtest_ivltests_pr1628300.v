// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug;

function real sin;
	input x;
	real x;
	sin = 1.570794*x;
endfunction

real ax, ay;
initial begin
	ax = 2.0;
	ay = sin(ax);
	$display("sin(%g) is not really %g", ax, ay);
end
endmodule
