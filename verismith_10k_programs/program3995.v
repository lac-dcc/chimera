module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = wire5[(2'h2):(1'h1)];
  assign wire7 = wire1[(1'h1):(1'h0)];
  module8 #() modinst40 (.y(wire39), .wire12(wire2), .clk(clk), .wire9(wire1), .wire11(wire3), .wire10(wire5));
  assign wire41 = (~wire39[(2'h2):(1'h1)]);
  assign wire42 = {wire7[(1'h0):(1'h0)], (~wire6)};
  assign wire43 = $unsigned((^~$signed($signed((~(8'h9d))))));
  assign wire44 = wire7[(1'h1):(1'h1)];
  assign wire45 = (|(^wire4[(1'h1):(1'h1)]));
  assign wire46 = (wire3 << ({({wire42, wire43} | $signed(wire39)),
                      $signed(wire5)} | wire2));
  assign wire47 = wire5;
  assign wire48 = $signed(((|(&$unsigned(wire44))) ?
                      (((wire47 ? wire44 : wire7) ?
                          $unsigned(wire46) : wire5[(4'he):(4'he)]) <<< (wire2 < (wire39 ?
                          wire3 : (8'hb5)))) : (wire3[(4'he):(1'h0)] ^~ wire39[(2'h2):(1'h1)])));
  assign wire49 = wire42[(1'h0):(1'h0)];
  assign wire50 = $signed(wire41[(2'h2):(1'h0)]);
endmodule

module module8
#(parameter param37 = {((~|((+(8'hbc)) ? ((7'h40) ~^ (7'h44)) : (-(8'hbd)))) ? {((8'h9c) + ((8'hb1) >> (8'hb0)))} : (!(~&((8'haf) << (8'hb0))))), {((~^((7'h40) <= (8'ha8))) ? (((8'h9f) ? (7'h40) : (8'hb8)) ? ((8'ha7) ? (7'h43) : (8'h9d)) : ((8'hb3) ? (8'hab) : (7'h42))) : (((8'hbd) >> (8'ha0)) - ((8'hb1) - (8'ha9)))), ((((8'ha7) | (8'ha1)) ? {(8'hb6)} : ((8'ha1) > (8'hb8))) + (-((8'hb8) < (8'ha3))))}}, 
parameter param38 = (((({param37} << param37) ? param37 : (-(param37 | (8'ha3)))) << (^~param37)) ? (8'ha7) : (~|((((8'ha8) <<< (8'haf)) ? {param37, (8'had)} : (~|param37)) ? (+{param37}) : (~(param37 ? param37 : param37))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg35,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~^(wire12 ^ (wire11 ?
          (!wire10[(4'hc):(3'h4)]) : $unsigned(wire11[(5'h10):(4'hc)])))))
        begin
          reg13 <= wire10[(4'hc):(4'hc)];
          reg14 <= wire9;
        end
      else
        begin
          reg13 <= $signed({wire10});
          reg14 <= wire10;
          reg15 <= wire9;
          reg16 <= $signed($unsigned($unsigned(({wire12, reg15} ?
              reg15 : reg14[(2'h2):(1'h0)]))));
          reg17 <= $unsigned($unsigned($unsigned(((wire9 + reg14) * (&reg15)))));
        end
      reg18 <= reg17[(4'ha):(2'h3)];
      reg19 <= reg17[(4'hb):(4'ha)];
      if ($signed($unsigned($unsigned(wire12[(1'h1):(1'h0)]))))
        begin
          reg20 <= (~(|$unsigned(({wire12} ?
              (reg14 ? wire11 : reg18) : $signed(reg13)))));
          reg21 <= ($unsigned(wire11) ?
              $unsigned($signed((-$signed((8'hb9))))) : (reg18 ?
                  {((wire11 > wire12) >>> $unsigned(reg20))} : ($unsigned((reg16 >> (8'hb1))) << ((!reg19) ?
                      reg14 : (reg20 ? reg13 : wire9)))));
        end
      else
        begin
          reg20 <= $unsigned($signed((-(&reg21))));
          reg21 <= (($unsigned({$signed(reg19)}) + {wire11}) < (($signed($unsigned((8'ha8))) <<< (|$unsigned(reg18))) >>> {$signed(((8'ha1) ~^ wire12))}));
          reg22 <= (reg19 ?
              $unsigned($unsigned({(reg18 > reg17),
                  $signed((8'hb6))})) : reg20[(2'h2):(1'h0)]);
        end
      if ((((&$signed({(8'hab), (8'hba)})) >>> wire10[(4'ha):(2'h2)]) ?
          $unsigned({$signed(wire11[(4'hd):(2'h2)])}) : wire12[(1'h0):(1'h0)]))
        begin
          reg23 <= ((~|$signed($unsigned(((8'hbc) != reg13)))) ?
              reg18 : ($unsigned(reg17[(2'h3):(1'h0)]) * (~^(|wire9))));
          if ((((~&((wire9 ? wire12 : (8'hae)) ?
                      reg18[(4'hc):(3'h4)] : (~wire9))) ?
                  wire10[(3'h7):(2'h3)] : reg14) ?
              (+$unsigned($signed((&reg18)))) : reg14[(4'h9):(3'h6)]))
            begin
              reg24 <= reg22;
              reg25 <= ($signed((|((!reg16) * $unsigned(reg14)))) <<< ((reg19 | (reg16 | $unsigned(reg24))) ?
                  (((reg13 ? wire12 : reg24) ?
                      (reg13 ? reg13 : reg20) : (reg16 != wire9)) && {(reg13 ?
                          reg16 : (8'hbd)),
                      {wire9, wire12}}) : $unsigned((~|$unsigned(wire9)))));
              reg26 <= (&wire12);
              reg27 <= wire11[(2'h2):(2'h2)];
            end
          else
            begin
              reg24 <= (^~wire9[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg23 <= $unsigned((+(({reg18} ?
              reg19[(4'he):(2'h2)] : ((8'hbe) << reg25)) ^ $signed((~^wire11)))));
          reg24 <= $signed(($unsigned(reg20[(3'h5):(2'h3)]) == ((-{wire11}) ?
              ($signed(wire11) ?
                  (reg24 ^~ reg22) : wire10[(4'h9):(3'h5)]) : $signed($signed((8'ha7))))));
        end
    end
  assign wire28 = {((|(reg26[(3'h7):(3'h7)] || {reg21, reg21})) != ((~{reg23,
                          reg20}) != ($signed(reg26) != $unsigned(reg22))))};
  assign wire29 = (~&(8'hb4));
  assign wire30 = reg15;
  assign wire31 = $unsigned({wire28, reg20});
  assign wire32 = {((-reg19) - ((&(reg24 ^ reg15)) ?
                          $unsigned((&reg26)) : reg14)),
                      (~wire30)};
  assign wire33 = reg26[(4'h8):(3'h6)];
  assign wire34 = reg22;
  always
    @(posedge clk) begin
      reg35 <= wire11;
    end
  assign wire36 = wire11[(1'h0):(1'h0)];
endmodule
