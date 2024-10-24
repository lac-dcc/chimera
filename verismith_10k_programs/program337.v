module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire159;
  wire signed [(4'h8):(1'h0)] wire160;
  wire signed [(4'hd):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire242;
  reg signed [(4'h8):(1'h0)] reg246 = (1'h0);
  reg [(5'h12):(1'h0)] reg245 = (1'h0);
  reg [(4'ha):(1'h0)] reg244 = (1'h0);
  assign y = {wire142,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire157,
                 wire159,
                 wire160,
                 wire161,
                 wire162,
                 wire242,
                 reg246,
                 reg245,
                 reg244,
                 (1'h0)};
  assign wire4 = {{wire3, {$unsigned(wire0), ((8'h9e) | wire3[(3'h6):(2'h3)])}},
                     $signed(wire2[(4'hc):(4'ha)])};
  assign wire5 = (($unsigned({wire3[(2'h2):(1'h0)], ((8'ha4) ^~ wire2)}) ?
                         $signed(($signed((8'ha1)) ~^ wire0[(1'h0):(1'h0)])) : (wire4[(3'h4):(2'h3)] ?
                             ($signed(wire0) ?
                                 $unsigned(wire4) : wire1[(3'h7):(3'h5)]) : (|wire1[(4'h8):(3'h6)]))) ?
                     ((^((wire0 ?
                         (8'haa) : wire2) > (wire4 + wire1))) == $unsigned((8'hbe))) : (wire4[(2'h3):(1'h0)] <<< $signed(((wire2 < wire2) ?
                         $unsigned(wire2) : (+wire3)))));
  assign wire6 = wire2[(2'h3):(2'h2)];
  assign wire7 = wire2[(5'h11):(5'h11)];
  module8 #() modinst143 (.wire10(wire4), .wire12(wire7), .wire13(wire2), .clk(clk), .wire9(wire1), .y(wire142), .wire11(wire0));
  module144 #() modinst158 (.wire147(wire4), .y(wire157), .wire148(wire3), .wire145(wire5), .clk(clk), .wire146(wire0));
  assign wire159 = (^wire3[(4'hb):(1'h1)]);
  assign wire160 = $unsigned((wire142[(2'h2):(2'h2)] << {($signed(wire3) + wire5)}));
  assign wire161 = (8'hbb);
  assign wire162 = (wire159 ?
                       wire160[(1'h0):(1'h0)] : $signed(wire7[(4'ha):(4'h8)]));
  module163 #() modinst243 (wire242, clk, wire142, wire161, wire0, wire3, wire2);
  always
    @(posedge clk) begin
      reg244 <= $signed(wire242);
      reg245 <= wire142[(4'h8):(3'h7)];
      reg246 <= wire7[(5'h12):(4'he)];
    end
endmodule

module module163
#(parameter param240 = (((({(8'ha7)} ? ((8'hbd) ? (8'ha5) : (8'hb5)) : (+(8'ha9))) ^ ({(8'hb5), (8'h9d)} ? {(8'hab)} : ((8'ha8) ? (7'h44) : (8'hbf)))) ? (~^(((8'hbc) && (7'h40)) ? ((8'hae) ? (8'hbd) : (8'h9e)) : (!(8'ha3)))) : (((&(8'hb8)) ? ((8'hb8) ? (8'hb7) : (8'h9d)) : ((8'ha6) << (8'ha9))) ? (~|(!(8'ha1))) : (((8'hbd) ? (8'ha5) : (8'hbd)) <= ((8'hba) ^~ (8'hb6))))) ? (((((8'h9c) ? (8'hbb) : (8'hb0)) * ((8'hb6) > (7'h40))) && {((7'h41) - (8'hbf))}) << ((((8'hac) >= (8'hbf)) ? ((8'hae) >> (8'h9c)) : (~|(7'h42))) - {((8'ha3) ? (8'ha9) : (8'hb9)), {(8'hb0)}})) : (8'ha9)), 
parameter param241 = (param240 ? (|(~(~&param240))) : param240))
(y, clk, wire168, wire167, wire166, wire165, wire164);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire168;
  input wire signed [(4'hd):(1'h0)] wire167;
  input wire signed [(5'h12):(1'h0)] wire166;
  input wire signed [(4'hb):(1'h0)] wire165;
  input wire [(5'h14):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire235;
  wire [(3'h6):(1'h0)] wire234;
  wire signed [(5'h10):(1'h0)] wire233;
  wire signed [(3'h5):(1'h0)] wire232;
  wire [(4'hf):(1'h0)] wire231;
  wire signed [(4'hc):(1'h0)] wire230;
  wire [(4'he):(1'h0)] wire229;
  wire [(3'h4):(1'h0)] wire213;
  wire signed [(4'ha):(1'h0)] wire212;
  wire [(4'hd):(1'h0)] wire211;
  wire [(3'h5):(1'h0)] wire210;
  wire signed [(5'h14):(1'h0)] wire209;
  wire signed [(5'h10):(1'h0)] wire208;
  wire signed [(5'h12):(1'h0)] wire207;
  wire signed [(4'hf):(1'h0)] wire206;
  wire signed [(4'h8):(1'h0)] wire205;
  wire signed [(5'h14):(1'h0)] wire204;
  wire [(2'h2):(1'h0)] wire203;
  wire [(5'h14):(1'h0)] wire201;
  wire signed [(4'hb):(1'h0)] wire170;
  wire [(5'h10):(1'h0)] wire169;
  reg [(5'h13):(1'h0)] reg239 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg238 = (1'h0);
  reg [(4'hf):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg236 = (1'h0);
  reg [(3'h6):(1'h0)] reg228 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg227 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg226 = (1'h0);
  reg [(5'h11):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg224 = (1'h0);
  reg [(4'ha):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg222 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg219 = (1'h0);
  reg [(5'h10):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg216 = (1'h0);
  reg [(4'h8):(1'h0)] reg215 = (1'h0);
  reg [(5'h14):(1'h0)] reg214 = (1'h0);
  assign y = {wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire201,
                 wire170,
                 wire169,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 (1'h0)};
  assign wire169 = $signed((-(|wire166[(3'h6):(1'h1)])));
  assign wire170 = wire169;
  module171 #() modinst202 (wire201, clk, wire164, wire167, wire166, wire169);
  assign wire203 = wire168[(1'h1):(1'h0)];
  assign wire204 = ($signed($unsigned(((wire165 ?
                           wire165 : wire168) << (&wire168)))) ?
                       ((((wire165 ?
                               wire168 : wire165) * $signed((8'hbc))) != ((wire164 ?
                                   wire164 : wire201) ?
                               (wire168 ? wire167 : wire166) : (wire164 ?
                                   wire167 : wire164))) ?
                           wire165 : (wire203 != ((wire167 ?
                                   wire166 : (8'h9c)) ?
                               (~^wire201) : $unsigned(wire201)))) : {({$unsigned(wire201)} >= {(-wire167),
                               (wire169 - wire166)}),
                           wire170[(4'hb):(3'h6)]});
  assign wire205 = (($unsigned(wire170) || $signed(((wire170 || wire167) ?
                           (wire165 ? wire204 : wire164) : $signed((8'ha9))))) ?
                       $signed({$signed((wire204 << wire168))}) : wire166[(2'h3):(2'h3)]);
  assign wire206 = $signed((^~((wire166 ?
                           ((8'ha5) << (8'hbe)) : $unsigned((8'hb6))) ?
                       wire170 : ($unsigned(wire166) ?
                           (wire167 ^~ wire165) : (~|wire164)))));
  assign wire207 = $unsigned((wire167[(3'h7):(3'h6)] ^ ({$signed(wire166)} ?
                       wire169 : ($unsigned(wire203) ?
                           (wire203 ~^ wire164) : $signed(wire204)))));
  assign wire208 = $signed((~&($unsigned($unsigned(wire168)) || wire169)));
  assign wire209 = $unsigned((($signed($unsigned(wire166)) ~^ (wire170 >>> (~|(8'h9d)))) ?
                       wire170[(3'h6):(2'h3)] : wire169));
  assign wire210 = $unsigned((wire165 < $signed((wire206 ?
                       wire165 : wire201[(5'h11):(4'ha)]))));
  assign wire211 = ((-$signed(wire167[(4'h8):(2'h2)])) ?
                       wire210 : wire166[(4'h9):(3'h7)]);
  assign wire212 = wire164[(4'hf):(4'hc)];
  assign wire213 = wire204;
  always
    @(posedge clk) begin
      reg214 <= (wire201[(4'hb):(4'ha)] ?
          $unsigned($signed(wire213[(2'h2):(1'h0)])) : ((wire206 ?
              {$signed(wire168), {wire207}} : ({(8'ha5), wire169} ?
                  wire213 : (wire208 ? wire166 : wire211))) & (wire201 ?
              $unsigned(((8'ha5) ? wire212 : wire164)) : (8'ha2))));
      if (wire166[(5'h11):(4'hd)])
        begin
          reg215 <= ($unsigned({(wire213[(3'h4):(2'h2)] ?
                      wire213[(3'h4):(2'h3)] : reg214)}) ?
              $unsigned(($unsigned((~wire165)) ?
                  ($unsigned((8'hb9)) ^~ reg214) : wire169[(4'hc):(3'h7)])) : ({(wire208[(1'h0):(1'h0)] ?
                      wire204 : ((8'h9d) ^~ wire166))} - $signed({(wire210 << wire169),
                  {wire210}})));
          if ((^(($unsigned(wire167[(4'ha):(1'h0)]) ?
                  ((wire213 ? wire206 : (7'h40)) ?
                      wire164 : reg215[(2'h2):(1'h0)]) : (8'hb6)) ?
              (|((&wire208) != (!wire167))) : wire201[(4'hf):(2'h2)])))
            begin
              reg216 <= $signed($signed($signed($unsigned($unsigned(wire170)))));
              reg217 <= {(((^$unsigned(wire210)) * $signed($unsigned((8'haa)))) >>> $signed((-(wire169 > wire210))))};
              reg218 <= ($signed($signed((wire211 <<< (8'ha1)))) != ((^~wire170[(3'h7):(3'h5)]) ?
                  $signed(((wire212 & wire206) ?
                      (wire210 <<< wire164) : (reg217 - wire168))) : $unsigned($signed(wire209))));
            end
          else
            begin
              reg216 <= ((~&$signed((reg218 >>> wire203[(1'h0):(1'h0)]))) ?
                  (~^$unsigned($signed(reg216))) : reg216);
              reg217 <= {(|wire206),
                  $unsigned((~^$signed(wire164[(4'hd):(4'hc)])))};
              reg218 <= $signed(wire204[(4'hb):(1'h1)]);
            end
          reg219 <= $unsigned((|{((~|wire166) >= $signed(wire170))}));
          if (wire212[(1'h0):(1'h0)])
            begin
              reg220 <= ((8'hb9) ?
                  (((~&((8'hb9) ? wire206 : wire208)) ?
                          $signed($unsigned(wire212)) : {((8'ha5) + (8'h9e)),
                              {wire213}}) ?
                      wire213[(1'h1):(1'h0)] : (wire209[(1'h1):(1'h1)] ?
                          $signed($unsigned((8'hbe))) : ($signed(wire206) ?
                              $signed(wire205) : (wire207 ~^ reg216)))) : $signed(({wire168[(4'h9):(2'h2)]} | $signed((wire169 < wire165)))));
              reg221 <= $unsigned(reg215[(3'h7):(2'h2)]);
              reg222 <= wire209[(4'h9):(2'h2)];
              reg223 <= wire203;
              reg224 <= $signed($unsigned(($signed((^wire203)) >> ((^wire168) ?
                  (wire213 ? reg222 : (8'h9e)) : {reg218}))));
            end
          else
            begin
              reg220 <= ($signed((+$signed(reg221))) < reg214[(3'h7):(3'h6)]);
              reg221 <= wire207[(3'h7):(3'h5)];
              reg222 <= reg222[(3'h6):(3'h5)];
              reg223 <= (~($signed(((8'had) - (|wire168))) > (reg219[(2'h2):(1'h1)] ?
                  ($signed((8'h9f)) && wire209) : $signed(reg218))));
              reg224 <= (^(reg224 ?
                  ($signed((wire167 & wire213)) ?
                      {$signed(wire213),
                          (^~reg223)} : reg215[(2'h2):(1'h1)]) : wire167));
            end
          if ((~^{$unsigned($signed(wire212)), $signed(reg221)}))
            begin
              reg225 <= wire213;
              reg226 <= ((!reg214[(3'h4):(1'h1)]) <<< (^~wire170));
              reg227 <= (wire209 + wire203);
              reg228 <= $signed((((^~((8'had) == wire165)) ? wire208 : reg219) ?
                  ($unsigned(reg216[(4'hf):(1'h1)]) ?
                      {(reg226 & reg226),
                          ((8'ha5) ?
                              reg216 : wire165)} : wire211) : $unsigned($signed(((8'hb2) ?
                      wire164 : reg224)))));
            end
          else
            begin
              reg225 <= wire203[(1'h1):(1'h0)];
              reg226 <= (~&$unsigned(wire207[(4'h9):(3'h7)]));
              reg227 <= $signed(((wire212[(3'h4):(1'h0)] ?
                      (-(+reg224)) : (|wire212[(2'h3):(1'h1)])) ?
                  {reg215[(2'h3):(1'h1)],
                      {wire168[(3'h6):(3'h4)],
                          (wire201 ? reg227 : wire210)}} : (8'ha9)));
            end
        end
      else
        begin
          reg215 <= $signed((reg221[(3'h6):(1'h1)] & ($signed((-reg214)) ?
              wire201[(4'h9):(3'h5)] : (reg220 >>> $signed((8'ha8))))));
          reg216 <= (^~$unsigned(reg222));
          if ($unsigned((($unsigned({(8'hb2),
              wire164}) && $unsigned((-wire168))) ^ $signed((|{reg227,
              reg224})))))
            begin
              reg217 <= wire165;
              reg218 <= wire168[(4'h9):(3'h5)];
              reg219 <= wire168;
              reg220 <= reg216[(4'hb):(4'h9)];
              reg221 <= (reg219 ?
                  wire205[(3'h4):(2'h2)] : $unsigned((|((reg219 ~^ reg223) ?
                      (wire170 ^~ wire203) : reg224[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg217 <= wire201[(4'h9):(1'h1)];
              reg218 <= ($signed(reg214[(3'h7):(1'h0)]) ?
                  ({(wire167 & (~^wire209)),
                      ($unsigned(wire209) ~^ ((8'ha8) ?
                          reg221 : wire167))} ^ wire166) : ($signed($signed($signed(reg217))) + reg215[(4'h8):(3'h7)]));
              reg219 <= $signed(reg225[(2'h3):(2'h2)]);
              reg220 <= $signed((~&(reg223 ?
                  wire208[(4'hd):(3'h6)] : wire208)));
              reg221 <= wire206[(4'hf):(4'he)];
            end
          if ($signed($signed($signed((~|(reg223 >>> reg226))))))
            begin
              reg222 <= wire167;
              reg223 <= $signed($signed((&$signed((wire201 ?
                  wire164 : reg217)))));
            end
          else
            begin
              reg222 <= (|reg218[(1'h0):(1'h0)]);
              reg223 <= $unsigned($signed($signed({$signed(reg223),
                  reg228[(3'h5):(2'h3)]})));
              reg224 <= wire209[(4'hf):(3'h4)];
              reg225 <= {(|$unsigned((7'h42)))};
            end
          reg226 <= $signed({(|($signed(wire165) & (&reg228)))});
        end
    end
  assign wire229 = wire205;
  assign wire230 = $unsigned(wire209);
  assign wire231 = reg219[(5'h12):(3'h6)];
  assign wire232 = (~wire210);
  assign wire233 = ((reg214[(4'hf):(2'h2)] ?
                           {$unsigned((^~reg226)),
                               reg224[(2'h2):(2'h2)]} : $unsigned($signed((!(7'h44))))) ?
                       reg215[(2'h2):(1'h0)] : reg220[(3'h4):(3'h4)]);
  assign wire234 = (+($signed($signed((wire165 ?
                       reg219 : wire168))) ~^ $unsigned(($unsigned(wire165) ?
                       (wire166 | wire201) : {wire170, reg225}))));
  assign wire235 = (!(8'hb5));
  always
    @(posedge clk) begin
      reg236 <= $unsigned(((reg227 ?
              reg215[(3'h6):(3'h6)] : ((&wire235) ?
                  $signed(wire233) : wire206[(2'h2):(1'h1)])) ?
          ($unsigned(wire168) ?
              $signed($signed(reg221)) : ((~^wire206) ?
                  {wire213, wire213} : wire207)) : $signed(({wire167,
              reg227} != $unsigned((8'hbb))))));
      reg237 <= {(($signed((wire167 ? (8'ha6) : wire208)) ? wire168 : wire212) ?
              (|$signed(wire204)) : wire234)};
      reg238 <= ((8'hbb) * ((8'ha0) ?
          {wire166} : ($unsigned(wire234) >>> wire165[(4'hb):(4'h9)])));
      reg239 <= reg223[(1'h1):(1'h1)];
    end
endmodule

module module144
#(parameter param156 = (^~(~(!(^~(-(8'hbc)))))))
(y, clk, wire148, wire147, wire146, wire145);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire148;
  input wire [(4'h8):(1'h0)] wire147;
  input wire signed [(2'h3):(1'h0)] wire146;
  input wire signed [(3'h6):(1'h0)] wire145;
  wire signed [(2'h3):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire151;
  wire signed [(3'h4):(1'h0)] wire149;
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire149,
                 reg150,
                 (1'h0)};
  assign wire149 = (~&wire148);
  always
    @(posedge clk) begin
      reg150 <= (&$unsigned((wire145[(3'h4):(2'h3)] ^~ $signed($unsigned(wire146)))));
    end
  assign wire151 = wire149;
  assign wire152 = reg150[(4'hb):(3'h7)];
  assign wire153 = wire145;
  assign wire154 = (wire151 >> (((wire151[(2'h2):(2'h2)] ^~ wire146[(1'h1):(1'h1)]) <= $unsigned($unsigned(wire148))) ^ (~|(wire146 > (|(8'hb6))))));
  assign wire155 = wire145;
endmodule

module module8
#(parameter param141 = {(~^(((+(8'h9d)) ? (-(8'ha4)) : ((7'h43) ? (8'hb4) : (8'ha7))) ? (((7'h41) * (8'ha9)) ? (-(8'h9c)) : {(8'hb4), (8'hb8)}) : (|{(8'ha2), (7'h42)}))), (((^((7'h40) ? (8'ha4) : (8'ha2))) ? (((8'ha4) ? (7'h41) : (7'h42)) & ((7'h42) ? (8'hb2) : (8'ha3))) : (!(7'h42))) == (8'hb1))})
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire137;
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  assign y = {wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire22,
                 wire30,
                 wire31,
                 wire32,
                 wire119,
                 wire137,
                 reg140,
                 reg139,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg21,
                 reg20,
                 reg19,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= $signed($signed((~^$unsigned((wire13 ^~ wire13)))));
    end
  assign wire15 = (wire13[(2'h3):(2'h2)] << {(wire10[(1'h0):(1'h0)] ?
                          (8'ha8) : {(wire10 <= wire10)})});
  assign wire16 = {(&{(8'h9e)})};
  assign wire17 = (wire11[(3'h4):(2'h2)] ?
                      $signed(($unsigned(wire11[(2'h3):(1'h0)]) ?
                          (|wire13[(5'h12):(4'hb)]) : {wire16[(4'hf):(4'h9)],
                              (~^(8'hba))})) : $unsigned(($unsigned((wire16 ?
                          wire16 : (8'hba))) || (~wire13[(5'h14):(4'hc)]))));
  assign wire18 = (~|$signed((!$unsigned((~(8'hbf))))));
  always
    @(posedge clk) begin
      reg19 <= (((8'ha7) & ($signed({wire12}) ?
              (&wire17[(3'h5):(1'h1)]) : (-(wire10 - wire12)))) ?
          $unsigned((wire12 ?
              {((8'ha2) ?
                      (8'hb1) : wire11)} : (wire15 ~^ $signed(wire17)))) : ({((wire10 ?
                  wire17 : wire15) >>> wire15),
              wire10[(2'h3):(1'h0)]} - (wire18 ? wire10 : (&(~&wire18)))));
      reg20 <= $signed((~|(reg19 ?
          $signed((wire18 && wire17)) : $unsigned((reg14 ?
              wire18 : (8'hab))))));
      reg21 <= (wire11 != $signed(((+$unsigned((8'hbf))) ?
          $signed((wire10 * wire12)) : reg20)));
    end
  assign wire22 = (wire9 ?
                      ({($signed(reg21) ? {wire15, reg21} : {wire9})} ?
                          {((wire17 > wire10) >= $unsigned(reg20))} : $signed(wire12[(3'h5):(1'h1)])) : (-$unsigned((wire16 == (wire17 | wire9)))));
  always
    @(posedge clk) begin
      if ((^~($signed(($unsigned(wire15) | (wire12 != wire22))) ?
          $unsigned((wire11[(1'h1):(1'h0)] <<< $signed(wire16))) : reg20[(4'hd):(3'h5)])))
        begin
          reg23 <= (wire9 ?
              $signed($signed(wire12[(2'h3):(1'h0)])) : (($signed(wire12[(4'h9):(1'h0)]) != (!wire9)) * ((^~(reg19 >= (8'hbe))) >>> (reg21 ?
                  wire15 : $unsigned(reg21)))));
        end
      else
        begin
          reg23 <= $unsigned($signed(wire9));
          reg24 <= (8'ha5);
          reg25 <= wire12;
          reg26 <= ((&(+(wire11[(3'h5):(1'h0)] ?
              $signed((8'hbc)) : $signed(wire17)))) >> $unsigned($unsigned($signed(reg24))));
        end
      reg27 <= (reg19 ?
          reg25 : (($unsigned(wire9[(4'he):(4'hc)]) | $signed($unsigned(reg21))) >>> wire15));
      reg28 <= ($unsigned(wire9) || $signed(reg25[(1'h1):(1'h0)]));
      reg29 <= wire16;
    end
  assign wire30 = ((-wire17[(3'h5):(3'h4)]) <<< (~|reg24));
  assign wire31 = $unsigned((~(~(reg14 ? (reg28 ? wire9 : wire16) : wire17))));
  assign wire32 = wire22[(1'h1):(1'h0)];
  module33 #() modinst120 (wire119, clk, wire12, wire15, reg28, reg27);
  module121 #() modinst138 (wire137, clk, reg26, wire9, wire11, wire15, reg29);
  always
    @(posedge clk) begin
      reg139 <= $unsigned($signed(reg26));
      reg140 <= wire119[(4'hd):(3'h6)];
    end
endmodule

module module121
#(parameter param136 = ((((((8'hb2) ? (8'hb3) : (7'h41)) ? ((8'haf) ? (8'hbe) : (8'hb1)) : (&(7'h44))) ? (^(!(8'hac))) : ({(8'ha3), (8'hb3)} - (~&(7'h41)))) >> ((((8'hba) ? (8'h9e) : (8'hb3)) | (|(8'hbd))) ? (&(8'hbc)) : (~&((8'hb2) ? (8'hbe) : (8'ha1))))) ? (8'haa) : (~|(({(8'hbf)} ? (~|(8'hb8)) : (~&(8'hbc))) ^~ (((8'ha5) | (8'hb5)) && ((8'hb6) ? (8'ha1) : (7'h43)))))))
(y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire126;
  input wire [(2'h3):(1'h0)] wire125;
  input wire [(4'hf):(1'h0)] wire124;
  input wire signed [(4'hc):(1'h0)] wire123;
  input wire signed [(4'he):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire127;
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire129,
                 wire128,
                 wire127,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire127 = $signed((~^$unsigned(wire126[(2'h2):(1'h1)])));
  assign wire128 = wire127[(1'h1):(1'h0)];
  assign wire129 = ((((~&(wire122 ? wire124 : wire128)) ?
                               wire125 : (|{wire127})) ?
                           ((~^$signed(wire127)) ?
                               (wire126 >>> wire123[(3'h7):(1'h0)]) : wire128[(3'h6):(3'h5)]) : (wire122 < $unsigned((~&wire123)))) ?
                       (($signed(((8'hbd) ?
                               wire127 : wire123)) | $signed(wire122)) ?
                           ($signed(wire123[(4'hc):(3'h5)]) * $unsigned((wire127 << wire122))) : wire126[(4'h9):(3'h6)]) : {wire123[(3'h4):(3'h4)]});
  always
    @(posedge clk) begin
      reg130 <= wire122;
      reg131 <= wire122[(2'h2):(1'h1)];
      reg132 <= $unsigned((($signed((8'ha9)) ?
              (8'ha3) : (!wire123[(3'h5):(2'h2)])) ?
          $signed((~&wire125[(2'h2):(2'h2)])) : wire128));
    end
  assign wire133 = $signed($signed((~|(reg131 && $unsigned(reg131)))));
  assign wire134 = wire122[(4'hd):(1'h1)];
  assign wire135 = wire133;
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h3a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire37;
  input wire signed [(3'h4):(1'h0)] wire36;
  input wire signed [(2'h3):(1'h0)] wire35;
  input wire signed [(4'he):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire38;
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire104,
                 wire103,
                 wire102,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire38,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire38 = $signed({(wire37[(2'h3):(1'h1)] || ({(8'hb2),
                          wire37} & wire34[(4'ha):(2'h2)])),
                      (&($unsigned(wire36) ?
                          (wire37 > wire34) : (wire34 == wire35)))});
  always
    @(posedge clk) begin
      if ($signed($signed($signed($unsigned((wire37 - wire36))))))
        begin
          if (wire37[(4'h8):(3'h4)])
            begin
              reg39 <= wire36[(1'h1):(1'h1)];
              reg40 <= wire35;
              reg41 <= wire37[(5'h11):(3'h4)];
              reg42 <= $unsigned(($unsigned(((reg39 >>> reg41) == wire34[(3'h6):(3'h6)])) ?
                  wire37 : $signed((7'h40))));
              reg43 <= wire35;
            end
          else
            begin
              reg39 <= (~^reg39);
              reg40 <= $signed((!$unsigned((^~(wire36 ? reg39 : reg41)))));
              reg41 <= {(~|(~&$signed(reg40))),
                  $signed((reg42[(3'h6):(1'h0)] * (8'hac)))};
            end
        end
      else
        begin
          reg39 <= {$signed(wire35),
              (wire38 ?
                  (($unsigned(wire37) ?
                          (wire34 ? wire37 : (8'ha8)) : $unsigned(reg39)) ?
                      (~^(8'h9f)) : (reg43 ?
                          $unsigned((8'haf)) : reg41[(2'h3):(2'h2)])) : wire36[(2'h3):(1'h0)])};
          reg40 <= {(({(~wire37), (reg40 + (7'h43))} ?
                  $signed((^(8'ha1))) : (~^reg40[(3'h4):(2'h2)])) <= $unsigned(wire36))};
          reg41 <= $signed($signed($signed((8'h9e))));
          reg42 <= $signed((8'ha1));
          reg43 <= wire34[(1'h1):(1'h1)];
        end
    end
  assign wire44 = {(reg40 ?
                          (reg39 <<< $signed({wire35,
                              reg42})) : ({reg42[(1'h1):(1'h0)]} ?
                              $signed((~^reg41)) : wire35))};
  assign wire45 = (8'haf);
  assign wire46 = wire45[(1'h0):(1'h0)];
  assign wire47 = ($unsigned(wire35) ?
                      wire46 : $signed((wire38[(3'h7):(2'h2)] ?
                          wire35 : (~^(wire45 ? reg40 : wire35)))));
  assign wire48 = $unsigned(($signed(($unsigned(wire36) ?
                          ((8'hbd) ? wire47 : reg43) : (^reg43))) ?
                      (wire45[(3'h4):(1'h1)] ?
                          $signed(wire44[(4'h9):(3'h7)]) : $signed(reg43)) : $unsigned(wire34)));
  always
    @(posedge clk) begin
      reg49 <= $signed(({$unsigned((wire44 ? reg41 : wire47)),
          $unsigned($signed(reg40))} <<< {$signed((~reg39)), (8'hac)}));
      if ((|reg43))
        begin
          reg50 <= $unsigned($unsigned(($unsigned((|wire38)) ?
              $signed({wire45, (8'hb2)}) : reg39)));
          reg51 <= {wire34, ($unsigned(wire47) | wire44[(1'h0):(1'h0)])};
          if (wire46)
            begin
              reg52 <= ($unsigned($unsigned(reg40[(3'h5):(1'h1)])) ^~ (^wire35[(1'h1):(1'h0)]));
              reg53 <= reg39[(4'hd):(1'h0)];
              reg54 <= $signed((~&$signed((wire34 ?
                  (wire38 > (8'hb2)) : (wire45 ? wire34 : (8'ha9))))));
            end
          else
            begin
              reg52 <= $unsigned(wire34);
              reg53 <= wire44[(4'ha):(1'h1)];
            end
          if (((&(wire44 <<< wire45)) ?
              (&(!wire34[(4'hd):(2'h2)])) : $unsigned(wire34[(4'ha):(2'h3)])))
            begin
              reg55 <= {((wire47[(1'h1):(1'h0)] == reg39[(4'he):(4'ha)]) >> $unsigned((&wire38)))};
              reg56 <= (({{wire37[(4'hf):(2'h2)], (-reg54)},
                  $unsigned(reg50)} >= $signed($signed($signed(wire46)))) != $unsigned(reg41));
              reg57 <= $signed($signed((($unsigned(wire45) ?
                  {reg40, reg49} : reg41) & (+reg42))));
              reg58 <= reg40;
            end
          else
            begin
              reg55 <= $signed(reg58[(4'h9):(3'h6)]);
              reg56 <= (^~(^reg43[(3'h5):(3'h5)]));
              reg57 <= $signed(reg53);
              reg58 <= $unsigned(($signed(reg51[(4'hb):(3'h5)]) >> wire44));
            end
          reg59 <= wire37[(4'ha):(4'h9)];
        end
      else
        begin
          if (wire47)
            begin
              reg50 <= $unsigned((-reg52));
              reg51 <= (wire47 >= $unsigned({$unsigned($signed(wire48))}));
              reg52 <= wire47[(1'h1):(1'h0)];
              reg53 <= (reg39[(3'h7):(3'h7)] ?
                  (~&((reg51 ?
                      (8'ha3) : (wire37 ?
                          reg54 : (8'hac))) != $unsigned((!reg42)))) : $signed(wire34[(4'h8):(3'h4)]));
              reg54 <= {(reg41 ? $signed($signed({reg54, wire44})) : reg41),
                  reg54[(2'h3):(1'h0)]};
            end
          else
            begin
              reg50 <= ($signed(reg56) | reg58);
            end
        end
      reg60 <= reg39;
    end
  assign wire61 = ((reg56 >>> wire34[(1'h0):(1'h0)]) < reg51[(5'h14):(1'h1)]);
  assign wire62 = (({($unsigned(reg57) | (reg52 ?
                              wire44 : wire46))} & $signed($unsigned($signed(reg40)))) ?
                      ((!(7'h43)) ?
                          ($signed(reg51[(3'h5):(2'h3)]) < $signed((^~wire38))) : $signed($signed((reg53 ?
                              wire61 : (7'h42))))) : {(wire37 <= ((~^reg39) >> reg59))});
  assign wire63 = $unsigned(reg58[(2'h2):(1'h0)]);
  assign wire64 = (8'hb4);
  assign wire65 = wire61[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg66 <= (reg54[(2'h2):(1'h1)] ?
          $signed({wire38[(4'h8):(2'h2)]}) : (&$unsigned((^(reg51 != reg51)))));
      reg67 <= $unsigned($unsigned((^~(wire34 || $unsigned(wire35)))));
      if (((8'ha0) ?
          $unsigned({reg50}) : ((~(wire65 ? (^~wire48) : $signed((8'ha7)))) ?
              reg57 : $signed((~(~^(8'hba)))))))
        begin
          reg68 <= reg41[(2'h2):(1'h0)];
          reg69 <= {(-{$signed(wire47)}), reg68[(3'h7):(3'h7)]};
          reg70 <= (+(~&$signed(reg52)));
          reg71 <= ($unsigned({(|reg55[(2'h2):(2'h2)]),
                  wire36[(1'h0):(1'h0)]}) ?
              (|reg39[(4'hb):(4'hb)]) : ((reg60 ?
                      reg42[(2'h3):(1'h1)] : $unsigned(wire36[(2'h2):(1'h0)])) ?
                  $signed(reg40[(2'h3):(1'h0)]) : (wire35[(1'h1):(1'h0)] * reg67)));
          reg72 <= $signed(($signed(wire34[(4'he):(4'h9)]) ?
              ($signed(wire45[(3'h7):(3'h7)]) ^~ ((~wire64) ?
                  wire63 : {reg49, reg57})) : (^~$unsigned((reg66 ?
                  wire44 : wire61)))));
        end
      else
        begin
          reg68 <= {((((8'ha2) && ((8'hae) ? wire46 : wire36)) >= reg67) ?
                  reg43 : (($signed(reg55) ^~ (reg56 ? reg50 : reg68)) ?
                      (wire37[(5'h12):(3'h5)] ?
                          (~^wire45) : reg60) : ($unsigned(reg56) | (reg68 + (8'hb6)))))};
          reg69 <= (wire35 >> wire63[(1'h1):(1'h1)]);
          reg70 <= {(&$signed((!(^~reg55))))};
        end
    end
  always
    @(posedge clk) begin
      reg73 <= ($unsigned(reg60) | $signed($signed(reg52[(1'h0):(1'h0)])));
      if ((!wire47))
        begin
          reg74 <= $signed((reg59 ?
              ((&(reg68 - wire44)) <= $signed((reg54 ^ reg66))) : $signed(reg41)));
          reg75 <= ((((wire37[(3'h6):(1'h0)] << $unsigned(wire62)) ?
                  reg57 : {(reg52 - (7'h44))}) ~^ ($unsigned(((8'hb0) ?
                      wire48 : wire45)) ?
                  $unsigned(reg72) : $unsigned((reg73 <<< reg50)))) ?
              reg73[(2'h3):(2'h2)] : (~^(reg74 >= reg72)));
          reg76 <= (reg73[(1'h1):(1'h0)] ?
              (+$signed(wire48)) : (-((|(reg71 ?
                  reg55 : (8'ha1))) || $signed($signed(wire38)))));
          reg77 <= (~wire35[(2'h2):(2'h2)]);
        end
      else
        begin
          reg74 <= $signed((~|reg57));
          reg75 <= wire45;
          reg76 <= reg70[(1'h0):(1'h0)];
          reg77 <= (((~|(~|(8'ha2))) ?
              ((wire44 ?
                  (wire36 | wire34) : wire47[(1'h1):(1'h0)]) | reg58) : wire35[(2'h2):(1'h1)]) | $unsigned(wire47));
          reg78 <= $signed(wire36);
        end
      if ({reg56[(2'h2):(2'h2)]})
        begin
          reg79 <= $unsigned(reg57[(3'h6):(3'h5)]);
          reg80 <= (|$unsigned($unsigned($unsigned((wire37 ?
              (8'had) : reg71)))));
          reg81 <= wire36[(2'h2):(1'h1)];
        end
      else
        begin
          reg79 <= wire46;
        end
      if ((reg81[(1'h1):(1'h1)] ?
          (($unsigned((wire48 ~^ reg42)) ? (~|(reg57 + wire34)) : reg76) ?
              reg49[(1'h0):(1'h0)] : $unsigned(reg78)) : {$signed($unsigned(reg75)),
              $unsigned(reg77[(4'h8):(3'h4)])}))
        begin
          if ((reg59 ^ reg39))
            begin
              reg82 <= reg76[(2'h2):(1'h0)];
              reg83 <= $signed(wire48[(3'h7):(3'h7)]);
              reg84 <= {(wire47 <= ($unsigned(reg80[(1'h1):(1'h0)]) || ((~&reg50) ?
                      $signed(wire65) : (wire63 >= reg68)))),
                  reg79};
            end
          else
            begin
              reg82 <= (((wire61[(2'h3):(2'h2)] ?
                  reg69 : ((~^reg78) != reg41)) != wire63[(3'h5):(2'h2)]) ^ (|($signed((!reg59)) ?
                  $unsigned({reg50}) : ((7'h43) ?
                      (reg59 ? reg84 : reg80) : (reg39 + reg51)))));
              reg83 <= ($unsigned(reg71) ? reg52 : {$signed((!(-(8'ha7))))});
              reg84 <= $signed(((reg68 ~^ (reg56[(3'h5):(1'h1)] ?
                      $signed(reg66) : $unsigned(wire38))) ?
                  reg80[(3'h5):(1'h0)] : $signed(reg84[(1'h0):(1'h0)])));
            end
          if ($unsigned($unsigned((-((|reg74) ?
              $signed(reg52) : $unsigned(reg40))))))
            begin
              reg85 <= $unsigned({(8'hbe), {(reg73 >> (&reg50)), reg79}});
              reg86 <= $unsigned($unsigned(wire45));
              reg87 <= (((8'ha4) >> ($signed($unsigned(wire38)) ?
                  $signed(reg55) : (|(!reg58)))) <<< ($unsigned($unsigned(reg42)) ?
                  (^reg42) : wire62));
              reg88 <= $unsigned($unsigned(($signed($unsigned((7'h41))) & (|$signed(wire38)))));
            end
          else
            begin
              reg85 <= $signed(reg50);
              reg86 <= reg87[(4'hd):(3'h5)];
              reg87 <= reg41;
              reg88 <= $unsigned($unsigned(reg70[(2'h3):(1'h0)]));
              reg89 <= {$signed($signed(reg72[(5'h14):(3'h7)]))};
            end
          reg90 <= ((~|((8'ha5) ? $unsigned($signed(reg55)) : reg51)) ?
              (~$signed((reg52 ?
                  {(7'h43), wire64} : $signed(wire48)))) : reg50);
        end
      else
        begin
          reg82 <= ({($unsigned((8'hb7)) || wire44)} ^~ (~&reg60[(3'h5):(1'h0)]));
          if ($unsigned($signed(reg53[(2'h2):(1'h1)])))
            begin
              reg83 <= ($signed(reg86) ?
                  (8'hbd) : ((~&$unsigned($signed(reg90))) + reg70));
            end
          else
            begin
              reg83 <= (reg77 ?
                  ((8'hba) <<< {reg68}) : {reg75, $signed((-(~^wire47)))});
              reg84 <= $unsigned({(((reg74 >= wire61) - (wire38 ?
                      (8'hb5) : wire37)) == reg49),
                  $unsigned($unsigned(reg73))});
              reg85 <= ($signed((reg81 < ((reg78 ? reg84 : reg41) * (reg72 ?
                      wire65 : reg79)))) ?
                  (reg39[(1'h0):(1'h0)] << reg56[(3'h5):(3'h5)]) : $unsigned($unsigned({(+wire38)})));
              reg86 <= wire62[(1'h0):(1'h0)];
              reg87 <= (~^$signed(wire48[(1'h0):(1'h0)]));
            end
          reg88 <= reg56;
          reg89 <= $signed((^~$unsigned((!{reg68}))));
          reg90 <= (&(+(~|$unsigned(reg81[(1'h0):(1'h0)]))));
        end
      if (((reg66 > reg82) ^~ (~|reg49[(3'h4):(3'h4)])))
        begin
          if (((~$signed($unsigned({reg42, (8'hbb)}))) ?
              ($unsigned(wire37[(4'he):(4'hb)]) ?
                  (7'h42) : (reg67[(3'h7):(2'h2)] ^ (^(reg55 ?
                      reg59 : reg66)))) : $unsigned((({reg73, wire47} ?
                  $signed(reg39) : reg52) & (|(reg89 ? reg75 : wire61))))))
            begin
              reg91 <= (~&$signed($unsigned((-(~reg52)))));
              reg92 <= ((8'hb8) >> reg80[(4'he):(4'he)]);
              reg93 <= (8'h9c);
              reg94 <= ((~&reg55) >>> ({wire37,
                  wire63[(3'h7):(3'h4)]} - $signed(((-reg88) ?
                  $signed(reg49) : reg56[(3'h5):(2'h2)]))));
            end
          else
            begin
              reg91 <= reg40[(2'h3):(2'h3)];
              reg92 <= (8'hb6);
              reg93 <= ($unsigned(wire37[(4'ha):(1'h1)]) << $unsigned(wire38[(2'h3):(2'h3)]));
            end
          reg95 <= (~|$unsigned($signed(((reg53 != reg59) ?
              (wire38 ? reg69 : reg92) : (wire46 ? reg80 : reg86)))));
          if (wire35[(1'h0):(1'h0)])
            begin
              reg96 <= ($signed($unsigned(wire63[(4'h9):(2'h3)])) ?
                  $unsigned((^{$unsigned(reg72)})) : ((|reg73[(3'h5):(3'h5)]) ?
                      ((~^reg90[(5'h10):(4'ha)]) ^ wire62) : (reg57 ?
                          (+reg41) : $signed((reg60 | reg82)))));
              reg97 <= (reg92[(3'h4):(1'h1)] + $unsigned($unsigned((reg87 ?
                  (reg51 ? reg41 : (8'ha2)) : $unsigned(reg81)))));
              reg98 <= reg55;
            end
          else
            begin
              reg96 <= (({reg43[(4'hc):(3'h6)]} ?
                      {(!$unsigned(wire35)),
                          {reg84[(1'h1):(1'h0)],
                              $signed(reg81)}} : $signed(wire48)) ?
                  wire61[(2'h3):(2'h3)] : $unsigned($signed((|$signed(reg87)))));
              reg97 <= ({((^(^~reg77)) ?
                          ($signed(reg43) && (reg53 ?
                              (8'hae) : reg42)) : (wire34[(4'hb):(4'hb)] < $unsigned(reg82))),
                      (~^$signed((-reg87)))} ?
                  reg71[(2'h2):(1'h1)] : (reg82 ^~ $signed((&(reg81 ?
                      reg88 : reg67)))));
              reg98 <= {reg75, (^reg84[(2'h3):(2'h3)])};
              reg99 <= $unsigned(((reg74 ?
                  ($unsigned(wire62) ?
                      reg96[(2'h2):(1'h0)] : $signed(reg81)) : $signed($signed(wire36))) >> reg89[(5'h13):(5'h13)]));
            end
          reg100 <= {{(7'h40)}, (+$unsigned($signed((reg51 | reg51))))};
          reg101 <= (8'haf);
        end
      else
        begin
          reg91 <= (^~($unsigned(($unsigned(reg52) ?
                  reg42 : ((8'hbc) * reg85))) ?
              reg96[(1'h0):(1'h0)] : (8'hbe)));
        end
    end
  assign wire102 = {((($unsigned(reg100) & {reg66,
                               reg73}) | $unsigned(wire63[(3'h5):(2'h3)])) ?
                           wire65[(2'h2):(2'h2)] : $unsigned(wire45)),
                       $signed($signed(((wire47 < (8'hb6)) ?
                           ((8'h9e) ? reg90 : reg77) : (8'hb1))))};
  assign wire103 = ((^reg76) ^~ $signed(reg99));
  assign wire104 = ((8'ha5) ? reg87[(4'hb):(1'h0)] : reg84);
  always
    @(posedge clk) begin
      reg105 <= (~^(($signed(reg54) ?
          ($unsigned(wire103) ?
              (wire45 >> reg50) : (reg52 > reg73)) : reg50[(4'ha):(2'h3)]) & (reg94 ?
          {wire36[(1'h0):(1'h0)]} : $signed(reg87[(2'h3):(1'h1)]))));
      reg106 <= (reg70[(2'h3):(2'h3)] ^ (8'hb3));
      if ($signed(reg86[(1'h0):(1'h0)]))
        begin
          reg107 <= $signed((($signed($signed(reg94)) - $unsigned(reg73)) ?
              (8'hac) : (((reg77 ? wire103 : reg49) * (+reg56)) ?
                  (8'hbc) : ((&reg51) ?
                      reg79[(4'ha):(3'h5)] : {(8'h9d), reg52}))));
          if ((reg43[(5'h14):(5'h10)] ~^ reg39))
            begin
              reg108 <= $unsigned({$signed(({reg89} ?
                      reg85[(2'h2):(2'h2)] : reg101)),
                  $unsigned((reg73[(1'h1):(1'h1)] << (8'hbb)))});
              reg109 <= (-reg52);
            end
          else
            begin
              reg108 <= ($signed(reg68) ~^ (^~reg57[(4'h9):(2'h3)]));
            end
          if (reg70[(3'h4):(1'h1)])
            begin
              reg110 <= $unsigned(reg79);
              reg111 <= reg97[(1'h0):(1'h0)];
              reg112 <= reg92[(2'h3):(1'h1)];
              reg113 <= reg95;
              reg114 <= wire64;
            end
          else
            begin
              reg110 <= $signed(reg79[(4'hc):(1'h0)]);
              reg111 <= ((reg85 <= reg92[(1'h1):(1'h1)]) || ($unsigned($signed((reg83 ?
                      (8'hb1) : reg98))) ?
                  (((wire45 ? reg107 : reg83) ?
                          $unsigned(wire36) : wire48[(4'ha):(1'h0)]) ?
                      reg70[(3'h5):(3'h5)] : (8'ha5)) : (~&reg51[(3'h5):(2'h2)])));
              reg112 <= ((~&(reg98 ?
                  reg87[(2'h3):(1'h1)] : (~(reg83 && wire104)))) > (~|reg109[(4'h8):(2'h3)]));
            end
          reg115 <= {({$unsigned($unsigned((7'h44))),
                      ((reg79 ? reg66 : reg113) << $signed(reg77))} ?
                  ({reg60[(1'h0):(1'h0)]} != reg78) : (($signed(reg79) == (8'ha1)) ?
                      ({reg51} ?
                          (reg82 ?
                              reg78 : reg39) : (reg83 >= wire61)) : (-(reg86 ?
                          reg112 : reg70))))};
        end
      else
        begin
          reg107 <= $signed(wire47);
          if ((~|reg85[(1'h0):(1'h0)]))
            begin
              reg108 <= (+{reg75, $signed((^(reg56 - reg92)))});
              reg109 <= {(^~(^(~|reg54))),
                  $unsigned((((wire46 || reg40) || (&reg89)) ?
                      ($signed(reg80) ? wire36 : {reg99}) : reg80))};
            end
          else
            begin
              reg108 <= wire36;
              reg109 <= $unsigned($unsigned(reg107));
              reg110 <= ((!(((~^(8'hbe)) ^~ (reg76 ? wire34 : reg76)) ?
                      $signed(wire63[(3'h4):(1'h1)]) : $signed((reg99 ?
                          reg82 : reg111)))) ?
                  reg110[(4'he):(3'h4)] : (&reg49));
            end
          reg111 <= (reg49[(3'h5):(3'h4)] & $signed((((wire104 - wire65) ?
                  wire46[(1'h1):(1'h0)] : $signed((8'hb4))) ?
              (((8'had) >> wire61) ?
                  $signed((8'hb0)) : reg87[(1'h1):(1'h0)]) : wire36)));
          reg112 <= $signed((-($signed(wire65) && reg70)));
          if (((({{reg71, wire36}} ?
                      $signed($signed(reg93)) : $unsigned((reg51 ?
                          reg106 : reg113))) ?
                  reg84[(2'h3):(1'h0)] : $signed($signed(reg69[(3'h4):(2'h2)]))) ?
              (&wire47[(2'h2):(2'h2)]) : $signed(reg99)))
            begin
              reg113 <= (^wire65);
            end
          else
            begin
              reg113 <= wire62[(1'h1):(1'h0)];
              reg114 <= {{$unsigned(((reg92 - (8'ha8)) >>> (8'ha1)))},
                  (reg111 > (-$unsigned(reg94[(4'he):(3'h6)])))};
              reg115 <= $signed(wire104);
            end
        end
      reg116 <= reg92[(2'h2):(1'h0)];
    end
  assign wire117 = {((($unsigned(reg81) ?
                           ((7'h44) ?
                               wire63 : reg57) : $signed(reg60)) == ({(8'hb6)} > {reg53})) != (&reg96))};
  assign wire118 = (~^$signed($unsigned($signed((reg99 >>> wire34)))));
endmodule

module module171  (y, clk, wire175, wire174, wire173, wire172);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire175;
  input wire signed [(3'h7):(1'h0)] wire174;
  input wire [(3'h6):(1'h0)] wire173;
  input wire signed [(3'h6):(1'h0)] wire172;
  wire signed [(4'hf):(1'h0)] wire200;
  wire signed [(3'h5):(1'h0)] wire199;
  wire signed [(5'h14):(1'h0)] wire193;
  wire signed [(3'h7):(1'h0)] wire192;
  wire signed [(3'h6):(1'h0)] wire191;
  wire [(4'hb):(1'h0)] wire190;
  wire [(5'h14):(1'h0)] wire189;
  reg signed [(4'hb):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg197 = (1'h0);
  reg [(5'h11):(1'h0)] reg196 = (1'h0);
  reg [(2'h2):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(5'h12):(1'h0)] reg186 = (1'h0);
  reg [(3'h4):(1'h0)] reg185 = (1'h0);
  reg [(5'h10):(1'h0)] reg184 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg181 = (1'h0);
  reg [(3'h7):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg176 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed(($unsigned((wire174 ? wire173 : wire174)) ?
          $signed((wire174 << wire175)) : ((~&wire173) <= (^wire174))))))
        begin
          reg176 <= $signed({{$unsigned((!wire174)), wire175}});
          reg177 <= ($unsigned($unsigned($unsigned($signed(wire172)))) ?
              $signed(reg176[(1'h0):(1'h0)]) : $signed(reg176[(3'h6):(1'h0)]));
          if ($signed($unsigned($signed(wire175))))
            begin
              reg178 <= reg177;
              reg179 <= (8'hb1);
              reg180 <= ($signed(wire173[(2'h2):(2'h2)]) ?
                  $signed(((((8'hbf) << wire175) ?
                      (wire175 >> reg179) : (~|wire174)) * {reg177,
                      wire174})) : reg176);
              reg181 <= wire174[(3'h5):(1'h0)];
              reg182 <= ($unsigned((^$signed({reg181, reg178}))) ?
                  reg181[(1'h1):(1'h1)] : wire175);
            end
          else
            begin
              reg178 <= reg176;
              reg179 <= {reg176, reg181[(4'hd):(3'h5)]};
              reg180 <= (&reg181[(5'h12):(5'h12)]);
            end
        end
      else
        begin
          if (((+(^~$signed($unsigned(wire175)))) ?
              ((((wire174 - reg176) ? $signed(wire173) : {reg181}) ?
                      reg180[(3'h6):(1'h1)] : $signed($unsigned(reg177))) ?
                  reg179[(3'h6):(3'h6)] : {$unsigned(reg180)}) : $unsigned($unsigned($signed((wire172 & (8'hb4)))))))
            begin
              reg176 <= reg179;
              reg177 <= (reg177 | (reg178[(4'h8):(4'h8)] ?
                  reg179[(1'h0):(1'h0)] : (((reg178 ? wire173 : wire172) ?
                          $unsigned(wire174) : {(8'haa), wire172}) ?
                      ($unsigned(wire172) ?
                          wire175[(3'h4):(1'h1)] : reg179[(5'h10):(4'hb)]) : wire174[(2'h2):(2'h2)])));
              reg178 <= $unsigned((reg176 ?
                  wire175[(5'h11):(4'hc)] : (^~$signed($signed(reg178)))));
            end
          else
            begin
              reg176 <= (((($unsigned(wire174) ?
                          (wire172 * reg179) : (~reg176)) ?
                      wire174 : {(^~reg180)}) != reg180[(2'h3):(1'h1)]) ?
                  $signed($unsigned({$signed((7'h42)),
                      (wire175 << wire173)})) : $signed((^~((wire175 ?
                      reg178 : reg176) || {wire174, reg180}))));
            end
          reg179 <= $unsigned(($signed((-reg180)) ?
              (&$unsigned({wire175,
                  (8'h9f)})) : ($signed((~^(8'h9f))) ^ wire175[(5'h12):(5'h11)])));
          if (((((((8'hac) ? reg178 : (7'h40)) >>> ((8'hb3) ?
                      reg179 : wire175)) | (+(&reg181))) ?
                  ($unsigned($unsigned(reg180)) ?
                      $unsigned($unsigned(wire175)) : (wire172 ^ wire173[(3'h5):(3'h4)])) : reg180[(3'h4):(2'h2)]) ?
              $unsigned(reg176) : $unsigned(reg181)))
            begin
              reg180 <= {reg181,
                  $signed(((|reg177) ?
                      ($signed(wire173) ^ (reg176 ?
                          reg178 : reg177)) : reg179))};
            end
          else
            begin
              reg180 <= {reg180[(2'h3):(1'h1)],
                  $signed($signed({reg181[(4'hc):(1'h0)], (~wire174)}))};
              reg181 <= reg177;
              reg182 <= $unsigned(wire173[(1'h1):(1'h1)]);
              reg183 <= (((wire173 || reg181[(4'ha):(1'h0)]) ?
                  $unsigned((|reg177[(4'hc):(4'h9)])) : {$unsigned((+reg182)),
                      ((reg176 ?
                          wire174 : (8'hbb)) >> (~^reg178))}) >>> ($unsigned(wire174[(2'h2):(1'h1)]) << (^~(^$signed(reg181)))));
            end
          if (reg179)
            begin
              reg184 <= (7'h41);
              reg185 <= (~wire172[(1'h0):(1'h0)]);
            end
          else
            begin
              reg184 <= {wire175};
            end
          reg186 <= (($signed($signed((~^reg181))) || (^reg177)) ?
              ($signed((!(wire172 >>> reg176))) ?
                  (wire174 >>> $unsigned(reg181[(5'h10):(5'h10)])) : $unsigned(wire175[(3'h5):(2'h3)])) : (+({$unsigned(reg179),
                  reg177} <= (reg181[(4'ha):(4'h8)] ?
                  wire173[(1'h0):(1'h0)] : (8'hb9)))));
        end
      reg187 <= ($signed(({reg185[(2'h2):(1'h1)]} ?
          reg183[(3'h5):(1'h0)] : (-(~|reg182)))) >>> ($unsigned($signed(reg179)) ?
          (~^(!reg185[(1'h1):(1'h0)])) : reg179));
      reg188 <= reg183[(3'h6):(2'h2)];
    end
  assign wire189 = reg181[(5'h10):(4'hf)];
  assign wire190 = ((($unsigned(wire175[(1'h0):(1'h0)]) <<< ($signed(reg188) != (reg177 >> reg177))) ?
                           (reg186 ?
                               reg188[(3'h5):(1'h1)] : ((~|reg178) ?
                                   reg188[(4'hb):(3'h7)] : $signed(reg182))) : (~^{$unsigned(wire173),
                               $unsigned(wire175)})) ?
                       reg181[(3'h6):(1'h0)] : $unsigned((~^$signed($signed(reg178)))));
  assign wire191 = $signed($unsigned(((-(8'ha4)) ?
                       $unsigned($signed(wire173)) : $signed((&reg177)))));
  assign wire192 = $signed($signed(reg182[(5'h10):(4'h9)]));
  assign wire193 = wire191[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg194 <= {wire175[(3'h6):(1'h0)], wire173};
      reg195 <= ((((8'hb1) ? (~&reg177[(4'h9):(3'h5)]) : {$unsigned(reg178)}) ?
              ($signed((+wire193)) && wire175) : $signed($unsigned((reg184 ?
                  reg177 : reg194)))) ?
          reg186[(3'h7):(1'h0)] : (&(^~reg182)));
      reg196 <= (~|$signed(($signed((reg176 + wire173)) & wire190)));
      reg197 <= {reg181, $signed(wire175[(2'h3):(2'h3)])};
      reg198 <= $signed($signed($signed($unsigned((reg188 ?
          reg195 : reg187)))));
    end
  assign wire199 = (+$unsigned({($signed(reg177) * $unsigned(reg185))}));
  assign wire200 = $signed($unsigned($signed((reg187 >> (wire199 - reg180)))));
endmodule
