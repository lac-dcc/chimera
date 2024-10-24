module top
#(parameter param143 = {(+(|{(~|(8'haf))})), (~&((~^(~^(8'hb9))) <<< (~&(~(8'hb1)))))}, 
parameter param144 = {({(~^(param143 ? param143 : param143))} < {param143, ((~&param143) ^~ (param143 ? param143 : (8'hbe)))}), param143})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(5'h12):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire139,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire4,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire4 = {(^~{wire0})};
  module5 #() modinst89 (.y(wire88), .wire7(wire3), .wire6(wire1), .wire9(wire4), .clk(clk), .wire8(wire0));
  assign wire90 = $unsigned(wire2);
  assign wire91 = $signed((|wire88[(2'h3):(1'h0)]));
  assign wire92 = ((^~(^$unsigned(wire4[(3'h6):(2'h3)]))) * wire4[(1'h0):(1'h0)]);
  assign wire93 = ((wire0 > (wire3 != (!(^~wire1)))) ?
                      ((~|(8'hae)) ^ $signed(wire0[(3'h4):(3'h4)])) : $unsigned(wire3));
  assign wire94 = $signed(wire4);
  always
    @(posedge clk) begin
      reg95 <= wire94;
      reg96 <= (($unsigned((~^(reg95 ?
              wire90 : wire93))) >>> $unsigned(wire93)) ?
          ((wire4[(1'h1):(1'h0)] ^ wire94[(4'hc):(3'h5)]) >> (~wire91)) : $unsigned(($signed((~wire93)) ?
              {(wire0 ^~ reg95)} : {(~&reg95)})));
      reg97 <= wire91;
      reg98 <= $unsigned(reg96[(2'h3):(1'h1)]);
      reg99 <= $signed(wire94[(4'hc):(3'h4)]);
    end
  module100 #() modinst140 (.clk(clk), .wire101(wire3), .y(wire139), .wire103(reg95), .wire104(reg97), .wire102(wire94));
  assign wire141 = (reg96 <= (wire3 <<< $signed((~wire2[(3'h6):(1'h1)]))));
  assign wire142 = ($unsigned($unsigned($signed($signed((8'ha7))))) | {$signed(($signed(reg98) ?
                           $unsigned(wire0) : (^~reg96))),
                       (wire141[(4'ha):(4'h8)] ^ {{reg98}})});
endmodule

module module100  (y, clk, wire101, wire102, wire103, wire104);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire101;
  input wire [(4'ha):(1'h0)] wire102;
  input wire signed [(2'h3):(1'h0)] wire103;
  input wire signed [(2'h2):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(3'h7):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire135;
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire105,
                 wire106,
                 wire108,
                 wire109,
                 wire135,
                 reg107,
                 (1'h0)};
  assign wire105 = (!wire101);
  assign wire106 = (|$signed($unsigned(({wire101} << $unsigned(wire102)))));
  always
    @(posedge clk) begin
      reg107 <= {(8'hb6)};
    end
  assign wire108 = wire104[(1'h1):(1'h0)];
  assign wire109 = (^~$signed(reg107));
  module110 #() modinst136 (wire135, clk, wire109, wire102, reg107, wire105);
  assign wire137 = (-wire104[(1'h1):(1'h0)]);
  assign wire138 = wire135;
endmodule

module module5
#(parameter param87 = ({((((8'hab) <<< (8'haf)) ? ((8'ha5) ^ (8'ha2)) : (~|(8'ha9))) ? {(~&(8'h9f))} : (!(|(8'hae))))} ? ((&((|(8'ha4)) < ((8'ha0) == (8'hb9)))) >>> (((^(8'ha7)) ? ((8'ha1) ? (7'h42) : (8'ha8)) : ((7'h40) ? (8'ha0) : (8'h9e))) == (|{(8'hba), (8'hba)}))) : {((((8'ha4) > (8'hb4)) && ((8'hbf) ? (7'h44) : (8'hb6))) ? (-(~|(8'h9d))) : ({(8'hb8)} && (+(8'ha9)))), ((~(7'h42)) ? {{(8'hb3)}} : (~^((8'hb9) ^~ (8'hb9))))}))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire80;
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire55,
                 wire11,
                 wire10,
                 wire57,
                 wire58,
                 wire80,
                 (1'h0)};
  assign wire10 = ((8'hae) ?
                      (wire9[(3'h5):(1'h0)] ^ ((wire6[(4'ha):(4'ha)] <<< (8'hbe)) | (((8'ha7) != wire9) < (wire9 & wire9)))) : wire8);
  assign wire11 = wire9[(2'h2):(2'h2)];
  module12 #() modinst56 (.clk(clk), .y(wire55), .wire13(wire8), .wire17(wire11), .wire14(wire9), .wire16(wire6), .wire15(wire10));
  assign wire57 = (wire10[(5'h10):(4'h9)] <= wire9[(3'h7):(1'h1)]);
  assign wire58 = {$unsigned(($unsigned($unsigned((8'ha9))) ?
                          $signed((7'h44)) : wire57[(3'h5):(3'h4)]))};
  module59 #() modinst81 (.y(wire80), .wire61(wire58), .clk(clk), .wire63(wire9), .wire64(wire7), .wire62(wire57), .wire60(wire11));
  assign wire82 = $unsigned(wire7);
  assign wire83 = wire8;
  assign wire84 = $unsigned((~&({wire8} - wire82[(3'h4):(3'h4)])));
  assign wire85 = wire58[(4'hb):(3'h5)];
  assign wire86 = ((8'h9d) ?
                      ((!$signed($unsigned(wire9))) & wire84) : ({$signed((wire58 || wire80)),
                          wire6} | (~$unsigned((wire9 == wire8)))));
endmodule

module module59
#(parameter param79 = {(~&(~(^(!(8'ha4))))), {(~|(&((8'haa) <<< (8'ha2))))}})
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire64;
  input wire [(5'h10):(1'h0)] wire63;
  input wire [(4'hc):(1'h0)] wire62;
  input wire signed [(5'h12):(1'h0)] wire61;
  input wire [(3'h7):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  assign y = {wire78,
                 wire77,
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
                 (1'h0)};
  assign wire65 = wire62[(2'h3):(1'h0)];
  assign wire66 = $signed(wire64[(3'h5):(1'h0)]);
  assign wire67 = (|{(~|((!(8'h9d)) == (wire60 ? wire66 : wire64))), wire66});
  assign wire68 = (~^wire62);
  assign wire69 = (wire60[(2'h2):(1'h0)] >> (~|$unsigned(wire68[(1'h0):(1'h0)])));
  assign wire70 = (^(((((8'ha2) ? wire63 : wire63) & (~^wire68)) ?
                      (8'hb3) : ($signed(wire66) >>> (wire66 ?
                          (8'hae) : wire65))) + $signed((8'ha3))));
  assign wire71 = ((-(((wire61 + wire61) - $unsigned((8'hb3))) ?
                      wire70 : ($unsigned(wire64) ?
                          $unsigned(wire66) : {wire60, wire63}))) - (8'ha6));
  assign wire72 = wire70;
  assign wire73 = (wire66[(3'h6):(3'h6)] ^ wire68);
  assign wire74 = $signed((-wire73));
  assign wire75 = wire73[(3'h7):(1'h1)];
  assign wire76 = wire63[(4'h8):(2'h3)];
  assign wire77 = (|wire68[(3'h4):(2'h3)]);
  assign wire78 = (~^wire61[(4'hd):(3'h7)]);
endmodule

module module12
#(parameter param53 = (((^~(|(8'ha6))) > (~&(((7'h40) ? (8'ha2) : (8'h9e)) ? ((8'haa) << (8'ha1)) : (~^(8'hb4))))) || (7'h43)), 
parameter param54 = (-param53))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire [(4'hc):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg52,
                 reg51,
                 reg47,
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
                 (1'h0)};
  assign wire18 = $unsigned($signed($unsigned(wire16)));
  assign wire19 = $signed({(^$unsigned(wire15[(1'h0):(1'h0)])),
                      $signed(($signed(wire18) ?
                          $signed(wire13) : (wire18 <= (8'had))))});
  assign wire20 = ((wire17[(3'h5):(1'h0)] ?
                      wire15[(1'h0):(1'h0)] : wire13[(2'h2):(1'h1)]) ~^ wire13);
  assign wire21 = $unsigned(wire20[(3'h4):(2'h3)]);
  assign wire22 = ($unsigned(($signed($signed(wire18)) ~^ wire13[(1'h0):(1'h0)])) * (&(~(wire14 >>> wire13))));
  assign wire23 = $unsigned($unsigned(wire18));
  always
    @(posedge clk) begin
      reg24 <= wire19;
      reg25 <= wire15;
      reg26 <= (wire16 == (((((8'haf) >> wire18) ^~ (wire20 || wire17)) + $unsigned((wire23 == wire18))) | (-((wire14 ?
              wire18 : (8'hb8)) ?
          ((8'h9e) ? (8'hae) : wire16) : wire23[(3'h4):(2'h3)]))));
      reg27 <= ((reg26 ?
              (((wire17 + wire23) >> (wire17 ? wire19 : (8'hab))) ?
                  $unsigned((wire23 == (7'h42))) : ($signed(wire13) ?
                      wire21[(2'h3):(2'h3)] : $unsigned(wire21))) : wire17[(2'h3):(1'h1)]) ?
          wire16 : ($signed(reg24[(2'h2):(1'h0)]) ?
              (wire21[(3'h7):(3'h4)] ?
                  (-$signed(wire17)) : wire23) : ($unsigned($signed(wire18)) != ((wire16 || (7'h41)) ?
                  wire16[(3'h4):(1'h0)] : (8'ha7)))));
      if ({wire13[(1'h1):(1'h0)]})
        begin
          reg28 <= wire14[(3'h5):(2'h2)];
          if ((wire15 ? wire17 : reg24))
            begin
              reg29 <= wire20[(1'h1):(1'h1)];
              reg30 <= (wire19[(4'he):(3'h4)] && wire15[(1'h1):(1'h1)]);
              reg31 <= reg24[(1'h0):(1'h0)];
              reg32 <= (wire22[(2'h3):(2'h3)] ?
                  $unsigned((wire18[(5'h10):(4'he)] ?
                      $signed($unsigned((7'h40))) : $signed({(8'hab),
                          wire18}))) : ($signed($unsigned((reg31 ?
                      (8'had) : reg28))) << wire18[(2'h3):(1'h0)]));
              reg33 <= ({(wire19[(5'h11):(3'h6)] ?
                          (((8'haa) ?
                              reg30 : reg27) >= $unsigned(wire16)) : ((8'hb5) ?
                              $signed(reg31) : $unsigned((8'ha5))))} ?
                  ({$unsigned(reg24[(2'h2):(1'h1)]),
                          ((~&wire14) ? {wire22, (8'h9c)} : {wire20, wire20})} ?
                      wire22[(1'h1):(1'h1)] : (!{{wire20}})) : (((^{wire15,
                      reg29}) <= (reg28[(3'h4):(1'h0)] ?
                      wire20 : reg32[(1'h0):(1'h0)])) ^ reg27));
            end
          else
            begin
              reg29 <= {(&reg28[(3'h4):(1'h1)]), reg26};
              reg30 <= $unsigned((8'hba));
              reg31 <= (^(8'hb0));
              reg32 <= $unsigned({(($signed(wire21) ?
                          (wire20 ? (7'h41) : reg29) : (wire14 ?
                              reg26 : wire16)) ?
                      wire17 : (&$unsigned(wire15))),
                  $unsigned(((~|reg25) ?
                      $signed(reg27) : (wire13 ? reg31 : reg28)))});
            end
          if (wire20)
            begin
              reg34 <= reg31;
              reg35 <= reg25[(3'h6):(3'h5)];
            end
          else
            begin
              reg34 <= ($signed((!$signed($signed((8'haf))))) * ($signed(((8'hb8) == reg34[(1'h0):(1'h0)])) ?
                  $unsigned($signed((~|reg30))) : {($signed((7'h41)) ?
                          (reg32 >= reg30) : $unsigned(reg33))}));
              reg35 <= ($signed({(^~(reg29 << wire14))}) ?
                  {$unsigned(((reg29 != wire13) ?
                          wire13[(2'h3):(1'h1)] : (wire18 ?
                              wire21 : wire22)))} : (^~reg34[(1'h0):(1'h0)]));
              reg36 <= {wire17[(3'h4):(1'h1)],
                  ({((&wire14) ^~ $signed(wire19)), (~(7'h42))} ?
                      ((wire16 == wire19[(4'ha):(3'h5)]) >= (~&$unsigned(reg34))) : (((wire19 && reg27) ?
                          wire20 : reg26) || (-wire14[(3'h4):(3'h4)])))};
            end
          reg37 <= {(reg25 ?
                  (wire19 != ((reg28 ? (8'ha9) : wire21) ?
                      $signed(reg36) : reg35[(3'h4):(2'h3)])) : (8'hbb))};
          reg38 <= $signed(((|$signed(reg24)) >> $unsigned((^~(~wire15)))));
        end
      else
        begin
          if ((reg25 <= $unsigned($signed(reg33))))
            begin
              reg28 <= {{$unsigned(($signed((8'ha6)) ?
                          $signed(reg24) : {reg35})),
                      (8'ha0)}};
              reg29 <= reg25;
              reg30 <= ($unsigned(wire17[(3'h6):(2'h2)]) ?
                  $unsigned($signed((+(~wire13)))) : reg32);
            end
          else
            begin
              reg28 <= $signed(wire21[(3'h4):(2'h3)]);
              reg29 <= reg36[(3'h4):(1'h1)];
              reg30 <= $unsigned(((reg36 ^ ($signed(wire17) ?
                  wire19 : (wire21 && reg34))) || $unsigned((reg24 ?
                  reg38 : {reg30}))));
            end
          reg31 <= ({reg33,
                  (((wire13 >= (8'hb5)) ?
                          (+(8'hb0)) : (reg33 ? reg36 : (8'ha1))) ?
                      (+(reg37 ? (8'hb7) : reg24)) : ((8'ha5) ?
                          $signed((8'hbf)) : $signed(reg33)))} ?
              reg25[(4'ha):(3'h6)] : $signed((8'ha1)));
        end
    end
  assign wire39 = {{{reg34}, $unsigned({(|(8'ha8)), reg28[(3'h4):(2'h3)]})},
                      (wire16 != $signed($unsigned((wire14 == wire18))))};
  assign wire40 = $unsigned(wire15[(2'h3):(1'h1)]);
  assign wire41 = $signed((~&reg26));
  assign wire42 = (reg31 ?
                      $unsigned({wire22}) : ($signed($signed((~|reg27))) && reg26[(1'h0):(1'h0)]));
  assign wire43 = $unsigned({(^~reg33[(1'h0):(1'h0)])});
  assign wire44 = $signed(reg31);
  assign wire45 = ($signed($unsigned(wire14[(3'h6):(2'h3)])) ?
                      (wire19[(1'h1):(1'h1)] ?
                          $unsigned(reg27[(2'h2):(1'h0)]) : {$signed({reg28,
                                  wire41}),
                              ((reg38 ? wire15 : reg28) ?
                                  (reg29 < (8'hb0)) : wire14)}) : {(|(wire44 ?
                              wire23 : wire41[(2'h3):(1'h1)])),
                          $unsigned($unsigned((wire19 ? reg34 : reg32)))});
  assign wire46 = $unsigned($unsigned((reg35[(3'h5):(3'h5)] > $unsigned(reg35))));
  always
    @(posedge clk) begin
      reg47 <= ($unsigned({({(8'hac)} * wire15)}) ?
          ($signed(wire17) ~^ (~|(8'ha8))) : (&($signed($signed(wire46)) ?
              (!(reg28 <<< reg35)) : wire17[(3'h6):(1'h0)])));
    end
  assign wire48 = reg34[(1'h1):(1'h1)];
  assign wire49 = wire18;
  assign wire50 = $unsigned($signed(wire18[(3'h7):(1'h0)]));
  always
    @(posedge clk) begin
      reg51 <= (($signed((^wire41[(5'h10):(3'h4)])) ?
              ($unsigned((wire16 ?
                  reg33 : wire16)) + $signed(wire21)) : ((~^$unsigned(wire41)) ?
                  (8'h9f) : reg35[(3'h4):(1'h1)])) ?
          $unsigned($signed($unsigned($signed((8'hb3))))) : reg47);
      reg52 <= (-((~&wire20) | reg25));
    end
endmodule

module module110
#(parameter param133 = ((((~((8'ha5) ? (7'h42) : (8'hb7))) | (((8'hb4) && (8'hae)) ? {(8'ha5), (8'hb8)} : (~(8'hb4)))) ? (~&(!((8'hbc) ? (7'h41) : (8'hae)))) : (^~((!(7'h42)) ? (~(8'haf)) : {(7'h40)}))) ? (((-((8'had) ^ (8'h9e))) ~^ (((8'hb1) ^ (8'hb0)) <= ((8'ha3) || (8'hb5)))) ? (~^(!(!(8'ha9)))) : ((((8'had) ? (8'hb8) : (8'hbf)) <= ((8'ha0) != (8'hae))) ? (((8'ha2) ? (7'h40) : (8'hb7)) ^~ {(8'hbb)}) : (((8'hb5) || (8'haf)) - {(8'hba)}))) : (+(((~&(8'haf)) <= ((8'ha6) ? (8'hae) : (8'hbc))) < {((7'h44) ? (7'h43) : (7'h44))}))), 
parameter param134 = {(!(({param133} ? (^~param133) : (param133 ? param133 : param133)) ^ ({param133} >= (~|param133))))})
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire114;
  input wire [(4'ha):(1'h0)] wire113;
  input wire [(4'hf):(1'h0)] wire112;
  input wire signed [(4'hf):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg128,
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
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(wire111) ?
          (~(((wire113 ? wire112 : wire113) ?
              (8'hb2) : wire114[(3'h7):(2'h3)]) & wire111[(4'hd):(4'hd)])) : (+$unsigned(wire113))))
        begin
          reg115 <= wire113;
          if ($signed({wire113,
              {((reg115 << wire113) ? (wire114 ? wire112 : wire113) : reg115),
                  (~&(-wire112))}}))
            begin
              reg116 <= (~|(-wire114));
              reg117 <= reg115;
              reg118 <= ((^~(~&(~|(wire112 ? wire113 : wire111)))) ?
                  wire112[(3'h4):(1'h0)] : ((~|wire114) + reg117));
              reg119 <= (|$signed({(8'hb4)}));
              reg120 <= reg119;
            end
          else
            begin
              reg116 <= reg118[(2'h2):(1'h1)];
              reg117 <= (($signed((^~(&wire113))) ?
                  reg120 : reg115[(2'h2):(1'h0)]) || reg120);
            end
          reg121 <= ((~^(8'hb3)) >> wire113);
        end
      else
        begin
          reg115 <= $unsigned((7'h43));
          reg116 <= (~&{$unsigned(($unsigned(reg119) ?
                  (reg119 ? reg120 : wire113) : (reg118 ^~ reg121))),
              $unsigned((!(reg119 * wire112)))});
          if ({$signed(reg120[(1'h0):(1'h0)])})
            begin
              reg117 <= (|(^reg118[(3'h7):(3'h6)]));
              reg118 <= (+(~&(-$signed((^wire111)))));
            end
          else
            begin
              reg117 <= $unsigned(($unsigned(((~wire114) ?
                      $unsigned((8'ha0)) : (wire112 ? wire111 : reg116))) ?
                  ((^(~&wire113)) ?
                      (wire113[(4'h9):(2'h3)] ?
                          (wire114 ?
                              (8'hb7) : reg115) : reg120) : (^$unsigned((7'h44)))) : reg117[(3'h7):(3'h5)]));
              reg118 <= reg115[(1'h0):(1'h0)];
              reg119 <= $unsigned(((wire114[(1'h0):(1'h0)] ?
                      $signed((&reg119)) : reg119) ?
                  $unsigned(((8'ha3) ?
                      (reg120 << reg115) : $signed(reg119))) : reg117[(1'h1):(1'h0)]));
              reg120 <= ($signed(reg121[(3'h7):(1'h1)]) ?
                  reg121 : (-{((wire111 && reg120) ?
                          (wire113 ?
                              (8'ha0) : wire111) : reg118[(3'h5):(3'h5)]),
                      $signed(reg120)}));
              reg121 <= $signed($signed((&$unsigned((&reg121)))));
            end
          if (($unsigned($unsigned(wire113)) ?
              (-(~&reg117[(2'h3):(1'h1)])) : (reg120 ^ wire111)))
            begin
              reg122 <= {$signed({(-(^reg121))}), wire112};
              reg123 <= (^(~^reg115));
              reg124 <= reg117[(3'h5):(2'h3)];
              reg125 <= (reg124 ?
                  (^reg116[(1'h0):(1'h0)]) : (((^{reg119}) & $unsigned((!reg119))) ?
                      (~(-(reg122 + wire111))) : reg118[(3'h7):(1'h1)]));
            end
          else
            begin
              reg122 <= reg124;
              reg123 <= reg116[(4'h9):(3'h5)];
              reg124 <= reg116[(4'hb):(4'hb)];
              reg125 <= (-($signed(reg120) >> (~(~|(~|wire112)))));
            end
          reg126 <= (^$unsigned({$unsigned($signed((8'ha9)))}));
        end
      reg127 <= (reg122 <= ($unsigned((~^(reg120 >>> reg120))) ?
          reg115[(2'h2):(1'h0)] : {((reg116 ? reg122 : wire113) ?
                  (reg125 ? reg116 : reg117) : reg120)}));
      reg128 <= (8'ha2);
    end
  assign wire129 = (reg124 ?
                       ($signed(wire114[(3'h6):(2'h3)]) ?
                           (((+(8'hb1)) ? reg127 : (8'hba)) ?
                               ((reg127 && reg118) * $signed(wire114)) : $unsigned($signed(reg127))) : (((^~(8'hb8)) ?
                               (wire112 ? reg128 : wire113) : (reg115 ?
                                   wire112 : wire111)) | $unsigned((reg120 ?
                               reg123 : wire114)))) : $signed(reg122[(2'h3):(2'h3)]));
  assign wire130 = (reg115[(1'h0):(1'h0)] ?
                       $signed(wire111) : $unsigned(reg127[(3'h5):(2'h3)]));
  assign wire131 = $signed(($signed(reg115[(1'h1):(1'h0)]) > $signed(((wire130 <= reg127) ?
                       (wire129 ? reg121 : wire113) : $unsigned(reg115)))));
  assign wire132 = $unsigned({$unsigned($signed((~|reg122))),
                       reg119[(4'hb):(4'hb)]});
endmodule
