module top
#(parameter param206 = ((~^((|(^~(8'hbc))) * (8'h9d))) ? (|(((+(7'h40)) ? (!(8'hac)) : (&(8'hbf))) ~^ (-((8'h9d) >> (7'h44))))) : (+(&({(8'ha7)} ? ((8'ha5) ? (8'hba) : (8'hbe)) : (-(8'hb6)))))), 
parameter param207 = (~param206))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire205;
  wire signed [(5'h11):(1'h0)] wire204;
  wire signed [(5'h13):(1'h0)] wire203;
  wire signed [(3'h4):(1'h0)] wire201;
  wire signed [(3'h5):(1'h0)] wire199;
  wire signed [(4'ha):(1'h0)] wire198;
  wire [(5'h14):(1'h0)] wire197;
  wire [(3'h4):(1'h0)] wire195;
  wire signed [(4'hd):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire151;
  wire [(4'ha):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire201,
                 wire199,
                 wire198,
                 wire197,
                 wire195,
                 wire154,
                 wire153,
                 wire151,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed((|{($signed(wire1) ? (^wire2) : {wire3, wire3})}));
  always
    @(posedge clk) begin
      reg6 <= (-(~^{((wire0 ? (7'h40) : wire0) ?
              $signed(wire0) : $signed((8'hb5))),
          ((+wire4) ? (wire3 > wire5) : (^~wire4))}));
      reg7 <= wire1;
    end
  assign wire8 = (wire5 ? $signed($signed(wire4)) : wire2);
  assign wire9 = wire3[(3'h5):(3'h4)];
  assign wire10 = $unsigned(wire2);
  always
    @(posedge clk) begin
      reg11 <= {(wire10 << wire1)};
    end
  always
    @(posedge clk) begin
      reg12 <= wire1[(3'h4):(2'h2)];
      reg13 <= (8'hb0);
      if ({(!{$unsigned(wire0[(3'h4):(1'h1)])})})
        begin
          if ((8'hbb))
            begin
              reg14 <= (|(^wire9));
              reg15 <= (~&(^((8'hbb) + reg7[(3'h4):(1'h1)])));
              reg16 <= reg12;
              reg17 <= wire2[(3'h5):(2'h3)];
              reg18 <= $unsigned($unsigned(($unsigned((reg17 ?
                  reg13 : (8'haf))) ~^ (&(~reg6)))));
            end
          else
            begin
              reg14 <= ((((~|wire0) ~^ ($signed(reg13) ^~ reg18)) && (wire5[(3'h4):(1'h0)] ?
                      $unsigned(reg17) : wire8)) ?
                  reg18 : wire1[(1'h1):(1'h0)]);
              reg15 <= (-$signed((&{(wire2 || wire3), reg13})));
              reg16 <= ($unsigned(((!$unsigned(wire4)) ?
                      (|$signed(wire3)) : reg17)) ?
                  wire1[(2'h2):(2'h2)] : ({{(^~wire8)}} ? wire4 : wire5));
              reg17 <= {wire3[(1'h0):(1'h0)]};
            end
          reg19 <= $unsigned($signed(({wire1} || ((reg15 ?
              reg18 : reg17) << {reg18, wire8}))));
          reg20 <= (reg7 ?
              ({($unsigned(wire10) >= $signed(wire10))} ?
                  $signed(reg7) : reg17) : (-wire0));
          reg21 <= wire9;
          reg22 <= $signed($signed((-({wire0} ?
              $signed(reg18) : wire8[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg14 <= (wire1 == $signed(wire1[(3'h7):(3'h4)]));
          if ((8'ha6))
            begin
              reg15 <= (reg15[(1'h1):(1'h0)] ^ $unsigned($signed(reg11)));
            end
          else
            begin
              reg15 <= ((^~$signed(reg16)) ?
                  (reg11 <<< (reg18 ?
                      {wire3[(4'hb):(4'ha)],
                          (reg6 == wire4)} : ((reg22 != wire1) <<< wire4[(1'h0):(1'h0)]))) : reg11);
              reg16 <= ((~|(8'hac)) ?
                  $unsigned((($signed(reg14) ?
                      (wire2 ? wire9 : wire3) : $signed(wire4)) + ((~^wire10) ?
                      (wire1 >> reg16) : (reg14 ?
                          reg17 : (8'hb3))))) : $signed(reg12));
              reg17 <= ($signed(({(reg22 * wire3), ((8'ha8) >= reg15)} ?
                  (^reg20) : ((reg6 <= (8'hb1)) ?
                      $signed(wire4) : ((8'ha1) ?
                          reg6 : (7'h41))))) & ($signed((-$signed(reg20))) ?
                  reg22 : (reg6 == (8'haf))));
            end
          reg18 <= reg17[(4'h8):(3'h5)];
          reg19 <= $signed(reg15[(4'h8):(3'h4)]);
        end
      reg23 <= {{$unsigned($unsigned(wire10[(1'h1):(1'h0)])), wire0},
          wire10[(2'h3):(2'h3)]};
      if ((((reg19[(1'h0):(1'h0)] - wire2[(3'h6):(2'h2)]) > (-(reg11[(4'hb):(4'h9)] ?
          (wire3 ?
              reg11 : reg15) : (reg22 >>> (7'h41))))) + ((|wire1[(3'h5):(2'h3)]) >>> ($signed((|reg22)) < $signed((wire8 > wire5))))))
        begin
          reg24 <= reg17[(3'h6):(1'h1)];
          reg25 <= (8'hb7);
          if ($signed(wire4))
            begin
              reg26 <= {(~&$signed($unsigned(reg22[(2'h3):(2'h2)])))};
              reg27 <= {$signed((((-reg20) ~^ $unsigned((8'hac))) + (reg19 + reg20)))};
              reg28 <= {(+reg15[(3'h6):(3'h4)]), reg25};
              reg29 <= reg7;
              reg30 <= $signed($signed($signed(wire3)));
            end
          else
            begin
              reg26 <= (~(8'h9f));
              reg27 <= reg14[(4'hd):(4'h9)];
              reg28 <= ($signed(reg27) ~^ reg16);
              reg29 <= reg13;
              reg30 <= reg21;
            end
        end
      else
        begin
          if ((~^($signed(reg18) != $unsigned(wire0[(3'h6):(3'h4)]))))
            begin
              reg24 <= (&$unsigned($unsigned(((8'h9d) ?
                  wire0 : ((8'ha3) ? reg17 : (8'hb4))))));
              reg25 <= wire8[(2'h2):(1'h0)];
              reg26 <= reg29;
              reg27 <= wire8[(1'h0):(1'h0)];
            end
          else
            begin
              reg24 <= (|((((wire8 ? reg6 : reg15) ?
                      wire3 : $unsigned(reg24)) + ($unsigned(reg11) ^~ $signed(reg13))) ?
                  $unsigned($signed((reg7 >>> (8'haf)))) : $signed({$signed(wire8),
                      (~|reg17)})));
              reg25 <= $signed((+{$unsigned($unsigned(wire1))}));
            end
          reg28 <= $signed({(reg12[(4'h8):(4'h8)] < reg16[(4'h9):(4'h8)]),
              $unsigned($unsigned($signed(wire5)))});
        end
    end
  module31 #() modinst152 (wire151, clk, wire4, reg12, wire0, reg29);
  assign wire153 = $unsigned(reg15);
  assign wire154 = ($signed(wire5[(3'h4):(2'h3)]) >>> $signed(wire8[(1'h0):(1'h0)]));
  module155 #() modinst196 (.wire159(reg28), .wire157(reg29), .wire158(reg21), .clk(clk), .wire156(reg16), .y(wire195));
  assign wire197 = $unsigned(((~^($signed(reg15) || (wire5 ?
                       wire1 : reg15))) - (reg29[(5'h11):(1'h1)] <<< reg30)));
  assign wire198 = $signed({{((&reg14) ~^ reg28[(1'h0):(1'h0)])}});
  module39 #() modinst200 (.clk(clk), .wire42(wire197), .y(wire199), .wire40(reg27), .wire41(wire1), .wire43(reg17));
  module129 #() modinst202 (.wire131(wire2), .y(wire201), .wire132(reg21), .wire133(wire153), .wire130(reg16), .clk(clk));
  assign wire203 = ($unsigned((((reg21 ? reg12 : reg14) * (reg16 ?
                           reg13 : (8'hb4))) <= $signed((8'hb3)))) ?
                       (wire9[(2'h3):(2'h3)] ?
                           {(~(&reg17)),
                               (-(~&reg22))} : $unsigned({(reg20 <= wire198),
                               reg19[(2'h2):(1'h1)]})) : ($unsigned(reg12) ?
                           $unsigned({$unsigned(reg6),
                               reg13[(1'h0):(1'h0)]}) : (wire198 >= (8'ha4))));
  assign wire204 = $unsigned(wire154);
  assign wire205 = (((8'hac) < $unsigned(reg24)) == $unsigned(wire201[(2'h2):(2'h2)]));
endmodule

module module155
#(parameter param194 = (^(|(7'h43))))
(y, clk, wire156, wire157, wire158, wire159);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire156;
  input wire [(5'h15):(1'h0)] wire157;
  input wire signed [(4'he):(1'h0)] wire158;
  input wire [(3'h7):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire193;
  wire [(4'h9):(1'h0)] wire160;
  wire signed [(3'h5):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire162;
  wire [(3'h7):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire165;
  wire [(4'hc):(1'h0)] wire166;
  wire [(2'h3):(1'h0)] wire167;
  wire [(5'h12):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire169;
  wire [(4'hb):(1'h0)] wire170;
  wire [(5'h14):(1'h0)] wire171;
  wire signed [(3'h7):(1'h0)] wire191;
  assign y = {wire193,
                 wire160,
                 wire161,
                 wire162,
                 wire163,
                 wire164,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 wire169,
                 wire170,
                 wire171,
                 wire191,
                 (1'h0)};
  assign wire160 = ({$unsigned($signed($unsigned(wire156))),
                       ((wire156[(1'h0):(1'h0)] ^~ wire156[(3'h5):(1'h0)]) << ($unsigned(wire157) || (~|wire156)))} != wire158[(4'hc):(3'h6)]);
  assign wire161 = $signed(((~|wire157) <= $unsigned(wire156)));
  assign wire162 = wire161[(3'h5):(2'h2)];
  assign wire163 = {wire158[(3'h5):(2'h3)]};
  assign wire164 = wire156;
  assign wire165 = $signed($signed(wire160[(3'h5):(3'h5)]));
  assign wire166 = (+wire160);
  assign wire167 = (~^$signed((~&{wire159})));
  assign wire168 = wire158[(4'hd):(4'ha)];
  assign wire169 = ((($unsigned($unsigned(wire163)) ?
                       wire158 : (^~wire157[(1'h1):(1'h1)])) != wire159) > $signed(wire163));
  assign wire170 = (wire158 ?
                       wire165[(4'h8):(2'h2)] : $signed($unsigned(wire164[(4'hb):(3'h5)])));
  assign wire171 = (wire169[(5'h13):(1'h1)] >> $signed(($signed(wire166[(3'h4):(2'h2)]) ?
                       ((^~wire157) && (wire162 <= wire164)) : (-{wire160,
                           wire167}))));
  module172 #() modinst192 (.wire177(wire168), .wire176(wire166), .wire173(wire164), .y(wire191), .clk(clk), .wire174(wire157), .wire175(wire171));
  assign wire193 = (((8'hba) | (wire170[(2'h3):(2'h3)] >> ((~^wire162) ?
                           $unsigned(wire166) : {wire168}))) ?
                       ($unsigned((~&(~|wire157))) ?
                           $signed(wire163[(2'h3):(2'h3)]) : ($signed((wire171 > (8'hbe))) ?
                               (^~(wire160 < wire156)) : (-$signed(wire166)))) : wire191[(3'h7):(1'h0)]);
endmodule

module module31  (y, clk, wire32, wire33, wire34, wire35);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire [(5'h11):(1'h0)] wire34;
  input wire signed [(4'hf):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire146;
  wire [(2'h3):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire120;
  wire [(5'h15):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire142;
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire36,
                 wire37,
                 wire38,
                 wire120,
                 wire122,
                 wire127,
                 wire128,
                 wire142,
                 reg150,
                 reg149,
                 reg148,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 (1'h0)};
  assign wire36 = wire33;
  assign wire37 = $signed((((+(!wire34)) ? wire33 : (|$unsigned(wire35))) ?
                      ({$unsigned(wire34)} | ((wire35 ?
                          wire32 : wire34) > $unsigned(wire32))) : (((wire35 ?
                              wire36 : (8'hbc)) <<< (+wire33)) ?
                          wire36[(4'h9):(4'h8)] : wire36)));
  assign wire38 = ((~(^wire33)) + wire32);
  module39 #() modinst121 (.y(wire120), .wire43(wire33), .wire42(wire34), .wire41(wire36), .clk(clk), .wire40(wire32));
  assign wire122 = (^wire34);
  always
    @(posedge clk) begin
      reg123 <= ((wire33[(5'h14):(3'h5)] ?
              $signed(wire34) : ((&{wire35, (8'hbe)}) || wire34)) ?
          wire36[(4'hd):(2'h2)] : $signed((wire38 ?
              (|wire38[(1'h0):(1'h0)]) : wire120)));
      reg124 <= ({wire34[(4'hf):(1'h0)],
          ((!$unsigned(wire37)) ?
              wire32 : reg123)} <= $unsigned($signed(wire120[(3'h6):(2'h2)])));
      reg125 <= (wire32[(1'h1):(1'h0)] < wire34[(5'h10):(4'he)]);
      reg126 <= $signed((^reg125[(4'ha):(3'h6)]));
    end
  assign wire127 = ($signed(($unsigned(wire33[(5'h10):(4'ha)]) >= ($unsigned(reg125) ?
                           ((8'hab) ~^ (8'hb0)) : wire32))) ?
                       (~^wire120[(3'h4):(2'h3)]) : wire35);
  assign wire128 = $unsigned((8'hbe));
  module129 #() modinst143 (.wire130(wire128), .y(wire142), .wire131(reg126), .wire132(wire32), .wire133(wire38), .clk(clk));
  assign wire144 = wire35[(4'h9):(4'h9)];
  assign wire145 = (($unsigned($signed(wire35)) ?
                       (|($signed(reg125) * $signed(reg126))) : wire37) <<< $signed($signed(((wire144 < wire33) ?
                       reg126 : $unsigned(wire127)))));
  assign wire146 = $unsigned(({$unsigned((8'hb5)),
                       ((|wire120) - (~&wire142))} * ((~|wire32) ?
                       wire127[(4'hf):(4'hb)] : reg123)));
  assign wire147 = wire142;
  always
    @(posedge clk) begin
      reg148 <= wire122;
      reg149 <= wire127[(3'h4):(2'h2)];
      reg150 <= (wire33 ?
          wire142[(3'h7):(1'h1)] : ((((wire145 ~^ reg148) ?
                  $unsigned(wire32) : (&wire37)) != reg149) ?
              (~^({(8'hab)} >>> reg124[(2'h3):(2'h2)])) : wire36[(5'h13):(5'h11)]));
    end
endmodule

module module129
#(parameter param141 = ((8'ha5) ? ({(((8'h9c) ? (8'hbd) : (8'hbc)) ^~ ((8'hbd) ? (8'hbe) : (8'hb9))), (+((8'h9f) ? (8'ha8) : (8'hac)))} ? (({(8'hac)} ? ((8'hbe) ? (8'hb8) : (8'hbf)) : (|(8'hae))) < {{(7'h41), (7'h42)}, (|(8'ha5))}) : {{((7'h40) ? (8'ha1) : (8'ha0))}, ((!(8'h9f)) || ((8'hae) + (8'had)))}) : ({(~|((8'ha9) << (8'hb1)))} ? (~^(((8'hb6) ? (8'ha0) : (8'hb1)) & (8'hbf))) : ((~((8'ha4) && (8'h9c))) ? ((|(8'hbb)) ? ((8'hb7) ? (8'ha9) : (8'ha4)) : ((8'h9c) ? (7'h43) : (8'hac))) : (+((8'hb6) == (8'ha8)))))))
(y, clk, wire133, wire132, wire131, wire130);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire133;
  input wire signed [(5'h12):(1'h0)] wire132;
  input wire signed [(4'hc):(1'h0)] wire131;
  input wire [(5'h13):(1'h0)] wire130;
  wire signed [(3'h4):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire [(4'he):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire134;
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 (1'h0)};
  assign wire134 = ((-((wire131 * (wire133 ?
                           (7'h43) : wire133)) & (+$signed(wire131)))) ?
                       $unsigned(wire133) : wire132);
  assign wire135 = wire130[(2'h3):(2'h3)];
  assign wire136 = {wire130};
  assign wire137 = (~($signed(wire130[(4'hd):(1'h1)]) - $signed((~((8'ha5) ?
                       wire136 : wire130)))));
  assign wire138 = $signed((|(~|(~|$unsigned(wire134)))));
  assign wire139 = (^(^($signed(wire132[(3'h4):(3'h4)]) ?
                       wire138[(2'h2):(1'h0)] : wire135)));
  assign wire140 = (|wire133);
endmodule

module module39  (y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h368):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire43;
  input wire signed [(3'h6):(1'h0)] wire42;
  input wire [(4'hd):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire44;
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire105,
                 wire92,
                 wire69,
                 wire68,
                 wire58,
                 wire57,
                 wire44,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire44 = wire43[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg45 <= (8'hb4);
      if ((reg45 ^ wire42[(3'h4):(1'h0)]))
        begin
          reg46 <= reg45[(3'h6):(3'h5)];
          if ($signed($signed($signed($signed($signed(wire43))))))
            begin
              reg47 <= $unsigned((wire44 ?
                  (~^reg45[(1'h0):(1'h0)]) : $unsigned((7'h40))));
            end
          else
            begin
              reg47 <= reg46[(4'hb):(3'h5)];
              reg48 <= wire43[(4'he):(3'h5)];
              reg49 <= $unsigned($signed(reg48));
            end
          reg50 <= reg46;
          reg51 <= $unsigned(wire42);
          reg52 <= ($signed($unsigned((|(reg49 ?
              wire41 : wire44)))) ~^ {$unsigned(reg50[(4'h8):(3'h4)]),
              $signed($signed((8'h9e)))});
        end
      else
        begin
          reg46 <= reg45;
        end
      reg53 <= (~(wire42 >>> (^~reg46)));
      reg54 <= reg45;
      reg55 <= (~^$signed($unsigned(($signed((8'ha4)) <<< (reg46 ?
          wire44 : wire41)))));
    end
  always
    @(posedge clk) begin
      reg56 <= reg54[(1'h1):(1'h0)];
    end
  assign wire57 = {reg52};
  assign wire58 = wire40[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if (reg51)
        begin
          reg59 <= ((~^wire57[(1'h0):(1'h0)]) - ((((reg45 ?
                      wire43 : reg55) ^ (reg53 < wire57)) ?
                  {wire58[(4'he):(4'hb)], $unsigned(wire42)} : wire40) ?
              reg45 : $signed(wire57)));
          if (((reg59[(1'h1):(1'h0)] ?
                  $unsigned(reg51) : {(-(reg48 ? (8'ha3) : (8'h9f)))}) ?
              ((8'h9c) < reg50) : reg52[(2'h2):(2'h2)]))
            begin
              reg60 <= reg50[(4'ha):(1'h1)];
              reg61 <= (((wire44 ?
                  (!(reg48 * reg55)) : $signed(wire42)) >= $unsigned({{reg49,
                      (8'ha0)},
                  $signed(wire44)})) - reg48[(2'h2):(2'h2)]);
              reg62 <= (wire40 ? reg46 : $signed(reg56[(4'ha):(1'h0)]));
              reg63 <= wire42[(1'h0):(1'h0)];
            end
          else
            begin
              reg60 <= ((reg61 ?
                      ($signed((~|reg52)) <<< $signed($unsigned(wire42))) : $signed((((8'hba) ?
                          reg45 : reg62) ~^ (reg55 ? reg62 : reg51)))) ?
                  reg50[(3'h7):(3'h4)] : reg54);
              reg61 <= (~reg60[(3'h5):(1'h1)]);
              reg62 <= (&$signed((&(wire41[(4'h9):(4'h9)] ?
                  (+reg56) : reg45[(3'h7):(3'h4)]))));
              reg63 <= wire44[(1'h1):(1'h1)];
              reg64 <= ((reg48 ? reg53 : reg56) ?
                  $signed((~reg50)) : $signed({(reg55[(3'h7):(3'h6)] < {reg46})}));
            end
          if (reg52)
            begin
              reg65 <= reg59[(1'h0):(1'h0)];
            end
          else
            begin
              reg65 <= $unsigned($unsigned($signed($signed((!wire41)))));
              reg66 <= $unsigned(reg53);
            end
          reg67 <= $unsigned(({((+wire42) ? (reg48 || reg64) : reg47)} ?
              reg48[(3'h5):(3'h4)] : ($unsigned((reg56 >>> reg61)) ?
                  reg54[(2'h2):(1'h0)] : $signed(reg55[(4'ha):(3'h4)]))));
        end
      else
        begin
          reg59 <= (wire40 ?
              (($unsigned(reg60[(3'h4):(2'h3)]) - (^{wire43, reg63})) ?
                  (reg53 ?
                      $unsigned(reg52) : ({reg56, (7'h43)} ?
                          $signed(reg46) : reg62[(2'h2):(2'h2)])) : (-reg63)) : {reg51,
                  $unsigned(reg63)});
          reg60 <= (reg66 ? wire44 : wire42);
          reg61 <= $signed({reg52,
              (($unsigned(reg47) ^ (reg54 ? reg51 : wire57)) ^ {(^reg51)})});
          if ($signed($signed(wire41[(2'h3):(1'h0)])))
            begin
              reg62 <= $signed({$unsigned(wire40[(4'h8):(3'h5)]),
                  reg65[(4'hf):(2'h2)]});
            end
          else
            begin
              reg62 <= (reg48[(2'h2):(1'h1)] ?
                  $signed((((reg64 ? reg67 : wire41) ? (^reg54) : wire40) ?
                      reg64 : (~|{(8'hbf), (8'hac)}))) : (~|reg59));
              reg63 <= {((reg53[(3'h5):(2'h2)] ?
                      $signed((8'had)) : $unsigned((reg52 || reg50))) ~^ $unsigned($signed((wire58 >>> reg61))))};
              reg64 <= $unsigned($signed({$signed(reg65[(3'h5):(3'h5)]),
                  {$unsigned(reg61)}}));
            end
        end
    end
  assign wire68 = reg64[(4'hc):(3'h5)];
  assign wire69 = reg45;
  always
    @(posedge clk) begin
      reg70 <= ($signed(reg62) | (^$unsigned($unsigned(reg60[(3'h5):(1'h1)]))));
      reg71 <= wire40;
      if ($unsigned($unsigned($signed(reg64))))
        begin
          reg72 <= (reg71 ? {wire68} : $unsigned((^~reg61)));
          reg73 <= reg60[(3'h6):(3'h4)];
          reg74 <= ($unsigned((^~($signed(reg54) && reg67))) ?
              reg47[(3'h6):(1'h1)] : (!($signed((!reg53)) && $signed((reg47 > reg61)))));
          if ($unsigned(reg54))
            begin
              reg75 <= (reg70[(4'h9):(1'h1)] << $unsigned(((reg65 || (reg54 || reg49)) ?
                  reg70 : $unsigned(reg49[(1'h1):(1'h1)]))));
              reg76 <= {$unsigned((((reg62 ? reg71 : reg60) ?
                          reg63[(4'hb):(2'h3)] : reg66) ?
                      $unsigned(wire43[(3'h5):(3'h5)]) : $unsigned((wire41 * reg50))))};
              reg77 <= (((&reg53) ?
                  (~$unsigned(reg76[(4'hd):(1'h0)])) : reg54[(2'h3):(2'h2)]) >> (reg72 <= $unsigned($signed($signed(reg47)))));
            end
          else
            begin
              reg75 <= $unsigned($unsigned(($unsigned($signed((8'hbc))) || reg76[(3'h5):(2'h3)])));
              reg76 <= ({$unsigned({reg76, $unsigned(reg59)}),
                  reg53} <= {((!$unsigned(wire43)) ?
                      ($unsigned(reg46) ?
                          (reg50 - (8'ha6)) : (reg66 ?
                              reg71 : (8'ha0))) : $signed((|reg61))),
                  reg65});
            end
          reg78 <= reg71;
        end
      else
        begin
          reg72 <= reg50;
        end
      if ({reg59[(1'h1):(1'h0)], {{{reg67}}, wire69}})
        begin
          reg79 <= wire58[(1'h0):(1'h0)];
          if ((^~{reg64[(4'h9):(3'h7)],
              {((reg47 ? reg72 : (8'hac)) ? reg75 : reg55[(4'ha):(2'h2)])}}))
            begin
              reg80 <= reg70;
              reg81 <= $signed($signed((~^(-{reg45, reg74}))));
              reg82 <= ($unsigned(wire41) ~^ reg54);
              reg83 <= reg63[(4'ha):(4'h8)];
            end
          else
            begin
              reg80 <= ((reg83 ?
                      reg79[(5'h14):(3'h7)] : (reg49 ?
                          ((reg70 >= wire41) ^~ reg55[(1'h0):(1'h0)]) : reg55)) ?
                  $signed($signed((~|reg49[(1'h0):(1'h0)]))) : (($unsigned($signed(reg61)) ?
                      (wire68 - (reg64 ?
                          reg61 : reg66)) : (!{reg60})) | (|(~^wire44))));
              reg81 <= (reg52 >= $signed(reg55[(1'h1):(1'h0)]));
              reg82 <= $unsigned(reg75[(1'h0):(1'h0)]);
              reg83 <= reg50;
            end
          if ((~|reg74[(1'h1):(1'h0)]))
            begin
              reg84 <= {(~|$unsigned($signed(reg66))),
                  $unsigned(reg50[(2'h2):(1'h1)])};
              reg85 <= reg65;
            end
          else
            begin
              reg84 <= wire40;
              reg85 <= (reg54 || $signed(reg54[(2'h3):(1'h1)]));
              reg86 <= (8'hb9);
            end
        end
      else
        begin
          reg79 <= $signed((8'ha2));
          reg80 <= $unsigned($unsigned(reg61));
          reg81 <= $unsigned((~|reg67[(1'h1):(1'h0)]));
          if ($signed(reg60[(1'h0):(1'h0)]))
            begin
              reg82 <= wire69[(5'h13):(4'h8)];
              reg83 <= reg74;
              reg84 <= $signed((~|(reg51 ?
                  {(+reg73), (reg47 << (8'hb1))} : {{reg62}})));
              reg85 <= ((~|(-({reg54, reg67} ?
                      (~&wire40) : $unsigned(reg45)))) ?
                  (((!$unsigned(reg61)) ? (-$unsigned((8'hb7))) : reg70) ?
                      reg70[(1'h0):(1'h0)] : (wire40[(2'h3):(2'h2)] || ((^reg63) ?
                          (reg51 & (8'ha9)) : (|reg85)))) : (wire57 << {(!(reg80 ?
                          reg60 : reg48)),
                      $unsigned(((8'hab) * reg81))}));
              reg86 <= (~reg78[(2'h2):(1'h0)]);
            end
          else
            begin
              reg82 <= $signed(reg54);
              reg83 <= (($signed($signed(wire44)) ?
                  $signed(reg46) : $signed({$unsigned((8'hb4)),
                      (wire40 ?
                          (8'hbf) : reg70)})) != $signed({$unsigned({(8'hb8)})}));
              reg84 <= $signed((8'ha9));
              reg85 <= (+(~^reg50));
              reg86 <= {($signed(((|reg67) ?
                      (reg47 ?
                          wire40 : wire41) : reg67[(2'h2):(1'h1)])) * (((reg45 ?
                          reg54 : reg64) - (&reg53)) ?
                      wire58[(2'h3):(2'h2)] : $signed(wire42))),
                  (+($signed((-reg56)) >> (^(7'h44))))};
            end
          if (reg75[(4'h8):(4'h8)])
            begin
              reg87 <= (reg63[(4'h8):(3'h7)] ?
                  reg56[(4'hf):(3'h6)] : $signed($unsigned({{reg73},
                      $unsigned(reg48)})));
              reg88 <= {(reg51 ?
                      $unsigned($unsigned((reg46 * reg83))) : {$signed(reg59),
                          reg66}),
                  ((($signed((8'hbc)) | (reg85 < reg80)) ?
                      $signed((reg54 ? reg66 : wire69)) : (((8'hb4) ?
                              reg59 : wire58) ?
                          $signed(reg63) : (^~reg67))) <= wire40)};
              reg89 <= (reg46 - {(7'h42), (8'ha4)});
              reg90 <= ((((^~reg86[(2'h2):(1'h0)]) ^~ reg82[(2'h2):(1'h0)]) ?
                      (~&{(wire41 ? reg61 : reg80)}) : ((wire69 ?
                              reg61[(4'ha):(3'h6)] : reg64[(1'h1):(1'h1)]) ?
                          $unsigned(reg89) : $signed((reg55 + reg60)))) ?
                  reg70 : reg56[(4'hd):(2'h3)]);
              reg91 <= ((8'hb3) >> {(!($signed(reg74) ?
                      $unsigned((8'haa)) : reg62[(3'h7):(3'h5)])),
                  (-($signed(wire42) ? $unsigned(wire57) : (reg73 * wire57)))});
            end
          else
            begin
              reg87 <= reg85[(4'ha):(3'h4)];
              reg88 <= (!reg51);
            end
        end
    end
  assign wire92 = $unsigned(reg46);
  always
    @(posedge clk) begin
      if (reg87[(4'hf):(3'h6)])
        begin
          reg93 <= ($signed({($unsigned(reg72) ?
                      (reg82 & reg66) : (reg47 ? reg49 : (8'hb3))),
                  $unsigned($unsigned(reg82))}) ?
              {reg86[(3'h4):(2'h2)],
                  ((~&(reg76 | reg52)) ?
                      (reg54 ~^ reg79[(4'he):(4'hd)]) : reg78[(2'h3):(2'h3)])} : $signed($signed((~&(~reg87)))));
          reg94 <= reg72;
          reg95 <= reg45[(2'h2):(2'h2)];
          reg96 <= reg55;
          reg97 <= $signed($signed((reg67[(4'hf):(3'h6)] - (wire42 >= $signed(reg79)))));
        end
      else
        begin
          reg93 <= (reg81 ? (|(!reg65)) : reg73);
          if (((+(~&(~(reg65 <<< reg87)))) ?
              ($signed(reg97) ^~ wire44) : $signed((wire40 > ({(8'h9f)} ?
                  $signed(reg82) : {wire92, reg97})))))
            begin
              reg94 <= (~&$signed((reg52 ?
                  ({reg97, reg95} ?
                      (reg47 && reg59) : (wire69 * (8'ha4))) : wire68[(3'h4):(3'h4)])));
              reg95 <= (+$unsigned((~^{$signed((8'hb9))})));
            end
          else
            begin
              reg94 <= $signed(reg96);
              reg95 <= $unsigned({{$unsigned((reg67 | reg63)),
                      ((&reg54) ? (8'hbb) : reg76[(3'h5):(3'h4)])},
                  $signed(((&wire68) != (wire69 ? (8'ha1) : wire57)))});
              reg96 <= $signed($signed((wire43 ?
                  ((reg94 || (8'ha9)) ?
                      $signed((7'h41)) : reg73) : {reg55[(1'h1):(1'h1)]})));
            end
        end
      reg98 <= ($unsigned((reg84 ?
          (^(reg84 ? wire68 : reg77)) : ({reg70} ?
              $signed(reg52) : wire42[(3'h5):(2'h2)]))) >>> reg63[(3'h4):(1'h1)]);
      reg99 <= wire40[(1'h1):(1'h1)];
      if (wire92[(3'h7):(1'h0)])
        begin
          if ($unsigned(((~^wire92[(3'h6):(3'h6)]) ^ (+reg72))))
            begin
              reg100 <= (((!$signed({reg88})) ?
                      (8'hb5) : reg77[(3'h4):(1'h1)]) ?
                  $unsigned((&((reg64 > reg91) ?
                      $unsigned(reg49) : (reg49 | (8'ha6))))) : (reg85 && reg66[(3'h4):(2'h3)]));
            end
          else
            begin
              reg100 <= reg99[(1'h1):(1'h1)];
              reg101 <= ($signed((~|reg93)) ?
                  ((~|(reg61 ? wire69 : $unsigned(reg75))) ?
                      (-$signed($unsigned(reg47))) : (~^(~(8'ha0)))) : reg75);
              reg102 <= (wire42 ?
                  (reg90 ?
                      ((^~{reg91}) ?
                          ((reg89 || reg65) && $signed((8'hbe))) : ({reg96,
                              wire57} ~^ (8'hb1))) : wire58[(4'he):(3'h6)]) : ($signed(((!(8'hbc)) <<< reg47)) & $signed((wire68 ?
                      (reg96 < wire43) : {reg79, reg72}))));
              reg103 <= $signed(reg55[(4'h9):(2'h2)]);
            end
          reg104 <= reg79;
        end
      else
        begin
          if ($signed((^($signed(reg88) ?
              reg59[(2'h2):(2'h2)] : reg61[(3'h6):(1'h1)]))))
            begin
              reg100 <= reg62[(2'h3):(1'h0)];
            end
          else
            begin
              reg100 <= reg71[(4'h9):(3'h5)];
              reg101 <= ((^(&((reg63 ^~ reg88) || (reg90 ? wire69 : reg77)))) ?
                  (((8'haa) >>> reg71) ?
                      ($signed((reg102 & (7'h42))) ?
                          wire92[(4'ha):(4'h8)] : reg59[(1'h1):(1'h0)]) : reg81) : reg66);
            end
        end
    end
  assign wire105 = $signed((reg81 * {reg85,
                       {((8'hbf) ^~ reg104), (wire57 ? reg67 : reg51)}}));
  always
    @(posedge clk) begin
      reg106 <= wire42;
      if (($unsigned((~&(!(reg64 ^ reg67)))) ?
          $unsigned(reg98) : ($unsigned(($signed(reg98) ?
                  $unsigned(wire41) : reg85)) ?
              ($signed((~^reg70)) ?
                  $unsigned((reg94 << reg84)) : $signed((reg104 ?
                      reg45 : reg84))) : {reg101, (|$signed(reg84))})))
        begin
          reg107 <= reg60[(1'h0):(1'h0)];
          reg108 <= $unsigned({((+reg47) ?
                  reg72[(4'ha):(2'h3)] : ({reg82, wire43} < (&(8'ha1))))});
        end
      else
        begin
          reg107 <= (-(^(8'hb3)));
          reg108 <= (+$unsigned($signed(($signed(reg55) != ((8'h9c) ^~ reg90)))));
          reg109 <= $signed((^~reg86));
          reg110 <= reg72;
        end
    end
  always
    @(posedge clk) begin
      reg111 <= reg79;
      reg112 <= $signed(($signed($unsigned($unsigned(reg110))) >>> reg52));
    end
  assign wire113 = (~reg76[(4'hc):(3'h7)]);
  assign wire114 = $unsigned((reg103 - (~^((wire40 ? reg66 : reg98) ?
                       $signed((8'hbc)) : $signed(wire41)))));
  assign wire115 = ($unsigned({$signed((wire58 ? reg106 : wire113)),
                           {$signed((8'hb7))}}) ?
                       $unsigned((((wire105 | reg63) >>> reg46[(2'h3):(1'h1)]) << (reg75 ?
                           reg101[(3'h4):(1'h0)] : reg54[(2'h2):(1'h1)]))) : (|$signed($unsigned(wire40[(2'h2):(2'h2)]))));
  assign wire116 = $unsigned($unsigned(reg91[(3'h4):(2'h2)]));
  assign wire117 = {(&reg67[(4'hd):(3'h5)]), wire92};
  assign wire118 = $signed(({$unsigned((8'hb1)),
                       reg55[(2'h3):(1'h1)]} < reg76));
  assign wire119 = $unsigned($signed({({wire113} >>> (reg64 - (7'h43))),
                       ($signed(reg91) ? reg55[(4'ha):(4'ha)] : {reg108})}));
endmodule

module module172
#(parameter param190 = (((~^(((8'h9d) - (8'ha5)) ^ (~(8'h9c)))) != {(((8'ha7) <<< (8'ha3)) ^ ((8'hbf) - (8'ha0))), (((8'hbe) ? (8'hb0) : (8'h9d)) ? ((8'hb7) & (8'hb3)) : ((8'ha5) ? (8'ha4) : (8'hb9)))}) ? (+(|(((8'ha7) + (8'hb7)) ? (^(8'hb5)) : ((8'hb3) ? (7'h40) : (8'ha7))))) : (+{((8'had) == ((7'h44) ? (8'hbb) : (8'hbc)))})))
(y, clk, wire177, wire176, wire175, wire174, wire173);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire177;
  input wire signed [(4'hc):(1'h0)] wire176;
  input wire [(3'h6):(1'h0)] wire175;
  input wire signed [(5'h15):(1'h0)] wire174;
  input wire signed [(5'h13):(1'h0)] wire173;
  wire [(4'hb):(1'h0)] wire189;
  wire signed [(4'hb):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire187;
  wire signed [(4'hd):(1'h0)] wire186;
  wire signed [(4'hf):(1'h0)] wire182;
  wire signed [(3'h6):(1'h0)] wire181;
  wire [(5'h11):(1'h0)] wire180;
  wire [(4'h8):(1'h0)] wire179;
  wire [(3'h5):(1'h0)] wire178;
  reg signed [(3'h5):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg184 = (1'h0);
  reg [(5'h12):(1'h0)] reg183 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 reg185,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire178 = (wire173 ? $unsigned(wire176) : $signed((8'ha3)));
  assign wire179 = $unsigned($signed($unsigned(wire174[(2'h2):(1'h0)])));
  assign wire180 = $unsigned(wire177);
  assign wire181 = ($unsigned(wire179) && {$unsigned({wire174,
                           (wire178 >= wire177)}),
                       $signed($signed($unsigned(wire174)))});
  assign wire182 = wire179;
  always
    @(posedge clk) begin
      reg183 <= (($unsigned(wire179) ?
          (~&($signed(wire181) ?
              (wire181 >= wire181) : (wire182 >= (7'h40)))) : (^((wire173 | wire179) + $unsigned(wire173)))) == wire176);
      reg184 <= (wire181[(2'h3):(2'h2)] ?
          wire179 : $unsigned((wire173[(4'h8):(3'h4)] >> (8'hac))));
      reg185 <= ((wire178[(2'h3):(2'h2)] | $unsigned((~|(wire173 > wire181)))) >= wire175);
    end
  assign wire186 = $signed($unsigned(wire182[(4'he):(4'h9)]));
  assign wire187 = (+$signed($unsigned(((reg184 ?
                       wire177 : wire186) + wire177))));
  assign wire188 = $unsigned(((!((wire181 ? reg183 : (8'ha8)) ?
                           (^wire181) : $signed(wire175))) ?
                       wire177[(3'h6):(3'h5)] : ({$signed(wire177),
                           wire177[(2'h2):(1'h0)]} < ($unsigned((8'hb5)) - (wire174 ?
                           wire175 : wire181)))));
  assign wire189 = ({((-(wire181 ~^ reg183)) ?
                           (wire177 != $unsigned(wire178)) : $signed((reg184 ?
                               (8'ha7) : wire182))),
                       reg185} < {wire173[(1'h0):(1'h0)]});
endmodule
