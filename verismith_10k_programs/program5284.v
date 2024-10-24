module top
#(parameter param115 = (~^(8'h9f)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire101;
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  assign y = {wire16,
                 wire5,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire101,
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
                 (1'h0)};
  assign wire5 = (|wire4);
  module6 #() modinst17 (.wire10(wire3), .wire11(wire2), .wire7(wire1), .clk(clk), .wire8(wire5), .wire9(wire0), .y(wire16));
  assign wire18 = $unsigned($unsigned((((wire4 ? wire3 : wire3) ?
                      (wire3 < wire4) : (wire0 & wire0)) || (8'ha4))));
  assign wire19 = wire16;
  assign wire20 = wire1;
  assign wire21 = $signed((^~$unsigned(((wire5 ~^ wire3) ?
                      $signed((8'hbf)) : (wire0 - wire16)))));
  assign wire22 = wire21[(3'h4):(2'h3)];
  assign wire23 = $signed(({$signed($unsigned(wire5)),
                      wire5} ^ (|$signed($signed(wire18)))));
  module24 #() modinst102 (.wire27(wire2), .wire29(wire20), .clk(clk), .wire28(wire3), .wire25(wire18), .wire26(wire4), .y(wire101));
  always
    @(posedge clk) begin
      reg103 <= (~&($signed($unsigned((wire0 ? wire3 : wire16))) ?
          (wire19 ? {$signed((8'hbc))} : (8'ha8)) : (wire21[(3'h7):(3'h5)] ?
              $unsigned($signed(wire23)) : $unsigned((wire2 * (8'hb6))))));
      if (((wire22 ~^ wire3[(2'h3):(1'h1)]) ?
          reg103[(1'h0):(1'h0)] : wire19[(3'h5):(1'h1)]))
        begin
          reg104 <= {reg103[(3'h6):(3'h5)], wire23[(2'h3):(1'h0)]};
        end
      else
        begin
          reg104 <= wire1[(3'h5):(3'h5)];
          reg105 <= reg103[(1'h1):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      if (reg104)
        begin
          reg106 <= $unsigned($unsigned((wire0 ?
              ((wire21 >>> wire23) ? (^wire22) : wire21) : ((~^wire1) ?
                  wire19 : (~(8'ha3))))));
          if (($unsigned((^$signed(wire101[(1'h0):(1'h0)]))) ?
              $signed(wire23) : (~|(((wire5 ? (8'ha5) : (8'hba)) ?
                      ((8'hbd) <<< wire21) : ((8'hb6) ? wire4 : reg106)) ?
                  {wire2[(3'h7):(3'h6)],
                      $signed(wire22)} : (!wire4[(2'h3):(1'h1)])))))
            begin
              reg107 <= wire101[(1'h1):(1'h0)];
              reg108 <= (~&(^~$unsigned($unsigned((~^wire2)))));
              reg109 <= {((~$signed(wire0[(3'h6):(3'h5)])) ?
                      $signed(wire0[(1'h1):(1'h1)]) : ((wire23 | $signed(reg103)) ?
                          $signed($unsigned(wire1)) : (wire20 ?
                              ((8'hb5) >> (8'hac)) : $signed(reg106))))};
              reg110 <= (~wire2[(3'h7):(2'h2)]);
            end
          else
            begin
              reg107 <= wire3;
              reg108 <= wire19[(3'h5):(3'h5)];
              reg109 <= $unsigned($signed($signed((reg108[(4'h9):(1'h1)] ?
                  ((8'h9e) ? wire3 : reg103) : (wire3 ? reg104 : wire3)))));
              reg110 <= wire4[(1'h1):(1'h1)];
              reg111 <= wire101[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg106 <= ({reg111[(2'h2):(2'h2)]} ? reg104[(2'h3):(2'h2)] : wire3);
          if ($signed(wire101))
            begin
              reg107 <= (wire5 ?
                  $unsigned((+wire16)) : ((8'ha9) ?
                      ((((8'ha7) ?
                          wire1 : wire22) << $signed(wire16)) || $unsigned(wire2)) : {wire0[(3'h4):(3'h4)],
                          wire0[(2'h2):(2'h2)]}));
              reg108 <= (~&$signed((reg104[(2'h3):(1'h0)] ?
                  {reg108} : $signed((reg109 ? reg109 : wire1)))));
              reg109 <= (^~{{$signed(wire101)}});
            end
          else
            begin
              reg107 <= (^(reg108 ?
                  ((-$unsigned(reg104)) >> (&(|wire1))) : $signed($signed($signed(wire1)))));
              reg108 <= $unsigned((|($unsigned($unsigned(wire0)) + $unsigned((8'ha0)))));
            end
          reg110 <= (($unsigned(reg111[(3'h5):(2'h2)]) ?
              $unsigned($unsigned(reg105)) : (((reg107 ? reg104 : reg105) ?
                  (reg107 ?
                      reg106 : wire23) : $unsigned(reg103)) == $unsigned(reg105[(3'h6):(3'h5)]))) ^~ $signed(wire23[(4'h8):(3'h5)]));
          reg111 <= ({wire20} ? reg110 : (reg110 & reg109));
          reg112 <= wire16[(1'h0):(1'h0)];
        end
      reg113 <= $signed($unsigned($unsigned(wire19)));
      reg114 <= (8'h9e);
    end
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire29;
  input wire [(5'h13):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  input wire [(3'h5):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire76;
  assign y = {wire100, wire98, wire79, wire78, wire76, (1'h0)};
  module30 #() modinst77 (wire76, clk, wire28, wire27, wire25, wire26);
  assign wire78 = {(|$signed(((wire25 ?
                          (8'h9d) : wire27) + $unsigned(wire76))))};
  assign wire79 = wire28;
  module80 #() modinst99 (wire98, clk, wire26, wire76, wire29, wire79);
  assign wire100 = $signed($unsigned(wire28[(2'h2):(1'h0)]));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  assign y = {wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = $signed($unsigned({$signed((wire7 ? wire9 : wire8)),
                      $signed(((8'hb9) ? wire11 : wire10))}));
  assign wire13 = ($signed($unsigned((-(8'ha6)))) >= {(~|(7'h42))});
  assign wire14 = ((!($unsigned(wire11[(3'h5):(2'h3)]) ?
                          $signed(((7'h44) ?
                              wire9 : wire7)) : (wire12[(1'h0):(1'h0)] || wire9))) ?
                      ($unsigned((wire11[(2'h2):(2'h2)] && ((8'had) ?
                          wire10 : wire11))) <<< $signed(wire13)) : wire9);
  assign wire15 = wire12[(4'h9):(4'h9)];
endmodule

module module80  (y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire84;
  input wire signed [(2'h3):(1'h0)] wire83;
  input wire [(4'hc):(1'h0)] wire82;
  input wire [(3'h6):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire94;
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire94,
                 reg95,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= (wire84 ~^ ((wire84 == $signed((wire84 ?
          wire81 : wire81))) == {(~&$signed(wire83)), (&$unsigned(wire83))}));
      reg86 <= reg85;
      reg87 <= $signed($unsigned(($signed({wire82}) >> wire81)));
      if ((7'h42))
        begin
          reg88 <= $signed({(({wire83} < (+wire84)) >>> (-(wire82 - reg86)))});
          if ((wire84[(1'h1):(1'h1)] ?
              wire81[(1'h1):(1'h0)] : ((&$unsigned((reg85 ~^ reg86))) ?
                  (($unsigned((8'h9f)) == (&wire82)) && (8'h9c)) : (|(reg85[(4'h9):(3'h4)] && $unsigned(reg85))))))
            begin
              reg89 <= (wire82 ?
                  (reg85 + $signed($signed((wire84 ?
                      wire82 : wire82)))) : ((reg88 ?
                      (|$signed(reg87)) : $unsigned({wire83,
                          wire84})) << reg85[(1'h0):(1'h0)]));
            end
          else
            begin
              reg89 <= (~^{$signed((reg89[(3'h4):(2'h2)] | {reg86})),
                  wire84[(2'h3):(1'h1)]});
              reg90 <= ($signed((reg87[(4'hb):(2'h2)] ^ wire81[(2'h2):(1'h1)])) * $unsigned({(7'h43)}));
            end
          reg91 <= $unsigned({reg89[(4'h9):(2'h3)], (8'haa)});
          reg92 <= ((($signed((reg87 ? reg88 : (8'hb6))) ?
                  $signed({reg90}) : $unsigned(reg87)) ?
              (reg88 ?
                  $unsigned((reg87 ?
                      wire83 : reg90)) : reg91) : ($signed($signed((8'hb8))) & $unsigned(((8'haa) << wire83)))) >>> wire82[(3'h5):(3'h5)]);
        end
      else
        begin
          reg88 <= ($signed($signed(reg86[(1'h1):(1'h0)])) ?
              ((reg92[(3'h4):(1'h1)] ^ $signed($signed(reg90))) ^~ (-{reg92[(1'h0):(1'h0)],
                  (wire84 | (8'ha6))})) : (reg92 ?
                  wire84 : $unsigned((|reg85[(4'hf):(4'he)]))));
          reg89 <= (^~($unsigned((~&(-(8'h9e)))) >> (reg91[(3'h6):(1'h1)] == $unsigned(wire83[(2'h2):(1'h0)]))));
        end
    end
  always
    @(posedge clk) begin
      reg93 <= (((wire83 < {$signed(reg90),
          {reg90}}) > $unsigned(reg87)) ^~ (reg91 && $unsigned(($signed(reg91) ?
          (~&(8'hb2)) : (-reg88)))));
    end
  assign wire94 = (~($unsigned(((~&reg89) == $unsigned(wire81))) ?
                      $signed($signed(wire83[(1'h1):(1'h1)])) : $unsigned(reg91)));
  always
    @(posedge clk) begin
      reg95 <= (((&$signed((wire81 ? wire94 : reg91))) ?
              (($unsigned(reg86) ? (wire94 ? wire83 : wire84) : (^wire82)) ?
                  $unsigned($unsigned(reg92)) : {{wire82},
                      reg86[(3'h4):(2'h3)]}) : $signed((~&(&wire84)))) ?
          ($signed($signed($signed(reg91))) ?
              ($unsigned((reg89 ?
                  reg93 : reg88)) <= reg88[(4'hf):(4'hd)]) : $unsigned(($unsigned(reg88) | reg89))) : (reg88 >>> ($unsigned(wire84) == (!(&reg87)))));
    end
  assign wire96 = (reg92[(4'h8):(3'h7)] ? {reg86} : wire82[(2'h2):(2'h2)]);
  assign wire97 = reg87[(4'hc):(4'ha)];
endmodule

module module30
#(parameter param74 = ({(+{((8'hbf) ? (8'h9c) : (8'hb4))}), ({((8'hbd) ~^ (7'h41)), (!(7'h44))} <<< (~&((8'hbc) ? (8'hb0) : (7'h43))))} ? {((!((8'ha2) || (8'h9c))) ? (7'h41) : (((8'hac) - (7'h42)) ? (&(8'ha5)) : ((8'hb9) ? (8'hbe) : (7'h42))))} : ({((+(7'h44)) ? {(8'ha8)} : ((8'hbe) > (8'hac)))} & (^((^(7'h40)) * ((8'ha9) << (8'hb9)))))), 
parameter param75 = (~&(^param74)))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire34;
  input wire [(3'h7):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire [(2'h2):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  assign y = {wire65,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg64,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire35 = $signed(($unsigned({$unsigned(wire31),
                      (wire34 ? wire34 : wire31)}) ^ ($unsigned((~^wire33)) ?
                      (wire32 - (8'ha4)) : {(!wire32)})));
  assign wire36 = (wire35[(3'h6):(1'h0)] ?
                      $signed($signed(((&wire35) <<< (wire34 >> wire31)))) : wire31[(1'h0):(1'h0)]);
  assign wire37 = ((~&(wire32 ?
                      (~$unsigned(wire31)) : (wire35[(1'h1):(1'h0)] <<< (wire32 ?
                          wire32 : wire36)))) - (((wire33 > wire36) << ($unsigned(wire36) ?
                      $signed(wire34) : wire32[(1'h1):(1'h0)])) ^ (-(-$signed((8'haa))))));
  assign wire38 = $unsigned((wire33 | {(8'hb7), wire35[(3'h7):(3'h6)]}));
  assign wire39 = {wire35, $unsigned(wire38[(4'h8):(2'h3)])};
  assign wire40 = {(wire37 < {wire38}), (|wire37)};
  assign wire41 = wire37[(3'h5):(3'h5)];
  assign wire42 = {{$signed($unsigned((+wire41)))},
                      ((~wire33) ?
                          (wire37[(3'h4):(3'h4)] ?
                              wire32[(2'h3):(2'h3)] : wire36[(4'ha):(1'h0)]) : $unsigned(wire36[(4'h9):(3'h7)]))};
  assign wire43 = $unsigned(wire40[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg44 <= $signed((!{wire33, (-(wire43 ? wire36 : (8'ha1)))}));
      reg45 <= wire32[(3'h4):(2'h2)];
      reg46 <= ($signed({($signed((8'hba)) - (+wire31)),
              (reg45[(2'h3):(1'h1)] ~^ (wire36 ^~ wire34))}) ?
          $signed(($unsigned($unsigned(wire39)) == $unsigned((8'ha4)))) : $signed(($signed({wire31,
                  wire41}) ?
              reg44[(1'h0):(1'h0)] : (~|wire31))));
      reg47 <= $signed(wire41[(5'h10):(5'h10)]);
    end
  always
    @(posedge clk) begin
      if ((wire34 ?
          (-$unsigned($unsigned((reg46 ?
              wire42 : (8'hae))))) : $unsigned((^(((8'h9f) >= wire36) * wire32)))))
        begin
          reg48 <= reg45[(3'h5):(1'h1)];
          reg49 <= $signed(reg46);
        end
      else
        begin
          reg48 <= $signed((-wire38[(3'h5):(2'h3)]));
          reg49 <= $signed((+(((wire32 ^ wire35) ? $signed(wire42) : wire42) ?
              (~&(wire32 ? reg44 : (8'hbd))) : $signed((8'hab)))));
          if ((~(reg45 ?
              $signed({(reg46 ? reg47 : wire33),
                  wire41}) : $signed(wire33[(3'h4):(3'h4)]))))
            begin
              reg50 <= (8'hbb);
              reg51 <= {(~&$unsigned($signed(reg49[(2'h3):(2'h2)])))};
              reg52 <= ($unsigned(reg47) ?
                  ($signed($signed($unsigned((8'had)))) < $signed($signed(reg49))) : reg45);
            end
          else
            begin
              reg50 <= (~(7'h44));
              reg51 <= reg47[(4'ha):(1'h1)];
            end
          reg53 <= (+wire39);
        end
      reg54 <= wire32[(1'h1):(1'h0)];
      reg55 <= (!($unsigned($signed(reg48[(4'hc):(4'hb)])) ?
          ((!{wire41, reg50}) | reg54[(2'h2):(2'h2)]) : wire41[(2'h3):(2'h3)]));
    end
  assign wire56 = wire33;
  assign wire57 = (reg54 ?
                      $unsigned($unsigned(wire40[(1'h1):(1'h0)])) : (^$unsigned((reg53[(3'h6):(3'h4)] | $signed(reg50)))));
  assign wire58 = (8'haa);
  assign wire59 = ($unsigned(wire36[(3'h5):(2'h3)]) ^~ $unsigned((|wire58)));
  assign wire60 = reg50[(3'h5):(1'h0)];
  assign wire61 = $unsigned(((((~|(8'hae)) - (wire35 >> (7'h44))) ?
                          $unsigned($unsigned(wire42)) : {$unsigned(reg47),
                              wire37[(1'h0):(1'h0)]}) ?
                      (((wire57 == wire56) & $signed(reg44)) == $signed(reg45[(3'h7):(1'h1)])) : $unsigned($unsigned((+wire33)))));
  assign wire62 = ($signed($signed($unsigned($unsigned((8'h9e))))) && (reg44[(3'h7):(3'h4)] >>> (wire39[(1'h0):(1'h0)] ?
                      wire58 : $unsigned(wire57))));
  assign wire63 = {$unsigned($unsigned(($unsigned(wire33) << (7'h40))))};
  always
    @(posedge clk) begin
      reg64 <= reg45[(1'h1):(1'h0)];
    end
  assign wire65 = (8'ha1);
  always
    @(posedge clk) begin
      if ((reg47 >= reg44[(2'h2):(1'h1)]))
        begin
          if (reg47[(4'hd):(4'hd)])
            begin
              reg66 <= ({(wire63[(4'hf):(1'h0)] != $unsigned(reg46))} ~^ $signed($signed((~|wire34[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg66 <= ((($unsigned({reg52}) ?
                          wire61 : ($unsigned(reg46) ?
                              (&wire59) : ((8'ha8) ? reg64 : wire35))) ?
                      $signed(reg44[(4'hc):(4'h9)]) : $unsigned((^~reg48[(2'h3):(2'h2)]))) ?
                  (8'haa) : {(wire40 ? wire61 : reg54[(2'h2):(2'h2)])});
              reg67 <= (~^(($unsigned((~reg48)) ?
                      (+(reg47 ? (8'hb4) : wire61)) : (~(wire31 ?
                          reg53 : wire39))) ?
                  {wire39} : $unsigned(wire59[(3'h5):(2'h3)])));
            end
          reg68 <= wire35[(3'h7):(3'h5)];
          reg69 <= (|(wire39[(1'h0):(1'h0)] | (($unsigned(wire40) >>> $signed(wire40)) - (wire41[(5'h11):(4'h8)] << $signed(wire62)))));
        end
      else
        begin
          reg66 <= {(~&($unsigned($unsigned(wire39)) && (~^$unsigned(wire31))))};
          reg67 <= $signed({reg66[(1'h0):(1'h0)]});
          reg68 <= ((($unsigned(wire58[(4'hb):(3'h6)]) >>> reg66[(3'h7):(1'h0)]) ?
                  $unsigned((8'ha3)) : (+$signed($signed(reg66)))) ?
              $unsigned({(wire40 ? ((8'ha5) > wire61) : $signed(wire39)),
                  (~|((8'hb0) < wire42))}) : ((((&wire56) & reg49) != (~((8'hbc) ?
                  wire31 : wire36))) - wire56[(1'h0):(1'h0)]));
          if (({($unsigned((&reg53)) ?
                  (8'hbf) : reg51)} >>> $signed(wire39[(1'h0):(1'h0)])))
            begin
              reg69 <= wire39;
              reg70 <= ((({wire43} ?
                  (~reg50) : ({wire38, reg52} ?
                      (wire56 ?
                          (8'hba) : wire40) : (8'hb8))) && reg54[(2'h2):(1'h0)]) >= $signed($signed({reg69})));
              reg71 <= (&{$unsigned(reg70)});
              reg72 <= (&wire56[(1'h1):(1'h0)]);
              reg73 <= (reg46[(5'h10):(4'hb)] ?
                  {reg67,
                      (reg52[(2'h3):(1'h1)] ^ wire39[(2'h3):(2'h3)])} : $unsigned((~wire60[(3'h7):(3'h4)])));
            end
          else
            begin
              reg69 <= (((8'ha8) ? reg45[(4'h8):(4'h8)] : wire60) ?
                  wire36 : wire34[(1'h0):(1'h0)]);
              reg70 <= reg64[(4'hc):(2'h3)];
              reg71 <= $signed({($signed($signed(reg66)) - $unsigned($signed((8'ha7)))),
                  reg72[(2'h3):(2'h3)]});
              reg72 <= {(((wire56 >>> reg45[(4'hc):(3'h6)]) | (~(^reg47))) ?
                      ($signed($signed((8'hb1))) < $signed({(8'ha2)})) : {(8'ha8),
                          reg67}),
                  wire60};
            end
        end
    end
endmodule
