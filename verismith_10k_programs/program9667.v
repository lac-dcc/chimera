module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire184;
  wire [(5'h14):(1'h0)] wire183;
  wire signed [(2'h2):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire177;
  wire signed [(3'h7):(1'h0)] wire176;
  wire [(5'h15):(1'h0)] wire175;
  wire signed [(5'h15):(1'h0)] wire174;
  wire [(5'h12):(1'h0)] wire172;
  wire [(4'hf):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire179;
  wire signed [(3'h4):(1'h0)] wire180;
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire182,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire172,
                 wire28,
                 wire16,
                 wire14,
                 wire179,
                 wire180,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  module4 #() modinst15 (wire14, clk, wire2, wire3, wire0, wire1, (7'h40));
  assign wire16 = $signed((^$unsigned($signed($unsigned(wire14)))));
  always
    @(posedge clk) begin
      reg17 <= wire14[(3'h7):(2'h3)];
      reg18 <= (!$unsigned((!(wire1 ?
          $signed((7'h44)) : ((8'hb4) == wire16)))));
      if (wire2)
        begin
          reg19 <= ($signed(reg17) ?
              $signed((wire3[(4'hd):(4'h8)] ?
                  (-wire2[(3'h4):(1'h0)]) : $unsigned($signed(wire0)))) : reg17[(4'hf):(2'h3)]);
          reg20 <= ($signed((reg19 ~^ (wire16 ?
              wire1[(3'h6):(2'h3)] : {(8'hb1)}))) - {(-(~&$signed(reg17))),
              (^~reg19)});
          reg21 <= ($unsigned(({{wire2, reg17}, {wire3}} ?
              wire0 : reg19)) | (^$unsigned((8'hbb))));
          if (reg20[(1'h1):(1'h1)])
            begin
              reg22 <= $unsigned((^~{(wire3[(4'h9):(3'h5)] >> $signed(reg19))}));
              reg23 <= ($signed((wire2 ?
                      (~^$signed(wire16)) : ((!reg19) == (wire1 ?
                          reg18 : wire14)))) ?
                  $signed(reg22[(3'h4):(2'h2)]) : $unsigned(($unsigned(reg21) & {{reg21,
                          reg19},
                      (~reg22)})));
            end
          else
            begin
              reg22 <= reg22[(4'h8):(4'h8)];
              reg23 <= $unsigned(reg21[(1'h1):(1'h0)]);
              reg24 <= reg21;
              reg25 <= wire14;
              reg26 <= (&reg25);
            end
        end
      else
        begin
          reg19 <= ((((-$unsigned((8'ha1))) ? reg26 : reg21[(1'h0):(1'h0)]) ?
              wire16 : (($unsigned(wire2) | $signed(wire16)) ~^ wire0[(3'h5):(1'h1)])) == wire16[(3'h5):(2'h3)]);
        end
      reg27 <= $signed($signed((reg25 ^ $unsigned($signed(reg21)))));
    end
  assign wire28 = $signed((reg25 ?
                      (($unsigned(wire1) > (&reg24)) == reg21) : (((-reg22) ?
                          reg17 : $unsigned((8'ha3))) <= (reg18 ?
                          (reg17 & (8'hb9)) : {reg21, (7'h42)}))));
  module29 #() modinst173 (wire172, clk, reg22, reg20, reg24, reg21);
  assign wire174 = (^(~($signed($signed(reg27)) | reg18)));
  assign wire175 = (~{(wire1 ?
                           wire14 : (wire28 ?
                               reg27 : (wire14 ? wire174 : wire174))),
                       $signed((~(~^wire16)))});
  assign wire176 = ($signed((reg23[(4'hb):(1'h1)] <= wire2)) ?
                       $signed(((wire1 ~^ $unsigned(wire175)) == (-((8'hb9) ?
                           reg23 : wire3)))) : (($signed($unsigned(reg19)) ?
                           wire2[(1'h0):(1'h0)] : (((8'had) + reg21) ?
                               {(8'ha3)} : (reg21 <<< wire172))) * $unsigned(((!wire175) ?
                           wire14[(1'h1):(1'h0)] : (wire3 & reg25)))));
  module132 #() modinst178 (.wire135(reg27), .clk(clk), .y(wire177), .wire137(wire172), .wire133(wire28), .wire134(wire14), .wire136(reg21));
  assign wire179 = (^~wire172[(4'hd):(3'h7)]);
  module29 #() modinst181 (wire180, clk, wire14, reg26, wire175, wire16);
  assign wire182 = $unsigned(wire14);
  assign wire183 = $signed($unsigned((~&$signed((~^reg20)))));
  assign wire184 = reg20;
endmodule

module module29
#(parameter param170 = (((({(8'haf), (8'h9f)} != {(8'hb1), (8'ha9)}) ? ((+(8'ha7)) * (8'hbb)) : {((8'ha0) + (8'ha3)), ((8'ha3) > (7'h40))}) >> ({((8'ha2) ? (8'h9e) : (7'h40)), (&(8'hb5))} ~^ (((8'ha8) == (8'hbd)) ? {(8'hae), (8'hbf)} : {(8'hb6)}))) ? ((!(((8'hb5) * (8'ha0)) ? (!(8'hba)) : (^(8'hb4)))) > ({{(8'haf), (8'ha3)}, (+(8'had))} ? (~^((8'hb3) - (7'h44))) : ({(8'hbd), (8'hb4)} | ((8'h9c) - (8'ha3))))) : ({(((8'ha1) - (8'hb8)) <<< ((8'ha8) * (8'ha2)))} >= (~(-{(8'hab), (8'hb0)})))), 
parameter param171 = (({{param170}, {(param170 + (8'ha1))}} & (&(8'ha9))) ? (~param170) : ((((param170 >> param170) ? (param170 ^~ param170) : param170) << ((param170 ? param170 : param170) && (param170 << param170))) ? (^((param170 & (8'hb2)) >= (!param170))) : (!param170))))
(y, clk, wire30, wire31, wire32, wire33);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire31;
  input wire [(3'h7):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire166;
  wire [(5'h15):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire164;
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire50,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire73,
                 wire77,
                 wire78,
                 wire94,
                 wire96,
                 wire128,
                 wire130,
                 wire131,
                 wire164,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire34 = (^~(!($signed($unsigned(wire30)) == wire32)));
  assign wire35 = wire30[(3'h6):(2'h2)];
  assign wire36 = wire34;
  assign wire37 = {$signed(wire31[(5'h10):(3'h4)]),
                      ($unsigned({wire33}) ?
                          $signed(($unsigned(wire32) + (^~wire35))) : wire31)};
  module38 #() modinst51 (wire50, clk, wire30, wire36, wire31, wire34);
  assign wire52 = wire37[(1'h1):(1'h0)];
  assign wire53 = wire31[(4'hd):(4'h8)];
  assign wire54 = $signed(((^~$unsigned(wire31)) ?
                      (7'h40) : (wire35[(2'h2):(1'h1)] << wire50[(4'hb):(4'hb)])));
  assign wire55 = wire34;
  module56 #() modinst74 (.clk(clk), .wire58(wire54), .y(wire73), .wire57(wire33), .wire60(wire31), .wire59(wire35));
  always
    @(posedge clk) begin
      reg75 <= $unsigned($signed((&wire54[(4'h9):(4'h9)])));
      reg76 <= $signed((&$signed($signed((^wire54)))));
    end
  assign wire77 = wire36;
  assign wire78 = {$signed($signed($unsigned((+wire55))))};
  module79 #() modinst95 (.wire80(wire54), .clk(clk), .wire82(wire30), .wire81(wire34), .y(wire94), .wire83(wire36));
  assign wire96 = wire73[(4'hc):(1'h1)];
  module97 #() modinst129 (wire128, clk, wire96, wire36, wire73, wire33);
  assign wire130 = ($unsigned({wire35, wire37[(4'h9):(4'h8)]}) ?
                       $signed((~((^wire52) ?
                           (&wire96) : (wire35 ^~ wire50)))) : $unsigned((wire94 + wire34)));
  assign wire131 = (~wire77[(3'h4):(3'h4)]);
  module132 #() modinst165 (wire164, clk, wire131, wire53, wire130, wire77, wire31);
  assign wire166 = (wire130 ? (-wire30) : wire36);
  assign wire167 = $signed(wire78[(4'hc):(4'hc)]);
  module56 #() modinst169 (wire168, clk, wire166, wire31, wire94, wire130);
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  assign y = {wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = $signed($signed((wire8 ?
                      $unsigned(wire9) : (wire5[(4'hb):(4'hb)] ?
                          {wire7, wire6} : $signed(wire6)))));
  assign wire11 = $unsigned(wire7);
  assign wire12 = wire7;
  assign wire13 = (((wire12 - wire11) ?
                          {{(+(8'ha3)), $unsigned(wire9)},
                              (|$unsigned(wire7))} : wire12) ?
                      ($unsigned($signed(wire7[(2'h3):(1'h0)])) < {(8'ha7),
                          wire5[(3'h7):(1'h1)]}) : $signed($signed(wire6)));
endmodule

module module132
#(parameter param162 = {((|{(~|(8'ha6)), (!(7'h43))}) ? (((~|(8'hb9)) ^ {(8'hae)}) >> (((8'ha1) ? (8'ha2) : (8'haf)) ? ((7'h42) & (8'ha8)) : {(8'hae), (8'hb9)})) : (-(~|((8'had) + (8'haa))))), ({(((8'ha7) ? (8'hbd) : (8'hb2)) << ((8'h9e) | (8'hbf))), {{(7'h43), (8'hbb)}}} << (|(((8'had) <= (8'ha7)) ^ (+(8'hb7)))))}, 
parameter param163 = {(-(param162 ? {(~|param162)} : (~&(param162 ? param162 : param162))))})
(y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire137;
  input wire [(5'h11):(1'h0)] wire136;
  input wire [(5'h10):(1'h0)] wire135;
  input wire [(5'h11):(1'h0)] wire134;
  input wire signed [(4'hf):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire155;
  wire [(4'h9):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire146;
  wire [(5'h13):(1'h0)] wire145;
  wire [(3'h5):(1'h0)] wire144;
  wire signed [(5'h11):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire139;
  wire [(5'h10):(1'h0)] wire138;
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire155,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 reg158,
                 reg157,
                 reg156,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire138 = $unsigned(wire137);
  assign wire139 = wire135;
  assign wire140 = (wire137 < $signed(wire134));
  assign wire141 = $unsigned(wire135[(4'hf):(4'hd)]);
  assign wire142 = $signed(((~&$signed((8'hba))) <<< (wire141[(3'h5):(2'h3)] == $signed((wire138 ?
                       wire134 : wire133)))));
  assign wire143 = wire141;
  assign wire144 = wire136;
  assign wire145 = ({{$unsigned((wire142 >= (7'h41))),
                           $signed(wire134)}} && wire134[(3'h4):(1'h0)]);
  assign wire146 = {(wire144[(1'h0):(1'h0)] ?
                           $unsigned(wire143[(4'hb):(2'h2)]) : $unsigned($signed($signed(wire136)))),
                       wire138};
  assign wire147 = (~&$signed(wire133));
  always
    @(posedge clk) begin
      if ((wire143[(5'h10):(4'hc)] | $unsigned(((+(wire133 ?
              (8'ha7) : wire143)) ?
          wire133 : (!$unsigned(wire139))))))
        begin
          if (wire136)
            begin
              reg148 <= $unsigned({wire141[(3'h6):(3'h5)],
                  (|(!(wire138 ^ wire139)))});
              reg149 <= ($signed($unsigned(((!wire145) ?
                  (~|wire137) : wire140))) << $unsigned(wire146));
              reg150 <= {wire136[(2'h3):(1'h0)],
                  (+((~|((8'haa) ? wire140 : wire135)) > $signed((wire139 ?
                      wire134 : wire144))))};
            end
          else
            begin
              reg148 <= (wire137[(4'h9):(2'h2)] ? $signed(wire136) : wire133);
            end
          reg151 <= (~|(~&(($signed(reg149) <= wire144[(3'h5):(2'h2)]) ?
              wire143[(3'h4):(1'h1)] : wire141)));
        end
      else
        begin
          reg148 <= ((reg148 <= (wire138 > ($signed(wire133) & $unsigned(wire145)))) << wire134[(4'ha):(1'h1)]);
        end
      reg152 <= wire140;
      reg153 <= {($signed((reg151[(4'h9):(3'h6)] != $unsigned(wire143))) && ((&$unsigned(wire138)) == $signed((wire146 & wire142)))),
          $signed($unsigned({$unsigned(reg152), (|wire145)}))};
      reg154 <= (+(($signed(wire138) ?
          reg150 : wire142[(4'hb):(1'h0)]) ~^ wire133));
    end
  assign wire155 = ($signed((((reg153 <<< reg153) ^~ (~&reg153)) ^ wire137)) * $signed(wire139));
  always
    @(posedge clk) begin
      reg156 <= $unsigned((wire142[(4'hd):(4'ha)] ?
          $signed((~^(8'hbf))) : (({wire144,
              wire133} > $signed(wire137)) <= wire135[(2'h2):(2'h2)])));
      reg157 <= (reg149 ?
          {$unsigned(wire143[(4'hf):(2'h3)])} : {{$unsigned((8'had)), wire144},
              {(8'hba)}});
      reg158 <= wire141;
    end
  assign wire159 = ((($unsigned(((8'haa) ?
                       reg152 : wire145)) != $signed((|(7'h40)))) > (((!reg151) >> (reg149 ?
                       (7'h40) : reg150)) | $unsigned((~^wire136)))) - ({wire146[(3'h4):(1'h0)],
                           $signed((wire133 << reg157))} ?
                       ((reg153 << {wire146,
                           wire147}) == ($signed(wire142) - $signed(reg156))) : (((wire138 ?
                               wire141 : reg150) ?
                           (8'had) : reg158) && {(8'hb5),
                           $unsigned((8'hb3))})));
  assign wire160 = {((wire145 - (~&((8'hb2) ?
                           (8'hb8) : wire142))) ^~ {($signed(wire144) ?
                               (wire142 ? reg152 : (8'hbc)) : (reg151 ?
                                   wire134 : (8'hab)))})};
  assign wire161 = wire136;
endmodule

module module97
#(parameter param127 = ({(~^{{(8'h9d), (8'hbc)}})} ? {(({(8'hb3)} * (+(8'h9c))) & ((~(8'hb9)) ? (!(7'h44)) : (^~(8'had)))), ((8'hb8) - {((8'ha9) ? (7'h40) : (8'hb3))})} : {({(!(8'hb5))} < ({(8'ha7)} ? (+(8'ha6)) : ((8'ha8) >> (8'haf))))}))
(y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire101;
  input wire signed [(5'h10):(1'h0)] wire100;
  input wire [(5'h11):(1'h0)] wire99;
  input wire signed [(2'h2):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire119;
  wire signed [(3'h6):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire116;
  wire signed [(3'h7):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire104;
  wire signed [(5'h11):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire104,
                 wire103,
                 wire102,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg113,
                 reg112,
                 reg111,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire102 = (($signed(wire98[(1'h0):(1'h0)]) ?
                       {wire98[(2'h2):(2'h2)]} : wire99) * wire100[(1'h1):(1'h1)]);
  assign wire103 = wire100;
  assign wire104 = (~(+wire100[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg105 <= $unsigned(($signed($unsigned((wire102 || wire103))) + ({(wire101 ?
                  wire103 : wire103)} ?
          wire98 : wire101)));
      reg106 <= reg105;
    end
  assign wire107 = {wire99};
  assign wire108 = $signed(wire104);
  assign wire109 = wire104;
  assign wire110 = $unsigned({(&((^reg106) ?
                           (wire103 ? wire102 : (8'hb3)) : (-wire99))),
                       (^~(wire99[(4'he):(1'h0)] >= ((8'hbd) ?
                           reg106 : wire100)))});
  always
    @(posedge clk) begin
      reg111 <= (-((($unsigned(wire107) ?
          $signed(reg106) : (8'ha1)) >= ((wire100 ?
          wire102 : wire110) ^ (!wire98))) ^~ ($unsigned({(8'hb1),
          wire107}) <= (8'ha1))));
      reg112 <= ((|{wire103[(1'h0):(1'h0)]}) > (reg105[(1'h0):(1'h0)] || (((reg111 || reg106) ?
              $signed((8'hb8)) : (wire110 ? wire110 : wire104)) ?
          ($unsigned((8'had)) < (^~wire101)) : $unsigned(wire99[(3'h4):(1'h1)]))));
    end
  always
    @(posedge clk) begin
      reg113 <= {((-(~wire104)) ?
              (-(8'haa)) : $unsigned(wire98[(1'h1):(1'h1)])),
          (wire99 ?
              ((~^((8'hae) ? (8'ha7) : wire98)) ?
                  (reg106[(4'h9):(4'h8)] > (wire101 <= wire108)) : wire104[(3'h6):(3'h4)]) : (wire108[(1'h1):(1'h0)] ~^ $unsigned({(8'h9e),
                  wire102})))};
    end
  assign wire114 = wire102;
  assign wire115 = $unsigned(wire110);
  assign wire116 = $signed(wire114);
  assign wire117 = ($unsigned(($signed($unsigned(wire110)) ?
                       wire116 : $unsigned({reg111}))) ~^ wire101[(3'h6):(1'h0)]);
  assign wire118 = wire117[(3'h6):(1'h0)];
  assign wire119 = $signed($unsigned($unsigned(wire118[(3'h4):(3'h4)])));
  always
    @(posedge clk) begin
      reg120 <= (wire117[(5'h13):(3'h6)] ?
          $signed((&$signed($unsigned((7'h42))))) : ($unsigned(wire110[(4'he):(4'hb)]) ?
              (&wire117) : (wire115[(3'h5):(3'h5)] ?
                  (~&(~|wire118)) : wire118)));
      if ($signed({wire101}))
        begin
          reg121 <= wire110;
          reg122 <= wire119[(5'h11):(3'h7)];
          reg123 <= ((~&wire100[(3'h4):(2'h3)]) ?
              wire98[(2'h2):(1'h1)] : wire99);
          reg124 <= ((&$signed($signed((reg120 ?
              wire101 : wire101)))) > (wire119 ?
              wire110 : ((wire99[(4'hb):(3'h7)] ?
                      (wire98 ~^ reg122) : (wire100 ? wire115 : wire117)) ?
                  (reg121[(3'h5):(3'h4)] ? (~&reg112) : reg112) : wire102)));
        end
      else
        begin
          reg121 <= {($unsigned((!wire104)) <= $unsigned(wire101[(3'h7):(3'h5)])),
              $signed((^~$signed($signed(wire99))))};
          reg122 <= $unsigned(wire109);
        end
      reg125 <= $unsigned((!(reg112[(5'h11):(4'h8)] || $unsigned($unsigned((8'ha5))))));
      reg126 <= $unsigned(((reg124 ? wire109 : (8'h9e)) ?
          reg122[(5'h10):(3'h4)] : ((^~(wire115 ?
              (8'ha3) : wire102)) << $signed(((8'hba) ^~ wire98)))));
    end
endmodule

module module79
#(parameter param92 = (~^(-(~&((8'hb8) ? (|(8'hbc)) : (^(7'h43)))))), 
parameter param93 = ((~|((~^(param92 & (8'h9e))) - ((param92 ^~ param92) ? ((8'hb1) > param92) : (param92 ? (8'ha4) : param92)))) <= {param92}))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire83;
  input wire [(3'h4):(1'h0)] wire82;
  input wire [(3'h6):(1'h0)] wire81;
  input wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire84;
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire85,
                 wire84,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire84 = wire81[(2'h3):(1'h0)];
  assign wire85 = wire80[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg86 <= wire83[(4'ha):(4'ha)];
      reg87 <= {$unsigned($unsigned($signed({wire83, wire80})))};
      reg88 <= wire83[(4'ha):(4'ha)];
    end
  assign wire89 = $unsigned(wire80);
  assign wire90 = (^~({$signed(reg86[(3'h6):(1'h1)])} ?
                      ($unsigned($unsigned(wire82)) ?
                          (!(^wire89)) : ((~|(8'hbb)) >= {wire89,
                              reg88})) : $unsigned(wire80[(2'h2):(1'h0)])));
  assign wire91 = (((wire84[(3'h4):(1'h0)] ?
                          $unsigned(wire82[(2'h2):(1'h0)]) : $signed((8'hab))) ?
                      $unsigned($signed((reg86 && wire90))) : ((reg88[(2'h3):(2'h2)] - reg86) ?
                          (^~wire85) : $signed((wire83 ?
                              wire81 : wire84)))) || {(reg88[(3'h5):(3'h5)] > $signed(((8'hb4) || wire83)))});
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire60;
  input wire signed [(4'hf):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  input wire [(4'hf):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire61;
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  assign y = {wire72,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire61 = wire58[(1'h1):(1'h0)];
  assign wire62 = wire58;
  assign wire63 = (~^wire60[(1'h0):(1'h0)]);
  assign wire64 = wire58[(3'h5):(2'h3)];
  assign wire65 = wire63;
  always
    @(posedge clk) begin
      reg66 <= ((($signed($signed((7'h43))) ^~ (wire62 >>> (8'hba))) < (~$signed(wire65[(4'h8):(4'h8)]))) ?
          $unsigned($signed((|wire65[(3'h6):(3'h4)]))) : $signed((^(~$signed((8'hb1))))));
      if (wire61)
        begin
          reg67 <= $unsigned(wire57[(4'h8):(1'h0)]);
          reg68 <= $unsigned((((reg66[(3'h6):(2'h3)] ?
              (^~wire63) : {(8'hbd)}) != ((wire63 & wire60) == $signed(wire57))) ^~ wire61));
          reg69 <= reg67[(4'hb):(2'h2)];
          reg70 <= $unsigned(reg67[(4'hc):(3'h6)]);
        end
      else
        begin
          reg67 <= (~^(({(wire61 ? reg67 : wire64)} != {wire64[(3'h5):(3'h4)],
                  (wire62 ? (8'hae) : wire65)}) ?
              ($unsigned((^~(7'h42))) ?
                  $unsigned((wire63 <<< wire61)) : $signed($signed(reg67))) : ({reg70[(2'h2):(1'h0)],
                  {reg69, wire57}} > reg70[(4'h8):(3'h6)])));
          reg68 <= {($unsigned({$unsigned((8'haa))}) ^ $unsigned($unsigned($unsigned((7'h44))))),
              $unsigned(((8'hae) ?
                  (reg67[(1'h1):(1'h1)] ~^ (wire64 << wire63)) : wire65))};
          reg69 <= (($unsigned(wire62) ?
              ($signed((wire61 >> wire58)) && ((wire59 ?
                  wire62 : reg68) & $unsigned(wire60))) : $unsigned(wire65[(4'h9):(1'h1)])) * ({wire59[(4'hf):(1'h0)],
                  (+reg70)} ?
              $unsigned($unsigned(reg69[(1'h0):(1'h0)])) : $unsigned((+reg70[(1'h0):(1'h0)]))));
          reg70 <= (|($signed($signed(reg66[(3'h7):(2'h2)])) ?
              (^(wire60[(1'h1):(1'h0)] * $signed(wire61))) : (($unsigned((8'hbc)) ?
                  wire58 : $unsigned(wire64)) != $unsigned(wire58))));
        end
      reg71 <= ($signed((~reg69)) >= {wire64});
    end
  assign wire72 = {$signed((~wire60)), $signed({$signed({reg66})})};
endmodule

module module38
#(parameter param49 = (8'hac))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire42;
  input wire [(4'hb):(1'h0)] wire41;
  input wire [(3'h5):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  assign y = {wire48, wire47, wire46, wire45, wire44, wire43, (1'h0)};
  assign wire43 = wire40;
  assign wire44 = (({wire41[(1'h1):(1'h0)]} <<< wire39[(4'ha):(3'h5)]) & wire42[(3'h7):(3'h6)]);
  assign wire45 = $signed(((&$unsigned(wire42[(2'h3):(2'h2)])) == $unsigned(wire44)));
  assign wire46 = $signed((+$unsigned($unsigned(wire40[(2'h3):(1'h0)]))));
  assign wire47 = wire39;
  assign wire48 = $signed($signed($unsigned((wire43[(1'h1):(1'h0)] ?
                      wire41[(2'h2):(2'h2)] : (wire47 ? wire39 : (8'ha0))))));
endmodule
