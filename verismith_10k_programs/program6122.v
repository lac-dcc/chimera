module top
#(parameter param11 = (&(~&(({(8'ha3)} ? (~&(8'hbd)) : ((8'hac) >>> (8'hbd))) ? (((8'ha1) ? (8'ha3) : (8'haa)) >>> {(8'ha7)}) : (~^{(8'h9c), (8'hb3)})))), 
parameter param12 = ({({((8'hbf) ? param11 : param11), (~^param11)} != (8'haa))} ? param11 : ((param11 ? param11 : (^~{param11})) ? param11 : param11)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire10, wire9, wire5, wire4, reg8, reg7, reg6, (1'h0)};
  assign wire4 = (-wire1);
  assign wire5 = (({($unsigned((8'hb4)) ? (~wire0) : (^~wire3)),
                             wire4[(2'h3):(2'h3)]} ?
                         (8'hbc) : wire1) ?
                     wire4[(2'h3):(1'h0)] : ({((wire2 ^~ (8'hba)) ~^ (wire4 ?
                             (8'ha3) : (8'had)))} != wire2[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg6 <= wire5[(1'h1):(1'h0)];
      reg7 <= ({((^~(wire5 & wire1)) ? $unsigned(reg6) : wire2),
              (reg6 ?
                  {(reg6 <= reg6), (wire3 ? reg6 : (8'ha4))} : $signed({wire4,
                      (8'hb8)}))} ?
          wire3 : $unsigned(((wire5[(1'h0):(1'h0)] ? wire3 : wire4) ?
              (reg6[(2'h2):(1'h1)] ?
                  (wire3 ?
                      wire4 : (8'ha0)) : wire3[(3'h7):(2'h2)]) : {$signed(reg6),
                  ((8'ha0) ? wire5 : (8'hb0))})));
      reg8 <= $unsigned(wire5);
    end
  assign wire9 = ($unsigned(((&(reg6 & reg7)) ?
                         (~$unsigned(wire3)) : $unsigned(reg6[(2'h3):(2'h3)]))) ?
                     $signed($signed(({(8'hac),
                         wire3} ~^ reg8[(4'h8):(2'h2)]))) : (8'ha5));
  assign wire10 = {wire4};
endmodule
