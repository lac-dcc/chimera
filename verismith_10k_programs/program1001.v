module top
#(parameter param127 = (~|(!(!{{(8'haf)}, ((8'had) ? (8'h9f) : (8'ha7))}))), 
parameter param128 = param127)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire [(5'h11):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(3'h5):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire121;
  wire [(3'h7):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire114;
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire116,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire114,
                 reg118,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
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
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire4 = wire0[(4'hc):(1'h1)];
  assign wire5 = (wire0 ^ $signed($unsigned({(~&(8'hbb))})));
  assign wire6 = (8'haf);
  assign wire7 = {wire0, $unsigned(wire4[(3'h4):(1'h1)])};
  assign wire8 = (({$unsigned($signed(wire2))} ?
                     (-{(wire3 >> wire5),
                         wire6[(2'h3):(1'h0)]}) : (~^(wire4 <= $signed(wire1)))) != ($unsigned((&(wire3 ?
                         (8'hb6) : wire5))) ?
                     $signed((~|$unsigned(wire6))) : (~|{(wire3 ?
                             wire1 : wire1)})));
  assign wire9 = $signed($signed(((((8'had) ? wire5 : wire3) ?
                         wire7 : (wire0 ? wire5 : wire8)) ?
                     ($signed(wire1) * wire5) : wire0[(4'hf):(4'h8)])));
  always
    @(posedge clk) begin
      reg10 <= (((($unsigned(wire0) ?
              (~wire8) : wire6[(2'h2):(1'h0)]) <<< $signed($signed(wire5))) <= wire0) ?
          (((wire3 > (wire5 ?
              (8'hb2) : wire2)) < wire2[(4'hb):(2'h3)]) - wire4[(1'h0):(1'h0)]) : ($signed((~|wire7)) ?
              ($unsigned(wire3[(3'h7):(2'h3)]) ?
                  (((8'hac) ?
                      wire3 : wire1) * (|wire5)) : $unsigned((wire5 >>> wire9))) : {(wire5[(1'h1):(1'h0)] == wire7[(3'h4):(1'h1)])}));
      if (wire2[(4'ha):(2'h2)])
        begin
          if ((+($unsigned($unsigned($signed(wire1))) < $unsigned((((7'h42) == wire3) ?
              {(7'h44)} : {wire9})))))
            begin
              reg11 <= (-(wire7 && (wire2[(4'h9):(4'h9)] + ((wire6 >>> wire7) >> (&wire7)))));
              reg12 <= wire4[(2'h3):(2'h2)];
              reg13 <= wire1[(2'h3):(2'h3)];
              reg14 <= (reg12 - wire2);
            end
          else
            begin
              reg11 <= {wire2[(1'h0):(1'h0)]};
              reg12 <= ($unsigned((reg10[(5'h10):(4'hc)] & reg12[(4'hc):(2'h3)])) != {$signed(($unsigned(reg13) ?
                      {reg10} : (^(8'hb8)))),
                  wire8});
            end
          reg15 <= $signed($unsigned($signed($signed($unsigned(reg11)))));
          reg16 <= $unsigned($signed($unsigned(($signed(reg14) ?
              (^(7'h41)) : wire1[(1'h1):(1'h0)]))));
          if ((8'hb8))
            begin
              reg17 <= {(~|wire5[(3'h4):(2'h3)]),
                  $signed((($signed(reg15) ?
                      $signed((8'hbd)) : wire2[(3'h5):(1'h1)]) & (-(reg10 ^~ wire1))))};
              reg18 <= {$signed($unsigned(((!reg12) > $unsigned(wire1))))};
              reg19 <= {$signed((8'ha1))};
              reg20 <= $unsigned(((^reg14[(2'h2):(1'h1)]) && (($signed(wire0) ?
                  (reg14 ?
                      (8'ha9) : reg10) : $unsigned((8'ha7))) - reg10[(1'h1):(1'h0)])));
            end
          else
            begin
              reg17 <= $unsigned(wire5);
              reg18 <= reg18;
            end
        end
      else
        begin
          reg11 <= $signed($unsigned(((&reg12) ^ $signed(reg13[(1'h1):(1'h1)]))));
          reg12 <= $unsigned($unsigned($signed((8'hb9))));
          reg13 <= reg13;
          reg14 <= (-$signed((({reg14} == (~^reg12)) ?
              (^$signed(reg14)) : {$unsigned(reg11)})));
        end
      if (($signed(reg14[(3'h6):(2'h2)]) >= (wire0 & wire7[(4'h8):(1'h1)])))
        begin
          reg21 <= wire5[(2'h2):(1'h0)];
          reg22 <= (reg13 ?
              (^$unsigned(($unsigned(reg20) + $unsigned(reg17)))) : ($unsigned(reg16) >>> {(!wire8)}));
          reg23 <= $signed($signed($unsigned(($unsigned(reg22) ?
              $unsigned(wire3) : reg11[(2'h2):(1'h1)]))));
          if ((reg21[(3'h4):(3'h4)] < (8'h9f)))
            begin
              reg24 <= $unsigned(wire4[(2'h2):(1'h1)]);
              reg25 <= $signed($unsigned($signed((+$unsigned((8'hb7))))));
              reg26 <= ($signed((reg19[(1'h1):(1'h1)] + ((^reg20) >> (^(8'hb2))))) << wire0);
              reg27 <= ($signed(reg19[(1'h1):(1'h1)]) >>> wire9);
              reg28 <= (({(!(~&wire7)),
                  ((~^reg16) ?
                      (reg12 ^~ (8'hbf)) : (reg19 ~^ reg23))} << ((wire7 ?
                  wire0[(2'h2):(2'h2)] : $unsigned(reg17)) < $signed(wire9))) || wire3);
            end
          else
            begin
              reg24 <= {(($signed(((8'ha3) ? reg14 : reg27)) ?
                      {$signed(wire6)} : ((wire8 ? wire7 : reg22) ?
                          $unsigned(reg22) : (reg16 ?
                              reg14 : (8'ha7)))) | (^~$signed($signed(wire3)))),
                  (!((~^wire8) ? {$unsigned((8'hbe))} : $unsigned((8'ha7))))};
              reg25 <= wire4[(3'h4):(1'h1)];
            end
        end
      else
        begin
          reg21 <= (^~$unsigned((wire0[(5'h11):(5'h11)] ?
              ((8'ha4) ?
                  $signed(reg14) : $unsigned(reg14)) : ((~^wire1) ^~ (-(8'hae))))));
          reg22 <= $signed(reg17);
          reg23 <= {$signed((((8'ha2) ?
                      reg13[(4'hd):(2'h3)] : (wire9 - wire6)) ?
                  ($signed((8'hb6)) ?
                      $unsigned(wire6) : (-reg20)) : $signed($unsigned(wire6))))};
          reg24 <= ($signed((8'h9d)) == reg12[(4'hd):(2'h3)]);
          reg25 <= $unsigned(reg20[(4'hb):(3'h4)]);
        end
      if ((reg13[(3'h5):(2'h3)] < (wire7[(3'h6):(2'h2)] ?
          ($unsigned({reg16, wire2}) ?
              (~((8'hb8) ?
                  reg13 : reg22)) : reg10[(3'h5):(1'h0)]) : (reg26[(3'h4):(2'h2)] >= $signed($unsigned(reg22))))))
        begin
          reg29 <= $signed(({(wire7 << (wire9 * reg11)), (-(+reg28))} ?
              $signed((wire0[(4'he):(4'h9)] <= $unsigned(reg27))) : wire2[(4'hd):(4'h9)]));
          reg30 <= {(($signed((8'hba)) ^ $unsigned({reg27})) ?
                  reg11[(1'h0):(1'h0)] : (~&reg26))};
          if (reg29[(3'h4):(1'h1)])
            begin
              reg31 <= ($signed((8'ha3)) & {$unsigned($signed((reg14 == wire6))),
                  (8'hb1)});
              reg32 <= reg25;
              reg33 <= $signed(wire7[(4'ha):(2'h2)]);
            end
          else
            begin
              reg31 <= reg14;
              reg32 <= (8'hb3);
              reg33 <= {(^($unsigned($signed(reg10)) & (((8'hbd) && reg33) ?
                      reg17 : wire0)))};
            end
          if ({wire9[(4'h9):(1'h0)]})
            begin
              reg34 <= wire2[(4'hb):(1'h0)];
            end
          else
            begin
              reg34 <= {$unsigned((reg20[(2'h2):(2'h2)] || (-reg23))), reg32};
              reg35 <= wire3;
              reg36 <= (~^$unsigned((reg10 ?
                  ($unsigned(reg14) ?
                      (!reg33) : $signed(reg34)) : (((7'h42) != reg23) ^~ $unsigned((8'ha9))))));
              reg37 <= $unsigned({$signed({(reg17 >>> wire4)}),
                  (~|(~^$unsigned(reg30)))});
            end
          if ((~^((($unsigned(wire7) - (reg18 ? reg12 : reg31)) ?
                  reg14[(2'h3):(2'h2)] : ((+(8'hb9)) >>> $unsigned(reg35))) ?
              ((~(reg27 ? reg36 : reg32)) ?
                  ((wire5 >= reg32) <= (reg21 || reg20)) : (!$unsigned(wire8))) : $unsigned(reg14))))
            begin
              reg38 <= $signed(reg18[(4'h8):(3'h5)]);
              reg39 <= {((~&wire7[(4'hd):(3'h5)]) ? (~&reg35) : wire0),
                  (^$unsigned(($unsigned(reg16) ^~ {reg15})))};
            end
          else
            begin
              reg38 <= ((reg29[(1'h1):(1'h1)] >= wire8[(3'h5):(1'h0)]) << wire5);
              reg39 <= (-$unsigned(((reg31 ?
                  (reg38 == reg28) : reg22) <= ((reg24 ?
                  reg29 : (8'haa)) >>> (reg38 ? reg39 : wire9)))));
              reg40 <= reg18[(3'h5):(1'h1)];
              reg41 <= wire0[(3'h4):(3'h4)];
              reg42 <= (reg24[(1'h0):(1'h0)] ?
                  (~|$unsigned(($signed(reg30) | reg19))) : (8'ha7));
            end
        end
      else
        begin
          reg29 <= reg13[(3'h7):(1'h0)];
          reg30 <= $signed($unsigned(reg30));
          if ($signed($signed(($signed(((8'hb1) > (8'hb6))) ?
              reg18[(2'h2):(1'h1)] : $unsigned((reg27 == (8'hb1)))))))
            begin
              reg31 <= $signed($signed($unsigned((reg31[(1'h0):(1'h0)] ?
                  reg32[(2'h2):(2'h2)] : (wire0 <= reg15)))));
              reg32 <= $unsigned(reg30[(2'h2):(2'h2)]);
              reg33 <= (^(!($signed((8'hba)) ?
                  ((reg10 ^ reg16) ^ (8'hb7)) : ((reg19 ?
                      (8'haa) : reg26) * $unsigned((8'haa))))));
              reg34 <= $unsigned(wire5);
            end
          else
            begin
              reg31 <= $unsigned($signed(((((8'ha8) ? (8'hbb) : reg32) ?
                      {reg10} : $signed(reg36)) ?
                  $signed(wire7[(1'h1):(1'h0)]) : {reg14, reg29})));
              reg32 <= $signed(reg15);
              reg33 <= (8'ha5);
              reg34 <= (-(+$unsigned($unsigned(reg30[(1'h1):(1'h0)]))));
              reg35 <= reg11;
            end
          reg36 <= reg11;
        end
      reg43 <= ((~($signed(reg36) ?
          {$signed(wire9)} : ($signed(reg15) ?
              reg22[(2'h2):(1'h0)] : reg39[(4'hb):(4'h9)]))) ~^ reg27);
    end
  module44 #() modinst115 (.wire46(reg32), .wire48(reg17), .wire47(reg23), .wire45(wire7), .clk(clk), .y(wire114));
  assign wire116 = ($signed(reg21) > reg31[(3'h5):(1'h1)]);
  assign wire117 = ((^$unsigned((reg15[(1'h1):(1'h1)] ?
                           $signed(wire114) : (~&wire5)))) ?
                       $unsigned({reg32[(1'h1):(1'h1)],
                           $unsigned((reg21 ? reg32 : reg13))}) : reg38);
  always
    @(posedge clk) begin
      reg118 <= (~&reg33);
    end
  assign wire119 = (^(|((&(wire4 == (8'hb3))) >>> (+(&reg32)))));
  assign wire120 = (&$unsigned({$unsigned((+wire7)), {(&wire3)}}));
  assign wire121 = $signed((8'hbd));
  assign wire122 = $signed({(-$signed($unsigned((8'haf))))});
  assign wire123 = $unsigned((~$signed(({reg17} <= reg29[(1'h1):(1'h1)]))));
  assign wire124 = (($unsigned((((8'ha8) & reg26) ?
                           (reg34 ? reg27 : wire114) : reg40)) * (wire6 ?
                           wire2[(1'h0):(1'h0)] : reg43[(3'h4):(2'h3)])) ?
                       {reg26[(1'h1):(1'h1)]} : $unsigned($unsigned(reg41[(4'h8):(3'h5)])));
  assign wire125 = reg24;
  assign wire126 = $unsigned(reg37[(2'h3):(1'h0)]);
endmodule

module module44
#(parameter param113 = (|(~|((((8'hb4) ? (8'hb9) : (8'hb7)) < {(8'ha9)}) ? (^((8'h9c) || (8'had))) : (8'hae)))))
(y, clk, wire45, wire46, wire47, wire48);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire45;
  input wire [(4'he):(1'h0)] wire46;
  input wire [(5'h13):(1'h0)] wire47;
  input wire signed [(4'he):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire107;
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire49,
                 wire50,
                 wire51,
                 wire70,
                 wire72,
                 wire88,
                 wire107,
                 (1'h0)};
  assign wire49 = $unsigned($unsigned($unsigned($signed((~wire48)))));
  assign wire50 = (wire45[(2'h3):(2'h2)] <= ($unsigned(wire46[(4'hb):(2'h2)]) ?
                      wire48 : {(wire49 ? (~&wire49) : wire46)}));
  assign wire51 = (8'ha9);
  module52 #() modinst71 (.clk(clk), .wire54(wire48), .wire53(wire47), .wire56(wire51), .y(wire70), .wire55(wire45));
  assign wire72 = (wire46[(2'h2):(2'h2)] <= (~$unsigned(wire49)));
  module73 #() modinst89 (.wire75(wire72), .y(wire88), .clk(clk), .wire77(wire45), .wire76(wire49), .wire74(wire46));
  module90 #() modinst108 (.wire94(wire50), .wire91(wire88), .clk(clk), .wire93(wire49), .y(wire107), .wire92(wire45), .wire95(wire47));
  assign wire109 = ($signed($unsigned((wire72[(1'h1):(1'h0)] ?
                       (~&wire46) : (wire72 ?
                           wire72 : wire48)))) == wire50[(5'h12):(3'h7)]);
  assign wire110 = $signed(wire48[(4'hd):(4'hd)]);
  assign wire111 = $signed((8'ha7));
  assign wire112 = $signed($unsigned($signed(wire107[(4'hb):(4'hb)])));
endmodule

module module90
#(parameter param105 = {(((~{(8'hb2), (8'ha5)}) ? {{(8'ha1), (8'hab)}} : (~((8'ha3) ? (7'h42) : (8'ha6)))) >>> ((~|(-(8'hb9))) ? (((8'hab) ? (8'hb3) : (8'ha9)) * (-(8'hbf))) : (((7'h40) == (8'hb9)) || ((7'h40) ? (8'ha9) : (8'ha8))))), (+(8'h9c))}, 
parameter param106 = param105)
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire95;
  input wire [(4'ha):(1'h0)] wire94;
  input wire [(4'ha):(1'h0)] wire93;
  input wire signed [(4'h9):(1'h0)] wire92;
  input wire [(5'h12):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 (1'h0)};
  assign wire96 = $signed(wire95[(1'h0):(1'h0)]);
  assign wire97 = wire91[(5'h10):(4'hd)];
  assign wire98 = wire95[(4'h9):(4'h9)];
  assign wire99 = {$unsigned(wire97[(4'h9):(2'h3)])};
  assign wire100 = (wire93 ?
                       ($unsigned(($unsigned(wire95) ?
                               (+wire94) : wire99[(1'h0):(1'h0)])) ?
                           wire97 : wire95[(3'h4):(1'h1)]) : wire93[(3'h5):(1'h0)]);
  assign wire101 = wire97;
  assign wire102 = $signed((((wire93[(3'h5):(2'h2)] - (wire92 >>> wire92)) ?
                       wire96[(3'h4):(3'h4)] : {(wire91 && wire92)}) == (wire94 ?
                       $unsigned((-wire96)) : $unsigned(wire96))));
  assign wire103 = wire101;
  assign wire104 = (wire92[(3'h5):(2'h2)] ?
                       (^wire96) : $unsigned($signed($unsigned($signed(wire91)))));
endmodule

module module73
#(parameter param86 = (7'h40), 
parameter param87 = (param86 <<< (~|((~&(!(8'ha1))) ^~ (-param86)))))
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire77;
  input wire signed [(3'h5):(1'h0)] wire76;
  input wire signed [(4'h8):(1'h0)] wire75;
  input wire signed [(4'he):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire79,
                 wire78,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire78 = $unsigned($signed($unsigned($signed($unsigned(wire74)))));
  assign wire79 = $signed(((~^wire77[(1'h1):(1'h1)]) ?
                      (wire77 ?
                          ((wire75 ? wire78 : wire75) ?
                              wire76[(1'h1):(1'h1)] : wire77[(4'hd):(3'h7)]) : $signed((wire75 ?
                              (7'h41) : wire76))) : {(&(!wire74)), wire78}));
  always
    @(posedge clk) begin
      if ((wire79 ?
          (&((((8'hb4) ?
              wire76 : wire75) == wire76) == wire78[(4'ha):(2'h3)])) : ($unsigned((8'hb8)) ?
              {{(8'hbf)}} : wire77[(3'h5):(3'h5)])))
        begin
          if ({wire78[(5'h10):(4'hd)], (~^wire74[(4'he):(4'hd)])})
            begin
              reg80 <= wire78[(5'h11):(3'h5)];
            end
          else
            begin
              reg80 <= $signed(reg80[(3'h7):(1'h1)]);
              reg81 <= $unsigned($signed(wire75[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          if ($signed(($signed((reg81[(3'h7):(3'h4)] ?
              $signed(wire74) : (7'h40))) - wire76)))
            begin
              reg80 <= reg80[(3'h5):(2'h2)];
            end
          else
            begin
              reg80 <= wire77;
              reg81 <= (($signed(((wire75 - wire75) ?
                  $signed(wire76) : {wire75})) >= wire78[(4'hb):(2'h3)]) ^ (wire79[(1'h0):(1'h0)] ?
                  wire79 : {(|(wire77 ? wire79 : wire75))}));
              reg82 <= (~$signed((&((-wire75) == (wire78 ? wire77 : reg81)))));
            end
          reg83 <= {{(^(~&wire75[(2'h3):(1'h0)])),
                  ((reg82[(1'h0):(1'h0)] ?
                      $unsigned(reg82) : $unsigned(reg82)) == $signed($unsigned(reg82)))},
              (|$signed(((8'had) ^~ wire75)))};
        end
    end
  assign wire84 = $unsigned((reg81 ?
                      ($unsigned((wire76 | wire77)) ?
                          reg81 : ((^~(8'hb5)) ?
                              (wire79 ?
                                  (8'hb9) : wire79) : wire77[(3'h6):(3'h6)])) : wire74[(1'h0):(1'h0)]));
  assign wire85 = reg82;
endmodule

module module52  (y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire56;
  input wire signed [(3'h6):(1'h0)] wire55;
  input wire [(3'h4):(1'h0)] wire54;
  input wire [(5'h13):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire57;
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire61,
                 wire57,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire57 = wire55[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire57)
        begin
          reg58 <= $signed({{wire57, $unsigned($signed(wire55))}});
          reg59 <= $unsigned(reg58[(1'h1):(1'h0)]);
        end
      else
        begin
          reg58 <= (($signed({reg59}) ? reg59 : wire54) ?
              {(wire53 ?
                      (!(^(7'h44))) : ({wire56,
                          reg58} | ((8'hbb) >>> wire55)))} : reg59[(3'h4):(1'h0)]);
        end
      reg60 <= wire55[(3'h5):(3'h5)];
    end
  assign wire61 = (8'hb6);
  always
    @(posedge clk) begin
      reg62 <= $unsigned($signed($unsigned($signed((wire61 == wire53)))));
      reg63 <= $signed((~&($signed(reg60) ?
          ((wire55 && reg62) + $signed((8'hae))) : ((reg60 ?
              wire55 : wire54) ^ wire57[(4'ha):(4'h8)]))));
      reg64 <= reg63[(3'h5):(3'h5)];
      reg65 <= $unsigned((8'ha8));
    end
  assign wire66 = ($signed($unsigned(((reg65 ?
                      (7'h44) : reg62) << $signed(wire54)))) != (8'ha0));
  assign wire67 = (8'hbc);
  assign wire68 = (wire55[(3'h5):(2'h2)] <= (!$signed(($signed(wire66) ?
                      (&wire54) : reg64[(1'h0):(1'h0)]))));
  assign wire69 = wire55[(3'h4):(1'h1)];
endmodule
