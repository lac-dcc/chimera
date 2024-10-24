module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire132;
  wire [(2'h3):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire125;
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  assign y = {wire132,
                 wire129,
                 wire127,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire25,
                 wire27,
                 wire81,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire125,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire5 = $signed(wire0[(1'h1):(1'h1)]);
  assign wire6 = $signed((8'h9c));
  assign wire7 = $signed((7'h44));
  assign wire8 = $unsigned(wire1[(4'hb):(4'hb)]);
  assign wire9 = (wire5 + (~&$signed({((8'hbb) ? wire4 : wire6)})));
  assign wire10 = $signed($unsigned($signed(wire1)));
  module11 #() modinst26 (.clk(clk), .wire12(wire2), .wire13(wire0), .wire15(wire3), .wire14(wire1), .y(wire25));
  assign wire27 = wire5[(4'hd):(3'h5)];
  module28 #() modinst82 (.wire29(wire4), .wire30(wire6), .clk(clk), .wire31(wire25), .y(wire81), .wire32(wire10));
  assign wire83 = (&wire8[(2'h3):(1'h0)]);
  assign wire84 = ($signed($unsigned(wire27[(1'h1):(1'h1)])) == $signed({$signed({(8'ha5)})}));
  assign wire85 = (($signed(((-wire8) != (~|wire25))) << wire5) ?
                      ($signed((^~wire7)) ?
                          {$signed($unsigned((8'ha1))),
                              (wire3[(3'h4):(1'h1)] ?
                                  $signed((8'h9f)) : (-wire3))} : (-{(^wire81)})) : (~^$unsigned(({(8'hb1)} ?
                          wire1[(4'hf):(2'h3)] : (!wire2)))));
  assign wire86 = wire83[(2'h3):(1'h0)];
  module87 #() modinst126 (.wire89(wire5), .clk(clk), .wire88(wire25), .wire92(wire86), .y(wire125), .wire91(wire10), .wire90(wire4));
  module28 #() modinst128 (wire127, clk, wire5, wire3, wire81, wire2);
  assign wire129 = {($unsigned($signed((|wire127))) <= $unsigned((&(~wire127)))),
                       wire8};
  always
    @(posedge clk) begin
      reg130 <= $unsigned((8'hbd));
      reg131 <= wire5[(3'h5):(1'h0)];
    end
  assign wire132 = wire85;
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire92;
  input wire [(3'h7):(1'h0)] wire91;
  input wire [(5'h12):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire89;
  input wire signed [(4'he):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire93;
  assign y = {wire124, wire123, wire121, wire93, (1'h0)};
  assign wire93 = ($signed(wire92[(4'h8):(1'h1)]) ?
                      $signed((wire91[(1'h0):(1'h0)] ?
                          ($unsigned(wire91) & $signed((8'hb7))) : (~wire89))) : (($signed($unsigned(wire89)) ?
                          wire92 : wire89[(4'hd):(4'hd)]) || (8'haa)));
  module94 #() modinst122 (.y(wire121), .clk(clk), .wire95(wire90), .wire97(wire89), .wire96(wire88), .wire98(wire91));
  assign wire123 = (~&wire91[(1'h0):(1'h0)]);
  assign wire124 = (^wire92);
endmodule

module module28
#(parameter param80 = (-(^~({(8'hbe)} < (+(8'had))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire [(3'h7):(1'h0)] wire30;
  input wire signed [(3'h4):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire56,
                 wire55,
                 wire53,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 (1'h0)};
  assign wire33 = ({{{$signed(wire31), (~wire30)},
                              (wire32[(4'h9):(3'h5)] ?
                                  wire30 : $unsigned(wire30))},
                          wire32[(4'h9):(1'h1)]} ?
                      wire30 : (wire31 ?
                          ({{wire30, wire32}} ?
                              ($signed(wire29) ?
                                  (wire31 - wire31) : (wire32 ?
                                      wire32 : (8'hab))) : wire31[(4'hd):(4'hc)]) : $signed($signed($signed(wire31)))));
  assign wire34 = (8'ha4);
  assign wire35 = (~&(8'hb4));
  assign wire36 = $signed(wire29);
  module37 #() modinst54 (wire53, clk, wire33, wire35, wire32, wire31);
  assign wire55 = ((+($unsigned((~^wire36)) ?
                          ((wire33 ?
                              wire35 : wire29) ~^ (|wire31)) : $unsigned($unsigned(wire53)))) ?
                      $unsigned((|((wire34 ^ wire29) * wire30))) : (&$unsigned((wire34 ?
                          (wire29 ? wire31 : wire29) : $unsigned(wire29)))));
  assign wire56 = (^~(((!(wire55 < (8'ha9))) ? wire32 : wire30[(1'h1):(1'h1)]) ?
                      wire30[(1'h1):(1'h0)] : (($signed(wire35) == (wire53 || wire55)) >= $signed(wire29[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ((8'ha1))
        begin
          reg57 <= wire56[(2'h3):(2'h2)];
        end
      else
        begin
          if (wire36)
            begin
              reg57 <= wire55;
              reg58 <= ($unsigned((^(wire33 ?
                  $signed(wire31) : (~^wire30)))) + (&$signed(wire55[(2'h2):(2'h2)])));
              reg59 <= {$unsigned((!((wire36 ? wire32 : reg57) ?
                      ((8'ha8) ^ wire35) : $signed(wire55))))};
              reg60 <= (8'h9d);
            end
          else
            begin
              reg57 <= $signed(reg59[(4'hb):(1'h0)]);
              reg58 <= (+$signed($unsigned(reg58)));
              reg59 <= ($signed($signed(({(8'hb5),
                  wire53} | wire56))) <= $unsigned($signed($signed({wire56,
                  wire36}))));
              reg60 <= $unsigned(($signed($signed((8'hba))) ?
                  wire30 : ($signed((8'hb5)) || ($unsigned(wire31) ^~ (~^(8'h9e))))));
              reg61 <= (reg58[(2'h2):(1'h0)] ?
                  wire35 : $unsigned((reg58 ?
                      (7'h44) : $unsigned((wire35 * wire55)))));
            end
          reg62 <= (!$unsigned(((((8'ha4) ? (8'ha5) : wire53) ?
              (wire34 != reg61) : $unsigned(wire55)) >>> reg61[(2'h3):(2'h2)])));
          if (((wire31[(3'h6):(1'h1)] ^ $unsigned(((wire31 >>> (8'ha0)) ?
                  $unsigned(wire33) : $unsigned((7'h44))))) ?
              ($unsigned(wire30[(1'h0):(1'h0)]) << $signed($signed((reg61 ?
                  wire30 : (8'h9c))))) : reg61))
            begin
              reg63 <= (wire29 ? wire34 : (~^wire53[(3'h4):(1'h1)]));
              reg64 <= $unsigned((^~({wire55[(3'h5):(2'h3)]} ?
                  wire29[(2'h2):(1'h0)] : wire29)));
              reg65 <= reg62[(3'h6):(3'h6)];
              reg66 <= reg61[(3'h5):(1'h1)];
            end
          else
            begin
              reg63 <= $signed((!$signed(((wire31 || wire33) * (reg57 ?
                  reg64 : reg59)))));
            end
          if ($signed(wire31))
            begin
              reg67 <= reg59;
              reg68 <= (wire32[(4'hd):(1'h0)] ?
                  (&$signed(reg65[(1'h0):(1'h0)])) : $unsigned(($unsigned(wire56[(1'h0):(1'h0)]) <<< {wire32})));
              reg69 <= wire31;
            end
          else
            begin
              reg67 <= (((wire56 < {reg63[(4'hb):(2'h3)], $signed(reg59)}) ?
                      reg69[(1'h1):(1'h1)] : (~wire30[(2'h3):(2'h3)])) ?
                  {$signed(reg61),
                      $signed($signed(reg67[(3'h5):(3'h4)]))} : wire56);
              reg68 <= reg63;
            end
          reg70 <= $unsigned((($signed(reg60) * (((8'hba) || reg66) ?
              (8'hb5) : (~|wire53))) || {$signed($unsigned(wire32))}));
        end
    end
  assign wire71 = $unsigned($signed(($unsigned((reg70 ? reg65 : wire35)) ?
                      (^$signed((8'h9e))) : wire30[(1'h0):(1'h0)])));
  assign wire72 = reg61[(1'h0):(1'h0)];
  assign wire73 = $unsigned(($signed(wire71[(1'h0):(1'h0)]) > wire32[(1'h0):(1'h0)]));
  assign wire74 = (^((&(8'hb2)) <= $signed(((wire34 ? reg70 : reg61) ?
                      (reg68 ? reg69 : wire72) : reg68[(1'h1):(1'h0)]))));
  assign wire75 = $signed(wire73);
  assign wire76 = ((~^$signed({$unsigned(wire72)})) & reg57[(3'h5):(1'h0)]);
  assign wire77 = wire74;
  assign wire78 = (-((~&$unsigned((reg70 ?
                      wire74 : (8'hbd)))) >>> $signed(reg63[(4'h9):(1'h1)])));
  assign wire79 = wire53[(2'h3):(2'h3)];
endmodule

module module11
#(parameter param23 = ({({(^(8'hbe)), {(8'hb8), (8'ha5)}} ? (((8'h9e) || (7'h42)) ? {(8'haf), (8'ha0)} : ((8'haa) <= (8'ha6))) : ((~(8'hbb)) ? (+(8'ha4)) : ((8'hbf) ? (8'hb4) : (8'ha5))))} ? ({(8'had)} ? ((((8'h9c) ? (7'h44) : (8'ha5)) ? (~(8'h9e)) : (^(8'hb9))) + (((8'hac) == (8'hb1)) >>> ((8'haf) - (8'hb2)))) : (^~(8'hb7))) : {(-(8'h9d))}), 
parameter param24 = (8'hbb))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire [(3'h5):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  assign y = {wire22, wire21, wire20, wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = ($signed({$signed((wire12 >= wire13))}) ?
                      (+wire13) : wire13[(2'h2):(1'h0)]);
  assign wire17 = (($unsigned(wire14) ?
                          (wire16 ?
                              $unsigned((wire14 ^ wire16)) : {(~|wire15),
                                  (wire15 ^~ wire14)}) : $unsigned($signed((wire16 >>> wire16)))) ?
                      $signed(wire12) : $signed((wire12[(2'h2):(1'h1)] ?
                          $signed((wire12 > wire13)) : $signed(wire12))));
  assign wire18 = {$signed($unsigned(($signed((8'hbd)) & wire14))),
                      wire13[(3'h5):(1'h1)]};
  assign wire19 = $unsigned($signed($unsigned((wire13[(1'h1):(1'h1)] ?
                      $signed(wire18) : wire18))));
  assign wire20 = wire13;
  assign wire21 = ((~^$signed($unsigned((~^wire12)))) < wire14);
  assign wire22 = {(+(((wire20 >= wire20) & $signed(wire19)) ?
                          wire20[(3'h7):(2'h2)] : (~|$unsigned(wire17)))),
                      {$signed(wire14)}};
endmodule

module module37
#(parameter param52 = (|(|((~{(8'had), (8'ha9)}) ? ((~|(8'hb8)) ? (!(8'hbe)) : ((8'hae) ? (8'h9c) : (8'hb5))) : {(&(8'ha3)), {(8'ha2)}}))))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  input wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire43,
                 wire42,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire42 = $signed(wire38[(3'h7):(3'h4)]);
  assign wire43 = wire42[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg44 <= $unsigned(wire38[(3'h6):(3'h6)]);
      reg45 <= wire38;
      reg46 <= (~|wire43[(4'hd):(1'h1)]);
      reg47 <= $signed(wire41);
    end
  assign wire48 = {($unsigned($unsigned($signed(reg44))) << $unsigned({wire39[(4'hc):(4'ha)],
                          reg44}))};
  assign wire49 = wire39;
  assign wire50 = ($signed($signed($unsigned($signed((8'haa))))) ?
                      $signed(wire38[(3'h5):(1'h1)]) : $signed({(~&(-wire43)),
                          {(8'haf), wire41}}));
  assign wire51 = wire49;
endmodule

module module94
#(parameter param119 = (&{((((7'h43) ? (8'hb4) : (8'ha8)) == (&(8'hab))) ? (((8'h9c) ? (8'ha0) : (8'hae)) ? ((8'ha4) && (8'hbe)) : ((7'h40) <= (8'ha7))) : (!{(8'ha1)}))}), 
parameter param120 = (((~&param119) + param119) ? ((-((+(8'ha1)) ~^ (~|param119))) >>> ((((8'hab) + (8'ha9)) ? {param119} : {param119, param119}) ? ((&param119) && (param119 + param119)) : param119)) : ((+param119) || (((param119 ? param119 : (8'hb2)) ? (param119 ^ param119) : (param119 - param119)) >>> ((^param119) ? param119 : {param119})))))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire98;
  input wire [(2'h2):(1'h0)] wire97;
  input wire [(4'hc):(1'h0)] wire96;
  input wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire105,
                 wire101,
                 wire100,
                 wire99,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire99 = (8'hb3);
  assign wire100 = (8'hb2);
  assign wire101 = ($signed((~&$signed((wire96 >= wire96)))) < wire98[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg102 <= (((|$signed(wire101)) ?
          (8'ha1) : wire99) - (-$unsigned(wire98[(1'h1):(1'h1)])));
      reg103 <= wire98[(1'h1):(1'h1)];
      reg104 <= (reg102[(1'h0):(1'h0)] && (wire96 ?
          wire97[(2'h2):(1'h1)] : wire98[(2'h2):(2'h2)]));
    end
  assign wire105 = $unsigned($unsigned((~&$unsigned($unsigned(wire100)))));
  always
    @(posedge clk) begin
      reg106 <= wire96[(3'h7):(3'h5)];
      reg107 <= ((8'hbc) ?
          ($signed((8'hb1)) >>> (wire98 * wire96[(4'h8):(3'h4)])) : {(((~^wire105) < (~wire95)) ?
                  (~&(8'hb0)) : ((reg103 ? reg102 : wire99) ?
                      $signed(wire105) : (reg103 ? wire96 : wire98))),
              $unsigned(wire96)});
    end
  always
    @(posedge clk) begin
      reg108 <= wire96;
      reg109 <= ((~wire101[(4'hd):(1'h0)]) ?
          reg102[(2'h2):(1'h0)] : ((!(7'h44)) - reg104[(1'h1):(1'h1)]));
    end
  assign wire110 = (wire97[(1'h0):(1'h0)] ^ $unsigned((^(reg108 ?
                       $signed(reg109) : (^~wire95)))));
  assign wire111 = (~&wire98[(1'h1):(1'h0)]);
  assign wire112 = reg108[(2'h2):(1'h1)];
  assign wire113 = (((&($signed(reg108) >>> wire105[(1'h0):(1'h0)])) && (((~&wire111) ?
                       (8'hb8) : (~|reg109)) || ($unsigned(wire98) + wire96[(2'h2):(1'h0)]))) != wire97);
  assign wire114 = wire111[(2'h3):(1'h0)];
  assign wire115 = (&($signed(reg104[(4'he):(3'h6)]) <= ({(wire113 << (7'h43))} >> {wire114,
                       $unsigned((8'hbd))})));
  assign wire116 = wire101;
  assign wire117 = ($signed(reg102[(5'h13):(5'h10)]) << $unsigned(((wire116 & ((8'hbd) != wire105)) ?
                       $signed(wire110[(4'hd):(1'h1)]) : wire97[(2'h2):(2'h2)])));
  assign wire118 = wire117[(1'h1):(1'h0)];
endmodule
