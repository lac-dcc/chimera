module top
#(parameter param16 = (((!(((8'ha7) <= (8'h9f)) < ((8'hb8) ? (8'hb5) : (8'hbf)))) ? (8'h9f) : (~|(((8'hbc) ? (7'h43) : (7'h43)) ? (|(7'h41)) : ((8'hac) | (8'ha6))))) >= ((&(((8'hb6) ? (8'ha8) : (8'hb9)) ? (^(8'ha8)) : ((8'hb2) == (8'ha7)))) <= (|(((8'hbd) ? (8'ha9) : (8'h9c)) != (~&(8'hbf)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  assign y = {wire15,
                 wire6,
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
                 (1'h0)};
  assign wire4 = ((-$unsigned({$unsigned(wire0),
                     $signed(wire3)})) && $signed(((+$signed(wire1)) ?
                     $unsigned(wire2[(4'hb):(1'h1)]) : wire1)));
  assign wire5 = wire4;
  assign wire6 = (&wire0);
  always
    @(posedge clk) begin
      reg7 <= (wire4[(3'h4):(1'h1)] > $signed({(wire3 ?
              (wire6 ? wire2 : wire6) : $unsigned(wire3))}));
      if ((8'hbd))
        begin
          reg8 <= (wire1[(3'h5):(2'h2)] ?
              (^wire3[(5'h11):(3'h5)]) : $signed((7'h43)));
        end
      else
        begin
          reg8 <= ((wire3[(5'h10):(3'h5)] <= ($signed(wire0) <= wire6)) != {wire6,
              (wire1[(1'h1):(1'h1)] ? reg8[(3'h5):(2'h2)] : (8'hb2))});
        end
      if ((!(({wire1} > (wire0 || (wire0 | (8'hb6)))) >= ($unsigned($signed(wire4)) ?
          $unsigned((reg8 ? reg8 : wire1)) : wire6[(2'h3):(1'h0)]))))
        begin
          reg9 <= wire1;
          reg10 <= $unsigned(wire6);
          reg11 <= $unsigned(reg8[(3'h5):(3'h5)]);
          reg12 <= $signed((+wire6[(4'h8):(1'h0)]));
          reg13 <= (~|($unsigned(wire6) <<< (+$signed((reg11 ^~ (8'hb1))))));
        end
      else
        begin
          reg9 <= $signed(reg11[(4'h9):(3'h5)]);
          reg10 <= (!reg8);
          if ((7'h42))
            begin
              reg11 <= ((!$unsigned((~|{wire5}))) ?
                  $signed({$signed((~&(8'hb7)))}) : ($signed(wire1[(1'h0):(1'h0)]) ?
                      $signed((~&$signed(wire2))) : wire5));
              reg12 <= (wire6[(1'h1):(1'h0)] ?
                  $signed(wire6) : (((8'ha9) ?
                      ((reg13 ? (8'hab) : wire6) ?
                          (reg7 ~^ (7'h40)) : $signed(wire3)) : (wire2 - $signed(reg10))) <= ($signed({(8'ha2)}) ?
                      ($unsigned((7'h41)) << reg7) : (+wire4[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg11 <= ((wire2 | $signed($signed(wire0))) ?
                  $signed(((|wire5) - wire0)) : $signed(wire6[(1'h0):(1'h0)]));
              reg12 <= $unsigned(reg8[(2'h3):(1'h1)]);
            end
          reg13 <= ($unsigned((wire6[(3'h6):(3'h5)] - (^(wire6 ?
              reg10 : wire0)))) != ((reg7[(3'h5):(2'h2)] ?
              {$signed(wire4)} : $unsigned(reg12[(2'h3):(2'h3)])) < wire5[(1'h1):(1'h0)]));
        end
      reg14 <= reg7[(1'h1):(1'h1)];
    end
  assign wire15 = wire3[(4'he):(2'h2)];
endmodule
