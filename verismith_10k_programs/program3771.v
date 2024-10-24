module top
#(parameter param36 = (((~&(8'hba)) ? (-({(8'hb4), (8'ha8)} ^ ((8'ha9) ? (8'hb6) : (8'hac)))) : ((8'hb2) >>> ((~|(8'h9d)) || {(8'hb9)}))) ? {((((8'hb7) * (7'h42)) ? (7'h42) : (-(8'hb7))) ? {(8'hbc), (!(8'h9d))} : (|(&(8'hbf)))), (((7'h40) ? ((8'hac) << (8'hbd)) : (^~(8'hbf))) ? ((~|(7'h41)) == ((8'haa) > (7'h42))) : (((8'hb1) <<< (8'haf)) ? (~^(8'ha6)) : (8'haf)))} : ((~|(~^{(8'hbb)})) ? (~^{{(8'ha6)}, (&(7'h40))}) : {(((8'hbb) ? (8'ha3) : (8'ha1)) - {(8'hbe), (8'h9c)})})), 
parameter param37 = param36)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire28,
                 wire4,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg5 <= (+wire1[(1'h1):(1'h0)]);
      reg6 <= $unsigned((8'haf));
      if ({($unsigned(wire3[(1'h0):(1'h0)]) << $unsigned(((reg5 >>> reg5) | wire3)))})
        begin
          reg7 <= wire4;
          reg8 <= (+$unsigned((|$signed(wire1))));
          reg9 <= (!reg7[(3'h4):(1'h1)]);
          reg10 <= (($signed({(~|reg9), wire2}) + $signed(($unsigned(reg5) ?
                  reg9 : (wire2 ? reg7 : wire2)))) ?
              ($signed($signed((wire3 ? wire0 : wire3))) << (wire0 ?
                  (((8'hbb) ? wire3 : reg6) ~^ $unsigned(reg5)) : ((-reg6) ?
                      ((8'hae) ? wire4 : reg8) : (wire2 ?
                          wire3 : reg9)))) : reg9);
          reg11 <= (|$signed(((|wire2[(4'hf):(4'hf)]) + (^$unsigned(reg7)))));
        end
      else
        begin
          reg7 <= wire0[(1'h0):(1'h0)];
          reg8 <= reg10;
          reg9 <= (&reg7[(4'hc):(2'h2)]);
        end
      reg12 <= reg9;
      if (wire1[(3'h5):(1'h0)])
        begin
          reg13 <= (reg9 <= (+wire3[(3'h4):(1'h1)]));
          if ($signed($unsigned((&wire2[(1'h1):(1'h1)]))))
            begin
              reg14 <= reg13;
              reg15 <= wire2[(5'h12):(4'he)];
              reg16 <= reg11[(4'hb):(3'h5)];
            end
          else
            begin
              reg14 <= $unsigned(((((reg7 ?
                  reg6 : reg9) == reg7[(3'h7):(1'h0)]) | ((&wire0) ?
                  (reg14 ? wire3 : wire2) : wire1)) - (^reg8[(2'h2):(1'h1)])));
              reg15 <= {{(8'ha4)},
                  (wire1 ?
                      ((reg12[(2'h3):(2'h2)] ? reg11[(4'hd):(2'h2)] : wire1) ?
                          (^$signed(reg13)) : $signed(wire3)) : wire2[(4'hf):(2'h3)])};
            end
          reg17 <= ((wire2 * wire3[(1'h0):(1'h0)]) ?
              ((^~($unsigned(reg6) ? wire3 : $unsigned(reg14))) ?
                  ($unsigned(reg9) ?
                      {((8'haf) * (8'hbf)),
                          (wire4 ?
                              (8'hb3) : reg9)} : reg11) : (-wire0[(1'h0):(1'h0)])) : (~&{{(reg15 ^~ reg9),
                      wire4}}));
          reg18 <= reg9;
        end
      else
        begin
          if ($signed(reg14[(4'h9):(3'h4)]))
            begin
              reg13 <= $unsigned(wire4[(3'h7):(1'h0)]);
              reg14 <= $unsigned(reg11[(3'h5):(3'h5)]);
            end
          else
            begin
              reg13 <= (reg18 == (((~(8'hb8)) ?
                      $signed($unsigned((8'ha2))) : ((wire3 ?
                          (8'ha2) : wire0) << $signed(reg6))) ?
                  ((~&$signed(reg9)) ?
                      (((7'h43) ?
                          wire0 : reg15) > (~|reg17)) : (reg15[(4'hc):(4'hc)] ^~ wire4)) : reg5[(3'h4):(2'h3)]));
              reg14 <= (wire0[(1'h1):(1'h0)] ?
                  $unsigned((((+reg9) == wire2[(4'he):(4'hc)]) < $unsigned($unsigned(reg9)))) : (-reg16));
              reg15 <= $signed(wire0[(4'hb):(4'ha)]);
              reg16 <= (wire1 + reg13[(1'h1):(1'h1)]);
            end
          reg17 <= $signed({((((8'ha9) ^ reg6) < $unsigned(wire3)) ?
                  $unsigned((reg13 ? (8'hb1) : reg7)) : (~&$signed(wire4))),
              $signed($unsigned((!reg8)))});
          if (((~^{$unsigned({reg9, reg16}), (&(&reg15))}) ? reg12 : reg12))
            begin
              reg18 <= reg9[(1'h0):(1'h0)];
            end
          else
            begin
              reg18 <= reg7;
              reg19 <= reg9;
              reg20 <= $unsigned((^~reg12));
              reg21 <= (wire4 ~^ wire2);
              reg22 <= reg19[(3'h5):(3'h5)];
            end
          reg23 <= $signed(($unsigned(((reg15 ?
                  reg22 : reg11) ^~ $unsigned(reg10))) ?
              $unsigned({$unsigned(reg14),
                  $unsigned(reg10)}) : $signed($signed((^reg11)))));
        end
    end
  always
    @(posedge clk) begin
      reg24 <= $unsigned(reg5);
      reg25 <= (^~($signed(reg9) ?
          (reg11 ?
              {$unsigned(reg5),
                  wire1[(2'h2):(1'h1)]} : (|(reg8 & reg18))) : ((^reg13) >= {(|(8'hbd))})));
      reg26 <= {reg19[(1'h1):(1'h1)]};
      reg27 <= reg15[(3'h7):(2'h3)];
    end
  assign wire28 = {{reg15}};
  always
    @(posedge clk) begin
      reg29 <= $unsigned(reg17[(3'h5):(1'h0)]);
      reg30 <= (&reg20);
      reg31 <= (+reg30[(3'h4):(1'h0)]);
      reg32 <= $signed($signed($unsigned(reg29[(5'h14):(5'h10)])));
      reg33 <= $unsigned($unsigned(wire28));
    end
  assign wire34 = reg12[(2'h2):(1'h1)];
  assign wire35 = (reg10[(1'h0):(1'h0)] ? reg19 : $signed(reg17));
endmodule
