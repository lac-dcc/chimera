module top
#(parameter param69 = ((((^{(8'ha5)}) ? (^((8'hb1) ? (8'hb5) : (8'ha7))) : ((&(8'ha9)) ? {(8'ha7)} : ((8'hb5) >> (8'hb7)))) ? (^{(^~(8'hbf)), {(7'h40), (8'hb6)}}) : {(((8'ha6) | (8'haa)) >= ((8'ha0) ? (8'hbb) : (8'ha5))), ((~&(8'hab)) ? ((8'ha8) > (8'h9e)) : (8'hb5))}) || (({((8'ha8) ? (8'hae) : (7'h42)), (^(8'hab))} ? ((!(8'hbe)) || (~&(8'hbd))) : (((8'ha7) | (8'hba)) ? (-(8'hbc)) : ((8'ha1) | (8'hb7)))) ? {{((8'hb4) ? (8'hb4) : (8'hb5)), ((8'hbc) ? (8'ha1) : (7'h44))}, {((8'hbe) + (7'h41))}} : (!((+(7'h41)) < ((7'h40) << (8'ha3)))))), 
parameter param70 = param69)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire66;
  assign y = {wire68,
                 wire44,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire46,
                 wire66,
                 (1'h0)};
  assign wire4 = {$signed((|$signed(wire2)))};
  assign wire5 = ($signed($signed((8'had))) ?
                     wire1[(3'h4):(1'h0)] : ($signed($signed((wire3 + wire3))) ?
                         {$unsigned(wire0[(3'h4):(1'h1)])} : (^wire1)));
  assign wire6 = (($unsigned((|wire0[(4'hc):(1'h1)])) ^ (((wire4 + wire2) < $unsigned(wire4)) ?
                     $unsigned(wire5[(2'h3):(1'h0)]) : $signed((wire1 | wire0)))) ~^ $signed({(8'hbb),
                     $signed(((7'h44) ? wire2 : wire0))}));
  assign wire7 = (wire3[(5'h10):(4'hd)] && ($signed(($signed(wire2) - $signed(wire4))) ?
                     $signed(wire2) : $signed(wire6)));
  module8 #() modinst45 (.wire10(wire5), .wire13(wire2), .wire11(wire0), .wire9(wire7), .y(wire44), .wire12(wire3), .clk(clk));
  assign wire46 = ((&wire3) >>> ((+$unsigned($unsigned(wire0))) ?
                      $unsigned((wire44 >> (wire5 ^ (8'h9e)))) : wire4));
  module47 #() modinst67 (.wire52(wire4), .wire48(wire7), .wire50(wire2), .y(wire66), .wire51(wire3), .wire49(wire46), .clk(clk));
  assign wire68 = (!($unsigned($unsigned($unsigned((8'hbf)))) <<< wire44));
endmodule

module module47  (y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire52;
  input wire signed [(5'h13):(1'h0)] wire51;
  input wire [(4'h8):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  input wire [(2'h3):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= ((wire49 ?
          (((wire51 ? wire50 : wire49) - wire51) || (wire49 ?
              (wire52 == (8'haa)) : $unsigned(wire50))) : $signed({$signed(wire48)})) >= $signed(((~^(~(8'hab))) + ($unsigned(wire52) ?
          $signed(wire50) : wire52[(1'h1):(1'h1)]))));
      reg54 <= wire49[(1'h1):(1'h0)];
      if ($signed(wire51[(1'h1):(1'h0)]))
        begin
          reg55 <= wire52;
          reg56 <= $unsigned(($signed((|(~|wire48))) + $unsigned(wire50[(3'h6):(3'h6)])));
          reg57 <= (8'ha2);
          reg58 <= $unsigned(wire51[(4'h8):(3'h6)]);
        end
      else
        begin
          reg55 <= reg53[(1'h0):(1'h0)];
          reg56 <= {(reg54 ?
                  ($unsigned((reg56 ?
                      reg53 : reg54)) != (^wire48[(2'h2):(1'h0)])) : $signed(((wire48 ?
                          wire50 : wire50) ?
                      (~|reg54) : $signed(reg53))))};
        end
    end
  assign wire59 = ((~({$unsigned(wire49),
                          $unsigned(reg56)} == $signed($signed(wire51)))) ?
                      reg58[(1'h1):(1'h0)] : ((reg56[(4'h9):(2'h2)] ?
                          ($unsigned(reg53) ?
                              (reg58 ? wire49 : wire50) : (reg55 ?
                                  reg54 : (8'hba))) : (^{wire50,
                              wire50})) && $unsigned((reg53 ?
                          $signed(wire48) : (wire51 <<< reg57)))));
  assign wire60 = {(^~(~&$signed(wire59[(3'h6):(1'h1)]))),
                      (reg58 ?
                          $unsigned(((wire50 ?
                              reg58 : (8'ha3)) <= wire51[(4'hd):(4'hd)])) : wire48[(2'h3):(2'h3)])};
  assign wire61 = (((^~{$unsigned(reg57)}) ~^ {(8'hb8)}) || $signed({($signed(reg54) ?
                          $unsigned(wire48) : $signed(wire48))}));
  assign wire62 = $unsigned($unsigned(($signed(((7'h44) ?
                      wire48 : reg56)) <= wire51)));
  assign wire63 = (~^wire51);
  assign wire64 = (|$signed($unsigned({(&reg53), (reg56 ? (8'had) : reg56)})));
  assign wire65 = (reg53[(1'h0):(1'h0)] ^ reg54[(3'h4):(3'h4)]);
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire32,
                 wire30,
                 wire15,
                 wire14,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire14 = ((!$signed({(wire13 && wire11),
                      wire12})) != (~^{({wire9} * $unsigned(wire12))}));
  assign wire15 = wire14;
  module16 #() modinst31 (.y(wire30), .wire19(wire10), .wire17(wire15), .wire18(wire9), .clk(clk), .wire20(wire13));
  assign wire32 = $signed((|(~|wire14[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg33 <= $signed($unsigned((8'hbf)));
      reg34 <= $unsigned(wire30[(2'h2):(2'h2)]);
      reg35 <= $unsigned($signed((wire13[(3'h7):(1'h0)] ?
          wire15[(5'h11):(2'h2)] : ((^~(8'haf)) ?
              wire13[(2'h3):(1'h0)] : $unsigned(wire15)))));
      if ({(-wire30)})
        begin
          reg36 <= ($unsigned(wire14[(3'h4):(1'h0)]) * $signed((($unsigned(wire11) << (8'hb8)) ?
              $unsigned((8'h9c)) : $signed((-wire14)))));
        end
      else
        begin
          reg36 <= (~&wire30[(1'h1):(1'h1)]);
          reg37 <= wire30[(2'h2):(1'h1)];
          reg38 <= reg37;
          reg39 <= (($signed(((~|wire30) < $signed((8'hb8)))) ?
              $signed(wire11[(4'he):(4'hc)]) : (wire14[(3'h6):(1'h1)] && $unsigned(reg35[(5'h12):(3'h4)]))) | $unsigned(($signed(wire15) ?
              (~^((8'hbe) ^~ (8'hb8))) : reg33[(4'hd):(4'ha)])));
          reg40 <= (($unsigned(($signed(reg36) ?
                  (wire11 ? wire13 : (8'hbe)) : (reg37 ? wire13 : reg34))) ?
              ((wire11[(4'hc):(3'h6)] ?
                  (reg35 ? reg37 : (8'ha5)) : (wire30 <<< wire13)) + ((8'ha1) ?
                  $unsigned(wire12) : $unsigned((8'hac)))) : (($signed(reg37) ?
                  {(8'ha5)} : reg33) * reg35[(4'h8):(2'h3)])) && (~|reg34[(3'h4):(1'h1)]));
        end
      reg41 <= (!wire13[(3'h4):(1'h1)]);
    end
  assign wire42 = ({((~$unsigned(wire14)) ~^ (~(wire14 ? reg41 : reg39))),
                          $signed($unsigned(((8'had) ? wire30 : wire10)))} ?
                      $unsigned(reg34) : (wire11[(4'he):(1'h0)] ?
                          reg34[(3'h7):(2'h3)] : (($unsigned((8'hba)) < (-reg37)) ?
                              $signed(wire11[(5'h11):(3'h5)]) : wire32[(4'hb):(4'h8)])));
  assign wire43 = reg33;
endmodule

module module16
#(parameter param29 = {{(~|{(~|(8'hb9)), {(8'hb8)}}), ((((8'hbb) + (8'ha8)) ? {(8'ha7)} : ((8'h9d) == (8'haa))) ~^ {((7'h43) ? (8'hb9) : (8'hbf))})}, ((((+(8'hbc)) ? ((8'ha4) ^~ (8'hb6)) : (8'hbc)) - ((8'hbe) ? (^~(8'ha6)) : ((8'ha0) ? (8'hbe) : (8'ha8)))) < {((~(8'hb6)) * (&(8'hac)))})})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg25,
                 (1'h0)};
  assign wire21 = wire19;
  assign wire22 = (~^((($signed((8'hb0)) | ((8'ha8) ? (7'h41) : wire20)) ?
                          $signed($signed(wire20)) : wire18[(3'h4):(1'h0)]) ?
                      wire21 : wire17));
  assign wire23 = wire18;
  assign wire24 = wire23;
  always
    @(posedge clk) begin
      reg25 <= $unsigned({$unsigned({$unsigned(wire17)})});
    end
  assign wire26 = (8'ha5);
  assign wire27 = $unsigned($unsigned(wire17[(4'hb):(3'h7)]));
  assign wire28 = wire19[(3'h4):(2'h3)];
endmodule
