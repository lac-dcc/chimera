module set_Alloc (output reg alloc_e, alloc_w, alloc_n, alloc_s, alloc_j, 
				  input e_vc_grant, w_vc_grant, n_vc_grant, s_vc_grant, j_vc_grant,reset,
                  input [2:0] e_req, w_req, n_req, s_req, j_req);
                  
 // inputs requests for outputs
 
  always @(*)
  begin
	if (reset)
		{alloc_e, alloc_w, alloc_n, alloc_s, alloc_j} = 5'b0;
	else
	begin
		{alloc_e, alloc_w, alloc_n, alloc_s, alloc_j} = 5'b0;
		if(e_vc_grant == 1)
		begin
		  case (e_req)
			3'b000:
			  alloc_e = 1;
			3'b001:
			  alloc_w = 1;
			3'b010:
			  alloc_n = 1;
			3'b011:
			  alloc_s = 1;
			3'b100:
			  alloc_j = 1;
		  endcase
		end
		if(w_vc_grant == 1)
		begin
		  case (w_req)
			3'b000:
			  alloc_e = 1;
			3'b001:
			  alloc_w = 1;
			3'b010:
			  alloc_n = 1;
			3'b011:
			  alloc_s = 1;
			3'b100:
			  alloc_j = 1;
		  endcase
		end
		if(n_vc_grant == 1)
		begin
		  case (n_req)
			3'b000:
			  alloc_e = 1;
			3'b001:
			  alloc_w = 1;
			3'b010:
			  alloc_n = 1;
			3'b011:
			  alloc_s = 1;
			3'b100:
			  alloc_j = 1;
		  endcase
		end
		if(s_vc_grant == 1)
		begin
		  case (s_req)
			3'b000:
			  alloc_e = 1;
			3'b001:
			  alloc_w = 1;
			3'b010:
			  alloc_n = 1;
			3'b011:
			  alloc_s = 1;
			3'b100:
			  alloc_j = 1;
		  endcase
		end
		if(j_vc_grant == 1)
		begin
		  case (j_req)
			3'b000:
			  alloc_e = 1;
			3'b001:
			  alloc_w = 1;
			3'b010:
			  alloc_n = 1;
			3'b011:
			  alloc_s = 1;
			3'b100:
			  alloc_j = 1;
		  endcase
		end
	end	
  end
  
endmodule
