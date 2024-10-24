module top
#(parameter param87 = (~&({({(8'hba), (8'hbe)} <= ((8'ha4) ? (8'h9d) : (7'h43)))} > {(((8'hbf) ? (8'ha5) : (8'ha5)) <= {(8'hba), (8'haf)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire67,
                 wire66,
                 wire64,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned(wire2[(4'hf):(4'h8)]);
  always
    @(posedge clk) begin
      reg6 <= $signed($signed($signed(wire2[(4'h8):(2'h3)])));
      reg7 <= wire0[(1'h1):(1'h1)];
    end
  assign wire8 = (~&{{wire1}});
  assign wire9 = (8'hab);
  assign wire10 = wire0[(2'h3):(1'h0)];
  assign wire11 = {($signed($unsigned(wire8[(3'h5):(2'h3)])) ?
                          reg6[(3'h4):(1'h1)] : (~&$signed(reg7[(1'h1):(1'h0)]))),
                      $signed((~&((wire3 >> reg6) ?
                          (7'h40) : (wire5 != wire8))))};
  assign wire12 = wire1;
  assign wire13 = (((^~((reg6 ? wire5 : reg6) ?
                          wire4[(1'h1):(1'h0)] : (+wire5))) >= (wire3[(4'hd):(4'h9)] == $unsigned($unsigned(wire11)))) ?
                      (8'ha5) : ({$unsigned($unsigned(reg6))} <= (((7'h42) > wire1[(3'h5):(1'h1)]) ?
                          reg7[(1'h0):(1'h0)] : ((wire0 ?
                              (7'h41) : wire9) ^ (-reg6)))));
  assign wire14 = wire9;
  module15 #() modinst65 (wire64, clk, reg6, reg7, wire5, wire11);
  assign wire66 = ((($signed($signed(wire2)) ?
                      (~$unsigned(wire3)) : $unsigned(wire13)) == $signed($signed($unsigned((8'hbf))))) - $signed(($signed(wire1[(4'h8):(3'h6)]) ?
                      $unsigned($unsigned(reg7)) : ($signed(reg7) ?
                          (reg7 < wire0) : {wire1}))));
  assign wire67 = $signed($unsigned((8'hb5)));
  always
    @(posedge clk) begin
      reg68 <= (wire13[(3'h4):(1'h1)] && (~&(8'hb9)));
      if ($unsigned($signed((~((wire9 == wire10) << wire64[(3'h5):(1'h0)])))))
        begin
          reg69 <= {$signed((!{$unsigned(wire4)})),
              ((((wire2 ? wire12 : wire8) ?
                          wire9[(3'h6):(3'h5)] : reg7[(3'h7):(3'h6)]) ?
                      wire8 : wire4[(3'h4):(2'h2)]) ?
                  (wire2[(4'he):(1'h1)] <= reg7) : ($signed((~&(8'hb8))) & {(^wire4),
                      {reg6}}))};
          reg70 <= wire8;
          reg71 <= (^~((((wire10 ? (8'h9e) : (8'ha8)) ?
                  $unsigned(wire11) : $signed(reg70)) || ($unsigned(wire3) - wire10[(3'h4):(1'h1)])) ?
              (wire1[(4'hc):(4'hb)] > ($signed(reg7) ?
                  reg6[(3'h5):(3'h4)] : (reg7 ?
                      wire10 : wire67))) : {reg6[(3'h4):(2'h2)]}));
          if ((^~($signed(wire1) ^~ wire13)))
            begin
              reg72 <= ((~^($signed((8'ha7)) <<< $signed((wire11 ?
                      wire0 : wire10)))) ?
                  $unsigned((~|$unsigned((wire13 ?
                      wire64 : wire2)))) : $unsigned((~reg7[(4'hc):(4'hb)])));
              reg73 <= (($signed(($signed((8'hbd)) ?
                      $signed((8'hb2)) : (reg71 >> reg71))) < ($unsigned((wire4 ~^ wire5)) ?
                      wire67[(1'h1):(1'h0)] : $unsigned({wire9}))) ?
                  (8'ha1) : reg68);
              reg74 <= (~|$unsigned($unsigned($signed((8'hb0)))));
            end
          else
            begin
              reg72 <= $signed((wire9 | ((8'hb3) << (~&(wire4 ?
                  wire0 : wire2)))));
              reg73 <= (wire5 ? wire8 : wire8);
              reg74 <= (({wire10,
                      $signed((wire4 >> (8'ha4)))} >>> (~|$signed((~wire0)))) ?
                  reg72 : wire11);
            end
        end
      else
        begin
          if ($signed(($unsigned(wire4) + ($unsigned(wire8[(2'h3):(2'h2)]) ?
              $signed((|wire14)) : wire14[(5'h14):(4'hf)]))))
            begin
              reg69 <= (($signed(($unsigned(wire12) ?
                      ((8'h9e) >> wire9) : (reg73 == wire4))) ?
                  (8'hb4) : $signed(((~^wire14) ?
                      $unsigned(wire1) : (reg73 ?
                          wire14 : reg6)))) < {$unsigned((^(~wire5))), wire2});
              reg70 <= wire67;
              reg71 <= $unsigned((($signed($unsigned((8'hbc))) ?
                      $signed(reg74) : reg68[(1'h0):(1'h0)]) ?
                  $unsigned((reg72 - reg74)) : reg73[(3'h5):(2'h3)]));
              reg72 <= ($unsigned(reg6[(4'ha):(3'h5)]) ?
                  wire14[(4'h8):(1'h0)] : (8'hb0));
              reg73 <= $signed(reg68[(3'h7):(1'h1)]);
            end
          else
            begin
              reg69 <= (wire1 ?
                  (($signed(wire4[(2'h3):(1'h1)]) ?
                          wire67[(1'h1):(1'h1)] : reg68[(1'h0):(1'h0)]) ?
                      ($signed($signed(reg7)) ^~ (7'h40)) : $unsigned($unsigned((wire10 ?
                          wire9 : wire5)))) : $signed({$signed((!wire11)),
                      wire64}));
              reg70 <= $signed({(+wire4[(1'h0):(1'h0)])});
              reg71 <= $signed({$signed(reg6), reg74[(3'h4):(1'h1)]});
            end
        end
      if ((^($signed(({reg7} ?
          (~reg71) : (wire3 ? wire2 : reg6))) * (($signed(wire8) ?
              $signed(reg72) : $signed(wire8)) ?
          wire66 : reg69))))
        begin
          reg75 <= wire14;
          reg76 <= reg6[(3'h4):(2'h3)];
          reg77 <= $signed($unsigned((|($unsigned(reg74) ?
              (+wire11) : (wire9 == wire1)))));
        end
      else
        begin
          reg75 <= wire0;
          reg76 <= (wire1 ?
              (((|reg72[(3'h7):(2'h3)]) ?
                  wire5[(3'h7):(1'h0)] : wire67[(1'h1):(1'h1)]) - {$signed((wire2 ?
                      wire67 : wire0)),
                  wire11[(3'h4):(2'h3)]}) : (8'hb0));
          reg77 <= (~$signed((+(!(wire9 ? reg72 : wire9)))));
          if ((~&wire10[(1'h1):(1'h0)]))
            begin
              reg78 <= ((((wire8 ?
                  $unsigned(wire4) : (reg77 ?
                      reg71 : wire8)) <<< (~&reg74[(1'h1):(1'h0)])) >> (wire8 ?
                  ((+(8'ha7)) << $signed(reg7)) : (|$signed((8'hab))))) >> {reg69[(2'h3):(2'h2)]});
              reg79 <= {$signed((wire11[(1'h1):(1'h0)] + ((wire13 ?
                      reg72 : reg71) < (~|wire5))))};
              reg80 <= ((|$signed((((8'h9c) | reg73) ?
                  ((8'ha9) ?
                      wire10 : wire8) : wire0[(2'h2):(2'h2)]))) < (&wire8));
            end
          else
            begin
              reg78 <= reg77;
              reg79 <= (&wire11);
            end
          reg81 <= $signed(wire66[(3'h5):(1'h1)]);
        end
      reg82 <= $signed($signed((reg69 >>> $signed((reg73 ? wire0 : reg80)))));
      reg83 <= (((8'hac) * wire13[(1'h1):(1'h1)]) ?
          $signed((7'h42)) : $unsigned($unsigned(($signed(reg72) ?
              (~&reg80) : (wire67 ^ reg82)))));
    end
  assign wire84 = (~|$signed($unsigned($signed((reg82 & reg7)))));
  assign wire85 = (8'h9f);
  assign wire86 = {wire1[(2'h2):(1'h1)]};
endmodule

module module15
#(parameter param63 = (({{((8'h9c) ^ (8'hbb)), (-(8'ha4))}} < ((((8'hb2) >> (8'ha0)) ? ((8'hb1) && (8'ha2)) : {(8'haa), (8'hb1)}) ? {((8'h9e) || (8'hb4))} : (~|(~^(7'h44))))) ? {((((8'ha7) ? (8'hb5) : (7'h43)) <<< ((8'ha6) ? (8'hbb) : (8'hbd))) * (((8'ha8) ? (8'ha8) : (8'hb9)) ? ((8'hbc) - (8'hb2)) : (|(8'hbf))))} : ((((+(8'hb6)) ? (~^(8'hab)) : (|(7'h44))) ? (+((8'hbe) ? (8'hb9) : (8'hbf))) : (((8'ha1) ^ (8'ha4)) ? (~&(8'ha4)) : ((8'ha7) && (8'hbe)))) <<< (&(((7'h41) >>> (7'h42)) ? ((8'hb3) < (8'hb7)) : (^~(8'h9e)))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire21,
                 wire20,
                 reg38,
                 reg37,
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
  assign wire20 = (^$signed(wire16[(1'h1):(1'h1)]));
  assign wire21 = $signed(($signed(wire20) ?
                      wire18[(1'h1):(1'h0)] : (^$signed($unsigned(wire18)))));
  always
    @(posedge clk) begin
      if (($unsigned(wire20[(1'h1):(1'h1)]) > (wire21 < $signed(wire20))))
        begin
          reg22 <= (+{$unsigned($signed(wire17[(4'hb):(3'h6)]))});
          reg23 <= $unsigned(wire20[(1'h1):(1'h1)]);
        end
      else
        begin
          reg22 <= reg22[(4'h8):(1'h0)];
          reg23 <= wire16;
          reg24 <= (~|reg23);
        end
      reg25 <= ((~&wire16) ?
          (reg23 | ($signed((wire19 & (8'hb6))) ?
              $unsigned($unsigned(reg22)) : (8'ha6))) : $unsigned($signed({$signed(wire19)})));
      reg26 <= {wire16, reg25[(1'h1):(1'h1)]};
    end
  always
    @(posedge clk) begin
      reg27 <= (&wire20);
      reg28 <= $unsigned({wire20[(4'h8):(3'h4)]});
      if ($unsigned($unsigned(wire21)))
        begin
          reg29 <= reg25[(3'h4):(1'h1)];
          reg30 <= {($signed((|{wire19, reg27})) ?
                  (~^reg24) : ((~^((8'hb1) ?
                      wire21 : reg25)) != reg29[(4'hd):(4'hb)])),
              ((reg25[(2'h3):(1'h1)] && (8'hb0)) ?
                  wire20[(2'h3):(2'h2)] : reg28[(2'h2):(2'h2)])};
          reg31 <= $signed($signed((^~wire21)));
          if ((|$unsigned(((^wire19) ?
              {$unsigned((8'hbb)), reg29} : $signed($signed(reg23))))))
            begin
              reg32 <= (wire20[(3'h7):(2'h3)] >>> {((&(~&(8'h9f))) ?
                      (~&$unsigned(reg29)) : ($signed(reg28) ?
                          {wire18, reg31} : (wire20 ? reg24 : (8'ha9)))),
                  (($signed(reg30) ? wire21 : reg29) ?
                      ($unsigned(wire18) * ((8'hba) || reg29)) : reg28)});
              reg33 <= ((8'ha9) && (^~$signed({$unsigned(wire16)})));
              reg34 <= reg25;
              reg35 <= $unsigned(($signed($unsigned($signed(reg31))) ?
                  ((7'h43) >> $unsigned($signed(reg30))) : ($signed(reg22[(1'h0):(1'h0)]) ?
                      reg23 : reg27)));
              reg36 <= reg26[(1'h0):(1'h0)];
            end
          else
            begin
              reg32 <= (^$unsigned($signed($unsigned({reg33}))));
              reg33 <= (^(8'h9c));
              reg34 <= ($signed($unsigned((+((8'hb2) ?
                  reg33 : (7'h40))))) && (^reg35));
              reg35 <= $unsigned(reg24);
              reg36 <= (+((~^(~(^reg27))) ?
                  ((!{wire21, reg26}) ?
                      reg24 : $unsigned((|reg33))) : $unsigned($unsigned($unsigned(reg33)))));
            end
          reg37 <= $signed($signed((^wire20)));
        end
      else
        begin
          reg29 <= $signed($signed($unsigned(wire21[(4'hf):(3'h5)])));
          if ($signed((wire19 ? $unsigned(reg27[(2'h2):(2'h2)]) : reg37)))
            begin
              reg30 <= $unsigned((!$unsigned($signed($unsigned(reg34)))));
              reg31 <= (((wire20[(3'h7):(3'h6)] ?
                      {$unsigned((8'haa))} : reg26[(2'h2):(1'h1)]) > ((((8'ha5) ?
                          reg37 : (8'hb3)) ?
                      $signed(wire17) : $unsigned((8'had))) && reg32)) ?
                  {(!(+(wire18 ? reg30 : reg29))),
                      (((reg28 ^~ reg36) >>> {wire18, wire18}) ?
                          ({(8'hb0)} < $signed(reg24)) : reg30[(1'h0):(1'h0)])} : wire16[(1'h1):(1'h1)]);
              reg32 <= {((reg27 ?
                          $unsigned((reg27 * wire19)) : $unsigned(((8'ha7) * reg24))) ?
                      (8'hbc) : (8'hb8)),
                  ((+{(reg27 ? reg34 : reg29)}) == reg31[(3'h4):(1'h1)])};
              reg33 <= (8'hb7);
            end
          else
            begin
              reg30 <= (reg33 == {$signed($unsigned(reg33)),
                  $unsigned((!$unsigned(wire21)))});
              reg31 <= (|($unsigned(($signed(wire20) - (reg22 || reg22))) ?
                  $unsigned((~((8'ha8) ^~ wire20))) : (((8'hb9) + (~^reg22)) ?
                      $signed((reg22 ?
                          wire21 : wire17)) : reg25[(1'h1):(1'h0)])));
              reg32 <= (($unsigned({$signed(reg33)}) || reg29[(4'hb):(1'h0)]) >= $signed({$unsigned((^(8'h9f))),
                  reg34}));
              reg33 <= wire20;
              reg34 <= ($unsigned($unsigned($signed((reg28 ^ wire21)))) ?
                  ($unsigned(($signed(reg23) ?
                      (~|wire16) : (reg37 | reg26))) || {reg30[(3'h6):(3'h5)],
                      ((reg27 ? reg29 : reg24) ?
                          (reg27 ?
                              reg37 : (8'ha2)) : (~|wire17))}) : (+$unsigned($signed({reg25,
                      (8'hbe)}))));
            end
          reg35 <= ((reg22[(3'h5):(3'h5)] ?
              (reg33[(4'h8):(3'h6)] <<< (reg32[(3'h5):(3'h4)] ?
                  {reg27, (8'h9f)} : (|(8'hb5)))) : reg34) >> (((reg33 ?
                  (8'hbf) : (!(8'haa))) ^~ wire19[(3'h7):(3'h6)]) ?
              reg30 : reg33[(1'h1):(1'h0)]));
        end
      reg38 <= (-$unsigned((~^(~^$signed(reg35)))));
    end
  assign wire39 = $unsigned(wire17[(4'h8):(2'h2)]);
  assign wire40 = (+(reg22 ^~ (8'haf)));
  assign wire41 = wire40[(3'h4):(1'h0)];
  assign wire42 = wire40[(1'h1):(1'h0)];
  module43 #() modinst59 (.wire46(wire41), .y(wire58), .clk(clk), .wire44(wire20), .wire47(wire40), .wire45(wire16));
  assign wire60 = wire42;
  assign wire61 = ({((reg35 ^ $signed(reg30)) ?
                          $signed((^~wire20)) : reg37[(1'h1):(1'h0)])} || {$unsigned({(&wire58)}),
                      {((~&reg33) ? {(8'hab)} : (reg28 ? reg31 : reg27)),
                          $unsigned($unsigned(reg34))}});
  assign wire62 = (reg37 && (~|(^~{(8'hbe)})));
endmodule

module module43  (y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire [(3'h5):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'h9f))
        begin
          reg48 <= (wire44[(1'h0):(1'h0)] ?
              ((((~wire44) ? (wire47 <= wire47) : wire44[(3'h4):(1'h0)]) ?
                  ({wire47} ^ (wire45 >> wire44)) : (~(~|wire45))) <= $signed((!$unsigned(wire46)))) : wire45[(3'h5):(1'h0)]);
          reg49 <= ((-(wire46 ?
                  wire46 : ((wire45 ? (8'ha3) : (8'hba)) ?
                      {wire44, (8'hb9)} : (+wire45)))) ?
              ((&{$signed(wire45), $signed((7'h42))}) ?
                  {(wire45[(3'h6):(3'h6)] << ((8'ha3) ^~ wire44)),
                      $signed((reg48 ?
                          wire45 : wire45))} : ((wire45[(3'h6):(1'h1)] ?
                      $unsigned(wire45) : {wire45}) <= $signed($unsigned(wire45)))) : wire45);
          reg50 <= reg48[(5'h10):(4'hf)];
          reg51 <= wire46[(3'h6):(3'h5)];
          reg52 <= reg49;
        end
      else
        begin
          reg48 <= reg48;
        end
      reg53 <= {$unsigned(reg48[(5'h12):(1'h1)])};
    end
  assign wire54 = $unsigned(($signed((reg51 ?
                      (reg53 < (8'hb4)) : (reg48 << (7'h42)))) && $unsigned(((wire47 > reg51) || (8'hbc)))));
  assign wire55 = (!wire44[(1'h1):(1'h1)]);
  assign wire56 = {($signed($unsigned((^wire45))) ?
                          $signed($unsigned((reg50 ?
                              wire46 : reg50))) : (~^$unsigned(reg53[(2'h2):(2'h2)])))};
  assign wire57 = $signed($signed($signed($unsigned($signed((7'h44))))));
endmodule
