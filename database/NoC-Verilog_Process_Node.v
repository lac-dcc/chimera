module Process_Node (input [2:0] X_cur, Y_cur, input [63:0] ie, iw, in, is, input clk, reset, push_e, push_w, push_n, push_s,
                     e_state, w_state, n_state, s_state, output [63:0] oe, ow, on, os, output write_req_e, write_req_w, write_req_n, write_req_s, 
                     e_e, w_e, n_e, s_e,
                     input w_e_ack, w_w_ack, w_n_ack, w_s_ack, output push_e_ack, push_w_ack, push_n_ack, push_s_ack,
                     input [63:0] inject, input push_j, w_j_ack, output write_req_j, j_e, push_j_ack, output [63:0] eject);
  
	 // wire [63:0] inject, eject;
	 // wire push_j, write_req_j, j_e;
	//  wire w_j_ack, push_j_ack;
  
  Router R(X_cur, Y_cur, ie, iw, in, is, inject, clk, reset, push_e, push_w, push_n, push_s, push_j, e_state, w_state, n_state, s_state, 1'b1, 
           oe, ow, on, os, eject, write_req_e, write_req_w, write_req_n, write_req_s, write_req_j, e_e, w_e, n_e, s_e, j_e,
           w_e_ack, w_w_ack, w_n_ack, w_s_ack, w_j_ack, push_e_ack, push_w_ack, push_n_ack, push_s_ack, push_j_ack);  
          
//  Packet_gen pg(clk, reset, j_e, X_cur, Y_cur, inject, push_j, push_j_ack);
  
//  Packet_rec ps(clk, reset, end_sim, write_req_j, eject, w_j_ack, X_cur, Y_cur);
  
  
endmodule
