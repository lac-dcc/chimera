module top
#(parameter param41 = {(~(~^(~^(~(8'ha0)))))}, 
parameter param42 = ((8'hbd) <= {(((8'hb5) * (param41 < param41)) ? (8'ha1) : param41)}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire36;
  assign y = {wire40, wire39, wire38, wire4, wire5, wire36, (1'h0)};
  assign wire4 = ($unsigned($signed((~^$unsigned((8'ha1))))) ^~ ((^~($signed(wire3) ?
                         (+wire2) : wire1[(1'h0):(1'h0)])) ?
                     $unsigned($signed((wire3 ?
                         wire2 : (8'haa)))) : wire2[(4'h8):(3'h7)]));
  assign wire5 = $signed((((-(!wire0)) ?
                         {$signed(wire0),
                             {wire2, wire2}} : wire2[(2'h3):(1'h1)]) ?
                     wire3 : wire1[(3'h5):(1'h0)]));
  module6 #() modinst37 (wire36, clk, wire0, wire1, wire4, wire5, wire3);
  assign wire38 = ((((wire1 ?
                              (wire36 && wire2) : wire3[(3'h6):(3'h6)]) << wire2) ?
                          ((+(wire1 ? wire1 : wire4)) ?
                              $unsigned($signed(wire4)) : wire3[(3'h4):(3'h4)]) : $unsigned({(wire1 <= wire3)})) ?
                      wire4[(4'he):(2'h3)] : wire4[(2'h3):(1'h0)]);
  assign wire39 = wire4;
  assign wire40 = wire2;
endmodule

module module6
#(parameter param34 = (8'hba), 
parameter param35 = (~|param34))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire12 = $unsigned((wire9[(4'h9):(3'h7)] ^~ (wire8 ?
                      wire10 : (8'hbd))));
  assign wire13 = $signed(wire7[(2'h2):(2'h2)]);
  assign wire14 = $signed((~^(wire9[(2'h3):(1'h1)] ?
                      (wire11 ?
                          $signed(wire8) : $unsigned(wire13)) : $unsigned($signed((8'ha2))))));
  assign wire15 = $unsigned((((8'hb3) ?
                          ($signed(wire14) ~^ $signed(wire8)) : wire14) ?
                      wire10[(3'h4):(1'h0)] : wire7));
  assign wire16 = $unsigned((^~(|$unsigned(((8'ha7) ? (8'h9e) : wire15)))));
  assign wire17 = $signed((&{$signed(wire13),
                      $unsigned(wire8[(2'h2):(1'h0)])}));
  assign wire18 = $unsigned(wire11[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg19 <= wire14;
      reg20 <= (wire15[(2'h2):(1'h0)] ~^ (!$signed($signed((wire13 > wire17)))));
      if ($unsigned($unsigned((wire8[(4'h9):(3'h6)] ?
          wire18[(3'h7):(3'h4)] : wire13))))
        begin
          reg21 <= wire10[(3'h5):(3'h5)];
          if ($signed(wire11))
            begin
              reg22 <= ((wire14[(2'h3):(1'h1)] << (^$signed($unsigned(wire11)))) >= {wire12[(1'h1):(1'h0)]});
            end
          else
            begin
              reg22 <= $signed($signed((wire12 | $signed((-reg21)))));
              reg23 <= $unsigned($unsigned({((wire12 | wire13) <<< $signed((8'hac)))}));
            end
          reg24 <= ((reg20[(4'h8):(1'h1)] ?
                  (wire8 <= ((|(7'h43)) ?
                      wire16[(4'h9):(4'h8)] : $signed(wire8))) : ($signed(wire17) ?
                      $unsigned($unsigned(wire13)) : ((wire11 ?
                          wire18 : wire12) - (wire8 | (8'ha5))))) ?
              (!$signed(wire10)) : (~{$unsigned(wire12)}));
          if ($signed((~^$signed({wire11, $unsigned(reg20)}))))
            begin
              reg25 <= $unsigned($signed({$unsigned(((8'ha0) ?
                      reg19 : wire14))}));
              reg26 <= $unsigned({(~&$unsigned((reg23 ? wire7 : reg22)))});
              reg27 <= $unsigned($signed($signed(wire15[(1'h1):(1'h0)])));
              reg28 <= wire10[(2'h2):(2'h2)];
            end
          else
            begin
              reg25 <= $signed($signed(((wire13 * (wire9 ?
                  wire16 : wire16)) >> reg24)));
              reg26 <= reg19[(1'h0):(1'h0)];
              reg27 <= (((~{wire12[(2'h2):(1'h1)]}) ?
                  $unsigned(reg27) : wire13[(2'h2):(2'h2)]) | $signed({wire18}));
              reg28 <= wire10[(3'h5):(2'h3)];
              reg29 <= wire17;
            end
        end
      else
        begin
          if (wire13[(4'hd):(2'h2)])
            begin
              reg21 <= (reg20 - $unsigned((reg23[(3'h5):(3'h5)] ?
                  (~&(wire7 ? reg27 : wire15)) : (+reg27))));
              reg22 <= (reg19[(2'h3):(1'h0)] ?
                  {$signed((^~(!wire8))),
                      $signed(wire10[(1'h1):(1'h1)])} : $unsigned(reg26));
              reg23 <= ((wire9 || $unsigned(((wire8 ? wire11 : reg25) ?
                      wire12[(3'h4):(1'h0)] : (wire8 ? reg19 : (8'hb8))))) ?
                  (!(wire14 ?
                      reg19[(4'h8):(3'h4)] : (^~$signed(reg25)))) : $signed($unsigned({{wire15,
                          wire10}})));
              reg24 <= {wire15, (+$signed(reg22))};
            end
          else
            begin
              reg21 <= reg21[(3'h7):(1'h1)];
              reg22 <= (wire10[(3'h5):(2'h3)] + reg28);
              reg23 <= ($signed((|(~reg20[(2'h3):(2'h2)]))) == ((^$unsigned($signed((8'hbe)))) - $signed((wire10 + wire18[(4'hc):(2'h2)]))));
              reg24 <= {wire10, $signed($signed($signed(reg24)))};
              reg25 <= (^(~^(~|$unsigned($signed(reg23)))));
            end
          reg26 <= $unsigned(($unsigned($unsigned(reg22[(3'h5):(1'h1)])) * (($unsigned((8'ha3)) == (reg25 & reg27)) && (reg23[(3'h5):(1'h1)] ?
              (|wire17) : wire7))));
          reg27 <= ((wire11[(4'h8):(3'h4)] ? (wire11 << wire8) : reg19) ?
              $unsigned(reg20[(2'h3):(1'h0)]) : reg28[(4'hd):(4'hc)]);
          reg28 <= {(^(-{(reg24 ? reg26 : reg20), {(8'hb4), reg23}})),
              ((|wire12) - (+wire18))};
          reg29 <= (($unsigned(($signed(reg24) > (!reg27))) >> $unsigned($unsigned($unsigned(wire17)))) ?
              $signed(wire14[(1'h0):(1'h0)]) : reg20[(3'h6):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg30 <= $unsigned($unsigned(($unsigned((wire11 ? wire8 : wire9)) ?
          $signed(wire14) : $signed({wire10}))));
      reg31 <= $signed(wire7[(2'h3):(2'h3)]);
      reg32 <= $signed(wire14);
      reg33 <= ((^(+$unsigned((wire13 >= wire18)))) | (wire10 ~^ reg27[(2'h2):(2'h2)]));
    end
endmodule
