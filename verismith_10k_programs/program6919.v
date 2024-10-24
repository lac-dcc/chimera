module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 reg17,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(wire0[(2'h2):(2'h2)]);
      if (wire0)
        begin
          reg5 <= ($signed($unsigned(reg4[(3'h6):(3'h5)])) ?
              wire1[(2'h2):(1'h0)] : $signed(wire3));
          reg6 <= ((($unsigned((wire1 ? wire3 : reg4)) ?
                      {(reg5 ? reg4 : wire3)} : ((wire0 ? wire2 : wire3) ?
                          reg4[(4'h8):(3'h6)] : $unsigned(wire0))) ?
                  $signed(wire3) : reg5) ?
              $signed(((8'hb8) ?
                  $unsigned((reg5 ?
                      reg5 : reg5)) : reg4[(4'hd):(3'h5)])) : $signed(($unsigned((wire1 ?
                      wire1 : wire1)) ?
                  ((wire1 ? reg5 : wire2) ?
                      (wire2 ^ (8'hb3)) : {reg4}) : $unsigned({wire2,
                      wire1}))));
          if ((({$unsigned($unsigned((7'h42)))} ?
                  ($unsigned((wire3 ?
                      (8'hbd) : (8'hbf))) || (~&(7'h40))) : (reg5 ?
                      (8'ha0) : reg4[(1'h1):(1'h0)])) ?
              ((($signed(reg5) ^ wire2[(4'h9):(3'h6)]) ?
                  wire2[(3'h5):(1'h0)] : (7'h43)) < $unsigned(wire0[(2'h2):(1'h1)])) : $signed(reg4[(5'h10):(4'ha)])))
            begin
              reg7 <= (-($signed($signed(wire1[(1'h0):(1'h0)])) ~^ $signed((+(^wire0)))));
              reg8 <= wire1[(2'h3):(2'h2)];
              reg9 <= (+($signed($unsigned((wire0 ? reg6 : wire3))) <<< wire3));
            end
          else
            begin
              reg7 <= ((wire1[(3'h4):(1'h0)] ^~ wire3[(2'h3):(2'h3)]) ?
                  ($signed(reg9[(2'h3):(1'h1)]) ?
                      reg4[(1'h1):(1'h0)] : (({reg6, reg9} ^~ {wire0, wire0}) ?
                          wire2 : $unsigned(reg6[(4'h9):(4'h8)]))) : (+reg7));
              reg8 <= ($signed($signed($signed(wire0[(1'h0):(1'h0)]))) ?
                  wire0[(1'h0):(1'h0)] : wire3);
              reg9 <= $signed(reg8);
              reg10 <= {reg4[(2'h2):(2'h2)]};
            end
          reg11 <= (reg7 != (reg4 - ((reg10[(3'h5):(1'h1)] ?
                  $signed(reg7) : (8'ha9)) ?
              $unsigned($signed(reg6)) : (reg8[(4'hd):(3'h4)] <= reg7[(2'h3):(1'h0)]))));
          reg12 <= reg9;
        end
      else
        begin
          reg5 <= (~&((!wire0) >= (^(~reg4))));
          reg6 <= $signed({reg11, reg6[(1'h0):(1'h0)]});
        end
      reg13 <= (reg12[(4'hf):(4'he)] < reg5[(1'h0):(1'h0)]);
      reg14 <= {reg6, {wire0, (-$unsigned((reg10 * (8'hbe))))}};
    end
  assign wire15 = $unsigned(reg11);
  assign wire16 = wire2;
  always
    @(posedge clk) begin
      reg17 <= ((wire0[(1'h0):(1'h0)] ^~ wire0) > (($signed((~^reg6)) ?
              reg8 : reg5[(1'h1):(1'h1)]) ?
          (!(-reg10[(3'h5):(1'h0)])) : ((((8'haf) & reg14) ?
              (~&reg14) : (reg7 | reg4)) < reg14)));
    end
  assign wire18 = reg5;
  assign wire19 = (reg14 | reg12[(3'h6):(3'h5)]);
  assign wire20 = reg10[(3'h7):(3'h6)];
  assign wire21 = wire1[(3'h4):(2'h2)];
  module22 #() modinst100 (.wire24(wire2), .y(wire99), .wire23(wire0), .wire26(reg7), .clk(clk), .wire25(reg6));
  assign wire101 = $unsigned((&$unsigned($signed((reg17 ? wire15 : reg12)))));
  assign wire102 = {(($unsigned(reg7[(2'h3):(2'h2)]) == $signed((reg5 ?
                           (8'hba) : reg11))) < reg11),
                       {($unsigned($signed(reg4)) ?
                               $unsigned((^~wire2)) : ($signed(wire18) << (wire15 ?
                                   wire2 : reg8))),
                           reg5[(2'h3):(1'h1)]}};
  assign wire103 = (!$signed(((^$unsigned(wire21)) ?
                       reg13[(3'h6):(3'h6)] : $unsigned({wire3, (8'hb0)}))));
endmodule

module module22
#(parameter param98 = {({(-(^~(8'ha1))), (((8'ha0) ? (8'haa) : (8'ha1)) ? ((8'ha7) ? (8'hbe) : (8'ha2)) : ((8'hbd) && (8'hac)))} + ((((8'hb5) <<< (7'h44)) ? ((8'hb4) <<< (8'hbd)) : ((8'hb6) ^ (8'hb0))) & (~^((8'ha3) | (8'hb9)))))})
(y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire23;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire90;
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire27,
                 wire90,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire27 = wire25;
  always
    @(posedge clk) begin
      reg28 <= wire24[(2'h2):(1'h0)];
      reg29 <= {$unsigned(((reg28 ? $unsigned(wire27) : $signed(wire25)) ?
              (+(wire24 ? wire26 : wire23)) : $signed({reg28, wire23})))};
      reg30 <= wire23;
      if ({wire24})
        begin
          reg31 <= (~^(&wire23));
          reg32 <= (~|reg30);
          reg33 <= (!(~&reg31));
        end
      else
        begin
          reg31 <= wire24[(3'h5):(2'h3)];
          reg32 <= ($unsigned((~|(^~(wire24 ?
              reg31 : (8'h9c))))) > (~&((~^$unsigned(reg30)) ?
              reg32[(3'h5):(1'h1)] : (~(~^reg30)))));
        end
    end
  module34 #() modinst91 (wire90, clk, wire25, wire24, reg32, reg33, wire26);
  assign wire92 = (|(|$signed($signed(reg28[(3'h7):(3'h7)]))));
  assign wire93 = (reg32[(2'h2):(2'h2)] << (~^$unsigned((|((8'ha6) ?
                      reg30 : wire25)))));
  assign wire94 = $unsigned($unsigned($signed($unsigned((wire92 & wire90)))));
  assign wire95 = $unsigned($signed((~^$signed(wire92[(3'h4):(1'h1)]))));
  assign wire96 = ({(({wire24, reg32} <<< wire94) ?
                              wire25[(2'h2):(1'h1)] : {{reg32, reg32},
                                  (+wire94)}),
                          $signed($signed(wire24))} ?
                      reg28[(2'h3):(2'h2)] : ((!($signed((8'ha9)) * (reg29 >>> reg33))) && (reg28 ?
                          wire24[(1'h1):(1'h0)] : $signed((wire95 << wire23)))));
  assign wire97 = $signed(($unsigned($unsigned((wire26 ?
                      reg32 : wire26))) <= $signed($unsigned(wire90))));
endmodule

module module34
#(parameter param89 = (~^(((~((8'ha8) >= (8'hae))) >>> (8'ha8)) ? ((((8'ha2) ? (7'h40) : (8'hb6)) ? {(8'ha7)} : ((8'h9d) ? (8'ha7) : (8'hbb))) ? ((~^(8'hb5)) ? (^~(8'hbf)) : ((8'ha5) | (8'ha8))) : (8'hbb)) : (+(8'ha0)))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h25b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire signed [(2'h3):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire51;
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire64,
                 wire63,
                 wire62,
                 wire51,
                 reg88,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= (~wire35[(3'h7):(3'h7)]);
      if ((($signed($signed((wire39 && reg40))) ?
              $unsigned((^wire35[(4'h9):(3'h5)])) : wire38) ?
          {($signed(wire37[(2'h3):(2'h2)]) ?
                  {$signed(wire37)} : ($signed(reg40) ?
                      (wire37 ?
                          wire39 : wire39) : $unsigned(wire35)))} : ($unsigned((~$unsigned((8'hab)))) * wire36)))
        begin
          reg41 <= wire36[(1'h0):(1'h0)];
          if (reg41)
            begin
              reg42 <= (($unsigned((^(~^wire37))) | $signed((~&wire38[(1'h0):(1'h0)]))) ?
                  ({({wire39} ? $unsigned(reg41) : (wire36 ? reg41 : wire39))} ?
                      $signed((&$signed((8'hbf)))) : wire38) : ($signed($unsigned((wire37 | reg40))) * (~|({wire38,
                          wire35} ?
                      (-wire38) : (wire38 ? (8'hae) : wire37)))));
              reg43 <= $unsigned((reg42[(3'h6):(1'h1)] <= reg42));
              reg44 <= (($unsigned($unsigned((-wire39))) < (wire38[(2'h3):(1'h0)] ?
                  $signed(reg40[(4'hc):(3'h5)]) : $signed($unsigned((8'h9d))))) + (wire35 ?
                  ((reg42 > ((7'h42) - (8'hb5))) ?
                      $unsigned(reg40[(4'hf):(1'h1)]) : (-{wire36,
                          (7'h42)})) : ($unsigned(reg42[(3'h6):(2'h3)]) >>> (+$signed((8'hae))))));
              reg45 <= reg42[(1'h0):(1'h0)];
            end
          else
            begin
              reg42 <= (&$signed(wire37[(2'h2):(1'h1)]));
              reg43 <= $signed((+(^~reg43)));
              reg44 <= {$unsigned($signed(($unsigned(reg42) ?
                      {reg44, reg43} : $unsigned(reg41))))};
            end
          if ($signed(($signed(((reg41 > wire36) ?
              (&reg41) : $signed(wire35))) || ((^$signed((8'ha8))) ?
              {reg40} : $unsigned((+reg42))))))
            begin
              reg46 <= $signed((|reg40));
              reg47 <= {wire35[(4'hb):(4'ha)]};
            end
          else
            begin
              reg46 <= reg45;
              reg47 <= (~&$unsigned(reg47[(1'h1):(1'h1)]));
              reg48 <= $signed((|reg40[(3'h6):(3'h4)]));
              reg49 <= $signed(reg47[(1'h1):(1'h1)]);
            end
          reg50 <= (~^{$signed(wire35[(1'h1):(1'h0)]),
              $signed({(reg45 ? wire39 : reg45), reg47[(3'h6):(3'h4)]})});
        end
      else
        begin
          reg41 <= $unsigned((wire37[(1'h0):(1'h0)] ?
              $signed($signed($signed(reg40))) : $signed((~((8'haa) ^ reg46)))));
        end
    end
  assign wire51 = wire39;
  always
    @(posedge clk) begin
      reg52 <= $unsigned($unsigned(($signed(reg43[(2'h3):(1'h1)]) ?
          wire38[(3'h7):(3'h5)] : (~|{wire37, reg45}))));
      if (((~&(reg40[(3'h4):(1'h1)] ?
          reg49[(4'ha):(3'h7)] : (-(~|reg44)))) || reg49))
        begin
          reg53 <= reg43;
        end
      else
        begin
          reg53 <= $unsigned($signed((|$signed(wire39[(2'h2):(1'h0)]))));
          if (reg47)
            begin
              reg54 <= (|(^(wire38[(4'ha):(2'h2)] - reg43[(5'h14):(4'hf)])));
              reg55 <= wire51[(1'h0):(1'h0)];
              reg56 <= {$signed(reg46[(5'h11):(1'h0)])};
              reg57 <= $signed((^(wire51[(1'h1):(1'h1)] >> $unsigned(reg42))));
            end
          else
            begin
              reg54 <= (({$unsigned(reg48[(2'h2):(1'h0)]),
                      $signed($signed(reg55))} ?
                  wire39[(2'h2):(1'h0)] : {{{reg54}}}) != ({(-$unsigned(reg57)),
                      {(reg54 ? reg42 : wire37), ((8'ha4) == reg47)}} ?
                  wire38[(2'h3):(2'h2)] : $unsigned(reg56)));
            end
          reg58 <= (($unsigned(reg44[(2'h3):(2'h2)]) ?
                  (8'hb0) : (($unsigned(reg44) ?
                      $unsigned(reg53) : reg43[(4'hb):(4'ha)]) < $signed({(7'h41)}))) ?
              $unsigned((8'hb2)) : ($signed($unsigned((reg52 ?
                  reg53 : reg56))) || {(&wire37[(2'h2):(1'h0)]),
                  reg57[(1'h1):(1'h0)]}));
          reg59 <= ($unsigned(((+(wire39 ? reg40 : reg56)) * reg48)) ?
              ($signed(((reg54 ? reg43 : reg45) ?
                      {wire51} : $unsigned(reg40))) ?
                  {($unsigned(reg40) || (~&wire35)),
                      reg48[(4'hc):(2'h3)]} : (8'h9e)) : {$signed(reg44[(5'h10):(3'h7)])});
          reg60 <= $unsigned($signed(($unsigned(reg47[(2'h2):(1'h0)]) ?
              (~wire35[(3'h4):(1'h0)]) : $unsigned((reg40 ^~ reg53)))));
        end
      reg61 <= $unsigned(reg60[(3'h7):(3'h6)]);
    end
  assign wire62 = (wire35[(3'h5):(2'h3)] ^ reg61);
  assign wire63 = reg42;
  assign wire64 = reg46;
  always
    @(posedge clk) begin
      reg65 <= wire39[(2'h2):(1'h0)];
      reg66 <= $signed($unsigned((~^(reg42[(3'h4):(2'h2)] << reg41[(2'h3):(1'h0)]))));
      if ({(reg58[(3'h5):(2'h3)] ?
              reg47 : ($unsigned((+wire35)) ?
                  (~^reg47[(3'h6):(1'h0)]) : ((reg54 || (7'h44)) ?
                      $unsigned(wire36) : ((8'hbf) || wire36))))})
        begin
          reg67 <= $unsigned((((~|(~^(8'hb7))) ?
              ((reg59 | reg45) ?
                  {reg58} : reg53[(1'h0):(1'h0)]) : wire39) >>> (-($unsigned(reg48) & wire39))));
          reg68 <= $unsigned(reg59);
        end
      else
        begin
          reg67 <= (!(^reg52[(1'h0):(1'h0)]));
        end
      if (reg45)
        begin
          reg69 <= reg61;
          reg70 <= ($unsigned(reg56) ?
              $signed({$signed(reg47[(3'h6):(3'h5)])}) : (((^$signed(reg56)) ?
                      {(wire36 >>> reg49), $signed(wire63)} : wire38) ?
                  (~|wire64[(4'he):(3'h6)]) : $signed($unsigned((~^wire64)))));
          reg71 <= (&(8'hac));
          reg72 <= (8'ha6);
        end
      else
        begin
          reg69 <= (((reg52[(1'h1):(1'h1)] ?
                      (reg54 ? $signed((8'ha3)) : (reg58 * reg41)) : ((reg54 ?
                              reg54 : reg50) ?
                          (reg45 == wire63) : (8'hb7))) ?
                  (^$signed((~&reg71))) : ((reg65 ?
                      (reg68 <<< wire36) : $signed(wire38)) || ($signed(wire38) ?
                      (reg48 * reg44) : (wire63 ? reg53 : reg49)))) ?
              reg55[(2'h3):(1'h1)] : reg52[(2'h2):(1'h0)]);
          if ((reg47 ?
              $signed(($signed(wire38[(1'h0):(1'h0)]) ?
                  {{reg49, reg49}} : (7'h42))) : ($unsigned({(reg41 ?
                          reg57 : reg69),
                      $unsigned(reg44)}) ?
                  reg48[(5'h12):(2'h3)] : reg69[(1'h0):(1'h0)])))
            begin
              reg70 <= $unsigned($unsigned({reg66, reg40}));
              reg71 <= ({{{(wire35 ? (8'hb6) : reg42)},
                          {(reg56 ? reg61 : reg44)}}} ?
                  $signed($unsigned(($signed(reg42) ?
                      (reg54 < reg46) : {reg68, wire38}))) : (~^((reg61 ?
                          (reg52 == wire39) : $unsigned(reg54)) ?
                      ($unsigned((8'hbd)) || reg67) : (reg65[(3'h7):(3'h7)] ?
                          reg67 : $signed((8'hbe))))));
              reg72 <= ((reg61 && (|$unsigned($signed(reg70)))) ?
                  $signed({reg47[(3'h5):(3'h4)]}) : (wire51 << (&reg71)));
              reg73 <= ((((reg43[(3'h4):(3'h4)] ?
                      (reg61 ? reg61 : wire51) : {reg58}) ?
                  ($unsigned(wire62) != (reg69 ?
                      (8'ha9) : reg55)) : (reg56[(2'h2):(1'h0)] ?
                      reg61[(5'h11):(5'h10)] : reg56[(1'h1):(1'h0)])) << {({reg43} >> $signed(reg52)),
                  reg46}) <= reg45[(4'h8):(3'h6)]);
            end
          else
            begin
              reg70 <= {(-(reg42 || (wire36 & $signed((8'haf)))))};
            end
          if (($unsigned((((-reg43) ? $signed(reg53) : (+reg42)) > (-{wire35,
              (8'hb1)}))) ^ ((((reg48 ?
                  reg47 : reg49) | reg67[(5'h14):(4'hb)]) ?
              reg53 : {(wire36 | wire35)}) < (reg61 ?
              $unsigned((wire62 ? reg71 : (8'hb1))) : ((reg73 ?
                  reg52 : reg69) >>> $signed(wire35))))))
            begin
              reg74 <= (~reg46);
              reg75 <= (8'hb9);
              reg76 <= $signed($signed(((^~(+reg66)) ?
                  {reg42[(2'h3):(1'h0)], (reg70 + reg47)} : reg59)));
            end
          else
            begin
              reg74 <= reg53[(3'h4):(3'h4)];
              reg75 <= wire51[(1'h1):(1'h0)];
              reg76 <= reg44;
              reg77 <= ($signed(reg74[(1'h0):(1'h0)]) ?
                  (-reg50) : reg59[(4'hb):(3'h4)]);
            end
        end
    end
  assign wire78 = $signed({wire35,
                      ((~{reg45, reg71}) ?
                          reg70[(4'ha):(3'h5)] : $signed((~^reg41)))});
  assign wire79 = (~(wire36 && (8'ha7)));
  assign wire80 = $signed($signed((^(&(reg44 || reg69)))));
  assign wire81 = $unsigned((^~((+{(8'hbb)}) <<< ($unsigned(wire63) ?
                      (~wire36) : (~^wire39)))));
  assign wire82 = reg50[(3'h7):(1'h0)];
  assign wire83 = $signed((~((!(|(7'h41))) >>> ((reg45 <<< wire38) ?
                      $unsigned(reg71) : wire39))));
  assign wire84 = ((^~($signed((reg61 ? reg76 : reg44)) ?
                      $unsigned((reg75 ?
                          wire83 : wire37)) : $signed($unsigned(wire64)))) | reg72);
  assign wire85 = (reg59[(2'h3):(1'h1)] ?
                      reg76[(1'h1):(1'h1)] : $signed((((&wire84) ?
                          (-wire36) : (reg71 >> reg48)) <= ((wire84 ?
                              reg66 : reg49) ?
                          $signed(reg52) : reg43))));
  assign wire86 = (8'ha6);
  assign wire87 = reg77;
  always
    @(posedge clk) begin
      reg88 <= wire51;
    end
endmodule
