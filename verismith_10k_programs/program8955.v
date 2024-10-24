module top
#(parameter param58 = ((((8'ha8) ? (((8'h9e) ? (8'hb9) : (8'ha2)) || (^~(8'hbe))) : (|(~&(8'hb5)))) ? (&((~&(8'hb3)) == ((8'haf) ? (8'hbb) : (7'h42)))) : {(((8'hb3) != (8'ha6)) ? (8'ha3) : (~(8'hac))), (((8'hbc) << (8'hbd)) ? ((8'ha7) ? (8'hb4) : (8'hb7)) : ((7'h43) >>> (8'h9e)))}) ? (((((8'ha2) ? (8'ha3) : (8'hae)) ? (|(8'ha3)) : ((8'hb9) ? (8'hae) : (8'hba))) << (-(|(7'h42)))) ? (~&(~^(8'hbd))) : {(^{(8'hba)}), {((8'ha8) ? (8'ha2) : (8'hbb)), (~^(8'h9e))}}) : {((8'hba) ? (((8'ha6) ? (8'haf) : (8'hbd)) ? (~(8'ha3)) : (|(8'ha0))) : ({(8'hb0), (8'hac)} != ((8'ha9) & (7'h41)))), {{((8'h9f) - (8'hac))}}}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire33;
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire4,
                 wire33,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire4 = wire3;
  module5 #() modinst34 (wire33, clk, wire1, wire0, wire3, wire4, wire2);
  assign wire35 = (-(8'ha8));
  assign wire36 = (($unsigned((((8'hb9) ?
                      wire33 : wire4) * $signed(wire4))) < {($unsigned(wire4) ?
                          {(7'h43),
                              wire35} : wire33)}) == ((wire33 | $signed($unsigned(wire2))) ?
                      $unsigned(((wire0 + wire4) ?
                          (!wire1) : ((7'h44) || wire2))) : $signed(((wire0 ?
                              wire2 : wire4) ?
                          wire3 : ((8'hb1) > wire3)))));
  assign wire37 = (^~(($signed($unsigned(wire35)) ?
                      {(wire36 ?
                              wire35 : wire2)} : $unsigned(wire3)) >>> $unsigned($unsigned(wire0))));
  assign wire38 = wire36;
  assign wire39 = ((wire35[(3'h6):(1'h1)] | wire4[(3'h4):(1'h0)]) < (-{(wire2 | wire38),
                      ($unsigned(wire3) ? wire38 : (wire2 ? wire36 : wire2))}));
  assign wire40 = (^~{wire33});
  always
    @(posedge clk) begin
      if ((wire1 ?
          $signed(($signed((wire4 ? wire3 : (8'ha2))) * wire0)) : wire1))
        begin
          reg41 <= ($unsigned(wire0) ^~ (+wire36));
          reg42 <= (-(&(~^({wire39} & ((8'haa) ~^ wire37)))));
          if ($unsigned(wire35[(3'h5):(2'h3)]))
            begin
              reg43 <= wire38;
            end
          else
            begin
              reg43 <= (($unsigned((~&wire37[(4'ha):(3'h7)])) ^ ($signed(wire4[(3'h5):(3'h5)]) ?
                      $unsigned((wire37 < reg42)) : (~((8'h9c) << wire2)))) ?
                  $unsigned((!wire39[(2'h3):(2'h3)])) : (&(+{(wire0 ?
                          wire4 : reg43),
                      $signed((8'hb3))})));
              reg44 <= $signed($unsigned((~^wire40[(3'h4):(2'h3)])));
              reg45 <= $unsigned(wire1);
              reg46 <= $unsigned((^wire39));
            end
          reg47 <= (~|(~|((!reg41) ? (~&wire36[(3'h5):(1'h0)]) : (-(-wire2)))));
          reg48 <= wire33;
        end
      else
        begin
          if ($signed((8'hb0)))
            begin
              reg41 <= wire3[(4'h8):(3'h6)];
              reg42 <= $signed(reg44[(4'hf):(3'h6)]);
            end
          else
            begin
              reg41 <= $unsigned(((((wire38 ^ wire0) ?
                      reg46 : $unsigned(reg48)) ?
                  {wire4[(4'h8):(2'h2)],
                      $unsigned(wire35)} : $signed(wire37[(3'h5):(2'h2)])) << wire38));
            end
          reg43 <= ((($signed(reg48[(2'h3):(2'h3)]) ?
                  wire40 : (wire40[(4'h8):(3'h7)] < $signed(wire4))) ?
              ($signed($signed(reg41)) ?
                  (wire39 | ((8'haa) == reg45)) : (~&$unsigned(wire0))) : {{wire38,
                      $signed(wire40)}}) || ((8'h9d) ?
              reg46 : (^(!(^~wire0)))));
          reg44 <= $unsigned((!(({reg47,
              wire40} ~^ $unsigned(reg45)) << {{reg48}})));
        end
      reg49 <= reg48;
      if ((8'h9c))
        begin
          reg50 <= ((wire37 ?
                  {$signed((wire39 && wire0))} : wire39[(4'h8):(3'h7)]) ?
              (&reg48[(4'h8):(1'h1)]) : wire33[(3'h5):(2'h2)]);
          reg51 <= (+$unsigned((wire37 ?
              $signed(reg47[(3'h5):(2'h2)]) : (-(reg47 <= reg49)))));
          reg52 <= $signed((($unsigned($unsigned((8'hb0))) ?
                  {(wire0 ? wire37 : wire38), wire36} : $unsigned({wire38})) ?
              (!$unsigned((wire39 <<< reg44))) : ((reg43 ?
                      wire1 : (wire2 ~^ reg43)) ?
                  (~&(~(7'h44))) : (^~reg45))));
          reg53 <= reg50[(4'hb):(2'h2)];
        end
      else
        begin
          reg50 <= (wire3[(4'ha):(3'h5)] ?
              reg42 : {($signed($unsigned(wire36)) != (^(wire1 <<< (8'h9f)))),
                  (|(~|((8'ha0) - (8'hae))))});
        end
      reg54 <= (^wire39);
    end
  assign wire55 = {($unsigned($signed(wire36[(3'h4):(2'h2)])) ?
                          {reg47} : wire3[(3'h7):(2'h3)]),
                      (+{$signed((wire38 ? reg42 : (8'h9e))),
                          ((~^wire37) + $signed(wire1))})};
  assign wire56 = wire33[(4'hb):(3'h4)];
  assign wire57 = (($signed(reg48[(3'h6):(1'h1)]) ?
                          ({$signed(wire37)} ?
                              (^~$signed(reg51)) : reg44) : (((reg51 + reg43) ?
                              $signed(reg54) : wire55[(1'h1):(1'h0)]) < $unsigned($unsigned(wire55)))) ?
                      $signed(((~|reg44) * $signed((~^reg53)))) : (~$unsigned((!(wire37 >= wire35)))));
endmodule

module module5
#(parameter param32 = ({{(((8'ha9) == (8'hbf)) && ((8'hab) | (8'haa)))}, (&({(8'hac)} & ((8'ha3) != (8'h9d))))} >= (&{(((8'hb6) && (8'h9d)) <<< (~|(8'hb1)))})))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(3'h5):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire30;
  assign y = {wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire30,
                 (1'h0)};
  assign wire11 = wire7[(2'h2):(1'h1)];
  assign wire12 = wire6[(3'h5):(3'h4)];
  assign wire13 = $signed(({wire8, wire7[(3'h4):(3'h4)]} == $signed(wire12)));
  assign wire14 = ((|(&((wire10 ? wire9 : wire9) ?
                      wire6[(4'hb):(4'hb)] : $signed(wire7)))) <<< (({$signed(wire6)} ^~ wire12) * $signed((wire10[(3'h6):(2'h2)] >= (8'hb3)))));
  assign wire15 = $unsigned({$signed(wire10[(3'h7):(1'h1)])});
  assign wire16 = ($unsigned($signed(((~&wire15) ?
                      (+wire9) : wire7[(1'h0):(1'h0)]))) * (wire10 ^ (~^wire15[(4'hb):(4'ha)])));
  assign wire17 = wire7[(1'h0):(1'h0)];
  module18 #() modinst31 (.wire21(wire11), .wire20(wire13), .y(wire30), .wire23(wire9), .clk(clk), .wire19(wire17), .wire22(wire12));
endmodule

module module18
#(parameter param28 = (+(~^((((8'hb4) ? (8'h9f) : (8'ha3)) ? {(8'hb6)} : ((8'haf) ? (8'ha3) : (8'hb7))) ? (^~((8'hb5) || (8'ha2))) : ({(8'hab), (8'h9d)} && {(8'hbc), (8'ha6)})))), 
parameter param29 = {(((+(param28 > param28)) ? (((8'h9c) | (8'ha2)) ? param28 : param28) : {(+param28)}) ^ ({param28, (param28 ^ (8'hb1))} <= ((8'ha6) ? (param28 ? param28 : param28) : (~param28))))})
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire22;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  assign y = {wire27, wire26, wire25, wire24, (1'h0)};
  assign wire24 = $unsigned((8'hae));
  assign wire25 = $signed($signed(wire22[(5'h12):(4'ha)]));
  assign wire26 = ($unsigned((^(wire23 >= (8'h9f)))) ?
                      ((&((8'ha9) >>> wire19[(2'h2):(1'h1)])) ?
                          ({(wire20 >> wire25)} > $signed((wire25 ?
                              wire24 : wire21))) : (((wire24 ?
                                  (8'hbd) : wire25) ?
                              wire19[(2'h2):(1'h0)] : $signed(wire23)) > $signed(wire19))) : (&wire25));
  assign wire27 = wire21[(1'h1):(1'h1)];
endmodule
