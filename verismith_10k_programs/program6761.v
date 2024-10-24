module top
#(parameter param17 = ((((^~((8'hab) > (8'h9d))) - {(|(8'hb6))}) & (((8'had) | ((8'ha5) != (8'hba))) ? (((8'haa) <<< (8'hb9)) || (~|(8'hb7))) : (((8'ha6) ? (8'ha3) : (8'hbb)) ? {(8'hb0)} : (&(8'hb7))))) ? (+(((^~(8'hbf)) ? ((8'hb7) ? (8'h9d) : (8'h9f)) : (|(8'ha2))) ^ (((8'ha5) & (8'hba)) != (!(8'ha3))))) : (((!((8'hb3) ? (8'hac) : (8'haa))) - {((8'ha8) ? (7'h43) : (8'ha6)), (-(8'hbc))}) > (~|(((8'ha6) ? (8'ha9) : (7'h43)) ? ((8'h9d) ^~ (8'haa)) : (^(8'hb9)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (wire2[(3'h7):(3'h5)] ?
                     (($unsigned((wire0 ?
                             wire3 : wire3)) | ($unsigned((7'h41)) - (~&wire3))) ?
                         (-wire3[(2'h2):(1'h0)]) : (wire3[(2'h3):(2'h3)] ?
                             (((7'h43) ? wire3 : wire3) ?
                                 {wire2} : wire3) : $signed((wire0 - wire1)))) : wire3[(4'h8):(2'h2)]);
  assign wire5 = (wire0[(3'h6):(1'h0)] ?
                     wire3[(3'h5):(2'h2)] : $signed(({(wire1 ? wire1 : wire1),
                         $signed((8'ha9))} != ({wire0, wire0} ?
                         (wire3 << wire3) : (^wire0)))));
  always
    @(posedge clk) begin
      if ((($signed(wire2[(1'h0):(1'h0)]) ?
          wire5 : (wire3[(3'h7):(1'h0)] - ((wire1 ?
              wire5 : wire4) <<< wire0[(3'h5):(3'h5)]))) != $unsigned($unsigned($signed($signed((8'haa)))))))
        begin
          reg6 <= $unsigned(wire5);
          reg7 <= wire4[(3'h6):(1'h0)];
        end
      else
        begin
          reg6 <= (!((&$signed($signed(wire0))) ?
              (^~$signed($signed(reg6))) : $signed({{wire1, (8'hab)},
                  reg6[(2'h2):(1'h1)]})));
        end
      if (wire2)
        begin
          reg8 <= {((~|(8'hb2)) | (((reg6 ?
                  wire2 : reg6) >= (!(8'hbc))) || ((-wire2) ?
                  (wire4 ? wire2 : (8'h9c)) : reg7))),
              ({wire4} ~^ (~&{reg6}))};
          reg9 <= reg6[(4'h9):(2'h3)];
          if ((~&(~wire2)))
            begin
              reg10 <= (($unsigned(reg6) == {wire4[(2'h2):(2'h2)]}) ?
                  ($unsigned(($signed(wire0) ?
                          (wire1 ? (8'haa) : reg8) : (reg7 ? reg9 : reg9))) ?
                      reg8[(4'ha):(1'h1)] : $signed(reg9)) : (-((wire4 == (!wire0)) & $signed((wire2 ?
                      wire2 : wire2)))));
              reg11 <= (wire4[(3'h4):(3'h4)] ?
                  reg8 : $signed(($signed(reg10) ?
                      (reg8 == wire3) : $signed($signed(reg7)))));
            end
          else
            begin
              reg10 <= ((~|$signed($signed(wire2[(1'h1):(1'h1)]))) ^ $unsigned(reg11));
              reg11 <= $unsigned((|({$signed(wire3)} >> {((8'ha0) ?
                      wire2 : reg6)})));
              reg12 <= ($unsigned($unsigned($unsigned({(8'hbb)}))) ?
                  ((~^{(wire1 > wire4)}) | $unsigned((!(wire5 >> wire2)))) : (~$signed(reg8[(4'hb):(3'h6)])));
              reg13 <= {$unsigned($unsigned((~|reg9)))};
            end
        end
      else
        begin
          reg8 <= $unsigned(($unsigned(reg9) != ($signed(reg8[(4'he):(4'h9)]) ~^ $signed({(8'ha6)}))));
          reg9 <= $signed((~|(~|$unsigned(reg9[(1'h1):(1'h0)]))));
          reg10 <= $unsigned((reg13[(4'he):(3'h6)] ?
              $signed((&(wire0 ?
                  reg10 : reg10))) : (($signed((7'h42)) || ((7'h40) == reg7)) * (&{reg12}))));
          reg11 <= (~^wire3[(2'h2):(1'h1)]);
          reg12 <= (((reg13 * ((reg7 ? reg8 : wire2) ?
                  $unsigned((8'ha3)) : $unsigned(reg8))) ?
              (reg6 ?
                  wire0 : $unsigned(reg12)) : reg12[(2'h3):(1'h1)]) <= ($unsigned((~&$unsigned(wire3))) ?
              (8'hbc) : reg6[(3'h5):(2'h3)]));
        end
      reg14 <= reg11[(2'h2):(1'h0)];
    end
  assign wire15 = (({$signed((8'ha9)),
                          ($unsigned((7'h42)) ?
                              (!wire0) : (reg6 ? reg6 : reg8))} ?
                      $unsigned(((wire4 >= reg7) != (reg9 != wire2))) : (reg8[(2'h3):(2'h3)] <<< (~^(reg7 >= reg7)))) >> $unsigned(reg8));
  assign wire16 = $signed((^~reg11));
endmodule
