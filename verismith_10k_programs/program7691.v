module top
#(parameter param26 = ((8'haa) <= (&((^((8'hb6) - (8'ha8))) <= (+{(8'hae), (8'haf)})))), 
parameter param27 = param26)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire16,
                 wire15,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire5 = (8'hbd);
  assign wire6 = ({$signed($unsigned($signed(wire4))),
                     (wire5[(4'h8):(1'h1)] ?
                         ((^wire1) ?
                             wire2[(4'hc):(3'h5)] : wire3[(3'h7):(3'h5)]) : $unsigned($unsigned(wire2)))} || (~&({wire4[(2'h2):(1'h0)],
                         (wire4 ? wire5 : wire2)} ?
                     $signed((wire1 ? wire4 : wire5)) : (^(~|wire1)))));
  assign wire7 = $unsigned((((wire5[(3'h4):(2'h2)] != (wire4 >>> wire2)) >= wire5[(4'h8):(1'h0)]) >= wire2));
  assign wire8 = wire3[(2'h3):(1'h1)];
  assign wire9 = (|wire5[(3'h7):(2'h2)]);
  assign wire10 = ((wire7[(2'h2):(1'h1)] || $unsigned($signed($unsigned((7'h40))))) > $unsigned(wire4[(3'h6):(2'h2)]));
  assign wire11 = $signed({$unsigned(((-wire6) ? (+wire0) : (~|wire5)))});
  assign wire12 = (wire6 << ((^($signed(wire10) >> wire6)) || (((~^wire10) - wire0) ^~ $unsigned((8'ha2)))));
  assign wire13 = $signed((~^wire0[(4'h8):(2'h3)]));
  assign wire14 = {(~($signed((~&(8'ha8))) >> ((wire3 ~^ (8'ha8)) ?
                          wire13[(1'h0):(1'h0)] : $signed(wire8))))};
  assign wire15 = wire11[(3'h5):(2'h2)];
  assign wire16 = ((wire10 ?
                      (|wire7[(1'h1):(1'h1)]) : $unsigned($unsigned((wire7 >>> wire14)))) ^ $unsigned($signed(wire14[(3'h7):(2'h3)])));
  always
    @(posedge clk) begin
      reg17 <= (+$unsigned((wire2[(4'ha):(2'h3)] < {$signed((8'hb0))})));
      reg18 <= {{$signed($signed(wire0)),
              (wire3[(2'h2):(1'h1)] ?
                  $signed($signed(wire2)) : ($unsigned(wire12) ?
                      wire4 : $signed(wire9)))},
          (^~$unsigned(wire13))};
    end
  assign wire19 = (($signed({{wire11}}) ?
                      {wire0[(4'hf):(4'hf)]} : (((wire2 - reg18) ~^ wire15) ?
                          wire3 : ($unsigned(wire5) ?
                              (wire5 == wire8) : $signed(wire5)))) >> wire7);
  assign wire20 = ($signed($unsigned($unsigned(wire16[(1'h1):(1'h1)]))) ?
                      $signed((7'h40)) : ($unsigned(wire7[(1'h1):(1'h0)]) ?
                          wire4[(3'h7):(1'h0)] : wire11[(2'h2):(1'h1)]));
  assign wire21 = {{((8'ha5) ?
                              ((wire0 <= wire15) | (wire6 >= reg18)) : ($unsigned(wire15) || (wire9 ^~ (8'hab))))},
                      wire3};
  always
    @(posedge clk) begin
      reg22 <= {$signed(wire7)};
      reg23 <= $unsigned(((($signed((8'ha4)) <<< $signed(wire6)) ?
          ((^(8'ha3)) - (wire13 ? wire8 : wire16)) : ($signed(reg17) ?
              wire2 : wire15[(1'h0):(1'h0)])) >> (!(wire3 > ((8'hb8) ?
          wire16 : reg18)))));
      reg24 <= (~&$signed((wire3 < wire2)));
      reg25 <= wire12;
    end
endmodule
