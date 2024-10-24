module top
#(parameter param27 = {(~|(7'h41))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire26,
                 wire23,
                 wire22,
                 wire21,
                 wire4,
                 reg25,
                 reg24,
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
  assign wire4 = wire3[(4'hc):(4'hb)];
  always
    @(posedge clk) begin
      reg5 <= ((wire1 ? wire2 : wire2[(3'h6):(1'h0)]) ?
          $unsigned((+wire3[(3'h4):(1'h1)])) : $signed(wire3));
      reg6 <= ($unsigned((-$unsigned((&wire4)))) ?
          wire0[(1'h1):(1'h0)] : {$unsigned((&{wire1, wire4})),
              ($signed({wire0}) & ((wire1 << reg5) == $signed(wire4)))});
      reg7 <= wire3[(4'he):(4'h9)];
      if ((-$signed({{{wire2}}})))
        begin
          if (wire1)
            begin
              reg8 <= wire3[(5'h11):(4'h9)];
              reg9 <= ((($unsigned($unsigned((8'hbc))) ?
                  $unsigned(reg6[(1'h1):(1'h0)]) : $unsigned((~^(7'h40)))) ~^ (!$unsigned(reg8))) > $unsigned(($signed($unsigned(wire1)) >>> wire2)));
              reg10 <= (&wire0[(1'h1):(1'h1)]);
            end
          else
            begin
              reg8 <= reg9;
            end
          reg11 <= ((wire3 ^ (+((wire0 ? reg5 : (8'hb4)) - (+wire1)))) ?
              $unsigned((~reg10[(1'h1):(1'h1)])) : $signed(reg5));
          reg12 <= $signed(reg10[(1'h1):(1'h0)]);
          reg13 <= wire0[(2'h2):(2'h2)];
          if ((wire2 >> $unsigned(wire2)))
            begin
              reg14 <= {(((^reg9) >= (!$unsigned((8'hab)))) <<< {reg12[(3'h7):(2'h3)],
                      wire0[(2'h2):(2'h2)]})};
              reg15 <= (reg11[(3'h5):(2'h3)] <<< {reg7,
                  (($unsigned((8'had)) ?
                      (!reg11) : $unsigned(reg7)) & (reg9[(2'h2):(1'h0)] ?
                      reg13 : (^wire0)))});
              reg16 <= (((-reg14) || $signed((^~$unsigned(reg7)))) + reg6[(4'hb):(3'h5)]);
            end
          else
            begin
              reg14 <= $signed((!(reg16[(3'h5):(3'h4)] ?
                  wire1 : $signed(wire0))));
              reg15 <= wire0;
            end
        end
      else
        begin
          if (({($signed($unsigned(reg11)) ?
                  $signed($unsigned(reg11)) : (wire2[(4'h8):(2'h3)] && (^~(8'had))))} != ((~&reg5[(4'ha):(3'h6)]) ?
              reg7 : (!(8'hb7)))))
            begin
              reg8 <= reg13;
              reg9 <= $unsigned($signed(wire4[(4'h8):(3'h5)]));
            end
          else
            begin
              reg8 <= reg10[(1'h0):(1'h0)];
              reg9 <= reg7;
            end
          reg10 <= (reg8[(2'h2):(1'h0)] && $unsigned(reg13));
        end
      if (((~reg12) ? $unsigned($signed(reg16)) : (~^reg5)))
        begin
          reg17 <= ((reg7 < (reg6[(4'hc):(4'hb)] ?
              {((8'h9c) ? reg15 : reg8)} : {$unsigned(reg6),
                  (^reg7)})) || wire2);
        end
      else
        begin
          reg17 <= reg11[(3'h7):(3'h4)];
        end
    end
  always
    @(posedge clk) begin
      if (reg17[(2'h3):(2'h3)])
        begin
          reg18 <= $signed(({((reg8 ? (8'ha9) : wire4) ?
                  (~^wire4) : $unsigned(wire4)),
              (|(!wire1))} ~^ (~&{(reg8 >= reg9), wire4[(4'hd):(4'h8)]})));
        end
      else
        begin
          reg18 <= $unsigned((8'hb6));
          reg19 <= reg17[(2'h3):(1'h0)];
        end
      reg20 <= reg17[(4'hb):(3'h6)];
    end
  assign wire21 = (({$unsigned({reg18}), reg16[(4'h8):(3'h7)]} ?
                      ((-(reg11 ? reg9 : reg12)) ?
                          {$signed(wire3)} : {reg18}) : reg15) >>> $signed(reg15));
  assign wire22 = ($signed((~(&(~reg17)))) ?
                      reg7[(2'h2):(1'h0)] : ($signed(reg14[(3'h7):(3'h5)]) ?
                          {reg20[(2'h3):(1'h1)]} : ($unsigned($unsigned((8'ha1))) < ((~|wire3) ?
                              (+wire1) : $signed(reg20)))));
  assign wire23 = $signed(({((reg20 ? reg17 : reg18) ?
                              (reg12 ? wire1 : reg16) : $signed((8'hb2)))} ?
                      (~&(~$unsigned(reg9))) : ($unsigned((wire0 << reg6)) << ((wire2 >>> reg7) << {reg7,
                          wire22}))));
  always
    @(posedge clk) begin
      reg24 <= (-wire3[(4'h9):(3'h6)]);
      if (reg12)
        begin
          reg25 <= $unsigned(reg8);
        end
      else
        begin
          reg25 <= $signed(((!($signed(reg5) ?
              ((8'hbd) ?
                  reg17 : reg12) : reg10)) - $unsigned(reg5[(1'h0):(1'h0)])));
        end
    end
  assign wire26 = (reg16 != wire21[(4'he):(4'h8)]);
endmodule
