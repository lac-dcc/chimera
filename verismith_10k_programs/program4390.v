module top
#(parameter param113 = ((~^(!(+((7'h44) < (7'h42))))) ? {((((8'ha5) ? (7'h42) : (8'hb1)) ? (~(8'ha2)) : (~^(8'hbd))) - ({(8'hb0), (8'hbd)} >> ((8'hbf) ? (7'h41) : (8'hab))))} : (|{{((8'ha1) ? (8'hb1) : (8'hb0))}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire98,
                 wire96,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = (wire3[(3'h4):(2'h2)] + wire2);
  assign wire6 = ((~|((|(wire2 ? wire3 : wire4)) && wire2)) && (+(8'hba)));
  assign wire7 = $unsigned(($unsigned(wire2) ?
                     wire1 : $signed((wire1[(1'h0):(1'h0)] ?
                         (~&wire2) : (wire4 ? wire4 : wire6)))));
  assign wire8 = {wire6, wire6[(1'h1):(1'h1)]};
  assign wire9 = (wire1[(2'h2):(1'h0)] ?
                     wire1 : (wire1 | (-{wire4[(4'h8):(3'h6)],
                         (wire3 ? wire1 : wire1)})));
  assign wire10 = $signed($signed($unsigned(($unsigned(wire0) ?
                      (wire8 ? wire5 : wire1) : wire7))));
  always
    @(posedge clk) begin
      reg11 <= $signed((7'h44));
      reg12 <= (~&(~|(({wire9} - $unsigned(wire2)) <<< $signed({wire0}))));
      reg13 <= ($signed((~|{(wire8 && (8'hb1)), (wire1 & wire4)})) ?
          wire2[(5'h12):(3'h5)] : (|(~^((+reg11) ?
              reg11 : (wire1 ? wire9 : (8'hb9))))));
    end
  module14 #() modinst52 (.y(wire51), .wire17(wire3), .wire16(wire1), .wire18(wire6), .clk(clk), .wire15(wire0));
  assign wire53 = wire10[(5'h11):(1'h1)];
  assign wire54 = (~^$unsigned((($unsigned(wire53) & (~&reg11)) != (|((8'haf) - wire51)))));
  assign wire55 = wire5[(2'h3):(1'h0)];
  assign wire56 = {(({(reg11 ? wire51 : wire10)} ?
                              ((wire9 == wire3) ?
                                  (wire55 ? wire9 : wire6) : wire6) : ((wire8 ?
                                  wire1 : wire1) == wire55)) ?
                          $unsigned(($signed(reg11) - (wire7 == reg13))) : wire2),
                      {$signed(reg12[(4'h8):(2'h3)])}};
  assign wire57 = wire7;
  assign wire58 = $signed(wire56[(3'h4):(1'h1)]);
  assign wire59 = ($unsigned($unsigned($signed(wire9[(3'h5):(3'h5)]))) != reg11[(3'h7):(1'h0)]);
  module60 #() modinst97 (wire96, clk, wire5, wire2, wire3, wire55);
  assign wire98 = ($signed((-$signed((wire59 ?
                      (8'hab) : wire57)))) << (!({wire9,
                      {wire10, wire56}} < (~|$signed(wire59)))));
  always
    @(posedge clk) begin
      if (({$signed($signed($unsigned(wire7)))} ?
          $signed($unsigned((wire0[(4'he):(2'h3)] ?
              $signed(wire55) : (wire0 >>> wire7)))) : ($signed(wire98) ^ (-$signed(wire6)))))
        begin
          if ((~|wire98[(1'h1):(1'h1)]))
            begin
              reg99 <= reg12[(3'h7):(1'h0)];
              reg100 <= $unsigned($unsigned(wire0[(4'hd):(2'h2)]));
              reg101 <= {(8'ha0),
                  (wire9 & (~^((reg13 ? (8'hb8) : wire4) & $signed(wire0))))};
              reg102 <= $signed($signed(wire7));
              reg103 <= $unsigned(reg12);
            end
          else
            begin
              reg99 <= (wire56[(1'h1):(1'h1)] ?
                  (~|wire8) : $signed($signed(wire57)));
            end
          reg104 <= (reg101[(4'hb):(2'h3)] ?
              (($signed($unsigned(wire56)) ?
                  (|(wire56 ?
                      wire8 : reg102)) : wire56) << wire51[(3'h7):(3'h5)]) : reg12);
        end
      else
        begin
          reg99 <= wire0[(1'h1):(1'h1)];
          reg100 <= ($signed($unsigned((~&$signed(reg100)))) < $signed(reg102[(4'ha):(4'h8)]));
          reg101 <= wire8;
          reg102 <= reg104[(4'hd):(4'ha)];
        end
      if ((((|wire57) >>> reg12[(2'h2):(1'h0)]) ?
          ((((wire1 < reg101) > (wire7 ? wire56 : (8'ha7))) ?
              $unsigned((wire55 < wire53)) : reg102) <<< (wire96[(3'h4):(2'h2)] ^~ reg104[(3'h6):(3'h5)])) : (wire56[(4'hd):(2'h3)] ?
              (~&wire3) : ({(~wire7),
                  (wire0 ? (8'hbf) : reg104)} == $unsigned((8'hb8))))))
        begin
          reg105 <= (~^$unsigned((reg100 ? (8'h9d) : $signed($signed(wire4)))));
        end
      else
        begin
          if (($signed(wire53[(4'ha):(4'ha)]) ?
              (^~(!wire2[(5'h14):(5'h10)])) : (~^wire2[(4'h8):(1'h0)])))
            begin
              reg105 <= (~|($signed((reg103 ?
                      (wire58 ^~ reg12) : $unsigned(wire2))) ?
                  (+wire10[(3'h5):(2'h3)]) : (8'ha0)));
              reg106 <= ((wire8[(1'h0):(1'h0)] ?
                      $unsigned(({(8'hb7), wire4} ^ (reg99 ?
                          reg11 : (8'hb9)))) : $signed((8'h9c))) ?
                  ((wire96[(1'h1):(1'h0)] ?
                          $signed($unsigned(wire53)) : (~wire2[(2'h2):(1'h1)])) ?
                      ($signed({wire57}) * $signed($signed(wire5))) : {$signed($signed(wire56)),
                          (wire98 ?
                              (+wire59) : wire96[(2'h3):(2'h2)])}) : {$signed($unsigned(wire10)),
                      ((-((8'ha7) ? wire8 : (8'hbf))) ?
                          ((wire4 ?
                              wire55 : (8'hae)) || $signed(wire98)) : {$signed(wire59)})});
            end
          else
            begin
              reg105 <= {(^$signed((wire3 | {reg100})))};
              reg106 <= $unsigned(reg103[(3'h5):(1'h0)]);
            end
        end
      reg107 <= $signed((!wire9[(3'h4):(1'h0)]));
    end
  assign wire108 = ({$signed(($unsigned((8'ha0)) ? reg107 : reg106))} ?
                       (wire5[(5'h15):(1'h1)] >= (~(wire51[(1'h1):(1'h0)] ~^ (!wire98)))) : $signed($unsigned((wire2 << (wire7 >>> wire96)))));
  assign wire109 = $unsigned(wire51[(2'h2):(2'h2)]);
  assign wire110 = wire109;
  module14 #() modinst112 (wire111, clk, wire7, wire55, wire57, wire8);
endmodule

module module60
#(parameter param95 = ((~&{(!{(7'h44)}), {(8'hbe), (&(8'ha9))}}) != (((-((7'h44) ? (8'ha2) : (8'ha9))) ? (((8'hab) ? (8'hb1) : (8'hbe)) | ((7'h44) ? (8'ha0) : (8'hb8))) : ({(7'h44), (8'hae)} >> ((8'hb3) ? (8'had) : (8'hb4)))) ? (|((~|(8'hb8)) - ((8'hab) <<< (8'h9e)))) : (|(((7'h43) ? (8'hbd) : (8'hac)) >> {(8'h9e)})))))
(y, clk, wire61, wire62, wire63, wire64);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire61;
  input wire signed [(4'hf):(1'h0)] wire62;
  input wire signed [(5'h11):(1'h0)] wire63;
  input wire [(5'h11):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire93;
  assign y = {wire65, wire78, wire80, wire93, (1'h0)};
  assign wire65 = wire61;
  module66 #() modinst79 (wire78, clk, wire61, wire64, wire62, wire63);
  assign wire80 = (8'hb8);
  module81 #() modinst94 (.wire83(wire62), .wire86(wire64), .wire85(wire78), .wire84(wire65), .clk(clk), .wire82(wire80), .y(wire93));
endmodule

module module14
#(parameter param50 = ((~{(((7'h41) ? (7'h43) : (8'h9d)) ? (~(7'h44)) : {(8'h9d), (8'hb2)})}) <= (^{{((8'haa) ? (8'ha5) : (8'ha9)), ((8'ha0) && (8'hbf))}})))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire43;
  assign y = {wire49, wire48, wire47, wire46, wire45, wire43, (1'h0)};
  module19 #() modinst44 (.y(wire43), .wire22(wire16), .wire21(wire18), .clk(clk), .wire20(wire17), .wire23(wire15));
  assign wire45 = (&($unsigned($unsigned((wire15 & wire18))) ?
                      wire17[(4'ha):(3'h7)] : (wire17 ?
                          {wire16, wire15} : {{wire18}})));
  assign wire46 = $signed({$unsigned($signed((wire45 & wire18)))});
  assign wire47 = wire15[(4'h8):(3'h6)];
  assign wire48 = (($unsigned(wire45) <<< (wire15[(2'h3):(2'h3)] <= $signed((wire17 << wire43)))) ?
                      wire47 : {(($unsigned(wire43) <<< (8'hba)) ?
                              (&$signed((8'ha8))) : $unsigned(wire45[(4'he):(2'h3)]))});
  assign wire49 = wire15;
endmodule

module module19
#(parameter param41 = ((((((8'haa) ? (8'hae) : (7'h41)) >> ((8'hb4) <<< (8'hab))) + (8'hb0)) ? ((^(8'ha5)) ^ {(8'hbd), ((7'h41) ? (8'hbd) : (8'had))}) : (((8'hbb) ? (|(8'ha4)) : ((8'hb2) >>> (8'hac))) ? {((8'hb7) ? (7'h42) : (8'h9c)), (~|(8'ha3))} : (|{(7'h43)}))) ? ((((!(8'hb2)) >> {(8'hb2)}) <<< (!{(8'hac), (7'h43)})) < ((8'hb4) ^~ ((|(8'hb2)) ? ((8'hb6) != (8'hb2)) : ((8'hab) ~^ (8'hbc))))) : (((((7'h43) >= (8'hba)) ? ((8'ha2) ? (8'hae) : (8'hb0)) : (^(8'hb2))) & (((8'hb1) << (8'hb5)) >>> {(8'hb5), (8'hb8)})) >> ({((8'hbb) ? (8'ha8) : (8'ha0))} ? (((7'h44) ? (8'h9d) : (8'hb8)) ? (|(8'hbe)) : ((8'hb9) ? (8'ha4) : (8'hb0))) : (^~((8'h9f) ? (8'hab) : (8'h9c)))))), 
parameter param42 = param41)
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire23;
  input wire signed [(4'h9):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire24 = (~|(wire22 ?
                      {wire23[(1'h1):(1'h1)],
                          wire21} : ((wire22 == (wire23 + wire20)) << wire23[(3'h6):(2'h2)])));
  assign wire25 = (~&(+($signed(wire23) - (wire20 <<< wire21))));
  assign wire26 = {$signed(wire20[(3'h4):(3'h4)]), (-wire22[(2'h2):(1'h0)])};
  assign wire27 = (~(~|{wire20}));
  always
    @(posedge clk) begin
      if (wire22)
        begin
          reg28 <= wire24;
          reg29 <= wire20;
          reg30 <= $unsigned((({wire24, (+reg29)} >> {(reg28 ?
                      reg28 : wire24)}) ?
              (({wire27, reg29} || wire23) || wire27) : ($signed((wire22 ?
                      wire24 : wire20)) ?
                  ((reg28 ~^ wire25) ? (~wire27) : wire24) : (~^{wire23}))));
        end
      else
        begin
          reg28 <= (wire23[(3'h5):(3'h5)] >> reg30);
          reg29 <= wire21;
          reg30 <= wire22;
          reg31 <= (!$unsigned((|(~&$unsigned(wire27)))));
          reg32 <= (^$signed($signed(($unsigned(wire23) ?
              $unsigned(wire22) : $unsigned(wire22)))));
        end
      if ($signed((^~({(wire23 <<< wire24)} << ({reg29} ^~ wire27[(2'h2):(2'h2)])))))
        begin
          reg33 <= (((+($signed((8'ha7)) ? reg30 : (&(8'haa)))) ?
              {reg30[(3'h6):(3'h5)]} : (~^reg31)) == {reg32,
              (~&$signed(((8'ha7) ? reg28 : reg28)))});
          reg34 <= $unsigned(($signed($unsigned($signed(reg30))) ^~ wire27[(4'hd):(4'ha)]));
        end
      else
        begin
          reg33 <= (!($signed({{wire20}}) ?
              $signed($signed((wire22 ?
                  wire26 : wire20))) : $signed($signed($unsigned(reg31)))));
          reg34 <= $signed((wire23 ?
              wire24 : $unsigned((wire26 ? (^~wire26) : reg30))));
        end
    end
  assign wire35 = reg33[(3'h5):(1'h1)];
  assign wire36 = (~$unsigned($signed($signed(reg29[(1'h1):(1'h1)]))));
  assign wire37 = (wire21[(2'h3):(2'h2)] <= (($unsigned(reg33) ?
                      (((8'hb2) ? (8'hbf) : reg33) ?
                          $unsigned(wire35) : (reg28 << wire20)) : $signed(((8'ha8) ^~ wire22))) - ((8'hb5) ^~ $signed(wire36[(2'h2):(1'h0)]))));
  assign wire38 = wire22[(2'h2):(1'h1)];
  assign wire39 = $unsigned(wire24);
  assign wire40 = $unsigned((reg29[(1'h1):(1'h0)] ?
                      (({reg29} >= (wire35 ? wire38 : wire22)) == {(&(8'ha8)),
                          (reg34 >> reg32)}) : ($signed($unsigned((7'h40))) ?
                          (8'h9d) : (((8'hb1) ?
                              (8'hb1) : wire25) * $unsigned(wire27)))));
endmodule

module module81
#(parameter param92 = (((~|{((8'had) ? (8'hbb) : (8'hbc)), ((7'h41) <<< (8'hb9))}) ? (~|(((7'h40) ? (7'h43) : (8'h9f)) ? (|(8'hba)) : (!(8'hbc)))) : (~|(&((8'ha6) * (7'h44))))) ? {({(|(8'hab))} ? {{(7'h40), (7'h40)}, ((8'ha7) ? (7'h40) : (8'ha8))} : ((!(7'h44)) >> ((7'h44) > (7'h40))))} : ((~|(^(^~(8'h9c)))) == {((8'hbb) ? ((8'h9e) ~^ (8'hab)) : (-(8'hb4)))})))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire86;
  input wire signed [(4'h9):(1'h0)] wire85;
  input wire [(3'h6):(1'h0)] wire84;
  input wire signed [(4'ha):(1'h0)] wire83;
  input wire signed [(4'he):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire87;
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  assign y = {wire88, wire87, reg91, reg90, reg89, (1'h0)};
  assign wire87 = $unsigned($signed(wire86));
  assign wire88 = {(wire87 ?
                          $signed(wire82[(4'h8):(3'h5)]) : (wire84[(1'h0):(1'h0)] * wire85)),
                      wire87};
  always
    @(posedge clk) begin
      reg89 <= {(wire82[(4'hb):(1'h1)] <= wire87[(2'h3):(2'h3)])};
    end
  always
    @(posedge clk) begin
      reg90 <= (8'h9f);
      reg91 <= (~|{($signed((8'ha9)) ?
              (((8'ha4) ? wire84 : reg90) ?
                  reg90 : (~^(7'h43))) : (!$unsigned(wire86)))});
    end
endmodule

module module66
#(parameter param77 = ((^~(8'hbf)) > (((((8'hb3) ? (8'hb4) : (8'hbe)) ? ((7'h42) == (8'hbd)) : ((8'haf) ? (8'had) : (8'hb2))) ? (((8'hbd) >>> (8'hb7)) >> (-(7'h42))) : (~^((8'hbc) ? (7'h40) : (8'had)))) <<< (((|(7'h43)) ^~ ((8'hb8) ? (8'ha2) : (8'hbc))) ? ((~^(8'ha2)) ? {(8'hb9), (8'ha6)} : {(7'h43), (8'ha0)}) : (((8'hab) >= (8'hb6)) >>> {(8'h9d)})))))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire70;
  input wire [(5'h11):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  input wire signed [(3'h5):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  assign y = {wire76, wire74, wire73, wire72, wire71, reg75, (1'h0)};
  assign wire71 = ((&$unsigned(wire68[(4'h8):(2'h3)])) ?
                      (((wire70[(4'hf):(4'hf)] * wire69[(5'h11):(5'h11)]) ?
                          wire67[(3'h4):(2'h2)] : $signed($signed(wire70))) << {$unsigned($signed(wire69)),
                          (wire69 ?
                              wire70[(5'h10):(3'h7)] : $signed((8'hb8)))}) : $unsigned($signed((-(|wire69)))));
  assign wire72 = $signed(wire68);
  assign wire73 = (wire67 ?
                      ($signed($unsigned((wire72 < wire72))) ?
                          (((wire67 ^ (8'hbf)) ?
                              (~&wire70) : $signed(wire67)) ^~ wire71) : $signed(((wire69 <= wire72) >= wire69[(3'h4):(1'h0)]))) : $unsigned((-($unsigned(wire71) ?
                          $unsigned(wire67) : ((8'h9d) != wire67)))));
  assign wire74 = ((wire68[(4'he):(4'he)] ?
                      (((+wire70) ? (-(8'hbd)) : (-(8'ha5))) ?
                          $unsigned($unsigned(wire73)) : wire71) : $unsigned(wire73[(4'hf):(4'h9)])) || (wire69[(4'hc):(3'h6)] ?
                      wire67[(1'h1):(1'h0)] : wire73[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg75 <= ((!((~$unsigned(wire74)) <<< $unsigned({wire67, (7'h44)}))) ?
          ((wire68 <= $unsigned((wire70 ?
              wire73 : wire72))) ^ ((wire72[(3'h6):(1'h0)] ?
                  (wire70 | wire69) : (wire73 ? wire73 : wire73)) ?
              (~^(^wire71)) : $unsigned({wire69,
                  wire67}))) : $unsigned($unsigned($signed((wire74 ?
              wire72 : wire67)))));
    end
  assign wire76 = {$unsigned($unsigned(({reg75, wire72} & (~|wire72))))};
endmodule
