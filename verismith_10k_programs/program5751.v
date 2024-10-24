module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h237):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire12;
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire94,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire12,
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
                 reg98,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0[(4'ha):(1'h1)];
      if ((-wire4[(3'h6):(2'h3)]))
        begin
          reg6 <= {reg5, wire4};
          if ((8'ha7))
            begin
              reg7 <= (&($signed(wire4) ? $signed((8'ha2)) : wire3));
              reg8 <= $signed($signed((+reg7)));
              reg9 <= (~^(|wire4[(3'h6):(3'h4)]));
              reg10 <= ((~^$signed((~^wire0[(4'hc):(3'h6)]))) ?
                  $unsigned($signed($unsigned((reg5 ?
                      reg7 : wire2)))) : {wire1[(1'h1):(1'h0)],
                      (+reg5[(4'h8):(2'h2)])});
            end
          else
            begin
              reg7 <= ((^~$signed(reg10)) && reg6[(4'ha):(2'h3)]);
              reg8 <= wire1[(4'ha):(3'h5)];
            end
        end
      else
        begin
          if ({reg7,
              ($unsigned((8'hb7)) ?
                  (wire4 ?
                      (~&((8'ha7) ?
                          wire1 : reg8)) : ({reg6} ~^ (|wire4))) : (-wire3[(4'hc):(4'h8)]))})
            begin
              reg6 <= ($signed((wire3 | $signed((wire4 ?
                  reg10 : reg8)))) <= ({wire0} ?
                  $unsigned(wire3[(3'h7):(3'h6)]) : reg5));
              reg7 <= $unsigned((reg7[(2'h2):(1'h1)] ?
                  (~|$unsigned($signed(wire3))) : (~|($signed(reg10) >>> $signed(wire3)))));
              reg8 <= reg6;
              reg9 <= ((~|wire2[(3'h5):(2'h2)]) & (reg10 ?
                  ((8'h9d) ?
                      ($unsigned(wire1) ?
                          $unsigned(wire1) : $signed(wire1)) : wire4) : (|{(reg10 ?
                          (8'hbe) : reg5)})));
              reg10 <= (8'ha6);
            end
          else
            begin
              reg6 <= $signed({wire3, wire1});
              reg7 <= (wire2[(3'h5):(3'h5)] ?
                  {(~&reg9), reg9[(4'hb):(3'h5)]} : (8'hb4));
              reg8 <= (~reg10[(1'h0):(1'h0)]);
            end
          reg11 <= (~|({(reg6 == reg10),
              ({reg10} == {wire4,
                  reg6})} && ($signed({(8'ha4)}) <= $signed($signed(reg7)))));
        end
    end
  assign wire12 = {(~&$unsigned(wire0))};
  always
    @(posedge clk) begin
      reg13 <= (8'hb8);
    end
  always
    @(posedge clk) begin
      reg14 <= ((reg7 ^~ ($signed((wire12 <= reg11)) ?
          $unsigned((reg10 ?
              reg13 : reg8)) : (^(~^reg7)))) - {$signed(((^~reg7) ?
              {wire3} : $signed(reg6)))});
      reg15 <= wire2;
      reg16 <= ((^~$signed((reg5[(2'h2):(1'h0)] || {reg8}))) & reg7);
      reg17 <= reg16[(1'h0):(1'h0)];
    end
  assign wire18 = $unsigned((reg9[(4'hf):(4'hf)] <<< reg13[(4'hd):(3'h5)]));
  assign wire19 = $unsigned((!{{((8'hb8) ? (8'hac) : reg10), (8'ha7)}}));
  always
    @(posedge clk) begin
      reg20 <= ((~$signed((|{wire1}))) == reg7);
      reg21 <= (~{{(~^wire4)}});
      reg22 <= reg16[(2'h2):(1'h0)];
    end
  assign wire23 = wire0;
  assign wire24 = reg13;
  assign wire25 = $unsigned($signed((wire18[(1'h1):(1'h0)] ^~ $signed((~&wire12)))));
  assign wire26 = reg15;
  assign wire27 = ($unsigned(($signed($signed(wire1)) ~^ (+$unsigned(reg15)))) ?
                      {wire0[(4'ha):(4'h9)],
                          (^(&$signed(wire19)))} : $unsigned((^wire25)));
  assign wire28 = $unsigned(({$signed($signed(reg22))} ?
                      $unsigned($unsigned((reg10 ~^ wire26))) : ((~|(reg17 ?
                          wire1 : reg17)) >= (reg14 || (wire25 - reg13)))));
  assign wire29 = (reg14[(5'h13):(3'h5)] ?
                      ({(-(wire26 > wire2)),
                          reg22} <= ($signed($signed(wire19)) ^ $signed(((8'hb5) ^~ wire24)))) : wire26[(3'h4):(2'h2)]);
  assign wire30 = (wire2 >= ($unsigned(wire27) ?
                      reg14 : (!($unsigned(wire18) + {reg14}))));
  assign wire31 = (^(wire0 | $unsigned(($signed((8'h9d)) ?
                      $signed(wire4) : (wire18 ? (8'hb8) : (8'ha1))))));
  assign wire32 = reg17;
  module33 #() modinst95 (.clk(clk), .wire36(reg10), .wire34(reg14), .wire37(wire12), .y(wire94), .wire35(wire18));
  assign wire96 = $signed((8'ha3));
  assign wire97 = wire25[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg98 <= (&(~&{wire28, (8'h9f)}));
      reg99 <= {$unsigned($signed(wire96[(3'h4):(1'h1)]))};
    end
  always
    @(posedge clk) begin
      if ((~(({{wire96}} & (8'ha3)) + ((!(wire18 ?
          reg98 : reg8)) * wire32[(4'hb):(2'h2)]))))
        begin
          reg100 <= (-(^~{wire12[(4'hf):(4'h8)]}));
        end
      else
        begin
          reg100 <= (8'hbf);
        end
      reg101 <= (($signed($unsigned($signed(reg9))) ?
          $unsigned($signed((wire2 ?
              wire24 : (8'haf)))) : (($signed(wire30) - $unsigned(wire94)) << wire0[(4'h8):(3'h7)])) < {$unsigned(wire12)});
      reg102 <= $signed(((^$signed((wire27 ? (8'ha6) : wire23))) ?
          reg99 : $signed(reg15[(3'h6):(3'h5)])));
      reg103 <= {((^(~&$signed(wire0))) >> ((wire0[(4'hd):(3'h6)] ?
                  (^reg101) : $unsigned(reg11)) ?
              wire97[(3'h4):(1'h0)] : (-(reg101 * reg13))))};
      if ($signed(reg13))
        begin
          reg104 <= $unsigned((~|wire26[(2'h3):(1'h0)]));
          reg105 <= ($signed(($signed(wire23[(4'hb):(2'h3)]) ?
                  (^$unsigned(wire28)) : $unsigned(reg13))) ?
              $signed(($signed($signed(reg14)) >= wire12[(4'h9):(2'h3)])) : wire27[(4'hc):(3'h5)]);
          reg106 <= $signed((wire28 && (~|{(|reg104), reg7})));
        end
      else
        begin
          reg104 <= $unsigned(reg5);
          if ($signed($signed(reg15)))
            begin
              reg105 <= (8'hb8);
            end
          else
            begin
              reg105 <= (reg22[(1'h1):(1'h0)] ?
                  (~(wire96 ?
                      ((|(8'hb6)) >>> reg101[(1'h1):(1'h1)]) : $signed($unsigned(reg98)))) : (^(^(wire18[(4'ha):(4'h8)] ?
                      (~|reg106) : (wire1 ? reg106 : wire24)))));
              reg106 <= (wire31[(4'h8):(3'h7)] - $signed($unsigned(((reg105 << wire94) ?
                  {reg22, reg16} : (wire26 ? wire2 : reg16)))));
              reg107 <= (reg14 << wire2);
              reg108 <= reg16;
              reg109 <= (~&wire3[(3'h7):(3'h4)]);
            end
        end
    end
endmodule

module module33  (y, clk, wire34, wire35, wire36, wire37);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire34;
  input wire [(3'h5):(1'h0)] wire35;
  input wire signed [(4'hd):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire87;
  wire signed [(3'h6):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire84;
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire84,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire38 = {(^wire35)};
  assign wire39 = $unsigned($unsigned({((8'hbd) == (wire35 <<< (8'hbe)))}));
  assign wire40 = (wire39 ?
                      (^~($unsigned((^(8'hb9))) ?
                          ((wire38 <= wire38) > (wire37 > wire36)) : $signed(wire38[(1'h1):(1'h0)]))) : wire37);
  assign wire41 = $unsigned(({(~&$unsigned(wire35)),
                      ($signed((8'ha1)) ?
                          $signed(wire36) : (+wire38))} * $signed(wire37)));
  assign wire42 = ({$signed(wire39), (|(~^((8'hb0) ? (8'haf) : wire37)))} ?
                      $unsigned((8'ha4)) : (^$signed(wire39[(1'h1):(1'h1)])));
  assign wire43 = $signed($signed({$unsigned($signed(wire34)),
                      wire37[(5'h12):(5'h10)]}));
  module44 #() modinst85 (wire84, clk, wire38, wire37, wire41, wire34, wire36);
  assign wire86 = $signed($unsigned($signed({(wire41 ? wire34 : wire34),
                      (wire43 << wire38)})));
  assign wire87 = (~(8'ha3));
  assign wire88 = wire84;
  assign wire89 = $signed(((~&$unsigned(wire40)) ?
                      $signed((8'hbe)) : $signed(wire41[(2'h2):(2'h2)])));
  assign wire90 = ($unsigned(wire38) ?
                      $signed(($signed({wire38, wire37}) ?
                          (((7'h40) ? wire89 : wire37) ?
                              $unsigned(wire84) : wire35) : $signed((~&wire40)))) : (~&wire87[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg91 <= wire43;
      reg92 <= wire38[(1'h0):(1'h0)];
      reg93 <= wire39;
    end
endmodule

module module44
#(parameter param82 = ((((~((8'hb9) ? (8'ha9) : (8'hbb))) != {((8'ha2) <= (8'hb6)), (&(8'ha1))}) ? {(-((8'haf) ? (8'hbd) : (8'ha1))), (((7'h41) == (8'ha2)) ? (+(8'hb0)) : ((8'hab) | (7'h43)))} : (8'hbb)) * {(+(((8'ha2) < (8'hb6)) ^~ ((8'ha9) ? (7'h40) : (8'hb1)))), ({(+(8'hb5)), (~(8'ha3))} && {(~&(8'hbd)), {(8'hb5)}})}), 
parameter param83 = ((~param82) <= {((((8'hbc) != param82) != {(8'hb7), param82}) <= ({param82} ? ((8'h9f) >> (8'ha8)) : (param82 ? param82 : param82)))}))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire49;
  input wire [(3'h7):(1'h0)] wire48;
  input wire [(5'h13):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  input wire [(2'h2):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  assign y = {wire81,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
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
                 (1'h0)};
  assign wire50 = wire46;
  assign wire51 = $signed({{wire50[(4'hd):(3'h5)]}});
  assign wire52 = ({$signed($unsigned(wire45[(2'h2):(1'h1)]))} >>> $signed((~|wire47)));
  assign wire53 = wire46;
  assign wire54 = ((wire51[(2'h3):(1'h0)] ?
                      wire50[(4'hf):(4'ha)] : $signed($signed((wire50 ^~ wire53)))) & (~&(^~(wire53[(3'h5):(1'h0)] ?
                      wire48[(1'h1):(1'h1)] : (&wire48)))));
  assign wire55 = wire50;
  assign wire56 = $signed({wire49});
  assign wire57 = ((8'hb3) || {(!{wire56, ((8'haf) ? wire55 : wire53)})});
  assign wire58 = ($signed($signed(wire51)) ?
                      $signed($unsigned(wire52[(2'h3):(1'h0)])) : wire51[(1'h0):(1'h0)]);
  assign wire59 = wire56;
  assign wire60 = {$unsigned((($signed(wire52) == $unsigned((8'haa))) ?
                          ($unsigned(wire48) ?
                              (wire55 ?
                                  wire54 : wire52) : wire58[(1'h0):(1'h0)]) : (8'ha3))),
                      wire59[(3'h7):(1'h0)]};
  assign wire61 = (!$unsigned({$unsigned($signed(wire57))}));
  assign wire62 = wire45[(2'h2):(2'h2)];
  assign wire63 = $signed(wire61[(2'h3):(1'h0)]);
  assign wire64 = {$unsigned((wire46[(1'h0):(1'h0)] && (~|$signed(wire63)))),
                      wire60};
  assign wire65 = $signed(wire56[(1'h1):(1'h1)]);
  assign wire66 = wire59;
  assign wire67 = (wire64 ?
                      (({wire58[(1'h1):(1'h0)]} + ((wire64 ? wire59 : wire52) ?
                          wire47[(4'h8):(2'h3)] : wire57[(4'he):(3'h6)])) > $signed($signed({wire45}))) : (($unsigned(wire59) != wire58[(3'h4):(2'h2)]) ?
                          wire53[(5'h10):(4'hf)] : wire66));
  assign wire68 = wire48[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg69 <= wire46;
      reg70 <= $unsigned($signed($unsigned(((-wire66) >> wire65))));
      reg71 <= wire53;
      if ((($unsigned({((8'ha0) & reg71)}) ^ $unsigned(((wire53 ?
                  reg71 : (8'haa)) ?
              $unsigned(wire67) : {wire47}))) ?
          (&(wire66[(2'h2):(2'h2)] ?
              (((8'hbd) * reg69) >> wire61) : wire51[(1'h0):(1'h0)])) : (+($unsigned(wire63[(4'h8):(2'h2)]) | ((wire51 >>> wire48) ?
              (wire56 ? reg69 : wire48) : (reg70 ? wire49 : wire62))))))
        begin
          reg72 <= ($unsigned((8'hb0)) ~^ wire58);
          if ($signed($unsigned((!((wire59 ? reg69 : reg71) * wire45)))))
            begin
              reg73 <= $unsigned($signed(wire63[(1'h0):(1'h0)]));
            end
          else
            begin
              reg73 <= {($unsigned({wire53}) * (^~$signed(wire68))),
                  wire50[(5'h10):(4'he)]};
            end
          reg74 <= wire67;
          reg75 <= (!(((^$unsigned((8'hbb))) << $unsigned((wire45 + wire64))) ?
              (+((^~wire64) ? wire53 : $signed(reg74))) : (8'hac)));
          if (($signed((($unsigned(reg71) ? reg70 : ((8'had) < reg75)) ?
                  wire54 : ((^~wire62) << (wire59 >= wire64)))) ?
              $unsigned((wire51 ?
                  wire67 : $unsigned($signed(reg74)))) : $signed($unsigned($signed({wire53})))))
            begin
              reg76 <= (~((((^(8'ha1)) > (-wire45)) - ((wire48 ?
                      wire49 : wire66) & {wire68})) ?
                  {wire46[(3'h7):(1'h1)]} : (-wire51[(2'h2):(2'h2)])));
            end
          else
            begin
              reg76 <= (!wire61);
              reg77 <= (+(&$signed($signed($signed(reg70)))));
              reg78 <= reg76;
              reg79 <= $unsigned(wire64);
              reg80 <= $signed((^~wire49[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          reg72 <= $signed(({$unsigned((wire66 && (7'h40)))} ?
              {wire62[(4'ha):(3'h7)]} : (reg76 >>> wire65)));
        end
    end
  assign wire81 = (reg71[(4'h9):(4'h8)] ~^ ($signed($unsigned(reg70[(4'he):(4'ha)])) ?
                      (~|((8'hbf) >> (wire55 ^~ (8'ha2)))) : (((wire51 > reg72) & {wire59}) ?
                          {{wire67}} : (^$signed(reg71)))));
endmodule
