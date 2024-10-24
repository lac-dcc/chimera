module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire18,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = ((({((8'ha7) ? wire2 : wire1), wire4} | {wire2}) ?
                     (-$signed(wire4[(4'h9):(3'h7)])) : $unsigned($signed((7'h41)))) >> (wire2[(1'h0):(1'h0)] ~^ $unsigned(wire4[(4'ha):(2'h2)])));
  assign wire6 = ($unsigned(wire5[(3'h7):(3'h5)]) ^ ((~^$unsigned((~^wire3))) != $signed(wire0)));
  assign wire7 = (~^{(wire1[(3'h4):(1'h1)] ?
                         $signed(wire6[(2'h3):(1'h1)]) : (&(wire6 ?
                             wire4 : wire6))),
                     wire5[(1'h1):(1'h1)]});
  assign wire8 = $signed(wire7[(1'h1):(1'h1)]);
  assign wire9 = (!(-$unsigned((wire3[(4'ha):(2'h3)] <<< wire1[(4'hb):(2'h2)]))));
  always
    @(posedge clk) begin
      if ((($signed($signed(wire7)) * wire8[(4'hb):(3'h4)]) && wire9))
        begin
          reg10 <= wire3[(5'h12):(2'h3)];
          reg11 <= (wire2[(4'h9):(3'h6)] ?
              ($signed($unsigned(((8'ha5) ^~ wire2))) ?
                  wire5 : $unsigned(($signed(wire1) ^~ wire0))) : (wire0 ?
                  {$unsigned((reg10 || wire3))} : $signed(wire8)));
        end
      else
        begin
          reg10 <= wire5;
          reg11 <= $unsigned(wire8[(4'ha):(4'ha)]);
          if (wire7)
            begin
              reg12 <= ((wire5 ?
                      wire0[(1'h1):(1'h1)] : $unsigned(reg10[(3'h5):(1'h1)])) ?
                  wire6[(2'h3):(1'h0)] : {($signed(wire0) <= $signed((wire9 ?
                          wire1 : wire0)))});
              reg13 <= $unsigned($signed(((+((8'hae) ? wire9 : reg12)) ?
                  wire1[(2'h2):(1'h1)] : wire7)));
              reg14 <= ({$unsigned((^reg13))} ?
                  (reg10 * (((wire0 <= wire3) ?
                      wire4[(4'he):(4'he)] : (wire5 + (7'h43))) <<< (&wire3))) : wire4);
              reg15 <= ($unsigned($signed(wire8[(3'h6):(3'h4)])) == $signed((8'ha4)));
              reg16 <= (!(8'ha9));
            end
          else
            begin
              reg12 <= $unsigned(wire4[(1'h1):(1'h0)]);
              reg13 <= ((8'hb2) <= (8'hab));
            end
        end
      reg17 <= (($unsigned(($unsigned(reg10) ?
              (|wire0) : reg16[(5'h12):(4'hc)])) || wire7) ?
          ($unsigned($unsigned(wire8)) ?
              $unsigned(wire1[(3'h6):(1'h0)]) : $unsigned(wire7[(2'h3):(1'h1)])) : reg13[(2'h2):(1'h0)]);
    end
  assign wire18 = ($unsigned($unsigned(($signed(reg15) ?
                          wire0[(1'h0):(1'h0)] : (reg11 >> (8'hbd))))) ?
                      wire2 : $signed(($unsigned($signed(wire9)) ?
                          ((^~reg17) ?
                              (wire6 ?
                                  wire2 : reg15) : reg12) : wire0[(1'h1):(1'h1)])));
endmodule
