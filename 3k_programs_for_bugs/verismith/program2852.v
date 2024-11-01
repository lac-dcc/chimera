module top
#(parameter param173 = ((~&(~|(8'ha5))) != (~&(^~({(8'hb0)} ^ {(8'hbd), (8'hba)})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire171;
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire171,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ($unsigned((&wire2)) ^ $signed($signed($unsigned((~|wire1)))));
  assign wire5 = ((+{{(wire3 && wire4)}}) ?
                     wire1 : ((~&{wire1, wire2}) ?
                         wire4[(3'h5):(2'h2)] : (({(8'h9d),
                             wire1} >> wire3[(3'h6):(1'h1)]) - $unsigned(wire0))));
  assign wire6 = wire2;
  assign wire7 = ((($signed($unsigned(wire2)) << wire2) != (~^wire0)) ^ wire2);
  assign wire8 = (^$signed(wire5));
  always
    @(posedge clk) begin
      reg9 <= $unsigned(({(8'haf), wire7[(3'h7):(2'h3)]} << $unsigned((wire1 ?
          $signed((8'ha1)) : wire7[(1'h1):(1'h0)]))));
      reg10 <= $signed(wire7);
      reg11 <= wire3[(3'h7):(1'h0)];
    end
  assign wire12 = (-(-$unsigned(wire8)));
  assign wire13 = ($signed({(|$signed(wire1))}) && ((((reg11 != wire0) <<< $signed(wire6)) ?
                          (wire2 ?
                              ((7'h42) >>> wire1) : $unsigned(wire1)) : (8'h9d)) ?
                      {$signed(wire8[(3'h4):(1'h0)])} : $unsigned(((reg9 ?
                              (8'ha2) : wire2) ?
                          $unsigned((8'hac)) : $unsigned(reg9)))));
  assign wire14 = $signed($unsigned(wire2));
  assign wire15 = wire8;
  assign wire16 = reg9[(3'h5):(1'h1)];
  assign wire17 = (($signed(reg10) ?
                      {$signed($unsigned(wire15))} : ({{wire1, wire0}} ?
                          $signed(wire13) : (wire3 <= $signed(wire12)))) < $signed({$unsigned(reg11)}));
  module18 #() modinst172 (.wire22(wire0), .wire23(wire7), .clk(clk), .wire21(wire2), .wire20(wire15), .wire19(wire6), .y(wire171));
endmodule

module module18  (y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire19;
  input wire [(4'h8):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire21;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(4'ha):(1'h0)] wire168;
  wire signed [(3'h5):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire136;
  wire signed [(4'ha):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire131;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire55;
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  assign y = {wire170,
                 wire168,
                 wire140,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire98,
                 wire96,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire55,
                 reg139,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  assign wire24 = $unsigned(wire21[(2'h3):(2'h2)]);
  assign wire25 = $unsigned($signed(wire19));
  assign wire26 = (wire25 ?
                      wire23[(3'h4):(2'h3)] : $signed((wire21[(1'h0):(1'h0)] | (7'h43))));
  assign wire27 = ((~((wire22[(1'h0):(1'h0)] <= (wire25 <= wire21)) ^~ ((&wire23) ?
                      (wire22 >>> wire22) : wire24[(5'h12):(4'hb)]))) < wire23);
  assign wire28 = {wire22[(2'h3):(1'h1)]};
  module29 #() modinst56 (.wire33(wire22), .y(wire55), .wire31(wire21), .wire34(wire23), .clk(clk), .wire30(wire28), .wire32(wire27));
  always
    @(posedge clk) begin
      if ((8'hb8))
        begin
          reg57 <= wire24;
          if ((((~|$signed({wire20,
                  wire26})) * {$unsigned($unsigned(wire23))}) ?
              $unsigned((8'hb4)) : $signed((((^wire23) ^~ (^wire20)) <<< ($unsigned(wire25) ?
                  (wire19 ^ wire19) : (wire28 ? wire23 : wire21))))))
            begin
              reg58 <= wire22;
              reg59 <= ({wire23,
                  ($unsigned($signed((8'ha2))) ?
                      (~&(~&reg57)) : $unsigned((wire19 ?
                          reg57 : wire25)))} <= {(^~$unsigned(reg58))});
              reg60 <= wire22[(3'h5):(1'h1)];
            end
          else
            begin
              reg58 <= ((wire27 << wire26[(4'h9):(3'h6)]) ?
                  wire25 : $unsigned($signed(((+wire27) < $unsigned(wire27)))));
              reg59 <= (&$unsigned(wire26));
            end
          if ({({(((8'ha2) ? (8'hbc) : wire27) << (wire27 ?
                          (7'h44) : (7'h42)))} ?
                  ((wire25 ^~ $signed(wire25)) ?
                      (wire25[(4'hf):(1'h1)] ?
                          (~|reg57) : $signed(wire55)) : (&reg59[(1'h1):(1'h0)])) : (wire23[(3'h5):(3'h5)] ?
                      ($unsigned(wire23) < (reg57 ?
                          reg58 : reg59)) : {$unsigned((8'hbd)), wire24}))})
            begin
              reg61 <= $unsigned(wire19[(3'h7):(1'h0)]);
              reg62 <= $unsigned((wire55[(1'h0):(1'h0)] - ($unsigned(wire20) ?
                  ($signed(reg61) ?
                      (^~reg60) : wire24[(4'ha):(4'h8)]) : $signed($unsigned(reg59)))));
              reg63 <= reg59[(1'h0):(1'h0)];
            end
          else
            begin
              reg61 <= $unsigned((wire28 & wire21));
              reg62 <= (~|{reg62});
              reg63 <= (~^wire27);
              reg64 <= (7'h41);
              reg65 <= reg58[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg57 <= (+(~^$signed((8'hb6))));
          reg58 <= (wire26 ?
              ({(~wire22[(1'h1):(1'h1)])} - $unsigned({(reg64 ?
                      reg65 : (8'hb0)),
                  {(8'ha0)}})) : {($signed({reg59, (8'hac)}) && wire27)});
          reg59 <= $unsigned($unsigned({$unsigned(reg64[(2'h2):(1'h0)])}));
          reg60 <= reg62;
          reg61 <= (((&wire19[(1'h0):(1'h0)]) & {((wire21 ^~ reg59) >= (^reg57))}) ?
              $unsigned($unsigned($unsigned($unsigned(reg58)))) : {(&((reg57 ?
                      reg60 : wire26) < ((8'hb5) != (8'ha9)))),
                  $signed(wire23[(2'h2):(2'h2)])});
        end
      reg66 <= $signed($signed(wire24[(5'h14):(5'h11)]));
      reg67 <= (wire22 ?
          {($signed(wire23) && (~|$unsigned((8'h9c)))),
              $signed({reg58[(1'h0):(1'h0)],
                  wire55[(1'h1):(1'h1)]})} : $signed((^((reg57 >> reg64) >> (wire22 ^~ (7'h43))))));
    end
  module68 #() modinst97 (wire96, clk, reg64, reg62, reg57, wire28, wire24);
  assign wire98 = (-((wire96[(4'h8):(4'h8)] ~^ ((8'hbe) ?
                          (wire22 ? wire26 : reg57) : $signed(reg61))) ?
                      ((-(^wire25)) ?
                          $signed($unsigned(wire55)) : reg59[(2'h2):(2'h2)]) : {(+$signed(wire28))}));
  module99 #() modinst132 (wire131, clk, wire28, wire21, reg62, reg58);
  assign wire133 = $signed($signed((7'h40)));
  assign wire134 = ($unsigned($signed($signed({wire26, reg57}))) ?
                       (!$unsigned(wire25[(4'h8):(2'h3)])) : reg60);
  assign wire135 = wire22[(1'h0):(1'h0)];
  assign wire136 = $unsigned(({wire98[(2'h3):(1'h1)]} ?
                       reg63[(4'hc):(2'h2)] : $signed(reg67)));
  assign wire137 = (reg63[(4'h9):(3'h6)] ?
                       $signed($unsigned(reg65)) : ((wire133[(3'h4):(2'h3)] < ((~^wire27) * wire23)) ?
                           $signed(reg64[(4'hc):(1'h1)]) : wire133));
  assign wire138 = (+((($signed(wire25) ?
                           {wire28} : $signed(reg59)) ^ ($signed(wire19) && (reg63 <= reg62))) ?
                       (($unsigned(reg65) ?
                           (wire26 ?
                               reg57 : (8'hae)) : $signed(wire26)) | wire22[(4'ha):(4'h8)]) : wire134[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg139 <= reg64[(2'h2):(1'h0)];
    end
  assign wire140 = (~^wire26);
  module141 #() modinst169 (wire168, clk, reg66, reg63, reg64, reg57);
  assign wire170 = wire23;
endmodule

module module141
#(parameter param167 = (~|(^~((((8'hac) << (8'hbc)) ? (~&(8'hba)) : (&(8'ha3))) ? ({(8'ha5), (8'hba)} >= (&(8'ha5))) : (-((8'hb1) - (8'hb2)))))))
(y, clk, wire145, wire144, wire143, wire142);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire145;
  input wire [(5'h12):(1'h0)] wire144;
  input wire [(3'h7):(1'h0)] wire143;
  input wire signed [(4'h8):(1'h0)] wire142;
  wire signed [(4'ha):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire164;
  wire [(5'h10):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire160;
  wire signed [(4'h9):(1'h0)] wire159;
  wire [(5'h13):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire154;
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(4'he):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire155,
                 wire154,
                 reg158,
                 reg157,
                 reg156,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg146 <= (wire142 ? wire145 : wire144);
      if ($unsigned((reg146[(3'h6):(3'h5)] ?
          ($signed((wire143 ? wire143 : wire142)) ?
              reg146 : $unsigned((8'hbf))) : (wire145 ?
              (wire143[(1'h0):(1'h0)] ?
                  $unsigned(wire142) : wire144) : (wire145[(3'h5):(2'h3)] ?
                  wire142[(2'h2):(1'h1)] : $signed((8'ha2)))))))
        begin
          reg147 <= $unsigned((^~(^~{(reg146 >= wire142)})));
          reg148 <= (^({($unsigned(wire145) ?
                      (wire144 <= (7'h40)) : (~&wire145)),
                  $signed((|wire145))} ?
              $unsigned((~^(^~reg147))) : wire145[(1'h0):(1'h0)]));
          if ((|wire143[(3'h5):(2'h3)]))
            begin
              reg149 <= $signed(wire143);
              reg150 <= ((8'ha6) ?
                  $signed($signed(wire145[(3'h4):(1'h1)])) : $signed($signed({{reg148},
                      $unsigned(wire145)})));
              reg151 <= (((8'hac) ?
                  (((reg146 != wire144) ?
                          reg148 : (reg147 ? reg149 : wire142)) ?
                      (reg150[(3'h5):(2'h2)] ?
                          reg146 : (reg148 * reg149)) : (^~reg146)) : wire144) ^~ (!(~&$signed($unsigned(wire143)))));
            end
          else
            begin
              reg149 <= (+($unsigned(($unsigned(wire142) == reg146[(3'h7):(1'h1)])) - reg146));
              reg150 <= $signed(reg148[(4'he):(2'h2)]);
              reg151 <= $unsigned(reg149[(3'h7):(1'h0)]);
              reg152 <= wire145;
            end
        end
      else
        begin
          reg147 <= $signed((((reg146[(4'h8):(3'h7)] <<< (wire144 == wire144)) + wire144[(2'h2):(1'h1)]) || $unsigned($unsigned({wire145,
              wire142}))));
          reg148 <= $signed((~^$signed(reg148)));
          reg149 <= $signed((^(wire144[(4'hd):(2'h2)] ?
              $signed($unsigned((8'hb1))) : $signed(reg149[(2'h3):(1'h0)]))));
        end
      reg153 <= $signed($unsigned((^~$signed((reg149 ? (8'hb5) : reg152)))));
    end
  assign wire154 = (7'h42);
  assign wire155 = {(^~$signed(($unsigned(reg149) != wire143[(1'h1):(1'h1)]))),
                       wire154};
  always
    @(posedge clk) begin
      reg156 <= $unsigned(((8'ha4) && ((wire142[(3'h6):(3'h6)] ?
              reg150 : ((8'hb2) ^ wire155)) ?
          reg152[(5'h12):(2'h2)] : ($unsigned(reg149) ?
              reg147[(2'h3):(2'h3)] : $unsigned(wire145)))));
      reg157 <= {$signed(reg151[(2'h2):(1'h1)])};
      reg158 <= wire154[(2'h3):(1'h1)];
    end
  assign wire159 = $unsigned((~|(((wire145 ? (8'hb8) : reg156) ?
                           (~^reg151) : (8'hba)) ?
                       $unsigned(wire144) : ((reg147 > reg151) ?
                           (+wire145) : (|reg148)))));
  assign wire160 = reg156;
  assign wire161 = {$unsigned($unsigned((((8'haa) == wire154) * {reg148}))),
                       {(^(-reg150))}};
  assign wire162 = reg148;
  assign wire163 = $unsigned(($unsigned({(^~wire145), $signed(reg152)}) ?
                       ((((8'ha0) ? wire143 : wire155) ^ (wire145 ?
                               reg157 : wire144)) ?
                           $unsigned(reg156[(1'h1):(1'h0)]) : wire145[(2'h3):(1'h0)]) : {$unsigned((reg153 ?
                               (8'ha7) : reg149))}));
  assign wire164 = (($unsigned(({reg146, wire143} ?
                           (wire160 ?
                               reg158 : wire162) : $unsigned(reg148))) >> {{{(8'hb1)}},
                           ((8'h9e) ? wire160 : wire142)}) ?
                       reg147 : reg146);
  assign wire165 = $unsigned($signed((|$unsigned((&reg151)))));
  assign wire166 = (^$unsigned(reg157[(4'he):(4'hc)]));
endmodule

module module99
#(parameter param129 = (^~(&(((!(8'ha6)) ? ((8'hb7) ? (8'ha7) : (8'hb4)) : (|(8'hb2))) ^ ((~&(8'ha6)) ? ((8'hb9) <<< (8'hba)) : (+(7'h44)))))), 
parameter param130 = (|((-param129) ~^ (param129 ? ({param129} ? (8'ha8) : param129) : ({param129, param129} ? (^~param129) : (!(7'h42)))))))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire103;
  input wire [(4'hf):(1'h0)] wire102;
  input wire [(5'h15):(1'h0)] wire101;
  input wire [(3'h7):(1'h0)] wire100;
  wire [(3'h4):(1'h0)] wire128;
  wire [(4'h8):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire115,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire104 = {{wire103}};
  assign wire105 = wire100;
  assign wire106 = $signed(($unsigned((8'h9e)) || $unsigned(wire105)));
  assign wire107 = ($signed((wire105 ?
                           wire100 : ((^~(8'ha9)) ?
                               (-(8'hb2)) : {wire102, wire102}))) ?
                       ($unsigned(wire100[(3'h4):(3'h4)]) + wire102) : $unsigned($unsigned(wire106)));
  assign wire108 = (8'hac);
  assign wire109 = ($unsigned((($signed(wire101) | ((8'hb3) ?
                       (8'hb3) : wire102)) >>> $signed((wire103 ?
                       wire108 : wire108)))) * $signed((wire100 - wire107)));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned(wire103))))
        begin
          reg110 <= ({$unsigned(((wire108 ? wire105 : wire108) ?
                  $unsigned(wire101) : wire103[(1'h1):(1'h1)])),
              (+wire105[(1'h0):(1'h0)])} >= $signed((8'ha6)));
          reg111 <= wire109[(5'h15):(1'h1)];
          reg112 <= $signed(wire100[(3'h5):(3'h4)]);
          reg113 <= (~&wire103);
        end
      else
        begin
          if (((($signed({(8'hb5), wire109}) + ((wire104 ?
                  wire109 : wire108) + (~&reg113))) ?
              $signed((^~(-reg111))) : wire100) + ((($signed(reg111) >>> reg110[(2'h3):(1'h0)]) - ({wire103} ?
              reg111[(2'h2):(1'h1)] : wire106)) ~^ reg112)))
            begin
              reg110 <= wire101;
              reg111 <= (((^~((wire105 & wire106) ?
                      (wire109 ?
                          wire100 : reg110) : $signed(wire105))) == ({$signed(reg111),
                      reg111} + reg112[(4'he):(4'h8)])) ?
                  $unsigned((((8'haa) ? wire104 : wire106[(4'h8):(1'h1)]) ?
                      $unsigned($unsigned(wire109)) : $unsigned($unsigned(wire104)))) : wire108[(1'h1):(1'h1)]);
            end
          else
            begin
              reg110 <= ($unsigned((^(^~$unsigned((8'hac))))) ?
                  (wire103 ?
                      wire100[(1'h1):(1'h0)] : (((8'hac) ?
                          wire104 : (+(7'h41))) == $signed($signed(wire104)))) : ((~|wire104[(1'h0):(1'h0)]) & (wire108[(2'h2):(1'h1)] ?
                      (-wire101) : ((wire106 >>> reg111) >= $signed(wire102)))));
            end
          reg112 <= ((+(~^$unsigned($signed(wire109)))) ?
              ((+$unsigned((wire108 >>> wire105))) ?
                  (wire103[(4'h9):(4'h9)] ?
                      $signed((wire108 || wire100)) : {(wire104 ?
                              (8'haa) : reg113),
                          (-wire108)}) : {$unsigned($unsigned(wire105)),
                      (wire102[(3'h5):(1'h0)] ?
                          (reg113 ?
                              wire102 : reg113) : $signed(wire107))}) : ($unsigned((8'hbb)) << (|reg110[(4'h9):(3'h7)])));
          reg113 <= wire102;
          reg114 <= reg111;
        end
    end
  assign wire115 = $signed($unsigned($signed((~(wire105 ? reg112 : reg110)))));
  always
    @(posedge clk) begin
      reg116 <= (!{$signed(wire106)});
      reg117 <= (~^reg116);
      if ((-((~|reg113[(2'h3):(2'h3)]) ?
          (~&wire105) : $signed($signed(reg110)))))
        begin
          if ($signed($signed(wire106[(4'hb):(3'h6)])))
            begin
              reg118 <= (|$signed((!$unsigned((wire106 << wire108)))));
              reg119 <= $signed(((($unsigned(wire115) ?
                  wire100 : $unsigned(wire101)) | $unsigned((wire106 ?
                  reg113 : (7'h42)))) - {$signed($unsigned(wire108)),
                  (^~wire101[(3'h4):(2'h2)])}));
              reg120 <= $signed(wire100);
              reg121 <= ($signed(reg118[(3'h5):(1'h0)]) ?
                  $unsigned(($signed((wire100 >>> reg114)) ?
                      $unsigned((wire108 ^~ wire104)) : $unsigned({reg116,
                          reg112}))) : $signed(((-$signed(wire102)) ?
                      reg111[(3'h4):(2'h2)] : ($unsigned(reg117) ?
                          (^~reg118) : wire103[(3'h6):(3'h5)]))));
              reg122 <= wire108[(2'h2):(1'h0)];
            end
          else
            begin
              reg118 <= ((|$unsigned({{reg117}})) < ((~^$unsigned((-wire109))) ?
                  (|(|$unsigned(wire115))) : (~^{$signed(reg111),
                      (~^reg120)})));
              reg119 <= wire109[(4'he):(4'hc)];
              reg120 <= {$signed(wire102),
                  (((|(8'ha7)) ?
                      (~reg122[(1'h0):(1'h0)]) : $signed($unsigned(reg122))) | (^(8'hbf)))};
            end
          reg123 <= ((^~reg122[(3'h6):(2'h3)]) ?
              $signed((reg114 ?
                  wire105[(3'h6):(3'h5)] : ({(8'hba), reg122} ?
                      (reg110 ?
                          reg121 : wire115) : reg117[(1'h0):(1'h0)]))) : $unsigned((^~reg120[(3'h4):(3'h4)])));
        end
      else
        begin
          reg118 <= (8'ha7);
        end
    end
  assign wire124 = (((~&((|wire115) >= ((8'h9f) < (8'ha3)))) ?
                           reg118[(1'h1):(1'h1)] : $unsigned(((!reg112) ^ $unsigned(wire105)))) ?
                       {wire103} : {$unsigned(wire100)});
  assign wire125 = $signed(($signed((|$unsigned(reg120))) ?
                       (7'h40) : $signed(($unsigned((8'hb1)) ?
                           {(8'hab)} : wire107[(3'h7):(1'h0)]))));
  assign wire126 = reg110[(1'h0):(1'h0)];
  assign wire127 = $signed({reg112[(4'hd):(3'h4)]});
  assign wire128 = ($unsigned((reg111 >> ((wire126 ?
                           wire101 : wire100) + $signed((8'ha6))))) ?
                       $signed(reg113[(2'h3):(1'h0)]) : wire124);
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire73;
  input wire signed [(3'h4):(1'h0)] wire72;
  input wire signed [(4'h8):(1'h0)] wire71;
  input wire [(3'h4):(1'h0)] wire70;
  input wire signed [(4'hb):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire87,
                 wire75,
                 wire74,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire74 = $unsigned($unsigned({$unsigned((wire71 * (8'haf))), wire73}));
  assign wire75 = (&wire73);
  always
    @(posedge clk) begin
      reg76 <= ((|$unsigned(wire72[(1'h0):(1'h0)])) <<< (wire72 <<< ($signed($unsigned((8'hb1))) ?
          wire75 : wire75[(2'h2):(2'h2)])));
      if ($unsigned(wire73[(4'he):(4'hc)]))
        begin
          reg77 <= (-$signed((^~wire71[(3'h7):(2'h3)])));
          if ($unsigned(wire74))
            begin
              reg78 <= $unsigned($signed(((wire70[(1'h0):(1'h0)] >> {reg76}) ?
                  (~(reg76 ? wire74 : wire74)) : (wire75[(1'h1):(1'h1)] ?
                      reg76 : (&reg77)))));
              reg79 <= {$unsigned($signed((~{reg77, wire71})))};
              reg80 <= ($signed((&($unsigned(wire71) ?
                  $unsigned(wire73) : {(8'hb4),
                      reg79}))) - (+($unsigned($signed((8'hb0))) >> (-$signed(wire70)))));
            end
          else
            begin
              reg78 <= (+($unsigned(reg78[(4'ha):(3'h6)]) ~^ wire74));
              reg79 <= reg80;
              reg80 <= $unsigned(wire75[(3'h7):(3'h4)]);
              reg81 <= $unsigned($signed($unsigned((wire74[(2'h2):(1'h1)] < $unsigned(reg79)))));
              reg82 <= (+(wire71 ?
                  $unsigned(reg79[(3'h5):(1'h0)]) : (^~(~^reg78))));
            end
          reg83 <= $signed(wire74);
          reg84 <= $unsigned((wire74[(1'h0):(1'h0)] ?
              $unsigned($signed($signed(wire69))) : $unsigned($unsigned($signed(wire73)))));
          reg85 <= $unsigned((reg76[(3'h5):(3'h4)] ~^ $unsigned(wire73[(4'he):(3'h6)])));
        end
      else
        begin
          reg77 <= (8'haf);
        end
      reg86 <= wire73;
    end
  assign wire87 = (|(($unsigned(reg76[(5'h10):(4'hd)]) ?
                      (~^(+(8'ha8))) : reg77) + (^~reg77[(3'h6):(1'h0)])));
  always
    @(posedge clk) begin
      if (reg77)
        begin
          reg88 <= {wire75[(1'h1):(1'h1)],
              (reg77[(4'hd):(2'h2)] ?
                  ($unsigned(reg80[(1'h0):(1'h0)]) ?
                      wire75 : $signed((reg83 ?
                          (8'hb1) : wire72))) : (~($unsigned(reg86) ?
                      (&reg80) : ((7'h41) * wire87))))};
          reg89 <= reg82;
          if ((^~$signed($unsigned(reg77))))
            begin
              reg90 <= (($unsigned(wire70) ?
                  wire75 : ((((8'ha3) < wire72) ?
                          $signed((7'h43)) : $signed(wire75)) ?
                      (^{wire69}) : (-$signed(wire87)))) ^ reg80);
              reg91 <= (8'hb6);
              reg92 <= $unsigned((^~(wire69[(3'h5):(2'h2)] ?
                  ($unsigned((8'ha1)) ?
                      reg86[(3'h7):(1'h0)] : (reg82 <<< wire74)) : $signed({reg85}))));
            end
          else
            begin
              reg90 <= ((~reg89[(4'h8):(1'h1)]) ?
                  $unsigned((~|({wire71,
                      reg80} >> reg81))) : $signed(($unsigned((wire69 ?
                          (8'hb9) : wire73)) ?
                      $signed($unsigned(wire73)) : ($unsigned(wire87) ?
                          {reg91} : $signed(wire74)))));
            end
          reg93 <= reg90;
        end
      else
        begin
          reg88 <= $unsigned((~^$unsigned((+(reg90 ~^ (8'hb3))))));
          if ((reg83[(3'h7):(3'h5)] && {({$signed(reg77)} <<< ($signed(reg91) ?
                  wire70[(1'h0):(1'h0)] : $unsigned((8'ha7)))),
              $signed(($unsigned(wire69) ?
                  (~|reg84) : wire87[(1'h0):(1'h0)]))}))
            begin
              reg89 <= (~|$unsigned(wire73[(2'h2):(2'h2)]));
            end
          else
            begin
              reg89 <= $signed(((~&reg83) - (((wire87 ?
                  reg89 : wire73) << reg90[(4'h9):(1'h1)]) ^~ $signed($unsigned(reg88)))));
            end
          reg90 <= reg90[(4'ha):(4'h8)];
        end
    end
  assign wire94 = $unsigned($signed(({$unsigned(reg81)} != (~(reg84 & reg89)))));
  assign wire95 = $unsigned($unsigned({(7'h44)}));
endmodule

module module29  (y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(4'hb):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg51,
                 reg42,
                 (1'h0)};
  assign wire35 = ($unsigned((!$signed(wire33[(3'h4):(1'h1)]))) + $unsigned(((8'ha2) > $signed((wire31 ?
                      wire30 : wire34)))));
  assign wire36 = (^$unsigned(((((7'h42) ? wire32 : (8'hbb)) > wire31) ?
                      wire32[(2'h2):(1'h1)] : (wire35 < ((8'hbc) ?
                          wire35 : wire32)))));
  assign wire37 = $unsigned($unsigned(wire35));
  assign wire38 = $unsigned($unsigned($unsigned($unsigned(wire31))));
  assign wire39 = ({(&$unsigned($signed(wire32)))} == $unsigned((!(-$unsigned(wire30)))));
  assign wire40 = (8'ha2);
  assign wire41 = wire40[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg42 <= $signed($unsigned($signed(wire34[(2'h2):(1'h1)])));
    end
  assign wire43 = ((~^wire32[(1'h1):(1'h1)]) ?
                      $unsigned($signed($unsigned(reg42))) : {($signed($unsigned(wire36)) || {(8'hb9),
                              {wire34}})});
  assign wire44 = (8'ha1);
  assign wire45 = (~^($signed($signed((~wire34))) >= ($unsigned(wire31[(3'h4):(1'h0)]) ?
                      $signed(wire34[(4'h8):(1'h1)]) : $signed($signed(wire43)))));
  assign wire46 = wire37[(3'h5):(1'h0)];
  assign wire47 = $signed({wire35[(4'ha):(4'h8)]});
  assign wire48 = $signed($signed(wire46[(4'h8):(3'h5)]));
  assign wire49 = ($signed($unsigned(wire33)) | reg42[(3'h6):(3'h4)]);
  assign wire50 = wire40[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg51 <= $signed(wire48[(1'h1):(1'h1)]);
    end
  assign wire52 = $signed((|$unsigned((wire38 ? {wire46} : $signed(wire38)))));
  assign wire53 = ($unsigned(wire52) ? wire44 : wire39[(2'h2):(2'h2)]);
  assign wire54 = wire46[(4'hb):(3'h4)];
endmodule
