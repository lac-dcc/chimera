module top
#(parameter param118 = (|(({(&(8'had)), {(8'hbc)}} == ((^(8'hb8)) ? ((8'hb3) ? (7'h42) : (8'haf)) : ((8'ha8) & (8'ha0)))) || {(+(~&(8'hb9))), (&((8'ha6) - (8'h9c)))})), 
parameter param119 = (!param118))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire115;
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire117, wire42, wire44, wire45, wire115, reg4, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0[(4'h9):(3'h4)];
      reg5 <= $unsigned(($unsigned($unsigned({wire3})) ?
          $unsigned((~(wire0 ? wire1 : wire0))) : $unsigned((8'h9d))));
    end
  module6 #() modinst43 (.wire7(wire3), .wire10(wire1), .clk(clk), .wire11(wire2), .y(wire42), .wire9(reg4), .wire8(wire0));
  assign wire44 = $unsigned($unsigned(reg5));
  assign wire45 = reg4[(2'h2):(1'h1)];
  module46 #() modinst116 (wire115, clk, reg5, wire2, wire45, wire44, reg4);
  assign wire117 = (reg5[(1'h0):(1'h0)] && wire3[(1'h0):(1'h0)]);
endmodule

module module46
#(parameter param114 = {(~(((|(8'ha1)) ? (^~(8'ha6)) : ((8'ha1) ? (7'h41) : (8'ha9))) ? (((8'hab) ? (8'hb9) : (8'ha2)) < ((8'hab) & (7'h44))) : (^((8'ha7) ? (8'had) : (7'h43))))), (|((((8'h9e) >> (8'hb2)) || (-(8'hb7))) || {((8'ha6) ? (8'hbd) : (8'hae))}))})
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire51;
  input wire signed [(5'h13):(1'h0)] wire50;
  input wire [(3'h7):(1'h0)] wire49;
  input wire [(5'h14):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire64;
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  assign y = {wire112,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 (1'h0)};
  module52 #() modinst65 (.wire56(wire51), .wire55(wire48), .clk(clk), .wire54(wire50), .wire53(wire47), .y(wire64));
  assign wire66 = (wire49[(1'h0):(1'h0)] ?
                      wire64[(3'h5):(3'h5)] : (^(wire50[(3'h4):(2'h3)] ?
                          $signed((wire50 ? wire48 : wire47)) : wire50)));
  assign wire67 = wire51[(3'h7):(3'h7)];
  assign wire68 = wire50[(4'he):(4'he)];
  assign wire69 = (-$unsigned(((8'hb6) == wire48[(5'h10):(5'h10)])));
  assign wire70 = wire69;
  assign wire71 = wire51[(2'h3):(2'h3)];
  assign wire72 = wire71[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg73 <= $signed(({(((8'ha0) ? wire67 : wire72) == $signed(wire51)),
          (~&$signed(wire67))} | ((+wire47) ?
          (^(wire69 ^ wire67)) : $signed(((8'ha2) << (8'hb5))))));
      reg74 <= wire70[(1'h0):(1'h0)];
      reg75 <= (^~$unsigned($unsigned(({wire47} ? $signed(wire49) : reg73))));
      if ((-$unsigned(wire70[(2'h2):(2'h2)])))
        begin
          reg76 <= $unsigned(((8'ha2) ? wire71 : wire50));
          reg77 <= wire49;
          reg78 <= $unsigned(wire51[(4'ha):(4'ha)]);
          reg79 <= reg75;
        end
      else
        begin
          reg76 <= wire49;
        end
    end
  assign wire80 = $unsigned((!$unsigned(reg73[(3'h4):(1'h1)])));
  assign wire81 = $signed(($unsigned(((wire71 || wire68) ?
                      (wire49 && wire64) : wire72)) >> wire50[(4'hf):(2'h3)]));
  assign wire82 = wire66[(4'ha):(1'h1)];
  assign wire83 = wire48[(5'h13):(4'he)];
  module84 #() modinst113 (.wire87(wire80), .y(wire112), .wire85(reg79), .clk(clk), .wire86(wire71), .wire88(wire72), .wire89(wire70));
endmodule

module module6
#(parameter param40 = ((~&(~^((|(8'had)) == (8'ha3)))) ? ((((~(8'hbc)) ? (~^(8'ha0)) : ((8'hbe) ^ (8'hb5))) || (((8'hb0) ? (8'ha9) : (8'ha4)) ? ((8'hb5) ^ (7'h44)) : (^(8'hbd)))) <= {((~|(8'hb1)) <= ((8'hbc) ? (8'hb2) : (7'h40))), ((7'h40) ? (+(8'hab)) : ((8'hb0) ? (8'hb3) : (8'hb5)))}) : (({((8'ha4) ? (8'hac) : (8'hb1)), ((8'hb5) - (8'hb0))} || (((8'hb5) >> (8'hb5)) ? ((8'hb3) ? (8'hbc) : (8'hb0)) : (^~(8'haf)))) ? ((((8'haf) >>> (8'hac)) | {(8'ha2), (8'hbe)}) && {(~^(8'ha2))}) : (!(!((7'h41) ? (8'ha5) : (7'h44)))))), 
parameter param41 = (~^{(+param40), ({(param40 <= param40), (-param40)} == ((param40 & param40) ^ (param40 ? (8'ha2) : param40)))}))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire12 = wire8[(1'h0):(1'h0)];
  assign wire13 = ((8'hb0) ?
                      $signed(((wire7[(3'h6):(3'h6)] ?
                              $unsigned(wire11) : (^wire10)) ?
                          wire12[(3'h4):(1'h1)] : {wire8})) : ((!((wire11 >= (8'haa)) - ((8'h9c) && wire9))) ?
                          (wire9 ?
                              ((wire12 ? wire12 : wire7) <<< ((8'hbf) ?
                                  wire10 : wire12)) : $unsigned(wire9[(3'h6):(2'h2)])) : wire12));
  assign wire14 = ({{(+{(8'hbd), wire11})},
                          $signed(($signed(wire7) ?
                              {wire10, wire13} : $unsigned(wire10)))} ?
                      wire12 : (^~wire8[(3'h5):(1'h0)]));
  assign wire15 = $signed((-(((+wire10) ? wire7 : wire10) ?
                      {$unsigned((8'hbf)),
                          wire8[(3'h7):(3'h6)]} : (-(wire9 < (7'h44))))));
  assign wire16 = $unsigned((wire12[(2'h3):(1'h1)] ?
                      $unsigned(((wire14 + wire12) ?
                          wire8 : $unsigned(wire8))) : $signed(($signed(wire13) ?
                          (wire15 << wire9) : wire8[(3'h5):(2'h3)]))));
  assign wire17 = $signed(($unsigned($unsigned($unsigned(wire16))) ?
                      wire16 : {$signed((wire10 - wire16)),
                          ((wire15 ? wire12 : wire15) * $signed(wire9))}));
  assign wire18 = ((((wire12[(3'h5):(2'h2)] ?
                          $unsigned(wire8) : wire17[(2'h3):(2'h3)]) && wire7) << $unsigned(((~^wire17) < (~|wire17)))) ?
                      (-$signed($signed((~|wire8)))) : (~&wire17));
  assign wire19 = ((wire8 >> $unsigned(wire12[(2'h2):(1'h1)])) < ((({wire11} ?
                          wire14[(2'h2):(1'h1)] : $unsigned(wire14)) ?
                      $unsigned($unsigned(wire8)) : $unsigned(((8'hb8) ?
                          wire11 : wire12))) >>> wire18[(3'h5):(2'h3)]));
  assign wire20 = wire17[(3'h4):(2'h3)];
  assign wire21 = (&$unsigned({wire8[(3'h5):(1'h0)],
                      (wire17 >>> $signed(wire15))}));
  always
    @(posedge clk) begin
      reg22 <= (-$signed({wire10[(3'h5):(2'h2)], (!(8'ha9))}));
      reg23 <= ($unsigned(reg22[(2'h3):(2'h2)]) ?
          ($signed(wire21[(3'h7):(1'h0)]) << $signed(reg22)) : $unsigned(reg22));
      if (wire13)
        begin
          reg24 <= ($unsigned((((!wire8) << $unsigned(wire20)) == wire13[(3'h4):(2'h3)])) ?
              (wire11 ?
                  $unsigned(wire9[(2'h2):(1'h0)]) : (~&wire21[(3'h4):(1'h1)])) : wire12);
          reg25 <= reg22;
          reg26 <= reg23[(5'h14):(1'h0)];
          reg27 <= $unsigned((~|(wire11[(1'h0):(1'h0)] || wire14[(1'h0):(1'h0)])));
        end
      else
        begin
          reg24 <= $signed((|$unsigned(reg24[(3'h6):(3'h6)])));
          reg25 <= ((8'ha9) >> $signed($signed(wire9[(1'h0):(1'h0)])));
          reg26 <= (($unsigned(((wire19 ? reg24 : reg23) ?
                  (reg22 ? wire21 : wire12) : (-wire9))) ?
              wire21 : $unsigned($signed(wire9[(2'h2):(2'h2)]))) <= $signed((~wire9)));
        end
      reg28 <= (wire11[(1'h1):(1'h0)] ?
          wire18 : ($unsigned((-wire17[(4'h8):(1'h1)])) ?
              $signed(reg22) : {{$unsigned(reg27), (wire14 ? wire10 : wire17)},
                  wire19[(4'h8):(2'h3)]}));
      reg29 <= ($signed((~|$unsigned((~(8'ha2))))) != wire17);
    end
  always
    @(posedge clk) begin
      reg30 <= wire12[(2'h2):(1'h1)];
      if ($signed(wire8[(2'h3):(1'h0)]))
        begin
          reg31 <= wire9[(3'h5):(3'h4)];
          if ({wire10[(3'h7):(3'h4)]})
            begin
              reg32 <= ($unsigned((~(8'hb4))) ?
                  wire11 : $unsigned(((~|(reg25 ? (8'ha1) : wire20)) ?
                      wire10[(3'h7):(3'h5)] : $unsigned((reg27 >= reg31)))));
            end
          else
            begin
              reg32 <= $unsigned({((^~$unsigned(wire7)) ?
                      $signed(reg31[(1'h1):(1'h1)]) : wire13),
                  $signed($unsigned($unsigned(reg32)))});
              reg33 <= ($unsigned($unsigned(((reg28 <= reg30) & $signed(reg22)))) ?
                  wire20[(4'hb):(3'h6)] : (^~$unsigned($signed((8'ha0)))));
            end
          reg34 <= (^(~$unsigned($unsigned((|reg33)))));
          reg35 <= reg25;
        end
      else
        begin
          if ($unsigned(wire11))
            begin
              reg31 <= ({reg29} & wire15[(3'h4):(1'h1)]);
            end
          else
            begin
              reg31 <= ({$unsigned(wire18[(3'h4):(1'h0)]),
                  (wire14 >>> ((reg30 ^~ wire18) ?
                      (reg32 ? wire10 : wire9) : {wire18,
                          wire17}))} < reg24[(4'he):(4'h9)]);
              reg32 <= (~&(reg35[(3'h4):(2'h2)] ?
                  $signed((reg30[(4'hc):(1'h0)] ?
                      (~|wire15) : wire10[(1'h1):(1'h0)])) : (wire13 ?
                      wire15[(1'h1):(1'h1)] : ((+reg31) ?
                          (~|wire20) : reg25))));
            end
          if (((($signed((wire19 ? (8'hb9) : wire16)) == $signed((reg33 ?
                      reg23 : reg32))) ?
                  (wire8 << $signed((wire18 ? wire20 : (8'hba)))) : wire7) ?
              ((7'h41) + ((~&$unsigned((8'ha1))) ^~ reg22[(3'h5):(1'h0)])) : (~&$unsigned(((^~wire13) - $unsigned((8'hbb)))))))
            begin
              reg33 <= reg29[(1'h1):(1'h0)];
              reg34 <= $unsigned($signed($signed((8'hb4))));
              reg35 <= reg34;
              reg36 <= reg22[(2'h2):(1'h1)];
              reg37 <= ($signed((8'hb9)) ?
                  ($unsigned($unsigned((~^wire8))) ?
                      (~|reg31[(2'h3):(2'h3)]) : ($unsigned((!reg29)) ?
                          (^~(|reg24)) : $unsigned({wire20,
                              wire20}))) : reg33[(2'h2):(2'h2)]);
            end
          else
            begin
              reg33 <= {wire15[(1'h0):(1'h0)]};
              reg34 <= ($unsigned((&wire21)) && {$signed($unsigned((8'ha5))),
                  $unsigned((^reg31[(1'h0):(1'h0)]))});
            end
          reg38 <= (~&$signed(wire15[(1'h0):(1'h0)]));
          reg39 <= reg28;
        end
    end
endmodule

module module84
#(parameter param111 = ({(-(^((8'ha2) ? (8'h9f) : (8'hb0)))), (|(((8'hac) ? (8'hb3) : (8'h9c)) >= (~(8'ha6))))} <<< (((((8'ha0) ? (8'hb0) : (8'h9f)) ~^ (8'ha8)) ~^ ((~^(8'had)) ? ((8'h9f) ? (8'haf) : (8'hb7)) : ((8'haf) ~^ (8'ha5)))) ? (8'ha3) : ({((8'ha4) ? (8'ha7) : (8'ha5))} ? (+{(8'hbe)}) : ((+(8'ha2)) & (8'hb8))))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire89;
  input wire [(4'hc):(1'h0)] wire88;
  input wire [(3'h4):(1'h0)] wire87;
  input wire [(4'h9):(1'h0)] wire86;
  input wire [(3'h4):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire100;
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  assign y = {wire101,
                 wire100,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg90 <= wire89[(3'h7):(2'h3)];
      if (($unsigned({$signed((~^(8'ha2))),
          ({wire86, wire89} ?
              (wire87 ?
                  wire88 : wire88) : $signed(wire87))}) << (((wire85[(2'h3):(2'h2)] <= {(8'ha9)}) ^ ((wire86 ?
              wire87 : wire85) ?
          (!(8'ha0)) : wire89[(3'h6):(2'h2)])) >>> wire87)))
        begin
          if ($signed((wire89[(2'h2):(1'h0)] || {(^~$unsigned(reg90)),
              wire85[(1'h1):(1'h0)]})))
            begin
              reg91 <= $unsigned(wire88);
            end
          else
            begin
              reg91 <= ((reg90 - wire88) ?
                  $signed(reg91[(4'h9):(1'h0)]) : wire87);
              reg92 <= (wire86 + $unsigned((((~^wire88) ~^ {(8'hb2)}) ~^ reg90[(2'h3):(1'h0)])));
              reg93 <= ($unsigned(reg90[(4'ha):(2'h3)]) >> wire87[(1'h1):(1'h1)]);
              reg94 <= reg90[(1'h1):(1'h0)];
              reg95 <= ((reg93[(4'hf):(3'h6)] << $signed({{reg93, (8'ha3)},
                      {wire88}})) ?
                  (reg90[(5'h13):(4'he)] + $signed(((reg92 >>> reg94) * (~&wire87)))) : {(!(8'hb5))});
            end
          reg96 <= reg90;
        end
      else
        begin
          reg91 <= ((reg96[(4'hb):(2'h2)] ?
                  ((8'ha8) ?
                      reg90[(1'h0):(1'h0)] : ($signed(wire87) ?
                          $signed(reg96) : (reg91 <<< wire87))) : (8'hab)) ?
              wire89[(3'h5):(2'h2)] : reg90[(4'h9):(4'h8)]);
          if ($unsigned($unsigned((wire89[(3'h4):(1'h0)] < ($signed(reg95) >= wire88)))))
            begin
              reg92 <= (~reg95);
            end
          else
            begin
              reg92 <= $unsigned(reg93[(4'hc):(1'h1)]);
              reg93 <= $unsigned({reg93[(4'hc):(1'h0)], (~|{reg96})});
            end
          reg94 <= reg93[(4'he):(4'h9)];
          reg95 <= wire88;
        end
      reg97 <= {(8'ha8)};
      reg98 <= $signed($unsigned($signed((~|$signed(reg91)))));
      reg99 <= (reg92 >> $signed(wire89));
    end
  assign wire100 = (wire86[(3'h5):(3'h4)] * (~^reg96[(4'h9):(1'h0)]));
  assign wire101 = $unsigned(({($unsigned(reg92) || (+(8'hbe)))} > {($unsigned(wire86) ?
                           reg94[(2'h2):(1'h1)] : {(8'hbd)}),
                       $signed($signed(reg98))}));
  always
    @(posedge clk) begin
      if ((8'ha5))
        begin
          reg102 <= (|$signed($signed($unsigned({reg95, reg97}))));
          reg103 <= $unsigned((+$unsigned((8'haf))));
          if (reg97[(3'h7):(3'h5)])
            begin
              reg104 <= reg92;
              reg105 <= ($signed(reg98[(4'ha):(3'h6)]) ?
                  reg103 : $signed(({{(8'ha5), wire88},
                      (wire87 ? reg104 : (8'h9f))} != (+$unsigned(wire85)))));
              reg106 <= ((|((^(reg92 ?
                  (8'hb3) : reg102)) <= reg96[(3'h4):(3'h4)])) > ((-{((8'haf) && wire86)}) ?
                  (^~$signed($signed(reg102))) : ($unsigned(reg105) ?
                      (-reg99[(3'h4):(2'h3)]) : $signed((reg98 <= reg90)))));
            end
          else
            begin
              reg104 <= wire85[(1'h1):(1'h1)];
            end
          reg107 <= (8'hbc);
          reg108 <= (~|$unsigned((8'ha9)));
        end
      else
        begin
          reg102 <= (wire88[(3'h6):(3'h5)] >>> ((wire87[(2'h2):(2'h2)] && ((reg92 ?
              reg107 : reg108) >>> (~&reg93))) > ($unsigned(reg98) + {(reg98 > (8'ha3))})));
          reg103 <= $unsigned($signed($unsigned(($signed(wire100) ^~ (&reg91)))));
          reg104 <= $unsigned({reg93[(3'h5):(2'h2)]});
          reg105 <= reg108;
        end
      reg109 <= $unsigned((+$signed($unsigned($unsigned(reg105)))));
      reg110 <= reg106;
    end
endmodule

module module52  (y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire56;
  input wire signed [(5'h13):(1'h0)] wire55;
  input wire [(5'h12):(1'h0)] wire54;
  input wire [(5'h10):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  assign y = {wire63, wire62, wire61, wire60, wire59, wire58, wire57, (1'h0)};
  assign wire57 = (8'ha0);
  assign wire58 = (wire56 ?
                      wire56[(2'h2):(1'h1)] : (wire54[(3'h5):(1'h0)] ?
                          $signed(((wire56 ?
                              wire54 : wire55) + $signed(wire54))) : $unsigned(wire55[(4'h9):(2'h2)])));
  assign wire59 = (-$unsigned((-(7'h41))));
  assign wire60 = $signed((~&(8'hac)));
  assign wire61 = wire53[(2'h3):(2'h2)];
  assign wire62 = (~$signed((((+(8'hb2)) | wire53[(4'h9):(4'h9)]) == (wire58[(3'h7):(1'h1)] ?
                      (|wire55) : wire59[(4'h8):(3'h6)]))));
  assign wire63 = $signed(((wire58 & {(wire55 < wire54),
                      ((8'hba) ?
                          wire53 : wire60)}) ~^ (~|((~^wire62) > {(8'hac)}))));
endmodule
