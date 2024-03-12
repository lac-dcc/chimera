// 2 traffic lights between sides a and b that are perpendicular to one another.
// a : N-s traffic lights.
// b : E-W traffic lights.
// Functionality of traffic lights is independent of one another.
// Logic is simple, when green then move otherwise stop.
 
module traffic_four(ar,ag,ay,br,bg,by,a_move,b_move);
	input ar,ag,ay,br,bg,by;
	output a_move,b_move ;
	reg a_move,b_move;
	always @(*) begin
	if(ag==1)
		begin
		    a_move=1;
		end
	else 
		begin
		    a_move=0;
		end
		
	if(bg==1)
		begin
		    b_move=1;
		end
	else 
		begin
		    b_move=0;
		end
		
	end
endmodule




module testbench;

	reg ar,ag,ay,br,bg,by;
	wire a_move,b_move;
	traffic_four t(ar,ag,ay,br,bg,by,a_move,b_move);
	initial begin
	$dumpfile("vcd/TrafficLightsTwo.vcd");
	$dumpvars(0,testbench);
	$display("ar\tag\tay\t\tbr\tbg\tby\t\ta_move\tb_move");
	$monitor("%b\t%b\t%b\t\t%b\t%b\t%b\t\t%b\t%b\t",ar,ag,ay,br,bg,by,a_move,b_move);

		ag=0;    ar=1;    ay=0;    bg=1;    br=0;    by=0;    #30
		ag=0;    ar=1;    ay=0;    bg=0;    br=0;    by=1;    #15
		ag=1;    ar=0;    ay=0;    bg=0;    br=1;    by=0;    #30
		ag=0;    ar=0;    ay=1;    bg=0;    br=1;    by=0;    #15
	$finish;

	end
endmodule
