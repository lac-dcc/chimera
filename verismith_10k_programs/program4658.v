module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire94;
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  assign y = {wire120,
                 wire115,
                 wire114,
                 wire113,
                 wire100,
                 wire99,
                 wire18,
                 wire5,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire94,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
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
                 reg102,
                 reg101,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire5 = $unsigned(wire0);
  module6 #() modinst19 (wire18, clk, wire3, wire1, wire4, wire0, wire2);
  assign wire20 = ($unsigned($signed($signed(wire0))) ?
                      wire4 : ((((8'ha1) ? (wire4 ? wire0 : wire5) : wire2) ?
                              {wire1[(4'h9):(3'h6)]} : wire1) ?
                          (8'haa) : wire0[(1'h0):(1'h0)]));
  assign wire21 = (~(|$unsigned($signed($unsigned(wire0)))));
  assign wire22 = (wire0[(3'h7):(3'h7)] ?
                      {wire20} : ($signed({$unsigned(wire0)}) ?
                          {$signed(wire2),
                              (~&{wire20,
                                  wire20})} : $signed($signed($signed(wire0)))));
  assign wire23 = (wire4[(1'h1):(1'h0)] ?
                      $unsigned({{wire18[(2'h2):(1'h1)],
                              $unsigned(wire5)}}) : wire22[(1'h1):(1'h0)]);
  module24 #() modinst95 (wire94, clk, wire0, wire3, wire21, wire22, wire18);
  always
    @(posedge clk) begin
      reg96 <= (|wire0);
      reg97 <= $unsigned((({$unsigned(wire5)} + $unsigned({wire23,
          wire0})) > $signed(($unsigned(reg96) ? (~|wire3) : (-wire22)))));
      reg98 <= (8'ha9);
    end
  assign wire99 = reg96[(2'h2):(1'h1)];
  assign wire100 = (&$signed(wire1));
  always
    @(posedge clk) begin
      if ((~&$signed((($unsigned(reg98) ?
          (reg97 < reg98) : $unsigned(wire4)) ^ {{reg97},
          reg98[(4'hc):(3'h7)]}))))
        begin
          reg101 <= wire99;
          reg102 <= $unsigned((~wire5[(2'h2):(1'h1)]));
          reg103 <= ({wire23[(3'h5):(3'h5)]} == (&$signed(wire3)));
          reg104 <= (&($unsigned(((wire0 ? reg102 : wire4) ?
              (+wire99) : reg101)) > $unsigned(($unsigned(wire4) ?
              (!reg103) : (wire4 ? wire100 : wire20)))));
          if ($signed($unsigned((~^reg101))))
            begin
              reg105 <= (wire3 != (8'hae));
              reg106 <= wire2[(4'h8):(2'h3)];
              reg107 <= ((reg105[(3'h7):(1'h0)] | reg104) ?
                  (~^(($unsigned(wire23) << $signed(wire4)) != reg102)) : wire3);
              reg108 <= $signed((^~(wire4 != (^~(reg102 != wire4)))));
            end
          else
            begin
              reg105 <= reg105;
              reg106 <= (wire23[(3'h6):(3'h4)] <<< (reg98[(3'h7):(1'h1)] ?
                  (wire2 ?
                      ($unsigned(wire5) ^~ (reg97 > wire18)) : (reg96 - {wire4,
                          reg97})) : (((wire94 - reg105) >= reg107) ?
                      {$signed(wire2)} : reg102)));
              reg107 <= wire21;
            end
        end
      else
        begin
          reg101 <= (!wire0);
          reg102 <= reg107;
        end
      reg109 <= $signed((wire4 ?
          (^~({reg103} ^~ (&(8'h9c)))) : (wire18[(4'h8):(2'h3)] ?
              $signed((wire94 ?
                  (8'ha8) : (8'hbe))) : $unsigned((reg106 > wire1)))));
      if ((~&$unsigned(wire99)))
        begin
          reg110 <= {wire0[(2'h3):(1'h0)]};
        end
      else
        begin
          reg110 <= reg96[(2'h2):(1'h0)];
        end
      reg111 <= {((~(8'hb7)) ?
              (8'hac) : ((((8'hb1) ? wire2 : reg106) ?
                  $signed(wire94) : reg101) & $signed(wire1)))};
      reg112 <= $unsigned(wire100);
    end
  assign wire113 = $unsigned(wire22);
  assign wire114 = {((reg101 ? (~|{reg109, wire18}) : reg96) ?
                           $unsigned((^(-reg104))) : ((reg112 ?
                                   (^reg104) : reg98[(3'h5):(2'h3)]) ?
                               reg108[(4'h8):(1'h1)] : (8'hbf))),
                       ((8'h9c) >= $unsigned(reg107[(4'hc):(4'hc)]))};
  assign wire115 = (reg107 ?
                       {{$unsigned(reg103[(4'ha):(4'h8)])},
                           (wire0 ?
                               $signed((wire94 > wire0)) : $signed((reg107 << reg98)))} : (8'ha2));
  always
    @(posedge clk) begin
      reg116 <= $unsigned(({wire5[(4'h8):(2'h2)]} - (wire100 ?
          (((8'hb2) + wire2) ?
              $signed(wire4) : $signed(wire4)) : (~|$unsigned(reg108)))));
      reg117 <= $unsigned(wire115);
      reg118 <= $signed(wire23[(2'h3):(1'h1)]);
      reg119 <= reg111[(3'h6):(2'h3)];
    end
  assign wire120 = reg107;
  always
    @(posedge clk) begin
      reg121 <= reg98[(5'h11):(1'h1)];
      if ($signed(wire1[(4'h8):(3'h5)]))
        begin
          reg122 <= (!$unsigned($signed((-$signed(reg104)))));
          if (reg106)
            begin
              reg123 <= (8'hb9);
              reg124 <= {(|($signed(reg109[(2'h2):(2'h2)]) ?
                      ($signed(reg102) ?
                          (8'hb2) : $unsigned(reg105)) : $unsigned(wire120))),
                  ($signed(({wire113} ^~ (reg98 ?
                      wire115 : wire114))) > ((^~$signed(wire3)) <= ($signed(reg118) << $unsigned(wire0))))};
              reg125 <= wire94[(4'hc):(1'h0)];
              reg126 <= ((|(wire2[(3'h7):(2'h3)] ?
                      (8'hb0) : ((wire115 == (8'hb6)) - reg117[(4'h8):(2'h2)]))) ?
                  $unsigned(((+reg124) == $signed((wire5 != reg107)))) : $unsigned(($signed((reg101 ?
                      wire1 : wire21)) ^~ {((8'ha8) ? reg106 : reg109)})));
              reg127 <= ($signed(reg121) ?
                  {($unsigned((~reg103)) ?
                          $unsigned($unsigned(reg124)) : $signed((+(8'hbc))))} : (wire2 & $unsigned($signed((reg110 ?
                      reg108 : wire114)))));
            end
          else
            begin
              reg123 <= $signed((8'hb2));
              reg124 <= $unsigned(wire21);
            end
          reg128 <= $unsigned(((~&$unsigned((^~wire100))) ?
              reg125[(1'h1):(1'h0)] : reg122));
          reg129 <= ((7'h41) <<< (^(~|(8'hb3))));
        end
      else
        begin
          reg122 <= (&$signed({reg123[(5'h11):(3'h4)], (-(8'ha1))}));
          reg123 <= reg121[(2'h3):(2'h3)];
          reg124 <= wire23[(3'h4):(2'h3)];
        end
    end
endmodule

module module24
#(parameter param92 = ((~|(~|(8'hb7))) ? (((-(~|(8'ha7))) ? (~{(8'hb3)}) : {(+(8'hb0)), (^(8'hb7))}) + {(^~((8'hb2) ? (8'hbe) : (8'ha0))), (((7'h42) >>> (8'hb6)) && (^(8'ha0)))}) : (8'hbd)), 
parameter param93 = (~&(+param92)))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire signed [(3'h5):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire70;
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire85,
                 wire84,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  module30 #() modinst71 (.wire32(wire27), .y(wire70), .wire34(wire26), .clk(clk), .wire31(wire28), .wire33(wire29));
  assign wire72 = (wire25[(3'h4):(2'h3)] ?
                      (($unsigned(wire26[(2'h2):(1'h0)]) ^ ($signed(wire27) && (^wire25))) > $signed({wire26})) : $signed((^~wire26)));
  assign wire73 = $unsigned($unsigned(($unsigned($signed(wire70)) ?
                      $signed((^~wire26)) : ((wire26 << wire28) * wire72))));
  assign wire74 = wire29;
  assign wire75 = wire29;
  always
    @(posedge clk) begin
      reg76 <= $signed($signed(($unsigned((!wire73)) >= $signed((wire73 ?
          wire27 : (8'hbf))))));
      if ((|wire28[(4'hf):(3'h7)]))
        begin
          reg77 <= (^~$unsigned({wire74, $signed($unsigned((8'ha0)))}));
        end
      else
        begin
          if ($unsigned(wire75[(4'h8):(3'h7)]))
            begin
              reg77 <= wire28[(4'hd):(2'h2)];
              reg78 <= $signed((($unsigned($signed(wire75)) ?
                  $unsigned(wire75[(3'h5):(3'h5)]) : (^~(wire73 ?
                      wire25 : wire72))) & {(&$unsigned(wire73))}));
            end
          else
            begin
              reg77 <= $unsigned(($signed(reg76[(4'hb):(4'h9)]) ?
                  wire29[(3'h6):(3'h5)] : {{(wire70 < wire27)}}));
            end
          if (wire73[(2'h2):(1'h1)])
            begin
              reg79 <= $unsigned((wire75[(4'h9):(2'h3)] ?
                  $unsigned(wire29[(2'h3):(2'h3)]) : (~^((|wire73) ~^ $unsigned(reg78)))));
              reg80 <= $unsigned({$unsigned($signed($unsigned(wire70)))});
              reg81 <= ((~^(~^$unsigned((~wire73)))) ?
                  reg76 : wire27[(2'h2):(1'h1)]);
              reg82 <= {wire72};
            end
          else
            begin
              reg79 <= (8'hba);
              reg80 <= {(8'hb4), reg80};
              reg81 <= reg79[(2'h2):(1'h0)];
              reg82 <= ($signed(wire26) >= reg82[(4'hc):(2'h3)]);
            end
          reg83 <= $signed((wire25[(2'h2):(1'h0)] ? reg79 : $signed((8'h9c))));
        end
    end
  assign wire84 = (|((wire26 >> reg80[(3'h7):(1'h1)]) - $unsigned(($signed(wire25) < reg83))));
  assign wire85 = (-(^~$unsigned((&wire73))));
  always
    @(posedge clk) begin
      reg86 <= reg77;
      reg87 <= $signed(reg76[(2'h2):(2'h2)]);
      reg88 <= (+reg80[(2'h3):(2'h3)]);
      reg89 <= $signed({wire25, wire25});
    end
  assign wire90 = $unsigned(reg87[(4'hd):(4'hb)]);
  assign wire91 = (wire90[(1'h1):(1'h0)] ^~ $unsigned(reg81[(3'h5):(3'h5)]));
endmodule

module module6
#(parameter param17 = (({(((8'h9e) >= (8'hb2)) ? (~^(8'h9f)) : ((8'ha8) - (8'h9e))), (((8'hb3) ? (8'hb6) : (8'hb9)) ? ((8'ha9) | (8'ha4)) : ((7'h40) && (8'ha6)))} ^ {((~(8'hb6)) ? (!(8'ha2)) : ((8'hbb) & (8'ha4)))}) ? (((((8'hb5) ? (7'h44) : (7'h41)) << ((8'hb2) ^~ (8'ha4))) ? (!((8'hb5) ? (8'hb2) : (8'h9c))) : {(!(8'ha4)), (-(7'h43))}) >>> (~|((&(8'ha8)) ? ((8'hb4) ? (8'had) : (7'h40)) : ((8'hbd) == (8'hb4))))) : (((^((8'h9e) ? (8'hb3) : (8'ha4))) ? (((8'ha0) < (8'h9c)) ? ((7'h40) ~^ (8'haa)) : ((8'h9d) ? (8'h9c) : (8'hba))) : (+{(8'ha6), (7'h42)})) <<< {(((7'h41) ? (8'hb6) : (8'h9c)) ? ((8'ha6) <<< (8'haa)) : ((8'hac) != (8'hb8)))})))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  assign y = {wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = (~(((8'h9d) ^ (wire7[(3'h4):(2'h3)] ^~ $signed(wire11))) - {$signed(((8'h9e) ?
                          wire8 : (8'hb5))),
                      $signed($unsigned(wire9))}));
  assign wire13 = (&{wire8[(2'h3):(1'h0)]});
  assign wire14 = ($unsigned($unsigned((wire12[(5'h11):(3'h6)] ?
                          wire12 : ((8'ha4) ? wire13 : wire11)))) ?
                      (~^wire11[(1'h1):(1'h0)]) : {($unsigned(((8'hb4) ?
                              wire9 : wire9)) ~^ (8'ha3))});
  assign wire15 = (&((-{{wire13, wire14}, wire10[(4'he):(4'he)]}) ?
                      $signed(wire11[(3'h4):(2'h3)]) : (^((+wire12) ?
                          (wire14 ? (8'haa) : wire14) : {wire13, wire8}))));
  assign wire16 = ((($signed(wire13[(2'h2):(2'h2)]) == $signed((wire7 ?
                      wire15 : wire10))) || wire8[(4'h8):(1'h1)]) <<< wire11);
endmodule

module module30  (y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire34;
  input wire [(3'h7):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire35;
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  assign y = {wire69,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire35,
                 reg68,
                 reg67,
                 reg66,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg45,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire35 = wire32;
  always
    @(posedge clk) begin
      reg36 <= ({wire34} ? wire33 : {wire34[(1'h0):(1'h0)]});
      reg37 <= (~|wire32);
      reg38 <= $unsigned((($unsigned($signed(wire31)) != ($signed(reg37) + (~&wire32))) & ((+$unsigned(wire35)) ?
          ($signed(wire34) & (8'hb8)) : ((wire35 ? wire35 : wire31) ?
              (!wire34) : (wire35 >>> reg37)))));
      reg39 <= $unsigned(reg38);
    end
  assign wire40 = reg38;
  assign wire41 = ($unsigned(($signed((wire32 ^~ (8'ha2))) ?
                      ((~|reg37) - wire34[(2'h2):(1'h0)]) : reg37[(3'h7):(2'h3)])) ^ (wire31 ?
                      ((wire40 ? $unsigned(wire31) : (~^wire34)) ?
                          wire32[(1'h1):(1'h1)] : (~&wire34[(2'h2):(1'h0)])) : reg39));
  assign wire42 = {reg36};
  assign wire43 = wire41;
  assign wire44 = $signed((~(^$signed((wire42 ? wire43 : wire40)))));
  always
    @(posedge clk) begin
      reg45 <= $signed(reg39);
    end
  assign wire46 = $unsigned(wire31[(5'h14):(1'h1)]);
  assign wire47 = {reg37, (|(-(wire40 & {wire41, wire35})))};
  assign wire48 = reg37;
  assign wire49 = ((^~wire31[(4'hb):(1'h0)]) ?
                      $unsigned($signed(wire31)) : wire44);
  assign wire50 = ($unsigned((~reg37)) ?
                      (wire48 + (^(^wire41))) : ((wire46 ?
                              ((reg38 ^~ reg36) > reg38[(3'h4):(2'h3)]) : (reg36 + {reg39})) ?
                          {($unsigned(wire35) ? (wire46 & wire33) : (7'h40)),
                              reg37} : wire49[(4'hb):(3'h6)]));
  always
    @(posedge clk) begin
      reg51 <= $unsigned(wire50);
      if (wire32)
        begin
          reg52 <= wire34[(1'h1):(1'h1)];
          reg53 <= {(({reg51[(3'h6):(3'h5)],
                      (wire32 ^~ reg36)} == $signed(reg37[(2'h3):(1'h0)])) ?
                  (($unsigned(wire32) & reg36[(3'h5):(1'h0)]) != ((wire42 <= wire46) ?
                      (reg38 || (8'ha7)) : (wire31 ?
                          (8'ha1) : reg52))) : (~&(-(wire32 ?
                      reg52 : wire48))))};
          reg54 <= $signed(reg53[(4'hb):(3'h6)]);
        end
      else
        begin
          if ($signed(reg39))
            begin
              reg52 <= $signed($signed(wire48));
              reg53 <= $unsigned($signed((~&$unsigned(wire40[(2'h2):(1'h0)]))));
              reg54 <= $signed($signed(reg37[(3'h7):(3'h4)]));
            end
          else
            begin
              reg52 <= (+(!(($unsigned(wire33) ?
                  wire34 : (wire33 && reg52)) || (^wire33[(1'h1):(1'h1)]))));
              reg53 <= (($unsigned({(~&reg38), (wire32 <<< wire33)}) ?
                      ((+(reg54 ? wire43 : wire32)) ?
                          reg39[(4'hc):(4'hc)] : (+$unsigned((8'hb5)))) : (|$unsigned((!reg37)))) ?
                  wire49 : $signed(($unsigned((&reg51)) >= reg53[(3'h4):(3'h4)])));
              reg54 <= $signed(wire35[(1'h0):(1'h0)]);
              reg55 <= ((($unsigned(((8'h9c) >= wire48)) ^~ wire40[(1'h0):(1'h0)]) == ($signed((wire33 | wire44)) <= $unsigned(((8'had) ?
                      reg45 : reg52)))) ?
                  (^~reg39) : reg36);
              reg56 <= $signed($unsigned($signed(wire35[(4'h8):(3'h7)])));
            end
        end
      if (($unsigned((reg56 ?
          $unsigned(wire35[(4'h8):(2'h2)]) : (wire47 ^ wire43))) << $unsigned(wire41[(3'h6):(3'h4)])))
        begin
          if ((!wire50[(2'h2):(2'h2)]))
            begin
              reg57 <= {reg38[(1'h0):(1'h0)]};
              reg58 <= ((wire50 ?
                      ({(wire41 ? reg38 : reg51)} ?
                          (wire44 <= $unsigned(reg52)) : $unsigned((wire42 ?
                              wire46 : reg37))) : $unsigned(wire42)) ?
                  (wire40 ?
                      (+(wire41[(4'ha):(1'h0)] != wire49[(3'h6):(1'h0)])) : wire32[(1'h1):(1'h1)]) : $signed(reg45));
            end
          else
            begin
              reg57 <= (($signed(reg58[(4'h8):(2'h2)]) | reg45) ~^ $unsigned($unsigned(reg37)));
              reg58 <= ({(8'hbc)} ?
                  $signed({$signed($signed((8'h9c))),
                      (wire35[(1'h0):(1'h0)] > {wire44})}) : $signed(($unsigned($signed(reg45)) ?
                      $unsigned($unsigned(wire35)) : $unsigned(((8'ha1) >>> (8'ha6))))));
              reg59 <= (^(($signed($signed(reg45)) | (~(reg57 ?
                      reg53 : wire43))) ?
                  $unsigned((|(8'ha0))) : wire31[(3'h7):(3'h4)]));
              reg60 <= $unsigned(reg39);
            end
          reg61 <= $signed(reg57[(2'h3):(2'h3)]);
          reg62 <= wire42;
        end
      else
        begin
          reg57 <= $signed($signed({$signed({wire44})}));
          reg58 <= reg59[(2'h3):(1'h0)];
        end
      reg63 <= $unsigned(reg57[(3'h4):(2'h2)]);
      reg64 <= {(wire33[(1'h1):(1'h0)] ^ $unsigned(wire35))};
    end
  always
    @(posedge clk) begin
      reg65 <= ({{$unsigned((-reg54))}, $unsigned(wire46[(2'h2):(1'h1)])} ?
          reg64 : ((reg53 + {$signed(reg56)}) <= (wire46[(3'h7):(2'h2)] ?
              (!(|(8'hac))) : {(~^reg60), (+reg56)})));
      reg66 <= ({(wire31[(4'ha):(2'h3)] ?
                  ((reg64 - reg36) | reg62[(2'h2):(2'h2)]) : wire32[(1'h0):(1'h0)])} ?
          (+reg55) : {reg64[(4'h9):(3'h6)], reg61[(3'h5):(3'h5)]});
      reg67 <= (wire42 ?
          reg57[(1'h0):(1'h0)] : $signed($signed((wire49 ~^ $unsigned((8'hb9))))));
      reg68 <= ({(($signed(wire41) & $unsigned(wire46)) ?
              $unsigned($unsigned(reg64)) : reg53)} > $unsigned($unsigned(({(8'hbe),
          reg36} >= {reg38, wire43}))));
    end
  assign wire69 = wire43[(3'h4):(2'h3)];
endmodule
