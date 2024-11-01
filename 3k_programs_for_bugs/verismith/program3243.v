module top
#(parameter param26 = {((8'hb9) >>> (^~((&(7'h44)) + (~&(8'ha9)))))}, 
parameter param27 = (((8'h9c) <= param26) >= (&(7'h42))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (-{$unsigned($unsigned(wire3)), $unsigned(wire3)});
      reg5 <= {wire2[(3'h7):(2'h2)]};
    end
  always
    @(posedge clk) begin
      reg6 <= (($signed((wire3 ? (wire2 | (8'h9f)) : (wire1 < (8'hb2)))) ?
          $unsigned((!(^wire3))) : ((8'hb9) >> ((wire3 ^~ wire2) ?
              $unsigned(reg4) : (wire3 > reg5)))) & {$signed(wire0[(3'h6):(1'h1)]),
          ((~(reg4 ? wire3 : wire3)) ? (|(wire2 >= (8'hbe))) : wire3)});
      reg7 <= reg6[(2'h2):(2'h2)];
      reg8 <= wire2[(2'h3):(1'h1)];
      if ((((-reg8[(1'h0):(1'h0)]) ?
              (^($signed(wire0) ?
                  wire3[(3'h5):(1'h0)] : (reg7 != reg8))) : ((wire2[(2'h3):(2'h3)] == $signed(wire3)) ?
                  wire3 : (reg5[(4'hb):(4'h8)] | (reg7 && (8'ha1))))) ?
          reg4 : {wire2}))
        begin
          reg9 <= reg6[(3'h7):(3'h6)];
        end
      else
        begin
          reg9 <= {(8'h9d)};
          reg10 <= $unsigned($unsigned(($unsigned($signed(wire1)) ?
              ((wire2 & reg9) ? (^reg7) : wire2) : (~|(wire0 ?
                  reg9 : wire0)))));
          reg11 <= $signed(reg10[(2'h3):(2'h2)]);
          if ($unsigned((^~$signed(wire2[(1'h0):(1'h0)]))))
            begin
              reg12 <= {(8'h9c), $unsigned((~|((~^wire3) & {reg9, reg4})))};
              reg13 <= ((($unsigned((~&reg7)) ?
                          (reg10 && $unsigned(wire0)) : (reg6[(3'h6):(1'h1)] | (wire0 ?
                              reg6 : (8'h9f)))) ?
                      (reg5 ?
                          $signed((reg8 << wire0)) : wire3[(2'h3):(2'h2)]) : $signed($unsigned((wire2 ?
                          wire1 : reg9)))) ?
                  reg4 : reg6);
              reg14 <= wire1;
              reg15 <= ($unsigned(wire3[(2'h3):(2'h2)]) ?
                  $signed((($signed(wire1) ? $signed(reg6) : reg9) ?
                      wire2 : reg6[(3'h6):(3'h5)])) : (wire2[(3'h5):(1'h1)] != {$unsigned(reg10),
                      (reg10[(4'h9):(1'h1)] - (wire0 ? reg11 : wire1))}));
            end
          else
            begin
              reg12 <= $signed($signed(reg8[(4'hc):(4'ha)]));
              reg13 <= $signed(reg7[(2'h3):(1'h1)]);
              reg14 <= reg13[(4'h9):(4'h8)];
            end
        end
      if ((((~|(wire3 - (reg11 && reg8))) ?
              $unsigned((~&wire0[(1'h0):(1'h0)])) : wire1[(4'h9):(4'h8)]) ?
          reg15[(5'h14):(5'h14)] : $signed($signed((+reg12)))))
        begin
          if (reg14)
            begin
              reg16 <= (!$signed(wire0));
              reg17 <= (~^$signed(($signed($signed(wire0)) ?
                  (reg10[(2'h2):(2'h2)] - reg7) : $signed($signed((8'hbd))))));
              reg18 <= wire1;
              reg19 <= $unsigned($unsigned((reg17 ?
                  {(wire3 ? wire3 : reg12)} : (&reg18))));
              reg20 <= {reg4[(3'h7):(3'h7)]};
            end
          else
            begin
              reg16 <= $unsigned(reg8);
              reg17 <= reg18;
            end
          reg21 <= (^~reg17[(2'h3):(1'h0)]);
          reg22 <= $signed(((&(-$signed(reg20))) >>> (7'h44)));
        end
      else
        begin
          reg16 <= reg4[(3'h6):(2'h3)];
          reg17 <= $unsigned($unsigned($unsigned((8'hbb))));
          reg18 <= reg10;
          if (reg17[(1'h1):(1'h0)])
            begin
              reg19 <= $signed(reg19[(4'h9):(4'h8)]);
              reg20 <= reg11;
            end
          else
            begin
              reg19 <= {reg6[(2'h2):(2'h2)], reg5[(4'hd):(4'h8)]};
            end
          reg21 <= reg6;
        end
    end
  assign wire23 = ((($signed({(8'hba)}) ^ ($signed(reg13) ?
                      (reg22 | reg14) : (reg12 ?
                          reg5 : reg16))) * (!reg4)) >> $unsigned(reg19[(4'he):(3'h4)]));
  assign wire24 = reg8[(4'hc):(4'hc)];
  assign wire25 = (&$unsigned($signed(wire1)));
endmodule
