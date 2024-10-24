module top
#(parameter param51 = (~^((|(-(~(8'ha6)))) ? ({((8'ha2) * (7'h40))} > (((8'ha4) ? (8'hb4) : (8'ha4)) ? ((8'h9d) | (8'hba)) : ((8'ha0) ? (8'h9c) : (8'ha5)))) : (8'ha4))), 
parameter param52 = ({(~(param51 <= ((8'ha3) ? param51 : param51))), ((-{param51}) ? (param51 ? (param51 ? param51 : param51) : (param51 == param51)) : ((8'hbb) ? (param51 ? param51 : param51) : ((8'hb2) + param51)))} ? (param51 ? ({{(8'hae)}, ((8'haf) ? param51 : param51)} ~^ ((~param51) ? (param51 + param51) : (param51 ? param51 : param51))) : (((param51 ? param51 : param51) ? (~&param51) : param51) ? {(^(8'hb8)), (^~param51)} : (8'haa))) : (&(((!param51) ? (param51 != param51) : (&param51)) >= (~|(param51 ? param51 : (8'h9e)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire43;
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  assign y = {wire50, wire49, wire48, wire43, reg47, reg46, reg45, (1'h0)};
  module4 #() modinst44 (.wire8(wire2), .wire5(wire3), .wire7(wire0), .clk(clk), .wire6(wire1), .y(wire43));
  always
    @(posedge clk) begin
      reg45 <= (wire2 * (!{(7'h44), (~&(wire43 != (8'ha1)))}));
      reg46 <= (+$signed($unsigned((reg45[(2'h3):(1'h0)] > (wire1 ^~ (8'hbf))))));
    end
  always
    @(posedge clk) begin
      reg47 <= wire3[(4'hb):(2'h2)];
    end
  assign wire48 = wire1;
  assign wire49 = $unsigned((((wire2[(4'hb):(3'h4)] <= reg47) || {((8'ha3) <<< (8'hb4)),
                          (8'h9e)}) ?
                      reg46[(2'h2):(2'h2)] : $signed((wire0 & $signed(wire1)))));
  assign wire50 = $signed($unsigned($unsigned(wire0)));
endmodule

module module4
#(parameter param41 = (((8'h9e) ^~ (8'haa)) ? ((~|((8'ha2) ? ((8'ha7) ? (8'hb8) : (8'h9f)) : ((8'hb8) == (8'hba)))) == ((((8'ha6) ? (8'hbf) : (8'hb9)) == ((7'h42) ? (8'hb0) : (8'hbe))) ? (~^((8'hae) ? (8'ha6) : (7'h41))) : (((8'ha2) ^~ (8'hbf)) ? {(8'ha9)} : ((8'h9e) ? (8'ha3) : (8'h9d))))) : ((~^(((8'hae) ? (8'h9d) : (7'h42)) & (8'ha8))) ? {(((8'hac) ? (8'hbc) : (8'ha8)) ~^ ((8'h9d) ? (8'hbc) : (8'haa))), (&(!(8'hae)))} : (^((7'h42) >>> (+(8'hb9)))))), 
parameter param42 = (+param41))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire5;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire27;
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire29,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire27,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire9 = $signed((^~wire6));
  assign wire10 = (|((|wire8) ?
                      (^~(wire9 << $signed(wire9))) : $unsigned(({(8'had),
                          wire5} < $signed(wire5)))));
  assign wire11 = wire6[(1'h1):(1'h0)];
  assign wire12 = ((|(8'haa)) ?
                      ($signed($unsigned(wire9)) ?
                          (8'hb0) : ((^wire10[(4'hb):(2'h3)]) ?
                              wire10[(3'h5):(3'h5)] : {$unsigned(wire9)})) : wire10[(3'h5):(1'h1)]);
  module13 #() modinst28 (.clk(clk), .wire14(wire5), .wire15(wire7), .wire17(wire8), .y(wire27), .wire18(wire12), .wire16(wire11));
  assign wire29 = ((&((|(!wire9)) ?
                          ((wire8 == wire10) ?
                              (wire8 == wire10) : (wire7 < wire12)) : wire6[(3'h5):(3'h4)])) ?
                      $signed((~^$signed((wire27 <= wire12)))) : (wire7[(2'h3):(2'h2)] ?
                          {wire27[(3'h5):(3'h4)]} : (+wire10[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg30 <= $signed(wire10[(4'he):(1'h0)]);
      if ((wire29[(3'h6):(3'h4)] ?
          {wire27[(3'h4):(1'h0)],
              ($unsigned($signed(wire5)) ?
                  ((wire12 ? wire12 : (8'hab)) ?
                      (wire6 * wire27) : {wire11,
                          wire27}) : (wire6[(4'h8):(3'h7)] - (wire29 - wire6)))} : $unsigned((|(wire27[(3'h4):(2'h2)] <= (wire11 ?
              wire5 : wire5))))))
        begin
          reg31 <= $signed(wire27[(1'h1):(1'h1)]);
          reg32 <= $unsigned(wire5);
        end
      else
        begin
          if (((wire10 ? wire6 : wire8) != (^~wire7[(4'he):(1'h1)])))
            begin
              reg31 <= $unsigned(wire29);
              reg32 <= $unsigned($signed((($unsigned(wire9) ?
                      $signed(wire6) : wire12[(4'he):(3'h6)]) ?
                  (~|(|wire8)) : $signed((^wire8)))));
              reg33 <= $unsigned(wire9[(4'h8):(3'h4)]);
            end
          else
            begin
              reg31 <= wire11[(4'h9):(4'h9)];
              reg32 <= (+$unsigned($unsigned(($signed(wire7) + (&reg33)))));
              reg33 <= $unsigned($unsigned((8'hab)));
              reg34 <= wire9[(3'h5):(1'h1)];
            end
          reg35 <= (reg34 ~^ $unsigned((~^(((8'hb1) + wire12) ?
              reg30 : $unsigned((8'ha5))))));
        end
      reg36 <= (((($signed(wire27) ? wire10[(5'h12):(2'h2)] : (&wire5)) ?
              (-(wire6 - wire29)) : (wire11 && {reg34})) | (&$unsigned((+wire5)))) ?
          wire7 : $signed((($unsigned(reg35) ?
              (7'h42) : {(8'hb0),
                  (8'h9f)}) * ($unsigned((8'hb8)) + wire7[(4'hf):(3'h7)]))));
      reg37 <= (8'h9e);
      reg38 <= (((reg30 ? wire12[(4'h9):(3'h7)] : reg36) ?
              {reg33} : $signed($unsigned((~wire29)))) ?
          $unsigned(wire6) : $signed(wire11[(3'h4):(2'h3)]));
    end
  assign wire39 = $unsigned({($unsigned((wire29 ? (7'h40) : reg33)) ?
                          ((wire11 ? wire6 : wire10) ?
                              (reg37 ?
                                  wire7 : (8'hb3)) : wire7[(3'h6):(3'h6)]) : (~^$signed(reg33))),
                      (~^({(8'hab), wire8} || (wire12 ? wire29 : (8'ha1))))});
  assign wire40 = $signed($signed($signed($unsigned((reg37 ?
                      wire10 : wire39)))));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = (wire17 ? {wire14[(4'h9):(2'h2)]} : wire17[(4'he):(2'h2)]);
  assign wire20 = (8'h9d);
  assign wire21 = {(wire14[(4'hf):(4'hd)] ?
                          wire14[(5'h11):(1'h0)] : (~|$signed(((8'hbe) < wire15))))};
  assign wire22 = (8'ha4);
  assign wire23 = ({$signed($unsigned(wire20)),
                          $unsigned(((8'hbd) ? wire20 : $unsigned((8'ha3))))} ?
                      $unsigned($signed($unsigned(wire15))) : (wire19[(4'he):(4'h8)] ?
                          {(~(wire21 == wire15))} : wire22));
  assign wire24 = $unsigned({wire19});
  assign wire25 = (~^wire23[(4'hd):(2'h3)]);
  assign wire26 = wire21;
endmodule
