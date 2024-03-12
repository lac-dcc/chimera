//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-----------------------------------------------------------------------------------------------------------------------------
// Filename       : cabac_binari_qp.v
// Author         : chewein
// Created        : 2014-9-20
// Description    : binarization qp of an lcu 
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v" 

module cabac_binari_qp( 
                                cu_curr_qp_i                                   ,
                                cu_last_qp_i                                   ,

                                ctx_pair_qp_0_o                                ,
								ctx_pair_qp_1_o                                ,
								ctx_pair_qp_2_o                                ,
								ctx_pair_qp_3_o                                ,
								ctx_pair_qp_4_o                                ,
								ctx_pair_qp_5_o                                ,
								ctx_pair_qp_6_o                                ,
								ctx_pair_qp_7_o                                
                        );

//-----------------------------------------------------------------------------------------------------------------------------
//
//            input signals and output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------
input         [5:0]                    cu_curr_qp_i                            ;
input         [5:0]                    cu_last_qp_i                            ;

output        [10:0]                   ctx_pair_qp_0_o                         ;
output        [10:0]                   ctx_pair_qp_1_o                         ;
output        [10:0]                   ctx_pair_qp_2_o                         ;
output        [10:0]                   ctx_pair_qp_3_o                         ;
output        [10:0]                   ctx_pair_qp_4_o                         ;
output        [10:0]                   ctx_pair_qp_5_o                         ;
output        [10:0]                   ctx_pair_qp_6_o                         ;
output        [10:0]                   ctx_pair_qp_7_o                         ;

//-----------------------------------------------------------------------------------------------------------------------------
//
//            wire and reg output signals declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
wire          [5:0]                    cu_dqp_w                                ;
wire          [5:0]                    cu_abs_dqp_w                            ;
wire          [2:0]                    qp_tu_value_w                           ;
wire                                   qp_abs_no_equal_zero_w                  ;

reg           [2:0]                    num_group_r                             ;
reg           [4:0]                    bins_group_1_r                          ;
reg           [2:0]                    num_bins_group_1_r                      ;
reg           [4:0]                    bins_group_0_r                          ;
reg           [2:0]                    num_bins_group_0_r                      ;

assign cu_dqp_w              = cu_curr_qp_i  -   cu_last_qp_i                  ; 
assign cu_abs_dqp_w          = cu_dqp_w[5] ? cu_last_qp_i-cu_curr_qp_i:cu_dqp_w;
assign qp_tu_value_w         = cu_abs_dqp_w > 6'd5 ? 6'd5 : cu_abs_dqp_w       ;
assign qp_abs_no_equal_zero_w= !(!cu_abs_dqp_w)                                ;

//-----------------------------------------------------------------------------------------------------------------------------
//
//            binarization
//
//-----------------------------------------------------------------------------------------------------------------------------
wire          [10:0]                   ctx_pair_qp_0_w                         ;
reg           [10:0]                   ctx_pair_qp_1_r                         ;
reg           [10:0]                   ctx_pair_qp_2_r                         ;
reg           [10:0]                   ctx_pair_qp_3_r                         ;
reg           [10:0]                   ctx_pair_qp_4_r                         ;
reg           [10:0]                   ctx_pair_qp_5_r                         ;
reg           [10:0]                   ctx_pair_qp_6_r                         ;
reg           [10:0]                   ctx_pair_qp_7_r                         ;
reg           [10:0]                   ctx_pair_qp_8_r                         ;

// ctx_pair_qp_0_w
assign ctx_pair_qp_0_w       =  {2'b00,qp_abs_no_equal_zero_w,3'd3,5'd3}        ;

// ctx_pair_qp_1_r ctx_pair_qp_2_r  ctx_pair_qp_3_r 
// ctx_pair_qp_4_r ctx_pair_qp_5_r  ctx_pair_qp_6_r

always @* begin 
    case(qp_tu_value_w)
        3'd0:begin ctx_pair_qp_1_r = {2'b01,1'b0,8'hff    };ctx_pair_qp_2_r={2'b01,1'b0,8'hff    };ctx_pair_qp_3_r={2'b01,1'b0,8'hff    };ctx_pair_qp_4_r={2'b01,1'b0,8'hff    };ctx_pair_qp_5_r={2'b01,1'b0,8'hff    }; end 
        3'd1:begin ctx_pair_qp_1_r = {2'b00,1'b0,3'd1,5'd2};ctx_pair_qp_2_r={2'b01,1'b0,8'hff    };ctx_pair_qp_3_r={2'b01,1'b0,8'hff    };ctx_pair_qp_4_r={2'b01,1'b0,8'hff    };ctx_pair_qp_5_r={2'b01,1'b0,8'hff    }; end 
        3'd2:begin ctx_pair_qp_1_r = {2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_2_r={2'b00,1'b0,3'd1,5'd2};ctx_pair_qp_3_r={2'b01,1'b0,8'hff    };ctx_pair_qp_4_r={2'b01,1'b0,8'hff    };ctx_pair_qp_5_r={2'b01,1'b0,8'hff    }; end 
		3'd3:begin ctx_pair_qp_1_r = {2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_2_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_3_r={2'b00,1'b0,3'd1,5'd2};ctx_pair_qp_4_r={2'b01,1'b0,8'hff    };ctx_pair_qp_5_r={2'b01,1'b0,8'hff    }; end 
		3'd4:begin ctx_pair_qp_1_r = {2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_2_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_3_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_4_r={2'b00,1'b0,3'd1,5'd2};ctx_pair_qp_5_r={2'b01,1'b0,8'hff    }; end 
		3'd5:begin ctx_pair_qp_1_r = {2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_2_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_3_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_4_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_5_r={2'b01,1'b0,8'hff    }; end 
	 default:begin ctx_pair_qp_1_r = {2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_2_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_3_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_4_r={2'b00,1'b1,3'd1,5'd2};ctx_pair_qp_5_r={2'b01,1'b0,8'hff    }; end 
    endcase
end 

// ctx_pair_qp_6_r ctx_pair_qp_7_r
always @* begin 
    case(cu_abs_dqp_w[4:0])
        6'd0 : begin  ctx_pair_qp_6_r = {2'b01,1'b0,8'hff                   } ; ctx_pair_qp_7_r = {2'b01,1'b0,8'hff}                       ; end 
        6'd1 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]} ; ctx_pair_qp_7_r = {2'b01,1'b0,8'hff}                       ; end 
        6'd2 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]} ; ctx_pair_qp_7_r = {2'b01,1'b0,8'hff}                       ; end 
        6'd3 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]} ; ctx_pair_qp_7_r = {2'b01,1'b0,8'hff}                       ; end 
        6'd4 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]} ; ctx_pair_qp_7_r = {2'b01,1'b0,8'hff}                       ; end 
        6'd5 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd1,5'd0}                ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]}    ; end 
        6'd6 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd3,5'b00100           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]}    ; end 
        6'd7 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd3,5'b00101           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]}    ; end 
        6'd8 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11000           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]}    ; end 
        6'd9 : begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11001           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]}    ; end 
        6'd10: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11010           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]}    ; end 
        6'd11: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11011           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd1,4'b0000,cu_dqp_w[5]}    ; end 
        6'd12: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11100           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,2'b00,2'b00,cu_dqp_w[5]}; end 
        6'd13: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11100           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,2'b00,2'b01,cu_dqp_w[5]}; end 
        6'd14: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11100           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,2'b00,2'b10,cu_dqp_w[5]}; end 
        6'd15: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11100           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,2'b00,2'b11,cu_dqp_w[5]}; end 
        6'd16: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11101           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,2'b00,2'b00,cu_dqp_w[5]}; end 
        6'd17: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11101           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,2'b00,2'b01,cu_dqp_w[5]}; end 
        6'd18: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11101           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,2'b00,2'b10,cu_dqp_w[5]}; end 
        6'd19: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11101           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,2'b00,2'b11,cu_dqp_w[5]}; end 
        6'd20: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b0000,cu_dqp_w[5]}    ; end 
        6'd21: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b0001,cu_dqp_w[5]}    ; end 
        6'd22: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b0010,cu_dqp_w[5]}    ; end 
        6'd23: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b0011,cu_dqp_w[5]}    ; end 
        6'd24: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b0100,cu_dqp_w[5]}    ; end 
        6'd25: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b0101,cu_dqp_w[5]}    ; end 
        6'd26: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b0110,cu_dqp_w[5]}    ; end 
        6'd27: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b0111,cu_dqp_w[5]}    ; end 
        6'd28: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b1000,cu_dqp_w[5]}    ; end 
        6'd29: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b1001,cu_dqp_w[5]}    ; end 
        6'd30: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b1010,cu_dqp_w[5]}    ; end 
        6'd31: begin  ctx_pair_qp_6_r = {2'b10,1'b0,3'd5,5'b11110           } ; ctx_pair_qp_7_r = {2'b10,1'b0,3'd3,4'b1011,cu_dqp_w[5]}    ; end 
    endcase 
end


//-----------------------------------------------------------------------------------------------------------------------------
//
//            output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------

assign ctx_pair_qp_0_o       =  ctx_pair_qp_0_w                               ;
assign ctx_pair_qp_1_o       =  ctx_pair_qp_1_r                               ;
assign ctx_pair_qp_2_o       =  ctx_pair_qp_2_r                               ;
assign ctx_pair_qp_3_o       =  ctx_pair_qp_3_r                               ;
assign ctx_pair_qp_4_o       =  ctx_pair_qp_4_r                               ;
assign ctx_pair_qp_5_o       =  ctx_pair_qp_5_r                               ;
assign ctx_pair_qp_6_o       =  ctx_pair_qp_6_r                               ;
assign ctx_pair_qp_7_o       =  ctx_pair_qp_7_r                               ;

endmodule 
