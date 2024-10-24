module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h24d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire55;
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire87,
                 wire66,
                 wire65,
                 wire58,
                 wire57,
                 wire4,
                 wire32,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire55,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire2;
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg5 <= ((-({wire3[(5'h10):(3'h7)], (~&wire2)} ?
                  wire3[(2'h3):(1'h1)] : {wire2})) ?
              $unsigned((wire0[(1'h0):(1'h0)] ?
                  $unsigned($signed(wire1)) : $signed($signed((7'h40))))) : $unsigned($unsigned(wire2[(4'h8):(2'h3)])));
          reg6 <= $signed(wire2);
          reg7 <= wire4[(3'h7):(3'h4)];
          reg8 <= (((~|(reg5 && (wire3 ?
              reg5 : wire3))) >= $unsigned($signed(reg7))) >>> reg5);
          reg9 <= (($signed(wire0) ?
              {(wire4[(4'hb):(3'h4)] >>> (wire0 ?
                      wire2 : wire0))} : (8'h9e)) >> $unsigned(wire1[(4'hb):(2'h3)]));
        end
      else
        begin
          reg5 <= reg9;
        end
      reg10 <= ($unsigned((8'h9f)) | (~^wire0));
      reg11 <= reg8;
    end
  module12 #() modinst33 (wire32, clk, reg8, wire2, reg11, wire1);
  assign wire34 = ((($signed(wire32) >> wire3) ^~ (($unsigned(reg6) ~^ (wire32 >> wire4)) ^~ (~^(~^wire3)))) ?
                      (reg10[(2'h3):(1'h0)] ?
                          wire1[(4'h8):(2'h2)] : (($signed(reg10) - (reg10 ~^ (8'hbc))) ?
                              reg6 : ($signed(wire3) ?
                                  $unsigned(reg10) : (wire4 <<< (8'h9f))))) : $unsigned(reg10));
  assign wire35 = $unsigned($unsigned(((^$signed(wire4)) ?
                      $unsigned(reg6) : wire4)));
  assign wire36 = wire4;
  assign wire37 = (reg5 ^~ ($unsigned(wire36[(3'h5):(1'h1)]) ?
                      wire32[(3'h4):(1'h0)] : ($signed(reg7[(3'h7):(3'h5)]) ?
                          ({wire36,
                              wire2} <<< $unsigned((8'ha7))) : $signed({wire4,
                              wire35}))));
  assign wire38 = (($unsigned(reg6[(4'ha):(4'ha)]) == $signed(wire0[(2'h2):(1'h0)])) ?
                      reg9[(1'h0):(1'h0)] : $unsigned((~|wire32)));
  assign wire39 = (wire3[(4'hb):(2'h3)] ^~ ((+(+(8'ha1))) ?
                      wire35[(2'h3):(2'h2)] : wire37[(1'h0):(1'h0)]));
  assign wire40 = {$unsigned(reg8),
                      ({{{wire3}, {wire4, (7'h40)}},
                              {(^~reg6), (wire1 <= reg9)}} ?
                          reg7[(2'h2):(2'h2)] : reg9)};
  assign wire41 = (8'ha6);
  assign wire42 = (wire39[(2'h2):(1'h1)] ?
                      (|wire0[(3'h5):(3'h5)]) : (~(8'h9c)));
  module43 #() modinst56 (wire55, clk, wire42, wire0, reg8, reg5, wire37);
  assign wire57 = (8'hbd);
  assign wire58 = (((8'h9f) && wire1[(4'ha):(4'h8)]) ?
                      $signed($signed((^wire35))) : wire34[(4'hc):(4'h9)]);
  always
    @(posedge clk) begin
      reg59 <= wire2;
      if ((~|$signed(wire0[(2'h2):(1'h0)])))
        begin
          reg60 <= {(reg5 ?
                  ($signed(wire40[(1'h1):(1'h0)]) != wire4[(4'h9):(1'h0)]) : ((wire36[(1'h0):(1'h0)] >= {wire39,
                          (8'hbd)}) ?
                      wire42 : (wire38 ? $unsigned(reg10) : reg7))),
              ($signed(($unsigned(wire2) >> (-(8'hb9)))) ?
                  ((+(reg59 ?
                      reg10 : reg10)) & $unsigned(reg10[(3'h5):(1'h1)])) : ((wire57[(5'h10):(2'h3)] ?
                          (8'hbc) : wire4[(3'h7):(2'h2)]) ?
                      $unsigned((wire41 ? wire38 : reg5)) : ($signed(reg59) ?
                          (8'hae) : {wire42, (8'hbc)})))};
          reg61 <= ($signed({reg11}) ?
              $signed(wire37) : (!reg10[(4'hf):(3'h7)]));
          reg62 <= $signed($unsigned($unsigned(wire58)));
          reg63 <= ($signed(($unsigned((^(8'ha9))) ^ $signed((reg7 ?
                  (7'h43) : reg5)))) ?
              wire40 : wire39);
          reg64 <= reg63;
        end
      else
        begin
          if (((&($signed($signed((8'hb5))) ?
              ((-wire0) ?
                  ((8'ha9) ?
                      wire36 : (8'ha6)) : $unsigned(reg63)) : wire32[(2'h2):(1'h1)])) != wire41[(1'h0):(1'h0)]))
            begin
              reg60 <= $signed($signed({(wire55 ?
                      reg6[(3'h6):(2'h2)] : {wire36})}));
              reg61 <= wire35;
              reg62 <= reg59[(3'h6):(3'h6)];
            end
          else
            begin
              reg60 <= ($unsigned({((reg64 ^ (8'hb2)) ?
                      reg6[(1'h1):(1'h0)] : reg64)}) >= ($signed((wire35[(3'h5):(2'h3)] ?
                  (wire35 ? (8'haf) : wire58) : wire4)) ^ wire38));
              reg61 <= wire38[(3'h4):(2'h2)];
              reg62 <= (^~(wire57 ~^ reg64[(3'h5):(1'h1)]));
              reg63 <= $signed($unsigned((+$signed((^~reg62)))));
              reg64 <= $unsigned($unsigned(reg61));
            end
        end
    end
  assign wire65 = ($signed((&(+{wire39}))) & (^(|$unsigned($signed((8'had))))));
  assign wire66 = ($signed(((~$signed(reg6)) <= ((reg62 ?
                          wire0 : (8'hb0)) <<< (reg59 ? wire32 : (7'h41))))) ?
                      $signed({wire40}) : wire58[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      if ($signed((reg9[(4'ha):(2'h2)] && (wire1 ? wire4 : $signed((8'ha4))))))
        begin
          if ((|(~^(^~$signed(wire40[(1'h1):(1'h0)])))))
            begin
              reg67 <= (^~$signed((~|$signed($signed(reg5)))));
              reg68 <= {$unsigned(($signed($signed(wire35)) ?
                      (+$unsigned(wire35)) : reg62))};
            end
          else
            begin
              reg67 <= ({(8'hae), (reg8 ? {(wire38 * wire41)} : wire55)} ?
                  ((reg5[(3'h5):(1'h0)] ?
                          wire41[(4'h8):(3'h6)] : $unsigned((wire58 ?
                              reg59 : reg62))) ?
                      (^(8'had)) : $unsigned(((|wire58) ?
                          $signed(reg67) : {reg11}))) : wire37);
              reg68 <= (-($unsigned($unsigned(reg61[(3'h6):(2'h2)])) - (($signed(wire4) ?
                      wire34[(1'h1):(1'h0)] : $unsigned(wire41)) ?
                  reg6 : reg59[(2'h2):(1'h0)])));
              reg69 <= wire66;
            end
          if (wire32[(4'h8):(1'h1)])
            begin
              reg70 <= $signed(reg67[(1'h1):(1'h0)]);
              reg71 <= $signed(((reg6[(3'h4):(1'h0)] ~^ $unsigned($signed((8'hb8)))) + (~|wire40[(2'h2):(1'h1)])));
            end
          else
            begin
              reg70 <= (~^$signed((-reg59)));
              reg71 <= $signed($signed($unsigned({(wire41 ? reg68 : wire40),
                  wire1[(3'h4):(2'h3)]})));
              reg72 <= ({$unsigned((~&reg71))} ? wire55[(1'h0):(1'h0)] : reg10);
              reg73 <= (~&(({$unsigned(reg6)} ? {$signed(wire34)} : (8'haa)) ?
                  $signed({wire3[(4'ha):(4'h8)]}) : (((reg61 ?
                              wire41 : wire57) ?
                          $signed(reg6) : {wire39}) ?
                      wire37[(4'he):(4'he)] : reg70)));
              reg74 <= $signed(wire34);
            end
        end
      else
        begin
          reg67 <= reg61;
          reg68 <= (wire37 ?
              $signed(((+(wire66 || reg6)) ?
                  $unsigned($unsigned(reg62)) : (reg60 || reg62))) : {(($signed(reg5) ?
                      reg64[(3'h7):(3'h6)] : $signed(reg7)) << $signed($signed(wire42)))});
          if (reg67)
            begin
              reg69 <= $unsigned((8'ha3));
              reg70 <= ((!reg63) ? (|reg60) : (+(~&reg61[(4'he):(2'h3)])));
              reg71 <= (&(8'ha8));
              reg72 <= wire32;
            end
          else
            begin
              reg69 <= $unsigned((-($signed($unsigned(reg5)) ^ {$unsigned(wire32),
                  (wire41 >> (8'ha3))})));
              reg70 <= ((((~|(reg71 & wire35)) == wire41) ?
                      $unsigned(($signed((8'hbe)) ?
                          $unsigned(wire39) : $signed(wire0))) : $signed($unsigned((-reg8)))) ?
                  (8'hb4) : (!$signed({(reg9 - wire35), (reg64 ^~ reg72)})));
              reg71 <= wire36[(3'h6):(1'h1)];
              reg72 <= {reg69[(5'h12):(4'hf)]};
              reg73 <= $unsigned((8'h9d));
            end
          reg74 <= ($unsigned((8'ha7)) ?
              (wire3[(4'ha):(3'h6)] + $signed(((wire57 | reg74) ^~ wire55))) : wire57[(3'h6):(2'h2)]);
          reg75 <= (^reg71[(2'h3):(1'h0)]);
        end
      if (reg59[(3'h6):(3'h4)])
        begin
          reg76 <= $signed((reg6 ?
              $unsigned(((~wire36) ?
                  $signed(reg8) : {wire41, (7'h42)})) : {reg74,
                  $signed((&reg69))}));
          reg77 <= reg59;
        end
      else
        begin
          if ((((wire3[(5'h13):(5'h13)] << wire35[(3'h7):(3'h4)]) << $unsigned((((8'haf) ?
                  (8'hbd) : wire35) ?
              reg70[(1'h0):(1'h0)] : $unsigned(wire39)))) != $signed($unsigned(((wire55 >> reg68) ?
              wire66[(2'h2):(2'h2)] : wire1[(1'h0):(1'h0)])))))
            begin
              reg76 <= reg10;
            end
          else
            begin
              reg76 <= ($unsigned((~&$signed({wire32, reg70}))) ?
                  wire58 : (((wire57 ?
                          (wire0 ?
                              (8'hb5) : reg60) : $unsigned(wire42)) < ($signed(reg62) ?
                          {reg73} : $unsigned(reg69))) ?
                      (|(&wire38)) : $unsigned($signed(reg77))));
              reg77 <= (~^$unsigned(((~|$unsigned(reg6)) ?
                  wire66[(2'h2):(2'h2)] : (reg7[(3'h4):(3'h4)] ?
                      wire1 : wire4[(3'h6):(3'h6)]))));
              reg78 <= ({{{{reg11, reg59}, reg68[(2'h2):(1'h0)]}},
                  $signed($signed(wire41[(4'h8):(4'h8)]))} < wire66);
            end
          if ($unsigned(reg62[(3'h5):(1'h0)]))
            begin
              reg79 <= $unsigned({reg70});
            end
          else
            begin
              reg79 <= (wire41 ?
                  ({((reg71 == reg78) ? (&reg76) : $signed(wire32))} ?
                      (wire58 ?
                          ($signed(reg7) ^ ((8'hae) && reg73)) : wire37) : $unsigned($signed(((8'ha9) ?
                          reg70 : wire66)))) : $signed((((~wire1) << wire66[(1'h0):(1'h0)]) == ($unsigned(reg78) <= (7'h43)))));
              reg80 <= (|$signed($unsigned($unsigned($unsigned(reg73)))));
              reg81 <= (^~wire1[(4'hc):(4'hb)]);
              reg82 <= reg81;
              reg83 <= {$signed(($signed(reg7[(3'h4):(2'h3)]) <= reg82[(2'h3):(1'h1)])),
                  $unsigned(reg5)};
            end
        end
      reg84 <= $signed($unsigned(((~$signed(wire42)) | ((reg73 & reg8) ?
          {reg8, (8'hb3)} : reg10))));
      reg85 <= $signed($unsigned(($unsigned($signed(wire66)) <= {$unsigned(wire57)})));
      reg86 <= reg8;
    end
  assign wire87 = $signed($signed(wire65));
endmodule

module module43
#(parameter param53 = (({{((7'h40) ~^ (8'ha1))}, {(&(8'hac))}} <<< (~|(((8'ha0) > (8'ha3)) >> ((8'hb3) << (8'hbf))))) * (((((8'hb7) ? (8'h9e) : (8'hb3)) || ((8'hbd) && (8'ha0))) - (|(~&(8'hb7)))) ? ((+{(8'hb7)}) ? {((8'hbc) ? (8'h9c) : (8'hb1)), ((8'hb8) ? (8'hb8) : (7'h42))} : ((|(8'hbe)) ? ((8'ha9) ? (8'hbf) : (7'h41)) : ((7'h41) & (8'hb5)))) : (({(8'ha6)} | ((7'h44) - (8'ha3))) ? (~&((8'hbd) <= (8'hbb))) : (((8'h9f) ? (8'ha9) : (8'haa)) ? ((8'h9c) | (8'had)) : ((7'h40) ? (8'ha6) : (8'hb7)))))), 
parameter param54 = (8'hb8))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire48;
  input wire signed [(2'h3):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire [(4'hc):(1'h0)] wire45;
  input wire [(5'h11):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  assign y = {wire52, wire51, wire50, wire49, (1'h0)};
  assign wire49 = (~&wire48[(3'h5):(3'h5)]);
  assign wire50 = (~&$signed((((wire45 ? wire45 : wire48) ?
                      (wire46 ?
                          wire49 : (8'hbf)) : (wire49 || (8'hb2))) || ((8'hb9) ?
                      (^~wire49) : $signed((8'hac))))));
  assign wire51 = wire48[(4'he):(4'h9)];
  assign wire52 = wire47[(1'h1):(1'h1)];
endmodule

module module12
#(parameter param31 = ((({((8'hb8) ^~ (8'ha0))} * (((8'hb9) ~^ (8'hab)) ? ((8'hac) >> (8'ha7)) : (~|(8'hae)))) >>> (&((~^(8'hbf)) && ((8'h9c) * (8'hb4))))) + (8'hbb)))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire23,
                 wire22,
                 reg25,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= ({{(|wire14)},
          $signed(wire14[(4'ha):(3'h7)])} * ($signed({wire13}) ?
          {$unsigned({wire15, wire14}), wire15} : wire16[(4'hb):(2'h3)]));
      reg18 <= (($unsigned($signed(wire15[(5'h10):(4'h9)])) ~^ ((8'haf) ?
              wire13[(4'h9):(3'h7)] : $signed((wire14 ? wire14 : wire14)))) ?
          {wire13[(4'hf):(4'h8)],
              wire16} : {(wire13 && $signed($signed(reg17))), wire14});
      reg19 <= $signed(((wire16[(2'h3):(1'h0)] ?
          ($signed(wire16) - $signed(wire15)) : wire13[(4'hf):(4'hf)]) * $signed({(~^reg17),
          (8'hb1)})));
      reg20 <= wire14[(4'he):(4'hc)];
      reg21 <= reg18[(5'h11):(3'h6)];
    end
  assign wire22 = (((!reg17) ?
                      reg17[(4'hd):(3'h7)] : {wire14}) - (^~($signed(wire14[(4'hd):(1'h1)]) >>> reg18[(4'hd):(3'h7)])));
  assign wire23 = {((wire14 ?
                              ({reg18} ?
                                  ((8'hac) >>> wire16) : $signed(wire14)) : wire16) ?
                          $signed({(|wire22)}) : ({((8'hb0) + wire16)} || $signed((wire22 ?
                              wire13 : wire13))))};
  assign wire24 = ($signed((((wire16 - (8'ha7)) | {wire22}) != $unsigned($unsigned(wire22)))) ?
                      reg21[(3'h7):(2'h3)] : $unsigned($unsigned($unsigned((wire23 ?
                          wire23 : wire16)))));
  always
    @(posedge clk) begin
      reg25 <= wire24[(2'h2):(1'h0)];
    end
  assign wire26 = $unsigned({reg20[(3'h6):(2'h2)], wire13[(4'h8):(2'h2)]});
  assign wire27 = (^reg17);
  assign wire28 = $signed($unsigned($signed((8'hbd))));
  assign wire29 = wire28[(3'h4):(3'h4)];
  assign wire30 = $unsigned((8'ha3));
endmodule
