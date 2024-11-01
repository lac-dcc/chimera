module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire63;
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  assign y = {wire38,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire63,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire4 = (({(wire0[(3'h5):(3'h5)] ?
                         $unsigned(wire2) : $unsigned(wire0)),
                     (~^(+wire1))} * ((|(wire0 ? (8'haf) : (8'hab))) ?
                     (~^wire1[(3'h5):(2'h2)]) : {(~|wire1),
                         $unsigned(wire2)})) >> ((wire2[(4'hc):(2'h3)] ?
                     $signed((8'hb7)) : (8'hbd)) ~^ wire0));
  assign wire5 = $unsigned(((-$unsigned({wire1, wire3})) ?
                     {(8'hb8)} : $signed(wire1[(5'h13):(5'h13)])));
  assign wire6 = (wire1[(4'hb):(4'h9)] ?
                     ({wire4} <<< $unsigned((~&(wire4 ?
                         wire5 : wire5)))) : (((wire1[(2'h3):(1'h0)] ?
                             {wire3} : (-wire1)) ?
                         wire0 : $unsigned((^wire2))) * (|$unsigned((wire4 - wire1)))));
  assign wire7 = (^(~^wire6[(4'hc):(2'h3)]));
  assign wire8 = (((~|wire6) << (^~($signed(wire5) ? wire2 : {wire3, wire3}))) ?
                     $unsigned((^{(wire2 ^ wire0)})) : wire5);
  assign wire9 = {((+(~$signed(wire8))) << wire1),
                     ($signed($unsigned((wire3 ~^ wire1))) ?
                         ((-(wire7 - wire6)) << (wire8 ^~ wire2[(4'hc):(2'h3)])) : ((~&$signed(wire0)) ?
                             wire8[(4'h8):(4'h8)] : ((wire7 ? wire5 : wire1) ?
                                 (wire5 - wire3) : wire7[(4'h8):(3'h6)])))};
  assign wire10 = wire2;
  module11 #() modinst39 (.wire15(wire2), .wire13(wire6), .wire12(wire8), .wire14(wire1), .y(wire38), .clk(clk), .wire16(wire9));
  always
    @(posedge clk) begin
      reg40 <= (~|wire7);
      reg41 <= (wire0[(2'h3):(1'h1)] ?
          ($unsigned(((wire6 != (8'hbd)) | reg40)) - (~|$unsigned((wire38 != wire38)))) : wire4);
      reg42 <= reg40;
      reg43 <= ($signed($unsigned((|(wire3 ? reg42 : wire10)))) ?
          ({wire0, (+$signed(wire0))} ?
              ((|(wire5 >= wire8)) ?
                  wire9 : (wire1[(4'ha):(4'h8)] ?
                      {(8'ha7), wire7} : {wire7})) : (^~(wire3 ?
                  {reg42} : wire4[(2'h3):(2'h3)]))) : (-wire8));
    end
  module44 #() modinst64 (wire63, clk, wire0, wire10, wire5, reg41, reg43);
endmodule

module module44
#(parameter param62 = ({{((^(8'h9c)) ? (&(8'hbc)) : ((8'hb8) ? (8'hba) : (7'h43))), (8'hb9)}} ? ((({(8'ha1), (8'hb0)} ? ((8'hb9) ^ (7'h40)) : ((8'haf) | (8'ha2))) - (!{(8'ha3), (8'haa)})) <= ((^~((8'hac) ? (8'hbf) : (8'had))) <= (((8'ha1) ? (8'hbc) : (7'h43)) ? ((7'h43) ? (8'hb5) : (7'h40)) : ((8'hb9) ? (8'ha8) : (8'hbb))))) : (~&((((8'hb6) ? (8'h9f) : (8'hb8)) ? ((8'hb2) ? (7'h40) : (8'hba)) : ((8'hb6) ? (7'h42) : (8'hbf))) ? (~{(8'hbf)}) : ({(7'h44), (8'haa)} ? {(8'hb3), (8'h9d)} : ((8'hab) ? (8'ha8) : (8'ha5)))))))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire48;
  input wire signed [(2'h2):(1'h0)] wire47;
  input wire signed [(5'h12):(1'h0)] wire46;
  input wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire50;
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire50,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire50 = (!$unsigned($signed($unsigned(wire48[(4'hb):(3'h7)]))));
  always
    @(posedge clk) begin
      if (wire48[(4'hb):(1'h0)])
        begin
          reg51 <= (|$unsigned(((|(wire46 ? (8'had) : wire45)) ^ ((wire45 ?
              wire47 : wire46) != (wire46 ? wire45 : (8'hbd))))));
          if (($signed(reg51) && $unsigned($signed(((!(8'ha3)) ~^ wire48[(2'h3):(2'h2)])))))
            begin
              reg52 <= wire50[(1'h1):(1'h0)];
            end
          else
            begin
              reg52 <= $signed((~&$signed($signed((8'hb9)))));
              reg53 <= wire49;
              reg54 <= (^~($signed(wire47[(2'h2):(1'h0)]) ?
                  (^$unsigned($signed(wire45))) : $unsigned(($signed(wire45) ?
                      (8'hb2) : ((8'ha5) ? wire47 : (8'hb0))))));
              reg55 <= ((wire50 ?
                  {$signed({wire49})} : $unsigned({((8'h9d) - reg54),
                      (-wire45)})) ^ $signed((~^$signed($unsigned((8'ha8))))));
              reg56 <= (($signed(((wire48 && wire50) ?
                          wire46[(4'hb):(3'h5)] : $unsigned(wire49))) ?
                      ({$signed(reg55), (wire48 ? wire49 : wire45)} ?
                          wire50[(1'h0):(1'h0)] : reg54) : (reg52 ~^ $signed(reg52[(4'hb):(3'h6)]))) ?
                  wire46[(4'h9):(4'h9)] : ($signed(((wire47 ?
                      reg53 : reg52) && (&wire48))) >= wire49[(4'hb):(3'h7)]));
            end
        end
      else
        begin
          reg51 <= ((~$unsigned((8'had))) ?
              (~|((wire46 * (reg54 > wire50)) ?
                  $signed((~&wire49)) : $unsigned((wire49 == reg54)))) : $signed(wire46[(4'hd):(3'h6)]));
          reg52 <= reg55;
          reg53 <= $signed({reg52[(5'h13):(5'h10)]});
        end
      reg57 <= wire45[(1'h1):(1'h1)];
      reg58 <= {reg52[(3'h5):(2'h2)], $signed(reg55)};
      reg59 <= (~^(~^reg56[(4'hd):(3'h6)]));
    end
  assign wire60 = $signed({(~$signed(wire45)), $signed(reg59)});
  assign wire61 = (-$signed((+reg55)));
endmodule

module module11
#(parameter param37 = ((((~|((7'h44) && (8'hb2))) ? (((8'hb0) <<< (7'h44)) ? ((8'ha3) ? (8'hb9) : (8'hb2)) : ((8'had) >>> (8'ha1))) : (!((8'hab) ? (8'hb1) : (8'hbb)))) ? {(+((8'hba) ? (8'hb2) : (8'h9c))), {{(8'ha4), (7'h41)}, ((7'h41) ^~ (8'hbc))}} : ((((8'hb0) == (8'hb7)) & {(8'ha6)}) >> (((8'hbd) ? (8'hb7) : (8'ha2)) ? {(8'hb2), (8'hb9)} : (~|(8'hba))))) ? ((((~&(8'ha5)) && (+(8'hb5))) ? {((8'had) ? (8'hb3) : (8'hac))} : ({(8'had), (8'h9c)} ? ((8'hbb) == (8'hbe)) : ((8'hb2) ? (8'hac) : (8'hb4)))) ? ({((8'hbd) ? (8'h9e) : (8'ha3)), ((8'ha6) ? (8'hbc) : (7'h42))} > ((-(7'h42)) ? ((8'hb4) ? (8'hb7) : (8'ha8)) : ((8'h9c) > (7'h44)))) : ({((8'hbb) != (8'hb3))} ? (|{(8'hbb)}) : {((7'h40) ? (8'h9f) : (7'h43)), (&(8'hb7))})) : ((~&(((8'ha7) ? (8'ha6) : (8'hb9)) ^ (~^(7'h43)))) >>> (~^(+((8'hac) ? (8'hbe) : (8'ha8)))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire [(2'h2):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire17;
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  assign y = {wire36,
                 wire28,
                 wire17,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 (1'h0)};
  assign wire17 = ((wire15 >>> (8'hb7)) ~^ ((&$unsigned(wire16)) ?
                      (($unsigned((8'hb1)) ?
                              $signed((8'haa)) : ((8'hac) - wire14)) ?
                          (|wire12[(1'h0):(1'h0)]) : ((wire15 ?
                                  wire13 : wire14) ?
                              (wire16 - (8'hb0)) : (wire14 ?
                                  wire13 : wire14))) : ($unsigned((wire14 <= wire16)) | $signed(wire16[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ((($signed(wire15) ?
          $signed({(wire13 ?
                  wire13 : wire14)}) : {((wire15 & wire13) == wire14[(2'h2):(1'h0)])}) > $signed((((wire16 ?
          wire17 : wire13) << wire17) >= (~(+wire17))))))
        begin
          reg18 <= wire16[(1'h1):(1'h0)];
          reg19 <= reg18;
          reg20 <= (&$unsigned($unsigned((wire17[(4'h8):(1'h0)] ?
              $unsigned(reg18) : $signed(wire17)))));
          reg21 <= ($unsigned((~reg20[(1'h1):(1'h0)])) == wire12);
          if ((~^(reg21 >= (8'ha2))))
            begin
              reg22 <= (|(&$signed({((8'ha8) | wire13), $signed(wire16)})));
              reg23 <= ($unsigned(wire16[(2'h2):(1'h0)]) != $unsigned(((wire17[(3'h4):(1'h1)] ?
                      $unsigned(wire15) : (reg22 ? wire16 : wire16)) ?
                  $unsigned((reg20 ? reg21 : wire13)) : (8'hba))));
              reg24 <= ($unsigned((wire17 * $unsigned((-wire12)))) ?
                  (reg22[(4'hb):(3'h7)] ?
                      wire14 : $unsigned($signed(wire13))) : (^$signed(reg22[(4'hb):(1'h1)])));
            end
          else
            begin
              reg22 <= $signed($signed((~|(reg21[(4'h9):(2'h2)] ~^ $unsigned(reg19)))));
              reg23 <= (&reg24[(2'h2):(2'h2)]);
              reg24 <= (((+$signed($signed(wire13))) ~^ $unsigned((wire15[(1'h1):(1'h1)] <<< (wire14 ?
                  reg19 : wire12)))) << reg21);
              reg25 <= reg22;
              reg26 <= ($unsigned((+{(wire16 ~^ (8'ha8))})) ?
                  reg22[(4'ha):(4'h9)] : $signed($signed($signed((~^(8'hbf))))));
            end
        end
      else
        begin
          reg18 <= reg18;
          reg19 <= (reg26[(4'ha):(2'h2)] - ((wire13[(3'h5):(2'h3)] + $signed({(8'hb2)})) < wire15));
          reg20 <= ({(~|{(~&wire14), {(8'ha9)}}),
                  $unsigned($signed((wire17 ? reg22 : wire17)))} ?
              (-$unsigned(reg26[(4'hb):(1'h0)])) : (reg19[(5'h10):(5'h10)] + $signed(reg26)));
          if ($unsigned((+(~^$signed($unsigned(reg24))))))
            begin
              reg21 <= (reg25[(5'h12):(5'h10)] ?
                  $unsigned($signed(((-wire13) && (reg26 & wire14)))) : (~&(~|$unsigned((wire12 == wire15)))));
              reg22 <= reg24[(2'h2):(2'h2)];
              reg23 <= (8'ha2);
              reg24 <= reg24[(2'h2):(1'h0)];
              reg25 <= $unsigned((($unsigned((reg25 + (8'had))) ?
                      $signed({wire15, reg20}) : (+$unsigned(reg18))) ?
                  ($unsigned((wire16 ? wire14 : reg21)) << ((wire15 ?
                      wire15 : reg21) < (^~reg18))) : $signed({{(8'ha2)}})));
            end
          else
            begin
              reg21 <= $signed(($unsigned(reg25[(4'hf):(4'hc)]) << {wire12}));
            end
        end
      reg27 <= wire16[(1'h0):(1'h0)];
    end
  assign wire28 = ($unsigned($unsigned(($signed(reg23) ?
                          $signed(reg26) : $unsigned(reg22)))) ?
                      wire13 : (~&$signed($unsigned(reg18))));
  always
    @(posedge clk) begin
      if (($signed({$signed(wire16)}) || (8'h9c)))
        begin
          if ((reg26 == ((!(~^(reg19 ? reg18 : reg19))) ?
              $unsigned(($unsigned(wire15) - wire15)) : reg19)))
            begin
              reg29 <= {$signed($signed(reg23))};
              reg30 <= wire17;
              reg31 <= (wire17[(2'h3):(2'h2)] ?
                  (reg22[(4'hd):(2'h2)] == ($signed({wire15,
                      wire13}) ~^ $unsigned((~&(8'hb8))))) : $unsigned($signed({$signed(wire17)})));
              reg32 <= {reg25[(4'hb):(4'hb)],
                  (!((^~(reg30 - reg26)) << $unsigned($signed(reg18))))};
              reg33 <= (reg32[(3'h5):(1'h1)] ^~ reg30[(2'h2):(1'h0)]);
            end
          else
            begin
              reg29 <= ((~(($unsigned(wire15) ?
                      (~^reg23) : (+reg20)) * (^~$unsigned((8'ha1))))) ?
                  $unsigned({(^$signed((7'h43)))}) : $unsigned((&(reg22 ?
                      reg32[(4'h8):(3'h6)] : (reg30 ? wire12 : reg21)))));
              reg30 <= (reg32[(4'ha):(2'h2)] >= (8'haa));
            end
          reg34 <= (reg24[(1'h1):(1'h0)] ?
              (~^({(wire15 ? reg23 : reg22), $signed((8'hb2))} ?
                  (8'ha8) : reg23)) : (wire16[(1'h0):(1'h0)] ^~ (8'hbf)));
          reg35 <= ($unsigned($signed(reg34)) ?
              {reg32[(3'h6):(1'h0)]} : (($unsigned((&(8'hb5))) ?
                  reg25 : ({(8'hb4)} == {wire15,
                      reg24})) + $signed(reg20[(3'h7):(1'h1)])));
        end
      else
        begin
          reg29 <= wire17[(3'h5):(2'h2)];
          if ($unsigned((^$signed((reg23 ? wire12[(2'h3):(1'h1)] : (8'hb4))))))
            begin
              reg30 <= ((wire15 ?
                  ($unsigned(reg20[(4'ha):(3'h4)]) ?
                      (reg31 < (reg25 ?
                          (8'hbe) : reg31)) : (reg25[(5'h14):(4'h8)] ?
                          $unsigned(reg26) : $unsigned(wire14))) : {$signed((wire14 ?
                          reg19 : reg35)),
                      reg24}) * {wire12[(1'h0):(1'h0)]});
              reg31 <= {reg18[(1'h0):(1'h0)], $unsigned((~^reg21))};
            end
          else
            begin
              reg30 <= (~$signed(((~(reg24 ~^ (8'hb1))) || wire28)));
              reg31 <= wire12;
              reg32 <= (8'hbd);
            end
        end
    end
  assign wire36 = wire12[(2'h2):(1'h1)];
endmodule
