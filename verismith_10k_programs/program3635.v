module top
#(parameter param68 = (((({(8'hba), (8'hbf)} >> (+(8'ha5))) < (((8'ha3) & (8'ha4)) ? ((8'ha1) ? (8'hbf) : (8'had)) : ((8'ha9) <<< (8'had)))) >> ((~&((8'hb7) ? (8'hb9) : (8'hb7))) >> (&((8'hb3) ? (8'hb4) : (8'ha2))))) << (({(+(8'haf)), {(8'hac), (8'hbb)}} ? (8'h9c) : (^((8'ha4) <= (8'hb8)))) << ({(&(8'ha8)), {(8'ha6), (8'hbe)}} ^ ((-(8'hbb)) != (&(8'hb4)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire64;
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire64,
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
  assign wire5 = $unsigned(wire3[(4'hb):(3'h4)]);
  assign wire6 = wire2;
  assign wire7 = (~wire0);
  assign wire8 = $signed((8'hb9));
  assign wire9 = (wire7 ~^ $unsigned($unsigned((~(wire8 ? wire7 : wire4)))));
  always
    @(posedge clk) begin
      if (($signed(((wire1 < wire2) >>> $unsigned({wire1, wire2}))) ?
          (wire9[(4'hb):(3'h5)] ?
              $unsigned((wire8[(4'h9):(3'h6)] ?
                  $unsigned(wire3) : wire3[(5'h10):(4'hd)])) : $signed(((wire7 ?
                  (8'h9d) : wire2) ^ ((8'haa) ? wire6 : wire7)))) : wire4))
        begin
          reg10 <= $unsigned($signed((~^(8'hb1))));
          reg11 <= $unsigned(wire0[(2'h3):(1'h1)]);
          if (wire6[(4'h9):(3'h7)])
            begin
              reg12 <= {((wire2[(2'h2):(1'h0)] > (wire5 + $unsigned(wire2))) ?
                      ($signed((wire7 > wire4)) != (~&wire3)) : (wire9[(4'ha):(3'h5)] ?
                          wire1[(1'h0):(1'h0)] : $unsigned((reg10 ?
                              reg11 : reg10))))};
              reg13 <= reg11[(4'h9):(4'h9)];
              reg14 <= (wire5[(2'h2):(1'h0)] > $signed(((^~$signed(reg10)) > ((^~wire3) ?
                  (|wire2) : (reg12 ? wire3 : reg12)))));
              reg15 <= $signed($signed(wire2));
            end
          else
            begin
              reg12 <= ((wire9[(4'hd):(4'hb)] ~^ $unsigned(((+wire5) ?
                      $signed(wire0) : $unsigned(wire3)))) ?
                  (wire9 ?
                      $signed(((wire6 ?
                          wire5 : wire8) * (wire0 > wire5))) : wire9) : wire1);
              reg13 <= ($signed($signed((wire4 ?
                  $signed(wire0) : (wire6 ?
                      wire1 : reg10)))) ~^ (($unsigned((wire6 < (8'hb3))) + wire9[(4'hc):(1'h1)]) < (8'hb3)));
              reg14 <= (-{(wire6[(1'h0):(1'h0)] ? reg15 : (~^wire4)),
                  $signed((reg13[(3'h4):(1'h0)] ?
                      {wire2} : (wire3 == reg12)))});
            end
          reg16 <= reg15;
          reg17 <= (reg13 ?
              (~|((~^(8'hbc)) >>> ($signed(reg15) == (wire6 ?
                  reg10 : reg11)))) : wire0[(1'h0):(1'h0)]);
        end
      else
        begin
          if ((wire1[(3'h7):(2'h2)] ?
              {(wire3[(3'h4):(1'h0)] ?
                      {$unsigned(reg17)} : wire2[(2'h2):(1'h0)]),
                  wire8[(2'h2):(1'h1)]} : $unsigned($unsigned(wire9))))
            begin
              reg10 <= (wire0[(4'h9):(3'h4)] << {(8'ha8),
                  wire3[(4'hc):(4'h8)]});
            end
          else
            begin
              reg10 <= ($signed($signed((8'hac))) + wire1[(1'h1):(1'h1)]);
              reg11 <= ({{(reg10 & (wire6 * (8'hb0)))}} ?
                  $unsigned(wire2[(4'h8):(1'h0)]) : ($unsigned(reg14[(3'h4):(2'h3)]) ?
                      $unsigned(($signed(wire0) ?
                          {wire4,
                              wire2} : (8'hb6))) : (reg14 >= (~^(wire7 >>> wire7)))));
              reg12 <= (wire4[(4'hb):(2'h2)] ?
                  (~^{(|$unsigned(wire1))}) : $unsigned(wire6[(2'h2):(2'h2)]));
              reg13 <= (!{(((+reg16) ?
                      wire2[(4'hf):(3'h7)] : (wire0 ?
                          wire9 : (8'hb0))) < $signed(reg12[(3'h4):(2'h3)])),
                  ($signed((&(8'hb3))) ? $signed(reg12) : reg13)});
              reg14 <= reg16[(5'h13):(4'h8)];
            end
          reg15 <= ({((^(wire6 * reg13)) ?
                  reg11 : wire1[(2'h3):(2'h3)])} || ((8'h9f) << (8'hae)));
          reg16 <= (~|$unsigned(wire0[(4'h8):(2'h2)]));
          reg17 <= ($signed(reg16) ?
              {(~^reg17)} : ({wire2, (8'ha0)} ?
                  reg17 : (|$signed((wire7 <<< wire8)))));
        end
      reg18 <= wire8[(4'ha):(3'h4)];
      reg19 <= reg18[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned(wire9[(4'he):(3'h7)]))))
        begin
          reg20 <= (($unsigned((wire6 ?
                      wire6[(3'h5):(2'h2)] : wire2[(4'hc):(1'h1)])) ?
                  wire7[(4'h9):(1'h0)] : (|(8'haf))) ?
              (+((wire9 <= {wire1}) ?
                  reg19[(4'hb):(1'h0)] : $signed($unsigned(reg11)))) : (8'hb9));
          reg21 <= {($signed(wire4) ?
                  $unsigned((reg13 ?
                      $unsigned(reg10) : (~reg19))) : (+($unsigned(reg16) <<< $unsigned(reg11)))),
              (&wire4[(4'ha):(3'h4)])};
          reg22 <= wire6[(3'h7):(2'h2)];
        end
      else
        begin
          reg20 <= reg20;
          reg21 <= reg14;
          reg22 <= (($unsigned(reg19) <= $signed(((wire4 + reg13) ?
              wire9 : reg18))) >= ({{(reg20 & wire9)}} != (-reg13)));
          reg23 <= (((((wire7 ? (8'hb4) : reg13) ?
              (wire2 > reg10) : wire4) >= ({reg10} || reg11[(1'h1):(1'h0)])) >> $signed({$unsigned((8'hb4)),
              ((8'hb0) <= reg11)})) > $signed(((!wire6) ?
              $signed((-reg19)) : wire8[(3'h5):(2'h3)])));
        end
      if ($unsigned(reg23[(1'h0):(1'h0)]))
        begin
          if (reg20)
            begin
              reg24 <= $signed({reg13});
              reg25 <= $unsigned(wire5);
              reg26 <= $signed((reg15 <<< (|wire1[(3'h6):(3'h6)])));
            end
          else
            begin
              reg24 <= wire0[(1'h0):(1'h0)];
              reg25 <= $unsigned({(((reg18 == wire7) ~^ wire8[(4'ha):(3'h7)]) ~^ ($signed(reg23) || wire7[(3'h4):(2'h2)])),
                  reg14[(3'h6):(2'h2)]});
              reg26 <= $unsigned(wire3[(4'hd):(1'h0)]);
              reg27 <= reg12;
              reg28 <= reg18[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg24 <= ($signed(($signed(((8'hbe) || (8'hb6))) >= wire8[(3'h7):(3'h6)])) ?
              reg23 : reg25[(3'h6):(1'h1)]);
          if (((reg25[(4'h8):(3'h5)] <<< reg21) ?
              reg25[(1'h1):(1'h0)] : (8'hbf)))
            begin
              reg25 <= reg25[(4'h8):(3'h7)];
            end
          else
            begin
              reg25 <= {(reg22[(4'ha):(3'h6)] >>> (reg14[(3'h7):(1'h1)] ?
                      (~wire2) : reg11[(1'h0):(1'h0)])),
                  $signed(reg16)};
              reg26 <= ((-((wire8 && ((8'ha0) ?
                  reg14 : reg15)) && ((reg12 | reg16) != (reg19 + (8'hb5))))) - (((8'ha8) ?
                  (wire4[(4'he):(1'h1)] >> (reg17 && reg26)) : wire0[(3'h5):(3'h5)]) >= ({$signed(wire8),
                  (~reg25)} ^ $unsigned($unsigned(reg24)))));
              reg27 <= wire3[(4'ha):(3'h7)];
            end
          reg28 <= $unsigned((~&{$unsigned((+reg13))}));
        end
      reg29 <= $signed((reg26[(4'h9):(1'h0)] - $signed(($unsigned(reg10) ?
          $unsigned(wire3) : wire6))));
      reg30 <= {wire4};
    end
  assign wire31 = (+((+reg14) || ((wire7[(3'h5):(1'h0)] >> {(8'ha6),
                      wire7}) || reg12[(1'h0):(1'h0)])));
  assign wire32 = {(((reg16 ? (wire2 ? reg17 : wire3) : $unsigned(wire7)) ?
                              reg13 : $unsigned($signed(wire1))) ?
                          {$unsigned((7'h44))} : $signed(reg19[(4'hb):(4'h8)])),
                      (((wire8[(3'h7):(1'h1)] ?
                              $signed((8'hb8)) : reg23[(3'h7):(3'h5)]) ?
                          (!$signed((8'hbd))) : ({wire0, wire3} ?
                              reg21[(1'h0):(1'h0)] : ((8'hb0) > reg11))) ~^ wire2[(5'h13):(4'hc)])};
  assign wire33 = wire6;
  assign wire34 = wire2[(5'h13):(4'hb)];
  assign wire35 = ($signed($signed({reg16})) - ((!reg26) ?
                      $unsigned((reg23[(4'ha):(3'h6)] + {wire34})) : {$unsigned((~|reg26)),
                          {reg15}}));
  assign wire36 = ((~^$unsigned($signed({reg13,
                      (8'hab)}))) >>> ($unsigned(((reg25 ?
                          (8'hab) : reg11) ^~ $signed((8'ha5)))) ?
                      $signed((~(reg18 - wire5))) : reg15));
  assign wire37 = $signed(wire33);
  assign wire38 = wire31;
  module39 #() modinst65 (.y(wire64), .wire41(reg15), .clk(clk), .wire42(reg12), .wire40(reg30), .wire43(wire32));
  assign wire66 = ($unsigned($unsigned((wire35 ? {reg28} : $signed((8'hb9))))) ?
                      {$signed(($signed(wire31) ~^ wire32[(4'hb):(3'h5)])),
                          {(((7'h44) < wire7) ? (~^reg27) : $signed(wire7)),
                              ({wire64, reg20} ?
                                  $unsigned(reg20) : $signed((8'hb0)))}} : ((+($unsigned(wire9) ?
                              $signed(reg25) : $unsigned(wire35))) ?
                          $unsigned((~|(reg27 > reg11))) : (reg11 >= reg29)));
  assign wire67 = reg20;
endmodule

module module39
#(parameter param62 = ((((((7'h43) != (8'hb4)) ? ((8'h9d) != (8'ha7)) : ((8'hb5) ? (8'hae) : (8'h9f))) ? ((~^(8'ha2)) ? (+(8'hb5)) : {(8'hbd), (8'ha4)}) : (~&((8'ha3) ? (8'hab) : (8'hb6)))) ? (((-(8'hb1)) ? {(8'haf)} : (~|(8'ha6))) - (((8'haa) * (7'h41)) == ((8'ha5) ? (8'hae) : (8'hac)))) : (^~(~((8'hbf) == (7'h43))))) ? (+(|{{(8'hbb), (8'ha9)}, ((7'h42) ? (7'h43) : (8'hab))})) : (({(8'hb9)} ? (8'ha3) : {((8'hbe) ~^ (8'ha7))}) <= (|(&((8'hb0) ? (8'h9c) : (8'hba)))))), 
parameter param63 = (((((param62 ? param62 : (8'h9d)) ^ (-param62)) ? ((~|param62) ? (param62 ? param62 : (7'h43)) : {param62, param62}) : (!(&(8'hb4)))) ? {param62} : param62) ? ((((param62 > param62) | param62) ? (!(~param62)) : ({param62, param62} ? (~&param62) : {param62})) ? (&((param62 ? (7'h42) : param62) ^ (~&param62))) : (~^{{param62}})) : (param62 ? (param62 >>> ((param62 ? param62 : param62) ? (param62 ? param62 : param62) : param62)) : (8'ha7))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire43;
  input wire signed [(3'h6):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire44 = ({({((8'hb4) ? wire42 : wire41),
                              (wire42 ^ wire43)} >= (wire40[(2'h2):(2'h2)] ?
                              $unsigned(wire42) : ((8'hb0) ? wire41 : wire40))),
                          $unsigned(((wire42 & wire41) != $signed(wire42)))} ?
                      (!(8'hb0)) : (|wire40[(2'h3):(1'h0)]));
  assign wire45 = wire42[(2'h3):(1'h1)];
  assign wire46 = $signed(wire43[(1'h1):(1'h0)]);
  assign wire47 = ($signed(wire40[(2'h2):(2'h2)]) * (wire46 >>> wire46));
  assign wire48 = $unsigned((~&wire44));
  assign wire49 = wire47;
  always
    @(posedge clk) begin
      reg50 <= $signed(wire47[(1'h1):(1'h1)]);
      reg51 <= wire48;
      reg52 <= (($unsigned($signed(wire41[(2'h2):(1'h0)])) ?
          reg50 : {(wire45 ?
                  wire40 : wire42[(2'h3):(2'h3)])}) >= ((reg50 << (~|(wire49 ?
          wire45 : wire45))) ~^ (+$signed(reg50[(3'h4):(1'h1)]))));
      reg53 <= wire47[(2'h2):(1'h1)];
      reg54 <= (((^~$unsigned(reg50[(3'h6):(3'h5)])) ?
          wire46[(1'h1):(1'h0)] : ($signed($signed((8'hae))) ?
              $unsigned($unsigned(wire41)) : ((wire46 ? wire44 : reg50) ?
                  (~^reg52) : reg52))) ^~ (|(8'hb4)));
    end
  assign wire55 = ($signed(wire45) ?
                      $unsigned($signed($signed(((8'ha6) ?
                          wire44 : wire48)))) : wire48);
  assign wire56 = wire49;
  assign wire57 = $unsigned($unsigned((~wire47)));
  assign wire58 = $unsigned(wire40[(1'h0):(1'h0)]);
  assign wire59 = $unsigned(wire49[(3'h7):(3'h6)]);
  assign wire60 = $signed(wire46);
  assign wire61 = {wire42, wire45[(3'h5):(3'h4)]};
endmodule
