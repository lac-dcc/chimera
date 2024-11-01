module top
#(parameter param43 = ((&((8'h9d) != ((~|(8'hbe)) < ((8'ha0) | (8'hb4))))) ? {({((8'hac) ? (8'hbb) : (8'ha6))} ? {{(7'h41), (8'hb6)}} : (~&((8'ha5) >= (8'h9d))))} : (|{(((8'hba) ? (7'h40) : (8'h9f)) ? ((8'hbd) >= (8'h9d)) : {(8'ha2)})})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire41;
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  assign y = {wire22,
                 wire24,
                 wire25,
                 wire26,
                 wire29,
                 wire41,
                 reg28,
                 reg27,
                 (1'h0)};
  module4 #() modinst23 (wire22, clk, wire1, wire2, wire3, wire0, (8'hb6));
  assign wire24 = wire0[(4'hb):(3'h5)];
  assign wire25 = {{wire24}};
  assign wire26 = $signed(wire25[(4'hb):(1'h1)]);
  always
    @(posedge clk) begin
      reg27 <= ({(wire0[(4'hf):(3'h6)] ? wire3[(4'h9):(1'h0)] : wire22),
              $unsigned({$unsigned(wire0), {wire1}})} ?
          $signed(wire1[(4'hb):(2'h3)]) : (^$signed(wire24[(3'h4):(2'h2)])));
      reg28 <= $unsigned(((+(wire3 ?
          {wire22} : (wire1 ?
              wire22 : (8'hac)))) & $signed((wire26[(4'he):(4'ha)] ?
          wire22[(1'h1):(1'h0)] : (^~wire1)))));
    end
  assign wire29 = $unsigned(((|$signed($signed(wire22))) ?
                      wire25 : $signed((reg28[(5'h12):(4'hc)] ?
                          $unsigned(wire0) : {reg28}))));
  module30 #() modinst42 (wire41, clk, wire22, wire26, wire1, wire0, wire29);
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire35;
  input wire [(4'ha):(1'h0)] wire34;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire [(4'he):(1'h0)] wire32;
  input wire [(4'ha):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire36;
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  assign y = {wire40, wire39, wire38, wire36, reg37, (1'h0)};
  assign wire36 = ((~&(~&$unsigned(wire31))) > (|{(wire33[(2'h3):(2'h2)] ?
                          (8'ha3) : $signed(wire34)),
                      ((8'haa) ? wire35[(3'h6):(1'h0)] : (wire34 >= wire34))}));
  always
    @(posedge clk) begin
      reg37 <= $signed((-$signed($signed(wire36[(4'ha):(4'ha)]))));
    end
  assign wire38 = wire36;
  assign wire39 = ((wire35 >= wire35) ?
                      wire35 : (wire36 ?
                          (~^$signed(wire32)) : wire36[(3'h7):(3'h4)]));
  assign wire40 = wire33[(4'h8):(2'h2)];
endmodule

module module4
#(parameter param21 = {(((((8'hbd) ~^ (8'ha9)) ? (&(8'had)) : (-(8'hb9))) < ((^(8'hac)) ? {(8'haf)} : {(8'hb4), (8'ha0)})) ~^ (^~(~((8'ha9) > (8'hb4))))), ((({(8'h9e), (7'h42)} ? ((8'ha5) == (8'hb2)) : {(8'hb8)}) ? (((8'ha9) ? (7'h40) : (8'hb4)) ? ((8'hbf) + (8'h9e)) : ((7'h44) < (8'hbc))) : (((8'h9f) == (8'hb9)) * ((8'hb4) - (8'hb7)))) >>> ((&(^(7'h44))) < ((&(8'ha8)) - ((8'ha3) ? (7'h40) : (7'h44)))))})
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 reg17,
                 reg13,
                 (1'h0)};
  assign wire10 = $unsigned(wire7[(4'h8):(2'h3)]);
  assign wire11 = (((wire10 && {$unsigned((8'hbf)),
                      wire6}) ^ $signed($unsigned({wire7}))) >= wire9[(1'h0):(1'h0)]);
  assign wire12 = (wire6[(2'h3):(1'h0)] ?
                      $unsigned((wire6 == (&$unsigned(wire8)))) : wire8[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg13 <= {wire11, $unsigned((~&wire5))};
    end
  assign wire14 = (wire12 >>> wire10[(3'h5):(3'h5)]);
  assign wire15 = ((wire10 ?
                          (wire11[(3'h5):(3'h5)] + ($unsigned(wire6) & wire9)) : (($unsigned(wire14) <<< wire12[(3'h4):(2'h3)]) ?
                              (~wire5[(4'hf):(4'h9)]) : $signed(wire9[(2'h2):(1'h0)]))) ?
                      ($signed($signed($unsigned(wire10))) ~^ $unsigned($unsigned($signed(reg13)))) : $unsigned(wire5));
  assign wire16 = (($unsigned({$signed(wire11)}) && ((wire15[(2'h3):(1'h0)] < wire15) <= wire6)) && ($unsigned((|wire12)) ?
                      (wire12 ?
                          (wire7[(4'he):(3'h7)] ?
                              wire7[(4'hd):(2'h3)] : $unsigned(wire15)) : wire7) : (&wire7)));
  always
    @(posedge clk) begin
      reg17 <= ($unsigned($signed(($signed(wire6) ?
              $signed(wire8) : wire11[(1'h0):(1'h0)]))) ?
          (~&(~&(8'h9c))) : ($unsigned(($unsigned(reg13) ?
                  $signed(wire5) : $signed(wire14))) ?
              {((&wire15) * wire6[(4'hc):(2'h2)])} : ($unsigned($signed(wire5)) << wire8[(1'h1):(1'h0)])));
    end
  assign wire18 = wire7;
  assign wire19 = (~&reg17[(2'h2):(1'h1)]);
  assign wire20 = (&wire5[(5'h10):(3'h4)]);
endmodule
