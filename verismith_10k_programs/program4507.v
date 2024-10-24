module top
#(parameter param11 = (|((~(((8'hb8) ? (8'hb3) : (7'h44)) * ((8'hb3) ? (8'haf) : (7'h41)))) ^ (({(8'ha8)} + ((7'h41) ? (8'hbe) : (7'h42))) ? ((|(8'ha0)) ? (8'ha8) : ((7'h44) == (8'hbf))) : (((8'ha6) ? (8'h9c) : (8'h9e)) ? ((8'hb9) ? (8'hac) : (7'h40)) : (~|(8'hbc)))))), 
parameter param12 = ((-param11) != ((7'h42) <= (((param11 < param11) ? (param11 || (7'h41)) : (param11 ? (7'h44) : param11)) ? ({param11} ^~ (param11 ? param11 : param11)) : param11))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire10, wire7, wire6, wire5, wire4, reg9, reg8, (1'h0)};
  assign wire4 = $unsigned($signed({{(|wire2), $signed((8'hae))},
                     {(wire0 ? (8'hb3) : wire2)}}));
  assign wire5 = {(^{wire2[(3'h5):(2'h2)], $unsigned($unsigned(wire0))})};
  assign wire6 = (+(!((wire4[(3'h6):(2'h3)] != wire3[(4'hb):(3'h5)]) < wire2)));
  assign wire7 = (~|$unsigned(wire6[(4'hb):(4'h8)]));
  always
    @(posedge clk) begin
      if ($unsigned({((^~{wire6}) ?
              $signed(((8'ha4) ? wire5 : wire6)) : {$signed(wire5)})}))
        begin
          reg8 <= (wire5[(2'h3):(1'h1)] && wire4);
        end
      else
        begin
          reg8 <= $unsigned(wire6);
          reg9 <= wire3[(3'h7):(1'h1)];
        end
    end
  assign wire10 = reg8;
endmodule
