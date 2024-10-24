module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire128;
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(2'h2):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(5'h10):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire132,
                 wire131,
                 wire130,
                 wire25,
                 wire5,
                 wire27,
                 wire79,
                 wire81,
                 wire82,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire126,
                 wire128,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire5 = wire4[(1'h1):(1'h1)];
  module6 #() modinst26 (.wire10(wire1), .wire8(wire0), .wire9(wire2), .wire11(wire3), .clk(clk), .y(wire25), .wire7(wire4));
  assign wire27 = $unsigned(wire5[(3'h6):(2'h3)]);
  module28 #() modinst80 (wire79, clk, wire2, wire1, wire3, wire27);
  assign wire81 = (wire3 ? wire25 : (8'hb0));
  assign wire82 = (wire4[(2'h2):(1'h0)] ?
                      ((((wire0 ?
                          wire0 : (8'hb3)) & (~|wire79)) | wire81) ^ wire81[(3'h5):(1'h1)]) : (-(8'hac)));
  always
    @(posedge clk) begin
      if ((({$signed((7'h41))} || wire79[(4'ha):(2'h2)]) > wire27[(4'hf):(4'h9)]))
        begin
          reg83 <= $unsigned(wire0[(4'ha):(2'h2)]);
          reg84 <= (($unsigned((~^{reg83, reg83})) ?
              ((!wire5[(4'hb):(2'h2)]) <= wire3[(4'hb):(3'h7)]) : (8'hb4)) - wire0);
        end
      else
        begin
          reg83 <= (wire4 ? $unsigned({wire2}) : {(~$signed(wire81)), (8'h9c)});
          reg84 <= ((($unsigned(wire79[(3'h5):(3'h5)]) ?
                      $unsigned(wire1) : wire2) ?
                  $signed(((wire27 * reg83) - $signed(wire82))) : {wire5[(4'hb):(2'h3)],
                      ((wire0 ? wire0 : wire0) >>> wire3[(4'h8):(3'h6)])}) ?
              {(-{wire25})} : $unsigned(((^$unsigned(wire79)) + (wire3[(2'h3):(1'h0)] ?
                  $signed(wire2) : $signed(wire3)))));
          reg85 <= (-wire4[(4'hf):(4'h8)]);
        end
    end
  assign wire86 = (&($unsigned($unsigned(wire27[(1'h1):(1'h1)])) ?
                      $unsigned(((wire82 ? reg84 : (8'hbe)) ?
                          (+wire25) : wire79)) : (wire5[(1'h0):(1'h0)] >> $signed($unsigned(wire27)))));
  assign wire87 = $unsigned((wire4 - (~^reg85)));
  assign wire88 = $unsigned($unsigned(wire4[(5'h10):(3'h4)]));
  assign wire89 = (|(^~$signed((!reg84[(4'he):(3'h4)]))));
  assign wire90 = $unsigned($signed($signed((!wire0))));
  module91 #() modinst127 (wire126, clk, wire25, wire82, reg83, wire79, wire2);
  module36 #() modinst129 (.wire39(wire87), .y(wire128), .wire38(wire79), .wire40(wire89), .clk(clk), .wire37(reg85));
  assign wire130 = $signed($signed(wire3));
  assign wire131 = (&$signed(wire130));
  assign wire132 = (~^($unsigned($unsigned((reg85 ? (8'hb2) : wire82))) ?
                       ($unsigned((reg83 != wire128)) * {(wire89 || wire4)}) : $unsigned(wire4[(3'h7):(3'h4)])));
  always
    @(posedge clk) begin
      if ($signed(wire126))
        begin
          reg133 <= $signed($unsigned((8'haf)));
        end
      else
        begin
          reg133 <= (wire131[(3'h5):(3'h5)] ?
              $signed((^wire130[(1'h1):(1'h1)])) : {wire128[(3'h4):(3'h4)],
                  (wire131 * $unsigned($unsigned(reg85)))});
          reg134 <= $unsigned((wire90[(1'h0):(1'h0)] == ($unsigned(((8'hb3) >= reg85)) ?
              $unsigned((!wire27)) : ((8'ha6) ?
                  $signed((8'hb0)) : $signed(wire2)))));
          reg135 <= $unsigned(wire132);
          reg136 <= {reg85[(4'hb):(3'h7)],
              {$unsigned(((&wire4) ? {wire132, wire81} : (~|wire87))),
                  (wire5 >>> reg83)}};
        end
      reg137 <= ((^~{$signed((^wire3)), $unsigned(wire131[(1'h0):(1'h0)])}) ?
          $signed(($signed((^wire82)) ?
              {(reg135 ?
                      reg85 : (8'hae))} : $unsigned(wire81[(5'h10):(3'h4)]))) : $signed({((+wire27) && $signed(wire87)),
              wire79[(5'h14):(1'h0)]}));
      reg138 <= reg135[(4'he):(3'h4)];
      reg139 <= $unsigned(((-wire128) ~^ $unsigned($unsigned((wire126 >>> wire25)))));
      reg140 <= (wire132 * $unsigned($unsigned(($unsigned(reg138) <= (8'ha4)))));
    end
  assign wire141 = $signed(($signed(wire3) != (-wire82)));
  assign wire142 = reg133;
  always
    @(posedge clk) begin
      if (({{$unsigned($signed(reg134))}} & wire131[(4'h8):(3'h5)]))
        begin
          reg143 <= wire131[(4'ha):(4'h9)];
          if (($unsigned({$signed((~|wire141))}) ?
              wire4[(4'he):(4'hd)] : wire89[(3'h4):(2'h2)]))
            begin
              reg144 <= ($unsigned($unsigned($unsigned(reg137[(5'h15):(1'h1)]))) && (($unsigned((wire79 ?
                          reg136 : wire81)) ?
                      $unsigned((wire4 ? (8'ha2) : wire88)) : wire1) ?
                  wire130[(1'h1):(1'h1)] : $unsigned(($unsigned(reg140) ?
                      wire87[(3'h4):(1'h0)] : $unsigned(wire126)))));
              reg145 <= {reg139};
              reg146 <= $signed(((((!reg138) ?
                          (wire128 | wire87) : $unsigned(wire89)) ?
                      wire130[(2'h2):(2'h2)] : ($signed(reg85) ?
                          wire132 : wire90[(4'h9):(3'h7)])) ?
                  (!$signed((wire79 == (8'hba)))) : (^(+(^~reg85)))));
              reg147 <= reg83;
              reg148 <= (wire130[(1'h0):(1'h0)] ^~ (^(~((wire81 > (8'ha8)) ?
                  (~^(8'hb2)) : reg133))));
            end
          else
            begin
              reg144 <= $unsigned((^~$signed(wire132)));
              reg145 <= $signed(reg135[(1'h1):(1'h1)]);
              reg146 <= reg136[(3'h5):(1'h0)];
              reg147 <= {((($unsigned((8'hb0)) > (!(8'h9f))) ?
                      reg145[(3'h7):(3'h6)] : {$unsigned((8'hb0)),
                          $unsigned(reg137)}) ~^ reg133)};
              reg148 <= $unsigned((($signed($unsigned(wire141)) && ((^reg147) ?
                  $signed((8'ha9)) : (reg146 && (8'hbe)))) << wire1[(3'h4):(3'h4)]));
            end
          reg149 <= $signed({($unsigned((^wire141)) ?
                  $unsigned(wire131[(4'h9):(1'h1)]) : $signed((reg83 ?
                      wire87 : (8'hb6))))});
          reg150 <= $unsigned(((reg83 ?
              (^~$signed(wire79)) : ((wire131 - wire82) ?
                  {wire5} : $signed((8'hb1)))) <<< (($unsigned(wire142) ~^ $unsigned(reg139)) >> $signed(wire79[(5'h13):(3'h5)]))));
          reg151 <= ($signed((&reg85[(5'h11):(4'hd)])) || $signed(({{wire2,
                  (8'haf)},
              {(8'ha9)}} << wire86[(4'h8):(1'h0)])));
        end
      else
        begin
          reg143 <= (!wire4);
          reg144 <= ({wire88} ? $signed(wire4) : (~(^(^~$signed(wire88)))));
          reg145 <= (~^(~&(($unsigned(wire4) ?
              (wire2 ? wire130 : wire79) : (|reg134)) * (~^{(8'hb3)}))));
          reg146 <= wire27;
        end
      reg152 <= $unsigned($signed($signed(((wire89 > wire90) ?
          reg147 : $signed((8'haa))))));
    end
endmodule

module module91
#(parameter param125 = (-(-(^~(+(~|(8'hbf)))))))
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire96;
  input wire signed [(5'h15):(1'h0)] wire95;
  input wire [(5'h13):(1'h0)] wire94;
  input wire signed [(5'h14):(1'h0)] wire93;
  input wire signed [(5'h12):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire97;
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire97,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire97 = $signed($signed($unsigned((8'had))));
  always
    @(posedge clk) begin
      reg98 <= ($signed((~((wire94 ? wire93 : wire95) ?
              (^~wire92) : $unsigned(wire92)))) ?
          $signed($signed($signed($signed(wire92)))) : (($unsigned(wire97[(3'h6):(1'h0)]) ^~ (&(~(7'h44)))) || wire97[(5'h11):(2'h2)]));
      reg99 <= $unsigned(({((wire94 << wire96) ^ $signed((8'hab)))} ?
          $signed(wire94[(5'h10):(1'h0)]) : reg98));
    end
  module100 #() modinst114 (wire113, clk, wire92, wire96, wire97, wire93);
  assign wire115 = wire96[(4'hc):(2'h2)];
  assign wire116 = (((^~$signed((!wire96))) - (~|($unsigned(wire97) ~^ $signed((8'hbb))))) ?
                       wire113 : $unsigned({($unsigned(wire94) || $unsigned(wire97))}));
  assign wire117 = (8'ha4);
  assign wire118 = (((8'hac) ~^ $signed($signed($unsigned(wire95)))) ?
                       wire113 : {wire94});
  always
    @(posedge clk) begin
      reg119 <= ($signed((~$signed(wire94[(4'he):(2'h3)]))) ?
          $unsigned((!reg99[(4'ha):(3'h6)])) : wire117);
      if ((reg98[(3'h5):(2'h3)] ?
          {{(7'h42)}} : (reg99[(3'h6):(3'h5)] ^ {$signed((wire113 <<< reg98)),
              wire118})))
        begin
          reg120 <= $signed(wire117);
        end
      else
        begin
          reg120 <= reg120[(4'h9):(1'h0)];
          reg121 <= (($signed(((~&(8'hba)) ~^ wire117)) + $signed($signed($unsigned((8'hb9))))) ?
              {$signed((~|{wire96, reg120}))} : wire118);
          if ($unsigned(((^~wire118) ? wire113 : (^~{(reg121 >> wire113)}))))
            begin
              reg122 <= wire117[(1'h0):(1'h0)];
              reg123 <= wire92[(4'ha):(3'h6)];
            end
          else
            begin
              reg122 <= $unsigned((8'ha0));
            end
          reg124 <= ((^(+(wire117[(1'h0):(1'h0)] ?
              $signed(reg120) : {(8'ha1)}))) - (&wire113));
        end
    end
endmodule

module module28
#(parameter param77 = ({(&({(7'h44), (8'hba)} ? ((8'hbd) ? (8'ha1) : (8'haf)) : (|(8'ha4))))} ? (({((8'hbe) >= (8'ha6)), ((8'hbb) ? (8'h9d) : (8'h9d))} | (~&((8'hac) ? (7'h44) : (8'hbe)))) ? ((+((8'hbb) ? (8'ha1) : (8'hb9))) & ((8'hb4) && ((8'ha2) <<< (8'ha6)))) : (((~^(8'hb3)) << ((8'hb6) ? (8'ha3) : (7'h41))) >> (((8'h9d) ? (8'hb7) : (7'h44)) ? ((8'haa) ^~ (8'hac)) : ((8'hba) ? (8'ha2) : (8'hb9))))) : (((^(&(8'had))) ? (8'ha5) : (((8'h9e) ? (8'hae) : (8'hbc)) ? ((8'hb6) ? (8'h9d) : (8'hab)) : ((8'h9f) ? (8'hbf) : (8'hb0)))) < {(((8'hbf) ^ (8'haa)) ? ((8'h9c) ? (8'ha5) : (8'hab)) : ((8'hbf) ? (8'h9d) : (8'ha9)))})), 
parameter param78 = ({(8'hbe)} ? (8'hbd) : (param77 * (((param77 ? param77 : param77) != ((8'hb1) ~^ (8'hb8))) ? ((param77 != param77) ~^ param77) : (param77 & (param77 ? param77 : param77))))))
(y, clk, wire29, wire30, wire31, wire32);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire29;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire signed [(5'h10):(1'h0)] wire31;
  input wire signed [(4'hd):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire69;
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire33,
                 wire69,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire33 = wire31;
  always
    @(posedge clk) begin
      reg34 <= (^~$signed(wire33));
      reg35 <= ({reg34} && reg34);
    end
  module36 #() modinst70 (.wire38(reg34), .clk(clk), .y(wire69), .wire39(wire32), .wire37(wire31), .wire40(wire29));
  assign wire71 = ((((wire69[(3'h5):(1'h1)] <<< (wire29 ? (8'hb5) : wire69)) ?
                          (wire32[(3'h4):(2'h3)] * (wire30 << wire33)) : ((reg35 ?
                              (8'hbf) : wire29) <= wire69)) ?
                      (((^~(8'hb0)) ? (8'ha2) : {wire29}) ?
                          wire30 : ((~|wire69) ?
                              wire31 : (~|wire69))) : ($unsigned($signed(wire33)) >>> $signed(wire33[(5'h11):(4'hf)]))) < ((!$signed($unsigned(reg34))) ?
                      (((!wire32) & wire32[(1'h1):(1'h0)]) > (^~(wire69 ?
                          wire33 : reg34))) : $signed(($signed(wire29) ^ wire31[(3'h4):(1'h0)]))));
  assign wire72 = (^~reg34[(1'h1):(1'h0)]);
  assign wire73 = {wire30[(1'h0):(1'h0)], wire32[(3'h5):(1'h0)]};
  assign wire74 = ($signed(($signed($signed((8'h9c))) >= $signed($unsigned(wire31)))) ?
                      ($signed($signed(reg34[(4'hf):(3'h4)])) ?
                          $unsigned(wire31[(3'h5):(2'h3)]) : {(+$signed(wire31)),
                              ((wire71 ? wire29 : wire71) ?
                                  (reg34 ? wire69 : reg35) : (reg34 ?
                                      wire29 : wire32))}) : wire69[(3'h5):(3'h5)]);
  assign wire75 = $unsigned({((+(wire32 | wire71)) > (((8'haf) >> wire29) ?
                          (|wire69) : wire74))});
  assign wire76 = $unsigned($signed(wire75));
endmodule

module module6
#(parameter param24 = (&((~^((-(8'haa)) & ((8'h9c) ? (8'ha7) : (8'hbd)))) >= (7'h43))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire12;
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire12,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = wire9;
  always
    @(posedge clk) begin
      reg13 <= wire9;
      reg14 <= wire8;
      reg15 <= ($unsigned(wire7) ?
          $unsigned(((~{wire10}) >> {$signed(reg14),
              (reg13 ? wire10 : wire9)})) : wire12[(2'h2):(1'h0)]);
      if ({wire9, (^{$signed(wire7)})})
        begin
          if (wire12[(1'h0):(1'h0)])
            begin
              reg16 <= ($unsigned((~$unsigned((~&wire12)))) >= (($signed({wire10,
                  wire9}) < wire7) && $signed(((reg14 << wire11) ?
                  $signed(wire12) : wire8[(3'h7):(3'h4)]))));
              reg17 <= wire10;
            end
          else
            begin
              reg16 <= ($unsigned($unsigned(wire9[(3'h6):(2'h2)])) ?
                  reg15 : $unsigned((|$unsigned(wire7[(4'h8):(4'h8)]))));
            end
          reg18 <= $unsigned(reg13);
        end
      else
        begin
          reg16 <= (reg17 ?
              (reg15[(3'h5):(3'h5)] ?
                  (((~^wire7) ? $signed(wire9) : wire10) ?
                      ({reg15} ?
                          (reg14 ?
                              wire11 : (8'haa)) : reg18[(1'h0):(1'h0)]) : ($signed(reg16) ?
                          $unsigned(wire10) : reg14[(4'ha):(3'h4)])) : ((8'hbc) << wire11)) : {reg18[(1'h1):(1'h0)],
                  wire7[(4'he):(2'h3)]});
          reg17 <= wire7[(3'h6):(3'h4)];
        end
      reg19 <= wire8[(2'h2):(1'h1)];
    end
  assign wire20 = $unsigned(($signed($unsigned(wire9[(2'h3):(1'h1)])) ~^ ((^~reg14) == $unsigned(wire12[(4'h9):(1'h0)]))));
  assign wire21 = ($signed(($signed(reg16) ?
                          (reg14 ?
                              reg15 : $unsigned((8'ha4))) : $unsigned($unsigned(wire7)))) ?
                      {(($unsigned(wire10) ?
                              wire20[(4'he):(3'h5)] : (^(7'h43))) >>> $signed(((8'ha3) >>> reg14)))} : (reg16[(5'h10):(3'h7)] <= {$signed($unsigned(reg16))}));
  assign wire22 = reg16[(1'h0):(1'h0)];
  assign wire23 = wire9[(3'h6):(2'h2)];
endmodule

module module36
#(parameter param67 = (~&(((~((8'ha8) ? (8'hb1) : (8'h9c))) ? (&(8'haa)) : (((8'ha7) >= (8'ha6)) > (8'ha7))) ? {(~((8'haa) ? (8'hae) : (8'hbd)))} : {(+((7'h40) >= (8'hb7))), {((8'hb0) >> (8'ha2)), ((8'hb5) >>> (8'h9f))}})), 
parameter param68 = param67)
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire40;
  input wire signed [(4'hb):(1'h0)] wire39;
  input wire [(4'he):(1'h0)] wire38;
  input wire [(4'he):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire42,
                 wire41,
                 reg57,
                 reg56,
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
                 reg43,
                 (1'h0)};
  assign wire41 = (~^(+(($unsigned(wire40) + (wire40 | (8'hb3))) << (~(&wire38)))));
  assign wire42 = wire41[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg43 <= wire37[(1'h0):(1'h0)];
      reg44 <= (+(wire39[(3'h5):(1'h0)] ?
          (~($signed((8'haf)) <<< (reg43 >>> wire42))) : $signed($unsigned(reg43[(1'h1):(1'h0)]))));
      if ((wire38 - $signed(wire38[(4'ha):(4'ha)])))
        begin
          if (wire41)
            begin
              reg45 <= (wire39[(2'h3):(2'h3)] ?
                  $unsigned((($unsigned((8'ha2)) * $signed((8'hbc))) ^ wire38[(4'he):(4'ha)])) : (reg43[(3'h7):(3'h6)] ^~ wire41[(1'h1):(1'h1)]));
              reg46 <= $unsigned($signed((wire41[(3'h6):(1'h1)] ~^ $signed(wire39))));
            end
          else
            begin
              reg45 <= (wire38[(2'h2):(2'h2)] >> wire37);
              reg46 <= wire41[(3'h4):(1'h0)];
              reg47 <= (wire40 ?
                  {(((wire38 >> wire39) <<< reg45[(1'h1):(1'h1)]) ?
                          $signed($signed((8'hb9))) : (wire40 ?
                              $unsigned(wire37) : reg44))} : reg43);
              reg48 <= $signed(wire42[(3'h5):(1'h0)]);
              reg49 <= (~$signed(((8'hae) >> reg43)));
            end
        end
      else
        begin
          if ($signed(($unsigned($unsigned(reg43[(3'h4):(2'h2)])) ?
              reg45 : (wire39 ?
                  reg45 : ((wire40 ? wire39 : reg45) ?
                      (reg47 < reg47) : {wire37})))))
            begin
              reg45 <= reg47;
              reg46 <= ((+$signed(reg49)) ?
                  $unsigned(wire42) : ((reg49 ?
                      reg45 : reg47[(4'h8):(3'h7)]) ^ $signed(((+reg44) || $signed((8'had))))));
              reg47 <= (wire40[(3'h5):(1'h0)] ^ $signed(wire38[(4'he):(4'h9)]));
            end
          else
            begin
              reg45 <= wire41[(1'h1):(1'h0)];
              reg46 <= {$signed((~^(|wire40)))};
              reg47 <= ({$unsigned($unsigned((reg46 >= reg43))),
                  {(8'ha4),
                      (reg47[(5'h10):(2'h3)] ?
                          $signed(reg47) : $signed(reg43))}} ^~ (reg48[(3'h5):(2'h3)] < reg43));
              reg48 <= (reg43[(2'h2):(1'h0)] ?
                  $unsigned((reg46[(4'h8):(3'h6)] <<< (|$signed(reg49)))) : wire40[(3'h4):(1'h1)]);
              reg49 <= $signed($signed((-reg46)));
            end
          reg50 <= $unsigned((!(((reg46 ^~ reg44) << $unsigned(wire41)) ?
              $unsigned((!wire37)) : wire42)));
          reg51 <= ($unsigned((wire37[(4'hd):(4'ha)] ?
              reg44 : $signed(reg49))) * $signed($unsigned($unsigned(wire39))));
          reg52 <= ({$signed(reg51)} <<< wire38);
          if (reg51[(4'ha):(1'h1)])
            begin
              reg53 <= {$unsigned(reg52[(4'h8):(4'h8)])};
              reg54 <= (wire39[(3'h7):(3'h5)] || $unsigned(wire40[(1'h1):(1'h0)]));
              reg55 <= ($signed({reg46[(3'h4):(1'h1)]}) | wire37[(3'h4):(1'h1)]);
            end
          else
            begin
              reg53 <= wire40;
              reg54 <= $signed($unsigned(($unsigned(reg54) ?
                  $signed($unsigned(reg55)) : reg48)));
            end
        end
      reg56 <= {(~$unsigned((^wire40[(3'h5):(1'h0)])))};
      reg57 <= ($unsigned((wire37[(3'h5):(3'h4)] ?
          reg45[(1'h1):(1'h1)] : reg51[(5'h11):(5'h11)])) >> $unsigned((~|reg47[(4'hd):(4'h8)])));
    end
  assign wire58 = reg55;
  assign wire59 = $signed(($unsigned($unsigned((+wire41))) <<< {wire58}));
  assign wire60 = reg43[(3'h5):(2'h3)];
  assign wire61 = (&($signed($signed((reg52 ?
                      wire41 : (8'ha7)))) ^ (($unsigned(wire40) ?
                      {(8'hb7), reg46} : wire42) + ((reg47 ?
                      (8'hbc) : reg43) & wire58))));
  assign wire62 = $signed(wire39);
  assign wire63 = reg53;
  assign wire64 = $unsigned(reg51[(4'h9):(4'h8)]);
  assign wire65 = {reg44, (^~(wire63[(2'h3):(2'h2)] + {$signed(reg49)}))};
  assign wire66 = ($unsigned($unsigned($signed((reg46 ? (8'hb4) : wire37)))) ?
                      reg50 : wire40[(3'h6):(1'h1)]);
endmodule

module module100
#(parameter param112 = ((((!((8'h9f) <<< (8'hae))) ? ((&(8'hb3)) ? (~^(8'hb6)) : ((8'hb8) > (8'ha4))) : {((8'hab) ? (8'hb2) : (7'h41)), ((7'h41) >= (8'hb9))}) ? ((((8'haf) > (8'hba)) - (+(8'haa))) && (~^((8'ha2) << (8'h9e)))) : (({(8'hbb)} ? ((8'hb1) == (8'haa)) : (~(8'ha6))) * ((&(8'hbc)) <<< ((8'ha5) ? (8'hb7) : (8'h9d))))) + (({(8'hbd), {(8'ha7)}} ? {{(7'h41), (8'hb0)}, ((8'hbc) ? (8'hac) : (8'h9d))} : (((8'ha9) != (8'ha1)) != (&(7'h40)))) ? (((~^(8'ha3)) ? ((8'hba) ? (8'hb1) : (7'h43)) : ((8'ha1) ? (8'ha9) : (8'ha3))) <<< (((8'ha4) ? (7'h44) : (8'hbd)) <= ((8'hb6) | (8'h9e)))) : ((^~(+(8'hb6))) ? (^((8'ha8) < (8'hb0))) : (~{(8'ha2), (8'ha4)})))))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire104;
  input wire signed [(4'hc):(1'h0)] wire103;
  input wire signed [(3'h4):(1'h0)] wire102;
  input wire signed [(5'h11):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  wire signed [(4'hc):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire105;
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 (1'h0)};
  assign wire105 = wire102;
  assign wire106 = (7'h40);
  assign wire107 = (wire104 ?
                       ((~^(~|$signed((8'ha2)))) ?
                           $unsigned((+$unsigned(wire103))) : wire104[(2'h2):(1'h1)]) : ($unsigned($signed({wire102,
                           wire106})) | wire103[(1'h1):(1'h1)]));
  assign wire108 = (7'h40);
  assign wire109 = wire105[(2'h3):(1'h1)];
  assign wire110 = ($signed(((+$unsigned(wire106)) & {(wire108 ~^ wire102),
                       (wire109 <= wire101)})) - (wire108 ?
                       ({$signed(wire106)} + (|$signed(wire104))) : ((&(^wire104)) ?
                           (8'hb5) : $unsigned(((8'ha1) ?
                               wire108 : wire105)))));
  assign wire111 = (8'hbb);
endmodule
