module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
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
  assign wire4 = $unsigned((-({(wire2 ? wire2 : wire2)} ~^ $signed(wire1))));
  assign wire5 = ((8'hb0) ?
                     (wire1[(3'h4):(1'h0)] + (~^{(|wire4)})) : (wire3 <<< (~|({wire3} ?
                         (wire3 ? wire2 : wire3) : (~|wire1)))));
  assign wire6 = (8'hb7);
  always
    @(posedge clk) begin
      if ((wire0 ?
          wire2 : $signed(((^wire6[(2'h3):(2'h3)]) ?
              ((^~wire6) | (wire0 ?
                  wire1 : wire6)) : ($unsigned(wire2) <= $unsigned(wire5))))))
        begin
          reg7 <= wire3[(3'h6):(3'h5)];
          reg8 <= $unsigned((+$unsigned((!$unsigned(reg7)))));
          reg9 <= reg7[(1'h0):(1'h0)];
          if (($signed((!$unsigned((^~wire4)))) <<< (&(wire2 || reg8))))
            begin
              reg10 <= $signed((8'haf));
              reg11 <= wire0;
              reg12 <= {(+wire1), wire0[(1'h1):(1'h1)]};
              reg13 <= (~|$signed(wire2));
            end
          else
            begin
              reg10 <= reg10;
              reg11 <= ($unsigned($signed((+{(7'h42),
                  wire4}))) <<< $signed(wire4));
              reg12 <= reg10[(2'h3):(2'h3)];
              reg13 <= (8'had);
              reg14 <= $signed(reg11[(4'h8):(2'h2)]);
            end
        end
      else
        begin
          reg7 <= $signed({{reg9[(2'h3):(2'h3)],
                  {(reg12 ? reg13 : wire5), wire3}}});
          if ($signed({(8'ha8)}))
            begin
              reg8 <= ((^(reg11[(2'h3):(2'h2)] > ($unsigned((8'hac)) ?
                      reg13[(3'h5):(3'h4)] : wire2))) ?
                  ((-$unsigned({reg13,
                      wire6})) >>> (~$signed(reg8[(2'h3):(2'h3)]))) : reg14);
            end
          else
            begin
              reg8 <= ((reg12[(2'h3):(1'h1)] << (($unsigned(reg14) < $unsigned((8'h9d))) ?
                      wire2 : (!(wire2 ? reg11 : wire5)))) ?
                  $signed(wire4[(1'h1):(1'h0)]) : reg13[(3'h4):(2'h2)]);
              reg9 <= (wire1 > reg12[(4'h8):(3'h4)]);
            end
        end
      reg15 <= (~&$unsigned(((reg9[(1'h1):(1'h1)] ?
              (8'hac) : reg7[(1'h1):(1'h0)]) ?
          ((wire4 ^ reg7) || (reg9 != reg11)) : ((|reg8) ?
              reg14[(1'h0):(1'h0)] : (reg11 ? wire6 : wire5)))));
    end
  assign wire16 = (reg12[(1'h1):(1'h0)] || (((|(reg8 ? reg13 : reg10)) ?
                      $unsigned(wire2[(4'he):(4'hb)]) : reg7) <<< (($signed(wire3) ?
                          (reg12 ? (8'hb3) : reg9) : ((8'hac) ?
                              (8'hbe) : reg8)) ?
                      $signed(reg14[(3'h4):(2'h2)]) : wire5[(3'h6):(3'h4)])));
endmodule
