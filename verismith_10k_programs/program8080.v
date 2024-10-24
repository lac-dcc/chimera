module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire72;
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire75,
                 wire74,
                 wire4,
                 wire72,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire4 = $signed($unsigned(wire1[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg5 <= (+wire2);
      reg6 <= ((8'ha6) ?
          $unsigned(((|$signed(wire3)) ?
              $signed((wire3 >>> wire4)) : (wire1 ?
                  (wire3 ? (8'ha6) : wire1) : {reg5,
                      (8'ha7)}))) : wire2[(2'h3):(1'h0)]);
      reg7 <= (reg5 | ($unsigned(($signed(reg6) ?
          $unsigned(wire2) : wire2[(2'h3):(2'h3)])) > $unsigned(wire3[(3'h4):(1'h1)])));
      reg8 <= {((wire2[(1'h1):(1'h1)] * {$unsigned(wire0), (~^reg5)}) ?
              (({(7'h41), reg5} ^~ (~|reg5)) ?
                  (!reg7[(3'h5):(2'h3)]) : $unsigned($unsigned(wire1))) : ($unsigned((~^wire0)) ?
                  (|wire1[(1'h1):(1'h1)]) : (wire3 ? $unsigned(wire3) : reg5))),
          $signed(({reg7[(4'h9):(1'h0)]} ^ ((wire2 != wire0) ^ ((8'had) <<< reg6))))};
    end
  module9 #() modinst73 (wire72, clk, wire2, wire3, wire1, reg8);
  assign wire74 = {((((+reg5) < $signed(wire2)) == (reg5[(4'ha):(3'h6)] ?
                              (~&reg5) : $unsigned((8'hb8)))) ?
                          wire1 : wire1),
                      {$unsigned(((reg7 * wire72) ?
                              $unsigned(wire1) : wire1[(3'h4):(1'h0)]))}};
  assign wire75 = (^{(7'h40), $signed($unsigned(reg8[(3'h6):(1'h1)]))});
  always
    @(posedge clk) begin
      reg76 <= $signed(($unsigned(reg5[(4'hf):(2'h3)]) < $signed(reg8[(4'he):(1'h1)])));
      reg77 <= reg5;
      reg78 <= {wire72};
      if (wire2)
        begin
          reg79 <= (~&reg77);
          if ($signed(($signed(reg5) ?
              (wire4[(2'h2):(2'h2)] ?
                  $signed({wire2}) : ({wire4, (8'h9d)} ?
                      $signed(wire4) : (reg6 ? reg76 : wire3))) : wire3)))
            begin
              reg80 <= (~(&reg5));
              reg81 <= $signed(wire0);
              reg82 <= $signed(wire1[(4'he):(2'h3)]);
            end
          else
            begin
              reg80 <= ((reg79[(1'h1):(1'h1)] || (^~$unsigned((reg8 ?
                  wire72 : wire3)))) <<< $unsigned((~$unsigned((8'h9e)))));
            end
        end
      else
        begin
          reg79 <= (wire74[(2'h3):(1'h1)] << ({$unsigned(reg76),
              $signed((wire1 ^ reg7))} || reg76[(3'h6):(3'h6)]));
          reg80 <= {$signed((~^({wire2} ^~ reg77)))};
          if (((~&($unsigned({wire1,
              reg77}) <= (~&$signed((8'hb8))))) & $signed($unsigned(((reg81 ?
                  reg78 : reg81) ?
              (reg6 & reg79) : reg6)))))
            begin
              reg81 <= (!(reg8 ?
                  $unsigned($signed((~&reg77))) : wire2[(3'h5):(2'h3)]));
              reg82 <= (reg79[(1'h1):(1'h1)] ?
                  reg79 : $signed(reg5[(4'hc):(1'h1)]));
              reg83 <= wire1[(5'h10):(3'h6)];
              reg84 <= $unsigned((+{wire74[(3'h5):(3'h4)],
                  reg8[(4'hb):(3'h6)]}));
            end
          else
            begin
              reg81 <= ($signed({(-(reg76 & reg80)), $signed((^wire72))}) ?
                  ((((^reg78) | $signed(reg7)) ?
                          wire74 : ((reg76 ? reg6 : (8'ha6)) ?
                              (wire3 && wire75) : (wire0 ? reg6 : wire4))) ?
                      $signed(({wire2,
                          reg6} > ((8'hbb) >> reg83))) : (wire2[(2'h3):(1'h0)] ?
                          wire74[(4'ha):(4'ha)] : $unsigned({reg5}))) : ((wire4 ?
                          $signed((reg76 ?
                              wire3 : reg80)) : (~$unsigned(reg77))) ?
                      wire3 : reg80[(3'h6):(3'h6)]));
              reg82 <= $signed(($signed(((~|reg7) ?
                      reg82[(1'h1):(1'h0)] : $signed(reg5))) ?
                  $unsigned((reg76 ?
                      $unsigned((8'h9e)) : (~&reg5))) : (wire3 >> ((wire2 ?
                          (8'haa) : wire74) ?
                      (wire4 >> (8'ha0)) : {reg82, reg7}))));
              reg83 <= wire3;
              reg84 <= wire2;
            end
          reg85 <= wire2;
        end
    end
  always
    @(posedge clk) begin
      reg86 <= (-((7'h40) > (((wire4 >>> reg85) != $signed(wire74)) && ($unsigned(reg5) ?
          reg7 : (&wire4)))));
      if ((({$unsigned(reg7[(1'h1):(1'h0)]),
              reg77} > ($unsigned((wire74 != wire2)) - $signed($unsigned(reg80)))) ?
          ($signed(((reg76 >= (8'hb9)) ^ (~&reg77))) < reg83) : reg85[(4'hc):(1'h0)]))
        begin
          reg87 <= reg84;
          reg88 <= $signed($unsigned(reg8));
          reg89 <= {$unsigned((~&reg76))};
          reg90 <= $signed($unsigned($unsigned(($signed(reg80) - wire0[(3'h4):(2'h3)]))));
          if (reg90[(1'h1):(1'h0)])
            begin
              reg91 <= ({$unsigned(({reg81} != $unsigned((8'hb4)))),
                      (((reg89 ^~ (8'hb4)) ?
                              $signed(reg77) : $unsigned(reg77)) ?
                          {$signed(reg85)} : $signed((wire74 > reg7)))} ?
                  (~wire75[(2'h2):(1'h1)]) : reg82[(1'h0):(1'h0)]);
              reg92 <= (+(8'ha8));
            end
          else
            begin
              reg91 <= (^~(8'ha3));
              reg92 <= (reg85[(5'h10):(3'h5)] + $unsigned($unsigned($unsigned($signed(reg77)))));
              reg93 <= (-(+({reg7[(3'h5):(2'h2)], reg89} ?
                  (^$unsigned(wire75)) : (8'ha3))));
            end
        end
      else
        begin
          reg87 <= $signed(wire72);
          reg88 <= (reg91 ?
              (wire72[(3'h4):(3'h4)] ?
                  {$unsigned({reg76}),
                      ((reg84 != reg79) ?
                          $unsigned(wire4) : $signed(reg6))} : reg89[(2'h2):(1'h0)]) : (-(reg93 ^~ reg79[(2'h2):(1'h1)])));
          reg89 <= $signed($signed(reg93[(4'he):(4'ha)]));
          reg90 <= (^wire4);
        end
      reg94 <= (reg88 ? reg79 : $signed(reg82[(2'h3):(2'h2)]));
      if (wire75[(4'ha):(3'h5)])
        begin
          reg95 <= $unsigned(reg78);
          reg96 <= ($unsigned($unsigned((&{reg89,
              reg80}))) > $unsigned({($signed(reg93) ?
                  (8'hae) : (reg82 + reg79)),
              $signed((!reg92))}));
          reg97 <= reg94;
        end
      else
        begin
          reg95 <= reg76[(2'h3):(2'h2)];
          reg96 <= ((($signed((-(8'hac))) ?
                  {reg76[(3'h6):(3'h6)]} : {$unsigned(reg5)}) ^ (reg88 ?
                  reg85[(4'he):(2'h3)] : reg97)) ?
              $signed($signed(((~&(8'ha3)) & reg84[(4'h8):(1'h0)]))) : reg88);
        end
    end
  assign wire98 = (reg7 ? reg94 : wire3);
  assign wire99 = $signed((^~(reg84[(3'h6):(3'h6)] ^ $signed((^~reg82)))));
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire30;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire34,
                 wire33,
                 wire32,
                 wire14,
                 wire15,
                 wire16,
                 wire30,
                 (1'h0)};
  assign wire14 = $unsigned($unsigned(wire12[(5'h10):(4'hd)]));
  assign wire15 = (((8'hae) & ($signed($signed(wire10)) << (~^{wire10}))) ?
                      wire11 : (+(wire12 ?
                          wire13[(1'h1):(1'h0)] : wire11[(3'h4):(2'h2)])));
  assign wire16 = $unsigned(($signed(wire12) ?
                      $unsigned(wire11) : (wire13[(2'h2):(2'h2)] ~^ (^~((8'ha7) ?
                          wire15 : (8'hbb))))));
  module17 #() modinst31 (.wire20(wire13), .wire19(wire11), .wire18(wire16), .y(wire30), .clk(clk), .wire22(wire14), .wire21(wire12));
  assign wire32 = ($unsigned({{{wire11}, $unsigned(wire11)},
                      (wire30[(4'hf):(4'h8)] ~^ (wire12 != wire13))}) & wire10[(2'h2):(1'h1)]);
  assign wire33 = {(8'hbe),
                      (($signed({wire13}) | $unsigned((~wire10))) ?
                          (~^wire12) : $unsigned($signed((wire32 ?
                              wire30 : wire12))))};
  assign wire34 = (^~(~^($unsigned($unsigned((8'hb2))) - {wire33, wire32})));
  module35 #() modinst68 (.clk(clk), .wire39(wire32), .wire36(wire14), .wire38(wire34), .y(wire67), .wire37(wire10));
  assign wire69 = $signed((((-$signed(wire15)) ?
                      $unsigned($unsigned(wire12)) : ((~wire33) - $signed(wire10))) || (+(^wire10[(3'h7):(2'h3)]))));
  assign wire70 = $unsigned((~&$signed($signed((wire32 ? wire15 : wire33)))));
  assign wire71 = {(8'hb8)};
endmodule

module module35
#(parameter param66 = (((!(((8'ha2) ? (8'h9d) : (8'had)) + {(8'hb6), (8'had)})) ? (~((~|(8'ha6)) == (!(8'ha3)))) : {{{(8'h9c)}, ((8'ha9) ? (7'h42) : (8'hb4))}}) < (|{(!{(7'h40)})})))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire [(4'h9):(1'h0)] wire38;
  input wire signed [(2'h3):(1'h0)] wire37;
  input wire signed [(3'h5):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire40 = ((+wire37[(1'h1):(1'h1)]) <= $unsigned(($signed((wire39 ?
                      (8'ha1) : wire38)) > $signed(((8'hb7) | wire38)))));
  assign wire41 = (7'h44);
  assign wire42 = (wire40[(2'h2):(1'h0)] ? {$unsigned(wire41)} : wire38);
  assign wire43 = (~|$signed($signed({{(8'hb3)}, wire37})));
  assign wire44 = wire40;
  always
    @(posedge clk) begin
      reg45 <= $unsigned($signed(({$unsigned(wire37)} ?
          (wire39[(2'h3):(1'h1)] - (-(8'hae))) : (8'hb8))));
      if ((+(~&$unsigned({wire44}))))
        begin
          reg46 <= wire36;
          if (wire40)
            begin
              reg47 <= wire43[(3'h4):(3'h4)];
              reg48 <= reg46;
              reg49 <= ($unsigned($signed((|{wire43}))) ?
                  wire38[(4'h9):(3'h7)] : $signed($signed(($unsigned(reg46) ?
                      (reg47 && wire40) : wire41[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg47 <= ({(wire42 | (~^wire40[(5'h10):(4'h9)])),
                  (^~$signed($unsigned((7'h40))))} << {reg49[(4'h8):(3'h7)]});
            end
          reg50 <= $signed(wire41);
          reg51 <= (&(-$unsigned(((&(7'h44)) ?
              (reg46 ~^ (8'hb6)) : wire37[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg46 <= (wire37[(1'h0):(1'h0)] ?
              $signed($signed({wire41, $unsigned(wire40)})) : (7'h43));
          reg47 <= $unsigned($unsigned(wire44[(2'h2):(1'h1)]));
          reg48 <= wire44[(1'h0):(1'h0)];
          reg49 <= ((~^{$signed($signed(reg51)), $signed($signed(reg46))}) ?
              {(reg49[(1'h0):(1'h0)] ?
                      (|$unsigned(reg48)) : wire37[(1'h0):(1'h0)]),
                  wire36} : (~wire41[(2'h3):(2'h2)]));
        end
      reg52 <= wire36[(2'h3):(2'h3)];
    end
  assign wire53 = (reg47 ?
                      $unsigned(reg49[(1'h1):(1'h0)]) : ((8'hba) ?
                          wire36 : {$signed((reg46 && reg51)),
                              (~(reg52 ^ reg50))}));
  assign wire54 = (({((reg46 ? wire41 : wire42) ?
                                  (wire44 >>> wire42) : reg45[(2'h2):(2'h2)]),
                              (reg49[(4'hf):(2'h3)] ?
                                  $unsigned((8'ha7)) : (reg50 <= (8'ha6)))} ?
                          (wire39[(4'he):(4'ha)] ?
                              reg46 : wire44) : (|$unsigned($signed(wire38)))) ?
                      (wire39 ?
                          (~|$signed(wire42)) : ($unsigned($signed(wire53)) ?
                              $unsigned(((8'hb3) >= (8'haf))) : {$unsigned(wire41)})) : $signed($signed(($unsigned(wire40) ?
                          wire44 : $signed((8'hb3))))));
  assign wire55 = (+{wire38, (|(+wire37[(2'h3):(2'h3)]))});
  assign wire56 = (-reg50);
  assign wire57 = wire42;
  assign wire58 = ((wire53[(1'h1):(1'h0)] + (((!wire37) ?
                              $signed(wire53) : wire39) ?
                          ($unsigned(wire40) && reg45[(3'h5):(2'h2)]) : (~^$unsigned((8'hb0))))) ?
                      ((($unsigned((8'h9f)) - $signed(wire53)) ?
                          $unsigned(wire43) : $signed((reg45 <<< reg45))) ~^ $signed($unsigned(wire36[(3'h4):(3'h4)]))) : (^$signed(((wire39 ?
                              reg49 : reg50) ?
                          {(8'hbe)} : (reg50 == wire44)))));
  assign wire59 = reg45;
  assign wire60 = $signed((8'h9d));
  assign wire61 = (+(-(wire40[(4'hf):(4'hd)] ? (+$signed(wire44)) : wire42)));
  assign wire62 = wire36;
  assign wire63 = wire36;
  assign wire64 = $signed(((~&$unsigned((wire40 + wire43))) & wire44[(1'h0):(1'h0)]));
  assign wire65 = wire59[(1'h1):(1'h1)];
endmodule

module module17
#(parameter param28 = ((-((((8'hb0) == (8'hb0)) ? ((7'h40) < (8'hac)) : (!(8'hbe))) != (((8'ha2) >> (8'ha2)) * (&(8'ha1))))) << (|(~^((~^(8'had)) < ((8'h9e) >> (8'hbf)))))), 
parameter param29 = param28)
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  assign y = {wire27, wire26, wire24, wire23, reg25, (1'h0)};
  assign wire23 = wire21[(4'hc):(2'h3)];
  assign wire24 = $unsigned((wire18 ?
                      $signed(wire21[(2'h3):(1'h0)]) : (^$unsigned($unsigned(wire23)))));
  always
    @(posedge clk) begin
      reg25 <= wire24[(3'h6):(1'h0)];
    end
  assign wire26 = $signed((wire23 && (!$unsigned((wire19 ?
                      wire22 : (8'ha4))))));
  assign wire27 = (wire24 || reg25);
endmodule
