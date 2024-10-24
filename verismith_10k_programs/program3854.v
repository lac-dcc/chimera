module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed(($signed($signed({wire2,
                     wire1})) > ((^~(^wire0)) >>> wire3)));
  assign wire5 = {(~$unsigned((~((8'ha2) ? wire0 : (8'hab)))))};
  always
    @(posedge clk) begin
      reg6 <= (wire0 & ($unsigned({$unsigned((8'hb8))}) - (((!wire5) >= $signed((8'hbe))) ?
          $signed((^wire1)) : $signed(wire5[(2'h2):(1'h1)]))));
      reg7 <= (8'hb6);
      if ((($unsigned(wire0[(4'h9):(1'h1)]) <<< ($unsigned($signed(reg6)) ?
          ({wire3} ^ wire0) : $signed({wire1,
              wire1}))) ^~ wire1[(4'hf):(1'h0)]))
        begin
          reg8 <= ({wire5, (wire3 ? wire1 : reg7[(3'h7):(1'h0)])} <<< wire0);
          reg9 <= $unsigned((wire0 ^~ (^~$unsigned(wire1))));
        end
      else
        begin
          reg8 <= wire5[(3'h5):(3'h5)];
          reg9 <= $signed(((7'h41) < (reg6 >> $signed({reg8}))));
          if ($unsigned(reg8))
            begin
              reg10 <= $signed((({reg6[(1'h0):(1'h0)]} <<< (~$unsigned((8'haa)))) ?
                  reg8 : (^~$signed({reg8, wire5}))));
            end
          else
            begin
              reg10 <= wire2[(1'h1):(1'h1)];
              reg11 <= $unsigned(reg7);
              reg12 <= (+reg7);
            end
        end
      reg13 <= $unsigned(reg6);
    end
  assign wire14 = {{reg10}, (^reg13)};
  assign wire15 = ((~(reg12 && ((^~reg13) ? $signed(reg7) : (&wire0)))) ?
                      $unsigned((~&$signed({wire1, reg6}))) : (reg10 ?
                          $signed(wire14[(1'h0):(1'h0)]) : reg12));
endmodule
