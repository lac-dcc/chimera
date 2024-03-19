module Route_Func (output reg [4:0] valid_out, status,  input [2:0] X_cur, Y_cur, X_dest, Y_dest, in_channel, input reset);
  
  /*
  0:E
  1:W
  2:N
  3:S
  4:Eject
  */
  //XY Routing
  always @(*)
  begin
	if (reset)
		{valid_out, status} = 10'b0;
	else
	begin
		{valid_out, status} = 10'b0;
		if(X_cur < X_dest)
		  valid_out[0] = 1;
		else if(X_cur > X_dest)
		  valid_out[1] = 1;
		else if(X_cur == X_dest)
		begin
		  if(Y_cur < Y_dest)
			valid_out[2] = 1;
		  else if(Y_cur > Y_dest)
			valid_out[3] = 1;
		  else
			valid_out[4] = 1;
		end
	end
  end
  
endmodule