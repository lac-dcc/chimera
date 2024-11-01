module top
#(parameter param89 = ((((+{(8'ha1)}) | (((8'hb1) << (8'ha2)) || (8'had))) ? ((~(8'hbd)) ? (|{(7'h42)}) : (((8'hbf) << (7'h40)) * {(8'hae)})) : (+(((8'hbd) & (8'hb7)) ? (-(8'hb2)) : {(7'h44)}))) ? ({(((8'hab) * (8'ha3)) == ((8'h9c) ? (7'h43) : (8'hb3))), {((7'h42) ? (7'h42) : (8'ha4)), ((8'haa) >= (8'hb1))}} ~^ (8'hb8)) : (+{(-((8'hae) + (8'ha8))), (+((8'hb7) ? (7'h43) : (8'had)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire78;
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire78,
                 reg88,
                 reg87,
                 reg86,
                 reg80,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed((((wire3[(2'h2):(1'h1)] <= (~^(8'hb3))) ?
              wire2 : (~&(wire0 ? wire1 : wire3))) ?
          wire2[(1'h1):(1'h1)] : $signed((wire3[(3'h4):(1'h1)] >>> $unsigned(wire0)))));
    end
  module5 #() modinst79 (wire78, clk, wire2, wire1, wire0, reg4, wire3);
  always
    @(posedge clk) begin
      reg80 <= (wire0 ?
          wire2 : ((((wire1 ^~ reg4) ^~ reg4[(2'h3):(1'h0)]) <= {(wire2 || wire3)}) ?
              (+$unsigned($signed(wire2))) : ({wire3} ?
                  wire78 : ((wire1 ? wire78 : wire3) ?
                      (wire2 >> wire78) : $signed(wire0)))));
    end
  assign wire81 = (((|(8'hbb)) ?
                      reg80 : (~^$unsigned($unsigned(reg80)))) | (^($unsigned((+reg4)) ?
                      $signed($signed((8'hb2))) : ($unsigned(wire3) | ((8'hbe) ?
                          reg4 : wire2)))));
  assign wire82 = wire0[(3'h5):(2'h2)];
  assign wire83 = $unsigned((|wire82));
  assign wire84 = reg4;
  assign wire85 = {{(({wire0} ? (!wire78) : (reg4 * wire78)) ?
                              wire3[(2'h2):(2'h2)] : (reg4 ?
                                  (wire1 ? reg80 : reg80) : {wire1})),
                          (&wire3)}};
  always
    @(posedge clk) begin
      reg86 <= wire1[(2'h2):(1'h0)];
      reg87 <= {$unsigned((($unsigned(wire83) | wire83[(2'h3):(2'h2)]) ?
              (!reg80[(4'h8):(3'h7)]) : $signed(wire2[(4'hf):(4'h8)]))),
          $unsigned(($unsigned(reg80[(3'h7):(3'h7)]) ?
              {$signed(reg80),
                  wire1[(4'h9):(4'h9)]} : $signed((reg86 > wire82))))};
      reg88 <= (($unsigned($signed(((8'hb3) * reg4))) ?
              ($unsigned((&wire81)) ?
                  (wire78 ? wire81 : (-wire1)) : reg4) : ((^{wire82}) ?
                  wire3 : (^~$signed(reg4)))) ?
          wire0[(5'h12):(4'he)] : $unsigned((&reg86)));
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire48,
                 wire23,
                 wire13,
                 wire12,
                 wire11,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire11 = wire10[(2'h2):(2'h2)];
  assign wire12 = {((+wire11[(3'h6):(3'h5)]) ?
                          {(~(wire6 ? (8'ha7) : wire6))} : ({(wire8 ?
                                      wire7 : wire6)} ?
                              (+wire11) : ({wire11} ?
                                  (~|wire6) : (~|wire11))))};
  assign wire13 = ((wire12[(3'h7):(1'h1)] + $signed(wire8)) ?
                      wire10[(5'h12):(4'hc)] : wire6);
  module14 #() modinst24 (wire23, clk, wire13, wire7, wire8, wire9);
  module25 #() modinst49 (wire48, clk, wire13, wire10, wire12, wire23);
  always
    @(posedge clk) begin
      reg50 <= (~^$signed(($signed(wire12[(4'ha):(4'h8)]) ?
          (wire6 ? (+wire12) : {wire11}) : wire9[(1'h1):(1'h0)])));
      if (wire10[(3'h5):(1'h0)])
        begin
          if (((reg50 <= (8'hab)) ?
              $unsigned((((wire23 ?
                  wire9 : wire48) ^~ wire8) <= wire48)) : ($unsigned(wire7) ^ (8'ha4))))
            begin
              reg51 <= (wire13 ?
                  $signed((((8'h9e) ?
                      (-wire48) : $unsigned(wire11)) >= (8'hb6))) : (|$unsigned(wire23[(4'h9):(2'h2)])));
              reg52 <= ((&$signed(((wire23 == wire11) ?
                  (wire6 ?
                      wire8 : reg50) : {wire9}))) >> $unsigned((!wire8[(5'h10):(4'hd)])));
              reg53 <= (7'h41);
              reg54 <= $signed(reg53[(2'h3):(2'h2)]);
            end
          else
            begin
              reg51 <= $unsigned($unsigned({((^(8'hb8)) > $signed(reg53))}));
              reg52 <= wire6[(4'he):(4'he)];
            end
        end
      else
        begin
          reg51 <= (^(~^({$unsigned((8'had)), $unsigned((8'hbc))} ?
              (!$signed(reg52)) : $unsigned(wire48))));
          reg52 <= ((^~($signed((wire13 ? wire23 : wire48)) ?
                  (-{wire7}) : (~$signed(wire48)))) ?
              reg51[(1'h1):(1'h1)] : $signed($unsigned(((~|wire9) ^~ wire7[(3'h7):(3'h7)]))));
        end
      reg55 <= {reg52[(4'hd):(1'h0)]};
      reg56 <= $signed((!(&$signed(reg55))));
      reg57 <= $unsigned(reg53[(2'h3):(2'h3)]);
    end
  assign wire58 = $signed((wire48 ?
                      ($signed((wire12 * reg51)) & (~&{wire8,
                          reg51})) : (($signed((8'hbd)) ?
                          $signed((8'hae)) : wire9[(4'ha):(4'ha)]) ^~ ((+wire13) ?
                          {reg50} : $unsigned(reg54)))));
  assign wire59 = $unsigned(((wire11[(2'h3):(1'h0)] && wire13) ?
                      ($unsigned($unsigned(wire12)) * $unsigned((&reg52))) : (8'ha4)));
  assign wire60 = wire8[(5'h12):(4'h9)];
  assign wire61 = ((+wire12[(4'hd):(4'ha)]) ?
                      wire6 : ((+($unsigned(wire12) - wire59)) ?
                          ($signed((wire58 | wire48)) ?
                              (&(reg53 & wire23)) : reg50[(3'h5):(1'h0)]) : $unsigned($signed($signed(reg51)))));
  assign wire62 = (~&(wire60[(2'h2):(1'h0)] ?
                      $signed($signed($unsigned(reg54))) : $signed($signed(wire11[(3'h5):(3'h5)]))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire9)))
        begin
          if ((((($unsigned(reg54) ?
                  {wire11, wire58} : (wire10 << reg53)) >>> {reg51,
                  $unsigned(wire6)}) ?
              wire48[(2'h2):(2'h2)] : $signed(reg53)) >= (($signed($signed((8'h9e))) ?
              (reg53 ?
                  $signed(wire13) : $unsigned(wire61)) : $unsigned((wire59 <<< wire59))) <= (~(+reg56[(4'h8):(1'h0)])))))
            begin
              reg63 <= $unsigned($signed(({wire60[(1'h1):(1'h0)]} ?
                  (|(|reg54)) : (~wire11[(1'h1):(1'h1)]))));
              reg64 <= ((^$signed(wire61)) <= $unsigned((8'haa)));
            end
          else
            begin
              reg63 <= $unsigned(wire48[(2'h3):(2'h2)]);
              reg64 <= reg50[(3'h6):(2'h3)];
              reg65 <= $unsigned((({(8'hb8)} ?
                  $unsigned($unsigned(wire11)) : {(wire9 == (8'h9e))}) | reg55[(5'h10):(4'h9)]));
              reg66 <= (reg57 ?
                  $unsigned(wire61[(3'h7):(2'h2)]) : reg56[(1'h0):(1'h0)]);
            end
          reg67 <= ($signed($unsigned(($signed((8'h9e)) ?
              $unsigned(wire12) : ((8'hb6) || wire6)))) ~^ $signed($signed(wire60)));
          if ({$unsigned((~|((wire11 != reg51) >= $unsigned(wire12)))),
              (!$signed((wire9[(3'h7):(1'h0)] != (wire10 ? wire9 : (8'hb9)))))})
            begin
              reg68 <= $unsigned($signed($unsigned($unsigned(reg55[(4'hb):(3'h7)]))));
              reg69 <= reg67[(3'h5):(2'h3)];
              reg70 <= (wire11[(1'h0):(1'h0)] || $signed((~|(&$unsigned(wire58)))));
            end
          else
            begin
              reg68 <= $unsigned(wire58[(3'h6):(3'h5)]);
              reg69 <= $signed(wire62[(3'h7):(3'h6)]);
            end
          reg71 <= $signed(({$unsigned($signed(wire61))} ?
              $signed(({reg55, wire13} ? reg69 : wire48)) : $unsigned(reg53)));
          reg72 <= (8'hab);
        end
      else
        begin
          reg63 <= reg65;
          if ({(wire61 >> (^(^{wire7})))})
            begin
              reg64 <= ((reg50[(3'h6):(1'h0)] ?
                  reg50[(2'h2):(1'h0)] : (wire48[(1'h1):(1'h1)] ~^ (~((8'h9d) ?
                      wire60 : (8'ha6))))) >> {$unsigned((!wire8)),
                  (wire9[(4'h9):(2'h2)] >> {(wire13 * reg71)})});
              reg65 <= {(wire9 - wire60),
                  $unsigned(($unsigned((wire6 & wire62)) + (^$unsigned(reg68))))};
              reg66 <= (((^~(~reg70[(1'h0):(1'h0)])) ?
                  wire7 : (~$signed((wire48 != reg50)))) <<< (+((|(~&reg68)) + reg54)));
            end
          else
            begin
              reg64 <= (~&(wire9[(3'h4):(1'h0)] - {reg69[(3'h4):(3'h4)]}));
              reg65 <= reg65;
              reg66 <= $unsigned($signed((^~$signed($signed((8'hab))))));
            end
          reg67 <= {$unsigned($signed({reg54, (8'hb3)})),
              $signed(wire6[(4'hb):(3'h4)])};
          if (reg52[(3'h4):(1'h1)])
            begin
              reg68 <= {wire12[(5'h11):(5'h10)],
                  ($unsigned($signed((|reg55))) ? (!(8'ha5)) : reg71)};
              reg69 <= $unsigned(wire59[(2'h3):(2'h3)]);
              reg70 <= $signed(reg69[(4'hc):(3'h7)]);
              reg71 <= $unsigned((reg66[(3'h4):(2'h3)] - (-(|(^~wire13)))));
              reg72 <= (($unsigned(($unsigned(wire7) ?
                          (wire61 <<< reg69) : (reg50 ? reg72 : wire11))) ?
                      ((reg51[(3'h5):(1'h1)] >> (~reg66)) ?
                          wire13[(5'h11):(2'h2)] : wire10) : $unsigned({reg66})) ?
                  $unsigned(reg63[(4'h8):(1'h0)]) : $signed($signed($signed($unsigned(reg50)))));
            end
          else
            begin
              reg68 <= $signed(((^{$unsigned(reg63)}) < wire11[(4'h8):(1'h1)]));
              reg69 <= reg50[(4'ha):(1'h1)];
            end
          reg73 <= $unsigned(reg71);
        end
    end
  assign wire74 = $signed(($unsigned(((~|wire6) * $signed(wire8))) < (((8'hb2) ?
                      $signed((8'hab)) : reg55) < ((^(8'ha8)) - wire59))));
  assign wire75 = $unsigned(($unsigned(wire48[(3'h4):(2'h3)]) ^~ reg71[(2'h2):(1'h1)]));
  assign wire76 = (!(^((8'hae) != $signed($signed(wire58)))));
  assign wire77 = (~|($unsigned((^(reg70 >>> reg63))) ? wire11 : wire76));
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire signed [(4'hf):(1'h0)] wire28;
  input wire signed [(2'h3):(1'h0)] wire27;
  input wire [(4'he):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg44,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire30 = wire28;
  assign wire31 = wire29;
  assign wire32 = $unsigned(wire30);
  assign wire33 = (wire32[(2'h3):(2'h2)] * $signed(wire27));
  assign wire34 = (&(wire26[(4'hc):(1'h0)] >>> $unsigned(wire28)));
  assign wire35 = $unsigned($unsigned($signed(wire26)));
  assign wire36 = $unsigned((+{wire31, $unsigned((!wire35))}));
  assign wire37 = (~|($unsigned($unsigned((wire27 - wire31))) ?
                      ({(~^(8'hbd)), {wire35}} ?
                          $unsigned($signed((8'hac))) : wire36[(1'h1):(1'h1)]) : $signed((^~{wire34,
                          wire27}))));
  always
    @(posedge clk) begin
      if ((({(!{wire37, wire30})} * (-wire37)) ?
          wire32[(1'h1):(1'h1)] : wire27))
        begin
          reg38 <= wire28[(3'h4):(2'h3)];
          reg39 <= $unsigned((wire32[(3'h5):(1'h0)] < $unsigned(wire36)));
          reg40 <= (&$signed($unsigned(($unsigned(wire29) ?
              wire29 : (~|wire35)))));
          reg41 <= wire26;
          reg42 <= $unsigned(wire29[(4'hc):(1'h1)]);
        end
      else
        begin
          reg38 <= {(!(~|(~^{(8'ha2), wire34})))};
          reg39 <= $unsigned(wire28[(4'h9):(3'h4)]);
          reg40 <= (wire29[(3'h5):(2'h3)] <<< $signed(wire34));
        end
    end
  assign wire43 = (((wire29[(4'h9):(3'h7)] ~^ wire37) && (^~$signed((reg41 != wire29)))) ?
                      ($signed($unsigned($signed(wire35))) >> ({$unsigned((8'hb3))} + $unsigned(wire37))) : (^wire33));
  always
    @(posedge clk) begin
      reg44 <= (^wire36[(1'h0):(1'h0)]);
    end
  assign wire45 = wire27[(2'h2):(1'h1)];
  assign wire46 = wire43[(3'h4):(3'h4)];
  assign wire47 = wire33;
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h18):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire signed [(2'h3):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  assign y = {wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = ($unsigned(wire17[(2'h3):(1'h1)]) ?
                      {{$signed($unsigned(wire17)), (8'hb9)},
                          (+(wire15[(1'h0):(1'h0)] >>> (wire16 - wire18)))} : ($unsigned(wire17) ?
                          {wire16} : (+wire18[(3'h5):(3'h5)])));
  assign wire20 = wire17[(1'h1):(1'h0)];
  assign wire21 = {wire17};
  assign wire22 = $unsigned((($signed((8'ha9)) ?
                          $unsigned((+wire15)) : $unsigned(wire18[(1'h1):(1'h1)])) ?
                      (((+wire20) & wire20[(1'h1):(1'h1)]) | $signed((wire17 ?
                          wire20 : wire16))) : wire16));
endmodule
