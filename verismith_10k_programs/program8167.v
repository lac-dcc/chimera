module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire91;
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  assign y = {wire111,
                 wire91,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg110,
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
                 (1'h0)};
  module5 #() modinst92 (.clk(clk), .wire10(wire3), .wire8(wire4), .wire7(wire0), .y(wire91), .wire9(wire1), .wire6(wire2));
  always
    @(posedge clk) begin
      reg93 <= wire0[(2'h2):(2'h2)];
      reg94 <= (wire3[(4'hb):(3'h6)] & $unsigned(((~&$signed(wire4)) ?
          wire91[(2'h2):(2'h2)] : (^(|wire4)))));
      if ((($signed((~^wire3)) == wire2) ? reg94 : wire4[(4'he):(3'h5)]))
        begin
          reg95 <= $signed($unsigned((-($unsigned(wire91) << $unsigned(wire3)))));
          reg96 <= $unsigned((|{$signed((~wire1)), (8'hbb)}));
          reg97 <= wire2[(5'h10):(2'h3)];
        end
      else
        begin
          reg95 <= {(~^wire2[(5'h12):(1'h0)])};
          if (reg94[(1'h1):(1'h0)])
            begin
              reg96 <= reg95[(3'h6):(3'h5)];
              reg97 <= wire1[(2'h3):(1'h1)];
              reg98 <= reg95;
              reg99 <= (($signed(($signed(reg96) ?
                  (~^wire1) : (reg98 ?
                      reg93 : wire4))) != (reg95[(4'h8):(1'h0)] ?
                  ((reg96 >= wire91) ?
                      $unsigned((8'ha7)) : {wire1}) : (reg93[(5'h10):(1'h0)] & ((8'ha0) ?
                      wire3 : wire91)))) <<< (($unsigned((wire1 ?
                          (8'hb8) : reg95)) ?
                      (((8'ha9) << reg96) | (&reg93)) : {(wire4 & (8'hb3)),
                          {reg93}}) ?
                  {(8'hbb)} : reg93));
              reg100 <= (!($signed({wire91, (wire1 ? wire91 : wire91)}) ?
                  (($signed(reg98) ? (^reg95) : (wire4 & wire91)) ?
                      $unsigned((wire1 ?
                          reg95 : (8'ha3))) : reg99[(4'h8):(1'h0)]) : wire3));
            end
          else
            begin
              reg96 <= (8'hb0);
              reg97 <= ($unsigned(reg93[(4'hd):(3'h5)]) ?
                  (|(-reg96)) : $signed(($signed(wire4[(4'h9):(4'h8)]) ?
                      wire91 : reg97[(2'h2):(1'h0)])));
              reg98 <= reg96[(2'h3):(2'h2)];
            end
          if ((+$unsigned({((8'hb2) > (reg94 > wire2))})))
            begin
              reg101 <= wire2[(4'hd):(3'h5)];
              reg102 <= $signed((&{reg94, wire3[(3'h6):(1'h1)]}));
              reg103 <= $unsigned($signed(($unsigned($unsigned(reg94)) < wire2[(3'h4):(1'h0)])));
              reg104 <= $signed((~^$signed(((reg103 < wire0) ?
                  (!(8'ha0)) : ((8'ha7) || reg94)))));
              reg105 <= reg103;
            end
          else
            begin
              reg101 <= wire4;
              reg102 <= $unsigned((~|reg103[(3'h6):(1'h1)]));
            end
          reg106 <= reg93;
          reg107 <= (+$unsigned($signed(((reg101 >>> wire4) | {reg102}))));
        end
    end
  always
    @(posedge clk) begin
      reg108 <= reg95[(4'h8):(1'h1)];
      reg109 <= (reg105[(3'h4):(2'h2)] ^ $signed(reg96));
      reg110 <= ($signed(reg105[(4'he):(1'h1)]) + $unsigned(({(reg108 ?
                  wire0 : (8'hb6))} ?
          reg104 : ((reg96 ? wire1 : wire1) != (reg109 ? wire3 : reg100)))));
    end
  assign wire111 = reg109[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg112 <= wire111;
      if ({((~|($unsigned(wire91) >>> $unsigned(reg99))) || reg105),
          reg110[(4'h9):(3'h7)]})
        begin
          if (($unsigned(($unsigned(wire2) ^ reg102[(4'h8):(1'h0)])) & (reg110 ?
              (reg99 ?
                  ((wire3 << reg97) ?
                      ((8'ha6) ?
                          wire111 : (8'hb3)) : $signed((8'haa))) : (8'haa)) : wire0[(3'h6):(3'h4)])))
            begin
              reg113 <= $signed(wire2[(2'h3):(1'h1)]);
            end
          else
            begin
              reg113 <= ((wire91[(2'h2):(1'h1)] ^ (reg104 >>> ($unsigned(reg109) <= (!wire2)))) ?
                  (!(!$unsigned($unsigned(reg101)))) : ((~{(^wire0)}) - ((&((8'ha8) > reg93)) ?
                      ((reg101 > reg103) >>> $unsigned(reg104)) : reg109)));
              reg114 <= reg101;
              reg115 <= (!$unsigned((~|$unsigned({wire91, wire2}))));
              reg116 <= wire4[(5'h10):(3'h6)];
            end
          reg117 <= ({$signed($signed(wire1[(4'hf):(1'h0)]))} ?
              $signed(({{reg104, reg109},
                  (reg116 ? reg113 : reg113)} >= {$signed(reg114),
                  wire111[(3'h4):(3'h4)]})) : $unsigned(((wire1 ~^ $signed(reg115)) ?
                  reg103[(3'h4):(2'h3)] : wire0)));
        end
      else
        begin
          reg113 <= {$unsigned(reg113)};
        end
      reg118 <= reg115[(1'h1):(1'h1)];
    end
endmodule

module module5
#(parameter param90 = ((((((8'h9d) >> (8'hb9)) ? ((8'hbd) >> (8'ha6)) : ((8'hac) ? (8'ha9) : (8'hb9))) ^~ (8'ha9)) - (8'ha2)) >>> (|((8'hbe) ? (((8'hbf) ? (8'hb4) : (7'h42)) ? (~&(8'haa)) : (8'hbc)) : (~&((8'ha7) ? (8'haa) : (8'hb4)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire12;
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  assign y = {wire89,
                 wire86,
                 wire85,
                 wire81,
                 wire80,
                 wire78,
                 wire35,
                 wire33,
                 wire12,
                 reg88,
                 reg87,
                 reg84,
                 reg83,
                 reg82,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire8;
    end
  assign wire12 = $signed($unsigned(wire9));
  module13 #() modinst34 (.wire16(wire6), .wire15(wire8), .wire14(wire9), .y(wire33), .clk(clk), .wire17(wire10));
  assign wire35 = (($unsigned(wire12) == wire8[(4'hb):(3'h6)]) ?
                      ($unsigned($unsigned((+wire10))) - $signed($signed($unsigned(wire9)))) : {reg11[(3'h5):(3'h4)],
                          (!(+(wire9 != reg11)))});
  module36 #() modinst79 (.y(wire78), .wire40(reg11), .wire38(wire10), .wire39(wire6), .wire37(wire8), .clk(clk), .wire41(wire9));
  assign wire80 = (wire33 ? wire35[(1'h0):(1'h0)] : wire12);
  assign wire81 = ($unsigned($unsigned({(^(8'hbc)), wire35})) ?
                      ($unsigned($unsigned($signed(wire8))) << $unsigned((-wire78))) : {wire10});
  always
    @(posedge clk) begin
      reg82 <= ((^(wire33 ?
          ((wire35 ?
              wire12 : wire78) + (wire35 * (7'h44))) : ($unsigned(wire10) ?
              $unsigned(wire78) : ((8'ha3) < wire35)))) >= $unsigned((^~$signed(wire9))));
      reg83 <= wire80;
      reg84 <= wire33[(1'h1):(1'h0)];
    end
  assign wire85 = (wire12 ?
                      $signed($unsigned((wire8[(1'h1):(1'h1)] ?
                          ((8'h9f) ? wire78 : (8'h9e)) : (wire12 ?
                              wire33 : wire6)))) : (+$signed((((8'hab) ?
                              wire33 : wire35) ?
                          $unsigned(wire35) : reg11[(1'h1):(1'h0)]))));
  assign wire86 = wire85[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg87 <= wire86[(1'h0):(1'h0)];
      reg88 <= $unsigned(($unsigned(wire6) ?
          ($signed(((8'h9c) ? (8'hbe) : wire10)) ?
              (((8'haa) ? wire10 : (7'h40)) ?
                  (wire80 ^~ wire10) : (reg82 ^~ wire8)) : $signed((reg11 >>> wire9))) : (~$unsigned((^~(8'h9f))))));
    end
  assign wire89 = $signed({$signed($unsigned({wire9}))});
endmodule

module module36
#(parameter param76 = (((((^(8'h9e)) ? ((8'hbb) ? (7'h40) : (8'h9f)) : (^~(8'hac))) + ({(7'h43), (8'ha4)} >= ((8'hb7) <= (8'hb0)))) || (+(~|(8'hbc)))) * (((^~((8'haa) <= (8'hb3))) <<< (((8'ha0) >>> (8'ha6)) ? ((8'hbe) >>> (8'hb8)) : ((8'ha4) * (8'ha9)))) ? ({((8'ha2) ? (7'h41) : (8'ha3))} ? (!((8'ha5) == (8'ha4))) : (((8'h9f) ? (8'hb3) : (8'hb4)) > {(8'haa), (8'hbd)})) : ((~&((8'h9e) ? (7'h42) : (8'ha2))) ? ((-(8'haf)) ? ((8'h9f) & (8'ha8)) : (~(8'hb4))) : (((8'hab) >> (8'ha4)) < ((8'hbc) ? (8'ha4) : (8'haa)))))), 
parameter param77 = {((((^param76) ? param76 : param76) ? param76 : ((param76 ? param76 : param76) ^~ param76)) + (~^(8'hb1))), param76})
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire41;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire [(3'h7):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg61,
                 reg60,
                 reg59,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg42 <= {wire37};
      reg43 <= wire40[(2'h3):(2'h2)];
      reg44 <= wire39[(3'h5):(1'h1)];
      if (reg42[(3'h5):(3'h5)])
        begin
          reg45 <= reg43[(2'h2):(1'h1)];
          reg46 <= (|wire39[(3'h6):(2'h2)]);
        end
      else
        begin
          if (reg44[(3'h7):(1'h1)])
            begin
              reg45 <= (wire40[(1'h0):(1'h0)] ^ (8'hbf));
            end
          else
            begin
              reg45 <= (reg43 != $unsigned((({wire38,
                      reg44} + reg45[(4'h9):(4'h9)]) ?
                  wire38[(1'h0):(1'h0)] : (~&$signed((8'hb5))))));
              reg46 <= ({{wire38[(2'h3):(1'h0)], (+$signed(reg46))}} ?
                  ((wire40 > $unsigned($signed(wire39))) && (-reg44[(3'h6):(3'h6)])) : {$signed($unsigned(((8'ha5) ^~ reg42))),
                      reg42});
            end
          reg47 <= $unsigned($signed(($unsigned(wire41[(4'h9):(1'h1)]) | (reg46 ?
              (8'hbd) : ((8'haa) && reg42)))));
          reg48 <= $unsigned($unsigned((^~{$unsigned((7'h40))})));
          reg49 <= (reg48[(1'h1):(1'h0)] ?
              $unsigned((&reg46)) : $signed((wire39 ?
                  ((reg42 < wire40) ?
                      (reg43 ?
                          wire41 : wire40) : wire37[(3'h7):(1'h1)]) : $unsigned({wire38,
                      reg46}))));
        end
    end
  assign wire50 = wire39;
  assign wire51 = ($signed(({(~&wire37), ((8'hbc) > reg49)} ?
                      ($signed(reg46) && $unsigned(wire39)) : reg46[(1'h1):(1'h0)])) <<< $unsigned($unsigned((wire40 ?
                      reg42[(4'hc):(3'h7)] : {(8'hb2), wire38}))));
  assign wire52 = ((7'h40) <<< reg44);
  assign wire53 = reg49[(1'h1):(1'h1)];
  assign wire54 = (-wire39[(3'h6):(1'h1)]);
  assign wire55 = wire50;
  assign wire56 = reg45[(2'h3):(2'h2)];
  assign wire57 = (7'h43);
  assign wire58 = wire55;
  always
    @(posedge clk) begin
      reg59 <= {{$unsigned(({reg49} ? $signed(wire40) : wire38[(2'h3):(2'h3)])),
              $signed(reg45)}};
      reg60 <= $signed(wire57[(5'h14):(4'h8)]);
      reg61 <= (~((reg45 ^ (!$signed((8'h9c)))) ?
          wire41 : ((^(wire55 ? (8'hbe) : wire51)) ^~ ($unsigned(wire38) ?
              $unsigned(reg43) : $signed(wire38)))));
    end
  assign wire62 = ((~|{(|(wire57 ? reg47 : (8'ha9))),
                      (^reg59[(3'h7):(3'h4)])}) * $unsigned((+reg60)));
  assign wire63 = {{((^(~(8'hae))) <= (|(wire57 < reg46)))}};
  assign wire64 = ((((8'ha3) >>> ($unsigned(wire57) * {reg46})) ?
                      ($signed($unsigned(reg47)) ^~ $signed(((8'hae) > reg46))) : ($unsigned({(8'hba)}) ?
                          ((reg45 << reg60) ?
                              reg60[(2'h2):(1'h0)] : ((8'hba) ?
                                  wire37 : wire51)) : $unsigned($signed((7'h42))))) < wire41);
  assign wire65 = (((wire62[(1'h0):(1'h0)] & (8'hb9)) ?
                          wire37 : $signed(wire38[(2'h3):(1'h1)])) ?
                      wire64 : (($signed((reg45 > wire39)) >> ((8'ha5) ?
                          ((8'hb6) ?
                              reg45 : reg45) : (wire52 | wire50))) ~^ ((~(^~reg43)) ?
                          wire53 : ((~&wire54) ?
                              (wire39 ? reg47 : reg45) : $unsigned((7'h41))))));
  assign wire66 = $signed($signed((8'h9c)));
  always
    @(posedge clk) begin
      if (reg48)
        begin
          reg67 <= {({(~&{wire62, wire65}),
                  (^~$unsigned(wire50))} ^~ (!$unsigned({wire51, wire57})))};
        end
      else
        begin
          reg67 <= ((~^$signed(((reg59 ? reg43 : wire62) ?
              wire53[(1'h0):(1'h0)] : {wire65,
                  wire62}))) << reg60[(2'h2):(1'h0)]);
          if ($unsigned(reg48[(3'h5):(3'h4)]))
            begin
              reg68 <= $unsigned($unsigned(wire56[(1'h0):(1'h0)]));
              reg69 <= {(&wire52[(1'h0):(1'h0)]), {reg49[(1'h1):(1'h1)]}};
            end
          else
            begin
              reg68 <= (|$signed($unsigned($unsigned(wire62))));
            end
          reg70 <= wire53[(3'h6):(2'h2)];
          reg71 <= (($signed($signed((wire55 ?
              reg68 : reg42))) <<< {(!wire63[(2'h3):(2'h3)])}) << ((reg42 && (7'h41)) - (({(8'ha9),
                  reg47} ^~ (&reg45)) ?
              $unsigned($unsigned((8'hac))) : {(wire63 ? wire51 : reg42)})));
        end
      reg72 <= ($unsigned(({(+reg45)} & wire55)) < {reg68[(3'h5):(3'h5)]});
      reg73 <= ({wire65} ? (reg72 >>> reg59) : reg67);
      reg74 <= (reg71[(1'h1):(1'h1)] | $unsigned(reg70));
      reg75 <= $unsigned((-((reg71[(1'h0):(1'h0)] ?
              $unsigned(reg73) : (-reg42)) ?
          $signed($signed(wire50)) : ($signed(wire40) > (wire63 ?
              (7'h42) : wire55)))));
    end
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  assign y = {wire32,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 wire18,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg21,
                 (1'h0)};
  assign wire18 = wire15[(5'h10):(2'h3)];
  assign wire19 = wire15;
  assign wire20 = {$unsigned({{{wire14}}, wire16[(1'h0):(1'h0)]})};
  always
    @(posedge clk) begin
      reg21 <= wire14[(2'h3):(2'h3)];
    end
  assign wire22 = (reg21 > $signed(($unsigned((wire20 ~^ (8'hb7))) ?
                      $signed(((8'haa) ?
                          wire19 : wire19)) : $unsigned(wire14))));
  assign wire23 = $signed(((~reg21) - {({(8'hbb), wire15} ?
                          wire18[(2'h3):(1'h1)] : (wire17 ? wire14 : (8'h9e))),
                      wire16}));
  assign wire24 = $signed((wire15[(4'he):(3'h7)] ?
                      wire14 : (~|wire19[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg25 <= (~{($unsigned($unsigned(wire17)) < $signed((wire16 || wire17)))});
      if (({$signed($unsigned($unsigned(wire18)))} != {$signed(((wire18 && wire23) ?
              $signed(wire16) : reg25))}))
        begin
          reg26 <= {wire15,
              (($unsigned(wire16) | wire16[(3'h5):(1'h1)]) >> (^~wire20))};
        end
      else
        begin
          if ($signed({((reg21[(2'h3):(1'h0)] ?
                      (wire20 || reg25) : (wire20 ? reg25 : reg21)) ?
                  {(wire20 ? reg25 : (8'ha5))} : ($signed((8'hbf)) ?
                      $signed(wire20) : (8'hb1))),
              reg26[(4'hb):(3'h5)]}))
            begin
              reg26 <= (((({reg26, (7'h43)} ?
                      $unsigned(wire20) : wire15[(3'h4):(2'h3)]) >> reg21) >>> ($unsigned((wire16 ?
                          reg21 : wire22)) ?
                      wire15 : wire23)) ?
                  ($unsigned($unsigned(wire14[(1'h0):(1'h0)])) ?
                      ($signed(wire22) < $signed($signed(wire16))) : (-$signed($signed(wire14)))) : wire18[(3'h5):(3'h4)]);
            end
          else
            begin
              reg26 <= (!$signed(((!(wire19 ~^ (8'hb2))) ?
                  {$signed(wire23), wire18} : $unsigned((wire19 ?
                      wire18 : reg21)))));
              reg27 <= (!wire17);
              reg28 <= wire20[(2'h3):(1'h1)];
              reg29 <= {$unsigned({{$signed(reg27), reg27[(1'h1):(1'h1)]},
                      wire20[(4'hc):(4'hc)]})};
              reg30 <= (&wire14[(3'h4):(1'h1)]);
            end
        end
      reg31 <= reg25[(5'h10):(3'h7)];
    end
  assign wire32 = (~&(($signed((~|wire14)) == $signed((&reg26))) + wire14[(2'h2):(1'h0)]));
endmodule
