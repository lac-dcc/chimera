module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire112;
  wire [(3'h6):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire107;
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  assign y = {wire157,
                 wire122,
                 wire121,
                 wire119,
                 wire118,
                 wire117,
                 wire112,
                 wire110,
                 wire109,
                 wire4,
                 wire5,
                 wire107,
                 reg111,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg120,
                 (1'h0)};
  assign wire4 = $signed(($signed({$unsigned((8'ha2))}) >>> {wire1}));
  assign wire5 = {($unsigned(wire4) ?
                         ((~|(wire4 ?
                             wire3 : wire3)) | $unsigned(wire2)) : $unsigned($unsigned(((8'haa) != wire3))))};
  module6 #() modinst108 (wire107, clk, wire1, wire0, wire2, wire3, wire4);
  assign wire109 = wire4[(1'h0):(1'h0)];
  assign wire110 = (((wire5[(3'h6):(1'h0)] ?
                       (&wire107[(1'h1):(1'h0)]) : (((8'h9c) ?
                               (8'hb4) : (8'h9e)) ?
                           (8'hb5) : (wire2 ?
                               wire2 : wire4))) < ($unsigned(wire5) ?
                       ($signed(wire4) ?
                           (wire109 < wire3) : $signed(wire4)) : wire0[(4'hc):(4'ha)])) && wire4[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg111 <= {((~|{{wire2, (8'ha2)},
              (~(8'hb0))}) <<< $unsigned(wire5[(3'h7):(2'h2)])),
          $signed((($signed(wire1) <<< (wire107 <<< wire109)) - wire107[(1'h0):(1'h0)]))};
    end
  assign wire112 = (^~$unsigned($signed(wire5[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg113 <= wire112[(4'h8):(2'h3)];
      reg114 <= ($signed(($signed($signed(wire112)) ?
          wire110 : $unsigned(wire107[(2'h2):(1'h0)]))) && $unsigned((^~(^~(&reg111)))));
      reg115 <= $unsigned(wire109);
      reg116 <= {(wire0[(3'h4):(2'h2)] * (~&$signed($unsigned(wire110))))};
    end
  assign wire117 = (~&$signed((((reg113 ? (8'hb8) : wire107) ^~ {wire4,
                       wire110}) > wire2[(4'ha):(4'h9)])));
  assign wire118 = (!$signed((~(~$signed(wire5)))));
  assign wire119 = reg111;
  always
    @(posedge clk) begin
      reg120 <= (wire119 ?
          (+($signed(reg111) & ((~&reg111) || wire5[(3'h7):(3'h7)]))) : wire1);
    end
  assign wire121 = reg116[(1'h1):(1'h0)];
  assign wire122 = wire2[(3'h7):(3'h7)];
  module123 #() modinst158 (.y(wire157), .wire126(wire4), .wire125(wire118), .clk(clk), .wire127(wire119), .wire128(reg116), .wire124(wire5));
endmodule

module module123
#(parameter param156 = {(8'hac), (^(8'ha0))})
(y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire128;
  input wire signed [(5'h10):(1'h0)] wire127;
  input wire [(5'h15):(1'h0)] wire126;
  input wire [(4'h9):(1'h0)] wire125;
  input wire [(4'hf):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire136;
  wire [(4'hb):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire130;
  wire signed [(4'ha):(1'h0)] wire129;
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(4'he):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
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
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg134,
                 (1'h0)};
  assign wire129 = $unsigned((&($unsigned($unsigned(wire127)) <<< $unsigned((wire124 ~^ wire125)))));
  assign wire130 = wire129[(2'h2):(2'h2)];
  assign wire131 = (!((^~wire130[(4'ha):(1'h0)]) & $unsigned((((8'h9f) ?
                       wire125 : wire128) - wire126[(1'h0):(1'h0)]))));
  assign wire132 = ((8'h9c) == ((8'ha0) ?
                       $signed(wire126[(4'he):(4'h9)]) : $unsigned((|$signed(wire125)))));
  assign wire133 = $unsigned((wire126 <= wire128));
  always
    @(posedge clk) begin
      reg134 <= wire128[(2'h2):(1'h1)];
    end
  assign wire135 = $signed((wire129 ?
                       wire131[(3'h4):(2'h2)] : wire132[(1'h0):(1'h0)]));
  assign wire136 = wire132;
  always
    @(posedge clk) begin
      if ($signed(((((wire129 ? wire133 : wire124) ?
              {wire130} : {wire131}) <<< ($signed(wire133) ^ (~^wire132))) ?
          ({$signed(wire129)} ^ wire132[(2'h3):(2'h2)]) : (|wire131[(1'h1):(1'h1)]))))
        begin
          if (wire136)
            begin
              reg137 <= $unsigned((wire124[(3'h4):(2'h2)] ? wire136 : (8'hb5)));
              reg138 <= (wire131[(1'h1):(1'h0)] ?
                  {wire127,
                      $unsigned((wire131[(2'h3):(2'h3)] ?
                          (&(8'ha4)) : ((8'ha6) ?
                              wire136 : (8'had))))} : wire130[(3'h4):(2'h2)]);
              reg139 <= (reg138 ?
                  (~^$signed((~|$unsigned(wire128)))) : $signed((~^$signed((~|wire136)))));
            end
          else
            begin
              reg137 <= {$unsigned(($unsigned((wire133 ?
                      (8'hb7) : wire131)) >= (~&(reg138 > reg138)))),
                  reg134};
            end
          reg140 <= (^~wire124);
        end
      else
        begin
          reg137 <= $unsigned((((~|(wire130 < wire135)) * ((~wire131) ?
              {reg138} : wire133[(4'hc):(4'h9)])) <<< $signed((wire133[(4'hc):(4'ha)] ?
              $unsigned(wire127) : (~&reg138)))));
          if ($signed((((&{(7'h43)}) & wire136[(2'h3):(2'h3)]) ?
              $unsigned(wire124) : wire135[(2'h3):(1'h0)])))
            begin
              reg138 <= $unsigned({(((wire125 > reg137) ?
                          ((8'hb2) != wire129) : (wire133 < wire131)) ?
                      (wire128[(1'h1):(1'h0)] ?
                          $signed(wire127) : wire124[(4'hb):(2'h3)]) : $unsigned(wire128)),
                  $unsigned($unsigned({(8'ha4), wire126}))});
            end
          else
            begin
              reg138 <= (^~({((!reg139) ? reg138 : $unsigned(wire132)),
                  (((8'haa) ? reg138 : (8'ha1)) ?
                      (wire127 ?
                          (8'ha5) : wire136) : wire132[(4'h8):(2'h2)])} != (^reg139[(4'h8):(1'h0)])));
              reg139 <= ((({{wire131, wire135}, (wire125 != (8'ha5))} ?
                  $unsigned((reg139 <= wire124)) : (8'h9d)) != ((~|$signed(reg137)) | (^~{(8'ha6),
                  reg134}))) < reg134);
              reg140 <= {{(wire126 ?
                          wire135[(3'h7):(3'h6)] : $unsigned((~reg139))),
                      {$signed($signed(wire131))}}};
              reg141 <= (^~$signed(reg140));
              reg142 <= reg137[(2'h2):(1'h0)];
            end
          if (wire132[(4'h9):(2'h2)])
            begin
              reg143 <= $signed({(&$signed($signed(wire136))),
                  ((^$unsigned((8'h9d))) >>> reg137)});
            end
          else
            begin
              reg143 <= $unsigned($unsigned((&($signed(wire132) ?
                  wire136[(3'h4):(1'h0)] : ((8'hbe) ^ wire129)))));
              reg144 <= ($unsigned((($unsigned(wire129) > (reg138 ?
                          reg134 : wire129)) ?
                      $signed((reg142 & wire125)) : ($unsigned(wire131) ?
                          {wire135} : (-wire132)))) ?
                  $signed(reg138[(4'ha):(3'h5)]) : $unsigned($unsigned(reg140[(1'h0):(1'h0)])));
              reg145 <= reg141;
              reg146 <= $unsigned((reg144 >> ($signed({wire126}) && reg134)));
            end
          reg147 <= reg139[(3'h6):(1'h0)];
        end
      if ((!$unsigned((((wire133 ? reg140 : reg145) >= (^~wire131)) ?
          (!((8'hb8) ^~ reg138)) : ((reg140 ? reg144 : reg140) || reg147)))))
        begin
          reg148 <= reg147;
          if ($unsigned(((wire128 ?
                  reg140 : ($unsigned(wire129) ?
                      (reg137 ? (8'hba) : reg146) : reg147)) ?
              (~|$unsigned((~(8'hbf)))) : (($unsigned(wire129) ?
                  (reg143 >>> reg141) : $signed(reg134)) << (!$unsigned(wire126))))))
            begin
              reg149 <= (~(wire130[(3'h4):(1'h1)] + reg138));
              reg150 <= ((reg139[(4'hf):(1'h1)] ?
                      (~&(8'hbf)) : reg138[(2'h2):(1'h0)]) ?
                  ((|$unsigned({reg134,
                      reg139})) != ({$unsigned(wire128)} ~^ (^~(wire136 ?
                      (8'hb0) : reg149)))) : $unsigned($unsigned($unsigned($signed(reg144)))));
              reg151 <= reg150;
              reg152 <= reg139[(2'h2):(1'h0)];
            end
          else
            begin
              reg149 <= $unsigned($signed(((-(wire130 ?
                  reg138 : wire124)) | (|(reg148 ? (8'ha7) : reg139)))));
              reg150 <= ($unsigned((~wire133)) ?
                  (!($signed($unsigned(wire124)) ?
                      (+$signed(wire126)) : ($signed(reg147) | $signed((8'ha5))))) : reg140);
              reg151 <= {(wire128[(1'h1):(1'h1)] + wire124[(4'hf):(1'h0)]),
                  reg151[(1'h1):(1'h1)]};
              reg152 <= (+reg146[(2'h3):(2'h2)]);
              reg153 <= $signed({wire135});
            end
          reg154 <= ({$signed($signed((^wire131)))} ?
              $unsigned((wire129[(2'h2):(1'h1)] ?
                  reg144 : (|wire127))) : $unsigned(({$unsigned(reg145)} ?
                  wire132 : ((^(8'haf)) ^ (wire130 > (7'h42))))));
          reg155 <= (reg145[(1'h0):(1'h0)] ?
              {(~^$unsigned({reg142}))} : wire133);
        end
      else
        begin
          reg148 <= wire135[(3'h4):(1'h0)];
          if (($signed($unsigned({(reg145 ? wire126 : (8'ha8)),
              (+reg139)})) ^ reg146))
            begin
              reg149 <= (8'had);
              reg150 <= (~&reg152[(2'h3):(2'h3)]);
            end
          else
            begin
              reg149 <= ($signed(wire133) ?
                  $signed(reg139) : $signed((reg149 ?
                      ($unsigned(wire133) ^ $signed(reg148)) : reg138[(2'h2):(1'h1)])));
              reg150 <= ($signed((reg146 <= (7'h43))) ^~ ({({reg154, (8'hb7)} ?
                      $signed(wire135) : (wire135 ? reg145 : wire126)),
                  reg134} == reg142[(3'h4):(1'h1)]));
              reg151 <= $signed(($signed({reg134}) << (reg134[(1'h0):(1'h0)] ^ (reg153 ?
                  (8'hb6) : (reg139 ? (8'ha9) : wire130)))));
              reg152 <= ((((8'hbb) & (wire130 ?
                      ((8'h9d) ~^ reg155) : $unsigned(wire129))) ?
                  (~|reg146[(2'h2):(2'h2)]) : $unsigned($signed((reg146 ?
                      (8'h9f) : (8'hae))))) >= ((((wire128 - reg142) && $unsigned(reg146)) | (+$signed(reg134))) ?
                  reg151 : $signed((^~$signed(wire135)))));
            end
        end
    end
endmodule

module module6
#(parameter param106 = (8'hbf))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  assign y = {wire105,
                 wire103,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire12 = wire7[(4'ha):(1'h1)];
  assign wire13 = (8'hac);
  assign wire14 = wire8[(1'h0):(1'h0)];
  assign wire15 = $signed($unsigned((~$unsigned((wire10 ? (8'hbc) : wire13)))));
  assign wire16 = wire12[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= wire8[(3'h7):(1'h0)];
      reg18 <= ($signed($signed(wire7)) ^ ($unsigned(wire7[(3'h7):(3'h4)]) <= $unsigned($unsigned((8'hb0)))));
      reg19 <= wire9[(3'h5):(2'h3)];
      reg20 <= $signed($unsigned(reg18[(2'h2):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg21 <= $signed(wire13);
      if ($signed($unsigned((~|((wire12 + wire13) <<< wire16)))))
        begin
          if ($unsigned($signed($unsigned((~|reg20[(4'hd):(1'h0)])))))
            begin
              reg22 <= (~({($unsigned(wire16) ?
                      $signed(reg20) : wire7[(3'h6):(3'h6)])} > (wire10 > $signed(wire14))));
              reg23 <= (8'hb8);
              reg24 <= $signed($signed((&($signed((8'hb1)) ?
                  ((8'h9d) | reg19) : $unsigned(wire13)))));
            end
          else
            begin
              reg22 <= $signed(($signed((wire9[(4'hb):(3'h5)] ?
                  $unsigned((8'hb9)) : (~|wire15))) > $unsigned($unsigned((~&reg18)))));
              reg23 <= (wire13[(3'h5):(3'h4)] >= ($unsigned($unsigned(reg20[(4'h8):(3'h5)])) ?
                  $unsigned($unsigned(reg22[(2'h2):(2'h2)])) : (~^(8'hb3))));
              reg24 <= reg20[(4'hb):(3'h7)];
              reg25 <= {$signed($signed(reg21))};
              reg26 <= ({$unsigned(reg21[(1'h0):(1'h0)])} ?
                  $unsigned($signed(($unsigned(wire9) ?
                      (~&reg19) : reg19))) : (wire8 ?
                      (($signed((8'hbc)) >= (wire16 ? wire8 : wire13)) ?
                          $signed((~|wire10)) : $unsigned((8'hb4))) : reg19[(2'h2):(2'h2)]));
            end
          if (reg18)
            begin
              reg27 <= reg26[(1'h0):(1'h0)];
              reg28 <= (|wire10[(2'h2):(2'h2)]);
            end
          else
            begin
              reg27 <= {{{wire7[(3'h7):(3'h6)]}}};
            end
        end
      else
        begin
          reg22 <= ($unsigned($unsigned($unsigned((^wire8)))) ^~ $signed(({(~^reg17)} ?
              $signed($signed(wire11)) : $unsigned((&reg19)))));
          reg23 <= $unsigned(wire12[(4'ha):(2'h2)]);
          reg24 <= (wire14 >> $unsigned((wire8 ?
              $unsigned({reg26, wire11}) : {$signed((8'h9f))})));
          if ($unsigned((+reg25)))
            begin
              reg25 <= $signed((~|$signed((8'ha6))));
            end
          else
            begin
              reg25 <= ($unsigned((reg17[(3'h7):(1'h0)] ?
                      {$signed(reg18)} : (8'ha7))) ?
                  {(~|$signed((wire16 ? wire11 : reg24))),
                      (!reg20)} : (($signed($unsigned((7'h40))) ?
                      $unsigned((wire14 * wire12)) : reg28) > {$unsigned(reg20[(4'hf):(2'h2)])}));
              reg26 <= (reg17[(3'h7):(1'h1)] ?
                  $signed(reg28) : (($signed((reg24 ^ (8'hbf))) ?
                          (8'ha3) : wire15) ?
                      (((reg24 ?
                          (7'h41) : reg18) | $unsigned(wire12)) - reg21[(3'h7):(1'h0)]) : $unsigned(((+wire14) ?
                          reg17 : {wire15}))));
              reg27 <= (|reg22[(1'h0):(1'h0)]);
              reg28 <= ($unsigned(wire8) ?
                  $signed(reg17) : $unsigned($signed(($signed(reg27) >> $signed(wire16)))));
              reg29 <= wire15;
            end
        end
      reg30 <= wire7[(3'h5):(1'h0)];
      reg31 <= ($signed(($signed($signed((8'h9d))) ?
              $unsigned(reg30) : $unsigned((wire11 - wire16)))) ?
          wire12 : {reg29[(4'h9):(3'h6)]});
    end
  module32 #() modinst104 (.wire36(reg22), .wire33(wire11), .clk(clk), .wire34(reg26), .wire35(wire14), .y(wire103));
  assign wire105 = ((~$unsigned(((wire7 ?
                           wire12 : reg18) + (reg18 <<< wire14)))) ?
                       (8'hab) : (reg21[(4'ha):(3'h7)] ?
                           (((reg22 >>> reg30) != (~^wire7)) ?
                               ({reg20, wire11} ?
                                   ((7'h43) ?
                                       reg23 : reg17) : wire16[(4'hc):(4'ha)]) : (-(^~wire10))) : (($signed(reg29) <= wire15) ?
                               ((wire103 ? (8'hb8) : reg22) ?
                                   reg25 : (reg27 ?
                                       reg23 : reg30)) : wire14[(5'h12):(2'h2)])));
endmodule

module module32
#(parameter param102 = (((8'ha9) ? ((&((8'h9f) ? (8'hbf) : (8'hbd))) ~^ (~((8'ha1) ? (8'hb9) : (8'hbc)))) : (((8'hb5) ? ((8'hb1) * (8'hae)) : (^~(8'ha1))) ? {((7'h44) ? (8'hb3) : (8'ha7)), {(8'ha9)}} : ((!(8'hbd)) - ((8'hbc) ? (8'ha6) : (8'hac))))) >> (8'hb0)))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h31a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire36;
  input wire [(5'h14):(1'h0)] wire35;
  input wire [(2'h2):(1'h0)] wire34;
  input wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire70,
                 wire69,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
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
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg37 <= $unsigned($unsigned(wire34[(2'h2):(1'h0)]));
      reg38 <= {wire33};
      if ((+wire35))
        begin
          reg39 <= (~^wire34[(1'h0):(1'h0)]);
          reg40 <= wire36;
          if ((wire36 << (reg40 >= $signed($unsigned($signed(reg39))))))
            begin
              reg41 <= (~^$unsigned(($unsigned($signed(wire33)) ?
                  wire34[(1'h1):(1'h1)] : ((reg40 ? wire34 : wire33) ?
                      (!reg37) : (reg38 ? (8'hb3) : wire35)))));
              reg42 <= ((~^wire36) - wire35);
              reg43 <= $signed({reg39[(2'h2):(1'h0)],
                  (!(reg39[(2'h3):(2'h2)] >>> (reg40 || wire33)))});
              reg44 <= ((+(~&reg40)) ? reg41 : (7'h40));
              reg45 <= $unsigned($signed($unsigned((8'hba))));
            end
          else
            begin
              reg41 <= $unsigned({$unsigned(reg38[(3'h5):(3'h4)])});
              reg42 <= {($signed((reg44[(3'h7):(2'h3)] ^~ $signed(wire33))) >= reg45)};
              reg43 <= reg40[(4'h9):(3'h6)];
              reg44 <= ($unsigned($unsigned(wire34[(1'h1):(1'h1)])) << reg41[(1'h1):(1'h0)]);
              reg45 <= reg42[(5'h11):(3'h5)];
            end
        end
      else
        begin
          if ($signed((|$unsigned($unsigned($unsigned(wire36))))))
            begin
              reg39 <= reg41[(4'hb):(4'ha)];
              reg40 <= reg43[(3'h5):(2'h3)];
              reg41 <= (^reg44);
              reg42 <= $signed((~$signed((^$unsigned(reg38)))));
            end
          else
            begin
              reg39 <= $unsigned((8'hae));
              reg40 <= (({$unsigned({(8'ha3)})} >= reg38[(5'h15):(4'hd)]) ?
                  (($signed(reg41) ?
                          $signed((~&wire35)) : (~|(reg39 ? reg45 : wire33))) ?
                      (^~$signed((^~wire35))) : reg45) : (&(reg43[(2'h2):(1'h1)] && $signed(reg38[(3'h5):(2'h2)]))));
              reg41 <= ((($unsigned(reg44[(3'h6):(1'h0)]) >= {wire33,
                  reg38[(5'h10):(2'h2)]}) + $signed(($signed(wire36) ^ (wire33 ?
                  wire36 : reg39)))) << reg37[(2'h2):(1'h1)]);
              reg42 <= ($signed((~^(~^$unsigned(reg38)))) ?
                  $signed($unsigned(wire33[(3'h4):(3'h4)])) : ({{$signed(wire35),
                              $signed(wire33)}} ?
                      reg38 : reg44[(4'hf):(4'hd)]));
            end
          reg43 <= reg44;
          reg44 <= wire35;
          reg45 <= $signed({reg42[(4'hb):(4'hb)]});
          reg46 <= (((!({wire36, reg37} ?
                  $unsigned(wire33) : reg38[(5'h10):(4'h9)])) <<< {(^~(&reg37))}) ?
              $unsigned(reg40) : ({$signed($signed((8'hbd)))} ?
                  reg38[(4'hd):(4'hb)] : (($signed(reg40) ^~ (reg38 ?
                          reg37 : reg38)) ?
                      $signed($unsigned(wire33)) : $signed($signed(reg39)))));
        end
      reg47 <= wire35;
    end
  assign wire48 = (reg39[(2'h3):(2'h2)] ?
                      (((wire36 ?
                          (reg44 ?
                              wire36 : reg40) : $unsigned(wire33)) ^~ (~|(^reg46))) || reg37) : $unsigned(($unsigned((+reg39)) && ((!reg45) ?
                          reg40[(1'h0):(1'h0)] : $signed(reg45)))));
  assign wire49 = reg43[(1'h1):(1'h0)];
  assign wire50 = (($signed(wire36[(3'h4):(3'h4)]) ?
                      ((reg37 ?
                          reg44[(4'hb):(3'h4)] : $signed(reg38)) - reg42[(5'h10):(2'h3)]) : (|{wire36[(4'h8):(2'h3)]})) >> wire35[(4'he):(4'h8)]);
  assign wire51 = $unsigned(reg40[(5'h14):(4'h8)]);
  assign wire52 = $unsigned((8'hbb));
  always
    @(posedge clk) begin
      if (((~reg45[(4'hf):(4'h9)]) ?
          {reg40,
              {($signed(reg44) + $unsigned(reg42)),
                  $unsigned(reg42)}} : $unsigned(($signed(reg40) ?
              $signed({reg41}) : (8'ha6)))))
        begin
          if (($signed((wire52[(3'h4):(3'h4)] - ($signed(wire51) < (reg42 ?
              wire34 : reg41)))) << $signed((8'hb5))))
            begin
              reg53 <= $unsigned(reg47[(4'h8):(2'h2)]);
              reg54 <= wire51;
              reg55 <= (8'ha0);
            end
          else
            begin
              reg53 <= (^~((wire36 <= {(|(7'h43))}) ^~ $signed(reg53[(4'h8):(3'h6)])));
              reg54 <= ($signed(wire35) != $unsigned($unsigned(($signed(reg43) >= (wire51 ?
                  reg53 : wire36)))));
              reg55 <= $signed((|$unsigned((-$signed(reg40)))));
              reg56 <= $signed($unsigned(wire33[(4'hb):(4'ha)]));
            end
          reg57 <= (8'hb3);
          if (reg54[(3'h4):(1'h0)])
            begin
              reg58 <= $signed($unsigned((^~wire49[(1'h0):(1'h0)])));
            end
          else
            begin
              reg58 <= wire33[(3'h5):(3'h5)];
              reg59 <= $signed(wire48[(4'ha):(1'h1)]);
              reg60 <= {{reg38[(3'h6):(2'h2)]}};
              reg61 <= (reg46 ? (~&wire50) : reg43[(3'h5):(3'h5)]);
              reg62 <= wire34;
            end
          reg63 <= $signed(reg54);
          reg64 <= ($signed($signed(reg53[(3'h5):(3'h5)])) == (^~wire51));
        end
      else
        begin
          reg53 <= reg42[(1'h1):(1'h1)];
          reg54 <= $unsigned(reg38);
        end
      reg65 <= $signed(((+((^(8'hb6)) ? $signed(reg41) : (8'hb4))) ?
          reg63 : $signed($unsigned((reg62 != wire33)))));
      reg66 <= reg62[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg67 <= (+($signed($signed($unsigned(reg44))) >= reg55[(2'h2):(2'h2)]));
      reg68 <= (-(reg59[(4'hb):(1'h1)] ?
          $unsigned((reg67[(1'h1):(1'h0)] <= (wire52 ?
              (8'ha3) : wire50))) : reg61));
    end
  assign wire69 = (-({$signed({reg60, (8'ha1)})} - reg61[(2'h3):(1'h0)]));
  assign wire70 = ((reg61 == $unsigned($unsigned((reg39 < reg44)))) ?
                      ($unsigned($signed(wire48[(4'h8):(2'h3)])) | ((~$unsigned(reg59)) ?
                          $unsigned({wire35,
                              wire48}) : wire50)) : reg62[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg71 <= (((-$signed((-reg65))) ?
              $unsigned(wire49[(4'hc):(1'h1)]) : $unsigned(reg63)) ?
          $unsigned({(!{wire35, wire52}), wire50}) : {(|$signed((8'hbc))),
              ((8'hb9) - $signed((wire52 >> (8'had))))});
      reg72 <= $unsigned((~|(!((8'hba) ? $signed(reg54) : (~wire35)))));
      if ({wire34[(1'h0):(1'h0)]})
        begin
          reg73 <= reg55[(1'h1):(1'h1)];
          reg74 <= $unsigned(((~{wire49[(5'h14):(4'hf)]}) ?
              {$signed(((7'h44) + wire49))} : reg67));
          reg75 <= (|((+reg68[(3'h6):(3'h6)]) ? wire49 : reg40[(1'h0):(1'h0)]));
          reg76 <= ($signed({{(reg44 > reg65)},
              {reg75[(5'h11):(3'h7)], $unsigned((8'hbc))}}) || reg42);
        end
      else
        begin
          reg73 <= {{$signed({(reg62 * reg56), (reg63 | wire36)})},
              {reg71[(4'hf):(4'hc)]}};
          if ((~$signed($signed(reg44[(5'h11):(3'h4)]))))
            begin
              reg74 <= reg62[(2'h2):(1'h0)];
              reg75 <= ($signed($signed((-wire36[(4'h8):(1'h1)]))) ?
                  reg53[(2'h3):(1'h1)] : reg39);
            end
          else
            begin
              reg74 <= (^(reg75[(5'h14):(3'h4)] ?
                  {(&reg64[(4'hf):(4'hf)]),
                      (+$signed(reg67))} : $signed($unsigned((reg75 ?
                      reg46 : reg47)))));
            end
          reg76 <= {reg67[(3'h5):(1'h0)], reg74};
        end
      if (((8'hab) || (~&reg60[(3'h4):(1'h0)])))
        begin
          reg77 <= (8'ha4);
          if (wire49[(1'h0):(1'h0)])
            begin
              reg78 <= (~^reg76);
            end
          else
            begin
              reg78 <= ($unsigned($signed(reg71[(1'h0):(1'h0)])) ~^ $unsigned($signed(($unsigned(reg43) + ((8'hbb) <= reg64)))));
              reg79 <= {wire35, (-$signed($unsigned({(8'ha0), reg65})))};
            end
        end
      else
        begin
          reg77 <= $unsigned(((|$unsigned($signed(reg67))) ?
              {($unsigned(reg64) != (reg64 * wire69))} : $signed((~^(8'hb2)))));
          if ($signed({$unsigned((+(&reg54))),
              (($unsigned(reg60) ?
                  (-reg40) : (wire52 >>> reg47)) == reg56[(4'hb):(2'h3)])}))
            begin
              reg78 <= reg78[(2'h2):(2'h2)];
            end
          else
            begin
              reg78 <= (reg61[(2'h3):(1'h0)] ?
                  {reg60[(4'hb):(2'h2)],
                      $unsigned(($unsigned(wire49) ?
                          $unsigned(reg38) : wire51))} : reg43[(2'h2):(1'h0)]);
            end
          reg79 <= (^~(^(((reg56 ? reg37 : (7'h42)) ?
              reg39 : $unsigned(reg38)) & (+(reg40 ? (8'ha3) : wire34)))));
          if ((reg37 ?
              $unsigned(($signed({wire33,
                  reg47}) * reg42[(5'h13):(4'hd)])) : ($signed(reg63) != (reg68[(3'h6):(3'h6)] ?
                  wire70[(1'h0):(1'h0)] : wire51[(4'ha):(2'h2)]))))
            begin
              reg80 <= (~&wire69);
              reg81 <= reg55[(1'h0):(1'h0)];
              reg82 <= reg59[(4'hb):(3'h6)];
              reg83 <= (~^wire52);
              reg84 <= $unsigned({reg38[(3'h4):(2'h3)], reg46});
            end
          else
            begin
              reg80 <= (~|{reg66});
            end
          reg85 <= (wire36 < (reg40[(2'h3):(1'h1)] ?
              wire49[(5'h12):(2'h3)] : $signed(($unsigned((8'hbb)) > (~(8'hb7))))));
        end
    end
  assign wire86 = (reg41 <= reg55[(1'h0):(1'h0)]);
  assign wire87 = wire70[(2'h3):(2'h2)];
  assign wire88 = ($unsigned((({(8'hb9)} >= (&wire86)) && $unsigned(((8'ha4) ?
                          reg38 : wire52)))) ?
                      reg56 : ($unsigned(reg38) ?
                          reg84 : $unsigned(((reg74 ? wire33 : wire51) ?
                              ((8'hab) ? wire48 : reg61) : $signed(wire35)))));
  assign wire89 = (|reg59[(3'h5):(1'h1)]);
  assign wire90 = wire70;
  assign wire91 = ($signed((wire35 >> ((|reg38) & reg83[(2'h3):(1'h0)]))) != (~^{{{reg54,
                              reg59},
                          reg79}}));
  always
    @(posedge clk) begin
      reg92 <= $unsigned($unsigned((7'h44)));
      reg93 <= $signed((+reg59[(4'he):(2'h2)]));
      if (reg81)
        begin
          reg94 <= ((!(~&((reg45 >> reg83) ?
              ((8'ha7) ? reg37 : wire69) : (wire49 ?
                  (7'h40) : wire89)))) & reg57);
          if ($unsigned($signed((wire91 ?
              (wire34[(1'h0):(1'h0)] ?
                  {reg82} : $signed(wire70)) : {$signed(reg72), (~reg79)}))))
            begin
              reg95 <= $unsigned(($signed(($unsigned((7'h41)) <<< wire86[(1'h0):(1'h0)])) * ((wire90 * reg81[(3'h6):(3'h4)]) < $unsigned(reg92))));
              reg96 <= {(($unsigned($signed((8'hb2))) ?
                          $signed(reg60[(4'hb):(4'h9)]) : (&$unsigned(wire69))) ?
                      (8'hab) : $signed($unsigned($signed(wire90))))};
              reg97 <= {wire91[(3'h4):(3'h4)]};
              reg98 <= $unsigned(reg59[(3'h5):(3'h5)]);
            end
          else
            begin
              reg95 <= ($unsigned(wire36[(2'h2):(1'h1)]) == reg37);
            end
          if ((^reg66[(3'h5):(2'h2)]))
            begin
              reg99 <= reg71[(4'ha):(4'h8)];
            end
          else
            begin
              reg99 <= (+$unsigned(reg41));
              reg100 <= ((($unsigned($signed(reg37)) ?
                  (-(~|(8'ha3))) : (reg66[(2'h2):(1'h0)] ?
                      (reg57 ?
                          reg99 : (8'haa)) : (~|reg96))) <<< reg68[(3'h6):(1'h0)]) ^~ $signed(wire49[(4'h8):(3'h6)]));
            end
          reg101 <= $unsigned(($signed($unsigned((reg83 << reg66))) & (!(reg97 - (-(8'h9c))))));
        end
      else
        begin
          reg94 <= $unsigned(((|({wire91} & reg77)) ?
              (reg81 <= (~(wire87 >= wire50))) : {(wire49[(4'he):(4'hb)] ^~ {(8'hbe),
                      reg62}),
                  reg97[(1'h0):(1'h0)]}));
          reg95 <= $signed(((($unsigned(reg92) ?
              wire34[(1'h0):(1'h0)] : ((8'haf) ?
                  (8'hbf) : reg39)) > (!(reg77 < reg53))) > $unsigned(((~&reg98) ?
              wire34[(2'h2):(1'h1)] : (wire90 ? (8'ha0) : wire69)))));
          reg96 <= reg74[(2'h2):(1'h0)];
        end
    end
endmodule
