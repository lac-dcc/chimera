module top
#(parameter param156 = ((({((8'hb5) ? (8'h9c) : (7'h40))} ? (((8'ha0) ? (7'h42) : (8'hbf)) * ((8'ha9) ? (8'hbd) : (8'hb9))) : (~{(8'haa), (8'hbc)})) ? ((^((7'h41) <<< (8'ha0))) ? (~^((8'hb8) + (8'hac))) : (((8'h9f) <<< (8'haf)) ? (~|(8'ha0)) : (&(8'ha0)))) : ({{(8'ha1)}} ? (8'h9e) : {(~^(8'ha8))})) * (~^{{((8'ha3) || (8'h9c))}, ({(8'hb2), (8'had)} || {(8'hb6)})})), 
parameter param157 = {(^{((!param156) & ((8'h9c) >>> param156))}), (((~&param156) << ((param156 ^~ param156) ? (~^param156) : param156)) | ((&(param156 * param156)) != {param156}))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire153;
  wire [(5'h14):(1'h0)] wire152;
  wire signed [(4'hf):(1'h0)] wire147;
  wire signed [(4'he):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire signed [(4'hd):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire140;
  wire signed [(4'h9):(1'h0)] wire149;
  wire signed [(4'h9):(1'h0)] wire150;
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire4,
                 wire5,
                 wire6,
                 wire73,
                 wire140,
                 wire149,
                 wire150,
                 (1'h0)};
  assign wire4 = $signed((^wire0));
  assign wire5 = $signed((wire2[(1'h1):(1'h1)] <<< $signed(({wire3,
                     wire4} ^~ (wire3 ? wire2 : wire4)))));
  assign wire6 = (wire1[(1'h0):(1'h0)] && wire4[(3'h7):(2'h2)]);
  module7 #() modinst74 (wire73, clk, wire1, wire2, wire3, wire0);
  module75 #() modinst141 (wire140, clk, wire3, wire6, wire73, wire5, wire0);
  assign wire142 = $unsigned(wire140[(3'h4):(2'h2)]);
  assign wire143 = wire142;
  assign wire144 = wire5;
  assign wire145 = wire2;
  assign wire146 = ((($unsigned(wire140) ?
                           wire4[(3'h7):(1'h1)] : $unsigned($unsigned(wire144))) ?
                       {(-$unsigned((8'ha7)))} : $signed(wire3[(4'hc):(4'hc)])) >> ((((wire0 ?
                           wire145 : wire1) >> (wire5 == wire2)) ?
                       $unsigned(wire0) : ($signed(wire145) && (~^wire3))) <= ((wire142 > (~&(8'ha1))) ?
                       (&wire3[(4'ha):(3'h6)]) : ($signed(wire142) == ((8'hba) ?
                           wire1 : wire0)))));
  module112 #() modinst148 (.clk(clk), .wire114(wire143), .wire115(wire1), .y(wire147), .wire117(wire144), .wire113(wire140), .wire116(wire5));
  assign wire149 = wire0;
  module112 #() modinst151 (wire150, clk, wire73, wire147, wire146, wire2, wire5);
  assign wire152 = wire147;
  assign wire153 = {$signed(wire149)};
  assign wire154 = $signed((^~wire147));
  assign wire155 = wire146;
endmodule

module module75
#(parameter param138 = {(&(^~(((8'ha3) ^ (8'hb6)) >>> ((8'hbc) ^ (8'hbc))))), (!(^(|{(8'ha5)})))}, 
parameter param139 = param138)
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire80;
  input wire [(4'hd):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  input wire [(4'he):(1'h0)] wire77;
  input wire signed [(4'ha):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire110;
  wire signed [(4'hc):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire132;
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  assign y = {wire137,
                 wire97,
                 wire81,
                 wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire132,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire81 = ($unsigned($unsigned($signed((wire77 && wire76)))) ?
                      ($signed((|$unsigned(wire79))) * $signed(wire79[(1'h1):(1'h1)])) : (8'hbd));
  module82 #() modinst98 (wire97, clk, wire79, wire77, wire76, wire80, wire81);
  assign wire99 = ($unsigned(wire79[(4'hc):(4'hc)]) ?
                      ((~^$unsigned(wire76[(2'h3):(1'h1)])) <= wire76[(3'h4):(3'h4)]) : $signed(wire79));
  assign wire100 = {{($unsigned((!(8'h9c))) ?
                               (^~((8'ha9) ? wire80 : wire99)) : ((^~wire77) ?
                                   $signed(wire80) : wire97))},
                       $unsigned($signed(((~|wire80) ?
                           wire79[(2'h2):(1'h1)] : wire79)))};
  assign wire101 = (+(((8'h9e) ?
                           $unsigned($signed(wire100)) : (wire100 ?
                               (8'ha0) : wire78[(3'h5):(2'h2)])) ?
                       ({{(8'ha1)},
                           $signed(wire79)} + (8'h9d)) : ({$signed(wire77),
                               (wire77 ? wire76 : (7'h41))} ?
                           ($unsigned(wire97) ?
                               (&wire81) : (wire97 ~^ wire77)) : $unsigned((wire80 ?
                               wire97 : wire100)))));
  assign wire102 = $unsigned($unsigned(wire99[(3'h5):(1'h0)]));
  assign wire103 = wire78[(4'he):(2'h3)];
  assign wire104 = wire77;
  assign wire105 = $signed((wire104[(5'h12):(4'hb)] << wire79[(3'h7):(3'h6)]));
  assign wire106 = wire99[(2'h3):(2'h2)];
  assign wire107 = (^~$signed(wire105));
  assign wire108 = ((8'had) <<< wire97);
  assign wire109 = {($unsigned($signed($unsigned(wire78))) ?
                           $signed($unsigned(((8'ha3) ?
                               wire103 : wire107))) : $signed(((-wire79) ^~ (!wire100))))};
  assign wire110 = (^~$unsigned(wire78[(3'h7):(1'h0)]));
  assign wire111 = ({$unsigned((wire104 && (&wire78))),
                           (wire106 && ($unsigned(wire105) ^~ $unsigned(wire103)))} ?
                       ($signed(wire101) - $unsigned($unsigned((wire103 ?
                           wire99 : wire102)))) : $unsigned((^$signed($unsigned((8'hbd))))));
  module112 #() modinst133 (.wire113(wire110), .clk(clk), .wire117(wire101), .y(wire132), .wire114(wire77), .wire115(wire103), .wire116(wire104));
  always
    @(posedge clk) begin
      reg134 <= {($unsigned(($unsigned(wire76) ?
              (wire99 ?
                  wire109 : wire80) : (^(8'ha5)))) >>> $unsigned($unsigned((wire97 ?
              wire99 : (8'ha6))))),
          $signed((wire78 ?
              (wire106 * (^~wire80)) : $signed(wire99[(1'h1):(1'h1)])))};
      reg135 <= {$unsigned($unsigned($signed((wire109 ? wire102 : wire81))))};
      reg136 <= ((7'h41) > ($unsigned({$signed(wire104)}) < {(8'hb0)}));
    end
  assign wire137 = $unsigned($unsigned($unsigned($unsigned($unsigned(wire105)))));
endmodule

module module7
#(parameter param71 = (((&(8'hbd)) ? (^~(~((8'hb9) ? (8'h9c) : (8'hb6)))) : {(&{(8'h9c), (8'hbc)})}) ? (~|(({(8'h9c), (8'ha7)} - {(8'hbe)}) ? (((8'haf) - (8'ha1)) ? (~|(8'ha4)) : ((8'ha9) >= (7'h41))) : (((8'ha6) || (7'h43)) ? ((8'ha7) ? (8'haa) : (8'ha7)) : (~|(7'h42))))) : (8'ha0)), 
parameter param72 = ((8'hb3) != (param71 ? param71 : param71)))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire62;
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire12,
                 wire62,
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
                 (1'h0)};
  assign wire12 = ({$signed($unsigned((wire11 > wire11)))} && wire8);
  always
    @(posedge clk) begin
      reg13 <= (8'hba);
      reg14 <= wire10[(3'h5):(1'h1)];
      if ($unsigned({$signed((~|(wire11 >>> (8'hb8))))}))
        begin
          reg15 <= $signed($unsigned($unsigned(((wire8 ? wire12 : wire10) ?
              {reg13} : {reg14}))));
        end
      else
        begin
          reg15 <= $unsigned(wire12[(2'h3):(2'h3)]);
          if ((!reg14))
            begin
              reg16 <= (~(-$unsigned({$unsigned(reg15)})));
              reg17 <= $signed(wire12);
              reg18 <= ((($signed({wire12}) ?
                      (~$unsigned(reg17)) : {((8'h9f) ? wire10 : wire12),
                          (reg16 != reg16)}) ?
                  (wire11 < $unsigned((reg15 ?
                      wire11 : reg17))) : (-$signed(wire11))) - $signed((-(|(wire9 ?
                  reg17 : reg14)))));
              reg19 <= $signed({{((~wire11) ? $signed(reg17) : wire8),
                      $unsigned($unsigned(reg16))},
                  {reg14[(2'h2):(1'h1)], reg14[(2'h2):(1'h1)]}});
            end
          else
            begin
              reg16 <= (({(~&reg19), $signed({wire9})} ?
                  reg18 : $unsigned(reg17[(3'h7):(1'h0)])) & reg18);
              reg17 <= ({$signed(wire8[(4'hd):(4'h9)])} ?
                  (!{reg16}) : ((reg17[(1'h1):(1'h0)] << (^~$unsigned(reg16))) * $signed(((reg15 <<< (8'ha8)) ~^ $signed(wire10)))));
            end
          reg20 <= ($unsigned($signed(($signed(wire12) ?
              (8'ha7) : (reg13 - reg17)))) + reg13[(3'h6):(1'h1)]);
        end
      if ((wire12[(2'h3):(1'h1)] != (reg20 ?
          ($unsigned(reg17) >= reg13[(3'h5):(1'h0)]) : $signed(reg13))))
        begin
          reg21 <= wire8;
        end
      else
        begin
          if ($unsigned((wire9[(4'ha):(4'h9)] ?
              ({wire8, (reg21 ? wire8 : reg16)} ?
                  (~|(~reg17)) : wire9) : wire10[(2'h2):(2'h2)])))
            begin
              reg21 <= (~|($signed(($signed(wire8) ?
                  wire11[(3'h7):(3'h5)] : $unsigned(wire11))) ^~ $unsigned($unsigned((~reg20)))));
              reg22 <= wire9[(3'h7):(1'h0)];
              reg23 <= reg14[(1'h0):(1'h0)];
              reg24 <= ($signed((8'had)) ?
                  reg18[(2'h3):(1'h0)] : ((8'hb4) ?
                      (((~|reg16) ?
                          $signed(reg17) : $signed(reg22)) ~^ (reg18[(3'h6):(3'h6)] ?
                          (wire8 ? (7'h43) : reg13) : (wire12 ?
                              reg18 : reg22))) : reg20[(3'h4):(2'h3)]));
              reg25 <= {$signed((^~$signed($unsigned(reg18)))),
                  (~reg18[(2'h2):(1'h0)])};
            end
          else
            begin
              reg21 <= ((reg21[(4'ha):(1'h1)] ?
                      (($signed(reg21) >>> reg20) >>> $unsigned((~|reg20))) : reg19[(4'ha):(4'ha)]) ?
                  reg25 : (&((wire11 || $unsigned(reg14)) ?
                      {{reg25, reg21}} : (^$unsigned(reg23)))));
              reg22 <= $unsigned(($signed(reg17) || (($signed(wire9) - wire9) ?
                  $signed($signed(reg16)) : ((~|reg25) * (reg23 >> (8'hac))))));
              reg23 <= {(8'hb3)};
              reg24 <= reg21[(4'hc):(3'h4)];
            end
          if (reg19[(2'h3):(1'h1)])
            begin
              reg26 <= $unsigned($unsigned((~^$unsigned($signed(reg25)))));
              reg27 <= $signed($signed(reg14));
              reg28 <= wire10;
              reg29 <= wire12[(3'h5):(2'h3)];
              reg30 <= $signed(wire8[(3'h4):(1'h0)]);
            end
          else
            begin
              reg26 <= {reg22, $unsigned(reg24[(3'h4):(2'h3)])};
              reg27 <= $signed((^(^~reg21)));
            end
        end
    end
  module31 #() modinst63 (.wire35(reg25), .y(wire62), .wire33(wire9), .clk(clk), .wire34(reg20), .wire32(reg28));
  assign wire64 = (($unsigned($signed(reg25[(4'hd):(4'hb)])) ?
                      $unsigned((wire62[(1'h1):(1'h1)] ?
                          (~reg28) : (8'ha8))) : reg20[(1'h1):(1'h0)]) | $signed($unsigned(((!reg26) >> wire9))));
  assign wire65 = reg27[(3'h5):(3'h5)];
  assign wire66 = reg16[(3'h5):(1'h0)];
  assign wire67 = wire64;
  assign wire68 = reg13;
  assign wire69 = reg21[(4'hc):(3'h7)];
  assign wire70 = reg22;
endmodule

module module31
#(parameter param60 = (~&{{{((8'hb0) ? (8'ha9) : (7'h43)), ((8'hbf) >= (8'hb3))}, (^~((8'hb7) >>> (8'h9d)))}}), 
parameter param61 = param60)
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire35;
  input wire [(3'h6):(1'h0)] wire34;
  input wire [(4'ha):(1'h0)] wire33;
  input wire [(4'he):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire36;
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire45,
                 wire44,
                 wire36,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire36 = (($unsigned($signed((&wire34))) ?
                      wire34[(3'h6):(1'h0)] : ($signed($signed(wire34)) > wire33[(4'ha):(1'h1)])) == (^(wire34 ?
                      (wire34[(3'h4):(1'h0)] <= (8'ha2)) : (wire35[(3'h6):(1'h1)] >>> $signed((8'hb6))))));
  always
    @(posedge clk) begin
      if ((~$signed($unsigned(wire32[(3'h6):(1'h0)]))))
        begin
          reg37 <= ((8'had) ?
              (-wire35[(2'h3):(2'h2)]) : ($unsigned((wire34 ?
                  (wire35 && wire32) : ((8'ha9) ?
                      wire33 : (8'ha4)))) >> $unsigned(wire33[(3'h5):(2'h3)])));
        end
      else
        begin
          reg37 <= $unsigned(reg37[(1'h0):(1'h0)]);
          reg38 <= wire36[(3'h4):(2'h2)];
          reg39 <= wire32;
        end
      reg40 <= (|wire33);
      reg41 <= {(~^reg38[(2'h3):(2'h3)])};
      reg42 <= {wire33,
          ($signed(wire34) == (($unsigned(reg39) != $unsigned(wire34)) ?
              reg39 : ((wire32 ? wire32 : wire34) ?
                  $unsigned((8'haa)) : $unsigned((8'ha8)))))};
      reg43 <= (~|($unsigned($signed($unsigned(wire35))) ?
          wire35[(4'ha):(2'h2)] : $signed(reg40)));
    end
  assign wire44 = {($unsigned({((7'h41) ~^ reg43)}) ~^ ($signed($unsigned(reg39)) ~^ $signed(wire36)))};
  assign wire45 = wire33;
  always
    @(posedge clk) begin
      reg46 <= (~^{wire35, $signed($signed((|wire36)))});
      reg47 <= $signed(reg46);
      reg48 <= reg46;
      reg49 <= $signed($unsigned($signed($unsigned((wire45 ?
          wire45 : wire35)))));
      if ({reg43[(3'h4):(2'h3)]})
        begin
          reg50 <= (reg48 ?
              $signed({(8'h9e)}) : ($signed((|$signed(reg49))) <<< $signed((^reg47[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg50 <= $signed(reg43);
          reg51 <= ($unsigned($signed(((wire36 >= wire35) <<< (~&(8'hb3))))) || (wire35 ?
              $signed($unsigned(reg40)) : wire44));
          reg52 <= (~|reg41[(4'h9):(2'h3)]);
        end
    end
  assign wire53 = $unsigned((($signed($signed(wire36)) ?
                      $unsigned((reg50 >>> reg49)) : (~&wire33)) ^ reg42));
  assign wire54 = wire32[(3'h7):(3'h5)];
  assign wire55 = $unsigned({(reg42[(2'h2):(2'h2)] ?
                          ($unsigned(reg49) <= reg41[(4'hc):(2'h2)]) : $unsigned((wire54 ?
                              wire45 : reg40))),
                      wire45});
  assign wire56 = ($unsigned(wire32[(3'h5):(3'h4)]) >= $signed($signed($signed($unsigned(wire34)))));
  assign wire57 = {(~$unsigned(((~^(8'ha4)) ?
                          reg48[(2'h3):(1'h0)] : (wire53 ? (7'h43) : wire33)))),
                      $unsigned((($unsigned(reg39) ?
                              (^reg46) : (wire34 ? reg40 : reg46)) ?
                          ($unsigned(reg41) ?
                              wire34[(2'h2):(2'h2)] : (reg46 * wire45)) : reg38))};
  assign wire58 = wire55;
  assign wire59 = $unsigned(($unsigned(((reg46 <= reg41) == (~&wire54))) ?
                      ((wire57 * (reg38 >> (8'ha0))) ?
                          $unsigned(reg50) : $unsigned(reg47)) : reg38[(5'h14):(2'h3)]));
endmodule

module module112  (y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire117;
  input wire signed [(4'hb):(1'h0)] wire116;
  input wire signed [(3'h7):(1'h0)] wire115;
  input wire [(4'h9):(1'h0)] wire114;
  input wire [(4'hf):(1'h0)] wire113;
  wire [(3'h6):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  wire signed [(5'h13):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire118;
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg126,
                 (1'h0)};
  assign wire118 = $signed((wire115[(1'h0):(1'h0)] ?
                       ({(8'hbd),
                           {wire115,
                               wire114}} < wire116) : {wire114[(3'h6):(2'h3)],
                           ((~|wire115) ?
                               $signed(wire114) : (wire117 ?
                                   wire114 : wire115))}));
  assign wire119 = wire115;
  assign wire120 = (wire113 << {wire115[(1'h0):(1'h0)]});
  assign wire121 = {$signed({$signed($signed((8'hb8))),
                           $signed((wire118 == wire116))})};
  assign wire122 = ((wire114[(3'h4):(2'h2)] ^~ (wire120 ?
                           wire117[(4'hc):(2'h2)] : (8'ha9))) ?
                       ((wire119[(3'h5):(3'h4)] > $unsigned(wire116)) ?
                           wire118 : wire121) : wire118);
  assign wire123 = (wire122[(4'ha):(3'h6)] ?
                       ($unsigned(($unsigned(wire121) <<< wire114[(1'h0):(1'h0)])) ?
                           (-$unsigned($signed(wire121))) : $unsigned($signed(wire114[(3'h5):(1'h0)]))) : wire114[(3'h4):(1'h1)]);
  assign wire124 = (^~wire118);
  assign wire125 = ((+wire120[(1'h0):(1'h0)]) ?
                       $signed(wire114) : (((~^(^~wire123)) && wire117[(1'h1):(1'h0)]) ?
                           wire113[(4'hf):(4'hf)] : wire122[(5'h12):(5'h11)]));
  always
    @(posedge clk) begin
      reg126 <= wire122;
    end
  assign wire127 = wire119[(3'h4):(1'h1)];
  assign wire128 = (($signed($unsigned(wire125[(3'h6):(3'h5)])) ?
                       ({$signed(wire118)} || $unsigned(wire115[(3'h7):(3'h7)])) : $unsigned($unsigned((wire114 ?
                           wire113 : (8'hb6))))) && {$signed($signed((~|(8'h9d))))});
  assign wire129 = ($signed(wire125[(3'h6):(3'h6)]) * $signed({(|wire122[(4'ha):(4'h8)]),
                       (8'ha8)}));
  assign wire130 = wire124[(1'h0):(1'h0)];
  assign wire131 = wire130[(2'h3):(1'h0)];
endmodule

module module82
#(parameter param95 = (((^~{((7'h40) ? (8'hb2) : (8'ha0)), ((8'hb0) << (8'ha0))}) >> ((!(+(7'h43))) ? (((8'ha3) ~^ (8'hbc)) ? (8'ha0) : ((8'haf) <<< (8'hab))) : (~^((8'ha5) + (7'h43))))) ? (8'haf) : {(~^({(8'hba)} ? ((8'h9d) ~^ (8'hb4)) : ((8'hac) ^ (8'hbf)))), ((|((8'hb2) ? (8'hb7) : (8'hb5))) || (+((8'hab) >>> (8'h9c))))}), 
parameter param96 = (8'hab))
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire87;
  input wire signed [(4'hd):(1'h0)] wire86;
  input wire [(4'ha):(1'h0)] wire85;
  input wire [(2'h2):(1'h0)] wire84;
  input wire signed [(5'h11):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  assign y = {wire94, wire93, wire92, wire91, wire90, wire89, wire88, (1'h0)};
  assign wire88 = ($unsigned((!wire86)) + $unsigned({(~|(wire84 & wire87))}));
  assign wire89 = $signed((^(($unsigned(wire86) * $unsigned(wire83)) ?
                      wire84[(1'h0):(1'h0)] : $unsigned($unsigned(wire86)))));
  assign wire90 = {(~&$unsigned(wire84)),
                      ($signed(((!(8'h9e)) >> $signed((8'ha2)))) ~^ (~^(~^(wire85 ?
                          wire88 : wire83))))};
  assign wire91 = (~&wire87);
  assign wire92 = $signed(wire87);
  assign wire93 = $signed($unsigned(((|$unsigned(wire83)) <<< {(wire86 == wire83)})));
  assign wire94 = wire84[(2'h2):(1'h0)];
endmodule
