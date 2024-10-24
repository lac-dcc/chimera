module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire243;
  wire [(3'h7):(1'h0)] wire242;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire240;
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  assign y = {wire243,
                 wire242,
                 wire4,
                 wire31,
                 wire32,
                 wire33,
                 wire240,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
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
                 (1'h0)};
  assign wire4 = wire1;
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned(wire1[(3'h5):(1'h1)]));
      reg6 <= $signed(((^~(8'hb3)) > $unsigned(({reg5, reg5} ?
          wire0[(4'h8):(3'h5)] : reg5[(4'ha):(3'h4)]))));
      if (((wire2 ? (~$signed({wire3, wire4})) : reg6) ?
          ((8'hb4) ? wire1 : wire0[(3'h7):(1'h0)]) : (!reg5)))
        begin
          if ((wire3 ?
              $signed($signed($signed((reg5 ? wire2 : wire2)))) : ((({(8'hb4),
                      wire1} ^ (!(8'ha4))) ?
                  $unsigned(wire3[(1'h1):(1'h1)]) : $signed($unsigned((8'hac)))) != (~&wire0[(3'h6):(3'h6)]))))
            begin
              reg7 <= (^~wire2[(4'hc):(1'h0)]);
              reg8 <= (~(wire0[(4'ha):(3'h5)] ?
                  (reg7 ? wire0 : $unsigned((!wire4))) : $signed((~|(wire1 ?
                      reg5 : wire2)))));
            end
          else
            begin
              reg7 <= ({{({reg6} ? (-wire2) : $unsigned(wire2)),
                      {(reg5 ? reg6 : (8'h9f)),
                          $unsigned(reg5)}}} && $signed({($unsigned(reg6) > wire0[(2'h3):(1'h0)]),
                  wire1}));
              reg8 <= ({reg7[(2'h3):(1'h1)]} ?
                  $unsigned($unsigned(((+wire1) ?
                      $signed(reg8) : (wire1 ?
                          wire1 : wire0)))) : $signed(wire1[(2'h3):(1'h0)]));
              reg9 <= wire0[(1'h1):(1'h0)];
              reg10 <= (wire0 ?
                  wire2 : {$signed({$signed(wire1)}),
                      $signed($signed($signed(wire3)))});
              reg11 <= wire4;
            end
          if ($signed({{((8'hb5) ?
                      (reg10 ? wire2 : (8'ha7)) : reg10[(2'h2):(2'h2)]),
                  reg9},
              ({reg11} >> $unsigned($unsigned(reg11)))}))
            begin
              reg12 <= {$signed((~|$unsigned($signed((8'hbb)))))};
            end
          else
            begin
              reg12 <= ((-((8'hb5) ?
                      $signed($unsigned(reg9)) : reg11[(4'h8):(2'h2)])) ?
                  ((reg8[(1'h0):(1'h0)] << {reg10[(2'h2):(2'h2)],
                          (reg8 >> wire1)}) ?
                      (reg7[(3'h4):(2'h2)] + $unsigned((wire0 >= (8'hab)))) : (8'ha6)) : ($unsigned($signed((~^reg12))) ?
                      reg8[(4'hd):(4'ha)] : $signed(($unsigned(reg11) ?
                          wire3[(1'h1):(1'h1)] : $signed((8'hb4))))));
              reg13 <= reg9[(2'h2):(1'h1)];
              reg14 <= ((|$unsigned(reg10[(2'h2):(2'h2)])) ?
                  {($signed($unsigned(reg8)) > (^~(reg11 ? reg12 : reg12))),
                      {$signed((&reg5))}} : $signed(((reg12 << (~&wire0)) | {(reg13 >= wire4)})));
              reg15 <= $signed(((!(~|(8'h9e))) << (-$signed((reg12 <= (8'ha3))))));
            end
          if (reg6)
            begin
              reg16 <= reg14[(3'h4):(1'h1)];
            end
          else
            begin
              reg16 <= $unsigned((^~((8'hbd) ?
                  (-$unsigned(reg7)) : reg8[(3'h4):(1'h0)])));
              reg17 <= (wire4[(4'hf):(3'h7)] ? (+wire4) : wire3[(1'h1):(1'h0)]);
              reg18 <= {$signed($signed($signed($unsigned((8'h9f)))))};
              reg19 <= (((^~((reg9 ? reg18 : wire2) ?
                          reg9[(2'h2):(1'h1)] : $signed(reg6))) ?
                      (((8'haf) ?
                          ((8'hb6) ? (8'hb9) : wire4) : (reg7 ?
                              reg17 : reg7)) ^ $unsigned(reg11[(3'h4):(2'h2)])) : $signed((+(reg14 || reg6)))) ?
                  $unsigned({wire4,
                      {(^reg8), reg12[(1'h1):(1'h1)]}}) : reg10[(2'h2):(2'h2)]);
              reg20 <= $unsigned((-reg5[(4'h9):(4'h8)]));
            end
          reg21 <= (+$signed((reg12 ?
              $signed((reg6 ~^ (8'hb8))) : $signed((reg11 || reg19)))));
          if (wire4)
            begin
              reg22 <= reg15[(2'h2):(2'h2)];
              reg23 <= {(~&reg21),
                  ($signed((|(reg19 >= reg12))) | $signed($unsigned({wire3,
                      (8'hae)})))};
            end
          else
            begin
              reg22 <= (~^$signed(reg9));
              reg23 <= (^(~^$unsigned($signed((reg13 ? wire0 : wire4)))));
            end
        end
      else
        begin
          reg7 <= ($signed($signed($signed(reg6[(3'h7):(2'h2)]))) ~^ reg10[(1'h1):(1'h0)]);
          reg8 <= reg23;
          if ($unsigned(((~&((-reg17) ?
                  reg19[(4'hf):(4'h9)] : ((8'hb3) ^~ reg17))) ?
              ($unsigned((reg21 ^~ reg5)) >>> reg19[(4'h9):(3'h7)]) : ((reg20[(3'h6):(3'h4)] > reg22) ^ (8'ha3)))))
            begin
              reg9 <= (7'h42);
              reg10 <= ((~|$unsigned($signed($signed(reg6)))) > (-$unsigned(($unsigned((8'ha7)) ?
                  (wire3 > reg12) : wire1[(3'h6):(3'h4)]))));
              reg11 <= $unsigned(reg14);
              reg12 <= reg10[(1'h1):(1'h1)];
              reg13 <= reg17;
            end
          else
            begin
              reg9 <= reg11;
              reg10 <= ($unsigned($unsigned($signed({reg10, reg16}))) ?
                  (^~(reg12 ?
                      wire1 : ((^reg13) ?
                          {wire4} : (wire0 ?
                              reg5 : reg10)))) : $signed($signed(((~&wire2) >= (&reg11)))));
              reg11 <= ($signed(reg21) ?
                  $signed(reg13[(5'h13):(2'h3)]) : ((reg21[(3'h7):(2'h2)] ?
                      reg18 : ((-reg20) ?
                          reg10 : ((8'hb0) < reg13))) << ((8'hbb) << {(wire4 ?
                          reg15 : (8'haf)),
                      (reg6 ~^ (8'hb0))})));
              reg12 <= ($unsigned((~(reg16 ?
                  ((8'ha4) - reg17) : wire2[(5'h11):(3'h4)]))) ^ reg16[(2'h3):(2'h2)]);
            end
        end
      if (wire4)
        begin
          reg24 <= wire4[(4'hf):(1'h0)];
        end
      else
        begin
          reg24 <= ($signed($unsigned($signed(reg10[(2'h3):(1'h1)]))) ?
              (~|($signed((reg12 > wire2)) ?
                  (-(~^wire0)) : $unsigned((reg15 || reg5)))) : {(8'hae),
                  $signed(wire2[(2'h2):(2'h2)])});
          if ($signed(wire3))
            begin
              reg25 <= ($signed(wire4) ?
                  reg10 : ((|$signed($signed(reg12))) ?
                      ({$signed(reg15)} && $signed($unsigned(reg17))) : reg15[(3'h7):(3'h7)]));
            end
          else
            begin
              reg25 <= $signed(reg15[(4'h9):(4'h9)]);
            end
          if ($signed({(!wire2), reg8[(3'h6):(3'h6)]}))
            begin
              reg26 <= reg25[(4'hb):(4'h8)];
              reg27 <= (!(($unsigned((wire3 ?
                  reg15 : reg19)) >>> $signed({reg17,
                  reg6})) >>> $signed(wire1)));
              reg28 <= (~&$signed((~^($signed(reg14) ?
                  $signed(reg13) : $signed(reg5)))));
              reg29 <= (((((reg5 == (8'ha5)) > reg5) * reg20[(3'h4):(3'h4)]) ?
                  $unsigned(reg15) : reg11) == {(~^(wire1[(1'h0):(1'h0)] ?
                      {reg26, reg18} : (reg5 ? reg24 : reg12))),
                  (reg23[(1'h0):(1'h0)] * wire3)});
              reg30 <= reg6[(4'hc):(1'h0)];
            end
          else
            begin
              reg26 <= $unsigned(((&reg10) ?
                  (~|(!(wire1 ? (8'hb6) : reg26))) : reg10[(1'h0):(1'h0)]));
              reg27 <= $unsigned(reg25);
              reg28 <= ((~|reg25) ?
                  (&reg19[(1'h1):(1'h0)]) : $unsigned(({(reg26 ? wire2 : reg13),
                          wire0} ?
                      (~&(wire0 ? reg23 : reg25)) : $unsigned((reg15 ?
                          (8'hbc) : reg6)))));
            end
        end
    end
  assign wire31 = (reg23 >>> {(&reg10[(2'h2):(1'h1)])});
  assign wire32 = (^($unsigned($signed(reg16[(1'h0):(1'h0)])) >= (wire3[(2'h2):(2'h2)] ?
                      ((wire0 ? wire31 : reg7) ?
                          {reg15} : reg8) : (((7'h43) & reg18) >> {reg24,
                          reg25}))));
  assign wire33 = (((~(~|$signed(reg17))) != reg22[(1'h0):(1'h0)]) != reg17[(4'h9):(3'h5)]);
  module34 #() modinst241 (wire240, clk, reg14, reg6, reg15, wire2);
  assign wire242 = reg7[(1'h0):(1'h0)];
  assign wire243 = $signed(reg18);
endmodule

module module34
#(parameter param238 = {((~^(((8'haf) ? (8'had) : (8'h9e)) ? ((8'hba) != (8'hba)) : ((8'hbd) + (8'hbd)))) ? ((((8'hb2) > (7'h40)) ? ((8'ha9) ? (8'hb9) : (8'haf)) : ((8'hac) ? (8'had) : (8'hbc))) ? {(~|(8'haa))} : ((&(8'ha5)) || ((8'hb7) ? (7'h40) : (8'hab)))) : ((~&(&(8'hab))) ~^ (((8'haa) ^ (8'hbf)) ? ((8'hac) >= (8'hba)) : ((7'h44) <<< (8'hb2)))))}, 
parameter param239 = (((8'ha7) != (~|(8'ha9))) ^ param238))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  input wire [(5'h15):(1'h0)] wire36;
  input wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire237;
  wire [(5'h11):(1'h0)] wire236;
  wire [(3'h7):(1'h0)] wire234;
  wire signed [(5'h14):(1'h0)] wire195;
  wire [(5'h11):(1'h0)] wire193;
  wire [(4'h9):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire122;
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  assign y = {wire237,
                 wire236,
                 wire234,
                 wire195,
                 wire193,
                 wire124,
                 wire109,
                 wire122,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= $signed($signed(wire35));
      if (($unsigned($unsigned((8'hae))) ?
          $signed($unsigned({$signed(wire38), $signed(wire36)})) : {wire37}))
        begin
          reg40 <= reg39;
          reg41 <= (wire36 ?
              (reg39[(1'h1):(1'h1)] ?
                  $signed($unsigned((wire36 ?
                      wire37 : wire38))) : reg39) : ((8'hb3) >>> (reg40[(3'h4):(2'h2)] ?
                  ($signed(reg40) ?
                      ((8'h9e) < wire37) : wire38) : wire35[(2'h3):(2'h3)])));
          reg42 <= wire36[(4'he):(2'h2)];
          reg43 <= (~&(~&$signed(reg39)));
          reg44 <= (!$unsigned($signed(reg39[(2'h2):(2'h2)])));
        end
      else
        begin
          reg40 <= wire38;
          if ($unsigned(reg39))
            begin
              reg41 <= (~&reg42[(4'h8):(3'h5)]);
              reg42 <= (~^({(^(wire37 ? wire38 : wire35))} ?
                  (wire37[(2'h2):(2'h2)] ?
                      $unsigned(((8'hbe) ?
                          (8'hb8) : reg43)) : {$unsigned(reg43)}) : (8'ha9)));
              reg43 <= wire37;
              reg44 <= (reg42[(1'h1):(1'h0)] | {((wire38 ?
                      (wire38 < reg43) : (wire37 ?
                          reg44 : wire35)) >> wire36[(5'h10):(4'ha)]),
                  (($unsigned(reg40) | (wire36 ?
                      wire38 : (8'haa))) <<< (~(reg39 ? (8'ha9) : (8'hac))))});
            end
          else
            begin
              reg41 <= wire36[(3'h6):(3'h5)];
              reg42 <= $unsigned($signed((reg43[(3'h4):(1'h0)] || $unsigned(reg43))));
              reg43 <= ($unsigned(reg41[(3'h6):(3'h5)]) + $signed({wire36[(2'h2):(2'h2)]}));
            end
          reg45 <= (((~(wire36 <= reg39)) ?
              {$unsigned(((8'hbb) ? wire35 : wire35)),
                  ($signed((8'h9f)) ?
                      {reg42,
                          (8'ha6)} : $signed(reg42))} : reg41[(4'hf):(4'ha)]) ^ reg44);
        end
      reg46 <= reg45[(2'h2):(1'h1)];
      reg47 <= $signed(wire36);
    end
  module48 #() modinst110 (.wire49(reg46), .wire50(wire37), .wire51(reg42), .wire52(reg44), .y(wire109), .clk(clk), .wire53(reg39));
  module111 #() modinst123 (wire122, clk, reg41, reg47, wire109, reg40);
  assign wire124 = $signed({wire35});
  module125 #() modinst194 (.wire126(wire122), .clk(clk), .wire128(wire124), .wire127(reg40), .wire129(reg43), .y(wire193));
  assign wire195 = (8'hb1);
  module196 #() modinst235 (.clk(clk), .wire199(wire109), .wire200(reg45), .wire198(reg44), .wire197(wire195), .y(wire234));
  assign wire236 = $unsigned({$signed((^$unsigned(reg47)))});
  assign wire237 = $unsigned($signed($unsigned(reg39[(3'h4):(2'h2)])));
endmodule

module module196
#(parameter param232 = (7'h43), 
parameter param233 = {({(|{param232, param232}), ((param232 ^~ param232) ? {(8'h9c)} : param232)} ? param232 : {param232}), param232})
(y, clk, wire200, wire199, wire198, wire197);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire200;
  input wire signed [(5'h11):(1'h0)] wire199;
  input wire [(2'h3):(1'h0)] wire198;
  input wire [(5'h14):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire217;
  wire [(3'h5):(1'h0)] wire216;
  wire [(2'h3):(1'h0)] wire215;
  wire signed [(3'h6):(1'h0)] wire214;
  wire [(4'he):(1'h0)] wire213;
  wire signed [(5'h12):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire211;
  wire [(3'h6):(1'h0)] wire210;
  wire signed [(4'hf):(1'h0)] wire209;
  wire [(4'h8):(1'h0)] wire208;
  wire [(4'hb):(1'h0)] wire207;
  wire [(5'h13):(1'h0)] wire206;
  wire signed [(5'h10):(1'h0)] wire205;
  wire signed [(3'h7):(1'h0)] wire204;
  wire signed [(3'h5):(1'h0)] wire203;
  wire [(5'h10):(1'h0)] wire202;
  wire signed [(2'h3):(1'h0)] wire201;
  reg signed [(3'h6):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg230 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg229 = (1'h0);
  reg [(3'h4):(1'h0)] reg228 = (1'h0);
  reg [(5'h13):(1'h0)] reg227 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg226 = (1'h0);
  reg [(2'h3):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg224 = (1'h0);
  reg [(4'ha):(1'h0)] reg223 = (1'h0);
  reg [(5'h15):(1'h0)] reg222 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg221 = (1'h0);
  reg [(3'h5):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg218 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire215,
                 wire214,
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
                 wire202,
                 wire201,
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
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 (1'h0)};
  assign wire201 = (~$unsigned((((wire200 <<< wire197) != (wire200 ?
                           wire198 : wire200)) ?
                       (~|wire199) : $unsigned(wire197[(1'h0):(1'h0)]))));
  assign wire202 = (($unsigned(wire200[(3'h7):(1'h1)]) ?
                           $signed(wire200[(4'hc):(3'h4)]) : $signed({(wire199 > wire201),
                               (wire201 >> wire200)})) ?
                       (wire199 + $unsigned((wire197[(3'h5):(2'h3)] ?
                           (!wire197) : (~wire201)))) : (!wire197));
  assign wire203 = $unsigned(({{$unsigned((8'hbd))},
                       (8'hab)} >>> wire202[(4'h8):(2'h3)]));
  assign wire204 = $unsigned(({$unsigned(wire200),
                       ((-wire197) >= wire197)} ~^ $unsigned($unsigned($signed(wire202)))));
  assign wire205 = (8'h9d);
  assign wire206 = (~wire197[(4'hc):(2'h3)]);
  assign wire207 = $signed((+(wire198[(1'h1):(1'h0)] ?
                       ($unsigned(wire203) ?
                           (wire202 & wire197) : $signed(wire201)) : wire201[(2'h2):(1'h0)])));
  assign wire208 = $unsigned($unsigned($unsigned(((wire201 ?
                           wire205 : wire206) ?
                       wire205 : ((8'ha1) == (8'hb8))))));
  assign wire209 = $unsigned(wire197);
  assign wire210 = wire203[(3'h4):(1'h1)];
  assign wire211 = $signed($unsigned((wire200 >>> $unsigned((~wire210)))));
  assign wire212 = (wire210 ~^ ($unsigned((wire197 ^ (wire208 ^~ wire202))) ?
                       $signed(wire209) : ((8'h9d) == ((|wire206) * wire203))));
  assign wire213 = $signed(({$signed(wire205[(1'h0):(1'h0)]),
                           ((wire208 > (8'ha2)) >>> wire212)} ?
                       wire208 : $unsigned({wire203})));
  assign wire214 = (8'hae);
  assign wire215 = wire202;
  assign wire216 = $unsigned((&($signed((~wire206)) ?
                       wire202 : ((wire214 >>> wire202) && (wire205 == wire204)))));
  assign wire217 = {(~|wire215)};
  always
    @(posedge clk) begin
      if ((wire198[(2'h3):(2'h3)] ?
          wire212 : ($signed((^~{wire198,
              wire215})) <= wire202[(5'h10):(4'h9)])))
        begin
          reg218 <= (wire197 ? wire215[(2'h3):(2'h2)] : $signed(wire213));
          if ({(wire207 >>> $signed(($unsigned((8'h9c)) >>> $signed(wire204)))),
              (wire204 ?
                  $unsigned(wire204) : $signed((wire206 != (wire208 ?
                      wire212 : (8'hb8)))))})
            begin
              reg219 <= (8'hb6);
              reg220 <= wire214;
              reg221 <= wire214[(3'h4):(1'h1)];
            end
          else
            begin
              reg219 <= {($signed((wire206 ?
                      $unsigned(reg219) : (+wire215))) ~^ wire210[(1'h1):(1'h0)]),
                  (8'hac)};
              reg220 <= {(^(8'ha7)), (^~wire198[(2'h2):(2'h2)])};
            end
        end
      else
        begin
          reg218 <= (wire217[(4'h8):(3'h6)] ?
              ({((wire210 << wire211) ?
                      wire215 : (~|(8'ha3)))} <<< ({wire198} || (~&(wire214 ?
                  (8'haa) : wire204)))) : (reg220 - ($unsigned($signed(wire200)) <= ((wire201 ?
                      wire200 : wire203) ?
                  $signed(wire212) : $signed(wire209)))));
          reg219 <= ({(wire201[(2'h2):(1'h1)] & (wire216 < (wire216 ?
                  wire197 : wire197))),
              $signed(wire210)} <= (^wire199));
          reg220 <= (reg221[(3'h7):(2'h2)] ?
              wire217[(2'h2):(1'h1)] : (wire214[(2'h3):(2'h3)] ?
                  ($unsigned((wire213 ? wire211 : wire199)) >= {((8'hbc) ?
                          wire215 : reg220),
                      (wire205 ?
                          wire203 : reg218)}) : $unsigned($signed((wire203 ?
                      wire210 : (7'h44))))));
          reg221 <= (!($unsigned((wire215[(1'h0):(1'h0)] == $unsigned(wire208))) ?
              $unsigned((|reg219)) : (&$signed(((8'ha6) ?
                  wire197 : (8'hae))))));
          if (wire217[(4'ha):(4'h8)])
            begin
              reg222 <= {wire208[(2'h2):(1'h0)]};
              reg223 <= $signed(($unsigned(((8'hb0) & (wire208 ?
                  (8'hb2) : wire201))) << (~($signed(wire207) >= (7'h44)))));
              reg224 <= wire198;
              reg225 <= ($unsigned(reg218) ?
                  wire207 : {reg224, (~|$signed($unsigned(wire198)))});
            end
          else
            begin
              reg222 <= (reg218 ?
                  reg219[(5'h10):(2'h2)] : {wire210,
                      ((wire202 | {(8'hbf), wire201}) ?
                          reg223[(2'h3):(2'h2)] : wire200)});
              reg223 <= wire211;
              reg224 <= wire211;
            end
        end
      if ((~^wire210[(3'h4):(1'h1)]))
        begin
          reg226 <= $unsigned(($unsigned($signed((reg221 - reg225))) == $unsigned(wire199[(5'h10):(1'h1)])));
          reg227 <= wire205[(1'h1):(1'h1)];
          reg228 <= $unsigned({wire217[(4'h8):(3'h5)]});
          reg229 <= (~^(wire211 ^~ $signed(wire208[(3'h4):(2'h3)])));
          reg230 <= ($unsigned({wire207}) ?
              ((~&{{wire209, wire213}}) < (wire205[(2'h2):(2'h2)] ?
                  wire205 : ($unsigned(wire210) >> (wire216 ?
                      wire205 : wire213)))) : wire215[(1'h1):(1'h0)]);
        end
      else
        begin
          reg226 <= reg225;
          reg227 <= (~&wire202[(3'h6):(1'h0)]);
          reg228 <= reg221[(1'h1):(1'h1)];
          reg229 <= (~|$signed($signed((&(!wire198)))));
          reg230 <= reg222;
        end
      reg231 <= {$signed(wire202),
          ((~^$unsigned(reg229[(2'h2):(2'h2)])) & (|$unsigned((~&reg222))))};
    end
endmodule

module module125  (y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h2f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire129;
  input wire signed [(4'h9):(1'h0)] wire128;
  input wire [(2'h3):(1'h0)] wire127;
  input wire signed [(4'h8):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire192;
  wire signed [(3'h5):(1'h0)] wire191;
  wire [(5'h10):(1'h0)] wire186;
  wire signed [(5'h10):(1'h0)] wire185;
  wire [(5'h10):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire170;
  wire signed [(2'h3):(1'h0)] wire169;
  wire [(3'h6):(1'h0)] wire168;
  wire [(4'ha):(1'h0)] wire167;
  wire [(5'h12):(1'h0)] wire149;
  wire signed [(4'h9):(1'h0)] wire148;
  wire signed [(5'h15):(1'h0)] wire147;
  wire [(5'h13):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire139;
  reg [(3'h5):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg187 = (1'h0);
  reg [(4'hf):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg182 = (1'h0);
  reg [(5'h12):(1'h0)] reg181 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg180 = (1'h0);
  reg [(4'hc):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg signed [(4'he):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg [(4'hc):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(4'h8):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg161 = (1'h0);
  reg [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(4'he):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire186,
                 wire185,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire149,
                 wire148,
                 wire147,
                 wire141,
                 wire140,
                 wire139,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg130 <= wire126;
      if ({($unsigned((((8'hb1) ~^ wire127) ?
                  (wire127 ? wire126 : wire128) : wire129[(2'h2):(1'h1)])) ?
              $signed($unsigned(reg130[(1'h1):(1'h0)])) : {reg130[(1'h1):(1'h1)],
                  wire128[(3'h4):(2'h2)]})})
        begin
          reg131 <= wire129;
          if ((-wire129))
            begin
              reg132 <= $unsigned((-wire129[(4'he):(2'h2)]));
              reg133 <= {wire128};
              reg134 <= wire129[(2'h3):(2'h2)];
              reg135 <= ($unsigned((((reg130 ?
                      wire126 : reg134) <= (reg131 >= reg132)) ?
                  $signed((reg131 >= wire127)) : $unsigned($unsigned(reg132)))) ~^ $unsigned($unsigned(wire126[(3'h4):(2'h2)])));
              reg136 <= (|wire126[(3'h5):(3'h5)]);
            end
          else
            begin
              reg132 <= $signed($unsigned($unsigned(($unsigned(reg130) ^ wire128))));
              reg133 <= wire127;
            end
          reg137 <= $unsigned(reg136[(1'h1):(1'h1)]);
        end
      else
        begin
          reg131 <= (+$unsigned($unsigned($unsigned($signed(wire128)))));
        end
      reg138 <= ((~|reg132) ?
          wire129 : (^~{$unsigned((reg136 ? (8'ha9) : (8'hbc)))}));
    end
  assign wire139 = $signed((^~{reg133, reg131}));
  assign wire140 = ((((7'h41) ?
                               (^~(reg131 ?
                                   wire129 : wire127)) : $signed((8'hba))) ?
                           (8'ha4) : {((wire128 || reg132) > (reg137 + wire128)),
                               $unsigned($signed(reg130))}) ?
                       wire126[(4'h8):(3'h4)] : reg136);
  assign wire141 = (reg138[(3'h7):(3'h4)] ?
                       $unsigned($signed({(wire127 <= wire140),
                           wire140})) : ({$unsigned((8'hb5))} ^ ($unsigned((wire129 ?
                           reg137 : (8'h9c))) <= $unsigned((wire139 ?
                           reg138 : reg130)))));
  always
    @(posedge clk) begin
      reg142 <= reg135[(2'h3):(2'h2)];
      reg143 <= reg131[(1'h1):(1'h1)];
      reg144 <= ($signed(reg133) >= $signed($unsigned((-$signed((8'h9c))))));
    end
  always
    @(posedge clk) begin
      reg145 <= (reg133[(1'h0):(1'h0)] + ((|reg135) > $unsigned((8'h9d))));
      reg146 <= ((7'h43) ?
          (^~{(~wire140)}) : ($signed(reg134[(1'h1):(1'h0)]) == (wire140 | (reg136 * ((8'h9d) ^~ reg145)))));
    end
  assign wire147 = (|{(wire127[(1'h1):(1'h1)] && $unsigned(reg137))});
  assign wire148 = wire126[(2'h2):(1'h0)];
  assign wire149 = {$signed(reg133), (|$unsigned(reg146[(4'hb):(3'h5)]))};
  always
    @(posedge clk) begin
      reg150 <= wire147[(3'h5):(2'h3)];
      reg151 <= wire149[(4'h9):(2'h2)];
      reg152 <= {(7'h42),
          $signed(((~^reg150[(3'h4):(1'h1)]) ?
              $unsigned($signed(reg137)) : {$unsigned((8'hac)),
                  (wire147 ? reg145 : reg131)}))};
      if ((~^wire128))
        begin
          reg153 <= $unsigned((reg143 ?
              wire149[(3'h7):(3'h5)] : reg142[(2'h3):(1'h0)]));
        end
      else
        begin
          if (reg142)
            begin
              reg153 <= (~&{$unsigned(wire148[(1'h0):(1'h0)]),
                  (wire140[(3'h4):(3'h4)] != wire140[(4'h8):(1'h0)])});
              reg154 <= reg132;
            end
          else
            begin
              reg153 <= $signed(reg144);
              reg154 <= (reg133[(2'h3):(1'h1)] ?
                  {$unsigned($unsigned((reg136 ?
                          (8'hbc) : (8'h9f))))} : (((^(reg144 - reg137)) == reg146[(3'h4):(2'h3)]) == ($unsigned({reg146}) ?
                      wire126[(1'h0):(1'h0)] : $unsigned({(8'ha0)}))));
            end
          if (reg152)
            begin
              reg155 <= reg136[(4'hc):(2'h2)];
              reg156 <= reg130[(3'h6):(3'h4)];
              reg157 <= ($unsigned(reg137[(3'h4):(2'h3)]) != $unsigned(reg134));
              reg158 <= (({(~(~&reg130))} || $unsigned($signed(wire147))) == (8'hb1));
              reg159 <= (&$signed(($unsigned({reg153}) ?
                  reg143[(3'h5):(1'h1)] : reg143)));
            end
          else
            begin
              reg155 <= ({(^$unsigned(reg158))} ?
                  (!(-reg156)) : ((^($signed(wire129) <<< reg157[(3'h4):(1'h0)])) ?
                      (($unsigned(reg130) * (reg155 ^ (8'hb4))) - reg144[(4'hb):(4'h9)]) : (8'ha3)));
              reg156 <= (~(!(reg134 ?
                  $unsigned($unsigned(reg132)) : $unsigned(reg157))));
              reg157 <= reg155[(2'h3):(1'h0)];
            end
          if ($signed(($unsigned($signed((reg153 ?
              reg151 : reg143))) >>> ($unsigned({(8'ha5),
              reg136}) ^ $unsigned((wire148 << reg137))))))
            begin
              reg160 <= {((~^reg130[(3'h4):(1'h0)]) ?
                      {reg137[(1'h0):(1'h0)],
                          (|reg132[(2'h3):(2'h2)])} : (~|$unsigned($unsigned(reg153))))};
              reg161 <= $signed($unsigned((~|(&reg160))));
              reg162 <= wire148[(2'h3):(2'h2)];
              reg163 <= $unsigned(wire149[(3'h6):(3'h5)]);
            end
          else
            begin
              reg160 <= {((~^wire127[(1'h1):(1'h1)]) ~^ {((reg143 <<< reg156) - reg162),
                      ((~&reg142) ? reg152 : reg159[(4'hf):(2'h2)])}),
                  reg160};
              reg161 <= (&(reg159[(4'h9):(3'h4)] * $signed(((~|reg137) || $unsigned(wire139)))));
              reg162 <= $unsigned($unsigned($unsigned($unsigned(wire126[(3'h7):(3'h5)]))));
              reg163 <= (~&$signed(((~(reg145 ?
                  (8'hac) : reg156)) + (+$signed(reg143)))));
              reg164 <= $unsigned((wire147[(4'hf):(4'hf)] ~^ reg150));
            end
          reg165 <= reg142[(3'h4):(2'h3)];
          reg166 <= $signed(reg158[(1'h1):(1'h1)]);
        end
    end
  assign wire167 = $signed(($signed(wire127) ?
                       $unsigned(($unsigned(wire127) - (reg161 ?
                           reg137 : reg138))) : $unsigned({{wire139,
                               reg156}})));
  assign wire168 = (($unsigned((reg155[(4'ha):(1'h1)] ?
                           $unsigned(reg152) : $unsigned(wire126))) ?
                       $signed($signed($unsigned(reg150))) : (wire128 <= $signed((-wire167)))) | ($unsigned((reg138 ?
                       (reg165 - reg153) : $unsigned((8'hbc)))) + reg161[(2'h3):(1'h1)]));
  assign wire169 = (($unsigned(reg164[(3'h4):(2'h3)]) - $signed(wire148[(3'h5):(3'h4)])) ?
                       (+reg158) : reg131);
  assign wire170 = ((~^{$unsigned(((8'hb6) == (8'hb0))),
                       $unsigned(((8'haf) ? reg133 : reg137))}) >> (8'h9f));
  assign wire171 = $signed(wire168[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      reg172 <= $signed((($unsigned((wire128 ?
          (7'h44) : reg131)) + $unsigned((+wire140))) || $unsigned(wire129)));
      if (($unsigned(reg165[(3'h7):(2'h3)]) ?
          wire149[(5'h11):(4'he)] : {{reg161},
              (((reg159 ? (8'h9d) : reg160) ? (!wire170) : $unsigned(wire129)) ?
                  wire171 : {(reg159 <<< (8'haf))})}))
        begin
          if ($signed({$signed(reg159[(4'he):(4'hb)]),
              ((-(~|wire170)) ^~ $signed(reg133[(2'h3):(1'h0)]))}))
            begin
              reg173 <= (+(($signed((wire167 | reg166)) >> reg155[(1'h0):(1'h0)]) ^~ ($unsigned(reg133[(1'h0):(1'h0)]) ?
                  (reg134 ?
                      $signed(reg135) : $signed(reg150)) : (wire140 == (reg150 << wire141)))));
              reg174 <= wire149;
              reg175 <= ({reg159[(4'hb):(4'ha)], (+wire127[(1'h1):(1'h0)])} ?
                  (|(8'h9f)) : {$signed((~&$signed(reg157))),
                      $unsigned($signed(reg145[(2'h3):(2'h2)]))});
            end
          else
            begin
              reg173 <= $signed($signed(($signed(wire126) ?
                  reg173 : $signed(wire140))));
            end
        end
      else
        begin
          reg173 <= (^$unsigned($signed(((reg134 == (8'hb9)) ?
              (reg146 == reg154) : reg174[(4'h8):(1'h0)]))));
          if ((+$unsigned(($signed((reg156 <= (8'ha2))) ?
              reg156[(3'h5):(1'h1)] : reg153[(1'h1):(1'h0)]))))
            begin
              reg174 <= $signed(reg150);
            end
          else
            begin
              reg174 <= ($unsigned((!{reg151, (8'hbc)})) ^ reg143);
              reg175 <= ((-(($signed((8'haf)) < $unsigned(wire167)) ?
                      (~&(7'h42)) : {reg151, (reg154 == reg166)})) ?
                  $unsigned($signed((reg134 ~^ reg136[(2'h2):(2'h2)]))) : $signed((8'hab)));
              reg176 <= ({$unsigned((|reg142))} ?
                  (reg151 ^~ $signed((((8'haa) ? wire148 : reg133) ?
                      reg172[(4'he):(4'ha)] : (^wire167)))) : $signed(wire170));
              reg177 <= wire139;
            end
          if (wire149[(4'h8):(2'h3)])
            begin
              reg178 <= reg155[(4'hb):(2'h3)];
              reg179 <= wire140[(4'h9):(1'h0)];
            end
          else
            begin
              reg178 <= reg151;
              reg179 <= {($signed(reg145) && reg135)};
              reg180 <= ($signed(($signed((-wire149)) <= $signed(reg142[(3'h4):(2'h2)]))) ?
                  wire126[(1'h1):(1'h1)] : (&$signed(reg175)));
              reg181 <= $unsigned(wire139[(4'hd):(4'ha)]);
            end
          reg182 <= reg145[(4'h9):(4'h8)];
          reg183 <= {$signed((~|reg182)), (~|reg131[(5'h11):(4'h9)])};
        end
      reg184 <= {(($unsigned(reg175[(4'he):(3'h4)]) & ($unsigned((8'hb1)) ?
                  reg144 : (reg155 >> reg164))) ?
              (8'hb6) : {reg137, ((|reg175) ? (+wire139) : (|(8'h9d)))})};
    end
  assign wire185 = $unsigned(reg175[(3'h6):(1'h0)]);
  assign wire186 = reg156[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg187 <= wire185[(4'he):(3'h6)];
      reg188 <= $unsigned($unsigned($signed($unsigned((reg178 != wire147)))));
      reg189 <= (reg161[(2'h2):(1'h0)] ?
          wire127[(2'h2):(1'h1)] : $signed($unsigned((-(reg130 && wire129)))));
      reg190 <= $signed($signed(((reg176[(3'h5):(3'h4)] & reg152) ?
          {(~^reg154)} : $signed(reg164))));
    end
  assign wire191 = (({(8'h9f)} & $signed({$signed(wire140),
                       reg188[(3'h4):(1'h0)]})) != {(^~($signed((8'hb5)) && $signed(wire170))),
                       (({wire169, (8'hba)} ?
                               ((8'hbc) ?
                                   (8'hb0) : reg152) : $signed((8'hbb))) ?
                           reg135 : ((&(8'h9d)) ?
                               (!wire185) : wire167[(4'h9):(3'h4)]))});
  assign wire192 = ($signed($signed(($signed((8'haa)) - $signed(reg190)))) & (reg172[(4'hc):(4'hc)] ^~ (reg156 < ($signed(reg156) ?
                       $unsigned(reg144) : reg138))));
endmodule

module module111
#(parameter param120 = (~((+((&(8'hb8)) >> (8'hba))) || (~({(8'hb8)} ? (~|(8'hb2)) : ((8'hb4) ? (8'hb4) : (8'ha8)))))), 
parameter param121 = (!(^(-(param120 ? {param120} : (param120 * param120))))))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire115;
  input wire signed [(4'hf):(1'h0)] wire114;
  input wire signed [(5'h15):(1'h0)] wire113;
  input wire signed [(5'h13):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  assign y = {wire119, wire118, wire117, wire116, (1'h0)};
  assign wire116 = $signed(wire112);
  assign wire117 = ($unsigned(wire113) ?
                       wire112[(4'hc):(4'hc)] : $unsigned({$signed($signed(wire112))}));
  assign wire118 = {$signed((wire115 ?
                           $unsigned(wire116) : ($unsigned(wire112) | wire116[(1'h1):(1'h0)]))),
                       wire113};
  assign wire119 = (-($unsigned(((!wire115) ? $unsigned(wire118) : wire115)) ?
                       $signed($unsigned(wire112)) : (wire112[(4'h9):(1'h0)] ?
                           (wire117[(1'h1):(1'h1)] ^ (wire116 ?
                               wire114 : (8'haf))) : $unsigned((~^wire117)))));
endmodule

module module48
#(parameter param108 = ((^~((((8'hb8) - (8'hab)) ? ((8'ha5) ? (8'haa) : (8'ha8)) : ((7'h40) ? (8'hae) : (7'h40))) == (8'hb0))) ? (((((8'h9f) ? (8'hb9) : (8'hbc)) >= ((8'h9e) ? (8'ha9) : (8'ha4))) ^ (((8'hb4) >> (8'ha4)) << ((8'hbb) && (8'ha7)))) - (8'haa)) : (~&(((^~(8'hb5)) ? (7'h41) : (|(8'ha9))) << (((8'ha3) && (8'hb7)) == ((7'h42) * (8'h9c)))))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire53;
  input wire signed [(2'h2):(1'h0)] wire52;
  input wire [(5'h15):(1'h0)] wire51;
  input wire [(4'h8):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire101,
                 wire100,
                 wire99,
                 wire80,
                 wire79,
                 wire78,
                 wire59,
                 wire58,
                 reg102,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg54 <= (~{$signed(((wire50 ? wire50 : wire53) ~^ $signed(wire52))),
          wire53[(2'h2):(1'h1)]});
      reg55 <= $unsigned(((~$unsigned((reg54 ? wire51 : wire50))) ?
          ((&reg54) ?
              $signed($unsigned(reg54)) : $signed({wire50,
                  (8'ha3)})) : $unsigned(wire53[(2'h3):(2'h2)])));
      reg56 <= (8'hb1);
      reg57 <= (reg55[(4'hb):(1'h1)] ?
          wire53[(3'h4):(2'h2)] : $signed(($unsigned((wire53 ^ wire53)) ?
              (reg54[(5'h11):(3'h6)] ?
                  (8'ha2) : (~&wire52)) : (^~(wire53 << reg56)))));
    end
  assign wire58 = ((&reg54[(3'h5):(2'h2)]) ?
                      (~&{$signed($unsigned(wire51))}) : (8'h9c));
  assign wire59 = (wire53 <= {wire58});
  always
    @(posedge clk) begin
      reg60 <= wire58[(4'hc):(3'h4)];
      if ((~^$signed($signed((^~$unsigned(wire50))))))
        begin
          reg61 <= wire49;
          if (($unsigned((~&(^~wire49[(1'h0):(1'h0)]))) >> $signed((8'hae))))
            begin
              reg62 <= $signed($signed(reg54));
              reg63 <= reg55[(4'ha):(2'h2)];
              reg64 <= ({$unsigned((-(!reg56))), (8'ha1)} ?
                  ({(^~wire49[(3'h6):(2'h2)])} >>> wire51) : (&($signed(wire58[(4'he):(3'h5)]) ?
                      reg56 : {(reg57 ? wire51 : reg61), {(7'h43), wire49}})));
              reg65 <= reg61[(2'h2):(1'h1)];
            end
          else
            begin
              reg62 <= $signed($signed((8'ha2)));
              reg63 <= wire49[(1'h1):(1'h1)];
              reg64 <= $signed((~^reg57[(1'h0):(1'h0)]));
            end
          if (wire50)
            begin
              reg66 <= ((reg56 ?
                      ((wire51[(2'h3):(2'h2)] || reg60[(3'h5):(1'h0)]) ?
                          (wire49[(3'h5):(3'h4)] ?
                              $unsigned(reg63) : reg56[(5'h13):(3'h6)]) : wire49[(2'h3):(2'h3)]) : $signed(({wire59} ?
                          $signed(reg61) : $unsigned(wire52)))) ?
                  reg64 : (8'hb5));
              reg67 <= reg66[(1'h1):(1'h1)];
              reg68 <= (reg60 ?
                  (reg54 ?
                      $signed(reg56[(4'hc):(2'h3)]) : (|($unsigned(reg64) & reg61))) : wire58[(2'h2):(2'h2)]);
              reg69 <= ((-(wire59 <<< (~^((8'hb3) ? wire59 : wire49)))) ?
                  reg56[(4'h9):(4'h9)] : $unsigned(({$signed(wire51),
                          $signed(reg60)} ?
                      (!{wire50, reg55}) : ({reg63, reg61} ?
                          reg54[(2'h2):(2'h2)] : (reg54 < wire49)))));
              reg70 <= wire53[(1'h1):(1'h0)];
            end
          else
            begin
              reg66 <= ($unsigned((((|wire51) << $unsigned(wire50)) || (!$signed(reg61)))) ?
                  ($signed(reg62[(5'h10):(4'hd)]) & reg67[(2'h2):(1'h1)]) : ((8'hb3) ^~ (-reg66[(3'h6):(1'h0)])));
              reg67 <= $unsigned({reg65[(3'h6):(3'h5)], wire58[(4'hf):(2'h2)]});
              reg68 <= wire53;
              reg69 <= ($signed(reg60[(4'h8):(3'h7)]) ?
                  reg56[(4'hf):(4'h9)] : ($unsigned(reg66) || $signed(reg66[(4'hc):(3'h4)])));
              reg70 <= reg67[(2'h2):(2'h2)];
            end
          reg71 <= (wire51[(4'hd):(2'h2)] ?
              (reg67 >>> reg64) : {($signed($unsigned(reg55)) ? reg68 : wire51),
                  ($unsigned((reg69 && reg62)) ?
                      ($unsigned(wire58) ?
                          wire53[(1'h0):(1'h0)] : $unsigned(reg57)) : reg55)});
        end
      else
        begin
          reg61 <= reg66[(2'h2):(2'h2)];
          reg62 <= $signed($unsigned((((reg61 == (8'ha6)) << $signed(wire49)) ?
              (~(reg69 >= wire50)) : (8'hac))));
          reg63 <= {$signed((wire51 ?
                  $signed((reg63 ? reg68 : wire59)) : reg71[(3'h5):(3'h5)])),
              ((reg67 ?
                  ((reg54 ? wire52 : reg54) ?
                      (&reg71) : reg66[(3'h6):(3'h5)]) : $signed((8'hb1))) == (+((7'h43) & $unsigned(wire50))))};
        end
      reg72 <= $unsigned($unsigned(((+reg68) > reg62)));
      reg73 <= ((&$signed((~^wire59[(1'h1):(1'h0)]))) ?
          ((8'h9f) <= $unsigned($unsigned($unsigned((8'ha5))))) : ($signed((|(reg70 ?
              wire51 : reg64))) && (($signed(reg66) ?
                  reg70[(3'h5):(1'h0)] : (|reg60)) ?
              {reg54[(4'he):(1'h1)]} : $signed($signed(wire51)))));
      if ($signed(reg65[(5'h10):(3'h4)]))
        begin
          reg74 <= wire49;
        end
      else
        begin
          if (wire50[(1'h0):(1'h0)])
            begin
              reg74 <= (8'h9e);
              reg75 <= (-$signed($signed($signed((reg64 ? reg68 : reg64)))));
              reg76 <= reg71[(1'h1):(1'h0)];
            end
          else
            begin
              reg74 <= (($unsigned((~|reg75)) - $unsigned(reg60[(4'h9):(4'h8)])) ?
                  $signed(((8'had) ~^ $unsigned(reg65))) : (8'hbd));
              reg75 <= (!{(+reg60[(1'h0):(1'h0)]),
                  ($signed((reg74 ~^ wire51)) >>> {wire52})});
            end
          reg77 <= reg63;
        end
    end
  assign wire78 = $unsigned($unsigned(reg63[(3'h5):(3'h5)]));
  assign wire79 = ({$signed($signed((reg60 ^ reg71)))} > {(reg70 < (reg66[(3'h6):(3'h4)] ?
                          $signed(wire53) : {(8'hb2)}))});
  assign wire80 = ($unsigned(((reg70 <= $unsigned(reg72)) ?
                          (7'h44) : ($unsigned((8'hab)) ^~ (reg57 <<< reg76)))) ?
                      (^~reg54) : ($unsigned(($unsigned(reg75) ?
                          (+reg63) : {wire58,
                              reg72})) - (!reg75[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg81 <= reg76;
      if ({(reg73 > $unsigned(reg81[(2'h3):(2'h3)]))})
        begin
          reg82 <= {(reg64 ?
                  (!(^~$signed(reg74))) : $signed(reg76[(3'h7):(3'h7)]))};
          if ((8'hb6))
            begin
              reg83 <= ((((wire53 ? reg72 : (~^wire52)) & ((reg57 ~^ (7'h44)) ?
                  (8'hb9) : wire49)) <= (wire59[(2'h3):(1'h0)] ?
                  $signed((8'hb9)) : reg70[(1'h1):(1'h0)])) + ((((!reg66) > (+wire50)) ?
                      $signed(reg66[(2'h3):(2'h3)]) : $signed((wire51 ?
                          wire50 : reg68))) ?
                  {$unsigned({reg71, reg68}),
                      reg63[(4'hf):(4'hb)]} : $unsigned(((-wire59) ?
                      {wire50, wire79} : (wire53 ? wire49 : reg70)))));
              reg84 <= (8'ha2);
              reg85 <= (reg81 | (~|reg82[(2'h3):(1'h0)]));
              reg86 <= $unsigned($signed((~&(^{reg69}))));
            end
          else
            begin
              reg83 <= ($signed($unsigned(reg55[(1'h1):(1'h1)])) << (wire79 || $signed((&(^reg83)))));
              reg84 <= (~|$unsigned($signed({reg64[(2'h2):(1'h0)]})));
              reg85 <= $signed(wire53[(1'h1):(1'h1)]);
              reg86 <= reg75;
              reg87 <= reg67;
            end
          if (reg86)
            begin
              reg88 <= $unsigned($signed(($signed($unsigned(reg75)) ?
                  $unsigned(((8'h9e) ? reg61 : reg57)) : $unsigned(reg57))));
            end
          else
            begin
              reg88 <= reg71;
              reg89 <= (~|($signed(((^reg65) ?
                  reg81 : reg85[(1'h1):(1'h0)])) >= $signed({$unsigned(wire52)})));
              reg90 <= $unsigned(wire51);
              reg91 <= (reg62[(1'h0):(1'h0)] >>> (+{reg76}));
            end
          reg92 <= reg89[(1'h0):(1'h0)];
          if (($signed($unsigned(reg65[(1'h0):(1'h0)])) && ({{(&reg73)}} ?
              ((~|(wire51 * reg91)) ?
                  ((wire53 * (8'hb7)) ?
                      (~&wire53) : reg66[(4'hb):(3'h5)]) : ((reg89 ?
                      reg69 : reg86) <= ((8'hae) ?
                      wire59 : wire80))) : $unsigned($unsigned((reg67 ?
                  wire52 : wire51))))))
            begin
              reg93 <= reg62[(1'h1):(1'h1)];
            end
          else
            begin
              reg93 <= $unsigned({($unsigned(reg72) * ((reg77 ?
                          wire49 : reg66) ?
                      (~^reg76) : $signed(wire50))),
                  $unsigned(({(8'ha1)} <= $signed(reg55)))});
              reg94 <= (+reg89[(1'h0):(1'h0)]);
              reg95 <= reg60[(4'hc):(3'h6)];
              reg96 <= (|$signed(reg74));
              reg97 <= {(^(8'hb4)),
                  (({wire51[(5'h10):(3'h5)], $signed((7'h42))} ?
                          (-$unsigned(reg73)) : $unsigned(reg90)) ?
                      $unsigned(wire52) : {(~(reg77 >>> reg69)),
                          $unsigned(reg76[(4'he):(2'h3)])})};
            end
        end
      else
        begin
          if ($signed(reg87[(1'h0):(1'h0)]))
            begin
              reg82 <= $unsigned(((wire59[(1'h1):(1'h1)] - $signed((~reg65))) ?
                  {(|$signed(reg66))} : {($unsigned((8'ha1)) ^ $unsigned(wire53))}));
              reg83 <= reg87;
            end
          else
            begin
              reg82 <= $signed($signed($signed(reg95)));
              reg83 <= $unsigned($signed(reg86));
              reg84 <= ((8'hb3) && (wire53[(1'h1):(1'h0)] ?
                  reg71[(4'h9):(3'h6)] : ((~|(reg71 ?
                      reg64 : reg97)) < $signed((reg70 ? wire53 : reg95)))));
              reg85 <= reg72;
              reg86 <= (&(({reg62[(4'h8):(3'h7)],
                      (wire49 <= reg70)} | $unsigned($unsigned(reg71))) ?
                  $signed(($signed(reg66) ?
                      (~|wire79) : (reg61 | reg76))) : (((8'hb8) ?
                      reg83[(3'h7):(3'h7)] : $signed(reg88)) > (~^{reg86}))));
            end
        end
      reg98 <= (((~|$signed(reg64[(1'h0):(1'h0)])) ^~ reg77) ?
          ((7'h43) * {$unsigned((reg92 < reg64))}) : reg71[(4'hc):(3'h5)]);
    end
  assign wire99 = (|$signed((^reg71[(4'h8):(4'h8)])));
  assign wire100 = $unsigned($signed((^~$unsigned((reg92 ? reg55 : reg90)))));
  assign wire101 = reg69;
  always
    @(posedge clk) begin
      reg102 <= reg77[(4'h8):(3'h4)];
    end
  assign wire103 = (~^(!$unsigned(reg86)));
  assign wire104 = $unsigned($signed((+((!(8'h9f)) << $unsigned(reg92)))));
  assign wire105 = $unsigned(reg82[(4'h9):(1'h1)]);
  assign wire106 = {$signed(({reg95[(3'h5):(1'h0)]} < ($signed(reg77) != $unsigned(reg70))))};
  assign wire107 = $signed(wire51);
endmodule
