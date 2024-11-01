module top
#(parameter param16 = (~&{((((8'ha9) ? (8'h9c) : (8'hb8)) ? (+(8'hbb)) : (8'hab)) == (((8'hbc) >= (8'h9f)) ? (^~(8'hb7)) : ((8'h9c) * (8'h9e))))}), 
parameter param17 = ({param16} ~^ {param16}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire5,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (wire0 >> $unsigned((!($unsigned(wire0) ^ $unsigned((8'hab))))));
  always
    @(posedge clk) begin
      reg6 <= $signed($signed($signed(($unsigned(wire4) >= $signed((8'h9e))))));
      reg7 <= $signed($unsigned(((((8'hb5) ? (8'h9c) : wire3) ?
          (wire4 ^~ (8'h9c)) : (wire5 ?
              wire4 : wire0)) ~^ (^((8'hac) >> reg6)))));
      reg8 <= $signed((|$unsigned(((8'ha9) ?
          $signed(wire0) : wire2[(3'h7):(3'h7)]))));
      if ($unsigned(($signed(reg6) ?
          (wire2[(1'h1):(1'h0)] ? wire0[(3'h5):(1'h0)] : wire5) : {((reg8 ?
                  (8'ha4) : reg6) ~^ (reg8 ? reg6 : reg8)),
              $signed($unsigned(wire3))})))
        begin
          reg9 <= ($signed(($signed($signed(wire1)) ?
              wire0 : wire3[(1'h0):(1'h0)])) << (^wire3));
          reg10 <= $signed((~^wire4[(4'hc):(3'h5)]));
          reg11 <= reg7;
        end
      else
        begin
          reg9 <= $unsigned(wire5);
        end
    end
  assign wire12 = (~&(~&wire3));
  assign wire13 = ((^~wire4) ?
                      $signed((~^(~&((8'hae) != wire1)))) : $signed(wire0));
  assign wire14 = $unsigned($unsigned($signed(((reg10 ?
                      reg8 : reg6) || (reg10 >= reg8)))));
  assign wire15 = {(~reg10[(3'h7):(2'h2)])};
endmodule
