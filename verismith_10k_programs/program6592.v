module top
#(parameter param50 = (^~(((((8'hb5) ? (8'ha6) : (8'hb9)) << ((7'h40) ? (8'had) : (8'hbb))) <= {((8'h9d) - (7'h44))}) && (((8'ha9) < {(8'hab), (8'hbe)}) >= ((^~(8'ha4)) - ((8'hb8) ? (8'ha9) : (8'ha1)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire12;
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire47,
                 wire12,
                 reg49,
                 reg48,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire3[(4'he):(4'h8)] <= wire4))
        begin
          reg5 <= (~wire3[(4'ha):(3'h5)]);
          if ($signed(($signed(((wire3 ^~ wire0) ? {wire3} : (~^wire4))) ?
              reg5 : wire2)))
            begin
              reg6 <= wire4[(3'h4):(3'h4)];
              reg7 <= $unsigned(reg5);
            end
          else
            begin
              reg6 <= $unsigned(($signed((~&{wire1,
                  reg5})) <<< $signed($unsigned($signed(wire1)))));
            end
          reg8 <= $signed($signed((reg6[(1'h0):(1'h0)] ?
              $signed((reg7 ?
                  reg7 : wire2)) : ($unsigned(wire0) && wire4[(2'h3):(2'h2)]))));
          reg9 <= $unsigned($signed({(^~(~wire1)), reg6[(4'h8):(3'h6)]}));
          reg10 <= $signed($signed((reg5 ~^ reg8[(2'h3):(1'h1)])));
        end
      else
        begin
          reg5 <= $unsigned($signed((~|((reg8 ? wire0 : reg5) ^~ {reg5,
              reg10}))));
        end
      reg11 <= (reg8 >>> $signed(reg9[(2'h2):(2'h2)]));
    end
  assign wire12 = (wire4 * $signed(reg9));
  always
    @(posedge clk) begin
      if (reg9[(1'h0):(1'h0)])
        begin
          reg13 <= {$unsigned(wire12)};
          reg14 <= ((~^$unsigned(reg11[(1'h1):(1'h0)])) ?
              ($unsigned({(wire3 << wire12), wire12}) + ({$unsigned(reg9),
                  wire4[(4'hb):(2'h3)]} | ($unsigned(wire2) <<< $unsigned(wire12)))) : reg5);
        end
      else
        begin
          if ((|{reg14}))
            begin
              reg13 <= (+reg6);
              reg14 <= ((reg5[(3'h7):(2'h2)] ?
                      ($unsigned((reg7 ?
                          (8'hba) : wire4)) ~^ $unsigned($unsigned(wire12))) : ((((8'ha6) <= reg5) ?
                          $unsigned(reg14) : $signed(reg6)) | reg11)) ?
                  $signed((8'ha2)) : (&$unsigned(reg10)));
            end
          else
            begin
              reg13 <= {$signed(($signed({reg13}) < $signed($unsigned(reg7)))),
                  (8'hb7)};
              reg14 <= {$signed($unsigned((reg11 > (~|wire0)))),
                  (~|$signed($signed((wire12 ? wire4 : wire1))))};
              reg15 <= $unsigned(reg6);
            end
          if (($signed($signed(reg10)) != (wire2[(1'h0):(1'h0)] ?
              wire2 : (~&wire2))))
            begin
              reg16 <= (reg9[(1'h0):(1'h0)] >>> {((reg9[(2'h2):(2'h2)] ?
                      $signed((8'hb7)) : reg7) != {(wire1 - (8'h9e))}),
                  $signed(reg15)});
            end
          else
            begin
              reg16 <= (!((^({(8'hbc)} ?
                      reg6[(1'h0):(1'h0)] : $unsigned(wire12))) ?
                  reg7[(4'h8):(3'h5)] : $signed({(!reg10)})));
            end
          reg17 <= (^~(~reg8[(5'h10):(4'ha)]));
          reg18 <= reg10[(1'h0):(1'h0)];
          if ({$unsigned((^(~&(reg7 ? reg13 : reg9))))})
            begin
              reg19 <= wire12[(3'h5):(2'h3)];
              reg20 <= $signed(wire4[(4'ha):(4'h9)]);
              reg21 <= reg20;
              reg22 <= {{reg21, $unsigned(($signed(wire3) << reg20))}};
              reg23 <= {(reg6 ? reg5[(1'h1):(1'h1)] : (~(~^(reg7 >> reg14)))),
                  ($signed(($unsigned((8'haf)) << (reg15 == wire4))) ?
                      {$unsigned((reg6 + (8'hb0)))} : ((((8'hab) >>> reg22) ?
                          (8'hba) : ((8'hbb) << (8'hb1))) - reg10))};
            end
          else
            begin
              reg19 <= $signed((-reg20));
              reg20 <= (^~(((-$signed(wire3)) << $signed($unsigned(reg21))) ?
                  ((reg7 && (8'h9c)) ^ (|$unsigned((8'haa)))) : reg16));
            end
        end
      reg24 <= $unsigned(($unsigned({(8'ha9),
          (|wire12)}) >>> $unsigned(wire1[(1'h0):(1'h0)])));
      if ($unsigned($signed($unsigned(reg14[(4'hd):(4'hc)]))))
        begin
          reg25 <= reg23;
        end
      else
        begin
          reg25 <= reg8;
          if (({{(-reg17[(4'h9):(2'h3)]),
                  (^(reg17 ? reg7 : (8'hac)))}} <= ($unsigned(($signed(reg10) ?
              (~wire1) : (reg9 ?
                  (8'ha7) : reg8))) >> $unsigned($signed((~|wire3))))))
            begin
              reg26 <= ($unsigned($signed((reg15[(4'hb):(3'h7)] + $signed(reg18)))) <= reg20[(2'h2):(1'h1)]);
              reg27 <= $signed((reg23 ?
                  reg6[(3'h6):(1'h0)] : reg19[(2'h2):(1'h1)]));
              reg28 <= {reg22};
              reg29 <= reg27;
            end
          else
            begin
              reg26 <= {reg11};
              reg27 <= $signed(((wire2[(1'h1):(1'h1)] ?
                      $signed($signed(wire1)) : reg20) ?
                  {(~|$signed(reg6)),
                      $unsigned({reg6})} : reg24[(3'h5):(3'h4)]));
              reg28 <= ($unsigned(reg17) ?
                  ($signed(reg16) ?
                      wire12[(3'h4):(2'h2)] : ({(+wire4),
                              (reg15 ? reg9 : reg22)} ?
                          $unsigned((|wire3)) : reg22)) : (&($signed(((8'ha7) ^ reg7)) <<< $signed((reg8 > (8'haf))))));
            end
        end
      reg30 <= wire4[(1'h0):(1'h0)];
      reg31 <= $signed($unsigned((|{$signed(reg20), (wire12 || (8'hb7))})));
    end
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(reg14[(4'hb):(2'h2)])) ^~ $unsigned((({reg13,
                  wire3} ?
              $unsigned((8'h9d)) : reg11) ?
          ((7'h43) ? {reg24} : wire0) : ($signed(reg28) ?
              (8'hac) : (~|reg13))))))
        begin
          reg32 <= $unsigned($unsigned(reg15[(5'h12):(4'hc)]));
          reg33 <= (~^$signed(reg18));
          if (reg31)
            begin
              reg34 <= reg31;
            end
          else
            begin
              reg34 <= {reg22, (^(reg31 ? (~&$signed((7'h44))) : (&(&wire3))))};
              reg35 <= (~^(&($signed((8'hbe)) >= reg6)));
              reg36 <= $signed($signed({wire12[(3'h4):(2'h2)], {reg16}}));
              reg37 <= ((&(&(~&((8'hb6) ^~ (7'h41))))) || ($signed((|$unsigned(reg5))) ?
                  $unsigned({reg31[(4'h9):(3'h6)],
                      reg14[(2'h3):(2'h3)]}) : (reg21 ?
                      ($unsigned(wire3) ?
                          (^~wire4) : (reg19 ?
                              reg10 : reg33)) : ($unsigned(reg34) << ((8'ha1) == reg20)))));
              reg38 <= wire0[(3'h7):(3'h5)];
            end
          reg39 <= ((+reg8) ? $signed($signed(reg18[(1'h1):(1'h1)])) : (8'ha7));
        end
      else
        begin
          if ((-(reg38 ?
              reg39[(4'hc):(2'h3)] : (reg8[(4'he):(2'h2)] ?
                  reg29 : (^~reg21[(1'h1):(1'h1)])))))
            begin
              reg32 <= ((reg24 != {($signed(wire1) ?
                      $signed(reg33) : (8'hbd))}) ^ wire4);
              reg33 <= $unsigned((($signed(wire12) ?
                  ($signed(wire3) ?
                      $unsigned(reg17) : (+reg14)) : (reg39[(2'h3):(2'h3)] + (reg13 ?
                      reg10 : reg13))) <<< $signed((8'hbe))));
              reg34 <= ((reg13[(1'h0):(1'h0)] && reg35) == reg22[(2'h3):(1'h1)]);
              reg35 <= {{$unsigned((^~reg13[(3'h5):(1'h0)]))}};
            end
          else
            begin
              reg32 <= wire4;
              reg33 <= ($signed(($signed($unsigned((8'hb9))) >>> ((~|reg9) >>> $unsigned(reg17)))) < (^reg30[(1'h0):(1'h0)]));
              reg34 <= $unsigned(reg29[(4'hb):(1'h0)]);
            end
          reg36 <= reg24[(4'hc):(4'h9)];
          if (reg29[(4'h8):(4'h8)])
            begin
              reg37 <= ($unsigned(($signed(reg10[(4'ha):(3'h6)]) && $signed(reg38[(3'h6):(2'h2)]))) ?
                  $signed((($signed(wire12) ?
                      (reg36 == (8'hba)) : (reg37 <= reg10)) ~^ (-(reg9 & reg14)))) : reg20[(1'h1):(1'h1)]);
              reg38 <= ($signed(reg17) ?
                  $signed((((&reg29) ?
                      (reg31 ?
                          reg8 : reg8) : (!reg30)) * $unsigned((~^reg5)))) : $unsigned({(8'hb5)}));
            end
          else
            begin
              reg37 <= (^~reg24);
              reg38 <= $unsigned(reg21[(4'h8):(3'h4)]);
              reg39 <= (~(&reg22));
            end
          reg40 <= (~(($unsigned((reg34 ?
              reg22 : reg10)) << $unsigned(reg18)) > ($unsigned(wire3[(1'h1):(1'h0)]) ?
              ((&reg17) ? (reg23 ? (8'ha8) : reg7) : wire12) : reg38)));
          if (reg11)
            begin
              reg41 <= $signed({{((reg15 && reg34) ?
                          $signed(reg26) : reg25[(3'h6):(2'h2)])},
                  $signed((reg26 >>> (reg26 == reg9)))});
              reg42 <= (((^{$unsigned(reg8)}) * {((|(7'h43)) ?
                      $unsigned(wire3) : (reg6 + reg34)),
                  (8'hbd)}) > $signed(($unsigned(reg27) ?
                  (^reg34[(3'h6):(3'h4)]) : (^(wire4 > (8'h9d))))));
            end
          else
            begin
              reg41 <= (reg33[(4'h8):(2'h2)] >= $unsigned(((-$unsigned(reg24)) * (~$unsigned(wire12)))));
              reg42 <= {$unsigned(reg20)};
            end
        end
      reg43 <= ($unsigned(reg28) - reg17);
      reg44 <= $signed(reg19[(1'h1):(1'h1)]);
      reg45 <= (reg13 < (wire12[(1'h1):(1'h1)] || ((reg37[(3'h4):(2'h2)] ?
          $unsigned(reg20) : (reg15 || reg21)) >= (^~(reg17 ? reg8 : reg39)))));
      reg46 <= ((reg6 << $unsigned($unsigned(reg27[(1'h1):(1'h0)]))) ?
          reg36 : $signed(reg21));
    end
  assign wire47 = (~^((reg34[(3'h4):(2'h2)] << reg16[(2'h3):(1'h0)]) && $unsigned((reg20[(2'h2):(1'h1)] ?
                      $signed(reg24) : $unsigned(wire12)))));
  always
    @(posedge clk) begin
      reg48 <= reg14[(4'hc):(1'h1)];
      if (({($unsigned($unsigned((8'hba))) ?
              $signed((^~reg33)) : ($unsigned(reg48) * (reg22 <<< reg19))),
          ($signed(reg24[(1'h0):(1'h0)]) << (wire12 ?
              reg27[(1'h0):(1'h0)] : $unsigned(reg26)))} && ((&reg37[(3'h4):(1'h1)]) ^ $unsigned(reg5[(2'h2):(1'h0)]))))
        begin
          reg49 <= $unsigned($signed($signed($unsigned(reg10))));
        end
      else
        begin
          reg49 <= reg23;
        end
    end
endmodule
