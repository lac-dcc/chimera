module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed($signed(($unsigned(wire0[(3'h5):(3'h5)]) ?
                     (~wire1) : (((7'h40) ? wire0 : wire4) | (+wire2)))));
  always
    @(posedge clk) begin
      reg6 <= (($unsigned($signed((~wire5))) > wire0[(2'h3):(2'h3)]) ^~ (8'hb0));
      reg7 <= wire5;
    end
  assign wire8 = (^(^~(~((~|wire0) ? $signed((8'hb4)) : (-wire4)))));
  assign wire9 = (!wire8[(3'h4):(2'h3)]);
  assign wire10 = ($signed($unsigned((^$unsigned(wire5)))) & $signed((^wire3[(2'h3):(1'h0)])));
  assign wire11 = wire0[(3'h5):(2'h2)];
  assign wire12 = ($unsigned((({wire10, wire5} ?
                          (wire1 && wire0) : $signed((8'hbe))) ?
                      ($unsigned(wire0) ?
                          (wire1 <= wire2) : (wire11 - wire9)) : (((8'ha0) << (8'h9c)) <<< reg7[(3'h6):(3'h4)]))) != $unsigned(wire3[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg13 <= (~|$unsigned(wire9));
      if (($signed(wire0[(1'h1):(1'h0)]) ?
          $signed(reg7) : (|((~&wire9[(3'h6):(1'h1)]) ?
              (8'ha9) : (^~(reg6 ^~ wire5))))))
        begin
          reg14 <= reg6;
          reg15 <= $signed(($unsigned({reg13, {reg6, wire2}}) * reg14));
        end
      else
        begin
          reg14 <= $unsigned({$signed(((~&wire4) ?
                  $signed(wire3) : (wire11 ? reg7 : (8'hb7)))),
              $unsigned({$signed(wire1)})});
          reg15 <= reg13[(4'h8):(4'h8)];
        end
      reg16 <= ((8'hb3) > $unsigned(wire12));
      reg17 <= (&(8'ha0));
    end
  assign wire18 = wire9[(4'hd):(4'hb)];
  assign wire19 = (8'had);
  assign wire20 = wire2[(1'h1):(1'h1)];
  assign wire21 = $signed((reg7 ?
                      $unsigned(($unsigned(wire18) ?
                          wire19 : $signed(wire20))) : ($signed(reg17[(4'hb):(4'hb)]) ?
                          (^$signed(reg15)) : ($signed(wire10) ?
                              {wire4} : wire1[(4'h8):(2'h2)]))));
  assign wire22 = ((wire18[(1'h1):(1'h0)] ?
                          $signed(((wire3 >>> wire21) + $unsigned(wire4))) : (&(~|wire11[(3'h7):(1'h0)]))) ?
                      (+wire11) : $signed(({$signed(wire12)} && wire1)));
  assign wire23 = wire10[(1'h1):(1'h0)];
  assign wire24 = ({(($unsigned(reg15) <= {wire22}) ?
                              $unsigned({reg17}) : reg13)} ?
                      wire22[(2'h2):(1'h1)] : (^((((8'hb8) >= reg16) ~^ (~^wire18)) < reg15)));
endmodule
