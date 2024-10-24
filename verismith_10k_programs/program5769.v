module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1eb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire236;
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire42,
                 wire43,
                 wire44,
                 wire236,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire5 = (wire3[(2'h2):(2'h2)] + (({(wire3 ? (8'hbc) : wire2),
                         (8'ha0)} || $signed($signed((8'hab)))) ?
                     (wire4 ? wire4[(1'h0):(1'h0)] : (8'hb8)) : wire4));
  assign wire6 = $signed(($signed((^(wire2 << wire3))) ?
                     ((&{wire4}) & ((8'ha1) <= $signed(wire0))) : $signed((+wire5[(1'h0):(1'h0)]))));
  assign wire7 = (wire3[(1'h0):(1'h0)] < $unsigned($signed(wire2)));
  assign wire8 = wire7;
  assign wire9 = {$signed({($unsigned(wire3) > (wire6 << wire7))})};
  assign wire10 = (wire8 >= (wire5[(4'hf):(4'h8)] ?
                      wire8[(2'h2):(1'h0)] : {$signed(wire5[(3'h4):(3'h4)]),
                          $signed((^wire5))}));
  assign wire11 = wire7[(3'h6):(3'h4)];
  assign wire12 = $unsigned($signed(wire1));
  assign wire13 = wire3[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed($unsigned((&((wire8 * wire13) ?
          $unsigned(wire9) : (|wire1))))))
        begin
          reg14 <= wire6;
          reg15 <= $signed(wire11[(1'h0):(1'h0)]);
          reg16 <= $unsigned((~^$signed(($unsigned(wire11) * (^wire12)))));
          if ((-$signed($signed(({reg15} ?
              $signed(wire11) : (wire5 - wire3))))))
            begin
              reg17 <= {wire7};
            end
          else
            begin
              reg17 <= ({(~&wire8),
                  $unsigned($signed((wire3 << wire2)))} >= wire6[(3'h5):(2'h2)]);
              reg18 <= (~&(|wire6));
              reg19 <= (|(-$signed($unsigned((^wire10)))));
              reg20 <= wire9;
              reg21 <= (reg16[(2'h2):(1'h1)] ?
                  ($signed($unsigned($signed((8'h9e)))) > $signed((wire4[(2'h2):(2'h2)] << $signed(reg17)))) : $unsigned(((wire6[(2'h3):(1'h0)] >= ((8'h9e) | wire2)) || ((wire3 ~^ wire7) ?
                      wire12[(2'h2):(1'h1)] : $unsigned(wire1)))));
            end
          if ((wire0 + $unsigned((({wire10} ?
              reg16[(2'h3):(2'h3)] : {(8'hb2), wire3}) == ($signed(reg15) ?
              $signed(wire12) : wire13)))))
            begin
              reg22 <= reg20;
              reg23 <= $signed($unsigned($signed(reg22[(4'he):(4'hd)])));
            end
          else
            begin
              reg22 <= wire10;
              reg23 <= wire5;
              reg24 <= $unsigned((!($signed($signed(reg16)) ?
                  wire3[(2'h2):(1'h0)] : wire11)));
              reg25 <= (8'hbf);
            end
        end
      else
        begin
          reg14 <= (({(wire6[(4'h9):(1'h1)] > $signed(reg19)),
              ((!wire0) | wire4[(2'h3):(1'h1)])} << $unsigned({{wire3},
              ((8'ha6) ? reg25 : wire3)})) > ((((reg25 ? wire2 : wire0) ?
                  {wire12} : reg22) <<< (8'ha9)) ?
              wire4[(3'h4):(1'h0)] : wire13));
        end
      reg26 <= $unsigned(((~&(~wire5[(5'h13):(4'ha)])) << {$signed((~&reg23))}));
      reg27 <= (reg22 ? $unsigned(reg18) : ($signed(reg22) ? wire12 : reg16));
      if (reg27[(1'h1):(1'h1)])
        begin
          reg28 <= reg19[(5'h11):(3'h7)];
          reg29 <= reg23;
          if ((+$unsigned(reg21[(1'h1):(1'h0)])))
            begin
              reg30 <= (reg14 & $signed(wire1[(4'ha):(1'h0)]));
              reg31 <= ($unsigned(($signed(reg14[(3'h6):(3'h6)]) ?
                  wire1[(4'hc):(2'h3)] : (wire4[(1'h0):(1'h0)] ?
                      reg20 : reg23))) << reg21[(1'h0):(1'h0)]);
              reg32 <= reg30;
            end
          else
            begin
              reg30 <= reg32[(1'h0):(1'h0)];
              reg31 <= (($unsigned($unsigned($unsigned(reg20))) << {$unsigned(reg21)}) >= ((((!wire2) ?
                      (^~(8'hbc)) : wire7) < $unsigned(reg17)) ?
                  reg27 : $signed(({wire4, (8'hb7)} >>> $unsigned(reg15)))));
            end
          if (reg30)
            begin
              reg33 <= {(8'h9c)};
              reg34 <= reg15;
              reg35 <= reg19;
              reg36 <= reg25;
              reg37 <= reg31[(1'h0):(1'h0)];
            end
          else
            begin
              reg33 <= (reg34 ^ ($unsigned($unsigned((wire5 ^~ reg25))) ?
                  reg25[(1'h0):(1'h0)] : wire4[(1'h1):(1'h1)]));
              reg34 <= reg36[(2'h3):(2'h3)];
            end
          if (wire7[(3'h7):(3'h5)])
            begin
              reg38 <= (-reg29);
              reg39 <= (8'hb5);
              reg40 <= reg35;
            end
          else
            begin
              reg38 <= $unsigned(wire2[(2'h3):(1'h0)]);
              reg39 <= $unsigned($unsigned((!$unsigned((reg34 * (7'h41))))));
            end
        end
      else
        begin
          reg28 <= (~(~&reg21[(1'h1):(1'h1)]));
          reg29 <= (-(&reg40[(3'h6):(3'h6)]));
          reg30 <= (8'h9e);
          reg31 <= (((8'ha3) ?
                  $signed(reg38[(1'h0):(1'h0)]) : wire4[(2'h2):(2'h2)]) ?
              (~^(-reg29)) : (reg33 ?
                  wire11 : {((~reg24) ? wire9 : (!reg23)),
                      ($signed(reg36) <= $unsigned(wire9))}));
          reg32 <= (wire11[(1'h0):(1'h0)] ?
              reg23[(3'h7):(3'h7)] : $unsigned($unsigned($unsigned($signed(reg37)))));
        end
      reg41 <= reg19[(3'h6):(3'h6)];
    end
  assign wire42 = $unsigned($signed((wire12[(4'h8):(3'h7)] >= reg26[(2'h2):(1'h0)])));
  assign wire43 = $signed(reg38[(3'h5):(1'h0)]);
  assign wire44 = {$signed(($signed(reg16[(3'h6):(3'h5)]) > ((!reg36) ?
                          reg32[(2'h2):(1'h0)] : $signed(wire43))))};
  module45 #() modinst237 (.y(wire236), .clk(clk), .wire49(reg40), .wire46(wire10), .wire48(wire9), .wire47(wire3));
endmodule

module module45
#(parameter param234 = ((~|((((8'hbf) <<< (8'h9f)) ? ((8'hba) || (8'hba)) : {(8'ha4), (7'h41)}) ? {{(7'h43), (8'hae)}, {(8'hb4)}} : {(~&(8'h9d)), ((8'hac) ? (8'haa) : (8'hbb))})) ? (+((((8'hb3) ? (8'hb4) : (8'hbe)) < ((8'ha8) ~^ (8'had))) ? (&((8'hbb) ^~ (8'h9c))) : ((^~(8'h9d)) & (+(8'hb4))))) : (|(-(((8'ha0) << (8'h9e)) & ((8'ha0) || (8'hbb)))))), 
parameter param235 = ((-((&param234) & param234)) ? (&{((!param234) ~^ {param234}), (&(param234 ? param234 : param234))}) : ((8'h9d) ? ((param234 ? (param234 ? (8'hb0) : param234) : param234) >>> ((param234 ? (8'hae) : (8'hba)) * param234)) : param234)))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire49;
  input wire signed [(5'h12):(1'h0)] wire48;
  input wire signed [(5'h15):(1'h0)] wire47;
  input wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire233;
  wire [(4'h9):(1'h0)] wire232;
  wire signed [(3'h7):(1'h0)] wire230;
  wire [(4'hd):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire170;
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  assign y = {wire233,
                 wire232,
                 wire230,
                 wire172,
                 wire64,
                 wire66,
                 wire67,
                 wire131,
                 wire141,
                 wire170,
                 reg51,
                 reg50,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= (^wire47[(3'h4):(2'h3)]);
      reg51 <= $unsigned({((wire47 + (-wire46)) ?
              $unsigned(reg50[(3'h5):(2'h3)]) : (^{wire46, reg50}))});
    end
  module52 #() modinst65 (wire64, clk, wire48, reg51, wire46, wire49, reg50);
  assign wire66 = reg50;
  assign wire67 = wire49;
  module68 #() modinst132 (.wire72(wire47), .clk(clk), .wire73(wire66), .y(wire131), .wire71(wire46), .wire69(wire48), .wire70(reg51));
  always
    @(posedge clk) begin
      reg133 <= wire67;
      if ((|(reg51 ? (&(~(~&reg51))) : {wire47[(2'h3):(1'h0)]})))
        begin
          reg134 <= wire49;
          if ($unsigned(wire66))
            begin
              reg135 <= (+{wire47[(3'h4):(1'h1)],
                  $unsigned($unsigned($signed((8'hb5))))});
              reg136 <= {reg50, (~&((^~$signed(wire64)) || wire64))};
            end
          else
            begin
              reg135 <= (({wire47[(4'ha):(3'h4)]} ^ wire67[(1'h0):(1'h0)]) >> ($unsigned($signed($signed(reg136))) ?
                  ($unsigned(((8'hbf) ^~ wire46)) ?
                      $signed(reg51[(1'h1):(1'h1)]) : (8'hb5)) : {$unsigned((8'had))}));
              reg136 <= {reg136[(1'h1):(1'h1)]};
              reg137 <= (8'h9d);
            end
        end
      else
        begin
          reg134 <= wire47[(5'h10):(4'h8)];
        end
      reg138 <= ((8'hbc) >= (~|({(-reg134)} ? reg137 : $signed({wire67}))));
      reg139 <= wire64;
      reg140 <= $unsigned({reg50,
          $unsigned(($unsigned(reg134) ?
              $unsigned(reg139) : $unsigned(reg136)))});
    end
  assign wire141 = (reg51[(5'h11):(3'h7)] ? wire67[(2'h3):(1'h1)] : reg136);
  module142 #() modinst171 (wire170, clk, wire47, reg135, wire141, wire66, reg51);
  assign wire172 = ($unsigned(wire170) ?
                       ($signed(reg139) ?
                           ($signed($signed((8'ha4))) ?
                               reg139[(4'ha):(3'h5)] : reg51) : ((~^$unsigned(wire48)) | ((wire49 ?
                               reg134 : wire47) ^~ reg135[(3'h4):(2'h3)]))) : $signed(reg51[(4'hd):(1'h0)]));
  module173 #() modinst231 (wire230, clk, wire172, reg139, wire66, reg50, reg51);
  assign wire232 = (!(^wire49));
  assign wire233 = {$unsigned(reg137), reg140[(2'h2):(1'h1)]};
endmodule

module module173
#(parameter param228 = {(~&((~&((8'hb2) != (8'hba))) ? {((8'hb3) != (8'hbf))} : {{(8'haf), (8'h9e)}}))}, 
parameter param229 = (^~{({(param228 + param228)} ? {(^(8'ha0)), (param228 ? (8'hbf) : param228)} : param228)}))
(y, clk, wire178, wire177, wire176, wire175, wire174);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire178;
  input wire [(5'h12):(1'h0)] wire177;
  input wire signed [(2'h2):(1'h0)] wire176;
  input wire signed [(2'h3):(1'h0)] wire175;
  input wire signed [(4'h8):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire227;
  wire signed [(5'h12):(1'h0)] wire226;
  wire [(5'h12):(1'h0)] wire225;
  wire [(3'h4):(1'h0)] wire224;
  wire [(5'h13):(1'h0)] wire223;
  wire signed [(4'hc):(1'h0)] wire222;
  wire [(4'he):(1'h0)] wire221;
  wire [(5'h11):(1'h0)] wire220;
  wire [(5'h13):(1'h0)] wire215;
  wire [(2'h2):(1'h0)] wire214;
  wire [(4'hb):(1'h0)] wire213;
  wire signed [(5'h12):(1'h0)] wire212;
  wire signed [(4'hc):(1'h0)] wire211;
  wire signed [(3'h5):(1'h0)] wire210;
  wire [(4'h8):(1'h0)] wire209;
  wire signed [(3'h5):(1'h0)] wire180;
  wire signed [(4'hc):(1'h0)] wire179;
  reg [(5'h11):(1'h0)] reg219 = (1'h0);
  reg [(5'h12):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg216 = (1'h0);
  reg [(3'h5):(1'h0)] reg208 = (1'h0);
  reg [(5'h11):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg204 = (1'h0);
  reg [(2'h2):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg202 = (1'h0);
  reg [(4'hf):(1'h0)] reg201 = (1'h0);
  reg [(4'h9):(1'h0)] reg200 = (1'h0);
  reg [(4'hf):(1'h0)] reg199 = (1'h0);
  reg [(5'h14):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg195 = (1'h0);
  reg [(4'hc):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg190 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg188 = (1'h0);
  reg [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg186 = (1'h0);
  reg [(3'h6):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(3'h4):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg182 = (1'h0);
  reg [(4'hb):(1'h0)] reg181 = (1'h0);
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire180,
                 wire179,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
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
                 (1'h0)};
  assign wire179 = (~|wire177[(5'h10):(4'h8)]);
  assign wire180 = wire177[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      if (wire178)
        begin
          reg181 <= (wire175 ^ wire180);
          reg182 <= (!(-wire179));
          reg183 <= $signed($signed(wire174));
          reg184 <= $signed(((((+wire175) <<< (+(8'ha4))) ?
              $signed($signed(wire175)) : $unsigned(((8'had) || wire177))) ^~ wire177));
          reg185 <= ((reg181[(2'h2):(2'h2)] > $signed($unsigned((wire179 ?
              wire177 : wire179)))) ~^ (((!$unsigned(reg182)) ?
                  ($unsigned(reg182) * $unsigned(reg182)) : (8'ha6)) ?
              $unsigned(reg181[(3'h6):(3'h4)]) : ((+{wire176}) ?
                  wire180 : $signed(wire174[(3'h6):(1'h0)]))));
        end
      else
        begin
          if ((wire174[(3'h5):(1'h0)] && ((~|reg181[(3'h4):(1'h0)]) ^ ($unsigned(wire180) ?
              $unsigned(reg185[(3'h5):(3'h5)]) : {$unsigned(wire179)}))))
            begin
              reg181 <= (wire174[(3'h5):(1'h0)] <<< (reg185 <<< (reg183[(1'h1):(1'h0)] ?
                  ((~wire174) - (reg182 && wire176)) : $signed($signed(wire175)))));
              reg182 <= $unsigned(wire179);
              reg183 <= (~&reg184);
            end
          else
            begin
              reg181 <= (!(-(wire180 ?
                  wire175[(1'h1):(1'h1)] : (~&(reg182 != reg183)))));
              reg182 <= (~|(reg185 ^ $signed(({reg185} < (reg184 + reg183)))));
              reg183 <= wire178[(1'h1):(1'h0)];
              reg184 <= $unsigned(wire174[(3'h4):(2'h2)]);
            end
          if ($signed(reg183[(3'h4):(2'h3)]))
            begin
              reg185 <= (wire175[(2'h2):(1'h1)] <<< wire175);
            end
          else
            begin
              reg185 <= reg182[(4'h9):(3'h5)];
              reg186 <= {(wire177 ~^ $unsigned((^~(reg185 ?
                      wire175 : reg185)))),
                  reg182};
              reg187 <= $unsigned(($signed($unsigned($signed(reg185))) ?
                  $unsigned((-(wire177 ? reg186 : (8'hbe)))) : ((8'hbb) ?
                      ((~&wire174) || $unsigned(wire180)) : {reg182[(3'h4):(3'h4)]})));
              reg188 <= (reg185 ?
                  ($signed(($signed((8'ha0)) ?
                      reg186[(4'hb):(4'h9)] : $signed((8'hb5)))) * $signed(reg183)) : (+({$signed(reg186)} ?
                      reg187 : wire174)));
              reg189 <= {(({wire178[(2'h2):(1'h0)],
                          (reg187 ? reg185 : wire180)} & (~|$signed(wire177))) ?
                      reg186[(1'h0):(1'h0)] : $signed(((reg184 ?
                              wire179 : wire180) ?
                          reg188 : (reg186 != wire175)))),
                  ((~|((wire179 ? wire178 : reg182) >> wire176)) ?
                      (-(~&(reg186 >> reg187))) : reg185)};
            end
          reg190 <= ($unsigned($signed((|$signed((8'ha3))))) ~^ reg182[(3'h5):(3'h5)]);
        end
      if ((reg181 >>> reg188[(3'h5):(1'h0)]))
        begin
          if ($signed($signed($unsigned(($signed((8'h9d)) ?
              (wire180 < wire177) : (reg182 ? reg182 : reg188))))))
            begin
              reg191 <= reg182;
              reg192 <= $unsigned(wire180[(3'h4):(2'h3)]);
              reg193 <= (~^((!$signed((reg189 && wire177))) >= wire178));
              reg194 <= $unsigned($signed((($signed(reg182) <= reg189) >> {(reg188 ?
                      reg183 : reg182)})));
              reg195 <= $signed($unsigned($signed((wire176 >> wire177[(4'hf):(4'ha)]))));
            end
          else
            begin
              reg191 <= reg184[(2'h3):(2'h3)];
              reg192 <= ($unsigned((wire174[(2'h2):(2'h2)] == (reg195 ?
                  (reg189 >> reg192) : (wire176 == reg192)))) < reg194[(3'h6):(3'h5)]);
              reg193 <= reg183[(3'h4):(3'h4)];
            end
          reg196 <= $signed(($unsigned($signed((!reg183))) * ($unsigned((~^reg189)) ^~ (8'haf))));
          reg197 <= ({({(reg192 || wire175)} ?
                  (^$signed(reg185)) : reg189)} >> $unsigned($signed(reg181[(1'h1):(1'h0)])));
          if ($signed(($signed(reg191[(5'h12):(1'h0)]) ?
              (reg185[(3'h4):(2'h2)] ?
                  $unsigned((wire180 ?
                      wire180 : reg185)) : $signed(reg197)) : (!$unsigned($signed(reg188))))))
            begin
              reg198 <= $unsigned((reg181 ?
                  (!(reg188 ?
                      (~&(8'ha1)) : {reg192})) : $signed({$signed(reg188)})));
              reg199 <= (($signed(reg193[(3'h6):(1'h0)]) ?
                  $signed((((7'h43) > wire175) ?
                      (reg187 ?
                          reg187 : reg198) : $unsigned(wire175))) : ($signed(((8'hab) != reg196)) ?
                      $unsigned(reg197) : $unsigned((wire180 && reg192)))) && reg189);
              reg200 <= {(|$signed((((8'h9e) ? reg186 : reg195) ?
                      (~&reg184) : (reg198 ? wire176 : reg188)))),
                  reg191[(3'h5):(3'h5)]};
            end
          else
            begin
              reg198 <= (!reg186[(2'h2):(2'h2)]);
            end
          reg201 <= (8'hb0);
        end
      else
        begin
          reg191 <= $unsigned(reg200);
          reg192 <= ((((8'hbe) ?
                  $unsigned($signed(reg195)) : (8'ha6)) * ($unsigned(((8'hbe) == reg192)) ^ ($signed(reg187) ?
                  (wire178 ? reg194 : reg197) : (&reg183)))) ?
              $unsigned(reg198[(4'ha):(2'h3)]) : (wire177 | (8'hb4)));
          reg193 <= $signed($unsigned(($signed($signed(reg189)) | reg200)));
          reg194 <= (&((((!wire175) >>> (reg198 ? reg191 : (8'haf))) ?
              reg191[(4'he):(3'h5)] : (reg196[(3'h4):(2'h3)] <= $unsigned(reg201))) & wire176[(2'h2):(2'h2)]));
        end
      if ((reg185[(1'h1):(1'h0)] ?
          reg192[(2'h3):(1'h1)] : ((!{(8'h9c),
              $unsigned((8'h9e))}) && {$unsigned(reg185),
              {(reg189 ? reg184 : reg192), reg195[(3'h5):(2'h3)]}})))
        begin
          reg202 <= $unsigned({(reg189[(3'h6):(3'h6)] ~^ (^{wire177, reg185})),
              $unsigned(reg194)});
          reg203 <= reg198;
        end
      else
        begin
          if ($unsigned($unsigned($unsigned(reg196))))
            begin
              reg202 <= {$signed(reg196[(4'ha):(1'h1)])};
              reg203 <= (~|reg203);
              reg204 <= (+$signed(reg203));
            end
          else
            begin
              reg202 <= reg183;
              reg203 <= (-(($signed((wire177 ? reg201 : (8'hbc))) ?
                      ($unsigned((8'ha2)) ?
                          {(7'h42)} : $signed(reg202)) : (reg181 ?
                          (wire178 ? reg200 : reg182) : (reg198 ?
                              wire175 : wire180))) ?
                  $unsigned($unsigned(((8'haf) ?
                      reg183 : reg201))) : reg190[(1'h0):(1'h0)]));
            end
          reg205 <= reg204[(2'h2):(1'h0)];
          reg206 <= $unsigned(reg186);
        end
      reg207 <= {wire175[(2'h3):(2'h3)],
          (($unsigned((+(8'ha5))) > $signed(reg183)) && $unsigned(reg191))};
      reg208 <= $unsigned((({reg191[(1'h0):(1'h0)], (reg181 << wire174)} ?
              $signed(reg193) : reg199) ?
          $unsigned(reg198) : reg181[(1'h1):(1'h1)]));
    end
  assign wire209 = ($signed((^$unsigned(reg181[(4'ha):(1'h0)]))) ?
                       ($unsigned((reg187 >= $unsigned(wire174))) ^~ (!$unsigned($unsigned((7'h42))))) : $unsigned($unsigned($signed(reg184[(4'hf):(2'h2)]))));
  assign wire210 = reg199;
  assign wire211 = (wire177[(4'hd):(2'h3)] | (wire174[(3'h6):(3'h5)] != (|wire209[(3'h5):(2'h3)])));
  assign wire212 = $unsigned((|$unsigned((&(reg200 > wire177)))));
  assign wire213 = reg189[(1'h1):(1'h1)];
  assign wire214 = ({({(wire211 ? (8'hb2) : reg183), $signed(reg200)} ?
                               ($unsigned(reg192) - reg201) : ($signed((8'ha7)) ?
                                   $signed(reg191) : {(7'h43)})),
                           (8'hbc)} ?
                       reg196 : ({reg194} ?
                           (reg186[(1'h1):(1'h0)] & $unsigned(reg207)) : $signed(($signed(reg206) << (8'hb6)))));
  assign wire215 = wire214;
  always
    @(posedge clk) begin
      reg216 <= ((^~(|wire179)) ?
          (^{reg201[(1'h1):(1'h0)]}) : (~|$unsigned($signed(wire215))));
      reg217 <= wire176;
      reg218 <= $signed(({(~$signed(reg185))} ^ $unsigned($signed($signed(reg186)))));
      reg219 <= $unsigned((~(^wire174)));
    end
  assign wire220 = (wire209 ^~ $unsigned(({{(8'hb0), reg208},
                       reg182[(3'h5):(1'h0)]} + {reg193})));
  assign wire221 = (~&(reg202[(2'h2):(1'h1)] | ({$signed(reg183),
                       (reg204 ? wire177 : wire215)} <= wire215)));
  assign wire222 = (-reg191);
  assign wire223 = $unsigned(($signed(($signed(reg216) && (~&reg182))) ?
                       $unsigned($unsigned($signed(wire177))) : reg190[(3'h6):(2'h2)]));
  assign wire224 = {$unsigned(reg204[(2'h3):(1'h1)]),
                       $unsigned($unsigned(wire179[(4'h8):(3'h7)]))};
  assign wire225 = $unsigned(({(&$signed((8'ha0))),
                       (reg218[(3'h7):(3'h7)] - wire215)} ^~ ((|(wire174 ?
                           wire210 : (8'ha5))) ?
                       wire179 : wire213[(3'h5):(2'h2)])));
  assign wire226 = $signed((($signed((reg216 && reg194)) ?
                       wire221[(3'h5):(3'h4)] : (^~reg208[(2'h2):(1'h1)])) << wire222));
  assign wire227 = (wire220[(3'h5):(3'h5)] ?
                       $unsigned((~reg190)) : $unsigned((~&((!(8'hb2)) ?
                           (wire225 == reg181) : (reg205 || reg185)))));
endmodule

module module142
#(parameter param169 = (~&{(~((^(8'ha0)) > ((8'hac) ? (8'hba) : (7'h44)))), ((((8'ha2) > (8'ha6)) & ((8'hae) ? (8'ha8) : (8'hb6))) ? {((8'hab) < (8'hbb))} : ((+(8'ha2)) ^ ((8'hb1) ? (8'ha7) : (8'ha5))))}))
(y, clk, wire147, wire146, wire145, wire144, wire143);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire147;
  input wire [(4'he):(1'h0)] wire146;
  input wire signed [(5'h14):(1'h0)] wire145;
  input wire [(3'h6):(1'h0)] wire144;
  input wire signed [(4'he):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire166;
  wire [(2'h3):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire163;
  wire signed [(5'h11):(1'h0)] wire162;
  wire signed [(4'he):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire150;
  wire signed [(3'h4):(1'h0)] wire148;
  reg signed [(3'h7):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire151,
                 wire150,
                 wire148,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg149,
                 (1'h0)};
  assign wire148 = ((8'hbc) ? (8'hb5) : $signed($signed($signed((8'hb9)))));
  always
    @(posedge clk) begin
      reg149 <= wire148;
    end
  assign wire150 = $unsigned($signed(wire146));
  assign wire151 = {wire147[(1'h1):(1'h1)], $signed(wire150[(3'h7):(3'h6)])};
  always
    @(posedge clk) begin
      reg152 <= wire150;
      reg153 <= (8'hb1);
      reg154 <= (-($signed((reg153 ^ $unsigned(wire151))) & $unsigned($unsigned(wire147))));
      if (reg152[(3'h5):(1'h0)])
        begin
          reg155 <= wire143;
          if ($signed((wire146[(3'h7):(1'h0)] != {(reg149 ?
                  reg152 : {(8'hb4), reg149}),
              ((~|reg154) ? (wire148 ? reg154 : wire145) : (+wire147))})))
            begin
              reg156 <= wire151;
              reg157 <= $signed(reg154);
              reg158 <= wire147[(4'hf):(4'ha)];
            end
          else
            begin
              reg156 <= reg158[(3'h5):(1'h0)];
              reg157 <= wire147[(3'h5):(3'h5)];
              reg158 <= $unsigned((8'hb5));
              reg159 <= {wire145[(2'h3):(2'h2)]};
              reg160 <= $signed(reg155[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg155 <= reg153;
          if ((wire143 >>> ($signed((^~wire148[(2'h3):(1'h1)])) * reg159)))
            begin
              reg156 <= $signed((wire146[(4'h8):(3'h4)] ?
                  $signed($signed(reg154)) : (~|reg149)));
              reg157 <= $unsigned($signed(reg154[(3'h6):(3'h5)]));
              reg158 <= $signed((&reg159[(2'h2):(1'h1)]));
            end
          else
            begin
              reg156 <= $unsigned((8'hb7));
              reg157 <= $unsigned({((reg159 ?
                      $signed(wire144) : (reg159 ?
                          wire146 : wire150)) != wire147[(4'ha):(4'ha)]),
                  (~&{$signed(wire148), {reg159, reg157}})});
              reg158 <= (8'hae);
              reg159 <= ((^(+$signed((reg154 ? reg159 : (8'h9e))))) ?
                  (($unsigned(reg158) ?
                          ($signed(reg160) ?
                              wire144 : $unsigned(reg157)) : $signed((8'ha0))) ?
                      (($signed(reg159) ?
                              (reg149 <= reg155) : $unsigned(reg160)) ?
                          ($unsigned(reg159) ?
                              (wire147 ?
                                  wire144 : reg154) : (7'h44)) : {((8'hae) ?
                                  wire151 : wire144)}) : wire150) : (|$unsigned(({wire145,
                      reg149} || {reg158, reg157}))));
            end
        end
    end
  assign wire161 = (!{{{(reg160 ? wire147 : reg153), {reg158}}}});
  assign wire162 = $signed({(&((^~wire143) && {reg154, wire151})), reg152});
  assign wire163 = reg157[(1'h0):(1'h0)];
  assign wire164 = $signed(wire151[(2'h2):(1'h0)]);
  assign wire165 = wire162[(1'h1):(1'h1)];
  assign wire166 = $unsigned((~|$unsigned({$unsigned(wire145),
                       (reg155 >> wire163)})));
  assign wire167 = $unsigned(($signed(($signed(reg152) ?
                           wire163 : $signed(reg155))) ?
                       $unsigned($unsigned($unsigned(wire161))) : reg153[(3'h7):(3'h6)]));
  assign wire168 = reg152;
endmodule

module module68
#(parameter param130 = (+(-({((8'ha1) >> (8'h9c)), ((8'hbf) ? (8'hbf) : (8'hb7))} <= (((8'ha6) > (7'h42)) ? (+(8'h9c)) : ((8'hbf) ? (8'hb7) : (8'hb5)))))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h279):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire73;
  input wire [(5'h15):(1'h0)] wire72;
  input wire signed [(5'h14):(1'h0)] wire71;
  input wire signed [(3'h6):(1'h0)] wire70;
  input wire signed [(4'h9):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(2'h3):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire74;
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
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
                 (1'h0)};
  assign wire74 = wire71;
  assign wire75 = (8'hb0);
  assign wire76 = wire72;
  assign wire77 = ((!($signed((wire70 ? wire73 : wire72)) | (~^(~&wire69)))) ?
                      {$signed(wire70[(1'h0):(1'h0)])} : (wire71[(4'hc):(4'hc)] ?
                          (((^~wire75) && wire70[(3'h6):(1'h1)]) & ((~wire74) >>> (wire74 | wire74))) : (8'hb6)));
  assign wire78 = wire71[(4'ha):(3'h4)];
  assign wire79 = (+{$signed(((wire75 ? wire74 : wire74) == (8'had)))});
  always
    @(posedge clk) begin
      if (wire77)
        begin
          if ((|(wire70 ^~ wire79[(1'h0):(1'h0)])))
            begin
              reg80 <= {wire72};
              reg81 <= $unsigned(($unsigned(wire77[(4'h9):(2'h2)]) && ({((8'hba) ?
                      wire71 : wire78),
                  (wire78 ?
                      wire76 : wire69)} == $unsigned(wire75[(3'h4):(1'h0)]))));
              reg82 <= $signed($signed($unsigned($unsigned((wire75 > wire69)))));
              reg83 <= wire79;
            end
          else
            begin
              reg80 <= ($unsigned(wire69) == wire77);
            end
          if ($signed($unsigned(((wire79 ?
              (reg80 || wire69) : $signed((7'h41))) >>> $unsigned((wire78 ?
              reg80 : reg81))))))
            begin
              reg84 <= ($unsigned(wire70) | ((~&$unsigned(reg80[(5'h11):(4'he)])) ?
                  wire70 : (~^$unsigned(wire70[(3'h6):(3'h5)]))));
              reg85 <= wire71[(5'h10):(1'h1)];
              reg86 <= (!(&$unsigned({(reg81 >>> wire73)})));
              reg87 <= $unsigned($unsigned(wire72[(4'hf):(2'h3)]));
            end
          else
            begin
              reg84 <= wire69[(1'h1):(1'h0)];
            end
          reg88 <= reg81[(3'h7):(2'h3)];
          reg89 <= $signed($signed({wire70,
              ((8'hb6) >> ((8'hb7) ? reg81 : (8'hbe)))}));
          reg90 <= $unsigned(($signed(reg83) ?
              (^(^~$unsigned(wire75))) : (wire73[(5'h14):(4'hf)] - $unsigned($signed(wire79)))));
        end
      else
        begin
          if ((wire74 ?
              (wire79 ?
                  (~&({reg86,
                      (8'hb3)} + (reg83 < wire71))) : $unsigned(reg83)) : $signed($unsigned($unsigned((&wire75))))))
            begin
              reg80 <= (reg90[(4'hc):(3'h6)] <<< wire71);
            end
          else
            begin
              reg80 <= reg90[(4'he):(3'h7)];
              reg81 <= {((8'had) && $unsigned(wire73))};
              reg82 <= (reg82[(4'ha):(4'h9)] ? reg84 : {wire76[(2'h2):(2'h2)]});
              reg83 <= ((((((8'hbe) ?
                  reg90 : reg89) || wire74) * (^~wire76[(1'h0):(1'h0)])) - wire73) | $unsigned((($unsigned(wire77) <= $unsigned(reg81)) >= $unsigned((wire75 != wire73)))));
            end
          reg84 <= $unsigned(((((reg81 ?
                  (8'ha4) : reg87) < reg90[(4'hc):(4'h8)]) ?
              $unsigned(reg85[(3'h4):(3'h4)]) : reg80) != $unsigned($signed(wire70))));
          reg85 <= $signed(wire74[(1'h0):(1'h0)]);
          reg86 <= (8'ha6);
          reg87 <= ($signed((^(reg80[(4'hc):(3'h4)] && reg80))) ?
              (wire73[(4'he):(2'h2)] ?
                  $signed(reg90[(3'h4):(1'h1)]) : {{reg82,
                          ((8'ha0) == reg85)}}) : $unsigned($signed({reg89})));
        end
      if ($unsigned((~&$signed((8'ha3)))))
        begin
          reg91 <= $signed($unsigned($signed(((8'hb3) << (wire69 > reg84)))));
          if (($unsigned(reg91) ?
              $signed($signed($signed((reg80 ?
                  reg87 : (7'h44))))) : (($signed(reg91[(2'h2):(1'h1)]) - wire73[(3'h4):(1'h1)]) << wire72[(4'hd):(4'ha)])))
            begin
              reg92 <= {$signed((8'ha6))};
            end
          else
            begin
              reg92 <= reg91;
              reg93 <= (8'hbf);
              reg94 <= ({$unsigned((!(wire75 ? wire79 : wire69)))} ?
                  reg92 : (!((7'h40) + (wire73[(4'hc):(3'h6)] >= (|wire72)))));
              reg95 <= {(reg87 ? $unsigned(wire72) : reg84[(3'h6):(3'h4)])};
              reg96 <= reg90;
            end
          reg97 <= ($signed(((8'ha3) ^~ ($unsigned(wire76) ?
              (~&reg85) : $unsigned(wire76)))) >= reg87[(3'h5):(2'h2)]);
        end
      else
        begin
          reg91 <= ($signed($signed((~^reg83[(4'h9):(1'h0)]))) ?
              $unsigned((!(wire75[(4'h9):(1'h1)] ?
                  (wire69 ? (8'ha6) : reg92) : {reg95,
                      wire77}))) : {$unsigned(($unsigned(reg84) ^ {reg86,
                      reg90})),
                  ((~^$unsigned((8'hbc))) - ($signed(reg87) ?
                      reg80[(3'h4):(3'h4)] : (reg94 ? reg93 : wire79)))});
          reg92 <= reg97;
          if ({($signed(wire77[(2'h2):(2'h2)]) ?
                  $signed((~|(reg88 ? reg86 : reg86))) : {reg82}),
              reg80[(3'h5):(1'h0)]})
            begin
              reg93 <= wire77[(2'h3):(1'h1)];
              reg94 <= (((8'hb0) != $signed((-wire69[(2'h2):(2'h2)]))) == (!reg82[(3'h4):(1'h1)]));
              reg95 <= $signed((!reg85));
              reg96 <= $signed($unsigned(($signed({(8'ha9), wire74}) ?
                  {$unsigned(reg84)} : (|reg94))));
              reg97 <= {(wire72[(4'he):(4'h9)] ?
                      reg86[(4'hd):(4'ha)] : {(~|{reg92})})};
            end
          else
            begin
              reg93 <= reg89[(1'h1):(1'h1)];
              reg94 <= (!wire77);
              reg95 <= reg84[(4'hc):(4'hb)];
              reg96 <= (8'hb0);
              reg97 <= reg83[(4'ha):(2'h2)];
            end
        end
      if (((~^$unsigned(($signed(wire76) - (reg97 >= (7'h41))))) ?
          $unsigned((!wire76)) : (^reg92)))
        begin
          reg98 <= wire76[(3'h5):(1'h1)];
          reg99 <= ($unsigned(wire70[(3'h5):(3'h5)]) | reg96);
          reg100 <= ($unsigned(wire78[(4'hb):(4'h8)]) & wire75[(4'h9):(4'h8)]);
          reg101 <= ((~|(&(-(wire76 - reg87)))) < ((^~wire70) ?
              $signed((8'haf)) : reg90));
        end
      else
        begin
          reg98 <= (reg91 ?
              (reg98 ?
                  $unsigned($unsigned($signed(wire77))) : ($signed((reg90 <<< wire77)) ?
                      reg97[(1'h0):(1'h0)] : ($signed(wire73) ?
                          (-wire73) : $signed((8'hbf))))) : (reg81[(2'h2):(1'h0)] ?
                  {(^~$signed(reg100))} : $unsigned($unsigned(reg95[(3'h4):(1'h1)]))));
          if ($unsigned(reg101[(2'h3):(1'h0)]))
            begin
              reg99 <= reg87[(2'h3):(1'h1)];
            end
          else
            begin
              reg99 <= ({wire70[(1'h1):(1'h1)]} ?
                  (reg93 ^ $signed((+reg94[(1'h1):(1'h0)]))) : ($signed(wire74[(1'h0):(1'h0)]) ~^ reg89));
              reg100 <= $signed(reg92);
            end
          reg101 <= ((reg93[(4'hb):(3'h7)] <= $signed(wire73)) ?
              ($unsigned(({reg87} >>> $signed(wire72))) ?
                  $unsigned(((|reg94) ?
                      {(8'hb1)} : (wire69 ?
                          reg98 : reg82))) : {$unsigned((~reg96)),
                      $signed($unsigned(reg91))}) : reg83);
          if (reg97[(2'h2):(2'h2)])
            begin
              reg102 <= reg83;
              reg103 <= wire69[(3'h7):(1'h1)];
              reg104 <= $signed($unsigned(reg81[(3'h7):(2'h2)]));
              reg105 <= (($unsigned((reg101[(2'h3):(2'h2)] ^~ $signed(reg94))) ^~ (-$signed($signed(reg100)))) <= $unsigned($signed((^~reg94[(2'h2):(1'h1)]))));
              reg106 <= (!reg97);
            end
          else
            begin
              reg102 <= $signed((|$unsigned((^(reg98 ? wire76 : reg90)))));
            end
        end
      reg107 <= (+((reg84[(4'hc):(1'h0)] + ((reg92 + reg89) & reg94[(4'hb):(2'h3)])) ?
          reg99 : ($signed((|reg80)) & {(reg81 ? reg91 : reg85)})));
      reg108 <= ((^~({reg97} - $signed(reg81[(1'h0):(1'h0)]))) < ($signed(reg105[(1'h1):(1'h1)]) ?
          ({((7'h42) ? reg96 : reg90), (reg80 ? wire77 : reg82)} ?
              $unsigned((reg93 - reg100)) : (^~$signed(reg84))) : reg106));
    end
  assign wire109 = {($signed((8'ha6)) << $signed($signed((wire76 != (8'hbd)))))};
  assign wire110 = {$signed((&(reg99 >>> (8'ha5)))),
                       $signed((wire72 ?
                           $signed({reg82, wire79}) : ($unsigned(reg92) ?
                               (~|reg81) : {reg80, reg97})))};
  assign wire111 = reg106;
  assign wire112 = reg108;
  assign wire113 = (($signed((|{reg105, wire76})) ?
                       ((~^{reg103}) ?
                           wire78 : $signed((~|wire73))) : $unsigned($unsigned($unsigned(reg87)))) ^~ ((({wire74} & reg90[(4'h9):(3'h4)]) << $unsigned((~|wire70))) ?
                       ($signed((reg90 ?
                           reg93 : wire78)) >>> (~|(8'ha3))) : {(-wire71),
                           (~$unsigned((8'ha1)))}));
  always
    @(posedge clk) begin
      if (reg85[(4'ha):(3'h6)])
        begin
          reg114 <= ((-$unsigned($unsigned((^~wire70)))) ?
              (~(^~$signed((reg107 ? reg97 : wire75)))) : wire78);
          reg115 <= reg106[(1'h0):(1'h0)];
        end
      else
        begin
          reg114 <= wire109;
          reg115 <= reg104;
          reg116 <= {$signed($unsigned($unsigned((wire112 == wire111))))};
          reg117 <= $signed({(((wire113 && wire74) ?
                      reg82[(1'h1):(1'h1)] : $unsigned(reg87)) ?
                  reg107 : $signed(((8'ha0) ? reg104 : reg86)))});
          if ($unsigned(reg91[(2'h2):(1'h1)]))
            begin
              reg118 <= {($signed(($signed(reg89) ?
                      $signed(reg104) : (~&wire78))) ^ (&reg91))};
              reg119 <= (($signed(((wire77 == (8'hbd)) | reg101[(3'h4):(3'h4)])) >> (~|(~&$unsigned(reg87)))) ?
                  ($signed(reg115) ?
                      (((!reg82) <= $signed(reg94)) >= reg88[(4'hb):(4'h9)]) : wire74) : $signed($unsigned($signed(reg116))));
              reg120 <= {((((|wire71) ^~ {reg92,
                      reg101}) >>> $unsigned((wire73 ?
                      wire110 : (8'hbd)))) >= (+(~&{reg115}))),
                  reg85};
              reg121 <= wire78;
            end
          else
            begin
              reg118 <= (reg107[(4'h8):(2'h2)] < ((wire74 ?
                  reg90[(3'h5):(1'h1)] : wire79) && {$signed((reg104 ?
                      reg115 : reg116)),
                  $unsigned(wire78)}));
              reg119 <= $signed((&reg119));
              reg120 <= reg88[(3'h7):(3'h5)];
              reg121 <= ({$signed($unsigned($unsigned((8'h9f)))),
                  $unsigned($signed($signed((8'had))))} << (^(((reg115 ?
                      wire69 : wire77) ^~ reg91[(2'h2):(1'h0)]) ?
                  $unsigned((wire77 | (8'ha0))) : {(!reg97), reg106})));
              reg122 <= reg90;
            end
        end
      reg123 <= $signed($signed(reg116));
      reg124 <= {(^~$unsigned((|wire109))),
          (wire69[(3'h5):(3'h4)] <= (~(wire113 >= $unsigned((7'h43)))))};
      reg125 <= wire111[(2'h3):(1'h0)];
      reg126 <= $signed(($signed($signed($signed(wire73))) ?
          $signed((reg124[(3'h7):(3'h7)] > $signed(reg88))) : (8'haa)));
    end
  assign wire127 = $unsigned(reg96[(4'h9):(2'h3)]);
  assign wire128 = reg80;
  assign wire129 = reg124;
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire57;
  input wire signed [(5'h13):(1'h0)] wire56;
  input wire [(2'h3):(1'h0)] wire55;
  input wire signed [(5'h11):(1'h0)] wire54;
  input wire [(5'h12):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  assign y = {wire60, wire59, wire58, reg63, reg62, reg61, (1'h0)};
  assign wire58 = ((~|$signed(((wire55 ? wire54 : wire54) << (^~wire56)))) ?
                      (8'hb4) : (~&(({wire53, wire57} - wire55) ?
                          $signed(wire53[(3'h6):(3'h5)]) : wire55)));
  assign wire59 = $unsigned($signed(wire56));
  assign wire60 = (((wire53 ?
                          wire57[(3'h6):(1'h0)] : ($signed(wire56) ?
                              wire55 : (wire55 ? wire58 : wire59))) ?
                      (wire59[(3'h5):(2'h3)] ?
                          (+$signed((8'hae))) : $signed(wire58)) : wire55[(2'h2):(1'h0)]) << (((wire57 ?
                      $unsigned(wire56) : (wire54 < wire57)) >>> (&(wire54 ?
                      wire56 : wire57))) <<< wire54[(4'hd):(4'h9)]));
  always
    @(posedge clk) begin
      reg61 <= (((^(wire59 ^~ (-wire53))) >>> (~&(wire56[(3'h5):(1'h1)] ?
              {wire54, wire59} : (wire55 == wire56)))) ?
          (|wire60[(3'h4):(1'h1)]) : $unsigned({$signed((wire55 ?
                  wire55 : (8'hbb))),
              (~^(wire57 != wire58))}));
      reg62 <= wire56[(4'hf):(4'hb)];
      reg63 <= $signed((|($signed({(8'hba)}) ?
          (|(wire57 ^~ wire60)) : {wire53[(4'hc):(4'hc)]})));
    end
endmodule
