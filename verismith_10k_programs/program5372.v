module top
#(parameter param120 = {(~^((((7'h41) * (8'h9e)) > (~(8'ha5))) * ({(8'h9d)} && (~^(8'ha7))))), (^~(|((~&(8'hb4)) < ((7'h42) | (8'ha1)))))}, 
parameter param121 = (~&{param120}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire53;
  assign y = {wire119, wire118, wire117, wire115, wire55, wire53, (1'h0)};
  module4 #() modinst54 (wire53, clk, wire2, wire1, wire3, wire0);
  assign wire55 = (~&(wire0[(4'h8):(3'h6)] ?
                      ($signed(wire53[(3'h4):(3'h4)]) > $unsigned(wire53[(3'h6):(2'h3)])) : $signed(($signed(wire0) <= $unsigned((8'hbf))))));
  module56 #() modinst116 (.clk(clk), .wire57(wire1), .wire59(wire0), .wire58(wire2), .y(wire115), .wire60(wire53));
  assign wire117 = (8'hb2);
  assign wire118 = ((8'ha6) ~^ wire55);
  assign wire119 = {($unsigned($unsigned($signed((8'hb8)))) ?
                           $unsigned($unsigned((wire117 ?
                               wire2 : wire115))) : $signed({(wire0 ~^ wire1)}))};
endmodule

module module56
#(parameter param114 = (((((~(8'ha3)) <= (8'hb6)) ? (((8'ha6) ? (8'had) : (8'haf)) ? (&(8'hbb)) : {(8'hba)}) : (8'h9d)) != (8'ha8)) == ((~^((!(8'ha1)) == ((8'ha4) ^ (8'ha2)))) ? ((((8'hb0) | (8'hb9)) * (&(8'ha7))) ? ((&(8'hbf)) ~^ (-(8'ha1))) : ((+(8'haa)) ? (~|(8'ha8)) : ((8'h9e) ? (7'h42) : (8'ha5)))) : (7'h42))))
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire60;
  input wire [(4'ha):(1'h0)] wire59;
  input wire [(4'hd):(1'h0)] wire58;
  input wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire98;
  wire [(4'hc):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire61;
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire61,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire61 = wire60[(3'h4):(1'h1)];
  module62 #() modinst95 (wire94, clk, wire58, wire61, wire57, wire60);
  assign wire96 = wire58[(4'hd):(1'h0)];
  assign wire97 = $unsigned(wire59[(2'h2):(1'h0)]);
  assign wire98 = ((|$signed($unsigned(wire97[(4'hc):(3'h4)]))) ?
                      $signed($signed(((~&wire96) < (!wire60)))) : wire96);
  always
    @(posedge clk) begin
      reg99 <= wire59;
      reg100 <= (wire59[(3'h5):(3'h4)] <= $signed((wire58 ?
          {(wire98 ? (7'h44) : wire58),
              (wire60 ? wire98 : reg99)} : $unsigned($signed(wire94)))));
    end
  always
    @(posedge clk) begin
      reg101 <= wire98;
      reg102 <= $unsigned((wire60 > ($unsigned(((8'hb5) < reg101)) ?
          wire94[(2'h3):(1'h1)] : ($signed(reg99) ?
              $signed(wire60) : (~&(7'h41))))));
      reg103 <= $unsigned(wire94[(3'h6):(3'h6)]);
      if ($signed($signed((|$signed({(8'hb0), wire97})))))
        begin
          reg104 <= ({$signed({(wire96 ? wire61 : wire57)}),
              $signed(($signed((7'h43)) ?
                  (-reg99) : $unsigned(reg101)))} >>> (($signed(reg99[(1'h0):(1'h0)]) + $signed($signed(wire59))) ?
              (-$signed($unsigned(wire57))) : reg99));
        end
      else
        begin
          reg104 <= wire96[(2'h2):(1'h1)];
          if ($signed(reg103))
            begin
              reg105 <= $unsigned(((|((^~reg100) ?
                  $signed(wire96) : reg102)) ^~ wire58));
              reg106 <= (~(({(reg102 ? wire61 : reg104),
                  $unsigned(reg103)} ~^ {$unsigned(reg104),
                  wire97}) ~^ (7'h40)));
            end
          else
            begin
              reg105 <= $unsigned($unsigned($unsigned(((reg104 ?
                  reg99 : wire61) != (reg101 + wire58)))));
              reg106 <= $signed((8'hb1));
              reg107 <= (^(8'hbb));
              reg108 <= (reg101 >> reg100);
            end
          reg109 <= $signed($signed({(8'h9d), (8'hb8)}));
        end
      reg110 <= (+(8'hba));
    end
  assign wire111 = (&($unsigned(wire94) ?
                       {($unsigned(wire59) || wire60[(4'h9):(3'h5)])} : reg104[(3'h4):(2'h3)]));
  assign wire112 = $unsigned($signed((~|(8'hac))));
  assign wire113 = (^~wire57);
endmodule

module module4
#(parameter param52 = ((&(8'ha8)) || (~|(7'h43))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire31,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
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
                 (1'h0)};
  assign wire9 = $unsigned(wire8[(5'h10):(3'h5)]);
  assign wire10 = ($unsigned((^~(~^$unsigned(wire8)))) ?
                      ($signed($unsigned({(8'hb9), wire7})) ?
                          (wire5 > wire8[(5'h14):(1'h1)]) : ({(!wire8)} <<< wire9)) : wire8);
  assign wire11 = (+{(({wire5, wire9} == $signed(wire9)) ?
                          (^~(^~wire5)) : {wire9, wire7[(3'h7):(2'h3)]})});
  assign wire12 = wire11[(4'ha):(3'h7)];
  module13 #() modinst32 (wire31, clk, wire6, wire7, wire5, wire10);
  always
    @(posedge clk) begin
      reg33 <= ($unsigned({((~^wire9) ? wire31[(1'h1):(1'h1)] : (+wire5)),
          ($unsigned(wire10) ?
              wire8 : (wire12 >= wire8))}) <= ($unsigned(wire7[(3'h5):(1'h1)]) ?
          wire7 : (!(^(wire12 << wire6)))));
      reg34 <= ({(($unsigned(wire8) ?
              wire31[(3'h5):(2'h3)] : (&wire31)) <<< {{wire7, wire12}}),
          ({wire31[(1'h0):(1'h0)]} ?
              $unsigned((~^(8'ha5))) : ((wire9 ? wire10 : wire12) ?
                  (wire9 < wire7) : {wire8,
                      (8'hbf)}))} > ($signed(($unsigned(wire9) && ((8'hbd) ?
          wire8 : wire31))) >= $signed($unsigned(wire31[(3'h5):(3'h5)]))));
      reg35 <= $unsigned((&wire6));
      if ((8'hae))
        begin
          reg36 <= (((~(8'h9d)) ?
                  (((~|wire9) ^~ (wire8 < wire9)) >= (+((8'ha3) ?
                      reg33 : wire5))) : reg34[(1'h1):(1'h0)]) ?
              {wire11[(1'h1):(1'h0)]} : (wire8 ?
                  ({(wire5 ? reg35 : wire12),
                      $signed(reg35)} & (~^{reg34})) : reg35));
          if ({$unsigned(((|wire9[(3'h4):(2'h3)]) >= $signed(((8'hb2) * (8'hb5))))),
              ((reg34 ?
                  $unsigned(reg33) : ({(8'hac),
                      wire6} + wire31)) || $signed(wire12[(4'ha):(4'h8)]))})
            begin
              reg37 <= (reg36 & {wire12[(4'hb):(3'h6)]});
              reg38 <= {{((((8'ha6) ? reg33 : (8'ha6)) || {(8'hb9),
                          wire8}) < reg36[(3'h6):(1'h1)])},
                  wire5[(4'he):(1'h0)]};
            end
          else
            begin
              reg37 <= wire5[(3'h4):(1'h0)];
              reg38 <= reg33;
            end
          if ((($unsigned(wire31) ?
              ($signed((^wire9)) ?
                  (reg33[(4'hd):(1'h1)] ?
                      (reg37 ^~ reg36) : (wire7 ?
                          wire7 : reg34)) : (|(wire31 << wire31))) : {(|(^~wire7))}) ^~ ((+wire11) ?
              $signed(($signed(wire9) ? (^wire12) : reg37)) : wire5)))
            begin
              reg39 <= (~|$signed(wire7));
            end
          else
            begin
              reg39 <= $unsigned(wire5);
              reg40 <= $unsigned((reg35[(4'hb):(3'h4)] ?
                  $unsigned((~&wire10[(4'h9):(3'h7)])) : (~(reg38[(3'h7):(1'h0)] == reg36[(4'h8):(3'h5)]))));
              reg41 <= ($unsigned({{((8'ha5) < wire8)}}) ?
                  $unsigned($signed(reg34[(4'hf):(3'h6)])) : {(^~(+$unsigned(wire7))),
                      ((-$signed(reg37)) > reg35[(4'hc):(2'h2)])});
              reg42 <= $unsigned(reg33[(4'he):(3'h6)]);
            end
        end
      else
        begin
          reg36 <= $unsigned($signed(wire7[(1'h1):(1'h0)]));
          if ({$signed((({reg40, reg38} ?
                  $unsigned((8'h9d)) : (|reg34)) & reg37[(2'h3):(2'h2)])),
              (reg36 | ({(wire7 <= wire7)} ?
                  (reg37 ? ((8'hac) * reg35) : (reg42 <<< wire12)) : reg33))})
            begin
              reg37 <= (8'hb2);
              reg38 <= wire12;
              reg39 <= wire6;
              reg40 <= wire8[(5'h12):(5'h12)];
            end
          else
            begin
              reg37 <= reg39[(5'h13):(4'hc)];
              reg38 <= ((~|wire6) ?
                  $signed($unsigned((wire7 ?
                      $unsigned((8'ha5)) : reg34[(5'h11):(1'h0)]))) : (wire5 < wire7));
              reg39 <= wire10;
            end
          if (reg38)
            begin
              reg41 <= reg37[(4'h9):(3'h4)];
              reg42 <= ($unsigned($signed($signed(reg37[(4'h9):(1'h0)]))) ?
                  ($unsigned(reg33[(5'h12):(4'he)]) == $signed($signed($unsigned((8'ha7))))) : ($unsigned(wire12) ?
                      $unsigned($unsigned(reg40[(3'h7):(1'h1)])) : (^~(reg41[(4'h8):(2'h3)] ?
                          $signed(wire9) : {wire5, (8'haa)}))));
              reg43 <= (reg33 | reg41[(4'h9):(4'h8)]);
              reg44 <= ($signed((|($signed((8'haa)) <<< reg34))) ?
                  $unsigned(({$unsigned(wire8)} <<< ({reg40} ?
                      $unsigned(wire7) : (reg38 || wire8)))) : (reg35 || ({{wire6}} <<< $unsigned(wire7))));
              reg45 <= $unsigned((((&(wire11 ?
                  reg39 : wire31)) > $signed(reg36[(3'h4):(2'h2)])) <= $signed(reg42[(3'h5):(1'h1)])));
            end
          else
            begin
              reg41 <= {((($signed(reg35) ?
                          reg38[(4'hb):(2'h2)] : (+reg43)) ~^ (~^reg35)) ?
                      ((+(reg37 <= reg43)) ?
                          reg41[(1'h0):(1'h0)] : $unsigned((&reg35))) : wire9)};
              reg42 <= (reg41 | wire7);
            end
        end
    end
  assign wire46 = {reg45[(4'h9):(3'h6)]};
  assign wire47 = $unsigned(((8'ha0) ?
                      (reg45[(4'h8):(3'h6)] || $signed($signed((7'h42)))) : {$unsigned((reg42 ^~ (8'hab))),
                          (!$signed(wire5))}));
  assign wire48 = (^~reg42);
  assign wire49 = $signed($unsigned($unsigned(wire10[(1'h0):(1'h0)])));
  assign wire50 = (!reg42[(3'h4):(3'h4)]);
  assign wire51 = $signed(reg34[(3'h5):(2'h2)]);
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire18;
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire18,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = $unsigned({wire17, (8'hae)});
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire18[(4'h8):(1'h0)]);
      reg20 <= ((!wire14) ?
          $unsigned(($signed((wire16 | reg19)) >= {wire18})) : $signed(($unsigned($signed(reg19)) ^~ {(wire16 ?
                  wire18 : wire16),
              (~&(8'h9f))})));
      reg21 <= ((|$unsigned({{(8'hb3), wire18},
          (reg19 ? (7'h42) : wire17)})) <<< {($unsigned(((8'hbc) ?
              wire16 : wire18)) >> reg20[(1'h1):(1'h1)]),
          {$unsigned((wire15 >= (8'ha9))), wire17}});
      reg22 <= (~$signed(reg20[(2'h3):(2'h3)]));
    end
  assign wire23 = $unsigned({$signed(($signed(reg21) && wire18[(1'h1):(1'h0)])),
                      (^~($unsigned((8'ha9)) ?
                          wire18[(4'hb):(3'h7)] : (reg21 ?
                              wire14 : (7'h42))))});
  assign wire24 = ($unsigned(reg21[(1'h1):(1'h1)]) ?
                      (wire23[(1'h1):(1'h1)] ?
                          wire17 : (~^$signed((~|wire23)))) : wire15);
  assign wire25 = (reg21[(3'h6):(2'h2)] - (~wire24[(5'h10):(4'hc)]));
  assign wire26 = $signed({{$signed({wire25, (8'hae)}),
                          ($unsigned((8'h9d)) >= (|(8'hba)))},
                      reg20[(3'h6):(2'h3)]});
  assign wire27 = wire15[(4'ha):(4'ha)];
  assign wire28 = (8'ha5);
  assign wire29 = wire16;
  assign wire30 = $unsigned($signed($unsigned(reg19[(4'hc):(4'h9)])));
endmodule

module module62
#(parameter param92 = (~|(~^((-(^(8'hbc))) ^~ (~((8'hbe) == (7'h44)))))), 
parameter param93 = (~^(((!(param92 <<< param92)) ? {{param92, (8'ha4)}, (param92 ? param92 : param92)} : ((param92 <= param92) ^ ((8'hb3) ? param92 : param92))) ? ({(+param92), (~&param92)} ~^ ((8'ha0) ? (param92 ? (8'hb5) : param92) : param92)) : (((-param92) * param92) ? (|(param92 ? param92 : param92)) : ((8'hb3) ? (param92 + param92) : (param92 ? param92 : param92))))))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire66;
  input wire signed [(3'h6):(1'h0)] wire65;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  assign y = {wire91,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire68,
                 wire67,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire67 = (wire66[(3'h6):(2'h2)] ?
                      {($signed($unsigned((8'hb6))) ?
                              wire65 : wire64)} : wire63);
  assign wire68 = wire66[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg69 <= wire68;
      reg70 <= $unsigned($unsigned(($signed($signed(wire66)) * wire66)));
      reg71 <= (^~wire65[(3'h4):(3'h4)]);
    end
  assign wire72 = (8'ha4);
  assign wire73 = $unsigned(reg71[(4'hb):(2'h2)]);
  assign wire74 = wire72;
  assign wire75 = (($unsigned($unsigned($signed(wire66))) > (((wire66 != reg71) ~^ $unsigned(wire68)) ~^ reg71[(5'h10):(3'h7)])) ?
                      (reg71[(2'h2):(2'h2)] ?
                          (((wire73 ? reg70 : reg70) ?
                              (reg69 >>> wire65) : (wire63 ?
                                  wire65 : wire74)) & {((8'ha2) ?
                                  (8'ha7) : reg70)}) : $signed(wire74)) : $unsigned(wire73));
  assign wire76 = ((wire66 ?
                      (~|(~wire65)) : ($unsigned((wire72 * reg71)) ?
                          (8'haf) : ((wire63 ? (7'h40) : wire68) ?
                              {wire75,
                                  (7'h42)} : $unsigned(wire64)))) || $unsigned($unsigned(wire66)));
  assign wire77 = wire74;
  assign wire78 = $unsigned($signed((&((wire76 ?
                      wire75 : wire72) ^~ (~|wire74)))));
  assign wire79 = $unsigned($unsigned({$signed((wire67 ? wire72 : (7'h43)))}));
  assign wire80 = wire73;
  assign wire81 = wire63[(4'h8):(3'h6)];
  assign wire82 = reg69[(4'hf):(4'hb)];
  assign wire83 = (reg70[(3'h5):(3'h4)] ?
                      wire82[(2'h3):(1'h1)] : (wire75[(3'h4):(3'h4)] >>> (reg70[(3'h5):(1'h1)] ?
                          {$signed(wire68), $unsigned(wire67)} : reg70)));
  always
    @(posedge clk) begin
      reg84 <= (+($unsigned(wire63[(4'ha):(3'h5)]) ~^ reg71[(3'h6):(3'h6)]));
      if ((wire67 ?
          (^~(|(wire75[(3'h5):(1'h1)] ?
              {wire72} : (~^wire81)))) : $unsigned((8'ha0))))
        begin
          reg85 <= $signed(wire83);
        end
      else
        begin
          reg85 <= ((+reg85[(3'h5):(3'h4)]) <= ((~&((wire82 ?
                  reg84 : wire72) >> (reg84 ? wire66 : reg84))) ?
              $unsigned(({wire79} <<< wire64)) : (~|reg70[(2'h2):(1'h0)])));
          reg86 <= ((~^((wire66[(3'h5):(1'h0)] ?
                  (wire63 ~^ wire72) : reg71[(4'hf):(3'h6)]) <= ((8'hbd) ?
                  $signed(wire64) : $signed(wire75)))) ?
              (wire75 ?
                  ($signed({(8'h9d),
                      wire72}) <= wire77) : (+reg69[(3'h4):(2'h3)])) : ($unsigned(wire72[(4'hd):(4'hc)]) <<< $signed(((wire80 ?
                  (8'hba) : (8'ha6)) != $unsigned(reg70)))));
          reg87 <= (8'had);
        end
      if (wire77[(2'h2):(1'h0)])
        begin
          reg88 <= (((!((reg70 < wire81) + $signed(reg84))) || wire81) ?
              $signed(wire77[(3'h4):(2'h2)]) : ((^~((-wire68) ^~ wire66[(4'h8):(1'h0)])) << (((reg86 ?
                      wire80 : wire78) ?
                  (reg69 ? (8'h9e) : (8'hbf)) : $signed(wire67)) ^~ ((8'hbf) ?
                  (wire82 ? wire63 : wire76) : $unsigned(wire73)))));
          reg89 <= (8'ha8);
        end
      else
        begin
          reg88 <= $unsigned($signed((wire77[(2'h3):(1'h0)] || wire64)));
        end
      reg90 <= reg84;
    end
  assign wire91 = ($signed((wire64 & wire68)) ?
                      {(($signed(wire74) ^~ (~wire72)) ?
                              (reg89[(3'h4):(1'h1)] | reg71) : $unsigned({wire80}))} : (-(-$signed((wire82 ?
                          wire64 : wire77)))));
endmodule
