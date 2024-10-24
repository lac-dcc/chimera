module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire31,
                 wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire5,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= (wire0[(2'h2):(1'h0)] ?
          $signed(({(8'ha6),
              $unsigned(wire4)} | $unsigned((|(8'ha0))))) : (wire3 ?
              $signed($signed((wire0 ?
                  wire3 : wire3))) : wire5[(1'h1):(1'h1)]));
      reg7 <= $unsigned(((~^((!(7'h42)) ^ wire5)) ^ $signed(wire5)));
    end
  assign wire8 = wire4;
  always
    @(posedge clk) begin
      reg9 <= wire8;
      if ($signed(wire1[(4'h8):(4'h8)]))
        begin
          reg10 <= $signed(($unsigned(wire1) | ($signed($unsigned(wire5)) ?
              ((wire4 == wire4) ?
                  wire2[(1'h0):(1'h0)] : $signed(wire1)) : $signed(wire2))));
          reg11 <= (reg9[(4'hd):(4'ha)] ? (8'h9f) : (~&wire8[(2'h3):(1'h1)]));
        end
      else
        begin
          reg10 <= (~({$unsigned(wire2), $signed((wire2 ? reg11 : (8'ha5)))} ?
              $unsigned($signed(((8'hb6) ? reg7 : wire5))) : {wire3}));
        end
      reg12 <= $signed(wire0);
      reg13 <= (($unsigned(reg6[(2'h3):(1'h1)]) << ((~^wire0) ?
          ((~wire3) <<< $unsigned(wire4)) : (8'h9d))) <<< $unsigned((((reg6 ?
              reg9 : reg7) * wire1[(1'h0):(1'h0)]) ?
          ($unsigned(wire1) ? $unsigned(wire8) : (~&reg7)) : reg10)));
    end
  assign wire14 = $unsigned($signed($unsigned((wire4 >>> $unsigned((8'haa))))));
  assign wire15 = (wire4 < ((-(^~((7'h40) ? wire0 : wire3))) ?
                      ((8'h9f) ?
                          wire14 : $unsigned((wire0 << reg6))) : (~|((+wire0) ?
                          wire3 : $unsigned(wire5)))));
  assign wire16 = reg13;
  always
    @(posedge clk) begin
      reg17 <= wire14[(1'h0):(1'h0)];
      if ((^($signed({(|(8'haa)), (!wire0)}) & $signed((8'hbf)))))
        begin
          if ({(~^$unsigned(($unsigned(wire2) | (wire2 ? wire14 : (8'hbf))))),
              ((7'h40) ?
                  wire4[(2'h2):(1'h0)] : $signed(($unsigned(reg17) <<< (reg12 - reg6))))})
            begin
              reg18 <= {((((wire14 == (8'hbc)) ?
                              $unsigned(reg12) : (reg13 < reg17)) ?
                          $unsigned((reg10 <= reg9)) : wire15[(1'h0):(1'h0)]) ?
                      $unsigned((((8'hbc) ?
                          wire1 : reg10) >= (&wire3))) : {reg11}),
                  {$signed(wire15[(3'h5):(2'h3)])}};
              reg19 <= ($signed(({{reg7,
                          wire14}} - ($unsigned(wire5) ~^ reg10))) ?
                  {$unsigned($signed((reg13 > reg12)))} : reg12[(3'h5):(1'h0)]);
              reg20 <= $signed(((|(wire15 * $unsigned(reg7))) * (!({reg7,
                  reg10} | (8'hbd)))));
              reg21 <= ((8'h9c) << wire14[(4'h8):(3'h5)]);
              reg22 <= $signed((~&({(~reg17)} + reg9[(4'hb):(3'h7)])));
            end
          else
            begin
              reg18 <= $signed($signed($unsigned($unsigned((&reg10)))));
              reg19 <= $signed($signed(reg17));
              reg20 <= $unsigned((~^(&$signed(wire0[(4'he):(4'hc)]))));
              reg21 <= wire1[(4'ha):(3'h5)];
              reg22 <= reg11;
            end
          if ({(^~reg6[(3'h4):(3'h4)])})
            begin
              reg23 <= $unsigned((+(~(-(~reg7)))));
              reg24 <= ({(($unsigned((7'h42)) != reg9) ?
                      $unsigned((wire0 == wire16)) : $unsigned((wire16 ?
                          wire3 : wire16)))} ^~ wire16);
              reg25 <= reg10;
            end
          else
            begin
              reg23 <= ({(wire1[(3'h4):(2'h3)] ?
                      ($unsigned(reg20) ?
                          ((8'hb2) <<< reg9) : wire2[(1'h0):(1'h0)]) : {(~^reg12),
                          reg10[(4'ha):(4'h8)]})} >> (+$signed((^~wire15))));
              reg24 <= reg10;
            end
          reg26 <= ((~reg17) ?
              ((({reg10, reg25} ? (|wire2) : $unsigned((8'h9c))) ?
                  ((^reg24) | $unsigned(reg19)) : $unsigned(wire16[(1'h0):(1'h0)])) << ($signed($signed((8'hb9))) ?
                  wire15 : wire0[(2'h2):(2'h2)])) : wire5[(1'h0):(1'h0)]);
          reg27 <= $unsigned($unsigned(reg20));
          reg28 <= reg24;
        end
      else
        begin
          if (($unsigned(wire5) ?
              $signed($unsigned((reg22 ^~ (wire4 || reg9)))) : wire0))
            begin
              reg18 <= $unsigned((&$signed($unsigned($unsigned(reg18)))));
              reg19 <= wire15;
              reg20 <= (reg20[(3'h6):(1'h0)] & $signed($signed((reg23 + (+(8'hab))))));
              reg21 <= ({(~^(~&reg26[(2'h2):(1'h1)])), $signed(reg27)} ?
                  (~&(-reg12)) : (reg21[(3'h6):(2'h3)] >>> $unsigned($unsigned((~^reg24)))));
            end
          else
            begin
              reg18 <= (~^($unsigned(($signed(wire14) ?
                  (+reg26) : reg10)) + (wire0[(3'h4):(2'h3)] ~^ {(reg11 ?
                      reg28 : (8'hb3)),
                  reg26[(4'h8):(1'h1)]})));
              reg19 <= {reg11, wire2[(3'h7):(2'h3)]};
              reg20 <= reg9;
              reg21 <= ($signed((^$unsigned(reg27))) ?
                  $signed(reg26[(2'h2):(1'h1)]) : $signed((+(~^(reg13 >> reg7)))));
              reg22 <= ((wire4 > $signed(((reg18 == reg12) > $unsigned(reg21)))) ?
                  (8'had) : $unsigned((~^(~&reg27))));
            end
          reg23 <= {(|$signed((!((8'hb6) == reg17)))),
              ($unsigned((~^wire15[(3'h4):(1'h1)])) == reg11[(5'h10):(4'h8)])};
          reg24 <= $unsigned((8'ha9));
          if (reg18)
            begin
              reg25 <= $signed($unsigned($unsigned(reg25)));
            end
          else
            begin
              reg25 <= (8'had);
              reg26 <= {(8'ha9)};
              reg27 <= wire0[(4'hc):(1'h0)];
              reg28 <= reg26;
              reg29 <= reg11[(5'h12):(4'h8)];
            end
        end
      reg30 <= ((((reg28 ? $signed(wire5) : {reg24}) ?
              ((reg27 ? reg13 : reg18) != (wire3 ?
                  wire1 : reg10)) : {(reg13 ~^ (7'h43))}) ?
          ($signed($unsigned(wire2)) ?
              reg24[(2'h2):(1'h1)] : (reg13[(3'h5):(1'h0)] << wire1[(3'h4):(1'h1)])) : $unsigned($signed($signed((8'hb9))))) ^~ $unsigned($signed(reg19[(3'h6):(1'h0)])));
    end
  assign wire31 = $unsigned($signed($unsigned($unsigned((-wire5)))));
endmodule
