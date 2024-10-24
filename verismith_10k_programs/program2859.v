module top
#(parameter param135 = (8'ha4), 
parameter param136 = (^~(+param135)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire127;
  wire [(3'h7):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire16;
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  assign y = {wire134,
                 wire132,
                 wire131,
                 wire130,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire122,
                 wire73,
                 wire72,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire18,
                 wire4,
                 wire16,
                 reg133,
                 reg129,
                 reg128,
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
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire4 = ((-(wire0 ? wire0[(4'h8):(3'h5)] : (!$unsigned(wire2)))) ?
                     (wire0[(4'hd):(3'h7)] == $unsigned(wire2)) : ($unsigned(($unsigned(wire3) ~^ $unsigned(wire3))) << $unsigned($unsigned(((8'haa) ~^ wire3)))));
  module5 #() modinst17 (wire16, clk, wire1, wire0, wire4, wire2, wire3);
  assign wire18 = ((-(wire4[(3'h5):(3'h4)] != $signed($signed(wire2)))) ~^ {wire3[(4'he):(4'ha)],
                      $signed((8'hae))});
  module19 #() modinst55 (.y(wire54), .wire20(wire16), .wire21(wire1), .wire23(wire18), .wire22(wire2), .clk(clk));
  assign wire56 = (^~($signed($signed(((8'ha4) ? wire0 : wire0))) ?
                      $unsigned((wire16 <<< wire2)) : wire3));
  assign wire57 = wire4;
  assign wire58 = $unsigned(((|{{wire57}, $signed(wire18)}) ?
                      $signed({{wire16, wire3},
                          $unsigned((7'h44))}) : (^~(wire3 ?
                          {wire0} : {(8'hbf)}))));
  assign wire59 = {$signed(wire56[(5'h11):(5'h11)]),
                      ({{(wire56 > wire0), wire16},
                          wire0[(4'he):(2'h2)]} ^ ((~^$unsigned(wire16)) ?
                          wire1[(4'h8):(3'h4)] : (~^$unsigned(wire57))))};
  always
    @(posedge clk) begin
      reg60 <= (!$signed((7'h44)));
      if (wire58[(4'hc):(3'h6)])
        begin
          reg61 <= (((~wire59[(2'h2):(2'h2)]) ^ $unsigned(((reg60 < (8'ha0)) < $unsigned(wire18)))) ?
              {($signed(wire0) ?
                      $unsigned({(7'h43),
                          (8'ha2)}) : wire16[(4'he):(3'h7)])} : (-wire18));
          if (wire57[(4'hd):(4'hc)])
            begin
              reg62 <= (^~(($unsigned($unsigned((8'hba))) ?
                      $unsigned(wire1) : ($signed(wire18) ?
                          (wire18 ? wire16 : wire56) : wire1)) ?
                  wire16[(4'hb):(4'h9)] : (~|$unsigned($signed(wire58)))));
              reg63 <= wire57[(3'h6):(2'h2)];
              reg64 <= {$unsigned((($signed(wire4) ?
                          wire3[(2'h3):(2'h3)] : (|wire56)) ?
                      (^~(wire56 >= wire56)) : ((~wire0) * $signed((8'ha0))))),
                  $signed($signed(wire57[(3'h7):(3'h7)]))};
              reg65 <= (({wire54} ?
                  (~reg61[(3'h7):(1'h0)]) : {{(~|(8'h9f)),
                          (^~(8'hb6))}}) && $signed(wire59[(2'h3):(1'h1)]));
            end
          else
            begin
              reg62 <= wire0[(3'h7):(3'h5)];
            end
          reg66 <= (wire2 ?
              {(wire3 ?
                      wire16[(5'h10):(4'h8)] : $signed((wire1 ?
                          wire57 : (8'ha1)))),
                  wire56} : reg65);
        end
      else
        begin
          reg61 <= reg60[(4'hd):(1'h1)];
          if ({(8'h9f)})
            begin
              reg62 <= ({$unsigned(((~wire0) | (~(8'h9e))))} ?
                  $unsigned({reg66}) : ($unsigned($signed((|(8'ha2)))) - (~reg61)));
              reg63 <= {wire58[(4'he):(4'h9)]};
              reg64 <= {((~|{$unsigned(wire18)}) ?
                      (^~((reg64 < wire58) <= ((8'h9f) ?
                          reg64 : reg63))) : $unsigned(((&wire1) ?
                          $unsigned(wire54) : wire16)))};
            end
          else
            begin
              reg62 <= wire2;
              reg63 <= $unsigned(reg61);
              reg64 <= ({$signed({(wire3 ? wire4 : wire1)}),
                      wire18[(5'h10):(3'h7)]} ?
                  wire18 : reg63[(3'h4):(2'h2)]);
              reg65 <= wire56;
            end
          reg66 <= (~&$unsigned(wire58[(5'h10):(2'h3)]));
          reg67 <= ($signed((~((-reg66) << reg65))) ~^ wire57[(3'h6):(3'h5)]);
          if (wire3[(5'h10):(4'hc)])
            begin
              reg68 <= reg64;
              reg69 <= $signed((~&$unsigned(reg60[(1'h0):(1'h0)])));
            end
          else
            begin
              reg68 <= $unsigned(reg66[(3'h5):(3'h4)]);
            end
        end
      reg70 <= ($signed(reg63) && (wire59 ?
          $signed(wire54[(3'h6):(2'h3)]) : $signed(({wire4} ?
              reg61 : $unsigned((8'hb8))))));
      reg71 <= {reg60[(3'h5):(3'h5)], wire54};
    end
  assign wire72 = $signed($unsigned(($unsigned((+wire0)) ?
                      ($unsigned(reg60) + (&wire4)) : $unsigned((^~reg65)))));
  assign wire73 = wire1;
  module74 #() modinst123 (.wire77(wire56), .wire75(wire4), .y(wire122), .wire76(wire57), .clk(clk), .wire78(wire18));
  assign wire124 = wire18;
  assign wire125 = wire73;
  assign wire126 = $unsigned(((+$signed($signed(wire124))) ?
                       {((wire57 * reg62) > reg66),
                           reg71} : (~|($unsigned(reg64) && (~^wire57)))));
  assign wire127 = (&reg62[(4'he):(3'h4)]);
  always
    @(posedge clk) begin
      reg128 <= {$signed(wire2)};
      reg129 <= (reg68[(2'h3):(2'h3)] & wire1[(5'h10):(4'hb)]);
    end
  assign wire130 = reg60[(1'h1):(1'h0)];
  assign wire131 = (-$unsigned($unsigned({$unsigned(reg129)})));
  assign wire132 = (reg60[(2'h3):(1'h1)] ?
                       {$unsigned($signed(reg65[(3'h4):(2'h3)]))} : wire125);
  always
    @(posedge clk) begin
      reg133 <= $unsigned({$unsigned((&wire54))});
    end
  assign wire134 = ((-{wire58[(4'h9):(4'h9)],
                       ((wire2 ?
                           (8'hb4) : wire124) ~^ $signed(wire57))}) & reg67[(3'h4):(1'h1)]);
endmodule

module module74
#(parameter param120 = (((~&{(8'hae), (~(8'h9d))}) <= ((((8'ha0) ? (8'h9f) : (8'hb8)) ? {(8'ha0), (8'hb4)} : (8'hb0)) ? (-((8'hb1) ? (8'hb4) : (8'h9f))) : (^(7'h43)))) >>> {(^~({(8'hbc)} < {(8'hb8), (8'hb5)})), (^(-((8'hb3) ? (8'ha9) : (8'h9d))))}), 
parameter param121 = (&(param120 ? ({{param120, param120}, (~|param120)} ? ((param120 > param120) <<< ((8'hba) >>> param120)) : ((param120 ? (8'h9d) : param120) && param120)) : (|(+(~|param120))))))
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire78;
  input wire signed [(5'h12):(1'h0)] wire77;
  input wire [(5'h14):(1'h0)] wire76;
  input wire signed [(4'hd):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire119;
  wire signed [(5'h11):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire117;
  wire [(3'h5):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire101,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire79 = wire77[(3'h4):(2'h2)];
  assign wire80 = ((^(~$unsigned($unsigned(wire77)))) + (~^wire77[(5'h10):(4'h8)]));
  assign wire81 = $unsigned(({wire76,
                      $unsigned($unsigned(wire76))} >> wire80[(1'h1):(1'h1)]));
  assign wire82 = $unsigned($signed(((wire79[(3'h7):(2'h2)] > (8'hb9)) ?
                      $signed(wire76) : $unsigned(((8'ha9) ?
                          wire75 : wire76)))));
  assign wire83 = (-$unsigned(wire76));
  assign wire84 = $unsigned((~|wire81));
  assign wire85 = $signed((8'hbf));
  module86 #() modinst102 (.y(wire101), .wire89(wire75), .wire87(wire83), .wire90(wire79), .clk(clk), .wire88(wire81));
  always
    @(posedge clk) begin
      reg103 <= ((^wire75) * ({((8'haa) ?
                  wire81[(1'h1):(1'h0)] : (wire75 < wire79))} ?
          (wire78[(2'h2):(1'h1)] == $unsigned((wire83 ?
              wire101 : wire101))) : wire79));
      reg104 <= (|wire76[(5'h12):(3'h6)]);
      if ((^((reg103[(3'h5):(1'h1)] ? (+{wire101}) : wire83[(1'h1):(1'h0)]) ?
          $unsigned($unsigned({(8'haf), wire79})) : $unsigned(reg104))))
        begin
          reg105 <= (8'hb2);
          reg106 <= ($signed(((&$signed(wire80)) ?
              wire75 : ((|wire79) ?
                  (wire78 ?
                      wire77 : wire75) : $signed(reg104)))) || (($unsigned(wire78) ^ wire77) ?
              wire85 : ((~|(~|reg105)) ^ wire77)));
          reg107 <= ((-wire81) + (wire79[(4'ha):(4'h8)] ?
              $unsigned({(wire84 ? (8'hbb) : (8'ha6)),
                  wire81[(3'h7):(3'h7)]}) : $signed($unsigned((^~wire76)))));
          reg108 <= {reg106[(4'hd):(3'h5)]};
          reg109 <= reg105[(1'h1):(1'h0)];
        end
      else
        begin
          reg105 <= ({wire79[(2'h3):(1'h0)],
              {{(~|wire78)}, $unsigned((~reg109))}} > ((($signed(wire83) ?
                  $signed((8'hb7)) : (-wire79)) || $signed(wire101[(3'h6):(3'h5)])) ?
              (wire84[(5'h10):(4'hb)] ?
                  ((8'ha3) ? (wire79 ^ (7'h40)) : (~|reg108)) : ((wire85 ?
                      (8'hb0) : reg109) < {wire79})) : (+(reg106 ?
                  wire75[(2'h2):(1'h0)] : (wire84 ? wire80 : wire78)))));
          reg106 <= ({$unsigned((^~reg109)),
              $signed(((wire83 ~^ reg105) ?
                  (wire79 <= reg104) : $signed(wire77)))} * $signed(wire77[(5'h10):(2'h3)]));
          reg107 <= wire84;
          if ({{$unsigned(((reg104 ? (8'hb4) : wire80) ?
                      {reg107} : (wire85 ~^ wire77)))},
              wire78})
            begin
              reg108 <= $unsigned(reg108);
              reg109 <= ({(((reg104 != reg103) || (wire78 ? wire85 : (8'ha8))) ?
                          reg104 : $unsigned((wire79 ? wire76 : wire80))),
                      (wire83 || ($signed(wire85) ?
                          $signed(reg108) : $signed(wire82)))} ?
                  ($signed(wire80[(3'h4):(2'h3)]) ?
                      wire80 : {((wire79 > wire75) < reg108)}) : wire80[(1'h0):(1'h0)]);
            end
          else
            begin
              reg108 <= ($signed(((^~$signed(reg104)) ?
                  {(wire84 ? wire82 : reg103)} : (reg107 ?
                      (wire76 << (8'hae)) : (reg105 & (8'hb1))))) ^ (~&wire78[(3'h4):(1'h1)]));
            end
        end
      if (($signed((reg105[(3'h6):(3'h6)] + {reg107,
              ((8'ha8) ? wire78 : wire82)})) ?
          (^~(^~{(~&wire82),
              $unsigned(wire79)})) : {(reg104 <= (^(reg104 + wire82))),
              $unsigned($unsigned((^(8'haf))))}))
        begin
          reg110 <= {($signed($unsigned($signed(reg104))) ?
                  ($unsigned((reg107 ?
                      reg105 : (8'h9e))) | wire76[(4'hc):(3'h6)]) : reg103[(1'h1):(1'h1)]),
              wire83};
          reg111 <= ($unsigned(wire75[(1'h0):(1'h0)]) | (8'hb6));
        end
      else
        begin
          reg110 <= (8'h9f);
          if ({((~&(8'hbe)) ? reg107[(4'h8):(3'h4)] : (^{(reg107 > reg105)}))})
            begin
              reg111 <= $signed((wire75[(2'h3):(2'h2)] ?
                  wire76[(3'h5):(1'h0)] : reg106[(1'h1):(1'h1)]));
              reg112 <= ($signed($unsigned(wire82[(3'h6):(2'h3)])) ?
                  $signed($unsigned((+$signed(reg108)))) : wire79[(3'h6):(1'h1)]);
              reg113 <= reg110;
            end
          else
            begin
              reg111 <= wire82;
            end
        end
    end
  assign wire114 = $unsigned((^reg112));
  assign wire115 = reg113;
  assign wire116 = wire114[(3'h5):(3'h5)];
  assign wire117 = $signed($unsigned({(wire76 ?
                           $unsigned(wire82) : ((8'hb1) ? (8'hbb) : (8'ha1))),
                       $signed({wire82, reg103})}));
  assign wire118 = $signed($unsigned((~^reg103)));
  assign wire119 = $signed($unsigned((wire116[(1'h0):(1'h0)] ?
                       $signed((wire117 ?
                           wire78 : wire82)) : $unsigned($unsigned(wire78)))));
endmodule

module module19
#(parameter param53 = ((8'hb0) * ({(-(8'hbd)), ((8'hbc) ? ((8'hae) ? (8'hab) : (8'hb0)) : {(8'h9e)})} && ((((8'hb2) || (8'ha0)) & (-(8'ha5))) ? ({(8'hac)} ? (!(8'ha7)) : {(8'hab), (8'hb2)}) : {((8'hbb) ^ (8'h9c)), (^(8'ha7))}))))
(y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire21;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire46;
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  assign y = {wire52, wire51, wire50, wire48, wire24, wire46, reg49, (1'h0)};
  assign wire24 = ($signed(wire23) ?
                      ({$unsigned(((7'h44) ^~ wire23))} + ((8'hb5) ~^ ((wire22 ?
                          wire21 : wire23) * ((8'hb7) ?
                          wire23 : wire20)))) : wire23[(4'hc):(2'h2)]);
  module25 #() modinst47 (wire46, clk, wire23, wire24, wire20, wire22, wire21);
  assign wire48 = ((!(((wire21 <= wire24) ?
                          wire23[(2'h3):(2'h2)] : wire23[(2'h3):(2'h2)]) ?
                      wire22[(3'h4):(2'h3)] : ($signed(wire46) ?
                          (wire24 ?
                              wire46 : wire21) : $unsigned(wire46)))) ~^ wire22[(4'hd):(3'h6)]);
  always
    @(posedge clk) begin
      reg49 <= ((wire23[(2'h3):(2'h2)] || (($signed(wire46) ?
          (wire24 < (8'hb8)) : $unsigned(wire46)) == ($unsigned(wire48) > wire23))) >>> wire20);
    end
  assign wire50 = wire46[(3'h6):(1'h1)];
  assign wire51 = (|$signed(wire50));
  assign wire52 = (^$signed((^({wire22, wire21} ?
                      ((8'ha0) < wire50) : wire51))));
endmodule

module module5
#(parameter param15 = ((~|(|({(7'h40), (8'ha5)} | (8'hbb)))) ? (~&((((8'hb4) > (8'hb4)) ? ((8'hb1) > (8'hac)) : ((8'ha7) ? (8'hbd) : (8'hb9))) ? (((8'h9f) == (8'ha2)) ? {(8'hb2)} : {(8'hae), (8'ha7)}) : {((8'ha9) ? (8'hb0) : (8'haa))})) : ((({(7'h43), (8'hb7)} ? (~|(7'h40)) : ((8'had) ? (8'haa) : (7'h42))) ? (((8'ha5) + (8'ha3)) ? ((8'ha5) + (8'hb8)) : (~^(8'hb7))) : (((8'ha6) << (8'hb7)) ? ((8'hb2) ? (7'h43) : (8'hbd)) : ((8'ha9) - (8'hbe)))) ? (8'ha8) : ({{(8'ha7)}, ((8'hab) ? (8'hae) : (8'hb5))} * (((8'ha5) ? (8'h9d) : (8'hbd)) >> (^(8'ha7)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (wire9[(3'h6):(3'h4)] != $signed((~$unsigned((wire9 * wire9)))));
  assign wire12 = {(wire10[(2'h3):(2'h2)] ?
                          wire6 : ($signed((wire9 ?
                              wire9 : wire7)) >>> $unsigned(wire9[(3'h6):(3'h4)]))),
                      ($unsigned((+wire8)) << ((((7'h43) >>> wire9) - $unsigned(wire8)) + (wire9 ~^ wire11[(3'h4):(3'h4)])))};
  assign wire13 = ($unsigned($signed({$unsigned(wire10), wire11})) ?
                      $signed((8'h9f)) : $unsigned($unsigned({((8'h9c) ?
                              wire8 : wire12)})));
  assign wire14 = $unsigned(wire10);
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire30;
  input wire [(3'h4):(1'h0)] wire29;
  input wire [(4'h9):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  input wire [(3'h4):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  assign y = {wire45,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
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
                 (1'h0)};
  assign wire31 = {(wire29 ? (-wire30) : wire27), wire27[(4'hc):(4'ha)]};
  assign wire32 = {$unsigned((+wire26)),
                      ($unsigned(wire27[(1'h1):(1'h0)]) && ((8'haa) ?
                          wire30[(3'h5):(3'h5)] : $unsigned((wire31 ?
                              wire31 : wire29))))};
  assign wire33 = {wire29[(3'h4):(2'h2)]};
  assign wire34 = wire26;
  always
    @(posedge clk) begin
      reg35 <= {(^(wire29 + (!wire32)))};
      reg36 <= (~wire29[(2'h3):(2'h3)]);
      if ($signed($signed({wire34[(1'h0):(1'h0)], wire31})))
        begin
          reg37 <= wire30;
        end
      else
        begin
          reg37 <= reg35[(4'he):(2'h2)];
          if (wire30[(3'h4):(2'h2)])
            begin
              reg38 <= (8'ha9);
              reg39 <= ($signed((~reg38)) ?
                  reg36[(1'h1):(1'h0)] : $unsigned((~^reg35[(4'h9):(4'h9)])));
              reg40 <= (((^wire33) ?
                      $unsigned((wire27 ?
                          wire32[(1'h1):(1'h1)] : $unsigned((8'hac)))) : ((wire30 ?
                          (wire32 & (8'h9d)) : $unsigned((8'hbc))) < ($signed((8'hbd)) ?
                          $unsigned(reg37) : (wire32 ? wire32 : (8'hbd))))) ?
                  {wire31[(3'h5):(3'h4)],
                      (|($unsigned((8'h9f)) * (!(8'ha6))))} : (&(reg37[(5'h11):(4'hc)] ?
                      (-(reg38 ?
                          wire28 : wire31)) : $signed((wire26 && wire28)))));
              reg41 <= (~^wire33[(4'h8):(1'h1)]);
              reg42 <= {((|(wire26[(1'h0):(1'h0)] ?
                          {wire29} : reg36[(4'h9):(3'h7)])) ?
                      (((reg41 ? reg40 : wire26) ?
                          (|(7'h44)) : (wire31 ?
                              reg38 : reg37)) <= (reg35 == {wire32,
                          wire31})) : wire30[(2'h3):(2'h2)])};
            end
          else
            begin
              reg38 <= wire27;
              reg39 <= ($unsigned((reg38 * {(reg40 ? wire28 : reg39)})) ?
                  $unsigned((8'ha1)) : {reg37[(4'h9):(1'h0)], reg42});
              reg40 <= wire30[(3'h6):(3'h4)];
              reg41 <= (8'ha5);
            end
          reg43 <= wire28;
          reg44 <= $unsigned(reg37);
        end
    end
  assign wire45 = reg36[(4'he):(4'hc)];
endmodule

module module86
#(parameter param100 = {{(!((~(8'h9d)) == (~(8'hac)))), ((~|(|(8'ha0))) ? ({(8'h9e)} ? ((8'hab) & (8'h9e)) : ((8'hae) ? (8'had) : (8'h9f))) : (^~{(8'hb9), (8'hbd)}))}})
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire90;
  input wire [(4'hd):(1'h0)] wire89;
  input wire [(3'h7):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire91;
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  assign y = {wire99,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg98,
                 (1'h0)};
  assign wire91 = ((!$signed($unsigned(wire90))) ?
                      (-(~{(wire89 ? wire89 : wire88),
                          $signed(wire87)})) : ((wire88 || $signed({wire90})) ?
                          $unsigned((|(wire90 ?
                              wire88 : wire89))) : (($unsigned(wire89) ?
                              wire90[(4'hf):(3'h6)] : {wire87}) <<< wire90)));
  assign wire92 = $signed($signed($signed(wire87)));
  assign wire93 = ($signed((~wire89)) ?
                      (8'ha7) : (wire88[(3'h5):(2'h2)] * ($signed(wire87[(3'h6):(3'h4)]) << (((8'hae) & wire89) ?
                          ((8'hbd) ? wire89 : wire88) : wire89))));
  assign wire94 = (wire92[(2'h3):(1'h1)] != $unsigned({(~$signed(wire89)),
                      ($signed(wire87) ? (wire91 & (7'h40)) : wire91)}));
  assign wire95 = $signed(wire92);
  assign wire96 = (&((({wire91, wire88} ? wire90 : (8'ha5)) ?
                          ((~|wire90) & wire88) : $signed((&wire88))) ?
                      (!(wire88[(3'h5):(2'h3)] & $unsigned((7'h40)))) : wire91));
  assign wire97 = $signed(wire87);
  always
    @(posedge clk) begin
      reg98 <= $signed((wire96[(4'hb):(3'h4)] <= {wire90[(4'h9):(1'h1)],
          {(!wire92)}}));
    end
  assign wire99 = $unsigned($unsigned($unsigned(wire94)));
endmodule
