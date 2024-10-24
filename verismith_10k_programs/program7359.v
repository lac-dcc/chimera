module top
#(parameter param60 = ({(7'h42)} ? (((|{(8'ha0), (8'ha7)}) ? (~|{(8'ha2)}) : ({(8'hac), (8'h9c)} ~^ {(8'hba)})) < (((^(8'haf)) ? (~|(8'hbb)) : ((8'ha3) ? (7'h42) : (8'hae))) ? (((8'had) ? (8'hbc) : (8'hb2)) ^ (|(8'hb7))) : (((8'hbe) >= (8'ha1)) >= (8'hbe)))) : {((&{(8'ha3)}) ? (((8'hb1) ? (7'h42) : (8'ha3)) <<< ((8'hba) ? (8'hb0) : (8'had))) : {(~^(8'ha7))}), (&{(8'hb0), (~|(8'hac))})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire56;
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  assign y = {wire58,
                 wire25,
                 wire6,
                 wire5,
                 wire4,
                 wire56,
                 reg59,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  assign wire4 = wire3[(4'ha):(3'h5)];
  assign wire5 = $signed(wire2);
  assign wire6 = (^~wire5[(3'h5):(2'h3)]);
  module7 #() modinst26 (.wire10(wire2), .y(wire25), .clk(clk), .wire11(wire4), .wire9(wire0), .wire8(wire1), .wire12(wire6));
  always
    @(posedge clk) begin
      reg27 <= $unsigned($signed($unsigned(($signed(wire3) < (wire5 && (8'ha6))))));
      reg28 <= wire2;
      if ((+(8'had)))
        begin
          if ({(+(($unsigned((8'ha7)) >>> (reg28 ?
                  wire2 : reg28)) ^~ $signed(wire5[(5'h12):(3'h7)]))),
              (((~|wire1[(1'h0):(1'h0)]) > wire0[(4'h9):(1'h1)]) | $signed(((wire0 ?
                  reg28 : wire3) - $unsigned(reg28))))})
            begin
              reg29 <= ({(wire0 == (wire3[(1'h1):(1'h1)] * reg27)),
                      ((8'hb2) >>> reg28[(1'h1):(1'h1)])} ?
                  (wire6 & $signed(($unsigned((8'hbe)) | wire3[(3'h4):(2'h2)]))) : (~(~^{$unsigned(reg28)})));
              reg30 <= reg27;
              reg31 <= $unsigned(wire2[(5'h11):(2'h2)]);
              reg32 <= {((wire6[(2'h2):(1'h1)] ?
                      (+(~|wire1)) : ((reg30 >> reg29) - $signed(wire4))) ~^ (reg27 ?
                      $signed(wire6[(3'h4):(3'h4)]) : reg31[(2'h2):(2'h2)])),
                  (reg29 ?
                      $signed(reg31[(2'h2):(2'h2)]) : wire2[(3'h4):(2'h2)])};
              reg33 <= $signed($signed(wire1));
            end
          else
            begin
              reg29 <= $signed(((~^(!{reg29})) ?
                  (wire4[(3'h4):(2'h3)] > {(reg32 ? reg29 : reg27),
                      reg32}) : ((~^reg27) != ({reg27, reg32} >= {reg28,
                      wire4}))));
            end
          if (((((^(wire3 >> reg28)) ^ ((wire6 ? reg32 : wire1) <= reg32)) ?
              $unsigned($unsigned((reg31 >> wire0))) : (($signed(wire25) != {(8'hb0)}) ?
                  (~&reg31) : $signed({wire5}))) << wire1))
            begin
              reg34 <= wire2[(4'hc):(4'h8)];
              reg35 <= $signed(wire3[(3'h4):(2'h3)]);
              reg36 <= $signed($unsigned(((~&(wire5 ? reg34 : reg31)) ?
                  $signed(wire4[(4'h9):(4'h9)]) : (~((7'h43) | reg28)))));
            end
          else
            begin
              reg34 <= (wire4 ^~ $signed((8'hb9)));
            end
          if ((wire5[(4'hb):(3'h5)] >= wire6))
            begin
              reg37 <= {((^~wire1[(3'h4):(3'h4)]) * reg36[(1'h0):(1'h0)]),
                  $unsigned(reg31[(4'ha):(2'h2)])};
            end
          else
            begin
              reg37 <= {reg31};
              reg38 <= ((reg28 < ((8'h9c) ?
                  wire3 : $signed(reg27[(3'h5):(2'h2)]))) <<< reg35);
              reg39 <= (|$signed($signed(((wire25 ? (7'h42) : reg30) ?
                  reg38[(4'h9):(3'h6)] : $unsigned(reg35)))));
              reg40 <= $signed({reg30[(2'h2):(2'h2)],
                  ($unsigned(reg35) && (+reg36))});
            end
        end
      else
        begin
          reg29 <= reg29[(4'ha):(2'h3)];
          reg30 <= $unsigned(($unsigned((!((7'h43) ?
              reg28 : wire6))) >= reg30[(3'h4):(1'h1)]));
          reg31 <= wire2;
          reg32 <= $unsigned((($signed((-wire0)) ?
              $unsigned((wire2 ?
                  reg38 : wire6)) : $unsigned($unsigned(wire4))) == {(|$unsigned(reg28)),
              $signed(reg27[(4'hc):(3'h4)])}));
        end
    end
  module41 #() modinst57 (wire56, clk, reg38, wire25, wire3, wire6, reg28);
  assign wire58 = (~(((|(-wire25)) <<< ($unsigned(reg33) ?
                      $unsigned(wire6) : (^reg36))) ^ (~&$unsigned((-wire2)))));
  always
    @(posedge clk) begin
      reg59 <= $signed((~reg35));
    end
endmodule

module module41
#(parameter param54 = ((&(&(8'had))) * {((((8'hab) ? (7'h43) : (8'hbb)) ? (+(8'hbb)) : ((8'h9f) ? (8'hbd) : (8'hba))) ? (((8'hb3) || (7'h43)) << (~|(7'h44))) : (!(&(8'ha1)))), (({(8'had), (8'h9d)} ^ ((8'h9e) >>> (8'ha2))) ^~ (((8'ha9) ~^ (8'ha7)) ? (8'h9f) : (~^(8'haf))))}), 
parameter param55 = (+({((~^param54) ? (param54 <= param54) : param54), (8'hb5)} ? ((~^((8'hb4) ? param54 : param54)) ? ((param54 ? param54 : (8'hba)) ? (~param54) : (param54 ? param54 : (7'h42))) : (8'hbe)) : (~|param54))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire46;
  input wire signed [(3'h6):(1'h0)] wire45;
  input wire [(2'h3):(1'h0)] wire44;
  input wire [(4'h8):(1'h0)] wire43;
  input wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  assign y = {wire53, wire52, wire51, wire50, wire49, wire48, wire47, (1'h0)};
  assign wire47 = (!wire42);
  assign wire48 = $unsigned(wire46);
  assign wire49 = wire43;
  assign wire50 = (((+wire45[(3'h6):(3'h6)]) ?
                          (-wire45) : $unsigned((wire46 || (wire44 << wire43)))) ?
                      (~|$unsigned($signed($unsigned((8'hb2))))) : $signed($unsigned(((wire45 ~^ wire43) ?
                          wire43[(3'h7):(2'h3)] : $unsigned(wire49)))));
  assign wire51 = wire46[(2'h3):(1'h0)];
  assign wire52 = (wire51 * $signed((-$unsigned((^~wire44)))));
  assign wire53 = $signed(((8'hab) + $signed($unsigned(wire49))));
endmodule

module module7
#(parameter param24 = ((((|((8'haa) != (8'hbd))) ? (((8'ha1) ? (8'hbb) : (8'hb4)) ? {(8'ha0), (7'h43)} : ((8'h9c) && (7'h44))) : {(!(8'hb3)), (~^(8'haf))}) || (~^(^((8'h9f) != (8'h9f))))) ? (~^{((|(8'hbf)) ~^ (~^(8'hb4))), (~&((8'hb7) && (8'hb9)))}) : {(~|(|(8'hb5)))}))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  assign y = {wire23,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire13 = $signed(($unsigned(wire11[(3'h4):(2'h3)]) ?
                      wire12 : $signed((|wire8[(3'h4):(1'h0)]))));
  assign wire14 = ((8'ha8) ? wire12 : wire11);
  assign wire15 = wire8[(1'h0):(1'h0)];
  assign wire16 = $unsigned(wire12[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg17 <= $unsigned((|($unsigned(wire10[(1'h0):(1'h0)]) ?
          $signed(wire11) : (^~$unsigned((8'hac))))));
      reg18 <= (((+(wire14[(3'h4):(2'h2)] - $signed(wire12))) ?
          (({(8'ha9)} ? $signed(wire15) : (wire8 ? (8'ha9) : wire10)) ?
              (8'ha0) : (reg17 == {wire14, wire15})) : ((wire14 < (~wire16)) ?
              $signed(wire14) : wire10)) - wire8[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg19 <= ((~wire8) + (-(-($unsigned(wire10) * (wire15 ?
          reg18 : wire8)))));
      reg20 <= (($unsigned((~|wire12)) ?
          ({$signed((8'hb4))} ?
              ((wire10 != (8'had)) <<< (wire13 || wire13)) : (!$signed(reg17))) : $unsigned((!(~&wire11)))) <= $signed($signed($unsigned($signed(wire11)))));
      reg21 <= reg19[(3'h6):(2'h2)];
      reg22 <= wire14[(1'h1):(1'h0)];
    end
  assign wire23 = (~(+reg20));
endmodule
