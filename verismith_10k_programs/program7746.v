module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire75;
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire4,
                 wire17,
                 wire18,
                 wire34,
                 wire35,
                 wire75,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (~wire0[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      reg5 <= $signed(wire3[(1'h0):(1'h0)]);
      if ($signed({{$signed($signed(reg5)), $signed((wire2 < (8'ha5)))}}))
        begin
          reg6 <= (((!reg5) ?
              wire2[(1'h1):(1'h0)] : (~&wire0)) == {$unsigned(wire1)});
          if ((-$signed((wire3[(4'hb):(4'h9)] & (wire3[(4'h8):(1'h1)] ?
              $signed(reg6) : $unsigned(wire1))))))
            begin
              reg7 <= (~^wire3);
              reg8 <= (wire4 ?
                  ((7'h42) - $unsigned(({reg6, wire1} ?
                      wire4[(3'h5):(2'h3)] : $unsigned(reg5)))) : reg6[(1'h0):(1'h0)]);
              reg9 <= {wire2[(1'h1):(1'h0)],
                  (~|((^~(wire1 ? wire0 : wire4)) ?
                      {{reg6, reg7}} : (~|(^~wire0))))};
            end
          else
            begin
              reg7 <= ($unsigned((8'hb7)) ? (~^wire0[(4'ha):(1'h0)]) : reg5);
              reg8 <= $signed(($signed((wire4[(4'h9):(3'h7)] ?
                      $unsigned(reg6) : $unsigned(wire3))) ?
                  $unsigned((((8'ha6) || wire3) ?
                      $unsigned((8'haa)) : $signed(wire3))) : {reg5}));
              reg9 <= $signed($unsigned(reg8));
            end
          reg10 <= $unsigned(reg7);
          reg11 <= (-(reg5 >= (reg9 ^~ (^{wire1, reg6}))));
          reg12 <= reg7[(3'h6):(3'h5)];
        end
      else
        begin
          reg6 <= wire3[(4'hc):(3'h7)];
          if ($unsigned(($unsigned((&reg8)) * {reg7,
              $signed($unsigned((8'ha3)))})))
            begin
              reg7 <= $signed(wire1);
              reg8 <= (reg12 ?
                  (($signed($signed(reg5)) & (+$unsigned(reg11))) ?
                      {reg7} : {wire0[(4'ha):(2'h2)]}) : wire2[(3'h6):(2'h2)]);
              reg9 <= {{$signed(reg12), reg5},
                  (reg12[(2'h3):(1'h1)] || {($unsigned(reg6) * (reg10 < reg5)),
                      {$signed(reg6)}})};
              reg10 <= wire0[(1'h1):(1'h1)];
              reg11 <= {(~(8'hb9))};
            end
          else
            begin
              reg7 <= {$unsigned(((^((8'ha2) ^~ wire0)) > reg10[(2'h2):(1'h0)]))};
            end
          if ($unsigned((((8'ha3) ? $signed((~|(8'ha7))) : $signed(wire4)) ?
              $signed(wire2) : (reg5[(5'h14):(1'h1)] ?
                  {$unsigned((8'hb9))} : $unsigned({reg7})))))
            begin
              reg12 <= (~^(^(($unsigned(reg9) ?
                  (&wire2) : (reg6 ? reg5 : reg5)) ~^ ((reg12 ^~ wire0) ?
                  $signed(wire4) : {wire4, reg9}))));
              reg13 <= $unsigned(($signed(reg12[(3'h4):(1'h1)]) == $signed((reg10 ?
                  $unsigned(wire0) : (+wire1)))));
              reg14 <= reg9;
              reg15 <= reg11[(3'h4):(2'h2)];
              reg16 <= $unsigned(wire0[(3'h5):(3'h5)]);
            end
          else
            begin
              reg12 <= (-(reg14 ?
                  (^$unsigned($unsigned(reg7))) : (-$unsigned(reg9))));
              reg13 <= (($signed(reg11) > (reg6[(4'h9):(3'h7)] ~^ ((wire0 <= wire2) < $signed((8'ha2))))) ?
                  $signed($signed($unsigned($unsigned(wire1)))) : (reg5[(4'he):(4'hd)] ?
                      (($unsigned(reg7) ? (8'hbb) : $signed(reg11)) ?
                          ($unsigned((7'h42)) <<< (^wire1)) : (!reg7[(5'h11):(4'hd)])) : ((-(|reg11)) & reg16[(1'h0):(1'h0)])));
              reg14 <= $unsigned(wire2[(4'h9):(1'h1)]);
              reg15 <= reg13[(1'h1):(1'h1)];
              reg16 <= ((&$unsigned((reg6[(3'h4):(1'h1)] <= (reg7 ?
                      wire4 : wire0)))) ?
                  reg13 : {$signed(reg5)});
            end
        end
    end
  assign wire17 = ($signed(reg13) ?
                      (-$unsigned(reg10)) : ($signed($unsigned($signed(reg13))) ?
                          $signed(reg5) : wire1[(3'h4):(2'h2)]));
  assign wire18 = $unsigned(($unsigned(reg6[(1'h0):(1'h0)]) ?
                      (^((^~(8'h9f)) ^~ reg5)) : wire0[(4'ha):(1'h0)]));
  always
    @(posedge clk) begin
      if (((&{reg12}) || ($signed(wire2[(3'h4):(3'h4)]) ?
          $signed(((8'hb5) ? (reg8 ? reg14 : (8'h9e)) : wire17)) : {reg5,
              reg8[(4'hd):(3'h6)]})))
        begin
          reg19 <= wire3[(5'h13):(5'h12)];
          if ((~&($signed(((wire1 == reg16) + reg13[(3'h5):(3'h4)])) & reg11[(4'hb):(1'h1)])))
            begin
              reg20 <= wire18[(3'h6):(3'h6)];
              reg21 <= wire2[(2'h3):(1'h1)];
              reg22 <= ((^~$unsigned(($unsigned(reg13) >= ((8'hb0) ?
                      reg9 : reg20)))) ?
                  reg8 : (-(+wire2[(3'h6):(3'h4)])));
              reg23 <= reg22[(3'h4):(1'h1)];
              reg24 <= reg22;
            end
          else
            begin
              reg20 <= ($unsigned($signed(reg9[(2'h2):(1'h0)])) ?
                  $signed(reg6[(4'ha):(2'h3)]) : $unsigned(reg20[(4'hd):(2'h2)]));
              reg21 <= (reg11[(4'hf):(4'hd)] >> $signed(reg23[(4'hd):(4'hb)]));
              reg22 <= (reg14 ?
                  {({(reg21 ? reg23 : reg24)} < ((reg5 ?
                          wire2 : reg9) >= $unsigned(reg13)))} : {(($signed(reg8) & (reg13 >> reg22)) ?
                          wire1[(2'h2):(1'h1)] : reg14),
                      $signed(reg14[(3'h4):(3'h4)])});
              reg23 <= (&reg19);
            end
          reg25 <= reg23;
          reg26 <= $signed($signed(reg8));
        end
      else
        begin
          reg19 <= reg11;
        end
      reg27 <= $signed((+(reg23 ?
          ((reg7 ? reg12 : reg7) != (reg20 ? wire4 : reg15)) : (|(wire17 ?
              (8'hbc) : (8'h9c))))));
      if ((~&{reg24[(3'h5):(2'h2)]}))
        begin
          reg28 <= reg19[(1'h1):(1'h1)];
        end
      else
        begin
          if (reg16[(1'h1):(1'h1)])
            begin
              reg28 <= wire3[(5'h14):(4'hf)];
              reg29 <= (^~$signed(((|$signed(wire17)) ^ {wire17[(3'h5):(1'h1)]})));
              reg30 <= reg27;
              reg31 <= (8'h9d);
              reg32 <= ($unsigned(((~|{reg9, (8'hae)}) ?
                      (wire18 <<< wire3[(1'h1):(1'h1)]) : $unsigned((reg8 ?
                          reg5 : wire2)))) ?
                  reg6[(1'h0):(1'h0)] : ((!reg13[(3'h7):(3'h7)]) & (~&reg11[(3'h6):(3'h4)])));
            end
          else
            begin
              reg28 <= (reg22 ?
                  $unsigned(($signed((reg5 ? reg14 : reg13)) <= (reg31 <= {reg8,
                      reg9}))) : ($signed(({reg12, reg7} ?
                          $signed(reg6) : (reg26 ? reg22 : wire3))) ?
                      $unsigned($signed((~&(8'hb2)))) : reg7[(4'hf):(4'he)]));
              reg29 <= $unsigned(reg14[(4'ha):(4'h8)]);
              reg30 <= wire0;
              reg31 <= (&(reg31 <<< ($unsigned(reg19[(4'hb):(1'h0)]) ~^ {(~&reg31)})));
              reg32 <= reg23;
            end
        end
      reg33 <= reg21[(4'h8):(3'h4)];
    end
  assign wire34 = ($unsigned(reg8) & (($signed($signed((8'haf))) ?
                      ((reg11 ^ (8'hb8)) & (8'had)) : wire1) >> $unsigned(reg8[(3'h5):(1'h0)])));
  assign wire35 = $signed($unsigned(((((8'ha2) ^ wire4) > (reg6 ?
                      reg11 : reg14)) - {(reg6 | wire4)})));
  module36 #() modinst76 (.wire37(reg33), .y(wire75), .wire40(reg20), .wire39(reg31), .wire41(reg21), .clk(clk), .wire38(wire4));
endmodule

module module36
#(parameter param74 = (((~|(((8'hab) >> (8'hbe)) ? ((8'haa) ? (8'hb4) : (8'haa)) : ((7'h44) ? (8'hb1) : (8'ha6)))) + ((((8'hb4) ? (8'h9e) : (8'h9f)) + ((8'h9e) ^~ (8'h9f))) + (((8'hbb) & (8'hbf)) << ((8'hb1) ? (8'had) : (8'ha5))))) - (({((8'hb3) ? (8'hbc) : (8'h9d)), ((8'ha3) << (8'hb2))} ? ((8'ha8) > ((8'ha1) ? (8'h9d) : (8'hae))) : (^{(8'ha8), (8'ha6)})) ? ({{(8'hb9), (8'had)}} ? (~&((8'hab) <= (8'hb4))) : ({(8'had)} ? (~&(8'ha2)) : ((8'h9e) ? (8'hbc) : (8'hac)))) : (^~((~(8'ha6)) ? ((8'hb9) ^ (8'hb3)) : ((8'hb6) ? (8'h9d) : (8'hb4)))))))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(5'h11):(1'h0)] wire39;
  input wire [(4'h9):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  assign y = {wire72,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire42 = (!{((~^$signed(wire38)) && ($signed(wire38) >>> (-wire38)))});
  assign wire43 = wire40;
  assign wire44 = (~&(|((&wire40) <<< (&(~|wire38)))));
  assign wire45 = $unsigned($unsigned(wire40[(4'hb):(4'hb)]));
  assign wire46 = ((wire45[(4'hf):(3'h6)] | (((wire44 ?
                          (8'hbb) : wire43) ^ wire45) ?
                      ((wire45 ? wire42 : wire39) < (wire37 ?
                          (7'h41) : wire41)) : ((wire39 ^~ wire44) || $signed(wire37)))) <<< (8'ha4));
  assign wire47 = ($signed($unsigned(((^wire42) << (^wire38)))) ^~ $signed((|((wire44 * wire44) <= (wire43 ?
                      wire37 : (8'hae))))));
  always
    @(posedge clk) begin
      reg48 <= wire41[(4'h8):(1'h0)];
      if ($signed(wire45))
        begin
          if (wire38[(2'h2):(1'h1)])
            begin
              reg49 <= {$unsigned(wire46[(3'h4):(1'h0)]), $signed(wire41)};
            end
          else
            begin
              reg49 <= ($signed((reg48 ? (8'haa) : (-wire43[(3'h5):(2'h3)]))) ?
                  wire37 : wire40[(1'h1):(1'h0)]);
              reg50 <= (8'hb9);
            end
        end
      else
        begin
          reg49 <= {(~|wire41)};
          reg50 <= wire43[(3'h6):(1'h1)];
          reg51 <= $signed(((+{wire47[(2'h3):(2'h2)]}) ?
              wire43[(3'h5):(2'h3)] : $unsigned(((^wire40) ?
                  (+reg50) : wire38))));
          reg52 <= $signed(((({reg49} ? (+wire45) : (wire38 >>> wire45)) ?
              (^wire40) : (((8'hbf) ? reg48 : wire38) ?
                  wire39[(2'h2):(1'h0)] : $signed(wire46))) + $signed(($signed(wire44) ?
              (wire46 ? wire39 : reg50) : {wire45, reg50}))));
        end
      reg53 <= wire41;
    end
  assign wire54 = reg50[(1'h0):(1'h0)];
  assign wire55 = reg48[(1'h1):(1'h1)];
  assign wire56 = (reg53 & (wire47 ?
                      reg51[(1'h0):(1'h0)] : ((reg50 ^ (wire41 & (8'hbe))) + ($unsigned((8'hbc)) ?
                          (wire42 * reg53) : $signed(reg50)))));
  assign wire57 = $unsigned($unsigned(wire44));
  assign wire58 = {reg50[(4'hc):(4'h9)],
                      ({(~^{reg50})} == {(|(reg52 ? wire38 : wire42)), reg53})};
  module59 #() modinst73 (.wire62(wire43), .y(wire72), .clk(clk), .wire61(reg50), .wire63(wire39), .wire60(reg48));
endmodule

module module59  (y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire63;
  input wire signed [(5'h11):(1'h0)] wire62;
  input wire [(4'hf):(1'h0)] wire61;
  input wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 (1'h0)};
  assign wire64 = wire63;
  assign wire65 = wire64;
  assign wire66 = (wire60 ~^ (&(^~{$signed(wire62)})));
  assign wire67 = wire65;
  assign wire68 = wire67[(3'h7):(2'h2)];
  assign wire69 = (-(({wire63[(2'h2):(1'h0)]} && ((7'h44) ?
                          wire68[(4'hf):(3'h7)] : (wire64 >>> wire63))) ?
                      wire61[(1'h1):(1'h1)] : wire63[(4'hc):(4'hb)]));
  assign wire70 = ((wire68 ?
                      wire67[(3'h4):(1'h1)] : (!wire68)) && $signed({wire61,
                      $unsigned((^wire68))}));
  assign wire71 = $signed((((~$signed(wire63)) - ($unsigned(wire63) != wire66)) ?
                      (8'hb0) : (^$signed((&wire64)))));
endmodule
