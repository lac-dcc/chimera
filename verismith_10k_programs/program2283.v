module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (({$signed($signed(wire2))} | $unsigned(((~&wire3) ^ $signed(wire1)))) ?
                     ({wire0[(1'h1):(1'h1)], (~|wire0[(1'h1):(1'h0)])} ?
                         (7'h42) : (-wire2)) : wire0);
  assign wire5 = wire4;
  assign wire6 = wire1[(4'he):(1'h0)];
  assign wire7 = wire3;
  assign wire8 = (|($signed(((wire6 ? wire7 : wire7) ^ wire4)) ?
                     $signed(((-wire6) ?
                         $signed(wire1) : (wire0 <= wire2))) : ($signed($signed(wire2)) ?
                         (wire7 ~^ wire3) : ($unsigned(wire2) > $signed(wire2)))));
  always
    @(posedge clk) begin
      reg9 <= wire7;
      if ((~(wire2[(2'h3):(1'h1)] ?
          (&((wire6 ^ wire2) >= wire3)) : $signed(($signed(wire7) ?
              (~|(8'h9c)) : ((8'hbd) ? wire1 : wire5))))))
        begin
          reg10 <= (~$signed((&reg9[(2'h2):(1'h1)])));
          reg11 <= reg9[(4'ha):(3'h4)];
          reg12 <= wire7;
          if ($unsigned(({(wire0[(1'h1):(1'h1)] ? $unsigned(reg12) : wire0),
                  reg12} ?
              $unsigned(($signed((8'hb0)) ?
                  (reg9 ? wire4 : wire0) : $signed(wire1))) : (~&(8'hb4)))))
            begin
              reg13 <= ($signed($unsigned(wire4[(2'h3):(1'h0)])) ?
                  ($unsigned(((wire6 ? wire6 : wire1) ?
                      (8'ha8) : reg12[(3'h7):(2'h3)])) <= ($unsigned((~|wire4)) == wire8[(1'h1):(1'h1)])) : (^wire7));
              reg14 <= (8'ha4);
            end
          else
            begin
              reg13 <= {((($unsigned(reg10) <= wire0[(1'h0):(1'h0)]) ?
                      (&wire6[(2'h2):(1'h0)]) : (^(wire5 > (8'hb1)))) <<< (!$signed((wire4 < wire3)))),
                  $signed($unsigned($unsigned(reg14)))};
              reg14 <= wire1;
              reg15 <= ($unsigned($unsigned((wire1[(4'hf):(1'h1)] != $signed(reg9)))) ?
                  (((wire4 ~^ {wire6}) != ($signed(wire3) - (wire3 ?
                      reg9 : wire7))) == $signed((reg10[(1'h0):(1'h0)] ^~ {wire7,
                      wire0}))) : (~^$signed((-(~&wire4)))));
              reg16 <= reg13;
            end
        end
      else
        begin
          reg10 <= $signed((($unsigned($signed(wire6)) <= (reg14[(3'h6):(3'h4)] <<< wire5[(3'h5):(3'h4)])) == ($unsigned($signed(reg13)) ?
              $unsigned(wire8) : reg11)));
        end
      reg17 <= ((reg14[(4'he):(4'h9)] ?
              (($signed((8'ha7)) ? reg15 : wire2[(2'h2):(1'h0)]) ?
                  wire3[(3'h6):(2'h2)] : ($unsigned(reg16) ?
                      {reg16} : reg16)) : ((-$signed(wire5)) ?
                  (8'hb1) : $unsigned(wire6[(3'h4):(1'h1)]))) ?
          reg9 : $signed((8'ha3)));
      reg18 <= wire3;
    end
  assign wire19 = $unsigned((|$signed($unsigned((wire1 * reg16)))));
  assign wire20 = (^~({$signed((reg14 ? reg17 : reg18))} ?
                      $signed($signed($unsigned(wire19))) : $unsigned(reg16[(2'h2):(2'h2)])));
endmodule
