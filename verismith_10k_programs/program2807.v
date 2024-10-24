module top
#(parameter param11 = {(((((8'hba) < (8'haa)) ? ((8'ha9) ? (7'h40) : (8'hb2)) : ((8'hb1) + (8'haa))) ? (^~(~^(8'haf))) : ((8'hbf) ? {(8'ha5), (8'ha3)} : {(8'hbf)})) <<< (^(((7'h40) ? (8'hac) : (8'hab)) ? ((8'hb0) ? (8'hb9) : (8'ha3)) : (~^(7'h40))))), {{((^(8'hac)) != ((7'h44) ? (8'h9c) : (8'hae)))}, ((-{(8'haa)}) ^ (~((8'hac) ? (8'hb0) : (7'h41))))}}, 
parameter param12 = param11)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire9, wire8, wire7, wire6, wire5, reg10, (1'h0)};
  assign wire5 = $unsigned({((8'ha5) ?
                         $unsigned($unsigned(wire4)) : ($unsigned(wire2) * wire4[(1'h1):(1'h1)]))});
  assign wire6 = {{wire5[(3'h4):(1'h0)],
                         (~(wire0[(2'h3):(2'h2)] ?
                             $unsigned(wire1) : (8'haa)))}};
  assign wire7 = $unsigned(((+$signed(wire3[(1'h0):(1'h0)])) ?
                     {$unsigned(wire6),
                         $unsigned((wire4 ? (8'hb6) : wire6))} : (8'ha5)));
  assign wire8 = $signed(($signed(($signed(wire2) ?
                         $unsigned(wire0) : $signed(wire4))) ?
                     (&wire6) : $signed($signed((-wire6)))));
  assign wire9 = (+(wire0 ?
                     $signed($signed(((8'ha5) ?
                         wire4 : (8'hac)))) : (($unsigned(wire2) * $unsigned(wire6)) ?
                         $signed((wire7 <<< wire8)) : wire2)));
  always
    @(posedge clk) begin
      reg10 <= $signed(({$unsigned((&wire0)),
          $signed((wire1 ? wire1 : wire6))} <= (|$unsigned({wire5}))));
    end
endmodule
