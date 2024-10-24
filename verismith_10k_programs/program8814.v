module top
#(parameter param12 = (!((((|(8'hb0)) == {(8'h9d)}) ? (8'ha1) : (7'h40)) ? ((~((8'ha4) * (8'hb3))) ? (((8'hb8) ? (8'ha6) : (7'h42)) ? {(8'ha4), (8'hb6)} : (+(8'ha1))) : (~^((8'hbf) ^ (8'ha8)))) : (!(|(~|(8'ha7)))))), 
parameter param13 = (((&((param12 ? (8'ha5) : param12) - (param12 ? (8'hbd) : param12))) ? (!param12) : {{param12, (^param12)}}) ? {((|(param12 == param12)) ? {(param12 ^ param12), (param12 ? param12 : param12)} : (param12 | {param12}))} : {(({param12} > param12) != param12)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  assign y = {wire11, wire10, wire8, wire7, wire6, wire5, wire4, reg9, (1'h0)};
  assign wire4 = ({$signed((wire2[(2'h3):(1'h0)] ?
                         wire1[(5'h12):(4'hf)] : $unsigned((8'hb5))))} && ($signed($unsigned((wire2 ?
                     wire0 : wire0))) ^~ wire2[(3'h5):(1'h1)]));
  assign wire5 = $unsigned(wire4[(5'h10):(4'hb)]);
  assign wire6 = wire5[(3'h7):(3'h6)];
  assign wire7 = $unsigned((wire4[(1'h1):(1'h1)] ?
                     (|wire6) : (((~^wire5) ?
                             $signed(wire1) : wire6[(4'hc):(4'h9)]) ?
                         wire3[(3'h5):(3'h4)] : ((&wire6) && wire5[(4'he):(4'h9)]))));
  assign wire8 = $signed((8'hb5));
  always
    @(posedge clk) begin
      reg9 <= ($signed(($signed(wire3) ?
              $unsigned($unsigned(wire4)) : (-wire7[(3'h4):(2'h3)]))) ?
          (wire3[(3'h4):(1'h1)] || wire6) : $signed((-(!wire4))));
    end
  assign wire10 = ($signed((+$unsigned((reg9 > wire6)))) ?
                      ((~|$unsigned((wire6 == wire1))) ?
                          ($signed((+(8'hbc))) ^ $unsigned((wire1 ?
                              (8'hbc) : wire7))) : wire8[(2'h2):(2'h2)]) : (($unsigned((-wire3)) ?
                          $signed((+wire4)) : $unsigned(wire3[(2'h2):(2'h2)])) <<< {wire7[(2'h2):(1'h0)]}));
  assign wire11 = wire3[(3'h4):(1'h1)];
endmodule
