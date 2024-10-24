module top
#(parameter param79 = {(((~((8'hb2) | (7'h40))) ? ((^(8'ha9)) ? (8'ha0) : ((8'hb9) ? (8'h9e) : (8'haf))) : (+{(7'h41), (8'hbe)})) ? ((+(~^(8'hae))) ? {((8'ha0) != (8'ha4)), ((8'hb3) ? (8'ha8) : (8'ha4))} : (((7'h40) >= (8'h9c)) ? ((8'h9e) ? (8'hb8) : (8'hb8)) : ((8'hb3) ? (8'hb1) : (8'h9c)))) : {(~&((8'hbb) ? (8'ha0) : (8'hb5)))}), (((~^((8'ha7) ? (8'h9d) : (8'ha6))) ? (8'h9d) : {(~(8'hae))}) < {{((7'h42) ? (8'h9f) : (8'ha6)), ((8'ha9) ^~ (8'hae))}, ((!(8'hb3)) ? ((7'h41) ? (8'hbd) : (8'hab)) : ((8'hbc) <<< (8'hbb)))})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire50;
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  assign y = {wire78,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire54,
                 wire53,
                 wire52,
                 wire4,
                 wire50,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 (1'h0)};
  assign wire4 = wire1[(2'h2):(2'h2)];
  module5 #() modinst51 (.y(wire50), .wire7(wire2), .wire6(wire1), .clk(clk), .wire9(wire4), .wire10(wire0), .wire8(wire3));
  assign wire52 = (($unsigned((~^(~&wire3))) || ($unsigned((8'hb2)) ?
                      $signed($unsigned(wire1)) : wire0)) | {(((^wire2) ?
                          $signed(wire0) : $signed(wire3)) >>> wire4[(3'h4):(1'h1)]),
                      wire2});
  assign wire53 = $unsigned({$signed(wire2[(4'he):(4'ha)])});
  assign wire54 = {((((wire4 >>> wire0) ~^ {wire0, wire50}) ?
                          (^~wire53) : $signed((wire3 ?
                              wire0 : wire52))) & ({wire50} ?
                          $signed($unsigned((8'hb5))) : {(wire2 ?
                                  wire50 : (8'haf)),
                              $unsigned(wire1)})),
                      wire50[(3'h7):(3'h6)]};
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg55 <= wire52[(4'hd):(4'h8)];
          reg56 <= $signed($unsigned((((wire53 ? wire1 : wire50) ?
              wire54[(5'h15):(3'h6)] : wire0[(4'hc):(4'h8)]) * $signed((wire50 < wire50)))));
          reg57 <= (+$unsigned($signed($unsigned((|wire3)))));
        end
      else
        begin
          if ({wire54, {$signed($unsigned({reg55}))}})
            begin
              reg55 <= {wire53, $signed(wire54)};
              reg56 <= {$unsigned($signed(reg56))};
              reg57 <= $signed(reg56);
            end
          else
            begin
              reg55 <= (~^$signed($signed($signed(wire4[(1'h1):(1'h1)]))));
              reg56 <= $signed(wire2[(5'h12):(4'hd)]);
              reg57 <= (wire3[(4'hb):(3'h4)] ?
                  wire0[(4'he):(3'h5)] : {($signed((wire4 + wire53)) ?
                          wire52[(3'h5):(2'h3)] : (~(wire50 & wire53)))});
              reg58 <= (~|$signed($unsigned($signed($unsigned(wire0)))));
              reg59 <= (-$signed((((reg55 < wire3) ?
                  (wire0 > wire3) : (8'hbd)) == {$unsigned(wire50)})));
            end
          if ((^(($unsigned((^~(8'hb2))) && ((reg55 ? reg59 : reg56) ?
                  wire53[(1'h1):(1'h1)] : {wire53})) ?
              $signed(($unsigned(wire50) + (wire1 >> reg56))) : wire4[(1'h1):(1'h1)])))
            begin
              reg60 <= reg58;
              reg61 <= $unsigned($signed(($signed((wire50 ? reg56 : wire2)) ?
                  {(&wire2)} : {$unsigned(reg58), wire50[(4'h8):(3'h7)]})));
              reg62 <= reg57[(4'h8):(3'h7)];
            end
          else
            begin
              reg60 <= $signed($signed((wire50 | ($signed(wire50) > (reg56 && reg59)))));
              reg61 <= $signed(reg59);
              reg62 <= $signed($signed($signed((~|wire3))));
              reg63 <= ($signed(({wire3} << $unsigned((^~wire53)))) <<< wire2[(5'h12):(2'h3)]);
            end
          if ({$signed(reg63), {reg55}})
            begin
              reg64 <= {reg59};
              reg65 <= (~$signed($signed(reg56)));
            end
          else
            begin
              reg64 <= (~^wire3[(1'h1):(1'h1)]);
            end
        end
    end
  assign wire66 = wire1;
  assign wire67 = $unsigned($signed((~|$unsigned((&wire52)))));
  assign wire68 = reg57[(4'ha):(3'h5)];
  assign wire69 = {(^reg64),
                      (reg55[(2'h2):(1'h0)] ?
                          (~^((8'hab) ?
                              $signed(reg57) : (wire67 * reg59))) : ({(wire50 ~^ (7'h42))} ?
                              reg59[(4'h8):(3'h6)] : $unsigned((reg64 ?
                                  wire54 : wire50))))};
  assign wire70 = ((&(~^$signed($signed(wire68)))) ?
                      reg60[(3'h4):(3'h4)] : wire4[(4'h9):(1'h1)]);
  assign wire71 = wire2;
  always
    @(posedge clk) begin
      if (((&(($signed(reg62) <= (wire4 ? (8'ha3) : wire68)) >> wire0)) ?
          reg64 : $signed(((^(reg56 >> wire69)) && reg65))))
        begin
          reg72 <= {((reg65 ?
                  $unsigned(reg61) : (&$unsigned((8'hab)))) & $unsigned((!(wire0 || wire69))))};
        end
      else
        begin
          reg72 <= $unsigned({$signed(($signed(wire69) ?
                  $unsigned(reg56) : reg63[(3'h7):(1'h0)]))});
          reg73 <= $signed($unsigned((($signed(reg63) || $unsigned(wire67)) >> (~^reg65[(4'h9):(3'h6)]))));
          reg74 <= $unsigned($signed(((((8'hbc) < reg55) - $unsigned(reg56)) ?
              $unsigned({reg73, reg73}) : reg56)));
        end
      if (wire1)
        begin
          reg75 <= wire54;
          reg76 <= wire50;
          reg77 <= $unsigned(reg59[(3'h6):(2'h3)]);
        end
      else
        begin
          reg75 <= ($unsigned({((~^wire71) == wire70),
                  ($unsigned(reg76) & reg56[(1'h0):(1'h0)])}) ?
              $unsigned((^~wire2)) : (|{($unsigned(reg75) - reg75[(1'h0):(1'h0)])}));
          reg76 <= reg75;
        end
    end
  assign wire78 = reg61[(1'h1):(1'h0)];
endmodule

module module5
#(parameter param49 = {(!((&(-(8'ha4))) ? (~^(!(8'hab))) : (((8'ha9) > (8'ha7)) ~^ ((8'hac) + (8'ha0))))), {{(-((8'hb3) << (8'hb9)))}, (({(8'hb0)} ? ((8'had) >>> (8'h9f)) : ((8'hb4) ? (8'hbd) : (8'haa))) ? (((8'hb8) + (8'hb1)) ? (^(8'hb3)) : ((8'haf) ~^ (8'h9d))) : ({(8'hba), (8'hb4)} & {(8'hb8), (8'hbd)}))}})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire11;
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire39,
                 wire37,
                 wire32,
                 wire31,
                 wire11,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = ((!$signed(wire7[(4'hc):(2'h2)])) ?
                      wire7[(1'h1):(1'h0)] : {$signed(((wire9 ?
                              wire9 : wire10) ^ wire7[(4'he):(3'h6)]))});
  always
    @(posedge clk) begin
      if ($signed((wire7[(4'hd):(4'h9)] - wire6[(2'h3):(1'h1)])))
        begin
          reg12 <= $unsigned(wire7);
          reg13 <= {wire10[(3'h6):(3'h5)]};
          reg14 <= ($signed((((wire9 + wire10) == $signed(reg12)) && wire9)) ?
              $unsigned(wire8) : wire10);
        end
      else
        begin
          if (wire7[(3'h4):(3'h4)])
            begin
              reg12 <= (wire7 * {reg13,
                  ((wire10[(1'h0):(1'h0)] == reg14) - $unsigned({(8'hb4)}))});
              reg13 <= $signed($signed((wire6[(2'h3):(2'h3)] ?
                  $signed($signed(wire7)) : reg13)));
              reg14 <= $unsigned(((&((8'hb4) ?
                      $unsigned(reg12) : (wire11 ? reg12 : wire10))) ?
                  reg14 : (reg12[(1'h1):(1'h0)] ?
                      wire8[(1'h1):(1'h0)] : (wire10 ?
                          $signed(wire11) : $unsigned(wire6)))));
              reg15 <= $unsigned($unsigned(((8'haf) >> $unsigned(wire7[(4'he):(2'h2)]))));
              reg16 <= (({(reg12 ? (-wire6) : wire9),
                          $unsigned((reg15 == (8'hab)))} ?
                      (~^reg14) : (~$signed(wire9[(3'h4):(2'h2)]))) ?
                  (~&$unsigned($unsigned(reg13[(3'h7):(2'h2)]))) : $unsigned($signed(wire7[(4'hc):(3'h5)])));
            end
          else
            begin
              reg12 <= (8'hb5);
              reg13 <= (wire7 ?
                  (8'hbe) : {(reg16[(3'h4):(2'h3)] && $unsigned((reg12 > reg13)))});
              reg14 <= wire9[(3'h5):(3'h4)];
            end
          reg17 <= $unsigned((8'hb6));
          if ((reg12 >> reg14))
            begin
              reg18 <= ((&(&reg12[(1'h0):(1'h0)])) ?
                  reg14 : $signed({reg14[(3'h6):(1'h1)]}));
              reg19 <= wire7;
              reg20 <= wire11[(3'h7):(3'h4)];
              reg21 <= (~|reg18[(1'h0):(1'h0)]);
            end
          else
            begin
              reg18 <= (wire9 >> (reg19[(4'hb):(4'ha)] ?
                  ((-reg12[(1'h1):(1'h1)]) ^~ wire9) : $unsigned(wire11)));
              reg19 <= (reg19 ?
                  $signed($unsigned($signed((wire11 && reg14)))) : (reg19[(5'h11):(4'hb)] ?
                      {reg15[(4'he):(1'h1)]} : (8'hb4)));
              reg20 <= reg17;
              reg21 <= (((wire10[(1'h1):(1'h0)] * (wire10[(4'hb):(3'h4)] & (reg20 > reg20))) ?
                  $unsigned(reg12[(1'h1):(1'h0)]) : $signed($signed((wire11 >> wire11)))) >= $signed(reg18));
              reg22 <= (8'hb1);
            end
        end
      if ((((8'hb4) * (8'ha9)) ? wire10 : $signed(reg18[(4'he):(3'h6)])))
        begin
          reg23 <= wire9;
          reg24 <= (&wire8[(4'h9):(4'h8)]);
          reg25 <= (!(({(reg19 & reg19)} ?
              reg17[(2'h3):(2'h2)] : ($signed(wire6) ?
                  (!(8'hbd)) : (7'h40))) <<< (reg24[(4'h9):(2'h2)] ?
              $signed($signed((8'ha2))) : ((~|wire11) << reg17))));
        end
      else
        begin
          if ((wire6[(1'h0):(1'h0)] ? reg24 : (~^reg18)))
            begin
              reg23 <= (~&($unsigned($signed(reg22[(3'h5):(1'h0)])) || $signed((-reg24))));
              reg24 <= ((wire9[(3'h7):(3'h7)] ?
                  (-(!$signed((8'ha9)))) : ($signed({reg18}) ?
                      ($signed((7'h40)) || $unsigned(wire11)) : wire8)) <<< ($unsigned(wire10[(2'h3):(1'h0)]) != $unsigned(reg18)));
              reg25 <= reg23;
            end
          else
            begin
              reg23 <= (($unsigned($signed((reg24 ?
                  (8'h9c) : (8'h9e)))) == $signed($signed(reg18))) <= (((wire11[(4'hd):(2'h2)] ?
                          $unsigned(wire8) : (|reg12)) ?
                      $unsigned((reg23 ?
                          (8'ha8) : wire11)) : $signed(reg18[(4'hb):(2'h3)])) ?
                  $signed((!(reg24 ? reg20 : reg12))) : wire6[(3'h4):(1'h1)]));
            end
          reg26 <= (~|(8'hbc));
          reg27 <= $signed((~|reg21[(2'h2):(1'h0)]));
        end
      reg28 <= reg24;
      reg29 <= ((8'hb4) ?
          $unsigned(reg18) : (reg16[(4'hc):(2'h2)] - $signed((reg14[(2'h3):(1'h1)] ?
              $signed((8'hb0)) : (^reg13)))));
      reg30 <= (({$unsigned((reg28 & reg26))} ^~ reg17[(2'h2):(2'h2)]) ?
          reg14 : ((reg29 << (^(reg15 ^ reg13))) <= (reg25 ?
              (~((7'h44) ~^ reg24)) : $signed((reg19 ? reg16 : reg21)))));
    end
  assign wire31 = $signed(reg24);
  assign wire32 = (((wire31 ^~ ($signed(reg23) ?
                      $signed((8'hb1)) : reg25[(2'h2):(2'h2)])) | ((8'hb1) ^ ((reg17 ?
                          wire10 : wire8) ?
                      (+reg27) : (reg26 - reg17)))) < $unsigned(reg16[(5'h14):(2'h3)]));
  always
    @(posedge clk) begin
      reg33 <= $signed((($signed((wire10 != reg26)) ? reg24 : reg16) ?
          wire7 : $signed(wire32[(2'h3):(2'h2)])));
      reg34 <= (reg25 ?
          reg23 : ({(reg24[(3'h4):(2'h2)] - ((8'hbb) >= reg27))} & ($unsigned((reg23 ?
                  wire10 : (8'hbd))) ?
              $unsigned((&wire31)) : wire11[(2'h3):(1'h0)])));
      reg35 <= reg33;
    end
  always
    @(posedge clk) begin
      reg36 <= (~reg17);
    end
  assign wire37 = $unsigned($signed(((reg28[(4'hc):(2'h3)] ?
                      {reg16, wire8} : {reg36, reg19}) || ((reg16 > reg13) ?
                      (-wire6) : reg22[(3'h5):(3'h4)]))));
  always
    @(posedge clk) begin
      reg38 <= {(((reg25 <<< reg20[(4'h9):(3'h6)]) == {$unsigned(reg13)}) && reg21)};
    end
  assign wire39 = $unsigned(wire32);
  always
    @(posedge clk) begin
      reg40 <= $unsigned($signed($signed((~(-reg21)))));
      reg41 <= (wire9[(2'h2):(1'h0)] ^ $unsigned(((-((8'ha0) ?
              reg27 : (8'hb3))) ?
          wire6 : $signed(wire7[(4'hc):(3'h6)]))));
      if (reg35[(3'h5):(2'h2)])
        begin
          reg42 <= (~|((((reg36 ? reg15 : (8'hbb)) ?
              $signed(reg26) : (reg40 <<< wire32)) * (!(^reg33))) != $unsigned(($unsigned((7'h43)) & reg24[(3'h4):(3'h4)]))));
        end
      else
        begin
          reg42 <= reg23;
          reg43 <= reg14[(2'h3):(1'h1)];
        end
      reg44 <= wire32[(1'h0):(1'h0)];
    end
  assign wire45 = wire31;
  assign wire46 = ((~&reg20[(4'hd):(2'h2)]) ? (~^$signed(reg33)) : reg29);
  assign wire47 = wire46;
  assign wire48 = (8'hb5);
endmodule
