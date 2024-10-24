module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire28;
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  assign y = {wire80,
                 wire63,
                 wire38,
                 wire30,
                 wire28,
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
                 reg65,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  module4 #() modinst29 (.wire6(wire2), .y(wire28), .wire5(wire3), .wire7(wire1), .wire9((8'hb4)), .clk(clk), .wire8(wire0));
  assign wire30 = (7'h44);
  always
    @(posedge clk) begin
      reg31 <= (^~(wire30 <<< {$unsigned(((8'hb2) ? wire28 : wire3))}));
      if ((((reg31 ?
                  wire2[(4'h9):(3'h5)] : ((wire0 ?
                      wire0 : wire2) << wire30[(5'h10):(4'hb)])) ?
              wire3[(4'ha):(2'h2)] : wire28) ?
          ({$unsigned($signed(wire3)),
              ((wire3 ? (8'hb4) : wire28) ?
                  (~|wire3) : (wire30 && wire30))} ^~ wire1[(2'h2):(1'h0)]) : reg31[(4'hd):(4'ha)]))
        begin
          reg32 <= (~^$signed($signed($unsigned(wire0))));
          reg33 <= wire30;
          reg34 <= ((!(|wire2[(4'h9):(3'h5)])) ?
              reg33[(5'h11):(4'hc)] : {(($unsigned(reg33) + (&wire1)) ?
                      ((wire1 && reg31) ?
                          $unsigned(wire1) : wire2[(5'h10):(3'h6)]) : $signed((~wire0))),
                  {$unsigned($unsigned(reg31)), $unsigned(reg31)}});
          if (wire28[(3'h6):(3'h4)])
            begin
              reg35 <= wire28[(3'h4):(1'h1)];
              reg36 <= $unsigned((!$unsigned((!wire3[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg35 <= (~(reg32[(2'h3):(1'h1)] ~^ wire0[(4'h9):(3'h6)]));
            end
        end
      else
        begin
          reg32 <= (reg35[(4'hb):(3'h7)] ?
              $unsigned(reg33) : (wire28[(2'h3):(2'h2)] <= reg36[(3'h7):(2'h3)]));
        end
      reg37 <= (wire1 ?
          (reg35 ~^ reg34) : (((reg32 | $unsigned(wire3)) ?
                  (~$signed(wire3)) : wire2) ?
              $signed(wire0) : (+$signed((^reg36)))));
    end
  assign wire38 = reg36;
  module39 #() modinst64 (.wire43(reg31), .wire41(wire2), .y(wire63), .wire40(reg36), .clk(clk), .wire42(wire0));
  always
    @(posedge clk) begin
      reg65 <= $signed($unsigned($unsigned($signed((|reg37)))));
      reg66 <= $unsigned(reg36[(1'h1):(1'h1)]);
      reg67 <= ((((8'h9c) ^~ wire38) ?
          $unsigned($signed((wire30 ?
              reg36 : (8'hab)))) : reg65) >>> (+($signed((8'hab)) ?
          (~&$signed(wire28)) : (wire3[(5'h14):(2'h3)] ?
              $signed(wire28) : (reg33 ^~ reg35)))));
      if (reg66[(3'h7):(3'h6)])
        begin
          if ({(reg35[(3'h6):(3'h6)] != wire38), wire63[(3'h4):(2'h2)]})
            begin
              reg68 <= $unsigned(reg33);
            end
          else
            begin
              reg68 <= (^~$signed(reg34[(2'h2):(2'h2)]));
              reg69 <= $signed($unsigned((((reg32 + wire63) ^ (reg36 ^~ (8'hb9))) ?
                  (+$unsigned(reg67)) : (~^$unsigned(wire30)))));
              reg70 <= reg33[(5'h10):(4'hd)];
              reg71 <= reg69[(3'h5):(1'h1)];
              reg72 <= ((($unsigned(wire63) ?
                      (reg35[(1'h0):(1'h0)] || $signed(wire0)) : ($signed(reg35) ?
                          reg71[(1'h0):(1'h0)] : (reg32 ?
                              wire2 : wire0))) | reg65[(3'h5):(3'h5)]) ?
                  $unsigned(reg69) : $unsigned({(+(wire38 ? reg36 : wire38))}));
            end
          if ((8'hb1))
            begin
              reg73 <= (^~(!$unsigned($unsigned((reg65 ? reg71 : reg69)))));
            end
          else
            begin
              reg73 <= (reg73[(3'h5):(3'h5)] ? wire2 : $signed((7'h40)));
              reg74 <= wire38;
            end
        end
      else
        begin
          reg68 <= ((^reg34) ?
              wire28 : ((reg66 ? $signed({reg33}) : wire30) ?
                  $unsigned(wire63[(3'h6):(1'h0)]) : wire1[(1'h1):(1'h0)]));
          reg69 <= wire38;
          reg70 <= ({(~^($unsigned(wire0) + reg68[(4'hb):(4'h8)])),
              $unsigned((~|{reg32,
                  wire38}))} + ((($unsigned((8'ha6)) != $unsigned(reg66)) + (~^reg36)) ?
              $unsigned((reg74 | reg70)) : (((!reg71) && (!(8'h9f))) == wire2)));
        end
      if ($unsigned({(((wire63 | reg65) ? {(8'haf), reg36} : (reg33 - wire28)) ?
              reg67[(1'h0):(1'h0)] : ($signed(reg68) ?
                  wire38[(2'h2):(1'h1)] : (8'hbb)))}))
        begin
          reg75 <= $unsigned($unsigned(wire1));
          reg76 <= (&$unsigned($signed(wire1[(3'h5):(1'h0)])));
          reg77 <= (^reg73);
        end
      else
        begin
          reg75 <= $unsigned(reg68);
          reg76 <= (~^$signed({{$signed(wire28)}}));
          if ({(^(reg72[(3'h5):(2'h3)] ?
                  (reg33 ? (reg66 ? wire2 : reg66) : (~&(8'h9c))) : {(reg36 ?
                          reg67 : reg75),
                      reg34}))})
            begin
              reg77 <= ($unsigned($signed((+wire1[(3'h5):(1'h0)]))) ?
                  $signed(({$unsigned(reg76), reg33} ?
                      $signed($signed(wire28)) : wire30[(2'h2):(1'h1)])) : $unsigned($signed($signed($signed(reg69)))));
              reg78 <= reg74;
            end
          else
            begin
              reg77 <= ($signed({((reg70 < (8'haa)) ?
                      {reg32} : reg33[(3'h6):(2'h3)])}) ~^ reg32);
              reg78 <= $signed({((reg34 ?
                          $signed(reg78) : (reg69 ? wire3 : reg74)) ?
                      (~^$signed(wire0)) : (~|$unsigned(reg31)))});
            end
          reg79 <= ((8'h9f) ^~ reg77);
        end
    end
  assign wire80 = wire30;
endmodule

module module39  (y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire43;
  input wire [(5'h11):(1'h0)] wire42;
  input wire signed [(5'h15):(1'h0)] wire41;
  input wire [(5'h12):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  assign y = {wire62,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire44 = wire42;
  assign wire45 = (+($signed(wire41[(4'hb):(3'h4)]) * wire40));
  assign wire46 = wire45[(1'h1):(1'h1)];
  assign wire47 = {wire45[(3'h7):(3'h4)]};
  always
    @(posedge clk) begin
      reg48 <= (7'h42);
      if (reg48[(2'h3):(1'h1)])
        begin
          if (($signed(wire41[(3'h4):(2'h3)]) || wire41))
            begin
              reg49 <= ((+wire44[(3'h4):(2'h2)]) & wire47[(4'hc):(4'hc)]);
              reg50 <= ((wire47 ?
                  $unsigned((^(wire42 ?
                      wire40 : wire43))) : (~^((wire47 + reg49) & wire43))) < (8'ha1));
              reg51 <= ({$unsigned(($signed(reg48) ?
                          $unsigned((8'hac)) : (wire46 ? wire47 : wire47))),
                      $unsigned((&wire47))} ?
                  wire45 : $unsigned((wire42[(4'ha):(1'h0)] ?
                      ($unsigned(wire42) ?
                          (reg49 <= wire47) : $unsigned(reg48)) : (-(~&wire44)))));
            end
          else
            begin
              reg49 <= {(+wire43[(1'h1):(1'h0)])};
              reg50 <= wire43[(2'h2):(1'h0)];
            end
          reg52 <= (wire44[(3'h5):(1'h1)] < wire42[(5'h10):(5'h10)]);
          reg53 <= {$signed($signed(reg51))};
          reg54 <= (~&(((|(~&wire41)) ?
              $signed((~&wire47)) : $signed($signed(wire47))) ^ {(^~reg51)}));
          reg55 <= ($signed((8'hba)) ?
              reg48[(1'h1):(1'h1)] : (wire42[(4'h9):(1'h1)] ?
                  (&wire40) : {($signed(reg52) ?
                          (^~wire43) : reg53[(2'h3):(2'h2)]),
                      wire42[(3'h5):(1'h1)]}));
        end
      else
        begin
          reg49 <= (((^(8'hb3)) != (reg49 ?
              wire43[(1'h0):(1'h0)] : {reg48[(2'h3):(2'h2)]})) < wire47);
          if ($signed($unsigned((wire46 ^ $unsigned(wire45[(4'h8):(2'h2)])))))
            begin
              reg50 <= reg51;
            end
          else
            begin
              reg50 <= $signed(((&reg51[(3'h7):(2'h3)]) ?
                  (^~(8'hac)) : $unsigned((!(wire47 != reg51)))));
            end
          reg51 <= (({(!$unsigned(reg48)),
              ((~reg52) <= $unsigned((8'hbe)))} >> reg48[(2'h3):(2'h3)]) * ((reg49 != (~wire42[(3'h7):(2'h2)])) ^~ wire43));
        end
      reg56 <= reg54[(1'h0):(1'h0)];
      if (wire47)
        begin
          reg57 <= wire41[(1'h0):(1'h0)];
          reg58 <= (!($unsigned((!wire45)) < ({(wire43 == wire43),
              $unsigned(wire40)} > ($signed((8'ha5)) >>> $unsigned(reg49)))));
          reg59 <= (((^~wire47) ? reg57 : $signed($signed($signed(wire47)))) ?
              ($unsigned(reg54[(1'h1):(1'h1)]) > ($signed((reg48 ^~ reg49)) ?
                  $unsigned({wire43, reg57}) : (7'h44))) : (-reg51));
          reg60 <= $signed(($unsigned(((^~reg59) * (reg55 * wire41))) ?
              $signed($unsigned({wire42, reg53})) : reg49));
        end
      else
        begin
          reg57 <= ({$unsigned({wire46[(1'h1):(1'h0)]})} <<< wire42);
        end
      reg61 <= {$unsigned($unsigned(((reg55 >= reg49) == (reg55 || reg60)))),
          reg52[(1'h1):(1'h1)]};
    end
  assign wire62 = {(wire45[(3'h7):(2'h3)] || ($signed(((8'ha7) ^ wire46)) ?
                          reg54[(3'h4):(1'h0)] : $signed((reg60 << reg50)))),
                      ($signed((|wire46)) ?
                          (7'h44) : ($unsigned(wire41) ^ {((8'ha7) ?
                                  (8'ha0) : (8'hb4)),
                              $signed(reg50)}))};
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire signed [(5'h10):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire23;
  assign y = {wire27, wire26, wire25, wire23, (1'h0)};
  module10 #() modinst24 (wire23, clk, wire9, wire5, wire8, wire7, wire6);
  assign wire25 = wire7;
  assign wire26 = {(((wire8 ? (&wire9) : $signed(wire25)) ?
                          (-{wire7}) : wire8) < $signed((^~(wire8 ?
                          wire7 : wire23)))),
                      wire7};
  assign wire27 = wire8;
endmodule

module module10
#(parameter param22 = ((^((((8'h9f) ~^ (8'hb7)) ^~ ((8'haa) ^~ (7'h43))) <= (!(^(8'hb9))))) >= (&(((-(8'hba)) | ((8'hbf) ? (8'hb6) : (8'hb3))) ^~ (((8'ha4) ~^ (8'hbc)) ? {(7'h40), (8'hae)} : {(8'ha4), (8'hb9)})))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire signed [(3'h4):(1'h0)] wire13;
  input wire [(3'h7):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  assign y = {wire21, wire20, wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = wire11[(4'hf):(4'h9)];
  assign wire17 = (wire14 ?
                      wire11 : $signed({($unsigned(wire13) && $unsigned(wire16))}));
  assign wire18 = {$unsigned(({(wire15 ? wire13 : wire15),
                          $unsigned(wire17)} == (~^wire13)))};
  assign wire19 = ({(wire17[(2'h3):(1'h1)] ?
                          wire18 : wire13[(2'h2):(1'h0)])} >>> ((8'hbc) ?
                      (wire12[(2'h3):(1'h0)] ?
                          $unsigned((-wire13)) : (8'hb0)) : wire18[(1'h0):(1'h0)]));
  assign wire20 = wire11[(3'h7):(2'h3)];
  assign wire21 = wire17;
endmodule
