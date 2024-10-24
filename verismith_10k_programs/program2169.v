module top
#(parameter param13 = {({(~&((8'hbe) ? (8'ha2) : (8'hac)))} ? (-{{(8'ha7)}}) : ((((7'h44) ? (8'ha4) : (8'hb1)) >= ((8'hb5) & (8'hab))) ? (-((8'hb7) ? (8'hbc) : (8'hb0))) : (8'hb9))), {((~(~|(8'hba))) ? ((~&(8'hbb)) ? {(8'hac)} : ((8'hb4) ? (8'hbf) : (8'h9c))) : (+((7'h41) <<< (8'hae)))), ((~((8'hb1) << (8'hbe))) != (^~{(8'h9d)}))}}, 
parameter param14 = ((param13 != ((^(param13 > param13)) ? (param13 || {(8'h9f)}) : {(param13 < param13)})) ? {{param13}, ({{param13}} <<< (~^(~|param13)))} : ((param13 ? (&(param13 * (8'hb1))) : ({param13, param13} <<< ((8'hab) ~^ param13))) ? (((param13 < param13) ? (|param13) : (param13 != param13)) ? ((param13 > param13) ? (param13 + (8'hb5)) : param13) : (param13 == (param13 ? param13 : param13))) : {(param13 < param13)})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire12, wire11, wire10, wire9, wire8, wire7, wire6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (~|(8'hac));
    end
  assign wire6 = ({$unsigned(wire0[(5'h12):(5'h12)]),
                     $unsigned(wire3)} == (~^wire4[(1'h1):(1'h1)]));
  assign wire7 = ((8'ha5) >> $signed({((reg5 ? wire2 : wire3) << (wire0 ?
                         wire4 : wire4)),
                     wire0}));
  assign wire8 = wire4;
  assign wire9 = $signed(($signed($signed($signed((8'hb4)))) - (({reg5, wire6} ?
                     (-reg5) : wire6[(3'h4):(1'h0)]) & ((^~wire4) ~^ $unsigned(wire2)))));
  assign wire10 = $signed((~$unsigned(($unsigned(wire6) ^~ ((8'hb9) >>> wire7)))));
  assign wire11 = (((^~wire9[(1'h1):(1'h1)]) ?
                          ($signed((wire4 ?
                              (8'had) : wire3)) <<< $unsigned(((7'h40) ?
                              wire0 : wire10))) : $unsigned((~^(wire10 ?
                              wire3 : wire1)))) ?
                      $unsigned((wire10[(3'h6):(2'h3)] <<< wire0[(5'h10):(4'he)])) : (8'hba));
  assign wire12 = ($signed(((~|(!wire9)) ?
                      wire1 : $signed({wire10, wire2}))) >> wire7);
endmodule
