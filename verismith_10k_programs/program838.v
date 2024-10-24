module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (($unsigned(($signed(wire3) ?
                             $signed(wire2) : $unsigned((8'ha5)))) ?
                         (^(((8'hb6) > wire1) ?
                             $signed(wire0) : wire3)) : (^~((wire1 ?
                             (8'ha6) : wire2) ^ $signed(wire0)))) ?
                     ($signed(($unsigned(wire1) ^~ (wire0 ?
                         wire0 : wire1))) > (wire3 - wire0[(3'h5):(2'h2)])) : ($unsigned($signed($signed(wire0))) ?
                         (($signed(wire0) + wire3) ?
                             $signed(wire1[(2'h2):(1'h1)]) : {$unsigned((8'hb0)),
                                 $signed(wire2)}) : ($signed((~^wire1)) ?
                             (wire0 ?
                                 $unsigned(wire1) : ((8'hbd) ?
                                     wire1 : wire2)) : ((wire0 ?
                                 wire3 : wire0) <= wire0[(4'hd):(4'hd)]))));
  always
    @(posedge clk) begin
      if (wire0[(5'h13):(4'hf)])
        begin
          reg5 <= $unsigned((({wire4[(4'hb):(3'h4)]} ?
              (8'ha0) : ({wire4, (8'ha1)} ?
                  (wire1 <= wire0) : $signed((7'h40)))) - wire4[(3'h6):(1'h1)]));
          reg6 <= (wire2 ?
              (wire4[(4'hb):(3'h4)] ?
                  (-$signed({wire3, (8'hab)})) : {{reg5}}) : wire2);
          reg7 <= (((&reg5) ? reg5 : wire3[(1'h1):(1'h1)]) ?
              (wire0 ?
                  reg5[(2'h2):(1'h0)] : $unsigned(wire3)) : (($unsigned((wire4 ?
                  wire2 : wire1)) * {(wire0 ? wire3 : (8'hb1)),
                  (wire0 && wire3)}) <<< ((reg5 ?
                  $signed((8'h9c)) : (8'h9f)) << $signed({wire3, wire3}))));
          reg8 <= (+$signed(($unsigned((!wire3)) ?
              reg7 : reg5[(4'hb):(3'h4)])));
        end
      else
        begin
          reg5 <= ($signed(reg6[(2'h2):(1'h0)]) * $signed(wire1));
          reg6 <= reg5;
          reg7 <= wire2[(1'h1):(1'h1)];
        end
      reg9 <= ((8'hb6) & (-reg6[(1'h0):(1'h0)]));
    end
  assign wire10 = $unsigned((+((wire1 ?
                      ((8'h9e) ? reg8 : wire2) : (wire4 ?
                          reg8 : reg8)) - reg9)));
  assign wire11 = (~(wire10 ?
                      reg5[(3'h5):(2'h2)] : $signed(({reg8, (8'hb3)} ?
                          wire4[(4'h8):(3'h6)] : $unsigned(wire3)))));
  assign wire12 = (~(8'h9c));
  assign wire13 = $signed(((~^(&wire2[(2'h2):(1'h1)])) | $signed(wire10[(1'h0):(1'h0)])));
  assign wire14 = (reg7 ? $signed($signed(reg6)) : $signed(wire12));
  assign wire15 = ($signed((^$signed((^~wire12)))) << {($signed(reg9[(1'h0):(1'h0)]) | (reg6[(2'h3):(1'h0)] ?
                          reg5[(1'h1):(1'h0)] : wire3))});
  assign wire16 = reg9[(4'ha):(4'h8)];
  assign wire17 = (~^(^~$unsigned($signed((~wire4)))));
  assign wire18 = {wire16[(3'h6):(1'h1)]};
endmodule
