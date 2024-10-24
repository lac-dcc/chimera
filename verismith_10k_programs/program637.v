module top
#(parameter param45 = ((^~(|(((8'hb4) == (8'hbd)) < (~|(8'hab))))) - ((!(((8'hbf) != (8'hb5)) >> (!(8'h9d)))) ? (((8'hb6) ? ((8'ha6) << (8'hb3)) : ((8'ha0) ^~ (8'hb7))) ? (((8'ha9) ? (8'hbf) : (8'haa)) ? ((8'hbe) ? (7'h44) : (8'h9f)) : (&(8'ha1))) : ((&(8'hb6)) << ((8'h9d) ^~ (7'h41)))) : {(((8'hbc) ^~ (8'ha4)) ? ((8'hbb) ? (7'h41) : (8'ha3)) : ((8'h9e) ? (8'had) : (8'ha1)))})), 
parameter param46 = (~(~^((&((8'ha5) ? param45 : param45)) ? (~(param45 ? param45 : param45)) : param45))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire22,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
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
                 reg7,
                 (1'h0)};
  assign wire5 = (({$unsigned((wire4 >>> (8'ha5)))} ?
                         ($unsigned($unsigned(wire3)) ?
                             (~&(-wire3)) : wire2) : (+((wire4 ?
                             wire1 : (8'ha2)) == (wire4 ? wire2 : wire3)))) ?
                     (~|(8'hba)) : $signed((&$signed(wire4))));
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= $unsigned(wire5);
    end
  assign wire8 = {(~&(~|({(8'hb5)} && (wire1 << wire5)))),
                     $signed((wire3[(4'hb):(3'h4)] ?
                         $unsigned(wire3[(1'h1):(1'h0)]) : $signed($unsigned(reg7))))};
  assign wire9 = ({(((!wire0) ~^ wire5) ^ wire0),
                     (~^wire6[(2'h3):(2'h3)])} >>> ((~^$signed((wire4 <= (8'hbe)))) ?
                     wire6[(2'h3):(1'h1)] : $signed((wire1 ^~ (~^wire8)))));
  always
    @(posedge clk) begin
      reg10 <= (|$unsigned(wire3));
      reg11 <= wire1[(1'h1):(1'h0)];
      reg12 <= wire1[(1'h0):(1'h0)];
      reg13 <= (wire9[(2'h2):(2'h2)] >= (+(!$signed(reg10))));
      if (($unsigned((^~(-{wire5, wire5}))) - reg13[(3'h7):(1'h0)]))
        begin
          reg14 <= ((((wire5 >= (~&wire8)) ?
                      $signed(wire2[(1'h0):(1'h0)]) : reg12) ?
                  ({$unsigned((8'hbf))} > wire5) : (&wire8[(5'h12):(4'hd)])) ?
              {$unsigned($signed($unsigned(reg10)))} : wire2[(4'ha):(3'h7)]);
        end
      else
        begin
          if (((wire8 ?
              ((reg14 ? $signed((8'ha8)) : wire2) ?
                  $unsigned(wire2) : ($signed(wire8) - (~^wire0))) : {(!wire6),
                  reg10}) | $signed((8'hb6))))
            begin
              reg14 <= $unsigned((&({$unsigned(reg14)} == (reg14[(2'h2):(1'h0)] > wire2[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg14 <= reg12;
              reg15 <= $signed(wire8[(3'h5):(3'h5)]);
              reg16 <= (~&wire6);
              reg17 <= wire5[(3'h4):(1'h1)];
            end
          reg18 <= ((((|(wire1 - wire3)) ?
                  (8'hb3) : (|wire8[(4'hf):(3'h4)])) ^ ((^~(-reg16)) ?
                  ((reg15 >= (8'h9e)) ?
                      $unsigned(reg16) : (8'h9f)) : (^(-wire3)))) ?
              {$signed(((~|wire0) ?
                      (wire2 ?
                          reg12 : (8'hab)) : (7'h41)))} : $signed(reg11[(4'hc):(1'h1)]));
          reg19 <= ((~&$unsigned({reg16})) ?
              ($signed($signed(reg11)) ?
                  $unsigned((wire8 ^ (reg17 & reg10))) : (((reg15 ?
                          reg12 : reg7) > reg16) ?
                      {{wire3}} : $signed((~&wire2)))) : ($signed(($signed(reg17) ?
                  ((8'ha5) << reg14) : (wire0 ?
                      reg13 : (8'hbc)))) >= $signed({(~&reg13),
                  {wire8, reg16}})));
          reg20 <= (reg19[(2'h3):(2'h3)] ? wire0 : {reg7[(3'h4):(1'h0)]});
          reg21 <= reg12[(3'h7):(3'h4)];
        end
    end
  assign wire22 = (wire2[(4'hf):(1'h1)] ?
                      $signed((wire6 <= {wire4})) : (($signed($signed(wire1)) + ($signed(wire2) <<< $signed(reg16))) ?
                          (8'hac) : $signed(wire4)));
  always
    @(posedge clk) begin
      reg23 <= $unsigned((&{$signed($unsigned(wire9)),
          $signed($signed((8'ha1)))}));
      if (((^{$unsigned((8'hb8))}) ?
          (8'ha2) : (wire4 >= (&($signed((8'ha3)) * wire22[(3'h4):(1'h1)])))))
        begin
          reg24 <= reg15[(1'h1):(1'h0)];
          reg25 <= ($unsigned($unsigned((&(8'hb9)))) << (+$signed(reg14)));
        end
      else
        begin
          reg24 <= wire22;
          reg25 <= (^~$signed({$unsigned((wire6 < reg14)),
              reg7[(2'h3):(2'h2)]}));
          if ((&($unsigned($unsigned(wire6[(4'ha):(2'h3)])) * $signed(((&reg15) ?
              $signed(reg17) : reg11)))))
            begin
              reg26 <= reg10[(4'ha):(4'h9)];
              reg27 <= $signed(((~^(|(reg25 ? reg25 : wire22))) ?
                  $signed($signed($signed(reg26))) : $signed($signed((reg20 ?
                      reg18 : reg26)))));
              reg28 <= $unsigned({wire3[(2'h3):(2'h3)]});
            end
          else
            begin
              reg26 <= $unsigned(($signed(wire9[(4'hd):(3'h6)]) + (^reg11)));
              reg27 <= $signed($signed(((((8'h9d) ? reg24 : reg27) ?
                  {wire9, reg24} : (reg16 >>> wire2)) ~^ (8'hbd))));
              reg28 <= $unsigned($signed((8'h9c)));
              reg29 <= $unsigned(($unsigned(($signed(reg28) ?
                  (8'hbb) : $unsigned(reg15))) > (reg7[(3'h6):(3'h6)] - $unsigned(reg21[(3'h4):(1'h0)]))));
              reg30 <= ($signed((~&$signed((!wire0)))) ?
                  reg26 : (($unsigned(reg24[(3'h5):(1'h1)]) ~^ ({reg18, wire8} ?
                          wire9[(4'hc):(4'h8)] : (reg16 > reg25))) ?
                      {reg18} : reg17[(2'h3):(1'h0)]));
            end
          reg31 <= (reg16 ^ (~|reg15[(2'h2):(1'h0)]));
          reg32 <= $unsigned((($signed(wire3[(3'h7):(2'h3)]) ~^ wire3[(4'ha):(4'ha)]) ?
              ($signed(reg25[(2'h2):(2'h2)]) ?
                  wire4 : $signed(wire8[(4'hb):(1'h0)])) : reg18));
        end
      reg33 <= (-(+(((wire1 <<< wire3) ?
              $unsigned(wire9) : reg29[(3'h5):(3'h4)]) ?
          ((wire2 ? (8'ha5) : wire1) * (reg16 ?
              reg24 : wire1)) : $signed($signed((8'ha9))))));
      if ({(((^(reg11 ?
              reg15 : reg29)) <<< (|wire0[(1'h0):(1'h0)])) ~^ {$signed((~reg30)),
              (((8'h9d) - reg15) >>> (^reg17))}),
          reg13})
        begin
          if (reg11[(2'h3):(2'h3)])
            begin
              reg34 <= $unsigned($unsigned((($unsigned(wire0) >> {reg13}) | {((8'hbe) - reg24)})));
              reg35 <= wire3;
              reg36 <= reg30;
            end
          else
            begin
              reg34 <= $signed(wire5);
              reg35 <= (^~(8'h9e));
              reg36 <= {wire22[(2'h2):(1'h1)],
                  ($unsigned(reg17[(4'h8):(2'h2)]) <= $signed({$signed(reg30),
                      wire22}))};
              reg37 <= ((!reg12) ?
                  $unsigned($signed(((reg18 != reg17) ?
                      $signed(reg21) : reg36[(2'h2):(1'h1)]))) : $signed({(-$signed((7'h41))),
                      ((!wire5) && (8'hbb))}));
            end
          if ((8'ha1))
            begin
              reg38 <= (~$unsigned(($unsigned((~^reg36)) <<< $unsigned((reg13 ?
                  reg31 : reg34)))));
              reg39 <= $signed(reg7[(2'h2):(2'h2)]);
              reg40 <= (($unsigned($unsigned((~^reg11))) ?
                  reg11 : reg28) << reg29);
            end
          else
            begin
              reg38 <= reg33;
              reg39 <= reg35[(2'h3):(1'h1)];
              reg40 <= ($unsigned(($signed(wire8) <<< $unsigned((reg39 ?
                      (8'hb6) : reg35)))) ?
                  $signed((({(8'h9d)} ?
                      reg39[(4'hc):(4'h9)] : (reg18 >> reg15)) < $signed(((8'haa) >= wire9)))) : {$unsigned(((reg7 - reg26) ?
                          (&reg35) : (reg23 || wire4)))});
            end
        end
      else
        begin
          if (wire0)
            begin
              reg34 <= $signed($signed(wire3));
              reg35 <= ({reg26[(3'h4):(2'h3)],
                      (((7'h40) ?
                          (+wire2) : reg36[(2'h3):(2'h3)]) > $unsigned(reg16[(1'h1):(1'h0)]))} ?
                  (|$unsigned(((wire5 * (8'hbe)) != (reg15 << reg35)))) : $unsigned((reg23 ~^ ({reg26} ?
                      reg17 : reg14))));
              reg36 <= $unsigned($signed($unsigned(($signed((8'hbf)) ?
                  (reg25 || wire22) : $signed(reg25)))));
              reg37 <= ((($signed((reg23 && reg33)) < $unsigned((~|wire5))) ?
                      ($signed((reg35 ?
                          wire9 : (8'haa))) >>> $unsigned(reg20[(3'h7):(1'h1)])) : (((~&reg14) >> (+wire1)) ?
                          reg18[(3'h4):(2'h3)] : ((reg15 ? reg10 : reg27) ?
                              reg17[(2'h3):(2'h3)] : reg19))) ?
                  {reg7} : reg28[(4'hb):(1'h1)]);
              reg38 <= (8'h9c);
            end
          else
            begin
              reg34 <= reg14[(1'h1):(1'h0)];
              reg35 <= {reg17,
                  ((!$signed(reg23)) ~^ $unsigned(($unsigned(reg38) >= $signed((8'hbd)))))};
              reg36 <= reg40[(1'h0):(1'h0)];
              reg37 <= (|{$signed({{reg10}})});
            end
          reg39 <= $unsigned({$signed((!reg40[(2'h2):(1'h1)])),
              (($signed(reg31) ? $unsigned((8'hb5)) : (wire8 & reg29)) ?
                  ($signed((7'h43)) ?
                      $signed(reg25) : $unsigned((7'h40))) : (~^reg32[(3'h5):(1'h1)]))});
          reg40 <= reg7[(1'h1):(1'h1)];
        end
    end
  assign wire41 = $signed($unsigned(reg32[(4'hc):(2'h3)]));
  assign wire42 = reg12;
  assign wire43 = (8'ha0);
  assign wire44 = (+(~(^~$unsigned(reg10))));
endmodule
