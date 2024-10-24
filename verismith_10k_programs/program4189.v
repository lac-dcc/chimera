module top
#(parameter param116 = {(~^(^{((8'hb3) != (8'hb1))})), ((({(8'hbe), (8'ha1)} > {(8'hab), (8'h9f)}) ^~ ({(8'hb1)} * ((8'hbc) ? (8'haf) : (7'h42)))) ? (-((^(7'h42)) >> (!(8'hb9)))) : (~&((8'hbc) ? (~^(8'hba)) : ((7'h43) << (8'ha2)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire111;
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire12,
                 wire13,
                 wire111,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = ({(wire3 ~^ ($signed((8'h9f)) ? (!wire5) : $unsigned(wire0))),
                     $signed($signed((!wire2)))} >= (((&wire1) > (wire1 - (wire1 ?
                         wire4 : wire5))) ?
                     $unsigned((^(!wire5))) : $unsigned((^wire4[(4'hb):(3'h7)]))));
  assign wire7 = $signed($signed((wire3 ?
                     wire6[(4'hc):(2'h3)] : (^~$unsigned(wire5)))));
  assign wire8 = (wire5[(2'h2):(2'h2)] >= $signed((-wire6)));
  always
    @(posedge clk) begin
      reg9 <= (wire5 + {(^wire8[(4'h8):(2'h3)]), {wire5}});
      reg10 <= (wire2 ?
          (-($unsigned({wire4, wire6}) ?
              ((7'h43) ?
                  {wire3} : reg9[(2'h3):(1'h1)]) : wire0)) : (^((^(wire0 > wire4)) ?
              ((|wire1) ?
                  $unsigned(wire6) : $unsigned(wire0)) : ((wire7 + wire3) ?
                  (wire7 ^~ wire6) : (wire3 ? (8'ha5) : reg9)))));
      reg11 <= $unsigned(wire1[(3'h7):(2'h3)]);
    end
  assign wire12 = wire8;
  assign wire13 = $signed(wire1[(1'h0):(1'h0)]);
  module14 #() modinst112 (wire111, clk, wire12, wire6, wire0, wire13, wire3);
  assign wire113 = (wire1[(2'h2):(1'h1)] ?
                       $signed({wire5,
                           wire5[(1'h1):(1'h1)]}) : ($unsigned((~^wire6[(4'h8):(2'h3)])) - $signed($signed((wire7 >> (8'hb6))))));
  assign wire114 = $unsigned((~^wire8));
  assign wire115 = ((8'h9c) ^~ (((7'h40) >= (&(~^wire8))) ?
                       (((wire2 >> wire12) >>> (-reg11)) <= ((~|(8'hb5)) <= wire12)) : (~$unsigned({wire5}))));
endmodule

module module14
#(parameter param109 = ((((((8'hbc) & (8'hab)) - ((8'hb2) - (8'hb4))) ? ((+(8'ha4)) ? ((8'ha8) ? (7'h42) : (8'hb7)) : (^~(8'ha1))) : ((8'haf) ~^ ((8'ha1) ? (8'h9f) : (8'h9e)))) ? ((^~(+(7'h44))) & ((^(8'hb9)) ? ((8'hab) ~^ (7'h43)) : {(8'hb7), (7'h41)})) : ((~&(~&(8'ha1))) ? ((|(8'hba)) + ((8'ha2) ? (8'hae) : (8'hbb))) : {(|(8'h9d)), ((8'hb0) == (8'hb7))})) ? {((((8'ha9) ? (7'h44) : (8'haa)) ? ((8'hbc) ? (7'h42) : (8'haf)) : ((8'ha1) ? (8'ha4) : (8'hb8))) ? (~^((8'ha6) ? (8'hb5) : (8'ha3))) : ((~(8'ha7)) ? ((8'h9c) << (8'hbb)) : ((8'hb4) ? (8'had) : (8'hba))))} : ((({(8'hbb)} ? (^~(7'h42)) : ((8'hbd) == (8'ha5))) >> (((8'hbc) ? (8'hbc) : (8'hb7)) > ((8'h9e) ? (8'ha1) : (8'hbb)))) ? (({(8'hb6), (8'h9e)} <= ((8'hb5) ? (7'h41) : (8'hbb))) * {((8'ha1) | (8'ha7)), ((8'hbd) - (8'hac))}) : ((~^((8'hb2) ? (8'ha3) : (8'hb0))) ? (((8'ha2) ? (8'hae) : (8'h9e)) || (^~(8'hba))) : (~^(^~(8'hb5)))))), 
parameter param110 = ((({(-param109)} | {(param109 ? param109 : param109), param109}) <<< {(param109 + (^~param109))}) >= (({(|param109)} ? param109 : (8'ha0)) ? (param109 ? ((~&(7'h40)) | (param109 ? param109 : param109)) : param109) : param109)))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire92;
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire96,
                 wire95,
                 wire94,
                 wire45,
                 wire47,
                 wire48,
                 wire92,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  module20 #() modinst46 (wire45, clk, wire16, wire19, wire15, wire18, wire17);
  assign wire47 = $unsigned(wire17[(2'h2):(1'h0)]);
  assign wire48 = wire15[(2'h2):(2'h2)];
  module49 #() modinst93 (.wire54(wire15), .wire50(wire48), .wire51(wire16), .clk(clk), .y(wire92), .wire53(wire19), .wire52(wire17));
  assign wire94 = ($unsigned(((~^(&wire92)) >>> wire16[(1'h1):(1'h0)])) == $signed($signed(wire47[(2'h2):(2'h2)])));
  assign wire95 = wire92[(5'h10):(3'h4)];
  assign wire96 = (((^~({(8'h9f)} <= wire92[(1'h1):(1'h1)])) ?
                          ($unsigned((wire18 ?
                              wire48 : wire48)) <<< wire16[(4'h9):(1'h0)]) : (wire18 ?
                              (^wire19[(2'h2):(2'h2)]) : (8'ha8))) ?
                      wire15[(1'h0):(1'h0)] : $signed(wire92));
  always
    @(posedge clk) begin
      reg97 <= wire18[(4'hc):(1'h0)];
      if ($unsigned(($unsigned((+wire45)) ?
          $signed(wire96) : $signed((8'ha5)))))
        begin
          reg98 <= ($unsigned($signed(wire94[(5'h14):(4'h8)])) ?
              {wire15[(4'h8):(1'h0)]} : wire45);
          if ($unsigned($unsigned({((wire19 >>> (7'h43)) >>> (wire94 <= (7'h42))),
              wire18})))
            begin
              reg99 <= {wire92[(4'h8):(2'h2)],
                  (!((reg97 ? (&wire15) : $signed(wire15)) ?
                      $unsigned((wire47 | wire95)) : (~&$signed(reg98))))};
              reg100 <= wire17[(3'h4):(1'h0)];
              reg101 <= {$signed((~(~^(8'ha0)))),
                  $signed((!($signed(wire96) >> wire96)))};
              reg102 <= wire15;
              reg103 <= ($signed((&wire92)) == $signed((((~reg100) ^ (&wire16)) || $unsigned((wire45 ?
                  wire92 : wire47)))));
            end
          else
            begin
              reg99 <= (-$signed($unsigned($unsigned($unsigned(wire96)))));
              reg100 <= ($unsigned({wire96}) ?
                  $signed(wire17[(1'h0):(1'h0)]) : (~({(wire17 * reg100)} ?
                      ($unsigned((7'h44)) ?
                          (wire19 + wire18) : reg103) : wire45[(3'h5):(2'h3)])));
            end
          reg104 <= ($unsigned((wire95[(3'h4):(2'h2)] != wire18)) ?
              wire47[(1'h0):(1'h0)] : ((-((^~(8'hba)) ?
                  (~&(8'ha7)) : (wire94 < reg97))) & ((reg103 && (wire17 ?
                  reg98 : (8'haa))) + (reg101[(2'h2):(1'h1)] < {wire94,
                  (8'hae)}))));
          reg105 <= $signed($signed($signed(reg101[(3'h4):(1'h0)])));
          reg106 <= $unsigned({{{(wire16 ? reg103 : reg98)}, wire45}});
        end
      else
        begin
          reg98 <= $unsigned($signed($signed(((wire19 || reg102) > $unsigned(wire17)))));
          reg99 <= wire92[(4'h9):(3'h5)];
        end
    end
  assign wire107 = (wire15 ?
                       {reg99} : $unsigned((|($signed(reg99) >>> (reg100 ?
                           wire94 : reg103)))));
  assign wire108 = (^~$unsigned(($signed(wire18) ?
                       ({wire107} + wire107) : wire17[(4'ha):(4'ha)])));
endmodule

module module49  (y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire54;
  input wire [(3'h6):(1'h0)] wire53;
  input wire [(4'he):(1'h0)] wire52;
  input wire signed [(4'ha):(1'h0)] wire51;
  input wire [(4'hc):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
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
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire55 = (-wire50);
  assign wire56 = wire54;
  assign wire57 = (~(wire50 ?
                      wire55[(4'hb):(1'h0)] : ($signed(wire53[(2'h3):(2'h3)]) && (~$signed(wire51)))));
  assign wire58 = ((8'hb5) ?
                      $unsigned(wire56[(1'h1):(1'h0)]) : (~|{(~^$unsigned(wire56)),
                          (~|{wire53})}));
  assign wire59 = wire53[(2'h2):(1'h1)];
  assign wire60 = wire50;
  always
    @(posedge clk) begin
      reg61 <= wire56;
      reg62 <= $signed($signed($unsigned($signed($signed(wire53)))));
      reg63 <= $signed($unsigned(((wire54[(4'h8):(2'h2)] <<< $unsigned(wire56)) > (reg61 ?
          (wire51 ? wire60 : wire58) : $signed(wire52)))));
      if ((($signed((wire54 + $signed(wire53))) ^ $signed(($unsigned(wire60) ^ {wire50,
              wire56}))) ?
          ($signed(wire53[(2'h2):(2'h2)]) ?
              (reg62 != wire54) : ((!(wire56 & reg63)) ?
                  $signed(wire53) : $signed($unsigned(wire51)))) : wire53[(3'h6):(2'h2)]))
        begin
          reg64 <= wire53[(1'h1):(1'h1)];
          reg65 <= {($unsigned(({wire51, wire53} | {reg63})) ?
                  $unsigned(wire51[(3'h5):(1'h1)]) : (^wire50)),
              (~^wire59)};
          reg66 <= wire55[(4'ha):(4'ha)];
        end
      else
        begin
          reg64 <= $signed((reg61 ?
              ({((8'hba) ? wire53 : wire53),
                  $unsigned((8'hb2))} >> (-(wire50 == wire54))) : reg65));
        end
    end
  assign wire67 = $signed(wire59);
  assign wire68 = ($unsigned($unsigned((8'ha6))) || reg63[(5'h13):(5'h10)]);
  assign wire69 = {wire55};
  assign wire70 = reg63;
  assign wire71 = {(wire68 ?
                          $unsigned((^(wire69 & (8'haa)))) : $unsigned((8'ha2))),
                      $signed($unsigned(((!reg65) ?
                          (!(8'ha1)) : (wire52 <<< reg66))))};
  assign wire72 = wire68[(5'h12):(4'h9)];
  assign wire73 = wire54;
  assign wire74 = wire70[(3'h7):(3'h6)];
  assign wire75 = $signed($signed(wire69));
  assign wire76 = ((^wire69[(1'h0):(1'h0)]) ?
                      (+{{(wire75 ? (8'hba) : wire70),
                              {(8'hbe)}}}) : $unsigned(((wire59 << ((8'haf) ?
                          wire58 : wire53)) != ((~^wire57) <= $unsigned(wire73)))));
  always
    @(posedge clk) begin
      reg77 <= ({(reg62 < reg65[(4'ha):(3'h6)])} && $unsigned(wire56));
      reg78 <= (~|reg77);
    end
  always
    @(posedge clk) begin
      reg79 <= wire60[(4'h8):(3'h7)];
      reg80 <= (^reg61);
      reg81 <= {(($signed(wire57) != wire76[(4'h8):(4'h8)]) < (wire71 ?
              $unsigned(wire52[(4'hc):(1'h0)]) : (8'hb9)))};
    end
  always
    @(posedge clk) begin
      reg82 <= (8'ha9);
      reg83 <= $signed(reg65);
      if (wire70[(2'h2):(1'h0)])
        begin
          reg84 <= ({wire56[(2'h2):(1'h1)],
                  (({wire60} ? reg64[(2'h3):(2'h3)] : wire53[(3'h4):(1'h0)]) ?
                      (((7'h42) ? wire60 : wire60) ?
                          (~^reg61) : (wire55 ? wire56 : wire73)) : {wire52})} ?
              $unsigned({wire76}) : ((((wire74 ?
                      wire56 : wire57) ^ $signed(wire76)) << (wire71[(3'h5):(2'h3)] | (^~wire55))) ?
                  $unsigned((wire68[(1'h0):(1'h0)] ?
                      $unsigned(wire58) : (wire60 + wire75))) : ({$signed(wire52)} ?
                      $unsigned(wire73) : (8'hbc))));
          reg85 <= $signed({(reg64[(2'h2):(1'h1)] ?
                  (~&reg78) : $unsigned((reg82 <= reg83)))});
        end
      else
        begin
          if (reg62[(3'h5):(1'h1)])
            begin
              reg84 <= ({wire72} <= $signed(((8'hb2) || wire52)));
              reg85 <= $unsigned($signed((~(reg84 ?
                  $signed(wire69) : $signed((7'h43))))));
            end
          else
            begin
              reg84 <= (|$unsigned($unsigned(wire57[(3'h6):(3'h4)])));
              reg85 <= $signed(reg81);
              reg86 <= ((($signed($signed(wire73)) >>> reg78) < $unsigned((wire67 >= reg78[(1'h0):(1'h0)]))) ^ ((8'ha8) ?
                  $unsigned((^~reg78)) : (&wire69)));
            end
          reg87 <= (wire72[(1'h1):(1'h1)] >> (8'haa));
        end
      reg88 <= (+(+(~((reg78 ? reg80 : reg87) - {(8'ha8)}))));
      reg89 <= {wire51,
          (($unsigned((wire71 << wire75)) ?
                  ((wire51 ? reg80 : reg88) < (^~wire60)) : (~|(wire70 ?
                      wire52 : wire50))) ?
              (^(reg63[(3'h6):(1'h0)] || $unsigned(wire76))) : $unsigned(($signed(wire60) <= $signed(reg77))))};
    end
  always
    @(posedge clk) begin
      reg90 <= {reg78};
      reg91 <= ($unsigned({((~|wire52) != wire55[(4'h8):(1'h1)])}) ?
          ($signed(($signed((8'hb6)) ?
              (wire68 ?
                  reg62 : wire55) : $signed(reg78))) + wire72) : ((~^wire58) + reg90[(3'h4):(1'h0)]));
    end
endmodule

module module20
#(parameter param43 = (((~&(~|{(8'hb4), (8'hbe)})) ? (^((8'hae) > (~|(8'h9e)))) : ((!(8'hba)) ? ((&(8'h9c)) | (8'ha7)) : (((8'hab) ? (7'h43) : (7'h41)) ? ((8'h9d) ? (8'hb2) : (8'hb1)) : (~^(7'h43))))) ? (8'hb7) : ((8'ha6) ? (8'haf) : ((^~(|(7'h43))) ~^ {((8'ha7) ? (8'ha4) : (8'hbb))}))), 
parameter param44 = {((((~&param43) ? (param43 * param43) : param43) <= ((~^param43) ? param43 : param43)) && ((((8'hb2) == param43) >> (^param43)) ? {(param43 ? param43 : param43)} : param43)), (^~((param43 << param43) != (~|(param43 << (8'haf)))))})
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire [(5'h14):(1'h0)] wire23;
  input wire signed [(4'hd):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
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
                 (1'h0)};
  assign wire26 = wire23[(5'h12):(3'h7)];
  assign wire27 = $signed($unsigned($signed(((~^wire24) ?
                      $signed(wire21) : (wire24 * wire26)))));
  assign wire28 = (~^$signed(wire26));
  assign wire29 = wire28;
  assign wire30 = ({((|(wire26 ? wire25 : wire26)) ?
                              $unsigned(((8'hac) ^~ wire25)) : ($unsigned(wire27) ?
                                  wire26 : (wire22 ? wire21 : wire22)))} ?
                      {wire26, wire27[(4'h9):(4'h9)]} : ((!wire26) ?
                          (~|$signed(wire29[(2'h2):(1'h1)])) : (((~&wire24) >>> (8'hb0)) > ($unsigned(wire22) ?
                              wire23 : (^(8'ha6))))));
  always
    @(posedge clk) begin
      if (wire29[(3'h4):(1'h1)])
        begin
          if ((~|wire22[(4'hd):(3'h6)]))
            begin
              reg31 <= (wire24[(2'h3):(1'h0)] ?
                  {wire23,
                      $unsigned((^~(wire28 >= wire29)))} : wire27[(3'h6):(2'h3)]);
              reg32 <= ($signed(wire29) ?
                  wire29 : $unsigned((($signed(reg31) >= wire23) ?
                      wire29 : wire22)));
              reg33 <= wire30[(2'h2):(1'h1)];
              reg34 <= reg32;
              reg35 <= $unsigned((~&wire30));
            end
          else
            begin
              reg31 <= wire28;
              reg32 <= $signed($unsigned(($unsigned($unsigned(reg34)) ?
                  wire28 : ((+wire25) >>> wire30))));
            end
          reg36 <= $signed(($unsigned($signed(reg32)) ?
              (wire26 ^ reg31) : {$signed({wire23})}));
        end
      else
        begin
          if (reg36[(1'h0):(1'h0)])
            begin
              reg31 <= (reg32[(1'h0):(1'h0)] ~^ wire26[(4'ha):(1'h0)]);
              reg32 <= reg32[(1'h0):(1'h0)];
            end
          else
            begin
              reg31 <= ($unsigned($signed((|(reg35 ?
                  reg33 : wire26)))) + reg33);
              reg32 <= (^({$unsigned({wire24})} - reg32));
            end
          reg33 <= (~&(wire22 ?
              $unsigned(wire29) : {((+(8'ha4)) ?
                      (~reg33) : wire25[(4'hf):(4'hf)])}));
          reg34 <= (({(+(|reg31)), (^~wire24[(3'h4):(1'h1)])} ?
              (($unsigned(reg33) ? $unsigned(wire24) : wire30) ?
                  reg36[(5'h10):(4'hb)] : reg35) : (^((wire29 | wire25) ^~ {wire25}))) == ({((reg31 ?
                      wire23 : reg34) >> ((8'hb1) ^~ wire30))} ?
              wire28 : (&$signed(wire25))));
          reg35 <= wire29;
        end
      reg37 <= (~^($signed(wire25) ?
          ($signed((wire29 ? reg35 : reg31)) * $signed({reg32,
              reg36})) : reg31[(3'h7):(2'h3)]));
      reg38 <= $unsigned(reg35[(4'he):(4'h8)]);
      reg39 <= ($unsigned(({(^~wire22)} ?
              (~(!wire25)) : (wire27[(2'h2):(1'h0)] & $signed(wire29)))) ?
          ($signed({wire26[(3'h6):(1'h0)],
              (wire28 ? wire25 : reg31)}) >>> (8'hab)) : wire23[(4'h9):(2'h2)]);
      reg40 <= $signed((^~(7'h42)));
    end
  assign wire41 = $unsigned(($unsigned(((wire23 * wire23) - $signed(wire23))) ?
                      (reg40[(5'h13):(4'h8)] ?
                          wire29 : ($signed(reg31) ?
                              (wire24 - reg40) : wire29[(3'h6):(2'h3)])) : $unsigned(wire23[(4'hd):(4'h9)])));
  assign wire42 = {{$unsigned($unsigned(wire41)),
                          ((((8'h9c) ? reg33 : wire30) ?
                                  $signed((8'ha1)) : $unsigned(wire25)) ?
                              {$unsigned(reg36)} : $unsigned($signed(wire41)))}};
endmodule
