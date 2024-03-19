module Select_gen (output reg [2:0] s_e, s_w, s_n, s_s, s_eject, 
                   input e_g, w_g, n_g, s_g, inject_g, clk, reset, input [2:0] e_req, w_req, n_req, s_req, inject_req);
  
  
  always @(posedge clk)
  begin
    if(reset)
    begin
      s_e = 3'b111;
      s_w = 3'b111;
      s_n = 3'b111;
      s_s = 3'b111;
      s_eject = 3'b111;
    end
    else
    s_e = 3'd7;  
    s_w = 3'd7;  
    s_n = 3'd7;  
    s_s = 3'd7;  
    s_eject = 3'd7;  
    begin
      if(e_g == 1)
      begin
        case (e_req)
          3'b000: s_e = 3'b000;
          3'b001: s_w = 3'b000;
          3'b010: s_n = 3'b000;
          3'b011: s_s = 3'b000;
          3'b100: s_eject = 3'b000;
        endcase
      end
      if(w_g == 1)
      begin
        case (w_req)
          3'b000: s_e = 3'b001;
          3'b001: s_w = 3'b001;
          3'b010: s_n = 3'b001;
          3'b011: s_s = 3'b001;
          3'b100: s_eject = 3'b001;
        endcase
      end
      if(n_g == 1)
      begin
        case (n_req)
          3'b000: s_e = 3'b010;
          3'b001: s_w = 3'b010;
          3'b010: s_n = 3'b010;
          3'b011: s_s = 3'b010;
          3'b100: s_eject = 3'b010;
        endcase
      end
      if(s_g == 1)
      begin
        case (s_req)
          3'b000: s_e = 3'b011;
          3'b001: s_w = 3'b011;
          3'b010: s_n = 3'b011;
          3'b011: s_s = 3'b011;
          3'b100: s_eject = 3'b011;
        endcase
      end
      if(inject_g == 1)
      begin
        case (inject_req)
          3'b000: s_e = 3'b100;
          3'b001: s_w = 3'b100;
          3'b010: s_n = 3'b100;
          3'b011: s_s = 3'b100;
          3'b100: s_eject = 3'b100;
        endcase
      end
    end
    
  end
  
endmodule
