module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 wire18,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg31,
                 reg30,
                 reg29,
                 reg21,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {wire3, wire0[(2'h2):(2'h2)]};
      reg5 <= $unsigned(wire3);
      reg6 <= {reg4[(1'h0):(1'h0)],
          ((!((wire3 ? wire0 : wire3) ? (reg4 | (8'had)) : wire2)) ?
              (((~&wire1) - $signed((8'hb5))) ?
                  $unsigned($signed(reg4)) : $unsigned($unsigned(wire2))) : (wire1[(5'h11):(3'h5)] ?
                  reg5[(1'h0):(1'h0)] : {$unsigned(reg4)}))};
    end
  assign wire7 = ((reg4[(4'h8):(1'h0)] == ($unsigned($signed((8'ha7))) >= (((8'hb2) & reg4) || $unsigned(wire0)))) ?
                     (^$unsigned({$signed(reg5)})) : wire2);
  assign wire8 = (~$unsigned((~|$signed((wire1 ^ reg4)))));
  assign wire9 = (((((wire3 != wire7) ^ (!reg5)) ?
                         $signed(((8'hab) && wire8)) : (8'ha7)) >= reg4) ?
                     (($signed(wire1[(3'h6):(2'h2)]) <= $unsigned(reg5)) ?
                         (((~reg5) > (wire2 >>> wire8)) ?
                             wire7[(3'h5):(3'h4)] : wire2[(1'h1):(1'h0)]) : {{((8'ha0) ?
                                     wire0 : reg6)}}) : wire1[(2'h3):(1'h0)]);
  assign wire10 = $signed(((($unsigned(wire8) <<< $unsigned(reg6)) ^ $unsigned($signed(reg4))) - wire7[(3'h6):(3'h5)]));
  assign wire11 = (~^{(wire8[(3'h4):(1'h1)] ~^ (-reg4[(1'h0):(1'h0)]))});
  always
    @(posedge clk) begin
      if ((~(-($signed((~wire2)) ? reg6 : $signed($signed(wire2))))))
        begin
          if (wire8)
            begin
              reg12 <= $unsigned(wire11);
              reg13 <= $signed(wire10[(1'h1):(1'h1)]);
              reg14 <= ((^~(-$signed(reg13[(4'hc):(3'h4)]))) ^ reg4);
              reg15 <= ((~&$unsigned((wire1[(4'h9):(2'h2)] * {reg13, reg12}))) ?
                  {(+$unsigned($unsigned(reg14)))} : (~^((~^wire0) - wire7)));
            end
          else
            begin
              reg12 <= $unsigned((reg15 ?
                  (((reg15 ? reg5 : wire11) ?
                      reg4 : (~|wire2)) >> $signed(wire9[(4'he):(4'ha)])) : $unsigned(wire0)));
              reg13 <= $unsigned(($signed(reg6[(5'h10):(3'h4)]) * {wire8}));
              reg14 <= {$signed((~{{wire0}, wire3}))};
              reg15 <= $unsigned(wire9);
              reg16 <= (((&$signed($unsigned(wire7))) ?
                  (^({reg14, (8'h9e)} ?
                      (reg15 ?
                          reg5 : (8'ha1)) : wire10[(3'h4):(2'h3)])) : {$signed($unsigned(reg12))}) ^~ wire8[(2'h3):(2'h3)]);
            end
          reg17 <= $unsigned(reg14);
        end
      else
        begin
          reg12 <= $unsigned(wire8[(2'h3):(1'h1)]);
          reg13 <= $unsigned(reg17);
          reg14 <= {(-($signed($signed(wire1)) ?
                  $unsigned((wire3 ~^ (8'hb5))) : (wire3[(2'h3):(2'h3)] ?
                      reg15 : $signed(reg12)))),
              wire7[(1'h0):(1'h0)]};
          reg15 <= $signed({wire1});
        end
    end
  assign wire18 = {$unsigned((!(^~$unsigned(reg17)))),
                      (-(($signed(wire8) ?
                              $unsigned((8'hae)) : $signed(reg14)) ?
                          $unsigned(reg15[(4'hd):(4'h9)]) : $unsigned((wire9 ?
                              wire0 : reg16))))};
  assign wire19 = reg17[(3'h6):(3'h5)];
  assign wire20 = (|(wire19[(4'hf):(2'h2)] && ((8'hbd) < {wire3,
                      wire19[(4'hc):(3'h6)]})));
  always
    @(posedge clk) begin
      reg21 <= ({reg14[(1'h0):(1'h0)]} != (wire7[(1'h1):(1'h1)] ^~ (wire9 ?
          reg6 : $signed((wire3 ? reg12 : wire2)))));
    end
  assign wire22 = $signed(reg12[(4'h9):(1'h1)]);
  assign wire23 = {(|$signed((~^reg6)))};
  assign wire24 = (+(wire11 || $unsigned(wire10)));
  assign wire25 = $signed(($signed($unsigned(wire18)) ?
                      ((~{(8'ha4)}) ?
                          (wire2 & $signed((8'hae))) : $unsigned({wire24,
                              reg21})) : $signed(((~&reg14) ~^ ((8'hbb) > reg5)))));
  assign wire26 = ({wire8[(2'h3):(2'h2)],
                          ($unsigned(((8'haf) ?
                              wire3 : (8'ha5))) >> ($unsigned(wire24) ?
                              $unsigned(reg5) : (~wire1)))} ?
                      (wire10 ?
                          $signed(((wire23 ? wire19 : (8'hbc)) ?
                              wire10 : (|wire20))) : (^wire20)) : $signed((({reg17} | $unsigned(reg14)) + wire2)));
  assign wire27 = (wire1 <= ($unsigned($unsigned($unsigned(reg21))) != $unsigned(reg14)));
  assign wire28 = (wire7[(2'h3):(2'h2)] > (!{($unsigned(wire23) ?
                          ((8'hbe) * reg4) : reg16)}));
  always
    @(posedge clk) begin
      reg29 <= wire18[(1'h0):(1'h0)];
      reg30 <= ($signed($unsigned((reg4[(3'h5):(2'h2)] <= (wire28 ?
              reg21 : reg4)))) ?
          (+$signed($signed(wire24[(4'h9):(2'h3)]))) : (~&$signed($unsigned(reg15[(3'h4):(2'h2)]))));
      reg31 <= $unsigned($signed((wire0 >= reg17)));
    end
endmodule
