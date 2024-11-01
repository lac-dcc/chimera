module top
#(parameter param12 = (((((^~(8'h9e)) ^~ {(8'ha8), (7'h41)}) ^ (((8'ha6) && (8'h9d)) & ((8'ha5) ? (8'ha6) : (8'hb4)))) >= ((^~(~(8'hac))) + ({(8'hb5)} * ((8'hbf) * (8'hb5))))) ? (^((^~((8'hab) || (8'h9d))) ? ((8'ha7) < {(8'h9e), (8'hbb)}) : ((~|(8'hb1)) >>> (8'hbc)))) : ((^~(8'ha5)) & ((((8'hba) >>> (8'hbf)) ? (~(8'hb6)) : (8'h9f)) > (~&((8'ha7) ? (8'hb2) : (8'hb2)))))), 
parameter param13 = {((~^(8'hae)) ? param12 : (-{(~|param12), {param12}})), (&(+(^(param12 ? param12 : param12))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, reg11, reg10, (1'h0)};
  assign wire4 = {(($signed((&wire1)) >> wire0) ?
                         (wire2 ?
                             (!(wire0 ? wire1 : wire2)) : (((8'hb1) ?
                                     wire0 : wire1) ?
                                 wire1 : $signed(wire2))) : (8'ha6))};
  assign wire5 = (((wire2 ? $unsigned(wire4) : wire1) ?
                         (^$unsigned(wire4)) : $signed((8'hb9))) ?
                     (wire2 <<< (8'hb3)) : $signed((wire1 ?
                         $signed((!wire2)) : (~&wire3[(3'h6):(1'h1)]))));
  assign wire6 = {((~$unsigned(wire0[(1'h1):(1'h0)])) < $unsigned((~|(wire5 ?
                         wire0 : wire4)))),
                     wire5};
  assign wire7 = wire1;
  assign wire8 = (-(wire5 * $unsigned($unsigned(wire1[(2'h3):(2'h2)]))));
  assign wire9 = {$signed({($unsigned(wire0) > wire1)})};
  always
    @(posedge clk) begin
      reg10 <= wire7;
      reg11 <= ($unsigned((~|$signed((wire2 ? reg10 : wire9)))) ?
          $unsigned((-reg10[(2'h2):(1'h0)])) : $signed({$signed((wire5 ?
                  wire0 : wire8))}));
    end
endmodule
