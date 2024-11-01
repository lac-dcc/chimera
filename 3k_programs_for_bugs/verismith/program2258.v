module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire5 = ((wire0 ^~ ((wire0[(1'h1):(1'h0)] ~^ wire4[(1'h0):(1'h0)]) || (^~{wire4}))) ?
                     (wire3[(1'h0):(1'h0)] + wire4[(2'h2):(2'h2)]) : wire2);
  assign wire6 = ((($unsigned((^wire1)) ?
                         wire4[(3'h4):(2'h3)] : $unsigned((wire3 >>> wire1))) ?
                     ((^~wire3[(1'h1):(1'h0)]) + (wire0 != wire1[(2'h2):(1'h1)])) : ($signed(wire2) | ($signed((8'hbb)) < wire4[(1'h1):(1'h1)]))) || (^(7'h40)));
  assign wire7 = $unsigned((~(~(^(~&wire4)))));
  assign wire8 = wire2;
  assign wire9 = $signed(wire8[(4'hd):(4'hc)]);
  assign wire10 = (8'ha2);
  assign wire11 = ((wire0[(2'h2):(1'h1)] - $signed(((+wire8) ?
                      (wire7 || wire8) : wire9[(1'h1):(1'h0)]))) + (wire8 >> ($signed((|wire10)) && ((8'hbf) | {wire4,
                      wire2}))));
  assign wire12 = (^~($signed(wire8[(4'h9):(2'h2)]) ?
                      (~|$signed((^(8'hb4)))) : ((!wire5[(4'hd):(2'h2)]) >> (|(~(8'hb9))))));
  assign wire13 = wire1;
  always
    @(posedge clk) begin
      reg14 <= $unsigned($unsigned($unsigned(wire10)));
      reg15 <= (!(wire7[(2'h2):(1'h1)] ?
          wire1[(2'h2):(1'h0)] : $signed(wire10[(3'h4):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg16 <= wire1;
      reg17 <= (wire13[(1'h1):(1'h1)] && (~&(!{$signed(wire5),
          (wire6 && wire6)})));
      reg18 <= (~(8'hb4));
      reg19 <= ({{wire0},
          wire0[(2'h2):(2'h2)]} == $unsigned({wire2[(4'h9):(2'h2)],
          ($unsigned(wire3) ? {reg14} : $unsigned(reg15))}));
    end
  always
    @(posedge clk) begin
      reg20 <= $unsigned(wire9);
    end
  always
    @(posedge clk) begin
      reg21 <= {reg20,
          (-(($signed((8'hb9)) < $unsigned(reg19)) ?
              $signed(((8'h9d) ? wire10 : reg16)) : wire8[(4'hf):(4'h8)]))};
      reg22 <= ($unsigned({($unsigned((8'ha4)) * wire4),
              reg16[(4'h9):(3'h6)]}) ?
          $unsigned($signed($unsigned($unsigned(wire2)))) : wire2[(4'hd):(2'h2)]);
    end
  assign wire23 = (wire5[(3'h5):(1'h1)] ^ $signed(reg22[(2'h3):(1'h1)]));
  assign wire24 = wire3;
  assign wire25 = $unsigned($signed($signed(wire8[(4'hc):(4'h9)])));
endmodule
