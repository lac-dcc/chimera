module top
#(parameter param202 = ((7'h42) ? (|{{((8'ha7) > (8'hb2))}, (^((8'ha5) ? (8'haa) : (8'hbc)))}) : (8'haf)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h278):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire197;
  wire signed [(5'h15):(1'h0)] wire196;
  wire signed [(5'h12):(1'h0)] wire195;
  wire signed [(5'h11):(1'h0)] wire194;
  wire signed [(4'ha):(1'h0)] wire193;
  wire [(3'h7):(1'h0)] wire192;
  wire [(4'h9):(1'h0)] wire190;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire199;
  wire [(4'he):(1'h0)] wire200;
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire190,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire25,
                 wire26,
                 wire27,
                 wire38,
                 wire132,
                 wire199,
                 wire200,
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
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire5 = {wire4};
  assign wire6 = ((!$unsigned(($unsigned((7'h42)) & wire5[(2'h2):(1'h0)]))) == (((8'hb8) <= wire0[(2'h3):(2'h3)]) == $signed(wire5)));
  assign wire7 = ((!{$signed({wire0})}) ~^ (|wire4));
  assign wire8 = {($unsigned($signed($signed(wire6))) - wire0[(3'h7):(1'h0)])};
  assign wire9 = wire3[(3'h7):(2'h2)];
  assign wire10 = $unsigned($unsigned($unsigned(wire0)));
  always
    @(posedge clk) begin
      reg11 <= (8'ha4);
      reg12 <= (({wire6} & wire1) && $unsigned($unsigned($unsigned((wire1 * wire10)))));
      if (wire6[(4'ha):(2'h3)])
        begin
          reg13 <= (~(wire0[(1'h0):(1'h0)] ? wire3[(2'h3):(2'h2)] : wire10));
          reg14 <= (+$signed({wire3, $unsigned(reg12)}));
          if ($unsigned((~^wire10[(3'h7):(3'h6)])))
            begin
              reg15 <= (((|reg14[(4'ha):(3'h6)]) ?
                  $signed(wire2) : (({(8'hb1), reg11} || (wire10 ?
                      (8'hb4) : wire4)) == (&(wire4 ?
                      wire0 : wire10)))) >> $signed((wire2 | wire2[(1'h1):(1'h0)])));
              reg16 <= (^$unsigned($unsigned((((8'hb7) && reg11) ?
                  (wire6 ? wire7 : (8'ha0)) : reg14))));
              reg17 <= (8'had);
            end
          else
            begin
              reg15 <= wire9;
              reg16 <= $unsigned((((wire4 ?
                  {reg16} : reg11[(2'h2):(2'h2)]) ^~ (~^$signed(wire0))) & (~|reg12[(4'hd):(1'h0)])));
              reg17 <= {(wire4[(2'h3):(2'h2)] ?
                      reg14[(5'h10):(4'hc)] : wire0[(3'h4):(2'h3)])};
            end
          reg18 <= (8'ha2);
          if (wire9[(4'hc):(3'h6)])
            begin
              reg19 <= (&(&(8'ha8)));
              reg20 <= ((reg14 ?
                  $signed(($signed(wire0) || wire0)) : ((wire6 <= (~^reg18)) && wire3)) ^~ (7'h41));
              reg21 <= (wire7 * $unsigned(reg20[(1'h0):(1'h0)]));
            end
          else
            begin
              reg19 <= (^~wire6[(5'h10):(4'hd)]);
              reg20 <= (($unsigned((~$unsigned((8'hb6)))) == $signed($unsigned($unsigned(wire2)))) || (-(((wire9 ?
                          (8'h9f) : reg12) ?
                      wire2 : ((8'h9c) ? wire10 : wire2)) ?
                  $signed(wire7) : ((wire8 ?
                      (8'hb6) : reg21) ^ $signed(wire9)))));
              reg21 <= ($signed($unsigned((+(reg14 * reg14)))) > (&(^wire7[(4'hd):(3'h5)])));
            end
        end
      else
        begin
          if ($signed({reg20[(3'h6):(1'h0)]}))
            begin
              reg13 <= {(((7'h40) >> ($signed(wire1) || (+wire1))) && $signed(wire4[(2'h2):(2'h2)])),
                  ($signed($unsigned((8'hab))) >>> $unsigned(reg20[(4'h9):(3'h5)]))};
              reg14 <= $signed((wire4[(1'h1):(1'h0)] < reg12[(1'h1):(1'h1)]));
              reg15 <= (^(!reg14[(4'hc):(1'h1)]));
              reg16 <= reg11[(1'h1):(1'h1)];
            end
          else
            begin
              reg13 <= $signed($signed((-((wire5 == wire10) ?
                  $unsigned(wire6) : reg16))));
              reg14 <= ((~|reg11[(2'h3):(1'h1)]) ?
                  $signed($signed($signed(reg12[(4'h9):(2'h2)]))) : wire5[(2'h2):(1'h0)]);
            end
        end
      reg22 <= ((+wire3) ?
          (wire8[(4'hd):(4'ha)] > (8'hb1)) : $signed((((^wire4) ?
              (reg21 ? reg18 : wire7) : ((8'hac) >= (8'ha8))) * {(reg15 ?
                  wire7 : wire3)})));
    end
  always
    @(posedge clk) begin
      reg23 <= $unsigned($unsigned((reg18 ~^ wire9[(2'h2):(1'h1)])));
      reg24 <= (wire6 ?
          (((wire3 ? (reg20 > reg12) : (8'hb9)) ?
              {{reg23},
                  $unsigned(reg11)} : (reg23 ^~ ((8'hbb) & wire5))) - $unsigned($signed((wire5 ~^ reg16)))) : $signed($signed(((wire5 ?
                  wire8 : wire7) ?
              (^reg20) : (reg20 ? reg18 : reg14)))));
    end
  assign wire25 = (($unsigned($unsigned(((8'h9d) ? wire8 : reg14))) ?
                      (^reg14) : reg12) >>> $signed((reg21[(3'h5):(3'h4)] ?
                      ((wire1 ? wire6 : reg13) ?
                          wire8[(2'h3):(1'h0)] : wire0[(1'h0):(1'h0)]) : $unsigned(reg24[(4'hb):(2'h2)]))));
  assign wire26 = (($unsigned(($signed(reg18) ?
                              (reg13 - reg21) : reg13[(3'h4):(2'h2)])) ?
                          wire4 : $unsigned($signed(((8'hbd) ?
                              wire6 : reg20)))) ?
                      $signed($unsigned($signed((reg12 ?
                          (8'hb4) : wire5)))) : {(^(^(^reg21)))});
  assign wire27 = ((^~wire5[(2'h2):(2'h2)]) | $signed(reg17));
  always
    @(posedge clk) begin
      reg28 <= ((($signed((wire2 || reg22)) ?
          {$signed(reg13)} : $signed($unsigned(reg18))) >= $signed((~|wire5))) & wire2[(1'h1):(1'h0)]);
      reg29 <= ($signed((~&$signed(((8'ha6) ? reg18 : wire0)))) ?
          (8'hbf) : reg19);
      if (reg19)
        begin
          if ((wire2 ?
              (wire6 != $unsigned((reg13[(2'h2):(1'h0)] >> $signed(reg13)))) : $signed($signed(((reg19 ?
                  reg16 : wire26) <= reg16)))))
            begin
              reg30 <= ((|$unsigned($unsigned($unsigned(reg23)))) >>> $signed((+$unsigned($signed(wire6)))));
              reg31 <= (wire25[(4'hd):(1'h0)] + (8'hac));
              reg32 <= ($signed((($unsigned((8'hbe)) ?
                      wire9[(4'h8):(3'h7)] : reg24[(2'h2):(2'h2)]) ?
                  (^~(~^reg19)) : $signed((reg20 ?
                      (7'h43) : reg22)))) <<< $signed($signed(($signed(reg12) || $signed((8'haf))))));
              reg33 <= wire7[(3'h7):(1'h0)];
            end
          else
            begin
              reg30 <= $signed({(((reg23 ? wire0 : (8'ha4)) ?
                          $unsigned(wire6) : $signed(wire25)) ?
                      ((!(8'h9d)) ?
                          $signed(reg24) : ((8'hb5) || wire6)) : $unsigned((reg13 ?
                          wire3 : (8'h9e)))),
                  (^(~^$unsigned(wire9)))});
              reg31 <= (reg30[(3'h5):(2'h3)] && (~wire6));
            end
          reg34 <= (wire25 ?
              wire0[(3'h5):(2'h3)] : ($signed((&$unsigned(wire25))) ^ reg11));
          reg35 <= (~^(~&((wire25[(4'hb):(4'ha)] ^ (wire2 ? reg23 : reg34)) ?
              (+reg14[(4'hb):(3'h4)]) : (wire5 | $signed(reg24)))));
        end
      else
        begin
          if ({($signed(reg28[(4'hf):(4'h8)]) > ($unsigned(wire2) ?
                  ($unsigned(wire26) <= (wire5 >= reg18)) : (wire27[(4'ha):(4'h9)] ?
                      (!wire7) : $signed(reg35))))})
            begin
              reg30 <= $signed(reg29[(4'hb):(3'h7)]);
            end
          else
            begin
              reg30 <= wire6[(3'h7):(1'h0)];
              reg31 <= wire9;
              reg32 <= {$signed({((&reg21) > (~(8'hac)))})};
              reg33 <= ((~|(reg11 ?
                  (((8'h9c) ?
                      (8'ha9) : reg13) || (reg34 && reg16)) : $unsigned(wire2[(1'h1):(1'h0)]))) * (wire3[(2'h2):(1'h0)] ^~ ($signed((wire0 ?
                  reg24 : reg28)) - (wire10 ?
                  {wire3, wire5} : reg11[(3'h4):(1'h1)]))));
              reg34 <= {wire0[(3'h6):(2'h3)],
                  (((+(reg12 ? wire27 : wire0)) ?
                      ($signed(reg34) != (~^wire0)) : wire10[(2'h3):(2'h2)]) & (~wire25[(4'h9):(4'h9)]))};
            end
          reg35 <= (|($signed((8'hae)) ?
              ((~^$signed(wire9)) ?
                  $unsigned({reg16}) : wire10[(1'h0):(1'h0)]) : (($unsigned(reg28) ?
                  $unsigned(wire5) : (reg21 ?
                      reg13 : reg22)) >>> ($signed(reg22) ?
                  (~^(8'hbf)) : (reg21 <<< reg32)))));
          reg36 <= (~{((reg13[(2'h3):(1'h0)] >> $unsigned(wire0)) ?
                  reg18[(3'h6):(2'h2)] : ((~|reg32) ?
                      (reg18 ? wire3 : reg35) : (&(8'h9e)))),
              wire2[(1'h1):(1'h1)]});
          reg37 <= (reg21[(1'h0):(1'h0)] + {(+$unsigned(reg34[(4'ha):(1'h0)]))});
        end
    end
  assign wire38 = ((^~(|((+(8'hbd)) ? reg18[(4'hd):(2'h3)] : (~^wire4)))) ?
                      reg21 : wire2);
  module39 #() modinst133 (.wire42(reg24), .wire44(reg35), .wire41(wire4), .clk(clk), .y(wire132), .wire43(wire9), .wire40(wire25));
  module134 #() modinst191 (.wire138(wire3), .wire135(reg36), .wire137(wire5), .clk(clk), .wire136(reg32), .y(wire190), .wire139(reg29));
  assign wire192 = ($signed($signed(reg37)) & reg33[(3'h6):(3'h4)]);
  assign wire193 = {{reg20}, reg31};
  assign wire194 = (|wire27[(2'h3):(2'h2)]);
  assign wire195 = {$unsigned(($unsigned((~&reg37)) == $signed($unsigned(wire27)))),
                       ($signed(($unsigned(reg22) ? reg30 : $signed(wire26))) ?
                           (~^$signed({reg36})) : (!$unsigned($unsigned(wire2))))};
  assign wire196 = ((~|(+$unsigned($signed(wire0)))) | (reg35 ?
                       $signed($signed({wire9})) : (|wire2)));
  module119 #() modinst198 (wire197, clk, reg33, reg35, wire195, reg23);
  assign wire199 = ((~|(~wire7)) ^~ (~$unsigned(((wire0 ?
                       reg16 : wire10) >>> {(8'ha1), wire25}))));
  module119 #() modinst201 (.wire122(reg36), .clk(clk), .wire121(reg11), .y(wire200), .wire123(wire194), .wire120(reg29));
endmodule

module module134
#(parameter param188 = (&((((|(8'h9f)) ? {(8'hb8), (8'hbf)} : (&(8'hbe))) ? ({(8'hb1)} ? (8'hb9) : ((8'hbc) >>> (7'h43))) : (~((8'hbb) ? (8'hbf) : (8'hb8)))) ? (~^((|(8'ha3)) + (-(8'hb9)))) : ((((8'ha5) ? (8'haf) : (8'hbe)) ? ((8'hb3) ? (7'h44) : (8'haf)) : ((8'ha1) + (8'ha4))) ? (((8'haa) ? (8'hbe) : (8'hbb)) ? {(7'h40), (8'h9f)} : (~|(8'hb0))) : (|((8'had) ~^ (8'ha5)))))), 
parameter param189 = ((param188 ? param188 : (|param188)) ? (param188 & ((param188 ? {param188} : {param188}) ? ((param188 - param188) & (~|param188)) : (param188 ? (~&param188) : {param188, param188}))) : param188))
(y, clk, wire135, wire136, wire137, wire138, wire139);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire135;
  input wire [(5'h13):(1'h0)] wire136;
  input wire signed [(5'h15):(1'h0)] wire137;
  input wire [(4'hd):(1'h0)] wire138;
  input wire signed [(5'h12):(1'h0)] wire139;
  wire [(3'h6):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire177;
  wire signed [(5'h14):(1'h0)] wire176;
  wire signed [(2'h2):(1'h0)] wire175;
  wire [(4'h8):(1'h0)] wire173;
  wire signed [(3'h6):(1'h0)] wire172;
  wire [(4'h8):(1'h0)] wire171;
  wire [(4'hc):(1'h0)] wire169;
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg [(4'hb):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg185 = (1'h0);
  reg [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg182 = (1'h0);
  reg [(4'hd):(1'h0)] reg179 = (1'h0);
  reg [(4'h8):(1'h0)] reg174 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg141 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire173,
                 wire172,
                 wire171,
                 wire169,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg179,
                 reg174,
                 reg140,
                 reg141,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg140 <= ((~|$unsigned(wire139)) ?
          (~|wire139[(3'h6):(2'h3)]) : $signed(wire137));
      reg141 <= $unsigned(({$signed(((8'hba) == (8'h9e)))} <= ((wire139[(3'h5):(1'h0)] >= (wire136 ?
              (8'ha0) : (8'ha7))) ?
          wire136[(1'h0):(1'h0)] : $signed(wire135))));
    end
  module142 #() modinst170 (wire169, clk, wire136, wire138, wire135, reg140);
  assign wire171 = $signed((($signed(((8'h9c) ? wire139 : wire135)) ?
                       reg140 : {$unsigned((8'hbf)), (7'h41)}) >> wire169));
  assign wire172 = ({$unsigned($unsigned(reg141)), reg140} ?
                       wire139 : wire135[(1'h1):(1'h0)]);
  assign wire173 = (((~wire138) ?
                       ((8'hbf) ?
                           {wire137} : (^~$signed(wire169))) : (&((reg141 >> wire136) ?
                           wire172[(2'h3):(2'h3)] : (reg140 ?
                               wire137 : (8'hbd))))) >>> (wire137[(5'h10):(5'h10)] && (&wire172[(3'h5):(3'h4)])));
  always
    @(posedge clk) begin
      reg174 <= (reg140[(2'h2):(1'h0)] ?
          (-$unsigned($signed(wire173[(2'h3):(1'h1)]))) : (+(~|{$unsigned((8'hbd)),
              $signed(wire136)})));
    end
  assign wire175 = (8'had);
  assign wire176 = wire137[(4'hb):(4'hb)];
  assign wire177 = (($signed($signed($unsigned((8'hb0)))) ?
                       wire139[(5'h11):(1'h1)] : $unsigned(($unsigned((8'hb8)) ?
                           $signed(wire137) : (8'h9f)))) << wire172[(3'h6):(2'h2)]);
  assign wire178 = $unsigned(($signed($signed(wire172[(3'h5):(3'h5)])) ?
                       wire135 : $unsigned(((&wire171) ?
                           (wire173 < wire175) : (wire177 >> reg174)))));
  always
    @(posedge clk) begin
      reg179 <= ((wire169 | $unsigned({{wire175, wire173}})) ?
          $unsigned({$signed((&reg174)),
              (!(^wire171))}) : (+reg174[(1'h0):(1'h0)]));
    end
  assign wire180 = ({(-$signed(wire135[(1'h1):(1'h1)]))} ?
                       $unsigned((^~$signed($signed(reg140)))) : $signed(($signed(wire138) ?
                           ((wire136 * (7'h42)) ?
                               (reg179 > wire135) : wire136[(4'hc):(2'h3)]) : {((8'hb5) ?
                                   wire137 : wire136),
                               (wire175 ? wire175 : wire139)})));
  assign wire181 = $unsigned((8'hbe));
  always
    @(posedge clk) begin
      if ($signed((wire136[(3'h5):(1'h1)] ?
          ($unsigned((wire137 ? wire138 : (8'h9c))) ?
              $signed($unsigned(wire173)) : $signed((wire181 * reg179))) : $unsigned((!(8'hb9))))))
        begin
          reg182 <= ({((wire171[(3'h4):(2'h3)] ?
                  wire177 : $signed(wire181)) >= {$signed((8'hab))}),
              wire177[(2'h2):(1'h0)]} != reg141);
          if ($unsigned(wire172[(2'h3):(1'h1)]))
            begin
              reg183 <= (+$signed(((((8'hae) | wire177) ?
                  (wire180 ?
                      wire180 : wire178) : (+wire173)) + $unsigned({wire135}))));
              reg184 <= (~(!$signed(($unsigned(wire177) && (wire169 || reg182)))));
              reg185 <= (~|(($unsigned($signed(wire136)) | ($unsigned(reg174) ?
                      (wire135 <<< reg179) : reg174)) ?
                  ($unsigned($signed(wire176)) ?
                      (!wire180) : ((~^wire169) ~^ $unsigned((8'ha3)))) : $unsigned({wire180[(3'h7):(3'h7)]})));
              reg186 <= ((reg184[(5'h10):(4'h9)] ?
                  (|($signed((8'h9c)) * (7'h40))) : {wire135[(2'h3):(2'h2)]}) | $signed(($unsigned({(8'h9d)}) && $signed($unsigned(wire177)))));
            end
          else
            begin
              reg183 <= {reg141, (wire181 > (~wire180))};
              reg184 <= $signed((~wire176));
            end
        end
      else
        begin
          reg182 <= $signed((-$signed(wire171[(4'h8):(4'h8)])));
          reg183 <= ((~^$unsigned((8'hb5))) > ({(^(reg182 ? wire172 : (8'h9f))),
                  wire173} ?
              ((8'had) ?
                  {(&wire138)} : {(wire176 ? reg179 : (8'hae)),
                      $signed(wire135)}) : $unsigned($unsigned($unsigned(reg179)))));
          reg184 <= $signed((7'h43));
          if ($unsigned($unsigned({($unsigned(reg141) ?
                  reg183 : wire178[(3'h5):(2'h3)]),
              reg186})))
            begin
              reg185 <= $unsigned(((($unsigned(wire136) ~^ wire137[(4'hd):(2'h3)]) - wire178[(2'h2):(1'h1)]) + (($signed(wire176) == $unsigned((8'hb6))) ?
                  $unsigned((wire169 ?
                      reg186 : wire169)) : $signed(wire177[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg185 <= $signed((((wire173 ?
                          (wire139 << wire138) : (^~wire139)) ?
                      ((~&reg185) || $signed(wire169)) : (~(wire169 ?
                          wire180 : reg140))) ?
                  ($signed({wire181}) ?
                      ($signed(reg186) ?
                          reg182 : (reg186 ?
                              reg174 : wire173)) : reg141) : {(^reg141),
                      ((reg174 >= wire138) - reg174)}));
              reg186 <= (((^$unsigned((wire177 ? (8'hb6) : wire135))) ?
                  {$signed((wire181 - reg182))} : {$signed((-wire175))}) == $signed(reg184));
              reg187 <= (!(wire181 ?
                  reg141[(3'h7):(1'h1)] : (!$unsigned($unsigned(wire139)))));
            end
        end
    end
endmodule

module module39
#(parameter param131 = (8'ha3))
(y, clk, wire40, wire41, wire42, wire43, wire44);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire40;
  input wire signed [(4'ha):(1'h0)] wire41;
  input wire signed [(4'hf):(1'h0)] wire42;
  input wire [(4'hf):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire107;
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  assign y = {wire129,
                 wire118,
                 wire109,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire107,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg50,
                 reg51,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 (1'h0)};
  assign wire45 = $unsigned(((~wire41[(4'h9):(3'h5)]) <= (~|(8'hb1))));
  assign wire46 = (8'ha8);
  assign wire47 = $unsigned(wire46);
  assign wire48 = (wire45 >> wire43);
  assign wire49 = {(wire41 ?
                          $signed($unsigned({wire42, wire46})) : {{{wire46,
                                      wire43},
                                  (wire44 ? wire41 : wire40)}})};
  always
    @(posedge clk) begin
      reg50 <= $unsigned(wire42[(4'h8):(1'h1)]);
      reg51 <= ($unsigned(wire44[(1'h1):(1'h1)]) ^~ wire47);
    end
  assign wire52 = (8'hb2);
  assign wire53 = (-(wire41 + {reg51[(1'h1):(1'h0)], {(~&reg51), (~^wire41)}}));
  assign wire54 = (wire41 ?
                      ($signed($unsigned($signed(wire42))) && $signed((~$unsigned(wire48)))) : (!wire44));
  assign wire55 = (~^$signed($signed($unsigned((wire42 | wire47)))));
  assign wire56 = wire46[(3'h4):(3'h4)];
  assign wire57 = ((wire44 && wire49) ?
                      (wire54 + $unsigned($signed((wire56 ?
                          (8'haf) : (8'h9f))))) : $signed(($signed((~|wire47)) ?
                          ((-wire41) ?
                              $unsigned(wire47) : $unsigned(wire52)) : ($signed((7'h40)) ?
                              wire43 : $unsigned(wire54)))));
  always
    @(posedge clk) begin
      if ($signed((-(~&wire49[(4'h9):(3'h4)]))))
        begin
          reg58 <= wire47[(3'h5):(1'h0)];
          if (wire43)
            begin
              reg59 <= wire45;
              reg60 <= $unsigned((wire56[(4'h8):(3'h4)] <= (-($unsigned(wire56) ?
                  wire44 : ((8'haf) ? (8'hb2) : wire47)))));
              reg61 <= ($unsigned($unsigned(reg51)) ?
                  wire56 : {wire41[(4'h9):(4'h9)]});
              reg62 <= reg50;
            end
          else
            begin
              reg59 <= (|(^~wire52));
              reg60 <= reg60;
              reg61 <= $signed((!$signed($unsigned((+wire40)))));
            end
          reg63 <= reg62[(2'h3):(1'h1)];
          reg64 <= $signed($unsigned((($signed((8'ha4)) * (reg59 ?
              wire54 : wire41)) < $unsigned((wire49 ^~ wire44)))));
          reg65 <= $unsigned($unsigned(wire48[(3'h6):(3'h4)]));
        end
      else
        begin
          if ((wire49 <= ($unsigned(reg51) ?
              reg60[(4'hf):(4'he)] : $unsigned($unsigned($unsigned(wire47))))))
            begin
              reg58 <= (wire53[(3'h7):(3'h4)] ?
                  {{{$unsigned(wire47)},
                          wire49[(4'ha):(3'h6)]}} : wire46[(1'h1):(1'h0)]);
              reg59 <= $unsigned(({((~^wire44) ?
                      $unsigned(reg65) : {(8'h9d), wire47}),
                  (8'hac)} + ((+(8'h9f)) ^ $signed({wire40}))));
              reg60 <= $signed({(wire47 ?
                      ((wire54 != wire44) ?
                          {reg64} : $unsigned(reg60)) : $unsigned((reg64 != (8'h9f)))),
                  (($unsigned((7'h40)) ?
                      $signed(wire52) : {wire47}) * $signed(reg59[(2'h2):(1'h1)]))});
              reg61 <= (~&$unsigned({$signed((~&reg65)),
                  ((wire57 >> (7'h44)) ?
                      reg62[(1'h0):(1'h0)] : $signed(reg51))}));
            end
          else
            begin
              reg58 <= ($signed((wire53 ~^ ($signed(wire41) > (&(8'hb3))))) ?
                  (8'hbb) : $signed($unsigned($unsigned($signed((8'h9d))))));
              reg59 <= ($unsigned($unsigned((^(reg64 & wire45)))) ?
                  (reg63 ?
                      wire49[(2'h3):(1'h0)] : ((!(wire43 >>> (8'hac))) != wire54[(4'h9):(3'h4)])) : wire55[(4'h8):(2'h3)]);
              reg60 <= $signed((((wire41[(3'h5):(2'h3)] ?
                      $signed(reg59) : (wire46 + wire56)) ?
                  reg62 : $unsigned(((8'ha9) ?
                      wire53 : wire43))) > $unsigned((wire57[(3'h6):(2'h2)] | $signed(wire43)))));
              reg61 <= wire42;
            end
          if (({(($unsigned(wire48) ?
                          wire46[(2'h2):(1'h1)] : (reg51 ? wire40 : wire47)) ?
                      (reg50[(1'h1):(1'h1)] & $unsigned(wire46)) : $signed((wire48 ?
                          reg51 : wire43)))} ?
              ((-wire48[(4'h8):(3'h4)]) ?
                  $signed((-wire44)) : {wire40[(4'hf):(4'h9)],
                      (-(^~wire55))}) : wire42))
            begin
              reg62 <= $signed(wire44);
              reg63 <= $signed(wire55[(1'h0):(1'h0)]);
              reg64 <= (wire40 ?
                  (-{(~$unsigned(wire41))}) : (^~reg61[(4'hd):(3'h4)]));
              reg65 <= (7'h42);
            end
          else
            begin
              reg62 <= (|((((reg64 ^ wire48) ?
                      (~|(8'hb2)) : wire44) >> wire54) ?
                  (~|(reg58 ?
                      (reg58 ? wire40 : wire56) : (~&(8'hb3)))) : (8'hb3)));
              reg63 <= reg64;
              reg64 <= $signed((($unsigned((reg61 < (8'ha9))) ?
                      {wire41[(3'h7):(2'h3)],
                          (reg65 ? wire48 : (8'hba))} : wire57[(4'h8):(3'h7)]) ?
                  reg58[(1'h1):(1'h1)] : (reg59 + ((~wire47) <= (reg50 ?
                      reg60 : wire56)))));
              reg65 <= ((!wire55[(3'h7):(3'h6)]) ^ (($unsigned((wire52 * wire55)) ^ ((wire43 ^~ wire44) ?
                      (wire56 ~^ reg64) : wire53[(3'h5):(1'h0)])) ?
                  (|wire42[(4'h8):(3'h7)]) : ((~^{wire48}) ?
                      (-((8'ha2) ?
                          reg59 : wire57)) : (|wire43[(3'h7):(3'h7)]))));
              reg66 <= (+(8'hb2));
            end
          reg67 <= wire57[(3'h4):(1'h0)];
          if ($signed((|reg62[(3'h4):(3'h4)])))
            begin
              reg68 <= $unsigned(wire57[(3'h5):(3'h4)]);
              reg69 <= $unsigned(wire56);
              reg70 <= $unsigned((((&reg61[(3'h6):(3'h5)]) ?
                      reg60[(2'h3):(1'h1)] : $unsigned(reg64)) ?
                  (~|reg61) : ($unsigned((|(8'hb6))) && reg63[(2'h2):(1'h1)])));
              reg71 <= ((~reg66[(1'h1):(1'h1)]) & wire43[(2'h3):(1'h0)]);
            end
          else
            begin
              reg68 <= wire48;
            end
          reg72 <= (((~$unsigned(wire48)) << (wire52[(2'h3):(2'h2)] >>> (7'h42))) <= $signed($unsigned(wire49[(3'h5):(3'h4)])));
        end
    end
  module73 #() modinst108 (.wire77(reg61), .wire74(wire54), .y(wire107), .wire75(wire42), .wire76(wire46), .clk(clk));
  assign wire109 = wire44[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg110 <= $unsigned(reg51[(3'h5):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg111 <= $unsigned((&(({reg59} || (reg65 >> wire43)) < (reg70[(2'h3):(2'h3)] ?
          ((8'h9e) << wire41) : (^reg64)))));
      reg112 <= $unsigned({$signed(((~^reg110) & ((8'hac) ? reg72 : reg68))),
          (wire40 & ((~|reg67) != {wire42, reg72}))});
      reg113 <= (+reg110);
    end
  always
    @(posedge clk) begin
      reg114 <= $signed($signed($unsigned((~|wire53[(1'h1):(1'h0)]))));
      reg115 <= (-(({{wire57}, {reg72}} ? $signed($signed(reg50)) : wire44) ?
          $signed(reg62) : (~$unsigned((~^wire57)))));
      reg116 <= reg114;
      reg117 <= $unsigned(($unsigned(wire109) ? reg67 : reg71[(3'h5):(3'h5)]));
    end
  assign wire118 = $signed((wire45[(2'h2):(1'h1)] + (wire44[(1'h0):(1'h0)] || reg116)));
  module119 #() modinst130 (wire129, clk, reg63, reg112, wire41, wire44);
endmodule

module module119  (y, clk, wire123, wire122, wire121, wire120);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire123;
  input wire [(4'he):(1'h0)] wire122;
  input wire signed [(4'ha):(1'h0)] wire121;
  input wire signed [(4'hc):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire128;
  wire signed [(4'hf):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire124;
  assign y = {wire128, wire127, wire126, wire125, wire124, (1'h0)};
  assign wire124 = ((((+(^wire120)) || wire122) ?
                           {(|(wire120 ? wire123 : wire123)),
                               wire122} : (wire121[(4'ha):(3'h4)] ?
                               ((wire121 ?
                                   (8'h9f) : wire122) ^ wire120) : ($unsigned(wire123) ?
                                   (wire122 ?
                                       (8'hb8) : wire123) : $unsigned(wire121)))) ?
                       $signed($unsigned({wire120[(4'h9):(3'h7)],
                           (wire121 ?
                               wire122 : wire121)})) : $unsigned(wire120[(1'h1):(1'h0)]));
  assign wire125 = ((^$unsigned($unsigned({wire120, wire123}))) ?
                       (-wire124[(3'h7):(3'h5)]) : ($unsigned(wire124) ?
                           wire122[(1'h0):(1'h0)] : (wire123 ^ ((wire123 ?
                               wire124 : wire121) << (wire120 ?
                               wire121 : wire120)))));
  assign wire126 = ($signed($signed($unsigned(wire124[(1'h0):(1'h0)]))) ?
                       (~&(&(wire124 ?
                           (wire125 ? wire123 : wire125) : (wire123 ?
                               wire123 : wire122)))) : (+{$unsigned(wire121),
                           $signed($unsigned(wire120))}));
  assign wire127 = $unsigned(wire126);
  assign wire128 = wire125;
endmodule

module module73
#(parameter param105 = (^{(+{((8'hbb) ? (8'ha1) : (8'h9d))})}), 
parameter param106 = (((((-param105) <<< (~|param105)) ? ((|(8'hbb)) >= param105) : ((param105 >= param105) ^~ param105)) ? (^param105) : ((param105 ^~ (8'hb6)) ~^ ((^param105) || (+param105)))) * (~&param105)))
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire77;
  input wire signed [(4'h9):(1'h0)] wire76;
  input wire signed [(4'hf):(1'h0)] wire75;
  input wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire81,
                 wire80,
                 wire79,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg86,
                 reg84,
                 reg83,
                 reg82,
                 reg78,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg78 <= wire76;
    end
  assign wire79 = (^~wire76[(3'h7):(1'h0)]);
  assign wire80 = ($unsigned(wire77) ?
                      ((&wire74) * wire76[(3'h4):(2'h2)]) : $unsigned(wire79));
  assign wire81 = $unsigned((&(~^wire77)));
  always
    @(posedge clk) begin
      reg82 <= wire80[(3'h7):(3'h4)];
      reg83 <= $signed({$unsigned(($unsigned(reg78) ?
              (~&wire77) : $signed(wire79)))});
      reg84 <= (~^($signed($signed((8'hbf))) >> wire76));
    end
  assign wire85 = (^($signed(($signed(reg82) == wire75)) > $unsigned(reg84[(4'hc):(1'h1)])));
  always
    @(posedge clk) begin
      reg86 <= $unsigned(({($signed(wire77) <= ((8'hb6) ? wire80 : wire79)),
          wire74[(4'h9):(3'h4)]} == (wire74 ?
          (+(wire74 ? (8'ha2) : wire77)) : ((wire79 ? reg78 : reg78) < (wire81 ?
              wire77 : reg84)))));
    end
  assign wire87 = (((&({wire81,
                      (8'ha0)} >>> $unsigned(reg78))) || (|(~^$unsigned(wire77)))) >> (~&$unsigned({$signed(wire81)})));
  assign wire88 = wire76[(4'h9):(1'h1)];
  assign wire89 = (~^wire81[(2'h3):(1'h0)]);
  assign wire90 = (wire85[(3'h4):(1'h0)] <<< ((-reg86) ? wire80 : (8'ha7)));
  assign wire91 = reg82;
  assign wire92 = ((($signed(wire89) ? wire89 : (+wire76)) ?
                          {wire76} : (($signed(wire89) ?
                                  (wire89 != wire88) : (wire80 >> wire87)) ?
                              ((wire90 ? wire80 : (8'haf)) & {wire89,
                                  wire88}) : wire90[(4'h8):(3'h7)])) ?
                      ($unsigned((wire79[(2'h3):(2'h3)] ?
                          wire88 : (8'ha8))) + $signed(wire89[(4'hc):(4'hc)])) : wire88);
  always
    @(posedge clk) begin
      reg93 <= {wire77, ((8'hab) <<< wire87[(4'h9):(1'h0)])};
      if ($signed({$unsigned({reg86[(3'h5):(1'h0)], wire85[(1'h0):(1'h0)]}),
          $signed(((~^wire91) ? reg84[(4'ha):(2'h2)] : (wire92 || reg93)))}))
        begin
          reg94 <= reg93;
          reg95 <= wire91;
          reg96 <= wire91;
        end
      else
        begin
          if ($unsigned(wire91[(3'h6):(3'h5)]))
            begin
              reg94 <= (~&$signed($signed((+$unsigned(wire80)))));
              reg95 <= wire88[(3'h7):(2'h2)];
              reg96 <= wire91;
              reg97 <= ($signed($signed(reg78[(4'hd):(4'h8)])) <= reg84[(3'h7):(3'h5)]);
              reg98 <= (&($signed(reg94) ?
                  {$signed((wire90 ? wire85 : (8'ha7)))} : reg97));
            end
          else
            begin
              reg94 <= reg78[(2'h2):(1'h1)];
              reg95 <= {(~&(|($signed(reg97) ?
                      (reg97 && wire76) : $unsigned(reg86)))),
                  (~^reg93[(1'h1):(1'h0)])};
              reg96 <= $signed({{wire92, wire89[(4'h9):(1'h1)]}});
              reg97 <= $signed(wire81);
              reg98 <= wire79[(1'h0):(1'h0)];
            end
          reg99 <= {{$unsigned((~|reg98[(1'h1):(1'h1)])),
                  ({(wire91 >>> reg95)} >= {(~|wire85)})}};
          reg100 <= ((reg78[(3'h4):(2'h3)] ?
              (+$unsigned((reg98 ? reg83 : wire85))) : $signed(({wire75,
                      wire81} ?
                  (wire74 ?
                      reg98 : reg93) : $unsigned(reg98)))) - (~^$unsigned({$unsigned(reg95),
              (&wire88)})));
          reg101 <= $signed((+$signed($unsigned((wire76 & wire77)))));
        end
      reg102 <= $unsigned((^~{wire74}));
      reg103 <= wire74;
      reg104 <= reg93;
    end
endmodule

module module142
#(parameter param167 = {((^~(((8'ha4) ? (8'ha5) : (8'ha3)) ? ((8'hab) ^~ (8'ha7)) : ((8'ha7) ? (8'ha6) : (8'hae)))) <<< {((-(7'h44)) && ((8'hba) ? (8'h9e) : (8'hb9))), (((8'hb0) ? (8'hb1) : (8'hbf)) - (+(7'h40)))})}, 
parameter param168 = ((~{(+(param167 ? (8'hab) : param167))}) * (param167 >= (~^(param167 ? {(8'hb2)} : (param167 ? param167 : param167))))))
(y, clk, wire146, wire145, wire144, wire143);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire146;
  input wire signed [(2'h2):(1'h0)] wire145;
  input wire signed [(2'h2):(1'h0)] wire144;
  input wire [(3'h6):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire166;
  wire signed [(4'hb):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire signed [(3'h4):(1'h0)] wire163;
  wire signed [(3'h4):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire [(3'h6):(1'h0)] wire150;
  wire [(4'hc):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire147;
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg159 = (1'h0);
  reg [(2'h2):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg148,
                 (1'h0)};
  assign wire147 = wire146;
  always
    @(posedge clk) begin
      reg148 <= $signed(wire146);
    end
  assign wire149 = wire146;
  assign wire150 = ($signed(wire149) <<< wire143[(2'h2):(1'h1)]);
  assign wire151 = ($unsigned($unsigned((~&wire147[(4'h8):(2'h2)]))) ?
                       (wire147 ?
                           wire144[(2'h2):(1'h0)] : (8'hab)) : ($unsigned(($unsigned(wire144) ?
                           (wire145 ?
                               wire145 : wire144) : $unsigned(wire145))) ~^ (-wire144[(1'h0):(1'h0)])));
  assign wire152 = wire143;
  assign wire153 = (wire144 ^~ (~wire151[(4'hd):(2'h2)]));
  assign wire154 = $unsigned(wire151[(2'h2):(1'h1)]);
  assign wire155 = $signed(wire153);
  always
    @(posedge clk) begin
      if (wire145[(1'h0):(1'h0)])
        begin
          reg156 <= (-(-wire147[(1'h0):(1'h0)]));
        end
      else
        begin
          reg156 <= wire155;
          reg157 <= wire144;
          reg158 <= (8'h9e);
          if (wire154[(5'h11):(2'h3)])
            begin
              reg159 <= {$unsigned({(wire155 <<< reg148[(2'h3):(2'h3)]),
                      wire144}),
                  $signed(reg156[(3'h4):(2'h3)])};
              reg160 <= {wire154, (7'h41)};
              reg161 <= ($unsigned($unsigned(($unsigned(wire150) ~^ {wire149,
                  reg160}))) >>> (~(~&{{wire144, wire146}})));
              reg162 <= (((8'hb8) ?
                      $unsigned(($unsigned(wire151) ?
                          {wire153} : reg156[(1'h1):(1'h0)])) : wire152[(3'h5):(1'h1)]) ?
                  $unsigned((~|wire155)) : $signed(wire149[(1'h1):(1'h0)]));
            end
          else
            begin
              reg159 <= ($signed($signed(((~^(8'hb3)) ?
                  (8'ha1) : (wire143 ? reg148 : reg157)))) < (wire146 ?
                  ({$signed(reg157)} ?
                      reg158 : $signed(wire144[(2'h2):(2'h2)])) : (reg161 ?
                      $unsigned(wire144) : wire152[(3'h6):(1'h0)])));
            end
        end
    end
  assign wire163 = (wire151 ?
                       ($signed((8'ha7)) ?
                           (&$signed((reg158 ?
                               wire147 : reg159))) : ($signed(wire149[(4'ha):(1'h0)]) && (8'haf))) : $signed((~|($signed(wire146) == $signed((8'hae))))));
  assign wire164 = wire153[(1'h1):(1'h1)];
  assign wire165 = $signed(reg156[(3'h5):(3'h5)]);
  assign wire166 = (wire149[(4'hc):(1'h0)] ?
                       ($unsigned(reg161) ?
                           wire144 : {((wire145 ? wire164 : wire152) ?
                                   {reg161, reg160} : (reg159 ?
                                       wire163 : reg161)),
                               $signed((wire163 ?
                                   reg157 : wire164))}) : reg159[(4'h8):(2'h3)]);
endmodule
