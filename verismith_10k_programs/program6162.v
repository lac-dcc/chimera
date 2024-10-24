module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire182;
  wire [(5'h10):(1'h0)] wire180;
  wire signed [(5'h15):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire93;
  reg signed [(5'h10):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg186 = (1'h0);
  reg [(3'h7):(1'h0)] reg185 = (1'h0);
  reg [(2'h3):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg183 = (1'h0);
  assign y = {wire182,
                 wire180,
                 wire95,
                 wire19,
                 wire6,
                 wire5,
                 wire4,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire93,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire4 = ({(+{wire3[(5'h10):(4'h8)]})} != $signed($signed($unsigned((^~wire3)))));
  assign wire5 = wire1;
  assign wire6 = wire1;
  module7 #() modinst20 (.y(wire19), .wire9(wire0), .wire8(wire5), .wire11(wire1), .clk(clk), .wire12(wire4), .wire10(wire2));
  assign wire21 = {(((&(wire4 ? wire3 : wire0)) ?
                          ($unsigned(wire0) >> wire2[(2'h2):(1'h0)]) : wire1) || wire0[(4'he):(2'h2)])};
  assign wire22 = $signed((wire6[(4'hb):(4'h9)] >> $unsigned($unsigned(wire4))));
  assign wire23 = {(&wire0[(4'hf):(3'h7)]), wire1};
  assign wire24 = ($signed(wire23) ?
                      $signed(((+(wire19 ?
                          wire0 : wire22)) & wire2[(4'ha):(2'h3)])) : ((~$signed((wire5 - wire19))) >> (($unsigned(wire23) ?
                              $signed(wire22) : $signed((8'hb9))) ?
                          ({wire19} | (wire3 || wire19)) : (!wire4))));
  assign wire25 = $signed($signed((+(((8'ha1) ? wire0 : (8'hba)) ?
                      wire2 : (wire22 ? wire2 : wire3)))));
  module26 #() modinst94 (.wire30(wire24), .y(wire93), .wire29(wire6), .clk(clk), .wire27(wire3), .wire31(wire22), .wire28(wire23));
  assign wire95 = $unsigned(wire5[(1'h0):(1'h0)]);
  module96 #() modinst181 (.y(wire180), .wire99(wire22), .wire98(wire21), .wire100(wire95), .wire97(wire19), .clk(clk));
  assign wire182 = $signed(wire180[(4'hf):(3'h5)]);
  always
    @(posedge clk) begin
      reg183 <= wire24[(5'h11):(3'h5)];
    end
  always
    @(posedge clk) begin
      if ((~&$unsigned(wire2[(3'h5):(3'h5)])))
        begin
          reg184 <= wire3[(5'h10):(4'hb)];
          reg185 <= reg183;
          if (({(+$signed(reg185[(2'h3):(1'h0)])),
              ($unsigned(((8'hb0) ?
                  wire21 : reg185)) ^~ $unsigned((~|wire21)))} ~^ ($unsigned((8'ha6)) ?
              wire4 : (($unsigned(wire3) ?
                  (~^(8'hb3)) : wire1) ^~ wire25[(2'h2):(1'h1)]))))
            begin
              reg186 <= $signed({(~^$signed((reg185 && wire1))),
                  $unsigned((~&wire5[(3'h4):(2'h3)]))});
              reg187 <= ((~|wire24) << (~wire4[(4'hb):(1'h0)]));
            end
          else
            begin
              reg186 <= $signed(reg183);
              reg187 <= $signed((^(8'hb1)));
            end
          reg188 <= (wire23[(4'hb):(3'h6)] ?
              (~{$signed($unsigned((8'haa)))}) : wire24[(2'h3):(2'h3)]);
        end
      else
        begin
          reg184 <= reg186;
          if ({$unsigned({wire19, $unsigned((!(8'hb0)))})})
            begin
              reg185 <= wire182;
            end
          else
            begin
              reg185 <= wire0[(5'h12):(5'h11)];
            end
          reg186 <= wire1[(4'ha):(4'h9)];
          reg187 <= ($unsigned(($unsigned($signed(wire5)) ?
                  wire2[(1'h1):(1'h0)] : wire5)) ?
              wire182 : $unsigned((|(^$unsigned(wire4)))));
        end
    end
endmodule

module module96
#(parameter param178 = ({(8'haa), (~^(~^(~(8'hbf))))} <<< (((|((8'ha7) > (8'hb3))) ? (!((8'hbf) ^~ (8'hba))) : {(^~(8'h9c))}) ^ ((~^((8'hb1) < (8'hb3))) ? ((-(8'ha8)) <<< ((8'hb2) ? (8'ha0) : (8'hbf))) : (((8'ha9) ? (8'h9c) : (8'hb8)) ? {(8'hbe)} : {(8'had)})))), 
parameter param179 = (^({((param178 ? (8'hb0) : param178) | (!param178))} ? {{param178, (-param178)}} : {((param178 * param178) || (^(8'hb9))), ((|param178) ^~ (param178 ? param178 : param178))})))
(y, clk, wire97, wire98, wire99, wire100);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire97;
  input wire [(5'h10):(1'h0)] wire98;
  input wire signed [(5'h14):(1'h0)] wire99;
  input wire signed [(5'h10):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire177;
  wire [(4'hf):(1'h0)] wire176;
  wire [(2'h3):(1'h0)] wire175;
  wire signed [(4'hc):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire102;
  wire [(2'h2):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire112;
  wire [(5'h12):(1'h0)] wire173;
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire173,
                 reg108,
                 (1'h0)};
  assign wire101 = $unsigned((&((wire99 < (wire100 ?
                       wire98 : wire98)) && wire98[(3'h4):(1'h1)])));
  assign wire102 = (~(|((~^wire101[(3'h4):(1'h1)]) ?
                       $signed(wire98[(3'h7):(3'h6)]) : wire100[(3'h6):(1'h0)])));
  assign wire103 = wire99[(5'h10):(4'h9)];
  assign wire104 = $unsigned((~^$unsigned(wire99)));
  assign wire105 = ($signed($signed((~((7'h41) != (8'ha9))))) & wire104);
  assign wire106 = wire99;
  assign wire107 = $unsigned((wire98[(1'h0):(1'h0)] - wire100));
  always
    @(posedge clk) begin
      reg108 <= wire106;
    end
  assign wire109 = $signed(($unsigned($signed(wire100[(3'h4):(3'h4)])) ?
                       (wire99 ^~ {(wire100 ? wire101 : (8'hb2)),
                           $unsigned(wire97)}) : $signed(((|wire106) ?
                           wire104 : (wire103 && wire100)))));
  assign wire110 = {($signed(reg108[(3'h7):(1'h0)]) ?
                           $unsigned(wire97[(1'h1):(1'h0)]) : (wire101[(4'ha):(4'h8)] ?
                               $signed(wire105) : ((wire97 >= wire98) ?
                                   wire101[(2'h3):(2'h3)] : (wire99 != (7'h44))))),
                       $unsigned(wire107)};
  assign wire111 = (wire107 ?
                       ($unsigned(wire110) <<< wire107) : $signed({(wire99 ?
                               $unsigned(wire102) : (wire106 ?
                                   wire106 : (8'hac))),
                           $signed((~^wire97))}));
  assign wire112 = ($signed(wire97[(1'h1):(1'h1)]) == (reg108 ?
                       (~&($signed((8'haa)) ^~ (reg108 || wire107))) : {wire100[(3'h7):(3'h7)],
                           (8'ha6)}));
  module113 #() modinst174 (.wire118(wire109), .clk(clk), .wire114(wire110), .y(wire173), .wire115(wire106), .wire116(wire112), .wire117(wire101));
  assign wire175 = ($signed($unsigned($unsigned(wire97))) ^ ((^~($unsigned(wire173) && {wire104,
                           wire173})) ?
                       $signed($unsigned($signed(reg108))) : {(wire173[(4'he):(4'hd)] + $signed(wire100))}));
  assign wire176 = $unsigned(((((&wire103) <= wire105[(4'h8):(2'h3)]) - ((wire106 < wire103) ?
                       (wire106 >= wire102) : (wire106 ?
                           wire101 : (8'had)))) ^ (^~$signed(((8'hb8) ?
                       wire109 : wire98)))));
  assign wire177 = wire107[(1'h1):(1'h1)];
endmodule

module module26
#(parameter param91 = (~(-(8'ha3))), 
parameter param92 = (+((!(param91 << (^~param91))) >> (({param91} | (+param91)) * (param91 == (param91 >> param91))))))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire31;
  input wire signed [(4'he):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  input wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  assign y = {wire90,
                 wire80,
                 wire79,
                 wire77,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire32 = (wire27[(2'h2):(1'h0)] <<< ((wire31[(3'h7):(2'h2)] <= ((wire30 | wire31) ?
                      (^~wire28) : $signed(wire29))) >>> (wire30[(4'h9):(1'h0)] || $unsigned((^~wire29)))));
  assign wire33 = $signed(wire31[(3'h5):(3'h4)]);
  assign wire34 = $signed($signed(wire28));
  assign wire35 = ({wire33[(5'h10):(3'h6)]} ?
                      ($signed(wire34) ?
                          wire30 : (~wire29[(4'hc):(2'h3)])) : (-(^~wire34[(1'h1):(1'h1)])));
  module36 #() modinst78 (wire77, clk, wire33, wire32, wire34, wire31);
  assign wire79 = (wire34 >>> ($unsigned($signed({wire31})) != {($signed(wire31) - $signed((8'ha0))),
                      $signed(wire31[(4'hb):(4'hb)])}));
  assign wire80 = $signed($signed(wire77));
  always
    @(posedge clk) begin
      if (wire77)
        begin
          if ((!wire28[(4'ha):(4'ha)]))
            begin
              reg81 <= $unsigned(((wire31[(2'h3):(2'h2)] ^ wire27) ?
                  $signed({((8'hab) >= wire30), (~|(8'hbc))}) : (((^~wire80) ?
                          {wire32, wire80} : wire34) ?
                      $unsigned($unsigned(wire79)) : ((wire30 <<< (8'hab)) << (~wire33)))));
              reg82 <= ($unsigned(($signed(wire32) ~^ wire77)) ?
                  ($unsigned($unsigned(((8'haa) && wire32))) ?
                      (~((~^wire77) ?
                          (wire27 ? wire31 : wire34) : {wire35,
                              wire29})) : ($signed($signed(wire77)) ?
                          ($signed((8'hbd)) ?
                              (wire35 ?
                                  wire27 : wire35) : $unsigned(wire33)) : wire34[(1'h0):(1'h0)])) : {((~&(8'ha4)) <<< (~^(+(8'h9f)))),
                      (((~|wire29) ~^ (~^wire77)) && (wire29 >= $unsigned(wire29)))});
              reg83 <= $unsigned(wire33);
              reg84 <= $signed({{((wire27 | wire77) || ((8'hb9) ?
                          reg83 : wire80)),
                      (((8'h9c) <= wire30) ^ wire77)}});
              reg85 <= wire30[(4'ha):(3'h4)];
            end
          else
            begin
              reg81 <= ($signed(({$unsigned(wire29)} ?
                      ((-reg83) ?
                          reg83[(2'h3):(2'h2)] : {reg82}) : $unsigned((~|wire27)))) ?
                  wire32 : $unsigned($signed(($unsigned(wire77) && (wire28 || reg83)))));
              reg82 <= reg84;
              reg83 <= ($signed(($signed((~|wire29)) != $unsigned($signed(wire28)))) ?
                  {$signed((&wire33)),
                      (wire33[(4'hc):(2'h3)] ?
                          (wire34[(2'h2):(1'h0)] ?
                              (^~wire31) : (wire79 + wire27)) : (8'hbd))} : (-$signed(((wire32 ?
                          reg85 : (8'hbf)) ?
                      reg84[(1'h1):(1'h0)] : wire27))));
            end
        end
      else
        begin
          if ((wire34[(4'h8):(3'h4)] + reg83))
            begin
              reg81 <= ((~^((wire33 ?
                  $signed(wire32) : (reg85 ? wire31 : wire32)) <= (-(reg85 ?
                  reg82 : reg82)))) + $unsigned((wire28[(4'h9):(4'h8)] ?
                  {$signed(reg83), wire35[(4'h8):(1'h0)]} : ($signed(wire35) ?
                      wire29[(3'h7):(3'h5)] : (wire34 ? wire35 : (8'hbc))))));
              reg82 <= (reg84 != ($unsigned($unsigned(wire77[(1'h1):(1'h0)])) ?
                  reg81 : (wire27 ? (8'hb3) : wire30)));
              reg83 <= $signed(($unsigned($signed($unsigned((8'hb0)))) ?
                  (($signed(wire27) ~^ wire34) & ($signed(wire80) & $unsigned(wire34))) : $unsigned($unsigned((wire30 >= wire33)))));
            end
          else
            begin
              reg81 <= $signed(reg85[(2'h2):(1'h1)]);
              reg82 <= $unsigned(wire33[(4'he):(3'h6)]);
              reg83 <= (~&$signed(wire31));
              reg84 <= $unsigned((({(wire27 ?
                          reg82 : reg82)} >> $signed($unsigned((8'hb5)))) ?
                  (wire34 ^ ((wire34 && wire33) ?
                      {reg81} : $unsigned((7'h42)))) : $signed(({reg83, reg84} ?
                      wire31[(3'h4):(2'h2)] : {wire33}))));
            end
          reg85 <= $unsigned((|$unsigned(((!wire33) ?
              $unsigned(reg85) : (wire30 ? reg83 : wire29)))));
          reg86 <= $unsigned(wire32[(4'hb):(2'h3)]);
          reg87 <= $unsigned(wire77);
        end
      reg88 <= {$unsigned((^$unsigned({(8'hbd), wire32}))),
          $signed((((wire80 ? (7'h40) : wire30) != $signed(reg83)) ?
              $signed((wire33 ~^ reg81)) : $unsigned(reg83)))};
    end
  always
    @(posedge clk) begin
      reg89 <= (wire77[(1'h1):(1'h1)] == (|{(^~reg88)}));
    end
  assign wire90 = wire29[(4'h9):(2'h2)];
endmodule

module module7
#(parameter param17 = (-((-((!(8'hb5)) < (~|(8'h9f)))) << (~^(((8'hbb) && (8'haf)) ? (~^(8'hbf)) : (~^(8'hb0)))))), 
parameter param18 = (7'h44))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  assign y = {wire15, wire14, wire13, reg16, (1'h0)};
  assign wire13 = wire8;
  assign wire14 = wire11[(4'hc):(4'h8)];
  assign wire15 = wire10;
  always
    @(posedge clk) begin
      reg16 <= $unsigned(((~^(8'hb3)) <<< (({wire14,
          wire8} >> $signed(wire14)) << (((8'ha2) >>> wire11) ?
          (wire11 ? wire14 : wire12) : (8'ha0)))));
    end
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  input wire [(4'hf):(1'h0)] wire38;
  input wire [(4'hf):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire43,
                 wire42,
                 wire41,
                 reg64,
                 reg63,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire41 = $unsigned(wire37[(4'hc):(1'h0)]);
  assign wire42 = (&wire39);
  assign wire43 = $unsigned({$unsigned($signed(((8'hb6) ? (8'hbf) : wire38)))});
  always
    @(posedge clk) begin
      reg44 <= $signed($signed((~|wire38)));
      reg45 <= $signed(((((wire43 ? wire39 : wire42) == (8'ha9)) ?
              $unsigned((wire43 - (7'h43))) : (+reg44[(4'h9):(3'h6)])) ?
          wire39[(2'h3):(2'h3)] : wire37));
      reg46 <= reg44;
      if (wire39[(4'ha):(3'h6)])
        begin
          if (((+reg45[(1'h1):(1'h0)]) != ($signed(($unsigned(reg46) | (+reg46))) ?
              $signed($unsigned({wire39})) : $signed(($signed(wire43) != ((8'ha9) ~^ reg44))))))
            begin
              reg47 <= {reg44, $signed((wire39 >= (reg44 <= (~&wire43))))};
              reg48 <= wire43;
              reg49 <= $signed(reg47);
              reg50 <= $unsigned($unsigned($signed(((reg46 + wire43) < (reg49 ?
                  wire43 : reg45)))));
            end
          else
            begin
              reg47 <= $unsigned({$signed(({reg46} | (reg50 ?
                      (8'h9c) : reg46))),
                  {$unsigned((reg50 ? wire40 : reg45))}});
              reg48 <= (~^(7'h44));
              reg49 <= (~^({$unsigned((|reg49)), reg47[(2'h2):(1'h1)]} ?
                  (-(^~wire39)) : ((wire43[(2'h3):(1'h1)] >= reg44) ?
                      (~|(reg50 + wire38)) : {(8'hb0)})));
              reg50 <= (!(wire38[(4'h9):(3'h4)] << {$unsigned($signed(reg49))}));
            end
          reg51 <= {$unsigned((wire43[(3'h6):(3'h4)] || reg49)),
              reg48[(3'h5):(2'h3)]};
          reg52 <= reg50;
          if (reg46[(3'h5):(1'h0)])
            begin
              reg53 <= reg52;
              reg54 <= $signed(reg53[(1'h0):(1'h0)]);
            end
          else
            begin
              reg53 <= $unsigned(reg44[(4'hc):(4'hb)]);
              reg54 <= $signed(wire40);
              reg55 <= reg48;
              reg56 <= $signed(({(((8'ha9) <= (8'hbc)) | (8'ha1)),
                      reg46[(4'h8):(3'h6)]} ?
                  {((reg46 ? (8'haa) : reg45) ?
                          reg45[(5'h12):(1'h0)] : (!reg45)),
                      $signed((~&reg44))} : (&(^~wire40[(4'h9):(2'h2)]))));
              reg57 <= {(($signed(wire39[(4'hf):(4'ha)]) ~^ reg44[(4'hf):(2'h3)]) ?
                      $unsigned(({reg44} ?
                          (wire37 & (8'h9e)) : wire40)) : (reg50[(1'h1):(1'h0)] ?
                          ({wire43} != $unsigned(wire42)) : reg52)),
                  $unsigned(reg46)};
            end
          reg58 <= reg46[(3'h5):(3'h5)];
        end
      else
        begin
          reg47 <= ((!reg53[(2'h3):(1'h1)]) <= reg55[(1'h0):(1'h0)]);
          reg48 <= ($unsigned(wire42) ?
              $unsigned(($signed((reg58 ? reg52 : reg53)) ?
                  reg47[(2'h3):(1'h1)] : ((8'h9f) != (reg54 ?
                      reg46 : wire40)))) : (-reg46));
          if ($signed({(wire41[(5'h10):(4'ha)] ?
                  (reg48 >> (reg45 > reg49)) : ($signed(wire37) || $unsigned(reg47)))}))
            begin
              reg49 <= {reg44[(1'h0):(1'h0)]};
              reg50 <= $unsigned(($signed(wire39) ?
                  (+reg46[(3'h7):(3'h6)]) : (((reg52 ? reg50 : reg46) * reg44) ?
                      $signed(wire40[(4'h9):(4'h9)]) : ((8'hb8) ?
                          $unsigned(reg56) : (~reg47)))));
              reg51 <= reg48[(4'he):(2'h2)];
            end
          else
            begin
              reg49 <= $unsigned(((8'ha4) ?
                  reg51[(2'h2):(1'h0)] : (reg54 ?
                      reg55 : {reg45, reg46[(1'h1):(1'h1)]})));
              reg50 <= $unsigned($signed($unsigned(($signed(reg44) <<< (8'hbd)))));
            end
          reg52 <= ((($unsigned((+reg45)) ?
              ($signed((7'h42)) | {reg48}) : $unsigned(reg50)) >>> wire43[(4'h9):(3'h7)]) || {{(~wire37[(4'ha):(3'h4)]),
                  ((~|reg44) != (~|reg56))}});
        end
      if ($signed(reg46))
        begin
          reg59 <= $signed(($unsigned((~(wire41 ?
              reg47 : wire38))) <= ($unsigned((^~(8'ha9))) >= (wire41 ?
              wire40[(2'h3):(1'h1)] : $unsigned(reg53)))));
          reg60 <= $signed(reg44);
          reg61 <= {(wire39 ?
                  reg48[(4'h8):(3'h6)] : (reg49[(3'h6):(1'h1)] ?
                      ((~^(8'hab)) > (wire40 ^ wire43)) : $signed(wire38))),
              (8'hb5)};
          reg62 <= wire41[(2'h3):(1'h1)];
          reg63 <= $signed((^$signed($signed($unsigned(wire42)))));
        end
      else
        begin
          reg59 <= wire40;
          if ($signed(($signed($unsigned($signed(wire37))) ^ (8'hab))))
            begin
              reg60 <= reg47;
              reg61 <= reg49;
            end
          else
            begin
              reg60 <= wire43[(3'h4):(1'h1)];
              reg61 <= $unsigned({reg50[(2'h2):(1'h0)],
                  (&((wire43 || wire37) ?
                      (wire42 >>> (7'h43)) : $unsigned((7'h42))))});
              reg62 <= $unsigned((!(reg51 != {$unsigned(reg56),
                  (reg53 ? (8'hbd) : (8'h9d))})));
            end
          reg63 <= reg49;
          reg64 <= (~&(!(~^((reg58 < (8'hb3)) < $unsigned((8'hb6))))));
        end
    end
  assign wire65 = {(8'h9d), $unsigned($signed((7'h40)))};
  assign wire66 = $unsigned(reg53[(3'h6):(2'h3)]);
  assign wire67 = $signed($signed((!$signed(wire38[(3'h7):(3'h7)]))));
  assign wire68 = ((8'ha9) == reg60);
  assign wire69 = $unsigned($signed($unsigned($signed(reg48))));
  assign wire70 = (-$signed((8'hb4)));
  assign wire71 = {$signed(reg60[(1'h0):(1'h0)]),
                      $unsigned($signed($unsigned($signed(wire65))))};
  assign wire72 = {$unsigned((($unsigned(reg50) && {reg51}) ?
                          {reg62, (wire38 != reg59)} : $signed({wire70,
                              reg58}))),
                      reg64};
  assign wire73 = (~(~((~|$signed(wire38)) ?
                      (+$signed(wire40)) : $unsigned($signed(wire66)))));
  assign wire74 = wire68;
  assign wire75 = {wire68[(2'h2):(1'h0)],
                      $signed(((8'hb4) ^~ ($signed((8'hbc)) ?
                          wire66 : (~|wire70))))};
  assign wire76 = ($signed(reg44) >= $signed(reg60[(3'h4):(1'h0)]));
endmodule

module module113  (y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h283):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire118;
  input wire [(4'hc):(1'h0)] wire117;
  input wire signed [(3'h4):(1'h0)] wire116;
  input wire [(4'hc):(1'h0)] wire115;
  input wire signed [(3'h6):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire159;
  wire [(5'h14):(1'h0)] wire158;
  wire [(4'h9):(1'h0)] wire157;
  wire signed [(5'h10):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire151;
  wire signed [(4'hb):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire148;
  wire signed [(4'h8):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire119;
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg [(4'hf):(1'h0)] reg164 = (1'h0);
  reg [(5'h12):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(2'h2):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire151,
                 wire149,
                 wire148,
                 wire147,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg150,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
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
                 (1'h0)};
  assign wire119 = (^($signed(({wire118,
                       wire116} != $unsigned(wire115))) * ((|(wire117 | wire114)) ?
                       ($signed(wire116) >>> $unsigned(wire117)) : $signed($signed(wire117)))));
  assign wire120 = (^$unsigned($unsigned(wire118[(5'h10):(3'h4)])));
  assign wire121 = wire118;
  assign wire122 = $signed((~(8'hbf)));
  always
    @(posedge clk) begin
      if (wire116[(3'h4):(2'h2)])
        begin
          if ((wire115[(3'h5):(2'h3)] - (&wire118[(2'h2):(2'h2)])))
            begin
              reg123 <= {$signed((wire115 ?
                      wire115 : $signed($unsigned(wire117)))),
                  $signed($signed(wire117))};
            end
          else
            begin
              reg123 <= reg123;
              reg124 <= $unsigned(($signed($unsigned({(8'hb4),
                  wire117})) >= ($unsigned((^~reg123)) ?
                  $signed(((8'h9e) & (8'hb0))) : wire117)));
              reg125 <= $signed(wire117[(2'h3):(2'h2)]);
              reg126 <= reg124;
            end
          reg127 <= wire118[(4'hb):(4'h8)];
          reg128 <= ((wire116 ?
              {(wire120[(3'h4):(3'h4)] ?
                      wire117 : $unsigned(wire115))} : ($unsigned((reg124 != wire118)) > wire114)) >= (~|(wire120[(1'h0):(1'h0)] ?
              {$signed(reg126), wire120} : (~^((8'ha7) + wire118)))));
        end
      else
        begin
          if (reg123[(2'h2):(1'h1)])
            begin
              reg123 <= reg124;
              reg124 <= reg124[(4'ha):(3'h4)];
              reg125 <= $unsigned((~|reg125));
              reg126 <= $unsigned($unsigned({wire120,
                  {wire114[(2'h3):(2'h3)]}}));
              reg127 <= reg127;
            end
          else
            begin
              reg123 <= ($unsigned($unsigned((~^(~|wire121)))) + reg127[(2'h3):(1'h1)]);
              reg124 <= $unsigned($signed((wire114 ?
                  ($signed(wire117) <<< (!reg124)) : ($unsigned(wire121) ?
                      (reg127 ? reg127 : reg128) : (reg123 ?
                          wire114 : (8'ha6))))));
              reg125 <= {wire122, {reg125}};
            end
          reg128 <= (~^$signed(reg127[(2'h3):(1'h0)]));
          if (wire114[(3'h4):(1'h0)])
            begin
              reg129 <= $unsigned(($unsigned($unsigned(wire115[(3'h4):(1'h0)])) ?
                  $signed($unsigned((reg128 ?
                      reg124 : reg124))) : ((wire119[(1'h1):(1'h1)] ?
                          wire114 : $signed(wire117)) ?
                      (|reg123[(2'h2):(1'h1)]) : reg128)));
              reg130 <= ($unsigned({(reg128[(3'h7):(3'h5)] ?
                          (&reg126) : {(8'hba)}),
                      (((7'h44) + reg129) ?
                          (reg129 ? reg127 : (8'hab)) : (reg125 ?
                              reg124 : wire120))}) ?
                  reg128[(4'h8):(3'h6)] : wire119);
              reg131 <= (~($unsigned((!wire118[(4'hd):(3'h6)])) << ($unsigned(reg123[(2'h3):(2'h3)]) ?
                  $signed($unsigned(reg123)) : $unsigned($signed(wire117)))));
            end
          else
            begin
              reg129 <= $unsigned($signed($unsigned({$unsigned(reg125),
                  (wire120 * wire121)})));
              reg130 <= ((wire118 ^~ wire115[(3'h6):(2'h3)]) * $signed($unsigned((reg127[(2'h3):(2'h2)] != $signed((8'hb1))))));
              reg131 <= $unsigned($unsigned($signed(reg130)));
              reg132 <= $signed($signed((($signed(wire118) - $signed(reg126)) != reg123)));
              reg133 <= $signed((wire120 ?
                  ((-$unsigned((8'ha8))) ?
                      $unsigned(wire118[(3'h6):(1'h1)]) : reg130) : $signed((reg124[(5'h12):(3'h6)] ?
                      {wire118, reg131} : (-wire117)))));
            end
          if (wire117[(4'ha):(3'h6)])
            begin
              reg134 <= reg130[(4'ha):(4'h8)];
              reg135 <= (reg133 | $unsigned($unsigned($unsigned(reg131[(1'h1):(1'h1)]))));
              reg136 <= (wire114 ?
                  (wire116 ?
                      ($unsigned(reg135) >= wire119[(3'h6):(3'h5)]) : (~^wire118[(4'h8):(3'h4)])) : ((~&($unsigned(reg134) << (reg125 && (8'ha2)))) != $unsigned((wire116[(3'h4):(1'h1)] ?
                      (reg124 ^ wire118) : $unsigned((8'ha8))))));
              reg137 <= reg133;
              reg138 <= $unsigned((~&wire119[(2'h3):(1'h1)]));
            end
          else
            begin
              reg134 <= (^~$unsigned({($signed(reg127) ?
                      (|reg128) : {reg137})}));
              reg135 <= (wire114 ^~ ({$unsigned((reg132 ? reg123 : reg124))} ?
                  reg138[(3'h4):(3'h4)] : wire119[(4'h8):(3'h4)]));
            end
          reg139 <= ($signed(($signed($signed(reg125)) & {(wire119 <= reg134)})) ?
              ((~&$unsigned($signed(wire121))) ?
                  (8'hae) : $signed({(wire114 <<< reg135),
                      reg136})) : (~^{$signed(wire121)}));
        end
      if ((&$signed((^~$signed((wire117 ? reg129 : wire117))))))
        begin
          reg140 <= wire121[(4'h9):(1'h0)];
        end
      else
        begin
          if ({(+(-$signed(reg136)))})
            begin
              reg140 <= ($unsigned(($signed(wire120[(1'h0):(1'h0)]) * (~$signed(reg132)))) ?
                  $signed(reg126) : wire120[(3'h4):(3'h4)]);
              reg141 <= ($signed((8'hb5)) > (8'h9c));
              reg142 <= $unsigned($unsigned(reg137));
            end
          else
            begin
              reg140 <= reg133;
            end
          reg143 <= (8'hb7);
        end
      reg144 <= $unsigned(($unsigned((!reg141[(4'hc):(1'h0)])) ?
          ((~|(reg142 <= reg135)) | $signed(wire120)) : (|(8'hb5))));
    end
  always
    @(posedge clk) begin
      reg145 <= $signed((reg144 ?
          ($unsigned((~reg128)) ?
              $signed((wire114 < reg136)) : reg139[(4'hf):(4'h8)]) : $unsigned(reg127[(1'h1):(1'h0)])));
      reg146 <= (+{{(reg135[(1'h1):(1'h1)] ?
                  reg133[(3'h6):(3'h5)] : $unsigned(wire122))}});
    end
  assign wire147 = ($signed((((|reg134) || $signed(wire118)) == {$signed(wire120),
                           (reg142 ? reg139 : reg133)})) ?
                       (wire115 && (~&($signed((8'hb2)) * wire120[(1'h1):(1'h0)]))) : $unsigned((reg129 ?
                           (&$unsigned((8'ha3))) : (^(+wire118)))));
  assign wire148 = (8'hb4);
  assign wire149 = wire121;
  always
    @(posedge clk) begin
      reg150 <= reg145;
    end
  assign wire151 = (+((((^~reg150) ?
                           ((7'h43) ^~ wire115) : $signed(wire116)) >>> ((reg150 ?
                               reg139 : reg127) ?
                           $signed(reg142) : reg143[(2'h3):(2'h3)])) ?
                       $unsigned(reg146) : reg145));
  always
    @(posedge clk) begin
      reg152 <= ($unsigned($signed({$signed(wire121)})) || (|$unsigned((~&reg145[(2'h2):(1'h0)]))));
      reg153 <= ({wire122} << $unsigned((7'h44)));
      reg154 <= {(!{{(reg135 ? reg135 : (7'h40)), (wire151 && reg127)},
              {wire148}})};
      reg155 <= reg136[(1'h0):(1'h0)];
    end
  assign wire156 = (|($unsigned(reg134[(3'h4):(2'h3)]) ?
                       reg144 : {{$signed(reg136)}}));
  assign wire157 = $signed({($unsigned((~|reg135)) ?
                           reg133 : $signed((reg134 != wire120)))});
  assign wire158 = ((~^(~|((reg137 - reg143) <<< $signed(reg125)))) ?
                       (~^$unsigned((8'haa))) : ($unsigned((reg154[(1'h1):(1'h0)] - $signed(reg124))) ?
                           $unsigned({$signed(wire147)}) : reg142));
  assign wire159 = ($unsigned({(reg143 >= ((8'ha4) ? reg128 : reg136))}) ?
                       $signed((wire149[(4'h9):(4'h8)] ?
                           (8'ha6) : $unsigned((wire157 ?
                               (7'h43) : reg135)))) : reg123[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg160 <= {{((!wire121[(3'h7):(2'h2)]) == {(reg128 ? reg141 : reg139),
                  wire118})},
          wire158[(5'h11):(4'hb)]};
      reg161 <= (-reg125[(3'h5):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg162 <= $signed($unsigned((~($signed(reg138) ?
          (+wire115) : (wire156 == reg139)))));
      reg163 <= $unsigned(((|$signed(reg133)) ?
          $signed((&{reg133, reg133})) : ((&$signed(reg160)) ?
              ($unsigned(wire116) ?
                  (7'h43) : reg144[(4'hc):(2'h3)]) : reg161)));
    end
  always
    @(posedge clk) begin
      reg164 <= $unsigned(wire119[(2'h3):(2'h2)]);
      reg165 <= $signed({(wire156[(3'h7):(1'h1)] ?
              reg129 : reg134[(1'h0):(1'h0)])});
      if (({reg155[(3'h5):(1'h0)]} ^~ reg161[(3'h4):(1'h0)]))
        begin
          reg166 <= (-$signed($unsigned($unsigned($signed(reg138)))));
          reg167 <= {(reg142[(3'h4):(2'h3)] ?
                  (~&(reg125 ?
                      reg139 : $unsigned(reg140))) : reg150[(3'h5):(1'h0)])};
          reg168 <= ($signed({$unsigned((-(8'ha2))), {$unsigned((8'hb4))}}) ?
              $signed((((~|reg128) ? (wire118 ? (8'hb3) : reg141) : reg126) ?
                  {reg138, {reg123}} : $signed({wire121,
                      reg163}))) : (~|((~|wire119) ?
                  ({reg155} <<< $signed(wire148)) : $signed($signed(reg136)))));
        end
      else
        begin
          reg166 <= {(^wire149),
              ((reg138[(1'h1):(1'h0)] ?
                      {$signed((8'hae))} : reg139[(1'h1):(1'h1)]) ?
                  wire151[(4'ha):(3'h6)] : $unsigned($signed($signed(reg126))))};
          reg167 <= $unsigned((!reg143));
          reg168 <= reg161[(1'h0):(1'h0)];
          reg169 <= $signed($unsigned(reg162));
          if (wire159[(4'hb):(2'h2)])
            begin
              reg170 <= (^~(~$signed(reg168)));
              reg171 <= wire157[(2'h2):(2'h2)];
              reg172 <= ((($unsigned($unsigned(wire158)) ?
                  $unsigned((~^wire117)) : $unsigned(reg143)) * {($unsigned(reg136) != $unsigned(wire119))}) ^ $signed($signed($unsigned(reg136[(3'h5):(1'h0)]))));
            end
          else
            begin
              reg170 <= (((~^(~$unsigned(wire157))) == wire120[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned($signed((reg163 + reg168)))) : $unsigned(((reg141 < (~|wire118)) ?
                      reg153 : (reg125[(1'h0):(1'h0)] ?
                          (+reg145) : (wire114 ? reg143 : (8'hb7))))));
              reg171 <= wire120;
            end
        end
    end
endmodule
