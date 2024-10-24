module top
#(parameter param15 = ((+((8'haf) ? (((8'hbe) ? (8'h9f) : (8'hb5)) ? {(8'h9d)} : ((8'hb7) < (8'hb1))) : (^((8'hb3) ? (8'hbf) : (8'hb5))))) ? (8'hbe) : ({({(8'hac)} ? ((7'h43) ? (8'hb1) : (8'haa)) : ((7'h40) != (7'h40))), (-((8'ha6) ? (8'h9e) : (8'ha3)))} > (((~|(8'hae)) < ((8'ha3) | (8'hb8))) || ((+(8'ha0)) & ((8'ha2) ? (8'h9e) : (7'h40)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 reg14,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed(($signed({wire0[(3'h4):(1'h0)],
                     (^wire0)}) ^ (wire4[(1'h1):(1'h1)] | {(~wire3),
                     (|wire1)})));
  always
    @(posedge clk) begin
      reg6 <= wire4;
      if (({(8'ha7), {$unsigned((~wire3)), $unsigned({(8'hae)})}} ?
          wire5 : ($unsigned({wire5[(3'h4):(2'h2)],
                  (wire5 ? (8'hbb) : wire0)}) ?
              (8'hbc) : ((~|$unsigned(wire3)) ?
                  ($unsigned(wire2) ?
                      $unsigned(reg6) : (reg6 ? wire2 : reg6)) : wire5))))
        begin
          reg7 <= (^wire2);
          reg8 <= $signed($signed((wire4[(2'h2):(2'h2)] ?
              {(wire2 ^ wire5), ((8'had) >= wire3)} : wire1[(4'he):(1'h1)])));
          reg9 <= ((reg6 & wire4) ?
              ((wire4[(1'h0):(1'h0)] ?
                  reg8[(4'hc):(3'h7)] : ($signed(wire1) >= wire5)) && {$unsigned($signed(wire0)),
                  wire5[(5'h11):(3'h6)]}) : ((8'hb7) ?
                  (&wire2) : ($signed($signed(reg8)) && $signed((~|reg6)))));
        end
      else
        begin
          reg7 <= (|(reg6 == $signed($signed((-wire1)))));
          reg8 <= (!(&$unsigned(($signed(wire1) ?
              (^~reg8) : (wire1 ? wire2 : reg6)))));
          reg9 <= wire1;
        end
    end
  assign wire10 = (~&reg9);
  assign wire11 = wire1[(3'h4):(1'h1)];
  assign wire12 = ((reg9[(1'h1):(1'h1)] == (wire11 < wire10)) ?
                      reg6 : {((-wire11) + (((8'hba) ?
                              wire10 : reg9) <= (wire0 - (8'had)))),
                          $unsigned($unsigned(reg9))});
  assign wire13 = reg9;
  always
    @(posedge clk) begin
      reg14 <= (^~wire12);
    end
endmodule
