module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire54;
  assign y = {wire99,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire4,
                 wire54,
                 (1'h0)};
  assign wire4 = ($unsigned(wire3[(3'h4):(1'h0)]) ?
                     wire1[(5'h12):(5'h10)] : wire0);
  module5 #() modinst55 (.wire6(wire3), .y(wire54), .wire7(wire2), .wire10(wire0), .wire9(wire4), .wire8(wire1), .clk(clk));
  assign wire56 = (~&wire0);
  assign wire57 = (^~((+((wire2 > wire2) ? {(8'hbf)} : wire4[(4'ha):(2'h2)])) ?
                      {$unsigned($signed(wire56))} : (($signed(wire4) >> wire56) << (8'hbc))));
  assign wire58 = ($signed(wire1[(4'hc):(4'h9)]) ?
                      {$signed({(wire57 ? (7'h42) : wire4)}),
                          {wire57[(3'h4):(3'h4)],
                              ($signed(wire3) ~^ $unsigned(wire54))}} : (wire4[(4'he):(3'h5)] < $signed(((8'ha1) <= $unsigned(wire3)))));
  assign wire59 = {((^~wire2) ?
                          (-wire2[(4'ha):(3'h7)]) : wire56[(1'h1):(1'h0)]),
                      ($signed($signed({wire4})) * {$signed($signed(wire54))})};
  assign wire60 = $signed(wire3);
  assign wire61 = (((wire58 ?
                          $signed((8'hba)) : {(wire60 ? wire1 : wire1),
                              {wire60}}) <= (wire57 - $unsigned(wire1))) ?
                      $unsigned((~&$unsigned((wire54 + wire58)))) : wire0[(5'h13):(4'h9)]);
  assign wire62 = wire61[(4'hd):(1'h1)];
  assign wire63 = $signed((((8'ha6) ?
                      ((wire54 * wire54) >>> (wire57 ?
                          wire2 : wire57)) : {{wire56, wire57},
                          wire0}) - $signed($signed($unsigned(wire1)))));
  module64 #() modinst100 (wire99, clk, wire56, wire59, wire3, wire2);
endmodule

module module64
#(parameter param97 = ((((((8'ha7) ? (8'hab) : (8'ha9)) ? ((8'hba) ? (8'hbf) : (8'hb7)) : (&(8'ha2))) * ((8'ha4) ? ((7'h40) ? (7'h41) : (8'h9c)) : (&(8'hbb)))) ? ((&{(7'h40), (8'hb8)}) ? (((8'had) ? (8'hb0) : (8'hb0)) < ((8'h9d) | (8'ha7))) : {((7'h44) ? (8'hba) : (8'hba)), ((8'hb1) ? (8'hba) : (8'hb0))}) : ((8'ha9) ? ((^~(8'hb2)) != (8'hab)) : (~|((8'hb7) ? (8'hae) : (8'hbe))))) ? (+((~|((8'hb5) ? (8'hbe) : (8'hba))) ? (8'ha5) : {(8'hbc), {(7'h41)}})) : (~^(~(((8'hae) ? (8'ha7) : (8'h9c)) + {(8'ha7)})))), 
parameter param98 = (-param97))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire68;
  input wire [(5'h10):(1'h0)] wire67;
  input wire [(4'hc):(1'h0)] wire66;
  input wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire69;
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  assign y = {wire95, wire94, wire92, wire69, reg96, (1'h0)};
  assign wire69 = (~&(({(wire66 ? wire67 : wire68),
                      {wire68, wire66}} & (&(wire65 ?
                      wire67 : (7'h40)))) ^~ ({wire68} || wire68)));
  module70 #() modinst93 (.wire71(wire68), .wire73(wire67), .wire74(wire69), .wire72(wire66), .clk(clk), .y(wire92));
  assign wire94 = $unsigned(wire65);
  assign wire95 = $signed((~wire68[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg96 <= $unsigned((|(|(wire95[(2'h2):(1'h1)] ?
          ((8'h9d) ? wire68 : wire66) : {wire65}))));
    end
endmodule

module module5
#(parameter param53 = (-((8'h9f) << ((((8'hb2) ? (8'hbf) : (8'haa)) >> ((8'h9f) >>> (7'h42))) ? (((7'h41) ? (8'ha5) : (8'hb6)) ? ((8'hbd) <= (8'hbb)) : ((8'ha2) <= (8'ha8))) : (((8'hbc) ? (8'ha4) : (8'hb5)) ? ((8'ha0) <= (8'hb5)) : (^~(8'ha0)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(4'hb):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire32;
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire35,
                 wire34,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire32,
                 reg49,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire11 = $signed(($signed(wire9[(3'h7):(3'h7)]) ?
                      $unsigned((((8'had) + (8'ha6)) ?
                          wire9 : ((8'hb7) + (8'hb9)))) : $unsigned(wire8)));
  assign wire12 = $unsigned($signed($unsigned((wire6[(3'h5):(2'h2)] ?
                      $unsigned(wire11) : wire10[(3'h7):(3'h5)]))));
  assign wire13 = ((wire10 ?
                      $signed(wire8[(3'h4):(1'h0)]) : {wire9[(5'h12):(4'he)]}) && (|wire8));
  assign wire14 = (&$signed($unsigned((+wire10))));
  module15 #() modinst33 (wire32, clk, wire10, wire7, wire6, wire9, wire12);
  assign wire34 = ($signed($signed(((wire9 ? wire7 : (8'ha5)) ?
                      $unsigned(wire7) : (8'hb1)))) ^~ $signed(wire6[(2'h2):(1'h0)]));
  assign wire35 = wire13;
  always
    @(posedge clk) begin
      reg36 <= $unsigned($signed({(wire8 || (wire7 + wire6)), $signed(wire9)}));
      reg37 <= wire13;
      if ($unsigned($unsigned($signed((wire11[(4'h8):(1'h1)] ?
          (~&wire14) : $signed((8'ha7)))))))
        begin
          reg38 <= wire8;
          reg39 <= wire10[(3'h6):(3'h4)];
          reg40 <= wire35[(4'he):(1'h1)];
          reg41 <= wire13;
          if ($signed({((8'hb2) ? $unsigned($signed(wire34)) : wire34),
              wire14[(1'h1):(1'h0)]}))
            begin
              reg42 <= (+(^(8'h9d)));
            end
          else
            begin
              reg42 <= $unsigned($signed(reg39));
            end
        end
      else
        begin
          reg38 <= ($unsigned(wire14[(2'h2):(1'h1)]) >> (^~(&$signed(wire35))));
          reg39 <= ((-$signed(((&(8'h9d)) ?
              $signed(wire8) : reg38))) >> $signed(reg37[(1'h1):(1'h1)]));
          reg40 <= $unsigned((~^$unsigned(wire13[(3'h5):(3'h4)])));
        end
      if ((~|$unsigned((&(wire7[(3'h4):(1'h1)] <<< (~|wire14))))))
        begin
          reg43 <= wire11[(4'ha):(4'h9)];
          reg44 <= $unsigned(($unsigned(($unsigned(wire11) <<< {(8'hb2),
                  reg41})) ?
              ({$unsigned(reg42), $unsigned(wire13)} ?
                  {wire9[(1'h0):(1'h0)],
                      ((8'hae) ?
                          reg38 : reg38)} : $unsigned(reg38[(3'h7):(2'h2)])) : (wire9[(5'h11):(5'h10)] ^~ (^$unsigned(wire14)))));
        end
      else
        begin
          if (wire34[(1'h1):(1'h1)])
            begin
              reg43 <= $signed(wire10[(1'h1):(1'h0)]);
              reg44 <= (|reg44[(1'h0):(1'h0)]);
              reg45 <= {$unsigned(wire6[(4'ha):(1'h0)])};
              reg46 <= {wire7};
            end
          else
            begin
              reg43 <= (((-wire34[(3'h4):(2'h3)]) == wire14[(2'h2):(2'h2)]) < $signed(((wire13[(3'h5):(3'h4)] * $signed(wire13)) << ($signed((8'hb0)) * {reg45}))));
              reg44 <= reg42;
              reg45 <= ((~&$unsigned($signed((wire35 ?
                  wire14 : wire13)))) | (~|(wire9 | reg41)));
              reg46 <= $signed($unsigned($unsigned((8'hbf))));
            end
          reg47 <= reg39;
        end
    end
  assign wire48 = $signed(wire13[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg49 <= $signed($signed($unsigned($unsigned(wire11[(3'h4):(1'h0)]))));
    end
  assign wire50 = reg44[(3'h5):(2'h3)];
  assign wire51 = $unsigned(((+$unsigned((wire10 ?
                      reg44 : wire9))) < wire34[(3'h4):(2'h2)]));
  assign wire52 = $unsigned((~^(8'haa)));
endmodule

module module15
#(parameter param31 = ((+(((&(8'ha9)) ? {(8'hb9), (8'hb8)} : (8'hbf)) ? (((8'h9d) ? (8'ha5) : (8'hb9)) || {(8'hb7), (8'h9c)}) : ({(8'ha4), (8'hb1)} & ((8'hbd) + (8'h9c))))) & (^~(~|((~(8'hb4)) ? {(8'ha9)} : ((8'h9d) ? (8'hb7) : (8'ha2)))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(4'hb):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = $unsigned(wire20[(3'h7):(3'h7)]);
  assign wire22 = $signed(({wire20, {(wire19 && (8'hac))}} - (wire16 ?
                      (wire19 <<< (^~wire17)) : $signed((wire21 <<< (8'ha1))))));
  assign wire23 = ({wire19[(4'ha):(1'h0)]} ?
                      wire22 : ((+wire16) <= (wire18 & ($unsigned(wire22) <<< (wire16 ^~ wire20)))));
  assign wire24 = (($signed(wire19) ?
                      ($signed((wire20 > wire22)) ^ $signed(wire19[(4'h9):(4'h8)])) : wire18) >>> (wire22[(2'h2):(1'h0)] ?
                      $signed(wire22) : (^~$signed((wire21 << wire18)))));
  assign wire25 = (wire17[(4'hc):(4'ha)] || ({wire18,
                          {$signed((8'hbd)), (wire18 ? wire21 : (8'h9e))}} ?
                      $signed((|(!wire18))) : wire22));
  assign wire26 = wire23;
  assign wire27 = ($unsigned($unsigned((~(wire26 ? (8'ha3) : wire19)))) ?
                      $signed((8'ha7)) : $signed(((-wire18) ?
                          ((^~wire23) ?
                              $signed(wire17) : wire24) : $unsigned((wire20 ?
                              wire23 : wire17)))));
  assign wire28 = wire19;
  assign wire29 = ((~wire18[(4'h8):(2'h2)]) ~^ (($unsigned((wire22 ?
                          wire28 : wire20)) ?
                      (wire24[(4'hb):(4'h8)] ?
                          wire25 : (^wire24)) : (~(wire17 < wire18))) ^~ wire16));
  assign wire30 = (^~wire29[(2'h2):(1'h0)]);
endmodule

module module70
#(parameter param90 = (|(((((8'h9d) ? (8'ha8) : (8'hb8)) * (|(8'hb3))) ? (~((8'h9c) ? (8'ha4) : (8'h9c))) : (-(~|(8'hae)))) >= (~|(~&((8'hb8) <<< (8'hae)))))), 
parameter param91 = ((^~(((8'ha8) ? (param90 ? param90 : param90) : (8'ha1)) << (+{param90}))) ? param90 : (!({(|(8'ha1)), ((8'ha0) <= param90)} + (((8'hbc) ? param90 : param90) != (param90 ? param90 : param90))))))
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire74;
  input wire [(5'h10):(1'h0)] wire73;
  input wire [(4'hc):(1'h0)] wire72;
  input wire signed [(4'he):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire75 = wire74;
  assign wire76 = ($unsigned($unsigned(wire71)) >>> wire71[(1'h0):(1'h0)]);
  assign wire77 = (wire74 ?
                      wire73 : (^~((&((8'hb0) <= wire74)) && wire71[(1'h0):(1'h0)])));
  assign wire78 = {($unsigned($signed($unsigned(wire71))) ?
                          wire74[(3'h6):(3'h4)] : ((-(wire75 > (8'ha7))) <<< (-{wire73})))};
  assign wire79 = (((wire75[(4'h9):(3'h4)] ?
                          wire76[(4'hc):(4'h8)] : ($unsigned((8'had)) ?
                              (wire76 ?
                                  wire75 : wire71) : (~|wire73))) > $signed({(+wire72)})) ?
                      (wire76[(1'h1):(1'h0)] ?
                          (&($unsigned((8'ha0)) ?
                              (|wire74) : (&(8'hb3)))) : $unsigned($signed($signed(wire78)))) : $signed((({wire73} ?
                          $signed((8'hbd)) : $unsigned(wire78)) * $unsigned(wire75))));
  assign wire80 = (~^wire77);
  assign wire81 = ($unsigned($unsigned(wire72)) && wire78);
  always
    @(posedge clk) begin
      reg82 <= $signed(($signed((~|$unsigned(wire79))) ?
          (wire76[(4'hf):(1'h0)] ?
              {(wire72 ~^ wire71)} : $signed(wire74)) : ((((8'hbe) ?
                  wire71 : (8'hb4)) ?
              wire79[(3'h7):(3'h7)] : wire76[(3'h5):(3'h4)]) ~^ (|(^wire73)))));
      reg83 <= reg82;
      reg84 <= $signed(((((wire78 ?
          wire76 : wire74) ^ (wire81 << (8'hab))) | wire78) & {reg83[(3'h5):(2'h3)]}));
      reg85 <= ((!wire71[(4'hc):(4'hb)]) > (wire74 ?
          wire76[(4'hf):(1'h1)] : (^~({wire73, wire80} ?
              {(8'ha7), wire71} : wire72))));
      reg86 <= ($unsigned($signed({$unsigned(reg85),
          {(8'had)}})) == $unsigned(wire71[(3'h5):(1'h0)]));
    end
  assign wire87 = wire71;
  assign wire88 = $signed(($signed((-$unsigned(wire74))) ?
                      (|$unsigned((wire73 ~^ (8'hba)))) : {((^~wire79) + $signed(wire72))}));
  assign wire89 = (^~reg83[(2'h2):(1'h0)]);
endmodule
