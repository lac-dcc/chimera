module top
#(parameter param91 = (((^~((|(8'ha8)) ~^ ((8'hba) != (7'h42)))) ? ((((8'ha3) ~^ (8'ha4)) ? ((8'h9f) >>> (8'ha3)) : ((8'hb2) * (8'ha6))) ? (&(!(8'hbe))) : {((8'hb5) >>> (8'h9f)), ((8'hb5) && (8'hbd))}) : {{((8'hba) ? (8'ha0) : (7'h43))}}) ^~ ({{((8'ha9) ? (7'h44) : (8'hb3))}, {(!(8'hb8))}} & (~&(((7'h43) && (8'hae)) ? ((8'ha3) ? (7'h42) : (8'ha3)) : ((8'ha9) ? (8'ha7) : (8'h9e)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  assign y = {wire89,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = (^(&wire3[(1'h1):(1'h0)]));
  assign wire5 = wire1;
  assign wire6 = ($unsigned($signed($signed(wire3[(1'h1):(1'h1)]))) == wire0);
  always
    @(posedge clk) begin
      reg7 <= wire6;
      reg8 <= ($unsigned(wire6) ?
          reg7[(1'h0):(1'h0)] : ((($unsigned(wire5) ?
                      reg7[(1'h1):(1'h1)] : $signed(wire5)) ?
                  $signed((^~wire5)) : (!$signed(wire4))) ?
              wire5[(3'h5):(1'h0)] : {$unsigned(wire3),
                  ((^wire1) ? wire0[(2'h2):(2'h2)] : (|(8'hb0)))}));
      if ((7'h42))
        begin
          if ($unsigned($signed({({wire5, (8'ha8)} ?
                  ((8'hb8) ? wire0 : reg8) : reg7[(2'h2):(1'h0)])})))
            begin
              reg9 <= (!$signed($unsigned($unsigned(reg8))));
              reg10 <= $unsigned({$signed(wire0[(1'h0):(1'h0)]),
                  (wire2[(2'h2):(1'h1)] ? wire0[(2'h3):(2'h2)] : wire0)});
            end
          else
            begin
              reg9 <= {wire2, $unsigned($unsigned((8'hbd)))};
            end
        end
      else
        begin
          reg9 <= ($unsigned((|$signed((wire1 ~^ wire4)))) ?
              (-((wire1 ? $unsigned(reg9) : wire0) ?
                  $signed({wire2,
                      reg7}) : (wire0[(1'h1):(1'h1)] ~^ ((8'ha5) <= wire1)))) : (~&(($unsigned(wire2) << wire2[(3'h4):(2'h2)]) + (wire3[(1'h0):(1'h0)] ?
                  (reg7 ? wire6 : wire0) : $signed(wire4)))));
          reg10 <= ($signed($unsigned($signed(wire0))) & reg10);
          reg11 <= reg8[(3'h5):(3'h5)];
          reg12 <= $signed(wire3);
        end
      reg13 <= ($signed($signed($unsigned({wire2}))) + $signed({reg7}));
    end
  assign wire14 = ($unsigned((^(^~(wire3 ? reg9 : reg7)))) ?
                      (reg11[(3'h5):(3'h5)] ?
                          ({wire4[(4'he):(4'h8)],
                              (reg12 >= wire4)} * $unsigned($signed(wire3))) : ((!reg10) < $unsigned(reg10[(2'h2):(1'h0)]))) : ($signed($signed(wire0)) ?
                          wire2 : (7'h41)));
  assign wire15 = {(reg10[(1'h0):(1'h0)] + (-(reg13 < wire1[(4'he):(3'h5)])))};
  assign wire16 = ((8'ha7) <<< $signed((8'h9e)));
  assign wire17 = reg9;
  assign wire18 = wire1[(4'hd):(2'h3)];
  assign wire19 = reg13[(1'h1):(1'h1)];
  assign wire20 = $signed((~^$signed(($signed(wire14) ?
                      (reg10 || wire0) : {reg11}))));
  assign wire21 = (~^($unsigned({$unsigned((8'hb4))}) != $unsigned((^~(wire15 ^~ reg7)))));
  module22 #() modinst90 (.wire27(wire20), .clk(clk), .y(wire89), .wire26(reg11), .wire23(reg8), .wire25(wire6), .wire24(reg10));
endmodule

module module22
#(parameter param87 = (({(~^((8'hae) <= (8'hb6)))} >> (+((~(8'hb9)) & ((8'hb4) - (8'hb6))))) ? ({(((8'hba) && (8'hbf)) ? (8'h9f) : ((7'h44) >> (8'h9e))), (((8'ha6) ? (8'hb3) : (8'ha2)) ~^ (8'ha3))} ^ (~^(~&((8'hbd) * (8'hbe))))) : (^((!((8'haa) >> (8'hba))) ? (^((8'hbc) < (8'haf))) : (((8'h9c) ? (8'ha7) : (8'hac)) ^~ {(8'ha6), (8'haf)})))), 
parameter param88 = (((param87 ^ {(~|param87), param87}) ^~ param87) >> (~&(param87 ? param87 : ((param87 ? param87 : param87) ? param87 : param87)))))
(y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire76;
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  assign y = {wire86,
                 wire79,
                 wire78,
                 wire28,
                 wire29,
                 wire76,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire28 = (7'h41);
  assign wire29 = $signed({wire27[(3'h6):(2'h2)],
                      (~^($unsigned(wire28) - $signed(wire24)))});
  module30 #() modinst77 (wire76, clk, wire28, wire25, wire24, wire29, wire26);
  assign wire78 = wire23[(1'h0):(1'h0)];
  assign wire79 = wire23[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg80 <= (wire76[(3'h5):(2'h3)] < (~(8'hb1)));
      reg81 <= wire23[(1'h0):(1'h0)];
      reg82 <= $signed((8'hac));
      reg83 <= ((-$unsigned($signed({wire76}))) ?
          wire23[(5'h10):(2'h3)] : (wire29 & ({$unsigned(reg80)} <= wire25[(3'h7):(2'h2)])));
      reg84 <= ((reg83 ? (8'hba) : reg82) ?
          ((|((wire78 ? reg80 : reg80) ?
              ((8'hb0) ?
                  wire78 : (8'hb4)) : reg81)) ^~ $signed((8'ha7))) : (reg80[(2'h2):(2'h2)] >>> ($signed(((8'ha4) ?
              wire28 : wire27)) >>> wire79[(5'h11):(4'h9)])));
    end
  always
    @(posedge clk) begin
      reg85 <= $signed(wire76[(4'hd):(3'h4)]);
    end
  assign wire86 = wire24[(4'hb):(3'h7)];
endmodule

module module30
#(parameter param74 = {(((|(!(8'hb9))) == (&(8'h9d))) ? (((8'ha0) ? ((8'hae) ? (8'h9c) : (8'hae)) : ((8'ha3) << (8'ha0))) ? (~((8'ha6) ? (8'hb2) : (8'hba))) : (&(+(8'hbc)))) : ((+((8'hae) ? (7'h43) : (8'hb0))) ^ {((8'hb2) <= (8'h9c)), ((8'hbe) ? (8'had) : (8'hb4))}))}, 
parameter param75 = param74)
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h207):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire35;
  input wire [(4'ha):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire33;
  input wire [(3'h7):(1'h0)] wire32;
  input wire [(4'hb):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  assign y = {wire73,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire36 = (+$unsigned((~$signed({wire31, (8'hbf)}))));
  assign wire37 = ($signed($unsigned(($signed(wire36) ?
                          wire33[(4'hd):(3'h4)] : (wire31 ?
                              wire34 : wire34)))) ?
                      $signed((|wire33)) : (((^{wire32}) ^ $signed($signed((8'haa)))) ?
                          wire33 : (!($signed(wire31) >> $signed(wire32)))));
  assign wire38 = $signed($unsigned(wire36));
  assign wire39 = {(wire35 ^ wire37[(4'hb):(2'h3)]), wire32[(2'h3):(2'h3)]};
  assign wire40 = $signed((((+wire33) ?
                      wire35[(4'ha):(3'h6)] : (wire31[(3'h7):(3'h5)] ?
                          (+wire35) : $signed(wire37))) && wire38));
  always
    @(posedge clk) begin
      reg41 <= (($signed(({wire36} ? (-wire37) : wire37)) == wire34) ?
          $signed((~^(^$unsigned(wire32)))) : {(((^wire33) | {wire38}) ?
                  $unsigned(wire35[(4'h8):(3'h7)]) : (&(&wire31))),
              wire36});
      reg42 <= wire40[(4'hd):(4'ha)];
      if (wire36[(3'h4):(1'h0)])
        begin
          reg43 <= $signed((($signed($unsigned(wire35)) != {wire36[(4'ha):(3'h6)]}) > reg41[(4'h8):(3'h4)]));
          reg44 <= $unsigned(($unsigned(wire38) != (~({(8'hbb)} ?
              (reg42 + wire40) : (-wire35)))));
          reg45 <= wire35;
          reg46 <= $signed(((~|wire31) | $unsigned((!(!wire40)))));
        end
      else
        begin
          reg43 <= {reg44[(1'h1):(1'h1)],
              {(~^($unsigned(wire36) >= (-wire38))), reg43[(4'hc):(3'h5)]}};
          reg44 <= ((&$signed(wire39[(4'h9):(4'h9)])) >>> {(~(wire31 <= {(8'hb7)}))});
          if ((wire39 ^~ $unsigned(reg42[(4'hd):(4'hb)])))
            begin
              reg45 <= $unsigned({((+$signed(wire37)) ?
                      {(wire31 ? wire35 : wire34)} : $unsigned(wire38))});
              reg46 <= $unsigned($signed(($unsigned($unsigned(wire32)) << (+wire39[(4'hd):(3'h5)]))));
            end
          else
            begin
              reg45 <= (reg46 + wire36);
              reg46 <= {(({$unsigned((8'hb9))} + $signed($unsigned(reg43))) ?
                      wire39 : $unsigned($signed($unsigned((8'ha9))))),
                  $unsigned((((wire32 > wire39) ~^ $unsigned(wire35)) * (~$unsigned(wire37))))};
            end
        end
    end
  assign wire47 = wire38[(4'h8):(3'h5)];
  assign wire48 = reg42[(2'h3):(1'h1)];
  assign wire49 = (8'hb1);
  assign wire50 = reg41;
  assign wire51 = ({{{{wire37}, (!(8'h9f))}},
                      {$unsigned($unsigned((8'hb4)))}} << $unsigned(($unsigned(((8'haa) ?
                      (8'hb6) : wire50)) >= reg46)));
  assign wire52 = $unsigned(wire47[(3'h5):(1'h1)]);
  assign wire53 = {reg41,
                      $signed(($unsigned(wire40) ?
                          ($signed(reg44) ?
                              $unsigned(wire47) : (~reg44)) : {(!wire48)}))};
  assign wire54 = wire37[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg55 <= ((|(reg43 ?
              ((reg42 ~^ wire47) ?
                  (reg44 ^ reg41) : wire54[(1'h0):(1'h0)]) : $unsigned($signed(wire32)))) ?
          $signed((wire38[(2'h3):(1'h1)] ^ wire52)) : $signed($signed($signed(((7'h43) ?
              wire51 : wire33)))));
      if ($unsigned(((&(reg55[(1'h0):(1'h0)] <= wire40)) ?
          (&(reg42[(1'h0):(1'h0)] <<< $signed(wire39))) : ($signed({wire53}) ?
              wire48[(4'hc):(3'h4)] : wire39[(5'h11):(4'hd)]))))
        begin
          reg56 <= (($unsigned(reg45[(4'ha):(3'h5)]) >>> wire51[(3'h4):(3'h4)]) == (~^($signed((wire40 ?
                  (7'h42) : wire31)) ?
              ((8'hb2) ?
                  $unsigned(wire40) : $signed(wire50)) : ((wire48 ^~ reg55) ?
                  (wire54 >>> reg42) : ((8'hb9) != wire52)))));
          if (reg55)
            begin
              reg57 <= wire47;
              reg58 <= (|wire53);
              reg59 <= $signed((+({wire49,
                  $unsigned(wire31)} >> (^wire32[(3'h5):(3'h5)]))));
            end
          else
            begin
              reg57 <= (((-(|$signed(wire49))) < (((~wire54) ~^ (wire33 ?
                      reg55 : wire33)) ^ (+(wire40 >> reg43)))) ?
                  reg44[(2'h2):(1'h1)] : ($unsigned(wire34[(3'h5):(3'h5)]) + reg55[(1'h0):(1'h0)]));
              reg58 <= {wire35};
            end
          reg60 <= {(^$signed(($signed(wire38) * (reg44 ? wire49 : reg59))))};
          reg61 <= wire37;
          reg62 <= (wire49 + ((^~((reg59 << reg60) ?
              $signed((7'h40)) : (wire34 ?
                  wire49 : (7'h44)))) != {{(wire31 + wire38),
                  (reg61 || wire49)}}));
        end
      else
        begin
          if ({$signed($signed(reg60[(3'h4):(2'h3)]))})
            begin
              reg56 <= $unsigned($unsigned(reg44[(4'hd):(3'h6)]));
              reg57 <= $unsigned($unsigned(reg44));
              reg58 <= reg42[(4'h8):(3'h4)];
              reg59 <= $signed(wire31);
            end
          else
            begin
              reg56 <= $signed(wire47);
              reg57 <= (reg56[(2'h2):(1'h1)] > $signed($unsigned(((reg42 ?
                  reg41 : wire54) ^~ (&(8'ha5))))));
            end
        end
      if ((|(($unsigned(reg58) ?
          $unsigned(((8'ha1) || reg56)) : ($unsigned(wire32) ?
              reg62 : {(8'hb0), wire33})) <= $signed(wire32[(1'h1):(1'h0)]))))
        begin
          reg63 <= {reg57[(3'h6):(3'h4)]};
          reg64 <= ($signed(wire39[(5'h13):(4'hd)]) ~^ (wire35[(4'hb):(3'h6)] ?
              wire34[(3'h5):(2'h2)] : ((!(~wire51)) ?
                  reg62[(3'h4):(2'h2)] : $unsigned(reg46))));
          reg65 <= {reg57,
              ($unsigned(wire47[(5'h10):(2'h3)]) ?
                  (&$signed((wire33 ?
                      reg60 : reg64))) : wire33[(3'h4):(2'h2)])};
          reg66 <= $unsigned({({wire39[(4'hd):(3'h6)], $unsigned(wire40)} ?
                  (~&wire49) : {reg60[(3'h4):(1'h1)], reg46}),
              wire35[(2'h2):(1'h0)]});
          if (((8'hae) >>> ($unsigned($signed($unsigned(reg55))) << ((&(~^wire50)) >> wire35[(3'h5):(1'h0)]))))
            begin
              reg67 <= wire49[(4'hc):(3'h4)];
              reg68 <= ((~&$unsigned($signed($signed((8'hbe))))) && (!($signed(reg66) ?
                  {{wire49}} : wire36[(4'h9):(1'h1)])));
              reg69 <= (((~&$unsigned($unsigned(reg43))) ?
                      (-(reg67 ?
                          $unsigned(reg55) : $signed(wire53))) : wire31[(3'h5):(3'h4)]) ?
                  $unsigned(reg44) : $unsigned((wire34 < $unsigned($signed(reg66)))));
              reg70 <= reg64[(4'h9):(1'h1)];
              reg71 <= ((8'hbe) != $unsigned(wire52));
            end
          else
            begin
              reg67 <= (reg42[(4'hc):(4'hb)] ?
                  ((~&$signed((wire47 ?
                      wire36 : wire39))) * ((reg59 * (reg59 >>> reg42)) ?
                      $signed((reg42 > (8'ha1))) : $signed(reg65[(3'h7):(1'h1)]))) : wire48);
              reg68 <= $unsigned(reg63);
              reg69 <= (wire53[(4'ha):(3'h6)] ?
                  (($unsigned((reg55 ? reg66 : reg66)) ?
                      ((reg46 ? wire33 : wire39) ?
                          wire54 : (reg62 | reg64)) : wire33[(4'hf):(4'ha)]) < (8'ha2)) : $unsigned((reg62[(1'h0):(1'h0)] ?
                      ((^reg59) ? (reg63 ^ reg69) : reg56) : ((~reg59) ?
                          (^~reg45) : reg71))));
              reg70 <= {$unsigned((($unsigned(reg43) ^ wire48) ?
                      $signed($signed((8'hb3))) : (~^(reg70 ? reg56 : reg41)))),
                  (reg66[(1'h0):(1'h0)] ? wire49 : {(^~wire34), wire48})};
              reg71 <= (reg44 ?
                  wire32[(3'h4):(1'h0)] : (reg63 < wire40[(3'h4):(1'h1)]));
            end
        end
      else
        begin
          if ((wire35[(3'h7):(1'h1)] ?
              $unsigned($signed($signed((~&wire38)))) : wire39))
            begin
              reg63 <= wire31[(3'h7):(3'h6)];
              reg64 <= ((+(7'h41)) <<< (~&($signed(((8'h9c) + wire36)) ?
                  ((-reg69) <<< (reg70 ^~ wire40)) : (+(reg42 ?
                      wire36 : (8'hb1))))));
              reg65 <= wire39;
            end
          else
            begin
              reg63 <= ({$signed(((-wire31) ?
                          wire36[(3'h4):(2'h2)] : $unsigned(reg60)))} ?
                  ((($unsigned(reg67) & reg65[(4'h8):(3'h6)]) * reg42[(4'h9):(4'h9)]) ?
                      $unsigned(((&reg59) >>> (reg44 ?
                          reg68 : wire36))) : $signed($signed($unsigned(reg71)))) : $unsigned($signed(reg63[(1'h1):(1'h0)])));
              reg64 <= wire50;
              reg65 <= wire35[(3'h4):(1'h1)];
            end
          reg66 <= (~|{reg57});
          reg67 <= wire37[(3'h7):(3'h5)];
          if ((|wire34[(2'h3):(1'h0)]))
            begin
              reg68 <= $signed(reg61[(4'hc):(3'h7)]);
            end
          else
            begin
              reg68 <= (reg42 ? $signed(wire35) : wire36[(1'h1):(1'h1)]);
              reg69 <= $unsigned(reg56[(3'h6):(1'h0)]);
            end
        end
      reg72 <= (7'h41);
    end
  assign wire73 = reg67;
endmodule
