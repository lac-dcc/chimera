module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  assign y = {wire55,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire5,
                 reg54,
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
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire5 = $signed((wire2 != (8'hbb)));
  module6 #() modinst30 (wire29, clk, wire5, wire2, wire3, wire4);
  assign wire31 = wire0;
  assign wire32 = (($unsigned(wire5) >>> (~wire0[(1'h1):(1'h1)])) >> wire3[(2'h2):(2'h2)]);
  assign wire33 = wire5;
  assign wire34 = $signed((((8'ha1) ?
                          (wire33[(3'h4):(3'h4)] ?
                              (wire32 >= wire33) : $signed(wire33)) : $signed($unsigned(wire29))) ?
                      $signed($signed($unsigned(wire1))) : (($unsigned(wire33) << (wire29 ?
                              wire29 : wire5)) ?
                          wire29[(2'h2):(1'h1)] : (wire33[(3'h6):(3'h5)] ?
                              (7'h41) : (wire3 >> wire3)))));
  assign wire35 = wire33;
  assign wire36 = $unsigned(wire34[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg37 <= wire1;
      reg38 <= (wire0 ?
          ({$unsigned({(8'haa), wire33}),
              ($signed(wire2) && $unsigned(wire35))} <= wire33[(4'hb):(4'ha)]) : (reg37[(1'h1):(1'h0)] ?
              wire0 : $unsigned(wire32)));
      if ((((~&(((7'h40) || wire36) ^~ {wire32, wire36})) + reg37) ?
          {(|$signed(reg37)), $signed($unsigned($signed(wire34)))} : wire2))
        begin
          if ($unsigned($signed($signed($unsigned((wire0 ? wire36 : wire1))))))
            begin
              reg39 <= wire5;
              reg40 <= wire34[(3'h7):(1'h0)];
              reg41 <= (!$unsigned(wire34[(2'h2):(2'h2)]));
              reg42 <= $signed(($unsigned($unsigned((^reg37))) < ({$signed((8'hb2))} + (!((8'hb1) == wire2)))));
              reg43 <= $unsigned(({(wire29[(2'h2):(2'h2)] ?
                          wire0 : {wire36, wire33})} ?
                  (((~wire36) ? wire4 : (wire4 <<< reg38)) ?
                      (~^$signed(reg40)) : $signed((wire35 << wire35))) : reg42[(4'ha):(2'h2)]));
            end
          else
            begin
              reg39 <= wire29;
              reg40 <= wire33;
              reg41 <= ((wire5[(2'h2):(2'h2)] ?
                  $unsigned($signed($unsigned(wire1))) : wire3[(4'hf):(2'h3)]) && $signed(reg42[(1'h0):(1'h0)]));
              reg42 <= reg38[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg39 <= $unsigned($signed((($signed(reg40) ^ (wire2 >>> reg37)) ?
              ((wire1 ~^ wire32) * $unsigned(wire3)) : $signed($unsigned(wire2)))));
          reg40 <= (8'ha3);
          if (wire35)
            begin
              reg41 <= wire1[(3'h7):(3'h4)];
              reg42 <= $signed(wire36[(1'h0):(1'h0)]);
            end
          else
            begin
              reg41 <= (reg38[(3'h5):(1'h1)] ?
                  {wire36} : ((wire4 >> (~$unsigned(wire34))) ?
                      $unsigned(($unsigned(wire5) ^ (~&reg38))) : ((wire0[(1'h0):(1'h0)] ?
                          $signed((8'hb0)) : (wire32 && wire4)) < (7'h42))));
              reg42 <= $signed((reg37 >= {$unsigned($signed(wire1))}));
              reg43 <= wire32;
              reg44 <= $signed($unsigned((~&wire31[(5'h10):(2'h2)])));
              reg45 <= (reg41 ?
                  (^$signed($unsigned($unsigned(reg37)))) : {(~|(+$signed(wire29)))});
            end
        end
      if (wire29)
        begin
          reg46 <= wire2[(4'hb):(2'h3)];
          if ($signed(wire35))
            begin
              reg47 <= ((wire3[(4'h8):(3'h4)] ?
                      (reg43[(3'h4):(2'h2)] ?
                          (~&$signed(reg39)) : $signed((reg42 >> wire5))) : reg40[(3'h4):(3'h4)]) ?
                  ((reg42[(4'hf):(4'hf)] ?
                          (wire4 ?
                              $signed(reg41) : (wire4 ?
                                  (8'ha6) : wire4)) : (8'ha4)) ?
                      ((!{reg37}) >>> wire2[(4'h8):(3'h4)]) : $unsigned(wire5)) : wire3);
              reg48 <= (reg41[(2'h3):(1'h1)] ?
                  (wire5[(4'hc):(2'h2)] || $unsigned((~^$signed(wire1)))) : ($signed(wire36) != (reg37 + wire36)));
              reg49 <= $signed({$unsigned(($unsigned(wire1) > wire4[(3'h7):(2'h2)])),
                  reg47[(2'h2):(2'h2)]});
              reg50 <= $signed((^~(&{{wire3}})));
              reg51 <= ({(reg49[(1'h1):(1'h1)] ?
                      ($unsigned(reg42) ?
                          {reg40} : (reg47 ? reg43 : reg47)) : (-reg50)),
                  ((^(^~wire29)) ?
                      $signed((wire2 || reg50)) : {wire5[(1'h1):(1'h0)]})} >= wire3[(2'h2):(2'h2)]);
            end
          else
            begin
              reg47 <= (~&$unsigned((^reg41[(3'h5):(3'h4)])));
              reg48 <= wire4[(1'h1):(1'h0)];
              reg49 <= (8'ha5);
              reg50 <= (($unsigned((~(wire1 ? reg38 : reg37))) ?
                  {((~|reg48) ~^ (wire3 ? reg48 : reg37)),
                      $unsigned(wire1)} : $unsigned($unsigned((reg40 | (8'had))))) < $unsigned((reg44 ?
                  $unsigned((wire33 ~^ (8'ha8))) : (+$unsigned(reg45)))));
            end
          if ((8'hb0))
            begin
              reg52 <= wire36[(1'h1):(1'h0)];
            end
          else
            begin
              reg52 <= ($unsigned(wire36[(1'h1):(1'h0)]) ^ ({$unsigned({wire29})} > $unsigned({(wire5 & reg46)})));
            end
          if (reg40[(3'h4):(1'h1)])
            begin
              reg53 <= reg46;
              reg54 <= $unsigned({$signed($unsigned(wire31[(5'h11):(4'hd)])),
                  $unsigned(reg49)});
            end
          else
            begin
              reg53 <= (((((~&(8'ha7)) == {reg51, wire2}) ?
                  (^~$unsigned((8'had))) : (wire35[(4'hc):(3'h7)] ?
                      (reg40 - reg38) : (wire35 ?
                          reg48 : reg48))) + $unsigned(reg44[(2'h2):(1'h0)])) || (wire1[(4'hf):(3'h7)] << wire33));
              reg54 <= (((|((reg40 ?
                  reg38 : wire0) >>> $unsigned(wire29))) ^ {(^(reg39 == reg52)),
                  reg52[(1'h0):(1'h0)]}) + (~^$unsigned({((8'hb0) & reg40)})));
            end
        end
      else
        begin
          reg46 <= $signed(wire36);
          reg47 <= ((((~&(reg45 ? (8'h9e) : reg51)) ?
                  ((~|reg37) ?
                      (+wire1) : (reg47 ?
                          wire1 : wire2)) : $unsigned($unsigned(wire3))) != $signed(wire2[(4'hf):(4'he)])) ?
              (&(((wire2 >> wire0) ?
                  reg43 : wire32) <= $signed(reg38[(3'h7):(3'h7)]))) : $signed(wire36[(1'h0):(1'h0)]));
          reg48 <= wire36;
          reg49 <= $unsigned((~(7'h41)));
          reg50 <= {(($unsigned(reg40[(1'h0):(1'h0)]) ?
                  ({reg51, reg41} ?
                      ((8'hbf) >= reg44) : wire36[(1'h0):(1'h0)]) : $signed($unsigned(reg50))) ~^ (wire35 < ($signed(reg53) ?
                  reg37[(1'h0):(1'h0)] : $signed(reg38))))};
        end
    end
  assign wire55 = $signed(($signed(($signed(reg54) >>> $signed(reg46))) < $signed((reg47 != (wire0 ?
                      (8'hb6) : wire29)))));
endmodule

module module6
#(parameter param27 = ((~^((!((8'hb5) ? (8'hae) : (8'haa))) == ((!(8'ha2)) ? ((8'haa) ? (8'ha1) : (8'hbd)) : (8'hb5)))) >>> (8'hb6)), 
parameter param28 = (!param27))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire11;
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire11,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = (8'hab);
  always
    @(posedge clk) begin
      reg12 <= $unsigned((^~wire11));
      reg13 <= ($unsigned((^~$unsigned({wire11}))) ?
          ((~^$unsigned((~|wire9))) > $unsigned(($signed((8'hb6)) ?
              (8'hba) : {reg12,
                  wire9}))) : (~|($signed(wire8) & $unsigned({wire9}))));
      reg14 <= (($unsigned(reg13) ?
          reg12[(2'h2):(1'h1)] : (|(wire11 ?
              wire11 : $unsigned(wire11)))) && wire7[(2'h3):(1'h1)]);
      reg15 <= $unsigned((~^reg13[(2'h2):(1'h1)]));
      reg16 <= wire11[(2'h3):(1'h1)];
    end
  assign wire17 = ((wire7 <<< wire8) ?
                      (~^(^~$signed($unsigned(reg14)))) : {reg14});
  assign wire18 = $unsigned(($unsigned(reg14) >= $signed({(wire11 ^~ (8'h9d)),
                      reg12})));
  assign wire19 = ({reg13[(1'h1):(1'h0)]} ^~ {$signed(($signed(wire7) ^~ (-wire8))),
                      (wire8 && wire11)});
  always
    @(posedge clk) begin
      reg20 <= wire8[(3'h6):(2'h3)];
      reg21 <= wire8[(4'hd):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg22 <= ($signed($unsigned(($unsigned(wire11) ?
          $unsigned(wire7) : (8'hae)))) <<< (wire7[(2'h3):(1'h1)] << wire9));
      reg23 <= {((!(reg13[(2'h3):(1'h1)] >> $signed(wire11))) > wire11)};
      reg24 <= $unsigned((+$unsigned(wire19)));
      reg25 <= $unsigned(reg16[(1'h0):(1'h0)]);
      reg26 <= $signed(((wire17[(3'h7):(3'h5)] ^~ $unsigned($signed(wire19))) ?
          (((wire17 ? wire9 : wire17) ?
              wire11 : wire9[(3'h5):(2'h3)]) || {(reg14 | wire10)}) : (((wire7 ?
              (8'ha0) : wire7) * ((7'h40) >> wire18)) & $signed(wire11[(1'h1):(1'h1)]))));
    end
endmodule
