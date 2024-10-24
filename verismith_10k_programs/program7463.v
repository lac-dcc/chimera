module top
#(parameter param144 = (~^((8'hb6) ? (|(~^(~&(7'h44)))) : (|(((8'ha9) || (8'hbe)) ? {(8'hbd)} : ((7'h43) & (7'h40)))))), 
parameter param145 = (param144 ? param144 : (param144 | (8'hbc))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  assign y = {wire143, wire141, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($unsigned((wire0 ?
                     ((wire1 & (7'h44)) ?
                         (|wire1) : wire0[(3'h7):(1'h0)]) : wire2)) ~^ wire2);
  assign wire5 = wire1;
  assign wire6 = (!(wire3[(2'h3):(2'h3)] ?
                     (^~((wire1 ? wire0 : wire1) ?
                         wire4[(2'h3):(1'h0)] : ((8'hbe) ?
                             (7'h41) : wire2))) : wire4[(3'h7):(3'h4)]));
  module7 #() modinst142 (wire141, clk, wire2, wire3, wire6, wire5);
  assign wire143 = ({wire0[(4'ha):(4'h8)],
                       (wire4[(3'h6):(2'h3)] == (^{(8'hb3),
                           wire6}))} << ((($unsigned(wire3) ?
                           wire4 : wire2[(4'hc):(4'hb)]) ?
                       $unsigned($signed(wire4)) : ($signed((7'h41)) > (~wire2))) == wire2[(4'hc):(3'h5)]));
endmodule

module module7
#(parameter param139 = {(|{(~&((8'hb0) + (8'had))), (((8'hb4) >= (7'h44)) * ((8'h9c) + (8'hbc)))})}, 
parameter param140 = ((param139 ? (~&((7'h40) ? {param139, param139} : (param139 >>> param139))) : {(param139 <= param139)}) ? {((~&(param139 ? (8'hab) : param139)) ~^ {(~^param139), {param139, (8'ha0)}}), (!((param139 ^~ (8'haa)) == {param139, param139}))} : (param139 ? (!(&(param139 <<< param139))) : param139)))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h220):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire88;
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire134,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire88,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= wire11;
      if (wire11)
        begin
          reg13 <= wire11[(1'h0):(1'h0)];
          reg14 <= (-$unsigned(($unsigned((8'ha7)) ?
              $unsigned($signed(wire9)) : ((~wire8) ^ $signed(wire9)))));
          reg15 <= (~^((^~reg13[(3'h6):(1'h0)]) && wire10[(3'h6):(3'h6)]));
          reg16 <= wire8[(1'h1):(1'h1)];
          reg17 <= $signed(wire9);
        end
      else
        begin
          reg13 <= {{(!wire8),
                  $unsigned(($signed(reg17) ?
                      $unsigned(wire11) : reg14[(4'hc):(1'h0)]))},
              reg15[(3'h6):(3'h4)]};
        end
      reg18 <= wire11;
    end
  assign wire19 = $signed((8'hba));
  assign wire20 = ($unsigned($unsigned((reg15 ?
                          (reg16 ~^ (8'ha3)) : wire19[(4'hf):(3'h5)]))) ?
                      (-wire9[(4'h9):(4'h8)]) : $signed((reg17 ?
                          wire19[(3'h5):(3'h4)] : $signed((8'ha4)))));
  assign wire21 = $unsigned($unsigned(reg14));
  assign wire22 = wire19[(4'h9):(3'h4)];
  assign wire23 = {($signed($signed($signed(reg13))) | ($signed((wire9 ^ (8'ha2))) ?
                          {(reg15 == reg12),
                              (reg16 ?
                                  reg15 : wire8)} : $signed($unsigned(wire10))))};
  always
    @(posedge clk) begin
      if ((8'hb3))
        begin
          if (((!{$unsigned($unsigned(wire10)),
                  ((wire9 ? reg18 : reg12) <= $unsigned(reg18))}) ?
              ($unsigned((reg13 ?
                  {reg16, wire11} : $unsigned(wire9))) == wire11) : (8'ha3)))
            begin
              reg24 <= reg16;
              reg25 <= (reg24 ^~ (($signed((wire23 >= reg16)) >= (reg13[(5'h10):(2'h3)] ?
                  ((8'hb2) ?
                      reg17 : reg15) : ((8'hb7) <<< reg14))) << wire23[(4'h8):(1'h1)]));
            end
          else
            begin
              reg24 <= $unsigned(wire11[(4'h9):(3'h4)]);
              reg25 <= (($signed((reg15 ?
                  $signed(reg24) : ((8'hbf) ?
                      (8'had) : reg14))) ~^ wire11) ~^ ((~^((8'hb5) ?
                  {wire23,
                      (8'ha9)} : wire9[(1'h0):(1'h0)])) - (wire21[(3'h7):(1'h1)] < reg18)));
              reg26 <= $unsigned(((~&$signed((reg17 == wire8))) >>> ((~&reg17[(5'h12):(2'h3)]) < $signed((reg14 ^ reg18)))));
              reg27 <= $signed((-$unsigned(wire21[(2'h2):(1'h1)])));
            end
          if (wire8[(2'h2):(1'h0)])
            begin
              reg28 <= ($signed(((wire20 * (reg17 || reg13)) ?
                      reg12 : $signed(reg13[(5'h10):(2'h2)]))) ?
                  (^reg18[(1'h1):(1'h0)]) : (!$signed(reg25[(5'h12):(1'h1)])));
            end
          else
            begin
              reg28 <= $signed((^~reg18));
              reg29 <= $signed((wire22[(2'h2):(1'h0)] >= $unsigned($unsigned($signed(wire20)))));
              reg30 <= (8'ha7);
            end
          reg31 <= ((+((~|(reg13 ? wire22 : reg13)) ?
              $unsigned((8'ha1)) : $unsigned((reg18 ?
                  wire21 : (7'h41))))) + reg17);
          reg32 <= $unsigned(reg12[(4'ha):(1'h1)]);
          reg33 <= $unsigned((wire22[(2'h2):(2'h2)] || ({(&wire8),
              $signed((8'hbb))} == {wire23})));
        end
      else
        begin
          reg24 <= ((reg29 >= {$unsigned($signed(reg29))}) ?
              (wire19 ?
                  wire20[(1'h0):(1'h0)] : (reg30 + $signed((~|reg31)))) : reg17[(5'h13):(3'h6)]);
          reg25 <= $unsigned((wire21[(2'h3):(2'h3)] * (-{reg13,
              wire20[(4'he):(4'ha)]})));
          reg26 <= (($signed(wire8[(4'hd):(4'hd)]) ?
                  $unsigned((|((8'hba) ~^ reg18))) : reg24) ?
              (((reg28 && reg31) ?
                      (-reg26[(1'h0):(1'h0)]) : $unsigned((~|reg30))) ?
                  wire11[(4'ha):(1'h1)] : ((((7'h40) ?
                          reg31 : reg18) < ((7'h42) ? wire20 : reg18)) ?
                      reg17[(4'h9):(3'h5)] : $signed($signed(reg18)))) : reg18[(1'h0):(1'h0)]);
          if ((~^reg24))
            begin
              reg27 <= (^$signed($unsigned(reg24[(2'h2):(2'h2)])));
            end
          else
            begin
              reg27 <= $signed($unsigned((^$signed(wire21[(3'h4):(2'h2)]))));
              reg28 <= (8'hbf);
              reg29 <= (reg31[(1'h1):(1'h0)] == (reg27[(3'h7):(1'h0)] & {reg33[(1'h0):(1'h0)],
                  reg13}));
              reg30 <= {(7'h43), wire20};
            end
          reg31 <= $unsigned(reg16);
        end
      reg34 <= $signed(((8'h9e) ? reg29 : $unsigned(wire23[(1'h1):(1'h0)])));
      if ((&(reg12[(4'hb):(3'h4)] * reg29)))
        begin
          reg35 <= ((((~^wire9[(1'h0):(1'h0)]) ?
                  $signed((8'hbb)) : wire22[(1'h1):(1'h0)]) < $signed(reg27)) ?
              (wire20[(2'h2):(2'h2)] ?
                  reg17 : {($unsigned(wire22) ?
                          (wire8 ? reg27 : wire21) : reg17),
                      $signed($unsigned(reg12))}) : {(~|($unsigned((8'h9c)) ?
                      ((8'ha5) || wire20) : (!wire9)))});
          if ($signed({$unsigned(wire9)}))
            begin
              reg36 <= (($unsigned(($signed(reg16) ?
                          (reg25 ? wire19 : reg26) : reg13[(5'h14):(3'h6)])) ?
                      wire23 : $unsigned(wire20[(5'h14):(4'hf)])) ?
                  (((-(reg31 ^ reg33)) ?
                      ((-reg32) ^~ (reg34 || reg18)) : reg13) != $unsigned(reg15[(1'h1):(1'h1)])) : reg27[(3'h5):(3'h4)]);
              reg37 <= (+$signed(reg27[(2'h3):(2'h3)]));
              reg38 <= reg24;
              reg39 <= $unsigned(reg14);
            end
          else
            begin
              reg36 <= reg14;
              reg37 <= (({$signed(reg12)} ?
                  ($signed($unsigned(reg31)) & (reg29[(2'h2):(1'h0)] + $signed(reg26))) : (~|(((8'haa) ?
                      wire19 : (8'hbe)) ~^ (^wire22)))) | (reg31[(3'h7):(2'h2)] == (wire23[(3'h6):(2'h3)] ?
                  $unsigned($signed(reg27)) : $signed(reg35[(3'h5):(1'h1)]))));
              reg38 <= {(({(reg16 ? reg32 : wire10)} != ((wire9 ?
                              wire22 : reg37) ?
                          (|reg28) : $unsigned((8'ha9)))) ?
                      ((&reg29) ^ $unsigned($unsigned(reg25))) : $unsigned((+$signed(reg38))))};
              reg39 <= ($signed($signed($signed(reg12))) ?
                  reg33 : (wire19[(5'h10):(4'hc)] == reg25));
              reg40 <= ({{$unsigned($signed(reg26))},
                  ((~&reg14) ?
                      (wire11[(3'h7):(1'h0)] > {reg32}) : $signed(reg13[(5'h12):(5'h11)]))} & (~&(reg32[(4'h9):(3'h4)] & reg26)));
            end
          reg41 <= $signed($signed(reg28));
          if ($unsigned($unsigned((&reg18))))
            begin
              reg42 <= (reg35 != reg37[(4'ha):(4'h9)]);
              reg43 <= wire10[(1'h1):(1'h1)];
              reg44 <= wire22[(1'h0):(1'h0)];
              reg45 <= (reg40 ?
                  $signed($unsigned(reg35[(4'h9):(3'h5)])) : $unsigned({($unsigned(reg40) ?
                          (~|wire21) : (reg28 - reg38))}));
              reg46 <= (7'h40);
            end
          else
            begin
              reg42 <= $signed((reg34[(5'h10):(4'h9)] ?
                  reg30[(3'h7):(2'h3)] : reg46[(1'h1):(1'h1)]));
              reg43 <= reg37[(4'h8):(3'h4)];
            end
          reg47 <= wire11[(4'ha):(4'ha)];
        end
      else
        begin
          if (reg16[(2'h2):(1'h1)])
            begin
              reg35 <= ($signed((&reg47)) ?
                  {($unsigned({reg17}) ?
                          (reg18[(1'h1):(1'h1)] ?
                              (~&wire9) : $signed(wire20)) : ((reg27 ?
                              (8'ha9) : (8'ha2)) + {reg34, reg43})),
                      $unsigned((8'ha6))} : (^~((reg18 ?
                          ((8'ha4) != (8'ha3)) : (reg12 ? reg29 : reg14)) ?
                      (^$unsigned(wire11)) : $unsigned((reg15 || wire22)))));
              reg36 <= (reg18 ?
                  $unsigned((reg30 ?
                      (~^(reg34 <<< wire8)) : ($signed(reg32) ?
                          (reg29 ?
                              reg31 : (8'ha6)) : (^~wire9)))) : $signed((-(+(wire9 ?
                      wire10 : (7'h42))))));
            end
          else
            begin
              reg35 <= $signed($signed($unsigned($signed((reg17 ?
                  reg35 : (8'hb2))))));
            end
          reg37 <= reg27;
          reg38 <= (reg32[(4'hc):(4'ha)] * ($unsigned($unsigned(reg47)) ?
              reg34[(4'hf):(4'hf)] : (~&(8'hbb))));
        end
    end
  module48 #() modinst89 (wire88, clk, wire11, reg26, reg29, reg14);
  assign wire90 = ((^($signed($unsigned(reg47)) & $signed((reg47 ?
                          reg25 : wire11)))) ?
                      $unsigned((^reg16[(4'hb):(3'h4)])) : $unsigned((^~(+{reg14}))));
  assign wire91 = ((($signed(reg31[(4'ha):(4'h9)]) ?
                          wire20[(4'ha):(2'h3)] : $signed(reg18[(2'h2):(1'h1)])) * (wire22[(1'h0):(1'h0)] ^ (8'h9e))) ?
                      reg39[(3'h6):(1'h0)] : $signed(((~^$signed(reg43)) ?
                          $signed((reg16 ?
                              (8'ha2) : wire10)) : reg44[(2'h2):(1'h0)])));
  assign wire92 = $unsigned((^(wire90 == (reg17 ?
                      {reg26, reg27} : (reg41 ^ reg17)))));
  assign wire93 = ($signed(reg41[(3'h6):(2'h3)]) || $signed(reg33));
  module94 #() modinst135 (.wire97(reg14), .wire98(wire92), .y(wire134), .clk(clk), .wire95(wire8), .wire99(reg34), .wire96(reg38));
  assign wire136 = reg33[(1'h0):(1'h0)];
  assign wire137 = {((~reg40) ?
                           (|reg24[(3'h4):(2'h3)]) : (~^$signed($unsigned(reg36)))),
                       ($signed((^$unsigned((8'ha2)))) ?
                           wire134[(1'h1):(1'h0)] : (8'hac))};
  assign wire138 = {$signed($signed(reg33)), reg44[(2'h2):(1'h1)]};
endmodule

module module94  (y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire99;
  input wire signed [(4'h9):(1'h0)] wire98;
  input wire [(4'ha):(1'h0)] wire97;
  input wire signed [(3'h5):(1'h0)] wire96;
  input wire signed [(2'h2):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire104;
  wire [(5'h13):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire100;
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  assign y = {wire133,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
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
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire100 = (~^$unsigned({(~^(wire98 ? wire97 : wire99)),
                       ((~wire95) && (+(8'ha7)))}));
  assign wire101 = ($signed((~$unsigned($unsigned(wire95)))) <<< $signed($signed($unsigned((~&wire98)))));
  assign wire102 = $signed(($signed(wire101) ?
                       (~^({wire96, wire98} ?
                           (wire100 & wire99) : wire95)) : $unsigned((wire97 ?
                           (+(8'had)) : $unsigned(wire99)))));
  assign wire103 = $unsigned(((8'hb6) ?
                       $signed(wire97) : $signed((wire102[(3'h6):(2'h2)] ?
                           (&wire100) : (-(8'hae))))));
  assign wire104 = (8'ha3);
  assign wire105 = (^(($signed(wire99[(4'h8):(4'h8)]) ?
                       $unsigned(wire96) : ((wire104 ?
                           wire101 : (8'hbd)) | ((8'hb5) ?
                           wire95 : wire103))) == wire100));
  assign wire106 = ((^(({wire97} ? wire105[(4'h8):(3'h4)] : $signed(wire102)) ?
                       (~&(wire101 ? wire95 : wire98)) : {{wire96,
                               wire104}})) & $signed((wire105 ?
                       (^(8'hb9)) : (wire99[(3'h4):(3'h4)] ^ (wire96 ?
                           wire102 : wire105)))));
  always
    @(posedge clk) begin
      reg107 <= $unsigned(wire97);
      if ($signed($unsigned(reg107[(2'h2):(1'h1)])))
        begin
          reg108 <= $signed($signed((((wire104 ?
              wire106 : wire96) || (&wire98)) >= $signed((wire100 ?
              wire102 : wire96)))));
          reg109 <= $unsigned($signed((wire106[(2'h2):(1'h1)] ?
              $signed($unsigned((8'ha5))) : ((-wire99) <<< (wire98 ?
                  wire98 : (8'hb8))))));
          reg110 <= {((((8'had) ?
                      $unsigned(wire104) : reg107[(1'h1):(1'h1)]) >>> $unsigned(reg109)) ?
                  {wire104,
                      $unsigned((!wire104))} : (~^$unsigned((wire98 >>> wire95)))),
              wire97};
          reg111 <= $signed(wire104[(4'h9):(4'h9)]);
        end
      else
        begin
          if (reg111)
            begin
              reg108 <= {(!wire103)};
              reg109 <= $signed(((((reg107 ? wire103 : reg110) ~^ (+wire105)) ?
                      $signed((wire104 ? wire102 : (8'hbe))) : ({wire100,
                          wire103} >>> reg107)) ?
                  (^~$unsigned($unsigned(reg109))) : wire103));
              reg110 <= (~^((-$signed((+wire105))) | (($unsigned(wire101) >> ((7'h41) & wire103)) ?
                  (~$unsigned(wire97)) : wire95)));
            end
          else
            begin
              reg108 <= {$signed(($unsigned((wire98 != wire101)) == ($signed(wire97) ?
                      (8'ha3) : (~&wire101)))),
                  wire96};
              reg109 <= $signed({wire97,
                  $unsigned((wire105 ? $unsigned(wire100) : (&reg108)))});
            end
        end
      if (((wire101[(4'hd):(3'h5)] ?
          ($signed(reg110) ?
              $unsigned(wire103[(5'h10):(4'he)]) : $unsigned($unsigned(wire98))) : (($unsigned((7'h44)) > {wire100}) > reg109[(4'hf):(4'he)])) && (wire103 ?
          (^~$unsigned($signed(wire97))) : wire99[(4'hf):(4'hd)])))
        begin
          reg112 <= ((wire99 != wire98) ?
              $unsigned($signed(wire106)) : ((^(&$signed(reg107))) ?
                  (+((wire104 - (8'haa)) ?
                      (reg107 ? (8'h9c) : wire95) : (reg108 ?
                          reg111 : wire106))) : (~(^~(wire102 ?
                      wire105 : wire95)))));
          reg113 <= $signed(wire100);
          if (($signed((~|(reg113[(1'h0):(1'h0)] | reg112))) ?
              (!wire105[(4'he):(4'hb)]) : reg113[(4'ha):(1'h1)]))
            begin
              reg114 <= ($signed(reg113[(5'h13):(5'h11)]) ?
                  $signed(((wire104 ? (~wire106) : $signed(reg110)) ?
                      (reg111[(4'hc):(4'h9)] > (wire96 || wire104)) : $signed(wire101[(2'h2):(1'h0)]))) : (reg112[(2'h3):(1'h1)] ?
                      $signed((!wire103)) : wire98));
              reg115 <= $signed(wire105[(5'h10):(4'he)]);
            end
          else
            begin
              reg114 <= (({(8'h9d)} ?
                  (reg115[(1'h0):(1'h0)] ?
                      ((wire97 ? wire106 : reg111) ?
                          $signed(wire98) : wire105[(3'h7):(3'h4)]) : (^(~^reg114))) : wire104[(4'hd):(3'h5)]) >= ($unsigned($signed($signed(wire100))) ?
                  $unsigned((|(wire105 << wire101))) : wire102));
              reg115 <= $signed((~|$unsigned(((-wire100) ?
                  {reg115, wire101} : $signed(wire95)))));
              reg116 <= wire97;
              reg117 <= reg113[(4'h9):(4'h8)];
              reg118 <= reg109[(4'ha):(1'h0)];
            end
          reg119 <= wire101[(4'hd):(1'h1)];
          reg120 <= ($unsigned(((reg113[(3'h7):(2'h2)] >>> $signed(wire104)) ?
              wire105[(5'h10):(1'h0)] : $signed((wire104 ?
                  reg113 : wire106)))) >>> $signed($signed($unsigned(wire100))));
        end
      else
        begin
          reg112 <= reg108[(3'h6):(1'h0)];
          reg113 <= ((!$unsigned(($signed(wire105) >> $signed((8'ha5))))) ?
              $signed(wire101) : {$unsigned(reg116[(3'h4):(3'h4)])});
          reg114 <= reg107;
          reg115 <= (^~wire96);
          reg116 <= $unsigned($signed(wire100));
        end
      if ({(~|(~^reg108[(1'h1):(1'h0)])), $signed(wire97)})
        begin
          reg121 <= {reg108};
          reg122 <= $signed((~^((~&reg115[(4'hc):(3'h5)]) ~^ ($unsigned(wire98) ?
              $unsigned(reg115) : $signed(reg119)))));
          if ($unsigned({reg116[(4'h9):(4'h8)]}))
            begin
              reg123 <= {$signed($unsigned($unsigned((7'h44))))};
              reg124 <= wire105;
              reg125 <= wire104[(3'h5):(1'h1)];
            end
          else
            begin
              reg123 <= wire104[(4'h9):(1'h1)];
              reg124 <= wire102[(2'h3):(2'h3)];
              reg125 <= reg109[(4'he):(4'h9)];
              reg126 <= wire101[(4'hd):(4'hd)];
            end
          if (reg126)
            begin
              reg127 <= (((^~reg114) ? reg125[(1'h1):(1'h1)] : (&reg117)) ?
                  wire95 : wire104[(3'h4):(2'h3)]);
              reg128 <= (~^$signed(reg118));
            end
          else
            begin
              reg127 <= (&$signed((reg121[(2'h3):(1'h0)] ?
                  {(reg107 && reg127),
                      $signed(wire105)} : reg118[(3'h4):(1'h1)])));
              reg128 <= reg107[(3'h7):(2'h2)];
              reg129 <= (reg124 | reg114[(1'h1):(1'h0)]);
              reg130 <= $unsigned({$signed($unsigned(reg113[(2'h2):(2'h2)]))});
              reg131 <= {{(reg124 ?
                          $signed((reg121 ?
                              wire100 : reg116)) : $unsigned((wire97 & reg114)))}};
            end
          reg132 <= wire102;
        end
      else
        begin
          reg121 <= wire105;
        end
    end
  assign wire133 = (~|(((~reg107) >>> ((reg124 ^ reg121) == (^reg117))) ~^ (|(+$signed(reg132)))));
endmodule

module module48
#(parameter param87 = {(((^(^~(8'hb2))) ? (~&((8'hae) & (8'hb8))) : (((8'hb0) != (8'hbc)) ^ ((8'ha6) ? (8'hb7) : (7'h42)))) >> (^({(8'ha7)} ? ((8'hb9) || (8'hbf)) : ((8'haa) || (8'ha4)))))})
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire52;
  input wire signed [(5'h14):(1'h0)] wire51;
  input wire signed [(3'h4):(1'h0)] wire50;
  input wire [(5'h15):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire79,
                 wire78,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire53 = wire49;
  assign wire54 = wire50;
  assign wire55 = (8'ha9);
  assign wire56 = (~^$signed(wire53[(3'h6):(3'h4)]));
  assign wire57 = wire53[(3'h6):(3'h5)];
  assign wire58 = {$unsigned((!((!wire53) * $signed(wire54)))), wire57};
  always
    @(posedge clk) begin
      reg59 <= wire54;
      if (wire52)
        begin
          reg60 <= (-$unsigned($signed((wire50 ?
              (wire51 * wire53) : {(8'h9e), wire57}))));
          reg61 <= $unsigned(wire58[(2'h2):(2'h2)]);
          reg62 <= {wire53[(2'h3):(1'h0)]};
          reg63 <= wire55[(1'h1):(1'h1)];
        end
      else
        begin
          reg60 <= {$signed({{(+(8'haa))}})};
          if (({$unsigned((&(wire52 & wire54))),
              $unsigned(((wire57 ?
                  wire55 : wire51) != wire55[(4'h9):(2'h2)]))} != ($unsigned(wire58[(1'h1):(1'h1)]) - (~^$signed({reg59,
              wire53})))))
            begin
              reg61 <= $signed($signed(((^~wire52) << (reg59 <= $signed(reg60)))));
            end
          else
            begin
              reg61 <= $signed(wire50[(1'h1):(1'h0)]);
              reg62 <= wire54;
              reg63 <= wire49;
              reg64 <= $unsigned($signed($unsigned({wire51[(4'h9):(1'h0)],
                  (wire49 || wire56)})));
            end
        end
    end
  always
    @(posedge clk) begin
      if ((~|(($signed((reg61 ~^ (8'hb3))) ?
              ((wire58 < reg62) == reg60[(3'h5):(3'h5)]) : reg60) ?
          $signed((+wire49[(5'h10):(4'hd)])) : $signed((~(reg62 - reg63))))))
        begin
          reg65 <= $signed((reg60[(4'ha):(4'ha)] ?
              {$signed({(7'h42)})} : $signed($signed((reg61 * wire50)))));
        end
      else
        begin
          reg65 <= reg61;
          reg66 <= (~^{((^reg59[(4'he):(4'h8)]) ?
                  ($unsigned(reg61) ?
                      $signed(wire55) : (reg63 ?
                          wire50 : reg63)) : (^(wire58 <= wire58))),
              $signed((wire57[(4'ha):(3'h5)] - $unsigned(reg64)))});
          if (($signed(((!$unsigned(wire52)) ?
              wire57[(3'h7):(3'h4)] : {(-reg60),
                  (wire50 << reg60)})) || wire56))
            begin
              reg67 <= ($signed($unsigned($signed((wire52 ?
                  wire55 : reg64)))) ^~ reg60);
              reg68 <= (^~wire49);
              reg69 <= (({$unsigned((wire58 >>> (8'haa))),
                      (8'hb4)} - (!($signed((8'hbc)) ?
                      ((8'ha8) ? reg63 : wire52) : $signed(reg60)))) ?
                  (~^wire55[(1'h0):(1'h0)]) : wire57);
              reg70 <= $unsigned(reg68[(3'h6):(1'h1)]);
            end
          else
            begin
              reg67 <= (~{wire50[(1'h1):(1'h1)],
                  ($unsigned((8'hb2)) ? reg66 : reg70)});
              reg68 <= $signed(wire50[(2'h2):(1'h1)]);
            end
        end
      reg71 <= $signed(reg65);
      if ({$signed($unsigned(($signed(reg70) > $unsigned(wire57)))),
          ($unsigned($unsigned(reg68[(3'h5):(1'h0)])) >>> $signed($unsigned((reg71 ?
              reg59 : (7'h41)))))})
        begin
          reg72 <= (wire56 ?
              wire53 : (reg67[(2'h3):(1'h1)] != reg69[(1'h0):(1'h0)]));
          reg73 <= $unsigned(wire58[(2'h2):(1'h1)]);
        end
      else
        begin
          if ((8'hb5))
            begin
              reg72 <= $unsigned(reg63[(1'h0):(1'h0)]);
              reg73 <= (8'hb7);
              reg74 <= reg71[(1'h0):(1'h0)];
            end
          else
            begin
              reg72 <= $signed($signed((~$unsigned(reg65[(4'h8):(3'h6)]))));
              reg73 <= (^(wire58[(3'h4):(2'h2)] ?
                  ($unsigned(reg67) ?
                      ((wire49 ? reg61 : reg67) != (wire52 ?
                          reg64 : reg63)) : $unsigned($unsigned(wire54))) : $unsigned(reg62[(1'h1):(1'h0)])));
              reg74 <= $unsigned((reg59 && (&reg61[(1'h1):(1'h0)])));
            end
          reg75 <= (~&$unsigned((((reg74 - reg65) >= wire58[(2'h3):(1'h0)]) ?
              reg67[(3'h5):(3'h5)] : (^~(reg66 ^ reg61)))));
          reg76 <= (reg64 ^ $unsigned($signed(((reg68 == wire50) ?
              (wire54 ^~ wire50) : reg62[(1'h0):(1'h0)]))));
          reg77 <= reg66[(5'h14):(5'h12)];
        end
    end
  assign wire78 = ({$unsigned((((8'had) ^~ wire53) & $signed((8'hb9)))),
                      (^~($signed(reg71) ?
                          (reg65 * (8'ha6)) : $signed(reg71)))} - ((reg69[(3'h6):(3'h4)] > reg75[(4'hd):(4'hc)]) ?
                      $unsigned({(wire52 && (8'hba)),
                          (-reg61)}) : $unsigned($unsigned($unsigned(reg65)))));
  assign wire79 = $unsigned($unsigned(($signed((reg59 ?
                      reg74 : reg71)) >> {(reg59 ? reg62 : reg77)})));
  always
    @(posedge clk) begin
      reg80 <= $unsigned((({reg60,
              (reg64 ? reg75 : (8'haf))} - reg62[(2'h2):(1'h0)]) ?
          (^((8'haa) ?
              (reg60 ? reg70 : reg62) : (|reg61))) : $signed({(&(8'hbd))})));
      reg81 <= (~|(8'hbb));
      reg82 <= (8'hab);
      reg83 <= wire78;
    end
  assign wire84 = ($unsigned(($unsigned(wire50) ?
                      ((reg73 ? wire52 : wire58) ?
                          reg81[(4'ha):(2'h3)] : (wire50 << reg70)) : $signed($unsigned((8'hae))))) != $unsigned({($unsigned(wire56) & reg69[(2'h2):(2'h2)]),
                      reg83}));
  assign wire85 = $signed($signed((reg74[(4'hc):(3'h7)] | ($unsigned(reg80) ?
                      $unsigned(wire50) : (~^reg83)))));
  assign wire86 = reg74;
endmodule
