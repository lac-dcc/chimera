module Router (input [2:0] X_cur, Y_cur, input [63:0] ie, iw, in, is, inject, input clk, reset, push_e, push_w, push_n, push_s, push_j,
               e_state, w_state, n_state, s_state, eject_state,
               output [63:0] oe, ow, on, os, eject, output write_req_e, write_req_w, write_req_n, write_req_s, write_req_j, output reg e_e, w_e, n_e, s_e, j_e,
               input w_e_ack, w_w_ack, w_n_ack, w_s_ack, w_j_ack, output push_e_ack, push_w_ack, push_n_ack, push_s_ack, push_j_ack);
  
  wire [63:0] e_temp, w_temp, n_temp, s_temp, inject_temp;
  wire [63:0] e_temp_o, w_temp_o, n_temp_o, s_temp_o, inject_temp_o;
  
  wire e_o_en, e_en, e_vc_g, e_vc_f, e_PW, e_PW_fail, e_vc_grant, e_ST_ack, w_o_en, w_en, w_vc_g, w_vc_f, w_PW, w_PW_fail, w_vc_grant, w_ST_ack,
       n_o_en, n_en, n_vc_g, n_vc_f, n_PW, n_PW_fail, n_vc_grant, n_ST_ack, s_o_en, s_en, s_vc_g, s_vc_f, s_PW, s_PW_fail, s_vc_grant, s_ST_ack,
       j_o_en, j_en, j_vc_g, j_vc_f, j_PW, j_PW_fail, j_vc_grant, j_ST_ack;
       
  wire alloc_e, alloc_w, alloc_n, alloc_s, alloc_j;
  wire push_e_o, push_w_o, push_n_o, push_s_o, push_j_o;
  wire allocOrnot_e, allocOrnot_w, allocOrnot_n, allocOrnot_s, allocOrnot_j;
  wire oe_en, ow_en, on_en, os_en, eject_en;
  wire st_oe_en, st_ow_en, st_on_en, st_os_en, st_Eject_en;
  wire e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req;
  wire e_push_o, w_push_o, n_push_o, s_push_o, j_push_o;
  reg oe_f, ow_f, on_f, os_f, eject_f;
  
  
  wire [2:0] e_em_pl, e_out_num, w_em_pl, w_out_num, n_em_pl, n_out_num, s_em_pl, s_out_num, j_em_pl, j_out_num;
  wire [2:0] S_E, S_W, S_N, S_S, S_Ejec;
  wire [2:0] e_em_pl_o, w_em_pl_o, n_em_pl_o, s_em_pl_o, j_em_pl_o;
  
  always @(*)
  begin
	if (reset)
		{e_e, w_e, n_e, s_e, j_e} = 5'b0;
	else
	begin
		{e_e, w_e, n_e, s_e, j_e} = 5'b0;
		if(e_em_pl > 0)
		  e_e = 1;
		if(w_em_pl > 0)
		  w_e = 1;
		if(n_em_pl > 0)
		  n_e = 1;
		if(s_em_pl > 0)
		  s_e = 1;
		if(j_em_pl == 3'd4)
		  j_e = 1;
	end
  end
  
  always @(*)
  begin
	if (reset)
		{oe_f, ow_f, on_f, os_f, eject_f} = 5'b0;
	else
	begin
		{oe_f, ow_f, on_f, os_f, eject_f} = 5'b0;

		if(e_em_pl_o > 0)
		  oe_f = 1;
		if(w_em_pl_o > 0)
		  ow_f = 1;
		if(n_em_pl_o > 0)
		  on_f = 1;
		if(s_em_pl_o > 0)
		  os_f = 1;
		if(j_em_pl_o > 0)
		  eject_f = 1;
	end
  end
       
  
//  Counter cnt(count, reset, clk);
  
  input_Unit input_e (e_temp, e_en, e_em_pl, e_out_num, e_PW, e_vc_g, e_vc_f, e_push_o,
                      clk, reset, push_e, e_PW_fail, e_vc_grant, e_ST_ack, ie, X_cur, Y_cur, 3'b000, push_e_ack);
  
  input_Unit input_w (w_temp, w_en, w_em_pl, w_out_num, w_PW, w_vc_g, w_vc_f, w_push_o,
                      clk, reset, push_w, w_PW_fail, w_vc_grant, w_ST_ack, iw, X_cur, Y_cur, 3'b001, push_w_ack);
                      
  input_Unit input_n (n_temp, n_en, n_em_pl, n_out_num, n_PW, n_vc_g, n_vc_f, n_push_o,
                      clk, reset, push_n, n_PW_fail, n_vc_grant, n_ST_ack, in, X_cur, Y_cur, 3'b010, push_n_ack);
  
  input_Unit input_s (s_temp, s_en, s_em_pl, s_out_num, s_PW, s_vc_g, s_vc_f, s_push_o,
                      clk, reset, push_s, s_PW_fail, s_vc_grant, s_ST_ack, is, X_cur, Y_cur, 3'b011, push_s_ack);
                      
  input_Unit input_inject (inject_temp, j_en, j_em_pl, j_out_num, j_PW, j_vc_g, j_vc_f, j_push_o,
                      clk, reset, push_j, j_PW_fail, j_vc_grant, j_ST_ack, inject, X_cur, Y_cur, 3'b100, push_j_ack);
                      
  out_en_gen oeg(push_e_o, push_w_o, push_n_o, push_s_o, push_j_o, S_E, S_W, S_N, S_S, S_Ejec, e_push_o, w_push_o, n_push_o, s_push_o, j_push_o, reset);
 
  
  output_unit output_e 		(oe, write_req_e, allocOrnot_e,  e_em_pl_o, clk, reset, push_e_o, e_state, alloc_e, e_temp_o, w_e_ack);
  output_unit output_w 		(ow, write_req_w, allocOrnot_w,  w_em_pl_o, clk, reset, push_w_o, w_state, alloc_w, w_temp_o, w_w_ack);
  output_unit output_n 		(on, write_req_n, allocOrnot_n,  n_em_pl_o, clk, reset, push_n_o, n_state, alloc_n, n_temp_o, w_n_ack);
  output_unit output_s 		(os, write_req_s, allocOrnot_s,  s_em_pl_o, clk, reset, push_s_o, s_state, alloc_s, s_temp_o, w_s_ack);
  output_unit output_eject 	(eject, write_req_j, allocOrnot_j,  j_em_pl_o, clk, reset, push_j_o, eject_state, alloc_j, inject_temp_o, w_j_ack);
  
  Select_gen sg(S_E, S_W, S_N, S_S, S_Ejec, 
                e_vc_grant, w_vc_grant, n_vc_grant, s_vc_grant, j_vc_grant, clk, reset, e_out_num, w_out_num, n_out_num, s_out_num, j_out_num);
                
  set_Alloc sac(alloc_e, alloc_w, alloc_n, alloc_s, alloc_j, e_vc_grant, w_vc_grant, n_vc_grant, s_vc_grant, j_vc_grant, reset, 
             e_out_num, w_out_num, n_out_num, s_out_num, j_out_num);
    
                
  CrossBar X(e_temp_o, w_temp_o, n_temp_o, s_temp_o, inject_temp_o, S_E, S_W, S_N, S_S, S_Ejec, e_temp, w_temp, n_temp, s_temp, inject_temp);
  
  VC_Alloc vca(e_vc_grant, w_vc_grant, n_vc_grant, s_vc_grant, j_vc_grant, clk, reset,
               e_out_num, w_out_num, n_out_num, s_out_num, j_out_num, oe_en, ow_en, on_en, os_en, eject_en, e_en, w_en, n_en, s_en, j_en,
               e_vc_f, w_vc_f, n_vc_f, s_vc_f, j_vc_f);
               
  output_buffer_availablity oba(oe_en, ow_en, on_en, os_en, eject_en, clk,
                                e_em_pl_o, w_em_pl_o, n_em_pl_o, s_em_pl_o, j_em_pl_o, reset, allocOrnot_e, allocOrnot_w, allocOrnot_n, allocOrnot_s, allocOrnot_j);
                                
  
  ST switch_travers(st_oe_en, st_ow_en, st_on_en, st_os_en, st_Eject_en, e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req, oe_f, ow_f, on_f, os_f, eject_f); 
                                
                                
  ST_Controler st_cont(e_ST_req, w_ST_req, n_ST_req, s_ST_req, eject_ST_req, e_ST_ack, w_ST_ack, n_ST_ack, s_ST_ack, j_ST_ack, clk, reset, e_vc_grant, w_vc_grant, 
                       n_vc_grant, s_vc_grant, j_vc_grant, st_oe_en, st_ow_en, st_on_en, st_os_en, st_Eject_en, 
                       e_out_num, w_out_num, n_out_num, s_out_num, j_out_num);
                       
endmodule
