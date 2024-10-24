module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire24,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 wire4,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg12,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $unsigned(wire2[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg6 <= ($unsigned((((8'ha9) ?
          ((8'hb3) ? wire1 : wire0) : ((7'h44) ?
              wire2 : wire1)) >>> $signed((wire1 < (8'hbb))))) | (&$signed($signed((|wire3)))));
      reg7 <= $unsigned((8'ha8));
    end
  assign wire8 = ($unsigned((((!(8'hb8)) ?
                         $unsigned(wire3) : $unsigned(wire5)) < $signed($unsigned((8'hba))))) ?
                     wire3 : (^~reg7[(4'h8):(2'h3)]));
  assign wire9 = $signed(reg6);
  assign wire10 = wire4;
  assign wire11 = $unsigned(wire3);
  always
    @(posedge clk) begin
      reg12 <= reg6;
    end
  assign wire13 = $unsigned((~|reg7[(3'h6):(3'h4)]));
  assign wire14 = {wire10[(3'h4):(1'h1)], reg12[(3'h7):(2'h3)]};
  assign wire15 = (~|wire5);
  always
    @(posedge clk) begin
      reg16 <= $unsigned((!{$unsigned((~&wire8)), reg6[(3'h6):(3'h5)]}));
      reg17 <= wire8;
    end
  assign wire18 = reg12;
  assign wire19 = (-wire11[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg20 <= (((wire19 ?
                  ((~^wire10) - wire18) : (wire14 ?
                      (reg12 ? wire11 : wire5) : $unsigned(wire19))) ?
              (reg17[(3'h4):(2'h2)] ?
                  {$unsigned(wire2),
                      (7'h41)} : ($signed(wire9) + $unsigned(wire19))) : $unsigned(($signed(reg7) ?
                  ((8'h9e) > wire18) : {wire10, wire15}))) ?
          {reg16[(4'hc):(2'h2)]} : $unsigned(((&$signed(reg17)) ?
              ((reg17 ?
                  wire4 : wire2) < (~&wire2)) : $unsigned($signed(reg16)))));
      reg21 <= (8'hb6);
      if ((!$unsigned((~|($unsigned((8'ha3)) ? $unsigned(wire5) : {(8'hb0)})))))
        begin
          if ($signed((wire2 >> $unsigned($signed((reg17 ^ reg20))))))
            begin
              reg22 <= $signed((|($signed(wire8) ^~ ($signed(wire1) ?
                  (reg17 == reg12) : {reg6, reg6}))));
              reg23 <= (&((+$signed(((8'hb9) ? wire8 : reg22))) ?
                  (^~$unsigned((8'hac))) : wire15[(1'h1):(1'h0)]));
            end
          else
            begin
              reg22 <= wire3[(5'h14):(4'hf)];
            end
        end
      else
        begin
          reg22 <= (~&wire2[(4'hc):(3'h6)]);
          reg23 <= ($unsigned({(~|(~reg17)),
              $unsigned($unsigned(wire8))}) ^~ $unsigned($unsigned(wire15)));
        end
    end
  assign wire24 = wire8;
endmodule
