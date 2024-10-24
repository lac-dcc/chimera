module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire79, wire8, wire6, wire5, wire4, reg7, (1'h0)};
  assign wire4 = ($unsigned($unsigned($signed({(7'h44),
                     wire1}))) << $signed(((-(~^wire3)) ?
                     (+(!wire1)) : (~^wire0))));
  assign wire5 = (wire1[(1'h1):(1'h0)] == (wire2[(4'h8):(1'h1)] ?
                     (wire2[(3'h5):(2'h2)] ?
                         $signed((wire2 && wire3)) : (~&((8'h9f) ?
                             wire3 : wire2))) : {(((7'h42) | wire4) ?
                             wire1 : (wire3 ? wire3 : wire1)),
                         (wire3 ? wire3 : (wire1 >> wire0))}));
  assign wire6 = (!((((!wire1) ? $unsigned(wire5) : $unsigned(wire3)) ?
                     wire5 : $unsigned(wire2[(4'hd):(4'hc)])) || $signed({(wire5 || wire3)})));
  always
    @(posedge clk) begin
      reg7 <= $signed(wire2);
    end
  assign wire8 = $unsigned(({wire4} == ($signed({wire0}) + $unsigned((8'hb6)))));
  module9 #() modinst80 (wire79, clk, wire3, wire0, wire4, wire8);
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire70,
                 wire16,
                 wire15,
                 wire14,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire14 = $unsigned(((~&wire13) ? wire12 : (8'had)));
  assign wire15 = $signed($unsigned($unsigned((wire13 ?
                      (wire12 && wire13) : wire14))));
  assign wire16 = (-$signed($unsigned(wire13)));
  module17 #() modinst71 (.wire18(wire11), .y(wire70), .wire19(wire10), .wire21(wire16), .clk(clk), .wire20(wire12));
  always
    @(posedge clk) begin
      reg72 <= $unsigned((~&wire13));
      reg73 <= $signed((|(8'ha2)));
      reg74 <= {wire13[(2'h2):(2'h2)]};
      reg75 <= (($signed((8'ha2)) > wire10[(4'hc):(2'h2)]) ?
          $unsigned($signed(wire11)) : $unsigned((8'hbe)));
      reg76 <= {wire11};
    end
  assign wire77 = ($signed(wire15[(4'hb):(4'h9)]) <<< (^wire70));
  assign wire78 = (($unsigned($signed($unsigned((8'h9d)))) - $unsigned((8'hb6))) - (^~wire15[(4'h8):(3'h5)]));
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h28f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  assign y = {wire69,
                 wire54,
                 wire53,
                 wire30,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire22 = (~^(~&wire18));
  assign wire23 = wire22;
  assign wire24 = wire22[(4'ha):(3'h7)];
  assign wire25 = (($unsigned($signed({wire20, wire23})) ?
                      $unsigned({wire19[(3'h7):(1'h0)]}) : $signed((~&(wire18 ?
                          wire23 : wire18)))) && $signed(wire24[(4'he):(1'h1)]));
  assign wire26 = (~wire18[(4'hc):(2'h3)]);
  assign wire27 = {{$signed((^~(wire25 > wire26)))}, (-$unsigned({(8'hbc)}))};
  always
    @(posedge clk) begin
      if (wire25[(2'h2):(1'h1)])
        begin
          reg28 <= $signed((|$signed($unsigned((wire22 ? wire18 : wire18)))));
        end
      else
        begin
          reg28 <= (wire20[(5'h14):(2'h2)] ?
              ($unsigned((~{(8'hb3)})) & (($signed(wire27) != (&wire19)) >> (+(wire25 ?
                  (8'hbf) : wire22)))) : $signed((reg28 != {{wire21},
                  $unsigned(wire18)})));
        end
      reg29 <= reg28[(4'hb):(4'ha)];
    end
  assign wire30 = $signed(wire24[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg31 <= {reg29[(3'h4):(2'h3)], wire27[(2'h2):(1'h0)]};
      reg32 <= $unsigned((^(~&(wire23[(1'h1):(1'h1)] << $signed(reg29)))));
      if ((wire25 ? (8'ha7) : ((^$unsigned(reg29)) <<< (|wire20))))
        begin
          reg33 <= (8'hbd);
          if (($unsigned((~{(wire20 | wire22), (-(8'haf))})) ?
              $signed((^(wire27 == $unsigned(wire26)))) : (~|wire20[(3'h6):(3'h5)])))
            begin
              reg34 <= ($unsigned(reg31) ?
                  ((wire30 + $unsigned({reg33})) ?
                      $unsigned((~&$signed(wire21))) : wire22[(1'h0):(1'h0)]) : reg28);
            end
          else
            begin
              reg34 <= wire23;
              reg35 <= $unsigned($signed($unsigned($unsigned((reg33 ?
                  reg34 : wire18)))));
              reg36 <= $signed($unsigned({wire22}));
              reg37 <= $signed(wire26);
            end
          reg38 <= $signed((({((8'ha0) ? reg37 : wire24), wire24} ?
              $unsigned(wire30) : (+wire27)) & (8'ha6)));
          reg39 <= (+$signed(wire18[(2'h3):(2'h2)]));
        end
      else
        begin
          reg33 <= (($signed(($unsigned((8'haf)) ?
                      (~^reg32) : $signed((8'hac)))) ?
                  $unsigned((|(wire18 != reg33))) : reg31) ?
              wire26[(4'h9):(3'h5)] : reg28[(4'he):(4'h9)]);
          reg34 <= (!(~(~&wire21[(4'ha):(3'h4)])));
          if ($unsigned((~^reg38[(4'he):(3'h7)])))
            begin
              reg35 <= wire24;
              reg36 <= {(~^(&((^~reg28) << $signed(reg29)))),
                  (&$signed((wire20[(5'h13):(4'he)] >= wire21)))};
              reg37 <= $signed($unsigned((reg37[(3'h5):(3'h5)] ?
                  (8'ha8) : (-$signed(wire27)))));
              reg38 <= (wire22[(4'hf):(4'h9)] ?
                  $signed(((wire24 >>> $signed(reg38)) ?
                      $unsigned($unsigned(wire30)) : (8'ha9))) : reg33[(5'h12):(3'h4)]);
            end
          else
            begin
              reg35 <= reg36;
              reg36 <= $unsigned((&(((|reg32) ?
                  $signed((8'hbd)) : $signed(wire24)) >> {reg34[(4'hb):(4'ha)]})));
            end
          if (($unsigned(reg39[(3'h6):(1'h0)]) ?
              reg32[(2'h3):(1'h1)] : $unsigned((reg38[(4'h8):(2'h2)] ?
                  (~&$signed(wire25)) : $signed($signed(wire25))))))
            begin
              reg39 <= (reg28[(3'h6):(3'h6)] ?
                  ($signed((~$unsigned(reg29))) != ($signed((wire22 ?
                          (8'h9f) : wire18)) ?
                      wire20 : {(8'hab), reg37})) : wire19);
              reg40 <= {reg35[(4'h9):(3'h5)]};
            end
          else
            begin
              reg39 <= $unsigned(($unsigned(reg33[(4'hb):(4'h9)]) | $unsigned(((reg36 ?
                  reg40 : wire22) >> {reg28, (8'hba)}))));
              reg40 <= $unsigned(reg36[(2'h2):(1'h1)]);
            end
        end
      if (wire23[(3'h5):(3'h5)])
        begin
          reg41 <= reg35[(4'h8):(3'h7)];
          if ((~&(((|$unsigned(reg36)) - wire27) < ((8'hb3) >>> reg33[(3'h6):(2'h2)]))))
            begin
              reg42 <= reg34[(4'h8):(3'h5)];
              reg43 <= (reg42 ?
                  $signed($unsigned($signed($unsigned(wire20)))) : $signed(wire21[(4'hc):(3'h6)]));
              reg44 <= $signed((wire21[(5'h11):(2'h3)] | wire21[(2'h3):(1'h0)]));
              reg45 <= $unsigned(wire18);
              reg46 <= (((-(~|(wire19 < wire30))) ?
                      $unsigned($signed(wire21[(5'h11):(4'h8)])) : reg31[(5'h15):(5'h13)]) ?
                  $signed(wire19[(3'h7):(3'h5)]) : $unsigned(($signed((reg41 ?
                      reg28 : wire22)) - reg36[(3'h6):(2'h3)])));
            end
          else
            begin
              reg42 <= wire24[(1'h1):(1'h0)];
              reg43 <= wire25[(1'h0):(1'h0)];
              reg44 <= $signed($signed((reg40 <<< (^~$unsigned(reg45)))));
              reg45 <= (reg37 == $signed(reg39));
            end
          reg47 <= wire22;
        end
      else
        begin
          if (reg34[(3'h6):(1'h1)])
            begin
              reg41 <= (^(~^(~&{reg31[(4'hc):(4'h8)]})));
              reg42 <= $signed($signed($unsigned($signed($signed(reg45)))));
              reg43 <= wire30;
              reg44 <= (+reg40[(4'h8):(1'h0)]);
            end
          else
            begin
              reg41 <= (^~(^~wire20));
              reg42 <= wire20[(3'h5):(1'h1)];
              reg43 <= (+wire25);
              reg44 <= (((~|(~|(&reg32))) ?
                      (^~((reg47 > wire21) >>> $signed(wire26))) : {$signed((+reg33)),
                          ({reg32} ? (reg33 ^ reg35) : (reg45 <<< reg45))}) ?
                  (reg35 ?
                      $unsigned({reg31}) : {wire19}) : {reg43[(4'h8):(3'h5)]});
              reg45 <= reg36;
            end
          reg46 <= (~$unsigned($unsigned(reg31[(5'h14):(3'h6)])));
          if ({(((!wire24) - (!wire18[(4'ha):(2'h3)])) != reg38[(4'hc):(4'hb)]),
              $unsigned($unsigned(reg33))})
            begin
              reg47 <= $unsigned(reg28[(4'ha):(1'h1)]);
              reg48 <= reg36;
            end
          else
            begin
              reg47 <= $signed($unsigned((wire18[(4'h8):(3'h5)] ?
                  ((|(7'h42)) ? reg31 : (reg34 ? wire27 : reg29)) : ({wire25} ?
                      $signed(reg34) : reg40))));
              reg48 <= {(8'hb1), $signed((~&wire23))};
              reg49 <= wire22[(4'h8):(2'h2)];
              reg50 <= (~&wire24[(4'hd):(1'h0)]);
              reg51 <= (((^wire30[(1'h1):(1'h0)]) ?
                  (~reg48[(1'h1):(1'h0)]) : ({reg29} ?
                      $unsigned((wire21 && reg43)) : ($unsigned(reg40) <<< (-wire22)))) >= {reg49,
                  ($unsigned((!reg35)) ?
                      {$unsigned(reg37), {(7'h43), wire25}} : ({reg37, wire21} ?
                          (~|reg32) : (reg46 < (8'hb4))))});
            end
        end
      reg52 <= wire25[(1'h0):(1'h0)];
    end
  assign wire53 = (~&$signed($unsigned(((wire22 < reg42) | (&reg43)))));
  assign wire54 = $unsigned($signed(reg42[(5'h14):(4'h8)]));
  always
    @(posedge clk) begin
      if ((8'ha6))
        begin
          reg55 <= $signed($unsigned((((reg35 ? reg40 : reg41) ?
              reg37 : $signed(reg51)) ^~ $signed({wire21}))));
          if (wire19[(3'h5):(3'h4)])
            begin
              reg56 <= $unsigned($signed((($signed(reg49) - reg37) ?
                  $signed((reg45 != (8'ha6))) : $signed(reg49[(2'h3):(2'h3)]))));
              reg57 <= ($signed(reg55) >>> $unsigned((((wire22 ?
                      reg31 : reg43) << (wire54 ~^ wire26)) ?
                  (-reg33[(3'h6):(1'h0)]) : ({reg34, reg56} ^ {reg33}))));
              reg58 <= $signed(($unsigned((^~(wire25 ~^ reg42))) ?
                  (wire53[(3'h4):(3'h4)] ?
                      {(!reg44), reg32} : (reg44 ?
                          $unsigned(reg44) : (&reg46))) : (reg47[(1'h0):(1'h0)] ^ {$unsigned(reg45)})));
              reg59 <= {(reg38 ?
                      $unsigned($signed({reg47, reg36})) : $unsigned({(-reg39),
                          wire30[(4'hf):(1'h1)]})),
                  reg44[(3'h4):(1'h1)]};
              reg60 <= ({reg48,
                      $unsigned(($signed(reg41) ?
                          reg40 : (wire53 ? reg52 : reg55)))} ?
                  reg50[(3'h7):(2'h2)] : (-reg37));
            end
          else
            begin
              reg56 <= reg59[(5'h14):(4'h8)];
            end
          reg61 <= ((~&(8'had)) ?
              (~&(((~|reg44) ?
                  (wire20 > wire54) : {reg44,
                      reg59}) <= (+$unsigned(wire18)))) : (((reg37[(4'h9):(1'h1)] ?
                      (wire25 ^~ reg40) : $unsigned(reg43)) ?
                  (~&(reg55 >= (8'hbd))) : {reg37[(1'h1):(1'h1)]}) >= ((^wire20[(4'h8):(4'h8)]) >>> ((-wire27) ?
                  $signed(reg43) : $signed((7'h42))))));
          if ((8'ha6))
            begin
              reg62 <= (~&$signed((wire53[(3'h4):(2'h2)] || $signed((reg34 & reg35)))));
            end
          else
            begin
              reg62 <= $signed($unsigned(({$signed(reg46),
                  (reg48 ? reg32 : reg60)} <<< $signed((reg32 ?
                  reg49 : reg35)))));
              reg63 <= reg45[(4'he):(4'hc)];
            end
          reg64 <= (~$unsigned({wire19[(1'h0):(1'h0)]}));
        end
      else
        begin
          if ($unsigned((|$unsigned((^~{reg40})))))
            begin
              reg55 <= (reg39[(4'ha):(3'h7)] ?
                  ($unsigned(($signed(reg56) ?
                      wire26[(3'h6):(3'h4)] : (reg43 ?
                          (7'h43) : reg49))) != (~$unsigned($signed(reg49)))) : {reg63[(3'h4):(2'h2)]});
              reg56 <= $unsigned(reg48[(3'h4):(2'h3)]);
            end
          else
            begin
              reg55 <= (reg35[(2'h3):(1'h1)] >> (&{(+(~^reg41))}));
              reg56 <= {$signed(((+$unsigned(wire54)) >= ((reg49 ?
                          reg51 : reg41) ?
                      $unsigned(reg32) : $unsigned(wire18))))};
              reg57 <= reg33[(5'h15):(5'h11)];
              reg58 <= $unsigned($signed(((wire20 && reg50[(3'h4):(2'h2)]) ?
                  (wire54[(4'hc):(4'ha)] | (+reg43)) : {(wire18 ?
                          reg57 : reg39),
                      reg60})));
            end
          if ((!(7'h43)))
            begin
              reg59 <= (~^(($unsigned((+wire20)) ?
                  wire27 : (^~$unsigned(reg32))) <= ({reg56,
                  (~reg52)} <= (+wire20))));
              reg60 <= {reg42[(4'he):(1'h1)], $unsigned((~&reg52))};
              reg61 <= (+(8'ha5));
            end
          else
            begin
              reg59 <= (~&reg49[(5'h12):(4'hd)]);
              reg60 <= {$unsigned((~|reg50))};
              reg61 <= wire24[(3'h4):(2'h2)];
              reg62 <= wire23;
            end
          reg63 <= reg32;
          reg64 <= reg43;
        end
      reg65 <= $signed($signed(reg38));
      reg66 <= (reg58[(4'hc):(4'hc)] || (8'hae));
      reg67 <= $signed($unsigned(($unsigned(wire30) ?
          $signed($unsigned(wire54)) : $unsigned($signed(reg40)))));
      reg68 <= $signed((!$unsigned(((wire20 * (8'hbe)) ?
          reg43 : $signed(reg35)))));
    end
  assign wire69 = ((&(~^$signed((~|reg50)))) ?
                      (-{$unsigned($unsigned(reg36)),
                          $unsigned(reg67[(3'h4):(2'h2)])}) : $signed(($unsigned(reg64) <<< {(^reg60),
                          (reg52 ? wire20 : wire22)})));
endmodule
