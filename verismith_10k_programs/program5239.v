module top
#(parameter param17 = (((+{((8'h9c) != (7'h40)), {(7'h42)}}) ? ((^(!(8'haa))) ? (((8'ha6) ? (8'hb3) : (7'h43)) ? (7'h43) : (8'hb5)) : (~|(8'hbc))) : ({(!(8'hbe)), ((8'ha1) ^~ (8'ha9))} ? (((8'ha9) < (8'haa)) * ((8'ha0) & (8'h9c))) : {((8'ha4) ^~ (8'hb5))})) ? ({(8'haf), (~&(^(8'hb0)))} | (~|({(8'ha6)} ? (^~(8'hbb)) : (8'hbe)))) : (-{((~&(8'haa)) > ((7'h42) + (8'hbc))), (~(^(8'hb2)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  assign y = {wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = (~&wire2[(4'hd):(3'h6)]);
  assign wire5 = wire1[(1'h1):(1'h1)];
  assign wire6 = ((wire3 | $signed($signed({wire3}))) >> $signed((({wire2} << wire5) ?
                     ($unsigned(wire2) ?
                         $unsigned(wire4) : $unsigned(wire4)) : ($unsigned(wire4) << $unsigned(wire1)))));
  assign wire7 = wire4;
  assign wire8 = wire6[(4'h8):(2'h3)];
  assign wire9 = $unsigned((&$signed($unsigned({wire2}))));
  assign wire10 = (wire2[(4'hd):(3'h4)] ^~ (({$signed((8'h9d)),
                      ((8'hbb) - (8'hb3))} ~^ $unsigned(wire7[(4'ha):(4'h9)])) || (-wire8)));
  assign wire11 = wire1[(4'hc):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= $signed((((&$unsigned(wire4)) << {$unsigned(wire0)}) >>> {wire2[(4'hb):(3'h6)]}));
      if ((&wire8[(1'h0):(1'h0)]))
        begin
          reg13 <= (&(7'h40));
          reg14 <= {wire6,
              $unsigned(($signed(wire6[(1'h0):(1'h0)]) >= ({wire6, wire4} ?
                  $unsigned(wire4) : wire8[(3'h7):(3'h7)])))};
          reg15 <= ((&({wire9, {(8'h9c), wire0}} > (((8'hb7) ?
                      wire6 : (7'h44)) ?
                  $signed(wire6) : wire3))) ?
              reg13 : wire5);
        end
      else
        begin
          reg13 <= $signed((wire9 << wire0));
        end
    end
  assign wire16 = wire4[(4'h8):(1'h0)];
endmodule
