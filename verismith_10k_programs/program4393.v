module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire141;
  wire [(3'h7):(1'h0)] wire136;
  wire [(3'h5):(1'h0)] wire135;
  wire [(4'hd):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  assign y = {wire141,
                 wire136,
                 wire135,
                 wire133,
                 wire22,
                 wire21,
                 wire19,
                 wire4,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire4 = wire3[(2'h2):(1'h0)];
  module5 #() modinst20 (.y(wire19), .clk(clk), .wire8(wire4), .wire7(wire2), .wire6(wire3), .wire9(wire1));
  assign wire21 = ({(wire3 ?
                          wire19[(4'hb):(3'h4)] : (^(wire19 ?
                              wire3 : wire0)))} <= ($signed((~|$unsigned(wire1))) ?
                      $signed(wire0) : wire1[(1'h0):(1'h0)]));
  assign wire22 = (wire19 >>> ((8'hba) <<< $unsigned(wire21[(4'h9):(3'h4)])));
  module23 #() modinst134 (.wire24(wire21), .wire26(wire22), .wire27(wire19), .wire25(wire2), .clk(clk), .y(wire133));
  assign wire135 = wire133;
  assign wire136 = wire21[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg137 <= $unsigned(wire1[(4'h9):(3'h4)]);
      reg138 <= $unsigned((8'hb0));
      reg139 <= (($unsigned($signed($signed(wire133))) ?
              {$signed((wire19 ? (8'hbf) : wire4))} : ((8'ha6) << reg137)) ?
          $unsigned($signed(((~|wire19) >>> wire0[(4'hf):(4'ha)]))) : wire133);
      reg140 <= {$signed((|wire2[(1'h1):(1'h0)])), reg138[(1'h1):(1'h0)]};
    end
  assign wire141 = $signed($signed($signed(wire19)));
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire83;
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire52,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire54,
                 wire57,
                 wire83,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire28 = wire27[(2'h2):(1'h0)];
  assign wire29 = (~&$signed((wire26 < {(wire26 * wire27), (8'hb6)})));
  assign wire30 = ($unsigned($unsigned((8'ha5))) + wire28);
  assign wire31 = $unsigned(wire30[(2'h3):(2'h3)]);
  module32 #() modinst53 (.wire37(wire30), .wire36(wire24), .wire33(wire26), .wire35(wire29), .y(wire52), .wire34(wire28), .clk(clk));
  assign wire54 = wire30[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg55 <= (~^$signed(wire52));
    end
  always
    @(posedge clk) begin
      reg56 <= (^~(({wire54[(4'h8):(3'h5)], wire29} ?
              (~|((8'ha6) ? (7'h44) : wire26)) : (|$signed(wire26))) ?
          ((wire25 + $signed(wire27)) ?
              {wire30[(1'h1):(1'h1)],
                  ((8'hbd) ? wire31 : wire24)} : wire28) : (&((wire30 ?
                  wire30 : reg55) ?
              (wire28 ? wire26 : wire54) : $unsigned(wire31)))));
    end
  assign wire57 = reg55[(2'h2):(1'h1)];
  module58 #() modinst84 (wire83, clk, wire26, wire29, wire27, wire52, wire30);
  module85 #() modinst128 (wire127, clk, wire28, wire26, wire25, wire83);
  assign wire129 = reg56;
  assign wire130 = ($unsigned(((8'hb7) ?
                           $signed((+wire127)) : ($unsigned(wire28) >>> wire57[(5'h10):(3'h7)]))) ?
                       (^~(wire57[(2'h3):(1'h0)] - $unsigned({wire83}))) : $signed((~^wire26)));
  assign wire131 = (-$signed((+(7'h43))));
  assign wire132 = $unsigned(wire30[(3'h5):(2'h2)]);
endmodule

module module5
#(parameter param17 = ((^~(~^(((8'ha8) ^~ (8'hac)) == ((8'ha1) ? (8'hae) : (8'ha9))))) ? (((~^(~^(8'haf))) ? (((8'hbe) ? (8'hb4) : (8'hbc)) > ((8'hbf) ? (8'hb1) : (8'hbe))) : (7'h40)) ? ((8'hae) < (^~{(8'ha1), (7'h43)})) : ((((8'ha7) ~^ (8'ha3)) ^~ (~&(8'haf))) ? (((8'ha7) ? (8'hb4) : (8'ha5)) ^ (!(8'hba))) : {((8'hbc) ? (8'hab) : (7'h41))})) : ({(((8'h9f) ? (8'ha8) : (8'hb1)) >= (&(8'ha1)))} ^~ {{((8'h9c) + (8'h9d)), ((8'hb1) ? (7'h40) : (8'had))}, (^(~(8'ha2)))})), 
parameter param18 = (((8'ha7) ? (param17 + (~(param17 ? param17 : param17))) : param17) ^ (~(({param17} != param17) ? param17 : (|(|param17))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire8;
  assign wire11 = (|$signed($unsigned(((wire6 ? wire6 : (8'ha5)) ?
                      (8'ha1) : wire9[(2'h3):(1'h0)]))));
  assign wire12 = wire10[(2'h2):(1'h0)];
  assign wire13 = (~((~$signed(wire7)) > (((|wire11) ?
                      {wire11, wire12} : wire7) | wire9[(3'h5):(2'h2)])));
  assign wire14 = ($signed($signed((~&(wire6 < wire11)))) && ((^(7'h42)) ?
                      wire6 : ({(wire8 < wire9)} && wire6[(3'h7):(1'h1)])));
  assign wire15 = {($unsigned($signed(wire6)) >>> (~&$unsigned($unsigned(wire12)))),
                      {$unsigned($unsigned((|wire8)))}};
  assign wire16 = $signed(wire11);
endmodule

module module85
#(parameter param126 = (&(((^~(8'h9c)) < (((8'ha9) >> (8'ha2)) != ((8'ha0) ? (8'ha4) : (7'h41)))) ? ({(^(8'ha1))} >>> ((8'ha4) == ((7'h43) ? (8'h9d) : (8'ha6)))) : ((((8'ha8) ? (8'ha0) : (8'haf)) ? ((8'hb2) != (8'haa)) : ((8'ha9) | (8'hbd))) ? {{(8'h9f)}} : (&((8'ha0) ? (8'h9e) : (8'hb2)))))))
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire89;
  input wire [(4'hc):(1'h0)] wire88;
  input wire [(4'hd):(1'h0)] wire87;
  input wire [(2'h3):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire123;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  wire [(4'h8):(1'h0)] wire90;
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire92,
                 wire91,
                 wire90,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
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
  assign wire90 = ({(~(wire87[(4'h9):(3'h5)] ?
                          $unsigned(wire87) : wire87[(4'hb):(3'h7)])),
                      (7'h44)} >= {($unsigned(wire88[(3'h7):(1'h0)]) ?
                          (~((8'hb4) ?
                              wire87 : wire89)) : $signed((wire87 * wire87))),
                      (wire89[(3'h5):(1'h0)] <= wire89[(2'h3):(1'h0)])});
  assign wire91 = ((+$signed(wire89)) - ((!wire88[(2'h2):(1'h0)]) ?
                      {$unsigned((8'ha2))} : (7'h42)));
  assign wire92 = ((^{($signed(wire86) <= (wire88 < wire86))}) & wire90);
  always
    @(posedge clk) begin
      reg93 <= (~^$unsigned((|(8'ha0))));
      if ((^~(wire89[(1'h1):(1'h1)] && (^wire90))))
        begin
          reg94 <= {wire87};
          reg95 <= (reg93[(3'h5):(1'h0)] < ({{$unsigned((8'ha0))}} ?
              ((((8'ha4) ? wire90 : (8'h9e)) || ((8'ha6) ? wire90 : wire92)) ?
                  wire89 : (wire92 >>> $unsigned(reg93))) : wire90[(3'h5):(1'h0)]));
          reg96 <= (reg93[(4'ha):(3'h5)] ?
              reg93[(4'h9):(4'h9)] : wire89[(1'h1):(1'h1)]);
          if ((^~(!(((^(8'hbd)) ?
              ((8'hb2) ^~ wire90) : (wire92 || wire92)) ~^ $signed((~&reg95))))))
            begin
              reg97 <= $signed(wire92[(3'h4):(3'h4)]);
              reg98 <= wire90;
              reg99 <= reg97;
              reg100 <= reg99[(1'h0):(1'h0)];
            end
          else
            begin
              reg97 <= $unsigned(reg100[(1'h0):(1'h0)]);
              reg98 <= {wire87[(4'h9):(3'h5)], reg97[(3'h7):(3'h6)]};
              reg99 <= (reg95[(2'h2):(1'h1)] > ({$unsigned($unsigned(reg96)),
                  (!$unsigned((7'h43)))} ~^ ((8'hae) ^ (~|((8'h9d) ?
                  wire91 : (8'ha8))))));
              reg100 <= $unsigned({reg93, (8'hb2)});
            end
          reg101 <= ($unsigned(wire87) & (&$unsigned((|reg93[(3'h6):(1'h0)]))));
        end
      else
        begin
          if ({reg100,
              ({(|{(8'hb8), reg99})} ?
                  $unsigned(((^~reg95) ?
                      $unsigned(reg94) : (reg93 ?
                          wire89 : reg98))) : wire90[(1'h0):(1'h0)])})
            begin
              reg94 <= (($unsigned($signed((reg98 ? (8'hbc) : wire90))) ?
                  ((((8'ha7) <= reg98) ? {reg96} : {reg95}) ?
                      $signed($unsigned(wire89)) : reg97) : wire86[(2'h3):(1'h0)]) ^~ ($signed({$unsigned(wire87)}) ?
                  (~(8'h9c)) : (reg99[(2'h2):(1'h0)] >= $signed(reg97[(3'h6):(3'h4)]))));
              reg95 <= $unsigned((($unsigned(wire92[(1'h0):(1'h0)]) && $signed((reg93 << reg94))) == ((wire91[(3'h7):(2'h2)] - {reg98,
                      wire88}) ?
                  $signed((&reg96)) : reg98[(2'h3):(2'h3)])));
              reg96 <= (reg93[(1'h0):(1'h0)] ?
                  wire91 : $signed(((8'hb1) >>> {reg99, (~|wire90)})));
              reg97 <= $signed((wire89 ?
                  $signed(wire89[(2'h2):(1'h1)]) : reg100[(2'h2):(1'h0)]));
              reg98 <= reg99;
            end
          else
            begin
              reg94 <= $unsigned({reg95,
                  $unsigned($unsigned($unsigned(reg97)))});
              reg95 <= reg94;
              reg96 <= {(~|wire90[(3'h5):(2'h2)])};
              reg97 <= ($unsigned(({reg101} ?
                      $signed((8'ha7)) : ($unsigned(reg94) * (wire91 >>> reg95)))) ?
                  ($signed($signed((^~reg96))) ?
                      (wire86 ~^ wire90) : reg97) : $signed(reg94));
            end
          if (({(|(~^$unsigned(wire88))), wire89[(1'h0):(1'h0)]} ?
              $unsigned(reg101) : ({reg98[(4'hf):(4'hc)]} ?
                  {reg99,
                      $unsigned($unsigned(wire91))} : $signed(reg94[(2'h2):(1'h0)]))))
            begin
              reg99 <= (reg95 ?
                  ($unsigned(wire86[(2'h2):(1'h1)]) & reg98) : $unsigned(($signed($unsigned(wire92)) <= $signed((~|reg95)))));
              reg100 <= (-$signed((&wire90[(4'h8):(3'h6)])));
              reg101 <= $unsigned(((~|(reg93 + (wire91 ? wire92 : (8'ha8)))) ?
                  {($unsigned(reg99) ?
                          (wire92 ? (7'h40) : wire87) : (wire88 ?
                              reg100 : reg101)),
                      (wire89[(3'h5):(3'h5)] || (~|wire88))} : $unsigned(($signed(reg101) ?
                      {wire92} : (wire92 ? (8'hac) : reg98)))));
              reg102 <= $unsigned($signed({reg101,
                  (wire88 ^ $signed(wire91))}));
              reg103 <= (~(8'h9f));
            end
          else
            begin
              reg99 <= (((~|(8'ha8)) ?
                      (({reg103,
                          (8'ha6)} - wire90[(3'h4):(2'h3)]) >> (~^(reg102 + reg98))) : ((8'h9f) ?
                          {(wire89 ?
                                  wire89 : reg93)} : {reg102[(2'h2):(1'h1)]})) ?
                  ((reg94[(3'h5):(3'h4)] ^ $signed($signed(wire88))) ~^ $signed(reg94[(3'h4):(1'h0)])) : wire86);
            end
          reg104 <= $signed(($signed(reg94) ^ ($unsigned(wire88[(4'h8):(3'h5)]) ?
              (!{reg101, (7'h44)}) : $signed((reg95 ? reg103 : wire91)))));
        end
      reg105 <= $unsigned(($unsigned(($unsigned(reg93) ?
              $unsigned(reg104) : wire91[(3'h6):(2'h3)])) ?
          $signed((-$signed(wire87))) : (((reg95 ?
                  wire88 : reg93) < (~reg104)) ?
              reg95[(3'h6):(3'h6)] : ($unsigned(reg96) ?
                  (&reg95) : (reg102 ? wire87 : (7'h43))))));
      if (({$unsigned((8'h9d)), (~|{(reg93 == reg94)})} ^ wire91))
        begin
          reg106 <= (reg96[(1'h0):(1'h0)] ?
              $signed((8'ha6)) : {($signed((reg98 <<< (8'hb7))) ?
                      reg105[(3'h5):(3'h5)] : reg93)});
          if (($unsigned({(+(reg104 ?
                  reg99 : wire87))}) | $signed({$unsigned(wire90)})))
            begin
              reg107 <= (!(({$unsigned(reg101), ((8'haa) ? reg104 : reg94)} ?
                  $unsigned($unsigned(wire91)) : ((7'h42) ?
                      wire87 : (-reg106))) > $unsigned($signed((^~reg96)))));
              reg108 <= $unsigned(({$unsigned((-wire90))} ?
                  $unsigned((reg100[(1'h0):(1'h0)] > (^~wire91))) : $signed((|(reg95 ~^ wire90)))));
            end
          else
            begin
              reg107 <= reg93[(1'h1):(1'h1)];
              reg108 <= {(~wire86[(2'h2):(1'h0)])};
              reg109 <= reg108[(2'h2):(1'h1)];
              reg110 <= {reg94[(1'h1):(1'h1)], reg104[(5'h11):(4'h9)]};
            end
          reg111 <= wire92[(2'h2):(2'h2)];
          if (reg98[(4'ha):(2'h3)])
            begin
              reg112 <= (($signed($unsigned((reg111 ? reg105 : wire86))) ?
                      reg94 : reg109[(4'h9):(3'h6)]) ?
                  reg111[(4'hb):(3'h5)] : ({reg93,
                      $signed($signed((7'h41)))} & $signed(((~|reg100) ?
                      $signed(reg94) : (reg107 ? (8'ha3) : (8'haf))))));
              reg113 <= $signed(reg95);
              reg114 <= $unsigned($unsigned(reg100[(3'h5):(2'h2)]));
              reg115 <= (((reg99 ?
                      reg97[(3'h4):(2'h2)] : ($signed(reg110) ?
                          $signed(reg113) : (reg98 << (7'h44)))) <= wire89) ?
                  $signed((($unsigned((7'h43)) ?
                      $signed(wire89) : $signed((8'hb9))) * wire87[(3'h4):(2'h2)])) : {($unsigned(reg106[(5'h13):(2'h3)]) ?
                          $signed(((8'ha3) >> wire92)) : reg100[(2'h2):(1'h1)]),
                      ($signed((~&reg94)) >> reg100[(3'h4):(2'h3)])});
              reg116 <= wire88[(4'h8):(1'h1)];
            end
          else
            begin
              reg112 <= $signed(reg105[(3'h5):(3'h5)]);
            end
        end
      else
        begin
          reg106 <= reg101[(4'he):(3'h6)];
          reg107 <= $signed((reg111 * ((reg95[(1'h0):(1'h0)] != reg101) ?
              {(~|wire87)} : (8'ha1))));
          reg108 <= reg96[(3'h4):(1'h0)];
        end
      if ($signed((reg101 ? reg101 : (&wire86[(2'h3):(2'h2)]))))
        begin
          reg117 <= ({$unsigned(($unsigned(reg112) | reg114[(2'h3):(2'h2)]))} | $signed($signed((wire92 ?
              ((8'haf) ? reg94 : reg93) : (^wire86)))));
          reg118 <= $unsigned(reg100);
          if ($unsigned($signed($unsigned((wire91[(3'h5):(3'h4)] ?
              reg99 : (~reg105))))))
            begin
              reg119 <= reg97[(2'h2):(1'h0)];
              reg120 <= $signed($signed($unsigned((8'hbd))));
              reg121 <= reg117;
            end
          else
            begin
              reg119 <= $unsigned((reg111 ?
                  {$unsigned((reg97 ? reg98 : reg113)),
                      $unsigned({wire90,
                          (8'h9c)})} : (wire92[(1'h0):(1'h0)] >= reg107[(1'h1):(1'h1)])));
              reg120 <= $unsigned(reg104);
            end
        end
      else
        begin
          reg117 <= ((reg99[(1'h1):(1'h0)] ~^ (&wire87)) ^ ((($unsigned(reg112) ?
              $unsigned(reg114) : reg105) >> $unsigned((+(8'h9d)))) > ({reg95[(3'h5):(2'h2)]} == $signed((reg109 ?
              reg103 : reg104)))));
          reg118 <= {(&{(~^reg101)})};
          reg119 <= $signed((^~(-reg115)));
          reg120 <= $signed(((^~reg120[(4'ha):(1'h1)]) << (|$signed(reg100[(2'h2):(1'h0)]))));
          reg121 <= (+reg101[(3'h5):(3'h4)]);
        end
    end
  assign wire122 = reg112[(1'h0):(1'h0)];
  assign wire123 = wire86;
  assign wire124 = reg104;
  assign wire125 = (~^reg114);
endmodule

module module58
#(parameter param81 = ((!((((8'hb4) ? (8'hb3) : (8'hb2)) ? {(8'hbb)} : (~|(8'hac))) ? {((8'ha3) & (8'hba)), {(8'had), (8'ha4)}} : (((7'h40) ? (8'hb2) : (8'ha0)) ? ((8'hb6) ? (8'ha0) : (8'ha9)) : ((8'h9f) >>> (8'ha6))))) * (((8'ha6) || (((8'hb2) | (8'hbe)) ? ((8'h9c) ^~ (8'hb4)) : ((8'hb3) ? (8'ha6) : (8'haf)))) ^~ ((&(^(7'h40))) <<< (^((8'hb3) ? (8'hba) : (8'ha3)))))), 
parameter param82 = param81)
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire63;
  input wire signed [(5'h12):(1'h0)] wire62;
  input wire [(2'h3):(1'h0)] wire61;
  input wire signed [(3'h7):(1'h0)] wire60;
  input wire [(4'h9):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  assign y = {wire80,
                 wire65,
                 wire64,
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
                 (1'h0)};
  assign wire64 = $unsigned(($signed({(wire62 & wire59)}) > (|wire59)));
  assign wire65 = (^~((!{(wire62 ? wire62 : wire63), $unsigned(wire59)}) ?
                      ($signed((wire59 ^ wire64)) ?
                          $unsigned((wire61 ?
                              wire61 : wire64)) : $signed((~^wire59))) : wire63[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire65[(1'h1):(1'h0)])
        begin
          reg66 <= wire64[(1'h0):(1'h0)];
          reg67 <= $unsigned($unsigned(wire59[(2'h3):(2'h2)]));
          if ($unsigned((wire63 | ($unsigned((~wire64)) ?
              wire64 : {(wire64 ? reg67 : wire62)}))))
            begin
              reg68 <= (wire64 ? (!wire64[(4'h8):(3'h6)]) : wire64);
            end
          else
            begin
              reg68 <= $unsigned(wire64[(3'h5):(2'h3)]);
              reg69 <= {$signed($unsigned($unsigned(wire65[(4'h9):(3'h5)]))),
                  ((~$signed(wire61[(2'h3):(2'h2)])) >>> {(+(~|reg68)),
                      $unsigned($unsigned(reg67))})};
            end
          reg70 <= (reg68 ?
              wire62 : (((8'had) || ((wire62 * wire65) <<< $signed(wire63))) ?
                  (wire64[(1'h0):(1'h0)] ?
                      $signed($signed((8'ha2))) : wire60[(1'h0):(1'h0)]) : $unsigned((wire60 ?
                      {reg69} : {wire60, reg69}))));
        end
      else
        begin
          reg66 <= ($signed(wire59[(4'h9):(3'h6)]) != reg69);
          if (wire63[(1'h1):(1'h0)])
            begin
              reg67 <= (($signed((~&wire60)) & wire59[(4'h9):(2'h2)]) ?
                  wire60 : ($unsigned(wire59[(4'h8):(4'h8)]) || reg67[(3'h5):(1'h1)]));
              reg68 <= $signed(reg67[(5'h10):(4'h9)]);
              reg69 <= {wire60[(3'h6):(3'h6)],
                  (~{reg69, (wire59[(3'h7):(3'h7)] != {reg68, wire61})})};
              reg70 <= (reg69 ?
                  wire59 : $signed($unsigned((&(reg67 ? wire63 : wire60)))));
            end
          else
            begin
              reg67 <= ($unsigned(($signed($signed((8'ha0))) ?
                      $unsigned(reg69[(4'hb):(4'hb)]) : ((^(8'hbb)) ?
                          (wire59 ? reg70 : wire60) : (~^wire64)))) ?
                  $unsigned($unsigned(reg69)) : wire63);
              reg68 <= ({reg69} >> (~^$unsigned(((wire64 ?
                  reg70 : (8'hbb)) == (^wire65)))));
              reg69 <= $unsigned(reg66[(4'hf):(4'hd)]);
              reg70 <= {(($signed($signed(reg66)) | $signed((reg67 ?
                      wire63 : wire65))) + $signed(wire65))};
              reg71 <= reg70;
            end
          if (wire64[(4'h8):(2'h3)])
            begin
              reg72 <= (~|{((~(reg71 ? wire61 : reg67)) >= $signed(reg70)),
                  (((^wire65) < (wire62 == reg70)) ^ $unsigned(wire65))});
              reg73 <= (wire64 << wire61);
            end
          else
            begin
              reg72 <= (&(-(|(-$signed(reg71)))));
              reg73 <= wire59;
            end
          if ({$signed({$unsigned(wire63)})})
            begin
              reg74 <= (wire62 * wire63);
              reg75 <= ($unsigned(reg69) ?
                  $signed($signed(wire64[(3'h7):(3'h7)])) : {reg68});
              reg76 <= $unsigned($signed($unsigned((^(reg69 != reg71)))));
              reg77 <= wire60;
              reg78 <= (~(!({wire65[(4'h8):(2'h2)],
                  wire64[(4'ha):(3'h5)]} <= ($signed((8'hbb)) + (wire65 > reg73)))));
            end
          else
            begin
              reg74 <= $signed((-(reg73 ?
                  ($signed(wire60) < $signed(wire61)) : $unsigned(reg71[(3'h5):(3'h5)]))));
              reg75 <= {(^((reg68[(2'h3):(1'h0)] * wire62) ?
                      (|reg68[(2'h3):(2'h2)]) : $signed({reg71})))};
              reg76 <= (-(wire64[(3'h5):(3'h4)] * $unsigned($signed((reg74 ?
                  (8'ha3) : (8'ha9))))));
              reg77 <= {$unsigned(reg78[(1'h0):(1'h0)]), reg78[(4'h8):(3'h4)]};
            end
        end
      reg79 <= $unsigned(((({wire65} << (8'hbe)) >> $unsigned(reg67[(5'h12):(4'h8)])) ?
          (~|{$unsigned(wire60)}) : reg77));
    end
  assign wire80 = {$signed(reg66[(4'hb):(4'ha)]), reg69[(4'ha):(3'h5)]};
endmodule

module module32
#(parameter param51 = (~|(((~^(^~(8'hb4))) ^ {{(8'h9d), (8'hb4)}, ((7'h44) >= (7'h42))}) ? (((-(8'h9e)) || ((8'haa) ? (8'ha1) : (8'ha4))) >> ((~(8'hb0)) ? (|(8'ha9)) : {(8'hbf), (8'hb2)})) : ((((8'h9d) ? (8'hb4) : (8'ha5)) == ((8'hbe) == (8'hb9))) ? (((8'hbb) >> (8'h9f)) <= (~^(8'ha3))) : (+{(8'ha7), (8'ha7)})))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire signed [(3'h6):(1'h0)] wire36;
  input wire [(3'h4):(1'h0)] wire35;
  input wire signed [(3'h7):(1'h0)] wire34;
  input wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire40,
                 wire39,
                 wire38,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire38 = ((({(~&(8'h9e))} && (wire37 ^~ ((8'hb0) * wire35))) != (^~($unsigned(wire33) ?
                      wire35[(2'h2):(1'h0)] : $unsigned(wire35)))) >>> {(8'hbe),
                      (wire35 < wire34[(3'h5):(2'h3)])});
  assign wire39 = $unsigned((-wire33));
  assign wire40 = ($unsigned(wire34[(2'h2):(2'h2)]) ? wire33 : (~&wire39));
  always
    @(posedge clk) begin
      reg41 <= (7'h44);
      if ((^(~&(+wire40))))
        begin
          reg42 <= {$signed(((wire40 ? {wire33, wire34} : $signed(wire38)) ?
                  $signed($unsigned(wire37)) : (-$signed((8'ha7))))),
              {wire40,
                  $signed(((wire35 >>> (8'hac)) ? wire39 : $signed(wire35)))}};
        end
      else
        begin
          reg42 <= {reg41, wire33[(2'h2):(2'h2)]};
          reg43 <= (~$signed(((reg41[(5'h10):(3'h5)] <= $signed((8'h9f))) >>> wire34)));
        end
      reg44 <= wire33;
      reg45 <= $unsigned((reg42[(2'h2):(2'h2)] > $unsigned($unsigned($signed(reg42)))));
      reg46 <= {((($unsigned(wire38) << reg41[(4'hc):(4'ha)]) ?
              wire36 : wire35) < ((wire36[(3'h6):(2'h3)] ?
                  $unsigned(wire34) : reg41) ?
              reg45 : ($unsigned((7'h40)) ?
                  wire34[(3'h6):(1'h1)] : (wire40 ^~ reg43))))};
    end
  assign wire47 = ($unsigned(((~^wire35[(1'h1):(1'h0)]) ?
                          (~|reg46[(5'h12):(5'h11)]) : (^(reg41 ?
                              reg45 : reg46)))) ?
                      $signed((((reg46 > wire40) ^ wire38) > (~|(wire34 ?
                          (8'haa) : (8'hbb))))) : {(~|(wire36 ?
                              (wire36 ? wire37 : reg46) : (!wire39)))});
  assign wire48 = $unsigned(($unsigned((wire47[(1'h1):(1'h1)] ?
                      $signed(reg45) : (^reg42))) && (~(~$unsigned(reg46)))));
  assign wire49 = ($unsigned((wire48 ?
                          (wire36 >> (wire40 <<< reg45)) : (^~$unsigned(reg44)))) ?
                      reg46 : (wire47 != ((~&reg44[(3'h6):(3'h6)]) <<< reg45[(2'h2):(2'h2)])));
  assign wire50 = ({reg42[(3'h4):(1'h0)]} + (+((reg41[(4'hd):(1'h1)] ?
                          wire48 : (8'h9f)) ?
                      $unsigned((8'ha3)) : $unsigned({reg46}))));
endmodule
