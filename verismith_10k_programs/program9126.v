module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire156;
  wire signed [(3'h6):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire154;
  wire [(3'h6):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire138;
  wire signed [(3'h4):(1'h0)] wire152;
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire134,
                 wire5,
                 wire6,
                 wire7,
                 wire12,
                 wire13,
                 wire14,
                 wire69,
                 wire136,
                 wire137,
                 wire138,
                 wire152,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire5 = ($signed($unsigned($signed((~^wire0)))) ?
                     {(!((~wire3) ? $unsigned(wire2) : wire1)),
                         ((wire2[(4'hb):(2'h3)] ?
                             {wire4} : wire4[(3'h6):(1'h0)]) >= $signed($signed(wire3)))} : {(((8'ha7) ?
                             wire0 : {wire0, wire1}) >>> (wire4 ?
                             wire3 : (wire0 ? wire0 : (8'had))))});
  assign wire6 = (((^~$unsigned((~&wire0))) ?
                     ({(~^(8'hbd)), wire1[(3'h4):(1'h1)]} ?
                         $unsigned((!(7'h44))) : (~^(wire3 < wire1))) : (wire1 ^~ ({wire3} >>> (^wire2)))) && ({$unsigned(wire3),
                     $unsigned($unsigned(wire3))} <= wire4[(1'h0):(1'h0)]));
  assign wire7 = (wire0[(4'hb):(1'h1)] <<< wire3[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg8 <= wire1[(4'h9):(4'h9)];
      reg9 <= $unsigned({(($unsigned(wire5) ?
              $signed(wire1) : wire7[(5'h10):(3'h7)]) <= $signed(((8'ha3) ?
              wire2 : wire2))),
          (($signed((8'had)) ? reg8[(5'h10):(1'h0)] : (reg8 ^ wire5)) ?
              (!$signed(wire3)) : wire2[(2'h3):(2'h3)])});
      reg10 <= $unsigned(wire4);
      reg11 <= (&{(+((wire7 ? reg10 : wire0) ? (~&wire7) : (8'hb4)))});
    end
  assign wire12 = reg11;
  assign wire13 = $unsigned((wire5[(1'h0):(1'h0)] ?
                      (((wire12 ? wire12 : reg10) ? wire7 : (reg9 <= wire6)) ?
                          $unsigned((~^reg8)) : ({reg8} && (reg11 ?
                              reg10 : wire6))) : ($unsigned($unsigned(reg8)) - (^$unsigned(wire6)))));
  assign wire14 = $unsigned($unsigned(wire4[(3'h5):(1'h0)]));
  module15 #() modinst70 (wire69, clk, reg11, wire1, reg10, wire6, wire14);
  module71 #() modinst135 (wire134, clk, wire0, wire7, wire12, wire6, wire69);
  assign wire136 = reg11;
  assign wire137 = (~wire136);
  assign wire138 = $unsigned($unsigned($signed((~|(^wire12)))));
  module139 #() modinst153 (.wire140(reg9), .wire142(wire12), .y(wire152), .clk(clk), .wire143(wire5), .wire141(wire6));
  assign wire154 = wire13[(1'h1):(1'h0)];
  assign wire155 = (wire2 ?
                       reg9[(3'h6):(2'h2)] : $signed((-(+$signed(wire3)))));
  assign wire156 = ($unsigned((wire12 - ((~^wire0) ?
                       (wire154 == wire138) : wire6[(2'h3):(1'h0)]))) > wire3[(3'h4):(1'h1)]);
endmodule

module module139
#(parameter param150 = (({({(8'hb0), (8'ha3)} > {(8'ha2)})} ? (({(8'h9f)} ? {(8'h9e), (8'ha0)} : {(8'ha3)}) ? {((8'hbe) ? (7'h44) : (7'h43))} : (((8'hb5) <= (7'h40)) || (^(8'had)))) : ((^~((7'h41) << (7'h42))) >= (((8'hab) < (8'h9f)) ? ((8'hb1) && (8'hb4)) : (|(8'hb3))))) - ((~^(~{(8'hb3)})) ? ((~^(^(8'hb5))) ? (~((7'h43) <<< (8'hbe))) : (&((7'h42) <<< (7'h40)))) : {((~^(8'haa)) ^~ ((8'hab) ? (8'ha6) : (8'hab))), {(8'hb8), ((7'h40) >= (8'ha3))}})), 
parameter param151 = param150)
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire143;
  input wire signed [(5'h10):(1'h0)] wire142;
  input wire signed [(4'hd):(1'h0)] wire141;
  input wire signed [(4'h8):(1'h0)] wire140;
  wire [(5'h10):(1'h0)] wire147;
  wire signed [(4'h8):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire145;
  wire signed [(4'hf):(1'h0)] wire144;
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  assign y = {wire147, wire146, wire145, wire144, reg149, reg148, (1'h0)};
  assign wire144 = $signed($signed($unsigned((^$signed(wire142)))));
  assign wire145 = $unsigned((~&wire141));
  assign wire146 = $unsigned((wire145 == $signed(($unsigned((8'hb1)) ?
                       $signed(wire143) : {wire144, wire143}))));
  assign wire147 = $signed($unsigned((~|((wire141 - wire143) ?
                       (-(8'ha8)) : wire144[(4'hd):(2'h2)]))));
  always
    @(posedge clk) begin
      reg148 <= (wire141[(4'hd):(4'ha)] & (wire144[(1'h1):(1'h0)] ?
          wire144[(1'h0):(1'h0)] : ({{wire143}} ^ $signed($signed((8'ha8))))));
      if (wire147)
        begin
          reg149 <= (wire140[(2'h3):(1'h0)] >> $signed((wire147[(1'h1):(1'h0)] >>> wire140[(2'h2):(1'h1)])));
        end
      else
        begin
          reg149 <= wire143;
        end
    end
endmodule

module module71  (y, clk, wire72, wire73, wire74, wire75, wire76);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire72;
  input wire [(3'h4):(1'h0)] wire73;
  input wire signed [(4'ha):(1'h0)] wire74;
  input wire [(4'hc):(1'h0)] wire75;
  input wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire124;
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire128,
                 wire127,
                 wire126,
                 wire77,
                 wire78,
                 wire80,
                 wire81,
                 wire124,
                 reg130,
                 reg129,
                 reg79,
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
                 (1'h0)};
  assign wire77 = $unsigned($signed(wire72[(1'h0):(1'h0)]));
  assign wire78 = $signed(wire73);
  always
    @(posedge clk) begin
      reg79 <= (&$signed(wire75[(3'h7):(3'h6)]));
    end
  assign wire80 = wire76;
  assign wire81 = wire80[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg82 <= ((7'h41) ? wire74[(1'h1):(1'h0)] : wire76);
      if ((((!wire76[(4'hd):(1'h1)]) ?
          $unsigned(wire77[(4'he):(3'h6)]) : wire75[(2'h3):(2'h3)]) > reg79))
        begin
          reg83 <= wire80;
          if ($signed(({$signed($unsigned(wire76))} != $unsigned((!$signed(reg83))))))
            begin
              reg84 <= ((((-(^~wire78)) ?
                      wire75 : wire73[(2'h3):(2'h3)]) ^ wire72[(1'h1):(1'h1)]) ?
                  wire75[(3'h7):(1'h0)] : wire78);
              reg85 <= reg84[(4'hd):(1'h1)];
            end
          else
            begin
              reg84 <= wire72[(3'h6):(2'h3)];
              reg85 <= (-$signed(($signed($signed(wire78)) ~^ reg79[(4'hc):(2'h2)])));
              reg86 <= {wire74[(4'h8):(3'h6)]};
            end
          reg87 <= $signed($unsigned($signed((wire76[(4'hd):(4'hd)] ?
              {(8'hba), wire77} : wire81))));
          if (((8'hb1) ?
              (wire72[(4'ha):(4'h9)] ?
                  (!(wire73[(3'h4):(2'h3)] + $unsigned(wire74))) : reg79[(3'h4):(3'h4)]) : (!(^((8'haf) | (wire80 ?
                  wire74 : wire78))))))
            begin
              reg88 <= (^wire76);
            end
          else
            begin
              reg88 <= (^wire75);
            end
          if ($unsigned($unsigned(((+wire72[(2'h3):(2'h3)]) ^ reg83))))
            begin
              reg89 <= $signed($unsigned({{$signed((8'ha4)),
                      reg85[(1'h1):(1'h0)]},
                  {$signed(reg82), reg84}}));
              reg90 <= ((|((!(&reg79)) >= $unsigned((8'hb2)))) <<< reg89);
              reg91 <= (^(wire76 ^ wire75[(4'h9):(3'h7)]));
              reg92 <= {($signed($unsigned(reg84)) ?
                      wire80[(2'h3):(2'h3)] : (+$unsigned($signed(reg83))))};
              reg93 <= wire73[(1'h0):(1'h0)];
            end
          else
            begin
              reg89 <= ($unsigned(reg88) <<< (((reg92 * $unsigned(reg84)) | ((-reg93) ?
                      ((8'ha8) ? reg89 : reg89) : $signed(reg92))) ?
                  (wire73[(2'h2):(1'h0)] - $signed($signed(reg83))) : (!(8'h9f))));
              reg90 <= wire77[(4'hd):(4'ha)];
              reg91 <= {(8'hba)};
            end
        end
      else
        begin
          if (wire74[(4'h9):(2'h3)])
            begin
              reg83 <= wire81;
              reg84 <= ($unsigned(reg83) & (8'hb9));
              reg85 <= (8'ha1);
              reg86 <= (-$unsigned(((-(-wire77)) ?
                  wire80 : ($unsigned(reg91) & {reg87, reg90}))));
              reg87 <= wire80;
            end
          else
            begin
              reg83 <= {$unsigned({reg91})};
              reg84 <= $unsigned((wire81[(4'h9):(3'h7)] ?
                  ((reg87 && {wire76,
                      reg88}) + wire72[(4'h9):(4'h9)]) : $unsigned(wire77)));
              reg85 <= wire77[(3'h7):(1'h1)];
            end
          reg88 <= {$unsigned(((+$unsigned((8'hbc))) ?
                  {(~^reg82)} : {(^reg89)}))};
        end
      reg94 <= (($unsigned($signed((~&(8'ha8)))) < (8'hb4)) != (($unsigned({reg90,
              reg79}) ?
          reg90 : wire76[(3'h6):(1'h1)]) + {{$signed(reg84), wire81}}));
      reg95 <= ((8'hb4) < $unsigned(reg93));
      reg96 <= (wire78 ?
          ({(~^$signed((8'haf)))} <= reg85) : (~&$signed(reg85)));
    end
  module97 #() modinst125 (.clk(clk), .wire101(wire75), .wire98(wire80), .wire100(reg88), .wire99(wire76), .y(wire124));
  assign wire126 = reg84[(4'h9):(4'h9)];
  assign wire127 = $unsigned($unsigned(reg89));
  assign wire128 = reg90;
  always
    @(posedge clk) begin
      reg129 <= (8'ha9);
      reg130 <= wire78[(5'h10):(3'h6)];
    end
  assign wire131 = {{wire80[(3'h5):(2'h3)]},
                       ($signed((+wire81)) < ($signed((~|wire74)) ?
                           ($unsigned(wire72) ?
                               {wire75, reg96} : $signed(reg91)) : wire78))};
  assign wire132 = (~|$unsigned($signed(($signed(reg87) ?
                       (reg96 <= reg91) : {reg95, reg86}))));
  assign wire133 = $signed(wire77);
endmodule

module module15
#(parameter param67 = (~&{(~^(((8'hbe) ~^ (8'hab)) & (~&(8'hb2)))), (({(8'hb2)} ? (!(8'hb2)) : ((8'ha4) == (8'hbf))) ? (|{(8'hbd)}) : (~^((7'h42) ? (8'h9e) : (8'hbc))))}), 
parameter param68 = param67)
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire58,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire21 = wire18[(3'h4):(2'h2)];
  assign wire22 = $unsigned({wire21, wire17[(3'h4):(1'h0)]});
  assign wire23 = $signed((+wire17));
  assign wire24 = wire17[(1'h0):(1'h0)];
  module25 #() modinst59 (wire58, clk, wire16, wire18, wire23, wire19);
  assign wire60 = wire16;
  assign wire61 = wire23[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg62 <= $unsigned($unsigned($unsigned(((wire19 | wire18) > $signed(wire24)))));
      reg63 <= $signed($unsigned($signed($signed(wire16[(3'h5):(3'h5)]))));
      reg64 <= $signed((8'h9d));
      reg65 <= (wire19[(3'h6):(2'h2)] ~^ (!$unsigned($signed({reg63, reg62}))));
      reg66 <= $unsigned(reg63);
    end
endmodule

module module25
#(parameter param57 = ({(-(((8'hbf) ^~ (7'h40)) < ((7'h43) && (8'hb9)))), (&((+(8'hb0)) ? {(8'hb5), (8'ha7)} : ((8'h9f) > (8'hbe))))} ? ((&(8'ha8)) ? (+({(8'hb6)} * {(8'h9e), (8'hbc)})) : (((~&(8'hbe)) >>> ((8'hb1) ? (8'hae) : (8'ha2))) <<< (!((8'hbf) << (8'hbd))))) : (8'hb1)))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire29;
  input wire [(3'h5):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg56,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire30 = $unsigned(($unsigned($unsigned({wire27, (8'hb9)})) ?
                      (&(wire28 <= wire28)) : $signed((8'hb3))));
  assign wire31 = ({(|((wire28 ? (7'h40) : wire30) ?
                          $unsigned(wire26) : (|wire30))),
                      wire26} < (((&wire27[(1'h1):(1'h0)]) ?
                      (~&(!wire26)) : $signed((wire28 ?
                          wire29 : wire26))) ~^ (wire28[(3'h4):(2'h3)] ?
                      wire28[(3'h4):(3'h4)] : wire29[(4'hf):(4'he)])));
  assign wire32 = ((wire29 ?
                          (!(~^$unsigned(wire28))) : $unsigned(((wire26 ~^ (8'h9e)) ?
                              $unsigned(wire27) : $unsigned(wire27)))) ?
                      $signed(wire26) : wire27[(4'ha):(4'h9)]);
  assign wire33 = wire27[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg34 <= $signed(wire33[(3'h4):(1'h1)]);
      reg35 <= ((!{($unsigned(wire33) - (wire33 ? wire32 : reg34))}) ?
          $signed((~^(wire31 ?
              {wire27} : $unsigned((8'hb4))))) : {(($unsigned(wire26) ?
                  $unsigned((8'ha0)) : {wire28}) & $signed(wire32))});
    end
  assign wire36 = ((((~|reg34) ?
                      $unsigned(wire33) : {(wire26 ?
                              (8'ha7) : wire28)}) <<< wire26) - $unsigned(($unsigned($unsigned(wire31)) || {$unsigned(reg34),
                      (^wire26)})));
  always
    @(posedge clk) begin
      reg37 <= (wire26[(2'h3):(1'h1)] ?
          reg35[(3'h5):(2'h3)] : $signed(((^{wire26}) >>> ((reg35 == wire28) ?
              {wire32} : (wire29 & reg34)))));
      reg38 <= $signed(((|(^~((8'hb8) ? reg34 : wire27))) ?
          wire30 : {($unsigned((8'haa)) - $signed(reg35))}));
      if (wire31[(1'h0):(1'h0)])
        begin
          reg39 <= (^((8'ha0) ~^ (8'hb4)));
          reg40 <= (reg35 && (~^$unsigned(wire28[(2'h2):(1'h0)])));
        end
      else
        begin
          reg39 <= (^~$signed((+((reg37 ? reg35 : wire33) ^ (~wire28)))));
          if ({wire28})
            begin
              reg40 <= {$signed(wire29)};
              reg41 <= (&{($unsigned($unsigned(wire29)) & (&(&reg34)))});
              reg42 <= {(8'hab),
                  $unsigned(($unsigned(reg35[(3'h6):(2'h3)]) ~^ $unsigned(wire31[(3'h5):(3'h5)])))};
              reg43 <= (|$unsigned($unsigned($signed((wire33 * reg41)))));
              reg44 <= reg34;
            end
          else
            begin
              reg40 <= ((reg44[(1'h1):(1'h1)] + {(reg38 && wire33)}) && $signed($unsigned($signed(reg43[(3'h6):(1'h0)]))));
              reg41 <= {($signed($unsigned((+reg34))) ^ reg39[(2'h3):(1'h0)])};
            end
          reg45 <= $signed((wire30[(1'h1):(1'h0)] ?
              $signed(({wire36, reg41} ?
                  $signed(wire28) : (|wire32))) : (reg43[(2'h3):(2'h2)] ?
                  (~(reg39 ? wire28 : wire28)) : $signed({wire32}))));
        end
    end
  assign wire46 = $signed((reg39[(1'h0):(1'h0)] - {$unsigned(((8'ha2) ?
                          reg40 : (8'ha3)))}));
  assign wire47 = ((reg34 ?
                      (wire36 > {((7'h41) ?
                              reg35 : reg42)}) : $unsigned(wire31[(2'h2):(1'h1)])) >>> ((8'hac) > ({wire26} ?
                      (reg40 != (reg42 ?
                          wire31 : reg34)) : (reg43 == (&wire27)))));
  assign wire48 = wire46[(2'h2):(2'h2)];
  assign wire49 = $signed({$unsigned(($signed(reg44) ^~ {wire27, wire33}))});
  assign wire50 = {wire36, $unsigned($unsigned(reg42))};
  assign wire51 = $signed(((+(~&reg34[(3'h7):(2'h3)])) ?
                      wire49 : ($signed($signed(reg38)) ?
                          (~(reg42 ?
                              reg40 : wire28)) : wire29[(5'h12):(3'h5)])));
  assign wire52 = $signed($signed((reg45 ?
                      (-$signed((8'had))) : ((reg43 != (8'ha2)) - wire32))));
  assign wire53 = (wire31 ? wire28 : wire30);
  assign wire54 = (8'ha2);
  assign wire55 = $signed(((($unsigned(reg44) ?
                          (wire26 <= wire28) : (reg41 >> reg37)) ?
                      wire52 : reg37) >> wire54[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg56 <= reg45[(1'h0):(1'h0)];
    end
endmodule

module module97
#(parameter param122 = (~&({(((8'had) ? (8'ha9) : (8'hb7)) ? {(8'ha7)} : (^(8'h9e))), (^((8'hb2) ? (8'hb0) : (8'ha2)))} || (((^(8'ha3)) >= {(7'h41)}) ? (~&((8'hb1) >= (8'hba))) : ((^~(8'ha6)) & ((8'hb4) || (7'h43)))))), 
parameter param123 = {(8'hb6)})
(y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire101;
  input wire [(5'h12):(1'h0)] wire100;
  input wire [(3'h5):(1'h0)] wire99;
  input wire [(3'h5):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire102 = wire101[(2'h3):(1'h1)];
  assign wire103 = ($unsigned($unsigned($unsigned((wire100 >> wire99)))) >>> $signed({$signed($signed(wire100))}));
  assign wire104 = (wire100 ?
                       wire100 : ($signed(wire102[(3'h5):(1'h1)]) ?
                           ({$unsigned(wire99), (wire100 ? (7'h44) : (8'hb7))} ?
                               (&(wire102 && wire98)) : (-$unsigned(wire99))) : (^$unsigned(wire99))));
  assign wire105 = $signed(((~^wire99[(3'h5):(3'h5)]) == $signed(({wire99,
                           wire104} ?
                       $unsigned(wire103) : $signed(wire100)))));
  assign wire106 = $signed($signed(wire105[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      if (($unsigned((($unsigned((8'h9f)) ?
          {wire105,
              wire98} : (wire102 - wire103)) <= wire105[(3'h5):(1'h1)])) + wire102))
        begin
          reg107 <= $unsigned($unsigned(wire99[(3'h4):(2'h3)]));
        end
      else
        begin
          reg107 <= wire105;
          if ((|wire105))
            begin
              reg108 <= (~|{$signed($unsigned(wire105[(4'hb):(4'h9)]))});
              reg109 <= ($unsigned(wire98[(1'h0):(1'h0)]) ?
                  ({wire106, (~(wire100 ? wire103 : wire100))} ?
                      (wire106[(4'he):(4'hd)] ?
                          wire104[(2'h3):(2'h2)] : $unsigned(wire100[(4'ha):(3'h6)])) : (reg108[(3'h5):(2'h3)] << wire104)) : (wire104 ?
                      ({(+wire104),
                          wire100} < (~$signed(wire102))) : $unsigned((wire99[(2'h3):(1'h0)] == wire100))));
              reg110 <= ({$signed(((^~wire104) != (&(8'hba))))} ?
                  $signed($signed(((^wire102) ?
                      $unsigned(wire102) : (wire99 > wire103)))) : (&(reg108 ?
                      $unsigned($unsigned(wire103)) : $signed((wire103 ?
                          wire105 : reg107)))));
              reg111 <= $unsigned(((($unsigned(reg108) * reg108) ?
                  ($unsigned(wire98) ?
                      wire101[(1'h0):(1'h0)] : (8'h9e)) : {$signed(reg107)}) && wire105));
            end
          else
            begin
              reg108 <= reg108[(4'hf):(1'h1)];
              reg109 <= (|$signed(wire101));
              reg110 <= ((((^~wire99[(1'h1):(1'h1)]) ^ wire103[(2'h3):(1'h1)]) | (((&reg108) && (reg108 <= wire98)) ?
                  reg108 : {wire101[(1'h1):(1'h1)]})) <= (8'hb5));
              reg111 <= (wire99 ?
                  (((+reg111[(5'h14):(4'hb)]) + (wire106 ?
                          (wire103 || wire99) : (wire104 == reg108))) ?
                      (^~({wire103} ?
                          wire99[(3'h4):(1'h0)] : (wire103 <= wire100))) : wire106) : wire103);
            end
          reg112 <= $unsigned(wire103);
          reg113 <= {(|(($signed(reg110) ^~ {wire100, reg112}) ?
                  wire99 : ((wire99 ? reg111 : wire98) & (wire100 ?
                      (8'ha0) : wire99)))),
              (^~$unsigned(wire101))};
          reg114 <= (^{({(reg107 ? reg113 : (8'hbb)),
                  (reg111 ? (8'ha6) : wire103)} >= reg113)});
        end
      reg115 <= reg109[(4'he):(2'h3)];
      reg116 <= ((reg115 ? (8'ha7) : wire101) >> $signed({reg108}));
      reg117 <= {$unsigned(wire105)};
    end
  assign wire118 = ((&$signed(reg113)) <<< reg107[(1'h1):(1'h1)]);
  assign wire119 = wire98;
  assign wire120 = $unsigned(($signed(($signed(reg108) != wire118[(2'h3):(1'h0)])) >= $signed(wire106)));
  assign wire121 = (wire101 ~^ ((wire118[(1'h0):(1'h0)] <<< wire101[(2'h2):(1'h0)]) <= {(-$signed(reg111))}));
endmodule
