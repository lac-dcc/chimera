module top
#(parameter param192 = (!((~(~(~|(7'h44)))) <<< {(^((7'h44) ~^ (8'ha3)))})), 
parameter param193 = (8'hb6))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire191;
  wire signed [(4'hc):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire187;
  wire [(5'h14):(1'h0)] wire186;
  wire [(5'h13):(1'h0)] wire184;
  wire signed [(5'h12):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg190 = (1'h0);
  reg [(4'hf):(1'h0)] reg189 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  assign y = {wire191,
                 wire188,
                 wire187,
                 wire186,
                 wire184,
                 wire125,
                 wire124,
                 wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire5,
                 reg190,
                 reg189,
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
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire5 = $unsigned({wire2});
  module6 #() modinst104 (wire103, clk, wire4, wire5, wire2, wire3);
  assign wire105 = {(~|(8'h9e)),
                       {wire103[(2'h3):(1'h1)],
                           $unsigned(($signed(wire1) ?
                               $unsigned(wire2) : ((8'ha1) <<< wire103)))}};
  assign wire106 = ({wire3} != (^~$signed(($signed((8'haa)) ?
                       (wire103 ? wire0 : (8'hac)) : wire5[(2'h2):(1'h1)]))));
  assign wire107 = $unsigned(wire103[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg108 <= wire2;
      if (((!((8'ha0) ?
          {(wire1 < wire5)} : ((wire1 < wire0) ?
              $signed(reg108) : $signed(wire106)))) - wire105))
        begin
          reg109 <= (wire0 ^ $signed($unsigned(wire3)));
          reg110 <= (($signed($unsigned((^wire2))) || $unsigned({wire107[(1'h1):(1'h1)]})) && $signed(wire106));
          reg111 <= (+($unsigned(wire106[(2'h2):(1'h0)]) ?
              $unsigned(({wire3, (8'hb2)} ^~ {wire107,
                  (8'haa)})) : (wire106[(1'h1):(1'h1)] ?
                  ($signed(wire103) ?
                      (~|wire2) : reg108[(3'h5):(3'h4)]) : wire4[(3'h7):(3'h4)])));
        end
      else
        begin
          if (wire3)
            begin
              reg109 <= $signed(reg111[(4'h8):(4'h8)]);
              reg110 <= wire4;
              reg111 <= (~^wire4);
              reg112 <= wire107;
              reg113 <= reg108;
            end
          else
            begin
              reg109 <= $signed($unsigned($signed($unsigned((reg113 ?
                  wire107 : wire5)))));
              reg110 <= ((wire105 ?
                      $signed($signed(wire106)) : (!$signed((&(8'hbe))))) ?
                  (reg112[(2'h2):(2'h2)] >> ($signed(reg108[(4'h8):(1'h0)]) ?
                      {$signed(wire0)} : wire107)) : $unsigned(wire4));
              reg111 <= (({(~^(~&wire105))} ?
                  (!wire105) : (($signed(reg112) < {wire1,
                      reg112}) | ((wire5 | reg110) ?
                      {wire3} : wire107))) ^ ((reg110[(3'h5):(1'h0)] ~^ wire107) ?
                  wire103 : (reg113 >> reg110)));
              reg112 <= $signed($signed($unsigned((-(wire3 != reg109)))));
              reg113 <= $unsigned($unsigned(reg110));
            end
          reg114 <= (-wire2[(1'h1):(1'h0)]);
          reg115 <= wire2;
          reg116 <= wire0;
        end
      reg117 <= $unsigned((8'had));
      if (reg108)
        begin
          reg118 <= $signed($unsigned((8'hab)));
          reg119 <= (wire0 || (8'hb5));
          reg120 <= {(wire103[(2'h3):(1'h0)] ~^ wire0[(3'h7):(1'h1)]), reg111};
          if ($unsigned((($unsigned($unsigned(reg114)) * ($unsigned(wire4) ^ $unsigned(reg111))) - $unsigned({(wire106 ?
                  reg117 : (8'hbe))}))))
            begin
              reg121 <= reg120;
            end
          else
            begin
              reg121 <= (8'hab);
              reg122 <= (+((wire0 ?
                  reg118 : (^~$unsigned((8'ha3)))) || $signed(((+wire5) ?
                  $unsigned(reg110) : (reg109 << wire3)))));
            end
          reg123 <= (reg119 != $signed($signed(wire3[(4'ha):(4'ha)])));
        end
      else
        begin
          reg118 <= (((^(-$signed(reg119))) ?
              $unsigned(reg119[(4'h8):(3'h5)]) : ((+(wire2 ^ wire2)) ?
                  $signed(reg116[(2'h3):(2'h2)]) : reg111[(1'h0):(1'h0)])) + $unsigned(wire0));
        end
    end
  assign wire124 = $unsigned((wire107 + (((reg116 >>> reg119) ?
                       (8'had) : reg120[(3'h4):(3'h4)]) && $signed((reg111 - reg110)))));
  assign wire125 = $signed(($unsigned((~&((8'ha3) ?
                       reg109 : (8'ha4)))) * (reg122 ?
                       {(reg117 ? reg118 : (8'hb4)),
                           $unsigned(wire103)} : $signed((reg116 + wire105)))));
  module126 #() modinst185 (.y(wire184), .wire127(reg117), .wire129(wire5), .wire130(reg122), .clk(clk), .wire128(wire3));
  assign wire186 = (reg115 ? wire1 : wire0[(4'hb):(3'h5)]);
  assign wire187 = (&reg111);
  assign wire188 = $signed((((^{wire3}) * ((wire2 != wire5) ?
                           ((8'ha6) ^~ reg109) : reg111)) ?
                       reg111[(4'hc):(3'h4)] : (wire125[(3'h5):(2'h2)] ?
                           $unsigned(wire2[(3'h4):(2'h2)]) : $unsigned((|wire184)))));
  always
    @(posedge clk) begin
      reg189 <= (wire105 ? wire1[(3'h5):(3'h5)] : reg121);
      reg190 <= (~&wire103);
    end
  assign wire191 = $unsigned(((wire187[(4'ha):(2'h3)] ?
                           {reg113[(2'h3):(2'h3)]} : (!$unsigned((8'ha9)))) ?
                       {wire4} : reg116));
endmodule

module module126
#(parameter param182 = ((((~^{(8'h9d), (7'h43)}) << (((8'hb9) ? (7'h43) : (8'ha4)) > ((8'hac) ? (7'h40) : (8'hb2)))) << ((~&((8'hba) ? (8'hb3) : (8'h9f))) + (8'hae))) ? ((+(((8'hbd) ? (8'ha2) : (8'ha9)) * (~^(8'hae)))) ? {(((8'ha9) ^ (8'hbb)) ? (|(8'hb0)) : (^(8'haf))), (-(8'hb8))} : (-(8'hb2))) : (({((8'hbb) ? (8'hbe) : (8'hb9)), ((7'h43) ^~ (8'h9e))} ? (&(~(8'ha7))) : (((8'hb6) ? (8'hbf) : (8'ha7)) ? ((8'h9d) >>> (8'hb9)) : ((8'ha5) && (8'hb5)))) - {{(~(8'ha8)), {(8'ha8)}}})), 
parameter param183 = (^param182))
(y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire130;
  input wire [(5'h11):(1'h0)] wire129;
  input wire [(5'h12):(1'h0)] wire128;
  input wire [(5'h10):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire181;
  wire [(4'hf):(1'h0)] wire177;
  wire [(2'h3):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire175;
  wire [(5'h10):(1'h0)] wire174;
  wire signed [(4'h9):(1'h0)] wire173;
  wire [(5'h14):(1'h0)] wire172;
  wire signed [(5'h12):(1'h0)] wire171;
  wire signed [(3'h5):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire168;
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg178 = (1'h0);
  assign y = {wire181,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire168,
                 reg180,
                 reg179,
                 reg178,
                 (1'h0)};
  module131 #() modinst169 (wire168, clk, wire129, wire127, wire130, wire128);
  assign wire170 = (!wire128[(4'hb):(3'h7)]);
  assign wire171 = wire130;
  assign wire172 = (^wire170);
  assign wire173 = $unsigned((^~$signed((~^$signed(wire129)))));
  assign wire174 = (~(~&{(8'h9e), $unsigned((~wire168))}));
  assign wire175 = wire168;
  assign wire176 = $unsigned(wire128[(4'h8):(3'h5)]);
  assign wire177 = (wire170[(2'h2):(1'h1)] ^~ $signed($signed({(wire174 + wire176)})));
  always
    @(posedge clk) begin
      reg178 <= $signed((wire129[(5'h11):(5'h11)] ? wire170 : wire174));
      reg179 <= (((&(!((8'hb9) ? (8'hb1) : wire172))) ?
          reg178 : ($unsigned($unsigned(wire171)) ?
              $signed((wire127 ?
                  wire129 : wire172)) : ({wire175} ^ wire172[(5'h13):(1'h0)]))) ^ reg178[(3'h7):(2'h2)]);
      reg180 <= $signed(($unsigned($unsigned($signed((8'hb8)))) | wire128[(4'he):(3'h4)]));
    end
  assign wire181 = wire171;
endmodule

module module6
#(parameter param101 = (({{(-(8'hba)), {(8'h9f)}}, {((8'h9e) - (8'had))}} <<< (|(((8'h9e) ~^ (8'ha8)) * ((8'ha6) ? (8'hb9) : (8'ha1))))) ? {({{(8'ha8), (8'h9e)}, ((7'h42) ? (8'hbb) : (8'hb0))} * ((~^(8'hb7)) ? (~&(8'hb6)) : {(8'hbb), (8'hb0)})), (&((^(8'h9e)) ? ((8'h9c) == (8'h9f)) : {(8'hbb), (8'hae)}))} : ({(((8'hb9) != (8'hb7)) ? ((8'hb2) | (8'hbb)) : ((8'hb4) ? (7'h44) : (8'ha7))), (((8'hb3) ? (8'hb9) : (8'hb8)) ? ((8'h9f) ? (8'hb9) : (8'hb5)) : (!(7'h42)))} ? (!{((8'hbc) ? (7'h44) : (8'ha4))}) : ((((8'hb4) ? (8'hb9) : (7'h40)) == (8'hb4)) <<< (~^(|(7'h43)))))), 
parameter param102 = (param101 ? param101 : (^param101)))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire95;
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  assign y = {wire100,
                 wire97,
                 wire11,
                 wire12,
                 wire95,
                 reg99,
                 reg98,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = {$unsigned(wire10[(3'h6):(1'h0)]),
                      $unsigned($unsigned(($signed(wire7) + (|(8'ha6)))))};
  assign wire12 = wire8[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if ({(+(~|$unsigned({wire8, wire12})))})
        begin
          reg13 <= (+(~|({(wire7 ? wire8 : wire10), (wire12 << wire7)} ?
              $signed((wire11 ? wire10 : wire11)) : (-wire11))));
          reg14 <= ({$unsigned((^wire12))} ?
              wire7[(2'h2):(1'h1)] : $unsigned((8'ha3)));
          reg15 <= (wire9 ? reg14 : reg13[(4'ha):(2'h2)]);
          reg16 <= wire8[(4'hc):(4'h9)];
          reg17 <= ({$unsigned(reg13[(3'h4):(2'h3)]),
                  (((~^wire7) <= (~&wire10)) & (-(+reg15)))} ?
              reg14 : reg15);
        end
      else
        begin
          reg13 <= (+$unsigned($unsigned((^~reg13))));
        end
      reg18 <= (^~$unsigned($signed($signed(reg13))));
      reg19 <= ((8'ha7) ?
          (wire10 ?
              ((8'ha0) || $unsigned(wire11)) : wire12[(5'h15):(5'h10)]) : {(|wire11)});
    end
  always
    @(posedge clk) begin
      reg20 <= wire7[(1'h0):(1'h0)];
      reg21 <= $unsigned($unsigned((wire7[(3'h6):(3'h6)] ~^ (wire8[(3'h7):(1'h1)] ?
          reg14 : reg20))));
    end
  module22 #() modinst96 (wire95, clk, reg18, reg19, wire7, reg16, reg14);
  assign wire97 = $signed(($signed($signed(((8'hb0) | reg14))) >>> wire10[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg98 <= reg19[(2'h3):(1'h0)];
      reg99 <= (8'ha7);
    end
  assign wire100 = (reg98[(1'h0):(1'h0)] + reg21[(3'h7):(3'h5)]);
endmodule

module module22
#(parameter param94 = (((7'h43) ~^ ((~|(^(8'hbd))) * (|{(8'ha6)}))) ? (-(!(((8'ha3) ? (8'hb2) : (8'h9e)) > ((8'haa) << (8'hb4))))) : (!({((8'hb3) | (8'hb1))} <= ((^~(8'haa)) << ((8'hba) ? (8'hac) : (7'h44)))))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h2e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire27;
  input wire signed [(3'h7):(1'h0)] wire26;
  input wire [(3'h7):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire signed [(4'ha):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire86,
                 wire85,
                 wire46,
                 wire39,
                 wire38,
                 wire29,
                 wire28,
                 reg88,
                 reg84,
                 reg83,
                 reg82,
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
                 reg58,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire28 = ({{($unsigned(wire26) < $signed(wire24))}} ?
                      $signed((((wire27 ?
                          wire24 : wire24) * wire24[(2'h2):(1'h0)]) >= wire23[(3'h4):(3'h4)])) : $unsigned($signed((&{wire26}))));
  assign wire29 = wire23;
  always
    @(posedge clk) begin
      reg30 <= (($signed($unsigned(wire28[(1'h0):(1'h0)])) ?
              wire26 : $signed($unsigned(wire29))) ?
          wire26[(1'h0):(1'h0)] : wire27);
      reg31 <= (&$unsigned(reg30[(4'h8):(1'h1)]));
      if ((|(((reg31[(3'h6):(3'h6)] < {wire27,
          reg31}) & $signed(wire29)) != wire27[(4'h8):(1'h1)])))
        begin
          reg32 <= {wire23};
          reg33 <= (&{($unsigned((wire26 > reg31)) ?
                  (-{wire26, (8'h9e)}) : ({wire23} ?
                      (wire24 ? wire24 : reg31) : {wire26}))});
          if ((&$signed(($signed((~^reg32)) ?
              ($signed(wire27) + $signed(wire25)) : reg30[(3'h5):(2'h2)]))))
            begin
              reg34 <= reg33;
              reg35 <= ({(&((~^wire29) ?
                          (reg34 ? wire25 : (8'haa)) : (~&reg34))),
                      (!wire29[(3'h6):(3'h6)])} ?
                  (($signed((wire27 ? reg32 : reg32)) ?
                          reg31 : $signed($unsigned(wire26))) ?
                      (-(wire28 ?
                          $unsigned((8'hb2)) : $unsigned((8'h9e)))) : (reg32[(3'h5):(1'h1)] != wire26[(3'h5):(2'h2)])) : wire29);
            end
          else
            begin
              reg34 <= $unsigned($signed(((reg31[(4'h8):(3'h5)] ?
                      (wire26 | reg30) : reg35[(4'hb):(4'hb)]) ?
                  (|$unsigned(wire28)) : (^reg33))));
            end
        end
      else
        begin
          reg32 <= ((((wire24 ? ((7'h42) << (8'hb3)) : {wire26, wire27}) ?
              reg30 : $signed((reg32 ?
                  (8'ha1) : reg33))) ^~ $unsigned((+(!reg30)))) + wire29);
          if ($unsigned(({($signed(wire23) ?
                      $unsigned(wire23) : $unsigned(wire27)),
                  ((+wire23) ? (|reg31) : wire23)} ?
              $unsigned(reg35[(1'h0):(1'h0)]) : reg34[(3'h4):(1'h0)])))
            begin
              reg33 <= $signed(reg35[(4'he):(1'h1)]);
            end
          else
            begin
              reg33 <= (&wire24[(1'h0):(1'h0)]);
              reg34 <= (8'hbe);
              reg35 <= $signed((&(|reg31[(2'h2):(1'h1)])));
              reg36 <= (~((wire28[(1'h0):(1'h0)] == ((~|wire26) << (reg32 ?
                      reg33 : reg31))) ?
                  wire27 : (wire27[(3'h7):(3'h6)] ?
                      {(~&reg34), $unsigned(wire26)} : ((~reg30) ~^ (reg32 ?
                          reg33 : reg31)))));
              reg37 <= (^$unsigned((reg32 ^ ((reg32 ?
                  reg31 : wire26) >= $unsigned(reg30)))));
            end
        end
    end
  assign wire38 = reg37[(4'hf):(4'he)];
  assign wire39 = $signed($signed(reg34[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg40 <= (^wire26);
      if ({wire38[(1'h0):(1'h0)],
          ($signed(($unsigned((8'hb9)) ? wire26 : (8'ha8))) ?
              reg31[(3'h7):(1'h1)] : (&(^(reg33 > wire25))))})
        begin
          reg41 <= (reg40[(4'ha):(2'h2)] <= (~&(8'h9c)));
          reg42 <= (((wire27 ?
              reg33 : $signed((wire24 ?
                  reg31 : wire26))) <= (reg33[(4'hc):(3'h4)] | ({wire38} ?
              (8'ha8) : $signed(reg34)))) - ($signed((~|(wire25 ?
                  reg34 : reg35))) ?
              $unsigned((&(reg36 ? wire38 : wire38))) : $signed(wire28)));
          reg43 <= $signed({(^$signed((reg34 ? reg35 : reg35)))});
        end
      else
        begin
          reg41 <= (~^{$signed(reg40)});
        end
      reg44 <= $unsigned((8'ha8));
      reg45 <= reg30;
    end
  assign wire46 = {(((|$unsigned(reg31)) * wire23) >= reg30[(2'h3):(1'h1)]),
                      $unsigned((~|reg44))};
  always
    @(posedge clk) begin
      reg47 <= reg36;
      if ($signed($signed(wire39)))
        begin
          if ($signed((7'h43)))
            begin
              reg48 <= reg34;
              reg49 <= $unsigned(wire28);
              reg50 <= $unsigned(reg48);
              reg51 <= ((~^$unsigned(($unsigned(reg48) ?
                      $unsigned(reg31) : (reg50 ? reg31 : reg31)))) ?
                  $unsigned({$unsigned($signed(reg34)),
                      $unsigned((wire38 ? reg32 : reg37))}) : reg36);
            end
          else
            begin
              reg48 <= (8'h9e);
            end
          reg52 <= reg33;
        end
      else
        begin
          reg48 <= (+(reg52[(4'hb):(4'h9)] && ($signed((reg40 | reg52)) - (wire26[(2'h3):(1'h1)] ?
              reg31 : reg34[(1'h0):(1'h0)]))));
        end
      if ($signed($unsigned(($unsigned($unsigned(reg49)) ?
          ((~|(8'hab)) > {reg32, reg31}) : (reg41 ?
              $unsigned(reg35) : (~^(8'hb8)))))))
        begin
          reg53 <= {reg37[(4'ha):(3'h6)],
              $unsigned((~|$unsigned(wire23[(3'h4):(1'h1)])))};
          reg54 <= $signed(reg31[(4'hd):(2'h2)]);
        end
      else
        begin
          reg53 <= $signed(({wire27[(2'h2):(1'h0)]} ?
              ($signed(reg45[(4'h9):(2'h3)]) <<< ($unsigned(reg52) << (~^reg48))) : {reg35,
                  $signed((wire46 ? reg31 : reg42))}));
          reg54 <= ({(~^((!wire23) < $unsigned((8'hba))))} ?
              {wire29[(4'hd):(3'h6)]} : (reg36 >>> $signed($unsigned($signed((8'ha5))))));
          if ($signed(reg51))
            begin
              reg55 <= (((wire29[(4'h8):(4'h8)] || $unsigned((-reg43))) ?
                  (($unsigned(reg30) ? (-(8'haf)) : ((8'h9c) <<< (8'ha9))) ?
                      $signed($signed((8'ha8))) : ({wire28} | {(8'hb5)})) : ($signed({wire24}) > reg47[(1'h0):(1'h0)])) <<< reg33[(3'h4):(2'h3)]);
            end
          else
            begin
              reg55 <= {$signed((reg36 == $signed($unsigned((8'ha7)))))};
              reg56 <= ({wire26[(3'h5):(3'h4)]} || $signed((|((~(8'h9d)) << wire24))));
              reg57 <= wire23[(3'h6):(1'h1)];
              reg58 <= {$signed(reg55[(2'h3):(2'h2)])};
              reg59 <= (^~(reg55[(2'h2):(1'h0)] ^~ $signed(wire26[(2'h3):(2'h3)])));
            end
          if (reg32[(3'h4):(2'h2)])
            begin
              reg60 <= $signed(($unsigned($signed($unsigned(reg58))) ?
                  reg51 : (reg37 ?
                      {$unsigned(reg36), $signed(reg45)} : (+reg59))));
              reg61 <= reg48[(3'h5):(1'h0)];
              reg62 <= $unsigned(($signed(wire28) < ((reg56[(1'h1):(1'h0)] & {wire24}) & reg32)));
            end
          else
            begin
              reg60 <= $signed(reg42);
              reg61 <= ($signed((reg49 ? reg54[(3'h4):(3'h4)] : wire29)) ?
                  reg57 : ($signed(((reg33 ? reg32 : reg54) ?
                      (reg53 << reg50) : reg47[(1'h0):(1'h0)])) && (~|$unsigned((reg41 ^ wire25)))));
            end
          reg63 <= ((reg56 & (reg49[(1'h0):(1'h0)] ?
              (reg43[(3'h6):(2'h3)] ?
                  reg41[(2'h3):(1'h0)] : (reg58 <<< reg33)) : $unsigned($unsigned(reg50)))) >= (8'hb1));
        end
      if ($unsigned(((($unsigned(wire28) ? (~&wire46) : (~|reg42)) ?
              (wire26[(3'h6):(1'h1)] ?
                  reg31[(4'hd):(4'hb)] : reg34) : $unsigned((8'haf))) ?
          (-($unsigned(reg51) ?
              $unsigned(reg37) : reg49)) : ((((7'h40) < reg42) ^ reg53[(1'h1):(1'h0)]) >>> (+$signed(reg42))))))
        begin
          reg64 <= reg36;
          reg65 <= (reg51[(1'h1):(1'h0)] <= (~reg59));
        end
      else
        begin
          reg64 <= reg35;
          reg65 <= (reg60 <<< ((^$signed(wire27[(3'h6):(2'h2)])) ?
              (reg48 ? (-reg58) : $unsigned($unsigned(wire25))) : (8'hba)));
          reg66 <= wire46[(2'h3):(2'h2)];
          reg67 <= $unsigned((-(((~|wire26) || $signed(reg43)) & reg32[(3'h5):(3'h5)])));
        end
      reg68 <= $signed(($unsigned(wire27[(1'h1):(1'h1)]) ?
          reg50 : (^$unsigned((~|reg47)))));
    end
  always
    @(posedge clk) begin
      if ($signed($signed($signed((8'ha5)))))
        begin
          if (reg62[(3'h5):(3'h5)])
            begin
              reg69 <= wire28;
              reg70 <= ((+reg40[(3'h4):(2'h2)]) ^~ reg31);
              reg71 <= {{$signed((&$unsigned(reg61)))},
                  {(|($signed(reg34) - reg36[(1'h0):(1'h0)])),
                      ({{(8'ha5), (8'hb3)}} ?
                          (^~reg49[(1'h1):(1'h0)]) : reg57)}};
              reg72 <= $unsigned(reg51[(1'h1):(1'h1)]);
              reg73 <= reg33[(5'h12):(3'h6)];
            end
          else
            begin
              reg69 <= (8'ha6);
              reg70 <= $signed($signed((7'h40)));
              reg71 <= (-$signed(reg48[(3'h7):(3'h4)]));
              reg72 <= reg33[(3'h7):(3'h5)];
            end
          reg74 <= (((^~({reg54} && (&wire38))) - (|(~|(reg65 ?
              reg59 : reg35)))) == $signed($unsigned((((8'haf) == reg58) ?
              (wire28 ? reg67 : reg67) : ((8'hba) - reg63)))));
          reg75 <= ((reg62 ?
                  (~reg31) : ($signed(reg52[(1'h1):(1'h0)]) || $signed((^~reg48)))) ?
              (-(+((wire46 ? wire28 : reg40) ?
                  (reg40 ? reg61 : wire39) : {(8'hb5)}))) : (wire28 ?
                  (^($unsigned(reg40) << (reg34 ? reg59 : reg57))) : (8'had)));
          reg76 <= (^{{reg59, wire25[(2'h3):(1'h0)]}});
        end
      else
        begin
          if (((+(&$unsigned((reg60 ?
              wire28 : reg66)))) == reg52[(1'h0):(1'h0)]))
            begin
              reg69 <= $unsigned($unsigned(reg53));
              reg70 <= (reg44[(2'h2):(1'h0)] << reg50);
            end
          else
            begin
              reg69 <= ((!{reg45[(3'h4):(1'h1)]}) ^~ $signed((&$unsigned((reg41 * reg76)))));
              reg70 <= $signed({$unsigned((+(8'hb9)))});
              reg71 <= (|$unsigned($unsigned(((reg59 ^~ wire46) | (~|wire29)))));
              reg72 <= $signed(reg42);
            end
          reg73 <= $signed((reg63 >>> wire26));
          reg74 <= (~&(~&{reg70[(5'h11):(4'h8)],
              ($unsigned((8'ha1)) ? reg55 : (reg31 ? reg41 : reg64))}));
        end
      if (({reg41, $signed($signed({(8'hbc)}))} ?
          reg73[(3'h5):(3'h4)] : {{$signed((reg62 ? reg30 : reg76))},
              (^~wire24[(2'h2):(1'h0)])}))
        begin
          reg77 <= (~&$unsigned((~$signed($signed(reg68)))));
          reg78 <= (wire46[(4'he):(4'hd)] ?
              ((wire28 ? (!reg30[(2'h3):(2'h2)]) : {$signed(reg32)}) ?
                  reg33[(4'hd):(3'h7)] : {reg69[(2'h2):(1'h0)],
                      ((-wire28) ?
                          reg48[(2'h2):(1'h1)] : (reg59 ?
                              reg35 : reg35))}) : (8'ha1));
          reg79 <= (8'hbf);
          if (((reg49 || {(((8'hbe) ? reg64 : reg64) ^ $signed(reg70)),
                  reg70[(4'hf):(3'h4)]}) ?
              ($signed((~|(reg67 ?
                  wire39 : reg36))) >= {$signed((reg74 ^~ reg63))}) : $signed((~&$signed((reg41 ?
                  reg70 : wire28))))))
            begin
              reg80 <= (~&(reg36 <= (($unsigned(reg76) ?
                  $signed((8'hb1)) : (~&wire26)) > (!reg48[(1'h1):(1'h0)]))));
              reg81 <= (wire27 <<< reg71);
              reg82 <= ($signed(wire39[(2'h2):(1'h1)]) ?
                  $signed($unsigned(((wire24 << reg49) ?
                      $signed(reg58) : {wire39}))) : $signed(((~^reg57[(1'h1):(1'h1)]) ?
                      reg75 : $unsigned($signed((8'ha1))))));
            end
          else
            begin
              reg80 <= (($unsigned({reg61[(4'hb):(4'hb)]}) ?
                      $unsigned($signed((wire23 && (8'hb6)))) : ($signed($unsigned((8'hbf))) ^ reg63[(3'h6):(3'h4)])) ?
                  ($unsigned(($unsigned(reg53) ~^ reg82[(1'h1):(1'h0)])) ?
                      ($signed(reg80) - reg82[(4'ha):(3'h7)]) : ($signed($signed(reg68)) >>> reg47)) : $signed(($unsigned((wire39 ?
                      reg44 : (8'hbe))) | (reg35[(5'h12):(3'h4)] ?
                      ((8'ha2) >= reg60) : $signed(reg59)))));
              reg81 <= {({wire27[(3'h5):(1'h1)], reg79} ?
                      reg45[(2'h3):(1'h1)] : {wire46})};
              reg82 <= (!($unsigned($unsigned(reg58[(2'h3):(2'h2)])) >= wire23));
              reg83 <= $signed($signed(wire27[(3'h7):(3'h4)]));
              reg84 <= (&(7'h43));
            end
        end
      else
        begin
          reg77 <= $unsigned($signed($unsigned($signed($unsigned((8'hbe))))));
        end
    end
  assign wire85 = reg37;
  assign wire86 = wire85[(1'h1):(1'h0)];
  assign wire87 = reg58[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg88 <= ($signed((~^reg67)) + (^(reg58 || $signed((^~wire28)))));
    end
  assign wire89 = reg78[(1'h0):(1'h0)];
  assign wire90 = (reg72 & (reg48 || ((~|(~^reg42)) ~^ {{reg47}})));
  assign wire91 = (~&reg82[(2'h2):(2'h2)]);
  assign wire92 = (-{(~^(~|{reg45, reg81}))});
  assign wire93 = $unsigned(reg36);
endmodule

module module131
#(parameter param167 = (-(((((8'hbe) >> (7'h42)) ? (+(8'hbc)) : (~^(8'ha0))) == (((8'hb6) ? (8'hb2) : (8'ha5)) ? (|(8'hb5)) : (~|(8'h9c)))) ~^ ((7'h41) == (-((8'ha4) == (8'had)))))))
(y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire135;
  input wire signed [(5'h10):(1'h0)] wire134;
  input wire signed [(3'h5):(1'h0)] wire133;
  input wire [(4'hd):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire166;
  wire signed [(5'h12):(1'h0)] wire165;
  wire [(2'h3):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire163;
  wire signed [(5'h12):(1'h0)] wire146;
  wire [(2'h2):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire143;
  wire [(4'h8):(1'h0)] wire142;
  wire [(2'h3):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire140;
  wire [(3'h6):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire136;
  reg [(5'h14):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg159 = (1'h0);
  reg [(2'h2):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 reg162,
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
                 (1'h0)};
  assign wire136 = (^$unsigned($unsigned(wire132[(4'ha):(3'h5)])));
  assign wire137 = (^((+wire132) >= (+(-wire135[(3'h5):(1'h1)]))));
  assign wire138 = ((wire133[(3'h5):(2'h3)] ?
                       {wire134[(1'h1):(1'h1)]} : ($unsigned((~wire133)) * {(~&wire132),
                           $unsigned(wire135)})) == $unsigned(wire134[(4'h9):(2'h3)]));
  assign wire139 = wire136[(2'h2):(1'h1)];
  assign wire140 = (($unsigned($unsigned(((8'h9d) >= wire134))) || (((+wire139) == (&wire134)) ?
                           (~^(wire132 ?
                               wire134 : wire133)) : (&(~^wire135)))) ?
                       (8'haf) : {$signed(wire136),
                           ((-$signed(wire139)) ^~ (wire132[(1'h1):(1'h1)] ?
                               wire139 : {wire134, wire133}))});
  assign wire141 = $unsigned($unsigned(({(wire136 ? wire139 : wire136)} ?
                       $signed(wire140) : (~|(wire135 * wire140)))));
  assign wire142 = $signed(wire134);
  assign wire143 = wire140[(3'h4):(2'h2)];
  assign wire144 = $signed($unsigned($unsigned((wire139[(2'h3):(2'h3)] ?
                       (wire141 <= wire133) : {wire143, wire136}))));
  assign wire145 = wire138[(2'h3):(1'h0)];
  assign wire146 = (|($signed($unsigned((wire136 ^~ wire133))) ?
                       wire137[(1'h1):(1'h0)] : $signed($signed((wire145 >= wire145)))));
  always
    @(posedge clk) begin
      reg147 <= $signed((~&wire146));
      reg148 <= (!wire136[(1'h0):(1'h0)]);
      reg149 <= wire143[(1'h0):(1'h0)];
      if ($unsigned(((&($signed(wire138) ?
          $unsigned(wire137) : $signed(wire137))) != reg148[(1'h1):(1'h1)])))
        begin
          if ((8'haf))
            begin
              reg150 <= (($unsigned($unsigned({(8'ha2)})) ^~ wire135) ?
                  ((&((wire136 ^~ wire133) >= $unsigned((8'hac)))) ?
                      ((8'hb8) & $signed($unsigned(wire140))) : {(reg148[(2'h2):(1'h1)] ?
                              {reg147} : ((7'h43) ?
                                  wire132 : wire135))}) : (!(8'hb2)));
              reg151 <= reg150;
              reg152 <= (^{$signed($unsigned(wire134[(4'h8):(4'h8)]))});
              reg153 <= wire144;
              reg154 <= ((~&(+(-((7'h41) * wire144)))) ?
                  {wire141} : reg152[(3'h4):(2'h3)]);
            end
          else
            begin
              reg150 <= ($signed(reg149) ?
                  ((|wire140[(2'h3):(2'h3)]) >>> reg147[(4'hb):(4'hb)]) : wire141[(2'h3):(2'h2)]);
              reg151 <= (^~$signed($unsigned((!(reg149 ? (8'hac) : wire132)))));
              reg152 <= (^((((8'had) ?
                  wire138 : $unsigned(wire139)) ^~ {$signed(reg148)}) && $signed(($unsigned(wire140) ?
                  $signed(wire145) : wire137))));
            end
          reg155 <= ($unsigned((8'hb5)) ?
              wire145 : ((wire132[(1'h0):(1'h0)] ?
                      $unsigned((reg154 && wire138)) : reg149) ?
                  ((wire132 - (wire133 ?
                      (8'haa) : reg149)) * $signed((wire133 | wire133))) : {reg152[(5'h10):(3'h6)]}));
          if (reg149[(5'h10):(4'h9)])
            begin
              reg156 <= $signed((!$signed(wire136)));
            end
          else
            begin
              reg156 <= $unsigned({(wire137 ~^ ((wire139 >> (8'hba)) || (+(7'h42)))),
                  ($unsigned($unsigned(wire137)) || wire132)});
              reg157 <= $signed((~((wire145[(1'h0):(1'h0)] ?
                      (wire132 ? wire134 : wire141) : (~&wire144)) ?
                  {{(8'hb0)},
                      (reg149 ?
                          wire133 : reg147)} : $unsigned((wire145 * wire146)))));
              reg158 <= $signed((((wire145 <<< (wire132 ?
                      reg153 : (8'ha7))) + (^~{reg153})) ?
                  $unsigned((wire144 <<< $unsigned(wire139))) : $signed({((8'hb1) ?
                          reg147 : reg156)})));
              reg159 <= (^~{(reg156[(1'h0):(1'h0)] ?
                      (!(~&wire133)) : (8'hbf))});
              reg160 <= $unsigned(wire145);
            end
          reg161 <= $signed(reg151[(1'h1):(1'h1)]);
        end
      else
        begin
          reg150 <= $signed($signed((-$signed((reg153 ? (7'h40) : reg160)))));
          if (((+$signed((-reg155))) ?
              (~{$signed($signed(wire134))}) : {wire132[(3'h7):(2'h3)],
                  $unsigned({reg161})}))
            begin
              reg151 <= (8'hb2);
              reg152 <= {wire145[(1'h1):(1'h1)]};
            end
          else
            begin
              reg151 <= $signed(reg152[(1'h0):(1'h0)]);
              reg152 <= ($unsigned((|wire139[(2'h3):(2'h2)])) ?
                  $unsigned(wire145) : $unsigned((+$signed($signed(reg153)))));
              reg153 <= wire143;
              reg154 <= (^~(((!(~|wire134)) ?
                      ((reg156 != wire138) <<< $unsigned(reg147)) : $unsigned($signed(reg156))) ?
                  (!wire143) : (&(|(^(8'h9c))))));
              reg155 <= $signed((wire144[(3'h7):(1'h1)] - wire141));
            end
          if ({(8'hbf)})
            begin
              reg156 <= reg147;
              reg157 <= (^(|((8'hb6) * $unsigned($signed(wire140)))));
              reg158 <= (reg150 ?
                  ({reg153[(3'h4):(1'h0)],
                      (((8'had) + (7'h42)) && ((8'hbc) <= (8'ha0)))} != ($unsigned($signed(wire140)) || (~|$unsigned(reg159)))) : (8'hbe));
              reg159 <= reg151;
              reg160 <= (($signed((wire146[(4'hf):(1'h1)] ?
                      reg150 : (reg157 | (8'ha4)))) < $signed(reg161)) ?
                  wire134 : reg150);
            end
          else
            begin
              reg156 <= wire135;
              reg157 <= $signed(wire138);
            end
          reg161 <= reg148[(1'h0):(1'h0)];
          reg162 <= reg152[(4'he):(3'h4)];
        end
    end
  assign wire163 = $signed(((~^(~&(reg157 ? wire141 : reg149))) ?
                       (+$signed(reg156[(2'h3):(2'h2)])) : reg158[(1'h0):(1'h0)]));
  assign wire164 = (^((((reg148 ? (8'hb5) : reg150) ?
                               (reg152 != wire144) : {wire134}) ?
                           wire144[(2'h3):(2'h2)] : $unsigned(reg155)) ?
                       $unsigned(((wire135 << wire141) ?
                           $unsigned(reg157) : wire143[(3'h4):(2'h3)])) : reg156));
  assign wire165 = {$unsigned(wire143)};
  assign wire166 = $signed((8'h9f));
endmodule
