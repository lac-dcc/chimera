module top
#(parameter param130 = (((((+(8'hab)) ? (~&(8'hab)) : ((8'ha6) ? (8'h9f) : (8'hb1))) <<< (7'h41)) ? (+(((8'haa) && (8'ha9)) ? ((8'h9c) * (8'hba)) : (!(8'hba)))) : (^~(((8'hbc) ? (8'hab) : (8'ha6)) || ((8'hb7) ? (8'hab) : (7'h40))))) >> ((8'hb9) ? ({((8'ha7) > (8'hb6))} ? (~((8'hab) * (8'ha9))) : (+((8'h9d) + (8'hb0)))) : ((8'hb0) != {{(8'hbb), (8'ha5)}, (!(8'ha9))}))), 
parameter param131 = param130)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  assign y = {wire129, wire128, wire126, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {(wire2[(1'h1):(1'h0)] >>> wire0),
                     $unsigned((+$unsigned((wire2 ? wire1 : wire1))))};
  assign wire5 = wire3[(1'h0):(1'h0)];
  assign wire6 = $unsigned($signed((wire3[(1'h1):(1'h0)] <= ($unsigned(wire0) == (!wire3)))));
  assign wire7 = wire5[(3'h4):(3'h4)];
  module8 #() modinst127 (.wire11(wire7), .clk(clk), .wire10(wire1), .wire12(wire5), .y(wire126), .wire9(wire2));
  assign wire128 = (^wire126[(1'h1):(1'h0)]);
  assign wire129 = (wire0[(2'h2):(1'h0)] >>> wire126);
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire97;
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  assign y = {wire125,
                 wire123,
                 wire51,
                 wire13,
                 wire53,
                 wire60,
                 wire97,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 (1'h0)};
  assign wire13 = (-({(wire9[(4'hd):(4'hc)] < (wire11 < wire9))} > ($signed({wire12}) >>> ((~|wire9) ?
                      $signed(wire12) : (wire10 != wire12)))));
  always
    @(posedge clk) begin
      if ((wire11 <= $signed({{wire12}})))
        begin
          reg14 <= (wire13 ? $unsigned(wire10) : wire11[(3'h5):(1'h0)]);
        end
      else
        begin
          reg14 <= wire13;
          reg15 <= (~^$signed((~{$signed(wire9)})));
          reg16 <= ((($unsigned($signed((8'haa))) + ((wire11 ?
                  reg14 : reg14) ^~ $signed(wire12))) >= (($unsigned(wire10) && $unsigned(reg14)) >>> (-wire9))) ?
              (~&(($signed(wire11) <<< wire10) ?
                  ((wire11 ? wire9 : (8'hba)) ?
                      $unsigned(wire12) : reg15[(3'h6):(3'h6)]) : (~{wire13}))) : reg14[(5'h11):(4'hd)]);
          reg17 <= {$unsigned($unsigned($unsigned((reg16 == wire10))))};
        end
      reg18 <= $unsigned((($signed((reg14 ?
          wire9 : reg17)) ~^ (|wire11)) >>> wire12));
      reg19 <= {{wire9}, ((7'h42) >> reg16[(4'ha):(2'h2)])};
    end
  module20 #() modinst52 (wire51, clk, reg14, reg17, wire11, reg15, reg16);
  assign wire53 = $signed((wire11[(3'h4):(3'h4)] ?
                      (8'hbf) : (($unsigned(wire10) ?
                              (reg17 + reg14) : $unsigned(reg17)) ?
                          wire9 : $signed(((8'ha2) && wire13)))));
  always
    @(posedge clk) begin
      if (reg15[(4'hb):(4'h8)])
        begin
          reg54 <= reg18;
        end
      else
        begin
          reg54 <= reg19[(3'h6):(2'h3)];
          reg55 <= ((&(~^(~(-(8'haf))))) ?
              $signed($signed(reg19[(3'h4):(1'h0)])) : ((~&wire12) ?
                  ((reg14[(5'h10):(4'h9)] == wire13) != reg15[(5'h13):(4'ha)]) : ((+(wire51 != wire53)) << ((reg17 ?
                          reg19 : reg17) ?
                      $unsigned(reg19) : wire51))));
          reg56 <= {wire9,
              {(~$signed($unsigned(reg14))), (wire10 << wire9[(4'ha):(4'ha)])}};
          reg57 <= (((((reg56 ^ reg16) ^~ $signed(wire9)) ~^ $signed($signed(reg55))) ?
                  reg56 : ($unsigned(((8'hbc) ? wire13 : wire12)) ?
                      (~&(wire12 ? reg55 : reg15)) : wire9)) ?
              $signed($signed((reg55 <= ((8'hb8) ? reg19 : wire13)))) : wire12);
          reg58 <= {wire10[(1'h1):(1'h0)]};
        end
      reg59 <= $unsigned($unsigned($unsigned((reg16 ?
          reg14[(1'h0):(1'h0)] : (7'h41)))));
    end
  assign wire60 = ((~&{reg16[(4'ha):(4'h8)], $unsigned($unsigned(wire11))}) ?
                      {(($signed(wire9) ?
                              (reg57 ?
                                  reg58 : reg18) : (reg18 << wire51)) | (8'ha9)),
                          (8'h9c)} : ((~$unsigned($signed(wire13))) >>> $signed((reg55[(2'h3):(1'h0)] ?
                          $unsigned(reg57) : reg56[(3'h5):(2'h2)]))));
  always
    @(posedge clk) begin
      if (reg55[(2'h3):(1'h0)])
        begin
          reg61 <= (~((!wire11) << (^~reg17)));
          if (($unsigned(((~&wire12) << ((^~wire11) - (^~(8'hae))))) ?
              $unsigned(((reg56 == reg58) > ((reg56 ~^ wire60) <<< $signed(reg14)))) : ((($unsigned(reg61) ?
                      $unsigned(reg54) : {reg15}) ?
                  ($signed(wire13) ?
                      (~^wire10) : reg55) : (~&$signed(reg58))) <<< wire10)))
            begin
              reg62 <= reg14[(4'h9):(3'h6)];
              reg63 <= reg61[(2'h3):(2'h2)];
              reg64 <= $unsigned(reg61);
              reg65 <= (reg64[(3'h5):(3'h5)] >> ((^reg54) ?
                  (reg18[(4'hb):(4'h9)] ?
                      (~$unsigned(wire12)) : $signed((^reg63))) : $signed((~|{reg62}))));
            end
          else
            begin
              reg62 <= {(^~$signed(((!reg59) ? reg15 : reg64))),
                  ($unsigned(reg16[(4'ha):(3'h5)]) ?
                      $unsigned((^{wire10,
                          wire11})) : (reg58 >> $unsigned($unsigned(reg18))))};
            end
          reg66 <= (wire10[(5'h14):(4'hd)] ?
              ($signed((-reg14[(1'h0):(1'h0)])) ?
                  (8'hbe) : ((-(reg65 != reg55)) ?
                      (reg56 ?
                          (reg55 ?
                              wire60 : reg61) : reg65) : (8'hb5))) : reg57);
          reg67 <= $unsigned($signed(reg56));
        end
      else
        begin
          reg61 <= wire13[(4'he):(2'h3)];
        end
      reg68 <= (^~{reg66[(2'h3):(1'h0)],
          $signed(($unsigned(reg59) && $signed(reg16)))});
      reg69 <= $unsigned((~^(~|(^~$unsigned(reg19)))));
      reg70 <= $unsigned(({{{wire13, (7'h40)},
              $unsigned(reg55)}} >> $unsigned(((wire10 ?
          reg56 : wire11) ^ (reg56 != reg56)))));
    end
  module71 #() modinst98 (wire97, clk, reg70, wire11, reg59, reg18, reg56);
  module99 #() modinst124 (wire123, clk, reg66, reg67, reg64, reg59, reg57);
  assign wire125 = wire97[(3'h4):(2'h3)];
endmodule

module module99
#(parameter param121 = (&({((8'ha3) ? ((8'h9f) + (7'h42)) : {(8'hbd), (7'h42)}), (((8'ha8) | (8'hb6)) ? (8'h9d) : ((8'ha6) > (8'h9c)))} & {(((8'hbf) * (8'hb1)) ? ((8'haf) ^ (8'hb9)) : ((8'had) ? (8'ha6) : (8'ha5))), (((8'hb9) ? (8'hab) : (8'hab)) ~^ (^(8'hb5)))})), 
parameter param122 = {((param121 <= ((~|param121) ? (param121 >= (8'ha6)) : (~(8'h9f)))) ? ((8'had) - {(param121 ? param121 : param121)}) : param121), (-({(param121 != param121)} > param121))})
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire104;
  input wire signed [(4'hf):(1'h0)] wire103;
  input wire signed [(3'h6):(1'h0)] wire102;
  input wire [(5'h11):(1'h0)] wire101;
  input wire [(2'h3):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 wire105,
                 reg114,
                 reg113,
                 reg112,
                 reg107,
                 (1'h0)};
  assign wire105 = $signed((($signed(wire103) >>> ($unsigned((8'ha6)) ~^ wire103[(4'he):(1'h0)])) ?
                       wire103 : (wire104[(3'h6):(1'h0)] == ({wire101,
                           wire101} <= (wire103 < wire101)))));
  assign wire106 = ($unsigned((((wire105 != wire105) > (|wire104)) ?
                       $signed(wire105) : $signed((-(8'h9e))))) == (~wire102[(3'h6):(1'h1)]));
  always
    @(posedge clk) begin
      reg107 <= wire103;
    end
  assign wire108 = ((-wire105) != wire105[(4'hd):(4'ha)]);
  assign wire109 = (($signed((8'h9c)) ?
                           ((!reg107) ?
                               wire105 : {reg107[(1'h0):(1'h0)],
                                   (wire106 ?
                                       (7'h43) : wire105)}) : (-wire101[(2'h3):(2'h2)])) ?
                       ({$unsigned(wire104[(4'h9):(2'h3)]), wire100} ?
                           wire100 : (($signed(wire108) == wire108) ?
                               ($signed(wire106) ?
                                   (8'had) : wire100[(1'h1):(1'h0)]) : {{wire100,
                                       wire108}})) : ({$signed((wire106 ?
                               reg107 : wire104))} <<< $signed($signed((~|wire105)))));
  assign wire110 = (reg107 ?
                       {($signed((wire104 ? (8'hb4) : (7'h41))) + (^{wire102,
                               (7'h41)}))} : wire101);
  assign wire111 = wire110[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg112 <= wire111[(1'h0):(1'h0)];
      reg113 <= (wire102 ?
          {$signed({(wire103 <= wire100), $unsigned(wire105)}),
              (((wire111 ? wire100 : wire104) ?
                  (wire102 << wire104) : wire106[(3'h5):(2'h2)]) * ((wire110 >>> wire109) || wire101[(4'he):(2'h3)]))} : ($unsigned(wire101) ?
              {wire104,
                  ((8'ha9) ?
                      {wire104} : $unsigned(reg107))} : $signed($unsigned({reg107}))));
      reg114 <= wire109;
    end
  assign wire115 = ({((((8'hb3) ^~ (8'hb8)) * $unsigned(wire102)) ?
                           $unsigned((wire102 | wire109)) : (reg113 - wire101))} < ((((wire101 ?
                               wire105 : wire102) ?
                           (~&wire105) : wire109) ?
                       (wire108[(1'h0):(1'h0)] >> $signed(wire106)) : wire100[(1'h1):(1'h1)]) - (wire102[(2'h2):(1'h0)] <= wire109)));
  assign wire116 = wire108;
  assign wire117 = ({(($unsigned(wire110) || {wire103}) ?
                           (wire104 == $signed(wire100)) : wire103),
                       wire111} < (~|{wire109[(2'h3):(2'h3)]}));
  assign wire118 = reg112[(2'h2):(2'h2)];
  assign wire119 = ({wire115[(4'hd):(4'h9)], wire118} ?
                       $unsigned($signed(wire104[(4'h8):(2'h3)])) : {wire104[(3'h5):(1'h1)],
                           {wire118[(4'hb):(1'h1)],
                               ($unsigned(wire104) ?
                                   (wire105 >= wire106) : wire109)}});
  assign wire120 = ((|(^~{wire109[(3'h4):(2'h2)], $signed(wire116)})) ?
                       $unsigned($signed(reg107[(3'h4):(1'h1)])) : wire117);
endmodule

module module71  (y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire76;
  input wire [(5'h13):(1'h0)] wire75;
  input wire [(3'h7):(1'h0)] wire74;
  input wire [(4'h9):(1'h0)] wire73;
  input wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire78,
                 wire77,
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
                 (1'h0)};
  assign wire77 = ((wire74[(3'h7):(2'h2)] ~^ ((wire74[(1'h0):(1'h0)] ?
                              (&(8'hb4)) : (wire73 != wire75)) ?
                          ((8'hb1) ?
                              ((8'hb5) - wire74) : (+wire72)) : wire73[(2'h2):(2'h2)])) ?
                      wire74[(1'h0):(1'h0)] : $signed(wire73[(3'h6):(3'h6)]));
  assign wire78 = (~^{wire72[(3'h5):(1'h0)], $signed($signed({wire74}))});
  always
    @(posedge clk) begin
      reg79 <= $unsigned(((~|wire78) <<< ($signed({(8'ha2), wire75}) ?
          ((8'ha2) ?
              (wire74 ? wire72 : wire77) : $unsigned(wire75)) : (8'hab))));
      if (($signed($unsigned(wire72)) == $signed($unsigned(((reg79 ?
          wire76 : wire74) && (wire74 ? reg79 : wire74))))))
        begin
          if ($signed($signed($unsigned(wire72))))
            begin
              reg80 <= $unsigned($unsigned((7'h44)));
              reg81 <= $signed((~(reg79[(5'h10):(3'h5)] ? (7'h40) : wire74)));
              reg82 <= $signed((8'hb0));
            end
          else
            begin
              reg80 <= ((wire75 ?
                      $unsigned(wire76[(4'h8):(3'h5)]) : wire76[(4'hd):(4'h9)]) ?
                  (reg81 * (+wire73)) : {reg79[(2'h2):(1'h1)], wire74});
              reg81 <= reg82;
              reg82 <= ((-$signed((!$unsigned((8'h9c))))) ?
                  wire74[(1'h0):(1'h0)] : ((reg80 < ((wire76 <<< wire77) ?
                      (wire77 != reg80) : wire76[(3'h5):(2'h3)])) >>> (~&(-wire75))));
              reg83 <= (8'hb0);
              reg84 <= (~$unsigned(($signed({(8'ha4)}) && {(~wire74)})));
            end
          reg85 <= (wire72[(4'h8):(4'h8)] < $signed(reg83));
          reg86 <= (((&wire75[(3'h7):(2'h2)]) ?
                  (8'hb6) : (reg81 ?
                      reg79[(3'h7):(3'h5)] : (&$unsigned(wire74)))) ?
              reg83[(5'h13):(4'hc)] : (($signed($signed(reg82)) ?
                      $unsigned(wire77[(3'h7):(1'h1)]) : $signed((wire75 ^~ reg81))) ?
                  {$signed((^~(8'hb5)))} : $unsigned(((reg83 ?
                      (8'ha2) : wire74) && $signed(reg81)))));
          reg87 <= {reg86};
          reg88 <= ($signed({($signed(reg82) ? reg81[(1'h1):(1'h1)] : reg81),
              wire72}) ~^ (!($signed(wire72[(3'h7):(3'h5)]) != reg79[(1'h1):(1'h0)])));
        end
      else
        begin
          if (reg83)
            begin
              reg80 <= reg88[(3'h5):(3'h5)];
              reg81 <= $signed(({reg82, reg87} << wire73[(2'h3):(1'h1)]));
              reg82 <= ({{((reg80 ? wire76 : reg82) | reg86),
                          reg79[(4'hb):(4'hb)]},
                      wire73[(3'h7):(2'h3)]} ?
                  $signed((((wire74 ? (8'hb5) : reg83) ?
                      $unsigned(reg86) : {reg88,
                          wire76}) & {(wire76 ^~ wire74)})) : (8'haa));
              reg83 <= wire72[(3'h5):(2'h2)];
              reg84 <= wire77;
            end
          else
            begin
              reg80 <= ($unsigned({(wire73 & $signed(reg79))}) ?
                  ({({wire75, reg88} * (wire78 ? (8'hb7) : reg82))} ?
                      reg82[(4'h9):(4'h8)] : wire74[(3'h4):(1'h0)]) : $signed(wire74[(3'h7):(3'h6)]));
              reg81 <= wire74;
            end
          reg85 <= (~^({reg85, (8'ha9)} != reg88[(4'hc):(3'h7)]));
          reg86 <= wire78[(1'h1):(1'h1)];
        end
      reg89 <= (8'hae);
    end
  assign wire90 = (!(($unsigned((+reg81)) ?
                          (~&wire73[(2'h3):(2'h3)]) : ((+wire77) ?
                              (|wire76) : $unsigned(reg87))) ?
                      ($unsigned(wire75) ?
                          $unsigned(((8'hb5) ?
                              wire76 : wire75)) : $signed({reg83,
                              (8'hb4)})) : wire77));
  assign wire91 = (!wire77[(3'h5):(3'h5)]);
  assign wire92 = $signed(wire90);
  assign wire93 = {wire76[(4'hb):(3'h5)]};
  assign wire94 = ($signed((!reg84[(1'h1):(1'h1)])) ?
                      $unsigned({{(8'hb5), $unsigned((8'h9d))}}) : (({(wire73 ?
                                  reg81 : reg85),
                              (reg80 << wire73)} >> (8'ha8)) ?
                          wire74 : (+(+$signed(wire76)))));
  assign wire95 = $unsigned(wire91[(3'h4):(3'h4)]);
  assign wire96 = (~|((8'ha7) >> ((wire74[(1'h0):(1'h0)] <= (reg84 ^~ reg89)) ?
                      $signed($signed(reg85)) : ($signed(reg83) ?
                          $signed(reg80) : reg87[(1'h1):(1'h0)]))));
endmodule

module module20
#(parameter param49 = (((~^(|((8'hab) ? (8'hb4) : (8'hac)))) + {(((8'h9d) << (8'hb4)) || (!(8'hbd))), {((8'ha3) ? (8'hb0) : (8'hbb))}}) << (~|((7'h43) ? ((8'hac) ? (~&(8'ha7)) : ((8'hb1) ? (7'h43) : (8'hb3))) : (~&((8'hae) ? (8'hae) : (8'ha9)))))), 
parameter param50 = ({(((param49 > param49) < (param49 ? param49 : (7'h40))) ? {(~&(8'hb3)), param49} : ({param49} ? (param49 ? (8'ha1) : param49) : param49)), (~&{(param49 ? param49 : param49), (8'ha3)})} || ((param49 ? ((param49 ? param49 : param49) ? (param49 ? param49 : param49) : {param49, (8'hbc)}) : ((~&param49) ? param49 : (+param49))) ? ((param49 ? {param49} : (param49 << param49)) ? param49 : (param49 ^~ (param49 <= (8'h9d)))) : (param49 ? (param49 ? (param49 - param49) : (-param49)) : {(+param49), (param49 ? param49 : (7'h40))}))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire signed [(4'h8):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  assign y = {wire48,
                 wire33,
                 wire32,
                 wire28,
                 wire27,
                 wire26,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire26 = $unsigned($signed(((8'hbd) ?
                      (-{wire21,
                          wire23}) : (wire24[(1'h0):(1'h0)] < wire21[(3'h5):(3'h4)]))));
  assign wire27 = ($unsigned((-wire25)) < $unsigned({((^wire25) <= wire21[(1'h0):(1'h0)]),
                      $unsigned(wire22)}));
  assign wire28 = $unsigned(($signed(((^wire27) > (|(8'hbb)))) ?
                      $unsigned($signed((^~(7'h40)))) : (~|($signed(wire24) ?
                          (^~wire22) : $unsigned((8'hbb))))));
  always
    @(posedge clk) begin
      reg29 <= ({$unsigned((^wire27))} ? wire23[(1'h1):(1'h1)] : wire23);
      reg30 <= wire21[(2'h3):(1'h0)];
      reg31 <= (^~(($unsigned(wire28[(4'h8):(4'h8)]) & (^$signed(wire27))) ?
          ((^wire25) >>> wire26[(1'h1):(1'h0)]) : wire24));
    end
  assign wire32 = (wire28[(4'he):(4'he)] * $signed($unsigned((wire22 ?
                      $signed(wire28) : (wire26 < wire27)))));
  assign wire33 = (^~{$unsigned($unsigned(wire28))});
  always
    @(posedge clk) begin
      reg34 <= wire23[(2'h2):(2'h2)];
      if ($signed(($signed(wire25[(3'h5):(1'h0)]) < ($unsigned(wire24) ~^ {reg30,
          reg34}))))
        begin
          reg35 <= (($signed(((wire21 ^~ reg31) ?
                      reg31[(3'h6):(1'h1)] : wire23[(1'h1):(1'h0)])) ?
                  (^$signed((wire24 ?
                      wire22 : wire23))) : $unsigned(wire28[(4'hb):(3'h4)])) ?
              ((8'hb9) ^ $unsigned($signed(wire24[(1'h1):(1'h1)]))) : $unsigned(reg29));
          reg36 <= (~^($unsigned(reg29[(3'h6):(3'h6)]) <<< $unsigned((8'hb3))));
          reg37 <= {wire27[(4'ha):(1'h0)]};
        end
      else
        begin
          reg35 <= (({$signed((|wire32)),
              $signed({wire23, reg35})} != {reg30[(2'h3):(1'h1)]}) < {wire26,
              $signed(reg30[(3'h6):(1'h0)])});
          if ($signed((~&wire22[(4'hd):(3'h7)])))
            begin
              reg36 <= $unsigned((($signed((wire21 * wire32)) & ({wire32,
                          wire26} ?
                      (&wire22) : wire24[(4'h8):(3'h5)])) ?
                  $signed((+(-reg34))) : (|reg31)));
              reg37 <= (|reg34[(3'h5):(1'h1)]);
              reg38 <= $unsigned(reg37[(4'h9):(2'h3)]);
            end
          else
            begin
              reg36 <= reg31[(2'h2):(1'h1)];
              reg37 <= (8'hb9);
              reg38 <= $unsigned(({wire28[(3'h4):(1'h1)]} ?
                  (+$signed(wire23)) : $signed({wire23[(1'h0):(1'h0)],
                      reg30})));
              reg39 <= (|{wire27[(3'h6):(2'h3)], wire23[(2'h3):(1'h1)]});
              reg40 <= (wire21[(4'h8):(3'h6)] != $signed($signed((8'hb9))));
            end
          if ((~{(reg36[(4'h9):(4'h9)] ?
                  wire23[(3'h6):(1'h0)] : ((wire26 >>> wire27) ?
                      $signed(wire27) : (reg29 ? reg40 : (7'h43)))),
              ($signed(wire22) ? reg31[(2'h3):(1'h1)] : (~&$signed(wire25)))}))
            begin
              reg41 <= reg29[(4'hd):(2'h2)];
            end
          else
            begin
              reg41 <= reg34[(3'h4):(2'h2)];
              reg42 <= reg31[(3'h5):(2'h2)];
              reg43 <= $unsigned(wire32[(2'h3):(2'h3)]);
              reg44 <= $signed(reg40);
            end
          reg45 <= ($signed($signed($signed((reg42 >> wire28)))) ^ ((~&($signed(reg38) == {reg44})) ?
              ($unsigned((wire32 ?
                  wire22 : (8'hb8))) || (reg37[(1'h0):(1'h0)] <= $signed(reg31))) : $unsigned(wire24)));
        end
      reg46 <= reg41[(3'h7):(3'h5)];
      reg47 <= $unsigned(((-(-(wire33 <<< wire33))) & {(wire22[(3'h7):(1'h1)] ?
              reg43 : reg39[(2'h2):(1'h0)]),
          $unsigned({wire21, wire22})}));
    end
  assign wire48 = {$unsigned((reg34 >> wire27[(1'h1):(1'h1)])), reg34};
endmodule
