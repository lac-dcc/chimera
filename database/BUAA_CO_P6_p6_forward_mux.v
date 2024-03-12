`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:34 11/24/2018 
// Design Name: 
// Module Name:    forward_mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module forward_mux(
	 input [31:0] RS_E,
	 input [31:0] RT_E,
	 input [31:0] RT_M,
    input [31:0] WD,
    input [31:0] AO_M,
	 input [31:0] MDO_M,
	 input [31:0] MD_out,
	 input [31:0] PC8_E,
	 input [31:0] PC8_M,
    input [31:0] PC8_W,
	 input [31:0] RF_RD1,
	 input [31:0] RF_RD2,
	 input [2:0] ForwardRSD,	
	 input [2:0] ForwardRTD,	
	 input [2:0] ForwardRSE,	
	 input [2:0] ForwardRTE,	
	 input [2:0] ForwardRTM,
	 output reg[31:0] MFRSD,
	 output reg[31:0] MFRTD,
    output reg[31:0] MFRSE,
    output reg[31:0] MFRTE,
    output reg[31:0] MFRTM
    );

	always@(*) begin
		case(ForwardRSD) 
			3'b000 : MFRSD <= RF_RD1;
			3'b001 : MFRSD <= AO_M;
			3'b010 : MFRSD <= WD;
			3'b011 : MFRSD <= PC8_E;
			3'b100 : MFRSD <= PC8_M;
			3'b101 : MFRSD <= PC8_W;
			3'b110 : MFRSD <= MD_out;
			3'b111 : MFRSD <= MDO_M;
			default : MFRSD <= 0;
		endcase
		
		case(ForwardRTD) 
			0: MFRTD <= RF_RD2;
			1: MFRTD <= AO_M;
			2: MFRTD <= WD;
			3: MFRTD <= PC8_E;
			4: MFRTD <= PC8_M;
			5: MFRTD <= PC8_W;
			6: MFRTD <= MD_out;
			7: MFRTD <= MDO_M;
			default: MFRTD <= 0;
		endcase
		
		case(ForwardRSE) 
			0:MFRSE <= RS_E;
			1:MFRSE <= AO_M;
			2:MFRSE <= WD;
			3:MFRSE <= 0;
			4:MFRSE <= PC8_M;
			5:MFRSE <= PC8_W;
			6:MFRSE <= 0;
			7:MFRSE <= MDO_M;
			default:MFRSE <= 0;
		endcase
		
		case(ForwardRTE) 
			0:MFRTE <= RT_E;
			1:MFRTE <= AO_M;
			2:MFRTE <= WD;
			3:MFRTE <= 0;
			4:MFRTE <= PC8_M;
			5:MFRTE <= PC8_W;
			6:MFRTE <= 0;
			7:MFRTE <= MDO_M;
			default:MFRTE <= 0;
		endcase
		
		case(ForwardRTM) 
			0:MFRTM <= RT_M;
			1:MFRTM <= 0;
			2:MFRTM <= WD;
			3:MFRTM <= 0;
			4:MFRTM <= 0;
			5:MFRTM <= PC8_W;
			6:MFRTM <= 0;
			7:MFRTM <= 0;
			default:MFRTM <= 0;
		endcase
	end
endmodule
