module top
#(parameter param66 = ((&(~^(((8'hb8) ? (8'hac) : (8'ha9)) > ((8'haa) ? (8'hb6) : (7'h41))))) != (&{(((8'ha0) ? (8'hbb) : (7'h41)) ? (~&(8'hb3)) : (~^(8'haa))), (~((8'hb7) >> (8'ha8)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire23,
                 wire22,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg62,
                 reg61,
                 reg60,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire5 = wire4[(4'hb):(3'h4)];
  assign wire6 = (+(wire1[(5'h15):(1'h0)] < wire4[(3'h6):(3'h5)]));
  assign wire7 = ({wire4, wire4[(3'h4):(2'h3)]} & $signed((~$unsigned(((8'hba) ?
                     wire6 : wire2)))));
  assign wire8 = $unsigned((~wire7[(3'h7):(2'h2)]));
  assign wire9 = ($unsigned($signed(((^~wire0) << $unsigned(wire7)))) ?
                     wire1[(3'h6):(2'h2)] : wire0);
  always
    @(posedge clk) begin
      reg10 <= ((wire2[(4'he):(4'h8)] ?
          $signed(wire0[(4'hb):(4'ha)]) : wire1) >>> (~^({wire1[(4'ha):(3'h5)]} ?
          $unsigned((~|wire4)) : $unsigned(wire4))));
      if ($unsigned(((~|((wire6 <= wire2) ~^ wire2[(3'h7):(3'h4)])) <<< {wire0[(4'he):(4'h8)],
          wire1[(4'he):(3'h6)]})))
        begin
          reg11 <= (~|$signed(({(wire7 ? wire0 : wire0), $unsigned(wire9)} ?
              ($unsigned(wire8) >>> $unsigned(wire9)) : ((reg10 || reg10) ?
                  {wire3} : $unsigned(wire6)))));
          if (($signed(wire7) <<< ((-wire7[(1'h0):(1'h0)]) >= (wire4[(4'he):(1'h1)] ?
              wire8 : wire3[(2'h3):(1'h0)]))))
            begin
              reg12 <= (wire8[(5'h15):(4'ha)] ^~ (8'ha1));
              reg13 <= wire7;
            end
          else
            begin
              reg12 <= {(^wire6)};
              reg13 <= wire5[(2'h2):(1'h1)];
              reg14 <= ($unsigned(($unsigned(((8'hb8) >>> wire2)) >= $unsigned($signed(wire9)))) ?
                  ((((wire9 & wire9) ^ (8'hae)) ?
                      ((~^(8'h9c)) ?
                          $signed((8'ha8)) : reg10[(1'h0):(1'h0)]) : ($signed(wire6) ?
                          wire0 : wire6[(4'hb):(2'h2)])) ^ ((~&$unsigned(wire1)) < (~$unsigned(wire1)))) : $unsigned(reg12));
            end
        end
      else
        begin
          reg11 <= (|(~(~|($unsigned(wire6) ~^ (wire3 * reg10)))));
          reg12 <= wire4[(4'h9):(3'h4)];
          reg13 <= (&(-wire1));
          reg14 <= ($signed(($unsigned((wire0 ? wire0 : wire7)) <= (|wire6))) ?
              $unsigned($unsigned(reg12[(4'h9):(3'h7)])) : $unsigned((!(~|$unsigned(wire2)))));
        end
      if (wire9)
        begin
          reg15 <= $unsigned((~&{reg10[(4'hc):(3'h5)], reg14}));
          reg16 <= ($unsigned({$unsigned(reg12),
                  ({wire9, reg11} ?
                      ((8'ha5) ? wire5 : wire9) : $unsigned(wire2))}) ?
              {wire4} : $unsigned(((&$unsigned(wire2)) < (~&wire8))));
          reg17 <= wire4;
          reg18 <= wire4;
          reg19 <= $unsigned(wire6);
        end
      else
        begin
          reg15 <= reg14;
          reg16 <= reg18;
          reg17 <= ((|(~&reg10)) ?
              reg13[(3'h4):(1'h1)] : (~&(($signed(reg15) ?
                  ((7'h44) ?
                      reg11 : (8'ha0)) : wire5[(4'h9):(2'h3)]) || ((wire2 - (8'had)) ?
                  $signed(wire1) : wire2[(5'h13):(1'h0)]))));
          reg18 <= $unsigned($signed((wire8 & (wire4 ?
              $signed(reg17) : $unsigned(wire8)))));
        end
      reg20 <= (+(wire0 ?
          ($signed(((8'ha2) != wire1)) ?
              $unsigned($unsigned(reg15)) : {(wire5 - wire2)}) : $signed((wire9[(5'h10):(4'hc)] >>> wire2[(3'h5):(2'h3)]))));
      reg21 <= ($signed(reg15) ?
          wire7[(4'hb):(2'h2)] : $signed($signed(reg10[(4'hf):(3'h7)])));
    end
  assign wire22 = wire3;
  assign wire23 = (($signed($signed((reg14 >= wire22))) ?
                      ($unsigned((^wire9)) ^~ $unsigned(reg10[(3'h5):(1'h1)])) : (wire6[(3'h5):(3'h4)] * ((reg16 * reg13) > wire1[(2'h3):(2'h3)]))) & wire2[(4'he):(3'h4)]);
  module24 #() modinst53 (wire52, clk, reg11, wire4, wire5, reg12, reg14);
  assign wire54 = wire8[(4'h9):(4'h8)];
  assign wire55 = (~^(((8'ha5) ? (!wire9) : wire3[(3'h4):(1'h1)]) - (reg15 ?
                      wire22[(4'ha):(4'ha)] : ($signed(reg10) <<< $signed((8'hb3))))));
  assign wire56 = reg17[(4'ha):(2'h2)];
  assign wire57 = (($signed($unsigned($unsigned((8'hb2)))) ?
                          ((~reg17[(1'h0):(1'h0)]) ?
                              wire8[(5'h13):(1'h0)] : wire5[(3'h6):(1'h1)]) : $unsigned((wire6[(1'h0):(1'h0)] ?
                              (&wire22) : $signed(reg19)))) ?
                      $signed((($unsigned(wire4) - wire55) ?
                          ((^wire9) ?
                              $unsigned(wire7) : (reg13 >= wire9)) : wire5[(4'h8):(3'h4)])) : ((~wire1[(4'hd):(1'h0)]) - $signed((7'h42))));
  assign wire58 = $signed((wire56 ?
                      $signed((~|wire55)) : $signed($signed($unsigned(reg19)))));
  assign wire59 = (wire4 <<< $signed(wire54));
  always
    @(posedge clk) begin
      reg60 <= (!reg15);
      reg61 <= {((^~wire56[(2'h2):(1'h1)]) ?
              {{wire7, (reg20 ? wire54 : wire8)}} : (!{(~|reg20),
                  (wire1 ? wire22 : wire54)}))};
      reg62 <= (!reg18[(5'h10):(4'h9)]);
    end
  assign wire63 = (((&reg19[(3'h7):(1'h1)]) ?
                      $signed(wire59) : {(reg16 >> (!reg21)),
                          ($signed(wire56) ?
                              (reg19 << (8'h9f)) : {wire1,
                                  wire1})}) << (&wire1[(2'h3):(2'h2)]));
  assign wire64 = (({wire55, $unsigned((-wire2))} ?
                      $signed($unsigned(wire0)) : (-$unsigned(wire5))) >> {(-$unsigned(wire63))});
  assign wire65 = (~&(!wire9[(4'hf):(1'h1)]));
endmodule

module module24
#(parameter param51 = ((({(8'hac)} + ({(8'hae), (8'hbf)} == (~^(8'hb1)))) != (8'hbe)) ? ({(((8'ha4) ? (8'ha0) : (8'hbe)) ? ((8'hba) ? (8'hbe) : (8'had)) : (!(7'h44)))} && {(|{(8'haa), (8'haa)})}) : (-{(((8'hbb) == (8'hbd)) ? {(8'hb0)} : (^(8'h9d))), ((^~(8'had)) * ((8'had) * (8'h9c)))})))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  input wire signed [(4'h9):(1'h0)] wire27;
  input wire [(3'h5):(1'h0)] wire26;
  input wire [(3'h5):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 (1'h0)};
  assign wire30 = $signed({{(~|(wire27 ? wire25 : wire29)), (8'hb5)},
                      (^~wire29)});
  assign wire31 = {wire28[(2'h3):(1'h1)], wire25};
  assign wire32 = $signed({wire30[(4'h9):(3'h6)]});
  assign wire33 = (($signed((^{wire29})) >>> $unsigned(($signed(wire27) ?
                          (wire32 ? wire30 : wire29) : wire27))) ?
                      (~&(((wire30 ? wire32 : wire32) ?
                              (-wire31) : $signed(wire32)) ?
                          $signed({wire30}) : wire25[(3'h5):(3'h5)])) : $signed($signed(wire32[(4'h9):(2'h3)])));
  assign wire34 = $signed(((~|wire26[(1'h0):(1'h0)]) && (|$unsigned((~wire33)))));
  assign wire35 = {(8'hac)};
  assign wire36 = $unsigned((~wire30[(3'h4):(3'h4)]));
  assign wire37 = (!$unsigned(wire25));
  assign wire38 = $unsigned($signed(wire37));
  assign wire39 = (~($signed({$unsigned(wire32)}) - $unsigned($signed((wire37 | wire32)))));
  assign wire40 = ($signed((wire38[(2'h3):(2'h2)] ^ ($signed(wire35) ?
                          wire33 : wire37[(1'h1):(1'h0)]))) ?
                      ({(|wire33[(2'h2):(2'h2)])} ?
                          wire32 : $unsigned(wire35[(4'h8):(3'h7)])) : ($signed(($unsigned(wire38) >>> wire27[(3'h7):(1'h1)])) ?
                          (((&wire36) ?
                                  (wire27 ? wire25 : wire29) : (|(8'haa))) ?
                              wire29[(3'h4):(1'h1)] : wire33) : (~$unsigned((wire32 && wire25)))));
  assign wire41 = {(~|($unsigned(((7'h42) == (8'hba))) >> $unsigned((wire27 ?
                          wire27 : wire35)))),
                      $signed($signed(wire26[(3'h4):(2'h3)]))};
  assign wire42 = wire32;
  assign wire43 = (!$signed(wire25));
  assign wire44 = (wire32[(3'h7):(3'h5)] ?
                      $unsigned(wire31) : wire28[(2'h2):(1'h0)]);
  assign wire45 = ({(wire42 != wire34[(1'h1):(1'h1)])} ?
                      {wire28, wire40} : {$signed($signed((~|wire39))),
                          wire37[(1'h1):(1'h1)]});
  assign wire46 = ({$unsigned($unsigned((-wire34))),
                      wire42[(1'h1):(1'h0)]} && (!($signed($unsigned((7'h41))) | {(wire31 & wire26)})));
  assign wire47 = wire25[(1'h1):(1'h0)];
  assign wire48 = $unsigned(($signed({$unsigned(wire45)}) ? wire46 : (8'hbe)));
  assign wire49 = $signed($unsigned(($unsigned($unsigned(wire29)) && (~^wire43[(4'h8):(3'h7)]))));
  assign wire50 = $signed(wire49);
endmodule
