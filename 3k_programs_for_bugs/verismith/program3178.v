module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire251;
  wire [(2'h2):(1'h0)] wire249;
  wire [(5'h14):(1'h0)] wire248;
  wire signed [(4'ha):(1'h0)] wire246;
  wire [(4'h9):(1'h0)] wire245;
  wire signed [(4'h9):(1'h0)] wire244;
  wire signed [(4'h8):(1'h0)] wire243;
  wire [(4'h8):(1'h0)] wire242;
  wire [(5'h15):(1'h0)] wire236;
  wire signed [(5'h15):(1'h0)] wire233;
  wire [(5'h15):(1'h0)] wire232;
  wire signed [(5'h12):(1'h0)] wire231;
  wire [(5'h15):(1'h0)] wire230;
  wire [(4'hb):(1'h0)] wire229;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire227;
  wire signed [(4'ha):(1'h0)] wire238;
  wire [(5'h10):(1'h0)] wire239;
  wire [(4'ha):(1'h0)] wire240;
  reg [(5'h13):(1'h0)] reg235 = (1'h0);
  reg [(5'h12):(1'h0)] reg234 = (1'h0);
  assign y = {wire251,
                 wire249,
                 wire248,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire236,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire4,
                 wire227,
                 wire238,
                 wire239,
                 wire240,
                 reg235,
                 reg234,
                 (1'h0)};
  assign wire4 = $signed($unsigned((wire0[(3'h4):(2'h2)] * {wire3[(2'h3):(1'h0)]})));
  module5 #() modinst228 (.wire8(wire4), .wire6(wire0), .wire10(wire2), .clk(clk), .wire7(wire1), .y(wire227), .wire9(wire3));
  assign wire229 = wire1;
  assign wire230 = $unsigned((wire3[(4'h8):(3'h4)] ?
                       wire4 : (|(wire0[(3'h5):(3'h5)] ^ $signed(wire4)))));
  assign wire231 = wire3;
  assign wire232 = (wire1 ?
                       $signed($signed($unsigned($unsigned((8'ha9))))) : ({(((8'ha1) ?
                                   wire0 : wire231) > (wire227 ?
                                   (8'ha2) : (8'hbf)))} ?
                           (($signed(wire229) > $unsigned(wire229)) ?
                               $unsigned((wire229 ?
                                   wire4 : wire230)) : wire3) : $unsigned(wire229)));
  assign wire233 = $unsigned(wire2[(4'h9):(2'h3)]);
  always
    @(posedge clk) begin
      reg234 <= {$signed(wire227[(5'h13):(3'h5)])};
      reg235 <= ($unsigned(wire2) && wire231[(4'h8):(3'h7)]);
    end
  module53 #() modinst237 (wire236, clk, wire232, wire231, wire1, wire229, wire2);
  assign wire238 = {wire231[(4'hb):(3'h6)]};
  assign wire239 = (($unsigned(wire238) <= (reg235 ?
                           (^~wire230) : (~&{wire227, reg235}))) ?
                       ($signed({$unsigned(reg235),
                           $unsigned(wire229)}) && {reg234[(2'h3):(2'h2)]}) : $unsigned($unsigned($signed($unsigned(wire3)))));
  module5 #() modinst241 (wire240, clk, wire232, wire238, reg234, reg235, wire236);
  assign wire242 = (wire1[(5'h10):(4'hc)] ?
                       (~^$signed(reg235)) : $signed(((-wire238) ?
                           wire231[(3'h5):(3'h4)] : (wire240 < $unsigned(wire1)))));
  assign wire243 = ((~^wire231[(4'hf):(4'hb)]) ?
                       $signed((!({wire4, wire0} ?
                           (wire236 + wire236) : (wire0 && wire240)))) : $signed(wire233[(1'h0):(1'h0)]));
  assign wire244 = {($unsigned({$unsigned(wire242), reg235}) ?
                           {wire232,
                               $signed((wire232 ?
                                   wire227 : (8'hab)))} : wire240),
                       (wire233 ?
                           (wire240 || {(wire230 ?
                                   wire229 : wire233)}) : {$signed(reg234)})};
  assign wire245 = ((($unsigned($signed(reg234)) == wire2[(5'h12):(5'h12)]) > $unsigned({$unsigned((8'hb8))})) ?
                       wire240 : {wire238[(1'h0):(1'h0)],
                           (wire242 - (wire242[(3'h4):(2'h3)] + $signed(wire2)))});
  module28 #() modinst247 (wire246, clk, wire1, wire232, wire233, wire4);
  assign wire248 = (wire233[(4'ha):(2'h2)] ? wire227 : wire1);
  module28 #() modinst250 (.wire32(wire243), .clk(clk), .wire31(wire2), .wire30(wire236), .y(wire249), .wire29(wire240));
  assign wire251 = ((~^wire233[(3'h7):(1'h1)]) < ((wire232 ?
                       $signed((wire236 ?
                           wire249 : wire248)) : $signed((wire227 ?
                           wire248 : (8'hb5)))) != ({wire248,
                           ((8'hba) ? wire4 : wire3)} ?
                       (((8'ha7) ? wire238 : wire230) ?
                           (wire244 && wire227) : (wire1 ?
                               (8'ha3) : wire243)) : (|wire4[(5'h12):(4'hf)]))));
endmodule

module module5
#(parameter param226 = (((((^(8'hb6)) == (+(8'had))) ? (((8'hbd) ? (8'ha6) : (8'ha9)) ? ((8'hbb) ? (8'ha9) : (8'h9e)) : ((8'ha3) == (8'ha3))) : ((~|(8'ha9)) <= (+(8'hb9)))) ? (+(((8'hbb) + (8'ha6)) ? ((8'hb2) | (8'had)) : ((8'hb1) < (7'h40)))) : (~(((8'hba) <<< (8'hbb)) | ((8'h9f) != (8'hbf))))) ? {{(((8'haa) || (8'ha9)) << ((8'hbf) ? (8'ha9) : (7'h40)))}, (&((^(8'ha1)) || (~&(8'hb8))))} : (+{(((8'ha8) ? (8'hbd) : (8'hb0)) == ((8'hab) >= (8'ha8))), {(!(7'h40)), (8'hbe)}})))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h3aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire225;
  wire [(3'h6):(1'h0)] wire224;
  wire signed [(5'h11):(1'h0)] wire223;
  wire signed [(5'h14):(1'h0)] wire222;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire203;
  reg signed [(4'ha):(1'h0)] reg221 = (1'h0);
  reg [(5'h12):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg218 = (1'h0);
  reg [(2'h3):(1'h0)] reg217 = (1'h0);
  reg [(5'h10):(1'h0)] reg216 = (1'h0);
  reg [(4'hf):(1'h0)] reg215 = (1'h0);
  reg [(5'h11):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg212 = (1'h0);
  reg [(4'h8):(1'h0)] reg211 = (1'h0);
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg209 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg207 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg206 = (1'h0);
  reg [(4'hc):(1'h0)] reg205 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  assign y = {wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire11,
                 wire12,
                 wire13,
                 wire26,
                 wire27,
                 wire50,
                 wire52,
                 wire112,
                 wire114,
                 wire115,
                 wire116,
                 wire129,
                 wire167,
                 wire203,
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
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
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
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 (1'h0)};
  assign wire11 = wire7[(4'h8):(3'h5)];
  assign wire12 = $signed($unsigned($unsigned(wire10)));
  assign wire13 = $signed(wire7);
  always
    @(posedge clk) begin
      reg14 <= wire10;
      if (wire6)
        begin
          if (($unsigned($signed($signed(wire10))) ?
              (^~wire9[(4'ha):(4'h9)]) : $unsigned($unsigned(wire6[(1'h1):(1'h0)]))))
            begin
              reg15 <= ((wire9[(2'h3):(1'h1)] ~^ $signed(wire7)) < wire10[(1'h0):(1'h0)]);
              reg16 <= {wire11};
              reg17 <= (!wire13);
              reg18 <= ((~|(wire8[(3'h6):(1'h0)] <= {reg17[(2'h2):(2'h2)],
                      $signed(wire8)})) ?
                  $signed($signed(({wire9} ?
                      $unsigned(wire13) : {wire10,
                          wire7}))) : ({$signed((reg14 >> wire6)),
                      (wire7 > (wire13 ?
                          reg14 : wire9))} <= $signed(reg15[(4'hd):(1'h1)])));
            end
          else
            begin
              reg15 <= (((wire6 ?
                      (^(reg14 + wire11)) : (wire11 ?
                          $unsigned(wire10) : reg14)) != (reg18[(3'h4):(2'h2)] != wire13[(1'h1):(1'h1)])) ?
                  wire6[(1'h0):(1'h0)] : (wire7[(4'ha):(3'h7)] || $signed((8'hbd))));
              reg16 <= (($signed(wire7[(4'h8):(3'h5)]) ?
                      $unsigned((^((8'hbf) ? reg18 : wire6))) : wire8) ?
                  ($signed($signed(wire13[(1'h0):(1'h0)])) || $unsigned(((reg18 > wire11) ?
                      wire9 : (wire8 ?
                          reg17 : reg17)))) : $signed($signed($signed((wire10 && wire9)))));
              reg17 <= wire12[(4'hd):(3'h7)];
            end
          reg19 <= wire8;
          reg20 <= $signed($unsigned(wire13[(1'h1):(1'h0)]));
          reg21 <= $unsigned(wire7);
          reg22 <= $unsigned((reg17 ?
              {$signed((|wire7))} : ({(!reg20)} ?
                  $signed(reg14[(2'h2):(2'h2)]) : (+reg14[(2'h2):(2'h2)]))));
        end
      else
        begin
          reg15 <= $unsigned(wire11[(1'h0):(1'h0)]);
          reg16 <= ((~^wire11) ?
              (wire12 * {(|(8'ha3)),
                  reg22[(4'h8):(3'h6)]}) : $unsigned(reg18[(2'h3):(2'h2)]));
          if (reg22[(1'h1):(1'h0)])
            begin
              reg17 <= (8'hbd);
            end
          else
            begin
              reg17 <= reg15[(1'h1):(1'h0)];
              reg18 <= $signed({(reg19[(4'hd):(2'h2)] ?
                      $unsigned((&reg14)) : reg19[(4'h9):(4'h9)]),
                  ($unsigned((reg15 ? (8'hb8) : wire12)) ?
                      $signed(reg19[(3'h4):(3'h4)]) : $signed($unsigned(wire7)))});
              reg19 <= (&(|(!$signed($signed(wire12)))));
              reg20 <= reg16;
            end
          reg21 <= $unsigned(reg22);
        end
      reg23 <= reg22[(5'h10):(3'h5)];
      reg24 <= wire12;
      reg25 <= reg16;
    end
  assign wire26 = (reg16 && (($unsigned($unsigned(wire13)) ^ ({wire11, reg17} ?
                          wire12 : (~^wire7))) ?
                      (8'hb7) : reg17[(3'h6):(3'h5)]));
  assign wire27 = $unsigned($unsigned((~|$unsigned((wire12 ? reg19 : wire7)))));
  module28 #() modinst51 (wire50, clk, reg18, reg16, reg20, reg22);
  assign wire52 = $unsigned((wire12 != $signed({((8'hbb) <= wire27),
                      wire9[(4'hb):(4'h9)]})));
  module53 #() modinst113 (wire112, clk, reg24, reg20, wire52, wire12, reg21);
  assign wire114 = $unsigned($unsigned((7'h41)));
  assign wire115 = (reg20 ?
                       ((~&(~$unsigned((8'hb0)))) - (-reg25)) : $signed($unsigned($signed($unsigned(wire50)))));
  assign wire116 = (wire8 | (wire112 ?
                       ($unsigned(wire8) != {wire27,
                           reg18[(2'h2):(2'h2)]}) : (+((-wire11) ?
                           $signed(reg17) : (&(8'ha1))))));
  always
    @(posedge clk) begin
      if ($signed(({((reg15 && reg23) | ((8'haa) <= reg18)),
              ({reg23, (8'haa)} > (~&reg25))} ?
          $signed((wire6[(1'h0):(1'h0)] + (!wire11))) : (&wire114[(3'h7):(3'h7)]))))
        begin
          if (({(8'hb6)} ?
              (|$signed(((reg14 ? wire12 : reg16) ?
                  (reg17 ?
                      wire52 : reg21) : $signed(wire52)))) : wire13[(1'h1):(1'h1)]))
            begin
              reg117 <= {$signed(wire8[(4'hb):(1'h0)]), (~{reg22})};
              reg118 <= (wire11 && (wire26[(4'hb):(4'h8)] == $signed(($signed(reg23) ?
                  $signed((8'hae)) : wire114))));
            end
          else
            begin
              reg117 <= $unsigned(($signed((^~(wire7 == reg15))) + (wire12[(4'h8):(3'h4)] ^~ reg118[(1'h1):(1'h0)])));
            end
          reg119 <= reg17[(4'hd):(2'h3)];
        end
      else
        begin
          if (reg21)
            begin
              reg117 <= (reg117[(5'h11):(4'ha)] | $signed({($unsigned(reg24) ?
                      ((8'hb8) ? wire7 : reg17) : (wire27 ? wire10 : reg17)),
                  wire7[(3'h4):(2'h3)]}));
              reg118 <= $unsigned(wire50);
              reg119 <= reg117[(3'h5):(1'h1)];
              reg120 <= wire112[(3'h6):(1'h1)];
              reg121 <= ($unsigned((wire115[(1'h0):(1'h0)] ?
                      (wire11[(2'h2):(2'h2)] ?
                          reg22[(3'h5):(3'h4)] : $unsigned((8'ha8))) : (^~reg117))) ?
                  ($unsigned({$unsigned(wire27),
                      (wire7 != reg119)}) <<< wire6[(1'h0):(1'h0)]) : $signed({$signed(((8'hbd) | (8'hba))),
                      ((reg25 ? wire13 : reg18) >= reg25[(1'h1):(1'h0)])}));
            end
          else
            begin
              reg117 <= reg22;
            end
          reg122 <= (!wire50[(5'h11):(4'hb)]);
          reg123 <= {$signed((((reg22 << (8'ha5)) == (~^reg23)) ?
                  $signed((~^reg18)) : (wire114 >>> wire27)))};
          reg124 <= (reg123[(5'h10):(4'hd)] | ((~&(~|wire9[(5'h10):(3'h7)])) ?
              wire52 : (^~(8'h9c))));
        end
      reg125 <= (|(wire13 ?
          {((wire9 <= reg17) <<< wire50[(4'h8):(3'h4)]),
              (-(wire7 >= wire27))} : ((~$signed(reg21)) ?
              $unsigned((-reg17)) : (|$unsigned(reg19)))));
      reg126 <= reg120;
      reg127 <= ((~&{(^~(wire6 ? wire115 : reg17)),
              $unsigned($unsigned(wire114))}) ?
          $signed((-($signed(reg20) << (wire52 ?
              reg18 : reg119)))) : (^$unsigned((reg20[(4'hf):(1'h0)] && reg119))));
      reg128 <= $unsigned(wire116[(4'hb):(4'hb)]);
    end
  assign wire129 = ((($signed((reg22 ? (8'hbf) : reg122)) ?
                           (8'hab) : $unsigned($unsigned(reg127))) && $unsigned({((8'ha7) || reg124),
                           reg124})) ?
                       $unsigned({{$unsigned((8'hae))},
                           reg16[(1'h0):(1'h0)]}) : reg122);
  always
    @(posedge clk) begin
      reg130 <= (reg125[(3'h5):(3'h5)] ^ $signed((&(8'had))));
      if ($signed(($unsigned(reg21) ^~ reg24)))
        begin
          reg131 <= reg15;
          reg132 <= (~^{({((8'had) * reg120), (!reg16)} ?
                  ($signed((8'hbc)) ?
                      $unsigned(wire9) : reg128) : $unsigned((reg122 != reg127)))});
        end
      else
        begin
          if ((+$unsigned((|$unsigned($unsigned(reg22))))))
            begin
              reg131 <= $unsigned((~|($unsigned(reg15[(4'hf):(4'hb)]) ?
                  (wire8 != {(8'had), wire13}) : (8'ha8))));
              reg132 <= $signed(reg120[(4'h9):(3'h4)]);
              reg133 <= ({reg125} ^ $unsigned(((~(wire8 ?
                  wire50 : wire13)) & (wire52 ?
                  reg25[(2'h2):(2'h2)] : wire52[(4'hf):(3'h4)]))));
            end
          else
            begin
              reg131 <= reg121[(2'h3):(1'h0)];
              reg132 <= ($signed((~^(((7'h43) << reg25) << $signed(reg14)))) ?
                  ($signed(reg120[(2'h2):(2'h2)]) ?
                      {reg19} : reg118[(2'h3):(2'h2)]) : ({$signed(reg126[(3'h5):(2'h2)]),
                      (+(wire50 - reg122))} | (reg25 < reg17[(4'ha):(2'h3)])));
              reg133 <= wire6;
            end
        end
      reg134 <= $signed({((!reg124) ? reg18 : reg16[(4'ha):(3'h7)]),
          ({(^~(8'h9e))} ? $unsigned((~|reg25)) : $unsigned(wire50))});
      reg135 <= (~|({wire13, wire9} || {reg127[(3'h5):(1'h1)]}));
      if ($unsigned(({reg23, $signed((+reg16))} && ((!reg128[(2'h3):(2'h2)]) ?
          $unsigned($unsigned(reg123)) : ({reg22, reg128} ?
              (wire8 - wire7) : (wire116 >>> reg24))))))
        begin
          reg136 <= reg22[(2'h2):(1'h1)];
          if (($signed($signed($unsigned((wire10 && (8'hb3))))) >= $signed((^reg120[(3'h6):(1'h1)]))))
            begin
              reg137 <= reg128;
              reg138 <= wire50[(4'ha):(4'h8)];
              reg139 <= (-reg127[(2'h3):(2'h3)]);
            end
          else
            begin
              reg137 <= $unsigned($signed((+((+wire6) ?
                  ((8'ha0) ? wire52 : reg127) : $signed(reg137)))));
              reg138 <= (8'hb1);
              reg139 <= reg16[(4'h8):(4'h8)];
            end
          reg140 <= ($unsigned({wire26[(5'h14):(5'h13)]}) ?
              (reg24[(4'hd):(4'ha)] ^~ reg123[(5'h10):(1'h1)]) : $signed($signed($unsigned($unsigned(reg125)))));
          reg141 <= (~$signed((((reg25 ? wire129 : reg15) ?
              (7'h42) : $signed((8'hbf))) && {wire50[(4'hd):(4'hb)],
              (-reg122)})));
        end
      else
        begin
          if (wire9[(2'h3):(1'h1)])
            begin
              reg136 <= wire6;
              reg137 <= wire114[(1'h0):(1'h0)];
            end
          else
            begin
              reg136 <= {reg22[(4'h8):(4'h8)], reg136};
              reg137 <= (~^wire12);
              reg138 <= ($unsigned(({$signed(reg17)} << reg125)) ?
                  reg139[(3'h7):(3'h4)] : {reg14[(2'h2):(1'h0)],
                      $unsigned(((reg123 ? reg133 : reg126) ?
                          $unsigned(reg15) : reg139[(4'hc):(2'h2)]))});
              reg139 <= reg125;
            end
          reg140 <= (~^$signed($signed($signed($unsigned(reg136)))));
          reg141 <= wire116;
        end
    end
  module142 #() modinst168 (wire167, clk, reg135, reg17, reg132, reg118, reg140);
  module169 #() modinst204 (wire203, clk, reg119, reg22, wire27, reg118, reg23);
  always
    @(posedge clk) begin
      if (((~^$unsigned((+{reg124, reg20}))) & $unsigned($signed(((reg21 ?
          reg23 : reg117) >>> (wire11 ? reg121 : (8'had)))))))
        begin
          if ((&reg20))
            begin
              reg205 <= reg133[(2'h2):(1'h0)];
            end
          else
            begin
              reg205 <= {reg121, (8'ha2)};
              reg206 <= $unsigned($signed($unsigned({(reg117 ?
                      (8'hae) : reg120)})));
              reg207 <= $unsigned(reg206);
              reg208 <= ($unsigned($unsigned(reg134)) ? reg141 : (8'hb2));
            end
          reg209 <= {(^~reg22)};
          reg210 <= $unsigned((~^(wire27[(4'h9):(3'h6)] | (reg17 ?
              (reg133 || reg15) : (wire9 ? (8'ha1) : reg21)))));
          reg211 <= reg137[(2'h3):(1'h0)];
          reg212 <= (~|(^{$signed($signed(reg127))}));
        end
      else
        begin
          if (((~&$unsigned((&wire203[(1'h1):(1'h1)]))) ?
              ($signed(reg124[(1'h1):(1'h0)]) ?
                  {($signed(reg124) ?
                          reg210[(1'h0):(1'h0)] : $signed(reg23))} : $signed(reg23[(2'h2):(1'h1)])) : ((~&$signed(reg117[(4'ha):(4'h9)])) & ({((8'hbf) ?
                      (8'ha7) : reg134)} ^~ ($signed(reg135) ^ $signed(reg131))))))
            begin
              reg205 <= $unsigned(((!reg123) + ($unsigned((+reg124)) ?
                  (reg210[(2'h2):(1'h1)] ?
                      ((8'ha4) ?
                          reg125 : reg205) : $signed(reg208)) : reg211[(2'h3):(2'h2)])));
            end
          else
            begin
              reg205 <= {wire203[(4'hd):(3'h5)],
                  $unsigned(reg123[(1'h0):(1'h0)])};
              reg206 <= wire26[(4'hd):(3'h6)];
              reg207 <= {wire9,
                  ((~wire112[(3'h6):(1'h1)]) ?
                      wire10[(3'h5):(1'h1)] : (+{$signed(reg23)}))};
            end
          reg208 <= reg123[(4'hf):(4'hd)];
          reg209 <= $unsigned({wire203,
              {$unsigned(wire203), $unsigned((wire26 ? reg208 : reg119))}});
          if (wire27)
            begin
              reg210 <= (~&$signed((reg134[(4'hd):(1'h0)] < (reg123[(3'h5):(1'h1)] > reg206))));
              reg211 <= wire26[(4'hf):(4'hd)];
              reg212 <= $signed(($signed(reg210) ?
                  ((&wire203[(4'h9):(1'h1)]) ?
                      $signed(((8'h9c) ?
                          reg133 : wire12)) : ($signed(reg138) ^ {wire112,
                          reg22})) : (8'ha4)));
              reg213 <= $signed((&($unsigned(wire167) << reg14[(2'h3):(1'h0)])));
            end
          else
            begin
              reg210 <= (+$unsigned((^~(reg213 ?
                  $signed(reg123) : (|reg213)))));
            end
          reg214 <= $signed(reg22[(4'h9):(3'h7)]);
        end
      if (reg121)
        begin
          if ($unsigned((($signed((~(8'haf))) ?
                  $unsigned($unsigned(reg16)) : (reg25 ?
                      (reg141 & reg128) : (+reg17))) ?
              (8'ha4) : wire129[(4'hb):(2'h2)])))
            begin
              reg215 <= (+{{(reg21 ? $unsigned((8'hae)) : (!reg141))}});
              reg216 <= (($signed($signed($signed(wire116))) ^~ {$signed({reg141,
                      reg137}),
                  $signed($signed((8'ha2)))}) + $signed((reg215[(4'hd):(3'h4)] ?
                  $signed($unsigned(reg24)) : ((reg141 && reg205) + (-reg117)))));
              reg217 <= $unsigned(($signed($unsigned((8'h9d))) >= (~&{(~&reg118),
                  (wire27 > wire203)})));
              reg218 <= reg141[(1'h0):(1'h0)];
            end
          else
            begin
              reg215 <= ((+{((&wire27) ? (8'ha3) : (reg138 & reg130)),
                      reg127[(3'h4):(1'h0)]}) ?
                  ((-$unsigned(reg17)) >> ((8'hbc) ?
                      $signed(wire8[(4'hf):(4'hb)]) : (^~$signed(reg137)))) : reg18);
            end
          reg219 <= (~^(($unsigned((reg15 ? reg217 : reg141)) ?
                  reg213 : {(reg207 != wire129)}) ?
              reg205[(2'h3):(1'h1)] : $signed($unsigned(reg130))));
          reg220 <= wire7;
          reg221 <= reg121;
        end
      else
        begin
          reg215 <= $signed((8'hac));
          reg216 <= $signed(reg135[(4'hb):(4'h8)]);
        end
    end
  assign wire222 = $signed($unsigned(wire26));
  assign wire223 = reg135[(2'h2):(1'h0)];
  assign wire224 = reg214[(4'h8):(3'h5)];
  assign wire225 = $unsigned($unsigned(wire129[(4'h9):(3'h5)]));
endmodule

module module169
#(parameter param201 = ((((8'hb9) || (((8'hbd) ? (8'hb7) : (8'hba)) ? (8'hb0) : ((8'ha4) ? (8'hbf) : (8'haf)))) ^~ {(((8'ha1) ^ (8'hbe)) * ((8'ha5) ~^ (8'ha4))), (((8'hb1) >>> (8'hb5)) ? (~^(8'ha7)) : {(8'hb6), (8'hac)})}) * ((8'hba) || {(~(&(8'hbe)))})), 
parameter param202 = param201)
(y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire174;
  input wire [(4'ha):(1'h0)] wire173;
  input wire [(5'h12):(1'h0)] wire172;
  input wire [(3'h4):(1'h0)] wire171;
  input wire [(5'h14):(1'h0)] wire170;
  wire signed [(5'h10):(1'h0)] wire200;
  wire signed [(4'hd):(1'h0)] wire199;
  wire signed [(4'ha):(1'h0)] wire198;
  wire signed [(4'he):(1'h0)] wire197;
  wire [(4'hb):(1'h0)] wire196;
  wire signed [(3'h4):(1'h0)] wire195;
  wire signed [(3'h7):(1'h0)] wire194;
  wire [(2'h3):(1'h0)] wire193;
  wire signed [(4'hf):(1'h0)] wire192;
  wire [(3'h5):(1'h0)] wire191;
  wire signed [(5'h12):(1'h0)] wire190;
  wire signed [(4'h9):(1'h0)] wire189;
  wire signed [(5'h14):(1'h0)] wire188;
  wire [(4'h8):(1'h0)] wire187;
  wire [(5'h11):(1'h0)] wire185;
  wire [(4'h8):(1'h0)] wire184;
  wire signed [(4'hf):(1'h0)] wire183;
  wire [(4'hb):(1'h0)] wire182;
  wire signed [(5'h11):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire175;
  reg [(5'h11):(1'h0)] reg186 = (1'h0);
  reg [(4'h8):(1'h0)] reg180 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire175,
                 reg186,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  assign wire175 = $signed($unsigned(wire174[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg176 <= (+$unsigned(((wire172 ?
          (wire174 ? wire174 : wire170) : $signed(wire170)) || wire174)));
      if ((-wire171[(1'h1):(1'h0)]))
        begin
          reg177 <= wire172;
          if (wire175)
            begin
              reg178 <= $unsigned($signed(reg177));
              reg179 <= ($signed(($signed($unsigned(wire175)) ?
                  (wire174 ?
                      ((8'ha1) ?
                          wire170 : (8'ha8)) : (~^reg177)) : reg176)) & wire172[(1'h0):(1'h0)]);
            end
          else
            begin
              reg178 <= (~^($signed(wire173) | {$unsigned(((8'hb5) <= (8'hb3))),
                  (+{wire174, (7'h44)})}));
              reg179 <= $signed((wire175[(3'h5):(1'h0)] ?
                  $unsigned((wire175[(5'h10):(1'h1)] & $signed(wire171))) : $signed(wire171)));
            end
        end
      else
        begin
          reg177 <= (!wire174);
          if ($unsigned((wire170 ?
              $unsigned((wire170[(1'h0):(1'h0)] && $signed((8'hb9)))) : $unsigned(((wire172 ?
                      reg176 : reg179) ?
                  (8'ha7) : (^~reg177))))))
            begin
              reg178 <= $signed($unsigned({wire172, reg178}));
              reg179 <= {$signed({{{wire174}, $unsigned(reg177)},
                      wire174[(3'h6):(3'h5)]})};
            end
          else
            begin
              reg178 <= wire172;
              reg179 <= $unsigned($unsigned(wire175));
            end
          reg180 <= (~|reg179);
        end
    end
  assign wire181 = reg180[(4'h8):(1'h1)];
  assign wire182 = {((^~{$signed(wire175)}) ?
                           ($unsigned((wire170 ?
                               wire173 : (8'ha8))) && $unsigned((reg176 > wire175))) : ((wire173 + ((7'h44) ?
                                   reg178 : reg177)) ?
                               (wire170[(4'h9):(3'h7)] >= (wire181 ?
                                   reg179 : (8'hab))) : reg176))};
  assign wire183 = $unsigned(((~|$signed(wire172[(5'h11):(2'h3)])) <<< (!((wire170 ?
                       wire174 : reg177) == $signed(reg178)))));
  assign wire184 = ((~|reg177[(2'h3):(1'h1)]) && wire182[(3'h4):(2'h3)]);
  assign wire185 = (8'hac);
  always
    @(posedge clk) begin
      reg186 <= $unsigned(($signed(wire182) ?
          (reg178[(3'h7):(3'h5)] >>> (+$unsigned((8'ha6)))) : reg179[(3'h5):(3'h4)]));
    end
  assign wire187 = reg177[(2'h2):(1'h1)];
  assign wire188 = (~(^wire184[(1'h1):(1'h1)]));
  assign wire189 = $signed(($unsigned($signed((~|wire188))) >= (8'hb4)));
  assign wire190 = wire171[(1'h0):(1'h0)];
  assign wire191 = reg177[(2'h2):(2'h2)];
  assign wire192 = reg180[(2'h3):(2'h3)];
  assign wire193 = $signed($unsigned(reg177));
  assign wire194 = ((|(wire189 ?
                           $unsigned(wire170[(1'h0):(1'h0)]) : $unsigned(wire193))) ?
                       ((~({wire188} << (wire184 ?
                           reg180 : reg180))) ~^ $unsigned(($unsigned(wire183) ?
                           (^~wire185) : wire171[(1'h1):(1'h0)]))) : (wire192 || wire174));
  assign wire195 = wire191;
  assign wire196 = $signed($unsigned(reg177));
  assign wire197 = wire187[(3'h7):(2'h2)];
  assign wire198 = (~&(+$signed($unsigned(wire171[(2'h2):(1'h0)]))));
  assign wire199 = reg177;
  assign wire200 = $unsigned(((reg179[(3'h5):(3'h5)] <= $unsigned((-wire188))) ?
                       {wire170[(5'h13):(2'h3)],
                           ((wire193 ^~ (7'h42)) ?
                               wire175[(5'h10):(5'h10)] : (^~reg180))} : {(wire182 ?
                               (wire198 < wire181) : (wire173 ?
                                   (8'hae) : reg180))}));
endmodule

module module142
#(parameter param165 = {{((8'ha1) ? ((&(8'hb8)) ? ((8'hb2) ? (8'haa) : (8'hb8)) : ((8'hab) ? (8'hac) : (8'h9f))) : (+((8'haa) ? (8'ha6) : (8'hac)))), (&(-((8'hb8) ? (8'ha4) : (8'ha8))))}, ({(((8'ha5) ? (7'h44) : (8'hba)) ^~ (|(8'h9c)))} ? ((-((8'ha8) ? (8'hb9) : (8'had))) ? {{(7'h43)}, ((8'hae) ? (8'hb7) : (8'hae))} : (&((7'h42) >= (8'hb7)))) : (^(((7'h40) >>> (8'had)) ? (&(8'haa)) : ((8'hbc) != (8'h9c)))))}, 
parameter param166 = {param165})
(y, clk, wire147, wire146, wire145, wire144, wire143);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire147;
  input wire [(5'h14):(1'h0)] wire146;
  input wire signed [(4'ha):(1'h0)] wire145;
  input wire signed [(5'h15):(1'h0)] wire144;
  input wire signed [(2'h2):(1'h0)] wire143;
  wire signed [(4'hf):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire163;
  wire signed [(2'h2):(1'h0)] wire162;
  wire [(4'h8):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire159;
  wire signed [(5'h10):(1'h0)] wire158;
  wire [(4'h9):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire156;
  wire signed [(3'h5):(1'h0)] wire155;
  wire [(3'h7):(1'h0)] wire154;
  wire signed [(4'h8):(1'h0)] wire153;
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg148 <= $signed(($signed(wire145) ^ (($signed((8'ha7)) ?
              $unsigned(wire144) : $signed(wire145)) ?
          ($signed(wire147) ? wire143 : wire145[(4'h8):(3'h5)]) : (-(8'hac)))));
    end
  always
    @(posedge clk) begin
      reg149 <= wire146;
    end
  always
    @(posedge clk) begin
      reg150 <= {((wire146[(3'h6):(2'h3)] ? wire147[(1'h1):(1'h0)] : wire145) ?
              ($unsigned((~wire145)) ?
                  $unsigned((!wire144)) : (wire147[(4'hd):(3'h4)] >= wire144[(5'h10):(4'hc)])) : (wire146[(3'h7):(1'h0)] >= (((8'h9c) ?
                  reg149 : (8'hb0)) && {wire144}))),
          wire145[(3'h5):(2'h2)]};
      reg151 <= wire143[(1'h1):(1'h0)];
      reg152 <= (^~{($signed((~|(8'hb8))) ?
              $unsigned((reg148 ? reg150 : (7'h43))) : (8'hb7))});
    end
  assign wire153 = $unsigned(($unsigned(wire143) ?
                       wire146[(4'he):(3'h6)] : (((wire147 == reg152) == $signed(wire146)) ^ reg151[(3'h4):(3'h4)])));
  assign wire154 = (&(~^$signed(({wire147, wire144} ?
                       $signed(wire145) : ((7'h40) < wire147)))));
  assign wire155 = $unsigned((&reg152));
  assign wire156 = (7'h42);
  assign wire157 = $unsigned($unsigned($unsigned(((wire146 ^ reg150) ?
                       wire156[(4'hc):(2'h3)] : $signed(wire156)))));
  assign wire158 = $unsigned($signed(((7'h40) + (reg151 ?
                       {wire157} : reg149))));
  assign wire159 = (wire153[(3'h4):(1'h1)] < wire156);
  assign wire160 = $signed($unsigned(reg150));
  assign wire161 = wire143;
  assign wire162 = wire147[(3'h4):(1'h1)];
  assign wire163 = (~&(+(+wire158[(4'ha):(3'h7)])));
  assign wire164 = ({(((wire155 >> wire158) ?
                               $unsigned(wire157) : $unsigned(reg151)) ^ ($unsigned(reg150) >>> wire156)),
                           $unsigned($unsigned((~|(8'ha8))))} ?
                       (wire153[(3'h5):(2'h2)] ?
                           (wire155[(3'h4):(2'h3)] ?
                               $unsigned($unsigned(wire145)) : wire157[(4'h9):(1'h0)]) : $signed(((wire158 << wire156) ?
                               wire163[(3'h4):(1'h1)] : wire160))) : $signed(({(wire163 ?
                                   wire153 : reg151),
                               $signed((8'hb3))} ?
                           ($signed(reg148) ?
                               wire161[(3'h4):(2'h3)] : (wire162 ?
                                   wire161 : (8'ha6))) : ((~|reg151) ?
                               wire158[(4'hd):(2'h2)] : $signed(wire144)))));
endmodule

module module53
#(parameter param110 = {(^(({(8'hb0), (8'hb9)} << ((8'hb1) >> (8'ha5))) && (+(&(8'ha1)))))}, 
parameter param111 = (^~(-(-{(param110 ? param110 : param110)}))))
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire58;
  input wire [(4'hd):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire [(4'hb):(1'h0)] wire55;
  input wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned({$signed($unsigned($signed(wire57)))}))
        begin
          if ((8'ha6))
            begin
              reg59 <= {wire56,
                  ($unsigned({wire55[(2'h3):(2'h2)]}) <<< wire58[(3'h5):(1'h1)])};
              reg60 <= ((^~$unsigned((~$unsigned(wire54)))) ?
                  $signed(($signed($signed(wire57)) ?
                      (&{wire58}) : {{wire54, wire54},
                          (8'hac)})) : $signed({($signed((8'hb7)) | (wire54 == wire54)),
                      wire56}));
              reg61 <= $signed(wire54[(5'h11):(5'h10)]);
              reg62 <= wire56;
            end
          else
            begin
              reg59 <= (wire56[(4'hf):(4'h8)] >> $unsigned((^~((wire55 && (8'h9c)) - reg59[(2'h2):(2'h2)]))));
              reg60 <= $unsigned($signed((((wire57 << wire54) + {reg61,
                      wire57}) ?
                  (~^wire54[(3'h7):(3'h5)]) : reg61)));
              reg61 <= ((+reg61[(2'h2):(1'h0)]) & ($signed(wire57) >> wire57[(2'h2):(2'h2)]));
            end
          reg63 <= reg60[(4'hd):(3'h5)];
        end
      else
        begin
          if ((^~(((&wire58) || $signed((|(7'h40)))) ?
              (8'hac) : (wire55[(2'h3):(2'h3)] ? $signed((!reg61)) : wire54))))
            begin
              reg59 <= reg62[(4'h9):(4'h9)];
              reg60 <= wire54;
            end
          else
            begin
              reg59 <= (&($signed($signed($signed(reg60))) ?
                  ((reg61[(1'h0):(1'h0)] ? (reg59 == reg62) : reg62) ?
                      ((reg63 ? reg60 : (8'hab)) ?
                          $signed(wire58) : (wire55 ?
                              (7'h44) : reg61)) : $unsigned((-reg62))) : $signed(reg59[(3'h6):(2'h3)])));
              reg60 <= ({($signed($unsigned(reg59)) ?
                          $unsigned(((8'hb8) ?
                              wire56 : reg60)) : (!$unsigned(wire57)))} ?
                  wire54[(4'h8):(3'h6)] : wire54[(4'hd):(2'h3)]);
              reg61 <= $unsigned((reg62 ? reg63 : (&wire58)));
              reg62 <= $signed((~&reg63[(3'h6):(3'h6)]));
              reg63 <= $unsigned(((-wire56[(4'hd):(3'h6)]) == (~^reg60[(1'h0):(1'h0)])));
            end
          if (reg60)
            begin
              reg64 <= $signed((((wire56 + $unsigned(reg63)) ?
                      reg62 : ({wire54, reg59} ?
                          (~&wire54) : reg59[(4'h8):(3'h7)])) ?
                  reg59 : (|reg61[(2'h2):(1'h1)])));
              reg65 <= (^~{((~(-(8'had))) <<< ((8'ha6) ?
                      (-wire56) : wire54[(5'h12):(1'h0)]))});
              reg66 <= $unsigned($signed(reg63));
              reg67 <= ($unsigned((^~wire57[(3'h7):(2'h2)])) == $unsigned(wire56));
            end
          else
            begin
              reg64 <= $unsigned($signed(($signed(reg59[(3'h7):(1'h1)]) ?
                  ((wire57 ? reg66 : wire54) ?
                      reg60 : $unsigned(wire56)) : ((wire54 ?
                          (8'h9f) : wire55) ?
                      (wire56 ? (7'h40) : wire55) : reg66))));
            end
          reg68 <= wire56[(4'he):(4'h8)];
          reg69 <= (&wire55);
        end
      if (reg65[(3'h7):(1'h0)])
        begin
          reg70 <= reg63;
        end
      else
        begin
          reg70 <= $signed((!reg59[(3'h5):(1'h0)]));
          reg71 <= reg68;
          reg72 <= $unsigned((^~$unsigned(reg67)));
          reg73 <= $unsigned((wire54[(4'hd):(4'h8)] * $signed($unsigned($signed(reg63)))));
          reg74 <= wire57[(1'h1):(1'h1)];
        end
      if (reg68[(4'hd):(4'hd)])
        begin
          if (reg68[(3'h4):(1'h0)])
            begin
              reg75 <= (reg72[(5'h13):(4'h8)] ?
                  $signed(reg63) : reg63[(3'h5):(3'h4)]);
              reg76 <= ((-$signed((-reg62[(3'h4):(3'h4)]))) > ((|(~^$unsigned(reg73))) != ($signed((~^(8'hbc))) ?
                  $unsigned((reg65 ? wire54 : reg60)) : wire55)));
            end
          else
            begin
              reg75 <= {(((|(reg64 == reg64)) != ((wire57 >> reg71) ?
                      $signed(wire56) : $signed(reg65))) | $signed(((reg71 > (8'hb7)) || wire55[(4'h8):(2'h3)]))),
                  reg69[(4'hb):(2'h2)]};
              reg76 <= reg68;
              reg77 <= (!reg65);
              reg78 <= ({$unsigned($unsigned($unsigned(reg76))),
                  {({reg70, reg70} ? reg73 : reg75)}} | wire58[(5'h14):(4'he)]);
              reg79 <= (({(reg63[(2'h3):(2'h2)] ? reg68 : {reg66, reg71}),
                      reg61} | wire54) ?
                  $unsigned(reg73) : (^~$unsigned($unsigned((wire58 - reg76)))));
            end
        end
      else
        begin
          reg75 <= (^(^{reg77[(3'h6):(1'h1)], $signed(reg61)}));
          if (((reg60 >= (((wire58 ? (8'hbe) : (8'hb6)) ?
                  ((8'had) ^ wire57) : (reg70 ? wire54 : reg61)) ?
              (^$unsigned(reg73)) : (~(^~reg65)))) != reg60[(4'hf):(4'hb)]))
            begin
              reg76 <= $unsigned($signed((($signed((8'ha6)) == (reg60 | wire57)) >= $signed(reg77))));
              reg77 <= wire57[(3'h7):(3'h5)];
              reg78 <= $signed(reg72);
            end
          else
            begin
              reg76 <= ($unsigned(((~$unsigned((8'hb7))) ?
                  {(wire55 & reg78)} : reg69[(3'h4):(2'h3)])) ^ (reg69[(3'h5):(1'h1)] <<< reg69[(1'h1):(1'h0)]));
              reg77 <= $signed(wire54);
              reg78 <= wire55[(1'h1):(1'h1)];
              reg79 <= (wire54[(4'he):(4'ha)] || ((8'hb5) ? reg78 : reg78));
              reg80 <= (-reg76[(3'h5):(1'h1)]);
            end
          reg81 <= reg70;
          reg82 <= reg60[(2'h2):(2'h2)];
        end
    end
  assign wire83 = (8'ha3);
  assign wire84 = ((^(-((reg75 ? wire58 : (7'h44)) >>> (reg63 ?
                      (7'h43) : (8'hac))))) << $signed({reg63[(2'h2):(1'h0)]}));
  assign wire85 = (&wire56);
  assign wire86 = (+$unsigned(reg80));
  assign wire87 = $unsigned((($signed(((8'ha8) < reg68)) & wire54[(2'h2):(2'h2)]) ?
                      reg81 : ((-reg59[(1'h0):(1'h0)]) != (^~$unsigned((8'hb6))))));
  assign wire88 = $unsigned(reg77);
  assign wire89 = reg59;
  assign wire90 = $signed($unsigned((($unsigned(reg64) < $signed((8'ha6))) ?
                      $signed(wire89[(2'h2):(2'h2)]) : reg63)));
  assign wire91 = ((wire55 ?
                      wire89 : $unsigned(($signed(reg64) | $unsigned(reg73)))) | (~&$unsigned((((8'h9f) && reg75) <= (reg77 ?
                      reg68 : (8'hbb))))));
  assign wire92 = (|(reg70 ?
                      (($signed(wire56) ?
                          (reg59 ?
                              (8'hac) : reg78) : (reg74 <<< reg72)) >= reg79) : $unsigned((!reg74[(3'h5):(3'h4)]))));
  always
    @(posedge clk) begin
      if ($signed($unsigned((+$signed((~|(8'ha7)))))))
        begin
          reg93 <= ($signed($signed((|wire92))) < reg65);
          reg94 <= $unsigned({{(reg80[(3'h6):(3'h4)] != $signed((8'hb1))),
                  (+reg70)},
              reg69});
          reg95 <= reg80;
          if (wire57)
            begin
              reg96 <= ({$unsigned((wire86 ?
                          $unsigned(reg63) : $signed(wire92)))} ?
                  $signed(wire56) : $unsigned($unsigned(($unsigned(reg81) ?
                      reg94 : wire55))));
              reg97 <= wire84;
              reg98 <= reg67;
            end
          else
            begin
              reg96 <= wire54[(3'h5):(3'h5)];
              reg97 <= wire91[(3'h5):(3'h5)];
              reg98 <= ((!(~&{(reg79 ? (8'ha7) : reg93)})) ?
                  (~(($unsigned(reg78) ?
                      $unsigned(wire57) : $signed(wire55)) >>> reg71)) : wire88[(2'h2):(1'h0)]);
            end
          if ((($signed({((8'hb7) && reg71)}) >= $signed(wire91[(3'h6):(2'h2)])) << (wire55 ?
              reg65 : (~wire91[(4'h9):(4'h8)]))))
            begin
              reg99 <= $signed($unsigned((-reg72[(4'h9):(3'h7)])));
            end
          else
            begin
              reg99 <= reg62[(4'ha):(1'h1)];
              reg100 <= ($unsigned(reg59[(1'h0):(1'h0)]) || ($signed(reg99[(2'h2):(1'h1)]) ^~ reg71));
            end
        end
      else
        begin
          reg93 <= (((reg99[(1'h1):(1'h1)] ^~ ((-reg66) == (reg80 ?
                  reg81 : reg97))) ?
              (((wire88 << reg95) <<< reg65[(3'h7):(1'h1)]) ?
                  reg82 : reg64[(4'hf):(3'h7)]) : (wire84[(2'h2):(2'h2)] == ({reg61,
                  reg74} <<< $unsigned((7'h42))))) ~^ ((wire55 ?
              $signed((wire84 >>> wire54)) : ((reg94 > reg59) | (reg96 > wire89))) <= $signed($signed((~^(8'ha0))))));
        end
      reg101 <= reg73;
      reg102 <= $unsigned(wire88[(1'h0):(1'h0)]);
    end
  assign wire103 = (((^{(&reg100),
                       $unsigned(wire88)}) - $unsigned(($unsigned(reg80) >= (&(8'hb5))))) && (8'hab));
  assign wire104 = wire85;
  assign wire105 = reg67[(2'h3):(1'h1)];
  assign wire106 = $unsigned(((reg69 ? (8'hbc) : reg61[(2'h2):(1'h0)]) ?
                       $unsigned(reg72) : ($unsigned((-(7'h42))) ?
                           wire57 : (+reg78[(1'h1):(1'h0)]))));
  assign wire107 = (!wire57);
  assign wire108 = $unsigned({$signed((reg64 < reg96))});
  assign wire109 = $signed((8'had));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire32;
  input wire [(4'h9):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire35,
                 wire34,
                 wire33,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire33 = ($signed(wire32[(2'h2):(1'h0)]) ?
                      (-((wire29 ?
                          wire32 : (wire29 | (8'hb0))) >> wire29[(2'h3):(2'h2)])) : ($signed((8'hbb)) << wire32));
  assign wire34 = {(&wire32), $signed(wire31[(1'h1):(1'h0)])};
  assign wire35 = (wire33 ?
                      $unsigned((({wire29} ?
                              $signed(wire34) : (wire30 ? wire33 : wire31)) ?
                          ((~wire30) <<< (wire33 ?
                              wire34 : (8'ha9))) : (wire29 ?
                              (wire30 <<< wire31) : wire34))) : {$signed((wire29[(1'h0):(1'h0)] == (~(7'h42))))});
  always
    @(posedge clk) begin
      if (wire32)
        begin
          reg36 <= $unsigned(($unsigned((!(wire32 <<< wire32))) != (8'hba)));
          reg37 <= $signed((((~&$signed(wire30)) ?
                  (wire31 >>> reg36) : $signed(((8'hb5) | wire35))) ?
              ($unsigned($signed(reg36)) ?
                  $unsigned((wire32 ?
                      wire31 : wire29)) : wire34) : ($unsigned((wire35 - wire30)) ?
                  ((wire33 ? wire33 : reg36) ?
                      ((8'hb8) + wire29) : $signed(wire32)) : ((wire30 ?
                      wire35 : wire30) - (wire32 ^ wire35)))));
          reg38 <= (!(($signed($unsigned(wire30)) ?
              reg37 : (^$unsigned(wire33))) - $unsigned((~^wire32[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg36 <= wire29[(3'h7):(3'h7)];
          if (((($signed({(8'ha8)}) ?
                  $unsigned(wire32[(2'h2):(1'h0)]) : (8'ha6)) & $unsigned(((reg38 ~^ wire31) ?
                  $signed(reg36) : wire35))) ?
              (({wire29[(3'h7):(2'h3)]} | $signed(reg37)) ~^ {((wire31 ?
                      (8'hbe) : wire33) >> wire34[(1'h0):(1'h0)]),
                  $signed($unsigned(wire33))}) : ($unsigned(wire33) || $signed((^~$unsigned(wire31))))))
            begin
              reg37 <= (wire35[(1'h0):(1'h0)] ?
                  reg37[(3'h6):(2'h2)] : $signed((^({wire35} ?
                      $signed(reg37) : reg37[(3'h7):(2'h3)]))));
            end
          else
            begin
              reg37 <= {wire32[(2'h3):(1'h0)]};
              reg38 <= ((wire33[(4'hb):(1'h1)] < wire35) + wire30[(4'hd):(4'hb)]);
              reg39 <= wire34[(1'h0):(1'h0)];
              reg40 <= {reg37};
              reg41 <= $unsigned(reg36[(3'h6):(1'h1)]);
            end
          reg42 <= (~|(~&($signed($signed(reg38)) ?
              (~|(~|reg38)) : $signed((wire33 + wire31)))));
        end
    end
  assign wire43 = ((~|(8'ha5)) >>> ($unsigned(($signed(wire33) >= (8'hab))) >>> ($unsigned((~reg38)) ?
                      wire34 : $unsigned((8'ha3)))));
  assign wire44 = ((~^($unsigned((reg36 <= reg38)) ?
                          $signed((reg36 * (8'hb4))) : ({reg37} | $signed(wire35)))) ?
                      $unsigned($signed(($unsigned(reg36) ?
                          reg42[(4'h8):(1'h0)] : (reg41 ?
                              wire35 : (8'hbf))))) : ((-reg38) ?
                          $unsigned(reg37[(4'ha):(3'h7)]) : (((wire34 <= reg39) ?
                                  reg42[(2'h2):(1'h1)] : wire35[(3'h4):(3'h4)]) ?
                              wire29 : $signed((8'hb2)))));
  assign wire45 = {(~^(~|reg40)),
                      ($unsigned(wire29[(2'h2):(1'h0)]) ?
                          $signed($unsigned(wire44)) : ($unsigned(wire34[(3'h5):(2'h2)]) ?
                              (((8'hb2) != wire29) ?
                                  wire44 : (!(7'h40))) : $signed((~^reg37))))};
  assign wire46 = ((wire45[(2'h2):(1'h0)] ? reg41 : $signed($unsigned(reg40))) ?
                      $signed($signed({(reg40 ~^ wire34)})) : (($signed({reg40,
                                  reg39}) ?
                              (reg38[(4'ha):(3'h7)] <<< wire44) : $signed((reg41 ?
                                  wire31 : wire34))) ?
                          wire32 : wire29));
  assign wire47 = wire34[(2'h3):(2'h2)];
  assign wire48 = ((($unsigned($signed(wire33)) <= (reg41 >> wire31)) ?
                          reg39 : ((wire31[(2'h3):(2'h3)] & {reg40}) ?
                              $signed(wire47) : ($unsigned((8'hb6)) ?
                                  wire45[(2'h3):(1'h0)] : (reg41 ?
                                      wire46 : reg39)))) ?
                      $signed((wire47[(1'h0):(1'h0)] <= {wire32[(2'h2):(2'h2)]})) : reg42);
  assign wire49 = {{$signed($signed(reg40[(4'hb):(2'h2)]))}, reg42};
endmodule
