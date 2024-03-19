module out_en_gen (output reg E_en, W_en, N_en, S_en, Eject_en, 
                   input [2:0] S_E, S_W, S_N, S_S, S_eject, 
				   input e_push_o, w_push_o, n_push_o, s_push_o, j_push_o, input reset);
				   
  always @(*)
  begin
	if (reset)
		{E_en, W_en, N_en, S_en, Eject_en} = 5'b0; 
	else
	begin 
		{E_en, W_en, N_en, S_en, Eject_en} = 5'b0; 	
		if(e_push_o == 1)
		begin
		  if(S_E == 3'b000)
			E_en = 1;
		  if(S_W == 3'b000)
			W_en = 1;
		  if(S_N == 3'b000)
			N_en = 1;
		  if(S_S == 3'b000)
			S_en = 1;
		  if(S_eject == 3'b000)
			Eject_en = 1;
		end
		if(w_push_o == 1)
		begin
		  if(S_E == 3'b001)
			E_en = 1;
		  if(S_W == 3'b001)
			W_en = 1;
		  if(S_N == 3'b001)
			N_en = 1;
		  if(S_S == 3'b001)
			S_en = 1;
		  if(S_eject == 3'b001)
			Eject_en = 1;
		end
		if(n_push_o == 1)
		begin
		  if(S_E == 3'b010)
			E_en = 1;
		  if(S_W == 3'b010)
			W_en = 1;
		  if(S_N == 3'b010)
			N_en = 1;
		  if(S_S == 3'b010)
			S_en = 1;
		  if(S_eject == 3'b010)
			Eject_en = 1;
		end
		if(s_push_o == 1)
		begin
		  if(S_E == 3'b011)
			E_en = 1;
		  if(S_W == 3'b011)
			W_en = 1;
		  if(S_N == 3'b011)
			N_en = 1;
		  if(S_S == 3'b011)
			S_en = 1;
		  if(S_eject == 3'b011)
			Eject_en = 1;
		end
		if(j_push_o == 1)
		begin
		  if(S_E == 3'b100)
			E_en = 1;
		  if(S_W == 3'b100)
			W_en = 1;
		  if(S_N == 3'b100)
			N_en = 1;
		  if(S_S == 3'b100)
			S_en = 1;
		  if(S_eject == 3'b100)
			Eject_en = 1;
		end
	end
  end
  
  
  
  
endmodule