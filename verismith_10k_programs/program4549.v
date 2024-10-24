module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire187;
  wire [(4'hb):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire185;
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire187,
                 wire35,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire185,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0;
      reg5 <= ((reg4 ?
          (($unsigned(wire0) ? $signed(wire1) : ((8'hbb) ? wire0 : (7'h43))) ?
              ((wire1 ? wire0 : wire0) != $signed((8'hab))) : (+(wire1 ?
                  reg4 : wire3))) : $signed(($unsigned(wire1) ?
              reg4[(5'h10):(3'h6)] : (wire3 - wire0)))) <<< (&{$signed((!reg4))}));
    end
  module6 #() modinst36 (wire35, clk, reg5, reg4, wire2, wire1);
  assign wire37 = $unsigned((($signed($signed((8'ha9))) ^ wire0) & wire1));
  assign wire38 = $unsigned((!((^(~&wire3)) ?
                      $signed(wire1[(3'h5):(2'h2)]) : reg4[(4'hf):(4'ha)])));
  assign wire39 = $signed(wire0[(4'h8):(3'h5)]);
  assign wire40 = wire39[(1'h0):(1'h0)];
  assign wire41 = $signed(wire2);
  assign wire42 = (wire0[(2'h2):(1'h1)] << (reg5 <= (^~(reg4[(4'hc):(2'h3)] ?
                      (wire0 <= wire3) : $unsigned(reg5)))));
  always
    @(posedge clk) begin
      reg43 <= wire37[(5'h13):(4'hc)];
      if ((({{(+wire42)}} ? $signed((^(8'ha2))) : wire37) ?
          (-reg4) : $signed(($signed(((8'hbf) >= wire38)) < reg43))))
        begin
          reg44 <= (wire0[(3'h5):(3'h5)] ?
              (wire40[(1'h0):(1'h0)] ^ (~&(!(reg4 - wire41)))) : (8'haf));
        end
      else
        begin
          if (($signed($signed(((^wire38) ^ $signed(wire1)))) * $signed(($signed((-(8'hac))) ?
              $unsigned(wire35) : (!{(8'ha7), wire42})))))
            begin
              reg44 <= ($signed(({$signed(reg43)} ?
                  wire39 : ((8'h9d) ?
                      {wire40, wire35} : (wire40 ?
                          reg4 : wire39)))) || (((+(8'hac)) ?
                  $signed({wire38,
                      wire39}) : ($unsigned(wire2) | $unsigned((8'hb5)))) > $unsigned(((^(8'ha1)) ?
                  (wire41 ? wire0 : wire0) : wire41[(4'h8):(3'h4)]))));
              reg45 <= (reg43 ?
                  ($signed($signed((wire38 << (8'ha7)))) ?
                      (((~(8'hae)) ?
                          {wire41,
                              wire40} : (wire40 ~^ wire0)) << wire1) : $signed(reg44)) : reg5);
            end
          else
            begin
              reg44 <= (+wire0);
              reg45 <= {$signed((wire40 ? wire41 : wire2[(3'h5):(2'h2)]))};
            end
          reg46 <= ($unsigned(((reg44[(1'h1):(1'h1)] < wire40) | $unsigned((wire1 * (8'hab))))) == {({$signed(wire2)} >= $unsigned((wire0 ^~ reg4)))});
          reg47 <= (((~&((wire3 | wire35) ? (~&wire41) : reg45)) ?
              wire2[(2'h3):(2'h2)] : wire41[(4'hb):(3'h5)]) << (wire1[(4'h8):(2'h2)] ?
              (|reg5[(4'h8):(3'h6)]) : (reg46 ?
                  (!$unsigned(wire37)) : ($unsigned(wire37) ~^ $unsigned(wire39)))));
          if ($signed(($unsigned((((8'had) ? wire2 : wire38) || (-wire40))) ?
              (((~&reg44) ? (8'had) : (wire41 && wire38)) ?
                  {(reg43 ? wire37 : wire42),
                      $signed(wire38)} : $signed(wire39[(2'h2):(1'h0)])) : (^~(~reg45[(4'hb):(4'h8)])))))
            begin
              reg48 <= $signed($signed((8'had)));
              reg49 <= wire38;
              reg50 <= $unsigned($signed(({((8'h9e) ? wire2 : reg47),
                  (wire40 - reg46)} <= {$signed(wire41), reg4})));
              reg51 <= reg47[(1'h0):(1'h0)];
            end
          else
            begin
              reg48 <= reg49;
              reg49 <= (wire41 ^ {(8'hb7)});
            end
        end
      reg52 <= $unsigned($unsigned({$signed(wire1[(5'h12):(5'h10)])}));
    end
  always
    @(posedge clk) begin
      reg53 <= ($signed(($unsigned(wire40) ?
              (reg50 ?
                  (wire0 ? reg5 : wire42) : {(8'ha9),
                      reg50}) : (|$unsigned(reg46)))) ?
          wire0 : reg51);
    end
  assign wire54 = (~|wire1);
  assign wire55 = (+($unsigned((wire54 ? wire38 : (~|wire38))) ?
                      (+wire39[(3'h5):(2'h2)]) : reg47[(4'he):(3'h6)]));
  assign wire56 = reg4;
  assign wire57 = $unsigned(wire2[(4'h8):(3'h4)]);
  assign wire58 = reg5[(4'hc):(4'ha)];
  assign wire59 = ((&{$signed($signed(wire39))}) ?
                      $signed(((~&wire38) ~^ (^$signed(wire54)))) : $unsigned(reg47[(4'hd):(4'hc)]));
  module60 #() modinst186 (wire185, clk, wire41, wire40, reg53, reg49, wire56);
  assign wire187 = wire42[(3'h4):(3'h4)];
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire65;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  input wire signed [(3'h4):(1'h0)] wire62;
  input wire signed [(4'hd):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire184;
  wire [(4'hb):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire134;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire [(4'h8):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire182;
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  assign y = {wire184,
                 wire170,
                 wire136,
                 wire134,
                 wire92,
                 wire91,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire182,
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
                 (1'h0)};
  assign wire66 = (8'ha5);
  assign wire67 = $signed((~|wire61[(3'h7):(1'h1)]));
  assign wire68 = ($unsigned($unsigned($signed({wire61, (8'hb4)}))) ?
                      $unsigned(wire65) : ($unsigned(wire65) ?
                          $unsigned(wire63) : wire66[(2'h2):(1'h1)]));
  assign wire69 = $signed(wire64);
  assign wire70 = $unsigned(((($signed(wire64) ?
                              (wire63 ? wire67 : wire65) : (&wire67)) ?
                          $signed((&wire65)) : wire65[(3'h5):(3'h5)]) ?
                      ((~{(8'had), (7'h42)}) >> ((8'haa) ?
                          $signed(wire66) : (wire64 ?
                              (8'hae) : wire67))) : ($unsigned((~^wire68)) + (8'h9d))));
  assign wire71 = wire63;
  assign wire72 = (&(({wire70[(2'h3):(1'h1)], $signed(wire69)} ?
                      ((wire63 ? wire70 : wire63) ?
                          (|wire68) : {wire62,
                              wire66}) : ((^wire67) ^ wire70)) >= $signed($signed(wire71[(3'h6):(3'h4)]))));
  assign wire73 = wire68;
  assign wire74 = $unsigned(wire68[(3'h5):(3'h5)]);
  assign wire75 = (~|{(^wire64)});
  assign wire76 = {(wire63[(3'h4):(2'h3)] != {{wire69[(3'h4):(2'h3)],
                              (wire72 ? wire65 : wire64)},
                          $unsigned($unsigned(wire75))}),
                      wire70[(4'ha):(3'h4)]};
  assign wire77 = $signed(wire70[(4'h8):(3'h5)]);
  assign wire78 = (~|{(wire67[(3'h4):(1'h1)] ?
                          {$signed(wire68),
                              $signed(wire69)} : $signed(wire61[(1'h0):(1'h0)]))});
  always
    @(posedge clk) begin
      reg79 <= ($signed($unsigned(wire77[(3'h6):(3'h5)])) >>> (~&{wire78[(1'h0):(1'h0)],
          {(~&wire73), (wire63 >>> wire72)}}));
      reg80 <= wire73;
      if ($signed((($signed($unsigned((8'ha5))) <= (+$unsigned((8'hb0)))) == (^~(~$unsigned(wire74))))))
        begin
          reg81 <= ($signed(wire71) - wire68[(4'hd):(2'h3)]);
        end
      else
        begin
          if ((+(8'hbc)))
            begin
              reg81 <= (8'ha8);
              reg82 <= (({wire61} ?
                      $signed((wire74 ?
                          (reg79 << wire72) : (-(8'hae)))) : (^(~&wire73[(1'h0):(1'h0)]))) ?
                  {{($signed(wire67) ?
                              ((8'ha7) ?
                                  wire61 : wire72) : $signed(wire77))}} : reg81[(4'hc):(3'h5)]);
              reg83 <= $unsigned($signed($unsigned(reg79)));
              reg84 <= wire64[(2'h2):(2'h2)];
              reg85 <= wire67[(3'h7):(1'h0)];
            end
          else
            begin
              reg81 <= $unsigned((8'ha6));
              reg82 <= $signed(reg82[(3'h4):(2'h3)]);
              reg83 <= wire66;
              reg84 <= wire74[(4'h9):(1'h1)];
              reg85 <= $unsigned($signed({(8'hbe)}));
            end
          reg86 <= ((~|wire61[(4'ha):(4'h9)]) ?
              ($unsigned($signed($unsigned(wire61))) ?
                  ($unsigned({wire74,
                      reg83}) <<< (-wire63[(3'h5):(2'h3)])) : wire64[(4'h8):(3'h5)]) : ((^~((^~wire72) ?
                  $unsigned(reg83) : (^(8'hab)))) << {(8'hb0)}));
          reg87 <= {(~|{(reg81 ? {wire63, wire71} : {reg80, wire78}),
                  (^$signed(wire69))}),
              reg79};
        end
      reg88 <= reg80[(2'h2):(2'h2)];
      if ((wire61 ?
          {{wire71[(2'h2):(1'h0)],
                  ($signed(reg82) << (reg86 ?
                      wire65 : wire71))}} : ($unsigned(wire67[(3'h5):(1'h0)]) ?
              $unsigned($signed((&wire78))) : wire61[(3'h6):(2'h3)])))
        begin
          reg89 <= $unsigned(wire69);
          reg90 <= $unsigned(reg87);
        end
      else
        begin
          reg89 <= ((((^~reg90[(2'h2):(2'h2)]) ?
              ((~^reg84) ?
                  ((8'hb3) ?
                      wire70 : wire72) : wire78) : wire64[(5'h12):(4'hb)]) == (wire64 ?
              wire61[(4'h8):(1'h1)] : ((&wire62) - (^wire76)))) ^~ ($signed(($signed(wire61) | ((8'hac) << wire71))) ?
              $signed({(wire64 ? reg84 : wire68),
                  reg89[(3'h5):(3'h4)]}) : $unsigned(({wire76} >>> reg88[(1'h0):(1'h0)]))));
        end
    end
  assign wire91 = reg86;
  assign wire92 = $signed(wire76[(1'h0):(1'h0)]);
  module93 #() modinst135 (wire134, clk, wire66, reg90, wire68, wire72, wire61);
  assign wire136 = {$signed($signed((8'ha6))), wire65};
  module137 #() modinst171 (.wire138(wire65), .clk(clk), .wire142(reg79), .wire139(reg84), .wire140(wire91), .y(wire170), .wire141(wire68));
  module172 #() modinst183 (wire182, clk, wire136, wire92, wire72, reg87);
  assign wire184 = ($signed((wire62[(1'h1):(1'h1)] - ({(7'h42), (8'hbd)} ?
                       (^~reg86) : $signed(wire64)))) > $signed((wire182 ?
                       ($unsigned(reg84) ?
                           {wire69} : $signed(wire72)) : reg86)));
endmodule

module module6
#(parameter param33 = (({{((8'hab) ? (8'ha6) : (8'ha0)), ((8'hbe) ? (8'hb5) : (8'had))}, (^((8'hb4) == (8'ha5)))} || (8'ha7)) ? (((~^((8'ha1) > (8'hb8))) >>> (((8'hac) ? (8'hab) : (8'hb7)) * (|(8'ha8)))) ? ({((8'hb9) ? (8'haf) : (8'h9f))} ? ({(8'h9c)} * (~(8'h9c))) : {((8'ha8) ? (8'hb7) : (7'h44)), ((8'hbf) ? (8'hb1) : (8'h9f))}) : ((((8'h9d) ? (8'hae) : (8'hb7)) ? (|(8'hb5)) : ((8'ha0) ? (8'hb9) : (8'ha8))) ? (((8'hb8) ? (8'haa) : (8'hb4)) + {(8'h9f)}) : (((7'h42) ? (8'hac) : (8'hb5)) >= ((8'hab) && (8'ha4))))) : (8'hbb)), 
parameter param34 = (~&(&(~|(^~(^~(8'had)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire11;
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  assign y = {wire11,
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
                 (1'h0)};
  assign wire11 = $unsigned($unsigned(wire8));
  always
    @(posedge clk) begin
      reg12 <= wire11[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ({wire7[(4'hc):(4'h9)], wire7})
        begin
          reg13 <= wire7;
        end
      else
        begin
          if (((wire7[(2'h3):(2'h3)] ?
              reg13 : {wire7}) << ($unsigned($signed(wire7)) + $unsigned($unsigned((wire10 ?
              wire9 : wire10))))))
            begin
              reg13 <= $unsigned(reg12[(2'h3):(2'h2)]);
              reg14 <= $unsigned(wire11[(4'hf):(3'h5)]);
            end
          else
            begin
              reg13 <= {wire11[(3'h5):(2'h3)]};
              reg14 <= $signed((wire11 || reg12));
              reg15 <= $signed(wire8);
            end
          if ($signed(((reg13 << $signed((wire7 == wire7))) ?
              wire8[(3'h5):(3'h5)] : ((((8'ha8) ?
                      reg14 : reg12) != reg12[(3'h4):(2'h2)]) ?
                  ((wire11 ? reg14 : reg12) ?
                      $signed((8'ha7)) : (wire11 ?
                          wire8 : reg13)) : $signed($unsigned(reg15))))))
            begin
              reg16 <= $signed((reg14[(4'hd):(3'h7)] ?
                  ((reg14 ?
                      (wire9 ?
                          (7'h44) : wire11) : $signed(wire10)) ^~ {(~^wire10),
                      reg12[(3'h7):(3'h7)]}) : {(((8'hbf) - reg15) != reg13),
                      (&(wire9 & reg14))}));
              reg17 <= $unsigned(wire10);
              reg18 <= (+(wire8 ? (-wire7[(5'h15):(5'h14)]) : wire11));
              reg19 <= ($signed(reg13[(4'hd):(3'h5)]) ?
                  ($signed($signed(wire7)) ?
                      ((reg14 ? reg13[(4'h8):(1'h1)] : reg18[(1'h0):(1'h0)]) ?
                          (reg18 || $signed(reg13)) : (~$unsigned(reg13))) : $unsigned({(reg14 ?
                              reg15 : reg18)})) : (7'h44));
              reg20 <= wire11[(2'h3):(2'h2)];
            end
          else
            begin
              reg16 <= ((&(((~reg12) <<< $signed(wire11)) ~^ $signed((^~wire10)))) ?
                  (+$unsigned($unsigned(reg17[(4'hd):(3'h7)]))) : reg12);
            end
        end
      reg21 <= (reg17 ? wire9[(2'h3):(2'h3)] : wire7);
      reg22 <= (({{reg17[(4'hb):(3'h5)], (|reg15)}} ?
              $unsigned((!wire9[(1'h0):(1'h0)])) : (reg20 ~^ ((+reg13) && reg13))) ?
          $signed($signed((&$signed(wire11)))) : $unsigned($unsigned(((reg19 ?
              reg16 : reg13) >= (~|reg19)))));
      if ((-(((8'hb1) ?
          (((8'ha7) ^~ wire8) ~^ ((8'hb5) ?
              (8'ha2) : reg14)) : $unsigned($signed(reg19))) - wire9)))
        begin
          reg23 <= $unsigned((reg21[(2'h2):(1'h0)] ?
              wire11[(3'h5):(3'h5)] : ((reg17 >>> reg19) >= {reg22[(4'hd):(2'h3)],
                  $unsigned(wire7)})));
          reg24 <= {$unsigned(reg18[(1'h0):(1'h0)]), $unsigned(reg20)};
          if ($signed(wire11[(3'h7):(3'h5)]))
            begin
              reg25 <= (!reg20);
              reg26 <= reg21[(4'h9):(3'h6)];
              reg27 <= $signed(((~wire10[(5'h10):(2'h3)]) ?
                  (^$signed($signed(reg14))) : (reg24 * (^~$unsigned(reg20)))));
              reg28 <= {(|{({wire7} << $unsigned(reg16)),
                      (reg23[(3'h5):(1'h0)] * {reg16, reg13})}),
                  reg15[(3'h5):(1'h1)]};
              reg29 <= (reg12 ? (~^(^(+(8'ha4)))) : wire7[(4'hf):(4'hc)]);
            end
          else
            begin
              reg25 <= reg28[(4'h8):(3'h7)];
            end
          reg30 <= ({(reg26 ^ $signed((+reg24))), wire10[(1'h1):(1'h1)]} ?
              (reg15 ?
                  ({((8'hb1) ? reg27 : (8'h9d))} ?
                      ($signed(reg15) ?
                          ((8'ha5) << reg15) : (~|reg23)) : $unsigned((^~reg14))) : $unsigned($signed((reg19 ?
                      reg15 : reg13)))) : reg29);
          reg31 <= (($unsigned(wire9[(2'h3):(1'h1)]) ? wire7 : $signed(reg27)) ?
              reg26[(1'h1):(1'h0)] : ({reg12} <= (((wire10 | (8'haf)) ?
                      ((8'hb6) >> (8'haf)) : (reg20 == reg16)) ?
                  (~&reg17[(4'hf):(4'he)]) : $unsigned(reg16))));
        end
      else
        begin
          if ((((($unsigned((8'hb7)) ?
                      $unsigned(reg29) : {reg13,
                          reg31}) * ({(8'h9f)} >> (reg26 + wire10))) ?
                  $unsigned(($signed((8'haa)) >>> (reg18 ?
                      (8'hb4) : wire9))) : (8'hb6)) ?
              $signed(wire8) : $unsigned($signed(wire7[(4'hd):(3'h6)]))))
            begin
              reg23 <= ((!(($signed(reg25) ^ reg24[(4'hb):(4'hb)]) ?
                  (reg30[(3'h4):(1'h0)] ? wire8 : (reg24 * reg20)) : ((wire11 ?
                          reg16 : wire10) ?
                      reg26[(1'h0):(1'h0)] : (~&reg28)))) <<< {$signed((8'hb0))});
              reg24 <= ((-(~|(!reg29))) ?
                  (~^reg30[(2'h3):(1'h0)]) : $signed((reg15 >> ((^~reg31) ?
                      (reg30 ? reg24 : (8'ha3)) : reg23))));
            end
          else
            begin
              reg23 <= reg15;
              reg24 <= $unsigned((($signed((reg31 ? reg19 : reg30)) ?
                  ((~^wire7) ?
                      ((8'hb8) ?
                          reg29 : reg18) : (reg18 ^ reg25)) : ((wire9 && reg23) ?
                      $signed(reg22) : ((8'hbe) ^~ (8'hb0)))) << $signed(reg30)));
              reg25 <= ((~reg14[(4'h9):(4'h9)]) ^ $signed($unsigned(reg30)));
            end
          reg26 <= {(^((reg14 & reg26) <= ($unsigned((8'hb3)) ?
                  (|reg27) : {reg20, wire7}))),
              (-(+$signed(reg30[(3'h5):(2'h3)])))};
          if ($signed($unsigned($unsigned($unsigned($unsigned(wire7))))))
            begin
              reg27 <= (reg16 & (~&$unsigned($unsigned((8'ha6)))));
              reg28 <= $unsigned(((wire8[(2'h3):(1'h0)] + reg19) ?
                  $unsigned(wire7) : (!(|$unsigned(reg24)))));
              reg29 <= reg15;
            end
          else
            begin
              reg27 <= (reg20 ?
                  $unsigned(reg23[(4'hf):(2'h3)]) : ((reg29[(2'h2):(1'h0)] << $signed($signed(reg26))) > (&$signed(reg23))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg32 <= {(^$signed((+{reg26})))};
    end
endmodule

module module172  (y, clk, wire176, wire175, wire174, wire173);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire176;
  input wire [(5'h11):(1'h0)] wire175;
  input wire [(3'h7):(1'h0)] wire174;
  input wire [(5'h10):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire181;
  wire signed [(4'h8):(1'h0)] wire180;
  wire signed [(3'h7):(1'h0)] wire179;
  wire signed [(4'h8):(1'h0)] wire178;
  wire signed [(2'h3):(1'h0)] wire177;
  assign y = {wire181, wire180, wire179, wire178, wire177, (1'h0)};
  assign wire177 = (~^(~^$signed($signed((wire173 * wire176)))));
  assign wire178 = {{$unsigned($signed((wire177 ? wire173 : (8'hb0))))},
                       (~&wire174[(2'h3):(2'h3)])};
  assign wire179 = ($signed((wire178[(3'h4):(2'h3)] ^~ $unsigned({(8'hb9),
                           wire174}))) ?
                       $signed($unsigned((wire174 ^ $unsigned(wire177)))) : wire174[(3'h7):(1'h1)]);
  assign wire180 = (wire174 ?
                       ({$signed(wire175[(4'h8):(2'h3)]), wire173} ?
                           wire173 : wire179) : wire178);
  assign wire181 = (7'h43);
endmodule

module module137
#(parameter param169 = (+(^~(&(~&((8'hac) ? (8'hb0) : (8'hae)))))))
(y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire142;
  input wire [(4'hd):(1'h0)] wire141;
  input wire [(2'h3):(1'h0)] wire140;
  input wire [(3'h6):(1'h0)] wire139;
  input wire [(5'h13):(1'h0)] wire138;
  wire signed [(2'h2):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire signed [(4'he):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire163;
  wire [(3'h7):(1'h0)] wire162;
  wire [(3'h5):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire152;
  wire [(3'h4):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire148;
  wire [(4'hb):(1'h0)] wire147;
  wire signed [(2'h2):(1'h0)] wire146;
  wire [(3'h4):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire143;
  reg [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 reg165,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg151,
                 (1'h0)};
  assign wire143 = $unsigned(($signed($signed((wire138 >> wire140))) ?
                       {wire140[(2'h3):(2'h3)]} : (wire139[(3'h5):(2'h3)] ?
                           $signed($signed(wire142)) : $signed(wire142))));
  assign wire144 = wire140[(1'h1):(1'h1)];
  assign wire145 = $signed(($unsigned(wire144[(4'hc):(2'h2)]) || (|$signed((!(8'hb6))))));
  assign wire146 = ($signed((!$signed($unsigned(wire142)))) ?
                       (($unsigned(wire142) ?
                               {wire140[(2'h3):(1'h1)],
                                   wire145[(2'h3):(1'h1)]} : {{wire138},
                                   (wire140 <<< (8'hb1))}) ?
                           wire141[(4'hb):(1'h1)] : (-wire143[(4'ha):(1'h0)])) : wire140[(1'h1):(1'h1)]);
  assign wire147 = (^~(~(+wire140[(2'h2):(2'h2)])));
  assign wire148 = wire142;
  assign wire149 = $unsigned($signed($unsigned({(wire144 ? wire146 : wire144),
                       (&(7'h43))})));
  assign wire150 = wire138[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg151 <= (wire138[(4'hd):(2'h2)] ? wire150 : (-wire143[(4'hb):(2'h2)]));
    end
  assign wire152 = (~&$unsigned(wire147[(4'h9):(3'h5)]));
  assign wire153 = $signed(wire139[(2'h3):(2'h2)]);
  assign wire154 = ((wire139[(1'h1):(1'h1)] ?
                           ($unsigned($unsigned(wire141)) <<< $unsigned((wire148 ?
                               wire146 : wire142))) : wire138[(4'hc):(4'ha)]) ?
                       ((!({wire149} <<< (wire146 && (8'ha2)))) > (~&$unsigned(wire150))) : $signed($signed($unsigned(wire141[(3'h5):(2'h3)]))));
  always
    @(posedge clk) begin
      reg155 <= $unsigned(wire147);
    end
  always
    @(posedge clk) begin
      reg156 <= ((7'h41) > $signed(wire141[(4'ha):(2'h3)]));
      reg157 <= {$signed((reg151[(2'h2):(1'h1)] ?
              {((8'hae) ? reg155 : wire138)} : wire143)),
          $unsigned($unsigned((~|(wire140 >= wire143))))};
      reg158 <= $signed((8'hb8));
      reg159 <= wire146;
      reg160 <= (7'h43);
    end
  assign wire161 = reg151[(3'h6):(3'h6)];
  assign wire162 = wire147[(4'ha):(4'h9)];
  assign wire163 = ($unsigned(wire147[(4'hb):(3'h6)]) + (wire140[(1'h0):(1'h0)] <= $signed($unsigned((8'hb0)))));
  assign wire164 = wire144[(4'hd):(2'h3)];
  always
    @(posedge clk) begin
      reg165 <= $unsigned(reg155[(2'h2):(2'h2)]);
    end
  assign wire166 = $unsigned({$signed((reg160[(4'hf):(3'h6)] ?
                           $signed(reg165) : wire146[(2'h2):(1'h1)]))});
  assign wire167 = {(((~|$signed(wire161)) <<< {$signed(wire147)}) ^~ wire147[(3'h7):(3'h5)]),
                       $signed(wire142)};
  assign wire168 = (^~(+(|$signed((|wire153)))));
endmodule

module module93
#(parameter param132 = (~|((8'ha2) ? (!(((8'hac) ? (8'ha5) : (8'hb3)) & (8'ha6))) : {((&(8'ha5)) >> ((8'haf) ? (8'hb5) : (7'h41)))})), 
parameter param133 = ((^((param132 ^ (param132 >> param132)) || (~^(|param132)))) ? (!(|(!{param132, param132}))) : {(7'h43)}))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire98;
  input wire [(2'h3):(1'h0)] wire97;
  input wire signed [(3'h5):(1'h0)] wire96;
  input wire signed [(3'h7):(1'h0)] wire95;
  input wire [(4'hd):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
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
                 (1'h0)};
  assign wire99 = (7'h44);
  assign wire100 = (8'h9c);
  assign wire101 = {wire98[(1'h1):(1'h0)]};
  assign wire102 = (~^wire98);
  assign wire103 = wire98;
  assign wire104 = (wire96[(3'h4):(1'h1)] ? wire96 : (^wire99[(3'h6):(3'h6)]));
  assign wire105 = {{(wire96 <<< (8'hbc)), $signed(wire104)}};
  assign wire106 = wire100;
  assign wire107 = $unsigned($signed(wire102));
  assign wire108 = (wire100 <<< (~|($signed((8'hb9)) != wire99[(2'h2):(1'h1)])));
  assign wire109 = (~|wire100);
  assign wire110 = wire96;
  assign wire111 = wire106;
  assign wire112 = wire96[(1'h0):(1'h0)];
  assign wire113 = wire104[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg114 <= ($signed({({wire107, wire103} ?
                  (wire101 ? wire105 : wire106) : wire96[(1'h0):(1'h0)])}) ?
          (+wire105) : wire99[(5'h13):(4'hc)]);
      if ($unsigned((wire95[(1'h0):(1'h0)] & {(8'ha2),
          (wire94[(4'hd):(3'h7)] ^~ (wire110 ? (8'haf) : wire95))})))
        begin
          if (($signed($unsigned($signed($unsigned(wire111)))) ?
              wire94[(4'ha):(4'h8)] : wire109[(4'h9):(3'h4)]))
            begin
              reg115 <= $signed(wire106[(4'h9):(4'h8)]);
            end
          else
            begin
              reg115 <= {$unsigned(((^wire94) > (wire104 ?
                      $unsigned(wire106) : $signed(wire107))))};
              reg116 <= ((~&$unsigned(wire97)) ?
                  (^~($signed({wire105}) ?
                      ($signed(wire100) > wire113) : $unsigned($signed(wire108)))) : (7'h44));
              reg117 <= $signed(wire107[(2'h3):(2'h3)]);
              reg118 <= wire113;
              reg119 <= wire104[(3'h5):(2'h3)];
            end
          reg120 <= $unsigned($signed(wire110[(1'h0):(1'h0)]));
          reg121 <= ($unsigned($unsigned(wire95)) == (({((8'hbe) >>> reg118)} & {wire101[(5'h10):(4'hb)],
                  {wire104, wire111}}) ?
              $signed($unsigned($signed((8'hb9)))) : ($signed((8'haa)) ?
                  wire103[(3'h5):(1'h0)] : $signed($signed(wire104)))));
        end
      else
        begin
          reg115 <= ((~^(~(+(|reg117)))) << (~wire95[(1'h1):(1'h0)]));
          reg116 <= (wire97[(1'h1):(1'h0)] ?
              ({reg120, {{wire97}, $signed(reg115)}} <= $unsigned(({(8'ha4),
                      (8'ha1)} ?
                  (~&wire99) : $signed(wire108)))) : wire101);
        end
      reg122 <= (8'hab);
      reg123 <= (!wire109[(4'hd):(4'hc)]);
      reg124 <= wire94[(4'h9):(1'h1)];
    end
  assign wire125 = ($signed((+$unsigned(reg118[(4'h8):(3'h4)]))) & $signed($signed(((8'hb6) ?
                       wire105[(1'h1):(1'h1)] : reg114[(3'h5):(3'h5)]))));
  assign wire126 = $unsigned(((reg122[(5'h10):(2'h2)] ?
                           {$signed((8'hbb)), $unsigned((8'h9e))} : ((wire110 ?
                               wire94 : wire106) != {(8'hbc)})) ?
                       (~&(8'ha2)) : reg115));
  assign wire127 = {wire111, $signed($unsigned(wire101))};
  assign wire128 = (($unsigned($signed((wire95 ? reg114 : (7'h42)))) ?
                       wire111[(4'hd):(4'h9)] : {(~wire103[(1'h1):(1'h1)]),
                           (reg123 > (reg115 | wire111))}) * wire127[(1'h0):(1'h0)]);
  assign wire129 = ($unsigned((~wire94)) ~^ $unsigned((|$signed($unsigned((7'h44))))));
  assign wire130 = wire104[(2'h2):(2'h2)];
  assign wire131 = wire100;
endmodule
