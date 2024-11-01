module top
#(parameter param55 = (~^(~|(~{((7'h42) && (8'ha2)), ((8'ha7) < (8'hbd))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire54,
                 wire38,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire7,
                 wire6,
                 wire5,
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
                 reg41,
                 reg40,
                 reg39,
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
                 reg16,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (wire3[(2'h2):(1'h0)] ?
                     {(({wire4} ? (~&wire4) : {(8'ha0), wire2}) <= {{wire0,
                                 wire4},
                             $signed((8'haa))})} : ($unsigned({((8'hb2) ?
                             wire4 : wire1),
                         $signed(wire4)}) != (~^(wire0[(4'hb):(2'h2)] >> wire2))));
  assign wire6 = (wire3[(4'ha):(3'h4)] ?
                     $unsigned($unsigned((wire4 ?
                         (+(8'ha0)) : (wire1 ? wire5 : wire3)))) : (^~wire3));
  assign wire7 = wire2;
  always
    @(posedge clk) begin
      if (wire5)
        begin
          reg8 <= (-$signed({wire6}));
          reg9 <= ((!($signed(reg8) ?
                  wire5[(2'h3):(2'h2)] : $signed(((8'ha8) ? wire2 : wire0)))) ?
              {$signed((wire2[(3'h6):(3'h5)] >>> wire6)),
                  wire2[(2'h2):(2'h2)]} : wire1[(4'h9):(2'h3)]);
          reg10 <= (+($signed($signed((wire5 ?
              reg8 : reg9))) * $unsigned(wire2)));
        end
      else
        begin
          reg8 <= ($signed($unsigned(reg9)) ?
              (wire6 + ($signed(wire0) ?
                  $signed((~&wire4)) : ($unsigned(wire3) || (wire5 > wire6)))) : wire5);
          reg9 <= wire1[(2'h2):(1'h0)];
          if (wire6)
            begin
              reg10 <= ($signed((~&$unsigned((|reg8)))) ?
                  {$unsigned((8'hae))} : ($signed($signed($signed(wire7))) ^~ (~|$unsigned((~reg9)))));
            end
          else
            begin
              reg10 <= wire4[(1'h1):(1'h1)];
              reg11 <= $unsigned(($signed($signed($signed((8'hb5)))) ^ (~&wire6)));
              reg12 <= $signed($unsigned({{$signed(reg8), wire7}}));
            end
        end
      reg13 <= {({(&(reg11 ? wire6 : reg12))} ?
              ($signed($unsigned(reg11)) >> (|wire6[(1'h0):(1'h0)])) : (wire0[(3'h6):(3'h6)] > (~|(wire4 * wire7)))),
          $unsigned((~((^~reg12) && $unsigned(wire6))))};
      reg14 <= reg13[(4'ha):(1'h0)];
    end
  assign wire15 = {reg8};
  always
    @(posedge clk) begin
      reg16 <= ((-(($signed(reg9) ? (wire4 + wire0) : (wire0 << wire6)) ?
          ($signed(wire1) ?
              (~&reg11) : (wire15 ?
                  reg10 : wire4)) : (!$unsigned(wire5)))) << ($unsigned($signed(reg11[(1'h0):(1'h0)])) << ($unsigned(((8'ha0) | (8'h9c))) ?
          (wire2 <<< $unsigned(reg12)) : (wire3[(4'h9):(1'h1)] ?
              {wire4, wire7} : (^~wire15)))));
    end
  assign wire17 = wire7;
  assign wire18 = $unsigned(($unsigned($unsigned((8'hae))) <<< reg8));
  assign wire19 = wire6;
  assign wire20 = reg8;
  assign wire21 = wire15;
  assign wire22 = ({reg10[(1'h1):(1'h0)]} ?
                      $unsigned((wire3[(4'ha):(3'h5)] ?
                          ((|reg9) | (~^reg12)) : {(reg12 == wire7),
                              reg9[(3'h5):(3'h5)]})) : reg9[(4'h8):(4'h8)]);
  assign wire23 = reg9[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg24 <= (|$unsigned(($signed((|wire4)) ?
          (~&(~&wire7)) : ($unsigned(wire4) ? {wire0} : (^~reg14)))));
      reg25 <= $unsigned((-(-((~wire17) * reg9[(2'h2):(2'h2)]))));
      reg26 <= $unsigned($signed(reg12[(2'h2):(1'h0)]));
      if ($unsigned(($signed($unsigned((&wire17))) || (~|{wire0,
          wire17[(1'h0):(1'h0)]}))))
        begin
          reg27 <= wire7;
          reg28 <= reg25;
          if ({wire3})
            begin
              reg29 <= ({reg13} ?
                  {wire1, (8'hb1)} : (-$signed($unsigned(((7'h43) ?
                      reg10 : (8'hb6))))));
              reg30 <= $unsigned($signed(wire2[(3'h7):(3'h4)]));
              reg31 <= $unsigned((~$unsigned($unsigned((wire23 ?
                  wire21 : wire4)))));
              reg32 <= reg13;
            end
          else
            begin
              reg29 <= ((wire22 == reg12[(3'h5):(3'h4)]) != ({wire21,
                  {(wire19 ? reg10 : wire19),
                      reg12}} >= {$signed($signed(reg27)),
                  wire17[(1'h1):(1'h0)]}));
              reg30 <= ($unsigned($signed($unsigned((7'h42)))) ?
                  $unsigned((&(^(^~(8'hab))))) : $signed((~^(~(8'ha4)))));
            end
        end
      else
        begin
          reg27 <= reg25[(4'hc):(4'h8)];
          reg28 <= $signed((($unsigned((&wire15)) != reg11) ?
              ($signed((wire23 + wire7)) <= ((reg28 ^~ wire20) ?
                  (&wire3) : wire21)) : $unsigned(reg13[(2'h2):(2'h2)])));
          reg29 <= (+$unsigned(reg26));
          if (((wire23 ?
              (&{wire1, reg29}) : {((reg13 ? reg24 : wire6) <= (reg27 ?
                      (8'had) : reg25))}) < {(~&(+{reg29, reg24})), reg8}))
            begin
              reg30 <= (^(^(+wire7[(3'h6):(3'h4)])));
              reg31 <= ((7'h42) ~^ reg9);
              reg32 <= (~(wire19 || $unsigned($unsigned((wire19 ?
                  wire6 : reg16)))));
            end
          else
            begin
              reg30 <= wire2;
            end
          if (wire5[(1'h1):(1'h1)])
            begin
              reg33 <= reg30[(3'h6):(3'h5)];
            end
          else
            begin
              reg33 <= reg24[(1'h0):(1'h0)];
              reg34 <= $signed($unsigned($unsigned(($unsigned(reg11) ^~ (reg12 << (8'hbe))))));
              reg35 <= (reg34[(1'h0):(1'h0)] * (!reg13[(3'h7):(3'h7)]));
              reg36 <= wire18[(2'h2):(2'h2)];
              reg37 <= wire6[(3'h7):(3'h7)];
            end
        end
    end
  assign wire38 = $unsigned((reg14 << $signed($unsigned((wire1 ?
                      reg27 : wire21)))));
  always
    @(posedge clk) begin
      reg39 <= (+$unsigned($unsigned({(-reg31), ((8'ha2) <<< (8'hb0))})));
      reg40 <= reg9;
      if ({{((wire3 ? (~&reg34) : ((8'hba) >>> reg39)) ?
                  ((8'hb5) ?
                      (wire18 < reg16) : (wire3 | wire3)) : $unsigned((reg9 > reg24))),
              (wire0 >= ((!wire17) <<< $signed(reg35)))},
          reg11})
        begin
          reg41 <= ($unsigned($signed(((8'ha6) ? (~|wire1) : (&reg14)))) ?
              {wire3[(3'h7):(1'h1)],
                  $signed($signed($unsigned(reg40)))} : ($unsigned($signed($signed(reg25))) ?
                  wire38 : ({$unsigned(wire3)} ?
                      $signed((7'h41)) : $unsigned((&reg27)))));
          if ($unsigned(wire15))
            begin
              reg42 <= $signed((~^wire7[(2'h3):(1'h0)]));
            end
          else
            begin
              reg42 <= (&$signed($signed(((!wire18) ?
                  (wire23 >>> reg29) : $unsigned(wire3)))));
              reg43 <= wire23;
              reg44 <= reg33[(4'h9):(1'h1)];
            end
        end
      else
        begin
          if ($unsigned(reg31[(4'h9):(3'h7)]))
            begin
              reg41 <= $unsigned((reg40 ?
                  reg43[(4'h9):(3'h7)] : $unsigned(wire23[(3'h4):(1'h1)])));
              reg42 <= ($signed({$unsigned(reg35[(1'h1):(1'h1)])}) ^~ reg33[(4'hc):(4'ha)]);
              reg43 <= $signed(reg8[(2'h2):(2'h2)]);
            end
          else
            begin
              reg41 <= $signed(((!((~&(8'hb9)) ?
                  (reg24 >>> wire21) : reg24)) ^~ ($signed((8'h9e)) ?
                  (^~(8'ha7)) : (+(reg25 ? reg26 : reg29)))));
              reg42 <= reg11[(3'h6):(3'h6)];
              reg43 <= reg41[(3'h5):(1'h0)];
              reg44 <= $signed((({(~^reg30)} * {$unsigned((8'hb1))}) > $unsigned(wire4[(1'h1):(1'h1)])));
            end
          reg45 <= $signed(wire5);
          reg46 <= {wire1, $signed((~^wire4[(5'h10):(4'h8)]))};
          reg47 <= reg14;
          if (($signed((^~reg29[(4'h8):(4'h8)])) ?
              reg10[(1'h1):(1'h1)] : $signed((reg34 ?
                  (~&{(8'hb8)}) : ((^~reg47) << (wire6 ? reg43 : wire5))))))
            begin
              reg48 <= {((7'h44) ?
                      $unsigned($unsigned($signed(reg41))) : reg40)};
              reg49 <= reg11[(3'h6):(1'h1)];
              reg50 <= $signed((($signed($unsigned(wire38)) ?
                  {(reg31 ? wire7 : reg28),
                      (wire23 ?
                          reg24 : (7'h43))} : $signed($signed(wire19))) == reg46[(3'h4):(1'h0)]));
              reg51 <= (^wire19[(2'h2):(2'h2)]);
            end
          else
            begin
              reg48 <= wire19;
              reg49 <= ($signed($unsigned(reg50[(2'h3):(1'h0)])) ?
                  reg34 : $signed((wire2[(3'h6):(3'h4)] ?
                      $unsigned((reg37 && reg8)) : {reg25})));
              reg50 <= (reg49 ?
                  $unsigned((((reg30 ? wire22 : reg49) ? wire3 : {wire19}) ?
                      reg12[(4'h8):(1'h1)] : reg31[(3'h7):(2'h3)])) : reg31);
              reg51 <= (~(^~reg40));
            end
        end
      reg52 <= reg28;
      reg53 <= reg30[(3'h6):(3'h4)];
    end
  assign wire54 = ($unsigned($unsigned($signed((wire22 | wire19)))) ?
                      reg36 : $signed((($unsigned(reg9) - reg49) ?
                          reg36 : reg30)));
endmodule
