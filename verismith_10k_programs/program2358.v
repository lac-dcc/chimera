module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire103;
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  assign y = {wire24,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire103,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  module5 #() modinst25 (wire24, clk, wire0, wire2, wire3, wire1, wire4);
  always
    @(posedge clk) begin
      if (wire1[(2'h3):(2'h3)])
        begin
          reg26 <= wire3[(4'hf):(3'h6)];
          reg27 <= wire0;
        end
      else
        begin
          if ($unsigned($unsigned(wire0[(4'h8):(1'h0)])))
            begin
              reg26 <= $unsigned($signed($unsigned(($signed(wire0) ?
                  wire1[(1'h0):(1'h0)] : (wire2 ? wire3 : reg27)))));
              reg27 <= (-wire4);
              reg28 <= wire24;
            end
          else
            begin
              reg26 <= $unsigned((~reg27));
              reg27 <= reg27;
            end
          if (wire0[(4'hf):(2'h3)])
            begin
              reg29 <= $signed(wire4);
              reg30 <= $unsigned(($unsigned(((~(8'hbb)) ?
                  (wire0 < (8'hb0)) : (wire4 ?
                      wire0 : (7'h42)))) <= $unsigned((~|(reg27 >> reg29)))));
              reg31 <= ((~^reg27) ?
                  (|{((&(8'h9e)) <<< (wire3 & wire0))}) : ((^~($signed((8'ha0)) ?
                          reg30[(4'hf):(3'h7)] : wire1)) ?
                      (~|((wire24 << wire4) ?
                          (~&wire3) : wire24)) : $signed((-{reg27, reg26}))));
              reg32 <= (^~{(^$signed((reg31 ? wire1 : reg28))),
                  reg31[(3'h5):(3'h4)]});
            end
          else
            begin
              reg29 <= wire24;
              reg30 <= $unsigned((+{$signed(reg31),
                  ($signed(reg26) ? ((8'ha2) ? wire4 : (8'ha2)) : (+wire3))}));
              reg31 <= reg27;
            end
          reg33 <= {$unsigned(wire0)};
          reg34 <= $signed(wire2);
          if ($unsigned(wire1))
            begin
              reg35 <= ({reg28[(4'ha):(4'h8)],
                      $signed((wire24 ? $unsigned(reg27) : reg26))} ?
                  {$unsigned(reg29)} : reg30[(4'ha):(2'h2)]);
            end
          else
            begin
              reg35 <= (!({(|(reg33 ? reg32 : reg30))} ?
                  {$unsigned($signed(reg33))} : (wire2 ?
                      ((reg32 == (8'ha7)) != (reg26 ?
                          reg30 : wire1)) : $signed({reg28, (7'h41)}))));
              reg36 <= {{$unsigned({reg31, {reg26}})}};
              reg37 <= $signed($unsigned($unsigned($unsigned($signed(reg35)))));
              reg38 <= (&reg31);
              reg39 <= $signed($unsigned(wire1[(5'h11):(4'he)]));
            end
        end
      reg40 <= reg26;
      reg41 <= (+($unsigned($unsigned((reg30 ? wire1 : reg32))) ?
          (wire3 ? reg37 : ($signed(reg34) ? wire4 : (8'ha5))) : (8'ha8)));
      reg42 <= (~^{(~&(reg28 != wire4[(5'h13):(4'hd)]))});
      reg43 <= (reg38 >>> ($unsigned(((reg36 ?
          reg27 : reg28) & $signed(reg33))) <= $signed($signed((wire1 ?
          reg30 : wire4)))));
    end
  always
    @(posedge clk) begin
      if (({wire24[(3'h5):(2'h2)]} ?
          (((&reg32[(4'hf):(1'h1)]) ?
                  ({reg27, reg27} ?
                      $unsigned((8'ha7)) : (~&(8'hb8))) : $unsigned((wire3 != reg35))) ?
              reg31[(4'h8):(3'h7)] : $signed(({reg29} + (-reg33)))) : ((+($signed(reg42) | {(8'ha2),
                  (8'hb1)})) ?
              $signed((wire1 << (&reg36))) : reg42)))
        begin
          reg44 <= reg35;
          if (($signed({(|(wire1 ? (8'hab) : (8'hb5)))}) ?
              reg39 : reg29[(2'h3):(2'h3)]))
            begin
              reg45 <= $unsigned((~|((~^{reg42}) ?
                  ($unsigned(wire0) ?
                      reg42[(5'h10):(4'ha)] : reg33[(1'h1):(1'h0)]) : $unsigned(wire4))));
              reg46 <= {$unsigned((!((reg41 ? reg40 : (7'h43)) ?
                      {(8'h9e)} : reg41[(3'h6):(2'h2)])))};
              reg47 <= $unsigned((reg40 << reg27[(2'h3):(2'h2)]));
              reg48 <= reg31;
            end
          else
            begin
              reg45 <= ($unsigned($unsigned(({(8'h9c)} == reg46))) >= {reg32,
                  (reg31 ?
                      {wire0} : ($unsigned(reg35) >= ((8'ha1) <= reg27)))});
              reg46 <= $signed(reg34[(5'h14):(3'h7)]);
              reg47 <= reg46;
            end
          reg49 <= (^$signed((reg33 && ((wire1 ? reg42 : reg31) ?
              {reg44, reg46} : reg38[(5'h12):(4'hb)]))));
          reg50 <= $unsigned((reg44 ?
              wire2[(3'h7):(3'h6)] : wire4[(5'h10):(3'h7)]));
          reg51 <= ({reg45, $signed({$unsigned(wire1)})} ?
              $signed(reg48[(1'h0):(1'h0)]) : ((reg42 ?
                  ((reg40 ?
                      wire0 : (8'haf)) < $unsigned((8'ha3))) : (8'hac)) >> reg27[(1'h1):(1'h1)]));
        end
      else
        begin
          reg44 <= (^reg49);
          reg45 <= $unsigned($signed(reg39));
        end
      if ($signed({{reg32, {$unsigned(reg47), reg39[(4'hd):(2'h3)]}},
          (~((reg35 ? reg35 : (8'hba)) ?
              (reg30 ? reg44 : reg40) : $signed(reg46)))}))
        begin
          if ((((((reg35 | reg38) ^~ {reg37, reg27}) ?
                      ((^reg27) & $signed(reg36)) : $signed($signed(reg39))) ?
                  $signed(($signed(wire0) >> $signed(reg46))) : ({(reg30 ?
                              reg45 : reg33)} ?
                      (8'had) : (+$unsigned(reg44)))) ?
              (~|{$signed($unsigned(reg43))}) : (reg43[(3'h4):(1'h0)] ?
                  ({(reg43 ? (8'hae) : reg26),
                      (reg30 || reg34)} ^~ $unsigned((reg32 ?
                      wire0 : reg33))) : $signed((8'ha5)))))
            begin
              reg52 <= reg49[(5'h12):(2'h3)];
              reg53 <= (^((|(~^(reg48 * (7'h40)))) ^ reg32));
              reg54 <= (+(~|reg42[(4'hc):(3'h6)]));
            end
          else
            begin
              reg52 <= ((reg27 ?
                  reg39[(4'h8):(4'h8)] : ((reg35 & $unsigned(wire24)) ?
                      $unsigned($signed(reg44)) : $signed((-(7'h44))))) ^~ reg49[(3'h4):(3'h4)]);
              reg53 <= $signed($unsigned(reg51));
              reg54 <= ((^~reg51[(4'h9):(3'h7)]) == $unsigned(wire24[(1'h1):(1'h1)]));
              reg55 <= reg52[(2'h3):(2'h3)];
            end
          reg56 <= $unsigned(wire24[(3'h4):(2'h2)]);
        end
      else
        begin
          reg52 <= $unsigned(reg28[(4'ha):(2'h3)]);
          reg53 <= $signed(reg41[(2'h3):(1'h1)]);
          reg54 <= (reg36[(2'h3):(2'h3)] == (7'h41));
          reg55 <= (reg31[(1'h0):(1'h0)] >= (((^reg35) ?
              {$unsigned(wire0),
                  reg26[(1'h1):(1'h1)]} : {$signed(reg55)}) ^ reg42[(1'h0):(1'h0)]));
          reg56 <= ($signed($unsigned($signed((7'h43)))) >> $unsigned((^$unsigned($unsigned(reg55)))));
        end
      if (reg33[(4'h8):(3'h7)])
        begin
          reg57 <= (reg33 ? reg42[(4'he):(4'h9)] : reg44[(4'h8):(3'h4)]);
          reg58 <= $unsigned((((&(reg50 | reg54)) + reg40) ?
              (^~{(reg48 ? (8'haf) : reg55),
                  (+wire4)}) : reg29[(1'h0):(1'h0)]));
          reg59 <= $unsigned((reg28 ? (8'ha7) : (wire3 >>> reg48)));
          reg60 <= {reg43, (reg35 ? reg48 : reg36)};
          reg61 <= (((~($unsigned(reg32) ? (&reg41) : (reg57 && (8'ha8)))) ?
              (+((+reg34) || (reg51 > reg50))) : (reg41 + (~|wire24))) && ((8'hae) | ($signed(wire4[(4'h9):(2'h2)]) ?
              reg38[(5'h11):(4'h9)] : (+wire0[(4'h9):(3'h7)]))));
        end
      else
        begin
          reg57 <= $unsigned(reg55);
        end
      if ((reg45[(2'h3):(2'h3)] ?
          reg48 : ($unsigned(reg48[(1'h0):(1'h0)]) >> $unsigned((reg43[(2'h2):(1'h1)] ?
              reg53 : (reg26 + reg59))))))
        begin
          reg62 <= $unsigned($unsigned((($unsigned(reg39) | {reg30,
              reg53}) != (8'ha4))));
          if (($unsigned(reg61[(4'he):(4'ha)]) ?
              ((~^reg29[(2'h2):(1'h1)]) ?
                  (($unsigned(reg59) <<< wire3[(4'h8):(3'h6)]) ?
                      $signed($unsigned((8'hb1))) : {(reg37 < reg41)}) : $unsigned({{reg58},
                      $unsigned(reg39)})) : $unsigned(reg39)))
            begin
              reg63 <= (!(7'h40));
              reg64 <= reg29;
              reg65 <= $unsigned($unsigned(reg62[(5'h11):(4'hd)]));
              reg66 <= reg33[(4'hf):(3'h6)];
              reg67 <= (~(~|{reg47, ($signed(reg55) <<< $signed(reg51))}));
            end
          else
            begin
              reg63 <= (~^$unsigned((&(!(8'hbf)))));
              reg64 <= (reg56[(3'h4):(2'h3)] ?
                  ((($unsigned(wire1) ?
                              (reg55 == (8'had)) : reg40[(4'hc):(3'h4)]) ?
                          (&(reg45 ? reg54 : reg43)) : reg33) ?
                      (~|((~wire24) << ((7'h42) ?
                          reg57 : reg49))) : (reg50 >= ((~reg47) & $signed(reg49)))) : reg58);
              reg65 <= (({reg28[(4'ha):(1'h0)]} ?
                      $signed($unsigned(wire2[(1'h0):(1'h0)])) : reg49) ?
                  (~reg66) : $signed(($signed((-reg32)) ?
                      $signed(reg65) : $unsigned(reg52))));
              reg66 <= (^~reg43[(2'h3):(1'h1)]);
              reg67 <= ({(^~(reg34[(4'hc):(3'h4)] ?
                          reg63[(2'h3):(2'h2)] : {reg57}))} ?
                  reg36[(3'h7):(2'h2)] : (^~(&{$signed(wire2),
                      (reg45 ? reg41 : reg62)})));
            end
        end
      else
        begin
          reg62 <= wire4[(5'h12):(3'h4)];
          reg63 <= ($signed($unsigned({(reg39 ? reg37 : reg41),
              (|reg61)})) ^ wire24[(3'h4):(2'h3)]);
          reg64 <= $signed(($unsigned(((reg32 ? reg32 : reg55) ?
                  (~^reg27) : (reg67 > reg53))) ?
              (~|(reg58[(4'hf):(4'he)] ?
                  $unsigned(reg47) : reg60)) : ($signed($signed(reg45)) >= {reg35[(4'h9):(3'h4)],
                  ((8'hbf) ? reg38 : (8'hba))})));
          reg65 <= ({(reg35 ~^ ($unsigned(reg64) ? (reg39 && reg46) : reg57))} ?
              $unsigned((~^$unsigned($signed(reg45)))) : $unsigned(((~^$unsigned(reg26)) - ((reg45 ?
                  reg50 : wire24) & $signed(reg43)))));
          reg66 <= reg59;
        end
    end
  assign wire68 = (reg38 ?
                      {((-reg67) ?
                              ((~&(8'hb6)) << ((8'hb7) >>> reg32)) : $signed(reg62)),
                          (reg36[(2'h3):(2'h3)] ?
                              $unsigned((reg27 ^ reg28)) : reg46)} : (~|((+(^~wire4)) ?
                          (~reg40[(4'ha):(3'h4)]) : ($signed(reg30) ?
                              reg46 : $signed(wire24)))));
  assign wire69 = ($unsigned(($unsigned((reg45 ?
                      reg59 : (8'h9f))) <= (reg67 + (^reg27)))) != (~^$unsigned($signed((!reg62)))));
  assign wire70 = reg63[(1'h1):(1'h1)];
  assign wire71 = (((({(8'ha6)} - (~&(8'ha0))) * ((&reg67) ?
                          ((8'hb6) ~^ reg45) : (~^wire69))) > ($signed($signed(reg29)) < wire0)) ?
                      {$unsigned($unsigned($unsigned(reg53)))} : (~|(+$signed(reg63))));
  assign wire72 = (reg66 ?
                      ((~reg48[(1'h0):(1'h0)]) < $signed($signed({reg62}))) : $signed(reg30));
  assign wire73 = $unsigned((reg59 ?
                      ($unsigned(reg36[(1'h1):(1'h1)]) ?
                          $unsigned($signed((8'ha2))) : reg51) : {reg30}));
  assign wire74 = ({$unsigned(wire68)} ?
                      ($unsigned((reg59 & reg28)) ?
                          (+wire73[(2'h2):(2'h2)]) : ((|{reg43, reg59}) ?
                              (~^(8'ha8)) : $unsigned($signed(wire24)))) : wire0);
  module75 #() modinst104 (wire103, clk, reg49, reg59, wire73, reg55);
endmodule

module module75  (y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  input wire [(5'h11):(1'h0)] wire77;
  input wire signed [(4'h8):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire81,
                 wire80,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire80 = wire77[(2'h2):(1'h1)];
  assign wire81 = ($unsigned(((!$signed(wire79)) ^~ (~^(^wire76)))) >> wire79);
  always
    @(posedge clk) begin
      reg82 <= ((8'hb5) ?
          (~&$unsigned(((^wire81) >= wire79[(4'hf):(2'h2)]))) : $unsigned($signed($unsigned((~|(8'hac))))));
      reg83 <= $signed((-$signed((((8'haf) ~^ (8'hb5)) ?
          {reg82} : (wire81 >>> wire78)))));
      reg84 <= (^(~$signed($signed((reg82 ? wire77 : (8'hac))))));
      reg85 <= {$unsigned(reg82)};
      reg86 <= wire80[(3'h7):(1'h1)];
    end
  assign wire87 = $unsigned(wire81[(1'h1):(1'h1)]);
  assign wire88 = (~^{$signed(($signed(reg85) | (wire78 ~^ wire76)))});
  assign wire89 = ({({(8'hbc), (wire80 ? wire87 : wire88)} ?
                          ((+reg83) > {(7'h44),
                              reg83}) : ($signed(reg83) ^~ reg85[(1'h0):(1'h0)]))} && ($unsigned(wire88[(1'h0):(1'h0)]) ?
                      (wire87[(1'h1):(1'h0)] >= wire81[(4'ha):(4'h9)]) : wire80[(3'h7):(3'h5)]));
  assign wire90 = wire80[(4'ha):(3'h4)];
  assign wire91 = $unsigned(reg82);
  assign wire92 = ({(~^$unsigned((reg84 + wire78)))} >> reg84);
  assign wire93 = $signed(reg84);
  assign wire94 = wire92;
  assign wire95 = $signed((~^($signed($unsigned(reg83)) ?
                      wire77[(1'h0):(1'h0)] : $unsigned({(8'hb6)}))));
  assign wire96 = ((+($unsigned(wire79[(4'hd):(4'hc)]) ?
                          (((8'h9c) ? reg86 : wire89) ?
                              {wire78, wire92} : ((8'hb7) ?
                                  wire81 : wire95)) : $unsigned(wire80[(2'h2):(2'h2)]))) ?
                      wire78[(4'hd):(4'hd)] : wire76[(3'h4):(1'h0)]);
  assign wire97 = $unsigned((({((8'h9d) > reg84)} << ({wire79,
                          reg85} ~^ (reg85 ? wire89 : reg83))) ?
                      wire87[(1'h0):(1'h0)] : (^~(8'hbf))));
  assign wire98 = wire80;
  assign wire99 = $signed((($unsigned($signed(reg82)) ?
                          $signed(wire78) : $signed((wire80 ?
                              reg82 : (8'hb5)))) ?
                      (7'h40) : $signed(wire87)));
  assign wire100 = $unsigned(((((wire88 ?
                       wire99 : wire87) > wire77[(5'h11):(3'h4)]) >> ($unsigned(wire97) ?
                       (wire92 ?
                           wire95 : wire88) : (-wire89))) ^~ ($unsigned(wire88[(5'h12):(4'he)]) == (wire81[(4'h8):(3'h4)] > wire89))));
  assign wire101 = $unsigned($signed(((wire93 == wire88) ?
                       $signed(wire95) : ({wire97} ?
                           $unsigned(reg82) : (reg83 - wire95)))));
  assign wire102 = (((8'h9e) * wire93[(3'h7):(1'h1)]) ?
                       (wire95 - ($unsigned(wire97[(4'hd):(3'h6)]) ^~ {wire99,
                           (!wire77)})) : $signed(wire92));
endmodule

module module5
#(parameter param23 = (~|(~^((((8'haf) ? (8'hb9) : (8'hb2)) ? ((8'hbb) << (7'h41)) : ((8'hab) ? (8'hb6) : (8'h9c))) >>> (7'h40)))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 (1'h0)};
  assign wire11 = {(+{((&(8'h9e)) ? (-(8'ha4)) : (wire6 ? wire6 : wire8))}),
                      (!$signed(wire6))};
  assign wire12 = (wire8[(4'hb):(4'h9)] || (~^$unsigned((~&((8'h9e) ?
                      (7'h42) : wire6)))));
  assign wire13 = {wire7[(1'h0):(1'h0)],
                      (wire6[(3'h5):(3'h5)] ^~ $unsigned(((+(8'hb0)) ?
                          wire8 : wire11)))};
  assign wire14 = $unsigned((8'hab));
  assign wire15 = {wire12};
  assign wire16 = (^((8'ha4) - wire8[(4'ha):(3'h6)]));
  assign wire17 = (wire14[(2'h3):(1'h0)] ? {{(7'h42)}} : wire6[(4'h9):(2'h3)]);
  assign wire18 = ((|($unsigned($unsigned(wire6)) >= (-$signed((8'ha3))))) ?
                      (($signed((-wire8)) ?
                          (8'hbd) : $signed((~|wire9))) ^ $unsigned($signed((^~wire6)))) : $signed($unsigned(wire17[(3'h4):(2'h3)])));
  assign wire19 = ({(~^($signed(wire8) >= $unsigned(wire15)))} ~^ $signed((-($unsigned(wire14) > $unsigned(wire10)))));
  assign wire20 = $signed(((8'h9c) ? wire17 : $unsigned((&wire11))));
  assign wire21 = ($unsigned(wire10) ~^ $signed(wire16));
  assign wire22 = (8'ha9);
endmodule
