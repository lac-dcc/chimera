module top
#(parameter param227 = ((8'hb9) >= (((((8'ha9) >> (8'ha8)) == {(8'haf), (8'hac)}) ? {((8'ha3) ? (8'ha5) : (8'ha1))} : ((+(8'ha0)) >>> (~(7'h40)))) ? (7'h41) : (({(8'hb0), (8'h9c)} ? ((8'hb2) ? (8'hac) : (8'ha0)) : ((8'had) ? (8'hb2) : (8'hb4))) ? (((8'had) <<< (8'h9f)) ? ((8'hb8) ? (8'haa) : (8'haf)) : ((8'h9e) ? (8'ha3) : (8'hb5))) : (((7'h41) <= (8'ha8)) ? ((7'h40) * (8'hb5)) : ((8'ha3) < (8'ha1)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h299):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire225;
  wire signed [(4'hf):(1'h0)] wire224;
  wire [(4'hc):(1'h0)] wire223;
  wire signed [(4'h9):(1'h0)] wire222;
  wire [(5'h14):(1'h0)] wire221;
  wire [(2'h3):(1'h0)] wire219;
  wire signed [(3'h5):(1'h0)] wire218;
  wire signed [(4'hc):(1'h0)] wire216;
  wire [(4'hb):(1'h0)] wire191;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  reg [(5'h11):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  assign y = {wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire219,
                 wire218,
                 wire216,
                 wire191,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg226,
                 reg4,
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
                 reg31,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if ($unsigned((wire2 >> ((~&{(8'hbd)}) || (~&(+wire2))))))
            begin
              reg4 <= (~^($signed(($unsigned(wire1) ~^ ((8'hba) | (8'hac)))) * (wire0 ?
                  (((8'hb0) ? wire3 : wire0) ?
                      $unsigned(wire0) : $unsigned((8'hb9))) : $unsigned(wire0))));
            end
          else
            begin
              reg4 <= ($unsigned(wire2) ?
                  wire0[(1'h1):(1'h1)] : $signed(wire2));
              reg5 <= ($signed(wire1) ?
                  ({((wire2 ? wire2 : wire3) ?
                          (|(8'hb4)) : (wire1 ?
                              (8'hab) : wire1))} != (!$unsigned(reg4))) : $signed(((^~$signed(reg4)) ?
                      (8'ha3) : (-(wire0 >> wire2)))));
            end
          if ($signed({(wire1[(4'hd):(2'h3)] ?
                  (|(^~reg5)) : {reg4[(4'hc):(1'h0)], (&(8'ha4))})}))
            begin
              reg6 <= (((((~&wire3) ? (reg5 & wire2) : (-wire0)) ?
                          wire2 : {(8'hba), (wire1 > wire0)}) ?
                      ($unsigned((wire2 >>> wire3)) ?
                          wire2 : wire3) : $unsigned($signed($unsigned(wire2)))) ?
                  ($signed(((^(8'hbb)) >> wire1)) + (8'haa)) : wire0);
              reg7 <= reg4[(4'h9):(2'h3)];
              reg8 <= (!($signed({{reg6}}) != ((&(~reg6)) * {wire3})));
              reg9 <= wire3;
            end
          else
            begin
              reg6 <= (8'hb3);
              reg7 <= {$unsigned((((reg9 ~^ reg9) ?
                          $unsigned(wire2) : (~|wire0)) ?
                      wire0 : $signed((8'h9e)))),
                  $signed((8'hb3))};
              reg8 <= $signed({(+wire3), reg9});
              reg9 <= reg4;
            end
        end
      else
        begin
          reg4 <= (^wire1);
          reg5 <= wire3;
          if ($unsigned((($unsigned($signed(wire0)) ? reg7 : (8'hae)) ?
              {$signed((~|(8'ha9)))} : wire3[(4'ha):(4'h9)])))
            begin
              reg6 <= wire1;
            end
          else
            begin
              reg6 <= wire2;
              reg7 <= ((&$signed($unsigned($unsigned((8'had))))) ?
                  (reg6[(3'h4):(1'h0)] ?
                      ((!(^reg7)) ?
                          (^~$unsigned((8'ha0))) : (8'ha5)) : $unsigned(reg9)) : ((((reg9 == reg6) < $unsigned(wire3)) ?
                          (reg6[(2'h2):(1'h0)] ~^ wire1[(4'ha):(3'h6)]) : (8'hbc)) ?
                      ({(reg5 ^ (8'hb5)), (-reg8)} ?
                          reg4[(1'h1):(1'h1)] : $signed($unsigned((8'hbb)))) : (((reg6 & reg5) ?
                              $signed(reg9) : (reg8 ? (7'h43) : reg6)) ?
                          $signed({reg7, reg9}) : (|reg7))));
              reg8 <= (reg4[(3'h5):(3'h5)] | reg5[(1'h0):(1'h0)]);
              reg9 <= wire1;
              reg10 <= ($signed(reg6) ?
                  $signed((($signed(reg8) - (&reg6)) ?
                      (~&((7'h42) == wire3)) : $signed((8'hb4)))) : $unsigned(wire2));
            end
        end
      reg11 <= $unsigned($signed((((~&reg10) ~^ (wire1 + wire1)) << (wire1 ?
          (wire3 ^~ reg10) : ((8'ha0) <<< (8'ha5))))));
      reg12 <= (8'hbf);
      reg13 <= (reg11[(2'h3):(1'h1)] ?
          (^$unsigned(((&reg6) && (reg4 ?
              wire2 : wire1)))) : $signed(reg7[(3'h5):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if (reg8)
        begin
          reg14 <= reg10;
          reg15 <= (~(8'haf));
          reg16 <= (-$unsigned((^~$unsigned($signed((8'ha2))))));
          reg17 <= reg15[(2'h2):(1'h0)];
          reg18 <= wire1;
        end
      else
        begin
          reg14 <= $unsigned(reg12);
          reg15 <= reg13;
          reg16 <= $signed((8'hbc));
        end
      reg19 <= ($unsigned($unsigned((|wire3[(1'h1):(1'h0)]))) ?
          (($unsigned((~&wire0)) ^~ (~^(~&(8'haa)))) ?
              (($unsigned(wire1) ? (8'hbf) : (!reg14)) ?
                  reg18 : reg15[(4'hb):(4'h8)]) : ((wire3 <= {wire3,
                  reg7}) > reg13)) : {{((wire3 ? reg12 : (8'ha1)) ?
                      ((7'h43) ? reg15 : wire2) : ((8'hb2) ? reg17 : reg12)),
                  $unsigned(reg7)},
              (reg13[(1'h0):(1'h0)] <= (~^(reg9 ? reg14 : reg15)))});
      reg20 <= ((~&wire1) ^ (((~^$unsigned((8'ha0))) ?
          (reg16[(2'h2):(2'h2)] ? {reg6} : $unsigned(wire2)) : ((~&reg12) ?
              (reg16 >= reg4) : wire1)) & reg17[(4'hd):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg21 <= (^reg13[(2'h2):(1'h1)]);
      if ((&reg17[(4'hf):(1'h1)]))
        begin
          reg22 <= reg11;
          reg23 <= (+({((reg6 && reg15) ? reg11 : (~&reg4)),
                  {(reg11 ? reg18 : reg17)}} ?
              (($unsigned(reg10) ? ((8'had) ? (8'hb5) : reg9) : $signed(reg7)) ?
                  ($unsigned(reg19) ~^ (-reg14)) : reg10) : reg13[(4'ha):(3'h5)]));
        end
      else
        begin
          if ($unsigned($signed($unsigned({$signed(reg7), $signed((8'hba))}))))
            begin
              reg22 <= {($unsigned(reg16) <= (-($unsigned(reg19) + $signed(wire2)))),
                  reg10[(5'h10):(3'h5)]};
              reg23 <= (((-{reg10[(1'h1):(1'h0)],
                  ((8'hbd) ? reg10 : reg20)}) >> ($unsigned($signed(reg4)) ?
                  $signed(reg22[(1'h1):(1'h0)]) : reg21[(3'h4):(3'h4)])) == ($unsigned((reg20[(3'h6):(2'h2)] ?
                  (~&reg7) : (reg22 ? (8'hb9) : (8'hac)))) <<< $signed(({reg4,
                  (8'ha2)} >> reg20))));
              reg24 <= reg10;
              reg25 <= wire1[(1'h0):(1'h0)];
            end
          else
            begin
              reg22 <= reg4[(1'h0):(1'h0)];
            end
          reg26 <= {$signed(wire1)};
          reg27 <= (($unsigned($signed(reg25[(2'h2):(2'h2)])) ?
                  ($signed(wire3) ?
                      (((7'h44) > reg13) ?
                          {(8'ha9), wire2} : (+(8'ha2))) : (reg11 ?
                          {reg4} : $unsigned(reg22))) : (reg15[(1'h0):(1'h0)] && (8'h9e))) ?
              ($signed((reg20 ? $signed(reg7) : (reg8 && wire1))) ?
                  ((&(^~reg18)) >= (~(reg25 ?
                      reg20 : reg25))) : ((&reg15[(2'h2):(1'h0)]) == ((reg18 ?
                          wire3 : reg7) ?
                      wire2 : (~|wire1)))) : (reg9 ~^ wire1[(3'h7):(3'h7)]));
          reg28 <= wire2;
        end
      if ($signed($unsigned((|reg14[(3'h7):(1'h1)]))))
        begin
          reg29 <= $unsigned($unsigned(reg20[(1'h1):(1'h1)]));
        end
      else
        begin
          if (reg5[(5'h10):(4'he)])
            begin
              reg29 <= (((7'h44) ?
                  reg15[(1'h0):(1'h0)] : {reg12[(4'hf):(4'hf)]}) <= reg16);
              reg30 <= wire1;
              reg31 <= $unsigned({reg20, $signed($signed(reg27))});
            end
          else
            begin
              reg29 <= reg23;
            end
        end
    end
  assign wire32 = $signed(($unsigned($signed(reg29)) * reg15));
  assign wire33 = ($unsigned($signed(reg10[(4'ha):(1'h1)])) ?
                      $signed(($unsigned({(8'haf)}) ^~ $unsigned((^~reg30)))) : ((-reg10) >= wire0));
  assign wire34 = (((reg25[(3'h4):(2'h3)] ?
                          ($unsigned(reg25) ?
                              (reg22 ?
                                  reg29 : reg13) : (~(8'hb2))) : $unsigned((~|(8'hbd)))) ?
                      $signed(reg9[(1'h0):(1'h0)]) : $unsigned(reg27[(1'h1):(1'h1)])) + wire1[(3'h6):(1'h0)]);
  assign wire35 = $unsigned(((!{$signed(wire0)}) <<< reg13[(4'hb):(1'h1)]));
  assign wire36 = (~|wire35[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (reg19[(3'h4):(2'h3)])
        begin
          if ((~$unsigned(reg16[(1'h1):(1'h1)])))
            begin
              reg37 <= reg19;
              reg38 <= reg6[(1'h0):(1'h0)];
              reg39 <= $signed(reg28[(3'h4):(3'h4)]);
            end
          else
            begin
              reg37 <= (((^~$unsigned((reg5 * reg14))) == ($unsigned(reg30[(3'h4):(1'h1)]) | $unsigned($unsigned(reg29)))) * ((~|reg7) + {(reg6[(3'h4):(1'h1)] != $unsigned(reg8))}));
            end
          reg40 <= (!{$unsigned(reg15[(2'h2):(1'h0)])});
          reg41 <= reg8;
          reg42 <= reg37[(2'h2):(1'h1)];
          reg43 <= wire35;
        end
      else
        begin
          if ((8'ha1))
            begin
              reg37 <= ((^~(~reg24[(4'hd):(4'ha)])) ?
                  (~|{$unsigned((^~(7'h40))),
                      ($signed(reg15) ?
                          reg31 : $signed((8'ha6)))}) : ({(-(reg30 ?
                              reg22 : (8'h9f)))} ?
                      $unsigned(reg18) : reg26[(4'h9):(1'h1)]));
              reg38 <= {(|(reg17 ?
                      {reg27[(3'h5):(3'h5)],
                          $unsigned(reg9)} : $unsigned((wire36 ?
                          wire3 : reg12))))};
              reg39 <= ($unsigned(((((8'ha5) ? reg11 : (8'hbf)) < reg41) ?
                  reg25[(2'h2):(1'h0)] : (reg6[(3'h5):(1'h0)] & $signed(reg27)))) > reg13);
            end
          else
            begin
              reg37 <= {reg14[(3'h5):(3'h5)]};
              reg38 <= reg16[(4'hd):(3'h6)];
              reg39 <= {(8'ha5),
                  $unsigned(($unsigned((reg13 >>> wire33)) ?
                      reg20 : ((&wire34) ?
                          $unsigned(reg16) : reg12[(4'hf):(1'h0)])))};
              reg40 <= $unsigned(reg21);
            end
          reg41 <= (~reg9);
          reg42 <= ($signed(((reg21[(5'h10):(4'ha)] ?
              (wire0 + wire0) : ((8'hb3) ?
                  reg42 : (8'ha8))) << $unsigned(reg37))) << reg8[(3'h6):(2'h3)]);
        end
      reg44 <= ($signed((($signed(reg21) ? $signed(reg10) : (~|reg30)) ?
          wire0 : ((reg24 & (8'hbb)) ?
              (reg41 && reg11) : reg24))) >> (reg17[(4'h9):(3'h5)] ?
          $signed((|$signed(reg40))) : (reg27 * wire33)));
      reg45 <= $signed(reg31);
      reg46 <= reg37[(3'h6):(2'h3)];
      reg47 <= reg7[(3'h5):(2'h2)];
    end
  module48 #() modinst192 (.wire53(reg12), .y(wire191), .wire49(reg22), .wire52(reg13), .wire50(reg41), .wire51(reg46), .clk(clk));
  module193 #() modinst217 (wire216, clk, reg4, reg15, reg47, reg26);
  assign wire218 = {$unsigned($unsigned(($signed(reg8) ?
                           (+wire35) : $signed((8'hb8))))),
                       {$signed((~$unsigned(reg9)))}};
  module193 #() modinst220 (wire219, clk, reg7, reg17, reg24, reg9);
  assign wire221 = ($signed((~&$signed(((8'hb1) ? (7'h41) : wire3)))) ?
                       $unsigned($unsigned(reg29[(2'h2):(1'h0)])) : ({reg4} ?
                           $unsigned((reg7[(3'h7):(3'h6)] <= $signed(reg19))) : reg27[(1'h1):(1'h1)]));
  assign wire222 = (&((~&((!wire33) <<< (reg41 ?
                       (8'h9f) : reg7))) - $signed(($signed(reg17) ?
                       (!reg6) : reg47[(4'h8):(4'h8)]))));
  assign wire223 = {reg40[(2'h3):(2'h2)]};
  assign wire224 = {reg45[(3'h4):(3'h4)]};
  assign wire225 = reg7;
  always
    @(posedge clk) begin
      reg226 <= $unsigned({((~&(!wire222)) ?
              reg25[(3'h5):(3'h5)] : $unsigned((&(8'hb4))))});
    end
endmodule

module module193  (y, clk, wire197, wire196, wire195, wire194);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire197;
  input wire [(5'h14):(1'h0)] wire196;
  input wire [(5'h14):(1'h0)] wire195;
  input wire [(3'h5):(1'h0)] wire194;
  wire signed [(4'he):(1'h0)] wire215;
  wire [(5'h13):(1'h0)] wire214;
  wire signed [(3'h5):(1'h0)] wire213;
  wire [(2'h3):(1'h0)] wire212;
  wire signed [(4'ha):(1'h0)] wire211;
  wire signed [(4'hf):(1'h0)] wire210;
  wire [(4'hc):(1'h0)] wire209;
  wire [(5'h14):(1'h0)] wire208;
  wire signed [(5'h14):(1'h0)] wire207;
  wire [(4'hc):(1'h0)] wire206;
  wire [(5'h11):(1'h0)] wire205;
  wire [(4'hf):(1'h0)] wire204;
  wire signed [(4'hc):(1'h0)] wire203;
  wire [(5'h14):(1'h0)] wire202;
  wire signed [(4'hd):(1'h0)] wire201;
  wire signed [(4'hb):(1'h0)] wire200;
  wire signed [(4'hf):(1'h0)] wire199;
  wire signed [(4'hf):(1'h0)] wire198;
  assign y = {wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 (1'h0)};
  assign wire198 = wire194[(2'h2):(1'h0)];
  assign wire199 = $signed($unsigned(wire198));
  assign wire200 = ((+(~(~wire197[(3'h5):(3'h5)]))) ^~ ((-wire194) ?
                       wire194[(2'h3):(1'h0)] : $unsigned((|(wire194 >> wire196)))));
  assign wire201 = wire194[(1'h0):(1'h0)];
  assign wire202 = $unsigned($unsigned(wire195));
  assign wire203 = (wire197 ?
                       ($unsigned(wire201) ?
                           $signed(wire200[(3'h4):(3'h4)]) : $signed(({wire199,
                               wire200} & $unsigned(wire196)))) : ((!$signed(wire202[(5'h10):(4'hc)])) ?
                           $unsigned({$signed(wire200),
                               wire200}) : (((~^(8'h9e)) ^ wire198[(3'h5):(3'h4)]) ?
                               $unsigned({(8'haf)}) : $signed(wire201[(4'hb):(3'h6)]))));
  assign wire204 = wire201;
  assign wire205 = $signed(wire196);
  assign wire206 = (~wire194[(3'h4):(1'h0)]);
  assign wire207 = (~^(wire206 ?
                       {(+(wire198 & wire195)),
                           (~&((8'hbb) || wire204))} : $signed(wire205)));
  assign wire208 = $signed($signed(($unsigned($unsigned(wire197)) ?
                       wire205[(4'h8):(3'h6)] : ((wire206 ?
                           wire198 : wire196) != $signed(wire199)))));
  assign wire209 = (wire204 == (~wire198));
  assign wire210 = ($unsigned({$signed(wire199),
                           $unsigned((wire202 - wire196))}) ?
                       wire207 : (($unsigned((wire197 * (8'ha3))) ?
                               $unsigned((~wire194)) : {wire206}) ?
                           $unsigned((8'hab)) : ($unsigned((wire196 ?
                                   wire197 : wire198)) ?
                               {wire208, (8'ha3)} : (~&$unsigned(wire195)))));
  assign wire211 = {({$unsigned(wire203)} >>> $signed($signed(((8'hb0) ?
                           wire203 : wire200)))),
                       $unsigned(((wire198 >>> wire207) << (^~$unsigned(wire204))))};
  assign wire212 = (((8'hb4) ?
                           $signed(((wire206 ^ wire204) ?
                               (wire200 ?
                                   wire207 : wire197) : wire205[(4'he):(4'h9)])) : wire195) ?
                       (($signed((wire211 ^~ wire199)) ?
                           wire194 : ({wire211} > wire202[(4'hf):(3'h7)])) && {$unsigned($signed(wire202)),
                           ((~(8'haf)) ?
                               (wire205 ^~ wire197) : ((7'h44) - (8'hbd)))}) : (({$unsigned(wire199)} ?
                           $unsigned($unsigned(wire207)) : $signed(wire204[(2'h3):(1'h0)])) >= (~^(7'h42))));
  assign wire213 = (^(8'hbe));
  assign wire214 = wire203[(4'h8):(3'h5)];
  assign wire215 = {$unsigned(wire202),
                       (wire202 ?
                           wire211[(2'h3):(2'h3)] : (^{wire197, wire199}))};
endmodule

module module48
#(parameter param190 = ({(~^(((8'haa) ~^ (8'hb1)) << {(8'hb1), (8'hb6)}))} ? {{((|(8'hb6)) >>> ((8'haf) < (8'had)))}} : ((((~&(8'haf)) | ((7'h41) ? (7'h40) : (8'ha6))) > ((-(8'h9c)) ? ((8'hab) && (8'hbe)) : (~&(8'hb9)))) ^ ((((8'hb9) - (8'ha7)) ? (-(8'h9f)) : {(8'hb5), (8'h9c)}) ~^ (((7'h43) - (8'h9d)) & ((8'hbd) ? (8'hbe) : (8'haf)))))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire53;
  input wire signed [(5'h12):(1'h0)] wire52;
  input wire [(5'h10):(1'h0)] wire51;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire [(5'h12):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire189;
  wire [(2'h2):(1'h0)] wire188;
  wire [(3'h5):(1'h0)] wire187;
  wire signed [(5'h11):(1'h0)] wire186;
  wire signed [(5'h11):(1'h0)] wire169;
  wire signed [(5'h11):(1'h0)] wire127;
  wire signed [(4'ha):(1'h0)] wire126;
  wire [(4'h8):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire [(2'h2):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire84;
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg [(4'h9):(1'h0)] reg181 = (1'h0);
  reg [(4'h9):(1'h0)] reg180 = (1'h0);
  reg [(2'h2):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg175 = (1'h0);
  reg [(4'ha):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire169,
                 wire127,
                 wire126,
                 wire116,
                 wire115,
                 wire113,
                 wire84,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg86,
                 reg87,
                 reg88,
                 (1'h0)};
  module54 #() modinst85 (.wire57(wire53), .wire55(wire50), .wire56(wire51), .y(wire84), .clk(clk), .wire58(wire52));
  always
    @(posedge clk) begin
      reg86 <= (+$unsigned((&(&$unsigned((8'ha1))))));
      reg87 <= (wire50[(4'ha):(3'h4)] ?
          (($signed($signed(wire52)) ?
              wire53 : $signed(wire52[(4'hd):(4'hb)])) >= $signed(((wire49 != wire49) <= {wire53}))) : $unsigned($signed(wire49)));
      reg88 <= ((~|$signed((-$unsigned(wire52)))) <= reg87[(3'h4):(2'h2)]);
    end
  module89 #() modinst114 (wire113, clk, reg88, wire50, wire84, wire51, wire49);
  assign wire115 = {(($unsigned((wire51 ?
                               (8'h9d) : wire50)) == wire50[(3'h7):(1'h0)]) ?
                           $signed($unsigned(((8'hbb) ?
                               reg88 : (8'h9d)))) : ((((8'hbb) ?
                                   wire84 : wire53) * {wire113, wire50}) ?
                               $unsigned((&reg87)) : ({(8'hab), (8'ha2)} ?
                                   (~wire52) : (wire49 ? wire50 : reg87)))),
                       $signed((8'ha0))};
  assign wire116 = (&$signed(wire52[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg117 <= reg86[(3'h4):(2'h3)];
      reg118 <= $signed(reg87);
      reg119 <= {$unsigned(($signed(reg118) ? wire49 : $signed((+reg118))))};
      if (reg117[(5'h10):(4'ha)])
        begin
          reg120 <= $unsigned(reg118);
          reg121 <= (+$unsigned(($unsigned($unsigned(wire116)) ?
              ((wire53 ? reg120 : wire49) ?
                  $signed((7'h40)) : $signed(reg117)) : $signed($unsigned(reg118)))));
        end
      else
        begin
          if (({reg120[(1'h1):(1'h0)],
              wire53[(3'h4):(2'h3)]} * (&($unsigned(((8'hb7) | reg120)) ^ $unsigned(reg88[(3'h4):(2'h2)])))))
            begin
              reg120 <= reg87;
              reg121 <= reg86[(3'h7):(2'h2)];
            end
          else
            begin
              reg120 <= wire84[(4'hc):(3'h4)];
              reg121 <= ((~(8'hbb)) != reg121[(3'h4):(1'h0)]);
              reg122 <= $unsigned($unsigned($signed((7'h41))));
              reg123 <= wire115[(5'h12):(4'hc)];
            end
          reg124 <= ($unsigned((~|(((7'h44) || wire49) == (wire53 << wire84)))) ?
              ($unsigned(((&wire115) ^ (wire49 && wire116))) * $unsigned(((reg118 ^ wire113) | (8'ha4)))) : $signed(reg119));
          reg125 <= reg87;
        end
    end
  assign wire126 = (~^(!reg124[(3'h4):(1'h1)]));
  assign wire127 = (+({wire52[(1'h0):(1'h0)]} ~^ wire113));
  module128 #() modinst170 (.wire132(wire115), .clk(clk), .wire130(reg120), .wire131(wire127), .y(wire169), .wire129(reg87));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(((~&(~wire116)) >> $unsigned($signed(wire49))))))
        begin
          if ($signed((({(~&wire84)} ^~ $signed($signed(wire113))) < ((^~{(8'hbc)}) ?
              reg125 : wire115[(4'he):(1'h0)]))))
            begin
              reg171 <= ((!reg122) - $unsigned(wire169));
              reg172 <= {reg118[(4'hc):(4'h9)]};
              reg173 <= $signed($signed($signed(((+reg123) >>> wire53[(1'h0):(1'h0)]))));
              reg174 <= (8'ha9);
            end
          else
            begin
              reg171 <= reg122;
              reg172 <= ($unsigned(($signed((^~wire169)) < (~^{wire115}))) ?
                  (!$unsigned(((reg88 ? wire53 : reg172) ?
                      (|wire51) : reg86))) : $unsigned($unsigned($signed((8'hba)))));
              reg173 <= wire116[(2'h3):(1'h1)];
              reg174 <= reg87[(3'h4):(3'h4)];
            end
        end
      else
        begin
          reg171 <= ((~^$signed($signed((8'hba)))) ?
              (|$unsigned((8'hb2))) : ((^$unsigned(wire51)) <= (|(wire53[(1'h0):(1'h0)] - (reg125 || wire115)))));
          reg172 <= $signed((wire84 ?
              wire53 : (reg119[(2'h3):(1'h0)] ? reg125 : wire113)));
          reg173 <= ((($unsigned((reg122 > reg119)) <= (!$signed(wire52))) >= wire84[(4'he):(2'h2)]) ?
              reg117 : {($unsigned($signed((8'hbe))) ~^ $signed((wire52 ^ wire51))),
                  (|wire115[(4'ha):(2'h2)])});
          reg174 <= reg121[(1'h0):(1'h0)];
          reg175 <= reg120;
        end
      reg176 <= (!(reg118[(3'h6):(1'h1)] ?
          $signed({(wire169 >= wire49), {reg174, (8'ha8)}}) : ({(reg174 ?
                  (8'ha4) : reg120)} | (^((7'h43) ? reg174 : wire52)))));
    end
  always
    @(posedge clk) begin
      reg177 <= $signed((~^reg172[(2'h3):(2'h2)]));
    end
  always
    @(posedge clk) begin
      if (reg87[(1'h0):(1'h0)])
        begin
          reg178 <= ((|(~{{reg119},
              (reg120 ?
                  reg86 : (8'hb4))})) == (wire116 || wire169[(4'hd):(2'h2)]));
          reg179 <= (~^(~wire51[(4'h9):(3'h7)]));
          reg180 <= $unsigned($unsigned({{{wire115, wire51}}}));
        end
      else
        begin
          reg178 <= (-{(~|(reg174[(4'h8):(3'h4)] ?
                  reg86[(4'hb):(3'h6)] : $unsigned(reg176))),
              $unsigned(((wire169 != reg120) <<< wire52))});
        end
      reg181 <= (8'ha2);
      reg182 <= {(&reg123[(2'h3):(2'h3)])};
      reg183 <= {wire84, reg120[(3'h5):(1'h0)]};
    end
  always
    @(posedge clk) begin
      reg184 <= (|$signed(wire50));
      reg185 <= $unsigned(reg172[(2'h2):(1'h1)]);
    end
  assign wire186 = (($signed((^~(wire127 ~^ wire115))) ?
                       $signed($signed((reg86 || reg86))) : {((reg88 ?
                                   reg178 : reg179) ?
                               $unsigned(wire127) : (reg183 >>> reg88)),
                           $signed((reg118 & (8'hb9)))}) >> {$signed((~&$signed((8'h9d))))});
  assign wire187 = {(|{reg175[(4'hd):(3'h4)]}),
                       $signed((|$unsigned(wire113[(1'h0):(1'h0)])))};
  assign wire188 = $signed((wire186[(3'h7):(1'h0)] ?
                       $signed({(!wire53)}) : {(8'hb5),
                           ({(8'hb0)} == (^reg183))}));
  assign wire189 = wire113[(2'h2):(2'h2)];
endmodule

module module128  (y, clk, wire132, wire131, wire130, wire129);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire132;
  input wire signed [(5'h11):(1'h0)] wire131;
  input wire signed [(4'he):(1'h0)] wire130;
  input wire [(4'hb):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire167;
  wire signed [(4'he):(1'h0)] wire166;
  wire [(2'h2):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(3'h5):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire137;
  wire signed [(5'h13):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire135;
  wire [(3'h7):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire133;
  reg signed [(5'h10):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 (1'h0)};
  assign wire133 = {$unsigned(wire132)};
  assign wire134 = ((((wire131 ? $signed(wire133) : ((8'hbf) + wire129)) ?
                           (8'ha7) : (8'h9c)) ?
                       ($unsigned(wire129) ?
                           $signed((^~wire129)) : (wire131 ?
                               $unsigned((8'hac)) : $signed((8'h9d)))) : wire132) > wire133[(3'h5):(2'h3)]);
  assign wire135 = wire133;
  assign wire136 = (wire135[(3'h4):(2'h2)] ?
                       (wire133 != wire135) : (wire131 || wire129));
  assign wire137 = (wire135 ~^ $signed({($unsigned(wire135) ?
                           (wire132 ? wire134 : wire133) : (!(8'hb0))),
                       {(8'ha7)}}));
  assign wire138 = (~wire132);
  assign wire139 = wire129;
  assign wire140 = wire131[(1'h1):(1'h1)];
  assign wire141 = $unsigned((~&$unsigned($unsigned(wire134))));
  assign wire142 = (~$unsigned($signed($unsigned(wire139))));
  assign wire143 = wire131[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      if ((!{((wire131[(4'hb):(4'ha)] ?
              (wire131 ?
                  wire142 : (7'h40)) : {wire131}) && $unsigned(((8'haf) < wire140))),
          (wire129 ?
              (wire130[(2'h3):(2'h2)] ?
                  wire139 : wire139[(2'h2):(1'h0)]) : ((wire132 ?
                      wire138 : wire142) ?
                  $signed(wire131) : $unsigned((8'hbd))))}))
        begin
          reg144 <= (+$signed(wire138[(4'hd):(2'h3)]));
          reg145 <= wire131;
          reg146 <= $signed({wire140[(3'h5):(2'h3)]});
          reg147 <= wire136[(3'h6):(3'h5)];
        end
      else
        begin
          reg144 <= (reg144[(4'h8):(3'h6)] & (|$signed(wire131[(4'hf):(3'h4)])));
        end
      reg148 <= {({(((8'ha2) ? wire136 : wire130) || {wire140}),
                  $unsigned({wire141, wire132})} ?
              wire131[(4'hb):(4'h8)] : wire135)};
      reg149 <= (wire134[(1'h0):(1'h0)] ?
          (wire143 ?
              wire134[(3'h7):(2'h2)] : wire139) : (^wire139[(3'h7):(2'h2)]));
      reg150 <= (($unsigned(reg147) ?
              reg148 : {{$signed(reg146), $unsigned(wire130)}}) ?
          ({{{(8'h9d), wire133}, (wire142 ? wire135 : wire133)},
              $unsigned($unsigned(wire143))} * (!$unsigned(wire136))) : $unsigned((wire132[(3'h4):(3'h4)] <= $signed($signed(reg148)))));
    end
  always
    @(posedge clk) begin
      reg151 <= (+$signed((wire132 >>> (-(8'hab)))));
      if ($unsigned($unsigned(wire141)))
        begin
          if (wire130[(4'h8):(3'h7)])
            begin
              reg152 <= $unsigned((($signed($signed(wire137)) >>> (reg148[(3'h5):(2'h2)] <<< (!(8'ha9)))) ?
                  wire143[(1'h1):(1'h1)] : (reg147[(1'h1):(1'h1)] < $unsigned(wire139[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg152 <= reg149[(3'h5):(1'h0)];
              reg153 <= (-($unsigned(((&wire143) ?
                  $signed(wire137) : $unsigned(wire129))) ^ ($signed((~^reg144)) ^~ wire133[(2'h3):(1'h1)])));
              reg154 <= $unsigned(((~|(+(~^wire135))) && {((reg147 >= wire132) != ((8'hb7) ?
                      reg151 : wire136)),
                  (reg151[(4'hd):(4'h8)] != $signed((7'h43)))}));
              reg155 <= wire141;
            end
        end
      else
        begin
          reg152 <= (^wire135[(1'h0):(1'h0)]);
          if (wire142[(2'h2):(2'h2)])
            begin
              reg153 <= $signed((~|({$signed(wire131),
                  reg149[(1'h1):(1'h1)]} << wire143[(1'h0):(1'h0)])));
              reg154 <= (!$signed(wire129));
              reg155 <= wire136;
              reg156 <= reg147;
              reg157 <= wire134;
            end
          else
            begin
              reg153 <= {(((^~wire141) == $signed({wire137})) == (~reg157[(1'h1):(1'h0)]))};
              reg154 <= (reg153[(3'h4):(2'h3)] ?
                  $unsigned(((+(reg145 & wire133)) ?
                      $signed($signed(reg156)) : ((~|(8'hbb)) - {reg157,
                          (8'ha4)}))) : (~|{$signed((8'hbc)), (8'ha4)}));
              reg155 <= (reg145[(2'h2):(2'h2)] | reg146);
            end
          if (reg149)
            begin
              reg158 <= (wire129 >= wire131[(5'h11):(5'h11)]);
              reg159 <= ((reg150[(4'h9):(2'h3)] - wire134) ?
                  (^(wire141[(3'h4):(1'h1)] >>> ($unsigned(reg151) ?
                      (-reg150) : {reg157,
                          wire135}))) : $unsigned({reg146[(1'h0):(1'h0)]}));
              reg160 <= {$signed(wire133)};
              reg161 <= (wire130[(4'h9):(2'h3)] != reg150[(5'h10):(4'hc)]);
              reg162 <= {(-{wire138[(4'he):(1'h1)], reg146}),
                  (+$unsigned(wire133[(2'h3):(2'h3)]))};
            end
          else
            begin
              reg158 <= wire131[(4'hc):(4'h8)];
              reg159 <= (reg162 ?
                  ((reg156 != $unsigned($unsigned((8'hbf)))) && (8'hb1)) : $unsigned($unsigned(reg154)));
              reg160 <= reg153;
              reg161 <= $unsigned((wire133[(4'h9):(4'h9)] <<< $signed(reg157)));
              reg162 <= (+wire136);
            end
          reg163 <= reg161[(2'h3):(1'h0)];
        end
      reg164 <= $signed(reg150);
      reg165 <= $signed($signed((-((&reg163) ? wire143 : reg150))));
    end
  assign wire166 = (wire139 ?
                       ($signed(((~^(8'hbd)) ?
                           (reg146 ~^ wire134) : (reg157 ?
                               reg153 : wire137))) > wire142) : $unsigned({(((7'h42) ?
                                   (8'ha0) : reg160) ?
                               {wire142, reg144} : (reg165 ?
                                   wire142 : (8'hb7))),
                           $unsigned((&wire133))}));
  assign wire167 = (^(wire137 && reg165[(4'h9):(2'h3)]));
  assign wire168 = ((reg159[(2'h3):(2'h3)] ?
                       (((-wire131) ?
                           {wire142, wire131} : (reg164 ?
                               wire132 : reg144)) <= wire134) : reg159[(2'h3):(1'h0)]) > wire142[(2'h2):(1'h1)]);
endmodule

module module89
#(parameter param112 = {(({(~(8'ha7))} > (((8'h9d) * (8'haf)) < (|(8'ha5)))) >>> (8'hbe))})
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire94;
  input wire [(3'h5):(1'h0)] wire93;
  input wire signed [(4'hc):(1'h0)] wire92;
  input wire signed [(3'h4):(1'h0)] wire91;
  input wire signed [(2'h2):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire108;
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 reg107,
                 reg106,
                 reg105,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg95 <= $unsigned(((((~|wire94) | wire91[(2'h3):(1'h1)]) ?
          $signed((wire91 ?
              wire92 : wire93)) : wire90[(1'h0):(1'h0)]) ~^ ((((8'hbe) ?
              wire93 : wire94) ^ (wire92 | wire92)) ?
          $signed($signed(wire94)) : $signed($unsigned(wire93)))));
      if ((^~$signed(wire93)))
        begin
          if ({$signed($signed({wire93[(3'h4):(2'h2)]}))})
            begin
              reg96 <= {(+((wire93[(2'h2):(2'h2)] ?
                      ((8'ha5) && wire92) : (8'hb0)) != wire92[(4'hc):(4'hc)]))};
              reg97 <= ((~&$signed((wire91[(2'h2):(1'h0)] ?
                  (^~wire92) : {reg96,
                      wire90}))) ~^ (reg96 >>> $signed((^~{wire92}))));
              reg98 <= (+$unsigned($signed(({wire94} ?
                  reg97[(1'h1):(1'h0)] : $signed(wire94)))));
              reg99 <= $signed(wire94[(2'h2):(2'h2)]);
              reg100 <= ((^~(8'haf)) ^~ (($unsigned(wire90) ?
                      (+{wire93, wire93}) : (((8'ha2) ~^ reg98) ?
                          $unsigned(reg98) : (wire91 ? wire92 : wire94))) ?
                  reg99[(1'h1):(1'h0)] : (!wire92)));
            end
          else
            begin
              reg96 <= $signed(((reg99[(3'h6):(2'h2)] ?
                  $signed(reg97[(3'h4):(1'h1)]) : (+(reg98 ?
                      wire94 : reg97))) >= ((7'h44) != $unsigned((wire94 < wire93)))));
              reg97 <= (((((reg98 <= reg95) ^ reg100) ?
                      reg95 : ($signed(wire93) ?
                          $signed((8'hb9)) : $signed(reg95))) ?
                  $signed(wire91) : $signed(wire94[(1'h1):(1'h0)])) & $unsigned(({(~wire94)} & (reg97 != $unsigned(reg95)))));
              reg98 <= $signed(($signed($unsigned(wire93[(3'h5):(1'h1)])) & ((8'h9d) ?
                  $signed((+wire90)) : wire91)));
            end
          if (({reg95[(2'h2):(1'h1)],
              wire93[(2'h2):(1'h0)]} ^~ $signed((((wire90 ? wire90 : wire91) ?
                  wire91 : $signed((8'ha4))) ?
              $signed(wire92) : (^reg95[(2'h3):(1'h1)])))))
            begin
              reg101 <= ($signed(reg97[(3'h5):(1'h0)]) <<< (8'hbe));
              reg102 <= reg97[(2'h2):(1'h0)];
              reg103 <= ($unsigned(reg97[(3'h6):(2'h2)]) == ({((|wire94) ~^ (8'ha2))} ?
                  $signed($signed(((8'hb2) >>> reg97))) : $unsigned($unsigned(((8'hb4) ?
                      wire92 : reg97)))));
              reg104 <= $unsigned(wire94);
            end
          else
            begin
              reg101 <= $unsigned($unsigned(reg96[(1'h1):(1'h0)]));
              reg102 <= (8'hb2);
              reg103 <= (!($signed($unsigned({(8'hb7)})) - ($unsigned($signed(reg98)) ?
                  (!wire90) : ((wire90 > wire91) < {reg98, reg99}))));
              reg104 <= (^~((8'ha3) >>> $unsigned($signed((reg98 ?
                  reg104 : wire90)))));
            end
          reg105 <= $unsigned(($signed($signed(wire90)) ~^ $signed((8'hbf))));
        end
      else
        begin
          reg96 <= (^~$signed($signed((~|{wire92, (8'hbb)}))));
          reg97 <= (-$signed((reg100 ?
              {(^wire90)} : ({reg95, reg101} ?
                  $signed((8'ha5)) : $signed(wire91)))));
          reg98 <= reg98;
          reg99 <= (|{$unsigned($signed($signed(reg105)))});
        end
      reg106 <= (reg99 - reg99[(1'h0):(1'h0)]);
      reg107 <= wire93[(1'h1):(1'h1)];
    end
  assign wire108 = $signed($signed(((^(reg106 ?
                       (7'h41) : reg107)) & $signed((reg96 >= reg104)))));
  assign wire109 = {(&$unsigned((~^reg99))), wire108[(1'h1):(1'h0)]};
  assign wire110 = wire109;
  assign wire111 = wire108;
endmodule

module module54
#(parameter param83 = ((((-(-(8'hac))) ? ((~(8'ha6)) ? {(8'hab), (8'ha2)} : ((8'hab) * (8'h9d))) : (((8'hb8) ? (8'hb6) : (8'hba)) && (|(8'ha8)))) >= (~|(((8'ha7) && (8'hab)) ? {(8'hb5)} : ((8'ha5) ? (8'hba) : (8'hb5))))) ~^ ((~|{{(7'h44)}, (8'ha5)}) | ((((8'h9f) > (8'ha0)) ? (!(8'hb1)) : ((8'hb7) ? (8'hb9) : (8'ha3))) ? {((8'hbd) ? (8'ha1) : (8'hba))} : (~|((8'ha8) + (8'hb3)))))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire58;
  input wire signed [(3'h5):(1'h0)] wire57;
  input wire signed [(5'h10):(1'h0)] wire56;
  input wire [(4'hb):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire59 = wire55[(3'h6):(2'h2)];
  assign wire60 = ((8'h9e) | $unsigned((|(!(~^wire57)))));
  assign wire61 = $signed((wire60[(1'h1):(1'h1)] * wire58));
  assign wire62 = ($signed((wire57[(3'h5):(3'h4)] | ((^~wire59) ?
                      wire61 : (^~wire57)))) > $signed(wire55));
  assign wire63 = $signed(({(~&{wire61, wire62})} > $unsigned((wire57 ?
                      wire58[(2'h3):(1'h1)] : (wire61 > wire60)))));
  assign wire64 = (8'hb4);
  always
    @(posedge clk) begin
      reg65 <= $unsigned((~((wire63 ^~ wire62) ?
          ($signed(wire61) - (8'hab)) : wire59[(3'h7):(3'h7)])));
      reg66 <= $unsigned((^(wire56 >>> wire55)));
    end
  assign wire67 = $unsigned(($unsigned(wire61[(3'h7):(1'h0)]) + $signed(((~^wire59) > (-wire64)))));
  assign wire68 = wire63[(2'h2):(1'h0)];
  assign wire69 = (+$signed(($unsigned((~wire56)) ?
                      wire67 : wire59[(3'h5):(3'h4)])));
  assign wire70 = ({wire59, $unsigned(wire58[(1'h0):(1'h0)])} > wire55);
  assign wire71 = $unsigned((((|wire56[(4'h8):(3'h6)]) > {(wire67 ?
                          (8'ha2) : wire60)}) <= wire57[(3'h5):(3'h5)]));
  assign wire72 = {(8'hba), wire70};
  assign wire73 = $unsigned(($unsigned((8'ha6)) < (wire57[(2'h2):(2'h2)] ?
                      $signed($unsigned(wire64)) : (~^wire72[(3'h5):(2'h2)]))));
  assign wire74 = (wire62 != $signed(($unsigned(wire67) ?
                      wire58[(2'h3):(2'h3)] : (~&((8'ha6) ?
                          (7'h43) : wire69)))));
  assign wire75 = {(wire73 > ($unsigned($signed(wire72)) & {(reg66 ?
                              wire62 : wire61)})),
                      wire74};
  assign wire76 = ({wire64[(3'h5):(2'h3)], $signed((~(-(8'hbc))))} ?
                      reg65 : (($unsigned(wire75[(3'h7):(2'h3)]) ?
                          $unsigned((reg66 ?
                              wire59 : wire67)) : wire56) * wire61[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg77 <= (^wire57[(1'h1):(1'h1)]);
      if ($signed((wire57 ^~ ($signed(wire61[(4'h9):(3'h7)]) ?
          (&wire61) : $signed(wire73[(3'h5):(3'h5)])))))
        begin
          reg78 <= $signed({reg65[(4'h9):(1'h0)],
              $signed($signed($unsigned(wire76)))});
          reg79 <= {(wire60[(1'h1):(1'h0)] ?
                  $unsigned(wire62) : ((wire56 ?
                          {wire60, (8'hae)} : $signed(reg78)) ?
                      wire75 : (8'had))),
              wire70[(4'hc):(4'h8)]};
          reg80 <= ($unsigned(((^(wire75 ? reg66 : wire76)) >= (^{wire67}))) ?
              ($signed((wire55 ? (&wire74) : wire55)) ?
                  $unsigned($unsigned($unsigned(wire60))) : $unsigned((~&(-(8'hb3))))) : $unsigned(wire57));
        end
      else
        begin
          reg78 <= $unsigned((wire61 * wire56));
        end
      reg81 <= $signed((($signed((reg77 ?
              wire67 : wire58)) ^ (&$signed(wire73))) ?
          wire63[(2'h2):(2'h2)] : $signed(wire61)));
      reg82 <= $unsigned({wire75, wire69});
    end
endmodule
