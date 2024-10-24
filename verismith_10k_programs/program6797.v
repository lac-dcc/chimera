module top
#(parameter param23 = {((((^~(8'hbd)) || (-(8'hb2))) ? (((8'hba) ? (8'hb6) : (8'had)) ^ {(8'ha9), (8'hb9)}) : {{(8'haf), (8'hb2)}, {(8'hbc)}}) ? (((&(8'hb7)) ? ((8'ha2) ? (8'h9e) : (7'h40)) : ((8'hae) ? (8'hb3) : (8'hae))) + (~|((8'hbc) >= (8'had)))) : (&{(&(8'h9e))}))}, 
parameter param24 = (&param23))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire16,
                 wire7,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = {$unsigned(wire4[(4'h8):(2'h2)])};
  assign wire6 = wire1;
  assign wire7 = $unsigned((|({wire1[(4'h8):(2'h2)], (wire6 >>> wire4)} ?
                     wire1[(1'h0):(1'h0)] : (wire0 != $unsigned(wire2)))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire6[(1'h0):(1'h0)]);
      if ((~(wire2 | (wire2 ^ (8'ha1)))))
        begin
          reg9 <= (^~((wire1[(3'h6):(3'h6)] ?
                  (^$unsigned(wire4)) : wire4[(3'h7):(1'h1)]) ?
              (($unsigned(reg8) > (~^wire5)) ?
                  ({wire7, (8'hbf)} & (wire0 ?
                      wire2 : wire5)) : (8'hac)) : {$signed(wire7[(4'h8):(3'h4)])}));
        end
      else
        begin
          reg9 <= (wire4 * ((-wire3) < ((~|$signed(wire3)) >>> $signed($signed(wire0)))));
          reg10 <= wire6[(1'h0):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg11 <= $signed(wire2);
      if ($signed(((|((reg11 < wire3) ? {reg11} : (reg8 ~^ wire4))) ?
          (((wire6 ^~ wire6) ? wire0 : ((7'h43) ~^ wire1)) ?
              wire3[(3'h7):(3'h5)] : wire4[(2'h3):(2'h3)]) : $unsigned({(wire2 | reg11)}))))
        begin
          reg12 <= $signed($signed($unsigned({(reg11 ? reg10 : wire4),
              $unsigned(reg9)})));
          reg13 <= (-(|$unsigned(reg9[(1'h1):(1'h0)])));
          reg14 <= (&wire5);
          reg15 <= (^~(~&{({(8'hb0)} + (wire2 ? reg10 : wire2))}));
        end
      else
        begin
          if ({(~^reg11)})
            begin
              reg12 <= ((wire0[(1'h1):(1'h1)] ?
                      (wire6 == (8'ha9)) : $unsigned(reg13[(2'h2):(1'h1)])) ?
                  $signed(({$signed(wire5)} <<< ((~|wire4) >= $signed(reg9)))) : {$signed(reg8)});
              reg13 <= $unsigned(($unsigned(wire4) ?
                  $signed((+$unsigned((8'haf)))) : {(&(^wire4))}));
            end
          else
            begin
              reg12 <= wire5[(3'h4):(2'h3)];
            end
        end
    end
  assign wire16 = wire1[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg17 <= $signed((^wire4));
      reg18 <= $signed(reg8);
      reg19 <= $signed(wire2[(1'h0):(1'h0)]);
      reg20 <= ($unsigned((|reg8)) != (~|reg9));
    end
  assign wire21 = (-{{$unsigned((~&wire2)),
                          ($unsigned(reg14) ?
                              $unsigned(wire4) : $signed((8'had)))}});
  assign wire22 = wire2;
endmodule
