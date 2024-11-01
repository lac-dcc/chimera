module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire209;
  wire [(5'h12):(1'h0)] wire207;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire205;
  reg [(5'h10):(1'h0)] reg208 = (1'h0);
  assign y = {wire209,
                 wire207,
                 wire67,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire205,
                 reg208,
                 (1'h0)};
  module5 #() modinst68 (.wire9(wire0), .wire6(wire3), .wire8(wire4), .wire7(wire1), .y(wire67), .clk(clk));
  assign wire69 = ((wire1[(3'h5):(1'h1)] >= wire1) ?
                      wire1 : (^~((8'ha7) * ($signed(wire4) == wire4))));
  assign wire70 = {wire4, wire0};
  assign wire71 = (~|wire0);
  assign wire72 = $unsigned($unsigned(wire71));
  assign wire73 = (!$signed($unsigned(wire67)));
  assign wire74 = (-$unsigned((wire70 ?
                      {wire3,
                          $signed(wire3)} : ($signed((8'h9c)) <<< wire73[(4'ha):(3'h6)]))));
  module75 #() modinst206 (wire205, clk, wire74, wire3, wire71, wire2, wire69);
  assign wire207 = wire71;
  always
    @(posedge clk) begin
      reg208 <= $signed(wire71);
    end
  assign wire209 = $signed($unsigned((+(8'hb2))));
endmodule

module module75
#(parameter param203 = ((^~((-((8'hbb) ? (7'h44) : (8'ha4))) ? (^~((8'ha6) >= (8'hbf))) : (~(~^(8'ha6))))) ? (({((7'h42) ? (8'hab) : (8'ha2)), ((8'ha2) == (8'h9c))} + (((8'hb5) ? (8'hbd) : (8'hab)) > {(8'haa)})) > (!(~&((8'hbe) ? (8'h9f) : (8'hb1))))) : (~|(~(+(8'had))))), 
parameter param204 = (^(~&((param203 ? (~^param203) : (8'hbf)) ? {param203} : (param203 ? {param203, param203} : (param203 ? param203 : param203))))))
(y, clk, wire76, wire77, wire78, wire79, wire80);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire76;
  input wire [(4'hd):(1'h0)] wire77;
  input wire [(5'h12):(1'h0)] wire78;
  input wire [(4'hc):(1'h0)] wire79;
  input wire signed [(5'h13):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire202;
  wire [(5'h12):(1'h0)] wire173;
  wire signed [(4'he):(1'h0)] wire171;
  wire signed [(5'h11):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire93;
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg200 = (1'h0);
  reg [(3'h4):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg198 = (1'h0);
  reg [(3'h6):(1'h0)] reg197 = (1'h0);
  reg [(3'h7):(1'h0)] reg196 = (1'h0);
  reg [(5'h11):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg191 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg189 = (1'h0);
  reg [(5'h12):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg184 = (1'h0);
  reg [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg182 = (1'h0);
  reg [(3'h5):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg174 = (1'h0);
  assign y = {wire202,
                 wire173,
                 wire171,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
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
                 (1'h0)};
  module81 #() modinst94 (.wire82(wire77), .wire85(wire76), .y(wire93), .wire84(wire79), .wire83(wire80), .wire86(wire78), .clk(clk));
  assign wire95 = $signed(($signed($unsigned(wire77)) == (8'hba)));
  assign wire96 = (!wire76[(1'h1):(1'h0)]);
  assign wire97 = (wire76 ?
                      (~|((wire93 ?
                          wire93[(2'h3):(1'h0)] : wire78[(4'he):(1'h0)]) | ($unsigned(wire79) ^ $unsigned(wire77)))) : $signed($unsigned(wire78)));
  module98 #() modinst172 (.wire101(wire76), .wire99(wire96), .wire100(wire93), .y(wire171), .wire102(wire80), .clk(clk));
  assign wire173 = ($unsigned((($signed((8'ha5)) & (wire79 ?
                           wire95 : wire95)) * ((8'ha6) ?
                           (|wire79) : $unsigned(wire79)))) ?
                       {(((-(8'hb1)) > wire95[(5'h11):(4'hb)]) ?
                               (wire95 <= {(7'h42),
                                   wire93}) : wire93)} : (|wire93));
  always
    @(posedge clk) begin
      reg174 <= ($unsigned($unsigned(wire78)) ?
          ((+{$signed((7'h44)),
              {(8'haa)}}) <<< wire95[(4'hb):(4'h9)]) : $unsigned($unsigned($unsigned(wire76))));
    end
  always
    @(posedge clk) begin
      reg175 <= wire77[(2'h3):(1'h1)];
      if ($signed((7'h43)))
        begin
          reg176 <= (~((8'haa) ?
              $unsigned(wire173) : (wire95 ?
                  $signed((reg174 > wire171)) : $signed(reg174))));
          reg177 <= ((wire97[(4'h8):(3'h6)] ? reg176 : wire95[(4'h9):(2'h2)]) ?
              {($unsigned((reg174 ^~ reg175)) != wire76[(1'h0):(1'h0)])} : $signed((~$signed(wire76))));
          reg178 <= (($unsigned(((|reg177) ?
              (reg174 ?
                  reg177 : wire95) : $unsigned(wire93))) >> wire79[(4'hb):(4'ha)]) - (({{wire93}} ?
              wire95[(3'h5):(2'h3)] : $signed($signed(wire96))) < ((&((8'hab) ?
              wire96 : wire76)) >= wire96)));
          reg179 <= $unsigned(wire80[(4'hf):(3'h5)]);
          reg180 <= wire80;
        end
      else
        begin
          if (wire79)
            begin
              reg176 <= $signed((~|$signed(((~^wire95) ?
                  $unsigned(wire76) : $unsigned(reg179)))));
              reg177 <= {wire78[(3'h4):(2'h2)],
                  {({wire97, $signed(reg174)} - (7'h44)),
                      (($unsigned(wire96) ? wire78 : wire93) ?
                          $signed(wire77) : {(7'h40)})}};
            end
          else
            begin
              reg176 <= (8'ha6);
              reg177 <= reg174;
              reg178 <= $unsigned(((reg177[(3'h7):(2'h2)] - $signed(wire93)) ?
                  $unsigned((^(reg177 ? (8'hae) : wire96))) : (~&(7'h40))));
            end
          reg179 <= reg178;
          reg180 <= (reg180 - ({wire95[(4'hd):(4'h8)]} ?
              (($unsigned(wire95) ? (+wire76) : $signed(wire77)) ?
                  (wire76 ?
                      (~^wire78) : (wire78 * wire95)) : wire93[(3'h4):(1'h1)]) : {$unsigned($unsigned(reg177))}));
        end
      if (wire96)
        begin
          reg181 <= $unsigned(({$signed((reg174 ^ wire95))} && wire77[(4'h9):(3'h6)]));
          if ((($unsigned(reg174[(3'h6):(3'h4)]) - wire93) ?
              $signed(reg180) : reg181[(1'h0):(1'h0)]))
            begin
              reg182 <= (((8'hbf) ? $unsigned(wire95) : wire96) ?
                  (((!{(8'hab)}) >= ((reg174 ? reg174 : (8'hba)) | ((8'hbd) ?
                      wire96 : reg175))) <<< wire171[(3'h7):(2'h2)]) : wire97[(4'he):(3'h6)]);
              reg183 <= reg176;
              reg184 <= ((~$unsigned((+wire79[(2'h2):(1'h0)]))) == $unsigned((reg183 ^~ reg176)));
              reg185 <= wire173[(4'he):(4'h9)];
              reg186 <= reg184;
            end
          else
            begin
              reg182 <= wire80[(5'h13):(3'h5)];
              reg183 <= wire78[(4'hf):(4'ha)];
            end
          reg187 <= ((wire171 ?
                  $unsigned((((8'hb4) ?
                      reg175 : wire173) ^~ (reg186 | wire76))) : {((8'hbf) ?
                          reg174 : (reg183 < wire96))}) ?
              ($unsigned($unsigned((~^reg178))) ?
                  (!(&(reg184 <<< wire171))) : wire79[(2'h2):(1'h0)]) : wire97[(4'h9):(3'h4)]);
        end
      else
        begin
          if ((&reg174))
            begin
              reg181 <= ({{$signed(reg180[(1'h0):(1'h0)])}, wire76} ?
                  $unsigned((~|((reg183 == reg175) ~^ $signed(wire173)))) : $signed($signed(reg187[(5'h10):(3'h4)])));
              reg182 <= reg184;
              reg183 <= reg183[(1'h0):(1'h0)];
            end
          else
            begin
              reg181 <= (~(($signed({reg175}) ?
                      wire96[(3'h4):(2'h3)] : $unsigned((reg185 ?
                          (7'h44) : wire76))) ?
                  $unsigned(wire95[(2'h2):(1'h1)]) : $signed((reg187[(4'hb):(1'h0)] ?
                      $unsigned((8'hbd)) : (wire96 ? reg184 : wire77)))));
              reg182 <= reg178;
              reg183 <= reg177;
              reg184 <= reg182;
              reg185 <= wire97[(3'h6):(3'h5)];
            end
          reg186 <= wire93;
          reg187 <= reg174[(3'h4):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      if ($signed(reg180[(1'h0):(1'h0)]))
        begin
          reg188 <= (~|(!(&wire76)));
          if (wire93[(3'h4):(1'h1)])
            begin
              reg189 <= (!(+((^~(wire79 ? reg184 : (8'haf))) ~^ {reg186,
                  {reg177, reg187}})));
              reg190 <= (reg188 & reg184[(1'h1):(1'h0)]);
              reg191 <= (8'ha4);
              reg192 <= $unsigned(reg187);
            end
          else
            begin
              reg189 <= ((8'hba) && {(&(!$signed(reg183)))});
              reg190 <= ((reg185 <<< $unsigned($signed(((8'hb6) ?
                      wire77 : wire93)))) ?
                  (($signed($unsigned(reg185)) - reg182) | ((~&wire76) == (&$unsigned((7'h44))))) : {(~reg178[(1'h1):(1'h0)])});
            end
          reg193 <= reg178;
        end
      else
        begin
          if ((~(~&(~&(reg189 ? {wire76, reg179} : wire78)))))
            begin
              reg188 <= wire171[(3'h7):(2'h3)];
              reg189 <= wire79;
              reg190 <= $signed((8'ha8));
            end
          else
            begin
              reg188 <= ($unsigned({wire96[(1'h0):(1'h0)]}) ^ ((($signed(wire173) ?
                      reg186 : (wire78 * wire96)) ?
                  (~|(8'h9d)) : (~&((8'haf) << wire171))) != $signed(($unsigned(wire96) ?
                  ((8'hb0) ? reg176 : (8'h9e)) : $signed(reg193)))));
              reg189 <= (~|reg190[(2'h2):(2'h2)]);
              reg190 <= $unsigned(wire173);
              reg191 <= ((~^$unsigned((reg174[(4'hb):(4'h9)] ?
                      $unsigned(wire95) : (^~(8'hbc))))) ?
                  (((reg174[(4'h8):(3'h6)] >>> (reg191 + wire76)) ?
                          (8'hb7) : {(~^reg179), (reg192 * (8'hb3))}) ?
                      (($signed(reg175) ^~ wire173) ?
                          ({reg191} ?
                              (~^reg189) : $signed(reg178)) : (reg180 | $unsigned(reg186))) : $unsigned(wire80)) : $unsigned((reg190[(3'h7):(1'h0)] ?
                      wire78 : $signed((reg182 ? (8'hbc) : reg188)))));
              reg192 <= $signed((reg186 ? (!reg192) : wire78));
            end
        end
      if (reg193)
        begin
          if ($signed(reg184[(3'h7):(3'h4)]))
            begin
              reg194 <= {(wire76[(4'h9):(3'h5)] & wire78),
                  {(-($unsigned((8'ha3)) ? (~^(8'had)) : (7'h41))),
                      $signed(({wire80} && $signed((8'hb3))))}};
              reg195 <= (~^($signed((~|reg175)) <<< (+$signed((wire173 ?
                  wire80 : wire79)))));
              reg196 <= {(8'hbf),
                  ($unsigned(reg191) ?
                      $unsigned(((reg194 ? reg195 : reg176) | {reg194,
                          reg178})) : (~&(+reg186[(4'he):(4'h8)])))};
              reg197 <= reg174;
            end
          else
            begin
              reg194 <= reg187;
              reg195 <= reg181[(2'h3):(2'h3)];
            end
          reg198 <= reg180;
          reg199 <= reg175[(4'hf):(4'h8)];
          if ((($unsigned({{reg192}}) >> ({(~reg198)} ?
              reg175 : (^$unsigned(reg197)))) - $signed(reg176[(1'h1):(1'h0)])))
            begin
              reg200 <= reg181;
              reg201 <= {(wire97 ?
                      $signed(($unsigned(reg182) ^~ reg182)) : $signed({(~&wire79)})),
                  $signed((-(-(reg177 ? (8'ha8) : reg177))))};
            end
          else
            begin
              reg200 <= ($signed(wire77[(4'h8):(3'h6)]) ?
                  $unsigned(((~$unsigned((8'hba))) ?
                      ($signed(reg185) || reg199) : reg182[(4'hf):(2'h3)])) : $signed(reg186));
              reg201 <= {wire78};
            end
        end
      else
        begin
          reg194 <= {reg195[(4'hc):(3'h6)]};
          reg195 <= ($unsigned(wire93[(3'h7):(3'h4)]) ?
              wire77[(2'h3):(1'h1)] : (-($unsigned(reg182) ?
                  ($unsigned(reg190) ? {wire79} : (-reg180)) : ((reg175 ?
                      (7'h40) : reg199) < (wire77 ? reg183 : (8'ha9))))));
          reg196 <= reg179;
          reg197 <= ((($signed({reg174}) ?
              wire80[(4'h9):(1'h0)] : {(^(8'hb6))}) | reg201) & reg196);
          reg198 <= reg194[(3'h6):(2'h2)];
        end
    end
  assign wire202 = $unsigned(reg191);
endmodule

module module5
#(parameter param65 = {(((((8'ha0) * (8'ha1)) != (+(8'ha6))) ? (((7'h40) ? (8'hbe) : (8'hb8)) ? ((8'hb9) && (8'hb2)) : (+(8'h9f))) : (~&((8'ha4) ? (8'hbb) : (8'h9d)))) ? (({(8'had)} - ((8'hbb) ? (8'hb0) : (8'hb9))) ^ ({(8'hb0)} - ((8'hab) - (8'hba)))) : (~&(((8'hae) ? (8'ha5) : (8'h9d)) == {(8'h9f), (8'h9c)})))}, 
parameter param66 = (((((param65 ? param65 : param65) ^ (param65 & param65)) ? param65 : (~&((8'hbc) ? (8'ha8) : param65))) >>> ((~|(~|param65)) ? param65 : (param65 - param65))) ? ((param65 ? ((param65 - (8'h9f)) >> (param65 >>> param65)) : param65) & (param65 ? param65 : param65)) : (!(&(param65 && {param65, param65})))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire61,
                 wire41,
                 wire40,
                 wire38,
                 wire17,
                 wire16,
                 wire11,
                 wire10,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = (~$signed($signed({wire9})));
  assign wire11 = $signed((!$unsigned(wire8[(4'hc):(3'h6)])));
  always
    @(posedge clk) begin
      reg12 <= $signed(wire8[(4'hf):(4'ha)]);
      reg13 <= $signed(($unsigned(($unsigned(reg12) ?
              $signed((7'h40)) : ((8'hb9) ^ wire10))) ?
          ($signed(reg12) ?
              $signed($signed(wire8)) : $signed(wire8)) : (8'hb5)));
      reg14 <= ({$signed(wire8[(3'h5):(3'h5)])} ? wire6 : wire8);
      reg15 <= (8'hb3);
    end
  assign wire16 = (wire10[(1'h0):(1'h0)] ?
                      $signed((~&$unsigned($signed(wire11)))) : ((wire8 | $unsigned($unsigned(reg15))) ?
                          wire9[(3'h6):(3'h5)] : $signed($unsigned(reg15[(3'h5):(3'h5)]))));
  assign wire17 = (8'ha5);
  module18 #() modinst39 (.wire21(reg12), .wire20(wire6), .wire23(wire17), .wire22(wire16), .y(wire38), .clk(clk), .wire19(wire10));
  assign wire40 = (^(wire10 ?
                      wire11[(3'h5):(1'h1)] : $unsigned(((reg12 ?
                              (8'had) : wire11) ?
                          (!wire10) : (-reg15)))));
  assign wire41 = $signed((((~&wire9) ?
                      ({wire38} * (reg13 ? reg15 : wire6)) : (!(wire8 ?
                          (8'ha6) : wire9))) <= $unsigned(reg12[(4'h8):(3'h5)])));
  module42 #() modinst62 (wire61, clk, wire7, wire17, wire10, reg12, wire8);
  assign wire63 = (~(wire40 || wire6[(2'h2):(1'h1)]));
  assign wire64 = (~^wire63[(1'h0):(1'h0)]);
endmodule

module module42
#(parameter param60 = (~|(^~(((^(8'hb9)) ? ((8'hae) ? (8'h9d) : (8'hb1)) : ((8'ha7) ? (8'hbc) : (8'h9c))) * (((8'had) ? (8'hbe) : (7'h42)) < (!(8'ha1)))))))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire47;
  input wire signed [(2'h2):(1'h0)] wire46;
  input wire signed [(4'h9):(1'h0)] wire45;
  input wire [(3'h7):(1'h0)] wire44;
  input wire [(3'h7):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire49,
                 wire48,
                 reg56,
                 reg55,
                 reg51,
                 (1'h0)};
  assign wire48 = $signed((($signed((^wire46)) ^~ $signed($unsigned(wire47))) ?
                      wire43[(1'h0):(1'h0)] : $signed(wire46[(1'h1):(1'h0)])));
  assign wire49 = $signed((wire48 == ($signed(wire48) ?
                      (+(wire45 || (8'ha0))) : (wire45 <<< $unsigned(wire43)))));
  assign wire50 = (wire48[(4'hc):(2'h2)] ?
                      $signed(({wire46, $unsigned((8'ha5))} ?
                          $unsigned($signed((8'ha7))) : ((wire43 ?
                                  (8'ha2) : wire43) ?
                              {wire43} : wire48))) : wire47[(4'hb):(2'h2)]);
  always
    @(posedge clk) begin
      reg51 <= ((^~($unsigned($signed((8'hbf))) ?
              wire50[(1'h0):(1'h0)] : (~^(wire43 <<< (7'h42))))) ?
          ($signed(((wire49 >>> (8'hb2)) ?
              wire46[(2'h2):(1'h0)] : wire47)) || $unsigned(wire48)) : (wire47[(1'h1):(1'h1)] ?
              wire44[(1'h0):(1'h0)] : (7'h44)));
    end
  assign wire52 = $signed(wire46[(2'h2):(1'h0)]);
  assign wire53 = {({reg51[(2'h2):(1'h0)]} ?
                          $unsigned($signed((wire44 ?
                              (8'hae) : wire47))) : (|$signed(wire46[(1'h1):(1'h1)]))),
                      ({wire46[(2'h2):(1'h0)], wire50[(2'h2):(2'h2)]} ?
                          (-reg51) : (~|(^~{wire48})))};
  assign wire54 = wire52[(4'hc):(2'h3)];
  always
    @(posedge clk) begin
      reg55 <= wire49[(3'h4):(2'h2)];
      reg56 <= $unsigned($unsigned($unsigned((-(^~wire46)))));
    end
  assign wire57 = {((&(wire44[(3'h5):(1'h1)] ?
                          wire44[(3'h6):(2'h3)] : (~wire54))) & ((+((8'hbe) > wire53)) ?
                          $signed($unsigned(wire46)) : $unsigned((+wire44)))),
                      ($signed({reg51[(3'h4):(2'h2)],
                          (7'h40)}) & ((8'ha6) < (+reg56)))};
  assign wire58 = (~$signed($unsigned($signed({wire47}))));
  assign wire59 = $signed({($signed(wire54) ?
                          $signed(wire48[(5'h14):(4'h8)]) : $signed((wire50 ~^ wire43)))});
endmodule

module module18
#(parameter param36 = (&(((((8'ha9) ? (8'ha4) : (8'h9d)) | ((8'ha3) ? (8'hb2) : (8'hab))) ~^ (((8'hb7) ? (7'h43) : (8'h9f)) ? {(8'hb9), (8'ha9)} : ((8'ha0) >>> (8'hab)))) ? ({((8'hbb) ? (8'haa) : (7'h41)), (!(8'ha2))} || (~^(&(7'h42)))) : (^({(8'hb0), (7'h42)} ? (~(8'ha1)) : (8'h9f))))), 
parameter param37 = param36)
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(4'hc):(1'h0)] wire22;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire24;
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  assign y = {wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire24,
                 reg34,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire24 = $signed(((~(^wire21[(2'h2):(2'h2)])) != wire19));
  always
    @(posedge clk) begin
      if (wire21)
        begin
          if ($unsigned(wire20[(2'h2):(1'h0)]))
            begin
              reg25 <= wire22;
              reg26 <= (reg25[(2'h2):(1'h0)] >>> reg25);
              reg27 <= (wire24 >> wire21[(1'h1):(1'h1)]);
              reg28 <= (reg25 & reg26);
              reg29 <= (wire20[(1'h0):(1'h0)] > $unsigned($unsigned($unsigned((wire21 ?
                  wire19 : reg28)))));
            end
          else
            begin
              reg25 <= $unsigned($unsigned(($unsigned((^reg27)) ?
                  (~^(wire24 ? (8'hab) : wire24)) : $unsigned((8'hba)))));
              reg26 <= (8'h9e);
              reg27 <= (+$signed({$unsigned($unsigned(reg29)),
                  ($signed(wire22) ? $unsigned(reg29) : wire24)}));
              reg28 <= wire24[(3'h5):(3'h5)];
              reg29 <= ((reg28 ?
                  $unsigned(wire24) : wire21[(1'h1):(1'h0)]) * {reg25});
            end
        end
      else
        begin
          reg25 <= wire20;
          reg26 <= {reg28[(3'h6):(2'h3)], $signed((~((8'h9e) <<< (&reg25))))};
        end
    end
  assign wire30 = ($signed((((reg25 ? (8'hae) : reg28) ?
                          wire24[(3'h5):(1'h1)] : (wire22 > wire22)) || (wire24 ?
                          (reg27 || wire24) : {wire21}))) ?
                      $signed(((~reg26) || {(~|reg29)})) : ($signed(wire23[(5'h11):(2'h3)]) + $unsigned(reg26)));
  assign wire31 = $unsigned($unsigned((~&({wire22} ?
                      $unsigned(reg29) : $unsigned(wire30)))));
  assign wire32 = ({(~^$unsigned((reg25 ? wire20 : reg27))),
                      {$unsigned((reg25 ? wire23 : reg26)),
                          ($unsigned(wire30) | reg29)}} || $unsigned((((8'hab) ?
                      wire20[(1'h1):(1'h1)] : ((8'hbd) >>> wire23)) && wire20)));
  assign wire33 = wire21;
  always
    @(posedge clk) begin
      reg34 <= (&$signed(reg27[(1'h1):(1'h1)]));
    end
  assign wire35 = {$unsigned({(^~{wire32, reg25}), $unsigned(wire19)}),
                      $unsigned(wire23)};
endmodule

module module98
#(parameter param169 = ((({((8'hb6) ? (8'hbe) : (7'h44))} ? ({(8'ha5)} - (8'hac)) : (^~(!(8'hb3)))) ? ((((7'h44) | (7'h40)) * ((8'hab) >>> (8'ha2))) ? (+((7'h43) ? (8'hb1) : (8'haa))) : (((8'hbd) ? (8'hb9) : (8'hb9)) || (&(8'h9e)))) : (^~(((8'hb1) ? (8'ha2) : (8'hb0)) ^~ ((8'hb5) - (8'hb4))))) ^~ ((8'hb6) <= {((-(8'ha7)) + ((8'hb3) ? (8'ha1) : (7'h44)))})), 
parameter param170 = param169)
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h320):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire102;
  input wire [(4'hc):(1'h0)] wire101;
  input wire signed [(3'h7):(1'h0)] wire100;
  input wire [(3'h4):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire127;
  wire signed [(4'h9):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(4'he):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg [(5'h10):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg160 = (1'h0);
  reg [(4'h9):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(5'h11):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire110,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg168,
                 reg167,
                 reg166,
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
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire103 = wire99[(1'h1):(1'h1)];
  assign wire104 = (wire100 | wire103);
  assign wire105 = wire102;
  assign wire106 = wire100;
  assign wire107 = (~&$unsigned(({wire102[(3'h6):(3'h4)], wire105} ?
                       wire105[(2'h3):(1'h0)] : $signed(wire106))));
  always
    @(posedge clk) begin
      reg108 <= ((^(!{(|wire106),
          (wire104 != wire103)})) + (($signed(wire104[(3'h5):(1'h0)]) < wire106) || wire101[(4'h9):(3'h6)]));
      reg109 <= $signed($unsigned(wire103));
    end
  assign wire110 = wire104;
  always
    @(posedge clk) begin
      reg111 <= wire105[(4'hf):(4'hb)];
      if ({wire104, $signed(wire101)})
        begin
          reg112 <= (wire110 ?
              ((!{$signed(wire110)}) ?
                  ($unsigned((!wire100)) < (+(reg108 ?
                      wire99 : reg111))) : wire103) : {(wire103[(2'h2):(1'h0)] ~^ wire100[(3'h4):(3'h4)])});
          if ((wire101[(4'ha):(3'h6)] >> reg109[(4'h8):(3'h5)]))
            begin
              reg113 <= (wire110 ?
                  (8'hac) : (^~{$signed({(8'hb3)}), (~|(|(8'hac)))}));
              reg114 <= {wire107};
              reg115 <= wire107[(2'h3):(1'h0)];
              reg116 <= {(-(((7'h40) >> reg109) << {(wire105 == reg108)})),
                  wire99};
              reg117 <= $signed($signed({{(&wire101), reg115}}));
            end
          else
            begin
              reg113 <= ((wire99 == ($unsigned({(8'hac),
                      reg108}) | ($unsigned(reg114) ~^ $unsigned(reg115)))) ?
                  reg108 : wire105);
              reg114 <= ({wire99[(1'h1):(1'h0)],
                  ($unsigned((&(8'hbc))) || (!(&reg109)))} == (~|wire99[(1'h0):(1'h0)]));
              reg115 <= ((~wire102[(1'h0):(1'h0)]) >= (reg113 <<< (($signed(wire101) ?
                  (wire104 >> wire105) : {(8'h9f)}) <= (8'hae))));
              reg116 <= (^~reg108[(1'h1):(1'h0)]);
            end
          reg118 <= reg117[(3'h5):(3'h4)];
        end
      else
        begin
          if ($unsigned((~&{reg112})))
            begin
              reg112 <= (((wire102[(4'he):(4'hb)] << {reg116[(3'h5):(3'h5)],
                  wire110}) >>> (wire99[(2'h2):(2'h2)] < $unsigned((wire102 || wire101)))) && reg108);
              reg113 <= wire102;
              reg114 <= (+(^reg109));
              reg115 <= $signed((+wire106[(3'h5):(3'h5)]));
              reg116 <= (&($signed($signed($signed(wire99))) ?
                  wire103[(1'h0):(1'h0)] : {wire106[(1'h1):(1'h1)]}));
            end
          else
            begin
              reg112 <= (reg108[(3'h7):(1'h0)] + $signed(($unsigned((~|reg118)) >> (8'h9c))));
              reg113 <= (wire104[(3'h4):(3'h4)] ~^ reg109[(1'h1):(1'h1)]);
              reg114 <= $signed((+(wire110[(4'hd):(1'h0)] != wire99)));
              reg115 <= (($signed(((|wire107) >> wire105[(4'hd):(4'h9)])) & {$signed(reg113[(1'h1):(1'h0)])}) >= ($unsigned((((8'hb3) ?
                          reg114 : reg111) ?
                      ((8'hbc) ? wire100 : wire99) : (-reg115))) ?
                  wire104[(3'h4):(3'h4)] : $signed((+{wire110, wire104}))));
              reg116 <= {$unsigned($signed(wire102)),
                  $signed((|wire104[(3'h5):(2'h2)]))};
            end
          reg117 <= reg117[(3'h5):(2'h2)];
          reg118 <= $unsigned(wire107[(1'h0):(1'h0)]);
          if (((($unsigned((reg112 + reg112)) ?
                  wire102 : $signed($signed(reg117))) >= wire105) ?
              $signed(reg111[(4'hd):(4'h9)]) : reg108))
            begin
              reg119 <= {($unsigned(((reg113 << reg112) ?
                      wire99 : (reg117 ^~ wire102))) & reg111[(3'h5):(3'h5)]),
                  wire104[(3'h4):(2'h2)]};
              reg120 <= reg108;
            end
          else
            begin
              reg119 <= reg108[(3'h4):(1'h1)];
              reg120 <= reg117;
            end
        end
    end
  assign wire121 = {$unsigned({$unsigned($unsigned(reg113))}), reg116};
  assign wire122 = (&$signed(wire106));
  assign wire123 = wire101[(1'h0):(1'h0)];
  assign wire124 = ($unsigned($signed((wire123 ?
                       wire106 : {wire106}))) < $unsigned((8'ha3)));
  assign wire125 = $signed($unsigned((-$signed(reg114))));
  assign wire126 = wire107;
  assign wire127 = wire105;
  assign wire128 = (((reg118[(4'ha):(4'ha)] ?
                           ((-wire100) ?
                               wire123 : $signed(reg115)) : wire106[(2'h3):(2'h2)]) << (|(~(wire110 - reg109)))) ?
                       $unsigned($signed((reg115[(4'h8):(4'h8)] ?
                           {wire127} : wire126))) : (~|(~&$signed((wire107 < (7'h42))))));
  assign wire129 = (^~$signed(((~^$unsigned(reg112)) ?
                       ((wire126 >>> wire122) ?
                           reg112[(1'h0):(1'h0)] : wire105[(4'hc):(4'ha)]) : $unsigned((~|reg109)))));
  always
    @(posedge clk) begin
      if (($signed({reg116[(2'h3):(1'h0)], wire101}) ?
          $signed(($unsigned(wire101) << (wire125 ^~ (reg109 >>> wire124)))) : $unsigned(wire99)))
        begin
          reg130 <= $signed($unsigned(reg114));
          reg131 <= $signed(reg118);
          reg132 <= (((~^($signed(reg118) <= {reg108})) ?
              wire99[(2'h2):(2'h2)] : ((~|(reg116 ?
                  wire99 : wire104)) ~^ wire125)) | wire122);
          reg133 <= wire129;
        end
      else
        begin
          reg130 <= (reg109[(4'hc):(4'hc)] ?
              (wire124[(1'h1):(1'h1)] <<< wire100) : ({{wire102[(4'hf):(2'h3)],
                          (wire129 ? reg117 : wire124)},
                      reg114[(5'h10):(3'h4)]} ?
                  ($signed(reg132) ?
                      $unsigned((reg120 ?
                          wire129 : reg111)) : wire123) : $signed($signed((wire129 + reg119)))));
          if ($signed((reg113[(2'h2):(1'h0)] ?
              reg112 : {((8'hb2) ^ (reg113 + reg120)),
                  $unsigned($unsigned(wire129))})))
            begin
              reg131 <= ((8'hbb) <<< (wire124[(2'h2):(1'h1)] ?
                  {wire99[(2'h2):(1'h1)]} : $signed((reg119 ?
                      (-reg115) : (wire124 <= wire110)))));
              reg132 <= wire110[(3'h4):(2'h3)];
              reg133 <= (($unsigned({(8'ha9),
                  $unsigned(wire126)}) * ($signed((^reg113)) ?
                  (8'ha9) : $signed((reg120 * wire101)))) > reg112[(1'h0):(1'h0)]);
              reg134 <= ((reg115 ?
                  ($unsigned((wire123 >> wire104)) ?
                      wire101 : (reg109 ?
                          $signed(reg119) : $signed(wire104))) : (reg113[(4'hc):(2'h3)] ?
                      $unsigned($signed(reg118)) : $unsigned({reg132,
                          wire124}))) + (-$signed($unsigned($unsigned(reg112)))));
            end
          else
            begin
              reg131 <= reg114;
            end
        end
      if (wire102)
        begin
          reg135 <= $signed(wire104);
          if (reg120[(4'hc):(2'h2)])
            begin
              reg136 <= reg119;
              reg137 <= $unsigned(wire101);
              reg138 <= reg116;
              reg139 <= $signed((reg117 << $signed(((wire123 - wire126) ?
                  ((8'had) ? wire110 : reg117) : (+wire101)))));
            end
          else
            begin
              reg136 <= {(^(($unsigned(reg115) ?
                      wire123 : ((8'h9d) ? reg130 : reg131)) << reg137)),
                  ($signed((&reg135)) << reg113[(4'h8):(3'h7)])};
            end
          reg140 <= {{(8'ha4)}};
          if ((reg109[(5'h12):(4'hf)] ?
              ((^~{$signed(wire105)}) ?
                  reg133 : $unsigned(wire123[(3'h6):(1'h0)])) : (($unsigned(reg114) ?
                      {wire107[(1'h1):(1'h0)]} : (8'ha4)) ?
                  (&((-(8'ha7)) << $signed(reg117))) : $unsigned($signed(reg108[(3'h5):(3'h4)])))))
            begin
              reg141 <= {{$unsigned((wire103 ?
                          (~^wire129) : (wire99 ? (8'hb1) : wire121))),
                      (reg139[(3'h6):(2'h2)] > (^~reg113[(3'h6):(3'h6)]))}};
              reg142 <= wire123;
            end
          else
            begin
              reg141 <= (~^$signed(reg119[(4'ha):(2'h2)]));
            end
        end
      else
        begin
          reg135 <= $unsigned((($unsigned(wire103) >> (&reg142)) >= ($signed((^~reg119)) <<< $unsigned((reg141 || reg142)))));
          reg136 <= ($signed(($unsigned(wire101) ?
                  ({wire122} ?
                      (reg134 ?
                          wire123 : (8'hbf)) : wire106[(2'h2):(1'h1)]) : ({reg120} ?
                      $signed(reg114) : (|wire100)))) ?
              reg116[(4'ha):(2'h2)] : wire103);
          reg137 <= ({$unsigned((~(-wire128))),
              {$unsigned($signed(wire128)),
                  $signed((reg118 ? (8'hba) : reg118))}} * $signed(reg117));
          reg138 <= {((~|wire126[(4'h8):(1'h1)]) >= (^($unsigned(wire101) ?
                  ((8'hb3) << wire122) : (wire124 && reg136))))};
        end
      reg143 <= $unsigned(wire107);
      reg144 <= (8'hab);
      reg145 <= $unsigned($signed(reg142));
    end
  assign wire146 = (reg109[(4'hd):(4'ha)] | $unsigned($unsigned($unsigned((reg109 ?
                       reg108 : (7'h43))))));
  assign wire147 = (-(+$signed($unsigned(((8'hab) * wire107)))));
  assign wire148 = (reg116[(4'h8):(1'h1)] ?
                       (-$unsigned({reg112})) : $unsigned($signed(({(8'ha4)} <= {wire104,
                           (7'h42)}))));
  assign wire149 = reg120[(4'hd):(3'h7)];
  always
    @(posedge clk) begin
      reg150 <= ((8'ha5) ?
          ($unsigned(($unsigned(reg120) ? $signed(reg135) : wire103)) ?
              $unsigned((7'h42)) : $signed(wire149[(2'h3):(2'h3)])) : (~|(~((wire148 - reg135) ?
              $unsigned((8'hb8)) : $unsigned(reg118)))));
      reg151 <= ($signed((&$unsigned($unsigned(reg140)))) ?
          ($signed($signed((reg113 ^~ (8'hbe)))) ?
              (~|$signed((reg132 ?
                  wire122 : reg116))) : (~&reg117[(3'h5):(1'h0)])) : ($unsigned(wire99) ?
              reg131 : wire99[(1'h0):(1'h0)]));
      reg152 <= reg134;
      if ($unsigned({$unsigned($signed({reg133})), (^reg119[(4'hb):(3'h7)])}))
        begin
          reg153 <= $signed({$signed(((!wire126) ?
                  (-wire129) : (reg132 + wire105))),
              {reg133[(3'h6):(3'h5)], reg116[(1'h0):(1'h0)]}});
          reg154 <= reg150;
          reg155 <= (&(&(reg142[(1'h1):(1'h0)] ?
              (wire106 ? {(8'hab), reg115} : (reg140 | (8'h9d))) : wire149)));
          reg156 <= (+$signed((&wire103[(2'h2):(1'h0)])));
          if (({$unsigned((wire124 ? $unsigned(reg108) : (^(8'hb8)))),
              (^~($signed(reg119) <<< (reg144 == reg154)))} <<< reg109))
            begin
              reg157 <= (reg119 ?
                  (wire99 ?
                      {wire123} : {((!(8'ha2)) ?
                              (wire148 == wire122) : {reg140,
                                  reg156})}) : ({reg153[(1'h0):(1'h0)],
                      $signed(wire126)} ^ reg156));
            end
          else
            begin
              reg157 <= {$signed((^($unsigned(reg156) + ((8'h9e) != (8'hbf))))),
                  reg140};
              reg158 <= $unsigned(reg143);
              reg159 <= wire122;
            end
        end
      else
        begin
          reg153 <= $unsigned($signed(wire100));
          reg154 <= ($unsigned(reg142[(3'h6):(2'h3)]) ?
              reg142[(4'h8):(3'h7)] : reg139);
          reg155 <= (^wire101[(4'h8):(1'h1)]);
          reg156 <= wire126;
          reg157 <= (reg114 ?
              (-($unsigned(reg132[(1'h1):(1'h0)]) ?
                  $signed($unsigned((8'ha6))) : ((reg138 >= reg132) <= (&reg116)))) : (^$unsigned(wire146[(3'h4):(3'h4)])));
        end
      if (reg141)
        begin
          if ((~$signed(wire110)))
            begin
              reg160 <= (!((!reg144[(4'hb):(3'h4)]) >> $signed((&reg115))));
            end
          else
            begin
              reg160 <= (8'ha8);
              reg161 <= $signed(($unsigned((^~reg159[(2'h2):(2'h2)])) & $signed(reg151)));
              reg162 <= (~reg155[(4'hd):(1'h0)]);
            end
          reg163 <= (reg108[(3'h7):(2'h3)] << ($signed($signed((reg132 && reg131))) ?
              $signed(reg120[(3'h7):(3'h5)]) : wire100[(3'h5):(1'h0)]));
        end
      else
        begin
          if ((&(^$signed(((wire123 ~^ reg154) > reg109)))))
            begin
              reg160 <= reg130;
              reg161 <= $unsigned($unsigned($unsigned(($unsigned(wire123) | $unsigned(wire104)))));
              reg162 <= ({$signed((~|$unsigned(reg162)))} ?
                  ((reg137[(1'h1):(1'h0)] || reg143) << ($unsigned((wire110 ?
                          (8'hbe) : (8'hb9))) ?
                      (~|(reg140 < reg154)) : reg145[(4'hc):(2'h3)])) : wire100[(3'h5):(3'h4)]);
              reg163 <= (~&(|(7'h40)));
            end
          else
            begin
              reg160 <= reg162[(2'h2):(2'h2)];
              reg161 <= (reg140[(4'ha):(1'h1)] ?
                  (&(($signed(reg141) ?
                          (wire107 ? reg152 : wire124) : (reg111 <= wire126)) ?
                      reg153 : (~&wire126))) : (|$signed($unsigned(((8'hb7) ?
                      reg143 : reg136)))));
              reg162 <= wire125;
              reg163 <= $signed((wire124[(4'hd):(4'hc)] << reg143));
              reg164 <= $unsigned(((~$signed((reg136 <<< reg162))) ?
                  (reg143[(3'h6):(2'h3)] ?
                      ($signed(reg118) >= reg119) : ((!reg134) ?
                          $unsigned(reg160) : reg157[(4'hc):(3'h6)])) : $signed(wire121[(2'h3):(1'h0)])));
            end
          reg165 <= (reg130[(4'h8):(4'h8)] != $unsigned(((-(~&(8'hb1))) ?
              reg133 : (reg135 ?
                  (reg160 & reg161) : (reg155 ? (8'ha2) : reg132)))));
          reg166 <= $unsigned((reg112 >= (!$unsigned((&reg108)))));
          reg167 <= (~|reg156[(4'hf):(4'hf)]);
          reg168 <= $unsigned($signed((-(reg141[(4'ha):(4'h8)] ?
              $signed(reg144) : ((7'h43) ? reg140 : reg139)))));
        end
    end
endmodule

module module81  (y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire86;
  input wire signed [(2'h2):(1'h0)] wire85;
  input wire signed [(3'h4):(1'h0)] wire84;
  input wire signed [(2'h3):(1'h0)] wire83;
  input wire signed [(3'h6):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire87;
  assign y = {wire92, wire91, wire90, wire89, wire88, wire87, (1'h0)};
  assign wire87 = $signed((8'hac));
  assign wire88 = {wire82[(3'h6):(2'h2)]};
  assign wire89 = (~^{wire84});
  assign wire90 = ((-wire86) ?
                      $signed(($unsigned((wire82 ~^ wire87)) ?
                          ($signed(wire88) || (~|wire82)) : wire85)) : {$signed((&wire86))});
  assign wire91 = (~&wire89[(2'h2):(1'h1)]);
  assign wire92 = $unsigned(wire84);
endmodule
