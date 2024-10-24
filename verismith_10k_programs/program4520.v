module top
#(parameter param196 = ((-(^(!(!(7'h40))))) ~^ {(^~((^~(8'hbd)) - (!(8'ha6))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire184;
  wire signed [(4'h9):(1'h0)] wire186;
  reg [(4'hc):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg194 = (1'h0);
  reg [(5'h10):(1'h0)] reg193 = (1'h0);
  reg [(2'h2):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg190 = (1'h0);
  reg [(5'h11):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg188 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire58,
                 wire60,
                 wire61,
                 wire184,
                 wire186,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 (1'h0)};
  assign wire5 = (wire1 & (-wire0));
  assign wire6 = $signed((8'hb3));
  assign wire7 = wire1;
  module8 #() modinst59 (wire58, clk, wire7, wire1, wire0, wire3);
  assign wire60 = $unsigned((+((8'ha4) | wire7[(3'h7):(1'h0)])));
  assign wire61 = ((((|(wire60 ^~ wire58)) ^~ {(wire4 ? wire7 : (8'ha2))}) ?
                          ($unsigned((~|wire60)) ^~ ($unsigned(wire4) + wire2)) : $signed({(~|(8'hbf))})) ?
                      wire0 : $unsigned(wire60));
  module62 #() modinst185 (wire184, clk, wire5, wire61, wire6, wire2);
  module67 #() modinst187 (.wire70(wire4), .wire72(wire60), .y(wire186), .wire68(wire58), .wire69(wire184), .wire71(wire2), .clk(clk));
  always
    @(posedge clk) begin
      if (($unsigned($signed($unsigned($unsigned(wire58)))) * $unsigned(wire60)))
        begin
          reg188 <= (&(wire0[(3'h5):(3'h5)] + $signed(($signed(wire184) && (wire1 <<< (8'ha5))))));
        end
      else
        begin
          if ((7'h43))
            begin
              reg188 <= wire61;
              reg189 <= wire58;
              reg190 <= (wire184 >>> {{wire1[(4'ha):(4'ha)]}, wire6});
              reg191 <= wire2;
              reg192 <= $unsigned($signed(wire1[(3'h5):(2'h3)]));
            end
          else
            begin
              reg188 <= {(wire7[(3'h7):(2'h2)] ?
                      $signed(wire1) : $signed($unsigned($unsigned((8'hbb)))))};
              reg189 <= wire4[(1'h0):(1'h0)];
              reg190 <= $signed(reg188[(2'h3):(2'h3)]);
            end
          reg193 <= (wire61 ?
              (((~|{wire184}) ?
                  {reg189[(1'h1):(1'h0)], (~|reg191)} : ((wire61 ?
                          reg188 : wire186) ?
                      (wire5 ?
                          (8'hb7) : (8'hbc)) : $signed((8'hb1)))) || $unsigned(reg191)) : (!wire3));
          reg194 <= reg193;
          reg195 <= reg188;
        end
    end
endmodule

module module62
#(parameter param183 = ((((((8'hb0) ? (8'h9c) : (8'hba)) ? ((8'ha9) ? (7'h43) : (7'h43)) : (~(8'h9e))) ? (((8'h9c) | (8'hbf)) != {(8'h9c), (8'h9d)}) : (-((8'h9f) ? (8'ha6) : (8'ha3)))) ? {(((8'hbd) ? (8'hb8) : (8'h9e)) > ((8'had) >= (8'haa)))} : (-((+(8'ha1)) > {(7'h43), (8'haf)}))) ? (8'ha1) : (-((!((8'hb5) ? (8'hba) : (8'hba))) ? (((7'h42) ? (8'hb5) : (8'ha6)) ~^ {(8'h9f)}) : (-(^(8'hbe)))))))
(y, clk, wire63, wire64, wire65, wire66);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire63;
  input wire signed [(5'h15):(1'h0)] wire64;
  input wire [(5'h12):(1'h0)] wire65;
  input wire [(5'h11):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire182;
  wire [(4'hb):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire177;
  wire signed [(3'h5):(1'h0)] wire176;
  wire signed [(5'h12):(1'h0)] wire175;
  wire signed [(3'h4):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire173;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire171;
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg [(5'h14):(1'h0)] reg179 = (1'h0);
  assign y = {wire182,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire102,
                 wire171,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  module67 #() modinst103 (wire102, clk, wire65, wire64, wire63, wire66, (8'had));
  module104 #() modinst172 (wire171, clk, wire66, wire102, wire63, wire65, wire64);
  assign wire173 = ($signed(wire66) + (wire63 && $signed($signed(wire171))));
  assign wire174 = (($unsigned((((8'hb1) ?
                       wire63 : wire66) ^~ $unsigned(wire102))) >> $signed(((wire63 != (8'hbb)) ?
                       $signed(wire173) : wire173))) >> wire63[(5'h12):(4'he)]);
  assign wire175 = {(wire171 ?
                           (($signed(wire66) ? (wire64 == wire64) : wire174) ?
                               (wire63 ?
                                   ((8'h9e) | (8'ha2)) : $signed(wire171)) : (~|(wire66 - wire66))) : $signed((!wire102)))};
  assign wire176 = wire173;
  assign wire177 = (-(8'ha8));
  assign wire178 = wire64[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg179 <= ($signed(($signed(wire175) && (wire64 ?
          ((7'h43) >= wire171) : $signed(wire176)))) == $unsigned((!$signed(wire176[(2'h2):(1'h0)]))));
      reg180 <= wire102;
      reg181 <= (reg179 ?
          {{wire175[(4'hb):(1'h1)], $unsigned((wire171 ^~ wire176))}} : reg179);
    end
  assign wire182 = (((|wire176) != (&wire63[(3'h4):(2'h2)])) ?
                       $signed(((8'ha2) & ($unsigned(reg181) ?
                           (8'hba) : (8'hb8)))) : (+($signed((-wire177)) - wire63)));
endmodule

module module8
#(parameter param56 = ((({((8'ha8) - (8'hb6))} | ((~&(8'hb3)) ? ((8'hb7) ? (7'h41) : (8'hbb)) : (8'hbf))) > (-(!((8'ha2) ? (8'hbf) : (8'ha1))))) ? (((|((8'ha7) == (8'hbc))) > {(8'h9d), ((8'ha7) <<< (8'hae))}) ? ((+((8'h9f) & (8'hba))) | ((!(8'hab)) < (!(8'ha0)))) : (!(-((7'h42) - (7'h42))))) : ({(~&((8'h9e) <= (8'hb8)))} ? {({(8'hb8), (8'hb3)} << ((7'h41) ? (8'hb1) : (8'h9d)))} : {((!(8'hb7)) ? ((8'ha3) ? (8'h9d) : (8'ha9)) : {(8'hbd)}), ((!(8'ha5)) ? ((8'h9d) ? (8'hb2) : (7'h43)) : ((7'h43) - (7'h42)))})), 
parameter param57 = (+(({(!param56)} ? {{param56, param56}} : ((param56 <= (8'hb6)) ? ((8'ha2) * param56) : ((8'hbc) ? param56 : (7'h40)))) >= param56)))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire49;
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire49,
                 (1'h0)};
  assign wire13 = ({(wire12 ?
                              $unsigned((wire10 | (8'ha5))) : $unsigned($unsigned(wire12)))} ?
                      $signed((-((8'hb4) ?
                          (wire12 && (8'h9f)) : $unsigned(wire9)))) : $signed($signed($signed($unsigned(wire9)))));
  assign wire14 = wire11[(1'h0):(1'h0)];
  assign wire15 = $signed((wire11[(3'h5):(1'h0)] < wire13));
  assign wire16 = (~&wire10);
  module17 #() modinst50 (wire49, clk, wire16, wire10, wire15, wire11, wire13);
  assign wire51 = $unsigned((wire9 ?
                      $signed(wire11) : (($signed(wire49) ^ (^~wire12)) & ((~&wire15) ?
                          (wire10 ? wire15 : wire15) : $signed(wire13)))));
  assign wire52 = {(-(!$unsigned($signed(wire14)))), wire9[(2'h2):(1'h1)]};
  assign wire53 = (&(|$unsigned(((wire49 ?
                      wire16 : wire15) <= (wire9 >> wire16)))));
  assign wire54 = $signed(((~^$unsigned($unsigned((8'h9c)))) ?
                      ($unsigned((8'ha5)) && $unsigned(wire9)) : (((wire9 ?
                          wire53 : wire14) <= wire13) & ((wire13 <<< (8'hae)) ^~ wire52))));
  assign wire55 = (^~(~$unsigned(wire52)));
endmodule

module module17
#(parameter param47 = ((^~(({(8'ha0)} && (~&(8'hb0))) & (((8'h9d) > (8'hb9)) ^ {(8'hbe), (8'hb5)}))) << ((((~&(8'hba)) ? (~^(8'hac)) : (!(8'hb0))) << (-{(8'haf)})) ? ((((8'hb0) < (8'hb9)) << ((8'hb7) > (8'haf))) != (((7'h41) ? (8'ha6) : (8'hb6)) ? ((8'hb6) ? (8'hb3) : (8'ha7)) : (&(8'hb8)))) : ((+((8'hb8) ? (8'hb5) : (8'h9e))) >> {((8'hba) ? (8'hb4) : (7'h44))}))), 
parameter param48 = (({{(param47 ? param47 : param47), param47}, ((param47 ? param47 : param47) * param47)} & (-(~^param47))) ? ((~^((^param47) >= param47)) || (param47 ? ((param47 ? param47 : (7'h40)) + (^~param47)) : {(param47 >> param47)})) : ({((^~param47) ^~ {param47})} <<< ((~(param47 ? (8'hb0) : param47)) ? (8'hb8) : {(param47 << param47), (8'hab)}))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  input wire [(5'h11):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire27,
                 wire26,
                 wire24,
                 wire23,
                 reg30,
                 reg29,
                 reg28,
                 reg25,
                 (1'h0)};
  assign wire23 = wire18;
  assign wire24 = $signed(wire20[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg25 <= ((~^wire20) | $signed($unsigned($unsigned((wire23 ?
          (8'h9c) : (8'hb6))))));
    end
  assign wire26 = wire24[(4'hb):(4'hb)];
  assign wire27 = $signed((reg25[(2'h2):(1'h1)] ?
                      ((-{wire22}) ?
                          {$signed(wire23)} : (^$signed(wire20))) : ({(wire18 + wire21)} ?
                          wire18 : (-wire18[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg28 <= $signed({$signed(wire26[(4'h8):(3'h5)]),
          $signed(((!wire26) ^~ (wire21 == reg25)))});
      reg29 <= wire24[(3'h4):(1'h0)];
      if ((~^((!$unsigned((wire23 | (7'h43)))) < $signed((~wire19)))))
        begin
          reg30 <= (^$unsigned(wire20));
        end
      else
        begin
          reg30 <= reg30;
        end
    end
  assign wire31 = $signed(wire18);
  assign wire32 = ((^~((wire22[(3'h6):(1'h0)] ?
                          $unsigned(reg30) : {wire20, wire18}) ?
                      wire22 : ((reg29 <<< wire21) ?
                          $signed(wire26) : $signed(wire19)))) <<< (wire26 ~^ {$signed((-wire21))}));
  assign wire33 = {($signed($unsigned($unsigned(wire32))) ?
                          wire19[(4'he):(1'h1)] : ($signed(wire22) ?
                              (-{wire27, wire27}) : {(wire22 != wire19),
                                  {reg28}}))};
  assign wire34 = $unsigned(((~reg30[(3'h6):(1'h1)]) + reg28));
  assign wire35 = reg25;
  assign wire36 = wire31;
  assign wire37 = wire18[(2'h3):(2'h2)];
  assign wire38 = wire37[(1'h1):(1'h1)];
  assign wire39 = reg25[(4'hb):(3'h7)];
  assign wire40 = (({{(wire23 || wire20)}, {reg29, ((8'haa) ^ (7'h42))}} ?
                          wire34 : ({$signed(wire23),
                              wire20[(4'he):(4'he)]} << wire34)) ?
                      (({$signed((8'hbc))} ?
                              ((wire18 ~^ wire23) & (&wire20)) : $unsigned(wire32[(2'h2):(2'h2)])) ?
                          (($unsigned((8'hb2)) ?
                              (+wire22) : ((8'h9d) <<< reg28)) | ({wire31,
                                  wire32} ?
                              $signed(wire21) : wire20)) : (reg25 ^ (wire33[(4'ha):(3'h5)] ~^ (^wire38)))) : wire18);
  assign wire41 = wire37;
  assign wire42 = $signed($signed(((~&wire21[(3'h5):(1'h0)]) ?
                      $unsigned($signed(wire39)) : wire21[(4'h8):(4'h8)])));
  assign wire43 = (($signed(wire34[(1'h0):(1'h0)]) ?
                      (reg29[(2'h2):(2'h2)] ?
                          $signed((~wire23)) : wire19) : (((wire32 ?
                              wire31 : (8'ha0)) ?
                          (^~wire35) : (8'hb1)) ~^ ((!wire24) ?
                          $unsigned((8'hb2)) : (wire23 && wire24)))) ~^ $signed($signed(wire27[(4'hf):(3'h7)])));
  assign wire44 = (^$unsigned(($signed($unsigned(wire33)) ?
                      wire35[(1'h1):(1'h0)] : ({(8'hae), (8'ha0)} ?
                          (wire19 ? wire43 : (8'had)) : (^wire35)))));
  assign wire45 = $signed({$unsigned(({(8'hb1)} > {(8'hb3)}))});
  assign wire46 = ((~|$signed((!wire27[(5'h14):(5'h13)]))) && (~|wire44));
endmodule

module module104
#(parameter param170 = ((8'hb2) | ({((7'h44) ? {(7'h43)} : ((8'had) * (8'had)))} == (({(8'ha8), (8'hb9)} ? ((8'ha4) != (8'h9e)) : ((8'hbd) * (8'hbf))) | (^~(|(8'hb0)))))))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h2db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire109;
  input wire signed [(5'h13):(1'h0)] wire108;
  input wire signed [(2'h2):(1'h0)] wire107;
  input wire [(5'h12):(1'h0)] wire106;
  input wire signed [(4'he):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire169;
  wire signed [(3'h6):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  wire signed [(4'hc):(1'h0)] wire157;
  wire signed [(4'he):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire signed [(3'h6):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire143;
  wire [(4'h8):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire133;
  wire [(3'h5):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  reg [(5'h12):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg signed [(4'he):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire157,
                 wire156,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire133,
                 wire132,
                 wire111,
                 wire110,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg155,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
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
                 (1'h0)};
  assign wire110 = $unsigned(({($signed(wire107) ?
                               {wire105} : $unsigned(wire105)),
                           (^~$unsigned(wire105))} ?
                       (($signed(wire106) ?
                           (wire106 != wire109) : wire105[(2'h2):(2'h2)]) ~^ $unsigned($unsigned(wire109))) : (wire106 ^~ wire108)));
  assign wire111 = $unsigned(wire105[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ($signed({$unsigned(wire108),
          {(wire105[(4'ha):(3'h4)] ?
                  (wire107 != wire106) : (wire110 ? wire108 : (8'hb4))),
              ((~|wire110) ? (wire106 ? wire107 : wire105) : wire106)}}))
        begin
          reg112 <= (+(({(wire109 * wire107)} >>> (^~wire111[(1'h0):(1'h0)])) ?
              $signed(wire107[(1'h0):(1'h0)]) : (&wire107)));
          if ($signed(wire111[(3'h6):(1'h1)]))
            begin
              reg113 <= ($signed((wire110 ?
                  ($signed(wire110) ?
                      wire110 : wire107) : (&$unsigned(wire108)))) && wire109[(4'hc):(1'h1)]);
            end
          else
            begin
              reg113 <= wire111;
              reg114 <= (((^~($signed(reg112) - $unsigned(wire109))) ?
                      ($unsigned(wire107[(1'h1):(1'h1)]) != (-$signed(reg113))) : ($unsigned((wire109 ?
                          reg113 : wire108)) < $unsigned((~^wire109)))) ?
                  wire108 : ({((wire108 | reg112) ?
                              (wire106 ?
                                  wire105 : wire110) : (wire107 ~^ (8'hac)))} ?
                      (((reg112 ? (8'ha8) : wire109) >>> $unsigned(wire110)) ?
                          $unsigned((+(8'hb9))) : $signed($unsigned((8'hb3)))) : ((~(wire106 && wire106)) ?
                          (wire110[(4'h8):(2'h3)] >> $unsigned((8'h9c))) : (^$unsigned(wire110)))));
            end
          if ((^~(wire105[(1'h0):(1'h0)] ?
              reg114 : (({(8'ha7)} ?
                  (wire111 + (8'ha5)) : (wire105 >>> reg113)) <= ($unsigned(reg112) + {wire107,
                  (8'hb2)})))))
            begin
              reg115 <= wire108[(1'h1):(1'h0)];
              reg116 <= ($unsigned({(+{wire107}),
                  $signed($unsigned(wire111))}) == $unsigned(wire107));
              reg117 <= (~|(reg112 ?
                  ((!$signed(reg112)) ?
                      wire105 : $signed($signed((8'hb1)))) : ({wire105,
                          (reg112 ? wire109 : wire106)} ?
                      (8'hb0) : reg113[(4'hb):(3'h5)])));
              reg118 <= ($signed((~&$unsigned((wire105 ^~ (8'ha6))))) || reg115);
              reg119 <= ($unsigned(reg117) ?
                  (~($signed((wire109 ? wire105 : reg114)) ?
                      (((8'ha5) + wire105) ?
                          reg117[(4'h9):(3'h7)] : (wire109 ?
                              reg114 : reg112)) : wire106[(1'h0):(1'h0)])) : $signed($signed({$unsigned(reg115),
                      $signed(wire110)})));
            end
          else
            begin
              reg115 <= reg118[(4'hb):(3'h4)];
              reg116 <= (~wire108[(5'h11):(2'h3)]);
              reg117 <= $signed({reg116[(3'h7):(2'h2)]});
              reg118 <= wire108[(4'h8):(3'h7)];
            end
          reg120 <= $signed(((-$unsigned((reg119 ?
              (7'h43) : reg119))) != ($unsigned(wire110) ?
              $signed(((8'ha2) ? wire107 : reg117)) : reg117)));
          reg121 <= $unsigned(((!(~&$signed(wire109))) <<< $unsigned($unsigned(((8'ha1) <= wire108)))));
        end
      else
        begin
          reg112 <= $signed((-((reg117 ?
              (wire108 ^~ reg121) : wire107[(2'h2):(1'h1)]) > $unsigned($unsigned(wire107)))));
          reg113 <= reg119;
        end
      reg122 <= (({((8'ha8) >>> wire110[(3'h5):(1'h0)]),
              $signed((reg112 >= wire107))} ?
          wire110[(4'hb):(2'h3)] : (!reg118[(4'hf):(3'h6)])) <<< (wire107[(2'h2):(1'h1)] ?
          {reg117[(1'h0):(1'h0)]} : (~^$signed((reg116 ? reg118 : (8'hae))))));
      if ((&(reg120[(3'h5):(3'h5)] ?
          wire105 : (($signed(reg118) != (reg113 ^~ reg119)) ?
              (wire107[(2'h2):(1'h1)] && $signed((8'h9c))) : $signed((~&reg119))))))
        begin
          reg123 <= reg121;
          reg124 <= ((^~(8'ha2)) ?
              wire105 : $signed($signed({{reg115}, wire110[(3'h7):(3'h5)]})));
        end
      else
        begin
          reg123 <= {$signed((^reg114[(3'h6):(3'h6)])), (~$unsigned(reg112))};
          if (({((^{wire109}) ?
                      (-(wire107 | reg115)) : $unsigned(((8'hb9) >>> wire107))),
                  (({reg123,
                      reg122} ^~ {reg112}) && (wire111[(2'h3):(2'h2)] && (^~wire111)))} ?
              reg119 : {$unsigned($signed($signed(reg123))),
                  $unsigned($signed(wire107))}))
            begin
              reg124 <= ((wire106[(3'h7):(3'h5)] ?
                      $signed(($signed(wire105) ?
                          reg115 : (8'ha4))) : ({{reg114, (8'ha3)}} ?
                          (^~$unsigned(wire106)) : ({reg117,
                              reg121} >> ((8'ha2) <= wire107)))) ?
                  $signed(reg124) : $signed(({(reg116 * reg116),
                      $signed(wire107)} ^~ reg114)));
              reg125 <= ((-$unsigned($signed((reg116 ?
                  wire105 : (8'ha4))))) != (reg124 < $signed(reg115)));
              reg126 <= $signed((!($unsigned(reg112[(4'hc):(4'h9)]) && reg114)));
            end
          else
            begin
              reg124 <= $unsigned(($unsigned($signed($signed((8'ha1)))) ?
                  (reg116[(1'h1):(1'h1)] | $signed(reg119)) : reg115));
            end
          reg127 <= (reg115[(3'h5):(1'h0)] | ((($signed(reg118) ?
                  $unsigned(reg124) : reg117) ?
              {reg118, $signed(reg118)} : reg122) <<< reg115[(3'h5):(3'h4)]));
          reg128 <= $signed(wire110[(3'h4):(2'h2)]);
          reg129 <= (reg123 >> reg114[(1'h1):(1'h1)]);
        end
      reg130 <= {reg127,
          (((reg114 >>> (+wire107)) ^ reg115[(4'hc):(2'h2)]) ?
              $unsigned({$signed(reg117), (~|reg129)}) : reg124)};
      reg131 <= {(reg120[(2'h3):(2'h3)] >= ($signed((~reg114)) ?
              (!$unsigned(reg124)) : {(~reg126)}))};
    end
  assign wire132 = wire106[(4'hd):(4'ha)];
  assign wire133 = (reg118[(5'h14):(3'h5)] * ($signed(reg117[(3'h5):(2'h2)]) ?
                       $signed(reg117) : ($unsigned((+reg114)) ?
                           ($unsigned((8'hbe)) ?
                               reg114[(1'h1):(1'h0)] : (wire107 || reg113)) : $unsigned($unsigned(reg125)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire109[(3'h4):(2'h2)]))
        begin
          if ((&(+wire111)))
            begin
              reg134 <= (~|(7'h42));
            end
          else
            begin
              reg134 <= wire133;
              reg135 <= ((&reg119) ?
                  {({{(8'hba)},
                          (^~reg114)} <= reg121[(3'h5):(1'h0)])} : $unsigned(reg126));
              reg136 <= ($signed($signed(reg126)) == $unsigned(reg121[(3'h4):(1'h1)]));
              reg137 <= reg115[(4'hc):(3'h7)];
              reg138 <= (|(~|(8'hba)));
            end
          reg139 <= (~|(!$signed({{wire111}})));
        end
      else
        begin
          reg134 <= ((!(reg112 <<< reg137)) ?
              reg135 : (wire108 >>> (reg138[(3'h6):(1'h0)] < {(-wire109)})));
          reg135 <= reg127;
          reg136 <= reg130[(4'hb):(4'h9)];
          reg137 <= $unsigned(wire106);
          if ((&(((^~(~^reg116)) <<< (~&$signed(reg120))) ?
              $signed($signed(reg138[(4'hf):(3'h6)])) : {$unsigned(reg134[(4'hb):(1'h0)]),
                  wire107[(1'h0):(1'h0)]})))
            begin
              reg138 <= reg121[(3'h6):(2'h3)];
              reg139 <= ($signed($unsigned(reg129[(3'h5):(2'h2)])) > $signed((~^((reg131 <<< (8'hbb)) != (reg135 ?
                  wire105 : (8'hae))))));
            end
          else
            begin
              reg138 <= ((!(({wire107} * (8'hbf)) || $unsigned((^~reg138)))) ?
                  wire105 : (~^(8'hae)));
            end
        end
      reg140 <= $signed((~(~$unsigned((wire111 ? wire109 : reg124)))));
      reg141 <= ((8'haf) ? reg136 : wire108);
    end
  assign wire142 = reg140[(2'h3):(1'h0)];
  assign wire143 = $signed(reg112[(3'h5):(1'h1)]);
  assign wire144 = $signed(($unsigned(((!(8'hb3)) ?
                           {wire105} : $signed(reg137))) ?
                       ((|$signed(reg129)) <= $unsigned((reg134 >> wire111))) : (($signed(reg134) ^~ reg121) ~^ reg123)));
  assign wire145 = (reg120[(3'h7):(1'h1)] ?
                       reg117[(3'h4):(1'h0)] : ($unsigned(((7'h42) + (wire144 ?
                               reg126 : wire132))) ?
                           $unsigned($signed((reg119 ?
                               reg125 : reg119))) : (&$signed($unsigned(wire109)))));
  always
    @(posedge clk) begin
      reg146 <= (~(&((|$unsigned(reg123)) ?
          (&$signed(reg115)) : $signed(((8'hb6) + reg137)))));
      reg147 <= $unsigned(reg136);
      reg148 <= (!reg129);
      reg149 <= reg146;
    end
  assign wire150 = (reg117 ?
                       (|wire105[(1'h1):(1'h0)]) : ($signed((reg113[(4'he):(3'h4)] ?
                           (|wire143) : (wire144 <= (8'ha1)))) * ($unsigned(reg118) != {(reg149 >>> wire111)})));
  assign wire151 = $unsigned(((+(reg141 ? (7'h42) : wire109[(3'h4):(3'h4)])) ?
                       ((reg116 >> $unsigned(reg123)) && (8'hbb)) : (~&$signed($signed(wire133)))));
  assign wire152 = $signed(((&wire105) >= {$unsigned({(8'hb1), reg139})}));
  assign wire153 = $signed(reg125[(1'h0):(1'h0)]);
  assign wire154 = wire108[(5'h12):(4'ha)];
  always
    @(posedge clk) begin
      reg155 <= reg129;
    end
  assign wire156 = reg130[(4'hb):(4'ha)];
  assign wire157 = (~|$unsigned($unsigned(reg122[(4'ha):(4'h9)])));
  always
    @(posedge clk) begin
      reg158 <= $signed((reg115[(4'hd):(4'hd)] >>> $unsigned((~|wire152))));
      reg159 <= $signed((reg158 >= (&$signed((^~wire105)))));
      if (reg128[(2'h3):(2'h2)])
        begin
          if (($signed($unsigned(reg155[(2'h3):(2'h2)])) >>> (~|reg129)))
            begin
              reg160 <= wire145[(4'he):(3'h4)];
              reg161 <= $signed(reg135);
            end
          else
            begin
              reg160 <= $signed($signed((reg149[(1'h1):(1'h0)] ?
                  reg119 : $signed($unsigned(reg125)))));
              reg161 <= $unsigned((~|{reg155,
                  (wire106[(4'h9):(3'h4)] * $signed(wire143))}));
              reg162 <= reg130[(4'hd):(4'hd)];
              reg163 <= reg118;
              reg164 <= (|{wire142[(2'h2):(2'h2)], wire110});
            end
          reg165 <= ($unsigned($signed(((wire152 >> (8'ha7)) ?
                  $signed(wire107) : reg126))) ?
              (^~reg149[(3'h6):(3'h5)]) : reg115[(3'h6):(1'h1)]);
          reg166 <= (^(^~$unsigned((8'ha3))));
        end
      else
        begin
          reg160 <= reg166;
          reg161 <= (wire143[(3'h6):(2'h3)] + wire143[(4'he):(4'h9)]);
          reg162 <= ($unsigned((reg123 + $signed(wire157))) || (~^(~|{reg117,
              wire157})));
          reg163 <= (reg163 >> ((wire143 ^ (^(reg128 == reg159))) ?
              wire108[(5'h10):(2'h3)] : reg116));
          reg164 <= wire157[(4'ha):(4'ha)];
        end
    end
  assign wire167 = (~|($unsigned(((wire105 || reg129) ?
                           (&wire144) : (~^reg127))) ?
                       wire152[(4'h8):(3'h4)] : ($signed($signed(reg164)) || $unsigned((wire157 ?
                           reg165 : wire108)))));
  assign wire168 = (^wire107);
  assign wire169 = (reg148 & reg162);
endmodule

module module67  (y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire72;
  input wire [(5'h15):(1'h0)] wire71;
  input wire [(5'h14):(1'h0)] wire70;
  input wire [(4'hc):(1'h0)] wire69;
  input wire signed [(4'hc):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire73;
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  assign y = {wire101,
                 wire78,
                 wire77,
                 wire76,
                 wire73,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire73 = $unsigned((wire72[(3'h6):(2'h2)] >> (wire71 ?
                      (^(wire69 ? wire70 : wire72)) : wire71)));
  always
    @(posedge clk) begin
      reg74 <= (((~|({(8'hbb), wire69} >>> {wire70,
              wire71})) - $unsigned(wire70[(4'hf):(2'h3)])) ?
          ($unsigned(((^~wire68) == $unsigned((8'hbb)))) ?
              wire71[(5'h12):(4'hd)] : $signed({(^~(8'hba))})) : $signed(wire69[(1'h1):(1'h1)]));
      if (wire68)
        begin
          reg75 <= $unsigned(wire71[(5'h12):(4'he)]);
        end
      else
        begin
          reg75 <= (~|$unsigned((~|{(wire72 - wire68), wire71})));
        end
    end
  assign wire76 = wire73;
  assign wire77 = reg74;
  assign wire78 = reg74;
  always
    @(posedge clk) begin
      reg79 <= $signed(wire78[(1'h1):(1'h0)]);
      reg80 <= (wire73[(4'hb):(3'h5)] <<< wire68[(4'h9):(3'h5)]);
      if ((|(~^wire73[(3'h6):(2'h3)])))
        begin
          reg81 <= $unsigned($signed($unsigned({wire76, {wire72, wire76}})));
          if (reg80)
            begin
              reg82 <= ((wire72[(2'h2):(2'h2)] >= $signed({reg80[(2'h3):(1'h1)]})) ?
                  reg79 : ($signed((8'ha5)) ? wire76 : wire73));
              reg83 <= $unsigned($unsigned({wire71,
                  ($signed(wire76) ? $signed(reg80) : wire77)}));
            end
          else
            begin
              reg82 <= (~|((^wire70) == (wire71[(4'hb):(2'h3)] && (~&$signed(wire78)))));
              reg83 <= (($unsigned((reg80 >= wire73[(4'ha):(4'h9)])) ?
                  reg75[(3'h4):(1'h0)] : $unsigned({(&(8'had))})) == ({((reg80 > reg83) ?
                      wire77[(1'h1):(1'h0)] : reg75)} != wire73[(3'h6):(1'h0)]));
              reg84 <= $signed({((^~reg75) ?
                      wire69 : ($signed(wire68) ?
                          (reg83 >> reg82) : reg80[(3'h5):(3'h4)])),
                  $unsigned(reg75[(3'h4):(3'h4)])});
              reg85 <= wire72;
              reg86 <= wire73[(1'h1):(1'h1)];
            end
          if ((~&$signed((reg82[(2'h2):(2'h2)] ?
              ({reg85} ~^ $signed(reg83)) : $signed((reg82 ? reg82 : reg84))))))
            begin
              reg87 <= reg79[(5'h10):(3'h7)];
              reg88 <= {(wire76 ?
                      $signed(({(8'ha2)} ?
                          $unsigned(wire69) : reg83[(2'h2):(2'h2)])) : wire72[(2'h3):(2'h2)])};
              reg89 <= wire68[(2'h2):(1'h1)];
            end
          else
            begin
              reg87 <= {wire72};
              reg88 <= ($unsigned($signed(($signed(reg81) > reg80))) ?
                  $signed({wire71}) : {{$signed((8'ha2))}});
              reg89 <= (|$unsigned({($signed(wire70) - reg82)}));
              reg90 <= $unsigned((reg88[(1'h0):(1'h0)] <= wire69));
              reg91 <= (~&$unsigned($signed((~$unsigned(reg86)))));
            end
          reg92 <= (~$unsigned((($unsigned(reg91) ?
              $signed(reg88) : reg87) != $unsigned((8'had)))));
          if (((wire72 ?
              $unsigned(wire72[(2'h2):(1'h0)]) : $unsigned(wire78)) > (&$signed((~&$unsigned(reg80))))))
            begin
              reg93 <= {$unsigned(wire69[(4'h9):(3'h7)])};
              reg94 <= (~&$signed(reg93[(3'h6):(3'h4)]));
            end
          else
            begin
              reg93 <= ($unsigned({(&$signed(wire70))}) ^~ reg79);
              reg94 <= $signed((^reg87));
              reg95 <= (wire68[(3'h5):(1'h1)] ?
                  reg82[(3'h6):(2'h2)] : $unsigned($signed(($unsigned(reg90) ?
                      (wire71 < reg85) : (wire78 ? reg93 : wire71)))));
            end
        end
      else
        begin
          reg81 <= $signed(reg83);
        end
      reg96 <= wire73[(4'h9):(3'h7)];
      reg97 <= $signed(reg82);
    end
  always
    @(posedge clk) begin
      reg98 <= (!($unsigned(wire73) ?
          $unsigned((~&(reg84 ? wire69 : wire77))) : $unsigned(({(8'hbb),
              reg97} - ((8'h9e) ^ reg94)))));
      reg99 <= ($unsigned((~((~|reg74) ?
          $unsigned(wire73) : wire78))) <<< reg80);
      reg100 <= $signed(reg96);
    end
  assign wire101 = $signed(({$signed({reg74, (8'hb4)})} > $unsigned(((8'hae) ?
                       reg86 : (wire68 >>> (8'had))))));
endmodule
