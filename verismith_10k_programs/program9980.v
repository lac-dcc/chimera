module top
#(parameter param157 = ((((((8'ha4) ? (8'hb6) : (8'hbf)) ? ((8'ha3) ? (8'hae) : (8'hba)) : ((8'h9e) > (8'hb2))) - ((~&(8'h9c)) * {(8'hbb)})) >>> {(((8'hbe) != (7'h42)) <= ((7'h41) ? (8'hb1) : (8'ha7)))}) ? (((+{(8'hb8), (8'h9d)}) || {(&(8'ha4)), (8'hab)}) ^~ (((-(8'hb5)) ? ((8'hb3) ? (8'hba) : (7'h44)) : ((8'h9e) >> (8'hac))) + (^~(!(8'ha9))))) : (^~((((8'hab) ? (8'hab) : (8'hbc)) ? (~(8'hbe)) : ((8'ha1) ? (8'h9c) : (8'ha6))) ? {(|(7'h40))} : (((8'ha5) == (8'ha1)) ? (~|(8'hb0)) : {(7'h40)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire91;
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 (1'h0)};
  module4 #() modinst92 (wire91, clk, wire2, wire0, wire3, wire1, (8'ha1));
  assign wire93 = ({$signed($unsigned((~|wire91))),
                          (wire91 ?
                              (wire0 || ((8'ha2) + wire1)) : $unsigned({wire1}))} ?
                      (wire2[(3'h5):(1'h1)] ?
                          wire3 : $unsigned($unsigned({wire0}))) : $signed((wire2[(5'h11):(1'h1)] ?
                          $signed($unsigned(wire0)) : (wire2[(5'h13):(4'h9)] ?
                              (wire91 ? wire1 : wire0) : wire2))));
  assign wire94 = $unsigned(((((~^wire0) > $unsigned(wire2)) ^~ $unsigned((8'ha7))) ?
                      $unsigned(((wire1 & (8'ha1)) ?
                          $signed(wire91) : $unsigned(wire2))) : wire91[(1'h0):(1'h0)]));
  assign wire95 = (^wire1[(1'h0):(1'h0)]);
  assign wire96 = $unsigned($unsigned($signed((-wire93))));
  assign wire97 = {$signed(({{wire1}, wire3} ?
                          wire94[(4'hc):(3'h4)] : ({(8'hb3)} & wire2[(1'h0):(1'h0)])))};
  assign wire98 = ($unsigned((((wire3 ?
                              wire96 : wire91) > wire91[(1'h1):(1'h1)]) ?
                          (-wire93[(1'h0):(1'h0)]) : $signed(wire91))) ?
                      wire1[(1'h1):(1'h1)] : wire96[(3'h7):(2'h2)]);
  assign wire99 = {(~$unsigned(wire95[(3'h4):(1'h0)]))};
  assign wire100 = wire93;
  module101 #() modinst153 (wire152, clk, wire93, wire91, wire98, wire0);
  assign wire154 = {$unsigned(wire99[(2'h2):(2'h2)])};
  assign wire155 = $signed((~&$signed($unsigned((~^wire94)))));
  assign wire156 = (wire152[(1'h0):(1'h0)] >> ($unsigned($signed((wire97 ?
                       wire96 : wire95))) >> $unsigned((~^((8'hbc) ?
                       (8'h9d) : wire1)))));
endmodule

module module101
#(parameter param151 = (({((^(8'hb2)) ? ((8'h9d) << (7'h44)) : {(8'ha3)}), (((8'hb4) ? (8'h9c) : (8'ha1)) ? ((8'ha4) && (8'h9d)) : ((7'h41) ? (8'hb9) : (8'hab)))} ~^ ({((8'ha0) ? (8'ha8) : (8'hac)), {(8'ha7), (8'hb2)}} ? (((8'hb4) ? (8'ha2) : (8'hbc)) ^~ ((8'h9f) > (7'h41))) : (|((8'hbf) >= (8'hb5))))) < (^~(|({(8'hb9)} & {(8'hbe), (8'hae)})))))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire105;
  input wire signed [(4'h9):(1'h0)] wire104;
  input wire [(4'h8):(1'h0)] wire103;
  input wire [(4'h8):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire150;
  wire signed [(3'h5):(1'h0)] wire148;
  wire signed [(4'hf):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(2'h3):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  assign y = {wire150,
                 wire148,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire107,
                 wire106,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 (1'h0)};
  assign wire106 = {((~^$signed(((7'h44) ?
                           wire105 : wire105))) >= (wire102 <= (-(wire103 & wire105)))),
                       ($unsigned((~$unsigned(wire103))) ?
                           ((~|$signed(wire103)) ?
                               wire104[(3'h7):(1'h0)] : wire102) : $unsigned(((wire104 << wire103) >> $signed(wire102))))};
  assign wire107 = wire105[(4'hc):(3'h7)];
  always
    @(posedge clk) begin
      reg108 <= $signed(wire107[(1'h0):(1'h0)]);
      reg109 <= (~^($unsigned({$unsigned(wire105), (~&(8'ha4))}) ?
          $unsigned({wire105}) : ($signed((|(8'hba))) && $unsigned((wire104 != wire105)))));
      if ($signed(reg108[(2'h2):(1'h1)]))
        begin
          if (((wire106 ? wire106 : (^(wire106 ^~ $unsigned(reg108)))) ?
              $unsigned((~$unsigned($unsigned(wire103)))) : $unsigned($unsigned(reg109))))
            begin
              reg110 <= $signed($signed(wire105));
              reg111 <= (~&$unsigned((((wire106 ? wire102 : wire102) ?
                      reg108 : $signed(wire102)) ?
                  {((8'h9c) < (8'h9d))} : ({wire107} ?
                      (!wire106) : $unsigned(wire102)))));
              reg112 <= ({(~reg110), {((|wire103) > $unsigned(wire105))}} ?
                  reg111[(4'hd):(3'h4)] : reg108[(2'h3):(1'h1)]);
              reg113 <= (($unsigned(wire107[(2'h3):(1'h0)]) > ({(wire105 ?
                          reg109 : wire102),
                      wire103} ?
                  wire102[(3'h4):(3'h4)] : wire102)) == wire105[(1'h1):(1'h1)]);
              reg114 <= (wire103[(2'h2):(2'h2)] < (({$signed(reg110),
                  reg108} && ($unsigned((8'h9e)) && $signed(wire104))) + $signed($unsigned(reg109[(5'h11):(5'h10)]))));
            end
          else
            begin
              reg110 <= $unsigned(($unsigned(reg110) ?
                  (reg109 ?
                      {reg114[(2'h3):(1'h1)]} : $signed($signed(wire102))) : wire104));
              reg111 <= wire105[(3'h7):(3'h7)];
            end
          reg115 <= $unsigned((((8'ha4) + (+(+(7'h40)))) ?
              $signed(((wire107 ? reg112 : reg110) ?
                  wire105 : {reg111, wire106})) : reg111[(3'h6):(3'h5)]));
        end
      else
        begin
          reg110 <= ((8'ha4) << wire106[(4'ha):(1'h1)]);
        end
      reg116 <= wire102;
    end
  assign wire117 = $signed(wire105[(3'h5):(2'h2)]);
  assign wire118 = $signed($unsigned(($unsigned((~&wire106)) ?
                       (wire107[(2'h2):(1'h1)] <<< {wire107,
                           reg113}) : (+$signed((8'hbe))))));
  assign wire119 = ($unsigned($unsigned(wire117)) ?
                       (~^$signed($unsigned({wire106}))) : ({((&wire103) ?
                               (wire104 <= reg113) : (wire103 ?
                                   (8'h9c) : reg115)),
                           $signed((reg108 >= reg115))} >> (wire107 ?
                           (wire106 ?
                               (~reg109) : (reg112 == wire107)) : (&$unsigned((8'ha5))))));
  assign wire120 = ($unsigned($signed((((7'h44) ? wire119 : reg110) ?
                           $signed(reg108) : (wire106 >>> wire104)))) ?
                       $unsigned(wire117[(4'h8):(1'h0)]) : (reg116[(2'h3):(1'h1)] >= (^~(-$signed((8'ha4))))));
  assign wire121 = (($signed(($signed(wire103) ? reg109 : wire119)) ?
                           (((^reg109) ?
                               reg114[(3'h4):(2'h3)] : ((8'haf) ~^ wire107)) <<< (wire105 ?
                               $unsigned(reg111) : (^~reg115))) : $signed(wire102)) ?
                       $signed($unsigned($unsigned($unsigned(reg109)))) : reg111);
  module122 #() modinst149 (wire148, clk, wire120, reg116, wire117, reg111, reg114);
  assign wire150 = $unsigned(((~^((reg108 ? wire107 : wire121) ?
                       reg108 : $signed(wire117))) | ($unsigned($signed(reg113)) <= reg111[(3'h7):(3'h4)])));
endmodule

module module4
#(parameter param90 = (^~(-(~|{((7'h42) <<< (8'hb5))}))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire5;
  input wire [(3'h4):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire88;
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  assign y = {wire10,
                 wire11,
                 wire12,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire88,
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
                 (1'h0)};
  assign wire10 = $signed({$signed((8'had)),
                      (wire7 ? wire7 : ((wire8 > (8'hb3)) ~^ (^(8'hae))))});
  assign wire11 = $signed(wire9);
  assign wire12 = (($unsigned(($signed(wire5) >>> (wire9 > wire8))) ?
                      $signed((wire9 <= wire6[(3'h4):(2'h3)])) : $signed((-(-(8'hb9))))) ^~ wire10[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      if ({$signed((7'h42)), wire9})
        begin
          reg13 <= ((wire11[(3'h4):(3'h4)] * $unsigned($signed(wire9[(4'hd):(3'h7)]))) >= (wire10[(1'h1):(1'h0)] ?
              {$unsigned((^wire11))} : $signed((~|(wire6 >>> (8'haa))))));
          reg14 <= ($signed($signed($signed(wire5))) && wire10);
          reg15 <= $unsigned(wire5[(4'hd):(3'h4)]);
          reg16 <= wire6[(3'h4):(3'h4)];
        end
      else
        begin
          if ($signed(wire9[(5'h12):(4'hd)]))
            begin
              reg13 <= $signed((~|($unsigned(wire5) ?
                  ($signed(wire5) || (wire9 ?
                      wire7 : wire6)) : wire10[(1'h0):(1'h0)])));
              reg14 <= ($unsigned((wire8 ?
                  (wire7[(1'h1):(1'h1)] & wire7[(1'h1):(1'h1)]) : (wire11 ?
                      wire7 : (-reg15)))) != ({((reg14 ? wire10 : (8'hb0)) ?
                      (8'ha1) : (&reg14))} << (~|wire7[(2'h2):(1'h0)])));
            end
          else
            begin
              reg13 <= wire5[(4'hf):(1'h1)];
              reg14 <= $unsigned($unsigned((reg14[(3'h4):(3'h4)] ?
                  (^~reg15[(4'he):(3'h7)]) : ($unsigned(reg13) ?
                      wire11[(2'h2):(2'h2)] : (wire7 <<< wire12)))));
              reg15 <= (reg13 && (~^wire9));
              reg16 <= $signed((~&(~^(&$signed(wire5)))));
            end
          reg17 <= $signed(($signed(wire7[(4'h9):(4'h8)]) ?
              wire5[(5'h11):(2'h3)] : wire10));
          reg18 <= wire8[(3'h6):(3'h5)];
          if ((($signed((^{reg15})) ?
              $signed($signed((&wire9))) : (reg16[(2'h2):(1'h1)] <<< (^~(8'hb0)))) ^~ $signed((wire5[(5'h15):(3'h4)] ?
              $signed($unsigned(wire5)) : (reg17[(4'ha):(4'h8)] ?
                  (!(8'hba)) : wire6)))))
            begin
              reg19 <= $unsigned($signed($unsigned(wire7[(4'h8):(3'h5)])));
              reg20 <= $signed(((reg14[(3'h4):(2'h2)] ?
                      reg17[(3'h6):(2'h2)] : (~^reg14)) ?
                  $unsigned($signed((reg17 >>> wire10))) : (~&wire7[(3'h5):(1'h1)])));
            end
          else
            begin
              reg19 <= ($unsigned({$signed((~^(8'haf))),
                      (wire8 < $signed(wire11))}) ?
                  wire8 : ($unsigned((8'ha0)) ?
                      (wire12 ^~ wire7[(4'h8):(3'h6)]) : ((-reg16[(1'h0):(1'h0)]) - (reg19 ?
                          (reg14 ? (8'hac) : reg17) : (wire6 & reg14)))));
              reg20 <= ((-$unsigned((wire11 ~^ {reg19,
                  (8'hb5)}))) != $unsigned({{(wire10 ? wire7 : wire7),
                      (wire5 >> reg14)}}));
              reg21 <= ($signed(reg15) ?
                  ((!reg19) * (~({reg17} * (8'hb3)))) : $unsigned((~^reg18[(1'h0):(1'h0)])));
              reg22 <= wire6[(1'h0):(1'h0)];
            end
          if ($unsigned((reg19[(1'h0):(1'h0)] >>> wire8)))
            begin
              reg23 <= (reg13[(3'h6):(1'h1)] ~^ wire10);
              reg24 <= reg17[(4'he):(4'hc)];
              reg25 <= (^reg15[(4'ha):(1'h0)]);
            end
          else
            begin
              reg23 <= $signed(wire7[(4'h8):(3'h5)]);
              reg24 <= reg15;
              reg25 <= {((!reg19[(2'h2):(1'h0)]) ?
                      (~(reg20 == $signed(reg25))) : {$signed(reg23)}),
                  wire5[(3'h5):(2'h2)]};
              reg26 <= reg16[(1'h1):(1'h1)];
            end
        end
      reg27 <= ($signed(reg20[(4'hd):(4'h9)]) < ((reg26[(1'h1):(1'h0)] ?
          (~(reg16 ?
              wire12 : wire11)) : reg20[(4'h8):(2'h3)]) >>> ((^wire5[(5'h14):(5'h14)]) ?
          wire11[(2'h3):(1'h0)] : ($unsigned(wire9) - (reg19 ?
              (8'ha2) : reg18)))));
      reg28 <= ({(($unsigned(wire11) ~^ (!reg18)) ?
                  (reg27[(4'ha):(2'h3)] ?
                      ((8'hb2) << reg18) : $signed(reg21)) : reg19[(1'h0):(1'h0)])} ?
          reg18 : {(|{wire8, (&wire10)})});
      reg29 <= (reg26[(4'h9):(4'h8)] ^~ {wire6[(2'h3):(2'h2)]});
    end
  assign wire30 = {((reg27 ?
                          wire6[(3'h4):(3'h4)] : (wire6 ?
                              $signed((8'hb6)) : $unsigned(wire10))) ~^ $unsigned($unsigned({wire12})))};
  assign wire31 = (((~^$signed({reg16, (8'hb0)})) ?
                          {((wire11 ? reg29 : reg26) << reg29),
                              $signed(wire5)} : $unsigned(($signed(wire6) <= $unsigned((8'hb7))))) ?
                      {{reg13[(4'hd):(4'h8)]}, wire12} : (reg21[(4'ha):(3'h7)] ?
                          $unsigned(reg25) : ((8'ha9) | ((^wire11) >= (+reg28)))));
  assign wire32 = {($signed({wire30[(1'h0):(1'h0)], wire7[(2'h3):(1'h1)]}) ?
                          $unsigned($signed($unsigned(reg13))) : ({$signed(reg17)} + $unsigned((+wire10))))};
  assign wire33 = (($signed($unsigned(reg22)) < (wire31 < $signed((wire10 > reg27)))) ?
                      $unsigned($signed(((reg27 || wire32) ?
                          (reg25 ?
                              reg16 : reg28) : (^~wire30)))) : $signed($signed($unsigned(((8'hb0) - reg15)))));
  assign wire34 = ((^{(8'hba)}) - reg20);
  assign wire35 = reg25[(1'h1):(1'h0)];
  assign wire36 = (($signed(wire35) && (((^wire7) != (~^wire9)) ?
                          $unsigned((8'hab)) : {((8'hb4) ? wire5 : reg14),
                              reg23})) ?
                      $unsigned(($unsigned((wire9 ? (8'hbc) : wire11)) ?
                          (+(reg20 + (8'h9d))) : (~^(8'hba)))) : (|$unsigned(((reg16 ?
                              wire6 : wire10) ?
                          reg29 : $unsigned(wire10)))));
  assign wire37 = ((wire33[(4'he):(4'he)] ?
                          ({(wire30 ? reg21 : wire10),
                              (reg18 ?
                                  reg13 : wire35)} || (wire30[(4'hd):(4'hb)] * $unsigned((7'h43)))) : reg25[(2'h3):(1'h0)]) ?
                      reg29 : {(~|((wire34 ? reg21 : reg16) ?
                              (reg19 ? reg13 : wire6) : $unsigned(reg25)))});
  module38 #() modinst89 (.wire40(wire8), .clk(clk), .wire41(reg15), .wire39(wire9), .y(wire88), .wire42(wire30));
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h242):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire42;
  input wire signed [(4'hc):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire40;
  input wire [(4'hc):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire43;
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire63,
                 wire56,
                 wire55,
                 wire50,
                 wire49,
                 wire43,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 reg65,
                 reg64,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire43 = $signed($signed($signed(({wire39,
                      wire41} * $unsigned(wire40)))));
  always
    @(posedge clk) begin
      reg44 <= wire43;
      reg45 <= wire43[(5'h11):(4'hc)];
      reg46 <= {reg45};
      reg47 <= {$signed((~|$unsigned(((8'hb1) ? wire43 : wire42)))),
          reg45[(3'h4):(3'h4)]};
      reg48 <= (-(!(wire40 - $signed((^~reg45)))));
    end
  assign wire49 = (((^$signed(wire43[(1'h1):(1'h0)])) & $signed((reg45 != (~^reg48)))) + {reg44,
                      $unsigned(((wire40 ? reg46 : wire39) ?
                          $signed(wire41) : (+wire40)))});
  assign wire50 = $signed($unsigned((~&$signed($unsigned(wire40)))));
  always
    @(posedge clk) begin
      reg51 <= ((-(~|((wire40 ? reg47 : wire42) ?
              (~^reg46) : {wire50, reg44}))) ?
          wire43[(4'hc):(4'h8)] : $unsigned(reg48[(3'h5):(2'h3)]));
      reg52 <= (((-reg47[(3'h5):(3'h4)]) >>> (((wire40 & wire42) ?
                  $signed(wire39) : wire50[(4'ha):(2'h3)]) ?
              wire39[(4'hc):(2'h2)] : $unsigned((reg45 ? reg48 : wire40)))) ?
          (|(((-wire50) ?
              (reg45 == reg45) : wire42) - wire39)) : (&reg47[(4'hd):(2'h2)]));
      reg53 <= reg45[(2'h3):(1'h0)];
      reg54 <= $unsigned((8'ha1));
    end
  assign wire55 = ((-({wire39[(2'h2):(1'h0)], (8'hb9)} ^~ (~|{wire50,
                          reg47}))) ?
                      $signed($unsigned((reg46 > (wire41 ?
                          reg51 : wire42)))) : (|{wire42}));
  assign wire56 = wire39[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg57 <= $signed(reg51[(1'h0):(1'h0)]);
      reg58 <= $unsigned((~&$unsigned((-(reg46 == reg47)))));
    end
  always
    @(posedge clk) begin
      reg59 <= $unsigned($signed($signed(wire55)));
      reg60 <= ((^~$unsigned(({reg44, (8'hbf)} > (8'hb2)))) ?
          {wire50[(4'hd):(3'h6)]} : ($signed(reg58[(3'h4):(2'h2)]) ?
              (8'hae) : wire41));
      if (reg60[(2'h2):(1'h1)])
        begin
          reg61 <= $unsigned(wire55);
          reg62 <= $unsigned((^(~($signed(reg46) ^~ $signed(reg54)))));
        end
      else
        begin
          reg61 <= wire43[(4'he):(3'h4)];
          reg62 <= {(~|{{(8'ha6), $unsigned(wire50)},
                  (wire41[(1'h1):(1'h1)] ? (^~wire56) : $unsigned(reg47))})};
        end
    end
  assign wire63 = $signed(reg57);
  always
    @(posedge clk) begin
      reg64 <= (8'ha1);
      reg65 <= $signed(reg53[(2'h3):(2'h3)]);
      reg66 <= ((reg46 ?
              $unsigned((|(reg61 < wire63))) : reg46[(2'h2):(1'h0)]) ?
          $unsigned((reg57[(4'h8):(2'h3)] ?
              reg65[(4'hf):(4'hd)] : (((8'hac) ? reg44 : reg54) && (wire43 ?
                  reg64 : (8'hae))))) : (reg54 ?
              $signed(($signed(reg51) == (reg60 ?
                  wire41 : reg57))) : (((^reg57) & $unsigned(reg45)) >> $unsigned((~^reg53)))));
      if ($unsigned((+reg46)))
        begin
          if ((wire55[(3'h5):(1'h1)] ?
              reg53 : (!(^~((!wire50) >> $unsigned(reg66))))))
            begin
              reg67 <= reg66[(2'h2):(1'h0)];
              reg68 <= reg62;
              reg69 <= $unsigned((~&{(8'hb3), $signed((|reg46))}));
            end
          else
            begin
              reg67 <= reg48[(4'he):(4'he)];
              reg68 <= (~&(-$unsigned($unsigned((7'h44)))));
            end
          if ((+($signed(({reg52, reg66} >> ((8'ha9) ? wire55 : reg47))) ?
              ($signed((&(8'ha9))) ?
                  (8'h9f) : (~|(reg44 ?
                      reg68 : wire56))) : ($unsigned($unsigned(wire50)) + reg57))))
            begin
              reg70 <= (^(reg62[(1'h0):(1'h0)] ?
                  wire63 : (((wire55 ? reg62 : (8'ha8)) == (8'hb8)) ?
                      (reg52 + reg64[(4'hb):(3'h7)]) : reg53[(2'h3):(2'h2)])));
              reg71 <= {((reg70[(2'h3):(1'h1)] <<< reg57[(4'hc):(2'h3)]) && $signed($signed((^wire56))))};
              reg72 <= reg64;
              reg73 <= (^reg59[(3'h4):(1'h1)]);
              reg74 <= (-reg66[(3'h7):(1'h1)]);
            end
          else
            begin
              reg70 <= ((8'h9c) ? wire50 : reg53);
              reg71 <= wire56[(3'h5):(1'h1)];
            end
          reg75 <= (reg67 ^ reg72[(4'h8):(2'h2)]);
          if ($unsigned($signed(reg74)))
            begin
              reg76 <= {$unsigned($signed($unsigned($signed(reg59))))};
              reg77 <= reg54;
              reg78 <= ((~|$unsigned((((8'h9e) ? reg58 : reg64) | ((8'hb1) ?
                  reg44 : reg46)))) >> (~wire41[(1'h1):(1'h1)]));
              reg79 <= $unsigned(((+reg77[(3'h4):(2'h2)]) ?
                  {$signed($unsigned((8'hb5)))} : reg74[(3'h6):(3'h5)]));
              reg80 <= ({((-{wire40, reg51}) ?
                          {wire56, $unsigned(reg70)} : $unsigned((&reg58)))} ?
                  (!(reg47 ?
                      wire41 : $unsigned((reg44 ?
                          reg66 : wire43)))) : {$signed(((-reg72) ?
                          $unsigned((8'hb6)) : (-reg69))),
                      $signed(reg76)});
            end
          else
            begin
              reg76 <= (8'ha0);
              reg77 <= {(8'hb3),
                  (((reg74 >> (~wire42)) ?
                      (reg66[(3'h4):(1'h1)] ?
                          $signed(reg77) : $unsigned(reg77)) : $unsigned(reg71[(4'ha):(4'ha)])) & reg79)};
              reg78 <= {{(reg62 | reg52),
                      {reg77[(4'hf):(3'h7)], $unsigned(reg70)}}};
              reg79 <= {$unsigned(($unsigned(reg58[(3'h5):(1'h0)]) ?
                      $unsigned($signed(reg54)) : ((reg61 ?
                          reg47 : reg59) >= $signed(wire43))))};
            end
          if (wire43[(1'h0):(1'h0)])
            begin
              reg81 <= (|reg54[(3'h6):(2'h3)]);
              reg82 <= reg76;
              reg83 <= reg57;
              reg84 <= (reg76[(1'h0):(1'h0)] >= $signed({{$unsigned(reg68)}}));
              reg85 <= $signed(($unsigned({reg67[(3'h7):(2'h2)],
                      $unsigned(reg67)}) ?
                  $unsigned({(reg84 ? reg71 : wire63)}) : $signed((8'ha3))));
            end
          else
            begin
              reg81 <= ($unsigned(reg51[(4'ha):(3'h6)]) == (^(((~^(8'hb7)) ?
                      (wire63 | reg62) : $unsigned(reg61)) ?
                  $signed($unsigned(reg79)) : $unsigned((reg66 ?
                      wire56 : reg62)))));
              reg82 <= $signed($unsigned($unsigned(({(8'ha6)} ?
                  reg57 : (wire55 * (8'hbd))))));
            end
        end
      else
        begin
          reg67 <= {((^~{reg79}) == reg53)};
          if (wire43[(5'h13):(4'h9)])
            begin
              reg68 <= (~&reg83[(4'h8):(3'h5)]);
              reg69 <= reg74;
            end
          else
            begin
              reg68 <= ((|(~^reg65)) >= reg60[(4'h8):(1'h1)]);
            end
          if ((^~reg70[(4'ha):(2'h2)]))
            begin
              reg70 <= {reg53[(1'h1):(1'h1)], $signed(reg51)};
              reg71 <= (~^((reg62[(2'h2):(1'h0)] < $signed($unsigned(reg78))) ?
                  ({reg79, $signed(reg82)} ?
                      ((!reg70) & reg78[(1'h0):(1'h0)]) : reg83[(5'h12):(5'h11)]) : $unsigned($signed((reg52 ~^ reg68)))));
              reg72 <= reg60;
              reg73 <= $signed($unsigned({reg53, (~^reg77[(4'hb):(1'h1)])}));
            end
          else
            begin
              reg70 <= reg69[(4'hb):(4'hb)];
              reg71 <= $signed((~$signed($unsigned((reg48 > reg68)))));
              reg72 <= $unsigned((reg53[(1'h0):(1'h0)] ?
                  reg77 : (reg66[(4'h9):(2'h2)] ?
                      reg58 : reg75[(3'h6):(2'h2)])));
            end
          reg74 <= $unsigned(($unsigned((~(reg58 ?
              reg80 : reg79))) | ($signed($signed(reg79)) ?
              ((reg61 ? reg52 : reg77) & reg67) : reg60)));
          reg75 <= $unsigned($signed($unsigned($signed({(8'h9f)}))));
        end
    end
  assign wire86 = (~^$signed($signed(((wire55 ?
                      (8'hb8) : reg62) << (reg44 > reg48)))));
  assign wire87 = {$signed(($unsigned({(8'ha5)}) >> $signed(((8'ha5) ?
                          reg53 : (8'hb9))))),
                      (reg79[(1'h0):(1'h0)] > ($signed($unsigned((8'hba))) ?
                          (reg76[(1'h0):(1'h0)] & reg70) : (!((8'hbe) ?
                              reg75 : reg48))))};
endmodule

module module122
#(parameter param147 = (-({(~|((8'hb4) ? (8'ha6) : (8'ha0)))} ? (((^(8'hbf)) ? ((8'hba) ^~ (8'ha9)) : (~&(8'hbe))) ? {((8'h9e) ? (8'h9d) : (8'ha0)), (&(8'ha2))} : (+((8'ha2) ? (8'ha3) : (8'h9e)))) : ((8'hba) || {((7'h42) ? (8'hb6) : (8'hb1))}))))
(y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire127;
  input wire signed [(5'h10):(1'h0)] wire126;
  input wire signed [(5'h12):(1'h0)] wire125;
  input wire signed [(5'h15):(1'h0)] wire124;
  input wire [(4'he):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire137;
  wire [(4'hd):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire134,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg136,
                 reg135,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire128 = $signed(wire127[(1'h1):(1'h1)]);
  assign wire129 = ($unsigned(((&{wire125, wire125}) ?
                       ($signed(wire127) ?
                           $signed(wire123) : (wire124 >>> wire126)) : (+(wire123 ^~ wire125)))) ^~ {$unsigned($unsigned((+wire123))),
                       $signed((8'hb6))});
  assign wire130 = {wire128[(1'h0):(1'h0)]};
  assign wire131 = $signed(wire128[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg132 <= ($unsigned(({(-(8'hac))} <<< $signed((wire131 <<< wire128)))) ?
          ((8'hae) ?
              wire125 : wire127[(4'h9):(4'h8)]) : (~&$unsigned($unsigned($unsigned(wire130)))));
      reg133 <= wire125;
    end
  assign wire134 = $signed(($signed(wire126) ?
                       ({(7'h40)} ?
                           wire123 : $unsigned((~^wire130))) : (($unsigned((8'ha1)) ~^ reg133) < wire124)));
  always
    @(posedge clk) begin
      reg135 <= ($signed((!reg133)) ?
          $unsigned((((-wire131) ^~ $signed(wire126)) ?
              wire124 : $unsigned($unsigned((8'ha9))))) : ((((wire124 << (8'hb8)) != (~&(8'hb8))) << (^~(reg132 <= wire124))) - wire129));
      reg136 <= (-{($signed(reg133[(4'ha):(3'h6)]) ?
              $unsigned((8'ha3)) : (reg133[(2'h3):(2'h2)] || ((8'hb2) ?
                  reg132 : wire129))),
          (~|$unsigned({wire126, wire130}))});
    end
  assign wire137 = reg135[(2'h3):(1'h1)];
  assign wire138 = ((8'h9e) ?
                       (wire129[(1'h0):(1'h0)] || ((7'h41) ?
                           ((~^wire123) ~^ (^wire127)) : {$signed(wire127)})) : $unsigned(wire128));
  assign wire139 = (-$unsigned($unsigned(((|wire134) ?
                       $unsigned((8'haf)) : reg135))));
  always
    @(posedge clk) begin
      reg140 <= $unsigned((-wire125[(5'h12):(2'h2)]));
      if (reg140)
        begin
          reg141 <= $signed((|(((wire137 || wire139) ?
              $signed(wire139) : reg132) | (wire137[(1'h0):(1'h0)] ?
              ((8'ha5) ? wire139 : wire130) : (~|wire130)))));
          reg142 <= wire125;
        end
      else
        begin
          reg141 <= wire127;
          reg142 <= $unsigned(wire138[(3'h5):(2'h3)]);
          reg143 <= reg136[(1'h0):(1'h0)];
          reg144 <= (wire125 * ({$unsigned(reg142),
                  (reg135[(3'h7):(3'h6)] < wire123)} ?
              ($unsigned($unsigned(reg135)) || $signed({wire126,
                  wire137})) : {{$unsigned(wire123),
                      ((8'hb7) ? (8'hb1) : wire124)},
                  wire125[(2'h3):(2'h3)]}));
          reg145 <= ((reg142[(2'h2):(1'h1)] ?
              ($signed((&wire127)) ?
                  wire126[(3'h4):(1'h1)] : ((8'h9e) ?
                      (reg132 > reg140) : $unsigned((8'hb9)))) : $unsigned((~(reg143 > reg133)))) ^ $unsigned($signed(wire131[(1'h1):(1'h0)])));
        end
      reg146 <= wire139[(3'h7):(1'h1)];
    end
endmodule
