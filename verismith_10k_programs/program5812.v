module top
#(parameter param297 = (({(&((8'had) ? (8'hb2) : (8'ha6)))} ^ (7'h40)) ? (({((8'hae) - (8'hb5)), {(8'hb6)}} ? {{(8'hba), (8'hb7)}} : (((8'hac) ? (7'h42) : (8'hb7)) ? ((8'hbd) ? (8'ha0) : (8'ha3)) : ((8'hbd) == (8'hab)))) < (8'hba)) : (({((8'hb0) ? (8'hb7) : (8'hb4)), ((7'h41) && (8'hb9))} ? {((8'haf) ? (8'hb4) : (8'h9f))} : (((8'hb1) ? (8'h9e) : (8'ha3)) ? (8'hb3) : ((8'hab) >>> (8'hbf)))) || {((~^(8'hb2)) <= {(8'h9e)}), ({(8'ha2), (8'hb2)} & ((7'h44) ? (8'hb9) : (8'hb4)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h22d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire296;
  wire signed [(5'h10):(1'h0)] wire294;
  wire [(2'h3):(1'h0)] wire293;
  wire [(5'h10):(1'h0)] wire292;
  wire signed [(3'h6):(1'h0)] wire291;
  wire signed [(3'h6):(1'h0)] wire290;
  wire [(5'h12):(1'h0)] wire281;
  wire signed [(5'h10):(1'h0)] wire280;
  wire signed [(4'hf):(1'h0)] wire279;
  wire [(4'he):(1'h0)] wire278;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire276;
  reg signed [(3'h7):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg282 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg283 = (1'h0);
  reg [(3'h6):(1'h0)] reg284 = (1'h0);
  reg [(4'hd):(1'h0)] reg285 = (1'h0);
  reg [(4'ha):(1'h0)] reg286 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg287 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg288 = (1'h0);
  reg [(5'h14):(1'h0)] reg289 = (1'h0);
  assign y = {wire296,
                 wire294,
                 wire293,
                 wire292,
                 wire291,
                 wire290,
                 wire281,
                 wire280,
                 wire279,
                 wire278,
                 wire5,
                 wire6,
                 wire7,
                 wire116,
                 wire118,
                 wire141,
                 wire276,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
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
                 reg282,
                 reg283,
                 reg284,
                 reg285,
                 reg286,
                 reg287,
                 reg288,
                 reg289,
                 (1'h0)};
  assign wire5 = $signed((~&$unsigned(wire0)));
  assign wire6 = $signed((wire2[(4'h8):(1'h1)] ?
                     wire5 : $unsigned($unsigned((!wire5)))));
  assign wire7 = (!wire1[(3'h5):(2'h2)]);
  module8 #() modinst117 (.clk(clk), .wire11(wire2), .wire12(wire4), .y(wire116), .wire9(wire0), .wire10(wire7));
  assign wire118 = (~((wire4 + wire2[(3'h6):(3'h4)]) != {$signed((wire2 + (8'hb0)))}));
  always
    @(posedge clk) begin
      reg119 <= (|$signed($unsigned($signed(wire7[(3'h7):(3'h4)]))));
      if ($unsigned(($unsigned((~(wire118 <<< reg119))) && (wire6[(1'h1):(1'h1)] ^~ reg119[(3'h4):(1'h1)]))))
        begin
          if ((~^(~|wire5[(1'h0):(1'h0)])))
            begin
              reg120 <= (~&wire2[(2'h3):(1'h0)]);
              reg121 <= ((~&((8'hbb) <<< reg120)) ?
                  wire7[(4'ha):(3'h4)] : (wire6 ?
                      reg119 : $unsigned(wire116[(3'h4):(1'h1)])));
              reg122 <= wire5[(2'h3):(1'h0)];
              reg123 <= wire116;
              reg124 <= ($signed($signed((wire5 ?
                      {wire2, wire116} : (wire2 <<< wire2)))) ?
                  reg119[(4'ha):(1'h0)] : (~wire116[(2'h3):(1'h1)]));
            end
          else
            begin
              reg120 <= (reg120 >>> ($signed((!$unsigned((8'ha9)))) ?
                  (reg122 ?
                      wire118 : ((wire5 || reg123) & (|(8'hb6)))) : (wire0 ?
                      $signed((+reg122)) : $signed(wire4))));
              reg121 <= reg120;
              reg122 <= ($unsigned((reg124[(3'h4):(1'h0)] <= (reg119[(4'h8):(1'h0)] ?
                      $unsigned(wire7) : $signed(reg119)))) ?
                  ((($unsigned(reg120) <= wire6) ?
                          (reg119 ^ (!wire5)) : $signed(reg119)) ?
                      $signed($unsigned($unsigned(wire2))) : reg120[(2'h3):(2'h3)]) : wire2[(1'h1):(1'h1)]);
              reg123 <= (8'hbd);
            end
          reg125 <= (8'h9c);
          reg126 <= $unsigned((!$signed(((reg121 ?
              wire3 : wire0) >>> $unsigned((8'ha6))))));
          if ((((-$unsigned(wire6)) | $signed(((!wire1) && (reg120 ?
              wire5 : wire4)))) & (-((reg121[(4'he):(4'he)] ?
                  $unsigned(reg124) : (reg120 ? reg121 : reg123)) ?
              ((wire5 == (8'h9e)) ?
                  $signed((7'h40)) : (wire1 ? wire4 : wire118)) : reg124))))
            begin
              reg127 <= (~|{($signed($unsigned(reg122)) ?
                      reg120 : {(|wire0), $signed(wire3)}),
                  $unsigned(wire3)});
            end
          else
            begin
              reg127 <= $unsigned($signed(reg124[(4'ha):(4'h9)]));
              reg128 <= $unsigned(reg127);
              reg129 <= reg122;
              reg130 <= $signed((|($unsigned($unsigned(wire6)) | (^~(reg128 << wire6)))));
            end
          reg131 <= (~|$unsigned($unsigned(wire0[(1'h0):(1'h0)])));
        end
      else
        begin
          if ($unsigned((~|$unsigned($unsigned((8'hbc))))))
            begin
              reg120 <= ((&($signed($unsigned(wire116)) ?
                      ((wire3 >> reg121) <<< reg123[(4'ha):(3'h6)]) : reg126[(1'h0):(1'h0)])) ?
                  ((~((wire116 ? (8'ha8) : reg130) && (reg124 ?
                      wire116 : reg125))) != wire6) : (~(wire7 ?
                      $unsigned(((8'ha0) >> reg128)) : ((reg130 ?
                          reg123 : reg129) < wire2[(4'hd):(4'hb)]))));
              reg121 <= reg122[(1'h1):(1'h1)];
              reg122 <= ($signed({reg123[(4'h9):(2'h2)],
                  reg124}) && wire116[(1'h0):(1'h0)]);
              reg123 <= $signed((((&reg121[(2'h3):(1'h1)]) && $unsigned(wire2[(4'h8):(3'h7)])) ?
                  (~$signed($unsigned(reg129))) : wire1));
            end
          else
            begin
              reg120 <= $unsigned(((+{(wire5 ^ wire3)}) == (reg127 ?
                  wire3 : $signed(((7'h40) ? wire1 : reg130)))));
              reg121 <= ($signed($unsigned(($signed(wire116) || reg119[(1'h1):(1'h1)]))) * ($unsigned($unsigned((wire5 - reg131))) | (7'h44)));
              reg122 <= wire4;
              reg123 <= (8'hba);
            end
          reg124 <= {reg119[(3'h7):(2'h3)], $unsigned(wire118[(4'h9):(4'h8)])};
        end
      if ((reg122 ^ $signed((|(|(wire116 ? wire4 : reg125))))))
        begin
          reg132 <= wire118[(5'h10):(4'hf)];
          reg133 <= wire1;
          reg134 <= (&$unsigned({($signed(reg127) | (reg120 ?
                  (8'hb8) : (8'had)))}));
        end
      else
        begin
          reg132 <= $signed(reg120);
          reg133 <= wire6;
          reg134 <= wire2[(4'hc):(4'ha)];
          reg135 <= ({reg134} ^~ ({reg125, reg119} ?
              $unsigned((!$unsigned(reg134))) : (-($unsigned((8'ha3)) <= (reg125 ?
                  reg127 : reg123)))));
          if (reg131)
            begin
              reg136 <= reg132[(3'h5):(1'h1)];
              reg137 <= (reg126[(1'h1):(1'h0)] <= reg136);
              reg138 <= {{(((wire7 ? reg129 : wire4) > {wire4}) ?
                          reg126[(1'h0):(1'h0)] : reg133),
                      reg128},
                  (8'ha8)};
            end
          else
            begin
              reg136 <= $unsigned(reg133[(3'h6):(1'h0)]);
              reg137 <= ($unsigned(reg127[(4'h8):(3'h7)]) || $signed((wire0 ^~ reg136[(1'h1):(1'h0)])));
              reg138 <= $signed(((reg120 ? (8'ha6) : reg128[(2'h3):(1'h0)]) ?
                  reg128 : $signed(((-reg131) ?
                      (8'hb2) : ((7'h41) ? reg121 : reg123)))));
              reg139 <= (^$unsigned(((~&reg129) <= reg136)));
            end
        end
      reg140 <= $unsigned(reg130[(1'h1):(1'h1)]);
    end
  assign wire141 = reg120[(2'h3):(1'h0)];
  module142 #() modinst277 (wire276, clk, reg123, reg128, reg122, wire3);
  assign wire278 = wire0[(4'h9):(3'h5)];
  assign wire279 = {(~&reg136), wire116[(2'h2):(2'h2)]};
  assign wire280 = (wire4 & {reg124});
  assign wire281 = (($signed(reg119[(1'h1):(1'h0)]) ?
                           (^wire280) : $signed((^~wire278[(2'h2):(1'h1)]))) ?
                       wire280[(1'h1):(1'h0)] : reg130[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      if (reg123[(4'hc):(3'h5)])
        begin
          reg282 <= (reg128 * $unsigned($unsigned(((wire3 ?
              reg139 : reg132) <<< (^~wire2)))));
          reg283 <= (&wire116);
          reg284 <= $signed((reg282 ? wire0 : (8'h9f)));
          reg285 <= ((^reg129[(5'h14):(4'hb)]) ?
              (!$signed($signed(wire276[(3'h6):(2'h3)]))) : (8'ha2));
          reg286 <= wire6[(3'h4):(1'h1)];
        end
      else
        begin
          reg282 <= wire141;
        end
      if ((reg126 ?
          {$signed(($unsigned(reg126) ?
                  $signed((7'h42)) : reg131[(1'h0):(1'h0)]))} : reg284[(2'h3):(1'h0)]))
        begin
          reg287 <= ($signed((-(8'h9c))) & $signed((reg285 ?
              reg284[(3'h6):(3'h4)] : (-wire1))));
        end
      else
        begin
          if (({reg140[(3'h4):(1'h1)],
              (((wire116 & wire2) ^ $unsigned(wire1)) >> $signed((wire278 <<< reg137)))} > $signed($signed(((reg282 ?
                  (8'hbb) : reg287) ?
              reg129 : $unsigned(reg123))))))
            begin
              reg287 <= {{wire118},
                  (((~&(wire5 ? wire5 : reg139)) ?
                      wire278 : (8'ha6)) * $unsigned(reg126[(1'h0):(1'h0)]))};
              reg288 <= reg284;
            end
          else
            begin
              reg287 <= {$signed((($signed(wire2) ? wire3 : wire118) ?
                      ((reg123 >> reg128) ?
                          reg137[(2'h3):(2'h3)] : reg283[(2'h3):(1'h1)]) : reg130))};
              reg288 <= (8'hb8);
              reg289 <= $signed(reg131);
            end
        end
    end
  assign wire290 = wire281;
  assign wire291 = (reg133 >>> reg125);
  assign wire292 = reg126[(1'h1):(1'h0)];
  assign wire293 = wire4[(3'h6):(1'h1)];
  module190 #() modinst295 (.wire193(wire281), .clk(clk), .wire192(reg121), .y(wire294), .wire194(reg282), .wire191(reg133), .wire195(wire292));
  assign wire296 = {((^~reg288) ?
                           (|$unsigned((reg288 ?
                               wire291 : wire293))) : ($signed((wire2 ?
                                   (8'ha3) : reg137)) ?
                               ((reg136 <= (8'hb7)) + (&reg135)) : {((8'hba) ?
                                       reg130 : reg131),
                                   ((7'h42) ? wire1 : reg138)}))};
endmodule

module module142
#(parameter param275 = ((|(~|((!(8'hbe)) ? (~&(8'hbc)) : ((8'hb6) ? (7'h44) : (8'ha6))))) && (+(|(+((8'hb7) >>> (8'hb8)))))))
(y, clk, wire146, wire145, wire144, wire143);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire146;
  input wire [(5'h14):(1'h0)] wire145;
  input wire signed [(5'h10):(1'h0)] wire144;
  input wire [(3'h5):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire260;
  wire [(4'he):(1'h0)] wire259;
  wire signed [(5'h10):(1'h0)] wire257;
  wire [(5'h14):(1'h0)] wire241;
  wire [(4'ha):(1'h0)] wire240;
  wire signed [(5'h15):(1'h0)] wire239;
  wire [(4'ha):(1'h0)] wire237;
  wire [(5'h10):(1'h0)] wire189;
  wire signed [(5'h10):(1'h0)] wire187;
  wire signed [(3'h5):(1'h0)] wire186;
  wire [(5'h12):(1'h0)] wire184;
  wire signed [(5'h12):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire147;
  reg [(2'h2):(1'h0)] reg274 = (1'h0);
  reg [(3'h6):(1'h0)] reg273 = (1'h0);
  reg [(4'h8):(1'h0)] reg272 = (1'h0);
  reg [(4'h9):(1'h0)] reg271 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg270 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg269 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg267 = (1'h0);
  reg [(3'h5):(1'h0)] reg266 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg265 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg264 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg263 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg262 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg261 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg188 = (1'h0);
  assign y = {wire260,
                 wire259,
                 wire257,
                 wire241,
                 wire240,
                 wire239,
                 wire237,
                 wire189,
                 wire187,
                 wire186,
                 wire184,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg188,
                 (1'h0)};
  assign wire147 = ($signed(wire145[(4'h8):(4'h8)]) + wire146[(2'h3):(2'h3)]);
  assign wire148 = (((~^(7'h40)) ?
                       $signed($unsigned((wire145 - wire146))) : (wire146 ?
                           wire145 : ($unsigned(wire144) && $signed(wire147)))) | {$unsigned({$signed(wire146)})});
  assign wire149 = wire143;
  assign wire150 = wire148;
  module151 #() modinst185 (wire184, clk, wire145, wire150, wire144, wire148);
  assign wire186 = wire144[(4'hb):(3'h4)];
  assign wire187 = wire149;
  always
    @(posedge clk) begin
      reg188 <= $unsigned(wire186[(2'h2):(2'h2)]);
    end
  assign wire189 = ({$unsigned((!(wire147 ? wire150 : (7'h41)))), wire148} ?
                       (~$unsigned($unsigned((8'hb5)))) : (wire150[(2'h2):(1'h1)] != (-wire144)));
  module190 #() modinst238 (wire237, clk, wire189, reg188, wire150, wire148, wire184);
  assign wire239 = (&(((wire184 <= (~wire147)) ?
                       $signed((|reg188)) : ($signed(wire146) ?
                           (&wire144) : {wire237,
                               wire186})) ^~ {((8'h9d) - (!(8'h9e))),
                       wire237[(3'h5):(1'h1)]}));
  assign wire240 = (wire237[(1'h1):(1'h0)] ?
                       ((|wire144[(1'h0):(1'h0)]) ?
                           wire186 : $unsigned(wire189[(3'h6):(2'h3)])) : (^((&(wire143 || wire237)) ?
                           $signed((wire237 < wire145)) : wire149)));
  assign wire241 = wire148;
  module242 #() modinst258 (.wire246(wire146), .y(wire257), .wire243(wire144), .wire244(wire187), .clk(clk), .wire245(wire184));
  assign wire259 = wire184[(2'h2):(2'h2)];
  assign wire260 = wire240;
  always
    @(posedge clk) begin
      if ($unsigned((8'ha6)))
        begin
          if ((~&wire257[(2'h3):(2'h2)]))
            begin
              reg261 <= ((^(((^~wire260) ?
                      (~^reg188) : $unsigned(wire237)) >>> $signed(wire148[(3'h4):(2'h3)]))) ?
                  (wire184 != $signed((-(wire145 ?
                      (8'hae) : wire186)))) : {wire240});
              reg262 <= wire239;
              reg263 <= (&((~wire240) & ($signed(wire237[(2'h2):(1'h0)]) || wire257)));
            end
          else
            begin
              reg261 <= ((&wire260) ?
                  (((-$signed((8'ha3))) ?
                      wire184[(3'h4):(2'h2)] : $unsigned({(8'hb7)})) | wire241[(4'hb):(4'hb)]) : $unsigned(reg262[(3'h4):(2'h2)]));
            end
          reg264 <= wire148;
        end
      else
        begin
          reg261 <= $signed(wire240[(1'h1):(1'h0)]);
        end
      reg265 <= ($unsigned(wire257[(3'h5):(1'h0)]) << $unsigned(($signed(wire237) ^~ wire241)));
      reg266 <= reg263[(3'h6):(3'h6)];
      if ((((~&wire240) ^~ (^~reg261[(3'h4):(2'h2)])) <= $signed((&{wire148}))))
        begin
          reg267 <= (reg261 ? (reg262 >= wire143[(3'h4):(1'h0)]) : reg263);
          reg268 <= (($unsigned({wire149, wire145[(4'hc):(3'h6)]}) ?
              $signed((reg267 << $signed(reg262))) : ((~reg265) && wire240)) > (wire186[(1'h0):(1'h0)] | ({$unsigned(wire150)} ?
              ($unsigned((7'h44)) * $unsigned(wire237)) : reg188[(3'h5):(3'h4)])));
          if ((($unsigned($signed(wire239)) * reg267[(4'h8):(2'h2)]) ?
              reg263[(5'h12):(4'h9)] : wire184[(4'hd):(1'h1)]))
            begin
              reg269 <= $unsigned(wire260[(4'h8):(3'h6)]);
              reg270 <= ((wire239 ?
                  reg263 : (reg265[(3'h5):(2'h3)] + $unsigned((reg267 | wire257)))) >>> (^(wire240 ?
                  $unsigned($signed(wire148)) : reg263[(4'h9):(3'h7)])));
            end
          else
            begin
              reg269 <= wire186;
            end
          reg271 <= $signed(wire187);
        end
      else
        begin
          reg267 <= reg271[(4'h9):(4'h8)];
          if ((~&wire186[(1'h1):(1'h0)]))
            begin
              reg268 <= ((&{reg267, (~|wire184)}) ?
                  (($signed((wire189 ? wire237 : wire259)) ?
                      $signed((!(8'hb9))) : ((-wire187) ?
                          $unsigned(wire184) : ((8'hbc) > reg188))) >>> wire149) : (~|reg261));
            end
          else
            begin
              reg268 <= wire186[(2'h2):(1'h0)];
              reg269 <= $signed(((~|$unsigned(reg270)) ?
                  $signed(wire147[(1'h0):(1'h0)]) : $signed(($unsigned(reg262) * $unsigned(wire259)))));
              reg270 <= $unsigned($signed($unsigned($signed((8'hba)))));
            end
          if ($unsigned((($unsigned($signed(wire145)) ?
              ((+(8'ha5)) < (8'hb2)) : wire144) | wire189)))
            begin
              reg271 <= $unsigned(($signed(({reg268,
                  reg266} * (!reg263))) + {$unsigned($signed(reg267))}));
              reg272 <= wire187[(3'h7):(3'h4)];
              reg273 <= wire145;
            end
          else
            begin
              reg271 <= {$signed(wire148)};
              reg272 <= (^{$unsigned($unsigned(wire260[(4'ha):(1'h0)]))});
            end
          reg274 <= $signed((~(-$unsigned((8'hbc)))));
        end
    end
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h1fa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire36;
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire40,
                 wire39,
                 wire38,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire36,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire13 = ((~&({(~wire11), (7'h44)} ?
                      $signed((|(8'ha6))) : wire9[(4'h8):(3'h5)])) && (((wire11[(4'hb):(4'h9)] ?
                          {wire12} : (wire9 != wire11)) ?
                      ({(8'hbb)} == wire11[(4'ha):(1'h0)]) : wire12[(4'h8):(3'h5)]) && {($unsigned((8'h9c)) ?
                          $unsigned((8'ha3)) : $unsigned((7'h43))),
                      wire12}));
  assign wire14 = (((+($unsigned(wire12) ? $signed(wire11) : $signed(wire10))) ?
                          wire10 : (((-wire11) <= (wire12 < wire10)) ?
                              $unsigned((wire9 >> wire9)) : ($unsigned(wire10) | $signed(wire12)))) ?
                      (wire10 ?
                          wire13 : (^~((^~wire9) ^ wire10))) : $unsigned($unsigned(((-wire12) ?
                          (~wire9) : (8'ha9)))));
  assign wire15 = wire13;
  assign wire16 = (~&(wire13 | (|$unsigned(wire12[(4'h9):(3'h6)]))));
  assign wire17 = (wire9[(4'h9):(3'h5)] << wire13[(4'h9):(3'h4)]);
  module18 #() modinst37 (wire36, clk, wire15, wire14, wire10, wire11, wire9);
  assign wire38 = $signed(wire16);
  assign wire39 = $signed((7'h43));
  assign wire40 = ((|(((wire38 ? wire36 : (8'h9f)) ?
                              $signed(wire11) : {wire9}) ?
                          (^wire10[(3'h5):(1'h0)]) : $signed(wire10))) ?
                      $unsigned((+$unsigned((^~wire9)))) : wire9);
  always
    @(posedge clk) begin
      reg41 <= ((wire39 >> (^~(~^(|wire14)))) > $unsigned(wire15[(2'h2):(1'h1)]));
      reg42 <= reg41;
      reg43 <= wire11[(2'h2):(1'h0)];
      reg44 <= $unsigned((^wire16[(3'h4):(1'h0)]));
      reg45 <= $signed($signed((^wire15)));
    end
  always
    @(posedge clk) begin
      if (($unsigned(((8'h9c) ?
          reg41[(3'h7):(3'h5)] : ((wire16 ?
              wire12 : reg41) <= (reg41 == reg41)))) > ((^~(reg44 || wire10[(4'ha):(3'h5)])) ?
          wire14[(4'h9):(4'h9)] : $signed($unsigned($signed(reg45))))))
        begin
          if ($signed(wire17[(4'h9):(1'h0)]))
            begin
              reg46 <= (^~{(!wire13[(2'h3):(1'h1)]), reg41[(4'hc):(2'h3)]});
              reg47 <= wire9[(3'h6):(3'h4)];
            end
          else
            begin
              reg46 <= $unsigned((|wire9));
              reg47 <= reg45[(4'ha):(2'h3)];
              reg48 <= $unsigned($unsigned($signed(wire11[(4'h9):(1'h0)])));
              reg49 <= reg44;
            end
          reg50 <= wire13;
        end
      else
        begin
          if ($signed($signed(reg49[(2'h2):(1'h0)])))
            begin
              reg46 <= ((&$unsigned($signed((|wire17)))) ?
                  (($signed(wire9[(4'he):(3'h7)]) ? wire16 : wire36) ?
                      $unsigned(wire13) : $signed(($signed(wire40) ~^ {wire15,
                          wire17}))) : ((&reg43[(4'hc):(2'h2)]) ?
                      {((8'had) ?
                              (reg42 << reg41) : (wire16 ?
                                  reg44 : wire15))} : $signed(reg49)));
              reg47 <= (8'hb1);
              reg48 <= $signed($signed((^~wire16[(2'h2):(1'h0)])));
              reg49 <= wire38;
              reg50 <= {((&wire38[(4'hd):(4'ha)]) ?
                      (~($signed(wire9) << $signed(reg48))) : (8'ha5))};
            end
          else
            begin
              reg46 <= wire10;
              reg47 <= ({($signed((~^wire40)) ?
                          ({wire39,
                              wire17} << wire13[(3'h5):(1'h0)]) : $signed($unsigned((8'hbc))))} ?
                  {wire9[(4'hd):(4'h8)]} : (~^wire9));
            end
          reg51 <= (|wire13[(4'ha):(1'h1)]);
          reg52 <= {reg45, wire17};
          reg53 <= (~&reg46[(3'h5):(1'h1)]);
          reg54 <= {((~^(wire16 && {reg51,
                  reg46})) ^~ (&reg50[(4'h8):(2'h2)]))};
        end
      reg55 <= {$unsigned(reg54)};
      if ((-{(~(^(wire12 && reg47)))}))
        begin
          if ((reg51 ?
              ((reg49[(4'h9):(3'h7)] ?
                  {(reg53 ?
                          reg54 : wire15)} : reg52[(3'h7):(1'h0)]) <<< (((wire17 ~^ wire40) ?
                  ((8'hb4) ~^ reg43) : $signed(wire38)) == reg54[(5'h10):(4'h9)])) : reg45[(1'h0):(1'h0)]))
            begin
              reg56 <= (&(^$signed($signed($unsigned(wire39)))));
              reg57 <= {((((reg45 <<< wire39) ?
                      $signed(wire9) : $signed(wire9)) - {(reg50 >= (8'ha8))}) <= (^~(reg51[(1'h1):(1'h0)] ?
                      (wire10 && reg52) : (-reg50)))),
                  reg46[(1'h0):(1'h0)]};
              reg58 <= $signed((wire15[(4'hd):(1'h0)] ?
                  (~&(&(wire40 ? reg42 : wire14))) : reg52));
              reg59 <= (reg47[(3'h6):(3'h4)] > reg52[(4'he):(3'h4)]);
              reg60 <= reg55;
            end
          else
            begin
              reg56 <= $unsigned(($unsigned((wire17 ?
                      wire40[(3'h4):(2'h2)] : {reg44})) ?
                  (+(&(reg54 ? reg57 : (8'hbd)))) : ($signed(((7'h41) ?
                      reg57 : reg59)) != ((wire13 ~^ wire39) ?
                      reg58[(3'h5):(3'h5)] : reg49))));
              reg57 <= (-$unsigned($signed($signed({reg44, reg55}))));
              reg58 <= reg60;
            end
          reg61 <= $unsigned((^~((reg60 << $unsigned(reg57)) ?
              $unsigned($unsigned(wire39)) : ((reg55 > wire40) ^~ ((8'hb0) ?
                  reg42 : wire13)))));
          reg62 <= $unsigned($unsigned({(reg57[(3'h7):(1'h1)] | $signed(wire40))}));
          if ($unsigned(reg44[(1'h1):(1'h1)]))
            begin
              reg63 <= $signed((reg60 >= (reg50[(2'h2):(2'h2)] ?
                  $signed(reg45) : $signed((7'h42)))));
              reg64 <= $unsigned((((-(reg41 ? wire40 : reg57)) ?
                  (reg54[(4'ha):(2'h2)] ?
                      reg62[(3'h4):(3'h4)] : $signed(reg47)) : $unsigned($signed(reg54))) <= $signed((8'hb1))));
            end
          else
            begin
              reg63 <= $unsigned($unsigned(reg63[(2'h3):(1'h0)]));
              reg64 <= {wire12, $unsigned($signed($signed({reg60})))};
              reg65 <= $signed(reg61[(3'h5):(1'h1)]);
            end
        end
      else
        begin
          reg56 <= (($signed($unsigned(reg54)) ?
                  $signed($signed({reg64, reg59})) : {$signed(reg50)}) ?
              ((($signed(wire39) >= wire16[(3'h6):(2'h3)]) ?
                  reg61[(4'h9):(4'h8)] : reg47) >>> $unsigned(($unsigned(reg50) ^~ $signed(reg50)))) : (|wire39));
          reg57 <= ((-(|$signed(wire11))) ?
              reg42 : (reg57[(4'hc):(4'hc)] ?
                  ((reg49 ?
                      {reg51} : $unsigned(reg52)) << $signed($unsigned((8'hbe)))) : ($signed(wire36[(3'h6):(1'h0)]) <= $signed((wire40 > wire14)))));
        end
      reg66 <= (8'haa);
    end
  module67 #() modinst111 (wire110, clk, reg46, reg61, reg57, reg65, reg55);
  assign wire112 = reg45;
  assign wire113 = ((~&$unsigned(((|reg56) ? $signed(reg49) : reg46))) ?
                       $signed(reg48[(4'h8):(2'h3)]) : (^wire15));
  assign wire114 = $unsigned($signed(reg48[(1'h0):(1'h0)]));
  assign wire115 = {reg49};
endmodule

module module67  (y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire72;
  input wire [(3'h5):(1'h0)] wire71;
  input wire [(5'h14):(1'h0)] wire70;
  input wire signed [(4'hf):(1'h0)] wire69;
  input wire signed [(5'h15):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg103,
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
  assign wire73 = (wire72 ? ((8'hb0) >> (|(8'hb4))) : wire69);
  assign wire74 = $signed(wire73[(2'h3):(2'h2)]);
  assign wire75 = wire69[(3'h5):(2'h2)];
  assign wire76 = (&(~^(((-(8'haa)) ?
                      (8'h9d) : (-wire72)) & ((~|wire68) <= wire72))));
  assign wire77 = (((+{(wire74 <<< wire75)}) ^ $signed(($signed(wire71) * wire70))) ?
                      {((^~(wire75 ? wire72 : wire72)) - {(~^(8'haa)),
                              ((8'hbb) ? wire69 : wire75)}),
                          {wire68[(5'h15):(2'h3)]}} : (!wire72));
  assign wire78 = (wire72[(4'h9):(4'h9)] ? wire77 : wire73);
  assign wire79 = wire69;
  always
    @(posedge clk) begin
      reg80 <= wire72;
      reg81 <= (wire73[(4'he):(3'h6)] ?
          (8'ha0) : $unsigned($unsigned($signed((!wire72)))));
      if ((+wire71))
        begin
          reg82 <= ((wire70 > ({$unsigned((8'ha1)),
              wire73} <= ($signed(wire79) ?
              wire72[(4'hf):(4'hb)] : wire72))) || $unsigned(($signed($signed(wire71)) ^~ $signed((wire74 == (8'hb6))))));
        end
      else
        begin
          reg82 <= $unsigned($unsigned((wire72[(3'h7):(3'h4)] < {(wire68 ?
                  wire77 : wire74)})));
          if ($unsigned($unsigned((^~{$unsigned(wire75), (^~reg81)}))))
            begin
              reg83 <= wire70;
              reg84 <= wire78[(2'h2):(2'h2)];
            end
          else
            begin
              reg83 <= $signed((reg81[(2'h3):(1'h1)] ~^ ($signed(wire69[(1'h0):(1'h0)]) ?
                  (~|(wire72 ? reg83 : (8'hb9))) : (reg80 << wire73))));
              reg84 <= ($signed($signed($unsigned((~reg81)))) ?
                  (8'had) : $signed(((-$unsigned((8'ha9))) != {(wire76 >= wire73),
                      (reg82 ? wire77 : wire69)})));
              reg85 <= (wire68 == (wire72[(2'h3):(2'h2)] <= ($unsigned(reg81[(4'he):(4'hc)]) < $signed(wire68))));
              reg86 <= $signed({$unsigned(reg83),
                  (reg83 <<< (wire78 ^~ $signed(reg83)))});
              reg87 <= $unsigned($unsigned((+reg86[(5'h10):(4'h9)])));
            end
        end
      reg88 <= wire72[(5'h12):(1'h0)];
      if ($unsigned({$signed($unsigned(wire76)), wire72[(4'hf):(4'hd)]}))
        begin
          reg89 <= $signed(wire78);
          if ((reg81[(3'h4):(1'h0)] && (wire79 ?
              (((~^reg89) ^~ reg88) == {(8'ha9)}) : reg86)))
            begin
              reg90 <= $signed((~&$unsigned($unsigned((8'ha6)))));
              reg91 <= $unsigned((^{wire76, (7'h41)}));
            end
          else
            begin
              reg90 <= (+$signed((8'hbf)));
            end
          reg92 <= reg88;
          if ((^(|(^~$unsigned((8'ha7))))))
            begin
              reg93 <= $signed({$signed($signed(reg85))});
              reg94 <= reg89;
            end
          else
            begin
              reg93 <= reg84[(4'hd):(1'h0)];
              reg94 <= (reg82 ?
                  $unsigned((($unsigned((8'h9d)) ?
                      {wire78} : wire76[(4'h9):(3'h4)]) >> ({reg93, wire78} ?
                      reg94 : {(8'h9f)}))) : ({(7'h40)} && ((&$unsigned(reg93)) >> ($unsigned(wire71) ?
                      {(8'had), reg81} : ((8'hb7) <= reg85)))));
              reg95 <= (wire68[(4'he):(3'h5)] != (&(^$signed($signed(wire69)))));
            end
        end
      else
        begin
          reg89 <= ($signed($unsigned({$unsigned(wire79)})) >>> reg85);
          reg90 <= ({reg87[(4'ha):(2'h2)],
              (&(~(reg95 || reg88)))} * $unsigned((~wire76)));
          reg91 <= wire77;
          reg92 <= $signed({$signed($signed((reg94 * (7'h42))))});
          reg93 <= $signed(($unsigned(({reg89} ?
              wire74 : $unsigned(reg94))) << (reg93 >> ((8'ha3) ?
              $signed(wire79) : (wire77 ? reg92 : wire79)))));
        end
    end
  assign wire96 = (~reg86);
  assign wire97 = ($signed((~((reg94 ? reg83 : wire79) == (reg86 ?
                      (7'h40) : (8'ha9))))) || reg81[(3'h6):(2'h2)]);
  assign wire98 = (~&(|{$signed(wire70[(1'h1):(1'h0)])}));
  assign wire99 = ($signed(($signed((wire68 | wire68)) ?
                          (+(reg88 ? reg83 : (8'hb4))) : (reg90[(2'h3):(1'h0)] ?
                              wire96 : (~wire69)))) ?
                      ($signed(reg89[(5'h10):(1'h0)]) ^ $unsigned(($signed((8'ha0)) & $signed((7'h41))))) : wire78[(4'h9):(1'h1)]);
  assign wire100 = {(~&$unsigned($signed(reg83))), wire75[(4'hc):(2'h3)]};
  assign wire101 = (~^($signed(wire98[(4'hb):(4'h9)]) << $unsigned(reg85[(4'h9):(1'h1)])));
  assign wire102 = {(wire79[(4'h8):(3'h7)] ?
                           $unsigned(wire97) : reg83[(1'h1):(1'h0)]),
                       (+$unsigned((reg81[(3'h7):(1'h0)] ?
                           wire100 : {(8'hb8)})))};
  always
    @(posedge clk) begin
      reg103 <= $signed({((-$signed(wire75)) ? (^wire78) : reg85),
          ((wire73 ?
              $unsigned((8'hbb)) : (reg84 ?
                  (8'ha5) : wire76)) + (~&reg80[(1'h1):(1'h0)]))});
    end
  assign wire104 = $unsigned(wire100);
  assign wire105 = (8'ha1);
  assign wire106 = wire76[(5'h11):(5'h11)];
  assign wire107 = (~&$signed((-(^~$unsigned(reg91)))));
  assign wire108 = {reg93[(1'h1):(1'h1)], (~&reg93[(2'h2):(2'h2)])};
  assign wire109 = (~^wire72[(3'h5):(3'h5)]);
endmodule

module module18
#(parameter param34 = (|(((+(^~(8'ha4))) ? ((-(8'haf)) ^ (^(8'hbe))) : {((8'ha7) ? (8'had) : (8'hb9))}) << ((-((8'ha8) >= (8'ha3))) * {((8'hb8) ? (8'hbf) : (8'haf))}))), 
parameter param35 = ((|(^(param34 ? param34 : param34))) ? (~|param34) : param34))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg33,
                 (1'h0)};
  assign wire24 = $signed(wire22[(3'h6):(3'h4)]);
  assign wire25 = (^~{$signed($signed($unsigned(wire22))),
                      (~|($unsigned(wire22) ?
                          $signed((8'hb3)) : $unsigned((8'haa))))});
  assign wire26 = (wire25[(5'h10):(4'hb)] ? wire24 : wire23);
  assign wire27 = (!(~((!(wire20 == wire25)) ?
                      {(wire20 << wire22)} : ((wire21 ? wire25 : wire22) ?
                          wire19[(1'h1):(1'h1)] : wire21[(4'hf):(3'h5)]))));
  assign wire28 = (8'hb3);
  assign wire29 = ($unsigned($unsigned((-(wire23 ?
                      wire19 : wire21)))) != (((wire20 == {wire19}) ?
                          ($signed(wire26) >> $unsigned(wire20)) : ($unsigned(wire28) >>> (wire27 ?
                              wire21 : wire21))) ?
                      (|(wire25[(3'h7):(2'h3)] ?
                          (wire25 ?
                              wire28 : wire23) : wire20[(2'h3):(1'h1)])) : {wire23,
                          {(wire24 ? wire21 : wire23), wire26}}));
  assign wire30 = (wire22 < wire23);
  assign wire31 = ($signed($signed((^~(|wire23)))) ?
                      (~^(-wire19)) : $unsigned((wire23[(4'hc):(3'h6)] ?
                          wire29[(1'h1):(1'h1)] : ((wire24 ?
                              wire20 : wire21) ^ (^wire25)))));
  assign wire32 = (^wire19[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      reg33 <= (-(^~wire20));
    end
endmodule

module module242  (y, clk, wire246, wire245, wire244, wire243);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire246;
  input wire [(4'hb):(1'h0)] wire245;
  input wire signed [(5'h10):(1'h0)] wire244;
  input wire [(5'h10):(1'h0)] wire243;
  wire signed [(4'hb):(1'h0)] wire256;
  wire signed [(5'h15):(1'h0)] wire251;
  wire [(5'h11):(1'h0)] wire250;
  wire signed [(3'h7):(1'h0)] wire249;
  wire [(2'h3):(1'h0)] wire248;
  wire signed [(2'h2):(1'h0)] wire247;
  reg [(5'h13):(1'h0)] reg255 = (1'h0);
  reg [(5'h11):(1'h0)] reg254 = (1'h0);
  reg [(4'ha):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg252 = (1'h0);
  assign y = {wire256,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 (1'h0)};
  assign wire247 = wire245[(3'h6):(1'h0)];
  assign wire248 = (8'hac);
  assign wire249 = (^((wire246[(3'h7):(3'h4)] ?
                       wire243[(3'h7):(2'h2)] : wire248[(1'h0):(1'h0)]) * (((&(8'haf)) <= {wire246}) ?
                       $signed(wire246[(1'h0):(1'h0)]) : wire248[(1'h0):(1'h0)])));
  assign wire250 = {$unsigned($unsigned(((~|wire246) ?
                           wire245 : (wire249 || wire243))))};
  assign wire251 = $signed(wire244[(4'he):(4'hd)]);
  always
    @(posedge clk) begin
      reg252 <= wire246;
      reg253 <= reg252;
      reg254 <= $signed((^$unsigned(((&wire244) ? (~|(8'hbd)) : wire248))));
      reg255 <= $signed($signed(wire251[(3'h7):(1'h0)]));
    end
  assign wire256 = (^~reg252[(3'h7):(1'h1)]);
endmodule

module module190  (y, clk, wire195, wire194, wire193, wire192, wire191);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire195;
  input wire signed [(4'hf):(1'h0)] wire194;
  input wire [(5'h12):(1'h0)] wire193;
  input wire signed [(4'hd):(1'h0)] wire192;
  input wire signed [(4'h8):(1'h0)] wire191;
  wire [(2'h3):(1'h0)] wire236;
  wire signed [(4'hd):(1'h0)] wire235;
  wire signed [(3'h7):(1'h0)] wire234;
  wire [(4'he):(1'h0)] wire233;
  wire signed [(5'h14):(1'h0)] wire232;
  wire signed [(5'h13):(1'h0)] wire221;
  wire [(2'h3):(1'h0)] wire220;
  wire signed [(4'hf):(1'h0)] wire219;
  wire [(4'h9):(1'h0)] wire198;
  wire [(5'h12):(1'h0)] wire197;
  wire signed [(4'hc):(1'h0)] wire196;
  reg signed [(4'hc):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg230 = (1'h0);
  reg [(4'hf):(1'h0)] reg229 = (1'h0);
  reg [(5'h13):(1'h0)] reg228 = (1'h0);
  reg [(4'h9):(1'h0)] reg227 = (1'h0);
  reg [(2'h2):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg222 = (1'h0);
  reg [(4'ha):(1'h0)] reg218 = (1'h0);
  reg [(5'h13):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg216 = (1'h0);
  reg [(4'h8):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg212 = (1'h0);
  reg [(2'h3):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg210 = (1'h0);
  reg [(4'hd):(1'h0)] reg209 = (1'h0);
  reg [(4'h8):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg205 = (1'h0);
  reg [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg201 = (1'h0);
  reg [(4'h8):(1'h0)] reg200 = (1'h0);
  reg [(5'h11):(1'h0)] reg199 = (1'h0);
  assign y = {wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire221,
                 wire220,
                 wire219,
                 wire198,
                 wire197,
                 wire196,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
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
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 (1'h0)};
  assign wire196 = wire193[(5'h11):(2'h3)];
  assign wire197 = wire193[(4'hd):(4'hb)];
  assign wire198 = $unsigned(wire195[(4'hb):(2'h3)]);
  always
    @(posedge clk) begin
      reg199 <= ({wire195,
          (~(-$signed(wire196)))} | {($unsigned((|wire197)) * (-wire194)),
          ($signed(wire198[(1'h0):(1'h0)]) < $signed(wire196))});
      reg200 <= $signed((wire192 >>> reg199[(1'h1):(1'h1)]));
      reg201 <= $unsigned((~$unsigned(reg200[(3'h5):(2'h2)])));
      if ({(!{(^~(reg201 ~^ (8'hb2))),
              ((wire196 ? reg199 : wire193) * (wire192 ? wire198 : reg201))}),
          $unsigned($signed((-$unsigned(wire194))))})
        begin
          if (wire192)
            begin
              reg202 <= {wire197,
                  ((((8'hb5) >>> ((8'hbf) ^ wire192)) * (~&(wire197 ?
                      reg201 : reg199))) == {$unsigned(reg201)})};
              reg203 <= (~^(-($unsigned((wire193 < (8'hba))) ?
                  (7'h41) : (((8'hb0) ? wire191 : wire195) ~^ (!wire197)))));
              reg204 <= $unsigned((($unsigned((&reg203)) ?
                      $signed((wire195 ? (7'h44) : reg200)) : ((8'hac) ?
                          wire196 : (8'hae))) ?
                  $signed(({wire193,
                      wire191} & (|reg200))) : $unsigned((((7'h42) | reg203) ?
                      (wire195 ? wire193 : wire193) : {reg199}))));
              reg205 <= $signed(wire191[(3'h7):(3'h6)]);
              reg206 <= reg204;
            end
          else
            begin
              reg202 <= $unsigned(reg204);
            end
          reg207 <= (|reg204);
          reg208 <= reg202;
          reg209 <= {$signed(wire198), $signed(wire197[(5'h12):(3'h5)])};
          reg210 <= reg205[(2'h3):(2'h2)];
        end
      else
        begin
          if ((-($signed(reg206) || {$signed((^~wire195))})))
            begin
              reg202 <= $unsigned({{reg200, $unsigned(reg202[(3'h6):(1'h0)])}});
              reg203 <= $unsigned($unsigned($unsigned($signed(reg210))));
              reg204 <= (~&{(+((reg207 ? reg199 : reg205) & wire192)),
                  (((wire194 ? reg199 : wire192) <<< (reg203 >>> wire196)) ?
                      $signed((reg207 << reg199)) : wire195[(4'ha):(3'h6)])});
              reg205 <= reg200;
              reg206 <= $unsigned(reg200[(1'h1):(1'h0)]);
            end
          else
            begin
              reg202 <= ($unsigned((^~$signed(reg205))) || ({$signed($unsigned(wire194))} ?
                  (($signed(reg207) >>> (8'ha8)) + {(wire194 ?
                          wire195 : reg208)}) : reg204));
              reg203 <= reg200;
              reg204 <= $unsigned(wire191[(3'h6):(3'h5)]);
              reg205 <= reg206[(4'hd):(3'h7)];
              reg206 <= reg205;
            end
          reg207 <= wire195[(4'he):(3'h7)];
          reg208 <= {{$signed($signed(wire196)),
                  (reg209 ?
                      ((wire193 >= reg201) + ((8'h9c) ^ wire196)) : reg206)},
              (~($unsigned(reg204) <<< $unsigned(reg202[(4'hc):(3'h7)])))};
          if ({($signed($signed($unsigned(wire191))) <<< $signed($signed(reg204)))})
            begin
              reg209 <= $signed(reg209);
              reg210 <= (-$unsigned((|(~{wire191, reg210}))));
            end
          else
            begin
              reg209 <= {reg205};
              reg210 <= $unsigned($unsigned($signed(((^~wire197) ^~ (&(8'ha9))))));
            end
          reg211 <= (|(~$signed($signed(reg201))));
        end
      if ($unsigned({reg208[(3'h4):(2'h2)]}))
        begin
          if ((wire191[(1'h0):(1'h0)] ? reg203[(3'h5):(2'h3)] : (7'h42)))
            begin
              reg212 <= $signed((|(({wire193, (8'ha7)} ?
                  $signed((8'h9f)) : $signed(reg200)) > (7'h41))));
            end
          else
            begin
              reg212 <= {wire196,
                  (wire192 ~^ ((8'had) >> $signed({(7'h42), wire193})))};
              reg213 <= (reg205 << reg206[(4'hc):(4'h8)]);
              reg214 <= reg205;
              reg215 <= $signed({reg199[(4'ha):(2'h2)],
                  $unsigned((wire194 ?
                      $signed(wire194) : wire196[(2'h3):(2'h3)]))});
            end
          reg216 <= ({(($signed(reg211) ~^ (wire196 <= (7'h40))) ?
                  ($signed(wire191) ?
                      $unsigned(reg205) : (reg201 ?
                          wire196 : wire193)) : $unsigned((reg215 ^ reg210))),
              $signed((reg210 ?
                  (reg201 + reg207) : (&reg207)))} || $unsigned((wire193[(4'hf):(4'h9)] ?
              {((7'h44) ? wire195 : wire198)} : $signed(reg207))));
          reg217 <= wire197;
          reg218 <= reg210[(4'h9):(4'h8)];
        end
      else
        begin
          if ($signed((reg212 ~^ (reg214 ?
              ($signed(reg202) <<< {reg200}) : ($signed(wire195) ?
                  $signed((8'hb4)) : reg207)))))
            begin
              reg212 <= $signed(reg209[(4'hc):(3'h6)]);
              reg213 <= (((8'hb5) >> (($signed(reg216) ?
                      reg216 : (^(8'hb3))) < $signed(reg200))) ?
                  reg205 : (+$unsigned({reg216})));
              reg214 <= $unsigned($unsigned($signed((&$unsigned(reg202)))));
              reg215 <= wire196[(3'h4):(2'h3)];
              reg216 <= reg199[(4'hc):(2'h2)];
            end
          else
            begin
              reg212 <= reg207;
              reg213 <= $unsigned((&$signed($signed($signed(reg207)))));
              reg214 <= reg206[(4'hd):(4'h8)];
              reg215 <= reg207;
              reg216 <= wire193;
            end
        end
    end
  assign wire219 = (reg210 ?
                       $unsigned((!reg212)) : ($unsigned(wire196) ?
                           wire195 : $unsigned((~^$signed(reg216)))));
  assign wire220 = wire219[(4'hf):(3'h6)];
  assign wire221 = reg218;
  always
    @(posedge clk) begin
      if ($unsigned((($unsigned({(8'haa), reg216}) - ({wire195} ?
              $unsigned(reg202) : (~wire197))) ?
          ($unsigned((8'ha0)) ?
              ($signed(reg215) ^ $signed(wire197)) : reg202[(4'he):(2'h3)]) : reg204)))
        begin
          reg222 <= (^~(|reg218[(3'h7):(1'h0)]));
          reg223 <= (~|(8'hb0));
          reg224 <= (($signed($signed(reg204)) + ({{wire196}} ?
                  {reg203[(3'h4):(2'h3)]} : (~$signed(reg217)))) ?
              reg200 : (($unsigned($signed(wire220)) ?
                      $signed((reg199 ^~ reg208)) : ((reg212 ?
                          reg206 : reg208) + $unsigned((7'h44)))) ?
                  (({reg215, wire197} ?
                      $unsigned(reg205) : {wire219}) >= (reg202[(4'hf):(4'h9)] < {reg211})) : (reg216[(2'h3):(2'h3)] ?
                      $unsigned((reg213 ? reg214 : (7'h41))) : {$signed(reg200),
                          $unsigned(wire192)})));
          reg225 <= ($signed(wire192[(4'hc):(2'h3)]) ?
              ($unsigned(wire192[(4'ha):(4'h8)]) && $unsigned(reg224)) : $unsigned({reg223,
                  reg206}));
        end
      else
        begin
          if (wire196[(4'h8):(3'h6)])
            begin
              reg222 <= ({{(reg215[(2'h2):(1'h0)] || (^~reg217))},
                  wire221[(3'h7):(1'h0)]} - wire220);
              reg223 <= (~|reg213);
              reg224 <= reg214;
              reg225 <= (reg207 ?
                  $signed($unsigned((wire219 * (^~reg200)))) : $signed((8'ha4)));
            end
          else
            begin
              reg222 <= ($unsigned(reg201) != $unsigned((reg224 * $signed((~(8'hb1))))));
              reg223 <= reg209;
            end
          if ($signed((reg206 ? {$unsigned($unsigned(wire198))} : reg209)))
            begin
              reg226 <= (($signed($unsigned($unsigned(wire192))) ?
                      reg215 : ((reg217[(2'h3):(2'h3)] ?
                          reg207[(4'hc):(1'h1)] : (^~wire196)) && reg206[(3'h7):(3'h4)])) ?
                  (+$unsigned(wire221)) : ({{$signed(wire197),
                          $signed(wire196)}} << (reg199[(4'h9):(4'h8)] ?
                      ((reg225 ? reg224 : reg223) ?
                          $signed(reg200) : $signed((8'hbe))) : $signed({(8'ha7),
                          wire220}))));
              reg227 <= {(wire197[(4'ha):(3'h4)] ~^ {$unsigned((reg216 > (8'h9c)))})};
              reg228 <= (^{(-((^~reg225) < (reg218 - wire219))),
                  $signed(reg227)});
            end
          else
            begin
              reg226 <= (^~(~(+((reg212 != wire193) - reg209))));
              reg227 <= wire192;
              reg228 <= reg200[(1'h0):(1'h0)];
              reg229 <= ({$signed(({wire193} && (reg209 ? wire219 : wire196))),
                      reg226[(1'h1):(1'h0)]} ?
                  (($signed((+reg218)) * ({reg206} ?
                      (~^wire221) : reg210)) >= wire191[(3'h4):(1'h1)]) : (+($unsigned((reg200 ?
                          reg209 : wire221)) ?
                      reg210[(2'h2):(1'h0)] : {wire193, (~|wire197)})));
            end
        end
      reg230 <= wire198;
      reg231 <= reg228;
    end
  assign wire232 = (((~&((reg229 >= reg207) ?
                           $unsigned((8'hb3)) : (^~(8'hbe)))) ?
                       (~^($signed(reg227) ?
                           wire191[(1'h0):(1'h0)] : (reg207 ?
                               (8'hbf) : reg199))) : (wire220 > (&(8'ha4)))) ~^ reg206);
  assign wire233 = ((8'hbe) != reg229);
  assign wire234 = $signed(($unsigned({(wire220 & reg218),
                       (reg212 ^~ reg217)}) > (~&$unsigned(wire198))));
  assign wire235 = ((($signed((-(7'h41))) >>> ((reg210 ? reg206 : reg205) ?
                       (reg203 ?
                           reg203 : reg215) : reg200)) ^ (((~reg226) || reg224[(3'h4):(2'h3)]) ?
                       (reg213[(4'hb):(3'h4)] >> (reg223 * reg222)) : $signed($unsigned(reg199)))) ^~ (-(8'had)));
  assign wire236 = {($unsigned((reg203[(3'h5):(3'h4)] != (&reg200))) < $unsigned($unsigned((^wire195)))),
                       {reg225}};
endmodule

module module151
#(parameter param183 = ({(^(((8'hae) <<< (8'ha6)) << (-(8'hb3)))), (8'ha5)} ? ({(-(~(8'hb4))), ((~^(8'hb4)) == {(8'h9e), (8'hb0)})} ? ((~|((8'hac) > (8'h9e))) < (((7'h40) + (8'hba)) ? ((8'ha0) >>> (8'ha7)) : ((8'hba) ? (8'hb9) : (8'hbd)))) : ((((8'ha6) || (8'hb0)) ? ((8'hac) + (8'hb4)) : {(8'hbe), (8'h9c)}) << {(8'hbf)})) : (~^((~^((7'h44) && (8'hb4))) ? (((8'haf) >>> (8'hb1)) ? {(8'hac), (8'hbd)} : ((8'hbc) < (8'hb3))) : {(|(7'h44)), ((7'h41) & (8'hb2))}))))
(y, clk, wire155, wire154, wire153, wire152);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire155;
  input wire signed [(4'h8):(1'h0)] wire154;
  input wire [(4'he):(1'h0)] wire153;
  input wire signed [(4'hd):(1'h0)] wire152;
  wire signed [(4'hf):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire180;
  wire signed [(4'hb):(1'h0)] wire179;
  wire [(4'ha):(1'h0)] wire178;
  wire signed [(5'h13):(1'h0)] wire177;
  wire signed [(5'h14):(1'h0)] wire176;
  wire [(5'h15):(1'h0)] wire175;
  wire signed [(2'h3):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire173;
  wire signed [(5'h14):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire165;
  wire [(5'h10):(1'h0)] wire164;
  wire [(4'ha):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire signed [(3'h4):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire158;
  wire [(4'ha):(1'h0)] wire157;
  wire signed [(5'h10):(1'h0)] wire156;
  reg [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(5'h14):(1'h0)] reg169 = (1'h0);
  reg [(2'h2):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire156 = (^{$signed((|wire154)),
                       ((~&wire152[(4'hc):(4'ha)]) ?
                           $signed($unsigned((8'h9f))) : $unsigned({(8'ha8),
                               wire155}))});
  assign wire157 = wire152;
  assign wire158 = $unsigned(($unsigned(wire155[(3'h5):(3'h4)]) <= ($unsigned(wire154[(4'h8):(3'h5)]) >= (!wire155))));
  assign wire159 = (wire158[(4'h9):(3'h4)] ?
                       wire156 : (&$signed(wire155[(3'h7):(3'h5)])));
  assign wire160 = (~$signed(($signed((8'hb0)) ?
                       $unsigned(((8'had) ?
                           wire154 : wire156)) : wire152[(1'h0):(1'h0)])));
  assign wire161 = (7'h44);
  assign wire162 = (((($unsigned(wire157) ? (^(8'hba)) : $unsigned(wire155)) ?
                           ($signed(wire153) ?
                               (^(8'hb5)) : ((8'ha8) ?
                                   wire157 : wire159)) : ((-wire154) & wire154)) ?
                       (+wire159) : wire159) >> wire156);
  assign wire163 = (wire153 ? wire157 : ((wire152 + wire159) <<< wire152));
  assign wire164 = wire154;
  assign wire165 = $unsigned({(wire161[(4'hd):(4'hc)] ?
                           (wire155[(4'hc):(4'h8)] ^~ $unsigned((8'ha3))) : (~wire159[(1'h0):(1'h0)])),
                       wire153[(4'he):(4'h9)]});
  assign wire166 = (!{((wire153[(4'hd):(4'hb)] || wire153[(2'h3):(2'h3)]) ~^ ({wire152} ?
                           $signed(wire165) : wire155))});
  always
    @(posedge clk) begin
      reg167 <= $signed(({(wire161 ^~ (wire159 ? (8'ha1) : wire157))} ?
          wire157[(3'h7):(2'h2)] : wire155));
      if ((&(+{($unsigned(wire163) >> {(8'hb2)}), (~|$signed(wire161))})))
        begin
          reg168 <= $unsigned(((wire161[(3'h6):(3'h6)] >>> wire156[(4'hb):(3'h7)]) >= (((~wire152) + wire152[(1'h0):(1'h0)]) <<< {(wire162 <= wire163)})));
        end
      else
        begin
          reg168 <= ((+(wire158 < wire152[(3'h6):(3'h4)])) ?
              wire164[(3'h6):(1'h0)] : reg167[(2'h3):(2'h3)]);
          if ((+$unsigned(reg168[(1'h1):(1'h1)])))
            begin
              reg169 <= $signed((+($unsigned($unsigned(wire155)) * {wire152,
                  {(8'hb8)}})));
            end
          else
            begin
              reg169 <= (~^(-{$signed((wire154 * (8'ha9)))}));
              reg170 <= wire166;
            end
        end
      reg171 <= $unsigned((~&$signed($signed((reg168 == wire154)))));
      reg172 <= $unsigned($signed($signed(((reg171 > wire163) ?
          $unsigned(wire162) : reg168))));
    end
  assign wire173 = (^(!{wire156}));
  assign wire174 = $unsigned(reg170);
  assign wire175 = $signed($signed((wire174 ?
                       (8'ha4) : {(reg169 ? wire155 : wire160),
                           reg171[(2'h2):(1'h0)]})));
  assign wire176 = wire162[(4'h9):(2'h3)];
  assign wire177 = $signed((((-(reg167 ? (8'ha7) : wire176)) ~^ wire152) ?
                       wire156[(4'ha):(4'h9)] : $signed(wire156[(1'h0):(1'h0)])));
  assign wire178 = ($signed(wire160) - (^~wire160));
  assign wire179 = ({wire165} ? (7'h44) : (~^wire162));
  assign wire180 = (($unsigned((~^$signed(wire153))) != $signed((^$signed(wire162)))) & ((wire155[(5'h14):(3'h7)] ?
                       ((~|reg171) ?
                           wire174[(2'h2):(2'h2)] : reg170[(4'ha):(3'h6)]) : reg172) * $unsigned(((^~reg171) ?
                       reg169 : wire159))));
  assign wire181 = (!$signed(reg168[(2'h2):(1'h0)]));
  assign wire182 = $unsigned((^~$unsigned(({wire153, wire152} ?
                       (wire166 ? wire159 : (8'ha6)) : wire174))));
endmodule
