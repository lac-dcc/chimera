module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire3[(2'h3):(1'h1)];
  assign wire5 = wire3[(1'h1):(1'h1)];
  assign wire6 = wire0[(2'h3):(2'h2)];
  assign wire7 = ($unsigned((&wire5)) ?
                     {$signed($signed((^(8'hac))))} : wire3[(2'h3):(1'h0)]);
  assign wire8 = $unsigned($signed(wire1));
  assign wire9 = wire0;
  assign wire10 = $unsigned($unsigned($unsigned(wire8)));
  always
    @(posedge clk) begin
      if ((($signed($unsigned((~^wire0))) >>> $signed({((8'hb9) ~^ wire4),
          (8'ha3)})) <<< ((8'ha0) && (!(wire10 ~^ (^wire7))))))
        begin
          reg11 <= wire0;
          reg12 <= wire9[(3'h5):(1'h1)];
        end
      else
        begin
          reg11 <= (wire8[(4'hc):(3'h4)] ^~ (($signed($unsigned((8'hb0))) ?
              $unsigned($signed(wire10)) : $unsigned((wire6 && wire9))) <<< ({reg11,
              $signed((7'h42))} >> (8'hae))));
          reg12 <= (^~{($unsigned((~(8'ha1))) + $unsigned($unsigned((8'hbf))))});
        end
      reg13 <= (((^(((8'h9c) ? wire5 : wire3) >>> (!reg11))) ?
              wire10[(3'h7):(1'h1)] : $signed((7'h41))) ?
          ($signed($signed($unsigned(wire9))) >> (($unsigned(wire6) ^ wire3[(1'h0):(1'h0)]) * $unsigned((wire0 < wire9)))) : ($signed($unsigned((8'ha0))) ?
              {$signed((8'ha0)),
                  ((wire1 >>> (8'ha0)) ?
                      wire7[(2'h2):(1'h0)] : (wire0 ?
                          reg11 : wire1))} : reg11));
      reg14 <= wire6[(1'h1):(1'h1)];
      reg15 <= $signed(($signed($signed(reg11[(3'h5):(2'h2)])) ?
          {(~reg11[(3'h5):(1'h0)]),
              $unsigned($unsigned(wire9))} : $signed(((&(8'ha9)) | {reg13}))));
      if (($signed((-reg11)) ?
          (reg14[(4'h8):(3'h7)] >= ((wire1 & (reg13 - reg15)) ?
              (wire7 & (-wire3)) : ($signed(reg12) <= $unsigned(wire10)))) : reg12[(1'h1):(1'h1)]))
        begin
          if ((reg12 ?
              $signed((~^$signed($unsigned(wire3)))) : $signed(($unsigned(wire5) ?
                  wire7 : reg14[(1'h1):(1'h1)]))))
            begin
              reg16 <= ((~&wire3) ? reg15 : (reg11 && wire8));
              reg17 <= $signed(((wire0[(1'h1):(1'h1)] ?
                  ($unsigned(wire9) ?
                      $signed(wire8) : (reg14 < (7'h40))) : ((~&wire10) * $unsigned(reg15))) != (|$unsigned((|reg11)))));
            end
          else
            begin
              reg16 <= (reg12 == $unsigned({$unsigned($signed(reg15)),
                  (~&wire9)}));
              reg17 <= $unsigned($unsigned((reg13 ^ $signed($unsigned(wire0)))));
              reg18 <= $unsigned($unsigned((wire8 ?
                  $signed($signed(reg16)) : wire8)));
            end
          reg19 <= reg18[(4'hd):(4'hb)];
          reg20 <= $signed((wire10[(1'h0):(1'h0)] + wire4));
          reg21 <= $unsigned(wire6[(2'h2):(1'h1)]);
          reg22 <= {{($unsigned((wire2 * reg12)) || ((reg19 ? reg17 : wire2) ?
                      $unsigned(wire8) : reg21))},
              wire9[(3'h4):(3'h4)]};
        end
      else
        begin
          reg16 <= {$signed((({reg12} * wire6) >> reg17)), reg16};
        end
    end
  assign wire23 = (8'ha5);
  assign wire24 = reg21[(3'h4):(2'h3)];
  assign wire25 = ($unsigned((wire23 ?
                          ((reg16 ? wire23 : reg21) * (~&(8'ha1))) : wire2)) ?
                      wire10 : $signed((((reg13 ? reg15 : wire24) ?
                          $unsigned(reg16) : reg17) || wire8)));
  assign wire26 = ($signed((!reg13)) >>> wire24[(4'hb):(3'h7)]);
endmodule
