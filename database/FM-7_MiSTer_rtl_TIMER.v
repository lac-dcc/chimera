// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module TIMER(
  input CLKSYS,
  input [7:0] MDATABUS_in,
  output reg [7:0] MDATABUS_out,
  input WFD03n,
  input BUZZERn,
  input RESETBn,
  input EB,
  input Z80W,
  input REFGRVTn,
  input ATTENTn,
  input RFD04n,
  input RFD05n,
  input BUSY,
  input BREAKn,
  input EXTDETn,
  input CLK0_3,
  output SOUND,
  output SCLKNMIn,
  output DMAn,
  output FIRQn
);

reg [2:0] cmd;
reg speaker;
reg single;
reg continuous;
reg [4:0] _1s;

reg [6:0] cnt1;
reg [12:0] cnt2;
reg beep;
reg _20MS;

wire s0 = ~(WFD03n|BUZZERn);

wire reset = ~RESETBn;
always @(posedge CLK0_3, posedge s0, posedge reset) begin
  if (reset) begin
    speaker <= 1'b0;
    single <= 1'b0;
    continuous <= 1'b0;
  end
  else if (s0) cmd <= { MDATABUS_in[7:6], MDATABUS_in[0] };
  else begin
    speaker <= cmd[0];
    single <= cmd[1];
    continuous <= cmd[2];
    // thanks to friendly.joe, we know continuous has priority
    if (~continuous || _1s >= 5'd19) begin
      speaker <= 1'b0;
      cmd <= 3'd0;
    end
  end
end

always @(posedge _20MS) begin
  if (~speaker) _1s <= 5'd0;
  else _1s <= _1s + 5'd1;
end

// 300kHz / 250 = 1200Hz
always @(posedge CLK0_3) begin
  cnt1 <= cnt1 + 7'd1;
  if (cnt1 == 7'd125) begin
    cnt1 <= 7'd0;
    beep <= ~beep;
  end
end

always @(posedge CLK0_3, posedge reset) begin
  if (reset) begin
    cnt2 <= 13'd0;
    _20MS <= 1'b0;
  end
  else begin
    cnt2 <= cnt2 + 13'd1;
    if (cnt2 == 13'd3000) begin
      cnt2 <= 13'd0;
      _20MS <= ~_20MS;
    end
  end
end

// TODO: MB14415 timer / buzzer (see MC14415)

assign DMAn = 1'b1; // dummy output

reg m45_q8n;
wire m47_q11 = RESETBn & ~RFD04n;
wire m76_q6 = ~ATTENTn;

wire s2 = ~m47_q11;
always @(posedge m76_q6, posedge s2)
  if (s2) m45_q8n <= 1'b1;
  else m45_q8n <= 1'b0;

// m72
always @*
  if (~RFD04n)
    MDATABUS_out = { 5'b11111, BUSY, BREAKn, m47_q11 };
  else if (~RFD05n)
    MDATABUS_out = { BUSY, 6'b111111, EXTDETn };
  else
    MDATABUS_out = 8'h00;

assign FIRQn = m45_q8n & BREAKn;
assign SOUND = speaker ? beep : 1'b0;
assign SCLKNMIn = _20MS;

endmodule
