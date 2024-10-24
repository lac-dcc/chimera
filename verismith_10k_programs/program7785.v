module top
#(parameter param176 = ((({(~^(7'h40)), (~|(8'hb8))} ? ((~|(8'ha9)) ? (^~(8'hba)) : ((8'hbf) >> (8'h9f))) : (((8'hb6) ? (8'hb1) : (7'h40)) ~^ {(8'ha2)})) ? (((^(8'ha0)) * ((8'hae) ? (8'ha2) : (8'h9d))) >>> {(~^(8'hb6)), ((8'haa) ? (8'h9e) : (7'h41))}) : (((^~(8'ha8)) | (~&(8'hb9))) << ((&(7'h41)) ? ((8'hb0) ? (7'h40) : (8'hbd)) : (8'hb3)))) ? (-(~^(((8'hae) ? (8'ha8) : (8'hbc)) >>> (~|(7'h40))))) : (~|({(|(8'hac))} + {((8'haa) ? (7'h43) : (8'h9c)), {(8'ha7), (8'ha2)}}))), 
parameter param177 = (-(param176 ? param176 : (~|{(~param176), (param176 * param176)}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire175;
  wire signed [(4'hc):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire172;
  wire [(3'h4):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire172,
                 wire40,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 wire10,
                 wire5,
                 wire4,
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
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg13,
                 reg12,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (|wire3);
  assign wire5 = $unsigned((-((wire2[(3'h4):(3'h4)] << $unsigned(wire1)) ?
                     wire4[(2'h3):(1'h1)] : (wire1 * $signed(wire0)))));
  always
    @(posedge clk) begin
      reg6 <= $signed((8'ha5));
      reg7 <= $unsigned($signed($signed($unsigned((wire3 ? reg6 : wire1)))));
      reg8 <= (wire0 > $unsigned({$signed((wire4 ? (8'haf) : wire5))}));
      reg9 <= {$signed(wire0),
          ($unsigned((&wire0[(2'h2):(1'h0)])) * $signed(({wire1, reg8} ?
              $unsigned(wire4) : wire3)))};
    end
  assign wire10 = (+$signed(wire1[(4'h9):(1'h1)]));
  assign wire11 = (8'hb0);
  always
    @(posedge clk) begin
      reg12 <= $signed({reg9[(4'h8):(1'h1)]});
      reg13 <= (wire1 ? wire3[(2'h3):(2'h2)] : $signed(wire2[(3'h4):(1'h0)]));
    end
  assign wire14 = (reg12[(4'h8):(3'h6)] ?
                      (~^((!(|reg13)) || reg7[(3'h4):(2'h2)])) : ((+((reg12 ?
                              wire3 : (8'haf)) ?
                          $signed(wire4) : (reg13 ?
                              reg6 : (8'hac)))) ^~ ((!(wire1 ?
                              wire2 : wire11)) ?
                          (wire5 >>> reg9[(2'h3):(1'h0)]) : (!$unsigned(wire2)))));
  assign wire15 = $signed($signed($unsigned({$unsigned(wire3)})));
  assign wire16 = (~|{(8'ha7)});
  assign wire17 = {$unsigned(wire1[(4'hb):(2'h3)])};
  always
    @(posedge clk) begin
      reg18 <= (~|$signed((~(reg7 <<< wire1))));
      reg19 <= $unsigned((-(wire1[(1'h0):(1'h0)] <= {(wire11 ~^ wire2)})));
      reg20 <= (!(wire2 + $signed(wire5[(4'hc):(3'h5)])));
      reg21 <= ((wire1[(1'h0):(1'h0)] <<< $unsigned(wire2[(3'h6):(3'h6)])) ?
          ($signed($unsigned($signed(wire0))) ?
              wire0 : ($unsigned($signed(wire1)) ?
                  $signed($unsigned(reg19)) : (!reg9[(4'hb):(4'hb)]))) : (wire14[(4'ha):(4'h9)] ?
              wire11 : $unsigned(reg13)));
    end
  always
    @(posedge clk) begin
      reg22 <= $unsigned(wire11[(1'h0):(1'h0)]);
      reg23 <= (^reg7[(1'h0):(1'h0)]);
      reg24 <= $signed((+{$unsigned($unsigned(reg13))}));
      if ((8'hbb))
        begin
          if ($unsigned($unsigned(reg19)))
            begin
              reg25 <= {((wire2 ? wire5 : {reg23}) | wire14[(2'h2):(1'h1)])};
              reg26 <= ({(&wire15[(2'h2):(1'h0)]),
                  (^($signed(reg8) ?
                      (~|wire2) : ((8'h9d) || reg7)))} + (&$unsigned($signed($unsigned(wire3)))));
              reg27 <= wire3;
              reg28 <= $unsigned($signed($unsigned(wire3[(4'hb):(1'h1)])));
            end
          else
            begin
              reg25 <= reg19[(2'h3):(2'h3)];
            end
          reg29 <= ($signed((^(8'h9c))) ^~ {((~&(~wire10)) ?
                  ((wire1 ? (8'ha6) : wire14) ?
                      reg27[(5'h14):(3'h7)] : wire1[(4'h9):(2'h3)]) : reg27),
              $unsigned(reg25)});
          if (wire15)
            begin
              reg30 <= reg24;
              reg31 <= wire1;
              reg32 <= $unsigned($signed({$unsigned(reg8)}));
              reg33 <= (8'ha9);
            end
          else
            begin
              reg30 <= $signed($unsigned($signed((wire11[(3'h4):(3'h4)] ?
                  (reg21 || (8'hac)) : $unsigned(reg26)))));
              reg31 <= wire16[(5'h10):(4'hd)];
              reg32 <= wire5[(4'hb):(3'h7)];
              reg33 <= (8'hbb);
              reg34 <= reg13[(1'h0):(1'h0)];
            end
          if (($unsigned(reg29[(1'h1):(1'h0)]) - reg19))
            begin
              reg35 <= (^(&{reg7}));
              reg36 <= ($signed((reg26 ? $unsigned($signed(reg18)) : wire1)) ?
                  reg9[(3'h4):(3'h4)] : {{wire14, (~|((8'hb9) ^ (8'ha6)))},
                      reg28});
              reg37 <= ($signed(reg27[(5'h13):(4'hb)]) * {(&$signed($signed(wire2))),
                  reg8[(2'h2):(2'h2)]});
              reg38 <= ((({(reg18 * reg35), (reg18 | (8'h9f))} ?
                      {$signed(reg37),
                          $signed(reg23)} : (~^(^~wire3))) > ($unsigned((-reg29)) + (^~(wire10 <<< reg8)))) ?
                  wire17 : (((^$signed(reg23)) ?
                          ($unsigned(reg9) && (wire5 ?
                              reg20 : reg21)) : $signed($unsigned((8'hbe)))) ?
                      ($unsigned(reg33) <= $unsigned($unsigned((8'h9e)))) : reg12));
            end
          else
            begin
              reg35 <= reg29;
              reg36 <= ($signed(reg23[(3'h6):(2'h3)]) && (|(wire2 ?
                  $unsigned($signed(reg7)) : reg21)));
            end
        end
      else
        begin
          reg25 <= wire14[(4'ha):(1'h1)];
          if ({(+wire3[(4'h9):(1'h0)])})
            begin
              reg26 <= $signed((((+wire11[(1'h0):(1'h0)]) ~^ $signed((reg24 > wire2))) ?
                  (!$unsigned((&wire14))) : $signed(wire5[(4'h9):(3'h5)])));
              reg27 <= (|(wire4 ? $signed(wire16[(3'h6):(3'h4)]) : (8'hb7)));
              reg28 <= ($unsigned(reg38) ?
                  {(($signed(reg28) < (reg27 ^~ reg18)) ?
                          $signed(wire2[(3'h6):(1'h1)]) : $signed((8'hae))),
                      {($unsigned(wire1) != (wire1 || reg35)),
                          (^$unsigned(reg28))}} : reg30);
            end
          else
            begin
              reg26 <= reg6[(2'h2):(1'h1)];
              reg27 <= (8'ha5);
              reg28 <= (wire15[(2'h3):(2'h3)] - (reg24[(5'h15):(4'hf)] >>> (~{(reg34 ?
                      reg25 : reg31),
                  {reg37}})));
              reg29 <= (+$signed({$unsigned($signed(wire2)), $signed(reg29)}));
              reg30 <= $signed(wire1[(4'ha):(4'ha)]);
            end
          if (($unsigned({wire0[(1'h1):(1'h1)]}) ?
              (~|{{(reg13 ? reg32 : wire1)},
                  ($unsigned(reg27) * (reg26 ? reg34 : reg7))}) : (reg22 ?
                  ($unsigned((reg25 ~^ reg33)) ^ (8'ha4)) : wire10[(4'ha):(1'h0)])))
            begin
              reg31 <= $unsigned(($signed($unsigned($unsigned(reg31))) <<< ((reg22[(3'h5):(2'h3)] ?
                  {(8'hb3)} : (reg30 || reg38)) ~^ ((reg27 != reg26) ^ $unsigned((8'ha5))))));
              reg32 <= (^$unsigned(($unsigned((reg36 ~^ wire4)) ?
                  reg12[(3'h7):(3'h7)] : $signed($unsigned(reg21)))));
            end
          else
            begin
              reg31 <= ((^~$unsigned(($signed(reg26) ?
                  reg37[(1'h0):(1'h0)] : $signed(reg38)))) <= {$signed(({reg25,
                          reg36} ?
                      ((8'hb1) ? reg13 : (8'h9f)) : reg9))});
            end
          reg33 <= (reg38 ?
              ($unsigned(reg35) <<< $signed(wire16)) : (wire16 ?
                  reg30 : $signed($unsigned((wire17 ? reg22 : reg18)))));
          reg34 <= ((8'hb4) ? wire1[(2'h2):(1'h1)] : wire4[(1'h0):(1'h0)]);
        end
      reg39 <= (reg18 <<< reg31);
    end
  assign wire40 = $unsigned(($unsigned($unsigned(reg38[(3'h4):(2'h3)])) + wire16));
  module41 #() modinst173 (wire172, clk, reg8, reg12, reg7, reg27);
  assign wire174 = (reg26[(4'hf):(4'hd)] ? (8'h9e) : wire16[(4'hf):(4'he)]);
  assign wire175 = $unsigned({$signed({(reg18 ? reg12 : (7'h40))})});
endmodule

module module41
#(parameter param171 = ({((~((8'hbb) | (8'ha1))) | (((8'hb6) ? (8'hac) : (8'ha8)) && ((8'hb0) + (8'hbc)))), (^~{(8'hbd)})} <= (((((8'haf) ? (8'had) : (8'haf)) + (~|(8'ha6))) ^ {{(7'h40), (8'hb3)}}) ^~ {((~|(8'ha9)) ? ((7'h42) <= (8'haa)) : (~&(8'hab)))})))
(y, clk, wire42, wire43, wire44, wire45);
  output wire [(32'h20e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire42;
  input wire [(4'h9):(1'h0)] wire43;
  input wire signed [(4'he):(1'h0)] wire44;
  input wire signed [(4'he):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire167;
  wire signed [(3'h5):(1'h0)] wire166;
  wire signed [(4'hc):(1'h0)] wire165;
  wire signed [(3'h5):(1'h0)] wire164;
  wire [(5'h13):(1'h0)] wire162;
  wire [(4'hf):(1'h0)] wire161;
  wire signed [(4'h8):(1'h0)] wire159;
  wire signed [(4'hf):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire81;
  reg [(2'h2):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg168 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire161,
                 wire159,
                 wire97,
                 wire87,
                 wire83,
                 wire46,
                 wire47,
                 wire48,
                 wire81,
                 reg170,
                 reg169,
                 reg168,
                 reg163,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg86,
                 reg85,
                 reg84,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire46 = wire44[(4'hd):(3'h7)];
  assign wire47 = (((wire46 ?
                      wire42 : ((wire42 ? wire45 : wire43) ?
                          (wire42 == (8'h9e)) : $signed(wire43))) < $signed($unsigned({wire46}))) + $signed((7'h44)));
  assign wire48 = $unsigned(((((~|wire42) < (^wire43)) <<< $unsigned((wire42 ?
                          wire42 : (8'ha3)))) ?
                      wire43[(2'h3):(1'h1)] : (wire45 ^ ($signed((8'hb6)) << (wire43 ?
                          (8'ha3) : wire42)))));
  always
    @(posedge clk) begin
      reg49 <= wire43;
      reg50 <= wire45[(3'h5):(1'h1)];
      if ((+$signed($unsigned((8'hb4)))))
        begin
          reg51 <= $signed(reg49);
          reg52 <= $signed((wire43 ?
              {(!$signed(wire42)),
                  (~&(reg51 ? reg49 : reg51))} : ($unsigned((reg49 ?
                      wire46 : wire42)) ?
                  reg51[(4'hb):(3'h4)] : $signed((-wire42)))));
          reg53 <= $signed((((~^(wire44 ? wire42 : reg51)) ?
              $unsigned(wire42[(4'hd):(2'h2)]) : (reg49[(1'h0):(1'h0)] > $unsigned(wire48))) ^~ {(((8'ha2) >= wire48) + (wire43 <= wire43)),
              $signed((&reg49))}));
          reg54 <= {$signed(wire45[(3'h5):(1'h1)]), wire48};
          reg55 <= ((~&$unsigned(reg54)) ?
              $signed($unsigned(({reg49, reg50} ?
                  $unsigned(wire46) : (wire46 > wire45)))) : {(-(~|(wire46 + wire44)))});
        end
      else
        begin
          if ($unsigned(reg53))
            begin
              reg51 <= (~|(($unsigned($signed(wire47)) - (8'hac)) ?
                  (&reg51[(3'h4):(2'h2)]) : $signed((|$unsigned(reg52)))));
              reg52 <= $signed(wire48[(3'h7):(1'h0)]);
              reg53 <= wire42;
              reg54 <= $unsigned((-(-$unsigned($signed(wire43)))));
            end
          else
            begin
              reg51 <= (wire46 || reg55);
              reg52 <= $unsigned(($signed(((~&reg53) ?
                  (reg55 >> wire43) : (reg51 ~^ wire44))) <= (~$unsigned(reg53[(5'h13):(4'h8)]))));
              reg53 <= wire47[(3'h6):(1'h1)];
            end
          reg55 <= $signed(reg55[(5'h15):(5'h14)]);
        end
    end
  always
    @(posedge clk) begin
      reg56 <= $signed(($unsigned(reg55[(2'h2):(1'h0)]) >= wire42));
      reg57 <= {reg54[(1'h1):(1'h1)]};
      reg58 <= wire47;
      if (wire43[(1'h1):(1'h1)])
        begin
          reg59 <= (|{$unsigned($unsigned(reg56[(2'h2):(1'h1)]))});
          if (reg49)
            begin
              reg60 <= $signed(reg58[(4'h9):(4'h9)]);
              reg61 <= reg52[(3'h5):(3'h5)];
              reg62 <= $signed($signed($unsigned((~&$unsigned(reg55)))));
            end
          else
            begin
              reg60 <= $unsigned((+((|(reg50 ?
                  reg49 : reg59)) | (wire42[(4'hc):(2'h2)] ?
                  reg49[(2'h2):(2'h2)] : (reg58 ? wire42 : (7'h43))))));
              reg61 <= (($unsigned($signed($signed(reg59))) ?
                  reg52 : reg60[(4'ha):(4'h9)]) - reg53[(2'h3):(1'h1)]);
              reg62 <= (reg55[(4'he):(1'h1)] ?
                  $signed((!$unsigned($signed(reg54)))) : ((8'hb6) ?
                      reg53[(5'h14):(2'h2)] : reg51));
            end
        end
      else
        begin
          reg59 <= $signed(($signed((^~$unsigned(reg51))) && (^reg56)));
          reg60 <= (-((($unsigned(wire43) || {reg60}) ?
              $unsigned({reg58}) : reg62) != (^$signed(wire45[(4'ha):(3'h5)]))));
          reg61 <= reg52[(1'h0):(1'h0)];
          reg62 <= $unsigned(wire43[(3'h6):(1'h0)]);
        end
    end
  module63 #() modinst82 (.wire66(reg59), .y(wire81), .wire64(reg60), .wire68(wire47), .clk(clk), .wire67(reg54), .wire65(reg57));
  assign wire83 = $unsigned(($unsigned(wire44) ?
                      reg56[(2'h2):(1'h0)] : $unsigned($signed(((8'hbb) ?
                          reg55 : wire44)))));
  always
    @(posedge clk) begin
      reg84 <= (reg61[(2'h2):(1'h0)] != $signed((8'hb5)));
      reg85 <= $unsigned(((reg51 ?
              (8'hab) : ((+(8'hbf)) >>> $signed((8'hb2)))) ?
          reg49[(1'h0):(1'h0)] : ($signed($signed(wire46)) ?
              {{wire43}, reg62} : reg59[(3'h4):(1'h1)])));
      reg86 <= wire44[(4'h8):(2'h2)];
    end
  assign wire87 = reg55;
  always
    @(posedge clk) begin
      if (wire45)
        begin
          if ($signed(reg86[(3'h4):(1'h0)]))
            begin
              reg88 <= (|({reg62[(5'h12):(2'h3)],
                  $unsigned((~&reg52))} << wire81));
              reg89 <= {$signed(reg58), wire48};
              reg90 <= ((^wire42[(2'h2):(1'h1)]) ?
                  (wire87[(3'h4):(3'h4)] ?
                      (!((+reg89) - reg62)) : (~&reg58[(1'h0):(1'h0)])) : (8'ha0));
              reg91 <= reg52[(2'h3):(1'h0)];
            end
          else
            begin
              reg88 <= (8'h9d);
              reg89 <= $unsigned(reg89);
              reg90 <= (!reg58);
              reg91 <= (reg88 ? reg86[(2'h2):(1'h1)] : reg54);
              reg92 <= $signed((!((8'ha0) ? reg54 : $signed((~&reg51)))));
            end
          reg93 <= ((reg84 ?
              reg88 : $unsigned((((8'hb7) ? wire45 : reg50) + (reg53 ?
                  wire44 : (8'hb9))))) >= reg62);
          reg94 <= reg49[(2'h3):(2'h2)];
        end
      else
        begin
          if ({$unsigned($unsigned(($unsigned((8'ha8)) | (reg49 ?
                  reg94 : wire47))))})
            begin
              reg88 <= $signed($signed($signed($unsigned(reg58[(4'hb):(3'h7)]))));
            end
          else
            begin
              reg88 <= $signed(reg94);
            end
          reg89 <= ($signed(reg52[(3'h7):(2'h2)]) | reg92);
          reg90 <= ($unsigned(((8'had) <<< ((&reg53) ?
              reg53[(4'hb):(3'h4)] : (reg62 < reg90)))) >> (~|reg89[(3'h4):(1'h0)]));
          if ($unsigned($signed((~^$unsigned((wire42 && reg88))))))
            begin
              reg91 <= ((~&(~&{(reg50 >= wire42)})) == reg57[(4'hd):(4'hd)]);
              reg92 <= $unsigned($unsigned($signed(reg61)));
              reg93 <= $signed({{{reg91[(2'h3):(2'h2)]}}, $unsigned(wire43)});
            end
          else
            begin
              reg91 <= $unsigned((|((8'ha9) ?
                  ((reg92 ~^ reg84) ?
                      reg93[(4'he):(3'h5)] : (wire87 ?
                          reg85 : reg50)) : reg90[(3'h5):(1'h1)])));
              reg92 <= (reg59 - (|((((8'hab) << wire87) ?
                      $unsigned(reg61) : $signed(wire47)) ?
                  (((8'hab) < reg51) ?
                      (^wire83) : $unsigned(reg52)) : (8'ha3))));
            end
          if ((^~$signed($unsigned((^~wire43)))))
            begin
              reg94 <= {reg92};
              reg95 <= (+(($signed((~&reg56)) ?
                  ({wire87} ?
                      $unsigned((8'ha5)) : (reg58 ?
                          wire81 : reg88)) : (|(wire81 ~^ wire83))) != (($unsigned((8'hbf)) >>> reg85[(3'h7):(3'h7)]) <= (8'hb8))));
              reg96 <= $unsigned((reg86[(3'h6):(3'h5)] + reg58[(3'h5):(3'h4)]));
            end
          else
            begin
              reg94 <= wire83;
              reg95 <= ((wire83[(3'h6):(3'h5)] < $unsigned($unsigned(wire42[(2'h2):(1'h0)]))) && reg86[(3'h4):(2'h2)]);
              reg96 <= (reg58 << (~&$unsigned((-(&reg95)))));
            end
        end
    end
  assign wire97 = wire43;
  module98 #() modinst160 (wire159, clk, reg57, reg51, reg96, reg53);
  assign wire161 = reg51[(4'hf):(3'h6)];
  assign wire162 = $unsigned({$signed({(wire83 > reg92), $signed(reg91)}),
                       (wire159[(2'h3):(1'h0)] ?
                           $signed(((8'hbd) && reg96)) : {((8'h9c) ?
                                   reg62 : reg96)})});
  always
    @(posedge clk) begin
      reg163 <= wire162[(3'h5):(2'h3)];
    end
  assign wire164 = {(reg62 ?
                           $signed(wire97[(4'hb):(4'ha)]) : $unsigned((8'hb9))),
                       wire87};
  assign wire165 = reg59[(1'h0):(1'h0)];
  assign wire166 = ((((^~(~&wire162)) >= {(8'hb4), (reg95 >= wire48)}) ?
                       $unsigned({(&reg57),
                           (reg90 ? wire47 : reg93)}) : ($signed(reg53) ?
                           (8'ha9) : wire161[(4'hb):(3'h4)])) ^~ ($unsigned((+(wire87 - reg52))) - wire45[(4'hb):(3'h7)]));
  assign wire167 = (reg90 | wire43);
  always
    @(posedge clk) begin
      if ({((~|reg163[(2'h3):(2'h3)]) ?
              reg86 : (($signed(wire167) ^~ (~^(8'hac))) ^~ reg61))})
        begin
          reg168 <= {{(~&((~|reg52) ^ (wire159 || reg56))),
                  (((reg55 < (8'hb8)) < ((8'ha7) ?
                      reg57 : (8'ha8))) && $unsigned((&reg53)))}};
          reg169 <= reg91;
          reg170 <= reg92[(3'h5):(2'h3)];
        end
      else
        begin
          reg168 <= reg58[(3'h5):(3'h5)];
          reg169 <= reg50[(5'h11):(4'ha)];
        end
    end
endmodule

module module98  (y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h243):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire102;
  input wire [(5'h12):(1'h0)] wire101;
  input wire signed [(3'h4):(1'h0)] wire100;
  input wire [(5'h11):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire158;
  wire signed [(4'hd):(1'h0)] wire137;
  wire [(5'h10):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire103;
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  assign y = {wire158,
                 wire137,
                 wire119,
                 wire118,
                 wire112,
                 wire111,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg110,
                 (1'h0)};
  assign wire103 = (+$unsigned({$signed((|(8'ha1)))}));
  assign wire104 = $unsigned(((wire103 || (~|(wire100 ? wire102 : (8'h9d)))) ?
                       (8'ha6) : $signed($signed({wire102}))));
  assign wire105 = $unsigned((((^wire102[(2'h2):(1'h0)]) * (^$unsigned(wire104))) ?
                       {($signed(wire102) << (wire103 >>> wire101)),
                           $signed($signed(wire103))} : (^(~(wire100 ?
                           wire100 : (8'hac))))));
  assign wire106 = $signed((wire104 ?
                       $unsigned({$unsigned(wire101)}) : wire103[(1'h0):(1'h0)]));
  assign wire107 = wire105;
  assign wire108 = {(-(^$signed(wire105))),
                       (($unsigned((wire102 * wire106)) ?
                           ((~|wire100) > wire107) : wire99[(2'h3):(1'h0)]) * $signed((wire106[(4'he):(3'h7)] && ((8'hae) ^ wire103))))};
  assign wire109 = ((wire106[(4'hc):(4'hb)] ?
                           ((wire103 ?
                               wire102[(1'h0):(1'h0)] : (wire106 && wire104)) ^~ wire102) : $signed($signed({wire108}))) ?
                       $unsigned($unsigned(wire103[(1'h0):(1'h0)])) : (-({$unsigned(wire106),
                               wire103[(2'h3):(2'h2)]} ?
                           ((~wire105) + wire105) : $unsigned($signed((8'hb9))))));
  always
    @(posedge clk) begin
      reg110 <= (^($signed((~&(wire109 * wire108))) ?
          (wire109[(2'h2):(1'h1)] & $signed(wire101)) : $signed($unsigned((wire100 && wire106)))));
    end
  assign wire111 = {wire107[(2'h2):(1'h1)], wire102[(4'ha):(1'h1)]};
  assign wire112 = wire102[(4'ha):(2'h3)];
  always
    @(posedge clk) begin
      if (((-(+(~&wire102[(4'h8):(2'h3)]))) ^ ((wire109 ^~ wire111[(1'h1):(1'h1)]) ?
          wire108[(2'h3):(1'h1)] : {(wire111 > wire106[(3'h4):(3'h4)])})))
        begin
          reg113 <= (~^$signed({$signed(((8'hb1) >>> wire99)),
              (~&(^wire100))}));
          reg114 <= reg113;
          reg115 <= (wire112[(4'h9):(3'h5)] ?
              (($signed(wire107) ?
                      ((reg110 ?
                          wire101 : wire99) <<< (~^(8'hb7))) : {$signed(wire105),
                          wire104}) ?
                  (+$unsigned(wire102[(4'h8):(1'h1)])) : $signed(reg113[(3'h6):(1'h1)])) : (~&(wire109 ?
                  {(wire111 ? reg114 : wire109),
                      wire105[(1'h1):(1'h0)]} : $unsigned($signed((8'hba))))));
          reg116 <= $signed((^wire107[(3'h7):(1'h1)]));
          reg117 <= {({$signed(wire104[(4'hb):(3'h5)]),
                      $signed($unsigned(reg113))} ?
                  $signed(((!reg116) ?
                      wire106 : $unsigned(wire106))) : $unsigned((((8'ha9) ~^ wire101) != $unsigned(wire108))))};
        end
      else
        begin
          reg113 <= $unsigned(((reg110 ?
                  wire104[(4'he):(3'h4)] : ((~&wire99) ?
                      (wire100 ? wire102 : wire107) : {(8'had), reg115})) ?
              (^~reg116) : wire105));
        end
    end
  assign wire118 = ((8'hb5) || wire101[(3'h7):(2'h3)]);
  assign wire119 = (&((^~wire109[(3'h5):(3'h4)]) ?
                       wire107[(3'h7):(3'h4)] : ((reg115 ?
                           (reg114 && wire99) : reg116[(3'h4):(2'h2)]) ~^ $signed($unsigned(wire103)))));
  always
    @(posedge clk) begin
      if ((-((8'hb4) * (~|(-{reg115})))))
        begin
          reg120 <= wire106[(4'h9):(4'h9)];
        end
      else
        begin
          reg120 <= wire105[(1'h1):(1'h0)];
          reg121 <= wire107;
          reg122 <= (8'ha2);
        end
      reg123 <= ((^reg113) > {$unsigned(reg120)});
      reg124 <= wire109;
      reg125 <= wire112[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if (wire100[(3'h4):(3'h4)])
        begin
          if ((8'h9d))
            begin
              reg126 <= (~|$signed($unsigned({$unsigned((8'hbd))})));
              reg127 <= wire112[(4'h9):(1'h0)];
            end
          else
            begin
              reg126 <= $signed({(~$signed(reg121)),
                  $signed(({reg123} ? {reg115} : $unsigned(wire109)))});
              reg127 <= wire105[(1'h1):(1'h0)];
              reg128 <= wire106;
            end
          reg129 <= ($signed(reg117) <= (~wire108));
          if ($signed(wire109[(2'h2):(2'h2)]))
            begin
              reg130 <= (((8'hb6) | (8'hbc)) ?
                  wire108[(1'h1):(1'h0)] : reg122[(3'h7):(1'h1)]);
              reg131 <= $signed((~($unsigned((reg127 ~^ (7'h42))) - $unsigned((~|wire108)))));
            end
          else
            begin
              reg130 <= (^~{wire105[(1'h1):(1'h1)], wire106[(4'he):(3'h7)]});
              reg131 <= {(&(({reg120, reg114} <<< (wire99 << wire103)) ?
                      $signed(wire101) : (^wire103[(1'h1):(1'h1)])))};
              reg132 <= {$unsigned({((wire112 ? reg127 : wire101) ?
                          $unsigned(reg123) : wire103[(2'h3):(2'h2)]),
                      {(wire119 ? (8'h9c) : wire112),
                          (wire99 ? reg127 : wire109)}}),
                  (|(reg127[(4'h8):(3'h7)] + {(wire112 ? reg114 : wire103)}))};
              reg133 <= {reg127};
            end
          reg134 <= reg116;
          reg135 <= $signed($unsigned($signed((^reg114[(3'h4):(1'h0)]))));
        end
      else
        begin
          if ((~(($signed(wire112) ?
              $signed((reg113 + wire101)) : (+$signed(reg125))) == (8'ha6))))
            begin
              reg126 <= $unsigned($signed(reg115));
              reg127 <= (wire103 ?
                  reg115 : ((^{{reg115, wire112},
                          ((7'h42) ? wire109 : wire119)}) ?
                      (((!reg124) ?
                          reg129 : $unsigned(wire100)) >= $unsigned((wire111 >> (8'hbb)))) : $unsigned(((~|wire112) ?
                          $unsigned(reg123) : $signed(reg127)))));
              reg128 <= (($signed(({wire119} ?
                  (wire106 || reg132) : $unsigned(reg121))) >= wire109[(3'h4):(2'h3)]) >> ($signed(wire108) ?
                  reg115[(1'h0):(1'h0)] : reg115));
              reg129 <= reg122;
              reg130 <= $signed(((+($signed(wire109) ?
                      reg117[(5'h11):(4'hd)] : reg126)) ?
                  reg134 : (~^reg131[(2'h3):(2'h3)])));
            end
          else
            begin
              reg126 <= reg116[(3'h5):(3'h5)];
              reg127 <= reg124[(1'h0):(1'h0)];
              reg128 <= (~reg135[(3'h6):(3'h5)]);
              reg129 <= $unsigned({reg133[(3'h6):(1'h0)],
                  ($unsigned($unsigned((7'h44))) ?
                      reg134 : ((wire109 ? wire100 : reg114) ?
                          $unsigned(wire101) : (reg127 <<< wire104)))});
            end
          reg131 <= {wire112[(3'h4):(1'h0)],
              {($unsigned(wire111) <<< (^~$signed(wire112))), wire105}};
        end
      reg136 <= {(($signed((reg115 >= (8'hab))) >>> reg132) + $unsigned(wire105)),
          (reg122[(2'h3):(1'h0)] ?
              $unsigned((|{reg132, reg121})) : $signed((-reg115)))};
    end
  assign wire137 = wire99;
  always
    @(posedge clk) begin
      reg138 <= ($unsigned((($unsigned(reg124) | $unsigned(reg134)) == (wire103[(4'h8):(3'h5)] != reg113))) ?
          (wire107 ~^ $unsigned(reg130[(1'h1):(1'h1)])) : reg125[(2'h2):(2'h2)]);
      if ($signed(reg133))
        begin
          if ((({($signed((8'h9c)) * (^~wire103)),
                  (reg136[(2'h2):(2'h2)] ?
                      $signed(wire106) : (~|reg130))} >>> wire107) ?
              $unsigned($unsigned((&(reg125 ?
                  reg122 : wire118)))) : $unsigned((^reg116[(3'h5):(3'h5)]))))
            begin
              reg139 <= $signed((($signed(wire108) ?
                      wire111[(1'h0):(1'h0)] : (8'h9c)) ?
                  (~wire119[(2'h2):(1'h1)]) : wire99));
            end
          else
            begin
              reg139 <= wire111;
            end
          if ($signed(reg116[(1'h0):(1'h0)]))
            begin
              reg140 <= ((!$signed(((reg115 ? reg124 : (8'hac)) >= {(8'hac),
                      wire109}))) ?
                  wire101 : $signed(wire101[(1'h0):(1'h0)]));
              reg141 <= wire107[(1'h1):(1'h0)];
              reg142 <= (&($signed(($unsigned(reg126) ?
                      reg126 : $unsigned((8'ha6)))) ?
                  {(^reg135)} : {(reg121[(5'h13):(4'ha)] * (reg121 > reg110)),
                      $unsigned(wire99)}));
              reg143 <= ((wire100[(2'h2):(1'h0)] ^~ ($unsigned($unsigned(reg125)) ?
                      $unsigned(((8'hbd) ? reg126 : (7'h40))) : wire106)) ?
                  ((reg133[(1'h0):(1'h0)] ? reg128 : wire100[(2'h2):(1'h0)]) ?
                      (+reg115) : ($signed($unsigned((8'hac))) - wire106)) : (~|($signed({(8'hb3)}) ~^ $signed(reg113))));
              reg144 <= reg140;
            end
          else
            begin
              reg140 <= (|wire107[(3'h4):(2'h2)]);
              reg141 <= (!(^(|wire99[(4'h9):(4'h9)])));
            end
          if ((&reg138[(1'h0):(1'h0)]))
            begin
              reg145 <= $unsigned($signed($unsigned((-$unsigned(wire100)))));
              reg146 <= wire118[(2'h3):(1'h0)];
              reg147 <= $unsigned($unsigned((reg142 >= ($signed(wire137) ?
                  reg138[(4'ha):(3'h6)] : reg113[(4'h9):(1'h1)]))));
              reg148 <= ((8'had) ?
                  reg125 : $signed($unsigned($unsigned(wire100[(2'h2):(1'h1)]))));
              reg149 <= ((($unsigned(((8'had) ?
                          reg145 : (8'hb7))) >= {(&(8'hbb))}) ?
                      reg134 : (8'hb3)) ?
                  reg142 : ($signed(($signed(reg148) > (reg110 * reg124))) | (reg140[(1'h1):(1'h0)] > (+(~|reg125)))));
            end
          else
            begin
              reg145 <= {reg126,
                  (|$signed(($signed(reg121) << $unsigned(reg129))))};
              reg146 <= (~(^~(reg145[(4'ha):(1'h0)] << ((~|reg116) ?
                  $signed(wire108) : $unsigned(wire104)))));
              reg147 <= (8'haa);
            end
          reg150 <= (((reg128 * (^reg113)) ?
                  (~|$signed((wire111 > reg143))) : reg136[(5'h12):(5'h12)]) ?
              (~^($signed((reg128 ? reg131 : wire107)) ?
                  $signed((~|reg127)) : (|((8'haf) ?
                      wire108 : wire109)))) : $signed((|((reg128 ?
                  reg127 : reg143) <= $signed(wire104)))));
        end
      else
        begin
          if ((-wire108[(1'h1):(1'h0)]))
            begin
              reg139 <= wire111[(1'h1):(1'h0)];
              reg140 <= reg120[(2'h3):(2'h3)];
            end
          else
            begin
              reg139 <= reg117[(5'h11):(2'h3)];
              reg140 <= $unsigned(reg125);
            end
          reg141 <= (+(reg133 + $signed($signed($unsigned(reg126)))));
          reg142 <= (wire111 ? $signed((|reg129)) : $unsigned(reg138));
          reg143 <= wire102[(4'hb):(3'h4)];
          reg144 <= ($signed(reg130) ? (^$signed(reg120)) : (~|(8'h9e)));
        end
      if (($signed({$unsigned((reg129 >>> reg128))}) >>> (!(!((reg128 ^ wire99) ?
          (wire137 ? wire101 : reg139) : $signed(reg134))))))
        begin
          reg151 <= {wire99[(4'h8):(3'h4)],
              (^~((-(reg142 && reg121)) ?
                  ((&reg120) & reg130[(2'h2):(1'h1)]) : (8'hb5)))};
          reg152 <= $signed((&($signed((|reg127)) ?
              (reg123[(1'h1):(1'h0)] | {(8'hab)}) : reg148)));
        end
      else
        begin
          reg151 <= {reg138,
              ($unsigned((reg113 ?
                  $signed(reg113) : reg146[(1'h0):(1'h0)])) <= (8'hbf))};
        end
      if (($signed({$signed((-wire99)),
          reg124[(1'h1):(1'h0)]}) - $signed($signed({reg146}))))
        begin
          reg153 <= (8'hb8);
        end
      else
        begin
          reg153 <= {(({(-reg150)} ^~ (((8'h9c) ^~ wire103) ?
                  wire102[(4'ha):(2'h2)] : ((8'ha5) ?
                      (8'h9d) : reg116))) >> {$signed((|wire100))})};
          reg154 <= $signed((~$signed($signed((~&wire104)))));
          reg155 <= reg131[(2'h2):(1'h1)];
          reg156 <= ((~(8'hb7)) ?
              $signed((wire137[(2'h2):(2'h2)] ?
                  ((reg130 | reg142) != (8'hbc)) : (!reg120))) : $unsigned((((-reg132) ?
                  {wire101} : $unsigned((8'hbb))) >>> reg153[(4'hc):(2'h3)])));
        end
      reg157 <= $signed(reg134);
    end
  assign wire158 = wire137[(4'ha):(3'h6)];
endmodule

module module63
#(parameter param79 = {(((((8'hbe) ? (8'haa) : (8'haa)) ? ((8'ha1) ? (8'had) : (8'hb1)) : ((8'hb2) ? (8'ha9) : (8'ha1))) ? (((8'hba) | (7'h40)) ? (&(7'h40)) : ((8'haf) != (8'ha9))) : (((7'h43) ? (8'h9c) : (8'hbd)) ? (^(8'hab)) : ((8'haf) - (8'hab)))) & ((((7'h43) & (8'hba)) ? (+(8'hbf)) : {(8'ha4)}) ? ((|(7'h40)) + ((7'h44) ? (8'hb5) : (8'hb4))) : {(8'h9d), (~^(8'hbb))}))}, 
parameter param80 = param79)
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire68;
  input wire [(2'h3):(1'h0)] wire67;
  input wire signed [(2'h3):(1'h0)] wire66;
  input wire signed [(4'h8):(1'h0)] wire65;
  input wire [(2'h3):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire71,
                 wire70,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg69,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg69 <= wire64;
    end
  assign wire70 = (((8'ha2) ? wire67[(1'h1):(1'h0)] : (8'haa)) ?
                      (~|wire68) : ($signed(((wire67 << wire65) ?
                          wire66 : (&wire66))) & wire65[(3'h4):(2'h2)]));
  assign wire71 = wire67;
  always
    @(posedge clk) begin
      reg72 <= (|(($signed({wire66, wire66}) ?
              {reg69, wire66} : $signed((~|(8'had)))) ?
          $signed($unsigned((wire64 ? wire70 : wire64))) : (^(^~((8'hb2) ?
              wire65 : wire68)))));
      reg73 <= ($unsigned({$signed((reg72 ?
              wire67 : reg72))}) && wire66[(2'h3):(1'h1)]);
      reg74 <= wire64;
      reg75 <= reg72;
    end
  assign wire76 = reg73[(2'h3):(2'h2)];
  assign wire77 = $signed($signed($signed(wire70)));
  assign wire78 = wire67;
endmodule
