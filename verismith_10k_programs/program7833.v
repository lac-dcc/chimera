module top
#(parameter param53 = (|(~^(&{(~|(8'h9c))}))), 
parameter param54 = (^~({{(~&param53)}} ? {{(8'ha8)}} : {(((8'hab) != param53) >>> (~|(8'h9c))), (param53 ^~ (param53 ? param53 : param53))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
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
                 wire37,
                 wire35,
                 wire6,
                 wire5,
                 wire4,
                 reg39,
                 reg38,
                 reg7,
                 (1'h0)};
  assign wire4 = (wire2[(2'h3):(1'h0)] ?
                     wire1[(3'h5):(3'h4)] : wire2[(1'h0):(1'h0)]);
  assign wire5 = $unsigned(((^((~(8'haa)) ~^ (wire1 * wire2))) >= $signed(wire2[(2'h3):(2'h2)])));
  assign wire6 = ((($unsigned($signed(wire2)) <<< {wire0[(1'h1):(1'h1)],
                         $unsigned(wire5)}) ?
                     $signed(wire2[(2'h3):(2'h3)]) : ({(+wire3)} && $signed((-wire3)))) ~^ (^~(wire4[(1'h0):(1'h0)] >>> $signed((wire0 ?
                     wire2 : wire3)))));
  always
    @(posedge clk) begin
      reg7 <= $signed($unsigned($unsigned($unsigned(wire1))));
    end
  module8 #() modinst36 (wire35, clk, wire2, wire5, wire1, wire4);
  assign wire37 = ((-$unsigned(($signed(wire0) ? $signed(reg7) : wire3))) ?
                      $unsigned(((|$signed(wire3)) ?
                          (wire4[(4'h8):(3'h4)] > $signed((7'h42))) : (-(reg7 | wire35)))) : {(-$signed((wire6 ?
                              wire2 : wire35))),
                          wire2[(4'ha):(3'h5)]});
  always
    @(posedge clk) begin
      reg38 <= {$unsigned((wire6[(1'h0):(1'h0)] == $signed(wire35))),
          $signed(((!wire4) >>> wire3))};
      reg39 <= $signed((($unsigned((wire5 ? wire3 : wire35)) == ((+wire1) ?
              wire1 : $unsigned((8'had)))) ?
          ((((8'h9e) > wire4) ^ wire35[(1'h0):(1'h0)]) >>> reg38) : (~|$signed($signed(wire1)))));
    end
  assign wire40 = ($unsigned(((~|(~|wire3)) ?
                      wire4[(4'ha):(3'h4)] : ((wire3 && wire4) * (^wire3)))) * $signed((|((wire3 ?
                      wire5 : wire0) - (wire37 ? wire37 : wire3)))));
  assign wire41 = (!(~^reg39));
  assign wire42 = wire6[(4'h9):(2'h2)];
  assign wire43 = ($unsigned((8'hb3)) ~^ wire6[(3'h4):(2'h2)]);
  assign wire44 = $signed((~(($signed(wire4) >>> (reg7 ? wire42 : reg39)) ?
                      {(wire5 ?
                              wire3 : wire1)} : $unsigned(wire0[(1'h1):(1'h1)]))));
  assign wire45 = $signed(((wire42 ?
                          $unsigned($unsigned(wire37)) : (wire40 ?
                              $unsigned(wire1) : {wire0})) ?
                      (+wire5) : ((~wire3[(1'h1):(1'h0)]) ^~ {$unsigned(wire3)})));
  assign wire46 = $unsigned(((($signed(wire5) >>> (+reg7)) ?
                      {(+wire37),
                          {wire3,
                              wire2}} : $signed((&wire3))) ^ wire40[(1'h1):(1'h1)]));
  assign wire47 = wire4[(3'h5):(3'h4)];
  assign wire48 = wire5[(4'h8):(3'h4)];
  assign wire49 = {$unsigned((wire4 ?
                          $signed((&wire6)) : ((wire41 ? wire47 : wire6) ?
                              (7'h41) : reg39)))};
  assign wire50 = wire45[(4'ha):(2'h3)];
  assign wire51 = (~|$signed($unsigned(wire45)));
  assign wire52 = wire45[(2'h3):(2'h2)];
endmodule

module module8
#(parameter param34 = (8'hbc))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire25,
                 wire24,
                 wire14,
                 wire13,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = wire11[(3'h7):(1'h0)];
  assign wire14 = $unsigned($signed(wire12));
  always
    @(posedge clk) begin
      if ($signed(wire12))
        begin
          if ($unsigned((8'hb9)))
            begin
              reg15 <= (wire9[(4'h8):(2'h2)] || $signed($unsigned(wire10)));
              reg16 <= wire11;
            end
          else
            begin
              reg15 <= (reg15 ? (7'h43) : $signed(reg15));
              reg16 <= $signed($signed($signed(wire10)));
              reg17 <= reg15[(1'h0):(1'h0)];
              reg18 <= ($unsigned((wire14 == reg17)) ?
                  $unsigned(($unsigned($unsigned(wire9)) <<< wire13[(3'h5):(3'h5)])) : $unsigned(wire11));
            end
          reg19 <= ($unsigned((&((reg18 < wire9) >>> (^~reg17)))) ?
              $unsigned((&reg15[(1'h1):(1'h0)])) : (wire10 | wire12));
          reg20 <= {(~reg15[(4'hc):(3'h4)])};
          if (((((^~(wire9 & wire9)) || $signed((reg20 ? reg19 : wire9))) ?
                  ($unsigned(wire11) ?
                      (wire14[(2'h2):(1'h0)] ?
                          $unsigned(reg18) : $unsigned(wire10)) : {(reg20 ?
                              wire9 : reg19)}) : (($signed(wire12) != (^~(8'hba))) ?
                      ($unsigned(wire13) || (reg15 ?
                          wire10 : wire10)) : $unsigned({wire11, wire13}))) ?
              reg19 : (wire11[(4'hd):(4'ha)] ~^ $signed($signed(wire14)))))
            begin
              reg21 <= (~&(reg20[(3'h5):(3'h4)] >= {(reg16 ?
                      $unsigned(wire13) : $unsigned(wire13))}));
              reg22 <= wire9;
              reg23 <= ((($signed((&wire9)) ?
                  wire14 : (wire12[(4'hc):(1'h1)] ?
                      {reg17} : $unsigned(reg20))) <= $signed($signed(wire12[(4'h9):(3'h4)]))) | (({(wire11 ^~ (8'h9e))} ^~ ((~^reg15) ?
                  $unsigned(wire11) : (^~(8'ha3)))) ^~ $signed($unsigned((8'ha9)))));
            end
          else
            begin
              reg21 <= (($signed((8'hbe)) ? (&(+(&wire9))) : reg23) ?
                  wire13[(3'h5):(1'h0)] : $unsigned(($unsigned(((8'hbe) < (7'h43))) <<< (reg19 ?
                      reg15[(4'hc):(4'ha)] : reg16[(4'hb):(4'hb)]))));
            end
        end
      else
        begin
          reg15 <= $unsigned(reg15);
          reg16 <= reg21[(2'h2):(2'h2)];
          if (({(wire10[(1'h1):(1'h0)] ?
                      (~|(-reg16)) : ((reg18 + wire10) ?
                          $unsigned(reg20) : (~reg16))),
                  $signed($signed((reg21 ~^ reg23)))} ?
              (wire12 ^~ $signed(({(8'h9d)} <<< reg15[(3'h6):(3'h5)]))) : (^$signed(reg15))))
            begin
              reg17 <= reg23[(2'h2):(1'h1)];
            end
          else
            begin
              reg17 <= $unsigned($unsigned($signed($signed((reg19 ^~ (8'ha0))))));
              reg18 <= (^~($signed($unsigned(reg20)) ?
                  $unsigned(((reg16 | (8'h9c)) ?
                      $signed((8'hb4)) : (reg21 ? reg15 : reg20))) : wire12));
            end
          reg19 <= $signed((&$signed(reg18)));
          reg20 <= $unsigned(wire14[(2'h3):(2'h2)]);
        end
    end
  assign wire24 = wire11[(1'h0):(1'h0)];
  assign wire25 = reg21[(4'hc):(4'hc)];
  always
    @(posedge clk) begin
      if (((reg16 - reg19) ? $unsigned((^~reg15)) : reg16))
        begin
          reg26 <= (wire13 ?
              ($signed(wire24[(5'h13):(1'h0)]) ?
                  (~{((8'ha4) ? reg22 : reg15)}) : (!((wire14 ?
                      reg21 : reg22) || (wire24 ?
                      reg17 : reg21)))) : ((((&wire11) ?
                      $unsigned(wire10) : (8'ha6)) ?
                  (-reg21[(2'h2):(1'h0)]) : (^~(reg22 - reg22))) ^ reg18[(4'hc):(1'h0)]));
        end
      else
        begin
          reg26 <= (|{$signed(wire13[(3'h7):(3'h6)]),
              (wire25 >>> ((^wire11) ?
                  (reg22 && wire13) : (reg18 ? reg16 : wire11)))});
          reg27 <= reg23[(2'h3):(2'h3)];
          if ((((8'hb2) >> ($unsigned({(8'hae)}) ?
              $signed(reg23) : {(wire14 && reg23)})) - reg16))
            begin
              reg28 <= $unsigned((reg15 <<< ((^~(8'ha9)) ^~ (8'haf))));
              reg29 <= (~&({(wire12 ?
                      (reg27 ? reg21 : reg17) : (wire25 ? wire13 : (8'hb0))),
                  $unsigned(reg15[(4'ha):(1'h1)])} <= reg26[(4'h8):(3'h7)]));
              reg30 <= ((^$signed(((reg27 * reg18) ?
                  reg22[(3'h7):(2'h3)] : $unsigned((8'hb9))))) && (^($unsigned((~|wire13)) >= ((8'ha5) <<< (reg19 ?
                  wire13 : (8'hb5))))));
            end
          else
            begin
              reg28 <= wire25[(4'ha):(1'h1)];
              reg29 <= (8'ha4);
              reg30 <= (($signed((8'ha7)) ?
                      ($signed($unsigned(reg18)) ?
                          (wire11[(4'hb):(3'h4)] ?
                              $unsigned(wire13) : $signed(reg16)) : (reg23[(1'h0):(1'h0)] ^~ ((8'hb6) ?
                              reg28 : reg15))) : reg22) ?
                  reg30 : reg21[(4'hc):(3'h5)]);
            end
        end
      reg31 <= $signed($unsigned($unsigned($signed((wire14 ? reg16 : reg30)))));
    end
  assign wire32 = (reg26[(4'hb):(3'h6)] ?
                      {(8'hb4),
                          (~^((^reg21) ?
                              (reg23 ?
                                  reg22 : wire10) : (wire12 <= reg20)))} : $signed((^(|reg29))));
  assign wire33 = ((reg18[(4'h8):(3'h5)] ?
                          $signed((+$unsigned((8'haa)))) : (^({reg17} ?
                              (~|wire25) : $signed(reg21)))) ?
                      ($unsigned({wire32[(1'h0):(1'h0)], (reg27 * reg16)}) ?
                          (~(&reg17)) : $unsigned(reg20[(2'h2):(1'h0)])) : $unsigned(((~&$signed(reg15)) ?
                          (|{reg29, reg22}) : $signed((reg29 ?
                              reg17 : reg31)))));
endmodule
