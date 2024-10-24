module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (((-wire4[(2'h2):(2'h2)]) + ($unsigned({wire1, wire0}) ?
                     $unsigned((wire4 ? wire4 : wire1)) : ((wire1 ?
                         wire0 : wire2) & (^~wire0)))) * $signed($unsigned(wire4)));
  always
    @(posedge clk) begin
      reg6 <= (wire2[(3'h6):(3'h5)] ?
          (~^$unsigned(wire5[(3'h5):(2'h2)])) : ($signed(((&(8'hb2)) >= (wire1 ?
              wire5 : wire3))) >> ((~^wire4) * $unsigned((^~wire5)))));
      reg7 <= reg6;
    end
  assign wire8 = $signed(reg6);
  always
    @(posedge clk) begin
      reg9 <= {(((~^reg7[(3'h4):(2'h3)]) ? $signed((^wire2)) : $signed(reg6)) ?
              (8'had) : wire1),
          ($unsigned({$signed((8'had))}) * (((wire1 ?
                  wire2 : wire8) << $unsigned(reg6)) ?
              (~&$signed((8'hbf))) : $signed($signed((8'hb9)))))};
      reg10 <= $unsigned($signed(($unsigned((8'hbc)) || $unsigned($unsigned((8'ha5))))));
      reg11 <= wire8[(4'ha):(3'h5)];
      reg12 <= (reg9[(3'h4):(1'h1)] ~^ ((wire1 ^ $unsigned($unsigned(wire2))) < wire1[(3'h5):(3'h5)]));
      reg13 <= $signed((~$unsigned((~^(wire5 >> reg7)))));
    end
  assign wire14 = ((|{((&(8'ha0)) && (8'hab)), reg9[(4'ha):(3'h4)]}) ?
                      reg7 : (~&$unsigned(($signed(wire5) ?
                          reg7[(1'h1):(1'h0)] : ((8'ha6) ^ reg9)))));
  assign wire15 = (^(reg12[(3'h7):(3'h7)] * $unsigned($unsigned(wire0[(2'h2):(1'h1)]))));
  assign wire16 = reg10;
endmodule
