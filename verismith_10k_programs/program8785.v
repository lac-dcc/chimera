module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire136,
                 wire134,
                 wire51,
                 wire50,
                 wire48,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(((wire3 ^~ {$signed(wire2),
                     (&(8'had))}) < $signed(wire2[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg5 <= wire1;
      if (($unsigned(wire2[(1'h1):(1'h0)]) * wire2[(3'h4):(1'h0)]))
        begin
          reg6 <= $unsigned(((($unsigned(wire1) <<< (~reg5)) ?
              ({wire2} ? $signed(wire4) : $unsigned(wire1)) : $unsigned((reg5 ?
                  wire1 : wire1))) >>> $signed((wire1 >> wire2[(2'h2):(1'h1)]))));
          if (wire4)
            begin
              reg7 <= wire2[(1'h0):(1'h0)];
              reg8 <= reg7[(1'h0):(1'h0)];
            end
          else
            begin
              reg7 <= ((8'hb1) ?
                  (wire1[(3'h4):(2'h2)] ~^ $unsigned(wire2)) : (8'hbf));
              reg8 <= (wire4 + $signed((reg8[(4'hf):(1'h0)] || $unsigned({wire4}))));
              reg9 <= (8'ha3);
            end
        end
      else
        begin
          reg6 <= (wire4 & (+((-$unsigned(reg8)) ?
              $unsigned($unsigned(reg9)) : wire4[(4'hd):(1'h0)])));
          reg7 <= (wire1 && ($unsigned(($signed(reg7) ?
                  $signed(reg7) : (reg8 ? reg8 : reg7))) ?
              (($signed((8'hba)) ?
                  ((8'hb1) - reg9) : reg5) >>> ((^reg7) != reg8)) : {$signed(wire4),
                  reg5}));
          reg8 <= $signed($unsigned($unsigned((~(wire1 ? reg7 : wire4)))));
          reg9 <= wire4;
          reg10 <= $signed($unsigned({$signed($unsigned(reg6)),
              $unsigned($unsigned(wire2))}));
        end
      reg11 <= (((!(((8'hb5) != reg9) ? $signed(reg6) : $unsigned(reg7))) ?
          {wire4} : reg10) || (^~(8'hbb)));
      if ((reg10 ^~ ($signed((&(wire3 <= reg7))) ?
          $unsigned(((wire4 ? reg9 : reg11) >> reg5)) : wire0[(1'h0):(1'h0)])))
        begin
          reg12 <= (reg11 ^~ $signed($signed($unsigned({reg8}))));
          reg13 <= $unsigned((~(((wire1 ? wire1 : reg8) ?
              {reg10, wire2} : (~wire0)) || reg8[(2'h3):(2'h2)])));
          reg14 <= reg13;
        end
      else
        begin
          if ($unsigned($unsigned($signed((wire3 ?
              ((8'haf) ? reg12 : reg10) : wire1)))))
            begin
              reg12 <= $signed($signed($unsigned($signed(wire4[(3'h4):(2'h3)]))));
              reg13 <= reg9[(2'h2):(1'h0)];
              reg14 <= (&(wire4[(3'h6):(3'h4)] > wire2[(3'h4):(2'h3)]));
              reg15 <= reg5[(4'hc):(4'ha)];
            end
          else
            begin
              reg12 <= (+reg15[(3'h6):(3'h4)]);
              reg13 <= (($unsigned((~&(~&reg14))) ? reg5 : reg6) ?
                  {(reg5 ?
                          ((|reg9) <= (wire1 == wire3)) : wire1)} : ((($unsigned((8'haa)) ?
                          reg13 : wire3[(1'h0):(1'h0)]) ?
                      ($signed(reg15) ?
                          reg13 : (~^wire0)) : $signed((reg9 != (8'hba)))) >> {wire2[(1'h1):(1'h1)],
                      (reg5 - wire1[(2'h3):(1'h0)])}));
              reg14 <= $unsigned(((-{$signed(reg5)}) ?
                  ({(^~reg7),
                      $unsigned((8'ha2))} > reg8[(4'hb):(4'hb)]) : (~&(~&{reg14,
                      (8'haf)}))));
              reg15 <= (~|{($signed((+reg6)) >> ($unsigned(reg8) ?
                      $signed((8'hbb)) : (reg5 ? wire4 : reg10)))});
            end
        end
      reg16 <= reg12;
    end
  module17 #() modinst49 (wire48, clk, reg16, wire4, reg9, wire2);
  assign wire50 = ($signed($signed(reg10)) ?
                      ((reg8 ?
                          $unsigned((+reg14)) : (wire0[(3'h4):(1'h1)] ?
                              wire1 : {reg13})) + $signed(((reg10 << wire2) ?
                          $unsigned(reg13) : {reg7, wire0}))) : reg5);
  assign wire51 = reg14[(4'h9):(3'h5)];
  module52 #() modinst135 (.y(wire134), .clk(clk), .wire55(wire50), .wire54(reg8), .wire56(wire48), .wire53(reg9));
  assign wire136 = $unsigned(reg8[(1'h1):(1'h1)]);
endmodule

module module52
#(parameter param133 = (~^((&(8'haf)) <= {({(8'h9d), (7'h44)} ? (^(8'hb2)) : {(8'hb5)})})))
(y, clk, wire53, wire54, wire55, wire56);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire53;
  input wire [(5'h15):(1'h0)] wire54;
  input wire signed [(3'h6):(1'h0)] wire55;
  input wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire132;
  wire signed [(3'h7):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(4'hd):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire [(4'ha):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire98;
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire124,
                 wire123,
                 wire116,
                 wire115,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire57,
                 wire98,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire57 = ($signed($unsigned(wire54)) >>> (!(8'hbe)));
  module58 #() modinst99 (wire98, clk, wire56, wire55, wire57, wire54, wire53);
  assign wire100 = (~((!$unsigned(wire98)) && $unsigned(($unsigned(wire98) >> wire55[(3'h5):(2'h2)]))));
  assign wire101 = (|(^wire100[(3'h7):(1'h1)]));
  assign wire102 = $unsigned(wire53[(3'h4):(1'h1)]);
  assign wire103 = wire57;
  assign wire104 = (~$unsigned($signed((wire54[(5'h14):(5'h12)] ?
                       (wire53 ? wire98 : wire53) : $unsigned(wire56)))));
  assign wire105 = ($unsigned(wire98) ?
                       $signed((8'hb5)) : ({{wire55[(1'h1):(1'h0)]},
                           (8'hbc)} & $unsigned(wire56)));
  assign wire106 = (^(~$unsigned(((~|wire101) ?
                       $unsigned(wire54) : ((8'ha5) ? wire103 : wire54)))));
  assign wire107 = (!(8'h9d));
  assign wire108 = (~&((&(8'hb1)) ?
                       (~&(((8'ha6) ? wire57 : wire53) ?
                           wire103 : (7'h40))) : wire102));
  assign wire109 = (($signed($unsigned((^~wire107))) <= ((wire105[(3'h5):(2'h3)] ?
                               wire101 : wire55) ?
                           $unsigned({wire107}) : ((wire105 ?
                               wire101 : wire54) && $unsigned(wire101)))) ?
                       ((+($signed((8'haa)) ?
                           wire104 : (^~wire105))) >> (wire103 ?
                           wire57 : (^wire53))) : (8'haa));
  assign wire110 = $signed((^$unsigned($signed({(7'h42)}))));
  always
    @(posedge clk) begin
      reg111 <= wire56[(5'h10):(5'h10)];
      reg112 <= wire56;
      reg113 <= wire103[(1'h0):(1'h0)];
      reg114 <= ($unsigned(wire105) ?
          (wire54[(4'hf):(4'h9)] ?
              wire98[(2'h2):(2'h2)] : (~|(wire105[(3'h5):(3'h5)] | {wire107}))) : (~|($unsigned((wire57 ?
              (8'hae) : wire102)) ^~ wire53)));
    end
  assign wire115 = $signed(wire56);
  assign wire116 = (~|$signed(wire103[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ((reg114 ?
          ((^{reg111[(2'h3):(1'h1)]}) != {$signed(wire55[(3'h6):(3'h6)]),
              wire98}) : reg114[(3'h5):(2'h3)]))
        begin
          reg117 <= wire56[(4'hc):(3'h4)];
          reg118 <= ($signed((^(~^$unsigned(wire54)))) ?
              ($unsigned(wire57[(3'h6):(3'h4)]) ^ $signed(wire109[(1'h0):(1'h0)])) : reg113[(4'ha):(4'h8)]);
          if ({({wire116[(4'ha):(4'ha)]} <= ($signed($signed((8'h9f))) ?
                  (~&$unsigned((8'hb3))) : (wire102[(3'h6):(2'h2)] ?
                      reg112[(3'h7):(3'h6)] : wire57[(4'hb):(4'h9)]))),
              (8'ha7)})
            begin
              reg119 <= $signed(wire110);
              reg120 <= wire107;
              reg121 <= (!reg118[(5'h11):(3'h6)]);
              reg122 <= reg112[(4'h8):(2'h3)];
            end
          else
            begin
              reg119 <= ((wire104[(3'h4):(3'h4)] ?
                  $unsigned((reg122 < $signed(reg111))) : (+(8'hac))) ^~ ((-(((7'h44) ?
                  reg117 : wire109) && ((8'hbb) && wire56))) & $unsigned(((!reg118) ?
                  $unsigned((8'ha1)) : (8'h9f)))));
              reg120 <= wire108[(1'h0):(1'h0)];
              reg121 <= $signed($signed(((~(~|reg119)) ?
                  reg112[(2'h3):(2'h2)] : $unsigned((wire103 ?
                      wire103 : (8'had))))));
            end
        end
      else
        begin
          reg117 <= reg119;
          reg118 <= wire107;
          reg119 <= $unsigned(reg122);
        end
    end
  assign wire123 = ($signed((8'haf)) ?
                       $signed(reg122[(4'h8):(4'h8)]) : $unsigned($unsigned($signed($signed(wire53)))));
  assign wire124 = $unsigned(reg113);
  always
    @(posedge clk) begin
      reg125 <= $unsigned($signed($unsigned((((7'h42) ?
          (8'hb6) : wire102) ^~ (reg122 ? reg113 : reg111)))));
      reg126 <= ($signed((&(wire102[(2'h3):(2'h3)] ^ $signed(wire98)))) ?
          ($unsigned((~(reg111 != reg113))) ?
              $signed(wire56[(5'h10):(4'h9)]) : (wire57 ?
                  $signed((wire105 ~^ reg111)) : $unsigned((~wire109)))) : reg111);
      reg127 <= $unsigned(((reg113 ?
              wire54[(5'h10):(2'h2)] : ($signed(wire107) ^ (~^reg112))) ?
          $unsigned(($signed(wire116) ^~ (+reg121))) : $unsigned((wire53[(1'h0):(1'h0)] ?
              reg118 : (8'hae)))));
      reg128 <= $signed($signed((wire100 ?
          reg126 : $signed($unsigned(wire123)))));
      reg129 <= reg128;
    end
  assign wire130 = (reg125 ?
                       $signed({($signed(reg119) ^~ wire105)}) : reg112[(3'h6):(3'h4)]);
  assign wire131 = wire115;
  assign wire132 = $unsigned((reg125 ? {(8'hbb)} : wire106[(1'h1):(1'h1)]));
endmodule

module module17
#(parameter param47 = ((((8'haa) < ((~^(8'hae)) ? ((8'ha3) ? (8'ha5) : (8'hae)) : {(8'hae), (8'hba)})) + (|(^~((8'hbb) ? (7'h43) : (8'hb5))))) + ((((+(8'hbe)) && ((8'ha6) ? (7'h44) : (8'hb5))) ? ((^~(8'hb4)) <<< ((8'hb0) ^~ (8'hba))) : ({(7'h40), (8'h9d)} > ((8'h9e) ? (8'ha0) : (8'hb8)))) ^ {(^~((8'haa) || (8'hab))), (~&{(8'ha9)})})))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire46,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 (1'h0)};
  assign wire22 = ($signed(wire19[(1'h1):(1'h1)]) ^ wire20);
  assign wire23 = (+wire21);
  assign wire24 = $signed(wire19);
  assign wire25 = ($signed($signed(wire22)) ?
                      ($unsigned((wire23[(4'hf):(1'h1)] - $unsigned(wire22))) ?
                          (({wire22} ?
                              (wire19 & (8'ha2)) : ((8'hbb) ?
                                  wire19 : wire21)) <<< {$signed((8'ha8)),
                              (wire19 ?
                                  wire18 : wire24)}) : wire22[(1'h1):(1'h1)]) : wire23);
  assign wire26 = (~(~^((~^wire24) ?
                      ($unsigned(wire24) >= (wire21 > wire21)) : (^~(wire18 ?
                          wire20 : wire19)))));
  assign wire27 = ((wire20[(2'h2):(1'h0)] & ((~&wire20) ?
                          wire24 : ((wire21 ?
                              wire18 : wire25) ^~ (~|wire23)))) ?
                      ((wire19[(3'h7):(2'h2)] * (&wire25[(3'h7):(1'h1)])) ?
                          wire21[(3'h5):(2'h2)] : ({$unsigned(wire26),
                              (wire21 ?
                                  (8'ha0) : (8'h9c))} || (wire26 * $signed(wire24)))) : {wire18,
                          $signed($signed($unsigned((8'hb2))))});
  always
    @(posedge clk) begin
      reg28 <= (wire26[(3'h4):(2'h2)] >= ($signed(((!(7'h44)) >> (-wire18))) ?
          {$signed($unsigned((8'hb7)))} : {(~&(wire21 ? wire22 : (7'h44))),
              $unsigned((wire19 | wire20))}));
      reg29 <= $unsigned((~|(wire26 ~^ (~^wire21[(2'h2):(2'h2)]))));
      reg30 <= {(((wire19[(3'h7):(3'h5)] ?
              $unsigned((8'hbf)) : wire22) > ($unsigned(wire22) ?
              (wire19 ? wire19 : wire19) : {(8'h9c)})) ^~ wire24),
          ((-$unsigned((~&wire20))) ?
              $signed((-(wire25 ? wire23 : wire19))) : wire23[(4'hb):(3'h4)])};
      if ({reg28[(1'h1):(1'h0)]})
        begin
          reg31 <= (|(wire18[(3'h6):(1'h0)] > {(-(wire27 ^~ reg30))}));
          reg32 <= $signed((^$unsigned(wire19)));
        end
      else
        begin
          if ((~&(^wire26)))
            begin
              reg31 <= $signed(wire26);
              reg32 <= (~{{wire21},
                  ((!$signed((8'hab))) ?
                      wire27[(1'h1):(1'h0)] : (reg31 ? (|reg31) : (!reg32)))});
              reg33 <= {(^~$unsigned({(reg30 ? (8'h9c) : reg32)})),
                  wire18[(4'h8):(1'h0)]};
              reg34 <= $unsigned($unsigned(($signed((wire21 ?
                  reg31 : wire24)) && ((&wire20) + wire20[(3'h7):(3'h7)]))));
            end
          else
            begin
              reg31 <= $unsigned($signed(({(^~wire21),
                  (wire27 >= (7'h42))} * $signed(wire18))));
            end
          reg35 <= (|($unsigned((wire27[(1'h1):(1'h1)] >= (reg32 ?
                  wire18 : wire21))) ?
              (8'hba) : $signed(($signed(wire18) + $signed(wire22)))));
          reg36 <= ($unsigned(wire26[(3'h5):(2'h2)]) ?
              wire22 : $unsigned((^~wire22)));
          reg37 <= reg33[(3'h5):(3'h4)];
          reg38 <= (((&reg34) ? $unsigned((!$unsigned((8'ha8)))) : reg32) ?
              ($signed((~^wire21[(3'h5):(3'h4)])) - $unsigned(((reg33 != reg30) ?
                  $unsigned(wire20) : (wire24 << (7'h42))))) : $unsigned(wire27));
        end
      reg39 <= $signed($unsigned(((^reg33) ?
          $signed($signed(wire22)) : $signed($unsigned(wire21)))));
    end
  always
    @(posedge clk) begin
      reg40 <= wire25;
      reg41 <= $signed((($signed({wire27}) ?
          $unsigned(wire25[(3'h6):(2'h2)]) : (reg38[(1'h0):(1'h0)] ?
              (wire19 != reg37) : $signed(reg39))) ^ {wire23,
          $signed((reg40 ? wire20 : wire24))}));
      reg42 <= ((wire26[(2'h2):(1'h0)] ^~ {wire25[(3'h4):(2'h3)],
              reg40[(5'h14):(1'h1)]}) ?
          $signed((^~{(wire18 >> reg29)})) : (-$signed($unsigned(wire21))));
    end
  always
    @(posedge clk) begin
      reg43 <= $signed($signed($unsigned($unsigned({(8'ha5), reg41}))));
      reg44 <= (wire23[(4'hf):(3'h4)] ?
          $unsigned($unsigned(($unsigned(wire18) ?
              $unsigned(reg36) : (reg29 ?
                  reg30 : wire26)))) : $signed({$unsigned(wire23)}));
      reg45 <= ((~($signed({reg42, wire26}) ?
              $unsigned(wire23[(4'hb):(4'hb)]) : $unsigned({wire25}))) ?
          $unsigned({wire27[(2'h2):(2'h2)]}) : {wire24});
    end
  assign wire46 = $signed($signed(reg33));
endmodule

module module58
#(parameter param96 = ((~((((7'h41) ? (8'ha2) : (8'hb8)) > ((8'hb3) == (8'hb7))) ^~ ({(8'hb3), (8'hba)} ? ((8'ha7) | (8'hb8)) : ((8'hbb) * (7'h41))))) <= (((~{(7'h44), (8'h9f)}) ^ {((8'hb4) ? (7'h44) : (8'hac))}) ^~ (+(|{(8'hab), (8'hba)})))), 
parameter param97 = ((8'ha1) ? (~(((+param96) ? (^~param96) : param96) ? {(param96 >= param96)} : param96)) : (|param96)))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire63;
  input wire [(2'h2):(1'h0)] wire62;
  input wire signed [(5'h15):(1'h0)] wire61;
  input wire signed [(5'h15):(1'h0)] wire60;
  input wire signed [(2'h2):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
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
                 (1'h0)};
  assign wire64 = (~(&$signed({$signed(wire59)})));
  assign wire65 = $signed($unsigned((wire61 ?
                      ((wire61 && wire64) >> wire60) : wire62[(1'h0):(1'h0)])));
  assign wire66 = ($signed(((wire60[(4'ha):(3'h5)] | {wire62, wire65}) ?
                      {$signed(wire61)} : wire63)) - $unsigned($signed({wire62})));
  assign wire67 = wire60;
  assign wire68 = wire60[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg69 <= wire59;
    end
  always
    @(posedge clk) begin
      if ((wire64[(4'h9):(1'h0)] ?
          (wire65[(5'h15):(4'hf)] ?
              {wire61,
                  $signed({(8'had),
                      wire67})} : {($signed(wire67) || (reg69 ^ (8'hbf))),
                  (8'hb3)}) : ((($signed(wire59) ?
                  $signed(wire68) : (wire60 ? wire68 : wire68)) ?
              ($signed(wire64) ?
                  $unsigned(wire59) : $unsigned(wire62)) : wire62) < (!wire61))))
        begin
          reg70 <= $signed(wire64[(4'hd):(3'h5)]);
          if ((|((|$signed($signed((8'had)))) || (wire66 >= ((wire61 ?
                  wire59 : wire67) ?
              wire62 : wire60)))))
            begin
              reg71 <= (^((~^{$signed(wire67)}) ?
                  wire61 : ((-(wire67 ?
                      wire65 : wire68)) + wire67[(3'h6):(3'h5)])));
            end
          else
            begin
              reg71 <= (((((^wire65) <= {reg70}) ?
                      wire60 : {(wire63 ? wire68 : wire66)}) ?
                  (~&((wire67 ?
                      wire60 : wire64) >> reg69[(1'h0):(1'h0)])) : (wire60 ?
                      {(wire68 ? wire60 : (8'ha8)),
                          wire65} : (^~(wire62 | reg70)))) + (-wire66[(2'h2):(1'h1)]));
              reg72 <= ((wire66[(4'h9):(4'h8)] ?
                  $signed(reg70) : (!(8'ha0))) ~^ reg71[(1'h0):(1'h0)]);
              reg73 <= $signed($unsigned(($unsigned(wire65[(5'h11):(4'hf)]) ?
                  (-$unsigned(wire59)) : $signed(reg69[(2'h3):(2'h2)]))));
            end
        end
      else
        begin
          reg70 <= wire61;
          reg71 <= $unsigned((8'hb4));
          reg72 <= (~wire61[(4'hb):(1'h0)]);
        end
      if ($unsigned($unsigned((reg69[(1'h0):(1'h0)] - $signed(wire60[(2'h2):(2'h2)])))))
        begin
          if ({(~&(!$unsigned(((8'hac) ^~ reg73)))),
              (wire59[(1'h1):(1'h0)] != wire63[(1'h0):(1'h0)])})
            begin
              reg74 <= $unsigned((((+wire60) << $unsigned((!wire61))) < (~(~^$signed(reg70)))));
              reg75 <= (|$signed(reg74));
            end
          else
            begin
              reg74 <= (~(reg72[(3'h6):(1'h1)] ?
                  reg72[(2'h2):(1'h0)] : ((~^$unsigned(wire67)) && {$unsigned(reg74)})));
              reg75 <= ((($unsigned($unsigned((8'hb3))) >>> $unsigned((|wire62))) + $signed(wire62)) ?
                  wire61[(5'h12):(4'h9)] : reg71);
              reg76 <= wire60;
              reg77 <= (reg73 >> wire59[(2'h2):(1'h0)]);
            end
          if (reg77[(4'h8):(4'h8)])
            begin
              reg78 <= $unsigned((^~(!$signed($signed(wire65)))));
            end
          else
            begin
              reg78 <= ((|wire68) ?
                  $unsigned({wire64[(3'h5):(1'h0)],
                      (wire64[(4'he):(1'h1)] ?
                          (^~reg70) : $unsigned(reg75))}) : ($unsigned((-(reg77 ?
                      wire67 : wire63))) != ($unsigned((reg76 >= reg73)) >= (wire67 >>> (wire60 ?
                      (8'hb3) : (8'ha2))))));
              reg79 <= wire62;
              reg80 <= reg73[(3'h6):(3'h5)];
            end
        end
      else
        begin
          if (((reg79[(4'he):(3'h6)] ?
                  (~&((reg75 ? reg71 : (8'had)) ?
                      $unsigned((8'ha1)) : $unsigned((8'ha4)))) : $signed(wire61)) ?
              reg77 : (~&$signed($signed(reg79[(3'h4):(3'h4)])))))
            begin
              reg74 <= (($signed(wire60) ? wire65[(2'h3):(1'h0)] : wire67) ?
                  (!{($unsigned(wire61) > (wire61 >>> reg71))}) : reg71[(4'hc):(4'h8)]);
              reg75 <= $unsigned($unsigned(((reg78[(1'h0):(1'h0)] ?
                      (reg75 | wire61) : (wire61 >>> (8'haa))) ?
                  (~|(reg79 ?
                      reg74 : reg76)) : $signed(reg78[(2'h3):(2'h3)]))));
              reg76 <= ((&$unsigned($unsigned(wire59[(1'h0):(1'h0)]))) ?
                  wire63[(2'h2):(2'h2)] : $unsigned({$unsigned(((8'ha1) ?
                          (8'hb1) : reg75)),
                      wire65[(2'h3):(1'h1)]}));
              reg77 <= ((8'h9c) ?
                  $signed(reg71) : ((-$signed((&reg72))) ?
                      {((~&wire60) ? wire61 : {reg72}),
                          (wire64[(4'he):(4'hb)] ?
                              (wire63 & reg80) : reg73)} : $unsigned($signed(reg80))));
              reg78 <= (~|(wire65 ?
                  reg71[(2'h2):(1'h0)] : wire59[(2'h2):(2'h2)]));
            end
          else
            begin
              reg74 <= wire65[(3'h5):(1'h0)];
              reg75 <= ($signed($unsigned(reg77[(3'h5):(2'h3)])) ^~ ((~^($unsigned(reg80) != (~(8'ha8)))) << (wire61[(2'h2):(1'h1)] ?
                  $signed(wire64[(4'ha):(2'h3)]) : $signed((wire63 << (8'hb8))))));
              reg76 <= $signed(reg71);
            end
          reg79 <= (({$signed(reg80), wire65[(5'h13):(4'h9)]} ?
                  $signed(((~|(7'h43)) ?
                      reg75[(4'he):(4'hc)] : wire61)) : wire65) ?
              ({$unsigned({reg70}), $signed({wire64})} ?
                  (~|$signed(reg78[(3'h5):(3'h4)])) : wire66[(4'h8):(3'h4)]) : reg77[(4'h8):(3'h5)]);
          reg80 <= ((8'hb9) < (wire60 ? reg69 : wire62));
          reg81 <= (|({$unsigned($signed(reg72)),
              ((wire67 != wire68) ?
                  $unsigned(wire66) : wire67)} <= ($signed($unsigned(wire60)) <= $signed(reg72))));
          reg82 <= $signed(($signed(reg81[(5'h13):(2'h2)]) * $signed($unsigned((|(8'ha0))))));
        end
      reg83 <= $signed((-$signed(((wire59 ^ reg72) ?
          ((8'hba) ? wire62 : reg77) : reg80))));
    end
  assign wire84 = (!reg75);
  assign wire85 = $signed(reg76[(4'he):(1'h0)]);
  assign wire86 = reg74[(3'h7):(1'h1)];
  assign wire87 = $unsigned((((reg79 ?
                          (reg81 ?
                              wire60 : reg72) : wire84[(4'h8):(3'h4)]) ^~ {reg76,
                          reg81}) ?
                      $signed((~^$unsigned(reg78))) : $unsigned(($unsigned(reg76) ~^ $unsigned(reg82)))));
  assign wire88 = $unsigned(((wire68[(1'h0):(1'h0)] * reg76[(3'h6):(2'h3)]) ?
                      reg71[(4'h8):(1'h1)] : $unsigned($unsigned($unsigned(wire61)))));
  assign wire89 = $unsigned(reg76[(5'h13):(3'h5)]);
  assign wire90 = $unsigned($signed(reg70));
  always
    @(posedge clk) begin
      reg91 <= $signed({(((-reg78) ?
              wire64[(3'h4):(2'h3)] : (wire66 ?
                  wire87 : wire87)) >> (&reg74))});
      reg92 <= {$signed(($signed({reg76,
              (8'hab)}) == ((wire59 < reg81) > (reg78 ? reg73 : wire67)))),
          (wire63 == (-wire88[(4'ha):(3'h7)]))};
      reg93 <= $signed(wire63[(1'h1):(1'h0)]);
      reg94 <= ((~^($signed(wire64[(4'he):(2'h3)]) ?
          $signed((reg69 + (8'ha0))) : {(reg72 ? reg78 : reg72),
              reg79})) >>> reg70[(3'h7):(2'h3)]);
      reg95 <= (~^$unsigned({(8'hb2), wire86}));
    end
endmodule
