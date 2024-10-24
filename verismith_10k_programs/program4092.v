module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire79, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed((^~$signed((^~$unsigned((8'h9f))))));
  assign wire5 = ((^{$unsigned((wire1 ? wire3 : wire3)),
                     $signed($unsigned(wire4))}) <= wire0[(1'h0):(1'h0)]);
  assign wire6 = (~&{(wire1 ? wire0 : {(wire2 > wire1), $signed(wire3)}),
                     wire4});
  assign wire7 = wire3;
  assign wire8 = wire6[(5'h12):(4'h8)];
  module9 #() modinst80 (.wire11(wire1), .wire12(wire3), .wire13(wire5), .y(wire79), .clk(clk), .wire10(wire6));
endmodule

module module9
#(parameter param77 = ((8'hb3) ? (((+(~^(8'ha2))) >>> ({(8'hb2), (8'hb6)} ? ((8'hb8) & (8'hb3)) : ((8'ha3) ? (8'ha8) : (8'ha8)))) <= (!(((8'hb5) ? (7'h40) : (8'ha1)) ? {(8'hb7), (7'h42)} : {(8'hb4)}))) : (((^~((7'h41) ~^ (8'ha6))) ? (-((8'had) ? (8'ha3) : (8'ha6))) : ((!(8'ha4)) >> (~(8'hbf)))) == ((((8'hb0) ? (8'hb0) : (8'hbf)) <= ((8'h9e) ^~ (7'h40))) ? (((8'ha0) ? (8'hab) : (8'h9f)) >= ((8'hb3) >= (8'hbc))) : (8'hb0)))), 
parameter param78 = (-{((((8'hb1) << param77) ^~ param77) | (~^(param77 ? param77 : (8'h9c)))), param77}))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire40;
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire76,
                 wire14,
                 wire15,
                 wire40,
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
                 (1'h0)};
  assign wire14 = wire12[(4'h8):(1'h0)];
  assign wire15 = (|$unsigned(wire10[(2'h2):(1'h0)]));
  module16 #() modinst41 (.wire17(wire10), .wire19(wire14), .wire20(wire11), .wire21(wire15), .clk(clk), .wire18(wire12), .y(wire40));
  always
    @(posedge clk) begin
      reg42 <= (wire40 ?
          (wire11 ?
              {($unsigned(wire15) ? wire14[(3'h4):(2'h2)] : wire40),
                  {(wire12 && (8'hb9))}} : (-((wire14 >= wire10) ?
                  (wire14 ? wire10 : wire10) : {wire14}))) : (+wire14));
      reg43 <= $signed({$unsigned((~(wire13 <= wire14))), $signed((8'hb7))});
      if ((~($unsigned({$unsigned(wire40)}) | $signed(wire14))))
        begin
          if (((!(^~({wire14} < (+wire15)))) ?
              (($unsigned((wire15 ?
                  wire10 : wire14)) != $unsigned((^~wire13))) || wire12[(4'he):(2'h2)]) : ((~((reg43 ?
                      (8'ha7) : wire12) == (-wire11))) ?
                  wire10[(3'h5):(2'h3)] : $signed(wire15[(4'h8):(3'h5)]))))
            begin
              reg44 <= {(^$signed((^~(reg42 & wire15))))};
              reg45 <= (7'h40);
              reg46 <= reg42;
            end
          else
            begin
              reg44 <= wire13[(5'h13):(5'h11)];
              reg45 <= wire14[(1'h0):(1'h0)];
              reg46 <= (wire13 ?
                  (wire40[(4'ha):(1'h0)] ?
                      (8'haf) : $unsigned($signed($unsigned((8'had))))) : (($unsigned(wire11) - (wire13[(5'h11):(3'h5)] ?
                          reg43[(1'h1):(1'h1)] : (~reg45))) ?
                      $unsigned((+$signed(wire13))) : {((wire10 >> (8'ha9)) * (&wire12)),
                          (wire14[(4'h8):(3'h6)] << reg43)}));
              reg47 <= wire11;
              reg48 <= $signed(($signed((!$unsigned(reg42))) <= ({$unsigned(reg43),
                      {reg45, reg46}} ?
                  wire10[(4'hb):(3'h4)] : $unsigned((&wire13)))));
            end
          reg49 <= $signed(reg42);
          reg50 <= reg46;
          if (((reg48[(4'hd):(3'h6)] >> reg42[(1'h1):(1'h0)]) >>> (($signed($signed(wire11)) ?
                  reg48 : reg47[(1'h1):(1'h0)]) ?
              $signed(wire14[(2'h2):(2'h2)]) : wire14)))
            begin
              reg51 <= (+((-reg42[(2'h3):(1'h1)]) < $unsigned((~|$unsigned(reg48)))));
              reg52 <= {({wire12[(4'h9):(3'h4)]} ?
                      reg49[(4'h9):(4'h9)] : ($unsigned((+(7'h43))) ^ (wire40 ^ $unsigned(wire13)))),
                  (reg49[(4'h9):(3'h6)] >> $signed(wire12))};
              reg53 <= reg43[(3'h6):(2'h3)];
            end
          else
            begin
              reg51 <= {$unsigned($unsigned($signed((~&reg43)))),
                  ($unsigned(wire11[(3'h5):(3'h4)]) | ((~(+wire13)) ?
                      reg44[(2'h2):(1'h1)] : $unsigned((reg45 ?
                          reg51 : reg42))))};
              reg52 <= ($signed(reg50[(4'h9):(2'h3)]) != (((wire14 ?
                      reg50[(4'ha):(1'h1)] : $unsigned(wire13)) <= $unsigned((~|reg49))) ?
                  (reg51 == $signed((~|(8'hb4)))) : ($signed($signed(reg48)) ?
                      (&$signed((8'h9f))) : (~^{reg49}))));
            end
        end
      else
        begin
          reg44 <= (8'hb1);
          reg45 <= (~$signed(($unsigned({reg47, reg52}) ?
              ((reg51 == reg44) ?
                  $signed(reg45) : (reg46 ~^ wire13)) : (-{reg51, reg52}))));
        end
      reg54 <= (-(wire11[(1'h0):(1'h0)] ?
          (^$signed($signed(wire10))) : (($signed(reg44) * reg52[(4'ha):(1'h1)]) ?
              (7'h44) : $signed((wire40 * reg44)))));
    end
  always
    @(posedge clk) begin
      if ({($unsigned((~|(wire10 ? reg44 : reg42))) & reg44[(1'h1):(1'h1)]),
          wire15})
        begin
          reg55 <= $signed($signed((!(+$unsigned(wire14)))));
          reg56 <= wire11;
          if ({$unsigned($unsigned(reg49)), (~^{$unsigned(reg43)})})
            begin
              reg57 <= $signed($signed(reg51));
              reg58 <= $unsigned($unsigned(($signed(reg56) ?
                  ($unsigned(reg43) ? reg54 : (reg42 && wire13)) : (((8'h9c) ?
                          reg43 : wire10) ?
                      (reg55 < reg43) : $signed(reg50)))));
              reg59 <= reg47[(2'h2):(1'h1)];
              reg60 <= wire10[(1'h0):(1'h0)];
              reg61 <= wire14;
            end
          else
            begin
              reg57 <= (wire15[(3'h5):(3'h4)] - {((|$unsigned(wire11)) ^~ (-$unsigned(reg60))),
                  ({(reg51 + reg47)} ?
                      reg43[(3'h7):(3'h7)] : reg50[(3'h4):(2'h3)])});
            end
        end
      else
        begin
          reg55 <= $unsigned($signed(wire12[(4'ha):(1'h1)]));
          reg56 <= $unsigned(((((reg45 ? (8'hb5) : reg55) || reg47) ?
              reg43 : ({reg47} >= (reg59 ?
                  reg44 : reg42))) >> (reg60[(2'h3):(2'h2)] | (~wire15))));
          if ($unsigned({$unsigned({(reg43 ? reg59 : (8'hbf)),
                  wire13[(2'h3):(2'h3)]}),
              $unsigned(reg42[(2'h3):(1'h1)])}))
            begin
              reg57 <= (^~(8'ha1));
            end
          else
            begin
              reg57 <= (~(7'h41));
              reg58 <= $signed((($unsigned(reg57[(3'h4):(1'h0)]) || (reg57 || (!reg56))) == ((!$signed(reg44)) ~^ (reg46[(3'h4):(2'h2)] ?
                  {wire15} : (wire10 <<< (8'hb0))))));
              reg59 <= (^$signed((^~$unsigned((reg44 < wire14)))));
              reg60 <= $signed(((((+reg53) <<< (reg57 ^ reg43)) ?
                      reg59[(1'h0):(1'h0)] : $unsigned(((8'hb8) ?
                          reg51 : (8'haa)))) ?
                  $unsigned(reg43[(5'h11):(5'h11)]) : $signed(reg47[(3'h4):(1'h1)])));
              reg61 <= reg58;
            end
        end
      reg62 <= (wire14[(3'h5):(3'h5)] ?
          reg53[(4'h8):(3'h6)] : ($signed(reg60[(3'h6):(3'h4)]) ?
              $signed($unsigned($unsigned(reg55))) : reg51[(2'h3):(1'h1)]));
      if (({reg49,
              ($signed({wire12}) ?
                  wire12 : ((8'ha5) ?
                      $signed(wire13) : (wire11 ? reg61 : (8'hab))))} ?
          (reg42 == {(reg55[(2'h2):(1'h0)] || (wire10 ?
                  reg51 : wire14))}) : (+$signed(reg62))))
        begin
          if ($signed($unsigned(($unsigned(reg54) << $unsigned($signed(reg55))))))
            begin
              reg63 <= reg48;
              reg64 <= reg53;
              reg65 <= reg62[(4'hd):(2'h2)];
              reg66 <= $signed((|(reg44[(1'h1):(1'h0)] ?
                  (((8'ha4) ?
                      reg62 : (8'hb3)) ~^ $signed(reg61)) : $signed($unsigned(wire12)))));
            end
          else
            begin
              reg63 <= (~|$signed(((wire14[(5'h12):(4'he)] ?
                  (8'h9c) : (reg44 ?
                      (8'hac) : reg62)) ^ (wire15[(4'ha):(4'h9)] ?
                  reg52 : (reg42 ? reg63 : reg58)))));
              reg64 <= (!(($unsigned((reg57 >= reg66)) > (|reg54[(4'h8):(1'h1)])) ?
                  ((reg58 ? reg43[(4'h8):(1'h1)] : $signed(reg44)) ?
                      $unsigned(((8'haf) + reg42)) : ($unsigned(reg44) <<< $signed(reg45))) : {{{reg56},
                          (reg62 ? reg64 : reg56)},
                      $signed(reg48)}));
              reg65 <= reg51[(3'h5):(2'h3)];
              reg66 <= reg48[(4'hb):(2'h3)];
            end
          reg67 <= ((^reg44[(2'h2):(1'h1)]) ?
              (reg61[(2'h2):(1'h0)] ~^ (&{(reg42 ?
                      (8'hb2) : reg53)})) : ((reg61 || ({reg61, wire12} ?
                      reg55[(1'h1):(1'h0)] : (reg61 >> (8'hbb)))) ?
                  (+$unsigned(wire15)) : $unsigned((&$unsigned(reg47)))));
          reg68 <= {(((!$unsigned((8'ha5))) ?
                  $unsigned(reg44[(1'h1):(1'h1)]) : (8'hbc)) ^~ reg56[(2'h2):(2'h2)])};
          reg69 <= $signed({(+$unsigned(reg62)),
              (($signed((8'hb6)) != $unsigned((7'h42))) ?
                  ((~&wire10) >> (reg42 ?
                      reg61 : reg56)) : $unsigned(((8'ha5) && wire11)))});
          if ((8'hb1))
            begin
              reg70 <= $signed(reg63);
              reg71 <= $unsigned(reg62[(2'h3):(2'h3)]);
              reg72 <= (($unsigned($signed((wire10 ?
                      reg53 : (7'h44)))) < ((wire15[(4'hb):(4'h8)] ?
                      (-reg51) : (|reg60)) >>> {$signed(wire14)})) ?
                  $unsigned(wire10) : {$unsigned(wire10[(5'h11):(3'h7)])});
            end
          else
            begin
              reg70 <= reg67[(4'he):(4'ha)];
              reg71 <= (wire11 * $unsigned((&(!$unsigned(reg53)))));
              reg72 <= reg62;
              reg73 <= $signed(wire13[(4'hf):(3'h6)]);
              reg74 <= {$signed(reg47[(2'h2):(1'h0)])};
            end
        end
      else
        begin
          reg63 <= $unsigned(reg47[(3'h7):(1'h1)]);
          if ($signed((reg59[(2'h3):(1'h0)] ?
              {$signed(reg45)} : $unsigned(reg51[(4'ha):(2'h3)]))))
            begin
              reg64 <= reg56[(2'h2):(1'h0)];
              reg65 <= {(reg45 ?
                      ($signed($signed(reg71)) <= $signed(reg53[(3'h4):(1'h0)])) : (((reg42 * reg51) ?
                              (!wire11) : (reg48 + (8'ha6))) ?
                          (+(~|reg45)) : (8'hb8)))};
              reg66 <= reg69;
              reg67 <= (^~(!$unsigned($signed($unsigned((8'hbf))))));
              reg68 <= reg43[(5'h10):(4'ha)];
            end
          else
            begin
              reg64 <= {$unsigned($signed(reg69[(1'h0):(1'h0)]))};
              reg65 <= reg60;
              reg66 <= reg60[(1'h0):(1'h0)];
            end
          reg69 <= (~^reg57);
          reg70 <= {((reg51[(3'h7):(1'h1)] * (reg42[(2'h3):(2'h2)] <<< (~&reg42))) - $signed($signed($unsigned(reg69))))};
        end
      reg75 <= reg44;
    end
  assign wire76 = (8'h9d);
endmodule

module module16
#(parameter param38 = ((((((7'h41) + (8'hbe)) ? (~&(8'h9f)) : (|(8'ha2))) ? (((8'hbe) ? (7'h44) : (8'h9e)) & (&(7'h42))) : (~^((8'ha8) ? (8'ha4) : (7'h43)))) == ((((7'h42) ? (7'h44) : (8'ha3)) <<< ((8'hb9) ? (8'ha6) : (8'hbb))) << (((8'h9c) ? (8'ha7) : (8'hba)) ? ((7'h44) < (8'ha4)) : (!(8'hb7))))) ? (({(~(8'hab))} & ((!(8'hac)) ? (~^(8'hb1)) : {(8'had)})) & ({((7'h40) ? (8'hb1) : (8'had))} ? ({(7'h42), (8'hb5)} >= ((7'h44) << (8'ha8))) : (((8'ha8) & (8'haa)) ? ((7'h44) && (8'hab)) : ((8'ha7) ? (8'hbc) : (8'hb8))))) : (^~((((8'h9f) < (8'ha4)) ? {(8'haa)} : (^~(8'hba))) ? ({(8'hb7)} < ((7'h40) ? (8'ha0) : (8'hbb))) : ({(8'ha7)} ? ((8'hb5) ? (8'ha3) : (8'hbb)) : {(8'hb5), (7'h41)})))), 
parameter param39 = (&(&({(param38 || param38), (~^param38)} ? (^~((8'hbd) ? param38 : param38)) : ((param38 ? (8'hbf) : param38) ? ((7'h43) ? param38 : param38) : (+param38))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 wire22,
                 (1'h0)};
  assign wire22 = $unsigned($unsigned((8'ha5)));
  assign wire23 = ($signed(({wire17} >> wire20[(1'h0):(1'h0)])) & (^(wire20 & wire18[(4'hf):(4'h8)])));
  assign wire24 = ((^~((|(~|wire19)) ?
                          {(wire23 >>> wire22)} : (wire22 ~^ $signed(wire20)))) ?
                      ({(8'ha6), wire21[(1'h0):(1'h0)]} < (($unsigned(wire18) ?
                          $signed(wire20) : wire23) == (wire20 != (|wire17)))) : wire20[(2'h2):(1'h1)]);
  assign wire25 = wire19[(2'h3):(1'h0)];
  assign wire26 = (((($signed(wire19) && {wire21}) ? (8'ha8) : wire20) ?
                      $unsigned(wire17) : $unsigned($signed((wire25 - wire21)))) < wire18[(5'h13):(3'h7)]);
  assign wire27 = $signed((8'h9d));
  assign wire28 = (8'hb5);
  assign wire29 = (^wire19[(3'h6):(2'h3)]);
  assign wire30 = wire19[(4'hc):(2'h3)];
  assign wire31 = wire20;
  assign wire32 = (wire26 ?
                      ((&{$signed(wire27), $signed(wire28)}) ?
                          {{{wire24}},
                              (((7'h44) ?
                                  wire29 : wire21) <= wire18)} : ($signed((wire29 + wire23)) ?
                              (8'h9f) : wire26[(1'h1):(1'h0)])) : $signed($signed(wire22)));
  assign wire33 = (wire28 ?
                      ($unsigned((^(wire22 | wire32))) ?
                          wire22[(3'h6):(3'h4)] : $unsigned((+((8'hb2) ?
                              wire27 : (8'hbe))))) : (^$unsigned((!(wire32 || wire29)))));
  assign wire34 = {(wire28[(5'h12):(4'ha)] * (wire27[(4'h8):(2'h2)] ?
                          wire20 : {$signed((8'hbd))}))};
  assign wire35 = {wire21};
  assign wire36 = $signed(wire29);
  assign wire37 = (&(wire31 <= wire20[(2'h3):(2'h3)]));
endmodule
