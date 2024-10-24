module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire136;
  wire signed [(5'h11):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire132;
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire132,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = ((wire3 ? {wire1} : (|$unsigned(wire4))) ?
                     ({(-wire1)} ?
                         wire2 : ((+(|wire2)) >>> {(wire5 ? wire5 : wire0),
                             (wire1 < wire5)})) : $signed((^wire5)));
  assign wire7 = (wire2 != wire6);
  assign wire8 = ($signed($signed(($unsigned(wire3) <<< (^~wire7)))) ?
                     wire0 : $unsigned((~&wire3[(5'h13):(1'h0)])));
  module9 #() modinst133 (wire132, clk, wire5, wire1, wire6, wire8, wire4);
  assign wire134 = $signed(wire1[(2'h3):(1'h0)]);
  assign wire135 = (($signed((wire8[(4'hd):(4'h9)] ?
                           (~&(8'ha4)) : wire6[(4'ha):(4'h9)])) && ((~&wire0[(1'h0):(1'h0)]) + $unsigned((|wire134)))) ?
                       wire4 : wire4[(2'h3):(1'h0)]);
  assign wire136 = (((((wire5 ? wire4 : wire6) <= $unsigned(wire7)) ?
                           $signed({wire8, wire1}) : {(wire5 ?
                                   (8'hb3) : (8'ha5)),
                               $signed((8'ha2))}) ?
                       (($unsigned(wire135) << wire4) ?
                           $signed((wire1 == wire134)) : wire1) : $unsigned((+(~&(8'h9f))))) > ((wire2[(3'h4):(1'h0)] ?
                           ({wire2} ? (8'ha3) : $unsigned(wire7)) : wire1) ?
                       $unsigned((wire0[(4'h8):(1'h1)] | wire2[(4'he):(4'h9)])) : (((^wire135) ?
                           (!wire1) : $unsigned(wire6)) >> (~(-wire0)))));
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire116;
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire69,
                 wire40,
                 wire15,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire38,
                 wire116,
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
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire15 = wire12;
  always
    @(posedge clk) begin
      if ((wire11 & wire14[(3'h4):(2'h2)]))
        begin
          reg16 <= (-{wire10[(3'h5):(3'h5)], (~wire10[(2'h3):(2'h2)])});
          reg17 <= {$signed(($signed($unsigned(wire15)) & ($signed(reg16) * $signed(reg16)))),
              $signed(wire12[(1'h1):(1'h0)])};
        end
      else
        begin
          if (($unsigned($signed({reg16,
              $signed(reg17)})) <<< ((~(reg16[(1'h1):(1'h1)] * $signed(reg17))) ?
              $signed(((reg16 ? (8'hba) : wire10) ?
                  ((8'hb4) ?
                      (8'hb6) : (8'hbc)) : $signed(wire12))) : (-$unsigned(reg17[(3'h6):(1'h1)])))))
            begin
              reg16 <= ((wire15 | reg17[(3'h6):(3'h5)]) ?
                  wire11 : (wire10[(1'h0):(1'h0)] >>> {$unsigned($signed(wire12)),
                      $signed(((8'hb3) ? wire12 : reg17))}));
              reg17 <= wire11;
              reg18 <= (|$unsigned(wire13));
            end
          else
            begin
              reg16 <= reg16[(2'h3):(2'h2)];
              reg17 <= $signed($unsigned((&{(-(7'h44))})));
            end
          reg19 <= reg16[(1'h1):(1'h0)];
        end
      reg20 <= wire11;
    end
  assign wire21 = $signed($signed({reg18[(2'h2):(1'h1)]}));
  assign wire22 = wire15[(3'h6):(3'h5)];
  assign wire23 = $signed((8'hb7));
  assign wire24 = {wire22[(2'h3):(2'h2)]};
  assign wire25 = ((+(^~reg16[(2'h2):(1'h0)])) ?
                      (($unsigned($unsigned(wire13)) <<< ({reg19} >> $signed((8'ha7)))) ?
                          ($unsigned(wire15) ?
                              reg17[(3'h7):(3'h7)] : $unsigned((~&(8'hb5)))) : {wire12[(1'h1):(1'h0)],
                              wire13[(1'h0):(1'h0)]}) : wire23[(3'h5):(3'h5)]);
  module26 #() modinst39 (.wire28(reg19), .y(wire38), .wire27(wire21), .wire30(reg17), .wire29(reg20), .clk(clk));
  assign wire40 = $unsigned($signed($signed(($unsigned(reg16) * ((8'hbd) ?
                      (8'h9f) : (8'hb1))))));
  module41 #() modinst70 (wire69, clk, wire14, wire10, wire38, reg19);
  module71 #() modinst117 (wire116, clk, reg18, wire14, wire40, wire25);
  always
    @(posedge clk) begin
      if ($signed(((wire10 && (!{reg19})) ?
          ((&$unsigned(wire21)) ?
              $unsigned($unsigned(wire21)) : reg16[(1'h0):(1'h0)]) : $signed((!$unsigned(wire15))))))
        begin
          reg118 <= $unsigned(((-{(wire40 || wire15), wire22[(2'h3):(1'h0)]}) ?
              ({wire38} <<< $signed($signed(wire13))) : $signed($unsigned({reg18,
                  wire22}))));
          reg119 <= (~((8'hbd) ?
              ((wire24[(3'h7):(3'h7)] ? $signed(reg17) : reg16) ?
                  (wire38 >>> {wire21}) : ({wire40,
                      reg17} <<< wire10[(2'h2):(1'h1)])) : ({(reg18 ?
                      wire69 : reg19)} <<< $signed(reg17[(4'hb):(2'h2)]))));
          if (($signed($unsigned($signed(wire12))) ?
              $signed(wire10) : (wire38[(4'ha):(3'h6)] < (($unsigned(wire69) ?
                  {wire14} : $unsigned(wire25)) > wire22[(1'h0):(1'h0)]))))
            begin
              reg120 <= $unsigned(((reg119 ?
                      $signed(reg20) : {wire116[(5'h15):(5'h15)],
                          $unsigned(reg18)}) ?
                  $unsigned(reg118) : {wire24, wire116[(3'h7):(1'h0)]}));
              reg121 <= wire38[(4'hd):(1'h0)];
              reg122 <= wire10[(2'h3):(2'h3)];
              reg123 <= $signed($signed(wire24[(2'h2):(2'h2)]));
            end
          else
            begin
              reg120 <= ((!(~|($signed(wire13) && (wire15 & (8'h9c))))) ?
                  ({wire116[(4'h8):(1'h1)],
                          (reg118[(4'hb):(2'h3)] || {wire23})} ?
                      ((-{wire38}) ?
                          (^(~wire23)) : (8'haf)) : wire13) : wire38);
            end
          reg124 <= $unsigned(($unsigned((8'haf)) ?
              ($unsigned((8'ha0)) <<< (8'ha5)) : $unsigned(((reg122 > wire21) > reg16))));
        end
      else
        begin
          reg118 <= (wire21[(5'h13):(1'h1)] << wire25);
        end
      reg125 <= {($signed({((8'hac) ?
                  (7'h43) : wire15)}) <= $unsigned((-(~^(8'hb1)))))};
      reg126 <= wire22;
      reg127 <= reg126[(1'h0):(1'h0)];
    end
  assign wire128 = {(|$unsigned({$unsigned((8'hb3))})), {reg20[(3'h4):(1'h1)]}};
  assign wire129 = ((^~(wire22[(2'h2):(1'h0)] + $signed((wire25 < wire21)))) ?
                       ($signed((8'hb5)) ^~ reg19) : (wire69[(3'h5):(1'h1)] ?
                           (reg120 == wire40[(4'ha):(1'h0)]) : $unsigned(wire10[(4'hf):(3'h7)])));
  assign wire130 = $signed((((|$unsigned(reg123)) <= reg120[(1'h1):(1'h0)]) * $unsigned($signed($signed(reg124)))));
  assign wire131 = ($signed(wire128[(4'h9):(3'h7)]) ?
                       ((({wire21} ?
                               {reg127} : {reg19,
                                   reg119}) >>> $unsigned((~^reg125))) ?
                           $signed((^~(reg127 ?
                               wire21 : reg126))) : ($unsigned(reg122[(1'h1):(1'h0)]) | reg125)) : reg121);
endmodule

module module71
#(parameter param114 = {((8'hb3) ? (!{(!(8'hbb))}) : ((((8'ha3) ? (8'ha5) : (8'h9e)) ? (+(8'hb5)) : ((8'hb3) ? (8'ha9) : (8'hb6))) ? {((8'ha4) ? (7'h44) : (8'hb2)), ((8'hbe) ? (8'hbd) : (8'haf))} : ((~^(8'hb0)) <= (^~(8'h9d)))))}, 
parameter param115 = (^param114))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire75;
  input wire [(2'h3):(1'h0)] wire74;
  input wire [(4'he):(1'h0)] wire73;
  input wire [(3'h4):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire107,
                 wire106,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire84,
                 wire78,
                 wire77,
                 wire76,
                 reg109,
                 reg108,
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
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire76 = ($unsigned((($signed(wire75) ? $signed(wire74) : {wire72}) ?
                      ((~|(8'hb9)) ?
                          wire74[(1'h1):(1'h1)] : wire74[(2'h2):(1'h0)]) : wire72[(2'h3):(2'h3)])) << wire73[(4'hc):(3'h7)]);
  assign wire77 = $signed((wire72 ?
                      $signed({(-wire76)}) : ($signed($unsigned(wire72)) + (wire72[(1'h0):(1'h0)] ?
                          $unsigned(wire76) : $signed(wire72)))));
  assign wire78 = $signed(((&wire74[(2'h3):(2'h2)]) ^~ ($signed($unsigned((8'ha5))) && ($signed(wire76) ?
                      (~|wire77) : (8'ha1)))));
  always
    @(posedge clk) begin
      reg79 <= ((^wire77) == (~^($unsigned($unsigned(wire78)) ?
          (~&$unsigned(wire74)) : wire78[(2'h2):(1'h1)])));
      reg80 <= wire75[(4'h9):(3'h5)];
      reg81 <= wire75;
      reg82 <= ((&wire72[(2'h3):(2'h2)]) | $signed($signed(($signed(wire72) ?
          (wire75 ? reg80 : wire75) : $signed(wire74)))));
      reg83 <= (wire77 ?
          $signed((((wire78 >= reg82) ? (reg81 == wire72) : wire78) ?
              $signed(wire73[(4'hd):(3'h5)]) : $unsigned($signed(reg81)))) : $signed((wire78 ?
              wire72[(1'h1):(1'h1)] : wire74)));
    end
  assign wire84 = (reg82[(3'h6):(1'h0)] | wire76[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg85 <= (~$unsigned((~|(wire77[(2'h3):(2'h3)] && ((8'had) ?
          wire73 : wire73)))));
      reg86 <= wire75[(4'hb):(3'h4)];
      reg87 <= {((((^~wire75) >= ((7'h42) ?
              (8'ha7) : wire75)) ^ $signed((wire84 ?
              (8'had) : reg82))) - {((wire78 ? reg79 : reg83) ?
                  {wire84, (7'h41)} : reg79)}),
          reg86};
    end
  always
    @(posedge clk) begin
      reg88 <= (wire78[(3'h5):(1'h1)] ?
          ((7'h42) ?
              $unsigned(wire72[(3'h4):(1'h0)]) : wire72[(3'h4):(2'h2)]) : (&$unsigned(wire73[(4'h8):(3'h4)])));
    end
  assign wire89 = reg82;
  assign wire90 = wire75;
  assign wire91 = $unsigned(({(|reg83[(3'h4):(3'h4)])} >> reg79));
  assign wire92 = ($unsigned(reg87[(3'h4):(1'h0)]) - (reg87 | $signed(((wire72 ?
                      reg80 : wire76) ~^ {reg81, reg87}))));
  always
    @(posedge clk) begin
      if (wire84[(3'h6):(1'h0)])
        begin
          reg93 <= $unsigned($unsigned(wire73[(1'h1):(1'h0)]));
        end
      else
        begin
          reg93 <= (+reg86[(4'h9):(4'h9)]);
          if ((($unsigned(reg86[(5'h10):(1'h0)]) ?
              reg88 : $unsigned({(reg82 ? (8'hab) : wire92),
                  (wire74 | wire90)})) | $signed($unsigned({$signed(reg93),
              wire91}))))
            begin
              reg94 <= (|$unsigned($unsigned($signed(reg80))));
            end
          else
            begin
              reg94 <= (wire72[(3'h4):(2'h2)] ?
                  (~&wire78[(2'h3):(1'h1)]) : (!reg82));
              reg95 <= $unsigned($signed(wire72));
            end
          reg96 <= $unsigned({{$unsigned((+wire74))},
              (!{wire90, (reg93 ? reg85 : wire77)})});
          reg97 <= (&reg96[(3'h4):(1'h1)]);
          reg98 <= $unsigned(($unsigned($signed(reg94)) - (reg93[(4'he):(3'h5)] << reg87[(4'hf):(2'h2)])));
        end
      if ($unsigned(wire89[(4'hb):(4'hb)]))
        begin
          reg99 <= ($signed($signed(($unsigned(wire78) - (reg97 ?
              reg95 : (8'ha2))))) <= ((8'hbf) >= (wire76 == reg83)));
          reg100 <= reg95;
        end
      else
        begin
          reg99 <= {$unsigned(wire75), (-wire92)};
          reg100 <= $signed((^$signed(wire75)));
          if (($signed((~&((reg99 ^ wire78) > (8'hb7)))) && (($signed((reg83 ?
                  wire92 : (7'h44))) <<< ((^wire73) <= (wire76 ?
                  reg93 : wire92))) ?
              reg79[(1'h0):(1'h0)] : reg97[(2'h3):(2'h2)])))
            begin
              reg101 <= (+($signed((^~reg96[(3'h6):(3'h4)])) ?
                  ($signed({reg82}) ?
                      reg95[(4'h8):(1'h0)] : ((~&reg80) > $signed(wire91))) : $signed(wire90[(2'h3):(1'h1)])));
              reg102 <= reg85;
            end
          else
            begin
              reg101 <= $signed($unsigned((~|((~|wire75) ?
                  $unsigned(wire75) : {reg99, reg99}))));
              reg102 <= reg85[(2'h2):(1'h0)];
              reg103 <= reg95;
              reg104 <= (~(8'hbd));
            end
          reg105 <= (^~(^$signed($signed((reg104 <<< reg79)))));
        end
    end
  assign wire106 = $signed(((8'ha4) ?
                       $unsigned(((~(7'h43)) != (~|reg93))) : {$unsigned($unsigned(reg95))}));
  assign wire107 = (+(wire77[(2'h3):(1'h0)] ? reg97 : reg99[(5'h14):(5'h11)]));
  always
    @(posedge clk) begin
      reg108 <= $unsigned(wire89);
      reg109 <= reg102;
    end
  assign wire110 = ($unsigned(reg101[(3'h7):(3'h6)]) ?
                       (reg98 >= wire106) : reg87);
  assign wire111 = {$signed(reg108)};
  assign wire112 = {(reg83[(4'hc):(1'h0)] * reg96[(4'hd):(3'h7)])};
  assign wire113 = $signed((wire111 ?
                       (reg105 ?
                           $signed(((8'hb6) ? wire110 : wire84)) : {wire78,
                               (reg82 || reg95)}) : ((wire92[(2'h3):(2'h3)] ?
                           reg103 : reg109[(1'h1):(1'h1)]) >= wire110[(3'h4):(1'h1)])));
endmodule

module module41
#(parameter param68 = ((+((((8'hae) ? (8'ha7) : (7'h41)) >> (&(8'h9f))) ? {((8'hba) & (8'h9d))} : (~(&(8'h9d))))) ? (~{((|(8'hbe)) != ((8'hac) ~^ (8'ha6)))}) : (((^~(|(8'hbd))) < (~|((8'ha9) ? (8'ha2) : (8'h9f)))) >> {(((8'ha6) <<< (8'h9f)) ^~ {(8'ha7), (8'ha3)})})))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(5'h12):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire43;
  input wire [(2'h3):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire46;
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg65,
                 reg64,
                 reg63,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire46 = {wire43[(2'h2):(1'h0)],
                      (wire42[(2'h3):(2'h2)] ?
                          (8'haf) : ($unsigned({wire43, wire45}) ?
                              wire45 : $unsigned(((7'h43) | wire44))))};
  assign wire47 = $signed(wire42[(1'h0):(1'h0)]);
  assign wire48 = ((!$unsigned((+wire47))) ?
                      (!(-{$unsigned(wire47),
                          (!wire43)})) : wire47[(3'h7):(1'h1)]);
  assign wire49 = wire48;
  assign wire50 = wire45[(2'h3):(2'h2)];
  assign wire51 = (wire47 ?
                      $unsigned($unsigned($signed((!wire48)))) : (wire42[(1'h0):(1'h0)] ?
                          wire47 : $signed((^~(wire43 <= wire47)))));
  assign wire52 = (~wire47[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg53 <= $unsigned({wire44[(5'h11):(3'h5)]});
      reg54 <= $unsigned($signed($unsigned((((8'hbd) | reg53) ?
          $signed(wire49) : $signed(wire42)))));
      reg55 <= (wire49 ^ $unsigned(wire43));
      reg56 <= ((~^$signed(reg54)) ?
          $signed($signed(wire45)) : $signed({wire45[(4'ha):(2'h3)]}));
    end
  assign wire57 = ($unsigned((wire47[(2'h2):(1'h1)] < wire52[(2'h3):(1'h0)])) ?
                      (~|wire48) : ((^((reg54 * wire48) ?
                          (wire49 || reg54) : (reg55 ?
                              wire49 : wire51))) | (-wire46[(3'h5):(2'h3)])));
  assign wire58 = $signed(wire48[(1'h1):(1'h0)]);
  assign wire59 = (~|reg55[(3'h5):(3'h5)]);
  assign wire60 = (~&(wire49[(2'h2):(1'h1)] == reg56));
  assign wire61 = ((+wire57[(4'hf):(4'he)]) >= wire60[(1'h0):(1'h0)]);
  assign wire62 = (^$signed(wire58[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg63 <= ($unsigned((($signed((8'hbf)) + wire44[(3'h7):(2'h2)]) * (^(7'h41)))) ?
          (~&(wire59[(3'h6):(2'h2)] ?
              ($unsigned(wire42) != wire47) : wire50)) : wire61);
      reg64 <= (wire62 <<< {wire42});
      reg65 <= $unsigned((!(^wire48[(4'h9):(2'h2)])));
    end
  assign wire66 = (|($signed(wire43[(2'h3):(1'h0)]) ?
                      (wire52 ?
                          wire58 : ((^~wire48) ?
                              $unsigned(wire58) : wire61[(4'h8):(3'h7)])) : reg65));
  assign wire67 = wire59;
endmodule

module module26
#(parameter param37 = (8'haf))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  assign y = {wire34, wire33, wire32, wire31, reg36, reg35, (1'h0)};
  assign wire31 = ({$unsigned((&{wire28})), wire28} != wire30);
  assign wire32 = (((|wire30[(1'h0):(1'h0)]) ?
                      ({{wire27, (7'h42)},
                          (wire27 ?
                              wire29 : wire28)} <<< wire29) : ((&(wire27 == wire30)) ?
                          ($unsigned(wire30) ?
                              wire31[(4'hb):(1'h1)] : wire29[(3'h5):(2'h2)]) : wire27[(1'h1):(1'h0)])) >>> (wire29 | $unsigned(($signed(wire29) >>> wire27[(4'hd):(4'hc)]))));
  assign wire33 = (^(((|$unsigned(wire29)) ? wire30 : wire28) | wire30));
  assign wire34 = ({$unsigned({(wire27 ? (7'h42) : (8'hac)),
                          $unsigned(wire33)}),
                      {(wire31[(3'h6):(1'h0)] ?
                              (wire27 || (8'hb8)) : $unsigned((8'h9c))),
                          wire30}} && ($signed(wire29) - {$signed($unsigned(wire31))}));
  always
    @(posedge clk) begin
      reg35 <= $unsigned(wire34);
      reg36 <= wire29[(1'h0):(1'h0)];
    end
endmodule
