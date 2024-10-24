module top
#(parameter param24 = ((^(((!(8'ha4)) + (~|(8'hb3))) == (|((8'hbe) <= (8'hab))))) ~^ {(8'hbd)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire12,
                 wire11,
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
      reg4 <= wire2[(3'h7):(3'h7)];
    end
  always
    @(posedge clk) begin
      if (wire1[(2'h3):(2'h3)])
        begin
          reg5 <= $signed(wire1);
          reg6 <= reg4;
          reg7 <= $signed($unsigned($unsigned((~&wire1))));
          if ($unsigned($unsigned((((reg4 ?
              reg7 : reg5) > $unsigned(wire3)) & reg4))))
            begin
              reg8 <= reg5[(5'h13):(4'hb)];
              reg9 <= wire1;
            end
          else
            begin
              reg8 <= ($unsigned((wire1[(1'h0):(1'h0)] ?
                      (((8'hb4) ? reg6 : (8'ha2)) ?
                          $unsigned((8'haf)) : $signed(reg6)) : reg4)) ?
                  (+wire0[(5'h11):(4'he)]) : ($signed(((reg6 ?
                          reg8 : reg9) != {(8'hb9)})) ?
                      $signed(($signed((8'ha9)) ^~ (wire3 ?
                          wire1 : wire2))) : ($signed((~&reg4)) ~^ (~|(wire3 ?
                          (8'ha0) : (8'hba))))));
              reg9 <= (reg6[(1'h0):(1'h0)] ~^ $unsigned((~$unsigned(reg4[(3'h6):(1'h0)]))));
            end
        end
      else
        begin
          if (reg7)
            begin
              reg5 <= (^~$unsigned(wire0[(4'h8):(3'h7)]));
              reg6 <= (reg9 ^~ wire2[(4'h8):(3'h5)]);
            end
          else
            begin
              reg5 <= reg8[(3'h5):(3'h4)];
              reg6 <= wire0;
            end
        end
      reg10 <= ($signed(($signed(((8'hb2) ? wire3 : reg7)) != (7'h40))) ?
          (reg9 != (8'had)) : (~(|((reg7 ? reg8 : reg5) ~^ {reg8}))));
    end
  assign wire11 = $signed(reg9);
  assign wire12 = $signed((reg4[(5'h11):(5'h10)] | (~^wire0)));
  always
    @(posedge clk) begin
      if (wire2[(4'ha):(3'h6)])
        begin
          reg13 <= $unsigned(reg6);
          reg14 <= (7'h41);
          reg15 <= ($signed((((reg8 || wire12) ?
                  {wire12, reg13} : (reg5 - (8'h9d))) ?
              ((8'ha9) < {(8'hb6)}) : (~&(~&wire0)))) && ({(~{(8'ha1)})} ?
              $signed((wire1 ? (reg7 ? reg5 : (8'haf)) : reg8)) : (^{(reg7 ?
                      reg5 : wire0)})));
          reg16 <= reg8[(3'h4):(1'h1)];
          reg17 <= $unsigned((8'h9f));
        end
      else
        begin
          if ((8'ha6))
            begin
              reg13 <= reg10;
              reg14 <= {$signed((((reg16 - wire3) + reg8[(3'h6):(1'h1)]) ?
                      (wire1[(1'h0):(1'h0)] ?
                          wire1 : $unsigned(reg4)) : $signed((8'hb8)))),
                  reg8[(1'h1):(1'h1)]};
              reg15 <= (8'ha7);
              reg16 <= {$signed(reg16),
                  (-$signed((wire1 && $unsigned(wire3))))};
              reg17 <= (~($signed(($signed(reg10) ?
                  {reg15,
                      wire1} : (|reg5))) >>> ($unsigned(wire1[(1'h1):(1'h1)]) ?
                  reg7 : (-(reg16 ? reg4 : reg16)))));
            end
          else
            begin
              reg13 <= ($signed(((8'hb9) ?
                  (~&reg9) : reg13)) & ((~|wire1) <= $unsigned((^{(7'h41)}))));
              reg14 <= ((reg7[(4'h8):(3'h7)] ?
                  reg9 : (~^(reg16[(1'h1):(1'h1)] << wire12[(1'h0):(1'h0)]))) * ($signed(wire1[(2'h2):(2'h2)]) ?
                  (8'hb9) : wire12[(3'h4):(1'h0)]));
              reg15 <= reg4[(4'h8):(3'h4)];
            end
          if (reg17[(3'h7):(1'h0)])
            begin
              reg18 <= {$unsigned(reg9[(1'h1):(1'h0)]),
                  (+wire12[(1'h1):(1'h0)])};
            end
          else
            begin
              reg18 <= $unsigned((((~$unsigned(reg17)) ~^ ($signed(reg16) ?
                      (8'ha2) : (wire1 >>> reg9))) ?
                  (+reg7) : reg8));
              reg19 <= reg14[(3'h7):(3'h4)];
              reg20 <= $unsigned($signed((+(^wire2[(4'he):(2'h3)]))));
            end
          reg21 <= (reg14[(3'h4):(1'h1)] ?
              (reg10[(1'h1):(1'h0)] && (reg4 - (reg16[(3'h4):(3'h4)] ?
                  ((8'ha8) >= reg9) : $unsigned(reg9)))) : reg9);
        end
      reg22 <= ((reg6[(4'h8):(3'h4)] ^~ {$signed({reg5,
              (8'hb7)})}) || (wire2 < $signed(wire0[(3'h6):(3'h6)])));
    end
  assign wire23 = reg20;
endmodule
