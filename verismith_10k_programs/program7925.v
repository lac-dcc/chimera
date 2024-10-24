module top
#(parameter param196 = {(|{(7'h42)}), (((((8'ha7) ? (8'ha9) : (8'h9c)) ^ ((8'hb6) ? (8'hb8) : (7'h42))) ? {((8'hb5) >= (8'ha0))} : ((&(8'h9c)) ? ((8'hac) ~^ (8'hb6)) : ((8'hb1) ? (8'hbb) : (8'ha5)))) ? (((-(8'h9e)) != ((8'ha0) ? (8'hb6) : (7'h40))) | (~^((8'hbc) ? (8'hb8) : (8'hb6)))) : (^((!(8'h9d)) == ((8'ha8) ? (8'hbf) : (8'hb6)))))}, 
parameter param197 = {(param196 ^~ {({param196} ? (-param196) : param196)}), (param196 || {{((7'h44) ? param196 : param196)}})})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire194;
  wire [(4'hf):(1'h0)] wire193;
  wire [(5'h13):(1'h0)] wire192;
  wire [(4'hb):(1'h0)] wire185;
  wire [(2'h3):(1'h0)] wire184;
  wire signed [(4'he):(1'h0)] wire183;
  wire [(2'h3):(1'h0)] wire182;
  wire [(2'h3):(1'h0)] wire181;
  wire signed [(4'h9):(1'h0)] wire180;
  wire signed [(3'h5):(1'h0)] wire179;
  wire [(4'h9):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire177;
  reg [(3'h5):(1'h0)] reg191 = (1'h0);
  reg signed [(4'he):(1'h0)] reg190 = (1'h0);
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg186 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire31,
                 wire177,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire1);
      if ((~&{(+$signed((wire2 | wire4))),
          ((~^$unsigned(wire4)) ?
              (~((8'hae) <= (8'hbe))) : wire2[(1'h1):(1'h1)])}))
        begin
          if (((+((~^(wire0 ^ wire0)) ? (|((8'ha6) ^ wire2)) : wire0)) ?
              ($unsigned((wire3[(1'h0):(1'h0)] ?
                  $unsigned(wire4) : wire4[(4'h9):(1'h1)])) >= $signed(wire1[(4'hc):(2'h2)])) : ((^($signed(wire3) ?
                  (~^(8'hb6)) : (wire2 ^~ wire1))) == wire0)))
            begin
              reg6 <= ((wire0[(4'hd):(3'h4)] >= $signed({(wire1 ?
                          wire3 : wire1)})) ?
                  ((~|(wire0 ?
                      (~^wire3) : wire1)) || $unsigned($unsigned(wire0))) : (($signed($unsigned(wire4)) ?
                      ((wire4 | (8'hbf)) ^ wire3) : wire1[(2'h2):(1'h1)]) << (((wire0 ?
                          wire4 : wire1) ?
                      wire4 : (wire2 ?
                          (8'hac) : wire2)) ~^ {$unsigned((8'hbd))})));
              reg7 <= ($unsigned({(8'ha8)}) & ((wire0[(1'h0):(1'h0)] ?
                  ((!(8'haa)) ?
                      $unsigned(wire2) : $signed(reg5)) : $signed($signed((8'ha1)))) >> {$signed($unsigned(reg5))}));
            end
          else
            begin
              reg6 <= $unsigned(wire1[(1'h1):(1'h0)]);
              reg7 <= (8'hbc);
            end
          if ((^($signed($signed(reg5)) ^ $signed(wire4[(3'h4):(2'h3)]))))
            begin
              reg8 <= $signed(({wire4} ?
                  (wire3[(2'h3):(1'h0)] ?
                      (~|(wire2 ?
                          wire4 : wire4)) : $signed(wire0)) : (~reg6[(3'h5):(3'h4)])));
            end
          else
            begin
              reg8 <= (~reg6);
              reg9 <= ((($signed({wire1}) < reg5) ?
                  reg7 : ($signed((8'hb7)) ?
                      {(wire0 ?
                              (8'hbc) : (8'ha4))} : (~&{reg8}))) == $signed((wire3[(3'h4):(2'h3)] + ($signed(wire0) << (^wire3)))));
            end
          reg10 <= (reg9 ^ (~((reg9 ?
              (reg6 | reg6) : $unsigned(reg6)) >> (^~$signed(reg7)))));
          reg11 <= wire1[(4'he):(4'hb)];
          reg12 <= (reg5[(4'hb):(3'h7)] ?
              $unsigned($unsigned(reg6[(3'h4):(2'h2)])) : {(~&((|reg7) != wire1))});
        end
      else
        begin
          if (wire1[(5'h11):(3'h7)])
            begin
              reg6 <= ($unsigned(reg10) >> reg12[(1'h1):(1'h0)]);
              reg7 <= {$unsigned(reg12),
                  $signed($unsigned(reg8[(1'h1):(1'h0)]))};
              reg8 <= reg9;
              reg9 <= reg7[(1'h1):(1'h1)];
            end
          else
            begin
              reg6 <= (~|wire1);
              reg7 <= $unsigned(wire3);
              reg8 <= reg7[(2'h3):(2'h3)];
              reg9 <= $unsigned(($signed((reg12 ?
                      $unsigned(wire0) : $signed(reg10))) ?
                  (({reg9, reg6} ?
                      (wire2 ?
                          (8'haf) : wire1) : $unsigned(reg6)) == ((wire1 * wire2) ?
                      wire1[(4'h9):(2'h3)] : $signed(wire3))) : $signed(wire2)));
              reg10 <= reg9;
            end
          reg11 <= (8'hbc);
          reg12 <= $signed($signed((~|$signed($signed(reg6)))));
          if ({{(&wire0),
                  (wire4 || ((~wire1) ?
                      reg7[(4'hc):(1'h1)] : (reg12 < reg9)))}})
            begin
              reg13 <= {$unsigned($unsigned($signed(reg11[(3'h4):(1'h1)])))};
            end
          else
            begin
              reg13 <= ((($unsigned((reg5 ? wire2 : wire3)) ?
                          $signed((+reg5)) : $unsigned((reg13 | (8'hb9)))) ?
                      {$signed((&(8'ha5))),
                          $signed(reg11)} : $signed({reg11})) ?
                  (reg10[(5'h10):(1'h1)] ?
                      ($signed((reg5 ? reg10 : reg11)) ?
                          wire1[(3'h6):(3'h6)] : wire4[(4'ha):(4'h8)]) : $unsigned($signed({reg10,
                          reg7}))) : (~|(($signed(reg13) ?
                          (^wire1) : {reg7, reg8}) ?
                      $signed((-(8'h9c))) : (~&reg12[(3'h6):(3'h4)]))));
              reg14 <= (^~reg6[(3'h5):(1'h1)]);
              reg15 <= $signed($unsigned($signed(((^~wire3) ?
                  (wire0 ? reg11 : (8'ha0)) : reg5))));
              reg16 <= $unsigned($unsigned((~^((wire0 ? reg15 : wire1) ?
                  (-reg6) : $signed(reg15)))));
              reg17 <= $signed(reg7[(4'h9):(1'h1)]);
            end
          reg18 <= wire1;
        end
      if ((~|reg14))
        begin
          reg19 <= (((($unsigned(reg8) ~^ $signed(reg15)) ?
                  reg18 : {reg13[(1'h1):(1'h1)],
                      wire0}) ^~ $unsigned(((~reg18) | {(8'h9e)}))) ?
              reg8 : reg8);
          reg20 <= {reg17};
          reg21 <= (({reg16} + reg8) == reg18);
          if ((~$signed($unsigned((-((8'hb9) ? reg10 : reg6))))))
            begin
              reg22 <= {$unsigned($signed((reg13 & $signed(reg18))))};
              reg23 <= (~|($signed((~|(!reg19))) ?
                  reg15[(2'h3):(2'h3)] : ((~&reg10) ? reg11 : wire2)));
              reg24 <= ($unsigned(reg17[(1'h1):(1'h0)]) ?
                  reg6 : reg23[(2'h3):(2'h3)]);
              reg25 <= {($signed(((reg14 ^~ reg17) ?
                          (reg21 ? reg18 : reg12) : (-reg7))) ?
                      wire0 : (reg5[(4'ha):(3'h6)] ?
                          wire0[(2'h2):(2'h2)] : ((+reg23) - wire4))),
                  ($unsigned(reg15) & $signed($signed({wire3})))};
              reg26 <= (&(reg10 ? $signed($signed(reg12)) : reg18));
            end
          else
            begin
              reg22 <= (!{(&{(~&reg8)}), reg12[(1'h0):(1'h0)]});
              reg23 <= wire1[(4'hd):(3'h5)];
            end
          reg27 <= (reg16[(1'h1):(1'h0)] & {(reg18[(3'h7):(3'h5)] ?
                  {((8'hb5) ~^ reg21)} : (-reg15[(1'h1):(1'h0)])),
              (8'hb9)});
        end
      else
        begin
          reg19 <= reg15;
          if (reg9[(4'h9):(1'h0)])
            begin
              reg20 <= {($unsigned($signed(((7'h43) ? reg9 : (8'hb6)))) ?
                      wire2[(2'h3):(1'h1)] : (~|(reg25[(2'h3):(1'h0)] ?
                          (~^reg16) : reg17[(3'h5):(3'h5)]))),
                  (|$signed((^$unsigned(reg14))))};
              reg21 <= reg8[(1'h1):(1'h0)];
            end
          else
            begin
              reg20 <= reg10;
              reg21 <= {$signed(wire2[(1'h1):(1'h0)])};
            end
          if ((reg5 ?
              reg12 : $unsigned($unsigned((~&(reg21 ? (7'h43) : wire2))))))
            begin
              reg22 <= ($signed((($unsigned(reg12) ?
                  reg15[(4'hd):(3'h5)] : (wire0 <= reg14)) >> reg8[(2'h3):(1'h1)])) ^~ (!(^~(^~(reg22 ?
                  reg26 : reg25)))));
              reg23 <= reg11[(4'h9):(1'h1)];
            end
          else
            begin
              reg22 <= $unsigned({(reg27 == reg23[(3'h4):(3'h4)])});
              reg23 <= $signed(reg19[(5'h11):(2'h2)]);
              reg24 <= {{(reg21[(1'h0):(1'h0)] >= (reg10[(2'h2):(1'h0)] ?
                          reg12[(2'h3):(1'h1)] : (wire4 ? reg11 : reg16))),
                      $signed((^~$unsigned((8'ha7))))}};
              reg25 <= $unsigned(reg12);
              reg26 <= $signed($signed({reg17,
                  $unsigned(((8'hab) ? reg17 : reg21))}));
            end
          reg27 <= ($signed(($unsigned(reg18[(4'hb):(2'h3)]) ?
                  reg24 : $signed($signed(wire3)))) ?
              (+$unsigned($unsigned($signed(reg17)))) : {{(&reg23)}});
          reg28 <= $unsigned($unsigned(wire1[(2'h2):(2'h2)]));
        end
      reg29 <= ($unsigned($signed((wire2 ?
          $unsigned(reg16) : $signed(reg6)))) < ({(reg6[(2'h3):(2'h2)] == (~|wire0)),
          reg13[(1'h1):(1'h0)]} <= $unsigned($signed((reg23 <<< reg21)))));
      reg30 <= reg10;
    end
  assign wire31 = {(({$unsigned(reg19), (reg6 == reg5)} ?
                              reg27[(2'h3):(1'h0)] : wire4[(1'h0):(1'h0)]) ?
                          reg14 : (8'hb8))};
  module32 #() modinst178 (wire177, clk, reg21, reg5, wire1, reg28);
  assign wire179 = (~&(8'hb0));
  assign wire180 = ((reg19[(5'h11):(4'ha)] ?
                           {{(7'h44), {reg19}},
                               $unsigned($unsigned(reg10))} : (~reg29[(3'h6):(1'h0)])) ?
                       ($unsigned(wire0) ?
                           $unsigned($unsigned($unsigned((8'ha4)))) : ((reg18[(4'ha):(3'h6)] >> (reg6 == reg27)) ?
                               (reg24 ?
                                   wire2[(2'h2):(1'h1)] : (~&(8'ha1))) : ($signed(wire4) >> reg20))) : $signed($signed(((reg10 | (8'haf)) ?
                           wire2[(1'h0):(1'h0)] : $unsigned(reg17)))));
  assign wire181 = ({wire1} ? wire179[(1'h0):(1'h0)] : reg11);
  assign wire182 = reg30[(2'h2):(1'h1)];
  assign wire183 = (|$unsigned(((reg13[(2'h3):(1'h1)] ?
                       reg25[(4'h8):(1'h0)] : {(8'hb2),
                           (8'hb0)}) << $unsigned($signed(reg27)))));
  assign wire184 = (($signed((|reg18)) * reg16) - wire4[(4'hb):(1'h0)]);
  assign wire185 = (8'hb5);
  always
    @(posedge clk) begin
      if (wire0[(4'hd):(1'h1)])
        begin
          reg186 <= ($unsigned(($signed((wire31 ? reg18 : wire3)) ?
                  {((8'hb5) + reg25), wire31} : (^~$signed(reg5)))) ?
              ($signed(wire177) <= $unsigned($unsigned((wire1 + (8'ha5))))) : $signed($unsigned(($signed((8'h9d)) ?
                  (+wire181) : {reg30, (8'h9c)}))));
          reg187 <= (((~wire183) ?
                  reg7[(4'hc):(4'h8)] : wire185[(1'h1):(1'h1)]) ?
              reg30[(3'h4):(2'h2)] : $unsigned($unsigned(reg26[(2'h3):(1'h0)])));
        end
      else
        begin
          reg186 <= ((-(reg25[(2'h3):(1'h0)] + ($signed(reg24) <<< (+reg11)))) ^ $unsigned($unsigned(((reg15 >= (7'h43)) - $unsigned(reg17)))));
          if ({(~|$signed($signed(reg26)))})
            begin
              reg187 <= $unsigned($signed((&($signed(reg186) << reg5))));
            end
          else
            begin
              reg187 <= {(8'hb5)};
              reg188 <= $signed({(~&wire3), reg24[(1'h1):(1'h1)]});
            end
          if (reg28)
            begin
              reg189 <= reg22;
            end
          else
            begin
              reg189 <= reg17[(3'h6):(3'h5)];
            end
          reg190 <= {reg187, wire3[(2'h2):(2'h2)]};
          reg191 <= (({reg189[(4'h8):(2'h3)]} ?
              $signed((reg186[(2'h2):(1'h0)] ?
                  (+reg5) : $unsigned(reg9))) : $signed(wire185)) ^~ (((|wire183[(4'ha):(3'h6)]) & reg23) ?
              ((8'hbf) ?
                  ({(8'had), reg24} ?
                      (reg12 & reg16) : (!reg5)) : (reg18 || (|reg20))) : ((-(reg6 ?
                      (8'h9d) : reg21)) ?
                  ((reg16 ? reg186 : reg21) ?
                      $signed(reg11) : $unsigned((8'ha6))) : ((~|reg19) ?
                      (~|reg22) : $signed(wire179)))));
        end
    end
  assign wire192 = (wire183 ?
                       (wire2 ?
                           ($signed(wire181[(2'h3):(1'h1)]) < ($unsigned((8'hbd)) ?
                               (~|reg189) : (wire183 ?
                                   reg27 : wire185))) : reg12[(3'h5):(3'h5)]) : {$unsigned($unsigned($signed(reg187)))});
  assign wire193 = $signed(wire177);
  assign wire194 = (~&reg20);
  assign wire195 = $unsigned((~^$signed((&reg190))));
endmodule

module module32
#(parameter param175 = (~|(-{{((8'ha2) ^ (8'h9f)), ((8'ha4) > (7'h42))}})), 
parameter param176 = ((~|param175) <<< ({{(~|param175)}} && (((param175 ^ (8'h9f)) <<< (param175 <= (8'hbe))) ^ (^(param175 ^ param175))))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire36;
  input wire [(2'h2):(1'h0)] wire35;
  input wire [(4'hd):(1'h0)] wire34;
  input wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire173;
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  assign y = {wire131,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire85,
                 wire83,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 wire133,
                 wire134,
                 wire135,
                 wire173,
                 reg40,
                 (1'h0)};
  assign wire37 = $signed($signed($signed(((^~wire35) ^~ {wire33, wire36}))));
  assign wire38 = (~^($signed((wire34[(2'h2):(1'h0)] ?
                      $signed(wire36) : wire36)) <= $unsigned((~|wire34[(1'h0):(1'h0)]))));
  assign wire39 = (~|((+((wire35 >> wire38) > $signed(wire38))) > $signed((+wire34))));
  always
    @(posedge clk) begin
      reg40 <= (wire37 ?
          $signed($unsigned(wire34)) : (($signed((wire35 >>> wire36)) + wire35[(1'h0):(1'h0)]) ?
              (~&((wire36 ?
                  wire37 : (8'haa)) <= (~^wire33))) : $signed((8'haf))));
    end
  assign wire41 = {$signed((reg40 - $unsigned((&wire35)))),
                      {({(wire33 < wire35)} ?
                              ($signed(wire35) ?
                                  (&(8'hb0)) : wire39[(3'h6):(3'h6)]) : (+$unsigned(wire39)))}};
  assign wire42 = $signed((^~(($signed(wire39) == (wire38 ? wire41 : wire33)) ?
                      ({wire36, wire41} ?
                          $unsigned(wire37) : wire36[(2'h2):(1'h1)]) : reg40)));
  assign wire43 = $signed((8'ha6));
  assign wire44 = $unsigned($signed({wire38[(3'h5):(3'h5)],
                      $unsigned($signed((8'h9e)))}));
  module45 #() modinst84 (wire83, clk, wire42, wire39, wire44, wire38);
  assign wire85 = $unsigned((wire42[(4'h9):(4'h8)] ?
                      $unsigned(wire44) : wire83));
  module86 #() modinst106 (wire105, clk, wire37, wire38, wire34, wire83);
  assign wire107 = wire38;
  assign wire108 = ($unsigned($unsigned(((wire36 | wire44) ?
                           (wire43 * wire44) : wire33[(2'h3):(2'h2)]))) ?
                       (-(^(wire105[(1'h1):(1'h1)] ?
                           (wire44 ? wire42 : wire38) : wire83))) : (7'h44));
  assign wire109 = (wire105[(1'h0):(1'h0)] > (-wire83[(4'h8):(1'h0)]));
  module110 #() modinst132 (.wire114(wire107), .y(wire131), .wire112(wire108), .wire113(wire36), .wire115(wire34), .clk(clk), .wire111(wire41));
  assign wire133 = wire37[(4'ha):(4'h9)];
  assign wire134 = (wire105[(1'h0):(1'h0)] ?
                       ($unsigned($signed((wire42 ? wire33 : wire41))) ?
                           {($signed(wire34) >= (~|wire35)),
                               (wire42 | (~(8'hb3)))} : ($signed($unsigned(wire108)) ?
                               wire108 : ((^wire42) && (-wire83)))) : wire109[(3'h6):(1'h1)]);
  assign wire135 = $unsigned(wire42);
  module136 #() modinst174 (wire173, clk, wire34, wire38, wire108, wire135, wire42);
endmodule

module module136  (y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire141;
  input wire [(4'hd):(1'h0)] wire140;
  input wire [(4'hb):(1'h0)] wire139;
  input wire [(5'h12):(1'h0)] wire138;
  input wire [(4'ha):(1'h0)] wire137;
  wire signed [(5'h12):(1'h0)] wire172;
  wire [(4'hb):(1'h0)] wire171;
  wire [(4'hc):(1'h0)] wire170;
  wire [(5'h13):(1'h0)] wire165;
  wire signed [(4'h8):(1'h0)] wire164;
  wire [(5'h15):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire147;
  wire [(4'he):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire145;
  wire [(4'hd):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  reg [(5'h12):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire165,
                 wire164,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire142 = ($signed((((wire141 ? wire139 : wire139) ?
                       wire137 : $signed(wire140)) > (wire138 ^ (wire139 < (7'h42))))) > ($unsigned((~|wire141)) ^ (-(wire141 ?
                       (wire137 + wire139) : (wire140 ? (7'h41) : wire140)))));
  assign wire143 = $signed(($signed((~(wire139 ~^ wire141))) ?
                       wire137 : $signed(((wire139 ?
                           wire140 : wire141) >= $signed(wire140)))));
  assign wire144 = $unsigned(({((!wire140) >>> $signed((8'hb9))),
                       wire140[(2'h2):(1'h0)]} ^ (~|(((8'ha8) ^ wire137) ~^ wire139[(3'h6):(3'h5)]))));
  assign wire145 = $unsigned((!$unsigned((wire140 & $signed(wire139)))));
  assign wire146 = wire138;
  assign wire147 = (&(wire143[(3'h7):(3'h4)] ?
                       (wire142 ~^ (&wire139[(3'h5):(1'h1)])) : wire144));
  always
    @(posedge clk) begin
      reg148 <= ((wire141[(4'hd):(4'ha)] * {$signed($signed(wire144)),
          wire142}) ^~ wire145);
      reg149 <= reg148;
      reg150 <= $signed((|reg149));
      reg151 <= wire138;
      reg152 <= (wire143 ? wire144[(4'hc):(2'h2)] : wire138);
    end
  assign wire153 = (({($signed((8'ha7)) ?
                           {wire140, wire143} : (wire140 ?
                               wire141 : wire142))} <= (7'h43)) ~^ $signed(reg150[(4'he):(1'h0)]));
  assign wire154 = (($unsigned(($signed(wire146) > wire141)) ?
                       (((^wire138) && $signed(wire140)) ?
                           $signed((8'ha4)) : ($signed(wire142) ^ (~reg152))) : $unsigned($signed($signed(wire138)))) << (^~($signed($signed(wire145)) ?
                       $unsigned((&(8'hb8))) : $signed($unsigned(wire146)))));
  assign wire155 = wire141[(4'hd):(1'h0)];
  assign wire156 = ((^~{$signed((wire146 + reg150)), (~|$signed(wire137))}) ?
                       $unsigned(((wire142[(2'h3):(2'h2)] < ((8'ha8) ?
                           wire140 : wire146)) & $unsigned($signed(reg148)))) : (|($unsigned((reg148 | wire138)) ?
                           $unsigned((~&wire147)) : $signed($unsigned(wire140)))));
  always
    @(posedge clk) begin
      reg157 <= wire145[(3'h7):(2'h3)];
      if ((~|reg148))
        begin
          reg158 <= (|$unsigned((($signed(wire144) ?
                  reg152 : (wire138 ? wire138 : (8'ha5))) ?
              $unsigned({reg157, wire144}) : ($signed(wire143) ?
                  (8'hb7) : wire154[(4'hc):(4'h8)]))));
          reg159 <= $signed(((wire154[(1'h1):(1'h0)] ?
              reg149[(4'hd):(4'h9)] : (-(-reg151))) <<< wire155));
        end
      else
        begin
          reg158 <= (((-wire154[(1'h1):(1'h0)]) ?
                  (((wire137 ?
                      wire140 : wire155) * $signed(wire137)) && ((&wire141) && wire155)) : wire143[(3'h4):(2'h3)]) ?
              $signed(wire142) : $signed(((^(wire142 ?
                  (7'h44) : (8'hb5))) << $unsigned((wire155 < reg149)))));
          reg159 <= ($signed(reg148) ?
              wire155[(3'h7):(2'h2)] : (reg152 >>> wire156));
          reg160 <= wire141;
          reg161 <= $signed({wire143});
          reg162 <= {({reg150[(1'h0):(1'h0)]} ?
                  {(~|(reg151 ? (8'h9c) : reg158)),
                      wire153[(3'h7):(1'h1)]} : (8'hb8))};
        end
      reg163 <= {wire143[(4'h9):(1'h1)]};
    end
  assign wire164 = ($unsigned(((8'hac) ^~ (~^(~&reg161)))) | ({$signed((wire145 <<< reg159)),
                       wire153[(2'h2):(1'h0)]} || wire139));
  assign wire165 = $unsigned((!($unsigned($unsigned(wire144)) ?
                       (reg163[(3'h4):(2'h2)] < $signed(wire155)) : (-$unsigned(reg151)))));
  always
    @(posedge clk) begin
      if (wire138)
        begin
          reg166 <= $signed($unsigned(wire143));
        end
      else
        begin
          if (reg152)
            begin
              reg166 <= {$unsigned($unsigned(wire165[(3'h4):(1'h0)])),
                  ((({wire137, reg149} ?
                          wire139[(2'h2):(1'h0)] : (reg151 ?
                              (8'hb9) : wire147)) ?
                      ((8'hb3) >> (wire143 * wire137)) : wire165[(1'h0):(1'h0)]) >>> (reg157[(2'h2):(1'h1)] ?
                      (8'haf) : wire156))};
              reg167 <= reg160[(1'h1):(1'h1)];
              reg168 <= {wire144};
            end
          else
            begin
              reg166 <= $unsigned($signed($signed(reg149)));
              reg167 <= $signed((wire155 ?
                  ((8'ha9) && {$unsigned(wire141),
                      (wire156 ?
                          reg151 : reg167)}) : ((-(wire144 ~^ (8'hb9))) >= (wire137 | (reg168 ?
                      wire139 : reg160)))));
              reg168 <= (($signed((reg161 ^ $unsigned(reg166))) ^ ($unsigned(((8'hbb) & reg160)) ?
                  $unsigned({wire153}) : reg160)) <= reg168);
            end
          reg169 <= $signed(((reg157 ?
              ($unsigned((8'hb8)) && (7'h40)) : $signed($unsigned(reg162))) * $unsigned(($signed(wire145) ?
              (reg160 - reg152) : reg152))));
        end
    end
  assign wire170 = (7'h43);
  assign wire171 = ($signed($signed($signed($signed(reg149)))) ?
                       wire139[(4'hb):(3'h4)] : reg167[(3'h4):(3'h4)]);
  assign wire172 = reg149[(4'he):(4'ha)];
endmodule

module module110
#(parameter param129 = (((~^(|((8'ha2) ? (8'ha8) : (8'ha0)))) ? (8'hbf) : (((8'ha5) ? ((8'hb3) ? (8'haf) : (8'hb9)) : {(7'h40), (8'hbb)}) >= (~^(+(8'hb5))))) ? (|{{{(8'had)}}, ({(7'h44), (8'hbe)} ? ((8'h9d) >= (8'ha2)) : (|(7'h40)))}) : (^(({(8'hb0)} ? (~|(8'hbf)) : ((8'ha1) ? (8'hbd) : (8'hb2))) >>> {((8'hb3) | (8'hac))}))), 
parameter param130 = (~&(8'ha3)))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire115;
  input wire [(3'h5):(1'h0)] wire114;
  input wire signed [(4'ha):(1'h0)] wire113;
  input wire [(4'hb):(1'h0)] wire112;
  input wire signed [(5'h15):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire118,
                 wire117,
                 wire116,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire116 = {($unsigned((-(~&wire112))) ? wire113 : wire114)};
  assign wire117 = wire114;
  assign wire118 = ($signed(wire112[(2'h3):(2'h3)]) >= {$unsigned((8'hab)),
                       $unsigned({wire114, (|wire116)})});
  always
    @(posedge clk) begin
      reg119 <= (8'ha0);
      reg120 <= ($signed(($unsigned(wire113[(3'h6):(2'h3)]) | {{(8'ha4)},
              (-(8'ha5))})) ?
          $unsigned(wire114) : ($signed(wire118) & wire115));
      reg121 <= (&wire118);
      reg122 <= wire114[(2'h3):(2'h3)];
      reg123 <= wire116[(3'h4):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg124 <= $unsigned((7'h44));
      if (($signed(wire114) || {(^((reg123 ? wire111 : wire113) && wire114)),
          {($unsigned(wire115) && {wire115, wire114})}}))
        begin
          reg125 <= $unsigned($unsigned($unsigned((wire113[(3'h6):(1'h0)] != {wire117}))));
        end
      else
        begin
          reg125 <= (8'ha5);
          reg126 <= (~^(wire113 ?
              ((!(&wire116)) ?
                  wire116 : (~(|reg120))) : $signed({$unsigned((8'hb0)),
                  $signed(reg122)})));
        end
    end
  assign wire127 = $unsigned((-((wire113[(1'h1):(1'h0)] == (-wire111)) ?
                       wire118[(1'h0):(1'h0)] : reg125[(2'h3):(2'h3)])));
  assign wire128 = wire118;
endmodule

module module86
#(parameter param104 = (8'ha9))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire89;
  input wire signed [(3'h6):(1'h0)] wire88;
  input wire signed [(4'he):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(2'h3):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg97,
                 (1'h0)};
  assign wire91 = wire90;
  assign wire92 = (wire90[(4'ha):(3'h5)] >> $signed($signed({(wire87 << wire87)})));
  assign wire93 = {(8'haf),
                      ((8'had) ?
                          wire87[(4'he):(3'h4)] : (wire91[(4'h8):(3'h7)] != wire91[(1'h1):(1'h0)]))};
  assign wire94 = wire90;
  assign wire95 = (+$signed(($signed(wire89[(4'h8):(2'h2)]) ?
                      $unsigned(wire93[(3'h5):(3'h4)]) : ((wire90 ^ wire94) ?
                          $signed(wire92) : (~|wire87)))));
  assign wire96 = $signed((~(($signed(wire90) ?
                          wire95[(2'h3):(2'h2)] : wire91) ?
                      $signed((&(8'hb6))) : wire93)));
  always
    @(posedge clk) begin
      reg97 <= $unsigned($signed(wire96));
    end
  assign wire98 = (+((((wire90 || (8'hbd)) > wire89) >>> {wire91[(2'h3):(1'h1)],
                          $signed(wire93)}) ?
                      ($unsigned({wire90,
                          wire92}) ^ wire89[(4'h8):(1'h1)]) : $signed({$unsigned(wire95),
                          $signed(wire87)})));
  assign wire99 = (reg97[(4'hc):(4'h8)] ?
                      $signed($unsigned($signed(wire93[(3'h6):(3'h5)]))) : $signed(($unsigned((wire93 != wire96)) << wire94)));
  always
    @(posedge clk) begin
      reg100 <= {(8'ha7)};
      reg101 <= $unsigned(($unsigned({(+(8'hb1)),
          (wire91 ? (8'hbb) : wire99)}) + (wire95 ?
          {(+wire93)} : ({wire94} || $signed(wire88)))));
      reg102 <= {$signed(($signed(((8'h9d) ? wire99 : wire99)) ?
              $signed($unsigned(wire99)) : wire91[(4'hd):(4'hc)])),
          $signed($signed((wire88[(3'h5):(3'h5)] >= {wire89, wire90})))};
      reg103 <= wire96;
    end
endmodule

module module45  (y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire49;
  input wire [(3'h6):(1'h0)] wire48;
  input wire [(3'h6):(1'h0)] wire47;
  input wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  assign y = {wire82,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire51,
                 wire50,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire50 = $signed((8'hba));
  assign wire51 = (((-(~|(wire49 ~^ wire47))) ?
                      wire50[(3'h5):(1'h0)] : $unsigned($unsigned(wire47[(2'h3):(2'h2)]))) > wire49);
  always
    @(posedge clk) begin
      reg52 <= $signed(wire48);
      reg53 <= wire46[(1'h1):(1'h1)];
      reg54 <= $unsigned(wire51);
    end
  assign wire55 = reg52;
  assign wire56 = reg54;
  assign wire57 = {((wire49 ~^ wire48[(3'h6):(1'h1)]) >> {$unsigned({wire48,
                              wire46})}),
                      ((8'hb1) ?
                          ($signed((reg54 < (8'hb6))) ?
                              (8'hb8) : wire51[(5'h15):(3'h4)]) : (+(8'ha2)))};
  assign wire58 = $unsigned($unsigned(((^~{(8'h9d), reg54}) ?
                      $signed(wire50) : ($signed(reg53) ^~ (reg52 - reg54)))));
  assign wire59 = wire48[(2'h3):(1'h1)];
  assign wire60 = (8'hba);
  assign wire61 = wire60[(4'hb):(4'h9)];
  assign wire62 = (($unsigned(wire59) >= (((wire58 ?
                      wire60 : wire48) != wire48) != (8'hbc))) < wire59[(5'h11):(4'h8)]);
  assign wire63 = ({((^~(~|reg52)) >>> wire55),
                          (wire49 < (wire62 ?
                              wire46[(1'h0):(1'h0)] : (wire49 ?
                                  reg54 : wire56)))} ?
                      wire55[(3'h5):(2'h2)] : $unsigned(reg53[(1'h1):(1'h0)]));
  assign wire64 = wire61[(4'hb):(3'h7)];
  assign wire65 = (wire49 ?
                      wire51 : $signed((((wire59 ?
                          reg54 : wire57) >>> (8'hbc)) && wire58[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire65)
        begin
          reg66 <= $signed($unsigned(wire64[(2'h2):(2'h2)]));
          if (($unsigned((($unsigned(wire63) ?
                  (wire51 ? wire55 : wire62) : (wire51 ?
                      reg52 : wire56)) * $signed(reg66[(4'hb):(4'h9)]))) ?
              (8'hbc) : wire57))
            begin
              reg67 <= $unsigned((&$signed($unsigned($signed(wire63)))));
              reg68 <= {($unsigned((&wire51[(5'h13):(4'hd)])) != ((((8'hbe) - wire59) != wire57[(2'h2):(1'h0)]) || reg67[(3'h7):(3'h6)]))};
              reg69 <= (&$signed((wire55 | $signed($unsigned(wire64)))));
            end
          else
            begin
              reg67 <= $unsigned({$unsigned($signed((reg69 << (8'had))))});
            end
          reg70 <= (reg54 ?
              ($signed(($signed(wire63) != (wire48 ?
                  reg67 : wire50))) + {(8'h9f)}) : ((|$signed(wire65[(3'h6):(3'h5)])) ?
                  reg67[(2'h2):(1'h1)] : wire55[(2'h2):(1'h1)]));
        end
      else
        begin
          reg66 <= reg69;
        end
      reg71 <= (((($signed(wire58) <= {reg54, reg67}) ?
              $unsigned($signed(wire65)) : (wire65 ?
                  (reg66 ? (8'hbb) : wire60) : {wire58})) ?
          (|wire49[(1'h1):(1'h1)]) : (8'hae)) + (~(reg70 ?
          ($signed((8'hb0)) ?
              (wire58 ? wire47 : reg53) : (wire47 ?
                  wire60 : reg54)) : {(~&reg67)})));
      if ($signed(wire62[(3'h7):(3'h4)]))
        begin
          reg72 <= (~|wire46[(2'h2):(1'h0)]);
          if (reg52[(3'h6):(1'h0)])
            begin
              reg73 <= ($unsigned($unsigned((+$signed(wire63)))) << $unsigned($unsigned($unsigned($unsigned(wire49)))));
            end
          else
            begin
              reg73 <= wire59;
              reg74 <= ($unsigned(wire59) ? (|wire61) : reg68);
              reg75 <= (wire51[(4'h8):(4'h8)] == $unsigned((wire64[(1'h1):(1'h0)] ~^ (((8'hbf) ?
                      reg71 : wire49) ?
                  ((8'h9f) != wire55) : ((8'hbe) ? reg72 : wire57)))));
              reg76 <= (reg69 ?
                  $unsigned($signed((+$signed(wire57)))) : (~|((8'hac) ?
                      wire63[(4'ha):(1'h0)] : ((wire55 >= reg72) < (8'hb7)))));
              reg77 <= $unsigned($signed((reg72 ?
                  wire56[(3'h7):(3'h6)] : reg52[(3'h5):(2'h3)])));
            end
        end
      else
        begin
          reg72 <= $unsigned($unsigned($signed($signed(wire57[(3'h4):(2'h3)]))));
          reg73 <= ({wire58, reg70} ? wire65 : reg77[(2'h2):(1'h0)]);
          reg74 <= (^(&(8'ha8)));
          reg75 <= (reg71[(4'hc):(3'h4)] ?
              $unsigned((($signed(wire50) ?
                  wire48 : {reg76,
                      wire51}) <= wire46)) : (^reg76[(2'h3):(1'h0)]));
        end
      reg78 <= reg67;
      if (reg75)
        begin
          reg79 <= reg68;
          reg80 <= wire61[(4'h9):(3'h4)];
        end
      else
        begin
          reg79 <= wire57;
          reg80 <= $signed(reg75);
          reg81 <= ({wire51[(5'h11):(5'h11)]} == {{((reg70 | wire51) != wire56),
                  (reg73 ? {wire49, reg79} : wire46)}});
        end
    end
  assign wire82 = reg78[(4'hf):(3'h4)];
endmodule
