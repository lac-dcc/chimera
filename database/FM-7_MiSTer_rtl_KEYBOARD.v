// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module KEYBOARD(
  input CLKSYS,
  input RESETBn,
  input  [10:0] ps2_key,
  input [7:0] MDATA_in,
  output [7:0] SKDATA,
  output [7:0] MKDATA,
  input KDATAn,
  input KACKNGn,
  input RFD00n,
  input RFD01n,
  input SCLK2,
  input WFD02n,
  output KSTROBEn,
  output BREAKn,
  input fm8_switch,
  output LPMASKn,
  output TMMASK,
  output KEYINn
);

assign BREAKn = 1;

reg press_btn;
reg [8:0] code;
reg [7:0] kdata = 8'd0;
reg P0 = 0;
reg [2:0] m77;
reg m132;
reg [3:0] modif;
reg input_strobe;

assign MKDATA =
  ~RFD01n ? kdata :
  ~RFD00n ? { P0, 6'd0, ~fm8_switch } : 8'h0;

assign SKDATA =
  ~KACKNGn ? kdata :
  ~KDATAn ? { P0, 7'd0 } : 8'h0;

always @* begin

	if (~RESETBn) begin
		modif = 4'h0;
	end

  if (input_strobe) begin

	  // alt left = graph
	  // alt right = kana
	  // ctl left = ctl
	  case (code)
	    9'h14: modif[0] = ~press_btn; // ctl
	    9'h12, 8'h59: modif[1] = ~press_btn; // shift (left/right)
	  	9'h111: modif[3] = ~press_btn; // alt right
	  	9'h011:modif[2] = ~press_btn; // alt left
	  endcase

	  // ctl
	  if (modif[0]) begin

			// TODO

	  end
	  // shift
	  else if (modif[1]) begin

			// TODO

	  end

	  // graph
	  else if (modif[2]) begin

			// TODO

	  end

	  // kana
	  else if (modif[3]) begin

			// TODO

	  end

	  // normal
	  else if (press_btn) begin
		  case (code)
	      9'h76: begin { P0, kdata } = 9'h1b; end // esc ??
	      9'h05: begin { P0, kdata } = 9'h101; end // f1
	      9'h06: begin { P0, kdata } = 9'h102; end // f2
	      9'h04: begin { P0, kdata } = 9'h103; end // f3
	      9'h0c: begin { P0, kdata } = 9'h104; end // f4
	      9'h03: begin { P0, kdata } = 9'h105; end // f5
	      9'h0b: begin { P0, kdata } = 9'h106; end // f6
	      9'h83: begin { P0, kdata } = 9'h107; end // f7
	      9'h0a: begin { P0, kdata } = 9'h108; end // f8
	      9'h01: begin { P0, kdata } = 9'h109; end // f9
	      9'h09: begin { P0, kdata } = 9'h10a; end // f10

	      9'h16: begin { P0, kdata } = 9'h31; end // 1
	      9'h1e: begin { P0, kdata } = 9'h32; end // 2
	      9'h26: begin { P0, kdata } = 9'h33; end // 3
	      9'h25: begin { P0, kdata } = 9'h34; end // 4
	      9'h2e: begin { P0, kdata } = 9'h35; end // 5
	      9'h36: begin { P0, kdata } = 9'h36; end // 6
	      9'h3d: begin { P0, kdata } = 9'h37; end // 7
	      9'h3e: begin { P0, kdata } = 9'h38; end // 8
	      9'h46: begin { P0, kdata } = 9'h39; end // 9
	      9'h45: begin { P0, kdata } = 9'h30; end // 0
				9'h4e: begin { P0, kdata } = 9'h2d; end // -
	      9'h55: begin { P0, kdata } = 9'h5e; end // =
	      9'h5d: begin { P0, kdata } = 9'h5c; end // \


	      9'h15: begin { P0, kdata } = 9'h71; end // q
	      9'h1d: begin { P0, kdata } = 9'h77; end // w
	      9'h24: begin { P0, kdata } = 9'h65; end // e
	      9'h2d: begin { P0, kdata } = 9'h72; end // r
	      9'h2c: begin { P0, kdata } = 9'h74; end // t
	      9'h35: begin { P0, kdata } = 9'h79; end // y
	      9'h3c: begin { P0, kdata } = 9'h75; end // u
	      9'h43: begin { P0, kdata } = 9'h69; end // i
	      9'h44: begin { P0, kdata } = 9'h6f; end // o
	      9'h4d: begin { P0, kdata } = 9'h70; end // p
	      9'h54: begin { P0, kdata } = 9'h40; end // [
	      9'h5b: begin { P0, kdata } = 9'h5b; end // ]

		    9'h1c: begin { P0, kdata } = 9'h61; end // a
	      9'h1b: begin { P0, kdata } = 9'h73; end // s
	      9'h23: begin { P0, kdata } = 9'h64; end // d
	      9'h2b: begin { P0, kdata } = 9'h66; end // f
	      9'h34: begin { P0, kdata } = 9'h67; end // g
	      9'h33: begin { P0, kdata } = 9'h68; end // h
	      9'h3b: begin { P0, kdata } = 9'h6a; end // j
	      9'h42: begin { P0, kdata } = 9'h6b; end // k
	      9'h4b: begin { P0, kdata } = 9'h6c; end // l
	      9'h4c: begin { P0, kdata } = 9'h3b; end // ;
	      9'h52: begin { P0, kdata } = 9'h3a; end // '
	      9'h0e: begin { P0, kdata } = 9'h5b; end // `

	      9'h1a: begin { P0, kdata } = 9'h7a; end // z
	      9'h22: begin { P0, kdata } = 9'h78; end // x
	      9'h21: begin { P0, kdata } = 9'h63; end // c
	      9'h2a: begin { P0, kdata } = 9'h76; end // v
		    9'h32: begin { P0, kdata } = 9'h62; end // b
	      9'h31: begin { P0, kdata } = 9'h6e; end // n
	      9'h3a: begin { P0, kdata } = 9'h6d; end // m
	      9'h41: begin { P0, kdata } = 9'h2c; end // ,
	      9'h49: begin { P0, kdata } = 9'h2e; end // .
	      9'h14a: begin { P0, kdata } = 9'h2f; end // .
	      9'h04a: begin { P0, kdata } = 9'h22; end // /

	      9'h29: begin { P0, kdata } = 9'h20; end // spacebar
	      9'h5a: begin { P0, kdata } = 9'h0d; end // enter
	      9'h0d: begin { P0, kdata } = 9'h09; end // tab
	      9'h66: begin { P0, kdata } = 9'h08; end // backspace
	      9'h175: begin { P0, kdata } = 9'h1e; end // up
	      9'h174: begin { P0, kdata } = 9'h1c; end // right
	      9'h16b: begin { P0, kdata } = 9'h1d; end // left
	      9'h172: begin { P0, kdata } = 9'h1f; end // down
	      9'h58: begin { P0, kdata } = 9'h00; end // caps lock ?
	      9'h16c: begin { P0, kdata } = 9'h0b; end // home
	      9'h17d: begin { P0, kdata } = 9'h00; end // page up ?
	      9'h17a: begin { P0, kdata } = 9'h00; end // page down ?
	      9'h170: begin { P0, kdata } = 9'h12; end // insert
	      9'h171: begin { P0, kdata } = 9'h7f; end // delete
	      // 9'h114: BREAKn = ~press_btn; // ctrl right => break
		  endcase
	  end

		else begin
			{ P0, kdata } <= 9'h0;
		end

	end
end

always @(posedge CLKSYS) begin
	reg old_state;

	old_state <= ps2_key[10];
	input_strobe <= 1'b0;


	if(old_state != ps2_key[10]) begin
		press_btn <= ps2_key[9];
		code <= ps2_key[8:0];
	  input_strobe <= 1'b1;
	end
end

wire s0 = ~RESETBn;
always @(posedge WFD02n, posedge s0) begin
  if (s0) m77 <= 3'b111;
  else begin
		$display("FD02 Write: %02X", MDATA_in);
		m77 <= MDATA_in[2:0];
	end
end

wire clr = ~(RESETBn & RFD01n & KACKNGn);

always @(posedge press_btn, posedge clr) begin
  if (clr) m132 <= 1'b0;
  else m132 <= 1'b1;
end

assign KSTROBEn = ~(m132 & ~m77[0]);
assign KEYINn = ~(m132 & m77[0]);
assign LPMASKn = m77[1];
assign TMMASK = m77[2];

endmodule
