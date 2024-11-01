module top
#(parameter param237 = {((((^~(8'hae)) >= (~|(8'hbd))) * (((8'hbc) <<< (8'ha8)) ? (+(8'ha4)) : ((8'ha5) ? (8'ha2) : (8'ha6)))) ? ((((8'hab) ? (8'hb2) : (8'ha2)) ? (~(8'haa)) : ((7'h41) ? (8'hb2) : (8'hb1))) ? ((^(8'ha2)) || (~(8'hb0))) : (((8'hb9) ? (8'hb2) : (8'hbf)) <<< {(8'hac), (8'hbc)})) : ((((8'ha4) >>> (8'ha7)) == ((7'h42) ^ (8'hb1))) - (((8'hac) * (8'hbc)) ^ (8'ha6)))), ((({(8'hae), (8'ha0)} & ((8'hbf) ? (8'hb1) : (7'h43))) ? (((7'h41) ? (7'h40) : (8'h9e)) + {(8'hba), (8'h9e)}) : ({(8'ha9), (8'hb8)} ? (|(8'hb7)) : (+(7'h40)))) ? ((((8'ha9) ? (8'hac) : (8'ha3)) << (~^(8'ha1))) != (((8'h9d) >= (8'ha6)) ? ((8'hbf) ? (8'h9c) : (8'ha9)) : ((8'hb6) && (8'h9e)))) : (+(((8'h9d) ? (8'h9c) : (8'hb7)) >> ((8'hb0) ? (7'h41) : (8'hb2)))))}, 
parameter param238 = ((~((param237 ? {param237, param237} : (param237 || param237)) ? (^(param237 << param237)) : ((param237 << param237) ? param237 : (&param237)))) <<< ({{param237, param237}} ? (({param237, param237} ? (param237 ? (8'hb4) : param237) : param237) <<< (~|(-param237))) : (~({param237} ? param237 : ((8'hb5) ? (8'ha9) : param237))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire236;
  wire [(4'hd):(1'h0)] wire232;
  wire signed [(4'ha):(1'h0)] wire231;
  wire [(4'hc):(1'h0)] wire230;
  wire signed [(4'h8):(1'h0)] wire228;
  wire [(5'h10):(1'h0)] wire175;
  wire [(5'h14):(1'h0)] wire174;
  wire signed [(5'h15):(1'h0)] wire173;
  wire [(5'h13):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire171;
  wire [(4'ha):(1'h0)] wire170;
  wire signed [(3'h4):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire104;
  wire [(5'h13):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire168;
  wire [(4'ha):(1'h0)] wire234;
  assign y = {wire236,
                 wire232,
                 wire231,
                 wire230,
                 wire228,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire102,
                 wire104,
                 wire105,
                 wire168,
                 wire234,
                 (1'h0)};
  module4 #() modinst103 (wire102, clk, wire1, wire0, wire3, wire2, (8'hbe));
  assign wire104 = (wire2 ?
                       (~&$unsigned(wire2)) : ((^(wire102 <<< wire102[(3'h4):(1'h0)])) * wire3));
  assign wire105 = ((wire0[(4'hd):(4'ha)] ? wire0 : $signed(wire104)) ?
                       (^$unsigned(wire2)) : (($unsigned($signed(wire0)) ?
                               wire2 : $signed((wire2 * wire1))) ?
                           $signed(({wire1, wire1} ?
                               (wire3 >> wire104) : (^~wire102))) : $unsigned({$unsigned(wire0)})));
  module106 #() modinst169 (wire168, clk, wire104, wire3, wire0, wire102, wire105);
  assign wire170 = ($signed(((&wire0[(5'h10):(4'hc)]) ?
                           (wire0[(4'hf):(2'h3)] ?
                               (wire104 != (8'hbb)) : $unsigned(wire102)) : {$unsigned(wire2)})) ?
                       wire105 : (($unsigned((~|wire2)) ?
                               wire102[(1'h0):(1'h0)] : (wire1[(2'h2):(1'h1)] + $signed(wire168))) ?
                           (8'ha0) : wire168[(1'h1):(1'h1)]));
  assign wire171 = $unsigned($unsigned((wire3 ?
                       $unsigned($unsigned(wire170)) : (~(7'h43)))));
  assign wire172 = {wire168[(2'h3):(1'h1)]};
  assign wire173 = (((+wire105) ?
                       $signed((8'haf)) : (-(~&((8'hbd) & (7'h40))))) | $signed(wire102));
  assign wire174 = (~|$signed(((-wire2[(5'h11):(3'h5)]) ?
                       $unsigned({(8'hb5),
                           wire0}) : ($unsigned((8'ha4)) ^ $signed((8'ha8))))));
  assign wire175 = wire174[(2'h2):(2'h2)];
  module176 #() modinst229 (.clk(clk), .y(wire228), .wire179(wire170), .wire177(wire0), .wire180(wire168), .wire178(wire174));
  assign wire230 = (wire174 >= wire228[(1'h0):(1'h0)]);
  assign wire231 = (wire104[(1'h1):(1'h1)] ?
                       wire174[(3'h5):(2'h3)] : {(8'hb2), wire168});
  module183 #() modinst233 (.wire188(wire171), .wire186(wire173), .clk(clk), .wire184(wire170), .wire185(wire2), .y(wire232), .wire187(wire1));
  module135 #() modinst235 (.wire139(wire175), .wire136(wire172), .clk(clk), .wire138(wire168), .wire140(wire2), .y(wire234), .wire137(wire3));
  assign wire236 = {(|{$unsigned(wire104[(3'h7):(3'h5)])})};
endmodule

module module176
#(parameter param227 = ((^(({(8'hb5)} & {(8'hbc)}) ? (((8'h9c) ? (8'hbf) : (8'hb5)) ? (^~(8'hb3)) : ((8'hbf) ? (8'haa) : (8'had))) : (&((8'ha2) ? (8'h9d) : (8'hae))))) ? (7'h44) : (|(~^(-((8'hb8) ? (8'ha7) : (8'ha3)))))))
(y, clk, wire177, wire178, wire179, wire180);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire177;
  input wire signed [(5'h14):(1'h0)] wire178;
  input wire signed [(4'ha):(1'h0)] wire179;
  input wire [(4'ha):(1'h0)] wire180;
  wire signed [(4'hf):(1'h0)] wire226;
  wire signed [(2'h2):(1'h0)] wire225;
  wire signed [(4'hd):(1'h0)] wire224;
  wire [(4'ha):(1'h0)] wire223;
  wire signed [(3'h5):(1'h0)] wire222;
  wire signed [(4'hf):(1'h0)] wire210;
  wire signed [(3'h4):(1'h0)] wire209;
  wire signed [(3'h7):(1'h0)] wire208;
  wire signed [(4'ha):(1'h0)] wire207;
  wire signed [(3'h7):(1'h0)] wire206;
  wire signed [(5'h13):(1'h0)] wire181;
  wire [(3'h7):(1'h0)] wire182;
  wire [(4'h8):(1'h0)] wire204;
  reg signed [(4'h8):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg220 = (1'h0);
  reg [(3'h6):(1'h0)] reg219 = (1'h0);
  reg [(4'hd):(1'h0)] reg218 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg217 = (1'h0);
  reg [(5'h11):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg212 = (1'h0);
  reg [(5'h14):(1'h0)] reg211 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire181,
                 wire182,
                 wire204,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 (1'h0)};
  assign wire181 = $unsigned((wire180 ?
                       wire177[(4'hc):(4'h8)] : ((~^wire179) ?
                           {wire178, wire177} : $unsigned(wire177))));
  assign wire182 = ($unsigned((|wire179)) ?
                       wire181[(5'h10):(4'hf)] : $unsigned($signed(((wire180 ?
                           wire177 : wire178) <= (wire178 ?
                           wire180 : wire181)))));
  module183 #() modinst205 (.wire184(wire180), .y(wire204), .clk(clk), .wire185(wire177), .wire187(wire178), .wire188(wire181), .wire186(wire179));
  assign wire206 = (-($unsigned((wire177 ?
                           (wire177 ? wire181 : wire181) : wire179)) ?
                       ($unsigned((^wire177)) ?
                           {wire204[(3'h7):(1'h0)]} : (-(wire178 ?
                               wire180 : wire178))) : ($unsigned({wire180}) >= $unsigned((wire178 ?
                           wire204 : wire182)))));
  assign wire207 = $signed({(-$signed((wire204 * wire182))),
                       $unsigned(wire206)});
  assign wire208 = $unsigned(wire206[(1'h1):(1'h0)]);
  assign wire209 = (!(-(8'ha4)));
  assign wire210 = (^~(7'h42));
  always
    @(posedge clk) begin
      reg211 <= $unsigned((&(wire177[(5'h13):(3'h7)] ?
          ((wire208 ? wire180 : wire207) ?
              $unsigned(wire209) : $signed(wire206)) : $unsigned(wire178))));
      if (({(wire181[(3'h6):(2'h2)] <= $unsigned((^~(8'hbc)))),
          {$unsigned(wire209),
              ({wire178, wire208} ?
                  {reg211} : (7'h42))}} >= ((wire182[(2'h2):(1'h1)] ?
          $signed((wire208 ?
              wire207 : (8'hb5))) : (~^wire179[(3'h5):(1'h0)])) << (((wire204 ?
                  wire177 : (7'h42)) ?
              (&(8'h9c)) : $signed(wire208)) ?
          $signed($unsigned(wire177)) : $unsigned((wire182 ~^ wire179))))))
        begin
          reg212 <= {wire207};
        end
      else
        begin
          if ($unsigned(($unsigned(($signed(reg212) ?
              wire207[(2'h2):(1'h1)] : (wire207 ?
                  wire206 : wire209))) != ($unsigned(wire204[(3'h5):(2'h2)]) ?
              $unsigned(wire177[(5'h13):(5'h10)]) : $signed((wire182 ?
                  (8'ha3) : wire206))))))
            begin
              reg212 <= $signed($unsigned(($signed($unsigned(wire181)) ?
                  (8'hb0) : $unsigned((wire177 & (8'hb0))))));
              reg213 <= (((-(|(wire182 ?
                  wire179 : wire209))) | (wire207 & $signed(wire181[(5'h13):(3'h6)]))) ^ (wire207[(3'h7):(3'h5)] ?
                  (wire204[(3'h6):(3'h4)] ?
                      $signed(wire181[(2'h3):(2'h2)]) : ((wire207 ?
                              reg211 : wire180) ?
                          (wire177 ?
                              wire207 : wire181) : reg212)) : wire182[(3'h6):(1'h0)]));
              reg214 <= ((^~(-(reg212[(1'h0):(1'h0)] >> ((8'hb7) && wire204)))) ?
                  wire210 : wire179[(1'h0):(1'h0)]);
              reg215 <= wire204;
              reg216 <= ($unsigned(reg214) < $signed($signed((reg214 - (!wire177)))));
            end
          else
            begin
              reg212 <= ($unsigned(reg213) <<< ((^~((&wire179) ?
                  (!wire208) : (~&(8'hb0)))) & (wire181[(4'hf):(4'h9)] >> (+(^~wire207)))));
              reg213 <= wire208[(3'h6):(1'h0)];
              reg214 <= reg211[(2'h3):(2'h2)];
              reg215 <= (((($unsigned(reg215) ^ (wire178 ? wire210 : wire204)) ?
                  reg213[(1'h1):(1'h1)] : reg212[(1'h1):(1'h0)]) | wire182) >> $unsigned(reg211));
            end
          if (reg212)
            begin
              reg217 <= wire204[(3'h7):(1'h0)];
            end
          else
            begin
              reg217 <= $unsigned((|wire179));
              reg218 <= (~(reg213[(1'h0):(1'h0)] <<< wire206));
              reg219 <= (|(~|$unsigned($unsigned($signed(reg218)))));
              reg220 <= ($unsigned(wire210[(3'h6):(1'h1)]) ?
                  ((&($signed(wire209) + (wire178 ?
                      (8'hb3) : (8'haa)))) > reg219) : $unsigned($signed(reg212[(3'h4):(2'h2)])));
              reg221 <= ($signed(reg220[(5'h11):(3'h4)]) & $signed(wire181[(1'h1):(1'h1)]));
            end
        end
    end
  assign wire222 = (~&((reg216 <<< ((reg215 ? wire207 : wire178) ?
                       {reg216} : $signed(wire181))) > ($unsigned((reg219 < reg212)) ?
                       {(&wire206),
                           (wire180 < wire181)} : $signed(((8'hb3) <= reg216)))));
  assign wire223 = wire180[(1'h0):(1'h0)];
  assign wire224 = ($signed($unsigned(((^wire179) ^ $unsigned(wire181)))) - ($signed((~&$signed(wire181))) ?
                       (reg211[(2'h2):(1'h0)] ?
                           reg212[(3'h6):(2'h2)] : (wire179[(4'h9):(4'h9)] << $signed(wire206))) : wire207[(3'h4):(1'h1)]));
  assign wire225 = (wire178[(4'hd):(1'h1)] ?
                       {reg212[(1'h0):(1'h0)],
                           reg221} : wire182[(3'h7):(1'h1)]);
  assign wire226 = ($signed((|((wire208 ? wire206 : reg218) == (wire207 ?
                       reg217 : reg211)))) < ((8'hbf) > wire180));
endmodule

module module106  (y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire111;
  input wire [(4'hb):(1'h0)] wire110;
  input wire [(5'h12):(1'h0)] wire109;
  input wire [(3'h4):(1'h0)] wire108;
  input wire [(5'h13):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire165;
  wire [(5'h12):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire112;
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  assign y = {wire167,
                 wire165,
                 wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire129,
                 wire123,
                 wire122,
                 wire112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg131,
                 (1'h0)};
  assign wire112 = $signed(((~&$unsigned($signed(wire109))) ?
                       (wire109 ^~ {$unsigned(wire108)}) : (($signed(wire108) || wire107) >= {(~|wire108),
                           wire111})));
  always
    @(posedge clk) begin
      reg113 <= (~(~^wire111[(2'h3):(2'h3)]));
      reg114 <= $unsigned(wire111[(4'h9):(4'h8)]);
      if (reg114[(4'ha):(4'h9)])
        begin
          reg115 <= $signed($unsigned($signed(($signed(reg113) ?
              $signed(reg113) : (wire112 ? (8'hb1) : reg113)))));
          if (({$signed({$signed(reg113)}),
                  (($signed(reg113) << reg114) ?
                      (^~{reg115, wire112}) : $unsigned(reg114))} ?
              (wire107 * (^~$signed((reg113 < wire109)))) : $unsigned((reg115[(1'h1):(1'h0)] ?
                  ({(8'ha2)} != wire108[(1'h0):(1'h0)]) : ((^reg115) + (wire109 ?
                      wire112 : wire107))))))
            begin
              reg116 <= {(($signed(wire107[(4'hd):(4'h8)]) == $unsigned(wire111)) ^ {$signed((wire112 < wire111)),
                      $unsigned($unsigned(wire109))}),
                  (~&$signed({(~|wire111), (8'hb5)}))};
              reg117 <= reg116[(4'hc):(3'h4)];
              reg118 <= {(-wire111[(3'h4):(3'h4)]), $signed($signed(reg116))};
            end
          else
            begin
              reg116 <= reg117;
              reg117 <= $signed((8'hb9));
            end
          reg119 <= reg114;
          if (wire107[(1'h0):(1'h0)])
            begin
              reg120 <= {{(!$signed(((8'hba) ? wire110 : reg114))), reg117},
                  reg114};
              reg121 <= ($unsigned(reg113[(2'h2):(1'h0)]) - ($unsigned((~&reg117[(3'h5):(1'h0)])) <= reg115));
            end
          else
            begin
              reg120 <= $signed((^((7'h40) ? reg118[(4'h8):(3'h4)] : wire107)));
              reg121 <= (reg119[(4'hf):(3'h5)] ?
                  reg118[(1'h0):(1'h0)] : ({reg115[(1'h0):(1'h0)],
                      (+(~&wire108))} + $signed(wire109[(4'h9):(4'h9)])));
            end
        end
      else
        begin
          reg115 <= $unsigned(reg117);
          if (reg119)
            begin
              reg116 <= $unsigned(($unsigned($signed((wire110 >= reg117))) * wire109[(1'h1):(1'h1)]));
              reg117 <= (~^wire110);
              reg118 <= ($signed(reg119[(3'h4):(1'h1)]) ?
                  $signed((reg118 < (-((8'hbf) ?
                      wire108 : wire111)))) : reg121[(1'h0):(1'h0)]);
              reg119 <= (|$signed(reg115));
            end
          else
            begin
              reg116 <= $unsigned((+(reg116 == $signed((reg117 >> reg117)))));
              reg117 <= wire111;
              reg118 <= ($unsigned(wire112) ?
                  $unsigned((reg117 & $unsigned((reg114 ?
                      reg117 : (8'hb0))))) : (!$unsigned((^~wire112))));
            end
          reg120 <= ({reg115} <= (!{$unsigned((wire108 <= reg113)),
              reg117[(4'h9):(3'h5)]}));
          reg121 <= ((~|$unsigned($unsigned({wire108}))) ?
              reg114 : $unsigned($unsigned($signed(((8'hb1) ?
                  reg121 : (8'had))))));
        end
    end
  assign wire122 = $unsigned(((reg114 ?
                           reg116[(3'h6):(1'h1)] : $unsigned((wire109 | reg114))) ?
                       $signed((|(reg113 ?
                           reg117 : reg116))) : $signed(((8'ha5) && $signed(reg116)))));
  assign wire123 = reg120;
  always
    @(posedge clk) begin
      if ($unsigned(wire108))
        begin
          reg124 <= {{$signed((reg118 != {reg117, reg114})),
                  reg121[(1'h1):(1'h1)]},
              $signed($signed((!{wire108})))};
          reg125 <= (~|($unsigned(wire109) ?
              wire123[(2'h3):(1'h0)] : wire108[(2'h3):(2'h2)]));
          reg126 <= {(reg121[(2'h3):(2'h2)] << ($unsigned(wire108[(1'h0):(1'h0)]) >= $unsigned(((8'haa) ?
                  reg121 : reg125)))),
              ({((reg120 ? (8'hbf) : reg115) + wire123)} ?
                  (~|$signed(wire109)) : reg114)};
        end
      else
        begin
          reg124 <= wire122[(4'he):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg127 <= $unsigned(reg116[(4'h9):(4'h8)]);
      reg128 <= (~^$signed($signed(reg114[(4'h8):(4'h8)])));
    end
  assign wire129 = reg125;
  assign wire130 = reg118;
  always
    @(posedge clk) begin
      reg131 <= ((~^{((8'hb3) ?
              (wire111 >>> reg117) : reg127)}) >= $unsigned(({(+reg127)} ?
          ((8'hb6) ?
              $unsigned(wire111) : $signed(reg116)) : reg126[(3'h4):(2'h2)])));
    end
  assign wire132 = (+reg114);
  assign wire133 = reg131;
  assign wire134 = wire110;
  module135 #() modinst166 (wire165, clk, wire109, reg115, reg117, wire129, reg119);
  assign wire167 = reg127[(2'h2):(1'h1)];
endmodule

module module4
#(parameter param101 = ((^~(^(8'hbe))) ? {(8'hb0)} : {(~^((-(8'h9f)) >>> {(8'hb5), (8'hb2)}))}))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h256):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  assign y = {wire100,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire55,
                 wire53,
                 wire11,
                 wire10,
                 reg99,
                 reg98,
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
                 (1'h0)};
  assign wire10 = wire7[(1'h0):(1'h0)];
  assign wire11 = ($unsigned((&(wire5 * wire5))) ?
                      (wire9[(4'hf):(1'h1)] * ((-wire5) ?
                          wire5[(3'h7):(1'h0)] : wire5[(3'h4):(2'h2)])) : (8'hbc));
  module12 #() modinst54 (wire53, clk, wire11, wire6, wire10, wire9);
  assign wire55 = wire11;
  always
    @(posedge clk) begin
      reg56 <= wire11;
      reg57 <= (~^$unsigned(wire8));
      reg58 <= wire53;
      reg59 <= ((8'ha6) - (($signed(wire6[(4'h8):(2'h3)]) ~^ ($signed(wire53) ?
              (!(8'hae)) : wire10)) ?
          $unsigned($signed((+wire6))) : $unsigned($signed((reg56 ?
              wire9 : (8'ha7))))));
      if ((8'hbb))
        begin
          if (reg57)
            begin
              reg60 <= ({(!wire7[(2'h3):(1'h1)])} ?
                  ({(wire55 | reg59[(4'hf):(4'hc)]),
                      $signed(wire6)} & reg57) : (wire11 ?
                      {(((8'hae) * reg56) > wire55),
                          wire10} : $signed(((~|wire53) ?
                          wire6 : wire10[(4'hb):(4'h8)]))));
              reg61 <= ($unsigned($signed({$signed(wire53),
                      (wire53 <<< (7'h42))})) ?
                  (~^reg58) : ((&reg59[(3'h5):(2'h2)]) ^ reg60));
              reg62 <= (+wire7[(1'h1):(1'h1)]);
              reg63 <= (~$signed(wire55));
              reg64 <= $unsigned((reg59[(3'h5):(1'h0)] <<< wire53[(1'h1):(1'h0)]));
            end
          else
            begin
              reg60 <= (~^$signed(reg63[(2'h3):(1'h0)]));
              reg61 <= ((^~$signed({(~(8'ha1)), reg60})) - (wire5 ?
                  {$unsigned(reg60[(3'h6):(1'h1)])} : $signed({reg57})));
            end
          reg65 <= (wire10[(4'h8):(1'h0)] <<< $signed((^~reg57[(2'h3):(2'h2)])));
        end
      else
        begin
          if ({($signed($signed(reg65[(3'h4):(2'h2)])) ?
                  $unsigned((^(|(7'h44)))) : ({reg65[(4'hb):(2'h2)]} >= $unsigned((~|wire55))))})
            begin
              reg60 <= ((($unsigned(wire8) == (~(reg57 >>> wire11))) ?
                  wire53[(3'h5):(3'h4)] : $unsigned((((8'hb8) << wire7) ?
                      (8'hb4) : wire8))) <<< wire55[(4'h9):(3'h7)]);
              reg61 <= wire55[(3'h4):(1'h1)];
              reg62 <= ({(~&$unsigned((reg63 ?
                      (8'hb6) : wire8)))} >> {{($signed(reg60) ?
                          reg65 : reg58)}});
            end
          else
            begin
              reg60 <= ($signed(reg60[(4'hc):(4'hc)]) | wire10);
            end
          if (((($signed(((8'ha0) ? wire5 : reg58)) ~^ (~|$unsigned(wire53))) ?
              (+$unsigned($signed(wire8))) : (~^reg60)) * reg56[(4'ha):(3'h7)]))
            begin
              reg63 <= wire8[(4'hc):(4'hb)];
            end
          else
            begin
              reg63 <= (($signed((~(-reg64))) >> (((reg64 | wire9) ?
                      $unsigned(wire9) : wire7) ?
                  (reg62[(1'h0):(1'h0)] || (~&wire5)) : $unsigned((reg57 && wire8)))) >>> wire53);
            end
          reg64 <= reg62;
          reg65 <= {$signed($unsigned(($unsigned((8'hbb)) && (~|reg58)))),
              (8'hb9)};
        end
    end
  always
    @(posedge clk) begin
      reg66 <= {$signed(reg60[(2'h3):(1'h1)])};
      reg67 <= $signed((~|({(wire10 <<< wire9)} != (|$signed(reg64)))));
      if ($signed({wire8[(3'h4):(2'h3)]}))
        begin
          reg68 <= (wire55 ? (~&wire7) : $unsigned($unsigned((~|(~reg62)))));
          if ({($signed((wire9[(2'h2):(1'h0)] != {reg65})) ?
                  $unsigned(((~&reg57) > (reg61 ? wire53 : reg57))) : wire10)})
            begin
              reg69 <= ($unsigned(((8'hba) ^ $unsigned({reg65}))) ^ wire6[(5'h11):(4'h8)]);
              reg70 <= $signed($unsigned({reg61[(4'ha):(1'h1)]}));
              reg71 <= $signed(wire10);
              reg72 <= reg64;
              reg73 <= reg56[(3'h5):(1'h0)];
            end
          else
            begin
              reg69 <= $signed(reg68);
              reg70 <= ($unsigned((~|$unsigned(wire7))) ?
                  reg65[(4'he):(3'h7)] : (wire55 ?
                      $signed($signed((8'haa))) : (reg67[(3'h4):(2'h2)] == ((wire5 == reg71) << reg70[(4'h8):(2'h2)]))));
            end
          if ($unsigned((~(8'hbf))))
            begin
              reg74 <= reg61[(4'hc):(4'h9)];
            end
          else
            begin
              reg74 <= reg68;
              reg75 <= ($unsigned((reg57 ~^ ($unsigned(reg61) ?
                  (reg65 ?
                      reg64 : reg67) : $signed((8'ha3))))) == (|({$unsigned((8'h9e)),
                  (!reg59)} ^~ ($unsigned(reg67) ?
                  wire11[(2'h2):(1'h1)] : (&wire10)))));
            end
          if ($signed((((reg74[(1'h1):(1'h0)] ~^ (reg75 ?
              reg56 : reg68)) & (~|(&(8'ha7)))) < reg63)))
            begin
              reg76 <= wire11;
              reg77 <= $unsigned(((reg61 <= {(-reg60)}) && reg68[(5'h11):(4'h9)]));
              reg78 <= $signed(({{(~|wire8)}} ?
                  (wire10 < (+$signed(wire7))) : (~&wire10[(4'h8):(3'h6)])));
              reg79 <= wire5;
            end
          else
            begin
              reg76 <= $unsigned($unsigned((~^$unsigned(reg59))));
              reg77 <= ({wire5, $unsigned($signed((8'ha8)))} ?
                  {$signed((wire7[(2'h2):(1'h1)] - (+reg63)))} : reg73);
              reg78 <= reg66[(3'h4):(2'h3)];
              reg79 <= {(^reg67[(2'h2):(2'h2)]),
                  $signed(($unsigned($unsigned(reg57)) != $unsigned(wire9)))};
            end
          reg80 <= {$unsigned(reg69),
              ((8'hb0) == ($signed(reg68) ?
                  ((~|wire6) & ((7'h43) >= reg60)) : (reg78 ?
                      (reg64 ? reg76 : wire9) : reg65[(3'h5):(2'h2)])))};
        end
      else
        begin
          if ((~{$unsigned((~|{(8'h9e)}))}))
            begin
              reg68 <= $unsigned(((|((~&(8'ha9)) ~^ $unsigned((8'hae)))) >= reg66[(1'h1):(1'h1)]));
              reg69 <= ($signed($unsigned((~&$signed(reg80)))) + (~&{reg76,
                  (~^$unsigned(wire8))}));
              reg70 <= $signed($signed({($unsigned(reg62) ?
                      reg66 : (wire10 + reg64))}));
              reg71 <= {((^~reg66) || (&reg71))};
              reg72 <= $signed((~$signed($unsigned((reg80 ? reg79 : reg80)))));
            end
          else
            begin
              reg68 <= $unsigned((-reg61));
            end
          reg73 <= (~^$signed($signed(reg65[(2'h2):(1'h0)])));
          reg74 <= (-(~^$signed(reg56)));
          reg75 <= (((|reg68[(3'h6):(3'h4)]) ?
                  (8'hbd) : $unsigned((~(reg62 ? reg65 : wire10)))) ?
              (!reg57[(2'h2):(1'h0)]) : {reg62[(4'h9):(2'h2)]});
          reg76 <= {(({(reg79 ? wire9 : reg78), $unsigned(reg80)} ?
                      reg61[(3'h6):(1'h0)] : $unsigned((~&reg66))) ?
                  $signed(reg63[(1'h0):(1'h0)]) : $unsigned(reg60[(4'ha):(3'h7)])),
              $signed($unsigned({$unsigned(wire5), wire5[(4'h9):(3'h5)]}))};
        end
    end
  always
    @(posedge clk) begin
      if ($signed($signed($signed((+reg65[(4'hd):(4'hd)])))))
        begin
          if ((+$unsigned({(reg70[(4'h9):(1'h1)] ?
                  $signed(reg76) : (reg74 ~^ reg79))})))
            begin
              reg81 <= reg67;
              reg82 <= $signed(reg80);
            end
          else
            begin
              reg81 <= $unsigned({(($unsigned(reg73) ?
                          reg80[(3'h7):(2'h2)] : ((8'ha4) ? reg76 : (7'h44))) ?
                      $signed(reg69[(2'h3):(2'h2)]) : (8'hba))});
              reg82 <= reg70[(3'h7):(2'h3)];
              reg83 <= $signed((reg75[(3'h4):(1'h0)] ?
                  (|$unsigned((wire7 < wire9))) : $unsigned((^((7'h42) ?
                      wire9 : reg56)))));
              reg84 <= reg67[(4'h8):(1'h1)];
              reg85 <= {$unsigned((-$signed($unsigned(reg82))))};
            end
          reg86 <= {$signed(wire10)};
        end
      else
        begin
          reg81 <= $signed($unsigned(wire6[(3'h6):(2'h2)]));
        end
      if (wire8[(1'h1):(1'h0)])
        begin
          reg87 <= $signed(reg69);
          if ($signed($signed(({(reg61 ? reg78 : reg87), $unsigned((8'ha4))} ?
              $signed($unsigned(reg65)) : wire10))))
            begin
              reg88 <= reg59;
            end
          else
            begin
              reg88 <= ((-{reg56[(5'h11):(5'h10)],
                  (((8'ha2) ?
                      reg68 : reg76) <= (wire11 == reg58))}) | reg69[(3'h7):(3'h5)]);
              reg89 <= reg75[(1'h0):(1'h0)];
              reg90 <= (($unsigned((~^(reg66 >> (8'hbe)))) & $signed($unsigned(reg72[(1'h0):(1'h0)]))) ?
                  (~(($unsigned(reg70) ?
                      (reg75 && reg56) : $unsigned(wire9)) < $signed((8'hb3)))) : (wire10[(2'h2):(2'h2)] ^ (8'hae)));
              reg91 <= $unsigned((~|reg60[(4'hc):(3'h4)]));
            end
        end
      else
        begin
          reg87 <= reg90[(5'h12):(4'hb)];
          if (reg64)
            begin
              reg88 <= $signed($signed($unsigned({(reg83 ? wire5 : reg87)})));
              reg89 <= {reg90[(3'h6):(3'h6)], (|reg78[(1'h1):(1'h1)])};
              reg90 <= $signed($unsigned(((^~{reg83}) ?
                  $signed((~|wire8)) : $unsigned($unsigned(reg75)))));
              reg91 <= $unsigned(((($unsigned((8'h9c)) || (reg59 ?
                          reg57 : (8'hac))) ?
                      (^~reg71) : ({reg87, reg88} && wire10)) ?
                  $unsigned(wire5) : reg68[(4'h9):(4'h8)]));
            end
          else
            begin
              reg88 <= (~$unsigned($signed((!wire53[(2'h2):(1'h1)]))));
              reg89 <= {reg83[(2'h2):(1'h1)]};
              reg90 <= (reg57 || ($unsigned($signed(((8'h9f) <= reg73))) ?
                  {(reg73 <<< $signed((8'hb4))),
                      reg81[(2'h3):(1'h1)]} : ((reg85[(3'h5):(1'h1)] > $unsigned(wire11)) ?
                      ((!reg63) < $unsigned((8'ha4))) : wire11[(1'h0):(1'h0)])));
              reg91 <= $unsigned(((+(wire53[(1'h0):(1'h0)] ?
                  {reg57} : reg67)) ^~ reg62));
            end
          reg92 <= reg78;
          reg93 <= ((reg88 > ($signed((reg85 ?
              reg82 : reg84)) <<< ((~|reg69) > $unsigned(wire53)))) > (reg89[(5'h11):(1'h0)] & ($unsigned((~&reg62)) ?
              $unsigned($unsigned(reg70)) : reg81[(3'h4):(3'h4)])));
        end
    end
  assign wire94 = $unsigned(reg79[(1'h0):(1'h0)]);
  assign wire95 = wire94;
  assign wire96 = reg78[(2'h3):(1'h1)];
  assign wire97 = reg90;
  always
    @(posedge clk) begin
      reg98 <= $signed($signed(reg70[(3'h4):(3'h4)]));
      reg99 <= reg93;
    end
  assign wire100 = (^{$signed($unsigned(wire53)),
                       $signed(reg73[(1'h0):(1'h0)])});
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire19,
                 wire18,
                 wire17,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire17 = ((+$unsigned((^(-wire13)))) ?
                      $unsigned(({(wire16 ^~ wire15)} > wire16[(4'h9):(3'h6)])) : {$signed(wire15[(5'h12):(3'h6)])});
  assign wire18 = ($signed(wire14[(4'hb):(1'h0)]) ?
                      $unsigned(wire15[(5'h11):(5'h10)]) : wire14[(1'h0):(1'h0)]);
  assign wire19 = {wire16};
  always
    @(posedge clk) begin
      reg20 <= wire16;
      reg21 <= {wire17};
      reg22 <= (wire18 <<< $unsigned(wire16[(3'h6):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg23 <= wire14[(4'hd):(2'h3)];
      if (((($signed((wire17 * reg23)) << reg20) || (-wire18)) >>> (~^$signed((&(8'hb6))))))
        begin
          reg24 <= (^wire19);
          reg25 <= (wire18 ? {reg23[(1'h1):(1'h1)]} : reg20);
          if (wire19)
            begin
              reg26 <= $signed((reg22 ?
                  {$signed($unsigned(reg24))} : $unsigned(wire13[(3'h4):(1'h0)])));
              reg27 <= reg26;
              reg28 <= (reg22 ~^ wire13[(1'h1):(1'h0)]);
              reg29 <= reg23;
            end
          else
            begin
              reg26 <= $signed(((reg22[(1'h0):(1'h0)] < $signed({(8'hb8),
                  reg21})) + reg28));
              reg27 <= (!(!(8'hb3)));
              reg28 <= ($signed(((-$unsigned(reg23)) ^ (wire17 ?
                      (|wire17) : (~|reg21)))) ?
                  wire13 : {$unsigned(reg25[(3'h5):(2'h2)]),
                      reg27[(3'h4):(2'h2)]});
            end
        end
      else
        begin
          reg24 <= (reg26 ?
              $unsigned($unsigned($unsigned((7'h40)))) : $unsigned(wire16));
          if (((!wire15[(3'h4):(1'h0)]) ?
              {{wire19},
                  (-$unsigned((reg28 <<< reg25)))} : $signed((((^~reg24) ?
                      (~&wire18) : reg28[(1'h0):(1'h0)]) ?
                  $signed({wire19, (8'hbc)}) : wire19))))
            begin
              reg25 <= ($signed($unsigned({wire18[(5'h10):(4'h9)]})) > (~&{wire16}));
            end
          else
            begin
              reg25 <= reg27;
              reg26 <= wire17;
            end
        end
      reg30 <= reg27;
    end
  always
    @(posedge clk) begin
      if ($signed(wire19))
        begin
          reg31 <= reg22[(1'h0):(1'h0)];
          if (reg27)
            begin
              reg32 <= ($unsigned($signed((~&reg27[(2'h2):(1'h0)]))) <<< $unsigned($unsigned(((wire13 ?
                  reg27 : reg24) >>> (!reg29)))));
              reg33 <= (({$signed($signed((8'hae)))} - reg25[(3'h5):(2'h3)]) ^~ reg28[(2'h2):(1'h1)]);
              reg34 <= $signed((($signed(reg26[(2'h2):(1'h0)]) <<< $signed((^reg31))) > $signed((8'ha0))));
              reg35 <= $unsigned($unsigned((($unsigned(reg24) ?
                  (~&wire14) : $signed((8'h9d))) << (reg30[(3'h5):(2'h2)] ?
                  (reg27 >> (8'hbb)) : (|reg27)))));
            end
          else
            begin
              reg32 <= {reg20[(2'h2):(1'h0)]};
              reg33 <= reg33;
              reg34 <= $unsigned((!$unsigned(((wire19 ? reg24 : reg26) ?
                  $signed(wire15) : ((8'hbd) | reg21)))));
            end
          reg36 <= $signed(wire18[(4'hf):(4'hb)]);
          reg37 <= (($signed({reg35}) ?
              wire14 : {($signed((8'haa)) ? $signed(reg26) : reg26),
                  $signed(reg20)}) << {$signed((reg30[(2'h2):(1'h1)] != $signed(reg30)))});
        end
      else
        begin
          reg31 <= $signed(((wire19[(5'h12):(1'h1)] - reg29) * (wire16 >> {$unsigned(reg26)})));
          reg32 <= ($unsigned(((~&(-(8'h9c))) ?
                  $signed((reg36 || (8'h9e))) : $signed(reg24))) ?
              ($unsigned(reg30) ?
                  (((&reg33) || $unsigned(reg22)) ?
                      {reg27[(3'h5):(3'h5)]} : $signed((+reg31))) : {{(reg29 ?
                              reg34 : reg37),
                          (reg26 ? wire14 : wire16)}}) : reg24[(5'h10):(1'h1)]);
          reg33 <= reg21;
          reg34 <= $signed({$signed(reg31),
              $signed(((reg33 ? (8'hab) : reg21) ^~ reg28))});
          if (((wire19 ?
              $signed(((reg33 <= (7'h42)) ?
                  (reg36 > wire18) : (reg33 * wire16))) : wire16) || (8'haa)))
            begin
              reg35 <= (wire13[(1'h1):(1'h0)] ?
                  $signed($unsigned(wire13[(1'h1):(1'h1)])) : (($unsigned($signed(reg37)) ?
                          ((~^(8'hb8)) == (^~reg33)) : $unsigned((|(8'hb9)))) ?
                      (-reg33[(4'he):(2'h2)]) : ((^reg25) ^~ {(~|wire16),
                          (^~reg36)})));
              reg36 <= ((8'hae) ?
                  $signed(((reg23[(4'hc):(1'h0)] ? {reg25} : $signed(wire15)) ?
                      $unsigned((reg23 ? reg33 : reg35)) : ($signed(reg28) ?
                          $unsigned(reg31) : $unsigned(reg33)))) : reg31);
              reg37 <= $signed((7'h43));
            end
          else
            begin
              reg35 <= (+reg23);
              reg36 <= ($signed((^~(^~{reg31, (7'h42)}))) ^ ((^{(~^reg27)}) ?
                  reg36[(2'h2):(1'h1)] : (reg27[(1'h1):(1'h0)] ?
                      ((wire14 ~^ wire15) ?
                          $signed(reg30) : reg21[(4'hd):(2'h2)]) : {(-reg34)})));
              reg37 <= (~&reg35[(2'h2):(2'h2)]);
              reg38 <= (8'hbc);
            end
        end
      reg39 <= $unsigned($signed(wire18[(3'h6):(2'h2)]));
      reg40 <= (!wire16[(4'hd):(4'hd)]);
      reg41 <= {($signed(wire18[(5'h11):(4'hd)]) ?
              $signed((~&reg37[(1'h1):(1'h0)])) : reg36),
          wire15};
      reg42 <= wire19[(4'hf):(2'h2)];
    end
  assign wire43 = ($unsigned((wire13[(4'hd):(4'ha)] ^ ({reg40, reg30} ?
                          reg36[(2'h2):(1'h0)] : reg35))) ?
                      {($unsigned(reg34[(1'h0):(1'h0)]) ?
                              reg36 : (reg20[(1'h0):(1'h0)] ?
                                  reg25 : $signed(reg39)))} : ($signed((reg29 ?
                              (wire14 ? reg35 : (7'h42)) : (reg41 ?
                                  reg34 : wire15))) ?
                          $signed((^~(~reg29))) : ($signed({reg39}) ?
                              (reg35 < (~&reg42)) : reg20[(1'h0):(1'h0)])));
  assign wire44 = ({wire16[(3'h6):(3'h5)], $signed(reg36[(1'h0):(1'h0)])} ?
                      reg27[(2'h3):(1'h0)] : reg26[(1'h0):(1'h0)]);
  assign wire45 = $unsigned($unsigned(((|{reg37, reg26}) <= {(wire43 ?
                          reg37 : reg40),
                      {reg30, wire17}})));
  assign wire46 = (wire13 ^~ {wire19,
                      ((((8'hac) - reg37) >= reg23[(4'hb):(3'h7)]) >= reg33[(3'h4):(3'h4)])});
  assign wire47 = $signed((&({$signed(reg28)} ?
                      {$unsigned(wire18)} : $unsigned($unsigned(reg33)))));
  assign wire48 = $unsigned({{({reg20, reg23} ?
                              $signed((8'ha6)) : ((8'hb7) < reg41))},
                      $unsigned((reg29 ? $unsigned((8'haa)) : (&reg20)))});
  assign wire49 = ((~^wire18) ?
                      $signed((!$unsigned((wire15 ?
                          reg42 : wire45)))) : (reg40[(4'ha):(3'h5)] ?
                          (&reg41[(2'h2):(1'h1)]) : $unsigned(reg42)));
  assign wire50 = ((8'hb8) ?
                      wire48 : (wire18[(2'h2):(1'h1)] ?
                          $unsigned($unsigned(wire16[(3'h6):(1'h0)])) : ({$signed(reg32),
                              (wire46 ? reg29 : reg35)} ^~ ((reg26 << wire47) ?
                              wire43 : reg40))));
  assign wire51 = reg35[(2'h3):(2'h3)];
  assign wire52 = (($signed((8'ha8)) ?
                          wire48[(2'h2):(1'h0)] : (reg32[(2'h3):(2'h2)] ^ $signed((reg29 ^ wire48)))) ?
                      reg40 : wire13);
endmodule

module module135
#(parameter param163 = ((((^{(8'ha2), (8'hbf)}) ? (((8'hab) >> (8'hac)) | ((8'hbd) ? (8'hb2) : (8'h9d))) : (&(|(8'ha4)))) >= (&(|(+(8'hb3))))) ? (|({((8'haa) | (8'hb4))} ^ {((8'hb0) ~^ (8'hbb))})) : {((8'ha6) ? ((^(8'ha4)) ? (~^(8'hac)) : (7'h41)) : (8'hb3))}), 
parameter param164 = param163)
(y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire140;
  input wire signed [(4'ha):(1'h0)] wire139;
  input wire signed [(5'h10):(1'h0)] wire138;
  input wire signed [(2'h3):(1'h0)] wire137;
  input wire signed [(5'h13):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire161;
  wire signed [(2'h2):(1'h0)] wire160;
  wire [(4'hd):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire143;
  wire [(4'hb):(1'h0)] wire142;
  wire [(4'he):(1'h0)] wire141;
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(5'h11):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire143,
                 wire142,
                 wire141,
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
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire141 = ($unsigned(($signed((8'h9f)) <<< (-$unsigned(wire140)))) ?
                       (((^~wire139) & $unsigned((~|wire140))) >>> $signed(((wire138 ?
                               wire137 : wire136) ?
                           $signed(wire139) : (wire137 ?
                               wire137 : (8'ha4))))) : ((wire136[(4'ha):(3'h5)] > $signed(wire140)) ?
                           wire137[(2'h2):(1'h0)] : (!wire137[(1'h1):(1'h0)])));
  assign wire142 = $signed((~&wire141));
  assign wire143 = wire139[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned((wire143 & wire136)) >>> ((wire139 - (8'ha0)) ?
          wire138[(1'h1):(1'h1)] : wire143[(2'h3):(1'h0)]))) <= wire140[(5'h11):(4'h8)]))
        begin
          reg144 <= $unsigned($signed($unsigned(((wire138 ?
              wire137 : wire140) < ((7'h42) ~^ (8'hab))))));
          reg145 <= (($signed(($unsigned(wire140) ?
                      $signed(wire141) : $signed(wire136))) ?
                  {$unsigned(wire137[(1'h0):(1'h0)]),
                      (wire141[(4'he):(4'he)] ?
                          (wire137 ?
                              wire138 : (8'ha5)) : (^(8'hb6)))} : ({(~^wire141),
                      $signed(wire140)} == ($signed(wire136) < (wire142 ?
                      wire143 : reg144)))) ?
              ((wire138 + (!((8'hb5) ? wire142 : wire141))) ?
                  $unsigned(wire137[(1'h0):(1'h0)]) : ($unsigned((wire136 >> reg144)) ^~ wire139[(1'h1):(1'h0)])) : $unsigned(wire140[(5'h11):(3'h4)]));
          reg146 <= $unsigned($unsigned(reg144));
          reg147 <= (~|$unsigned($unsigned(((wire138 | wire136) ?
              (wire139 ? wire138 : reg146) : (reg144 ? wire136 : wire139)))));
        end
      else
        begin
          reg144 <= wire136[(5'h12):(4'h8)];
          reg145 <= (~$unsigned($signed($unsigned((reg144 ?
              (8'had) : (8'h9d))))));
        end
      reg148 <= wire138;
      if ($unsigned({{$unsigned(((8'ha0) ? wire137 : reg147))},
          (((8'had) ~^ (wire140 ^~ reg147)) ?
              wire139[(4'h8):(3'h7)] : wire139[(3'h6):(1'h1)])}))
        begin
          reg149 <= $signed(wire140);
          reg150 <= ($unsigned(wire137[(1'h1):(1'h1)]) ?
              $signed(reg148[(4'hb):(4'hb)]) : (^~wire140[(2'h3):(2'h2)]));
          reg151 <= (7'h42);
          reg152 <= ((~|((!(wire136 ? reg150 : wire143)) ?
                  reg148[(4'hd):(1'h0)] : $unsigned({reg149}))) ?
              (7'h42) : wire143[(3'h6):(3'h5)]);
        end
      else
        begin
          if ((&(reg149[(4'hd):(1'h0)] ?
              (~^$unsigned((reg148 == (8'hbd)))) : (({wire138} ?
                  reg145[(2'h2):(2'h2)] : (!reg145)) ~^ $unsigned((reg145 << wire143))))))
            begin
              reg149 <= $unsigned($signed(($signed((reg150 ?
                  wire140 : reg149)) || (7'h42))));
              reg150 <= (wire142 ?
                  $signed(wire139[(3'h7):(3'h4)]) : (reg150[(4'hb):(3'h5)] <= (^~(!(~&wire138)))));
            end
          else
            begin
              reg149 <= $signed(wire142[(3'h6):(3'h6)]);
              reg150 <= (reg152[(4'ha):(1'h0)] == reg145);
            end
          reg151 <= {{(($signed(wire139) ?
                      (wire141 || wire137) : (~^wire142)) != reg147),
                  ($unsigned(reg149) ?
                      {$signed(reg152),
                          (reg150 ? (8'hbf) : reg144)} : $signed({wire142,
                          wire143}))},
              reg147};
          if (({$unsigned((~^$unsigned(reg145))),
                  ({(wire139 >> (7'h43)), $unsigned(reg144)} ~^ (-(8'h9d)))} ?
              reg144[(4'h8):(2'h2)] : wire141))
            begin
              reg152 <= $signed((-(^~(~&(&reg146)))));
              reg153 <= $unsigned($signed(reg149[(4'h8):(3'h6)]));
              reg154 <= ($signed(wire142[(4'ha):(4'h9)]) ?
                  (($signed($unsigned(reg147)) ?
                      reg153 : {$unsigned(reg145)}) <<< {$unsigned(reg144),
                      reg144[(1'h0):(1'h0)]}) : {{(~^wire140[(4'hc):(3'h7)])},
                      (~|reg153[(1'h1):(1'h1)])});
            end
          else
            begin
              reg152 <= $unsigned((wire142 ~^ (&((~&wire143) ?
                  ((8'h9c) - wire138) : (reg150 ? wire136 : reg153)))));
              reg153 <= wire142[(3'h4):(2'h3)];
              reg154 <= (&$signed({(&$signed(reg150)), (~|{reg150, wire140})}));
              reg155 <= {$unsigned((!(((8'ha3) << wire139) ?
                      (reg147 ? reg151 : reg149) : reg154)))};
              reg156 <= ((!$signed(((|wire136) ?
                  ((8'hae) ? wire143 : reg152) : {reg148,
                      (8'hb8)}))) == $unsigned(({$signed(reg150),
                  $unsigned((8'hbb))} <<< ((reg150 ?
                  reg145 : wire143) || (reg153 > reg153)))));
            end
          reg157 <= (wire140[(1'h0):(1'h0)] ?
              $unsigned(reg144[(1'h1):(1'h0)]) : (!(wire136[(4'he):(3'h7)] == $unsigned($unsigned(reg145)))));
          reg158 <= (reg157 ?
              reg148[(2'h2):(1'h0)] : (wire140[(3'h6):(2'h2)] ?
                  reg156 : {(((8'hb4) ? wire143 : reg153) ?
                          $unsigned(wire139) : ((8'ha9) ? wire136 : reg149))}));
        end
    end
  assign wire159 = $unsigned(wire140[(4'hb):(2'h3)]);
  assign wire160 = {(reg151[(5'h13):(4'he)] + $unsigned(((wire137 << wire137) ?
                           (wire136 || wire159) : $unsigned(reg152)))),
                       ($signed(($unsigned((8'ha0)) ^~ reg146[(3'h6):(2'h2)])) ?
                           $signed(reg145[(3'h6):(2'h3)]) : ($signed((reg154 ?
                                   wire136 : reg144)) ?
                               reg146[(4'h9):(4'h8)] : (+$unsigned(reg144))))};
  assign wire161 = $signed(reg155);
  assign wire162 = $signed({((~^$signed((8'ha8))) ~^ (~^(~|(8'hab))))});
endmodule

module module183  (y, clk, wire188, wire187, wire186, wire185, wire184);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire188;
  input wire signed [(5'h10):(1'h0)] wire187;
  input wire [(4'ha):(1'h0)] wire186;
  input wire [(4'h8):(1'h0)] wire185;
  input wire [(3'h7):(1'h0)] wire184;
  wire [(4'he):(1'h0)] wire203;
  wire signed [(3'h6):(1'h0)] wire202;
  wire [(5'h10):(1'h0)] wire201;
  wire [(4'hc):(1'h0)] wire198;
  wire signed [(5'h13):(1'h0)] wire197;
  wire [(2'h3):(1'h0)] wire196;
  wire signed [(2'h3):(1'h0)] wire195;
  wire signed [(4'hf):(1'h0)] wire190;
  wire [(4'h9):(1'h0)] wire189;
  reg [(4'h9):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg193 = (1'h0);
  reg [(4'hc):(1'h0)] reg192 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg191 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire190,
                 wire189,
                 reg200,
                 reg199,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 (1'h0)};
  assign wire189 = wire188;
  assign wire190 = $unsigned(($signed(($signed(wire185) ?
                           {wire187} : $signed(wire185))) ?
                       $signed({$signed(wire189),
                           {wire186, wire187}}) : $unsigned(wire188)));
  always
    @(posedge clk) begin
      reg191 <= $signed(wire185);
      reg192 <= wire189;
      reg193 <= $signed($signed($unsigned($signed($unsigned(reg191)))));
      reg194 <= ($unsigned(reg191) ?
          (8'hbf) : ($signed(wire187) * (wire189[(3'h4):(1'h1)] ?
              ($unsigned(reg192) == $unsigned(wire185)) : (+$unsigned(reg191)))));
    end
  assign wire195 = $signed((wire190[(3'h4):(3'h4)] ?
                       (-wire188[(2'h2):(1'h1)]) : $signed((wire186[(2'h2):(1'h0)] + reg192[(2'h2):(1'h1)]))));
  assign wire196 = $unsigned((((8'hb4) != $signed((wire188 ?
                       (8'hbe) : (8'hac)))) + (wire186[(3'h7):(3'h6)] ?
                       $signed({wire185}) : ($unsigned(wire184) <<< $unsigned(wire185)))));
  assign wire197 = (!(wire184[(2'h2):(1'h1)] ?
                       wire188[(1'h1):(1'h0)] : $unsigned(reg193[(4'hf):(4'h8)])));
  assign wire198 = $signed((~^$unsigned({(8'hbc)})));
  always
    @(posedge clk) begin
      reg199 <= reg194[(4'hc):(4'hb)];
      reg200 <= {(wire188[(2'h2):(1'h1)] - (~($signed(wire197) ?
              wire188 : ((8'ha7) ? reg193 : wire197))))};
    end
  assign wire201 = $signed(wire197[(2'h3):(2'h2)]);
  assign wire202 = (~|(({$signed(wire184),
                           {wire187, reg192}} + {(wire196 ^~ (8'hac)),
                           $signed(reg192)}) ?
                       (((wire196 ?
                           wire201 : wire195) + $signed(wire186)) ^~ {$unsigned(wire184),
                           (~^wire196)}) : (((wire186 & wire186) ?
                           {wire189} : (&(8'hb5))) != $unsigned(reg194[(4'he):(4'hc)]))));
  assign wire203 = $unsigned(wire185[(3'h6):(3'h6)]);
endmodule
