module top
#(parameter param101 = ((((((8'hb7) <<< (8'ha2)) ? ((8'hac) ? (8'hb0) : (8'hbc)) : ((8'ha5) ? (8'h9c) : (8'ha3))) << {(|(8'hb2))}) ? ({{(8'hb2), (8'ha1)}} | (((8'hb4) ? (8'hb3) : (8'hb1)) ? (8'hbc) : ((8'hb0) ? (8'ha8) : (8'haf)))) : {(8'ha0)}) ? (((^~{(8'ha8)}) ? (((7'h43) ? (8'h9e) : (8'hbe)) ~^ {(8'h9f)}) : ({(8'ha0)} ~^ ((7'h43) ? (8'ha8) : (8'hb5)))) != (&(~|((8'hac) ? (8'hbb) : (8'ha3))))) : (((&{(8'hb4), (8'ha1)}) ? (~((8'hb4) | (8'hb9))) : ({(8'hbe), (8'ha2)} & ((8'ha4) ? (8'h9d) : (7'h41)))) ? (&(!(+(8'hbd)))) : ((((7'h40) ? (8'ha6) : (7'h44)) ? (^~(8'hb7)) : ((8'hb2) ? (8'hb2) : (8'hbd))) == {((7'h42) & (8'hbe))}))), 
parameter param102 = param101)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire82,
                 wire4,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned($signed((+wire1[(3'h7):(2'h3)]))));
  module5 #() modinst83 (wire82, clk, wire0, wire1, wire2, wire3);
  always
    @(posedge clk) begin
      if (($unsigned($signed((~|$signed(wire4)))) ?
          $signed((wire3[(2'h2):(1'h1)] ?
              ((~&wire1) ?
                  $signed(wire3) : $unsigned(wire4)) : $signed((~&wire2)))) : (({(!wire3),
              wire0} >> (~&$unsigned(wire0))) | $signed(({wire3,
              wire2} ~^ $signed(wire1))))))
        begin
          reg84 <= {{$unsigned((8'h9c))},
              {(-((wire3 ? wire2 : (7'h43)) ? $unsigned(wire2) : (~wire82)))}};
          reg85 <= wire2;
          reg86 <= (8'hab);
          reg87 <= $unsigned(((~^wire82[(3'h5):(3'h5)]) + (((wire0 > reg86) & (wire0 ?
              wire82 : wire4)) <= $unsigned(wire3))));
        end
      else
        begin
          if ((8'hb0))
            begin
              reg84 <= (~reg84[(3'h4):(2'h3)]);
              reg85 <= $signed($signed($signed((reg85 ?
                  ((8'ha5) || reg85) : (~^reg86)))));
            end
          else
            begin
              reg84 <= $signed((wire1[(4'hc):(4'ha)] ?
                  (!$unsigned(reg84[(3'h4):(1'h1)])) : (reg84 && ((!wire0) + {reg86,
                      wire4}))));
              reg85 <= {$signed({$unsigned($signed(wire4)), (reg86 - reg84)}),
                  ((!{(&wire0), ((8'hb6) <<< wire1)}) ?
                      reg87[(4'h9):(1'h1)] : {wire0})};
            end
          reg86 <= (~|(($unsigned(reg87[(1'h0):(1'h0)]) ?
              wire0 : $unsigned((-wire82))) << (8'hb1)));
        end
      reg88 <= $unsigned(reg84[(1'h0):(1'h0)]);
      if (({wire2, $signed(((-reg88) - reg88[(3'h5):(2'h3)]))} ?
          $unsigned($unsigned({$signed(wire3)})) : (7'h42)))
        begin
          if ((~^(((wire82 ? reg86[(2'h2):(1'h0)] : {reg87}) ?
                  reg86 : ((reg86 ? reg84 : reg88) >= (reg86 || reg88))) ?
              (($signed(wire82) ? wire82[(4'h8):(3'h5)] : (~(8'hbf))) ?
                  $signed({wire82}) : ((reg85 >= reg84) ^~ (|(7'h43)))) : $unsigned((wire3[(3'h6):(1'h1)] ^~ {reg85,
                  (8'h9e)})))))
            begin
              reg89 <= wire1[(5'h11):(4'ha)];
              reg90 <= reg85;
              reg91 <= ((|$unsigned(((wire82 ?
                  reg90 : reg84) < (reg88 <<< reg85)))) + $signed({reg84[(2'h2):(2'h2)]}));
              reg92 <= $unsigned(wire2);
              reg93 <= (reg88 + $signed((&(^(wire82 ? reg87 : reg89)))));
            end
          else
            begin
              reg89 <= wire1;
              reg90 <= reg91[(4'h9):(1'h1)];
              reg91 <= (~|$unsigned(reg89));
              reg92 <= wire1[(4'ha):(3'h4)];
            end
          reg94 <= (reg91[(4'h8):(3'h5)] | (((+(~^reg89)) ?
                  $unsigned($signed(wire1)) : reg89) ?
              wire0 : $signed($signed({wire3}))));
          reg95 <= reg88[(1'h1):(1'h0)];
          reg96 <= $unsigned((^~($unsigned($signed(reg94)) ^ ((7'h43) ?
              (-wire0) : (wire4 ? reg86 : wire3)))));
        end
      else
        begin
          if ({wire82, $unsigned($unsigned($signed($signed(reg95))))})
            begin
              reg89 <= {reg91, reg94[(4'hf):(4'hc)]};
              reg90 <= $unsigned($signed(($signed((^~(7'h44))) >= $signed((reg96 ?
                  reg91 : reg91)))));
              reg91 <= $signed($unsigned($unsigned({(~(8'hb9)),
                  $signed(reg86)})));
              reg92 <= (|reg91);
            end
          else
            begin
              reg89 <= $unsigned(reg85[(4'h9):(3'h6)]);
              reg90 <= (wire4 << (($signed((8'ha5)) ?
                  {$signed(reg95)} : {reg91[(3'h4):(2'h3)]}) << (^$signed((reg93 ?
                  wire4 : wire82)))));
              reg91 <= $unsigned((+(~|wire2)));
              reg92 <= (wire82 ?
                  (~{reg84,
                      (reg95 ? (~reg89) : $unsigned(reg95))}) : $signed(reg87));
            end
        end
    end
  assign wire97 = ($unsigned(wire3[(4'h9):(4'h9)]) * reg93[(3'h7):(3'h6)]);
  assign wire98 = ($signed((^~($unsigned((8'ha9)) >> $signed(reg90)))) ?
                      wire82 : (reg96[(3'h7):(1'h0)] << $signed((wire82 ?
                          (reg90 > reg88) : (!wire2)))));
  assign wire99 = reg94[(4'hd):(3'h6)];
  assign wire100 = {reg86,
                       $signed(((8'hbf) ?
                           ($signed(wire99) >= reg95[(5'h12):(4'h8)]) : (^~wire3[(4'h9):(1'h0)])))};
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire15;
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  assign y = {wire81,
                 wire79,
                 wire15,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= {wire6[(4'hb):(4'ha)]};
      reg11 <= (wire6 - $signed(wire7[(3'h7):(2'h2)]));
      reg12 <= (|((8'hac) == wire9[(3'h4):(1'h1)]));
      reg13 <= reg11[(1'h0):(1'h0)];
      reg14 <= (~reg10[(3'h7):(1'h0)]);
    end
  assign wire15 = wire9[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire9)
        begin
          if ($unsigned(wire6[(1'h0):(1'h0)]))
            begin
              reg16 <= $signed((~&reg11[(2'h2):(2'h2)]));
              reg17 <= reg14[(4'hb):(2'h2)];
            end
          else
            begin
              reg16 <= $unsigned(((8'had) ?
                  (({(8'hb3), wire8} & (wire6 ? wire8 : wire7)) ?
                      (|(~^wire6)) : $unsigned((reg13 != (7'h44)))) : (wire15[(1'h1):(1'h0)] ?
                      (+reg10[(3'h6):(1'h1)]) : $unsigned($unsigned(wire15)))));
            end
          if (reg13)
            begin
              reg18 <= $signed((~|(reg10[(4'h9):(3'h7)] < ($signed(reg14) >> reg14))));
              reg19 <= reg17;
              reg20 <= {reg17, $unsigned(reg11)};
              reg21 <= ($unsigned({reg12}) < (reg20 ?
                  $signed((((8'hac) ? reg14 : (7'h41)) == (wire8 ?
                      reg11 : reg14))) : (~^reg20[(1'h0):(1'h0)])));
              reg22 <= (~|$signed(wire8[(3'h5):(2'h3)]));
            end
          else
            begin
              reg18 <= $signed((({(-(8'ha9)),
                  $unsigned(wire15)} & $unsigned(wire9[(3'h5):(1'h1)])) ^ $signed(reg13)));
              reg19 <= {((-$signed((|(8'hb6)))) ?
                      (^~$signed((&reg20))) : $signed((|(reg10 >= wire7)))),
                  (wire15 > ($signed($signed((8'hb1))) >>> {(^(8'ha1))}))};
              reg20 <= (7'h44);
              reg21 <= wire15;
            end
          reg23 <= $signed((reg20 ? (7'h42) : wire8[(3'h7):(3'h7)]));
          reg24 <= $signed(((~|((wire9 ?
              reg10 : reg10) < $signed(reg16))) != ($unsigned($signed(reg11)) < {(reg13 ?
                  reg22 : reg14)})));
          if (wire6[(4'hc):(4'ha)])
            begin
              reg25 <= ($unsigned(reg10[(2'h2):(2'h2)]) ?
                  (8'h9d) : ((wire8 ?
                          {((8'hbb) <= wire15),
                              {reg17, (8'ha7)}} : (+(!wire9))) ?
                      $signed((8'ha9)) : ($unsigned((reg24 ^ reg17)) < reg19[(4'hb):(1'h1)])));
              reg26 <= (($signed((8'hbb)) ? (^(8'ha7)) : reg25[(3'h4):(3'h4)]) ?
                  (8'ha3) : $unsigned(wire6));
              reg27 <= (~|$signed({reg23[(4'hb):(3'h6)],
                  $unsigned($unsigned(reg14))}));
              reg28 <= $signed((((+(reg25 ?
                      wire9 : reg24)) * wire9[(3'h5):(2'h2)]) ?
                  ((|$unsigned(wire6)) ?
                      wire7[(3'h5):(2'h2)] : (8'hbe)) : (^((wire15 << reg13) || $signed(wire6)))));
            end
          else
            begin
              reg25 <= ($signed((8'hb8)) ?
                  $unsigned(({(wire6 ?
                          reg13 : wire8)} == (reg21[(2'h2):(1'h0)] | (reg20 >= (8'h9f))))) : (^(&$unsigned($signed(reg22)))));
              reg26 <= (+$unsigned(((8'ha6) ^~ $signed(((7'h41) ?
                  wire7 : (8'ha1))))));
              reg27 <= ($signed(((8'hb6) ?
                      (((8'hb3) ? wire7 : (8'hb2)) < (reg27 ?
                          (8'had) : reg16)) : $unsigned((wire6 ^~ wire9)))) ?
                  reg12[(3'h4):(2'h2)] : reg17);
              reg28 <= ((!$unsigned($signed(reg12))) & (8'ha4));
            end
        end
      else
        begin
          if (reg18)
            begin
              reg16 <= (~^($signed(((!reg21) ?
                      (reg27 ? reg26 : wire9) : reg11)) ?
                  reg16 : $signed(reg14)));
              reg17 <= $unsigned(reg16[(4'h8):(3'h6)]);
              reg18 <= reg18;
            end
          else
            begin
              reg16 <= $unsigned($signed(reg17));
              reg17 <= $signed((reg13[(3'h4):(3'h4)] >= $unsigned(($signed(reg17) ?
                  $signed((8'hbe)) : wire7))));
              reg18 <= reg22;
              reg19 <= wire15[(4'h8):(2'h2)];
              reg20 <= ((reg20[(3'h4):(1'h0)] ?
                  $signed($unsigned($unsigned((8'hbe)))) : ($signed($signed(reg10)) ?
                      (!reg28[(4'h8):(3'h6)]) : $unsigned({reg24,
                          reg10}))) * $signed(reg24[(3'h4):(1'h0)]));
            end
          reg21 <= reg21[(3'h6):(1'h0)];
        end
      if (reg11[(1'h0):(1'h0)])
        begin
          if (wire15[(4'h8):(3'h4)])
            begin
              reg29 <= $signed((^(reg12 ?
                  (reg19 - (^wire7)) : wire9[(3'h5):(1'h0)])));
              reg30 <= (reg12 >>> (reg11[(1'h0):(1'h0)] ?
                  ((~&(reg26 <= reg14)) ?
                      $unsigned(wire15) : reg19[(2'h3):(2'h2)]) : reg10));
            end
          else
            begin
              reg29 <= ((-(+$unsigned((~reg30)))) >> ($unsigned(($unsigned(reg26) ?
                  ((8'hb3) ^ reg23) : $unsigned((8'ha0)))) >>> (reg23 * (-reg17))));
              reg30 <= wire8[(1'h0):(1'h0)];
              reg31 <= reg24;
            end
          reg32 <= $signed(reg25[(2'h3):(2'h3)]);
          reg33 <= ({(reg27 ?
                      $signed($signed(reg14)) : $signed($signed(reg26))),
                  (wire7 ? (8'hbb) : {{reg10}, (~&wire15)})} ?
              $unsigned($unsigned($unsigned(reg29[(4'hb):(2'h2)]))) : ((reg20[(3'h4):(3'h4)] ?
                      ($unsigned(reg31) ?
                          $unsigned(reg11) : ((8'hb2) ^~ reg17)) : ((~reg16) & ((7'h44) - reg29))) ?
                  $unsigned($signed($signed((8'ha0)))) : {((reg17 ?
                          (8'hab) : reg18) ~^ $signed(reg10))}));
        end
      else
        begin
          if (reg16)
            begin
              reg29 <= (^~(^$signed(($unsigned(reg22) ?
                  reg22[(2'h2):(2'h2)] : ((8'hb8) - reg28)))));
              reg30 <= reg28;
              reg31 <= {reg27[(4'hc):(3'h4)]};
            end
          else
            begin
              reg29 <= $signed((reg12[(3'h5):(1'h1)] ?
                  (reg21[(4'h8):(1'h1)] ?
                      (reg14[(3'h5):(3'h5)] & $signed(reg22)) : ((reg26 < (8'ha4)) > $signed((8'hb6)))) : $signed(({reg19} | $unsigned(reg10)))));
              reg30 <= (8'h9e);
              reg31 <= $unsigned((~(((~|reg12) ?
                      (reg17 ? reg26 : wire7) : (wire7 >> (8'hb3))) ?
                  ((reg18 ? reg33 : wire6) ?
                      ((8'hab) ? (8'hba) : wire9) : (&reg17)) : reg22)));
              reg32 <= ($signed((reg24[(3'h4):(2'h2)] ?
                  $signed($unsigned(wire8)) : $unsigned(reg31[(3'h4):(3'h4)]))) > ((~|$signed((!reg11))) ^~ $unsigned($signed((+reg32)))));
              reg33 <= (~(8'ha0));
            end
          reg34 <= $signed(reg14[(5'h10):(1'h1)]);
          reg35 <= reg18[(4'h9):(3'h6)];
          reg36 <= reg22;
          reg37 <= ({((~&(reg14 ? reg27 : (7'h44))) ?
                      (~^(~wire15)) : ($unsigned((8'ha5)) ?
                          (reg12 > reg24) : $unsigned(reg14))),
                  (^($unsigned(reg32) ?
                      $unsigned(reg36) : ((8'ha4) ? reg31 : (8'h9e))))} ?
              reg27[(1'h1):(1'h1)] : (^~((reg30 ^ wire9) ?
                  $unsigned(reg29[(4'hb):(3'h7)]) : (^~$unsigned(reg14)))));
        end
      if (reg24[(2'h3):(1'h1)])
        begin
          if ((reg18 ?
              (((~&{reg33, (8'h9f)}) ?
                  (reg16 ?
                      $signed(reg10) : reg11[(1'h0):(1'h0)]) : {(wire8 | reg18)}) ~^ {(+(reg12 + reg10)),
                  (8'h9c)}) : reg10[(3'h6):(1'h1)]))
            begin
              reg38 <= (&$unsigned($signed(((~reg30) ? reg34 : (~^reg22)))));
              reg39 <= (-($signed(((reg10 ? reg11 : wire7) ?
                      (reg29 <<< reg12) : wire7)) ?
                  (reg20 >>> reg28[(4'h9):(1'h0)]) : reg21));
              reg40 <= {(((reg25[(3'h4):(1'h0)] || (-(8'ha7))) ?
                      (8'ha5) : (+{reg38})) << {$signed(reg17[(4'ha):(4'h8)]),
                      $unsigned((wire8 >= reg36))}),
                  (reg31[(1'h0):(1'h0)] ?
                      wire15 : ((8'ha8) ?
                          wire6 : ($signed((8'ha6)) << (reg19 > reg11))))};
              reg41 <= reg10[(3'h4):(2'h2)];
              reg42 <= ((((+reg25[(1'h1):(1'h0)]) >> ($unsigned((8'h9f)) > reg36[(4'ha):(3'h5)])) >= {($unsigned(reg17) << (reg17 >>> reg32))}) ?
                  {$signed(((|reg12) ?
                          {reg27, reg35} : (reg18 ?
                              wire9 : reg33)))} : $unsigned($signed(((reg32 ?
                      reg28 : reg20) <= wire6[(3'h7):(3'h6)]))));
            end
          else
            begin
              reg38 <= ($unsigned($signed($signed(((8'hab) ?
                  reg11 : reg37)))) >= $signed(reg29));
            end
          reg43 <= (~&reg10);
          reg44 <= reg36;
          reg45 <= $signed($unsigned(reg37[(1'h0):(1'h0)]));
          reg46 <= reg39;
        end
      else
        begin
          reg38 <= $signed(reg26);
          reg39 <= ($signed($unsigned($unsigned($unsigned((8'hb1))))) ?
              (reg36[(4'hd):(2'h2)] << wire6) : reg25[(1'h0):(1'h0)]);
          reg40 <= (^$signed(reg35));
        end
      reg47 <= (~reg46[(3'h6):(3'h5)]);
      reg48 <= $unsigned(reg25);
    end
  module49 #() modinst80 (wire79, clk, wire8, reg35, reg31, wire9);
  assign wire81 = {(-$unsigned(((wire6 ? reg43 : reg36) ?
                          reg43[(3'h6):(1'h1)] : reg45[(3'h5):(3'h4)])))};
endmodule

module module49
#(parameter param77 = (^((|(8'ha7)) >= ((((8'hae) ? (7'h42) : (8'hbc)) ^ ((8'ha7) | (8'hab))) - (((8'hb0) ~^ (8'hb2)) ? ((8'ha8) - (8'haf)) : (!(7'h42)))))), 
parameter param78 = param77)
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire53;
  input wire signed [(3'h4):(1'h0)] wire52;
  input wire [(5'h13):(1'h0)] wire51;
  input wire [(4'h8):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  assign y = {wire69,
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
                 wire56,
                 wire55,
                 wire54,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire54 = (wire53[(4'hc):(2'h3)] ?
                      ($signed($unsigned(((8'ha9) + wire52))) <<< (((!wire53) ?
                              (|(8'hab)) : {wire51}) ?
                          (~|$unsigned(wire52)) : ($unsigned(wire50) ?
                              $unsigned(wire53) : (wire53 || wire53)))) : {wire51[(1'h0):(1'h0)]});
  assign wire55 = wire53;
  assign wire56 = wire54;
  assign wire57 = wire52[(3'h4):(1'h0)];
  assign wire58 = $unsigned(wire56[(3'h6):(3'h5)]);
  assign wire59 = $unsigned((wire58 | wire53));
  assign wire60 = (|(-wire55));
  assign wire61 = $unsigned($signed({wire56,
                      ((^~(8'hbc)) ? $unsigned(wire58) : $unsigned(wire59))}));
  assign wire62 = ($signed({wire61}) ?
                      (~(+$unsigned($unsigned(wire50)))) : ({({wire52, wire57} ?
                              (wire50 + wire57) : wire57[(1'h0):(1'h0)])} ^~ $unsigned(($unsigned(wire51) != wire52))));
  assign wire63 = ($unsigned(wire57[(1'h0):(1'h0)]) ?
                      wire58[(5'h14):(5'h14)] : ($signed((^~(wire52 - (8'hb4)))) >= (^($signed(wire53) ?
                          wire62 : wire61))));
  assign wire64 = $unsigned(wire56[(3'h5):(3'h5)]);
  assign wire65 = wire50;
  assign wire66 = $signed((^~wire61));
  assign wire67 = wire60;
  assign wire68 = (|(8'ha3));
  assign wire69 = (~|(((8'hb6) ?
                      ((wire60 ? wire63 : wire65) >> {wire58}) : ((~&wire51) ?
                          $unsigned(wire67) : (wire62 >> (8'ha7)))) + (^wire54[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg70 <= ((7'h43) ? (-wire66) : wire61);
      if (($signed(($unsigned((wire65 ? wire63 : (8'had))) && {(wire58 ?
                  wire55 : wire51),
              (wire54 ? wire50 : wire60)})) ?
          $unsigned(wire60[(2'h2):(1'h0)]) : {(($signed(wire68) ?
                      {wire52} : {wire60, (8'hbc)}) ?
                  ($signed(wire69) + $signed(wire63)) : $unsigned((wire57 < wire50))),
              wire58[(2'h2):(2'h2)]}))
        begin
          if (wire58)
            begin
              reg71 <= ($signed(({(wire65 == wire58)} ?
                  ((wire51 | (7'h41)) ?
                      (wire62 && wire57) : $signed(wire62)) : wire54[(2'h3):(1'h0)])) + wire50[(3'h6):(1'h0)]);
              reg72 <= {(^$signed($signed(wire62[(2'h2):(2'h2)])))};
              reg73 <= $signed({({$signed(wire65),
                      (8'hab)} | (wire69[(1'h0):(1'h0)] < wire63))});
              reg74 <= $unsigned($unsigned((~$unsigned($unsigned(wire55)))));
              reg75 <= {wire52[(1'h0):(1'h0)]};
            end
          else
            begin
              reg71 <= $signed({{((~^wire50) > {wire57}),
                      $unsigned({wire62})}});
              reg72 <= (!$unsigned((wire53[(2'h2):(2'h2)] != (+(~^wire57)))));
            end
          reg76 <= wire69;
        end
      else
        begin
          if (($unsigned($unsigned(({(8'hba), wire57} + (~wire61)))) ?
              (wire68[(4'h8):(1'h0)] ?
                  $signed(($signed(wire52) < $signed(reg73))) : $signed(wire53)) : (wire51[(1'h0):(1'h0)] ?
                  $unsigned($unsigned((~&wire68))) : ($unsigned($signed(wire50)) <= $unsigned((reg70 ?
                      (8'hac) : wire53))))))
            begin
              reg71 <= $unsigned((($signed(wire56[(4'h8):(3'h4)]) >> wire60) ^ ((~|$unsigned((8'hba))) > (~&{wire59,
                  wire65}))));
            end
          else
            begin
              reg71 <= ((^(reg70 - ((-wire65) <<< {wire65, wire60}))) ?
                  (reg71[(3'h4):(2'h3)] ?
                      ((7'h42) != $unsigned(wire57)) : $signed($signed(wire57))) : reg74[(3'h4):(1'h1)]);
              reg72 <= (wire61[(4'h8):(3'h4)] ?
                  (reg72 ?
                      $signed(((^(8'h9c)) <= (^wire50))) : $signed(wire65[(4'ha):(2'h3)])) : wire50);
            end
          reg73 <= $unsigned(((+(~&{(8'hb5), wire56})) ?
              $signed(((wire62 ? wire53 : wire56) ?
                  wire50 : wire51)) : (^wire53[(1'h1):(1'h1)])));
          reg74 <= $unsigned($unsigned($unsigned(reg70)));
        end
    end
endmodule
