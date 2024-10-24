module top
#(parameter param28 = ((({(~^(8'hbd)), ((7'h44) >>> (8'hbf))} + (-(~&(8'hbb)))) ^ (((!(8'hab)) << {(8'ha8)}) ? (((8'ha2) < (8'ha5)) ? ((8'ha8) ? (8'hb5) : (8'hac)) : (~^(8'haf))) : (((8'hb1) >> (8'hb3)) ? (8'hb6) : ((8'ha1) != (8'hb3))))) ? ((&(^((8'hb3) << (7'h44)))) >>> (((&(8'hb3)) <= {(8'hb1), (8'ha3)}) >= (((8'hae) ? (8'ha5) : (8'ha6)) ^ (~(8'hbb))))) : {(((~|(8'ha4)) == {(8'ha9), (8'ha2)}) >= {((8'hbf) ? (8'hb5) : (8'ha2))}), (((~&(8'ha8)) * ((8'h9e) ? (8'hb4) : (8'had))) ? ((8'hb4) == (~|(8'ha0))) : (((8'hb3) <<< (8'hb0)) > ((8'h9c) ? (8'ha7) : (8'hb4))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire22;
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {({($unsigned(wire0) ? {(8'hbb)} : ((8'hbf) >>> wire2)),
                  ((wire3 ? wire0 : wire0) ^ wire3[(3'h5):(1'h0)])} ?
              (^~(wire2 && (-(8'haa)))) : $signed(wire3)),
          wire2};
      reg5 <= reg4;
      reg6 <= ((7'h44) >> wire2[(2'h3):(1'h0)]);
      reg7 <= {$signed((8'hbd)),
          ($unsigned(((^reg4) > reg4[(1'h0):(1'h0)])) < $unsigned((reg4[(3'h6):(3'h6)] >> $unsigned(wire0))))};
    end
  module8 #() modinst23 (.wire11(reg4), .wire13(wire1), .wire9(reg5), .y(wire22), .clk(clk), .wire12(wire3), .wire10(wire2));
  assign wire24 = {$signed($signed((8'hb4))),
                      ({(8'hb1)} & wire2[(5'h12):(4'hb)])};
  assign wire25 = {$unsigned((wire3[(5'h11):(3'h5)] > $unsigned((8'hbd)))),
                      {((wire22 ? (reg5 << wire0) : ((8'hbc) ? reg4 : reg4)) ?
                              $unsigned((wire2 & reg7)) : {$unsigned(wire3)})}};
  assign wire26 = wire2;
  assign wire27 = ($signed((~&wire22[(1'h0):(1'h0)])) ?
                      reg5 : $signed(((~^(reg6 ? wire3 : wire26)) | (wire25 ?
                          wire24 : (8'hbd)))));
endmodule

module module8
#(parameter param20 = (((~|(((8'ha4) ? (7'h43) : (8'ha0)) ? {(8'hac)} : ((8'hb2) ? (8'hb4) : (8'hbd)))) || ({((7'h43) & (7'h40))} * ((!(7'h41)) ? ((7'h42) && (8'hb4)) : {(8'hb5), (8'ha5)}))) ? (^~((((8'hac) ? (8'ha8) : (8'hb2)) ? (^(8'hb3)) : ((8'haa) ? (8'hba) : (8'haf))) ? (((8'hb1) + (8'ha6)) ? ((8'hbf) ? (8'h9d) : (8'h9d)) : ((8'ha8) ? (7'h44) : (7'h40))) : ((&(7'h43)) >> (~(7'h40))))) : (~|{(^~{(8'hb4)})})), 
parameter param21 = (((((param20 ? (7'h40) : param20) < {(7'h41), param20}) ? (((8'hab) || param20) ? (-param20) : (param20 >>> param20)) : (~^(param20 ? param20 : param20))) ? param20 : (~|(~^(^~param20)))) | ({(8'hbc)} <= (param20 ? (+{param20, (8'hb6)}) : (8'hbd)))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  assign y = {wire19, wire16, wire15, wire14, reg18, reg17, (1'h0)};
  assign wire14 = (^~(!wire9[(2'h2):(1'h0)]));
  assign wire15 = {{(~|wire13[(5'h10):(3'h7)])}, (8'hbd)};
  assign wire16 = (wire9[(1'h0):(1'h0)] ?
                      ($signed(((wire12 ? wire12 : wire13) ?
                          wire9[(4'hf):(3'h6)] : (wire14 ?
                              wire9 : wire14))) >>> ({(wire12 || wire12)} <<< wire15[(1'h1):(1'h0)])) : (^~$unsigned((wire11[(1'h1):(1'h0)] ?
                          $signed((8'ha9)) : (wire12 >= (8'hbb))))));
  always
    @(posedge clk) begin
      reg17 <= {(~|$unsigned((wire9 != wire12[(2'h2):(1'h0)])))};
      reg18 <= (($unsigned($signed(wire13)) <<< (&(reg17[(4'hc):(4'hc)] ?
          ((8'hb2) ?
              wire13 : wire16) : wire10[(3'h4):(2'h2)]))) ^~ {$unsigned({(wire13 ?
                  wire15 : wire16),
              $signed((8'ha0))}),
          $unsigned(((wire11 ~^ wire9) ?
              wire10[(2'h3):(1'h0)] : wire14[(2'h3):(1'h0)]))});
    end
  assign wire19 = $signed($unsigned({(wire15[(2'h2):(1'h0)] && (wire10 * wire10)),
                      $unsigned((wire16 != wire14))}));
endmodule
