module output_buffer_availablity (output reg e_a, w_a, n_a, s_a, eject_a, input clk,
                                  input [2:0] e_empl, w_empl, n_empl, s_empl, eject_empl, 
								  input reset, e_allocOrnot, w_allocOrnot, n_allocOrnot, s_allocOrnot, eject_allocOrnot);
                                  
                                  
  always @(*)
  begin
	if(reset)
		{e_a, w_a, n_a, s_a, eject_a} = 5'b11111;
	else
	begin
		{e_a, w_a, n_a, s_a, eject_a} = 5'b0;
		if(e_allocOrnot == 0 && (e_empl > 3'd0))
		begin
		  e_a = 1;
		end
		if(w_allocOrnot == 0 && (w_empl > 3'd0))
		begin
		  w_a = 1;
		end
		if(n_allocOrnot == 0 && (n_empl > 3'd0))
		begin
		  n_a = 1;
		end
		if(s_allocOrnot == 0 && (s_empl > 3'd0))
		begin
		  s_a = 1;
		end
		if(eject_allocOrnot == 0 && (eject_empl > 3'd0))
		begin
		  eject_a = 1;
		end
	end
  end
                                  
endmodule