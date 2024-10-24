module top
#(parameter param78 = (|{(~|((8'hbb) ? ((8'hbc) ? (8'hb0) : (8'ha4)) : ((8'hba) ? (8'h9e) : (7'h40)))), (~|((-(8'hb1)) ? ((8'ha8) ? (8'hb8) : (8'hae)) : (8'had)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire71;
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire40,
                 wire8,
                 wire42,
                 wire71,
                 reg75,
                 reg74,
                 reg73,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire1 ^~ $unsigned($unsigned(wire3[(3'h4):(1'h0)]))))
        begin
          reg4 <= ({$unsigned((~&{wire3,
                  wire1}))} <<< (wire3[(4'h8):(1'h1)] && wire1[(4'h9):(4'h9)]));
          if ((wire0[(3'h5):(2'h2)] ? $unsigned(wire2[(2'h2):(2'h2)]) : wire1))
            begin
              reg5 <= wire1;
            end
          else
            begin
              reg5 <= (((~$unsigned((reg4 >> wire0))) ?
                      (!({wire3, (8'hb7)} ?
                          {wire2, wire1} : (wire0 ?
                              reg5 : (8'h9f)))) : wire0[(5'h14):(1'h1)]) ?
                  reg4 : (wire2 ? wire0 : (~^(!(wire0 ? reg5 : reg4)))));
            end
          reg6 <= $signed(wire1[(3'h4):(3'h4)]);
          reg7 <= $signed((~|reg6));
        end
      else
        begin
          reg4 <= ((wire3 <= (^wire2)) ?
              ((~|$signed(wire3)) >>> reg5) : (reg7[(3'h4):(1'h0)] ?
                  (8'ha6) : (((reg5 && reg4) ?
                      $unsigned(reg6) : $signed(reg4)) >> (wire3[(3'h5):(2'h3)] >> (wire3 ?
                      wire3 : reg6)))));
          reg5 <= wire1[(3'h7):(3'h4)];
          reg6 <= ($signed($signed(wire3[(3'h4):(2'h2)])) ?
              $signed($signed((-$unsigned((8'ha2))))) : $unsigned((((wire2 ?
                      reg4 : reg4) ?
                  reg5[(3'h4):(2'h2)] : wire1) < wire0[(5'h10):(5'h10)])));
        end
    end
  assign wire8 = reg4[(4'hc):(1'h0)];
  module9 #() modinst41 (.wire11(reg5), .clk(clk), .wire10(wire3), .wire13(reg6), .wire14(wire0), .wire12(wire8), .y(wire40));
  assign wire42 = ((-({(8'ha3)} ?
                          {(wire2 ? wire0 : reg7),
                              $signed(wire2)} : $unsigned((~&reg5)))) ?
                      wire1[(3'h4):(1'h0)] : $signed(wire8));
  module43 #() modinst72 (wire71, clk, reg6, wire1, wire8, wire2, reg7);
  always
    @(posedge clk) begin
      reg73 <= {(wire71 ?
              ((((8'hbe) ?
                  wire42 : wire1) < wire3[(3'h6):(1'h0)]) >= ((reg4 ^~ reg5) > wire71[(4'hf):(4'hb)])) : reg4[(1'h0):(1'h0)])};
      reg74 <= $signed($unsigned(reg73[(4'h8):(3'h5)]));
      reg75 <= (^~(|(~^(+reg74))));
    end
  assign wire76 = (wire8 ?
                      $unsigned(wire40) : $signed($signed(((^reg4) >>> (~wire71)))));
  assign wire77 = (&wire42[(3'h7):(3'h5)]);
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire48;
  input wire [(3'h7):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  input wire signed [(5'h11):(1'h0)] wire45;
  input wire [(3'h7):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire49 = wire48[(2'h2):(1'h0)];
  assign wire50 = $unsigned($unsigned((wire48[(1'h0):(1'h0)] ?
                      $unsigned(wire48[(2'h2):(1'h1)]) : $unsigned({wire44}))));
  assign wire51 = (wire49 | ({((wire49 ? wire46 : wire44) ?
                              (wire48 ?
                                  wire49 : (8'ha0)) : wire44[(3'h6):(1'h1)]),
                          ((wire50 >> wire47) ?
                              {wire46} : wire46[(1'h1):(1'h0)])} ?
                      wire48 : (((wire48 >>> (8'ha3)) ?
                          (~^wire44) : $signed(wire47)) < wire45)));
  assign wire52 = wire48;
  assign wire53 = $unsigned(wire44);
  assign wire54 = wire52;
  always
    @(posedge clk) begin
      if ((~^({$unsigned(wire50), (8'had)} ?
          $signed($signed(wire54)) : (($unsigned(wire46) ^~ ((8'ha6) >= wire46)) ?
              (((8'hae) ? (8'hb6) : wire52) < $signed((8'hbd))) : {wire44}))))
        begin
          reg55 <= $signed(wire51[(4'h8):(3'h5)]);
          if ($signed($signed($unsigned(wire53))))
            begin
              reg56 <= (wire49[(1'h0):(1'h0)] ?
                  wire53 : ((wire46[(1'h1):(1'h1)] ~^ (wire54[(3'h7):(3'h4)] ?
                          (&reg55) : (!wire44))) ?
                      $signed((~$signed((8'ha0)))) : (+$unsigned(wire46))));
              reg57 <= (((7'h41) ? wire45[(3'h6):(2'h2)] : wire47) ?
                  wire52[(1'h0):(1'h0)] : {{($unsigned(wire49) ?
                              (^~reg55) : reg56[(4'h9):(2'h2)]),
                          (~^$unsigned(reg56))}});
              reg58 <= wire46;
            end
          else
            begin
              reg56 <= wire54[(2'h2):(1'h0)];
              reg57 <= ($signed(wire48) * (+(-(&((8'hbd) ?
                  wire48 : (8'hb9))))));
              reg58 <= ((~|$signed((wire44[(2'h3):(2'h3)] << (wire46 ?
                  (8'hb7) : reg58)))) != $unsigned(wire44));
              reg59 <= $unsigned($signed(({(+wire50)} != $signed($unsigned(wire47)))));
              reg60 <= (wire44 ^ ($unsigned($signed(reg57)) ?
                  (wire44[(3'h7):(2'h2)] << (8'hb0)) : {((wire52 ^~ wire45) << {wire50,
                          reg57}),
                      wire52[(2'h3):(1'h1)]}));
            end
          reg61 <= ($signed((~|(^(-reg58)))) != (~|$unsigned(wire44)));
          reg62 <= wire52;
          reg63 <= $unsigned($unsigned({reg56[(2'h3):(1'h1)],
              $unsigned({(8'h9c)})}));
        end
      else
        begin
          reg55 <= ((($signed($unsigned(wire49)) != $signed((!wire51))) ?
              (reg59[(2'h2):(1'h1)] <= ((8'hab) & wire48)) : ((~&{(8'hb6)}) ?
                  $unsigned($signed(wire50)) : ($unsigned(reg63) >> (8'hbc)))) < wire50);
        end
    end
  assign wire64 = $unsigned($unsigned({{$signed(reg62), reg57[(4'h9):(2'h3)]},
                      ((reg58 || reg60) > (-wire51))}));
  assign wire65 = ($signed(((+wire47[(1'h1):(1'h1)]) ?
                          $unsigned(wire47[(1'h1):(1'h0)]) : $signed((&wire53)))) ?
                      (((!$unsigned((8'h9e))) ^~ (~^{wire51,
                          reg59})) * $unsigned((^~{reg63,
                          (8'hb4)}))) : (8'had));
  assign wire66 = ((~&$unsigned(wire51)) ?
                      ((~^(|$unsigned((7'h40)))) >= $unsigned(reg57)) : reg55);
  assign wire67 = $signed(wire47);
  assign wire68 = $unsigned($signed(wire52));
  assign wire69 = (8'h9e);
  assign wire70 = $unsigned((wire44[(2'h2):(1'h1)] < $signed({(^~wire64),
                      (reg55 ? reg61 : reg59)})));
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire15;
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 wire15,
                 reg26,
                 reg25,
                 reg21,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire15 = (((~|$signed((~&wire11))) ?
                      (((~^(8'hac)) - (wire12 ?
                          wire13 : (8'hac))) >= $unsigned((wire12 <= wire11))) : wire10) <= (($unsigned(wire13[(2'h2):(1'h1)]) - $unsigned((|(8'hbf)))) ?
                      {((wire10 != wire13) ?
                              wire14 : $signed((8'ha9)))} : $signed(wire13[(3'h7):(3'h6)])));
  always
    @(posedge clk) begin
      reg16 <= ($unsigned((|wire11[(3'h4):(2'h2)])) ~^ (~&(&$signed((+wire11)))));
      reg17 <= wire11[(1'h0):(1'h0)];
      reg18 <= $unsigned(wire10[(2'h3):(2'h2)]);
    end
  assign wire19 = $signed((+(+{reg16})));
  assign wire20 = (reg17 ? wire10[(1'h1):(1'h0)] : wire13[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg21 <= reg18[(3'h5):(3'h4)];
    end
  assign wire22 = reg18[(2'h2):(2'h2)];
  assign wire23 = wire20;
  assign wire24 = wire15[(4'he):(1'h0)];
  always
    @(posedge clk) begin
      reg25 <= reg21[(2'h3):(2'h2)];
      reg26 <= ($unsigned(($unsigned((~wire23)) ?
              $unsigned((wire14 != wire19)) : (8'haa))) ?
          (8'h9d) : $unsigned($unsigned(wire20)));
    end
  assign wire27 = ($unsigned(reg18) ?
                      {$signed((8'hb1)),
                          (($signed(wire13) ?
                                  wire11[(2'h3):(2'h2)] : reg25[(4'hb):(2'h3)]) ?
                              $signed($unsigned(wire20)) : $unsigned($signed((7'h40))))} : reg21[(4'h9):(4'h8)]);
  assign wire28 = ($signed((^~$unsigned((reg17 <= wire23)))) ?
                      (reg16[(4'he):(3'h7)] * ((!((8'ha2) > (8'hb7))) <<< wire19[(3'h4):(2'h3)])) : $signed(reg25));
  assign wire29 = reg16;
  assign wire30 = (($signed($unsigned(((8'ha9) ?
                          (7'h43) : wire11))) >>> (wire12 ?
                          {$signed(reg16),
                              ((8'h9d) ?
                                  wire24 : (8'hb6))} : wire27[(2'h2):(1'h1)])) ?
                      reg21 : (~&$signed(($signed(wire10) ?
                          wire14 : wire27[(2'h2):(2'h2)]))));
  assign wire31 = $signed((~|$signed((-(reg21 * wire28)))));
  assign wire32 = ((|$signed($unsigned(wire30[(1'h0):(1'h0)]))) >> (($unsigned((&reg21)) ?
                      $unsigned($unsigned(reg17)) : ($unsigned((8'h9d)) ?
                          wire22[(5'h12):(2'h3)] : (wire19 | (8'hb0)))) <<< $signed($signed(wire15[(4'h9):(1'h0)]))));
  assign wire33 = ({wire12[(3'h6):(3'h6)],
                          $unsigned($unsigned(wire30[(1'h1):(1'h0)]))} ?
                      reg17 : $signed($unsigned(wire22)));
  assign wire34 = (!$signed((wire22[(5'h13):(2'h3)] && (~(wire11 ?
                      wire10 : wire11)))));
  assign wire35 = $signed(((((8'hb5) ? $unsigned(wire32) : (!wire28)) ?
                          $signed((wire19 ?
                              wire15 : wire20)) : $unsigned(reg16)) ?
                      wire19[(3'h5):(1'h1)] : wire34));
  assign wire36 = reg26;
  assign wire37 = $signed({$unsigned(wire23), (~^$signed(reg25))});
  assign wire38 = {((($signed(wire19) > {wire12}) ?
                              ($unsigned(wire11) && reg17[(1'h1):(1'h1)]) : ($unsigned(reg25) >> reg25)) ?
                          (&$unsigned((reg21 <<< wire28))) : $unsigned((~|$unsigned((8'hb9)))))};
  assign wire39 = $unsigned(wire23[(4'h8):(2'h3)]);
endmodule
