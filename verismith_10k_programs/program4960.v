module top
#(parameter param99 = ((-((~((8'ha6) ? (8'h9f) : (8'haf))) | (!(~|(8'hb5))))) == (~|({(-(8'ha7))} ? (((8'ha6) >>> (8'ha8)) <= (&(8'ha3))) : (((8'hbe) ? (8'ha6) : (8'had)) ? (8'hb0) : (^(8'hb4)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire19;
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  assign y = {wire79,
                 wire37,
                 wire21,
                 wire19,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg36,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  module5 #() modinst20 (.wire9(wire2), .clk(clk), .wire7(wire4), .y(wire19), .wire8(wire0), .wire6(wire1), .wire10(wire3));
  assign wire21 = $unsigned((!wire19[(3'h7):(3'h4)]));
  always
    @(posedge clk) begin
      reg22 <= ((((wire3[(5'h11):(4'h8)] ? {(8'ha6)} : (wire4 || wire4)) ?
          {(8'hb9),
              ((8'ha9) ?
                  wire19 : (8'h9e))} : $unsigned((~|wire19))) - $unsigned($unsigned(wire1))) >>> ((wire0[(2'h3):(1'h0)] ?
          ((8'haa) ?
              (wire0 << wire3) : wire4) : wire2[(2'h2):(2'h2)]) ~^ wire3));
      if (wire19[(1'h0):(1'h0)])
        begin
          reg23 <= wire2[(5'h10):(4'h9)];
        end
      else
        begin
          reg23 <= (~&wire21[(3'h6):(3'h5)]);
          reg24 <= (wire21[(3'h7):(3'h6)] >> wire4[(4'hc):(1'h0)]);
          reg25 <= (~|(|wire3[(4'ha):(3'h4)]));
        end
      if (reg25[(2'h2):(2'h2)])
        begin
          if (reg23[(1'h1):(1'h1)])
            begin
              reg26 <= $unsigned($signed(wire21[(3'h5):(2'h2)]));
              reg27 <= wire4[(4'hb):(3'h7)];
              reg28 <= $signed($signed({reg27[(4'h8):(1'h1)]}));
              reg29 <= (reg22[(2'h3):(2'h2)] ?
                  (~&reg24[(1'h1):(1'h1)]) : reg25);
            end
          else
            begin
              reg26 <= $unsigned($signed({$unsigned($signed(reg28))}));
              reg27 <= $signed({(((reg22 >>> wire19) != reg23[(2'h2):(2'h2)]) + {wire19[(3'h6):(3'h5)]}),
                  $signed(((~|reg29) * {(7'h44), (8'hbc)}))});
            end
          reg30 <= (({wire19[(1'h1):(1'h0)]} < wire3) ~^ {reg23});
          reg31 <= reg25;
        end
      else
        begin
          reg26 <= reg29;
          reg27 <= $unsigned(($unsigned($signed(wire4)) ?
              $unsigned(reg24[(2'h3):(2'h3)]) : $unsigned((reg26 >= $unsigned(wire21)))));
        end
    end
  always
    @(posedge clk) begin
      reg32 <= {reg30[(1'h0):(1'h0)]};
      reg33 <= wire4;
      reg34 <= $unsigned($signed($signed($unsigned($unsigned(wire21)))));
      reg35 <= ((((~&$unsigned(wire4)) && reg28) > (reg29[(3'h5):(1'h0)] != (((8'hba) ?
              reg25 : reg22) ?
          (reg32 ^~ wire3) : ((8'hb7) ?
              wire21 : reg27)))) != wire0[(5'h10):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg36 <= wire2[(4'he):(4'h8)];
    end
  assign wire37 = $signed((^wire2[(4'hc):(1'h1)]));
  module38 #() modinst80 (wire79, clk, reg32, reg27, reg29, reg33);
  always
    @(posedge clk) begin
      reg81 <= wire0;
      if ($unsigned((^((^~wire0) == $signed(wire37[(2'h3):(2'h3)])))))
        begin
          reg82 <= ($signed($unsigned($unsigned((reg25 ?
              wire1 : reg34)))) <= (!$unsigned($signed(reg23[(4'h8):(2'h2)]))));
          reg83 <= reg30[(2'h2):(1'h1)];
          if (reg30[(2'h2):(1'h0)])
            begin
              reg84 <= reg83[(4'hc):(4'hc)];
            end
          else
            begin
              reg84 <= wire3;
              reg85 <= (reg35[(1'h1):(1'h0)] ?
                  $signed(reg33) : reg82[(1'h0):(1'h0)]);
              reg86 <= ((8'hb9) == {(8'ha7)});
              reg87 <= $signed(reg22);
              reg88 <= reg86;
            end
        end
      else
        begin
          reg82 <= (((reg34[(2'h2):(1'h0)] ?
                  {$unsigned(wire3), (wire3 ^ reg86)} : (-(reg88 ?
                      reg24 : reg83))) ?
              (~|reg36[(3'h6):(3'h6)]) : $unsigned({(reg88 || reg81),
                  $unsigned(reg34)})) | ((reg86 ?
                  ($unsigned(wire79) == reg32[(1'h1):(1'h1)]) : (|{reg24})) ?
              $signed(reg29) : $unsigned(((~|(8'hb9)) ?
                  reg87 : (reg34 ? wire79 : reg23)))));
          reg83 <= {({($unsigned((8'hae)) ?
                          (wire19 ? reg26 : (8'hbd)) : {(8'hb6), reg86})} ?
                  (((wire19 ? reg82 : reg30) ?
                          (reg32 && wire4) : $unsigned(wire21)) ?
                      $unsigned($signed(wire37)) : reg27[(3'h5):(1'h0)]) : {($unsigned(reg22) >= (reg88 != reg24)),
                      $unsigned(wire3)})};
          reg84 <= {reg85};
          if (($unsigned({(reg82[(3'h4):(1'h1)] * (reg26 == reg29))}) ?
              ($unsigned((+$unsigned(reg29))) ~^ (((|(8'ha9)) ?
                      (7'h41) : $signed(reg24)) ?
                  $signed(wire0) : $signed((reg87 ? wire0 : reg31)))) : reg25))
            begin
              reg85 <= wire3;
              reg86 <= {$signed(($unsigned($unsigned(reg31)) | $unsigned((wire4 == reg36)))),
                  (($signed((8'hb6)) != (~$unsigned(reg32))) & reg34[(2'h3):(2'h2)])};
              reg87 <= $signed({(((~reg81) ? reg24 : (reg84 ~^ reg33)) ?
                      (~$unsigned(wire37)) : reg32)});
              reg88 <= (~$unsigned((reg86 >= $unsigned(reg34))));
              reg89 <= wire4;
            end
          else
            begin
              reg85 <= (~({(7'h42)} ? wire4 : reg82));
            end
        end
      if (reg31)
        begin
          if ({$unsigned(wire19[(2'h2):(1'h0)])})
            begin
              reg90 <= (^~(($unsigned($signed(reg28)) < $unsigned(reg84)) ?
                  reg83 : (8'h9c)));
            end
          else
            begin
              reg90 <= ((reg87 ?
                      wire3 : (((8'hbe) ?
                          reg25 : wire0[(3'h5):(1'h1)]) ~^ wire79[(2'h3):(2'h2)])) ?
                  {((reg89 ? $unsigned(reg32) : $signed(reg32)) ?
                          $signed((8'had)) : (wire0 ? reg81 : $signed(reg25))),
                      (~|($signed(reg33) >>> (8'ha5)))} : reg29[(1'h0):(1'h0)]);
            end
          reg91 <= (reg35[(3'h5):(2'h3)] ?
              $signed((((8'hae) ~^ (reg30 ?
                  wire1 : reg86)) >>> reg86)) : reg90);
        end
      else
        begin
          reg90 <= $signed($unsigned($unsigned(reg36)));
          if ($unsigned(reg87))
            begin
              reg91 <= reg89;
              reg92 <= $unsigned((!reg85[(1'h1):(1'h0)]));
            end
          else
            begin
              reg91 <= wire2[(1'h0):(1'h0)];
              reg92 <= reg28[(1'h1):(1'h1)];
              reg93 <= (8'hb8);
              reg94 <= reg29;
            end
          reg95 <= reg84[(2'h2):(1'h1)];
          reg96 <= reg94;
          reg97 <= ($signed(((wire79[(3'h7):(3'h6)] - reg83[(5'h11):(5'h10)]) << (((8'ha6) <<< reg29) ?
                  $signed(reg34) : {reg95}))) ?
              {(~&(((7'h44) ? reg29 : reg33) ?
                      $unsigned(wire1) : $signed(reg36))),
                  {$unsigned(reg22[(1'h1):(1'h0)]),
                      reg93[(3'h6):(3'h4)]}} : $signed($signed(reg83[(4'hf):(4'ha)])));
        end
      reg98 <= (!$unsigned(((+(~&wire4)) & (~&$unsigned(reg33)))));
    end
endmodule

module module38
#(parameter param78 = {((8'hb8) ? (({(8'h9f)} ? ((8'ha7) ? (8'ha5) : (7'h44)) : {(8'hb2), (7'h43)}) | ({(7'h41)} != ((8'h9f) ^~ (8'ha3)))) : ((8'hba) ? (+(&(8'ha0))) : ((~(8'ha7)) ? {(8'ha9)} : {(8'hbb)})))})
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire66;
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire66,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  module43 #() modinst67 (wire66, clk, wire42, wire39, wire41, wire40);
  always
    @(posedge clk) begin
      reg68 <= (!wire66[(3'h5):(1'h1)]);
      reg69 <= (8'hb4);
      reg70 <= $signed(((reg69 ?
          (reg69 > (reg69 ? (7'h42) : reg69)) : ($signed((8'hba)) ?
              $signed(reg68) : wire66[(3'h5):(2'h3)])) > ((!reg69[(4'ha):(3'h7)]) >>> reg68[(5'h12):(3'h5)])));
      reg71 <= (wire41[(3'h4):(2'h3)] ?
          {reg69, {($unsigned((8'hbd)) & $signed(wire41))}} : ({wire41,
              ($unsigned(wire66) ?
                  $signed(reg68) : wire42[(4'hc):(3'h6)])} >>> ((~|(~|wire39)) ^~ wire42)));
      reg72 <= $signed((!(reg70[(4'h8):(2'h2)] | reg69)));
    end
  assign wire73 = (wire41 ?
                      $signed(((wire39 >>> (~|wire39)) != $signed(wire40[(5'h11):(5'h10)]))) : reg70);
  assign wire74 = ({($signed($unsigned(wire40)) ?
                              ((wire40 + wire40) <= wire66) : {reg71[(4'hf):(4'hb)]})} ?
                      ($unsigned($unsigned(reg70[(2'h2):(1'h1)])) ^~ {(|wire66),
                          (wire73 ?
                              $signed(wire41) : (!wire39))}) : ($signed((8'hb7)) || ($unsigned({wire73}) ?
                          $signed(wire73) : ($unsigned((7'h44)) || (~|reg71)))));
  assign wire75 = ($signed(wire42) ^ wire40);
  assign wire76 = wire39[(2'h3):(1'h1)];
  assign wire77 = $unsigned((8'ha6));
endmodule

module module5
#(parameter param18 = {(^~(|((^~(8'ha1)) | ((8'hae) ? (8'hb9) : (8'hb9))))), (+((^(^(8'ha2))) ? (7'h40) : (((8'h9c) ^~ (8'ha7)) << (&(8'hb8)))))})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  assign y = {wire17, wire16, wire15, wire14, wire13, reg12, reg11, (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $unsigned({wire10,
          $signed(((~|wire10) ? (wire7 ? wire6 : wire8) : $unsigned(wire8)))});
      reg12 <= (!wire10[(1'h0):(1'h0)]);
    end
  assign wire13 = $signed($signed(reg11[(1'h0):(1'h0)]));
  assign wire14 = (~&((|$unsigned($signed(reg11))) ?
                      {(^~reg12),
                          $unsigned(reg12)} : (wire9 ~^ (reg12 * wire9[(1'h0):(1'h0)]))));
  assign wire15 = reg12;
  assign wire16 = wire6;
  assign wire17 = ($unsigned(wire8[(2'h3):(2'h2)]) ?
                      (($signed(wire16[(4'hf):(1'h0)]) <= $signed((^wire16))) ?
                          ({wire7[(4'h8):(3'h4)], (+wire10)} & $signed((wire15 ?
                              wire16 : wire6))) : $signed($unsigned((!wire7)))) : (~^$unsigned(wire16)));
endmodule

module module43
#(parameter param65 = ((^{(~&((8'ha6) ? (8'hbe) : (8'h9f))), (+((8'ha6) ? (7'h40) : (7'h42)))}) ? (((((8'hab) << (8'hb4)) ? ((8'ha5) <<< (8'hb8)) : ((8'hb3) ? (8'hb1) : (8'ha3))) - (!((8'ha0) ^~ (8'hbb)))) ? ((((7'h43) ^ (8'hb7)) ? ((8'hbc) ? (8'h9f) : (8'hbd)) : {(7'h43), (8'hb7)}) <<< {((8'hbf) && (8'hb5)), ((8'had) ? (8'hb0) : (8'hb6))}) : ((((8'hb2) >= (8'had)) == ((8'hbc) ? (8'ha4) : (8'hbf))) && {(|(8'hbe))})) : (((((8'hb4) << (8'ha4)) <= ((8'hb9) * (7'h44))) ? (^~{(8'haf)}) : (^~((8'ha3) - (8'hb4)))) >= (|(((7'h40) || (7'h42)) ? (^(8'hb5)) : ((8'hb8) < (8'hbc)))))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(3'h4):(1'h0)] wire46;
  input wire signed [(5'h14):(1'h0)] wire45;
  input wire signed [(2'h3):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire48;
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  assign y = {wire64,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire48,
                 reg63,
                 reg62,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire48 = $signed((!wire47[(5'h13):(5'h10)]));
  always
    @(posedge clk) begin
      reg49 <= wire45[(4'he):(3'h5)];
      reg50 <= reg49;
      if ((8'ha0))
        begin
          reg51 <= (wire44 ?
              $signed((reg50 ?
                  $signed((reg50 ?
                      reg49 : reg50)) : wire45)) : {$signed((&((8'ha3) * (8'hbb)))),
                  (|reg49[(3'h7):(1'h1)])});
          reg52 <= (~|($signed((+reg50[(1'h1):(1'h0)])) ?
              $signed(($unsigned(reg50) ?
                  (reg51 ? reg51 : wire46) : wire44)) : wire46[(3'h4):(1'h1)]));
          reg53 <= (8'hb6);
          reg54 <= (reg53[(3'h6):(1'h1)] ?
              wire48 : (wire48[(1'h1):(1'h0)] > (~&(8'ha3))));
        end
      else
        begin
          reg51 <= (~|(({reg53} ?
              (+reg51[(2'h3):(1'h0)]) : ((reg52 ? wire45 : (7'h43)) ?
                  {(8'hb8)} : (8'hbb))) == {$unsigned({(8'h9f), wire44}),
              ((&reg49) | reg50[(1'h0):(1'h0)])}));
          reg52 <= ($unsigned((|(~&reg50))) ?
              (($unsigned((wire45 ? wire45 : (7'h44))) <= ((reg52 ?
                      reg51 : wire45) ?
                  {reg54} : (&wire46))) >= reg50) : $signed({(~^reg54),
                  ({(8'ha3)} ? (reg53 <= wire45) : reg52[(1'h0):(1'h0)])}));
        end
    end
  assign wire55 = (8'h9d);
  assign wire56 = (wire44[(2'h2):(2'h2)] ?
                      (wire45 >= (({wire55, wire47} ?
                              (wire45 ? wire45 : reg49) : $unsigned(wire48)) ?
                          (~&$signed(wire48)) : wire45)) : wire46);
  assign wire57 = wire44[(1'h1):(1'h1)];
  assign wire58 = $signed(({((wire47 >>> wire57) ? $unsigned((7'h43)) : reg49),
                      ($signed(reg51) ?
                          $signed(reg50) : (+wire46))} <= wire48));
  assign wire59 = $unsigned(wire44);
  assign wire60 = wire46[(1'h0):(1'h0)];
  assign wire61 = $unsigned($signed($unsigned(((wire46 - wire48) ?
                      $unsigned(wire45) : $unsigned(wire56)))));
  always
    @(posedge clk) begin
      reg62 <= (+(~&(($unsigned(wire61) ?
          wire47 : ((8'hac) ?
              wire55 : wire44)) && $signed((wire56 | wire48)))));
      reg63 <= ($signed((+((wire56 ? wire47 : reg53) ?
          (~&wire46) : (8'haa)))) * {(^(reg53 ?
              reg49[(1'h0):(1'h0)] : (reg54 * reg49))),
          wire48[(4'hd):(4'hd)]});
    end
  assign wire64 = $signed($unsigned($unsigned(wire46)));
endmodule
