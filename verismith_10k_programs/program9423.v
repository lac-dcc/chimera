module top
#(parameter param89 = {(8'hb1), {(8'hbb), (((+(8'h9c)) ? ((7'h42) ? (8'hab) : (8'hba)) : ((8'ha0) ? (8'ha8) : (7'h42))) ? {(^~(8'hba))} : ((&(8'ha0)) + (~(8'hb4))))}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire59;
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire76,
                 wire75,
                 wire61,
                 wire4,
                 wire8,
                 wire9,
                 wire10,
                 wire59,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 reg64,
                 reg63,
                 reg62,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  assign wire4 = wire3[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= ($unsigned((wire0 ?
              ((^~wire4) < wire3[(3'h7):(1'h1)]) : $unsigned((wire3 ?
                  wire3 : wire1)))) ?
          (&(7'h43)) : (wire1 ?
              (~|({reg5, (8'ha2)} ?
                  $signed(reg5) : $unsigned(reg5))) : wire4[(3'h7):(3'h5)]));
      reg7 <= wire3;
    end
  assign wire8 = {(^~$unsigned($signed($unsigned((8'ha5)))))};
  assign wire9 = {$signed($unsigned((^(reg7 ? reg5 : (8'hae))))),
                     ($unsigned((wire2 | $unsigned(reg6))) > $unsigned(((wire2 ~^ reg6) ?
                         (wire2 && (8'h9c)) : (reg7 ? wire3 : (7'h40)))))};
  assign wire10 = (~|((reg6 ^ {(~^wire3),
                      wire0[(4'hf):(3'h7)]}) ~^ ((~(-(8'ha8))) != {wire1,
                      reg6})));
  module11 #() modinst60 (wire59, clk, wire10, reg6, wire2, wire8);
  assign wire61 = {(wire4[(3'h5):(1'h0)] - wire0)};
  always
    @(posedge clk) begin
      reg62 <= ((reg5[(2'h3):(2'h2)] ?
          {($signed(reg5) ? $signed((8'h9c)) : (wire61 < reg5)),
              $unsigned({wire3})} : wire10) << $unsigned((wire1[(4'ha):(4'h8)] ?
          $unsigned(wire61) : wire8[(3'h4):(3'h4)])));
      reg63 <= (((|(8'hbc)) * {reg6[(3'h5):(2'h3)],
          (~^(wire59 ^ wire3))}) * (~^(&{(wire0 || (8'hb3))})));
      if ($unsigned(wire10))
        begin
          if (wire59)
            begin
              reg64 <= (wire61 >> reg5[(3'h4):(1'h0)]);
              reg65 <= (!wire2);
            end
          else
            begin
              reg64 <= (-$unsigned($signed(((reg5 ? reg6 : reg65) ?
                  $unsigned((8'hba)) : (wire3 >> reg63)))));
              reg65 <= (~(wire2 ?
                  (((-reg65) ? reg64[(1'h1):(1'h1)] : $unsigned(reg62)) ?
                      (~|(reg65 ?
                          wire8 : wire0)) : $unsigned($unsigned(wire3))) : (~&{wire0[(1'h1):(1'h0)]})));
              reg66 <= reg64;
              reg67 <= (wire1[(1'h1):(1'h1)] < wire3);
            end
          reg68 <= (({wire9[(1'h0):(1'h0)]} ?
              $unsigned(reg64) : wire10[(3'h7):(3'h4)]) & ($signed((wire59 ^ (8'hb9))) != $signed(reg64)));
          reg69 <= wire4;
          if ((~|((+$signed((~&reg5))) ?
              (wire1[(4'h9):(2'h2)] << wire1) : $signed(wire4[(2'h3):(1'h0)]))))
            begin
              reg70 <= (wire0 != (~|{$signed((reg68 ? reg5 : reg69))}));
            end
          else
            begin
              reg70 <= ((-(~^(wire59 ^~ $unsigned(reg62)))) ?
                  ((wire4[(4'ha):(3'h5)] >>> ((reg7 ? wire9 : wire59) ?
                      (reg69 ?
                          reg63 : reg62) : $signed(wire10))) < $signed(wire61[(4'h8):(4'h8)])) : reg66[(1'h1):(1'h0)]);
              reg71 <= reg68;
              reg72 <= wire59[(2'h3):(2'h2)];
              reg73 <= (|($signed({(wire4 ?
                      (8'hb3) : wire3)}) * $signed(({reg66, (8'ha6)} ?
                  $signed((8'hbf)) : reg65))));
            end
        end
      else
        begin
          reg64 <= reg64;
          reg65 <= ((+(wire61 ?
              ($unsigned(reg68) + (wire4 << reg70)) : ((^~wire4) <<< reg7[(4'he):(3'h7)]))) ~^ reg6);
          reg66 <= (8'hb5);
          reg67 <= ({reg65,
                  $unsigned(((wire1 ? reg73 : reg67) & (wire1 ?
                      wire9 : reg65)))} ?
              {$signed(reg69[(2'h2):(1'h1)]),
                  (reg67[(4'hd):(4'h9)] == {$signed(reg69),
                      (reg68 * reg7)})} : $signed(($signed($signed(reg64)) ?
                  ($unsigned(reg65) ? reg70 : reg5) : reg63)));
          reg68 <= $unsigned(reg6);
        end
      reg74 <= {((-(reg71[(4'hc):(2'h3)] ?
              ((8'hab) | (7'h41)) : (reg67 <<< reg64))) >= (reg66 ?
              $unsigned((reg69 << (8'ha0))) : ((reg70 ?
                  (8'hba) : wire2) <= (~|reg68))))};
    end
  assign wire75 = {(((~^$unsigned(wire61)) ?
                          (|reg64[(2'h2):(1'h1)]) : {wire10,
                              $unsigned((8'h9c))}) >> (&wire9[(1'h0):(1'h0)])),
                      $unsigned(wire4[(4'hb):(3'h6)])};
  assign wire76 = reg70;
  always
    @(posedge clk) begin
      reg77 <= (reg5[(1'h0):(1'h0)] ?
          $unsigned($signed((8'haa))) : ($unsigned(reg63[(3'h7):(3'h7)]) ?
              {wire8} : reg68));
      reg78 <= wire76;
      if (((~^$unsigned(wire1[(3'h7):(1'h0)])) ?
          reg78[(2'h3):(2'h2)] : (+($unsigned((reg65 ? (8'hb1) : wire0)) ?
              wire76 : (^(&wire4))))))
        begin
          reg79 <= ($signed((!((wire59 <= reg73) && wire61))) >= ($signed((-reg69)) ^~ reg6[(2'h2):(1'h1)]));
          if ($signed((8'ha2)))
            begin
              reg80 <= $unsigned(reg79[(3'h6):(3'h6)]);
              reg81 <= reg77;
              reg82 <= ({{reg78},
                  $signed(reg81)} != $signed((!((~^wire0) || wire9))));
              reg83 <= (reg68[(3'h4):(3'h4)] * $unsigned({{(reg7 || reg65),
                      $signed(wire61)},
                  (+(!(8'ha7)))}));
              reg84 <= $signed({reg82[(2'h2):(1'h0)]});
            end
          else
            begin
              reg80 <= ($unsigned(reg83[(4'h8):(1'h1)]) ?
                  (($unsigned((~(8'hbe))) && $unsigned((reg65 ?
                          (8'ha4) : (8'hb8)))) ?
                      (~&$signed((reg62 ?
                          (8'hb4) : reg74))) : ((wire10[(4'ha):(3'h6)] ?
                              reg7 : (reg7 != reg83)) ?
                          reg81[(2'h2):(2'h2)] : $signed(reg66))) : ($signed((^~wire2)) & wire3[(4'ha):(4'h8)]));
              reg81 <= ($unsigned(((8'ha7) ?
                  ((reg7 ? (8'ha9) : reg5) ?
                      reg6 : $signed(wire76)) : reg5[(2'h3):(2'h2)])) < wire61[(2'h3):(2'h2)]);
              reg82 <= (~^($unsigned((^~$signed(reg71))) >> reg64[(3'h4):(2'h3)]));
              reg83 <= (~|((~reg70[(1'h1):(1'h0)]) ?
                  {$unsigned(reg78)} : $signed(wire0)));
              reg84 <= $unsigned((8'hbb));
            end
        end
      else
        begin
          reg79 <= (~&(~&$signed(((~&wire0) ? (8'ha2) : (&wire3)))));
          if ({wire76, (~&$signed(((~&wire75) + (wire2 >>> reg74))))})
            begin
              reg80 <= reg72[(4'ha):(3'h5)];
            end
          else
            begin
              reg80 <= reg79;
            end
          reg81 <= $unsigned((8'hab));
        end
      reg85 <= wire8[(4'ha):(3'h7)];
    end
  assign wire86 = {reg85,
                      ({reg69, (^~reg79)} & $signed(((reg64 ?
                          reg70 : reg79) || $unsigned(wire0))))};
  assign wire87 = wire61[(4'ha):(4'h9)];
  assign wire88 = $signed($signed($unsigned($signed(((8'hbe) ?
                      reg73 : reg71)))));
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire15;
  input wire [(3'h5):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  assign y = {wire58, wire57, wire55, wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = wire14[(3'h4):(2'h2)];
  assign wire17 = $unsigned((wire14[(2'h2):(1'h1)] ?
                      (~wire12) : $signed(((wire14 * wire13) <= wire12))));
  assign wire18 = {(wire16[(3'h7):(1'h1)] ~^ wire17),
                      $unsigned(wire12[(1'h0):(1'h0)])};
  assign wire19 = {(~$unsigned(($signed(wire12) ?
                          $signed((8'h9d)) : $unsigned(wire13)))),
                      (~($unsigned((!wire13)) & ({wire16, wire15} ?
                          {wire17, wire12} : (^wire15))))};
  module20 #() modinst56 (wire55, clk, wire18, wire13, wire16, wire15);
  assign wire57 = wire13[(1'h1):(1'h1)];
  assign wire58 = ((8'hb6) ?
                      $signed((wire55[(4'he):(2'h2)] & $signed(wire16))) : (wire15 ~^ ((+(&(7'h42))) ?
                          wire14 : wire16[(4'hb):(1'h1)])));
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire signed [(2'h3):(1'h0)] wire23;
  input wire [(3'h4):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
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
                 (1'h0)};
  assign wire25 = (&$unsigned(wire21[(3'h4):(3'h4)]));
  assign wire26 = ((~^($signed((8'hb3)) ?
                          (~&(wire25 * wire22)) : (^(wire25 ?
                              wire21 : wire21)))) ?
                      wire21 : $signed((+wire22)));
  assign wire27 = wire22[(1'h1):(1'h0)];
  assign wire28 = {wire25[(4'he):(4'hb)]};
  assign wire29 = ($unsigned($unsigned(((wire23 ? wire27 : (8'ha5)) ?
                      $unsigned(wire22) : $signed(wire25)))) <<< (-(wire26 ?
                      wire25 : $signed($signed(wire23)))));
  assign wire30 = (($signed(($unsigned(wire21) ?
                          wire25[(4'hd):(1'h0)] : wire21[(4'h9):(3'h5)])) ?
                      $signed((!((8'haf) ? wire29 : wire28))) : {((~wire22) ?
                              {wire24} : $unsigned((8'hae)))}) - wire29[(3'h5):(1'h0)]);
  assign wire31 = ((wire30 >>> (wire23 ?
                      (|(8'hac)) : $unsigned((~(8'ha4))))) << wire22);
  always
    @(posedge clk) begin
      if (wire28[(4'h9):(2'h3)])
        begin
          reg32 <= wire27;
          reg33 <= $signed({wire28, (~&$unsigned($signed(wire27)))});
          reg34 <= {$unsigned($signed(({wire29, wire24} + (wire27 & wire23)))),
              (^(^(|wire21)))};
          reg35 <= reg32[(4'h8):(3'h6)];
        end
      else
        begin
          if ($unsigned(((wire26 ?
                  ($unsigned((8'hb3)) < (reg32 ^~ wire21)) : $signed((wire23 ?
                      reg34 : (8'hac)))) ?
              reg34[(1'h0):(1'h0)] : ((~((8'h9e) >>> wire28)) ?
                  ((|wire28) ^ {(8'h9f),
                      (8'ha9)}) : $signed(wire22[(1'h1):(1'h0)])))))
            begin
              reg32 <= $signed($unsigned((((wire28 < wire21) * (~wire23)) * $unsigned((|wire21)))));
              reg33 <= (wire22 <<< $signed(wire23));
            end
          else
            begin
              reg32 <= wire23[(1'h1):(1'h1)];
            end
          reg34 <= $unsigned((~&(^~(-{wire26, wire24}))));
          if ($signed(reg34[(1'h0):(1'h0)]))
            begin
              reg35 <= ((wire22 ? reg32[(4'ha):(1'h0)] : wire31) ^ {reg32,
                  wire21[(4'ha):(2'h2)]});
              reg36 <= ($unsigned($signed((^$unsigned(wire29)))) ?
                  {(+(8'hbb)), wire31[(1'h1):(1'h0)]} : (wire25[(4'ha):(1'h0)] ?
                      $signed((-reg35)) : (8'hac)));
              reg37 <= $signed((wire21[(4'hb):(3'h7)] ?
                  $unsigned(((wire21 ? (7'h43) : wire26) ?
                      (8'ha7) : $unsigned(wire28))) : $unsigned({wire31})));
              reg38 <= (wire31 ?
                  ($unsigned(reg33[(3'h5):(3'h4)]) ?
                      (7'h42) : (((wire21 <<< wire24) ?
                              $unsigned(wire29) : (wire25 ? (8'ha3) : reg36)) ?
                          (~&(~&(8'ha9))) : (7'h43))) : reg32[(4'h9):(4'h8)]);
            end
          else
            begin
              reg35 <= wire23[(2'h3):(2'h2)];
              reg36 <= wire29;
              reg37 <= reg36[(2'h2):(1'h1)];
            end
          reg39 <= wire23[(2'h3):(2'h2)];
          reg40 <= $unsigned((!(~|$unsigned((wire27 + reg39)))));
        end
      reg41 <= {reg33[(1'h0):(1'h0)]};
      reg42 <= (wire22 ?
          (^reg32[(4'ha):(2'h2)]) : $signed((wire28 ?
              ($unsigned(reg40) <<< (wire27 <<< wire21)) : $unsigned(reg40))));
      reg43 <= ((reg33[(4'h9):(2'h2)] ?
              ({(reg41 < wire28), $unsigned(wire26)} ?
                  $signed($signed(reg40)) : $signed($unsigned(reg38))) : $signed((^~wire29))) ?
          wire25[(4'h8):(2'h3)] : (($signed((wire29 >>> reg42)) ?
                  ((reg39 - reg42) ?
                      wire27 : (^reg40)) : reg32[(3'h7):(3'h6)]) ?
              reg41[(1'h0):(1'h0)] : {reg33[(4'h8):(1'h0)]}));
      reg44 <= $unsigned((((&(+reg33)) ? wire30 : {(8'hb7), $signed(wire31)}) ?
          wire21 : (reg38 ? $signed({reg33}) : wire30)));
    end
  assign wire45 = ($signed((!((reg37 ?
                      reg32 : reg43) <= (reg37 >> wire23)))) - ($signed(reg39) ?
                      wire28[(4'h9):(4'h9)] : $unsigned($signed($signed((7'h42))))));
  assign wire46 = wire24[(2'h3):(2'h2)];
  assign wire47 = $signed($signed($signed((~^(-wire22)))));
  assign wire48 = $signed((wire29[(3'h5):(3'h5)] ?
                      reg34[(1'h1):(1'h0)] : (-reg40)));
  assign wire49 = $unsigned($signed({$unsigned((~|wire29)), {(8'hb1)}}));
  assign wire50 = {reg39};
  assign wire51 = ($unsigned($signed($unsigned(reg34[(1'h1):(1'h0)]))) < $unsigned(($unsigned((8'hab)) ?
                      (reg37 == (~^wire31)) : (8'hbc))));
  assign wire52 = (&$unsigned((wire23[(1'h0):(1'h0)] ?
                      wire27[(4'ha):(2'h2)] : ((wire28 > reg40) >= reg40[(3'h5):(3'h4)]))));
  assign wire53 = reg36[(4'h9):(4'h8)];
  assign wire54 = wire27;
endmodule
