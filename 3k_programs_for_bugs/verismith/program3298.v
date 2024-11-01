module top
#(parameter param87 = (~&{{(((8'hbe) ? (8'hbf) : (8'haa)) >> ((8'ha5) | (8'hb6)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  assign y = {wire72,
                 wire70,
                 wire9,
                 wire6,
                 wire5,
                 reg86,
                 reg85,
                 reg84,
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
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire5 = ((+wire2) | ($unsigned($unsigned(wire1[(3'h5):(3'h5)])) ?
                     ($signed(((8'hbf) * wire4)) == wire1) : wire0));
  assign wire6 = $unsigned(wire0[(5'h11):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= {(({((8'haf) ? wire6 : wire6), wire3[(4'he):(4'hd)]} ?
              {wire6,
                  $unsigned(wire3)} : $unsigned($unsigned((7'h42)))) <<< wire6[(1'h1):(1'h1)])};
      reg8 <= $unsigned($unsigned((~&(wire0[(4'ha):(3'h5)] ?
          wire1[(4'hc):(4'h8)] : (!(8'ha9))))));
    end
  assign wire9 = ($signed((wire2[(2'h2):(2'h2)] ?
                     ($signed(reg8) ?
                         $unsigned(wire6) : ((8'ha9) <= wire1)) : ($unsigned(reg7) >>> $signed(reg7)))) - (~|wire0[(2'h2):(2'h2)]));
  module10 #() modinst71 (wire70, clk, reg8, wire5, wire2, wire1, wire0);
  assign wire72 = (~^wire9[(4'ha):(3'h7)]);
  always
    @(posedge clk) begin
      reg73 <= (8'hb7);
      reg74 <= wire70[(3'h7):(1'h0)];
      if (wire70)
        begin
          if (((reg74[(4'hc):(3'h4)] ?
                  wire2 : $unsigned($unsigned($unsigned(wire5)))) ?
              wire6[(2'h3):(2'h3)] : (wire72 ?
                  $signed((^$signed(reg8))) : ($unsigned((reg73 ?
                          wire6 : reg73)) ?
                      {reg7} : reg7[(4'hd):(3'h4)]))))
            begin
              reg75 <= (!wire3[(4'h9):(4'h8)]);
              reg76 <= $unsigned(((+(^~(^~(8'h9f)))) ?
                  reg74[(3'h4):(1'h1)] : (&({wire2} ? {reg8} : wire2))));
              reg77 <= (reg75[(1'h0):(1'h0)] >> wire0[(4'hc):(4'ha)]);
              reg78 <= (|(reg75[(2'h2):(1'h0)] == reg76));
            end
          else
            begin
              reg75 <= $signed({reg74});
              reg76 <= (wire5[(5'h11):(4'h9)] - $unsigned($unsigned($signed($unsigned(wire72)))));
              reg77 <= ((^(wire1 | reg76[(1'h0):(1'h0)])) < $signed($signed(wire9)));
            end
          if ($signed(reg73[(4'h9):(3'h4)]))
            begin
              reg79 <= (^reg77);
              reg80 <= ($signed($unsigned((~&reg77))) ?
                  $signed($signed((~^(reg8 ? (8'h9c) : wire4)))) : (reg78 ?
                      (+{wire3[(4'hb):(4'hb)],
                          (~&wire0)}) : (wire9[(3'h5):(2'h2)] | ($signed(reg78) << wire2[(4'h8):(2'h2)]))));
              reg81 <= $signed(((($signed(reg79) ?
                          (reg80 ? wire1 : wire4) : $signed((8'ha8))) ?
                      $signed((wire0 << reg76)) : $signed($unsigned((8'ha1)))) ?
                  (~^(+(~|wire9))) : $signed(((8'hbe) <<< {wire5, reg80}))));
              reg82 <= wire6[(3'h7):(2'h2)];
              reg83 <= (($signed($signed(((8'h9f) - wire70))) <= (-$signed((!reg81)))) ?
                  (~^reg79[(2'h3):(1'h0)]) : (($signed($unsigned(reg78)) || $unsigned((~&wire72))) ?
                      {(~&(8'hac))} : $signed(($unsigned(reg77) >> wire4[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg79 <= (-($signed((~$signed(wire70))) == ($unsigned($unsigned(reg83)) ?
                  ((reg80 ? reg74 : wire72) ?
                      (|wire3) : $unsigned(wire9)) : (8'h9e))));
            end
          reg84 <= ((+reg8) ?
              $signed(reg8[(5'h12):(3'h7)]) : ((~&reg80) ?
                  (&(|reg82[(3'h5):(3'h4)])) : reg7[(3'h7):(2'h3)]));
        end
      else
        begin
          reg75 <= (7'h43);
        end
      reg85 <= (~|wire70);
    end
  always
    @(posedge clk) begin
      reg86 <= ((8'hb4) ? reg79 : wire2[(2'h2):(1'h0)]);
    end
endmodule

module module10
#(parameter param68 = (&(((~^(-(8'hbd))) << (((8'ha3) ? (8'ha1) : (8'hb9)) | ((8'hbf) || (8'ha3)))) ? ({(~(8'hbb)), ((8'hb9) != (8'haf))} >= {{(8'ha7)}}) : ((((7'h41) ? (8'h9f) : (8'ha0)) ? {(8'hbf)} : (~^(8'ha2))) >>> (((7'h42) && (8'hbb)) ? (~&(8'hbd)) : {(8'hac), (8'ha4)})))), 
parameter param69 = param68)
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h252):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire51,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 reg40,
                 reg39,
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
                 reg21,
                 (1'h0)};
  assign wire16 = (((wire15[(1'h0):(1'h0)] >>> wire15[(3'h6):(3'h6)]) ?
                          ((~^(|wire11)) < wire11) : wire15) ?
                      wire12[(3'h5):(3'h4)] : (wire12 ?
                          ($signed((&wire13)) ?
                              wire12 : ((wire15 >>> (8'hbc)) == $signed(wire14))) : {wire13}));
  assign wire17 = ({$signed(wire13[(2'h2):(1'h0)])} ?
                      $signed($signed((+$unsigned(wire15)))) : (wire16 ?
                          $signed(wire12) : $unsigned($unsigned((wire16 ?
                              wire15 : wire13)))));
  assign wire18 = (!wire13[(1'h0):(1'h0)]);
  assign wire19 = (+$signed((+wire15)));
  assign wire20 = wire15[(5'h10):(4'hb)];
  always
    @(posedge clk) begin
      reg21 <= (wire15 ^~ wire12);
    end
  always
    @(posedge clk) begin
      reg22 <= {$signed(wire16[(2'h2):(1'h0)]),
          (|{(+(reg21 ? (8'haf) : wire14))})};
      reg23 <= $unsigned(reg22);
      if ((($unsigned(reg22) >= wire17) || $signed(wire17)))
        begin
          if ((((!{(|(8'haf)), reg21}) ? wire11 : (~|(8'hb8))) ?
              (~|wire18[(1'h1):(1'h0)]) : $signed($unsigned((wire18[(2'h3):(2'h3)] >>> (^~wire13))))))
            begin
              reg24 <= (~&wire17[(5'h10):(3'h7)]);
              reg25 <= (|(^~(~^((~wire14) ?
                  $signed(wire14) : (wire17 ^~ reg24)))));
            end
          else
            begin
              reg24 <= reg22;
              reg25 <= wire12[(4'hf):(4'he)];
              reg26 <= $signed((+reg23[(1'h1):(1'h1)]));
            end
          reg27 <= $unsigned(wire12);
          reg28 <= ($unsigned(reg26) < (reg25 ?
              {$signed((wire11 * wire13)),
                  wire12[(2'h2):(2'h2)]} : (wire18[(2'h3):(2'h2)] ?
                  wire15[(3'h6):(1'h1)] : (wire11[(4'hc):(3'h5)] ?
                      reg26[(3'h6):(2'h3)] : reg21[(5'h15):(4'h8)]))));
          if ($unsigned((^$unsigned($signed($unsigned(wire20))))))
            begin
              reg29 <= {reg28};
              reg30 <= $unsigned($unsigned(((|(~&reg28)) ?
                  (^$unsigned(reg29)) : reg25[(4'hc):(3'h5)])));
              reg31 <= $unsigned(($unsigned($signed((-reg24))) ?
                  (reg21 ?
                      wire18 : ((wire13 >= (8'hb1)) >>> (^reg29))) : $unsigned($unsigned(reg23[(2'h3):(2'h3)]))));
              reg32 <= wire19;
            end
          else
            begin
              reg29 <= ($signed(wire20[(3'h6):(3'h6)]) >= $unsigned($signed($unsigned($signed((7'h41))))));
              reg30 <= (+($signed($unsigned({reg26, wire17})) & wire14));
              reg31 <= (reg26 <= (-((-wire11) ?
                  (-(reg31 ? reg28 : reg23)) : $unsigned($unsigned((7'h41))))));
              reg32 <= {reg24, reg30[(2'h2):(1'h1)]};
              reg33 <= reg25;
            end
        end
      else
        begin
          reg24 <= reg29;
        end
      reg34 <= $unsigned($signed((|$unsigned(reg30[(2'h2):(1'h0)]))));
      if ((8'ha0))
        begin
          reg35 <= ($signed($unsigned($unsigned((reg32 ?
              reg25 : reg30)))) + wire18[(1'h0):(1'h0)]);
          reg36 <= $signed(((wire16[(2'h3):(2'h3)] * (8'haa)) ?
              $unsigned((+reg21[(4'hb):(4'h8)])) : (^~wire15)));
          if (((~^$signed(((wire16 ?
              wire12 : (8'ha6)) << (-reg28)))) ^~ $signed((reg22 >= $signed({reg30})))))
            begin
              reg37 <= ($signed(((wire20 || ((8'hae) != reg30)) * $unsigned(reg26[(1'h0):(1'h0)]))) ?
                  $unsigned({{(reg30 ^~ reg32),
                          (-(8'hbb))}}) : ($unsigned(((wire11 ?
                              reg25 : (8'hbe)) ?
                          (reg34 ? reg35 : wire16) : reg29)) ?
                      reg22 : $unsigned((((8'ha9) ?
                          reg25 : wire14) == (~&reg24)))));
              reg38 <= (&((^~(^~$signed(wire11))) ?
                  (|((reg35 ?
                      reg22 : (8'hb9)) >>> $unsigned(reg21))) : $signed((+$unsigned(reg35)))));
              reg39 <= reg24[(5'h12):(3'h7)];
            end
          else
            begin
              reg37 <= (~|(($unsigned((~|reg30)) ?
                      $signed($signed(reg37)) : ($unsigned(reg21) >= {reg36})) ?
                  (&wire11[(4'ha):(4'ha)]) : (+(|$signed(wire12)))));
              reg38 <= $unsigned({reg27,
                  ($signed((reg37 && wire14)) ? wire12 : reg27)});
            end
          reg40 <= $unsigned(($signed(wire12[(5'h12):(1'h1)]) != (~&{(~&reg23)})));
          reg41 <= wire12;
        end
      else
        begin
          reg35 <= $signed(($unsigned(((reg38 ~^ reg33) > wire16)) ?
              $signed(reg30) : (~|$signed($signed(reg26)))));
          if ($unsigned(($signed(($signed(reg33) ?
              $unsigned(reg40) : {reg21})) + ((8'hb3) ~^ wire14[(3'h4):(3'h4)]))))
            begin
              reg36 <= ($signed(reg37[(3'h6):(3'h6)]) ?
                  wire16 : ((7'h40) ?
                      ($signed((reg36 != reg31)) ?
                          reg31[(2'h2):(1'h0)] : ($unsigned(reg28) ?
                              (reg22 ?
                                  reg29 : reg29) : wire12)) : wire18[(1'h0):(1'h0)]));
              reg37 <= (-($unsigned(((8'hb7) >= (reg36 ? reg33 : reg31))) ?
                  wire20 : $unsigned(wire13)));
            end
          else
            begin
              reg36 <= reg31;
            end
          reg38 <= (^~reg40);
        end
    end
  always
    @(posedge clk) begin
      if ((({(|(reg21 ? reg41 : reg41)),
              ($signed(wire12) || wire11[(2'h2):(1'h0)])} ?
          (~(+$unsigned((8'haa)))) : reg22) < $signed((reg25[(4'hb):(3'h4)] & reg22))))
        begin
          reg42 <= reg40[(1'h0):(1'h0)];
          reg43 <= ($signed((($unsigned(reg25) != $unsigned(wire12)) == $unsigned((!reg35)))) ?
              ($unsigned((wire14 >> (reg38 ?
                  wire15 : (8'ha5)))) ^ ((wire20 * (reg36 ?
                  reg33 : (8'hbc))) || (!(reg25 >= wire15)))) : (8'hb3));
          if (reg39)
            begin
              reg44 <= {$signed(wire11[(1'h0):(1'h0)])};
              reg45 <= (&$signed((^~reg35[(2'h2):(2'h2)])));
              reg46 <= ($signed((~^reg33)) ?
                  (reg22 - ($unsigned(reg36[(2'h3):(1'h0)]) ?
                      (((8'hbd) < (8'had)) ?
                          $signed(wire11) : $signed((7'h44))) : $signed($unsigned(reg42)))) : wire15[(4'hf):(4'hd)]);
              reg47 <= ({$unsigned($signed((reg46 ? wire14 : wire18)))} ?
                  wire14[(3'h4):(3'h4)] : ((+$signed((|wire17))) - wire14));
            end
          else
            begin
              reg44 <= ((reg28 ?
                      (((reg35 ? reg45 : reg31) ?
                          reg29 : $unsigned(reg38)) || (8'hbc)) : reg25[(2'h3):(2'h2)]) ?
                  wire20[(3'h4):(2'h3)] : (~wire15[(2'h3):(1'h0)]));
              reg45 <= $signed($signed((+$unsigned((reg27 >= reg31)))));
              reg46 <= (8'hab);
              reg47 <= ($unsigned((|wire12[(4'ha):(3'h6)])) ?
                  ((~{(reg31 ?
                          reg41 : wire12)}) && (|reg28[(2'h2):(2'h2)])) : $unsigned(reg30));
            end
        end
      else
        begin
          reg42 <= $unsigned((~((~&$unsigned((8'hb6))) + (^(reg44 ?
              wire19 : (8'hbd))))));
          reg43 <= ((^((8'h9c) ? (+{wire20}) : reg32[(2'h2):(2'h2)])) ?
              wire20 : $unsigned(reg39));
          reg44 <= reg45[(2'h3):(1'h0)];
          if ($signed((reg38 * reg22)))
            begin
              reg45 <= $unsigned($signed($signed(wire19[(1'h0):(1'h0)])));
              reg46 <= (~&$unsigned(((wire15[(2'h2):(1'h1)] >= reg45[(3'h4):(1'h0)]) ?
                  $signed((reg45 ? reg27 : reg41)) : reg46[(1'h0):(1'h0)])));
              reg47 <= ($unsigned((~^(|(reg33 ^~ reg47)))) ?
                  (reg30[(1'h0):(1'h0)] ?
                      reg23[(1'h0):(1'h0)] : reg23[(2'h3):(2'h2)]) : ((-wire12[(2'h2):(1'h0)]) | ((^~(|(8'haf))) * reg32)));
              reg48 <= {((((reg28 && (8'hb9)) && (wire15 < reg47)) ^~ ((|reg31) << (!wire16))) ?
                      {$signed((~^wire12))} : ((reg37[(1'h1):(1'h0)] ?
                              reg23 : (!reg38)) ?
                          reg30[(1'h0):(1'h0)] : ((&wire20) ?
                              $signed(reg37) : (+reg37)))),
                  $unsigned((~((reg25 ? wire18 : reg47) && (7'h41))))};
              reg49 <= reg28;
            end
          else
            begin
              reg45 <= (reg34[(3'h7):(3'h6)] >>> $signed(wire20[(2'h3):(2'h2)]));
              reg46 <= $unsigned($signed(((~$unsigned(reg27)) ?
                  reg35 : $signed(reg38))));
            end
        end
      reg50 <= ($unsigned((reg33 ?
          reg23 : $signed((wire19 ^~ (8'had))))) >= reg30);
    end
  assign wire51 = {(~^wire18)};
  always
    @(posedge clk) begin
      reg52 <= reg40;
      reg53 <= $signed((~|(8'h9e)));
      if ((wire15 ?
          ((~$signed((wire17 << reg53))) != ($unsigned(reg45[(2'h3):(1'h0)]) ?
              (^(reg46 | (8'hb3))) : (~$unsigned(reg32)))) : $unsigned(reg42)))
        begin
          reg54 <= $unsigned(($signed(((reg38 ? reg49 : reg37) ?
              $unsigned(reg33) : (reg28 ?
                  (8'haf) : reg37))) + $unsigned((reg39 && (wire51 ?
              reg52 : reg53)))));
        end
      else
        begin
          reg54 <= reg31[(1'h0):(1'h0)];
          if (reg46)
            begin
              reg55 <= ({$unsigned((-$unsigned(wire15))),
                  reg21} - $unsigned($unsigned(wire14[(4'h8):(2'h3)])));
              reg56 <= $signed(reg36);
              reg57 <= ($unsigned((8'hb8)) ? wire19[(4'h8):(3'h5)] : wire17);
              reg58 <= (reg27[(1'h1):(1'h0)] > wire15);
            end
          else
            begin
              reg55 <= (8'hae);
              reg56 <= $unsigned({$signed(({(8'h9e),
                      reg32} != wire51[(1'h0):(1'h0)]))});
              reg57 <= (!(({$signed((8'hae)), (~&reg49)} ?
                  wire17 : wire13[(2'h3):(1'h1)]) - ((+(~^wire13)) * $unsigned(reg32))));
              reg58 <= {$unsigned((8'hba))};
              reg59 <= (reg22 - reg30[(2'h2):(2'h2)]);
            end
          reg60 <= $signed($unsigned(wire51));
          reg61 <= (reg43[(3'h4):(1'h1)] != ((^~(!$unsigned(wire17))) | $signed($signed((reg21 ?
              reg33 : wire18)))));
        end
    end
  assign wire62 = ((|reg23) ?
                      {$unsigned($signed((~^(8'hab)))),
                          $signed(($unsigned(reg57) ?
                              {reg54} : reg35[(1'h0):(1'h0)]))} : ((|({(8'hb8),
                          wire18} ^ $unsigned(reg57))) >= $signed(reg48)));
  assign wire63 = ($signed({reg30[(2'h2):(1'h1)]}) ?
                      $signed((&reg37[(2'h3):(1'h1)])) : $unsigned(reg57));
  assign wire64 = reg32[(2'h3):(1'h0)];
  assign wire65 = reg39;
  assign wire66 = (7'h43);
  assign wire67 = ((|reg55[(4'hc):(2'h2)]) < ($signed($signed(reg61)) ?
                      ({(~&reg52), $unsigned(reg36)} ?
                          $signed((8'ha6)) : ({reg30} ?
                              (wire19 ^ wire14) : (^~reg34))) : (({reg52} ?
                          $signed(reg52) : {reg42}) << (~(reg38 ?
                          wire65 : reg48)))));
endmodule
