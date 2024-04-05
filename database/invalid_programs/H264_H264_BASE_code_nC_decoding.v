`include "timescale.v"
`include "define.v"

module nC_decoding (
input clk,
input reset_n,
input currMB_availA,
input currMB_availB,
input [3:0] cavlc_decoder_state,
input [4:0] TotalCoeff,
input [4:0] TC_dout,
input [7:0] mb_num_h,mb_num_v,
input [4:0] intra4x4_pred_num,
input [4:0] intra16_pred_num, 
input [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state, 
output reg [12:0] TC_rd_addr,

output cavlc_nc_end,
output reg [4:0] nC
);
	
parameter nC_rst  = 2'b00;
parameter read_nA = 2'b01;
parameter read_nB = 2'b10;
parameter dec_nC = 2'b11;

reg [1:0] state;
reg [4:0] nA,nB;
wire currMB_availA_nc,currMB_availB_nc,is_chroma;
assign is_chroma = intra4x4_pred_num[4]||(intra16_pred_num[4]&&intra16_pred_num!=5'b11111);
assign currMB_availA_nc = ~(
		(mb_num_h == 0&&
              (
		(intra4x4_pred_num == 0&&(residual_intra4x4_state != `rst_residual_intra4x4||residual_inter_state!=`rst_residual_inter))||
                intra4x4_pred_num == 2||intra4x4_pred_num == 8||intra4x4_pred_num == 10||
		intra16_pred_num == 0||intra16_pred_num == 2||intra16_pred_num == 8||intra16_pred_num == 10||is_chroma||		
		(intra16_pred_num == 31&&residual_intra16_state != `rst_residual_intra16)
	      )
		)||		
		(mb_num_v != 0&&
			(intra4x4_pred_num == 19||intra4x4_pred_num == 23||intra16_pred_num == 19||intra16_pred_num == 23)
		));

assign currMB_availB_nc = ~((mb_num_v == 0&&
                           ((intra4x4_pred_num == 0&&(residual_intra4x4_state != `rst_residual_intra4x4||residual_inter_state!=`rst_residual_inter))||
                            intra4x4_pred_num == 1||intra4x4_pred_num == 4||intra4x4_pred_num == 5||
			    intra16_pred_num == 0||intra16_pred_num == 1||intra16_pred_num == 4||intra16_pred_num == 5||
			    (intra16_pred_num == 31&&residual_intra16_state != `rst_residual_intra16)||is_chroma))
			||(mb_num_h != 0&&(intra4x4_pred_num == 20||intra4x4_pred_num == 24||intra16_pred_num == 20||intra16_pred_num == 24)));

wire availb,availa;
assign availa = currMB_availA_nc||intra4x4_pred_num==19||intra4x4_pred_num==21||intra4x4_pred_num==23||intra4x4_pred_num==25
		||intra16_pred_num==19||intra16_pred_num==21||intra16_pred_num==23||intra16_pred_num==25;
assign availb = currMB_availB_nc||intra4x4_pred_num==20||intra4x4_pred_num==21||intra4x4_pred_num==24||intra4x4_pred_num==25
		||intra16_pred_num==20||intra16_pred_num==21||intra16_pred_num==24||intra16_pred_num==25;

wire [7:0] A_mb_num_h,B_mb_num_v,A_mb_num_h_4,B_mb_num_v_4,A_mb_num_h_16,B_mb_num_v_16;
reg [4:0] Aintra4x4_pred_num,Bintra4x4_pred_num;

assign A_mb_num_h_4 = (intra4x4_pred_num == 0||intra4x4_pred_num == 2||
                   intra4x4_pred_num == 8||intra4x4_pred_num == 10||
		   intra4x4_pred_num == 18||intra4x4_pred_num == 20||
		   intra4x4_pred_num == 22||intra4x4_pred_num == 24)?(mb_num_h-1):mb_num_h;

assign A_mb_num_h_16 = (intra16_pred_num == 0||intra16_pred_num == 2||
                   intra16_pred_num == 8||intra16_pred_num == 10||
		   intra16_pred_num == 18||intra16_pred_num == 20||
		   intra16_pred_num == 22||intra16_pred_num == 24||intra16_pred_num == 31)?(mb_num_h-1):mb_num_h;

assign A_mb_num_h = (residual_intra16_state != `rst_residual_intra16)?A_mb_num_h_16:A_mb_num_h_4;

assign B_mb_num_v_4 =  intra4x4_pred_num == 0||intra4x4_pred_num == 1||
                   intra4x4_pred_num == 4||intra4x4_pred_num == 5||
		   intra4x4_pred_num == 18||intra4x4_pred_num == 19||
		   intra4x4_pred_num == 22||intra4x4_pred_num == 23?(mb_num_v-1):mb_num_v;

assign B_mb_num_v_16 = intra16_pred_num == 0||intra16_pred_num == 1||
                   intra16_pred_num == 4||intra16_pred_num == 5||
		   intra16_pred_num == 18||intra16_pred_num == 19||
		   intra16_pred_num == 22||intra16_pred_num == 23||intra16_pred_num == 31?(mb_num_v-1):mb_num_v;

assign B_mb_num_v = (residual_intra16_state != `rst_residual_intra16)?B_mb_num_v_16:B_mb_num_v_4;

always@(intra4x4_pred_num or intra16_pred_num or residual_intra16_state or residual_intra4x4_state or residual_inter_state)
if(residual_intra4x4_state != `rst_residual_intra4x4 || residual_inter_state != `rst_residual_inter)
  case(intra4x4_pred_num)
    0:Aintra4x4_pred_num=5;
    2:Aintra4x4_pred_num=7;
    8:Aintra4x4_pred_num=13;
    10:Aintra4x4_pred_num=15;
    4:Aintra4x4_pred_num=1;
    6:Aintra4x4_pred_num=3;
    12:Aintra4x4_pred_num=9;
    14:Aintra4x4_pred_num=11;
    18:Aintra4x4_pred_num=19;
    20:Aintra4x4_pred_num=21;
    22:Aintra4x4_pred_num=23;
    24:Aintra4x4_pred_num=25;
    default:Aintra4x4_pred_num=intra4x4_pred_num-1;
  endcase
else if(residual_intra16_state != `rst_residual_intra16)
  case(intra16_pred_num)
    0:Aintra4x4_pred_num=5;
    2:Aintra4x4_pred_num=7;
    8:Aintra4x4_pred_num=13;
    10:Aintra4x4_pred_num=15;
    4:Aintra4x4_pred_num=1;
    6:Aintra4x4_pred_num=3;
    12:Aintra4x4_pred_num=9;
    14:Aintra4x4_pred_num=11;
    18:Aintra4x4_pred_num=19;
    20:Aintra4x4_pred_num=21;
    22:Aintra4x4_pred_num=23;
    24:Aintra4x4_pred_num=25;
    5'b11111:Aintra4x4_pred_num=5;
    default:Aintra4x4_pred_num=intra16_pred_num-1;
  endcase
                  
always@(intra4x4_pred_num or intra16_pred_num or residual_intra16_state or residual_intra4x4_state or residual_inter_state)
if(residual_intra4x4_state != `rst_residual_intra4x4 || residual_inter_state != `rst_residual_inter)
  case(intra4x4_pred_num)
    0:Bintra4x4_pred_num=10;
    1:Bintra4x4_pred_num=11;
    4:Bintra4x4_pred_num=14;
    5:Bintra4x4_pred_num=15;
    8:Bintra4x4_pred_num=2;
    9:Bintra4x4_pred_num=3;
    12:Bintra4x4_pred_num=6;
    13:Bintra4x4_pred_num=7;
    18:Bintra4x4_pred_num=20;
    19:Bintra4x4_pred_num=21;
    22:Bintra4x4_pred_num=24;
    23:Bintra4x4_pred_num=25;
    default:Bintra4x4_pred_num=intra4x4_pred_num-2;
  endcase
else if(residual_intra16_state != `rst_residual_intra16)
  case(intra16_pred_num)
    0:Bintra4x4_pred_num=10;
    1:Bintra4x4_pred_num=11;
    4:Bintra4x4_pred_num=14;
    5:Bintra4x4_pred_num=15;
    8:Bintra4x4_pred_num=2;
    9:Bintra4x4_pred_num=3;
    12:Bintra4x4_pred_num=6;
    13:Bintra4x4_pred_num=7;
    18:Bintra4x4_pred_num=20;
    19:Bintra4x4_pred_num=21;
    22:Bintra4x4_pred_num=24;
    23:Bintra4x4_pred_num=25;
    5'b11111:Bintra4x4_pred_num=10;
    default:Bintra4x4_pred_num=intra16_pred_num-2;
  endcase
		
assign cavlc_nc_end = (state == dec_nC)&&(cavlc_decoder_state == `nC_decoding_s);
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		state <= nC_rst;
	else if(cavlc_decoder_state == `nC_decoding_s)
		case(state)	
		  nC_rst: state <= read_nA;
	    read_nA:state <= read_nB;
	    read_nB:state <= dec_nC;
      dec_nC: state <= nC_rst;
    endcase 
  
	
 always @ (reset_n or state or A_mb_num_h or B_mb_num_v or Aintra4x4_pred_num or Bintra4x4_pred_num)
	if (reset_n == 0)
		TC_rd_addr = 0;
	else
	case(state)	
	    read_nA: TC_rd_addr = {A_mb_num_h[6:0],mb_num_v[0],Aintra4x4_pred_num};
	    read_nB: TC_rd_addr = {mb_num_h[6:0],B_mb_num_v[0],Bintra4x4_pred_num};
	    default:;
        endcase

always @ (reset_n or state or  TC_dout or availa or availb )
  if (reset_n == 0)begin
    nA = 0; nB = 0;
  end
  else
  	case(state)	
	    read_nA: nA =  availa?TC_dout:0;
	    read_nB: nB =  availb?TC_dout:0;
	    default:;
        endcase

    
	always @ (posedge clk or negedge reset_n)
		if (reset_n == 0)
			nC <= 0;
		else if (state == dec_nC)
		if (intra4x4_pred_num == 5'd16 || intra4x4_pred_num == 5'd17 ||
		    intra16_pred_num == 5'd16 || intra16_pred_num == 5'd17 )
			nC <= 5'b11111;
		else if (availa == 1 && availb == 1)
			nC <= (nA + nB + 1) >> 1;
		else
			nC <= nA + nB;

endmodule
