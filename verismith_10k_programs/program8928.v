module top #(parameter param16 = (8'ha1)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = {$unsigned($unsigned(((~wire1) * (wire4 | (8'hbb))))),
                     (+($unsigned((+wire2)) == $unsigned($unsigned(wire4))))};
  always
    @(posedge clk) begin
      reg7 <= $signed($unsigned(($unsigned((~|wire2)) ?
          {(~^wire3), (wire2 << wire4)} : wire6[(3'h4):(2'h3)])));
      if ($signed(wire5))
        begin
          reg8 <= (($unsigned(((~wire5) - (wire4 ? reg7 : wire1))) ?
              wire6[(2'h3):(2'h3)] : (~($unsigned(reg7) ?
                  (8'hbb) : $signed(wire2)))) < $signed((~$signed(wire2))));
          if ((wire6 ? wire0 : $signed($signed($signed(reg8[(2'h3):(1'h1)])))))
            begin
              reg9 <= wire0;
              reg10 <= $unsigned((reg8 ?
                  ((~&wire4[(3'h4):(3'h4)]) + {reg9[(1'h0):(1'h0)],
                      $signed(reg8)}) : ($signed(reg9) ?
                      ((-wire0) ?
                          $signed((8'hac)) : {wire4}) : (~^{(8'ha2)}))));
              reg11 <= ((($signed($unsigned(wire0)) != (-(8'hb6))) ?
                  (|{wire0, (reg8 ? (8'ha9) : reg7)}) : ($unsigned((reg7 ?
                      reg8 : wire6)) << reg9)) & wire4[(1'h0):(1'h0)]);
              reg12 <= ((wire0 >= $unsigned(((wire3 ? reg10 : wire4) + (reg8 ?
                  wire3 : reg11)))) != (wire2 >> $signed(((~(8'ha7)) ?
                  {reg8, wire2} : (|reg8)))));
            end
          else
            begin
              reg9 <= (reg12 ? reg9 : (!$unsigned($signed(reg12))));
            end
          reg13 <= ((reg12[(3'h4):(3'h4)] ~^ (reg8 ?
                  wire3 : ({(8'hba)} ^~ $signed(reg8)))) ?
              wire1 : reg7);
          reg14 <= $unsigned((8'hba));
          reg15 <= {(((!reg11[(5'h11):(4'hd)]) || $signed((~|wire6))) ?
                  $unsigned((reg12[(3'h4):(1'h1)] ?
                      (wire3 ?
                          wire6 : reg13) : reg13[(4'h9):(1'h1)])) : wire4[(3'h7):(2'h2)]),
              reg8[(1'h1):(1'h0)]};
        end
      else
        begin
          if ($signed(reg9))
            begin
              reg8 <= reg8[(2'h2):(1'h0)];
              reg9 <= {(wire6 - reg9),
                  $unsigned(($signed($signed((8'ha8))) ~^ (8'hbf)))};
              reg10 <= $unsigned(((^~((reg7 ? wire2 : reg11) ?
                      reg14 : (wire2 ? (8'haf) : wire0))) ?
                  $unsigned($unsigned($unsigned(wire0))) : (8'hb1)));
              reg11 <= reg14[(2'h3):(1'h0)];
            end
          else
            begin
              reg8 <= $signed($signed((wire4 ^~ wire0[(2'h2):(2'h2)])));
              reg9 <= (~$signed(reg9[(2'h3):(1'h0)]));
            end
          reg12 <= $unsigned((($unsigned(reg15) ? wire4 : wire6) ?
              (|(&(+(8'hbb)))) : (~reg15[(5'h11):(3'h4)])));
          reg13 <= (^~(~(wire2 ?
              (!(reg8 ? wire6 : wire4)) : (&{reg7, (8'ha0)}))));
          reg14 <= ((reg11 ?
              reg11 : (^$signed((&reg9)))) > wire4[(4'hb):(1'h0)]);
          reg15 <= (~&reg7);
        end
    end
endmodule
