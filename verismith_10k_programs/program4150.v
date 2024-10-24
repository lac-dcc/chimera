module top
#(parameter param184 = ((((~&((7'h42) || (8'h9f))) | (!((7'h43) | (8'hbf)))) >>> (^(((8'hb8) ? (8'h9d) : (8'hbe)) ? ((8'hb5) ? (8'ha9) : (8'hb5)) : ((8'haa) ? (8'hb6) : (8'hba))))) + {(^(~(&(8'h9e))))}), 
parameter param185 = {param184, ((!param184) >>> (param184 ? {(~param184)} : ((&param184) ? (param184 * param184) : (param184 ? param184 : (8'hbc)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire182;
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  assign y = {wire116,
                 wire118,
                 wire119,
                 wire120,
                 wire182,
                 reg121,
                 reg122,
                 reg123,
                 (1'h0)};
  module5 #() modinst117 (wire116, clk, wire4, wire3, wire0, wire1);
  assign wire118 = wire3[(4'h9):(3'h7)];
  assign wire119 = (wire0[(4'h8):(3'h7)] ?
                       $signed(wire0[(4'h9):(2'h3)]) : $unsigned(($signed(wire2) ?
                           $unsigned($unsigned(wire1)) : {wire116,
                               wire116[(1'h0):(1'h0)]})));
  assign wire120 = wire3;
  always
    @(posedge clk) begin
      reg121 <= ((~wire4) | $signed($unsigned(wire3[(2'h3):(1'h1)])));
      reg122 <= (($signed(($signed((8'hbf)) || {reg121,
          wire116})) && wire3[(4'ha):(1'h1)]) ^ ($unsigned(((|wire120) > $unsigned(wire3))) ^~ (wire4 ?
          (wire4[(3'h4):(3'h4)] ?
              (wire120 ? wire118 : wire119) : $unsigned(wire118)) : (wire4 ?
              $signed(wire116) : (wire118 ? wire2 : wire0)))));
      reg123 <= ((|{{{wire119, wire118}, (|wire120)}}) ?
          (^~wire0) : $unsigned($signed($unsigned((wire3 >>> wire4)))));
    end
  module124 #() modinst183 (wire182, clk, reg123, wire120, wire118, wire0);
endmodule

module module124
#(parameter param181 = ({(^~(((8'ha9) * (8'hb3)) | (~&(8'hb5)))), ((((8'h9c) >>> (8'h9d)) ~^ ((8'hb8) ? (8'hbf) : (8'hb7))) ? ({(8'haf)} || ((8'haa) ? (8'hae) : (8'haa))) : (~^(^~(8'ha2))))} ? (({((8'ha7) ? (8'ha8) : (8'hba)), (~|(8'haf))} ? (((8'had) - (8'hbf)) & ((8'hac) ? (7'h42) : (8'ha1))) : ({(8'hb2), (8'ha7)} <<< (~^(8'hbe)))) ? ((((8'hba) & (8'ha9)) < {(8'hb7)}) < (((8'h9c) | (7'h40)) ? ((7'h44) == (8'hac)) : ((8'hbf) ? (7'h44) : (8'hb9)))) : ((+{(8'ha7), (8'ha8)}) ? (((7'h41) >> (8'h9c)) ? (8'h9e) : (^~(7'h43))) : ((8'hb1) ? (~&(8'hb3)) : {(8'ha0)}))) : {(~&(((7'h44) >> (8'hb4)) ? {(8'hb5)} : {(8'hab)})), (!(~^((8'hba) ? (7'h42) : (8'h9d))))}))
(y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire128;
  input wire signed [(2'h3):(1'h0)] wire127;
  input wire [(5'h13):(1'h0)] wire126;
  input wire [(4'h9):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire180;
  wire signed [(4'h8):(1'h0)] wire179;
  wire signed [(4'he):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire176;
  wire [(5'h11):(1'h0)] wire131;
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire176,
                 wire131,
                 reg130,
                 reg129,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg129 <= (~^$signed((8'hbe)));
      reg130 <= (reg129[(2'h2):(2'h2)] ?
          $signed((!$unsigned((|wire126)))) : $signed(reg129));
    end
  assign wire131 = wire128[(2'h2):(1'h0)];
  module132 #() modinst177 (.wire134(reg129), .wire136(wire131), .wire135(wire126), .wire133(reg130), .clk(clk), .y(wire176));
  assign wire178 = (wire125[(3'h4):(2'h2)] ?
                       {(~|((wire176 ? wire126 : (8'hb8)) ?
                               ((8'ha5) * reg130) : $unsigned(wire127))),
                           $signed(($unsigned(reg129) ^ $signed(wire128)))} : $unsigned({wire126[(5'h13):(2'h3)]}));
  assign wire179 = ({(($unsigned(reg130) ?
                                   $unsigned(wire178) : $unsigned(wire126)) ?
                               $signed({wire176, wire126}) : {$unsigned(reg129),
                                   {wire178}}),
                           ((~^{wire176, reg130}) ?
                               (reg129 ?
                                   (reg130 ?
                                       wire178 : wire178) : $signed(wire128)) : $signed((~&wire176)))} ?
                       $unsigned(wire125) : $signed(($unsigned((8'hbf)) ?
                           $unsigned((wire178 ?
                               wire176 : wire176)) : reg130[(3'h5):(3'h5)])));
  assign wire180 = {($unsigned(((|wire126) ? wire179 : $unsigned(reg129))) ?
                           ($signed((wire179 ? wire178 : wire179)) ?
                               $signed({wire176}) : $unsigned((&reg130))) : (^~($signed(reg129) ^~ (~(8'hb8))))),
                       (wire128 ?
                           ($unsigned((wire179 || (8'hba))) - $unsigned({(8'ha2)})) : $signed($signed(wire176[(1'h1):(1'h1)])))};
endmodule

module module5
#(parameter param114 = {(((+(~&(8'hab))) ? ((!(8'hba)) ? (!(8'h9f)) : (~|(8'ha1))) : (((8'ha9) ? (8'h9e) : (8'hb0)) ^ ((7'h42) ? (8'haa) : (8'hb8)))) ? ({(8'hb7)} & (~&(~(8'hbd)))) : (({(8'hb6)} || ((8'hb2) ~^ (8'hac))) ? ((^~(8'hb6)) ? ((8'ha2) ? (8'ha1) : (8'hac)) : ((8'h9c) ~^ (8'ha6))) : (|(~(8'hb2))))), (8'hb4)}, 
parameter param115 = param114)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire107;
  wire [(3'h7):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire86;
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire89,
                 wire88,
                 wire86,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({wire7, $unsigned(wire8)} >>> wire8))
        begin
          if ((|wire9[(3'h5):(2'h2)]))
            begin
              reg10 <= wire6[(3'h6):(2'h3)];
            end
          else
            begin
              reg10 <= (wire9[(3'h4):(3'h4)] >>> ((reg10 ?
                      {$signed(wire9)} : $unsigned($signed((7'h43)))) ?
                  (+(^$unsigned(wire6))) : (&((~wire9) ?
                      $unsigned(reg10) : wire7))));
            end
          if ({(reg10[(5'h14):(2'h2)] ?
                  (wire9 <<< wire6) : wire8[(4'h8):(3'h6)]),
              ((~$signed($unsigned((8'hba)))) ?
                  (|(~^(&reg10))) : ($signed(((8'hb5) ?
                      wire6 : reg10)) >= ((reg10 ^ wire7) <<< (wire7 << wire7))))})
            begin
              reg11 <= (wire8 ?
                  $unsigned((wire6[(4'hd):(1'h1)] ?
                      (wire6[(1'h1):(1'h0)] ?
                          (wire6 ?
                              wire7 : wire9) : $unsigned(wire9)) : $signed((wire8 ?
                          wire6 : wire7)))) : (~&(|(^~(wire9 <<< (8'hb5))))));
              reg12 <= $signed({(!(~$unsigned(wire7)))});
              reg13 <= {$unsigned((^~($signed(wire6) + $unsigned((8'hbf))))),
                  (wire8[(4'ha):(3'h5)] ?
                      $signed($unsigned((wire8 ?
                          wire8 : wire9))) : $unsigned($unsigned($unsigned(reg12))))};
            end
          else
            begin
              reg11 <= wire8[(1'h0):(1'h0)];
              reg12 <= (((wire7 ?
                      {$unsigned((8'hb3))} : $signed(reg11[(1'h1):(1'h1)])) >= (({wire9} | (reg12 << wire7)) ?
                      ((reg11 == wire9) ?
                          $signed(reg13) : reg11[(2'h2):(2'h2)]) : $unsigned((wire9 ?
                          reg13 : reg13)))) ?
                  $signed(reg12) : wire6);
              reg13 <= $unsigned($unsigned((~reg10[(4'h8):(3'h5)])));
              reg14 <= reg13[(4'h9):(4'h8)];
              reg15 <= ((&(reg14 <= reg13[(3'h5):(3'h5)])) ?
                  ({(8'hb5)} ?
                      $signed(wire9[(1'h1):(1'h0)]) : (($signed(reg11) ?
                              wire9[(4'hd):(3'h5)] : reg12[(4'h8):(3'h4)]) ?
                          $unsigned((wire7 ~^ wire8)) : $signed(wire9))) : wire6);
            end
          reg16 <= (|$signed($signed(wire6[(1'h1):(1'h1)])));
          reg17 <= $unsigned(($signed(wire9) ~^ wire7[(3'h6):(3'h4)]));
          if ((-(reg13 + $signed(reg14[(3'h6):(1'h0)]))))
            begin
              reg18 <= $unsigned((8'hb2));
              reg19 <= {reg15};
              reg20 <= $signed(($signed(reg11[(4'he):(4'hb)]) ?
                  (~&reg11) : (((!reg11) ^~ reg11) ?
                      (^reg17[(1'h1):(1'h0)]) : $signed({reg18, (8'ha7)}))));
            end
          else
            begin
              reg18 <= reg18;
            end
        end
      else
        begin
          reg10 <= reg17;
          reg11 <= reg18;
          reg12 <= $unsigned($signed($signed((7'h44))));
          reg13 <= $signed({($signed($signed(reg12)) ?
                  reg20[(4'hf):(3'h4)] : (reg10[(3'h4):(2'h3)] > (reg18 ?
                      reg13 : (8'hb5)))),
              {(reg20[(4'hf):(4'h8)] >> (7'h41)), wire8[(4'ha):(2'h3)]}});
        end
      if ($signed((^$unsigned((!(wire9 ? wire7 : (8'hbd)))))))
        begin
          reg21 <= ($unsigned((~&$unsigned((8'hbb)))) ?
              (($signed((8'hb6)) ? reg14 : (!$unsigned(reg20))) ?
                  {{$signed(reg11), (&reg11)},
                      $signed($signed(wire9))} : (((8'hbe) ?
                      $unsigned(wire8) : wire9[(3'h6):(2'h3)]) <= ($unsigned((8'ha3)) | (reg18 | reg19)))) : ((^$unsigned(wire7[(4'hd):(2'h2)])) ?
                  ({$unsigned(wire9),
                      (reg14 ?
                          (8'hb0) : reg19)} && ($signed(reg20) ~^ $unsigned((8'hba)))) : (((reg12 ?
                          reg12 : (8'hb7)) ?
                      (8'hbc) : $unsigned(wire8)) * $unsigned($unsigned(wire9)))));
        end
      else
        begin
          reg21 <= {$unsigned(((reg18[(1'h1):(1'h0)] < (reg10 ?
                  wire6 : reg14)) | $signed(reg17)))};
          reg22 <= reg14;
          reg23 <= ((reg10[(1'h1):(1'h1)] ?
              wire7[(3'h7):(1'h0)] : (~&(((8'hb7) ?
                  reg15 : reg15) != reg20[(4'h9):(3'h5)]))) | {(~|({reg12} ?
                  (~^reg17) : (wire9 ? reg16 : (8'ha8))))});
          reg24 <= (~&$signed(({{reg20}} | reg11)));
        end
      reg25 <= $unsigned(($signed(({wire8, wire9} <= (+reg13))) ?
          wire9[(4'h9):(2'h2)] : (&$signed(reg17[(1'h1):(1'h1)]))));
      reg26 <= ($unsigned($unsigned(reg13)) ^ reg14);
      reg27 <= $unsigned(reg14[(1'h1):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ((~^(($unsigned((&wire8)) ?
          {reg20,
              $unsigned(reg14)} : $unsigned((reg21 == reg17))) < $unsigned(wire6))))
        begin
          reg28 <= (reg18[(3'h4):(1'h0)] && $signed((8'hb9)));
          reg29 <= reg11;
        end
      else
        begin
          reg28 <= reg23[(3'h7):(2'h2)];
        end
      reg30 <= reg15[(3'h7):(3'h7)];
      reg31 <= reg18;
      reg32 <= ((~&$signed(reg16)) | (((reg29 << (reg16 ?
              reg24 : reg29)) * {(reg12 ? reg31 : reg15)}) ?
          $signed(wire8[(3'h6):(1'h0)]) : wire8));
    end
  module33 #() modinst87 (.wire38(reg11), .wire35(wire8), .wire36(reg22), .clk(clk), .wire34(reg21), .y(wire86), .wire37(wire9));
  assign wire88 = (($unsigned({reg24[(4'hd):(2'h3)]}) == $signed({$signed((8'hb5)),
                          (~reg11)})) ?
                      $unsigned($unsigned($signed((+(8'had))))) : (($signed((reg20 < reg26)) ?
                              (reg21 >> reg19[(2'h2):(1'h0)]) : $signed(reg10[(3'h5):(1'h1)])) ?
                          ((8'h9c) ?
                              (7'h43) : ($unsigned(reg27) <<< {reg20})) : (((reg10 - reg14) ?
                                  $signed(wire9) : (&reg17)) ?
                              reg19[(3'h7):(2'h3)] : ((reg14 ? reg16 : reg29) ?
                                  ((8'ha0) ?
                                      reg23 : reg25) : wire6[(3'h6):(1'h0)]))));
  assign wire89 = ((~^$signed(((reg26 >= reg23) ?
                          ((8'ha1) ? reg32 : (8'hbd)) : {reg13}))) ?
                      ((~|$unsigned($unsigned(wire6))) ?
                          {(&wire7)} : $unsigned((8'hb4))) : (~&(~^(wire7 ?
                          reg17[(3'h6):(2'h3)] : (8'hab)))));
  module90 #() modinst108 (.wire94(reg32), .clk(clk), .wire92(reg16), .wire91(reg27), .wire93(reg14), .wire95(reg24), .y(wire107));
  assign wire109 = ((wire88 == ((8'hbd) - reg16[(4'ha):(1'h1)])) ?
                       $unsigned(reg31[(3'h7):(3'h4)]) : (~reg23));
  assign wire110 = (((~^$unsigned((reg20 ?
                       (8'ha6) : reg30))) - $signed({(&wire9),
                       ((7'h44) ? wire109 : reg18)})) >>> ($signed({{wire88,
                               reg11},
                           (reg23 ? reg12 : reg19)}) ?
                       $signed((-(reg17 ?
                           (8'hb2) : (8'hb5)))) : $signed(reg31[(2'h3):(2'h3)])));
  assign wire111 = (^~$signed((wire109 ?
                       ((&reg19) ?
                           (reg24 ?
                               reg20 : reg18) : wire86[(1'h0):(1'h0)]) : (&reg24[(5'h10):(4'h8)]))));
  assign wire112 = $signed(({(wire7 && (-wire89))} ?
                       $signed((wire6 - (wire109 ?
                           reg26 : wire88))) : ($signed((+wire107)) || wire109)));
  assign wire113 = wire112;
endmodule

module module90
#(parameter param106 = (((~^(+((8'hac) >> (8'hbf)))) ? (^(+((8'hbc) ? (8'hb2) : (7'h42)))) : ((^(^~(8'haa))) ? (~&((8'hb2) != (7'h44))) : (((8'hb7) * (8'haf)) ? {(8'hbc), (8'ha4)} : (~&(8'h9f))))) ? ({((+(8'h9f)) < (+(8'hbf)))} & {(((8'hbc) < (8'hb3)) && {(8'ha3), (8'h9e)}), (^{(8'h9d)})}) : ((~(~^(^~(7'h40)))) ? ({((8'ha0) ? (8'ha5) : (7'h42)), ((8'hb0) ? (8'haf) : (8'ha0))} | (^{(8'ha4)})) : ((&(7'h44)) ? (~|(^~(8'hae))) : (^~((8'hb7) ? (8'hbe) : (8'ha8)))))))
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire95;
  input wire [(4'he):(1'h0)] wire94;
  input wire [(2'h3):(1'h0)] wire93;
  input wire [(5'h14):(1'h0)] wire92;
  input wire signed [(4'h9):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 (1'h0)};
  assign wire96 = $unsigned((~^wire95[(3'h6):(1'h1)]));
  assign wire97 = (((^((wire93 ? wire92 : wire92) ?
                          (^~wire95) : $signed(wire92))) >>> wire95) ?
                      $signed(wire91[(2'h3):(2'h3)]) : (+((8'hb4) <<< ((8'h9f) ?
                          (wire92 ? wire92 : wire92) : (wire96 ?
                              (8'hb2) : wire92)))));
  assign wire98 = (wire94 ?
                      wire93 : (wire96 ?
                          (wire97 ? $signed({wire93}) : wire95) : (+((wire91 ?
                                  wire94 : (8'hb9)) ?
                              (wire91 << (8'ha3)) : $unsigned(wire95)))));
  assign wire99 = $signed($signed($unsigned((&(wire91 ? wire97 : (7'h43))))));
  assign wire100 = $unsigned({wire91});
  assign wire101 = wire95[(1'h1):(1'h0)];
  assign wire102 = $signed(wire97[(1'h1):(1'h0)]);
  assign wire103 = $signed(($unsigned((-(wire95 || (7'h41)))) || {wire101}));
  assign wire104 = ($unsigned(wire95) ?
                       $unsigned($signed(((wire99 ?
                           wire96 : wire97) << wire94))) : $signed($signed($signed($unsigned(wire99)))));
  assign wire105 = $signed((~&{wire95}));
endmodule

module module33
#(parameter param84 = ((((((8'had) ? (7'h43) : (8'hbe)) == (8'haa)) ? (+((7'h42) != (8'hb5))) : (((8'h9c) < (8'ha3)) & ((8'hb2) ? (8'hb5) : (8'hb1)))) << {(((8'h9c) ? (8'hb6) : (8'hb8)) & ((8'hae) << (8'ha0))), (|{(8'hb6), (8'ha2)})}) > (!({((8'hb1) * (8'ha4)), ((7'h40) ? (8'h9c) : (8'h9d))} ? (((8'hb9) ? (8'hbb) : (8'h9d)) + (~^(8'ha3))) : (|{(8'hb3), (7'h40)})))), 
parameter param85 = (|param84))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  input wire [(4'hc):(1'h0)] wire36;
  input wire signed [(4'h9):(1'h0)] wire35;
  input wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire39 = wire37[(1'h0):(1'h0)];
  assign wire40 = ($signed(wire36[(1'h1):(1'h0)]) + $signed(({{wire37}} + wire34)));
  assign wire41 = {(^{wire37})};
  assign wire42 = $unsigned((!(wire36[(1'h0):(1'h0)] ^~ ((wire40 ?
                          wire37 : wire37) ?
                      {wire35} : (wire36 ? wire36 : wire38)))));
  assign wire43 = (~&$signed(wire34[(3'h4):(3'h4)]));
  assign wire44 = ((wire41[(1'h1):(1'h1)] ?
                          $unsigned($signed($unsigned(wire36))) : wire35[(2'h2):(1'h0)]) ?
                      wire39[(1'h1):(1'h0)] : (&wire39));
  always
    @(posedge clk) begin
      reg45 <= wire35;
      reg46 <= ((wire36[(3'h6):(2'h2)] < $signed(wire39[(4'hb):(3'h4)])) & wire38[(3'h6):(2'h2)]);
    end
  assign wire47 = wire40[(1'h1):(1'h0)];
  assign wire48 = ($signed((8'hb1)) <<< wire38[(2'h3):(1'h1)]);
  assign wire49 = wire40[(1'h1):(1'h1)];
  assign wire50 = $unsigned(({$unsigned((wire36 ? wire35 : wire49)),
                      ({wire43, (8'h9e)} ?
                          (~wire34) : $unsigned(wire39))} || wire47[(3'h4):(3'h4)]));
  assign wire51 = wire49[(4'h9):(4'h9)];
  always
    @(posedge clk) begin
      reg52 <= wire38[(3'h7):(2'h3)];
      if ($unsigned(wire37[(4'h9):(3'h7)]))
        begin
          reg53 <= wire40[(1'h0):(1'h0)];
          reg54 <= ({(&wire35[(2'h2):(1'h0)])} ?
              (^~$signed(((wire42 < reg52) & ((8'hae) && reg45)))) : $signed($unsigned(wire36[(4'hb):(4'h9)])));
          reg55 <= $signed(wire37);
          reg56 <= wire40[(1'h0):(1'h0)];
        end
      else
        begin
          reg53 <= ($signed(((+$signed((8'hab))) != $unsigned((reg52 * reg46)))) ?
              reg54 : $unsigned({(~^$signed(wire35))}));
        end
      reg57 <= $signed((({(~|wire47)} + wire38[(1'h0):(1'h0)]) <= {(((8'hbb) ?
                  wire48 : reg54) ?
              (reg54 ^ reg45) : (wire34 ? wire50 : wire50))}));
    end
  assign wire58 = wire38;
  assign wire59 = ((!wire37[(1'h1):(1'h0)]) ?
                      $signed($unsigned($unsigned((~wire34)))) : $signed((&({reg55} ?
                          $signed(reg45) : reg57))));
  assign wire60 = {{wire50, (~|$signed($signed(wire35)))},
                      {{wire40[(1'h1):(1'h1)],
                              {$unsigned((8'ha9)), $signed(wire47)}},
                          $unsigned((~^$unsigned((8'ha1))))}};
  assign wire61 = {{wire48, reg56},
                      (wire39[(3'h7):(2'h2)] ?
                          (+$signed((!wire51))) : (~&{((8'hac) ?
                                  (8'hab) : wire41),
                              (wire48 ? reg46 : wire48)}))};
  assign wire62 = reg55[(5'h10):(3'h5)];
  assign wire63 = $unsigned(reg54[(3'h4):(2'h3)]);
  assign wire64 = (~{wire34[(2'h2):(1'h0)]});
  assign wire65 = $unsigned($unsigned(wire47[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg66 <= (+reg46);
      if (({(&wire60[(4'h9):(2'h3)]),
              $unsigned(({wire43, wire61} ? wire41[(4'hd):(4'hb)] : reg56))} ?
          $unsigned(($signed((-wire40)) ?
              $signed($unsigned(wire42)) : (~$unsigned(wire47)))) : reg53[(2'h2):(2'h2)]))
        begin
          reg67 <= wire62[(4'hd):(3'h7)];
          reg68 <= wire65;
          if (reg46)
            begin
              reg69 <= {reg46};
              reg70 <= ($unsigned($signed({(reg68 >= wire35),
                  (^~wire49)})) >>> ((^~reg66) ?
                  wire34[(3'h4):(2'h3)] : ($unsigned($signed(wire38)) ?
                      $unsigned(wire40[(1'h0):(1'h0)]) : ($signed(reg46) != (wire61 ?
                          wire48 : wire64)))));
              reg71 <= reg57;
            end
          else
            begin
              reg69 <= (~|wire65[(4'h9):(4'h8)]);
              reg70 <= {reg71,
                  ({$unsigned({(8'ha8), wire40})} ?
                      reg68 : $signed((~&$unsigned(wire35))))};
              reg71 <= (wire65 - $signed((~&wire61[(3'h5):(3'h4)])));
            end
          reg72 <= (reg69 ?
              (((wire38[(1'h0):(1'h0)] * (^wire42)) >>> {wire39}) ?
                  (wire37 ?
                      reg69[(3'h7):(2'h3)] : $unsigned(reg71)) : $unsigned($signed(wire42[(2'h3):(1'h1)]))) : $signed(reg52));
        end
      else
        begin
          reg67 <= (|wire38[(3'h7):(1'h1)]);
          reg68 <= $signed(wire39);
          reg69 <= ((~|{$unsigned((reg57 + wire42))}) > {$signed(((8'hb4) <= wire44))});
          if (wire59[(1'h0):(1'h0)])
            begin
              reg70 <= wire50[(2'h3):(1'h1)];
              reg71 <= (~&$signed((wire50[(1'h0):(1'h0)] && ($unsigned((7'h44)) <<< reg53[(3'h6):(3'h6)]))));
              reg72 <= $signed(((7'h40) ?
                  reg72[(2'h3):(1'h0)] : {{(wire50 ~^ wire43)}}));
              reg73 <= $signed((~^{((reg72 ? (8'hbd) : reg55) - (^wire65)),
                  wire41[(4'h8):(3'h6)]}));
            end
          else
            begin
              reg70 <= wire47[(1'h1):(1'h0)];
              reg71 <= $signed($unsigned(wire50[(3'h7):(3'h7)]));
              reg72 <= $signed((wire43 >= (~^wire50)));
              reg73 <= ($signed($signed((!((8'hbd) ? wire60 : (8'ha2))))) ?
                  $signed($unsigned(reg73[(2'h2):(1'h0)])) : (((^$signed((8'ha5))) & reg67[(1'h1):(1'h0)]) ?
                      reg56 : ($signed((+reg53)) ?
                          $signed(reg71[(5'h11):(3'h6)]) : $signed((wire35 ?
                              (8'haf) : (7'h41))))));
            end
          if ((8'hbe))
            begin
              reg74 <= reg56[(2'h2):(1'h1)];
            end
          else
            begin
              reg74 <= (~$signed($signed(($unsigned((8'haa)) <= $signed(wire64)))));
              reg75 <= $unsigned($unsigned((($signed(wire37) ?
                  reg55[(3'h6):(2'h3)] : $signed(wire34)) <<< (wire38 != $signed(reg56)))));
            end
        end
      if (($unsigned({({(8'hba), wire51} ? {reg73} : $signed(reg46)),
          ($signed(wire49) ?
              (~&(7'h40)) : (reg69 | (7'h41)))}) + ($unsigned(wire65[(3'h4):(1'h0)]) ?
          ($signed((^~wire35)) - wire34[(1'h0):(1'h0)]) : $unsigned($signed(reg66[(1'h0):(1'h0)])))))
        begin
          reg76 <= wire63;
          if ((reg57[(4'ha):(3'h5)] ?
              $signed($signed({{reg52}, wire37})) : (!$signed({(^~wire51),
                  (reg72 ? wire50 : wire37)}))))
            begin
              reg77 <= reg73;
              reg78 <= reg67;
              reg79 <= (&(|(~^($unsigned(wire59) ~^ (^~reg52)))));
            end
          else
            begin
              reg77 <= {(^reg69[(2'h3):(2'h2)]), (~|wire35[(4'h9):(3'h6)])};
              reg78 <= $unsigned((reg46 > wire51));
            end
          if (reg52[(2'h3):(2'h2)])
            begin
              reg80 <= $unsigned(wire39);
            end
          else
            begin
              reg80 <= (((^~wire65[(1'h0):(1'h0)]) | reg67) ?
                  (({(reg57 ~^ reg70)} ?
                      ((^~reg72) ?
                          (~wire65) : (+(7'h41))) : (wire47[(1'h0):(1'h0)] == reg57[(4'h8):(2'h2)])) * {wire63,
                      $signed($unsigned(wire39))}) : $unsigned(wire37));
              reg81 <= wire41;
            end
        end
      else
        begin
          reg76 <= ((+$unsigned(($signed(wire64) ?
              wire61 : wire38[(1'h1):(1'h1)]))) && {(^$signed((|wire58))),
              ($unsigned((wire60 ? reg75 : wire44)) & (8'ha3))});
          if (($signed($signed(($signed(wire61) == $unsigned((8'had))))) != wire49))
            begin
              reg77 <= wire51;
              reg78 <= reg80[(3'h4):(2'h3)];
              reg79 <= (|$signed((!{{reg54}})));
              reg80 <= (^($signed($unsigned($unsigned(wire41))) ?
                  reg67[(3'h6):(3'h4)] : $signed(((reg74 ?
                      (8'ha5) : reg76) >> (wire62 ? reg76 : wire59)))));
              reg81 <= wire59;
            end
          else
            begin
              reg77 <= $unsigned({((wire34 ? reg80 : $signed(wire44)) ?
                      reg56[(1'h1):(1'h0)] : ((8'ha6) >>> (^reg70)))});
              reg78 <= wire41[(3'h6):(1'h0)];
            end
          reg82 <= (((~&{{wire42,
                  (8'hb5)}}) <<< $unsigned((((8'hae) <<< wire50) ?
              (reg66 ? reg66 : reg75) : wire65))) || ((|(7'h44)) ?
              (wire39[(2'h3):(1'h0)] ?
                  reg71 : (^{reg81, reg52})) : $signed({{(8'h9e), (8'had)}})));
        end
      reg83 <= $unsigned(reg55);
    end
endmodule

module module132
#(parameter param175 = (|{(+(((8'h9c) * (8'hb6)) ? (8'hb3) : ((8'hab) ^~ (8'h9e)))), ((~^{(8'haf)}) ? ((^~(8'ha0)) ? {(8'ha2), (8'hbc)} : ((8'ha7) >>> (8'ha4))) : (((8'hbd) + (8'hac)) ? (|(8'hb1)) : (8'ha7)))}))
(y, clk, wire136, wire135, wire134, wire133);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire136;
  input wire [(5'h13):(1'h0)] wire135;
  input wire [(5'h15):(1'h0)] wire134;
  input wire signed [(3'h6):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire174;
  wire [(3'h7):(1'h0)] wire169;
  wire [(5'h14):(1'h0)] wire168;
  wire signed [(4'ha):(1'h0)] wire167;
  wire signed [(5'h10):(1'h0)] wire166;
  wire [(5'h11):(1'h0)] wire165;
  wire signed [(3'h7):(1'h0)] wire164;
  wire [(4'he):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire162;
  wire signed [(5'h11):(1'h0)] wire148;
  wire signed [(4'hb):(1'h0)] wire147;
  wire signed [(2'h2):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire143;
  wire [(4'hd):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire137;
  reg [(2'h3):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  assign y = {wire174,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire139,
                 wire138,
                 wire137,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg140,
                 (1'h0)};
  assign wire137 = (8'ha4);
  assign wire138 = wire136[(4'h8):(3'h6)];
  assign wire139 = {(wire133[(3'h5):(1'h0)] + ($unsigned(wire135) >> ((wire135 >>> wire136) + $unsigned(wire133)))),
                       wire137[(4'hc):(4'hc)]};
  always
    @(posedge clk) begin
      reg140 <= (~^((wire139[(4'h8):(3'h7)] ?
              $signed(((8'ha9) == wire134)) : ((wire137 << wire136) ?
                  (wire139 ? wire139 : wire138) : (wire139 <= wire138))) ?
          (+$signed((wire137 ?
              (8'hb5) : wire138))) : $unsigned($unsigned({wire134, wire133}))));
    end
  assign wire141 = ((~^($unsigned(wire133[(1'h1):(1'h0)]) | {wire138,
                           $unsigned((8'haf))})) ?
                       ((-wire137) <= $unsigned($signed($unsigned(reg140)))) : wire139[(2'h2):(2'h2)]);
  assign wire142 = $signed(($signed($signed({wire134,
                       wire134})) != $unsigned($signed((wire141 ?
                       (8'h9c) : wire136)))));
  assign wire143 = ((8'hb7) ?
                       ((~^wire133) >= $unsigned({$unsigned(wire133)})) : reg140[(3'h7):(2'h3)]);
  assign wire144 = {$signed(($unsigned((wire135 <<< wire143)) ^~ wire137[(5'h12):(3'h5)])),
                       (~&wire133)};
  assign wire145 = ($unsigned(($signed($unsigned((8'ha4))) - $signed(wire144))) ?
                       wire139 : (!$signed({$unsigned(wire141)})));
  assign wire146 = (8'ha1);
  assign wire147 = wire143[(4'h9):(4'h8)];
  assign wire148 = ((-$unsigned(({wire144} ~^ {(7'h44), wire142}))) > wire139);
  always
    @(posedge clk) begin
      if ((^$unsigned((reg140[(1'h0):(1'h0)] ?
          $unsigned((wire139 ?
              reg140 : wire136)) : $signed(wire136[(4'hc):(2'h3)])))))
        begin
          reg149 <= wire139[(4'hc):(4'ha)];
          reg150 <= $unsigned((wire135[(4'hd):(3'h4)] ?
              (((wire141 ? wire142 : (8'ha6)) ?
                  $unsigned((8'hb3)) : wire138) < ($signed(wire138) || (-wire145))) : $signed(wire139[(5'h11):(4'hf)])));
          if (wire137)
            begin
              reg151 <= wire135;
              reg152 <= $signed($unsigned(wire142[(3'h5):(2'h3)]));
              reg153 <= ($unsigned({($signed(wire142) ?
                          $signed(wire139) : $unsigned(wire141)),
                      $signed($signed(reg150))}) ?
                  $unsigned((~^(wire135 & (wire142 ?
                      reg140 : wire138)))) : $unsigned({((^~(7'h41)) <<< (wire142 <<< wire139))}));
              reg154 <= ((+(wire139[(4'hd):(3'h5)] < ($unsigned(wire135) ?
                  (wire142 ? (8'hb2) : wire139) : {reg150,
                      wire136}))) ~^ $signed($unsigned(reg150[(1'h0):(1'h0)])));
              reg155 <= (wire136[(2'h2):(1'h1)] ?
                  {wire139,
                      (reg140[(2'h3):(2'h2)] ^ (+reg153[(1'h0):(1'h0)]))} : (wire145 ?
                      wire133 : ($signed(wire139[(2'h3):(2'h2)]) ?
                          {(reg149 + wire135),
                              (wire134 * wire143)} : $signed((reg154 - reg140)))));
            end
          else
            begin
              reg151 <= wire138[(1'h1):(1'h0)];
              reg152 <= {((7'h42) ?
                      ((^~{reg152}) >>> ($unsigned((8'ha8)) < wire138[(4'h9):(3'h7)])) : ($unsigned((&reg153)) <<< ($unsigned(reg152) ?
                          $unsigned(reg140) : {wire148})))};
            end
          if ({{$unsigned($unsigned(wire137))}})
            begin
              reg156 <= ($unsigned(wire146[(1'h1):(1'h1)]) ?
                  wire145 : ($unsigned($signed((!(8'hb3)))) & wire143));
              reg157 <= $unsigned($signed({wire145,
                  $unsigned((reg151 ? wire138 : reg151))}));
              reg158 <= {(wire139 <<< $signed($signed($signed(wire143))))};
              reg159 <= $signed($signed((($unsigned(wire137) ?
                  reg152[(1'h1):(1'h1)] : reg149) && ((wire136 ?
                  reg155 : (8'ha9)) >= (8'ha0)))));
            end
          else
            begin
              reg156 <= $signed($unsigned($signed((reg159[(3'h7):(1'h0)] ?
                  $unsigned(reg157) : wire144))));
              reg157 <= $signed(($signed($signed((wire136 >> reg158))) ?
                  ((-{reg155, wire143}) ?
                      (wire133[(2'h2):(2'h2)] ?
                          $unsigned(reg153) : (~(8'ha3))) : wire144[(4'hd):(4'hd)]) : (&$signed(wire134[(2'h3):(2'h2)]))));
              reg158 <= (($unsigned(reg149) ?
                      ($unsigned(wire142) ?
                          $signed((|wire141)) : $unsigned((^wire136))) : ($signed($signed((8'ha0))) ?
                          ((8'hac) + ((8'ha5) ?
                              reg157 : (8'h9e))) : ($unsigned((8'ha6)) ?
                              wire143[(4'ha):(3'h6)] : {wire147, reg154}))) ?
                  (wire144[(3'h5):(1'h0)] >> $unsigned((^~(|wire142)))) : $unsigned((8'hbe)));
            end
          reg160 <= wire137;
        end
      else
        begin
          reg149 <= $signed((!(~&{$unsigned((8'ha0))})));
        end
      reg161 <= reg150[(3'h6):(3'h4)];
    end
  assign wire162 = wire147;
  assign wire163 = reg153[(1'h1):(1'h0)];
  assign wire164 = ($signed((wire134[(4'hd):(1'h1)] >= wire137)) ?
                       reg160 : $unsigned(reg158));
  assign wire165 = (wire145 ?
                       ($unsigned($unsigned($unsigned(wire147))) >> (((reg156 ~^ wire133) || (wire148 ^ wire164)) ?
                           ((^~wire139) <= (&wire136)) : reg149[(4'hb):(4'hb)])) : $signed(wire136));
  assign wire166 = {(((~(reg156 ? reg149 : (8'hbb))) ?
                           reg161 : $signed((wire147 ?
                               wire148 : wire148))) >= (|(reg159[(3'h7):(2'h3)] ^ (~wire146)))),
                       {{({(8'ha1)} ?
                                   $unsigned(wire148) : (wire144 ?
                                       wire162 : reg159)),
                               $unsigned($signed(reg152))},
                           wire139[(4'h8):(1'h0)]}};
  assign wire167 = wire163[(4'h8):(2'h2)];
  assign wire168 = ($signed(wire163) < $signed($unsigned({(wire137 ?
                           wire146 : wire133),
                       (reg156 ? (8'h9c) : wire164)})));
  assign wire169 = (($signed($unsigned(wire146[(1'h1):(1'h0)])) >>> (!$unsigned(((8'hb6) ?
                       reg152 : wire147)))) > (reg152[(3'h6):(1'h1)] ?
                       wire163 : (wire146 ?
                           reg150[(4'h8):(3'h4)] : $unsigned($signed(reg140)))));
  always
    @(posedge clk) begin
      reg170 <= {(reg156 & wire167[(3'h6):(2'h2)])};
      if (({$unsigned((~&$unsigned(wire162)))} ?
          $unsigned(reg155[(2'h2):(1'h0)]) : wire133))
        begin
          reg171 <= ($unsigned(wire147) >>> reg159);
        end
      else
        begin
          if ($signed((~|((~|{reg157, reg153}) ^ (reg151[(4'ha):(4'h8)] ?
              (8'hb1) : $unsigned(wire169))))))
            begin
              reg171 <= $unsigned({$signed($signed((wire148 ?
                      (8'ha3) : wire142))),
                  wire166[(4'hd):(4'h8)]});
            end
          else
            begin
              reg171 <= wire144[(1'h1):(1'h1)];
              reg172 <= (8'haf);
            end
          reg173 <= wire168[(4'hf):(1'h1)];
        end
    end
  assign wire174 = (~&((-wire139) < $unsigned((~|(+reg153)))));
endmodule
