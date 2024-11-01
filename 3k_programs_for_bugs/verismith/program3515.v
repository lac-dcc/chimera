module top
#(parameter param211 = (((8'ha5) <= (^~{((7'h42) != (8'haa))})) > (~^(~|{(~&(8'ha3))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h26b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire197;
  wire signed [(5'h14):(1'h0)] wire209;
  reg signed [(2'h2):(1'h0)] reg208 = (1'h0);
  reg [(5'h12):(1'h0)] reg207 = (1'h0);
  reg [(3'h5):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg204 = (1'h0);
  reg [(5'h14):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg202 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg [(2'h2):(1'h0)] reg200 = (1'h0);
  reg [(4'h9):(1'h0)] reg199 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  assign y = {wire65,
                 wire5,
                 wire4,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire197,
                 wire209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 (1'h0)};
  assign wire4 = $signed({(($signed(wire1) ?
                         (wire0 ?
                             (8'hb7) : wire1) : (^~wire3)) && wire3[(2'h3):(2'h3)]),
                     ({(wire0 ? wire3 : wire3),
                         (wire0 ?
                             wire1 : wire2)} ~^ $signed(wire0[(4'ha):(3'h5)]))});
  assign wire5 = ($signed($signed((^wire2[(4'h8):(3'h7)]))) - {wire2});
  always
    @(posedge clk) begin
      reg6 <= ((~&wire4[(5'h11):(4'h8)]) - wire4);
      if ((wire4[(4'he):(2'h2)] ?
          {wire1} : {(wire0 ? $unsigned($signed(wire1)) : wire4)}))
        begin
          reg7 <= $unsigned(reg6[(3'h4):(2'h2)]);
          if (($unsigned(($unsigned($unsigned(wire2)) ?
              $signed((~&wire3)) : ((wire5 << wire1) + (wire5 ?
                  wire1 : (8'ha7))))) > wire0))
            begin
              reg8 <= reg7;
            end
          else
            begin
              reg8 <= ((-wire0[(3'h6):(3'h4)]) * $unsigned({{wire1,
                      reg6[(2'h3):(2'h2)]},
                  wire2[(2'h2):(1'h1)]}));
              reg9 <= (wire4 || reg8[(5'h12):(4'h9)]);
              reg10 <= $unsigned(($unsigned(($unsigned(wire1) ?
                      (wire3 ? (8'hbe) : wire3) : wire0)) ?
                  wire0 : ($signed((~^wire3)) * wire2[(5'h11):(3'h7)])));
              reg11 <= (reg10 == $unsigned($signed((^$unsigned(reg6)))));
              reg12 <= $signed(wire4[(4'hb):(3'h5)]);
            end
          reg13 <= $signed(reg7[(2'h2):(1'h1)]);
        end
      else
        begin
          reg7 <= $unsigned(wire2);
        end
    end
  module14 #() modinst66 (wire65, clk, reg13, wire3, reg7, wire2, wire0);
  always
    @(posedge clk) begin
      if ((reg6[(3'h7):(3'h5)] ? $signed($unsigned($unsigned(wire4))) : reg9))
        begin
          reg67 <= (~(|(({reg13} <= {reg12}) || wire3)));
        end
      else
        begin
          reg67 <= $unsigned($signed(((~^$unsigned(wire3)) - wire2[(4'he):(3'h6)])));
          reg68 <= (8'hbf);
        end
      reg69 <= reg11;
      if ($unsigned(((((7'h44) ? $unsigned((8'ha1)) : {(7'h44), (8'hb2)}) ?
          ({reg68} == {wire4}) : ((-reg6) != (~^(8'hb7)))) >= (($unsigned(wire65) << $unsigned((8'h9c))) & wire2))))
        begin
          reg70 <= wire3;
          reg71 <= (wire5 < (|reg7[(2'h3):(2'h2)]));
        end
      else
        begin
          reg70 <= wire5[(4'h9):(2'h2)];
          reg71 <= reg68;
          reg72 <= wire4[(4'h9):(4'h9)];
          if ({(reg13 ?
                  (wire0 * reg70[(4'h8):(2'h3)]) : ((8'hb9) ?
                      $signed($unsigned((8'h9c))) : $unsigned(((8'hb3) > reg67))))})
            begin
              reg73 <= reg11;
              reg74 <= (&$unsigned($signed(reg7[(3'h5):(1'h1)])));
              reg75 <= ((reg69 * (reg9[(4'h9):(3'h6)] ?
                  $signed($unsigned(reg7)) : ((wire2 ?
                      wire1 : (8'haa)) >= (~^wire0)))) <= (^~({$unsigned((8'hbb))} ^~ reg8)));
              reg76 <= (+$signed($signed($unsigned((~^reg71)))));
              reg77 <= $unsigned($signed($unsigned({(^~reg73)})));
            end
          else
            begin
              reg73 <= (~((^reg70) ? reg10[(1'h1):(1'h1)] : (|reg8)));
              reg74 <= reg7[(3'h4):(2'h2)];
            end
        end
      reg78 <= (((wire3 == reg75) || (+((~^wire2) > wire1))) ?
          $unsigned(reg8[(3'h6):(1'h1)]) : reg7[(2'h3):(1'h0)]);
      reg79 <= ({$unsigned(reg73),
              (|(reg75[(5'h11):(5'h10)] ?
                  $unsigned(reg75) : $unsigned(wire5)))} ?
          (~&{reg67}) : (~&reg74));
    end
  assign wire80 = $signed((^~$unsigned((&wire2[(4'h9):(2'h2)]))));
  assign wire81 = wire65[(4'hc):(3'h4)];
  assign wire82 = (~&$unsigned(reg13[(4'hb):(3'h4)]));
  assign wire83 = ($signed(reg6[(3'h6):(3'h6)]) ?
                      ({($signed(reg13) - wire3[(5'h11):(4'ha)])} ?
                          (~^$unsigned($signed(wire3))) : ((|reg7) - wire4[(3'h5):(3'h4)])) : (8'had));
  assign wire84 = ((~^$unsigned((8'hbe))) != reg6[(3'h7):(3'h5)]);
  assign wire85 = ((((reg76 <= (~reg75)) || $signed((wire4 ^~ reg75))) ?
                          ($unsigned(reg67[(1'h1):(1'h1)]) + wire81) : reg77) ?
                      (wire80 ?
                          reg11[(3'h7):(3'h7)] : reg12[(2'h2):(1'h0)]) : $signed((((wire84 - reg73) ?
                          reg11 : (|wire0)) | $signed((~|reg69)))));
  assign wire86 = (wire1 | (~{$signed(((8'hb9) ? wire1 : reg13)),
                      ((wire84 ? wire0 : wire0) || $unsigned(wire1))}));
  assign wire87 = reg7;
  assign wire88 = wire0;
  module89 #() modinst198 (.clk(clk), .y(wire197), .wire92(wire4), .wire91(reg12), .wire94(wire88), .wire93(wire80), .wire90(wire86));
  always
    @(posedge clk) begin
      if (reg74[(4'ha):(3'h6)])
        begin
          reg199 <= reg68;
          reg200 <= (!$unsigned((reg6[(1'h0):(1'h0)] ?
              reg75 : {$signed(reg78)})));
        end
      else
        begin
          reg199 <= wire65;
          reg200 <= (!(($unsigned($unsigned(wire83)) ^ (^{reg69,
              wire1})) | $signed(({reg11, reg9} | ((8'ha0) ? wire81 : reg6)))));
        end
      reg201 <= $signed((wire3 | ($signed($unsigned(wire1)) ?
          ($unsigned(reg8) + (-wire5)) : $signed(reg200[(1'h1):(1'h0)]))));
      reg202 <= $unsigned((&wire80[(4'hb):(3'h5)]));
      if ($unsigned(((|{(+wire3), $signed((8'hbc))}) >= wire2[(5'h12):(3'h6)])))
        begin
          reg203 <= $unsigned(wire197);
        end
      else
        begin
          reg203 <= reg201[(5'h12):(3'h5)];
          reg204 <= $signed((8'hbc));
          reg205 <= (reg204 ?
              ((~|wire0) ? (8'haa) : (!(!(8'hb3)))) : $unsigned(wire82));
          reg206 <= {((!(reg200 ? ((8'hbf) << reg7) : reg9[(4'hc):(1'h1)])) ?
                  ($signed($signed(wire83)) < reg10[(1'h0):(1'h0)]) : reg201[(5'h13):(4'h9)])};
          reg207 <= reg70;
        end
      reg208 <= ((reg203 ?
              reg68 : (((+(8'had)) ?
                  $signed(wire81) : {reg201, wire5}) << (^~$unsigned(reg73)))) ?
          reg9 : $unsigned(reg204));
    end
  module89 #() modinst210 (.y(wire209), .wire90(reg203), .wire92(wire88), .wire93(reg74), .wire91(reg79), .clk(clk), .wire94(reg8));
endmodule

module module89  (y, clk, wire90, wire91, wire92, wire93, wire94);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire90;
  input wire [(5'h14):(1'h0)] wire91;
  input wire signed [(5'h15):(1'h0)] wire92;
  input wire signed [(4'h9):(1'h0)] wire93;
  input wire [(4'hb):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire196;
  wire signed [(4'hf):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire194;
  wire [(4'h9):(1'h0)] wire192;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire153;
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire192,
                 wire95,
                 wire96,
                 wire153,
                 (1'h0)};
  assign wire95 = (wire90[(1'h0):(1'h0)] >= (wire91 ?
                      wire90 : wire90[(2'h2):(1'h0)]));
  assign wire96 = $unsigned((wire95[(2'h3):(2'h3)] & (^~($unsigned(wire90) - wire93))));
  module97 #() modinst154 (.wire101(wire90), .wire100(wire94), .wire102(wire92), .clk(clk), .wire99(wire91), .wire98(wire96), .y(wire153));
  module155 #() modinst193 (wire192, clk, wire153, wire95, wire92, wire91);
  assign wire194 = wire93;
  assign wire195 = (^wire92);
  assign wire196 = (wire192[(3'h7):(3'h4)] ? wire90 : wire90[(5'h10):(5'h10)]);
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  assign y = {wire64,
                 wire62,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire22,
                 wire21,
                 wire20,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire20 = $signed((wire17[(2'h2):(1'h1)] ?
                      wire18 : (&{$unsigned(wire19)})));
  assign wire21 = (wire15[(2'h2):(1'h0)] ?
                      wire20[(4'h9):(3'h5)] : $unsigned((8'ha8)));
  assign wire22 = $unsigned($signed($unsigned(wire20[(4'hb):(2'h2)])));
  always
    @(posedge clk) begin
      if (({$unsigned(wire15)} ?
          $signed($unsigned($unsigned({wire15}))) : $unsigned(($unsigned((7'h44)) ?
              wire22 : (^(+wire21))))))
        begin
          reg23 <= ($signed($unsigned($signed((wire17 ^ wire21)))) | $unsigned(((-{wire15}) < wire19)));
          reg24 <= (+(wire22[(4'hf):(4'h8)] != (7'h43)));
          if (wire21)
            begin
              reg25 <= $unsigned((($unsigned($signed(wire16)) ?
                  reg24[(2'h2):(1'h1)] : {reg23,
                      $signed(reg23)}) < (wire18[(1'h0):(1'h0)] >= {(~reg24)})));
              reg26 <= {reg24[(2'h2):(1'h1)]};
              reg27 <= (reg25 + (reg24 && reg23[(3'h6):(3'h5)]));
              reg28 <= ((~$unsigned($signed((&reg26)))) || $signed((|wire19)));
            end
          else
            begin
              reg25 <= {$unsigned($signed(wire15))};
            end
        end
      else
        begin
          reg23 <= $signed(wire17[(3'h4):(2'h3)]);
          if ($signed(($unsigned($signed({(7'h44)})) ?
              ((reg25[(2'h2):(1'h0)] & $signed(wire15)) ?
                  (~{(8'ha2)}) : (8'ha7)) : (+(&{(8'h9d)})))))
            begin
              reg24 <= (&($unsigned(((wire22 ?
                  reg24 : reg25) >>> wire22[(3'h4):(2'h2)])) ~^ reg23[(4'hc):(4'h9)]));
            end
          else
            begin
              reg24 <= ({$signed((-$unsigned((8'h9e))))} ?
                  $signed(((&(wire17 | wire16)) ?
                      $unsigned((8'hb1)) : reg27)) : $signed(wire20[(5'h14):(4'hb)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg29 <= $unsigned((~^(reg24 + wire18[(1'h1):(1'h1)])));
    end
  assign wire30 = reg23;
  assign wire31 = $unsigned($unsigned($unsigned(($unsigned(wire20) ?
                      (&reg24) : (reg29 ? wire30 : (8'hb9))))));
  assign wire32 = reg29[(5'h15):(3'h5)];
  assign wire33 = ((reg26[(1'h1):(1'h1)] ?
                          $unsigned(reg26) : $signed({((8'hb4) * reg29),
                              $signed(wire18)})) ?
                      wire17[(2'h3):(2'h2)] : (-($unsigned(wire32) ?
                          wire18 : $signed(wire19))));
  assign wire34 = wire22[(4'h8):(2'h3)];
  assign wire35 = wire22[(4'hd):(4'ha)];
  assign wire36 = $unsigned($unsigned((~^((wire20 ? (8'hb9) : reg29) ?
                      wire21 : {wire30, wire16}))));
  module37 #() modinst63 (wire62, clk, wire36, wire22, wire32, wire33, reg26);
  assign wire64 = $unsigned($unsigned(wire36));
endmodule

module module37
#(parameter param60 = (((((&(8'h9e)) ^ ((8'ha8) ? (8'hb3) : (8'ha6))) ? (((7'h44) ? (8'hab) : (8'hb5)) ? {(8'ha6), (8'hbf)} : ((8'hb4) | (7'h41))) : (-(|(8'hb6)))) >> (8'hb7)) ? (!(~({(8'hab)} ~^ ((8'hb1) ? (8'ha3) : (8'h9d))))) : {({{(8'hbd)}} != (~|(|(8'hbe))))}), 
parameter param61 = ((!(^~param60)) ? ((~|{((8'ha1) | param60), (+param60)}) + {{(param60 > param60), (param60 & (8'hb7))}}) : (+{param60, ((^~param60) ? ((8'hb3) ? param60 : (8'hbb)) : (param60 ? param60 : (8'ha1)))})))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire42;
  input wire [(4'he):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire signed [(5'h14):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire48,
                 wire44,
                 wire43,
                 reg51,
                 reg50,
                 reg49,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire43 = $signed($unsigned((($unsigned((8'h9f)) >>> $unsigned(wire42)) >> ((~wire39) >= ((8'ha3) ?
                      wire41 : wire42)))));
  assign wire44 = ($unsigned(((8'hbd) < ((wire40 || wire39) ?
                          $signed(wire41) : wire43[(3'h4):(2'h3)]))) ?
                      {wire43[(3'h5):(2'h3)]} : wire40);
  always
    @(posedge clk) begin
      reg45 <= (wire40[(1'h0):(1'h0)] > wire42[(3'h6):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg46 <= wire39;
      reg47 <= $unsigned(wire41[(3'h7):(3'h7)]);
    end
  assign wire48 = (wire42[(1'h1):(1'h0)] ^ wire41[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg49 <= reg47[(2'h2):(1'h0)];
      reg50 <= wire38;
      reg51 <= reg45[(1'h0):(1'h0)];
    end
  assign wire52 = ($unsigned(((+(reg45 * reg51)) ^ ($signed(wire41) >>> wire48))) ?
                      reg45 : $unsigned(wire41[(2'h2):(1'h1)]));
  assign wire53 = (($signed(reg46) ?
                      reg47[(3'h5):(1'h1)] : (({wire39} ?
                              (reg47 ? reg47 : wire40) : {reg46}) ?
                          $unsigned((wire48 < reg51)) : ((wire38 ?
                              wire41 : wire43) | (wire43 ?
                              reg47 : (8'ha0))))) && (((reg49 == (wire48 ?
                      wire52 : wire52)) >= (~|wire48)) >> {reg50[(4'hb):(4'h8)],
                      {(reg47 * reg45), $signed(reg51)}}));
  assign wire54 = (~|$unsigned((wire38[(2'h2):(1'h0)] >> (+reg50[(5'h12):(4'h9)]))));
  assign wire55 = (8'hac);
  assign wire56 = reg47;
  assign wire57 = (!(&$signed((((7'h42) ?
                      reg46 : wire42) & wire53[(2'h2):(2'h2)]))));
  assign wire58 = {(&{(+wire53[(3'h7):(1'h0)])})};
  assign wire59 = (^wire43);
endmodule

module module155  (y, clk, wire159, wire158, wire157, wire156);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire159;
  input wire signed [(3'h4):(1'h0)] wire158;
  input wire signed [(3'h7):(1'h0)] wire157;
  input wire [(5'h14):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire [(5'h11):(1'h0)] wire189;
  wire [(4'h8):(1'h0)] wire178;
  wire signed [(4'hb):(1'h0)] wire177;
  wire signed [(4'hd):(1'h0)] wire176;
  wire [(3'h7):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire174;
  wire [(4'he):(1'h0)] wire173;
  wire [(5'h12):(1'h0)] wire172;
  wire [(4'hd):(1'h0)] wire171;
  wire [(2'h2):(1'h0)] wire170;
  wire [(4'hf):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire signed [(4'hc):(1'h0)] wire165;
  wire [(5'h10):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire162;
  wire [(5'h12):(1'h0)] wire161;
  wire [(5'h10):(1'h0)] wire160;
  reg [(4'he):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(3'h6):(1'h0)] reg183 = (1'h0);
  reg [(5'h10):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg181 = (1'h0);
  reg [(4'hd):(1'h0)] reg180 = (1'h0);
  reg [(4'ha):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg164,
                 (1'h0)};
  assign wire160 = (7'h42);
  assign wire161 = $unsigned(wire157[(3'h7):(2'h2)]);
  assign wire162 = (wire158[(3'h4):(2'h2)] ?
                       (&wire159[(3'h4):(1'h1)]) : wire160[(4'hd):(3'h5)]);
  assign wire163 = ($signed((((^wire157) + $unsigned(wire162)) <= ((wire161 ?
                           wire160 : wire159) ?
                       wire161[(3'h7):(1'h1)] : (-wire159)))) == $signed(wire158));
  always
    @(posedge clk) begin
      reg164 <= {({(~^wire159[(2'h2):(1'h0)])} <= ($unsigned($unsigned(wire157)) ?
              ((wire161 & wire156) > (wire158 & (7'h41))) : wire157))};
    end
  assign wire165 = ((({$unsigned(wire162)} ?
                           (wire157[(3'h5):(2'h2)] < (wire163 | wire160)) : $signed((wire163 ^ wire159))) < (wire160 ?
                           (reg164 ^ (^(8'ha4))) : (^~$signed(wire162)))) ?
                       $unsigned($signed($unsigned(reg164))) : (wire157 < wire162));
  assign wire166 = ((((((8'h9c) ? wire157 : (8'ha5)) >= $unsigned(wire165)) ?
                               $signed($unsigned(reg164)) : $unsigned((wire159 ?
                                   wire163 : wire159))) ?
                           (reg164[(3'h4):(1'h1)] <= wire162) : wire165[(3'h6):(3'h6)]) ?
                       wire161[(4'h8):(2'h3)] : ($unsigned((wire161 || $unsigned(wire158))) ?
                           wire156[(4'hd):(3'h4)] : reg164[(3'h6):(2'h2)]));
  assign wire167 = ((~$unsigned(($signed(wire162) | $unsigned(wire163)))) ~^ wire166[(2'h3):(1'h1)]);
  assign wire168 = $signed({(~$unsigned((^wire166)))});
  assign wire169 = {{wire158[(3'h4):(1'h1)],
                           (wire166 ?
                               (wire161[(4'ha):(4'ha)] - (-wire168)) : $signed((8'ha4)))},
                       $signed($unsigned(wire162[(5'h12):(5'h10)]))};
  assign wire170 = {($unsigned($unsigned(wire166)) <= $signed(((^~wire168) ?
                           $unsigned(wire168) : (wire157 ?
                               (8'ha4) : wire161)))),
                       ($unsigned(wire168[(4'ha):(2'h3)]) | ($unsigned((wire165 ?
                               wire161 : wire162)) ?
                           (~^$unsigned(reg164)) : ((wire167 ?
                                   wire160 : wire168) ?
                               $signed(reg164) : (wire162 >>> wire165))))};
  assign wire171 = ($signed(wire167[(1'h0):(1'h0)]) || wire160[(4'h8):(2'h2)]);
  assign wire172 = wire167[(1'h1):(1'h1)];
  assign wire173 = (wire160[(4'h8):(2'h3)] < $unsigned((!wire157)));
  assign wire174 = $unsigned($unsigned(wire157));
  assign wire175 = wire157;
  assign wire176 = reg164;
  assign wire177 = wire170[(1'h0):(1'h0)];
  assign wire178 = {wire170, wire163[(3'h4):(2'h2)]};
  always
    @(posedge clk) begin
      if ((8'h9c))
        begin
          reg179 <= (((wire160 ?
              wire158 : ($unsigned((8'had)) ?
                  {wire174,
                      (7'h44)} : wire162[(4'hc):(4'hc)])) | wire175) >>> wire169[(4'ha):(4'h9)]);
          reg180 <= (((&$unsigned((wire175 ? wire171 : wire157))) ?
              (~&$unsigned(wire158)) : wire177) + (8'ha8));
          reg181 <= reg180;
          reg182 <= ((8'ha7) ?
              $unsigned((((wire173 == reg164) ? wire156 : $unsigned(wire175)) ?
                  wire161[(3'h4):(1'h1)] : (wire156 ?
                      (^(8'hb7)) : (reg180 > wire176)))) : wire165);
        end
      else
        begin
          reg179 <= (!($unsigned(({wire172} | (8'ha2))) >= reg182[(4'hd):(1'h1)]));
          reg180 <= ($signed((reg182[(4'hb):(2'h2)] < wire170[(1'h1):(1'h1)])) != ((($unsigned(wire173) ?
              $unsigned(wire169) : wire166) && $unsigned($unsigned(wire163))) - $unsigned((((8'hb3) ?
                  wire165 : wire175) ?
              (reg182 < wire178) : $unsigned(wire175)))));
          reg181 <= (~^reg181);
          if ({wire165, {(-{(wire169 ? wire160 : wire158)})}})
            begin
              reg182 <= {$signed(({(8'h9e)} ? wire165 : reg179))};
              reg183 <= (($signed(wire160) && wire173[(4'hd):(3'h4)]) ?
                  (&(^(wire177[(3'h5):(3'h4)] ?
                      (wire172 ^ wire157) : $unsigned(wire177)))) : (reg164 && wire157));
              reg184 <= $signed((wire175[(2'h2):(2'h2)] ~^ reg164));
              reg185 <= wire158;
              reg186 <= ((($signed($unsigned(wire174)) ^ (wire173 >> $signed(wire177))) ?
                  wire178 : $unsigned($unsigned($unsigned(wire167)))) <= (+wire174[(4'he):(4'h8)]));
            end
          else
            begin
              reg182 <= $unsigned((~^((reg182 ?
                  wire163[(4'hf):(1'h0)] : (wire178 ?
                      reg184 : reg182)) < reg183[(1'h1):(1'h1)])));
              reg183 <= (wire163[(4'ha):(3'h5)] ?
                  (~&{$signed($unsigned(reg164)),
                      reg184}) : reg164[(1'h0):(1'h0)]);
              reg184 <= wire159;
              reg185 <= $signed(($unsigned($unsigned((wire161 ?
                  reg184 : wire165))) * (^$unsigned((8'hb9)))));
            end
        end
      reg187 <= reg184[(4'hc):(3'h5)];
      reg188 <= $signed(wire160);
    end
  assign wire189 = reg183;
  assign wire190 = (-$signed((|reg180)));
  assign wire191 = (wire177 != $signed((wire190 ?
                       $unsigned((wire189 ? (8'hbb) : wire157)) : (8'hab))));
endmodule

module module97
#(parameter param152 = (8'had))
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h232):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire102;
  input wire [(4'h8):(1'h0)] wire101;
  input wire signed [(4'hb):(1'h0)] wire100;
  input wire signed [(4'hf):(1'h0)] wire99;
  input wire [(4'he):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire138;
  wire signed [(3'h6):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire103;
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire139,
                 wire138,
                 wire137,
                 wire114,
                 wire113,
                 wire112,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg151,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire103 = $signed((wire101[(1'h1):(1'h0)] >= wire98));
  assign wire104 = wire100;
  assign wire105 = ($signed($signed((~|(wire101 && wire98)))) ?
                       $signed((($signed(wire98) ?
                           {(8'hb5),
                               wire104} : wire102) + $signed({(8'hb9)}))) : $signed(wire99[(1'h0):(1'h0)]));
  assign wire106 = $signed($unsigned({wire104}));
  assign wire107 = (~|$unsigned(wire105));
  assign wire108 = wire101;
  always
    @(posedge clk) begin
      reg109 <= (+$signed(wire100[(3'h6):(3'h6)]));
      reg110 <= (^~wire98[(2'h3):(2'h3)]);
      reg111 <= (^{$signed(reg110[(1'h1):(1'h0)]),
          $signed($signed($signed((8'ha0))))});
    end
  assign wire112 = wire102;
  assign wire113 = (reg109 + (~|($signed(wire98) > $unsigned((wire108 ?
                       wire101 : wire100)))));
  assign wire114 = {(|wire106)};
  always
    @(posedge clk) begin
      if ((8'ha0))
        begin
          reg115 <= ((~|{$signed((~&wire101)),
              wire98[(1'h1):(1'h0)]}) | wire98[(4'hd):(4'h9)]);
          reg116 <= wire98;
          reg117 <= $unsigned($signed((wire108[(1'h0):(1'h0)] ?
              reg111 : ($signed((8'hb0)) ?
                  (~^wire108) : (wire114 == wire107)))));
          if ($signed({$unsigned($signed(wire98[(4'ha):(2'h2)])),
              reg110[(2'h2):(1'h0)]}))
            begin
              reg118 <= wire108;
              reg119 <= ((|wire103) && (reg115[(4'h8):(3'h5)] >>> reg110));
              reg120 <= $unsigned(wire105[(3'h4):(1'h1)]);
              reg121 <= $signed(((((wire112 ? (8'hb8) : wire106) ?
                      $unsigned((8'hb1)) : (reg109 * wire99)) ?
                  (^(reg119 <<< wire103)) : $signed((wire99 ?
                      (8'hae) : reg118))) > (((^~reg115) ?
                      (reg109 ? wire114 : (7'h44)) : $signed(reg110)) ?
                  {$unsigned(reg115),
                      (wire102 ? wire105 : wire107)} : ($unsigned(reg118) ?
                      $unsigned(reg116) : reg111[(4'h9):(4'h8)]))));
            end
          else
            begin
              reg118 <= ($signed(wire99) ?
                  (^~((&{wire104, (8'h9d)}) > ((wire98 ? reg111 : wire114) ?
                      (wire99 == reg120) : wire104[(2'h3):(2'h3)]))) : ((~|{$unsigned(reg119)}) | ((reg110[(4'h9):(3'h6)] ~^ (wire106 * wire101)) < $unsigned($signed(reg110)))));
            end
        end
      else
        begin
          reg115 <= reg120[(4'hb):(4'ha)];
          reg116 <= reg120[(4'hb):(4'ha)];
          reg117 <= $unsigned($signed((((&(8'hbd)) << (~|reg119)) ?
              ((wire98 == (8'hbb)) ?
                  wire105[(4'hb):(4'h8)] : (+reg111)) : ((reg119 ^ reg116) ?
                  $unsigned(wire104) : $signed((8'ha7))))));
          if (($unsigned($signed($signed(wire113))) ?
              reg118[(4'ha):(1'h0)] : (~|reg119[(4'hc):(4'hb)])))
            begin
              reg118 <= $unsigned((!$unsigned({(wire106 ? reg110 : wire99)})));
            end
          else
            begin
              reg118 <= wire102;
              reg119 <= (~&$unsigned(wire107[(3'h4):(2'h3)]));
              reg120 <= wire100;
              reg121 <= (-(reg109[(3'h7):(3'h5)] | $unsigned((wire108 + wire112))));
              reg122 <= wire106[(1'h1):(1'h1)];
            end
        end
      reg123 <= $signed((~&reg118));
    end
  always
    @(posedge clk) begin
      if (wire100[(4'hb):(2'h3)])
        begin
          reg124 <= $signed(wire98);
        end
      else
        begin
          reg124 <= $signed($signed((~|$signed($unsigned(wire106)))));
          reg125 <= {($unsigned(reg111[(4'ha):(4'h8)]) ?
                  reg109 : ((~|(wire102 >>> wire98)) ?
                      (~|(reg111 ?
                          (8'hab) : reg121)) : wire105[(4'hd):(4'h9)]))};
          reg126 <= (-(((!{reg109, reg118}) ?
                  $signed($signed(reg109)) : reg118) ?
              reg123[(3'h5):(3'h4)] : $unsigned($unsigned((wire98 ?
                  reg109 : wire100)))));
          if (($unsigned(((reg111[(1'h0):(1'h0)] ?
                      reg117[(2'h3):(1'h0)] : $unsigned(wire100)) ?
                  reg120 : ($signed(wire100) ^ $signed(wire108)))) ?
              (~reg126[(2'h3):(2'h2)]) : $unsigned(($signed((&reg109)) ?
                  wire106 : {$unsigned(reg126), wire104[(3'h4):(2'h2)]}))))
            begin
              reg127 <= ((-$unsigned($unsigned(wire114))) < ({({reg118,
                      reg123} & wire99),
                  $signed(reg123[(5'h11):(2'h2)])} >> reg122));
              reg128 <= $signed((8'hbd));
              reg129 <= $signed($signed($unsigned(((wire105 ? reg123 : reg127) ?
                  (&reg121) : (wire108 ? reg115 : reg125)))));
            end
          else
            begin
              reg127 <= $signed(wire114[(4'h8):(2'h3)]);
              reg128 <= ($unsigned((&wire114[(4'h8):(3'h6)])) ?
                  wire114[(4'hf):(2'h3)] : $unsigned((wire107[(1'h0):(1'h0)] ?
                      (7'h43) : $unsigned($signed(reg118)))));
              reg129 <= (((reg128[(3'h4):(1'h1)] ?
                      $unsigned($unsigned(wire102)) : (~|$signed(reg117))) < ((reg109 ?
                          $signed(reg119) : (reg121 ? reg122 : reg124)) ?
                      $unsigned(wire103[(1'h1):(1'h1)]) : ((reg115 | wire106) * reg119[(5'h11):(4'h9)]))) ?
                  wire107[(4'ha):(4'h8)] : ($unsigned(reg110) ?
                      reg110[(4'h8):(1'h0)] : (((reg116 ^~ reg124) ?
                          (wire106 ? wire101 : reg123) : (reg126 ?
                              wire102 : wire105)) && (wire108[(2'h2):(2'h2)] - wire103[(1'h1):(1'h1)]))));
              reg130 <= (wire100[(3'h6):(2'h3)] ?
                  $unsigned(reg128[(3'h4):(3'h4)]) : $signed($signed((|((8'hb9) ?
                      wire114 : wire104)))));
              reg131 <= ({wire108, $signed((8'ha0))} >= reg111[(4'he):(4'he)]);
            end
          if ($signed($signed((~^$signed(((8'hb4) ? wire103 : reg116))))))
            begin
              reg132 <= $signed((^~reg123[(3'h7):(3'h4)]));
              reg133 <= (8'ha5);
              reg134 <= (reg109 <= {(wire108[(2'h3):(2'h3)] ?
                      (!(+wire98)) : {{wire104}, (wire113 ? wire103 : reg124)}),
                  $unsigned(reg131)});
              reg135 <= wire107;
            end
          else
            begin
              reg132 <= wire99[(3'h6):(2'h2)];
              reg133 <= $signed({reg127});
              reg134 <= {$unsigned({$signed((reg117 ? wire101 : wire103))}),
                  reg121};
            end
        end
      reg136 <= $unsigned($unsigned($unsigned((+$signed((8'hba))))));
    end
  assign wire137 = (reg123 || $unsigned(($signed($signed(reg134)) << (!$unsigned(wire104)))));
  assign wire138 = $signed((reg117[(3'h4):(3'h4)] & wire100));
  assign wire139 = (&{wire138});
  always
    @(posedge clk) begin
      reg140 <= wire102;
      reg141 <= $signed($signed((reg131 ?
          $unsigned((wire107 ? wire104 : wire106)) : ($unsigned((8'h9f)) ?
              (reg131 == reg110) : {reg115, reg118}))));
      reg142 <= ((((-(reg122 <= reg109)) ?
          reg124[(4'ha):(3'h6)] : (reg126[(3'h6):(3'h5)] < $signed(wire100))) >>> (wire137[(3'h4):(2'h3)] ?
          (reg121[(4'ha):(1'h1)] || reg116) : {reg117[(3'h4):(3'h4)]})) ~^ reg130);
      if ((reg140 >>> ($signed({wire113}) ?
          ((~((8'h9c) ?
              (8'hbb) : (8'hb3))) >>> wire114) : ($signed(((8'hac) ~^ reg123)) & $unsigned((reg109 ?
              wire103 : (8'hbc)))))))
        begin
          reg143 <= (~^$signed(wire139));
          reg144 <= $unsigned((+reg125[(3'h5):(1'h1)]));
          reg145 <= $unsigned(wire108[(1'h1):(1'h1)]);
          reg146 <= (reg143[(4'hf):(3'h6)] ?
              reg124[(2'h3):(2'h2)] : $unsigned(($unsigned(reg119) * reg126[(4'hf):(4'h9)])));
        end
      else
        begin
          reg143 <= reg118;
          if (($signed((8'ha0)) * wire103[(2'h2):(1'h1)]))
            begin
              reg144 <= (wire99[(4'hb):(2'h2)] | $unsigned($unsigned(wire112)));
              reg145 <= ($unsigned((reg115 ?
                      (reg117 << (wire137 & wire112)) : {(wire98 >= (7'h40))})) ?
                  ({$signed($signed(reg128))} ~^ (reg144[(5'h11):(2'h2)] ?
                      wire138[(1'h1):(1'h0)] : $signed($unsigned(reg129)))) : (~^(reg132[(1'h1):(1'h1)] || reg141[(1'h0):(1'h0)])));
            end
          else
            begin
              reg144 <= $signed(($unsigned(reg110) ?
                  (wire103[(2'h2):(1'h1)] >= $signed(wire114)) : wire112));
              reg145 <= reg134[(1'h1):(1'h0)];
              reg146 <= $signed({$signed({$unsigned(reg122), (~&(8'hb0))}),
                  reg126});
            end
          reg147 <= $unsigned({$unsigned($signed((-wire106))),
              (!{(8'h9f), (wire102 ? reg129 : (7'h40))})});
          reg148 <= reg147;
        end
    end
  assign wire149 = (reg140[(3'h4):(3'h4)] ?
                       (-$signed((~|$signed(wire100)))) : wire101[(4'h8):(3'h7)]);
  assign wire150 = {$unsigned($unsigned(reg146))};
  always
    @(posedge clk) begin
      reg151 <= ({reg145[(2'h2):(1'h1)]} ?
          $signed(reg117[(3'h4):(2'h2)]) : ({$signed(reg117)} <= {((wire113 & reg127) >= ((8'hb9) ?
                  wire114 : reg140)),
              wire107}));
    end
endmodule
