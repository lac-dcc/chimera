module top
#(parameter param85 = {{(~|{{(8'hb0), (8'haa)}, (~&(8'hb3))})}, (((((7'h41) <= (7'h41)) ? (~^(8'hb6)) : {(8'haa)}) ? (((8'hb9) ? (7'h41) : (8'ha6)) > {(8'hb5)}) : (((8'haa) > (7'h42)) ? {(8'hac), (8'ha4)} : (|(8'ha2)))) ? {(8'hac)} : ((((8'ha4) <= (7'h40)) ? ((8'hb6) + (8'hb4)) : {(8'ha4), (8'ha6)}) ? (((8'ha1) & (8'hb8)) ? {(8'hba), (7'h44)} : ((8'hb8) ? (8'h9d) : (8'hba))) : (((8'ha7) < (7'h40)) ? ((7'h43) >= (8'hba)) : ((8'hba) ~^ (8'hbd)))))}, 
parameter param86 = param85)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire69;
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire69,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  module5 #() modinst70 (wire69, clk, wire2, wire3, wire0, wire1);
  assign wire71 = $signed(((($unsigned(wire0) <= {(8'ha9)}) >>> (~|$signed(wire3))) ?
                      (wire0[(5'h12):(5'h12)] ?
                          ((wire2 >>> wire4) ?
                              $signed(wire0) : (~wire2)) : {(wire0 ~^ wire0),
                              (wire3 == wire0)}) : wire0));
  assign wire72 = ({$unsigned((8'hb4)),
                      $unsigned((-wire3))} | (wire0[(4'ha):(4'h9)] < $signed(wire71[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire71[(1'h0):(1'h0)])
        begin
          reg73 <= ($unsigned(wire69) ^ $unsigned(wire72[(3'h7):(3'h6)]));
        end
      else
        begin
          reg73 <= $unsigned((!$signed((-$unsigned(wire3)))));
        end
      reg74 <= (|(wire1 ?
          {(~|$unsigned(wire1)), wire69[(3'h5):(2'h3)]} : ((-{wire71, wire1}) ?
              {wire72[(3'h4):(3'h4)]} : wire4)));
      reg75 <= ((^{(((7'h44) <= reg73) ? wire72 : wire3)}) ?
          (wire0 & ((reg73[(3'h5):(2'h3)] - (&(7'h44))) || (&$unsigned(wire71)))) : (wire3 ?
              $signed({(&reg74)}) : reg73));
      if ((((~^wire72) ?
          wire72[(1'h0):(1'h0)] : $unsigned(wire2[(4'hb):(3'h7)])) <= wire4))
        begin
          reg76 <= $unsigned((^~{{$signed(reg73)}, (~^wire3)}));
          reg77 <= wire72[(3'h5):(3'h4)];
          if (({(&{{reg75, wire69}})} > ($signed(((wire69 ^~ wire3) ?
              (8'hb0) : wire4)) & (((|wire3) ? $unsigned(wire4) : (&reg75)) ?
              ((+(8'h9d)) ~^ $unsigned(wire4)) : (^wire71[(1'h0):(1'h0)])))))
            begin
              reg78 <= (|(-(reg73 ? $unsigned(wire0) : reg75)));
              reg79 <= wire2;
            end
          else
            begin
              reg78 <= {({{reg78[(3'h4):(3'h4)],
                          (!(8'h9f))}} <= $unsigned(wire4)),
                  ({$signed({wire4,
                          reg78})} ~^ (wire2[(3'h4):(1'h0)] * ($signed(reg74) ?
                      (wire0 <= reg73) : $unsigned(wire71))))};
              reg79 <= ((~|$signed((!(wire3 ?
                  wire69 : wire2)))) ~^ ((reg73 | wire0[(4'h9):(4'h9)]) != ($signed({wire72}) <<< $unsigned(((7'h40) ?
                  reg73 : (8'haf))))));
              reg80 <= $unsigned($signed(reg77[(4'hb):(4'ha)]));
            end
          if ((($unsigned(((reg76 << reg78) ?
              $signed((8'hba)) : reg77[(3'h5):(1'h1)])) > $signed($signed($unsigned(wire72)))) - wire4[(4'hb):(2'h2)]))
            begin
              reg81 <= $unsigned($unsigned((reg76 >> {$signed(reg76), reg78})));
              reg82 <= $signed(wire69);
            end
          else
            begin
              reg81 <= ({reg78[(3'h7):(1'h0)]} & wire4);
              reg82 <= $unsigned(($signed($signed($unsigned(wire2))) ^~ reg82[(4'h8):(3'h6)]));
              reg83 <= ($unsigned(wire69[(3'h6):(2'h2)]) ^~ $unsigned((wire69 ?
                  reg81[(1'h1):(1'h1)] : (wire3[(3'h4):(1'h0)] ?
                      reg82 : $unsigned(reg73)))));
              reg84 <= ((8'hac) ?
                  $signed(($unsigned({(8'h9d), reg75}) <= ((wire2 == reg75) ?
                      $signed(reg79) : $signed(reg83)))) : (reg79 - wire3));
            end
        end
      else
        begin
          reg76 <= $signed(reg76);
          reg77 <= ((|(((wire1 | wire72) && wire72) || (reg82 ?
              (reg80 ?
                  reg78 : wire2) : (wire4 < wire3)))) ~^ (({$signed(wire69)} <<< ((reg80 == (8'hb2)) ?
                  {reg84} : $signed(wire0))) ?
              ((8'hb9) ?
                  $signed({reg73,
                      wire2}) : $signed($unsigned(reg77))) : (~^reg76[(2'h2):(1'h0)])));
        end
    end
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire6;
  input wire [(4'hb):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire44;
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire9))
        begin
          reg10 <= (((-(^~(wire7 ?
                  wire6 : (8'ha9)))) * ($unsigned((wire7 > wire7)) ?
                  wire8[(5'h12):(3'h7)] : $signed((wire7 ^~ wire6)))) ?
              (~^(^wire8)) : $signed(wire8));
          reg11 <= (8'ha2);
          reg12 <= (^~$signed((wire9 == $signed((&wire9)))));
        end
      else
        begin
          reg10 <= $unsigned((-($unsigned({wire7}) >> $signed($signed(reg12)))));
          if ($unsigned(wire8))
            begin
              reg11 <= $unsigned(reg10[(3'h4):(3'h4)]);
              reg12 <= reg12;
              reg13 <= $unsigned(reg10[(4'hd):(3'h5)]);
              reg14 <= reg13[(3'h4):(3'h4)];
            end
          else
            begin
              reg11 <= reg10;
              reg12 <= $unsigned((~^wire7[(4'hb):(3'h7)]));
              reg13 <= ($signed(($unsigned((8'hba)) >> $unsigned((^~wire9)))) ?
                  $signed($unsigned($signed((reg10 & reg11)))) : (&reg10));
              reg14 <= {$signed($unsigned($unsigned((^wire6))))};
            end
          reg15 <= (~^$signed($signed({{(8'hb0)}, reg11})));
          reg16 <= $signed(wire9[(4'ha):(3'h6)]);
        end
      reg17 <= $unsigned(((reg12[(4'h9):(3'h7)] ?
              (8'hac) : $unsigned(reg12[(5'h10):(4'hd)])) ?
          ((^reg11[(1'h1):(1'h1)]) ~^ reg16) : $signed($signed(wire7[(2'h2):(1'h0)]))));
      reg18 <= wire6[(3'h4):(2'h3)];
      reg19 <= reg10[(1'h1):(1'h1)];
    end
  module20 #() modinst45 (.clk(clk), .y(wire44), .wire22(wire8), .wire24(reg16), .wire21(reg10), .wire23(reg12));
  assign wire46 = (wire8 ?
                      ($unsigned($signed($unsigned((7'h43)))) < ($signed(wire7) ?
                          $unsigned((wire8 << wire7)) : {wire44,
                              (!wire9)})) : reg15[(1'h1):(1'h1)]);
  assign wire47 = {(reg14[(3'h7):(3'h5)] ?
                          (($unsigned(reg15) <= {reg16}) <= reg15) : {wire8[(4'hb):(3'h7)]})};
  assign wire48 = (((-(~&reg10)) > wire44[(2'h2):(1'h1)]) ?
                      $unsigned(reg18[(5'h11):(3'h4)]) : reg14[(4'ha):(4'ha)]);
  assign wire49 = (((!reg16[(3'h5):(2'h2)]) ?
                      $unsigned(($unsigned(reg14) - $signed(reg18))) : $unsigned($signed(reg17))) <= (^(wire48 ^ wire48)));
  assign wire50 = reg12[(3'h6):(1'h0)];
  assign wire51 = (($signed((~^(wire7 <= reg18))) * $unsigned(reg12[(4'ha):(3'h4)])) ?
                      $signed((^$unsigned((&wire8)))) : $signed($signed(wire47)));
  assign wire52 = wire9;
  assign wire53 = (((!$signed($unsigned(wire49))) ^ reg17[(2'h2):(1'h1)]) ?
                      $unsigned(wire7[(4'ha):(4'ha)]) : wire8);
  assign wire54 = wire52;
  assign wire55 = wire8;
  assign wire56 = $unsigned((8'ha9));
  assign wire57 = wire7[(4'h8):(3'h5)];
  assign wire58 = wire53;
  assign wire59 = reg11[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg60 <= reg14;
      reg61 <= $signed($signed(wire44));
      reg62 <= wire56;
      if ($signed(reg61[(4'ha):(1'h1)]))
        begin
          reg63 <= ((((8'ha4) + reg61) ?
                  (wire9[(4'ha):(3'h6)] >= reg17) : wire56) ?
              wire8 : wire49[(4'hc):(3'h7)]);
          reg64 <= ({$unsigned($unsigned($signed(wire7))),
                  (|(wire46[(4'hd):(1'h0)] << (wire56 >>> reg15)))} ?
              (~|{(reg19 >= $unsigned(wire52))}) : $unsigned({$unsigned((wire57 <= reg11)),
                  reg19[(2'h2):(2'h2)]}));
        end
      else
        begin
          if (wire56)
            begin
              reg63 <= (($signed($signed(reg61[(2'h3):(2'h3)])) ~^ (^(8'hac))) ?
                  $signed(wire57) : wire48[(2'h3):(2'h2)]);
              reg64 <= (!$unsigned($unsigned({(reg16 ? reg13 : wire8)})));
              reg65 <= ((((8'ha8) ^~ ({reg64} ?
                      ((8'haa) << wire58) : $signed(wire44))) ?
                  (|(wire6 ? reg64 : reg61)) : (wire44 ?
                      ((wire53 ? wire44 : reg17) ?
                          $signed((8'hbf)) : (reg60 ^~ reg12)) : (8'ha2))) ^~ $signed(wire6[(3'h4):(2'h2)]));
            end
          else
            begin
              reg63 <= ($signed($unsigned(reg14[(4'hb):(4'ha)])) <<< ((((wire49 ^ reg14) ?
                          (&wire54) : (!wire49)) ?
                      $unsigned({wire46}) : ((reg19 != wire46) << $unsigned(reg11))) ?
                  ((reg19[(4'hf):(4'he)] ~^ wire6) == reg61[(3'h5):(1'h0)]) : (^~wire57[(2'h2):(1'h1)])));
            end
          reg66 <= $signed(reg11);
        end
    end
  assign wire67 = reg15;
  assign wire68 = {reg61};
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire26,
                 wire25,
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
                 (1'h0)};
  assign wire25 = ((&(((~(8'haa)) * ((8'hbc) ~^ wire24)) ?
                          ((wire23 ? wire22 : (8'hb8)) & (wire22 ?
                              wire21 : wire24)) : ((wire23 ? wire24 : wire22) ?
                              wire22 : (wire21 ? (7'h41) : wire21)))) ?
                      (!wire21[(1'h0):(1'h0)]) : {$unsigned(wire23[(3'h4):(1'h0)]),
                          $signed($signed((wire24 >> (8'hbe))))});
  assign wire26 = wire23;
  always
    @(posedge clk) begin
      if (wire26)
        begin
          if ($unsigned($unsigned($unsigned($unsigned(wire26[(3'h4):(2'h2)])))))
            begin
              reg27 <= ((~^($unsigned($unsigned(wire21)) == $unsigned(wire21))) ?
                  ({(^~(wire24 ? (8'ha6) : (8'hb8))),
                      $signed((^~wire26))} ^~ ({$signed(wire25)} ~^ $signed($signed(wire23)))) : $unsigned(((|$unsigned(wire23)) ^~ ((wire23 ?
                      (8'ha7) : (8'ha8)) >> (8'ha3)))));
            end
          else
            begin
              reg27 <= (~(~^{$signed({wire22, wire26}),
                  (~^(wire24 || (7'h44)))}));
              reg28 <= {(!reg27), $signed((!reg27[(1'h1):(1'h0)]))};
              reg29 <= $unsigned(((wire26[(2'h2):(2'h2)] >> wire22[(5'h10):(1'h0)]) ?
                  {($unsigned(wire25) ?
                          {(8'hb8)} : wire22[(2'h3):(1'h1)])} : wire21[(4'hd):(4'h9)]));
            end
          reg30 <= (($unsigned(reg29) >>> (wire26 ?
              reg27 : (8'ha0))) & $unsigned(wire25));
          if (((~^$unsigned($signed(wire24))) ?
              $signed(($unsigned((wire21 ?
                  (8'hbc) : wire21)) == $signed($signed(wire24)))) : ({wire21[(1'h1):(1'h1)]} ?
                  wire26[(1'h1):(1'h1)] : (~(8'ha0)))))
            begin
              reg31 <= $unsigned(wire21);
            end
          else
            begin
              reg31 <= $signed($signed((8'hbe)));
              reg32 <= (^~$unsigned((&$signed((reg28 ? reg31 : wire26)))));
              reg33 <= reg28[(3'h5):(3'h5)];
              reg34 <= (((|(~|(8'h9d))) >>> ($unsigned($unsigned(reg27)) ^~ $unsigned($unsigned(wire22)))) << (+reg28[(4'hf):(3'h7)]));
            end
          reg35 <= ((reg31[(1'h0):(1'h0)] + (8'ha5)) && $signed((&(^~(-reg28)))));
          reg36 <= wire24;
        end
      else
        begin
          if ((+reg33))
            begin
              reg27 <= $unsigned((&$signed($unsigned($signed(wire22)))));
              reg28 <= wire22[(1'h0):(1'h0)];
              reg29 <= reg27[(3'h6):(3'h6)];
              reg30 <= ($signed((+($signed(wire23) ?
                  $unsigned(wire22) : (&reg27)))) ^ $unsigned($unsigned($signed((wire23 ?
                  wire23 : (8'hb0))))));
              reg31 <= $unsigned({$unsigned(reg33), wire21});
            end
          else
            begin
              reg27 <= (reg28 ? wire26 : wire26);
              reg28 <= {(reg31[(4'ha):(3'h6)] ?
                      (($signed(wire22) ?
                          (reg34 ?
                              wire22 : reg35) : (wire23 | (8'h9d))) == {(wire22 || reg32)}) : $signed((&$signed(reg36)))),
                  $unsigned((!$unsigned($unsigned(reg36))))};
              reg29 <= $unsigned($unsigned(($unsigned((wire21 * (8'h9c))) ?
                  ({reg34,
                      reg31} | $unsigned(reg31)) : ($unsigned((8'hb8)) || reg29[(3'h5):(1'h0)]))));
              reg30 <= (~|((!$unsigned($unsigned((8'haf)))) ?
                  ($signed((reg35 ? wire22 : reg27)) ?
                      $unsigned((~reg31)) : (+(^reg27))) : (8'hb7)));
            end
          reg32 <= {(7'h43)};
          reg33 <= wire23[(4'hb):(2'h3)];
          reg34 <= $signed((({$unsigned(reg35), (wire22 || reg30)} ?
                  (7'h41) : (!(reg30 ^ reg31))) ?
              (8'hba) : wire21[(4'h9):(1'h1)]));
        end
      reg37 <= reg31;
      reg38 <= reg29;
    end
  assign wire39 = $unsigned({reg38});
  assign wire40 = $signed((|wire26));
  assign wire41 = ((^~(^(^~(wire39 >>> reg28)))) ?
                      wire24[(2'h2):(1'h1)] : {((((7'h42) ?
                              wire23 : reg28) << (wire23 ?
                              wire21 : wire26)) >= ({reg27,
                              reg32} >> $signed(reg37)))});
  assign wire42 = {reg27,
                      ($signed($signed((reg31 ?
                          reg31 : wire22))) & reg36[(4'h9):(1'h0)])};
  assign wire43 = $unsigned($signed({$signed($unsigned(reg30))}));
endmodule
