module top
#(parameter param109 = ((8'h9c) && (((!((8'ha5) && (8'hbb))) ? ((~^(8'hbb)) == (^(8'ha7))) : (((8'hb2) || (8'ha4)) ? (~^(8'ha5)) : {(8'had), (7'h43)})) + ({(+(8'hbf)), (-(8'hb3))} ? (((8'ha4) ~^ (7'h44)) ? ((8'hba) ? (8'hb8) : (8'ha4)) : ((8'hae) ^ (8'hb2))) : ((!(8'ha1)) ? {(8'h9d)} : ((8'hba) ? (8'h9c) : (8'ha0)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire53;
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire104,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire5,
                 wire53,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire5 = {(-(wire4[(4'hc):(4'hc)] ?
                         {wire3[(2'h3):(1'h1)], $unsigned((8'hac))} : wire3))};
  always
    @(posedge clk) begin
      reg6 <= {wire5, ($unsigned($unsigned({wire2, wire1})) & (^~{wire2}))};
      reg7 <= wire0[(1'h1):(1'h1)];
      if ({((^((wire5 - wire2) ? $signed(wire2) : (wire3 ? wire2 : reg6))) ?
              ({{wire3}} ?
                  ((reg6 ? wire4 : reg6) ?
                      $signed(wire0) : (reg7 + wire2)) : ($unsigned(wire2) ^ $unsigned(wire1))) : (((&wire3) >> wire2) ?
                  (^~(wire5 <<< (8'hab))) : {(~&wire0)})),
          $signed($signed((-$signed(wire0))))})
        begin
          reg8 <= $unsigned(wire2);
        end
      else
        begin
          reg8 <= reg6;
          reg9 <= ($unsigned(($signed((reg7 ^ (8'ha9))) >>> $unsigned(((7'h43) | reg8)))) && {{{(wire1 * reg7),
                      {wire4}}}});
          reg10 <= wire3;
        end
      reg11 <= (8'hb7);
    end
  module12 #() modinst54 (.wire17(wire2), .wire14(reg8), .y(wire53), .wire15(reg7), .clk(clk), .wire13(reg11), .wire16(reg6));
  always
    @(posedge clk) begin
      if ($signed(reg6[(5'h15):(2'h2)]))
        begin
          reg55 <= ((~&reg9) ~^ ($signed($signed(wire0[(1'h0):(1'h0)])) ?
              $unsigned(reg11[(4'hc):(1'h0)]) : reg11[(4'ha):(4'h9)]));
        end
      else
        begin
          if (wire2[(3'h7):(3'h6)])
            begin
              reg55 <= wire5;
            end
          else
            begin
              reg55 <= $signed((~^((+(^(8'hb6))) ?
                  $signed($unsigned(wire53)) : ({reg9} ?
                      $signed(reg6) : (reg10 ? (8'h9d) : wire1)))));
              reg56 <= $signed((wire3 >>> $unsigned($unsigned(wire3[(2'h2):(1'h1)]))));
              reg57 <= ($unsigned(wire3) == reg56);
              reg58 <= ((wire53 ^~ reg10) | $unsigned((($unsigned(wire2) ?
                      reg56[(2'h2):(2'h2)] : wire5[(5'h13):(4'ha)]) ?
                  $unsigned((!wire53)) : reg56[(1'h0):(1'h0)])));
              reg59 <= reg7;
            end
          reg60 <= ({wire53} ? reg57 : (7'h40));
          if (reg56[(1'h0):(1'h0)])
            begin
              reg61 <= (^reg58[(2'h2):(2'h2)]);
            end
          else
            begin
              reg61 <= $signed({{((+(8'hb6)) ~^ $unsigned(reg7)),
                      (~^(^wire0))}});
              reg62 <= wire5;
            end
          reg63 <= {$signed(((|reg59) ?
                  (reg11 ?
                      $signed(reg61) : (reg11 + wire2)) : $signed((~reg8)))),
              (+(({wire5, (8'hb5)} ^ (~|reg9)) ~^ (((8'ha7) ?
                  (8'hb8) : reg57) < (^~wire4))))};
          reg64 <= $signed(($unsigned(((~&reg61) ? reg7 : {wire2, (8'h9f)})) ?
              (!((~|wire53) ^ $signed((8'h9c)))) : (reg60[(2'h3):(2'h3)] ?
                  {(reg60 ^~ reg60)} : ({reg11,
                      (8'hae)} >> $unsigned(wire53)))));
        end
      reg65 <= (((reg7 ? (~|(~^reg9)) : wire1) & ((wire4[(5'h11):(4'h8)] ?
              (~&reg59) : (-reg56)) <<< {(reg9 < (8'hb2))})) ?
          reg62[(3'h6):(1'h1)] : $signed(reg60));
      reg66 <= ($unsigned({((reg56 ? reg65 : reg7) ~^ (reg62 ^ wire1)),
              (reg10 ? reg6[(4'hf):(1'h0)] : (wire3 ? wire0 : reg59))}) ?
          reg57[(3'h4):(2'h3)] : $signed($unsigned((reg10 >= reg64))));
    end
  assign wire67 = (~|(~($signed($signed(reg66)) ~^ $unsigned((reg57 + reg7)))));
  assign wire68 = reg7[(1'h0):(1'h0)];
  assign wire69 = (~{$unsigned((~|$unsigned(reg59))),
                      $unsigned($signed((reg62 ? (8'h9c) : reg56)))});
  assign wire70 = $unsigned(wire69[(5'h10):(4'hb)]);
  module71 #() modinst105 (wire104, clk, reg60, reg62, reg59, reg64, reg63);
  assign wire106 = $signed((~^$unsigned(wire3)));
  assign wire107 = (~&reg65[(1'h1):(1'h0)]);
  assign wire108 = wire0[(1'h0):(1'h0)];
endmodule

module module71
#(parameter param102 = (^~{({(-(8'hb8)), ((8'hba) ? (8'hba) : (8'hb2))} >> (~^{(7'h40), (8'hb7)})), (((^~(8'hae)) ? ((8'hb5) ? (8'h9d) : (8'hbe)) : ((8'hae) ? (8'hb5) : (8'hb4))) > ({(8'hb8)} ? {(7'h43)} : ((8'hba) ? (7'h40) : (8'ha9))))}), 
parameter param103 = (&(&({((7'h43) >>> param102), ((7'h41) ~^ param102)} ? {(param102 ? param102 : (8'h9e)), {param102, (8'hbf)}} : (8'ha2)))))
(y, clk, wire72, wire73, wire74, wire75, wire76);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire72;
  input wire signed [(5'h13):(1'h0)] wire73;
  input wire [(5'h12):(1'h0)] wire74;
  input wire [(4'h8):(1'h0)] wire75;
  input wire signed [(5'h13):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire91;
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 (1'h0)};
  module77 #() modinst92 (.wire80(wire75), .wire81(wire76), .wire78(wire74), .clk(clk), .wire82(wire73), .y(wire91), .wire79(wire72));
  assign wire93 = (($unsigned((wire72 ?
                      wire73[(2'h3):(1'h0)] : $signed(wire75))) + (!((+wire91) ~^ (wire91 >>> wire72)))) * $unsigned($unsigned((wire76[(1'h0):(1'h0)] | ((8'hba) < wire76)))));
  assign wire94 = $unsigned((({{(8'ha2), wire73}, (wire72 ^~ (8'haa))} ?
                      wire76[(4'h9):(3'h5)] : $unsigned(wire75[(2'h2):(1'h1)])) && (~^$unsigned((wire91 << wire91)))));
  assign wire95 = wire93;
  assign wire96 = (~^wire94[(3'h5):(1'h1)]);
  assign wire97 = $unsigned(((($unsigned(wire74) > wire91) ^~ (+$unsigned(wire91))) ?
                      $signed($signed(wire74)) : $signed((~&wire94[(3'h6):(3'h6)]))));
  assign wire98 = ((~wire72) || wire73[(3'h4):(2'h3)]);
  assign wire99 = $signed(wire72[(4'he):(4'hb)]);
  assign wire100 = {(wire97[(2'h2):(1'h0)] ?
                           $signed({(wire75 ? wire94 : wire75),
                               (wire93 ?
                                   wire98 : wire75)}) : (-$signed(wire75[(3'h7):(3'h5)])))};
  assign wire101 = ((^$signed({$unsigned(wire98),
                       (-wire74)})) != wire94[(4'h9):(2'h3)]);
endmodule

module module12
#(parameter param51 = {{(((-(8'hb0)) == {(7'h42), (8'hb8)}) ? {((8'hbf) ? (8'hb1) : (8'haa))} : {((8'ha8) ? (8'h9d) : (8'hb8))})}}, 
parameter param52 = ({{(^~(param51 <<< param51))}, {param51}} + ((((param51 ? (8'h9f) : param51) <= {param51, param51}) ? (8'hbe) : {(-param51), (~|param51)}) == (~^param51))))
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire45;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire45,
                 (1'h0)};
  assign wire18 = wire16[(4'h9):(4'h9)];
  assign wire19 = (!{(((!wire17) != (wire15 ~^ wire14)) ?
                          ((wire17 ?
                              wire18 : wire14) < wire14[(3'h7):(3'h6)]) : (wire17[(4'hc):(3'h5)] ?
                              ((8'hb4) ?
                                  wire13 : wire17) : $unsigned(wire18)))});
  assign wire20 = (wire18[(2'h3):(1'h0)] <= $unsigned(wire18));
  assign wire21 = wire17[(4'h9):(3'h4)];
  assign wire22 = $unsigned(((~|$unsigned((~wire13))) >> (~&(^~((8'h9d) ^~ wire17)))));
  module23 #() modinst46 (wire45, clk, wire18, wire19, wire22, wire13, wire17);
  assign wire47 = wire19;
  assign wire48 = (($unsigned(($unsigned(wire21) ^~ wire19[(3'h5):(3'h5)])) > (~($unsigned(wire22) ?
                      (wire19 | wire21) : (wire13 ?
                          wire21 : (8'ha5))))) >= wire18);
  assign wire49 = wire19;
  assign wire50 = $unsigned(wire22[(4'hc):(4'h9)]);
endmodule

module module23
#(parameter param44 = {(~&(~&{(^(8'hb1)), (~(8'hbc))}))})
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire28;
  input wire [(3'h6):(1'h0)] wire27;
  input wire [(4'he):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  assign y = {wire43,
                 wire39,
                 wire38,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg42,
                 reg41,
                 reg40,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire29 = ((7'h43) ?
                      wire24 : (wire28[(3'h6):(1'h0)] << (-wire27[(2'h3):(1'h1)])));
  assign wire30 = (($unsigned(((wire29 ^ wire27) || (~(7'h44)))) ?
                      ($signed($signed(wire26)) == wire27) : (!(!$unsigned((8'ha7))))) ^ $unsigned($signed($unsigned((~&wire26)))));
  assign wire31 = $signed((8'hbf));
  assign wire32 = (~^$signed(((8'hb3) | (^~wire27[(1'h1):(1'h0)]))));
  assign wire33 = {(wire31 ~^ {$signed({(8'hab)}), (~|wire28[(1'h1):(1'h1)])})};
  always
    @(posedge clk) begin
      reg34 <= wire26[(4'he):(3'h4)];
      reg35 <= ({(~(wire33[(2'h3):(1'h1)] | ((8'hbd) < wire33))),
              (($unsigned(wire31) <<< (wire28 & wire25)) ?
                  $signed((^wire26)) : $signed($signed(wire29)))} ?
          ($signed(wire28[(3'h4):(1'h0)]) ?
              (wire31 - $unsigned($unsigned(wire30))) : {$signed(wire27[(2'h2):(1'h1)])}) : reg34);
      if ((($signed(reg34[(2'h2):(2'h2)]) ?
              {(!(8'haf))} : $unsigned((|reg34))) ?
          $signed((($signed(wire24) >> (8'ha2)) << ((8'ha1) << $unsigned(reg35)))) : wire25))
        begin
          reg36 <= wire29[(4'he):(2'h2)];
          reg37 <= $signed(wire28[(1'h0):(1'h0)]);
        end
      else
        begin
          reg36 <= reg36[(3'h4):(3'h4)];
        end
    end
  assign wire38 = $signed((({(wire28 ~^ wire29)} ^~ wire27[(2'h2):(1'h1)]) ?
                      $unsigned((^((8'ha6) ? (8'hb9) : reg37))) : reg36));
  assign wire39 = $unsigned($signed(reg36[(4'hc):(4'h9)]));
  always
    @(posedge clk) begin
      reg40 <= wire27;
      reg41 <= wire29[(2'h2):(1'h0)];
      reg42 <= $signed($unsigned((wire24[(4'h8):(1'h0)] ?
          (reg41 >>> (|reg35)) : wire38[(3'h4):(3'h4)])));
    end
  assign wire43 = wire28[(3'h5):(2'h2)];
endmodule

module module77
#(parameter param90 = {(((~&{(8'hb7), (7'h41)}) ? {(~|(7'h44))} : ({(8'ha5), (8'ha7)} | ((8'hae) < (8'ha4)))) > ({((8'haf) ^ (8'hbf)), {(8'hb0)}} ? (~((7'h44) * (8'hb4))) : {((8'hab) ? (7'h44) : (8'hb1)), (^(8'ha2))})), (8'hb0)})
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire [(5'h13):(1'h0)] wire81;
  input wire signed [(4'h8):(1'h0)] wire80;
  input wire signed [(5'h11):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg83 = (1'h0);
  assign y = {wire89, wire87, wire86, wire85, reg88, reg84, reg83, (1'h0)};
  always
    @(posedge clk) begin
      reg83 <= $signed((($unsigned((wire81 && wire79)) ?
              $signed(((8'hb9) ~^ wire78)) : $unsigned($unsigned(wire78))) ?
          wire81 : {wire82[(3'h5):(1'h0)]}));
      reg84 <= $signed((-wire78));
    end
  assign wire85 = {$unsigned($signed({(wire79 + wire80), (wire82 ^ reg84)}))};
  assign wire86 = $unsigned(wire78);
  assign wire87 = reg84;
  always
    @(posedge clk) begin
      reg88 <= $unsigned((wire87[(3'h7):(3'h4)] ?
          {$signed($signed(wire82))} : wire81[(4'hd):(2'h2)]));
    end
  assign wire89 = (((($unsigned(wire85) >>> (wire86 <= wire86)) ?
                              $unsigned($unsigned(wire87)) : $signed((|reg83))) ?
                          wire87 : (8'ha5)) ?
                      (^~{reg88,
                          (^~{wire78, wire85})}) : (reg88[(2'h2):(2'h2)] ?
                          (reg83[(5'h10):(4'hf)] >> ((wire81 >> wire86) ?
                              (wire85 ?
                                  (7'h40) : wire79) : $signed(wire87))) : (|$unsigned((wire79 && wire78)))));
endmodule
