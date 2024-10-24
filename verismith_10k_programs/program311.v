module top
#(parameter param191 = (&(~^(((-(8'hbe)) || {(8'hab)}) ? (|((7'h41) ? (8'hb5) : (8'hb6))) : (((8'ha0) >> (8'haf)) ? ((8'h9f) ^~ (8'h9e)) : (8'hb8))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire190;
  wire [(2'h2):(1'h0)] wire189;
  wire [(2'h3):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire183;
  wire [(5'h10):(1'h0)] wire182;
  wire signed [(3'h7):(1'h0)] wire180;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire20;
  reg signed [(4'hf):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg185 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire184,
                 wire183,
                 wire182,
                 wire180,
                 wire22,
                 wire20,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  module4 #() modinst21 (.wire5((8'hb9)), .wire7(wire2), .wire8(wire1), .wire9(wire0), .clk(clk), .wire6(wire3), .y(wire20));
  assign wire22 = $signed(($signed($signed((wire20 ? wire2 : wire3))) ?
                      wire20 : {wire1,
                          (wire20 ? wire20[(1'h1):(1'h1)] : $signed(wire1))}));
  always
    @(posedge clk) begin
      reg23 <= (|(~^wire20[(2'h2):(1'h1)]));
      reg24 <= (-wire3[(4'he):(4'hc)]);
      reg25 <= reg23[(4'h8):(3'h5)];
      reg26 <= $unsigned((wire22 * $signed($unsigned((~|wire20)))));
    end
  module27 #() modinst181 (wire180, clk, wire22, reg25, wire20, reg26, reg23);
  assign wire182 = (8'h9e);
  assign wire183 = reg26[(3'h7):(3'h5)];
  assign wire184 = (((^((wire3 ? reg26 : (8'h9c)) >> reg23[(4'h8):(1'h1)])) ?
                       (~^$unsigned({reg26,
                           wire0})) : reg26[(4'hf):(4'h9)]) <= $unsigned({$unsigned($unsigned((8'hbc))),
                       $signed((reg24 <= wire182))}));
  always
    @(posedge clk) begin
      reg185 <= ((7'h41) >= (~|$signed(((~|reg24) ?
          wire2[(4'ha):(1'h1)] : wire2))));
      reg186 <= $signed(((~&$signed($unsigned((8'haf)))) ?
          wire2 : ({(~reg25)} ?
              (+((8'hb3) ? wire184 : reg25)) : reg185[(4'h8):(3'h6)])));
      reg187 <= (!(~|$signed((&(reg26 ? reg26 : wire182)))));
      reg188 <= ({$signed($unsigned($signed(wire22))),
          $unsigned($unsigned($signed(wire184)))} * ((($unsigned(wire183) == (wire183 && wire1)) ?
              wire2[(4'ha):(1'h1)] : wire180) ?
          ($unsigned((wire0 != wire3)) + reg26[(4'h8):(3'h6)]) : {(!$unsigned(reg185))}));
    end
  assign wire189 = (wire3 ?
                       (&($unsigned(reg23) ^ $signed($unsigned(reg23)))) : {($unsigned($signed(wire1)) ?
                               wire184[(2'h3):(1'h1)] : ($unsigned(wire2) + $signed(wire20))),
                           (+(!$unsigned(reg24)))});
  assign wire190 = $unsigned((reg23 && $unsigned(reg186[(1'h1):(1'h1)])));
endmodule

module module27
#(parameter param179 = {{((^~{(8'ha3), (8'hb5)}) & (-(~&(8'ha2)))), (&((8'ha7) <= ((8'haf) ^~ (8'hba))))}})
(y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'h407):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire signed [(4'hb):(1'h0)] wire30;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire57;
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg174 = (1'h0);
  reg [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(4'hc):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg161 = (1'h0);
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire138,
                 wire99,
                 wire73,
                 wire60,
                 wire59,
                 wire33,
                 wire34,
                 wire35,
                 wire43,
                 wire57,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 (1'h0)};
  assign wire33 = $unsigned((^~((^~(wire30 <<< (7'h43))) ?
                      $signed({(8'ha2), wire30}) : (!((8'had) << wire30)))));
  assign wire34 = ((($signed((wire31 >>> wire32)) ?
                              (~wire32) : (wire29 ?
                                  wire32 : (wire28 << wire33))) ?
                          wire28[(4'hf):(4'h9)] : $unsigned((((8'hb0) ?
                                  wire33 : (8'h9f)) ?
                              ((8'had) ? wire29 : wire30) : wire33))) ?
                      (+$unsigned(((&wire32) < $signed(wire33)))) : ($signed(((wire29 >> wire32) >>> (~|(8'haa)))) ^ wire32));
  assign wire35 = wire33[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(wire32[(4'h9):(1'h1)])) < wire30))
        begin
          if ((-wire28))
            begin
              reg36 <= wire34[(3'h5):(1'h0)];
            end
          else
            begin
              reg36 <= (~&$unsigned(($signed((!wire29)) ?
                  ($unsigned(reg36) << (^wire34)) : (^~(!wire28)))));
              reg37 <= {$signed($unsigned(wire33)),
                  (|((wire28[(2'h2):(1'h1)] & reg36) ?
                      ((wire32 + wire33) | wire30[(1'h1):(1'h1)]) : $unsigned({wire28,
                          wire31})))};
              reg38 <= $unsigned(wire34);
              reg39 <= (^wire34[(3'h5):(2'h3)]);
              reg40 <= {({($signed(wire32) ? {wire35, reg36} : reg38),
                      ((wire30 ? wire30 : wire31) ?
                          $signed((8'ha0)) : (-wire30))} - wire32[(4'h8):(2'h2)]),
                  ((reg36[(1'h0):(1'h0)] ?
                      {wire33[(5'h10):(4'hb)]} : wire35) || $unsigned(wire33))};
            end
        end
      else
        begin
          reg36 <= reg40;
        end
      reg41 <= wire34;
      reg42 <= (|{(~^(reg38 ? $signed((8'hbd)) : $signed(reg41)))});
    end
  assign wire43 = {(wire32[(2'h3):(1'h1)] | $unsigned(({(8'ha9)} < $signed(wire35)))),
                      $unsigned(wire32)};
  module44 #() modinst58 (.y(wire57), .wire47(wire33), .wire46(wire31), .wire45(reg37), .clk(clk), .wire48(wire30));
  assign wire59 = (~|(reg37 ~^ reg41));
  assign wire60 = (~^(reg36 ?
                      $signed($signed((reg41 ^ wire30))) : ((8'hb2) >> reg38)));
  always
    @(posedge clk) begin
      reg61 <= reg37[(2'h2):(1'h1)];
      if ($signed(wire29[(3'h5):(1'h1)]))
        begin
          reg62 <= $signed(($signed({(wire60 ?
                  reg36 : wire33)}) ^ {$signed($unsigned(reg37))}));
          if (reg40)
            begin
              reg63 <= $unsigned($unsigned(reg37));
              reg64 <= $signed(((reg38 >> (8'hbe)) ? wire60 : (8'hb0)));
              reg65 <= reg37[(4'he):(2'h3)];
              reg66 <= (8'hb9);
            end
          else
            begin
              reg63 <= (~^(((&$signed(reg38)) ?
                  ((&wire57) && $signed(reg65)) : $signed((-reg36))) | reg41));
              reg64 <= wire43[(1'h0):(1'h0)];
              reg65 <= (!((^~$signed((^~reg37))) != (8'h9d)));
            end
          reg67 <= $unsigned((wire57 ?
              ((&(reg39 ? wire30 : reg37)) ?
                  $unsigned($unsigned(reg38)) : (!(!reg38))) : wire28));
          reg68 <= $signed({(8'hb1)});
          reg69 <= reg64;
        end
      else
        begin
          reg62 <= reg67;
          reg63 <= $signed($signed({(wire33 ?
                  reg40[(2'h2):(2'h2)] : (8'haf))}));
          reg64 <= ({$signed(wire33),
              ({(reg39 ?
                      reg38 : reg68)} ~^ reg64[(2'h3):(1'h0)])} >> wire29[(1'h1):(1'h0)]);
        end
      reg70 <= wire34;
      reg71 <= (((-reg64[(3'h4):(1'h1)]) ?
          reg39[(1'h0):(1'h0)] : (({wire43, wire60} <= $unsigned(reg39)) ?
              $unsigned(reg42) : wire43[(3'h6):(2'h2)])) + $signed(reg70[(4'h8):(2'h2)]));
      reg72 <= (($signed(wire34) <= wire31[(4'h9):(3'h6)]) ?
          $unsigned($unsigned(((wire59 != wire29) ~^ ((8'ha8) ?
              reg40 : reg71)))) : wire60);
    end
  assign wire73 = ((8'ha3) == $unsigned((reg37[(4'hd):(1'h0)] + reg70)));
  always
    @(posedge clk) begin
      reg74 <= $unsigned(reg61[(3'h6):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if (wire30)
        begin
          reg75 <= $signed((reg65 ?
              $unsigned((-$signed(wire59))) : reg39[(4'h8):(3'h6)]));
        end
      else
        begin
          reg75 <= reg75[(2'h3):(2'h3)];
          if (wire29[(3'h5):(3'h4)])
            begin
              reg76 <= ({$unsigned(reg68), $unsigned(reg39[(1'h1):(1'h0)])} ?
                  wire29 : reg40);
              reg77 <= (reg70[(2'h3):(2'h3)] ?
                  (^((|(wire43 || reg38)) ?
                      wire28 : reg38[(1'h0):(1'h0)])) : $unsigned($unsigned(reg37[(1'h0):(1'h0)])));
            end
          else
            begin
              reg76 <= reg69[(2'h2):(1'h0)];
              reg77 <= $signed($unsigned($signed($unsigned((wire31 << wire35)))));
              reg78 <= (-reg68[(4'h8):(3'h5)]);
              reg79 <= (($unsigned((reg78[(2'h2):(2'h2)] * $signed(reg39))) ?
                  (8'hb6) : $unsigned(((8'h9c) >>> $signed((8'hbc))))) < $signed(((~^{wire43,
                  (8'ha4)}) >>> reg42[(1'h1):(1'h0)])));
              reg80 <= (&((reg37 ? reg40[(3'h5):(2'h2)] : $unsigned({wire35})) ?
                  wire32[(3'h7):(1'h0)] : ($signed((wire57 ^~ wire73)) ?
                      $unsigned(reg38[(1'h0):(1'h0)]) : {(wire32 | reg62),
                          {reg79, wire35}})));
            end
          if ((wire33 ? (8'ha5) : reg76[(4'hb):(4'h9)]))
            begin
              reg81 <= wire29[(3'h5):(2'h3)];
            end
          else
            begin
              reg81 <= $unsigned($signed((~&{wire31})));
              reg82 <= ({{reg77},
                  wire73[(1'h0):(1'h0)]} && {(reg65[(3'h5):(3'h4)] && $unsigned(reg36[(4'h8):(4'h8)]))});
              reg83 <= $signed(((~|reg36[(1'h1):(1'h0)]) ?
                  (~^{$signed(wire30)}) : ($unsigned($signed(reg40)) ?
                      {((8'hbb) * reg67),
                          reg38[(3'h7):(2'h2)]} : reg69[(1'h0):(1'h0)])));
            end
          reg84 <= $signed($signed($unsigned(($unsigned(reg37) ?
              (reg69 ? reg72 : wire43) : (reg64 <= (7'h40))))));
        end
      reg85 <= wire60[(3'h4):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg86 <= wire28;
      if (reg40)
        begin
          reg87 <= ($signed((^$unsigned((&wire31)))) <= ($signed(wire31[(4'h8):(4'h8)]) ^ reg39));
        end
      else
        begin
          reg87 <= $signed(reg71[(1'h0):(1'h0)]);
          reg88 <= wire29[(1'h0):(1'h0)];
        end
      reg89 <= $signed(($signed({wire28[(4'hf):(3'h5)],
          (-wire35)}) - $unsigned(({(8'h9f)} ~^ reg64))));
    end
  always
    @(posedge clk) begin
      if ({reg66, reg77})
        begin
          reg90 <= $unsigned(reg42);
          reg91 <= wire43;
          reg92 <= $signed(reg72);
        end
      else
        begin
          if ($unsigned((^(reg61[(2'h3):(2'h2)] << ({reg75,
              (8'h9d)} == (~reg63))))))
            begin
              reg90 <= (+reg79);
              reg91 <= reg71[(4'h9):(3'h6)];
              reg92 <= reg66[(2'h3):(2'h2)];
            end
          else
            begin
              reg90 <= {wire33, reg77};
              reg91 <= ($signed(reg84) ?
                  (wire43[(2'h2):(1'h1)] >>> reg88[(1'h0):(1'h0)]) : reg61);
              reg92 <= (reg88 - reg69[(4'h9):(4'h9)]);
              reg93 <= (~{reg76[(4'h9):(3'h4)]});
              reg94 <= $signed($signed(reg76[(1'h1):(1'h0)]));
            end
          reg95 <= ((^(reg84 ?
              $unsigned($signed(reg64)) : $signed({reg87}))) - reg85);
        end
      reg96 <= (!(reg38[(4'hb):(4'hb)] >= ((~^{wire57, reg85}) ^~ wire43)));
      reg97 <= (~|((~{(reg86 * reg61)}) > (|{((8'hb3) >> reg38)})));
      reg98 <= $unsigned({reg90});
    end
  assign wire99 = $signed(reg40[(3'h7):(3'h7)]);
  module100 #() modinst139 (.wire101(reg40), .wire102(reg83), .y(wire138), .wire103(reg96), .wire105(reg64), .wire104(reg42), .clk(clk));
  always
    @(posedge clk) begin
      if ({reg61, $unsigned({reg88[(2'h2):(1'h0)], reg83[(1'h0):(1'h0)]})})
        begin
          reg140 <= (~&(reg92 ?
              (~&(+(reg38 != reg98))) : reg76[(3'h7):(2'h2)]));
          if (wire30[(3'h7):(3'h4)])
            begin
              reg141 <= (wire29 ?
                  (~^reg93) : {{reg69},
                      $unsigned(((reg93 ? reg86 : reg78) >> (reg61 - reg37)))});
              reg142 <= ({(({(8'hbe),
                          wire34} ^ $signed(wire30)) >>> ((reg91 >= (8'hbc)) ?
                          (!wire57) : (-reg96)))} ?
                  (~$unsigned((-(~^reg41)))) : $signed($unsigned(reg40[(1'h1):(1'h0)])));
              reg143 <= $signed(reg86[(1'h0):(1'h0)]);
              reg144 <= (reg37[(3'h5):(3'h5)] >>> ((~^$signed($signed(reg90))) | reg141));
            end
          else
            begin
              reg141 <= {({((reg63 ? reg80 : reg40) ?
                              $unsigned(reg90) : ((8'hbf) - reg90)),
                          reg64[(3'h6):(3'h4)]} ?
                      (((reg38 ? (8'ha0) : reg97) ?
                          $unsigned((8'had)) : $signed(wire99)) || $signed($signed(reg91))) : wire33[(3'h4):(1'h1)])};
              reg142 <= ((+$unsigned(($unsigned(reg88) ?
                  (reg40 ? wire60 : reg37) : reg80))) + (^~(^~(~(&wire34)))));
            end
          if ($signed(reg95))
            begin
              reg145 <= {(reg71 ?
                      (reg96[(2'h2):(1'h0)] ?
                          (reg143[(1'h0):(1'h0)] ?
                              $signed(reg67) : ((8'hb8) ?
                                  reg92 : reg41)) : ((&reg96) ?
                              (wire60 ? reg37 : reg85) : (reg91 ?
                                  reg80 : reg68))) : ($unsigned((8'hba)) ?
                          {{wire28}, (reg93 << reg64)} : ((wire34 ?
                                  reg38 : reg88) ?
                              (+reg78) : $unsigned(reg83)))),
                  reg86[(1'h0):(1'h0)]};
              reg146 <= reg37[(4'hc):(4'h8)];
              reg147 <= {(!$unsigned(($unsigned(reg80) ^ (8'hb3))))};
              reg148 <= $unsigned(reg76[(1'h0):(1'h0)]);
              reg149 <= (reg97[(3'h5):(1'h0)] <<< $signed((reg36[(3'h5):(2'h3)] ^~ reg94)));
            end
          else
            begin
              reg145 <= (wire29[(2'h2):(2'h2)] || ({(reg39[(2'h3):(2'h2)] ?
                          (wire29 ? reg68 : reg141) : {reg64}),
                      wire73} ?
                  $signed((reg66[(3'h5):(3'h4)] ?
                      reg87[(1'h1):(1'h0)] : (^~reg61))) : reg92[(3'h6):(2'h3)]));
              reg146 <= ((^(wire29 ?
                  $unsigned($signed(wire33)) : {(~|reg41)})) || (((|(reg80 ?
                      reg74 : (8'ha9))) * $unsigned(reg149)) ?
                  reg84[(2'h2):(1'h1)] : (+{(^~reg94)})));
            end
          reg150 <= (^~reg90);
        end
      else
        begin
          reg140 <= (8'hb1);
          reg141 <= reg72[(4'hb):(2'h2)];
          reg142 <= ($signed(((+$signed(reg86)) || ((reg92 ? (8'h9f) : wire33) ?
              (~reg39) : (~reg140)))) | ((($unsigned(wire30) ?
                  reg71[(3'h7):(3'h4)] : (7'h42)) ?
              ($unsigned(reg76) ?
                  reg91 : (|(8'hb2))) : ((reg79 < reg84) * (+reg95))) >= (($unsigned(reg62) <<< $unsigned((7'h42))) ?
              ((&reg39) ?
                  ((8'hbc) ?
                      reg64 : (7'h44)) : (|(8'hba))) : $unsigned((~(8'had))))));
        end
      if (((8'ha2) ?
          (reg142[(4'hb):(3'h6)] ?
              reg65[(1'h0):(1'h0)] : {($signed((8'hb6)) ^~ reg69[(4'h8):(4'h8)])}) : $unsigned($signed($signed((reg76 ^ (8'ha2)))))))
        begin
          if ($unsigned((reg84[(1'h1):(1'h1)] ?
              $unsigned($signed((|reg96))) : $signed(reg98[(3'h4):(1'h0)]))))
            begin
              reg151 <= ($signed(((~&(reg143 + reg67)) ?
                      reg74 : $signed((~reg74)))) ?
                  (reg83[(3'h6):(3'h5)] ?
                      $signed(($unsigned(reg42) ?
                          wire43[(1'h1):(1'h1)] : wire33)) : ((|$signed(reg62)) & (reg37[(4'hc):(1'h0)] ?
                          reg70[(3'h4):(2'h2)] : (&reg147)))) : (+$unsigned({$signed(reg75)})));
              reg152 <= (+($unsigned(($signed(reg74) ^~ (reg87 <= reg81))) ?
                  (-($signed(reg74) ?
                      $signed(wire32) : {reg66,
                          reg148})) : (~&$unsigned((8'ha4)))));
              reg153 <= ((-(reg146[(2'h3):(2'h3)] ?
                      (reg148 + (~|wire34)) : $signed(reg83))) ?
                  ((~reg97[(3'h5):(1'h0)]) == (reg68[(1'h0):(1'h0)] <= ($signed(reg150) ?
                      $unsigned(reg38) : (8'hbf)))) : (($unsigned(wire60) ?
                          reg150[(2'h2):(1'h1)] : ($signed(reg146) ?
                              reg62 : wire28[(1'h0):(1'h0)])) ?
                      wire35[(4'hb):(2'h3)] : (((!reg91) ?
                          (reg65 < reg142) : {(8'had),
                              reg76}) < ($signed((8'hb4)) ?
                          (reg142 ? reg150 : (8'hb9)) : $unsigned(reg68)))));
            end
          else
            begin
              reg151 <= $unsigned(reg40[(4'he):(4'hb)]);
              reg152 <= $signed((((|$signed(wire138)) && reg70[(4'ha):(3'h6)]) ?
                  $unsigned(reg147[(3'h6):(3'h4)]) : wire60));
              reg153 <= (~^$unsigned(reg90[(2'h2):(1'h0)]));
            end
          if ($signed($signed($signed(($signed(wire32) ?
              reg142 : (wire43 >> reg83))))))
            begin
              reg154 <= $unsigned($signed((wire60[(3'h4):(1'h1)] != reg151)));
              reg155 <= (&$signed((((^~reg147) ~^ (wire33 ?
                  reg83 : reg78)) || {$unsigned((8'h9d))})));
              reg156 <= $signed((8'ha1));
              reg157 <= {reg38[(3'h6):(3'h5)],
                  ({(~|(wire33 >= reg148))} ?
                      $unsigned($unsigned((+reg83))) : $signed(reg95[(3'h6):(3'h4)]))};
              reg158 <= (~^reg88);
            end
          else
            begin
              reg154 <= ($signed($signed(reg151)) != (8'h9d));
              reg155 <= $unsigned({reg150[(3'h7):(3'h7)]});
              reg156 <= (&((($unsigned(reg85) & ((8'ha1) ? reg38 : reg65)) ?
                  ((reg85 << reg156) ?
                      (reg157 ?
                          (8'hb0) : reg141) : wire99) : (reg85 || $unsigned(wire73))) >= (($signed(wire57) > $unsigned(reg69)) ?
                  (!(reg93 ~^ reg154)) : ((^~reg142) >>> reg62[(1'h0):(1'h0)]))));
            end
          if ((~^reg82[(1'h1):(1'h1)]))
            begin
              reg159 <= $signed((+(((reg91 >>> reg36) ?
                  (reg78 | reg150) : $signed(reg64)) <= $unsigned($signed(reg93)))));
              reg160 <= (reg75[(2'h3):(1'h1)] ?
                  $unsigned((-wire99[(3'h5):(3'h4)])) : $unsigned((7'h44)));
              reg161 <= $signed($unsigned($unsigned(((reg70 <= wire43) ?
                  (8'hb7) : $signed(wire28)))));
              reg162 <= $unsigned($unsigned($unsigned({(reg37 == reg36),
                  reg93[(3'h4):(2'h3)]})));
            end
          else
            begin
              reg159 <= $unsigned((+reg95));
            end
        end
      else
        begin
          reg151 <= {reg160[(3'h7):(2'h3)]};
        end
      reg163 <= wire28[(4'h9):(3'h5)];
      reg164 <= {reg160[(3'h7):(2'h2)],
          (|(({reg65} > (8'hb6)) ?
              (^~reg156[(5'h14):(5'h13)]) : reg36[(3'h5):(2'h2)]))};
    end
  assign wire165 = ((^($unsigned((reg158 >= reg86)) << reg80)) < ((^reg74) ?
                       $signed((reg95[(4'h9):(3'h4)] ?
                           (reg141 + reg95) : (|wire138))) : (reg95 ^ reg146[(2'h2):(1'h0)])));
  assign wire166 = (-reg78);
  always
    @(posedge clk) begin
      if ((^~(((^(reg65 ?
          wire57 : reg84)) ~^ (reg68[(3'h6):(1'h0)] || $unsigned(reg97))) | {($signed((8'haf)) ?
              {(7'h42), reg78} : (~^reg37))})))
        begin
          reg167 <= $signed((reg142 ?
              (~|(reg144 ? reg147[(1'h0):(1'h0)] : (+(8'hb5)))) : reg90));
          if ({$signed((wire29 ? reg81 : ((-reg92) > reg167[(5'h13):(4'hd)]))),
              $unsigned(((~$unsigned(reg75)) ?
                  ($signed(reg156) ?
                      $unsigned((8'hb5)) : $unsigned(reg167)) : $signed((&reg156))))})
            begin
              reg168 <= $unsigned($signed(($unsigned({(8'hb9),
                  wire29}) > ($signed(reg95) ? (~(8'hb7)) : (8'ha6)))));
              reg169 <= ((8'hbf) + (!({(reg82 >>> reg168)} ?
                  ((|reg36) ^~ (reg150 >>> reg38)) : ((~|reg66) > $signed(reg160)))));
              reg170 <= reg80;
            end
          else
            begin
              reg168 <= ((~&{(~|(reg169 ?
                      reg158 : (8'hb5)))}) * $signed($unsigned((!$unsigned(reg153)))));
              reg169 <= reg142;
              reg170 <= ($signed(($signed($unsigned(reg38)) << (-(wire34 ?
                      wire57 : reg91)))) ?
                  wire138 : $unsigned({((reg67 ? reg74 : (8'hbc)) ?
                          (reg147 ? reg140 : reg148) : reg95),
                      wire73}));
              reg171 <= $signed($unsigned((reg98 > (reg95[(2'h2):(1'h1)] <= (wire99 ?
                  reg150 : reg74)))));
            end
        end
      else
        begin
          if ((wire29[(1'h0):(1'h0)] >= (8'hbf)))
            begin
              reg167 <= $unsigned({{(~reg62[(4'ha):(1'h1)])}});
              reg168 <= (~&{reg143[(1'h0):(1'h0)]});
            end
          else
            begin
              reg167 <= $signed({$unsigned(reg163)});
              reg168 <= $signed(reg140);
              reg169 <= {reg93[(2'h3):(1'h1)], reg147};
            end
        end
      if ($signed(({(~^$unsigned((8'ha3)))} ?
          $signed(wire28[(2'h3):(1'h1)]) : (|(-(^~wire60))))))
        begin
          if (((((~$unsigned((8'ha3))) >>> (reg169 ?
              (wire35 ?
                  wire30 : reg64) : reg72[(4'hb):(3'h7)])) >> reg36) <= $unsigned((+reg153[(5'h10):(4'he)]))))
            begin
              reg172 <= ((((&(reg148 - reg80)) <<< reg89[(3'h7):(3'h7)]) ?
                  $signed(reg146) : $unsigned(($unsigned(reg92) > (reg140 ?
                      reg78 : reg84)))) == {(((reg159 ? wire34 : reg148) ?
                          $signed(wire29) : (!reg87)) ?
                      reg97 : reg150[(3'h5):(1'h0)]),
                  (&(~&reg147))});
              reg173 <= reg169;
            end
          else
            begin
              reg172 <= $unsigned((($unsigned(((8'hab) ?
                  reg97 : wire28)) ^ (|(reg74 ?
                  reg167 : reg76))) && {wire30[(4'h8):(2'h2)], reg153}));
            end
          if ($unsigned({(~^reg82[(2'h3):(2'h3)]), wire43}))
            begin
              reg174 <= reg38;
            end
          else
            begin
              reg174 <= $signed((((^~((8'h9d) ? wire31 : reg156)) ?
                      (~$signed(reg171)) : $signed($signed(reg155))) ?
                  $unsigned(($unsigned(reg145) ?
                      (reg160 ?
                          reg92 : reg93) : reg89)) : ($signed((^~reg151)) ?
                      $unsigned(wire57[(1'h0):(1'h0)]) : {(wire138 <= reg94),
                          reg169})));
              reg175 <= ((~((~&(^~reg152)) || ((reg96 ?
                      wire43 : reg82) ^~ $unsigned(reg153)))) ?
                  ((((^wire33) ?
                      $unsigned((8'hb1)) : reg157) ^~ (8'hb6)) >>> $signed((-$signed(wire28)))) : (reg151 ^ $unsigned(wire60)));
              reg176 <= reg152;
              reg177 <= {$unsigned($unsigned((+{reg41}))),
                  reg159[(2'h2):(1'h1)]};
            end
        end
      else
        begin
          reg172 <= (~|(8'hbb));
          if ($unsigned((~|reg71[(3'h6):(1'h1)])))
            begin
              reg173 <= reg64[(2'h2):(2'h2)];
            end
          else
            begin
              reg173 <= reg141;
              reg174 <= {$unsigned($unsigned($unsigned(reg156[(5'h10):(4'h8)]))),
                  $signed($unsigned(($unsigned(reg142) && reg41[(1'h1):(1'h0)])))};
              reg175 <= $unsigned(reg169[(4'ha):(3'h5)]);
              reg176 <= (~^reg172[(4'ha):(3'h6)]);
            end
        end
      reg178 <= ((reg79[(3'h6):(2'h2)] >>> ((-(reg75 ? reg168 : reg83)) ?
          (~^{reg36, reg98}) : (~|reg140))) >> reg90[(3'h5):(3'h4)]);
    end
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire signed [(4'h8):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire10;
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire10,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = wire8;
  always
    @(posedge clk) begin
      if (wire7[(4'h8):(3'h7)])
        begin
          if (wire10[(4'he):(4'hb)])
            begin
              reg11 <= {((~^{(~|wire7), wire8}) ?
                      (^~(wire6 * wire8[(1'h1):(1'h1)])) : ((wire7 <= {(8'hb1)}) ?
                          (wire9 ?
                              $signed((8'hbf)) : ((8'ha4) <<< wire9)) : (~$unsigned(wire9)))),
                  ({$signed(((8'hb6) ? wire9 : wire8)),
                      ((~&wire7) ?
                          (wire8 ?
                              wire7 : wire8) : (!wire9))} >= (^~(wire5[(3'h7):(3'h7)] ?
                      (~&wire6) : $unsigned(wire6))))};
            end
          else
            begin
              reg11 <= (((8'hbf) ? wire7[(3'h6):(2'h2)] : (8'hb4)) ?
                  wire6 : $signed((wire5 ?
                      ((wire7 != wire5) < (reg11 ?
                          wire9 : (8'hbf))) : (~|(wire5 > (8'had))))));
              reg12 <= {$unsigned($unsigned(wire5))};
            end
          reg13 <= wire9[(3'h5):(1'h1)];
          reg14 <= reg13;
        end
      else
        begin
          reg11 <= $signed(($signed(((wire7 ? reg13 : wire10) ^~ reg12)) ?
              (~(wire7 ?
                  wire10[(2'h2):(2'h2)] : (wire8 ?
                      (8'ha0) : wire7))) : $unsigned(reg13)));
        end
    end
  assign wire15 = $unsigned($unsigned((wire6 && (&wire6))));
  assign wire16 = (((~&wire5) ?
                      {(wire6[(3'h5):(1'h1)] < ((8'ha7) ?
                              reg13 : (8'hab)))} : reg12[(3'h6):(3'h5)]) <= ($signed({$signed(wire9),
                      $unsigned((8'hb4))}) >>> (wire7[(5'h10):(3'h6)] && (^$signed(wire15)))));
  assign wire17 = ((((|((8'ha3) <= wire7)) ?
                          $unsigned(reg12) : ($signed(wire10) ?
                              reg11[(1'h0):(1'h0)] : (wire7 ?
                                  wire15 : reg14))) ?
                      ({$signed((7'h42))} ?
                          ((wire15 ? wire10 : wire10) ?
                              (wire9 ?
                                  reg14 : wire16) : $unsigned(reg12)) : (+{reg13})) : wire9) << wire7);
  assign wire18 = (-wire8[(3'h5):(1'h1)]);
  assign wire19 = (8'ha1);
endmodule

module module100
#(parameter param136 = ({({((8'h9c) < (8'h9e)), (~&(8'hab))} ^ ((~(8'haa)) * ((8'hb1) * (7'h44))))} <<< (~&(&(((8'hb7) ^ (8'ha6)) == (^(8'ha2)))))), 
parameter param137 = (8'ha6))
(y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire105;
  input wire [(3'h7):(1'h0)] wire104;
  input wire [(5'h15):(1'h0)] wire103;
  input wire [(2'h2):(1'h0)] wire102;
  input wire [(5'h12):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire106 = (8'had);
  assign wire107 = wire104[(2'h2):(1'h1)];
  assign wire108 = ((((wire107[(4'h8):(3'h6)] ?
                               wire103 : (wire101 ? wire103 : wire103)) ?
                           $unsigned(wire107) : wire104) ?
                       $signed($unsigned(wire101[(4'hc):(4'ha)])) : (~&$signed($signed(wire107)))) | $unsigned(wire103[(3'h4):(1'h1)]));
  assign wire109 = (~^($unsigned($unsigned(wire104)) ?
                       ((&wire108[(2'h3):(2'h2)]) || wire101[(4'ha):(3'h6)]) : ($unsigned({wire101,
                           (8'ha6)}) && wire106[(2'h3):(1'h1)])));
  assign wire110 = $signed(wire102[(1'h0):(1'h0)]);
  assign wire111 = wire107;
  assign wire112 = $unsigned(((~&wire110[(3'h7):(3'h4)]) ?
                       wire101[(4'hb):(4'h9)] : $unsigned((~^((8'hbb) ?
                           wire109 : (7'h44))))));
  assign wire113 = ({$unsigned(wire102[(1'h1):(1'h0)])} ^ wire109[(2'h3):(1'h1)]);
  assign wire114 = (|wire107[(3'h6):(1'h0)]);
  assign wire115 = (~(8'hb2));
  assign wire116 = wire106;
  assign wire117 = wire108[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg118 <= (!(~|wire114[(4'hb):(1'h1)]));
      reg119 <= (wire102[(1'h1):(1'h0)] && wire116);
      reg120 <= $signed((7'h44));
      reg121 <= $signed((($unsigned((^~wire107)) ?
          (reg119 << $unsigned(wire112)) : $signed((wire105 ~^ reg119))) <<< wire117[(1'h1):(1'h1)]));
      if (wire108)
        begin
          if (reg120)
            begin
              reg122 <= wire115[(4'h8):(1'h0)];
              reg123 <= wire116[(1'h1):(1'h1)];
              reg124 <= (+(^wire113));
            end
          else
            begin
              reg122 <= wire114;
            end
          if (wire104[(3'h6):(3'h4)])
            begin
              reg125 <= (~reg121[(4'ha):(3'h5)]);
              reg126 <= $signed($unsigned($unsigned($unsigned(reg122))));
              reg127 <= ((wire114 ?
                  (~wire115) : ($signed(reg120) >> $unsigned(wire104))) || ((!$signed({reg124})) ?
                  wire110 : ($signed($unsigned(wire115)) ?
                      (^~$unsigned((8'hb2))) : ((wire114 & (8'ha9)) == (wire111 == wire110)))));
            end
          else
            begin
              reg125 <= ((($unsigned(wire110[(1'h0):(1'h0)]) ~^ (^~(~&wire104))) || (wire103[(4'hb):(2'h3)] ?
                  $signed(reg126[(4'hd):(3'h4)]) : {(wire113 ?
                          reg121 : wire116),
                      $unsigned((8'hb5))})) * (wire112[(5'h10):(4'hf)] ?
                  ({reg122, $signed(wire110)} << $unsigned((reg125 ?
                      reg124 : reg124))) : ({(wire108 && wire116)} ?
                      reg126 : ({(8'hbc)} >> reg122))));
              reg126 <= reg127;
            end
          reg128 <= wire106[(2'h3):(2'h2)];
          if ($signed((wire109[(1'h1):(1'h0)] ?
              (~wire113[(2'h3):(2'h3)]) : wire105[(2'h2):(1'h0)])))
            begin
              reg129 <= $unsigned($unsigned($unsigned(wire107)));
              reg130 <= reg123;
              reg131 <= (8'hae);
              reg132 <= $signed((reg119 + (8'hb9)));
              reg133 <= reg121;
            end
          else
            begin
              reg129 <= $signed((wire112 >> wire111));
              reg130 <= $unsigned(wire108[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg122 <= {(-reg120[(1'h1):(1'h0)])};
          reg123 <= $signed(wire113[(5'h10):(4'hd)]);
          if ((&$signed(($unsigned(reg132) ^~ (8'hb8)))))
            begin
              reg124 <= $signed((~(!$signed(reg118))));
              reg125 <= (|{{((wire103 <= (8'h9e)) < reg127[(1'h1):(1'h0)]),
                      {(reg130 ? reg128 : reg129),
                          (wire116 ? wire106 : wire109)}},
                  wire115});
              reg126 <= reg119[(3'h5):(2'h3)];
              reg127 <= reg128[(1'h0):(1'h0)];
            end
          else
            begin
              reg124 <= $signed(wire116);
            end
        end
    end
  assign wire134 = wire106[(3'h5):(1'h0)];
  assign wire135 = (8'ha7);
endmodule

module module44
#(parameter param55 = ({({((7'h43) ? (8'hac) : (8'hae)), ((8'ha1) ? (8'hb5) : (8'hab))} ? {(^~(8'hbd))} : ({(8'haa), (8'h9e)} ? (|(8'hba)) : ((7'h44) ? (8'hb4) : (7'h41))))} ? (-{{((8'hb1) ? (7'h44) : (8'had)), ((8'ha1) ? (8'ha9) : (7'h40))}}) : (&({((8'h9e) ? (8'hb6) : (7'h44)), ((7'h42) + (7'h41))} <<< (~^{(7'h40)})))), 
parameter param56 = (((~&((param55 ? param55 : param55) + ((7'h43) > param55))) - {((param55 >= param55) ? (^param55) : (param55 >= param55))}) >>> (8'hb4)))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire signed [(4'ha):(1'h0)] wire46;
  input wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  assign y = {wire54, wire53, wire52, wire51, wire50, wire49, (1'h0)};
  assign wire49 = $unsigned(wire46[(1'h1):(1'h0)]);
  assign wire50 = $unsigned(wire47);
  assign wire51 = ((wire46[(3'h7):(3'h5)] < ((((8'ha7) ?
                              wire46 : wire45) && (|wire47)) ?
                          ((wire50 ^ (8'hac)) ?
                              {wire50,
                                  (8'haf)} : (wire50 * wire47)) : $signed(wire50[(2'h3):(1'h1)]))) ?
                      {wire49[(4'hf):(3'h6)],
                          $unsigned(wire49)} : (~^$signed($unsigned($signed(wire45)))));
  assign wire52 = $signed(wire50);
  assign wire53 = (^~(|(wire45[(2'h3):(1'h0)] | wire49)));
  assign wire54 = $signed((($unsigned($signed(wire47)) ?
                          wire46 : (^~$signed(wire51))) ?
                      (+(8'ha0)) : (^~wire45)));
endmodule
