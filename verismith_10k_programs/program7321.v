module top
#(parameter param18 = (((!{((8'ha0) ? (8'hbf) : (8'hb5)), ((8'hbf) ? (8'ha5) : (7'h43))}) ? {((~|(8'hb4)) ? ((8'hbc) != (8'hba)) : ((8'ha5) ? (8'hb6) : (8'hae))), (^~(-(8'ha5)))} : ({((8'hb5) || (7'h43))} ? ((7'h41) >>> ((7'h42) <<< (8'hae))) : (((8'ha6) ? (8'hb1) : (8'ha0)) ? ((7'h44) ? (8'haf) : (8'ha6)) : (!(7'h40))))) - {(((^~(8'ha2)) ? (!(7'h40)) : {(8'hb8), (8'hb3)}) >> ({(8'haa)} >> (~^(8'hbb)))), ((!((8'hbe) <<< (8'hbd))) ^~ {(8'ha0), ((8'hb6) ? (8'hab) : (8'hae))})}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg13,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed($unsigned(((~^(wire4 - wire1)) + wire2[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg6 <= {$unsigned(wire1)};
      reg7 <= $unsigned($unsigned(wire5));
    end
  assign wire8 = wire3[(2'h3):(2'h3)];
  assign wire9 = wire1[(4'hc):(1'h1)];
  assign wire10 = $signed(($signed(reg7[(3'h7):(1'h1)]) ?
                      wire9[(4'h9):(4'h8)] : wire0));
  assign wire11 = (wire1[(4'hc):(2'h3)] + (&wire3[(2'h3):(1'h0)]));
  assign wire12 = (+wire8);
  always
    @(posedge clk) begin
      reg13 <= (((^((wire0 ? wire2 : wire0) ?
              ((8'hbf) >= wire10) : (wire0 ? wire10 : wire11))) ?
          $signed($signed((^~wire11))) : $signed((^~(wire11 ^~ wire5)))) ^ (^$unsigned(((wire2 || wire3) ?
          (wire9 > wire2) : reg7[(1'h1):(1'h1)]))));
    end
  assign wire14 = (wire12[(3'h4):(2'h3)] ?
                      (($unsigned((8'haa)) << (+{(7'h44)})) ?
                          $signed(($unsigned(wire3) >> (wire9 <= wire3))) : reg13) : reg6);
  assign wire15 = ((($signed((wire8 ?
                          (7'h43) : reg6)) | ((|wire14) != wire1[(4'h9):(3'h5)])) >>> wire5[(4'h9):(4'h9)]) ?
                      wire9[(3'h4):(2'h3)] : {(^($signed((8'h9c)) ?
                              wire2[(1'h0):(1'h0)] : wire10[(2'h2):(1'h0)]))});
  assign wire16 = wire15[(1'h0):(1'h0)];
  assign wire17 = (8'hac);
endmodule
