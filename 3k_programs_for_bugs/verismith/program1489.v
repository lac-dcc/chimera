module top
#(parameter param96 = (((~^((8'hb5) ^~ ((7'h41) + (8'h9c)))) || ((~|((8'ha7) ^~ (8'hb3))) | (&((7'h40) ? (8'ha0) : (8'ha0))))) ? (((8'h9f) - ((~|(8'ha9)) ? (~(8'hb3)) : ((8'h9d) ~^ (7'h40)))) && (~((~(8'ha2)) ? {(8'ha0)} : ((8'ha0) ? (8'ha8) : (8'hbd))))) : ((+(((8'hba) ? (8'hb5) : (8'hb6)) ? ((8'ha3) && (8'h9e)) : {(8'ha9), (8'hab)})) ? ({{(8'hb5), (8'ha4)}, ((8'haf) | (8'ha4))} ? (((8'ha6) <<< (8'hab)) > ((8'ha4) ? (8'ha5) : (7'h40))) : (((8'haa) & (8'haa)) ? ((7'h42) && (8'hb9)) : ((8'ha4) << (8'ha9)))) : (|({(7'h43), (7'h44)} ? ((8'ha9) & (8'haf)) : (+(8'hb4)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire95, wire94, wire93, wire91, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire1);
  assign wire5 = {$signed(wire2),
                     (~^((!{wire3}) ?
                         (-((8'hb9) ? wire2 : wire0)) : wire2[(4'h8):(2'h2)]))};
  module6 #() modinst92 (wire91, clk, wire5, wire2, wire0, wire1);
  assign wire93 = $unsigned(wire1[(3'h5):(3'h4)]);
  assign wire94 = (8'hb6);
  assign wire95 = (~{wire94[(2'h3):(2'h3)]});
endmodule

module module6
#(parameter param90 = (~|((({(8'hb4), (7'h41)} >>> ((8'hbb) ? (7'h43) : (8'ha2))) ? (((8'haa) << (8'hb8)) ? {(8'hb6)} : ((8'h9e) && (7'h43))) : ((&(8'hb9)) ? (^(8'hba)) : ((8'hbd) ? (8'h9c) : (8'ha5)))) ? {(((8'h9f) ? (8'ha1) : (8'h9e)) >> ((8'hbb) == (7'h41))), ((~|(8'hb7)) ? {(8'hb2)} : ((8'ha4) ? (8'haa) : (8'hbb)))} : (~({(8'ha5), (7'h40)} ? {(8'ha8), (7'h43)} : {(8'ha7), (7'h43)})))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  assign y = {wire89,
                 wire87,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg19,
                 (1'h0)};
  assign wire11 = (wire8[(4'h9):(2'h3)] == (~&((wire8[(2'h2):(1'h1)] <= (-wire7)) == wire7)));
  assign wire12 = (-$unsigned(($signed({wire7, wire7}) > (^~wire11))));
  assign wire13 = (~(~^wire7[(4'h9):(1'h0)]));
  assign wire14 = wire8;
  assign wire15 = wire13;
  assign wire16 = (^($signed(wire10) ?
                      wire15[(5'h12):(4'ha)] : {(wire13 ?
                              $signed(wire7) : (|wire10))}));
  assign wire17 = (~^wire13);
  assign wire18 = (wire8 ^ (~^$signed((wire14[(3'h7):(1'h1)] - $signed(wire16)))));
  always
    @(posedge clk) begin
      reg19 <= wire18[(2'h3):(2'h2)];
    end
  assign wire20 = $unsigned(wire15);
  assign wire21 = ((wire13 ?
                      (($unsigned(wire18) ?
                              (8'ha6) : (wire20 ? (8'h9e) : wire16)) ?
                          ((reg19 ?
                              wire20 : wire11) * $unsigned(wire11)) : {$signed((8'haa)),
                              (wire14 <<< (8'h9c))}) : wire7) > {reg19});
  assign wire22 = {wire7};
  assign wire23 = $signed((+wire18));
  assign wire24 = wire7[(4'h8):(2'h2)];
  assign wire25 = (reg19[(3'h7):(3'h5)] <= (-wire11[(3'h4):(2'h3)]));
  module26 #() modinst88 (wire87, clk, wire10, wire24, wire23, wire17);
  assign wire89 = ((wire8 | $unsigned($unsigned({wire12, wire15}))) ?
                      (reg19 ?
                          $signed(($unsigned(wire16) >>> (wire22 ?
                              wire22 : wire11))) : (8'ha4)) : wire12[(4'h8):(3'h7)]);
endmodule

module module26
#(parameter param85 = (((~|(-(~(8'ha6)))) ? (8'ha7) : ({{(8'hb3)}, (!(8'ha2))} ^~ ((8'hbb) ? {(8'hb8), (8'haa)} : ((8'hac) ~^ (8'hb7))))) > (((((8'had) > (8'hb9)) ~^ {(8'ha3)}) ? (((8'ha8) ? (8'hb6) : (8'ha2)) ? {(8'hb5), (8'hb0)} : ((8'hbf) != (8'ha6))) : ((~^(8'ha0)) <= {(8'hb6), (7'h43)})) ? ({(8'hba), {(8'ha4)}} && (((7'h40) ? (8'hbe) : (8'hb2)) ? (~&(8'had)) : ((7'h44) ? (8'ha6) : (8'haf)))) : ({(8'ha3)} ? ((8'hb9) ? ((8'ha4) ? (8'hb8) : (7'h40)) : ((8'ha4) ? (7'h40) : (8'hbf))) : (((8'ha8) >>> (8'ha0)) ? ((8'ha2) ^~ (8'hb5)) : {(8'haa)})))), 
parameter param86 = {(~^(((param85 | param85) ? (param85 & param85) : (param85 ? param85 : (8'ha2))) - ((param85 || (8'hbd)) * {param85, param85}))), ((~&((&param85) ? param85 : param85)) | (&((~^param85) ? (^param85) : (7'h44))))})
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h278):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(4'h9):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire70,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg69,
                 reg68,
                 reg67,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire31 = ($signed($unsigned((!{wire29}))) ?
                      wire30[(4'he):(1'h1)] : wire28);
  assign wire32 = (&$unsigned(($signed((wire29 ^~ wire30)) ?
                      ((wire29 ? wire30 : (8'hb0)) ?
                          $signed(wire27) : {wire28}) : (+wire27[(1'h1):(1'h1)]))));
  assign wire33 = ((-{(wire29 - wire28[(4'hb):(3'h4)]),
                      {$unsigned(wire29)}}) != wire32);
  assign wire34 = wire32;
  assign wire35 = ((wire28[(4'h9):(1'h0)] ?
                          {wire27[(3'h4):(1'h1)],
                              $signed((wire31 ?
                                  wire29 : wire34))} : ($unsigned(wire32[(4'ha):(2'h2)]) >>> wire34)) ?
                      $unsigned({($unsigned(wire27) ?
                              $unsigned(wire34) : wire34)}) : (wire31 ?
                          ({(wire30 <<< wire32),
                              (wire28 && wire32)} >> wire29) : (~wire27)));
  always
    @(posedge clk) begin
      if ($unsigned(wire27))
        begin
          reg36 <= wire31;
          if ((~|(|{$signed($signed((8'hb4))),
              $signed(wire32[(3'h5):(1'h0)])})))
            begin
              reg37 <= ($unsigned((wire29[(3'h5):(2'h2)] && $signed($unsigned(wire30)))) != ((wire31 ?
                      wire29[(3'h4):(3'h4)] : $signed($unsigned(wire28))) ?
                  $signed((((8'ha3) ~^ (8'hbc)) >>> {wire32,
                      wire34})) : (((!wire29) ? {reg36} : (wire29 != wire32)) ?
                      (wire34[(3'h4):(1'h1)] >>> {wire27,
                          (8'hba)}) : $signed($signed(reg36)))));
              reg38 <= $signed(((wire34[(2'h2):(2'h2)] ?
                      ($signed(reg36) ?
                          {wire33} : wire33) : (wire30[(4'h9):(2'h2)] - {wire32})) ?
                  wire34 : $unsigned({(wire30 ? (7'h44) : (8'ha5)),
                      $signed(wire33)})));
            end
          else
            begin
              reg37 <= reg37;
              reg38 <= (8'ha3);
              reg39 <= wire35[(3'h6):(1'h1)];
            end
          reg40 <= wire28[(4'h8):(2'h2)];
          reg41 <= {wire33, wire28};
          if ((reg38 ?
              (-wire35) : ((-$unsigned(wire29[(3'h4):(2'h2)])) ?
                  {$unsigned({reg41})} : $unsigned(wire29[(4'h8):(3'h6)]))))
            begin
              reg42 <= reg41;
              reg43 <= (({(~&(wire28 ? reg37 : reg36)), {(^~wire27)}} ?
                      {wire35[(2'h3):(1'h0)],
                          ($unsigned(reg36) ?
                              $signed(wire28) : ((8'hbc) ?
                                  reg41 : reg40))} : (($unsigned((7'h43)) * (reg36 ?
                              (8'hb9) : wire32)) ?
                          wire33 : wire28)) ?
                  ($signed(wire34) ? wire31 : wire27) : reg39[(4'ha):(4'h9)]);
              reg44 <= wire31[(2'h3):(1'h0)];
            end
          else
            begin
              reg42 <= ($unsigned(((+$unsigned(reg40)) >> $signed($unsigned(wire34)))) & wire29[(3'h7):(1'h1)]);
              reg43 <= $unsigned($signed($signed((!(7'h43)))));
              reg44 <= (($unsigned($unsigned((wire28 < reg44))) - $unsigned((wire28[(3'h6):(1'h0)] >>> {wire32}))) ^~ $signed((~&($signed(reg40) * $unsigned(reg44)))));
              reg45 <= reg40;
            end
        end
      else
        begin
          reg36 <= (($unsigned((~^reg45)) ?
              reg45[(5'h13):(4'he)] : ($signed((reg38 ? reg44 : (8'ha8))) ?
                  $signed((wire30 ?
                      (8'hb6) : wire30)) : $signed(wire28[(2'h2):(1'h1)]))) >> $unsigned({wire30,
              {(wire28 << wire32), reg43}}));
          reg37 <= $signed(reg44);
          reg38 <= reg44;
        end
      if (wire28[(3'h7):(3'h7)])
        begin
          reg46 <= ({(8'hb4),
              $signed((reg40[(2'h2):(1'h0)] ?
                  (~wire31) : (-reg45)))} * $unsigned(((^~{reg42, wire31}) ?
              (7'h44) : wire27)));
          reg47 <= (-(($unsigned(reg44[(2'h3):(2'h3)]) ?
              ($signed(reg45) ?
                  $unsigned(wire35) : (wire28 ?
                      wire35 : reg44)) : ($signed(reg44) | (8'h9c))) ^~ ($unsigned({wire35,
              reg45}) ^ ((&reg38) + (+wire34)))));
          if (reg43[(4'hc):(3'h4)])
            begin
              reg48 <= reg42;
              reg49 <= ((~$unsigned(reg38)) ?
                  ({$signed($signed(wire27)),
                          ((!reg43) ?
                              (reg45 ? reg44 : (8'hae)) : (wire32 ?
                                  (8'h9c) : reg40))} ?
                      (-(~(reg43 && reg39))) : ((-(8'hbf)) > (~|reg38))) : ((|wire28) << (!$unsigned(reg46))));
              reg50 <= $unsigned(((($signed(reg44) >> reg40) ?
                  (~|$unsigned(wire30)) : (&(^(7'h43)))) ~^ wire29));
              reg51 <= ($signed($signed(wire35)) ^~ (reg39 ?
                  {{(wire35 ^ reg37)}} : {(reg46 >= {reg47}),
                      $signed((8'hb9))}));
            end
          else
            begin
              reg48 <= reg50;
              reg49 <= wire32[(3'h7):(3'h4)];
              reg50 <= ((~|$signed(((wire32 < reg48) ?
                      $unsigned(wire31) : $signed(reg37)))) ?
                  reg38[(1'h1):(1'h0)] : ($unsigned(((reg38 ?
                          reg44 : wire32) != $unsigned(wire32))) ?
                      $signed($signed(reg40[(3'h4):(1'h1)])) : $signed(reg48)));
            end
          reg52 <= (reg37 ?
              reg38[(3'h6):(1'h0)] : (({(wire34 ? (8'ha2) : wire29)} ?
                  $unsigned({reg44,
                      reg39}) : $signed($signed(wire33))) && $signed(reg43)));
        end
      else
        begin
          reg46 <= wire34;
          reg47 <= $signed($signed((&(reg36 ?
              (reg51 ? wire27 : wire31) : reg43[(1'h0):(1'h0)]))));
          if ({{(wire27 ?
                      {(^~wire34)} : (wire29[(1'h0):(1'h0)] <= (reg40 ?
                          wire28 : reg50))),
                  (^$signed(wire28))}})
            begin
              reg48 <= ($signed((reg51[(4'he):(4'hc)] >>> ((reg46 << wire35) << (~|reg39)))) * reg44[(3'h6):(3'h5)]);
              reg49 <= (~($signed((~^reg48[(4'he):(3'h4)])) >> (8'hab)));
              reg50 <= (((reg38[(1'h0):(1'h0)] ?
                      ($unsigned(reg38) ?
                          wire28[(3'h6):(1'h1)] : reg38) : (&$signed(wire28))) ?
                  $unsigned(((~(8'hbe)) ?
                      (&reg38) : (-reg49))) : $unsigned($unsigned(reg39[(4'h9):(1'h1)]))) <= reg48);
              reg51 <= $signed(reg38);
              reg52 <= ($unsigned((~$signed((wire28 ?
                  wire30 : wire31)))) <<< wire35);
            end
          else
            begin
              reg48 <= ($unsigned({reg52[(2'h3):(1'h0)],
                  ($unsigned(reg46) ?
                      (reg38 ^ reg38) : wire29)}) >>> $unsigned($signed($unsigned(reg47[(4'ha):(3'h4)]))));
              reg49 <= $unsigned(wire29[(1'h1):(1'h1)]);
              reg50 <= (+(|reg46));
              reg51 <= $unsigned(wire29);
            end
          reg53 <= (~|((8'hba) && (wire33[(1'h1):(1'h0)] ?
              wire34 : ((reg49 + reg37) ? (&wire30) : (^~reg44)))));
        end
      reg54 <= (&(reg39[(3'h6):(3'h5)] ?
          $signed(((reg38 ? (8'hae) : (8'h9e)) ?
              {wire30} : (&wire29))) : reg49[(3'h4):(1'h0)]));
      reg55 <= ($signed(reg45[(3'h6):(2'h2)]) ?
          (^reg45) : ($unsigned((((8'hbc) ? reg47 : reg52) ?
              wire32 : {reg38})) <<< $unsigned((&reg54[(2'h3):(2'h2)]))));
      if (reg38[(1'h0):(1'h0)])
        begin
          if (reg51)
            begin
              reg56 <= $unsigned($signed($unsigned(reg43[(3'h4):(2'h3)])));
              reg57 <= (+($signed(reg56) > (~reg56)));
            end
          else
            begin
              reg56 <= (reg48 * ({(~((8'haa) >= reg52))} ~^ (^($unsigned(reg38) ?
                  $unsigned(reg37) : (8'ha5)))));
              reg57 <= reg53[(1'h1):(1'h1)];
              reg58 <= wire34[(1'h1):(1'h1)];
              reg59 <= (8'hb7);
              reg60 <= $unsigned(reg36);
            end
          reg61 <= (($unsigned({(-reg58), (~|reg46)}) ~^ reg53[(1'h0):(1'h0)]) ?
              $signed(reg53[(1'h1):(1'h0)]) : $unsigned({wire27[(1'h1):(1'h1)],
                  (~^reg53)}));
        end
      else
        begin
          reg56 <= reg57[(2'h3):(2'h3)];
          reg57 <= (8'h9d);
          reg58 <= $signed((~|(reg58[(3'h6):(3'h6)] >>> (8'hb7))));
          if (wire33)
            begin
              reg59 <= (~|$signed((((~&reg48) && (8'hb9)) ?
                  reg55[(2'h2):(2'h2)] : reg49)));
            end
          else
            begin
              reg59 <= $unsigned(reg50);
              reg60 <= wire30[(5'h10):(4'hb)];
              reg61 <= $unsigned({$unsigned((reg40 ?
                      (reg45 ? (8'h9d) : wire34) : $unsigned(reg57)))});
              reg62 <= $unsigned($signed($unsigned($signed($signed(reg48)))));
            end
        end
    end
  assign wire63 = $unsigned(($unsigned((^$unsigned(wire29))) ?
                      reg53 : $unsigned((~|{reg54}))));
  assign wire64 = {$signed(reg39)};
  assign wire65 = (~&(reg38[(3'h4):(1'h1)] < wire29));
  assign wire66 = (|(wire27 == reg56));
  always
    @(posedge clk) begin
      reg67 <= $signed(wire63[(4'hc):(4'h8)]);
      reg68 <= (^~(|{$signed({reg62}), $signed({reg45})}));
      reg69 <= reg53;
    end
  assign wire70 = $unsigned((((-(reg37 != wire28)) ?
                      (-(^wire35)) : reg68[(4'ha):(2'h3)]) <<< (($signed(reg39) * (reg41 && wire35)) ?
                      reg59 : (!wire32[(4'he):(1'h0)]))));
  always
    @(posedge clk) begin
      reg71 <= {$signed({(~$unsigned(reg55))})};
      reg72 <= {$signed((~({reg57, reg60} || $unsigned(reg46)))), reg69};
      reg73 <= $signed((-$unsigned(reg37)));
      reg74 <= $unsigned(((|reg59[(1'h1):(1'h1)]) ?
          {$unsigned((wire30 ^ (8'haf)))} : (!reg71)));
    end
  assign wire75 = (reg56 ?
                      (reg71 <<< ((-(&reg57)) >= ((wire27 + wire33) ?
                          reg49 : (reg61 ^~ reg57)))) : $signed(reg57[(2'h2):(2'h2)]));
  assign wire76 = $unsigned(wire28[(4'h9):(2'h3)]);
  assign wire77 = ($signed((8'ha4)) >>> ($signed($signed(((7'h41) != reg42))) ?
                      (8'hb6) : $unsigned((!(~reg36)))));
  assign wire78 = (8'ha7);
  assign wire79 = {($signed($signed({wire75})) != (!($unsigned(reg71) ?
                          $unsigned(wire32) : {reg56})))};
  assign wire80 = $unsigned((!($signed((wire66 * reg56)) && reg69)));
  assign wire81 = wire65[(2'h3):(2'h3)];
  assign wire82 = ((((8'hb6) ? (~&$unsigned(reg42)) : (8'hbc)) ?
                          reg59 : (reg36[(4'h8):(3'h4)] ?
                              $signed(wire31[(1'h1):(1'h0)]) : $unsigned(wire77[(1'h1):(1'h0)]))) ?
                      wire75 : reg42);
  assign wire83 = reg39;
  assign wire84 = $unsigned($unsigned(reg40[(4'h9):(3'h7)]));
endmodule
