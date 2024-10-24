module top
#(parameter param71 = (+(-{(8'hbe)})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire69,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire4 = (8'hbe);
  assign wire5 = (($unsigned(($unsigned((8'hbc)) ?
                             wire3[(2'h2):(2'h2)] : wire4[(3'h7):(3'h6)])) ?
                         ((&(wire0 ? wire1 : wire1)) ?
                             $signed((~&wire4)) : ((^wire1) ?
                                 wire2[(3'h6):(1'h0)] : (^~wire0))) : (wire0 ?
                             $unsigned($signed((8'ha8))) : (|(~&wire4)))) ?
                     ((wire4 ?
                             ((wire2 ? wire1 : wire4) ?
                                 (wire3 + wire3) : $unsigned(wire2)) : ((~|wire3) & $unsigned(wire3))) ?
                         {$signed($signed(wire0)),
                             $unsigned((wire1 > wire0))} : {{(wire1 ?
                                     (8'hbf) : wire1)},
                             (8'haf)}) : $unsigned(((8'hbe) ^~ (wire0[(1'h0):(1'h0)] < $unsigned(wire2)))));
  assign wire6 = $signed((+wire3));
  assign wire7 = ($unsigned(wire6[(2'h3):(2'h2)]) + wire5[(4'h9):(1'h1)]);
  always
    @(posedge clk) begin
      reg8 <= ((^wire1) >> wire1);
    end
  assign wire9 = $unsigned(wire2[(3'h6):(1'h0)]);
  assign wire10 = $unsigned(((^~(-$signed(wire5))) ?
                      (|(((8'ha6) ? wire0 : wire6) <<< (~|wire6))) : (&((wire0 ?
                          wire1 : (8'ha9)) == (wire7 || wire9)))));
  assign wire11 = ($unsigned(($signed(wire3) >= $unsigned($unsigned(wire2)))) ?
                      wire2 : (|(((wire3 ? wire9 : wire7) != (&wire10)) ?
                          (wire3[(1'h0):(1'h0)] != (wire7 && wire6)) : (~&(wire9 ?
                              wire3 : wire3)))));
  always
    @(posedge clk) begin
      if ($signed($signed((^~wire6))))
        begin
          reg12 <= (8'hba);
          reg13 <= (wire10 ?
              ($signed(((reg12 || wire7) ? {wire5} : (+wire6))) ~^ ((8'hb1) ?
                  $signed({wire1, wire5}) : ({wire4, reg8} ?
                      (!reg8) : (|wire0)))) : ($signed($signed(wire7[(3'h6):(1'h0)])) ?
                  (($signed(wire10) >>> $unsigned(wire10)) && ($unsigned((8'hae)) ?
                      (8'hbb) : $unsigned(wire7))) : wire0[(2'h3):(1'h1)]));
          reg14 <= $unsigned({wire7[(3'h5):(3'h5)]});
        end
      else
        begin
          if ((8'hb9))
            begin
              reg12 <= ((wire2[(2'h3):(2'h2)] ?
                  ($unsigned((reg8 & wire9)) & reg8[(3'h6):(2'h3)]) : (~&wire9)) - $unsigned($signed(($unsigned(reg13) ?
                  $unsigned(reg14) : reg14[(2'h3):(1'h0)]))));
              reg13 <= ((wire11[(1'h0):(1'h0)] ?
                      {wire5[(4'h9):(4'h9)], reg14} : ((^$unsigned(wire10)) ?
                          wire0 : {$signed(wire9)})) ?
                  wire10[(4'h8):(3'h4)] : (8'ha5));
              reg14 <= ((~&(-(&$unsigned(wire3)))) ?
                  ($unsigned(($signed(reg12) ?
                      (wire11 ?
                          reg12 : (8'hb1)) : (-reg14))) >> wire6[(5'h11):(4'he)]) : $signed(wire3[(5'h12):(4'hd)]));
            end
          else
            begin
              reg12 <= wire7[(1'h0):(1'h0)];
              reg13 <= wire7[(4'ha):(4'ha)];
            end
          reg15 <= ((wire9 ?
              $unsigned((|$unsigned(wire3))) : wire11) << $signed($unsigned($signed($signed(wire2)))));
          if (wire0[(3'h4):(3'h4)])
            begin
              reg16 <= wire2[(4'h8):(4'h8)];
            end
          else
            begin
              reg16 <= wire5;
              reg17 <= wire4;
            end
        end
    end
  module18 #() modinst70 (wire69, clk, reg8, wire0, wire6, reg15, reg12);
endmodule

module module18
#(parameter param67 = {(8'haf), (~&{((~^(8'h9c)) ? (-(8'hb1)) : ((8'hb7) ? (8'hbb) : (8'ha7)))})}, 
parameter param68 = param67)
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire58;
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire58,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire24 = $unsigned(wire19);
  assign wire25 = $signed($unsigned(wire23[(4'h8):(2'h3)]));
  assign wire26 = $unsigned({$unsigned(wire21)});
  assign wire27 = {$signed(wire23)};
  assign wire28 = (wire19[(2'h2):(1'h1)] ?
                      {{(~(wire21 ^~ wire22)),
                              ($signed(wire20) ~^ (~&wire25))}} : wire21[(1'h0):(1'h0)]);
  assign wire29 = $signed(((~&($unsigned(wire27) >>> (wire27 ^~ wire25))) + (wire24 ?
                      wire28 : {{wire26, wire22}})));
  assign wire30 = ((wire28[(4'he):(4'h9)] ?
                      (^$unsigned(wire26[(4'he):(2'h2)])) : (|$unsigned({wire25,
                          wire27}))) <= wire20);
  assign wire31 = wire21;
  assign wire32 = $signed((8'hb4));
  assign wire33 = wire32[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg34 <= $signed(wire26);
      reg35 <= wire21[(3'h4):(1'h1)];
      reg36 <= wire24[(1'h1):(1'h1)];
    end
  module37 #() modinst59 (.wire39(wire28), .wire38(wire24), .wire41(wire25), .y(wire58), .wire42(wire23), .clk(clk), .wire40(wire33));
  assign wire60 = reg35;
  assign wire61 = ($signed({({wire25} ? wire19 : $unsigned(reg35))}) ?
                      (~wire60[(3'h4):(1'h0)]) : wire28);
  assign wire62 = (!wire21);
  assign wire63 = wire23[(3'h6):(3'h6)];
  assign wire64 = $unsigned((|(((~wire22) ?
                      (+wire63) : ((8'haf) ?
                          wire27 : wire23)) + (wire30 > ((8'hbe) - wire22)))));
  assign wire65 = $signed(wire60);
  assign wire66 = wire24[(5'h15):(4'ha)];
endmodule

module module37
#(parameter param56 = ((((((8'h9d) ? (8'hab) : (8'h9c)) ? {(8'h9d), (8'ha0)} : (~&(8'ha3))) - {(~(8'hab))}) ? (({(8'had)} ? (^(8'ha7)) : ((8'ha7) ? (7'h42) : (8'hac))) || ((~^(8'ha3)) ? ((8'hb4) || (8'hb5)) : (~^(8'hbb)))) : (((8'ha1) ? ((8'hb4) ? (8'ha8) : (8'hbe)) : ((8'hb0) ? (8'ha6) : (8'hac))) ^ ((~&(8'h9f)) && ((8'hb7) ? (8'hb2) : (8'ha0))))) ^~ (((((8'h9f) ? (8'hbc) : (8'ha8)) ^~ ((8'hb1) >>> (8'hb0))) & (((8'ha0) ^~ (8'h9e)) > {(8'hb0)})) ? (8'hb1) : (8'ha0))), 
parameter param57 = {{((~&((8'ha5) + param56)) ? ((8'hb8) ? param56 : (~^param56)) : {(param56 ? (8'hb6) : param56)}), {((8'hbb) || (param56 != param56)), ((param56 <<< param56) && ((8'ha7) <= param56))}}, param56})
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire42;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  input wire signed [(3'h6):(1'h0)] wire39;
  input wire [(5'h15):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire43 = wire40[(4'hb):(2'h3)];
  assign wire44 = (wire41 != {wire41[(1'h1):(1'h1)], wire43[(1'h1):(1'h0)]});
  assign wire45 = {$unsigned(wire40[(3'h4):(1'h0)]), {(|wire38)}};
  assign wire46 = ({{$signed((wire40 ? (8'had) : wire43))},
                          {wire44[(3'h4):(2'h2)]}} ?
                      $signed((|wire40[(4'ha):(3'h7)])) : (^$signed({$unsigned(wire38),
                          (~|wire45)})));
  assign wire47 = wire44[(3'h4):(2'h3)];
  assign wire48 = (+(+$signed(wire46)));
  assign wire49 = ((~|wire44[(3'h6):(3'h4)]) ?
                      wire40[(4'hc):(3'h5)] : $signed(wire39));
  assign wire50 = (&$signed(($unsigned(wire43) | (wire45 && (wire47 ?
                      wire38 : wire45)))));
  always
    @(posedge clk) begin
      reg51 <= (wire43 >> $unsigned($unsigned((~&$unsigned(wire41)))));
      reg52 <= (($unsigned($signed((wire44 && reg51))) ^~ $signed($unsigned({(8'hb3),
          wire45}))) & $unsigned($unsigned($unsigned(wire45))));
    end
  assign wire53 = ($unsigned({$unsigned($signed(reg52)),
                          ($unsigned(wire45) * ((8'hb0) ? wire41 : wire49))}) ?
                      $unsigned($unsigned((wire50[(4'he):(1'h0)] ?
                          (reg52 == reg52) : (reg52 & reg52)))) : $unsigned($signed(wire47[(4'h9):(3'h5)])));
  assign wire54 = wire40;
  assign wire55 = $signed((&($signed((wire44 ?
                      reg52 : wire39)) || ($unsigned(wire47) ?
                      wire44 : $signed((8'hb9))))));
endmodule
