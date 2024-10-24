module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire91,
                 wire90,
                 wire89,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire5,
                 wire4,
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
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (((8'hb7) ?
                     ((8'hb8) > $signed($signed(wire4))) : ((^~(wire1 ?
                             (8'hab) : wire2)) ?
                         $signed((wire3 != wire2)) : ((~&wire3) ?
                             $signed(wire2) : $unsigned(wire4)))) >> (wire4[(3'h6):(2'h3)] ?
                     (wire0 ?
                         (wire0 || (wire3 ?
                             wire3 : wire1)) : (7'h43)) : $unsigned(wire0[(4'he):(3'h4)])));
  module6 #() modinst80 (wire79, clk, wire0, wire4, wire2, wire5);
  assign wire81 = $unsigned((wire0 == (({wire4} ?
                      (~&wire4) : $unsigned(wire2)) < (~|(^wire4)))));
  assign wire82 = ((&(+$unsigned(wire3[(1'h1):(1'h0)]))) != ((~^($unsigned(wire5) ?
                      ((8'ha2) ?
                          wire1 : wire0) : $unsigned(wire2))) & {$unsigned($signed(wire5))}));
  assign wire83 = {wire0[(5'h10):(3'h4)]};
  assign wire84 = (-(~wire3));
  always
    @(posedge clk) begin
      reg85 <= (((-wire82[(3'h4):(3'h4)]) ~^ ((~|{wire5, (7'h44)}) ?
              $signed((wire5 ?
                  wire81 : (8'hb5))) : (~^wire79[(3'h5):(2'h2)]))) ?
          wire2[(4'hd):(2'h3)] : wire1[(4'ha):(3'h7)]);
      reg86 <= wire4;
      reg87 <= ($signed(wire5) >>> (8'hb8));
      reg88 <= (wire83 ?
          $signed({$unsigned((~|(8'ha7))),
              wire2}) : $signed(wire4[(5'h13):(4'h8)]));
    end
  assign wire89 = (+((~^(8'hb2)) >> wire2));
  assign wire90 = wire79;
  assign wire91 = wire79[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg92 <= $signed($signed(({(wire90 <= wire89), (~^reg87)} ?
          {wire83} : (((8'hb4) && reg88) ? (-reg87) : wire79[(2'h2):(1'h1)]))));
      reg93 <= (!$unsigned({$unsigned(wire90[(4'h8):(3'h7)]),
          $signed($signed(wire84))}));
      if ((($unsigned($unsigned((~^reg88))) ?
              reg87[(3'h5):(1'h1)] : $unsigned(wire1)) ?
          {{reg92, (8'ha4)},
              ($signed($unsigned(wire84)) ?
                  $unsigned($signed(wire2)) : (wire89[(4'h8):(2'h2)] == wire91))} : $unsigned(((reg86[(1'h1):(1'h1)] ?
              $unsigned(reg88) : $unsigned((8'ha1))) >>> ((reg92 ?
              wire89 : wire91) >>> $unsigned((8'hb8)))))))
        begin
          reg94 <= wire83;
          if ($signed((~&($signed((|wire3)) + {$unsigned(wire0), (!wire79)}))))
            begin
              reg95 <= wire2[(3'h6):(1'h0)];
              reg96 <= $unsigned({(~&$signed((wire4 >>> reg86))),
                  $signed($signed(wire0))});
              reg97 <= $signed((reg86[(1'h0):(1'h0)] & $signed(wire81[(1'h0):(1'h0)])));
            end
          else
            begin
              reg95 <= ({$unsigned($unsigned((reg85 * reg86))),
                  (({wire91} << wire5) ?
                      $signed(((8'ha8) ?
                          reg96 : reg86)) : {wire82[(2'h2):(1'h0)],
                          wire4[(3'h4):(1'h0)]})} * {reg92[(3'h7):(2'h2)],
                  {$unsigned($signed((8'hb1))),
                      $signed(wire3[(4'h8):(1'h0)])}});
              reg96 <= reg86[(1'h0):(1'h0)];
              reg97 <= (wire83 >= $unsigned($unsigned($unsigned((|(8'haa))))));
            end
          reg98 <= $unsigned({($unsigned(reg86) | wire2)});
          if (($signed({(-$signed(wire83)), (8'ha6)}) < (~|(-reg93))))
            begin
              reg99 <= (wire2[(4'hb):(1'h0)] ? wire5 : reg87[(2'h3):(1'h0)]);
              reg100 <= reg94;
            end
          else
            begin
              reg99 <= $signed((~(reg87 ?
                  ($signed(reg86) ?
                      $signed(wire91) : (wire89 ^ reg95)) : ($signed(reg87) ?
                      {wire89, wire3} : wire79))));
              reg100 <= (wire89 || reg100);
              reg101 <= {{((~&$signed(wire90)) - reg99[(3'h5):(1'h0)]),
                      wire1[(4'hc):(3'h5)]},
                  ((wire84[(2'h2):(1'h1)] ?
                          (wire90[(4'h8):(3'h7)] ?
                              (+wire82) : (^wire4)) : $signed(((7'h40) ?
                              wire3 : wire90))) ?
                      wire5 : $unsigned({(~reg86)}))};
            end
          if ($signed({$unsigned(wire81[(2'h2):(1'h1)])}))
            begin
              reg102 <= (({$unsigned($unsigned(wire89)),
                          $unsigned($unsigned(reg86))} ?
                      wire89 : wire83) ?
                  wire83[(3'h5):(2'h2)] : reg100[(5'h15):(5'h10)]);
              reg103 <= wire84;
            end
          else
            begin
              reg102 <= (~^$unsigned(reg98[(4'hb):(3'h6)]));
              reg103 <= wire1;
              reg104 <= (|reg96);
              reg105 <= (8'ha0);
            end
        end
      else
        begin
          if (wire4[(3'h5):(2'h2)])
            begin
              reg94 <= (wire79 <= wire90[(3'h5):(3'h5)]);
              reg95 <= $unsigned(reg86[(2'h2):(1'h1)]);
            end
          else
            begin
              reg94 <= {$signed($signed(reg85)),
                  ($signed($signed((reg103 ?
                      wire79 : reg96))) ^~ $signed({$signed(reg85),
                      reg104[(4'hc):(1'h0)]}))};
              reg95 <= reg102[(1'h0):(1'h0)];
              reg96 <= (~&$signed(wire91[(4'ha):(1'h1)]));
              reg97 <= reg101;
              reg98 <= {$signed((reg88[(1'h0):(1'h0)] | $unsigned(((8'hbe) ?
                      wire90 : reg100))))};
            end
          reg99 <= {$signed(reg92),
              $signed(($signed({reg96}) > ((wire91 ^ wire81) ?
                  $unsigned(reg88) : wire91)))};
          reg100 <= {reg99};
          reg101 <= ($unsigned((~|$unsigned(wire83))) == {reg99[(3'h6):(2'h3)],
              $signed((wire4[(3'h6):(2'h3)] ?
                  (reg101 ? reg93 : wire2) : reg100))});
          reg102 <= $signed(({(^~wire4[(5'h13):(4'hb)])} ?
              $unsigned(({reg102} ?
                  ((7'h40) ?
                      wire4 : reg104) : (^reg85))) : $unsigned({$signed(reg96)})));
        end
      reg106 <= (!(~&$signed(((reg99 >> reg93) ?
          reg85[(1'h1):(1'h0)] : reg101))));
    end
  assign wire107 = wire84[(1'h0):(1'h0)];
  assign wire108 = $signed((8'ha6));
  assign wire109 = (^~$unsigned(wire84));
endmodule

module module6
#(parameter param77 = (|((^({(8'hac), (8'hbd)} ? ((8'hbd) ? (8'hba) : (8'hbe)) : {(8'ha8), (7'h43)})) | (|(|(|(8'ha8)))))), 
parameter param78 = (((((param77 ? param77 : param77) >= (-param77)) ? ((&param77) ? (param77 ? param77 : param77) : param77) : ((param77 ? param77 : param77) != {param77})) ? (8'hae) : (((~param77) ^ (param77 <= (8'h9e))) ? (~|param77) : param77)) >>> ((((~&param77) ? (param77 ? param77 : param77) : param77) ? (~|(param77 ? (8'ha5) : param77)) : {param77}) ? (~&((param77 ^ (8'hb2)) ? (-param77) : (8'ha1))) : (((param77 ? param77 : param77) ? param77 : (|param77)) ^ param77))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire11;
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  assign y = {wire75,
                 wire63,
                 wire62,
                 wire60,
                 wire28,
                 wire11,
                 reg76,
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
                 (1'h0)};
  assign wire11 = ((~|({(wire7 ?
                          wire9 : wire10)} > wire8)) <<< wire7[(1'h0):(1'h0)]);
  module12 #() modinst29 (.wire15(wire11), .clk(clk), .wire13(wire7), .y(wire28), .wire14(wire9), .wire16(wire8));
  module30 #() modinst61 (.clk(clk), .wire32(wire10), .wire31(wire7), .y(wire60), .wire34(wire8), .wire33(wire9));
  assign wire62 = {wire60[(4'ha):(3'h5)], wire60[(4'h9):(3'h5)]};
  assign wire63 = (~|(+(8'h9f)));
  always
    @(posedge clk) begin
      reg64 <= $signed(wire62);
      reg65 <= wire10[(3'h6):(3'h5)];
      reg66 <= $unsigned((wire10[(1'h1):(1'h0)] ?
          $signed(((wire63 == wire60) ? {wire7} : wire8)) : wire28));
      if ($unsigned(((8'haf) ^ {$signed((wire28 | reg65)), (!wire10)})))
        begin
          reg67 <= reg66;
          if ({$unsigned((!((reg65 + reg67) ?
                  wire7[(4'h8):(2'h2)] : ((8'hbc) ? wire9 : wire10)))),
              $signed(wire60[(1'h1):(1'h1)])})
            begin
              reg68 <= $signed((wire62 ~^ reg65));
              reg69 <= {(~|{reg68[(3'h4):(2'h2)], wire28[(3'h7):(2'h2)]}),
                  wire9};
              reg70 <= reg66[(4'h9):(3'h4)];
              reg71 <= (&(+wire63));
            end
          else
            begin
              reg68 <= ($signed({$unsigned($signed(wire8)),
                  wire62[(4'hb):(4'h8)]}) & (~|wire10));
              reg69 <= ((((reg66[(3'h5):(3'h5)] + (reg64 * (8'ha6))) * (^~(reg65 >= wire11))) && reg65) ?
                  $unsigned((wire62 <= ((&reg70) ?
                      ((8'hb3) * wire8) : $signed((8'hae))))) : (8'had));
              reg70 <= (((reg69 ~^ (|(&reg70))) >= (~|$unsigned(wire28))) ?
                  $unsigned(reg65) : ($signed((~|((8'ha2) ?
                      (8'hb9) : wire62))) && $unsigned(wire11[(5'h11):(4'hc)])));
            end
          reg72 <= (&wire62);
          reg73 <= (($signed(((reg70 + wire28) | {wire7})) * ($unsigned(wire62) << reg67)) ?
              wire8[(4'hf):(4'h8)] : reg70);
        end
      else
        begin
          reg67 <= $unsigned((-(~&((wire60 ? wire10 : wire8) ?
              (wire11 ? (8'hb5) : reg72) : reg65[(2'h3):(2'h2)]))));
          reg68 <= (^(((~^$unsigned(reg67)) * {reg65}) ?
              ($unsigned($signed(wire7)) & (-(reg65 ?
                  wire7 : (8'hba)))) : $signed(((8'ha5) ?
                  wire9[(4'h8):(3'h7)] : wire9))));
          if (wire28[(3'h5):(1'h1)])
            begin
              reg69 <= (wire8 >> (8'hbe));
              reg70 <= $signed(wire28[(3'h4):(3'h4)]);
              reg71 <= (($signed(({reg71} ^ (wire8 ?
                      reg69 : reg73))) < wire60[(4'h9):(4'h8)]) ?
                  (~^((!wire60) ~^ wire28[(2'h2):(1'h0)])) : (&($signed((reg65 ?
                      wire63 : wire11)) ~^ ((+wire62) ?
                      $signed(wire60) : (reg69 >= wire10)))));
              reg72 <= (reg64 ? $unsigned(wire11[(4'h9):(3'h6)]) : reg68);
              reg73 <= (~$unsigned((wire10 ?
                  {(reg66 | (8'h9f))} : ((^~reg69) >>> $unsigned(wire9)))));
            end
          else
            begin
              reg69 <= ((^~(((reg72 ~^ reg68) ?
                  (reg70 | reg65) : $signed(reg72)) - {$signed(wire8),
                  (-reg67)})) - {(wire63[(1'h0):(1'h0)] ?
                      {wire8, (8'hbd)} : reg67[(1'h0):(1'h0)]),
                  (($signed((8'ha9)) ?
                      (reg64 < reg73) : {(8'ha0)}) && (8'hb4))});
            end
          reg74 <= $signed($signed(reg70));
        end
    end
  assign wire75 = reg72;
  always
    @(posedge clk) begin
      reg76 <= $signed($signed(($signed((reg71 ? (8'ha3) : (8'haa))) ?
          $signed(reg65[(3'h5):(2'h2)]) : ($signed(reg66) ~^ wire9))));
    end
endmodule

module module30
#(parameter param59 = ((~^(-{(8'hab), ((8'hb4) | (8'hac))})) | ((~|{((8'haf) ? (8'hb9) : (8'ha5))}) ? (({(8'ha1), (8'hb8)} ? ((8'hbd) ? (8'ha0) : (8'ha4)) : (^(8'ha0))) ? (((8'hb7) || (8'hb7)) ? ((8'ha4) ? (8'h9f) : (8'hb3)) : ((8'hb7) ? (8'haf) : (8'ha3))) : (^~((8'hb3) ? (8'ha6) : (8'hbf)))) : {({(7'h44), (8'ha6)} ? {(8'hb9), (8'hbe)} : ((8'ha0) ? (8'h9e) : (8'hb9)))})))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire signed [(5'h11):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire41,
                 wire36,
                 wire35,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg43,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire35 = wire32;
  assign wire36 = (~|($signed((^~(wire34 ^ wire33))) ?
                      (wire34[(1'h0):(1'h0)] != $unsigned(wire34[(3'h6):(2'h3)])) : wire35));
  always
    @(posedge clk) begin
      reg37 <= ($unsigned({((+(8'hbe)) ? $unsigned((8'h9f)) : (^(7'h44)))}) ?
          ({wire32[(4'hb):(4'ha)]} >= wire32[(4'hf):(1'h1)]) : {(wire33 ?
                  (~$unsigned(wire35)) : {wire35, (wire33 ? wire31 : wire36)}),
              (wire34[(4'hd):(1'h0)] ? wire36 : (&(~|wire33)))});
      reg38 <= (((&(8'ha8)) ^ wire33[(1'h1):(1'h0)]) ?
          $unsigned((|$unsigned($signed(wire35)))) : wire35[(2'h3):(1'h1)]);
      reg39 <= (^~wire31[(4'h9):(2'h3)]);
      reg40 <= ($signed(($signed((wire32 ? (8'h9f) : reg37)) ?
          ((~&wire36) ?
              $unsigned(reg37) : (wire35 <= wire34)) : $signed(wire36[(4'ha):(2'h2)]))) ^ $signed(wire36[(4'hc):(3'h7)]));
    end
  assign wire41 = (-$signed($signed({(~wire32)})));
  assign wire42 = (({$signed({wire41}),
                              (wire32[(3'h5):(3'h5)] ?
                                  reg40[(3'h7):(1'h1)] : $signed(wire36))} ?
                          wire32[(4'h8):(3'h7)] : $unsigned({$signed((8'hbd)),
                              wire36})) ?
                      (wire33 & $signed({$unsigned(wire41)})) : (!(wire33[(2'h3):(2'h3)] << ((8'haa) ?
                          (8'h9d) : (8'h9e)))));
  always
    @(posedge clk) begin
      reg43 <= (reg39[(5'h12):(1'h1)] ?
          $signed((((wire31 != reg39) ?
              (wire35 ?
                  wire34 : (8'hb0)) : reg37[(2'h2):(1'h1)]) >= ($signed(wire41) <= (wire31 ?
              (8'ha9) : reg39)))) : (reg38 - ((~&(8'hac)) ~^ {$signed(reg40),
              (wire35 && reg38)})));
    end
  assign wire44 = ($unsigned($signed($signed({reg40,
                      wire34}))) * $signed((+wire36)));
  assign wire45 = reg40;
  assign wire46 = ($unsigned((7'h42)) ?
                      {(wire35[(5'h12):(4'hd)] && ($signed(wire42) >>> $unsigned(wire44)))} : wire33[(2'h3):(1'h1)]);
  assign wire47 = $signed(($unsigned($unsigned((8'hb9))) << reg37));
  assign wire48 = (((~{wire47[(4'h8):(2'h3)]}) ?
                          $signed(wire33[(2'h3):(1'h0)]) : wire44) ?
                      $unsigned((8'ha0)) : $unsigned(reg38[(2'h2):(1'h1)]));
  assign wire49 = ($signed($signed($unsigned($signed(wire46)))) ?
                      $unsigned($signed(($signed(reg43) >> wire41[(3'h4):(2'h3)]))) : (~(!((wire36 >>> reg39) ?
                          (|wire31) : {wire41, wire35}))));
  assign wire50 = {wire41[(1'h1):(1'h1)]};
  assign wire51 = (&reg43[(4'hf):(4'hf)]);
  assign wire52 = $signed((-(wire44[(3'h5):(3'h4)] ?
                      ((wire44 >>> reg39) ?
                          $unsigned(wire32) : (wire34 - reg37)) : (wire35[(5'h15):(4'ha)] ?
                          (wire49 ? wire36 : wire32) : $signed((8'hb5))))));
  always
    @(posedge clk) begin
      reg53 <= (8'haa);
      reg54 <= {$signed($signed($signed(wire32)))};
      reg55 <= $signed(reg54);
      reg56 <= (wire32[(3'h6):(3'h6)] ? wire42 : (^~wire46));
      if ($unsigned(wire47))
        begin
          reg57 <= ((!(8'ha6)) << (8'hb8));
        end
      else
        begin
          reg57 <= {(wire36 ? reg37 : (+$signed(wire35))),
              wire33[(2'h3):(1'h0)]};
          reg58 <= $signed(wire31);
        end
    end
endmodule

module module12
#(parameter param26 = ((((+(~&(7'h40))) == (((8'ha6) ? (8'hbf) : (8'haf)) ? (^(7'h41)) : ((8'ha3) << (8'hb4)))) <= (((^~(7'h44)) << ((7'h43) == (8'hb8))) ? (8'h9d) : {(^(8'hb2)), {(7'h44), (8'hb0)}})) ? (((~&{(8'haa)}) == (((8'ha1) ? (7'h42) : (8'had)) ? {(7'h44), (8'hba)} : ((8'hac) && (8'hb5)))) ? ((((8'hb7) ? (8'h9e) : (8'hb2)) ? ((8'h9e) >>> (8'haf)) : ((8'hb2) ? (7'h40) : (8'ha3))) ? (((8'hb1) == (8'hb1)) == (+(8'h9e))) : (((8'ha5) ^ (8'hae)) ? ((8'hb5) ? (8'hb1) : (8'ha7)) : ((8'hbb) ? (8'hbf) : (8'hb0)))) : {(&{(8'hb7), (8'hb6)}), (~|{(8'ha7), (8'ha2)})}) : {(({(8'hb8), (8'had)} - {(8'h9d)}) ? (((8'hbd) ^~ (8'had)) ? ((7'h42) ? (8'hae) : (8'haf)) : {(7'h44)}) : ((-(8'hab)) + {(8'h9f), (7'h43)}))}), 
parameter param27 = (^(((^~((8'hae) ? param26 : param26)) >= {{param26, param26}, param26}) ~^ (param26 <<< param26))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire23,
                 wire22,
                 reg25,
                 reg24,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= (8'hbb);
      reg18 <= (+($unsigned(wire16) ?
          (($unsigned(wire13) ?
              (wire14 << wire16) : $unsigned(wire15)) >>> wire15[(2'h3):(2'h2)]) : reg17[(4'h9):(2'h2)]));
      if ($unsigned(wire16[(2'h2):(2'h2)]))
        begin
          reg19 <= (reg17 ?
              $unsigned({(reg18 ^~ wire15[(1'h1):(1'h0)])}) : wire16[(2'h2):(2'h2)]);
        end
      else
        begin
          reg19 <= $signed(reg17[(3'h7):(3'h6)]);
          reg20 <= wire13;
          reg21 <= wire14[(4'hf):(3'h6)];
        end
    end
  assign wire22 = reg21[(1'h0):(1'h0)];
  assign wire23 = reg20;
  always
    @(posedge clk) begin
      reg24 <= ($signed(wire15[(3'h4):(3'h4)]) ^~ $signed(wire15[(1'h0):(1'h0)]));
      reg25 <= ((!($signed((~reg20)) << (reg21[(5'h12):(5'h10)] ?
              (8'ha4) : wire15))) ?
          wire15 : ((reg21 < wire15) ?
              $signed($signed((reg21 ?
                  reg24 : (8'hb1)))) : {$signed($unsigned(wire22))}));
    end
endmodule
