module top
#(parameter param233 = ({(((~|(8'hae)) >> ((8'hb2) ? (8'had) : (8'hae))) == {{(8'ha4), (8'hb1)}})} ^~ {{{((8'h9d) == (7'h42))}}}), 
parameter param234 = param233)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h23e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire232;
  wire [(4'ha):(1'h0)] wire231;
  wire signed [(3'h6):(1'h0)] wire230;
  wire [(5'h12):(1'h0)] wire229;
  wire signed [(5'h10):(1'h0)] wire228;
  wire [(5'h14):(1'h0)] wire201;
  wire signed [(5'h12):(1'h0)] wire200;
  wire signed [(5'h13):(1'h0)] wire199;
  wire [(4'hc):(1'h0)] wire187;
  wire signed [(5'h11):(1'h0)] wire186;
  wire signed [(3'h4):(1'h0)] wire184;
  reg signed [(4'h9):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg226 = (1'h0);
  reg [(4'h8):(1'h0)] reg225 = (1'h0);
  reg [(3'h5):(1'h0)] reg224 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg222 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg221 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg220 = (1'h0);
  reg [(5'h14):(1'h0)] reg219 = (1'h0);
  reg [(4'h9):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg217 = (1'h0);
  reg [(4'he):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg215 = (1'h0);
  reg [(4'hd):(1'h0)] reg214 = (1'h0);
  reg [(3'h4):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg212 = (1'h0);
  reg [(5'h13):(1'h0)] reg211 = (1'h0);
  reg [(3'h7):(1'h0)] reg210 = (1'h0);
  reg [(3'h5):(1'h0)] reg209 = (1'h0);
  reg [(5'h11):(1'h0)] reg208 = (1'h0);
  reg [(5'h11):(1'h0)] reg207 = (1'h0);
  reg [(4'ha):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg205 = (1'h0);
  reg [(4'ha):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg202 = (1'h0);
  reg [(5'h11):(1'h0)] reg198 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg195 = (1'h0);
  reg [(5'h13):(1'h0)] reg194 = (1'h0);
  reg [(2'h2):(1'h0)] reg193 = (1'h0);
  reg [(4'hc):(1'h0)] reg192 = (1'h0);
  reg [(4'he):(1'h0)] reg191 = (1'h0);
  reg [(3'h7):(1'h0)] reg190 = (1'h0);
  reg [(4'hc):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg188 = (1'h0);
  assign y = {wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire201,
                 wire200,
                 wire199,
                 wire187,
                 wire186,
                 wire184,
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
                 (1'h0)};
  module5 #() modinst185 (wire184, clk, wire1, wire3, wire4, wire0, wire2);
  assign wire186 = wire3[(3'h4):(2'h2)];
  assign wire187 = (((((wire4 << (8'had)) ~^ $unsigned(wire3)) >>> wire4) ?
                           wire1[(4'hc):(4'h9)] : $signed($signed($signed(wire4)))) ?
                       (~$signed(($unsigned(wire3) == (~wire186)))) : ({(+wire186)} || {((~^wire1) < $signed(wire2)),
                           wire2[(4'hd):(4'h9)]}));
  always
    @(posedge clk) begin
      if (wire184)
        begin
          reg188 <= wire2;
          reg189 <= $signed(wire187[(4'hc):(4'h9)]);
          reg190 <= (({({wire187, wire1} * ((8'hbf) << wire186))} ?
              $unsigned($unsigned((~wire4))) : {(^(|wire1))}) || $unsigned((wire187 ?
              $unsigned(wire2[(2'h3):(1'h0)]) : (8'hb8))));
          reg191 <= $signed(({(~(wire186 ? wire1 : wire187)),
                  $signed((wire186 ? wire1 : wire186))} ?
              wire187 : {$unsigned(wire3[(3'h4):(1'h0)])}));
          reg192 <= ((^~{wire186, reg191}) * wire187);
        end
      else
        begin
          reg188 <= $unsigned(wire4[(4'h9):(1'h1)]);
          if ($signed((wire187[(3'h5):(2'h2)] && (reg190[(3'h4):(1'h0)] <<< $signed(wire187)))))
            begin
              reg189 <= (|{wire184});
              reg190 <= ({$signed({wire0[(2'h3):(2'h2)],
                      (wire3 ? reg189 : wire1)})} + wire1[(4'ha):(3'h5)]);
            end
          else
            begin
              reg189 <= ($unsigned((($signed(reg188) < (~|wire1)) ?
                      wire3[(2'h3):(1'h0)] : (~^(~wire2)))) ?
                  (~&((+((8'hb5) ? wire186 : (8'hb9))) & $signed((reg191 ?
                      reg192 : reg190)))) : ($signed({(wire186 & reg188)}) | (^~$signed((-wire187)))));
              reg190 <= wire184[(2'h2):(1'h0)];
              reg191 <= wire2;
            end
          if ($unsigned((8'hbb)))
            begin
              reg192 <= $unsigned({(wire3[(4'h8):(3'h4)] ?
                      ((8'hac) << (reg192 > wire1)) : reg190),
                  $unsigned(reg192[(1'h1):(1'h0)])});
              reg193 <= ((reg192[(1'h1):(1'h0)] && ($unsigned($unsigned(reg190)) ?
                      reg191 : wire184[(3'h4):(2'h3)])) ?
                  $signed((wire4 ?
                      $signed((wire186 | (8'hb4))) : ((-reg191) ?
                          $unsigned(reg188) : (8'hb5)))) : (wire186[(3'h5):(1'h1)] != ((~$unsigned(reg191)) || {$unsigned(wire186)})));
              reg194 <= (~^$unsigned((((8'haa) ? wire3 : (8'ha1)) ?
                  wire186[(2'h3):(2'h3)] : (+(wire4 + (8'ha4))))));
              reg195 <= (|($signed(wire3) ?
                  (&wire3) : ($unsigned({wire4}) ?
                      ((+reg190) ?
                          (reg193 >= reg191) : $signed(reg190)) : (wire184 ?
                          (~wire0) : wire0))));
              reg196 <= reg191[(4'h9):(2'h3)];
            end
          else
            begin
              reg192 <= ($signed($signed($signed(reg188[(1'h0):(1'h0)]))) != (^(^wire2[(3'h6):(3'h5)])));
            end
          reg197 <= wire1[(4'h9):(3'h5)];
        end
      reg198 <= (~^wire3[(1'h1):(1'h0)]);
    end
  assign wire199 = (|$signed((8'h9c)));
  assign wire200 = wire186;
  assign wire201 = {$unsigned({{wire3[(3'h4):(3'h4)], {(8'hac), (8'had)}},
                           (~reg188[(4'h9):(2'h2)])}),
                       ($signed($unsigned((wire2 << wire4))) & $unsigned(wire187))};
  always
    @(posedge clk) begin
      reg202 <= $unsigned(((((wire1 < reg188) >>> (wire187 & (7'h44))) ?
          (^$unsigned(reg192)) : reg188[(1'h1):(1'h0)]) + ($signed(wire187) << $signed((wire2 <= wire201)))));
      if ((~wire0))
        begin
          if ((+reg202[(1'h1):(1'h0)]))
            begin
              reg203 <= (reg202[(1'h1):(1'h1)] ?
                  wire184 : $signed(reg195[(2'h3):(1'h0)]));
              reg204 <= (+$signed(wire2[(2'h3):(2'h2)]));
              reg205 <= (wire199 ^ $unsigned((8'haf)));
              reg206 <= $signed(($signed($signed({reg203, reg190})) ?
                  (~&$signed((reg205 <<< reg198))) : $signed(((reg191 ?
                      reg189 : (8'hbe)) - (wire0 ^~ reg190)))));
              reg207 <= wire199[(4'hc):(3'h4)];
            end
          else
            begin
              reg203 <= wire186[(4'h9):(1'h1)];
            end
          reg208 <= {$unsigned(reg197), (reg202 & $signed(reg193))};
          if ($signed($signed({(wire200[(2'h2):(1'h0)] ?
                  $unsigned(reg207) : $unsigned(reg196)),
              (-(reg189 ? wire1 : wire4))})))
            begin
              reg209 <= (+$unsigned($signed(({reg197, wire201} ?
                  $unsigned((8'hb7)) : (reg208 * reg193)))));
            end
          else
            begin
              reg209 <= wire3[(1'h0):(1'h0)];
              reg210 <= $signed(reg204[(3'h4):(2'h2)]);
              reg211 <= reg210;
            end
          reg212 <= $unsigned(reg198[(4'hf):(1'h1)]);
        end
      else
        begin
          reg203 <= ((&((8'hb0) ^ (~^{wire200, reg202}))) << $unsigned({reg193,
              $signed((reg202 ? reg189 : wire201))}));
          reg204 <= (&$unsigned($signed($unsigned($signed(wire3)))));
          reg205 <= ($signed((&$unsigned(reg188))) | {((!{reg202, reg188}) ?
                  ((reg193 * wire2) >= (^reg197)) : $signed({reg195, reg206})),
              reg211});
          if ($signed(($unsigned(wire184) ^~ $unsigned($signed(reg211)))))
            begin
              reg206 <= reg193;
              reg207 <= $signed(((wire184[(3'h4):(2'h2)] - $unsigned((~|(7'h40)))) - ((reg198[(3'h5):(2'h3)] + ((8'ha0) ?
                      reg195 : wire200)) ?
                  reg189[(4'h8):(3'h5)] : reg197[(3'h7):(2'h3)])));
              reg208 <= $unsigned((reg194 ?
                  $signed(reg204[(3'h4):(1'h0)]) : $unsigned((~|$signed(reg192)))));
              reg209 <= (wire199[(4'ha):(1'h0)] + (({((7'h40) & reg211),
                      wire0} ^~ $signed(((8'hba) ? reg195 : reg205))) ?
                  $signed({$signed(reg194), reg197}) : ({(~^wire3),
                          (~|reg194)} ?
                      {((8'hb0) && (8'ha4)),
                          $signed(reg195)} : (!$unsigned(reg206)))));
            end
          else
            begin
              reg206 <= $unsigned((reg198 && reg206));
              reg207 <= (($unsigned(((8'hbf) ?
                      ((8'haf) ? (8'hbd) : (8'hb3)) : ((8'hae) ?
                          reg194 : wire1))) <= (+wire199)) ?
                  $signed(wire200) : $signed(wire201[(4'hd):(4'ha)]));
              reg208 <= $unsigned($signed($signed($unsigned(wire200[(4'ha):(1'h0)]))));
              reg209 <= wire4[(3'h4):(2'h2)];
            end
        end
      if (($signed($unsigned(($signed(reg209) << (~reg206)))) ?
          (reg212 ?
              $signed((!reg189[(1'h0):(1'h0)])) : $unsigned($signed($signed(reg205)))) : $unsigned($unsigned((8'h9e)))))
        begin
          if ({((((~&(8'hbd)) && reg206[(4'ha):(4'ha)]) * wire199) ?
                  $unsigned(((reg193 ?
                      wire186 : reg202) < (wire1 ^ (7'h43)))) : (wire0[(3'h4):(1'h0)] ?
                      $signed($signed(reg194)) : reg189[(4'hb):(3'h6)]))})
            begin
              reg213 <= (reg198[(4'hc):(1'h1)] ?
                  reg204[(1'h0):(1'h0)] : {reg207[(3'h5):(2'h2)],
                      $signed($signed((reg194 < wire199)))});
              reg214 <= ($unsigned($signed((8'hae))) ?
                  (-reg190) : $signed(((reg191 - (reg193 ? reg191 : (8'hab))) ?
                      reg205 : ({reg194} ?
                          (reg189 ? reg208 : reg198) : wire199))));
            end
          else
            begin
              reg213 <= (^~((~^((reg189 > reg209) ^ (~^wire184))) && ($unsigned((wire201 ?
                  (8'had) : wire199)) >= (!(reg210 - (8'ha3))))));
              reg214 <= reg212;
              reg215 <= ((reg202 - reg206[(3'h7):(3'h5)]) >> (~^((reg189 ?
                      (!wire186) : $signed(reg213)) ?
                  (wire199 ? wire3 : (wire184 != (8'ha5))) : reg193)));
              reg216 <= (wire2 ?
                  wire201 : ((reg195 ?
                          (^wire0) : ((wire201 ? reg190 : reg215) ?
                              $signed(reg206) : $unsigned(reg211))) ?
                      (reg195 && $signed(((8'hb3) ?
                          reg205 : (8'ha1)))) : (-reg206)));
            end
          reg217 <= ({reg202[(1'h1):(1'h0)]} ?
              (~&$unsigned($unsigned($signed(wire199)))) : $signed($unsigned($unsigned($signed(wire187)))));
          reg218 <= $unsigned(((~|$unsigned((&wire184))) ?
              reg208 : $unsigned(((8'ha3) ?
                  (wire4 ^~ wire2) : (reg197 - reg211)))));
        end
      else
        begin
          if (reg196[(3'h7):(2'h3)])
            begin
              reg213 <= $signed(reg212);
              reg214 <= (~|((8'ha0) ?
                  {((reg207 * reg203) >= (wire200 ?
                          wire187 : reg205))} : reg217));
              reg215 <= $signed(wire187);
            end
          else
            begin
              reg213 <= (wire2[(4'h9):(3'h5)] ?
                  $signed(($unsigned((^reg189)) != (!wire199[(4'hc):(2'h3)]))) : $unsigned($signed(((^~reg207) ?
                      $unsigned(reg210) : $unsigned(wire201)))));
              reg214 <= $signed((^~$unsigned({(|reg205), $unsigned(reg213)})));
              reg215 <= (~^$signed(reg209));
              reg216 <= $unsigned(((((|wire201) >> $unsigned(reg205)) | $signed({wire2})) & $unsigned($unsigned((wire200 ?
                  reg195 : wire4)))));
              reg217 <= ((8'hbd) ?
                  $unsigned($signed((~((8'h9f) ? (7'h44) : reg192)))) : reg189);
            end
          if ($signed($unsigned(reg195[(1'h0):(1'h0)])))
            begin
              reg218 <= $unsigned($signed($unsigned((wire187 ?
                  reg195[(4'h9):(4'h8)] : $signed(reg218)))));
              reg219 <= reg209;
              reg220 <= {$unsigned({(~|$signed(reg203))})};
              reg221 <= wire1[(3'h7):(2'h2)];
            end
          else
            begin
              reg218 <= $signed(wire186[(2'h2):(1'h0)]);
              reg219 <= ($unsigned($unsigned(wire187)) ?
                  reg190 : (reg217[(3'h7):(3'h4)] && (|reg205[(2'h2):(1'h1)])));
              reg220 <= (-($signed(reg207) && (-($unsigned(reg215) ?
                  (^reg210) : (wire2 ? (8'hac) : (8'ha8))))));
              reg221 <= (&($unsigned({{reg219},
                  wire2[(4'ha):(3'h7)]}) && ((reg210 ?
                  (reg196 ? wire201 : reg219) : {(8'hbe),
                      wire186}) == (reg204 <<< reg209))));
              reg222 <= (((^~reg214) ?
                  $unsigned((!reg198)) : (((~wire187) ?
                          $signed((8'hb7)) : reg203) ?
                      reg205 : {$unsigned((8'hba))})) <= (~&{$signed((~&reg213)),
                  ((reg198 << reg215) >= reg218)}));
            end
          reg223 <= $signed((wire199 + $unsigned((^~(~&reg218)))));
        end
      reg224 <= (wire1[(4'hf):(4'h8)] ?
          wire199[(5'h11):(3'h7)] : wire186[(4'ha):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg225 <= reg191;
      reg226 <= $signed(($unsigned(((reg217 < wire0) >> {wire199, (8'had)})) ?
          $signed(((-reg212) == (reg196 ?
              (8'had) : reg188))) : $signed((reg219[(3'h4):(2'h3)] ?
              $signed(wire3) : (reg216 ? wire200 : reg203)))));
      reg227 <= {reg191};
    end
  assign wire228 = reg227[(4'h9):(4'h8)];
  assign wire229 = ($signed(reg193[(2'h2):(1'h1)]) ?
                       $unsigned(reg208) : reg226);
  assign wire230 = $unsigned($unsigned((($signed(reg216) ?
                           reg217[(3'h5):(2'h2)] : wire0) ?
                       reg202[(1'h0):(1'h0)] : reg222)));
  assign wire231 = reg218;
  assign wire232 = reg225;
endmodule

module module5
#(parameter param183 = ({(~^(((8'ha1) < (8'h9d)) ~^ {(8'h9c), (8'ha3)})), ((8'ha4) ? (((8'h9e) >= (8'hb1)) ? ((8'ha1) ? (8'hb1) : (7'h41)) : ((8'hae) >>> (8'hb5))) : (((8'hb4) ? (8'ha4) : (8'hac)) | ((8'hba) ? (8'ha5) : (8'hb3))))} ? ((((8'ha4) | {(8'h9d), (8'ha9)}) ? (((8'hb9) ? (8'hb7) : (8'ha5)) ? (~(8'hab)) : {(8'hb4), (8'hb8)}) : (^(~(8'hbb)))) ? {(^~{(8'ha5)})} : ({((7'h40) ? (8'hbb) : (8'hbd))} != {(^~(8'hb9)), (&(7'h40))})) : (8'h9e)))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h41f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire182;
  wire signed [(4'ha):(1'h0)] wire181;
  wire [(3'h7):(1'h0)] wire180;
  wire [(3'h7):(1'h0)] wire179;
  wire [(4'hd):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire163;
  wire [(3'h4):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire161;
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  reg [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  reg [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg169 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire164,
                 wire163,
                 wire111,
                 wire75,
                 wire74,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire113,
                 wire114,
                 wire115,
                 wire116,
                 wire161,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg45,
                 reg44,
                 reg43,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((wire7 ?
          $unsigned((wire8 >>> $signed(wire9))) : ($unsigned((wire9 < (8'hb5))) > $signed((wire6 ^ wire6))))))
        begin
          reg11 <= wire8;
          reg12 <= {{(wire9 ? (+((8'had) ~^ (8'ha6))) : $signed({wire10}))}};
          if ((~^wire8[(1'h0):(1'h0)]))
            begin
              reg13 <= wire8[(3'h7):(3'h5)];
              reg14 <= {((wire8[(1'h1):(1'h1)] ~^ (^(&wire8))) >> (({reg11,
                          wire8} ^~ (reg11 * wire10)) ?
                      {(~&wire7), (reg12 ? reg12 : (8'hb4))} : {(~|wire9)}))};
            end
          else
            begin
              reg13 <= (((({wire10} ?
                          (reg12 ? (8'ha5) : wire8) : {reg12, wire10}) ?
                      {((8'hab) << reg11)} : $signed({reg11})) ~^ (+$signed(wire9[(1'h0):(1'h0)]))) ?
                  $signed(wire6) : wire8[(3'h4):(2'h3)]);
              reg14 <= (+(+(8'h9c)));
              reg15 <= wire9;
              reg16 <= (&reg12[(4'hf):(4'h8)]);
              reg17 <= wire8[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg11 <= reg13[(4'hf):(4'h9)];
          reg12 <= reg15[(3'h7):(3'h7)];
          if ($signed($signed((8'ha9))))
            begin
              reg13 <= $unsigned((wire7 | (~^({reg13} ^~ (reg11 ?
                  (8'ha3) : reg11)))));
              reg14 <= ($unsigned({$signed(((8'ha0) ? reg11 : reg15)),
                      (wire7 || $signed(wire8))}) ?
                  wire7[(5'h12):(3'h6)] : (-(+wire10[(4'h9):(4'h9)])));
              reg15 <= $signed(reg13[(4'hf):(3'h5)]);
              reg16 <= (&((~(wire10 ? $unsigned(reg13) : (reg11 << reg13))) ?
                  (~&(~reg14[(2'h3):(2'h2)])) : wire10));
            end
          else
            begin
              reg13 <= $unsigned({(~&($signed(reg13) ?
                      (~^wire7) : reg12[(5'h11):(4'hf)]))});
              reg14 <= $signed(reg17);
            end
          reg17 <= $unsigned((({reg16[(3'h4):(2'h3)], reg16[(3'h5):(2'h3)]} ?
              (wire10 || wire8[(2'h3):(1'h0)]) : wire8[(1'h0):(1'h0)]) ^ ((reg13[(3'h6):(3'h6)] ?
                  $signed(reg16) : $signed((8'ha0))) ?
              $signed(reg12) : reg15[(4'h8):(2'h2)])));
          reg18 <= reg15[(1'h0):(1'h0)];
        end
      if ($unsigned(reg16[(3'h5):(2'h2)]))
        begin
          reg19 <= reg15[(3'h6):(2'h3)];
          reg20 <= $signed({(((~&reg16) ?
                      (reg13 ? wire7 : reg11) : $signed(reg13)) ?
                  (~&wire10[(3'h6):(2'h2)]) : {reg19, $unsigned(reg13)})});
          reg21 <= ({(|$unsigned((reg19 ? wire10 : reg16)))} ?
              (^reg12[(3'h5):(2'h2)]) : reg17);
          reg22 <= reg11;
        end
      else
        begin
          reg19 <= (!(&reg14[(1'h1):(1'h0)]));
          if (((^(((&reg17) ^ (~reg15)) + (~|$unsigned(reg12)))) ?
              (~|{$signed({reg11})}) : (reg17[(2'h3):(2'h2)] ?
                  reg18 : wire9[(1'h1):(1'h0)])))
            begin
              reg20 <= reg13;
              reg21 <= reg22;
              reg22 <= ((~&$signed({reg18[(3'h4):(1'h1)],
                      reg18[(1'h0):(1'h0)]})) ?
                  $unsigned(($signed($signed(reg17)) ?
                      $unsigned((reg14 || (7'h42))) : $unsigned({(8'hbb),
                          (7'h42)}))) : (-{(-((8'hac) & reg22)), wire6}));
              reg23 <= $unsigned(wire10[(4'h9):(3'h6)]);
            end
          else
            begin
              reg20 <= ($unsigned(reg11) >= ({reg11[(2'h2):(2'h2)]} != (((wire10 >> reg14) ?
                      $unsigned(reg18) : (reg11 >>> reg22)) ?
                  ((^(8'h9d)) ?
                      (8'hb3) : (reg16 ^~ reg18)) : (((8'hb9) + (7'h42)) ?
                      reg12 : wire6))));
              reg21 <= (~^$signed((^~reg19)));
              reg22 <= ((^$unsigned($signed((reg21 & reg14)))) ?
                  $unsigned(((^~$signed(wire7)) ?
                      ((reg18 ? reg23 : reg17) ?
                          (~|reg21) : $unsigned(reg20)) : (reg13 < {reg16}))) : $unsigned(({(^reg20),
                          (reg11 ? reg21 : reg19)} ?
                      reg14 : $unsigned($signed(reg15)))));
              reg23 <= $signed($unsigned(wire8[(3'h4):(3'h4)]));
              reg24 <= $unsigned(reg18[(1'h1):(1'h0)]);
            end
        end
      if ((($unsigned(wire10[(3'h6):(3'h6)]) ?
              ($signed(reg24[(3'h4):(3'h4)]) < {{wire6},
                  $unsigned(reg20)}) : $unsigned({reg12,
                  reg22[(2'h3):(1'h0)]})) ?
          (^~{(reg15 ? $unsigned((8'ha1)) : $signed(reg23)),
              ($unsigned(reg21) ?
                  reg11 : (reg14 ?
                      (8'ha1) : wire8))}) : (^~(wire6[(3'h7):(3'h7)] >>> $signed($unsigned(reg21))))))
        begin
          if ($unsigned($signed((8'ha7))))
            begin
              reg25 <= reg23;
            end
          else
            begin
              reg25 <= (reg16[(3'h7):(2'h2)] ?
                  (((wire7[(3'h5):(3'h4)] ? wire9[(1'h1):(1'h0)] : (-wire6)) ?
                      ((reg24 ?
                          reg17 : (8'h9e)) < (~(8'ha1))) : wire8) >>> (~&{(reg17 <<< wire7)})) : (&({$signed(wire10)} || {wire6[(3'h7):(3'h5)]})));
              reg26 <= wire9;
              reg27 <= reg12;
            end
          if ({((&((reg21 ? reg19 : reg19) > reg16)) ?
                  (reg16 ?
                      (&(reg22 ?
                          reg13 : reg18)) : $signed((~&reg11))) : ({$signed(reg24)} ?
                      $unsigned({reg25, (8'ha8)}) : {(8'hae),
                          $signed(reg27)}))})
            begin
              reg28 <= (reg24[(3'h6):(1'h0)] ~^ ((wire9 ?
                      (~^$signed(wire10)) : ((~|reg23) ?
                          wire9 : ((8'hb3) ? reg26 : (8'hb7)))) ?
                  ($unsigned((|reg23)) ?
                      reg19[(1'h0):(1'h0)] : reg12) : $unsigned((~^$signed(reg11)))));
              reg29 <= $unsigned((|reg27[(2'h2):(1'h0)]));
              reg30 <= $signed((^~(~&(!$signed(reg12)))));
              reg31 <= reg26;
              reg32 <= ({$unsigned(reg14[(2'h3):(1'h0)])} ?
                  (+($signed((!reg22)) | $signed((|reg13)))) : reg29);
            end
          else
            begin
              reg28 <= ($unsigned(reg11[(4'ha):(4'h8)]) ?
                  $unsigned($signed(($unsigned(wire7) ?
                      (wire8 ? reg16 : reg30) : {reg26,
                          reg19}))) : reg12[(3'h5):(2'h2)]);
              reg29 <= $signed(reg28[(2'h2):(2'h2)]);
              reg30 <= ((^(^$unsigned({reg24, reg15}))) ?
                  $unsigned((8'hbf)) : ((reg21 ?
                      $unsigned((|wire7)) : (|$unsigned(wire10))) ^~ (~|reg29[(2'h3):(1'h1)])));
            end
        end
      else
        begin
          if (reg13[(4'hf):(4'hf)])
            begin
              reg25 <= $unsigned(($signed($signed({(8'h9e), (8'hb7)})) ?
                  ((~$unsigned(reg19)) ?
                      wire9[(1'h1):(1'h1)] : $unsigned(reg20[(4'hb):(3'h6)])) : $unsigned(($unsigned(reg32) ^~ reg26[(1'h0):(1'h0)]))));
              reg26 <= $unsigned($signed((((+reg17) ?
                  {(8'ha7), reg16} : (reg21 ? (8'hbf) : reg22)) ~^ reg26)));
              reg27 <= reg16;
              reg28 <= wire8[(1'h0):(1'h0)];
              reg29 <= $signed((reg24 ^ $signed($unsigned(reg22[(4'h8):(4'h8)]))));
            end
          else
            begin
              reg25 <= (($unsigned((reg31 * reg27[(5'h11):(3'h4)])) ?
                      reg31 : $signed(reg19[(1'h1):(1'h1)])) ?
                  $signed((8'h9c)) : $unsigned(reg14));
              reg26 <= (+$unsigned(wire9[(1'h0):(1'h0)]));
            end
          if ((reg26[(1'h0):(1'h0)] >> ((~&(~&wire9[(1'h1):(1'h1)])) ?
              (8'hba) : reg25[(4'ha):(2'h2)])))
            begin
              reg30 <= reg17;
              reg31 <= (!($signed($signed(((8'ha9) | (8'hb2)))) ?
                  $unsigned(((reg27 ? reg22 : reg12) ?
                      (reg20 ?
                          reg28 : reg16) : ((8'ha6) ~^ reg24))) : ((~^((8'ha7) + (8'ha0))) ?
                      ((reg28 ? reg29 : reg16) ^~ ((8'hbb) ?
                          (8'ha6) : reg32)) : (~^reg19))));
              reg32 <= reg22;
            end
          else
            begin
              reg30 <= wire8;
              reg31 <= reg27[(3'h4):(3'h4)];
            end
          reg33 <= {(-(8'hba)),
              ((((-reg19) >= (reg15 ? reg18 : reg27)) <= reg20) | reg29)};
        end
      if ({reg11[(1'h1):(1'h1)]})
        begin
          if (reg19[(4'h9):(4'h8)])
            begin
              reg34 <= ((~^reg13[(2'h3):(1'h0)]) ?
                  (~|$unsigned(((~&reg21) < reg15))) : ($signed(reg23) | ($signed(reg28[(2'h2):(2'h2)]) >> $signed($signed(reg33)))));
              reg35 <= (8'hbc);
              reg36 <= (!$signed((((reg21 > reg12) ?
                  (~^reg33) : (|reg12)) | (reg23[(2'h2):(1'h1)] ?
                  $unsigned(reg20) : reg20[(4'ha):(2'h3)]))));
              reg37 <= reg32;
              reg38 <= (((reg15[(4'h8):(1'h0)] ?
                      $unsigned((wire9 ?
                          wire10 : (8'hb9))) : reg17[(1'h1):(1'h0)]) && ($signed(reg35) <= $unsigned(reg23))) ?
                  (^reg34[(2'h3):(2'h2)]) : {(reg21[(1'h0):(1'h0)] & (reg15[(4'h8):(3'h7)] ?
                          $signed(wire7) : $signed(reg28))),
                      (~&reg23)});
            end
          else
            begin
              reg34 <= wire8;
              reg35 <= reg13[(4'hb):(2'h3)];
              reg36 <= wire8[(4'h9):(3'h5)];
            end
          reg39 <= $signed((~^$unsigned(({reg25, reg11} <<< (reg33 ^ reg13)))));
          reg40 <= reg24[(3'h6):(1'h1)];
          if ((~^reg40))
            begin
              reg41 <= reg20;
              reg42 <= reg23;
              reg43 <= reg41[(4'he):(4'hc)];
              reg44 <= {$unsigned(($unsigned($signed(reg16)) ?
                      ($unsigned((8'hb4)) & (wire7 ?
                          reg20 : (8'h9f))) : (reg36[(3'h5):(3'h4)] ^ reg21[(2'h2):(1'h0)])))};
            end
          else
            begin
              reg41 <= (&$unsigned((~reg39[(2'h2):(1'h1)])));
            end
        end
      else
        begin
          if ((($signed(((reg23 ? (8'hbd) : (8'ha6)) ^~ {reg37,
              reg42})) >> $unsigned((+(reg20 ?
              reg29 : wire9)))) ^ {$unsigned(reg43[(1'h1):(1'h0)])}))
            begin
              reg34 <= {$unsigned(($unsigned({reg39}) <= {wire9,
                      (reg26 ? reg34 : wire9)}))};
              reg35 <= $signed((((+(reg41 > wire8)) ?
                      ((wire9 - wire10) || (~&reg23)) : (reg32 <<< reg16[(4'h8):(3'h5)])) ?
                  reg14 : (~reg25)));
              reg36 <= reg12;
              reg37 <= reg43[(3'h5):(3'h4)];
            end
          else
            begin
              reg34 <= ($signed(reg13) && reg40);
              reg35 <= {(+wire8), reg27[(2'h3):(2'h3)]};
              reg36 <= {reg11,
                  (&$unsigned({(reg24 ? (8'ha2) : reg16), reg29}))};
              reg37 <= {reg40,
                  {$signed($signed((reg38 ? reg28 : wire8))),
                      $unsigned({$signed(reg17), ((8'hbe) ? reg17 : reg32)})}};
              reg38 <= (reg29 >= $signed($signed((~^reg36[(1'h0):(1'h0)]))));
            end
          reg39 <= $unsigned($signed(reg40[(3'h4):(1'h0)]));
          reg40 <= $unsigned((reg12 ?
              $signed(reg12[(1'h0):(1'h0)]) : {($unsigned(reg14) && (reg34 ?
                      reg39 : (7'h41))),
                  (reg22[(1'h0):(1'h0)] ?
                      (wire7 ? wire7 : reg11) : reg13[(2'h3):(2'h2)])}));
          reg41 <= wire6[(3'h7):(1'h0)];
          reg42 <= reg11[(2'h3):(1'h0)];
        end
      reg45 <= reg22;
    end
  assign wire46 = $unsigned((|wire9[(2'h3):(1'h0)]));
  assign wire47 = $signed((~reg26[(1'h0):(1'h0)]));
  assign wire48 = (~(-(wire7 ?
                      $unsigned((reg34 ^~ reg41)) : $signed((~wire6)))));
  assign wire49 = reg44;
  always
    @(posedge clk) begin
      if ($signed($unsigned(reg12[(4'ha):(3'h4)])))
        begin
          if ((-$signed(reg22[(4'hb):(1'h0)])))
            begin
              reg50 <= (!reg19[(5'h14):(2'h2)]);
              reg51 <= ({reg45} ?
                  reg18 : $unsigned({$unsigned((wire46 ? wire7 : (8'hac))),
                      (+$signed(reg42))}));
            end
          else
            begin
              reg50 <= $unsigned(reg18);
              reg51 <= $unsigned(reg20[(3'h4):(3'h4)]);
            end
          reg52 <= (^$signed((~^(|(reg23 ^~ reg13)))));
          if ((&((((reg36 ?
              reg15 : wire47) < $unsigned(reg15)) * (!reg45)) ~^ (8'ha5))))
            begin
              reg53 <= $unsigned((~{(-$signed(reg50))}));
              reg54 <= ((($signed($unsigned(reg24)) ?
                          (~^(8'hb7)) : ($unsigned(reg19) | (reg25 ~^ reg41))) ?
                      ($unsigned($signed((8'ha6))) ?
                          reg16 : (-(-(8'hb3)))) : reg35[(3'h4):(2'h2)]) ?
                  ((7'h41) > (&$signed(reg31))) : (($unsigned((+wire6)) && $signed((8'hbb))) ?
                      reg24 : {reg35, {reg51}}));
              reg55 <= reg22;
            end
          else
            begin
              reg53 <= $unsigned((({$unsigned((8'ha4)), $unsigned(wire8)} ?
                  $signed((reg30 < (8'hb7))) : $signed((reg35 && reg32))) <= (reg15 ^~ wire9[(2'h2):(1'h0)])));
              reg54 <= $signed(($unsigned($signed((&reg38))) ?
                  reg54 : $signed(reg15[(2'h2):(2'h2)])));
              reg55 <= (reg28 ^~ $signed((reg23 ?
                  ($signed(reg34) << (reg52 ?
                      reg19 : reg27)) : $unsigned((&reg19)))));
              reg56 <= wire7;
            end
        end
      else
        begin
          if (reg24)
            begin
              reg50 <= $unsigned(reg52[(3'h5):(1'h1)]);
              reg51 <= $unsigned(wire8[(1'h0):(1'h0)]);
            end
          else
            begin
              reg50 <= (($unsigned(((reg42 - reg38) ?
                  $unsigned((8'hb8)) : (reg27 + reg34))) > reg41[(3'h4):(2'h3)]) <= $unsigned($signed($unsigned(((8'ha1) ?
                  reg35 : reg31)))));
              reg51 <= reg30;
              reg52 <= (wire46[(1'h1):(1'h0)] ^ $unsigned(reg13));
              reg53 <= reg34[(4'hc):(3'h7)];
              reg54 <= $unsigned(reg19[(3'h4):(1'h1)]);
            end
          if ((+(wire9[(1'h1):(1'h1)] >> $signed($unsigned({wire48,
              (7'h41)})))))
            begin
              reg55 <= reg56[(5'h11):(3'h5)];
              reg56 <= reg54[(1'h0):(1'h0)];
              reg57 <= (^~$signed($signed((reg16[(1'h1):(1'h1)] ~^ $signed(reg51)))));
              reg58 <= {$unsigned((~reg42[(1'h1):(1'h1)]))};
            end
          else
            begin
              reg55 <= {wire48[(1'h1):(1'h1)], wire46};
              reg56 <= (reg22[(1'h0):(1'h0)] ~^ $unsigned(reg17));
              reg57 <= $unsigned((+reg50));
              reg58 <= ((8'had) ^ reg27[(3'h7):(1'h0)]);
            end
          reg59 <= $signed((({reg31[(4'h8):(3'h6)]} ?
              wire9 : reg32) + ((~reg44) ?
              ((+reg18) * (reg53 << reg57)) : $unsigned(((8'ha0) ?
                  (8'hae) : wire6)))));
          reg60 <= (((({reg37, reg41} >>> $signed(reg26)) == (~(~^reg11))) ?
              $unsigned($unsigned((reg59 >> reg53))) : (($unsigned(wire7) << (reg35 ?
                      reg55 : reg15)) ?
                  {(wire49 ? wire48 : wire10),
                      {(8'hb0),
                          reg31}} : (8'h9d))) >= $unsigned(($signed($unsigned(reg18)) != $signed((reg25 ?
              reg23 : reg45)))));
        end
      reg61 <= ((-$signed({(|wire9)})) ^ ((8'h9e) ^ {reg37[(3'h6):(1'h1)]}));
      if ($unsigned(reg29[(1'h1):(1'h0)]))
        begin
          reg62 <= ($signed($signed(reg43[(1'h0):(1'h0)])) && {(~reg59[(1'h1):(1'h0)])});
          if ($signed((~&reg15[(2'h3):(1'h1)])))
            begin
              reg63 <= $unsigned((~|wire46));
              reg64 <= wire7[(4'h8):(3'h5)];
            end
          else
            begin
              reg63 <= (~reg45);
              reg64 <= (-reg57[(3'h4):(1'h0)]);
            end
          if ((|$signed(reg50[(4'h8):(1'h0)])))
            begin
              reg65 <= reg45[(3'h4):(2'h3)];
              reg66 <= ($signed(reg25) & reg17[(1'h0):(1'h0)]);
              reg67 <= reg60[(3'h4):(1'h0)];
              reg68 <= (reg39[(3'h5):(2'h3)] ?
                  (reg56 >>> $unsigned($signed((reg41 | (8'hb1))))) : reg27);
              reg69 <= (8'h9f);
            end
          else
            begin
              reg65 <= $unsigned(($unsigned(($unsigned(reg39) << reg63[(4'hc):(4'h9)])) ?
                  $unsigned((reg13 != reg41)) : (~^wire46[(2'h2):(1'h1)])));
            end
          reg70 <= reg23[(2'h2):(1'h0)];
        end
      else
        begin
          reg62 <= (^wire6[(3'h5):(2'h3)]);
          reg63 <= {reg27[(2'h2):(1'h1)]};
        end
      reg71 <= $signed((^~reg67));
      if ((8'h9f))
        begin
          reg72 <= (^~(((reg43 ^ $unsigned(wire9)) ?
              (&$unsigned((8'ha9))) : $unsigned($signed(reg25))) >>> {(reg68 != $signed(reg34)),
              ((8'hac) >> (reg21 == reg53))}));
          reg73 <= reg32[(1'h1):(1'h1)];
        end
      else
        begin
          reg72 <= reg31[(4'hc):(3'h5)];
        end
    end
  assign wire74 = (8'h9d);
  assign wire75 = $signed((-(^reg45[(1'h0):(1'h0)])));
  module76 #() modinst112 (.wire80(reg55), .wire81(reg54), .y(wire111), .clk(clk), .wire77(reg29), .wire79(wire75), .wire78(reg20));
  assign wire113 = ({($unsigned((reg19 ? reg11 : reg66)) | ($signed((8'h9c)) ?
                               $signed(reg66) : $signed(reg44))),
                           reg61[(5'h12):(2'h3)]} ?
                       reg57 : $signed($unsigned(((+reg18) != ((8'ha9) ?
                           reg41 : reg70)))));
  assign wire114 = (reg68 ~^ ((-reg22[(4'hf):(4'hd)]) ^ (reg37 ?
                       $unsigned(reg51) : $signed((|reg43)))));
  assign wire115 = $unsigned((^reg37[(3'h7):(3'h5)]));
  assign wire116 = reg63[(1'h0):(1'h0)];
  module117 #() modinst162 (wire161, clk, reg19, reg23, reg65, reg26, wire113);
  assign wire163 = $signed((&(|wire75[(1'h0):(1'h0)])));
  assign wire164 = (~(($signed(wire8) ?
                           $signed((reg32 ?
                               wire114 : (8'hbc))) : ($unsigned(reg22) ?
                               (wire161 ? reg65 : reg40) : (wire113 ?
                                   reg22 : reg39))) ?
                       $unsigned(wire48[(4'hb):(2'h3)]) : ((~^{(8'hae),
                           reg18}) && (((8'hb8) ^ reg21) & $signed(wire8)))));
  always
    @(posedge clk) begin
      if (($unsigned({reg61[(3'h5):(2'h3)]}) ?
          (^~(({reg55} ? (8'hbb) : reg37[(4'he):(4'h8)]) ?
              reg54[(2'h3):(1'h0)] : (~|(8'hb1)))) : $signed(($unsigned((reg66 ?
                  wire114 : (7'h44))) ?
              ((~|wire47) - wire6[(3'h6):(1'h0)]) : reg42))))
        begin
          reg165 <= {$signed($unsigned($unsigned($unsigned(reg69))))};
          reg166 <= reg73;
        end
      else
        begin
          if ((~^reg40[(1'h1):(1'h1)]))
            begin
              reg165 <= ((((!{wire111}) ?
                      (~{wire161}) : $unsigned((8'hbd))) >> {$signed((8'ha5)),
                      ({reg20, reg56} ? (|reg44) : (reg33 <= wire46))}) ?
                  $signed(($unsigned((reg54 << reg63)) ?
                      $signed(wire164[(3'h7):(1'h1)]) : $unsigned((+reg23)))) : (-$signed(reg69[(4'h8):(3'h5)])));
            end
          else
            begin
              reg165 <= $signed($signed($signed((reg24 ?
                  $unsigned(reg71) : (reg68 >= wire10)))));
              reg166 <= (-((~|((|wire164) != {wire47})) ?
                  (+(((8'ha6) > reg31) | (wire113 ~^ wire116))) : $unsigned($unsigned(reg16))));
            end
          reg167 <= $signed(reg32[(1'h0):(1'h0)]);
        end
      reg168 <= reg65[(4'hb):(4'h9)];
      if ((($signed($unsigned(reg64[(5'h10):(4'hb)])) ?
              wire115 : wire115[(2'h2):(1'h0)]) ?
          (^(~{reg70, $signed(reg12)})) : reg64[(1'h1):(1'h0)]))
        begin
          reg169 <= (-$unsigned($signed(reg69[(3'h6):(3'h4)])));
        end
      else
        begin
          if ((~^$signed($signed(reg64[(4'hc):(3'h6)]))))
            begin
              reg169 <= (!(wire75[(2'h3):(1'h1)] * $unsigned(reg23[(4'hc):(3'h7)])));
            end
          else
            begin
              reg169 <= $signed({(!$unsigned(((8'haf) ? reg166 : reg34))),
                  reg31});
              reg170 <= $unsigned(reg54);
              reg171 <= {($unsigned(((reg55 || reg14) * ((8'hb8) <= wire47))) ?
                      (!({reg66} < reg63)) : (reg55 ?
                          (~$signed((8'h9d))) : ((reg60 && wire75) ^~ (~&reg67))))};
            end
          if ({(($unsigned(reg38) ?
                  (!((8'hb6) < reg68)) : wire161) << reg21[(1'h0):(1'h0)]),
              $signed((((~&wire8) | (+reg170)) ? $signed((-reg171)) : reg31))})
            begin
              reg172 <= reg58;
              reg173 <= reg54[(1'h1):(1'h1)];
            end
          else
            begin
              reg172 <= $signed($signed($unsigned((^~reg30))));
              reg173 <= reg64[(5'h14):(4'hc)];
              reg174 <= ($signed((!$signed($signed(reg21)))) ?
                  (reg52 >>> (((8'hb3) ? wire161[(5'h15):(3'h7)] : reg69) ?
                      ((reg172 || reg20) ?
                          (reg40 ^ reg37) : reg27[(3'h7):(3'h4)]) : {reg22[(4'hd):(3'h7)],
                          (wire115 ?
                              reg21 : reg21)})) : (reg37 ^ ((reg30[(4'h9):(3'h6)] ^ $signed(reg34)) | reg68[(4'hb):(1'h1)])));
              reg175 <= $signed({reg70});
            end
          reg176 <= reg12[(4'hf):(4'ha)];
          reg177 <= ((&$signed(((reg167 ?
                  reg72 : (8'hb3)) < reg16[(1'h1):(1'h0)]))) ?
              {(-$unsigned(reg64[(4'he):(4'hb)])),
                  (!$signed($signed((8'hb9))))} : wire164);
        end
      reg178 <= {(($signed(wire115[(3'h7):(3'h7)]) ? (7'h44) : (&reg177)) ?
              $signed((|$unsigned(wire74))) : $unsigned($signed(reg169))),
          ((^~reg168) && (reg71 <= reg56[(3'h6):(2'h3)]))};
    end
  assign wire179 = (($unsigned(reg56) ?
                       reg39[(1'h0):(1'h0)] : reg31) + $unsigned((({wire74} ?
                       (wire6 > wire7) : (8'hb4)) >= ((~^wire113) - (^reg39)))));
  assign wire180 = reg26;
  assign wire181 = ($unsigned((((~reg69) ? (reg45 ^~ wire74) : {reg72}) ?
                           (8'hb3) : (-$signed(reg67)))) ?
                       reg34 : $unsigned((~|(~&((8'ha0) << reg57)))));
  assign wire182 = {reg20[(4'h8):(2'h2)],
                       ((!($unsigned(reg63) ? reg68 : reg168)) ?
                           (reg170 ?
                               reg17 : $signed($unsigned(reg20))) : (~|$signed((reg66 ?
                               reg50 : reg11))))};
endmodule

module module117
#(parameter param160 = (+(({(8'hb9)} ? (!{(8'hab), (8'ha3)}) : (((8'hbb) ? (8'hae) : (8'hb5)) << ((8'hbb) && (7'h43)))) ? ((!((7'h40) <<< (8'hab))) + ({(8'hbc)} <<< ((8'hbc) ? (8'ha0) : (8'hb5)))) : ((((8'h9e) ? (8'ha0) : (8'ha5)) ? (~(8'ha4)) : ((7'h40) ? (8'ha7) : (8'hb6))) >> {{(8'hb8), (7'h44)}}))))
(y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire122;
  input wire signed [(4'he):(1'h0)] wire121;
  input wire [(5'h11):(1'h0)] wire120;
  input wire signed [(4'hd):(1'h0)] wire119;
  input wire [(4'hb):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire138;
  wire signed [(4'h9):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire128;
  wire signed [(4'hf):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(4'ha):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(2'h2):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
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
                 reg143,
                 reg142,
                 reg141,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire123 = (7'h40);
  assign wire124 = wire121;
  assign wire125 = $signed($signed({{(wire122 == wire121)},
                       $unsigned(wire123)}));
  assign wire126 = $unsigned($signed(wire121[(4'hb):(4'h9)]));
  assign wire127 = (~wire124[(2'h2):(1'h0)]);
  assign wire128 = $unsigned($unsigned((~|((wire121 || wire127) > (~^wire118)))));
  assign wire129 = (wire126 >>> wire123);
  always
    @(posedge clk) begin
      if ((~|(wire121[(3'h4):(2'h3)] ?
          {$signed($signed(wire129))} : ($unsigned(wire124) ?
              wire120 : (|(!wire121))))))
        begin
          reg130 <= wire124;
          reg131 <= $unsigned(reg130[(3'h4):(2'h2)]);
          reg132 <= (~^reg130);
          if (reg132)
            begin
              reg133 <= (&({wire118[(3'h4):(2'h3)],
                  reg131[(1'h0):(1'h0)]} | ($signed($signed(wire125)) ?
                  $unsigned((~^wire121)) : $signed((!wire126)))));
            end
          else
            begin
              reg133 <= {wire127};
              reg134 <= wire125[(3'h4):(2'h2)];
              reg135 <= ($unsigned((($signed(wire120) ~^ reg130[(3'h4):(2'h2)]) | $unsigned((~^(8'ha3))))) & ($signed($signed(wire127)) ?
                  wire118[(2'h2):(2'h2)] : ((8'ha6) ^~ {$unsigned(reg134),
                      ((8'hba) ? reg132 : wire128)})));
              reg136 <= (8'ha4);
            end
        end
      else
        begin
          reg130 <= (wire128[(3'h7):(1'h1)] ^~ $unsigned(wire129));
        end
    end
  assign wire137 = (reg133 ?
                       wire119[(4'ha):(2'h3)] : $unsigned($unsigned(wire124[(2'h3):(2'h3)])));
  assign wire138 = $signed(wire122);
  assign wire139 = ((!((-wire119) == ($signed(reg136) ?
                       wire121[(4'ha):(3'h6)] : wire129[(1'h1):(1'h1)]))) || ((~&({(8'hb2)} ?
                       $unsigned(wire125) : wire125[(3'h6):(1'h0)])) & (wire118[(3'h7):(3'h7)] >>> $unsigned(((8'haa) ?
                       reg136 : wire123)))));
  assign wire140 = wire125;
  always
    @(posedge clk) begin
      reg141 <= ($signed(wire126[(3'h7):(2'h3)]) != $signed($signed(wire120[(2'h2):(2'h2)])));
      if ((^reg133))
        begin
          reg142 <= (~&((^$signed({wire119,
              reg133})) >>> ({$signed(wire126)} && wire139[(2'h3):(2'h3)])));
          reg143 <= ((^~{$unsigned((reg133 + wire122))}) ^~ ($unsigned((wire122 * (~^wire140))) ?
              (wire126 && {$signed(reg142)}) : wire128[(3'h7):(2'h2)]));
          reg144 <= $signed({((reg142[(3'h4):(2'h3)] ?
                      {wire127} : (reg131 ? reg134 : reg136)) ?
                  ($unsigned((8'hbe)) ? wire137 : wire124) : wire137),
              $unsigned((~|$signed(wire118)))});
        end
      else
        begin
          reg142 <= $unsigned((reg144[(4'hb):(4'h8)] ?
              ($unsigned($unsigned(reg144)) ?
                  wire118[(2'h3):(2'h3)] : $signed((reg132 ?
                      wire126 : wire118))) : reg144[(3'h7):(3'h7)]));
          reg143 <= (((^~wire127[(1'h1):(1'h1)]) ? wire127 : wire140) ?
              reg144[(4'h8):(3'h4)] : $unsigned(wire124));
          reg144 <= $unsigned(wire140);
        end
      if (($signed(wire127[(1'h1):(1'h0)]) ?
          (~(wire128 ?
              ($unsigned(reg142) > reg141[(2'h2):(1'h0)]) : ($signed(wire127) ?
                  $signed(wire118) : $signed(reg133)))) : (wire126[(2'h2):(1'h0)] + (reg133 ?
              reg132[(3'h5):(1'h1)] : reg141[(2'h2):(1'h1)]))))
        begin
          if ({$signed(wire127[(3'h4):(1'h0)])})
            begin
              reg145 <= {wire121,
                  $unsigned($unsigned((reg144 ?
                      (&(8'ha9)) : ((8'hb7) ? reg132 : reg135))))};
              reg146 <= (|$unsigned(reg144));
            end
          else
            begin
              reg145 <= reg130[(1'h1):(1'h1)];
            end
          if (wire121)
            begin
              reg147 <= reg144;
              reg148 <= wire123[(2'h3):(2'h3)];
              reg149 <= ((($signed((-(8'ha8))) ?
                      reg136 : ($unsigned(reg135) ?
                          $unsigned(reg145) : (reg147 >= wire123))) << (+wire122)) ?
                  $signed($unsigned($unsigned(reg147))) : $unsigned((wire121[(2'h2):(2'h2)] || (((8'ha5) ?
                      reg141 : wire125) && wire127))));
            end
          else
            begin
              reg147 <= $signed(wire129);
              reg148 <= wire129;
            end
          if ($unsigned((8'hbb)))
            begin
              reg150 <= wire129;
            end
          else
            begin
              reg150 <= reg142;
              reg151 <= $unsigned(wire140);
            end
        end
      else
        begin
          reg145 <= {reg142[(2'h2):(1'h1)],
              $unsigned($unsigned(wire137[(2'h3):(1'h0)]))};
          reg146 <= ((^~$unsigned((+(wire118 ? (8'h9c) : wire129)))) > reg147);
        end
      if ((^~(($unsigned($signed(wire122)) ?
              (wire122 ?
                  {(8'h9d), reg143} : (wire119 ?
                      (8'hbd) : wire138)) : (+((8'hab) ? reg149 : wire128))) ?
          ($unsigned(((8'hb9) ? wire121 : reg144)) ~^ ({reg147} ?
              (wire127 != wire119) : {reg136})) : wire140)))
        begin
          if (wire140[(1'h1):(1'h1)])
            begin
              reg152 <= ($unsigned((|wire119[(4'h8):(3'h6)])) + reg145[(4'ha):(2'h3)]);
              reg153 <= $signed($signed((((reg131 <<< (8'hb3)) ?
                      $signed(wire137) : {wire124}) ?
                  (~|reg151) : $signed(reg132[(2'h3):(1'h1)]))));
              reg154 <= (|$unsigned(wire128[(2'h3):(1'h0)]));
              reg155 <= wire119[(4'h8):(1'h0)];
            end
          else
            begin
              reg152 <= $unsigned($unsigned({wire119[(4'hc):(4'h8)]}));
            end
          reg156 <= (&reg141[(3'h5):(1'h1)]);
          reg157 <= ((~&wire139[(3'h4):(2'h3)]) ?
              (~&wire119) : $signed($unsigned($signed($signed(reg143)))));
        end
      else
        begin
          reg152 <= (~&$signed(wire140[(1'h0):(1'h0)]));
          reg153 <= (&(reg147[(1'h1):(1'h1)] ?
              reg153[(4'he):(4'he)] : {$signed($unsigned(reg145))}));
          if (wire128)
            begin
              reg154 <= {$signed(reg130[(2'h3):(2'h2)]),
                  $signed(wire137[(3'h5):(2'h3)])};
            end
          else
            begin
              reg154 <= (~$signed(reg146[(4'hc):(1'h0)]));
            end
          reg155 <= ((^~($unsigned({wire124, wire140}) ?
              $signed($signed(wire118)) : (!(8'hb5)))) >> $unsigned(wire127[(3'h7):(3'h6)]));
          reg156 <= (^reg157);
        end
    end
  assign wire158 = {((8'hbe) ? wire126 : ($signed(reg142) - (8'hae)))};
  assign wire159 = (wire122[(4'h8):(3'h4)] || reg133);
endmodule

module module76
#(parameter param109 = ((8'ha2) ? ((~^({(8'ha0)} ? ((8'hb4) >>> (8'haf)) : ((8'ha2) ? (8'ha5) : (7'h42)))) <<< (({(7'h43)} ? ((8'hb9) ? (8'ha3) : (8'ha6)) : (&(8'hbd))) ? (((8'hae) != (8'ha9)) || (^~(8'hba))) : {((8'ha6) ? (8'h9f) : (7'h44))})) : (-(|(^~((8'hac) == (7'h40)))))), 
parameter param110 = {param109})
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire80;
  input wire signed [(4'h9):(1'h0)] wire79;
  input wire signed [(3'h6):(1'h0)] wire78;
  input wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire95,
                 wire94,
                 wire93,
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
                 reg82,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg82 <= (~((^wire80) ?
          (((wire77 ? wire77 : wire78) ?
              (wire80 ?
                  wire81 : wire81) : wire78[(1'h1):(1'h1)]) ~^ $signed((wire80 ^~ wire78))) : $unsigned((8'hbc))));
    end
  assign wire83 = $unsigned(((+wire81[(3'h6):(3'h5)]) + (~^$signed($unsigned(reg82)))));
  assign wire84 = reg82[(4'hf):(2'h2)];
  assign wire85 = reg82[(1'h0):(1'h0)];
  assign wire86 = $unsigned(wire79);
  assign wire87 = $signed(wire84);
  assign wire88 = (+$unsigned($signed((|wire80[(3'h7):(1'h0)]))));
  assign wire89 = {$unsigned($signed(wire83))};
  assign wire90 = (wire77 || wire79);
  assign wire91 = (wire89[(1'h1):(1'h1)] ~^ (wire81 ?
                      wire85[(4'h8):(3'h6)] : ((wire86 * $unsigned(wire86)) | $unsigned((wire78 ?
                          wire84 : wire77)))));
  assign wire92 = (8'h9e);
  assign wire93 = $unsigned(($signed($unsigned(wire91[(2'h3):(1'h0)])) ?
                      $signed($signed((wire85 >> wire78))) : (((~&wire79) ?
                              {reg82, wire80} : ((8'ha3) ^~ (8'hb7))) ?
                          reg82[(5'h12):(3'h4)] : ($signed(reg82) >>> (wire81 ?
                              wire80 : wire77)))));
  assign wire94 = $unsigned(($unsigned($signed($unsigned(wire81))) ^~ {wire87,
                      $unsigned($unsigned(wire77))}));
  assign wire95 = {((~($unsigned(wire79) ?
                              wire78 : (wire77 ? wire86 : wire92))) ?
                          wire78 : ((8'hb4) == ($signed(wire81) ?
                              $signed(wire90) : $signed((7'h42))))),
                      (~($signed((~|wire92)) ?
                          wire91 : ($signed(wire85) || (wire77 ?
                              reg82 : wire93))))};
  always
    @(posedge clk) begin
      if ($signed($unsigned((7'h42))))
        begin
          if ((!(((((8'hb1) ? wire92 : wire80) ?
                  (wire92 ? wire95 : wire89) : (wire85 * wire83)) ?
              ((wire95 != (8'hb1)) ?
                  wire94[(2'h3):(2'h2)] : wire95) : ($signed(wire85) || ((8'hbc) < wire94))) * wire80)))
            begin
              reg96 <= ({($signed((wire79 ?
                          wire92 : wire95)) >> $unsigned(wire93[(5'h11):(5'h11)]))} ?
                  ($unsigned($unsigned((wire90 ?
                      wire92 : wire81))) < wire86[(2'h3):(1'h0)]) : (wire88[(1'h0):(1'h0)] + {(!wire91),
                      (wire77[(4'h8):(2'h2)] ?
                          wire89[(1'h1):(1'h0)] : (wire89 >>> wire93))}));
              reg97 <= {(~&wire78[(2'h3):(1'h0)]),
                  {$signed(($unsigned(wire91) && {wire77})),
                      (((wire92 ?
                          reg82 : wire89) + $unsigned(wire77)) ^ (wire91 != $signed(wire85)))}};
              reg98 <= ($unsigned($signed(($unsigned(wire85) ?
                  wire78 : $unsigned(wire93)))) > ((8'hab) ?
                  (8'ha3) : (~$signed(reg82[(4'hd):(4'h8)]))));
              reg99 <= (&{((wire86[(1'h0):(1'h0)] ?
                      (wire86 ? wire93 : wire86) : wire90) < {(+wire78)}),
                  $signed($unsigned((8'hb2)))});
            end
          else
            begin
              reg96 <= {$signed(reg96[(4'hb):(3'h5)])};
            end
          reg100 <= wire88;
          reg101 <= wire91;
        end
      else
        begin
          reg96 <= {wire85};
        end
      reg102 <= $signed((((~&(8'hae)) != (reg98 ?
          $signed(wire94) : (wire91 | wire94))) ~^ $signed((8'hb8))));
    end
  assign wire103 = (+$unsigned((wire93[(4'hf):(3'h5)] <= $signed(reg102[(1'h1):(1'h0)]))));
  assign wire104 = wire93;
  assign wire105 = wire81;
  assign wire106 = $signed($signed($signed(wire85)));
  assign wire107 = {(+$unsigned((!(-wire86))))};
  assign wire108 = $unsigned($signed($signed(wire78[(3'h6):(3'h5)])));
endmodule
