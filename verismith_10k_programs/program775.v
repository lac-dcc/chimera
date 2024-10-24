module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2[(2'h2):(2'h2)];
      reg5 <= $signed((~&{wire0[(3'h6):(2'h2)]}));
      if (reg5[(2'h2):(2'h2)])
        begin
          reg6 <= reg5[(3'h5):(1'h1)];
        end
      else
        begin
          reg6 <= (~|wire2[(1'h0):(1'h0)]);
        end
      if (wire3)
        begin
          reg7 <= {(wire1[(2'h2):(1'h1)] ? wire0 : reg6)};
          reg8 <= (8'ha2);
          reg9 <= wire3[(2'h3):(1'h0)];
        end
      else
        begin
          reg7 <= (^~(((wire0[(2'h2):(1'h0)] ? wire0[(3'h5):(2'h2)] : {reg7}) ?
                  ((reg9 << reg6) ?
                      wire1 : $unsigned(reg5)) : $unsigned((8'h9d))) ?
              (8'ha8) : wire3[(3'h5):(3'h5)]));
          reg8 <= $signed($signed(((~&reg7[(3'h5):(3'h5)]) ?
              {{wire2, reg9}, $unsigned(reg5)} : {{reg6},
                  (reg7 ? (8'ha2) : reg4)})));
          reg9 <= (~($signed(({wire3, wire3} ?
              {reg6} : $signed(reg4))) || (^~wire2)));
          reg10 <= $unsigned($unsigned({($unsigned((8'h9f)) > $unsigned(reg4)),
              reg5}));
        end
      if (((~(~reg5)) ?
          $unsigned(reg6) : ((!$signed((reg4 && (8'hab)))) ?
              $signed(reg6) : (!$unsigned((reg10 ? reg6 : (8'ha1)))))))
        begin
          if (($unsigned((wire3[(3'h7):(3'h4)] ?
              ((wire1 ?
                  wire3 : (8'hb9)) ^~ $unsigned(reg4)) : $unsigned($unsigned(reg8)))) * wire3))
            begin
              reg11 <= (8'hbb);
            end
          else
            begin
              reg11 <= ((reg7[(3'h5):(1'h0)] && reg10) & $unsigned((reg4[(4'hd):(1'h0)] && wire0[(3'h5):(3'h5)])));
              reg12 <= (~^($unsigned((+reg7[(2'h3):(2'h3)])) ?
                  (|(reg7 ? $signed(wire0) : $signed(wire2))) : reg6));
              reg13 <= reg4[(4'h8):(3'h4)];
              reg14 <= (~|$unsigned(reg6));
              reg15 <= $unsigned(reg10[(3'h7):(3'h6)]);
            end
          reg16 <= reg11[(3'h5):(1'h1)];
          if (wire3)
            begin
              reg17 <= (+(~&reg4[(3'h5):(1'h0)]));
            end
          else
            begin
              reg17 <= $unsigned(reg16);
              reg18 <= (^~$signed(reg16));
            end
          reg19 <= ((8'ha1) ?
              ($signed((reg10[(2'h2):(2'h2)] ?
                  (reg7 ?
                      reg7 : reg12) : wire3)) < (((!reg10) < $signed(reg14)) ?
                  ((^~reg8) << (|wire0)) : reg7)) : $unsigned(reg4));
        end
      else
        begin
          reg11 <= (~{($signed((reg8 || reg4)) ?
                  $signed($unsigned(wire0)) : reg18[(4'h8):(2'h2)])});
          if ($signed($signed($unsigned(($signed(reg4) ^~ (reg14 > reg9))))))
            begin
              reg12 <= (~&reg15);
              reg13 <= (wire0 ~^ wire2);
              reg14 <= (8'h9e);
              reg15 <= (8'ha5);
              reg16 <= reg11[(4'h9):(2'h2)];
            end
          else
            begin
              reg12 <= $unsigned($unsigned(($unsigned(reg6) ^~ $unsigned((reg12 > reg8)))));
              reg13 <= reg15;
              reg14 <= ((~&reg8[(2'h2):(1'h1)]) == (8'hba));
            end
        end
    end
  assign wire20 = wire2;
  assign wire21 = wire1[(2'h2):(1'h1)];
  assign wire22 = $signed((!reg11));
endmodule
