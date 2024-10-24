module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire76;
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire95,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire76,
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
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(wire2[(4'hb):(2'h3)]) & $unsigned(((8'ha3) ?
          ((|wire2) ?
              ((8'hbc) ? wire1 : wire3) : wire0) : (wire1[(1'h1):(1'h1)] ?
              {wire2, wire0} : wire0)))))
        begin
          reg4 <= wire0;
          reg5 <= (-(^(|wire1)));
        end
      else
        begin
          reg4 <= $unsigned({$signed(($signed(wire2) ?
                  $signed(reg5) : (wire3 > wire3)))});
          reg5 <= (~&$signed(((^reg5) ?
              $unsigned({(8'h9f), reg5}) : $signed((reg5 - wire0)))));
          reg6 <= (((wire3[(5'h14):(2'h3)] >= (!(wire3 || (7'h43)))) == $signed(((~&reg4) ?
              $signed((8'hac)) : $unsigned(reg5)))) | ($signed(($unsigned((8'ha4)) ?
              reg4 : $unsigned(reg5))) > (8'ha0)));
        end
      reg7 <= (|reg6[(4'hc):(3'h5)]);
      reg8 <= reg5;
      reg9 <= (-$signed(wire3));
    end
  assign wire10 = (((~reg4[(5'h10):(4'hc)]) >> ((reg7 ?
                      $unsigned((8'ha7)) : $unsigned(wire3)) && $unsigned({wire2,
                      wire3}))) > $signed((~&(-reg5))));
  assign wire11 = (~(~^$unsigned((&wire3[(5'h14):(3'h4)]))));
  assign wire12 = ((~(reg5 ?
                          $signed((reg7 ? wire11 : wire1)) : (&(reg4 ?
                              reg5 : reg9)))) ?
                      {((|reg5[(3'h7):(3'h5)]) ?
                              $signed((reg5 || reg4)) : $unsigned($signed(reg6))),
                          (($signed((7'h43)) >>> reg8[(2'h2):(2'h2)]) ?
                              (((8'hb7) ?
                                  reg7 : reg6) + (wire0 << wire10)) : (&wire2))} : wire1);
  assign wire13 = ({$unsigned(((reg4 ?
                          reg5 : wire2) << wire11))} <= (~^$unsigned($signed(reg9[(2'h3):(1'h1)]))));
  assign wire14 = $unsigned($unsigned(wire2[(4'hc):(4'ha)]));
  module15 #() modinst77 (.wire17(wire11), .y(wire76), .clk(clk), .wire19(wire10), .wire16(reg4), .wire18(wire14));
  assign wire78 = wire11[(1'h0):(1'h0)];
  assign wire79 = reg7;
  assign wire80 = (wire78[(3'h4):(1'h1)] & wire2);
  assign wire81 = (~|($unsigned($signed($signed(wire14))) ?
                      $unsigned($unsigned((wire79 >>> wire79))) : ((reg7 >= ((7'h42) & (8'ha4))) ?
                          wire10 : $unsigned($unsigned(wire12)))));
  assign wire82 = $unsigned($unsigned((&$signed($unsigned(wire11)))));
  assign wire83 = (!(~^(~|(reg8 ? {wire0} : (wire0 ^ wire3)))));
  always
    @(posedge clk) begin
      reg84 <= reg4;
      if ((~(~|(+(~^$unsigned(reg6))))))
        begin
          reg85 <= {($unsigned($signed(wire11)) && $signed($signed((reg5 * wire1)))),
              reg6};
          if ((($signed(((~|wire2) ?
              (|wire0) : {wire12,
                  wire2})) < $unsigned(reg84[(2'h3):(2'h2)])) ^ reg84[(2'h2):(1'h1)]))
            begin
              reg86 <= ((~|(((reg85 ? wire76 : reg84) ?
                      (reg6 & reg85) : {reg9, reg4}) ?
                  $unsigned(wire79[(4'h8):(4'h8)]) : reg84)) >= (+$unsigned((7'h41))));
              reg87 <= wire79;
              reg88 <= $unsigned(wire11[(3'h4):(2'h2)]);
            end
          else
            begin
              reg86 <= reg4;
            end
          reg89 <= reg9;
          reg90 <= wire3[(4'hd):(1'h1)];
          if ($signed(reg8))
            begin
              reg91 <= reg9[(3'h4):(2'h2)];
              reg92 <= (~|{(wire13[(1'h0):(1'h0)] ?
                      ($unsigned(reg90) ^~ (wire14 ~^ wire79)) : $unsigned((wire14 || wire0))),
                  (-$unsigned((reg84 ? wire78 : wire10)))});
              reg93 <= ((($signed(reg88[(1'h1):(1'h1)]) >= (&(wire1 & wire3))) ^~ (^$signed(wire12))) ?
                  reg88[(1'h0):(1'h0)] : $signed((~^reg84)));
              reg94 <= ((wire13[(1'h1):(1'h0)] ?
                      ({(reg84 ? reg92 : (8'h9d)),
                          wire2} * {wire79}) : wire12) ?
                  (wire1[(2'h3):(1'h1)] & (^(&wire3))) : ((8'ha9) ?
                      $signed(reg5) : ($unsigned(wire82[(2'h2):(1'h0)]) >>> {reg93[(3'h5):(2'h3)]})));
            end
          else
            begin
              reg91 <= wire82;
              reg92 <= $signed(((((reg92 ^~ reg7) ?
                  $signed(reg87) : reg94) << wire2) - (wire76 ?
                  (-(&reg4)) : reg93[(3'h6):(1'h1)])));
              reg93 <= $signed($signed(wire0));
            end
        end
      else
        begin
          if (reg6)
            begin
              reg85 <= $unsigned((!({$signed(wire2)} * (^~reg91[(3'h6):(1'h1)]))));
              reg86 <= ({wire10} && {(!$unsigned($unsigned((8'hbd)))),
                  (!reg94)});
            end
          else
            begin
              reg85 <= $unsigned(((8'hbd) ?
                  ($signed((wire1 & reg84)) >>> wire3[(4'hd):(2'h2)]) : reg4[(4'hb):(2'h2)]));
              reg86 <= $unsigned((~wire0[(2'h3):(1'h0)]));
            end
          reg87 <= (8'hbd);
          reg88 <= (reg7 | ($signed({(|reg84)}) ?
              ((|((8'hb4) <<< (7'h44))) ^~ ($unsigned(wire0) <<< (-reg92))) : $signed(wire10)));
          reg89 <= ({$unsigned(wire14[(1'h0):(1'h0)]),
              reg7[(3'h6):(3'h5)]} <<< $signed(({$signed(reg7), wire2} ?
              {{(8'haa)}} : $unsigned((wire83 ? reg86 : wire76)))));
        end
    end
  assign wire95 = ((!wire78) ? (8'hb3) : (!reg91));
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire38;
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire40,
                 wire38,
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
                 reg64,
                 reg63,
                 reg62,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  module20 #() modinst39 (.wire23(wire17), .wire25(wire19), .wire22(wire16), .y(wire38), .wire21((8'hba)), .clk(clk), .wire24(wire18));
  assign wire40 = ((|$signed($unsigned(((8'hb7) ?
                      (8'ha1) : (8'ha9))))) * ((|((8'ha7) ? wire19 : (8'hae))) ?
                      $unsigned(({(8'ha2)} != $signed(wire16))) : $unsigned((8'ha8))));
  always
    @(posedge clk) begin
      reg41 <= (~&(8'hbe));
      if ((^~{wire16[(4'h9):(4'h9)], $unsigned($signed((~wire38)))}))
        begin
          reg42 <= (8'ha4);
          reg43 <= {$signed($unsigned(wire17[(2'h2):(1'h0)])), wire38};
          reg44 <= wire19[(3'h7):(3'h6)];
          reg45 <= reg41[(3'h6):(2'h2)];
          reg46 <= reg42[(3'h4):(2'h3)];
        end
      else
        begin
          reg42 <= reg44[(1'h0):(1'h0)];
          if (wire40[(3'h7):(1'h0)])
            begin
              reg43 <= (reg43 ?
                  $signed((reg43[(3'h7):(2'h3)] < (^$signed((8'hb7))))) : ((wire17 ?
                          $signed((^~wire38)) : (~&reg41[(3'h4):(2'h2)])) ?
                      (reg41 <= ((&reg44) ^ wire38)) : (^~(~&(^~(8'hbc))))));
              reg44 <= ({$signed(((wire17 - reg42) ?
                      reg43[(4'hd):(4'h9)] : wire17[(3'h5):(3'h5)])),
                  $signed($unsigned(wire40[(3'h4):(1'h0)]))} >>> ({{((7'h41) ?
                          wire19 : reg45)},
                  $unsigned((reg46 <<< wire38))} <= $signed($unsigned($unsigned(wire38)))));
              reg45 <= $signed(wire40);
            end
          else
            begin
              reg43 <= ((~|{$unsigned($unsigned(wire18))}) ?
                  wire18 : reg41[(2'h2):(1'h0)]);
              reg44 <= wire18[(4'hd):(3'h5)];
              reg45 <= wire17;
              reg46 <= $signed((reg43 && (((reg46 ? (8'hb1) : wire40) ?
                  $unsigned(reg46) : $unsigned(wire40)) || $signed((reg46 ?
                  reg41 : wire16)))));
            end
        end
      reg47 <= (reg45[(3'h4):(1'h0)] ?
          (((&(reg42 > reg42)) & {(~|wire38), (|(8'hbc))}) <<< (wire17 ?
              (|(reg46 ?
                  reg45 : (8'h9d))) : $signed($signed(wire17)))) : ($unsigned($signed(((8'ha7) < reg45))) != $unsigned($signed(reg46[(3'h6):(3'h5)]))));
      reg48 <= (($unsigned(reg44) ^ reg42[(4'h8):(4'h8)]) || (^~({$signed((8'hb4))} ^ ((reg41 || (8'hb7)) ?
          (~^wire17) : {(8'ha4), reg45}))));
      if ($unsigned($unsigned((wire18 >= reg44))))
        begin
          reg49 <= $signed($signed(reg42));
          reg50 <= {($unsigned(((reg42 ? reg47 : reg49) << ((8'hac) ?
                      wire38 : wire40))) ?
                  (+(~(reg45 ? (8'hbe) : reg46))) : (8'hb3))};
        end
      else
        begin
          reg49 <= reg41;
          reg50 <= ((reg42[(1'h0):(1'h0)] <= $unsigned((|$signed(reg43)))) ?
              {({reg43} <<< {(+(8'hbb))}),
                  ({$signed(reg44)} <<< (wire19[(1'h1):(1'h1)] ?
                      reg44[(2'h3):(2'h2)] : (wire40 ?
                          wire19 : wire18)))} : {$signed((^{reg43, (8'ha4)})),
                  (((reg50 ~^ wire18) < $signed(reg41)) + wire19[(1'h1):(1'h1)])});
          if ($unsigned(({wire38[(4'ha):(3'h7)],
              $signed($signed(wire38))} + wire17[(4'hc):(3'h6)])))
            begin
              reg51 <= (~^(|(~^{(reg41 > wire16), (~wire38)})));
              reg52 <= reg41[(3'h4):(2'h2)];
              reg53 <= ((~$unsigned($unsigned(reg42))) & $unsigned(reg42));
              reg54 <= wire19;
              reg55 <= ((^~(~(~&{reg49, reg45}))) + reg47[(1'h0):(1'h0)]);
            end
          else
            begin
              reg51 <= (8'ha8);
              reg52 <= (&$signed((reg52[(2'h2):(1'h0)] - ((reg44 ?
                  reg44 : reg42) * $unsigned(wire38)))));
              reg53 <= reg51[(4'hb):(3'h5)];
            end
          reg56 <= wire16[(2'h3):(1'h1)];
          reg57 <= (wire18 ? reg55[(4'h9):(4'h8)] : (reg48 > $unsigned(reg54)));
        end
    end
  assign wire58 = reg53;
  assign wire59 = (reg50[(4'hc):(1'h1)] > reg49);
  assign wire60 = (wire59[(1'h1):(1'h0)] ?
                      ((-reg52[(1'h1):(1'h1)]) ?
                          reg52 : wire59) : reg44[(2'h3):(1'h1)]);
  assign wire61 = {(reg47[(3'h4):(2'h2)] ?
                          (-((reg42 ?
                              wire60 : reg48) > $signed(reg45))) : ($unsigned(wire60) ?
                              (8'ha3) : reg51[(4'h9):(3'h5)])),
                      (reg55 * {(8'hb3), $unsigned((reg44 ^ (8'ha8)))})};
  always
    @(posedge clk) begin
      reg62 <= ((^~reg41[(4'ha):(1'h0)]) >>> reg46);
      reg63 <= (wire40[(3'h5):(3'h5)] ?
          (+($signed((reg41 || (8'ha7))) <= $signed((reg41 ?
              (8'hb0) : reg56)))) : reg57);
      reg64 <= wire60;
      if ($unsigned($unsigned((~^wire61[(3'h4):(3'h4)]))))
        begin
          reg65 <= reg64;
          reg66 <= $signed((7'h44));
          reg67 <= ($signed({(~(~&reg54)), reg64[(1'h0):(1'h0)]}) ?
              reg42 : (7'h44));
          reg68 <= $unsigned((~|$unsigned(reg67)));
          reg69 <= (($signed($unsigned((reg41 ^ (8'hb4)))) ^ wire19) <= ({((reg67 ?
                          wire17 : reg56) ?
                      $signed(wire60) : wire60[(5'h11):(4'hc)]),
                  ({reg43} || $unsigned(reg64))} ?
              $signed(reg53) : {($signed(reg43) ? {reg49} : reg56)}));
        end
      else
        begin
          reg65 <= ((({{reg47, reg52}} ? reg62 : {{reg41, reg50}, reg55}) ?
              (~^((wire61 - wire58) ?
                  (8'hb6) : (reg52 ?
                      reg47 : wire61))) : wire58) >= reg54[(4'h9):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg70 <= {(&(^~$signed((wire38 > reg52)))), $unsigned((~^reg44))};
      reg71 <= (wire19[(3'h6):(3'h6)] ?
          $unsigned(reg67) : reg47[(3'h4):(1'h0)]);
      reg72 <= (((8'ha1) ?
          (!((wire19 - reg47) & $signed(wire16))) : {reg64[(1'h0):(1'h0)]}) | (^wire38));
      if ($unsigned($unsigned((($unsigned(reg48) || reg71[(1'h1):(1'h0)]) >= (&reg54[(2'h2):(2'h2)])))))
        begin
          reg73 <= $unsigned(reg63);
          reg74 <= $unsigned(reg54);
        end
      else
        begin
          reg73 <= ($signed($unsigned((wire59 ?
              $unsigned((8'haf)) : ((8'hb0) | reg70)))) >>> (^~$unsigned(((8'ha7) != $signed(wire16)))));
        end
      reg75 <= (8'had);
    end
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire26;
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 reg27,
                 (1'h0)};
  assign wire26 = $signed(wire24[(3'h7):(2'h3)]);
  always
    @(posedge clk) begin
      reg27 <= (wire22[(3'h7):(3'h4)] ?
          {({(wire24 ? wire24 : wire26)} == wire22),
              $unsigned($signed($unsigned(wire23)))} : $unsigned($unsigned(((+wire21) <= $signed(wire23)))));
    end
  assign wire28 = $unsigned(($signed((wire24[(1'h0):(1'h0)] ~^ wire21[(3'h4):(2'h2)])) ?
                      reg27[(3'h5):(2'h2)] : (($signed(wire24) ?
                              (~^wire23) : wire26) ?
                          ((wire23 ~^ wire22) ?
                              (wire22 == wire26) : ((8'ha1) << wire24)) : $unsigned($unsigned((7'h41))))));
  assign wire29 = (reg27[(3'h6):(1'h1)] <= wire23[(2'h2):(1'h1)]);
  assign wire30 = wire26;
  assign wire31 = ($unsigned($signed(reg27[(3'h4):(2'h2)])) >>> $unsigned($unsigned($signed({wire23,
                      wire25}))));
  assign wire32 = wire21;
  assign wire33 = (wire31 ?
                      ({wire32,
                          ($signed(wire32) == {reg27,
                              (8'haa)})} >= wire29[(1'h0):(1'h0)]) : (!wire31));
  assign wire34 = (~($signed(($unsigned(wire30) ?
                      $unsigned(wire25) : reg27)) & {wire32[(4'h9):(2'h3)]}));
  assign wire35 = $unsigned($signed({(|(wire28 - wire29))}));
  assign wire36 = wire33;
  assign wire37 = $signed(wire31[(4'h9):(4'h9)]);
endmodule
