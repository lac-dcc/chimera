module top
#(parameter param25 = (~&((&(^~((8'hbd) < (8'ha1)))) ? (|{((8'hbe) >> (8'hac)), (^~(8'ha9))}) : ((((8'ha7) * (8'haa)) & {(7'h43)}) + (~|(~&(7'h41)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  assign y = {wire24,
                 wire23,
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
                 wire4,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire4 = {{{(wire2 ^~ $unsigned((7'h41))), wire2[(2'h2):(1'h1)]}},
                     ({wire3, $unsigned(wire2[(4'he):(1'h0)])} ?
                         (wire3 ?
                             (&wire1[(3'h5):(3'h4)]) : wire0) : wire1[(4'h9):(2'h3)])};
  assign wire5 = (8'ha9);
  assign wire6 = wire1;
  assign wire7 = wire2[(4'ha):(2'h3)];
  assign wire8 = wire6;
  assign wire9 = $unsigned((wire0[(3'h7):(2'h3)] ?
                     $signed((((8'hbf) ^ wire1) | (~|wire6))) : (~&$signed(wire1))));
  assign wire10 = wire4[(3'h7):(3'h5)];
  assign wire11 = wire0[(4'ha):(2'h3)];
  assign wire12 = wire5[(2'h2):(1'h0)];
  assign wire13 = $signed($unsigned($unsigned(wire11[(4'he):(2'h3)])));
  assign wire14 = $signed($signed($signed($signed(wire7))));
  assign wire15 = ((^(+wire6[(1'h0):(1'h0)])) ~^ $signed({$signed({wire1,
                          wire10}),
                      $signed(wire4[(3'h5):(2'h2)])}));
  always
    @(posedge clk) begin
      reg16 <= $unsigned((~(($unsigned(wire15) >> (wire15 ? wire1 : wire4)) ?
          wire5 : $unsigned($signed(wire10)))));
      reg17 <= $signed(((~&$signed($unsigned(reg16))) ?
          $unsigned(wire4) : (8'hbb)));
      reg18 <= wire9;
      if (wire2[(4'ha):(2'h2)])
        begin
          reg19 <= wire1;
        end
      else
        begin
          reg19 <= wire1;
          reg20 <= $unsigned(reg18[(4'hf):(3'h7)]);
          reg21 <= {($unsigned(((wire12 < (8'hbf)) ?
                  (&wire5) : $signed(reg17))) ^ (7'h43))};
          reg22 <= reg18;
        end
    end
  assign wire23 = reg18;
  assign wire24 = ($signed(((wire1[(2'h2):(2'h2)] ^~ $unsigned(wire5)) + $unsigned((wire13 ?
                      wire8 : (8'haf))))) ~^ (($unsigned((wire6 + reg18)) ^~ (!wire13)) ?
                      wire23 : wire0[(4'he):(2'h2)]));
endmodule
