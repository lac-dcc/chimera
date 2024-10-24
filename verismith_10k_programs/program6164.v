module top
#(parameter param61 = (~&((~&((~(8'hbc)) + ((8'hbe) ? (7'h41) : (8'ha0)))) ? (|{{(8'hbb), (8'hba)}, ((8'hba) ? (8'hb1) : (8'ha9))}) : (~^((~(8'ha8)) > (|(8'ha6)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire51;
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire31,
                 wire33,
                 wire51,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg17,
                 reg16,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed({(((wire3 || (8'hab)) ?
              {(8'hbc), wire1} : wire0) ^ wire4)});
      reg6 <= $signed($unsigned($signed(wire2)));
      reg7 <= {(wire2[(3'h7):(1'h0)] ?
              {wire2[(1'h1):(1'h1)]} : $unsigned($unsigned((~^wire3))))};
    end
  assign wire8 = wire2[(1'h1):(1'h1)];
  assign wire9 = ((reg7 ?
                         {$unsigned((~^wire2))} : $unsigned(reg5[(3'h7):(3'h4)])) ?
                     $unsigned((~(^$signed(reg5)))) : $signed(wire2[(4'h8):(3'h4)]));
  assign wire10 = (reg6 ?
                      ((^~reg6[(3'h4):(1'h1)]) | (7'h43)) : (wire1[(1'h1):(1'h0)] ?
                          wire0 : ((|wire9[(2'h3):(2'h3)]) ?
                              ((wire8 ^ wire1) ?
                                  (wire3 > wire0) : (!wire3)) : wire1)));
  assign wire11 = wire9[(3'h6):(2'h2)];
  assign wire12 = ($unsigned($signed(((~wire2) != wire2))) > ($unsigned($unsigned((reg5 && wire11))) ~^ $unsigned(reg5[(3'h4):(1'h0)])));
  assign wire13 = $signed($unsigned($signed(wire8[(3'h7):(3'h5)])));
  assign wire14 = $signed(reg5);
  assign wire15 = $signed({{{$signed(wire10)}}});
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((^wire9))))
        begin
          reg16 <= (reg5[(1'h0):(1'h0)] <= (~&(-(wire8[(3'h7):(2'h2)] ?
              (wire0 ? wire2 : wire12) : (~|wire2)))));
          reg17 <= ((!(wire2 ?
                  {(wire4 != wire9)} : ((~^wire4) ? (-wire11) : {(8'hab)}))) ?
              $unsigned((((wire9 ? wire2 : wire10) != (wire9 - wire0)) ?
                  wire8[(4'h8):(2'h3)] : $signed((8'hb0)))) : ((+wire3[(4'ha):(4'h9)]) <= (wire8[(2'h3):(1'h1)] >= ($signed((8'haf)) < (wire4 ?
                  reg7 : wire3)))));
        end
      else
        begin
          reg16 <= (8'hb0);
        end
    end
  module18 #() modinst32 (wire31, clk, wire15, reg16, wire10, wire13, wire3);
  assign wire33 = $unsigned((&wire4[(3'h6):(1'h0)]));
  module34 #() modinst52 (wire51, clk, wire1, reg17, wire8, wire15);
  assign wire53 = wire33;
  assign wire54 = ($unsigned($signed((~|reg7))) ?
                      (({$signed(wire14), $signed(wire15)} ?
                          (8'hbf) : wire9) | (((|wire0) ? reg17 : {(8'hae)}) ?
                          wire2 : $unsigned(wire3[(4'he):(3'h6)]))) : reg7[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg55 <= ({wire13[(2'h2):(2'h2)],
          {(|(|(8'ha3))), $signed(wire54)}} + wire11[(1'h0):(1'h0)]);
      reg56 <= ({{((8'had) ? $signed(wire13) : (wire3 > (8'hab)))},
          wire15[(4'he):(3'h6)]} >> reg17[(4'h9):(2'h2)]);
      if ($signed(reg7))
        begin
          reg57 <= $unsigned(wire33[(1'h1):(1'h1)]);
          reg58 <= {(~&reg5),
              ((^$signed((wire11 && wire4))) ?
                  $signed($signed(wire31)) : $unsigned(($unsigned(reg57) << (reg55 <<< wire10))))};
          reg59 <= wire54;
          reg60 <= $signed($unsigned(wire51[(2'h2):(1'h0)]));
        end
      else
        begin
          reg57 <= (-wire54);
          reg58 <= (|($unsigned((wire14 + $unsigned(reg17))) ?
              ((~|wire2[(1'h0):(1'h0)]) ?
                  (&{(8'h9e),
                      (7'h41)}) : wire15[(4'h9):(4'h9)]) : $signed({reg7[(3'h4):(2'h2)],
                  (wire8 || reg16)})));
          reg59 <= $signed((^~$unsigned((reg16 ?
              (+wire3) : (wire13 ^ wire13)))));
        end
    end
endmodule

module module34  (y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire38;
  input wire [(4'hc):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 (1'h0)};
  assign wire39 = $signed(wire38[(3'h5):(3'h5)]);
  assign wire40 = $unsigned($signed({$unsigned((8'ha5))}));
  assign wire41 = (({wire36[(3'h7):(3'h5)], $unsigned($signed((8'had)))} ?
                          $signed((8'hac)) : (wire39[(1'h1):(1'h0)] ?
                              (wire35 ?
                                  (wire40 & wire39) : (^(8'haa))) : (|(7'h43)))) ?
                      (~^($signed(wire37[(2'h2):(1'h1)]) ?
                          (8'hb1) : wire35)) : $unsigned(((~&{wire38, wire36}) ?
                          {wire40[(5'h12):(4'hc)]} : (8'hae))));
  assign wire42 = (+(8'hac));
  assign wire43 = wire41[(2'h3):(2'h3)];
  assign wire44 = (~|$unsigned($signed(($unsigned(wire36) ?
                      (wire35 != wire36) : ((8'hb3) < (8'hb7))))));
  assign wire45 = (wire40 ?
                      {$unsigned(wire37[(3'h4):(1'h1)])} : $signed((8'haa)));
  assign wire46 = (wire45 | ((wire45 || {((8'hbe) ? wire35 : wire39)}) ?
                      (((!wire35) ?
                          $unsigned(wire35) : (wire41 >= wire35)) ^ (8'h9e)) : (&wire38[(2'h2):(2'h2)])));
  assign wire47 = $signed((^~(wire44[(4'hc):(2'h2)] << {((8'haa) != (8'had)),
                      wire42[(2'h2):(1'h1)]})));
  assign wire48 = wire44[(4'he):(3'h7)];
  assign wire49 = wire37[(2'h2):(1'h0)];
  assign wire50 = ($signed(wire42[(1'h0):(1'h0)]) ?
                      wire39 : $unsigned({$unsigned((wire35 ?
                              (8'hb4) : (8'hae)))}));
endmodule

module module18
#(parameter param30 = {(((((7'h44) ? (8'hb5) : (8'ha5)) ? {(8'hb8)} : ((8'hb2) ? (8'ha2) : (8'ha4))) ? (~^((8'h9f) ? (8'hb5) : (7'h40))) : ((!(8'hb2)) == ((7'h40) * (8'hbe)))) || (8'ha3))})
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  input wire signed [(3'h4):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  assign y = {wire29, wire28, wire27, wire26, wire25, wire24, (1'h0)};
  assign wire24 = ({$unsigned(wire22)} ? wire21 : (~|wire20));
  assign wire25 = ($signed($unsigned({wire22})) > (+$unsigned(wire23[(4'hc):(1'h0)])));
  assign wire26 = (^$unsigned(wire20[(2'h3):(2'h2)]));
  assign wire27 = (^((&$unsigned((~^wire22))) ?
                      {(wire26[(3'h6):(3'h4)] ?
                              $unsigned(wire20) : (^~(8'hb4))),
                          $unsigned(wire24[(4'h8):(2'h3)])} : $unsigned(((wire22 ?
                              wire24 : (8'hab)) ?
                          wire26 : (wire19 <<< wire24)))));
  assign wire28 = $signed((wire22 ^ (({wire25,
                      wire25} < $unsigned(wire26)) ^~ $signed($unsigned(wire24)))));
  assign wire29 = (($unsigned((wire22[(3'h7):(3'h6)] <= $unsigned(wire21))) ?
                      ((wire26 ? $signed(wire24) : (wire24 == wire27)) ?
                          {wire28,
                              (wire28 ? wire24 : wire24)} : ($unsigned(wire23) ?
                              $signed(wire24) : (wire26 >> wire21))) : ((|(wire20 << wire25)) ?
                          wire20 : {$signed(wire19),
                              (8'haa)})) >= $unsigned(wire21));
endmodule
