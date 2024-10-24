module top
#(parameter param26 = (&(|({((7'h41) || (8'ha6))} ? ((&(8'ha9)) * ((8'hbd) < (7'h42))) : {(^~(8'hae))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire12,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 (1'h0)};
  assign wire5 = wire3[(4'h9):(4'h8)];
  assign wire6 = {wire0[(3'h4):(1'h1)], $signed(wire3)};
  assign wire7 = wire2[(2'h2):(1'h0)];
  assign wire8 = $unsigned({wire7[(1'h1):(1'h1)]});
  assign wire9 = $unsigned($unsigned($unsigned((~|$unsigned(wire3)))));
  assign wire10 = ((wire6 ?
                      ($signed($signed(wire4)) != (-((8'hac) ?
                          wire0 : wire4))) : $signed((8'ha7))) ~^ ((wire3[(3'h4):(2'h3)] ?
                      (8'h9f) : $unsigned((^wire4))) ^ (~wire3)));
  always
    @(posedge clk) begin
      reg11 <= $unsigned((+(!{wire2[(4'h8):(1'h1)]})));
    end
  assign wire12 = wire6[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg13 <= wire6[(3'h6):(1'h1)];
      if (reg11)
        begin
          reg14 <= $signed((^(~(wire12[(2'h2):(1'h1)] ?
              (wire2 ? wire12 : wire10) : (!wire0)))));
        end
      else
        begin
          reg14 <= wire10[(1'h0):(1'h0)];
          if ((($signed(reg13[(5'h12):(5'h10)]) <= $signed($signed($unsigned((8'h9c))))) ?
              wire5 : (&wire6)))
            begin
              reg15 <= (|wire1[(1'h0):(1'h0)]);
              reg16 <= (reg13 - $signed(wire10));
              reg17 <= wire7[(4'hb):(3'h5)];
            end
          else
            begin
              reg15 <= ((+$unsigned({(wire3 ? wire4 : reg16),
                  wire1})) && $unsigned({({reg15, wire8} ?
                      wire2[(2'h3):(2'h3)] : $signed(wire5))}));
            end
          reg18 <= reg17[(1'h0):(1'h0)];
          reg19 <= (8'hbe);
          if (((|(^~$unsigned(wire3[(3'h6):(1'h1)]))) >= $unsigned({($unsigned(reg14) ?
                  wire6[(3'h5):(2'h3)] : $signed((8'ha2))),
              (~&reg13[(3'h7):(3'h6)])})))
            begin
              reg20 <= wire9[(4'h8):(3'h6)];
            end
          else
            begin
              reg20 <= (+reg11[(2'h3):(2'h3)]);
              reg21 <= $unsigned((&reg11[(2'h2):(2'h2)]));
            end
        end
    end
  assign wire22 = $unsigned(wire0);
  assign wire23 = reg14;
  assign wire24 = wire12;
  assign wire25 = (~^(reg19[(3'h5):(3'h4)] ?
                      $unsigned(reg21) : $signed({$signed(wire24)})));
endmodule
