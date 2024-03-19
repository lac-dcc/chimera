module VC_Alloc (output reg vc_g_e, vc_g_w, vc_g_n, vc_g_s, vc_g_injec, input clk, reset,
                 input [2:0] E_req, W_req, N_req, S_req, Inject_req,
				 input oe_en, ow_en, on_en, os_en, eject_en, 
				 input ie_en, iw_en, in_en, is_en, inject_en,
				 vc_e_f, vc_w_f, vc_n_f, vc_s_f, vc_j_f);
   
  reg en_c_e, en_c_w, en_c_n, en_c_s, en_c_j;
  wire [2:0] count_e, count_w, count_n, count_s, count_j;
  
  Counter c_e(count_e, reset, clk, en_c_e);
  Counter c_w(count_w, reset, clk, en_c_w);
  Counter c_n(count_n, reset, clk, en_c_n);
  Counter c_s(count_s, reset, clk, en_c_s);
  Counter c_j(count_j, reset, clk, en_c_j);
  
  always @(posedge clk)
  begin
    if(reset)
    begin
      {vc_g_e, vc_g_w, vc_g_n, vc_g_s, vc_g_injec} = 5'b0;
      {en_c_e, en_c_w, en_c_n, en_c_s, en_c_j} = 5'b11111;
    end
    else
    begin
    if(vc_e_f == 1)
    begin
      if(vc_g_e == 1)
      begin  
        case (E_req)
          3'b000: en_c_e = 1;
          3'b001: en_c_w = 1;
          3'b010: en_c_n = 1;
          3'b011: en_c_s = 1;
          3'b100: en_c_j = 1; 
        endcase
        vc_g_e = 0;
      end
    end
    if(vc_w_f == 1)
    begin
      if(vc_g_w == 1)
      begin  
        case (W_req)
          3'b000: en_c_e = 1;
          3'b001: en_c_w = 1;
          3'b010: en_c_n = 1;
          3'b011: en_c_s = 1;
          3'b100: en_c_j = 1;  
        endcase
        vc_g_w = 0;
      end
    end
    if(vc_n_f == 1)
    begin
      if(vc_g_n == 1)
      begin  
        case (N_req)
          3'b000: en_c_e = 1;
          3'b001: en_c_w = 1;
          3'b010: en_c_n = 1;
          3'b011: en_c_s = 1;
          3'b100: en_c_j = 1;  
        endcase
        vc_g_n = 0;
      end
    end
    if(vc_s_f == 1)
    begin
      if(vc_g_s == 1)
      begin  
        case (S_req)
          3'b000: en_c_e = 1;
          3'b001: en_c_w = 1;
          3'b010: en_c_n = 1;
          3'b011: en_c_s = 1;
          3'b100: en_c_j = 1;  
        endcase
        vc_g_s = 0;
      end
    end
    if(vc_j_f == 1)
    begin
      if(vc_g_injec == 1)
      begin  
        case (Inject_req)
          3'b000: en_c_e = 1;
          3'b001: en_c_w = 1;
          3'b010: en_c_n = 1;
          3'b011: en_c_s = 1;
          3'b100: en_c_j = 1;  
        endcase
        vc_g_injec = 0;
      end
    end
      
    if(oe_en == 1) 
    begin
      case (count_e)
        3'b000:
        begin
          if(E_req == 3'd0 && ie_en)
          begin
            vc_g_e = 1;
            en_c_e = 0;
          end
          else if(W_req == 3'd0 && iw_en)
          begin
            vc_g_w = 1;
            en_c_e = 0;
          end
          else if(N_req == 3'd0 && in_en)
          begin
            vc_g_n = 1;
            en_c_e = 0;
          end
          else if(S_req == 3'd0 && is_en)
          begin
            vc_g_s = 1;
            en_c_e = 0;
          end
          else if(Inject_req == 3'd0 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_e = 0;
          end
        end
        3'b001:
        begin
          if(W_req == 3'd0 && iw_en)
          begin
            vc_g_w = 1;
            en_c_e = 0;
          end
          else if(N_req == 3'd0 && in_en)
          begin
            vc_g_n = 1;
            en_c_e = 0;
          end
          else if(S_req == 3'd0 && is_en)
          begin
            vc_g_s = 1;
            en_c_e = 0;
          end
          else if(Inject_req == 3'd0 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_e = 0;
          end
          else if(E_req == 3'd0 && ie_en)
          begin
            vc_g_e = 1;
            en_c_e = 0;
          end
        end
        3'b010:
        begin
          if(N_req == 3'd0 && in_en)
          begin
            vc_g_n = 1;
            en_c_e = 0;
          end
          else if(S_req == 3'd0 && is_en)
          begin
            vc_g_s = 1;
            en_c_e = 0;
          end
          else if(Inject_req == 3'd0 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_e = 0;
          end
          else if(E_req == 3'd0 && ie_en)
          begin
            vc_g_e = 1;
            en_c_e = 0;
          end
          else if(W_req == 3'd0 && iw_en)
          begin
            vc_g_w = 1;
            en_c_e = 0;
          end
        end
        3'b011:
        begin
          if(S_req == 3'd0 && is_en)
          begin
            vc_g_s = 1;
            en_c_e = 0;
          end
          else if(Inject_req == 3'd0 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_e = 0;
          end
          else if(E_req == 3'd0 && ie_en)
          begin
            vc_g_e = 1;
            en_c_e = 0;
          end
          else if(W_req == 3'd0 && iw_en)
          begin
            vc_g_w = 1;
            en_c_e = 0;
          end
          else if(N_req == 3'd0 && in_en)
          begin
            vc_g_n = 1;
            en_c_e = 0;
          end
        end
        3'b100:
        begin
          if(Inject_req == 3'd0 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_e = 0;
          end
          else if(E_req == 3'd0 && ie_en)
          begin
            vc_g_e = 1;
            en_c_e = 0;
          end
          else if(W_req == 3'd0 && iw_en)
          begin
            vc_g_w = 1;
            en_c_e = 0;
          end
          else if(N_req == 3'd0 && in_en)
          begin
            vc_g_n = 1;
            en_c_e = 0;
          end
          else if(S_req == 3'd0 && is_en)
          begin
            vc_g_s = 1;
            en_c_e = 0;
          end
        end
        default:
          {vc_g_e, vc_g_w, vc_g_n, vc_g_s, vc_g_injec} = 5'b0;
      endcase
    end
    
    if(ow_en == 1)
    begin
      case (count_w)
        3'b000:
        begin
          if(E_req == 3'd1 && ie_en)
          begin
            vc_g_e = 1;
            en_c_w = 0;
          end
          else if(W_req == 3'd1 && iw_en)
          begin
            vc_g_w = 1;
            en_c_w = 0;
          end
          else if(N_req == 3'd1 && in_en)
          begin
            vc_g_n = 1;
            en_c_w = 0;
          end
          else if(S_req == 3'd1 && is_en)
          begin
            vc_g_s = 1;
            en_c_w = 0;
          end
          else if(Inject_req == 3'd1 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_w = 0;
          end
        end
        3'b001:
        begin
          if(W_req == 3'd1 && iw_en)
          begin
            vc_g_w = 1;
            en_c_w = 0;
          end
          else if(N_req == 3'd1 && in_en)
          begin
            vc_g_n = 1;
            en_c_w = 0;
          end
          else if(S_req == 3'd1 && is_en)
          begin
            vc_g_s = 1;
            en_c_w = 0;
          end
          else if(Inject_req == 3'd1 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_w = 0;
          end
          else if(E_req == 3'd1 && ie_en)
          begin
            vc_g_e = 1;
            en_c_w = 0;
          end
        end
        3'b010:
        begin
          if(N_req == 3'd1 && in_en)
          begin
            vc_g_n = 1;
            en_c_w = 0;
          end
          else if(S_req == 3'd1 && is_en)
          begin
            vc_g_s = 1;
            en_c_w = 0;
          end
          else if(Inject_req == 3'd1 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_w = 0;
          end
          else if(E_req == 3'd1 && ie_en)
          begin
            vc_g_e = 1;
            en_c_w = 0;
          end
          else if(W_req == 3'd1 && iw_en)
          begin
            vc_g_w = 1;
            en_c_w = 0;
          end
        end
        3'b011:
        begin
          if(S_req == 3'd1 && is_en)
          begin
            vc_g_s = 1;
            en_c_w = 0;
          end
          else if(Inject_req == 3'd1 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_w = 0;
          end
          else if(E_req == 3'd1 && ie_en)
          begin
            vc_g_e = 1;
            en_c_w = 0;
          end
          else if(W_req == 3'd1 && iw_en)
          begin
            vc_g_w = 1;
            en_c_w = 0;
          end
          else if(N_req == 3'd1 && in_en)
          begin
            vc_g_n = 1;
            en_c_w = 0;
          end
        end
        3'b100:
        begin
          if(Inject_req == 3'd1 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_w = 0;
          end
          else if(E_req == 3'd1 && ie_en)
          begin
            vc_g_e = 1;
            en_c_w = 0;
          end
          else if(W_req == 3'd1 && iw_en)
          begin
            vc_g_w = 1;
            en_c_w = 0;
          end
          else if(N_req == 3'd1 && in_en)
          begin
            vc_g_n = 1;
            en_c_w = 0;
          end
          else if(S_req == 3'd1 && is_en)
          begin
            vc_g_s = 1;
            en_c_w = 0;
          end
        end
        default:
          {vc_g_e, vc_g_w, vc_g_n, vc_g_s, vc_g_injec} = 5'b0;
      endcase
    end
    
    if(on_en == 1)
    begin
      case (count_n)
        3'b000:
        begin
          if(E_req == 3'd2 && ie_en)
          begin
            vc_g_e = 1;
            en_c_n = 0;
          end
          else if(W_req == 3'd2 && iw_en)
          begin
            vc_g_w = 1;
            en_c_n = 0;
          end
          else if(N_req == 3'd2 && in_en)
          begin
            vc_g_n = 1;
            en_c_n = 0;
          end
          else if(S_req == 3'd2 && is_en)
          begin
            vc_g_s = 1;
            en_c_n = 0;
          end
          else if(Inject_req == 3'd2 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_n = 0;
          end
        end
        3'b001:
        begin
          if(W_req == 3'd2 && iw_en)
          begin
            vc_g_w = 1;
            en_c_n = 0;
          end
          else if(N_req == 3'd2 && in_en)
          begin
            vc_g_n = 1;
            en_c_n = 0;
          end
          else if(S_req == 3'd2 && is_en)
          begin
            vc_g_s = 1;
            en_c_n = 0;
          end
          else if(Inject_req == 3'd2 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_n = 0;
          end
          else if(E_req == 3'd2 && ie_en)
          begin
            vc_g_e = 1;
            en_c_n = 0;
          end
        end
        3'b010:
        begin
          if(N_req == 3'd2 && in_en)
          begin
            vc_g_n = 1;
            en_c_n = 0;
          end
          else if(S_req == 3'd2 && is_en)
          begin
            vc_g_s = 1;
            en_c_n = 0;
          end
          else if(Inject_req == 3'd2 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_n = 0;
          end
          else if(E_req == 3'd2 && ie_en)
          begin
            vc_g_e = 1;
            en_c_n = 0;
          end
          else if(W_req == 3'd2 && iw_en)
          begin
            vc_g_w = 1;
            en_c_n = 0;
          end
        end
        3'b011:
        begin
          if(S_req == 3'd2 && is_en)
          begin
            vc_g_s = 1;
            en_c_n = 0;
          end
          else if(Inject_req == 3'd2 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_n = 0;
          end
          else if(E_req == 3'd2 && ie_en)
          begin
            vc_g_e = 1;
            en_c_n = 0;
          end
          else if(W_req == 3'd2 && iw_en)
          begin
            vc_g_w = 1;
            en_c_n = 0;
          end
          else if(N_req == 3'd2 && in_en)
          begin
            vc_g_n = 1;
            en_c_n = 0;
          end
        end
        3'b100:
        begin
          if(Inject_req == 3'd2 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_n = 0;
          end
          else if(E_req == 3'd2 && ie_en)
          begin
            vc_g_e = 1;
            en_c_n = 0;
          end
          else if(W_req == 3'd2 && iw_en)
          begin
            vc_g_w = 1;
            en_c_n = 0;
          end
          else if(N_req == 3'd2 && in_en)
          begin
            vc_g_n = 1;
            en_c_n = 0;
          end
          else if(S_req == 3'd2 && is_en)
          begin
            vc_g_s = 1;
            en_c_n = 0;
          end
        end
        default:
          {vc_g_e, vc_g_w, vc_g_n, vc_g_s, vc_g_injec} = 5'b0;
      endcase
    end
    
    if(os_en == 1)
    begin
      case (count_s)
        3'b000:
        begin
          if(E_req == 3'd3 && ie_en)
          begin
            vc_g_e = 1;
            en_c_s = 0;
          end
          else if(W_req == 3'd3 && iw_en)
          begin
            vc_g_w = 1;
            en_c_s = 0;
          end
          else if(N_req == 3'd3 && in_en)
          begin
            vc_g_n = 1;
            en_c_s = 0;
          end
          else if(S_req == 3'd3 && is_en)
          begin
            vc_g_s = 1;
            en_c_s = 0;
          end
          else if(Inject_req == 3'd3 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_s = 0;
          end
        end
        3'b001:
        begin
          if(W_req == 3'd3 && iw_en)
          begin
            vc_g_w = 1;
            en_c_s = 0;
          end
          else if(N_req == 3'd3 && in_en)
          begin
            vc_g_n = 1;
            en_c_s = 0;
          end
          else if(S_req == 3'd3 && is_en)
          begin
            vc_g_s = 1;
            en_c_s = 0;
          end
          else if(Inject_req == 3'd3 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_s = 0;
          end
          else if(E_req == 3'd3 && ie_en)
          begin
            vc_g_e = 1;
            en_c_s = 0;
          end
        end
        3'b010:
        begin
          if(N_req == 3'd3 && in_en)
          begin
            vc_g_n = 1;
            en_c_s = 0;
          end
          else if(S_req == 3'd3 && is_en)
          begin
            vc_g_s = 1;
            en_c_s = 0;
          end
          else if(Inject_req == 3'd3 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_s = 0;
          end
          else if(E_req == 3'd3 && ie_en)
          begin
            vc_g_e = 1;
            en_c_s = 0;
          end
          else if(W_req == 3'd3 && iw_en)
          begin
            vc_g_w = 1;
            en_c_s = 0;
          end
        end
        3'b011:
        begin
          if(S_req == 3'd3 && is_en)
          begin
            vc_g_s = 1;
            en_c_s = 0;
          end
          else if(Inject_req == 3'd3 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_s = 0;
          end
          else if(E_req == 3'd3 && ie_en)
          begin
            vc_g_e = 1;
            en_c_s = 0;
          end
          else if(W_req == 3'd3 && iw_en)
          begin
            vc_g_w = 1;
            en_c_s = 0;
          end
          else if(N_req == 3'd3 && in_en)
          begin
            vc_g_n = 1;
            en_c_s = 0;
          end
        end
        3'b100:
        begin
          if(Inject_req == 3'd3 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_s = 0;
          end
          else if(E_req == 3'd3 && ie_en)
          begin
            vc_g_e = 1;
            en_c_s = 0;
          end
          else if(W_req == 3'd3 && iw_en)
          begin
            vc_g_w = 1;
            en_c_s = 0;
          end
          else if(N_req == 3'd3 && in_en)
          begin
            vc_g_n = 1;
            en_c_s = 0;
          end
          else if(S_req == 3'd3 && is_en)
          begin
            vc_g_s = 1;
            en_c_s = 0;
          end
        end
        default:
          {vc_g_e, vc_g_w, vc_g_n, vc_g_s, vc_g_injec} = 5'b0;
      endcase
    end
    
    if(eject_en == 1)
    begin
      case (count_j)
        3'b000:
        begin
          if(E_req == 3'd4 && ie_en)
          begin
            vc_g_e = 1;
            en_c_j = 0;
          end
          else if(W_req == 3'd4 && iw_en)
          begin
            vc_g_w = 1;
            en_c_j = 0;
          end
          else if(N_req == 3'd4 && in_en)
          begin
            vc_g_n = 1;
            en_c_j = 0;
          end
          else if(S_req == 3'd4 && is_en)
          begin
            vc_g_s = 1;
            en_c_j = 0;
          end
          else if(Inject_req == 3'd4 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_j = 0;
          end
        end
        3'b001:
        begin
          if(W_req == 3'd4 && iw_en)
          begin
            vc_g_w = 1;
            en_c_j = 0;
          end
          else if(N_req == 3'd4 && in_en)
          begin
            vc_g_n = 1;
            en_c_j = 0;
          end
          else if(S_req == 3'd4 && is_en)
          begin
            vc_g_s = 1;
            en_c_j = 0;
          end
          else if(Inject_req == 3'd4 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_j = 0;
          end
          else if(E_req == 3'd4 && ie_en)
          begin
            vc_g_e = 1;
            en_c_j = 0;
          end
        end
        3'b010:
        begin
          if(N_req == 3'd4 && in_en)
          begin
            vc_g_n = 1;
            en_c_j = 0;
          end
          else if(S_req == 3'd4 && is_en)
          begin
            vc_g_s = 1;
            en_c_j = 0;
          end
          else if(Inject_req == 3'd4 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_j = 0;
          end
          else if(E_req == 3'd4 && ie_en)
          begin
            vc_g_e = 1;
            en_c_j = 0;
          end
          else if(W_req == 3'd4 && iw_en)
          begin
            vc_g_w = 1;
            en_c_j = 0;
          end
        end
        3'b011:
        begin
          if(S_req == 3'd4 && is_en)
          begin
            vc_g_s = 1;
            en_c_j = 0;
          end
          else if(Inject_req == 3'd4 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_j = 0;
          end
          else if(E_req == 3'd4 && ie_en)
          begin
            vc_g_e = 1;
            en_c_j = 0;
          end
          else if(W_req == 3'd4 && iw_en)
          begin
            vc_g_w = 1;
            en_c_j = 0;
          end
          else if(N_req == 3'd4 && in_en)
          begin
            vc_g_n = 1;
            en_c_j = 0;
          end
        end
        3'b100:
        begin
          if(Inject_req == 3'd4 && inject_en)
          begin
            vc_g_injec = 1;
            en_c_j = 0;
          end
          else if(E_req == 3'd4 && ie_en)
          begin
            vc_g_e = 1;
            en_c_j = 0;
          end
          else if(W_req == 3'd4 && iw_en)
          begin
            vc_g_w = 1;
            en_c_j = 0;
          end
          else if(N_req == 3'd4 && in_en)
          begin
            vc_g_n = 1;
            en_c_j = 0;
          end
          else if(S_req == 3'd4 && is_en)
          begin
            vc_g_s = 1;
            en_c_j = 0;
          end
        end
        default:
          {vc_g_e, vc_g_w, vc_g_n, vc_g_s, vc_g_injec} = 5'b0;
      endcase
    end
    end
    
  end
endmodule
