module top
#(parameter param11 = ((!((((7'h44) && (7'h42)) ~^ ((8'hbd) != (8'hbe))) >> (8'h9c))) == ({((8'hb8) ? {(8'hb7)} : {(7'h40)})} <= {(((8'h9c) ? (8'h9f) : (8'hb2)) ? ((8'hb8) ^~ (8'had)) : (&(8'hbd)))})), 
parameter param12 = (~|((~^param11) <<< (((param11 * param11) != param11) ? ({param11, param11} && (param11 + param11)) : ((param11 ? param11 : param11) >>> param11)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire6, reg5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((($signed(wire3) != ((wire2 + wire1) ?
          $unsigned((8'hbc)) : $signed(wire1))) || wire3) >> (&{(^~$signed(wire3))}));
      reg5 <= ((((~|reg4[(1'h1):(1'h1)]) ?
              (^~$signed(wire3)) : $unsigned((wire3 ? (8'hbd) : (8'hb8)))) ?
          ($unsigned(reg4[(1'h0):(1'h0)]) | $signed(((8'ha1) >>> reg4))) : (8'hb8)) < ((((wire3 ?
                  wire3 : wire1) <= wire0[(3'h7):(2'h3)]) ?
              {(8'hb4)} : ($unsigned(reg4) ? wire2 : (-wire3))) ?
          {{reg4[(2'h2):(1'h0)], wire2}} : (wire3 + ($unsigned(wire3) ?
              (wire0 + wire1) : wire3))));
    end
  assign wire6 = {(^~$unsigned($unsigned((wire1 <= wire0))))};
  assign wire7 = ((($unsigned({(8'haa)}) ? (~&$unsigned(wire1)) : wire6) ?
                         $unsigned({(wire0 ? wire3 : (8'hab)),
                             (~^reg4)}) : wire0) ?
                     $signed(reg5[(2'h2):(2'h2)]) : ((((wire0 << wire6) > (~reg5)) > reg5[(4'ha):(3'h4)]) ?
                         $signed(wire0[(4'hf):(3'h7)]) : (!reg5[(4'h8):(3'h5)])));
  assign wire8 = $signed(wire1);
  assign wire9 = {$unsigned((&$unsigned($signed(reg5)))),
                     ($signed(reg4[(3'h6):(3'h5)]) ?
                         $unsigned(((-reg5) ?
                             (&wire0) : (wire1 ?
                                 wire6 : reg4))) : wire0[(4'ha):(1'h1)])};
  assign wire10 = {($signed($unsigned((reg4 ~^ wire0))) ?
                          {($signed(wire8) || $signed(wire3)),
                              (wire9 ?
                                  $unsigned(wire6) : wire8)} : wire0[(3'h6):(2'h3)]),
                      wire1};
endmodule
