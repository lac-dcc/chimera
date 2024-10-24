module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire4 = $signed((+($signed((wire2 ? wire3 : wire1)) ?
                     $signed((!(8'hb5))) : wire0[(3'h4):(1'h1)])));
  assign wire5 = wire2;
  assign wire6 = wire0;
  assign wire7 = wire2[(2'h2):(2'h2)];
  assign wire8 = (-($unsigned(((wire1 ? wire5 : wire7) ?
                     (|wire4) : (wire3 | wire6))) >> (8'ha1)));
  assign wire9 = (^~{$unsigned((^~(wire3 ? wire6 : wire7))),
                     $signed(wire2[(3'h7):(1'h0)])});
  assign wire10 = (-wire4[(4'h8):(2'h2)]);
  assign wire11 = (8'h9f);
  assign wire12 = $unsigned((~^$signed((~^wire8[(4'ha):(4'h9)]))));
  assign wire13 = (wire7 ?
                      (wire6 * ({wire12} ?
                          ((~|wire4) <= {(8'h9e)}) : $signed($unsigned(wire7)))) : wire12[(2'h3):(1'h1)]);
  assign wire14 = {wire3,
                      (wire13 | ((^~(wire11 & wire13)) ?
                          $unsigned((+(8'h9d))) : (((8'ha0) ? wire4 : (7'h41)) ?
                              $signed((8'had)) : (8'had))))};
  always
    @(posedge clk) begin
      reg15 <= (!(~|{(~^$unsigned(wire12)),
          $signed((wire14 ? wire6 : (8'hbf)))}));
      reg16 <= (wire12 ?
          ($unsigned($signed((wire1 ? wire3 : wire2))) != $unsigned((~&(wire9 ?
              wire12 : wire14)))) : ((~|{wire8[(1'h0):(1'h0)],
              (+wire8)}) ^ ((~wire6[(5'h10):(3'h6)]) ?
              (|$unsigned(wire10)) : (^(wire1 <= wire2)))));
      reg17 <= $unsigned($signed(($signed(((8'h9c) ?
          wire4 : (8'h9f))) >= (^~wire1))));
      reg18 <= ($unsigned(((|wire11) ~^ ((reg17 ? wire1 : wire13) ?
              (reg15 ? (8'hb1) : reg16) : (wire14 ^ wire4)))) ?
          (^((-(reg17 == wire13)) + {wire12[(3'h6):(2'h3)]})) : wire2[(3'h7):(2'h2)]);
    end
  assign wire19 = wire8[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if (wire9[(2'h3):(2'h2)])
        begin
          reg20 <= ($unsigned($signed($unsigned((+wire14)))) >>> reg16);
        end
      else
        begin
          reg20 <= {(-($unsigned($signed(wire1)) ?
                  (wire19 << $unsigned((8'ha7))) : wire3))};
        end
    end
  assign wire21 = (+{wire7[(1'h0):(1'h0)], wire4});
  assign wire22 = {$unsigned(reg16[(3'h4):(1'h0)]), ({wire19} << (!{{wire1}}))};
  assign wire23 = reg15[(3'h4):(1'h0)];
  assign wire24 = ((!(|(~wire21[(5'h10):(4'h9)]))) ?
                      {({{reg15}} ^~ ((-wire8) + wire13[(1'h1):(1'h0)])),
                          $signed(wire22)} : $signed((~^$signed((+wire3)))));
endmodule
