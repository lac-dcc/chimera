module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire69;
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire124,
                 wire72,
                 wire5,
                 wire6,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire69,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg71,
                 (1'h0)};
  assign wire5 = ($signed((^~((wire1 ^~ wire0) * (+wire2)))) != wire1);
  assign wire6 = (((!({(8'haf)} ^~ wire1)) ?
                     $unsigned(({wire3, wire3} ?
                         wire1 : $signed((7'h42)))) : (^~{wire0[(2'h2):(1'h0)]})) - $unsigned((&{wire4})));
  always
    @(posedge clk) begin
      reg7 <= ((+{wire4[(1'h1):(1'h1)], $signed(wire2)}) ^ $signed(wire6));
      if (wire1)
        begin
          reg8 <= $signed(($unsigned((~&$unsigned(reg7))) < wire3));
          if (((!(reg7 ? wire6[(3'h5):(1'h0)] : $signed($signed(wire6)))) ?
              $unsigned($unsigned({(wire2 ? wire3 : reg8),
                  $signed(wire2)})) : (7'h41)))
            begin
              reg9 <= {((&(~|wire4[(2'h2):(1'h0)])) <<< ($unsigned(wire5) ?
                      wire3[(1'h0):(1'h0)] : {(^(7'h43))}))};
              reg10 <= wire5[(4'hb):(3'h6)];
              reg11 <= (!(wire1 ?
                  $signed(((8'h9c) >= $unsigned(reg10))) : $signed($signed($unsigned(wire2)))));
              reg12 <= ($signed($signed($signed(reg10))) > ((wire3[(3'h4):(1'h1)] <<< $signed((reg11 ?
                      wire3 : (8'haa)))) ?
                  $unsigned(wire5[(3'h4):(1'h1)]) : reg7));
              reg13 <= $unsigned(($unsigned($unsigned($signed(reg10))) ?
                  (&reg10[(3'h4):(3'h4)]) : (8'ha5)));
            end
          else
            begin
              reg9 <= $unsigned((~|reg9[(3'h7):(2'h2)]));
              reg10 <= (($signed(((wire4 * wire3) ?
                      (wire6 ? reg11 : reg9) : reg11[(1'h1):(1'h0)])) ?
                  (8'h9e) : $signed({(~&(8'ha6))})) | (~((reg9 ?
                      $unsigned(reg10) : $unsigned(reg12)) ?
                  $signed((wire6 ? (8'h9e) : wire1)) : (^$unsigned(wire3)))));
              reg11 <= wire1[(1'h1):(1'h0)];
              reg12 <= $signed($unsigned($unsigned(({wire4} == (reg9 ?
                  reg12 : reg12)))));
              reg13 <= (~^$signed((~|$signed({wire5}))));
            end
          reg14 <= wire0;
          reg15 <= {$signed($signed(wire0[(3'h7):(3'h5)]))};
          reg16 <= (~|$signed(($signed((wire2 ? (7'h43) : wire2)) ?
              ({reg7, reg13} < (reg10 ? wire0 : (8'hb3))) : (wire5 ?
                  (wire6 ? wire3 : reg15) : wire6))));
        end
      else
        begin
          reg8 <= {(~&$signed(wire6))};
          reg9 <= (^reg8[(1'h0):(1'h0)]);
          reg10 <= ($unsigned((~^(((8'ha4) ? (8'hb5) : reg8) < wire2))) ?
              $signed((~{((8'hbe) != reg16)})) : reg12);
          reg11 <= ((reg12 ? $signed(reg10[(3'h5):(3'h5)]) : reg14) ?
              {($unsigned((wire6 * reg8)) ?
                      ((reg8 ~^ wire1) ?
                          (wire2 && reg12) : (wire6 ?
                              reg11 : reg12)) : reg7[(1'h0):(1'h0)]),
                  (reg14 ^~ (|(reg12 ? reg9 : reg11)))} : (|{$signed(((8'ha8) ?
                      reg11 : (8'hb0))),
                  ((reg14 && wire5) ? (wire4 ? (8'ha1) : reg12) : (~wire6))}));
        end
      reg17 <= $unsigned($unsigned(((8'hb5) ?
          $unsigned(wire2) : $signed(wire4[(4'hb):(3'h6)]))));
      reg18 <= (reg15 || wire6);
      reg19 <= {reg7,
          {((~^(reg12 ^~ reg9)) ?
                  $signed($unsigned((8'ha6))) : (&reg14[(1'h0):(1'h0)])),
              wire1[(4'h9):(3'h7)]}};
    end
  assign wire20 = $signed($signed((wire3[(1'h0):(1'h0)] >>> reg15[(4'h9):(1'h0)])));
  assign wire21 = (&$unsigned($unsigned($unsigned(((8'hb3) ^~ wire1)))));
  assign wire22 = reg7;
  assign wire23 = {reg19[(4'h9):(3'h5)]};
  assign wire24 = $unsigned((8'ha1));
  module25 #() modinst70 (wire69, clk, reg16, wire4, wire21, wire1);
  always
    @(posedge clk) begin
      reg71 <= reg14[(4'hd):(3'h5)];
    end
  assign wire72 = $signed($unsigned((8'h9c)));
  module73 #() modinst125 (wire124, clk, wire1, wire72, wire20, reg17, wire4);
  assign wire126 = (reg13 ?
                       (wire22 ?
                           (~^wire2) : $signed($signed($signed(wire22)))) : {reg15[(1'h1):(1'h1)]});
  assign wire127 = wire6[(1'h1):(1'h1)];
endmodule

module module73  (y, clk, wire74, wire75, wire76, wire77, wire78);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire74;
  input wire [(4'hc):(1'h0)] wire75;
  input wire [(4'hb):(1'h0)] wire76;
  input wire [(5'h12):(1'h0)] wire77;
  input wire [(4'hc):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire [(3'h6):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire113;
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 reg119,
                 reg118,
                 (1'h0)};
  module79 #() modinst114 (.wire84(wire74), .clk(clk), .wire82(wire75), .wire80(wire76), .y(wire113), .wire81(wire78), .wire83(wire77));
  assign wire115 = (!(8'hac));
  assign wire116 = $unsigned(wire74);
  assign wire117 = ((8'hbb) ? wire115 : (~(^~(-(~&wire74)))));
  always
    @(posedge clk) begin
      reg118 <= ($signed((7'h42)) < wire75[(3'h4):(2'h3)]);
      reg119 <= (|wire76);
    end
  assign wire120 = reg118[(2'h2):(1'h0)];
  assign wire121 = {($unsigned($signed({wire113, wire120})) ?
                           $signed((~$unsigned(reg119))) : wire117[(3'h6):(3'h4)])};
  assign wire122 = wire116;
  assign wire123 = wire122;
endmodule

module module25  (y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire26;
  input wire [(2'h2):(1'h0)] wire27;
  input wire [(3'h5):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire57;
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  assign y = {wire67,
                 wire59,
                 wire30,
                 wire39,
                 wire40,
                 wire41,
                 wire57,
                 reg68,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire30 = {$signed($unsigned(wire28[(2'h2):(1'h0)]))};
  always
    @(posedge clk) begin
      reg31 <= $signed(wire26);
      reg32 <= $unsigned((^wire29));
      reg33 <= (^~$signed((+((~^wire27) - (wire29 >>> reg31)))));
      if ($signed(wire29))
        begin
          reg34 <= $signed(({($signed(wire28) ? (+(8'haf)) : $signed(reg33)),
              (~&$unsigned(wire29))} <= reg32[(3'h6):(2'h3)]));
          reg35 <= $signed($unsigned($signed(((+wire30) && reg32))));
        end
      else
        begin
          reg34 <= reg33;
          reg35 <= $signed($unsigned($unsigned((-$signed((8'ha8))))));
          reg36 <= wire27;
          reg37 <= reg33[(2'h2):(1'h1)];
        end
      reg38 <= $unsigned((((8'ha9) ?
              ({wire28} ^ reg35) : $signed(wire26[(4'hd):(4'hc)])) ?
          ($unsigned((8'ha4)) && ($signed((8'hab)) - reg36)) : reg35[(3'h6):(2'h3)]));
    end
  assign wire39 = $unsigned((($unsigned(wire30) ?
                      (wire28[(1'h0):(1'h0)] ^ (reg34 ?
                          reg33 : reg35)) : (~&$signed(reg31))) == reg33[(2'h2):(1'h0)]));
  assign wire40 = (wire29 ?
                      ($signed({$signed(wire29)}) ^~ wire27) : ($unsigned((~|$unsigned(wire28))) ?
                          $signed({(-reg31),
                              wire29}) : ($unsigned($signed(reg32)) ?
                              (reg33 * {wire28,
                                  wire28}) : {reg35[(4'h9):(4'h9)],
                                  $unsigned(reg38)})));
  assign wire41 = ($signed($signed(wire27)) ^ reg34[(3'h6):(2'h2)]);
  module42 #() modinst58 (.wire47(reg35), .wire46(wire30), .wire45(reg36), .y(wire57), .wire43(wire40), .clk(clk), .wire44(wire29));
  assign wire59 = wire27;
  always
    @(posedge clk) begin
      reg60 <= (|(!wire30));
      if (wire26[(4'hf):(4'ha)])
        begin
          reg61 <= reg36;
          if (wire29)
            begin
              reg62 <= (~(reg35[(3'h6):(3'h5)] ?
                  $unsigned({(wire39 & reg37), $signed(wire27)}) : (8'ha5)));
              reg63 <= {reg60};
              reg64 <= (8'ha7);
            end
          else
            begin
              reg62 <= reg60[(2'h3):(2'h3)];
              reg63 <= $unsigned((|reg61));
              reg64 <= $signed(reg35);
              reg65 <= wire29[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg61 <= wire26;
        end
      reg66 <= (~&wire41);
    end
  assign wire67 = ((reg66 ?
                          ((8'hb2) ?
                              wire27 : reg34[(3'h5):(2'h3)]) : $signed({(wire27 & reg65)})) ?
                      (~$unsigned(reg34[(1'h0):(1'h0)])) : (8'hb0));
  always
    @(posedge clk) begin
      reg68 <= reg38;
    end
endmodule

module module42
#(parameter param55 = (-((^~(+(~|(8'hb4)))) ? (8'ha4) : ((~&{(8'ha0), (8'hae)}) ? ((^(7'h41)) || {(8'ha0)}) : ((^(8'hba)) >= (~^(8'h9f)))))), 
parameter param56 = {{({(param55 ? (8'ha7) : (8'hbc)), (~param55)} <= ((param55 && param55) != {param55})), (({param55} && param55) | param55)}, ((~^({param55, param55} - (~param55))) - param55)})
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire47;
  input wire [(5'h13):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire [(4'he):(1'h0)] wire44;
  input wire [(4'he):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  assign y = {wire54, wire53, wire52, wire51, wire50, wire49, wire48, (1'h0)};
  assign wire48 = {wire44[(4'h9):(3'h5)]};
  assign wire49 = wire45[(4'hf):(4'h9)];
  assign wire50 = wire47[(3'h4):(1'h1)];
  assign wire51 = ({wire50} ?
                      wire44[(3'h4):(1'h1)] : (~((~(wire46 ?
                          wire47 : wire50)) ~^ ((wire43 ?
                          wire48 : (8'ha3)) & wire47[(4'h9):(3'h5)]))));
  assign wire52 = (~|wire50[(5'h10):(4'hb)]);
  assign wire53 = ($signed($unsigned($unsigned({wire49}))) ?
                      $signed($signed((!$signed((8'haa))))) : wire46[(3'h6):(2'h2)]);
  assign wire54 = ((~|$signed(((~wire45) ?
                          (wire46 <<< wire49) : $signed(wire49)))) ?
                      $signed((~^wire51[(3'h6):(2'h3)])) : ($signed(wire50[(1'h1):(1'h1)]) << (^~(&wire50))));
endmodule

module module79  (y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire84;
  input wire signed [(2'h2):(1'h0)] wire83;
  input wire [(4'hc):(1'h0)] wire82;
  input wire signed [(4'h9):(1'h0)] wire81;
  input wire signed [(4'hb):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire85;
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  assign y = {wire112,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire86,
                 wire85,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire85 = $signed(wire81);
  assign wire86 = (wire85 ?
                      (!$unsigned($unsigned((wire85 ?
                          wire82 : (8'hac))))) : ({(+((8'ha7) ?
                              wire85 : wire84))} >> {{(wire85 ?
                                  (8'hbe) : wire82),
                              {wire84}},
                          $unsigned((wire83 ? wire85 : (8'hb3)))}));
  always
    @(posedge clk) begin
      reg87 <= $unsigned(wire86[(3'h7):(3'h4)]);
      reg88 <= ({((((8'ha4) ? wire85 : (8'hb5)) >>> (wire86 >= wire80)) ?
              $signed($signed(wire81)) : (wire84 <= $signed((8'ha5)))),
          (~(+reg87[(3'h4):(2'h3)]))} >> ($signed(({wire83} ?
              wire82[(4'ha):(3'h4)] : (reg87 ? wire80 : wire83))) ?
          $unsigned(((wire86 ^ wire81) > $unsigned(wire81))) : {((&(8'ha7)) - (-wire84))}));
    end
  assign wire89 = ($signed(reg88) ?
                      $signed(((~|(wire83 ? wire80 : reg87)) ?
                          (^~$signed(reg87)) : ($unsigned(reg88) >>> $unsigned(wire85)))) : $signed((wire84 ?
                          wire81 : $signed($unsigned(reg87)))));
  assign wire90 = {{(wire89[(3'h4):(1'h1)] + wire85[(2'h2):(1'h1)])},
                      $unsigned(reg88)};
  assign wire91 = (~|$unsigned($unsigned($unsigned(((8'hb6) + wire83)))));
  assign wire92 = ($signed($signed((8'hab))) ?
                      $signed($signed($signed(reg87))) : (wire89[(1'h0):(1'h0)] ?
                          reg87[(4'ha):(2'h3)] : {((wire91 < (8'hba)) >> $signed(wire90)),
                              (+(|wire91))}));
  assign wire93 = (^~$signed(wire92[(4'ha):(3'h6)]));
  assign wire94 = wire91[(4'h9):(3'h6)];
  assign wire95 = (wire91 - reg88[(5'h10):(3'h5)]);
  assign wire96 = $unsigned($signed((+(wire86[(2'h2):(1'h0)] && (wire80 ~^ wire82)))));
  assign wire97 = ($unsigned((wire91[(1'h1):(1'h0)] ?
                          $signed((wire92 ?
                              wire85 : wire85)) : (~$unsigned(wire92)))) ?
                      wire89 : ((-wire94[(1'h0):(1'h0)]) || reg87));
  assign wire98 = wire86[(4'ha):(3'h4)];
  assign wire99 = ({($unsigned(wire95[(3'h7):(3'h6)]) && wire93[(4'ha):(2'h2)]),
                          (((wire97 != wire89) ~^ (reg88 != wire98)) ?
                              (~{wire94, wire83}) : {wire96[(4'h8):(3'h7)],
                                  {(8'ha7)}})} ?
                      ({wire94[(1'h1):(1'h1)]} ?
                          wire97 : ($unsigned(wire92[(1'h1):(1'h0)]) ?
                              ($unsigned((7'h44)) << $unsigned((8'ha9))) : wire98[(3'h4):(2'h3)])) : wire89[(2'h2):(1'h1)]);
  assign wire100 = $signed(wire81);
  assign wire101 = $signed((wire85[(4'hc):(3'h6)] ^~ $signed(wire93[(3'h5):(1'h0)])));
  assign wire102 = ((wire93[(3'h4):(1'h0)] ? wire91 : (8'ha0)) ?
                       wire80[(3'h6):(1'h0)] : (~|$signed(wire98[(4'hd):(3'h7)])));
  assign wire103 = ((8'hb4) ?
                       ($unsigned(wire82[(1'h1):(1'h1)]) ~^ ((wire94[(1'h0):(1'h0)] >= wire100[(2'h3):(1'h0)]) && (^(reg87 == wire94)))) : wire84);
  assign wire104 = (wire93 ?
                       ($signed($unsigned($signed(wire89))) ^ (({wire93,
                           wire98} - $unsigned(wire85)) >> $unsigned(wire102))) : wire89);
  assign wire105 = $signed((-{{$unsigned((8'ha1))}}));
  assign wire106 = (&wire104);
  always
    @(posedge clk) begin
      reg107 <= (!(^$unsigned((wire105[(3'h5):(1'h1)] || $unsigned(wire80)))));
      reg108 <= $unsigned((wire105[(3'h4):(1'h0)] ?
          (7'h41) : {$unsigned($unsigned(wire106)), wire93}));
      if (wire82[(1'h1):(1'h1)])
        begin
          reg109 <= $signed({(~|wire96[(3'h5):(3'h5)])});
          reg110 <= (({wire91, (-wire98[(1'h1):(1'h0)])} ?
              (^~wire84[(3'h5):(1'h0)]) : wire82[(2'h3):(1'h1)]) != reg107);
          reg111 <= ({($signed((wire104 ? reg88 : reg87)) < ((reg87 ?
                  wire106 : wire84) <<< (reg110 ?
                  reg88 : reg88)))} * $signed(wire106[(5'h10):(2'h2)]));
        end
      else
        begin
          reg109 <= ($signed(((~&wire100[(3'h4):(2'h2)]) || ({reg108} ^~ wire80[(4'h8):(3'h5)]))) ?
              (^~$unsigned(wire84[(1'h1):(1'h0)])) : $unsigned(wire101));
        end
    end
  assign wire112 = {wire104};
endmodule
