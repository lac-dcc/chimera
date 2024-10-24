module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h251):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire50,
                 wire37,
                 wire36,
                 wire35,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire16,
                 wire15,
                 wire13,
                 wire12,
                 wire4,
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
                 reg34,
                 reg33,
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
                 reg14,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (^wire2);
  always
    @(posedge clk) begin
      reg5 <= (+$unsigned((8'hb1)));
      reg6 <= $signed((!wire2[(4'hf):(1'h0)]));
      reg7 <= wire2[(4'he):(4'hd)];
      if (((~wire2) ?
          ({$unsigned($signed(wire1)), $signed((~^(8'h9e)))} && (wire3 ?
              (8'hb7) : (~|$signed(wire2)))) : {(!reg5[(3'h7):(2'h3)])}))
        begin
          if ($unsigned((&(&reg5))))
            begin
              reg8 <= (((({reg5,
                  wire4} < $unsigned(reg7)) + reg6) >= (!wire3)) - wire3[(3'h4):(3'h4)]);
            end
          else
            begin
              reg8 <= ($signed((reg8 ~^ reg8[(4'h8):(3'h4)])) ~^ (&{wire2[(2'h3):(2'h2)]}));
            end
          reg9 <= {$unsigned($signed(((wire0 ?
                  wire4 : (8'hb8)) || $unsigned(wire2))))};
          reg10 <= ({({{wire4,
                          wire3}} & (wire2[(3'h4):(1'h1)] | $signed((8'hb6))))} ?
              ((!wire3[(1'h0):(1'h0)]) ?
                  (-$unsigned(((8'h9d) * wire1))) : ((reg5[(1'h1):(1'h0)] >> wire2) ?
                      $unsigned(wire3[(3'h7):(1'h1)]) : (~&$unsigned(wire4)))) : wire3);
        end
      else
        begin
          reg8 <= $unsigned($signed(((reg10[(4'hb):(4'h8)] ?
                  $signed(wire3) : (+wire0)) ?
              $unsigned(reg10[(1'h0):(1'h0)]) : ((reg7 ?
                  reg10 : wire0) || reg10))));
          reg9 <= reg9[(3'h5):(2'h2)];
          reg10 <= $signed(((~(&reg5[(4'hc):(3'h7)])) ?
              reg5[(4'h8):(3'h7)] : (reg5[(4'hd):(4'hc)] ?
                  wire4[(3'h6):(2'h3)] : (&wire2[(2'h3):(2'h3)]))));
          reg11 <= reg8[(3'h4):(1'h1)];
        end
    end
  assign wire12 = reg8[(5'h14):(4'hf)];
  assign wire13 = wire0;
  always
    @(posedge clk) begin
      reg14 <= $signed((wire4[(3'h4):(3'h4)] ^ ({(wire12 ? wire1 : (7'h44)),
              $unsigned((7'h42))} ?
          reg9[(3'h6):(2'h2)] : ((wire13 ? wire2 : reg8) ?
              $unsigned(reg5) : {wire4, wire0}))));
    end
  assign wire15 = $unsigned((({$unsigned(wire1)} + $unsigned((~&reg7))) + reg7[(2'h2):(1'h0)]));
  assign wire16 = wire4[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((($unsigned($signed(wire4)) ?
              ($signed((reg5 | (7'h42))) & $signed($signed(wire12))) : (($signed(reg6) ?
                  (wire3 && (8'ha2)) : reg7[(1'h0):(1'h0)]) <= $signed($signed(wire4)))) ?
          wire16[(1'h1):(1'h0)] : $signed((7'h42))))
        begin
          reg17 <= ((~^reg10) - (&{$unsigned(reg7[(1'h0):(1'h0)])}));
          reg18 <= wire1;
          reg19 <= reg10;
        end
      else
        begin
          reg17 <= wire0;
          reg18 <= (($unsigned(((wire12 <= reg10) & (^~(8'hbd)))) ?
              ((8'hb6) ?
                  (~wire4) : ((reg5 << wire1) >> reg8[(5'h11):(4'he)])) : $signed(((reg17 ?
                  wire13 : (8'hb7)) <= reg11))) && wire0[(4'he):(1'h0)]);
          if ($signed($signed($unsigned((reg8 ? reg5 : $unsigned(wire12))))))
            begin
              reg19 <= ($unsigned((8'hbf)) ?
                  wire2 : (!((wire3[(4'hb):(4'hb)] >= $unsigned(reg7)) ?
                      ($signed(wire12) << (+wire16)) : wire12[(3'h5):(2'h2)])));
              reg20 <= {$unsigned($unsigned(reg11[(1'h0):(1'h0)])),
                  (((reg10 * (wire2 != wire12)) ?
                      ((reg17 ? reg5 : reg7) ?
                          wire0 : $unsigned(reg9)) : $signed((8'ha3))) <= ($unsigned($unsigned(wire4)) <<< wire2))};
              reg21 <= (wire0[(4'hc):(4'h9)] ^~ (reg14 ?
                  $unsigned((~reg17[(4'hb):(4'ha)])) : (~reg7)));
              reg22 <= reg9[(3'h5):(3'h5)];
              reg23 <= $unsigned($signed(wire12[(3'h5):(1'h1)]));
            end
          else
            begin
              reg19 <= wire2[(4'h9):(2'h2)];
              reg20 <= (^~(|$signed({(^~reg11)})));
              reg21 <= ((^wire16[(2'h3):(2'h2)]) ?
                  (reg14 || reg6[(1'h0):(1'h0)]) : $signed((((reg17 >>> reg9) ?
                          (wire2 ^~ reg17) : (~(8'hbc))) ?
                      ({reg7} ?
                          $signed(reg18) : wire0[(1'h0):(1'h0)]) : (((8'ha9) >>> wire4) ?
                          ((8'ha7) < reg9) : wire16))));
              reg22 <= reg14[(2'h3):(2'h3)];
              reg23 <= wire0[(4'ha):(4'h9)];
            end
          reg24 <= ((reg17[(1'h0):(1'h0)] - wire16[(2'h3):(1'h1)]) == $unsigned($unsigned((wire0[(4'he):(4'he)] ?
              wire4[(2'h2):(1'h1)] : (reg9 == reg21)))));
          reg25 <= $unsigned((~|reg10));
        end
      if (({(reg19[(3'h4):(2'h2)] ?
              wire16 : ($unsigned(wire16) ? (reg24 && reg20) : (&wire3))),
          ($signed((wire15 ^ reg5)) ^~ ((~|(7'h40)) * $unsigned((8'hb6))))} >>> ((+reg9) ?
          $signed(reg19[(2'h2):(1'h1)]) : $signed((~|reg7)))))
        begin
          reg26 <= ((+$unsigned($signed((wire15 ?
              wire1 : wire2)))) || {(-(&(~&wire1)))});
          reg27 <= reg22[(1'h0):(1'h0)];
        end
      else
        begin
          reg26 <= (!reg23);
        end
      reg28 <= (^~(-(!(reg11[(4'hd):(2'h2)] | (reg17 ? (8'hbf) : wire4)))));
    end
  assign wire29 = (reg28 * $signed(reg24[(4'ha):(1'h1)]));
  assign wire30 = ({{(~&$unsigned(reg24))},
                      (^(-(reg25 ^~ reg7)))} ^ ($signed((wire16[(1'h1):(1'h1)] - (reg27 ^ reg28))) ?
                      (reg23 ?
                          {$unsigned(wire2),
                              wire4[(3'h7):(1'h0)]} : ((reg26 * (8'hb7)) ?
                              $signed((8'haf)) : (wire16 ?
                                  (8'hb5) : wire15))) : (8'hbe)));
  assign wire31 = {{(wire13 + ($signed(reg26) <<< {reg26, reg19}))},
                      ($signed((~|(-reg20))) * $signed($unsigned(wire2)))};
  assign wire32 = wire3;
  always
    @(posedge clk) begin
      reg33 <= {(wire1[(4'ha):(2'h2)] ?
              (~|wire0[(4'h8):(3'h4)]) : $unsigned(reg24)),
          (reg18[(4'h9):(2'h2)] < reg26)};
      reg34 <= $signed(wire13);
    end
  assign wire35 = (+(&reg25[(2'h2):(1'h0)]));
  assign wire36 = (~|(+wire2[(2'h3):(1'h0)]));
  assign wire37 = (reg22 ^ wire36);
  always
    @(posedge clk) begin
      if (wire31)
        begin
          reg38 <= (^~(((|wire32) >= ((reg7 <= (8'hae)) == reg25)) ?
              $unsigned((-$signed(reg14))) : ((~&(+wire32)) & ({reg21} ?
                  reg27 : wire31[(3'h5):(2'h2)]))));
          if (wire1)
            begin
              reg39 <= reg28;
              reg40 <= reg6[(3'h6):(3'h6)];
              reg41 <= reg21;
              reg42 <= $signed($signed(reg23[(4'h8):(2'h2)]));
              reg43 <= $unsigned(reg5);
            end
          else
            begin
              reg39 <= wire36;
            end
          reg44 <= $signed(($signed($unsigned({reg27, reg21})) >= wire4));
          reg45 <= $signed(((wire0[(4'hd):(3'h5)] | $unsigned((^wire29))) <= (&(~wire29[(4'hb):(4'h9)]))));
          reg46 <= wire16;
        end
      else
        begin
          reg38 <= ({$signed({wire36[(4'hc):(2'h2)]}),
              {{reg9}}} <= $signed((reg45[(5'h11):(4'hf)] + ($signed(reg24) << reg39[(1'h0):(1'h0)]))));
          reg39 <= (-reg42);
          reg40 <= (&$unsigned({(~^reg23), $signed(reg11)}));
          reg41 <= wire32[(4'he):(1'h0)];
          reg42 <= (~^reg40[(2'h3):(2'h3)]);
        end
      reg47 <= $signed(((-$unsigned(reg33[(2'h2):(1'h0)])) <<< $unsigned(wire16)));
      reg48 <= ((!(-reg8)) ?
          ($unsigned($signed($unsigned((8'hbb)))) ?
              (8'haf) : wire0[(4'hc):(3'h7)]) : $signed((|reg22[(1'h0):(1'h0)])));
      reg49 <= (reg17[(1'h0):(1'h0)] ?
          (&{$signed((wire3 ? reg17 : (8'hac))),
              ($signed((8'ha3)) ? (~wire1) : reg46[(4'h9):(4'h8)])}) : (reg47 ?
              $signed(((&(8'hac)) ? (|reg23) : wire35)) : reg46));
    end
  assign wire50 = ({{$signed((wire3 ? (7'h40) : wire0))}} ?
                      reg49[(4'hd):(4'ha)] : reg43[(1'h1):(1'h1)]);
endmodule
