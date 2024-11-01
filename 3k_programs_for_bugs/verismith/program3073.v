module top
#(parameter param139 = (8'hae))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire136;
  assign y = {wire138,
                 wire5,
                 wire22,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire136,
                 (1'h0)};
  assign wire5 = {(wire4 ?
                         wire3[(1'h0):(1'h0)] : $signed({wire2[(4'hb):(3'h7)],
                             wire1}))};
  module6 #() modinst23 (wire22, clk, wire0, wire3, wire2, wire5);
  assign wire24 = $signed((|(($signed(wire4) >= wire1) ?
                      (~|(wire2 ? wire4 : wire3)) : $signed((~wire1)))));
  assign wire25 = ((wire5 <= (8'hb0)) ^~ wire22[(1'h1):(1'h0)]);
  assign wire26 = (($unsigned(((8'haf) ?
                      (8'ha5) : (wire1 ?
                          wire4 : wire5))) >> wire22[(3'h6):(3'h5)]) <<< (^$unsigned((!$signed(wire22)))));
  assign wire27 = $unsigned($signed($signed(wire22)));
  assign wire28 = wire24[(4'hb):(1'h1)];
  assign wire29 = {(8'hb8),
                      (($unsigned((|(8'hb6))) >= ((8'hb1) & wire5)) != (~^$signed($signed(wire25))))};
  assign wire30 = (^$signed((wire0[(4'hf):(4'h9)] <<< wire3)));
  assign wire31 = {$unsigned((wire25[(2'h3):(1'h0)] ?
                          $unsigned(wire0) : wire3[(1'h1):(1'h1)]))};
  module32 #() modinst137 (wire136, clk, wire31, wire4, wire3, wire25, wire2);
  assign wire138 = wire25[(4'he):(4'ha)];
endmodule

module module32
#(parameter param135 = ({((((8'hb0) && (8'haa)) + (!(8'ha6))) ? ({(8'ha7), (8'ha6)} ? ((8'hb2) > (8'had)) : ((8'ha8) * (8'hb4))) : (((7'h42) * (8'ha1)) ? ((8'hba) ? (8'h9d) : (8'hbc)) : (|(8'hb6))))} ? (~(!(((8'hb7) ? (8'ha0) : (8'h9d)) <<< ((8'ha8) ? (8'ha6) : (8'haf))))) : {(^(~&{(8'hbf), (8'h9d)}))}))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire signed [(4'hd):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire131;
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire88,
                 wire51,
                 wire50,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire38,
                 wire131,
                 reg39,
                 reg40,
                 reg41,
                 reg45,
                 reg46,
                 reg48,
                 reg49,
                 (1'h0)};
  assign wire38 = {wire37};
  always
    @(posedge clk) begin
      reg39 <= wire36;
      reg40 <= wire38;
      reg41 <= wire37;
    end
  assign wire42 = (~^$unsigned($signed(({wire37, reg39} ?
                      (!reg41) : $signed((8'ha9))))));
  assign wire43 = ((reg41[(3'h5):(2'h2)] ?
                      wire42[(2'h2):(1'h0)] : wire34) * wire37);
  assign wire44 = (&$signed(($signed({(7'h44)}) || (wire37 & (^reg39)))));
  always
    @(posedge clk) begin
      reg45 <= (8'ha2);
      reg46 <= {((^~($unsigned(wire42) ? $signed(wire34) : (wire42 << reg40))) ?
              wire37[(1'h1):(1'h1)] : reg39)};
    end
  assign wire47 = (|(~^$signed((+(reg45 ~^ reg39)))));
  always
    @(posedge clk) begin
      reg48 <= {wire36[(3'h7):(3'h5)]};
      reg49 <= $signed((&reg39[(3'h4):(1'h1)]));
    end
  assign wire50 = $signed(wire37);
  assign wire51 = ($signed($signed(wire36[(3'h7):(3'h5)])) == {($signed(((8'hb8) != wire43)) ^~ (&$unsigned(wire42)))});
  module52 #() modinst89 (wire88, clk, wire33, reg41, wire36, wire51);
  module90 #() modinst132 (.y(wire131), .wire91(wire37), .wire94(wire51), .clk(clk), .wire92(wire43), .wire93(wire35), .wire95(wire33));
  assign wire133 = (wire88 ?
                       $signed($signed((&(~^wire34)))) : wire34[(4'hf):(4'he)]);
  assign wire134 = ({$unsigned((^~(wire38 ?
                           wire88 : (7'h41))))} + ($unsigned($unsigned(wire38[(1'h0):(1'h0)])) ?
                       ($unsigned($unsigned(wire43)) ?
                           wire50 : $signed($unsigned(reg48))) : (~(-(wire88 == reg41)))));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire12;
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire12,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (wire9 || $unsigned($unsigned(wire10[(5'h10):(4'hd)])));
    end
  assign wire12 = $signed((wire9 <= wire8));
  always
    @(posedge clk) begin
      if (((wire12[(4'he):(4'hd)] | ($unsigned({wire7}) ?
              ((+wire9) <= wire12) : $unsigned((wire8 * reg11)))) ?
          wire9[(3'h4):(3'h4)] : wire7[(4'h9):(3'h6)]))
        begin
          reg13 <= wire9[(3'h4):(1'h0)];
        end
      else
        begin
          reg13 <= wire9[(2'h3):(1'h0)];
          if ((^~$unsigned($signed($unsigned(((8'h9f) == wire9))))))
            begin
              reg14 <= $signed((7'h40));
            end
          else
            begin
              reg14 <= wire9[(1'h1):(1'h0)];
            end
          if ($signed((({$unsigned(reg14), (reg13 < wire10)} ?
              ($unsigned(reg13) ?
                  {reg11} : (wire7 - wire12)) : ($unsigned(reg11) ^~ (~&wire10))) || $signed(reg11[(2'h3):(2'h3)]))))
            begin
              reg15 <= (reg13[(3'h7):(2'h2)] ? reg13[(3'h6):(2'h3)] : wire7);
              reg16 <= (!reg11);
              reg17 <= ($signed(wire12) ^~ (~|((|reg13) ?
                  $signed($signed(reg11)) : ((wire7 << wire10) ?
                      wire10[(4'hd):(4'ha)] : (-wire9)))));
              reg18 <= ((~|(&wire9[(1'h0):(1'h0)])) >> $unsigned(reg14));
            end
          else
            begin
              reg15 <= $signed(reg13);
              reg16 <= wire9[(2'h3):(2'h3)];
            end
        end
      reg19 <= wire8;
      reg20 <= {{$signed((reg18 ? reg11[(1'h1):(1'h1)] : (8'hbc))),
              (!$signed($unsigned(reg13)))},
          (8'hb9)};
    end
  always
    @(posedge clk) begin
      reg21 <= $signed(wire12);
    end
endmodule

module module90
#(parameter param130 = ((^~{{((8'ha4) ? (8'h9d) : (8'h9f))}}) ? ((8'hb6) ? (((7'h40) ? {(7'h40)} : {(8'ha9)}) == (((8'hb1) - (8'h9f)) ? ((8'ha8) ^~ (8'hb0)) : (^(8'hbf)))) : (^(8'hba))) : ((~(((8'hba) >= (7'h40)) | (8'ha2))) ? {(8'hb5)} : {(|((8'hb1) & (8'h9f)))})))
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire95;
  input wire signed [(3'h5):(1'h0)] wire94;
  input wire [(4'he):(1'h0)] wire93;
  input wire signed [(4'he):(1'h0)] wire92;
  input wire [(3'h7):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire [(4'ha):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire96;
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire98,
                 wire97,
                 wire96,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire96 = wire92;
  assign wire97 = $unsigned($unsigned(wire93[(4'hc):(4'hc)]));
  assign wire98 = wire97[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg99 <= $signed(wire98[(4'h9):(1'h1)]);
      if (($unsigned($unsigned((~|$signed(wire91)))) | (($signed(wire92[(4'h9):(3'h5)]) >= reg99) ?
          {wire98[(3'h5):(2'h3)]} : wire92[(1'h1):(1'h1)])))
        begin
          reg100 <= wire94;
          reg101 <= $unsigned(wire91[(2'h2):(1'h1)]);
          reg102 <= (wire93[(4'he):(3'h7)] <= $unsigned($unsigned({((8'ha6) <<< wire97),
              (~wire95)})));
          if ((|{(!$unsigned($unsigned(wire91)))}))
            begin
              reg103 <= wire93[(4'he):(1'h0)];
              reg104 <= $signed(wire98[(4'h8):(3'h5)]);
            end
          else
            begin
              reg103 <= (wire94 < reg99);
              reg104 <= $unsigned((reg103 ? reg99 : wire92[(4'hc):(1'h0)]));
              reg105 <= (|wire91);
            end
          if (reg105)
            begin
              reg106 <= ((&wire98[(3'h5):(2'h2)]) || (-(reg101 ?
                  (((8'ha8) < reg104) + ((7'h40) ?
                      wire98 : reg103)) : wire91)));
              reg107 <= (-(((!$unsigned(wire96)) >= (~|(wire94 && (8'ha6)))) * (|$signed(wire95[(2'h2):(2'h2)]))));
              reg108 <= $unsigned((~|(|(reg103[(5'h10):(4'hf)] << wire96[(4'hf):(3'h7)]))));
              reg109 <= $signed(wire92);
              reg110 <= ($unsigned($unsigned(reg103)) | (wire91 & ($unsigned(reg101[(1'h1):(1'h1)]) || ((8'hb1) ?
                  $signed(reg105) : reg102[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg106 <= ((~&reg102) ?
                  (({reg99[(1'h0):(1'h0)]} > (wire92[(2'h3):(2'h2)] * $unsigned(reg100))) ?
                      $unsigned(reg100) : {$unsigned($unsigned(reg100))}) : ((+$signed((^reg106))) ?
                      reg105 : (reg104 >>> (wire96 != (reg105 ?
                          wire94 : wire91)))));
              reg107 <= $signed((((~|{reg108}) + wire94) ?
                  $signed($unsigned((wire95 ?
                      wire93 : reg103))) : $signed(wire91)));
              reg108 <= $signed($signed((+((~|reg101) || reg99[(4'ha):(1'h0)]))));
            end
        end
      else
        begin
          reg100 <= (^~$signed({$signed(reg100),
              (((8'hbf) || wire96) >> reg106[(4'hb):(4'ha)])}));
          reg101 <= (($unsigned(reg100[(1'h0):(1'h0)]) && ($signed($signed((8'ha6))) <<< $unsigned({wire93,
              wire92}))) << reg101[(1'h1):(1'h1)]);
          reg102 <= (reg103 ?
              {$unsigned($signed($unsigned(reg102))),
                  $signed({$signed(reg101),
                      (reg101 ?
                          wire92 : reg110)})} : (((|$unsigned(reg104)) ~^ ($signed(wire96) >>> wire98)) <<< $signed($unsigned((reg108 ?
                  reg109 : reg110)))));
          if ($unsigned((wire96 + (($signed(reg104) ?
              (!reg99) : $signed(reg99)) <= $signed($signed(reg102))))))
            begin
              reg103 <= {wire91,
                  (~&(({wire94, wire97} ? (7'h40) : $unsigned(wire91)) ?
                      ($signed(wire96) ?
                          $unsigned(reg99) : (~&reg105)) : $unsigned($signed(reg108))))};
              reg104 <= $unsigned(wire92[(4'he):(2'h3)]);
              reg105 <= reg103;
              reg106 <= ($signed($signed(reg109)) ?
                  reg104[(3'h7):(2'h2)] : ((reg108 >> (reg99[(3'h4):(2'h3)] || $unsigned(reg109))) ?
                      ($signed({reg107}) ?
                          ((wire98 ? reg108 : reg100) >= (^wire96)) : {(8'hab),
                              $signed(reg99)}) : (~(reg99[(3'h6):(2'h2)] ?
                          (^~wire96) : $unsigned(wire95)))));
              reg107 <= ({reg109, (&(8'hb5))} ?
                  ((reg102[(2'h2):(1'h1)] + $signed(wire95)) * (reg108 ?
                      $unsigned($unsigned(reg106)) : {(wire91 && reg107)})) : {$signed(((reg99 ?
                          reg106 : reg105) < (wire91 ? reg101 : reg106))),
                      (reg102 ?
                          ((!wire96) >> (reg110 && wire94)) : (((8'hbc) ?
                              wire97 : (8'haa)) ^ (8'hb9)))});
            end
          else
            begin
              reg103 <= (((7'h43) && ({(reg106 || reg107), wire98} ?
                      (8'ha2) : ((wire93 ^ reg100) ?
                          wire96[(3'h4):(3'h4)] : ((8'h9c) ^ reg100)))) ?
                  ((^~(^~(reg108 >>> reg103))) ?
                      reg103 : ((~|(reg101 ?
                          wire92 : reg110)) >>> reg107)) : (8'hae));
              reg104 <= reg99;
              reg105 <= (^~$signed($signed(($signed(reg102) << {reg102}))));
            end
        end
      reg111 <= $signed(((($signed(wire91) ? (+reg100) : $signed(reg102)) ?
          $unsigned((8'hba)) : reg101) < reg105));
      if ($unsigned(reg105[(3'h6):(3'h6)]))
        begin
          reg112 <= wire93;
          reg113 <= $signed($signed(($signed(wire96[(3'h6):(3'h5)]) ~^ reg100[(1'h1):(1'h0)])));
          reg114 <= $signed(($unsigned(({reg100, reg109} >= $signed(reg100))) ?
              ({(!reg101),
                  $signed(wire97)} >>> reg112) : {$signed((reg107 - reg108)),
                  $signed($signed(reg111))}));
          reg115 <= (($unsigned($signed(((8'ha5) | reg106))) ?
                  (^~$signed(reg110)) : $unsigned($unsigned($unsigned(reg101)))) ?
              ((+wire93[(4'h8):(3'h6)]) != $unsigned(reg106[(5'h12):(4'hd)])) : {reg110});
          if ($unsigned((|(^~(~|{reg111})))))
            begin
              reg116 <= ((-$unsigned((!reg107[(3'h4):(2'h2)]))) ?
                  $unsigned({$unsigned((reg99 ?
                          reg108 : wire96))}) : $signed(((8'ha3) ?
                      reg101 : $signed((~&reg104)))));
              reg117 <= {$signed(reg112[(3'h4):(3'h4)])};
              reg118 <= $signed(reg105);
              reg119 <= (^~{$unsigned((^~reg107))});
              reg120 <= (wire91[(3'h6):(3'h4)] + $signed(($signed(wire93[(4'ha):(4'h9)]) ?
                  ($unsigned(reg115) == (~&reg115)) : $unsigned(((8'had) ^ reg110)))));
            end
          else
            begin
              reg116 <= (($unsigned(wire94) && (!((^wire95) ?
                      (reg119 >> wire95) : $signed(reg120)))) ?
                  ({reg108, (reg105 ? (8'ha0) : (|(8'hba)))} ?
                      wire91 : $unsigned($unsigned({(8'hb9)}))) : (((-{reg104}) ?
                          $signed(reg113[(1'h1):(1'h1)]) : $unsigned(reg101)) ?
                      wire92[(2'h3):(1'h0)] : ((reg99 != reg105) ?
                          ((8'hb5) ?
                              ((8'haa) ~^ reg116) : (reg113 | reg110)) : (!$signed((8'hb8))))));
              reg117 <= reg120[(1'h1):(1'h0)];
              reg118 <= ((reg107 ? (+reg101[(1'h0):(1'h0)]) : reg100) ?
                  {(((wire91 ? wire95 : reg116) >= $unsigned((8'hb1))) ?
                          ($unsigned((8'hb2)) | (reg116 ?
                              reg120 : wire98)) : $unsigned((wire94 >> reg107))),
                      reg105[(3'h7):(1'h1)]} : reg119[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg112 <= wire91;
          reg113 <= wire92;
        end
      reg121 <= wire91;
    end
  assign wire122 = reg106;
  assign wire123 = (~|reg116[(3'h4):(2'h2)]);
  assign wire124 = (~&wire94[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg125 <= wire124;
      reg126 <= wire97[(2'h3):(1'h1)];
      reg127 <= (+$signed($signed(reg112)));
      reg128 <= $signed($signed($unsigned($unsigned(wire97[(1'h0):(1'h0)]))));
      reg129 <= {$unsigned(reg119),
          (($unsigned((&wire124)) ? reg109[(3'h7):(3'h4)] : reg106) ?
              (($signed(wire92) > {wire98,
                  (8'hb6)}) ~^ $unsigned($unsigned((8'ha2)))) : {(^(reg120 ?
                      reg125 : wire91)),
                  {$unsigned(reg105)}})};
    end
endmodule

module module52
#(parameter param86 = (-(({{(8'haa)}, (+(8'ha8))} < (~^(~&(8'ha2)))) << (&(^(&(7'h44)))))), 
parameter param87 = (^~(param86 ? ((~&{param86, param86}) & ((param86 ? param86 : param86) * param86)) : (((param86 ? param86 : param86) ? (~|(8'hb6)) : (param86 * param86)) & ({param86} + param86)))))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire56;
  input wire [(4'hc):(1'h0)] wire55;
  input wire [(5'h12):(1'h0)] wire54;
  input wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire57;
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire57,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire57 = $unsigned($signed($unsigned(wire53[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg58 <= (wire57 ?
          $signed(wire56) : (wire57 ?
              ($unsigned(wire56[(2'h3):(1'h0)]) ?
                  (+(wire56 || wire53)) : {wire55}) : wire54));
      reg59 <= wire54;
      reg60 <= reg58;
    end
  assign wire61 = {{wire57[(2'h2):(2'h2)], wire57}, $signed(reg58)};
  assign wire62 = reg58[(3'h4):(1'h1)];
  assign wire63 = (|($unsigned($unsigned(((8'hbf) ? wire53 : wire55))) ?
                      ((~^{wire56, wire57}) ?
                          (wire55 ?
                              $unsigned(wire61) : (~(8'hb7))) : (-$signed((8'hbc)))) : wire55));
  assign wire64 = wire56[(4'h9):(4'h8)];
  assign wire65 = reg58[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg66 <= (~|$unsigned($signed((|(8'h9d)))));
      reg67 <= reg60;
      if ({{$signed(wire62),
              {((~wire56) ? (wire55 > wire57) : $signed((8'hb2))), wire53}},
          {$signed({(wire55 ? reg59 : wire63)})}})
        begin
          reg68 <= (8'hae);
          reg69 <= $signed(($signed({reg68}) ?
              $unsigned((~|wire63[(3'h7):(1'h0)])) : reg68[(2'h3):(2'h2)]));
        end
      else
        begin
          if ((!{$signed((wire53[(3'h5):(2'h2)] ?
                  reg69[(2'h2):(1'h1)] : $signed((8'h9f)))),
              reg68[(4'hf):(4'hc)]}))
            begin
              reg68 <= $unsigned((wire65[(2'h3):(1'h0)] < (&$signed(wire64[(3'h7):(3'h6)]))));
              reg69 <= reg67[(1'h1):(1'h1)];
              reg70 <= ((|((!((8'had) >>> wire64)) << (&$signed(wire64)))) ?
                  (|(|(8'h9f))) : $unsigned(reg68[(4'hd):(4'hb)]));
              reg71 <= wire61[(4'hb):(3'h4)];
            end
          else
            begin
              reg68 <= wire53;
              reg69 <= (~&$signed(((reg66 >= (reg69 ? reg71 : reg69)) ?
                  (!(wire65 >>> (8'ha2))) : $unsigned($signed((7'h42))))));
            end
          reg72 <= $signed({((-reg58) ?
                  $unsigned($unsigned(wire55)) : (7'h42))});
          reg73 <= wire53;
          reg74 <= ((~|wire53[(3'h4):(3'h4)]) ?
              (((|(wire53 && wire62)) <= {{wire63}}) >= (((!reg73) * $unsigned((8'ha3))) ?
                  wire56 : wire61)) : {{{((7'h41) - wire55), (8'hb1)}},
                  $unsigned({(^reg70)})});
        end
    end
  assign wire75 = $unsigned(((7'h40) <<< (!reg59)));
  assign wire76 = (|reg60[(4'hc):(1'h0)]);
  assign wire77 = ((-{$unsigned($signed(reg70))}) ?
                      reg71[(4'h8):(3'h7)] : $signed(wire53[(2'h3):(1'h1)]));
  assign wire78 = ($unsigned($signed((7'h42))) && ($signed(reg74[(2'h2):(2'h2)]) ?
                      reg74[(1'h0):(1'h0)] : reg71));
  assign wire79 = (~|(~^(wire55[(3'h4):(3'h4)] * $signed($unsigned(reg60)))));
  assign wire80 = (reg67 ?
                      $signed(wire78[(4'h8):(3'h6)]) : ($unsigned(((|(8'hbf)) ?
                              $signed(wire61) : wire65)) ?
                          wire56 : wire55[(3'h7):(3'h4)]));
  assign wire81 = {wire57[(2'h3):(2'h3)]};
  assign wire82 = wire75[(4'h8):(3'h4)];
  assign wire83 = wire55;
  assign wire84 = (&(reg74[(1'h0):(1'h0)] ?
                      (~reg58) : $signed($signed((7'h40)))));
  assign wire85 = reg69;
endmodule
