module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire111;
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  assign y = {wire117,
                 wire114,
                 wire113,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire111,
                 reg116,
                 reg115,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
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
                 reg24,
                 reg25,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire1[(4'h8):(3'h5)])))
        begin
          if ({$unsigned($unsigned(($unsigned(wire2) ?
                  wire2 : (wire0 ? wire2 : wire4)))),
              (wire4 - (8'h9e))})
            begin
              reg5 <= wire2[(1'h0):(1'h0)];
              reg6 <= wire0[(3'h5):(2'h3)];
              reg7 <= (($unsigned(wire0[(2'h2):(1'h1)]) ?
                  ((^wire2) ?
                      $unsigned((wire0 - reg5)) : $signed((wire2 ^~ wire2))) : (~^wire2[(1'h1):(1'h0)])) >>> wire2[(3'h5):(2'h2)]);
              reg8 <= $unsigned(wire0[(4'h9):(3'h7)]);
            end
          else
            begin
              reg5 <= $unsigned((!reg5[(3'h6):(3'h5)]));
              reg6 <= (reg6 >>> (8'hb6));
            end
          if (reg7[(4'hb):(3'h4)])
            begin
              reg9 <= $unsigned((wire1[(3'h6):(1'h0)] || $unsigned(reg7)));
              reg10 <= (reg5 >> wire4);
              reg11 <= reg7;
              reg12 <= $unsigned((wire2[(4'h8):(3'h7)] + reg8[(3'h6):(3'h6)]));
              reg13 <= reg8;
            end
          else
            begin
              reg9 <= (~|reg8);
            end
          reg14 <= reg11[(2'h2):(1'h0)];
          if ($signed(reg7[(3'h5):(2'h2)]))
            begin
              reg15 <= $signed($signed((~|$unsigned((reg8 & wire1)))));
              reg16 <= reg9;
              reg17 <= (~{(reg16[(1'h1):(1'h0)] ?
                      $signed((reg16 && (8'hb0))) : (|(&reg12))),
                  (^reg15)});
              reg18 <= ($signed(($unsigned((wire0 + reg16)) < ({reg17,
                      (8'hbf)} ?
                  (reg9 << reg14) : $signed((8'haa))))) ~^ (^~(&(((8'hb1) ?
                      wire1 : reg7) ?
                  (reg9 ? reg15 : reg5) : (reg14 | wire1)))));
            end
          else
            begin
              reg15 <= $unsigned(((8'hb2) ?
                  ((((8'ha4) ? reg15 : wire2) & (reg5 ? reg16 : (8'ha2))) ?
                      (~&reg5) : wire0[(3'h4):(2'h3)]) : reg7));
              reg16 <= wire2;
            end
        end
      else
        begin
          reg5 <= (-$unsigned(reg12[(4'hf):(3'h6)]));
          if ($signed({$unsigned(wire3)}))
            begin
              reg6 <= reg9[(1'h1):(1'h1)];
            end
          else
            begin
              reg6 <= $unsigned($signed(reg12));
              reg7 <= (~&{$signed(($signed(reg12) ?
                      (reg5 ? reg10 : (7'h42)) : $unsigned(reg8)))});
              reg8 <= (wire4[(1'h0):(1'h0)] ?
                  $unsigned($unsigned($signed((reg5 ?
                      (8'haf) : reg7)))) : wire2[(1'h1):(1'h1)]);
              reg9 <= {reg8[(4'h9):(4'h8)], wire2[(1'h0):(1'h0)]};
              reg10 <= wire2;
            end
        end
      if ((8'hb2))
        begin
          reg19 <= reg17;
          if (($unsigned((8'hba)) ?
              (((|$unsigned(reg15)) ? (|reg14) : reg7) == ((^$signed((8'h9e))) ?
                  reg19 : ((^~(8'hb4)) > $signed((8'hb8))))) : $unsigned((-((reg18 || reg15) ?
                  (reg8 ? reg14 : reg9) : (&reg6))))))
            begin
              reg20 <= (reg5 >= reg19[(1'h1):(1'h0)]);
            end
          else
            begin
              reg20 <= reg7;
            end
          reg21 <= (reg16 ? reg15[(5'h12):(3'h5)] : ((8'hb9) ^~ reg9));
          reg22 <= (~reg7);
          reg23 <= $signed($unsigned((^~(reg20 ?
              $unsigned(reg11) : $signed(reg11)))));
        end
      else
        begin
          reg19 <= (({($signed(wire3) >>> (wire4 ? reg17 : reg17)), (^~reg5)} ?
              ({((8'hb3) ? wire1 : reg11)} ?
                  reg21[(1'h0):(1'h0)] : reg11[(1'h0):(1'h0)]) : reg12) == $unsigned($unsigned({(reg12 ?
                  reg21 : reg23)})));
        end
      reg24 <= reg8[(4'ha):(1'h1)];
      reg25 <= $unsigned((8'hb7));
    end
  assign wire26 = reg12[(5'h12):(3'h7)];
  assign wire27 = (&(((reg22 < (reg24 ? wire2 : reg12)) ?
                      (wire26 ?
                          reg22 : (~|reg9)) : reg19) > reg5[(4'hb):(2'h3)]));
  assign wire28 = ((reg7[(1'h0):(1'h0)] | {$signed($signed(reg13)),
                          ((|wire2) << reg16[(2'h3):(1'h1)])}) ?
                      reg24 : wire2[(5'h13):(4'hd)]);
  assign wire29 = {(({{wire1, (8'h9c)}, reg24[(3'h7):(2'h2)]} ?
                          reg6 : (((8'hac) - reg19) * reg23)) ^~ wire26)};
  assign wire30 = {reg8, wire26};
  assign wire31 = ($signed(((~(~^reg5)) != (^((8'hac) ? wire26 : wire26)))) ?
                      (!(((reg13 ? wire26 : reg6) ?
                              (~reg15) : $unsigned((8'ha4))) ?
                          $signed((+reg9)) : reg25[(4'hd):(3'h7)])) : (reg7[(4'hd):(4'hd)] != wire3[(3'h4):(2'h2)]));
  assign wire32 = (8'hba);
  assign wire33 = wire3;
  assign wire34 = reg14;
  always
    @(posedge clk) begin
      reg35 <= reg8[(4'h9):(2'h3)];
    end
  assign wire36 = $unsigned(((^~(reg12 ^~ (~wire0))) ?
                      {reg18, reg17[(4'h9):(2'h2)]} : $unsigned({reg23,
                          {wire0}})));
  assign wire37 = ($unsigned({$signed((8'hb6))}) - {(~|(&((8'hb6) ?
                          (8'hb3) : wire33))),
                      wire0});
  assign wire38 = (~|reg17[(1'h1):(1'h0)]);
  assign wire39 = $unsigned(wire2[(2'h2):(1'h1)]);
  assign wire40 = {(reg20[(1'h0):(1'h0)] >> reg18)};
  assign wire41 = (~^wire4);
  assign wire42 = ($unsigned(($unsigned($unsigned((8'h9c))) & reg5)) ?
                      $signed((wire29 > (reg25[(4'hc):(3'h6)] ?
                          (wire31 >>> reg6) : $signed((8'h9d))))) : reg13);
  module43 #() modinst112 (wire111, clk, reg9, reg20, reg35, wire28);
  assign wire113 = ((reg5 + (reg21[(2'h3):(1'h0)] ?
                           $unsigned($signed((8'hae))) : (^(|reg14)))) ?
                       $signed(wire2[(4'he):(4'ha)]) : (!$signed((reg17[(3'h7):(1'h0)] >= $signed(reg18)))));
  assign wire114 = wire42[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg115 <= (((wire31[(4'ha):(4'h9)] || ((!reg8) >= wire38)) ?
          (^reg5) : (reg15 ?
              $unsigned((reg18 - wire32)) : $unsigned(reg35[(3'h6):(2'h3)]))) << $signed($unsigned((wire39 ?
          $signed(wire114) : $unsigned(wire32)))));
      reg116 <= ($unsigned(wire33) * wire36[(3'h7):(2'h2)]);
    end
  assign wire117 = {($signed((wire111 ? (reg115 >= reg19) : (^reg17))) ?
                           (^$unsigned(reg7[(4'hb):(1'h1)])) : {(((8'hb6) ^ reg23) ^~ $signed(reg8))})};
endmodule

module module43
#(parameter param109 = ((8'h9f) || (8'hbc)), 
parameter param110 = (((~^{(param109 ~^ param109)}) ? (^((param109 ? param109 : param109) < (param109 ? param109 : param109))) : (param109 ~^ {(~|param109)})) ? param109 : ((({param109} <= param109) ? (~^param109) : (param109 >= (&param109))) ? {(((8'hb7) - param109) - (param109 + param109))} : param109)))
(y, clk, wire44, wire45, wire46, wire47);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire45;
  input wire [(5'h12):(1'h0)] wire46;
  input wire [(5'h10):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire106;
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  assign y = {wire108,
                 wire48,
                 wire72,
                 wire74,
                 wire75,
                 wire76,
                 wire85,
                 wire86,
                 wire87,
                 wire106,
                 reg49,
                 reg50,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 (1'h0)};
  assign wire48 = $unsigned((|wire44));
  always
    @(posedge clk) begin
      reg49 <= $signed((^$unsigned(wire48[(2'h2):(1'h1)])));
      reg50 <= {(&wire47[(4'ha):(2'h3)])};
    end
  module51 #() modinst73 (wire72, clk, reg50, wire44, wire47, reg49);
  assign wire74 = $signed((~$signed((&(wire44 ? wire45 : wire72)))));
  assign wire75 = wire72;
  assign wire76 = wire72[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      if (($unsigned($unsigned($unsigned({reg49}))) ?
          (^~$unsigned($unsigned(reg49[(2'h2):(2'h2)]))) : (8'ha0)))
        begin
          reg77 <= wire48[(1'h0):(1'h0)];
          reg78 <= wire48[(1'h1):(1'h1)];
        end
      else
        begin
          if ((^~wire75))
            begin
              reg77 <= {(($signed($signed(wire46)) ^~ $unsigned((^wire44))) ?
                      wire48[(1'h1):(1'h1)] : (^(^~$unsigned(wire44))))};
              reg78 <= $signed((reg78 ?
                  (reg77 ?
                      reg49[(1'h0):(1'h0)] : {$signed((8'ha7)),
                          {reg78, reg78}}) : $unsigned(wire48[(2'h2):(1'h0)])));
              reg79 <= ((~((^wire44) ? $signed((~^reg50)) : wire47)) ?
                  $signed($unsigned($signed((wire72 | (8'hb1))))) : ((wire76[(4'ha):(4'h8)] + {$signed(reg49),
                          $signed(wire72)}) ?
                      ((~&$unsigned((8'h9d))) ?
                          (wire48 ?
                              (wire74 ?
                                  (7'h44) : reg77) : wire48[(1'h1):(1'h0)]) : $unsigned((8'hbe))) : (wire46 ~^ $unsigned((^~wire46)))));
              reg80 <= wire75[(3'h6):(2'h3)];
              reg81 <= wire47;
            end
          else
            begin
              reg77 <= (($signed($unsigned($unsigned(wire44))) ?
                      $signed($signed(reg77)) : {reg50[(5'h12):(4'h8)]}) ?
                  ({(8'hab)} ^ {((~wire74) >>> (wire46 ?
                          wire47 : wire44))}) : $unsigned(wire46));
              reg78 <= (!((~&reg50[(1'h1):(1'h1)]) ^~ (+(^~(8'ha5)))));
              reg79 <= (((((8'ha1) ?
                      ((8'hb9) != (8'h9d)) : (reg49 == reg81)) << ($signed(wire75) ?
                      $signed((8'ha1)) : (reg49 ?
                          wire48 : reg79))) >> (7'h42)) ?
                  ($signed((~&$signed(wire45))) ?
                      reg50[(1'h0):(1'h0)] : ((!{(8'ha5)}) >> $signed(wire75))) : ((({reg81,
                              (8'hac)} ~^ (8'ha4)) ?
                          $unsigned($unsigned(reg80)) : (-wire72)) ?
                      reg78 : (($signed(reg81) ?
                          $signed(wire72) : wire72[(1'h1):(1'h1)]) ^~ (wire47[(3'h5):(2'h3)] >> (^reg81)))));
              reg80 <= reg50[(2'h2):(1'h1)];
            end
        end
      reg82 <= $signed(reg80);
      reg83 <= wire47[(3'h6):(2'h3)];
      reg84 <= (+reg77);
    end
  assign wire85 = wire46;
  assign wire86 = (&(-(8'hbb)));
  assign wire87 = (~&(+(wire72[(2'h2):(2'h2)] > wire85[(2'h2):(1'h0)])));
  module88 #() modinst107 (wire106, clk, wire44, reg82, wire48, wire74);
  assign wire108 = wire87[(1'h1):(1'h0)];
endmodule

module module88
#(parameter param104 = (((8'hb2) ? (((~^(8'ha5)) - ((8'hb9) ? (8'haa) : (8'hb5))) ? ({(8'ha4)} * {(8'hb8)}) : {(-(8'ha4)), (-(8'ha1))}) : {(~^(~^(8'hb0))), (((8'hbd) >= (8'hb9)) * (&(8'ha0)))}) ? (~({((8'hae) <<< (8'hab))} ? ((&(8'ha2)) ? {(8'hb8)} : ((8'h9c) - (8'hb9))) : (^{(8'hbf)}))) : (8'hb8)), 
parameter param105 = (|{(((param104 || param104) ? (^~param104) : (param104 ? param104 : (8'hb4))) ? param104 : ((param104 ~^ param104) > (param104 <<< param104))), {(param104 ^~ (~&param104))}}))
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire92;
  input wire signed [(2'h3):(1'h0)] wire91;
  input wire signed [(5'h13):(1'h0)] wire90;
  input wire [(5'h11):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire95;
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire95,
                 reg97,
                 reg94,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= ($signed(((~|wire90[(3'h6):(2'h3)]) ?
          $unsigned(wire90[(1'h0):(1'h0)]) : $unsigned(wire91))) | (~^wire92));
      reg94 <= $unsigned(reg93);
    end
  assign wire95 = {($signed(reg93[(4'h8):(3'h7)]) >>> reg93[(2'h3):(2'h2)])};
  assign wire96 = (8'hb2);
  always
    @(posedge clk) begin
      reg97 <= $signed(wire95);
    end
  assign wire98 = $unsigned((wire96[(3'h4):(2'h3)] != $signed(($signed(reg94) ?
                      $unsigned(reg94) : (wire96 > reg97)))));
  assign wire99 = wire98;
  assign wire100 = $unsigned((&$signed({{wire90},
                       (reg97 ? (8'ha8) : (8'hb9))})));
  assign wire101 = ($signed({(((8'ha2) ~^ wire95) ?
                               wire89[(4'h9):(3'h7)] : (wire98 > wire92))}) ?
                       wire95[(1'h0):(1'h0)] : ($unsigned(((|(8'hb7)) << $signed((7'h43)))) ?
                           wire98[(4'h9):(4'h8)] : $signed($unsigned((wire100 * wire89)))));
  assign wire102 = (wire96[(1'h0):(1'h0)] ?
                       $unsigned($signed((-(wire96 - wire100)))) : wire100);
  assign wire103 = (!((~^$unsigned(wire89)) ~^ ((~|((8'hb7) ?
                           wire91 : wire90)) ?
                       wire98 : $unsigned((wire102 ^ wire95)))));
endmodule

module module51
#(parameter param70 = (!((8'ha4) > ((!(-(8'ha6))) << (8'haf)))), 
parameter param71 = (8'haa))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  input wire signed [(3'h5):(1'h0)] wire53;
  input wire signed [(2'h3):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  assign y = {wire69,
                 wire66,
                 wire57,
                 wire56,
                 reg68,
                 reg67,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire56 = $signed(wire55[(5'h11):(4'h8)]);
  assign wire57 = $signed($unsigned((((wire56 ?
                      wire56 : wire56) < (!wire55)) + (wire56 ^~ (wire52 >> wire54)))));
  always
    @(posedge clk) begin
      reg58 <= wire52[(1'h1):(1'h1)];
      if ($signed($unsigned((~&{wire52[(1'h0):(1'h0)], (wire52 * wire54)}))))
        begin
          reg59 <= $signed(((|(-(wire57 ? wire55 : reg58))) ?
              $unsigned(({reg58} < $signed((8'hba)))) : $unsigned($signed((wire52 ?
                  wire57 : wire52)))));
          reg60 <= (($unsigned(($signed(reg58) >= (reg58 ? wire52 : reg58))) ?
                  (((wire53 * wire53) ?
                      wire53 : $unsigned(reg58)) < (|$signed(reg58))) : wire52[(2'h2):(1'h1)]) ?
              $signed(wire53[(3'h5):(2'h3)]) : $signed((8'ha4)));
          reg61 <= (8'ha7);
        end
      else
        begin
          reg59 <= (8'ha4);
          reg60 <= $signed($signed(wire53));
          reg61 <= wire54;
          if ($unsigned(((wire54[(1'h0):(1'h0)] ^ (wire52[(2'h3):(2'h3)] << wire56)) ?
              ($signed({reg59}) ?
                  $unsigned($unsigned(reg58)) : $signed(reg58)) : ($unsigned($unsigned(reg59)) ?
                  (|(reg61 == wire54)) : (~$unsigned(wire57))))))
            begin
              reg62 <= $signed(((((wire55 ? reg60 : reg60) < {reg61}) ?
                      wire52[(1'h0):(1'h0)] : $signed(reg59[(4'h8):(3'h6)])) ?
                  $unsigned((~^reg61)) : $unsigned((wire54 & (^wire55)))));
            end
          else
            begin
              reg62 <= reg62;
              reg63 <= ((wire54 + (wire52 ?
                      (~(-wire54)) : $unsigned((reg60 ? wire55 : wire54)))) ?
                  reg62 : ((~&wire54[(1'h1):(1'h1)]) >= wire53[(1'h1):(1'h1)]));
            end
          reg64 <= {(reg61 ?
                  $signed($unsigned({wire57})) : (((wire57 ?
                          wire54 : reg60) * reg63[(4'h8):(2'h3)]) ?
                      (8'h9e) : (~wire56[(3'h7):(2'h2)]))),
              {$signed($signed({reg58, reg59})),
                  ($unsigned((reg62 ? wire55 : reg61)) ?
                      {$unsigned((8'hbb))} : ((wire55 ? reg58 : wire54) ?
                          {reg63, (8'hb4)} : wire52[(1'h0):(1'h0)]))}};
        end
      reg65 <= $unsigned($signed(reg62));
    end
  assign wire66 = $signed((7'h40));
  always
    @(posedge clk) begin
      reg67 <= (|($signed(((wire57 && (7'h43)) && $signed(wire54))) ?
          $signed($unsigned($unsigned(reg64))) : reg59[(5'h11):(4'h9)]));
      reg68 <= (+((($signed((7'h40)) ? (8'ha9) : wire54) ~^ {reg60,
          {reg60}}) ^ {wire52}));
    end
  assign wire69 = reg68[(3'h4):(1'h1)];
endmodule
