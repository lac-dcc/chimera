module top
#(parameter param107 = (^~((8'ha7) * ((|(~&(8'ha4))) <<< ({(8'h9c), (8'hbb)} != (8'hbc))))), 
parameter param108 = {((param107 != ((~^param107) | (param107 ? param107 : (8'hb9)))) ? param107 : ((((8'hbb) ~^ param107) ? (8'hae) : param107) >= ((param107 < param107) ? (^param107) : param107))), {(|((^param107) - (param107 ? param107 : param107))), (^~(+{(7'h44)}))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire96;
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire5,
                 wire6,
                 wire96,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = (&(({{wire2, wire2}} ? (&$signed(wire3)) : wire4) ?
                     $signed({$unsigned((8'ha3))}) : wire4));
  assign wire6 = $unsigned((((((8'hb3) ? wire1 : wire1) && $unsigned(wire4)) ?
                     {wire5} : $unsigned(wire4[(4'hc):(3'h4)])) & {(^~$signed(wire3))}));
  always
    @(posedge clk) begin
      reg7 <= $signed($unsigned($signed({wire2[(3'h4):(1'h1)]})));
      reg8 <= (|(($signed((^~(8'ha7))) == ((wire6 ? wire5 : wire5) ?
              (~|reg7) : {reg7})) ?
          {(8'ha3)} : wire4));
      reg9 <= $unsigned((wire2 ~^ $unsigned({(wire1 >>> wire5), (8'hbe)})));
      if (reg9[(3'h4):(2'h3)])
        begin
          if ((wire0 ?
              {$signed(wire1[(3'h4):(2'h2)]),
                  ($signed(reg7) ?
                      reg9[(1'h0):(1'h0)] : reg9)} : $signed(wire4)))
            begin
              reg10 <= (-$signed(((8'h9e) ?
                  $unsigned(((8'hae) << reg8)) : wire6)));
            end
          else
            begin
              reg10 <= wire2[(2'h3):(2'h3)];
              reg11 <= ((((wire3 << $signed(wire0)) ~^ $signed(wire0[(4'ha):(4'h9)])) ?
                  (($signed(reg10) || {wire2,
                      wire4}) != (-(wire1 == wire4))) : {(reg8 ?
                          (+reg8) : $unsigned(wire3))}) * (8'hbb));
              reg12 <= wire4;
              reg13 <= reg7[(4'hb):(3'h7)];
            end
          reg14 <= {reg7[(2'h2):(1'h1)]};
        end
      else
        begin
          if ($unsigned((($signed({wire2}) ?
                  ((^~reg11) ? (~|reg9) : reg11) : wire5[(3'h4):(1'h0)]) ?
              reg11 : reg9[(3'h6):(3'h5)])))
            begin
              reg10 <= $unsigned(wire2);
              reg11 <= (^~(-reg8[(2'h2):(1'h1)]));
              reg12 <= reg12[(3'h7):(3'h4)];
              reg13 <= ((!$unsigned($unsigned($signed(reg12)))) <= $signed(((reg9 ^~ reg10) > ($signed(reg9) <<< $unsigned(wire2)))));
            end
          else
            begin
              reg10 <= $unsigned($signed(((^(wire6 & (8'hb8))) | {{reg12},
                  $unsigned(wire3)})));
              reg11 <= $signed(wire4[(2'h2):(1'h1)]);
              reg12 <= wire6;
              reg13 <= $unsigned((reg12[(2'h3):(2'h3)] ^~ $unsigned({{(8'hb1)}})));
            end
          reg14 <= $unsigned((~($signed((8'hae)) ?
              {$signed(reg7), $unsigned(reg11)} : wire3[(3'h5):(2'h3)])));
          reg15 <= $unsigned((8'hbf));
          reg16 <= ($unsigned(($signed($unsigned(reg8)) <= ((~reg15) ?
              (|(8'hbb)) : reg14[(4'he):(4'hb)]))) & reg14);
        end
      reg17 <= reg11[(4'he):(4'h9)];
    end
  module18 #() modinst97 (.wire22(reg16), .clk(clk), .y(wire96), .wire19(reg15), .wire20(wire1), .wire21(reg10));
  assign wire98 = (~|((reg17[(3'h6):(1'h1)] != ((wire2 >= reg13) ?
                          {reg10, wire96} : $signed(reg11))) ?
                      reg15 : (reg7 ?
                          ((^reg7) ^ (wire3 ?
                              reg12 : (8'hb9))) : $signed(wire1[(1'h0):(1'h0)]))));
  assign wire99 = (^~$signed(reg17));
  assign wire100 = {$unsigned({reg12[(1'h1):(1'h0)], wire1}),
                       (reg16[(4'ha):(2'h2)] ?
                           (wire1 ?
                               ((+(7'h42)) < {(8'ha8)}) : (&wire99)) : $unsigned($signed(reg9)))};
  assign wire101 = $signed($signed((((~&wire0) != (wire5 && (8'hb1))) < ($signed(reg12) ?
                       (wire100 ? wire1 : wire98) : reg16[(3'h5):(3'h5)]))));
  assign wire102 = $signed(reg9[(3'h7):(1'h1)]);
  assign wire103 = $signed(reg11[(3'h6):(3'h5)]);
  assign wire104 = (wire99[(1'h0):(1'h0)] ?
                       (8'ha0) : (wire103 ?
                           {$unsigned(reg12)} : ((wire0[(4'h8):(2'h2)] ^~ (reg17 <<< (8'hb1))) ?
                               ((^reg16) ^ (reg10 << (8'ha0))) : wire101[(2'h2):(2'h2)])));
  assign wire105 = (^(wire1[(3'h6):(1'h1)] ? wire102 : wire103));
  assign wire106 = $unsigned($unsigned(wire102[(4'h8):(2'h3)]));
endmodule

module module18
#(parameter param95 = ((((8'ha0) ^~ (~^(&(7'h41)))) ? (|(&((8'h9d) ? (8'haf) : (8'ha3)))) : {(((8'h9c) ? (8'haa) : (8'ha2)) ~^ ((8'ha4) ? (7'h43) : (8'ha6))), ((-(8'hac)) && ((7'h44) ? (7'h44) : (8'hb5)))}) | (&{(~&(~&(7'h44)))})))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire72,
                 wire71,
                 wire69,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = (wire21 ?
                      (8'haa) : (-(($unsigned(wire21) ?
                          (wire20 >= wire20) : $signed(wire22)) <= $signed((wire21 ?
                          wire19 : wire20)))));
  assign wire24 = {$unsigned(($unsigned(wire20) ?
                          (~{wire23}) : (wire19[(1'h0):(1'h0)] ~^ $signed((8'hbd))))),
                      (&(wire19 ?
                          $unsigned({wire20,
                              wire19}) : $signed(wire19[(1'h0):(1'h0)])))};
  assign wire25 = $signed((&(^$signed((^wire22)))));
  assign wire26 = wire19;
  module27 #() modinst70 (.wire30(wire24), .clk(clk), .wire31(wire26), .y(wire69), .wire29(wire19), .wire28(wire20));
  assign wire71 = $signed($signed(wire23));
  assign wire72 = $signed($signed($unsigned($signed((^wire23)))));
  module73 #() modinst91 (.wire77(wire26), .wire75(wire20), .wire76(wire69), .clk(clk), .wire74(wire23), .y(wire90));
  assign wire92 = wire20[(1'h0):(1'h0)];
  assign wire93 = (&({(!wire19), wire69[(4'hd):(4'h9)]} ?
                      $signed($unsigned(wire20[(3'h5):(2'h2)])) : wire24[(1'h0):(1'h0)]));
  assign wire94 = ($signed($signed((8'ha5))) ? {wire93} : (8'hb0));
endmodule

module module73
#(parameter param89 = (((((~&(8'hb0)) == {(8'hbb), (7'h41)}) | {{(8'h9e), (8'hb4)}}) + {(&((8'hb7) ? (8'ha0) : (8'ha2))), (((8'ha8) ? (8'h9e) : (8'h9d)) == ((8'hbe) ? (8'h9f) : (8'hb5)))}) ? (((+(~&(8'hab))) ? (~|((8'h9c) != (8'ha5))) : (|(~&(7'h40)))) ? {(((8'hb4) ? (7'h42) : (8'h9e)) ^~ {(8'ha9), (8'h9d)}), ({(8'hbe), (8'ha4)} ? ((8'h9e) && (8'hb0)) : (-(8'h9e)))} : ((((8'hb7) > (8'ha2)) != {(8'haa), (8'ha0)}) > {(^(8'ha1))})) : {(({(8'hb6), (7'h42)} ? (+(8'hba)) : ((8'hae) ? (8'hae) : (8'hb4))) ? (((8'ha4) | (8'hb6)) < ((8'hb5) ? (8'ha1) : (8'hb2))) : (((8'hbb) & (8'ha0)) ? ((8'hb3) != (8'ha6)) : ((8'ha1) ^~ (8'ha0)))), (~{{(8'ha2), (8'ha8)}})}))
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire77;
  input wire signed [(5'h14):(1'h0)] wire76;
  input wire [(4'h8):(1'h0)] wire75;
  input wire signed [(4'hf):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire78;
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire78,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire78 = (8'hb5);
  always
    @(posedge clk) begin
      reg79 <= wire77;
      if (wire77)
        begin
          reg80 <= (({(^$signed(wire77)), {wire75, $unsigned(wire74)}} ?
              $signed(($signed((8'had)) >>> wire78)) : wire78) >>> {(wire76 ?
                  ((reg79 ? wire75 : (8'ha0)) ?
                      $unsigned((7'h41)) : (reg79 ?
                          wire78 : wire77)) : (^$unsigned(reg79))),
              ({reg79} ? (wire77 && {reg79}) : $signed((^reg79)))});
          reg81 <= ($unsigned((wire76 || (~|(wire75 + (8'hb7))))) ?
              $signed((($unsigned(wire77) ? wire75[(1'h0):(1'h0)] : wire76) ?
                  $signed((+reg79)) : $unsigned(wire77[(3'h4):(3'h4)]))) : $signed({((reg80 - wire74) ?
                      (wire78 + wire77) : wire78[(3'h4):(3'h4)]),
                  wire75[(3'h4):(2'h3)]}));
          if (wire75)
            begin
              reg82 <= ($unsigned((8'hb1)) ?
                  $signed({wire76[(1'h0):(1'h0)],
                      $signed(wire75)}) : (~^reg81[(3'h7):(3'h4)]));
            end
          else
            begin
              reg82 <= (8'ha0);
            end
          if ((8'ha4))
            begin
              reg83 <= reg79[(4'h8):(3'h6)];
              reg84 <= $unsigned((($unsigned((-reg82)) - ((wire76 - reg82) ?
                  (reg82 ?
                      wire77 : wire75) : wire75)) | (|$signed((!(8'had))))));
              reg85 <= (((-(reg83 - reg84[(4'ha):(1'h0)])) - ($signed((^wire75)) ?
                      $unsigned($signed(reg83)) : wire75)) ?
                  (wire76[(3'h7):(3'h4)] && ((!$signed(reg80)) ?
                      reg81[(1'h1):(1'h1)] : (|$signed((7'h44))))) : reg83[(3'h6):(3'h6)]);
            end
          else
            begin
              reg83 <= (&(reg84[(3'h6):(2'h2)] ?
                  (~|$signed({reg84, reg84})) : $unsigned($unsigned((reg84 ?
                      reg80 : reg81)))));
            end
        end
      else
        begin
          reg80 <= (~|({wire75, $unsigned(wire76[(4'h9):(4'h8)])} ?
              {(~&{(8'hb9)})} : reg85[(4'hb):(3'h7)]));
          reg81 <= ($signed(reg84) ? reg81 : $unsigned(reg84));
        end
    end
  assign wire86 = {$signed($signed((reg85[(3'h6):(3'h6)] | (~^wire74))))};
  assign wire87 = (wire76 << $signed($unsigned(($signed(reg81) >= $unsigned((8'hb7))))));
  assign wire88 = ({(&$signed((reg84 >> wire75))),
                          {({wire76} ? $unsigned(reg79) : (8'hab)), wire87}} ?
                      (~^(reg82 ?
                          $unsigned($signed(wire74)) : $unsigned(reg84))) : (|(~|$signed(reg83[(1'h0):(1'h0)]))));
endmodule

module module27
#(parameter param67 = ((~|((((8'hbf) ? (8'ha1) : (8'haf)) - (8'had)) ^~ (|((7'h41) * (8'haf))))) ? (({((8'ha6) ? (8'hbc) : (8'ha0)), (-(8'hac))} ? {(8'hbe), (^(8'hab))} : {((8'hb7) ? (8'hbe) : (8'hb2)), (&(8'hb2))}) ~^ (((-(8'ha8)) ^ ((8'had) ? (7'h42) : (8'ha0))) && (((8'haf) << (8'h9c)) ? ((8'hb2) << (8'hbd)) : ((8'ha2) < (7'h44))))) : (+(+((!(7'h43)) ? ((8'hbc) && (8'hac)) : ((8'ha5) ? (8'ha4) : (8'hba)))))), 
parameter param68 = (~&(((param67 ? (param67 ? param67 : param67) : (~|param67)) ^~ ((param67 ? (8'hbd) : param67) ? param67 : (&(8'hab)))) ~^ {param67})))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire signed [(3'h7):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire33;
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  assign y = {wire66,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire33,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= (wire28[(1'h1):(1'h1)] > ((^~(((8'hbb) ? wire28 : wire31) ?
              ((8'hab) <<< wire30) : wire28)) ?
          (wire30 == ({wire29, wire28} >> {wire31, wire31})) : (wire31 ?
              (!(~|wire29)) : $signed({wire29}))));
    end
  assign wire33 = {$unsigned($unsigned(wire31[(1'h1):(1'h1)]))};
  always
    @(posedge clk) begin
      if (wire29)
        begin
          reg34 <= (8'hac);
          reg35 <= {wire31, (^reg32[(4'ha):(1'h1)])};
          reg36 <= wire28[(1'h1):(1'h0)];
        end
      else
        begin
          reg34 <= $signed(reg32);
          if ((wire30[(3'h6):(1'h0)] >> (reg35[(5'h10):(4'h8)] == $unsigned((!wire33)))))
            begin
              reg35 <= {$signed((&$unsigned((8'ha6)))), $signed((&reg32))};
              reg36 <= reg32[(4'h8):(2'h3)];
              reg37 <= $unsigned(($signed((^wire30)) ?
                  (((reg35 | (8'ha4)) <<< (+wire28)) * (~^wire33[(4'hb):(4'hb)])) : $signed(((wire29 - reg36) ?
                      (reg35 < wire29) : wire30))));
            end
          else
            begin
              reg35 <= $unsigned(wire33[(1'h1):(1'h1)]);
              reg36 <= ((wire33 ?
                  (|reg32) : $signed($unsigned((reg37 >> reg32)))) && ((reg32[(5'h11):(4'he)] >> $signed((reg36 ?
                  wire30 : wire28))) < {reg32}));
            end
          if (reg32[(5'h11):(3'h5)])
            begin
              reg38 <= (~|({((wire28 && reg32) && (-reg36)), (8'hb9)} ?
                  (^~$signed((reg37 ? reg32 : wire28))) : (-((reg36 ~^ wire33) ?
                      $unsigned(reg32) : $unsigned((8'hbe))))));
              reg39 <= (^~$unsigned(reg35));
              reg40 <= (wire30[(3'h7):(3'h7)] ?
                  $signed($signed(((~|reg32) ?
                      (reg38 ?
                          reg32 : (8'hb8)) : reg32[(4'hf):(3'h5)]))) : ($unsigned(reg39) ?
                      {$unsigned((wire33 ? wire33 : reg32))} : wire29));
            end
          else
            begin
              reg38 <= (~|$unsigned($unsigned({(8'hb2)})));
              reg39 <= reg36[(1'h0):(1'h0)];
              reg40 <= ($signed($signed((!wire29))) - reg34[(3'h5):(2'h3)]);
            end
        end
    end
  assign wire41 = reg35;
  assign wire42 = wire31[(5'h13):(4'he)];
  assign wire43 = (^wire31);
  assign wire44 = (&(((~|wire30) ?
                      $unsigned($signed(reg38)) : (-wire43)) || $signed($unsigned((reg34 == wire33)))));
  assign wire45 = ($unsigned(($signed((&(8'hbe))) + $signed({reg40, reg39}))) ?
                      reg37[(3'h5):(3'h5)] : $unsigned(reg36));
  assign wire46 = reg36;
  assign wire47 = wire30;
  assign wire48 = wire29;
  assign wire49 = (8'ha4);
  assign wire50 = ((($unsigned((~&wire49)) ?
                      ((~^wire43) ?
                          $unsigned(reg35) : (wire31 - wire42)) : {(reg40 || wire47),
                          $unsigned(reg32)}) ^~ $unsigned(reg38[(4'h8):(3'h6)])) >> ($signed((+(reg40 == wire33))) ?
                      (wire41[(3'h7):(2'h2)] ?
                          $signed($unsigned((8'ha3))) : ((+reg38) + (reg34 < reg36))) : ({$signed(wire41)} ?
                          {(wire49 ? reg32 : reg37),
                              $signed(wire46)} : (^~(wire30 ?
                              (8'h9e) : wire30)))));
  assign wire51 = reg39;
  assign wire52 = $unsigned(({(8'ha3)} >>> reg34[(4'h8):(1'h0)]));
  assign wire53 = reg37;
  assign wire54 = {reg39};
  always
    @(posedge clk) begin
      if ($signed((8'ha8)))
        begin
          reg55 <= wire43[(3'h4):(3'h4)];
          reg56 <= ($unsigned($unsigned((reg36[(3'h6):(3'h5)] ?
              wire49[(2'h3):(1'h1)] : $unsigned(wire33)))) == wire30[(1'h1):(1'h0)]);
          reg57 <= {(&(+wire28))};
        end
      else
        begin
          reg55 <= reg39;
          reg56 <= (($unsigned($signed((reg39 ? wire30 : wire33))) ?
                  $signed({(reg57 << reg40)}) : $signed(((reg36 + reg57) ?
                      (reg37 != wire46) : wire52))) ?
              (((8'ha5) ?
                      ((&(8'ha1)) * (reg55 ?
                          wire53 : reg32)) : reg56[(1'h0):(1'h0)]) ?
                  reg56[(3'h6):(3'h4)] : $unsigned({(wire49 ^ wire29)})) : reg40);
        end
      reg58 <= (!wire29[(2'h2):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg59 <= (^~reg58[(3'h4):(2'h3)]);
      if (wire48[(1'h0):(1'h0)])
        begin
          reg60 <= (!wire29);
          reg61 <= (($signed(($signed((8'ha5)) ? $signed(wire45) : wire46)) ?
                  ({(^wire50)} ?
                      ($unsigned(wire53) - $signed((7'h43))) : ((8'had) ^ (wire54 ?
                          wire50 : reg36))) : $signed((!reg34[(3'h5):(3'h5)]))) ?
              (|($unsigned(reg60[(1'h0):(1'h0)]) == wire43)) : {{(8'ha6)}});
        end
      else
        begin
          reg60 <= $unsigned(((8'ha6) ?
              $unsigned((|(wire30 - reg38))) : (~|{reg55,
                  (wire44 ? (8'h9d) : wire44)})));
          reg61 <= $signed({$unsigned($signed((!wire45))),
              $unsigned($signed(reg58))});
          if (($signed((((reg57 <<< wire31) ?
                      reg35[(3'h5):(3'h4)] : (~&reg57)) ?
                  (|reg59[(2'h2):(1'h0)]) : ((wire28 != reg35) < (-reg35)))) ?
              $signed(reg36) : $unsigned(reg59)))
            begin
              reg62 <= ($unsigned((^~$signed(((8'ha6) != reg55)))) ?
                  (8'h9d) : {$unsigned(((wire52 != reg57) >> (reg34 ?
                          wire54 : reg59)))});
            end
          else
            begin
              reg62 <= (wire49[(3'h4):(1'h0)] | reg34);
              reg63 <= $signed(reg32[(4'hd):(4'h8)]);
              reg64 <= ($unsigned((((8'hb8) * (wire28 ?
                  reg63 : reg35)) | {{reg38, wire30},
                  (|reg34)})) >>> (~$signed(({wire29} << (wire42 & wire31)))));
              reg65 <= (^~reg38);
            end
        end
    end
  assign wire66 = wire51;
endmodule
