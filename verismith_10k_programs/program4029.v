module top
#(parameter param36 = (~&{((8'had) || ({(8'ha8), (8'ha3)} ? {(8'hae)} : (^(8'hbe))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
  always
    @(posedge clk) begin
      reg5 <= $signed($unsigned($unsigned(wire2)));
      reg6 <= ((!$unsigned(wire3[(2'h2):(2'h2)])) | {$signed($signed($unsigned((8'hb2)))),
          wire4[(3'h6):(2'h2)]});
      if ($signed((wire4 & (8'hb8))))
        begin
          reg7 <= (!(wire4[(3'h6):(3'h5)] ?
              $signed((+wire4)) : $unsigned(wire4)));
          reg8 <= wire0;
          reg9 <= $signed((~((wire1 <<< wire3) ?
              {(+reg7)} : wire0[(3'h4):(3'h4)])));
          if ($signed((reg6[(4'he):(4'ha)] ?
              {($signed(wire3) + (~(8'hba))), (8'h9c)} : ((~|(wire0 ?
                  reg9 : reg6)) | $unsigned($signed(wire4))))))
            begin
              reg10 <= (&wire4[(1'h0):(1'h0)]);
              reg11 <= $signed($unsigned((^~$unsigned($signed(reg7)))));
              reg12 <= ((reg9[(1'h1):(1'h0)] == ($signed((reg6 ?
                      wire4 : reg9)) ?
                  (((8'hae) ? wire3 : reg7) ?
                      (reg10 ~^ wire1) : (wire2 && reg7)) : (reg5 > ((8'ha4) ?
                      (8'h9c) : wire2)))) | ({(reg7[(4'hd):(4'h9)] & (wire1 ?
                          wire4 : (8'hab)))} ?
                  ({(reg8 ? reg10 : wire4)} < (~&(reg10 ?
                      (8'ha1) : wire1))) : ((wire0[(1'h0):(1'h0)] ?
                          (~|reg5) : $unsigned(reg11)) ?
                      wire1 : $signed($signed(reg9)))));
              reg13 <= wire4[(1'h1):(1'h0)];
            end
          else
            begin
              reg10 <= $unsigned(reg10[(2'h3):(2'h2)]);
              reg11 <= (^$unsigned($signed($signed(reg5))));
              reg12 <= (reg6 ?
                  ($signed((!$unsigned((8'ha2)))) ?
                      $unsigned(((reg12 & reg10) ?
                          (reg12 ?
                              reg10 : reg6) : reg8)) : (-$signed((|reg9)))) : (~&{{(wire2 ~^ wire1),
                          (wire0 ? wire1 : (8'hb9))},
                      (&(-reg6))}));
              reg13 <= {$signed((wire2[(2'h2):(1'h1)] < $unsigned((reg8 ?
                      wire3 : reg9)))),
                  ((^~(reg8 - ((8'ha7) == reg6))) ^~ $unsigned((~&reg8)))};
              reg14 <= $unsigned((+reg13));
            end
        end
      else
        begin
          reg7 <= $signed(reg12[(1'h1):(1'h0)]);
          reg8 <= $signed($unsigned((~|$unsigned($signed(wire0)))));
        end
    end
  assign wire15 = $signed((($unsigned((-wire3)) == reg11) ?
                      ($signed($signed(reg10)) == $signed($unsigned(reg9))) : (reg12 ?
                          $unsigned((wire1 ?
                              reg5 : reg9)) : reg5[(4'hb):(4'ha)])));
  assign wire16 = wire15[(3'h7):(1'h1)];
  assign wire17 = (((&(~|$signed(wire3))) <= (!((wire4 ? reg11 : (8'ha8)) ?
                      {wire16,
                          reg7} : reg10))) << $unsigned(((8'haa) != $unsigned(reg9))));
  assign wire18 = $signed(reg6);
  always
    @(posedge clk) begin
      reg19 <= (8'hbf);
      reg20 <= reg7;
      reg21 <= $unsigned({$unsigned((+(reg7 ? reg11 : wire2))), reg8});
      if ((~^$unsigned(({{reg13}} ?
          wire16[(3'h6):(3'h5)] : $unsigned((reg20 ? wire3 : reg8))))))
        begin
          reg22 <= ($unsigned(reg7) ?
              wire4[(3'h7):(3'h4)] : $signed((((wire17 ~^ reg21) == $signed(reg21)) && reg11[(5'h10):(4'hc)])));
          if ((^~{((8'hab) >>> $unsigned((8'hbb)))}))
            begin
              reg23 <= wire16;
              reg24 <= (^$signed((((-(8'ha0)) ?
                      (wire15 ? wire18 : (7'h41)) : reg9[(2'h3):(2'h2)]) ?
                  (^wire1) : $signed((reg13 ? reg20 : (8'ha8))))));
              reg25 <= (reg8 ?
                  ($signed(reg6) - $unsigned($signed(reg21))) : ((reg10 ?
                          ($signed(reg6) + reg10) : reg20) ?
                      (wire16[(3'h6):(1'h0)] ?
                          reg11[(3'h6):(3'h4)] : (wire4 ?
                              (reg22 ? reg11 : reg21) : (wire17 ?
                                  wire4 : wire2))) : reg24));
              reg26 <= reg10;
            end
          else
            begin
              reg23 <= ($signed($unsigned({reg9[(1'h1):(1'h1)], (7'h44)})) ?
                  (|(|((8'ha4) >= $signed(reg6)))) : $signed($unsigned({(reg11 | (8'hbb))})));
              reg24 <= $unsigned(((8'ha6) + $unsigned(($unsigned(wire15) ?
                  (wire1 ^ reg5) : ((8'hbe) - (8'hbb))))));
              reg25 <= {$signed(reg6[(5'h12):(4'hd)])};
              reg26 <= (+{{(!reg13), {(8'ha5)}}, (+(wire17 <= {reg26}))});
            end
          if ({(^(~^((wire17 >= reg25) > (wire1 & wire1))))})
            begin
              reg27 <= $unsigned((-reg22));
              reg28 <= {wire16[(1'h0):(1'h0)]};
              reg29 <= $unsigned((^$signed(($signed(reg28) ?
                  $signed((8'hbc)) : (wire17 ? wire2 : reg5)))));
            end
          else
            begin
              reg27 <= reg14;
              reg28 <= (((-(~&(8'hb5))) & (8'h9d)) | reg8);
              reg29 <= wire18;
            end
          reg30 <= $unsigned(({$signed({wire15}),
                  ($unsigned(reg27) ? (8'hae) : wire15)} ?
              reg7[(4'hf):(1'h0)] : ($signed((wire0 ?
                  reg6 : wire18)) <= {$signed((7'h44))})));
          if ((+$signed(reg20[(3'h6):(3'h4)])))
            begin
              reg31 <= reg21[(2'h2):(1'h0)];
              reg32 <= ($unsigned($signed($unsigned((wire1 * (7'h42))))) ?
                  reg14[(4'hc):(4'h8)] : {$unsigned(((reg12 ? reg7 : reg19) ?
                          (8'h9c) : reg11[(2'h3):(2'h2)])),
                      (((&wire3) ? reg25 : (|wire15)) <<< $signed((^~reg8)))});
              reg33 <= (($unsigned(reg14[(5'h10):(4'h8)]) ?
                  ($signed({wire3}) ^~ reg10) : reg14) < ($signed($unsigned((wire15 ^ reg6))) << $unsigned(reg19)));
              reg34 <= (($signed(reg25) ^ $signed(($signed(wire0) ?
                      (reg7 ? reg28 : reg28) : reg31[(3'h5):(3'h5)]))) ?
                  $unsigned($signed(((wire18 ^~ reg10) - (8'ha7)))) : reg5[(3'h7):(3'h7)]);
            end
          else
            begin
              reg31 <= (+(!((^~$signed(reg10)) * $signed($unsigned(reg20)))));
              reg32 <= (-(&$signed(({wire15, reg5} ?
                  {reg24, reg19} : (reg21 ? reg34 : reg6)))));
            end
        end
      else
        begin
          reg22 <= $unsigned($signed(reg29));
          reg23 <= {{(&({reg14, reg26} >> {reg13, reg9}))},
              (((^(~&reg9)) ? $unsigned($signed(reg12)) : (^~(reg5 << wire3))) ?
                  ($unsigned(reg7) >> $signed($unsigned(wire0))) : $signed((7'h43)))};
          reg24 <= ((wire15 != $signed((^$signed(wire17)))) ~^ reg20[(1'h0):(1'h0)]);
        end
    end
  assign wire35 = (({wire16, $signed((~(8'hbd)))} ?
                          $unsigned(((8'hbb) ?
                              (~^reg21) : (reg22 ? (8'h9d) : reg10))) : wire2) ?
                      (wire3[(1'h0):(1'h0)] ?
                          $signed(({reg7,
                              wire3} + $unsigned(wire2))) : $signed(({reg13,
                              reg8} + reg9))) : wire2);
endmodule
