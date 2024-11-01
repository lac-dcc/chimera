module top
#(parameter param99 = ((|(|(((8'hb0) ? (8'h9d) : (8'hb9)) ? (^(8'ha9)) : ((8'h9f) ? (8'h9f) : (7'h41))))) ? ((!(((8'hbe) - (8'hab)) << ((8'ha1) ? (8'had) : (8'hb9)))) ? (((~^(8'haf)) || {(7'h43), (8'hbf)}) ? (~|((8'ha9) ? (8'ha1) : (8'h9f))) : (((8'hb3) >>> (8'h9f)) ? ((8'h9d) ? (7'h42) : (8'hbe)) : ((7'h41) + (7'h42)))) : ((((8'hb5) >> (8'hb5)) < ((8'hb9) ? (8'hb7) : (8'ha3))) ? (((7'h42) ? (8'hb6) : (8'hb7)) & ((8'hb0) >> (8'hb4))) : (((8'ha0) ? (8'hac) : (8'hb8)) ^~ ((8'hbf) < (8'ha2))))) : (-((7'h40) <<< {{(8'hb4)}, ((8'hbb) != (8'ha7))}))), 
parameter param100 = {((^(-((8'hb7) * param99))) ^~ {{(~|param99)}}), ((7'h44) >> (((param99 && (8'ha6)) > (param99 != param99)) || param99))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire89;
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  assign y = {wire98,
                 wire91,
                 wire4,
                 wire89,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire4 = wire1;
  module5 #() modinst90 (wire89, clk, wire4, wire1, wire0, wire2, wire3);
  assign wire91 = $signed(wire4);
  always
    @(posedge clk) begin
      if ($unsigned((wire91 > $signed($unsigned({wire0, wire91})))))
        begin
          reg92 <= $signed(wire1[(5'h14):(3'h7)]);
          reg93 <= $unsigned($unsigned(((wire3 ?
                  (wire2 < wire1) : wire91[(1'h1):(1'h1)]) ?
              wire91 : (wire2[(1'h0):(1'h0)] ?
                  (wire4 <= (8'hac)) : wire3[(4'hf):(4'h8)]))));
          reg94 <= wire89[(2'h3):(2'h3)];
          reg95 <= ($unsigned($unsigned($signed((wire3 ?
              wire3 : wire91)))) && $signed((reg93[(3'h4):(2'h2)] | $signed((reg92 || wire1)))));
          reg96 <= $unsigned({(^$signed($signed((8'h9d)))),
              ({reg94[(3'h5):(3'h5)], wire4} ?
                  $signed((reg95 && wire3)) : $unsigned((!wire91)))});
        end
      else
        begin
          reg92 <= $signed($unsigned((reg92[(2'h2):(2'h2)] ?
              $signed((~reg93)) : reg92[(3'h7):(1'h0)])));
          reg93 <= wire2;
        end
      reg97 <= (reg93 ?
          wire2 : $unsigned((wire1[(4'hf):(1'h1)] ?
              $unsigned($unsigned(wire89)) : reg92[(3'h6):(2'h2)])));
    end
  assign wire98 = ($unsigned(wire91[(3'h5):(3'h4)]) ?
                      $unsigned((((!reg95) || reg94[(4'h8):(2'h3)]) && reg95)) : ((((reg92 ?
                              reg95 : (8'ha1)) ?
                          reg92[(2'h3):(2'h2)] : $signed(reg94)) | $signed(reg93[(3'h4):(1'h1)])) == (|$signed(reg95))));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire80;
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire44,
                 wire11,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire66,
                 wire80,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire11 = (8'ha9);
  module12 #() modinst45 (wire44, clk, wire9, wire7, wire10, wire6, wire11);
  assign wire46 = $signed($unsigned((+(^{wire8, wire44}))));
  assign wire47 = $unsigned($unsigned((wire7[(2'h2):(1'h1)] ?
                      (wire46 >= (8'hb7)) : $signed((wire44 ?
                          (8'hbc) : wire11)))));
  assign wire48 = wire46;
  assign wire49 = (($signed((wire44 ?
                          $unsigned(wire48) : wire11[(2'h2):(2'h2)])) ?
                      (!$signed(wire46)) : wire44[(2'h3):(2'h2)]) >> $unsigned(wire46));
  assign wire50 = $signed(($unsigned(({wire46, wire8} ? (8'h9d) : (^~wire6))) ?
                      {((wire44 ? wire46 : wire7) ?
                              $unsigned(wire11) : $unsigned((8'hac))),
                          (^$unsigned(wire46))} : $signed($signed(wire9))));
  assign wire51 = wire46;
  assign wire52 = (wire7 != $unsigned(wire46));
  assign wire53 = $signed({$unsigned(((wire49 == wire49) ?
                          $signed(wire52) : wire10[(4'hc):(4'h8)])),
                      wire10[(5'h12):(4'h9)]});
  assign wire54 = $signed(wire47[(4'h8):(3'h6)]);
  assign wire55 = {$signed($signed(((wire51 ? wire51 : wire49) ?
                          (~|wire44) : (wire11 >= wire53)))),
                      ({$signed((|wire46))} ?
                          ((|$signed(wire50)) >>> wire50[(3'h5):(1'h0)]) : ($unsigned((^wire47)) <<< ((wire52 || wire46) ?
                              {wire48, wire47} : $unsigned((8'hb0)))))};
  always
    @(posedge clk) begin
      reg56 <= wire54[(3'h6):(2'h2)];
      if (($signed($unsigned(wire44)) >= $unsigned(((~$signed(wire46)) ?
          $signed((reg56 ? wire46 : wire51)) : (&$signed(wire47))))))
        begin
          reg57 <= (wire44 ~^ wire55);
          reg58 <= reg56;
          reg59 <= $signed(((({reg57} ?
                  wire49[(2'h3):(2'h2)] : $unsigned(wire52)) >>> $signed(wire49)) ?
              $unsigned(wire49) : wire50[(2'h2):(1'h0)]));
          if ({($unsigned($unsigned((-wire54))) >> wire6[(4'h8):(2'h2)]),
              wire10})
            begin
              reg60 <= $signed((({(-wire48),
                      wire11[(3'h5):(2'h3)]} >> (((8'had) ? wire47 : wire52) ?
                      reg57 : (wire8 ? (8'ha7) : wire9))) ?
                  (8'h9e) : reg56[(2'h3):(1'h0)]));
              reg61 <= reg56;
              reg62 <= (($signed($signed($unsigned((8'ha7)))) ?
                  ((((8'hb7) + wire54) != (!wire52)) ?
                      $unsigned($unsigned(wire8)) : $signed((wire6 || wire10))) : wire8[(4'hb):(3'h6)]) <= $signed(wire55[(2'h3):(2'h3)]));
              reg63 <= wire9;
              reg64 <= reg59[(4'hf):(2'h3)];
            end
          else
            begin
              reg60 <= ((((~|(~&(8'ha0))) <= $signed(reg57)) - {wire7[(3'h4):(1'h0)],
                      (8'hb0)}) ?
                  wire9[(4'ha):(2'h3)] : (^{((wire48 < (8'h9f)) << (wire55 ?
                          (7'h42) : wire49)),
                      wire8}));
              reg61 <= $signed((^~$signed(($unsigned(wire51) ?
                  (wire51 ? reg57 : reg60) : (reg60 < (8'ha7))))));
              reg62 <= (!(~|$signed($unsigned($signed(wire48)))));
            end
          reg65 <= ($signed((8'hb3)) ?
              (wire10[(4'hb):(3'h7)] ?
                  $unsigned(((reg63 ? wire55 : wire48) != (reg58 ?
                      reg56 : reg57))) : ($unsigned((wire11 ?
                      (8'hb4) : reg64)) & wire7)) : $signed(wire46[(4'he):(4'ha)]));
        end
      else
        begin
          reg57 <= wire51;
          reg58 <= wire49[(2'h3):(1'h1)];
          if (($signed({($signed(reg58) != (wire8 <= wire54)),
                  wire6[(5'h12):(5'h12)]}) ?
              $signed((+wire53[(1'h1):(1'h1)])) : (|reg61[(4'h9):(3'h7)])))
            begin
              reg59 <= $unsigned($unsigned(wire11[(3'h5):(2'h2)]));
            end
          else
            begin
              reg59 <= $signed(wire55);
              reg60 <= wire49;
            end
        end
    end
  assign wire66 = wire49;
  module67 #() modinst81 (wire80, clk, reg63, wire54, wire48, reg65, wire8);
  assign wire82 = (wire53 | reg59);
  assign wire83 = {wire9[(4'ha):(2'h3)],
                      $unsigned(((-(reg65 || wire47)) ?
                          $signed((+wire54)) : reg57[(4'h9):(2'h2)]))};
  assign wire84 = $unsigned(((+(wire66 ?
                          (reg57 ? reg58 : reg60) : (wire82 ?
                              reg62 : wire44))) ?
                      $signed({(~^wire7)}) : (!(7'h43))));
  assign wire85 = wire55;
  assign wire86 = ($unsigned(wire52) ?
                      ({reg58} ?
                          reg64[(1'h0):(1'h0)] : wire11) : $signed(wire53[(2'h2):(1'h0)]));
  assign wire87 = ((-$signed((~^$signed(wire50)))) ?
                      (^$signed($signed(wire84[(3'h4):(1'h0)]))) : wire47);
  assign wire88 = $signed((wire54 <<< $unsigned({$signed(reg56)})));
endmodule

module module67
#(parameter param78 = ((-(((^(8'hbc)) * (+(8'ha7))) ? ((8'h9c) | {(8'ha2)}) : (-((8'haa) ? (8'haa) : (8'hbb))))) ? (((((8'haf) <<< (8'hbd)) ? {(8'hab), (8'hb7)} : ((8'hb3) ? (8'hb1) : (8'hb5))) ? ({(7'h41), (8'ha4)} ^ ((8'hbc) < (8'had))) : ((~&(8'hb6)) >> {(8'h9e)})) ? {((&(8'hbb)) >= (8'ha2)), (((8'h9d) >> (8'hbd)) != {(8'haa), (8'ha8)})} : (~{((8'h9d) ? (8'hb7) : (8'ha1)), (~^(8'had))})) : (({(~^(7'h44)), (~(8'hb9))} <= (((8'had) ~^ (7'h42)) ~^ ((8'h9f) != (8'ha7)))) ? ((((8'hb6) ? (8'ha1) : (8'ha9)) ? ((8'ha4) || (8'h9d)) : (~^(8'hba))) ? ((8'h9f) > ((8'hb1) ? (8'haf) : (8'h9d))) : (~((8'hb6) >= (8'hb5)))) : ((((8'haf) ? (8'hb0) : (8'hb4)) ? ((8'ha3) > (8'hb2)) : (^~(8'ha0))) ? (!(~|(8'hb5))) : (((8'hb0) ? (8'hab) : (8'hb4)) <<< ((8'h9c) == (8'hb1)))))), 
parameter param79 = (param78 ? {param78, (~^({param78, param78} ? (param78 + param78) : (param78 >> param78)))} : ({(-((8'ha1) ? param78 : param78)), (param78 ? ((8'ha1) ? (8'ha6) : param78) : (!param78))} ? (^(((8'h9e) ? param78 : param78) ? ((8'ha5) == (8'haa)) : ((8'ha2) ? param78 : (8'ha9)))) : ((^~(param78 > param78)) > ((param78 ? param78 : (8'had)) + ((7'h41) ? param78 : param78))))))
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire72;
  input wire signed [(4'hf):(1'h0)] wire71;
  input wire [(3'h5):(1'h0)] wire70;
  input wire [(5'h13):(1'h0)] wire69;
  input wire signed [(4'h9):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  assign y = {wire77, wire76, wire75, wire74, wire73, (1'h0)};
  assign wire73 = ((^(((wire68 ^ wire72) ? $signed(wire70) : $signed(wire71)) ?
                          {(~^wire70),
                              ((8'hbe) ?
                                  wire69 : wire68)} : {wire70[(2'h2):(2'h2)]})) ?
                      $signed((~^$signed((|(7'h40))))) : $signed((wire70[(2'h2):(1'h1)] || {wire71,
                          $unsigned(wire69)})));
  assign wire74 = $unsigned((~$unsigned($signed(wire70))));
  assign wire75 = (!($signed((|(wire74 || wire70))) ^~ wire72[(1'h0):(1'h0)]));
  assign wire76 = $unsigned($signed($unsigned($unsigned(wire69))));
  assign wire77 = {$unsigned(($unsigned($signed((8'hb7))) ?
                          (-wire70) : (wire76 && (~|(7'h41))))),
                      (!$signed(($signed(wire74) << $signed(wire75))))};
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  input wire [(3'h4):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire20,
                 wire19,
                 wire18,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 reg21,
                 (1'h0)};
  assign wire18 = ($signed($unsigned($unsigned(wire13))) + ({($unsigned(wire15) ?
                              ((8'haa) >= wire17) : (^~wire14))} ?
                      $unsigned($signed($unsigned(wire15))) : wire14[(3'h5):(3'h4)]));
  assign wire19 = $signed($signed(wire15));
  assign wire20 = wire13[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg21 <= $signed($unsigned((+wire16)));
      if ($unsigned($unsigned({wire17,
          ((wire15 ? wire14 : wire16) ?
              $signed((8'ha6)) : (reg21 || wire17))})))
        begin
          reg22 <= $unsigned(wire13);
          if (($signed($signed({(wire15 ? (8'h9c) : wire15),
              $unsigned(wire18)})) != wire18))
            begin
              reg23 <= $signed($unsigned($signed($signed($signed(wire15)))));
              reg24 <= $unsigned(reg22);
              reg25 <= ((wire18[(4'h8):(2'h2)] ^~ wire18[(3'h4):(2'h2)]) ?
                  ((wire18 ?
                          ((wire15 << (8'hb5)) || wire20[(2'h2):(1'h1)]) : (8'h9f)) ?
                      wire16[(5'h11):(4'hb)] : wire17[(3'h7):(2'h3)]) : reg22[(1'h1):(1'h1)]);
              reg26 <= $unsigned($unsigned(reg24));
              reg27 <= (!reg22);
            end
          else
            begin
              reg23 <= (($unsigned($signed(wire19)) ?
                  ($unsigned(wire16[(4'ha):(3'h7)]) ?
                      ((wire18 - (8'hae)) ?
                          (~|reg21) : $signed((8'hb3))) : $signed((^~wire16))) : ((~|$unsigned((8'hbe))) ?
                      (~&$signed(wire16)) : reg27[(1'h1):(1'h1)])) && (reg23 ?
                  wire13 : (^~wire20[(1'h1):(1'h0)])));
            end
          reg28 <= $unsigned({($unsigned((~&wire17)) == (&(8'ha7)))});
          if ($unsigned(((reg21 ^~ ($signed((8'h9f)) >>> $signed(wire20))) > ((+reg23) ?
              ((reg25 ? (8'ha2) : wire16) ^~ (wire17 && wire18)) : wire20))))
            begin
              reg29 <= (reg23[(4'hc):(3'h4)] > (~^reg26));
              reg30 <= ($signed($signed({((8'ha3) ? reg29 : reg25)})) ?
                  (|({(reg28 ? wire19 : wire20)} ~^ (reg28 ?
                      reg29 : $signed((8'ha2))))) : $signed(reg23));
              reg31 <= (~^(8'hae));
              reg32 <= $unsigned((~^(reg26 & reg23)));
              reg33 <= (({{((8'hbc) ? reg27 : wire20), $signed(reg32)},
                          {$signed(reg21), (reg25 ? wire13 : wire17)}} ?
                      $signed(reg23) : (8'h9f)) ?
                  wire13 : ($signed((&{wire17, reg25})) ?
                      ($unsigned(reg29) ?
                          (reg26 * ((8'hb3) ?
                              (8'hbd) : reg24)) : {((8'ha3) * reg29)}) : reg21));
            end
          else
            begin
              reg29 <= (^({wire14} ? reg30 : (&wire17[(3'h5):(3'h4)])));
              reg30 <= wire14[(3'h4):(2'h3)];
            end
          reg34 <= ((+(^~((wire20 ? reg28 : (8'ha9)) + {wire13}))) ?
              (reg31 * ($unsigned($unsigned(reg21)) <= $unsigned($signed(reg33)))) : (&(wire19[(3'h6):(1'h1)] ?
                  reg27[(1'h1):(1'h0)] : (-(reg22 ? wire20 : reg24)))));
        end
      else
        begin
          reg22 <= (~^wire19);
          if (((reg32 >>> reg32[(4'h8):(1'h1)]) ?
              (!reg21) : {$unsigned($unsigned($signed(wire17))),
                  $signed(reg23[(4'hc):(4'h8)])}))
            begin
              reg23 <= ((~|$signed($signed({wire13}))) - ((^~wire17[(4'h9):(3'h5)]) ?
                  (^~$unsigned(reg32)) : $unsigned(($unsigned(reg22) ?
                      wire13 : $signed(wire20)))));
              reg24 <= ({$signed($unsigned(reg31)),
                      $signed({$unsigned(wire16)})} ?
                  wire18 : {reg25[(2'h3):(1'h1)], wire16});
            end
          else
            begin
              reg23 <= $signed(($unsigned($signed((wire19 && wire20))) << wire14));
              reg24 <= ($signed($signed((^(-reg28)))) ?
                  {(&wire14)} : reg31[(3'h5):(2'h3)]);
              reg25 <= reg23[(3'h5):(2'h2)];
              reg26 <= $unsigned(((~|wire15) ^ ($signed(wire17) ?
                  {$unsigned((8'ha9))} : $signed(reg31[(2'h3):(2'h3)]))));
              reg27 <= $unsigned(reg28);
            end
          reg28 <= (((reg28[(4'hd):(4'hc)] < $unsigned((reg29 ?
              reg33 : (8'h9f)))) == wire14) & $unsigned((+wire18)));
        end
    end
  assign wire35 = wire18;
  assign wire36 = reg28[(2'h3):(2'h3)];
  assign wire37 = (~|reg27[(2'h2):(1'h1)]);
  assign wire38 = $unsigned($unsigned(wire35));
  assign wire39 = $unsigned($signed($unsigned(((^reg23) - $signed((8'ha4))))));
  always
    @(posedge clk) begin
      reg40 <= $unsigned(reg22);
    end
  always
    @(posedge clk) begin
      reg41 <= {$unsigned({(|wire20[(1'h0):(1'h0)])})};
      reg42 <= reg26[(4'hb):(4'ha)];
      reg43 <= {(~&$unsigned($unsigned((+wire38)))),
          $unsigned(($signed({wire20}) >>> $signed((reg41 & reg40))))};
    end
endmodule
