module top
#(parameter param88 = {(~|{(((8'hac) ? (8'hac) : (8'h9e)) <= (&(8'hb7))), ((~^(8'h9f)) ? {(8'hb2)} : ((8'haa) ? (8'hb9) : (8'hae)))})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire73;
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire73,
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
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = wire1[(3'h7):(3'h6)];
  assign wire5 = (wire0 > $unsigned(wire0));
  assign wire6 = $signed(wire1);
  assign wire7 = wire6[(3'h7):(2'h2)];
  assign wire8 = $signed($unsigned(($signed((8'hbb)) ?
                     ((-wire6) >> $signed(wire6)) : wire4[(1'h0):(1'h0)])));
  assign wire9 = $signed($signed($signed((((7'h41) - wire4) ?
                     {wire3} : (wire0 ? wire2 : wire8)))));
  assign wire10 = ($unsigned(({{wire8}} <<< {(wire2 * (8'hb6))})) ?
                      wire2 : (~|$unsigned(wire7[(1'h0):(1'h0)])));
  assign wire11 = (!$unsigned(((^~$unsigned(wire7)) < $unsigned(wire10[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg12 <= wire10[(2'h3):(2'h2)];
      reg13 <= (^$unsigned(wire0[(3'h7):(3'h6)]));
      reg14 <= (|({wire11,
          ({wire8} ?
              ((8'hba) ?
                  wire4 : (8'haa)) : wire7[(3'h4):(2'h3)])} || ({(|wire11)} << ($unsigned(wire11) >>> (wire10 ?
          reg12 : wire8)))));
    end
  assign wire15 = ($signed({((^~wire2) ?
                              $unsigned((8'ha5)) : $signed(wire6))}) ?
                      (8'ha8) : wire8[(3'h6):(3'h5)]);
  assign wire16 = $signed(((^~((!(8'ha5)) ^ $signed(wire0))) && $signed((^~(8'hb9)))));
  assign wire17 = (~&(reg14[(1'h1):(1'h0)] <<< (^(8'ha4))));
  assign wire18 = (~|wire3[(3'h5):(1'h1)]);
  assign wire19 = (wire6 ?
                      ((({wire7} ?
                              wire7[(1'h1):(1'h0)] : (wire1 ? wire9 : wire15)) ?
                          $unsigned({wire15}) : (|$signed(wire15))) <= (reg12[(1'h0):(1'h0)] ^ (8'haf))) : {$signed(wire1)});
  assign wire20 = ($unsigned($unsigned((reg14 ?
                          $signed(wire16) : wire16[(3'h4):(3'h4)]))) ?
                      wire16[(3'h6):(3'h4)] : (wire8[(3'h7):(1'h1)] ?
                          $signed((reg13[(4'hb):(4'h8)] ?
                              (wire15 ?
                                  (8'hba) : wire16) : (wire2 + wire5))) : wire8));
  assign wire21 = $signed({$unsigned($unsigned((8'h9f))),
                      ($signed((!(8'haf))) ? wire4 : (~^wire0))});
  assign wire22 = {(-$unsigned(({wire19, (8'hba)} ?
                          $signed(wire21) : $signed(wire4))))};
  assign wire23 = $signed({$unsigned(((&wire10) & (wire10 ^~ wire3))),
                      {(|$signed(wire5)),
                          $unsigned((wire4 ? wire20 : reg13))}});
  assign wire24 = $signed($unsigned($unsigned((~|(wire22 ? wire17 : wire5)))));
  assign wire25 = {{reg13, wire17}};
  always
    @(posedge clk) begin
      if ((($unsigned({reg13,
          (wire0 ?
              wire8 : wire1)}) <= (|wire4)) | (^~($unsigned(wire21) == wire5[(3'h7):(1'h1)]))))
        begin
          reg26 <= ($unsigned(wire19) ? wire15 : (&wire5[(2'h2):(2'h2)]));
          if ($unsigned({wire16, wire5[(3'h4):(3'h4)]}))
            begin
              reg27 <= reg26[(1'h0):(1'h0)];
              reg28 <= $unsigned({((~|{wire6}) ?
                      wire23[(5'h10):(3'h6)] : $signed((wire25 >= reg27))),
                  reg14});
              reg29 <= (wire9[(4'h8):(3'h7)] ?
                  {{((reg12 ? wire20 : wire16) == ((8'ha4) ?
                              wire22 : reg27))}} : {(^~(^$signed((8'ha3)))),
                      ($signed(wire17[(1'h1):(1'h1)]) ?
                          (-(wire4 ^~ wire2)) : (+(wire24 - wire4)))});
              reg30 <= wire1;
            end
          else
            begin
              reg27 <= ($unsigned(wire0) >>> reg12);
              reg28 <= ($unsigned(reg29[(4'h8):(2'h2)]) ^ reg28[(3'h5):(2'h2)]);
              reg29 <= {wire16,
                  $signed({$signed((wire23 * wire25)),
                      $signed(((8'hb1) ? wire5 : reg27))})};
              reg30 <= $unsigned((~wire23));
            end
          if ((wire1 >> reg12))
            begin
              reg31 <= ($unsigned((((reg12 ?
                  reg28 : reg30) * $unsigned(wire15)) * $signed({wire11}))) <<< wire15);
              reg32 <= wire25;
            end
          else
            begin
              reg31 <= ({$unsigned(wire6)} ?
                  wire3 : ($unsigned((wire10[(3'h7):(3'h5)] ?
                      (reg14 ?
                          (8'ha6) : wire5) : wire17)) ^~ $unsigned($signed(wire20))));
              reg32 <= wire24;
              reg33 <= $signed(({((+reg28) ^ reg32),
                  (|$unsigned(wire6))} <<< (8'ha2)));
            end
          reg34 <= (wire9[(3'h4):(1'h0)] | (-$signed($unsigned(reg31[(3'h4):(1'h0)]))));
        end
      else
        begin
          reg26 <= ($signed($signed(wire21[(1'h0):(1'h0)])) || wire20[(3'h7):(2'h3)]);
        end
    end
  module35 #() modinst74 (wire73, clk, reg28, wire25, wire17, reg30, wire4);
  always
    @(posedge clk) begin
      if (({wire5, wire25[(4'hb):(4'h8)]} ?
          reg32 : ((wire9 == (^reg29[(3'h6):(2'h3)])) ?
              (^~$unsigned({wire20})) : (~&($signed(wire11) >> wire20[(5'h10):(4'he)])))))
        begin
          reg75 <= $signed(($signed($unsigned($unsigned(reg26))) ~^ (~|((^~wire23) ?
              $unsigned(wire21) : wire24))));
          reg76 <= wire11;
        end
      else
        begin
          reg75 <= ((^((!((8'hb2) ? wire23 : reg13)) - (+{wire9, wire7}))) ?
              (8'hab) : (({(wire11 ? reg30 : wire11)} | $signed((!(8'hbf)))) ?
                  $signed($unsigned(reg12[(2'h2):(1'h1)])) : reg33));
        end
      if ((({((wire6 ? wire2 : (8'h9f)) ?
              $unsigned(wire5) : wire25[(3'h4):(1'h0)])} ^ reg26) > (reg26 ?
          wire10 : (8'haa))))
        begin
          reg77 <= ((~(reg30 ? (reg34[(2'h3):(2'h3)] & (~&reg34)) : wire2)) ?
              $unsigned($signed((wire0 >> $signed(reg27)))) : ($unsigned((wire15 >> (wire25 >>> wire0))) << ((wire8[(3'h5):(3'h5)] ^~ wire4) || ($unsigned((8'haa)) ?
                  reg26[(3'h4):(2'h2)] : (wire23 == wire25)))));
          reg78 <= (wire10 >> (reg76 == $signed($signed($signed(wire7)))));
          if ($unsigned(((&wire17) ?
              $unsigned($unsigned((+wire9))) : (~&((wire0 ? wire9 : (8'h9f)) ?
                  reg27 : $unsigned((8'ha1)))))))
            begin
              reg79 <= (~&(^~(8'hb4)));
              reg80 <= (($unsigned($unsigned({wire11})) | reg32[(4'hd):(3'h6)]) ?
                  (+(~|$unsigned((reg27 ? wire17 : wire11)))) : $signed({wire0,
                      $signed(((8'hae) >= wire3))}));
            end
          else
            begin
              reg79 <= reg14;
              reg80 <= (+(+{$signed($signed(wire7))}));
              reg81 <= (($signed((reg13 - $signed(reg76))) ?
                      (wire19 || {reg26[(2'h2):(1'h0)],
                          (wire21 < wire3)}) : reg79[(3'h6):(3'h5)]) ?
                  $unsigned(wire7[(3'h4):(1'h1)]) : wire6);
              reg82 <= (7'h44);
              reg83 <= reg79[(5'h10):(4'he)];
            end
          if ((8'hb7))
            begin
              reg84 <= ($signed(reg30[(2'h2):(1'h0)]) ?
                  wire7 : (~&($unsigned(wire11) ?
                      wire21[(3'h7):(2'h3)] : wire19[(4'ha):(4'h8)])));
              reg85 <= (($unsigned(((wire22 > (8'hab)) <= reg83)) ?
                  $unsigned(wire9) : ((reg83[(4'hd):(4'ha)] ?
                      (~&(8'ha1)) : {(8'hbb), wire20}) >> ($signed(reg13) ?
                      reg34 : {wire23, reg13}))) ~^ wire2);
              reg86 <= $unsigned((^~(^~wire22[(2'h2):(1'h0)])));
            end
          else
            begin
              reg84 <= ((!(~&(reg84[(2'h2):(2'h2)] ?
                  (wire0 == (8'ha5)) : $signed(reg81)))) <<< wire3[(2'h2):(1'h0)]);
              reg85 <= reg86[(1'h1):(1'h0)];
              reg86 <= wire73[(4'h8):(3'h6)];
            end
        end
      else
        begin
          if ($unsigned($signed(($unsigned($unsigned(reg78)) ?
              $unsigned($unsigned(wire4)) : wire4[(1'h0):(1'h0)]))))
            begin
              reg77 <= {$unsigned(wire5[(3'h5):(1'h0)])};
              reg78 <= ((+wire6) > ((~&$signed($signed(wire0))) | reg30));
              reg79 <= (wire18[(2'h3):(2'h2)] == ($unsigned((!reg83)) ?
                  (-$unsigned(((8'ha5) ? reg84 : wire7))) : (~|((-reg80) ?
                      $signed(wire25) : reg86[(2'h3):(2'h3)]))));
              reg80 <= $unsigned($unsigned((^{reg77})));
              reg81 <= wire18[(4'ha):(2'h3)];
            end
          else
            begin
              reg77 <= $signed(($signed(wire17) ?
                  (({reg86} ? $unsigned(wire19) : $unsigned(wire4)) ?
                      $unsigned($signed((8'hb1))) : ($unsigned(reg85) ?
                          $unsigned(wire73) : (^(8'ha9)))) : $unsigned(wire19)));
              reg78 <= ((((^~$unsigned(reg12)) ?
                  wire22 : (~&wire2[(2'h3):(1'h0)])) || reg26) < (^~reg86[(2'h2):(1'h0)]));
              reg79 <= (&$unsigned($signed({(wire23 ? reg84 : reg83)})));
            end
          if ((&$signed($unsigned($signed({wire5, wire2})))))
            begin
              reg82 <= {(|((7'h44) != wire11[(2'h3):(1'h1)]))};
              reg83 <= ((($unsigned(wire17) > $signed(wire25)) ?
                      wire1[(2'h3):(2'h3)] : $signed($signed(reg30))) ?
                  (reg84 ?
                      (|(reg26[(1'h1):(1'h1)] ?
                          {reg82} : wire10)) : $signed((~&(!reg83)))) : (reg82 | reg85));
              reg84 <= (!(~{wire8,
                  ($signed(reg14) ? (wire20 ? wire20 : wire4) : (8'ha1))}));
            end
          else
            begin
              reg82 <= ((~^((!$signed(wire3)) & $signed((&reg78)))) != ((wire15[(4'h8):(3'h7)] + $unsigned((wire19 || wire15))) >= ({$unsigned(wire16),
                  $signed(wire21)} > wire19[(3'h5):(2'h3)])));
              reg83 <= ((~^(~^wire5[(2'h2):(1'h1)])) || $signed($unsigned((~^(reg13 << reg31)))));
              reg84 <= $signed(($unsigned($signed(reg85)) ?
                  {(^wire15[(4'h9):(4'h9)])} : (((reg79 < (8'hb2)) == (^wire15)) ?
                      (&wire0[(2'h3):(1'h0)]) : reg84)));
              reg85 <= {(&reg78)};
            end
          reg86 <= (~&((reg33[(4'ha):(4'ha)] || $unsigned((+wire4))) ?
              (($unsigned(wire4) ^~ {(8'hb2)}) << $signed((reg78 ?
                  reg14 : wire18))) : reg82));
        end
      reg87 <= ($signed((reg29[(2'h3):(1'h1)] ?
          {{reg28, (8'hb9)}} : {(wire6 ? reg80 : wire19),
              (reg81 ? (7'h40) : wire16)})) ^ ($unsigned((~|$signed(wire11))) ?
          {$signed((~(8'hb0)))} : ((+{(8'hbe)}) >= {$signed((8'ha9)),
              {reg13, wire8}})));
    end
endmodule

module module35
#(parameter param71 = (((8'hb3) ? (~^{{(8'ha1)}, (~&(7'h42))}) : {(8'h9e), {((7'h41) + (8'hb0)), ((8'ha2) ? (8'h9c) : (8'hae))}}) || (((-{(8'ha1), (8'ha2)}) & (-((8'hb1) ? (8'hae) : (8'hb9)))) == {(~&((8'hb2) ? (7'h41) : (8'hb2)))})), 
parameter param72 = (!(-(~&param71))))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire40;
  input wire signed [(3'h5):(1'h0)] wire39;
  input wire [(4'ha):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  assign y = {wire70,
                 wire68,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg69,
                 reg67,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= wire40[(3'h6):(3'h5)];
      if ($signed((+$signed($unsigned($signed(wire40))))))
        begin
          if ((wire37 ?
              (~|(($signed((8'hb4)) ?
                  wire39 : (reg41 >>> wire40)) == $unsigned($unsigned(wire38)))) : reg41))
            begin
              reg42 <= (wire40 <<< $signed(reg41));
              reg43 <= ((($signed($unsigned(wire40)) ~^ $unsigned(((8'hbe) == wire38))) == wire39) || $signed((wire37 ?
                  (!(&reg42)) : wire40[(2'h2):(2'h2)])));
              reg44 <= reg41[(4'h9):(3'h6)];
            end
          else
            begin
              reg42 <= wire36[(1'h1):(1'h0)];
              reg43 <= wire39[(1'h0):(1'h0)];
              reg44 <= (((~&(wire37[(3'h7):(3'h5)] - $signed(reg41))) == reg43) ^~ ({(~|(~|reg44))} ?
                  {(&(reg43 ? wire40 : reg41))} : {reg42,
                      ($signed((8'ha8)) ?
                          reg42[(4'hf):(3'h7)] : ((7'h42) >> wire40))}));
              reg45 <= ($unsigned(($unsigned((reg43 > reg41)) ?
                  $unsigned($signed(wire36)) : ((wire37 <= reg42) << (wire38 > reg44)))) ^~ wire39);
              reg46 <= $unsigned($signed((wire39 ?
                  $signed((~|(8'ha4))) : reg43)));
            end
          reg47 <= reg43;
          reg48 <= wire37[(4'h8):(3'h4)];
          reg49 <= ({(&wire39), reg47} < $unsigned(($signed((wire40 ?
                  reg42 : reg43)) ?
              reg43[(3'h7):(1'h1)] : wire37[(4'hd):(1'h0)])));
          reg50 <= reg47[(2'h2):(2'h2)];
        end
      else
        begin
          if (reg41)
            begin
              reg42 <= wire37;
              reg43 <= $signed((($signed((+reg47)) < $signed((reg44 ?
                  reg45 : reg46))) >= $signed($signed($unsigned(reg47)))));
            end
          else
            begin
              reg42 <= (-$signed((7'h41)));
            end
          reg44 <= (wire36[(3'h6):(3'h5)] << ((&$unsigned(reg44)) & $signed($unsigned($unsigned((8'hb7))))));
          reg45 <= (|(8'hae));
          if (wire40)
            begin
              reg46 <= (reg48[(3'h4):(3'h4)] >= {(~&((reg43 ?
                      reg47 : (8'ha3)) >= (|reg43))),
                  $signed(reg41[(2'h2):(2'h2)])});
              reg47 <= reg47[(2'h2):(1'h1)];
              reg48 <= reg47[(1'h0):(1'h0)];
              reg49 <= wire39;
            end
          else
            begin
              reg46 <= {($unsigned(reg44) >> (-$unsigned((~^reg49))))};
              reg47 <= reg49;
            end
          reg50 <= (~|((8'hb8) || reg48));
        end
      reg51 <= (~reg50);
      if ((~wire39))
        begin
          reg52 <= reg45[(4'h9):(1'h0)];
          reg53 <= {($unsigned({{reg50, (8'hae)}}) | wire37[(2'h3):(1'h0)]),
              ($unsigned((reg48 ? (^reg46) : reg52)) || ($signed((reg49 ?
                  wire36 : (8'hb5))) && (wire36 >= {wire38})))};
          reg54 <= $signed((+{((~|(8'hb0)) * $unsigned(wire38)), reg42}));
        end
      else
        begin
          reg52 <= (+wire36[(1'h1):(1'h0)]);
          if ($unsigned(($unsigned({(reg47 < reg53),
              (8'had)}) ~^ $signed($signed($unsigned(reg52))))))
            begin
              reg53 <= (~^wire37);
            end
          else
            begin
              reg53 <= $signed(reg45[(4'h9):(4'h9)]);
              reg54 <= (&({{$signed(reg47), reg52[(4'he):(4'hc)]},
                      {(reg52 >= reg52)}} ?
                  {(8'ha4), reg41} : $signed((!((8'hb7) && reg45)))));
              reg55 <= (~^{(|reg43[(4'h9):(3'h7)])});
              reg56 <= {($unsigned((reg49[(3'h6):(3'h5)] ?
                          wire40 : reg49[(1'h1):(1'h0)])) ?
                      {wire40} : ($unsigned(reg50) + (~&(reg50 | reg50)))),
                  (|reg46)};
            end
          reg57 <= (8'ha9);
          reg58 <= ((({$unsigned(wire37)} ?
                      (~&$signed(wire40)) : (^~$unsigned(reg53))) ?
                  reg49 : $unsigned($unsigned({reg45}))) ?
              $signed(($unsigned((^~reg56)) ?
                  (~|(wire37 ?
                      reg56 : reg57)) : $unsigned(reg57[(3'h7):(1'h1)]))) : ($unsigned(reg52[(4'hd):(4'h9)]) ?
                  reg51[(4'h8):(1'h0)] : $signed(wire38)));
        end
      reg59 <= $signed(($unsigned(reg54[(3'h4):(1'h1)]) ?
          reg47 : (((~&reg51) ? (|(8'hbd)) : ((8'hb6) ? (8'ha7) : reg48)) ?
              reg53[(3'h6):(1'h0)] : ({(8'ha5)} ? reg56 : wire36))));
    end
  assign wire60 = ($signed($signed($signed((reg57 - reg53)))) >>> (~|reg44[(3'h4):(1'h1)]));
  assign wire61 = (reg59[(2'h3):(1'h0)] >>> {reg51});
  assign wire62 = $unsigned(wire38[(4'h9):(2'h3)]);
  assign wire63 = {(~|((&{reg45, reg43}) ?
                          ((&wire38) ?
                              $unsigned(reg48) : wire37[(3'h5):(1'h1)]) : reg41[(4'hb):(4'h8)]))};
  assign wire64 = reg55[(4'hb):(1'h0)];
  assign wire65 = ($signed((($signed((8'h9d)) == wire60) << ((reg52 && reg55) << $unsigned(reg48)))) ?
                      ($unsigned((~^reg50[(4'he):(4'he)])) ^ (!(&$signed((8'hb0))))) : (-$unsigned($unsigned($signed(reg55)))));
  assign wire66 = reg54;
  always
    @(posedge clk) begin
      reg67 <= reg47[(1'h1):(1'h1)];
    end
  assign wire68 = wire65[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg69 <= ($signed($unsigned($signed((~wire39)))) ?
          {{($signed(reg57) ^ (wire39 - wire60))},
              (reg47 ?
                  $signed($signed(reg57)) : $signed(reg45))} : wire61[(4'he):(2'h3)]);
    end
  assign wire70 = (8'haa);
endmodule
