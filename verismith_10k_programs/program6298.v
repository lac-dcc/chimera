module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire151;
  wire [(4'hc):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire [(4'ha):(1'h0)] wire148;
  wire signed [(4'h8):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire144;
  wire signed [(2'h3):(1'h0)] wire143;
  wire [(5'h12):(1'h0)] wire142;
  wire [(2'h3):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire140;
  wire signed [(5'h13):(1'h0)] wire139;
  wire [(5'h12):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire137;
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire86,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire137,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  module5 #() modinst87 (.y(wire86), .wire9(wire3), .clk(clk), .wire8(wire2), .wire7(wire0), .wire6(wire4), .wire10(wire1));
  assign wire88 = wire0[(3'h7):(3'h7)];
  assign wire89 = wire1[(2'h3):(2'h3)];
  assign wire90 = wire1[(2'h2):(2'h2)];
  assign wire91 = wire0;
  always
    @(posedge clk) begin
      reg92 <= $unsigned((~|wire88[(2'h2):(1'h1)]));
      reg93 <= $signed($unsigned($signed(wire90)));
      reg94 <= (!wire1[(3'h4):(2'h2)]);
      if ((reg92[(1'h1):(1'h0)] < (({(-reg93),
          (reg93 ?
              wire2 : wire1)} ^~ $unsigned(((8'ha2) && reg94))) > ((&(^~(8'hb5))) ?
          (~^(reg92 ? wire3 : reg92)) : reg93))))
        begin
          if (((wire91 || wire86[(4'hd):(3'h5)]) | {$signed($unsigned((wire1 ^~ (8'hb5))))}))
            begin
              reg95 <= $unsigned(wire4[(2'h3):(1'h1)]);
              reg96 <= $signed(wire0);
              reg97 <= $signed($signed((+$unsigned((wire0 <<< wire91)))));
              reg98 <= reg92[(2'h2):(1'h1)];
              reg99 <= (~^(~^($signed($unsigned(wire1)) ?
                  ((^~wire88) ? (!reg94) : (reg93 ? wire0 : reg97)) : reg97)));
            end
          else
            begin
              reg95 <= ($unsigned((~|($signed(wire88) ?
                      wire1 : (reg93 < reg96)))) ?
                  (8'hba) : reg99[(5'h10):(4'he)]);
            end
          reg100 <= reg97[(2'h3):(2'h2)];
        end
      else
        begin
          reg95 <= $signed((wire0[(4'hf):(1'h1)] || $signed({(~|wire3),
              {wire4}})));
          reg96 <= reg93;
        end
      reg101 <= reg95;
    end
  module102 #() modinst138 (.wire106(wire90), .clk(clk), .y(wire137), .wire103(wire89), .wire107(wire2), .wire104(reg96), .wire105(reg94));
  assign wire139 = (((!(wire137 ?
                               (wire3 ?
                                   (7'h41) : wire4) : reg99[(3'h4):(2'h2)])) ?
                           (!reg94) : (7'h42)) ?
                       (^~$unsigned($unsigned({(8'ha7),
                           reg101}))) : $unsigned(wire137[(1'h1):(1'h1)]));
  assign wire140 = ($signed($unsigned($unsigned((reg101 ?
                       (8'hae) : wire86)))) >> {(~&((wire4 >> wire1) ?
                           reg98[(3'h5):(3'h5)] : $unsigned((8'h9c)))),
                       (($unsigned(wire137) ? wire91 : $signed(wire90)) ?
                           reg99 : ((reg92 ?
                               (8'hbd) : wire0) << (reg94 <= (8'ha7))))});
  assign wire141 = wire91;
  assign wire142 = {$unsigned((8'ha1)), $unsigned(wire86[(5'h10):(1'h0)])};
  assign wire143 = $signed((((^~$signed(reg95)) ?
                           $unsigned({wire3, reg93}) : (+$unsigned(reg99))) ?
                       wire0[(3'h6):(1'h0)] : (|wire3)));
  assign wire144 = {$signed(($unsigned(wire91[(3'h5):(3'h5)]) ?
                           (^wire139[(5'h12):(1'h1)]) : $signed((wire141 ~^ wire86))))};
  assign wire145 = (|$unsigned($unsigned($signed($signed(reg101)))));
  assign wire146 = $signed($signed($unsigned(reg96[(4'h9):(3'h7)])));
  assign wire147 = (wire1[(2'h2):(1'h0)] >> {(~&(reg99[(5'h12):(5'h12)] <<< wire4[(3'h6):(3'h6)])),
                       $unsigned(($signed(reg92) < (^~wire0)))});
  assign wire148 = {wire144[(4'h8):(3'h4)]};
  assign wire149 = (+(~|(({wire139, wire137} ?
                       (wire88 ? (8'hae) : wire147) : {reg98}) >= wire145)));
  assign wire150 = wire86[(2'h3):(2'h3)];
  assign wire151 = (|$signed($unsigned(wire144[(3'h5):(1'h0)])));
  assign wire152 = ((((^{wire151, reg93}) ?
                               ((wire146 == wire150) || (wire2 ?
                                   reg101 : reg101)) : {(wire149 ?
                                       wire89 : wire142),
                                   wire144}) ?
                           {wire145[(3'h5):(3'h5)],
                               ((8'ha6) ?
                                   (reg100 >> (8'hac)) : (reg96 || wire142))} : $unsigned(($signed(wire3) ?
                               (wire148 ?
                                   wire148 : reg99) : $signed((7'h41))))) ?
                       wire137[(2'h3):(1'h1)] : (^~($signed(wire148) ?
                           (~^(wire144 ? wire150 : wire140)) : ({wire86} ?
                               $unsigned(wire149) : (wire3 ?
                                   wire143 : reg95)))));
endmodule

module module102  (y, clk, wire103, wire104, wire105, wire106, wire107);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire103;
  input wire signed [(2'h3):(1'h0)] wire104;
  input wire signed [(3'h7):(1'h0)] wire105;
  input wire signed [(3'h5):(1'h0)] wire106;
  input wire [(4'hf):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire134;
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  assign y = {wire136,
                 wire108,
                 wire109,
                 wire110,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire134,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 (1'h0)};
  assign wire108 = {wire104};
  assign wire109 = wire108;
  assign wire110 = (wire108[(4'hb):(1'h1)] == ((((^wire108) ^ $unsigned((8'hb2))) >= ((&wire104) ?
                       wire104[(1'h0):(1'h0)] : $unsigned(wire104))) ^~ wire104));
  always
    @(posedge clk) begin
      reg111 <= {$signed(wire110)};
      reg112 <= ((~&(((wire103 ? wire105 : wire106) | $unsigned(reg111)) ?
              ($unsigned(wire104) ~^ $signed(wire110)) : wire109[(1'h1):(1'h0)])) ?
          (8'hbc) : ($unsigned(wire108[(4'h8):(3'h5)]) ?
              wire103[(3'h6):(3'h5)] : (~|((^wire108) ?
                  $signed(wire105) : wire103[(3'h4):(1'h1)]))));
      reg113 <= $signed($unsigned((!{(reg112 == reg111),
          wire106[(3'h4):(2'h3)]})));
      reg114 <= ((~&wire105[(2'h2):(1'h0)]) ?
          $signed($signed((~|{wire107}))) : $signed(wire105));
    end
  assign wire115 = wire104;
  assign wire116 = (~&wire104[(1'h1):(1'h0)]);
  assign wire117 = ($unsigned($signed((^~(wire107 ^~ wire115)))) ?
                       reg111 : (+$signed(($signed(wire115) ?
                           $signed((8'had)) : reg111))));
  assign wire118 = reg114;
  assign wire119 = (^{reg111, reg112[(4'h9):(3'h7)]});
  assign wire120 = ($unsigned(wire118) <= wire119[(2'h3):(2'h2)]);
  module121 #() modinst135 (.clk(clk), .wire124(reg111), .wire123(wire116), .wire125(wire107), .y(wire134), .wire122(wire118));
  assign wire136 = wire134;
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire74;
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire77,
                 wire76,
                 wire13,
                 wire14,
                 wire15,
                 wire18,
                 wire74,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg17,
                 reg16,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= ((wire10[(1'h0):(1'h0)] >>> {(~&$unsigned(wire6)),
              (~^(wire9 && wire8))}) ?
          $signed($unsigned((~(+(8'hbf))))) : $signed(wire8[(1'h0):(1'h0)]));
      reg12 <= (reg11 | (($unsigned(wire7[(3'h7):(3'h6)]) <<< (wire10 + (wire7 <= wire7))) ?
          (wire8 >>> wire10) : $unsigned(wire10[(1'h0):(1'h0)])));
    end
  assign wire13 = ((~|(wire10[(1'h1):(1'h0)] + wire6[(3'h5):(1'h0)])) > wire8[(5'h11):(4'hd)]);
  assign wire14 = {(~(($signed(wire13) - (wire13 ?
                          (7'h43) : wire7)) && (((8'hae) ? wire7 : wire9) ?
                          (^~wire13) : $unsigned((8'hb7))))),
                      ((reg12 & $signed((7'h43))) >> wire8[(4'hc):(2'h3)])};
  assign wire15 = $signed(($signed($signed(wire9)) > $unsigned(($signed(wire8) && (wire8 ?
                      (8'ha1) : (8'hbb))))));
  always
    @(posedge clk) begin
      reg16 <= wire6[(3'h5):(2'h2)];
      reg17 <= reg16;
    end
  assign wire18 = $signed(((~^{$signed(wire6)}) * (~&((reg11 ?
                      wire8 : (8'ha7)) * {wire14}))));
  always
    @(posedge clk) begin
      if ($signed($signed($signed($unsigned(wire13)))))
        begin
          reg19 <= (wire8[(4'h8):(3'h5)] + $unsigned((!wire14[(4'hb):(2'h3)])));
          reg20 <= ((((wire6 | (reg17 ?
                      wire13 : (8'hbd))) <= wire6[(2'h3):(1'h0)]) ?
                  $signed(((~|reg11) ?
                      $unsigned(wire14) : $unsigned(wire9))) : $unsigned((^{reg12}))) ?
              $signed((~&wire15[(2'h3):(1'h1)])) : (reg11[(3'h4):(2'h3)] ?
                  $unsigned((reg19[(2'h2):(2'h2)] ?
                      $unsigned(wire14) : $signed(wire14))) : wire13[(1'h1):(1'h0)]));
          reg21 <= wire9[(3'h6):(2'h2)];
        end
      else
        begin
          reg19 <= $unsigned($unsigned({(wire8[(4'hb):(3'h6)] + $signed(reg21))}));
        end
      reg22 <= (wire7 == (8'hae));
    end
  always
    @(posedge clk) begin
      reg23 <= {reg19[(4'ha):(4'ha)], $unsigned({wire15[(1'h1):(1'h0)]})};
      if ((-(-$signed({(~|reg21), $signed((8'ha8))}))))
        begin
          reg24 <= wire13;
          if (wire14)
            begin
              reg25 <= wire15[(1'h0):(1'h0)];
            end
          else
            begin
              reg25 <= (~&((reg11[(3'h6):(3'h6)] ?
                  wire18[(1'h0):(1'h0)] : {(reg24 ?
                          reg12 : wire7)}) > ($unsigned(reg17) < (&(reg25 ?
                  (7'h44) : wire15)))));
            end
          if ($signed(($signed(({reg25, (8'had)} < {wire18})) ?
              wire18[(2'h2):(2'h2)] : wire6[(4'h8):(4'h8)])))
            begin
              reg26 <= wire15[(2'h2):(1'h0)];
              reg27 <= (~|(($unsigned(wire7) + reg19) != (^(((8'haa) <= reg16) ?
                  {reg22, reg16} : $unsigned((8'hb6))))));
              reg28 <= wire7[(4'hd):(3'h7)];
            end
          else
            begin
              reg26 <= (^({(^(7'h42)), reg21[(2'h3):(1'h1)]} ?
                  (~&($unsigned(reg23) <<< $unsigned(reg21))) : ($unsigned($signed(wire9)) ^~ $signed($signed(wire9)))));
              reg27 <= (wire14[(2'h2):(1'h1)] + (^((reg19[(2'h3):(1'h1)] << reg23[(1'h0):(1'h0)]) * wire13)));
            end
          reg29 <= {$unsigned((reg28[(4'hd):(4'hc)] ?
                  reg24[(3'h5):(2'h2)] : $unsigned((reg21 >= reg20)))),
              ((reg20[(1'h0):(1'h0)] <= wire10[(1'h0):(1'h0)]) ?
                  wire18 : ((|wire8[(4'h9):(3'h6)]) ?
                      $unsigned((wire15 ?
                          reg16 : (8'ha4))) : reg26[(4'hb):(1'h0)]))};
        end
      else
        begin
          reg24 <= wire15[(3'h5):(1'h1)];
          if (reg11)
            begin
              reg25 <= ({(8'hbb),
                  (|wire10[(2'h2):(2'h2)])} < wire13[(5'h11):(3'h5)]);
              reg26 <= $unsigned($signed(wire14));
              reg27 <= (^~{reg28, (reg24 ? wire14 : (+(~reg11)))});
              reg28 <= $unsigned((|$signed((8'h9e))));
            end
          else
            begin
              reg25 <= (!{wire15[(2'h3):(1'h0)]});
              reg26 <= (((((reg11 <= (8'hb8)) * (8'had)) == $unsigned((reg21 ?
                      reg27 : wire14))) != $signed(reg21[(3'h4):(2'h2)])) ?
                  reg20 : $unsigned(((~&(8'hbf)) - $unsigned({reg29}))));
              reg27 <= ($signed(reg19) + $unsigned((reg25 - reg12[(1'h0):(1'h0)])));
            end
          if ($signed((((7'h40) ? reg16 : $unsigned($unsigned((7'h44)))) ?
              {wire9[(4'hd):(4'h8)]} : (8'hb1))))
            begin
              reg29 <= $unsigned((^~wire13));
              reg30 <= $signed($unsigned($unsigned({reg17[(4'ha):(4'h8)],
                  (+wire13)})));
              reg31 <= $signed({reg12[(1'h0):(1'h0)], (!$signed(reg23))});
              reg32 <= (reg28 ?
                  ((+$signed((~^reg28))) ?
                      (^~((~^reg25) ~^ reg26[(3'h4):(2'h3)])) : $signed((|$unsigned((7'h40))))) : reg28);
              reg33 <= $signed((($unsigned((^reg23)) && $signed(wire13[(2'h3):(1'h1)])) ?
                  (!(~|(|reg21))) : wire8[(4'hc):(3'h6)]));
            end
          else
            begin
              reg29 <= $signed({$signed({(~|wire13)}), reg22[(2'h3):(1'h0)]});
              reg30 <= wire6[(3'h7):(2'h2)];
            end
          reg34 <= (+$signed(($unsigned(reg26[(5'h15):(4'ha)]) & (|wire13))));
        end
      reg35 <= (8'hb5);
    end
  module36 #() modinst75 (.wire37(reg35), .clk(clk), .wire40(reg23), .y(wire74), .wire39(reg16), .wire41(reg22), .wire38(wire14));
  assign wire76 = ($signed($unsigned(({(8'hb7)} ?
                      reg22 : $unsigned(reg31)))) <= $unsigned(reg31[(1'h0):(1'h0)]));
  assign wire77 = wire10[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg78 <= (((-reg35) ~^ $signed(((reg24 ? (7'h43) : reg30) ?
              $signed(reg27) : wire13))) ?
          $unsigned($unsigned(wire14)) : $unsigned(reg11[(2'h2):(2'h2)]));
      reg79 <= {wire10};
      reg80 <= $unsigned((!(($unsigned(reg31) != {reg78, reg30}) - ((wire14 ?
              wire10 : reg19) ?
          wire9[(4'h8):(1'h0)] : {reg19}))));
      reg81 <= (({((wire8 ? reg24 : wire15) && $unsigned(reg31)),
              ((wire15 ? wire6 : wire15) ? wire13 : (8'ha9))} ?
          $signed((+(wire14 ?
              (8'hb4) : reg24))) : reg27[(2'h3):(2'h2)]) == $unsigned(wire9[(4'hb):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg82 <= wire77[(3'h4):(1'h1)];
    end
  assign wire83 = ({{{(~&wire8)}, (~&$unsigned(wire15))}} > (reg23 ?
                      ($unsigned(wire9[(4'h9):(2'h2)]) - $signed((reg79 | reg28))) : reg27[(4'ha):(4'h8)]));
  assign wire84 = {(reg24[(4'h9):(2'h3)] ?
                          reg26 : $signed(((wire9 ? reg21 : reg28) ?
                              (reg26 ? (8'hb0) : reg35) : (8'hbb)))),
                      ((~wire74[(2'h2):(1'h0)]) | {(&reg19[(2'h3):(2'h2)])})};
  assign wire85 = reg78;
endmodule

module module36
#(parameter param72 = (((!(^~((8'h9f) & (8'h9d)))) >= (((^~(8'ha6)) - (!(8'hab))) ? ((^~(8'hb0)) | ((8'hb7) > (8'hb8))) : (+((7'h42) ~^ (8'hab))))) << ((!(&(8'h9d))) ? ((&{(8'hb2)}) ? (~&((8'had) != (8'ha8))) : (^~((8'ha7) ^ (8'hbc)))) : ((((8'ha8) ~^ (7'h44)) ? {(8'ha5), (8'hbb)} : (^~(8'hbd))) || (^~((8'hab) <= (8'hb7)))))), 
parameter param73 = param72)
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  input wire [(5'h11):(1'h0)] wire39;
  input wire [(5'h10):(1'h0)] wire38;
  input wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 reg66,
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
                 reg54,
                 reg48,
                 reg47,
                 reg45,
                 (1'h0)};
  assign wire42 = $signed($signed((~&((wire38 ? wire41 : wire40) ?
                      (wire37 >> wire40) : (wire41 && wire40)))));
  assign wire43 = ((7'h40) ? (!$unsigned(wire39)) : $unsigned((&wire41)));
  assign wire44 = (^($unsigned(((~^(8'hb4)) ? $signed(wire37) : wire40)) ?
                      {{wire42[(2'h2):(2'h2)], {wire39}},
                          wire40} : {$signed(wire43), {(wire37 - wire40)}}));
  always
    @(posedge clk) begin
      reg45 <= (|(~|((8'hb2) != $unsigned((wire38 ? wire37 : wire41)))));
    end
  assign wire46 = {((wire37[(3'h5):(1'h0)] ?
                          reg45 : (-(wire42 + wire43))) >>> (8'hb7))};
  always
    @(posedge clk) begin
      reg47 <= wire44[(1'h1):(1'h1)];
      reg48 <= wire39[(4'hc):(1'h0)];
    end
  assign wire49 = wire44[(1'h0):(1'h0)];
  assign wire50 = (~^((^(reg45[(1'h0):(1'h0)] ?
                      (|wire44) : $unsigned(wire42))) >>> ((!$signed(reg47)) ?
                      $unsigned({(8'ha4)}) : ((~(8'ha9)) << wire43))));
  assign wire51 = {wire43[(3'h5):(2'h3)],
                      (reg48 ?
                          wire46 : ((reg45[(2'h2):(1'h0)] ?
                              $signed((7'h40)) : (~^wire39)) + $signed(wire37[(3'h6):(3'h5)])))};
  assign wire52 = (wire43[(4'hb):(2'h2)] ? wire44 : wire46[(5'h10):(4'he)]);
  assign wire53 = ($unsigned(($signed(wire52) ?
                      (+$signed((8'hbf))) : ((~|reg45) ?
                          $signed((8'hb2)) : {(8'ha1),
                              wire49}))) | {(($unsigned(wire49) && wire37[(3'h5):(3'h4)]) || {wire42}),
                      (^~wire52)});
  always
    @(posedge clk) begin
      reg54 <= wire46;
    end
  always
    @(posedge clk) begin
      reg55 <= ({$unsigned(((wire43 ? wire38 : wire40) ?
                  $unsigned(wire39) : $signed(wire52)))} ?
          $signed({($unsigned(wire41) ?
                  (wire53 ? wire50 : wire50) : (wire42 && (8'hb4))),
              $signed((|wire42))}) : reg48[(4'ha):(3'h4)]);
      reg56 <= $signed(wire49[(5'h12):(4'hd)]);
      reg57 <= $signed((({(wire40 ? wire46 : reg55)} ?
              {(reg54 ? wire39 : (8'hab)),
                  (reg47 ? (8'hae) : (8'hbc))} : (wire40 ?
                  reg45[(3'h7):(3'h5)] : wire39)) ?
          (^~($signed(wire51) & (wire40 ?
              wire42 : wire51))) : $signed(wire53[(3'h4):(1'h1)])));
      if ($signed($unsigned(wire37[(3'h5):(3'h5)])))
        begin
          if ($signed((reg55 ?
              ((&wire49[(2'h3):(2'h3)]) ?
                  $unsigned(reg54[(1'h0):(1'h0)]) : (+((7'h42) ?
                      reg54 : reg57))) : ({{reg45}, $unsigned(reg55)} ?
                  reg56[(2'h2):(1'h1)] : $signed((~&reg57))))))
            begin
              reg58 <= $unsigned(reg57[(2'h2):(1'h1)]);
              reg59 <= wire46[(4'hd):(3'h4)];
              reg60 <= {$unsigned((~&(+$unsigned(reg48)))), reg47};
              reg61 <= $unsigned($unsigned(wire38[(4'hc):(2'h3)]));
            end
          else
            begin
              reg58 <= wire49[(4'hb):(4'ha)];
              reg59 <= $unsigned($unsigned((~|({reg45} ? reg57 : wire38))));
            end
          reg62 <= (((reg48 ? wire42 : reg47[(2'h3):(2'h3)]) + ((~^(-reg57)) ?
                  ($signed(reg60) ^~ (~|reg58)) : {$signed(reg58)})) ?
              wire53[(3'h7):(2'h3)] : {reg59});
          reg63 <= $unsigned($signed({$unsigned(wire53[(3'h4):(2'h3)]),
              (^~((8'had) - reg45))}));
          reg64 <= $signed({{(~&wire43)}, wire49});
          reg65 <= $unsigned($unsigned(wire50[(3'h6):(1'h1)]));
        end
      else
        begin
          reg58 <= (($unsigned(reg54[(2'h3):(2'h3)]) && (&((wire50 - (8'hb1)) ?
                  wire46 : (|wire49)))) ?
              wire44 : reg57[(1'h0):(1'h0)]);
          reg59 <= $signed({{$unsigned($unsigned(reg45)), $unsigned(reg45)},
              $signed($signed((wire37 ? reg62 : wire38)))});
          if (wire51[(5'h14):(4'ha)])
            begin
              reg60 <= (reg55[(4'hf):(3'h6)] ?
                  reg47[(1'h0):(1'h0)] : wire52[(1'h0):(1'h0)]);
              reg61 <= {$unsigned({((reg47 == wire52) != $unsigned((8'hb1))),
                      ((&(8'hb0)) ? (reg61 ? wire42 : wire50) : (~reg55))})};
            end
          else
            begin
              reg60 <= {$signed(({$unsigned(reg58), $unsigned(reg63)} ?
                      (~|(reg48 || wire46)) : (^wire39))),
                  reg61};
              reg61 <= $unsigned((reg61 && $unsigned((|(^~wire43)))));
              reg62 <= (reg48[(1'h0):(1'h0)] ?
                  reg58[(4'h8):(2'h2)] : ($signed(wire38) <<< ((~^(~wire38)) >= $unsigned({wire50,
                      wire43}))));
              reg63 <= ((($unsigned($signed(reg65)) ~^ (~^$unsigned(wire39))) ?
                      ((!$signed(wire49)) - wire43) : {wire41,
                          reg63[(3'h5):(2'h3)]}) ?
                  reg55[(3'h4):(3'h4)] : {wire53});
              reg64 <= $signed(((((-wire44) ?
                      (~&wire52) : (+(8'ha8))) <<< {$unsigned(reg63),
                      $unsigned(reg45)}) ?
                  (wire49 > (~^{reg58, reg55})) : reg56));
            end
          reg65 <= reg45;
          reg66 <= $unsigned(reg45[(3'h5):(3'h5)]);
        end
    end
  assign wire67 = (wire50 & (wire52[(1'h1):(1'h0)] + reg45[(3'h6):(1'h0)]));
  assign wire68 = wire52;
  assign wire69 = (~&reg47[(1'h1):(1'h1)]);
  assign wire70 = (~|$unsigned(reg58));
  assign wire71 = (($unsigned(reg59[(1'h0):(1'h0)]) ?
                      (wire39[(3'h6):(3'h4)] > $unsigned((wire49 ?
                          wire50 : wire39))) : (((wire52 ?
                          reg64 : wire53) & reg64[(4'hf):(1'h0)]) * reg65[(3'h6):(2'h3)])) * wire46);
endmodule

module module121
#(parameter param133 = ({((^~((8'hb5) & (7'h40))) < {((8'hb4) >= (8'ha8))})} & (((((8'h9e) ? (8'hb5) : (8'hbe)) ? (!(8'ha1)) : ((8'hba) ? (8'had) : (7'h41))) ? (((8'hb9) ? (8'h9d) : (8'h9c)) << ((8'haf) ? (8'hb1) : (7'h41))) : ({(8'hba), (8'hbe)} << ((8'hbb) ? (8'hb5) : (8'hbb)))) ? ((((8'hba) ? (8'hbd) : (8'hbf)) * ((8'ha4) <= (7'h40))) ? (8'hb5) : (((8'had) - (8'haa)) ? ((8'h9f) ? (8'haa) : (8'hab)) : (8'hb5))) : ((((8'ha3) ? (8'hb8) : (8'hb6)) ? (~&(8'ha6)) : ((8'hb3) ? (8'haf) : (8'hb7))) ? (|{(8'hbe)}) : ((8'hab) ? {(8'ha4), (8'ha9)} : ((8'haf) == (8'hb6)))))))
(y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire125;
  input wire [(4'hd):(1'h0)] wire124;
  input wire [(4'hc):(1'h0)] wire123;
  input wire [(5'h15):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire131;
  wire [(5'h10):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire127,
                 wire126,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire126 = ($unsigned(((~wire125[(1'h0):(1'h0)]) - $unsigned(wire125[(2'h2):(2'h2)]))) ?
                       (^~wire125) : wire122);
  assign wire127 = (-{(($signed(wire124) ? $signed(wire126) : wire122) ?
                           {wire124} : (8'ha8))});
  always
    @(posedge clk) begin
      reg128 <= $signed($unsigned((!$unsigned(wire125))));
      reg129 <= $signed({wire123[(2'h2):(1'h1)],
          (($unsigned((8'hb6)) ^ (wire123 ^~ wire123)) && (((8'h9e) ?
              wire127 : wire122) != (wire125 ? (7'h44) : reg128)))});
      reg130 <= wire126[(4'hd):(4'h8)];
    end
  assign wire131 = wire126;
  assign wire132 = ($unsigned({{(wire125 ? wire131 : reg129)}}) ?
                       ($signed((+wire127[(3'h4):(2'h3)])) ?
                           ($unsigned((reg128 >> wire124)) ?
                               reg128 : $unsigned((wire127 ?
                                   (8'hb7) : (8'haa)))) : $unsigned((^((8'hb6) == wire126)))) : (~wire122));
endmodule
