module top
#(parameter param97 = {(&{((8'ha3) | ((8'ha8) | (8'hbf)))}), (|{(((8'h9d) ? (8'hb6) : (8'hbd)) ? ((8'hb8) != (8'ha4)) : ((8'hb4) ? (8'hb0) : (7'h41)))})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire48,
                 wire47,
                 wire4,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {(-(((!wire2) >= (wire2 ^~ wire1)) * ($unsigned(wire0) <= (wire2 ~^ wire3))))};
  always
    @(posedge clk) begin
      if ($signed(wire0[(5'h11):(4'hb)]))
        begin
          if ($unsigned(wire2))
            begin
              reg5 <= wire0[(4'he):(3'h4)];
              reg6 <= ((((8'h9c) || wire1) ?
                      ($signed((wire1 >>> reg5)) ^~ (wire4 + wire2[(1'h1):(1'h1)])) : {(&wire3[(3'h4):(2'h2)])}) ?
                  $unsigned(wire0) : wire0[(4'hf):(4'hf)]);
              reg7 <= (reg6[(1'h0):(1'h0)] < reg5);
            end
          else
            begin
              reg5 <= ($signed(reg5) == (^wire0[(4'he):(2'h3)]));
              reg6 <= wire0;
              reg7 <= $unsigned(reg7[(2'h2):(2'h2)]);
              reg8 <= {$unsigned((((7'h44) ?
                      reg6 : (wire2 && wire0)) ~^ {{reg6}}))};
            end
        end
      else
        begin
          reg5 <= wire2;
          reg6 <= reg6;
          reg7 <= (((~|((~reg5) >>> ((8'h9d) ^~ reg8))) >> (($signed(wire4) << $signed((8'hbc))) < $unsigned(reg7[(1'h0):(1'h0)]))) ?
              wire4[(1'h1):(1'h1)] : $signed((reg8[(3'h5):(1'h0)] ^ ($unsigned(wire1) >> $signed((8'hb5))))));
          reg8 <= $signed($unsigned($unsigned($signed(wire3))));
        end
      if (((($signed({wire3}) <= $unsigned((wire0 ?
          wire1 : reg6))) + ($unsigned($unsigned(wire4)) <<< $unsigned(reg6))) ~^ (~&{({wire0,
              wire2} && (-reg8)),
          ((8'hab) - wire3[(3'h5):(2'h2)])})))
        begin
          reg9 <= ($unsigned(reg8) ?
              ((($unsigned(wire1) <= (wire4 == wire3)) ?
                      $unsigned($signed(wire2)) : $unsigned($signed(reg7))) ?
                  $unsigned(wire0) : $signed({$signed(reg5)})) : wire1);
          if ((({{reg9},
                  ($unsigned((8'hb9)) ?
                      $signed(wire4) : wire0)} != {wire0[(2'h3):(1'h1)]}) ?
              reg8 : reg8[(3'h6):(1'h0)]))
            begin
              reg10 <= (($unsigned({(reg7 ? reg8 : wire4)}) ?
                      $unsigned(((reg9 << reg7) && $signed(wire3))) : wire3[(2'h2):(1'h1)]) ?
                  ($unsigned(((&wire3) <= wire4[(1'h1):(1'h1)])) <<< {reg5[(3'h5):(3'h4)],
                      $signed($unsigned(reg7))}) : ((+(!reg5)) ?
                      $unsigned($signed((reg6 ~^ reg6))) : (&$signed((~&(8'hbf))))));
              reg11 <= wire4;
            end
          else
            begin
              reg10 <= (8'hb2);
              reg11 <= (^(((~|wire0) + reg9) >> (reg10 ?
                  (reg11[(3'h7):(3'h6)] + $signed((8'hb4))) : (-(wire2 != reg6)))));
              reg12 <= ((reg5 ?
                      (~$signed((reg6 | reg7))) : ($unsigned((reg5 <<< reg10)) ?
                          reg5 : reg6)) ?
                  reg9[(3'h7):(2'h3)] : reg8[(1'h0):(1'h0)]);
            end
          reg13 <= ($unsigned(($unsigned(wire0) & ((reg10 ? wire4 : reg10) ?
                  reg5 : (!wire0)))) ?
              wire0[(5'h11):(4'hd)] : {$unsigned((reg5 ?
                      {reg8, wire4} : $signed(wire1))),
                  $signed(reg10)});
          reg14 <= reg11;
        end
      else
        begin
          reg9 <= reg10[(4'h8):(3'h7)];
          reg10 <= {reg13[(4'h9):(2'h2)], $signed((~&$unsigned(reg9)))};
          if ((~|$signed($unsigned($unsigned(reg6)))))
            begin
              reg11 <= reg5[(2'h2):(1'h1)];
              reg12 <= reg7;
            end
          else
            begin
              reg11 <= ($signed(reg14[(1'h1):(1'h0)]) >> (!($unsigned(((8'ha4) ?
                      (8'hb5) : (8'hb9))) ?
                  reg7 : (wire1[(1'h0):(1'h0)] >> (reg11 & reg5)))));
              reg12 <= $signed(reg6[(4'h8):(3'h7)]);
              reg13 <= reg12;
            end
        end
      reg15 <= ((({(reg12 < reg5)} <= reg7[(1'h1):(1'h1)]) ?
          ($signed((reg14 >>> reg6)) ?
              ({reg12,
                  reg6} << $signed(wire3)) : ((reg14 >> reg12) >>> wire0[(4'hc):(1'h1)])) : $unsigned((!reg10))) + wire3[(2'h2):(2'h2)]);
      reg16 <= $unsigned(reg10[(3'h6):(3'h6)]);
      if ((-(|$signed($signed(((8'ha0) ? reg8 : reg13))))))
        begin
          reg17 <= wire4[(2'h2):(1'h0)];
          if ($signed((&$unsigned(((|reg5) <= {reg15, wire1})))))
            begin
              reg18 <= $unsigned(reg12);
            end
          else
            begin
              reg18 <= {((+(wire0 ? $unsigned(reg14) : (!wire0))) ?
                      reg15[(3'h6):(3'h6)] : wire0)};
              reg19 <= ($unsigned(reg13) ?
                  $unsigned(reg10[(4'h9):(2'h3)]) : (($signed(wire0) ~^ ((!wire0) ?
                          $signed(wire3) : reg8[(3'h6):(2'h3)])) ?
                      ((|$unsigned((8'hbb))) ?
                          wire3[(1'h1):(1'h1)] : $unsigned((reg11 ?
                              reg7 : reg12))) : reg14[(1'h1):(1'h0)]));
              reg20 <= $signed((reg10[(4'ha):(4'h9)] && ((|(reg11 | reg9)) ?
                  wire2 : reg5[(1'h0):(1'h0)])));
            end
          reg21 <= reg11;
          reg22 <= $unsigned($signed((((^~wire4) ? (!reg7) : reg9) ?
              reg11 : $unsigned(reg11[(3'h4):(2'h2)]))));
          reg23 <= reg19;
        end
      else
        begin
          reg17 <= (~|{{reg23},
              ((~&reg13[(2'h3):(2'h2)]) ?
                  $unsigned((wire2 < reg9)) : reg16[(2'h2):(1'h1)])});
          if ($signed((reg13[(5'h11):(4'ha)] ?
              ({(reg22 ?
                      reg10 : reg12)} ^~ ((^reg12) != (reg6 & reg19))) : ((~$unsigned(reg23)) ?
                  $unsigned((~&reg19)) : $signed(((8'hb1) ^ wire2))))))
            begin
              reg18 <= wire2;
              reg19 <= (wire2 ?
                  $signed(($signed((reg9 ^ wire2)) != wire0[(5'h12):(3'h7)])) : wire0);
            end
          else
            begin
              reg18 <= $signed((~wire1[(3'h7):(2'h2)]));
              reg19 <= wire2[(3'h7):(2'h3)];
            end
          if (reg7[(1'h1):(1'h1)])
            begin
              reg20 <= reg9;
              reg21 <= $signed((8'hb5));
              reg22 <= reg5;
            end
          else
            begin
              reg20 <= ($unsigned($unsigned(($unsigned(reg14) ?
                  reg18 : $signed(reg14)))) <= (wire1 ?
                  {(8'haf),
                      (+(reg11 ? reg18 : wire4))} : $signed(($signed(reg6) ?
                      (reg21 || reg12) : (~|reg14)))));
              reg21 <= reg15[(3'h4):(1'h0)];
              reg22 <= reg15;
              reg23 <= $signed((~|{(((8'haf) ?
                      reg9 : reg16) < reg6[(3'h5):(3'h5)])}));
            end
        end
    end
  always
    @(posedge clk) begin
      reg24 <= {(~&reg20[(1'h1):(1'h1)])};
      reg25 <= ((reg16[(1'h1):(1'h0)] >> reg11) < {$unsigned($signed((reg16 <= reg16))),
          $signed(((~|reg24) ? wire2[(3'h6):(3'h5)] : {reg5}))});
      if ($unsigned($unsigned(reg18[(3'h4):(2'h2)])))
        begin
          reg26 <= $unsigned(reg22[(1'h1):(1'h1)]);
          if ($unsigned($signed((8'ha1))))
            begin
              reg27 <= $unsigned($unsigned((~|$unsigned(reg23))));
            end
          else
            begin
              reg27 <= (((8'hb0) ?
                      $signed($unsigned((reg22 ? reg16 : reg11))) : (reg6 ?
                          reg13[(3'h4):(1'h1)] : reg16)) ?
                  $signed((reg10[(4'hb):(4'h9)] ?
                      ((reg8 == reg18) > (reg5 < reg20)) : (-reg25))) : {{reg24[(4'h8):(3'h4)],
                          (&(7'h41))},
                      $unsigned(wire1[(1'h0):(1'h0)])});
              reg28 <= reg27[(3'h4):(1'h1)];
            end
          reg29 <= ((reg19 ?
                  (8'ha3) : (~&((reg13 & wire3) ?
                      (~^reg16) : (reg11 ? reg9 : wire3)))) ?
              wire3[(3'h4):(2'h2)] : ($signed(reg9) == reg20));
          reg30 <= (((8'haa) >= (reg10[(3'h7):(1'h1)] ~^ $unsigned(reg16))) & ($signed($unsigned($signed((8'hba)))) ?
              reg21 : (^~$unsigned((reg8 < reg14)))));
        end
      else
        begin
          reg26 <= {reg17[(1'h0):(1'h0)]};
          reg27 <= reg7[(3'h4):(2'h2)];
        end
    end
  always
    @(posedge clk) begin
      if (reg28[(2'h2):(1'h1)])
        begin
          reg31 <= wire1;
          reg32 <= $unsigned(reg6[(4'hf):(2'h2)]);
        end
      else
        begin
          reg31 <= ({$signed(((-reg30) >> $unsigned(reg16)))} & reg19[(3'h7):(3'h5)]);
          reg32 <= reg32[(1'h1):(1'h0)];
          reg33 <= {(8'hae), (^(8'ha2))};
          reg34 <= (($unsigned((reg32[(3'h4):(1'h0)] && wire1)) || $signed((8'hb9))) ?
              (!(reg12 && $unsigned({wire0}))) : (~reg26[(4'hd):(3'h7)]));
          reg35 <= (((8'ha8) ?
              (+$signed(reg19[(2'h3):(2'h3)])) : $unsigned(((reg25 ?
                      reg17 : (8'ha3)) ?
                  {(8'hbb)} : $unsigned(reg14)))) * (8'hb3));
        end
      reg36 <= (((|(~&(reg17 || reg10))) ?
              (reg22 ?
                  reg11[(3'h6):(3'h6)] : reg19[(3'h4):(3'h4)]) : ((reg8 * (reg21 >> reg31)) <<< (8'hae))) ?
          reg34 : (8'hb5));
      reg37 <= {$signed(((^reg31) ^ ((!wire1) << ((8'haa) ? reg19 : reg35))))};
      if (reg6)
        begin
          reg38 <= (wire1 ? reg7[(3'h7):(3'h6)] : {reg26});
          reg39 <= $unsigned(reg27[(2'h2):(2'h2)]);
          if ($signed(reg5))
            begin
              reg40 <= $unsigned(({$signed($unsigned(reg29))} ?
                  $unsigned((~^reg30[(4'h9):(3'h5)])) : reg37));
              reg41 <= (^(8'ha9));
              reg42 <= ($unsigned({reg33, ((^reg29) ^ $unsigned(wire3))}) ?
                  {(&$signed($unsigned(reg18)))} : {{((reg18 ? reg19 : reg32) ?
                              (~reg31) : (wire0 <= reg32))}});
              reg43 <= $unsigned((&reg34));
              reg44 <= {$signed((^($unsigned(wire4) * (-(8'hb0))))),
                  wire2[(1'h1):(1'h0)]};
            end
          else
            begin
              reg40 <= (reg43[(5'h11):(3'h7)] ~^ $unsigned(reg42));
              reg41 <= $signed(reg6[(3'h6):(1'h1)]);
              reg42 <= reg37;
              reg43 <= reg32;
            end
          reg45 <= (wire2 <<< (reg42[(4'ha):(4'h9)] ?
              (wire3[(3'h4):(1'h0)] >= ((reg5 || reg20) ?
                  (~|reg26) : (^~reg17))) : reg27[(3'h7):(1'h1)]));
          reg46 <= (($signed((!((8'hbc) ? reg30 : reg12))) ?
                  {$signed((|reg11)),
                      reg14[(1'h1):(1'h0)]} : $signed(((reg15 >>> reg16) | wire0[(4'hd):(2'h3)]))) ?
              $signed($signed($unsigned($unsigned((8'hbe))))) : (+(^((|(8'hb5)) < $signed((8'h9c))))));
        end
      else
        begin
          reg38 <= $unsigned($signed((($signed(reg20) ?
              reg16[(4'h8):(2'h2)] : (+reg36)) > $signed($unsigned(reg15)))));
          reg39 <= ((~reg18[(4'hd):(2'h2)]) ?
              ((reg42 && reg42[(4'h8):(3'h4)]) ?
                  (8'hba) : ((8'hbd) ?
                      ((^~reg45) ?
                          (reg27 + reg34) : $signed((8'hac))) : $signed(wire1[(3'h4):(2'h3)]))) : {(!($signed(reg28) ?
                      reg29 : (reg17 >= reg21)))});
          reg40 <= $unsigned($signed(reg6));
          reg41 <= $unsigned($unsigned((((~|reg28) ?
                  (reg30 > reg29) : ((8'hbe) < reg32)) ?
              wire0 : $unsigned($unsigned(reg15)))));
        end
    end
  assign wire47 = reg30[(2'h3):(2'h2)];
  assign wire48 = {$signed(({(|wire1)} ?
                          $signed($unsigned(reg7)) : ((reg27 ? wire1 : reg32) ?
                              $unsigned((7'h42)) : wire3[(3'h4):(2'h2)])))};
  module49 #() modinst91 (.wire52(reg22), .wire50(reg17), .wire51(reg36), .clk(clk), .y(wire90), .wire53(reg16));
  assign wire92 = $signed((((reg42[(4'hb):(4'ha)] ?
                          reg10[(1'h1):(1'h1)] : ((8'ha3) | reg43)) - ((reg9 ?
                          reg9 : wire4) <<< (wire48 >>> wire0))) ?
                      ((8'ha0) ?
                          (wire4 ?
                              reg24[(4'hc):(4'h9)] : (reg9 * wire3)) : $unsigned({reg43,
                              reg45})) : ((^~((8'hb6) ? reg26 : reg7)) ?
                          reg7 : reg17[(4'hb):(4'h8)])));
  assign wire93 = $unsigned($unsigned(((^(wire2 ? (7'h42) : reg18)) ?
                      (-$signed(reg39)) : wire90[(4'he):(1'h0)])));
  assign wire94 = wire90[(1'h0):(1'h0)];
  assign wire95 = (({(wire93 >> (reg42 != wire90))} - $signed($unsigned((reg33 << wire93)))) ?
                      wire94[(4'hd):(4'h9)] : ($signed((reg15[(3'h4):(2'h3)] ?
                          $unsigned(reg12) : ((8'hb3) ?
                              reg26 : (8'hb8)))) || reg31));
  assign wire96 = ((reg35[(4'hd):(3'h4)] ?
                          $unsigned(reg29) : $unsigned(reg22[(4'h8):(2'h2)])) ?
                      ((|(((8'hac) ? wire3 : wire93) ~^ {reg13})) ?
                          reg23[(2'h2):(1'h0)] : $signed((~&wire2))) : wire2[(3'h4):(2'h2)]);
endmodule

module module49
#(parameter param88 = {(8'hb7)}, 
parameter param89 = (~|((({(7'h40), param88} ? (-param88) : ((8'hac) ? (7'h42) : param88)) - param88) ? (!(~|(~|param88))) : (^param88))))
(y, clk, wire50, wire51, wire52, wire53);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire [(4'hd):(1'h0)] wire51;
  input wire [(5'h10):(1'h0)] wire52;
  input wire [(4'h9):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire86;
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  assign y = {wire54, wire55, wire86, reg57, reg56, (1'h0)};
  assign wire54 = (~|(~wire51[(1'h1):(1'h0)]));
  assign wire55 = $unsigned(wire50);
  always
    @(posedge clk) begin
      reg56 <= wire51;
      reg57 <= $signed($unsigned($unsigned($unsigned(((8'haf) ?
          wire53 : wire53)))));
    end
  module58 #() modinst87 (.wire61(wire53), .clk(clk), .wire63(wire55), .y(wire86), .wire59(wire51), .wire60(wire52), .wire62(wire54));
endmodule

module module58  (y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire63;
  input wire signed [(3'h5):(1'h0)] wire62;
  input wire signed [(4'h8):(1'h0)] wire61;
  input wire signed [(5'h10):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire74,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg73,
                 (1'h0)};
  assign wire64 = ((wire63[(3'h7):(1'h1)] <= {({(8'hb8)} * $signed(wire61)),
                          ($signed(wire60) ? $unsigned(wire62) : (^~wire61))}) ?
                      wire60[(4'ha):(2'h2)] : wire61[(3'h4):(1'h1)]);
  assign wire65 = ($unsigned((^~wire60[(4'he):(1'h1)])) != (&$signed(((wire64 ?
                      wire61 : (8'hb4)) <<< wire64))));
  assign wire66 = $signed(wire64[(3'h7):(1'h0)]);
  assign wire67 = wire65[(2'h2):(2'h2)];
  assign wire68 = (8'haf);
  assign wire69 = $signed(((!(((8'ha8) ?
                      wire61 : (8'ha8)) >= (8'hb1))) << $unsigned((~wire61[(2'h3):(2'h2)]))));
  assign wire70 = (!wire63);
  assign wire71 = (~|wire61[(4'h8):(1'h1)]);
  assign wire72 = (^~($signed({$signed(wire71)}) ~^ $unsigned(wire64[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg73 <= (($unsigned((wire66 + $signed(wire67))) || ($signed(wire61[(3'h6):(2'h3)]) == (wire71[(4'hc):(4'hc)] ^~ wire65[(3'h6):(2'h2)]))) >> (wire62[(3'h4):(1'h0)] ?
          (^~{$signed(wire71)}) : wire71));
    end
  assign wire74 = $signed($signed(((+{wire60, wire63}) ?
                      wire67[(4'h8):(3'h6)] : $signed($unsigned(wire67)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire74)))
        begin
          if ($signed(($signed($signed($signed(wire71))) < (reg73[(2'h3):(1'h1)] <<< {(8'hab),
              (wire60 && wire67)}))))
            begin
              reg75 <= (wire66[(2'h2):(1'h0)] ? wire66 : wire62[(2'h2):(2'h2)]);
              reg76 <= ($unsigned((($unsigned(wire70) ?
                      (8'ha3) : (!wire62)) + ((wire74 > wire66) ?
                      $signed((8'ha2)) : (wire63 <<< (8'hbd))))) ?
                  wire67 : $signed((^~wire60)));
              reg77 <= reg76[(3'h5):(1'h0)];
            end
          else
            begin
              reg75 <= wire60;
              reg76 <= $unsigned((~^$unsigned({wire71})));
              reg77 <= wire63[(3'h7):(3'h6)];
              reg78 <= (wire64 && (wire71 ?
                  ($signed((+(8'hb2))) + reg75[(4'h9):(4'h9)]) : (8'h9c)));
              reg79 <= (^~(($unsigned($unsigned(wire61)) - (wire65[(3'h7):(3'h4)] ?
                  wire72[(1'h1):(1'h1)] : (reg75 ?
                      wire70 : reg73))) <= $signed((8'ha5))));
            end
          reg80 <= ({(~&wire72)} != $signed(wire74[(3'h4):(2'h3)]));
          reg81 <= ($signed((~{(wire60 ? wire63 : reg76),
              reg78})) << $signed($unsigned({(wire74 == reg78),
              $unsigned(wire69)})));
          reg82 <= (+(wire63[(2'h2):(1'h1)] ?
              wire62 : (((|wire67) && wire62) | {$signed(wire67),
                  (reg79 ? reg73 : reg73)})));
        end
      else
        begin
          reg75 <= (-($unsigned(wire59) ?
              (wire63 ?
                  wire74[(3'h4):(1'h1)] : (reg76 ~^ $signed(wire72))) : $signed($signed(wire72[(1'h0):(1'h0)]))));
          reg76 <= ($unsigned(wire67) - $unsigned(($unsigned({wire61, wire65}) ?
              reg73 : (8'hbd))));
        end
      reg83 <= wire71;
    end
  assign wire84 = (~|wire60);
  assign wire85 = reg80[(2'h2):(1'h1)];
endmodule
