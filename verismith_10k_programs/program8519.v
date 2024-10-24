module top
#(parameter param124 = {(~|{(8'haa), (((8'hbf) < (8'ha6)) < {(8'h9c)})})}, 
parameter param125 = param124)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire [(3'h4):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire24,
                 wire23,
                 wire21,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ($signed(((~|$signed(wire4)) ?
                         wire3 : ($signed(wire3) ? (!wire0) : (~^wire4)))) ?
                     wire1 : (wire2 ?
                         (|$unsigned(wire2)) : wire0[(4'hf):(2'h2)]));
  assign wire6 = $signed((&$unsigned(wire2)));
  assign wire7 = (($signed((8'ha8)) ? (~&(-(8'hb5))) : wire5) ?
                     $signed($signed((~wire1[(5'h11):(3'h7)]))) : $signed({((wire5 ?
                                 wire4 : wire4) ?
                             wire5[(3'h7):(3'h4)] : ((8'ha4) ?
                                 wire1 : wire6))}));
  module8 #() modinst22 (.wire11(wire3), .wire9(wire1), .clk(clk), .wire12(wire5), .wire10(wire4), .y(wire21));
  assign wire23 = (~^($signed((8'hbb)) == wire1));
  assign wire24 = (($signed((^~$signed(wire2))) | $signed(wire21[(1'h0):(1'h0)])) ?
                      wire2[(2'h3):(2'h3)] : (((wire23 ?
                          wire5[(4'h8):(2'h3)] : wire2[(3'h7):(1'h0)]) <= ((wire21 << wire23) + ((8'ha6) ?
                          wire7 : wire1))) == wire0[(4'hd):(4'h9)]));
  module25 #() modinst112 (.wire27(wire3), .wire29(wire1), .wire28(wire21), .clk(clk), .wire26(wire5), .y(wire111));
  assign wire113 = (~&wire4);
  assign wire114 = $signed(((($signed((8'hbd)) <= $unsigned(wire113)) ?
                           wire23[(4'hd):(1'h0)] : $signed($signed(wire5))) ?
                       wire7[(3'h6):(2'h3)] : (wire113 ?
                           (((8'hba) << wire5) ?
                               wire1 : $signed(wire111)) : $unsigned(wire21))));
  assign wire115 = (&({wire111} ?
                       ({((8'haf) != wire4)} ?
                           $unsigned(wire0) : $signed(wire6)) : wire24[(1'h0):(1'h0)]));
  assign wire116 = wire111;
  assign wire117 = wire0;
  assign wire118 = ($signed(wire0[(1'h0):(1'h0)]) ?
                       ($unsigned(wire2[(1'h1):(1'h1)]) > {((wire116 ?
                                   wire115 : wire3) ?
                               {wire2} : (|wire115))}) : ($unsigned($unsigned($unsigned(wire116))) ?
                           wire4 : $unsigned($signed($unsigned(wire1)))));
  assign wire119 = wire4[(3'h4):(3'h4)];
  assign wire120 = $signed($signed((8'ha8)));
  assign wire121 = wire120;
  assign wire122 = ((($signed((&wire120)) < {$signed(wire3)}) ?
                           wire4[(1'h0):(1'h0)] : (~^((wire114 ?
                               wire6 : wire3) > wire21[(4'ha):(1'h0)]))) ?
                       ((($signed(wire116) ?
                               (wire0 <= wire1) : (wire3 >>> wire118)) ?
                           wire111 : $signed({(8'haf)})) <= (^wire3[(4'hb):(3'h5)])) : wire0[(5'h11):(2'h2)]);
  assign wire123 = wire120[(4'hd):(1'h0)];
endmodule

module module25
#(parameter param110 = {(^{(((7'h42) ? (8'hae) : (8'hb7)) ? ((8'hbb) ? (8'hb0) : (8'ha9)) : {(7'h42)})}), ({(~&(8'h9d)), (((8'hbf) ? (8'hb4) : (8'h9f)) ? (^(7'h44)) : ((8'ha1) <<< (8'ha6)))} <<< (8'had))})
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire90,
                 wire88,
                 wire39,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg37,
                 (1'h0)};
  assign wire30 = $unsigned((wire29 ?
                      (8'ha1) : $unsigned($unsigned(wire28[(2'h2):(1'h0)]))));
  assign wire31 = ((($signed($signed(wire28)) > wire27) | (~{wire27[(2'h2):(1'h0)]})) >> wire26[(3'h4):(2'h2)]);
  assign wire32 = wire26[(4'hd):(4'hd)];
  assign wire33 = ((^$unsigned($unsigned((wire32 ? wire28 : wire29)))) ?
                      (^(8'hb1)) : (wire27 ~^ wire26[(2'h2):(1'h1)]));
  assign wire34 = wire27[(3'h6):(3'h6)];
  assign wire35 = wire28;
  assign wire36 = $unsigned({wire28[(4'ha):(2'h3)]});
  always
    @(posedge clk) begin
      reg37 <= $unsigned((8'ha4));
    end
  assign wire38 = $signed((-reg37[(3'h4):(3'h4)]));
  assign wire39 = (~^$signed(reg37[(4'h8):(3'h5)]));
  module40 #() modinst89 (.wire43(wire28), .wire44(wire30), .y(wire88), .clk(clk), .wire42(wire38), .wire41(wire34));
  assign wire90 = $signed(wire29);
  always
    @(posedge clk) begin
      if ((wire28[(3'h5):(1'h0)] + ((8'hb2) * $signed((((8'h9e) == wire33) | $unsigned(wire38))))))
        begin
          if ($unsigned($signed($signed((~|wire26[(2'h2):(2'h2)])))))
            begin
              reg91 <= $signed($unsigned(($unsigned($unsigned((8'haf))) >= wire31[(1'h0):(1'h0)])));
            end
          else
            begin
              reg91 <= $signed(wire30[(3'h7):(3'h6)]);
            end
          reg92 <= $signed($unsigned($unsigned((!$unsigned(wire27)))));
          reg93 <= $signed({(|$unsigned((~^(8'hb3)))),
              (~^(reg37 ? reg37 : (^~wire35)))});
        end
      else
        begin
          reg91 <= {$unsigned((wire34 & $unsigned(wire28)))};
          reg92 <= wire36;
          reg93 <= (~^reg91[(1'h0):(1'h0)]);
          if ({wire36})
            begin
              reg94 <= ($unsigned(wire88[(5'h10):(3'h7)]) - (&((&wire33[(1'h1):(1'h1)]) ?
                  ($unsigned(wire36) ?
                      {wire36, wire28} : $unsigned(reg37)) : ((^~wire34) ?
                      $unsigned(reg37) : wire30[(3'h5):(1'h0)]))));
              reg95 <= ($signed(wire88) ?
                  $signed(wire36) : {$signed((+wire90)),
                      $unsigned((-(&wire32)))});
              reg96 <= (((8'hb7) >= ((((7'h41) == reg92) ~^ $signed(wire38)) ?
                      (!$unsigned((8'ha7))) : $unsigned(((8'hbd) + wire35)))) ?
                  $signed(reg91) : (~^$unsigned($signed((reg95 ?
                      wire38 : reg37)))));
            end
          else
            begin
              reg94 <= reg94;
              reg95 <= reg96[(2'h3):(2'h2)];
              reg96 <= reg95;
              reg97 <= $signed((wire30[(2'h2):(1'h1)] != $signed((reg95 ?
                  wire39[(4'h9):(4'h8)] : $unsigned(reg96)))));
            end
          reg98 <= ((8'hba) ?
              (~^$signed((^wire30[(4'hd):(4'h8)]))) : ((-(&(wire28 | wire33))) - $signed((((8'ha7) ^ wire35) ?
                  $unsigned(reg92) : {wire39, reg93}))));
        end
      reg99 <= ((8'hb3) ?
          $unsigned((({wire88, wire90} ?
              (wire39 | wire27) : $signed(wire33)) > $signed((&reg95)))) : $unsigned($unsigned(reg95)));
      if (($unsigned(wire36) ?
          reg91 : (wire39 | (~(reg91[(1'h0):(1'h0)] ?
              (~&wire28) : (reg99 & wire29))))))
        begin
          reg100 <= {$unsigned($signed({$signed(wire38)})),
              $unsigned($signed(wire31[(3'h6):(2'h2)]))};
          reg101 <= {$signed(reg100[(4'h9):(3'h7)]),
              $signed((wire88 & ((wire34 ~^ wire34) >> ((7'h43) <<< (8'hab)))))};
          reg102 <= $unsigned(wire31[(3'h4):(1'h1)]);
        end
      else
        begin
          reg100 <= (-(($unsigned(wire30) ?
              reg93 : {reg91}) * ($signed((-wire26)) ?
              (8'hb1) : (|wire90[(3'h5):(3'h5)]))));
          reg101 <= reg98[(4'hf):(4'hf)];
        end
    end
  assign wire103 = (($unsigned((8'h9e)) > ($unsigned((~^wire29)) <<< wire33[(2'h2):(1'h0)])) & (-((~&$signed(reg92)) ?
                       $unsigned((&wire36)) : {(|reg99)})));
  assign wire104 = wire32[(1'h0):(1'h0)];
  assign wire105 = $unsigned({(&reg100),
                       $unsigned($unsigned(wire39[(4'h8):(3'h6)]))});
  assign wire106 = ($unsigned((({reg93} ?
                               (wire31 << (8'hb4)) : $unsigned(reg97)) ?
                           $signed(((8'ha1) >> reg102)) : $unsigned((~&wire104)))) ?
                       (~|reg37[(1'h1):(1'h0)]) : wire103[(4'h8):(1'h1)]);
  assign wire107 = ((~^$unsigned((!(~^wire88)))) ~^ {(($signed(reg102) ?
                           (wire34 ?
                               (8'haf) : wire27) : reg95) ^~ ($unsigned(wire103) < $unsigned(wire39))),
                       (8'hbe)});
  assign wire108 = $signed(reg98);
  assign wire109 = (~|(~^wire31[(3'h5):(1'h1)]));
endmodule

module module8
#(parameter param19 = (&(({(~(8'hac)), {(8'hbc), (8'hae)}} > (~|((8'ha1) ? (8'hbc) : (8'hbe)))) && ((~^(|(8'hb0))) >>> ({(8'ha3), (8'ha0)} >= ((8'ha3) ~^ (8'hba)))))), 
parameter param20 = param19)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  assign y = {wire18, wire17, wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = (8'ha6);
  assign wire14 = (wire13[(1'h0):(1'h0)] >> (wire13[(2'h2):(1'h1)] ?
                      (7'h40) : $signed(($signed((8'ha6)) <<< (-wire13)))));
  assign wire15 = ($signed((wire14[(2'h3):(1'h1)] ?
                          wire11[(1'h1):(1'h0)] : wire14[(2'h2):(1'h0)])) ?
                      wire13 : wire12);
  assign wire16 = wire14;
  assign wire17 = (&(-$unsigned($signed((wire16 ? wire10 : (7'h40))))));
  assign wire18 = wire12;
endmodule

module module40
#(parameter param87 = (^~(((^~(~(8'h9d))) ? (8'hb9) : (8'hb0)) ? {(((8'hbe) >> (8'hb5)) >> ((7'h44) ~^ (8'had))), {{(8'ha6), (8'hbd)}}} : (+(+((8'ha7) ? (8'ha6) : (8'hba)))))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire44;
  input wire [(2'h3):(1'h0)] wire43;
  input wire signed [(5'h15):(1'h0)] wire42;
  input wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire45 = wire41[(2'h2):(1'h0)];
  assign wire46 = (wire42[(4'ha):(4'ha)] ?
                      wire45[(2'h3):(1'h0)] : $unsigned(((-(^(7'h40))) <= wire42)));
  assign wire47 = (((~$unsigned($unsigned(wire42))) ?
                          $signed($signed((+wire43))) : (8'hae)) ?
                      (-$unsigned(((wire43 <= wire41) ^ $signed(wire45)))) : (wire46 << (~&wire44[(3'h7):(2'h3)])));
  assign wire48 = (~&wire43[(2'h3):(1'h0)]);
  assign wire49 = wire43;
  assign wire50 = wire48;
  assign wire51 = $signed((($signed(wire50[(2'h3):(2'h3)]) ?
                          {$signed(wire41),
                              (wire42 - (8'h9f))} : $signed((wire46 ?
                              wire48 : wire46))) ?
                      wire46[(4'ha):(3'h4)] : $signed(wire47)));
  assign wire52 = (8'hbc);
  assign wire53 = wire48;
  assign wire54 = {$signed(wire51),
                      (((^~(wire52 ? wire50 : wire49)) ?
                              $unsigned({wire48}) : (wire46 ?
                                  wire44 : wire52)) ?
                          wire46 : ((~wire47[(4'h8):(1'h1)]) | ((^wire45) ?
                              (wire46 * wire46) : (~|wire46))))};
  always
    @(posedge clk) begin
      if (wire46)
        begin
          reg55 <= (8'ha7);
          reg56 <= (8'hb7);
          if ($signed((+wire47)))
            begin
              reg57 <= ($unsigned({(~|(~|reg56)),
                  (|(8'hbb))}) * (~(&{reg56[(3'h5):(1'h0)], $signed(wire49)})));
              reg58 <= (wire50 - reg55[(1'h1):(1'h0)]);
              reg59 <= $signed(wire47);
            end
          else
            begin
              reg57 <= (wire45[(1'h1):(1'h1)] + (~{(^~$unsigned(wire53))}));
            end
          reg60 <= wire45[(4'hc):(4'hc)];
          reg61 <= $signed(reg56[(3'h5):(3'h4)]);
        end
      else
        begin
          if (wire47)
            begin
              reg55 <= wire43;
              reg56 <= {$signed(((reg57[(3'h7):(2'h2)] * $unsigned((8'hb9))) ?
                      (&{wire53}) : (^~{(8'hb4)}))),
                  {wire42}};
              reg57 <= $signed($unsigned((reg60[(3'h5):(3'h4)] < $signed(wire43))));
              reg58 <= ((wire44[(5'h13):(2'h2)] ?
                  {$unsigned(wire52[(1'h0):(1'h0)])} : wire44) + ((wire49[(1'h0):(1'h0)] - {(wire51 ?
                      wire45 : (8'hba))}) == (~&(-wire54))));
            end
          else
            begin
              reg55 <= (reg55 != $unsigned((&wire50[(2'h2):(1'h1)])));
              reg56 <= $signed(wire49[(3'h4):(1'h1)]);
              reg57 <= wire47[(3'h5):(1'h1)];
              reg58 <= (^~wire49[(4'hf):(2'h3)]);
            end
          reg59 <= $unsigned(({(reg61 ? $unsigned(wire44) : {wire50}),
                  ($signed(wire45) * $signed((8'ha4)))} ?
              $unsigned(((reg58 + reg56) >> $signed(wire52))) : wire42));
          reg60 <= ($signed(wire43[(1'h1):(1'h1)]) == ((+$unsigned((wire41 ^~ reg55))) ?
              $unsigned((!(wire49 ?
                  reg60 : (8'hac)))) : (($signed(wire50) || {wire48}) ?
                  $signed($signed((8'ha2))) : wire45)));
          reg61 <= $signed((&(~^$signed((8'hbe)))));
          reg62 <= (((wire50[(3'h5):(2'h3)] ?
              {(~^reg55)} : $unsigned({(8'h9f),
                  reg59})) < reg61) <= (^~$unsigned(($unsigned((8'ha6)) ?
              (reg61 << reg61) : (!(8'hba))))));
        end
      reg63 <= $unsigned(reg55);
      reg64 <= reg60;
      reg65 <= wire45;
      reg66 <= $unsigned(($unsigned(reg55) && $signed(reg64)));
    end
  always
    @(posedge clk) begin
      reg67 <= (&{wire54[(2'h3):(1'h1)]});
      reg68 <= wire54[(2'h3):(1'h0)];
      reg69 <= reg63;
      if (($unsigned((((~^reg58) == wire48) ?
              wire42[(4'he):(1'h0)] : ((wire51 ? reg63 : wire47) <<< (reg68 ?
                  reg62 : reg63)))) ?
          ({{$signed(reg60), (+reg65)}} - ((wire48[(3'h4):(1'h1)] ?
              reg65 : $unsigned(reg66)) - {(~^(8'hb0))})) : wire54))
        begin
          if ((wire46[(4'hc):(3'h5)] ?
              $unsigned(((reg66 ^~ wire46[(4'hd):(3'h7)]) ?
                  (8'hb3) : wire44)) : ($signed(((reg68 - wire53) ?
                  (wire43 ?
                      wire41 : wire41) : (~&wire45))) >= ((!{wire47}) * (((8'hac) <<< wire41) <= wire43[(2'h2):(1'h0)])))))
            begin
              reg70 <= ((wire53 == (~^((reg64 & reg55) << (wire54 - wire50)))) <<< reg60);
              reg71 <= (reg61[(2'h2):(1'h0)] ?
                  ($unsigned(reg63) ?
                      (wire47[(5'h13):(4'hd)] > ($unsigned(wire50) ?
                          wire54 : (!(7'h41)))) : (reg65 & ((reg59 ?
                              wire54 : wire52) ?
                          (|wire50) : $signed(wire48)))) : (($signed($unsigned((8'hb6))) ?
                          {(wire46 ? wire43 : (8'ha4)),
                              (+reg67)} : $unsigned($signed(wire44))) ?
                      {(!$signed(wire50)),
                          (^~$unsigned(reg65))} : {wire44[(2'h3):(1'h0)]}));
              reg72 <= ((8'hb2) ~^ {reg60,
                  ($unsigned({wire52}) == (reg65 ?
                      $unsigned(reg56) : {wire52}))});
              reg73 <= wire47[(3'h4):(1'h1)];
            end
          else
            begin
              reg70 <= (+$signed($unsigned(reg68)));
              reg71 <= ((-(wire51 ?
                      {(reg72 ? (8'ha0) : wire44)} : wire48[(4'hf):(4'h9)])) ?
                  reg59[(4'h8):(3'h4)] : $signed((!reg58[(2'h3):(2'h3)])));
            end
          reg74 <= wire48;
          reg75 <= reg72[(2'h3):(1'h0)];
        end
      else
        begin
          reg70 <= reg75[(1'h1):(1'h0)];
          reg71 <= ($signed(reg74[(4'he):(2'h2)]) && reg59[(2'h3):(1'h1)]);
          reg72 <= wire51[(2'h2):(1'h1)];
        end
      if (wire44)
        begin
          if (wire51[(3'h6):(1'h0)])
            begin
              reg76 <= ({(wire43[(2'h3):(2'h2)] ?
                          (reg71[(4'hc):(2'h3)] <<< $signed(reg71)) : ($unsigned(reg65) ?
                              (reg64 | wire42) : (reg68 ? reg60 : reg67))),
                      ((wire53[(1'h1):(1'h0)] ?
                              (~^reg69) : reg75[(1'h1):(1'h0)]) ?
                          $unsigned((reg65 || (8'hbc))) : (~&wire48))} ?
                  ({$unsigned((reg74 >>> reg74))} ?
                      (reg71[(2'h2):(1'h1)] << {(~^reg66)}) : $signed($signed(wire50))) : $signed(reg65[(5'h12):(3'h6)]));
              reg77 <= (~|$signed(wire54));
              reg78 <= $unsigned($unsigned({$signed((wire53 ^~ reg63))}));
              reg79 <= $signed($unsigned($unsigned((reg60 | (reg61 && wire48)))));
            end
          else
            begin
              reg76 <= $signed(($unsigned(reg70[(1'h1):(1'h1)]) + reg60));
              reg77 <= ((&$signed(($unsigned(reg62) == wire44[(4'he):(4'ha)]))) <<< ((reg70[(2'h2):(1'h1)] < reg73[(4'ha):(2'h3)]) ?
                  ((&wire47[(5'h11):(4'hd)]) ?
                      $unsigned($signed(reg63)) : ($signed(reg71) <= (&reg65))) : reg71));
              reg78 <= (&($signed(reg70[(2'h2):(1'h1)]) ?
                  reg56[(1'h1):(1'h0)] : ((-reg57[(4'ha):(3'h4)]) ^ reg61)));
              reg79 <= reg55;
            end
          reg80 <= $signed((wire50[(3'h4):(2'h3)] ?
              ($signed(wire53) <= $unsigned((+wire44))) : (((8'hbc) >>> (~&wire42)) <= $unsigned((reg79 != reg68)))));
          reg81 <= $signed((!(reg70[(1'h0):(1'h0)] ?
              $signed((reg63 * reg65)) : $unsigned($unsigned(reg76)))));
        end
      else
        begin
          reg76 <= wire43;
          reg77 <= ((!($signed((reg77 ?
              wire53 : wire44)) <= (+$unsigned(reg70)))) * {(~|{$signed(reg65),
                  $signed(reg58)})});
          reg78 <= wire52;
          reg79 <= ((wire51 <<< ($signed({reg78}) ?
                  $signed((reg66 ? wire44 : wire52)) : wire49)) ?
              (wire52 - reg81[(3'h7):(3'h6)]) : $unsigned($signed((!((8'h9c) ?
                  reg76 : (8'hac))))));
        end
    end
  assign wire82 = reg62;
  assign wire83 = (-{reg79, wire42[(5'h15):(4'hd)]});
  assign wire84 = wire82[(2'h3):(1'h1)];
  assign wire85 = (reg59[(4'h8):(3'h7)] ?
                      ({(wire49[(4'he):(3'h5)] - $signed(reg55)),
                              (+(wire52 ? reg68 : wire49))} ?
                          ((-$unsigned(reg75)) != (reg58 ?
                              reg66[(4'hd):(4'hb)] : {reg81,
                                  reg63})) : (~^$unsigned((~^wire52)))) : (^~({(~^reg63)} || $signed($signed(reg69)))));
  assign wire86 = reg55[(4'he):(4'he)];
endmodule
