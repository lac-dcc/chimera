module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  assign y = {wire25, wire23, wire6, wire5, wire4, reg28, reg27, reg26, (1'h0)};
  assign wire4 = (^~{(({wire3, wire2} ? (wire1 ? wire3 : (8'h9c)) : (|wire0)) ?
                         {$unsigned(wire0),
                             $unsigned(wire2)} : $unsigned(wire0[(1'h1):(1'h0)]))});
  assign wire5 = wire1;
  assign wire6 = $signed($signed((wire2 | $signed((^~wire2)))));
  module7 #() modinst24 (.wire8(wire1), .wire10(wire4), .y(wire23), .clk(clk), .wire11(wire0), .wire9(wire5));
  assign wire25 = $signed(($signed(wire4) ?
                      $unsigned(wire0[(4'hb):(2'h2)]) : $unsigned((!$signed((8'h9c))))));
  always
    @(posedge clk) begin
      if (($signed((&(+$unsigned(wire6)))) ^ $signed((!({wire4, wire1} ?
          (wire0 ? wire6 : (8'h9d)) : (wire4 ? wire5 : wire25))))))
        begin
          reg26 <= $signed($signed($unsigned(wire1[(4'hf):(4'ha)])));
          reg27 <= (wire5 <<< wire0);
          reg28 <= (wire2[(2'h3):(1'h0)] * wire1[(2'h2):(1'h0)]);
        end
      else
        begin
          reg26 <= $signed((((wire3[(3'h5):(2'h3)] ?
                  (wire5 ? (8'hb2) : wire25) : reg28[(2'h3):(2'h3)]) ?
              {(wire3 ? wire3 : reg26),
                  wire5} : $unsigned($signed(wire4))) ^ reg27));
        end
    end
endmodule

module module7
#(parameter param22 = (-(((((8'hbd) ? (8'haf) : (8'h9e)) - {(8'hbb)}) ? ((&(8'h9d)) ? ((8'hac) ? (7'h41) : (8'ha9)) : (!(8'haa))) : ((^(8'ha4)) && ((8'hb0) ? (8'hb5) : (8'hb3)))) ? ((((8'hb3) ? (8'hb7) : (8'haa)) ? (~^(8'haf)) : {(7'h41)}) ? ((&(8'hbf)) + (+(8'ha6))) : {(~^(8'ha3)), ((8'h9f) ? (8'ha1) : (8'ha1))}) : ((!((8'ha7) && (8'hbe))) ? (((7'h42) ? (7'h43) : (8'haa)) | (^(7'h43))) : ({(8'hae), (8'ha9)} >> ((7'h43) ? (8'ha6) : (7'h44)))))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 (1'h0)};
  assign wire12 = ($unsigned($signed($unsigned((-wire9)))) ?
                      wire8[(3'h7):(1'h0)] : $unsigned((^~((wire10 <<< wire8) ?
                          {wire10, wire10} : wire9[(1'h0):(1'h0)]))));
  assign wire13 = wire9[(3'h7):(3'h4)];
  assign wire14 = $signed(wire8);
  assign wire15 = wire11[(4'h9):(4'h9)];
  assign wire16 = (($unsigned(wire11) < {(7'h42),
                      (wire10[(4'hb):(4'h9)] >= (!(8'ha9)))}) < (wire9[(3'h4):(1'h1)] ?
                      $signed(wire10) : (~|$unsigned((^(8'had))))));
  assign wire17 = wire8;
  assign wire18 = ((((wire9[(2'h3):(1'h0)] ?
                                  {(8'hb0), wire10} : (wire11 >>> wire15)) ?
                              $signed((~&wire16)) : (wire13 >>> {wire16,
                                  wire11})) ?
                          (+(wire8[(1'h0):(1'h0)] != $signed(wire10))) : $signed(wire8[(2'h2):(2'h2)])) ?
                      {wire10[(1'h1):(1'h1)],
                          (($unsigned((8'had)) & $signed(wire16)) ?
                              $signed(wire16) : wire13[(3'h4):(1'h1)])} : wire17[(5'h10):(4'h9)]);
  assign wire19 = (($unsigned(wire12[(4'h8):(2'h2)]) ?
                      (wire8[(4'ha):(1'h0)] != wire8) : ((-wire16[(3'h4):(3'h4)]) ?
                          wire14 : (!wire13))) || $signed($unsigned(((wire8 ~^ wire13) >>> wire18[(3'h6):(1'h0)]))));
  assign wire20 = wire15;
  assign wire21 = ($signed(wire16) >> (($unsigned($unsigned(wire12)) != (8'ha2)) < wire16));
endmodule
