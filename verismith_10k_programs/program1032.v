module top
#(parameter param157 = {(&{((!(8'h9f)) - (+(8'ha3)))}), ((^~((~&(8'hb1)) ? ((8'hb1) <<< (8'h9f)) : (~(7'h41)))) && (!((-(8'ha3)) != ((8'h9f) > (8'haf)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire155,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = {wire1[(1'h1):(1'h1)]};
  assign wire6 = $signed((wire4 * ($unsigned(wire0[(2'h2):(1'h1)]) ?
                     $unsigned(wire2) : (|{wire4, wire0}))));
  assign wire7 = $unsigned(wire3);
  assign wire8 = (wire1 <= wire7[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg9 <= (~&wire2);
      if (((-({$unsigned((7'h42)),
          {wire2}} < (+wire4))) + ($signed((~&(&wire7))) < wire2[(3'h5):(3'h4)])))
        begin
          reg10 <= $unsigned(wire8);
        end
      else
        begin
          reg10 <= wire5;
          reg11 <= {$unsigned(($signed({reg10,
                  (8'haf)}) * ($unsigned(wire3) >> (reg10 >>> (8'ha8))))),
              $unsigned(($signed((wire1 > wire2)) ?
                  wire0[(1'h0):(1'h0)] : reg9))};
          reg12 <= $signed(({$signed(((8'h9e) <<< wire0))} >>> (!reg10)));
          reg13 <= $unsigned($signed(wire0));
        end
      if ((({wire5, (8'ha0)} ?
          $signed((wire3 ?
              (^~wire7) : (reg10 || wire2))) : {(wire5[(4'hc):(4'h8)] ?
                  wire1[(3'h7):(3'h7)] : $unsigned(wire7)),
              $signed((wire4 && (8'hba)))}) >> (wire2[(3'h5):(2'h2)] >>> {$unsigned((wire3 ?
              wire2 : wire6))})))
        begin
          reg14 <= wire1[(4'hf):(4'h9)];
          reg15 <= (~^$unsigned(wire7[(1'h1):(1'h1)]));
          reg16 <= {wire5,
              (wire8 ?
                  ((reg15 + {wire1}) ~^ (^~$unsigned(wire5))) : ({(~|(8'ha3))} ?
                      (reg12[(1'h0):(1'h0)] | (reg9 ?
                          reg9 : (8'hbe))) : wire0))};
        end
      else
        begin
          reg14 <= reg14[(5'h12):(5'h11)];
        end
    end
  assign wire17 = $unsigned((reg12 ?
                      $signed($signed((7'h42))) : $signed({(wire5 ?
                              reg11 : reg15)})));
  assign wire18 = $unsigned((&wire0[(2'h3):(1'h0)]));
  assign wire19 = ($unsigned((-$signed({wire8}))) ?
                      wire5[(1'h0):(1'h0)] : ($signed($unsigned(reg13)) ^~ $signed(wire6)));
  assign wire20 = wire3[(1'h1):(1'h1)];
  assign wire21 = ((-($signed({reg16}) ?
                          (~&(-reg9)) : ($signed((8'hb5)) >> (reg14 | wire2)))) ?
                      (($signed(reg16[(3'h7):(3'h4)]) ?
                              (!(wire1 ? (8'hb8) : wire8)) : ((wire19 ^ wire1) ?
                                  wire4[(1'h0):(1'h0)] : (~^(8'ha1)))) ?
                          (^wire3[(1'h1):(1'h1)]) : reg15) : $unsigned($signed(((~|wire0) >> (^wire3)))));
  module22 #() modinst156 (wire155, clk, reg11, wire1, wire4, reg10);
endmodule

module module22
#(parameter param154 = (((|(((8'hbb) ? (7'h40) : (8'haa)) ~^ {(8'h9f)})) ^~ ((^~(!(8'hb7))) <<< (+(&(8'hae))))) ~^ (((((8'hb5) >= (8'h9e)) ? ((8'hb1) ^ (7'h43)) : ((8'hbd) ~^ (8'had))) ? (^~(8'hb2)) : (((8'hac) ? (8'ha5) : (8'ha9)) >>> ((8'hbf) ? (8'h9d) : (8'hb5)))) >= ({((8'hb1) - (8'h9e)), ((8'ha2) ? (8'haa) : (8'hae))} * ((~&(8'haf)) ^ ((8'hbd) >= (8'hb3)))))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  input wire [(4'hc):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire signed [(4'hc):(1'h0)] wire151;
  wire [(3'h6):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire125;
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire148,
                 wire147,
                 wire146,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire101,
                 wire60,
                 wire58,
                 wire103,
                 wire104,
                 wire105,
                 wire125,
                 reg150,
                 reg149,
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
                 reg61,
                 reg62,
                 reg63,
                 (1'h0)};
  module27 #() modinst59 (.wire30(wire24), .y(wire58), .clk(clk), .wire31(wire23), .wire28(wire26), .wire29(wire25));
  assign wire60 = (wire26[(3'h4):(1'h0)] <= ($signed($unsigned($signed(wire23))) ?
                      (^wire23) : ($signed((&wire26)) | $unsigned((+(8'hac))))));
  always
    @(posedge clk) begin
      reg61 <= (wire26 ? {((!$signed((7'h43))) ^~ wire23)} : wire58);
      reg62 <= $unsigned(wire26[(4'h9):(1'h1)]);
      reg63 <= $signed($unsigned((8'ha6)));
    end
  module64 #() modinst102 (wire101, clk, wire23, wire26, reg63, reg61, wire25);
  assign wire103 = $unsigned((($unsigned({wire60, wire60}) ?
                       (~|reg62) : ((wire26 ~^ wire60) ?
                           $signed(wire23) : (^~wire60))) ^ $signed(wire23[(4'h8):(2'h2)])));
  assign wire104 = (!$signed(wire23[(2'h2):(1'h1)]));
  assign wire105 = (~&wire25);
  module106 #() modinst126 (wire125, clk, wire103, wire24, wire25, reg61);
  assign wire127 = {{reg62,
                           ({(reg62 ? wire26 : wire60),
                               (|wire24)} < reg61[(4'hd):(2'h2)])},
                       $signed($unsigned($signed(reg63[(3'h7):(2'h3)])))};
  assign wire128 = ({wire23[(4'hb):(4'hb)], wire127} ?
                       (reg62[(2'h2):(1'h1)] ?
                           {$unsigned($signed(wire60)),
                               (~&((8'hb4) ?
                                   reg62 : wire101))} : wire105[(2'h2):(2'h2)]) : wire60[(1'h0):(1'h0)]);
  assign wire129 = ($unsigned(($signed((^~(8'hb8))) ?
                       $signed((+wire58)) : (|(~|wire60)))) ^~ wire26[(2'h3):(2'h2)]);
  assign wire130 = $signed($unsigned((($unsigned(wire26) << $unsigned((8'h9e))) || ($unsigned(reg63) > $signed((8'hbc))))));
  assign wire131 = $signed({($unsigned((wire60 << wire26)) + ($unsigned(wire101) ^~ (wire101 ?
                           (8'h9e) : (8'ha2))))});
  assign wire132 = $signed({$unsigned(wire26[(5'h11):(3'h4)]),
                       ((~^(~|wire105)) != (wire127 ?
                           (^wire127) : (wire128 ? reg62 : wire101)))});
  always
    @(posedge clk) begin
      if (wire132[(4'h8):(1'h0)])
        begin
          if ((wire58 + {(wire23[(2'h2):(1'h1)] ?
                  {(wire25 & wire23), (~reg62)} : $signed({wire128})),
              $signed(reg61[(3'h5):(3'h5)])}))
            begin
              reg133 <= wire105[(3'h5):(3'h5)];
              reg134 <= (^$signed($signed(({reg63,
                  wire58} == $unsigned((8'ha8))))));
              reg135 <= wire127;
            end
          else
            begin
              reg133 <= wire26;
            end
          reg136 <= (wire26[(4'hb):(4'hb)] ?
              (wire23[(3'h7):(3'h4)] >>> wire104) : ($signed((((8'h9f) >= (8'hb4)) != (wire132 ?
                  wire105 : (8'hb1)))) & wire60));
          reg137 <= reg134[(3'h4):(2'h3)];
          reg138 <= (((wire104[(3'h7):(3'h5)] || (^~(&(8'hba)))) != ($signed($signed((8'hb1))) ?
                  $signed($unsigned(reg137)) : wire104)) ?
              $signed($signed(reg135)) : reg61);
          if ((8'hbf))
            begin
              reg139 <= {reg136,
                  ($signed($unsigned($unsigned(wire132))) * $signed((((8'ha0) ?
                          wire129 : wire132) ?
                      ((8'haf) ?
                          (7'h44) : wire103) : wire129[(4'he):(4'he)])))};
              reg140 <= ($unsigned(reg62) ?
                  {{(reg134 >= (wire23 ?
                              (8'hb9) : wire105))}} : reg63[(2'h2):(1'h1)]);
              reg141 <= $signed(reg139);
              reg142 <= $unsigned((-$unsigned({$unsigned(reg61)})));
              reg143 <= (((reg140 ? reg141 : ((reg141 >>> (8'h9d)) | wire103)) ?
                  $unsigned(wire23[(4'ha):(4'h9)]) : {{reg62}}) > $unsigned({{$signed(wire129),
                      reg61}}));
            end
          else
            begin
              reg139 <= reg133;
              reg140 <= ($unsigned((8'hb2)) ?
                  wire103[(1'h0):(1'h0)] : wire128[(2'h3):(1'h0)]);
              reg141 <= {((~&(~{wire104, reg63})) ?
                      $unsigned(wire128) : {$signed($unsigned((8'ha7)))}),
                  reg62};
            end
        end
      else
        begin
          reg133 <= reg140;
          if ($signed(reg136))
            begin
              reg134 <= (((|((wire58 << wire23) ?
                      (reg63 >>> reg139) : $unsigned(wire130))) != $signed($signed($unsigned((8'ha2))))) ?
                  reg135[(4'h8):(3'h4)] : $unsigned((wire127 ?
                      (~|reg135[(1'h0):(1'h0)]) : ((~wire104) ?
                          wire23[(3'h5):(2'h2)] : (~&wire23)))));
              reg135 <= ((-($signed(wire60[(4'he):(3'h5)]) ?
                      reg142 : $signed(reg140))) ?
                  $unsigned($unsigned({(~reg135),
                      reg61[(4'ha):(3'h7)]})) : (+(~^{wire103})));
              reg136 <= wire131;
              reg137 <= reg63[(4'h9):(3'h7)];
            end
          else
            begin
              reg134 <= {wire23[(2'h2):(1'h0)]};
            end
          reg138 <= reg140;
          reg139 <= {{wire105, (7'h44)}, wire58[(3'h5):(1'h0)]};
        end
      reg144 <= $signed((reg138[(4'ha):(1'h0)] - wire26));
      reg145 <= $unsigned(($unsigned(({reg135, wire132} ?
              reg139[(4'h9):(3'h4)] : (-reg142))) ?
          (|{reg142}) : (wire23[(4'h9):(4'h8)] ?
              (~&$signed((8'hb6))) : ({reg138,
                  wire132} | (wire101 - wire101)))));
    end
  assign wire146 = $signed(((&(^(wire26 ? reg143 : wire23))) ?
                       ($signed((reg135 == (8'hbf))) >> $signed(reg136)) : ($signed(((8'hbb) ?
                           wire129 : (8'ha7))) || $unsigned(wire104[(3'h6):(2'h2)]))));
  assign wire147 = reg144[(4'hd):(4'hb)];
  assign wire148 = reg137;
  always
    @(posedge clk) begin
      reg149 <= (($unsigned($signed((reg144 ? (8'had) : reg136))) ?
              reg135 : (reg62 ? (~wire24) : reg139[(3'h7):(3'h4)])) ?
          ($unsigned((&(wire24 ? reg142 : wire105))) ?
              ($unsigned(reg144) ?
                  (wire60 ?
                      (~|wire101) : $unsigned((8'hb6))) : reg138) : wire131) : $unsigned((~^reg145[(4'hd):(3'h4)])));
      reg150 <= (reg62[(3'h4):(3'h4)] ?
          ((8'h9f) * {((wire60 ? reg61 : reg145) ?
                  (wire103 ? wire105 : wire103) : (reg143 <= (8'hb6))),
              ($unsigned(wire60) - $signed(wire104))}) : wire129);
    end
  assign wire151 = $unsigned(wire128[(4'h8):(2'h2)]);
  assign wire152 = (($signed($unsigned($signed(wire130))) >> wire131[(4'h8):(3'h6)]) ?
                       reg63 : ($unsigned({{wire151, wire128},
                               $unsigned(wire23)}) ?
                           {{{reg142}, reg137[(3'h6):(1'h0)]},
                               (^~reg62)} : (~|$unsigned(wire26))));
  assign wire153 = $unsigned((({(&reg144)} ^ $unsigned($unsigned(wire60))) ?
                       (+$unsigned(wire58)) : (((reg134 && (8'hbd)) - ((8'haf) ?
                               wire101 : wire104)) ?
                           $signed((8'ha4)) : $unsigned((reg149 ?
                               reg141 : reg63)))));
endmodule

module module106  (y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire110;
  input wire [(2'h2):(1'h0)] wire109;
  input wire signed [(4'hc):(1'h0)] wire108;
  input wire signed [(4'he):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg111 <= $unsigned((~&(|$unsigned(((8'ha2) ? (7'h43) : (8'hb0))))));
    end
  always
    @(posedge clk) begin
      if ((+wire107))
        begin
          reg112 <= wire110[(4'h8):(4'h8)];
          if ($unsigned(wire109[(1'h0):(1'h0)]))
            begin
              reg113 <= reg111[(3'h6):(1'h0)];
              reg114 <= $signed($signed(($signed((7'h43)) == (!wire108[(3'h6):(3'h5)]))));
            end
          else
            begin
              reg113 <= {(reg114[(2'h3):(2'h3)] <= (8'hbc))};
              reg114 <= ((reg113 ?
                      wire110[(4'h8):(2'h3)] : (($signed((7'h41)) ?
                              (wire110 <= wire109) : {wire109}) ?
                          ($unsigned(reg113) ?
                              $unsigned((8'h9c)) : $unsigned(reg113)) : wire109[(2'h2):(1'h1)])) ?
                  reg111 : $signed(wire107[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg112 <= {((wire108 ^~ wire110) <= reg114)};
          reg113 <= ((!{(wire109 - reg112),
              reg111[(3'h4):(2'h3)]}) << ((&((reg111 >> reg113) ?
                  $unsigned(wire107) : (reg111 != reg114))) ?
              $unsigned({(wire108 ? reg113 : reg111),
                  (reg111 != reg111)}) : $unsigned({wire108})));
          reg114 <= reg111;
        end
      reg115 <= (^(wire108 < $signed($signed($unsigned((8'hb6))))));
      reg116 <= (reg115[(5'h11):(1'h1)] ?
          $unsigned(reg114) : wire107[(4'he):(2'h3)]);
      if ({$signed($signed((~&(|wire108)))),
          {({wire110[(4'hc):(4'h9)], wire108} >>> (~|(reg115 ?
                  reg116 : reg113))),
              ((~&reg115[(2'h2):(2'h2)]) ?
                  $unsigned($signed(reg113)) : $unsigned((7'h43)))}})
        begin
          reg117 <= (~wire110);
          reg118 <= (~|wire108);
          reg119 <= (wire110 ?
              (reg114[(2'h3):(1'h1)] < (($unsigned(reg112) <<< {(8'hbe),
                      reg116}) ?
                  (reg113[(1'h1):(1'h1)] ? reg113 : (8'hb0)) : ((wire107 ?
                      reg116 : wire110) | reg115))) : ((8'hbf) & $unsigned({(8'ha7)})));
        end
      else
        begin
          reg117 <= ((~^$signed($signed($signed(reg114)))) * reg116);
        end
      reg120 <= {reg114, (-(reg113 == $unsigned($signed(reg118))))};
    end
  assign wire121 = {$unsigned($signed(($unsigned(reg111) ?
                           (!reg111) : reg117)))};
  assign wire122 = (($signed((reg117 ? wire108 : wire107[(4'h8):(1'h0)])) ?
                           (~^wire109) : reg113) ?
                       reg117 : {(wire109 <= $unsigned($unsigned(wire107)))});
  assign wire123 = reg116[(2'h2):(1'h0)];
  assign wire124 = (8'hb4);
endmodule

module module64
#(parameter param100 = ((~(!(((8'hbe) == (8'hb1)) >>> (&(8'hb4))))) ? (((-(8'haa)) ? ({(8'hba)} ? (-(8'hb6)) : (~|(8'ha0))) : (((8'ha7) != (8'hbb)) ? ((7'h40) <<< (8'hbb)) : ((8'ha5) >= (8'hbc)))) ? (((^(8'hb8)) < (~(8'hb5))) ? (^~((8'hb5) ? (8'hb7) : (8'haa))) : ((^~(8'ha8)) ? ((8'hba) & (8'ha8)) : ((8'h9d) || (8'ha9)))) : (8'hb2)) : {{(((8'hb5) < (8'ha3)) ? ((8'h9d) * (8'hbd)) : {(8'hb9)}), (~^((8'ha1) ? (8'hbd) : (8'hbb)))}, ((8'hb6) << (((8'hb6) != (8'h9c)) <= ((8'hb1) ? (8'hae) : (8'ha3))))}))
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire69;
  input wire [(4'h8):(1'h0)] wire68;
  input wire [(4'h8):(1'h0)] wire67;
  input wire signed [(3'h6):(1'h0)] wire66;
  input wire signed [(5'h13):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire91,
                 wire90,
                 wire84,
                 wire83,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire70 = (8'hb0);
  assign wire71 = (^($unsigned($signed($unsigned(wire65))) <= wire65));
  assign wire72 = $signed(wire67);
  assign wire73 = $signed(wire66);
  assign wire74 = wire71;
  assign wire75 = ($signed(((~^(wire69 ? wire68 : wire73)) ?
                      (|(wire74 ? wire66 : wire67)) : (8'hba))) >> wire70);
  assign wire76 = (+((~^(wire65[(4'h8):(1'h0)] ?
                      (wire65 & wire68) : $signed((8'hb7)))) | wire75));
  assign wire77 = wire75[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg78 <= (wire73 & wire68[(3'h6):(2'h3)]);
      reg79 <= wire69;
      reg80 <= wire77[(2'h2):(1'h0)];
      reg81 <= $unsigned(wire70[(2'h2):(2'h2)]);
      reg82 <= (+(($signed((~^wire66)) ?
          $signed($unsigned(wire69)) : {wire72[(3'h6):(3'h6)],
              (reg80 ? (8'ha7) : reg78)}) ^ $signed({{wire67, wire68}})));
    end
  assign wire83 = {$signed(wire76[(5'h10):(4'h8)]),
                      ((!wire73) ^~ $signed({wire70[(3'h7):(3'h7)]}))};
  assign wire84 = $unsigned(($unsigned(({reg79, wire83} ?
                          wire70[(1'h1):(1'h1)] : $unsigned(wire71))) ?
                      ((+$signed(wire72)) ?
                          wire67[(2'h2):(1'h1)] : $unsigned((wire65 ?
                              wire66 : (8'hab)))) : wire66));
  always
    @(posedge clk) begin
      reg85 <= $signed(($signed($signed((~|wire73))) ~^ $signed({{wire72}})));
      reg86 <= (((wire65[(4'he):(3'h7)] <<< $unsigned((wire71 ?
              wire65 : wire70))) ?
          $unsigned((((8'ha4) ? wire75 : wire84) ?
              $signed((8'hb0)) : (wire70 ?
                  wire77 : wire66))) : wire76[(4'ha):(1'h0)]) + (({(wire74 ?
                  wire76 : wire71)} && $unsigned((-reg78))) ?
          {{$signed(wire83)}, reg80[(3'h5):(2'h2)]} : wire74[(3'h6):(3'h4)]));
      reg87 <= (8'hb4);
      reg88 <= {((($signed(reg80) ? {wire68, wire73} : wire74) ?
              $signed((wire74 >> reg80)) : reg79) + $unsigned(reg81))};
      reg89 <= wire73[(3'h4):(2'h2)];
    end
  assign wire90 = wire70;
  assign wire91 = $signed(wire72[(4'h8):(2'h2)]);
  always
    @(posedge clk) begin
      reg92 <= reg86;
      reg93 <= (((~&(8'h9c)) ~^ wire83[(1'h1):(1'h0)]) <<< $signed($unsigned($signed((wire69 >= (8'ha7))))));
      if (wire66)
        begin
          reg94 <= reg81;
          reg95 <= {((({reg92, wire70} ? wire84 : wire68) ?
                  {$unsigned((8'ha9)), (&reg86)} : {wire83,
                      $unsigned(reg79)}) ~^ (reg92 ?
                  (~(wire71 > reg82)) : (~$signed((8'hbe))))),
              (($signed((reg92 << wire72)) * wire75) ?
                  ((reg81[(1'h0):(1'h0)] ?
                      $signed(reg87) : {reg79}) * reg85) : (wire77[(1'h0):(1'h0)] ?
                      wire77[(2'h3):(1'h1)] : (~$signed(reg78))))};
        end
      else
        begin
          reg94 <= (({((wire75 + wire76) <<< ((7'h40) ? reg82 : reg95)),
                  (~|$signed(reg79))} ?
              $unsigned($signed($signed(reg88))) : $unsigned(wire90[(4'he):(4'hb)])) * reg81[(4'hc):(1'h0)]);
          reg95 <= {$unsigned(((^~reg80[(4'h8):(2'h3)]) + ($signed(reg93) ?
                  (wire76 >= wire71) : (wire83 != wire71)))),
              ((reg78 <<< (!(wire76 == reg95))) <<< ((~^$unsigned(wire67)) ^~ reg89[(1'h0):(1'h0)]))};
        end
    end
  assign wire96 = $unsigned((reg87[(2'h2):(1'h1)] << (wire66 < $unsigned((&reg87)))));
  assign wire97 = $signed(wire83);
  assign wire98 = wire68[(3'h4):(1'h0)];
  assign wire99 = {($signed(((wire70 >>> reg94) << (wire68 == wire70))) >> (^{(~|reg87)})),
                      (wire71[(2'h2):(2'h2)] <<< reg92[(3'h5):(2'h2)])};
endmodule

module module27
#(parameter param56 = {(&{((~&(8'hb4)) ? (8'had) : {(8'h9f), (8'hbb)}), {((8'ha0) ? (8'hb3) : (8'hb1)), ((8'ha4) <= (8'hb5))}})}, 
parameter param57 = (~{(((param56 <<< (8'h9d)) && (param56 <<< param56)) >>> (&param56))}))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire31;
  input wire [(4'hc):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire32 = ((~&wire31) ?
                      ((^($signed(wire31) ?
                              (wire29 ? wire29 : wire29) : (~wire28))) ?
                          wire31 : (~&(~(wire31 | wire29)))) : wire30);
  assign wire33 = $signed({wire31[(2'h2):(2'h2)]});
  assign wire34 = (($signed($unsigned((+wire29))) ?
                          {(wire31[(4'hc):(4'h9)] ?
                                  (wire28 * wire32) : (wire28 ?
                                      wire28 : wire30)),
                              (wire29 != $unsigned(wire33))} : wire33) ?
                      (($signed(wire30[(3'h4):(1'h1)]) && wire28) ?
                          ((|wire28) == $unsigned((wire31 + (7'h44)))) : {wire32}) : ($signed((~|(wire31 ^ wire32))) || $unsigned($signed((wire28 ?
                          wire31 : wire32)))));
  assign wire35 = {wire29,
                      (({$unsigned((8'hb5)),
                              (|wire31)} ^ (wire29[(3'h5):(2'h3)] || wire31)) ?
                          $unsigned((~|((8'hb1) ?
                              wire34 : wire33))) : wire32[(3'h7):(2'h2)])};
  assign wire36 = (wire31 < ($signed($signed((wire32 >= (8'ha9)))) ?
                      wire33 : $signed((&$signed(wire33)))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((^$unsigned((wire36 ? (8'h9e) : (8'hb4)))))))
        begin
          reg37 <= (8'hbc);
        end
      else
        begin
          reg37 <= (wire34 ? wire30[(4'h9):(3'h6)] : wire34);
          reg38 <= (({wire35[(4'h8):(2'h3)], (7'h44)} ?
                  (!$unsigned(wire33)) : (!({wire31, wire30} ?
                      (wire28 ~^ (8'hb5)) : (+(8'hbc))))) ?
              $unsigned(($unsigned((wire33 <<< (7'h43))) ^ ($unsigned(reg37) ?
                  wire31[(4'h9):(2'h2)] : wire28))) : wire30);
        end
    end
  assign wire39 = wire36;
  assign wire40 = (+(7'h43));
  always
    @(posedge clk) begin
      if ((wire29[(3'h6):(2'h2)] ?
          (+((^~$signed(wire29)) - (wire30 != wire28[(2'h2):(2'h2)]))) : $unsigned(wire29[(1'h0):(1'h0)])))
        begin
          if ((wire29[(4'h9):(3'h7)] ?
              $signed(((!$signed(wire28)) ?
                  wire34 : $unsigned((~&wire36)))) : (~|($unsigned({wire29}) * ($unsigned(wire30) <<< $signed(wire36))))))
            begin
              reg41 <= (|($signed($signed(wire36)) || wire32[(4'h9):(4'h9)]));
              reg42 <= {reg37[(3'h7):(2'h3)], wire29[(1'h1):(1'h0)]};
              reg43 <= ($unsigned(wire33) ?
                  $unsigned({(|wire35)}) : reg38[(1'h1):(1'h0)]);
            end
          else
            begin
              reg41 <= reg41[(3'h7):(3'h6)];
              reg42 <= wire36[(4'hf):(1'h0)];
            end
          if ({wire29,
              (reg42 ^ (reg41 << ((wire35 || reg38) ?
                  {wire35, wire32} : (wire29 ? reg41 : reg37))))})
            begin
              reg44 <= ((7'h44) ? (~|(^reg37[(1'h0):(1'h0)])) : $signed(reg42));
              reg45 <= wire30;
              reg46 <= wire39[(3'h5):(3'h4)];
              reg47 <= ((((+(wire33 & reg42)) < wire29[(4'hb):(3'h6)]) ?
                  $unsigned(reg41) : reg41[(3'h7):(3'h4)]) && reg43[(2'h3):(2'h2)]);
            end
          else
            begin
              reg44 <= $unsigned(($unsigned($signed(wire29[(2'h2):(1'h1)])) ^ (wire36 ?
                  (~&reg45) : reg42)));
            end
          reg48 <= $signed({((8'hb5) ? reg38 : $signed(wire31))});
          if (($unsigned($signed((!{wire33}))) ?
              reg48 : (&(($signed(wire31) ?
                      (reg47 == (8'ha9)) : $unsigned(reg44)) ?
                  reg48 : (+(reg47 ? reg41 : reg38))))))
            begin
              reg49 <= $unsigned({(((reg44 ? reg45 : wire31) < {reg43,
                      (8'hbe)}) != wire33),
                  wire28[(2'h2):(2'h2)]});
              reg50 <= $unsigned($signed(wire30[(3'h7):(2'h3)]));
              reg51 <= wire35[(3'h5):(3'h4)];
              reg52 <= (|wire32[(4'h9):(3'h5)]);
            end
          else
            begin
              reg49 <= wire31[(4'hb):(3'h4)];
              reg50 <= ({reg47[(4'hf):(4'h9)]} ? wire39 : reg41[(2'h2):(1'h0)]);
              reg51 <= wire36[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg41 <= (reg51 && ((-(reg52[(3'h6):(1'h0)] >>> (wire40 ?
              (8'ha5) : reg47))) ^~ reg43));
          reg42 <= (!wire32[(3'h7):(1'h1)]);
          reg43 <= $unsigned($unsigned({$unsigned((reg47 <= (8'hae)))}));
        end
      reg53 <= wire32[(3'h7):(1'h0)];
      reg54 <= ($unsigned($signed((^(reg49 - wire34)))) ?
          ((&reg42[(1'h1):(1'h0)]) ?
              (((wire30 <<< (8'hb6)) < $signed(reg47)) ?
                  $signed((~&reg50)) : reg46) : {((reg49 > reg47) ?
                      $signed(wire33) : (wire36 << wire36)),
                  wire40}) : (~$unsigned($signed($unsigned(wire34)))));
      reg55 <= $signed(wire36[(4'ha):(3'h5)]);
    end
endmodule
