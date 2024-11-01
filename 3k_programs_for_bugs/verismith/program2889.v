module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((|($unsigned($signed((8'ha2))) ?
              wire2 : $signed($unsigned(wire2)))) ?
          $unsigned(($unsigned((wire3 << (8'h9e))) ?
              ((8'hae) ^~ $unsigned(wire1)) : ((wire0 ^ wire1) ?
                  (~^wire0) : $signed(wire0)))) : {(8'h9e),
              (!wire0[(3'h6):(3'h4)])});
      if (({(wire0[(4'h9):(1'h0)] ~^ wire2[(2'h3):(2'h2)]),
          {{$unsigned(reg4)}}} >> $signed($signed(wire1[(1'h0):(1'h0)]))))
        begin
          reg5 <= wire3[(1'h1):(1'h0)];
          reg6 <= $signed(wire0[(1'h0):(1'h0)]);
          reg7 <= $unsigned((reg4 ? reg5[(3'h4):(3'h4)] : $signed(wire2)));
          reg8 <= $unsigned((+reg4[(2'h3):(2'h2)]));
        end
      else
        begin
          reg5 <= reg7[(1'h1):(1'h0)];
        end
      if (wire1)
        begin
          if (reg6[(2'h2):(1'h0)])
            begin
              reg9 <= $unsigned($unsigned((reg5 ?
                  (~^reg8[(4'hd):(4'hb)]) : {$unsigned(wire3), {wire2}})));
              reg10 <= wire0[(4'hf):(4'hd)];
              reg11 <= ((~(&{(wire2 ? (8'h9f) : wire1),
                  reg10[(2'h2):(2'h2)]})) > ($signed($signed(reg9)) ?
                  (~&$unsigned(wire3)) : $unsigned($signed(reg5[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg9 <= (reg11 >>> ($unsigned((reg5 > (wire0 ? reg4 : reg10))) ?
                  $unsigned(({wire1} >>> $signed(reg5))) : reg4));
            end
        end
      else
        begin
          reg9 <= ((reg9 || (-({wire0,
              reg7} | reg6[(4'h8):(2'h2)]))) <<< $signed(wire2[(1'h1):(1'h1)]));
          reg10 <= reg7[(1'h1):(1'h1)];
          reg11 <= (|$unsigned($signed(reg9)));
        end
    end
  assign wire12 = (^~$signed((|reg9)));
  assign wire13 = $signed(wire3);
  assign wire14 = reg4;
endmodule
