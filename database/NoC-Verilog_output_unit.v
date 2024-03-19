module output_unit (output [63:0] bf_out,  
					output reg write_req, allocOrnot, 
					output [2:0] em_pl,
					input clk, reset, push, next_router_state, alloc, 
                    input [63:0] bf_in, input write_req_ack);
  
  reg pop;
  reg push_x;
  Buffer bf (bf_out, em_pl, clk, reset, pop, push_x, bf_in);

  always @(*)
  begin
    push_x = push;
    if(push == 0 && em_pl > 3'd0 && bf_in[63:62] == 2'b10 && (bf_out[63:62] == 2'b01 || bf_out[63:62] == 2'b11) )
      push_x = 1;
  end
  
  always @(*)
  begin
	if(reset)
		write_req = 0;
	else
	begin
	  write_req = 1'b0;
		if(next_router_state && (bf_out[63:62] != 2'b00) && (em_pl != 3'd4))
		begin
  		  write_req = 1'b1;
		end
	end
  end
  
  always @(*)
  begin
    pop = 0;
    if(write_req_ack == 1)
      pop = 1'b1;
  end
  
  always @(*)
  begin
    if(reset)
    begin
      allocOrnot = 0;
    end
    else
    begin
      allocOrnot = alloc;
    end
  end
  
endmodule
