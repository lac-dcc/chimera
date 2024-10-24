module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire25,
                 wire24,
                 wire6,
                 wire5,
                 wire4,
                 reg52,
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
                 (1'h0)};
  assign wire4 = $signed((($signed((wire2 ?
                     wire2 : (8'hb9))) <<< ($unsigned(wire1) ?
                     $signed((8'hbb)) : (wire3 || wire3))) <<< $unsigned(wire3[(1'h1):(1'h0)])));
  assign wire5 = {$signed((($signed(wire1) == $unsigned(wire2)) ?
                         $signed(wire0) : wire0[(4'hf):(3'h5)])),
                     wire2};
  assign wire6 = wire0[(4'hf):(4'he)];
  always
    @(posedge clk) begin
      if ($signed((|(~|$signed(wire6[(1'h1):(1'h0)])))))
        begin
          reg7 <= (((wire6[(2'h3):(2'h2)] ?
                  ((~|wire3) ~^ (wire6 ?
                      wire0 : (7'h41))) : (+$signed((8'hae)))) ^~ (($signed(wire2) ?
                  wire6 : $unsigned(wire1)) == ((~wire2) & (wire5 | wire1)))) ?
              (($unsigned((^~wire3)) ~^ wire1) ?
                  $signed($unsigned(wire1)) : wire0[(1'h1):(1'h0)]) : wire3);
          reg8 <= wire3;
        end
      else
        begin
          reg7 <= wire3[(3'h6):(1'h0)];
          if ((wire0[(3'h6):(2'h3)] ?
              wire1 : {$unsigned((wire1[(1'h1):(1'h1)] && $signed(wire0)))}))
            begin
              reg8 <= ((($signed((+wire1)) ^ $unsigned((wire2 ?
                  wire6 : wire6))) > $unsigned((wire6 ?
                  wire6[(3'h6):(1'h1)] : (wire6 == wire2)))) >> $signed(({$unsigned(wire1)} ?
                  $unsigned((wire1 ~^ reg8)) : wire6[(3'h6):(2'h2)])));
              reg9 <= wire3[(3'h5):(1'h0)];
              reg10 <= {($unsigned(((-(8'hae)) <<< {(8'hb1)})) ?
                      ($signed((!wire2)) ?
                          {(~reg8), (8'hb2)} : ((wire1 ?
                              wire6 : wire1) ^~ (8'hb5))) : wire2)};
            end
          else
            begin
              reg8 <= ((wire5[(2'h2):(2'h2)] ?
                  $signed($signed((+reg9))) : (^~($signed(wire0) ?
                      {wire6,
                          reg7} : $signed((8'ha9))))) >> (+reg9[(3'h4):(3'h4)]));
              reg9 <= ($unsigned((-(~&wire1))) << ($signed($signed($signed((8'hb4)))) > wire2));
              reg10 <= (&{(($unsigned(wire2) ^~ (wire3 ? wire1 : wire1)) ?
                      {$signed(reg7)} : (wire0 ^~ reg8))});
              reg11 <= (~|$unsigned($signed(wire5)));
              reg12 <= $unsigned(wire1);
            end
        end
      reg13 <= reg11[(3'h6):(1'h0)];
      if ($signed($unsigned((~&$signed({reg7, reg10})))))
        begin
          reg14 <= wire1[(1'h0):(1'h0)];
          reg15 <= $signed({reg7[(2'h2):(1'h1)], {reg11}});
          reg16 <= $unsigned(wire1);
          reg17 <= $signed((+(wire2[(1'h1):(1'h0)] ?
              reg13[(2'h3):(2'h2)] : reg14[(3'h6):(3'h6)])));
          reg18 <= $unsigned((({((8'hb3) ? reg9 : wire0),
                  wire0[(5'h11):(3'h6)]} ?
              wire1[(1'h0):(1'h0)] : $signed(wire4)) < {$signed(reg14[(4'h8):(1'h0)]),
              $signed({wire6, wire4})}));
        end
      else
        begin
          reg14 <= $unsigned({(reg7 ?
                  $unsigned(reg10[(4'hb):(2'h2)]) : ((~|reg14) ?
                      wire2[(1'h0):(1'h0)] : {reg16, reg17})),
              ((~&$signed(reg8)) + reg12[(2'h2):(2'h2)])});
        end
      if ((~&reg9))
        begin
          reg19 <= {($signed(wire6) ^~ wire5),
              $unsigned($unsigned(wire6[(2'h2):(1'h0)]))};
          if (reg17[(2'h3):(2'h3)])
            begin
              reg20 <= wire1;
              reg21 <= reg15;
            end
          else
            begin
              reg20 <= ((!reg20) ?
                  (reg17[(1'h0):(1'h0)] ?
                      reg11 : wire3[(4'hf):(2'h3)]) : $unsigned(($signed(((8'hab) ?
                          wire3 : reg15)) ?
                      $unsigned((reg21 ? reg19 : reg20)) : $unsigned((wire6 ?
                          reg12 : wire1)))));
            end
          reg22 <= reg11;
        end
      else
        begin
          reg19 <= reg22[(4'hc):(1'h0)];
          if (reg22)
            begin
              reg20 <= (&wire2[(2'h3):(2'h2)]);
              reg21 <= ($signed($signed({(8'hae), reg10[(2'h3):(1'h0)]})) ?
                  (8'hab) : $unsigned($signed((&$unsigned(reg11)))));
              reg22 <= (~&$signed(reg10));
            end
          else
            begin
              reg20 <= {((reg15 | (wire6[(3'h4):(2'h3)] ?
                      $unsigned(reg19) : $unsigned(reg11))) && $unsigned((reg20[(4'h8):(3'h6)] ?
                      (reg20 && reg20) : reg13)))};
            end
        end
      reg23 <= wire0;
    end
  assign wire24 = $signed((((reg7 ? reg9[(3'h7):(1'h1)] : $signed((8'hbd))) ?
                      reg23 : wire4) || wire4[(3'h5):(3'h5)]));
  assign wire25 = (^$signed(wire6[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg26 <= $unsigned(((!reg7[(2'h2):(1'h0)]) ?
          $unsigned(wire25[(2'h3):(1'h0)]) : wire25));
      reg27 <= {$signed($signed($signed($signed((8'ha6))))), $unsigned(wire4)};
      reg28 <= (((wire2[(1'h0):(1'h0)] == $unsigned($signed(reg20))) != $signed(($unsigned(wire25) ?
          ((8'haa) ^~ reg14) : $signed((8'ha6))))) < $signed(reg18));
      reg29 <= $unsigned({$signed(reg22[(4'hb):(4'hb)]), wire2[(2'h2):(1'h1)]});
      reg30 <= $unsigned($unsigned({((wire1 && (8'hb5)) ^ (reg21 - reg16)),
          (reg27[(4'ha):(2'h3)] & reg9[(3'h7):(3'h7)])}));
    end
  always
    @(posedge clk) begin
      reg31 <= reg13[(3'h4):(1'h0)];
      reg32 <= ($signed({(reg8 || (reg18 ? reg16 : wire24)),
              ({(8'hb2), reg20} ? wire1 : (reg28 & wire24))}) ?
          $signed(({(~(8'hae)),
              $signed(reg19)} < $unsigned((reg15 << reg8)))) : {(~|$signed($signed((8'hbc))))});
      reg33 <= (~|reg28[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ({(&{(reg28[(4'h8):(3'h7)] >> $unsigned(reg11))})})
        begin
          reg34 <= (({$signed(reg14[(3'h4):(1'h0)]),
              reg23} ~^ ($unsigned({wire3}) ?
              $signed(reg23[(4'ha):(3'h7)]) : wire4[(2'h3):(2'h2)])) | reg18[(2'h3):(2'h3)]);
        end
      else
        begin
          if ((reg10[(4'he):(1'h0)] ^~ $unsigned((((reg8 ?
              wire1 : reg32) | wire4) & ((reg20 ?
              (8'ha6) : reg19) ~^ wire25)))))
            begin
              reg34 <= ((reg27[(1'h1):(1'h0)] || (reg22 ^~ $signed($signed(reg32)))) ?
                  ((^$unsigned((~reg34))) == ({(reg33 == reg12)} || ($unsigned(reg7) ?
                      reg14 : ((7'h42) - (8'hbf))))) : ((~^wire6) ?
                      $signed($unsigned({wire0})) : reg15));
              reg35 <= reg8[(3'h6):(2'h2)];
              reg36 <= ({$unsigned((|wire3[(1'h1):(1'h0)])),
                  $unsigned($unsigned((reg35 ?
                      reg23 : reg35)))} < (^~(!reg17[(2'h2):(1'h0)])));
              reg37 <= $signed((($unsigned((wire25 ? reg34 : reg17)) ?
                  ((reg34 ? (8'ha7) : reg15) != ((8'ha0) ?
                      (7'h42) : reg23)) : (reg16 ?
                      (reg16 ? reg27 : (8'hb5)) : {(7'h43)})) || wire4));
            end
          else
            begin
              reg34 <= reg22;
              reg35 <= (+(&$unsigned(($signed(reg33) + reg35))));
              reg36 <= ($signed(reg21) || reg14[(2'h3):(1'h1)]);
            end
          reg38 <= (~^$unsigned($unsigned(reg13[(2'h2):(1'h0)])));
          reg39 <= ((~^$signed(reg12)) ?
              (wire24 <<< (&{wire3[(3'h6):(1'h1)]})) : ((~(reg21[(3'h5):(2'h3)] ?
                      $unsigned(reg14) : (&(8'ha1)))) ?
                  reg21[(4'h8):(4'h8)] : (~&reg13[(4'h8):(3'h5)])));
          reg40 <= $signed(($signed(reg14) > (^~($unsigned((8'hbc)) ?
              (~&(8'hb0)) : {reg27}))));
        end
      if (reg35[(4'hf):(4'he)])
        begin
          reg41 <= (~&reg35[(4'h9):(4'h9)]);
          reg42 <= $unsigned($unsigned($signed(reg12[(3'h6):(2'h2)])));
          reg43 <= reg17[(1'h0):(1'h0)];
        end
      else
        begin
          reg41 <= (reg39[(1'h1):(1'h1)] ?
              (wire2[(1'h0):(1'h0)] << (+((^~reg18) ?
                  (wire25 + reg42) : $unsigned(reg19)))) : reg14[(3'h5):(2'h3)]);
          if (reg23[(2'h3):(2'h2)])
            begin
              reg42 <= wire3;
              reg43 <= reg31;
            end
          else
            begin
              reg42 <= (($signed(wire1[(4'h9):(1'h0)]) ?
                      reg29 : $signed($unsigned((-reg8)))) ?
                  ($signed(reg11) ? wire5 : wire3) : (+{$signed($signed(reg26)),
                      wire6[(2'h3):(2'h2)]}));
              reg43 <= $unsigned((~^(wire0[(4'hb):(4'h9)] ^~ (reg18 << ((8'ha9) && wire4)))));
              reg44 <= ((|$unsigned(reg27)) > reg29[(4'h8):(1'h0)]);
              reg45 <= (({reg31,
                  reg16[(1'h0):(1'h0)]} && $unsigned(($unsigned(reg43) * (~reg31)))) > ($unsigned($signed({reg41})) ?
                  {({reg11,
                          reg19} > $unsigned((8'hb9)))} : $signed((&(~&wire3)))));
            end
        end
      reg46 <= (-reg29);
      if (((reg40[(2'h3):(1'h1)] >= (+reg37)) ?
          $signed($signed($signed((reg33 == reg8)))) : reg35[(4'h9):(4'h9)]))
        begin
          reg47 <= (reg13[(3'h4):(2'h2)] ? reg44 : $signed(reg18));
          reg48 <= reg34[(4'hc):(3'h6)];
        end
      else
        begin
          reg47 <= $signed(reg14);
          reg48 <= ((8'hb9) ?
              {{(reg9 ? (reg38 <= reg42) : reg14), $signed((+reg21))},
                  reg22} : ($signed(((wire6 || wire1) >> reg27[(1'h0):(1'h0)])) > ((~|reg17[(1'h1):(1'h0)]) ?
                  wire6[(3'h6):(1'h0)] : (wire24[(3'h4):(2'h2)] ?
                      (reg10 * wire6) : (reg21 ~^ reg30)))));
          if ((|$signed($signed((~|(wire5 ? (8'ha2) : reg36))))))
            begin
              reg49 <= $unsigned(reg40[(4'hb):(3'h7)]);
            end
          else
            begin
              reg49 <= wire3[(5'h11):(2'h2)];
            end
        end
    end
  assign wire50 = reg26;
  assign wire51 = (($unsigned({(8'haa)}) ?
                      reg40 : {(~$signed(wire0)),
                          {(reg23 ? reg21 : reg18)}}) && reg38[(4'h9):(2'h3)]);
  always
    @(posedge clk) begin
      reg52 <= reg32[(2'h2):(2'h2)];
    end
  assign wire53 = $unsigned($unsigned(reg15[(3'h6):(1'h0)]));
  assign wire54 = reg36[(2'h3):(1'h0)];
  assign wire55 = ((wire25 ?
                          reg41[(4'hb):(4'ha)] : ($signed(((8'hac) >> reg42)) != wire50)) ?
                      (reg35[(4'he):(2'h2)] != (reg33 || reg14)) : $unsigned($unsigned(reg37[(2'h3):(1'h1)])));
  assign wire56 = (!((~&reg35[(1'h0):(1'h0)]) <<< ($signed((^wire50)) ^~ (wire1 ?
                      {reg26} : reg17))));
  assign wire57 = reg30[(1'h1):(1'h0)];
  assign wire58 = {(wire4[(1'h0):(1'h0)] ? reg39 : reg30)};
  assign wire59 = {reg21[(2'h2):(1'h1)], (^~(~&reg12))};
  assign wire60 = (reg48[(3'h5):(1'h1)] < $signed((($signed(reg8) & (reg11 ?
                          reg37 : reg16)) ?
                      {$signed((8'hb9))} : ($unsigned(wire3) >> wire55[(3'h6):(1'h0)]))));
  assign wire61 = $signed((wire55[(2'h2):(2'h2)] ?
                      (wire58[(1'h1):(1'h0)] ?
                          reg21[(3'h6):(1'h1)] : reg49[(2'h2):(2'h2)]) : (!((wire54 <= wire60) ?
                          $signed(wire50) : $unsigned((8'hb8))))));
  assign wire62 = wire51[(3'h7):(2'h2)];
  assign wire63 = (~$signed(reg44));
endmodule
