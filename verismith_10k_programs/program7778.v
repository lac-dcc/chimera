module top
#(parameter param144 = (((!(!{(8'ha0), (7'h43)})) - (({(8'hb9)} <<< ((7'h44) ? (8'hb6) : (8'hb9))) ? (((7'h41) <= (8'hae)) < {(8'hb9), (8'hae)}) : ((~|(8'h9c)) ? {(8'h9d)} : (+(8'ha2))))) ? {((|{(8'haa)}) ? ((~(8'ha2)) ? ((8'had) ? (7'h42) : (7'h41)) : {(8'hbf)}) : (~^((8'hb7) > (7'h41))))} : (^{(|((8'ha4) >> (8'ha8)))})), 
parameter param145 = (!(param144 | (param144 >> (+(param144 ? param144 : param144))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire131;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire28;
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire128,
                 wire30,
                 wire5,
                 wire28,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 (1'h0)};
  assign wire5 = wire2;
  module6 #() modinst29 (wire28, clk, wire2, wire0, wire1, wire4, wire3);
  assign wire30 = $unsigned($unsigned((8'ha1)));
  module31 #() modinst129 (.wire33(wire28), .clk(clk), .wire34(wire2), .wire35(wire1), .y(wire128), .wire32(wire0));
  assign wire130 = $unsigned(({(~|(~&(8'had))),
                       (wire5 ? $signed((8'hbc)) : $unsigned(wire5))} < {wire2,
                       wire128}));
  assign wire131 = (~|(~(({(8'hae)} ?
                           $signed(wire130) : ((8'haf) ? wire4 : (8'hb2))) ?
                       ({wire3} || (wire28 > wire130)) : wire30)));
  assign wire132 = $signed({wire128[(2'h3):(2'h3)],
                       ((8'ha5) ?
                           wire0[(4'he):(4'hc)] : wire30[(4'hb):(2'h2)])});
  assign wire133 = wire130[(4'h9):(2'h2)];
  assign wire134 = ($signed((~^$signed({wire128}))) - ((wire3[(1'h1):(1'h0)] ?
                       (wire5 <<< $signed(wire2)) : wire130[(3'h7):(2'h3)]) & wire1[(4'he):(2'h3)]));
  assign wire135 = (8'ha2);
  always
    @(posedge clk) begin
      reg136 <= (&wire128[(3'h6):(2'h3)]);
      if (((7'h42) ^~ wire28[(4'h9):(3'h7)]))
        begin
          reg137 <= ($signed(wire30[(5'h15):(4'hc)]) ?
              $unsigned((!wire134[(3'h4):(3'h4)])) : {{reg136,
                      ({wire2} ? wire5 : wire132[(2'h2):(2'h2)])}});
          reg138 <= wire0;
          reg139 <= $signed((|wire30));
        end
      else
        begin
          reg137 <= wire5[(3'h6):(3'h4)];
          if ($unsigned($signed(wire131)))
            begin
              reg138 <= $unsigned((~&wire128[(1'h0):(1'h0)]));
              reg139 <= {$signed(((|(~|wire135)) - reg136)),
                  {(7'h43),
                      $signed((reg139[(1'h0):(1'h0)] ?
                          reg136 : $signed(wire1)))}};
            end
          else
            begin
              reg138 <= (&wire2[(3'h4):(1'h0)]);
              reg139 <= (((^reg137) ^~ {(reg137[(4'hb):(2'h3)] - wire128[(3'h5):(3'h5)]),
                      $signed((reg137 + wire131))}) ?
                  (^~$signed(($signed(wire0) ?
                      wire130 : (!wire3)))) : (^($unsigned((^~reg139)) && $unsigned(wire130))));
            end
        end
      reg140 <= (reg136 ? wire5 : reg138);
    end
  assign wire141 = (~(^$unsigned(wire5[(3'h7):(3'h6)])));
  assign wire142 = wire3[(4'hb):(3'h5)];
  assign wire143 = wire134;
endmodule

module module31
#(parameter param127 = ((&(&{{(7'h40), (8'ha9)}})) <<< ((+(~|((8'hba) < (7'h41)))) ? (^({(8'hbd), (8'hbc)} ? (8'hb4) : ((8'hbf) ? (8'hb3) : (8'ha3)))) : (({(8'hac)} - (8'ha2)) ? (((8'haf) >= (8'h9d)) ? (~|(8'hae)) : ((8'haa) <= (7'h44))) : (((8'ha0) ? (8'hb8) : (8'ha8)) != (&(8'hb2)))))))
(y, clk, wire32, wire33, wire34, wire35);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire33;
  input wire [(4'hc):(1'h0)] wire34;
  input wire [(4'ha):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire126;
  wire signed [(4'h9):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire118;
  wire signed [(5'h11):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire99;
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire118,
                 wire117,
                 wire116,
                 wire102,
                 wire101,
                 wire36,
                 wire37,
                 wire42,
                 wire43,
                 wire44,
                 wire56,
                 wire58,
                 wire99,
                 reg121,
                 reg120,
                 reg119,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire36 = (~|wire35);
  assign wire37 = (&$unsigned(wire36[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg38 <= ($unsigned($unsigned(wire32)) != {{$signed((^wire33)),
              ((wire34 ? wire35 : wire37) >>> ((8'had) + wire32))}});
      reg39 <= (~&reg38[(3'h4):(3'h4)]);
      reg40 <= ($signed((!$unsigned($signed(reg39)))) > ($unsigned($unsigned($signed(reg38))) ?
          (+wire37[(3'h5):(1'h0)]) : {$signed(wire34),
              ($signed((8'hb0)) ? wire37 : $signed(wire34))}));
      reg41 <= (wire34 ?
          wire33[(3'h6):(2'h2)] : {(^(reg38 == (wire35 - reg39)))});
    end
  assign wire42 = ((8'hb8) ? reg40[(1'h0):(1'h0)] : (!(8'hb8)));
  assign wire43 = (~|{($signed({wire33, wire42}) >= (wire33[(4'hd):(3'h6)] ?
                          {(8'hb6)} : $signed(wire33))),
                      $unsigned(((wire35 ?
                          wire37 : (8'hb7)) < wire37[(3'h7):(2'h3)]))});
  assign wire44 = ($unsigned(wire34) < ((!(!{wire35, wire33})) ?
                      ($unsigned((-wire32)) ?
                          ({wire33} ?
                              reg40 : $signed(reg40)) : (wire42[(4'ha):(1'h1)] ?
                              $unsigned(wire36) : reg38[(2'h2):(1'h0)])) : (wire33[(1'h0):(1'h0)] ?
                          $unsigned($signed((7'h42))) : $signed($signed((8'hbe))))));
  module45 #() modinst57 (.clk(clk), .wire50(wire42), .wire47(wire32), .y(wire56), .wire46(wire37), .wire49(reg41), .wire48(wire44));
  assign wire58 = ({($signed($unsigned(wire42)) ?
                              ((~^wire34) > $unsigned(wire56)) : (wire44[(4'h9):(1'h1)] ?
                                  wire36 : (~^wire44)))} ?
                      $signed($signed((wire33 ?
                          reg39[(3'h4):(3'h4)] : $unsigned(reg39)))) : $unsigned({wire33[(4'ha):(4'ha)]}));
  module59 #() modinst100 (wire99, clk, wire32, wire33, reg39, wire37);
  assign wire101 = ({((~(wire36 ?
                           wire33 : wire42)) | ($signed(wire42) ^~ $unsigned((7'h43))))} >>> ($signed($signed({wire44})) ?
                       wire33[(5'h10):(4'hf)] : $signed($unsigned(wire58))));
  assign wire102 = (($unsigned(($signed(wire34) <<< (|wire56))) * {$signed($unsigned(wire37))}) >> $signed((wire36 >> ({wire42,
                           wire101} ?
                       (wire58 + wire32) : wire99))));
  always
    @(posedge clk) begin
      reg103 <= $unsigned((~&reg39[(4'hc):(2'h3)]));
      if (($unsigned((!wire43[(3'h7):(2'h2)])) ?
          (((&wire43[(3'h6):(3'h4)]) > {((8'ha8) ? reg41 : wire36),
                  (reg103 ? wire58 : reg40)}) ?
              $signed(($signed(wire37) > {wire58})) : ($unsigned($signed(reg103)) ^ ((~&(8'hab)) ?
                  (^wire32) : (wire42 <<< wire101)))) : wire35[(3'h4):(2'h2)]))
        begin
          reg104 <= ((wire37 ?
                  {(wire34 ?
                          (wire99 >>> wire101) : $unsigned(reg39))} : reg103[(3'h5):(2'h3)]) ?
              reg41[(2'h3):(2'h2)] : $signed($unsigned($unsigned((^~wire44)))));
          if ((((wire32 & (wire101[(2'h2):(2'h2)] ?
              ((8'hae) ?
                  wire33 : wire35) : $unsigned(wire99))) ~^ wire44[(1'h1):(1'h0)]) + $signed(($signed((wire34 > wire101)) << ((wire33 ?
                  reg38 : wire33) ?
              $unsigned((8'hbb)) : wire36)))))
            begin
              reg105 <= (-wire101);
            end
          else
            begin
              reg105 <= wire102;
              reg106 <= reg103;
              reg107 <= (~|((reg41 || ((reg105 * wire36) ?
                      wire35[(3'h6):(3'h5)] : $signed(reg38))) ?
                  reg105[(5'h12):(5'h10)] : reg106[(2'h2):(2'h2)]));
            end
          reg108 <= $unsigned($signed(((~&$signed(reg105)) > wire36)));
          reg109 <= reg105[(5'h14):(5'h14)];
          reg110 <= $unsigned($signed($signed($unsigned((reg108 ?
              reg105 : (8'ha3))))));
        end
      else
        begin
          if (reg109[(1'h1):(1'h0)])
            begin
              reg104 <= $unsigned(((7'h43) ?
                  reg109[(3'h7):(1'h0)] : (reg41 + (((8'ha1) >= (8'ha3)) ?
                      $unsigned(reg39) : $unsigned(wire101)))));
              reg105 <= {$unsigned($unsigned({$unsigned(wire44)}))};
              reg106 <= $unsigned(reg107[(2'h2):(1'h0)]);
            end
          else
            begin
              reg104 <= $unsigned(wire35);
              reg105 <= reg39;
              reg106 <= $signed(({(8'ha8)} ^ wire58[(4'hb):(3'h7)]));
            end
          reg107 <= (~&(!$unsigned(reg104[(3'h6):(1'h0)])));
        end
      if ({wire33})
        begin
          reg111 <= (reg107[(1'h0):(1'h0)] ?
              $signed(wire34[(2'h3):(1'h1)]) : reg107[(2'h2):(2'h2)]);
          reg112 <= $signed(wire58[(4'h9):(3'h6)]);
          if ((((wire102 || ((wire58 ? (8'hbe) : wire99) ?
                  (+(7'h40)) : reg40[(3'h4):(1'h0)])) != $signed((-reg110[(3'h7):(2'h3)]))) ?
              $signed((reg38[(1'h0):(1'h0)] ?
                  (reg41 | $signed(reg104)) : $unsigned(reg108[(3'h6):(1'h0)]))) : ((($signed(reg110) ?
                      $unsigned(reg104) : (reg39 ? reg106 : wire34)) ?
                  reg104[(3'h6):(3'h4)] : (-$unsigned(reg108))) ~^ $unsigned(($signed(wire34) ?
                  (wire42 ? reg110 : reg106) : wire58)))))
            begin
              reg113 <= wire36;
              reg114 <= ($signed((8'ha0)) ?
                  ((wire56[(3'h7):(1'h0)] || $unsigned((reg109 * wire56))) ?
                      ((8'ha2) >= ({reg111, wire35} ?
                          (wire99 ? wire99 : reg111) : (reg108 ?
                              (8'hb8) : reg103))) : reg105) : reg105);
              reg115 <= ((^~$unsigned(reg40)) ?
                  ($unsigned({$signed(reg108)}) ?
                      ((reg110[(2'h2):(1'h1)] ?
                          (wire56 ? reg107 : wire35) : {reg110,
                              (7'h44)}) == $signed($unsigned(reg104))) : (wire42[(3'h5):(3'h4)] ?
                          {{wire42},
                              wire32[(4'h8):(3'h7)]} : (reg103[(2'h3):(1'h1)] ?
                              {(8'hb2),
                                  (8'hb2)} : (~&reg41)))) : ($unsigned(($unsigned(reg110) ?
                          (wire44 ? (8'ha0) : wire34) : $signed(reg39))) ?
                      (($unsigned(wire37) ?
                          (wire42 - (8'hb7)) : (&wire58)) > (~^wire99)) : (((wire33 ?
                          wire33 : reg104) <<< $signed(reg105)) ~^ $unsigned(wire32[(5'h10):(3'h4)]))));
            end
          else
            begin
              reg113 <= reg104;
            end
        end
      else
        begin
          reg111 <= $signed((^$signed((!(reg114 ? reg39 : reg41)))));
          reg112 <= $signed($signed($signed($unsigned($signed(wire37)))));
        end
    end
  assign wire116 = $unsigned(reg40[(1'h0):(1'h0)]);
  assign wire117 = ($signed((({wire34} > {reg105}) ?
                           ({reg105, reg113} ?
                               wire32[(3'h7):(2'h2)] : $unsigned(wire43)) : (wire42[(4'hd):(4'hd)] + wire101))) ?
                       ((!(^~wire42[(3'h6):(3'h5)])) ?
                           reg109 : $signed(((reg106 ?
                               (8'hbc) : reg105) | (wire44 ?
                               reg103 : reg40)))) : (|$unsigned((|reg113[(3'h5):(2'h3)]))));
  assign wire118 = reg106[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg119 <= (wire35[(2'h3):(1'h1)] - $unsigned((~^$unsigned((~&wire35)))));
      reg120 <= reg114;
      reg121 <= (((wire44 != reg107[(2'h3):(2'h3)]) - $unsigned({(reg105 >> (8'had))})) || reg38[(1'h0):(1'h0)]);
    end
  assign wire122 = ($unsigned(reg115[(1'h0):(1'h0)]) ?
                       (wire58[(4'hf):(3'h4)] ?
                           wire37[(3'h6):(3'h6)] : (!{(reg110 ?
                                   reg104 : reg114)})) : ($signed(reg111) ?
                           (((wire56 ? wire34 : reg39) || {wire102,
                               reg40}) | wire35[(4'ha):(2'h2)]) : (wire42 >>> wire118)));
  assign wire123 = wire36;
  assign wire124 = (($unsigned($signed($signed((8'hac)))) ?
                           $signed((wire56[(5'h10):(4'hf)] ?
                               $signed(reg114) : reg106[(2'h2):(1'h1)])) : $signed(reg109)) ?
                       {(($unsigned(wire43) ?
                               reg107[(1'h0):(1'h0)] : $unsigned(wire32)) >= (&((8'hb2) ?
                               reg114 : reg115))),
                           ((^~$signed(wire99)) ?
                               $signed($signed(reg110)) : $signed(wire118))} : (8'hb6));
  assign wire125 = (reg110 ?
                       (($unsigned((^(8'hbb))) ?
                           $signed($unsigned(wire32)) : wire34) * reg119) : wire56[(2'h3):(1'h1)]);
  assign wire126 = (wire125 ?
                       $signed($signed(wire99[(4'hb):(2'h2)])) : (((wire123 != (wire56 + wire101)) ?
                           $signed(reg110[(4'h9):(1'h0)]) : {((8'hb8) && wire125)}) << reg119));
endmodule

module module6
#(parameter param27 = (&(((((8'ha8) & (8'hb4)) || ((8'ha0) ~^ (8'hbd))) ? ((-(8'ha5)) || ((8'hbb) != (8'hb2))) : (((8'hb5) <= (8'ha4)) ? (^(8'h9f)) : {(8'hb1)})) != (+(+(8'ha2))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(2'h2):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire14,
                 wire13,
                 wire12,
                 reg15,
                 (1'h0)};
  assign wire12 = $signed(wire10);
  assign wire13 = $signed((8'ha8));
  assign wire14 = $unsigned((-wire8));
  always
    @(posedge clk) begin
      reg15 <= wire14[(3'h4):(2'h2)];
    end
  assign wire16 = reg15[(2'h2):(2'h2)];
  assign wire17 = ($signed((((~^wire14) ? {reg15, wire7} : {wire16, wire8}) ?
                          $unsigned($signed(wire9)) : $signed($signed(wire9)))) ?
                      wire12 : $signed(wire7));
  assign wire18 = $unsigned((wire7[(2'h2):(1'h1)] ?
                      $unsigned($signed((~^wire13))) : {wire16[(3'h5):(1'h0)]}));
  assign wire19 = (~&wire18);
  assign wire20 = wire11;
  assign wire21 = $signed($unsigned(wire8));
  assign wire22 = wire16;
  assign wire23 = wire21;
  assign wire24 = wire22[(1'h1):(1'h0)];
  assign wire25 = ((7'h44) <<< wire14);
  assign wire26 = {(~&{(~|(wire21 ? wire14 : wire21))})};
endmodule

module module59
#(parameter param98 = {(~&(~&(((8'hb6) ? (8'hb6) : (8'h9d)) ? ((8'ha3) != (8'hbe)) : ((8'had) ? (8'had) : (8'hb8)))))})
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire63;
  input wire [(2'h2):(1'h0)] wire62;
  input wire [(4'h8):(1'h0)] wire61;
  input wire [(3'h5):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg82,
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
                 (1'h0)};
  assign wire64 = wire61;
  assign wire65 = (8'hb1);
  assign wire66 = wire61;
  assign wire67 = (&wire65[(3'h4):(1'h0)]);
  assign wire68 = wire62[(1'h1):(1'h0)];
  assign wire69 = (~^(8'h9f));
  always
    @(posedge clk) begin
      if ($unsigned((-($unsigned(wire66[(3'h6):(2'h2)]) ?
          {wire69[(3'h7):(2'h2)], (8'h9c)} : {$unsigned(wire67), wire64}))))
        begin
          if (wire66[(3'h4):(2'h2)])
            begin
              reg70 <= $signed((~&wire61[(3'h4):(2'h2)]));
              reg71 <= {(8'hb6),
                  $signed((wire63[(3'h5):(3'h4)] - $unsigned((wire60 ?
                      wire66 : wire67))))};
              reg72 <= $signed($signed((wire69 ?
                  $unsigned((wire67 ?
                      wire66 : wire69)) : ((wire68 && (8'h9c)) + $signed((7'h40))))));
              reg73 <= wire66[(4'h9):(3'h6)];
            end
          else
            begin
              reg70 <= $signed($unsigned(wire64));
              reg71 <= wire67;
              reg72 <= wire61;
            end
        end
      else
        begin
          reg70 <= {((reg71 ?
                  $signed(reg73[(4'hf):(4'hf)]) : wire67[(1'h1):(1'h1)]) - ($unsigned($unsigned(reg71)) == $signed((reg71 ?
                  wire62 : wire68)))),
              wire67[(4'h8):(2'h2)]};
          reg71 <= reg73;
          if ($unsigned(reg72[(2'h2):(2'h2)]))
            begin
              reg72 <= (&$signed($signed(({wire68} ?
                  (^wire65) : (wire61 ? wire64 : wire68)))));
              reg73 <= $unsigned(reg72);
              reg74 <= wire62[(1'h1):(1'h1)];
              reg75 <= ((wire64 ?
                  wire63 : (&$unsigned((8'hb8)))) & wire69[(4'h9):(3'h4)]);
              reg76 <= {(((8'ha5) ?
                          (~^$signed(wire64)) : wire69[(3'h7):(3'h4)]) ?
                      reg71[(1'h0):(1'h0)] : (~{((8'ha1) ? reg72 : (8'h9e))}))};
            end
          else
            begin
              reg72 <= {reg74[(2'h3):(1'h0)]};
            end
          reg77 <= ($signed({reg71[(4'h9):(2'h2)],
              ($signed(reg76) ?
                  reg71[(1'h1):(1'h0)] : reg70[(2'h2):(1'h0)])}) >= wire66[(4'h8):(2'h2)]);
          if (wire66)
            begin
              reg78 <= $unsigned(($signed(reg73[(3'h6):(3'h4)]) ?
                  ((!(~^reg73)) >= $signed($signed((8'hba)))) : wire67[(4'ha):(1'h0)]));
              reg79 <= wire67[(3'h7):(2'h3)];
              reg80 <= (wire65 ?
                  $unsigned($signed(wire67[(2'h3):(1'h0)])) : (wire68[(1'h1):(1'h0)] ?
                      (~&reg70[(4'hc):(2'h2)]) : $unsigned($unsigned($signed(reg71)))));
              reg81 <= (wire60 ?
                  (reg73 ?
                      wire63 : $unsigned(wire61[(3'h5):(3'h4)])) : (~&$unsigned((^~(~reg70)))));
            end
          else
            begin
              reg78 <= (^~(~|((|(~^(7'h44))) ?
                  reg81 : $signed((reg79 + (8'h9c))))));
              reg79 <= $signed($signed($signed((-(reg81 ~^ reg72)))));
            end
        end
      reg82 <= {$signed(reg81)};
    end
  assign wire83 = $signed($unsigned(reg78[(2'h3):(1'h0)]));
  assign wire84 = ({$unsigned({$signed(wire61)})} ?
                      (wire65 << wire63) : wire65[(3'h4):(3'h4)]);
  assign wire85 = (8'ha8);
  assign wire86 = (~((~&wire65) ? (reg75 ? wire68 : reg74) : wire66));
  assign wire87 = $unsigned($unsigned((($unsigned((8'ha3)) >>> wire65[(3'h4):(3'h4)]) || ($unsigned(wire65) ?
                      (wire61 - reg72) : wire62[(1'h1):(1'h1)]))));
  assign wire88 = wire61[(2'h2):(1'h1)];
  assign wire89 = {wire60};
  assign wire90 = {{reg70},
                      ({wire85,
                          $signed($unsigned(wire61))} + reg74[(2'h2):(1'h0)])};
  assign wire91 = ((-(+wire61)) && $signed(({reg76} ?
                      $signed(wire67) : reg77)));
  assign wire92 = (^~$unsigned((8'ha0)));
  assign wire93 = reg81;
  assign wire94 = ((~(^~wire91)) * $unsigned($signed($signed(wire63))));
  assign wire95 = $signed(((8'ha6) ?
                      (((reg80 ? wire66 : (8'ha4)) << (8'hbd)) ?
                          wire86 : ((wire62 ? wire86 : reg76) ?
                              reg75 : (~wire63))) : ((!(wire94 >>> wire67)) > ({reg73,
                              reg73} ?
                          (&wire92) : wire87[(3'h5):(1'h1)]))));
  assign wire96 = $unsigned(wire92[(3'h4):(1'h0)]);
  assign wire97 = wire83[(3'h7):(3'h5)];
endmodule

module module45  (y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire50;
  input wire signed [(5'h15):(1'h0)] wire49;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire [(3'h5):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  assign y = {wire55, wire54, wire53, wire52, wire51, (1'h0)};
  assign wire51 = (($signed((~|(wire49 ? wire49 : wire47))) ?
                      wire46 : wire46) <= wire47[(2'h2):(1'h1)]);
  assign wire52 = ((~&$unsigned((wire49[(4'hb):(4'hb)] * $unsigned(wire49)))) == (+wire51[(5'h10):(4'h9)]));
  assign wire53 = $unsigned($signed($signed((((7'h42) ?
                      wire50 : wire47) ^~ ((8'haf) > wire50)))));
  assign wire54 = $signed(wire49);
  assign wire55 = ((($signed(wire50[(2'h2):(2'h2)]) != {$signed(wire53)}) ?
                          wire51[(5'h12):(3'h6)] : wire51[(3'h5):(2'h2)]) ?
                      wire46[(2'h2):(1'h1)] : {$signed(($unsigned(wire51) ?
                              $signed((8'hb4)) : (wire48 ? wire49 : wire48)))});
endmodule
