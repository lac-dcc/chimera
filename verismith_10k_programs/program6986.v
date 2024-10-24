module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire50;
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire5,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire39,
                 wire40,
                 wire50,
                 reg54,
                 reg53,
                 reg52,
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
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 (1'h0)};
  assign wire5 = (($signed($unsigned(wire3[(5'h13):(5'h12)])) ?
                     wire3 : {(wire1[(5'h15):(5'h13)] ^~ (wire4 >>> wire3))}) * {({(wire2 ^ wire2),
                         (!wire1)} - (^~(wire4 << wire0)))});
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned(($signed($unsigned(wire4)) > ({wire5,
          wire2} >> $signed(wire1)))));
      reg7 <= wire0[(4'hc):(2'h3)];
      if (wire1)
        begin
          if ((({wire4[(3'h4):(1'h1)], $unsigned(wire0[(4'ha):(3'h6)])} ?
                  (wire3[(4'h8):(1'h1)] ?
                      $signed(wire3[(4'ha):(3'h6)]) : ((wire4 ~^ reg6) < (~&wire5))) : $signed(({(8'hbb),
                      (8'ha2)} && $unsigned(wire1)))) ?
              ((((wire2 ? wire4 : wire2) ?
                  $signed(wire0) : (wire5 ?
                      wire4 : wire1)) | wire2) <= $signed((|{wire1}))) : $signed((^~wire5[(2'h2):(1'h0)]))))
            begin
              reg8 <= ((8'hb4) ?
                  (($signed((wire1 ?
                      wire0 : reg7)) || ((!wire5) << (wire4 | (8'h9d)))) || (wire1 * ((wire3 > wire3) < (reg6 << wire0)))) : (~&reg6));
            end
          else
            begin
              reg8 <= (((+((wire0 && wire1) + (^reg6))) && ({$signed(wire2),
                      $signed(wire5)} == wire0)) ?
                  $signed({$signed({wire5, wire0}),
                      (8'hab)}) : {reg7[(3'h6):(3'h4)],
                      (wire1 ?
                          (~$unsigned(reg7)) : $unsigned((reg8 ?
                              wire3 : wire0)))});
              reg9 <= {(|(($signed(wire4) - ((8'hbb) ?
                      reg8 : (8'ha9))) - wire3))};
              reg10 <= (^$unsigned((8'ha9)));
              reg11 <= (7'h42);
              reg12 <= ((~$signed($unsigned((&wire2)))) ?
                  (~^reg7) : wire2[(3'h4):(1'h0)]);
            end
          reg13 <= {reg6[(2'h2):(2'h2)], reg9[(2'h2):(2'h2)]};
        end
      else
        begin
          reg8 <= $unsigned($unsigned($unsigned($unsigned($unsigned(wire2)))));
          reg9 <= $signed(wire5[(2'h2):(1'h0)]);
          if (($signed(wire3) ?
              $signed($unsigned($signed((reg12 || wire2)))) : reg6[(3'h4):(2'h2)]))
            begin
              reg10 <= ({$signed({wire2[(3'h5):(3'h5)]}),
                      (^$signed(reg10[(3'h6):(1'h1)]))} ?
                  (-reg12) : (((!((8'hbb) ?
                      reg8 : reg9)) | wire3) - $unsigned(wire1[(3'h6):(2'h2)])));
              reg11 <= $signed($signed(wire2));
            end
          else
            begin
              reg10 <= reg7[(4'h9):(4'h8)];
            end
          reg12 <= ($unsigned(reg7) ?
              $unsigned($unsigned(({wire2,
                  wire5} || reg8[(4'hb):(3'h7)]))) : reg13[(1'h1):(1'h1)]);
          if (wire2[(1'h0):(1'h0)])
            begin
              reg13 <= $unsigned(wire5);
              reg14 <= wire3;
              reg15 <= (reg14[(2'h3):(1'h1)] << $signed(reg9));
              reg16 <= {{$signed((reg13 != $unsigned(reg8))), (~&(~&{wire2}))}};
            end
          else
            begin
              reg13 <= ({{$unsigned((reg7 ? wire0 : wire3)),
                      ((~&reg11) ?
                          (wire2 >>> reg8) : ((8'hbe) >= wire2))}} ^~ reg6[(5'h10):(3'h7)]);
              reg14 <= $signed(((~^reg7) <= (|{(reg15 ^ (8'hab)),
                  $signed(reg10)})));
            end
        end
      reg17 <= reg15[(1'h0):(1'h0)];
    end
  assign wire18 = $signed((((8'hb7) ? {$signed(reg13)} : $signed(reg9)) ?
                      $signed($signed((|reg8))) : reg8[(4'ha):(1'h0)]));
  assign wire19 = wire5;
  assign wire20 = $signed({reg8});
  assign wire21 = (8'h9c);
  assign wire22 = (&{(((wire20 < wire18) >>> $signed(wire0)) ?
                          $signed({reg10, (8'hb0)}) : $signed((wire0 != reg7))),
                      reg6});
  assign wire23 = reg6;
  always
    @(posedge clk) begin
      reg24 <= ({({(|wire18), (reg14 ? wire3 : wire19)} ?
                  (reg11 != (wire19 && wire4)) : ($unsigned(wire2) ?
                      wire21 : (wire23 ? reg7 : wire0)))} ?
          (8'ha7) : $unsigned((~^$unsigned($signed(wire2)))));
      if ({$signed((8'hbe)),
          ($unsigned($unsigned((wire5 ? reg9 : reg10))) ?
              wire4 : ($unsigned($unsigned(wire2)) ?
                  {(reg8 ? reg17 : reg16), (reg11 >= wire18)} : reg16))})
        begin
          reg25 <= reg10;
          reg26 <= wire2;
        end
      else
        begin
          reg25 <= $signed({(~^((^~reg12) ^ wire21[(1'h1):(1'h0)])),
              ((((8'hac) <= (8'ha2)) ?
                      (reg14 ^~ wire3) : (wire20 ? (8'ha4) : reg12)) ?
                  (reg7[(3'h5):(3'h4)] ?
                      $unsigned((8'hb8)) : (reg9 <<< (8'hbf))) : (reg17 ?
                      wire4 : wire19[(1'h1):(1'h1)]))});
          reg26 <= $signed($unsigned(((wire1 ?
                  $unsigned(wire18) : $unsigned(reg15)) ?
              wire3[(3'h7):(3'h6)] : $unsigned((reg16 ? reg12 : (8'ha7))))));
          reg27 <= reg16[(1'h0):(1'h0)];
          reg28 <= $unsigned(wire3[(4'he):(1'h1)]);
          if ((+($signed((((8'hb5) ? reg9 : wire1) < (~^reg27))) ?
              ($unsigned((^reg13)) ?
                  $signed($signed(reg14)) : ((~&reg16) && (reg13 >> reg28))) : ($signed(reg7[(4'h9):(2'h3)]) ?
                  reg27[(1'h0):(1'h0)] : $signed((wire21 ? wire2 : reg28))))))
            begin
              reg29 <= wire21[(2'h3):(2'h3)];
              reg30 <= ((~|$unsigned(wire5[(1'h0):(1'h0)])) ?
                  reg26[(4'hf):(4'hd)] : ({wire2} * (($unsigned(reg8) ^~ (reg27 != reg27)) + $signed((reg7 ?
                      (8'ha8) : reg14)))));
              reg31 <= $unsigned((8'ha7));
            end
          else
            begin
              reg29 <= {reg9[(1'h1):(1'h0)]};
              reg30 <= ($signed((+($unsigned((8'hae)) ?
                  reg14 : (wire0 > (8'hba))))) || $unsigned(($signed(reg6[(4'ha):(4'ha)]) ?
                  wire0 : {$signed(wire1), $signed(wire23)})));
              reg31 <= reg17[(2'h2):(1'h1)];
            end
        end
      reg32 <= ((!($signed(reg13[(3'h7):(1'h0)]) ?
          (^~reg17[(2'h3):(2'h2)]) : (|reg15))) >> (|wire2));
      reg33 <= $signed(reg8[(5'h14):(3'h6)]);
    end
  always
    @(posedge clk) begin
      reg34 <= {reg33[(3'h4):(2'h3)],
          ((reg16[(1'h1):(1'h0)] >> reg17) ?
              (($unsigned((8'h9d)) && wire21) != $unsigned((reg9 ?
                  reg33 : reg7))) : {(~|$signed(reg6))})};
      reg35 <= (reg24 ? reg8[(3'h4):(3'h4)] : reg6);
      reg36 <= ($signed(wire0) ~^ {$unsigned((((7'h43) * reg11) || (wire1 ?
              wire0 : wire21))),
          wire18});
      reg37 <= wire22[(1'h0):(1'h0)];
      reg38 <= (~|reg14[(4'h8):(3'h5)]);
    end
  assign wire39 = reg32[(4'h8):(3'h6)];
  assign wire40 = (((($unsigned(wire18) + (^wire4)) << (reg17 == (wire21 && wire21))) + reg9) | {reg7,
                      (^~wire20[(1'h1):(1'h0)])});
  module41 #() modinst51 (.wire43(reg26), .y(wire50), .wire44(reg27), .wire42(wire18), .wire45(reg13), .clk(clk));
  always
    @(posedge clk) begin
      reg52 <= {wire23[(4'h9):(1'h0)],
          ($unsigned($signed((&reg16))) ?
              reg14 : $unsigned({reg8[(5'h10):(4'he)], reg15}))};
      reg53 <= $signed(reg13);
      reg54 <= $unsigned(reg10);
    end
  assign wire55 = (reg12[(4'hf):(1'h0)] >>> reg14[(4'hc):(4'h8)]);
  assign wire56 = (wire22[(5'h12):(4'ha)] != $signed((8'hb6)));
  assign wire57 = (8'hb9);
  assign wire58 = $signed($unsigned(reg13));
  assign wire59 = reg16[(3'h4):(1'h0)];
  assign wire60 = reg10;
  assign wire61 = reg11;
endmodule

module module41  (y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire44;
  input wire [(2'h2):(1'h0)] wire43;
  input wire signed [(4'h8):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  assign y = {wire49, wire48, wire47, wire46, (1'h0)};
  assign wire46 = ($unsigned($unsigned($signed((wire42 ? wire45 : wire45)))) ?
                      {$unsigned((wire43 | $unsigned(wire45)))} : ((!$signed((wire45 ?
                              wire45 : wire45))) ?
                          $signed((~|(~^wire43))) : (&wire42)));
  assign wire47 = wire44;
  assign wire48 = wire47[(4'hc):(3'h4)];
  assign wire49 = $unsigned({$unsigned((wire44 <<< {wire46, wire46})), wire46});
endmodule
