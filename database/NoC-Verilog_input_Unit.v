module input_Unit(output [63:0] bf_out,  
				  output reg en, 
				  output [2:0] em_pl, 
				  output reg [2:0] out_num, 
				  output reg PW, vc_g, vc_f, push_o,
                  input clk, reset, push_x, PW_fail, vc_grant, ST_ack, 
				  input [63:0] bf_in, input [2:0] X_cur, Y_cur, in_channel, output reg push_ack);
  
  wire [4:0] valid_out, status;
  reg [2:0] X_dest, Y_dest;

  reg Pri;
  reg pop;
  reg push;
  
  reg [2:0] state;
  reg [2:0] next_state;
  
  always @(posedge clk)
  begin
   // if(X_cur == 3'd4 && Y_cur == 3'd1 && in_channel == 3'd1)
   //   $display("%b",bf_out);
  end
  
  always @(posedge clk)
  begin
    if(reset)
      state <= 3'b0;
    else
      state <= next_state;
  end
  
  always @(*)
  begin
    case (state)
      3'b000:
      begin
        if(vc_grant == 0)
          next_state = 3'b0;
        else
          next_state = 3'b1;
      end
      3'b001:
      begin
        if(ST_ack)
          next_state = 3'b010;
        else
          next_state = 3'b001;
      end
      3'b010: next_state = 3'b011;
      3'b011: next_state = 3'b100;
      3'b100: next_state = 3'b101;
      3'b101: next_state = 3'b110;
      3'b110: next_state = 3'b000;
    endcase
  end
  
  always @(*)
  begin
    case (state)
      3'b000: 
      begin
        {vc_f,push_o,pop} = 3'b100;
        if(vc_grant == 1)
          vc_f = 0;
      end
      3'b001: {vc_f,push_o,pop} = 3'b000;
      3'b010: {vc_f,push_o,pop} = 3'b011;
      3'b011: {vc_f,push_o,pop} = 3'b011;
      3'b100: {vc_f,push_o,pop} = 3'b011;
      3'b101: {vc_f,push_o,pop} = 3'b011;
      3'b110: {vc_f,push_o,pop} = 3'b100;
    endcase
  end
      
  
  Buffer bf (bf_out, em_pl, clk, reset, pop, push, bf_in);
  Route_Func RF(valid_out, status, X_cur, Y_cur, X_dest, Y_dest, in_channel, reset);
  
  //always @()
  
  always @(*)
  begin
	if (reset)
	begin
		push = 0;
		push_ack = 0;
	end
	else
	begin
		push = 0;
		push_ack = 0;
		if(bf_in[63:62] == 2'b11 && em_pl == 3'd4)
		begin
			push = push_x;// output req or inj
			push_ack = push_x;
		end
		else if(bf_in[63:62] == 2'b01 || bf_in[63:62] == 2'b10)
		begin
			push = push_x;
			push_ack = push_x;
		end
	end
  end
  
  always @(*)
  begin
	if (reset)
		en=0;
	else
	begin
		en = 0;
		if(bf_out[63:62] == 2'b11 && em_pl < 3'd4)  
		begin
			X_dest = bf_out[8:6];
			Y_dest = bf_out[11:9];
			en = 1;
			Pri = Pri + 1;
		end
	end
  end
  
  always @(posedge clk)
  begin
    if(reset)
    begin
      vc_g = 0;
    end
    else
    begin
      if(bf_out[63:62] == 2'b11)
      begin
        vc_g = vc_grant;
      end
    end
  end // unused
  
/*  always @(posedge clk)
  begin
    if(reset)
    begin
      pop = 1'b0;
      push_o = 1'b0;
  //    vc_f = 1;
    end
    else
    begin
      pop = ST_ack & vc_grant;
      push_o = ST_ack & vc_grant;
    end
    if(bf_out[63:62] == 2'b11 && em_pl < 3'd4) // if Head
    begin
      if(vc_grant)
        vc_f = 0; 
    end
    else if(bf_out[63:62] == 2'b10)// if tail
    begin
      if(ST_ack == 1 && vc_grant == 1)
      begin
        vc_f = 1;
        push_o = 0;
      end
    end
    if(em_pl == 3'd4)
    begin
      pop = 1'b0;
      push_o = 1'b0;
      vc_f = 1'b1;
    end
  end*/

  always @(*)
  begin
	if(reset)
	begin
		PW = 0;
		out_num=5;
    end
	else
	case (valid_out)
      5'b10000:
        out_num = 4;
      5'b01000:
        out_num = 3;
      5'b00100:
        out_num = 2;
      5'b00010:
        out_num = 1;
      5'b00001:
        out_num = 0;
      5'b00101:
      begin
        if(status[0] == 1)
        begin
          if(PW_fail == 0)
          begin
            out_num = 0;
            PW = 1;
          end
          else
          begin
            out_num = 2;
            PW = 0;
          end
        end
        else if(status[2] == 1)
        begin
          if(PW_fail == 0)
          begin
            out_num = 2;
            PW = 1;
          end
          else
          begin
            out_num = 0;
            PW = 0;
          end
        end
        else
        begin
          PW = 0;
          if(Pri == 0)
            out_num = 0;         
          else
            out_num = 2;
        end
      end
      
      5'b00110:
      begin
        if(status[1] == 1)
        begin
          if(PW_fail == 0)
          begin
            out_num = 1;
            PW = 1;
          end
          else
          begin
            out_num = 2;
            PW = 0;
          end
        end
        else if(status[2] == 1)
        begin
          if(PW_fail == 0)
          begin
            out_num = 2;
            PW = 1;
          end
          else
          begin
            out_num = 1;
            PW = 0;
          end
        end
        else
        begin
          PW = 0;
          if(Pri == 0)
            out_num = 1;         
          else
            out_num = 2;
        end
      end
      
      5'b01001:
      begin
        if(status[0] == 1)
        begin
          if(PW_fail == 0)
          begin
            out_num = 0;
            PW = 1;
          end
          else
          begin
            out_num = 3;
            PW = 0;
          end
        end
        else if(status[3] == 1)
        begin
          if(PW_fail == 0)
          begin
            out_num = 3;
            PW = 1;
          end
          else
          begin
            out_num = 0;
            PW = 0;
          end
        end
        else
        begin
          PW = 0;
          if(Pri == 0)
            out_num = 0;         
          else
            out_num = 3;
        end
      end
      
      5'b01010:
      begin
        if(status[1] == 1)
        begin
          if(PW_fail == 0)
          begin
            out_num = 1;
            PW = 1;
          end
          else
          begin
            out_num = 3;
            PW = 0;
          end
        end
        else if(status[3] == 1)
        begin
          if(PW_fail == 0)
          begin
            out_num = 3;
            PW = 1;
          end
          else
          begin
            out_num = 1;
            PW = 0;
          end
        end
        else
        begin
          PW = 0;
          if(Pri == 0)
            out_num = 1;         
          else
            out_num = 3;
        end
      end
      
      default:
      begin
        PW = 0;
        out_num = 5;
      end
            
    endcase
  end
  
  
    
  
  
  
endmodule
