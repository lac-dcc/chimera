module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire4, reg6, reg5, (1'h0)};
  assign wire4 = ({wire3[(3'h4):(2'h3)],
                     wire3[(3'h5):(2'h3)]} >> wire2[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      if (($signed(wire4) || wire1))
        begin
          reg5 <= {wire0};
        end
      else
        begin
          if ($unsigned(wire1[(4'h9):(2'h2)]))
            begin
              reg5 <= (&$signed($unsigned($unsigned($unsigned(wire0)))));
            end
          else
            begin
              reg5 <= {$unsigned(wire2[(2'h2):(1'h0)])};
              reg6 <= $signed({((((8'ha7) == wire0) ?
                      ((7'h44) > wire1) : wire1[(3'h6):(2'h3)]) < wire2),
                  (^~$unsigned($signed(wire2)))});
            end
        end
    end
  assign wire7 = ($signed($unsigned((~|(&wire3)))) + $unsigned($unsigned(($signed(reg6) >> wire2[(1'h1):(1'h1)]))));
  assign wire8 = {wire4[(3'h4):(2'h3)]};
  assign wire9 = $unsigned((8'hb4));
  assign wire10 = wire3[(1'h0):(1'h0)];
endmodule
