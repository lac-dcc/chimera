// This program was cloned from: https://github.com/VerticalResearchGroup/miaow
// License: BSD 3-Clause "New" or "Revised" License

module encoder(in,out);
input [39:0] in;
output [5:0] out;

assign out =  (in[0]==1'b1)?6'd0:
              (in[1]==1'b1)?6'd1:
			  (in[2]==1'b1)?6'd2:
			  (in[3]==1'b1)?6'd3:
			  (in[4]==1'b1)?6'd4:
			  (in[5]==1'b1)?6'd5:
			  (in[6]==1'b1)?6'd6:
			  (in[7]==1'b1)?6'd7:
			  (in[8]==1'b1)?6'd8:
			  (in[9]==1'b1)?6'd9:
			  (in[10]==1'b1)?6'd10:
			  (in[11]==1'b1)?6'd11:
			  (in[12]==1'b1)?6'd12:
			  (in[13]==1'b1)?6'd13:
			  (in[14]==1'b1)?6'd14:
			  (in[15]==1'b1)?6'd15:
			  (in[16]==1'b1)?6'd16:
			  (in[17]==1'b1)?6'd17:
			  (in[18]==1'b1)?6'd18:
			  (in[19]==1'b1)?6'd19:
			  (in[20]==1'b1)?6'd20:
			  (in[21]==1'b1)?6'd21:
			  (in[22]==1'b1)?6'd22:
			  (in[23]==1'b1)?6'd23:
			  (in[24]==1'b1)?6'd24:
			  (in[25]==1'b1)?6'd25:
			  (in[26]==1'b1)?6'd26:
			  (in[27]==1'b1)?6'd27:
			  (in[28]==1'b1)?6'd28:
			  (in[29]==1'b1)?6'd29:
			  (in[30]==1'b1)?6'd30:
			  (in[31]==1'b1)?6'd31:
			  (in[32]==1'b1)?6'd32:
			  (in[33]==1'b1)?6'd33:
			  (in[34]==1'b1)?6'd34:
			  (in[35]==1'b1)?6'd35:
			  (in[36]==1'b1)?6'd36:
			  (in[37]==1'b1)?6'd37:
			  (in[38]==1'b1)?6'd38:
			  (in[39]==1'b1)?6'd39:
			  6'b000000;
endmodule
