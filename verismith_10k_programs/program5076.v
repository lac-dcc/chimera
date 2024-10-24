module top
#(parameter param167 = (((((~|(8'had)) ? (-(8'hbd)) : ((8'hba) ? (8'ha2) : (8'hbf))) ? (((8'had) ? (8'hb6) : (8'ha0)) ? ((8'ha9) ? (8'hb2) : (8'h9e)) : (~|(8'h9d))) : {((8'h9f) & (8'hb6)), ((8'hb9) & (8'ha6))}) ? ((-(~(7'h44))) ? (&((8'hbe) ? (8'h9e) : (8'haf))) : (~^((8'hbd) ? (8'h9f) : (8'haa)))) : ((-((8'ha4) ? (8'hac) : (8'ha3))) >> {(~&(8'ha1)), (^~(7'h44))})) == ((|(&((7'h44) ? (8'hb9) : (8'haa)))) ? ((+((8'ha1) ? (8'haf) : (8'ha7))) ? (((7'h43) == (7'h41)) * ((8'ha4) ? (8'h9d) : (8'hba))) : (~((8'hbc) ^~ (8'ha9)))) : (((8'h9d) >> ((8'hb3) ? (8'had) : (8'ha1))) ? (((8'ha1) * (8'ha9)) ? ((7'h41) ? (8'hab) : (8'h9e)) : {(8'ha0), (8'h9c)}) : (((8'hb0) ~^ (8'haa)) ? {(8'hb8), (8'hb8)} : ((8'had) & (8'h9c)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire166;
  wire [(3'h7):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire151;
  reg signed [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(2'h2):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(5'h11):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire153,
                 wire10,
                 wire17,
                 wire19,
                 wire20,
                 wire21,
                 wire32,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire151,
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
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned(wire1[(1'h1):(1'h1)]) ?
          $unsigned(wire3[(1'h1):(1'h1)]) : $signed(wire0));
      reg6 <= {$unsigned((({(8'ha3)} ?
              $unsigned(wire1) : (!wire1)) >>> $signed((wire1 << reg5))))};
      reg7 <= $signed({(|(~&(~&wire0))), {wire4[(2'h2):(1'h1)], reg6}});
      reg8 <= (wire4[(1'h1):(1'h0)] && (wire3 || $signed(wire1)));
      reg9 <= (8'ha8);
    end
  assign wire10 = $unsigned($signed($unsigned(({reg8,
                      (8'hac)} - ((8'hb1) ~^ reg9)))));
  always
    @(posedge clk) begin
      if (reg9[(2'h2):(1'h0)])
        begin
          reg11 <= ({(~wire0), (&reg9[(2'h3):(2'h3)])} >>> (8'ha0));
        end
      else
        begin
          if ($unsigned(reg8[(3'h7):(3'h4)]))
            begin
              reg11 <= $signed(reg5);
              reg12 <= ({$signed(($signed(reg8) >> $signed(wire2)))} ?
                  (~$unsigned(({wire2} <<< (reg11 <<< reg8)))) : (+(+wire0)));
              reg13 <= $unsigned({(wire3[(3'h7):(3'h5)] ?
                      $unsigned((reg11 >= wire1)) : (reg11[(3'h7):(2'h2)] ?
                          (reg5 ? reg8 : reg9) : $unsigned((8'hba)))),
                  (-{wire0, $unsigned(reg7)})});
              reg14 <= $signed(({(8'ha6)} < {(~|(wire0 & wire1)),
                  $signed($unsigned((8'hb3)))}));
              reg15 <= reg6[(2'h2):(2'h2)];
            end
          else
            begin
              reg11 <= (-$signed(((8'hb1) >> {(&wire2),
                  (wire1 ? reg7 : reg14)})));
            end
        end
      reg16 <= $signed($unsigned($unsigned((+wire1[(1'h1):(1'h1)]))));
    end
  assign wire17 = reg13;
  always
    @(posedge clk) begin
      reg18 <= $signed(reg6[(4'ha):(4'h8)]);
    end
  assign wire19 = (($unsigned((&reg7)) ? (&wire3[(1'h1):(1'h0)]) : reg9) ?
                      reg12 : ((8'h9e) < $unsigned((((8'hac) == wire2) ?
                          (reg15 ? wire10 : reg6) : (reg8 >> reg12)))));
  assign wire20 = ((wire4[(3'h5):(3'h5)] << (~((8'hba) ?
                      wire0[(2'h3):(1'h0)] : wire3[(2'h3):(2'h2)]))) ^~ (&($signed((reg15 ?
                          reg5 : reg18)) ?
                      reg5 : wire2[(4'hb):(4'h8)])));
  assign wire21 = (8'hab);
  module22 #() modinst33 (wire32, clk, reg16, reg9, wire19, wire21);
  assign wire34 = {reg14};
  assign wire35 = (wire19[(4'h8):(2'h2)] || (!$signed(wire17[(4'h9):(3'h5)])));
  assign wire36 = $signed(((~|{(wire32 ? wire20 : (8'hb2))}) ?
                      ({wire1,
                          $unsigned(reg5)} ~^ {(^~(7'h42))}) : $unsigned($signed((reg11 ~^ reg5)))));
  assign wire37 = wire32;
  assign wire38 = {$unsigned($unsigned(((wire34 == reg12) <= wire10)))};
  assign wire39 = reg14[(5'h13):(4'h9)];
  assign wire40 = $signed((8'ha3));
  module41 #() modinst152 (wire151, clk, reg8, wire0, wire37, wire10);
  assign wire153 = (~^(wire37[(5'h10):(4'hb)] ^ (reg14[(4'h8):(3'h6)] >> (((8'ha8) > reg14) << reg5[(4'hb):(3'h7)]))));
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire0)))
        begin
          reg154 <= (($unsigned((+reg12[(3'h6):(1'h0)])) ~^ {(|(~&wire153)),
              wire1}) * (^~$signed($signed({wire2, wire151}))));
          if ($unsigned($unsigned(($unsigned($signed(wire40)) >>> $signed(wire10)))))
            begin
              reg155 <= (({{$signed(reg14)}, (^~(wire17 <= reg154))} ?
                      $signed(wire34[(4'h9):(3'h7)]) : wire38[(3'h4):(1'h1)]) ?
                  $signed($unsigned($unsigned($unsigned(wire17)))) : (~($signed((wire37 >> wire34)) ?
                      $signed((reg8 ? (7'h40) : reg8)) : ({reg14, reg7} ?
                          (wire34 ? wire17 : wire35) : (+wire40)))));
              reg156 <= ((7'h44) ?
                  {{{(~&wire36)},
                          (reg16[(1'h1):(1'h0)] ~^ reg15[(3'h5):(1'h1)])}} : wire37);
            end
          else
            begin
              reg155 <= wire0;
            end
          reg157 <= {((&(wire35 ?
                  wire35 : $signed(wire35))) >= {wire10[(3'h4):(1'h1)]}),
              wire39[(4'h8):(1'h1)]};
          reg158 <= wire3[(3'h7):(3'h5)];
          if ($unsigned($unsigned((!reg18))))
            begin
              reg159 <= (+{({$unsigned(wire38)} ? $signed(reg15) : (-{reg7}))});
              reg160 <= {(($unsigned($unsigned(reg158)) | wire37[(2'h2):(1'h1)]) < $unsigned(wire38[(4'hc):(3'h7)])),
                  {(~|wire34[(4'hf):(4'hb)]),
                      (~^(((8'hb9) ? reg15 : reg8) ? (-reg18) : (&reg157)))}};
              reg161 <= wire2;
              reg162 <= wire0;
              reg163 <= reg8;
            end
          else
            begin
              reg159 <= wire4[(3'h6):(3'h5)];
              reg160 <= (!((~|(reg163[(3'h4):(2'h2)] >> $unsigned(reg15))) == wire2[(4'ha):(3'h6)]));
              reg161 <= (reg156[(1'h1):(1'h0)] ?
                  ($signed(reg163[(2'h3):(1'h0)]) ?
                      (~^reg9[(5'h14):(5'h12)]) : ({wire19, (+reg6)} ?
                          $unsigned((reg11 < wire10)) : $signed((wire153 ?
                              reg161 : (7'h41))))) : ({$signed({reg160}),
                      (&wire35[(2'h3):(2'h2)])} == reg8));
            end
        end
      else
        begin
          reg154 <= (+((8'hac) ?
              {reg159} : (wire10[(2'h2):(1'h1)] ?
                  $unsigned(reg154[(4'he):(2'h3)]) : reg156)));
          reg155 <= reg5;
          reg156 <= reg158[(5'h11):(5'h11)];
          reg157 <= (~&wire1);
        end
    end
  assign wire164 = $unsigned({(reg8 ?
                           (wire32[(2'h2):(1'h0)] < $unsigned(wire0)) : reg8[(1'h0):(1'h0)])});
  assign wire165 = {reg163[(3'h5):(2'h3)]};
  assign wire166 = reg160;
endmodule

module module41
#(parameter param150 = {(((&((8'h9f) ~^ (8'hb2))) & (^((8'haf) ? (8'ha7) : (7'h44)))) ? {((~(8'ha5)) ? (&(8'hb0)) : (~|(8'ha3)))} : (8'hb1))})
(y, clk, wire42, wire43, wire44, wire45);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire43;
  input wire [(4'hb):(1'h0)] wire44;
  input wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire149;
  wire [(4'h8):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire146;
  wire [(4'he):(1'h0)] wire145;
  wire [(4'h9):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire [(4'ha):(1'h0)] wire140;
  wire [(5'h13):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire134;
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire58,
                 wire134,
                 reg144,
                 reg143,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire46 = wire42[(4'ha):(3'h4)];
  assign wire47 = ((wire42 ?
                      wire43 : (wire44[(3'h6):(3'h5)] ?
                          wire44[(2'h2):(2'h2)] : (~|$unsigned(wire44)))) ~^ (~|$unsigned(((~&wire44) ?
                      $unsigned(wire43) : wire44[(4'h8):(3'h7)]))));
  assign wire48 = wire42;
  assign wire49 = $unsigned({$unsigned(($unsigned(wire45) <= (wire47 && wire48)))});
  assign wire50 = wire47;
  always
    @(posedge clk) begin
      if ((~&($unsigned({$unsigned(wire50)}) ? wire46 : wire47[(3'h4):(2'h2)])))
        begin
          reg51 <= wire49;
          if ((+$unsigned(wire46)))
            begin
              reg52 <= wire50[(4'hc):(4'hc)];
              reg53 <= reg52;
              reg54 <= (wire48 ~^ $unsigned((!$signed($signed(reg52)))));
            end
          else
            begin
              reg52 <= wire49[(4'hd):(3'h6)];
            end
          if ((!$unsigned($signed({$unsigned(reg51), $signed(wire47)}))))
            begin
              reg55 <= $signed($signed(((^wire46) < $unsigned($signed(wire50)))));
            end
          else
            begin
              reg55 <= $signed($signed((((^~reg51) ~^ $unsigned(wire50)) ?
                  $signed($signed(reg55)) : (~^((8'ha8) || reg54)))));
              reg56 <= ({$unsigned((wire50[(3'h4):(1'h1)] ?
                      $unsigned(wire50) : (reg54 ?
                          wire45 : reg51)))} || reg54[(4'ha):(2'h3)]);
              reg57 <= $signed((~^wire50[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          reg51 <= $signed($signed($signed(wire47[(1'h0):(1'h0)])));
          reg52 <= wire43[(4'hd):(4'ha)];
        end
    end
  assign wire58 = (^$signed(wire49));
  always
    @(posedge clk) begin
      reg59 <= ((reg57[(4'ha):(2'h2)] ?
          reg57 : ((8'hba) ?
              ({wire44} <<< (^~wire45)) : (reg51 <<< $unsigned(wire47)))) >> $signed((-($unsigned(wire44) ~^ ((7'h44) ?
          (8'ha4) : wire43)))));
      reg60 <= $unsigned(wire50[(4'ha):(3'h7)]);
      reg61 <= {reg52, (8'had)};
    end
  always
    @(posedge clk) begin
      reg62 <= $unsigned(((reg59 && $unsigned(reg51[(4'hb):(3'h4)])) ?
          (wire46[(2'h3):(1'h0)] + wire43[(4'ha):(2'h2)]) : {reg54}));
      reg63 <= {reg51[(1'h1):(1'h1)], $signed(reg56[(3'h4):(3'h4)])};
      reg64 <= reg56[(2'h2):(1'h0)];
      if (wire48[(3'h4):(3'h4)])
        begin
          if ($signed(($unsigned(reg54) <= ({$signed(wire47),
              reg54} < ((wire48 ~^ reg52) ?
              (reg53 ? wire46 : wire43) : reg55)))))
            begin
              reg65 <= (~&reg61[(3'h7):(3'h5)]);
              reg66 <= $unsigned(({$unsigned(wire48[(1'h0):(1'h0)])} == {(~&$unsigned(wire42)),
                  $signed(wire43)}));
              reg67 <= reg56[(3'h4):(1'h1)];
              reg68 <= $signed(($unsigned(wire45) != ($unsigned((wire58 >= reg51)) >>> (reg53 << $unsigned(wire45)))));
            end
          else
            begin
              reg65 <= $signed($signed(($signed(reg66[(3'h6):(1'h1)]) ?
                  wire44[(3'h5):(2'h3)] : $unsigned({(8'hb7)}))));
              reg66 <= $unsigned($unsigned((((wire42 <= reg65) ?
                  wire46[(4'hd):(4'h8)] : {reg51, reg64}) + wire45)));
              reg67 <= $signed($signed({({(8'hbd), reg51} ?
                      wire48 : (~^reg64))}));
            end
          if ((($signed(reg64[(2'h3):(2'h2)]) + $signed(((~^(7'h41)) != (^~reg60)))) * $signed(wire58)))
            begin
              reg69 <= $unsigned(reg61);
              reg70 <= wire45;
              reg71 <= ((~|(-$unsigned((~&reg56)))) ^ (~|(((~^reg68) > (wire50 < reg66)) || {wire58[(3'h4):(1'h1)]})));
              reg72 <= $signed($signed(wire49[(4'h9):(3'h6)]));
              reg73 <= ($signed(reg63) ?
                  (&reg61) : $signed({{(reg51 ? wire47 : wire42)},
                      $signed((reg70 != (8'ha4)))}));
            end
          else
            begin
              reg69 <= $signed(({reg59[(4'hb):(3'h4)], (8'hbd)} ?
                  $signed((8'haa)) : reg52));
              reg70 <= $signed(((8'hbc) & reg53[(5'h11):(1'h1)]));
              reg71 <= (8'hb5);
              reg72 <= (8'hbf);
            end
          reg74 <= ((8'hac) ?
              $unsigned((($signed(reg55) ?
                  wire50 : (reg67 ?
                      wire42 : wire46)) != {$unsigned((8'hab))})) : $signed((((reg69 ?
                  reg61 : (8'hb3)) || (+reg62)) << $unsigned((wire42 ?
                  reg72 : wire50)))));
          if (reg70)
            begin
              reg75 <= reg62[(1'h0):(1'h0)];
              reg76 <= $signed($signed($signed(((-wire47) & reg60))));
              reg77 <= $unsigned((((reg51[(3'h7):(1'h1)] ^~ wire46[(3'h6):(2'h3)]) & {reg60[(3'h4):(1'h0)]}) ?
                  reg76[(4'hc):(1'h1)] : ($signed($signed(reg65)) >= $unsigned(reg60[(2'h2):(1'h1)]))));
              reg78 <= ((|($signed({reg51}) ? reg60 : (^$unsigned(reg54)))) ?
                  reg57[(5'h11):(5'h11)] : ({(((8'ha1) ? (8'haa) : reg77) ?
                          {reg55,
                              reg73} : $signed(reg67))} & (!$unsigned((8'ha4)))));
              reg79 <= reg53;
            end
          else
            begin
              reg75 <= $unsigned((&(reg60 ^~ $unsigned((reg53 ?
                  reg53 : wire58)))));
              reg76 <= $unsigned(reg69);
            end
        end
      else
        begin
          reg65 <= (8'hb0);
        end
      reg80 <= ($unsigned(reg56) && $unsigned(wire50[(2'h3):(2'h2)]));
    end
  module81 #() modinst135 (wire134, clk, reg56, wire43, reg57, reg59, reg79);
  assign wire136 = wire50[(1'h0):(1'h0)];
  assign wire137 = $signed($signed($signed(reg67[(3'h5):(2'h3)])));
  assign wire138 = $unsigned($unsigned({{reg65}}));
  assign wire139 = wire136;
  assign wire140 = $unsigned((|(wire138[(4'hf):(3'h4)] ?
                       $unsigned(wire58) : (|{wire47, reg67}))));
  assign wire141 = {$signed((^{$unsigned(wire140)})), (8'hb7)};
  assign wire142 = (&$signed({reg51[(4'hc):(1'h1)],
                       {reg77[(2'h2):(1'h1)], $signed((8'had))}}));
  always
    @(posedge clk) begin
      reg143 <= reg65;
      reg144 <= reg65[(4'h9):(2'h2)];
    end
  assign wire145 = (&(+reg74));
  assign wire146 = $signed(wire139);
  assign wire147 = (reg65[(1'h0):(1'h0)] >>> $unsigned((reg57 ?
                       $signed((8'ha4)) : ((reg53 ? reg79 : reg63) ?
                           reg72 : (reg76 ? reg63 : reg63)))));
  assign wire148 = (-$unsigned(reg51));
  assign wire149 = $unsigned((wire43[(4'hd):(2'h2)] ~^ reg144[(1'h0):(1'h0)]));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  assign y = {wire31, wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = (wire26 ?
                      $signed(wire24) : (|$unsigned($unsigned(wire26[(1'h0):(1'h0)]))));
  assign wire28 = wire24;
  assign wire29 = (wire24 ?
                      (~|{wire27[(2'h2):(2'h2)],
                          (~^$signed(wire23))}) : wire25);
  assign wire30 = wire25[(3'h4):(2'h3)];
  assign wire31 = wire29[(3'h4):(1'h1)];
endmodule

module module81
#(parameter param133 = {(~&(~(!((7'h44) == (8'hbf)))))})
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire86;
  input wire [(4'ha):(1'h0)] wire85;
  input wire [(4'ha):(1'h0)] wire84;
  input wire [(5'h13):(1'h0)] wire83;
  input wire signed [(3'h4):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire104;
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire123,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg125,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg87 <= ({($signed((^~(7'h41))) + (wire84 <= wire84))} ?
          wire85 : $signed($signed($signed((-(7'h43))))));
      reg88 <= ((($signed((wire83 * wire84)) >>> $signed($unsigned(wire84))) ?
          {(wire82[(1'h1):(1'h0)] <= (8'hab)),
              (reg87[(4'h9):(1'h0)] >>> (wire82 & wire83))} : (((wire82 >= wire82) & (wire84 >= wire86)) ?
              ($signed(wire82) ?
                  (wire85 ?
                      wire84 : wire86) : reg87[(3'h6):(2'h2)]) : $signed(wire84[(4'h8):(4'h8)]))) | {(|(+wire83))});
      if (($unsigned((wire83 ?
              $unsigned(reg87) : ($signed(wire85) | $unsigned(wire84)))) ?
          (~|wire85[(4'h8):(4'h8)]) : reg88[(2'h3):(2'h2)]))
        begin
          reg89 <= $signed(($signed((~^wire83)) ?
              {wire85[(1'h1):(1'h0)]} : wire82[(2'h3):(2'h2)]));
          reg90 <= $signed(((((reg88 ? wire82 : wire82) ?
                  $unsigned(reg87) : reg88[(2'h2):(2'h2)]) >= ({reg88} ?
                  (reg88 ? wire83 : wire83) : (wire84 ? (8'hb6) : reg88))) ?
              (~|wire84) : wire84[(3'h7):(3'h5)]));
          if ($unsigned(wire84[(3'h7):(1'h1)]))
            begin
              reg91 <= wire83;
              reg92 <= $signed({wire86[(1'h0):(1'h0)]});
              reg93 <= $signed(wire86);
              reg94 <= (reg93 ? wire82[(2'h3):(1'h0)] : wire82);
            end
          else
            begin
              reg91 <= ((^~$unsigned({{wire82}, $unsigned(reg90)})) ?
                  wire86[(4'h8):(2'h3)] : $unsigned({$unsigned($unsigned((8'h9c))),
                      wire82[(1'h1):(1'h0)]}));
            end
          reg95 <= (~((~|(reg94 && reg87[(1'h1):(1'h1)])) ?
              (((-wire83) ? (reg90 ? reg91 : wire83) : {wire83, reg93}) ?
                  $signed(reg88) : $unsigned($signed(wire83))) : $signed($signed($unsigned(wire86)))));
        end
      else
        begin
          reg89 <= $signed(wire82[(2'h2):(1'h1)]);
          if ($unsigned(({reg94[(3'h4):(2'h3)],
                  {(8'h9f), (reg92 ? wire84 : reg87)}} ?
              $signed(($unsigned(reg91) ?
                  $signed(reg95) : (reg93 ?
                      wire83 : reg92))) : $unsigned(wire85[(2'h2):(2'h2)]))))
            begin
              reg90 <= ({wire82[(2'h3):(2'h3)],
                  (reg92[(5'h12):(4'h8)] >>> wire85[(3'h6):(3'h6)])} ^~ (8'hae));
              reg91 <= $unsigned(reg95[(1'h1):(1'h0)]);
              reg92 <= {reg91,
                  ((reg95 && $unsigned(reg95)) + {wire86, (8'hb1)})};
              reg93 <= $signed({$signed({$unsigned(reg90)}),
                  (^~((reg92 >= wire82) + {(7'h40)}))});
              reg94 <= wire82[(1'h0):(1'h0)];
            end
          else
            begin
              reg90 <= $signed(wire84[(1'h1):(1'h0)]);
              reg91 <= (wire83 ? (8'haf) : reg93[(2'h3):(2'h3)]);
              reg92 <= $signed(reg91[(1'h1):(1'h0)]);
              reg93 <= ((reg91[(3'h6):(3'h5)] ?
                      $signed($signed({wire84,
                          reg92})) : $signed(((reg95 > reg93) ?
                          $signed(reg87) : (wire83 ? wire86 : wire82)))) ?
                  (~|{reg91}) : $unsigned((reg93[(1'h0):(1'h0)] ?
                      $signed((reg88 ?
                          reg94 : reg90)) : ((8'ha9) << $signed(wire82)))));
              reg94 <= ((reg89[(3'h5):(3'h5)] | $unsigned(wire83[(4'hc):(3'h6)])) <= wire84);
            end
          reg95 <= ($signed($unsigned(reg87[(3'h4):(1'h1)])) ?
              (~^(((reg91 ^~ (8'ha1)) ? reg90 : wire84[(2'h3):(2'h3)]) ?
                  $signed(((8'hb8) - wire83)) : reg92)) : reg90[(2'h3):(2'h2)]);
          reg96 <= (8'h9f);
          reg97 <= $unsigned(reg88);
        end
      reg98 <= ((((~&(reg89 ? reg97 : reg89)) ?
                  $signed({wire85, reg94}) : ($signed(wire82) && (reg96 ?
                      wire82 : wire83))) ?
              $unsigned(((|wire84) | reg91[(1'h0):(1'h0)])) : reg87[(1'h1):(1'h1)]) ?
          (^~(8'ha3)) : (!(((reg90 ^ wire84) && $unsigned(reg90)) < reg88[(3'h4):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg99 <= ({$signed((8'hbb))} ?
          (&(~^((reg92 ? reg89 : (8'hb3)) ?
              reg92 : $unsigned(wire84)))) : ((~|(~(+reg96))) ^~ ($unsigned($signed(reg98)) ?
              ((8'haa) - (reg96 ?
                  wire85 : wire83)) : $signed(reg91[(3'h5):(3'h4)]))));
      reg100 <= ({$signed($unsigned(reg98))} ?
          ((|reg92) ?
              (((8'hb3) != (reg98 < reg96)) <<< reg96) : wire85[(4'h9):(3'h6)]) : reg90[(3'h6):(2'h2)]);
      reg101 <= wire83;
      reg102 <= $unsigned($unsigned((!{$signed(wire84),
          wire84[(4'h9):(3'h5)]})));
      reg103 <= reg87[(3'h7):(2'h3)];
    end
  assign wire104 = wire85[(3'h7):(3'h6)];
  assign wire105 = ({(($signed((8'hb3)) ?
                           wire104 : reg87[(2'h2):(1'h1)]) <<< (reg97[(1'h1):(1'h0)] && (reg88 ?
                           reg93 : reg96))),
                       $signed((7'h44))} ^~ wire86[(3'h7):(3'h5)]);
  assign wire106 = (8'ha8);
  assign wire107 = (wire83[(2'h2):(1'h1)] ?
                       reg99 : ($unsigned((reg103 ?
                           $signed(reg102) : $unsigned(reg97))) <= {((wire82 - reg101) << {reg101}),
                           $unsigned(wire106)}));
  assign wire108 = $signed($unsigned(($signed(reg96[(4'h8):(3'h6)]) ?
                       ($unsigned(wire104) >= (reg96 ?
                           (8'ha4) : reg100)) : (^reg102[(2'h3):(1'h0)]))));
  assign wire109 = wire84[(1'h0):(1'h0)];
  assign wire110 = ((7'h40) ?
                       $unsigned(((&{reg96,
                           reg92}) >> wire84)) : ((|reg97) <<< reg98));
  assign wire111 = ({reg91} * $unsigned($signed({(reg102 << reg98)})));
  assign wire112 = $unsigned(wire84);
  always
    @(posedge clk) begin
      reg113 <= wire84[(2'h3):(2'h3)];
      reg114 <= $signed(reg93);
      if ($signed(reg91[(3'h5):(2'h3)]))
        begin
          reg115 <= wire105;
          reg116 <= (^~$signed($unsigned((reg97 >>> $signed(reg95)))));
        end
      else
        begin
          reg115 <= ($signed((^~wire105)) & $signed($signed($signed(wire105))));
          reg116 <= $signed($unsigned(reg102[(3'h6):(3'h6)]));
          reg117 <= wire106;
          reg118 <= reg88;
          if (reg96)
            begin
              reg119 <= $unsigned((&{reg103[(3'h5):(1'h1)],
                  (wire83 || reg103)}));
            end
          else
            begin
              reg119 <= $signed(({{$signed(reg94), wire107},
                      ((^reg119) ? (reg99 > (8'hab)) : $unsigned(wire111))} ?
                  reg90[(3'h7):(2'h3)] : $unsigned(($signed(reg96) ^ ((8'hb3) ?
                      reg114 : reg95)))));
              reg120 <= $unsigned($unsigned(reg91[(1'h0):(1'h0)]));
              reg121 <= (|reg89);
            end
        end
      reg122 <= ((reg120 <= reg97) ?
          $unsigned($signed($signed($unsigned(reg93)))) : (^~reg96));
    end
  assign wire123 = $unsigned($unsigned(reg93[(1'h0):(1'h0)]));
  assign wire124 = wire106;
  always
    @(posedge clk) begin
      reg125 <= {reg93[(4'hc):(2'h2)]};
    end
  assign wire126 = $signed((wire86[(2'h2):(1'h0)] ?
                       wire123[(1'h1):(1'h1)] : {($unsigned((8'hab)) ?
                               {wire106, reg101} : ((8'ha0) ? reg117 : reg94)),
                           $signed({wire106, wire82})}));
  assign wire127 = reg125;
  assign wire128 = $unsigned((wire104 ?
                       ($signed($unsigned((8'hb4))) ?
                           {(-wire85)} : ((reg100 * reg98) ~^ wire107)) : reg102[(4'h9):(2'h3)]));
  assign wire129 = $unsigned((&reg92));
  assign wire130 = ((wire128 ? $unsigned(wire123) : $unsigned(reg94)) ?
                       (^~$signed(((wire107 << reg94) ?
                           (wire86 | reg98) : $signed((8'ha9))))) : wire104);
  assign wire131 = {((-((wire129 ?
                           (8'hb0) : wire85) + (-wire124))) | ($signed($signed(reg98)) ?
                           $unsigned($signed(wire109)) : ((~^reg120) - reg103)))};
  assign wire132 = reg89;
endmodule
