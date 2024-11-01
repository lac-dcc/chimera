module top
#(parameter param115 = ((!(((-(8'hb4)) <= ((8'ha9) <<< (8'hbc))) != (((8'hb2) ? (8'hb3) : (8'h9d)) & (+(8'ha3))))) ? ((-(8'ha4)) ? (~(7'h41)) : {{{(8'hbb), (8'haa)}, ((7'h43) ? (7'h42) : (8'hb4))}, {(~&(8'hb5)), (|(8'hbd))}}) : (-(((~|(8'h9d)) ? ((8'h9c) | (8'hbe)) : (~(7'h41))) ^ (!((8'haf) <= (8'haf)))))), 
parameter param116 = param115)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire113, wire21, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed($unsigned(wire1));
  assign wire6 = {(((!{wire4, wire3}) >= ((wire5 ?
                             (8'h9c) : wire2) & wire3[(3'h4):(1'h1)])) ?
                         wire3 : {({wire0} == wire5[(4'ha):(3'h7)]),
                             $signed((wire3 >= wire2))}),
                     ($signed($signed((~&wire0))) <= $signed(wire0))};
  assign wire7 = (wire6 >= wire0[(3'h6):(1'h0)]);
  assign wire8 = $unsigned((8'ha2));
  module9 #() modinst22 (wire21, clk, wire4, wire1, wire0, wire6);
  module23 #() modinst114 (.y(wire113), .wire27(wire7), .wire26(wire4), .wire25(wire5), .clk(clk), .wire24(wire6));
endmodule

module module23
#(parameter param111 = (((8'hba) >>> (~(((8'hb0) ? (8'hab) : (8'hbc)) < (~&(8'hb9))))) ? (((((8'hb2) ? (8'ha4) : (8'hb0)) ? ((7'h43) ? (8'hac) : (8'hbc)) : {(8'hb8), (7'h40)}) ? {(~(8'ha4))} : (8'hb2)) ? (^({(8'ha9), (8'hac)} ? ((8'hb9) ? (8'hb7) : (8'hbe)) : (8'h9c))) : (((~^(8'h9d)) ? (-(8'hb6)) : ((8'ha1) == (7'h41))) - (+{(8'ha5)}))) : (~{{{(8'ha7), (8'haa)}, (^(7'h44))}})), 
parameter param112 = (param111 >>> ((8'haa) && (((param111 ? param111 : param111) && (param111 * param111)) ? ((param111 < param111) * (param111 ? param111 : param111)) : {(^~param111), (param111 ? (8'hbd) : param111)}))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  input wire [(3'h5):(1'h0)] wire25;
  input wire [(5'h10):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire95;
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire72,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire74,
                 wire78,
                 wire95,
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
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire28 = (wire25[(1'h1):(1'h1)] ? wire25 : wire27);
  assign wire29 = (!($unsigned(wire28[(3'h4):(1'h0)]) ?
                      (&wire25[(1'h1):(1'h1)]) : wire26));
  assign wire30 = $unsigned($unsigned(((wire27[(2'h2):(1'h0)] ?
                      (~&wire24) : (8'hb3)) && $signed($unsigned(wire28)))));
  assign wire31 = ((wire26 <<< wire27[(2'h3):(1'h0)]) ?
                      ((!{$signed(wire25),
                          (wire27 >> wire25)}) >= wire29[(4'h8):(1'h1)]) : ((wire28[(3'h4):(1'h1)] ?
                          wire30 : $unsigned(((8'ha3) <<< (7'h41)))) ^~ wire29));
  assign wire32 = (~$unsigned((wire27 ~^ wire28)));
  assign wire33 = (^((&wire31) >>> ($signed(wire24[(4'h9):(3'h7)]) ^ (+$signed((8'hb4))))));
  assign wire34 = (($unsigned($signed(wire29[(4'he):(2'h2)])) ?
                      (((wire29 ?
                          wire26 : wire27) + wire33[(2'h2):(2'h2)]) < (wire24[(3'h7):(2'h2)] | (~|(8'ha2)))) : ((-$unsigned(wire24)) + wire26[(3'h7):(3'h7)])) >>> $unsigned((wire28 ?
                      wire28[(3'h5):(2'h2)] : (~|$signed(wire32)))));
  module35 #() modinst73 (wire72, clk, wire30, wire24, wire29, wire33, wire31);
  assign wire74 = wire31[(4'ha):(1'h1)];
  always
    @(posedge clk) begin
      reg75 <= (~(wire72 ?
          {$signed((wire27 ? (8'hb4) : (8'hb2)))} : wire72[(4'hd):(1'h1)]));
      reg76 <= wire31[(3'h6):(1'h1)];
      reg77 <= wire34[(4'hf):(2'h3)];
    end
  assign wire78 = {((~&$unsigned($signed(wire29))) ?
                          ({wire34[(3'h4):(1'h1)], wire24[(3'h6):(1'h1)]} ?
                              wire29[(5'h12):(2'h2)] : $signed((wire31 ?
                                  wire27 : wire27))) : (~|($signed(wire32) ?
                              $signed((8'haa)) : $unsigned(wire32))))};
  module79 #() modinst96 (.wire81(wire28), .wire80(wire32), .wire83(wire78), .wire84(wire26), .wire82(wire74), .clk(clk), .y(wire95));
  always
    @(posedge clk) begin
      reg97 <= (+$unsigned((((wire27 == wire74) >= wire78[(1'h0):(1'h0)]) ?
          $unsigned((~&wire74)) : {$unsigned(wire28), $unsigned(reg75)})));
      reg98 <= {(|$unsigned($signed((!(8'hbc)))))};
      if (wire32[(3'h7):(3'h4)])
        begin
          reg99 <= wire31[(1'h1):(1'h0)];
          reg100 <= reg99;
          reg101 <= {{$unsigned(($signed((7'h40)) ?
                      (wire78 | (8'ha7)) : {wire95})),
                  wire24}};
          reg102 <= wire30[(3'h6):(3'h5)];
          if ({$unsigned((8'ha9))})
            begin
              reg103 <= (+$unsigned($unsigned((^~(|(8'ha3))))));
              reg104 <= reg103[(1'h0):(1'h0)];
              reg105 <= wire26;
              reg106 <= $unsigned((reg75 ?
                  $signed(($unsigned((8'ha2)) ?
                      (reg105 ?
                          reg103 : reg77) : wire34[(4'he):(4'h9)])) : $unsigned($signed($unsigned(reg104)))));
              reg107 <= ({reg102[(3'h4):(1'h0)], (8'h9c)} ?
                  ($signed(((^reg99) == wire29)) ?
                      ({(wire26 ? wire31 : wire31)} ?
                          (~wire32[(4'ha):(3'h6)]) : $unsigned((reg104 || wire27))) : ($unsigned((wire74 < reg77)) ?
                          ((8'ha5) * $signed(wire34)) : wire34)) : (reg77[(1'h0):(1'h0)] | (((reg75 ?
                      reg105 : wire74) <<< (reg101 ~^ (8'hba))) | (wire27[(3'h6):(2'h3)] ?
                      {reg106, wire29} : $signed((8'hbf))))));
            end
          else
            begin
              reg103 <= {$unsigned($unsigned(wire27))};
            end
        end
      else
        begin
          if ((((((~|wire78) ?
                  ((8'hb4) >>> wire29) : (wire28 ?
                      (8'ha3) : reg107)) >= wire72[(4'h9):(3'h4)]) ?
              {$signed($unsigned(wire28))} : reg98) ~^ reg77))
            begin
              reg99 <= reg100;
              reg100 <= $signed(reg77);
              reg101 <= {$signed($unsigned({(wire30 ? (7'h44) : (7'h44))})),
                  (8'had)};
              reg102 <= wire33[(3'h7):(1'h0)];
            end
          else
            begin
              reg99 <= {(^$unsigned({{reg98, reg98}, $unsigned(wire95)}))};
              reg100 <= wire32[(3'h4):(3'h4)];
              reg101 <= $signed(wire27[(3'h4):(3'h4)]);
            end
          reg103 <= ($unsigned(reg101[(1'h0):(1'h0)]) ?
              ($signed((wire95 ^~ (wire72 ? wire33 : wire26))) ?
                  (~&wire95) : reg102[(3'h5):(3'h5)]) : $unsigned((^~(|$signed(wire29)))));
          reg104 <= reg104;
          if (wire34[(4'he):(4'h9)])
            begin
              reg105 <= $unsigned(reg106);
              reg106 <= wire95[(3'h4):(2'h2)];
            end
          else
            begin
              reg105 <= reg104;
              reg106 <= $unsigned({(&{$unsigned(wire31),
                      reg102[(3'h4):(1'h1)]}),
                  ($unsigned(wire31[(4'hb):(1'h1)]) >> wire32[(4'hb):(1'h1)])});
              reg107 <= $unsigned(wire25);
            end
        end
    end
  assign wire108 = $unsigned(reg76[(3'h7):(2'h3)]);
  assign wire109 = (-$unsigned(reg104[(4'hb):(3'h4)]));
  assign wire110 = wire28;
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire signed [(2'h2):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  input wire signed [(3'h5):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  assign y = {wire20, wire19, wire15, wire14, reg18, reg17, reg16, (1'h0)};
  assign wire14 = wire10[(1'h1):(1'h0)];
  assign wire15 = {(wire10[(3'h5):(1'h1)] >>> $signed($signed({wire12,
                          wire13}))),
                      $signed($signed($signed($signed(wire14))))};
  always
    @(posedge clk) begin
      reg16 <= ((($unsigned($signed(wire14)) <<< (8'ha4)) ?
              (8'hbd) : $unsigned(((wire15 ? wire13 : wire11) + {wire13,
                  wire10}))) ?
          $unsigned((({wire12, wire10} ?
              (wire12 || wire12) : ((8'hbe) ?
                  wire14 : wire12)) <= wire10[(3'h5):(2'h3)])) : $unsigned($signed(wire14[(1'h1):(1'h0)])));
      reg17 <= $unsigned((^wire10));
      reg18 <= wire10;
    end
  assign wire19 = $unsigned($signed($signed($signed(wire10))));
  assign wire20 = (((wire10[(1'h1):(1'h1)] == ($signed(wire19) ?
                          $unsigned(wire19) : (wire11 ^~ (8'haf)))) ?
                      (((reg18 ? reg17 : reg17) ?
                              wire14[(4'h9):(4'h9)] : (^wire13)) ?
                          $unsigned((wire10 || wire19)) : $signed((reg16 << wire10))) : {(wire12[(2'h2):(1'h1)] ?
                              $unsigned(wire12) : (~^reg16)),
                          (-{reg17})}) || wire11);
endmodule

module module79  (y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire84;
  input wire [(4'hf):(1'h0)] wire83;
  input wire [(5'h11):(1'h0)] wire82;
  input wire [(3'h7):(1'h0)] wire81;
  input wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 reg89,
                 (1'h0)};
  assign wire85 = $signed((!$unsigned(wire80[(1'h0):(1'h0)])));
  assign wire86 = $unsigned(wire81[(3'h6):(3'h5)]);
  assign wire87 = wire83;
  assign wire88 = ({($signed({wire81}) ?
                          (wire81[(2'h3):(2'h2)] ^ wire87) : ((wire80 || wire87) ?
                              (wire86 ? (8'ha3) : wire80) : (wire86 ?
                                  (8'hac) : wire85))),
                      (wire85 ?
                          $signed($unsigned(wire86)) : $signed(wire83))} && (wire82[(1'h1):(1'h0)] <<< ((wire81 || (8'h9c)) ?
                      $signed((!wire80)) : wire83[(4'hc):(1'h0)])));
  always
    @(posedge clk) begin
      reg89 <= $signed(wire86);
    end
  assign wire90 = reg89[(4'h8):(3'h4)];
  assign wire91 = $signed((^~wire87));
  assign wire92 = wire87;
  assign wire93 = $unsigned((!((~|(^~wire84)) * (~|(&wire81)))));
  assign wire94 = wire80;
endmodule

module module35
#(parameter param70 = ((|({((8'hb4) ? (8'ha5) : (8'hbe)), {(7'h43), (8'hbb)}} ? (((8'ha2) <<< (8'hba)) | ((8'hb0) + (7'h44))) : (((8'ha4) ? (8'hbf) : (8'ha3)) >> ((8'hbd) | (8'hb9))))) <= {((((8'hb3) ? (8'ha1) : (8'hbf)) <<< ((8'h9c) ? (8'haa) : (8'hb4))) ? {{(8'hbf)}, ((8'hb5) + (8'ha7))} : ((8'hbb) && (8'hb5)))}), 
parameter param71 = ({(((param70 ? (8'hbf) : param70) ? {param70, param70} : (param70 - param70)) >> param70)} ? (^~(param70 ? (&(param70 > param70)) : (+(param70 ? param70 : param70)))) : ((8'hbf) <= param70)))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire40;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire [(5'h10):(1'h0)] wire38;
  input wire signed [(4'hb):(1'h0)] wire37;
  input wire [(4'he):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  assign y = {wire62,
                 wire60,
                 wire59,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg61,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire41 = wire36[(3'h4):(2'h3)];
  assign wire42 = wire36;
  assign wire43 = (^~((wire41 > wire36) ?
                      {$unsigned(wire36[(1'h0):(1'h0)]),
                          ({wire37, wire38} - (wire40 ?
                              wire39 : wire38))} : (^$signed((wire41 >= wire42)))));
  assign wire44 = (&(wire43 ? wire36 : wire39[(1'h0):(1'h0)]));
  assign wire45 = ((^wire44[(3'h7):(3'h5)]) ?
                      (($unsigned((+wire41)) ^ $unsigned((wire41 ?
                          wire41 : wire37))) || ((wire41[(5'h13):(4'h9)] ?
                          $unsigned(wire37) : wire36[(4'hc):(2'h3)]) * wire39)) : {wire42[(3'h5):(2'h3)],
                          wire41});
  assign wire46 = (wire39 >= $signed(wire42));
  assign wire47 = ($signed(wire39[(4'h8):(3'h7)]) - wire38);
  always
    @(posedge clk) begin
      reg48 <= wire47;
      reg49 <= ((wire40[(3'h4):(3'h4)] != wire36[(4'he):(3'h5)]) ^ $unsigned(wire47[(2'h2):(1'h0)]));
      reg50 <= (~&($unsigned(((wire38 ?
              wire47 : wire36) << $unsigned(wire45))) ?
          (|wire36[(1'h0):(1'h0)]) : (&(~$signed((8'ha8))))));
      reg51 <= $signed({reg50[(2'h3):(1'h0)],
          {wire44[(3'h5):(2'h2)], (|(wire39 ? wire47 : reg49))}});
      if (wire42[(3'h4):(2'h2)])
        begin
          if ($unsigned($unsigned((((reg49 + wire45) ?
              wire38[(4'he):(1'h1)] : wire45[(1'h0):(1'h0)]) & {{reg49,
                  wire46}}))))
            begin
              reg52 <= $signed((reg50 ?
                  reg50 : (+$signed(wire39[(3'h7):(3'h6)]))));
              reg53 <= reg50[(3'h4):(2'h2)];
              reg54 <= $unsigned((reg52[(1'h0):(1'h0)] ?
                  ({$signed(wire45)} * (wire39 ?
                      wire41[(4'he):(4'h9)] : (+reg49))) : $unsigned($signed((wire45 <= wire45)))));
            end
          else
            begin
              reg52 <= $unsigned((($signed(wire40[(4'h8):(3'h5)]) && ((+wire41) ^ wire36)) == wire46));
              reg53 <= wire40;
            end
          reg55 <= reg53[(3'h7):(1'h0)];
          reg56 <= ((wire42 * wire40[(3'h7):(3'h7)]) >> {$unsigned($unsigned((wire45 - (8'haf))))});
          reg57 <= wire42;
          reg58 <= reg50;
        end
      else
        begin
          reg52 <= (((($signed(reg53) ? (8'ha6) : (reg58 ? wire40 : wire45)) ?
                  reg54[(1'h0):(1'h0)] : ({wire44,
                      wire41} == wire46[(3'h4):(1'h0)])) ?
              (&(~^{(7'h40)})) : (wire38 ^~ ($unsigned(wire47) ~^ $unsigned(reg58)))) >>> ((wire45 & (8'h9e)) ?
              wire43[(4'ha):(2'h2)] : ((&reg50) ?
                  $signed(wire39) : (!(wire43 != wire36)))));
          reg53 <= $signed((~{$signed(wire36[(4'hb):(2'h3)]), (|wire38)}));
        end
    end
  assign wire59 = reg52[(3'h4):(2'h2)];
  assign wire60 = wire44;
  always
    @(posedge clk) begin
      reg61 <= reg52[(3'h5):(2'h3)];
    end
  assign wire62 = reg54[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg63 <= (+(-$signed(reg56[(1'h1):(1'h0)])));
      reg64 <= wire36[(4'h8):(4'h8)];
      reg65 <= reg55[(4'he):(4'h9)];
      if (wire41)
        begin
          if ((wire59 ?
              (((wire41 ?
                  (7'h40) : (wire44 - wire44)) * $signed((|reg51))) > $signed(((reg57 ?
                      wire59 : (8'ha5)) ?
                  (wire36 ?
                      wire41 : reg53) : wire59[(4'h8):(3'h6)]))) : (~&{$signed($unsigned(wire42))})))
            begin
              reg66 <= wire59[(4'hf):(1'h1)];
            end
          else
            begin
              reg66 <= (reg66 >>> {$signed($unsigned(reg58[(2'h2):(2'h2)]))});
            end
          reg67 <= (~&(&($signed($signed(wire38)) ?
              $signed((^~wire62)) : reg56[(2'h2):(2'h2)])));
          reg68 <= (~&(~&$signed((~&(8'hab)))));
        end
      else
        begin
          if (wire38)
            begin
              reg66 <= wire62[(1'h1):(1'h0)];
            end
          else
            begin
              reg66 <= reg52;
              reg67 <= (~wire44);
            end
          reg68 <= {reg48[(3'h6):(3'h6)], $unsigned(reg49)};
          reg69 <= ((wire42 != (^reg53)) ?
              ($unsigned(reg52[(4'h8):(3'h4)]) & (((wire39 ? reg67 : wire39) ?
                  $unsigned(reg55) : (wire60 << wire43)) ^ reg65)) : (^(&$unsigned((wire40 != reg68)))));
        end
    end
endmodule
