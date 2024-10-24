module top
#(parameter param154 = {(7'h44)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire signed [(3'h4):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire148;
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire150,
                 wire97,
                 wire4,
                 wire99,
                 wire100,
                 wire148,
                 reg5,
                 (1'h0)};
  assign wire4 = (+(&(8'hbb)));
  always
    @(posedge clk) begin
      reg5 <= wire1;
    end
  module6 #() modinst98 (.clk(clk), .wire10(wire1), .y(wire97), .wire7(wire4), .wire8(reg5), .wire9(wire2));
  assign wire99 = wire2[(3'h6):(3'h5)];
  assign wire100 = {wire2,
                       ({((wire97 ? wire99 : wire3) ?
                               $signed((8'hb0)) : reg5)} < ($unsigned(wire1[(1'h1):(1'h1)]) ?
                           ((wire97 ?
                               wire99 : wire99) + (~^wire0)) : $signed($unsigned(wire4))))};
  module101 #() modinst149 (.wire105(wire3), .y(wire148), .wire104(reg5), .clk(clk), .wire103(wire100), .wire102(wire99));
  module107 #() modinst151 (.y(wire150), .clk(clk), .wire111(wire2), .wire112(wire4), .wire109(wire99), .wire108(wire1), .wire110(reg5));
  assign wire152 = (^($unsigned($signed((wire148 ? wire2 : wire3))) ?
                       (wire99 ? wire150 : $signed((!wire2))) : ((8'ha9) ?
                           (wire0[(2'h2):(1'h1)] >> (wire100 != wire1)) : wire4)));
  assign wire153 = (-$signed(($signed((~|wire4)) <<< $unsigned((^~(8'h9f))))));
endmodule

module module101
#(parameter param147 = (((^(~^{(8'hae)})) >> {{((7'h42) * (8'h9f))}, (((7'h42) ? (8'ha7) : (7'h42)) ? (~(8'ha8)) : ((8'h9e) << (7'h43)))}) + ((8'ha1) ? (^(!{(8'ha1)})) : (^{((8'haf) > (8'haf)), {(8'hb8)}}))))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire105;
  input wire [(5'h12):(1'h0)] wire104;
  input wire signed [(4'hd):(1'h0)] wire103;
  input wire [(5'h12):(1'h0)] wire102;
  wire signed [(4'ha):(1'h0)] wire146;
  wire [(5'h15):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire140;
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  assign y = {wire146,
                 wire142,
                 wire140,
                 reg145,
                 reg144,
                 reg143,
                 reg106,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg106 <= wire104[(3'h5):(1'h1)];
    end
  module107 #() modinst141 (.wire112(wire104), .wire109(reg106), .wire111(wire105), .wire110(wire102), .y(wire140), .wire108(wire103), .clk(clk));
  assign wire142 = wire140;
  always
    @(posedge clk) begin
      reg143 <= wire104;
      reg144 <= (~&({wire140[(2'h2):(1'h0)]} ?
          ((wire142[(5'h11):(3'h4)] ?
              {wire105} : $signed(wire105)) - reg143[(5'h10):(4'hb)]) : (($unsigned(wire104) ^~ (wire103 ?
                  reg143 : reg143)) ?
              wire140[(4'hf):(4'h9)] : $signed({wire104}))));
      reg145 <= ((|wire142[(4'hd):(4'h8)]) >> (~^($unsigned(wire104) >= wire103)));
    end
  assign wire146 = reg145[(3'h5):(3'h4)];
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire11;
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire81,
                 wire80,
                 wire78,
                 wire36,
                 wire34,
                 wire11,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire11 = ($unsigned(wire7) <= ($signed({$signed((8'haf)),
                          $signed(wire9)}) ?
                      wire7 : (((~wire8) ?
                              wire8[(4'h8):(4'h8)] : (wire10 >>> wire9)) ?
                          wire10 : wire8[(4'h8):(2'h2)])));
  module12 #() modinst35 (.clk(clk), .wire16(wire10), .wire14(wire7), .y(wire34), .wire15(wire9), .wire13(wire11));
  assign wire36 = wire8[(4'ha):(3'h6)];
  module37 #() modinst79 (wire78, clk, wire9, wire8, wire7, wire10);
  assign wire80 = wire34;
  assign wire81 = $signed(((^~$signed((8'haf))) ^ (-wire80)));
  always
    @(posedge clk) begin
      if ((wire80 < wire34[(3'h6):(3'h4)]))
        begin
          if ($unsigned($unsigned(($unsigned({wire9}) ?
              (-(-(8'ha0))) : wire7[(4'he):(1'h1)]))))
            begin
              reg82 <= (+wire8);
            end
          else
            begin
              reg82 <= (|$unsigned(wire80));
              reg83 <= (~|wire78[(4'hd):(3'h5)]);
              reg84 <= wire81;
              reg85 <= (~{$signed($unsigned($signed(reg82))),
                  ((+$signed(wire34)) ?
                      ((wire8 >> wire36) != $signed(reg84)) : wire81[(4'ha):(4'ha)])});
              reg86 <= reg84[(1'h0):(1'h0)];
            end
          reg87 <= wire78[(1'h0):(1'h0)];
          reg88 <= $unsigned($signed((((wire80 - (8'hb4)) <<< wire10) ?
              reg83[(4'hb):(4'hb)] : {(wire36 - wire36),
                  wire11[(5'h11):(2'h3)]})));
          reg89 <= $signed($unsigned(($unsigned(reg86[(2'h3):(1'h1)]) >= $unsigned(reg86[(3'h6):(2'h3)]))));
          reg90 <= reg85[(3'h7):(3'h4)];
        end
      else
        begin
          reg82 <= reg85[(3'h6):(2'h3)];
          reg83 <= wire9[(4'hb):(4'h8)];
        end
    end
  assign wire91 = ((((8'hab) ?
                          wire9 : $unsigned(wire9[(2'h3):(1'h1)])) <<< $signed(($signed((8'hb2)) ?
                          (wire7 ? reg86 : (8'ha4)) : (wire80 > reg88)))) ?
                      (+({reg88} ?
                          ((reg82 | reg83) ?
                              (-wire80) : $signed(wire11)) : (^~$signed(wire78)))) : wire34[(3'h5):(3'h5)]);
  assign wire92 = reg88[(4'hf):(4'hc)];
  assign wire93 = {$signed(($signed((wire36 && wire11)) ?
                          {$unsigned(wire34)} : ($unsigned((8'haf)) ?
                              $unsigned(reg82) : (|reg85))))};
  assign wire94 = (reg86 ?
                      $signed((((reg83 ? reg85 : wire78) < reg84) ?
                          (!$unsigned(reg88)) : (~|((8'had) ?
                              wire78 : wire78)))) : (~^{$signed(wire91),
                          (wire11[(4'hf):(4'hd)] * $signed(wire78))}));
  assign wire95 = {$unsigned((7'h43)), wire36};
  assign wire96 = $unsigned((~^$unsigned((8'hbd))));
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  input wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire56;
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire56,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg42 <= $unsigned($signed(wire38[(3'h5):(3'h5)]));
      if (wire40)
        begin
          if ($signed((~|{reg42, ($signed(reg42) * wire40)})))
            begin
              reg43 <= (&($unsigned(reg42[(2'h2):(1'h0)]) ?
                  (^(wire39[(5'h11):(3'h7)] ?
                      (&reg42) : (~|wire39))) : (8'ha3)));
              reg44 <= (8'hbd);
              reg45 <= wire41[(3'h4):(1'h0)];
            end
          else
            begin
              reg43 <= (+(((&wire41[(4'hf):(2'h3)]) >> reg43) ?
                  $signed($signed((reg43 && reg45))) : ($unsigned(((8'ha3) || wire40)) ~^ ({wire40,
                      reg43} <= $unsigned((7'h44))))));
              reg44 <= wire39;
              reg45 <= $signed($unsigned((~^reg43)));
              reg46 <= $unsigned($signed($unsigned($unsigned(reg43[(2'h3):(2'h2)]))));
              reg47 <= (!{reg42});
            end
          reg48 <= (~$unsigned((&reg45)));
        end
      else
        begin
          reg43 <= reg45;
          reg44 <= {(-$signed(wire41))};
          reg45 <= {reg44[(3'h6):(3'h5)],
              ($signed($signed(((8'ha9) + (8'hbf)))) != $unsigned(reg48))};
        end
      if (reg48)
        begin
          reg49 <= (~|(7'h42));
          reg50 <= (reg45[(1'h0):(1'h0)] ?
              (|{($signed(reg47) > $signed(reg42)),
                  $unsigned((!wire38))}) : ($signed((|(wire41 >= (7'h40)))) ?
                  (reg48 + ((-reg44) << $unsigned((7'h43)))) : reg45));
          reg51 <= {reg49,
              ($unsigned((|wire38[(3'h6):(1'h0)])) | (((^reg49) ?
                      {wire40} : (reg42 ~^ reg46)) ?
                  {(~reg47), (-(8'ha7))} : $signed(reg42)))};
          if (reg50)
            begin
              reg52 <= $unsigned((^{reg48[(5'h11):(4'hf)],
                  reg44[(2'h3):(1'h0)]}));
              reg53 <= (8'had);
              reg54 <= (((((reg47 <= (7'h44)) ?
                          reg44 : ((8'hb5) ? reg52 : reg52)) ?
                      reg43 : reg42[(1'h0):(1'h0)]) ?
                  reg52[(2'h3):(2'h3)] : reg45[(3'h7):(3'h5)]) + $signed(reg50[(2'h2):(2'h2)]));
            end
          else
            begin
              reg52 <= $unsigned($unsigned(((&$signed(wire40)) - ({reg52} ?
                  reg52 : (~reg52)))));
              reg53 <= wire38;
            end
        end
      else
        begin
          if ($unsigned(($signed($unsigned($signed((8'h9d)))) ~^ (8'had))))
            begin
              reg49 <= (^$signed(reg46[(3'h5):(1'h0)]));
              reg50 <= $signed(wire39[(2'h3):(2'h2)]);
              reg51 <= wire38[(3'h6):(3'h6)];
            end
          else
            begin
              reg49 <= $unsigned({reg47, $signed(reg54[(3'h4):(1'h1)])});
              reg50 <= ({{reg50}, $signed($signed((reg47 ^ wire40)))} ?
                  $signed({reg42}) : ({((!reg44) ? reg52 : wire40)} ?
                      $signed($unsigned($unsigned(reg50))) : $signed((reg45 - (!reg54)))));
              reg51 <= ((($unsigned((reg45 ? reg46 : reg42)) ?
                      (8'h9e) : ((reg52 ? reg49 : reg46) <<< $signed(reg44))) ?
                  wire40 : ($unsigned({wire39}) ?
                      {(~^wire38)} : ($signed(wire40) || (wire39 ?
                          reg47 : (8'hbb))))) << reg53);
            end
          reg52 <= reg53[(5'h14):(3'h5)];
          reg53 <= $unsigned(reg52[(3'h6):(2'h3)]);
        end
      reg55 <= $unsigned(((reg49 ~^ {{wire41}}) ?
          wire38[(1'h1):(1'h1)] : $unsigned(reg47)));
    end
  assign wire56 = (($signed((&$signed(reg51))) ?
                      $signed(reg44) : ($signed($signed(wire40)) ?
                          $signed((8'hac)) : (&((8'ha5) ?
                              reg51 : wire41)))) << $unsigned(reg51[(4'hc):(2'h3)]));
  always
    @(posedge clk) begin
      if ($signed(($signed(((~^(8'ha7)) ?
          reg48 : (wire39 <= reg50))) ^ reg44[(5'h11):(5'h11)])))
        begin
          reg57 <= (reg47 && reg52);
          if ((wire41 & $signed(reg48[(1'h1):(1'h0)])))
            begin
              reg58 <= ($signed(reg50) ?
                  reg50 : $unsigned((((reg54 << (8'hac)) ?
                          reg44 : (reg43 + reg53)) ?
                      $signed({reg53, reg50}) : ({reg45} ^ (&wire56)))));
              reg59 <= reg52;
            end
          else
            begin
              reg58 <= (-(^~reg44[(3'h4):(2'h3)]));
              reg59 <= $signed(($signed(reg53) == reg48));
              reg60 <= ((~^$unsigned((wire38 > (~|wire41)))) * $unsigned($unsigned(((+wire39) << $unsigned(reg52)))));
              reg61 <= $unsigned(reg43);
              reg62 <= (reg42 ^ {$signed(wire39[(5'h11):(1'h1)]),
                  (-(((7'h43) ? reg52 : reg42) ?
                      (|reg46) : $unsigned(wire38)))});
            end
          if (reg43[(1'h1):(1'h1)])
            begin
              reg63 <= {reg46[(1'h1):(1'h1)],
                  $signed(((^~wire40) < (reg43[(1'h1):(1'h0)] & $signed(reg57))))};
              reg64 <= $unsigned(reg60[(4'hb):(4'h9)]);
              reg65 <= ((($signed(reg63) ?
                  ((8'hac) << $unsigned((8'ha6))) : reg45) >> ((|reg55[(1'h1):(1'h0)]) ?
                  $signed($unsigned(reg60)) : ($unsigned(reg42) | reg50))) > ({((+reg55) ?
                          reg60 : $unsigned(reg59))} ?
                  ($signed((reg57 ? reg45 : (7'h41))) ?
                      ($unsigned((8'hbb)) ?
                          $unsigned(reg49) : (!reg50)) : (wire40[(1'h1):(1'h0)] ?
                          ((8'haf) ?
                              reg42 : (8'ha8)) : reg49[(3'h5):(2'h3)])) : (wire41[(4'h8):(2'h2)] >>> wire38)));
              reg66 <= reg64[(4'h9):(1'h0)];
            end
          else
            begin
              reg63 <= reg51;
              reg64 <= (~&$unsigned(((reg42 & wire38) + (|$unsigned(reg54)))));
              reg65 <= (^reg49);
            end
          if ((wire41 ? (8'hbc) : {$signed({reg50})}))
            begin
              reg67 <= $unsigned((^($unsigned($signed(wire38)) ?
                  ((!reg44) ?
                      $unsigned((8'hae)) : $signed(reg44)) : $signed((reg45 ?
                      (8'h9c) : reg51)))));
              reg68 <= (((reg48[(4'hc):(3'h4)] ?
                          reg43[(1'h1):(1'h0)] : $unsigned(reg59[(4'ha):(3'h4)])) ?
                      $unsigned({wire40, reg47[(3'h4):(3'h4)]}) : wire38) ?
                  (reg60 + (((reg49 < reg44) > reg42[(2'h3):(1'h1)]) ?
                      (^~(^reg46)) : $unsigned((reg65 ?
                          reg54 : reg67)))) : $unsigned(reg64[(4'hd):(1'h1)]));
              reg69 <= reg43[(2'h3):(2'h3)];
              reg70 <= reg47[(3'h4):(3'h4)];
            end
          else
            begin
              reg67 <= reg55;
            end
          reg71 <= reg53[(5'h12):(3'h7)];
        end
      else
        begin
          if ($signed(reg71[(3'h7):(3'h7)]))
            begin
              reg57 <= (((~|$unsigned((reg45 ? (8'hb7) : reg49))) ?
                  {(~|(reg69 ? reg53 : reg43)), (&$unsigned(reg46))} : ((reg45 ?
                          (reg49 ~^ reg47) : $signed((8'hb3))) ?
                      (^(^~(8'haf))) : (~^(|wire39)))) * reg45);
              reg58 <= $unsigned($unsigned(reg44[(4'hc):(4'h8)]));
              reg59 <= (~$signed((|{$unsigned(reg61)})));
            end
          else
            begin
              reg57 <= $signed((reg61[(3'h4):(1'h0)] ?
                  $unsigned(reg43) : {((reg61 ?
                          reg42 : (8'ha9)) >= reg69[(4'h8):(4'h8)])}));
            end
          reg60 <= reg44[(4'hd):(3'h6)];
          reg61 <= (~&{reg46});
        end
      reg72 <= {(-{(!reg49)})};
    end
  assign wire73 = reg51;
  assign wire74 = ($signed(($signed((reg70 ? (8'hbf) : reg58)) ?
                      (8'hb2) : $signed({(8'h9d)}))) >>> (~(~&{reg59[(1'h0):(1'h0)]})));
  assign wire75 = ((reg62 - (~|$unsigned((reg62 ? wire38 : reg50)))) ?
                      reg54[(3'h4):(3'h4)] : $unsigned((&wire38)));
  assign wire76 = $signed((!reg51));
  assign wire77 = $signed(reg66[(2'h3):(1'h1)]);
endmodule

module module12
#(parameter param32 = ((8'hb3) || (^({{(8'hbb), (8'h9f)}, (!(8'ha1))} == (((8'hbd) ? (7'h43) : (8'h9c)) && (|(8'h9f)))))), 
parameter param33 = param32)
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire16;
  input wire [(3'h5):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg29,
                 (1'h0)};
  assign wire17 = wire14[(3'h4):(3'h4)];
  assign wire18 = ((^(!(~|$unsigned(wire15)))) ?
                      (wire13 ?
                          {wire16,
                              $unsigned(wire15[(3'h4):(2'h2)])} : wire14) : (wire17 && $signed(wire15[(1'h0):(1'h0)])));
  assign wire19 = (8'hb8);
  assign wire20 = (~&(^($signed((|wire16)) ? wire14 : (~$unsigned((8'hb2))))));
  assign wire21 = (&(wire14 ?
                      $unsigned($signed(wire17[(3'h5):(2'h2)])) : ($signed($unsigned(wire14)) ?
                          ((wire17 ? wire13 : wire17) ?
                              $signed((8'ha7)) : wire17[(2'h3):(2'h3)]) : $signed((wire13 ?
                              wire13 : (8'hb2))))));
  assign wire22 = wire21[(2'h2):(1'h0)];
  assign wire23 = {$signed($unsigned($signed(((8'h9e) >> wire16)))),
                      $signed($signed(((8'ha4) == $unsigned(wire22))))};
  assign wire24 = (~{(~|{(wire22 >> wire16), (wire15 && wire23)}),
                      (&(~&$signed(wire23)))});
  assign wire25 = wire14[(3'h5):(1'h1)];
  assign wire26 = {{(8'hbf)}, wire23[(3'h6):(1'h1)]};
  assign wire27 = wire16;
  assign wire28 = (~^{$unsigned({wire23[(4'h8):(1'h0)], (wire19 && wire27)}),
                      wire13[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg29 <= {wire20, wire16[(1'h0):(1'h0)]};
    end
  assign wire30 = ((~^((&(wire15 + wire23)) ?
                      ({wire15, wire13} ?
                          (wire21 >>> wire22) : (wire13 ?
                              wire15 : wire19)) : ($signed(wire17) | (!wire26)))) != $signed(wire19));
  assign wire31 = wire30;
endmodule

module module107
#(parameter param138 = {{((((8'ha9) >> (8'ha6)) ? ((8'hb5) == (8'ha2)) : ((8'hb1) ? (7'h41) : (8'hb3))) != ((~(7'h41)) ? (+(8'ha5)) : ((8'hb0) ? (8'h9c) : (8'ha4)))), ((8'h9e) ? {((8'hae) ? (8'hbf) : (8'h9d)), ((8'hab) | (8'hbd))} : (!((8'h9e) >= (8'h9d))))}, (((((7'h40) <= (8'h9f)) != ((8'hae) ? (8'hb9) : (8'hba))) || {((8'h9c) ? (8'ha9) : (8'ha2))}) ? (|(~|{(8'hba), (8'hb6)})) : (&(((8'hb4) ? (8'hb2) : (8'hb8)) | {(8'hb2)})))}, 
parameter param139 = (param138 <= (~&(({param138} || (&param138)) ? (8'hb7) : (8'had)))))
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire112;
  input wire [(5'h11):(1'h0)] wire111;
  input wire [(5'h12):(1'h0)] wire110;
  input wire signed [(3'h4):(1'h0)] wire109;
  input wire signed [(2'h2):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire114;
  wire [(3'h6):(1'h0)] wire113;
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
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
                 (1'h0)};
  assign wire113 = $signed(wire112[(4'h8):(3'h5)]);
  assign wire114 = $unsigned(({(-wire109),
                       $unsigned($unsigned(wire111))} ^~ $unsigned(((wire113 ?
                       wire108 : wire113) ^ wire110))));
  assign wire115 = {$unsigned($unsigned($unsigned((wire114 <= wire110)))),
                       $signed($signed($unsigned({wire114, wire113})))};
  assign wire116 = wire114;
  assign wire117 = ((((wire108[(2'h2):(1'h0)] ? (&(8'hbd)) : $signed(wire109)) ?
                       (~$signed(wire110)) : wire116[(4'h8):(3'h7)]) == $unsigned($unsigned($unsigned(wire108)))) < ($unsigned($unsigned((wire108 - (8'ha2)))) ?
                       {(-{wire112}),
                           $signed((wire110 & (8'hab)))} : $signed({(wire112 > (7'h41)),
                           wire114[(1'h1):(1'h1)]})));
  assign wire118 = $unsigned(wire112);
  assign wire119 = wire114;
  always
    @(posedge clk) begin
      if (wire108[(2'h2):(1'h1)])
        begin
          reg120 <= (((~&wire108) - $unsigned(wire115)) ?
              $unsigned(($signed(((7'h41) ^ wire114)) && ((wire113 ~^ wire118) ?
                  wire119[(3'h6):(1'h0)] : wire116))) : {(~&((|wire110) < (wire117 >> wire115)))});
        end
      else
        begin
          if ((({wire115} ? wire116[(1'h0):(1'h0)] : reg120) ?
              $unsigned(wire119) : ((&wire117[(3'h6):(1'h0)]) >> reg120)))
            begin
              reg120 <= (((8'ha8) ^~ (wire117 ?
                      ($signed(wire115) << $unsigned(wire109)) : wire115[(4'ha):(2'h2)])) ?
                  ((+(wire117 < (wire108 >>> (8'ha7)))) >> $unsigned(wire118)) : (((wire117 && $unsigned(wire110)) ?
                          $unsigned($unsigned(wire111)) : {$unsigned(wire111),
                              $signed(wire109)}) ?
                      (wire115[(1'h1):(1'h0)] ?
                          $unsigned($unsigned((8'ha9))) : $unsigned(((8'h9e) ?
                              wire113 : (8'hba)))) : wire112));
              reg121 <= $signed(wire109[(1'h0):(1'h0)]);
              reg122 <= (!{(wire109 ?
                      {(|wire116),
                          (wire109 - wire112)} : ((!wire112) | reg120[(2'h2):(1'h1)])),
                  wire113});
              reg123 <= $unsigned(reg120);
              reg124 <= (($signed((reg123[(3'h6):(2'h3)] ^ wire108)) ^~ wire118) * $unsigned($unsigned((8'had))));
            end
          else
            begin
              reg120 <= wire118;
              reg121 <= ((+wire110) ?
                  reg122[(4'hf):(2'h3)] : $unsigned((((wire108 ?
                              reg121 : wire119) ?
                          (wire118 >> wire111) : (8'hbc)) ?
                      (-$unsigned(wire109)) : (~|{(8'ha9)}))));
              reg122 <= $signed(((8'ha7) - (8'hb5)));
              reg123 <= (^~({wire113, wire117} ?
                  {((-wire113) <= wire112)} : (~^((wire118 ? reg121 : reg123) ?
                      wire114 : $signed(wire109)))));
              reg124 <= (~&(((~^(wire110 ~^ wire108)) & reg124[(1'h0):(1'h0)]) ?
                  wire118 : $unsigned($signed((reg123 >>> wire112)))));
            end
          if (wire110)
            begin
              reg125 <= ((&$signed({((8'h9c) ^~ reg122)})) + reg121);
              reg126 <= (((reg122[(5'h10):(2'h3)] ?
                          wire110 : $signed(((8'haf) ? wire111 : wire115))) ?
                      (((~&reg125) * {wire118}) ?
                          (~wire110) : $unsigned({reg124})) : ($signed($unsigned(wire110)) != ((wire109 | reg122) <= (|(7'h44))))) ?
                  ($signed((((8'hab) <<< wire113) <<< (wire114 ?
                          wire108 : reg123))) ?
                      {wire110,
                          $unsigned($unsigned(wire116))} : (~&wire115)) : (({{wire114,
                          wire115}} <= ((reg124 < reg121) ?
                      wire116[(2'h3):(1'h1)] : (&wire119))) ^ $signed((&$signed(wire112)))));
              reg127 <= wire112;
              reg128 <= reg122;
              reg129 <= {reg127,
                  ($unsigned(({wire113} ?
                          $signed(wire109) : (wire113 ^ reg122))) ?
                      (8'ha3) : wire114[(2'h2):(1'h0)])};
            end
          else
            begin
              reg125 <= wire110[(4'ha):(3'h5)];
              reg126 <= wire118;
              reg127 <= (~^$signed({wire119}));
              reg128 <= (8'hb3);
            end
          reg130 <= reg127[(1'h0):(1'h0)];
          reg131 <= $signed(reg128);
          reg132 <= (~^(&{$signed({reg126, reg124}),
              $signed((wire111 | wire111))}));
        end
      reg133 <= ($unsigned(reg123[(2'h3):(2'h3)]) ?
          wire113[(3'h4):(2'h3)] : wire112[(4'hd):(1'h1)]);
    end
  assign wire134 = (8'hb4);
  assign wire135 = wire115[(4'h9):(3'h6)];
  assign wire136 = (&wire115[(1'h1):(1'h0)]);
  assign wire137 = $unsigned($signed($signed((^~reg126))));
endmodule
