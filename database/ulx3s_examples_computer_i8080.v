// ====================================================================
//                Bashkiria-2M FPGA REPLICA
//
//            Copyright (C) 2010 Dmitry Tselikov
//
// This core is distributed under modified BSD license. 
// For complete licensing information see LICENSE.TXT.
// -------------------------------------------------------------------- 
//
// An open implementation of Bashkiria-2M home computer
//
// Author: Dmitry Tselikov   http://bashkiria-2m.narod.ru/
// 
// Design File: k580wm80a.v
//
// Processor k580wm80a core design file of Bashkiria-2M replica.

module i8080(
	input clk,
	input ce,
	input reset,
	input intr,
	input [7:0] idata,
	output reg [15:0] addr,
	output reg sync,
	output rd,
	output reg wr_n,
	output inta_n,
	output reg [7:0] odata,
	output inte_o);

reg M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,M16,M17,T5;
reg[2:0] state;

wire M1n = M2|M3|M4|M5|M6|M7|M8|M9|M10|M11|M12|M13|M14|M15|M16|M17;

reg[15:0] PC;
reg[15:0] SP;
reg[7:0] B,C,D,E,H,L,A;
reg[7:0] W,Z,IR;
reg[9:0] ALU;
reg FS,FZ,FA,FP,FC,_FA;

reg rd_,intproc;
assign rd = rd_&~intproc;
assign inta_n = ~(rd_&intproc);
assign inte_o = inte[1];

reg[1:0] inte;
reg jmp,call,halt;
reg save_alu,save_a,save_r,save_rp,read_r,read_rp;
reg incdec,xthl,xchg,sphl,daa;
reg ccc;

always @(*) begin
	casex (IR[5:3])
	3'b00x: ALU = {1'b0,A,1'b1}+{1'b0,Z,FC&IR[3]};
	3'b01x: ALU = {1'b0,A,1'b0}-{1'b0,Z,FC&IR[3]};
	3'b100: ALU = {1'b0,A & Z,1'b0};
	3'b101: ALU = {1'b0,A ^ Z,1'b0};
	3'b110: ALU = {1'b0,A | Z,1'b0};
	3'b111: ALU = {1'b0,A,1'b0}-{1'b0,Z,1'b0};
	endcase
end

always @(*) begin
	casex (IR[5:3])
	3'b00x:  _FA = A[4]^Z[4]^ALU[5];
	3'b100:  _FA = A[3]|Z[3];
	3'b101:  _FA = 1'b0;
	3'b110:  _FA = 1'b0;
	default: _FA = ~(A[4]^Z[4]^ALU[5]);
	endcase
end

always @(*) begin
	// SZ.A.P.C
	case(idata[5:3])
	3'h0: ccc = ~FZ;
	3'h1: ccc = FZ;
	3'h2: ccc = ~FC;
	3'h3: ccc = FC;
	3'h4: ccc = ~FP;
	3'h5: ccc = FP;
	3'h6: ccc = ~FS;
	3'h7: ccc = FS;
	endcase
end

wire[7:0] F = {FS,FZ,1'b0,FA,1'b0,FP,1'b1,FC};
wire[7:0] Z1 = incdec ? Z+{{7{IR[0]}},1'b1} : Z;
wire[15:0] WZ1 = incdec ? {W,Z}+{{15{IR[3]}},1'b1} : {W,Z};
wire[3:0] daaZL = FA!=0 || A[3:0] > 4'h9 ? 4'h6 : 4'h0;
wire[3:0] daaZH = FC!=0 || A[7:4] > {3'b100, A[3:0]>4'h9 ? 1'b0 : 1'b1} ? 4'h6 : 4'h0;

always @(posedge clk or posedge reset)
begin
	if (reset) begin
		{M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,M16,M17} <= 0;
		state <= 0; PC <= 0; {FS,FZ,FA,FP,FC} <= 0; {addr,odata} <= 0;
		{sync,rd_,jmp,halt,inte,save_alu,save_a,save_r,save_rp,incdec,intproc} <= 0;
		wr_n <= 1'b1;
	end else if (ce) begin
		sync <= 0; rd_ <= 0; wr_n <= 1'b1;
		if (halt&~(M1|(intr&inte[1]))) begin
			sync <= 1'b1; // state: rd in m1 out hlt stk ~wr int
			odata <= 8'b10001010; // rd? hlt ~wr
		end else
		if (M1|~M1n) begin
			case (state)
			3'b000: begin
				halt <= 0; intproc <= intr&inte[1]; inte[1] <= inte[0];
				M1 <= 1'b1;
				sync <= 1'b1;
				odata <= {7'b1010001,intr&inte[1]}; // rd m1 ~wr
				addr <= jmp ? {W,Z} : PC;
				state <= 3'b001;
				if (intr&inte[1]) inte <= 2'b0;
				if (save_alu) begin
					FS <= ALU[8];
					FZ <= ~|ALU[8:1];
					FA <= _FA;
					FP <= ~^ALU[8:1];
					FC <= ALU[9]|(FC&daa);
					if (IR[5:3]!=3'b111) A <= ALU[8:1];
				end else
				if (save_a) begin
					A <= Z1;
				end else
				if (save_r) begin
					case (IR[5:3])
					3'b000: B <= Z1;
					3'b001: C <= Z1;
					3'b010: D <= Z1;
					3'b011: E <= Z1;
					3'b100: H <= Z1;
					3'b101: L <= Z1;
					3'b111: A <= Z1;
					endcase
					if (incdec) begin
						FS <= Z1[7];
						FZ <= ~|Z1;
						FA <= IR[0] ? Z1[3:0]!=4'b1111 : Z1[3:0]==0;
						FP <= ~^Z1;
					end
				end else
				if (save_rp) begin
					case (IR[5:4])
					2'b00: {B,C} <= WZ1;
					2'b01: {D,E} <= WZ1;
					2'b10: {H,L} <= WZ1;
					2'b11:
						if (sphl || !IR[7]) begin
							SP <= WZ1;
						end else begin
							{A,FS,FZ,FA,FP,FC} <= {WZ1[15:8],WZ1[7],WZ1[6],WZ1[4],WZ1[2],WZ1[0]};
						end
					endcase
				end
			end
			3'b001: begin
				rd_ <= 1'b1;
				PC <= addr+{15'b0,~intproc};
				state <= 3'b010;
			end
			3'b010: begin
				IR <= idata;
				{jmp,call,save_alu,save_a,save_r,save_rp,read_r,read_rp,incdec,xthl,xchg,sphl,T5,daa} <= 0;
				casex (idata)
				8'b00xx0001: {save_rp,M2,M3} <= 3'b111;
				8'b00xx1001: {read_rp,M16,M17} <= 3'b111;
				8'b000x0010: {read_rp,M14} <= 2'b11;
				8'b00100010: {M2,M3,M14,M15} <= 4'b1111;
				8'b00110010: {M2,M3,M14} <= 3'b111;
				8'b000x1010: {read_rp,save_a,M12} <= 3'b111;
				8'b00101010: {save_rp,M2,M3,M12,M13} <= 5'b11111;
				8'b00111010: {save_a,M2,M3,M12} <= 4'b1111;
				8'b00xxx011: {read_rp,save_rp,incdec,T5} <= 4'b1111;
				8'b00xxx10x: {read_r,save_r,incdec,T5} <= {3'b111,idata[5:3]!=3'b110};
				8'b00xxx110: {save_r,M2} <= 2'b11;
				8'b00000111: {FC,A} <= {A,A[7]};
				8'b00001111: {A,FC} <= {A[0],A};
				8'b00010111: {FC,A} <= {A,FC};
				8'b00011111: {A,FC} <= {FC,A};
				8'b00100111: {daa,save_alu,IR[5:3],Z} <= {5'b11000,daaZH,daaZL};
				8'b00101111: A <= ~A;
				8'b00110111: FC <= 1'b1;
				8'b00111111: FC <= ~FC;
				8'b01xxxxxx: if (idata[5:0]==6'b110110) halt <= 1'b1; else {read_r,save_r,T5} <= {2'b11,~(idata[5:3]==3'b110||idata[2:0]==3'b110)};
				8'b10xxxxxx: {read_r,save_alu} <= 2'b11;
				8'b11xxx000: {jmp,M8,M9} <= {3{ccc}};
				8'b11xx0001: {save_rp,M8,M9} <= 3'b111;
				8'b110x1001: {jmp,M8,M9} <= 3'b111;
				8'b11101001: {read_rp,jmp,T5} <= 3'b111;
				8'b11111001: {read_rp,save_rp,T5,sphl} <= 4'b1111;
				8'b11xxx010: {jmp,M2,M3} <= {ccc,2'b11};
				8'b1100x011: {jmp,M2,M3} <= 3'b111;
				8'b11010011: {M2,M7} <= 2'b11;
				8'b11011011: {M2,M6} <= 2'b11;
				8'b11100011: {save_rp,M8,M9,M10,M11,xthl} <= 6'b111111;
				8'b11101011: {read_rp,save_rp,xchg} <= 3'b111;
				8'b1111x011: inte <= idata[3] ? 2'b1 : 2'b0;
				8'b11xxx100: {jmp,M2,M3,T5,M10,M11,call} <= {ccc,3'b111,{3{ccc}}};
				8'b11xx0101: {read_rp,T5,M10,M11} <= 4'b1111;
				8'b11xx1101: {jmp,M2,M3,T5,M10,M11,call} <= 7'b1111111;
				8'b11xxx110: {save_alu,M2} <= 2'b11;
				8'b11xxx111: {jmp,T5,M10,M11,call,W,Z} <= {5'b11111,10'b0,idata[5:3],3'b0};
				endcase
				state <= 3'b011;
			end
			3'b011: begin
				if (read_rp) begin
					case (IR[5:4])
					2'b00: {W,Z} <= {B,C};
					2'b01: {W,Z} <= {D,E};
					2'b10: {W,Z} <= xchg ? {D,E} : {H,L};
					2'b11: {W,Z} <= sphl ? {H,L} : IR[7] ? {A,F} : SP;
					endcase
					if (xchg) {D,E} <= {H,L};
				end else
				if (~(jmp|daa)) begin
					case (incdec?IR[5:3]:IR[2:0])
					3'b000: Z <= B;
					3'b001: Z <= C;
					3'b010: Z <= D;
					3'b011: Z <= E;
					3'b100: Z <= H;
					3'b101: Z <= L;
					3'b110: M4 <= read_r;
					3'b111: Z <= A;
					endcase
					M5 <= save_r && IR[5:3]==3'b110;
				end
				state <= T5 ? 3'b100 : 0;
				M1 <= T5;
			end
			3'b100: begin
				if (M10) SP <= SP-16'b1;
				state <= 0;
				M1 <= 0;
			end
			endcase
		end else
		if (M2 || M3) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b1000001,intproc}; // rd ~wr
				addr <= PC;
				state <= 3'b001;
			end
			3'b001: begin
				rd_ <= 1'b1;
				PC <= addr+{15'b0,~intproc};
				state <= 3'b010;
			end
			3'b010: begin
				if (M2) begin
					Z <= idata;
					M2 <= 0;
				end else begin
					W <= idata;
					M3 <= 0;
				end
				state <= 3'b000;
			end
			endcase
		end else
		if (M4) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b1000001,intproc}; // rd ~wr
				addr <= {H,L};
				state <= 3'b001;
			end
			3'b001: begin
				rd_ <= 1'b1;
				state <= 3'b010;
			end
			3'b010: begin
				Z <= idata;
				M4 <= 0;
				state <= 3'b000;
			end
			endcase
		end else
		if (M5) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b0000000,intproc}; // ~wr=0
				addr <= {H,L};
				state <= 3'b001;
			end
			3'b001: begin
				odata <= Z1;
				wr_n <= 1'b0;
				state <= 3'b010;
			end
			3'b010: begin
				M5 <= 0;
				state <= 3'b000;
			end
			endcase
		end else
		if (M6) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b0100001,intproc}; // in ~wr
				addr <= {Z,Z};
				state <= 3'b001;
			end
			3'b001: begin
				rd_ <= 1'b1;
				state <= 3'b010;
			end
			3'b010: begin
				A <= idata;
				M6 <= 0;
				state <= 3'b000;
			end
			endcase
		end else
		if (M7) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b0001000,intproc}; // out
				addr <= {Z,Z};
				state <= 3'b001;
			end
			3'b001: begin
				odata <= A;
				wr_n <= 1'b0;
				state <= 3'b010;
			end
			3'b010: begin
				M7 <= 0;
				state <= 3'b000;
			end
			endcase
		end else
		if (M8 || M9) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b1000011,intproc}; // rd stk ~wr
				addr <= SP;
				state <= 3'b001;
			end
			3'b001: begin
				rd_ <= 1'b1;
				if (M8 || !xthl) SP <= SP+16'b1;
				state <= 3'b010;
			end
			3'b010: begin
				if (M8) begin
					Z <= idata;
					M8 <= 0;
				end else begin
					W <= idata;
					M9 <= 0;
				end
				state <= 3'b000;
			end
			endcase
		end else
		if (M10 || M11) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b0000010,intproc}; // stk
				addr <= SP;
				state <= 3'b001;
			end
			3'b001: begin
				if (M10) begin
					SP <= SP-16'b1;
					odata <= xthl ? H : call ? PC[15:8] : W;
				end else begin
					odata <= xthl ? L : call ? PC[7:0] : Z;
				end
				wr_n <= 1'b0;
				state <= 3'b010;
			end
			3'b010: begin
				if (M10) begin
					M10 <= 0;
				end else begin
					M11 <= 0;
				end
				state <= 3'b000;
			end
			endcase
		end else
		if (M12 || M13) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b1000001,intproc}; // rd ~wr
				addr <= M12 ? {W,Z} : addr+16'b1;
				state <= 3'b001;
			end
			3'b001: begin
				rd_ <= 1'b1;
				state <= 3'b010;
			end
			3'b010: begin
				if (M12) begin
					Z <= idata;
					M12 <= 0;
				end else begin
					W <= idata;
					M13 <= 0;
				end
				state <= 3'b000;
			end
			endcase
		end else
		if (M14 || M15) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b0000000,intproc}; // ~wr=0
				addr <= M14 ? {W,Z} : addr+16'b1;
				state <= 3'b001;
			end
			3'b001: begin
				if (M14) begin
					odata <= M15 ? L : A;
				end else begin
					odata <= H;
				end
				wr_n <= 1'b0;
				state <= 3'b010;
			end
			3'b010: begin
				if (M14) begin
					M14 <= 0;
				end else begin
					M15 <= 0;
				end
				state <= 3'b000;
			end
			endcase
		end else
		if (M16 || M17) begin
			case (state)
			3'b000: begin
				sync <= 1'b1;
				odata <= {7'b0000001,intproc}; // ~wr
				state <= 3'b001;
			end
			3'b001: begin
				state <= 3'b010;
			end
			3'b010: begin
				if (M16) begin
					M16 <= 0;
				end else begin
					{FC,H,L} <= {1'b0,H,L}+{1'b0,W,Z};
					M17 <= 0;
				end
				state <= 3'b000;
			end
			endcase
		end
	end
end

endmodule
