module top
#(parameter param240 = ((({{(8'hbf)}, (-(8'ha5))} <<< {((8'hba) ? (8'ha7) : (8'hbb)), (~(7'h40))}) ~^ {(~^(!(8'ha8)))}) ? {((~&{(8'hbb)}) - (!((8'hb5) ? (8'hb3) : (8'haf)))), (~^(((8'hb6) ? (8'hab) : (8'hb8)) - (+(8'hb9))))} : (({((8'ha7) ? (8'hb9) : (8'hb3))} ? (((8'h9d) << (8'ha2)) ? {(8'ha8), (8'ha3)} : (~^(8'hb1))) : (8'haf)) ? {(((8'ha0) ? (8'haf) : (7'h43)) ? (+(7'h41)) : (8'hbd))} : (^~(((8'hb4) <<< (8'ha8)) >= ((8'hb0) >> (8'hbd)))))), 
parameter param241 = ({(~(+{param240, param240})), param240} ? param240 : (!{((~^(8'ha9)) ~^ {(7'h44)}), ((param240 ? param240 : param240) ? (param240 & param240) : {param240, param240})})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire239;
  wire signed [(4'h8):(1'h0)] wire235;
  wire signed [(4'hd):(1'h0)] wire234;
  wire signed [(5'h10):(1'h0)] wire233;
  wire [(2'h2):(1'h0)] wire232;
  wire [(3'h6):(1'h0)] wire231;
  wire signed [(3'h6):(1'h0)] wire230;
  wire signed [(5'h15):(1'h0)] wire229;
  wire signed [(4'hb):(1'h0)] wire228;
  wire [(5'h14):(1'h0)] wire227;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire225;
  wire signed [(5'h11):(1'h0)] wire237;
  assign y = {wire239,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire135,
                 wire225,
                 wire237,
                 (1'h0)};
  module4 #() modinst136 (wire135, clk, wire3, wire2, wire1, wire0, (8'hb1));
  module137 #() modinst226 (.wire139(wire135), .wire140(wire0), .wire138(wire2), .y(wire225), .wire141(wire3), .wire142(wire1), .clk(clk));
  assign wire227 = {{wire135[(3'h5):(1'h0)],
                           {{(~&wire0)}, $unsigned((~wire1))}}};
  assign wire228 = wire225;
  assign wire229 = {(8'ha3), wire227};
  assign wire230 = {$signed(wire225)};
  assign wire231 = wire0[(4'hb):(3'h6)];
  assign wire232 = ($unsigned(wire227[(3'h4):(3'h4)]) ?
                       (({wire228[(3'h7):(1'h0)]} - wire225) > wire135) : $unsigned((~wire135[(3'h6):(2'h3)])));
  assign wire233 = ($signed(wire230) && $unsigned($unsigned($signed($signed(wire231)))));
  assign wire234 = $unsigned(($unsigned($unsigned({wire3})) ?
                       (wire227 * (wire229[(5'h12):(3'h6)] ?
                           (^wire2) : {wire3,
                               wire225})) : $signed(($signed(wire0) << {wire0,
                           (8'h9f)}))));
  module4 #() modinst236 (.wire8(wire227), .wire7(wire2), .clk(clk), .wire5(wire1), .y(wire235), .wire6(wire225), .wire9(wire229));
  module93 #() modinst238 (wire237, clk, wire1, wire3, wire229, wire228, wire227);
  assign wire239 = $unsigned($signed($unsigned($unsigned((-wire228)))));
endmodule

module module137  (y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire142;
  input wire signed [(3'h6):(1'h0)] wire141;
  input wire signed [(4'ha):(1'h0)] wire140;
  input wire [(4'ha):(1'h0)] wire139;
  input wire signed [(3'h4):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire224;
  wire [(4'hd):(1'h0)] wire223;
  wire signed [(2'h3):(1'h0)] wire222;
  wire [(5'h15):(1'h0)] wire221;
  wire [(5'h12):(1'h0)] wire220;
  wire [(4'h8):(1'h0)] wire202;
  wire signed [(4'hb):(1'h0)] wire201;
  wire [(4'hf):(1'h0)] wire199;
  wire signed [(3'h4):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire145;
  wire signed [(4'hd):(1'h0)] wire144;
  wire signed [(5'h11):(1'h0)] wire143;
  reg [(4'h9):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg218 = (1'h0);
  reg [(4'h8):(1'h0)] reg217 = (1'h0);
  reg [(4'he):(1'h0)] reg216 = (1'h0);
  reg [(4'hc):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg212 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg211 = (1'h0);
  reg [(5'h13):(1'h0)] reg210 = (1'h0);
  reg [(4'h8):(1'h0)] reg209 = (1'h0);
  reg [(4'he):(1'h0)] reg208 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg207 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg206 = (1'h0);
  reg [(5'h13):(1'h0)] reg205 = (1'h0);
  reg [(5'h15):(1'h0)] reg204 = (1'h0);
  reg [(3'h6):(1'h0)] reg203 = (1'h0);
  assign y = {wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire202,
                 wire201,
                 wire199,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 (1'h0)};
  assign wire143 = (wire141[(1'h0):(1'h0)] + wire141);
  assign wire144 = (~|$unsigned(wire142[(3'h6):(2'h2)]));
  assign wire145 = (!(|wire141[(3'h4):(3'h4)]));
  assign wire146 = wire144[(4'hc):(3'h6)];
  assign wire147 = wire138[(3'h4):(2'h2)];
  assign wire148 = wire142[(3'h6):(2'h3)];
  assign wire149 = (~&((($unsigned(wire146) - {(8'hbf), wire139}) ?
                       (|(wire140 ? wire142 : wire147)) : ($unsigned(wire141) ?
                           (~|wire144) : (~wire141))) << wire140[(2'h2):(1'h0)]));
  module150 #() modinst200 (wire199, clk, wire145, wire140, wire146, wire147);
  assign wire201 = ((8'hb8) >= (+(~&$unsigned($unsigned(wire142)))));
  assign wire202 = ($signed($unsigned(wire201)) | ((8'haa) * $signed(wire201)));
  always
    @(posedge clk) begin
      reg203 <= ($signed((+($unsigned(wire138) + (wire145 & wire149)))) ?
          $unsigned(wire145) : wire145[(3'h4):(3'h4)]);
      reg204 <= (|{(|wire141[(3'h5):(3'h5)]),
          $signed($signed(wire143[(5'h11):(4'he)]))});
      if ((((8'haf) ?
          $signed(wire149[(2'h3):(1'h0)]) : (~$unsigned((wire142 & (8'h9e))))) <= (((~$unsigned(wire145)) < ((+wire145) ^~ {reg204,
              wire141})) ?
          wire202 : $unsigned($unsigned((wire140 | wire139))))))
        begin
          if ({(&wire144), (&(|$unsigned(wire143)))})
            begin
              reg205 <= wire140[(3'h5):(1'h1)];
            end
          else
            begin
              reg205 <= (|(wire138[(2'h2):(1'h1)] ^~ {(8'hbb)}));
              reg206 <= (wire140[(4'ha):(4'h8)] && ({$signed((wire202 >> wire139)),
                  wire201} > $signed((^~wire145))));
            end
          reg207 <= (({wire149,
                  wire138[(2'h2):(1'h0)]} | wire140[(2'h3):(1'h1)]) ?
              ($signed((wire144[(4'ha):(4'ha)] ?
                      (8'haf) : $unsigned((7'h40)))) ?
                  $signed((!(reg204 <<< wire144))) : (wire199 | $signed($signed(wire148)))) : wire142[(2'h3):(2'h3)]);
          reg208 <= wire202[(4'h8):(3'h5)];
        end
      else
        begin
          if ((^~(($signed(((8'h9e) >= wire149)) <<< {wire199, (^~wire139)}) ?
              $unsigned($unsigned((~|wire201))) : (!reg207))))
            begin
              reg205 <= {(-((+$signed((8'ha0))) << (~|(~reg206))))};
              reg206 <= (reg207 != $unsigned((~wire199)));
            end
          else
            begin
              reg205 <= wire146[(1'h1):(1'h0)];
            end
          reg207 <= wire145;
          reg208 <= wire138[(3'h4):(2'h2)];
          if ($signed($signed((((|wire202) <<< (+(8'hbe))) ?
              $unsigned((8'hb2)) : $signed(wire146)))))
            begin
              reg209 <= reg206;
              reg210 <= reg204;
              reg211 <= ((^reg205) ?
                  $signed((-$unsigned(reg207[(3'h6):(2'h2)]))) : ($unsigned($signed((wire139 ?
                          wire149 : wire147))) ?
                      $unsigned($signed(((7'h42) ?
                          wire138 : reg209))) : (&{(|wire142),
                          (wire138 ? reg208 : reg208)})));
            end
          else
            begin
              reg209 <= ((wire146 >> wire144[(4'h9):(2'h3)]) || $signed((!{$signed((8'hb1)),
                  (wire141 ? reg207 : reg207)})));
              reg210 <= {({wire140} <<< reg205[(5'h11):(4'h8)]), (8'haa)};
              reg211 <= wire143[(2'h3):(1'h0)];
              reg212 <= (((^$unsigned(wire144[(3'h4):(1'h1)])) - (8'ha2)) != (&$signed($signed((^reg207)))));
              reg213 <= $unsigned(reg203);
            end
          if ((((^~(~&(reg212 | wire143))) ?
                  ($signed((wire202 < (8'ha7))) ?
                      ((~|wire145) ?
                          reg212 : reg212) : (~^wire142[(1'h1):(1'h0)])) : $unsigned($unsigned($signed(reg206)))) ?
              {(!wire145), wire139} : (~|wire138)))
            begin
              reg214 <= reg206;
              reg215 <= wire142[(3'h4):(2'h3)];
              reg216 <= $unsigned($signed(((reg207[(4'h9):(2'h2)] ^~ reg209) || (8'h9e))));
              reg217 <= $signed(({(wire141 >> $unsigned(reg215))} << (^$unsigned(reg204[(4'hc):(3'h7)]))));
            end
          else
            begin
              reg214 <= (wire143[(4'h9):(3'h5)] ?
                  (8'hba) : $unsigned({$unsigned($unsigned(reg210))}));
              reg215 <= ($unsigned((wire147[(1'h0):(1'h0)] ?
                  (wire149 ?
                      (~reg208) : (reg206 ^ reg207)) : reg210[(3'h5):(1'h1)])) ^ wire139[(4'h9):(3'h4)]);
              reg216 <= {(+$unsigned((~^reg215))), reg212[(3'h6):(2'h2)]};
              reg217 <= reg212[(3'h5):(2'h2)];
              reg218 <= reg210[(4'hf):(4'h9)];
            end
        end
      reg219 <= (((wire142[(1'h1):(1'h0)] << ($unsigned(wire142) ?
                  wire202 : (|(8'hb7)))) ?
              ($unsigned((reg214 ? reg205 : reg212)) ?
                  $signed((wire145 != (8'hbe))) : wire139) : ($signed((reg211 | wire139)) ?
                  ((reg214 < wire145) == (reg214 < wire202)) : $unsigned((wire140 <= wire147)))) ?
          wire141 : ((!($unsigned(reg208) ~^ $signed((8'hac)))) ?
              $signed(wire149[(1'h0):(1'h0)]) : (~|($signed(wire201) > ((7'h43) ?
                  wire143 : reg216)))));
    end
  assign wire220 = reg219[(2'h2):(1'h1)];
  assign wire221 = $signed(reg205[(3'h5):(1'h1)]);
  assign wire222 = reg215[(3'h6):(3'h6)];
  assign wire223 = {reg217};
  assign wire224 = $unsigned({reg210});
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h279):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire5;
  input wire signed [(4'hf):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire131;
  wire [(5'h10):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire123;
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire66,
                 wire123,
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
      if (($unsigned((wire8[(2'h3):(2'h2)] ?
          (^~(wire5 ? wire7 : wire6)) : ((|wire6) ?
              $signed((8'hb9)) : (wire8 < (7'h40))))) * (($unsigned(wire5[(4'hd):(4'ha)]) & ((wire6 == (8'haa)) - {wire7,
              wire8})) ?
          (~&(&(wire8 & wire8))) : (wire8 ?
              $unsigned((wire9 ? wire5 : (8'hab))) : $signed((wire8 ?
                  wire5 : wire6))))))
        begin
          if (wire9)
            begin
              reg10 <= ((wire5 > {$unsigned((wire5 ? wire7 : wire5))}) ?
                  $signed((-((wire8 <<< wire8) != (~wire7)))) : (^wire7[(3'h7):(1'h1)]));
              reg11 <= $signed(wire6);
              reg12 <= wire6[(3'h5):(2'h2)];
              reg13 <= wire8[(5'h12):(3'h4)];
              reg14 <= $signed(wire7);
            end
          else
            begin
              reg10 <= (~^reg13[(3'h6):(3'h5)]);
              reg11 <= {{wire6[(2'h3):(1'h1)],
                      ((wire9[(5'h11):(3'h5)] ?
                          $unsigned((8'hab)) : {reg10}) >> wire7)},
                  {$signed(((wire5 ? reg14 : reg10) + $unsigned((8'hb2)))),
                      (~|(wire9[(3'h6):(3'h6)] ? reg12 : (~wire5)))}};
            end
          reg15 <= $signed(wire6[(3'h5):(3'h5)]);
          reg16 <= ((~{reg13, (~&wire7[(3'h7):(3'h5)])}) ?
              $signed({reg14,
                  $signed($unsigned(reg14))}) : ((wire5 * $signed({reg13,
                      wire5})) ?
                  ($unsigned((reg10 & wire6)) || ($signed(reg14) ?
                      ((8'had) ?
                          wire8 : reg15) : (~wire7))) : {reg13[(3'h5):(3'h4)]}));
          if (wire5)
            begin
              reg17 <= reg16[(4'h8):(2'h3)];
              reg18 <= $signed(reg11);
            end
          else
            begin
              reg17 <= (~{($unsigned(reg14[(5'h15):(4'hb)]) ?
                      wire5 : {(wire5 ? (8'hbe) : reg14), (!reg13)})});
            end
          reg19 <= (|reg14);
        end
      else
        begin
          reg10 <= reg16[(4'ha):(3'h6)];
          reg11 <= $unsigned(((((wire5 ? reg12 : reg12) ?
              reg13 : $unsigned(reg11)) > $signed((8'hbb))) & reg11));
        end
    end
  assign wire20 = (reg13[(3'h6):(3'h6)] ?
                      $unsigned((wire5[(4'he):(3'h7)] ?
                          $signed($signed(wire5)) : (8'hba))) : wire6);
  assign wire21 = {$unsigned($signed((8'ha7)))};
  assign wire22 = wire9;
  assign wire23 = (((|{(reg13 != wire22),
                      reg14[(4'hb):(4'ha)]}) || $unsigned(reg19)) || (&wire7[(3'h7):(2'h2)]));
  assign wire24 = (8'hb8);
  assign wire25 = reg15;
  module26 #() modinst67 (wire66, clk, wire7, wire25, wire21, wire20);
  always
    @(posedge clk) begin
      if (((!($signed((reg16 ?
          reg10 : reg17)) | (wire25[(4'h8):(2'h3)] | (reg17 || (8'haa))))) != $signed($unsigned($signed(reg16[(2'h3):(1'h0)])))))
        begin
          reg68 <= reg19[(4'hb):(2'h3)];
          reg69 <= wire6[(4'hb):(2'h3)];
          reg70 <= ((^~$signed(($signed(reg10) ?
              reg10[(2'h2):(1'h0)] : wire8))) <<< (-$signed((((8'hb8) >= wire25) >>> reg12[(3'h7):(2'h2)]))));
        end
      else
        begin
          reg68 <= reg13;
          reg69 <= reg15[(3'h4):(1'h1)];
          reg70 <= ((reg68 >> (!((~|wire25) >> {reg68}))) ?
              $unsigned(((-$unsigned(reg68)) ?
                  (!{reg19}) : $signed(wire21))) : reg10[(1'h1):(1'h1)]);
          if (((-$unsigned(reg70[(4'h8):(4'h8)])) ?
              ($unsigned((-$unsigned((7'h44)))) && {(8'haa)}) : wire5))
            begin
              reg71 <= $signed((~$signed(((wire8 == wire24) + reg17))));
              reg72 <= (($unsigned(reg70[(4'h9):(3'h4)]) * (reg69[(1'h1):(1'h1)] | ($unsigned(reg11) ?
                      (wire7 << wire6) : (~&reg19)))) ?
                  wire8 : wire66);
              reg73 <= wire8;
              reg74 <= $unsigned(reg12);
              reg75 <= ({(wire6 ?
                          (reg73[(1'h1):(1'h1)] != $signed(reg16)) : ((8'hb2) <= $unsigned(wire5))),
                      (^~$signed((~|wire9)))} ?
                  $unsigned((~^(~$unsigned(wire66)))) : reg72);
            end
          else
            begin
              reg71 <= reg69[(2'h2):(2'h2)];
              reg72 <= reg70;
              reg73 <= (~|((reg18[(3'h5):(1'h1)] ?
                  wire5 : (|$signed(reg16))) + (^~{(wire66 >>> wire21)})));
              reg74 <= {wire9[(4'h9):(4'h8)]};
            end
          if ($signed(($signed(((8'ha1) ?
              ((8'hbd) == reg17) : {reg73, reg10})) <<< $signed(((reg73 ?
                  reg68 : wire22) ?
              reg72 : (wire5 ? wire24 : reg72))))))
            begin
              reg76 <= reg72;
              reg77 <= (reg13[(3'h7):(1'h1)] <= (~^wire7[(4'hd):(4'hc)]));
            end
          else
            begin
              reg76 <= $unsigned({(~wire20),
                  $unsigned(((reg71 ? (8'hb2) : (8'ha6)) ?
                      (reg71 ? wire20 : reg74) : $signed((8'hbd))))});
            end
        end
      if ((^({(~|(wire6 ? wire9 : reg13)), (~$unsigned((8'ha8)))} ?
          $unsigned(($unsigned(reg13) >> wire24[(2'h3):(2'h2)])) : (^~$unsigned($unsigned(wire9))))))
        begin
          if ((((((reg69 ? reg70 : reg14) ?
                  ((8'h9d) << (8'h9d)) : ((8'ha4) ?
                      (8'hb5) : wire6)) ^ wire8[(4'h8):(3'h4)]) ?
              wire24 : ((^~wire21) ?
                  $unsigned((wire66 ?
                      wire8 : wire5)) : (|(&reg69)))) > (~&(($signed(reg71) <<< {(8'hb5)}) && wire7))))
            begin
              reg78 <= $signed((|$unsigned($unsigned(reg18))));
              reg79 <= reg75[(1'h1):(1'h1)];
              reg80 <= (wire20[(4'he):(2'h3)] ?
                  (wire66 >>> (reg15[(3'h4):(1'h0)] <<< $unsigned($unsigned(reg76)))) : ((7'h43) ?
                      (|{{wire8}, $signed(reg17)}) : $signed(($signed(reg76) ?
                          $signed((8'hab)) : $unsigned(reg73)))));
              reg81 <= $signed(wire21[(5'h10):(4'h9)]);
              reg82 <= (wire7[(4'hd):(3'h7)] ?
                  (!(reg69[(2'h2):(2'h2)] ^~ reg12[(3'h6):(2'h3)])) : reg76);
            end
          else
            begin
              reg78 <= ((reg69 ?
                  $signed(wire22[(1'h1):(1'h0)]) : $unsigned($signed((reg17 ?
                      wire9 : wire21)))) && (^$unsigned(((-(8'ha5)) && reg81[(3'h4):(2'h3)]))));
            end
          if ((~^(&$unsigned((8'ha5)))))
            begin
              reg83 <= $signed($unsigned($unsigned(($unsigned(reg81) ?
                  reg17[(3'h4):(1'h1)] : (^~wire66)))));
              reg84 <= $unsigned((((reg13 ? (reg19 ? reg81 : reg69) : reg68) ?
                      reg15 : $signed($unsigned(reg73))) ?
                  $signed($unsigned((wire25 ?
                      reg15 : reg72))) : $signed($signed((wire8 == reg83)))));
              reg85 <= (+$unsigned(reg80[(3'h4):(2'h3)]));
            end
          else
            begin
              reg83 <= $unsigned((&($unsigned($signed(wire8)) ?
                  $unsigned({reg80}) : (!wire25[(1'h0):(1'h0)]))));
            end
          reg86 <= $unsigned({reg71,
              ($signed((reg15 || reg74)) >= $unsigned(((7'h41) == (8'ha5))))});
          if (reg73[(1'h0):(1'h0)])
            begin
              reg87 <= reg72;
              reg88 <= (|(+(-$unsigned(wire24))));
            end
          else
            begin
              reg87 <= reg79;
              reg88 <= $unsigned(reg18);
              reg89 <= (+$signed(reg73));
              reg90 <= reg77[(1'h1):(1'h1)];
              reg91 <= (|(|$signed($unsigned((8'hb1)))));
            end
          reg92 <= ($unsigned((8'hb9)) ?
              reg10 : {($unsigned($unsigned(reg91)) > $signed($unsigned(wire9))),
                  ((((7'h43) ?
                      reg16 : wire21) - (wire5 - reg81)) > $signed((wire5 ?
                      reg89 : reg16)))});
        end
      else
        begin
          reg78 <= {$signed((^~((wire7 ?
                  reg70 : wire20) * reg70[(4'h9):(4'h8)]))),
              reg83};
          reg79 <= (&reg75);
        end
    end
  module93 #() modinst124 (wire123, clk, reg17, wire8, reg85, reg83, reg79);
  assign wire125 = (reg68 | $unsigned(reg91));
  assign wire126 = (reg72[(3'h5):(2'h2)] == reg83);
  assign wire127 = $unsigned({{reg81, $unsigned($signed(reg12))}});
  assign wire128 = $signed($signed((((reg80 ? wire7 : wire8) ?
                           (+wire126) : {(8'hb7), (8'ha4)}) ?
                       $unsigned($unsigned(wire123)) : $signed($unsigned(reg16)))));
  assign wire129 = $unsigned($unsigned($unsigned(reg78)));
  assign wire130 = $unsigned(wire128[(3'h4):(1'h1)]);
  assign wire131 = {{(8'h9f)}};
  assign wire132 = wire5[(4'h8):(1'h0)];
  assign wire133 = $signed($unsigned((^(8'hae))));
  assign wire134 = (((reg73[(1'h0):(1'h0)] ^~ reg70) ?
                           wire22[(1'h1):(1'h0)] : (($unsigned(wire133) ?
                                   $unsigned(wire126) : ((8'hb7) ?
                                       wire128 : reg70)) ?
                               $signed({wire24,
                                   wire126}) : reg15[(1'h1):(1'h1)])) ?
                       $unsigned((+wire133[(1'h0):(1'h0)])) : {(($unsigned((8'hb0)) ?
                               {wire24} : ((8'hab) ?
                                   (8'hb3) : wire25)) <= wire7),
                           $signed($unsigned((8'ha2)))});
endmodule

module module93
#(parameter param121 = (8'ha1), 
parameter param122 = param121)
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire98;
  input wire [(5'h11):(1'h0)] wire97;
  input wire signed [(3'h4):(1'h0)] wire96;
  input wire signed [(4'hb):(1'h0)] wire95;
  input wire signed [(5'h14):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire120;
  wire signed [(5'h15):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire113;
  wire signed [(4'he):(1'h0)] wire112;
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg117,
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
  always
    @(posedge clk) begin
      if ($signed((wire96 ?
          $signed((wire97[(5'h10):(5'h10)] >> (wire96 != wire95))) : $unsigned(((|wire94) ?
              $unsigned(wire95) : (wire96 | (8'haf)))))))
        begin
          reg99 <= ((wire97 ?
              ((wire95[(4'h9):(3'h7)] + $unsigned((8'hb3))) ?
                  wire97 : ((wire94 ? wire94 : wire95) ?
                      $unsigned(wire95) : {(8'hb7)})) : $unsigned(wire94[(4'h8):(3'h7)])) > ($unsigned((~(^(8'ha2)))) - (^~({wire96} >= (wire96 ?
              wire98 : wire96)))));
          reg100 <= wire95[(4'h9):(4'h8)];
        end
      else
        begin
          reg99 <= wire97;
          reg100 <= (8'hb0);
          reg101 <= $signed($signed(wire97));
          reg102 <= $signed(wire94[(5'h13):(4'h9)]);
          reg103 <= ((wire97[(4'hc):(4'hc)] ? {$signed((~^(8'hb8)))} : wire97) ?
              wire97[(4'h8):(2'h3)] : wire95);
        end
      reg104 <= {{reg100}, reg103};
      reg105 <= reg100;
      if (reg103)
        begin
          reg106 <= reg105;
          reg107 <= $unsigned(({(~|(reg106 ? reg99 : wire94)), reg101} ?
              {(reg106 || {reg105, reg104}),
                  reg104[(3'h6):(3'h4)]} : $unsigned((8'hb3))));
        end
      else
        begin
          if (((reg106[(1'h1):(1'h1)] + (({reg103} ?
                  reg101[(4'ha):(3'h5)] : $unsigned(reg104)) ?
              reg101 : (reg105[(3'h4):(2'h3)] == reg99[(5'h10):(1'h0)]))) >>> (($signed({reg99,
              reg105}) && reg103[(1'h1):(1'h0)]) == {{$signed(reg104),
                  $unsigned((8'hb1))}})))
            begin
              reg106 <= $unsigned({$signed((~&reg105))});
              reg107 <= {((^reg99[(3'h5):(1'h1)]) ?
                      wire98[(1'h1):(1'h0)] : (wire94 ? reg106 : {reg99})),
                  $unsigned((reg103 ?
                      $signed((reg99 ? wire97 : reg106)) : wire96))};
              reg108 <= reg100;
              reg109 <= ((reg103 ?
                      reg105[(2'h3):(1'h1)] : (^((reg105 < reg99) ?
                          (wire96 ? reg103 : reg100) : (reg108 ?
                              wire95 : reg104)))) ?
                  $signed(wire95) : $unsigned(((reg102[(2'h2):(1'h0)] >> {wire94}) >= $unsigned(((8'hb0) <<< reg107)))));
            end
          else
            begin
              reg106 <= $signed(reg106);
            end
          reg110 <= $unsigned($signed(wire98[(1'h0):(1'h0)]));
          reg111 <= wire94;
        end
    end
  assign wire112 = (reg103[(2'h3):(2'h3)] & ($unsigned((8'hb0)) <<< ((wire95[(1'h1):(1'h1)] ?
                       reg100 : $unsigned(wire98)) * ((reg107 ?
                       reg111 : (8'ha4)) | (wire94 ? reg103 : reg108)))));
  assign wire113 = $unsigned({(&$unsigned($unsigned(reg99))),
                       $unsigned($unsigned(reg101))});
  assign wire114 = ($signed((((^reg101) ?
                           (reg105 ?
                               reg107 : reg111) : reg107[(1'h1):(1'h1)]) - (wire113 ?
                           reg106[(2'h2):(1'h1)] : (wire112 ?
                               wire94 : reg100)))) ?
                       reg105 : $signed((((reg107 & wire96) > (reg110 >> wire113)) ?
                           reg108[(5'h12):(4'ha)] : $unsigned($signed(reg107)))));
  assign wire115 = $signed(wire94[(4'hb):(3'h6)]);
  assign wire116 = ((~$unsigned((~&(wire113 <= reg108)))) | reg108);
  always
    @(posedge clk) begin
      reg117 <= {(~^reg110[(3'h4):(2'h3)]), reg106[(1'h1):(1'h1)]};
    end
  assign wire118 = reg108;
  assign wire119 = $unsigned((8'ha5));
  assign wire120 = $unsigned((reg110 ?
                       (~&$signed((wire97 | wire98))) : $unsigned(((wire98 >>> wire116) ?
                           (reg105 > wire95) : (reg100 != reg100)))));
endmodule

module module26
#(parameter param64 = {(8'ha0)}, 
parameter param65 = {({param64, param64} ? param64 : (((param64 ? param64 : (8'h9e)) && (param64 < param64)) ? (~^(param64 != param64)) : ((param64 ? param64 : param64) ? param64 : (param64 ? (8'hb1) : param64)))), param64})
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  assign y = {wire51,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
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
                 reg53,
                 reg52,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire31 = ((~^((wire30 ? $unsigned(wire28) : wire29[(4'he):(4'hc)]) ?
                          wire29 : wire27)) ?
                      $signed($unsigned(wire28[(3'h6):(1'h0)])) : wire29[(4'h8):(3'h5)]);
  assign wire32 = $signed((8'ha3));
  assign wire33 = (((wire31[(1'h1):(1'h0)] ?
                          ((~|wire28) ^ $unsigned(wire27)) : $signed((8'hb4))) ?
                      ($unsigned(wire28) ^ (|(-wire30))) : $unsigned((wire27 ?
                          (-wire29) : (~^wire30)))) != wire28[(3'h4):(2'h2)]);
  assign wire34 = $signed($signed($signed(wire29[(2'h2):(2'h2)])));
  assign wire35 = wire32;
  assign wire36 = wire27[(1'h0):(1'h0)];
  assign wire37 = $signed(wire28);
  always
    @(posedge clk) begin
      reg38 <= $unsigned((^~($unsigned(((8'hb0) != wire34)) >>> (wire34 & $signed(wire29)))));
      if ((+wire28))
        begin
          reg39 <= (wire37[(1'h1):(1'h0)] || wire35[(2'h3):(1'h0)]);
          reg40 <= ($signed($unsigned(($unsigned(wire31) || (8'ha3)))) >= ($unsigned(wire32[(2'h2):(1'h1)]) ?
              (-($signed(wire30) <= $unsigned(wire33))) : $unsigned($unsigned(wire34[(3'h7):(1'h0)]))));
        end
      else
        begin
          if ((~^(~$unsigned(wire30[(2'h3):(2'h2)]))))
            begin
              reg39 <= {reg39[(1'h0):(1'h0)]};
              reg40 <= reg38[(3'h7):(3'h6)];
              reg41 <= ((&wire27[(1'h1):(1'h1)]) <<< ($signed({(wire35 <<< wire31),
                  wire31}) | (($signed(wire32) ?
                  {wire30} : {wire33, wire32}) <<< (((8'ha7) ?
                      wire34 : wire37) ?
                  (wire36 ? wire30 : wire37) : (wire35 >> (8'ha9))))));
              reg42 <= $signed(wire27[(1'h1):(1'h0)]);
              reg43 <= $unsigned($signed(reg39[(1'h1):(1'h0)]));
            end
          else
            begin
              reg39 <= {{(8'hb5), (8'hbb)}, wire35};
              reg40 <= wire31[(1'h0):(1'h0)];
              reg41 <= ((|wire27) - (~|wire35));
              reg42 <= $unsigned(wire32[(3'h5):(1'h0)]);
              reg43 <= wire33;
            end
          reg44 <= ((^~(wire34[(4'ha):(1'h0)] | wire29[(4'hd):(1'h0)])) ?
              (+(($signed(wire33) ?
                  reg39[(2'h3):(1'h0)] : $unsigned(wire35)) ~^ (+$signed(reg41)))) : wire34[(3'h6):(3'h6)]);
          if (wire37[(4'h9):(3'h4)])
            begin
              reg45 <= ((({$unsigned(wire30)} ?
                      reg42[(4'h8):(4'h8)] : (~|wire29[(4'hb):(4'hb)])) ?
                  {{$signed(wire28), (reg39 << wire31)},
                      $unsigned((wire31 ?
                          (7'h40) : reg40))} : (~&(reg44 ~^ (wire30 ?
                      wire32 : reg42)))) <= (reg41 ?
                  (|($unsigned(reg38) - $unsigned(wire37))) : $unsigned((+$unsigned((8'hb6))))));
              reg46 <= ((~$signed(wire35)) ?
                  ((-($unsigned(wire35) ?
                      reg40[(1'h1):(1'h1)] : $unsigned(wire37))) > $signed((reg43[(3'h4):(1'h0)] + (^~wire37)))) : ((!(wire36 ?
                      $unsigned(wire36) : $signed(wire30))) && ($signed(wire30) >> reg39[(1'h1):(1'h0)])));
              reg47 <= ($signed($unsigned(reg40[(1'h0):(1'h0)])) == ((wire34 | wire37[(2'h3):(1'h1)]) | (((reg39 <= wire28) ?
                  reg39 : wire35) + $signed((&wire32)))));
            end
          else
            begin
              reg45 <= wire36;
            end
          if ((wire27[(2'h3):(1'h0)] > ((((~^wire29) ?
                      reg46[(3'h7):(3'h5)] : $unsigned((7'h42))) ?
                  wire36 : $unsigned(wire33)) ?
              {($unsigned(reg44) ?
                      $signed((8'hb9)) : ((8'hb2) ?
                          wire30 : reg42))} : reg44[(3'h6):(3'h5)])))
            begin
              reg48 <= reg46[(4'hd):(3'h7)];
            end
          else
            begin
              reg48 <= reg42;
            end
        end
    end
  always
    @(posedge clk) begin
      reg49 <= reg48;
      reg50 <= wire33[(1'h1):(1'h0)];
    end
  assign wire51 = $unsigned(wire31);
  always
    @(posedge clk) begin
      if ({wire32[(3'h6):(2'h3)]})
        begin
          reg52 <= {({$unsigned(reg48[(3'h4):(3'h4)]),
                      (reg46[(4'hb):(4'h8)] >= $unsigned((8'hb6)))} ?
                  $unsigned($signed((wire51 ? reg40 : reg45))) : (&((reg45 ?
                      wire33 : reg45) ~^ {wire37})))};
          reg53 <= $unsigned((~^(-((wire32 ? reg41 : (8'h9e)) * (~|wire37)))));
          reg54 <= (($signed(reg46) ?
              (~({reg47} | (^(7'h42)))) : wire36) + $signed(({(8'hb9),
                  wire37[(4'hb):(2'h3)]} ?
              {(-reg38)} : {(reg38 ? reg40 : reg39),
                  (reg48 ? wire33 : wire29)})));
        end
      else
        begin
          reg52 <= ($signed((^$unsigned((+reg54)))) ?
              wire33[(4'hc):(2'h2)] : $signed((|((reg41 != (7'h43)) >>> reg46[(4'ha):(3'h4)]))));
          reg53 <= ((^(wire31[(1'h1):(1'h0)] - ($signed(reg49) || $signed(reg49)))) ?
              (wire34[(3'h6):(1'h1)] <= ({reg45} ?
                  $unsigned(wire33[(4'hc):(3'h4)]) : (&$unsigned(wire32)))) : reg53);
          reg54 <= (reg52[(2'h2):(1'h0)] ?
              reg54[(3'h7):(3'h6)] : (((^~(reg52 * (8'hae))) ?
                  (~^(reg50 && reg44)) : reg44) * reg43[(3'h4):(2'h2)]));
          if (wire37[(1'h0):(1'h0)])
            begin
              reg55 <= (~wire32[(2'h3):(2'h2)]);
              reg56 <= {((((wire27 ? (8'ha2) : wire36) ?
                      $unsigned(reg53) : (8'hae)) < {$signed(reg42),
                      (reg52 * wire36)}) <<< $signed((reg50[(1'h0):(1'h0)] + wire36[(4'h9):(3'h6)])))};
            end
          else
            begin
              reg55 <= ((reg49 ?
                      (^~((wire28 | reg52) ?
                          $unsigned(reg48) : (8'hbf))) : wire33[(4'hc):(2'h2)]) ?
                  $signed((8'haf)) : reg52[(3'h5):(1'h0)]);
            end
        end
      reg57 <= $signed((($signed((~(8'ha2))) != ((reg40 > reg48) <= {reg49,
          reg48})) + $unsigned(wire36[(4'h9):(2'h3)])));
      reg58 <= (((-(wire28 ?
              reg52[(3'h4):(2'h2)] : ((8'hac) << reg40))) >= ($unsigned($signed((8'ha0))) ?
              (~(reg46 | reg45)) : {$unsigned(wire37)})) ?
          $signed(((wire28 ? $unsigned(reg55) : {reg50, wire33}) ?
              $signed(reg48) : ((reg47 + reg47) ?
                  reg44[(3'h4):(1'h1)] : wire37))) : (^(~|{$signed(reg43)})));
      if (wire31[(2'h2):(2'h2)])
        begin
          if (reg54[(5'h15):(3'h4)])
            begin
              reg59 <= {((|{(|wire33), (reg48 & reg42)}) ?
                      $signed((~&(wire36 ?
                          wire37 : (8'had)))) : $unsigned((|(!reg53)))),
                  reg58};
              reg60 <= (~reg53);
            end
          else
            begin
              reg59 <= $unsigned((8'hbe));
              reg60 <= wire36;
              reg61 <= reg56;
            end
          reg62 <= $signed((8'hbe));
          reg63 <= $unsigned(reg38);
        end
      else
        begin
          if (wire33)
            begin
              reg59 <= (8'hb4);
            end
          else
            begin
              reg59 <= reg42;
              reg60 <= $signed((wire32[(2'h3):(1'h0)] + ({reg61} ?
                  reg48[(2'h3):(2'h2)] : $unsigned($unsigned(reg41)))));
              reg61 <= $unsigned(((~((wire37 ?
                  wire36 : reg60) & $signed(reg57))) ^ wire28));
              reg62 <= wire34[(3'h7):(3'h5)];
              reg63 <= reg41;
            end
        end
    end
endmodule

module module150
#(parameter param197 = (8'ha1), 
parameter param198 = {{(~&(+(^~param197)))}})
(y, clk, wire154, wire153, wire152, wire151);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire154;
  input wire [(4'ha):(1'h0)] wire153;
  input wire signed [(3'h4):(1'h0)] wire152;
  input wire signed [(4'hd):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire196;
  wire [(3'h6):(1'h0)] wire195;
  wire signed [(5'h11):(1'h0)] wire194;
  wire [(3'h6):(1'h0)] wire193;
  wire signed [(3'h7):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire179;
  wire [(3'h5):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(5'h13):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire [(2'h3):(1'h0)] wire165;
  wire [(5'h15):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  reg signed [(4'ha):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  reg [(2'h2):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg186 = (1'h0);
  reg [(4'hd):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg182 = (1'h0);
  reg [(3'h7):(1'h0)] reg181 = (1'h0);
  reg [(3'h6):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg176 = (1'h0);
  reg [(4'h9):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg161 = (1'h0);
  reg [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire180,
                 wire179,
                 wire178,
                 wire170,
                 wire169,
                 wire167,
                 wire166,
                 wire165,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg168,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 (1'h0)};
  assign wire155 = (wire152[(2'h2):(1'h1)] ?
                       wire154 : $unsigned({wire152[(1'h0):(1'h0)]}));
  assign wire156 = wire153[(3'h7):(2'h2)];
  assign wire157 = ($unsigned((+($unsigned(wire154) == wire151[(4'hb):(4'hb)]))) ?
                       wire154[(2'h2):(2'h2)] : {(((wire155 ?
                                   (7'h41) : wire155) ?
                               wire152 : wire156[(5'h10):(1'h1)]) || (wire155 ?
                               {wire155} : wire151))});
  assign wire158 = {(~&(^(^wire152[(2'h3):(1'h0)]))),
                       $signed((wire154 * (8'h9f)))};
  always
    @(posedge clk) begin
      if (wire153)
        begin
          reg159 <= wire158;
          reg160 <= $signed((8'hbf));
          reg161 <= (+{wire152[(2'h2):(1'h0)],
              ($unsigned(wire156) == ($signed((7'h44)) && (reg160 | wire157)))});
          reg162 <= $signed({(&$signed((wire151 > (8'hb3))))});
        end
      else
        begin
          reg159 <= $signed(($signed(wire156[(5'h14):(2'h3)]) ?
              $signed($signed({reg161, wire153})) : {wire157[(5'h11):(4'hd)],
                  (|(wire157 ? (8'ha7) : reg160))}));
          if (wire158)
            begin
              reg160 <= $unsigned(reg160);
            end
          else
            begin
              reg160 <= reg161[(5'h10):(4'h9)];
              reg161 <= reg162[(2'h2):(1'h0)];
              reg162 <= wire157;
              reg163 <= (+reg162);
            end
          reg164 <= wire154;
        end
    end
  assign wire165 = (reg159[(3'h7):(1'h1)] == $unsigned(wire158[(3'h6):(2'h2)]));
  assign wire166 = wire153;
  assign wire167 = ((~(~wire151)) << (8'ha9));
  always
    @(posedge clk) begin
      reg168 <= (~(+(reg162 ? (-$unsigned(reg159)) : wire165[(2'h2):(1'h0)])));
    end
  assign wire169 = (&(~|({(reg161 ? reg164 : wire151)} - ((7'h41) ?
                       {wire152} : $signed((8'ha9))))));
  assign wire170 = $unsigned($signed((($signed(wire155) ?
                           ((8'ha8) ? wire155 : wire165) : (~|reg162)) ?
                       ($signed(reg162) ?
                           reg162[(2'h3):(2'h2)] : (wire155 ?
                               wire165 : reg164)) : {{(8'hbc), wire167}})));
  always
    @(posedge clk) begin
      if ($unsigned(({(!$unsigned(wire152))} & (~wire157[(4'he):(3'h5)]))))
        begin
          reg171 <= (($signed((^(wire151 || wire155))) <<< {$signed((~&wire152)),
              $unsigned((~&reg168))}) - $signed($signed(((reg160 ?
                  reg168 : (8'ha8)) ?
              $signed(wire166) : (~&wire158)))));
          reg172 <= wire152[(2'h2):(2'h2)];
        end
      else
        begin
          if ((8'ha0))
            begin
              reg171 <= $unsigned((wire169[(4'hc):(2'h2)] ?
                  (~|$unsigned($unsigned(wire166))) : $signed(wire167)));
              reg172 <= $signed($unsigned(wire157));
              reg173 <= $unsigned(wire157[(4'hb):(2'h2)]);
              reg174 <= (8'hbd);
              reg175 <= {($unsigned(reg160) & ($signed((-reg163)) >= ((wire155 ?
                          wire155 : (8'hbc)) ?
                      ((8'ha3) <= reg161) : $signed((7'h43)))))};
            end
          else
            begin
              reg171 <= $signed($unsigned(wire156));
              reg172 <= (((8'hac) ?
                      {$signed((~^wire167))} : (reg172 ?
                          ((reg173 ? (8'ha4) : (8'hbe)) ?
                              (reg160 ? wire167 : (8'ha5)) : {reg161,
                                  wire153}) : wire166)) ?
                  reg162[(2'h3):(1'h1)] : {((^~(wire153 ?
                          reg161 : reg159)) > reg163[(4'hd):(1'h1)])});
              reg173 <= {wire151};
              reg174 <= (!(^reg159[(3'h7):(1'h0)]));
            end
        end
      reg176 <= wire170;
      reg177 <= ((~&reg163[(3'h7):(1'h0)]) ^~ {reg176});
    end
  assign wire178 = reg159[(3'h5):(3'h5)];
  assign wire179 = ({$signed(($unsigned(wire165) || (reg163 <<< wire154)))} ?
                       ((^~$unsigned($unsigned(wire155))) ?
                           $unsigned((8'ha6)) : (8'ha6)) : $unsigned($unsigned((8'hbd))));
  assign wire180 = $unsigned({((~&(wire154 ? reg164 : wire155)) | wire155),
                       {(~reg160[(3'h4):(1'h1)]), $signed(wire153)}});
  always
    @(posedge clk) begin
      reg181 <= wire179[(2'h2):(1'h1)];
      reg182 <= ((&(reg162[(3'h6):(1'h0)] < (reg164[(2'h3):(1'h0)] ?
              reg174[(3'h7):(2'h3)] : (&reg168)))) ?
          (~$signed(wire179[(1'h0):(1'h0)])) : $unsigned((((reg161 - wire169) ?
                  (wire152 ? reg171 : reg181) : reg172[(4'hb):(4'h9)]) ?
              ((reg175 ? wire165 : wire165) ?
                  (wire157 != reg168) : wire156[(1'h0):(1'h0)]) : $signed(wire154[(4'h8):(4'h8)]))));
      reg183 <= (8'hac);
    end
  always
    @(posedge clk) begin
      reg184 <= $signed($unsigned($signed($signed($signed((8'hbb))))));
      reg185 <= (8'hb1);
      if ((($signed($signed((^wire158))) ?
          $unsigned(wire151) : $signed($unsigned(wire179[(3'h6):(3'h6)]))) ^ (reg173 <= (~|(^~wire158[(2'h2):(2'h2)])))))
        begin
          if ($signed(((^(~^wire151)) ?
              ($signed($signed((8'ha8))) ^ $signed(reg184)) : (^(^~(wire180 ?
                  reg172 : wire178))))))
            begin
              reg186 <= $unsigned(wire179);
              reg187 <= reg171;
              reg188 <= (~^(~|$unsigned(($signed(wire152) || reg184[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg186 <= {(wire153[(4'h9):(3'h6)] ?
                      (~|reg187[(4'hd):(4'hb)]) : wire170),
                  (~^(8'ha3))};
              reg187 <= $unsigned({reg188, $signed((~reg187[(3'h6):(2'h3)]))});
            end
          reg189 <= $signed(wire157);
          reg190 <= wire151;
          reg191 <= $signed($signed($unsigned(reg174)));
        end
      else
        begin
          reg186 <= (reg190[(1'h1):(1'h0)] >> reg177);
          reg187 <= {((&(^~$signed(reg183))) < reg182)};
          reg188 <= (~&reg161);
          reg189 <= (((($signed(reg177) - (&reg188)) ?
              ($unsigned(wire180) ?
                  reg173 : (wire155 ?
                      reg177 : reg182)) : (8'ha1)) >>> ((reg172[(3'h4):(1'h1)] <<< (wire156 || (8'hb6))) < {{wire156}})) >= $unsigned(reg189[(4'hc):(4'hc)]));
          reg190 <= ($unsigned((((^reg190) <<< (~wire166)) * $unsigned(wire170[(1'h1):(1'h0)]))) > $signed((($signed(reg162) ?
                  {reg162, reg190} : $unsigned(wire153)) ?
              reg163 : $unsigned(reg183))));
        end
    end
  assign wire192 = $unsigned(reg161[(1'h0):(1'h0)]);
  assign wire193 = wire154[(3'h7):(3'h7)];
  assign wire194 = $signed(($unsigned($signed(reg186)) ?
                       (((wire166 == reg161) ?
                           {reg185} : (reg187 << reg190)) >> ({reg171} ?
                           (8'hac) : {wire193,
                               (8'hb8)})) : ((~|wire152[(1'h0):(1'h0)]) ?
                           (wire179 ?
                               $unsigned(wire193) : $unsigned(wire178)) : (-{(8'ha8)}))));
  assign wire195 = (($signed((~^(wire167 ?
                           wire169 : reg190))) ^ wire153[(3'h6):(3'h6)]) ?
                       wire155[(1'h1):(1'h0)] : (~&reg177));
  assign wire196 = {reg171[(5'h10):(3'h4)]};
endmodule
