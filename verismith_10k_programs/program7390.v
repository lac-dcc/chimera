module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire162;
  wire [(4'he):(1'h0)] wire90;
  assign y = {wire165, wire164, wire162, wire90, (1'h0)};
  module5 #() modinst91 (wire90, clk, wire2, wire0, wire4, wire1);
  module92 #() modinst163 (.wire96(wire4), .wire95(wire0), .wire93(wire3), .y(wire162), .clk(clk), .wire94(wire2));
  assign wire164 = ($signed($signed(wire90[(3'h5):(1'h0)])) ~^ $signed($unsigned((wire0[(3'h5):(3'h5)] ^~ (wire3 ?
                       (8'ha6) : wire2)))));
  assign wire165 = $signed(((-((wire2 ? wire3 : wire0) | (-wire1))) ?
                       $signed(((wire0 ^~ wire164) * wire4)) : $unsigned({$signed(wire2)})));
endmodule

module module92  (y, clk, wire93, wire94, wire95, wire96);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire93;
  input wire signed [(4'he):(1'h0)] wire94;
  input wire signed [(3'h6):(1'h0)] wire95;
  input wire [(5'h13):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire156;
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire156,
                 reg98,
                 reg97,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((wire96 ?
          ($unsigned($unsigned(wire93)) ?
              $signed({wire95}) : (^(wire96 ?
                  wire96 : wire93))) : ($signed((8'hab)) || (8'hb3))) - wire96[(2'h2):(1'h0)]))
        begin
          reg97 <= $signed($signed((((^(8'hba)) || $unsigned((8'hae))) | {$unsigned(wire94),
              (~^wire96)})));
        end
      else
        begin
          reg97 <= ($unsigned($signed({(wire93 ?
                  wire95 : wire94)})) & $signed(($signed(wire96[(4'ha):(3'h6)]) ?
              ($signed(wire95) ~^ {wire94,
                  (8'ha6)}) : $unsigned((wire95 && wire95)))));
        end
      reg98 <= (($unsigned($unsigned($unsigned(reg97))) ?
              ($unsigned(((8'hbb) || (8'hb8))) | (-(wire94 ~^ wire95))) : (($signed((8'ha9)) < $unsigned(wire95)) || $signed(wire96))) ?
          ($signed(((+wire93) ? ((8'hbb) == reg97) : (~&(8'h9e)))) ?
              reg97 : (wire96 ?
                  (~^(wire93 - wire96)) : ($signed(wire95) ?
                      (&reg97) : (wire94 ^ wire93)))) : ((|(wire96 <<< (wire94 <= wire95))) ?
              reg97[(4'he):(1'h0)] : $unsigned(wire94)));
    end
  assign wire99 = wire93[(1'h1):(1'h0)];
  assign wire100 = (+$unsigned(reg97));
  assign wire101 = {((((^wire95) ? wire93 : (~&reg98)) ?
                           wire100 : ((wire94 ? wire93 : wire96) ?
                               ((8'had) | reg97) : $unsigned(reg98))) || $signed(wire94))};
  assign wire102 = (~(!wire99));
  assign wire103 = (~&(~|$unsigned($unsigned($unsigned(wire94)))));
  assign wire104 = $unsigned(((((wire101 ~^ wire99) ^ wire101) && (^$unsigned(wire94))) ?
                       (+($signed(reg97) & $signed(wire103))) : reg98));
  assign wire105 = wire96;
  module106 #() modinst157 (.clk(clk), .wire109(wire100), .y(wire156), .wire107(wire104), .wire111(wire102), .wire108(wire94), .wire110(wire96));
  assign wire158 = (-$signed((8'hb7)));
  assign wire159 = reg97;
  assign wire160 = $unsigned((reg98[(3'h5):(1'h1)] ^ (wire101 >> wire159)));
  assign wire161 = $signed(((reg97 ?
                           ($signed(wire93) <<< (wire96 << wire159)) : (8'hb9)) ?
                       $signed((((8'hb7) >> wire104) < wire104)) : ($signed((~^reg97)) <= $unsigned($signed(wire103)))));
endmodule

module module5
#(parameter param89 = (-(8'hac)))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire75;
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire75,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $signed((^~$signed((wire6[(4'h8):(3'h6)] ?
          (wire8 ? wire6 : wire7) : (|wire9)))));
      reg11 <= $signed($unsigned({wire7}));
      reg12 <= reg11[(4'ha):(4'h8)];
      if ($signed($unsigned(($unsigned((~^(8'h9d))) <= (((8'ha0) ?
          reg11 : reg11) | (-reg11))))))
        begin
          if (($unsigned($signed($signed((&reg11)))) != reg12))
            begin
              reg13 <= (8'hb3);
              reg14 <= (wire7[(1'h0):(1'h0)] >> (wire9[(5'h11):(5'h10)] >>> $unsigned($signed($signed((8'hb6))))));
              reg15 <= reg14;
              reg16 <= (((((~reg11) << (^~wire6)) && wire6) & wire6[(4'h9):(3'h4)]) ?
                  wire6[(4'hb):(3'h5)] : (-(^(8'h9e))));
              reg17 <= ((|(wire7 == $signed((wire8 ?
                  reg16 : reg11)))) && ((wire6[(1'h1):(1'h1)] >>> ((reg13 < (8'ha4)) ?
                  $unsigned(wire6) : {reg13, reg13})) + (7'h40)));
            end
          else
            begin
              reg13 <= {$unsigned((~^(8'hb3)))};
              reg14 <= $signed({(reg10[(3'h4):(1'h0)] | (|$signed(reg15)))});
              reg15 <= ((-((!{reg13, reg14}) ?
                      reg16 : (reg11[(2'h2):(1'h0)] ? (8'hb0) : (-reg10)))) ?
                  (+$signed($unsigned((reg17 & wire7)))) : (($unsigned($signed(wire6)) ^~ ($signed(reg13) || (~&(8'hb2)))) << (((wire8 ?
                          reg13 : reg15) ?
                      reg17[(4'he):(3'h4)] : $signed(wire7)) > ((reg14 == reg10) ?
                      (!wire8) : $unsigned(reg10)))));
            end
          if ({(wire7 < $signed($signed((8'haa))))})
            begin
              reg18 <= $unsigned(({reg11[(4'hc):(2'h2)]} * ((-(wire7 ^ wire7)) ?
                  (reg17[(1'h0):(1'h0)] <<< (wire6 ?
                      wire9 : (7'h41))) : reg14[(4'he):(2'h2)])));
              reg19 <= (~&(!$signed(reg13[(3'h4):(2'h3)])));
            end
          else
            begin
              reg18 <= wire7;
              reg19 <= $signed((7'h40));
              reg20 <= ($signed(($unsigned($signed(reg19)) ?
                  ((^wire8) ^ reg19) : (((8'hb7) ?
                      reg15 : reg16) << {reg10}))) > $unsigned((($signed(wire6) ?
                      ((7'h44) <<< wire7) : reg10) ?
                  wire9 : $signed((reg17 + wire6)))));
            end
          reg21 <= {reg19[(1'h1):(1'h1)], $signed($unsigned(reg17))};
          reg22 <= $signed($signed((8'ha1)));
        end
      else
        begin
          reg13 <= (8'h9c);
          reg14 <= ({{reg21}} >> wire8[(3'h4):(1'h0)]);
          reg15 <= ({{(^(|reg10)),
                  ($unsigned(reg22) < $signed((8'hb9)))}} < ((((reg20 ^ reg18) ?
                  $unsigned(wire6) : (!reg18)) << $unsigned((wire8 ?
                  reg17 : reg11))) ?
              $unsigned((reg11 || (8'ha7))) : wire7[(1'h1):(1'h1)]));
          reg16 <= (((reg15[(2'h3):(1'h1)] ?
                  {(|wire8)} : reg20[(1'h1):(1'h1)]) ?
              reg19 : $unsigned((~^{reg20}))) >>> ((~&$unsigned((~^wire9))) ?
              ((!wire6) < {(wire8 ? (8'hae) : reg16),
                  wire7}) : ($unsigned((+reg20)) >= (!(reg11 && (8'hb6))))));
        end
    end
  assign wire23 = reg17[(4'hb):(3'h4)];
  assign wire24 = reg22;
  assign wire25 = (~|(&((^reg11) & $signed({(8'hbe), wire7}))));
  assign wire26 = (((^(+$unsigned(reg15))) << $signed($unsigned(wire7[(1'h1):(1'h0)]))) >> wire24[(2'h2):(1'h1)]);
  assign wire27 = (wire9[(5'h10):(3'h4)] || $signed(reg19[(1'h0):(1'h0)]));
  assign wire28 = $signed((reg19 ? wire27 : $unsigned($signed(wire26))));
  module29 #() modinst76 (wire75, clk, wire26, wire7, reg22, wire25);
  always
    @(posedge clk) begin
      reg77 <= {(~reg11[(3'h4):(2'h2)]),
          $signed($unsigned(reg12[(4'h8):(3'h7)]))};
      if ((reg12[(4'hc):(2'h3)] ?
          $unsigned(reg21[(4'h8):(3'h6)]) : reg15[(3'h6):(1'h1)]))
        begin
          reg78 <= $signed(reg15[(2'h3):(2'h3)]);
          reg79 <= ($signed(wire8) >>> ({(reg78 ?
                      (reg16 ? wire24 : wire25) : $unsigned(reg10))} ?
              ($signed(((8'ha3) ? reg22 : wire75)) ?
                  $signed(wire75[(4'he):(4'ha)]) : wire75) : $unsigned($signed((wire27 * wire24)))));
          reg80 <= ($signed($unsigned(reg13[(2'h2):(1'h1)])) >> (!$signed(((reg16 ?
              reg11 : reg19) ^ reg22))));
          reg81 <= ($signed({((reg21 | reg11) + (8'ha9)),
              (^~$unsigned(reg18))}) * $unsigned($unsigned((reg18 + (wire9 ?
              wire27 : (8'ha2))))));
        end
      else
        begin
          reg78 <= $signed($unsigned((({reg16} || (wire25 >>> wire7)) >>> ((reg81 ?
                  reg20 : reg77) ?
              {reg13} : $signed((8'ha0))))));
          reg79 <= (((reg22 ?
                  {reg14,
                      $unsigned(wire9)} : (^~reg11[(4'hb):(3'h5)])) >> $signed(wire26)) ?
              reg16[(2'h3):(1'h0)] : $signed((&($signed(wire26) ?
                  reg10 : $unsigned((8'hb0))))));
          reg80 <= ((+({(reg12 ? reg10 : wire24)} ?
                  (wire7[(4'hb):(3'h5)] > $signed(reg17)) : $signed((wire28 + wire9)))) ?
              (|(wire24 ?
                  (wire8 ?
                      (7'h44) : wire28) : {(+reg19)})) : {wire75[(3'h4):(3'h4)]});
          if ((wire23 > wire6))
            begin
              reg81 <= reg17[(2'h3):(2'h2)];
              reg82 <= (+$unsigned(({(reg78 ? reg80 : wire8),
                      $signed((8'hbd))} ?
                  ((reg21 | wire6) <= (^~reg11)) : reg19[(2'h3):(2'h2)])));
              reg83 <= ((reg78[(4'h9):(4'h8)] ?
                  reg79 : reg11) - {wire25[(4'hd):(1'h1)],
                  $unsigned(((reg10 >> wire9) ? (reg11 > reg79) : {reg17}))});
            end
          else
            begin
              reg81 <= (8'ha4);
            end
          reg84 <= ($signed($signed($signed(wire7[(3'h4):(3'h4)]))) ?
              (~&(~&{(~&reg78)})) : ((((wire25 << (8'hae)) ?
                      $unsigned((8'hae)) : (reg78 ? reg19 : (8'h9e))) ?
                  reg11 : $unsigned((wire9 ?
                      (8'hbb) : reg20))) != $signed((~(^reg83)))));
        end
      reg85 <= $unsigned(reg18);
    end
  assign wire86 = (~reg18[(3'h6):(3'h6)]);
  assign wire87 = (~^(wire27[(1'h0):(1'h0)] ?
                      reg81[(3'h5):(1'h1)] : wire7[(5'h12):(4'ha)]));
  assign wire88 = wire27[(3'h5):(3'h5)];
endmodule

module module29  (y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h210):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire33;
  input wire [(5'h14):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire60,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg34 <= wire33[(2'h3):(1'h1)];
      if (wire31[(4'h8):(3'h6)])
        begin
          reg35 <= $signed(wire30);
          if (reg34[(3'h7):(2'h3)])
            begin
              reg36 <= {((~(8'h9f)) - $unsigned({{(8'hb5), wire33}}))};
            end
          else
            begin
              reg36 <= reg34[(1'h1):(1'h1)];
              reg37 <= (($unsigned(reg35) ?
                      (|$signed(((7'h41) & wire30))) : $unsigned($unsigned($signed(wire30)))) ?
                  wire31[(3'h5):(1'h0)] : (wire31[(2'h2):(1'h1)] ^~ {((~|reg35) - $unsigned(wire32))}));
              reg38 <= ($signed(wire31) < $unsigned((reg35 ?
                  wire30[(3'h6):(3'h5)] : ($signed(wire31) ?
                      reg37 : $unsigned(wire32)))));
              reg39 <= {$unsigned(wire31[(1'h0):(1'h0)])};
            end
          reg40 <= $unsigned(((reg35 || {wire31[(2'h2):(2'h2)]}) ~^ (reg34 ?
              $unsigned($signed(reg38)) : reg37[(1'h0):(1'h0)])));
          if ($unsigned(({$unsigned(((8'hbf) || reg40))} ?
              reg36 : $unsigned((~^$unsigned(reg39))))))
            begin
              reg41 <= reg35;
              reg42 <= (~&$signed($signed($unsigned((reg34 ?
                  wire32 : reg35)))));
              reg43 <= wire31;
            end
          else
            begin
              reg41 <= reg40;
              reg42 <= (-$signed($unsigned(((~wire32) ?
                  (~|wire33) : reg34[(4'hc):(4'hb)]))));
              reg43 <= (!(wire30[(4'h9):(4'h9)] && $signed(($signed(reg35) ?
                  (reg43 ^ reg41) : wire30))));
              reg44 <= {reg35};
            end
        end
      else
        begin
          if (reg44)
            begin
              reg35 <= $unsigned(reg42);
              reg36 <= ((+{((-reg38) << (wire33 ? wire33 : wire32))}) ?
                  reg44[(1'h0):(1'h0)] : ((((reg35 ? reg40 : wire30) ?
                              $unsigned((8'hb7)) : $unsigned(reg37)) ?
                          ($signed(reg42) & (reg36 ?
                              reg37 : wire31)) : wire31) ?
                      (|(reg34 > (~|reg35))) : ({reg39} ?
                          (8'h9c) : (reg42[(3'h4):(1'h1)] ?
                              (reg34 >> (8'h9f)) : (7'h44)))));
              reg37 <= ({($signed((8'ha7)) ^~ reg40[(3'h5):(2'h2)])} ~^ $signed((~|(!$unsigned(reg44)))));
            end
          else
            begin
              reg35 <= $unsigned($unsigned($unsigned({reg42[(1'h1):(1'h1)],
                  $signed(reg43)})));
              reg36 <= $signed((~(($signed(reg44) ?
                      reg37[(1'h1):(1'h0)] : $unsigned(reg37)) ?
                  $unsigned($signed(reg42)) : (-reg44[(3'h4):(2'h2)]))));
            end
          if ((($signed($unsigned((~|wire33))) & {(+$signed(reg38))}) <<< wire30[(4'h8):(2'h3)]))
            begin
              reg38 <= (reg39 >> $signed($signed(($signed(reg44) | reg35))));
            end
          else
            begin
              reg38 <= reg44[(2'h2):(1'h0)];
              reg39 <= wire30[(3'h7):(3'h6)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg45 <= $signed((wire30[(1'h1):(1'h1)] ?
          $unsigned((~|{wire31,
              wire32})) : $unsigned((reg38 >>> $signed(reg44)))));
    end
  always
    @(posedge clk) begin
      reg46 <= (^~{$signed($signed(wire32)), $signed(reg43[(4'hc):(1'h0)])});
      reg47 <= reg40;
    end
  assign wire48 = $signed(reg47);
  assign wire49 = $signed((&(reg44 ?
                      (^(reg40 <<< reg40)) : reg44[(1'h1):(1'h0)])));
  assign wire50 = wire49;
  assign wire51 = reg45;
  assign wire52 = ((+{wire30[(4'h8):(1'h0)]}) == $signed((~^((~wire50) ?
                      reg34[(1'h1):(1'h1)] : reg42))));
  assign wire53 = (!{(^~reg46),
                      ($signed({reg46}) ?
                          ((reg34 ? (8'haa) : reg47) ^ wire50) : reg46)});
  always
    @(posedge clk) begin
      reg54 <= wire31;
      reg55 <= $unsigned(reg39);
      if (((reg38 ?
          ($unsigned($signed(wire32)) > (|(8'hb5))) : ($signed({reg34}) << ($signed((8'hb8)) - reg37[(1'h0):(1'h0)]))) + $unsigned(reg34[(4'ha):(2'h3)])))
        begin
          reg56 <= (8'had);
          reg57 <= ((wire49[(4'h8):(3'h4)] >> $signed(($unsigned(wire49) < wire30))) ~^ {($unsigned((wire51 ?
                      wire32 : wire30)) ?
                  $signed(wire49[(3'h4):(2'h3)]) : reg38)});
          reg58 <= (wire49 | $unsigned((~|(&(8'ha7)))));
        end
      else
        begin
          reg56 <= {(-(($signed(wire53) ? wire31[(2'h2):(1'h0)] : (~&reg46)) ?
                  ({wire31, wire48} ?
                      (wire30 * wire52) : $unsigned((7'h42))) : {reg36[(4'hc):(1'h1)],
                      (reg42 >= reg46)})),
              $unsigned(wire52[(2'h3):(2'h3)])};
        end
      reg59 <= $signed($signed((8'h9f)));
    end
  assign wire60 = ((((((8'hb7) ? reg35 : reg41) >>> wire32) ?
                          $unsigned($unsigned((8'hb1))) : reg42[(4'h8):(1'h1)]) ?
                      $unsigned($unsigned((reg36 * reg58))) : reg57) > (|$signed(($unsigned(reg45) ?
                      reg58 : $signed(reg44)))));
  always
    @(posedge clk) begin
      reg61 <= reg54[(4'ha):(3'h6)];
      reg62 <= ((wire50 & ($unsigned($signed(reg44)) == reg59[(1'h1):(1'h1)])) & (&{{(reg41 ?
                  (8'hba) : (8'ha8))}}));
      reg63 <= (|($signed(reg38[(2'h3):(1'h1)]) ?
          {($unsigned(reg56) ? {reg44} : (~|reg36))} : ((~^$unsigned(reg55)) ?
              (-{(8'had), (8'hbd)}) : {{reg39, reg45}, reg37[(2'h2):(1'h0)]})));
      reg64 <= ({(~^(-(reg47 ? wire32 : wire49)))} * (~&$signed(((!reg55) ?
          (~|reg54) : (reg62 ? reg34 : (8'hb9))))));
      reg65 <= (+(($signed((~wire52)) ? (~|wire32) : (~((7'h40) - reg47))) ?
          {reg34[(3'h5):(2'h2)]} : (8'hbd)));
    end
  assign wire66 = (reg63[(2'h3):(1'h0)] ? reg37[(1'h0):(1'h0)] : wire52);
  assign wire67 = (^(wire66[(2'h2):(1'h1)] ~^ ((~wire30) ?
                      wire30 : $unsigned((reg59 <<< (8'ha9))))));
  assign wire68 = {(8'had), reg54[(5'h11):(3'h7)]};
  assign wire69 = (~^$unsigned(($signed((reg37 ? reg40 : reg62)) || ((reg62 ?
                      wire50 : reg42) * reg39))));
  assign wire70 = reg64[(2'h3):(2'h3)];
  assign wire71 = ((^reg34[(4'hb):(3'h7)]) ?
                      $unsigned($signed($signed((reg56 ?
                          wire51 : (8'hbc))))) : {wire32[(4'he):(1'h0)]});
  assign wire72 = ((^reg41) ?
                      $unsigned(reg57[(3'h4):(3'h4)]) : ((^~$signed((8'hbe))) ?
                          ($signed(reg42) <= $unsigned(wire33)) : reg58));
  assign wire73 = {(($unsigned($signed(reg37)) ?
                          (+$signed(wire72)) : $signed($unsigned((8'hac)))) + (8'hac)),
                      (^$signed(wire53[(5'h14):(5'h13)]))};
  assign wire74 = $unsigned((-$signed((^~$unsigned(wire33)))));
endmodule

module module106
#(parameter param155 = (8'ha6))
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire111;
  input wire signed [(3'h5):(1'h0)] wire110;
  input wire signed [(2'h3):(1'h0)] wire109;
  input wire [(4'he):(1'h0)] wire108;
  input wire [(5'h11):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire154;
  wire signed [(3'h5):(1'h0)] wire153;
  wire signed [(4'hc):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire [(5'h12):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire112;
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(4'h8):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg130,
                 reg129,
                 reg128,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire112 = ({$signed($unsigned((wire107 - wire109)))} ^~ wire107[(4'hd):(2'h2)]);
  assign wire113 = $unsigned({wire111[(3'h4):(1'h0)]});
  assign wire114 = $signed(wire113);
  assign wire115 = wire111[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (wire108)
        begin
          reg116 <= wire107;
          reg117 <= {$unsigned((wire112[(4'he):(4'hd)] ?
                  (+{wire108, wire109}) : $unsigned(wire108[(3'h7):(1'h0)])))};
        end
      else
        begin
          reg116 <= (~|($signed(($unsigned(wire110) != wire115[(3'h6):(1'h1)])) ^~ wire115[(1'h1):(1'h1)]));
          if (wire113)
            begin
              reg117 <= $unsigned(wire113);
              reg118 <= wire108[(4'ha):(4'h8)];
              reg119 <= reg118[(1'h0):(1'h0)];
              reg120 <= (reg119 ? $signed(wire107[(2'h2):(1'h1)]) : wire114);
              reg121 <= wire112;
            end
          else
            begin
              reg117 <= $unsigned(((^~($signed(reg116) ?
                  $signed(wire113) : $signed(reg119))) == reg120));
            end
        end
      reg122 <= ($unsigned(wire111) ^ (wire113 ?
          (((wire107 ? reg117 : wire111) * (wire107 ? reg117 : wire110)) ?
              (~&wire108) : wire108) : wire115[(3'h5):(3'h4)]));
      reg123 <= wire111[(4'h8):(1'h1)];
    end
  assign wire124 = $unsigned($signed({$signed($unsigned(reg122))}));
  assign wire125 = wire112;
  assign wire126 = wire115;
  assign wire127 = (($signed(reg122) ?
                       $signed({(reg117 == reg123)}) : $unsigned($unsigned($unsigned(wire111)))) & $unsigned($unsigned(wire108)));
  always
    @(posedge clk) begin
      reg128 <= (~&(($signed((~|(8'hbd))) ?
              $unsigned(wire126[(3'h5):(1'h1)]) : reg122[(1'h1):(1'h1)]) ?
          (wire127[(1'h1):(1'h0)] ?
              wire127[(2'h3):(1'h1)] : $unsigned({reg122})) : (~^(^~$unsigned(reg117)))));
      reg129 <= wire107;
      reg130 <= $signed((~|reg117[(1'h0):(1'h0)]));
    end
  assign wire131 = (-{(((wire112 ?
                           reg129 : wire126) | (~|wire113)) >= reg122[(2'h2):(1'h1)]),
                       $unsigned(wire113[(3'h4):(2'h2)])});
  assign wire132 = {wire110,
                       ({((reg122 ? reg121 : wire125) ?
                                   $unsigned(reg119) : wire115[(3'h4):(2'h3)])} ?
                           (~&(+(reg119 ?
                               reg118 : wire107))) : (~^reg120[(4'hb):(4'ha)]))};
  assign wire133 = (wire107[(4'ha):(4'ha)] ?
                       $unsigned((&wire132)) : ((^~(((8'hbc) >= reg118) ?
                               ((8'hbf) | wire113) : wire126)) ?
                           wire110 : ((~$signed(reg120)) ?
                               (((8'hb0) ? wire107 : wire132) << {wire115,
                                   (8'hb1)}) : reg118)));
  assign wire134 = $unsigned($signed({wire126[(3'h5):(1'h1)],
                       wire133[(3'h6):(1'h1)]}));
  always
    @(posedge clk) begin
      reg135 <= reg116;
      if (wire127[(2'h2):(2'h2)])
        begin
          if ($unsigned(wire115))
            begin
              reg136 <= (((wire110[(2'h2):(2'h2)] << {reg128[(2'h2):(1'h0)],
                      {wire134}}) + (+(reg129 ?
                      (wire107 ? reg122 : reg123) : reg121))) ?
                  $signed({({reg129, (8'hb0)} ~^ wire111[(4'hb):(4'hb)]),
                      (reg117[(3'h6):(3'h5)] != (~&reg122))}) : $signed((($signed(wire113) ?
                          $unsigned(wire134) : $unsigned(wire131)) ?
                      wire125[(2'h3):(2'h2)] : (~(~|wire126)))));
              reg137 <= ((^~$unsigned({(wire126 == wire113),
                  (-wire107)})) ^~ wire109[(1'h0):(1'h0)]);
              reg138 <= (|($unsigned((|(wire107 >= wire107))) ?
                  {({wire132, reg122} ?
                          (reg137 << (8'hb1)) : wire131[(3'h4):(3'h4)])} : (&$signed((wire133 ?
                      reg123 : wire109)))));
              reg139 <= (wire108 ?
                  $unsigned($unsigned(($signed(wire132) ?
                      $unsigned(reg119) : (~&reg119)))) : $signed((($unsigned(wire131) ^ (reg116 && wire125)) * $signed({reg130,
                      wire124}))));
            end
          else
            begin
              reg136 <= wire133[(4'h9):(2'h2)];
              reg137 <= (({{(wire125 * reg119), $unsigned(wire115)},
                          $signed(wire112[(4'he):(3'h4)])} ?
                      $signed($unsigned(reg129)) : wire125) ?
                  reg118 : (8'hba));
              reg138 <= reg116[(4'h9):(4'h9)];
              reg139 <= reg130;
            end
          reg140 <= (~^(~&(!((reg118 ? reg135 : reg137) >> wire131))));
          if ($unsigned(reg118))
            begin
              reg141 <= (8'ha6);
              reg142 <= wire115;
            end
          else
            begin
              reg141 <= $signed(wire112[(3'h5):(2'h3)]);
              reg142 <= $unsigned(((!$unsigned(reg140[(4'hb):(3'h5)])) && {(^~$signed(reg122)),
                  wire110}));
              reg143 <= reg122[(2'h2):(2'h2)];
              reg144 <= reg143;
              reg145 <= $unsigned({reg137[(1'h0):(1'h0)]});
            end
          reg146 <= {(&(wire107 ?
                  (8'ha4) : ((!reg121) ?
                      wire112[(4'h8):(3'h6)] : $signed(reg119))))};
          reg147 <= ($unsigned((-($unsigned((8'ha7)) ? wire108 : (~^reg144)))) ?
              (|$unsigned($unsigned((~^(8'hb4))))) : ((((^~reg145) ^~ (~|reg140)) ?
                  $unsigned((reg129 ? reg142 : wire108)) : wire133) < reg122));
        end
      else
        begin
          if (((~&wire134[(4'he):(1'h0)]) ? reg145 : wire110[(1'h1):(1'h1)]))
            begin
              reg136 <= $signed($unsigned(reg139[(1'h0):(1'h0)]));
              reg137 <= wire114;
            end
          else
            begin
              reg136 <= wire113[(4'hc):(2'h2)];
              reg137 <= reg120;
              reg138 <= wire115;
              reg139 <= ($signed($signed((~^$unsigned(reg123)))) * ({(reg121[(2'h2):(1'h0)] ~^ {wire127})} == $unsigned((reg137[(1'h0):(1'h0)] * (reg121 || reg129)))));
              reg140 <= (-$signed(((((8'h9f) ? wire114 : (8'hbe)) | (wire107 ?
                      reg123 : wire134)) ?
                  ($unsigned(wire125) == (+wire127)) : (+(|reg138)))));
            end
          if ((8'hb5))
            begin
              reg141 <= wire124;
              reg142 <= (({reg141[(4'hb):(3'h6)], $signed($signed(reg143))} ?
                      wire126[(2'h2):(2'h2)] : reg140[(4'he):(4'h9)]) ?
                  ($unsigned((~$signed(wire131))) & {$unsigned((reg147 ^~ reg128)),
                      $signed($unsigned(reg130))}) : (!$unsigned(wire113)));
              reg143 <= reg118[(2'h3):(2'h3)];
            end
          else
            begin
              reg141 <= (~^wire134[(5'h10):(1'h1)]);
              reg142 <= ((^~(!((reg129 ? wire108 : wire111) ?
                      reg143 : reg147))) ?
                  $unsigned((wire112 ^~ wire111[(1'h1):(1'h1)])) : ((^~(^(reg121 ?
                          reg138 : reg140))) ?
                      (+$unsigned({reg143})) : (~|(&(wire111 ?
                          reg136 : reg136)))));
            end
          reg144 <= (reg130[(1'h0):(1'h0)] ?
              {$signed(({reg137} | $signed(reg129)))} : $signed(reg135[(4'h9):(1'h1)]));
        end
      reg148 <= $signed(reg119[(1'h1):(1'h1)]);
      reg149 <= {$signed($signed((+wire111)))};
    end
  always
    @(posedge clk) begin
      reg150 <= $unsigned(wire133[(5'h12):(5'h11)]);
    end
  assign wire151 = (((8'hab) ?
                           $unsigned((reg145[(3'h4):(2'h3)] >>> (reg139 ?
                               wire111 : wire126))) : reg117[(3'h7):(2'h2)]) ?
                       reg121[(1'h0):(1'h0)] : $unsigned((reg120[(3'h7):(1'h1)] * $unsigned($signed((8'ha4))))));
  assign wire152 = (~(~&reg141[(2'h2):(1'h1)]));
  assign wire153 = (wire151 <= (&$unsigned(reg130)));
  assign wire154 = $signed($signed(wire109));
endmodule
