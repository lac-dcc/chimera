module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire162;
  wire signed [(4'ha):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire157;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire155;
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire158,
                 wire157,
                 wire5,
                 wire6,
                 wire151,
                 wire153,
                 wire154,
                 wire155,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = wire1[(3'h6):(2'h3)];
  assign wire6 = {(wire3[(4'hd):(2'h2)] ? wire3 : $unsigned((+$signed(wire0)))),
                     $unsigned(($signed((wire0 < wire3)) || $unsigned($signed(wire4))))};
  always
    @(posedge clk) begin
      reg7 <= (((-wire3[(4'h9):(2'h3)]) ?
          $signed(wire6[(3'h5):(1'h1)]) : $signed(($signed(wire0) ?
              $signed(wire2) : wire2[(2'h2):(2'h2)]))) <= ((7'h43) >> $signed((~$unsigned(wire2)))));
      reg8 <= $signed((wire2[(3'h6):(3'h5)] ? {(8'hbf)} : wire5));
      reg9 <= {reg7[(1'h0):(1'h0)]};
    end
  module10 #() modinst152 (wire151, clk, wire6, wire1, wire4, wire2);
  assign wire153 = wire3[(4'hb):(4'h8)];
  assign wire154 = $signed((8'hb0));
  module70 #() modinst156 (.wire71(wire153), .wire74(reg8), .clk(clk), .y(wire155), .wire72(wire154), .wire73(wire1));
  assign wire157 = $signed(((wire0[(4'h9):(2'h2)] ?
                       $unsigned((wire2 == (8'ha4))) : (+wire5[(1'h1):(1'h1)])) | $signed((|wire155[(4'ha):(1'h0)]))));
  module70 #() modinst159 (wire158, clk, wire2, wire155, wire1, wire151);
  assign wire160 = $unsigned((7'h40));
  assign wire161 = ($unsigned(($unsigned(wire154[(3'h5):(1'h1)]) ^~ {$unsigned(wire151)})) ?
                       wire151 : (8'hba));
  assign wire162 = (^~(wire161 + (~&wire157)));
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire signed [(4'h8):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg127 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire146,
                 wire112,
                 wire109,
                 wire107,
                 wire68,
                 wire50,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire16,
                 wire15,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg110,
                 reg111,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 (1'h0)};
  assign wire15 = (((^$signed((-wire11))) ?
                          ((+(!wire12)) <= $signed((wire11 - wire11))) : $unsigned((8'haa))) ?
                      $unsigned($signed((&$signed(wire13)))) : (((-$signed(wire14)) ?
                              wire14 : ({wire12} & $signed((8'hbf)))) ?
                          wire14[(5'h13):(5'h10)] : (-wire14[(5'h15):(3'h4)])));
  assign wire16 = wire12;
  always
    @(posedge clk) begin
      reg17 <= wire11[(3'h6):(2'h3)];
      reg18 <= $signed(($unsigned($unsigned(wire15[(2'h3):(2'h2)])) ?
          (^~$unsigned((wire13 ?
              wire16 : wire15))) : $signed($unsigned(wire12[(4'he):(3'h6)]))));
      reg19 <= (wire12[(3'h5):(1'h0)] ?
          $signed(wire11[(2'h3):(1'h0)]) : reg17[(3'h4):(1'h0)]);
      reg20 <= (+$signed($signed($unsigned($unsigned(wire16)))));
    end
  assign wire21 = wire12;
  assign wire22 = (8'hb1);
  assign wire23 = ($signed(wire14[(4'hc):(3'h7)]) ? (8'hbd) : wire11);
  assign wire24 = wire13[(4'h9):(2'h3)];
  assign wire25 = wire16[(3'h6):(1'h0)];
  assign wire26 = ((~^reg17[(2'h3):(1'h1)]) ? $unsigned(wire21) : reg18);
  module27 #() modinst51 (.wire31(wire24), .wire30(reg20), .y(wire50), .clk(clk), .wire29(wire16), .wire28(reg17));
  module52 #() modinst69 (wire68, clk, reg19, wire24, wire11, wire50, wire16);
  module70 #() modinst108 (.wire73(wire68), .wire71(wire15), .y(wire107), .wire74(wire21), .clk(clk), .wire72(wire22));
  assign wire109 = $signed($unsigned((((wire26 ? wire11 : wire107) ?
                       wire21[(5'h10):(4'hf)] : (wire107 >= wire68)) << wire24)));
  always
    @(posedge clk) begin
      reg110 <= {wire16[(4'he):(4'he)]};
      reg111 <= wire23;
    end
  assign wire112 = {$unsigned($signed({$unsigned(wire109)}))};
  always
    @(posedge clk) begin
      reg113 <= ($signed((!wire68)) < wire23[(4'hd):(3'h7)]);
      if ($signed(wire12[(5'h11):(4'hd)]))
        begin
          if (($signed((~&{wire50})) ^ $signed($signed($unsigned((8'hb1))))))
            begin
              reg114 <= reg18[(1'h1):(1'h0)];
              reg115 <= wire13;
              reg116 <= ((wire13[(3'h4):(1'h0)] * wire50[(2'h2):(1'h0)]) ?
                  $unsigned((((~wire15) ?
                      (^wire21) : {wire112}) >> {$signed((8'hb0)),
                      {wire50, wire21}})) : (reg18[(1'h0):(1'h0)] ?
                      ((&wire26[(5'h12):(5'h12)]) << $unsigned($unsigned(wire23))) : $unsigned($signed((|wire11)))));
            end
          else
            begin
              reg114 <= $unsigned(wire12[(4'h8):(3'h7)]);
              reg115 <= (+($unsigned(wire23) ? (~(!$signed(reg116))) : wire22));
              reg116 <= (((!reg18[(2'h3):(2'h2)]) ?
                  (~^((wire24 ? wire107 : wire12) ?
                      (wire11 >>> wire16) : ((7'h41) ?
                          reg115 : (8'hb0)))) : $signed({wire16})) < (+(~&(+(wire15 ?
                  reg114 : reg113)))));
            end
          reg117 <= reg19;
          if ($unsigned($signed(reg18[(1'h1):(1'h0)])))
            begin
              reg118 <= ($unsigned($unsigned((^~{wire23}))) <<< reg18);
              reg119 <= $unsigned($unsigned(({$unsigned(wire21)} ?
                  {(wire13 ? (8'hb3) : wire15),
                      (wire107 ^ (8'h9e))} : ($signed(reg19) | $signed(wire15)))));
              reg120 <= (reg18[(2'h2):(1'h1)] < $signed($signed(wire107[(4'hb):(1'h1)])));
              reg121 <= (($signed($signed(wire107)) * reg19[(4'hc):(4'h9)]) == reg114);
              reg122 <= $unsigned(reg116);
            end
          else
            begin
              reg118 <= (((reg121[(1'h1):(1'h1)] ?
                      (+$signed(wire12)) : $signed((wire14 | reg121))) + (^~wire24)) ?
                  reg117 : (~$signed((^(^wire21)))));
              reg119 <= (~&reg111[(2'h3):(2'h2)]);
              reg120 <= $signed(wire26);
              reg121 <= $signed($signed({reg114,
                  ((^~wire13) ? wire68 : (reg122 ? reg19 : (8'hbd)))}));
              reg122 <= {reg111[(4'h8):(4'h8)], wire11};
            end
          reg123 <= wire16[(5'h10):(1'h0)];
          reg124 <= $unsigned((+(wire16 ? reg123 : reg17[(3'h5):(1'h1)])));
        end
      else
        begin
          if (wire22)
            begin
              reg114 <= $signed((reg114 || (((reg116 ? wire21 : reg18) ?
                  {reg20, reg119} : {reg119, reg114}) * (8'ha1))));
              reg115 <= wire11[(2'h2):(2'h2)];
              reg116 <= $signed((8'had));
              reg117 <= reg18;
              reg118 <= (^~$unsigned(wire50[(4'hb):(4'ha)]));
            end
          else
            begin
              reg114 <= wire68[(2'h2):(2'h2)];
              reg115 <= (&{($signed((~|(8'hab))) ?
                      wire24 : ((reg120 ? wire23 : wire68) ?
                          {(7'h40), (8'hb1)} : {wire109, reg114}))});
              reg116 <= reg123;
              reg117 <= (8'hb5);
              reg118 <= ($unsigned({(wire107 & (wire68 ? reg123 : reg115))}) ?
                  (&({(wire107 >>> reg17)} * wire11[(4'h9):(1'h0)])) : $unsigned($signed($unsigned($unsigned(reg110)))));
            end
          reg119 <= (reg17[(2'h2):(1'h0)] ?
              ($signed(((^(8'ha1)) + {reg123})) ?
                  (8'hb5) : $unsigned($signed((~^reg111)))) : wire14[(4'ha):(4'h9)]);
        end
      reg125 <= wire13[(4'hb):(1'h1)];
      reg126 <= (~wire11[(2'h3):(1'h0)]);
      reg127 <= $signed($signed($signed(((8'ha7) > {(8'hae), wire21}))));
    end
  module128 #() modinst147 (wire146, clk, wire25, wire21, reg117, reg124, reg121);
  assign wire148 = ((+$signed(wire107[(2'h2):(1'h0)])) ?
                       $signed(reg119) : reg123[(3'h7):(1'h1)]);
  assign wire149 = (($signed((wire68 ?
                           reg110[(4'hc):(4'hb)] : {wire107})) >= wire16) ?
                       $signed(($signed((wire16 << reg120)) ?
                           wire109 : $unsigned($signed(reg17)))) : ({$signed((-(8'h9d)))} ?
                           (^~reg124) : ($unsigned((^wire112)) ?
                               (wire14[(3'h5):(1'h0)] ?
                                   (^~(8'ha0)) : $signed(reg111)) : ((+wire25) >> wire148[(2'h2):(1'h1)]))));
  assign wire150 = wire23;
endmodule

module module128
#(parameter param145 = (&{(&(|{(8'hb2)})), (((~(8'hbb)) ? ((8'h9f) & (8'ha5)) : ((8'hb3) > (8'hba))) ? (-(~|(8'ha7))) : {((8'hbb) || (8'hb5)), ((8'ha8) ? (8'hbf) : (8'hae))})}))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire133;
  input wire [(5'h11):(1'h0)] wire132;
  input wire [(4'hd):(1'h0)] wire131;
  input wire signed [(4'hf):(1'h0)] wire130;
  input wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire143;
  wire signed [(5'h15):(1'h0)] wire142;
  wire signed [(3'h6):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(4'h9):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire137;
  wire [(4'hf):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire134;
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 (1'h0)};
  assign wire134 = ((!{{$signed(wire131)}}) ?
                       $signed($unsigned($unsigned($unsigned(wire130)))) : wire133[(1'h1):(1'h0)]);
  assign wire135 = (~(~|$signed($unsigned($unsigned(wire130)))));
  assign wire136 = ($unsigned((($signed(wire130) ?
                               (wire133 != wire132) : $signed(wire129)) ?
                           ({wire135, (8'hb4)} ?
                               wire135[(4'hc):(4'hb)] : (~|wire131)) : wire135[(4'hd):(3'h7)])) ?
                       wire131 : (~|wire133));
  assign wire137 = (+(~&{($unsigned(wire132) ? (~wire133) : $unsigned((7'h44))),
                       $unsigned((wire129 ? wire135 : wire130))}));
  assign wire138 = wire135[(5'h10):(4'he)];
  assign wire139 = wire129;
  assign wire140 = (wire129 ?
                       ((^~$unsigned($signed(wire133))) ?
                           (&(-wire129)) : wire130[(3'h5):(3'h4)]) : wire135[(5'h11):(1'h0)]);
  assign wire141 = (^wire130[(4'he):(4'he)]);
  assign wire142 = wire130[(3'h4):(1'h1)];
  assign wire143 = wire141;
  assign wire144 = $unsigned((^($unsigned(((8'hb1) > wire132)) ?
                       {$signed((8'ha2))} : $signed((wire139 ?
                           wire143 : wire140)))));
endmodule

module module70
#(parameter param105 = (~|(+((+((8'ha7) >>> (8'ha7))) + ((-(8'hb1)) ? {(8'ha4), (8'hbb)} : (~^(8'had)))))), 
parameter param106 = param105)
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire74;
  input wire [(4'hc):(1'h0)] wire73;
  input wire signed [(2'h2):(1'h0)] wire72;
  input wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire77;
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  assign y = {wire104,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg76,
                 reg75,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg75 <= (+($unsigned(wire74[(3'h6):(2'h3)]) ?
          (&(wire72[(1'h0):(1'h0)] < (~&(8'h9d)))) : ($unsigned({wire74}) ^~ $signed($signed(wire73)))));
      reg76 <= {reg75, wire72};
    end
  assign wire77 = (($signed((wire72 >>> $unsigned(wire72))) >>> (!wire74[(4'h8):(3'h7)])) <<< $unsigned((($signed(wire73) ?
                      $signed(reg75) : (wire71 <= (8'ha4))) < ($unsigned(wire73) * (reg76 ?
                      wire72 : (8'h9c))))));
  assign wire78 = ($unsigned(wire73[(3'h7):(3'h5)]) ?
                      $unsigned({{(wire74 != reg76)},
                          $unsigned($unsigned(wire71))}) : ({wire73} - $unsigned({$signed(wire71),
                          {wire73}})));
  assign wire79 = wire78;
  assign wire80 = (~$unsigned($unsigned(wire73[(4'ha):(1'h0)])));
  always
    @(posedge clk) begin
      reg81 <= ($signed({({wire72} > wire79)}) < $unsigned(wire80[(1'h1):(1'h1)]));
      if (wire74[(3'h6):(1'h1)])
        begin
          reg82 <= reg81;
          reg83 <= wire77;
          if ((wire74 == $unsigned((wire78 ?
              reg81 : $signed({reg83, wire77})))))
            begin
              reg84 <= $unsigned(($unsigned($signed((~wire79))) ?
                  (!$unsigned($unsigned(reg83))) : ((wire79[(5'h10):(5'h10)] >>> wire77) ?
                      $unsigned($unsigned((8'ha7))) : (&wire79[(3'h4):(1'h0)]))));
              reg85 <= $signed($unsigned($unsigned({$signed(reg75),
                  reg83[(1'h0):(1'h0)]})));
              reg86 <= reg76[(3'h7):(3'h5)];
            end
          else
            begin
              reg84 <= (-$unsigned($unsigned((|{wire73, wire74}))));
              reg85 <= ($unsigned({(reg82[(4'hb):(1'h1)] ?
                          (8'hb6) : (7'h42))}) ?
                  (-$signed((&$signed(reg85)))) : (wire72 & reg85));
              reg86 <= $unsigned((~|wire73));
              reg87 <= {((reg82[(4'hc):(2'h2)] < (|$signed(wire78))) ~^ reg81[(1'h0):(1'h0)]),
                  reg75[(1'h1):(1'h0)]};
            end
          if ($signed($signed($unsigned(reg75))))
            begin
              reg88 <= reg76;
              reg89 <= reg85[(2'h3):(1'h1)];
            end
          else
            begin
              reg88 <= $unsigned($signed((-(reg86[(1'h1):(1'h0)] ?
                  (reg89 ? reg84 : (8'hbe)) : $signed(reg89)))));
              reg89 <= {$signed(wire80),
                  ($signed(wire78) ?
                      {$signed(wire73[(1'h0):(1'h0)]),
                          wire73} : ({$signed(reg84),
                          $unsigned((8'hbc))} + $signed($unsigned(reg84))))};
            end
        end
      else
        begin
          reg82 <= wire78;
          reg83 <= (~^(!wire77));
        end
      if (wire79)
        begin
          reg90 <= reg76[(4'h9):(2'h2)];
          if (({$unsigned(reg89[(2'h3):(2'h3)])} < reg82[(4'hd):(3'h5)]))
            begin
              reg91 <= ($unsigned($unsigned((~^(reg82 >> reg87)))) ?
                  $signed(wire78[(1'h1):(1'h0)]) : reg82);
              reg92 <= $signed((8'h9d));
              reg93 <= $unsigned(reg89);
              reg94 <= reg76[(3'h7):(2'h2)];
              reg95 <= $signed($signed(reg86[(2'h2):(1'h1)]));
            end
          else
            begin
              reg91 <= reg86;
              reg92 <= ((&($signed(reg93) ?
                      ((+(8'hb1)) ?
                          wire73[(3'h5):(1'h1)] : $signed(reg91)) : (^reg82))) ?
                  (-(-((reg91 ? reg84 : reg83) & ((8'hb3) ?
                      (8'hae) : reg93)))) : (~^($signed($unsigned(wire73)) & wire80)));
              reg93 <= (+$unsigned({$signed($unsigned(reg76))}));
              reg94 <= reg76[(1'h1):(1'h0)];
            end
          if (({(reg89 ?
                  {(wire80 - (8'hb8)), reg87} : (wire73 == (reg95 ?
                      reg92 : (8'hae))))} + (|wire74[(2'h2):(1'h0)])))
            begin
              reg96 <= reg75;
              reg97 <= reg94[(3'h6):(1'h1)];
              reg98 <= (~|wire80[(4'hf):(4'h8)]);
              reg99 <= reg85;
            end
          else
            begin
              reg96 <= reg87;
              reg97 <= {reg99[(2'h2):(2'h2)], wire79[(3'h6):(1'h1)]};
              reg98 <= ((^reg82[(5'h10):(4'ha)]) | (~&{$unsigned($signed(reg83))}));
              reg99 <= $unsigned(wire73[(3'h6):(3'h5)]);
            end
          if ((^wire80))
            begin
              reg100 <= ($signed((($signed(reg94) ?
                  $unsigned(wire71) : reg99[(1'h1):(1'h0)]) >>> ((wire77 ~^ reg88) && (^~(8'ha0))))) <= $unsigned((-((8'ha1) ?
                  reg97 : (~reg82)))));
              reg101 <= reg93[(5'h10):(3'h6)];
              reg102 <= (reg88 & (reg75 ?
                  {({reg87} ? reg85[(2'h2):(2'h2)] : reg92),
                      ($unsigned(wire74) ?
                          $signed(reg84) : $signed(reg98))} : ((-(~^reg86)) ?
                      ((reg87 ?
                          reg96 : reg96) - (+reg98)) : ((~^wire79) - $unsigned(wire78)))));
            end
          else
            begin
              reg100 <= $unsigned(wire79);
              reg101 <= $signed((8'ha7));
              reg102 <= ((~{$unsigned((reg99 && reg82))}) <<< ($unsigned(((-reg84) ?
                  $signed(reg82) : (reg76 == reg102))) <<< wire80[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg90 <= reg93;
          reg91 <= ($unsigned($unsigned(($signed(wire74) < $signed(wire72)))) ?
              reg102 : reg76[(2'h3):(1'h1)]);
          reg92 <= $signed($unsigned(wire72[(1'h1):(1'h0)]));
          reg93 <= wire78;
          reg94 <= reg100;
        end
      reg103 <= wire80;
    end
  assign wire104 = $signed((&reg90));
endmodule

module module52
#(parameter param66 = ((^~{((^~(8'h9d)) + ((7'h42) - (8'hbd)))}) ? (~(~^({(7'h44), (8'hb5)} ? {(8'ha7)} : ((8'ha1) ? (8'h9c) : (7'h41))))) : (^(((~|(8'hae)) ? (~&(8'ha0)) : ((8'hb5) ? (8'hac) : (8'hb2))) ? ({(8'had)} ? (~&(8'hb6)) : ((8'hb9) ? (8'hb3) : (8'hb4))) : (8'hae)))), 
parameter param67 = (((param66 > ((param66 ? (8'hb1) : param66) ? (param66 ? param66 : param66) : {param66, param66})) ^ (~(8'hb6))) <= (8'hbb)))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire57;
  input wire signed [(4'hb):(1'h0)] wire56;
  input wire [(4'ha):(1'h0)] wire55;
  input wire [(4'h9):(1'h0)] wire54;
  input wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire58 = {wire56[(4'ha):(3'h7)]};
  assign wire59 = $signed($unsigned($signed((((8'hbc) && wire56) ?
                      $signed(wire54) : (wire55 * wire57)))));
  assign wire60 = ((+wire57[(3'h6):(2'h3)]) ?
                      wire55[(4'h8):(3'h6)] : {{((wire54 ?
                                  wire54 : wire55) >= (wire58 ?
                                  wire53 : wire53)),
                              {wire53[(4'ha):(2'h2)]}},
                          ((wire54[(3'h5):(1'h1)] ^~ (wire58 ?
                                  wire55 : wire56)) ?
                              ({(8'hb7)} ?
                                  $signed(wire57) : (wire56 != wire55)) : wire55[(4'ha):(3'h6)])});
  assign wire61 = wire54[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg62 <= wire54[(3'h4):(2'h2)];
      reg63 <= ($signed(wire59[(3'h5):(2'h3)]) ? wire58 : wire61);
      reg64 <= (wire55 ~^ (((wire61[(2'h3):(1'h0)] ?
          $signed(reg63) : wire55[(1'h1):(1'h1)]) & $unsigned((^~wire60))) - {wire57[(3'h7):(3'h7)],
          wire57[(2'h3):(1'h1)]}));
      reg65 <= wire56;
    end
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire29;
  input wire [(3'h4):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg40,
                 reg39,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= $unsigned(((wire30 ^~ wire29) ?
          (wire30 ?
              $unsigned((^(8'hb7))) : (~^(^~wire28))) : $signed(wire29[(2'h3):(2'h2)])));
    end
  assign wire33 = (~&$signed((wire30 ?
                      $unsigned((+wire31)) : $signed((^~wire29)))));
  assign wire34 = $signed($signed((!(reg32[(4'hb):(3'h4)] > (wire30 != wire29)))));
  assign wire35 = $unsigned(wire30);
  assign wire36 = $signed((wire35[(4'h9):(4'h8)] ?
                      $signed($signed((8'hb8))) : wire34));
  assign wire37 = $unsigned({reg32[(1'h1):(1'h0)]});
  assign wire38 = (&wire29[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg39 <= ($unsigned(wire37[(3'h6):(2'h3)]) ?
          $unsigned(($unsigned((wire35 < wire35)) >> wire34[(2'h2):(2'h2)])) : (wire35 | wire29));
      reg40 <= (wire37 | $signed(reg39));
    end
  assign wire41 = ($unsigned(reg32[(4'ha):(2'h3)]) << (reg39 <= $signed(wire28[(1'h0):(1'h0)])));
  assign wire42 = $unsigned((reg39[(4'ha):(4'ha)] ?
                      wire36[(4'hc):(3'h4)] : ({$unsigned(wire30)} ?
                          wire29 : wire31[(4'hb):(3'h5)])));
  assign wire43 = wire36;
  assign wire44 = {$signed($signed((~^(~(8'hb1))))),
                      $unsigned((~|{wire37[(3'h5):(1'h0)]}))};
  assign wire45 = wire41[(4'h8):(1'h1)];
  assign wire46 = reg39[(5'h11):(3'h7)];
  assign wire47 = $signed({($unsigned(wire29[(1'h1):(1'h1)]) & ((wire38 ?
                              wire37 : reg32) ?
                          $signed((8'hba)) : (wire34 ? wire41 : (8'hac)))),
                      (wire31[(2'h3):(2'h3)] >> (7'h42))});
  assign wire48 = (((|reg32) << wire43) && wire44);
  assign wire49 = $signed(wire36);
endmodule
