module ST_Controler (output reg e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req, e_ack, w_ack, n_ack, s_ack, inject_ack,
                     input clk, reset, e_vc_alloc, w_vc_alloc, n_vc_alloc, s_vc_alloc, inject_vc_alloc, oe_en, ow_en, on_en, os_en, Eject_en, 
                     input [2:0] e_out, w_out, n_out, s_out, inject_out);
  
  
  always @(*)
  begin
	if( reset)
		{e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req} = 5'b0;
	else
	begin
		{e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req} = 5'b0;	
		if(e_vc_alloc == 1)
		begin
		  case (e_out)
			3'b000:
			  e_ST_req = 1;
			3'b001:
			  w_ST_req = 1;
			3'b010:
			  n_ST_req = 1;
			3'b011:
			  s_ST_req = 1;
			3'b100:
			  eject_ST_req = 1;      
			default:
			  {e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req} = 5'b0;
		  endcase
		end
		
		if(w_vc_alloc == 1)
		begin
		  case (w_out)
			3'b000:
			  e_ST_req = 1;
			3'b001:
			  w_ST_req = 1;
			3'b010:
			  n_ST_req = 1;
			3'b011:
			  s_ST_req = 1;
			3'b100:
			  eject_ST_req = 1;      
			default:
			  {e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req} = 5'b0;
		  endcase
		end
		
		if(n_vc_alloc == 1)
		begin
		  case (n_out)
			3'b000:
			  e_ST_req = 1;
			3'b001:
			  w_ST_req = 1;
			3'b010:
			  n_ST_req = 1;
			3'b011:
			  s_ST_req = 1;
			3'b100:
			  eject_ST_req = 1;      
			default:
			  {e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req} = 5'b0;
		  endcase
		end
		
		if(s_vc_alloc == 1)
		begin
		  case (s_out)
			3'b000:
			  e_ST_req = 1;
			3'b001:
			  w_ST_req = 1;
			3'b010:
			  n_ST_req = 1;
			3'b011:
			  s_ST_req = 1;
			3'b100:
			  eject_ST_req = 1;      
			default:
			  {e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req} = 5'b0;
		  endcase
		end
		
		if(inject_vc_alloc == 1)
		begin
		  case (inject_out)
			3'b000:
			  e_ST_req = 1;
			3'b001:
			  w_ST_req = 1;
			3'b010:
			  n_ST_req = 1;
			3'b011:
			  s_ST_req = 1;
			3'b100:
			  eject_ST_req = 1;      
			default:
			  {e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req} = 5'b0;
		  endcase
		end
	end
  end
  
  
  always @(posedge clk)
  begin
	if( reset )
		{e_ack, w_ack, n_ack, s_ack, inject_ack} = 5'b0;
	else
	begin
		{e_ack, w_ack, n_ack, s_ack, inject_ack} = 5'b0;
		if(oe_en == 1)
		begin
		  if(e_out == 3'd0 && e_vc_alloc)
			e_ack = 1;
		  else if(w_out == 3'd0 && w_vc_alloc)
			w_ack = 1;
		  else if(n_out == 3'd0 && n_vc_alloc)
			n_ack = 1;
		  else if(s_out == 3'd0 && s_vc_alloc)
			s_ack = 1;
		  else if(inject_out == 3'd0 && inject_vc_alloc)
			inject_ack = 1;
		end
		if(ow_en == 1)
		begin
		  if(e_out == 3'd1 && e_vc_alloc)
			e_ack = 1;
		  else if(w_out == 3'd1 && w_vc_alloc)
			w_ack = 1;
		  else if(n_out == 3'd1 && n_vc_alloc)
			n_ack = 1;
		  else if(s_out == 3'd1 && s_vc_alloc)
			s_ack = 1;
		  else if(inject_out == 3'd1 && inject_vc_alloc)
			inject_ack = 1;
		end
		if(on_en == 1)
		begin
		  if(e_out == 3'd2 && e_vc_alloc)
			e_ack = 1;
		  else if(w_out == 3'd2 && w_vc_alloc)
			w_ack = 1;
		  else if(n_out == 3'd2 && n_vc_alloc)
			n_ack = 1;
		  else if(s_out == 3'd2 && s_vc_alloc)
			s_ack = 1;
		  else if(inject_out == 3'd2 && inject_vc_alloc)
			inject_ack = 1;
		end
		if(os_en == 1)
		begin
		  if(e_out == 3'd3 && e_vc_alloc)
			e_ack = 1;
		  else if(w_out == 3'd3 && w_vc_alloc)
			w_ack = 1;
		  else if(n_out == 3'd3 && n_vc_alloc)
			n_ack = 1;
		  else if(s_out == 3'd3 && s_vc_alloc)
			s_ack = 1;
		  else if(inject_out == 3'd3 && inject_vc_alloc)
			inject_ack = 1;
		end
		if(Eject_en == 1)
		begin
      if(e_out == 3'd4 && e_vc_alloc)
        e_ack = 1;
      else if(w_out == 3'd4 && w_vc_alloc)
        w_ack = 1;
      else if(n_out == 3'd4 && n_vc_alloc)
        n_ack = 1;
      else if(s_out == 3'd4 && s_vc_alloc)
        s_ack = 1;
      else if(inject_out == 3'd4 && inject_vc_alloc)
        inject_ack = 1;
    end
	end
  end
  
endmodule