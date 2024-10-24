module top #(parameter param185 = (8'hba)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire184;
  wire signed [(3'h7):(1'h0)] wire169;
  wire signed [(4'ha):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire171;
  wire signed [(4'he):(1'h0)] wire172;
  wire [(4'he):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire174;
  wire [(3'h7):(1'h0)] wire175;
  wire [(4'hb):(1'h0)] wire176;
  wire [(4'he):(1'h0)] wire177;
  wire signed [(3'h4):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire180;
  wire [(4'ha):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire182;
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  assign y = {wire184,
                 wire169,
                 wire99,
                 wire13,
                 wire96,
                 wire171,
                 wire172,
                 wire173,
                 wire174,
                 wire175,
                 wire176,
                 wire177,
                 wire178,
                 wire180,
                 wire181,
                 wire182,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg98,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((((8'ha4) ?
              $unsigned((wire1 > (8'hac))) : wire0) * wire0[(5'h11):(4'hb)]) ?
          (((~^wire1) ^ wire3[(2'h2):(1'h1)]) >> (8'hae)) : (((~&(wire3 ?
                  wire3 : wire2)) ?
              ((wire2 ? (8'hb4) : wire3) ?
                  wire2[(1'h0):(1'h0)] : {wire0,
                      wire1}) : wire0[(3'h5):(3'h5)]) && ((7'h41) ?
              $signed($unsigned(wire1)) : wire1[(4'hc):(4'hc)]))))
        begin
          reg4 <= $signed(wire2);
          reg5 <= wire3;
          reg6 <= $signed($signed(($unsigned($unsigned(wire0)) ?
              wire1 : (+$unsigned((8'hab))))));
          reg7 <= $unsigned((reg4 ?
              $unsigned($unsigned((reg6 ?
                  wire0 : (8'hb1)))) : ($unsigned(((8'ha2) || reg4)) ?
                  wire0 : $unsigned(wire2[(3'h5):(2'h3)]))));
        end
      else
        begin
          if ($unsigned(wire3))
            begin
              reg4 <= (~reg4);
              reg5 <= reg4;
              reg6 <= $unsigned((~&{({wire1, wire3} | wire2), reg4}));
            end
          else
            begin
              reg4 <= $signed((+(reg4[(2'h2):(2'h2)] ^ (reg4[(4'h9):(4'h9)] ?
                  $signed(wire0) : $signed(reg6)))));
            end
          reg7 <= (^~$signed(({(reg4 != wire2)} ?
              ((wire0 ? (8'hbb) : wire0) ?
                  (^~wire3) : {wire0}) : {$signed(reg4)})));
          reg8 <= $signed((^reg7));
          reg9 <= (8'hb9);
        end
      reg10 <= (~&$signed({$signed((~|wire2)), $signed(wire1)}));
      reg11 <= $signed($unsigned((8'hb7)));
      reg12 <= (wire2[(3'h4):(2'h2)] ?
          reg7[(1'h0):(1'h0)] : $signed(($signed(reg8) ?
              $signed($unsigned(wire0)) : reg6[(4'hd):(4'h9)])));
    end
  assign wire13 = wire3[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed((8'hb3)))
        begin
          reg14 <= wire3[(1'h1):(1'h1)];
          reg15 <= (~&(reg11[(5'h11):(4'hd)] ?
              {$unsigned((wire1 <<< reg11)),
                  ((wire2 ?
                      reg8 : reg9) <= (reg10 != reg5))} : $unsigned(((|reg12) ?
                  $signed(wire1) : (wire2 & wire0)))));
          reg16 <= ((|($unsigned((!reg10)) <<< (+wire3[(4'h8):(3'h4)]))) ?
              wire0 : {$unsigned((reg5 ?
                      (reg9 >= reg6) : (reg10 ? reg15 : reg15)))});
          reg17 <= ($signed({$signed(reg16[(1'h1):(1'h0)])}) != $signed(wire0[(4'hb):(2'h2)]));
        end
      else
        begin
          reg14 <= {($unsigned(wire2) ? $unsigned({$signed(reg8)}) : reg10),
              $unsigned($signed((8'ha1)))};
          reg15 <= reg9;
          reg16 <= $signed($signed($signed((reg8[(3'h4):(2'h3)] ?
              (reg9 ? reg5 : (8'ha0)) : (~|wire0)))));
          if ($unsigned(($unsigned($unsigned($signed(wire1))) ?
              {$unsigned((^~reg17)),
                  $unsigned((^reg14))} : $unsigned((+$signed(wire0))))))
            begin
              reg17 <= {reg5,
                  ($unsigned((wire2 ?
                          ((8'ha8) ? reg5 : reg4) : $unsigned(reg9))) ?
                      {reg16[(4'h9):(1'h1)]} : $signed($unsigned((~reg8))))};
            end
          else
            begin
              reg17 <= (($signed($signed((7'h41))) > $signed(reg16)) - {$signed(reg11),
                  reg17[(2'h2):(1'h1)]});
              reg18 <= (-$signed((reg11[(4'ha):(3'h5)] ?
                  reg6[(3'h6):(2'h3)] : $unsigned(wire0))));
              reg19 <= (reg17 ?
                  reg15[(4'h8):(3'h5)] : ((((^reg15) ~^ $unsigned(wire13)) << (+{reg8})) * {(|reg18),
                      $unsigned(reg7[(4'h9):(3'h7)])}));
              reg20 <= {(wire13 ?
                      (!$unsigned(reg5)) : (reg11[(4'hf):(4'hc)] ?
                          $signed($signed(reg16)) : reg15)),
                  ($signed(wire0[(4'h9):(3'h5)]) ?
                      (!(^~(reg8 - wire13))) : $signed($signed(wire3[(4'h9):(4'h8)])))};
              reg21 <= (^~($unsigned(((reg6 - wire2) ?
                  reg20 : (wire3 || wire1))) - reg14[(3'h5):(3'h4)]));
            end
          reg22 <= (reg20[(3'h6):(3'h6)] && $signed((~reg10[(2'h3):(2'h2)])));
        end
    end
  module23 #() modinst97 (wire96, clk, reg19, reg10, wire2, reg18, reg11);
  always
    @(posedge clk) begin
      reg98 <= wire1[(5'h13):(5'h12)];
    end
  assign wire99 = reg22[(2'h2):(1'h1)];
  module100 #() modinst170 (.wire101(reg4), .clk(clk), .wire103(reg15), .wire104(reg11), .wire102(reg18), .y(wire169), .wire105(wire2));
  assign wire171 = reg14[(3'h7):(2'h2)];
  assign wire172 = $signed(wire1[(5'h15):(5'h15)]);
  assign wire173 = (wire2 == wire169);
  assign wire174 = $signed(((((wire172 && reg17) >>> (reg18 ? reg12 : reg19)) ?
                           wire99[(3'h7):(3'h7)] : ($signed(reg18) - reg16[(3'h7):(2'h3)])) ?
                       $signed({wire2[(4'hf):(4'ha)],
                           reg12[(4'hb):(4'hb)]}) : $signed(((&reg6) - $unsigned(reg19)))));
  assign wire175 = (reg14 ?
                       (^~((|wire99) ?
                           (&$unsigned(reg12)) : reg19)) : wire3[(1'h0):(1'h0)]);
  assign wire176 = (($signed(($signed(reg5) || {reg22})) ?
                           (({wire172} & (~(8'hb1))) >> $unsigned((~reg16))) : reg5) ?
                       wire171[(1'h0):(1'h0)] : (~|wire169));
  assign wire177 = (8'ha0);
  module80 #() modinst179 (wire178, clk, wire96, reg22, reg5, reg7, wire99);
  assign wire180 = reg16[(3'h6):(1'h0)];
  assign wire181 = wire175;
  module32 #() modinst183 (.y(wire182), .wire33(wire173), .wire35(wire174), .wire37(reg17), .clk(clk), .wire34(wire13), .wire36(reg16));
  assign wire184 = reg22;
endmodule

module module100  (y, clk, wire101, wire102, wire103, wire104, wire105);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire101;
  input wire signed [(4'hc):(1'h0)] wire102;
  input wire [(4'he):(1'h0)] wire103;
  input wire [(5'h13):(1'h0)] wire104;
  input wire signed [(4'h9):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire168;
  wire [(3'h6):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(4'hf):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire122;
  wire [(4'h8):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire164;
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire106,
                 wire107,
                 wire108,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire164,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire106 = (+($signed($signed(((8'hb5) + (8'ha9)))) ?
                       $signed(($unsigned(wire101) ^~ (wire103 != wire102))) : wire104));
  assign wire107 = wire101;
  assign wire108 = $signed(((^{wire105[(3'h6):(3'h5)],
                       wire102[(1'h0):(1'h0)]}) >= (wire103[(3'h4):(2'h3)] ?
                       (wire103[(4'hd):(1'h0)] ?
                           $signed(wire104) : wire102[(1'h1):(1'h0)]) : $unsigned(wire103))));
  always
    @(posedge clk) begin
      reg109 <= ({(8'ha4),
          ($signed($unsigned(wire105)) >>> {((7'h41) - wire107)})} == wire101);
      if (((~reg109[(3'h5):(2'h2)]) ?
          $unsigned(wire108[(1'h1):(1'h1)]) : (|wire104[(4'hb):(2'h3)])))
        begin
          if ((~^(^$unsigned(wire107))))
            begin
              reg110 <= (|(^{wire105[(4'h8):(3'h5)], wire102}));
            end
          else
            begin
              reg110 <= reg109;
              reg111 <= ($signed(($unsigned((~|(8'ha4))) ?
                      $signed($unsigned(wire101)) : $signed((~^wire106)))) ?
                  $unsigned($signed(wire103[(2'h2):(1'h1)])) : wire105[(4'h9):(4'h8)]);
            end
          reg112 <= {wire101};
          reg113 <= reg110;
          reg114 <= ($unsigned(wire103) << $signed((~^((reg113 ?
                  wire102 : wire105) ?
              $signed(wire103) : $unsigned((7'h43))))));
        end
      else
        begin
          reg110 <= ($unsigned((~&$signed(((8'hab) != reg112)))) ^~ wire108);
        end
    end
  assign wire115 = (+$unsigned(reg112));
  assign wire116 = wire105[(4'h9):(1'h1)];
  assign wire117 = wire115;
  assign wire118 = (|{$signed($unsigned(wire115[(4'hc):(1'h0)])),
                       reg111[(2'h3):(2'h3)]});
  assign wire119 = wire107;
  assign wire120 = $signed((^$signed(($signed(reg112) ?
                       (reg114 ? wire108 : wire118) : (~|wire107)))));
  assign wire121 = (reg109[(2'h2):(2'h2)] ?
                       $signed((^~wire104[(1'h1):(1'h0)])) : $signed({$signed((&wire117)),
                           $signed((wire103 ? wire102 : wire116))}));
  assign wire122 = wire105;
  assign wire123 = $unsigned({wire120[(3'h6):(2'h2)], wire119});
  module124 #() modinst165 (wire164, clk, wire102, wire122, wire106, wire107, wire118);
  assign wire166 = ($signed(reg113) ^ (reg111[(1'h0):(1'h0)] <= wire120[(4'ha):(4'h9)]));
  assign wire167 = (wire105[(3'h7):(2'h2)] * $signed($signed(((~(8'ha5)) ?
                       wire103 : wire103))));
  assign wire168 = {wire104[(1'h1):(1'h0)]};
endmodule

module module23
#(parameter param94 = (~((&(|{(8'hb2), (8'hba)})) ^~ (((~(7'h41)) < (!(8'hbb))) << ({(8'h9f)} * ((8'ha4) * (8'hae)))))), 
parameter param95 = ((-{(8'h9f), (-(param94 ? param94 : param94))}) < (~|param94)))
(y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire [(4'hd):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire26;
  input wire signed [(4'he):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire92;
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  assign y = {wire29,
                 wire63,
                 wire65,
                 wire66,
                 wire67,
                 wire77,
                 wire78,
                 wire79,
                 wire92,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire29 = wire25;
  always
    @(posedge clk) begin
      reg30 <= (^(^$unsigned(wire29)));
      reg31 <= $signed($signed(wire29[(4'hd):(4'hd)]));
    end
  module32 #() modinst64 (wire63, clk, wire24, reg30, wire29, wire25, wire27);
  assign wire65 = (~|({$unsigned(wire29[(3'h4):(3'h4)])} ^ $signed(wire26)));
  assign wire66 = ($signed($signed((reg31[(3'h6):(1'h1)] <<< ((8'ha9) ?
                          wire25 : wire25)))) ?
                      ((8'ha4) || $unsigned(((reg31 >> wire25) ?
                          ((8'h9f) ~^ (7'h43)) : $unsigned(wire65)))) : $signed(wire25));
  assign wire67 = $unsigned((~|($signed($signed(wire65)) || wire65)));
  always
    @(posedge clk) begin
      reg68 <= wire27[(2'h2):(1'h1)];
      reg69 <= ((|reg30) + (~^(wire66[(4'he):(2'h2)] ?
          (&$unsigned(wire26)) : {((8'hbe) & wire67), $signed(reg68)})));
      reg70 <= ((~&(&($signed(wire29) || wire29[(4'he):(2'h3)]))) < ($signed(wire29[(4'ha):(4'h8)]) << (~&((&wire25) ?
          $signed(wire63) : (8'hbc)))));
      if (((8'hb6) ? $signed(wire67[(3'h7):(1'h0)]) : (|reg69[(4'hd):(3'h6)])))
        begin
          reg71 <= $signed($signed(wire63));
          if ($unsigned(wire29[(4'hc):(2'h2)]))
            begin
              reg72 <= reg71[(5'h13):(4'he)];
              reg73 <= $unsigned((~|$unsigned((~(reg68 ? wire29 : wire67)))));
              reg74 <= {{$unsigned((-(wire27 > wire67))),
                      ($unsigned(reg71[(4'h9):(3'h5)]) - (7'h42))},
                  reg70};
              reg75 <= (!(~wire63[(3'h5):(3'h5)]));
              reg76 <= reg74;
            end
          else
            begin
              reg72 <= $signed($unsigned($signed($signed((!wire26)))));
              reg73 <= (reg30 ?
                  $signed($signed(({wire28} ?
                      $unsigned(reg76) : (wire66 ?
                          reg68 : wire29)))) : ((reg75[(2'h2):(2'h2)] ?
                          $signed(reg72) : wire65[(4'hd):(1'h1)]) ?
                      (wire29[(3'h5):(2'h3)] ?
                          reg69[(4'hc):(4'hb)] : ((reg30 ~^ reg30) ?
                              ((7'h44) ^~ wire65) : (wire27 > reg70))) : wire67[(1'h0):(1'h0)]));
              reg74 <= $unsigned(reg75);
              reg75 <= wire26[(1'h1):(1'h0)];
              reg76 <= {(!wire65)};
            end
        end
      else
        begin
          reg71 <= reg72[(2'h2):(1'h0)];
          reg72 <= reg73[(3'h4):(3'h4)];
        end
    end
  assign wire77 = $unsigned($signed($unsigned(reg70)));
  assign wire78 = $signed(reg75[(2'h3):(1'h0)]);
  assign wire79 = ((((~&$unsigned(reg72)) ?
                          wire26 : $signed($signed((8'hac)))) <<< $unsigned(((reg76 <<< reg69) ?
                          $unsigned((8'ha6)) : $signed(wire78)))) ?
                      wire24 : (-((+$signed(wire26)) ^ (!reg69))));
  module80 #() modinst93 (wire92, clk, wire79, wire28, wire29, reg74, reg76);
endmodule

module module80  (y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire85;
  input wire [(3'h6):(1'h0)] wire84;
  input wire signed [(5'h10):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  input wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  assign y = {wire90, wire89, wire88, wire87, wire86, reg91, (1'h0)};
  assign wire86 = (^(+(wire85 ? (8'hbd) : wire83[(5'h10):(4'h8)])));
  assign wire87 = wire82;
  assign wire88 = (wire84 ?
                      ($signed($signed((~|(8'haa)))) < (~^wire86)) : ((~|$unsigned(((8'hb9) ?
                              wire87 : wire83))) ?
                          wire85 : {($signed(wire82) << wire84[(2'h2):(1'h1)]),
                              $signed(wire83)}));
  assign wire89 = ($signed($signed(((wire81 <= (8'ha0)) * $unsigned(wire83)))) + ({{(wire82 ?
                                  wire83 : wire86)},
                          wire82} ?
                      $unsigned(($signed((8'haa)) ?
                          wire86 : {wire83})) : ({(wire85 >> wire82)} ?
                          (&$signed(wire87)) : (~&(wire88 >>> wire84)))));
  assign wire90 = $signed(($unsigned(((wire85 ?
                          wire83 : wire88) < $unsigned(wire86))) ?
                      ($unsigned($signed(wire82)) ?
                          wire82[(1'h0):(1'h0)] : (-(wire87 + wire81))) : wire89));
  always
    @(posedge clk) begin
      reg91 <= wire84;
    end
endmodule

module module32
#(parameter param61 = (&(((((8'hb7) != (8'hae)) ? ((8'h9f) ? (7'h44) : (8'ha0)) : {(8'hb8)}) <= (((8'hb3) * (8'hbc)) >> ((7'h43) ? (8'hb4) : (8'hbe)))) + ((~&((8'hbb) + (8'ha6))) ? (((8'hb9) ? (7'h43) : (8'hb9)) == (~(8'hba))) : {(!(7'h41)), (8'hae)}))), 
parameter param62 = ((!({(param61 == param61)} ? ((param61 << (8'ha5)) ? (param61 * param61) : (param61 ? param61 : param61)) : ((~(8'hb2)) ? param61 : param61))) ~^ (-param61)))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire [(3'h7):(1'h0)] wire36;
  input wire [(5'h11):(1'h0)] wire35;
  input wire signed [(4'hd):(1'h0)] wire34;
  input wire [(4'he):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire53,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg55,
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
  assign wire38 = wire34[(3'h6):(3'h6)];
  assign wire39 = $unsigned((8'h9f));
  assign wire40 = (7'h44);
  assign wire41 = wire39[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg42 <= $unsigned((^~(wire40 ?
          $unsigned($unsigned(wire39)) : $signed((wire39 ? wire35 : wire35)))));
      reg43 <= wire38[(1'h1):(1'h1)];
      reg44 <= (wire35 >> (8'ha9));
      reg45 <= (~|($unsigned($unsigned({wire40,
          wire37})) - $signed(($signed(wire34) ?
          {(8'hb8)} : wire33[(3'h7):(3'h7)]))));
      reg46 <= (~|($unsigned($signed((^wire40))) >>> reg42[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg47 <= ($signed(wire40) ? wire33 : (8'hbf));
      reg48 <= $unsigned(wire38[(3'h4):(1'h1)]);
      reg49 <= ({$unsigned(({wire34, reg46} ?
                  $unsigned(reg46) : $unsigned((8'ha6)))),
              wire38} ?
          reg43 : $signed(($unsigned(wire41) ^~ wire37)));
      reg50 <= (~^$unsigned($signed(wire34)));
    end
  always
    @(posedge clk) begin
      reg51 <= (+((((reg50 ? wire34 : reg46) ? {(7'h42), reg42} : {(8'hb3)}) ?
              wire41[(2'h2):(1'h0)] : ((reg44 ? reg50 : wire41) ?
                  reg49 : $signed(reg47))) ?
          reg47 : wire36));
      reg52 <= ($signed((wire37 ? wire33 : $signed((reg51 ? wire40 : reg43)))) ?
          (8'h9d) : $unsigned(reg46[(4'hb):(1'h0)]));
    end
  assign wire53 = {$signed($signed(((wire33 << (8'haf)) ?
                          reg52[(1'h1):(1'h0)] : (reg46 ? reg45 : (8'haf))))),
                      reg52[(2'h3):(2'h2)]};
  assign wire54 = reg46[(4'hb):(1'h0)];
  always
    @(posedge clk) begin
      reg55 <= (($signed((+$unsigned((8'ha0)))) ?
              (!wire35[(3'h5):(3'h5)]) : $unsigned({wire54[(2'h3):(2'h2)]})) ?
          ($unsigned($signed(reg49)) ?
              reg49[(4'h9):(1'h0)] : wire41) : (^~(+$unsigned($signed((7'h42))))));
    end
  assign wire56 = wire54[(2'h2):(1'h0)];
  assign wire57 = (-(^~{$unsigned($unsigned(wire54)),
                      $signed(wire34[(1'h0):(1'h0)])}));
  assign wire58 = ($signed($signed(((reg50 ?
                      reg47 : wire54) >= wire53))) || {$unsigned(reg52)});
  assign wire59 = $signed(((8'ha4) <= $signed(reg51)));
  assign wire60 = (wire38 ? wire53 : reg48[(3'h4):(3'h4)]);
endmodule

module module124  (y, clk, wire129, wire128, wire127, wire126, wire125);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire129;
  input wire signed [(4'h9):(1'h0)] wire128;
  input wire signed [(2'h2):(1'h0)] wire127;
  input wire [(3'h7):(1'h0)] wire126;
  input wire [(3'h7):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire163;
  wire signed [(5'h10):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire [(4'h9):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire158;
  wire [(3'h5):(1'h0)] wire157;
  wire signed [(2'h2):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire [(4'h9):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire130;
  reg signed [(4'he):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire131,
                 wire130,
                 reg154,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire130 = (!wire127);
  assign wire131 = {wire130,
                       ((~$signed(wire130[(1'h0):(1'h0)])) ?
                           ({$unsigned(wire128)} ?
                               $signed(wire127[(1'h0):(1'h0)]) : $signed((wire128 ?
                                   wire128 : wire127))) : $unsigned($unsigned((~|wire127))))};
  always
    @(posedge clk) begin
      if ($signed(wire129))
        begin
          if ($unsigned((wire131[(4'hb):(3'h7)] << $unsigned(wire128))))
            begin
              reg132 <= (^$unsigned(wire131[(4'h8):(3'h6)]));
              reg133 <= (^(^wire130[(5'h10):(4'h8)]));
              reg134 <= wire126[(3'h5):(1'h1)];
              reg135 <= $signed(reg132);
            end
          else
            begin
              reg132 <= $signed(({wire128} ?
                  {wire128[(4'h9):(2'h3)]} : (((reg135 < wire128) - wire128[(1'h0):(1'h0)]) ?
                      ({reg133, (8'hbd)} <= {wire131,
                          reg135}) : wire127[(1'h1):(1'h0)])));
              reg133 <= $unsigned(((!wire125[(1'h0):(1'h0)]) ?
                  wire126[(2'h3):(2'h2)] : reg135));
            end
          reg136 <= ((!reg132) ? wire129 : {wire129});
          reg137 <= $unsigned((^wire131));
          reg138 <= $signed({reg137[(3'h5):(2'h3)]});
        end
      else
        begin
          reg132 <= (&((((~|reg135) ? (-wire129) : (wire130 + (8'ha4))) ?
                  reg132 : (~&(~&reg137))) ?
              ((reg133 ? reg137 : (^(8'hbd))) ?
                  wire131[(3'h5):(3'h5)] : (~(wire126 ?
                      reg135 : wire128))) : $signed($unsigned({wire131,
                  reg136}))));
          if (reg132)
            begin
              reg133 <= ($signed(($unsigned(wire129) ?
                      reg134[(3'h4):(1'h0)] : (!$unsigned(wire127)))) ?
                  ($signed($unsigned(wire125)) > wire130[(2'h2):(1'h1)]) : ($unsigned((~reg135)) ?
                      wire128 : {{(wire125 ? wire128 : wire131)},
                          wire126[(3'h4):(2'h3)]}));
            end
          else
            begin
              reg133 <= $signed((8'ha3));
              reg134 <= $signed(($unsigned($unsigned((+reg137))) || (($signed(reg135) ?
                  (reg137 ?
                      reg137 : wire131) : reg132[(4'h8):(3'h5)]) <= ((&wire131) ?
                  (wire127 ? reg135 : (8'hae)) : reg135))));
              reg135 <= $unsigned(wire129[(4'hc):(3'h5)]);
              reg136 <= $unsigned((wire128 ? wire131 : wire127));
            end
          reg137 <= wire130;
          reg138 <= (~^({(reg136 ? reg134 : (reg137 ? reg134 : reg137)),
                  {((8'haf) ? (7'h43) : reg132)}} ?
              (((reg136 & reg135) ?
                  (wire131 ?
                      reg133 : reg134) : wire131) * $signed(((8'hba) && wire125))) : $signed($signed($unsigned((8'ha6))))));
        end
      reg139 <= $signed((reg137[(1'h0):(1'h0)] ^ reg137[(4'ha):(3'h4)]));
      reg140 <= (^~$signed((+$signed((+(7'h42))))));
      reg141 <= (&(~&wire131[(3'h6):(3'h6)]));
      if ({(~&reg139[(4'h9):(1'h1)]), wire126})
        begin
          reg142 <= ((~$unsigned(reg138[(4'he):(1'h0)])) ^ (reg138[(4'h9):(2'h3)] & ({$signed((8'had)),
              (reg133 <<< wire125)} + (-{reg140}))));
          reg143 <= ((reg134 ?
              (((wire128 ?
                  wire127 : reg140) > $signed(wire126)) >>> (8'hbb)) : reg134) * $unsigned($signed({(~|(8'hac)),
              (reg141 ? wire130 : reg134)})));
          if (($unsigned(reg139[(1'h0):(1'h0)]) != (~|wire130[(4'hf):(1'h0)])))
            begin
              reg144 <= reg140[(2'h3):(2'h2)];
              reg145 <= ($unsigned((reg144[(3'h7):(1'h1)] >>> $unsigned((wire129 | (8'haa))))) ?
                  (!(~&(wire126[(1'h1):(1'h1)] ?
                      (reg132 ?
                          reg134 : reg134) : (~&reg132)))) : $unsigned($unsigned(reg134[(4'ha):(4'h8)])));
              reg146 <= $unsigned({wire129, reg142[(1'h0):(1'h0)]});
              reg147 <= (8'hb1);
            end
          else
            begin
              reg144 <= (wire127[(2'h2):(1'h0)] & {$signed((wire127[(1'h0):(1'h0)] <<< $unsigned(wire126)))});
              reg145 <= reg135[(3'h7):(1'h0)];
            end
          reg148 <= $unsigned((~&$unsigned($unsigned(wire129[(1'h1):(1'h0)]))));
        end
      else
        begin
          reg142 <= {$signed(reg144)};
          reg143 <= (!($signed(($unsigned(reg148) ?
              $unsigned(reg147) : wire125[(3'h6):(3'h6)])) ^~ $unsigned(reg148)));
          if ($unsigned(reg138[(1'h1):(1'h0)]))
            begin
              reg144 <= (($unsigned({(reg137 ? reg132 : (7'h43)),
                  (7'h40)}) ^ ((8'h9f) ? wire126 : wire125)) ^~ ((((&wire129) ?
                      (-reg135) : (+reg132)) ?
                  (wire130[(4'hf):(4'hd)] ?
                      (reg142 > reg147) : reg145[(2'h2):(1'h1)]) : (8'had)) ^~ $signed((wire130 ?
                  (reg144 ? reg143 : reg145) : reg148))));
            end
          else
            begin
              reg144 <= {(((~&$signed(reg135)) >>> reg138[(1'h0):(1'h0)]) * {reg146[(3'h7):(3'h4)],
                      ((^~(8'haa)) ? $signed(reg139) : $signed(wire128))}),
                  {(reg136 ? $signed(wire125) : $unsigned(reg147)),
                      reg147[(4'h8):(4'h8)]}};
            end
          reg145 <= ($unsigned({(((8'haa) ? reg141 : reg133) ?
                      $signed(reg143) : ((8'hb7) <<< reg139)),
                  $unsigned((~^(8'h9f)))}) ?
              $signed(reg134) : (&$unsigned((reg147 ?
                  {wire130, reg139} : ((8'hb5) ? wire126 : reg137)))));
          reg146 <= (8'ha6);
        end
    end
  always
    @(posedge clk) begin
      reg149 <= reg145;
      reg150 <= (reg145[(1'h1):(1'h0)] >> ((~|$unsigned((reg136 ?
          reg137 : wire127))) | reg135));
    end
  always
    @(posedge clk) begin
      reg151 <= reg146[(3'h7):(1'h1)];
      reg152 <= (~&reg147[(4'hb):(4'h8)]);
    end
  assign wire153 = ($unsigned((($signed(reg150) ?
                               (reg135 ? reg142 : reg151) : $signed(wire126)) ?
                           wire129[(1'h1):(1'h1)] : $unsigned($unsigned(wire131)))) ?
                       {reg135} : wire126);
  always
    @(posedge clk) begin
      reg154 <= ((($signed(reg149[(1'h1):(1'h0)]) ?
                  (~^$signed(reg132)) : reg150) ?
              wire125 : $signed(reg137[(2'h2):(2'h2)])) ?
          $signed($unsigned((reg150[(3'h6):(2'h3)] ?
              $unsigned(reg145) : (reg133 << reg143)))) : reg149);
    end
  assign wire155 = $signed(({(wire153[(3'h6):(1'h0)] ?
                               (reg142 - wire153) : (~|reg141)),
                           (8'h9e)} ?
                       (reg154 >= {{(8'hb4)}, reg133}) : reg142));
  assign wire156 = reg139;
  assign wire157 = {$signed(reg143[(1'h0):(1'h0)])};
  assign wire158 = $signed($signed(($unsigned((|wire127)) ?
                       $signed(reg138[(3'h5):(2'h2)]) : ((reg147 - wire128) ?
                           (~&(8'hbf)) : reg148[(1'h1):(1'h1)]))));
  assign wire159 = wire126;
  assign wire160 = wire159[(3'h6):(1'h1)];
  assign wire161 = ((~&wire127) ? $signed(reg140) : (8'hba));
  assign wire162 = (($unsigned(($signed(reg151) ?
                           (^reg140) : $signed((8'hba)))) ?
                       reg140[(5'h10):(2'h3)] : $signed(({reg133, reg139} ?
                           reg143[(2'h2):(2'h2)] : {wire161,
                               reg139}))) & ($unsigned((~^$unsigned(reg138))) ?
                       (&reg148) : $unsigned($unsigned($unsigned(reg132)))));
  assign wire163 = $unsigned(reg142);
endmodule
