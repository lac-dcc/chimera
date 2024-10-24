module top
#(parameter param134 = (~(~^((((8'hbc) - (7'h43)) ? {(8'hbc), (8'hb6)} : ((8'hb0) >>> (8'ha5))) == (+(~|(8'hb2)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire133;
  wire [(5'h12):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(4'hb):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire115,
                 wire20,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (wire4[(1'h0):(1'h0)] & $signed($signed((wire0 < wire3))));
  module6 #() modinst21 (.wire10(wire2), .wire7(wire0), .wire9(wire5), .clk(clk), .wire8(wire1), .y(wire20));
  module22 #() modinst116 (wire115, clk, wire0, wire1, wire20, wire3);
  always
    @(posedge clk) begin
      reg117 <= {(wire4 ? (8'haa) : wire2[(3'h4):(1'h1)])};
      reg118 <= (&(($unsigned(wire1) <= ({wire4, (8'haa)} ?
              (wire4 ? (8'hb2) : (8'h9e)) : $unsigned(wire3))) ?
          $signed(wire3) : wire1));
      if (({(reg118[(1'h1):(1'h1)] != (wire2 ?
              {(8'hb7), wire20} : $unsigned((8'hb6)))),
          (-wire115[(1'h1):(1'h0)])} ^~ ($signed((((8'ha7) >>> reg117) == reg117[(2'h2):(1'h1)])) ?
          $signed({$signed(wire1)}) : $unsigned(wire115))))
        begin
          if ((wire0[(2'h3):(1'h0)] ?
              ((wire115 ?
                  (~|reg117) : ((|reg117) ?
                      (reg117 ?
                          wire0 : wire1) : (^wire115))) ^~ ((wire0[(4'h8):(3'h6)] ^ $unsigned(wire0)) & wire0)) : ((^$unsigned({wire4})) ?
                  wire115 : reg118[(4'hb):(1'h1)])))
            begin
              reg119 <= (~^$unsigned({wire1[(4'hd):(3'h6)],
                  $unsigned(wire5[(3'h4):(1'h0)])}));
              reg120 <= wire5[(1'h1):(1'h0)];
              reg121 <= (~&$unsigned((|reg120[(3'h4):(2'h2)])));
            end
          else
            begin
              reg119 <= reg120[(4'h8):(3'h6)];
              reg120 <= wire5[(5'h14):(3'h5)];
              reg121 <= $unsigned(wire3);
              reg122 <= reg117;
            end
          reg123 <= $signed(($unsigned(($signed(reg119) ?
                  reg118 : (~&reg120))) ?
              ((~wire5[(1'h0):(1'h0)]) ?
                  ((reg118 << wire5) ?
                      wire115 : (~|wire115)) : $unsigned((wire0 ?
                      reg121 : reg121))) : $signed(wire4)));
          reg124 <= ($unsigned((!wire0[(4'he):(4'hd)])) ?
              ({(wire115 ? $signed(wire0) : $signed(reg118)),
                  reg123[(1'h0):(1'h0)]} == reg122[(4'hb):(3'h5)]) : reg122);
        end
      else
        begin
          reg119 <= {wire0};
          reg120 <= wire1;
        end
      if ($unsigned(wire20))
        begin
          reg125 <= wire2[(2'h2):(1'h0)];
          if (reg119[(2'h3):(2'h2)])
            begin
              reg126 <= $unsigned((^(~&$signed((|reg120)))));
              reg127 <= reg117;
            end
          else
            begin
              reg126 <= (wire4 ?
                  $signed(($unsigned((~|reg127)) ?
                      $signed((8'ha5)) : ((reg118 & wire20) ?
                          reg125 : (reg121 && reg120)))) : $unsigned(wire115));
              reg127 <= (+$unsigned((|$signed($signed(wire1)))));
              reg128 <= (~|(~^(((~&wire20) ?
                  wire20[(4'he):(4'hb)] : wire3[(1'h1):(1'h0)]) & ($unsigned(reg127) <<< (wire115 + reg120)))));
              reg129 <= reg117[(1'h1):(1'h0)];
              reg130 <= ((+reg120[(3'h5):(3'h5)]) > (^~reg121));
            end
        end
      else
        begin
          reg125 <= {((reg129[(2'h3):(2'h2)] ?
                  $unsigned(wire0[(4'ha):(1'h1)]) : ($signed(reg129) ?
                      (&reg118) : $signed(wire115))) << (reg130 ?
                  (reg128[(2'h2):(2'h2)] + (8'h9f)) : ((^(8'ha9)) && (^~wire20)))),
              ({(~&reg120), (7'h41)} ? reg129[(3'h7):(3'h4)] : (-(8'haa)))};
          reg126 <= (~&reg126[(5'h10):(1'h0)]);
          reg127 <= (|({((reg124 ?
                  reg125 : (8'hae)) || $unsigned(reg123))} <= $unsigned(((~|reg118) ?
              $unsigned(reg125) : reg126))));
          reg128 <= $signed($signed(wire4));
          reg129 <= ($unsigned({((reg123 ?
                  wire20 : reg122) >> $unsigned(reg129))}) | (reg118 ?
              reg119[(4'h9):(3'h5)] : wire0[(4'he):(2'h3)]));
        end
      reg131 <= $signed(((reg125[(4'hd):(4'h8)] ?
          {$signed(reg118)} : ((&reg130) ?
              $signed(reg119) : reg122[(3'h6):(2'h2)])) & ($unsigned((reg127 >> reg123)) >>> reg118[(3'h4):(2'h3)])));
    end
  assign wire132 = $unsigned($signed((wire115[(3'h5):(2'h2)] ^~ ($unsigned(reg127) ^~ (wire0 ?
                       reg119 : reg117)))));
  assign wire133 = $signed(wire132[(5'h10):(4'hb)]);
endmodule

module module22
#(parameter param113 = ((!((!((7'h43) * (8'hb5))) >>> (((7'h40) << (8'ha7)) ? (8'ha0) : ((8'hb3) ^ (8'ha0))))) ? (~|((^~((8'hab) - (8'haf))) ? (7'h42) : (((7'h40) + (8'haa)) ? ((8'hba) ? (8'hb9) : (8'haa)) : {(8'h9f), (8'ha5)}))) : (~&({{(8'hb2)}} >> ((-(8'ha8)) >>> (~^(8'ha0)))))), 
parameter param114 = (+(^~(~&(8'hb2)))))
(y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire24;
  input wire signed [(4'ha):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire71;
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire71,
                 (1'h0)};
  assign wire27 = (&wire24);
  assign wire28 = $unsigned(wire27);
  assign wire29 = (wire27 ? wire26 : (!wire25));
  assign wire30 = {$signed(wire28[(3'h7):(1'h1)])};
  assign wire31 = ($unsigned($unsigned((|$unsigned(wire30)))) >>> wire26);
  assign wire32 = $signed(wire31);
  assign wire33 = {(!wire25[(3'h7):(3'h5)])};
  assign wire34 = wire27[(4'hb):(2'h2)];
  module35 #() modinst72 (.wire37(wire30), .wire36(wire26), .wire40(wire23), .y(wire71), .clk(clk), .wire38(wire33), .wire39(wire24));
  module73 #() modinst107 (wire106, clk, wire32, wire28, wire26, wire33);
  assign wire108 = (wire24 ~^ {(($signed(wire31) <= (wire24 ?
                               wire23 : wire31)) ?
                           {$signed(wire29),
                               ((8'haf) ?
                                   wire32 : wire24)} : $unsigned(wire25))});
  assign wire109 = wire25[(1'h1):(1'h1)];
  assign wire110 = {{(^~((^~wire106) ?
                               (wire26 ? (8'haa) : wire34) : (wire34 ?
                                   wire26 : wire23)))},
                       (((&wire33) > wire30) & wire109)};
  assign wire111 = wire34;
  assign wire112 = (|wire24[(4'ha):(4'h8)]);
endmodule

module module6
#(parameter param18 = (8'hb4), 
parameter param19 = {param18})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire17, wire16, wire15, wire14, reg13, reg12, reg11, (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed(($unsigned((^~$signed(wire7))) <= wire9[(3'h7):(1'h1)]));
      reg12 <= (8'hb4);
      reg13 <= $signed($unsigned(reg12));
    end
  assign wire14 = (wire8 ?
                      ($signed(wire9[(1'h1):(1'h1)]) ?
                          (wire10 ^~ $unsigned(reg11[(1'h1):(1'h1)])) : ({(wire10 > reg11),
                                  (reg12 ^ wire7)} ?
                              $unsigned(((8'haa) ?
                                  reg13 : reg13)) : ($unsigned(wire10) ^~ (reg13 ?
                                  wire8 : (8'haf))))) : (($signed($unsigned(reg11)) <<< (wire7[(1'h1):(1'h0)] - (~&reg11))) * (($unsigned(wire9) ?
                              $unsigned(wire10) : $signed((8'haf))) ?
                          $unsigned((+reg12)) : wire7)));
  assign wire15 = $unsigned(reg11);
  assign wire16 = {(^~(&$unsigned(((8'ha7) + wire8)))),
                      $signed((^((wire10 ?
                          wire10 : wire14) < (wire7 + wire9))))};
  assign wire17 = $unsigned(((+reg11[(4'hd):(4'hd)]) != ((~(wire16 ?
                          wire14 : (8'h9d))) ?
                      (wire7 ^ $signed(wire9)) : reg11)));
endmodule

module module73
#(parameter param104 = (|(~&(~&({(7'h42), (8'hb8)} - ((7'h44) ? (8'hbc) : (8'hb5)))))), 
parameter param105 = param104)
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire77;
  input wire [(4'he):(1'h0)] wire76;
  input wire [(3'h5):(1'h0)] wire75;
  input wire signed [(4'hc):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire80,
                 wire79,
                 wire78,
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
                 (1'h0)};
  assign wire78 = {(~$signed(wire76))};
  assign wire79 = (((8'hbe) <= wire78[(3'h5):(1'h1)]) ~^ ({$signed((wire75 ?
                              wire78 : wire76))} ?
                      ((wire76 ^ $signed(wire74)) ?
                          wire75 : $signed($unsigned(wire75))) : ((~&(wire76 <<< (8'ha0))) ?
                          (wire75[(1'h0):(1'h0)] >= $signed(wire75)) : $signed(((8'haa) - wire78)))));
  assign wire80 = wire76[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((wire74[(3'h6):(3'h6)] < ($signed($signed((~&(8'h9c)))) == wire80[(4'ha):(4'h9)])))
        begin
          reg81 <= wire76;
          reg82 <= ($signed((^$signed($unsigned(wire79)))) ?
              (^wire80[(4'hd):(4'hc)]) : ((8'hb0) ?
                  $unsigned((^(reg81 ?
                      wire79 : wire75))) : wire80[(2'h2):(1'h1)]));
          if (({((7'h44) ? (&reg81[(1'h1):(1'h1)]) : (^~$signed(wire75))),
                  (((wire80 ? wire76 : wire75) ?
                          (wire77 ? wire78 : (8'hb9)) : (^~(8'ha0))) ?
                      (-$unsigned(wire80)) : $unsigned(wire76[(2'h2):(1'h0)]))} ?
              (~|wire75) : wire79))
            begin
              reg83 <= ($unsigned(wire74) > (&wire74));
              reg84 <= (~(reg82[(1'h0):(1'h0)] ?
                  ($signed(wire74) ^ reg82) : (+($unsigned(wire80) + wire76[(2'h3):(2'h3)]))));
              reg85 <= reg82[(2'h3):(2'h2)];
            end
          else
            begin
              reg83 <= (reg82[(3'h4):(1'h0)] ?
                  $signed($unsigned(reg81[(1'h0):(1'h0)])) : ((^~{{reg83,
                          reg85},
                      (wire76 ^ wire78)}) < (+$unsigned(wire80[(1'h0):(1'h0)]))));
            end
          if ($unsigned($signed((($signed(wire77) ?
              reg85[(3'h7):(3'h4)] : $signed(reg81)) * ((wire78 ^ wire76) ?
              wire75 : wire74)))))
            begin
              reg86 <= {wire78};
              reg87 <= $signed((&$signed($signed(wire76[(3'h5):(2'h2)]))));
              reg88 <= wire77;
            end
          else
            begin
              reg86 <= wire79;
            end
        end
      else
        begin
          reg81 <= $unsigned($unsigned((^$signed((reg87 == wire80)))));
          if ((~($signed(reg83) > (|{(reg83 <= wire77), $signed(wire79)}))))
            begin
              reg82 <= (wire75 ~^ ($signed($signed({wire77})) && reg88[(4'he):(2'h2)]));
              reg83 <= $unsigned($unsigned((~$unsigned((reg86 ?
                  wire80 : (8'hba))))));
            end
          else
            begin
              reg82 <= reg86[(2'h3):(1'h0)];
              reg83 <= $unsigned({{wire78, $signed($signed(wire79))}, reg87});
              reg84 <= ((wire75 ^~ $unsigned(reg82)) == ($signed((reg85[(1'h1):(1'h1)] ?
                  (wire78 <= (7'h40)) : (wire76 ^~ wire79))) <= wire79[(2'h3):(1'h0)]));
              reg85 <= (((~|(((8'ha2) + wire76) || (reg85 * wire77))) ^~ reg81) ?
                  (~&(reg88 >= (^reg88))) : (^~reg83));
            end
        end
      reg89 <= {((((8'hb9) ? reg81 : (~&wire80)) ?
                  reg84 : (~$unsigned(reg87))) ?
              wire76[(4'he):(1'h1)] : (((reg85 <= reg81) ?
                      ((8'ha1) ? reg87 : (8'haa)) : reg82) ?
                  ((+reg84) + $unsigned(wire77)) : wire76[(3'h4):(3'h4)])),
          (8'hb8)};
      reg90 <= $unsigned($signed(reg87[(4'hc):(3'h6)]));
      reg91 <= reg90[(3'h5):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg92 <= (7'h40);
      reg93 <= (((((~&reg92) != (reg83 < wire77)) >= {(|wire76)}) ^ (($unsigned((7'h44)) ?
              $unsigned((8'hbd)) : $signed(wire79)) <<< $unsigned($unsigned(wire80)))) ?
          {reg92[(2'h3):(2'h3)]} : (~(|wire75[(1'h1):(1'h0)])));
      reg94 <= reg82[(2'h3):(1'h0)];
    end
  assign wire95 = (^wire80);
  assign wire96 = reg82;
  assign wire97 = wire95;
  assign wire98 = reg89;
  assign wire99 = wire79;
  assign wire100 = reg92[(3'h7):(3'h6)];
  assign wire101 = $signed(reg88);
  assign wire102 = $signed($unsigned((reg85 ?
                       {(~&reg82), {reg81, reg82}} : wire77)));
  assign wire103 = $signed((^$unsigned((reg83[(3'h7):(1'h1)] >>> $signed(wire102)))));
endmodule

module module35
#(parameter param69 = {(((((8'ha8) ? (8'h9f) : (8'h9d)) != ((8'h9d) ? (7'h42) : (8'hbd))) ^ ((|(8'hb2)) + {(8'hbd)})) << (^((!(8'ha8)) ? {(8'ha7), (8'ha3)} : (~(8'hae))))), (((~|{(8'hb5)}) ? {(~(7'h43)), {(8'h9e)}} : (((8'ha7) ? (8'ha4) : (8'hb7)) ? (^(8'ha8)) : {(7'h44), (8'hb5)})) > (!({(8'hb0)} < ((8'had) ? (8'hbb) : (8'ha3)))))}, 
parameter param70 = {(&(param69 + param69)), ((((param69 & param69) ? (8'hbe) : (param69 ? (7'h40) : param69)) <= {(param69 | param69)}) > ((|(param69 + param69)) ? ((param69 ? param69 : (8'ha9)) ? ((8'hac) || param69) : {param69}) : (param69 * {param69})))})
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire37;
  input wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire43,
                 wire42,
                 wire41,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire41 = (wire39 ?
                      (&(~^$signed((wire39 + wire37)))) : (($unsigned($signed(wire36)) ?
                              $signed((^wire36)) : $signed($signed(wire37))) ?
                          $unsigned(($signed(wire40) ?
                              wire36 : (+(8'h9c)))) : $unsigned($signed($signed(wire39)))));
  assign wire42 = (wire37 < $signed(wire40));
  assign wire43 = ({((8'hbe) != ($signed((8'ha4)) ? wire42 : {wire39, wire41})),
                      $signed(wire39[(5'h10):(5'h10)])} >> wire39[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      if ((~&wire38[(1'h0):(1'h0)]))
        begin
          reg44 <= {{((~^wire40) ?
                      wire41[(1'h0):(1'h0)] : $signed($unsigned((8'had)))),
                  wire39[(3'h6):(3'h4)]},
              wire41[(3'h7):(3'h4)]};
        end
      else
        begin
          reg44 <= ({$signed($unsigned({wire41, wire37})),
              (wire37 ?
                  $signed($signed(reg44)) : $signed((wire43 ?
                      wire42 : wire40)))} ~^ (wire42[(4'h9):(3'h4)] ?
              $unsigned({wire43[(4'hf):(4'he)],
                  wire38[(3'h5):(2'h3)]}) : wire38));
          reg45 <= (~$signed($signed(wire40)));
          if (wire39)
            begin
              reg46 <= (^($signed((~&(8'hae))) | (((^wire39) + wire42[(3'h7):(3'h7)]) ?
                  ($unsigned(reg45) ^~ $unsigned(reg45)) : reg45)));
              reg47 <= $unsigned($unsigned((-reg44[(3'h4):(1'h1)])));
              reg48 <= (wire39[(4'h8):(3'h7)] ?
                  ({wire41[(3'h5):(1'h0)]} >>> $signed((7'h42))) : ((~{wire43[(4'he):(3'h6)]}) ?
                      (~$unsigned($signed(wire41))) : ($signed((~reg47)) * $signed((~|wire43)))));
            end
          else
            begin
              reg46 <= wire40[(3'h7):(2'h3)];
              reg47 <= $signed((wire38 ?
                  (~((~^reg48) ?
                      (|wire43) : $signed(reg47))) : wire43[(3'h5):(3'h4)]));
              reg48 <= (($signed({reg46[(4'ha):(3'h5)]}) ?
                  (((!wire37) ?
                      $unsigned(wire43) : $signed(wire37)) | $signed(wire38)) : (|($signed(wire38) < $unsigned(reg48)))) != (($unsigned($unsigned((8'ha9))) ?
                  wire42[(1'h1):(1'h0)] : reg44[(3'h4):(3'h4)]) & $signed((wire43 && (8'ha8)))));
              reg49 <= $unsigned((((-(reg45 <= wire41)) ?
                  wire41 : {wire38, $unsigned(reg46)}) + {(~|(reg46 ?
                      (8'hb7) : reg44))}));
            end
        end
      reg50 <= wire39[(4'ha):(2'h2)];
    end
  assign wire51 = (~$signed(({reg45[(1'h1):(1'h1)], (reg50 ^~ wire40)} ?
                      (wire38 - {(8'hae)}) : reg46)));
  assign wire52 = ((~|$signed(($signed(reg48) ^~ {(8'ha0)}))) <<< $signed($unsigned((+reg47))));
  assign wire53 = (reg44 ?
                      (|(wire40[(1'h0):(1'h0)] ?
                          ((|reg44) ^~ $unsigned(wire36)) : ((~wire38) ?
                              (reg46 <= reg47) : $unsigned((8'hbf))))) : (8'ha6));
  assign wire54 = $signed(reg44[(3'h7):(1'h0)]);
  assign wire55 = (^($unsigned(wire54[(5'h13):(2'h2)]) || ($unsigned(wire52[(4'he):(3'h5)]) ?
                      ((8'h9c) ?
                          $unsigned(wire52) : reg45) : (!$unsigned(wire52)))));
  assign wire56 = wire53;
  always
    @(posedge clk) begin
      reg57 <= $signed((~^wire42[(4'h9):(3'h4)]));
      reg58 <= {reg45, $signed({$signed(reg47)})};
      reg59 <= {$signed(wire36[(3'h7):(1'h1)])};
      reg60 <= reg58;
      reg61 <= reg48;
    end
  always
    @(posedge clk) begin
      reg62 <= {reg57[(2'h2):(1'h1)]};
      reg63 <= wire43[(3'h7):(3'h7)];
      reg64 <= ((($unsigned(((7'h44) ? (8'hb4) : wire56)) ?
          $signed((reg63 * wire41)) : wire39[(4'he):(3'h6)]) > ($signed({reg57}) >>> {wire52,
          (reg46 & reg57)})) != $signed((wire55 - ((wire43 ?
              (8'haa) : (8'hac)) ?
          wire55[(1'h1):(1'h0)] : reg63))));
    end
  assign wire65 = $unsigned($unsigned((~^$signed((wire42 <<< (8'hbe))))));
  assign wire66 = {$unsigned(wire43)};
  assign wire67 = reg47;
  assign wire68 = (wire41[(3'h6):(3'h6)] ?
                      {$unsigned(((reg57 ?
                              reg59 : reg58) * $unsigned(reg59)))} : wire52);
endmodule
