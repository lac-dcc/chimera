module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  assign y = {wire77, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (8'hb7);
  assign wire6 = ($signed(((wire1[(1'h0):(1'h0)] ^ wire0[(4'h8):(3'h7)]) ?
                         (&(wire3 ? wire1 : wire2)) : wire3)) ?
                     ($unsigned((&(^~wire3))) ?
                         (+(8'h9c)) : (wire5[(3'h6):(1'h1)] ?
                             wire2[(3'h4):(2'h3)] : ((wire1 ? wire0 : wire5) ?
                                 $unsigned((8'hab)) : wire2))) : {((^(+(8'hbb))) <<< (wire0[(1'h0):(1'h0)] + $signed(wire2)))});
  assign wire7 = $signed({($unsigned((wire6 ?
                         wire4 : wire6)) * (^$signed(wire2)))});
  assign wire8 = ($unsigned(($signed(wire2[(5'h15):(5'h13)]) ^~ $signed($unsigned((7'h42))))) ?
                     {((-wire6[(4'h9):(2'h3)]) ?
                             wire2[(4'h9):(2'h2)] : wire6[(4'h9):(4'h8)]),
                         ($unsigned((~&(8'ha6))) ?
                             (~$unsigned(wire3)) : wire0[(1'h1):(1'h0)])} : (wire5 ?
                         wire3[(3'h4):(3'h4)] : ($unsigned($unsigned((8'hb2))) ?
                             wire6[(4'ha):(1'h1)] : ({wire2, wire0} ?
                                 wire1 : (wire4 <= wire3)))));
  assign wire9 = ($unsigned((|wire1)) ? (~&wire5) : wire5);
  module10 #() modinst78 (wire77, clk, wire5, wire8, wire9, wire7);
endmodule

module module10
#(parameter param76 = ({(^(&((8'hb7) & (8'ha8)))), {{(~^(8'hb3)), ((8'ha6) ? (8'hb0) : (8'hbe))}}} ? (({(~(8'hb3)), ((8'hb8) ? (8'hb6) : (8'ha2))} ? {(~^(7'h42)), (8'ha0)} : ((8'hb2) & ((8'ha1) || (8'ha1)))) && {((~&(7'h42)) > ((7'h41) != (8'h9f))), (((8'ha8) || (8'ha8)) < (~^(8'hbe)))}) : (!((^((8'ha0) > (8'hae))) <= {((8'hab) ? (8'haf) : (8'haa)), {(8'ha3), (8'h9f)}}))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h271):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire44,
                 wire29,
                 wire28,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg67,
                 reg66,
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
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire15 = (8'hbb);
  assign wire16 = ((wire12[(3'h5):(3'h4)] ?
                      $unsigned($signed((wire13 ^~ wire13))) : ((^{wire13,
                          wire12}) >= wire14)) >>> $signed(wire13));
  assign wire17 = $unsigned($unsigned((~&($unsigned(wire13) ?
                      wire16 : $signed(wire12)))));
  assign wire18 = ({$signed({wire15, (wire11 <= wire15)}),
                          $unsigned((~(wire16 <<< wire17)))} ?
                      wire11[(4'h9):(1'h1)] : wire15[(4'h9):(3'h6)]);
  assign wire19 = $signed($unsigned(({(~|(8'hbf)),
                      $unsigned(wire13)} <<< {(8'h9c), {wire17}})));
  assign wire20 = wire19;
  always
    @(posedge clk) begin
      reg21 <= $signed((8'ha1));
      reg22 <= wire11[(4'h8):(2'h2)];
      if (wire13)
        begin
          reg23 <= ((~|{(^(wire19 ? wire15 : wire13)),
              (|(-wire12))}) > {wire19});
          reg24 <= wire12;
          reg25 <= (reg22 ?
              $unsigned(wire17) : (wire20[(3'h5):(3'h5)] - ({$signed(wire15),
                      reg23[(4'h8):(4'h8)]} ?
                  $unsigned(wire12[(4'h8):(3'h6)]) : ((wire11 ?
                          wire16 : reg24) ?
                      (reg21 ~^ wire15) : (reg22 ? reg22 : wire11)))));
        end
      else
        begin
          reg23 <= (&$unsigned($unsigned(((^reg25) ?
              (wire17 != wire19) : (reg21 & wire20)))));
          reg24 <= $unsigned(($signed(wire15) && ((~&wire20) ?
              wire16 : (wire14[(2'h2):(1'h0)] || $signed(wire19)))));
        end
      reg26 <= (($unsigned($signed(wire11[(3'h6):(1'h1)])) << $unsigned($unsigned(reg22[(2'h2):(1'h0)]))) ^ {(8'ha4)});
      reg27 <= $unsigned((((reg25[(3'h5):(1'h1)] || (reg22 ? (8'ha8) : reg24)) ?
              reg21 : reg26[(4'ha):(1'h1)]) ?
          ($signed(wire18[(3'h4):(1'h0)]) ^~ wire12[(4'ha):(3'h7)]) : (($signed(wire15) ?
                  {wire16, reg23} : (wire12 ? wire20 : reg23)) ?
              $unsigned(reg26[(4'hc):(3'h6)]) : ((^reg24) ?
                  (^wire16) : wire20))));
    end
  assign wire28 = ((reg22[(1'h0):(1'h0)] ?
                      ({$signed(reg21)} ?
                          (reg25 & (wire20 <= (8'h9c))) : wire15) : $unsigned(wire17[(1'h1):(1'h1)])) ^~ (~^reg22[(3'h4):(1'h1)]));
  assign wire29 = $signed(wire14[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg30 <= ({wire18} ?
          $unsigned(($signed($unsigned(wire11)) <<< ((!reg26) >= wire12[(4'hf):(3'h7)]))) : wire29[(2'h3):(2'h2)]);
      reg31 <= $signed(((~&({(8'h9f), (8'hac)} & $signed(wire18))) ?
          wire18[(3'h7):(2'h2)] : $unsigned($unsigned($signed((8'hb1))))));
      if (wire19)
        begin
          reg32 <= wire13[(2'h3):(2'h3)];
          reg33 <= (($signed(wire28) ?
                  wire13[(1'h1):(1'h1)] : {$signed($unsigned(reg26))}) ?
              (~|$unsigned(wire20[(4'h9):(4'h9)])) : {(wire14[(1'h0):(1'h0)] <= wire16),
                  wire15[(4'ha):(3'h4)]});
          reg34 <= ((+(~$unsigned($unsigned(reg21)))) >>> ($signed($signed(reg22)) != ((reg23 ?
              wire28 : (~&wire15)) + $signed(wire18[(3'h6):(1'h1)]))));
          reg35 <= ((!$signed((~|(~^wire17)))) ?
              wire18[(3'h7):(1'h1)] : $unsigned($unsigned($unsigned((!wire11)))));
        end
      else
        begin
          reg32 <= $unsigned(({reg22[(4'hc):(4'hc)]} <<< $unsigned($unsigned((wire28 ?
              wire28 : wire13)))));
          reg33 <= ((8'ha5) && reg27);
          if ((-((!wire19[(2'h2):(1'h1)]) * (!(wire17[(1'h0):(1'h0)] ?
              $signed(reg23) : reg34[(4'h8):(3'h5)])))))
            begin
              reg34 <= ({(^~wire16)} ?
                  $signed((wire18 <<< wire18[(1'h0):(1'h0)])) : reg27[(1'h1):(1'h1)]);
              reg35 <= (^~$signed((((reg25 <= (8'ha7)) ?
                  $signed(wire12) : (7'h40)) << $unsigned($signed(wire11)))));
              reg36 <= (wire14 >> wire29);
            end
          else
            begin
              reg34 <= {reg30[(3'h5):(3'h4)]};
              reg35 <= ((^~(wire12 ? (~|reg31) : $unsigned((+wire16)))) ?
                  {{wire12},
                      ($unsigned((~|reg36)) & (wire14[(2'h3):(2'h2)] ?
                          (wire11 ?
                              reg27 : reg35) : (+reg21)))} : $unsigned(($signed((wire13 > wire11)) + reg27[(2'h2):(1'h1)])));
              reg36 <= (wire19 ?
                  (~&$unsigned(((!reg35) * wire14))) : wire18[(3'h4):(2'h3)]);
              reg37 <= (({($signed(wire17) ?
                              (reg30 ^ reg33) : (reg26 ? reg26 : (7'h43)))} ?
                      reg32[(3'h5):(3'h5)] : {$signed($signed(wire13)),
                          (!(reg25 << wire18))}) ?
                  wire17[(3'h4):(1'h1)] : $signed(reg25[(3'h4):(3'h4)]));
              reg38 <= ({$signed(((wire14 > (7'h41)) ^ $signed((8'hb5))))} ?
                  {reg32[(3'h7):(3'h7)]} : $unsigned(reg31));
            end
        end
      if (reg33[(4'h9):(3'h6)])
        begin
          if ($unsigned($signed($signed(((wire20 < wire18) ^ (!reg24))))))
            begin
              reg39 <= {$signed((|$unsigned((~^reg34)))),
                  wire20[(2'h3):(1'h0)]};
              reg40 <= reg21[(4'h9):(3'h7)];
              reg41 <= ($signed(wire17) << $signed({wire11,
                  (reg38 ? $signed(reg21) : $unsigned(wire15))}));
              reg42 <= ((wire28[(4'h9):(1'h1)] ?
                  $unsigned(($signed(wire28) | wire12)) : reg21[(4'hf):(2'h3)]) > (7'h42));
            end
          else
            begin
              reg39 <= (((8'h9c) ?
                      {((&wire11) | wire12)} : $signed((~|$unsigned(reg22)))) ?
                  (wire14 <<< $unsigned(wire12)) : $signed((($signed(reg21) * $unsigned(reg21)) ?
                      (~reg27) : {reg22[(1'h0):(1'h0)]})));
              reg40 <= (~|(8'hb2));
              reg41 <= (wire15 * reg35[(4'ha):(3'h4)]);
            end
          reg43 <= $unsigned(((($signed(wire20) >>> $signed(reg41)) ?
                  {(~&wire18)} : $unsigned(wire29)) ?
              wire12 : (+($signed(wire29) ?
                  (wire20 ? wire16 : reg31) : $unsigned(reg38)))));
        end
      else
        begin
          if ((~&(wire11 ?
              (reg25[(1'h1):(1'h1)] ?
                  reg25 : $unsigned($unsigned(wire11))) : {(&$unsigned(reg27)),
                  reg31[(4'h9):(3'h4)]})))
            begin
              reg39 <= {(|($signed((8'h9e)) ?
                      ($unsigned(reg35) ?
                          $signed(reg22) : $signed(reg23)) : $unsigned((reg30 ?
                          wire29 : reg25))))};
              reg40 <= reg21[(2'h2):(1'h1)];
              reg41 <= (^(+(^(~(|reg37)))));
              reg42 <= $signed((wire28[(4'ha):(1'h0)] && (!(~{reg34,
                  wire20}))));
              reg43 <= (((8'hac) | $signed(((wire19 ? wire29 : (8'haa)) ?
                  (reg33 ?
                      (8'had) : reg25) : (wire15 + reg39)))) - $signed((^((+reg37) ?
                  (wire17 ? reg43 : reg36) : $unsigned(wire13)))));
            end
          else
            begin
              reg39 <= ((reg24[(3'h7):(3'h6)] ?
                      ({reg31[(3'h6):(1'h0)],
                          $signed(reg36)} > $unsigned((wire17 & reg38))) : $unsigned(((reg32 ?
                              reg36 : reg23) ?
                          (wire17 ? reg22 : reg42) : reg22))) ?
                  (|reg42) : (-(~|(-$signed(reg24)))));
              reg40 <= $signed($signed($unsigned({{reg21, reg36}})));
              reg41 <= ((~^reg23[(3'h7):(3'h4)]) - wire13[(5'h11):(3'h4)]);
            end
        end
    end
  assign wire44 = $unsigned((|$unsigned((~|$signed(reg43)))));
  always
    @(posedge clk) begin
      if ((($unsigned($signed((!(8'hbe)))) ?
          reg30[(4'ha):(3'h6)] : $unsigned(reg23[(2'h3):(2'h3)])) * wire29[(3'h7):(2'h2)]))
        begin
          if ($unsigned({(wire16[(4'h8):(1'h1)] <= reg26)}))
            begin
              reg45 <= ({$signed($unsigned(wire12[(1'h0):(1'h0)]))} << (~^((8'haf) ?
                  $unsigned(wire17) : ($unsigned(reg26) | $unsigned(reg25)))));
              reg46 <= $signed($signed(wire15[(4'h9):(4'h9)]));
              reg47 <= $signed({$signed($signed($unsigned(reg45)))});
              reg48 <= (($signed(reg38[(4'ha):(2'h3)]) ?
                      (^((&wire44) >= (~|(8'ha3)))) : $signed($unsigned((wire11 >= reg23)))) ?
                  wire44 : wire13);
            end
          else
            begin
              reg45 <= reg35[(1'h0):(1'h0)];
              reg46 <= (reg35 ?
                  ($unsigned($unsigned($unsigned(wire13))) > ($unsigned((reg31 ?
                          (8'ha7) : (8'hba))) ?
                      $signed($signed(reg25)) : (+wire28[(3'h4):(2'h2)]))) : (|$signed(((~&(8'hbc)) ?
                      reg36[(4'hd):(3'h7)] : (8'hab)))));
              reg47 <= (!(^({reg42[(3'h4):(3'h4)]} ~^ ($signed(wire17) ?
                  wire13 : $signed(reg31)))));
              reg48 <= wire29[(2'h2):(2'h2)];
              reg49 <= reg38;
            end
          reg50 <= reg34;
        end
      else
        begin
          reg45 <= $signed(($unsigned((-$unsigned(reg34))) ^ (wire12 < (reg38[(1'h0):(1'h0)] ?
              (^~wire28) : wire12))));
        end
    end
  always
    @(posedge clk) begin
      reg51 <= (~&$unsigned(($unsigned(reg31) ?
          reg40[(4'h9):(4'h8)] : $unsigned(reg21[(4'hd):(4'hc)]))));
      reg52 <= wire20;
      if (($unsigned($signed(wire20[(1'h0):(1'h0)])) + reg47[(1'h0):(1'h0)]))
        begin
          reg53 <= ((wire44 ?
              {(~|$signed(wire29))} : wire14) | wire29[(4'h9):(2'h2)]);
          if (reg33)
            begin
              reg54 <= (-$unsigned($unsigned($unsigned($unsigned(wire18)))));
              reg55 <= wire18[(3'h6):(1'h0)];
              reg56 <= reg33[(3'h4):(1'h1)];
              reg57 <= $unsigned((($unsigned((wire14 << wire13)) <= $signed($signed(reg52))) ^ $unsigned(wire14[(4'ha):(3'h4)])));
              reg58 <= reg39[(1'h0):(1'h0)];
            end
          else
            begin
              reg54 <= ({(^(8'ha3))} ~^ reg32);
              reg55 <= $unsigned((-{(reg40 <<< reg34), reg32[(4'ha):(3'h4)]}));
              reg56 <= reg58[(3'h4):(1'h1)];
              reg57 <= {reg21[(4'he):(1'h0)]};
              reg58 <= ((|(~$signed($signed(reg32)))) * (reg40 ?
                  $unsigned(reg52[(2'h2):(1'h1)]) : wire18));
            end
          reg59 <= reg58[(4'hb):(1'h0)];
        end
      else
        begin
          reg53 <= {((~|((wire13 || reg21) ? {reg25} : wire13[(1'h0):(1'h0)])) ?
                  reg55 : wire18[(2'h2):(1'h0)]),
              wire16};
          if ({$unsigned(reg56[(1'h0):(1'h0)]), reg24[(3'h5):(3'h5)]})
            begin
              reg54 <= ($signed($unsigned((&wire28))) ?
                  $unsigned(wire20[(2'h3):(2'h2)]) : (($signed((^~reg57)) | reg51[(1'h0):(1'h0)]) & $unsigned($signed(reg30))));
              reg55 <= (~|$unsigned($signed((~(wire19 == wire16)))));
              reg56 <= wire16;
              reg57 <= ((-wire44[(1'h0):(1'h0)]) < (-reg31));
              reg58 <= reg38[(4'h9):(3'h6)];
            end
          else
            begin
              reg54 <= reg30;
              reg55 <= $unsigned($signed(reg31));
              reg56 <= {$unsigned(($signed((8'hb5)) ? reg49 : (8'haf)))};
            end
          if (((-reg53[(2'h2):(2'h2)]) ?
              $unsigned((((reg58 | wire13) ?
                  (reg53 == reg58) : $unsigned(wire28)) >= reg30)) : (7'h41)))
            begin
              reg59 <= ((~|(8'hb8)) != (((~&$unsigned(wire44)) ?
                      reg39[(3'h4):(2'h2)] : {$signed(wire20), (^wire18)}) ?
                  {reg35} : (-reg26)));
              reg60 <= $unsigned(reg21);
              reg61 <= (reg49[(4'h9):(3'h7)] ?
                  ($unsigned(($signed((8'ha0)) < (reg39 ?
                      wire18 : reg36))) ^~ $signed((~^$unsigned(reg31)))) : (((~&$unsigned(reg60)) ?
                      ($signed(reg45) ^~ $signed(reg32)) : ({wire18} << reg50[(2'h2):(2'h2)])) >= $unsigned((8'hbd))));
              reg62 <= $unsigned($unsigned({reg34[(1'h0):(1'h0)],
                  $signed(((8'ha8) >> reg57))}));
            end
          else
            begin
              reg59 <= (|$unsigned($unsigned((wire44 ?
                  $unsigned(reg26) : (wire17 ? reg26 : reg21)))));
              reg60 <= ($signed(((+wire44[(2'h2):(2'h2)]) ?
                  reg62 : reg51[(2'h2):(1'h0)])) | ($unsigned(($unsigned((8'hb4)) ?
                      {reg27, (8'h9c)} : {reg30, reg46})) ?
                  reg24[(2'h3):(2'h3)] : (|($signed(reg45) >= reg60[(2'h2):(1'h1)]))));
              reg61 <= $signed((~({(reg38 != (8'hb2)), {(8'haf)}} ?
                  $unsigned((|wire14)) : reg24[(4'ha):(1'h0)])));
              reg62 <= ((~^wire44) ?
                  $unsigned(reg32) : {$signed((^reg60)), reg45});
            end
          if ((^~($signed($unsigned($unsigned(reg42))) ?
              (~&wire29) : {$unsigned($signed(reg43)), ((+reg49) || reg37)})))
            begin
              reg63 <= wire28[(1'h0):(1'h0)];
              reg64 <= wire16[(4'ha):(1'h1)];
              reg65 <= $signed((reg64 ? $signed((8'h9c)) : (8'ha1)));
              reg66 <= reg61[(2'h2):(1'h0)];
              reg67 <= $unsigned((8'ha2));
            end
          else
            begin
              reg63 <= (!reg48[(3'h4):(2'h2)]);
              reg64 <= (&({$unsigned((~^reg57)), $unsigned($unsigned(reg47))} ?
                  $signed((!{wire12})) : ((reg33 ?
                      (reg47 ?
                          (7'h40) : wire20) : $unsigned(reg50)) & $unsigned((+reg31)))));
              reg65 <= wire19[(2'h3):(1'h0)];
              reg66 <= (($unsigned($unsigned($unsigned(wire28))) ?
                  ((|(wire19 ~^ reg57)) ^ (8'hae)) : (((reg30 ?
                          reg33 : reg65) >> (reg43 ? reg32 : reg22)) ?
                      (!(reg47 ?
                          reg54 : reg41)) : (~^reg59))) >>> (|reg36[(4'he):(4'he)]));
              reg67 <= $signed(reg52[(1'h1):(1'h1)]);
            end
        end
    end
  assign wire68 = $signed($unsigned($signed({$unsigned(wire29)})));
  assign wire69 = (^$signed($signed(reg48[(3'h7):(3'h7)])));
  assign wire70 = wire11;
  assign wire71 = (^reg22[(3'h5):(1'h1)]);
  assign wire72 = (reg67[(1'h0):(1'h0)] < reg64);
  assign wire73 = reg61;
  assign wire74 = (reg66 != $unsigned((reg59 * (&((7'h43) < (8'hac))))));
  assign wire75 = {(-(|(~(wire28 <<< wire71))))};
endmodule
