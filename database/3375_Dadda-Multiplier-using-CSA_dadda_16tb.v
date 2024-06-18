// This program was cloned from: https://github.com/tharunchitipolu/Dadda-Multiplier-using-CSA
// License: Mozilla Public License 2.0

module dadda_16tb();
    parameter M=16,N=16;

reg [N-1:0]A;
reg [M-1:0]B;
wire [N+M-1:0]Y;



//---- Instantiation of main test module----
//Array_MUL_USign #(64,64) UUT(A,B,Y); //M=4,N=6
dadda_16 UUT(.A(A),.B(B),.Y(Y));


// initializing the inputs to the test module
// initial block executes only once

initial
repeat(15)
begin
	#10 A = $random; B = $random;
	#100//give required simulation time to complete the operation one by one.
	#100
	#10
	//-----VERIFICATION OF THE OBTAINED RESULT WITH EXISTING RESULT------
	$display(" A=%d,B=%d,AxB=%d",(A),(B),(Y));

	if( (A)*(B) != (Y)) 
		$display(" *ERROR* ");
        end
endmodule
