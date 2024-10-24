module top
#(parameter param129 = ((((((8'hbc) ? (8'ha6) : (8'hbe)) <= (~|(8'hb5))) * (((8'hb2) <= (8'hbf)) <= {(8'hbf)})) + {(-(-(8'ha9)))}) ? (((((8'hab) ? (8'hbd) : (8'h9c)) > (-(8'haf))) ? ({(7'h40), (8'hb0)} ? ((8'hbb) != (8'haf)) : {(8'ha5)}) : (|((8'ha6) - (8'hb8)))) + (~&({(8'ha9)} == (~|(8'ha6))))) : ((^~(+(&(8'hae)))) ? ((&(~^(8'hbd))) | (+(^~(8'haa)))) : (^((^~(8'hb8)) ? ((8'hb3) ? (8'hb4) : (8'hb8)) : ((8'hb6) ? (8'hac) : (8'ha8)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire128;
  wire signed [(3'h5):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire118;
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  assign y = {wire128,
                 wire120,
                 wire116,
                 wire59,
                 wire18,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire57,
                 wire118,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  module5 #() modinst19 (wire18, clk, wire3, wire0, wire1, wire4);
  assign wire20 = ({wire1, wire1[(4'ha):(1'h0)]} ?
                      (wire18 ?
                          $signed(wire3) : (wire2 ^ $signed(wire1))) : wire3[(5'h13):(4'ha)]);
  assign wire21 = (8'ha9);
  assign wire22 = ((wire21[(1'h0):(1'h0)] ?
                      $unsigned(wire21) : {(((8'ha2) >> wire18) != wire18[(5'h13):(4'hc)])}) >= ({(+wire18),
                      (~^$signed((7'h44)))} <<< (wire3 ^ $signed((wire0 == (8'ha4))))));
  assign wire23 = {(($unsigned((wire3 ? wire1 : wire20)) ?
                          $unsigned($signed(wire20)) : {{(8'hab),
                                  (8'hb8)}}) ^ ((&(wire22 ? wire0 : wire21)) ?
                          wire21 : wire1)),
                      $signed((&{(-wire22), $signed(wire20)}))};
  assign wire24 = wire2[(2'h3):(1'h0)];
  assign wire25 = $signed(wire4);
  assign wire26 = ($signed((~&({wire23} || $unsigned((8'hac))))) ?
                      ($signed({(!wire22), (~^wire4)}) ?
                          ($signed($unsigned((8'haa))) ?
                              ($unsigned(wire24) ?
                                  wire4[(4'h8):(2'h2)] : wire20) : $unsigned((wire20 >> (8'hb1)))) : $unsigned(($signed(wire3) + (wire23 ~^ wire20)))) : $unsigned((~((&wire24) << (wire23 < wire21)))));
  assign wire27 = (((+(wire20 ? wire21 : (wire4 ? (7'h42) : wire2))) ?
                      wire4[(3'h4):(1'h0)] : wire20) || $signed(({wire23[(3'h5):(3'h4)]} ?
                      (wire23 ?
                          $signed(wire0) : (wire2 ?
                              wire22 : wire25)) : {(wire21 ? (8'ha8) : wire22),
                          $unsigned(wire24)})));
  assign wire28 = wire23;
  assign wire29 = ({($signed(wire23) ? wire18[(5'h12):(5'h12)] : wire2)} ?
                      (((wire0[(4'hd):(3'h6)] + (wire18 ?
                          wire28 : wire25)) | wire23) ^~ (~^wire23[(3'h7):(3'h7)])) : $signed(((^~{wire27,
                              wire25}) ?
                          (&wire21[(1'h1):(1'h0)]) : $signed(((7'h40) << wire4)))));
  module30 #() modinst58 (wire57, clk, wire24, wire29, wire26, wire18, wire25);
  assign wire59 = (((|(wire21[(2'h2):(2'h2)] <<< $signed(wire0))) ?
                          wire25[(4'he):(1'h0)] : (&wire28[(3'h4):(2'h3)])) ?
                      ($signed(wire23) ?
                          $unsigned((wire27 ?
                              ((8'h9d) >>> wire24) : $unsigned((8'ha5)))) : (8'h9d)) : ((($signed(wire4) + (wire24 ?
                              wire28 : wire3)) ?
                          (!wire24[(3'h5):(2'h3)]) : wire18) - wire1[(4'hb):(1'h1)]));
  module60 #() modinst117 (.wire61(wire27), .wire64(wire20), .wire62(wire4), .clk(clk), .wire65(wire26), .wire63(wire3), .y(wire116));
  module60 #() modinst119 (wire118, clk, wire1, wire27, wire2, wire22, wire29);
  assign wire120 = wire18;
  always
    @(posedge clk) begin
      if ($unsigned((^~((&(|wire2)) ~^ wire3))))
        begin
          reg121 <= $unsigned((~(~|$signed(wire23[(4'h8):(3'h6)]))));
          reg122 <= (^wire25);
          reg123 <= (|$unsigned((wire22[(5'h11):(2'h3)] <= ((|wire118) ?
              (reg122 < reg122) : wire26))));
          reg124 <= wire120[(1'h1):(1'h0)];
        end
      else
        begin
          if ({wire4[(3'h7):(3'h6)]})
            begin
              reg121 <= reg121;
            end
          else
            begin
              reg121 <= wire116[(1'h0):(1'h0)];
              reg122 <= ((((-(8'haf)) - (~^wire2)) & ($unsigned({wire27}) ?
                      wire118[(2'h3):(1'h0)] : (^~(wire116 ?
                          reg121 : (8'hb7))))) ?
                  wire2 : ($unsigned(((wire24 ~^ wire3) ?
                      wire2 : (~|wire59))) ^~ wire24[(4'h8):(3'h7)]));
              reg123 <= ($unsigned(({{reg124}} ?
                  wire20 : ((~^wire116) || (wire24 >> wire20)))) == ($unsigned(wire26) <<< ((^(wire24 & reg123)) ?
                  $unsigned($signed(wire116)) : (|(~^wire28)))));
            end
          reg124 <= wire120;
          reg125 <= wire0[(5'h15):(5'h12)];
          reg126 <= $signed((-$unsigned((~^wire59))));
        end
      reg127 <= $unsigned($signed(wire24[(3'h6):(1'h1)]));
    end
  assign wire128 = (((wire28[(2'h2):(2'h2)] > reg122[(2'h3):(1'h0)]) ?
                       wire28[(2'h2):(2'h2)] : (|(|$unsigned(wire24)))) | $signed((8'ha4)));
endmodule

module module60
#(parameter param115 = ((~|(((8'h9c) != (~^(7'h43))) == {(8'hb1), ((8'h9c) ? (8'ha6) : (8'ha0))})) ? (((~&((7'h43) ? (8'ha6) : (8'ha0))) ? (8'hbe) : ({(8'hb8), (8'hb0)} ? ((8'hb0) ? (8'hae) : (8'hbc)) : ((8'hbf) ? (8'haf) : (8'hb6)))) < ((8'had) & ((~^(8'had)) ? (~^(8'haf)) : (7'h40)))) : {(^(|((8'hb7) <<< (7'h43)))), (^~(((8'hb4) < (8'hb3)) ? (+(7'h42)) : ((8'hb1) ? (8'hb0) : (8'h9d))))}))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire65;
  input wire signed [(3'h5):(1'h0)] wire64;
  input wire [(5'h12):(1'h0)] wire63;
  input wire [(4'he):(1'h0)] wire62;
  input wire signed [(5'h13):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  assign y = {wire114,
                 wire113,
                 wire111,
                 wire96,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 (1'h0)};
  assign wire66 = wire61[(4'ha):(3'h5)];
  assign wire67 = wire62;
  assign wire68 = $unsigned((~^$unsigned($unsigned(wire64[(2'h3):(1'h0)]))));
  assign wire69 = {$unsigned($unsigned(wire67))};
  assign wire70 = $unsigned(((8'hb0) ~^ ((8'hac) ?
                      (+(wire63 ? wire65 : wire62)) : (wire67 ?
                          (&wire66) : ((8'ha3) ~^ wire65)))));
  assign wire71 = (wire70[(2'h2):(1'h0)] * $signed($unsigned(wire62)));
  assign wire72 = $unsigned($signed((($signed((8'hb6)) * wire67) ?
                      wire66[(3'h6):(2'h3)] : wire61[(4'he):(3'h7)])));
  assign wire73 = (({wire71} ?
                          (|{(wire62 ? wire63 : (8'hb8)),
                              $signed(wire64)}) : {(wire64[(2'h2):(2'h2)] ?
                                  $signed(wire62) : {wire62})}) ?
                      {$signed(wire70[(2'h3):(2'h2)])} : (8'haa));
  assign wire74 = ($unsigned(($unsigned((wire68 ?
                      wire66 : wire61)) - wire70)) <= ((($unsigned(wire67) <= {wire73,
                          wire61}) ^~ wire66[(3'h5):(1'h0)]) ?
                      wire66 : $unsigned((~|(wire65 & (8'ha0))))));
  assign wire75 = {(8'hba)};
  assign wire76 = ((&((~|wire66) <= (^~wire74[(1'h0):(1'h0)]))) < (&$unsigned($unsigned($signed(wire69)))));
  module77 #() modinst97 (wire96, clk, wire68, wire76, wire69, wire63);
  module98 #() modinst112 (.wire102(wire72), .wire99(wire73), .wire100(wire74), .wire101(wire75), .clk(clk), .y(wire111));
  assign wire113 = $signed(wire111[(2'h2):(2'h2)]);
  assign wire114 = ((wire61[(3'h7):(1'h0)] ?
                       $unsigned(((wire68 || wire74) + wire61[(2'h3):(1'h0)])) : (~^(!(|wire111)))) + wire76[(4'ha):(3'h6)]);
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire35;
  input wire [(4'hb):(1'h0)] wire34;
  input wire [(4'hd):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire36;
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  assign y = {wire56, wire55, wire52, wire36, reg54, (1'h0)};
  assign wire36 = ($signed($signed((wire32 ?
                      ((7'h41) ?
                          wire35 : (7'h42)) : wire31[(4'ha):(4'ha)]))) >>> {$signed(wire32[(4'h9):(3'h6)]),
                      $unsigned(((&wire31) + (&wire33)))});
  module37 #() modinst53 (wire52, clk, wire31, wire35, wire32, wire33);
  always
    @(posedge clk) begin
      reg54 <= (($unsigned(wire31) ?
              wire33[(1'h0):(1'h0)] : (($unsigned((7'h44)) == wire32) ?
                  wire35[(3'h7):(3'h4)] : (~|$signed(wire31)))) ?
          ((~|({(8'h9e)} ? wire31[(3'h7):(1'h0)] : $signed((8'haf)))) ?
              $unsigned((|$signed(wire36))) : $unsigned(wire52[(3'h5):(3'h4)])) : $unsigned((&$unsigned((wire36 >= (8'had))))));
    end
  assign wire55 = wire35[(3'h5):(2'h3)];
  assign wire56 = (((|$unsigned((wire34 ? wire55 : wire32))) ?
                      $signed(wire55) : {$signed($unsigned(wire32)),
                          $unsigned((~&wire32))}) == (wire34 > $unsigned({(wire34 ?
                          reg54 : (7'h41)),
                      (wire35 ^~ reg54)})));
endmodule

module module5
#(parameter param16 = ((+(~^(~^((8'hbf) ? (8'hbe) : (8'ha1))))) ? {(8'hb2), ({((8'had) ? (7'h44) : (8'hb0))} ? (!((8'haa) ? (7'h41) : (7'h44))) : ({(8'hbe), (8'haa)} | {(8'hb6)}))} : (!({((8'hb3) || (8'ha5))} < ((~|(7'h42)) <= ((8'ha0) ? (8'ha3) : (8'hbd)))))), 
parameter param17 = param16)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  assign y = {wire11, wire10, reg15, reg14, reg13, reg12, (1'h0)};
  assign wire10 = {((wire6 + $unsigned((wire7 | wire8))) ?
                          wire6[(3'h5):(2'h3)] : ({wire6} ?
                              wire7 : (((8'ha4) ?
                                  wire8 : wire8) ^ (wire8 ^~ wire7)))),
                      (wire6[(4'h9):(3'h4)] ?
                          {(wire8 ?
                                  ((8'hab) - wire9) : (~^wire8))} : (wire8 * ((~^(8'ha8)) & (+wire9))))};
  assign wire11 = wire10[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= wire11[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg13 <= $signed(wire9[(4'hb):(3'h7)]);
      reg14 <= wire11;
      reg15 <= reg12;
    end
endmodule

module module37
#(parameter param50 = ((-(((~&(8'h9f)) < ((8'hb5) >> (8'hae))) ? (((8'hb7) ^~ (8'hac)) ? ((7'h43) ? (8'h9e) : (8'haf)) : ((7'h42) ? (8'ha1) : (8'ha4))) : {(^(8'ha3))})) ? (~&((((8'ha0) ? (8'hb7) : (8'hb6)) ? ((8'hab) >= (8'hb5)) : (-(8'hb9))) ? (((8'haa) ? (8'hb0) : (8'hb4)) != ((8'ha2) >= (8'ha5))) : (((7'h41) - (8'hb3)) ? ((8'hbd) ? (8'hbf) : (8'hbf)) : {(8'ha7), (8'ha4)}))) : (({((7'h44) <= (8'ha4)), (8'ha2)} ~^ (-((8'ha0) << (8'hb7)))) | ((((8'haf) ? (8'ha7) : (8'h9f)) ^ (^(7'h42))) ? (((8'hab) + (8'hb1)) <= (7'h43)) : ((!(8'ha7)) ? (&(7'h44)) : ((8'ha3) << (8'hac)))))), 
parameter param51 = param50)
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire41;
  input wire [(4'ha):(1'h0)] wire40;
  input wire signed [(2'h2):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire43,
                 wire42,
                 reg49,
                 reg48,
                 reg47,
                 reg44,
                 (1'h0)};
  assign wire42 = ($unsigned(wire41[(3'h6):(3'h6)]) ?
                      (wire41 || wire39[(1'h1):(1'h0)]) : {(~&$unsigned($signed(wire38)))});
  assign wire43 = (wire40 == {wire41[(3'h6):(2'h2)],
                      $unsigned((~^$unsigned((8'ha3))))});
  always
    @(posedge clk) begin
      reg44 <= (wire41 ?
          ({(!$signed(wire41)),
              wire38[(4'h9):(3'h7)]} < {$signed($signed((8'ha0))),
              (~^{wire39})}) : (~$signed(($signed((8'hab)) * (&wire38)))));
    end
  assign wire45 = ((($unsigned((wire43 ?
                              wire40 : wire38)) << wire40[(4'h8):(3'h4)]) ?
                          wire42 : $signed((&wire41[(1'h0):(1'h0)]))) ?
                      (wire43 ?
                          (^wire40[(4'h8):(3'h5)]) : wire39[(2'h2):(1'h1)]) : $signed($signed(reg44[(3'h5):(3'h4)])));
  assign wire46 = $signed({(8'hb6)});
  always
    @(posedge clk) begin
      reg47 <= $signed((($signed({wire46}) ^~ wire46) ? wire39 : wire45));
      reg48 <= (|$signed(wire39));
      reg49 <= wire38;
    end
endmodule

module module98
#(parameter param110 = ((8'had) ? {(~^(((8'hb7) & (8'hb0)) ^~ ((8'haa) ? (8'ha1) : (8'hac))))} : {({((8'haf) > (7'h43)), ((8'hba) < (8'hb4))} ? {(~^(8'hb8))} : {((8'hb2) <= (8'hbb))}), {(((8'haf) && (8'h9e)) >> {(8'had)})}}))
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire102;
  input wire signed [(4'h9):(1'h0)] wire101;
  input wire [(4'hb):(1'h0)] wire100;
  input wire [(4'hc):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire103;
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire103,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire103 = $signed(wire99[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg104 <= (wire102[(1'h1):(1'h1)] ?
          $unsigned(($unsigned({wire99}) ~^ (wire102[(2'h3):(2'h2)] ^ wire103))) : $unsigned($signed($unsigned((wire99 >>> wire100)))));
      reg105 <= ((wire101[(3'h7):(2'h3)] ?
              wire103[(2'h2):(1'h0)] : wire99[(2'h3):(1'h0)]) ?
          wire103[(3'h4):(2'h3)] : $signed(((reg104 - $signed(wire101)) ?
              wire100[(1'h1):(1'h0)] : $signed($signed(wire103)))));
      reg106 <= ((~^reg104[(5'h12):(4'hb)]) ?
          wire99[(1'h0):(1'h0)] : $unsigned($unsigned((8'hbf))));
    end
  assign wire107 = reg106[(5'h12):(3'h6)];
  assign wire108 = ((&$signed($signed($signed(wire102)))) <= $signed((^(reg106[(3'h6):(1'h0)] ?
                       $signed(wire103) : reg105))));
  assign wire109 = reg104;
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire81;
  input wire signed [(5'h10):(1'h0)] wire80;
  input wire signed [(2'h2):(1'h0)] wire79;
  input wire [(2'h2):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg83,
                 reg82,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg82 <= wire81;
    end
  always
    @(posedge clk) begin
      reg83 <= (|(^~{(|$signed(wire81))}));
    end
  assign wire84 = reg83;
  assign wire85 = $unsigned(($unsigned(wire84[(3'h5):(2'h3)]) ?
                      (((~wire80) ? wire79[(1'h0):(1'h0)] : (wire84 | reg82)) ?
                          $unsigned({(8'hbf)}) : $unsigned($unsigned(reg83))) : wire84[(4'hb):(2'h3)]));
  assign wire86 = $signed((wire79[(1'h0):(1'h0)] && $unsigned($unsigned((^~wire81)))));
  assign wire87 = wire81;
  assign wire88 = wire86;
  assign wire89 = (($unsigned($unsigned((wire86 ? wire88 : wire78))) ?
                      $unsigned(reg83[(4'he):(1'h1)]) : (^~((wire81 | wire80) && $signed(wire79)))) & (wire88[(2'h2):(1'h1)] ?
                      {(wire87 ?
                              (wire86 ?
                                  wire80 : reg82) : ((8'hb1) << wire85))} : ((|(wire88 ?
                          wire88 : wire87)) > reg82)));
  always
    @(posedge clk) begin
      reg90 <= $unsigned(wire84);
      reg91 <= wire86;
      reg92 <= {($unsigned((wire86 ?
              (8'ha4) : wire80[(1'h1):(1'h1)])) << (|(reg91[(4'h8):(3'h5)] ?
              (-reg82) : wire86)))};
    end
  always
    @(posedge clk) begin
      if (reg83)
        begin
          reg93 <= $signed(reg90[(1'h1):(1'h1)]);
          reg94 <= reg91;
        end
      else
        begin
          if (wire79)
            begin
              reg93 <= $signed(reg92[(3'h6):(3'h6)]);
            end
          else
            begin
              reg93 <= ((wire81[(2'h2):(2'h2)] ?
                  $unsigned((8'haa)) : ((8'hab) <= {(reg92 * reg82),
                      wire86[(4'ha):(4'h9)]})) * (^~{(wire78 ?
                      wire79[(2'h2):(1'h1)] : (+wire79))}));
            end
          reg94 <= ($unsigned(wire89) - reg92[(3'h7):(3'h5)]);
        end
      reg95 <= $signed($signed(wire80));
    end
endmodule
