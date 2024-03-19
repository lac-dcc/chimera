module pla_lined (
	movEa,
	col,
	opcode,
	lineBmap,
	palIll,
	plaA1,
	plaA2,
	plaA3
);
	input [3:0] movEa;
	input [3:0] col;
	input [15:0] opcode;
	input [15:0] lineBmap;
	output palIll;
	output wire [9:0] plaA1;
	output wire [9:0] plaA2;
	output wire [9:0] plaA3;
	wire [3:0] line = opcode[15:12];
	wire [2:0] row86 = opcode[8:6];
	reg [15:0] arIll;
	reg [9:0] arA1 [15:0];
	reg [9:0] arA23 [15:0];
	reg [9:0] scA3;
	reg illMisc;
	reg [9:0] a1Misc;
	assign palIll = |(arIll & lineBmap);
	assign plaA1 = arA1[line];
	assign plaA2 = arA23[line];
	assign plaA3 = (lineBmap[0] ? scA3 : arA23[line]);
	always @(*) begin
		arIll['h6] = 1'b0;
		arA23['h6] = 'sdX;
		if (opcode[11:8] == 4'h1)
			arA1['h6] = (|opcode[7:0] ? 'h089 : 'h0A9);
		else
			arA1['h6] = (|opcode[7:0] ? 'h308 : 'h068);
		arIll['h7] = opcode[8];
		arA23['h7] = 'sdX;
		arA1['h7] = 'h23B;
		arIll['ha] = 1'b1;
		arIll['hf] = 1'b1;
		arA1['ha] = 'sdX;
		arA1['hf] = 'sdX;
		arA23['ha] = 'sdX;
		arA23['hf] = 'sdX;
	end
	always @(*)
		if ((~opcode[11] & opcode[7]) & opcode[6]) begin
			arA23['he] = 'h3C7;
			case (col)
				2: begin
					arIll['he] = 1'b0;
					arA1['he] = 'h006;
				end
				3: begin
					arIll['he] = 1'b0;
					arA1['he] = 'h21C;
				end
				4: begin
					arIll['he] = 1'b0;
					arA1['he] = 'h103;
				end
				5: begin
					arIll['he] = 1'b0;
					arA1['he] = 'h1C2;
				end
				6: begin
					arIll['he] = 1'b0;
					arA1['he] = 'h1E3;
				end
				7: begin
					arIll['he] = 1'b0;
					arA1['he] = 'h00A;
				end
				8: begin
					arIll['he] = 1'b0;
					arA1['he] = 'h1E2;
				end
				default: begin
					arIll['he] = 1'b1;
					arA1['he] = 'sdX;
				end
			endcase
		end
		else begin
			arA23['he] = 'sdX;
			case (opcode[7:6])
				2'b00, 2'b01: begin
					arIll['he] = 1'b0;
					arA1['he] = (opcode[5] ? 'h382 : 'h381);
				end
				2'b10: begin
					arIll['he] = 1'b0;
					arA1['he] = (opcode[5] ? 'h386 : 'h385);
				end
				2'b11: begin
					arIll['he] = 1'b1;
					arA1['he] = 'sdX;
				end
			endcase
		end
	always @(*) begin
		illMisc = 1'b0;
		case (opcode[5:3])
			3'b000, 3'b001: a1Misc = 'h1D0;
			3'b010: a1Misc = 'h30B;
			3'b011: a1Misc = 'h119;
			3'b100: a1Misc = 'h2F5;
			3'b101: a1Misc = 'h230;
			3'b110:
				case (opcode[2:0])
					3'b110: a1Misc = 'h06D;
					3'b000: a1Misc = 'h3A6;
					3'b001: a1Misc = 'h363;
					3'b010: a1Misc = 'h3A2;
					3'b011: a1Misc = 'h12A;
					3'b111: a1Misc = 'h12A;
					3'b101: a1Misc = 'h126;
					default: begin
						illMisc = 1'b1;
						a1Misc = 'sdX;
					end
				endcase
			default: begin
				illMisc = 1'b1;
				a1Misc = 'sdX;
			end
		endcase
	end
	always @(*)
		if ((opcode[11:6] & 'h1F) == 'h8)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h100;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h299;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h299;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h299;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h299;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h299;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h299;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h299;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1CC;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h37) == 'h0)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h100;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h299;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h299;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h299;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h299;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h299;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h299;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h299;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1CC;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h1F) == 'h9)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h100;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h299;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h299;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h299;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h299;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h299;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h299;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h299;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1CC;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h37) == 'h1)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h100;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h299;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h299;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h299;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h299;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h299;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h299;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h299;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1CC;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h1F) == 'hA)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h10C;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00B;
					scA3 = 'h29D;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00F;
					scA3 = 'h29D;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h179;
					scA3 = 'h29D;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1C6;
					scA3 = 'h29D;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1E7;
					scA3 = 'h29D;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00E;
					scA3 = 'h29D;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1E6;
					scA3 = 'h29D;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h37) == 'h2)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h10C;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00B;
					scA3 = 'h29D;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00F;
					scA3 = 'h29D;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h179;
					scA3 = 'h29D;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1C6;
					scA3 = 'h29D;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1E7;
					scA3 = 'h29D;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00E;
					scA3 = 'h29D;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1E6;
					scA3 = 'h29D;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h37) == 'h10)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h100;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h299;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h299;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h299;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h299;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h299;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h299;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h299;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h37) == 'h11)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h100;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h299;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h299;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h299;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h299;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h299;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h299;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h299;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h37) == 'h12)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h10C;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00B;
					scA3 = 'h29D;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00F;
					scA3 = 'h29D;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h179;
					scA3 = 'h29D;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1C6;
					scA3 = 'h29D;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1E7;
					scA3 = 'h29D;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00E;
					scA3 = 'h29D;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1E6;
					scA3 = 'h29D;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h7) == 'h4)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E7;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1D2;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h006;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h21C;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h103;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1C2;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E3;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h00A;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E2;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				9: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1C2;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				10: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E3;
					arA23['h0] = 'sdX;
					scA3 = 'h215;
				end
				11: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h0EA;
					arA23['h0] = 'h0AB;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h7) == 'h5)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3EF;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1D6;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h006;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h21C;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h103;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1C2;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E3;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h00A;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E2;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h7) == 'h7)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3EF;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1CE;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h006;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h21C;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h103;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1C2;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E3;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h00A;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E2;
					arA23['h0] = 'sdX;
					scA3 = 'h081;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h7) == 'h6)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3EB;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1CA;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h006;
					arA23['h0] = 'sdX;
					scA3 = 'h069;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h21C;
					arA23['h0] = 'sdX;
					scA3 = 'h069;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h103;
					arA23['h0] = 'sdX;
					scA3 = 'h069;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1C2;
					arA23['h0] = 'sdX;
					scA3 = 'h069;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E3;
					arA23['h0] = 'sdX;
					scA3 = 'h069;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h00A;
					arA23['h0] = 'sdX;
					scA3 = 'h069;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h1E2;
					arA23['h0] = 'sdX;
					scA3 = 'h069;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h20)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h3E7;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h215;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h215;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h215;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h215;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h215;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h215;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h215;
				end
				9: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h215;
				end
				10: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h215;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h21)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h3EF;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h081;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h081;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h081;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h081;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h081;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h081;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h081;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h23)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h3EF;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h081;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h081;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h081;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h081;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h081;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h081;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h081;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h22)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h3EB;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h069;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h069;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h069;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h069;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h069;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h069;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h069;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h30)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h108;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h087;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h087;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h087;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h087;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h087;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h087;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h087;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h31)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h108;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h006;
					scA3 = 'h087;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h21C;
					scA3 = 'h087;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h103;
					scA3 = 'h087;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1C2;
					scA3 = 'h087;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E3;
					scA3 = 'h087;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h00A;
					scA3 = 'h087;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h2B9;
					arA23['h0] = 'h1E2;
					scA3 = 'h087;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h32)
			case (col)
				0: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h104;
					scA3 = 'sdX;
				end
				1: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				2: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00B;
					scA3 = 'h08F;
				end
				3: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00F;
					scA3 = 'h08F;
				end
				4: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h179;
					scA3 = 'h08F;
				end
				5: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1C6;
					scA3 = 'h08F;
				end
				6: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1E7;
					scA3 = 'h08F;
				end
				7: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h00E;
					scA3 = 'h08F;
				end
				8: begin
					arIll['h0] = 1'b0;
					arA1['h0] = 'h3E0;
					arA23['h0] = 'h1E6;
					scA3 = 'h08F;
				end
				9: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				10: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				11: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
				default: begin
					arIll['h0] = 1'b1;
					arA1['h0] = 'sdX;
					arA23['h0] = 'sdX;
					scA3 = 'sdX;
				end
			endcase
		else begin
			arIll['h0] = 1'b1;
			arA1['h0] = 'sdX;
			arA23['h0] = 'sdX;
			scA3 = 'sdX;
		end
	always @(*)
		if ((opcode[11:6] & 'h27) == 'h0)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h133;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h2B8;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h2B8;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h2B8;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h2B8;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h2B8;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h2B8;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h2B8;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h27) == 'h1)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h133;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h2B8;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h2B8;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h2B8;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h2B8;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h2B8;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h2B8;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h2B8;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h27) == 'h2)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h137;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00B;
					arA23['h4] = 'h2BC;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00F;
					arA23['h4] = 'h2BC;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h179;
					arA23['h4] = 'h2BC;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C6;
					arA23['h4] = 'h2BC;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E7;
					arA23['h4] = 'h2BC;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00E;
					arA23['h4] = 'h2BC;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E6;
					arA23['h4] = 'h2BC;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h3)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h3A5;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h3A1;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h3A1;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h3A1;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h3A1;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h3A1;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h3A1;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h3A1;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h13)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h301;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h159;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h159;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h159;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h159;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h159;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h159;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h159;
				end
				9: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h159;
				end
				10: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h159;
				end
				11: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h0EA;
					arA23['h4] = 'h301;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h1B)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h301;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h159;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h159;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h159;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h159;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h159;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h159;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h159;
				end
				9: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h159;
				end
				10: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h159;
				end
				11: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h0EA;
					arA23['h4] = 'h301;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h20)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h13B;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h15C;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h15C;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h15C;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h15C;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h15C;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h15C;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h15C;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h21)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h341;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h17C;
					arA23['h4] = 'sdX;
				end
				3: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				4: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h17D;
					arA23['h4] = 'sdX;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1FF;
					arA23['h4] = 'sdX;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h178;
					arA23['h4] = 'sdX;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1FA;
					arA23['h4] = 'sdX;
				end
				9: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h17D;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1FF;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h22)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h133;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h3A0;
					arA23['h4] = 'sdX;
				end
				3: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h3A4;
					arA23['h4] = 'sdX;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F1;
					arA23['h4] = 'sdX;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h325;
					arA23['h4] = 'sdX;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1ED;
					arA23['h4] = 'sdX;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E5;
					arA23['h4] = 'sdX;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h23)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h232;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h3A0;
					arA23['h4] = 'sdX;
				end
				3: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h3A4;
					arA23['h4] = 'sdX;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F1;
					arA23['h4] = 'sdX;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h325;
					arA23['h4] = 'sdX;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1ED;
					arA23['h4] = 'sdX;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E5;
					arA23['h4] = 'sdX;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h28)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h12D;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h3C3;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h3C3;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h3C3;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h3C3;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h3C3;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h3C3;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h3C3;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h29)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h12D;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h3C3;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h3C3;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h3C3;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h3C3;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h3C3;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h3C3;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h3C3;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h2A)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h125;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00B;
					arA23['h4] = 'h3CB;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00F;
					arA23['h4] = 'h3CB;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h179;
					arA23['h4] = 'h3CB;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C6;
					arA23['h4] = 'h3CB;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E7;
					arA23['h4] = 'h3CB;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00E;
					arA23['h4] = 'h3CB;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E6;
					arA23['h4] = 'h3CB;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h2B)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h345;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h343;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h343;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h343;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h343;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h343;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h343;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h343;
				end
				9: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h3E) == 'h32)
			case (col)
				0: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h127;
					arA23['h4] = 'sdX;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h123;
					arA23['h4] = 'sdX;
				end
				4: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1FD;
					arA23['h4] = 'sdX;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F5;
					arA23['h4] = 'sdX;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F9;
					arA23['h4] = 'sdX;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E9;
					arA23['h4] = 'sdX;
				end
				9: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1FD;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F5;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h7) == 'h6)
			case (col)
				0: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h152;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h006;
					arA23['h4] = 'h151;
				end
				3: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h21C;
					arA23['h4] = 'h151;
				end
				4: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h103;
					arA23['h4] = 'h151;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h151;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h151;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h00A;
					arA23['h4] = 'h151;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E2;
					arA23['h4] = 'h151;
				end
				9: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1C2;
					arA23['h4] = 'h151;
				end
				10: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1E3;
					arA23['h4] = 'h151;
				end
				11: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h0EA;
					arA23['h4] = 'h152;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if ((opcode[11:6] & 'h7) == 'h7)
			case (col)
				0: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h2F1;
					arA23['h4] = 'sdX;
				end
				3: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				4: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h2F2;
					arA23['h4] = 'sdX;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1FB;
					arA23['h4] = 'sdX;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h275;
					arA23['h4] = 'sdX;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h3E4;
					arA23['h4] = 'sdX;
				end
				9: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h2F2;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1FB;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h3A)
			case (col)
				0: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h273;
					arA23['h4] = 'sdX;
				end
				3: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				4: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h2B0;
					arA23['h4] = 'sdX;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F3;
					arA23['h4] = 'sdX;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h293;
					arA23['h4] = 'sdX;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F2;
					arA23['h4] = 'sdX;
				end
				9: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h2B0;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F3;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h3B)
			case (col)
				0: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				1: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				2: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h255;
					arA23['h4] = 'sdX;
				end
				3: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				4: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				5: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h2B4;
					arA23['h4] = 'sdX;
				end
				6: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F7;
					arA23['h4] = 'sdX;
				end
				7: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h297;
					arA23['h4] = 'sdX;
				end
				8: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F6;
					arA23['h4] = 'sdX;
				end
				9: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h2B4;
					arA23['h4] = 'sdX;
				end
				10: begin
					arIll['h4] = 1'b0;
					arA1['h4] = 'h1F7;
					arA23['h4] = 'sdX;
				end
				11: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
				default: begin
					arIll['h4] = 1'b1;
					arA1['h4] = 'sdX;
					arA23['h4] = 'sdX;
				end
			endcase
		else if (opcode[11:6] == 'h39) begin
			arIll['h4] = illMisc;
			arA1['h4] = a1Misc;
			arA23['h4] = 'sdX;
		end
		else begin
			arIll['h4] = 1'b1;
			arA1['h4] = 'sdX;
			arA23['h4] = 'sdX;
		end
	always @(*) begin
		case (movEa)
			0:
				case (col)
					0: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h121;
						arA23['h1] = 'sdX;
					end
					1: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
					2: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h006;
						arA23['h1] = 'h29B;
					end
					3: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h21C;
						arA23['h1] = 'h29B;
					end
					4: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h103;
						arA23['h1] = 'h29B;
					end
					5: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h29B;
					end
					6: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h29B;
					end
					7: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h00A;
						arA23['h1] = 'h29B;
					end
					8: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E2;
						arA23['h1] = 'h29B;
					end
					9: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h29B;
					end
					10: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h29B;
					end
					11: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h0EA;
						arA23['h1] = 'h121;
					end
					default: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
				endcase
			2:
				case (col)
					0: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h2FA;
						arA23['h1] = 'sdX;
					end
					1: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
					2: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h006;
						arA23['h1] = 'h3AB;
					end
					3: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h21C;
						arA23['h1] = 'h3AB;
					end
					4: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h103;
						arA23['h1] = 'h3AB;
					end
					5: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h3AB;
					end
					6: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h3AB;
					end
					7: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h00A;
						arA23['h1] = 'h3AB;
					end
					8: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E2;
						arA23['h1] = 'h3AB;
					end
					9: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h3AB;
					end
					10: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h3AB;
					end
					11: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h0EA;
						arA23['h1] = 'h2FA;
					end
					default: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
				endcase
			3:
				case (col)
					0: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h2FE;
						arA23['h1] = 'sdX;
					end
					1: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
					2: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h006;
						arA23['h1] = 'h3AF;
					end
					3: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h21C;
						arA23['h1] = 'h3AF;
					end
					4: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h103;
						arA23['h1] = 'h3AF;
					end
					5: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h3AF;
					end
					6: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h3AF;
					end
					7: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h00A;
						arA23['h1] = 'h3AF;
					end
					8: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E2;
						arA23['h1] = 'h3AF;
					end
					9: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h3AF;
					end
					10: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h3AF;
					end
					11: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h0EA;
						arA23['h1] = 'h2FE;
					end
					default: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
				endcase
			4:
				case (col)
					0: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h2F8;
						arA23['h1] = 'sdX;
					end
					1: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
					2: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h006;
						arA23['h1] = 'h38B;
					end
					3: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h21C;
						arA23['h1] = 'h38B;
					end
					4: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h103;
						arA23['h1] = 'h38B;
					end
					5: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h38B;
					end
					6: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h38B;
					end
					7: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h00A;
						arA23['h1] = 'h38B;
					end
					8: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E2;
						arA23['h1] = 'h38B;
					end
					9: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h38B;
					end
					10: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h38B;
					end
					11: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h0EA;
						arA23['h1] = 'h2F8;
					end
					default: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
				endcase
			5:
				case (col)
					0: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h2DA;
						arA23['h1] = 'sdX;
					end
					1: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
					2: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h006;
						arA23['h1] = 'h38A;
					end
					3: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h21C;
						arA23['h1] = 'h38A;
					end
					4: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h103;
						arA23['h1] = 'h38A;
					end
					5: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h38A;
					end
					6: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h38A;
					end
					7: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h00A;
						arA23['h1] = 'h38A;
					end
					8: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E2;
						arA23['h1] = 'h38A;
					end
					9: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h38A;
					end
					10: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h38A;
					end
					11: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h0EA;
						arA23['h1] = 'h2DA;
					end
					default: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
				endcase
			6:
				case (col)
					0: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1EB;
						arA23['h1] = 'sdX;
					end
					1: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
					2: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h006;
						arA23['h1] = 'h298;
					end
					3: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h21C;
						arA23['h1] = 'h298;
					end
					4: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h103;
						arA23['h1] = 'h298;
					end
					5: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h298;
					end
					6: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h298;
					end
					7: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h00A;
						arA23['h1] = 'h298;
					end
					8: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E2;
						arA23['h1] = 'h298;
					end
					9: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h298;
					end
					10: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h298;
					end
					11: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h0EA;
						arA23['h1] = 'h1EB;
					end
					default: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
				endcase
			7:
				case (col)
					0: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h2D9;
						arA23['h1] = 'sdX;
					end
					1: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
					2: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h006;
						arA23['h1] = 'h388;
					end
					3: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h21C;
						arA23['h1] = 'h388;
					end
					4: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h103;
						arA23['h1] = 'h388;
					end
					5: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h388;
					end
					6: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h388;
					end
					7: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h00A;
						arA23['h1] = 'h388;
					end
					8: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E2;
						arA23['h1] = 'h388;
					end
					9: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h388;
					end
					10: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h388;
					end
					11: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h0EA;
						arA23['h1] = 'h2D9;
					end
					default: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
				endcase
			8:
				case (col)
					0: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1EA;
						arA23['h1] = 'sdX;
					end
					1: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
					2: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h006;
						arA23['h1] = 'h32B;
					end
					3: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h21C;
						arA23['h1] = 'h32B;
					end
					4: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h103;
						arA23['h1] = 'h32B;
					end
					5: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h32B;
					end
					6: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h32B;
					end
					7: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h00A;
						arA23['h1] = 'h32B;
					end
					8: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E2;
						arA23['h1] = 'h32B;
					end
					9: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1C2;
						arA23['h1] = 'h32B;
					end
					10: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h1E3;
						arA23['h1] = 'h32B;
					end
					11: begin
						arIll['h1] = 1'b0;
						arA1['h1] = 'h0EA;
						arA23['h1] = 'h1EA;
					end
					default: begin
						arIll['h1] = 1'b1;
						arA1['h1] = 'sdX;
						arA23['h1] = 'sdX;
					end
				endcase
			default: begin
				arIll['h1] = 1'b1;
				arA1['h1] = 'sdX;
				arA23['h1] = 'sdX;
			end
		endcase
		case (movEa)
			0:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h129;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h129;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h29F;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h29F;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h29F;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h29F;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h29F;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h29F;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h29F;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h29F;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h29F;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h129;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			1:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h129;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h129;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h29F;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h29F;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h29F;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h29F;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h29F;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h29F;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h29F;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h29F;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h29F;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h129;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			2:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2F9;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2F9;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h3A9;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h3A9;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h3A9;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h3A9;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h3A9;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h3A9;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h3A9;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h3A9;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h3A9;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h2F9;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			3:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2FD;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2FD;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h3AD;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h3AD;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h3AD;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h3AD;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h3AD;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h3AD;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h3AD;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h3AD;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h3AD;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h2FD;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			4:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2FC;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2FC;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h38F;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h38F;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h38F;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h38F;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h38F;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h38F;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h38F;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h38F;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h38F;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h2FC;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			5:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2DE;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2DE;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h38E;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h38E;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h38E;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h38E;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h38E;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h38E;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h38E;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h38E;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h38E;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h2DE;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			6:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1EF;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1EF;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h29C;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h29C;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h29C;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h29C;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h29C;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h29C;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h29C;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h29C;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h29C;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h1EF;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			7:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2DD;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h2DD;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h38C;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h38C;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h38C;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h38C;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h38C;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h38C;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h38C;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h38C;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h38C;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h2DD;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			8:
				case (col)
					0: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1EE;
						arA23['h2] = 'sdX;
					end
					1: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1EE;
						arA23['h2] = 'sdX;
					end
					2: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00B;
						arA23['h2] = 'h30F;
					end
					3: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00F;
						arA23['h2] = 'h30F;
					end
					4: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h179;
						arA23['h2] = 'h30F;
					end
					5: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h30F;
					end
					6: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h30F;
					end
					7: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h00E;
						arA23['h2] = 'h30F;
					end
					8: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E6;
						arA23['h2] = 'h30F;
					end
					9: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1C6;
						arA23['h2] = 'h30F;
					end
					10: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h1E7;
						arA23['h2] = 'h30F;
					end
					11: begin
						arIll['h2] = 1'b0;
						arA1['h2] = 'h0A7;
						arA23['h2] = 'h1EE;
					end
					default: begin
						arIll['h2] = 1'b1;
						arA1['h2] = 'sdX;
						arA23['h2] = 'sdX;
					end
				endcase
			default: begin
				arIll['h2] = 1'b1;
				arA1['h2] = 'sdX;
				arA23['h2] = 'sdX;
			end
		endcase
		case (movEa)
			0:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h121;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h121;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h29B;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h29B;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h29B;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h29B;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h29B;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h29B;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h29B;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h29B;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h29B;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h121;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			1:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h279;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h279;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h158;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h158;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h158;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h158;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h158;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h158;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h158;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h158;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h158;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h279;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			2:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2FA;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2FA;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h3AB;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h3AB;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h3AB;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h3AB;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h3AB;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h3AB;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h3AB;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h3AB;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h3AB;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h2FA;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			3:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2FE;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2FE;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h3AF;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h3AF;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h3AF;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h3AF;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h3AF;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h3AF;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h3AF;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h3AF;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h3AF;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h2FE;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			4:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2F8;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2F8;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h38B;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h38B;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h38B;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h38B;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h38B;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h38B;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h38B;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h38B;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h38B;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h2F8;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			5:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2DA;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2DA;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h38A;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h38A;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h38A;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h38A;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h38A;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h38A;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h38A;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h38A;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h38A;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h2DA;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			6:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1EB;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1EB;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h298;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h298;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h298;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h298;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h298;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h298;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h298;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h298;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h298;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h1EB;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			7:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2D9;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h2D9;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h388;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h388;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h388;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h388;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h388;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h388;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h388;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h388;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h388;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h2D9;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			8:
				case (col)
					0: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1EA;
						arA23['h3] = 'sdX;
					end
					1: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1EA;
						arA23['h3] = 'sdX;
					end
					2: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h006;
						arA23['h3] = 'h32B;
					end
					3: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h21C;
						arA23['h3] = 'h32B;
					end
					4: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h103;
						arA23['h3] = 'h32B;
					end
					5: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h32B;
					end
					6: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h32B;
					end
					7: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h00A;
						arA23['h3] = 'h32B;
					end
					8: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E2;
						arA23['h3] = 'h32B;
					end
					9: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1C2;
						arA23['h3] = 'h32B;
					end
					10: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h1E3;
						arA23['h3] = 'h32B;
					end
					11: begin
						arIll['h3] = 1'b0;
						arA1['h3] = 'h0EA;
						arA23['h3] = 'h1EA;
					end
					default: begin
						arIll['h3] = 1'b1;
						arA1['h3] = 'sdX;
						arA23['h3] = 'sdX;
					end
				endcase
			default: begin
				arIll['h3] = 1'b1;
				arA1['h3] = 'sdX;
				arA23['h3] = 'sdX;
			end
		endcase
		case (row86)
			3'b000:
				case (col)
					0: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2D8;
						arA23['h5] = 'sdX;
					end
					1: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
					2: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h006;
						arA23['h5] = 'h2F3;
					end
					3: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h21C;
						arA23['h5] = 'h2F3;
					end
					4: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h103;
						arA23['h5] = 'h2F3;
					end
					5: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1C2;
						arA23['h5] = 'h2F3;
					end
					6: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E3;
						arA23['h5] = 'h2F3;
					end
					7: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00A;
						arA23['h5] = 'h2F3;
					end
					8: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E2;
						arA23['h5] = 'h2F3;
					end
					default: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
				endcase
			3'b001:
				case (col)
					0: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2D8;
						arA23['h5] = 'sdX;
					end
					1: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2DC;
						arA23['h5] = 'sdX;
					end
					2: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h006;
						arA23['h5] = 'h2F3;
					end
					3: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h21C;
						arA23['h5] = 'h2F3;
					end
					4: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h103;
						arA23['h5] = 'h2F3;
					end
					5: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1C2;
						arA23['h5] = 'h2F3;
					end
					6: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E3;
						arA23['h5] = 'h2F3;
					end
					7: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00A;
						arA23['h5] = 'h2F3;
					end
					8: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E2;
						arA23['h5] = 'h2F3;
					end
					default: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
				endcase
			3'b010:
				case (col)
					0: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2DC;
						arA23['h5] = 'sdX;
					end
					1: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2DC;
						arA23['h5] = 'sdX;
					end
					2: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00B;
						arA23['h5] = 'h2F7;
					end
					3: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00F;
						arA23['h5] = 'h2F7;
					end
					4: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h179;
						arA23['h5] = 'h2F7;
					end
					5: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1C6;
						arA23['h5] = 'h2F7;
					end
					6: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E7;
						arA23['h5] = 'h2F7;
					end
					7: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00E;
						arA23['h5] = 'h2F7;
					end
					8: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E6;
						arA23['h5] = 'h2F7;
					end
					default: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
				endcase
			3'b011:
				case (col)
					0: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h384;
						arA23['h5] = 'sdX;
					end
					1: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h06C;
						arA23['h5] = 'sdX;
					end
					2: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h006;
						arA23['h5] = 'h380;
					end
					3: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h21C;
						arA23['h5] = 'h380;
					end
					4: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h103;
						arA23['h5] = 'h380;
					end
					5: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1C2;
						arA23['h5] = 'h380;
					end
					6: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E3;
						arA23['h5] = 'h380;
					end
					7: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00A;
						arA23['h5] = 'h380;
					end
					8: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E2;
						arA23['h5] = 'h380;
					end
					default: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
				endcase
			3'b100:
				case (col)
					0: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2D8;
						arA23['h5] = 'sdX;
					end
					1: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
					2: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h006;
						arA23['h5] = 'h2F3;
					end
					3: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h21C;
						arA23['h5] = 'h2F3;
					end
					4: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h103;
						arA23['h5] = 'h2F3;
					end
					5: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1C2;
						arA23['h5] = 'h2F3;
					end
					6: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E3;
						arA23['h5] = 'h2F3;
					end
					7: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00A;
						arA23['h5] = 'h2F3;
					end
					8: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E2;
						arA23['h5] = 'h2F3;
					end
					default: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
				endcase
			3'b101:
				case (col)
					0: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2D8;
						arA23['h5] = 'sdX;
					end
					1: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2DC;
						arA23['h5] = 'sdX;
					end
					2: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h006;
						arA23['h5] = 'h2F3;
					end
					3: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h21C;
						arA23['h5] = 'h2F3;
					end
					4: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h103;
						arA23['h5] = 'h2F3;
					end
					5: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1C2;
						arA23['h5] = 'h2F3;
					end
					6: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E3;
						arA23['h5] = 'h2F3;
					end
					7: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00A;
						arA23['h5] = 'h2F3;
					end
					8: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E2;
						arA23['h5] = 'h2F3;
					end
					default: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
				endcase
			3'b110:
				case (col)
					0: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2DC;
						arA23['h5] = 'sdX;
					end
					1: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h2DC;
						arA23['h5] = 'sdX;
					end
					2: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00B;
						arA23['h5] = 'h2F7;
					end
					3: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00F;
						arA23['h5] = 'h2F7;
					end
					4: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h179;
						arA23['h5] = 'h2F7;
					end
					5: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1C6;
						arA23['h5] = 'h2F7;
					end
					6: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E7;
						arA23['h5] = 'h2F7;
					end
					7: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00E;
						arA23['h5] = 'h2F7;
					end
					8: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E6;
						arA23['h5] = 'h2F7;
					end
					default: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
				endcase
			3'b111:
				case (col)
					0: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h384;
						arA23['h5] = 'sdX;
					end
					1: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h06C;
						arA23['h5] = 'sdX;
					end
					2: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h006;
						arA23['h5] = 'h380;
					end
					3: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h21C;
						arA23['h5] = 'h380;
					end
					4: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h103;
						arA23['h5] = 'h380;
					end
					5: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1C2;
						arA23['h5] = 'h380;
					end
					6: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E3;
						arA23['h5] = 'h380;
					end
					7: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h00A;
						arA23['h5] = 'h380;
					end
					8: begin
						arIll['h5] = 1'b0;
						arA1['h5] = 'h1E2;
						arA23['h5] = 'h380;
					end
					default: begin
						arIll['h5] = 1'b1;
						arA1['h5] = 'sdX;
						arA23['h5] = 'sdX;
					end
				endcase
		endcase
		case (row86)
			3'b000:
				case (col)
					0: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C1;
						arA23['h8] = 'sdX;
					end
					1: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					2: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h006;
						arA23['h8] = 'h1C3;
					end
					3: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h21C;
						arA23['h8] = 'h1C3;
					end
					4: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h103;
						arA23['h8] = 'h1C3;
					end
					5: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h1C3;
					end
					6: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h1C3;
					end
					7: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00A;
						arA23['h8] = 'h1C3;
					end
					8: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E2;
						arA23['h8] = 'h1C3;
					end
					9: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h1C3;
					end
					10: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h1C3;
					end
					11: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h0EA;
						arA23['h8] = 'h1C1;
					end
					default: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
				endcase
			3'b001:
				case (col)
					0: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C1;
						arA23['h8] = 'sdX;
					end
					1: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					2: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h006;
						arA23['h8] = 'h1C3;
					end
					3: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h21C;
						arA23['h8] = 'h1C3;
					end
					4: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h103;
						arA23['h8] = 'h1C3;
					end
					5: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h1C3;
					end
					6: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h1C3;
					end
					7: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00A;
						arA23['h8] = 'h1C3;
					end
					8: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E2;
						arA23['h8] = 'h1C3;
					end
					9: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h1C3;
					end
					10: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h1C3;
					end
					11: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h0EA;
						arA23['h8] = 'h1C1;
					end
					default: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
				endcase
			3'b010:
				case (col)
					0: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C5;
						arA23['h8] = 'sdX;
					end
					1: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					2: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00B;
						arA23['h8] = 'h1CB;
					end
					3: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00F;
						arA23['h8] = 'h1CB;
					end
					4: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h179;
						arA23['h8] = 'h1CB;
					end
					5: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C6;
						arA23['h8] = 'h1CB;
					end
					6: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E7;
						arA23['h8] = 'h1CB;
					end
					7: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00E;
						arA23['h8] = 'h1CB;
					end
					8: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E6;
						arA23['h8] = 'h1CB;
					end
					9: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C6;
						arA23['h8] = 'h1CB;
					end
					10: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E7;
						arA23['h8] = 'h1CB;
					end
					11: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h0A7;
						arA23['h8] = 'h1C5;
					end
					default: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
				endcase
			3'b011:
				case (col)
					0: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h0A6;
						arA23['h8] = 'sdX;
					end
					1: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					2: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h006;
						arA23['h8] = 'h0A4;
					end
					3: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h21C;
						arA23['h8] = 'h0A4;
					end
					4: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h103;
						arA23['h8] = 'h0A4;
					end
					5: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h0A4;
					end
					6: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h0A4;
					end
					7: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00A;
						arA23['h8] = 'h0A4;
					end
					8: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E2;
						arA23['h8] = 'h0A4;
					end
					9: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h0A4;
					end
					10: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h0A4;
					end
					11: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h0EA;
						arA23['h8] = 'h0A6;
					end
					default: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
				endcase
			3'b100:
				case (col)
					0: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1CD;
						arA23['h8] = 'sdX;
					end
					1: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h107;
						arA23['h8] = 'sdX;
					end
					2: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h006;
						arA23['h8] = 'h299;
					end
					3: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h21C;
						arA23['h8] = 'h299;
					end
					4: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h103;
						arA23['h8] = 'h299;
					end
					5: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h299;
					end
					6: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h299;
					end
					7: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00A;
						arA23['h8] = 'h299;
					end
					8: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E2;
						arA23['h8] = 'h299;
					end
					9: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					10: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					11: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					default: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
				endcase
			3'b101:
				case (col)
					0: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					1: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					2: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h006;
						arA23['h8] = 'h299;
					end
					3: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h21C;
						arA23['h8] = 'h299;
					end
					4: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h103;
						arA23['h8] = 'h299;
					end
					5: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h299;
					end
					6: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h299;
					end
					7: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00A;
						arA23['h8] = 'h299;
					end
					8: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E2;
						arA23['h8] = 'h299;
					end
					9: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					10: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					11: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					default: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
				endcase
			3'b110:
				case (col)
					0: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					1: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					2: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00B;
						arA23['h8] = 'h29D;
					end
					3: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00F;
						arA23['h8] = 'h29D;
					end
					4: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h179;
						arA23['h8] = 'h29D;
					end
					5: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C6;
						arA23['h8] = 'h29D;
					end
					6: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E7;
						arA23['h8] = 'h29D;
					end
					7: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00E;
						arA23['h8] = 'h29D;
					end
					8: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E6;
						arA23['h8] = 'h29D;
					end
					9: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					10: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					11: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					default: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
				endcase
			3'b111:
				case (col)
					0: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h0AE;
						arA23['h8] = 'sdX;
					end
					1: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
					2: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h006;
						arA23['h8] = 'h0AC;
					end
					3: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h21C;
						arA23['h8] = 'h0AC;
					end
					4: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h103;
						arA23['h8] = 'h0AC;
					end
					5: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h0AC;
					end
					6: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h0AC;
					end
					7: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h00A;
						arA23['h8] = 'h0AC;
					end
					8: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E2;
						arA23['h8] = 'h0AC;
					end
					9: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1C2;
						arA23['h8] = 'h0AC;
					end
					10: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h1E3;
						arA23['h8] = 'h0AC;
					end
					11: begin
						arIll['h8] = 1'b0;
						arA1['h8] = 'h0EA;
						arA23['h8] = 'h0AE;
					end
					default: begin
						arIll['h8] = 1'b1;
						arA1['h8] = 'sdX;
						arA23['h8] = 'sdX;
					end
				endcase
		endcase
		case (row86)
			3'b000:
				case (col)
					0: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C1;
						arA23['h9] = 'sdX;
					end
					1: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					2: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h006;
						arA23['h9] = 'h1C3;
					end
					3: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h21C;
						arA23['h9] = 'h1C3;
					end
					4: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h103;
						arA23['h9] = 'h1C3;
					end
					5: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C2;
						arA23['h9] = 'h1C3;
					end
					6: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E3;
						arA23['h9] = 'h1C3;
					end
					7: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00A;
						arA23['h9] = 'h1C3;
					end
					8: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E2;
						arA23['h9] = 'h1C3;
					end
					9: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C2;
						arA23['h9] = 'h1C3;
					end
					10: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E3;
						arA23['h9] = 'h1C3;
					end
					11: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h0EA;
						arA23['h9] = 'h1C1;
					end
					default: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
				endcase
			3'b001:
				case (col)
					0: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C1;
						arA23['h9] = 'sdX;
					end
					1: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C1;
						arA23['h9] = 'sdX;
					end
					2: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h006;
						arA23['h9] = 'h1C3;
					end
					3: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h21C;
						arA23['h9] = 'h1C3;
					end
					4: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h103;
						arA23['h9] = 'h1C3;
					end
					5: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C2;
						arA23['h9] = 'h1C3;
					end
					6: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E3;
						arA23['h9] = 'h1C3;
					end
					7: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00A;
						arA23['h9] = 'h1C3;
					end
					8: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E2;
						arA23['h9] = 'h1C3;
					end
					9: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C2;
						arA23['h9] = 'h1C3;
					end
					10: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E3;
						arA23['h9] = 'h1C3;
					end
					11: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h0EA;
						arA23['h9] = 'h1C1;
					end
					default: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
				endcase
			3'b010:
				case (col)
					0: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C5;
						arA23['h9] = 'sdX;
					end
					1: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C5;
						arA23['h9] = 'sdX;
					end
					2: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00B;
						arA23['h9] = 'h1CB;
					end
					3: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00F;
						arA23['h9] = 'h1CB;
					end
					4: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h179;
						arA23['h9] = 'h1CB;
					end
					5: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C6;
						arA23['h9] = 'h1CB;
					end
					6: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E7;
						arA23['h9] = 'h1CB;
					end
					7: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00E;
						arA23['h9] = 'h1CB;
					end
					8: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E6;
						arA23['h9] = 'h1CB;
					end
					9: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C6;
						arA23['h9] = 'h1CB;
					end
					10: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E7;
						arA23['h9] = 'h1CB;
					end
					11: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h0A7;
						arA23['h9] = 'h1C5;
					end
					default: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
				endcase
			3'b011:
				case (col)
					0: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C9;
						arA23['h9] = 'sdX;
					end
					1: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C9;
						arA23['h9] = 'sdX;
					end
					2: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h006;
						arA23['h9] = 'h1C7;
					end
					3: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h21C;
						arA23['h9] = 'h1C7;
					end
					4: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h103;
						arA23['h9] = 'h1C7;
					end
					5: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C2;
						arA23['h9] = 'h1C7;
					end
					6: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E3;
						arA23['h9] = 'h1C7;
					end
					7: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00A;
						arA23['h9] = 'h1C7;
					end
					8: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E2;
						arA23['h9] = 'h1C7;
					end
					9: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C2;
						arA23['h9] = 'h1C7;
					end
					10: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E3;
						arA23['h9] = 'h1C7;
					end
					11: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h0EA;
						arA23['h9] = 'h1C9;
					end
					default: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
				endcase
			3'b100:
				case (col)
					0: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C1;
						arA23['h9] = 'sdX;
					end
					1: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h10F;
						arA23['h9] = 'sdX;
					end
					2: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h006;
						arA23['h9] = 'h299;
					end
					3: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h21C;
						arA23['h9] = 'h299;
					end
					4: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h103;
						arA23['h9] = 'h299;
					end
					5: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C2;
						arA23['h9] = 'h299;
					end
					6: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E3;
						arA23['h9] = 'h299;
					end
					7: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00A;
						arA23['h9] = 'h299;
					end
					8: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E2;
						arA23['h9] = 'h299;
					end
					9: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					10: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					11: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					default: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
				endcase
			3'b101:
				case (col)
					0: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C1;
						arA23['h9] = 'sdX;
					end
					1: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h10F;
						arA23['h9] = 'sdX;
					end
					2: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h006;
						arA23['h9] = 'h299;
					end
					3: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h21C;
						arA23['h9] = 'h299;
					end
					4: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h103;
						arA23['h9] = 'h299;
					end
					5: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C2;
						arA23['h9] = 'h299;
					end
					6: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E3;
						arA23['h9] = 'h299;
					end
					7: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00A;
						arA23['h9] = 'h299;
					end
					8: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E2;
						arA23['h9] = 'h299;
					end
					9: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					10: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					11: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					default: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
				endcase
			3'b110:
				case (col)
					0: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C5;
						arA23['h9] = 'sdX;
					end
					1: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h10B;
						arA23['h9] = 'sdX;
					end
					2: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00B;
						arA23['h9] = 'h29D;
					end
					3: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00F;
						arA23['h9] = 'h29D;
					end
					4: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h179;
						arA23['h9] = 'h29D;
					end
					5: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C6;
						arA23['h9] = 'h29D;
					end
					6: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E7;
						arA23['h9] = 'h29D;
					end
					7: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00E;
						arA23['h9] = 'h29D;
					end
					8: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E6;
						arA23['h9] = 'h29D;
					end
					9: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					10: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					11: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
					default: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
				endcase
			3'b111:
				case (col)
					0: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C5;
						arA23['h9] = 'sdX;
					end
					1: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C5;
						arA23['h9] = 'sdX;
					end
					2: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00B;
						arA23['h9] = 'h1CB;
					end
					3: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00F;
						arA23['h9] = 'h1CB;
					end
					4: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h179;
						arA23['h9] = 'h1CB;
					end
					5: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C6;
						arA23['h9] = 'h1CB;
					end
					6: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E7;
						arA23['h9] = 'h1CB;
					end
					7: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h00E;
						arA23['h9] = 'h1CB;
					end
					8: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E6;
						arA23['h9] = 'h1CB;
					end
					9: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1C6;
						arA23['h9] = 'h1CB;
					end
					10: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h1E7;
						arA23['h9] = 'h1CB;
					end
					11: begin
						arIll['h9] = 1'b0;
						arA1['h9] = 'h0A7;
						arA23['h9] = 'h1C5;
					end
					default: begin
						arIll['h9] = 1'b1;
						arA1['h9] = 'sdX;
						arA23['h9] = 'sdX;
					end
				endcase
		endcase
		case (row86)
			3'b000:
				case (col)
					0: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D1;
						arA23['hb] = 'sdX;
					end
					1: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					2: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h006;
						arA23['hb] = 'h1D3;
					end
					3: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h21C;
						arA23['hb] = 'h1D3;
					end
					4: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h103;
						arA23['hb] = 'h1D3;
					end
					5: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C2;
						arA23['hb] = 'h1D3;
					end
					6: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E3;
						arA23['hb] = 'h1D3;
					end
					7: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00A;
						arA23['hb] = 'h1D3;
					end
					8: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E2;
						arA23['hb] = 'h1D3;
					end
					9: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C2;
						arA23['hb] = 'h1D3;
					end
					10: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E3;
						arA23['hb] = 'h1D3;
					end
					11: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h0EA;
						arA23['hb] = 'h1D1;
					end
					default: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
				endcase
			3'b001:
				case (col)
					0: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D1;
						arA23['hb] = 'sdX;
					end
					1: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D1;
						arA23['hb] = 'sdX;
					end
					2: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h006;
						arA23['hb] = 'h1D3;
					end
					3: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h21C;
						arA23['hb] = 'h1D3;
					end
					4: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h103;
						arA23['hb] = 'h1D3;
					end
					5: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C2;
						arA23['hb] = 'h1D3;
					end
					6: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E3;
						arA23['hb] = 'h1D3;
					end
					7: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00A;
						arA23['hb] = 'h1D3;
					end
					8: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E2;
						arA23['hb] = 'h1D3;
					end
					9: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C2;
						arA23['hb] = 'h1D3;
					end
					10: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E3;
						arA23['hb] = 'h1D3;
					end
					11: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h0EA;
						arA23['hb] = 'h1D1;
					end
					default: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
				endcase
			3'b010:
				case (col)
					0: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D5;
						arA23['hb] = 'sdX;
					end
					1: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D5;
						arA23['hb] = 'sdX;
					end
					2: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00B;
						arA23['hb] = 'h1D7;
					end
					3: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00F;
						arA23['hb] = 'h1D7;
					end
					4: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h179;
						arA23['hb] = 'h1D7;
					end
					5: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C6;
						arA23['hb] = 'h1D7;
					end
					6: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E7;
						arA23['hb] = 'h1D7;
					end
					7: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00E;
						arA23['hb] = 'h1D7;
					end
					8: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E6;
						arA23['hb] = 'h1D7;
					end
					9: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C6;
						arA23['hb] = 'h1D7;
					end
					10: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E7;
						arA23['hb] = 'h1D7;
					end
					11: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h0A7;
						arA23['hb] = 'h1D5;
					end
					default: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
				endcase
			3'b011:
				case (col)
					0: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D9;
						arA23['hb] = 'sdX;
					end
					1: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D9;
						arA23['hb] = 'sdX;
					end
					2: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h006;
						arA23['hb] = 'h1CF;
					end
					3: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h21C;
						arA23['hb] = 'h1CF;
					end
					4: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h103;
						arA23['hb] = 'h1CF;
					end
					5: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C2;
						arA23['hb] = 'h1CF;
					end
					6: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E3;
						arA23['hb] = 'h1CF;
					end
					7: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00A;
						arA23['hb] = 'h1CF;
					end
					8: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E2;
						arA23['hb] = 'h1CF;
					end
					9: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C2;
						arA23['hb] = 'h1CF;
					end
					10: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E3;
						arA23['hb] = 'h1CF;
					end
					11: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h0EA;
						arA23['hb] = 'h1D9;
					end
					default: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
				endcase
			3'b100:
				case (col)
					0: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h100;
						arA23['hb] = 'sdX;
					end
					1: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h06B;
						arA23['hb] = 'sdX;
					end
					2: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h006;
						arA23['hb] = 'h299;
					end
					3: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h21C;
						arA23['hb] = 'h299;
					end
					4: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h103;
						arA23['hb] = 'h299;
					end
					5: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C2;
						arA23['hb] = 'h299;
					end
					6: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E3;
						arA23['hb] = 'h299;
					end
					7: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00A;
						arA23['hb] = 'h299;
					end
					8: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E2;
						arA23['hb] = 'h299;
					end
					9: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					10: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					11: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					default: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
				endcase
			3'b101:
				case (col)
					0: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h100;
						arA23['hb] = 'sdX;
					end
					1: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h06B;
						arA23['hb] = 'sdX;
					end
					2: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h006;
						arA23['hb] = 'h299;
					end
					3: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h21C;
						arA23['hb] = 'h299;
					end
					4: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h103;
						arA23['hb] = 'h299;
					end
					5: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C2;
						arA23['hb] = 'h299;
					end
					6: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E3;
						arA23['hb] = 'h299;
					end
					7: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00A;
						arA23['hb] = 'h299;
					end
					8: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E2;
						arA23['hb] = 'h299;
					end
					9: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					10: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					11: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					default: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
				endcase
			3'b110:
				case (col)
					0: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h10C;
						arA23['hb] = 'sdX;
					end
					1: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h06F;
						arA23['hb] = 'sdX;
					end
					2: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00B;
						arA23['hb] = 'h29D;
					end
					3: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00F;
						arA23['hb] = 'h29D;
					end
					4: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h179;
						arA23['hb] = 'h29D;
					end
					5: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C6;
						arA23['hb] = 'h29D;
					end
					6: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E7;
						arA23['hb] = 'h29D;
					end
					7: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00E;
						arA23['hb] = 'h29D;
					end
					8: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E6;
						arA23['hb] = 'h29D;
					end
					9: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					10: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					11: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
					default: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
				endcase
			3'b111:
				case (col)
					0: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D5;
						arA23['hb] = 'sdX;
					end
					1: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1D5;
						arA23['hb] = 'sdX;
					end
					2: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00B;
						arA23['hb] = 'h1D7;
					end
					3: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00F;
						arA23['hb] = 'h1D7;
					end
					4: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h179;
						arA23['hb] = 'h1D7;
					end
					5: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C6;
						arA23['hb] = 'h1D7;
					end
					6: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E7;
						arA23['hb] = 'h1D7;
					end
					7: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h00E;
						arA23['hb] = 'h1D7;
					end
					8: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E6;
						arA23['hb] = 'h1D7;
					end
					9: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1C6;
						arA23['hb] = 'h1D7;
					end
					10: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h1E7;
						arA23['hb] = 'h1D7;
					end
					11: begin
						arIll['hb] = 1'b0;
						arA1['hb] = 'h0A7;
						arA23['hb] = 'h1D5;
					end
					default: begin
						arIll['hb] = 1'b1;
						arA1['hb] = 'sdX;
						arA23['hb] = 'sdX;
					end
				endcase
		endcase
		case (row86)
			3'b000:
				case (col)
					0: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C1;
						arA23['hc] = 'sdX;
					end
					1: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					2: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h006;
						arA23['hc] = 'h1C3;
					end
					3: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h21C;
						arA23['hc] = 'h1C3;
					end
					4: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h103;
						arA23['hc] = 'h1C3;
					end
					5: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h1C3;
					end
					6: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h1C3;
					end
					7: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00A;
						arA23['hc] = 'h1C3;
					end
					8: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E2;
						arA23['hc] = 'h1C3;
					end
					9: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h1C3;
					end
					10: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h1C3;
					end
					11: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h0EA;
						arA23['hc] = 'h1C1;
					end
					default: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
				endcase
			3'b001:
				case (col)
					0: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C1;
						arA23['hc] = 'sdX;
					end
					1: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					2: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h006;
						arA23['hc] = 'h1C3;
					end
					3: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h21C;
						arA23['hc] = 'h1C3;
					end
					4: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h103;
						arA23['hc] = 'h1C3;
					end
					5: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h1C3;
					end
					6: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h1C3;
					end
					7: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00A;
						arA23['hc] = 'h1C3;
					end
					8: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E2;
						arA23['hc] = 'h1C3;
					end
					9: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h1C3;
					end
					10: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h1C3;
					end
					11: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h0EA;
						arA23['hc] = 'h1C1;
					end
					default: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
				endcase
			3'b010:
				case (col)
					0: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C5;
						arA23['hc] = 'sdX;
					end
					1: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					2: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00B;
						arA23['hc] = 'h1CB;
					end
					3: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00F;
						arA23['hc] = 'h1CB;
					end
					4: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h179;
						arA23['hc] = 'h1CB;
					end
					5: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C6;
						arA23['hc] = 'h1CB;
					end
					6: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E7;
						arA23['hc] = 'h1CB;
					end
					7: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00E;
						arA23['hc] = 'h1CB;
					end
					8: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E6;
						arA23['hc] = 'h1CB;
					end
					9: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C6;
						arA23['hc] = 'h1CB;
					end
					10: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E7;
						arA23['hc] = 'h1CB;
					end
					11: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h0A7;
						arA23['hc] = 'h1C5;
					end
					default: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
				endcase
			3'b011:
				case (col)
					0: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h15B;
						arA23['hc] = 'sdX;
					end
					1: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					2: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h006;
						arA23['hc] = 'h15A;
					end
					3: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h21C;
						arA23['hc] = 'h15A;
					end
					4: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h103;
						arA23['hc] = 'h15A;
					end
					5: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h15A;
					end
					6: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h15A;
					end
					7: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00A;
						arA23['hc] = 'h15A;
					end
					8: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E2;
						arA23['hc] = 'h15A;
					end
					9: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h15A;
					end
					10: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h15A;
					end
					11: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h0EA;
						arA23['hc] = 'h15B;
					end
					default: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
				endcase
			3'b100:
				case (col)
					0: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1CD;
						arA23['hc] = 'sdX;
					end
					1: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h107;
						arA23['hc] = 'sdX;
					end
					2: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h006;
						arA23['hc] = 'h299;
					end
					3: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h21C;
						arA23['hc] = 'h299;
					end
					4: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h103;
						arA23['hc] = 'h299;
					end
					5: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h299;
					end
					6: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h299;
					end
					7: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00A;
						arA23['hc] = 'h299;
					end
					8: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E2;
						arA23['hc] = 'h299;
					end
					9: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					10: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					11: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					default: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
				endcase
			3'b101:
				case (col)
					0: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h3E3;
						arA23['hc] = 'sdX;
					end
					1: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h3E3;
						arA23['hc] = 'sdX;
					end
					2: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h006;
						arA23['hc] = 'h299;
					end
					3: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h21C;
						arA23['hc] = 'h299;
					end
					4: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h103;
						arA23['hc] = 'h299;
					end
					5: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h299;
					end
					6: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h299;
					end
					7: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00A;
						arA23['hc] = 'h299;
					end
					8: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E2;
						arA23['hc] = 'h299;
					end
					9: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					10: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					11: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					default: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
				endcase
			3'b110:
				case (col)
					0: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					1: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h3E3;
						arA23['hc] = 'sdX;
					end
					2: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00B;
						arA23['hc] = 'h29D;
					end
					3: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00F;
						arA23['hc] = 'h29D;
					end
					4: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h179;
						arA23['hc] = 'h29D;
					end
					5: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C6;
						arA23['hc] = 'h29D;
					end
					6: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E7;
						arA23['hc] = 'h29D;
					end
					7: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00E;
						arA23['hc] = 'h29D;
					end
					8: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E6;
						arA23['hc] = 'h29D;
					end
					9: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					10: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					11: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					default: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
				endcase
			3'b111:
				case (col)
					0: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h15B;
						arA23['hc] = 'sdX;
					end
					1: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
					2: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h006;
						arA23['hc] = 'h15A;
					end
					3: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h21C;
						arA23['hc] = 'h15A;
					end
					4: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h103;
						arA23['hc] = 'h15A;
					end
					5: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h15A;
					end
					6: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h15A;
					end
					7: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h00A;
						arA23['hc] = 'h15A;
					end
					8: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E2;
						arA23['hc] = 'h15A;
					end
					9: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1C2;
						arA23['hc] = 'h15A;
					end
					10: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h1E3;
						arA23['hc] = 'h15A;
					end
					11: begin
						arIll['hc] = 1'b0;
						arA1['hc] = 'h0EA;
						arA23['hc] = 'h15B;
					end
					default: begin
						arIll['hc] = 1'b1;
						arA1['hc] = 'sdX;
						arA23['hc] = 'sdX;
					end
				endcase
		endcase
		case (row86)
			3'b000:
				case (col)
					0: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C1;
						arA23['hd] = 'sdX;
					end
					1: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					2: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h006;
						arA23['hd] = 'h1C3;
					end
					3: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h21C;
						arA23['hd] = 'h1C3;
					end
					4: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h103;
						arA23['hd] = 'h1C3;
					end
					5: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C2;
						arA23['hd] = 'h1C3;
					end
					6: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E3;
						arA23['hd] = 'h1C3;
					end
					7: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00A;
						arA23['hd] = 'h1C3;
					end
					8: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E2;
						arA23['hd] = 'h1C3;
					end
					9: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C2;
						arA23['hd] = 'h1C3;
					end
					10: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E3;
						arA23['hd] = 'h1C3;
					end
					11: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h0EA;
						arA23['hd] = 'h1C1;
					end
					default: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
				endcase
			3'b001:
				case (col)
					0: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C1;
						arA23['hd] = 'sdX;
					end
					1: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C1;
						arA23['hd] = 'sdX;
					end
					2: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h006;
						arA23['hd] = 'h1C3;
					end
					3: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h21C;
						arA23['hd] = 'h1C3;
					end
					4: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h103;
						arA23['hd] = 'h1C3;
					end
					5: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C2;
						arA23['hd] = 'h1C3;
					end
					6: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E3;
						arA23['hd] = 'h1C3;
					end
					7: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00A;
						arA23['hd] = 'h1C3;
					end
					8: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E2;
						arA23['hd] = 'h1C3;
					end
					9: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C2;
						arA23['hd] = 'h1C3;
					end
					10: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E3;
						arA23['hd] = 'h1C3;
					end
					11: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h0EA;
						arA23['hd] = 'h1C1;
					end
					default: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
				endcase
			3'b010:
				case (col)
					0: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C5;
						arA23['hd] = 'sdX;
					end
					1: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C5;
						arA23['hd] = 'sdX;
					end
					2: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00B;
						arA23['hd] = 'h1CB;
					end
					3: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00F;
						arA23['hd] = 'h1CB;
					end
					4: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h179;
						arA23['hd] = 'h1CB;
					end
					5: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C6;
						arA23['hd] = 'h1CB;
					end
					6: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E7;
						arA23['hd] = 'h1CB;
					end
					7: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00E;
						arA23['hd] = 'h1CB;
					end
					8: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E6;
						arA23['hd] = 'h1CB;
					end
					9: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C6;
						arA23['hd] = 'h1CB;
					end
					10: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E7;
						arA23['hd] = 'h1CB;
					end
					11: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h0A7;
						arA23['hd] = 'h1C5;
					end
					default: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
				endcase
			3'b011:
				case (col)
					0: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C9;
						arA23['hd] = 'sdX;
					end
					1: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C9;
						arA23['hd] = 'sdX;
					end
					2: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h006;
						arA23['hd] = 'h1C7;
					end
					3: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h21C;
						arA23['hd] = 'h1C7;
					end
					4: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h103;
						arA23['hd] = 'h1C7;
					end
					5: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C2;
						arA23['hd] = 'h1C7;
					end
					6: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E3;
						arA23['hd] = 'h1C7;
					end
					7: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00A;
						arA23['hd] = 'h1C7;
					end
					8: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E2;
						arA23['hd] = 'h1C7;
					end
					9: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C2;
						arA23['hd] = 'h1C7;
					end
					10: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E3;
						arA23['hd] = 'h1C7;
					end
					11: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h0EA;
						arA23['hd] = 'h1C9;
					end
					default: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
				endcase
			3'b100:
				case (col)
					0: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C1;
						arA23['hd] = 'sdX;
					end
					1: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h10F;
						arA23['hd] = 'sdX;
					end
					2: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h006;
						arA23['hd] = 'h299;
					end
					3: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h21C;
						arA23['hd] = 'h299;
					end
					4: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h103;
						arA23['hd] = 'h299;
					end
					5: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C2;
						arA23['hd] = 'h299;
					end
					6: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E3;
						arA23['hd] = 'h299;
					end
					7: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00A;
						arA23['hd] = 'h299;
					end
					8: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E2;
						arA23['hd] = 'h299;
					end
					9: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					10: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					11: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					default: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
				endcase
			3'b101:
				case (col)
					0: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C1;
						arA23['hd] = 'sdX;
					end
					1: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h10F;
						arA23['hd] = 'sdX;
					end
					2: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h006;
						arA23['hd] = 'h299;
					end
					3: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h21C;
						arA23['hd] = 'h299;
					end
					4: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h103;
						arA23['hd] = 'h299;
					end
					5: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C2;
						arA23['hd] = 'h299;
					end
					6: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E3;
						arA23['hd] = 'h299;
					end
					7: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00A;
						arA23['hd] = 'h299;
					end
					8: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E2;
						arA23['hd] = 'h299;
					end
					9: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					10: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					11: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					default: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
				endcase
			3'b110:
				case (col)
					0: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C5;
						arA23['hd] = 'sdX;
					end
					1: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h10B;
						arA23['hd] = 'sdX;
					end
					2: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00B;
						arA23['hd] = 'h29D;
					end
					3: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00F;
						arA23['hd] = 'h29D;
					end
					4: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h179;
						arA23['hd] = 'h29D;
					end
					5: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C6;
						arA23['hd] = 'h29D;
					end
					6: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E7;
						arA23['hd] = 'h29D;
					end
					7: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00E;
						arA23['hd] = 'h29D;
					end
					8: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E6;
						arA23['hd] = 'h29D;
					end
					9: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					10: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					11: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
					default: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
				endcase
			3'b111:
				case (col)
					0: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C5;
						arA23['hd] = 'sdX;
					end
					1: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C5;
						arA23['hd] = 'sdX;
					end
					2: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00B;
						arA23['hd] = 'h1CB;
					end
					3: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00F;
						arA23['hd] = 'h1CB;
					end
					4: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h179;
						arA23['hd] = 'h1CB;
					end
					5: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C6;
						arA23['hd] = 'h1CB;
					end
					6: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E7;
						arA23['hd] = 'h1CB;
					end
					7: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h00E;
						arA23['hd] = 'h1CB;
					end
					8: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E6;
						arA23['hd] = 'h1CB;
					end
					9: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1C6;
						arA23['hd] = 'h1CB;
					end
					10: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h1E7;
						arA23['hd] = 'h1CB;
					end
					11: begin
						arIll['hd] = 1'b0;
						arA1['hd] = 'h0A7;
						arA23['hd] = 'h1C5;
					end
					default: begin
						arIll['hd] = 1'b1;
						arA1['hd] = 'sdX;
						arA23['hd] = 'sdX;
					end
				endcase
		endcase
	end
endmodule
