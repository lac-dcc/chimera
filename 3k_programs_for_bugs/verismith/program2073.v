module top
#(parameter param100 = (((~|({(8'hb2), (7'h41)} >>> ((8'hbe) < (7'h41)))) ? (({(8'h9f), (8'hbc)} ? (&(8'ha8)) : (^(7'h44))) << (~|{(8'hb4)})) : (~^(^~(~&(8'ha4))))) ? (8'ha3) : (((~&(-(8'h9f))) ? (~{(7'h40)}) : (!((8'hb4) ? (8'hae) : (7'h41)))) ? (&(-(&(8'haf)))) : (^~(((8'ha1) ? (7'h43) : (8'hb1)) && ((8'hb3) ? (8'hb5) : (8'h9e)))))), 
parameter param101 = ({(((8'ha1) ? (8'hb3) : (param100 ? param100 : (8'hbe))) & {{param100}, param100}), (|((param100 ? param100 : param100) << (param100 ? (8'hae) : (8'ha3))))} - ((~param100) ? (^param100) : (-{(param100 ? (8'hb6) : param100)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h387):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire14;
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire61,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire31,
                 wire30,
                 wire29,
                 wire14,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(wire4);
      reg6 <= (wire0 && (wire2[(4'hb):(3'h5)] ?
          {wire1[(4'h9):(3'h7)],
              (wire3 ?
                  (wire1 ?
                      wire2 : wire0) : wire0[(2'h2):(1'h0)])} : ($unsigned($unsigned(wire0)) ?
              ((8'ha9) ?
                  ((8'hab) ?
                      wire3 : (8'hb8)) : $unsigned(wire1)) : wire4[(3'h4):(2'h3)])));
      if ((wire3[(4'hc):(1'h0)] ?
          (~|(reg6 - ((|(8'hae)) ?
              wire0[(1'h1):(1'h0)] : wire1))) : $signed((~(~^$unsigned(reg6))))))
        begin
          reg7 <= ($unsigned($unsigned({$signed((8'hbb)),
                  reg6[(3'h7):(1'h0)]})) ?
              wire1[(3'h6):(1'h0)] : (!(8'hb8)));
          reg8 <= (!$unsigned((({wire1} ^ (wire4 ?
              reg5 : wire3)) != reg6[(1'h1):(1'h1)])));
        end
      else
        begin
          if ((+(reg7[(1'h1):(1'h1)] ?
              wire2[(4'ha):(4'h8)] : reg8[(1'h0):(1'h0)])))
            begin
              reg7 <= wire2[(2'h3):(2'h3)];
            end
          else
            begin
              reg7 <= $signed({$signed({((8'hb3) ? reg7 : wire2),
                      wire2[(3'h4):(2'h2)]})});
              reg8 <= $signed(wire2);
              reg9 <= (((((wire1 ? wire3 : wire0) ?
                          $unsigned(reg5) : wire2[(4'ha):(3'h4)]) >> ((wire1 + wire2) ?
                          (wire1 ? reg5 : wire4) : {(8'hb7)})) ?
                      wire0 : (((wire3 ? wire1 : wire0) ?
                              (&(8'ha8)) : $unsigned(reg6)) ?
                          $signed($signed(reg8)) : wire1)) ?
                  wire4 : $unsigned(wire0[(1'h1):(1'h1)]));
              reg10 <= (+$signed($signed((7'h41))));
              reg11 <= {reg9[(1'h1):(1'h1)]};
            end
        end
      reg12 <= $unsigned(((~^$signed(((8'hab) * reg5))) ?
          ($signed((wire1 ^ (8'hab))) ?
              $signed((8'ha6)) : ((^reg6) != {reg9,
                  (8'ha8)})) : reg5[(2'h3):(2'h2)]));
      reg13 <= $signed(((wire3 == {(^reg6)}) ?
          $signed(((!reg12) ?
              reg7[(1'h0):(1'h0)] : {wire4})) : (wire2[(3'h5):(1'h0)] ?
              $signed(reg9[(1'h0):(1'h0)]) : $unsigned(reg6[(1'h1):(1'h1)]))));
    end
  assign wire14 = $unsigned($unsigned(wire1));
  always
    @(posedge clk) begin
      reg15 <= reg12[(2'h3):(2'h2)];
      reg16 <= $unsigned((reg13[(3'h5):(2'h3)] ?
          {(^$unsigned((8'hb5))),
              $unsigned(wire3)} : $unsigned($unsigned($signed(reg12)))));
      if (wire2[(1'h1):(1'h1)])
        begin
          reg17 <= reg13;
          reg18 <= (+(&(&(((8'hac) <<< reg16) ^~ $unsigned(reg12)))));
          reg19 <= reg17;
          reg20 <= reg7;
          reg21 <= {reg20[(4'hb):(2'h3)]};
        end
      else
        begin
          if ((8'hb1))
            begin
              reg17 <= (~&$signed((reg11 ?
                  (reg8[(2'h2):(1'h1)] == reg20) : (((8'had) >> reg8) >= wire4))));
              reg18 <= (^~$unsigned({$unsigned(reg13[(5'h14):(4'he)]),
                  ((reg13 ^ (8'had)) ? reg21 : (reg7 ? wire3 : wire14))}));
              reg19 <= (~($unsigned(reg19[(4'h8):(3'h4)]) > reg6));
              reg20 <= (~(~(8'haa)));
            end
          else
            begin
              reg17 <= (|$signed(reg5[(3'h7):(3'h4)]));
              reg18 <= ($signed(wire14) ^ $signed((reg5 ? reg21 : wire0)));
              reg19 <= ((reg8 - ($signed((reg21 ?
                      reg9 : (8'hb2))) <= $signed((reg15 ? wire14 : reg13)))) ?
                  $unsigned(wire0[(2'h2):(2'h2)]) : (|reg15));
              reg20 <= reg9[(1'h1):(1'h0)];
            end
          reg21 <= $signed($signed(reg5));
          reg22 <= wire4[(3'h7):(3'h4)];
          if ((($signed(reg6) <<< ($unsigned($signed(reg15)) ^ (7'h41))) != wire2[(4'ha):(1'h1)]))
            begin
              reg23 <= wire4[(4'h8):(2'h3)];
              reg24 <= reg16;
            end
          else
            begin
              reg23 <= reg16[(4'h8):(3'h4)];
              reg24 <= $signed($signed({(wire3[(3'h6):(1'h1)] ^ wire3)}));
              reg25 <= reg13;
              reg26 <= $unsigned($signed((($unsigned(wire1) <= (reg20 <= reg10)) ?
                  ({wire0} ?
                      reg23 : $unsigned(reg12)) : (-wire1[(4'h8):(3'h6)]))));
              reg27 <= $signed(reg24[(3'h5):(3'h4)]);
            end
          reg28 <= $signed($unsigned(reg17[(3'h6):(2'h3)]));
        end
    end
  assign wire29 = (-$signed(reg24));
  assign wire30 = wire29;
  assign wire31 = $signed(reg17);
  module32 #() modinst49 (.wire34(reg6), .wire36(reg11), .wire33(reg24), .wire35(reg15), .clk(clk), .y(wire48), .wire37(reg8));
  assign wire50 = reg18[(3'h5):(1'h1)];
  assign wire51 = reg28;
  assign wire52 = (~&((wire48[(1'h0):(1'h0)] ?
                      ((reg17 > reg8) ?
                          reg15[(4'hb):(3'h4)] : reg25) : ($signed(wire48) ?
                          reg6 : $unsigned(reg21))) * $signed((~^$unsigned(reg15)))));
  always
    @(posedge clk) begin
      reg53 <= (($signed(reg26[(3'h7):(1'h0)]) || reg12[(4'hd):(2'h2)]) ^~ ($signed($unsigned((reg10 | wire3))) * wire3[(4'ha):(2'h2)]));
      reg54 <= $unsigned($signed((^~(+reg13))));
      reg55 <= ((~|wire30[(1'h1):(1'h0)]) >= ((((-reg21) ?
                  reg25 : $unsigned(reg10)) ?
              wire4 : (^reg17)) ?
          wire50 : reg17));
    end
  always
    @(posedge clk) begin
      reg56 <= ($unsigned(((reg7[(3'h5):(2'h2)] ?
          $signed(reg9) : $unsigned(reg15)) && reg21[(2'h2):(1'h1)])) < $unsigned($unsigned(((~&reg27) ?
          ((8'hab) ? reg5 : reg25) : (~|wire29)))));
      reg57 <= {(wire30[(4'ha):(3'h7)] ?
              $unsigned(($unsigned(reg27) ?
                  ((8'h9c) & reg11) : (reg55 ?
                      reg23 : reg26))) : wire31[(5'h13):(3'h4)])};
      reg58 <= (-$signed($unsigned(reg16[(1'h1):(1'h1)])));
      reg59 <= (-(+$unsigned(reg55)));
      reg60 <= ($signed((|$unsigned((wire50 ~^ reg26)))) == reg54[(2'h3):(1'h0)]);
    end
  assign wire61 = $signed(reg7);
  always
    @(posedge clk) begin
      reg62 <= reg9;
      reg63 <= ($signed((~&((wire50 ? (8'ha9) : reg54) ?
              {reg56} : (reg62 ? wire29 : reg20)))) ?
          (^~$unsigned(reg11)) : (($unsigned((reg13 <= wire4)) ?
                  $signed(wire48) : reg9) ?
              (reg16[(1'h1):(1'h1)] ^~ reg62[(3'h7):(3'h6)]) : $unsigned({reg56})));
      reg64 <= (wire31[(3'h6):(3'h4)] & reg57);
      reg65 <= ($unsigned($unsigned(reg6)) ?
          $signed(reg57) : ($signed(reg56) ?
              $unsigned((^~(~^reg19))) : (!((reg9 ?
                  reg22 : reg21) ^ $unsigned(reg63)))));
    end
  assign wire66 = reg9;
  assign wire67 = $unsigned($signed((+(|(wire4 ? reg16 : (8'ha5))))));
  assign wire68 = {wire66,
                      ($unsigned({$signed(reg19), (reg62 <<< reg56)}) ?
                          (~|({reg19, reg9} == wire2)) : (&{wire2}))};
  assign wire69 = (~|$signed((^($unsigned(reg24) ?
                      ((8'ha5) ? (8'ha5) : wire30) : {reg16}))));
  assign wire70 = ((((~$unsigned((7'h41))) || $signed($signed(reg8))) ?
                      ($signed((reg55 | reg25)) >>> {(~^reg54),
                          $unsigned(reg20)}) : {($signed(reg24) ?
                              $unsigned((8'ha9)) : $signed((8'hac)))}) == (reg60 && reg9[(1'h0):(1'h0)]));
  assign wire71 = $signed(reg6[(3'h5):(1'h0)]);
  assign wire72 = ($unsigned((+(8'haf))) && {(^~((&wire70) > $signed(reg18))),
                      reg59[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      if ($unsigned((-$unsigned(reg53[(3'h6):(3'h5)]))))
        begin
          reg73 <= $unsigned((reg7[(2'h3):(1'h1)] ^ $signed($signed({reg60}))));
          reg74 <= (8'hbe);
          reg75 <= ($unsigned((~^(~(~wire48)))) ?
              reg62 : $signed($unsigned($unsigned((|reg18)))));
        end
      else
        begin
          reg73 <= (~&((reg6[(1'h1):(1'h1)] ?
              $signed(reg26[(4'h8):(1'h0)]) : {(|reg59),
                  (wire72 ~^ reg19)}) >= $unsigned($unsigned((|wire14)))));
          if (((({((8'h9c) ? reg11 : reg10), $unsigned(wire48)} ?
                      wire1 : (~&(wire67 << reg17))) ?
                  ((^(8'ha3)) ?
                      $unsigned((|reg64)) : reg22[(2'h3):(1'h1)]) : reg28[(3'h6):(1'h0)]) ?
              $unsigned((($signed(wire14) == (reg9 + reg13)) ?
                  reg19[(2'h2):(2'h2)] : (~&$signed((8'ha6))))) : wire31))
            begin
              reg74 <= (^(reg9 && ($signed((reg10 ? reg8 : wire3)) ?
                  $signed($signed(reg22)) : ((^reg11) >> wire71[(2'h2):(2'h2)]))));
              reg75 <= (~wire51);
              reg76 <= (reg7 ?
                  reg21[(1'h1):(1'h0)] : ((|($unsigned(wire66) | (reg9 ?
                      wire3 : (7'h40)))) + reg74[(3'h4):(2'h3)]));
            end
          else
            begin
              reg74 <= $signed((^({$signed(wire4),
                  $unsigned((8'hbe))} + (reg75 >= (~&reg65)))));
              reg75 <= (^((reg17[(1'h0):(1'h0)] >= $signed((!reg64))) <= (8'hbe)));
            end
          reg77 <= $signed((-({{wire2, reg28},
              $signed(wire50)} >> $unsigned((+reg60)))));
        end
      reg78 <= ((^(~&($signed(reg12) ? (~^reg21) : (!(8'haf))))) ?
          $signed(reg21) : ((8'had) ? {(|reg74)} : reg59));
      if (reg22[(1'h1):(1'h1)])
        begin
          if (reg54[(1'h1):(1'h1)])
            begin
              reg79 <= reg24;
              reg80 <= $signed((reg21 * {wire67[(2'h2):(1'h1)],
                  {reg12, $signed(reg56)}}));
              reg81 <= {reg9};
            end
          else
            begin
              reg79 <= reg76;
            end
          reg82 <= (((($unsigned(wire1) && $signed(wire70)) ?
              {$signed(wire4)} : (+(wire31 ?
                  reg76 : wire50))) <<< reg22[(3'h5):(3'h5)]) < ($unsigned({{wire2},
              (!(8'hb5))}) > {(~|$unsigned(reg20)),
              (reg5[(2'h3):(1'h0)] ?
                  (reg58 ? reg22 : reg76) : (reg23 ? (8'h9c) : reg8))}));
          reg83 <= (((((reg78 || reg28) << wire66[(4'hb):(1'h0)]) | $unsigned(reg81[(3'h5):(1'h0)])) != reg24[(5'h13):(4'h9)]) ?
              reg28 : wire48[(1'h0):(1'h0)]);
          reg84 <= $signed(wire52);
          if (((~^reg65) > $signed({(~^(reg5 ? wire4 : reg58)),
              (~|reg19[(2'h2):(1'h1)])})))
            begin
              reg85 <= ({{($signed(wire29) ? $unsigned(reg24) : (~&reg65)),
                      $signed((reg12 << reg9))}} * (7'h42));
              reg86 <= (wire48[(2'h2):(1'h1)] ?
                  (^~{wire14, wire14}) : $signed({$signed((reg57 ?
                          wire48 : reg9))}));
            end
          else
            begin
              reg85 <= (7'h40);
              reg86 <= ($signed({reg11[(4'he):(3'h5)], reg64[(1'h1):(1'h1)]}) ?
                  reg11[(5'h10):(4'h9)] : (8'hbd));
              reg87 <= {$unsigned(wire48[(1'h1):(1'h0)])};
            end
        end
      else
        begin
          reg79 <= {((~|($signed(reg26) | (reg65 ?
                  reg20 : wire72))) + reg56[(1'h0):(1'h0)])};
          reg80 <= reg58[(3'h4):(2'h3)];
          reg81 <= wire69;
          reg82 <= $signed((reg73 ?
              $signed((reg55[(1'h0):(1'h0)] ?
                  reg59 : $unsigned(wire68))) : $signed(reg76[(3'h6):(3'h5)])));
          reg83 <= (reg63 ? wire52[(4'hb):(3'h5)] : $signed(reg11));
        end
      if ($unsigned((~&wire29)))
        begin
          reg88 <= (reg11[(4'ha):(3'h5)] ?
              ($unsigned((((7'h41) ? reg54 : reg9) ^~ ((8'haf) >> wire68))) ?
                  (^~$unsigned({reg63})) : ((^reg79) ?
                      ($unsigned(wire70) > ((8'hb3) ?
                          reg77 : wire70)) : $unsigned((reg15 >= reg81)))) : (8'ha7));
          reg89 <= reg75;
          if (wire0)
            begin
              reg90 <= wire67[(3'h6):(3'h6)];
              reg91 <= wire52;
              reg92 <= reg79[(4'hb):(3'h7)];
              reg93 <= (reg6[(4'ha):(3'h5)] ?
                  $signed((wire14[(4'h9):(1'h1)] && $unsigned(wire14))) : $signed({wire61[(2'h2):(1'h0)],
                      reg55}));
              reg94 <= ($signed({$signed($signed(wire67)),
                  (8'hb7)}) <= {{(-((8'hb4) | wire61))},
                  (~$unsigned((reg64 ? reg21 : reg25)))});
            end
          else
            begin
              reg90 <= (8'ha6);
              reg91 <= (|(-reg83[(4'he):(1'h1)]));
              reg92 <= (~|wire4);
            end
          if ($signed({(({reg53} * (wire31 <<< reg91)) ?
                  $signed((8'hb2)) : (reg24[(1'h0):(1'h0)] ?
                      (reg84 ? reg53 : (7'h40)) : (&reg63))),
              (~$signed((+wire30)))}))
            begin
              reg95 <= reg65;
            end
          else
            begin
              reg95 <= {(~&reg8), wire67[(2'h3):(1'h1)]};
              reg96 <= ((reg22[(3'h7):(3'h6)] ?
                      (^reg75[(2'h3):(1'h0)]) : ((~^reg5) ?
                          (!(reg11 ?
                              (8'h9f) : wire0)) : ($signed((7'h41)) < (-(8'ha6))))) ?
                  $unsigned({(~|wire3[(2'h3):(1'h0)]),
                      {(reg27 ?
                              wire70 : reg79)}}) : ((~|wire50[(5'h10):(4'h8)]) >>> {$unsigned($signed(reg58))}));
              reg97 <= (($signed($signed((reg12 ?
                      reg11 : reg58))) >>> reg58[(1'h0):(1'h0)]) ?
                  (^{$unsigned($unsigned(reg80)),
                      $signed($unsigned(wire14))}) : ((~^reg17) ?
                      (|({(7'h44)} << (reg25 > reg21))) : reg10));
              reg98 <= ((~|reg93[(3'h5):(1'h1)]) * {(+$unsigned($unsigned(reg57)))});
              reg99 <= reg76;
            end
        end
      else
        begin
          reg88 <= ((reg25[(5'h11):(3'h5)] - ($signed((wire71 ?
                  wire66 : reg60)) - reg97[(2'h2):(2'h2)])) ?
              $unsigned(reg84) : $unsigned(reg25));
          reg89 <= (-$signed($unsigned((~(!reg5)))));
          reg90 <= (~^{$signed((reg91[(4'he):(3'h7)] ?
                  (reg56 - reg20) : (~^wire52))),
              wire14});
          if ($unsigned((~|$signed({reg56[(3'h5):(3'h5)], $signed(reg84)}))))
            begin
              reg91 <= {($unsigned(wire69) ?
                      (8'h9e) : (!({reg57} ? (~&reg28) : (~reg65)))),
                  (~&reg5[(3'h4):(2'h2)])};
              reg92 <= $unsigned((|(~|(reg95[(2'h2):(2'h2)] ?
                  $signed(wire69) : (-reg89)))));
              reg93 <= {(|(reg53 ?
                      (-(reg83 ? reg75 : reg99)) : (^(reg18 ?
                          wire1 : (8'ha6))))),
                  {$signed($signed({(8'hac), reg19})),
                      ($signed($unsigned((8'hbe))) ? (+wire31) : reg91)}};
              reg94 <= reg73[(5'h11):(2'h3)];
              reg95 <= reg86[(3'h6):(1'h1)];
            end
          else
            begin
              reg91 <= $signed(($unsigned($unsigned((wire72 ?
                  reg20 : reg88))) == (~|$unsigned((reg19 ?
                  wire14 : (8'ha4))))));
              reg92 <= (+reg60[(4'hd):(4'hd)]);
              reg93 <= ((~^reg97[(2'h2):(1'h0)]) ?
                  {reg6} : (wire1[(4'h9):(2'h2)] * $signed(((|reg11) >> (wire71 ?
                      reg16 : reg91)))));
              reg94 <= reg94[(1'h0):(1'h0)];
              reg95 <= ($signed((~|reg7)) ?
                  $unsigned((($unsigned(reg13) <<< (7'h43)) == ((8'h9d) > {wire50}))) : {reg23,
                      wire31[(3'h7):(2'h3)]});
            end
        end
    end
endmodule

module module32
#(parameter param46 = (^({{(~&(8'ha8))}} ? ((((8'haa) == (8'hb8)) ? (|(8'hbe)) : ((8'hbc) == (8'ha4))) + ({(8'h9f), (8'hbb)} <= ((8'hba) ? (8'haa) : (7'h41)))) : (((~^(8'ha7)) ? ((8'hbf) <<< (7'h42)) : ((8'hb6) || (8'h9d))) ? {((8'ha5) < (8'hb1))} : (((8'hac) ? (8'hb0) : (8'ha2)) ? {(7'h43), (7'h41)} : ((8'hb8) ^~ (8'hab)))))), 
parameter param47 = (((~^(8'ha5)) >= (8'hb6)) ~^ (({(param46 ? param46 : param46), (~|param46)} >>> param46) ? ({(&param46), (^(8'ha8))} > {{param46}}) : (param46 ? (^~(8'h9d)) : ((^param46) >> ((8'ha9) ? param46 : param46))))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire signed [(3'h7):(1'h0)] wire35;
  input wire signed [(4'he):(1'h0)] wire34;
  input wire [(4'ha):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire39,
                 wire38,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire38 = (wire34[(2'h2):(2'h2)] << {{wire33, wire34}});
  assign wire39 = wire38[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed((~^{$unsigned((wire37 >> wire35))})))
        begin
          if ({(^~wire35), (~&$signed((-(wire38 < wire39))))})
            begin
              reg40 <= wire35[(1'h1):(1'h0)];
              reg41 <= reg40[(3'h4):(1'h1)];
            end
          else
            begin
              reg40 <= $signed(($unsigned((&(&wire37))) ?
                  $signed(reg41) : reg40[(1'h0):(1'h0)]));
              reg41 <= ((wire33 | wire38) & wire35[(3'h5):(2'h3)]);
              reg42 <= wire34;
            end
        end
      else
        begin
          reg40 <= $signed(((+((reg42 + wire36) ?
                  $unsigned(wire39) : wire39[(3'h4):(2'h3)])) ?
              ((&{wire39, wire35}) ?
                  ($unsigned(wire39) ?
                      (reg40 >= reg40) : (8'hb2)) : ($unsigned(wire35) ?
                      {reg40,
                          wire36} : $signed((8'ha9)))) : $unsigned(reg41[(3'h7):(3'h6)])));
          if (reg42)
            begin
              reg41 <= wire36[(4'hf):(4'hf)];
              reg42 <= $signed($signed(reg41[(1'h1):(1'h0)]));
              reg43 <= reg40[(3'h6):(2'h3)];
            end
          else
            begin
              reg41 <= $signed((~&(^~(~^(!wire38)))));
              reg42 <= reg40[(2'h3):(2'h2)];
              reg43 <= (((-({reg41} ?
                  (reg40 ?
                      reg42 : (8'hb1)) : $unsigned(reg43))) <= $signed(($unsigned(reg40) >>> (~reg41)))) ~^ reg43[(2'h3):(1'h1)]);
            end
        end
    end
  assign wire44 = $unsigned((wire37[(1'h0):(1'h0)] ?
                      (((wire36 <<< wire34) ?
                          wire33 : (wire39 >>> wire35)) | (^~reg43[(1'h1):(1'h1)])) : reg41[(2'h2):(1'h1)]));
  assign wire45 = $signed({($signed((~wire33)) ^ (reg41 ?
                          $signed(wire38) : $unsigned((8'ha6)))),
                      (+wire35[(2'h3):(2'h3)])});
endmodule
