module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = ($signed(wire2) ? wire4 : wire0);
  assign wire6 = ((-wire3[(2'h3):(2'h2)]) ~^ $signed(((~&$unsigned(wire2)) * $unsigned(wire2[(1'h1):(1'h0)]))));
  assign wire7 = {$signed(wire0),
                     {($unsigned({wire1}) ?
                             wire5 : (wire4 ?
                                 (wire2 ? wire6 : wire6) : $unsigned(wire1))),
                         wire6[(1'h1):(1'h0)]}};
  assign wire8 = (wire4 <<< (wire7 ^~ {(wire5 >> (+(7'h40))),
                     ((wire7 <<< wire6) > wire1[(1'h0):(1'h0)])}));
  assign wire9 = $signed(wire4);
  always
    @(posedge clk) begin
      if (($signed(wire0[(4'h9):(1'h1)]) > $signed($signed((wire8[(4'hc):(4'hb)] ?
          (wire9 >= wire1) : {wire2, wire4})))))
        begin
          reg10 <= $unsigned((|$signed((wire1 || (wire4 ? wire3 : wire8)))));
          reg11 <= (+wire4[(2'h2):(1'h0)]);
        end
      else
        begin
          reg10 <= ((-(((wire5 - wire6) || (wire6 <= wire1)) ?
                  reg11[(1'h1):(1'h0)] : ($signed(wire5) ?
                      $unsigned(wire2) : $signed((8'hb0))))) ?
              {$signed($unsigned(wire6))} : $signed($signed(wire9)));
        end
      reg12 <= wire5[(1'h1):(1'h0)];
      reg13 <= ($signed($signed((~^(wire9 ?
          wire5 : wire8)))) && $unsigned((($signed((7'h40)) ?
              reg11[(4'hb):(1'h1)] : $signed(wire6)) ?
          $unsigned(wire5[(4'he):(4'h9)]) : (~^wire9[(1'h0):(1'h0)]))));
      reg14 <= $signed(wire8);
      reg15 <= $unsigned(wire3[(4'ha):(1'h1)]);
    end
  assign wire16 = {(^{{$signed((8'hb1)), reg12[(3'h5):(1'h1)]}})};
  assign wire17 = ((|({(wire9 > reg12), wire6} ?
                      (^~wire2[(2'h3):(1'h0)]) : wire6[(3'h6):(3'h4)])) ^~ ((-($signed((8'ha4)) >> {wire3,
                          wire9})) ?
                      (&($unsigned(reg13) && reg10[(3'h4):(2'h2)])) : (~|wire5[(2'h2):(1'h0)])));
endmodule
