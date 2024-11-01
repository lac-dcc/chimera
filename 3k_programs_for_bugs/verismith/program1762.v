module top
#(parameter param228 = ({(((8'ha5) && ((8'hb2) > (8'h9e))) <<< {((8'hb7) ? (8'had) : (8'hbf))})} ^~ (((((8'ha9) ? (7'h41) : (8'hb1)) ? ((8'ha7) ? (8'haf) : (8'hb9)) : {(8'hbc)}) ~^ (8'hb6)) ^ ((~|{(8'hb1), (7'h43)}) ? (((8'ha5) ? (8'hac) : (8'hae)) >> (-(8'ha0))) : {((7'h41) > (8'hbe))}))), 
parameter param229 = (~&(param228 ? (|{(param228 != param228)}) : ((param228 ? (param228 || param228) : (!param228)) - (|(param228 + (7'h40)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire227;
  wire [(5'h12):(1'h0)] wire222;
  wire signed [(5'h15):(1'h0)] wire220;
  wire [(5'h12):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire146;
  wire signed [(2'h3):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire214;
  wire signed [(4'hb):(1'h0)] wire216;
  wire signed [(3'h6):(1'h0)] wire217;
  wire signed [(4'h9):(1'h0)] wire218;
  reg signed [(3'h6):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg224 = (1'h0);
  reg [(4'hb):(1'h0)] reg223 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  assign y = {wire227,
                 wire222,
                 wire220,
                 wire144,
                 wire146,
                 wire147,
                 wire151,
                 wire152,
                 wire214,
                 wire216,
                 wire217,
                 wire218,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg148,
                 reg149,
                 reg150,
                 reg153,
                 reg154,
                 (1'h0)};
  module5 #() modinst145 (.wire7(wire2), .wire6(wire4), .wire9(wire0), .wire8(wire1), .y(wire144), .clk(clk));
  assign wire146 = wire4[(4'he):(3'h7)];
  assign wire147 = (~&(!(wire0[(5'h12):(4'hb)] < $signed(wire4[(4'hf):(3'h4)]))));
  always
    @(posedge clk) begin
      reg148 <= (({$unsigned(wire146)} >>> {wire2[(5'h10):(3'h6)],
              $unsigned((^~wire147))}) ?
          (~&(+$unsigned($unsigned(wire4)))) : wire4[(3'h6):(2'h3)]);
      reg149 <= wire4[(3'h5):(1'h1)];
      reg150 <= $signed(((reg148[(3'h6):(1'h1)] ?
              wire3[(2'h2):(1'h0)] : {wire1[(1'h0):(1'h0)],
                  $unsigned(wire144)}) ?
          wire3[(2'h3):(1'h1)] : (($unsigned(wire2) ?
                  wire1[(5'h12):(4'h9)] : wire144) ?
              (wire4[(3'h6):(1'h0)] ?
                  (wire4 ^ wire3) : (reg148 == wire147)) : $unsigned(wire1[(4'hf):(2'h2)]))));
    end
  assign wire151 = wire144;
  assign wire152 = (wire2[(4'hb):(4'h9)] ?
                       wire2[(4'hc):(2'h2)] : $unsigned($unsigned($unsigned({wire3}))));
  always
    @(posedge clk) begin
      reg153 <= ((7'h40) ?
          $unsigned($signed(wire144[(4'hc):(2'h2)])) : wire4[(4'hb):(1'h0)]);
      reg154 <= $signed(wire3);
    end
  module155 #() modinst215 (.clk(clk), .wire159(wire2), .wire160(wire3), .wire158(wire146), .wire156(wire144), .y(wire214), .wire157(reg154));
  assign wire216 = {wire2[(2'h3):(1'h0)]};
  assign wire217 = (($signed(($unsigned(reg153) ?
                               (^~reg149) : wire146[(4'hc):(3'h7)])) ?
                           (8'hb5) : $unsigned(($unsigned(wire147) ?
                               {wire151} : (wire3 ? (8'ha0) : reg149)))) ?
                       (8'hb1) : $signed(((wire4 ? {wire152} : reg149) ?
                           wire147[(1'h1):(1'h0)] : wire216[(1'h1):(1'h0)])));
  module155 #() modinst219 (wire218, clk, wire144, wire0, wire2, wire216, wire152);
  module177 #() modinst221 (.wire180(wire1), .clk(clk), .wire181(reg150), .y(wire220), .wire179(reg149), .wire178(wire214));
  assign wire222 = wire151;
  always
    @(posedge clk) begin
      if (wire0[(4'hd):(2'h2)])
        begin
          reg223 <= ((|(~^(~(8'hb0)))) ?
              $signed(reg150[(1'h0):(1'h0)]) : (8'ha0));
          reg224 <= reg223[(4'h8):(2'h3)];
          reg225 <= $unsigned(wire3);
          reg226 <= wire3;
        end
      else
        begin
          reg223 <= wire214[(3'h4):(2'h3)];
          reg224 <= wire146;
          reg225 <= wire216[(2'h2):(2'h2)];
        end
    end
  assign wire227 = {(({{wire4, reg149}, $signed(reg224)} ?
                               ((reg148 >>> wire216) != wire220) : $signed((^reg224))) ?
                           (((wire1 != wire218) ~^ ((8'hac) ?
                                   (7'h42) : reg226)) ?
                               $signed(wire222) : wire3[(4'h9):(3'h7)]) : (!$unsigned($unsigned((8'hb9))))),
                       wire222};
endmodule

module module155  (y, clk, wire156, wire157, wire158, wire159, wire160);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire156;
  input wire [(4'h9):(1'h0)] wire157;
  input wire [(5'h12):(1'h0)] wire158;
  input wire [(4'hb):(1'h0)] wire159;
  input wire [(3'h5):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire213;
  wire [(4'he):(1'h0)] wire210;
  wire signed [(4'he):(1'h0)] wire209;
  wire signed [(3'h5):(1'h0)] wire161;
  wire [(2'h2):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire163;
  wire signed [(2'h2):(1'h0)] wire164;
  wire [(4'h8):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire168;
  wire signed [(4'hd):(1'h0)] wire207;
  reg signed [(5'h13):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg211 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(4'hc):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg176 = (1'h0);
  assign y = {wire213,
                 wire210,
                 wire209,
                 wire161,
                 wire162,
                 wire163,
                 wire164,
                 wire166,
                 wire167,
                 wire168,
                 wire207,
                 reg212,
                 reg211,
                 reg165,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 (1'h0)};
  assign wire161 = (wire158[(4'h8):(1'h0)] ?
                       (wire159 ? (8'hbf) : wire159[(2'h3):(2'h3)]) : (8'hae));
  assign wire162 = (8'hbe);
  assign wire163 = (~&($signed({(wire156 ? wire156 : (8'h9f))}) ?
                       wire159 : wire156));
  assign wire164 = wire163;
  always
    @(posedge clk) begin
      reg165 <= (({{(wire164 ? wire163 : wire160),
                  (wire160 ? wire159 : wire157)},
              $unsigned((8'hb9))} ?
          {wire162[(1'h0):(1'h0)]} : wire162) < ((wire163[(2'h3):(1'h1)] * (((8'ha8) ?
                  wire161 : wire163) ?
              $unsigned(wire164) : $signed(wire162))) ?
          (^$unsigned($unsigned(wire160))) : (+$unsigned((wire158 >>> wire158)))));
    end
  assign wire166 = $unsigned((+(~^($signed(wire159) >= wire159[(3'h6):(3'h5)]))));
  assign wire167 = ($unsigned(($signed($unsigned(wire159)) * $unsigned((wire162 ^ wire156)))) >> $signed(((wire162 > $signed(wire164)) ?
                       $unsigned((wire164 ?
                           (8'hb6) : wire166)) : $signed((wire156 == wire163)))));
  assign wire168 = (&$unsigned($signed($signed($signed((8'hbf))))));
  always
    @(posedge clk) begin
      if (((8'hbf) ?
          $signed((wire158 ?
              $unsigned((wire168 & reg165)) : ({wire163} ?
                  wire163[(3'h5):(2'h3)] : ((8'hb9) ?
                      wire157 : wire158)))) : (-((&$unsigned((8'ha6))) | ($unsigned(wire157) ?
              $signed((8'hb2)) : $signed(wire156))))))
        begin
          if (wire168[(3'h4):(1'h0)])
            begin
              reg169 <= wire156;
              reg170 <= wire163;
              reg171 <= ((wire161[(3'h4):(2'h2)] ?
                  wire159 : $unsigned((wire156 ?
                      $signed(wire158) : (wire161 ?
                          wire158 : reg169)))) < wire161[(3'h4):(3'h4)]);
            end
          else
            begin
              reg169 <= {reg171,
                  ($unsigned(($unsigned(reg169) ^ (wire167 != wire161))) ?
                      wire161[(2'h3):(2'h3)] : ((wire164 ?
                          $signed(reg165) : (wire161 + wire160)) != (~|(wire157 ?
                          (8'haf) : reg171))))};
              reg170 <= $signed($unsigned(wire156));
              reg171 <= ((|(^~$signed($signed(wire162)))) - (((wire164[(1'h1):(1'h1)] ?
                      wire166[(3'h5):(1'h0)] : {wire157}) ?
                  $signed(reg170) : ($signed((8'h9e)) ?
                      (wire157 ?
                          wire163 : wire162) : (wire166 != wire159))) ~^ $signed((wire168[(2'h3):(1'h0)] ?
                  reg170 : (wire161 >= (8'hbe))))));
              reg172 <= $signed((^~$unsigned(wire160[(1'h1):(1'h1)])));
            end
          reg173 <= {wire162,
              ({({reg165, reg172} ^~ (&(8'hb9)))} ?
                  (8'ha4) : (wire160 <<< (~$unsigned(wire167))))};
        end
      else
        begin
          reg169 <= wire163[(2'h2):(1'h0)];
          reg170 <= (((+((wire156 + wire161) >= wire156)) ?
                  (($unsigned(wire162) >= {wire163, wire161}) ?
                      wire167[(1'h0):(1'h0)] : {wire166}) : {({reg170} * wire163[(4'ha):(3'h6)]),
                      $signed((wire166 ? reg173 : wire167))}) ?
              ($unsigned((^$unsigned(wire160))) >> (-wire161)) : wire161);
          if ({wire159[(1'h0):(1'h0)]})
            begin
              reg171 <= ((-$signed((^{reg171}))) + (wire162[(1'h0):(1'h0)] && reg169[(1'h1):(1'h0)]));
              reg172 <= {($unsigned({(8'hb1)}) & (!(~|{(8'had)}))),
                  (((&((8'hbd) >= reg169)) << (reg165 << wire160)) < (wire160[(1'h0):(1'h0)] ?
                      wire164[(1'h1):(1'h1)] : $signed(wire167[(4'hc):(3'h4)])))};
              reg173 <= (wire160 != $unsigned((^~({(8'h9f),
                  reg169} * {reg172}))));
              reg174 <= (+$signed($unsigned(reg171[(4'ha):(4'h9)])));
            end
          else
            begin
              reg171 <= wire168;
              reg172 <= $signed(wire167[(3'h4):(2'h2)]);
              reg173 <= (wire160 ? wire167 : wire157[(4'h9):(2'h2)]);
              reg174 <= wire157;
            end
          reg175 <= $signed((&(wire163 ?
              $unsigned(reg174[(1'h1):(1'h1)]) : ($unsigned(wire159) ^~ {reg165}))));
        end
      reg176 <= $signed($signed(wire164));
    end
  module177 #() modinst208 (.wire179(reg169), .wire180(wire163), .wire178(wire168), .wire181(wire162), .y(wire207), .clk(clk));
  assign wire209 = (wire163 ?
                       (wire157 < $signed(((~|(8'ha0)) && (wire168 ?
                           reg174 : (8'ha3))))) : {(8'ha5),
                           ((^~(reg172 ? reg170 : wire157)) ?
                               wire164[(1'h1):(1'h0)] : $unsigned(reg165[(3'h6):(3'h5)]))});
  assign wire210 = $signed((~(~&$signed((~reg176)))));
  always
    @(posedge clk) begin
      reg211 <= $signed($signed($unsigned((wire207[(4'hd):(4'hc)] ?
          $unsigned(reg172) : (^reg172)))));
      reg212 <= ((8'hb5) ? (~^wire166) : (^$signed($unsigned({(8'ha9)}))));
    end
  assign wire213 = (((((wire210 ~^ wire167) ? $signed(wire162) : {wire164}) ?
                           (((8'hbf) ? (8'ha7) : reg170) > (wire160 ?
                               reg171 : reg171)) : $signed($unsigned(wire163))) ~^ reg165) ?
                       $unsigned((7'h41)) : {($unsigned((wire166 ?
                               reg212 : reg173)) ~^ $signed($signed(reg176))),
                           ($unsigned($signed((8'hac))) ~^ reg176[(1'h1):(1'h0)])});
endmodule

module module5
#(parameter param143 = (({(|((8'hb5) ? (8'h9c) : (8'ha7))), {((8'hb8) ? (8'ha3) : (8'hb4))}} ? ((!((8'hba) ? (8'ha7) : (8'hba))) == (((8'hbf) ? (8'had) : (7'h42)) ? ((8'hbf) >> (8'h9e)) : (~&(8'hbe)))) : ({(~|(8'haa))} >>> (((8'h9f) ? (8'hbe) : (7'h42)) ? ((8'ha2) + (8'hbc)) : ((8'h9c) ? (8'ha8) : (8'hbf))))) ^ (((~|(^~(8'haf))) ? {(^~(8'hba)), {(7'h40)}} : (~^{(8'hb7)})) ? (-(+((7'h42) ? (7'h40) : (8'hb2)))) : ((-((8'hb5) <<< (8'ha1))) ? (~^((8'hb6) ? (8'hb0) : (8'hb4))) : (((8'hb4) + (8'hbd)) >> ((8'hbb) ^~ (8'hab)))))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire142;
  wire [(4'ha):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire140;
  wire [(5'h13):(1'h0)] wire138;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire78;
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire138,
                 wire11,
                 wire12,
                 wire13,
                 wire78,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= ($unsigned((($unsigned((8'hb8)) * (wire8 & (8'ha0))) ^ ({wire6} >> $unsigned(wire9)))) ?
          wire6[(4'he):(1'h0)] : wire6);
    end
  assign wire11 = {wire9[(3'h7):(3'h7)]};
  assign wire12 = {wire8[(3'h7):(3'h7)]};
  assign wire13 = $unsigned(reg10[(4'h9):(3'h4)]);
  module14 #() modinst79 (wire78, clk, wire9, wire8, wire11, wire7, wire13);
  always
    @(posedge clk) begin
      reg80 <= {wire12};
      reg81 <= $unsigned((wire7[(3'h4):(2'h2)] ^~ $unsigned(wire13[(1'h0):(1'h0)])));
      reg82 <= $signed(wire7[(4'ha):(2'h3)]);
      reg83 <= (((~(~{wire9, wire12})) ?
          ($signed($signed(wire12)) ?
              {(!wire8),
                  wire13[(4'ha):(3'h4)]} : wire8[(2'h3):(2'h2)]) : wire6[(4'ha):(2'h2)]) * $unsigned(wire13[(1'h1):(1'h1)]));
      reg84 <= $unsigned($signed((!$signed((reg83 ? reg81 : wire8)))));
    end
  always
    @(posedge clk) begin
      reg85 <= wire6[(4'hc):(3'h7)];
      reg86 <= ($unsigned((-((wire78 ? reg80 : reg10) || wire9))) ?
          reg84 : ($unsigned($unsigned({wire78,
              wire13})) - $unsigned(($unsigned(wire11) >> reg80[(2'h3):(1'h0)]))));
    end
  module87 #() modinst139 (.wire88(wire7), .clk(clk), .wire91(reg86), .wire90(wire13), .wire89(reg10), .y(wire138));
  assign wire140 = $unsigned($signed((reg10 ^~ (^$unsigned(wire9)))));
  assign wire141 = (-wire12);
  assign wire142 = $signed(($unsigned(wire9) << (+reg80)));
endmodule

module module87
#(parameter param136 = {{{(~^((8'ha1) >= (7'h42)))}}}, 
parameter param137 = (~|((^{(param136 && param136), (^param136)}) ? (param136 * ({param136, param136} || (~param136))) : ({{(7'h43), (8'hba)}} ? ((param136 ? param136 : param136) != (~&param136)) : (~(param136 == param136))))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h203):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire91;
  input wire signed [(5'h12):(1'h0)] wire90;
  input wire signed [(5'h10):(1'h0)] wire89;
  input wire [(5'h13):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire133;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire signed [(4'h9):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire125,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire94,
                 wire93,
                 wire92,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg124,
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
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire92 = $unsigned(wire88[(2'h3):(1'h0)]);
  assign wire93 = (^wire88);
  assign wire94 = {wire91[(5'h10):(4'hc)]};
  always
    @(posedge clk) begin
      reg95 <= wire90[(1'h1):(1'h1)];
      reg96 <= $signed((reg95 & $signed(wire88)));
      reg97 <= wire89[(3'h5):(2'h3)];
      reg98 <= wire92;
    end
  assign wire99 = {$signed(($unsigned(((7'h44) ? (8'hac) : wire90)) ?
                          $signed(wire91[(2'h2):(1'h0)]) : ($signed(reg95) ?
                              (~(7'h41)) : $signed(wire89))))};
  assign wire100 = $unsigned(reg97[(3'h4):(1'h0)]);
  assign wire101 = {(((reg96 || $signed(wire99)) - reg95[(3'h5):(2'h3)]) ?
                           {wire89} : {((wire92 ?
                                   (8'hb4) : (8'hb4)) && $signed(wire92)),
                               (|{wire89, (8'ha3)})})};
  assign wire102 = $signed(((!wire99) & $signed(($unsigned((8'hba)) ?
                       (~^wire100) : $unsigned(wire99)))));
  assign wire103 = $signed($unsigned($unsigned((reg95 ?
                       (^~(7'h41)) : {wire88}))));
  assign wire104 = $signed($signed($signed($signed(wire90[(2'h2):(1'h1)]))));
  assign wire105 = {$signed($unsigned($unsigned(((8'hb8) >= reg97))))};
  assign wire106 = ($signed(wire103) ?
                       reg96 : $unsigned(wire99[(3'h4):(1'h1)]));
  assign wire107 = ((~|({reg98[(3'h4):(3'h4)]} * (~^(~wire99)))) <<< (wire104[(2'h3):(1'h1)] ?
                       $signed($unsigned(reg96[(3'h5):(1'h1)])) : (($unsigned((8'ha4)) << $signed(reg98)) ?
                           (wire104[(2'h2):(1'h0)] >>> wire88[(3'h4):(3'h4)]) : (8'h9d))));
  assign wire108 = $signed(wire94);
  assign wire109 = (8'ha2);
  always
    @(posedge clk) begin
      if ($unsigned({wire94,
          (^((wire108 ? wire94 : wire92) > $unsigned(wire100)))}))
        begin
          reg110 <= wire109;
        end
      else
        begin
          reg110 <= $unsigned((wire107[(1'h1):(1'h0)] ?
              $signed($unsigned(wire107)) : reg96[(3'h5):(2'h3)]));
        end
      if (((~|$unsigned(wire91)) == reg110[(1'h0):(1'h0)]))
        begin
          reg111 <= (8'ha7);
          if ($signed(($signed(wire92) | reg98[(4'h9):(2'h2)])))
            begin
              reg112 <= $signed((wire100[(1'h0):(1'h0)] | $unsigned(wire103)));
            end
          else
            begin
              reg112 <= reg96[(2'h3):(1'h0)];
              reg113 <= (~&((^~reg111) | {{$unsigned(wire107),
                      (wire93 + reg95)},
                  reg96}));
              reg114 <= $signed((($unsigned((~&wire104)) << $signed((wire109 + wire104))) ?
                  wire107 : {(wire92[(5'h10):(4'he)] ~^ ((8'hac) * reg96))}));
            end
          if ($unsigned(wire104[(1'h1):(1'h1)]))
            begin
              reg115 <= {wire103[(4'hd):(4'h9)], (8'h9f)};
              reg116 <= $signed((-($unsigned((reg112 & wire88)) >> $unsigned(wire92))));
              reg117 <= $unsigned(wire101[(4'hb):(2'h3)]);
              reg118 <= $signed(reg114);
              reg119 <= reg113;
            end
          else
            begin
              reg115 <= (($unsigned((|reg116)) ^~ wire109[(2'h3):(2'h2)]) ?
                  {(^~$unsigned($unsigned((8'had)))),
                      reg114[(4'hb):(1'h1)]} : ((($signed((7'h41)) || (7'h42)) ?
                      $unsigned((reg112 ?
                          (8'h9e) : wire107)) : $unsigned((wire107 ?
                          wire105 : wire109))) >= (~^((~^wire99) >>> {(7'h44),
                      wire101}))));
              reg116 <= wire105;
            end
          reg120 <= $signed({(^(7'h42)),
              (((+wire92) >= (-wire100)) ?
                  $unsigned(reg97) : ($unsigned(reg113) ?
                      wire107 : wire100[(2'h2):(1'h1)]))});
          if (((($unsigned($signed(wire93)) >> reg114) ?
              ({(8'haa), $signed((8'hac))} >>> $signed(wire102)) : (wire106 ?
                  (~$signed(reg117)) : ($unsigned(wire101) ?
                      $signed(wire92) : (reg113 ?
                          wire105 : reg95)))) && (reg120[(2'h3):(2'h3)] ?
              (~^wire90[(5'h10):(3'h7)]) : reg113)))
            begin
              reg121 <= (((wire105[(3'h6):(2'h2)] * wire92[(4'hc):(4'ha)]) ?
                  reg117[(3'h5):(3'h5)] : {{$unsigned(wire99)}}) & (~^(~^(~|$unsigned(wire107)))));
              reg122 <= (wire99[(3'h6):(1'h1)] != (^~(7'h41)));
              reg123 <= reg98[(3'h7):(3'h5)];
            end
          else
            begin
              reg121 <= $unsigned($unsigned((~(~(wire100 ?
                  (8'ha0) : (8'hb1))))));
              reg122 <= ({$unsigned($unsigned(reg116[(5'h10):(2'h2)]))} ?
                  reg98 : $unsigned(wire107[(4'hd):(4'h9)]));
              reg123 <= wire90[(2'h3):(2'h2)];
            end
        end
      else
        begin
          if (($signed(((reg118[(2'h2):(2'h2)] < (8'ha1)) ?
                  $unsigned((~|reg119)) : wire107[(5'h10):(4'hd)])) ?
              $signed($signed((wire109[(2'h3):(2'h3)] ?
                  (reg121 ? wire102 : reg110) : (wire92 ?
                      wire105 : (8'ha8))))) : $signed((&({(7'h41)} ?
                  $unsigned(reg97) : $signed(reg123))))))
            begin
              reg111 <= (|((!$signed((~&wire91))) ?
                  {((wire107 ? reg117 : reg123) ? reg98 : wire108),
                      (8'ha4)} : wire101));
              reg112 <= {wire105[(3'h7):(2'h3)],
                  {(8'hbb), {(|$signed(wire91)), wire102[(4'h9):(2'h3)]}}};
            end
          else
            begin
              reg111 <= (~&({(&(^~reg95)),
                  (wire89 ? $signed(reg112) : reg96)} + ((!$unsigned((8'ha9))) ?
                  reg111[(1'h1):(1'h1)] : $signed($signed(wire92)))));
            end
          reg113 <= {wire107[(4'hf):(4'hc)],
              $unsigned($unsigned(wire105[(1'h0):(1'h0)]))};
          reg114 <= (wire100 >> (~&wire89));
        end
      reg124 <= (wire93[(4'hb):(4'ha)] ?
          $signed($unsigned(reg117[(3'h4):(2'h3)])) : (wire88 ?
              reg118[(2'h2):(2'h2)] : reg114[(3'h4):(2'h3)]));
    end
  assign wire125 = (!(!$unsigned(({reg95, (8'ha8)} > reg124[(3'h4):(2'h2)]))));
  always
    @(posedge clk) begin
      if ($signed((($signed($signed(reg121)) ?
              {$unsigned((8'hb5)), $signed(reg112)} : {(~^(7'h41))}) ?
          reg98[(3'h7):(2'h2)] : $unsigned($unsigned((+wire100))))))
        begin
          reg126 <= {$unsigned({$unsigned((!wire88)),
                  ((reg96 ? reg113 : wire91) ?
                      $signed((8'h9e)) : $unsigned(reg96))})};
          reg127 <= wire105;
        end
      else
        begin
          reg126 <= $unsigned(wire89[(5'h10):(4'hb)]);
          reg127 <= (($unsigned((reg124 >= ((8'h9e) ?
                  reg110 : (7'h42)))) ^ (reg119 + wire104)) ?
              ($unsigned((!(reg127 ~^ wire109))) <<< $signed($signed(wire108[(5'h11):(4'h9)]))) : $unsigned($unsigned((^$unsigned((8'hb0))))));
          if ($unsigned(reg98[(1'h1):(1'h0)]))
            begin
              reg128 <= (^~$unsigned($unsigned({(wire91 ? reg112 : reg115)})));
            end
          else
            begin
              reg128 <= ($signed({$signed(reg95[(2'h2):(1'h1)]),
                      wire107[(3'h6):(1'h1)]}) ?
                  reg110 : (reg127 + reg117));
              reg129 <= $unsigned(reg95[(1'h1):(1'h0)]);
              reg130 <= wire92[(3'h5):(1'h0)];
              reg131 <= ($signed((~|(reg95 ?
                  $unsigned(reg121) : wire102[(4'h9):(3'h5)]))) + reg122);
            end
        end
      reg132 <= (reg97[(3'h5):(2'h3)] ?
          (8'haa) : (^~$unsigned((wire125 ? (reg123 * wire108) : (|(7'h43))))));
    end
  assign wire133 = ($unsigned(({wire91, reg111} ?
                       reg126[(4'h8):(3'h5)] : {$signed(reg98)})) | reg116[(4'hf):(4'hd)]);
  assign wire134 = reg120;
  assign wire135 = $signed((~&(~|(|(wire99 ? wire104 : reg124)))));
endmodule

module module14
#(parameter param77 = (~({(((8'haf) >= (8'ha7)) ? ((8'haa) + (7'h42)) : (~^(8'hb7))), (~&((8'ha3) ? (8'ha7) : (8'ha3)))} - (8'hbe))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h2ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  assign y = {wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire58,
                 wire29,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg75,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire20 = (($unsigned(((wire19 ? wire16 : wire18) >= {wire16,
                          wire17})) >> (8'hbe)) ?
                      $signed((-wire16[(4'hf):(3'h7)])) : ((((&wire18) ?
                                  (wire16 != wire19) : (wire17 ?
                                      wire19 : wire18)) ?
                              $signed(wire18[(1'h0):(1'h0)]) : (+wire16[(4'ha):(3'h7)])) ?
                          (!wire15) : $unsigned($signed($unsigned(wire19)))));
  assign wire21 = ($signed(wire18) || wire18);
  assign wire22 = wire16[(4'he):(1'h0)];
  assign wire23 = wire18;
  assign wire24 = ((~(|(+wire15[(1'h1):(1'h1)]))) > $signed((wire15[(4'h9):(3'h5)] ?
                      wire23 : (|{(8'ha2)}))));
  assign wire25 = ($unsigned((wire22[(5'h13):(3'h7)] ?
                          $unsigned($unsigned(wire16)) : (((8'hae) == wire16) > wire19))) ?
                      $unsigned((|$signed((wire21 ?
                          (8'hb4) : wire16)))) : (-wire18[(2'h3):(1'h1)]));
  assign wire26 = (8'ha4);
  always
    @(posedge clk) begin
      reg27 <= ({({(!wire19), $signed(wire22)} + wire18),
          ($signed($signed(wire23)) ^ $signed($unsigned(wire25)))} * $unsigned(($unsigned((~wire23)) ?
          {(8'ha5), $signed(wire17)} : $unsigned($unsigned((8'ha4))))));
      reg28 <= wire18;
    end
  assign wire29 = ((($signed($unsigned(wire25)) && (wire25 ?
                          wire23[(4'h9):(2'h3)] : (wire15 <<< wire19))) ?
                      (8'hb0) : $unsigned(($signed(wire26) << wire17[(2'h2):(2'h2)]))) >>> wire20);
  always
    @(posedge clk) begin
      if (wire26)
        begin
          if ($unsigned($signed($signed((8'hb3)))))
            begin
              reg30 <= wire16[(4'h8):(4'h8)];
              reg31 <= wire24[(4'ha):(2'h2)];
            end
          else
            begin
              reg30 <= (wire24 <= $signed((($unsigned(reg31) ?
                  {wire26, wire18} : reg31[(1'h0):(1'h0)]) <<< wire18)));
              reg31 <= wire29[(1'h0):(1'h0)];
              reg32 <= $unsigned(reg30[(4'hd):(3'h5)]);
              reg33 <= $signed(wire29[(2'h3):(1'h1)]);
            end
          reg34 <= {$unsigned(wire29[(2'h3):(1'h0)]),
              ((|(8'hb8)) ?
                  ($signed($unsigned(reg32)) != {$unsigned(wire18),
                      (wire24 - wire24)}) : ($signed($unsigned(reg27)) != reg30[(5'h11):(3'h4)]))};
        end
      else
        begin
          if ((~reg32))
            begin
              reg30 <= ($signed($unsigned(((wire16 << wire22) ?
                  $unsigned(wire18) : (~&wire20)))) | ($unsigned(((wire21 ?
                  wire16 : wire29) ~^ (^~wire21))) != reg33));
              reg31 <= $unsigned(($signed({(wire23 ? wire19 : wire20),
                  $unsigned(wire16)}) ~^ (~((7'h41) >>> (+(8'hbb))))));
              reg32 <= ((((|wire22) ^ wire18[(3'h6):(3'h6)]) <<< $unsigned((|$signed(wire21)))) <<< ({{(8'hb0)},
                      $unsigned((wire18 ? wire16 : (8'ha5)))} ?
                  ($unsigned($signed((8'hab))) + reg32) : wire25));
            end
          else
            begin
              reg30 <= $signed((&(-wire29[(1'h1):(1'h1)])));
            end
          reg33 <= ((~^wire26) << (~reg33[(3'h5):(2'h2)]));
          if ((((-reg33[(3'h6):(3'h4)]) ?
              reg31 : ({(reg27 - (8'h9c)),
                  wire16} > wire25[(2'h2):(1'h1)])) * $signed(wire21[(4'he):(3'h7)])))
            begin
              reg34 <= (~&(+wire22[(4'h9):(2'h2)]));
              reg35 <= $signed((+(wire23[(2'h3):(1'h1)] ^ (^~$unsigned(wire25)))));
              reg36 <= (((~^((^wire25) ?
                  $unsigned(reg27) : (|(8'hbb)))) >> (wire22 ^ (wire16 ^~ reg27[(3'h7):(3'h5)]))) == (~|{reg31}));
              reg37 <= ({wire16[(4'h9):(1'h0)]} ?
                  ((~^wire26[(2'h2):(2'h2)]) ^~ ({(~&reg36),
                      (&wire16)} <<< (~^reg32[(2'h2):(1'h1)]))) : reg35[(4'hb):(3'h6)]);
              reg38 <= {$unsigned($unsigned($signed($unsigned((8'hb6))))),
                  wire29};
            end
          else
            begin
              reg34 <= ((!reg37) + ($unsigned(wire23[(4'hc):(4'hc)]) ?
                  wire26[(1'h1):(1'h0)] : {{wire25[(3'h7):(3'h4)]},
                      (reg38[(5'h11):(2'h2)] < (~reg27))}));
            end
          if (((8'hab) ?
              $unsigned($signed(wire26[(2'h3):(2'h3)])) : $signed($signed({(reg35 ?
                      wire17 : wire17)}))))
            begin
              reg39 <= {$signed(reg38[(4'hb):(1'h1)])};
            end
          else
            begin
              reg39 <= {$signed($unsigned($unsigned($signed(reg28))))};
              reg40 <= ((reg32 > (~^(((8'ha4) ? reg31 : reg38) ?
                  reg35[(4'h8):(1'h1)] : wire25))) >> $unsigned((((wire26 ?
                      wire24 : reg39) == (^~wire23)) ?
                  ((reg27 - reg33) ? $signed(reg35) : wire18) : (|(reg33 ?
                      (8'ha0) : wire23)))));
              reg41 <= wire23[(3'h7):(3'h6)];
              reg42 <= $signed(reg37[(1'h1):(1'h1)]);
              reg43 <= $signed((^~(({(8'ha5),
                  reg33} ~^ reg41[(4'h8):(3'h4)]) << (wire20 ?
                  (~^reg38) : wire29))));
            end
        end
      reg44 <= $signed((^(wire21[(1'h1):(1'h0)] && reg43[(3'h7):(1'h0)])));
      if (wire17[(1'h1):(1'h1)])
        begin
          reg45 <= reg28;
        end
      else
        begin
          reg45 <= ((!reg45) ?
              ($unsigned(((wire25 ~^ wire18) > $signed(wire18))) ?
                  reg45 : wire24[(4'ha):(3'h4)]) : {((reg30 < $signed(reg37)) ?
                      $signed($signed(reg34)) : (reg34[(4'hf):(2'h3)] != (wire24 != reg32))),
                  wire20});
        end
      reg46 <= ((7'h44) ?
          ($signed(reg28[(1'h1):(1'h0)]) ?
              $unsigned((&$signed(reg33))) : ($unsigned($unsigned(wire16)) ?
                  (8'hbd) : ({reg42} >> {reg41}))) : (^~(reg30 ?
              $unsigned((wire17 ? reg45 : reg27)) : (~^wire25))));
      if (((((~reg39) ? reg43[(4'h8):(1'h1)] : (!reg35)) ?
              $unsigned((7'h40)) : ((~((8'hb5) ? (8'hb2) : reg34)) ?
                  wire17 : (reg39[(4'hd):(1'h0)] ^ reg39[(2'h3):(1'h1)]))) ?
          (-reg35[(4'ha):(3'h5)]) : reg39))
        begin
          if ((((((reg42 <<< reg43) ? (reg37 ? reg46 : reg31) : (^reg44)) ?
                  $unsigned(wire21) : reg28) * ($signed($signed(reg38)) >= ($signed(wire18) ?
                  $signed(reg38) : (reg44 ? reg41 : wire23)))) ?
              wire21[(4'hf):(2'h2)] : $unsigned(wire21)))
            begin
              reg47 <= (~&wire23);
              reg48 <= ($unsigned(reg28[(1'h0):(1'h0)]) >>> $signed((reg34[(4'hd):(2'h2)] ~^ reg42)));
            end
          else
            begin
              reg47 <= reg30[(2'h3):(2'h2)];
              reg48 <= (reg33 > (+(^(&(reg39 <<< wire29)))));
              reg49 <= $signed((($unsigned(reg38[(5'h12):(4'hd)]) ?
                  $unsigned(wire16) : $signed(reg38[(1'h1):(1'h1)])) ^~ (8'ha5)));
              reg50 <= (|(((!(wire19 != wire15)) ?
                      ($signed(reg30) ?
                          wire21[(1'h1):(1'h0)] : wire21[(4'hb):(2'h2)]) : wire16[(4'hc):(4'h8)]) ?
                  (reg40 ?
                      {reg40[(4'hc):(4'hc)],
                          reg48[(5'h12):(1'h0)]} : {wire19}) : $unsigned(($unsigned(reg43) || (reg40 || reg43)))));
              reg51 <= (|{($signed(reg46[(1'h1):(1'h1)]) ?
                      (~|(+(8'hbc))) : ((reg47 >= reg40) ?
                          wire21 : (reg35 ^ reg45))),
                  $unsigned($signed(((8'hb7) ? reg37 : reg45)))});
            end
        end
      else
        begin
          reg47 <= (8'h9e);
          reg48 <= wire17;
          if (wire22[(4'ha):(3'h4)])
            begin
              reg49 <= wire16[(4'h9):(3'h4)];
              reg50 <= (reg34[(3'h7):(3'h4)] ?
                  (wire22 >= $signed(reg50[(4'ha):(3'h4)])) : wire23[(5'h12):(5'h12)]);
              reg51 <= (+reg36[(3'h5):(2'h2)]);
            end
          else
            begin
              reg49 <= {(^~(reg48 ?
                      reg45[(2'h3):(2'h2)] : {(wire15 ? wire26 : (8'hab)),
                          $unsigned((8'hb0))})),
                  reg28[(1'h1):(1'h0)]};
              reg50 <= {((^~wire25[(2'h3):(1'h0)]) ?
                      $signed((wire19[(3'h7):(1'h0)] ?
                          reg28[(2'h2):(1'h1)] : (reg38 ?
                              (8'ha1) : reg51))) : $signed(reg31)),
                  {reg38[(4'he):(4'hc)],
                      (({(8'hbc), reg37} ?
                          wire24 : ((8'ha8) >> (8'hab))) && (wire29 <<< wire17[(3'h5):(2'h3)]))}};
              reg51 <= ($unsigned($signed({wire24[(4'h8):(3'h7)]})) < (!(($unsigned(reg40) ^~ reg47) >>> $signed(reg49))));
              reg52 <= (~^$unsigned(({(&reg33)} || reg33[(3'h6):(3'h6)])));
            end
          if ((~|$unsigned((($signed(reg32) ?
              $signed(reg27) : reg35) >>> ($unsigned((8'ha1)) ?
              (~&reg43) : (+wire18))))))
            begin
              reg53 <= (^$unsigned($unsigned((reg33[(4'h8):(3'h7)] ~^ $unsigned(wire23)))));
            end
          else
            begin
              reg53 <= $signed(wire22);
              reg54 <= reg49[(2'h2):(1'h1)];
              reg55 <= $unsigned((~&(reg38 ^ $signed($unsigned(reg34)))));
              reg56 <= $signed(reg42);
            end
          reg57 <= (~&({(!reg52[(5'h10):(4'ha)]),
                  (reg54 ? $signed(reg44) : (|wire18))} ?
              (-(((8'ha3) ? reg53 : reg27) ?
                  (reg40 << wire22) : ((8'ha9) ?
                      reg28 : reg42))) : ($unsigned({reg27}) ?
                  {((8'h9c) ? wire17 : (8'hbb)), $signed(reg54)} : (wire17 ?
                      reg45[(1'h1):(1'h0)] : $unsigned(reg33)))));
        end
    end
  assign wire58 = $signed(((wire16[(4'hc):(4'h8)] ^~ reg46) || reg45[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      if (($signed({$unsigned(reg49[(3'h4):(3'h4)])}) ?
          $unsigned($unsigned(reg35)) : wire23))
        begin
          reg59 <= reg44;
          reg60 <= $signed(wire17);
        end
      else
        begin
          reg59 <= wire20;
          reg60 <= (($unsigned((((8'ha3) <= (8'ha7)) * {reg49})) != (|$unsigned((reg38 >> (8'ha0))))) ?
              (wire22 >>> reg50[(3'h5):(1'h1)]) : (8'hb6));
          if ($signed({(reg39 ?
                  $unsigned((reg32 ^~ reg44)) : (-wire21[(4'hc):(3'h6)])),
              (&reg45[(2'h2):(1'h1)])}))
            begin
              reg61 <= $unsigned($unsigned((reg53 + $signed($unsigned(reg47)))));
              reg62 <= (reg60[(4'h9):(3'h7)] >> (^~reg60[(3'h6):(2'h3)]));
              reg63 <= (wire24 - $unsigned(({(~&(7'h41))} ?
                  $signed((~&reg62)) : ($signed(reg33) + (reg51 ?
                      (8'hbf) : reg55)))));
              reg64 <= (^wire58[(4'h9):(4'h8)]);
              reg65 <= $signed(reg39[(3'h7):(3'h4)]);
            end
          else
            begin
              reg61 <= (!$unsigned($signed((-$unsigned(reg62)))));
              reg62 <= reg41;
              reg63 <= (({$signed((reg33 >= reg54))} >> wire20) ?
                  ($signed(reg46) <= reg39[(1'h1):(1'h0)]) : {($signed(reg65[(2'h2):(1'h0)]) ?
                          (!$signed(reg40)) : reg45[(1'h0):(1'h0)])});
            end
          reg66 <= {wire15[(2'h3):(2'h2)]};
          reg67 <= reg46[(2'h3):(2'h3)];
        end
      reg68 <= ((((8'hbe) >> reg45[(1'h0):(1'h0)]) ?
          {reg53[(4'h9):(3'h4)],
              (reg27 <<< reg63[(3'h5):(2'h2)])} : (^$signed((wire26 ^ reg50)))) == reg37[(2'h3):(2'h2)]);
      reg69 <= $signed({$signed(reg57[(3'h7):(2'h3)]), reg36});
    end
  assign wire70 = reg67;
  assign wire71 = (~&((~|wire26) < {$signed((8'hb9)),
                      (wire18[(2'h2):(1'h0)] ^ (+reg40))}));
  assign wire72 = (~(~|reg37[(2'h2):(2'h2)]));
  assign wire73 = {$signed(((((8'ha7) + wire22) ?
                              (^~reg52) : wire29[(2'h2):(1'h0)]) ?
                          (^~wire24[(3'h4):(3'h4)]) : ((reg60 ~^ wire72) ?
                              ((8'haf) <= (8'hae)) : (~wire72))))};
  assign wire74 = reg44[(4'hc):(3'h5)];
  always
    @(posedge clk) begin
      reg75 <= wire70[(1'h1):(1'h1)];
    end
  assign wire76 = (reg66[(1'h1):(1'h0)] - ($signed({(wire19 ?
                          reg37 : reg41)}) > reg50[(4'h9):(3'h5)]));
endmodule

module module177  (y, clk, wire181, wire180, wire179, wire178);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire181;
  input wire [(3'h4):(1'h0)] wire180;
  input wire [(2'h3):(1'h0)] wire179;
  input wire signed [(4'hc):(1'h0)] wire178;
  wire [(3'h4):(1'h0)] wire206;
  wire signed [(2'h2):(1'h0)] wire205;
  wire [(5'h14):(1'h0)] wire203;
  wire signed [(4'hf):(1'h0)] wire202;
  wire [(3'h6):(1'h0)] wire201;
  wire signed [(4'hc):(1'h0)] wire189;
  wire signed [(5'h12):(1'h0)] wire188;
  wire signed [(5'h12):(1'h0)] wire187;
  wire signed [(5'h15):(1'h0)] wire184;
  wire signed [(4'hb):(1'h0)] wire183;
  wire [(3'h4):(1'h0)] wire182;
  reg signed [(4'hb):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg199 = (1'h0);
  reg [(5'h14):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg196 = (1'h0);
  reg [(3'h4):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg193 = (1'h0);
  reg [(3'h4):(1'h0)] reg192 = (1'h0);
  reg [(5'h10):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg190 = (1'h0);
  reg [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(5'h12):(1'h0)] reg185 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire203,
                 wire202,
                 wire201,
                 wire189,
                 wire188,
                 wire187,
                 wire184,
                 wire183,
                 wire182,
                 reg204,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg186,
                 reg185,
                 (1'h0)};
  assign wire182 = ((^$unsigned($signed((wire180 <<< wire178)))) ?
                       wire181 : (({$signed(wire178)} ?
                           (~(wire179 ?
                               wire178 : wire179)) : ($signed(wire179) ?
                               wire181 : (|wire181))) * $unsigned(((~wire180) ?
                           $unsigned(wire180) : $unsigned(wire181)))));
  assign wire183 = $signed($signed(((~wire179[(1'h0):(1'h0)]) ?
                       wire181[(1'h1):(1'h0)] : $signed(((8'hb9) - wire179)))));
  assign wire184 = ($signed(((((8'hbd) > (8'hb0)) <= wire183) ?
                           wire180[(3'h4):(2'h3)] : {wire179[(2'h3):(1'h1)],
                               wire179[(1'h1):(1'h1)]})) ?
                       $unsigned((|wire179[(1'h0):(1'h0)])) : wire180);
  always
    @(posedge clk) begin
      reg185 <= ((wire179 ?
          ($unsigned((&(8'ha9))) ?
              ((wire181 != wire181) ?
                  (wire178 && wire181) : wire178) : ($signed(wire179) ?
                  (+wire180) : wire179)) : (wire178[(3'h7):(2'h2)] | ($signed(wire184) ^ ((8'hb3) ?
              wire181 : wire181)))) ~^ wire183);
      reg186 <= wire183[(2'h2):(1'h0)];
    end
  assign wire187 = (($unsigned($signed((wire178 ?
                       (8'hbc) : wire184))) > (~^((&(8'ha5)) ?
                       (reg185 ?
                           wire183 : wire180) : $signed((8'ha6))))) ^~ {($signed((|wire184)) ?
                           wire181 : ((reg185 << wire178) ?
                               $signed(wire184) : wire179[(2'h2):(2'h2)])),
                       (+$unsigned($unsigned(reg186)))});
  assign wire188 = $unsigned($unsigned((8'ha1)));
  assign wire189 = ({(($unsigned(wire188) + {wire178}) <= wire179),
                           (+wire179[(2'h3):(1'h0)])} ?
                       (+{wire178[(4'hc):(4'h9)]}) : (reg185 ?
                           $signed(reg186) : $unsigned($signed((wire184 << wire184)))));
  always
    @(posedge clk) begin
      if (wire187)
        begin
          reg190 <= $signed(((-$signed({wire181})) ?
              (~$signed((-(8'hbb)))) : $signed(wire178[(4'hb):(3'h4)])));
          reg191 <= (&(-$unsigned((8'ha6))));
          if (((reg186 ?
              {((reg191 ? wire187 : reg191) ?
                      $unsigned(wire187) : (~^wire180))} : $signed((wire189[(4'ha):(1'h1)] >>> (8'h9d)))) & wire179[(2'h2):(1'h0)]))
            begin
              reg192 <= (wire183 >= (&$signed(({wire180} ?
                  (^wire184) : wire182))));
              reg193 <= $signed({$signed(wire178), wire180});
              reg194 <= (~&$signed({$signed(reg190[(2'h2):(1'h1)]),
                  ((+wire189) ?
                      {wire179, wire182} : (reg193 ? wire178 : wire181))}));
              reg195 <= $unsigned($unsigned(((-reg190[(1'h1):(1'h0)]) <= wire189)));
            end
          else
            begin
              reg192 <= $signed(reg185);
              reg193 <= $signed(reg186[(3'h6):(2'h2)]);
              reg194 <= reg194;
            end
          if ((-wire180[(2'h3):(2'h3)]))
            begin
              reg196 <= $unsigned((!($signed(wire184[(3'h7):(1'h1)]) ?
                  (|((8'hb0) || wire179)) : ($unsigned((8'hb6)) ?
                      $unsigned(reg191) : $unsigned(wire182)))));
              reg197 <= $signed(reg186[(1'h1):(1'h1)]);
              reg198 <= {($signed((+(+reg191))) ^ $signed(reg185[(2'h2):(1'h0)])),
                  (~|(8'ha2))};
              reg199 <= $unsigned((8'h9f));
            end
          else
            begin
              reg196 <= $unsigned(((reg194 >= wire183) ?
                  reg194 : (!reg192[(1'h1):(1'h0)])));
            end
          reg200 <= $unsigned({{(reg193[(2'h2):(1'h0)] ?
                      reg198[(1'h1):(1'h1)] : ((8'ha7) ? wire183 : (8'hb6)))}});
        end
      else
        begin
          reg190 <= $unsigned(wire182[(2'h3):(1'h0)]);
          reg191 <= {reg196[(3'h7):(1'h1)]};
          reg192 <= ($unsigned($unsigned($signed((reg199 ?
                  (8'ha3) : (8'ha3))))) ?
              $signed($signed(reg200[(3'h4):(2'h3)])) : (((~&(reg200 >= reg192)) ?
                  reg197[(1'h1):(1'h1)] : wire181) || $signed($unsigned($unsigned(wire180)))));
          reg193 <= (+{$unsigned($unsigned(wire180[(1'h0):(1'h0)])),
              $signed({$unsigned(reg199)})});
          if (wire182)
            begin
              reg194 <= (8'hb0);
              reg195 <= $signed(wire180[(2'h2):(1'h0)]);
              reg196 <= reg194;
            end
          else
            begin
              reg194 <= $signed(((+($signed(wire187) ?
                      (~^reg196) : (reg196 ? reg198 : reg196))) ?
                  (wire182[(1'h1):(1'h1)] ?
                      {(8'hb9)} : (reg192[(1'h0):(1'h0)] ?
                          (~&reg198) : $unsigned((8'hb1)))) : (^reg194)));
              reg195 <= $unsigned(($signed(reg193) | $unsigned((reg193[(4'h8):(1'h1)] >> $unsigned(reg197)))));
              reg196 <= (~^((~&reg195[(2'h2):(1'h0)]) ?
                  (+(reg198[(5'h12):(4'hb)] ?
                      reg186 : $signed(reg192))) : reg199[(2'h3):(2'h3)]));
              reg197 <= $unsigned((8'hb1));
            end
        end
    end
  assign wire201 = (~|($unsigned(wire179[(2'h2):(1'h1)]) ?
                       ($signed({(8'hae)}) ?
                           {reg193} : wire187[(4'hd):(4'ha)]) : $signed((|{wire188}))));
  assign wire202 = $signed(({reg198} | (reg199[(4'hb):(4'ha)] >>> (^~$signed((7'h42))))));
  assign wire203 = {$unsigned((wire178 - $signed((-reg198))))};
  always
    @(posedge clk) begin
      reg204 <= wire188[(4'h9):(2'h3)];
    end
  assign wire205 = reg195;
  assign wire206 = (8'ha1);
endmodule
