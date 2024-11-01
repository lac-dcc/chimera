module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire16,
                 wire6,
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
  assign wire4 = (&{$unsigned(($signed(wire1) <<< $signed((8'hab)))), wire2});
  assign wire5 = $signed(wire2);
  assign wire6 = (-(wire0 ?
                     ($unsigned(((8'h9e) ? wire5 : wire3)) ?
                         ($unsigned(wire2) ?
                             ((8'hac) || wire4) : (~^wire0)) : (!wire1)) : wire4));
  always
    @(posedge clk) begin
      reg7 <= ((($signed((wire4 ? wire3 : wire4)) + (wire6 >> (wire0 ?
          (8'hac) : wire0))) - wire3) <<< wire2[(3'h6):(3'h4)]);
      reg8 <= wire6[(3'h5):(3'h5)];
      if (wire5)
        begin
          reg9 <= wire4[(4'hd):(4'hc)];
          reg10 <= ($signed((wire5 == wire5[(3'h5):(1'h1)])) ?
              (!$unsigned({(wire2 ^~ wire1), $unsigned(wire6)})) : (&(8'hbe)));
          reg11 <= (~^$unsigned($signed({(reg10 ? reg7 : wire0)})));
          if (({reg7, $unsigned(reg8[(4'hd):(2'h2)])} ?
              $signed($unsigned(reg10[(1'h0):(1'h0)])) : $unsigned(((+reg10) ?
                  ($signed(reg11) ?
                      (wire5 ?
                          wire0 : wire2) : ((8'h9f) <= wire3)) : $unsigned($unsigned(reg7))))))
            begin
              reg12 <= wire6;
              reg13 <= wire3;
              reg14 <= $unsigned(reg13);
              reg15 <= $signed(reg10[(3'h4):(2'h2)]);
            end
          else
            begin
              reg12 <= {wire0};
              reg13 <= ((($unsigned(wire6) ? reg8 : $signed($unsigned(reg13))) ?
                      (!$unsigned(wire0[(4'hc):(3'h7)])) : {(+$signed(reg8))}) ?
                  reg11[(2'h3):(1'h0)] : (~&$unsigned(wire6)));
              reg14 <= wire4;
              reg15 <= {$unsigned($unsigned(($signed(reg13) ? wire2 : wire6)))};
            end
        end
      else
        begin
          if (wire6)
            begin
              reg9 <= (8'hbf);
              reg10 <= $unsigned(($signed(($signed(reg14) ?
                      (~reg12) : reg8[(1'h0):(1'h0)])) ?
                  ($unsigned(reg15) ^~ {reg10[(1'h1):(1'h0)],
                      (reg11 || reg14)}) : reg15[(1'h0):(1'h0)]));
              reg11 <= wire6[(3'h5):(3'h4)];
              reg12 <= {$signed({((&reg8) & reg12)}),
                  $signed((($signed(wire0) ?
                      $unsigned(reg15) : {wire2}) <<< ((reg11 <= wire4) ?
                      reg12 : $unsigned((8'ha8)))))};
              reg13 <= reg13;
            end
          else
            begin
              reg9 <= ({$signed({(!wire4)})} ?
                  wire0 : (((-reg12) ?
                      (8'hae) : (wire1 ?
                          wire3[(3'h5):(3'h5)] : reg13)) | (-(^~{reg12}))));
              reg10 <= $unsigned(wire2[(3'h4):(2'h2)]);
              reg11 <= (reg10 | reg10);
              reg12 <= $signed(reg7);
              reg13 <= $signed({$unsigned($unsigned((wire3 ? reg12 : reg9))),
                  ($unsigned($signed((8'hb0))) - ((&(7'h41)) >>> reg10[(3'h5):(3'h5)]))});
            end
        end
    end
  assign wire16 = $signed((!(8'hb3)));
endmodule
