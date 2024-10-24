module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire30,
                 wire23,
                 wire22,
                 wire17,
                 wire16,
                 reg33,
                 reg32,
                 reg31,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg15,
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
      reg5 <= (wire4 ?
          ($unsigned({(~&wire2), {wire1, wire4}}) ?
              {wire2[(4'hb):(4'ha)]} : $unsigned(((wire2 && wire0) > wire2))) : wire1);
      reg6 <= reg5[(2'h2):(1'h0)];
      if ((8'h9f))
        begin
          reg7 <= reg5[(1'h1):(1'h1)];
          reg8 <= (~((wire4 & (~reg5)) <= (-(~^(wire0 ? reg7 : (8'hbc))))));
          if ($signed({(((reg8 ?
                  reg5 : wire1) >>> $signed(reg6)) | reg5[(2'h2):(2'h2)]),
              reg8[(3'h6):(2'h2)]}))
            begin
              reg9 <= (wire3[(4'hb):(1'h1)] >> ((&$signed((~wire2))) >>> wire3));
              reg10 <= reg7;
              reg11 <= (wire4 <<< wire3);
              reg12 <= (reg9 | (wire3 ?
                  $signed(wire0) : (wire0[(2'h2):(1'h1)] ?
                      ($unsigned(wire1) || $signed(reg7)) : {reg8[(3'h7):(3'h6)],
                          $unsigned(reg10)})));
              reg13 <= (($signed($unsigned($unsigned(reg5))) ^~ (($signed(wire3) ?
                          reg7 : $signed(reg8)) ?
                      ($unsigned(wire4) * $unsigned((8'hb8))) : ($signed(reg7) || reg9))) ?
                  reg5 : reg11);
            end
          else
            begin
              reg9 <= (^reg6);
              reg10 <= reg6;
              reg11 <= ((reg12 != (&$unsigned(reg13[(4'h9):(2'h3)]))) ?
                  reg9[(1'h1):(1'h1)] : $unsigned(((&$unsigned(reg11)) ^~ {$signed(reg13),
                      wire3[(1'h0):(1'h0)]})));
              reg12 <= reg7;
            end
          reg14 <= $signed((~|$signed({$signed((8'h9f))})));
        end
      else
        begin
          reg7 <= ($unsigned(reg7) != $unsigned($unsigned((~^$signed(reg6)))));
          reg8 <= wire1[(1'h0):(1'h0)];
          if (((reg9 ?
              $signed(wire0[(1'h1):(1'h0)]) : reg14) << $signed(reg13[(4'hf):(3'h6)])))
            begin
              reg9 <= (reg10[(3'h6):(3'h4)] ?
                  (((~|((8'hb2) << reg5)) ?
                          $unsigned((reg6 ?
                              wire4 : (8'hbd))) : reg12[(5'h11):(4'hb)]) ?
                      wire2 : wire1) : {$signed({(reg8 ? reg5 : reg6)})});
            end
          else
            begin
              reg9 <= ((reg14[(3'h7):(3'h4)] ?
                  (&wire4[(3'h5):(1'h1)]) : $unsigned(((^wire3) ?
                      reg10 : (~&wire1)))) - (|(wire0 * (~^(-(8'h9c))))));
              reg10 <= {reg5};
              reg11 <= {$signed($signed({$signed(reg9)}))};
              reg12 <= $unsigned(($signed(($unsigned(reg10) ~^ {(8'ha0),
                  (8'had)})) - (~&$unsigned((wire1 ~^ reg8)))));
            end
          reg13 <= wire4;
          reg14 <= (~|(((!reg11[(3'h4):(1'h0)]) ?
              {reg8[(2'h2):(2'h2)]} : ((wire2 ? (8'ha1) : (8'h9f)) ?
                  (&reg9) : (wire0 ? reg10 : reg11))) >> {$unsigned((reg8 ?
                  reg5 : reg5))}));
        end
    end
  always
    @(posedge clk) begin
      reg15 <= (wire0 * ($unsigned(($signed(reg12) ?
          $signed(reg5) : wire0)) && $signed(((~|reg13) >> wire1[(1'h0):(1'h0)]))));
    end
  assign wire16 = reg8;
  assign wire17 = $signed(reg11[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg18 <= (^~reg9);
      reg19 <= wire1[(3'h4):(1'h0)];
      reg20 <= {({((reg12 ?
                  reg11 : reg6) ^~ $unsigned(wire3))} ^ reg8[(1'h0):(1'h0)])};
      reg21 <= $unsigned($signed(($signed((wire1 ? reg19 : reg15)) ?
          ($signed(reg14) ?
              (-reg12) : {reg8, wire16}) : reg19[(3'h4):(3'h4)])));
    end
  assign wire22 = {((~(8'hac)) > $unsigned({$unsigned(wire4)})),
                      $signed({((reg19 || (8'h9f)) ?
                              (reg5 <= wire16) : $signed(reg18))})};
  assign wire23 = (reg15 >= wire16);
  always
    @(posedge clk) begin
      reg24 <= wire1;
      reg25 <= wire23;
      reg26 <= $signed($signed($unsigned(wire3[(4'he):(2'h2)])));
    end
  always
    @(posedge clk) begin
      reg27 <= {(($signed((reg12 ? reg20 : wire17)) ?
                  ($signed(reg25) << $unsigned(reg24)) : $unsigned(reg14)) ?
              (|$signed(reg26)) : reg8[(3'h5):(1'h0)]),
          wire2[(4'h9):(2'h3)]};
      reg28 <= ($unsigned(((~|(wire0 ^~ wire17)) ?
              $signed($signed(wire17)) : $signed($signed(reg20)))) ?
          $signed(reg7[(1'h0):(1'h0)]) : (((!{reg14}) ?
              (reg9[(1'h0):(1'h0)] ?
                  reg14 : $unsigned(reg27)) : $unsigned((reg19 ?
                  reg12 : reg19))) < reg21));
    end
  always
    @(posedge clk) begin
      reg29 <= reg26[(1'h1):(1'h0)];
    end
  assign wire30 = reg10;
  always
    @(posedge clk) begin
      reg31 <= $unsigned(reg14[(5'h14):(2'h2)]);
      reg32 <= ($signed(((~|wire30[(3'h5):(1'h0)]) >> wire2)) ?
          (($signed(wire23) + {{reg15, reg31}, (wire4 ? reg15 : (8'haf))}) ?
              (reg25 | $unsigned($signed(reg15))) : reg29) : (wire4[(1'h0):(1'h0)] & ((reg29 ?
                  (reg27 || (8'hb9)) : (&wire23)) ?
              ((reg5 < (8'hb9)) ?
                  (~^(8'hb8)) : $unsigned(reg26)) : $unsigned($unsigned((8'hb0))))));
      reg33 <= $signed(reg5);
    end
  assign wire34 = reg12[(4'ha):(1'h0)];
  assign wire35 = $signed($unsigned(wire4[(4'hd):(3'h6)]));
  assign wire36 = (|reg21);
  assign wire37 = reg8[(1'h0):(1'h0)];
endmodule
