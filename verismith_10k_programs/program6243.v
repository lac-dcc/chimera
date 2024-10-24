module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire4;
  assign y = {wire99, wire97, wire86, wire85, wire84, wire82, wire4, (1'h0)};
  assign wire4 = (^$signed((+((wire0 ? (8'ha9) : wire0) >= $signed(wire3)))));
  module5 #() modinst83 (.wire7(wire3), .wire9(wire0), .clk(clk), .wire6(wire4), .y(wire82), .wire8(wire1));
  assign wire84 = ($signed(((~wire82[(1'h1):(1'h1)]) << $signed($unsigned(wire3)))) || ((wire82[(1'h1):(1'h0)] ?
                          $signed(((8'h9d) ?
                              wire0 : (8'h9c))) : wire4[(1'h0):(1'h0)]) ?
                      wire82 : $unsigned(wire4[(2'h3):(2'h3)])));
  assign wire85 = $unsigned(((8'hab) > (!(~^(7'h40)))));
  assign wire86 = {($signed(($signed(wire4) ? (~wire2) : (wire2 & wire85))) ?
                          {$unsigned((8'hbe))} : wire84),
                      wire82};
  module87 #() modinst98 (wire97, clk, wire0, wire4, wire85, wire84);
  assign wire99 = (wire85[(4'h8):(1'h1)] || ($signed((~$signed(wire86))) ?
                      $signed($signed(((7'h43) ?
                          wire1 : wire1))) : $unsigned(wire86[(3'h5):(3'h5)])));
endmodule

module module87
#(parameter param96 = (7'h43))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire91;
  input wire [(5'h11):(1'h0)] wire90;
  input wire [(5'h15):(1'h0)] wire89;
  input wire [(3'h5):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  assign y = {wire95, wire94, wire93, wire92, (1'h0)};
  assign wire92 = (wire90 ?
                      $unsigned($signed(($unsigned(wire91) ^ $unsigned(wire89)))) : $unsigned($unsigned($unsigned($signed(wire90)))));
  assign wire93 = $unsigned(({wire92[(4'h8):(4'h8)]} ?
                      ($unsigned((wire90 ? wire88 : (8'ha7))) ?
                          (!(+wire91)) : ((wire90 ? wire88 : wire92) ?
                              wire89 : (&wire90))) : ($signed(wire90) ?
                          $signed((wire90 ? wire91 : wire89)) : (~|wire90))));
  assign wire94 = wire88[(1'h0):(1'h0)];
  assign wire95 = wire92[(3'h7):(3'h4)];
endmodule

module module5
#(parameter param80 = ((!(~^(((8'ha6) & (8'ha1)) >>> ((8'hbe) ? (8'ha6) : (8'hae))))) ? ({{{(8'ha6)}, ((8'hb6) ? (8'hb8) : (8'h9e))}, ((8'hbd) || {(8'hb1)})} ? (&(((8'ha0) && (8'h9f)) << (&(8'h9f)))) : (8'hbc)) : (|(|{{(7'h43), (8'ha7)}}))), 
parameter param81 = ((~&(~^param80)) * {(8'h9e), param80}))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h244):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire6;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire26;
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire30,
                 wire29,
                 wire28,
                 wire10,
                 wire11,
                 wire26,
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
                 (1'h0)};
  assign wire10 = $unsigned(((wire7 ?
                          ((8'hb9) <<< $signed(wire8)) : $unsigned((wire6 ?
                              wire8 : wire9))) ?
                      {((^~wire8) + ((8'hb7) ^ wire9)),
                          wire6[(1'h0):(1'h0)]} : $unsigned($unsigned((&wire9)))));
  assign wire11 = ((wire9 ?
                      (^(~(wire10 || wire7))) : $unsigned($unsigned({wire8}))) <<< ((~&(wire6 ?
                          wire7[(4'h8):(2'h2)] : (|(7'h43)))) ?
                      $signed(wire7) : (wire7 + $unsigned(wire6))));
  module12 #() modinst27 (.y(wire26), .wire15(wire6), .wire16(wire7), .wire13(wire9), .wire17(wire11), .wire14(wire10), .clk(clk));
  assign wire28 = wire8[(1'h1):(1'h1)];
  assign wire29 = ((-wire8) ?
                      (|$signed($unsigned(wire28))) : {$signed(($unsigned((8'hb7)) ?
                              $unsigned(wire11) : wire8))});
  assign wire30 = (wire26 ^~ wire7[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      if (wire9)
        begin
          reg31 <= {wire7};
          reg32 <= wire30[(4'h9):(3'h4)];
        end
      else
        begin
          if ($signed(($unsigned($unsigned($unsigned(reg31))) ?
              {$signed(wire7), wire30[(1'h0):(1'h0)]} : wire11[(3'h5):(2'h2)])))
            begin
              reg31 <= wire10[(3'h7):(2'h3)];
              reg32 <= (reg31[(2'h3):(2'h2)] ?
                  $unsigned($signed((((8'h9e) ?
                      wire8 : wire7) && $signed(wire8)))) : wire28);
              reg33 <= ($signed(wire11) ?
                  (^$signed(reg31[(3'h6):(1'h0)])) : (+wire7));
            end
          else
            begin
              reg31 <= $unsigned($signed($unsigned({wire9[(2'h2):(1'h0)],
                  ((8'h9d) && reg31)})));
              reg32 <= wire7[(3'h5):(3'h4)];
              reg33 <= (wire26[(1'h0):(1'h0)] ?
                  ((~|(^(wire6 <= (8'had)))) ?
                      $unsigned(((wire10 > reg33) ?
                          ((8'hb5) && wire29) : $unsigned(wire9))) : (&((~wire28) ?
                          (wire28 ? wire29 : reg33) : (wire6 ?
                              wire26 : wire29)))) : reg33);
              reg34 <= $signed($unsigned(wire7));
            end
          if ((((-(wire11 << reg31[(3'h5):(2'h2)])) ?
              $unsigned($signed(((8'ha6) > wire10))) : {$signed(wire10[(4'he):(4'ha)])}) << $signed(wire26[(2'h2):(1'h0)])))
            begin
              reg35 <= (^~$signed($signed($unsigned($signed(wire26)))));
              reg36 <= (wire10 ?
                  (~|(((wire29 <= wire8) ^~ $unsigned(reg32)) ?
                      (8'had) : $signed($signed(reg35)))) : ((~reg31) ?
                      (7'h42) : ($signed((reg32 ^~ wire28)) ?
                          $unsigned((~|reg31)) : (wire9[(2'h3):(2'h2)] & $unsigned(reg34)))));
            end
          else
            begin
              reg35 <= (wire30[(3'h6):(3'h4)] ?
                  $signed((wire28 >= {(reg34 ? wire29 : wire11)})) : wire8);
              reg36 <= ($unsigned($unsigned(((~&reg36) ^~ (8'hb0)))) >= reg36);
            end
        end
      if ((((((reg32 >= wire26) ^ (reg33 < wire6)) - ($signed(reg34) ?
                  $signed(wire28) : (~&wire29))) ?
              (($unsigned((8'ha0)) ?
                  $signed(wire29) : (reg31 <<< wire7)) >> (reg35[(3'h4):(3'h4)] * (^wire7))) : ($signed(wire29) == wire30[(1'h0):(1'h0)])) ?
          $signed($unsigned($signed(wire9))) : (8'ha4)))
        begin
          if ((wire10[(4'hd):(4'hb)] >= $signed((^$signed(((8'ha6) != reg34))))))
            begin
              reg37 <= $unsigned(wire29[(1'h1):(1'h0)]);
              reg38 <= (($unsigned($unsigned(reg34)) - (wire11[(3'h4):(1'h1)] ?
                  (wire9 + wire9) : (^(wire9 >>> wire26)))) | reg37);
              reg39 <= reg32;
              reg40 <= $signed(wire11);
            end
          else
            begin
              reg37 <= (!wire10[(2'h2):(2'h2)]);
              reg38 <= (((reg35 ? ({reg34} ? reg32 : {wire10, wire7}) : reg37) ?
                  (reg37 > ({wire7, wire6} && (+wire29))) : ($unsigned((reg39 ?
                      reg39 : reg40)) == $signed(reg31))) <= ({(!$unsigned(wire11)),
                  $unsigned($unsigned(reg33))} >>> $signed((~|{reg35,
                  wire7}))));
              reg39 <= {wire11, (7'h40)};
            end
          reg41 <= $signed($unsigned(wire7));
        end
      else
        begin
          if ($unsigned($unsigned(reg41)))
            begin
              reg37 <= ({(wire11[(3'h4):(3'h4)] ?
                          $signed((reg35 < reg38)) : $signed({wire29,
                              reg39}))} ?
                  reg41[(2'h3):(2'h3)] : wire28[(5'h13):(3'h6)]);
              reg38 <= (8'ha8);
              reg39 <= $unsigned(({((-wire6) * (~&wire30))} ?
                  (wire30 ?
                      ($unsigned(reg38) ?
                          wire10[(4'h9):(4'h9)] : $signed(reg38)) : ({(8'haa),
                          reg33} > wire8[(1'h1):(1'h0)])) : ((&(-(8'ha6))) ?
                      ((wire6 ?
                          reg32 : reg37) | reg35) : reg40[(1'h0):(1'h0)])));
            end
          else
            begin
              reg37 <= ({((~$signed(wire10)) >> (8'hae))} ?
                  (($unsigned($unsigned(wire26)) ?
                          $unsigned((reg39 & wire11)) : ($signed((8'hbd)) & $signed(wire28))) ?
                      {($unsigned(reg36) ?
                              (wire9 ? wire28 : reg41) : $signed(reg31)),
                          $unsigned((^(7'h43)))} : (-(8'hb6))) : (~$unsigned((+(-(8'hb9))))));
              reg38 <= (wire11 * wire11[(2'h3):(2'h2)]);
              reg39 <= reg39;
              reg40 <= (wire6 && $signed(wire6));
              reg41 <= $signed((8'hbe));
            end
          if (reg37)
            begin
              reg42 <= reg32;
              reg43 <= (-$unsigned((((reg33 ?
                  (8'hbf) : reg32) >> reg38[(1'h0):(1'h0)]) <<< $signed((!reg40)))));
              reg44 <= wire6;
              reg45 <= wire26;
            end
          else
            begin
              reg42 <= wire10;
            end
        end
      reg46 <= $unsigned((-$unsigned(reg39[(4'hd):(2'h3)])));
      reg47 <= {$signed(reg43)};
    end
  assign wire48 = ({($unsigned(reg42[(1'h1):(1'h1)]) ?
                              ((reg45 <= reg31) ?
                                  wire30 : (~|wire7)) : $unsigned((reg32 && reg39)))} ?
                      $signed(($signed((wire6 >= reg45)) ?
                          wire7[(3'h7):(2'h2)] : (-(reg42 ^~ reg33)))) : $signed((reg41[(1'h0):(1'h0)] ?
                          {$unsigned(wire9),
                              $unsigned(reg32)} : ($unsigned(wire10) >= $signed(wire6)))));
  assign wire49 = $unsigned((wire26[(2'h2):(1'h1)] ?
                      $unsigned((reg43[(3'h7):(2'h2)] ?
                          $signed(reg47) : $signed(reg41))) : $unsigned((^~{wire28,
                          reg44}))));
  assign wire50 = reg33[(3'h6):(2'h3)];
  assign wire51 = ((reg43[(3'h4):(2'h2)] ?
                      ($signed(reg42[(3'h7):(3'h6)]) || $unsigned($signed((8'haa)))) : ($signed(reg45) | ($signed(wire29) ?
                          (~&(8'hb6)) : {reg32,
                              reg38}))) <<< (+(wire28 << wire10)));
  always
    @(posedge clk) begin
      reg52 <= wire10[(4'h9):(3'h4)];
      if (((reg32[(3'h4):(2'h2)] == $unsigned({(8'hb0)})) || reg44[(3'h5):(2'h2)]))
        begin
          reg53 <= (((reg45 ~^ reg33) ?
              $unsigned($unsigned(wire11[(3'h6):(3'h4)])) : wire7[(4'h9):(4'h8)]) <<< reg35);
          reg54 <= $unsigned((~reg47[(4'ha):(4'ha)]));
          reg55 <= $signed((reg36 ?
              ($signed(wire26) ?
                  ($unsigned((7'h44)) ?
                      reg41 : (wire50 ?
                          reg31 : (8'hbb))) : reg31) : $signed($signed((wire6 ?
                  reg42 : reg37)))));
          if ((reg34[(2'h2):(1'h0)] ?
              $signed((+({reg34} << wire49))) : $signed(reg38)))
            begin
              reg56 <= (~|reg45);
              reg57 <= {(+$unsigned($signed($unsigned(reg36)))), reg35};
              reg58 <= ($unsigned($signed(wire8[(3'h5):(3'h4)])) ?
                  $signed({$unsigned($signed(reg52))}) : $signed(({reg47,
                      reg37[(3'h4):(1'h1)]} ^~ reg52)));
              reg59 <= $signed($signed(reg56));
              reg60 <= reg55[(3'h4):(1'h1)];
            end
          else
            begin
              reg56 <= ($signed(reg47) ?
                  (^~$unsigned($unsigned((~&reg46)))) : $unsigned(reg46[(4'h9):(2'h3)]));
            end
          reg61 <= (+$unsigned({$signed(wire10[(3'h6):(2'h3)]),
              $unsigned((~&reg60))}));
        end
      else
        begin
          if (wire26)
            begin
              reg53 <= reg38;
            end
          else
            begin
              reg53 <= $unsigned(($signed({(^reg53),
                  reg39[(3'h5):(3'h4)]}) ^ $unsigned(((wire8 ?
                  reg32 : (8'hb1)) != (^~reg45)))));
            end
          reg54 <= (~|{reg43});
          reg55 <= $unsigned((^~$unsigned(((reg34 ^~ wire7) > reg55[(3'h4):(2'h2)]))));
          reg56 <= (8'hb7);
          if (wire10)
            begin
              reg57 <= {reg60};
              reg58 <= $unsigned($signed(reg33[(4'h8):(1'h0)]));
              reg59 <= $signed(wire29);
              reg60 <= ($signed(reg61) > $unsigned($signed($unsigned((^wire9)))));
            end
          else
            begin
              reg57 <= {reg33, reg42};
              reg58 <= (~wire7[(3'h5):(1'h1)]);
              reg59 <= ({reg45[(1'h1):(1'h1)], wire48[(3'h6):(2'h3)]} ?
                  wire49 : reg36);
            end
        end
      reg62 <= (8'hbe);
      reg63 <= reg55;
      if ($unsigned((+$signed($unsigned((wire49 ? reg39 : reg36))))))
        begin
          if (wire50)
            begin
              reg64 <= (wire6[(2'h2):(1'h1)] ?
                  ({((reg56 ? reg32 : reg31) ?
                          wire10[(4'he):(4'hd)] : (reg41 != reg60))} ^ (wire6[(2'h2):(1'h1)] ?
                      reg61 : $signed((reg58 > (8'hab))))) : reg60[(1'h1):(1'h1)]);
            end
          else
            begin
              reg64 <= $signed((|(|($unsigned(reg41) ?
                  $signed(reg54) : $unsigned(wire10)))));
              reg65 <= ((~^($signed((wire50 ?
                      (8'ha1) : reg64)) == reg37[(1'h0):(1'h0)])) ?
                  $signed(((^~reg40[(3'h7):(3'h4)]) ?
                      wire7 : (~(wire26 ?
                          reg40 : reg40)))) : (~|reg37[(4'hd):(2'h2)]));
              reg66 <= (|$signed($signed($unsigned($signed(reg36)))));
              reg67 <= {(^((reg65[(3'h5):(3'h4)] ? {reg37, reg63} : reg38) ?
                      ((-reg61) >= (reg33 ?
                          reg31 : reg45)) : (((8'ha5) >= reg56) ?
                          (wire49 ? reg47 : reg52) : (reg46 ?
                              reg58 : reg44))))};
              reg68 <= reg54[(2'h2):(1'h1)];
            end
          if ({((($unsigned(reg54) & {reg65, reg58}) ?
                  ((reg36 <<< reg43) ?
                      (reg59 ? reg41 : reg64) : (reg52 ?
                          reg58 : wire50)) : reg38[(2'h3):(1'h1)]) ^ {(reg63 + (reg38 ?
                      reg59 : reg65))})})
            begin
              reg69 <= $unsigned(reg54[(1'h1):(1'h1)]);
              reg70 <= reg53;
            end
          else
            begin
              reg69 <= wire11[(1'h1):(1'h0)];
              reg70 <= $signed(wire49);
            end
          reg71 <= (reg41 & $unsigned($signed(reg54)));
        end
      else
        begin
          reg64 <= (~|(-({$signed(reg44), (reg57 ? wire51 : reg63)} ?
              reg38 : (reg69[(1'h0):(1'h0)] >>> {reg42}))));
        end
    end
  assign wire72 = reg33[(1'h1):(1'h0)];
  assign wire73 = $signed($signed((reg41 ?
                      $unsigned($unsigned((8'hb2))) : {$unsigned(wire10)})));
  assign wire74 = reg40[(3'h7):(3'h7)];
  assign wire75 = (reg58[(2'h2):(2'h2)] < (({((8'ha2) ? reg66 : reg35),
                          $signed(reg40)} == $signed((-reg68))) ?
                      ($unsigned((reg63 ? reg47 : (8'haf))) || (wire29 ?
                          (+(8'hb4)) : reg63[(3'h7):(3'h6)])) : $unsigned((~&(wire51 <<< reg58)))));
  assign wire76 = (8'hb9);
  assign wire77 = (($signed((reg67 ?
                      {reg36, reg57} : (reg61 ?
                          reg71 : (8'hb2)))) | ($unsigned((^~reg32)) ~^ (~reg41[(1'h0):(1'h0)]))) <= wire73);
  assign wire78 = $unsigned(wire9[(1'h1):(1'h1)]);
  assign wire79 = $signed(reg42);
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire [(2'h2):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= $unsigned(({$unsigned(wire15[(1'h1):(1'h1)])} ?
          (~^(8'ha6)) : $signed(({wire13, (8'hb9)} ^ (~(8'ha3))))));
      reg19 <= wire16;
      reg20 <= (^~$unsigned(reg18));
    end
  assign wire21 = (+((^~wire14) ? wire17 : wire16));
  assign wire22 = $unsigned((8'ha9));
  assign wire23 = (~^(~|reg19));
  assign wire24 = ($unsigned($signed(((wire16 ?
                          reg18 : wire15) && (&wire17)))) ?
                      (^~wire13[(1'h0):(1'h0)]) : (~&{$unsigned($unsigned(wire13))}));
  assign wire25 = wire13[(2'h3):(2'h2)];
endmodule
