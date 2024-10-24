module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire133;
  wire signed [(5'h12):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire137;
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire65,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire126,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 (1'h0)};
  module4 #() modinst66 (.wire7(wire2), .clk(clk), .wire9(wire1), .wire5((8'ha8)), .wire8(wire3), .y(wire65), .wire6(wire0));
  assign wire67 = ((~^wire0) ?
                      wire3[(4'h9):(4'h8)] : (wire2 ?
                          ($unsigned((8'hb4)) ?
                              $signed(wire1) : $unsigned(wire1)) : wire1));
  assign wire68 = (($signed((((8'hb5) ?
                      wire2 : wire3) * (~^wire67))) && ({wire65[(2'h2):(1'h1)]} ?
                      wire1[(1'h1):(1'h1)] : ($signed((8'hb4)) ?
                          wire3[(1'h0):(1'h0)] : $unsigned((8'hbf))))) * $signed($signed($signed($signed(wire0)))));
  assign wire69 = wire0[(4'hb):(2'h3)];
  assign wire70 = ((wire3[(4'h9):(3'h7)] << {$signed((^~wire1))}) <<< $unsigned($unsigned($unsigned(wire67))));
  assign wire71 = (wire70 ?
                      ($unsigned({$unsigned(wire65)}) ?
                          $signed(({wire2,
                              wire0} >>> (wire68 <= wire68))) : ((wire3[(3'h5):(3'h5)] > $unsigned(wire70)) - $unsigned($signed(wire70)))) : $unsigned(wire68));
  module72 #() modinst127 (wire126, clk, wire3, wire65, wire1, wire70, wire67);
  assign wire128 = ($unsigned($unsigned(wire68[(3'h5):(1'h1)])) & (wire69[(2'h3):(1'h1)] << $signed((~^(wire65 ?
                       wire70 : (8'ha4))))));
  assign wire129 = wire3;
  assign wire130 = ($signed({wire1}) << wire0);
  module4 #() modinst132 (wire131, clk, wire130, wire0, wire2, wire65, wire1);
  assign wire133 = wire131;
  assign wire134 = {$unsigned((|$signed((8'ha2)))),
                       ((&$signed(wire1[(4'h9):(4'h8)])) > wire131)};
  assign wire135 = wire133;
  assign wire136 = (~(+(($signed(wire70) ^~ {wire135, wire65}) ?
                       {(wire3 ^~ wire0)} : $unsigned(wire2[(1'h0):(1'h0)]))));
  module4 #() modinst138 (.wire9(wire135), .y(wire137), .wire6(wire130), .clk(clk), .wire8(wire128), .wire7(wire68), .wire5(wire0));
endmodule

module module72
#(parameter param125 = (~^((^({(8'had), (8'hbb)} ? ((8'h9e) || (8'ha6)) : (|(8'hba)))) << ((~((8'hb1) && (8'h9e))) ? ({(8'hbc)} >> ((7'h42) == (8'hae))) : ((!(8'ha2)) ? ((8'hb2) == (8'ha2)) : (!(8'hbf)))))))
(y, clk, wire73, wire74, wire75, wire76, wire77);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire73;
  input wire [(4'he):(1'h0)] wire74;
  input wire [(4'hb):(1'h0)] wire75;
  input wire signed [(5'h12):(1'h0)] wire76;
  input wire [(5'h12):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire110;
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  assign y = {wire124,
                 wire114,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire110,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire78 = (~^wire73);
  assign wire79 = ((~wire75[(3'h5):(1'h0)]) ?
                      (wire73[(1'h0):(1'h0)] <= ({wire74[(3'h4):(3'h4)]} << (wire78 | ((8'hbf) ?
                          (8'hb6) : wire78)))) : {$unsigned((+(~&wire73))),
                          $unsigned((wire78[(4'h8):(1'h1)] | (~^wire76)))});
  assign wire80 = $unsigned(wire77[(3'h7):(3'h6)]);
  assign wire81 = wire79;
  module82 #() modinst111 (.y(wire110), .wire85(wire77), .wire83(wire80), .clk(clk), .wire84(wire78), .wire86(wire76), .wire87(wire79));
  always
    @(posedge clk) begin
      reg112 <= wire110;
      reg113 <= $unsigned($unsigned($unsigned((~|$signed(wire110)))));
    end
  assign wire114 = {((-{wire77[(4'hf):(4'hf)], (wire81 ? wire74 : wire77)}) ?
                           $unsigned(((~wire75) ?
                               (wire81 ?
                                   (8'hbe) : wire79) : $unsigned((8'hb4)))) : $unsigned($signed((&wire80)))),
                       ((wire78[(4'hb):(4'ha)] ?
                               $signed((wire76 ?
                                   wire77 : (8'h9e))) : wire74[(3'h6):(1'h0)]) ?
                           ((^~$signed((8'ha9))) ~^ $signed((wire77 ?
                               wire81 : wire73))) : wire79)};
  always
    @(posedge clk) begin
      if ($unsigned((wire73[(4'hc):(3'h5)] << ({wire110[(3'h5):(3'h5)]} ?
          {$signed(wire77), $unsigned(wire114)} : $unsigned((wire79 ?
              (8'hbe) : (8'ha1)))))))
        begin
          if ({($signed(($signed(wire79) << $unsigned(reg113))) << wire80[(4'hd):(3'h6)])})
            begin
              reg115 <= $unsigned({(~$signed(wire81[(1'h0):(1'h0)])),
                  {$signed((wire81 ? wire114 : wire74)), (8'hae)}});
            end
          else
            begin
              reg115 <= reg115;
              reg116 <= $signed(($signed(((wire114 && wire114) * wire110[(1'h0):(1'h0)])) ?
                  reg115 : (wire81[(2'h3):(1'h1)] ?
                      reg113 : wire73[(2'h3):(1'h1)])));
              reg117 <= wire78;
              reg118 <= $signed($unsigned($unsigned(wire77[(4'ha):(4'ha)])));
              reg119 <= wire79;
            end
          reg120 <= (~^(|reg116));
        end
      else
        begin
          reg115 <= $signed($signed(wire74[(2'h3):(1'h0)]));
          reg116 <= (+((-$unsigned(wire74)) ?
              (wire114 ?
                  $unsigned((reg116 <<< reg117)) : wire78[(5'h12):(1'h0)]) : $unsigned((reg119 ?
                  $unsigned((8'ha4)) : wire114[(1'h0):(1'h0)]))));
          reg117 <= (reg117[(1'h1):(1'h1)] ~^ reg112[(3'h6):(1'h1)]);
          if ($unsigned((wire78 ?
              $unsigned((~|$unsigned(reg112))) : (reg113 ?
                  ($unsigned(reg115) ?
                      {wire77} : reg119[(2'h3):(1'h0)]) : (wire76[(3'h4):(2'h3)] ?
                      reg120[(4'ha):(3'h6)] : wire77[(3'h7):(1'h0)])))))
            begin
              reg118 <= (($unsigned((^reg118[(3'h4):(1'h0)])) ?
                      reg119 : ($signed((~reg116)) ?
                          ((wire110 ? wire110 : wire75) ?
                              (reg113 ?
                                  (8'hb9) : (8'ha0)) : $signed(reg113)) : $signed((reg113 >= wire78)))) ?
                  reg119[(2'h3):(2'h2)] : reg115);
              reg119 <= reg120[(2'h2):(2'h2)];
              reg120 <= {wire81[(4'hc):(4'hc)],
                  (+($unsigned($signed(wire77)) ?
                      {(|(8'hae))} : $signed(reg118[(2'h3):(1'h1)])))};
              reg121 <= wire75;
              reg122 <= (reg121 == wire80);
            end
          else
            begin
              reg118 <= reg115;
              reg119 <= {(^(((wire77 ? wire75 : (8'hab)) ^~ (wire74 ?
                      wire76 : wire78)) & (((8'h9f) && wire81) + $unsigned(wire75))))};
              reg120 <= wire80[(4'hc):(4'hc)];
              reg121 <= $unsigned((reg116[(3'h6):(2'h3)] ^ {wire79[(5'h10):(3'h7)]}));
              reg122 <= ($unsigned(wire74) ? reg112 : (8'hb9));
            end
          reg123 <= (~^(|reg115));
        end
    end
  assign wire124 = $unsigned($unsigned($unsigned(reg112[(4'hd):(3'h7)])));
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire55;
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire57,
                 wire40,
                 wire27,
                 wire26,
                 wire14,
                 wire10,
                 wire55,
                 reg60,
                 reg59,
                 reg58,
                 reg25,
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
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = $unsigned((|$unsigned($unsigned(wire9[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg11 <= $signed($signed((&((wire9 ? wire5 : wire9) ?
          {wire7, (8'hb7)} : wire10[(2'h3):(1'h0)]))));
      reg12 <= (|(~(((wire6 >> wire9) ? wire9 : $signed(wire10)) ?
          reg11 : (reg11[(4'ha):(4'ha)] ? $unsigned((8'haa)) : (&(8'hbd))))));
      reg13 <= wire5;
    end
  assign wire14 = ($signed(($unsigned($unsigned(reg11)) <<< $signed((wire10 ^ (8'hb5))))) ?
                      wire8 : $signed($signed((((8'hbe) - (8'hb6)) | $signed(wire6)))));
  always
    @(posedge clk) begin
      if ($signed(wire8))
        begin
          reg15 <= $unsigned(((((-reg12) ^~ (8'hbb)) ?
              $signed((wire5 ?
                  wire9 : wire9)) : $signed((wire9 ~^ wire6))) || $unsigned(wire7[(2'h3):(1'h1)])));
          if ($unsigned(reg13))
            begin
              reg16 <= $signed({{$unsigned(reg11)}});
              reg17 <= (reg12 <<< $unsigned(wire8));
            end
          else
            begin
              reg16 <= reg13[(3'h4):(2'h3)];
            end
          reg18 <= $signed(reg13[(1'h0):(1'h0)]);
        end
      else
        begin
          reg15 <= (((!(reg17 ?
                  wire5[(1'h0):(1'h0)] : $signed((7'h41)))) - {$unsigned((~wire10))}) ?
              wire14[(3'h6):(2'h3)] : $unsigned(reg17));
          if ($unsigned($signed(((~$signed(reg12)) & (8'hb6)))))
            begin
              reg16 <= (8'hb1);
              reg17 <= (wire10 <= reg17);
              reg18 <= {reg15[(4'hf):(3'h4)]};
              reg19 <= wire8[(4'h8):(3'h6)];
            end
          else
            begin
              reg16 <= $signed((8'had));
              reg17 <= (|(8'ha8));
            end
          reg20 <= ({(~&({reg12, reg18} == {reg18}))} ?
              $signed((^~{(reg13 > reg11)})) : reg15[(3'h7):(3'h7)]);
          if (reg18[(4'hb):(4'h8)])
            begin
              reg21 <= (($unsigned((~|wire10)) ?
                  ($unsigned((wire14 && reg18)) ?
                      ($unsigned(reg15) ?
                          (+wire14) : reg17[(2'h3):(2'h3)]) : ((reg18 ?
                              reg12 : (8'ha2)) ?
                          $unsigned(wire5) : (reg20 | (8'ha0)))) : ((^((8'hb7) ?
                      wire10 : (8'hba))) | {$unsigned(wire5),
                      $signed(reg15)})) ^ reg20);
              reg22 <= reg16;
              reg23 <= (((((^~wire7) ? $unsigned(reg12) : ((8'hb2) <<< reg20)) ?
                  ({reg12} <= $unsigned((8'hba))) : {(!wire7)}) >>> reg13[(2'h2):(1'h1)]) && (8'hbf));
            end
          else
            begin
              reg21 <= (|(wire7[(2'h2):(1'h1)] + (-reg15[(4'he):(4'h9)])));
            end
        end
      reg24 <= reg20[(2'h3):(2'h3)];
      reg25 <= (-(~&wire5));
    end
  assign wire26 = (+reg12);
  assign wire27 = wire6[(4'ha):(3'h5)];
  module28 #() modinst41 (wire40, clk, reg15, reg23, wire6, wire26, wire27);
  module42 #() modinst56 (.wire47(wire27), .wire45(wire14), .wire46(wire5), .wire44(reg16), .clk(clk), .y(wire55), .wire43(reg11));
  assign wire57 = ((wire14[(2'h3):(2'h3)] >= ($signed((~|(7'h42))) ?
                      (~reg11[(4'hb):(3'h5)]) : $signed((wire6 >= (8'ha9))))) * reg23[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg58 <= wire40;
      reg59 <= wire55[(1'h1):(1'h0)];
      reg60 <= ($signed($signed({$signed(reg24), wire10})) ?
          $signed($signed(reg23[(5'h13):(4'he)])) : (&({reg13[(2'h3):(2'h3)],
              (+reg11)} - reg15)));
    end
  assign wire61 = reg23;
  assign wire62 = $signed($unsigned((^(!reg11[(2'h3):(2'h3)]))));
  assign wire63 = $signed((^~(^~(wire8[(3'h6):(3'h6)] ?
                      (reg18 ? wire26 : (8'ha5)) : (&reg60)))));
  assign wire64 = (8'hbc);
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire47;
  input wire signed [(4'hc):(1'h0)] wire46;
  input wire [(2'h2):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(4'hc):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  assign y = {wire54, wire53, wire52, wire51, wire50, wire49, wire48, (1'h0)};
  assign wire48 = ((wire45[(2'h2):(2'h2)] == (^wire44)) ?
                      {$unsigned($signed((wire45 >> wire43))),
                          ((&$signed(wire45)) * $signed({wire43,
                              wire44}))} : ($signed(($unsigned(wire43) >= (~^wire47))) <= {$unsigned(wire47)}));
  assign wire49 = wire48;
  assign wire50 = (($signed((&$unsigned(wire48))) ?
                          $unsigned(wire48) : (^$unsigned($unsigned(wire46)))) ?
                      $signed((wire44 | (~|wire46))) : wire46[(2'h3):(2'h2)]);
  assign wire51 = $signed(wire44);
  assign wire52 = (8'haa);
  assign wire53 = $unsigned(({($signed((8'ha2)) == (wire46 ? wire51 : wire52)),
                      (&(wire50 ~^ wire48))} >>> $signed($signed($unsigned(wire52)))));
  assign wire54 = wire48;
endmodule

module module28
#(parameter param39 = (({(((8'hb8) && (8'h9d)) ? ((8'haf) <= (8'hb8)) : ((7'h42) ? (8'h9c) : (8'hb6))), {{(8'hbe), (8'hb6)}}} <<< (8'ha6)) ? {((|((8'hb1) << (8'ha7))) < (|(^~(8'ha9)))), {((|(7'h42)) ? (^(8'hb7)) : (8'hbb))}} : ((8'ha5) + (8'h9c))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire33;
  input wire signed [(4'hd):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  assign y = {wire38, wire37, wire36, wire35, wire34, (1'h0)};
  assign wire34 = (|(wire29 ?
                      (wire29 ? {(|wire32)} : wire31) : (!{wire33,
                          (wire30 ? wire31 : wire31)})));
  assign wire35 = {$unsigned(wire29)};
  assign wire36 = (~^(&wire35[(3'h6):(2'h3)]));
  assign wire37 = (8'had);
  assign wire38 = ((!wire30) ?
                      ($signed((8'hb0)) ?
                          ((^~wire31) ?
                              ($signed(wire29) > $signed(wire36)) : $unsigned(wire36)) : wire31[(1'h0):(1'h0)]) : {(wire37 | (+(wire30 <= wire29))),
                          (wire32[(2'h2):(1'h0)] >> (wire36[(2'h2):(1'h0)] ^ wire31[(2'h2):(1'h0)]))});
endmodule

module module82
#(parameter param108 = ((&(-{((8'ha3) | (8'ha6)), ((8'ha1) ? (7'h41) : (8'hbc))})) ? (((~&((8'ha9) ? (8'hbd) : (8'ha5))) ~^ (^((8'hbc) >= (8'hbf)))) ? ((((8'had) ? (8'hae) : (7'h40)) ? {(8'hbc), (8'had)} : ((7'h42) ? (8'hb7) : (7'h44))) ^~ ((!(8'hbb)) ~^ ((8'haf) * (8'hb3)))) : (((^(8'haa)) >> {(8'ha7), (8'hbd)}) ? (((7'h44) ? (8'ha9) : (8'hb7)) ? {(8'hb1)} : (+(8'haf))) : (&((8'hab) ? (8'h9f) : (8'ha9))))) : ({({(8'hb0)} >> ((8'h9e) >= (8'hb6))), (^~((8'ha8) >= (8'hac)))} & (({(8'haf)} <<< {(7'h43), (8'h9d)}) ? ((!(8'ha8)) != {(8'hb9)}) : (!((8'ha6) ? (8'hb6) : (8'ha8)))))), 
parameter param109 = {((((+param108) ? param108 : ((8'ha4) > param108)) ? (param108 <= (+param108)) : ((~^param108) << param108)) != (^~((param108 <= param108) ? param108 : (param108 ? param108 : param108))))})
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire signed [(4'h9):(1'h0)] wire86;
  input wire [(2'h3):(1'h0)] wire85;
  input wire signed [(4'hc):(1'h0)] wire84;
  input wire [(4'hd):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire88;
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg102,
                 (1'h0)};
  assign wire88 = (^~(-{wire84[(3'h7):(3'h6)], {(~(8'ha0))}}));
  assign wire89 = (~|{(({wire85} ^~ wire84) ^ $unsigned($unsigned(wire83)))});
  assign wire90 = ($signed(($unsigned(wire84) ^~ wire87)) ?
                      $unsigned(($signed(wire89) ?
                          $unsigned($signed((8'h9e))) : $signed(wire84[(3'h7):(3'h6)]))) : $signed(wire88[(5'h10):(4'ha)]));
  assign wire91 = (|$unsigned(($signed((wire87 - wire86)) ?
                      {(8'ha2), $unsigned((8'hae))} : (!(^wire89)))));
  assign wire92 = $signed(($unsigned((^$unsigned(wire88))) ?
                      ((|(wire87 == wire91)) ?
                          {$signed(wire90),
                              wire89} : wire83) : $signed((~wire84[(4'hb):(2'h3)]))));
  assign wire93 = $unsigned(wire88[(3'h7):(3'h5)]);
  assign wire94 = ((wire86[(2'h3):(1'h1)] ?
                          ($signed((wire84 ?
                              wire90 : wire87)) && $unsigned((~^wire85))) : $signed(((wire85 || wire83) > wire87[(4'hc):(4'h8)]))) ?
                      (&$signed((&$unsigned(wire90)))) : (^wire88[(5'h15):(3'h6)]));
  assign wire95 = (wire86[(3'h4):(2'h3)] ?
                      (^wire87[(4'h8):(1'h0)]) : {$signed(($unsigned(wire90) ?
                              $unsigned(wire92) : (^wire90))),
                          $signed(((wire91 << (8'hbe)) * $signed(wire92)))});
  assign wire96 = $signed((8'h9e));
  assign wire97 = (^wire87[(3'h4):(2'h3)]);
  assign wire98 = ((($unsigned({wire92, wire96}) ?
                              (|(&wire91)) : wire97[(4'hd):(1'h1)]) ?
                          (($unsigned(wire86) ?
                                  wire85[(1'h0):(1'h0)] : wire86) ?
                              $unsigned((wire83 ?
                                  (8'hb2) : (8'hb6))) : wire89) : wire85[(1'h0):(1'h0)]) ?
                      (wire85 ?
                          wire87 : ((+(^~wire91)) ?
                              ((wire93 ?
                                  (8'ha6) : wire95) >= $unsigned(wire96)) : ({wire91} ?
                                  {wire91,
                                      wire89} : (!wire83)))) : wire86[(3'h5):(2'h2)]);
  assign wire99 = {($unsigned((((8'hb1) ? wire95 : wire84) > wire86)) ?
                          ((wire87[(4'hb):(1'h1)] == ((8'hbb) ?
                                  wire98 : wire92)) ?
                              wire88[(4'hc):(2'h3)] : $signed({wire90})) : $signed(((wire91 <= wire96) ?
                              {wire83} : {(8'hab), wire87}))),
                      wire97};
  assign wire100 = (^~($signed(wire96[(2'h2):(1'h1)]) ?
                       wire89[(2'h2):(2'h2)] : ($signed($unsigned(wire85)) ?
                           wire89 : wire88[(4'hc):(1'h1)])));
  assign wire101 = $unsigned({$signed(wire88)});
  always
    @(posedge clk) begin
      reg102 <= $unsigned(wire95[(2'h2):(1'h0)]);
    end
  assign wire103 = {wire98};
  assign wire104 = (~^wire99);
  assign wire105 = $unsigned(wire103[(1'h1):(1'h1)]);
  assign wire106 = $unsigned(wire103[(3'h7):(1'h0)]);
  assign wire107 = (wire87 >>> (wire105[(4'hb):(3'h6)] ?
                       (wire93 >>> $unsigned(wire83)) : ($signed((wire97 == wire93)) | (~^$unsigned(wire89)))));
endmodule
