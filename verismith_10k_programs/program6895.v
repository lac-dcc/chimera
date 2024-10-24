module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire117;
  wire [(5'h11):(1'h0)] wire116;
  wire [(3'h7):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  assign y = {wire117, wire116, wire115, wire113, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire2[(4'h9):(2'h2)];
  assign wire5 = wire0[(3'h5):(1'h1)];
  assign wire6 = (wire1[(1'h1):(1'h1)] ?
                     ((|wire3) | (8'hb6)) : ($signed(($signed(wire0) > ((8'haf) ?
                         (8'hb4) : wire5))) == wire0));
  module7 #() modinst114 (wire113, clk, wire4, wire3, wire2, wire0);
  assign wire115 = wire3[(4'hd):(1'h0)];
  assign wire116 = $signed((~|{wire115[(3'h4):(2'h2)],
                       (wire3 ? {wire6} : (wire0 ? wire0 : wire6))}));
  assign wire117 = wire5;
endmodule

module module7
#(parameter param112 = (({{((8'ha8) ^ (8'hac)), ((8'hb3) ~^ (8'ha7))}} < {((&(8'hbe)) ? ((8'haf) - (7'h44)) : ((8'hb9) ? (8'h9f) : (8'ha6))), (((7'h43) * (8'hbe)) - {(7'h40), (8'hac)})}) >>> (7'h44)))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire63;
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  assign y = {wire110,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire82,
                 wire67,
                 wire66,
                 wire65,
                 wire27,
                 wire13,
                 wire12,
                 wire63,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  assign wire12 = (((^$signed({wire11})) ?
                      wire9[(1'h1):(1'h0)] : wire9[(4'ha):(4'h9)]) <<< ((($signed(wire11) ?
                      {wire9, (7'h41)} : wire10) + {$unsigned(wire11),
                      wire10}) && ($signed({wire11, (7'h40)}) ?
                      ((wire10 - (8'h9c)) & (wire11 ~^ wire8)) : (wire11[(2'h3):(1'h1)] ?
                          ((8'ha4) ? (8'h9d) : wire8) : wire8))));
  assign wire13 = $unsigned((($unsigned((^~wire11)) ^~ {(wire12 ?
                          wire9 : wire11)}) <= ({(wire10 ~^ wire12)} ?
                      wire12[(4'ha):(4'h8)] : ($signed(wire12) && (wire8 & wire8)))));
  module14 #() modinst28 (.wire17(wire12), .wire19(wire9), .wire18(wire8), .clk(clk), .y(wire27), .wire16(wire11), .wire15(wire10));
  always
    @(posedge clk) begin
      reg29 <= (((^~((|(8'ha8)) ?
          $signed(wire8) : $signed((8'ha0)))) <= ({(wire8 ? wire10 : wire12),
          (wire11 ?
              wire27 : wire9)} * $signed({wire12}))) <<< $unsigned($unsigned(($unsigned((8'hb3)) || ((8'hb9) <<< wire10)))));
      reg30 <= wire10;
      if ($unsigned(((~$signed((~^wire9))) & ($unsigned((~reg30)) != (!(wire8 < reg30))))))
        begin
          if ((8'ha2))
            begin
              reg31 <= (~($unsigned($unsigned($signed(wire10))) ?
                  $unsigned($unsigned($signed((8'ha0)))) : ((~((8'haa) >> reg30)) <<< ($unsigned(reg30) ?
                      $unsigned(wire9) : ((8'hbc) << wire8)))));
              reg32 <= $unsigned({$unsigned($unsigned(((8'hb1) ?
                      wire11 : wire8)))});
              reg33 <= (reg31 | $signed($unsigned($signed({(8'hb9), wire12}))));
              reg34 <= (!(reg29[(1'h1):(1'h1)] >> wire12[(1'h0):(1'h0)]));
            end
          else
            begin
              reg31 <= (^~(-$signed((~&$unsigned(wire12)))));
              reg32 <= $signed(reg33);
              reg33 <= reg33[(4'hd):(1'h0)];
              reg34 <= ($unsigned(wire12) ?
                  (^~($unsigned($unsigned(wire27)) > ((reg31 ? wire9 : reg32) ?
                      (reg30 < wire12) : (reg30 >= reg33)))) : ((reg33 ?
                      ($unsigned(wire27) == wire10[(3'h7):(2'h2)]) : reg29[(4'h9):(3'h7)]) + ($signed($signed(reg34)) * wire10[(1'h0):(1'h0)])));
            end
          if ((wire9 <= wire10))
            begin
              reg35 <= reg32[(2'h2):(1'h1)];
              reg36 <= (wire13 <= (((!$signed(reg30)) ?
                      $signed((wire11 ? reg29 : reg33)) : ($unsigned(wire11) ?
                          wire12 : reg32)) ?
                  $unsigned({(reg29 || wire9)}) : $unsigned($unsigned(reg29))));
              reg37 <= wire9;
              reg38 <= (reg31 - wire12[(5'h12):(5'h11)]);
              reg39 <= $unsigned(reg37[(2'h2):(1'h1)]);
            end
          else
            begin
              reg35 <= reg37;
              reg36 <= {$unsigned($signed((~^reg35[(5'h10):(4'he)])))};
              reg37 <= $unsigned({$signed((reg39 >= wire9[(3'h7):(3'h7)])),
                  (reg32 < (-wire8[(5'h10):(4'hc)]))});
              reg38 <= $unsigned({((reg35 ? {reg34} : (!wire12)) ?
                      wire12 : (reg29[(3'h4):(1'h1)] ?
                          (wire10 ? reg36 : wire9) : $signed((8'hb7)))),
                  reg36});
              reg39 <= reg38;
            end
        end
      else
        begin
          if ({$signed($signed($signed(reg33[(4'h9):(3'h5)]))),
              ($signed($unsigned(reg34[(2'h3):(2'h2)])) * {$unsigned(reg37),
                  $unsigned(reg32[(1'h0):(1'h0)])})})
            begin
              reg31 <= (|{reg39});
              reg32 <= (reg33[(4'hd):(4'hd)] ? reg31[(2'h2):(2'h2)] : reg38);
              reg33 <= ((wire8 ? wire12[(2'h3):(2'h3)] : wire10) ?
                  $signed(reg32[(2'h2):(1'h1)]) : $unsigned($signed($signed((reg38 - wire8)))));
              reg34 <= $unsigned($signed(reg37));
              reg35 <= (((reg30[(3'h4):(2'h3)] | wire10[(2'h2):(2'h2)]) ?
                  $unsigned(reg32) : ((~wire11[(3'h5):(1'h0)]) ?
                      (!(wire12 << reg31)) : $unsigned($unsigned((8'h9d))))) | reg36[(4'he):(3'h7)]);
            end
          else
            begin
              reg31 <= (+wire10[(3'h7):(1'h0)]);
              reg32 <= reg32;
              reg33 <= reg37[(4'h9):(1'h1)];
              reg34 <= (((|reg33[(4'h9):(3'h7)]) ?
                      $signed(wire9) : (&(~$unsigned(reg39)))) ?
                  ({reg34[(2'h2):(1'h1)],
                          ((reg29 ? (8'ha2) : wire8) ?
                              $unsigned(reg34) : ((8'ha5) << (8'hbd)))} ?
                      wire12[(2'h2):(1'h0)] : wire27[(4'h8):(3'h5)]) : {reg36[(3'h4):(3'h4)]});
              reg35 <= (reg30[(1'h0):(1'h0)] > ($signed(((!reg30) ?
                      reg30[(3'h4):(2'h3)] : (wire8 & reg29))) ?
                  ({$unsigned(wire13)} << (~^(reg33 ?
                      reg38 : reg33))) : wire11[(1'h1):(1'h0)]));
            end
          reg36 <= $unsigned($signed(((^$unsigned((8'hbb))) ?
              (+wire10) : $signed(((8'haa) * (7'h43))))));
        end
      reg40 <= {$signed(reg29)};
    end
  module41 #() modinst64 (wire63, clk, wire11, reg38, reg36, wire13, wire8);
  assign wire65 = {((~|(&reg31[(4'h9):(1'h1)])) > $unsigned(wire9))};
  assign wire66 = (~|(~wire65[(5'h11):(3'h4)]));
  assign wire67 = wire13;
  module68 #() modinst83 (wire82, clk, wire27, wire63, reg34, wire65, wire13);
  always
    @(posedge clk) begin
      reg84 <= $signed(reg32);
      reg85 <= (reg31[(4'ha):(4'h8)] >> $signed(wire82));
      reg86 <= {wire13, (wire9[(4'h9):(3'h7)] ^ wire13[(3'h4):(3'h4)])};
      reg87 <= ($unsigned({(^wire13[(1'h1):(1'h1)])}) * $signed($signed({((8'hb2) ?
              reg31 : wire11)})));
    end
  assign wire88 = wire82;
  assign wire89 = reg38[(4'h8):(1'h0)];
  assign wire90 = reg84;
  assign wire91 = reg87;
  assign wire92 = wire65[(5'h10):(3'h7)];
  module93 #() modinst111 (.y(wire110), .wire96(reg86), .wire95(wire27), .clk(clk), .wire94(wire89), .wire97(reg39));
endmodule

module module93
#(parameter param109 = ((~^(~^(~&(~(8'hae))))) ? {(((|(8'hba)) && ((8'ha1) << (8'hbb))) ? {(~|(8'hab))} : (^~(~(8'hb3))))} : (8'haf)))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire97;
  input wire signed [(3'h7):(1'h0)] wire96;
  input wire signed [(2'h2):(1'h0)] wire95;
  input wire [(3'h7):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg106,
                 (1'h0)};
  assign wire98 = ((wire96[(2'h2):(1'h0)] | $signed($signed(wire95[(2'h2):(1'h0)]))) ?
                      wire97 : wire94);
  assign wire99 = wire96[(3'h6):(3'h6)];
  assign wire100 = wire94[(1'h0):(1'h0)];
  assign wire101 = wire95;
  assign wire102 = wire98;
  assign wire103 = (7'h43);
  assign wire104 = $unsigned(({(^~(wire102 > (7'h43))),
                       (wire95 ?
                           {wire94} : wire102[(2'h2):(1'h1)])} <<< {wire97}));
  assign wire105 = {$signed(((7'h43) * (^$unsigned(wire99))))};
  always
    @(posedge clk) begin
      reg106 <= wire96;
    end
  assign wire107 = wire95;
  assign wire108 = {(8'h9e)};
endmodule

module module68
#(parameter param81 = (~(~^((8'ha3) ? {((7'h44) ? (8'hb4) : (8'ha8)), (!(8'ha9))} : (~|((8'hb7) ? (8'ha6) : (8'hbc)))))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire73;
  input wire [(4'hf):(1'h0)] wire72;
  input wire [(5'h15):(1'h0)] wire71;
  input wire [(5'h15):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  assign y = {wire80, wire79, wire78, wire77, wire76, wire75, wire74, (1'h0)};
  assign wire74 = $signed($unsigned(wire72));
  assign wire75 = wire73;
  assign wire76 = ($signed((!(~(wire69 - wire70)))) ?
                      $unsigned(wire69) : $signed($unsigned($unsigned($signed(wire70)))));
  assign wire77 = wire72;
  assign wire78 = ((wire72[(4'hf):(1'h0)] < (($unsigned(wire74) ^ (wire70 - (8'haa))) ?
                      (wire74 | ((8'h9d) ~^ wire71)) : (&(~|(8'hb0))))) + $signed(wire74[(5'h13):(5'h11)]));
  assign wire79 = $signed(($signed(wire72) ?
                      $unsigned((~^$unsigned(wire78))) : wire72));
  assign wire80 = (wire75 ?
                      wire78[(1'h0):(1'h0)] : (wire70 >>> wire73[(4'hb):(3'h7)]));
endmodule

module module41
#(parameter param62 = ((~(~^(((8'hb6) ? (8'hb4) : (8'ha4)) >> ((7'h42) ? (8'h9c) : (8'hb3))))) < (+(((!(8'hbe)) ? ((8'ha4) != (8'hb3)) : {(8'hb1), (8'ha3)}) ? (((7'h44) ? (8'hbf) : (8'hae)) & ((8'ha6) ? (8'h9f) : (7'h40))) : ((^~(8'ha4)) ? ((8'h9f) << (8'hb3)) : ((8'hbd) >>> (8'ha6)))))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire46;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire [(2'h3):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire43;
  input wire [(5'h14):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire47 = $unsigned((($signed((|(8'hb8))) & (~^(wire45 ?
                          wire42 : (8'hb8)))) ?
                      wire42 : ((8'ha7) != wire46[(4'he):(4'hd)])));
  assign wire48 = (((~$signed(wire47)) ^ (((8'ha4) && $signed(wire43)) - $unsigned((wire46 <<< wire43)))) ?
                      wire44[(1'h0):(1'h0)] : wire47[(1'h0):(1'h0)]);
  assign wire49 = ({wire48[(4'h9):(2'h2)],
                          ($signed(wire45[(3'h7):(1'h0)]) - (((8'hab) ?
                              wire48 : wire46) >> (wire48 & wire42)))} ?
                      wire45 : $unsigned($signed(({wire42} ?
                          wire42[(5'h12):(1'h0)] : $unsigned(wire44)))));
  assign wire50 = {{(^~$signed(wire43))}, (8'h9c)};
  assign wire51 = wire45;
  always
    @(posedge clk) begin
      reg52 <= $unsigned(wire51);
      reg53 <= $signed($unsigned($unsigned(((~wire51) ?
          ((7'h40) | (7'h43)) : wire45[(1'h0):(1'h0)]))));
      reg54 <= (&wire49);
      reg55 <= $signed(($unsigned((^wire48[(4'h8):(2'h2)])) ?
          (^~wire47) : $unsigned(reg52[(2'h2):(1'h1)])));
      if ((~&((wire46[(4'hf):(1'h0)] ?
          $signed((reg53 >= wire50)) : ((wire49 || wire50) > (wire44 >> reg54))) == {$signed((reg55 ?
              (8'hb6) : wire46)),
          wire51})))
        begin
          reg56 <= {(wire42 ?
                  ((8'ha4) >> reg54[(2'h3):(1'h0)]) : ((+wire46) ^ reg54)),
              wire42[(1'h1):(1'h1)]};
          if ($unsigned($unsigned(($unsigned((wire48 ?
              wire49 : (8'haf))) <= wire42[(4'hf):(1'h0)]))))
            begin
              reg57 <= $unsigned($signed((((!(8'ha6)) >= (reg54 || wire48)) <= (8'ha0))));
            end
          else
            begin
              reg57 <= $unsigned(($unsigned($signed({(8'haf)})) ?
                  $signed($unsigned($unsigned(wire47))) : (8'hb7)));
              reg58 <= $unsigned($unsigned(reg57[(4'hb):(2'h3)]));
            end
        end
      else
        begin
          reg56 <= wire50[(1'h1):(1'h0)];
        end
    end
  assign wire59 = (&$unsigned(wire48));
  assign wire60 = wire44;
  assign wire61 = ((wire45[(2'h3):(1'h1)] | (-(~|$unsigned(wire60)))) | reg52);
endmodule

module module14
#(parameter param26 = (^~(~(8'h9d))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  assign y = {wire25, wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = wire17[(4'ha):(1'h0)];
  assign wire21 = ((~$unsigned(wire16)) ?
                      (8'hb8) : (wire16 ?
                          $unsigned({(^wire19),
                              {wire19, wire20}}) : wire16[(1'h1):(1'h0)]));
  assign wire22 = ((~(8'ha8)) ?
                      {{(|(wire21 ? wire20 : wire16)),
                              (wire19 && (^wire19))}} : (((((8'hb8) ?
                              (8'h9e) : wire19) ?
                          (~&wire19) : (|wire21)) >= {(+wire16),
                          (|wire15)}) - $signed(({wire19} ?
                          (wire16 ? wire18 : wire21) : (wire15 != wire18)))));
  assign wire23 = {($signed({(wire21 ? wire15 : wire19),
                          (8'hb1)}) >> ((~(-wire21)) | wire15))};
  assign wire24 = $signed(wire19[(2'h2):(2'h2)]);
  assign wire25 = wire22;
endmodule
