module top
#(parameter param33 = ((({(~(8'hac)), ((8'hbb) && (8'hb7))} ? (~&((8'ha4) & (8'hac))) : {((8'ha3) ? (8'ha0) : (8'hb6))}) ? {{((8'ha7) >> (8'ha6)), {(8'h9c), (7'h41)}}, (|(~(8'haa)))} : (^~(+(~(8'hb3))))) ? (^~(!(((8'hba) ? (8'h9e) : (8'ha5)) ? (|(8'hb9)) : (+(8'ha1))))) : {(8'hb1), (7'h42)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire32,
                 wire30,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
                 (1'h0)};
  assign wire4 = (($signed($signed($signed(wire2))) || $signed((+$signed(wire0)))) >= wire1);
  assign wire5 = wire4[(3'h4):(1'h0)];
  assign wire6 = $signed(($unsigned(wire3) ?
                     $unsigned((~|wire1[(3'h5):(3'h4)])) : $unsigned((~|$unsigned(wire3)))));
  assign wire7 = $unsigned($signed($unsigned({$unsigned(wire3),
                     $signed(wire5)})));
  assign wire8 = $signed(wire5);
  assign wire9 = (wire3 ?
                     $unsigned($signed((&(^wire0)))) : (wire8 ?
                         $signed(wire2) : (($signed(wire2) ?
                             wire8 : $signed(wire5)) > $signed({wire1}))));
  always
    @(posedge clk) begin
      reg10 <= ((8'h9c) <= {{((^~wire5) ? $signed(wire6) : $signed(wire9))},
          wire5[(1'h0):(1'h0)]});
    end
  module11 #() modinst31 (.wire13(wire2), .y(wire30), .clk(clk), .wire12(wire9), .wire14(wire7), .wire15(wire5));
  assign wire32 = ($signed(({wire5} <<< (((8'hbc) ^ wire8) ?
                          {(8'h9e)} : $signed(wire30)))) ?
                      {wire1[(1'h1):(1'h0)],
                          wire9[(3'h6):(1'h1)]} : wire1[(3'h7):(3'h5)]);
endmodule

module module11
#(parameter param29 = ((!(((~(8'hb3)) ? (-(8'haa)) : ((8'haf) <= (8'hae))) ? {((8'hb2) ? (8'h9d) : (8'ha9))} : ({(8'h9e), (8'h9f)} ? {(8'ha9), (8'ha5)} : {(8'hae)}))) ? (((8'ha7) ? ((~|(7'h43)) ? ((8'h9f) & (8'hbc)) : {(7'h42)}) : ({(8'hbd)} ? {(8'ha5), (7'h40)} : (-(8'hbc)))) ? ((-((8'had) ? (8'hb4) : (7'h41))) ? (^~((7'h43) + (8'hba))) : (&((8'hb2) >>> (7'h41)))) : (+{((8'hb5) ? (8'ha6) : (8'ha0))})) : (~&{({(7'h43)} ? ((8'hbe) ? (8'hb9) : (8'hab)) : ((8'hba) ? (8'h9d) : (7'h40))), (((8'ha6) || (8'ha1)) ? ((8'h9c) ~^ (8'ha5)) : {(8'had), (8'hae)})})))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire17,
                 wire16,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire16 = ($unsigned(($signed($signed(wire13)) ?
                      $unsigned((+(8'hb9))) : ((8'ha7) ?
                          (wire14 < (8'hba)) : (wire12 ?
                              wire15 : wire13)))) <= (!$unsigned(wire15)));
  assign wire17 = (wire14[(3'h4):(3'h4)] ?
                      wire15[(2'h3):(2'h2)] : $signed($signed($unsigned((~|(8'haf))))));
  always
    @(posedge clk) begin
      reg18 <= $unsigned($unsigned(((!(wire15 + wire14)) ?
          wire14[(3'h6):(3'h4)] : (-(wire14 >= wire13)))));
      reg19 <= reg18;
      reg20 <= $signed((((wire12 ? (^wire12) : ((8'haf) * reg19)) ?
              $unsigned($unsigned(wire13)) : ((wire15 ? wire12 : reg18) ?
                  (reg18 ? wire16 : (8'h9c)) : wire12[(2'h3):(1'h0)])) ?
          wire12[(3'h5):(3'h4)] : {$signed(wire17)}));
      reg21 <= ({(-wire15)} ?
          $unsigned((!((^~(8'ha8)) - $unsigned((8'hbe))))) : $signed($signed($signed(((8'ha2) ?
              wire17 : wire17)))));
      reg22 <= $signed($unsigned((wire14 > ((7'h42) && wire14))));
    end
  assign wire23 = wire12[(3'h5):(2'h2)];
  assign wire24 = ((~&($unsigned(wire23) >> (reg21[(1'h0):(1'h0)] ?
                      (^wire13) : $signed((7'h40))))) && $unsigned(wire14[(4'hd):(1'h0)]));
  assign wire25 = (|wire24);
  assign wire26 = (wire12 ?
                      $unsigned(wire25) : $unsigned((^~$signed((wire12 * (8'ha6))))));
  assign wire27 = ((reg22 && {(((8'hbb) || wire23) >> reg19[(3'h4):(2'h2)]),
                      (~|$unsigned((8'hb1)))}) | reg21[(2'h2):(1'h0)]);
  assign wire28 = wire23[(4'ha):(2'h2)];
endmodule
