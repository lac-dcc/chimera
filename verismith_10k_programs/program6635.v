module top
#(parameter param41 = ((|(~&(((8'hbf) ? (8'had) : (8'haa)) && ((8'hb6) + (8'ha8))))) - ((({(7'h41)} ? (!(8'hb6)) : ((8'hac) ? (8'h9d) : (8'hbf))) ? ((~(7'h42)) ? {(8'ha9), (7'h41)} : (+(8'hb9))) : (((8'hb4) ? (8'hbf) : (8'hae)) != (|(8'hb1)))) ? {(((8'ha9) ? (8'hb1) : (8'h9c)) ? ((8'ha5) || (8'hb3)) : ((8'hb7) | (8'hb3))), (~&{(8'ha4)})} : ((-((8'ha3) == (8'hb2))) != (~|(&(8'ha0)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire38;
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire40, wire4, wire5, wire6, wire7, wire38, reg8, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $unsigned($signed(((+(-wire1)) >> ((wire4 ? wire3 : (8'hb4)) ?
                     wire0 : wire0[(3'h6):(1'h1)]))));
  assign wire6 = (&(wire4 ?
                     ((wire1[(4'hf):(4'hf)] > $unsigned((7'h44))) ?
                         wire0[(4'he):(4'hb)] : (((7'h44) ?
                             wire0 : wire4) + wire3[(1'h1):(1'h1)])) : ($signed((wire4 <<< wire4)) ?
                         $signed(wire5) : wire1)));
  assign wire7 = $unsigned((+{wire0}));
  always
    @(posedge clk) begin
      reg8 <= {((wire0[(4'hd):(3'h6)] ?
              (((7'h41) & wire5) * {(8'hb2), wire1}) : $unsigned((wire0 ?
                  wire4 : wire5))) <<< (wire7 ?
              ({(8'hb9), wire6} ? wire4[(1'h0):(1'h0)] : (8'hb9)) : {wire7,
                  ((8'hab) || wire0)})),
          ($signed($signed((wire3 ?
              wire0 : wire2))) != (-$signed(((8'h9f) ^ wire3))))};
    end
  module9 #() modinst39 (.wire11(wire7), .wire12(wire4), .wire14(wire3), .y(wire38), .clk(clk), .wire10(wire0), .wire13(wire2));
  assign wire40 = (~^wire5);
endmodule

module module9
#(parameter param36 = (8'hbf), 
parameter param37 = {(&(((8'h9c) < ((8'ha0) ? param36 : param36)) <<< {(8'hb2)}))})
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire15 = wire11;
  assign wire16 = $signed(wire12);
  assign wire17 = {wire11[(4'hf):(4'h8)],
                      ($signed(((wire16 ? wire12 : wire12) ?
                              $unsigned(wire13) : (8'ha3))) ?
                          wire10 : (~|$signed(wire15)))};
  assign wire18 = ({$signed(($signed(wire15) ? wire16 : wire10[(4'h8):(2'h2)])),
                          {$signed((|wire12))}} ?
                      wire15 : $signed((wire16 ?
                          $signed(wire15) : $signed($unsigned(wire17)))));
  always
    @(posedge clk) begin
      reg19 <= ((wire10[(1'h0):(1'h0)] ^~ $unsigned(($unsigned(wire16) > wire10))) ~^ ((!$signed($signed(wire14))) | $unsigned(wire14[(4'he):(4'ha)])));
      reg20 <= (~&(+{(wire13 ? (!wire16) : wire16[(4'h9):(1'h0)]),
          $unsigned($signed((8'h9f)))}));
      reg21 <= wire11;
    end
  assign wire22 = (~|$signed(((reg20 ?
                          (wire10 ? wire14 : wire16) : (wire17 && wire11)) ?
                      {{wire15, wire13}} : $signed((wire17 || (8'hb3))))));
  assign wire23 = ((~^$unsigned($unsigned((wire11 >>> wire16)))) - ($signed(($signed(wire17) > (wire13 & (8'hb5)))) < ($signed($unsigned(wire10)) ?
                      reg20[(2'h2):(2'h2)] : wire10)));
  assign wire24 = $unsigned((wire18 == (&(~&(wire12 || (8'h9d))))));
  assign wire25 = (-($signed((8'h9c)) || (wire14 * ((wire14 ? wire12 : wire10) ?
                      $signed(wire10) : $unsigned(wire22)))));
  assign wire26 = {($signed($unsigned(wire18[(2'h3):(1'h1)])) && wire17[(2'h2):(2'h2)]),
                      ($unsigned($signed(wire12)) ?
                          (+(&(reg19 ?
                              wire13 : wire17))) : (~^$unsigned(reg20[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg27 <= (^{reg20[(2'h2):(1'h1)],
          {(wire11[(4'ha):(3'h7)] ?
                  $unsigned(wire15) : (wire26 ? wire17 : reg21)),
              (((8'h9f) ? wire16 : wire14) ?
                  (wire11 << wire24) : (wire12 ? reg20 : wire18))}});
      if ($unsigned((^~{{(wire23 ? wire12 : wire23)},
          $unsigned(((8'ha7) >>> (8'ha0)))})))
        begin
          reg28 <= $unsigned((^~(^wire10[(4'hb):(3'h6)])));
          if ({{reg19[(1'h0):(1'h0)],
                  (((wire26 - wire13) ?
                          wire17[(3'h7):(3'h7)] : $signed((8'had))) ?
                      $unsigned((&wire17)) : {$unsigned((8'hbf))})}})
            begin
              reg29 <= ({wire23[(2'h2):(1'h1)]} & ($signed((((8'ha8) ~^ wire10) - (wire18 < wire13))) ?
                  reg28 : ((8'h9d) ? $unsigned($signed((8'hbd))) : {wire17})));
              reg30 <= ($signed($unsigned(wire13[(5'h10):(4'ha)])) <= $signed((~|reg21[(1'h0):(1'h0)])));
              reg31 <= ($signed(wire15) ? $signed($unsigned(reg28)) : wire18);
              reg32 <= (7'h40);
            end
          else
            begin
              reg29 <= {wire10[(4'h9):(4'h8)]};
              reg30 <= reg19[(3'h4):(1'h0)];
              reg31 <= reg32[(4'hf):(4'hd)];
              reg32 <= (8'h9e);
              reg33 <= (-$signed((reg30 ?
                  $unsigned((wire17 ?
                      wire10 : wire22)) : (~|$unsigned(wire25)))));
            end
        end
      else
        begin
          reg28 <= reg27[(2'h2):(1'h1)];
          reg29 <= ({wire17[(4'hc):(4'hb)]} ?
              reg31[(1'h0):(1'h0)] : ($signed((8'hb7)) <= ((^$signed(reg33)) ?
                  wire16 : $signed($signed(reg28)))));
          reg30 <= wire25;
        end
    end
  assign wire34 = wire22[(4'h9):(4'h8)];
  assign wire35 = reg32;
endmodule
