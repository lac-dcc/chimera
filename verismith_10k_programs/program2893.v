module top
#(parameter param155 = ((8'h9e) ? (8'hab) : (((~^((7'h40) & (8'h9e))) ? (((8'ha0) ? (8'had) : (8'hb9)) > (~|(8'haa))) : (|(^~(8'hb2)))) != ((((8'hb5) ? (8'ha1) : (7'h44)) >>> ((8'ha1) <<< (8'hbb))) | ((~^(8'hbc)) ? (~(8'ha6)) : ((8'ha2) ? (8'h9c) : (8'ha5)))))), 
parameter param156 = ((param155 << {param155, ({param155, param155} ? param155 : {param155})}) == (^~(((~(8'hbf)) - (param155 ? param155 : param155)) ? param155 : ({param155, param155} ? param155 : (param155 == param155))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire153;
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire153,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire5 = $signed($signed((~^(!wire2[(3'h4):(2'h2)]))));
  assign wire6 = wire0;
  assign wire7 = ((wire3 ?
                     (wire1[(3'h4):(2'h3)] ^ ({(8'ha4)} ?
                         (wire5 && wire1) : (~wire4))) : {((8'hb6) >>> (wire0 > wire1))}) >= wire6[(1'h0):(1'h0)]);
  assign wire8 = {wire2[(2'h3):(1'h1)]};
  assign wire9 = {wire5[(2'h2):(2'h2)]};
  assign wire10 = (wire3[(2'h3):(2'h3)] ?
                      wire4[(4'hb):(4'h8)] : wire4[(3'h5):(2'h2)]);
  assign wire11 = wire7[(3'h7):(3'h7)];
  assign wire12 = $unsigned(wire1);
  assign wire13 = (~&wire6[(1'h0):(1'h0)]);
  assign wire14 = (wire3[(4'h9):(3'h5)] ?
                      (({{wire0}} ?
                          wire13 : wire7[(4'h9):(2'h3)]) << (((wire7 != wire0) >= (&wire8)) ?
                          {wire9} : wire1)) : (wire8 != wire10));
  assign wire15 = (^~($unsigned((+$signed(wire12))) <= wire13));
  assign wire16 = $signed((8'ha9));
  assign wire17 = wire5[(4'h8):(3'h4)];
  assign wire18 = wire16[(2'h2):(1'h0)];
  assign wire19 = wire18;
  assign wire20 = wire0[(3'h5):(2'h2)];
  assign wire21 = (8'hab);
  always
    @(posedge clk) begin
      reg22 <= (~$unsigned((($unsigned(wire16) ?
          (^~(8'hac)) : (wire17 ~^ wire14)) != ({wire9, wire6} ?
          $signed(wire4) : $signed(wire10)))));
      reg23 <= wire11;
    end
  module24 #() modinst154 (wire153, clk, wire10, wire5, wire0, wire12, wire11);
endmodule

module module24
#(parameter param152 = (-((~|(((8'ha7) && (8'ha9)) < (~&(7'h42)))) ? (((+(8'hae)) * (|(8'hb6))) ^ ({(8'hb0)} ? ((8'ha2) & (8'hb2)) : ((8'ha4) & (8'h9f)))) : {(^{(7'h43)}), {{(8'hb6), (8'hbd)}}})))
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h25b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire25;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire [(4'h9):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire124;
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(4'hf):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire127,
                 wire126,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire62,
                 wire64,
                 wire65,
                 wire77,
                 wire98,
                 wire100,
                 wire124,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
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
                 (1'h0)};
  assign wire30 = (~|$unsigned($unsigned((~&$unsigned(wire27)))));
  assign wire31 = $signed($unsigned(((wire28 ?
                          (wire30 ~^ wire28) : $unsigned(wire26)) ?
                      (wire29[(3'h6):(1'h1)] > (wire25 && wire29)) : $signed($unsigned(wire27)))));
  assign wire32 = (wire29[(3'h6):(2'h2)] ?
                      (&{wire25[(2'h3):(1'h1)],
                          wire31[(1'h1):(1'h0)]}) : wire30[(2'h3):(1'h1)]);
  assign wire33 = ((wire32 ? wire26[(3'h5):(3'h4)] : wire28[(3'h4):(2'h3)]) ?
                      wire27 : $signed({((wire32 <<< wire29) ?
                              $unsigned(wire31) : $unsigned(wire32)),
                          wire31[(4'hc):(1'h1)]}));
  assign wire34 = ($unsigned($signed($signed((wire27 ~^ wire26)))) ?
                      ($signed(wire32) ?
                          (|(~^$signed(wire32))) : wire30[(3'h4):(2'h3)]) : $unsigned((^~wire27[(1'h0):(1'h0)])));
  assign wire35 = wire27;
  assign wire36 = ((wire27[(1'h0):(1'h0)] && $unsigned(wire35)) != (wire28[(1'h1):(1'h0)] <= wire33[(4'h8):(1'h1)]));
  assign wire37 = ((8'hbb) != wire34[(2'h3):(1'h1)]);
  module38 #() modinst63 (.clk(clk), .y(wire62), .wire40(wire36), .wire42(wire26), .wire41(wire30), .wire39(wire35));
  assign wire64 = ((!{wire29[(3'h5):(3'h5)], wire62[(4'h9):(3'h4)]}) ?
                      wire32[(2'h3):(1'h0)] : (((~&(&wire62)) ?
                              ($unsigned((8'hb2)) ?
                                  (~wire34) : (+wire28)) : ((&(8'hb5)) ?
                                  wire25[(1'h0):(1'h0)] : (wire25 ?
                                      wire26 : wire25))) ?
                          ($unsigned((wire37 >> wire62)) == ($unsigned(wire32) ?
                              (^~wire31) : (^wire31))) : $signed(((wire35 * wire62) ?
                              {wire25} : wire28))));
  assign wire65 = (8'ha9);
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(((8'hbb) >>> $unsigned((8'ha7))))) ?
          $unsigned(({(~^wire33)} ?
              wire29 : $unsigned((wire36 * wire29)))) : (wire34[(1'h0):(1'h0)] >>> $signed(wire25))))
        begin
          reg66 <= $unsigned((~(8'hb3)));
          reg67 <= ((wire33 ?
                  {($unsigned(wire30) >= (wire31 ? wire32 : wire28)),
                      wire64[(4'he):(4'hc)]} : wire27) ?
              wire65 : (wire29 ?
                  wire28 : (~|($unsigned(wire30) ?
                      ((8'hac) || wire30) : $unsigned(wire30)))));
        end
      else
        begin
          reg66 <= ((^(wire30[(1'h0):(1'h0)] ?
              $unsigned(wire31) : $signed($unsigned(wire30)))) ^ wire35[(4'hb):(3'h7)]);
          reg67 <= (^$signed((^~$unsigned((wire30 ? wire33 : (8'hba))))));
          if ({($signed((|$signed((7'h41)))) ?
                  ($signed(wire30) ?
                      $unsigned({wire28}) : reg67) : wire30[(1'h0):(1'h0)]),
              {($unsigned($signed(wire28)) >> $signed((8'hbc))), wire62}})
            begin
              reg68 <= (^~$signed($unsigned({(wire25 >> wire31)})));
              reg69 <= (+(($signed({wire34}) ?
                      (8'hbd) : ((reg67 << wire37) <<< (reg68 ?
                          wire32 : wire27))) ?
                  ($signed((wire34 > (8'ha5))) >>> ((^~wire35) ?
                      wire29[(3'h4):(2'h3)] : $signed(wire34))) : $unsigned((|((8'hbd) ?
                      wire37 : wire62)))));
              reg70 <= reg67[(4'h8):(3'h6)];
              reg71 <= $signed($signed(wire33[(4'hb):(2'h3)]));
            end
          else
            begin
              reg68 <= (~wire37);
              reg69 <= $signed(reg67[(3'h7):(1'h1)]);
              reg70 <= (^$signed((~^({wire33} || (~&(8'ha5))))));
            end
          reg72 <= wire33;
        end
      if ((((~|wire32[(1'h0):(1'h0)]) == {(^~$unsigned((8'hb3)))}) ?
          (8'hb3) : ((+(-(wire31 ?
              wire64 : (8'hbc)))) != $unsigned(wire35[(5'h11):(4'ha)]))))
        begin
          reg73 <= wire35;
          reg74 <= (($unsigned($unsigned(wire27)) ?
                  wire33[(5'h11):(2'h2)] : $signed(((wire33 ?
                          (8'h9c) : wire34) ?
                      wire29 : reg71[(4'h9):(4'h9)]))) ?
              {(wire29[(3'h6):(2'h3)] ?
                      reg73 : (wire35 ?
                          (wire33 ? wire25 : reg68) : (^~wire62))),
                  reg67} : ($signed(wire30[(2'h3):(1'h0)]) || (((~|(7'h43)) - (reg71 ?
                      wire25 : (8'hbf))) ?
                  $signed(((8'had) ?
                      wire37 : wire28)) : $signed((reg66 && wire28)))));
          reg75 <= reg70;
        end
      else
        begin
          reg73 <= wire31[(3'h7):(3'h7)];
          reg74 <= (^{reg71, {reg72[(1'h1):(1'h0)], reg75[(2'h3):(1'h1)]}});
        end
      reg76 <= {reg72};
    end
  assign wire77 = {wire64};
  module78 #() modinst99 (wire98, clk, wire26, reg72, reg75, reg74, wire33);
  assign wire100 = {(reg76[(2'h3):(1'h0)] ?
                           $signed(wire35) : $unsigned(($signed(reg73) ?
                               (reg68 ^ (8'hbc)) : (reg70 ? wire32 : reg76))))};
  module101 #() modinst125 (wire124, clk, wire64, wire27, wire35, reg76);
  assign wire126 = reg70;
  assign wire127 = wire100[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (({(((wire30 == wire27) ? $unsigned((8'h9e)) : wire64) ?
              {wire126, wire124[(3'h6):(1'h0)]} : $signed((wire127 ?
                  (8'haa) : wire77)))} ^ wire28))
        begin
          if (((reg75 ? $signed($signed((~&wire33))) : wire64[(3'h4):(2'h3)]) ?
              ($unsigned((|(wire98 == reg74))) ?
                  (wire126[(4'h9):(1'h1)] ?
                      ((^~(8'haa)) & (!(7'h41))) : reg69[(2'h2):(2'h2)]) : wire126) : $signed(wire62)))
            begin
              reg128 <= {(reg75[(2'h2):(1'h0)] ?
                      {reg71[(4'he):(1'h0)]} : ({wire127} | (-(reg75 ?
                          wire126 : wire31))))};
              reg129 <= (reg70[(3'h5):(2'h3)] != {wire35,
                  (({wire126} ? (reg71 ? wire127 : wire100) : {wire36}) ?
                      $signed((wire98 & reg76)) : ({reg72, wire98} ?
                          reg67[(4'h9):(1'h0)] : wire30[(3'h5):(1'h1)]))});
              reg130 <= (!(^wire32[(1'h1):(1'h1)]));
              reg131 <= (^~$unsigned(reg74[(4'h8):(1'h1)]));
              reg132 <= (^~{(+$unsigned((reg71 ? wire29 : reg128)))});
            end
          else
            begin
              reg128 <= wire30[(1'h1):(1'h1)];
              reg129 <= wire34;
            end
          reg133 <= $signed((!$unsigned({reg131})));
          reg134 <= ((8'ha0) ?
              wire25 : (~^{$unsigned((+reg132)), $signed($signed((8'hb4)))}));
          reg135 <= (^(($unsigned(wire77) ?
              wire26[(3'h4):(3'h4)] : $unsigned($unsigned((8'hb9)))) - reg67));
          reg136 <= $unsigned(wire62[(3'h7):(3'h5)]);
        end
      else
        begin
          if (($unsigned($signed($unsigned($unsigned(reg133)))) ?
              (wire127 || (~^$unsigned({reg134}))) : $signed($unsigned({wire34[(1'h0):(1'h0)]}))))
            begin
              reg128 <= (~wire100[(2'h3):(2'h2)]);
            end
          else
            begin
              reg128 <= reg75[(5'h10):(3'h5)];
              reg129 <= wire28;
              reg130 <= ((^$unsigned(($unsigned(reg130) >= reg132))) ?
                  (|reg134[(4'h9):(3'h6)]) : wire65[(4'he):(4'hb)]);
            end
          reg131 <= (((~&$unsigned((wire64 ? wire31 : (8'ha6)))) ?
                  wire25 : wire36[(4'ha):(4'h9)]) ?
              (8'haa) : ((7'h42) <= wire37));
          reg132 <= (~reg133[(2'h3):(2'h3)]);
          reg133 <= $unsigned((|(({reg134} ?
              reg69[(2'h2):(1'h1)] : $signed((8'haf))) - wire28)));
        end
      reg137 <= $unsigned(reg131[(4'he):(1'h1)]);
      if (((!reg73[(4'h9):(2'h2)]) ?
          {((+$signed(reg137)) | $signed((wire29 && (8'ha5))))} : $unsigned((8'hb2))))
        begin
          if (((reg130[(3'h6):(1'h0)] * wire26[(4'hc):(2'h3)]) ?
              (-wire98[(4'ha):(2'h3)]) : $unsigned($signed(($signed(wire30) ?
                  ((8'hb9) ? wire77 : reg67) : (8'hb6))))))
            begin
              reg138 <= $signed(wire28);
              reg139 <= {{{$unsigned((8'hbf))}},
                  (~^$unsigned($signed((+reg132))))};
              reg140 <= wire126;
              reg141 <= ((^~$signed(reg131[(3'h6):(3'h6)])) ?
                  (($signed({(8'ha3)}) ?
                          reg129[(4'hb):(3'h5)] : ($unsigned(wire124) ?
                              (wire33 ?
                                  wire29 : reg70) : reg136[(4'h8):(3'h7)])) ?
                      wire25 : $unsigned(wire77)) : (-{($signed(reg131) ?
                          reg133[(2'h3):(2'h3)] : (wire77 ? (8'h9e) : reg72)),
                      $unsigned((!wire26))}));
              reg142 <= (8'hbf);
            end
          else
            begin
              reg138 <= ((^~((reg137 + {(8'hb8), reg142}) > ((8'hb2) ?
                  (~^reg134) : ((8'ha5) ? reg68 : reg76)))) ^ ((~|reg70) ?
                  (reg76 ?
                      wire31[(4'ha):(3'h5)] : ((reg70 > wire32) ?
                          (wire27 ?
                              wire100 : (8'hba)) : $signed(wire28))) : ((reg131 ?
                          (8'ha3) : $signed(wire25)) ?
                      $signed((wire31 ? reg138 : reg75)) : (+wire37))));
              reg139 <= $unsigned(wire98[(3'h7):(3'h5)]);
              reg140 <= ((wire77 ?
                  reg72 : (wire77[(1'h1):(1'h0)] ?
                      $signed(reg137) : $signed((wire29 ^ reg137)))) - $unsigned(reg137[(1'h1):(1'h1)]));
              reg141 <= (+(((~^$signed((8'hb2))) ?
                  wire77 : $signed((wire124 ?
                      reg66 : reg137))) <<< wire62[(4'h8):(1'h0)]));
            end
          reg143 <= {({wire62} >= (~((reg135 ? wire34 : wire124) ?
                  $signed((8'hb6)) : $signed(reg138))))};
          reg144 <= $signed($unsigned(((reg142[(3'h7):(3'h6)] ?
              $signed(reg70) : reg138) - $unsigned((reg140 ?
              reg142 : wire98)))));
          reg145 <= wire64[(1'h1):(1'h0)];
        end
      else
        begin
          reg138 <= reg138;
          reg139 <= $signed((~|{reg71, (wire25 | wire64[(4'he):(4'h8)])}));
          reg140 <= (|wire25);
          reg141 <= reg131;
          reg142 <= reg67[(4'ha):(3'h4)];
        end
      reg146 <= reg140;
      if ({reg67[(1'h1):(1'h0)]})
        begin
          reg147 <= ($signed(reg131) != (~|(~reg68[(1'h1):(1'h1)])));
        end
      else
        begin
          reg147 <= $unsigned($signed(reg142));
          reg148 <= wire33;
          reg149 <= $unsigned($signed((({(8'hbc)} ?
                  (wire27 ? wire127 : reg147) : (wire98 ? (7'h43) : wire65)) ?
              (~|((8'hbe) + reg69)) : ({reg71} || (reg140 ?
                  (8'ha6) : wire29)))));
        end
    end
  assign wire150 = $signed($signed(reg68));
  assign wire151 = ($signed((({reg128, reg72} ?
                           wire127[(4'h8):(2'h2)] : $signed(wire29)) ?
                       (wire28 << $signed(reg73)) : ($signed(wire64) ?
                           (~&reg139) : $unsigned((8'ha8))))) | wire25[(1'h0):(1'h0)]);
endmodule

module module101  (y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire105;
  input wire signed [(4'hb):(1'h0)] wire104;
  input wire [(5'h15):(1'h0)] wire103;
  input wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire106 = wire104;
  assign wire107 = (((!$unsigned($unsigned(wire104))) >>> {wire105[(3'h7):(1'h1)]}) && $unsigned($signed(wire103[(5'h15):(4'h9)])));
  assign wire108 = (((-(!(wire102 ?
                       wire107 : wire102))) ~^ wire105[(2'h3):(1'h0)]) ^ $signed($signed((~|((8'hb5) >> wire107)))));
  assign wire109 = wire106[(3'h6):(3'h6)];
  assign wire110 = $signed((^~wire103));
  assign wire111 = (~&(wire110 ?
                       (($signed(wire107) ?
                               wire110[(3'h5):(1'h1)] : (wire103 - wire107)) ?
                           wire107[(4'hd):(4'hc)] : $unsigned((wire106 ?
                               wire110 : (8'hb6)))) : $unsigned((wire105 ?
                           $unsigned(wire102) : $signed(wire102)))));
  assign wire112 = $signed(wire103[(3'h4):(2'h3)]);
  assign wire113 = ((&(|wire112[(2'h2):(1'h1)])) || $signed(($unsigned((wire111 ^~ wire110)) ?
                       (((8'ha2) ?
                           wire107 : wire102) ^ $unsigned(wire107)) : {(wire110 ?
                               wire107 : wire103),
                           wire104})));
  always
    @(posedge clk) begin
      reg114 <= wire108[(2'h2):(1'h0)];
      if (((-(&wire111)) ?
          (wire105[(1'h1):(1'h1)] ^ $unsigned(wire111)) : (8'ha7)))
        begin
          reg115 <= (($signed((wire106 ?
                  {wire110, wire106} : $signed(wire111))) ?
              (~&($signed(wire106) ^~ (wire113 * (8'hbe)))) : wire111[(2'h2):(1'h0)]) >> wire110[(4'h8):(4'h8)]);
          reg116 <= wire108;
          reg117 <= wire105;
          if ((($signed((reg117[(2'h3):(2'h2)] << {wire110})) ?
                  {{(!(8'hb5))}, wire106} : $unsigned(wire111[(1'h1):(1'h1)])) ?
              wire105 : ($unsigned(wire102[(3'h4):(1'h0)]) <= ((!$unsigned((7'h42))) ?
                  $unsigned($signed(wire113)) : reg114))))
            begin
              reg118 <= ($unsigned(wire109[(4'ha):(1'h1)]) || reg117);
              reg119 <= $unsigned($unsigned(($signed(wire106) ^ ($unsigned(wire113) ?
                  $signed((8'hb0)) : $signed(reg117)))));
              reg120 <= $signed((~|$unsigned($signed(wire110))));
              reg121 <= ((&((~&wire108[(4'hd):(4'hd)]) ?
                  {(wire110 | wire112)} : $unsigned(wire103))) == reg115);
            end
          else
            begin
              reg118 <= wire105[(3'h6):(1'h0)];
              reg119 <= $unsigned($signed($unsigned($unsigned((~^(7'h40))))));
              reg120 <= (((($signed(reg115) ?
                          $unsigned(wire106) : wire105[(3'h7):(1'h0)]) <= (~^((8'h9c) ?
                          wire105 : wire111))) ?
                      wire106[(4'h9):(1'h0)] : (((wire105 ? wire113 : wire110) ?
                          reg115 : (wire102 >= reg118)) == wire102[(1'h0):(1'h0)])) ?
                  $signed($unsigned(($signed((8'hb9)) ?
                      (wire108 - reg119) : $signed(reg118)))) : $signed(reg118[(1'h0):(1'h0)]));
              reg121 <= reg115[(3'h7):(3'h5)];
              reg122 <= $unsigned($unsigned($signed({wire111[(4'hc):(4'h8)]})));
            end
          reg123 <= $signed($unsigned(wire105));
        end
      else
        begin
          reg115 <= $unsigned(reg119);
        end
    end
endmodule

module module78  (y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire83;
  input wire signed [(3'h4):(1'h0)] wire82;
  input wire [(4'he):(1'h0)] wire81;
  input wire [(3'h4):(1'h0)] wire80;
  input wire [(2'h2):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire84 = ($signed(wire82[(2'h2):(2'h2)]) - wire83);
  assign wire85 = wire81;
  assign wire86 = (~|$unsigned($signed($signed($unsigned(wire80)))));
  assign wire87 = (~^(8'ha9));
  assign wire88 = {wire83[(2'h3):(1'h0)], (7'h44)};
  assign wire89 = (((wire80[(1'h1):(1'h1)] && (~wire86)) ?
                      wire86[(3'h6):(2'h2)] : (wire79 ?
                          wire84[(1'h0):(1'h0)] : (wire80[(3'h4):(2'h3)] >= wire79))) << $unsigned($signed(((wire82 ?
                      wire81 : wire79) >> wire82))));
  assign wire90 = (-((wire80[(3'h4):(3'h4)] ^ ((wire80 ?
                      wire89 : wire82) <<< wire88[(3'h4):(1'h0)])) <= $unsigned((wire81[(1'h0):(1'h0)] ?
                      wire80 : ((8'ha8) ? (7'h44) : wire85)))));
  always
    @(posedge clk) begin
      reg91 <= wire80;
      reg92 <= reg91[(4'ha):(2'h3)];
      reg93 <= (~^$unsigned((-$signed((wire88 ~^ wire83)))));
    end
  always
    @(posedge clk) begin
      reg94 <= {wire89};
    end
  assign wire95 = $unsigned($signed($signed({(wire88 ? reg91 : wire88)})));
  assign wire96 = $signed($unsigned((reg93[(4'hd):(4'hb)] ?
                      (wire88 >> (&reg92)) : $signed(wire83[(1'h1):(1'h1)]))));
  assign wire97 = (wire90 ?
                      $unsigned($unsigned($signed((reg93 ^~ (8'h9c))))) : ((8'hbf) ^ $unsigned($unsigned(wire82[(2'h3):(1'h1)]))));
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire42;
  input wire [(3'h4):(1'h0)] wire41;
  input wire [(3'h5):(1'h0)] wire40;
  input wire signed [(5'h11):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire45,
                 wire44,
                 wire43,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire43 = $unsigned({(wire42 ?
                          wire39[(4'ha):(3'h7)] : $unsigned(wire41)),
                      (+(-$signed(wire42)))});
  assign wire44 = $unsigned(($unsigned($unsigned({wire41,
                      (8'ha8)})) <<< $unsigned(wire40)));
  assign wire45 = wire43[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg46 <= wire43;
      if (wire40)
        begin
          reg47 <= (wire42[(4'ha):(4'h8)] ~^ ((wire45 ?
              ((wire43 ?
                  wire45 : wire41) & wire41[(1'h1):(1'h1)]) : (+(+reg46))) >> ($unsigned(wire45) ?
              ($signed(wire42) ?
                  (wire43 ?
                      wire39 : wire43) : (wire41 <<< wire42)) : (8'hbc))));
          if ($signed(wire43[(2'h2):(2'h2)]))
            begin
              reg48 <= (wire45 ?
                  ((wire45[(2'h3):(2'h2)] || ((wire39 >> wire39) > (wire43 ?
                          wire42 : wire44))) ?
                      $unsigned(wire42[(4'h8):(2'h2)]) : wire42) : {$unsigned(wire40)});
              reg49 <= $unsigned(reg46);
              reg50 <= wire39;
            end
          else
            begin
              reg48 <= ((reg48[(3'h6):(3'h4)] < reg46) ?
                  $unsigned(wire39[(3'h6):(1'h1)]) : ((wire43 ?
                      (7'h43) : (wire44 ?
                          (wire40 | wire44) : (^~wire43))) || reg49[(1'h1):(1'h0)]));
              reg49 <= ((wire45 ?
                      $signed($signed((+reg46))) : {($signed(reg46) ?
                              wire40 : (wire43 || wire45))}) ?
                  wire44 : (7'h41));
              reg50 <= ((wire41 ?
                  $unsigned(((wire39 ?
                      reg47 : reg46) < $signed(wire41))) : (-$signed(reg48[(4'h8):(3'h6)]))) >> (($signed(reg49[(3'h5):(2'h3)]) + ((wire43 == wire41) ?
                  wire44 : (reg49 ?
                      wire40 : reg50))) <<< wire43[(2'h3):(1'h1)]));
            end
          reg51 <= reg50[(3'h4):(3'h4)];
          if ({reg46})
            begin
              reg52 <= ({(8'ha9)} ^ reg49[(4'ha):(4'ha)]);
              reg53 <= wire40;
              reg54 <= wire40;
              reg55 <= {$unsigned($signed((~(reg53 ^~ reg47)))),
                  $signed(({(wire43 - wire43)} < $signed(reg54)))};
            end
          else
            begin
              reg52 <= {(wire42 << $signed(reg53)), $unsigned((&reg50))};
              reg53 <= $unsigned(reg52);
              reg54 <= ($unsigned((((|reg55) ?
                          $unsigned((8'ha5)) : (~(8'h9d))) ?
                      (reg53 << reg49[(1'h1):(1'h0)]) : $unsigned($unsigned(wire44)))) ?
                  reg55 : reg50[(3'h4):(2'h2)]);
            end
        end
      else
        begin
          reg47 <= wire42[(5'h10):(4'he)];
        end
      reg56 <= {wire39, reg54[(1'h0):(1'h0)]};
      reg57 <= (+(+($unsigned((wire39 || reg52)) | ((^~wire44) > (reg50 & wire39)))));
    end
  assign wire58 = {{wire45[(1'h0):(1'h0)], (8'hb8)},
                      (($signed((reg47 ? wire42 : reg57)) ?
                              ($unsigned((8'hab)) << (reg48 == wire42)) : wire41) ?
                          reg53 : ($unsigned(wire43) ?
                              ((&wire39) != (&wire45)) : ((wire43 ?
                                  reg50 : (8'hbc)) >>> {reg51})))};
  assign wire59 = {reg52,
                      {wire43,
                          {($unsigned(reg47) ? reg54 : reg53),
                              ((reg48 | reg49) >= (!wire41))}}};
  assign wire60 = ((-reg56[(1'h0):(1'h0)]) ?
                      $unsigned(({{wire42,
                              (8'ha6)}} - $unsigned(wire40))) : $unsigned((((~|wire59) <= wire59) ?
                          reg56 : (reg53[(4'hc):(4'h8)] ?
                              (reg56 & reg53) : (wire44 <= reg56)))));
  assign wire61 = $unsigned(wire40);
endmodule
