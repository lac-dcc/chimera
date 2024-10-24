module top
#(parameter param171 = (~|(~^(|(((8'ha3) ? (8'hbf) : (8'hb1)) * {(8'h9d)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire167;
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  assign y = {wire169, wire18, wire167, reg170, (1'h0)};
  module5 #() modinst19 (wire18, clk, wire1, wire3, wire2, wire4, wire0);
  module20 #() modinst168 (.wire21(wire3), .wire23(wire1), .wire22(wire18), .y(wire167), .clk(clk), .wire25(wire4), .wire24(wire0));
  assign wire169 = ($unsigned($unsigned($unsigned({wire1,
                       wire1}))) < (((~(|wire18)) <= wire3[(3'h6):(3'h4)]) >> ((^~wire167) || {$signed(wire0)})));
  always
    @(posedge clk) begin
      reg170 <= ((|(^(^(wire1 >= wire167)))) ?
          wire167[(3'h7):(1'h1)] : (8'h9d));
    end
endmodule

module module20
#(parameter param165 = (~&((~{(^~(8'hbc))}) ? {(((8'ha8) ? (8'h9c) : (8'had)) ? (+(8'h9e)) : ((8'had) ? (8'haa) : (8'h9d)))} : (~(((8'haa) ? (8'ha3) : (7'h40)) >> {(8'hb3), (8'had)})))), 
parameter param166 = ((param165 ? ((8'ha6) ? param165 : (~^param165)) : ((!(param165 == param165)) ? ((param165 <= param165) * (param165 << (8'h9f))) : (~{param165, param165}))) <= (~&((~{param165, (7'h41)}) ? ((param165 && (8'hbe)) >= (param165 ? param165 : param165)) : (~|(8'hb5))))))
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire22;
  input wire [(5'h14):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire [(4'h9):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire164;
  wire signed [(3'h4):(1'h0)] wire163;
  wire signed [(5'h11):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire140;
  wire [(3'h6):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire49;
  reg signed [(5'h12):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(4'h9):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire138,
                 wire105,
                 wire51,
                 wire49,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  module26 #() modinst50 (wire49, clk, wire25, wire24, wire21, wire22, wire23);
  assign wire51 = wire22[(4'h8):(1'h0)];
  module52 #() modinst106 (wire105, clk, wire22, wire51, wire23, wire49);
  module107 #() modinst139 (wire138, clk, wire105, wire22, wire21, wire24);
  assign wire140 = (8'ha6);
  assign wire141 = ($signed(wire49[(4'hd):(1'h1)]) ?
                       ({($unsigned(wire138) + (~wire138))} ?
                           (|wire25) : $unsigned((~^(|wire25)))) : ((~^wire49) && wire140[(4'h9):(2'h2)]));
  assign wire142 = $unsigned(((~($unsigned(wire21) ?
                           (wire21 ? wire24 : wire105) : {wire21, wire141})) ?
                       $signed({(wire141 ? wire105 : wire49),
                           $signed(wire24)}) : (({wire138, wire138} ?
                           wire22 : (~&wire21)) >> (8'hbb))));
  assign wire143 = $signed($unsigned({(~&(wire140 ? wire49 : wire140)),
                       wire23[(3'h7):(3'h6)]}));
  always
    @(posedge clk) begin
      reg144 <= wire105[(2'h2):(1'h0)];
      reg145 <= (($signed((~^$unsigned(wire22))) + (~|$signed((wire23 ?
              wire22 : wire141)))) ?
          wire25[(3'h5):(2'h3)] : $unsigned($unsigned($signed((wire49 ?
              wire105 : wire22)))));
      if (((8'ha0) ?
          wire141[(1'h0):(1'h0)] : $unsigned((wire105[(4'h8):(3'h5)] ~^ {$unsigned(wire23),
              (~wire21)}))))
        begin
          reg146 <= ($unsigned(wire141[(1'h1):(1'h0)]) > $unsigned(wire140[(4'h9):(2'h3)]));
          if ($unsigned(wire49))
            begin
              reg147 <= ((~(~^$unsigned($signed(reg145)))) ~^ $signed((((!wire105) ?
                      $unsigned(reg146) : wire142) ?
                  (-$unsigned(wire25)) : wire49[(2'h2):(1'h0)])));
              reg148 <= (wire141[(1'h0):(1'h0)] * $signed(reg146[(1'h1):(1'h0)]));
              reg149 <= (wire49[(2'h3):(1'h0)] << $signed($unsigned({wire24[(5'h14):(4'hd)]})));
            end
          else
            begin
              reg147 <= (wire49 || $signed(wire141[(2'h2):(1'h0)]));
            end
          reg150 <= (8'hbc);
          reg151 <= (wire51 ?
              $unsigned((!wire142)) : $signed($signed(reg149[(4'h8):(3'h5)])));
          reg152 <= wire141[(3'h4):(2'h2)];
        end
      else
        begin
          reg146 <= reg150;
          reg147 <= {$unsigned((~&wire143[(5'h13):(5'h12)]))};
        end
      if (((+reg151[(3'h4):(1'h0)]) ?
          $unsigned(reg148[(1'h1):(1'h1)]) : $signed($signed({$unsigned(wire22),
              (reg152 || wire138)}))))
        begin
          reg153 <= ({$signed($signed((~|reg148))),
              reg144[(1'h1):(1'h0)]} == ($signed($unsigned($signed(wire22))) ^~ ((^(~reg152)) ?
              $signed(reg146[(1'h0):(1'h0)]) : wire51[(4'ha):(4'h8)])));
          reg154 <= $signed(reg144);
          reg155 <= {($unsigned(reg144) != {(reg151[(2'h2):(2'h2)] ^ wire49[(3'h7):(1'h1)]),
                  (wire25 - {wire22})})};
          if (wire51[(2'h3):(2'h2)])
            begin
              reg156 <= ((!$signed($signed((-wire24)))) + (~&{((8'had) ?
                      (8'h9c) : reg144),
                  (wire140[(5'h12):(3'h5)] > ((8'ha6) ? reg152 : reg154))}));
              reg157 <= ((!(^~((wire23 ? wire21 : reg146) > (wire21 ?
                  reg144 : reg152)))) || ((^~((~reg154) > (reg152 ?
                      (8'ha1) : reg154))) ?
                  (-wire51[(3'h4):(1'h0)]) : wire49));
              reg158 <= reg146[(1'h1):(1'h0)];
              reg159 <= reg154;
            end
          else
            begin
              reg156 <= (wire140[(4'h9):(4'h8)] << (($signed($signed(reg155)) ?
                      {reg151, (reg151 != wire21)} : ($signed(wire22) ?
                          $signed(wire21) : $signed(reg156))) ?
                  reg152[(2'h2):(1'h1)] : ((^~(8'hb7)) <<< (|$signed(wire140)))));
              reg157 <= $unsigned(((wire24 < {(8'haf)}) ?
                  reg155[(2'h2):(1'h0)] : $signed(reg144)));
              reg158 <= $unsigned((($signed($unsigned(reg144)) - $unsigned((~|reg149))) > $unsigned($signed($unsigned(wire142)))));
              reg159 <= wire21[(4'hf):(4'h9)];
            end
          reg160 <= ({reg150[(3'h7):(2'h2)], wire105} ?
              wire143 : wire143[(4'hd):(3'h4)]);
        end
      else
        begin
          reg153 <= reg149;
          reg154 <= wire141;
          reg155 <= $unsigned({(reg152 ?
                  (reg159[(1'h0):(1'h0)] ?
                      wire142 : wire49[(4'hb):(2'h3)]) : reg146[(1'h1):(1'h0)])});
          reg156 <= wire49;
          reg157 <= (reg148[(1'h1):(1'h1)] == $unsigned(($signed((reg149 ?
              wire22 : (8'hb3))) >> ((wire23 ? wire51 : reg158) ?
              (reg160 ^ reg150) : (wire142 ? wire142 : wire22)))));
        end
      reg161 <= reg152[(4'hb):(3'h6)];
    end
  assign wire162 = $unsigned($unsigned($unsigned(reg154[(4'h8):(1'h1)])));
  assign wire163 = $unsigned((8'hb2));
  assign wire164 = reg146;
endmodule

module module5
#(parameter param17 = ({({((8'ha4) <= (7'h40)), {(8'haa), (8'hab)}} ^~ (((8'ha8) ? (8'ha9) : (8'ha2)) ? ((8'ha2) ? (8'ha0) : (8'hb8)) : (^(8'ha7)))), ({((8'hb4) ? (8'ha5) : (8'hae)), ((8'h9f) ? (7'h44) : (8'hb0))} ? (^~((8'hac) ? (8'ha8) : (7'h40))) : ({(8'hbb), (8'h9e)} | {(8'ha3), (8'ha2)}))} * {(((~&(8'had)) - ((8'ha0) ? (8'hbb) : (8'hbb))) & (~^((8'hbf) && (8'hbd))))}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  assign y = {wire16, wire15, wire12, wire11, reg14, reg13, (1'h0)};
  assign wire11 = wire6;
  assign wire12 = ((8'ha1) <<< $unsigned($signed(wire9[(3'h7):(2'h3)])));
  always
    @(posedge clk) begin
      reg13 <= {$unsigned((|((wire11 <<< (8'hba)) ^~ (|wire8))))};
      reg14 <= $unsigned($unsigned(wire11));
    end
  assign wire15 = ((~wire6[(1'h0):(1'h0)]) & wire11[(4'hd):(2'h2)]);
  assign wire16 = (reg13[(2'h2):(1'h0)] ?
                      wire12 : $signed((!((wire10 ? reg14 : wire8) - {wire15,
                          reg13}))));
endmodule

module module107
#(parameter param136 = ((((((8'ha7) ? (8'ha6) : (8'h9f)) ? (|(8'haf)) : ((8'haa) ? (8'hb9) : (8'hb8))) > ((8'haf) ? (^(8'hb7)) : ((8'hb1) << (7'h41)))) ? (({(8'hab)} ? ((8'hbb) ? (8'hb4) : (8'ha8)) : ((7'h43) ? (8'ha5) : (8'hab))) >= ((7'h41) << ((8'h9c) >= (8'h9e)))) : ((((8'hbc) ? (8'hac) : (7'h41)) ^ {(7'h42), (8'hbe)}) ? (8'hbb) : ({(8'haa), (8'ha9)} ? (!(7'h44)) : ((8'h9d) ? (8'hb1) : (8'hbc))))) || {(8'hac), ((8'h9e) ? (((8'ha1) ? (8'hb7) : (8'hae)) ? ((7'h44) == (8'hbd)) : ((8'hab) ? (8'ha4) : (8'h9d))) : {((8'hbb) ? (8'hac) : (8'ha1)), ((8'hb1) ? (7'h42) : (8'hbd))})}), 
parameter param137 = param136)
(y, clk, wire111, wire110, wire109, wire108);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire111;
  input wire signed [(3'h5):(1'h0)] wire110;
  input wire signed [(4'hf):(1'h0)] wire109;
  input wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire132;
  wire signed [(3'h4):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire112;
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire112 = (wire111 ?
                       wire109 : (((-{wire110,
                           wire110}) >> $unsigned(wire109)) <= (-(^wire108))));
  assign wire113 = {$unsigned(($signed(wire109[(3'h5):(3'h5)]) ?
                           (wire110[(3'h4):(2'h3)] ^~ ((8'hac) ?
                               wire108 : wire110)) : $unsigned($signed(wire111))))};
  assign wire114 = wire109;
  assign wire115 = $signed((((((8'haf) ?
                               wire110 : wire113) >>> $signed(wire108)) ?
                           (~wire109) : wire108) ?
                       wire110 : {$unsigned((wire112 ? wire111 : wire113))}));
  assign wire116 = $unsigned((-($unsigned(((8'hbd) ? (8'hb2) : wire115)) ?
                       $signed({wire108}) : (wire111[(3'h7):(1'h1)] ?
                           wire110[(1'h0):(1'h0)] : (wire110 ?
                               wire109 : wire115)))));
  assign wire117 = $signed($signed(wire112));
  assign wire118 = $unsigned(wire114[(3'h6):(2'h2)]);
  assign wire119 = (($signed(($unsigned(wire114) | (wire113 > wire114))) ?
                           (((wire118 ? wire108 : (8'hb5)) ?
                               $signed(wire112) : $signed((7'h43))) <<< ((wire111 ?
                                   wire113 : (8'hb5)) ?
                               $signed(wire110) : $signed((8'hbe)))) : (+((+wire114) ?
                               (!wire114) : $signed(wire115)))) ?
                       wire118[(3'h6):(2'h3)] : $unsigned({$signed($signed(wire115))}));
  always
    @(posedge clk) begin
      if ($signed(($signed(wire117[(4'hb):(2'h2)]) >>> wire112)))
        begin
          reg120 <= (wire108 != $unsigned($unsigned($signed((|wire108)))));
          if (wire110)
            begin
              reg121 <= ((~&(reg120 ?
                  $unsigned($unsigned((8'ha1))) : (^~((8'hbe) ?
                      wire112 : wire119)))) >> {$signed($signed(wire119))});
              reg122 <= $signed({({(wire118 >= (8'hba))} ?
                      {(8'h9d),
                          (reg121 ?
                              wire114 : reg120)} : wire112[(4'hb):(1'h0)]),
                  (wire111 ? wire119 : wire114[(4'h9):(4'h9)])});
              reg123 <= $signed($unsigned((+reg120)));
              reg124 <= (8'haa);
            end
          else
            begin
              reg121 <= wire109[(2'h2):(2'h2)];
              reg122 <= $unsigned((!wire116));
              reg123 <= (reg124 ?
                  wire110 : $unsigned($unsigned((reg122 ?
                      (7'h43) : (wire116 < wire117)))));
            end
          reg125 <= ($unsigned(wire108) || wire115[(3'h5):(3'h5)]);
        end
      else
        begin
          reg120 <= wire108;
          reg121 <= ($unsigned((8'ha9)) <<< $signed(({(!wire119)} || ($unsigned(wire109) ?
              reg120 : reg124))));
          reg122 <= $signed({(reg125 ?
                  ((~(8'hb3)) || (reg120 ? wire108 : reg120)) : reg121)});
          reg123 <= (wire116 ? wire109[(1'h0):(1'h0)] : wire119);
        end
      reg126 <= $signed($signed((^wire110[(3'h4):(2'h3)])));
    end
  assign wire127 = (&(~$unsigned(wire113[(3'h7):(3'h6)])));
  assign wire128 = $unsigned(wire111);
  assign wire129 = wire118[(4'h9):(3'h4)];
  assign wire130 = $signed(wire127);
  assign wire131 = wire114;
  assign wire132 = {((wire131[(2'h3):(2'h2)] ?
                           ($unsigned(wire128) != {wire108,
                               wire113}) : ($signed(reg126) || wire112)) | $unsigned((((7'h40) ?
                               reg121 : wire116) ?
                           $signed(wire131) : $signed(wire117))))};
  assign wire133 = (8'hb7);
  assign wire134 = $signed(wire118);
  assign wire135 = wire109;
endmodule

module module52  (y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h22c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire56;
  input wire [(4'hb):(1'h0)] wire55;
  input wire signed [(5'h10):(1'h0)] wire54;
  input wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire64,
                 wire63,
                 wire62,
                 wire58,
                 wire57,
                 reg104,
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
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire57 = wire53[(1'h0):(1'h0)];
  assign wire58 = wire54;
  always
    @(posedge clk) begin
      reg59 <= wire56[(4'he):(3'h6)];
      reg60 <= (^((((reg59 ?
          reg59 : wire57) + $unsigned(reg59)) < {(wire58 & wire54)}) >= $signed((wire58 + (~&wire58)))));
      reg61 <= reg59;
    end
  assign wire62 = wire53[(2'h2):(1'h1)];
  assign wire63 = (!wire62);
  assign wire64 = wire58;
  always
    @(posedge clk) begin
      reg65 <= wire56;
      reg66 <= reg59;
    end
  always
    @(posedge clk) begin
      reg67 <= (wire53[(1'h0):(1'h0)] ?
          $signed(reg60[(3'h5):(1'h1)]) : wire58[(2'h2):(1'h1)]);
      reg68 <= (8'hb7);
      reg69 <= ($signed(wire57) ^~ reg60);
      if ({$signed((($signed(reg68) >> reg68[(3'h7):(2'h3)]) ? reg59 : wire56)),
          ((!{$signed(reg65), ((8'had) - wire56)}) * $unsigned(wire58))})
        begin
          reg70 <= $signed(reg65);
          reg71 <= $unsigned($signed({wire54[(3'h4):(2'h3)]}));
        end
      else
        begin
          reg70 <= $unsigned(wire64);
          reg71 <= (8'hb9);
          reg72 <= (!(reg69[(3'h6):(2'h3)] ?
              reg70[(4'h9):(3'h4)] : ($signed((~|(8'hac))) != reg60[(5'h12):(1'h0)])));
          reg73 <= $unsigned(reg67[(2'h2):(1'h0)]);
        end
    end
  assign wire74 = $signed({wire54[(4'hb):(4'ha)]});
  assign wire75 = ((8'ha4) ? $unsigned(wire64[(3'h5):(1'h1)]) : reg69);
  assign wire76 = $unsigned({((reg70[(1'h0):(1'h0)] * (reg61 ?
                          wire63 : wire57)) & $unsigned(reg61[(4'hc):(2'h2)]))});
  assign wire77 = (~^$unsigned(($signed((wire58 <<< wire54)) ?
                      wire58[(2'h3):(1'h0)] : wire64)));
  assign wire78 = ((({{reg61, (8'hbe)}} ?
                              (reg73 ?
                                  $unsigned(wire64) : (wire64 ?
                                      wire56 : wire55)) : reg68[(4'hf):(2'h2)]) ?
                          (-{reg71}) : (^(wire57 ?
                              reg70[(4'hc):(4'ha)] : ((8'hb3) ?
                                  (8'hbc) : reg59)))) ?
                      $unsigned(reg70[(4'hc):(3'h4)]) : $unsigned({$signed(reg69[(5'h15):(2'h2)]),
                          ($unsigned(wire75) ? reg68 : wire77)}));
  assign wire79 = {wire76};
  assign wire80 = reg61;
  always
    @(posedge clk) begin
      if ((($signed(reg61[(4'h9):(1'h1)]) <= $unsigned({((7'h40) ?
              wire75 : wire58)})) >>> $signed(reg65)))
        begin
          reg81 <= $signed(reg69);
        end
      else
        begin
          if (reg72[(1'h0):(1'h0)])
            begin
              reg81 <= reg59;
              reg82 <= $signed((($signed(wire56) ?
                  ($unsigned(reg73) ^ (wire55 == reg70)) : $signed((wire79 >>> wire63))) >> reg70[(3'h5):(1'h1)]));
              reg83 <= wire78;
              reg84 <= (({reg59} && reg59[(1'h0):(1'h0)]) ?
                  wire63 : (reg68 < ((!(reg72 ? reg60 : wire75)) ?
                      ((reg66 && wire54) > (&wire56)) : (~|(reg72 ?
                          reg59 : reg72)))));
              reg85 <= wire55;
            end
          else
            begin
              reg81 <= reg61;
              reg82 <= (wire76[(1'h0):(1'h0)] && ((-($signed(reg71) ?
                      {wire64} : {reg83})) ?
                  (reg81[(3'h5):(3'h4)] ?
                      ({reg71} ?
                          (reg71 ?
                              wire54 : wire55) : (~&wire62)) : $unsigned(reg83)) : $signed((!{reg81,
                      reg67}))));
              reg83 <= $unsigned(reg60);
            end
          if (reg66)
            begin
              reg86 <= $signed(wire57[(2'h3):(2'h3)]);
              reg87 <= $unsigned($signed(((~(~(7'h40))) ?
                  (+$unsigned(wire64)) : (reg85 & wire56))));
              reg88 <= wire80[(1'h0):(1'h0)];
              reg89 <= {wire77[(2'h2):(1'h0)]};
            end
          else
            begin
              reg86 <= wire76;
              reg87 <= reg65[(3'h7):(2'h2)];
            end
          reg90 <= reg83;
          if (reg69[(5'h10):(4'ha)])
            begin
              reg91 <= $signed(reg59);
            end
          else
            begin
              reg91 <= (8'haa);
              reg92 <= (8'hba);
              reg93 <= ((((wire78[(5'h13):(4'hd)] << reg61) ?
                      $unsigned(wire76[(3'h7):(3'h4)]) : (((8'ha1) ?
                              reg67 : (8'ha9)) ?
                          {reg85,
                              reg87} : (|reg84))) ^~ ((reg90[(1'h1):(1'h0)] + (wire80 ?
                      reg73 : wire55)) >>> $unsigned((^wire80)))) ?
                  $signed(reg84) : {$unsigned($signed(wire57))});
              reg94 <= $signed(((!$unsigned(((8'ha0) >= reg92))) < $signed($unsigned($signed(wire77)))));
              reg95 <= ($signed(reg93[(4'ha):(1'h0)]) ?
                  wire55 : wire76[(2'h3):(2'h3)]);
            end
          reg96 <= $unsigned(($signed(($unsigned((8'hb1)) ?
              $unsigned(wire62) : $signed(reg94))) - wire63));
        end
      if ({$unsigned($signed((reg94[(4'hd):(2'h2)] ?
              $signed(reg89) : wire63[(2'h3):(2'h3)])))})
        begin
          reg97 <= {wire55, $signed(wire80[(3'h7):(2'h3)])};
          if ($unsigned((reg92 ? wire58 : (+reg89[(2'h2):(1'h1)]))))
            begin
              reg98 <= {reg91, (|reg97[(2'h2):(1'h0)])};
            end
          else
            begin
              reg98 <= $unsigned((!$signed({$unsigned(reg84),
                  $unsigned(reg81)})));
              reg99 <= reg92;
              reg100 <= (8'ha6);
              reg101 <= ($signed(wire79[(5'h11):(3'h4)]) ?
                  ($unsigned($signed(reg69)) ?
                      (|wire57[(1'h0):(1'h0)]) : ($signed((|wire80)) || wire62[(3'h4):(2'h3)])) : (($signed((~reg95)) | ($signed(reg95) ?
                      {(8'h9c), (7'h44)} : wire75)) & $signed($signed(reg97))));
            end
          reg102 <= (&(&wire58));
        end
      else
        begin
          if ((($unsigned($signed((reg68 == reg68))) ?
                  (($unsigned((8'hb2)) ?
                      (reg85 <<< reg60) : (wire55 ^~ wire75)) & $unsigned($signed(wire64))) : $signed($signed((reg65 ^ reg85)))) ?
              ((8'hbc) ?
                  {(~&(8'hb7))} : (((|reg59) >= (~wire76)) == $signed((^~wire55)))) : ((|reg94) ?
                  (&$signed({reg96, reg95})) : (8'h9e))))
            begin
              reg97 <= wire78[(4'hd):(4'hc)];
              reg98 <= reg70[(2'h3):(2'h3)];
              reg99 <= reg66[(1'h1):(1'h0)];
              reg100 <= $signed(reg86);
            end
          else
            begin
              reg97 <= (8'ha5);
              reg98 <= reg92[(2'h3):(2'h2)];
            end
          if (wire63)
            begin
              reg101 <= (-(^~{(wire62 ?
                      (^~wire62) : ((8'ha9) ? reg92 : reg93))}));
              reg102 <= $signed({(($signed(reg95) && $signed((8'hac))) >> reg100[(2'h2):(2'h2)]),
                  $signed((^$unsigned((8'hbe))))});
            end
          else
            begin
              reg101 <= ((($signed((reg102 << reg95)) ?
                  (wire75[(3'h5):(3'h5)] ?
                      $signed(wire75) : $signed(wire64)) : $signed(wire56)) == reg65[(3'h6):(2'h2)]) * $signed((^~(reg101 ^~ (|reg95)))));
              reg102 <= $unsigned($unsigned((~^$signed(wire58))));
              reg103 <= ($unsigned((+(|(!(8'hac))))) != reg65);
            end
        end
      reg104 <= (~|(reg85[(5'h11):(1'h1)] ?
          (^((reg95 ? reg69 : wire53) ?
              $unsigned(wire77) : reg71[(2'h2):(1'h1)])) : (8'hae)));
    end
endmodule

module module26
#(parameter param48 = ((&((8'ha3) < (|((8'hb6) ? (8'hac) : (8'hb7))))) ? {(~((~&(8'had)) << (~|(8'ha6)))), ((((8'hb5) > (8'haa)) <<< (|(8'hbc))) * (+((8'hbf) < (8'haa))))} : (~|((8'hb9) ? ((~&(8'ha9)) ^ (+(8'hac))) : {(^(8'h9f))}))))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire [(5'h13):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire32;
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire32 = (|(+wire30[(4'he):(1'h0)]));
  always
    @(posedge clk) begin
      reg33 <= ({$signed((wire29[(4'ha):(4'ha)] ?
              $unsigned(wire27) : wire31))} || wire29);
      reg34 <= (($signed((8'h9d)) > ($unsigned($unsigned(wire31)) ?
          (((8'hb9) || (7'h40)) ? (^wire29) : reg33) : $unsigned((wire32 ?
              wire29 : reg33)))) >> {reg33[(2'h3):(2'h2)], wire31});
      reg35 <= ($signed((($unsigned(wire28) * (wire27 ? (8'hac) : wire27)) ?
          ($signed(wire30) ^~ (&(8'haa))) : (~(wire30 < wire29)))) == $unsigned(wire28[(3'h7):(3'h6)]));
    end
  assign wire36 = $signed({$unsigned(($unsigned(wire32) ?
                          ((8'hbc) ?
                              (8'hb8) : wire29) : reg33[(3'h5):(3'h5)]))});
  assign wire37 = ((~^(8'h9c)) ?
                      {$signed(wire30[(4'hb):(3'h7)])} : ((~(!(wire36 >= wire29))) != (reg33[(4'h8):(3'h6)] ?
                          $unsigned($signed((8'hb4))) : ((~reg35) ?
                              (wire29 > wire29) : (wire30 ?
                                  (8'ha4) : (8'h9e))))));
  assign wire38 = ((~|$signed(wire28)) >= wire37[(4'h8):(2'h2)]);
  assign wire39 = $signed($unsigned((reg34[(2'h2):(1'h1)] < $signed((wire31 ?
                      wire38 : wire28)))));
  assign wire40 = ((($signed((~wire31)) >> ((wire27 >> reg35) >>> $unsigned(wire27))) ?
                      (wire36 == (-(wire29 ?
                          wire36 : wire39))) : $signed(({(8'had),
                          wire30} > $signed(wire38)))) < wire31[(2'h3):(1'h0)]);
  assign wire41 = (|wire36[(4'h9):(1'h1)]);
  assign wire42 = (+(wire32[(5'h11):(4'hf)] ?
                      reg34[(3'h7):(3'h5)] : (wire31[(2'h2):(2'h2)] ?
                          wire27[(5'h13):(5'h12)] : ($unsigned(wire27) ?
                              $signed(wire38) : (reg34 ? wire28 : wire40)))));
  assign wire43 = $signed($signed($unsigned(wire32)));
  assign wire44 = wire40[(2'h3):(2'h2)];
  assign wire45 = ((wire28 && reg34[(4'h9):(2'h3)]) && $signed((&((8'h9f) && (~&wire29)))));
  assign wire46 = $unsigned((~$unsigned((&$signed(wire32)))));
  assign wire47 = $signed($unsigned((wire45[(3'h5):(1'h0)] + wire28)));
endmodule
