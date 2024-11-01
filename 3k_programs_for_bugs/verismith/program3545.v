module top
#(parameter param111 = (^(+{(((8'ha3) == (8'hb7)) << (^~(8'hac))), (((8'hab) ? (8'ha3) : (8'ha6)) ? ((8'hae) ? (8'ha0) : (8'hb1)) : ((8'hae) >>> (8'ha4)))})), 
parameter param112 = (param111 ? param111 : {param111}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  assign y = {wire110,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg109,
                 reg108,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire5 = (~&(~^$unsigned({(wire3 == wire2), $signed(wire2)})));
  assign wire6 = wire3;
  assign wire7 = wire3[(3'h6):(2'h2)];
  assign wire8 = (~^((8'hbd) ? wire1[(3'h5):(1'h0)] : wire6));
  assign wire9 = $signed(($unsigned($unsigned(wire6[(4'h9):(3'h5)])) * (($signed(wire3) ?
                     wire5[(3'h7):(3'h6)] : wire4) * (wire8 ?
                     (7'h44) : wire3))));
  module10 #() modinst83 (.wire14(wire5), .clk(clk), .y(wire82), .wire12(wire7), .wire11(wire1), .wire13(wire9));
  assign wire84 = $unsigned(($unsigned(wire5[(5'h10):(4'h9)]) | wire8[(2'h2):(1'h1)]));
  assign wire85 = (wire9[(4'hb):(2'h3)] ?
                      (wire0[(1'h1):(1'h0)] | $unsigned($signed((+wire8)))) : (({$signed(wire5),
                              wire2[(4'h9):(3'h7)]} || $signed(((8'hb1) ^ wire8))) ?
                          (wire2 >> ((8'hae) <<< (wire8 >>> wire5))) : $unsigned(wire3)));
  assign wire86 = $signed($unsigned(wire1));
  assign wire87 = (~&(wire1 ?
                      wire6[(1'h0):(1'h0)] : $unsigned($unsigned($unsigned(wire0)))));
  assign wire88 = ($signed($signed((8'ha9))) ?
                      (8'ha0) : (|$unsigned(((8'hb0) ?
                          (8'ha2) : $unsigned(wire82)))));
  assign wire89 = $unsigned($signed(wire88[(1'h0):(1'h0)]));
  assign wire90 = (wire84[(1'h0):(1'h0)] ?
                      $signed((^~(-(wire3 ?
                          wire89 : (8'ha7))))) : (wire84[(3'h4):(3'h4)] ?
                          {(&wire0)} : $unsigned({((8'hbf) ?
                                  (8'hbb) : wire82)})));
  assign wire91 = ($unsigned(($signed((8'haa)) - wire3)) | wire1);
  always
    @(posedge clk) begin
      if ((~({({(8'hae)} ?
              (wire1 != wire84) : wire87[(2'h2):(1'h0)])} || (~|(^$signed(wire91))))))
        begin
          reg92 <= wire86;
          reg93 <= wire90[(1'h0):(1'h0)];
          reg94 <= (8'ha4);
          reg95 <= wire85;
          reg96 <= $signed((($unsigned((wire7 > wire0)) - $signed((~wire4))) << $signed((wire9 > (wire4 ?
              wire6 : wire87)))));
        end
      else
        begin
          if ((({(wire9[(4'ha):(2'h3)] ? {wire88, wire7} : wire7),
                  (-$signed(wire85))} <<< reg94[(4'ha):(3'h4)]) ?
              wire88 : wire8))
            begin
              reg92 <= (reg92 ?
                  wire1 : (wire91[(1'h1):(1'h1)] ? {(&(~&wire9))} : reg92));
              reg93 <= (|$signed(wire9));
            end
          else
            begin
              reg92 <= (($signed(($unsigned(wire85) ?
                      wire87[(4'ha):(3'h7)] : {wire6, wire86})) ?
                  ($signed(wire5[(2'h3):(1'h1)]) + wire2[(1'h1):(1'h1)]) : ($signed(wire89[(4'hd):(3'h6)]) | (-(wire84 ?
                      (8'hbe) : wire90)))) >>> $signed((wire84 && ((wire86 < wire5) ?
                  (8'had) : ((8'h9d) ? (8'h9d) : reg95)))));
              reg93 <= reg94[(4'h9):(2'h3)];
              reg94 <= wire89;
              reg95 <= (reg96[(1'h1):(1'h1)] ?
                  wire82 : $unsigned((wire87[(4'hd):(4'hd)] & wire6[(1'h1):(1'h1)])));
              reg96 <= $signed((reg92[(1'h0):(1'h0)] && reg94[(3'h7):(2'h2)]));
            end
          reg97 <= ((~&(~&(~^reg95))) ?
              reg96[(2'h3):(1'h0)] : $signed((^~wire7[(3'h4):(1'h0)])));
          reg98 <= $signed({$unsigned(wire90)});
          if (wire1[(2'h2):(1'h1)])
            begin
              reg99 <= wire85[(2'h3):(1'h1)];
              reg100 <= $signed({(((7'h41) << $signed(reg98)) && $unsigned($signed(wire0))),
                  wire88[(1'h0):(1'h0)]});
              reg101 <= ((($signed((reg93 && wire1)) && {$unsigned(wire2)}) ^~ $unsigned(reg100)) ^~ $unsigned((!wire3[(3'h5):(3'h5)])));
              reg102 <= wire1;
              reg103 <= ((8'had) ?
                  $unsigned(wire5[(4'hd):(4'h8)]) : reg97[(1'h0):(1'h0)]);
            end
          else
            begin
              reg99 <= ($unsigned((~^(wire6[(2'h3):(1'h1)] == $signed(reg98)))) < wire86[(4'ha):(3'h4)]);
              reg100 <= (^~wire88[(1'h0):(1'h0)]);
              reg101 <= reg97;
              reg102 <= {({(~^((8'hb3) ? reg97 : wire0))} ?
                      {$signed($signed(wire91)),
                          wire6} : ((8'ha5) ^~ $signed((+wire5)))),
                  (~|(reg94 <= ($signed(reg101) ?
                      (wire9 ? (8'haf) : (8'hb1)) : (wire3 > reg102))))};
            end
        end
      reg104 <= $signed((^~$unsigned($signed((reg96 ^~ reg98)))));
      reg105 <= $unsigned({reg95});
    end
  always
    @(posedge clk) begin
      reg106 <= (($signed($unsigned((8'hae))) >= (reg93 ^ reg99[(3'h6):(1'h0)])) ?
          reg93[(1'h1):(1'h1)] : reg103[(3'h5):(1'h0)]);
      reg107 <= (reg106[(2'h3):(2'h3)] ?
          (~$signed((|{wire85}))) : reg99[(1'h1):(1'h0)]);
      if ($signed(wire7))
        begin
          reg108 <= $signed(reg94);
        end
      else
        begin
          reg108 <= (($signed(wire3) * (|$unsigned(wire85[(4'h8):(1'h1)]))) ?
              (($unsigned($unsigned(wire4)) ?
                  $signed((wire7 ? reg103 : wire87)) : ($unsigned(wire7) ?
                      $signed(reg96) : (wire4 ?
                          wire86 : reg98))) ^ ((!wire1[(4'hf):(3'h5)]) ?
                  $signed(reg103) : $unsigned(wire84))) : $signed(($signed((wire82 | wire90)) ^~ {$signed(wire8),
                  $unsigned(reg100)})));
        end
      reg109 <= ((~^$unsigned(reg101[(3'h4):(2'h3)])) != wire2);
    end
  assign wire110 = $signed($unsigned(reg104[(3'h6):(1'h1)]));
endmodule

module module10
#(parameter param81 = (((8'hae) << (!(-((8'hb1) > (8'had))))) ? (8'hbc) : (7'h44)))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire51;
  assign y = {wire80,
                 wire78,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire51,
                 (1'h0)};
  assign wire15 = ((({{wire11}} ?
                      (+((8'hbe) <<< wire14)) : $signed($unsigned(wire14))) == ($signed((&wire13)) | (^~(wire13 ^ wire13)))) * {$unsigned((~&wire12)),
                      $unsigned((wire12[(4'hc):(1'h0)] ~^ wire13))});
  assign wire16 = $signed($signed((~^($unsigned(wire12) ~^ (wire14 < wire13)))));
  assign wire17 = (!(|(&wire15)));
  assign wire18 = $signed(wire16[(3'h5):(2'h3)]);
  assign wire19 = wire12[(1'h0):(1'h0)];
  assign wire20 = ($signed(wire19) ? wire17[(1'h1):(1'h1)] : (8'ha4));
  assign wire21 = $signed(wire17);
  assign wire22 = $signed(($signed(wire15) ?
                      (((~|wire12) ?
                          $unsigned(wire12) : wire18[(3'h4):(2'h3)]) <= (wire11 <= (wire16 << wire15))) : $signed((!(wire19 * wire19)))));
  module23 #() modinst52 (.wire25(wire11), .clk(clk), .y(wire51), .wire27(wire20), .wire26(wire14), .wire28(wire21), .wire24(wire19));
  module53 #() modinst79 (.wire56(wire18), .y(wire78), .wire55(wire19), .clk(clk), .wire54(wire13), .wire57(wire51));
  assign wire80 = $signed((($signed(wire11[(3'h6):(3'h6)]) > (wire19[(5'h14):(4'h8)] & (~wire12))) + wire14));
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire57;
  input wire signed [(5'h11):(1'h0)] wire56;
  input wire signed [(5'h11):(1'h0)] wire55;
  input wire [(4'hb):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  assign y = {wire77,
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
                 wire65,
                 wire64,
                 wire63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg58 <= (~^$unsigned(wire54[(4'h9):(3'h5)]));
      if ($signed(wire54))
        begin
          reg59 <= ((~|wire56) ?
              {$unsigned(($unsigned(wire56) ? $signed(reg58) : wire57)),
                  wire56} : {wire57[(3'h4):(2'h3)],
                  $signed($signed($signed(wire56)))});
          reg60 <= reg58;
          reg61 <= $unsigned($signed(($signed(((8'ha2) ?
              (7'h43) : reg58)) <<< {{wire54}, $unsigned(wire55)})));
        end
      else
        begin
          reg59 <= ((~|reg59[(2'h2):(2'h2)]) ?
              wire56 : $unsigned(($signed((8'hb6)) | wire54[(3'h4):(3'h4)])));
        end
      reg62 <= $signed(wire56[(5'h10):(1'h1)]);
    end
  assign wire63 = (&(|(~^$signed(reg62[(3'h6):(1'h0)]))));
  assign wire64 = ((+$unsigned((&(wire57 ^ reg61)))) <<< $unsigned($signed($signed($unsigned(reg59)))));
  assign wire65 = $unsigned($signed($unsigned((8'hae))));
  assign wire66 = wire57;
  assign wire67 = ((-$unsigned(((8'ha8) ?
                      wire57 : $signed(reg62)))) <<< (wire56[(5'h11):(4'ha)] | ((^~(wire66 | wire66)) ^~ reg61)));
  assign wire68 = ((^~($signed($unsigned(reg62)) ?
                      ((&wire64) >> reg61[(3'h7):(3'h6)]) : $signed((wire63 >= wire66)))) == $unsigned(((!{wire63}) ?
                      ($signed((8'hbb)) ?
                          (reg62 < wire55) : (reg58 ?
                              wire67 : wire55)) : {reg60})));
  assign wire69 = (~&($signed($unsigned((reg59 ?
                      wire55 : wire55))) > ($unsigned(wire63[(2'h3):(2'h2)]) + wire57)));
  assign wire70 = wire66[(3'h4):(2'h2)];
  assign wire71 = $signed((~((wire69 == reg60) ?
                      (8'ha2) : $unsigned((wire70 != reg62)))));
  assign wire72 = {$signed(wire55[(4'he):(1'h0)])};
  assign wire73 = ($signed($unsigned($unsigned((7'h44)))) + wire63);
  assign wire74 = (~^wire55[(4'hb):(4'ha)]);
  assign wire75 = wire57[(2'h2):(2'h2)];
  assign wire76 = (~|((wire73[(4'h8):(3'h7)] || $unsigned((|wire64))) ?
                      wire68 : (8'hab)));
  assign wire77 = (~$signed($signed(({wire56, wire54} ?
                      (^~(8'hb3)) : (wire73 ^~ wire63)))));
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg47,
                 reg46,
                 reg45,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire29 = {wire26[(1'h0):(1'h0)]};
  assign wire30 = wire24;
  assign wire31 = (-((^~wire26) ?
                      (-{$signed(wire30)}) : wire26[(2'h2):(2'h2)]));
  assign wire32 = $signed(((wire29[(2'h2):(1'h0)] - (wire25 ?
                      $signed((8'ha9)) : $unsigned(wire27))) ~^ $signed(($unsigned(wire30) <= ((8'h9d) >>> wire29)))));
  always
    @(posedge clk) begin
      reg33 <= ({(^wire30)} ?
          wire25[(5'h12):(3'h6)] : $signed($unsigned(($signed((8'ha5)) ?
              (wire32 ? wire31 : wire25) : (wire32 ~^ wire25)))));
      reg34 <= $unsigned((~|wire26[(3'h4):(1'h1)]));
    end
  assign wire35 = {$signed(wire32)};
  assign wire36 = $unsigned({$signed(reg34), wire31});
  assign wire37 = (reg33 >> $signed((~reg34)));
  assign wire38 = $signed(((^~wire24) + wire30));
  assign wire39 = $signed((-(~^wire36)));
  assign wire40 = (~|reg34[(4'hb):(1'h1)]);
  assign wire41 = (+(&wire29));
  assign wire42 = wire39[(3'h7):(2'h2)];
  assign wire43 = $signed($unsigned(((^(^~wire27)) <= wire41[(5'h11):(1'h0)])));
  assign wire44 = {((^(wire39[(4'hc):(3'h6)] <= $unsigned(wire39))) <<< ((!$signed(wire41)) ?
                          (wire31[(1'h1):(1'h0)] <<< (wire32 ?
                              wire27 : (8'hae))) : wire29)),
                      $unsigned($unsigned({wire42, $unsigned(reg33)}))};
  always
    @(posedge clk) begin
      reg45 <= ({$signed(wire27), wire30} ?
          ($unsigned($unsigned($unsigned(wire43))) ?
              wire29[(2'h2):(2'h2)] : (~&{(+wire42),
                  (reg34 | reg33)})) : ({$signed($unsigned(wire28))} ?
              wire29 : (reg34 ? wire35 : wire37)));
      reg46 <= wire28[(3'h7):(3'h4)];
      reg47 <= (&$signed({wire41[(2'h3):(1'h1)]}));
    end
  assign wire48 = $unsigned((|$unsigned(((wire35 ^~ wire35) * wire40))));
  assign wire49 = $unsigned((wire29[(1'h0):(1'h0)] ?
                      (~&(wire31 < wire37[(4'h8):(3'h4)])) : (~^($unsigned(wire31) ?
                          (wire41 & wire32) : wire27[(1'h1):(1'h0)]))));
  assign wire50 = ((|$signed((|wire48[(4'hd):(4'ha)]))) ?
                      ((($signed(wire36) + wire30[(4'hb):(2'h2)]) == $signed(reg46)) <= (wire49[(3'h4):(1'h0)] ^ $signed(wire48))) : $signed(wire24));
endmodule
