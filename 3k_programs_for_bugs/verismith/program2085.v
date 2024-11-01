module top
#(parameter param156 = ((({{(8'ha9)}} ? (((7'h44) && (8'h9f)) ~^ ((8'hb5) & (8'hb8))) : (((8'hbd) == (8'hb5)) * (~&(8'h9e)))) || (|{((8'ha5) ? (8'ha7) : (8'ha7)), ((8'hbf) ? (8'hb7) : (8'ha8))})) ? (((8'hbb) ? {{(8'ha9), (8'ha8)}} : (&(&(8'hb7)))) & (+(!(-(8'ha6))))) : (((^{(8'hb3)}) <<< (!((8'hbd) || (8'hb4)))) ? ((&(~(7'h41))) ? ((^(8'hb7)) ? (8'ha7) : (~^(8'ha4))) : (((7'h41) || (8'hb0)) ? (~&(7'h40)) : ((8'hb5) ? (8'hbb) : (7'h42)))) : ((~^(~|(8'hb4))) ~^ {((8'hac) ? (8'hb1) : (8'hbe))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire155;
  wire [(4'h9):(1'h0)] wire154;
  wire [(5'h15):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire150;
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire59,
                 wire61,
                 wire150,
                 (1'h0)};
  module4 #() modinst60 (.wire7(wire1), .y(wire59), .wire6(wire3), .wire8(wire0), .wire5(wire2), .clk(clk), .wire9((8'ha0)));
  assign wire61 = $signed((8'hab));
  module62 #() modinst151 (.wire67(wire2), .y(wire150), .wire64(wire59), .wire65(wire0), .wire66(wire3), .wire63(wire61), .clk(clk));
  assign wire152 = {((8'hb0) > (wire61 ?
                           (^~wire150[(4'hb):(1'h1)]) : wire0[(2'h3):(2'h3)])),
                       $unsigned($unsigned($unsigned($signed(wire61))))};
  assign wire153 = ((wire150 ? wire1 : wire61) <= {(8'hbe),
                       wire1[(4'he):(3'h5)]});
  assign wire154 = wire61[(2'h2):(1'h1)];
  assign wire155 = wire154[(2'h3):(1'h1)];
endmodule

module module62
#(parameter param148 = (({({(7'h42)} ^~ ((8'ha2) ? (8'hb9) : (8'hb9))), ((+(8'hbb)) ? ((8'hbb) & (8'hb5)) : {(8'ha8), (8'ha9)})} ? ((((8'had) && (8'haa)) ? (8'hbd) : ((8'ha5) ? (8'hbf) : (8'h9c))) + {((8'hbd) ? (8'hb3) : (7'h43)), ((8'ha0) ? (8'ha9) : (8'ha3))}) : (-(8'ha5))) || {(8'ha2), ({((8'hb9) << (7'h40)), ((8'ha6) ? (7'h40) : (8'hbf))} ? (((8'ha0) ? (8'hbb) : (8'haa)) ? ((8'ha7) ? (8'h9f) : (8'hbe)) : (~&(8'hae))) : {(-(8'ha9)), {(8'hae)}})}), 
parameter param149 = ({(~&({param148, param148} ? param148 : (param148 ? (7'h43) : param148))), {{(param148 ? param148 : param148)}, (&(param148 ? param148 : param148))}} ? {(((param148 & (8'ha6)) ? (param148 ? param148 : param148) : param148) ? (param148 ? (^~(8'hbc)) : (|param148)) : (-((8'haf) && param148)))} : (({(param148 ^~ param148)} ? (^(param148 ? param148 : param148)) : (param148 ? param148 : param148)) | (8'hb1))))
(y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire66;
  input wire signed [(4'h9):(1'h0)] wire65;
  input wire [(4'hc):(1'h0)] wire64;
  input wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire146;
  wire [(2'h3):(1'h0)] wire145;
  wire signed [(5'h12):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire143;
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire117,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire143,
                 reg68,
                 reg69,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg68 <= wire64[(4'hb):(1'h0)];
      reg69 <= ((~&(wire63[(3'h6):(3'h5)] || {$unsigned(wire65),
          $unsigned(wire64)})) & wire63[(3'h7):(1'h0)]);
    end
  module70 #() modinst118 (.wire72(wire63), .wire73(wire67), .wire74(reg68), .clk(clk), .wire71(wire65), .y(wire117));
  assign wire119 = ($unsigned({((wire67 ? reg68 : reg69) ?
                           $signed(wire67) : {wire67})}) >= (~$signed(((~wire67) - (^wire66)))));
  assign wire120 = (|{$signed(wire64[(4'h8):(1'h0)]), (~$signed(wire67))});
  assign wire121 = (|$unsigned($unsigned(wire67[(3'h6):(3'h6)])));
  assign wire122 = wire120;
  module123 #() modinst144 (wire143, clk, wire66, wire117, wire119, wire120, wire63);
  assign wire145 = ({{$unsigned(wire66), wire65[(1'h1):(1'h0)]}} || (7'h40));
  assign wire146 = wire145[(2'h3):(2'h3)];
  assign wire147 = ((($unsigned({wire117}) ?
                               wire143[(1'h1):(1'h1)] : wire63[(4'hc):(1'h0)]) ?
                           ($unsigned($signed(wire119)) >> wire64[(3'h5):(2'h2)]) : (&($signed(wire119) ?
                               (wire117 ?
                                   wire121 : (8'hbd)) : $signed(wire120)))) ?
                       (wire143 >>> ((wire117[(3'h6):(3'h4)] ?
                               $unsigned((8'hbc)) : {wire145, wire64}) ?
                           (wire122[(5'h12):(2'h3)] <<< wire65) : $unsigned(((8'h9d) ?
                               reg68 : wire145)))) : $signed((!wire66[(4'hc):(4'hc)])));
endmodule

module module4
#(parameter param58 = ({(-(8'ha0))} ? (((((7'h41) ? (8'hba) : (8'ha5)) | (~&(8'haa))) ? (~^((8'hb0) < (8'hb1))) : (((8'ha6) ? (8'hb1) : (8'hbc)) ? ((8'ha3) ? (8'hb1) : (8'hb7)) : ((8'hbd) ? (8'hb7) : (8'ha4)))) < (~^(!(&(7'h41))))) : {(((&(8'hac)) << (~|(8'ha2))) && ((-(8'hbc)) ? ((8'hb6) >= (8'haf)) : {(8'hac)}))}))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire5;
  input wire [(3'h5):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire52;
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire52,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire10 = (-{(~|(~^(wire6 != wire6))),
                      $unsigned(((+wire7) ? (8'hab) : $signed(wire8)))});
  assign wire11 = $signed((~&wire7));
  assign wire12 = (!(wire7[(3'h7):(1'h0)] << wire10));
  assign wire13 = (!wire12);
  assign wire14 = wire6;
  assign wire15 = wire13[(1'h1):(1'h1)];
  assign wire16 = wire5;
  assign wire17 = ({wire10[(1'h1):(1'h1)],
                      ((+$signed((7'h41))) != (wire5[(2'h2):(2'h2)] ^~ wire15[(4'hd):(4'hd)]))} >= wire6[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg18 <= wire17;
      reg19 <= ($unsigned($unsigned((8'hba))) ?
          (((-(~|wire14)) - (|{wire9, wire12})) ?
              ((((8'hbc) ? wire14 : wire6) ?
                  ((8'hb4) < wire8) : (-wire8)) <= {wire11}) : ($unsigned({wire16,
                  (8'ha9)}) && {(7'h40)})) : (!wire7));
      reg20 <= (&(($signed((wire9 ?
          wire10 : reg18)) ~^ wire5) ~^ {$unsigned(wire7)}));
      reg21 <= (-$unsigned((~|{$signed(wire5)})));
    end
  assign wire22 = $signed(((((wire13 + reg21) ? wire11 : {wire11, wire13}) ?
                      $unsigned(wire9[(3'h6):(3'h4)]) : (|wire14[(1'h1):(1'h1)])) >= (8'hb1)));
  assign wire23 = ((($signed((wire13 && wire10)) * ((reg18 ? wire7 : (8'ha0)) ?
                      (wire10 ? wire22 : wire14) : {wire22,
                          wire8})) ^~ $unsigned($signed((wire12 + reg19)))) ~^ $signed((!wire5)));
  assign wire24 = $unsigned(wire23[(4'ha):(4'h9)]);
  assign wire25 = $unsigned($unsigned($signed(reg21[(1'h1):(1'h1)])));
  assign wire26 = $signed(reg20);
  module27 #() modinst53 (.wire28(wire13), .clk(clk), .wire29(wire5), .wire30(wire26), .y(wire52), .wire31(reg21));
  assign wire54 = ($signed(((~|(+reg18)) || wire5[(3'h5):(2'h3)])) ?
                      $unsigned((~&($unsigned(wire25) ?
                          $unsigned(reg21) : $unsigned(wire7)))) : ((((reg20 >= reg21) == {wire23}) ?
                              wire12 : (+reg18[(1'h1):(1'h0)])) ?
                          ({(wire17 ?
                                  wire52 : wire6)} * $unsigned($unsigned(wire26))) : ((wire7 > $unsigned(wire25)) ?
                              {((8'ha5) >>> wire16),
                                  wire17[(4'hb):(3'h4)]} : ($unsigned((8'h9e)) ?
                                  (wire5 ?
                                      wire6 : (8'h9e)) : $unsigned(wire5)))));
  assign wire55 = $signed($signed($signed($signed(wire52))));
  assign wire56 = ($unsigned((($signed(wire6) ?
                          (^wire15) : (wire14 ?
                              wire12 : wire22)) | reg18[(3'h7):(1'h1)])) ?
                      wire7[(3'h6):(3'h6)] : (~&wire13));
  assign wire57 = $unsigned($unsigned($unsigned($unsigned($signed(wire22)))));
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire signed [(4'h9):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire32;
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire32 = wire31[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg33 <= wire31;
      reg34 <= ($signed((wire30 ?
          (~^(wire29 ? wire30 : wire28)) : ($unsigned(reg33) ?
              (wire28 <<< wire32) : wire32[(4'h8):(2'h2)]))) ~^ wire30);
      reg35 <= wire31;
    end
  assign wire36 = ((wire30 | ($signed(reg34) >= wire30[(1'h0):(1'h0)])) ?
                      wire29[(3'h7):(3'h5)] : $signed({(wire29[(3'h7):(2'h2)] ^ reg33),
                          $unsigned($signed(wire30))}));
  assign wire37 = $signed($signed($unsigned($signed(wire31[(3'h6):(1'h0)]))));
  assign wire38 = $unsigned($unsigned(wire28));
  assign wire39 = {wire37[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg40 <= wire29[(4'h8):(3'h4)];
      if ((~&(({wire36} & $signed($unsigned(reg34))) ^~ (!(+(~|wire28))))))
        begin
          if (reg33)
            begin
              reg41 <= wire37[(4'ha):(4'h9)];
              reg42 <= (~|reg33[(4'ha):(2'h2)]);
              reg43 <= $signed($signed(wire31[(2'h2):(1'h0)]));
            end
          else
            begin
              reg41 <= $signed((-wire29));
            end
          reg44 <= wire38[(1'h0):(1'h0)];
        end
      else
        begin
          reg41 <= $unsigned($signed($signed((~&reg33))));
        end
      reg45 <= $signed(reg33);
      reg46 <= ($unsigned({((~&reg44) >> ((8'ha8) ^ reg34))}) > ({{$signed(reg33),
              $signed(wire30)}} * wire30));
      reg47 <= $unsigned($unsigned($unsigned(reg34[(3'h4):(2'h2)])));
    end
  assign wire48 = wire39[(4'h9):(1'h1)];
  assign wire49 = reg45;
  assign wire50 = $unsigned(reg45);
  assign wire51 = $unsigned($signed(reg40[(3'h7):(2'h2)]));
endmodule

module module123  (y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire128;
  input wire [(5'h12):(1'h0)] wire127;
  input wire [(5'h10):(1'h0)] wire126;
  input wire [(2'h3):(1'h0)] wire125;
  input wire signed [(5'h13):(1'h0)] wire124;
  wire signed [(4'he):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire133;
  wire [(3'h4):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire131;
  wire signed [(5'h15):(1'h0)] wire130;
  wire signed [(3'h4):(1'h0)] wire129;
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  assign y = {wire142,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 (1'h0)};
  assign wire129 = $unsigned($signed((wire127[(5'h12):(3'h5)] ^ ($unsigned(wire128) ?
                       wire124 : (|wire125)))));
  assign wire130 = $unsigned($signed((~(+wire124[(4'hb):(2'h3)]))));
  assign wire131 = wire125;
  assign wire132 = (^$signed({wire125[(2'h2):(1'h0)], $unsigned(wire124)}));
  assign wire133 = ($unsigned($signed($signed({(8'ha7), wire132}))) ?
                       {wire131[(1'h1):(1'h1)],
                           wire129} : (wire129[(2'h2):(1'h1)] ?
                           (wire132 ?
                               wire125[(1'h0):(1'h0)] : $unsigned(wire125[(1'h0):(1'h0)])) : {$unsigned($signed(wire131)),
                               (8'hb0)}));
  assign wire134 = {(wire129[(1'h0):(1'h0)] > $signed(wire130[(3'h5):(2'h2)]))};
  assign wire135 = wire134;
  always
    @(posedge clk) begin
      if (wire131)
        begin
          reg136 <= wire129;
          reg137 <= {{(~$signed((&reg136)))}, wire130};
          reg138 <= (~&(~$unsigned(wire128[(4'hd):(4'hb)])));
          reg139 <= (8'hb4);
          reg140 <= (&(wire129 >> $unsigned((!$signed(reg136)))));
        end
      else
        begin
          reg136 <= wire133[(1'h1):(1'h0)];
          reg137 <= ($signed(($signed($unsigned(wire124)) || ((&reg136) ?
                  $signed((7'h40)) : wire133[(1'h0):(1'h0)]))) ?
              $unsigned($signed(((reg140 << wire132) << (^~wire135)))) : {reg136,
                  $signed((~^wire128[(4'hd):(4'hd)]))});
          reg138 <= (reg137 ?
              ({$unsigned(wire133[(1'h1):(1'h1)]),
                  ($unsigned(reg139) >= wire131)} >>> (-wire131)) : (+reg137));
          reg139 <= (~$unsigned(wire135));
        end
    end
  always
    @(posedge clk) begin
      reg141 <= ($unsigned($signed($signed((wire132 ? reg137 : wire130)))) ?
          wire128 : reg140);
    end
  assign wire142 = ((reg140 == (&($unsigned(wire129) ?
                           $signed(wire135) : reg136[(3'h5):(3'h5)]))) ?
                       ($unsigned(({wire131, reg136} ?
                           wire133[(2'h3):(1'h1)] : {(8'hac),
                               (8'ha0)})) == (~&((wire125 ? wire124 : wire134) ?
                           (^wire131) : ((8'h9f) ?
                               wire125 : wire124)))) : {$unsigned((!$unsigned(wire126))),
                           (-wire129[(2'h2):(1'h0)])});
endmodule

module module70
#(parameter param115 = (((({(8'ha9)} ? ((8'ha6) ? (8'ha9) : (8'had)) : (-(8'h9d))) ? ((!(8'h9d)) | (|(8'hab))) : ({(7'h43), (8'ha4)} ? ((8'hb5) + (8'ha3)) : (!(7'h41)))) | (8'hbe)) << (((~&(&(8'h9c))) >> (-(~|(8'hbf)))) ? {(((8'had) ? (8'ha2) : (7'h40)) ~^ ((8'h9f) >>> (8'hac)))} : (((-(8'had)) ~^ (~(8'had))) >= {((7'h44) ? (8'ha6) : (8'had)), ((7'h40) << (8'hae))}))), 
parameter param116 = param115)
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire74;
  input wire [(3'h7):(1'h0)] wire73;
  input wire signed [(4'h9):(1'h0)] wire72;
  input wire signed [(4'h9):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire110,
                 wire109,
                 wire89,
                 wire88,
                 wire87,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg112,
                 reg111,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire75 = wire74[(2'h2):(1'h0)];
  assign wire76 = {$unsigned($unsigned(wire74[(4'h9):(1'h0)])),
                      $unsigned(($unsigned($signed(wire71)) || ((+(7'h40)) ?
                          ((8'h9f) >> (8'ha4)) : (wire74 ? wire72 : wire71))))};
  assign wire77 = $signed($unsigned((({wire74, (8'hb5)} <<< (~(8'ha9))) ?
                      $unsigned((wire73 <= wire72)) : (8'hb2))));
  assign wire78 = (^($signed($signed($unsigned(wire72))) != $signed($signed((wire71 + wire77)))));
  always
    @(posedge clk) begin
      if (wire78[(2'h2):(1'h1)])
        begin
          reg79 <= (($unsigned(wire72[(2'h2):(2'h2)]) || (($unsigned(wire71) & (^wire78)) ?
              $signed((wire76 ~^ wire75)) : wire77[(1'h0):(1'h0)])) <<< $signed($unsigned(((wire77 ?
              wire72 : wire74) + $unsigned(wire75)))));
        end
      else
        begin
          if ((wire73 ?
              $signed({($signed(wire74) - (8'hb6))}) : $unsigned({{wire71[(4'h9):(3'h6)],
                      $signed(wire73)}})))
            begin
              reg79 <= $unsigned($signed((~^((wire73 | reg79) ?
                  (wire75 >>> wire74) : {wire78}))));
            end
          else
            begin
              reg79 <= wire73[(3'h4):(1'h1)];
              reg80 <= $unsigned($unsigned(wire73[(3'h6):(2'h3)]));
              reg81 <= ($unsigned($signed($unsigned(reg80[(3'h6):(1'h1)]))) ?
                  wire74 : (+$unsigned(($unsigned(reg80) * (^wire73)))));
              reg82 <= wire72;
              reg83 <= $signed(wire74);
            end
          reg84 <= reg82;
          reg85 <= reg81;
          reg86 <= wire71;
        end
    end
  assign wire87 = ($unsigned((({wire77} ?
                          (~|(8'hbd)) : reg84) ^ wire75[(3'h6):(3'h4)])) ?
                      (^{wire71[(2'h3):(2'h3)],
                          (~&$signed(wire71))}) : ((((wire72 ?
                              reg83 : reg80) ^ (~|wire77)) ?
                          ({wire75} - reg85) : $signed(((8'hbf) || wire74))) >= $signed(($unsigned(wire77) ?
                          reg81 : {wire71, wire75}))));
  assign wire88 = $signed(wire78[(1'h1):(1'h1)]);
  assign wire89 = $unsigned(reg86);
  always
    @(posedge clk) begin
      reg90 <= ($signed($unsigned($signed((wire78 ^ reg86)))) >>> ({$unsigned($signed(wire88))} > (^~$unsigned(((8'hbf) || reg83)))));
      reg91 <= (~&($signed(wire78[(1'h1):(1'h0)]) ?
          $signed($signed($unsigned((8'ha4)))) : $signed($signed((reg86 ?
              wire74 : reg85)))));
      if ($signed((~&(wire76[(4'hb):(4'ha)] ?
          (8'hbe) : wire72[(4'h8):(2'h3)]))))
        begin
          if ($unsigned((($signed($signed(reg82)) * $unsigned({wire71})) == ($signed((reg86 >= reg80)) ?
              wire88 : $signed(wire87)))))
            begin
              reg92 <= wire77;
            end
          else
            begin
              reg92 <= ($unsigned(($unsigned($unsigned(wire71)) ~^ wire87[(5'h12):(4'h9)])) ?
                  wire74[(3'h6):(3'h4)] : $unsigned(($signed({reg81}) ^~ (+reg90[(4'h9):(3'h4)]))));
              reg93 <= ((reg92 <<< {(wire75 ?
                      wire76 : (wire71 | reg90))}) | reg79);
              reg94 <= ({(^{(^reg91)})} << (+$unsigned((reg85[(2'h2):(2'h2)] ^~ wire73[(3'h6):(1'h1)]))));
              reg95 <= wire74[(1'h0):(1'h0)];
            end
          reg96 <= wire75[(1'h1):(1'h0)];
          if ((~(7'h43)))
            begin
              reg97 <= reg93[(2'h3):(1'h1)];
              reg98 <= ($signed(reg85) == wire71);
              reg99 <= $unsigned($signed(($signed((wire74 ^ wire78)) == wire87[(2'h3):(1'h0)])));
              reg100 <= (8'h9d);
              reg101 <= {$signed({($unsigned(reg79) || $signed(wire89)),
                      wire74[(2'h3):(1'h1)]})};
            end
          else
            begin
              reg97 <= {reg82,
                  (reg92 ?
                      reg97[(2'h2):(1'h1)] : (wire76 + $unsigned($signed(wire75))))};
              reg98 <= (((~($signed(wire78) >>> $signed((8'hbe)))) ?
                  (~{(reg82 ? reg95 : reg81),
                      (^reg98)}) : reg85[(1'h1):(1'h1)]) + (($signed($signed((8'ha1))) ?
                      ($unsigned(wire88) >>> (wire75 ?
                          wire72 : reg80)) : ((^reg82) ?
                          (~|reg94) : {wire76, (8'ha8)})) ?
                  $unsigned($signed((reg84 ? reg98 : wire71))) : (8'hb3)));
            end
        end
      else
        begin
          if ((~|((^~$signed($unsigned((8'h9c)))) ?
              wire73[(1'h0):(1'h0)] : reg98)))
            begin
              reg92 <= wire75;
              reg93 <= (^~$unsigned(reg91[(3'h5):(3'h4)]));
            end
          else
            begin
              reg92 <= ({(8'haf),
                      (reg93[(3'h4):(2'h3)] != ((reg93 >= reg94) << $unsigned(reg95)))} ?
                  (!(({(8'hac), reg100} ?
                          reg93[(1'h1):(1'h0)] : $signed(reg98)) ?
                      {wire75[(2'h3):(2'h3)]} : wire75[(3'h5):(2'h3)])) : (($signed((reg95 || reg101)) ?
                          (reg79[(2'h2):(1'h0)] ?
                              reg90[(2'h3):(2'h3)] : (reg83 ?
                                  reg91 : (7'h44))) : wire71[(3'h5):(3'h4)]) ?
                      (reg101 ?
                          (~&$signed(wire74)) : ((reg82 ~^ reg92) >> $signed(reg81))) : ($signed($signed(reg95)) != (((8'hbb) - wire89) ?
                          $signed(reg97) : wire78))));
            end
          reg94 <= (({reg81[(4'h8):(3'h7)]} ^~ (($signed((8'hb4)) && (reg84 ~^ reg95)) ?
              (^{reg97,
                  reg92}) : $unsigned($signed((8'hb3))))) | (((&wire78[(1'h0):(1'h0)]) ?
              $signed((-reg100)) : $unsigned(reg84[(3'h4):(1'h0)])) - reg93[(1'h1):(1'h0)]));
          reg95 <= reg86[(4'h9):(3'h6)];
          reg96 <= ((&(~^$signed((~^reg90)))) ~^ $signed((($unsigned((8'ha6)) ?
              $unsigned(reg101) : (~&wire78)) * (!reg94[(2'h3):(2'h2)]))));
          reg97 <= (~$unsigned($unsigned(reg85[(1'h1):(1'h1)])));
        end
      reg102 <= {reg83[(1'h1):(1'h0)], wire76[(4'h9):(3'h6)]};
      if ($unsigned($unsigned($unsigned(reg92[(1'h0):(1'h0)]))))
        begin
          if ((reg93[(2'h3):(1'h0)] ?
              $unsigned(reg99) : ((|{(reg82 ? wire75 : (8'hb7))}) ?
                  wire71 : $unsigned($signed($signed((8'ha7)))))))
            begin
              reg103 <= reg92[(4'h9):(1'h0)];
              reg104 <= ((reg80[(3'h7):(2'h3)] ?
                  $signed((8'h9f)) : $signed(wire73)) <= {((8'hbe) ?
                      ((wire75 <<< wire74) ?
                          $signed(reg82) : $signed(reg95)) : $signed($unsigned(wire75))),
                  $signed($signed((~^(8'hab))))});
              reg105 <= (((^($signed(reg94) && (^~reg99))) ?
                  {($signed(reg82) > $signed(reg81))} : {reg97[(3'h5):(3'h5)],
                      {$unsigned(reg85),
                          {reg103, reg83}}}) & reg86[(3'h4):(1'h1)]);
              reg106 <= (-reg95[(5'h12):(5'h12)]);
            end
          else
            begin
              reg103 <= {$signed((~$unsigned($signed(reg97))))};
              reg104 <= (|reg97[(3'h7):(2'h3)]);
              reg105 <= ((-$signed(($signed(reg93) != reg79[(1'h1):(1'h1)]))) ?
                  {(^(((8'had) <<< (8'hb7)) | $signed((7'h40))))} : (!(-($unsigned(reg97) >>> $signed(wire87)))));
              reg106 <= $unsigned(reg101);
              reg107 <= $unsigned($unsigned(reg93[(2'h3):(1'h1)]));
            end
          reg108 <= (^{(((-reg82) + {wire87,
                  reg100}) <<< (~^$signed(reg107)))});
        end
      else
        begin
          reg103 <= ((wire73 < ($unsigned($signed(wire77)) < $signed((~&reg97)))) ?
              (reg86 ?
                  $signed({(wire73 <<< reg90)}) : (+$unsigned((~|(8'haa))))) : reg82[(2'h2):(1'h1)]);
          reg104 <= $signed({$unsigned($signed(reg85[(1'h1):(1'h0)])),
              $signed(reg97)});
          reg105 <= $unsigned((8'h9c));
          reg106 <= (~^($signed((&(reg101 >> reg100))) ?
              $unsigned(reg80[(3'h5):(3'h5)]) : reg91[(1'h1):(1'h0)]));
        end
    end
  assign wire109 = reg107;
  assign wire110 = $unsigned($unsigned(reg86[(3'h6):(1'h1)]));
  always
    @(posedge clk) begin
      reg111 <= $unsigned($signed(($signed((reg97 ? reg93 : reg84)) ?
          (~wire71) : $unsigned(((8'ha3) ? reg91 : reg91)))));
      reg112 <= (^(wire74[(4'hf):(4'h8)] ?
          (({reg105} ?
              (reg92 || reg108) : $unsigned(reg100)) > $unsigned((-reg104))) : $unsigned((^wire88))));
    end
  assign wire113 = $unsigned($unsigned(wire110));
  assign wire114 = ((&(8'h9c)) ?
                       (wire71[(3'h7):(3'h5)] ?
                           ((~|(^~(8'ha1))) >> reg108) : reg105) : wire77[(3'h4):(1'h1)]);
endmodule
