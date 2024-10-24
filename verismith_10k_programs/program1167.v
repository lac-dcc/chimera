module top
#(parameter param110 = (({(((8'h9c) + (8'ha0)) <<< ((8'hbc) ~^ (8'ha9))), (((8'ha1) << (8'ha7)) >>> ((7'h42) ? (8'h9e) : (8'ha7)))} ? {(8'hba)} : (+{(7'h42), (8'hbb)})) ? (((&((8'hbe) ? (8'hb7) : (8'hb5))) <<< (~&((8'haa) + (8'hbd)))) * {((~&(8'hb0)) & (7'h42)), (|(~(8'ha1)))}) : ({(~&(-(8'hbe))), (((8'h9d) ^~ (8'hab)) ? ((8'haa) ? (8'hb3) : (7'h40)) : ((7'h40) ? (8'hbc) : (8'h9f)))} > ({((8'hbe) && (8'haf))} < {(^(8'h9e)), ((8'ha0) - (7'h41))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire107;
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  assign y = {wire109, wire80, wire85, wire107, reg82, reg83, reg84, (1'h0)};
  module5 #() modinst81 (.wire6(wire2), .wire9(wire4), .y(wire80), .wire7(wire3), .clk(clk), .wire8(wire0));
  always
    @(posedge clk) begin
      reg82 <= $signed((^~(8'hbc)));
      reg83 <= ({(wire4[(5'h10):(4'h8)] * (&$signed((8'hb3))))} || (wire3[(3'h7):(3'h4)] >= wire4[(3'h4):(1'h1)]));
      reg84 <= (wire80 < ($unsigned(($signed(reg83) >>> (wire4 && reg83))) ?
          $signed(((^~wire0) ^ wire1)) : (8'haf)));
    end
  assign wire85 = {(~^$unsigned(((-wire2) | $signed(reg84)))),
                      $unsigned($unsigned((wire4[(5'h10):(3'h6)] ?
                          wire80 : $unsigned(wire2))))};
  module86 #() modinst108 (.wire90(reg83), .wire87(wire80), .wire89(wire3), .clk(clk), .wire88(wire85), .y(wire107));
  assign wire109 = (~&wire85);
endmodule

module module86
#(parameter param106 = {{(-(((8'hbd) ? (8'haf) : (8'hae)) ? {(8'hbc), (8'hb5)} : (|(7'h41))))}})
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire90;
  input wire [(5'h14):(1'h0)] wire89;
  input wire signed [(4'h8):(1'h0)] wire88;
  input wire signed [(5'h12):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire104;
  wire [(5'h13):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire92,
                 wire91,
                 reg105,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire91 = (((~&(|$signed((7'h44)))) ?
                      (wire89[(4'hb):(3'h5)] ?
                          $signed($signed(wire90)) : ($signed((8'hb6)) <<< (wire88 * wire89))) : {wire87[(4'h9):(3'h7)]}) ~^ (&(((wire89 | (8'ha0)) ?
                      $unsigned(wire87) : $signed(wire89)) >>> $signed($signed(wire87)))));
  assign wire92 = $unsigned(wire89);
  always
    @(posedge clk) begin
      reg93 <= wire92[(3'h7):(3'h5)];
      reg94 <= wire89;
      if ((((($unsigned(reg94) ? wire91 : (8'ha8)) ?
                  ($signed(reg93) != $unsigned(reg94)) : (wire87[(4'he):(3'h7)] || {wire90})) ?
              wire88[(1'h0):(1'h0)] : $unsigned(((~wire90) >>> reg94[(2'h3):(2'h2)]))) ?
          wire89 : {$signed($signed({wire88, wire89})),
              {{wire92}, (~^(reg93 <<< wire88))}}))
        begin
          reg95 <= $unsigned($unsigned($unsigned(wire92[(3'h4):(2'h3)])));
          if (($signed((8'h9c)) ?
              wire90 : $signed((($signed(wire92) << $unsigned(wire91)) <= wire89[(4'ha):(3'h7)]))))
            begin
              reg96 <= $unsigned(((-$unsigned((8'ha7))) ?
                  $unsigned((~(^(8'ha5)))) : (-reg94)));
              reg97 <= $unsigned(reg93[(2'h3):(2'h2)]);
              reg98 <= wire87;
              reg99 <= (~|{(8'hbb)});
            end
          else
            begin
              reg96 <= (^$signed($signed(((~|wire89) >> $unsigned(reg93)))));
              reg97 <= (~&$signed((~&wire87)));
            end
          reg100 <= (~|$signed(wire87));
          reg101 <= wire92;
        end
      else
        begin
          reg95 <= $signed($unsigned(reg94[(1'h1):(1'h1)]));
          reg96 <= $unsigned((((~reg101) ?
              wire87[(4'h9):(3'h5)] : {wire89[(1'h0):(1'h0)]}) ~^ (($signed(wire89) <<< $unsigned(wire90)) ?
              (&wire87[(4'h9):(1'h1)]) : wire89[(4'h8):(2'h3)])));
          if (((^~$unsigned((^~reg95))) >= reg94[(1'h0):(1'h0)]))
            begin
              reg97 <= (wire90 ?
                  ({wire88} ?
                      {((wire91 ?
                              reg96 : wire89) <= (wire91 <<< wire91))} : reg94[(1'h0):(1'h0)]) : wire87[(1'h0):(1'h0)]);
              reg98 <= (~$unsigned(reg99));
              reg99 <= ($signed($signed((reg97 | reg99[(3'h5):(1'h0)]))) ?
                  reg99 : $signed(wire89[(3'h6):(1'h1)]));
              reg100 <= ($unsigned((~$unsigned(reg93))) & $signed($unsigned((~|$signed(reg95)))));
            end
          else
            begin
              reg97 <= wire91;
              reg98 <= (wire91[(3'h4):(1'h1)] ?
                  {(-(~|$signed((8'hb5)))), reg99} : ((^~(reg94[(2'h3):(2'h3)] ?
                          wire90[(1'h1):(1'h1)] : $signed((8'hb6)))) ?
                      reg101[(1'h0):(1'h0)] : wire89));
            end
        end
    end
  assign wire102 = reg94;
  assign wire103 = (~|(7'h41));
  assign wire104 = $unsigned((|$signed(wire87)));
  always
    @(posedge clk) begin
      reg105 <= $signed((~&$signed($signed(wire90))));
    end
endmodule

module module5
#(parameter param79 = (((({(8'haa)} ? (~&(8'ha2)) : (8'ha5)) ? {(+(8'hbd))} : ((~|(8'hb3)) ? ((8'ha6) ? (8'hb6) : (8'h9c)) : ((8'h9e) <= (8'hae)))) >>> ((((8'had) >> (8'ha7)) ? {(8'hbb)} : (-(8'hbf))) >>> (((8'h9e) <= (8'ha8)) ^ {(8'hb3)}))) ? {({((8'ha3) > (8'hbb)), ((8'hb4) > (8'hbe))} >= {(8'hbc)}), {(-{(8'hb1)}), ((~^(8'ha6)) ? ((8'hb1) ? (8'hac) : (8'haa)) : ((8'h9c) ? (8'haf) : (8'hbf)))}} : {(~|(((8'hb6) ? (8'ha3) : (8'had)) ? (8'hb1) : ((8'hb3) ? (8'hbf) : (8'hb3)))), ({((7'h44) ^~ (8'ha9)), (&(8'hb0))} ? (-((8'ha7) ~^ (8'had))) : (~((8'hb3) >> (8'h9d))))}))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire70;
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire70,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $signed($signed($signed($unsigned(wire6))));
    end
  assign wire11 = wire8[(2'h2):(1'h0)];
  assign wire12 = (8'hbd);
  assign wire13 = ($unsigned((-$signed(reg10))) + $signed($unsigned($unsigned(wire9[(4'ha):(2'h3)]))));
  assign wire14 = wire8[(1'h1):(1'h0)];
  module15 #() modinst71 (.wire16(wire9), .wire19(wire6), .clk(clk), .y(wire70), .wire18(reg10), .wire17(wire13));
  assign wire72 = wire6;
  assign wire73 = ($signed(((wire70[(5'h14):(5'h14)] ?
                          wire7 : (wire7 ?
                              wire6 : (8'hb8))) ^~ ({wire12} || {wire6,
                          wire70}))) ?
                      {$signed((+{wire13, wire12})),
                          $signed(wire7[(4'h9):(3'h4)])} : wire70[(5'h14):(4'he)]);
  assign wire74 = ((^(({(8'haa)} * wire14[(3'h7):(1'h1)]) ?
                          (wire11 ?
                              wire11[(3'h6):(3'h5)] : (^~wire8)) : $unsigned(((8'hb5) ?
                              (8'hbd) : wire7)))) ?
                      ((&$signed({wire7})) >= $signed((~(wire12 ?
                          wire12 : reg10)))) : ((-$unsigned($unsigned(wire6))) + (!{$unsigned((8'hac))})));
  assign wire75 = (wire7[(4'hf):(3'h4)] ?
                      wire11[(4'h9):(4'h8)] : ($signed(($unsigned((8'hb8)) ?
                              wire12 : (wire72 ? wire11 : wire9))) ?
                          wire11 : ((8'haa) ? wire6 : wire73[(3'h6):(3'h4)])));
  assign wire76 = wire72;
  assign wire77 = $unsigned(wire7);
  assign wire78 = $unsigned(wire9[(5'h12):(4'hd)]);
endmodule

module module15
#(parameter param68 = (~(-(!{(~(8'ha6)), ((8'hac) < (8'h9f))}))), 
parameter param69 = (param68 ? (param68 != {(~(^~param68)), param68}) : ({(8'ha4), param68} >= ((^~(~^param68)) ? param68 : (8'hb2)))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h233):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire48,
                 wire47,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire20 = $unsigned(wire19[(2'h2):(1'h0)]);
  assign wire21 = {(wire17 == (8'h9f)), wire17};
  assign wire22 = (^(+wire19[(1'h0):(1'h0)]));
  assign wire23 = (wire19[(1'h1):(1'h1)] ^ (({wire19[(1'h0):(1'h0)]} ?
                          (!wire21[(2'h3):(2'h2)]) : $signed($unsigned(wire16))) ?
                      ($unsigned(wire18[(1'h0):(1'h0)]) ?
                          wire21 : $unsigned($signed((8'h9e)))) : wire22[(4'h9):(3'h5)]));
  assign wire24 = ((+((+$unsigned(wire17)) || ((wire16 ?
                      wire20 : wire20) >= {wire20,
                      wire18}))) == {(wire17[(3'h7):(3'h7)] ?
                          (+$unsigned(wire16)) : (|wire20))});
  assign wire25 = wire23;
  always
    @(posedge clk) begin
      if (wire16)
        begin
          if ($signed(wire16[(3'h7):(2'h3)]))
            begin
              reg26 <= (&(^wire22[(4'h8):(1'h0)]));
              reg27 <= wire21[(4'h8):(3'h4)];
              reg28 <= reg27[(1'h1):(1'h1)];
            end
          else
            begin
              reg26 <= $unsigned(($unsigned($unsigned((^~wire16))) | wire25[(2'h2):(2'h2)]));
              reg27 <= ($signed({$unsigned(wire20[(4'hb):(4'hb)]),
                      $unsigned(((8'ha8) ^~ wire20))}) ?
                  ((((wire16 & reg27) >>> wire18) && $signed(reg27[(1'h0):(1'h0)])) | $signed($signed(reg28[(2'h2):(1'h1)]))) : (+(^(-(^~wire17)))));
              reg28 <= ((8'h9f) ?
                  ($unsigned((((8'haf) ? wire23 : wire25) ?
                      $signed((8'h9c)) : reg28[(4'hb):(3'h4)])) || $signed(wire21)) : ($unsigned(({wire19,
                          wire24} ?
                      {wire18} : $unsigned((8'hb7)))) ^~ $signed(reg27)));
            end
          reg29 <= (wire24 != $unsigned(($signed(((8'ha7) ?
                  (8'ha4) : (8'haa))) ?
              (8'had) : $signed($unsigned(reg28)))));
          if ($signed((+({$signed(wire20), (wire18 * (8'hb0))} - reg26))))
            begin
              reg30 <= wire22[(3'h6):(3'h5)];
              reg31 <= $signed($signed(wire17));
              reg32 <= $unsigned({wire25});
              reg33 <= $unsigned($signed((+(&{reg29, (8'hbb)}))));
              reg34 <= wire18[(2'h2):(2'h2)];
            end
          else
            begin
              reg30 <= reg29[(4'hc):(4'hc)];
              reg31 <= reg31;
              reg32 <= wire16[(4'h8):(2'h3)];
              reg33 <= reg33[(2'h2):(1'h1)];
              reg34 <= wire24;
            end
          reg35 <= (^$unsigned((+$signed((^wire17)))));
          reg36 <= reg32[(4'ha):(1'h1)];
        end
      else
        begin
          reg26 <= $signed(((~&({wire24} <= wire24)) ?
              reg34[(2'h2):(1'h1)] : ({reg35} ?
                  $signed((-wire17)) : $signed((wire23 || reg32)))));
          if ($signed({$unsigned(wire21),
              (~^($signed((8'ha7)) ? $signed(reg36) : reg32))}))
            begin
              reg27 <= (wire22[(4'ha):(4'h9)] ?
                  reg26[(1'h0):(1'h0)] : (~&$unsigned($unsigned((reg36 ?
                      reg26 : reg33)))));
              reg28 <= {$unsigned((&$signed((reg36 > wire18)))),
                  ($signed(wire20[(4'hd):(1'h0)]) << reg33[(2'h3):(1'h0)])};
            end
          else
            begin
              reg27 <= reg27;
              reg28 <= $unsigned({$unsigned(($signed(wire17) == (~&wire17)))});
              reg29 <= reg33;
              reg30 <= {{($signed($unsigned(reg28)) || $signed(reg34))}};
            end
        end
      if ($unsigned($unsigned($unsigned($unsigned((|(8'ha9)))))))
        begin
          if ((wire17[(4'h8):(3'h6)] ? {reg35} : reg32))
            begin
              reg37 <= wire17[(2'h2):(1'h0)];
              reg38 <= $signed(reg34);
              reg39 <= (reg30 ? (!reg29) : $signed(reg34[(2'h2):(2'h2)]));
            end
          else
            begin
              reg37 <= $signed($unsigned(({wire18[(1'h1):(1'h0)],
                  $unsigned(reg30)} + $unsigned((wire16 ? reg39 : reg28)))));
              reg38 <= (~|wire25);
              reg39 <= ($unsigned(wire19[(1'h1):(1'h0)]) ?
                  (^~wire19) : (^(&(&reg31[(1'h0):(1'h0)]))));
            end
          reg40 <= (^~$unsigned($unsigned((reg35[(2'h3):(1'h1)] ?
              $unsigned(reg35) : wire20))));
          reg41 <= {$signed((|reg38[(1'h0):(1'h0)]))};
          if ((($unsigned($signed((reg37 < wire19))) >>> (8'ha8)) != wire22[(2'h3):(2'h2)]))
            begin
              reg42 <= (reg28 ?
                  (wire20 ?
                      $unsigned((wire23 < reg32)) : $unsigned((~&{wire20}))) : wire24[(3'h7):(3'h4)]);
              reg43 <= reg37[(3'h5):(1'h0)];
              reg44 <= $signed(($unsigned((wire20[(4'he):(4'h8)] ?
                      reg32[(3'h6):(2'h3)] : reg27[(4'h8):(1'h1)])) ?
                  $signed((8'hbf)) : wire22));
              reg45 <= ($signed(reg41) ?
                  (~^(+((reg32 ? reg31 : reg40) ?
                      {wire24} : $unsigned((8'hb4))))) : (+{$unsigned(wire23)}));
              reg46 <= $signed(reg39);
            end
          else
            begin
              reg42 <= $signed(($unsigned((^~(reg31 & reg42))) >> {$signed({wire20}),
                  reg41}));
              reg43 <= $signed(($unsigned(wire18) ~^ (~((8'ha1) ?
                  $signed(reg42) : (8'hb0)))));
              reg44 <= $unsigned(($signed($signed(reg32)) >= ((reg38 * ((8'ha5) >= reg35)) + $signed((~|wire18)))));
            end
        end
      else
        begin
          reg37 <= ($unsigned(wire21) - $signed((($unsigned(reg37) || wire23) ^~ $unsigned((8'hb7)))));
          reg38 <= (wire16 & reg39);
        end
    end
  assign wire47 = $unsigned($unsigned(wire21[(4'h8):(2'h3)]));
  assign wire48 = (~^$unsigned(wire22[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      reg49 <= ((~&{(8'ha1), {wire22}}) ?
          wire18[(3'h5):(1'h1)] : ((~&$unsigned(reg37[(1'h0):(1'h0)])) ?
              $unsigned((~^$signed(wire20))) : $signed((wire48[(3'h4):(3'h4)] & (8'ha0)))));
    end
  always
    @(posedge clk) begin
      reg50 <= {((($unsigned(reg46) ? $signed(wire20) : (-reg31)) ?
              {(reg31 >> reg42),
                  (wire25 ?
                      (8'h9c) : (8'had))} : (^(reg28 >>> reg40))) ^ $signed(reg30[(2'h2):(1'h1)])),
          wire19};
      reg51 <= $signed($signed($signed($unsigned($unsigned(reg30)))));
      if ((!((reg39[(2'h3):(2'h2)] >>> ((~reg42) ^~ (reg36 | wire25))) <= {(7'h44),
          (~^reg46[(3'h6):(1'h1)])})))
        begin
          reg52 <= reg37[(2'h2):(2'h2)];
          reg53 <= reg30;
          reg54 <= $signed({($signed((wire17 ? reg27 : reg51)) ?
                  ((wire20 ?
                      reg38 : wire23) && (reg40 + reg49)) : {reg51[(1'h1):(1'h0)],
                      {wire18, reg31}}),
              reg34[(2'h2):(2'h2)]});
        end
      else
        begin
          if ((reg46[(3'h7):(3'h5)] ^~ reg27[(3'h5):(2'h3)]))
            begin
              reg52 <= ($signed(reg54) && {(({wire24,
                          reg45} << $unsigned(reg44)) ?
                      reg39[(1'h0):(1'h0)] : reg50)});
              reg53 <= $unsigned(reg43);
              reg54 <= $unsigned(((+reg41[(4'hb):(3'h7)]) ?
                  ((+((8'ha1) >>> reg35)) ^~ reg53[(3'h6):(3'h5)]) : $signed((wire19 - {reg52,
                      wire47}))));
              reg55 <= ($unsigned((wire21[(1'h0):(1'h0)] ?
                  reg51 : ({(8'hbd),
                      reg40} >>> reg45[(3'h4):(3'h4)]))) >>> {{wire16[(4'he):(4'hd)],
                      $unsigned($signed((8'ha6)))},
                  (($unsigned(reg27) >> reg51[(2'h2):(1'h0)]) ?
                      $signed((7'h43)) : (+(reg27 <<< reg49)))});
            end
          else
            begin
              reg52 <= $signed(($unsigned((~reg37[(2'h2):(1'h0)])) ?
                  reg37[(3'h5):(3'h4)] : $signed({(^wire21), reg54})));
            end
          if ({reg53, $unsigned(reg42)})
            begin
              reg56 <= $signed(($unsigned((~|wire22[(4'hb):(4'hb)])) == ((reg33[(2'h2):(2'h2)] << $signed(reg54)) & (8'hba))));
              reg57 <= (({$signed(reg44[(4'h9):(4'h8)])} & wire16) == (&{reg46,
                  reg50[(2'h3):(2'h3)]}));
              reg58 <= (wire24 - wire25[(3'h5):(3'h5)]);
              reg59 <= $signed((~|(reg46[(2'h2):(1'h0)] ?
                  ((+reg49) == reg37) : $signed(reg57))));
              reg60 <= $unsigned(reg27[(4'h9):(1'h0)]);
            end
          else
            begin
              reg56 <= wire17[(3'h6):(3'h5)];
            end
        end
      if ({$signed({(~|$unsigned(reg50)), {(reg37 > (8'hb5)), (8'ha3)}}),
          $signed($signed($signed((reg51 <= reg53))))})
        begin
          reg61 <= $unsigned(((reg51 ? $unsigned({wire20}) : reg59) ?
              $unsigned(((+wire48) ? $signed(reg52) : (+(8'ha6)))) : reg41));
          reg62 <= $signed((8'h9f));
          if ((reg50[(1'h0):(1'h0)] ?
              (&(+({wire21, reg28} || (&reg28)))) : ((|reg59) ?
                  $unsigned($signed({wire16,
                      (7'h44)})) : wire18[(2'h3):(2'h3)])))
            begin
              reg63 <= reg62;
            end
          else
            begin
              reg63 <= (reg29[(4'hf):(1'h0)] >> reg30[(3'h5):(3'h4)]);
            end
        end
      else
        begin
          if ($unsigned(($unsigned(({reg44,
              reg56} && wire25[(4'he):(1'h1)])) & wire16)))
            begin
              reg61 <= (((reg44[(3'h6):(1'h1)] ?
                      $signed($signed(reg27)) : wire48) ?
                  (reg34 > {(~^wire22), reg60}) : {((^reg55) ?
                          (~&(8'hb1)) : (-wire16)),
                      (~|(!reg62))}) - $unsigned(reg56));
              reg62 <= (~&reg30);
              reg63 <= ($signed($signed((~(reg27 ?
                  reg51 : reg58)))) || (wire21[(2'h2):(1'h1)] ?
                  $unsigned($signed((~&reg60))) : ((reg32[(3'h7):(1'h1)] ?
                          reg59[(4'hc):(3'h7)] : $signed(wire22)) ?
                      ((wire47 * (8'hb0)) << $unsigned(reg54)) : reg40)));
              reg64 <= (($signed($signed((wire23 ?
                  reg46 : reg29))) && (reg29[(3'h5):(1'h1)] ?
                  {$signed((8'hb8)),
                      (wire19 >> (8'haa))} : (~&$unsigned(reg40)))) - ((-reg54[(4'hb):(3'h6)]) ?
                  reg49 : $unsigned((reg61 ?
                      (reg43 <<< reg60) : $unsigned(reg32)))));
            end
          else
            begin
              reg61 <= {$unsigned($signed(($signed(reg26) ?
                      reg45[(4'hc):(4'h8)] : (reg27 < reg33)))),
                  (((~|$signed(reg28)) ?
                      $unsigned($unsigned((8'ha2))) : (~&((8'hb5) ~^ reg31))) <= $signed($unsigned((+reg34))))};
            end
        end
    end
  assign wire65 = wire16[(1'h1):(1'h1)];
  assign wire66 = (wire22[(4'hf):(4'hb)] ?
                      (($signed($unsigned(reg58)) ?
                              ((~^reg50) ?
                                  $signed(wire22) : $unsigned(reg57)) : ((reg49 - reg27) ?
                                  (-(7'h44)) : reg31)) ?
                          ($signed(reg38) ?
                              (reg38[(2'h3):(1'h0)] ?
                                  reg31[(4'h8):(3'h4)] : (-(8'hb2))) : (~^reg37)) : (~^reg38)) : reg64);
  assign wire67 = {(~({wire23} + $signed(wire48)))};
endmodule
