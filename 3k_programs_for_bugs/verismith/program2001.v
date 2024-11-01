module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire124;
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  assign y = {wire141,
                 wire5,
                 wire14,
                 wire15,
                 wire39,
                 wire41,
                 wire42,
                 wire124,
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
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = {$unsigned((wire0 ?
                         ((wire1 ? wire1 : wire4) ?
                             $unsigned(wire3) : $unsigned(wire1)) : wire4)),
                     wire0[(3'h5):(2'h2)]};
  always
    @(posedge clk) begin
      reg6 <= (wire5 ?
          ((-((wire4 ? wire3 : (8'hb5)) ?
              $unsigned((8'ha9)) : $unsigned(wire4))) >> (wire2 ?
              wire0 : wire0)) : {wire4, wire3});
      reg7 <= $signed($unsigned(reg6));
      if ($unsigned((($unsigned((wire5 ~^ (8'ha6))) ?
              ((~wire0) ? wire5 : (wire3 - (8'hba))) : {$signed(wire4)}) ?
          $signed(reg6) : (~|$unsigned({wire5, reg7})))))
        begin
          if ($unsigned($signed(wire2[(1'h0):(1'h0)])))
            begin
              reg8 <= reg6;
              reg9 <= reg8[(1'h1):(1'h0)];
              reg10 <= ($unsigned($unsigned({(~^wire1), $signed((8'hac))})) ?
                  $unsigned(wire3[(4'ha):(4'h9)]) : reg7);
              reg11 <= (8'hac);
            end
          else
            begin
              reg8 <= $signed(($unsigned((reg6 ? reg6 : wire4[(3'h6):(1'h0)])) ?
                  $signed((reg7 != (reg11 ? wire0 : reg9))) : {((wire4 ?
                              reg7 : reg11) ?
                          (-(8'hb9)) : wire0),
                      reg8}));
              reg9 <= (8'hb4);
              reg10 <= $signed(((((+(8'hab)) ^~ reg11[(3'h6):(3'h4)]) ?
                  (~&(reg11 ?
                      reg10 : reg9)) : (reg7 > $unsigned(wire3))) || $unsigned({{reg9,
                      reg11}})));
              reg11 <= (reg10[(1'h0):(1'h0)] ?
                  (|wire2) : (($unsigned(((8'had) > wire0)) != (&$signed(wire0))) ?
                      ((wire4[(4'h8):(3'h7)] ? (wire1 >> reg11) : {reg9}) ?
                          $signed($signed(wire3)) : $signed(wire1)) : wire1[(1'h0):(1'h0)]));
              reg12 <= {(^~$signed(reg9[(4'he):(4'hb)])),
                  ($unsigned((wire4 == (+(8'hbf)))) ?
                      (($signed(wire5) ?
                          $signed(reg10) : $signed(wire5)) << ($unsigned(reg6) ?
                          (-(8'hae)) : (wire1 || reg11))) : (8'hbb))};
            end
          reg13 <= $signed(reg9);
        end
      else
        begin
          if ($unsigned($signed($signed($unsigned(wire3[(4'he):(4'he)])))))
            begin
              reg8 <= reg11[(1'h1):(1'h1)];
              reg9 <= wire1;
              reg10 <= reg10[(2'h2):(1'h1)];
            end
          else
            begin
              reg8 <= reg11;
              reg9 <= ((((&wire3[(4'he):(2'h3)]) ^ {reg7,
                  (wire5 <<< reg13)}) <= {((wire0 + wire5) ?
                      (8'hb9) : (reg11 != wire3))}) <<< $unsigned((~|reg10)));
              reg10 <= $unsigned(reg6[(4'ha):(1'h1)]);
            end
          if (reg7[(3'h6):(3'h5)])
            begin
              reg11 <= $unsigned($unsigned((|{wire1[(1'h1):(1'h0)], wire0})));
              reg12 <= ((~|{(~|wire1[(2'h2):(1'h1)])}) ?
                  ($unsigned(((wire1 == reg7) ?
                      (~&reg8) : (wire4 << reg12))) << {$signed($signed(reg11))}) : reg6[(5'h10):(4'ha)]);
            end
          else
            begin
              reg11 <= ((+($unsigned((reg10 >= reg10)) <<< $unsigned((+reg9)))) << wire5);
              reg12 <= reg9[(4'h9):(2'h3)];
            end
          reg13 <= (-$signed((reg8 ?
              reg6[(4'hf):(3'h7)] : ($signed(reg9) ? $signed(wire0) : reg11))));
        end
    end
  assign wire14 = (^$unsigned(($unsigned((wire5 ?
                      reg9 : wire0)) ^ wire3[(5'h10):(2'h2)])));
  assign wire15 = (((wire0 & reg11) ?
                          $signed(((reg11 ? wire4 : reg13) ?
                              reg10[(1'h1):(1'h1)] : (~&wire0))) : {wire4[(4'hc):(2'h3)],
                              $unsigned($unsigned(reg11))}) ?
                      ($unsigned($unsigned(wire0[(3'h4):(1'h1)])) ?
                          (8'hbd) : reg7[(1'h1):(1'h1)]) : wire3[(5'h10):(3'h7)]);
  module16 #() modinst40 (wire39, clk, wire14, reg6, wire15, wire4, wire3);
  assign wire41 = reg9[(4'hf):(4'hb)];
  assign wire42 = $unsigned($unsigned(wire2[(3'h6):(1'h1)]));
  module43 #() modinst125 (wire124, clk, wire0, wire5, reg10, reg6, wire3);
  always
    @(posedge clk) begin
      reg126 <= $signed($signed(wire14[(3'h5):(1'h0)]));
      if (({($unsigned($signed(reg12)) ?
              (((8'ha5) == wire1) ?
                  {(8'haa)} : (wire2 ? (8'hb3) : wire15)) : $signed((reg8 ?
                  wire3 : reg10))),
          ($unsigned($unsigned(wire5)) ?
              (wire3[(5'h13):(4'hc)] < {reg12}) : (+$signed(reg13)))} ^~ {wire15}))
        begin
          reg127 <= {(^$signed($unsigned(wire39[(1'h1):(1'h0)])))};
        end
      else
        begin
          reg127 <= $signed((!((^reg13) >>> reg12[(2'h3):(1'h0)])));
          reg128 <= ($unsigned((({reg127} - $unsigned(reg13)) > (~reg127[(3'h7):(2'h2)]))) ?
              (+(~^{$signed((8'hba))})) : reg10);
          reg129 <= (|$signed($unsigned({reg127, $signed((8'hb9))})));
          if ((~&wire0))
            begin
              reg130 <= $unsigned(reg8[(1'h0):(1'h0)]);
              reg131 <= (!reg129[(3'h6):(3'h6)]);
              reg132 <= $signed((^~$unsigned((8'hb4))));
              reg133 <= (wire39 | {reg130});
              reg134 <= $unsigned((~&{wire15, reg130[(3'h7):(2'h3)]}));
            end
          else
            begin
              reg130 <= $signed(wire124);
              reg131 <= $signed(($signed($signed((wire124 ^~ (8'hbd)))) - wire5[(4'hc):(3'h6)]));
              reg132 <= wire39;
              reg133 <= $unsigned({(~$signed(wire42[(3'h4):(1'h1)]))});
            end
          reg135 <= $unsigned($unsigned({$unsigned($signed(wire1))}));
        end
      reg136 <= reg135[(3'h5):(2'h3)];
      if ({reg128[(3'h4):(3'h4)]})
        begin
          reg137 <= wire4;
          reg138 <= $signed(reg133);
          reg139 <= {(!$unsigned((-((8'haa) ? wire5 : reg138)))), reg126};
          reg140 <= (^~{(-$unsigned(((8'ha9) ? reg8 : reg10)))});
        end
      else
        begin
          reg137 <= (^$unsigned($unsigned($unsigned($signed((8'hb5))))));
          reg138 <= $signed(reg126);
        end
    end
  assign wire141 = reg134;
endmodule

module module43
#(parameter param122 = ((((~|{(8'ha5)}) ? ({(8'hb3)} ? ((8'ha0) ? (7'h43) : (7'h41)) : (&(8'hac))) : ({(8'ha5)} ? ((8'hab) ? (8'hb6) : (8'hb1)) : ((8'hb5) ? (8'had) : (7'h44)))) ? ((((8'haf) > (8'hb5)) + (8'ha7)) ? (((8'h9e) ^~ (8'ha6)) != (|(8'ha3))) : (((8'ha4) - (8'ha2)) <= {(8'ha2), (8'h9c)})) : ((-{(8'hbe)}) ^~ (((8'ha0) >> (8'ha0)) ? ((8'ha4) ? (8'hbd) : (8'hbb)) : (~&(8'hb9))))) | ((&(((8'hb3) - (8'hae)) != (^(8'hb9)))) > ({((8'hb2) == (8'hb4))} & ((|(8'hbc)) ? (~^(8'hb1)) : (~&(8'ha0)))))), 
parameter param123 = (+{(param122 ? (param122 ? (param122 + param122) : param122) : {param122, param122})}))
(y, clk, wire44, wire45, wire46, wire47, wire48);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire [(5'h13):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire46;
  input wire [(3'h7):(1'h0)] wire47;
  input wire signed [(5'h15):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire119;
  assign y = {wire121, wire49, wire50, wire119, (1'h0)};
  assign wire49 = (((wire44[(1'h1):(1'h1)] < $signed((wire45 ?
                      wire44 : wire46))) <= $signed((wire47 ?
                      $signed((8'hbd)) : $unsigned(wire47)))) <= $unsigned($unsigned(($signed(wire48) ?
                      wire47 : ((8'hb5) ? wire47 : wire47)))));
  assign wire50 = ({{wire44[(1'h0):(1'h0)],
                          $signed((-wire45))}} ~^ (-($unsigned((!wire45)) | wire49[(1'h1):(1'h0)])));
  module51 #() modinst120 (wire119, clk, wire49, wire50, wire47, wire45, wire44);
  assign wire121 = (~^$signed(wire46));
endmodule

module module16
#(parameter param37 = (((~((~|(8'haa)) > (~&(8'hae)))) ? ({((8'had) >>> (8'hb9)), {(8'hb3)}} ^ (((8'hbb) ^~ (8'hbb)) < (8'ha8))) : {(((7'h41) << (8'haf)) ^ (~(8'haf))), (((8'hbd) >= (8'ha6)) ? ((8'hb1) ~^ (8'hbe)) : (~|(8'haa)))}) >> (~&((~^(^(8'ha5))) ? ({(7'h43)} ? {(8'hbc), (7'h44)} : (|(8'hb9))) : (~|((8'ha2) ? (8'had) : (7'h42)))))), 
parameter param38 = (^((8'hab) ? (^~{(param37 ? param37 : param37), {param37}}) : (^(((8'hbc) ? (8'hba) : param37) ? param37 : (~^param37))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  assign y = {wire36, wire34, wire24, wire23, wire22, (1'h0)};
  assign wire22 = (+(&(^{$signed((8'hbf)), {wire20}})));
  assign wire23 = ($unsigned($unsigned(wire19[(1'h0):(1'h0)])) || $signed((wire17[(4'ha):(4'h8)] ?
                      wire22 : wire21[(2'h2):(1'h1)])));
  assign wire24 = $signed((~&$signed($signed((wire20 ? (8'had) : wire19)))));
  module25 #() modinst35 (.wire26(wire18), .wire28(wire19), .clk(clk), .y(wire34), .wire27(wire20), .wire29(wire22));
  assign wire36 = wire24[(3'h4):(3'h4)];
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  assign y = {wire33, wire32, wire31, reg30, (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= (8'hbe);
    end
  assign wire31 = ($unsigned((^$unsigned((!wire27)))) ?
                      $unsigned($unsigned($unsigned(((8'ha1) + wire29)))) : ($signed($unsigned(wire27[(1'h0):(1'h0)])) <= (~|{wire28[(3'h7):(3'h4)]})));
  assign wire32 = wire31[(1'h0):(1'h0)];
  assign wire33 = (wire28[(3'h6):(1'h1)] >> $signed((((wire26 << wire32) ?
                      $unsigned(reg30) : $signed(reg30)) ~^ wire26)));
endmodule

module module51
#(parameter param117 = ((!(-({(8'hb3), (8'ha5)} ? (~(8'hab)) : (~(8'hb6))))) ? (~^({((8'hb6) - (8'hb4)), ((8'hb5) ? (8'hb4) : (8'hbf))} ^ ((+(8'ha1)) ? ((8'hbb) - (8'hb3)) : ((8'ha3) * (8'hb1))))) : ((({(8'had), (8'ha2)} + (~&(8'ha1))) ? (&((8'haf) ? (7'h42) : (8'hb1))) : {{(8'ha8), (8'hb2)}, (8'ha0)}) * ((^~(!(8'ha3))) ? {{(8'hb3), (8'hb1)}, ((8'ha7) ^~ (8'ha7))} : {{(8'hb4)}}))), 
parameter param118 = (~&(|(((~param117) ^ (param117 ? param117 : param117)) ? (((8'ha3) >= (8'hbe)) ? param117 : (param117 ? param117 : param117)) : (8'h9d)))))
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h280):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire56;
  input wire [(2'h2):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  input wire [(5'h13):(1'h0)] wire53;
  input wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire82,
                 wire58,
                 wire57,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 reg59,
                 (1'h0)};
  assign wire57 = ((wire56[(4'hb):(1'h0)] != {($unsigned(wire56) ?
                              $unsigned(wire53) : wire53[(3'h4):(3'h4)])}) ?
                      wire54 : wire54);
  assign wire58 = wire52;
  always
    @(posedge clk) begin
      reg59 <= wire57[(5'h10):(4'h9)];
      reg60 <= wire57[(5'h11):(5'h11)];
    end
  always
    @(posedge clk) begin
      reg61 <= $unsigned((~|$unsigned(((wire56 <= wire55) ?
          $unsigned(wire58) : $signed((8'hb3))))));
      reg62 <= reg59;
      reg63 <= (wire53 >>> ((!wire55) ?
          (~(((8'ha0) ?
              wire56 : (8'hbb)) != $unsigned(reg61))) : {$unsigned((8'ha0)),
              ((reg60 != wire58) & (reg62 ? wire55 : (8'hba)))}));
    end
  always
    @(posedge clk) begin
      reg64 <= (~^{reg62[(3'h7):(2'h3)]});
      if ((~^($signed((~(8'ha4))) ?
          ($unsigned((wire54 ? reg64 : wire53)) ?
              (^~{reg64}) : reg61) : $unsigned((((7'h43) ? reg62 : reg64) ?
              $signed((8'ha5)) : (~^reg62))))))
        begin
          reg65 <= wire57[(4'he):(4'h9)];
          reg66 <= (reg60 - {wire52[(1'h0):(1'h0)]});
          reg67 <= (reg64 ?
              $unsigned($unsigned(wire56[(1'h0):(1'h0)])) : ((wire52[(1'h1):(1'h1)] ?
                  $signed((reg66 ?
                      reg61 : reg65)) : ((wire52 || wire57) | $signed(reg63))) ^ {$unsigned(wire55),
                  ($unsigned(reg66) ?
                      (wire56 + reg65) : (wire57 ? reg62 : wire54))}));
          reg68 <= (reg67[(1'h1):(1'h0)] ?
              {{(((8'h9e) - (8'haa)) ?
                          (reg64 | reg59) : $signed(wire55))}} : wire53[(3'h4):(1'h1)]);
        end
      else
        begin
          if (reg61)
            begin
              reg65 <= $unsigned({$unsigned(((reg63 ? wire54 : wire55) ?
                      (wire53 ? wire57 : wire58) : (~(8'hb4))))});
              reg66 <= (!(+reg61));
              reg67 <= ($unsigned($unsigned(($signed(reg59) && (reg64 ?
                  reg64 : wire55)))) <= wire52);
              reg68 <= reg62;
              reg69 <= (($signed({(reg62 <<< reg63),
                      reg60}) || {$unsigned((reg64 ? (8'ha1) : reg62))}) ?
                  reg64[(2'h2):(1'h1)] : ((($unsigned(reg60) ?
                              ((8'had) ? wire57 : reg62) : $unsigned((8'hbc))) ?
                          ((wire55 ? wire56 : wire53) ?
                              (reg65 ? reg66 : reg67) : reg68) : wire58) ?
                      $unsigned($signed((8'ha9))) : {reg66[(2'h2):(1'h1)]}));
            end
          else
            begin
              reg65 <= $unsigned($unsigned($signed((!{reg64}))));
              reg66 <= reg65;
              reg67 <= (^~reg67);
              reg68 <= {(($unsigned($signed(reg68)) >>> $unsigned($unsigned(reg67))) ?
                      (&$signed({(8'hb2), wire53})) : reg62[(2'h2):(1'h0)])};
            end
          reg70 <= (^$signed($unsigned((!$unsigned(wire56)))));
          if (wire52[(1'h1):(1'h0)])
            begin
              reg71 <= ((($unsigned(reg65[(3'h4):(1'h0)]) ?
                      ($unsigned(reg64) ?
                          reg62[(1'h0):(1'h0)] : wire56[(3'h7):(3'h7)]) : reg60) ?
                  (reg69[(5'h12):(2'h2)] <<< {$signed(wire56),
                      $signed(reg63)}) : $signed((~^$unsigned(reg67)))) <= (wire52 ?
                  (|(reg62 < $unsigned((8'hbb)))) : wire57));
            end
          else
            begin
              reg71 <= reg69[(1'h1):(1'h0)];
              reg72 <= $signed($signed(({(~reg66)} > $signed((-wire55)))));
              reg73 <= reg71[(2'h3):(1'h1)];
              reg74 <= $signed($signed($signed({((8'hbb) ? (8'haf) : reg69),
                  (8'ha6)})));
            end
          if ((~^$signed({reg72[(1'h0):(1'h0)], reg67})))
            begin
              reg75 <= reg72;
              reg76 <= $signed($unsigned($unsigned((8'hae))));
            end
          else
            begin
              reg75 <= reg60;
              reg76 <= $signed({(~&($unsigned(reg64) ?
                      $signed(reg72) : {wire53}))});
              reg77 <= reg59;
              reg78 <= reg69;
              reg79 <= $unsigned((reg61[(4'h8):(3'h5)] ?
                  wire53[(5'h12):(3'h4)] : $unsigned(wire57)));
            end
        end
      reg80 <= $signed((&((reg78[(5'h10):(4'hb)] ?
          (~reg77) : (~(8'hba))) + reg71)));
      reg81 <= (reg80 ?
          (({$unsigned(reg67)} >>> (reg77 >> wire57[(4'h8):(3'h7)])) > reg67) : wire54);
    end
  assign wire82 = (-reg81[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if ((($signed(reg80) < (+reg77[(3'h6):(3'h5)])) ?
          {wire82[(3'h6):(1'h1)], reg69} : (8'ha8)))
        begin
          reg83 <= $signed((($signed((^~reg59)) ?
                  $signed(((8'had) & reg68)) : (wire54[(1'h1):(1'h1)] ?
                      $unsigned(wire54) : (wire58 ^~ (8'hb5)))) ?
              reg68[(3'h5):(2'h3)] : $unsigned(reg79)));
          reg84 <= $unsigned(wire56[(3'h4):(1'h1)]);
          reg85 <= reg80[(1'h0):(1'h0)];
          reg86 <= (reg83[(2'h2):(2'h2)] ?
              (($signed((wire58 >= reg79)) ?
                  $unsigned(wire57) : $signed((+reg85))) >= ((^~reg83[(1'h0):(1'h0)]) ?
                  (reg74 | reg81[(2'h2):(2'h2)]) : $signed((8'hbc)))) : wire53[(1'h0):(1'h0)]);
          reg87 <= ({$unsigned($unsigned(reg78))} > (~&$unsigned(($unsigned(reg79) ?
              $signed(reg77) : wire56[(3'h4):(1'h0)]))));
        end
      else
        begin
          reg83 <= ($signed((({reg60, reg83} + reg73[(4'h9):(3'h5)]) * reg71)) ?
              (reg76[(3'h5):(1'h1)] >>> {wire57}) : ({((reg68 ?
                          (8'hb6) : (8'hb7)) || reg73),
                      reg59} ?
                  reg62[(4'hc):(1'h1)] : $signed($signed($signed(wire57)))));
          reg84 <= $unsigned(reg86);
          reg85 <= reg66[(2'h2):(2'h2)];
        end
      if ((~&reg85))
        begin
          if (reg65)
            begin
              reg88 <= $unsigned(((reg67 ? reg69[(4'hf):(4'h9)] : wire52) ?
                  (^~{(wire52 == reg84)}) : ((+reg75) & (&reg72[(1'h1):(1'h0)]))));
              reg89 <= (reg77[(2'h2):(1'h1)] <= ($unsigned(($unsigned(wire54) ?
                      ((8'hb5) > wire54) : $signed((8'ha1)))) ?
                  wire55 : $signed($unsigned(reg85[(1'h1):(1'h0)]))));
              reg90 <= reg89[(1'h1):(1'h0)];
              reg91 <= ($signed(wire54[(3'h5):(1'h1)]) ?
                  $unsigned((~&(wire53 ?
                      (wire53 + reg85) : reg65))) : wire54[(1'h1):(1'h0)]);
              reg92 <= wire57[(4'hf):(3'h7)];
            end
          else
            begin
              reg88 <= ((^($signed((reg60 ^ reg60)) ?
                      (reg60[(4'ha):(3'h4)] ~^ (reg61 ?
                          reg68 : (8'hb1))) : {reg86,
                          (wire58 ? reg86 : reg65)})) ?
                  $unsigned(reg65[(4'hc):(2'h3)]) : $unsigned(reg73));
            end
        end
      else
        begin
          reg88 <= ((reg91[(4'he):(4'h8)] ?
              (((~^reg80) & $unsigned(reg88)) ?
                  (^reg89) : $unsigned($signed(reg78))) : reg66[(2'h3):(2'h3)]) == ({(+$unsigned(reg80))} ?
              reg90 : reg86[(1'h0):(1'h0)]));
          reg89 <= (reg83 ?
              (^~$unsigned((~|(~reg64)))) : $unsigned($unsigned(reg64)));
          reg90 <= $unsigned(({reg67,
              reg76} ^~ $unsigned($unsigned((reg64 <<< reg62)))));
        end
      reg93 <= {{(+(((8'ha0) ? reg83 : wire58) ? $unsigned(reg81) : reg64))}};
    end
  assign wire94 = wire56[(4'he):(4'h8)];
  assign wire95 = (((((reg72 ? reg65 : reg66) >= (reg87 ?
                          reg91 : reg74)) <<< reg93[(3'h5):(2'h2)]) ?
                      ((reg78[(4'hf):(1'h1)] ?
                          reg68 : (reg76 - reg69)) < $signed(reg76)) : (reg93 - $signed({(8'hac),
                          reg60}))) < reg66);
  assign wire96 = $signed(((^wire53) != ($signed({reg62}) + reg62)));
  assign wire97 = (((({reg85, reg74} ?
                          $unsigned(wire54) : (reg91 ?
                              (8'had) : wire57)) != reg92[(5'h13):(4'h8)]) > ({(~^reg61),
                          (reg85 ?
                              wire55 : reg84)} > ((8'haa) == reg69[(1'h1):(1'h1)]))) ?
                      $unsigned(reg86[(3'h4):(2'h3)]) : (wire52[(2'h2):(1'h0)] ^ {(reg69[(4'hb):(2'h3)] * reg76[(4'ha):(4'h8)]),
                          {{wire56}}}));
  assign wire98 = reg87[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg99 <= ({reg90[(3'h5):(1'h0)], reg91} ?
          $signed((reg83 < $signed(reg60[(4'ha):(1'h1)]))) : reg79[(1'h1):(1'h0)]);
      if (wire97)
        begin
          reg100 <= wire94[(5'h11):(3'h6)];
          reg101 <= ($unsigned($signed((8'ha9))) * {reg88});
          reg102 <= $signed(reg80[(4'hd):(4'hd)]);
        end
      else
        begin
          if ($signed(reg90[(3'h5):(1'h0)]))
            begin
              reg100 <= ((~^wire56) ? $unsigned(reg62[(4'ha):(2'h2)]) : wire95);
              reg101 <= (($unsigned(reg68) ?
                  wire58 : {$unsigned(wire94)}) - $signed($unsigned(((reg67 ?
                      reg90 : reg91) ?
                  (reg70 ^ wire97) : {(8'hb4), reg70}))));
              reg102 <= (reg80[(3'h4):(3'h4)] ?
                  reg102[(1'h1):(1'h1)] : wire97[(4'hd):(3'h4)]);
            end
          else
            begin
              reg100 <= {reg71[(1'h1):(1'h1)],
                  ($signed(wire97) ? {reg66} : reg87)};
            end
          reg103 <= $signed($signed((^$signed(reg102))));
          if (($signed(reg101[(4'h9):(3'h4)]) >>> (!$unsigned(reg91[(3'h4):(2'h2)]))))
            begin
              reg104 <= (-wire57[(5'h10):(4'hd)]);
              reg105 <= $signed($unsigned(wire94));
              reg106 <= (!$signed(reg74));
              reg107 <= $signed(wire55);
              reg108 <= wire57;
            end
          else
            begin
              reg104 <= (+wire95);
            end
          reg109 <= ($unsigned($signed(($unsigned(reg61) ?
                  {reg59, (8'hb1)} : $signed((8'hbc))))) ?
              (!wire53[(4'ha):(1'h1)]) : ($unsigned(wire56) ?
                  ($signed((reg80 ? reg64 : reg69)) ?
                      reg105 : ($unsigned(reg68) >> (!reg87))) : (($signed(reg77) ?
                          {reg77, wire58} : reg62) ?
                      ($unsigned(reg77) ?
                          {reg85} : (reg73 ? reg91 : reg59)) : {(reg89 ?
                              reg66 : reg85),
                          reg72[(2'h2):(2'h2)]})));
          if ($signed($signed((&$signed(wire55[(1'h0):(1'h0)])))))
            begin
              reg110 <= (^~(reg87[(4'hb):(4'hb)] ?
                  $signed((reg89 ?
                      (reg68 <<< reg76) : wire95[(4'h8):(1'h1)])) : (reg67 ~^ (&(8'hab)))));
            end
          else
            begin
              reg110 <= (reg70 ?
                  (~|(~^reg90)) : {(|(~&(reg84 ? wire53 : reg92))), (8'hbb)});
              reg111 <= wire97[(3'h6):(3'h6)];
              reg112 <= $signed(wire55[(2'h2):(1'h0)]);
              reg113 <= reg108;
            end
        end
      reg114 <= $signed((+((wire53 ? (reg90 == wire82) : $signed(reg70)) ?
          $signed({(8'haf)}) : (reg77 & (&wire95)))));
    end
  always
    @(posedge clk) begin
      reg115 <= reg108[(3'h6):(2'h2)];
      reg116 <= {$unsigned(wire52[(2'h2):(1'h0)]), reg88};
    end
endmodule
