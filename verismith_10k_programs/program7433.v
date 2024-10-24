module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire84;
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire51,
                 wire4,
                 wire84,
                 reg99,
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
                 reg55,
                 reg54,
                 reg53,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire4 = (8'ha9);
  always
    @(posedge clk) begin
      reg5 <= wire0;
      reg6 <= $unsigned((+({(&wire4)} == (^~$signed(wire3)))));
      reg7 <= wire4[(1'h0):(1'h0)];
      reg8 <= $unsigned((|reg6));
      reg9 <= (&{wire3});
    end
  module10 #() modinst52 (wire51, clk, reg5, wire4, reg9, reg7);
  always
    @(posedge clk) begin
      reg53 <= ({wire0[(3'h5):(3'h5)],
              ($unsigned({(8'h9e), reg8}) ?
                  ({(8'ha3)} << $unsigned(wire1)) : (reg7 ?
                      (reg8 >>> wire0) : ((8'ha9) ? wire3 : wire4)))} ?
          $unsigned(((wire3 ? (+wire4) : $signed(reg7)) ?
              {reg6, $signed(wire1)} : $signed((wire4 ?
                  wire1 : reg8)))) : {(wire1[(5'h14):(4'h9)] ? wire2 : reg8)});
      reg54 <= $signed((~^{(wire1[(3'h6):(2'h3)] ?
              {reg7} : wire51[(2'h3):(2'h3)]),
          $unsigned((-reg7))}));
      reg55 <= {({$signed($signed(reg54))} != wire1), reg53};
    end
  module56 #() modinst85 (.clk(clk), .wire61(wire51), .wire57(wire1), .wire59(reg53), .y(wire84), .wire60(wire3), .wire58(reg5));
  always
    @(posedge clk) begin
      reg86 <= reg5;
      if (({reg7[(3'h5):(1'h0)]} & (reg9[(3'h5):(2'h2)] ?
          $unsigned(((wire1 * reg54) ?
              (~wire0) : wire2[(4'h9):(1'h0)])) : $signed({(reg86 != reg86),
              reg5[(4'hf):(4'h9)]}))))
        begin
          reg87 <= $signed((&reg5[(3'h6):(1'h1)]));
          reg88 <= reg8;
          reg89 <= (~((((reg87 ? reg86 : wire0) ?
                  (~&reg86) : (reg53 ? reg87 : reg6)) ?
              $signed($unsigned(reg9)) : $unsigned((wire2 ?
                  reg5 : reg9))) ~^ reg6));
        end
      else
        begin
          if ($signed((8'hb9)))
            begin
              reg87 <= reg88;
            end
          else
            begin
              reg87 <= $unsigned($signed($unsigned(((reg53 ? reg5 : reg7) ?
                  (reg88 ^ wire1) : $unsigned(reg9)))));
              reg88 <= ($signed(($signed($unsigned(wire84)) ?
                      wire1[(4'hc):(3'h5)] : wire3)) ?
                  wire51 : reg88);
              reg89 <= reg6;
              reg90 <= (!((|{(^(8'ha4))}) ?
                  ($unsigned(wire0) < reg88[(2'h2):(1'h1)]) : ((reg6[(4'h8):(2'h3)] ?
                          (reg53 ? reg89 : reg53) : (wire51 ? reg9 : (8'ha6))) ?
                      wire0[(2'h3):(2'h2)] : (~^$signed(wire0)))));
            end
          if (($unsigned(($signed(reg55[(3'h4):(3'h4)]) ?
              ((wire51 ? reg6 : reg53) ?
                  $signed(reg53) : (wire84 != reg8)) : ($signed(wire3) ?
                  (8'hb8) : {(7'h40)}))) > ($signed($unsigned($signed(reg8))) ?
              ($signed(reg87[(5'h12):(1'h0)]) ?
                  reg55[(5'h10):(3'h4)] : (8'hb3)) : $unsigned(wire3))))
            begin
              reg91 <= (reg5[(2'h2):(1'h0)] >= reg9);
            end
          else
            begin
              reg91 <= $signed(wire1[(4'h8):(4'h8)]);
              reg92 <= $signed(wire4);
            end
          reg93 <= (~reg7);
        end
      if ($unsigned(reg87))
        begin
          reg94 <= ($signed({$unsigned($signed(reg89)),
                  wire84[(1'h0):(1'h0)]}) ?
              $signed(reg9[(4'ha):(4'ha)]) : {(($signed((8'hb8)) ?
                      $signed(reg6) : (reg87 ?
                          (8'hb8) : (8'had))) ^~ (((8'h9c) <<< reg89) ?
                      $unsigned(reg86) : (^~reg89))),
                  reg53[(5'h11):(1'h0)]});
        end
      else
        begin
          reg94 <= $unsigned($unsigned((((8'hbf) >>> $signed(reg9)) != $signed(reg92[(3'h7):(1'h1)]))));
          reg95 <= $unsigned({((~|reg8) - (-$signed((8'hb3)))),
              ($unsigned(wire51) ?
                  ((wire51 - reg92) | $signed((7'h41))) : (wire2[(2'h2):(2'h2)] ^ (reg8 << reg94)))});
          reg96 <= (((wire0 ? ((reg5 - reg8) >> {wire4}) : wire51) ?
                  ((-(reg8 >> wire84)) >> reg6) : {((+wire3) <= $signed(reg87)),
                      (wire0 && $unsigned(wire84))}) ?
              reg55[(5'h12):(2'h2)] : {reg95[(3'h5):(1'h0)]});
        end
      reg97 <= (wire4 ? $signed(reg88[(2'h2):(2'h2)]) : wire0[(3'h6):(3'h4)]);
    end
  assign wire98 = reg54;
  always
    @(posedge clk) begin
      reg99 <= (~|(reg90 >= $signed(reg93)));
    end
  assign wire100 = wire0[(3'h5):(1'h1)];
  assign wire101 = (^{{$unsigned(reg92[(4'ha):(3'h6)]),
                           ({(8'hb8)} ~^ (wire2 ^ reg87))},
                       ($signed(((8'hb1) ^ (8'h9d))) >>> ((wire0 ?
                               reg5 : reg9) ?
                           reg99[(3'h7):(1'h1)] : (reg53 - (7'h43))))});
  assign wire102 = $unsigned(reg93);
  assign wire103 = (^reg90[(3'h7):(3'h5)]);
endmodule

module module56
#(parameter param82 = (+(7'h41)), 
parameter param83 = (8'hba))
(y, clk, wire57, wire58, wire59, wire60, wire61);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire57;
  input wire signed [(4'hd):(1'h0)] wire58;
  input wire [(5'h12):(1'h0)] wire59;
  input wire signed [(4'h8):(1'h0)] wire60;
  input wire [(5'h11):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire80;
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  assign y = {wire62, wire63, wire64, wire80, reg65, (1'h0)};
  assign wire62 = ($unsigned(wire59[(4'he):(4'hb)]) ?
                      $signed({((wire61 ? wire58 : wire59) >= (8'ha3)),
                          (!wire58)}) : (8'ha7));
  assign wire63 = $unsigned((^~wire58));
  assign wire64 = wire62[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg65 <= ($unsigned($signed(wire59[(4'hf):(4'h9)])) != wire62[(2'h2):(1'h1)]);
    end
  module66 #() modinst81 (wire80, clk, wire58, wire59, wire64, reg65);
endmodule

module module10
#(parameter param49 = (((~&(((7'h44) ? (8'hbe) : (8'hb9)) || {(8'hb4), (8'hae)})) && ((((8'h9f) ? (8'hb9) : (8'hbd)) << (~(8'h9c))) * ((+(8'hac)) | (-(8'hba))))) <= ((~(((8'hba) - (8'haf)) & (|(8'hb9)))) <= (~^(((8'ha5) << (8'hbf)) ? ((7'h44) < (8'ha7)) : (~|(8'hb7)))))), 
parameter param50 = ((param49 << {(~|param49), {(|param49), ((8'ha9) ? param49 : param49)}}) ? ({(~^{param49}), (-param49)} * (((param49 ? param49 : param49) ? (param49 >>> param49) : (+param49)) | (~(8'ha8)))) : param49))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire29;
  assign y = {wire47, wire33, wire32, wire31, wire29, (1'h0)};
  module15 #() modinst30 (.clk(clk), .wire20(wire11), .wire19(wire14), .wire18(wire12), .y(wire29), .wire16((8'hb5)), .wire17(wire13));
  assign wire31 = ((+($signed((wire11 ^ wire14)) ?
                          (-(^~wire11)) : $signed((wire14 >= wire13)))) ?
                      ((~|$signed((wire13 ^ wire14))) ?
                          ({wire29[(2'h2):(1'h0)]} * (wire12[(3'h5):(2'h2)] ?
                              wire11[(3'h6):(1'h0)] : wire11[(4'hc):(2'h2)])) : ((wire13[(3'h7):(3'h7)] ?
                                  (^~wire11) : wire12) ?
                              wire14[(1'h1):(1'h0)] : ({wire12} - $unsigned(wire11)))) : $unsigned(((-wire11) != ((wire14 ?
                              wire29 : wire12) ?
                          $signed(wire12) : wire29[(2'h2):(1'h1)]))));
  assign wire32 = $signed($unsigned(($unsigned($signed(wire11)) + $unsigned($signed(wire13)))));
  assign wire33 = (wire32[(1'h0):(1'h0)] >> $unsigned(wire32));
  module34 #() modinst48 (wire47, clk, wire29, wire13, wire14, wire11);
endmodule

module module34
#(parameter param45 = ((^((&{(7'h44)}) ^~ ((~^(8'ha7)) ~^ (-(8'hb9))))) >= (+((((8'ha4) ? (8'hae) : (7'h44)) | {(8'hbb)}) ? {((8'ha3) ? (8'h9e) : (8'hb0))} : (~^((8'h9d) | (8'hbb)))))), 
parameter param46 = param45)
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire38;
  input wire signed [(5'h12):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  input wire [(3'h6):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  assign y = {wire44, wire43, wire42, wire41, wire40, wire39, (1'h0)};
  assign wire39 = {wire38,
                      $signed((~^{(wire35 ? wire37 : (8'haf)),
                          {wire37, wire35}}))};
  assign wire40 = wire35[(3'h5):(1'h1)];
  assign wire41 = $signed(wire35);
  assign wire42 = (~&wire36);
  assign wire43 = $signed($unsigned((&wire42)));
  assign wire44 = wire39[(2'h3):(1'h1)];
endmodule

module module15
#(parameter param28 = (~&{((-((7'h42) ~^ (8'hb4))) ? (((8'hb1) == (8'hb1)) ? ((8'hae) ? (8'hb5) : (8'hbb)) : ((8'hab) || (8'hab))) : {{(8'h9c)}})}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  assign y = {wire27, wire22, wire21, reg26, reg25, reg24, reg23, (1'h0)};
  assign wire21 = $unsigned((~^$unsigned($unsigned($unsigned((8'hb6))))));
  assign wire22 = $signed(wire18[(4'hb):(3'h7)]);
  always
    @(posedge clk) begin
      reg23 <= (((wire20 | wire19[(3'h5):(3'h5)]) ?
          wire19[(4'h8):(3'h7)] : $signed($signed((^~wire16)))) ^ $signed((((-(8'hb4)) <<< wire16[(2'h2):(2'h2)]) ?
          ((wire18 ?
              wire16 : wire17) < $signed(wire19)) : {((8'ha5) ~^ wire18)})));
      reg24 <= (!(^~$unsigned(wire18[(3'h5):(2'h3)])));
      reg25 <= (8'hb9);
      reg26 <= {{((-reg24[(4'h8):(3'h5)]) ?
                  (8'hb1) : ((wire20 >= wire18) + (wire19 ? wire22 : wire21))),
              ($unsigned({wire21}) <= (wire19 ? wire18 : (~&wire20)))}};
    end
  assign wire27 = $unsigned(wire16);
endmodule

module module66  (y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire70;
  input wire [(5'h10):(1'h0)] wire69;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire [(3'h7):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire71 = ($unsigned($signed(wire69[(3'h6):(2'h3)])) ?
                      $unsigned(wire70) : (~^$signed(wire68[(3'h5):(3'h4)])));
  assign wire72 = ((~(wire71[(2'h3):(1'h1)] ?
                          (7'h43) : $unsigned($signed(wire70)))) ?
                      ((^~{wire68[(4'hc):(3'h5)]}) ?
                          ((wire67[(2'h3):(2'h2)] >= $signed(wire69)) ?
                              wire68 : wire67) : {$unsigned(wire71[(4'h8):(1'h1)]),
                              (wire68 ?
                                  $unsigned(wire68) : (wire71 + wire70))}) : wire69[(4'hf):(4'ha)]);
  assign wire73 = (~&(-$unsigned($unsigned((wire68 ? wire71 : wire69)))));
  assign wire74 = $unsigned((~&$signed((&(wire70 > wire73)))));
  assign wire75 = $signed(wire69);
  assign wire76 = (((~wire68[(4'ha):(4'ha)]) ?
                      $signed((wire74[(3'h6):(2'h2)] ?
                          (wire68 ~^ wire68) : (wire74 ?
                              (8'h9e) : wire73))) : ($unsigned(wire69) <= (^~(wire74 ?
                          wire68 : wire71)))) > wire69);
  assign wire77 = wire73[(4'he):(4'ha)];
  always
    @(posedge clk) begin
      reg78 <= $unsigned((~|(((wire74 ? wire72 : wire71) && ((8'hba) ?
              wire74 : wire69)) ?
          wire77[(3'h5):(2'h2)] : {(wire76 ? wire75 : wire67),
              (wire76 ? wire68 : wire71)})));
      reg79 <= {$signed(($unsigned($unsigned(wire67)) ?
              $unsigned(wire77) : (8'hbf)))};
    end
endmodule
