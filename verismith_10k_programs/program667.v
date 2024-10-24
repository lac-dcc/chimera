module top
#(parameter param24 = ((^~((8'hb3) ? (~&((8'hbd) ? (8'hb9) : (8'ha4))) : (+(+(8'hb2))))) ? ((~((^~(8'ha9)) ? {(8'h9f)} : (+(8'hae)))) ? (~|(8'hb8)) : {(((8'hb3) <= (8'ha3)) ? (~|(8'hba)) : (!(8'hab))), (7'h41)}) : ((~^(|((7'h44) << (8'hab)))) + (^{((8'haf) ? (8'ha8) : (8'hbb)), ((7'h44) ? (8'hbf) : (8'hb0))}))), 
parameter param25 = (8'hb8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire4 = $unsigned((($signed(wire0) ? wire1[(3'h5):(3'h4)] : wire3) ?
                     wire3 : wire3));
  assign wire5 = $unsigned((+({{wire0, wire4},
                     wire2[(4'hc):(1'h0)]} < $unsigned($signed(wire1)))));
  assign wire6 = {((wire2[(3'h4):(1'h1)] ?
                         $signed(wire0[(2'h3):(2'h3)]) : $unsigned((-wire0))) * ((wire3[(2'h3):(1'h1)] && wire5[(1'h0):(1'h0)]) > (wire2 ?
                         {wire3, wire0} : (wire1 << (8'ha7))))),
                     ((+({(8'ha2)} ? {wire2} : (wire2 & wire5))) ?
                         (((+wire3) ?
                             $signed(wire3) : $unsigned(wire0)) < $unsigned(wire2[(4'hb):(1'h0)])) : $signed(($signed(wire0) ?
                             $unsigned(wire0) : (^~wire0))))};
  assign wire7 = (wire2 ?
                     $signed((~((8'haa) ?
                         {wire2,
                             wire1} : $unsigned(wire0)))) : {wire6[(4'h9):(3'h7)],
                         ($signed(wire0[(1'h0):(1'h0)]) ?
                             wire0[(3'h4):(1'h0)] : (wire3 ?
                                 (wire1 ?
                                     (8'ha7) : wire0) : $unsigned(wire6)))});
  assign wire8 = wire1;
  assign wire9 = ($unsigned((-wire0)) + ((({wire8} << (wire6 ?
                             (8'ha5) : wire4)) ?
                         ($signed(wire6) ?
                             {wire3,
                                 wire1} : (wire3 == wire5)) : (|$signed(wire2))) ?
                     ((-(^wire8)) ?
                         (wire0[(1'h0):(1'h0)] ?
                             $unsigned(wire5) : (^wire1)) : (^wire1[(3'h7):(3'h6)])) : (wire0 == $signed(((8'hb7) ?
                         wire4 : (8'ha7))))));
  assign wire10 = (((wire8[(3'h4):(2'h3)] ?
                      ($signed((7'h42)) & $signed(wire3)) : wire1) << $unsigned({wire5[(3'h5):(1'h0)]})) ^~ (~&(~^(&$unsigned(wire9)))));
  assign wire11 = {wire2[(5'h10):(5'h10)],
                      $unsigned((wire0 ^ ((wire5 | wire9) ? wire4 : wire10)))};
  assign wire12 = ((|$signed(wire6)) ?
                      $unsigned(((~&$signed(wire0)) | $signed((wire7 + wire4)))) : ($signed(wire11) ^ {$signed((wire9 ^~ wire1))}));
  assign wire13 = wire2;
  assign wire14 = wire4[(4'hb):(3'h6)];
  assign wire15 = $unsigned(wire11[(1'h0):(1'h0)]);
  assign wire16 = wire4;
  assign wire17 = {{wire9,
                          ({wire1[(3'h4):(1'h0)]} * $signed((wire11 ?
                              wire12 : wire11)))},
                      $unsigned($signed(({wire11, wire14} ?
                          $unsigned(wire3) : (wire4 ? wire5 : wire6))))};
  assign wire18 = (wire6 ?
                      ($signed(wire15) ?
                          (^~{(wire9 <= wire1),
                              $unsigned(wire16)}) : {((8'h9d) ?
                                  {wire4,
                                      wire1} : wire8[(4'he):(3'h5)])}) : wire6);
  always
    @(posedge clk) begin
      reg19 <= (^~wire13[(3'h4):(1'h1)]);
      reg20 <= wire13;
    end
  assign wire21 = wire13;
  assign wire22 = $signed($signed(wire9));
  assign wire23 = wire0;
endmodule
