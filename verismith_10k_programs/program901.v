module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire95;
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire98,
                 wire97,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire24,
                 wire95,
                 reg101,
                 reg100,
                 reg99,
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
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  assign wire4 = (~|((8'hbc) ^ wire1[(3'h6):(1'h1)]));
  assign wire5 = $unsigned((wire4 ?
                     ($signed($signed(wire0)) < {(|(8'ha0))}) : $unsigned({{(8'ha4),
                             wire2}})));
  assign wire6 = (^~{(((8'hab) * (wire4 + wire5)) ?
                         $signed(wire0[(4'hf):(3'h5)]) : ((~|wire1) >> {(7'h44)}))});
  assign wire7 = $signed($unsigned(($unsigned(wire6) & wire1[(1'h1):(1'h1)])));
  assign wire8 = (wire3[(4'hc):(4'ha)] != {$unsigned($signed((|wire7))),
                     wire5[(3'h5):(2'h2)]});
  assign wire9 = (~wire7);
  assign wire10 = $unsigned($signed(wire6));
  assign wire11 = (7'h42);
  always
    @(posedge clk) begin
      reg12 <= wire11;
      if ($signed(wire8))
        begin
          reg13 <= wire0[(3'h5):(1'h0)];
        end
      else
        begin
          reg13 <= ($unsigned(wire8) >> $unsigned(wire9[(3'h5):(1'h0)]));
        end
      if ((-$unsigned((wire0[(3'h6):(3'h6)] && $signed((reg12 <<< wire6))))))
        begin
          reg14 <= $unsigned((wire5[(3'h6):(2'h3)] ?
              (~(-(wire9 >= reg13))) : $signed(wire6[(1'h0):(1'h0)])));
          reg15 <= (8'ha0);
          reg16 <= ({(({wire7} >= $unsigned(wire7)) ?
                  $unsigned(((8'ha9) ?
                      reg12 : reg14)) : wire8[(1'h1):(1'h1)])} != wire8[(2'h2):(1'h1)]);
          reg17 <= {((|(reg16 <= (wire11 != wire2))) ?
                  ($signed(wire7) >= {$signed(wire8)}) : wire8[(2'h2):(2'h2)]),
              ((-$signed({reg16, reg15})) ?
                  ($unsigned($signed(wire6)) ?
                      wire1 : reg13[(4'h9):(1'h0)]) : (wire7 >> $signed((reg13 ?
                      wire10 : wire8))))};
        end
      else
        begin
          reg14 <= $signed(((8'hb8) ^~ wire4[(2'h3):(1'h1)]));
          reg15 <= $unsigned((~^{reg15}));
          if ($signed((reg14[(4'ha):(2'h2)] | (-(wire3 == (+wire9))))))
            begin
              reg16 <= (8'h9d);
              reg17 <= {(wire3 ? wire10[(1'h1):(1'h0)] : $signed(wire7)),
                  ($unsigned(($signed(wire1) ? (-wire9) : (^~wire1))) ?
                      (~&$signed({reg15, wire3})) : wire3[(5'h11):(3'h4)])};
              reg18 <= (((7'h44) >= reg15[(5'h11):(4'he)]) && (~(^~($unsigned(reg16) != (wire9 ?
                  (8'hb9) : reg12)))));
            end
          else
            begin
              reg16 <= reg17[(4'h9):(3'h6)];
              reg17 <= wire4;
              reg18 <= wire5;
            end
          reg19 <= (^~{(8'h9d)});
          reg20 <= {((~|wire1) < wire9), $unsigned($unsigned(reg13))};
        end
    end
  always
    @(posedge clk) begin
      reg21 <= {$signed((7'h40))};
      reg22 <= ((wire2 == (($signed(wire6) >>> $unsigned(wire10)) ^ ((|wire9) ?
          (reg18 <<< wire1) : $unsigned(wire2)))) < $unsigned($unsigned($signed((reg14 | reg17)))));
      reg23 <= ((~^(($unsigned(wire9) ? reg17 : (+reg20)) ?
          {(^wire1)} : wire5)) < $signed((wire3 ?
          wire9 : $signed({wire1, wire1}))));
    end
  assign wire24 = ($unsigned($unsigned(wire1)) | reg21);
  always
    @(posedge clk) begin
      if ({wire11})
        begin
          if ((-(-reg15[(1'h1):(1'h0)])))
            begin
              reg25 <= wire9[(3'h5):(2'h3)];
              reg26 <= reg25;
              reg27 <= $signed((({$signed(reg23), (-(7'h40))} ?
                  wire1 : {(reg25 >> reg20),
                      $unsigned(reg21)}) | $unsigned(wire4[(3'h6):(1'h1)])));
            end
          else
            begin
              reg25 <= reg17;
              reg26 <= wire11;
            end
          reg28 <= reg17[(4'h9):(3'h4)];
          reg29 <= {($unsigned($unsigned(reg20[(4'hd):(4'hd)])) ?
                  (+(reg18[(3'h7):(3'h6)] >= $unsigned(reg16))) : (~$signed({(7'h44),
                      reg28})))};
          if (reg28[(1'h0):(1'h0)])
            begin
              reg30 <= $unsigned(({reg12[(3'h4):(1'h0)]} ?
                  (((-reg14) != {wire9,
                      reg12}) < wire9) : (^$signed((reg25 * reg20)))));
              reg31 <= reg12;
              reg32 <= {((&(~^{wire7, wire10})) ?
                      ((8'hba) > reg22[(4'ha):(3'h5)]) : ((wire11 ?
                              wire6 : (wire1 & reg18)) ?
                          (-(reg12 ? wire5 : wire3)) : (((8'hae) ?
                                  wire0 : (8'ha4)) ?
                              $unsigned(wire8) : reg13))),
                  $signed($unsigned($signed(reg25)))};
              reg33 <= (((!($signed(wire9) ?
                  wire9 : $unsigned(reg18))) || (({wire0} * (7'h43)) ?
                  (reg22[(2'h2):(1'h1)] ?
                      $signed(wire5) : ((8'hbd) >>> reg23)) : reg22)) * reg14[(3'h5):(2'h2)]);
              reg34 <= $unsigned($signed(wire7));
            end
          else
            begin
              reg30 <= wire10;
              reg31 <= (~{(($signed(wire6) ?
                          $unsigned(reg29) : {wire6, wire6}) ?
                      wire6[(3'h7):(1'h1)] : reg28)});
              reg32 <= (wire3 ?
                  ((8'ha9) == (~^($unsigned((8'hb2)) ?
                      (&wire3) : $unsigned((8'had))))) : reg30[(3'h7):(3'h6)]);
              reg33 <= ((7'h43) & {(+{$signed(wire4)}),
                  ((~$unsigned(reg16)) || $unsigned($unsigned(wire3)))});
              reg34 <= $signed($signed(reg13));
            end
          if (reg33)
            begin
              reg35 <= (($signed($signed((reg30 ^ reg20))) ?
                      wire3[(4'hb):(3'h5)] : $signed((+$signed(wire8)))) ?
                  reg17 : {(-reg15[(3'h5):(1'h0)])});
              reg36 <= $signed(reg14[(4'he):(4'hc)]);
              reg37 <= (~^wire7[(3'h5):(3'h4)]);
              reg38 <= wire8;
            end
          else
            begin
              reg35 <= {(-(&$unsigned(reg12[(3'h5):(2'h2)])))};
              reg36 <= reg38;
              reg37 <= ($signed((~&{(-(8'ha0)), (reg38 ? reg23 : wire6)})) ?
                  $signed($signed($signed($signed((7'h42))))) : $signed({($unsigned(wire0) - wire11),
                      $signed((reg22 ? reg25 : reg18))}));
              reg38 <= (^~reg21[(4'h8):(3'h4)]);
              reg39 <= $unsigned((^~$unsigned(wire11)));
            end
        end
      else
        begin
          reg25 <= (~|(reg19 && $signed($unsigned((wire1 ?
              (8'ha8) : (8'hbd))))));
        end
      reg40 <= $signed(($unsigned($signed(reg31)) - reg37));
    end
  module41 #() modinst96 (wire95, clk, reg36, reg16, wire5, reg18);
  assign wire97 = (~reg23);
  assign wire98 = (($unsigned(((wire1 ? wire3 : reg37) ?
                          (reg39 ? (8'haf) : reg14) : $unsigned(reg38))) ?
                      (|wire1[(3'h5):(3'h4)]) : {$unsigned((~|reg33))}) ^~ ($unsigned(((reg16 ?
                          wire24 : reg33) ?
                      reg14 : $unsigned(wire3))) || ((^$signed(wire5)) | ({reg38,
                      wire7} << reg38))));
  always
    @(posedge clk) begin
      reg99 <= $signed((^~($signed((reg17 - reg12)) ?
          wire8 : ($signed(wire2) ^ (~^wire9)))));
      reg100 <= ((((wire0[(2'h2):(1'h1)] ?
                  (wire1 ? reg18 : reg28) : wire5) * ($unsigned(reg15) ?
                  wire2 : wire11)) ?
              $signed((reg17[(5'h11):(3'h4)] == $unsigned(reg16))) : $unsigned(reg39)) ?
          ((&wire95[(4'h8):(3'h4)]) ?
              reg33[(3'h5):(2'h2)] : $unsigned(((wire8 + (7'h40)) ?
                  $signed(reg38) : (+reg39)))) : (|$unsigned((~((8'had) << wire5)))));
      reg101 <= (wire3[(4'he):(3'h4)] ?
          {(8'hbd),
              (reg26 ?
                  $signed({(8'ha9),
                      reg21}) : wire95)} : (~&$signed(wire95[(4'hb):(1'h1)])));
    end
  assign wire102 = wire8;
  assign wire103 = (|{$signed(((8'hb7) * reg34))});
  assign wire104 = $unsigned(reg28);
endmodule

module module41
#(parameter param93 = {({(&(+(8'hb0)))} ? (^~(^{(8'had)})) : {(~((8'h9f) ? (8'hb4) : (8'hb0)))})}, 
parameter param94 = {param93, ({(7'h44), (~&((8'haa) ? param93 : param93))} ? {{{(8'ha9), param93}}} : (((param93 ? param93 : (7'h40)) ? (param93 >>> param93) : (8'hbd)) ? param93 : ((~param93) ? (param93 - param93) : param93)))})
(y, clk, wire42, wire43, wire44, wire45);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire [(4'hc):(1'h0)] wire43;
  input wire signed [(4'hf):(1'h0)] wire44;
  input wire [(5'h13):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire78;
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire78,
                 reg92,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire46 = $unsigned((($unsigned(wire44[(3'h6):(3'h5)]) > {wire43,
                          wire44}) ?
                      (wire43[(3'h5):(3'h5)] >> $signed(((8'hb3) ?
                          wire42 : wire42))) : wire45));
  assign wire47 = wire43[(2'h2):(2'h2)];
  assign wire48 = ($signed($signed(wire44)) ? wire45 : wire42[(3'h4):(2'h2)]);
  assign wire49 = (|wire44[(3'h4):(1'h1)]);
  assign wire50 = (~&(wire47 ?
                      (wire49 ?
                          (~^(wire46 ? (8'hbb) : wire44)) : ($unsigned(wire44) ?
                              wire49 : $signed(wire47))) : ((8'ha9) <= {(wire49 != wire45)})));
  module51 #() modinst79 (.wire53(wire46), .wire52(wire45), .wire55(wire50), .y(wire78), .wire56(wire48), .clk(clk), .wire54(wire42));
  always
    @(posedge clk) begin
      reg80 <= $signed(((wire45 - (wire45[(1'h1):(1'h1)] ~^ wire78[(1'h0):(1'h0)])) == $signed(wire50[(4'hd):(4'h9)])));
      if (($unsigned($unsigned(((reg80 >= reg80) > (wire48 ?
          wire45 : wire49)))) ~^ ((((wire49 >> (8'hbd)) <= $signed(wire45)) <= (wire48[(3'h5):(2'h3)] ?
              {reg80, wire43} : $unsigned(wire47))) ?
          wire47 : reg80[(1'h1):(1'h0)])))
        begin
          reg81 <= wire46[(3'h5):(3'h4)];
          reg82 <= wire44;
          reg83 <= wire78[(2'h2):(1'h1)];
        end
      else
        begin
          reg81 <= (!$unsigned(wire48));
          reg82 <= {reg81[(1'h1):(1'h1)], $unsigned($unsigned(wire50))};
          reg83 <= (($unsigned(wire42[(4'hf):(4'hf)]) ?
              wire78[(2'h3):(2'h2)] : wire45[(4'ha):(3'h4)]) ^~ wire50);
          if ($signed($unsigned($unsigned(((reg80 * (8'h9c)) <<< (wire42 ?
              wire46 : wire45))))))
            begin
              reg84 <= {wire42,
                  (wire42[(4'hc):(2'h3)] || (~|$unsigned({wire42, wire42})))};
              reg85 <= $unsigned((($signed($unsigned(wire43)) ?
                  $signed($signed(wire78)) : wire49[(1'h1):(1'h0)]) ~^ ($unsigned({wire48}) ?
                  ($signed(wire49) * $signed(reg80)) : wire49[(1'h1):(1'h1)])));
            end
          else
            begin
              reg84 <= $unsigned(($signed(($unsigned(reg85) ?
                      $signed(wire42) : (reg81 >> reg81))) ?
                  (|{(wire48 ? reg82 : wire49),
                      (wire78 >= wire49)}) : (($signed((8'h9f)) ?
                      $signed((8'hb9)) : $unsigned(reg83)) >>> (~^(8'ha7)))));
              reg85 <= $unsigned(({{wire45[(4'h9):(2'h3)],
                      (wire50 | wire45)}} & reg82));
              reg86 <= {wire48[(2'h3):(2'h3)],
                  $unsigned($signed($signed($unsigned(reg85))))};
              reg87 <= (7'h44);
              reg88 <= (^~$unsigned({(-reg81)}));
            end
        end
    end
  assign wire89 = (!(reg88 * (~|wire78)));
  assign wire90 = reg84;
  assign wire91 = ((($unsigned((wire42 <= wire47)) && wire89) & $signed((~&wire49[(2'h2):(1'h1)]))) ^~ reg88);
  always
    @(posedge clk) begin
      reg92 <= (~^((~^({reg82, wire45} + wire42)) ?
          reg80 : (((+reg84) - (wire89 >= wire42)) ?
              ($unsigned(wire47) <= $signed((8'h9f))) : $unsigned((reg88 ?
                  wire89 : wire42)))));
    end
endmodule

module module51  (y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire56;
  input wire signed [(3'h4):(1'h0)] wire55;
  input wire [(5'h14):(1'h0)] wire54;
  input wire signed [(4'hc):(1'h0)] wire53;
  input wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  assign y = {wire77,
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
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 reg76,
                 (1'h0)};
  assign wire57 = $unsigned((~^(^($signed(wire53) ^~ {wire55, wire52}))));
  assign wire58 = $signed((|$unsigned({wire53})));
  assign wire59 = {{($unsigned((|(8'h9d))) ^ $unsigned(wire57[(2'h2):(1'h0)])),
                          ($signed($signed((8'hb7))) ?
                              {(wire57 ^ wire54)} : (~&wire54))},
                      $unsigned(wire58)};
  assign wire60 = wire55;
  assign wire61 = {($unsigned(wire54) != (wire55[(1'h0):(1'h0)] ^~ (^(wire52 >> wire54)))),
                      (wire58[(4'hd):(4'hb)] ^~ wire57[(3'h6):(3'h5)])};
  assign wire62 = wire55;
  assign wire63 = $signed(wire61[(1'h1):(1'h0)]);
  assign wire64 = wire57[(3'h6):(3'h5)];
  assign wire65 = {wire60,
                      ($signed(($signed(wire63) == $signed(wire56))) & $signed(wire53[(4'h9):(3'h5)]))};
  assign wire66 = ((~(wire55 - $unsigned(wire60[(1'h0):(1'h0)]))) ?
                      wire62 : (wire60 ?
                          $signed((wire56[(2'h2):(2'h2)] - (-wire53))) : wire64[(4'h8):(2'h3)]));
  assign wire67 = wire57[(3'h6):(2'h2)];
  assign wire68 = $signed(wire61[(4'h8):(3'h6)]);
  assign wire69 = wire54[(5'h12):(4'hd)];
  assign wire70 = wire68;
  assign wire71 = $unsigned(((+{$unsigned(wire61)}) ?
                      $unsigned((^{wire59})) : (wire62[(3'h7):(1'h1)] ?
                          wire56 : ((wire55 >>> wire52) ?
                              wire53[(3'h5):(3'h5)] : $unsigned(wire54)))));
  assign wire72 = wire70;
  assign wire73 = {(wire54[(3'h4):(1'h1)] ?
                          ($signed((|(8'hac))) - (wire55[(2'h3):(2'h2)] || wire52)) : ((~&(wire70 ?
                              wire60 : wire63)) - $signed((7'h42)))),
                      $unsigned((~^wire59[(3'h4):(2'h3)]))};
  assign wire74 = (|wire69);
  assign wire75 = ({{wire63, wire54}} ?
                      {$unsigned($unsigned((7'h44)))} : wire59[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg76 <= ({($signed(wire62) & $signed(wire72)),
          wire62[(3'h5):(2'h2)]} <<< $unsigned(wire60[(1'h0):(1'h0)]));
    end
  assign wire77 = wire53[(4'hc):(2'h2)];
endmodule
