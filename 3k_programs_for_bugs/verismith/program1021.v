module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire60;
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
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
                 (1'h0)};
  module4 #() modinst61 (wire60, clk, wire1, wire2, wire3, wire0);
  assign wire62 = (~(wire2[(1'h0):(1'h0)] != $unsigned(($unsigned(wire2) ?
                      {wire1} : (wire3 ? (8'h9c) : wire0)))));
  assign wire63 = ((|(8'ha9)) ?
                      (($signed($signed(wire3)) ^~ {(wire2 && wire60)}) ?
                          (~&(!wire62[(2'h2):(2'h2)])) : wire60) : wire2[(3'h4):(3'h4)]);
  assign wire64 = wire0[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg65 <= $unsigned(wire60);
      reg66 <= {(&({$signed(wire64)} ? wire2 : {$unsigned(wire63)})),
          $signed($signed($signed(((8'hbb) ? reg65 : (8'hbc)))))};
      if ((wire2[(3'h6):(1'h0)] * $signed((^~$signed((reg66 <<< wire63))))))
        begin
          reg67 <= wire60[(1'h0):(1'h0)];
          reg68 <= wire3[(3'h5):(2'h2)];
          reg69 <= $unsigned((~^(^~$unsigned((wire63 ? wire1 : reg67)))));
        end
      else
        begin
          reg67 <= {((wire60[(3'h4):(2'h2)] >> reg68[(2'h2):(2'h2)]) ?
                  (|(8'ha7)) : $unsigned((reg67 < $signed(reg69))))};
          reg68 <= reg66[(3'h4):(3'h4)];
          if ((~|(8'hbf)))
            begin
              reg69 <= (~^(wire64 ?
                  wire62[(4'he):(4'ha)] : wire62[(4'hb):(1'h0)]));
              reg70 <= (wire1[(2'h3):(1'h1)] ?
                  reg69[(4'hb):(3'h7)] : $signed((+(reg67 ^~ $signed((8'hb8))))));
              reg71 <= (+{($unsigned((&reg70)) ?
                      $signed($unsigned((8'h9f))) : reg67[(1'h1):(1'h1)])});
              reg72 <= ((8'hbb) != reg66);
            end
          else
            begin
              reg69 <= wire63[(4'hd):(3'h4)];
              reg70 <= ((({wire1[(5'h12):(4'hc)]} >= $signed((^~reg72))) ?
                      ({(8'h9e)} >= ((reg66 ?
                          reg67 : wire63) != {wire64})) : $signed(({wire62} ?
                          wire1[(2'h3):(2'h2)] : $signed(wire0)))) ?
                  $unsigned(reg68[(2'h3):(2'h3)]) : $unsigned((($signed(wire62) || {reg68}) ?
                      $signed($unsigned(reg66)) : (^(wire64 <= wire2)))));
              reg71 <= reg72[(5'h10):(4'hc)];
              reg72 <= $unsigned($signed(wire2[(1'h1):(1'h0)]));
              reg73 <= (reg71 ?
                  {($unsigned((8'hae)) > wire1),
                      wire63[(1'h1):(1'h0)]} : $signed($signed(reg71[(4'hc):(3'h4)])));
            end
          reg74 <= ($signed((wire62 > reg70)) >>> (+reg69[(4'h9):(3'h6)]));
          reg75 <= (8'hbd);
        end
      reg76 <= $unsigned(reg69);
    end
  assign wire77 = $unsigned((!(-wire60[(4'hd):(4'hc)])));
  assign wire78 = $signed(wire63);
  assign wire79 = ($signed(reg72[(1'h0):(1'h0)]) & $signed(reg70));
  assign wire80 = ((8'ha7) + (reg71 ?
                      ({(reg68 ? reg67 : reg67), wire77[(4'h8):(3'h5)]} ?
                          {$unsigned(wire3), reg72[(4'hc):(2'h2)]} : ((wire2 ?
                                  reg67 : reg68) ?
                              $signed(reg75) : wire78[(4'ha):(1'h1)])) : $signed(((wire62 < reg65) <<< $unsigned(wire77)))));
  assign wire81 = wire0;
  assign wire82 = ((reg70 ?
                          ({$unsigned(wire1)} * $signed((wire1 >= wire63))) : $signed((8'hb1))) ?
                      (({(reg66 * reg66),
                              reg74[(4'h9):(1'h1)]} & $signed($signed(reg76))) ?
                          wire1[(1'h1):(1'h0)] : (reg76 ?
                              $signed($signed(wire64)) : $signed($unsigned(wire79)))) : reg66[(2'h2):(2'h2)]);
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire5;
  input wire signed [(2'h3):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire43;
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire12,
                 wire43,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= ((wire5 & ($signed($unsigned(wire8)) == (!(!(8'ha3))))) >>> wire5[(1'h1):(1'h1)]);
      reg10 <= (wire8[(3'h6):(2'h2)] ? wire7 : reg9);
      reg11 <= $unsigned((wire8 >>> $signed(wire8)));
    end
  assign wire12 = (~^reg9);
  module13 #() modinst44 (wire43, clk, reg11, reg10, wire8, wire12, wire7);
  assign wire45 = wire7[(1'h1):(1'h1)];
  assign wire46 = wire43[(3'h5):(3'h4)];
  assign wire47 = ($unsigned((-{((8'hb5) ? wire8 : wire43),
                      $unsigned(wire5)})) * (($signed((wire43 ?
                          wire46 : wire46)) ?
                      wire8[(5'h10):(1'h0)] : $signed((wire12 >> (8'hb3)))) | $unsigned(wire6[(1'h0):(1'h0)])));
  assign wire48 = $signed(wire6);
  assign wire49 = ({$signed((wire8 && (wire43 ? wire46 : wire7))),
                          (&(wire48[(3'h4):(1'h1)] != $unsigned(wire48)))} ?
                      $signed((reg11[(4'hb):(3'h6)] ?
                          ({wire47} ?
                              {wire7} : wire47[(4'h8):(3'h6)]) : (~|(^~wire48)))) : wire47);
  assign wire50 = ({(8'h9c), wire48} >>> ((&($signed(wire8) ?
                      $unsigned(reg10) : wire46[(3'h4):(1'h1)])) - wire6));
  always
    @(posedge clk) begin
      reg51 <= reg9;
      reg52 <= $signed($signed((($signed(wire47) <= (~|(8'hbc))) ^~ $unsigned((wire45 ?
          wire7 : wire6)))));
      reg53 <= ($signed(($unsigned((!wire8)) ? wire45[(3'h6):(3'h4)] : wire6)) ?
          wire8 : wire48);
      reg54 <= (wire43 ?
          $signed((~&($signed(reg11) ? $unsigned(wire12) : wire5))) : ((8'ha5) ?
              $signed((~&(reg52 != wire47))) : $unsigned(reg9[(4'h9):(4'h8)])));
    end
  assign wire55 = $signed({((wire50 ?
                          reg51 : (8'h9c)) ^~ (^(wire43 != wire48))),
                      $signed((wire5 ^~ (-(8'hb2))))});
  assign wire56 = {wire6[(2'h2):(1'h0)], wire49};
  assign wire57 = $unsigned((($unsigned((wire47 >= reg10)) >>> ((wire7 && (8'hb0)) + reg53)) ?
                      reg53[(2'h3):(2'h2)] : ($signed($unsigned(wire50)) != ((8'ha8) ?
                          {reg10, (8'hb7)} : (reg9 <= wire5)))));
  assign wire58 = reg54[(2'h2):(1'h0)];
  assign wire59 = wire43;
endmodule

module module13
#(parameter param42 = ((~&{{((8'haf) << (8'h9c)), {(8'hb4)}}, (((8'hbb) && (7'h40)) ? (8'ha8) : ((8'ha9) ^~ (8'ha9)))}) ? ((((~&(8'hb7)) <<< (8'h9f)) ? (8'hb9) : ((+(8'hb4)) >= ((8'hbe) > (8'ha1)))) & (|(((8'hbe) << (8'h9f)) ? (-(8'ha0)) : ((8'haa) <= (8'hb0))))) : ((((~|(8'h9f)) < ((8'hb7) * (7'h43))) ~^ (^(^(7'h42)))) ? ((-((8'ha7) ^ (8'hae))) == (8'ha7)) : {((^(8'hbc)) ? ((7'h40) ? (8'hbc) : (8'hb7)) : ((8'hba) ? (8'hb2) : (8'hbe))), (((8'had) != (8'ha3)) <= ((8'ha0) == (8'hb5)))})))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire29,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg38,
                 reg37,
                 reg36,
                 reg32,
                 reg31,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire19 = $unsigned({($unsigned(wire15) ?
                          ((&wire16) ?
                              wire17 : wire17) : $signed($signed(wire16)))});
  assign wire20 = (wire16[(3'h7):(2'h3)] ~^ wire19);
  assign wire21 = (+wire20[(2'h2):(2'h2)]);
  assign wire22 = wire17[(2'h3):(2'h3)];
  assign wire23 = (wire18[(4'hf):(1'h1)] ?
                      (8'ha1) : ((|$signed($signed(wire20))) == {$signed((wire17 ?
                              (8'hbb) : wire14))}));
  always
    @(posedge clk) begin
      reg24 <= ((|wire23[(4'h8):(2'h3)]) ?
          wire17 : $unsigned((((wire18 + wire17) ? (wire19 - wire20) : wire17) ?
              (+(wire16 ? wire19 : wire21)) : wire21[(4'hd):(4'h9)])));
      reg25 <= $unsigned({(+wire17[(2'h2):(1'h0)])});
      reg26 <= {(~|(($unsigned(wire17) ?
                  wire21[(4'he):(4'he)] : $signed(wire16)) ?
              (~|reg25) : ($signed(wire20) ?
                  (wire21 ? wire23 : wire16) : (wire22 ? wire21 : (8'hb2))))),
          (8'hbc)};
      reg27 <= wire14;
      reg28 <= (+wire21[(4'he):(2'h3)]);
    end
  assign wire29 = $signed((~^reg28));
  assign wire30 = wire18;
  always
    @(posedge clk) begin
      reg31 <= ({wire18[(4'hb):(3'h4)]} ?
          (wire16 ?
              wire14 : $signed(reg26[(3'h4):(2'h2)])) : $signed($unsigned((&$signed(wire14)))));
      reg32 <= (~|wire21[(4'hb):(3'h5)]);
    end
  assign wire33 = (((-wire29) < reg25) ?
                      $signed($signed(((!wire20) != (!reg28)))) : {((~(wire29 ?
                              reg24 : reg28)) | ($unsigned(wire16) ?
                              (reg27 ?
                                  reg24 : wire22) : reg24[(2'h3):(2'h3)]))});
  assign wire34 = $signed($unsigned(reg32[(4'hb):(1'h0)]));
  assign wire35 = reg28[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg36 <= reg28[(1'h1):(1'h1)];
      reg37 <= $unsigned(reg25[(4'ha):(1'h1)]);
      reg38 <= wire19[(2'h2):(1'h0)];
    end
  assign wire39 = {($signed(reg32[(4'hb):(4'h8)]) ~^ wire29),
                      (-(reg27 ? {$signed(reg28)} : reg36))};
  assign wire40 = $signed((+reg24));
  assign wire41 = (&((8'hae) ?
                      $signed(($signed(wire29) ?
                          reg38[(2'h3):(2'h3)] : (reg37 ?
                              (8'ha1) : wire30))) : $signed(wire34[(4'h9):(2'h2)])));
endmodule
