module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire179;
  wire signed [(5'h13):(1'h0)] wire178;
  wire [(5'h15):(1'h0)] wire177;
  wire [(2'h3):(1'h0)] wire176;
  wire signed [(4'he):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire174;
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire172,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire35,
                 wire37,
                 wire38,
                 wire39,
                 wire170,
                 wire174,
                 (1'h0)};
  assign wire4 = $unsigned(((wire0[(4'hb):(1'h1)] ?
                     ((wire0 <<< wire3) + (~|wire3)) : {wire3[(3'h6):(3'h4)]}) <= $signed((|(-wire0)))));
  assign wire5 = {$unsigned(wire3[(3'h4):(2'h2)]),
                     $signed((($signed(wire3) && $signed(wire1)) ?
                         $unsigned($unsigned(wire1)) : $signed(wire4[(4'h8):(3'h7)])))};
  assign wire6 = wire5;
  assign wire7 = (wire4 ? (~^wire5) : $unsigned((wire0 - wire3)));
  module8 #() modinst36 (.wire9(wire1), .wire10(wire3), .y(wire35), .wire11(wire2), .clk(clk), .wire12(wire6));
  assign wire37 = wire0[(3'h4):(2'h2)];
  assign wire38 = ($unsigned((|wire37)) ?
                      (wire35 ?
                          wire7[(3'h7):(3'h4)] : wire2[(4'hb):(4'hb)]) : {{(wire0 + $unsigned(wire35))}});
  assign wire39 = (wire7 ?
                      ($unsigned(wire38[(1'h0):(1'h0)]) ?
                          ((8'hbe) ?
                              $unsigned((|wire35)) : wire0) : wire6[(2'h3):(1'h0)]) : (wire0 ^ $unsigned((^((8'ha1) ?
                          wire6 : wire2)))));
  module40 #() modinst171 (wire170, clk, wire4, wire7, wire3, wire35, wire38);
  module13 #() modinst173 (.wire16(wire3), .clk(clk), .wire18(wire2), .wire15(wire1), .y(wire172), .wire14(wire38), .wire17(wire37));
  module40 #() modinst175 (wire174, clk, wire4, wire5, wire39, wire2, wire0);
  assign wire176 = $signed(($signed($signed($signed((8'h9d)))) || (wire4 ?
                       (|$unsigned(wire1)) : (!(8'h9e)))));
  assign wire177 = $unsigned(($unsigned($signed((wire176 - wire6))) - $signed(wire176[(2'h3):(2'h2)])));
  assign wire178 = (^~($unsigned(wire38) && {{wire4[(3'h7):(3'h7)],
                           (wire7 << wire4)},
                       (~&$unsigned(wire176))}));
  module52 #() modinst180 (wire179, clk, wire35, wire178, wire177, wire5);
endmodule

module module40  (y, clk, wire41, wire42, wire43, wire44, wire45);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire42;
  input wire signed [(2'h3):(1'h0)] wire43;
  input wire [(5'h15):(1'h0)] wire44;
  input wire [(5'h11):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire92;
  wire [(4'h8):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire168;
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  assign y = {wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire90,
                 wire92,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire168,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire46 = wire45[(4'h8):(3'h7)];
  assign wire47 = wire46;
  assign wire48 = wire42;
  assign wire49 = (^wire44[(2'h3):(1'h0)]);
  assign wire50 = (^~(~|$unsigned(({wire43} ^ {(8'hab)}))));
  assign wire51 = wire41;
  module52 #() modinst91 (.wire55(wire48), .y(wire90), .wire56(wire43), .clk(clk), .wire54(wire51), .wire53(wire47));
  assign wire92 = wire44[(4'hb):(1'h0)];
  always
    @(posedge clk) begin
      reg93 <= ($signed($unsigned(wire42)) >> $unsigned((wire43 ?
          ((^~wire90) ?
              (~&wire47) : $signed(wire42)) : wire43[(2'h2):(2'h2)])));
      reg94 <= (~^{(8'hae)});
      if ((+$signed((~^{(wire45 ? reg93 : reg94)}))))
        begin
          if ((-(wire43[(2'h3):(1'h0)] ?
              $unsigned(($signed(wire51) ?
                  {wire48, wire42} : wire51[(5'h10):(4'hd)])) : (&((wire42 ?
                  reg93 : wire92) <= (~&wire45))))))
            begin
              reg95 <= ({(($unsigned(wire45) - $unsigned(wire92)) - ($signed((8'ha1)) >> $unsigned(reg93)))} ?
                  $signed((8'hb2)) : {(~(~^(wire42 - reg94)))});
            end
          else
            begin
              reg95 <= reg94;
              reg96 <= wire50;
              reg97 <= wire50[(4'h8):(3'h6)];
              reg98 <= {(wire51 ?
                      ((!(^~wire50)) - (wire90[(1'h1):(1'h1)] >> wire92[(1'h0):(1'h0)])) : ((((8'ha6) + wire41) ?
                              $unsigned(wire47) : wire46[(3'h5):(1'h1)]) ?
                          $unsigned((wire42 ?
                              reg96 : wire49)) : $unsigned(reg93))),
                  $signed($unsigned(((reg94 < (8'hbb)) ?
                      ((8'hb1) == wire50) : {wire47, wire43})))};
            end
          reg99 <= wire43;
          reg100 <= ((&(&{(-wire43)})) != (8'ha6));
        end
      else
        begin
          reg95 <= (+$unsigned(($signed(wire42[(3'h7):(1'h1)]) ^~ ((reg97 >> reg98) << (-reg98)))));
        end
    end
  assign wire101 = $unsigned(((8'ha3) ?
                       ((~(reg98 ? reg96 : wire48)) ?
                           ((wire44 * reg93) - {wire90}) : ($unsigned((8'hb7)) << wire50[(5'h10):(1'h0)])) : reg100[(3'h5):(2'h3)]));
  assign wire102 = (~^reg99);
  assign wire103 = $signed($signed(wire51[(5'h14):(4'hd)]));
  assign wire104 = (^~(((^{wire44}) ?
                       (!$signed(reg99)) : wire46[(3'h7):(3'h4)]) ^ ($unsigned(wire48) && $signed(wire46[(3'h4):(2'h3)]))));
  assign wire105 = $unsigned($unsigned((-((wire46 | wire103) ?
                       $signed((8'hb1)) : (|wire42)))));
  module106 #() modinst169 (wire168, clk, wire104, wire102, wire105, wire103, wire90);
endmodule

module module8
#(parameter param33 = (~|(((8'haf) ? (((8'ha1) ? (8'hba) : (8'hac)) ^~ {(7'h44), (8'ha6)}) : ({(8'hbf), (8'hb6)} ? {(8'ha2), (7'h43)} : ((8'h9f) ? (8'h9d) : (8'hac)))) ? (((!(8'ha0)) ? ((8'h9e) << (8'h9f)) : ((8'ha2) ^~ (8'ha8))) != ({(8'ha0)} ? ((8'had) + (8'ha1)) : {(8'haa)})) : (((~^(8'ha4)) ? ((7'h42) ? (8'hbc) : (7'h44)) : (~(8'ha5))) ? ({(8'hbd)} * {(8'hb8)}) : (8'ha5)))), 
parameter param34 = {{((~((8'hbf) > param33)) > (!{param33, param33}))}})
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire25;
  assign y = {wire32, wire31, wire30, wire29, wire28, wire27, wire25, (1'h0)};
  module13 #() modinst26 (.wire18(wire12), .y(wire25), .wire17(wire10), .clk(clk), .wire16(wire9), .wire14((8'hb8)), .wire15(wire11));
  assign wire27 = ((($unsigned($signed(wire12)) <= (^~(wire25 ?
                          wire9 : wire12))) ?
                      $unsigned((-$unsigned((8'hb8)))) : ($signed(wire9) ?
                          ($signed(wire10) ?
                              $signed((8'hbe)) : wire10[(2'h2):(1'h0)]) : ((|wire12) ?
                              $unsigned(wire25) : wire12[(4'h8):(3'h5)]))) ~^ $unsigned(wire9));
  assign wire28 = ((8'ha4) ?
                      (wire9[(5'h10):(5'h10)] | ((|(wire27 >> wire10)) ?
                          ((+wire25) && wire10) : (~(-wire27)))) : (-$signed(wire10[(3'h4):(1'h0)])));
  assign wire29 = (((&((~^wire25) << $unsigned((8'hbd)))) ?
                      wire25[(4'he):(2'h3)] : (($unsigned(wire12) ?
                              (wire25 >= wire10) : $unsigned(wire10)) ?
                          (^(^(8'hba))) : wire9)) ~^ wire11);
  assign wire30 = $signed((wire9[(2'h2):(2'h2)] ?
                      (~|$signed((^wire12))) : $signed($unsigned(wire10))));
  assign wire31 = $unsigned($signed($signed(wire27)));
  assign wire32 = (~$signed(((8'hb8) ?
                      (&(8'hbb)) : ((wire28 & wire31) ?
                          $signed(wire28) : wire12))));
endmodule

module module13
#(parameter param24 = ((^~((+((8'haa) ? (8'hb9) : (8'hb9))) >>> {{(8'hb7), (7'h44)}, (~&(8'ha8))})) ? ((^(-((8'hae) << (8'ha3)))) ? ({(8'hb4), (-(8'ha6))} ? ((~^(8'hb8)) ^~ {(8'ha6), (8'h9f)}) : {((8'hae) ? (8'ha3) : (8'hb4))}) : (&(~&((7'h43) || (8'ha6))))) : ((-((8'h9d) != (8'ha1))) && {(((8'hb6) ? (8'haf) : (8'ha2)) || (~|(8'ha2))), (((8'hb7) ? (8'hbd) : (8'hba)) << (^~(8'had)))})))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  assign y = {wire23, wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = $signed($unsigned((8'ha6)));
  assign wire20 = (wire19 << ((-$signed(wire17)) & $signed(($signed(wire14) <= $signed(wire18)))));
  assign wire21 = $unsigned(wire19);
  assign wire22 = (|($signed({wire21[(5'h10):(4'ha)],
                      (wire19 > wire15)}) <<< ((-{wire20}) ?
                      (wire17[(3'h4):(2'h3)] + (&wire17)) : $unsigned(wire19))));
  assign wire23 = ({(!(^wire20))} == ($signed(wire14[(2'h3):(1'h1)]) && $unsigned((~^(-wire21)))));
endmodule

module module106  (y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire111;
  input wire signed [(5'h11):(1'h0)] wire110;
  input wire signed [(5'h15):(1'h0)] wire109;
  input wire signed [(2'h3):(1'h0)] wire108;
  input wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire167;
  wire [(3'h7):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire165;
  wire [(5'h11):(1'h0)] wire155;
  wire [(4'hb):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire144;
  wire [(3'h6):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire signed [(4'ha):(1'h0)] wire141;
  wire signed [(2'h3):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire112;
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(4'hd):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(5'h11):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(3'h5):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire155,
                 wire154,
                 wire153,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire137,
                 wire136,
                 wire129,
                 wire128,
                 wire112,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg138,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
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
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire112 = $unsigned($signed((~$signed((~&wire111)))));
  always
    @(posedge clk) begin
      reg113 <= {$unsigned((8'hbb)),
          $signed({$unsigned(wire109),
              ($signed(wire107) ? $unsigned(wire107) : $unsigned(wire110))})};
      if (((~|$signed((+(~&wire107)))) < {$signed(wire108)}))
        begin
          reg114 <= $unsigned(wire111[(4'hc):(3'h7)]);
          reg115 <= ($unsigned((8'hb3)) ?
              {$signed(wire111[(4'hc):(3'h5)])} : $unsigned(wire109[(5'h14):(5'h11)]));
          if ((((~|(reg113[(3'h4):(3'h4)] ?
              (reg113 ~^ reg115) : $unsigned(wire107))) ~^ ((^$signed(wire110)) ?
              (~|(wire107 ? wire112 : wire109)) : ((~^wire111) ?
                  (7'h41) : $unsigned(wire112)))) & (($unsigned({wire110,
                      wire107}) ?
                  $signed(wire109) : reg114) ?
              reg113 : reg114)))
            begin
              reg116 <= ($unsigned({wire111,
                  $signed(reg113)}) >= $signed((&{{reg115, wire109},
                  wire109[(1'h1):(1'h1)]})));
              reg117 <= reg113[(2'h3):(1'h0)];
            end
          else
            begin
              reg116 <= $signed(wire111[(2'h2):(1'h0)]);
              reg117 <= $unsigned(wire107[(1'h1):(1'h1)]);
            end
          reg118 <= (wire109[(3'h5):(3'h5)] ? reg117[(1'h1):(1'h0)] : wire107);
          reg119 <= {((&((!wire108) ^~ (reg115 != reg118))) ?
                  wire109 : (~^wire108))};
        end
      else
        begin
          reg114 <= (($unsigned(((wire112 ? wire111 : reg114) <<< {wire111,
                  reg116})) < $signed(reg119[(3'h5):(2'h2)])) ?
              reg113[(4'h8):(3'h5)] : reg117);
          if (reg114)
            begin
              reg115 <= wire108[(2'h3):(1'h1)];
              reg116 <= $signed({((8'ha1) < (^((8'hb1) ~^ wire111)))});
              reg117 <= $signed(((($signed(wire110) ?
                          $signed(reg114) : (reg117 * wire111)) ?
                      (wire107[(4'hb):(4'hb)] >>> $unsigned(reg116)) : $unsigned(wire111[(4'hd):(4'h8)])) ?
                  (!$unsigned($unsigned(reg115))) : (|wire110)));
              reg118 <= ((($unsigned(reg117) ?
                      (^(reg115 ? reg115 : reg115)) : ((wire109 ?
                          wire108 : wire107) ^ {wire111})) ?
                  (|reg119) : ((~^$unsigned(reg118)) - wire108)) != (+(8'hb7)));
            end
          else
            begin
              reg115 <= $signed({wire110[(4'hd):(4'hc)]});
              reg116 <= ((($unsigned($signed(wire107)) ?
                      $signed((reg115 ? wire107 : reg113)) : $unsigned({wire111,
                          wire109})) == wire109[(2'h2):(1'h0)]) ?
                  (|(&$signed($signed(wire109)))) : wire107[(3'h6):(2'h2)]);
              reg117 <= (($unsigned(((~&reg119) == ((8'ha1) ?
                  wire107 : reg114))) + wire110) && $unsigned($unsigned($signed((reg118 ?
                  reg113 : wire109)))));
              reg118 <= {(&{(~^reg118)})};
              reg119 <= $signed({$unsigned($unsigned((!wire112)))});
            end
          if ($unsigned((8'h9f)))
            begin
              reg120 <= (!{reg117});
              reg121 <= wire109[(4'hb):(2'h2)];
              reg122 <= (~|(-{wire112, $signed((wire107 ? reg120 : reg120))}));
              reg123 <= {$unsigned((reg121[(3'h5):(3'h4)] <<< (reg113[(3'h7):(3'h5)] ~^ (^wire109)))),
                  $signed($unsigned($signed((reg114 & reg122))))};
              reg124 <= (8'hae);
            end
          else
            begin
              reg120 <= $signed(wire108);
            end
          reg125 <= (~^$unsigned(reg122));
        end
      reg126 <= {(~|$unsigned(((8'ha0) || (wire110 ? (8'hb9) : reg116)))),
          (($signed(reg116) ? (7'h40) : $unsigned(reg121)) ?
              ($unsigned((wire109 <= reg122)) ?
                  {(~^wire112),
                      reg114[(1'h1):(1'h1)]} : ((wire108 >> reg120) >= (reg118 ?
                      (8'hac) : reg123))) : (8'hb0))};
      reg127 <= wire111;
    end
  assign wire128 = reg120;
  assign wire129 = reg116[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      if (($unsigned($signed((8'ha9))) == (~^(8'h9d))))
        begin
          reg130 <= wire110;
          reg131 <= (reg116 ?
              (8'hb6) : (((+(reg118 & (8'hb6))) > reg121) ?
                  $signed(reg125[(4'he):(3'h4)]) : (((8'hbe) ?
                      {wire108} : (8'ha5)) > ($unsigned(wire110) << (reg125 ?
                      reg119 : reg123)))));
          reg132 <= $signed($unsigned(reg113));
          reg133 <= (((~wire112) ?
              {$signed((reg120 ?
                      reg127 : reg114))} : wire108[(1'h0):(1'h0)]) - (~|(&(8'hac))));
          reg134 <= $unsigned(reg120);
        end
      else
        begin
          reg130 <= (($signed(reg133[(4'hb):(3'h4)]) || (8'hb8)) ^~ $signed((wire107[(4'hd):(3'h6)] != ({wire109} != reg114[(1'h0):(1'h0)]))));
          reg131 <= (^~(reg113 <= {((reg133 ? reg124 : wire110) ?
                  reg130[(5'h15):(5'h13)] : (8'hbc))}));
          reg132 <= {(reg133 ^ $unsigned(reg119)),
              $unsigned((wire129[(3'h4):(2'h2)] | (+$unsigned(reg122))))};
        end
      reg135 <= (~$signed(((reg127 ? $signed(reg114) : (wire108 >>> (8'hb0))) ?
          (reg125[(4'hb):(3'h5)] ~^ (wire110 >>> reg116)) : (~(^~reg117)))));
    end
  assign wire136 = reg124[(2'h2):(2'h2)];
  assign wire137 = {$signed((((~reg123) ?
                               $signed(reg133) : (reg115 ? wire109 : reg131)) ?
                           (wire128[(1'h1):(1'h1)] ?
                               reg120[(3'h5):(2'h3)] : reg113[(2'h3):(1'h0)]) : ((wire110 ?
                               reg127 : wire112) >> (reg121 ^ (8'hbe)))))};
  always
    @(posedge clk) begin
      reg138 <= ($signed((!{$unsigned(wire109)})) ?
          (wire111[(4'ha):(3'h5)] > (($unsigned(wire111) * (wire110 ?
              (8'hba) : reg135)) + (~^(reg124 ^~ reg134)))) : ((&$unsigned(reg122[(3'h5):(2'h2)])) ?
              ({((8'hb7) >> reg113)} <= $signed({reg126,
                  wire110})) : $signed(($signed((8'hac)) ^ wire136))));
    end
  assign wire139 = $signed((!(wire129 ?
                       $signed((&reg131)) : ({reg127} <<< {reg138}))));
  assign wire140 = reg122;
  assign wire141 = wire137[(1'h0):(1'h0)];
  assign wire142 = ((reg119 <<< wire111[(4'hf):(4'he)]) ?
                       ($unsigned(($signed(reg115) ^ {reg126})) < (reg115[(1'h0):(1'h0)] ^ {reg130[(4'hb):(4'hb)]})) : (&reg135[(4'hf):(4'hc)]));
  assign wire143 = $unsigned({(wire137 | reg120[(3'h5):(3'h4)])});
  assign wire144 = reg120[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg145 <= (8'hbd);
      if (($signed((+$unsigned(reg145[(3'h6):(2'h2)]))) ?
          ((~&(reg124 <= (wire129 & reg124))) > reg115[(1'h1):(1'h1)]) : reg114[(2'h2):(1'h1)]))
        begin
          reg146 <= (|$signed(wire136));
          reg147 <= $unsigned(wire128[(3'h5):(1'h0)]);
          reg148 <= $unsigned({($unsigned(reg119) ?
                  $unsigned((~^(8'h9f))) : reg118),
              $signed((wire111 >>> (reg117 <<< reg132)))});
          reg149 <= $signed({((8'hb2) & $unsigned({wire110, wire111}))});
        end
      else
        begin
          reg146 <= $signed((reg114 >> $signed({reg132, $unsigned((8'had))})));
          if (((+(($unsigned(reg123) ^~ reg124[(2'h3):(2'h3)]) + $unsigned(wire139[(4'hd):(2'h2)]))) ?
              $unsigned({$signed($signed(reg130))}) : (^~reg133[(4'hb):(3'h7)])))
            begin
              reg147 <= (wire141[(1'h0):(1'h0)] ?
                  wire143[(3'h5):(2'h2)] : reg114);
              reg148 <= $signed(($unsigned((wire111[(3'h5):(2'h2)] || reg138)) ?
                  wire137 : (((reg134 ?
                      (8'hb4) : wire111) << {reg147}) & ((wire136 ?
                          wire136 : reg127) ?
                      $signed(reg138) : $unsigned(reg125)))));
              reg149 <= reg134[(1'h0):(1'h0)];
              reg150 <= ($unsigned((~^((reg117 ?
                      wire111 : reg124) && reg127))) ?
                  ((reg114[(1'h0):(1'h0)] ?
                          ((|reg123) << (~&(8'hbf))) : wire136) ?
                      $signed($signed((wire139 == reg114))) : ((^~{reg117}) || reg134[(2'h2):(2'h2)])) : $unsigned((((wire136 ^~ reg120) >>> $unsigned(wire129)) ?
                      ($unsigned((8'hb3)) ?
                          wire109 : (reg147 - wire107)) : wire109)));
              reg151 <= $unsigned(((wire137[(2'h3):(1'h0)] ?
                  reg145[(3'h5):(2'h2)] : (~^{reg114})) ~^ ((!reg135[(4'h9):(1'h1)]) ?
                  (^~reg146) : {$unsigned(reg150), $unsigned(reg131)})));
            end
          else
            begin
              reg147 <= ($signed((~^wire107[(1'h0):(1'h0)])) ?
                  {(((reg116 ^ reg124) == (-wire129)) ^ (+(8'ha4))),
                      (~&reg113)} : $signed({reg131}));
              reg148 <= (|(~^((~^$unsigned(wire109)) ?
                  reg146 : (~$signed((8'hba))))));
              reg149 <= ((^(^~((wire143 ? reg130 : wire143) || (!(8'ha8))))) ?
                  reg122[(4'h8):(1'h0)] : {(~&$signed((-wire137)))});
            end
        end
      reg152 <= (+(8'ha3));
    end
  assign wire153 = reg118;
  assign wire154 = wire141;
  assign wire155 = wire153;
  always
    @(posedge clk) begin
      reg156 <= {$unsigned((((reg145 ? reg124 : (8'ha5)) ?
              reg115[(3'h4):(1'h1)] : reg133) ~^ $unsigned($signed(wire112)))),
          wire129[(4'h8):(2'h2)]};
      if ($signed(($unsigned($unsigned(wire137[(1'h1):(1'h1)])) ?
          ((~(!(8'hbf))) ?
              $unsigned($unsigned((7'h44))) : reg119) : wire129[(2'h2):(1'h0)])))
        begin
          if (wire109)
            begin
              reg157 <= $unsigned({{((wire142 ? wire128 : reg138) <<< wire154)},
                  $unsigned(reg118)});
              reg158 <= $signed(reg119);
              reg159 <= (8'hb8);
            end
          else
            begin
              reg157 <= wire153[(4'ha):(4'h9)];
            end
        end
      else
        begin
          if ($signed(wire107))
            begin
              reg157 <= $signed((+wire107));
              reg158 <= (|(reg121[(4'h9):(4'h8)] == (~^(~(7'h42)))));
            end
          else
            begin
              reg157 <= $unsigned($signed($signed(reg156[(1'h0):(1'h0)])));
              reg158 <= $unsigned($unsigned((($unsigned(reg124) | $unsigned(reg149)) ^ reg114)));
              reg159 <= (reg134 ?
                  reg113 : ($signed(((~|(8'hae)) << {wire108})) ?
                      (&(^~reg117)) : $signed(wire107[(4'hd):(1'h1)])));
              reg160 <= {(^$signed(({reg159} > (wire136 | (8'haa))))),
                  ((!$unsigned((reg135 > reg125))) ?
                      (&wire154) : $unsigned($unsigned(wire129[(2'h3):(2'h3)])))};
            end
        end
      if (reg114)
        begin
          reg161 <= wire139[(2'h3):(1'h1)];
        end
      else
        begin
          if ((wire144 ^~ (reg125 | wire142)))
            begin
              reg161 <= $unsigned(wire111[(4'hb):(4'hb)]);
              reg162 <= $signed(((reg121 ?
                      $signed($signed(reg131)) : $signed(((8'hb2) - (8'hb2)))) ?
                  ($unsigned({(8'hbf),
                      wire111}) * $unsigned(reg132[(4'hc):(4'h8)])) : $signed(($signed(wire128) && {(8'hb9)}))));
            end
          else
            begin
              reg161 <= $unsigned({({wire154,
                      (reg122 ?
                          wire141 : reg127)} >= $unsigned((reg120 - reg123)))});
            end
        end
      if ((-$unsigned($signed((8'hbb)))))
        begin
          if (((reg161[(1'h0):(1'h0)] ? reg124 : {wire109[(5'h14):(4'h8)]}) ?
              reg149 : {reg156}))
            begin
              reg163 <= $unsigned((^reg120[(3'h5):(2'h3)]));
            end
          else
            begin
              reg163 <= $unsigned(wire107[(3'h7):(1'h1)]);
            end
          reg164 <= (|$signed((|$signed(((8'hb2) <<< reg125)))));
        end
      else
        begin
          reg163 <= reg152;
        end
    end
  assign wire165 = $unsigned(reg161[(2'h2):(2'h2)]);
  assign wire166 = $unsigned(reg124);
  assign wire167 = (((^$unsigned(reg159)) ^ ($unsigned(reg160[(3'h6):(3'h4)]) ^ {$unsigned(reg120),
                       $unsigned(wire111)})) ^~ (reg119[(4'he):(3'h5)] | (&$unsigned((reg162 ?
                       wire111 : reg135)))));
endmodule

module module52
#(parameter param88 = (!(~^(({(7'h42)} ? {(8'hb6)} : ((8'ha3) > (8'had))) ~^ {(^(8'hb5))}))), 
parameter param89 = ((^((+(~|param88)) ? (~&{param88}) : param88)) - param88))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire56;
  input wire [(5'h13):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire signed [(4'he):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire57 = {(wire56 || wire56[(2'h2):(1'h0)]),
                      (~|($signed((~(8'hac))) << ($signed(wire55) * (~|wire54))))};
  assign wire58 = (((($signed(wire53) >>> $unsigned(wire57)) ?
                      (^~wire54[(1'h0):(1'h0)]) : wire56) < (&($signed(wire56) ?
                      $unsigned((7'h43)) : $signed(wire57)))) ^~ wire56);
  assign wire59 = $unsigned(wire55);
  assign wire60 = $signed(({wire56[(2'h2):(1'h0)]} ?
                      wire57[(3'h6):(2'h3)] : (7'h42)));
  assign wire61 = ({wire56[(1'h1):(1'h1)],
                          ((((8'had) <= wire56) ^ wire54[(4'ha):(4'h8)]) != ($unsigned(wire56) ?
                              (wire54 ? (8'ha1) : wire60) : (^~wire57)))} ?
                      ($unsigned($signed((wire58 ^ wire60))) ?
                          wire57[(3'h5):(3'h4)] : (($signed(wire59) >> wire54[(3'h7):(3'h7)]) ?
                              wire57[(1'h0):(1'h0)] : wire58[(4'ha):(4'h8)])) : wire58);
  assign wire62 = (-wire59[(1'h0):(1'h0)]);
  assign wire63 = $signed($signed((($unsigned(wire55) * wire57) ^ wire56[(2'h3):(1'h1)])));
  assign wire64 = wire61;
  assign wire65 = ($unsigned($signed($signed({wire59}))) ?
                      (~^wire57[(3'h6):(3'h5)]) : wire57[(2'h2):(1'h0)]);
  assign wire66 = {(wire63[(3'h4):(1'h1)] > wire55)};
  always
    @(posedge clk) begin
      reg67 <= wire56[(2'h2):(1'h0)];
      if ($unsigned(wire55[(1'h0):(1'h0)]))
        begin
          reg68 <= (~(|wire55));
          reg69 <= $unsigned((|$signed(($unsigned(wire58) <= wire63))));
          if ({(&$signed(wire66)), wire63[(4'hb):(4'hb)]})
            begin
              reg70 <= wire55;
            end
          else
            begin
              reg70 <= wire60[(3'h7):(3'h4)];
              reg71 <= (~&$unsigned(wire63[(3'h5):(3'h4)]));
              reg72 <= (wire58[(4'hc):(3'h7)] ?
                  ($unsigned(((wire66 ^~ wire58) ?
                      reg68[(3'h4):(1'h1)] : $signed(reg70))) - wire56[(1'h1):(1'h1)]) : ((!((wire63 ~^ wire53) ?
                          wire56[(1'h1):(1'h0)] : $unsigned(wire59))) ?
                      reg70[(3'h7):(1'h1)] : wire60));
              reg73 <= $signed({($unsigned((~&wire63)) != (|{wire64}))});
              reg74 <= ((reg70[(4'he):(3'h6)] == $unsigned({(wire55 & wire56)})) ~^ (reg73 ?
                  wire60[(4'hd):(2'h2)] : (wire57[(1'h1):(1'h0)] * (^(wire54 - reg72)))));
            end
          reg75 <= $unsigned(((|(((8'hb6) | (8'hab)) ?
              wire55[(2'h3):(1'h1)] : (wire61 ? (8'hbb) : reg73))) + reg68));
          if (wire61)
            begin
              reg76 <= ((~$signed(wire59[(1'h0):(1'h0)])) && $unsigned((+((|reg73) ?
                  wire59 : reg72))));
              reg77 <= (~|($unsigned($signed({(8'ha3)})) <= $unsigned($signed((~(8'hab))))));
              reg78 <= {$unsigned(wire59)};
              reg79 <= $unsigned(wire62[(3'h6):(3'h5)]);
              reg80 <= ((($signed(reg69[(1'h1):(1'h0)]) ?
                  wire66 : wire57[(2'h2):(2'h2)]) * ($unsigned(reg68) ?
                  {(reg76 ? (7'h40) : reg77),
                      $unsigned(wire58)} : $unsigned((wire64 ?
                      wire62 : reg69)))) << $unsigned((~|wire54)));
            end
          else
            begin
              reg76 <= $unsigned(((~&((wire63 ?
                  reg67 : reg77) ~^ wire64)) - (((reg75 ?
                  reg79 : (8'hb9)) ~^ $unsigned(wire58)) ~^ $signed(reg73[(4'ha):(2'h2)]))));
              reg77 <= $unsigned(($signed({(reg72 ? wire66 : (8'hb3)),
                      {wire55, reg73}}) ?
                  (-$signed((wire53 ?
                      reg68 : wire66))) : reg78[(5'h11):(4'hb)]));
              reg78 <= ((^~((!(wire55 * wire56)) ?
                  $signed((reg68 ?
                      reg69 : reg71)) : (8'hab))) * {$signed($unsigned({reg73}))});
            end
        end
      else
        begin
          reg68 <= (~(($signed($unsigned(reg70)) ?
                  {$signed(reg72)} : ((reg68 ? reg69 : wire65) ?
                      wire53 : reg80)) ?
              wire60[(4'hc):(4'h8)] : (^((8'hb6) ?
                  $unsigned((8'ha4)) : reg68))));
          reg69 <= ((wire53 ?
                  (reg80 ?
                      (&(wire57 ?
                          wire58 : reg72)) : (~wire55)) : ($signed((~reg78)) ?
                      $signed(reg71[(4'hd):(3'h4)]) : ((&(8'hb1)) >> (7'h41)))) ?
              reg71 : $unsigned($unsigned($signed(wire63[(3'h5):(2'h3)]))));
          if ($signed($signed((($signed(reg79) ^ (-wire63)) ?
              (~^(~|(8'hbe))) : $signed((reg75 ? wire60 : reg72))))))
            begin
              reg70 <= ((8'hb4) ?
                  reg71[(2'h2):(1'h0)] : (&($signed(wire59[(1'h1):(1'h1)]) > $unsigned((-wire65)))));
              reg71 <= {wire64, $signed(wire62)};
              reg72 <= $signed(reg78[(4'h8):(3'h5)]);
              reg73 <= (!$unsigned({wire53, wire57}));
            end
          else
            begin
              reg70 <= ((($unsigned(wire59[(2'h2):(1'h0)]) ?
                      wire58[(4'h8):(3'h7)] : $unsigned((!reg77))) <<< $unsigned((~(~^reg80)))) ?
                  $unsigned(wire60) : $unsigned($signed(((wire66 >> wire65) ?
                      reg67[(2'h2):(2'h2)] : (reg69 ~^ wire60)))));
              reg71 <= (|(|reg68));
              reg72 <= (~&$signed(wire64));
              reg73 <= wire62[(1'h1):(1'h0)];
              reg74 <= (reg80[(1'h1):(1'h0)] <= $signed((((wire64 < wire64) != reg80[(3'h4):(3'h4)]) << $unsigned({wire56,
                  wire62}))));
            end
          reg75 <= reg78[(5'h11):(4'hb)];
          reg76 <= {(^~$signed(reg76[(3'h5):(3'h5)]))};
        end
      reg81 <= $unsigned(($signed(reg70) ?
          (+(~&(reg72 ? reg74 : reg75))) : $signed((&wire54))));
    end
  assign wire82 = ((|$unsigned($signed((!reg74)))) >> (~^(reg68 == $unsigned($unsigned(wire58)))));
  assign wire83 = reg68;
  assign wire84 = $signed(wire82[(4'ha):(4'ha)]);
  assign wire85 = $signed(reg74);
  assign wire86 = (({$signed($unsigned(wire61))} ?
                          wire57 : (reg69[(4'he):(3'h5)] <<< $signed(reg71))) ?
                      ($signed(((&(8'h9f)) != reg77[(4'hb):(3'h6)])) << ((~^$signed(reg74)) + $signed($signed(wire59)))) : wire57);
  assign wire87 = $unsigned($signed({(wire58[(3'h4):(2'h2)] | (wire63 ?
                          wire53 : (8'hac)))}));
endmodule
