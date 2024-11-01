module top
#(parameter param71 = (^~(({((8'h9f) ? (8'ha5) : (8'hae))} | (8'hb0)) ? (^(((8'hb2) ^~ (8'hb1)) ? (8'hbd) : ((8'hb1) ? (8'hb9) : (8'hbe)))) : ((((7'h44) - (8'ha1)) >= (8'hbc)) - (|(7'h40))))), 
parameter param72 = {({param71} ? param71 : (((param71 ? param71 : (8'hb3)) ~^ (param71 <<< param71)) > param71))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire37;
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire55,
                 wire54,
                 wire50,
                 wire48,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire25,
                 wire37,
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
                 reg53,
                 reg52,
                 reg51,
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
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire5 = (-(($unsigned((wire3 - wire3)) > ($signed(wire1) != (wire4 << (7'h44)))) ?
                     $unsigned(wire0[(3'h5):(1'h1)]) : wire4[(3'h5):(3'h4)]));
  assign wire6 = (($unsigned($unsigned((+wire5))) || (|$unsigned((wire2 ?
                     wire3 : wire0)))) != wire1[(1'h1):(1'h1)]);
  assign wire7 = (({wire6} - (~wire5)) ?
                     wire5[(3'h4):(1'h0)] : ((!(+wire4[(3'h4):(1'h0)])) ~^ ({$signed(wire4),
                             wire6[(2'h2):(2'h2)]} ?
                         $unsigned(wire4) : ((wire3 ?
                             wire1 : wire0) + $signed(wire3)))));
  assign wire8 = wire6;
  assign wire9 = $unsigned((~(!{wire1, ((8'hba) ? wire0 : wire7)})));
  always
    @(posedge clk) begin
      if ({$signed((({wire0, wire1} ?
              {wire1} : wire4[(3'h7):(3'h6)]) && ((~&(8'ha1)) ?
              ((8'h9f) ? wire5 : wire1) : ((8'ha3) ? wire0 : wire3))))})
        begin
          reg10 <= (|((&wire5) >>> $signed((-$signed(wire7)))));
          if ($unsigned((~$signed(wire2[(3'h5):(1'h0)]))))
            begin
              reg11 <= wire1;
            end
          else
            begin
              reg11 <= $unsigned($signed($signed(wire5[(3'h4):(2'h2)])));
              reg12 <= wire0;
              reg13 <= ({wire7} ?
                  (wire7[(3'h6):(3'h4)] ?
                      (~((reg10 ? wire2 : reg11) ?
                          (wire4 ^~ wire1) : reg10[(2'h3):(1'h1)])) : $signed($unsigned((wire3 ?
                          wire2 : (8'hbc))))) : $signed(({$unsigned(wire7),
                          (wire9 ? wire5 : reg12)} ?
                      $unsigned($unsigned(reg11)) : $unsigned({wire7}))));
              reg14 <= (-wire3);
              reg15 <= wire6;
            end
          reg16 <= $unsigned(((!(reg15[(4'hb):(4'ha)] | {(8'h9c), wire0})) ?
              (~|reg10) : (~^(8'hb1))));
          if (wire7[(3'h7):(2'h2)])
            begin
              reg17 <= $signed(wire5[(1'h0):(1'h0)]);
              reg18 <= reg11;
              reg19 <= (reg13 || $unsigned((((reg14 ?
                  wire8 : (8'hbf)) ^~ (~reg18)) <<< ((~^wire2) >> $unsigned(wire9)))));
              reg20 <= reg18[(2'h2):(1'h0)];
              reg21 <= ($signed({(wire3 ? reg16[(3'h6):(3'h4)] : reg10),
                  {wire6,
                      wire8[(4'h8):(2'h3)]}}) << ($unsigned($unsigned({(8'hbd)})) ?
                  (~|$unsigned($unsigned(wire0))) : ($unsigned(wire9) ?
                      {$unsigned(wire3)} : $unsigned($signed(reg12)))));
            end
          else
            begin
              reg17 <= $unsigned(((|{(reg12 ? reg17 : reg11), reg20}) ?
                  (wire5[(1'h1):(1'h1)] ?
                      $unsigned($signed(reg16)) : reg21[(2'h2):(1'h1)]) : (7'h42)));
              reg18 <= (8'hba);
              reg19 <= reg20;
              reg20 <= reg18[(1'h0):(1'h0)];
              reg21 <= $unsigned($signed((((wire4 ? wire8 : reg10) ?
                      $signed(wire7) : wire5) ?
                  reg15 : reg11)));
            end
        end
      else
        begin
          if (wire0[(3'h6):(2'h2)])
            begin
              reg10 <= (($signed($signed((-wire8))) <= (reg17 && wire2[(4'h8):(4'h8)])) >> $unsigned($unsigned($unsigned(reg13[(1'h0):(1'h0)]))));
              reg11 <= $signed(reg20[(4'hf):(4'hd)]);
            end
          else
            begin
              reg10 <= ((8'hb2) ? reg10 : {((8'h9d) - $unsigned(reg12))});
              reg11 <= (~$signed((^wire7[(1'h1):(1'h0)])));
              reg12 <= {({reg21} <= (8'hb7))};
            end
          reg13 <= reg13[(4'hf):(4'hb)];
          reg14 <= ((~|((!reg15[(2'h3):(1'h0)]) ?
                  ($signed(reg18) >>> wire5[(3'h6):(1'h0)]) : wire7[(3'h4):(3'h4)])) ?
              $unsigned(((8'hbe) | ((reg13 - (8'hbb)) ^ ((8'ha3) ?
                  reg11 : wire8)))) : ((^~wire2) ?
                  $unsigned($signed({(8'had), reg18})) : (|wire8)));
          if ((!$unsigned((!wire7))))
            begin
              reg15 <= {((wire2 ? reg21[(2'h3):(2'h2)] : (|$signed(wire5))) ?
                      reg15 : (~|(wire6 >>> reg16)))};
              reg16 <= (($signed(wire0[(1'h0):(1'h0)]) ?
                  (~^(&(~^reg11))) : (((reg11 ^ wire1) ^ (+reg14)) >= (reg19 - $signed(reg21)))) & ((+($signed(wire1) ?
                  (wire0 + reg16) : (reg19 << (8'hb2)))) >>> $unsigned(reg10)));
              reg17 <= reg21[(2'h2):(1'h1)];
              reg18 <= {reg10};
            end
          else
            begin
              reg15 <= ($signed((~|$signed((wire4 ? wire2 : (8'ha6))))) ?
                  ($unsigned($unsigned(reg11[(3'h6):(1'h1)])) ?
                      $signed($signed(reg12[(2'h3):(1'h1)])) : (^$signed(reg13))) : (8'ha5));
              reg16 <= (+$signed(wire2));
              reg17 <= $unsigned(reg21);
              reg18 <= (+({(^$unsigned(wire1)), (~$signed(reg19))} ?
                  $signed(((~|reg13) ?
                      (~wire8) : ((7'h43) <= wire4))) : {$unsigned(((8'ha4) ?
                          reg21 : reg16))}));
              reg19 <= (reg11[(3'h7):(2'h2)] ^~ $unsigned((reg18 || ($unsigned(reg17) ^~ wire3))));
            end
        end
      reg22 <= $unsigned($signed({wire3}));
      reg23 <= reg22;
      reg24 <= reg22;
    end
  assign wire25 = ($signed(((~^$unsigned(wire0)) ?
                          {$unsigned(reg14)} : reg22[(3'h6):(3'h6)])) ?
                      $signed(((|(wire6 ? reg17 : reg23)) ?
                          (wire9[(5'h10):(4'hd)] ?
                              wire3 : reg18[(1'h0):(1'h0)]) : wire4)) : (^$unsigned((-(wire1 && reg24)))));
  module26 #() modinst38 (.wire29(reg16), .clk(clk), .wire28(wire4), .wire27(reg18), .wire30(reg14), .y(wire37));
  module39 #() modinst49 (wire48, clk, wire1, reg14, wire6, reg12);
  assign wire50 = ({(((8'hae) << (wire48 ?
                          wire6 : (8'hb7))) ^ $signed($unsigned(reg10)))} & {wire3});
  always
    @(posedge clk) begin
      reg51 <= ($unsigned((wire3[(3'h4):(2'h3)] ?
              reg16 : $unsigned($unsigned(wire4)))) ?
          (($unsigned(reg11[(2'h3):(2'h2)]) ?
              $unsigned($unsigned(reg14)) : ($unsigned(reg22) < (reg21 ?
                  (7'h40) : reg22))) & {($unsigned(reg10) ?
                  (reg20 & wire50) : $signed(reg13)),
              reg13[(3'h7):(2'h2)]}) : (reg23[(3'h4):(2'h2)] | ((^~wire8[(4'hf):(4'hf)]) ?
              {reg20[(5'h12):(3'h5)], (~^reg13)} : ($signed((8'hb1)) ?
                  (7'h43) : reg12))));
      reg52 <= (~^(wire3 != $unsigned($signed((-(7'h43))))));
      reg53 <= (^(reg19 + $unsigned($signed($unsigned(reg52)))));
    end
  assign wire54 = wire25[(2'h3):(1'h1)];
  assign wire55 = $unsigned(reg18[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg56 <= wire7[(4'h9):(1'h1)];
      reg57 <= (~&$unsigned($unsigned($unsigned((-reg24)))));
      if ($signed(wire50[(2'h3):(1'h0)]))
        begin
          reg58 <= (wire5[(2'h3):(2'h3)] ~^ $unsigned((({wire0} ?
                  wire54[(5'h12):(4'he)] : reg53[(3'h7):(3'h7)]) ?
              $unsigned(reg11) : ((reg22 * (7'h41)) ?
                  ((8'hba) << reg12) : $unsigned(wire48)))));
          if (({(8'h9c)} ?
              reg58[(4'hc):(4'hc)] : ((reg16[(2'h3):(1'h0)] & reg51) ?
                  reg11 : $unsigned($signed($unsigned((7'h42)))))))
            begin
              reg59 <= reg11;
            end
          else
            begin
              reg59 <= $signed($signed(wire9));
              reg60 <= {((wire54[(5'h12):(4'hf)] ~^ wire37[(2'h2):(2'h2)]) ?
                      wire4 : $signed(reg23))};
              reg61 <= {reg23};
            end
        end
      else
        begin
          reg58 <= reg16;
          reg59 <= wire7[(1'h0):(1'h0)];
          reg60 <= (-$signed(reg20[(3'h7):(1'h0)]));
          reg61 <= {$unsigned($signed({$unsigned(reg53)})),
              wire0[(4'h8):(2'h2)]};
          reg62 <= (($signed({(wire5 ~^ reg60)}) >= wire1[(4'ha):(3'h7)]) ?
              $unsigned($signed($unsigned($signed(reg61)))) : (+(+(-$signed((8'haf))))));
        end
      if (wire54)
        begin
          reg63 <= wire25;
          reg64 <= {$signed($unsigned($unsigned($signed(reg53)))),
              $unsigned(reg58)};
          reg65 <= $signed({(reg60[(1'h1):(1'h1)] && {$signed(wire3),
                  (wire48 ? wire8 : reg64)}),
              ((&(~&reg24)) ?
                  {reg51[(2'h3):(2'h3)]} : $signed($signed(wire55)))});
        end
      else
        begin
          reg63 <= $unsigned($signed($signed(((+reg58) <= $unsigned(reg64)))));
          reg64 <= (|$signed(wire54[(2'h2):(1'h0)]));
        end
    end
  assign wire66 = (!wire54[(4'hf):(3'h6)]);
  assign wire67 = (8'hae);
  assign wire68 = reg57[(2'h3):(1'h0)];
  assign wire69 = reg60;
  assign wire70 = ($unsigned($signed(($unsigned(reg65) ?
                      (-wire37) : {wire55, (8'hb8)}))) == $signed((~^((reg57 ?
                          (8'ha7) : reg57) ?
                      wire67 : (reg11 ? reg21 : wire54)))));
endmodule

module module39  (y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire43;
  input wire [(2'h2):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  assign y = {wire47, wire46, wire45, reg44, (1'h0)};
  always
    @(posedge clk) begin
      reg44 <= (~&((^(~|((8'hbb) ^~ wire40))) ?
          (($signed((8'hbe)) << wire43[(4'h8):(4'h8)]) ~^ ($unsigned(wire42) + wire43[(4'h8):(3'h6)])) : (^(7'h40))));
    end
  assign wire45 = $unsigned($signed((!{(wire40 != wire43),
                      wire43[(4'h8):(3'h4)]})));
  assign wire46 = ({wire45} > (8'hb0));
  assign wire47 = wire40[(1'h0):(1'h0)];
endmodule

module module26
#(parameter param35 = (((^(((8'hac) << (8'hb2)) < ((8'ha9) && (7'h43)))) * ({((8'hbf) != (8'hbf))} ? (!{(8'hbe), (8'ha0)}) : ((+(8'had)) || (&(8'hba))))) ? {((8'hbb) >= ({(7'h40)} | ((8'h9d) * (8'hba))))} : {((((8'ha4) ? (8'haa) : (8'hba)) ? {(8'hb8)} : {(7'h41), (8'ha5)}) ? {((8'hb5) ? (8'hb1) : (8'ha2))} : (((8'h9e) ^ (8'hb3)) ^~ {(8'hb7), (8'hbc)})), ({((7'h42) >>> (8'h9c)), (^(8'h9d))} ~^ ((8'haa) >= ((8'ha8) ? (8'hb3) : (8'h9c))))}), 
parameter param36 = (&(((|{param35}) ? {(param35 ? param35 : param35)} : ((param35 ? param35 : param35) ? (param35 ? param35 : param35) : param35)) ? (({param35} >= {param35, param35}) ? ((param35 & param35) ? (&param35) : (+param35)) : (~^(^(8'hb1)))) : ((8'hae) + param35))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire [(4'h8):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  assign y = {wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = $signed($signed((~^(~^wire30[(2'h3):(1'h0)]))));
  assign wire32 = (((wire27 ? (wire30 ? wire31 : $unsigned((8'hbc))) : wire28) ?
                          ((wire28[(1'h1):(1'h1)] & wire29) ?
                              $unsigned(wire30[(4'ha):(1'h0)]) : wire31[(2'h2):(2'h2)]) : (^{(wire29 & wire31),
                              $unsigned(wire30)})) ?
                      wire30 : {(wire27 >>> ($unsigned(wire30) << (!wire27))),
                          (wire31 ^~ ((wire30 << wire30) ^~ wire28[(2'h3):(1'h1)]))});
  assign wire33 = ((^wire32) == {{$unsigned($signed(wire31))}, wire32});
  assign wire34 = (wire29[(4'h8):(2'h2)] << $unsigned($signed((((8'hba) >= (8'hb6)) ?
                      wire32 : (8'ha8)))));
endmodule
