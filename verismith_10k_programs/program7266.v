module top
#(parameter param45 = {(8'ha6), {{{(^(8'hab)), {(8'hbd)}}, {((8'haa) ~^ (7'h42))}}}}, 
parameter param46 = ((8'hb3) ? param45 : ({param45} << {param45, (param45 & {(8'hbe)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h230):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire25,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = $unsigned(wire3[(2'h3):(1'h1)]);
  assign wire5 = (wire1[(4'hf):(4'hb)] ?
                     ({wire4[(3'h4):(2'h3)],
                         (|wire3[(4'he):(3'h6)])} != $unsigned(($unsigned(wire0) ?
                         (8'hae) : (wire3 || wire0)))) : wire0[(2'h2):(1'h0)]);
  assign wire6 = wire3[(3'h6):(2'h3)];
  assign wire7 = {wire3};
  assign wire8 = ((~^$unsigned((~|$signed(wire2)))) << wire2);
  assign wire9 = wire7;
  assign wire10 = wire2[(4'hd):(1'h1)];
  assign wire11 = $signed(wire10[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ((!$unsigned((~^wire11))))
        begin
          reg12 <= (($unsigned({{wire8, (8'h9c)}}) & {wire5,
              wire11[(4'h8):(3'h5)]}) >= (&{{$unsigned(wire9),
                  wire8[(5'h13):(1'h0)]}}));
          reg13 <= {(8'ha4)};
          if (wire2)
            begin
              reg14 <= ($signed((~&($unsigned(wire6) <= wire7[(4'ha):(3'h7)]))) || wire10);
              reg15 <= {(((8'hbf) ? ($unsigned(wire9) <<< {(8'ha0)}) : wire7) ?
                      reg13 : (wire5 ^ $signed(wire9[(4'h8):(2'h3)]))),
                  {(wire3 >>> wire4)}};
              reg16 <= {$signed(({(wire4 ? wire10 : wire7)} * (&(~(7'h42))))),
                  wire6};
              reg17 <= (~|reg14[(1'h0):(1'h0)]);
              reg18 <= wire4;
            end
          else
            begin
              reg14 <= ($signed((reg14[(2'h2):(2'h2)] > (^~$unsigned((7'h41))))) >> ((8'hbd) | {wire10}));
              reg15 <= ((wire5 << (&$unsigned((wire0 ? reg15 : wire9)))) ?
                  ($signed(($signed(wire0) << (!wire0))) ?
                      (reg18[(3'h4):(3'h4)] | reg17) : (^~$signed($signed(wire3)))) : $signed(wire3[(4'ha):(1'h0)]));
              reg16 <= $unsigned(({((wire3 && reg18) != {wire4, wire0})} ?
                  (reg14[(1'h1):(1'h0)] ?
                      (wire2[(3'h4):(3'h4)] && (~^wire3)) : {$signed(reg16)}) : {(reg12 ?
                          wire7 : (^wire1))}));
              reg17 <= $unsigned($unsigned(wire1));
              reg18 <= {(+$unsigned((^~$signed(reg17))))};
            end
          if (({$signed(((wire2 ? (8'ha6) : wire5) && (reg16 ?
                      wire9 : wire10)))} ?
              (~|wire7) : $signed(wire1)))
            begin
              reg19 <= wire5[(3'h6):(2'h2)];
              reg20 <= $unsigned($signed(wire1[(4'h9):(4'h8)]));
              reg21 <= reg15;
              reg22 <= (!{wire9[(1'h1):(1'h0)], reg12});
              reg23 <= (8'hb3);
            end
          else
            begin
              reg19 <= wire2[(3'h7):(1'h1)];
              reg20 <= (wire1 ?
                  (-(reg17 <<< (-$signed(reg17)))) : (wire4[(2'h3):(2'h3)] ?
                      (-(~reg20)) : (-wire0)));
              reg21 <= wire0;
              reg22 <= $unsigned((&reg17));
            end
          reg24 <= reg14[(1'h0):(1'h0)];
        end
      else
        begin
          if ((^($unsigned({(wire3 ?
                  reg13 : (8'hbf))}) && $signed($signed((8'ha4))))))
            begin
              reg12 <= ((({(reg23 ? reg19 : (8'hbe))} ?
                          ($signed((8'ha9)) || (^wire4)) : reg18[(1'h1):(1'h0)]) ?
                      $signed($unsigned((wire0 ? reg23 : wire5))) : reg12) ?
                  (($unsigned((reg13 ~^ wire9)) ?
                      reg22 : wire5) && wire5[(3'h6):(2'h2)]) : (wire0[(2'h3):(2'h2)] ?
                      $unsigned({(reg14 ? wire4 : wire1),
                          (^~(8'ha9))}) : ({reg20[(2'h2):(1'h1)],
                          (wire11 ? (8'hb3) : reg18)} > (!(reg15 <= wire1)))));
            end
          else
            begin
              reg12 <= $signed((~|(|((wire5 ?
                  reg20 : reg24) << $unsigned(wire0)))));
              reg13 <= $unsigned(((8'hbc) ?
                  $signed($signed(reg16[(1'h0):(1'h0)])) : $unsigned(((~(7'h40)) ~^ (-reg18)))));
              reg14 <= wire0[(3'h4):(2'h3)];
              reg15 <= {(reg15 != $signed((+$unsigned(wire7)))),
                  $signed(($signed((+(8'hb1))) ?
                      $signed((wire7 << reg20)) : (reg24 ?
                          (wire5 ? wire6 : reg16) : $unsigned(wire2))))};
              reg16 <= (-wire4);
            end
          reg17 <= (&(&reg18));
          reg18 <= $unsigned((~&reg19));
          if ((($unsigned($unsigned((wire2 ? reg19 : reg21))) ?
                  (({reg18} ? reg19 : (-wire1)) ?
                      ((wire5 > wire5) ?
                          (-reg12) : reg21[(3'h5):(2'h3)]) : (&reg18[(5'h12):(4'h8)])) : (^wire2[(4'hd):(4'ha)])) ?
              {$signed(({wire11} - (reg21 ? reg17 : reg20))),
                  (((reg16 >> wire11) ? {reg24, (8'haa)} : (|reg21)) ?
                      (8'ha9) : ((wire3 + reg20) ^~ {reg16}))} : (~{((wire0 << (8'hbd)) ?
                      $signed(wire10) : (wire7 ? wire9 : wire6)),
                  $unsigned((-wire4))})))
            begin
              reg19 <= ({reg19[(3'h6):(2'h2)],
                      $unsigned($unsigned(reg17[(1'h1):(1'h0)]))} ?
                  (~&(($unsigned((8'hbd)) ?
                          reg12[(3'h4):(1'h0)] : (reg18 || reg18)) ?
                      (~$unsigned(wire10)) : (|$signed(wire4)))) : $signed({(reg22[(3'h5):(1'h0)] ?
                          (8'ha8) : (reg13 ? wire3 : reg12)),
                      $unsigned(reg14)}));
              reg20 <= reg20;
              reg21 <= reg20;
            end
          else
            begin
              reg19 <= ($signed($unsigned(reg16[(1'h0):(1'h0)])) > reg14[(1'h1):(1'h1)]);
              reg20 <= (~^wire2[(3'h5):(2'h3)]);
              reg21 <= (~&$signed((($unsigned((8'h9d)) ?
                  $unsigned(reg14) : $unsigned(wire10)) >> $signed(wire6))));
            end
          reg22 <= (wire5[(3'h6):(1'h0)] && $unsigned(wire10[(3'h4):(3'h4)]));
        end
    end
  assign wire25 = (&wire2);
  always
    @(posedge clk) begin
      if (reg24[(5'h12):(4'h8)])
        begin
          if (wire4[(2'h2):(2'h2)])
            begin
              reg26 <= wire6[(3'h6):(2'h2)];
              reg27 <= ($unsigned(((wire0 < reg20) > reg19[(3'h6):(1'h0)])) ?
                  {$signed((reg24 ?
                          (~|(8'ha5)) : (wire4 ?
                              wire2 : wire3)))} : reg13[(4'hf):(3'h4)]);
              reg28 <= reg21[(1'h0):(1'h0)];
              reg29 <= $signed((8'hbb));
            end
          else
            begin
              reg26 <= wire0;
            end
          reg30 <= wire3[(4'h9):(2'h2)];
          if ((~|reg28))
            begin
              reg31 <= ((reg28[(4'h8):(3'h7)] == $signed(wire5)) * ((8'hb3) ?
                  {wire8[(5'h13):(2'h2)]} : ((8'ha7) ?
                      (((8'hb7) ?
                          reg17 : wire6) < $signed(reg16)) : $signed(reg21))));
              reg32 <= (&$signed($signed($signed({reg13}))));
              reg33 <= reg19[(1'h1):(1'h1)];
            end
          else
            begin
              reg31 <= reg31;
            end
        end
      else
        begin
          reg26 <= ({{({wire8, reg12} ~^ (reg24 ? reg24 : wire9))},
                  (^~$signed(wire11))} ?
              reg26 : (^reg29));
        end
      reg34 <= reg28[(4'h8):(1'h0)];
      reg35 <= (|$signed((!reg24[(4'hb):(4'h8)])));
    end
  assign wire36 = reg32[(5'h12):(4'hf)];
  assign wire37 = $signed(((~^reg32[(5'h10):(3'h5)]) <= wire4[(3'h4):(3'h4)]));
  assign wire38 = (reg21[(5'h14):(3'h4)] ?
                      reg33[(3'h6):(2'h3)] : (~^{(-(reg20 <<< (8'hbd)))}));
  assign wire39 = wire7[(4'hf):(4'he)];
  assign wire40 = ($signed(wire38) | ($signed($unsigned($unsigned(wire5))) ?
                      $unsigned((8'had)) : (^~(8'h9f))));
  assign wire41 = {wire38};
  assign wire42 = wire6[(3'h6):(1'h0)];
  assign wire43 = ($unsigned(($unsigned($signed(wire9)) ?
                      ($signed(reg18) ?
                          $unsigned(wire3) : $unsigned(reg26)) : ($unsigned(wire10) ?
                          (reg31 ? (8'haa) : reg32) : ((8'hb3) ?
                              wire4 : wire4)))) - $signed((&(^~reg31))));
  assign wire44 = reg29;
endmodule
