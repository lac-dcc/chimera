module top
#(parameter param14 = (~^(((!((8'hab) - (8'hb6))) ? ((^(8'ha6)) ? ((7'h42) | (8'hbc)) : {(8'ha5)}) : (((8'hab) <<< (8'hb7)) + ((8'h9f) ? (8'h9f) : (8'hb4)))) ? {(((8'hbb) ? (8'hb6) : (8'hb2)) ^~ ((8'haa) ? (8'hb0) : (8'ha4)))} : {((8'haa) ? ((8'hbd) == (8'ha7)) : (~&(8'ha1)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire5,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned((+$signed({wire4[(3'h6):(3'h4)],
                     (wire0 ? wire4 : wire2)})));
  always
    @(posedge clk) begin
      reg6 <= ($unsigned(((~&{wire3}) * {((8'hb9) >= wire5),
              $unsigned(wire0)})) ?
          wire5[(4'h9):(2'h2)] : $unsigned($unsigned(((wire5 ?
                  (8'hbe) : wire0) ?
              {wire3} : (|wire1)))));
      reg7 <= $unsigned(wire1[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg8 <= $unsigned((!{(~^wire3[(4'hd):(1'h0)]),
          ((reg7 >>> wire5) ? reg7 : {wire2, (7'h40)})}));
      reg9 <= (($unsigned((~^(reg6 & wire0))) ?
          {(~|(wire1 || reg7))} : (wire4[(1'h0):(1'h0)] <<< wire4)) | wire2[(1'h0):(1'h0)]);
      reg10 <= (({(+(wire0 ? wire0 : wire4))} ?
          wire3[(4'h9):(3'h6)] : (8'hb4)) << (|($unsigned($signed((8'hb4))) && (|$signed(wire2)))));
    end
  assign wire11 = {$unsigned(((8'ha9) ^~ ($signed(reg7) < (wire4 & reg9))))};
  assign wire12 = $signed({wire11, $unsigned($signed({wire11, reg6}))});
  assign wire13 = $signed({$unsigned($signed((!wire2))),
                      (reg10 ? (~|reg8) : (8'ha4))});
endmodule
