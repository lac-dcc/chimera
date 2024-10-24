module top
#(parameter param11 = (^~{(~^((+(8'hbb)) <<< (~(8'hbb)))), {(((8'h9d) ? (8'hae) : (8'hae)) ? ((8'hba) >> (7'h42)) : (^~(8'h9c)))}}), 
parameter param12 = {{(~&(~(param11 <<< param11))), (~&((param11 - param11) ? (param11 ? param11 : param11) : ((7'h44) ~^ param11)))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg10, reg9, reg8, reg7, (1'h0)};
  assign wire4 = (~{$unsigned((|(wire1 ? wire0 : wire1))),
                     (-((~|wire1) >= $unsigned(wire3)))});
  assign wire5 = wire1;
  assign wire6 = $unsigned({$signed((~&(wire2 ? wire5 : wire0))),
                     (+$unsigned(wire2[(4'hf):(4'he)]))});
  always
    @(posedge clk) begin
      if ($signed((wire4[(4'hc):(4'hc)] ~^ wire1)))
        begin
          reg7 <= $signed($unsigned((|wire0[(2'h3):(1'h1)])));
          reg8 <= wire2;
          reg9 <= $unsigned(($signed(reg7[(3'h4):(1'h0)]) ?
              ((wire4[(4'hf):(4'hf)] - {wire0}) ?
                  $signed((7'h40)) : ($unsigned(wire1) ?
                      $unsigned(wire4) : (~wire1))) : wire6));
          reg10 <= reg9[(4'hf):(2'h2)];
        end
      else
        begin
          reg7 <= {(8'hbd)};
          reg8 <= (^wire5);
        end
    end
endmodule
