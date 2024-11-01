module top
#(parameter param27 = (8'hb1), 
parameter param28 = param27)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
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
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned($unsigned($unsigned(((8'ha4) ^~ wire3)))));
      reg5 <= wire0[(3'h5):(2'h3)];
      reg6 <= (8'hbf);
      reg7 <= (&wire1[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ($signed(reg6))
        begin
          reg8 <= (wire3 - (($signed({(8'hb9)}) << {$signed((8'hb0))}) >>> reg5));
          if ((&($signed((-$signed(reg7))) || (8'hbb))))
            begin
              reg9 <= (^((~$signed($unsigned(reg4))) - wire2[(4'h8):(3'h7)]));
              reg10 <= (~^(~|(((+reg6) != {(8'had), reg9}) || $unsigned((wire2 ?
                  wire3 : reg7)))));
              reg11 <= (~(~$unsigned(($unsigned(wire0) ?
                  (reg7 ? reg4 : wire2) : $signed(reg7)))));
              reg12 <= ((($unsigned(((8'hb8) ? reg9 : reg5)) - ((8'ha4) ?
                      reg6 : (wire1 && reg7))) ?
                  wire0[(3'h4):(2'h2)] : ((!{(8'hbd), reg8}) ?
                      ((reg10 > wire0) ?
                          reg8 : (8'hac)) : reg11)) & $signed(((~&(reg11 >= (7'h40))) - (|((8'hb8) && reg6)))));
              reg13 <= (~&reg12);
            end
          else
            begin
              reg9 <= reg6[(3'h7):(2'h3)];
              reg10 <= wire2[(4'hb):(3'h4)];
              reg11 <= (!reg8[(1'h0):(1'h0)]);
              reg12 <= (~|reg4[(2'h3):(2'h3)]);
            end
          reg14 <= $unsigned((reg4 ?
              $unsigned($signed((~|(8'hbf)))) : ($signed((reg8 | wire0)) ?
                  {$signed(reg4),
                      (reg7 < reg11)} : $unsigned((reg5 > wire1)))));
          reg15 <= ((~(~$unsigned((reg9 ? wire3 : reg12)))) ?
              $unsigned((+$unsigned((8'hb8)))) : reg12);
        end
      else
        begin
          if ($unsigned((reg4[(3'h4):(2'h2)] ?
              $unsigned(($signed(reg12) && (wire3 ^~ reg4))) : (((reg7 || reg13) < (7'h44)) ?
                  $signed($unsigned(reg5)) : wire3))))
            begin
              reg8 <= (~|{wire3,
                  (reg4 ?
                      reg5[(1'h0):(1'h0)] : {reg8[(1'h1):(1'h0)],
                          $signed(reg6)})});
              reg9 <= (8'haf);
              reg10 <= (+$unsigned((|$unsigned(wire0[(1'h0):(1'h0)]))));
              reg11 <= wire1[(4'hd):(3'h4)];
              reg12 <= {reg12[(2'h3):(1'h0)],
                  {((8'hb3) ? reg10[(2'h3):(1'h0)] : $signed((|reg5))),
                      ((^reg4) ?
                          ((reg11 ?
                              reg6 : reg14) == (&reg6)) : reg9[(3'h5):(2'h2)])}};
            end
          else
            begin
              reg8 <= $unsigned((~reg12[(1'h1):(1'h0)]));
              reg9 <= ((~|$signed(reg7)) ? wire2[(2'h3):(1'h0)] : reg6);
              reg10 <= {(reg9[(1'h0):(1'h0)] ? reg4 : (reg10 <<< reg9)),
                  $unsigned(reg5[(4'h8):(2'h2)])};
              reg11 <= (|$unsigned(reg11));
            end
          reg13 <= {(reg4[(3'h4):(2'h2)] ?
                  (wire2 > $unsigned((wire2 & reg5))) : ((~^(+(8'hbf))) > {$unsigned(reg15)}))};
          reg14 <= (!$signed(((~|wire0) <= (~&(+reg7)))));
        end
      reg16 <= ($signed($signed(((-reg11) || reg5))) >> {($unsigned(reg5) >>> reg7),
          reg15});
      reg17 <= reg16[(3'h7):(3'h6)];
    end
  assign wire18 = reg14[(3'h5):(1'h1)];
  assign wire19 = $signed(((8'hbf) ? reg11 : (^~wire0)));
  assign wire20 = $unsigned((8'h9f));
  assign wire21 = wire2[(1'h1):(1'h0)];
  assign wire22 = $signed((({reg7,
                          (wire0 ? reg7 : (8'hb7))} - $signed($signed(reg16))) ?
                      $signed((~^(reg6 ? (8'ha5) : reg5))) : wire1));
  assign wire23 = reg15;
  assign wire24 = (&$unsigned($unsigned(reg9[(2'h2):(1'h1)])));
  assign wire25 = $signed(wire24);
  assign wire26 = wire1;
endmodule
