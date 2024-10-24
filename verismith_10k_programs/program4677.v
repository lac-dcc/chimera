module top
#(parameter param29 = ((~&((((8'hb4) - (8'hae)) ? ((8'hac) && (8'hac)) : (8'ha7)) || ((~(8'hb0)) ? (8'ha5) : ((8'hac) ? (8'hb2) : (8'hbf))))) <= (~&(|((!(8'hb7)) < ((8'ha2) ~^ (8'ha2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (+$unsigned(wire3[(4'h9):(3'h6)]));
    end
  always
    @(posedge clk) begin
      if (($signed(reg4) > wire1[(3'h6):(3'h4)]))
        begin
          reg5 <= ($unsigned(wire1[(1'h1):(1'h1)]) ?
              (wire3[(4'hf):(4'hc)] != wire0) : (!$signed(((^~wire3) ?
                  $unsigned((8'hb3)) : (7'h41)))));
        end
      else
        begin
          reg5 <= wire2[(4'h8):(1'h0)];
          if ((^wire3))
            begin
              reg6 <= (reg4[(3'h6):(2'h2)] ?
                  $unsigned(wire1) : $unsigned((!(&(wire0 >= wire2)))));
              reg7 <= wire2;
              reg8 <= $unsigned({reg6});
            end
          else
            begin
              reg6 <= $unsigned((wire0[(3'h5):(3'h4)] >> reg7[(1'h1):(1'h1)]));
              reg7 <= reg4;
              reg8 <= {wire2[(3'h5):(3'h4)],
                  $unsigned($unsigned((reg7 ?
                      reg6[(1'h0):(1'h0)] : ((8'hb3) ? wire2 : (8'hb1)))))};
              reg9 <= $unsigned($signed($signed({{wire0, reg7}})));
            end
          if ((!$unsigned($unsigned((reg9 ?
              reg8[(4'h9):(4'h8)] : $unsigned(reg5))))))
            begin
              reg10 <= {$unsigned({$signed(wire3[(4'he):(4'h9)])}),
                  (^(~(&$unsigned(wire3))))};
              reg11 <= $signed(reg7[(1'h0):(1'h0)]);
              reg12 <= $unsigned(reg7);
            end
          else
            begin
              reg10 <= ((($signed((wire0 >>> wire0)) & ((!(8'ha7)) ?
                      (|(8'hb9)) : {wire3, reg12})) || ($signed({reg4,
                          (8'ha3)}) ?
                      reg10[(1'h1):(1'h1)] : $signed($unsigned(reg5)))) ?
                  wire3[(4'ha):(3'h5)] : {(8'ha8), reg11[(3'h4):(2'h3)]});
              reg11 <= ($signed((wire1[(3'h4):(2'h2)] ?
                  $unsigned(reg7[(3'h5):(1'h1)]) : wire3)) | (&(reg8[(3'h4):(1'h1)] ^~ $unsigned((-(8'hbb))))));
              reg12 <= ((7'h44) * $signed((8'hae)));
            end
        end
      reg13 <= ((((^~(wire3 ? reg10 : wire3)) ?
              $signed($signed(reg5)) : (reg6 || (~^wire2))) ?
          ((~&(8'hba)) ?
              reg9 : reg4) : reg10[(3'h7):(2'h2)]) != $unsigned({($signed(reg6) <= (wire2 < wire0)),
          (reg10[(2'h3):(2'h3)] & reg4[(4'hf):(4'he)])}));
      reg14 <= reg10[(2'h2):(2'h2)];
      if (wire2)
        begin
          reg15 <= reg8;
          reg16 <= $signed($signed($signed(reg7)));
          reg17 <= reg12[(2'h3):(1'h1)];
          reg18 <= $signed((~^{((&(8'hb4)) ? reg13 : $unsigned(reg16))}));
        end
      else
        begin
          if ((&wire3[(4'h9):(3'h7)]))
            begin
              reg15 <= $unsigned((~|reg9));
            end
          else
            begin
              reg15 <= reg14;
            end
          reg16 <= (reg9 * (!(8'ha8)));
          reg17 <= wire0[(1'h1):(1'h1)];
          reg18 <= (8'ha8);
          reg19 <= ({$unsigned(wire0[(3'h4):(2'h2)])} != $unsigned(($signed((reg10 >> (7'h40))) ?
              ($signed(reg11) ?
                  (reg9 ^~ reg13) : (8'ha6)) : $signed($signed((8'had))))));
        end
    end
  always
    @(posedge clk) begin
      reg20 <= (8'hb9);
      reg21 <= reg17;
      reg22 <= $unsigned(reg5[(4'hd):(2'h3)]);
      reg23 <= (wire2 * (^~(wire1 ? (&(reg12 ? (8'hbf) : reg17)) : (+reg16))));
    end
  assign wire24 = (~&(-$unsigned((~&(reg8 ^~ reg21)))));
  assign wire25 = ((~$unsigned(wire24)) ^ (|$signed($signed($unsigned(reg22)))));
  assign wire26 = wire25[(2'h3):(2'h3)];
  assign wire27 = ((^$unsigned(reg11)) ?
                      (((&(reg17 << wire26)) << ($signed(wire3) | (reg20 >>> (7'h44)))) >>> $unsigned(wire1)) : $unsigned((($signed(reg6) ?
                              wire1[(1'h0):(1'h0)] : $signed(reg18)) ?
                          wire26[(1'h1):(1'h1)] : reg22)));
  assign wire28 = $unsigned(((~&{reg8[(4'hd):(1'h1)],
                      reg21[(1'h1):(1'h1)]}) >>> ($unsigned($unsigned(reg12)) ?
                      reg7 : $unsigned((reg20 <<< (8'hbc))))));
endmodule
