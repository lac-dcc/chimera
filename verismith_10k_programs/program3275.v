module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  assign y = {wire14,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = wire2[(3'h6):(2'h2)];
  assign wire5 = {wire0, (8'hb7)};
  assign wire6 = (^~wire1);
  assign wire7 = {wire6};
  assign wire8 = wire2;
  assign wire9 = $unsigned((&((wire0 ? (8'hac) : wire4) ? wire4 : wire4)));
  always
    @(posedge clk) begin
      if (($signed((~^wire7[(4'h8):(3'h4)])) & (&(wire2[(3'h4):(3'h4)] ?
          $unsigned(wire0[(3'h6):(1'h1)]) : (!(wire4 != wire9))))))
        begin
          if ($signed($signed(wire7[(2'h2):(1'h1)])))
            begin
              reg10 <= {(wire5[(1'h1):(1'h0)] ?
                      (((wire6 ? (8'h9f) : wire4) ?
                          (wire7 > wire9) : wire2[(4'h8):(3'h6)]) || wire2) : $signed((wire0 + {wire4})))};
              reg11 <= (wire0 ?
                  {wire9[(5'h13):(1'h1)],
                      ((8'ha9) ?
                          wire2 : {((8'hb3) != wire6),
                              wire9})} : $signed(((~(wire1 >= wire0)) ?
                      {(wire8 ~^ wire2)} : wire4)));
            end
          else
            begin
              reg10 <= $unsigned(wire4[(3'h4):(1'h1)]);
              reg11 <= ($signed(wire0) >>> wire2[(4'hd):(4'hb)]);
            end
          reg12 <= (wire6[(4'hb):(2'h2)] ?
              wire2[(3'h4):(2'h2)] : {wire3[(3'h5):(1'h0)]});
          reg13 <= wire3[(4'ha):(2'h2)];
        end
      else
        begin
          reg10 <= (wire9 << ($unsigned((&wire9)) >>> wire7[(3'h5):(2'h3)]));
          if (wire9)
            begin
              reg11 <= (($signed(wire5[(1'h1):(1'h1)]) ?
                  (|wire2[(4'h8):(3'h6)]) : wire8[(5'h10):(3'h4)]) | {(&((wire6 < (8'haf)) ?
                      reg10[(3'h7):(1'h1)] : (wire8 ? reg11 : wire6))),
                  ((&(8'h9c)) * (|$signed(wire4)))});
            end
          else
            begin
              reg11 <= $unsigned($signed(wire6));
              reg12 <= {(~^($unsigned(wire9[(3'h5):(3'h5)]) ?
                      {wire4[(4'he):(4'he)], (^~reg10)} : $unsigned((reg13 ?
                          wire5 : wire8))))};
            end
          reg13 <= (~$unsigned($signed(wire0[(2'h2):(2'h2)])));
        end
    end
  assign wire14 = reg12[(4'ha):(1'h1)];
endmodule
