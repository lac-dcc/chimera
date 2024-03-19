/************************************************************************************
 *
 * @file 		ad9361_lut.v
 * @brief 		AD9361 chip register configuration LUT file,The working mode of the
 * 				AD9361 is FDD, 1R1T, BBPLL = 1152MHz, RFPLL = 800MHz, Rx,Tx =
 * 				{288M, 144M, 72M, 36M, 18M}. Use CMOS mode, SDR sampling.
 *
 ************************************************************************************/

function [18 : 0] ad9361_cmd_data;
/* Input 13-bit register configuration index. */
input [12 : 0] index;

	/* According to the input index, choose different register command data. */
	begin
		case (index)
			13'd0:
				ad9361_cmd_data = {1'b1, 10'h000, 8'h00};
			13'd1:
				ad9361_cmd_data = {1'b1, 10'h3DF, 8'h01};
			13'd2:
				ad9361_cmd_data = {1'b0, 10'h037, 8'h00}; 	// Read 0x037[3] == 1.(ReadPartNumber)
			13'd3:
				ad9361_cmd_data = {1'b1, 10'h295, 8'h14};
			13'd4:
				ad9361_cmd_data = {1'b1, 10'h2A6, 8'h0E};
			13'd5:
				ad9361_cmd_data = {1'b1, 10'h2A8, 8'h0E};
			13'd6:
				ad9361_cmd_data = {1'b1, 10'h292, 8'h08};
			13'd7:
				ad9361_cmd_data = {1'b1, 10'h293, 8'hAC};
			13'd8:
				ad9361_cmd_data = {1'b1, 10'h294, 8'h58};
			13'd9:
				ad9361_cmd_data = {1'b1, 10'h2AB, 8'h07};
			13'd10:
				ad9361_cmd_data = {1'b1, 10'h2AC, 8'hFF};
			13'd11:
				ad9361_cmd_data = {1'b1, 10'h009, 8'h07}; 	// Wait for 20ms.
			13'd12:
				ad9361_cmd_data = {1'b1, 10'h045, 8'h00};
			13'd13:
				ad9361_cmd_data = {1'b1, 10'h046, 8'h04};
			13'd14:
				ad9361_cmd_data = {1'b1, 10'h048, 8'hE8};
			13'd15:
				ad9361_cmd_data = {1'b1, 10'h049, 8'h5B};
			13'd16:
				ad9361_cmd_data = {1'b1, 10'h04A, 8'h35};
			13'd17:
				ad9361_cmd_data = {1'b1, 10'h04B, 8'hE0};
			13'd18:
				ad9361_cmd_data = {1'b1, 10'h04E, 8'h10};
			13'd19:
				ad9361_cmd_data = {1'b1, 10'h043, 8'h00};
			13'd20:
				ad9361_cmd_data = {1'b1, 10'h042, 8'h80};
			13'd21:
				ad9361_cmd_data = {1'b1, 10'h041, 8'h19};
			13'd22:
				ad9361_cmd_data = {1'b1, 10'h044, 8'h1C};
			13'd23:
				ad9361_cmd_data = {1'b1, 10'h03F, 8'h05};
			13'd24:
				ad9361_cmd_data = {1'b1, 10'h03F, 8'h01};
			13'd25:
				ad9361_cmd_data = {1'b1, 10'h04C, 8'h86};
			13'd26:
				ad9361_cmd_data = {1'b1, 10'h04D, 8'h01};
			13'd27:
				ad9361_cmd_data = {1'b1, 10'h04D, 8'h05}; 	// Wait for 1s.
			13'd28:
				ad9361_cmd_data = {1'b0, 10'h05E, 8'h00}; 	// Read 0x05E[7] == 1.
			13'd29:
				ad9361_cmd_data = {1'b1, 10'h002, 8'hDE};
			13'd30:
				ad9361_cmd_data = {1'b1, 10'h003, 8'hDE};
			13'd31:
				ad9361_cmd_data = {1'b1, 10'h004, 8'h03};
			13'd32:
				ad9361_cmd_data = {1'b1, 10'h00A, 8'h12};
			13'd33:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFA}; 	// Wait for 1ms.
			13'd34:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h00};
			13'd35:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h06};
			13'd36:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd37:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd38:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd39:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd40:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h01};
			13'd41:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h08};
			13'd42:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd43:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd44:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd45:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd46:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h02};
			13'd47:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h0C};
			13'd48:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd49:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd50:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd51:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd52:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h03};
			13'd53:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h04};
			13'd54:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd55:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd56:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd57:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd58:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h04};
			13'd59:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF8};
			13'd60:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd61:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd62:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd63:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd64:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h05};
			13'd65:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hE8};
			13'd66:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd67:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd68:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd69:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd70:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h06};
			13'd71:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hE4};
			13'd72:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd73:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd74:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd75:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd76:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h07};
			13'd77:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF0};
			13'd78:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd79:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd80:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd81:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd82:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h08};
			13'd83:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h0A};
			13'd84:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd85:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd86:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd87:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd88:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h09};
			13'd89:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h1C};
			13'd90:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd91:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd92:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd93:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd94:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h0A};
			13'd95:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h16};
			13'd96:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd97:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd98:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd99:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd100:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h0B};
			13'd101:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF6};
			13'd102:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd103:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd104:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd105:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd106:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h0C};
			13'd107:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hD4};
			13'd108:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd109:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd110:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd111:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd112:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h0D};
			13'd113:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hCF};
			13'd114:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd115:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd116:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd117:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd118:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h0E};
			13'd119:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF5};
			13'd120:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd121:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd122:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd123:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd124:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h0F};
			13'd125:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h2D};
			13'd126:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd127:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd128:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd129:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd130:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h10};
			13'd131:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h49};
			13'd132:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd133:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd134:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd135:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd136:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h11};
			13'd137:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h26};
			13'd138:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd139:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd140:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd141:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd142:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h12};
			13'd143:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hD6};
			13'd144:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd145:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd146:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd147:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd148:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h13};
			13'd149:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h9A};
			13'd150:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd151:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd152:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd153:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd154:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h14};
			13'd155:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hAF};
			13'd156:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd157:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd158:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd159:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd160:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h15};
			13'd161:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h13};
			13'd162:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd163:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd164:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd165:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd166:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h16};
			13'd167:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h7B};
			13'd168:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd169:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd170:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd171:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd172:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h17};
			13'd173:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h87};
			13'd174:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd175:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd176:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd177:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd178:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h18};
			13'd179:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h17};
			13'd180:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd181:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd182:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd183:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd184:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h19};
			13'd185:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h7B};
			13'd186:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd187:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd188:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd189:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd190:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h1A};
			13'd191:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h3B};
			13'd192:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd193:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd194:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd195:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd196:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h1B};
			13'd197:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hA4};
			13'd198:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd199:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd200:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd201:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd202:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h1C};
			13'd203:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h77};
			13'd204:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd205:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd206:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd207:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd208:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h1D};
			13'd209:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h04};
			13'd210:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h01};
			13'd211:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd212:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd213:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd214:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h1E};
			13'd215:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hBA};
			13'd216:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd217:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd218:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd219:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd220:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h1F};
			13'd221:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hB6};
			13'd222:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd223:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd224:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd225:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd226:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h20};
			13'd227:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hC8};
			13'd228:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFE};
			13'd229:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd230:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd231:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd232:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h21};
			13'd233:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hCF};
			13'd234:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFE};
			13'd235:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd236:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd237:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd238:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h22};
			13'd239:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF1};
			13'd240:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd241:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd242:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd243:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd244:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h23};
			13'd245:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h54};
			13'd246:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h01};
			13'd247:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd248:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd249:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd250:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h24};
			13'd251:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hBA};
			13'd252:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h01};
			13'd253:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd254:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd255:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd256:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h25};
			13'd257:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h99};
			13'd258:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd259:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd260:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd261:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd262:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h26};
			13'd263:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hBA};
			13'd264:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFE};
			13'd265:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd266:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd267:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd268:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h27};
			13'd269:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hB6};
			13'd270:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFD};
			13'd271:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd272:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd273:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd274:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h28};
			13'd275:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hA4};
			13'd276:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFE};
			13'd277:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd278:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd279:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd280:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h29};
			13'd281:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hFC};
			13'd282:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd283:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd284:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd285:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd286:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h2A};
			13'd287:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hD1};
			13'd288:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h02};
			13'd289:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd290:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd291:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd292:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h2B};
			13'd293:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h5B};
			13'd294:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h02};
			13'd295:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd296:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd297:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd298:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h2C};
			13'd299:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hA2};
			13'd300:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd301:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd302:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd303:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd304:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h2D};
			13'd305:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hC7};
			13'd306:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFC};
			13'd307:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd308:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd309:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd310:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h2E};
			13'd311:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h69};
			13'd312:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFC};
			13'd313:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd314:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd315:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd316:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h2F};
			13'd317:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h50};
			13'd318:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd319:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd320:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd321:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd322:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h30};
			13'd323:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h64};
			13'd324:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h03};
			13'd325:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd326:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd327:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd328:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h31};
			13'd329:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h13};
			13'd330:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h05};
			13'd331:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd332:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd333:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd334:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h32};
			13'd335:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h56};
			13'd336:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h02};
			13'd337:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd338:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd339:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd340:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h33};
			13'd341:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hD6};
			13'd342:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFC};
			13'd343:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd344:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd345:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd346:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h34};
			13'd347:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h27};
			13'd348:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hF9};
			13'd349:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd350:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd351:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd352:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h35};
			13'd353:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h22};
			13'd354:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFB};
			13'd355:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd356:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd357:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd358:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h36};
			13'd359:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h40};
			13'd360:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h02};
			13'd361:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd362:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd363:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd364:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h37};
			13'd365:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h11};
			13'd366:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h09};
			13'd367:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd368:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd369:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd370:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h38};
			13'd371:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hFF};
			13'd372:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h08};
			13'd373:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd374:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd375:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd376:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h39};
			13'd377:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF9};
			13'd378:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd379:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd380:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd381:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd382:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h3A};
			13'd383:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h96};
			13'd384:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hF3};
			13'd385:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd386:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd387:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd388:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h3B};
			13'd389:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h9F};
			13'd390:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hEE};
			13'd391:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd392:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd393:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd394:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h3C};
			13'd395:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF3};
			13'd396:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hF9};
			13'd397:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd398:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd399:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd400:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h3D};
			13'd401:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h6E};
			13'd402:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h15};
			13'd403:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd404:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd405:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd406:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h3E};
			13'd407:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h42};
			13'd408:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h36};
			13'd409:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd410:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd411:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd412:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h3F};
			13'd413:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h77};
			13'd414:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h4C};
			13'd415:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd416:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd417:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd418:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h40};
			13'd419:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h77};
			13'd420:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h4C};
			13'd421:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd422:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd423:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd424:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h41};
			13'd425:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h42};
			13'd426:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h36};
			13'd427:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd428:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd429:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd430:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h42};
			13'd431:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h6E};
			13'd432:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h15};
			13'd433:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd434:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd435:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd436:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h43};
			13'd437:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF3};
			13'd438:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hF9};
			13'd439:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd440:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd441:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd442:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h44};
			13'd443:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h9F};
			13'd444:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hEE};
			13'd445:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd446:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd447:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd448:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h45};
			13'd449:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h96};
			13'd450:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hF3};
			13'd451:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd452:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd453:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd454:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h46};
			13'd455:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF9};
			13'd456:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd457:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd458:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd459:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd460:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h47};
			13'd461:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hFF};
			13'd462:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h08};
			13'd463:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd464:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd465:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd466:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h48};
			13'd467:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h11};
			13'd468:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h09};
			13'd469:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd470:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd471:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd472:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h49};
			13'd473:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h40};
			13'd474:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h02};
			13'd475:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd476:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd477:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd478:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h4A};
			13'd479:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h22};
			13'd480:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFB};
			13'd481:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd482:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd483:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd484:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h4B};
			13'd485:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h27};
			13'd486:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hF9};
			13'd487:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd488:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd489:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd490:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h4C};
			13'd491:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hD6};
			13'd492:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFC};
			13'd493:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd494:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd495:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd496:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h4D};
			13'd497:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h56};
			13'd498:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h02};
			13'd499:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd500:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd501:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd502:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h4E};
			13'd503:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h13};
			13'd504:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h05};
			13'd505:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd506:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd507:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd508:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h4F};
			13'd509:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h64};
			13'd510:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h03};
			13'd511:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd512:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd513:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd514:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h50};
			13'd515:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h50};
			13'd516:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd517:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd518:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd519:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd520:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h51};
			13'd521:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h69};
			13'd522:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFC};
			13'd523:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd524:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd525:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd526:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h52};
			13'd527:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hC7};
			13'd528:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFC};
			13'd529:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd530:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd531:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd532:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h53};
			13'd533:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hA2};
			13'd534:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd535:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd536:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd537:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd538:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h54};
			13'd539:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h5B};
			13'd540:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h02};
			13'd541:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd542:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd543:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd544:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h55};
			13'd545:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hD1};
			13'd546:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h02};
			13'd547:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd548:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd549:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd550:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h56};
			13'd551:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hFC};
			13'd552:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd553:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd554:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd555:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd556:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h57};
			13'd557:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hA4};
			13'd558:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFE};
			13'd559:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd560:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd561:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd562:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h58};
			13'd563:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hB6};
			13'd564:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFD};
			13'd565:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd566:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd567:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd568:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h59};
			13'd569:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hBA};
			13'd570:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFE};
			13'd571:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd572:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd573:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd574:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h5A};
			13'd575:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h99};
			13'd576:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd577:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd578:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd579:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd580:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h5B};
			13'd581:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hBA};
			13'd582:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h01};
			13'd583:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd584:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd585:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd586:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h5C};
			13'd587:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h54};
			13'd588:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h01};
			13'd589:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd590:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd591:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd592:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h5D};
			13'd593:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF1};
			13'd594:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd595:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd596:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd597:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd598:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h5E};
			13'd599:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hCF};
			13'd600:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFE};
			13'd601:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd602:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd603:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd604:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h5F};
			13'd605:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hC8};
			13'd606:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFE};
			13'd607:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd608:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd609:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd610:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h60};
			13'd611:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hB6};
			13'd612:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd613:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd614:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd615:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd616:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h61};
			13'd617:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hBA};
			13'd618:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd619:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd620:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd621:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd622:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h62};
			13'd623:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h04};
			13'd624:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h01};
			13'd625:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd626:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd627:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd628:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h63};
			13'd629:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h77};
			13'd630:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd631:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd632:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd633:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd634:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h64};
			13'd635:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hA4};
			13'd636:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd637:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd638:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd639:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd640:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h65};
			13'd641:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h3B};
			13'd642:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd643:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd644:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd645:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd646:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h66};
			13'd647:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h7B};
			13'd648:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd649:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd650:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd651:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd652:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h67};
			13'd653:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h17};
			13'd654:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd655:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd656:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd657:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd658:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h68};
			13'd659:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h87};
			13'd660:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd661:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd662:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd663:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd664:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h69};
			13'd665:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h7B};
			13'd666:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd667:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd668:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd669:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd670:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h6A};
			13'd671:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h13};
			13'd672:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd673:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd674:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd675:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd676:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h6B};
			13'd677:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hAF};
			13'd678:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd679:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd680:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd681:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd682:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h6C};
			13'd683:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h9A};
			13'd684:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd685:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd686:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd687:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd688:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h6D};
			13'd689:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hD6};
			13'd690:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd691:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd692:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd693:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd694:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h6E};
			13'd695:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h26};
			13'd696:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd697:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd698:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd699:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd700:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h6F};
			13'd701:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h49};
			13'd702:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd703:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd704:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd705:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd706:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h70};
			13'd707:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h2D};
			13'd708:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd709:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd710:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd711:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd712:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h71};
			13'd713:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF5};
			13'd714:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd715:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd716:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd717:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd718:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h72};
			13'd719:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hCF};
			13'd720:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd721:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd722:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd723:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd724:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h73};
			13'd725:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hD4};
			13'd726:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd727:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd728:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd729:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd730:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h74};
			13'd731:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF6};
			13'd732:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd733:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd734:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd735:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd736:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h75};
			13'd737:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h16};
			13'd738:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd739:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd740:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd741:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd742:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h76};
			13'd743:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h1C};
			13'd744:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd745:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd746:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd747:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd748:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h77};
			13'd749:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h0A};
			13'd750:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd751:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd752:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd753:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd754:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h78};
			13'd755:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF0};
			13'd756:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd757:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd758:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd759:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd760:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h79};
			13'd761:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hE4};
			13'd762:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd763:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd764:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd765:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd766:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h7A};
			13'd767:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hE8};
			13'd768:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd769:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd770:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd771:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd772:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h7B};
			13'd773:
				ad9361_cmd_data = {1'b1, 10'h061, 8'hF8};
			13'd774:
				ad9361_cmd_data = {1'b1, 10'h062, 8'hFF};
			13'd775:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd776:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd777:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd778:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h7C};
			13'd779:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h04};
			13'd780:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd781:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd782:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd783:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd784:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h7D};
			13'd785:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h0C};
			13'd786:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd787:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd788:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd789:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd790:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h7E};
			13'd791:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h08};
			13'd792:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd793:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd794:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd795:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd796:
				ad9361_cmd_data = {1'b1, 10'h060, 8'h7F};
			13'd797:
				ad9361_cmd_data = {1'b1, 10'h061, 8'h06};
			13'd798:
				ad9361_cmd_data = {1'b1, 10'h062, 8'h00};
			13'd799:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hFE};
			13'd800:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd801:
				ad9361_cmd_data = {1'b1, 10'h064, 8'h00};
			13'd802:
				ad9361_cmd_data = {1'b1, 10'h065, 8'hF8};
			13'd803:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFA};
			13'd804:
				ad9361_cmd_data = {1'b1, 10'h0F6, 8'h03}; 	// Wait for 1ms.
			13'd805:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h00};
			13'd806:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h07};
			13'd807:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd808:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd809:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd810:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd811:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h01};
			13'd812:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h0C};
			13'd813:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd814:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd815:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd816:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd817:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h02};
			13'd818:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h12};
			13'd819:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd820:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd821:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd822:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd823:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h03};
			13'd824:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h11};
			13'd825:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd826:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd827:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd828:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd829:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h04};
			13'd830:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h02};
			13'd831:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd832:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd833:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd834:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd835:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h05};
			13'd836:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hF3};
			13'd837:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd838:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd839:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd840:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd841:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h06};
			13'd842:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hE8};
			13'd843:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd844:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd845:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd846:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd847:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h07};
			13'd848:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hF4};
			13'd849:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd850:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd851:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd852:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd853:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h08};
			13'd854:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h0A};
			13'd855:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd856:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd857:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd858:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd859:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h09};
			13'd860:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h22};
			13'd861:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd862:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd863:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd864:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd865:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h0A};
			13'd866:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h1D};
			13'd867:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd868:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd869:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd870:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd871:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h0B};
			13'd872:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hFE};
			13'd873:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd874:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd875:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd876:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd877:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h0C};
			13'd878:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hD5};
			13'd879:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd880:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd881:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd882:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd883:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h0D};
			13'd884:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hCC};
			13'd885:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd886:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd887:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd888:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd889:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h0E};
			13'd890:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hEF};
			13'd891:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd892:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd893:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd894:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd895:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h0F};
			13'd896:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h2D};
			13'd897:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd898:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd899:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd900:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd901:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h10};
			13'd902:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h4F};
			13'd903:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd904:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd905:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd906:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd907:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h11};
			13'd908:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h31};
			13'd909:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd910:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd911:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd912:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd913:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h12};
			13'd914:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hDC};
			13'd915:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd916:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd917:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd918:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd919:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h13};
			13'd920:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h97};
			13'd921:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd922:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd923:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd924:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd925:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h14};
			13'd926:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hA2};
			13'd927:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd928:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd929:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd930:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd931:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h15};
			13'd932:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h09};
			13'd933:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd934:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd935:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd936:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd937:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h16};
			13'd938:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h7D};
			13'd939:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd940:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd941:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd942:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd943:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h17};
			13'd944:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h96};
			13'd945:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd946:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd947:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd948:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd949:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h18};
			13'd950:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h27};
			13'd951:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd952:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd953:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd954:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd955:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h19};
			13'd956:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h7E};
			13'd957:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd958:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd959:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd960:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd961:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h1A};
			13'd962:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h2C};
			13'd963:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd964:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd965:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd966:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd967:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h1B};
			13'd968:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h90};
			13'd969:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd970:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd971:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd972:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd973:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h1C};
			13'd974:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h6F};
			13'd975:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd976:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd977:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd978:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd979:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h1D};
			13'd980:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h12};
			13'd981:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h01};
			13'd982:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd983:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd984:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd985:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h1E};
			13'd986:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hD4};
			13'd987:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd988:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd989:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd990:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd991:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h1F};
			13'd992:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hC6};
			13'd993:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd994:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd995:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd996:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd997:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h20};
			13'd998:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBC};
			13'd999:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFE};
			13'd1000:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1001:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1002:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1003:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h21};
			13'd1004:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hB0};
			13'd1005:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFE};
			13'd1006:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1007:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1008:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1009:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h22};
			13'd1010:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hD9};
			13'd1011:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1012:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1013:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1014:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1015:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h23};
			13'd1016:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h5A};
			13'd1017:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h01};
			13'd1018:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1019:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1020:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1021:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h24};
			13'd1022:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hDD};
			13'd1023:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h01};
			13'd1024:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1025:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1026:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1027:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h25};
			13'd1028:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBC};
			13'd1029:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1030:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1031:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1032:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1033:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h26};
			13'd1034:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBC};
			13'd1035:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFE};
			13'd1036:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1037:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1038:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1039:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h27};
			13'd1040:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h91};
			13'd1041:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFD};
			13'd1042:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1043:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1044:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1045:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h28};
			13'd1046:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h75};
			13'd1047:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFE};
			13'd1048:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1049:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1050:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1051:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h29};
			13'd1052:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hEE};
			13'd1053:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1054:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1055:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1056:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1057:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h2A};
			13'd1058:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hF6};
			13'd1059:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h02};
			13'd1060:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1061:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1062:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1063:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h2B};
			13'd1064:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h97};
			13'd1065:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h02};
			13'd1066:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1067:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1068:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1069:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h2C};
			13'd1070:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hC0};
			13'd1071:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1072:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1073:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1074:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1075:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h2D};
			13'd1076:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hA6};
			13'd1077:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFC};
			13'd1078:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1079:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1080:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1081:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h2E};
			13'd1082:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h1F};
			13'd1083:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFC};
			13'd1084:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1085:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1086:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1087:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h2F};
			13'd1088:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h1E};
			13'd1089:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1090:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1091:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1092:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1093:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h30};
			13'd1094:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h7D};
			13'd1095:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h03};
			13'd1096:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1097:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1098:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1099:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h31};
			13'd1100:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h6C};
			13'd1101:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h05};
			13'd1102:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1103:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1104:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1105:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h32};
			13'd1106:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hA4};
			13'd1107:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h02};
			13'd1108:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1109:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1110:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1111:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h33};
			13'd1112:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hCE};
			13'd1113:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFC};
			13'd1114:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1115:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1116:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1117:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h34};
			13'd1118:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBE};
			13'd1119:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hF8};
			13'd1120:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1121:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1122:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1123:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h35};
			13'd1124:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hAA};
			13'd1125:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFA};
			13'd1126:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1127:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1128:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1129:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h36};
			13'd1130:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h2A};
			13'd1131:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h02};
			13'd1132:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1133:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1134:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1135:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h37};
			13'd1136:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h89};
			13'd1137:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h09};
			13'd1138:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1139:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1140:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1141:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h38};
			13'd1142:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hB8};
			13'd1143:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h09};
			13'd1144:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1145:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1146:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1147:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h39};
			13'd1148:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h52};
			13'd1149:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1150:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1151:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1152:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1153:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h3A};
			13'd1154:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h18};
			13'd1155:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hF3};
			13'd1156:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1157:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1158:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1159:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h3B};
			13'd1160:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h6B};
			13'd1161:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hED};
			13'd1162:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1163:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1164:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1165:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h3C};
			13'd1166:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hC9};
			13'd1167:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hF8};
			13'd1168:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1169:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1170:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1171:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h3D};
			13'd1172:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h3E};
			13'd1173:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h15};
			13'd1174:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1175:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1176:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1177:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h3E};
			13'd1178:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h80};
			13'd1179:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h37};
			13'd1180:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1181:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1182:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1183:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h3F};
			13'd1184:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBF};
			13'd1185:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h4E};
			13'd1186:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1187:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1188:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1189:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h40};
			13'd1190:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBF};
			13'd1191:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h4E};
			13'd1192:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1193:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1194:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1195:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h41};
			13'd1196:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h80};
			13'd1197:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h37};
			13'd1198:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1199:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1200:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1201:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h42};
			13'd1202:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h3E};
			13'd1203:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h15};
			13'd1204:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1205:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1206:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1207:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h43};
			13'd1208:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hC9};
			13'd1209:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hF8};
			13'd1210:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1211:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1212:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1213:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h44};
			13'd1214:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h6B};
			13'd1215:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hED};
			13'd1216:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1217:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1218:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1219:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h45};
			13'd1220:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h18};
			13'd1221:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hF3};
			13'd1222:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1223:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1224:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1225:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h46};
			13'd1226:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h52};
			13'd1227:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1228:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1229:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1230:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1231:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h47};
			13'd1232:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hB8};
			13'd1233:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h09};
			13'd1234:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1235:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1236:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1237:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h48};
			13'd1238:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h89};
			13'd1239:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h09};
			13'd1240:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1241:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1242:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1243:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h49};
			13'd1244:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h2A};
			13'd1245:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h02};
			13'd1246:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1247:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1248:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1249:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h4A};
			13'd1250:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hAA};
			13'd1251:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFA};
			13'd1252:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1253:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1254:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1255:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h4B};
			13'd1256:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBE};
			13'd1257:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hF8};
			13'd1258:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1259:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1260:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1261:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h4C};
			13'd1262:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hCE};
			13'd1263:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFC};
			13'd1264:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1265:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1266:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1267:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h4D};
			13'd1268:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hA4};
			13'd1269:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h02};
			13'd1270:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1271:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1272:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1273:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h4E};
			13'd1274:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h6C};
			13'd1275:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h05};
			13'd1276:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1277:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1278:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1279:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h4F};
			13'd1280:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h7D};
			13'd1281:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h03};
			13'd1282:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1283:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1284:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1285:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h50};
			13'd1286:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h1E};
			13'd1287:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1288:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1289:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1290:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1291:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h51};
			13'd1292:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h1F};
			13'd1293:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFC};
			13'd1294:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1295:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1296:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1297:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h52};
			13'd1298:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hA6};
			13'd1299:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFC};
			13'd1300:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1301:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1302:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1303:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h53};
			13'd1304:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hC0};
			13'd1305:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1306:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1307:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1308:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1309:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h54};
			13'd1310:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h97};
			13'd1311:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h02};
			13'd1312:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1313:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1314:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1315:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h55};
			13'd1316:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hF6};
			13'd1317:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h02};
			13'd1318:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1319:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1320:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1321:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h56};
			13'd1322:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hEE};
			13'd1323:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1324:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1325:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1326:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1327:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h57};
			13'd1328:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h75};
			13'd1329:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFE};
			13'd1330:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1331:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1332:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1333:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h58};
			13'd1334:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h91};
			13'd1335:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFD};
			13'd1336:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1337:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1338:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1339:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h59};
			13'd1340:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBC};
			13'd1341:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFE};
			13'd1342:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1343:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1344:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1345:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h5A};
			13'd1346:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBC};
			13'd1347:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1348:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1349:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1350:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1351:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h5B};
			13'd1352:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hDD};
			13'd1353:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h01};
			13'd1354:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1355:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1356:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1357:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h5C};
			13'd1358:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h5A};
			13'd1359:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h01};
			13'd1360:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1361:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1362:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1363:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h5D};
			13'd1364:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hD9};
			13'd1365:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1366:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1367:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1368:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1369:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h5E};
			13'd1370:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hB0};
			13'd1371:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFE};
			13'd1372:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1373:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1374:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1375:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h5F};
			13'd1376:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hBC};
			13'd1377:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFE};
			13'd1378:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1379:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1380:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1381:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h60};
			13'd1382:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hC6};
			13'd1383:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1384:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1385:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1386:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1387:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h61};
			13'd1388:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hD4};
			13'd1389:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1390:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1391:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1392:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1393:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h62};
			13'd1394:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h12};
			13'd1395:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h01};
			13'd1396:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1397:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1398:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1399:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h63};
			13'd1400:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h6F};
			13'd1401:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1402:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1403:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1404:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1405:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h64};
			13'd1406:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h90};
			13'd1407:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1408:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1409:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1410:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1411:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h65};
			13'd1412:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h2C};
			13'd1413:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1414:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1415:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1416:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1417:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h66};
			13'd1418:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h7E};
			13'd1419:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1420:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1421:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1422:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1423:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h67};
			13'd1424:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h27};
			13'd1425:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1426:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1427:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1428:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1429:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h68};
			13'd1430:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h96};
			13'd1431:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1432:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1433:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1434:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1435:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h69};
			13'd1436:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h7D};
			13'd1437:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1438:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1439:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1440:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1441:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h6A};
			13'd1442:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h09};
			13'd1443:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1444:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1445:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1446:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1447:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h6B};
			13'd1448:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hA2};
			13'd1449:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1450:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1451:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1452:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1453:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h6C};
			13'd1454:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h97};
			13'd1455:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1456:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1457:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1458:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1459:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h6D};
			13'd1460:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hDC};
			13'd1461:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1462:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1463:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1464:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1465:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h6E};
			13'd1466:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h31};
			13'd1467:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1468:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1469:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1470:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1471:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h6F};
			13'd1472:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h4F};
			13'd1473:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1474:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1475:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1476:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1477:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h70};
			13'd1478:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h2D};
			13'd1479:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1480:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1481:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1482:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1483:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h71};
			13'd1484:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hEF};
			13'd1485:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1486:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1487:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1488:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1489:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h72};
			13'd1490:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hCC};
			13'd1491:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1492:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1493:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1494:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1495:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h73};
			13'd1496:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hD5};
			13'd1497:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1498:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1499:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1500:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1501:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h74};
			13'd1502:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hFE};
			13'd1503:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1504:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1505:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1506:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1507:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h75};
			13'd1508:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h1D};
			13'd1509:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1510:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1511:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1512:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1513:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h76};
			13'd1514:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h22};
			13'd1515:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1516:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1517:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1518:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1519:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h77};
			13'd1520:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h0A};
			13'd1521:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1522:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1523:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1524:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1525:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h78};
			13'd1526:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hF4};
			13'd1527:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1528:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1529:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1530:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1531:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h79};
			13'd1532:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hE8};
			13'd1533:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1534:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1535:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1536:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1537:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h7A};
			13'd1538:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'hF3};
			13'd1539:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'hFF};
			13'd1540:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1541:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1542:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1543:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h7B};
			13'd1544:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h02};
			13'd1545:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1546:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1547:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1548:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1549:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h7C};
			13'd1550:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h11};
			13'd1551:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1552:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1553:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1554:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1555:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h7D};
			13'd1556:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h12};
			13'd1557:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1558:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1559:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1560:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1561:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h7E};
			13'd1562:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h0C};
			13'd1563:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1564:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1565:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1566:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1567:
				ad9361_cmd_data = {1'b1, 10'h0F0, 8'h7F};
			13'd1568:
				ad9361_cmd_data = {1'b1, 10'h0F1, 8'h07};
			13'd1569:
				ad9361_cmd_data = {1'b1, 10'h0F2, 8'h00};
			13'd1570:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hFE};
			13'd1571:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1572:
				ad9361_cmd_data = {1'b1, 10'h0F4, 8'h00};
			13'd1573:
				ad9361_cmd_data = {1'b1, 10'h0F5, 8'hF8};
			13'd1574:
				ad9361_cmd_data = {1'b1, 10'h010, 8'hC8};
			13'd1575:
				ad9361_cmd_data = {1'b1, 10'h011, 8'h00};
			13'd1576:
				ad9361_cmd_data = {1'b1, 10'h012, 8'h22};
			13'd1577:
				ad9361_cmd_data = {1'b1, 10'h006, 8'h00};
			13'd1578:
				ad9361_cmd_data = {1'b1, 10'h007, 8'h00};
			13'd1579:
				ad9361_cmd_data = {1'b1, 10'h018, 8'h00};
			13'd1580:
				ad9361_cmd_data = {1'b1, 10'h019, 8'h00};
			13'd1581:
				ad9361_cmd_data = {1'b1, 10'h01A, 8'h00};
			13'd1582:
				ad9361_cmd_data = {1'b1, 10'h01B, 8'h00};
			13'd1583:
				ad9361_cmd_data = {1'b1, 10'h023, 8'hFF};
			13'd1584:
				ad9361_cmd_data = {1'b1, 10'h026, 8'h00};
			13'd1585:
				ad9361_cmd_data = {1'b1, 10'h030, 8'h00};
			13'd1586:
				ad9361_cmd_data = {1'b1, 10'h031, 8'h00};
			13'd1587:
				ad9361_cmd_data = {1'b1, 10'h032, 8'h00};
			13'd1588:
				ad9361_cmd_data = {1'b1, 10'h033, 8'h00};
			13'd1589:
				ad9361_cmd_data = {1'b1, 10'h00B, 8'h00};
			13'd1590:
				ad9361_cmd_data = {1'b1, 10'h00C, 8'h00};
			13'd1591:
				ad9361_cmd_data = {1'b1, 10'h00D, 8'h03};
			13'd1592:
				ad9361_cmd_data = {1'b1, 10'h00F, 8'h04};
			13'd1593:
				ad9361_cmd_data = {1'b1, 10'h01C, 8'h10};
			13'd1594:
				ad9361_cmd_data = {1'b1, 10'h01D, 8'h01};
			13'd1595:
				ad9361_cmd_data = {1'b1, 10'h035, 8'h00};
			13'd1596:
				ad9361_cmd_data = {1'b1, 10'h036, 8'hFF};
			13'd1597:
				ad9361_cmd_data = {1'b1, 10'h03A, 8'h27};
			13'd1598:
				ad9361_cmd_data = {1'b1, 10'h020, 8'h00};
			13'd1599:
				ad9361_cmd_data = {1'b1, 10'h027, 8'h03};
			13'd1600:
				ad9361_cmd_data = {1'b1, 10'h028, 8'h00};
			13'd1601:
				ad9361_cmd_data = {1'b1, 10'h029, 8'h00};
			13'd1602:
				ad9361_cmd_data = {1'b1, 10'h02A, 8'h00};
			13'd1603:
				ad9361_cmd_data = {1'b1, 10'h02B, 8'h00};
			13'd1604:
				ad9361_cmd_data = {1'b1, 10'h02C, 8'h00};
			13'd1605:
				ad9361_cmd_data = {1'b1, 10'h02D, 8'h00};
			13'd1606:
				ad9361_cmd_data = {1'b1, 10'h02E, 8'h00};
			13'd1607:
				ad9361_cmd_data = {1'b1, 10'h02F, 8'h00};
			13'd1608:
				ad9361_cmd_data = {1'b1, 10'h261, 8'h00};
			13'd1609:
				ad9361_cmd_data = {1'b1, 10'h2A1, 8'h00};
			13'd1610:
				ad9361_cmd_data = {1'b1, 10'h248, 8'h0B};
			13'd1611:
				ad9361_cmd_data = {1'b1, 10'h288, 8'h0B};
			13'd1612:
				ad9361_cmd_data = {1'b1, 10'h246, 8'h02};
			13'd1613:
				ad9361_cmd_data = {1'b1, 10'h286, 8'h02};
			13'd1614:
				ad9361_cmd_data = {1'b1, 10'h249, 8'h8E};
			13'd1615:
				ad9361_cmd_data = {1'b1, 10'h289, 8'h8E};
			13'd1616:
				ad9361_cmd_data = {1'b1, 10'h23B, 8'h80};
			13'd1617:
				ad9361_cmd_data = {1'b1, 10'h27B, 8'h80};
			13'd1618:
				ad9361_cmd_data = {1'b1, 10'h243, 8'h0D};
			13'd1619:
				ad9361_cmd_data = {1'b1, 10'h283, 8'h0D};
			13'd1620:
				ad9361_cmd_data = {1'b1, 10'h23D, 8'h00};
			13'd1621:
				ad9361_cmd_data = {1'b1, 10'h27D, 8'h00};
			13'd1622:
				ad9361_cmd_data = {1'b1, 10'h015, 8'h04};
			13'd1623:
				ad9361_cmd_data = {1'b1, 10'h014, 8'h05};
			13'd1624:
				ad9361_cmd_data = {1'b1, 10'h013, 8'h01}; 	// Wait for 1ms.
			13'd1625:
				ad9361_cmd_data = {1'b1, 10'h23D, 8'h04}; 	// Wait for 1s.
			13'd1626:
				ad9361_cmd_data = {1'b0, 10'h244, 8'h00}; 	// Read 0x244[7] == 1.
			13'd1627:
				ad9361_cmd_data = {1'b1, 10'h27D, 8'h04}; 	// Wait for 1s.
			13'd1628:
				ad9361_cmd_data = {1'b0, 10'h284, 8'h00}; 	// Read 0x284[7] == 1.
			13'd1629:
				ad9361_cmd_data = {1'b1, 10'h23A, 8'h4A};
			13'd1630:
				ad9361_cmd_data = {1'b1, 10'h239, 8'hC1};
			13'd1631:
				ad9361_cmd_data = {1'b1, 10'h242, 8'h17};
			13'd1632:
				ad9361_cmd_data = {1'b1, 10'h238, 8'h78};
			13'd1633:
				ad9361_cmd_data = {1'b1, 10'h245, 8'h00};
			13'd1634:
				ad9361_cmd_data = {1'b1, 10'h251, 8'h0E};
			13'd1635:
				ad9361_cmd_data = {1'b1, 10'h250, 8'h70};
			13'd1636:
				ad9361_cmd_data = {1'b1, 10'h23B, 8'h96};
			13'd1637:
				ad9361_cmd_data = {1'b1, 10'h23E, 8'hD4};
			13'd1638:
				ad9361_cmd_data = {1'b1, 10'h23F, 8'hDF};
			13'd1639:
				ad9361_cmd_data = {1'b1, 10'h240, 8'h09};
			13'd1640:
				ad9361_cmd_data = {1'b1, 10'h27A, 8'h4A};
			13'd1641:
				ad9361_cmd_data = {1'b1, 10'h279, 8'hC3};
			13'd1642:
				ad9361_cmd_data = {1'b1, 10'h282, 8'h1F};
			13'd1643:
				ad9361_cmd_data = {1'b1, 10'h278, 8'h78};
			13'd1644:
				ad9361_cmd_data = {1'b1, 10'h285, 8'h00};
			13'd1645:
				ad9361_cmd_data = {1'b1, 10'h291, 8'h0C};
			13'd1646:
				ad9361_cmd_data = {1'b1, 10'h290, 8'h70};
			13'd1647:
				ad9361_cmd_data = {1'b1, 10'h27B, 8'h92};
			13'd1648:
				ad9361_cmd_data = {1'b1, 10'h27E, 8'hD4};
			13'd1649:
				ad9361_cmd_data = {1'b1, 10'h27F, 8'hDF};
			13'd1650:
				ad9361_cmd_data = {1'b1, 10'h280, 8'h09};
			13'd1651:
				ad9361_cmd_data = {1'b1, 10'h233, 8'h00};
			13'd1652:
				ad9361_cmd_data = {1'b1, 10'h234, 8'h00};
			13'd1653:
				ad9361_cmd_data = {1'b1, 10'h235, 8'h00};
			13'd1654:
				ad9361_cmd_data = {1'b1, 10'h232, 8'h00};
			13'd1655:
				ad9361_cmd_data = {1'b1, 10'h231, 8'h5A};
			13'd1656:
				ad9361_cmd_data = {1'b1, 10'h005, 8'h22};
			13'd1657:
				ad9361_cmd_data = {1'b1, 10'h273, 8'h00};
			13'd1658:
				ad9361_cmd_data = {1'b1, 10'h274, 8'h00};
			13'd1659:
				ad9361_cmd_data = {1'b1, 10'h275, 8'h00};
			13'd1660:
				ad9361_cmd_data = {1'b1, 10'h272, 8'h00};
			13'd1661:
				ad9361_cmd_data = {1'b1, 10'h271, 8'h50};
			13'd1662:
				ad9361_cmd_data = {1'b1, 10'h005, 8'h22}; 	// Wait for 1s.
			13'd1663:
				ad9361_cmd_data = {1'b0, 10'h247, 8'h00}; 	// Read 0x247[1] == 1.
			13'd1664:
				ad9361_cmd_data = {1'b0, 10'h287, 8'h00}; 	// Read 0x287[1] == 1.
			13'd1665:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h02};
			13'd1666:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h0F};
			13'd1667:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h78};
			13'd1668:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1669:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h00};
			13'd1670:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1671:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1672:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1673:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h0E};
			13'd1674:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h74};
			13'd1675:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1676:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h0D};
			13'd1677:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1678:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1679:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1680:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h0D};
			13'd1681:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h70};
			13'd1682:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1683:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h15};
			13'd1684:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1685:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1686:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1687:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h0C};
			13'd1688:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h6C};
			13'd1689:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1690:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h1B};
			13'd1691:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1692:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1693:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1694:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h0B};
			13'd1695:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h68};
			13'd1696:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1697:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h21};
			13'd1698:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1699:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1700:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1701:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h0A};
			13'd1702:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h64};
			13'd1703:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1704:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h25};
			13'd1705:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1706:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1707:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1708:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h09};
			13'd1709:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h60};
			13'd1710:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1711:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h29};
			13'd1712:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1713:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1714:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1715:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h08};
			13'd1716:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h5C};
			13'd1717:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1718:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h2C};
			13'd1719:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1720:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1721:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1722:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h07};
			13'd1723:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h58};
			13'd1724:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1725:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h2F};
			13'd1726:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1727:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1728:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1729:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h06};
			13'd1730:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h54};
			13'd1731:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1732:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h31};
			13'd1733:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1734:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1735:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1736:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h05};
			13'd1737:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h50};
			13'd1738:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1739:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h33};
			13'd1740:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1741:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1742:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1743:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h04};
			13'd1744:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h4C};
			13'd1745:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1746:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h34};
			13'd1747:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1748:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1749:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1750:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h03};
			13'd1751:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h48};
			13'd1752:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1753:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h35};
			13'd1754:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1755:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1756:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1757:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h02};
			13'd1758:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h30};
			13'd1759:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1760:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h3A};
			13'd1761:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1762:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1763:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1764:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h01};
			13'd1765:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h18};
			13'd1766:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1767:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h3D};
			13'd1768:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1769:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1770:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1771:
				ad9361_cmd_data = {1'b1, 10'h138, 8'h00};
			13'd1772:
				ad9361_cmd_data = {1'b1, 10'h139, 8'h00};
			13'd1773:
				ad9361_cmd_data = {1'b1, 10'h13A, 8'h00};
			13'd1774:
				ad9361_cmd_data = {1'b1, 10'h13B, 8'h3E};
			13'd1775:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h06};
			13'd1776:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1777:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1778:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h02};
			13'd1779:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1780:
				ad9361_cmd_data = {1'b1, 10'h13C, 8'h00};
			13'd1781:
				ad9361_cmd_data = {1'b1, 10'h13F, 8'h00};
			13'd1782:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1A};
			13'd1783:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h00};
			13'd1784:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd1785:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd1786:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd1787:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1788:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1789:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1790:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h01};
			13'd1791:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd1792:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd1793:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1794:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1795:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1796:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1797:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h02};
			13'd1798:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd1799:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd1800:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1801:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1802:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1803:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1804:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h03};
			13'd1805:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd1806:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h01};
			13'd1807:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1808:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1809:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1810:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1811:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h04};
			13'd1812:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd1813:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h02};
			13'd1814:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1815:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1816:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1817:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1818:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h05};
			13'd1819:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd1820:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h03};
			13'd1821:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1822:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1823:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1824:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1825:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h06};
			13'd1826:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd1827:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h04};
			13'd1828:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1829:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1830:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1831:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1832:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h07};
			13'd1833:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd1834:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h05};
			13'd1835:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1836:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1837:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1838:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1839:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h08};
			13'd1840:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1841:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h03};
			13'd1842:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd1843:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1844:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1845:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1846:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h09};
			13'd1847:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1848:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h04};
			13'd1849:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1850:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1851:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1852:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1853:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h0A};
			13'd1854:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1855:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h05};
			13'd1856:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1857:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1858:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1859:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1860:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h0B};
			13'd1861:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1862:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h06};
			13'd1863:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1864:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1865:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1866:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1867:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h0C};
			13'd1868:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1869:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h07};
			13'd1870:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1871:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1872:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1873:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1874:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h0D};
			13'd1875:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1876:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h08};
			13'd1877:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1878:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1879:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1880:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1881:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h0E};
			13'd1882:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1883:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h09};
			13'd1884:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1885:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1886:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1887:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1888:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h0F};
			13'd1889:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1890:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0A};
			13'd1891:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1892:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1893:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1894:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1895:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h10};
			13'd1896:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1897:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0B};
			13'd1898:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1899:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1900:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1901:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1902:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h11};
			13'd1903:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1904:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0C};
			13'd1905:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1906:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1907:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1908:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1909:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h12};
			13'd1910:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1911:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0D};
			13'd1912:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1913:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1914:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1915:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1916:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h13};
			13'd1917:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h01};
			13'd1918:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0E};
			13'd1919:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1920:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1921:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1922:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1923:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h14};
			13'd1924:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1925:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h09};
			13'd1926:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd1927:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1928:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1929:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1930:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h15};
			13'd1931:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1932:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0A};
			13'd1933:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1934:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1935:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1936:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1937:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h16};
			13'd1938:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1939:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0B};
			13'd1940:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1941:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1942:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1943:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1944:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h17};
			13'd1945:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1946:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0C};
			13'd1947:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1948:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1949:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1950:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1951:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h18};
			13'd1952:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1953:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0D};
			13'd1954:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1955:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1956:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1957:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1958:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h19};
			13'd1959:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1960:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0E};
			13'd1961:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1962:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1963:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1964:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1965:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h1A};
			13'd1966:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1967:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h0F};
			13'd1968:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1969:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1970:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1971:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1972:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h1B};
			13'd1973:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1974:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h10};
			13'd1975:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1976:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1977:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1978:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1979:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h1C};
			13'd1980:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1981:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2B};
			13'd1982:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd1983:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1984:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1985:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1986:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h1D};
			13'd1987:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h02};
			13'd1988:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2C};
			13'd1989:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd1990:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1991:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1992:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1993:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h1E};
			13'd1994:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h04};
			13'd1995:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h27};
			13'd1996:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd1997:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd1998:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd1999:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2000:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h1F};
			13'd2001:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h04};
			13'd2002:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h28};
			13'd2003:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2004:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2005:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2006:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2007:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h20};
			13'd2008:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h04};
			13'd2009:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h29};
			13'd2010:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2011:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2012:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2013:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2014:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h21};
			13'd2015:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h04};
			13'd2016:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2A};
			13'd2017:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2018:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2019:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2020:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2021:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h22};
			13'd2022:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h04};
			13'd2023:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2B};
			13'd2024:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2025:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2026:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2027:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2028:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h23};
			13'd2029:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h24};
			13'd2030:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h21};
			13'd2031:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2032:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2033:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2034:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2035:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h24};
			13'd2036:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h24};
			13'd2037:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h22};
			13'd2038:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2039:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2040:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2041:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2042:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h25};
			13'd2043:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2044:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h20};
			13'd2045:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2046:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2047:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2048:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2049:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h26};
			13'd2050:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2051:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h21};
			13'd2052:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2053:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2054:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2055:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2056:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h27};
			13'd2057:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2058:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h22};
			13'd2059:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2060:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2061:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2062:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2063:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h28};
			13'd2064:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2065:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h23};
			13'd2066:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2067:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2068:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2069:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2070:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h29};
			13'd2071:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2072:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h24};
			13'd2073:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2074:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2075:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2076:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2077:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h2A};
			13'd2078:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2079:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h25};
			13'd2080:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2081:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2082:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2083:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2084:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h2B};
			13'd2085:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2086:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h26};
			13'd2087:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2088:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2089:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2090:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2091:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h2C};
			13'd2092:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2093:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h27};
			13'd2094:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2095:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2096:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2097:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2098:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h2D};
			13'd2099:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2100:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h28};
			13'd2101:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2102:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2103:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2104:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2105:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h2E};
			13'd2106:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2107:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h29};
			13'd2108:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2109:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2110:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2111:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2112:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h2F};
			13'd2113:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2114:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2A};
			13'd2115:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2116:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2117:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2118:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2119:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h30};
			13'd2120:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2121:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2B};
			13'd2122:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2123:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2124:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2125:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2126:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h31};
			13'd2127:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2128:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2C};
			13'd2129:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2130:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2131:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2132:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2133:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h32};
			13'd2134:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2135:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2D};
			13'd2136:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2137:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2138:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2139:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2140:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h33};
			13'd2141:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2142:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2E};
			13'd2143:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2144:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2145:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2146:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2147:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h34};
			13'd2148:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2149:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2F};
			13'd2150:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2151:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2152:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2153:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2154:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h35};
			13'd2155:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2156:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h30};
			13'd2157:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2158:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2159:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2160:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2161:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h36};
			13'd2162:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h44};
			13'd2163:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h31};
			13'd2164:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2165:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2166:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2167:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2168:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h37};
			13'd2169:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2170:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2E};
			13'd2171:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2172:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2173:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2174:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2175:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h38};
			13'd2176:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2177:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h2F};
			13'd2178:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2179:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2180:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2181:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2182:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h39};
			13'd2183:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2184:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h30};
			13'd2185:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2186:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2187:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2188:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2189:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h3A};
			13'd2190:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2191:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h31};
			13'd2192:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2193:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2194:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2195:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2196:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h3B};
			13'd2197:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2198:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h32};
			13'd2199:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2200:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2201:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2202:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2203:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h3C};
			13'd2204:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2205:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h33};
			13'd2206:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2207:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2208:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2209:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2210:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h3D};
			13'd2211:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2212:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h34};
			13'd2213:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2214:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2215:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2216:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2217:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h3E};
			13'd2218:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2219:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h35};
			13'd2220:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2221:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2222:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2223:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2224:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h3F};
			13'd2225:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2226:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h36};
			13'd2227:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2228:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2229:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2230:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2231:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h40};
			13'd2232:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2233:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h37};
			13'd2234:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2235:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2236:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2237:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2238:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h41};
			13'd2239:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h64};
			13'd2240:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2241:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2242:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2243:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2244:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2245:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h42};
			13'd2246:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h65};
			13'd2247:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2248:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2249:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2250:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2251:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2252:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h43};
			13'd2253:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h66};
			13'd2254:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2255:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2256:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2257:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2258:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2259:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h44};
			13'd2260:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h67};
			13'd2261:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2262:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2263:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2264:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2265:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2266:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h45};
			13'd2267:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h68};
			13'd2268:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2269:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2270:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2271:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2272:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2273:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h46};
			13'd2274:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h69};
			13'd2275:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2276:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2277:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2278:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2279:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2280:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h47};
			13'd2281:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h6A};
			13'd2282:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2283:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2284:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2285:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2286:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2287:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h48};
			13'd2288:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h6B};
			13'd2289:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2290:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2291:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2292:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2293:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2294:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h49};
			13'd2295:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h6C};
			13'd2296:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2297:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2298:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2299:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2300:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2301:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h4A};
			13'd2302:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h6D};
			13'd2303:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2304:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2305:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2306:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2307:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2308:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h4B};
			13'd2309:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h6E};
			13'd2310:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2311:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2312:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2313:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2314:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2315:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h4C};
			13'd2316:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h6F};
			13'd2317:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h38};
			13'd2318:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h20};
			13'd2319:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2320:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2321:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2322:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h4D};
			13'd2323:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2324:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2325:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2326:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2327:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2328:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2329:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h4E};
			13'd2330:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2331:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2332:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2333:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2334:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2335:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2336:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h4F};
			13'd2337:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2338:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2339:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2340:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2341:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2342:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2343:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h50};
			13'd2344:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2345:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2346:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2347:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2348:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2349:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2350:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h51};
			13'd2351:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2352:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2353:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2354:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2355:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2356:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2357:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h52};
			13'd2358:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2359:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2360:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2361:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2362:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2363:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2364:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h53};
			13'd2365:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2366:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2367:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2368:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2369:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2370:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2371:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h54};
			13'd2372:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2373:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2374:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2375:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2376:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2377:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2378:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h55};
			13'd2379:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2380:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2381:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2382:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2383:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2384:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2385:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h56};
			13'd2386:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2387:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2388:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2389:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2390:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2391:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2392:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h57};
			13'd2393:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2394:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2395:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2396:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2397:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2398:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2399:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h58};
			13'd2400:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2401:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2402:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2403:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2404:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2405:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2406:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h59};
			13'd2407:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2408:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2409:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2410:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2411:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2412:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2413:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h5A};
			13'd2414:
				ad9361_cmd_data = {1'b1, 10'h131, 8'h00};
			13'd2415:
				ad9361_cmd_data = {1'b1, 10'h132, 8'h00};
			13'd2416:
				ad9361_cmd_data = {1'b1, 10'h133, 8'h00};
			13'd2417:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1E};
			13'd2418:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2419:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2420:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h1A};
			13'd2421:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2422:
				ad9361_cmd_data = {1'b1, 10'h134, 8'h00};
			13'd2423:
				ad9361_cmd_data = {1'b1, 10'h137, 8'h00};
			13'd2424:
				ad9361_cmd_data = {1'b1, 10'h0FA, 8'hE0};
			13'd2425:
				ad9361_cmd_data = {1'b1, 10'h0FB, 8'h08};
			13'd2426:
				ad9361_cmd_data = {1'b1, 10'h0FC, 8'h23};
			13'd2427:
				ad9361_cmd_data = {1'b1, 10'h0FD, 8'h4C};
			13'd2428:
				ad9361_cmd_data = {1'b1, 10'h0FE, 8'h44};
			13'd2429:
				ad9361_cmd_data = {1'b1, 10'h100, 8'h6F};
			13'd2430:
				ad9361_cmd_data = {1'b1, 10'h104, 8'h2F};
			13'd2431:
				ad9361_cmd_data = {1'b1, 10'h105, 8'h3A};
			13'd2432:
				ad9361_cmd_data = {1'b1, 10'h107, 8'h31};
			13'd2433:
				ad9361_cmd_data = {1'b1, 10'h108, 8'h39};
			13'd2434:
				ad9361_cmd_data = {1'b1, 10'h109, 8'h4C};
			13'd2435:
				ad9361_cmd_data = {1'b1, 10'h10A, 8'h58};
			13'd2436:
				ad9361_cmd_data = {1'b1, 10'h10B, 8'h00};
			13'd2437:
				ad9361_cmd_data = {1'b1, 10'h10C, 8'h4C};
			13'd2438:
				ad9361_cmd_data = {1'b1, 10'h10D, 8'h18};
			13'd2439:
				ad9361_cmd_data = {1'b1, 10'h10E, 8'h00};
			13'd2440:
				ad9361_cmd_data = {1'b1, 10'h114, 8'h30};
			13'd2441:
				ad9361_cmd_data = {1'b1, 10'h11A, 8'h27};
			13'd2442:
				ad9361_cmd_data = {1'b1, 10'h081, 8'h00};
			13'd2443:
				ad9361_cmd_data = {1'b1, 10'h1FB, 8'h0C};
			13'd2444:
				ad9361_cmd_data = {1'b1, 10'h1FC, 8'h40};
			13'd2445:
				ad9361_cmd_data = {1'b1, 10'h1F8, 8'h08};
			13'd2446:
				ad9361_cmd_data = {1'b1, 10'h1F9, 8'h1E};
			13'd2447:
				ad9361_cmd_data = {1'b1, 10'h1D5, 8'h3F};
			13'd2448:
				ad9361_cmd_data = {1'b1, 10'h1C0, 8'h03};
			13'd2449:
				ad9361_cmd_data = {1'b1, 10'h1E2, 8'h02};
			13'd2450:
				ad9361_cmd_data = {1'b1, 10'h1E3, 8'h02};
			13'd2451:
				ad9361_cmd_data = {1'b1, 10'h016, 8'h80}; 	// Wait for 1s.
			13'd2452:
				ad9361_cmd_data = {1'b0, 10'h016, 8'h00}; 	// Read 0x016[7] == 1.
			13'd2453:
				ad9361_cmd_data = {1'b1, 10'h1E2, 8'h03};
			13'd2454:
				ad9361_cmd_data = {1'b1, 10'h1E3, 8'h03};
			13'd2455:
				ad9361_cmd_data = {1'b1, 10'h0D6, 8'h07};
			13'd2456:
				ad9361_cmd_data = {1'b1, 10'h0D7, 8'h1E};
			13'd2457:
				ad9361_cmd_data = {1'b1, 10'h0CA, 8'h22};
			13'd2458:
				ad9361_cmd_data = {1'b1, 10'h016, 8'h40}; 	// Wait for 1s.
			13'd2459:
				ad9361_cmd_data = {1'b0, 10'h016, 8'h00}; 	// Read 0x016[6] == 1.
			13'd2460:
				ad9361_cmd_data = {1'b1, 10'h0CA, 8'h26};
			13'd2461:
				ad9361_cmd_data = {1'b0, 10'h1EB, 8'h00}; 	// Read 0x1EB.
			13'd2462:
				ad9361_cmd_data = {1'b0, 10'h1EC, 8'h00}; 	// Read 0x1EC.
			13'd2463:
				ad9361_cmd_data = {1'b0, 10'h1E6, 8'h00}; 	// Read 0x1E6.
			13'd2464:
				ad9361_cmd_data = {1'b1, 10'h1DB, 8'h20};
			13'd2465:
				ad9361_cmd_data = {1'b1, 10'h1DD, 8'h00};
			13'd2466:
				ad9361_cmd_data = {1'b1, 10'h1DF, 8'h00};
			13'd2467:
				ad9361_cmd_data = {1'b1, 10'h1DC, 8'h58};
			13'd2468:
				ad9361_cmd_data = {1'b1, 10'h1DE, 8'h58};
			13'd2469:
				ad9361_cmd_data = {1'b1, 10'h0D2, 8'h0D};
			13'd2470:
				ad9361_cmd_data = {1'b1, 10'h0D1, 8'h0C};
			13'd2471:
				ad9361_cmd_data = {1'b1, 10'h0D0, 8'h57};
			13'd2472:
				ad9361_cmd_data = {1'b0, 10'h1EB, 8'h00}; 	// Read 0x1EB.
			13'd2473:
				ad9361_cmd_data = {1'b0, 10'h1EC, 8'h00}; 	// Read 0x1EC.
			13'd2474:
				ad9361_cmd_data = {1'b0, 10'h1E6, 8'h00}; 	// Read 0x1E6.
			13'd2475:
				ad9361_cmd_data = {1'b1, 10'h200, 8'h00};
			13'd2476:
				ad9361_cmd_data = {1'b1, 10'h201, 8'h00};
			13'd2477:
				ad9361_cmd_data = {1'b1, 10'h202, 8'h00};
			13'd2478:
				ad9361_cmd_data = {1'b1, 10'h203, 8'h24};
			13'd2479:
				ad9361_cmd_data = {1'b1, 10'h204, 8'h24};
			13'd2480:
				ad9361_cmd_data = {1'b1, 10'h205, 8'h00};
			13'd2481:
				ad9361_cmd_data = {1'b1, 10'h206, 8'h00};
			13'd2482:
				ad9361_cmd_data = {1'b1, 10'h207, 8'h7C};
			13'd2483:
				ad9361_cmd_data = {1'b1, 10'h208, 8'h46};
			13'd2484:
				ad9361_cmd_data = {1'b1, 10'h209, 8'h3C};
			13'd2485:
				ad9361_cmd_data = {1'b1, 10'h20A, 8'h4B};
			13'd2486:
				ad9361_cmd_data = {1'b1, 10'h20B, 8'h2C};
			13'd2487:
				ad9361_cmd_data = {1'b1, 10'h20C, 8'h4E};
			13'd2488:
				ad9361_cmd_data = {1'b1, 10'h20D, 8'h2A};
			13'd2489:
				ad9361_cmd_data = {1'b1, 10'h20E, 8'h00};
			13'd2490:
				ad9361_cmd_data = {1'b1, 10'h20F, 8'h7F};
			13'd2491:
				ad9361_cmd_data = {1'b1, 10'h210, 8'h7E};
			13'd2492:
				ad9361_cmd_data = {1'b1, 10'h211, 8'h7F};
			13'd2493:
				ad9361_cmd_data = {1'b1, 10'h212, 8'h49};
			13'd2494:
				ad9361_cmd_data = {1'b1, 10'h213, 8'h48};
			13'd2495:
				ad9361_cmd_data = {1'b1, 10'h214, 8'h49};
			13'd2496:
				ad9361_cmd_data = {1'b1, 10'h215, 8'h4C};
			13'd2497:
				ad9361_cmd_data = {1'b1, 10'h216, 8'h4B};
			13'd2498:
				ad9361_cmd_data = {1'b1, 10'h217, 8'h4C};
			13'd2499:
				ad9361_cmd_data = {1'b1, 10'h218, 8'h2E};
			13'd2500:
				ad9361_cmd_data = {1'b1, 10'h219, 8'h9C};
			13'd2501:
				ad9361_cmd_data = {1'b1, 10'h21A, 8'h1F};
			13'd2502:
				ad9361_cmd_data = {1'b1, 10'h21B, 8'h15};
			13'd2503:
				ad9361_cmd_data = {1'b1, 10'h21C, 8'h9C};
			13'd2504:
				ad9361_cmd_data = {1'b1, 10'h21D, 8'h1F};
			13'd2505:
				ad9361_cmd_data = {1'b1, 10'h21E, 8'h15};
			13'd2506:
				ad9361_cmd_data = {1'b1, 10'h21F, 8'h9C};
			13'd2507:
				ad9361_cmd_data = {1'b1, 10'h220, 8'h1F};
			13'd2508:
				ad9361_cmd_data = {1'b1, 10'h221, 8'h2A};
			13'd2509:
				ad9361_cmd_data = {1'b1, 10'h222, 8'h2A};
			13'd2510:
				ad9361_cmd_data = {1'b1, 10'h223, 8'h40};
			13'd2511:
				ad9361_cmd_data = {1'b1, 10'h224, 8'h40};
			13'd2512:
				ad9361_cmd_data = {1'b1, 10'h225, 8'h2C};
			13'd2513:
				ad9361_cmd_data = {1'b1, 10'h226, 8'h00};
			13'd2514:
				ad9361_cmd_data = {1'b1, 10'h227, 8'h00};
			13'd2515:
				ad9361_cmd_data = {1'b0, 10'h0A3, 8'h00}; 	// Read 0x0A3.
			13'd2516:
				ad9361_cmd_data = {1'b1, 10'h0A0, 8'h5F};
			13'd2517:
				ad9361_cmd_data = {1'b1, 10'h0A3, 8'h80};
			13'd2518:
				ad9361_cmd_data = {1'b1, 10'h0A1, 8'h7B};
			13'd2519:
				ad9361_cmd_data = {1'b1, 10'h0A9, 8'hFF};
			13'd2520:
				ad9361_cmd_data = {1'b1, 10'h0A2, 8'h7F};
			13'd2521:
				ad9361_cmd_data = {1'b1, 10'h0A5, 8'h01};
			13'd2522:
				ad9361_cmd_data = {1'b1, 10'h0A6, 8'h01};
			13'd2523:
				ad9361_cmd_data = {1'b1, 10'h0AA, 8'h25};
			13'd2524:
				ad9361_cmd_data = {1'b1, 10'h0A4, 8'hF0};
			13'd2525:
				ad9361_cmd_data = {1'b1, 10'h0AE, 8'h00};
			13'd2526:
				ad9361_cmd_data = {1'b1, 10'h193, 8'h3F};
			13'd2527:
				ad9361_cmd_data = {1'b1, 10'h190, 8'h0F};
			13'd2528:
				ad9361_cmd_data = {1'b1, 10'h194, 8'h01};
			13'd2529:
				ad9361_cmd_data = {1'b1, 10'h016, 8'h01}; 	// Wait for 1s.
			13'd2530:
				ad9361_cmd_data = {1'b0, 10'h016, 8'h00}; 	// Read 0x016[0] == 1.
			13'd2531:
				ad9361_cmd_data = {1'b1, 10'h185, 8'h20};
			13'd2532:
				ad9361_cmd_data = {1'b1, 10'h186, 8'h32};
			13'd2533:
				ad9361_cmd_data = {1'b1, 10'h187, 8'h24};
			13'd2534:
				ad9361_cmd_data = {1'b1, 10'h18B, 8'h83};
			13'd2535:
				ad9361_cmd_data = {1'b1, 10'h188, 8'h05};
			13'd2536:
				ad9361_cmd_data = {1'b1, 10'h189, 8'h30};
			13'd2537:
				ad9361_cmd_data = {1'b1, 10'h016, 8'h02}; 	// Wait for 1s.
			13'd2538:
				ad9361_cmd_data = {1'b0, 10'h016, 8'h00}; 	// Read 0x016[1] == 1.
			13'd2539:
				ad9361_cmd_data = {1'b1, 10'h016, 8'h10}; 	// Wait for 1s.
			13'd2540:
				ad9361_cmd_data = {1'b0, 10'h016, 8'h00}; 	// Read 0x016[4] == 1.
			13'd2541:
				ad9361_cmd_data = {1'b1, 10'h168, 8'h03};
			13'd2542:
				ad9361_cmd_data = {1'b1, 10'h16E, 8'h25};
			13'd2543:
				ad9361_cmd_data = {1'b1, 10'h16A, 8'h75};
			13'd2544:
				ad9361_cmd_data = {1'b1, 10'h16B, 8'h15};
			13'd2545:
				ad9361_cmd_data = {1'b1, 10'h169, 8'hCF};
			13'd2546:
				ad9361_cmd_data = {1'b1, 10'h18B, 8'hAD};
			13'd2547:
				ad9361_cmd_data = {1'b1, 10'h012, 8'h22};
			13'd2548:
				ad9361_cmd_data = {1'b1, 10'h013, 8'h01};
			13'd2549:
				ad9361_cmd_data = {1'b1, 10'h015, 8'h04};
			13'd2550:
				ad9361_cmd_data = {1'b1, 10'h073, 8'h28};
			13'd2551:
				ad9361_cmd_data = {1'b1, 10'h074, 8'h00};
			13'd2552:
				ad9361_cmd_data = {1'b1, 10'h075, 8'h28};
			13'd2553:
				ad9361_cmd_data = {1'b1, 10'h076, 8'h00};
			13'd2554:
				ad9361_cmd_data = {1'b1, 10'h150, 8'h0E};
			13'd2555:
				ad9361_cmd_data = {1'b1, 10'h151, 8'h00};
			13'd2556:
				ad9361_cmd_data = {1'b1, 10'h152, 8'hFF};
			13'd2557:
				ad9361_cmd_data = {1'b1, 10'h153, 8'h00};
			13'd2558:
				ad9361_cmd_data = {1'b1, 10'h154, 8'h00};
			13'd2559:
				ad9361_cmd_data = {1'b1, 10'h155, 8'h00};
			13'd2560:
				ad9361_cmd_data = {1'b1, 10'h156, 8'h00};
			13'd2561:
				ad9361_cmd_data = {1'b1, 10'h157, 8'h00};
			13'd2562:
				ad9361_cmd_data = {1'b1, 10'h158, 8'h0D};
			13'd2563:
				ad9361_cmd_data = {1'b1, 10'h15C, 8'h67};
			13'd2564:
				ad9361_cmd_data = {1'b1, 10'h002, 8'h5E};
			13'd2565:
				ad9361_cmd_data = {1'b1, 10'h003, 8'h1E};
			13'd2566:
				ad9361_cmd_data = {1'b1, 10'h014, 8'h68};
			13'd2567:
				ad9361_cmd_data = {1'b1, 10'h130, 8'h4C};
		endcase
	end
endfunction