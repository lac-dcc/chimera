module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire73;
  assign y = {wire113,
                 wire112,
                 wire110,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire73,
                 (1'h0)};
  assign wire5 = ((|$signed(((!wire0) ?
                     (^wire4) : (wire0 ^~ wire0)))) >> $unsigned((!($signed(wire4) ~^ (wire0 << wire0)))));
  assign wire6 = (({($signed(wire1) > (wire0 && wire1))} ~^ wire0[(1'h0):(1'h0)]) && {wire1[(4'hb):(4'h9)]});
  assign wire7 = ($signed((&{$unsigned(wire3)})) >= $unsigned($signed((((8'hab) ?
                         wire5 : wire2) ?
                     (wire4 ? wire6 : wire5) : {wire1}))));
  assign wire8 = wire0;
  assign wire9 = ({$signed((~&$unsigned(wire4))), (!$signed($signed(wire1)))} ?
                     (&($unsigned((wire1 ? wire1 : (8'hb3))) ?
                         $signed(wire3[(1'h0):(1'h0)]) : (^(wire2 != wire3)))) : (~^$signed($unsigned((wire3 ?
                         wire6 : wire1)))));
  module10 #() modinst74 (.y(wire73), .wire11(wire3), .wire13(wire1), .clk(clk), .wire15(wire0), .wire12(wire4), .wire14(wire8));
  assign wire75 = ($unsigned(wire6[(3'h5):(3'h4)]) ?
                      $signed(wire1[(1'h0):(1'h0)]) : ({(|wire8),
                              {(wire8 ~^ wire2)}} ?
                          wire5[(4'h8):(1'h1)] : ((~&(^~wire1)) ?
                              wire8 : wire5[(4'ha):(3'h7)])));
  assign wire76 = $unsigned({$unsigned((wire3[(4'hd):(1'h0)] ?
                          wire1[(4'h8):(2'h3)] : (wire3 >>> (7'h41)))),
                      $signed($unsigned($signed(wire8)))});
  assign wire77 = {$unsigned(wire4[(3'h7):(1'h0)])};
  assign wire78 = $unsigned(wire5);
  assign wire79 = $unsigned((wire77 ?
                      (({wire6} && wire6) ?
                          {wire6[(2'h3):(2'h2)]} : (wire7 ?
                              (8'hbf) : {wire6, wire75})) : (^~wire2)));
  assign wire80 = wire76;
  module81 #() modinst111 (.wire82(wire5), .clk(clk), .wire84(wire8), .y(wire110), .wire85(wire73), .wire83(wire2));
  assign wire112 = wire73;
  assign wire113 = wire7[(4'hf):(2'h2)];
endmodule

module module81
#(parameter param109 = (~&((((~(8'hb4)) ? (7'h42) : (&(8'hae))) + {(~(8'ha2))}) ? (+(^((7'h44) || (8'h9e)))) : (~({(8'hbe)} ? (-(8'h9c)) : ((8'hbf) >>> (8'hb2)))))))
(y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire85;
  input wire signed [(4'hc):(1'h0)] wire84;
  input wire signed [(4'h9):(1'h0)] wire83;
  input wire signed [(4'hf):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  assign y = {wire108,
                 wire95,
                 wire94,
                 wire93,
                 wire87,
                 wire86,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire86 = $unsigned((wire84 >>> wire83[(2'h2):(2'h2)]));
  assign wire87 = wire84;
  always
    @(posedge clk) begin
      if ((~^$unsigned((|($signed(wire87) ? (&wire87) : wire83)))))
        begin
          reg88 <= {(^~wire85)};
        end
      else
        begin
          if ((wire86[(2'h2):(1'h1)] ?
              $unsigned({reg88[(3'h4):(1'h1)]}) : ((~|{((8'ha6) > wire82)}) ?
                  $signed($unsigned(wire83[(3'h6):(3'h4)])) : $unsigned((((8'hb5) ?
                          wire85 : reg88) ?
                      $signed((8'hb5)) : wire87[(4'h9):(2'h3)])))))
            begin
              reg88 <= ((wire86 << wire87[(1'h0):(1'h0)]) ?
                  {wire86} : wire83[(3'h6):(2'h3)]);
              reg89 <= reg88[(1'h0):(1'h0)];
              reg90 <= $unsigned(($unsigned(wire87) ?
                  wire87[(2'h2):(1'h0)] : ({(~^reg88)} || $unsigned(wire82))));
              reg91 <= $signed(($signed($signed((wire84 ?
                  reg88 : wire85))) >= ($unsigned($unsigned(wire86)) ?
                  (reg89[(3'h4):(1'h1)] >>> wire82[(2'h2):(1'h0)]) : ($unsigned(wire87) * (~^(8'ha9))))));
              reg92 <= reg89[(3'h5):(2'h2)];
            end
          else
            begin
              reg88 <= $unsigned(wire86[(4'h8):(1'h1)]);
            end
        end
    end
  assign wire93 = (wire86[(3'h4):(1'h1)] ?
                      (wire83[(3'h5):(3'h4)] || (!$unsigned(reg88[(1'h0):(1'h0)]))) : (reg88[(3'h4):(1'h1)] ?
                          $unsigned(((reg90 ?
                              wire83 : reg91) <= wire86[(4'h8):(3'h6)])) : {((-wire85) ?
                                  ((8'ha4) ^ reg91) : (|wire83))}));
  assign wire94 = wire82[(4'hf):(2'h3)];
  assign wire95 = $signed((wire83 ?
                      (-reg91[(1'h0):(1'h0)]) : (reg91[(4'h8):(1'h1)] <<< {(8'haa),
                          (reg89 ? wire93 : wire94)})));
  always
    @(posedge clk) begin
      if (((wire94 ?
              ($signed((-wire85)) && (&{(8'hb7), reg90})) : (|(~&{reg89,
                  (8'hbb)}))) ?
          wire93 : $unsigned(((~&(wire84 != reg90)) ?
              wire84[(3'h4):(1'h0)] : wire83))))
        begin
          if ($unsigned(reg88[(5'h12):(4'hf)]))
            begin
              reg96 <= ((wire93[(4'hf):(3'h4)] ^ (8'hac)) ?
                  (&(^~$signed({wire93,
                      reg91}))) : {{$unsigned($signed(wire95))}, (|wire94)});
              reg97 <= wire86;
            end
          else
            begin
              reg96 <= (^$signed((~($unsigned(wire85) - wire87))));
              reg97 <= (~|(^~$unsigned(reg91[(3'h5):(3'h4)])));
              reg98 <= (~&(((wire83[(2'h2):(1'h0)] <= (wire87 ?
                  reg88 : wire94)) < wire87) < $unsigned(reg90)));
              reg99 <= (&$signed((~|wire93[(4'he):(3'h5)])));
            end
          reg100 <= (+$signed($unsigned($unsigned((^reg99)))));
          reg101 <= $signed({$signed((~^wire93[(4'ha):(3'h5)])),
              (reg89[(2'h2):(1'h0)] ?
                  ((reg88 > reg96) ?
                      $signed(reg92) : (wire87 ? (8'h9c) : reg88)) : reg98)});
          reg102 <= reg88[(5'h12):(3'h4)];
        end
      else
        begin
          reg96 <= (-{reg99[(4'ha):(2'h2)], (8'ha7)});
        end
      if (reg96[(4'hc):(3'h6)])
        begin
          reg103 <= (~|wire83[(3'h6):(3'h4)]);
          reg104 <= wire82[(3'h5):(2'h2)];
        end
      else
        begin
          reg103 <= wire84[(3'h6):(2'h3)];
        end
      reg105 <= $unsigned(wire84);
      reg106 <= ($signed((((8'hbe) << {wire86}) ?
              (reg92 ?
                  $unsigned(wire86) : (reg92 ?
                      reg97 : reg96)) : ((~|(8'hb8)) > reg92[(1'h1):(1'h1)]))) ?
          {wire83} : $unsigned($signed((-$signed(reg101)))));
      reg107 <= $unsigned((-$unsigned((|(wire82 ? reg97 : reg103)))));
    end
  assign wire108 = (^(&(($signed(wire85) - (wire85 ~^ wire84)) ?
                       (!wire95[(1'h1):(1'h1)]) : wire84[(3'h6):(2'h3)])));
endmodule

module module10
#(parameter param72 = {(+{((^(8'hb6)) << (~(7'h41)))}), ((8'hba) <<< {{((8'ha8) ? (8'ha3) : (8'had))}, (((8'hab) ? (8'hb0) : (8'ha4)) || ((8'ha9) << (8'ha9)))})})
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire60;
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire40,
                 wire16,
                 wire60,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  assign wire16 = (wire15 ?
                      (wire13[(2'h2):(2'h2)] ^~ $signed($unsigned({wire14,
                          wire14}))) : (wire14 >= (+wire14[(3'h4):(1'h0)])));
  module17 #() modinst41 (.wire21(wire14), .wire18(wire15), .wire19(wire11), .y(wire40), .clk(clk), .wire20(wire13), .wire22(wire16));
  always
    @(posedge clk) begin
      reg42 <= wire11[(4'h8):(4'h8)];
      reg43 <= wire13[(1'h1):(1'h1)];
      if ($unsigned((reg42[(3'h7):(3'h6)] ?
          $unsigned(reg43) : wire16[(5'h13):(5'h13)])))
        begin
          if ($unsigned($signed(wire15)))
            begin
              reg44 <= ({((^~(wire12 < (7'h41))) ^~ wire13)} ?
                  {wire11,
                      ($unsigned($unsigned(wire14)) <= $unsigned(wire11[(5'h14):(4'he)]))} : ($unsigned({wire13[(1'h1):(1'h0)]}) < $signed(wire16)));
            end
          else
            begin
              reg44 <= {{wire11[(5'h14):(3'h5)], reg43[(1'h1):(1'h1)]},
                  {wire40[(1'h0):(1'h0)], wire12[(3'h7):(2'h2)]}};
            end
          reg45 <= reg43[(2'h3):(1'h0)];
          reg46 <= reg43;
          reg47 <= (wire11[(4'hf):(4'hf)] ?
              wire11 : (reg45 ?
                  ({$unsigned(wire14)} > reg46) : $unsigned(({reg46,
                      wire40} < (wire13 ? (8'hb5) : wire15)))));
        end
      else
        begin
          reg44 <= (&$unsigned($signed($unsigned($unsigned(wire14)))));
          reg45 <= {reg45[(2'h3):(1'h1)]};
        end
    end
  module48 #() modinst61 (wire60, clk, reg47, wire14, reg46, reg42);
  assign wire62 = reg43[(2'h3):(2'h3)];
  assign wire63 = (^~$signed((wire60 ?
                      $signed((!wire12)) : reg43[(1'h0):(1'h0)])));
  assign wire64 = {$signed((reg46 <= wire40)), wire40};
  assign wire65 = (({wire63, $signed(wire13[(2'h2):(2'h2)])} ?
                      $signed(((wire63 ? (8'h9f) : (8'hb2)) ?
                          reg47[(1'h1):(1'h1)] : wire12[(4'hb):(1'h0)])) : (reg43 ?
                          ($unsigned(wire40) >>> wire12[(3'h7):(3'h6)]) : wire14)) == $signed(reg42[(5'h11):(5'h11)]));
  always
    @(posedge clk) begin
      reg66 <= ((+reg44) ?
          $unsigned(wire11) : $unsigned(($signed(wire40) && reg43)));
      if ((!{reg47[(3'h5):(3'h4)]}))
        begin
          if ($unsigned($signed((~((wire15 ? wire15 : (8'hae)) ?
              wire14 : $signed(wire60))))))
            begin
              reg67 <= $unsigned($signed(wire11));
              reg68 <= $signed(reg44[(3'h6):(1'h1)]);
              reg69 <= reg66[(4'h9):(3'h5)];
              reg70 <= {wire13[(4'ha):(3'h5)], wire11};
              reg71 <= $unsigned(((((^reg44) ?
                          {reg68} : (wire16 ? wire63 : reg47)) ?
                      reg47 : wire64) ?
                  $unsigned({reg42[(3'h5):(1'h1)],
                      ((8'hba) ? (8'hbc) : (8'ha3))}) : $unsigned(wire12)));
            end
          else
            begin
              reg67 <= (-((wire11 ?
                      $signed((reg45 ?
                          (8'hb2) : reg44)) : $unsigned(wire13[(4'ha):(4'ha)])) ?
                  wire64[(4'h9):(3'h4)] : (!$unsigned((~|wire11)))));
              reg68 <= $unsigned(($unsigned($unsigned($unsigned(wire16))) ?
                  (|(+(reg44 ^~ wire63))) : (~|{(!reg45),
                      $unsigned((8'hae))})));
              reg69 <= {$unsigned(($signed($unsigned(wire62)) * $unsigned($unsigned(reg68)))),
                  $signed(wire13)};
            end
        end
      else
        begin
          reg67 <= (~|((!(&reg43)) ?
              $unsigned(wire65) : (wire40 <= (|$unsigned(wire65)))));
          reg68 <= (^~reg70[(1'h1):(1'h0)]);
        end
    end
endmodule

module module48
#(parameter param58 = ((!{(~|((8'h9d) || (7'h43)))}) ? (((((8'hac) ? (8'ha0) : (8'ha6)) & (|(8'hb1))) ? (((8'had) ? (8'ha6) : (8'ha8)) || ((8'ha7) ? (8'had) : (8'ha4))) : (~|((8'hb6) * (8'hb3)))) ? (-{(-(8'hb8))}) : (((~(8'hac)) >> ((8'haf) ? (7'h40) : (8'ha4))) ? (8'hbe) : (((8'haa) && (8'hbb)) ? ((7'h40) ? (8'ha5) : (8'hb9)) : (!(8'hb5))))) : (-(({(8'hb2)} ^~ (^(7'h41))) ^~ ((8'hae) | (~^(8'hbf)))))), 
parameter param59 = ((^~((~&{param58, (8'ha9)}) >> (8'hbe))) ? (~|(8'hb3)) : ((~&(~^param58)) && (param58 ? (8'ha2) : (param58 ~^ (7'h40))))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire52;
  input wire [(4'ha):(1'h0)] wire51;
  input wire signed [(4'hf):(1'h0)] wire50;
  input wire [(3'h5):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  assign y = {wire57, wire56, wire55, wire54, wire53, (1'h0)};
  assign wire53 = wire51[(4'h9):(1'h0)];
  assign wire54 = ((wire52 ?
                      wire53 : wire53[(3'h6):(3'h5)]) | (wire49 << $signed(wire52)));
  assign wire55 = ((&(~&($unsigned(wire50) ?
                      (wire52 >>> wire49) : $signed(wire49)))) >= (^~$signed($signed($unsigned(wire52)))));
  assign wire56 = (({$signed($unsigned((8'hbb))),
                              (wire50 != (wire55 >= wire52))} ?
                          wire51 : (wire50 ?
                              ((wire50 ? wire53 : wire53) ?
                                  wire52 : $unsigned(wire53)) : wire49)) ?
                      $signed($signed(((wire52 ? (8'haf) : wire54) ?
                          ((8'ha0) * wire54) : (wire51 < (8'h9e))))) : {({{(8'hbe)}} ?
                              (wire51 < $signed(wire49)) : ((wire50 ?
                                  (8'hac) : wire50) <<< $signed(wire54))),
                          wire53});
  assign wire57 = wire56;
endmodule

module module17
#(parameter param39 = {((^((8'h9d) ? {(8'hb5), (8'hb0)} : {(8'haf)})) & {((7'h41) ? ((8'hae) ? (8'had) : (8'h9f)) : (^(8'hbc)))})})
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire22;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = (7'h40);
  assign wire24 = wire21;
  assign wire25 = (~$unsigned(((&(|wire22)) && (^$signed((8'ha9))))));
  assign wire26 = (8'hbf);
  assign wire27 = wire20[(4'h8):(3'h4)];
  assign wire28 = ((~wire18[(3'h5):(2'h2)]) != $signed(wire21));
  assign wire29 = wire20[(3'h4):(1'h1)];
  assign wire30 = (!(wire25 | ({(wire27 ? wire28 : (8'haa))} ?
                      $unsigned(wire25) : $unsigned({(8'hb9)}))));
  assign wire31 = {((({wire22} >>> wire29[(4'h8):(3'h4)]) ?
                          wire28[(1'h0):(1'h0)] : wire30) * wire28[(2'h2):(1'h1)]),
                      wire23};
  assign wire32 = $signed(wire29[(3'h4):(2'h3)]);
  assign wire33 = $unsigned((wire30[(2'h3):(1'h1)] < $unsigned(wire24[(2'h3):(2'h3)])));
  assign wire34 = $unsigned(wire28);
  assign wire35 = (($signed((~(+(8'hb2)))) ?
                          ((~^wire25) + $unsigned((^~wire33))) : wire30) ?
                      wire30[(1'h0):(1'h0)] : wire26);
  assign wire36 = ($signed(wire33[(3'h4):(1'h0)]) != wire29[(2'h2):(1'h1)]);
  assign wire37 = $unsigned((($unsigned((wire25 & wire19)) < $signed({(7'h43)})) * (({wire20,
                          wire33} > wire33[(1'h0):(1'h0)]) ?
                      ((wire35 ? wire27 : (8'hb5)) ?
                          {(8'hbf)} : (wire20 | wire19)) : wire25[(1'h1):(1'h1)])));
  assign wire38 = wire37[(3'h7):(3'h4)];
endmodule
