module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire84;
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  assign y = {wire88, wire87, wire86, wire84, reg90, reg89, (1'h0)};
  module5 #() modinst85 (wire84, clk, wire0, wire2, wire4, wire1, wire3);
  assign wire86 = $signed(wire4[(5'h11):(4'he)]);
  assign wire87 = $signed((wire4[(4'hf):(1'h1)] >> $signed((!$unsigned(wire0)))));
  assign wire88 = $unsigned(wire84);
  always
    @(posedge clk) begin
      reg89 <= $unsigned($unsigned(({(wire86 ? (8'hb0) : wire84),
              $unsigned(wire3)} ?
          (~(wire4 ? wire0 : wire87)) : (^~(wire2 <<< wire3)))));
      reg90 <= reg89;
    end
endmodule

module module5
#(parameter param82 = {((|(((8'haf) ? (8'haf) : (8'hbb)) ? ((7'h42) ? (8'hab) : (8'hbc)) : (~|(8'hbf)))) & (~&{(&(8'ha4))})), (|(((!(8'ha4)) < ((7'h43) | (8'hac))) ? ((+(8'ha0)) ? ((7'h40) ? (8'ha6) : (8'hbe)) : ((8'ha2) ? (8'h9e) : (8'h9e))) : (((8'hbd) ^~ (8'ha9)) ? (&(8'ha8)) : (^~(7'h40)))))}, 
parameter param83 = ((~^{{param82}, (~(~param82))}) ? ((~^{param82, (+param82)}) ~^ ({{param82, param82}} - ((param82 ? param82 : param82) == (8'hb2)))) : param82))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire78,
                 wire75,
                 wire12,
                 wire11,
                 reg79,
                 reg77,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire11 = wire6;
  assign wire12 = ((|((wire11 ?
                          (wire8 - (8'hbb)) : ((8'haf) ?
                              wire9 : wire7)) <= wire8[(4'hb):(3'h5)])) ?
                      (|$signed((wire7[(4'hd):(3'h7)] ?
                          {wire10,
                              wire11} : $unsigned(wire7)))) : wire8[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg13 <= $unsigned(wire7);
      reg14 <= $signed(wire11);
    end
  module15 #() modinst76 (wire75, clk, reg14, wire9, wire8, wire10, wire6);
  always
    @(posedge clk) begin
      reg77 <= (wire75[(4'h8):(2'h2)] < (8'hb6));
    end
  assign wire78 = {(wire10[(3'h6):(1'h1)] || $unsigned($signed(wire8[(2'h2):(1'h0)])))};
  always
    @(posedge clk) begin
      reg79 <= (~|$unsigned(reg13));
    end
  assign wire80 = (wire8[(3'h4):(2'h3)] > ($unsigned(reg77[(1'h1):(1'h0)]) <= ($signed((wire9 ?
                          wire7 : wire12)) ?
                      ((^~reg13) ?
                          (wire6 * wire78) : wire9) : ($unsigned((8'ha1)) ?
                          (|wire78) : (reg14 ? wire7 : reg77)))));
  assign wire81 = reg13[(1'h0):(1'h0)];
endmodule

module module15
#(parameter param74 = ({({((7'h41) < (8'hb0)), (~^(8'hb9))} & (((8'hac) > (8'hbf)) ? {(8'h9d)} : (~&(8'ha4))))} >>> {((((7'h43) ? (8'hb6) : (8'hbf)) ? (&(8'hbf)) : (-(8'ha6))) ? (&((8'hb1) ? (8'had) : (8'h9f))) : ({(8'ha5), (8'ha4)} ? (~(8'hbd)) : ((8'ha8) ~^ (8'h9e)))), (!{{(8'hb5), (8'hb6)}, (~^(8'hba))})}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h277):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire [(5'h10):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire28,
                 wire27,
                 wire26,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 reg31,
                 reg30,
                 reg29,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= wire16[(5'h10):(4'hf)];
      reg22 <= (wire20[(4'hd):(3'h6)] ?
          wire19[(1'h1):(1'h1)] : ({wire19[(4'h8):(2'h3)], $unsigned(wire20)} ?
              (wire20[(3'h6):(2'h2)] <<< $signed((!wire18))) : ((+{(8'hbe),
                      reg21}) ?
                  {wire18,
                      reg21[(4'hb):(4'hb)]} : $unsigned((wire16 & reg21)))));
      reg23 <= ({wire16[(1'h1):(1'h0)],
          $signed((&(8'h9e)))} == $unsigned({($signed(reg21) & $signed(wire19))}));
      reg24 <= (&{((-reg22) != (+$unsigned(reg23)))});
      reg25 <= (-reg21[(4'h8):(3'h6)]);
    end
  assign wire26 = $unsigned(wire20);
  assign wire27 = (~&reg23[(1'h1):(1'h0)]);
  assign wire28 = reg25;
  always
    @(posedge clk) begin
      reg29 <= wire20;
      reg30 <= ((8'ha8) != ((({wire20, wire26} + wire28) ?
              {(|reg22)} : (~reg23)) ?
          ((wire16 <<< (wire28 ? (8'ha2) : wire20)) ?
              $unsigned((wire27 * reg21)) : wire27) : ({wire26,
              (wire28 == wire20)} >= wire17)));
      reg31 <= ((reg21 && reg29[(3'h4):(3'h4)]) | reg29[(1'h0):(1'h0)]);
    end
  assign wire32 = (reg29 ?
                      (reg22 ?
                          $signed(wire26) : {(wire28 ? (+reg25) : reg21),
                              ((~^wire16) ?
                                  (reg29 >> reg31) : $signed(reg23))}) : reg23[(3'h6):(2'h2)]);
  assign wire33 = ((($signed((^reg22)) <= (8'hb8)) ?
                      $signed(((&wire19) ?
                          wire16 : reg25)) : (-($unsigned(reg22) ?
                          $unsigned(reg21) : reg29[(4'hb):(3'h6)]))) >>> $signed({{reg24[(2'h2):(2'h2)]}}));
  assign wire34 = reg25[(4'hb):(2'h3)];
  assign wire35 = $unsigned(wire17[(4'h8):(3'h7)]);
  always
    @(posedge clk) begin
      reg36 <= wire17;
      reg37 <= $unsigned($unsigned($unsigned(reg30[(3'h7):(3'h4)])));
      reg38 <= (!wire27);
      if (wire26)
        begin
          reg39 <= wire33;
          reg40 <= $unsigned(wire28);
          reg41 <= (~^$signed($signed(wire32)));
        end
      else
        begin
          reg39 <= (~|(~|wire19[(2'h2):(1'h0)]));
          if ($unsigned({reg40[(3'h4):(1'h0)]}))
            begin
              reg40 <= ((reg36 ?
                      $signed($signed({reg29})) : $signed(($unsigned(wire17) ?
                          (~|reg38) : (^(8'had))))) ?
                  $signed($signed($signed(reg22[(3'h5):(3'h5)]))) : $unsigned(reg25));
              reg41 <= wire35[(2'h3):(1'h0)];
            end
          else
            begin
              reg40 <= (wire32 == {$unsigned($unsigned(((8'hac) ?
                      wire18 : reg31))),
                  $unsigned(((reg30 ? wire33 : (8'ha9)) <<< (~&reg25)))});
              reg41 <= wire16[(3'h6):(3'h5)];
              reg42 <= {(^~reg30),
                  (((^(reg41 > reg30)) <<< ((reg38 - reg38) << {wire19,
                          wire18})) ?
                      $unsigned(reg38[(3'h5):(3'h4)]) : $signed($signed((wire33 ?
                          reg30 : wire16))))};
            end
          if ($unsigned($unsigned(wire16[(4'h8):(2'h3)])))
            begin
              reg43 <= ((~|((-(reg24 >= wire32)) <<< wire32)) ?
                  {$unsigned({(wire19 ? (8'ha3) : wire20)}),
                      $signed(reg42[(2'h3):(2'h3)])} : ($signed((wire27[(4'h9):(4'h8)] || (^wire27))) ~^ wire20[(4'hc):(3'h5)]));
              reg44 <= wire17[(4'h9):(3'h7)];
            end
          else
            begin
              reg43 <= $signed($signed(($unsigned(wire35) - reg29[(4'h8):(1'h1)])));
            end
          if ((^(!$unsigned(reg44[(4'hb):(2'h3)]))))
            begin
              reg45 <= {$unsigned((~^{(reg37 ? wire35 : reg36), (-wire17)}))};
            end
          else
            begin
              reg45 <= (&$signed((~reg44[(4'hf):(4'he)])));
            end
        end
      reg46 <= (~^(~|$unsigned(((wire19 ~^ wire33) > reg42[(4'ha):(3'h6)]))));
    end
  assign wire47 = reg44[(4'hd):(4'hc)];
  assign wire48 = $signed($signed((^(reg46 ?
                      reg41[(1'h1):(1'h0)] : (~&wire32)))));
  assign wire49 = wire32[(3'h6):(2'h2)];
  assign wire50 = (|$unsigned((+wire33[(2'h2):(1'h1)])));
  assign wire51 = wire49;
  assign wire52 = (8'hb2);
  always
    @(posedge clk) begin
      reg53 <= ($unsigned($unsigned((~$signed(reg39)))) == (^{reg38,
          wire33[(1'h0):(1'h0)]}));
      reg54 <= $unsigned(((+(reg42 ? reg25 : wire20)) ?
          ({(&reg38)} * ($unsigned(reg29) ?
              $signed(reg42) : $unsigned(reg21))) : wire27[(3'h5):(2'h2)]));
      reg55 <= wire16;
      if (wire48[(1'h0):(1'h0)])
        begin
          reg56 <= $signed((wire34[(3'h5):(3'h5)] <<< reg43));
          reg57 <= reg45;
        end
      else
        begin
          if ($unsigned(((~^$unsigned($signed(reg37))) << $unsigned(wire20))))
            begin
              reg56 <= (wire27 ?
                  ((8'hae) ?
                      wire26 : {reg25}) : $unsigned($unsigned((~(reg31 <= reg29)))));
              reg57 <= $unsigned(((+reg22[(3'h4):(2'h2)]) ?
                  $unsigned((((7'h40) <<< (7'h43)) ?
                      {wire50,
                          reg56} : ((8'hbd) && wire49))) : reg31[(4'ha):(4'h9)]));
              reg58 <= wire48;
            end
          else
            begin
              reg56 <= (~$unsigned((((wire19 && reg56) ?
                  $unsigned((8'ha7)) : reg43[(2'h3):(2'h3)]) >>> $unsigned((reg53 ?
                  wire26 : reg54)))));
              reg57 <= wire49[(3'h4):(1'h0)];
            end
          reg59 <= (^~reg57[(1'h0):(1'h0)]);
          reg60 <= $signed(reg31);
          reg61 <= (reg31[(3'h4):(2'h3)] ?
              {$signed(reg25)} : (($signed((reg21 ?
                  reg23 : wire26)) <<< reg25[(1'h1):(1'h0)]) >>> (reg42[(4'ha):(2'h3)] ?
                  (wire16[(4'h9):(1'h1)] ?
                      $unsigned(wire51) : {(8'hb9)}) : (!$signed(wire32)))));
          if (((^reg24) * $unsigned((+($unsigned(wire48) <<< reg31)))))
            begin
              reg62 <= reg31[(4'hf):(3'h6)];
            end
          else
            begin
              reg62 <= reg43[(1'h1):(1'h1)];
            end
        end
    end
  assign wire63 = $signed($unsigned(reg23));
  assign wire64 = (~&$unsigned($signed($unsigned((7'h44)))));
  always
    @(posedge clk) begin
      reg65 <= (($signed(reg56[(1'h0):(1'h0)]) * {$signed(wire28),
              ((wire16 >= reg21) - (~&wire50))}) ?
          (reg41 ?
              {$unsigned((reg55 >= wire17)),
                  $unsigned((|reg56))} : reg46) : reg42);
      reg66 <= wire64[(2'h3):(2'h2)];
      reg67 <= (+(reg59 == $unsigned($signed((+wire16)))));
      reg68 <= (+$signed(((((8'hac) && wire18) ?
              $unsigned(wire16) : $signed(reg36)) ?
          wire51 : $signed((8'hbf)))));
    end
  always
    @(posedge clk) begin
      reg69 <= reg25[(1'h1):(1'h1)];
      reg70 <= (reg57 ? (^(-$unsigned(wire26))) : (~^(~^(8'hbe))));
      reg71 <= $signed($unsigned($signed($unsigned($unsigned(wire16)))));
      reg72 <= wire28;
      reg73 <= {$signed($signed({reg57}))};
    end
endmodule
