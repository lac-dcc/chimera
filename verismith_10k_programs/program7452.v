module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire11, wire10, wire9, wire6, wire5, reg8, reg7, (1'h0)};
  assign wire5 = $signed($signed(wire0[(1'h1):(1'h1)]));
  assign wire6 = $signed(((-wire5) ? wire2 : wire1[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ($unsigned({{$signed(((8'ha7) <= (8'h9c)))},
          $unsigned($signed({(8'ha1)}))}))
        begin
          reg7 <= ($unsigned(wire6) >= $unsigned(($unsigned((wire5 ?
              (8'haf) : wire1)) >= {$signed(wire6)})));
        end
      else
        begin
          reg7 <= $signed({$unsigned({wire1, wire4})});
          reg8 <= (wire6 << wire0);
        end
    end
  assign wire9 = {(wire2 ?
                         ((~&$signed(wire0)) ?
                             (^~reg7) : ({wire6, (8'hb7)} ?
                                 (wire2 ?
                                     wire0 : wire3) : reg7[(2'h2):(2'h2)])) : $unsigned(wire1[(3'h5):(2'h3)]))};
  assign wire10 = ($unsigned($unsigned({wire4[(3'h6):(3'h6)],
                          (reg8 & wire9)})) ?
                      $signed($signed($unsigned((+wire5)))) : ((wire2[(3'h5):(3'h4)] | (8'ha6)) != $unsigned(($signed(wire5) ?
                          $unsigned(wire0) : $signed(wire1)))));
  assign wire11 = $signed(wire3[(4'he):(4'hd)]);
endmodule
