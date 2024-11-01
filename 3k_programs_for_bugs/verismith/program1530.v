module top
#(parameter param44 = (+((~^((^~(7'h41)) ^ (^~(8'hbb)))) ? ((((8'haa) + (8'ha9)) ? {(8'hb2), (7'h43)} : ((7'h40) ? (8'haf) : (8'hb2))) <= (((8'ha1) ? (8'hb5) : (7'h43)) && ((8'h9c) ? (8'hab) : (8'h9e)))) : ((((8'ha6) > (8'hb0)) ? ((8'h9e) >= (8'ha7)) : ((8'hbe) || (7'h43))) >= (^~(^~(8'hbe)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire40;
  assign y = {wire43, wire42, wire5, wire6, wire7, wire40, (1'h0)};
  assign wire5 = $signed((wire1 ?
                     (((wire2 ? wire2 : wire4) - (~|wire1)) ?
                         wire1[(4'ha):(4'h9)] : $signed((~&wire0))) : (8'hbe)));
  assign wire6 = wire2;
  assign wire7 = {wire6};
  module8 #() modinst41 (.wire9(wire3), .wire10(wire6), .wire13(wire1), .clk(clk), .y(wire40), .wire11(wire4), .wire12(wire7));
  assign wire42 = wire2[(2'h2):(1'h0)];
  assign wire43 = {((((wire5 >>> wire0) ?
                          $signed(wire42) : $signed(wire42)) <= (wire42[(5'h15):(1'h0)] + (&wire40))) <= $unsigned((&(wire1 ?
                          wire7 : wire3)))),
                      {($unsigned(wire4[(4'hd):(4'hb)]) << $unsigned((wire4 ?
                              wire5 : wire2))),
                          (~&$unsigned($signed(wire40)))}};
endmodule

module module8
#(parameter param38 = (((-(8'hb3)) ? ({(^~(8'hb4)), ((8'h9e) ? (8'ha4) : (8'hac))} <= ({(8'hb8)} <<< (|(8'ha4)))) : (-(((8'ha7) ? (8'hba) : (8'ha0)) ? ((8'ha3) ? (8'hba) : (7'h40)) : ((8'h9f) ? (8'hac) : (8'h9d))))) >>> {(7'h43)}), 
parameter param39 = {((param38 * (|(param38 ? param38 : param38))) * param38)})
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire14;
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  assign y = {wire24,
                 wire14,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire14 = {$unsigned(wire11[(2'h3):(1'h1)]), wire11};
  module15 #() modinst25 (wire24, clk, wire13, wire10, wire14, wire11);
  always
    @(posedge clk) begin
      reg26 <= wire9;
      reg27 <= ((reg26[(2'h3):(2'h3)] ?
          $unsigned($signed((8'hbf))) : $signed((wire10[(2'h2):(1'h0)] * $unsigned(wire9)))) == {({{wire14,
                      wire14}} ?
              ((~^wire10) ^ $unsigned(wire11)) : wire9[(4'hc):(1'h1)])});
      reg28 <= ((|(&$unsigned((^~wire12)))) ?
          $unsigned($signed(wire10[(3'h4):(1'h0)])) : wire11);
      reg29 <= $unsigned((~^$unsigned(wire9[(2'h3):(1'h0)])));
      reg30 <= $unsigned((~^($signed(wire24) * (^$unsigned(reg29)))));
    end
  always
    @(posedge clk) begin
      if (($signed(reg29) ?
          (wire9[(4'hb):(3'h5)] ?
              (!((wire12 && reg30) ?
                  $signed(reg27) : ((8'had) + reg27))) : {reg27}) : $unsigned(($unsigned(reg27) & wire9[(5'h13):(4'hf)]))))
        begin
          if (wire13[(2'h2):(1'h1)])
            begin
              reg31 <= (($signed((~(+wire11))) ?
                      (({wire12, reg26} ?
                              (reg26 ? reg28 : wire9) : (wire12 ?
                                  wire10 : wire11)) ?
                          wire10[(1'h0):(1'h0)] : ($signed(wire14) ?
                              wire13[(5'h11):(2'h3)] : ((8'ha3) ?
                                  reg29 : wire9))) : $unsigned((|(wire9 ?
                          reg30 : wire13)))) ?
                  (reg30[(3'h5):(3'h5)] << ($signed(reg29[(2'h2):(1'h0)]) ?
                      reg30 : reg26[(3'h5):(2'h3)])) : ((^~$signed({reg29,
                          reg29})) ?
                      $unsigned($unsigned((reg26 ?
                          reg27 : reg28))) : wire24[(2'h3):(2'h3)]));
              reg32 <= reg29[(3'h4):(2'h3)];
              reg33 <= (((-$unsigned((&wire13))) ?
                  $signed(((wire13 ?
                      reg30 : reg27) ^ reg27)) : ($unsigned(reg30) >> $signed($signed((8'had))))) | wire14[(5'h15):(5'h13)]);
              reg34 <= $unsigned({($signed((~&wire12)) ?
                      (^wire10) : (((7'h44) + (8'ha5)) != reg30[(2'h3):(1'h0)]))});
              reg35 <= $unsigned(wire10);
            end
          else
            begin
              reg31 <= ((~^wire13[(3'h4):(2'h2)]) ~^ $unsigned((8'hac)));
            end
        end
      else
        begin
          reg31 <= reg27;
        end
      reg36 <= $signed($signed((((wire10 ? wire9 : wire14) ^ $signed(wire24)) ?
          $signed(((8'haa) + reg32)) : (reg33 == reg27[(1'h1):(1'h0)]))));
      reg37 <= $unsigned($signed((~(^(wire9 ? reg32 : reg26)))));
    end
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire19;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  assign y = {wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = (|(~&(((wire19 - wire19) ? wire17 : $unsigned(wire16)) ?
                      ($unsigned(wire18) ?
                          $signed(wire18) : $unsigned(wire17)) : $unsigned({wire16}))));
  assign wire21 = (8'hb3);
  assign wire22 = ((^((wire18 ?
                          wire20[(1'h0):(1'h0)] : (wire17 ?
                              (8'hae) : wire16)) >= {wire18,
                          wire21[(2'h2):(2'h2)]})) ?
                      ({(!(wire19 ?
                              wire17 : wire20))} || wire16) : ((8'ha5) + $signed(wire16[(3'h5):(2'h3)])));
  assign wire23 = (($unsigned(wire18) > wire16[(4'he):(3'h5)]) ?
                      $unsigned((($signed(wire21) && $unsigned(wire22)) >= $unsigned($unsigned(wire21)))) : $signed($signed(((~|(8'hbc)) ?
                          $unsigned(wire22) : (~&wire20)))));
endmodule
