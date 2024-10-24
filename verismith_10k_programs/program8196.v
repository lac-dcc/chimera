module top
#(parameter param125 = (8'h9d), 
parameter param126 = ((((-{param125, (8'hb8)}) ? ((param125 != param125) >>> (-param125)) : ((param125 ? param125 : (7'h42)) >= (^param125))) ? param125 : {{(param125 ? param125 : param125)}}) ? (&param125) : (-((~^{param125}) || (&param125)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire108,
                 wire107,
                 wire106,
                 wire100,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire4 = (($signed(($unsigned(wire0) ?
                         $signed(wire2) : (wire0 ?
                             wire2 : (8'hb9)))) + (!{(wire3 < wire3)})) ?
                     wire1[(2'h3):(2'h3)] : (~&wire2));
  assign wire5 = $signed(wire0);
  assign wire6 = (($unsigned(wire0) - (-$signed((wire2 ^ wire0)))) ?
                     (-({(wire4 + wire3), $unsigned(wire5)} ?
                         wire0 : (wire3 ?
                             wire3[(2'h2):(1'h1)] : wire5))) : (^wire1[(4'hb):(3'h4)]));
  assign wire7 = {$unsigned($signed(((^wire1) >> (wire6 && wire2))))};
  assign wire8 = wire1;
  module9 #() modinst101 (.wire13(wire0), .y(wire100), .wire10(wire5), .clk(clk), .wire12(wire1), .wire11(wire8));
  always
    @(posedge clk) begin
      reg102 <= (wire8[(1'h0):(1'h0)] ?
          ($unsigned(wire3[(4'hf):(4'h9)]) < $unsigned(wire6)) : (($signed((^~wire8)) ?
              $unsigned(wire2[(4'h8):(1'h1)]) : wire8) == (8'ha7)));
      reg103 <= $unsigned(wire3);
      reg104 <= (wire7 & (($unsigned(wire1) >> wire4[(4'h8):(3'h5)]) ?
          $unsigned($unsigned((8'ha0))) : wire6[(5'h12):(4'h9)]));
      reg105 <= reg104;
    end
  assign wire106 = wire6;
  assign wire107 = $signed(((((wire5 * reg103) == $unsigned((8'hb7))) <= $signed((|wire1))) ?
                       (~|$signed(wire3[(5'h12):(3'h7)])) : (8'ha6)));
  assign wire108 = reg104;
  always
    @(posedge clk) begin
      reg109 <= reg102[(2'h2):(1'h0)];
      if ($unsigned(wire3[(5'h11):(1'h0)]))
        begin
          reg110 <= $unsigned($signed(wire6));
          reg111 <= {(~|$unsigned(reg105[(3'h5):(2'h3)])),
              reg109[(4'hb):(3'h7)]};
        end
      else
        begin
          if (((-($unsigned($unsigned((8'hb9))) ?
              $unsigned(wire4) : reg110[(1'h0):(1'h0)])) <<< (~^$unsigned((8'haa)))))
            begin
              reg110 <= {($signed({wire1}) ?
                      reg111[(2'h2):(1'h1)] : ($unsigned(wire107[(1'h0):(1'h0)]) ?
                          wire107 : wire2)),
                  $unsigned((^(~&(^reg103))))};
            end
          else
            begin
              reg110 <= $signed(($unsigned(wire7[(4'hc):(3'h6)]) & wire7[(4'ha):(3'h6)]));
              reg111 <= ((~$signed(wire1)) < ((((reg110 ^ (8'ha7)) >>> $unsigned((8'haf))) ?
                  {(8'hab),
                      (~&reg105)} : ($signed(reg102) && (~&wire7))) && (|(^wire108[(1'h0):(1'h0)]))));
              reg112 <= (~|reg105[(3'h5):(3'h5)]);
              reg113 <= wire7[(3'h5):(2'h3)];
              reg114 <= wire108[(1'h1):(1'h0)];
            end
          reg115 <= (($signed(($unsigned(reg114) ?
                  reg114[(3'h4):(1'h0)] : $signed(reg112))) >>> $unsigned((reg104[(1'h0):(1'h0)] ?
                  wire108[(4'hb):(3'h5)] : $signed(reg104)))) ?
              (~((reg111[(3'h7):(2'h2)] ? {wire6} : (8'haf)) ?
                  wire7 : $signed($unsigned(reg112)))) : $unsigned(((!wire106[(4'h9):(2'h2)]) ~^ ($unsigned(reg114) && (~^reg110)))));
          reg116 <= (+$signed(reg109[(2'h2):(2'h2)]));
          if ($signed({$signed(reg111),
              (reg111[(4'hf):(1'h0)] > ($signed(wire0) || {wire100, wire2}))}))
            begin
              reg117 <= ((^wire6) != $signed(wire108[(3'h7):(2'h2)]));
              reg118 <= reg115;
              reg119 <= ((-(wire107[(3'h7):(1'h1)] ?
                  reg113[(5'h15):(3'h5)] : $signed(wire6))) * (~|$unsigned((reg104 ?
                  (^~reg114) : wire7[(5'h10):(3'h6)]))));
            end
          else
            begin
              reg117 <= ($unsigned(reg109[(5'h14):(5'h12)]) ?
                  (-$signed(reg110)) : (^($signed((reg119 ? wire3 : wire2)) ?
                      ((^~wire107) ? (8'hba) : (|reg105)) : $signed(reg117))));
              reg118 <= {({wire3[(1'h0):(1'h0)], $unsigned($unsigned(reg112))} ?
                      ($signed((reg115 - reg116)) >= $signed(((8'hb4) || wire0))) : reg111)};
              reg119 <= (~^(|(!wire0[(4'hf):(4'hf)])));
              reg120 <= (reg115 * $signed((reg103[(2'h2):(1'h1)] || {(reg113 ?
                      wire108 : reg118),
                  reg116[(4'hf):(4'h8)]})));
              reg121 <= {($unsigned((^~((7'h41) ?
                      reg109 : reg120))) >> {{$unsigned(reg118),
                          (reg116 * (8'hbf))},
                      $unsigned({(8'hb1)})}),
                  $signed(($signed($signed(reg119)) ?
                      wire1 : {$signed(reg119)}))};
            end
        end
      reg122 <= (($unsigned((reg103[(3'h4):(1'h0)] ?
              $unsigned(reg116) : $signed(reg121))) - (~|reg114[(2'h2):(1'h0)])) ?
          reg117 : (~^($signed(reg115) > ({wire1} >= (8'hb8)))));
    end
  assign wire123 = $signed(wire4);
  assign wire124 = (!reg114[(5'h10):(4'hd)]);
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire40,
                 wire39,
                 wire22,
                 wire21,
                 wire15,
                 wire14,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire14 = $signed((~{wire10}));
  assign wire15 = (^~wire12[(4'ha):(3'h6)]);
  always
    @(posedge clk) begin
      reg16 <= ((^~(!((wire12 >>> wire10) ?
          ((8'hbe) ?
              wire14 : wire10) : (wire15 & wire13)))) != wire13[(4'hf):(3'h7)]);
      reg17 <= $signed(wire10);
      if (({wire14} ?
          (|($signed((-wire11)) ?
              wire15[(4'ha):(3'h4)] : $signed((-wire15)))) : $signed((^$unsigned($signed(wire15))))))
        begin
          reg18 <= wire11;
        end
      else
        begin
          reg18 <= ((wire15 & {(|$signed(reg16)),
              (|((8'hb1) ? wire11 : (8'ha8)))}) > (((8'ha3) ?
              $signed($signed(wire13)) : wire14) | $signed($unsigned((reg17 ?
              wire11 : reg17)))));
        end
      reg19 <= $signed((($unsigned({(8'hb8)}) ?
          ({wire10, (8'hb2)} ?
              (reg17 ? (7'h42) : (7'h43)) : $signed(wire10)) : ((^~wire11) ?
              $unsigned(wire10) : (~&reg16))) & {{$signed(wire13),
              (wire13 * reg17)}}));
      reg20 <= wire10;
    end
  assign wire21 = $signed($unsigned((+{reg19, (reg20 && wire11)})));
  assign wire22 = {reg19[(2'h2):(2'h2)], (!wire13[(2'h2):(2'h2)])};
  always
    @(posedge clk) begin
      if ((wire12 | ({((wire14 > reg18) ?
              $signed((8'haa)) : (reg16 ?
                  (8'hbf) : reg17))} ^ {($unsigned(reg18) ?
              (wire11 << reg17) : {(8'ha4)})})))
        begin
          reg23 <= $unsigned({(~^$unsigned($unsigned(wire11))),
              ((reg18[(1'h1):(1'h0)] - $signed(wire15)) == {(wire14 ?
                      reg19 : reg16),
                  (reg16 ? reg16 : reg20)})});
          reg24 <= wire21;
        end
      else
        begin
          reg23 <= $signed($unsigned((reg20 ?
              (^~(8'hbd)) : $unsigned($unsigned(wire22)))));
        end
      reg25 <= $signed(((7'h41) <<< $signed(reg16[(4'h8):(3'h4)])));
      reg26 <= wire13;
      if (reg26[(5'h10):(4'h8)])
        begin
          reg27 <= (8'hbe);
        end
      else
        begin
          reg27 <= ((7'h43) ^~ (wire11 ?
              (^((reg26 + (8'hbe)) ?
                  (reg24 >>> (8'hbb)) : {(7'h43), reg20})) : wire10));
          reg28 <= {($unsigned(((reg25 & reg23) ?
                      (reg25 * reg19) : $unsigned(reg20))) ?
                  ($signed(reg20[(1'h1):(1'h0)]) == wire14) : reg23),
              reg24[(1'h1):(1'h1)]};
        end
    end
  always
    @(posedge clk) begin
      if (((|$signed((reg24 >> {wire22}))) >>> wire22[(2'h2):(1'h0)]))
        begin
          reg29 <= {$signed({reg17[(2'h3):(2'h2)]})};
          reg30 <= (~$signed((^~(reg24[(4'hd):(1'h1)] | $signed(wire13)))));
          if ((+(wire21 ? (+$signed((reg19 < (8'h9e)))) : reg29)))
            begin
              reg31 <= {wire22[(3'h4):(2'h3)]};
              reg32 <= $unsigned($unsigned(((!reg17) ?
                  wire11[(2'h2):(2'h2)] : {reg29[(4'ha):(2'h3)],
                      $unsigned(wire12)})));
              reg33 <= wire11[(1'h1):(1'h0)];
              reg34 <= ($signed(((&(reg17 ?
                      reg31 : reg25)) ~^ reg26[(1'h1):(1'h1)])) ?
                  {(|wire22[(1'h1):(1'h0)])} : $signed((($unsigned(reg33) ?
                      (reg18 ? wire10 : wire10) : (reg18 ?
                          wire13 : reg20)) ~^ $signed($unsigned(wire14)))));
              reg35 <= $unsigned($unsigned(reg27));
            end
          else
            begin
              reg31 <= wire11;
            end
          reg36 <= (reg18 - (~&$signed($unsigned((~reg19)))));
        end
      else
        begin
          reg29 <= wire21[(3'h6):(2'h2)];
        end
      reg37 <= ((wire12 ?
          {((reg32 >>> wire11) ~^ (reg34 ? reg23 : reg17)),
              $unsigned(wire10)} : (($unsigned((8'ha3)) ~^ (~^reg16)) ?
              (8'hab) : ((reg27 ? wire21 : reg33) > (wire12 ?
                  wire21 : wire22)))) > $unsigned((8'hae)));
      reg38 <= (^reg28[(2'h2):(2'h2)]);
    end
  assign wire39 = reg37;
  assign wire40 = $unsigned((!((~|(~^(8'h9c))) || reg16)));
  module41 #() modinst54 (.wire42(reg26), .clk(clk), .wire44(reg29), .y(wire53), .wire45(reg28), .wire43(reg33));
  assign wire55 = wire21[(4'hc):(3'h6)];
  assign wire56 = reg30;
  assign wire57 = {($unsigned(((reg25 <<< reg33) ?
                          wire22 : (wire13 ~^ (8'h9c)))) > ($signed($unsigned(wire12)) > $signed((7'h43))))};
  assign wire58 = (reg31 * $signed($signed($signed((|reg16)))));
  assign wire59 = (({$signed((^wire22))} >> $unsigned(wire39)) ?
                      reg35 : wire53[(2'h3):(2'h2)]);
  module60 #() modinst93 (.wire61(wire12), .clk(clk), .wire64(reg36), .y(wire92), .wire63(reg33), .wire62(wire22));
  assign wire94 = $signed($signed($signed(reg32)));
  assign wire95 = (((~&(|wire94)) ^~ wire13[(4'he):(2'h3)]) & $signed(wire53));
  assign wire96 = ((|(((wire94 ? wire39 : (8'ha7)) ?
                      ((8'ha2) ?
                          wire15 : reg18) : $signed(wire15)) | {$unsigned(wire58)})) | (reg35 ?
                      ({reg19[(2'h2):(1'h1)], {wire21, wire94}} ?
                          reg38 : {$unsigned(wire95),
                              (reg38 ?
                                  (7'h40) : wire53)}) : ($unsigned(wire13[(3'h6):(2'h3)]) >= {((8'haf) | reg31)})));
  assign wire97 = $signed((!reg18));
  assign wire98 = (!reg25[(3'h4):(3'h4)]);
  assign wire99 = ($unsigned(reg24[(3'h7):(3'h5)]) < $unsigned(reg18[(1'h0):(1'h0)]));
endmodule

module module60
#(parameter param90 = ({((((8'hac) ? (7'h41) : (7'h44)) ? ((8'h9f) <<< (8'hb3)) : {(8'hbc)}) ^ (((8'ha4) ? (8'hb2) : (8'ha8)) ? ((7'h43) ? (8'hbb) : (8'hb6)) : ((8'hac) ? (8'ha3) : (8'ha9)))), ({{(8'hb1)}} + (((8'hba) < (7'h44)) << ((8'hae) ^~ (8'hb8))))} ? (~|(({(8'hbf)} ? (8'ha5) : {(8'haa), (8'ha6)}) >>> {((7'h41) | (7'h41))})) : (^{(~|(8'ha9)), (((8'h9f) >= (8'ha4)) || ((7'h43) ^~ (8'ha9)))})), 
parameter param91 = (^(8'hb9)))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire64;
  input wire signed [(4'hb):(1'h0)] wire63;
  input wire signed [(2'h3):(1'h0)] wire62;
  input wire [(4'h9):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire84,
                 wire81,
                 wire80,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg86,
                 reg83,
                 reg82,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire65 = (wire64[(1'h1):(1'h0)] ? wire63[(2'h3):(1'h0)] : wire62);
  assign wire66 = ((&(wire65[(1'h1):(1'h1)] ?
                      ($unsigned(wire62) >>> (-(8'ha4))) : (wire64[(3'h4):(2'h3)] && (wire63 ?
                          wire64 : (8'hbc))))) - wire64);
  assign wire67 = ($signed((~^(~$unsigned(wire61)))) ?
                      (^~$signed($unsigned(wire61))) : wire63);
  assign wire68 = wire65;
  assign wire69 = $signed((($signed($signed(wire61)) ?
                      $signed($signed(wire61)) : $unsigned((~|wire61))) == $signed(($unsigned(wire64) ^ $unsigned(wire67)))));
  assign wire70 = wire69[(5'h10):(3'h7)];
  always
    @(posedge clk) begin
      reg71 <= $signed(((~($unsigned((7'h43)) ?
          (!wire68) : (wire61 ?
              wire66 : wire63))) && $unsigned((wire61[(4'h9):(1'h0)] ?
          (wire63 - wire69) : (wire63 & (8'hb4))))));
      reg72 <= wire66[(1'h1):(1'h1)];
      if ((((~^$unsigned(wire61)) >>> $unsigned(($signed(reg71) ?
          $signed(wire69) : (+wire68)))) || $signed($unsigned((+(wire70 <<< reg71))))))
        begin
          reg73 <= (wire63[(3'h7):(2'h3)] > ($signed(wire70) <<< ((!$signed(wire62)) && {wire69[(2'h2):(1'h1)]})));
        end
      else
        begin
          if ($unsigned(reg71))
            begin
              reg73 <= (8'hae);
              reg74 <= wire69[(4'hd):(4'hb)];
              reg75 <= $unsigned($unsigned(((~&(wire61 != wire63)) ?
                  wire63[(4'hb):(4'h9)] : $unsigned((wire70 ?
                      wire61 : wire69)))));
              reg76 <= ($unsigned(reg74[(1'h0):(1'h0)]) ?
                  ($signed(wire68) ?
                      ((+$unsigned(wire70)) ?
                          (~(wire65 || wire68)) : ((!wire70) - (wire66 ?
                              wire66 : wire67))) : $signed((wire66 ?
                          (&(8'ha8)) : wire70[(4'h9):(3'h7)]))) : $signed((&(^$unsigned((8'haf))))));
            end
          else
            begin
              reg73 <= wire64;
            end
          reg77 <= wire69;
          reg78 <= wire64;
          reg79 <= $signed($unsigned($unsigned((8'ha4))));
        end
    end
  assign wire80 = $signed(($signed(((wire61 + reg75) || (wire67 ?
                      reg75 : (8'hb8)))) << ($signed($signed(wire65)) & ($unsigned(wire67) ?
                      wire65[(2'h2):(1'h0)] : $signed(reg77)))));
  assign wire81 = {(wire63[(3'h4):(3'h4)] ?
                          wire63 : $signed($unsigned(reg71)))};
  always
    @(posedge clk) begin
      reg82 <= ((~^(reg77 < {(wire67 | reg75)})) ?
          reg75 : (wire70 | $signed(wire69[(4'hd):(3'h4)])));
      reg83 <= $unsigned({reg73[(4'ha):(3'h5)]});
    end
  assign wire84 = {wire65[(3'h5):(1'h0)], (~^wire67)};
  assign wire85 = ($unsigned($unsigned(reg76[(3'h4):(1'h0)])) >>> reg73[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg86 <= (|wire64);
    end
  assign wire87 = (wire66 ~^ reg71);
  assign wire88 = reg72;
  assign wire89 = reg86;
endmodule

module module41  (y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire45;
  input wire signed [(3'h5):(1'h0)] wire44;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire [(5'h13):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  assign y = {wire52, wire51, wire50, wire49, wire48, wire47, wire46, (1'h0)};
  assign wire46 = ($signed(wire45) ?
                      ((^wire44[(3'h5):(1'h1)]) ?
                          wire45[(3'h7):(3'h5)] : $signed({wire45,
                              wire45[(2'h2):(1'h1)]})) : $signed($unsigned($unsigned({wire44,
                          wire43}))));
  assign wire47 = ((wire44[(3'h4):(2'h2)] ?
                          $signed(wire44[(2'h2):(1'h0)]) : wire43) ?
                      {{$unsigned((wire43 ~^ wire43))},
                          (~^((!wire46) ?
                              $unsigned(wire43) : $signed(wire46)))} : (~|(wire46[(1'h0):(1'h0)] + $unsigned((wire46 ?
                          wire46 : wire45)))));
  assign wire48 = (-(wire47 != (8'h9d)));
  assign wire49 = (wire43[(1'h1):(1'h0)] ?
                      {($unsigned((8'hba)) << ((wire48 ~^ wire46) ?
                              $unsigned(wire44) : {wire45}))} : (wire44[(3'h5):(2'h3)] ?
                          (wire48[(4'h8):(1'h1)] ?
                              {$unsigned(wire47),
                                  (wire43 ?
                                      wire46 : wire48)} : wire47[(3'h6):(3'h6)]) : (wire45 ?
                              (-$signed(wire46)) : (wire44[(3'h4):(1'h0)] ?
                                  {wire46} : $unsigned(wire45)))));
  assign wire50 = wire43[(2'h2):(2'h2)];
  assign wire51 = $signed(((({(8'hac), wire44} ? wire47 : $signed(wire50)) ?
                          wire44 : ((+wire46) ^ ((8'hb0) ? wire46 : wire47))) ?
                      wire46[(3'h4):(1'h0)] : wire45));
  assign wire52 = (+(wire42 ^~ ({wire46} ?
                      (-{wire45, wire47}) : wire46[(3'h5):(2'h3)])));
endmodule
