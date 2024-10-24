module top
#(parameter param94 = (((~({(8'ha7), (8'ha1)} < ((8'ha4) ? (8'hb9) : (8'ha9)))) ? ((~&((8'hb7) >>> (8'hae))) ? ((~|(8'hbb)) && (~&(8'hb6))) : ((8'h9f) ? (8'hac) : ((8'hbe) ? (7'h43) : (8'hbb)))) : ((((8'h9c) ? (8'haf) : (8'haf)) ? {(8'ha9)} : ((8'h9e) ? (8'hbe) : (8'ha7))) ? (^~(^(8'ha7))) : (^((8'ha3) != (8'hac))))) ^~ ((^~{{(8'hae), (8'haf)}}) ? ((((8'h9c) ? (8'hb2) : (8'hbc)) - {(8'h9d)}) ? ((~|(8'hbc)) ? ((8'ha4) ? (8'h9e) : (8'hac)) : (8'hbf)) : (|((8'hac) != (8'hba)))) : ((^{(8'hae)}) | ({(8'hba)} << {(8'ha1)})))), 
parameter param95 = (|param94))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h28b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire35;
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
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
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
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
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  module5 #() modinst36 (wire35, clk, wire2, wire3, wire0, wire1, wire4);
  assign wire37 = (-wire1[(4'ha):(4'ha)]);
  assign wire38 = $unsigned($signed($unsigned($unsigned((~&wire4)))));
  assign wire39 = wire2[(2'h3):(1'h1)];
  assign wire40 = (^~((!(~&{wire37, wire0})) ?
                      ((!(+wire2)) ?
                          ($signed(wire0) | {(8'ha1),
                              wire35}) : (wire37 & (~^wire3))) : ((~$signed(wire0)) ?
                          {(wire3 ? wire39 : (7'h43))} : wire2)));
  always
    @(posedge clk) begin
      reg41 <= wire0;
      if (((wire4[(1'h0):(1'h0)] ^~ (((wire3 & wire37) + (^~wire40)) ?
          $signed((wire4 >> wire35)) : {{wire3,
                  wire38}})) ^~ wire38[(1'h0):(1'h0)]))
        begin
          if ({(+(wire3 ?
                  (^((8'h9c) ? reg41 : wire40)) : $unsigned($signed(reg41)))),
              wire1})
            begin
              reg42 <= wire0;
            end
          else
            begin
              reg42 <= wire3;
              reg43 <= wire37;
              reg44 <= wire40[(2'h2):(1'h1)];
              reg45 <= wire4[(3'h5):(1'h0)];
            end
        end
      else
        begin
          reg42 <= wire3[(3'h6):(3'h5)];
          reg43 <= (~&((-$signed({wire37,
              reg43})) & $unsigned(reg45[(3'h6):(1'h1)])));
          reg44 <= {(wire39[(4'hb):(1'h1)] != (~wire1))};
          reg45 <= {(wire1[(3'h4):(1'h0)] ?
                  ($signed((~^wire40)) ^ wire1[(2'h2):(2'h2)]) : $unsigned(((reg44 ?
                      wire40 : reg42) < {wire39, (8'hba)}))),
              ((-(&wire1)) <<< {$signed($unsigned(reg43)),
                  wire2[(3'h6):(2'h3)]})};
          reg46 <= $unsigned(wire2);
        end
      reg47 <= (-$signed((+$unsigned(reg41[(4'h9):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      if ((|((wire2 > ((reg47 && (8'ha3)) ^ {wire3, reg45})) | reg47)))
        begin
          reg48 <= reg47;
        end
      else
        begin
          reg48 <= {($signed($unsigned((reg45 << wire38))) ?
                  wire38 : {(~reg48)}),
              {$signed(wire40[(1'h1):(1'h0)])}};
          reg49 <= reg43[(1'h0):(1'h0)];
          reg50 <= (-wire4[(2'h2):(1'h0)]);
          reg51 <= $unsigned(wire40[(1'h0):(1'h0)]);
        end
      reg52 <= (wire35[(1'h1):(1'h1)] ?
          $signed((^~reg44[(4'hd):(4'ha)])) : reg47);
      reg53 <= reg45;
      if (reg50[(2'h3):(1'h0)])
        begin
          if ((8'haf))
            begin
              reg54 <= wire38[(4'ha):(2'h2)];
              reg55 <= (8'h9d);
            end
          else
            begin
              reg54 <= ($unsigned(reg45) >>> (~^(|$signed((~|reg54)))));
              reg55 <= $signed(wire3[(5'h11):(3'h7)]);
              reg56 <= $unsigned(reg42[(3'h6):(2'h3)]);
            end
          if ({(^~{wire4[(2'h3):(2'h3)]})})
            begin
              reg57 <= wire37;
              reg58 <= ($unsigned((wire38[(4'ha):(3'h6)] ?
                  ($unsigned(reg54) >= (~|reg57)) : (8'hbd))) & ($signed({(!reg43),
                  reg48}) >>> reg57));
              reg59 <= (^~($signed(wire2) ^ (wire40 ?
                  (^$signed(reg42)) : (reg53[(3'h7):(1'h1)] == {reg57}))));
              reg60 <= {(^~$signed((&(reg53 ? reg41 : reg51))))};
              reg61 <= wire38[(3'h7):(3'h7)];
            end
          else
            begin
              reg57 <= (~|((($signed(reg43) ?
                  reg54[(1'h0):(1'h0)] : reg54) && ((&wire37) - (~reg41))) >= (reg49[(4'h9):(1'h0)] & (reg41 ^~ reg46[(1'h0):(1'h0)]))));
              reg58 <= reg51[(4'he):(3'h6)];
              reg59 <= ($unsigned((+($unsigned(reg60) >= (wire4 - reg43)))) != $unsigned(reg41));
              reg60 <= (7'h43);
              reg61 <= (~|wire0[(3'h7):(3'h5)]);
            end
          reg62 <= ($signed(reg59[(3'h5):(3'h5)]) == (reg58[(2'h2):(2'h2)] ?
              wire40 : $signed((!$signed(reg58)))));
          reg63 <= reg50[(3'h7):(2'h3)];
        end
      else
        begin
          if (((!reg50) | $unsigned(($unsigned(wire4[(3'h7):(3'h4)]) == reg45))))
            begin
              reg54 <= (~^(7'h43));
              reg55 <= (8'hbc);
              reg56 <= (reg55[(2'h2):(1'h1)] - {reg43});
              reg57 <= ((wire0 ?
                      (!$unsigned($unsigned(reg45))) : $unsigned(wire37[(3'h6):(1'h0)])) ?
                  ((reg41[(2'h2):(1'h0)] || (8'haf)) <<< reg53[(3'h4):(1'h0)]) : reg63[(1'h1):(1'h0)]);
            end
          else
            begin
              reg54 <= (~&$unsigned($unsigned(((reg59 ?
                  (8'hb1) : wire38) < (^~reg57)))));
              reg55 <= reg62;
              reg56 <= (^$signed((~^(wire4 - reg49))));
              reg57 <= (reg53 < (+{(reg52 ^~ (reg51 <<< reg53)),
                  wire3[(5'h11):(4'he)]}));
            end
          reg58 <= ((~&$unsigned(((wire2 << reg62) < reg59))) ?
              $unsigned((-reg41[(4'h8):(3'h6)])) : ({(+wire40[(1'h0):(1'h0)])} ?
                  $unsigned(wire38[(1'h1):(1'h1)]) : wire39[(3'h7):(3'h4)]));
        end
    end
  assign wire64 = $unsigned(reg41[(4'h8):(1'h0)]);
  assign wire65 = (({$unsigned((~^reg42)), $unsigned($unsigned(reg43))} ?
                          reg62[(3'h4):(1'h0)] : wire37[(1'h1):(1'h1)]) ?
                      (($signed((reg47 ? reg50 : reg61)) ?
                              reg63 : (((8'hb7) ?
                                  wire40 : reg60) == $unsigned(reg58))) ?
                          reg58 : wire40[(1'h1):(1'h1)]) : (&reg50[(4'he):(2'h2)]));
  assign wire66 = (~^({(reg43 ? (wire37 == (7'h42)) : $unsigned(wire65))} ?
                      $signed((~^(reg56 | wire0))) : (~|{(wire40 < (7'h42)),
                          ((8'hab) == reg46)})));
  assign wire67 = $signed(reg62[(2'h2):(1'h1)]);
  assign wire68 = ((~&$unsigned(reg51)) != (reg63 ?
                      (8'ha8) : $signed($unsigned($signed(reg57)))));
  assign wire69 = (~^reg44);
  assign wire70 = (8'hb2);
  assign wire71 = (wire37[(4'hd):(3'h5)] ?
                      {(reg45[(3'h5):(2'h2)] ?
                              wire35 : wire65)} : (reg50[(4'hf):(2'h3)] ?
                          ((!reg42[(3'h7):(2'h2)]) ?
                              reg60[(2'h2):(1'h1)] : (8'ha6)) : $signed((8'ha0))));
  assign wire72 = ((wire35[(4'ha):(2'h2)] < {reg52[(3'h6):(3'h4)],
                          {(wire66 ? reg56 : (8'ha4)), reg62}}) ?
                      $signed((|reg51)) : $signed((reg44[(4'hb):(3'h6)] - $unsigned((wire70 | reg58)))));
  always
    @(posedge clk) begin
      reg73 <= ($signed(((+(reg46 | (8'ha8))) * $signed({reg48}))) ^~ (^reg54[(4'hb):(3'h4)]));
      if ($signed($signed(reg61)))
        begin
          if ((+reg46[(2'h3):(1'h0)]))
            begin
              reg74 <= $unsigned(((((wire66 ? wire37 : wire71) || (reg45 ?
                          wire0 : reg53)) ?
                      {(^wire40)} : (~$signed(reg49))) ?
                  {wire40[(1'h0):(1'h0)]} : {((reg58 ^~ wire64) ?
                          reg44 : (~|wire65))}));
              reg75 <= (wire72[(4'hf):(3'h7)] ?
                  (8'ha1) : ($unsigned(((reg73 + reg47) <<< ((8'ha6) ?
                          reg73 : reg74))) ?
                      (~^(reg53[(3'h7):(3'h5)] ?
                          ((8'hb0) >> wire0) : (7'h42))) : (7'h40)));
            end
          else
            begin
              reg74 <= (reg52[(4'ha):(4'h9)] ?
                  $signed((reg54[(3'h5):(3'h5)] ?
                      {reg75,
                          (~|reg57)} : reg52)) : ($unsigned((!(~^(8'hb3)))) < $unsigned((^reg47[(3'h5):(1'h1)]))));
              reg75 <= (|($unsigned(($signed((7'h43)) ?
                  $unsigned(wire70) : $signed(wire1))) - wire40[(2'h2):(1'h1)]));
              reg76 <= ($unsigned(({wire4} || $unsigned(wire65[(1'h1):(1'h0)]))) ?
                  (^~($signed((wire66 * reg55)) * (|reg73))) : {reg48[(2'h3):(1'h1)],
                      (wire35[(1'h1):(1'h1)] ^~ reg54[(2'h3):(2'h3)])});
              reg77 <= wire69;
              reg78 <= wire40;
            end
          reg79 <= ($signed((~^(~^(^wire1)))) ?
              $signed(reg73[(4'h9):(4'h9)]) : wire4);
          reg80 <= $unsigned((~|wire37));
          reg81 <= $signed($unsigned(reg54));
        end
      else
        begin
          reg74 <= $unsigned($unsigned($unsigned({(reg56 ^ wire68)})));
          reg75 <= reg47[(5'h10):(3'h6)];
        end
      reg82 <= (8'ha5);
      reg83 <= $signed(((8'hba) * (+reg53[(3'h4):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg84 <= ((&wire64[(4'hd):(1'h1)]) ?
          (reg76 ?
              $unsigned(reg52) : (reg75 ?
                  $unsigned(reg51[(5'h13):(4'hb)]) : $signed((wire35 ^~ reg45)))) : (($signed((wire1 ?
                  reg52 : reg73)) >= (8'hb5)) ?
              ($unsigned((^reg81)) ?
                  $unsigned($unsigned((8'hb9))) : (wire68 && reg73)) : reg76[(1'h1):(1'h1)]));
      reg85 <= $signed(reg55);
      reg86 <= ((|(wire70[(1'h0):(1'h0)] >= ((-reg85) ?
              reg62[(1'h1):(1'h0)] : $unsigned(reg44)))) ?
          $signed($signed(($signed(wire35) >>> reg59))) : $unsigned($unsigned({((8'hb1) >= reg56)})));
      if (wire3)
        begin
          reg87 <= $signed(((|reg73[(2'h3):(1'h1)]) > ($unsigned(reg77) ?
              ($unsigned((8'hab)) ?
                  (^reg52) : $signed(reg43)) : $signed($unsigned(wire3)))));
          reg88 <= $signed($unsigned($unsigned($signed((8'ha8)))));
        end
      else
        begin
          reg87 <= $signed((8'ha9));
          reg88 <= ({wire35} >= reg57[(3'h4):(3'h4)]);
          reg89 <= wire0;
          reg90 <= (wire69[(3'h4):(1'h0)] ^~ $unsigned((&$signed($unsigned(reg56)))));
          reg91 <= wire65[(3'h5):(3'h4)];
        end
    end
  assign wire92 = (~wire71[(3'h4):(3'h4)]);
  assign wire93 = reg87;
endmodule

module module5
#(parameter param34 = {((~|{(^(7'h41))}) ? ((^((8'hbf) ~^ (8'h9c))) ? {((8'haf) ? (8'h9f) : (7'h42)), {(8'ha0), (8'hb2)}} : (~(~(8'hb9)))) : (8'hae))})
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire28;
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire11,
                 wire28,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire11 = $unsigned(wire8);
  always
    @(posedge clk) begin
      reg12 <= {((wire11[(3'h6):(3'h5)] < (wire11 == (wire10 >>> wire8))) >>> (wire8 ^~ $signed((wire10 > wire7))))};
      reg13 <= $unsigned(((+$signed((wire7 != wire8))) ?
          (((8'haf) || (|wire9)) ?
              wire7[(4'h9):(3'h5)] : wire9) : (&$signed($unsigned(wire8)))));
      reg14 <= wire8;
    end
  module15 #() modinst29 (wire28, clk, wire10, wire8, reg13, wire9);
  assign wire30 = $signed(wire6[(4'h9):(1'h0)]);
  assign wire31 = wire10;
  assign wire32 = reg12;
  assign wire33 = reg13;
endmodule

module module15
#(parameter param27 = ((((((8'had) ? (8'ha1) : (8'hae)) ? ((8'hb0) + (7'h44)) : ((8'h9d) ? (8'hb7) : (8'h9c))) ^~ (((8'hbc) <= (8'h9d)) ? ((8'hae) ? (8'hbe) : (8'ha5)) : (8'hb7))) ? {(&{(8'hba)}), (((8'hbc) ^ (8'ha8)) ? ((8'ha0) >= (8'h9e)) : ((8'hbe) * (8'hb2)))} : ((^((8'haa) == (8'ha6))) ? (~|((8'hba) ? (8'hb8) : (8'hb7))) : (((8'hb1) ? (8'hba) : (8'ha3)) ^~ ((8'hae) ? (8'ha8) : (8'haa))))) >> {(+{(^~(8'hbd)), ((8'hb7) <= (8'hae))}), ({{(8'ha8)}} ^~ (((8'ha3) != (7'h42)) ? (^~(8'ha6)) : ((8'had) * (8'ha5))))}))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  assign y = {wire26, wire25, wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = $unsigned(wire19[(2'h2):(2'h2)]);
  assign wire21 = wire19;
  assign wire22 = wire18[(5'h11):(4'h9)];
  assign wire23 = $signed((^~wire17));
  assign wire24 = (~wire22[(3'h4):(2'h2)]);
  assign wire25 = ({wire23} * ((-$signed(wire21[(4'ha):(4'h8)])) ?
                      wire24[(3'h6):(3'h6)] : ((!$signed(wire20)) ?
                          (wire16 ?
                              wire20[(2'h3):(2'h3)] : $signed(wire18)) : $unsigned($signed(wire21)))));
  assign wire26 = wire20;
endmodule
