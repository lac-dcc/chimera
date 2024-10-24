module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire179;
  wire [(5'h15):(1'h0)] wire176;
  wire signed [(4'hd):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire176,
                 wire174,
                 wire8,
                 wire7,
                 reg178,
                 reg177,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($signed(($unsigned(wire0) >>> ({wire2, wire2} ^ (wire0 ?
              (8'hb5) : wire2)))) ?
          (!{wire3[(3'h6):(3'h6)], {(!wire1)}}) : (~((wire4 < (wire1 ?
              wire4 : wire0)) <<< {$unsigned((8'ha3))})));
      reg6 <= (&$unsigned(((-wire0) ?
          ($signed(wire4) - (^~wire3)) : $signed({wire4, wire3}))));
    end
  assign wire7 = (~($signed((8'hb5)) || $signed(wire0)));
  assign wire8 = (|wire4);
  module9 #() modinst175 (wire174, clk, wire8, reg5, reg6, wire2);
  assign wire176 = (7'h40);
  always
    @(posedge clk) begin
      reg177 <= $signed($unsigned(wire2[(4'hc):(3'h6)]));
      reg178 <= (wire2[(1'h1):(1'h0)] ?
          wire1 : $unsigned(($unsigned({(8'hae), wire4}) ?
              wire174[(3'h5):(3'h4)] : {(wire176 ? wire7 : wire7),
                  (~&wire1)})));
    end
  assign wire179 = $signed(wire3);
  assign wire180 = {wire1[(3'h4):(2'h3)]};
endmodule

module module9
#(parameter param173 = (8'hbf))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire168;
  wire signed [(5'h13):(1'h0)] wire167;
  wire signed [(3'h6):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire159;
  wire signed [(3'h7):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire156;
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  reg [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire159,
                 wire158,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire61,
                 wire63,
                 wire96,
                 wire156,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (~&(8'hab));
      reg15 <= $signed(wire12[(4'h9):(4'h9)]);
    end
  assign wire16 = (((wire13[(1'h1):(1'h1)] ? reg14[(2'h2):(1'h0)] : wire13) ?
                          reg14 : (~&wire13[(3'h6):(1'h1)])) ?
                      (^$signed(wire13)) : $unsigned((reg15[(3'h6):(2'h3)] ?
                          $unsigned((7'h42)) : {{wire10}})));
  assign wire17 = wire16;
  assign wire18 = (wire11 ? wire17[(3'h5):(2'h2)] : (|wire17[(1'h0):(1'h0)]));
  assign wire19 = ($unsigned({(^~(~wire13))}) << $unsigned(wire12));
  assign wire20 = (^$unsigned((wire17[(1'h1):(1'h0)] ?
                      ((-(7'h42)) >> (wire16 & wire13)) : ($signed(wire17) ?
                          $signed(wire18) : $signed(wire10)))));
  module21 #() modinst62 (wire61, clk, wire13, wire17, wire10, reg15, wire19);
  assign wire63 = {($unsigned(wire20) - reg14)};
  module64 #() modinst97 (wire96, clk, wire12, wire10, reg15, wire16, wire18);
  module98 #() modinst157 (.wire100(wire63), .wire99(wire61), .wire102(wire18), .wire103(wire13), .wire101(wire12), .y(wire156), .clk(clk));
  assign wire158 = (8'ha9);
  assign wire159 = ($signed(wire61[(3'h4):(2'h2)]) ~^ wire156[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg160 <= ((($unsigned(wire158[(2'h3):(1'h1)]) ^ (!(~&wire159))) == wire20) ?
          ({({(8'h9c), wire11} + (&wire96)),
              (&$signed(reg14))} >= $unsigned($signed((~wire18)))) : $unsigned(wire12[(2'h3):(2'h3)]));
      reg161 <= $unsigned(wire61[(4'hd):(4'hd)]);
      reg162 <= (((wire16[(4'ha):(3'h6)] ?
              ((-wire13) ?
                  $unsigned(wire16) : ((8'hb8) ?
                      wire18 : wire156)) : {wire61[(3'h4):(2'h2)],
                  (^~wire20)}) && $signed($unsigned((^~wire20)))) ?
          $unsigned((wire10[(4'hb):(4'ha)] & wire63)) : (($unsigned(wire11[(4'h8):(1'h0)]) <= {$signed(wire10),
              (reg14 == (8'haa))}) + reg15));
      reg163 <= $signed(wire158[(2'h2):(1'h0)]);
      reg164 <= $signed(((({reg15, reg14} ? $unsigned(reg163) : (!wire13)) ?
          ($signed((8'h9d)) ?
              $unsigned(wire96) : (reg14 ? (8'hab) : wire156)) : (^~(reg161 ?
              reg162 : (8'hb3)))) ^~ (wire158[(3'h7):(3'h4)] & $unsigned((reg163 || (7'h41))))));
    end
  assign wire165 = {$signed($unsigned((^wire13[(4'h9):(3'h6)])))};
  assign wire166 = wire156;
  assign wire167 = {{wire17[(4'h9):(2'h3)],
                           $signed(((-wire18) ?
                               $unsigned((8'h9e)) : $unsigned((7'h44))))},
                       ($signed($signed(wire17)) ?
                           $unsigned((7'h44)) : (+wire158[(1'h0):(1'h0)]))};
  assign wire168 = {wire20[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg169 <= $signed(($signed((-$signed(wire20))) > $unsigned((~|wire11[(4'hb):(3'h7)]))));
      reg170 <= wire19[(4'h9):(3'h7)];
      reg171 <= ($unsigned({{(~&wire156)}}) ?
          {($signed(wire11[(4'h8):(1'h0)]) <<< $unsigned(wire158[(1'h1):(1'h0)])),
              (^~(~^reg162))} : ((reg160[(2'h2):(1'h0)] ?
                  $unsigned(((8'had) ?
                      reg169 : wire19)) : ((wire10 + wire17) >= (~&wire16))) ?
              wire158[(2'h3):(1'h1)] : ((wire167[(1'h0):(1'h0)] << (~|wire63)) * wire18)));
      reg172 <= (((~wire61) ?
              wire159[(4'he):(1'h1)] : (({reg15} ?
                  wire167 : ((8'hac) ^~ reg162)) + (wire10 ?
                  (-(8'h9e)) : wire20))) ?
          {(wire166[(3'h5):(3'h5)] ?
                  (&(wire61 < wire96)) : ((&wire158) ?
                      wire13 : (wire19 > wire63))),
              {(+$signed(reg162))}} : {{(+wire10)}});
    end
endmodule

module module98
#(parameter param154 = (!(~&{(((8'hb8) ? (8'hbb) : (7'h44)) ? ((8'hbc) ? (8'hab) : (8'ha6)) : {(8'hbb)})})), 
parameter param155 = ((8'hb8) ? {(param154 && ((param154 > (8'hbf)) == (param154 ? param154 : param154))), (param154 ? (~^{param154, param154}) : ((param154 << param154) ? param154 : (param154 ? param154 : param154)))} : (((~|(param154 ? param154 : param154)) > ((param154 ? param154 : param154) ? (param154 ? param154 : param154) : (param154 ? param154 : param154))) && param154)))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h287):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire103;
  input wire signed [(3'h5):(1'h0)] wire102;
  input wire signed [(5'h10):(1'h0)] wire101;
  input wire signed [(4'h8):(1'h0)] wire100;
  input wire [(3'h5):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire137;
  wire signed [(5'h13):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire127;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire125;
  wire [(2'h2):(1'h0)] wire114;
  wire [(3'h6):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire132,
                 wire127,
                 wire126,
                 wire125,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
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
                 reg133,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
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
                 (1'h0)};
  assign wire104 = $signed($signed({(((7'h41) ^ wire103) << (wire103 ?
                           wire103 : wire102)),
                       ((wire101 > wire103) != wire99)}));
  assign wire105 = wire101;
  assign wire106 = ((({(~(8'hac)), wire101[(4'h8):(4'h8)]} ?
                           (^~{wire102, (8'hb4)}) : {wire99,
                               (!wire101)}) ~^ wire100) ?
                       $signed($signed(((wire101 >= (7'h43)) ?
                           wire103 : (wire100 ?
                               wire101 : wire102)))) : wire102);
  assign wire107 = $signed(wire103[(2'h2):(1'h0)]);
  assign wire108 = wire106[(4'he):(2'h3)];
  assign wire109 = $unsigned(wire103);
  assign wire110 = wire106[(4'h8):(3'h7)];
  assign wire111 = (^~$signed((((wire106 >> wire110) ?
                           $unsigned(wire109) : $signed(wire107)) ?
                       (wire109[(2'h3):(2'h3)] > {wire103,
                           (7'h44)}) : (~((8'ha0) ? wire104 : wire104)))));
  assign wire112 = ($signed($unsigned(wire111[(3'h5):(3'h5)])) == wire99);
  assign wire113 = (-wire107);
  assign wire114 = (~^{wire112, $unsigned((!wire110[(4'he):(4'hc)]))});
  always
    @(posedge clk) begin
      reg115 <= (+wire110[(5'h11):(2'h3)]);
      reg116 <= ($signed((-(wire114[(2'h2):(1'h0)] - $unsigned(reg115)))) ?
          $unsigned(wire110) : $signed((wire113 ?
              wire109 : ((+wire114) >= (wire112 ? wire112 : wire110)))));
      if ({$signed($signed(((+wire108) >= $signed(wire111)))),
          $signed((reg115[(1'h1):(1'h0)] >= (~^reg116)))})
        begin
          reg117 <= wire99;
          reg118 <= wire100[(1'h0):(1'h0)];
          if (wire99[(1'h0):(1'h0)])
            begin
              reg119 <= reg117;
              reg120 <= (wire103 << wire110);
              reg121 <= (^(~^wire110));
            end
          else
            begin
              reg119 <= wire102[(1'h0):(1'h0)];
              reg120 <= wire105[(3'h6):(3'h5)];
              reg121 <= wire99;
              reg122 <= ((8'h9f) > $unsigned($unsigned(($signed(wire112) ?
                  reg118[(3'h6):(3'h4)] : (&(7'h42))))));
              reg123 <= $unsigned(((wire103 | wire105) <<< reg116));
            end
          reg124 <= (8'hba);
        end
      else
        begin
          if ((+((&wire101) | (~&reg120[(4'ha):(3'h5)]))))
            begin
              reg117 <= ((wire114[(1'h0):(1'h0)] ?
                  reg119 : $unsigned($signed({wire114, wire100}))) > reg117);
            end
          else
            begin
              reg117 <= (((~^{wire101[(4'h9):(2'h3)]}) ?
                      wire102[(3'h4):(2'h3)] : wire109) ?
                  wire104[(1'h1):(1'h0)] : ($unsigned(((wire106 > reg116) ?
                      reg119[(4'he):(4'h9)] : $unsigned(wire104))) < wire102[(2'h3):(2'h2)]));
              reg118 <= wire109[(2'h2):(1'h1)];
              reg119 <= (+$unsigned($signed($signed(wire102[(3'h5):(2'h3)]))));
            end
          reg120 <= $unsigned((($signed(wire111) ?
                  ({reg116, wire112} ?
                      reg116[(3'h4):(1'h1)] : (reg120 | wire107)) : (!(8'hb9))) ?
              (^(^(reg118 * reg124))) : (wire114 ?
                  $unsigned(wire102[(3'h5):(2'h2)]) : wire108[(3'h5):(3'h5)])));
        end
    end
  assign wire125 = ($signed($signed($unsigned($unsigned(wire101)))) <= $signed(reg118));
  assign wire126 = $signed($signed(wire109));
  assign wire127 = (&wire110);
  always
    @(posedge clk) begin
      reg128 <= wire113;
      reg129 <= ($unsigned($signed($unsigned((wire125 ?
          wire126 : (8'haf))))) && (reg118[(1'h0):(1'h0)] ?
          (wire113 ?
              $signed(reg116[(1'h1):(1'h1)]) : {reg122[(4'hc):(4'h8)]}) : (~&{wire104})));
      reg130 <= $unsigned(($signed(wire109) <= wire126));
      reg131 <= (($unsigned((7'h42)) ?
              (^~$unsigned($unsigned((7'h44)))) : (reg115 ?
                  $signed((^~reg116)) : wire125)) ?
          (((((8'haf) ? (8'ha7) : wire106) ?
                  $unsigned((8'haa)) : $unsigned(wire109)) ?
              (8'ha6) : (-(wire99 ?
                  wire106 : reg121))) <<< $unsigned({(|reg120)})) : {$signed($signed($unsigned(reg130)))});
    end
  assign wire132 = wire108[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg133 <= $unsigned((~&(reg116[(1'h0):(1'h0)] <<< reg124[(3'h4):(2'h3)])));
    end
  assign wire134 = reg119[(4'hd):(4'hb)];
  assign wire135 = ((~(~|($unsigned((8'ha2)) - (wire101 != reg116)))) ?
                       $signed($signed((wire114 ?
                           {wire114,
                               wire103} : {reg116}))) : wire110[(2'h2):(2'h2)]);
  assign wire136 = {(+(~$unsigned($unsigned(wire110))))};
  assign wire137 = (7'h40);
  always
    @(posedge clk) begin
      if ($signed((wire99 - $unsigned(wire127[(4'hb):(1'h1)]))))
        begin
          reg138 <= $signed(reg122);
          reg139 <= ($unsigned((reg118[(1'h1):(1'h1)] ^~ (~(8'hb6)))) ?
              $signed((((wire99 ^ reg123) ?
                  (wire109 ^~ wire126) : wire106[(4'hd):(3'h5)]) < $signed($signed(wire132)))) : wire135[(4'he):(1'h0)]);
          if (reg121[(3'h7):(3'h4)])
            begin
              reg140 <= $signed((~|((((8'ha9) ^ wire109) * wire112) ^~ ($signed(reg128) <= (wire112 * wire135)))));
              reg141 <= (8'hba);
              reg142 <= reg119[(4'hb):(1'h0)];
              reg143 <= reg139;
            end
          else
            begin
              reg140 <= (reg142 ?
                  (((!wire108[(4'hf):(3'h6)]) <= $unsigned({reg119})) ?
                      $unsigned(reg142) : $signed(($signed((8'ha2)) <= $unsigned(reg121)))) : {($unsigned(wire125) ?
                          $unsigned(wire137) : {$signed(wire104)})});
            end
          reg144 <= (wire105 ?
              $unsigned((reg119 ?
                  reg131 : (!$unsigned((8'ha7))))) : $unsigned($signed(reg121)));
          reg145 <= reg123;
        end
      else
        begin
          reg138 <= wire125;
          reg139 <= reg121[(3'h6):(2'h2)];
          reg140 <= ($unsigned((reg120[(4'hc):(4'hc)] ~^ ($signed(wire136) == wire105[(4'hd):(4'hd)]))) ?
              (({(reg139 ? wire113 : (7'h40))} ?
                      ((wire112 != reg120) ?
                          wire134[(1'h1):(1'h0)] : {wire126,
                              reg117}) : $unsigned((^~wire113))) ?
                  (!reg138[(3'h5):(3'h4)]) : (^$unsigned($unsigned(reg141)))) : (^~reg119[(3'h5):(3'h5)]));
          reg141 <= reg121[(2'h2):(1'h1)];
        end
      if ($signed((wire107 ?
          (&(wire127[(5'h11):(2'h3)] >= $unsigned(wire111))) : (+(wire134[(3'h7):(3'h7)] >> $unsigned(reg138))))))
        begin
          if ($signed((-(({wire105} ? $signed(reg124) : $unsigned(wire100)) ?
              $signed({wire126}) : ((8'hba) ?
                  reg123[(1'h1):(1'h0)] : {(8'hbf), wire111})))))
            begin
              reg146 <= reg142[(2'h2):(1'h0)];
              reg147 <= ((~(~&(^$signed(reg123)))) >>> reg115[(3'h6):(2'h2)]);
            end
          else
            begin
              reg146 <= $signed(reg128[(3'h5):(3'h5)]);
            end
          if ((~&$unsigned(reg138)))
            begin
              reg148 <= wire137[(3'h6):(2'h3)];
              reg149 <= ($signed($signed($unsigned((-reg131)))) - wire101[(1'h1):(1'h0)]);
              reg150 <= reg146[(3'h7):(3'h5)];
              reg151 <= (~|(wire102 ?
                  (!{reg128[(3'h4):(3'h4)]}) : (~^$signed($signed(wire108)))));
            end
          else
            begin
              reg148 <= wire137[(3'h5):(2'h3)];
              reg149 <= reg138;
            end
          reg152 <= reg149;
        end
      else
        begin
          reg146 <= reg123;
          reg147 <= reg116[(3'h5):(1'h1)];
          reg148 <= reg150[(4'h8):(3'h6)];
          reg149 <= {$unsigned(wire125[(4'h9):(3'h4)]), $unsigned(reg147)};
          reg150 <= (reg142[(4'he):(3'h7)] ?
              $unsigned(wire99[(2'h3):(1'h1)]) : wire107);
        end
      reg153 <= (((((-wire113) ?
              {wire110,
                  (8'h9f)} : ((8'ha0) <= wire104)) ^~ ((-wire108) >= (wire137 << reg151))) ?
          $signed((+{wire114})) : ({(8'hb9)} ?
              wire135[(4'ha):(2'h3)] : $unsigned((wire135 <= wire127)))) << (8'haa));
    end
endmodule

module module64  (y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire69;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire [(4'hf):(1'h0)] wire67;
  input wire [(4'hd):(1'h0)] wire66;
  input wire [(3'h6):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire71,
                 wire70,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire70 = $signed(($signed($unsigned((-wire65))) > (wire65[(2'h3):(1'h0)] * ((wire69 ?
                      wire67 : wire68) > (wire67 + wire66)))));
  assign wire71 = {(wire66 < ((wire70[(2'h2):(1'h0)] ?
                          (wire69 ?
                              wire66 : wire70) : wire67) << $unsigned({wire70})))};
  always
    @(posedge clk) begin
      reg72 <= (~|$signed($signed(((|wire68) ?
          $signed(wire70) : (wire69 | (8'h9d))))));
      if ((((($signed(wire71) ?
                  (^~wire66) : (wire66 << wire69)) * $unsigned((~wire65))) ?
              $signed($signed($signed((8'hb3)))) : wire70[(2'h2):(1'h0)]) ?
          ($signed($unsigned(wire67[(3'h5):(3'h4)])) <= wire71[(3'h7):(3'h5)]) : wire71[(2'h2):(1'h0)]))
        begin
          reg73 <= reg72;
          reg74 <= $unsigned((-({(wire69 ? wire69 : wire70)} ?
              wire68 : ((&wire71) ? wire70 : $unsigned(wire69)))));
        end
      else
        begin
          if (wire66)
            begin
              reg73 <= (~&$unsigned({({wire70, reg72} ?
                      (wire66 <= wire70) : (-wire71)),
                  $unsigned($signed((8'hbd)))}));
            end
          else
            begin
              reg73 <= reg72[(2'h3):(2'h3)];
              reg74 <= $signed({{((reg73 + wire66) ? wire68 : $signed(wire69)),
                      $unsigned(((8'hb9) < wire71))},
                  wire66});
            end
          if (wire69)
            begin
              reg75 <= ($signed(wire69[(3'h6):(1'h0)]) ?
                  (({(reg72 ? wire68 : (7'h43))} <= $signed((reg72 ?
                      (8'hbb) : wire65))) | {wire70[(1'h0):(1'h0)]}) : $signed((((8'hb1) ?
                          $unsigned(wire65) : (reg72 ? reg72 : wire70)) ?
                      $signed((~&wire70)) : ($signed(wire67) ?
                          (reg74 ? reg72 : (8'hab)) : {(8'ha9), wire65}))));
              reg76 <= wire67;
              reg77 <= {(|reg74)};
              reg78 <= reg76;
              reg79 <= ($signed((wire69[(3'h6):(3'h4)] > $signed((8'hb3)))) >= ((!(8'hb4)) < wire67));
            end
          else
            begin
              reg75 <= ($signed(wire70[(2'h2):(2'h2)]) > (+$unsigned(($unsigned(wire71) >>> $unsigned(reg75)))));
              reg76 <= $unsigned($unsigned((^reg79)));
              reg77 <= ((-(reg76 ?
                  $unsigned(wire67[(3'h7):(3'h5)]) : ((wire70 ?
                      wire70 : reg73) + (~^(8'ha9))))) == wire67[(2'h3):(2'h3)]);
            end
          reg80 <= reg79[(3'h5):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      reg81 <= $signed({((~|{wire65, reg79}) > $signed((~reg78))), wire67});
      reg82 <= {reg72[(2'h3):(1'h1)], $signed(reg81[(3'h7):(2'h2)])};
      if ($unsigned((-(((~reg77) ?
          $signed((8'hba)) : (8'hab)) == $signed(wire68)))))
        begin
          if (wire69)
            begin
              reg83 <= $unsigned((|reg81[(1'h0):(1'h0)]));
            end
          else
            begin
              reg83 <= $unsigned((~^wire70[(2'h2):(1'h0)]));
              reg84 <= ($signed((((wire68 ? wire68 : reg78) <= {(8'ha3),
                  reg77}) == (reg76[(4'hd):(4'h8)] ?
                  reg73[(1'h0):(1'h0)] : reg79[(4'h9):(2'h2)]))) + $signed($unsigned($signed($signed(reg74)))));
              reg85 <= $signed(((8'ha1) > ({$unsigned(reg79)} ?
                  ((8'hac) ? $signed(reg84) : reg75) : ((reg81 + wire67) ?
                      reg73 : $unsigned(wire70)))));
              reg86 <= $signed($unsigned(reg73[(4'he):(4'h8)]));
              reg87 <= $unsigned($signed($signed((^$signed(reg80)))));
            end
        end
      else
        begin
          reg83 <= reg74;
          reg84 <= (reg78[(1'h0):(1'h0)] >= $unsigned(($unsigned((reg81 > (8'hbc))) || $signed($signed(reg85)))));
          reg85 <= reg82[(1'h0):(1'h0)];
        end
      if ($signed(($unsigned($unsigned((|reg85))) >>> $unsigned({wire65}))))
        begin
          reg88 <= $unsigned({{$unsigned((&reg77))},
              {$unsigned($unsigned(reg80)),
                  ((wire67 ? wire66 : reg84) <<< reg78[(1'h1):(1'h1)])}});
        end
      else
        begin
          reg88 <= {reg88, $signed($signed((!$signed(reg74))))};
          reg89 <= $signed($unsigned((reg80 ^ reg76[(4'hc):(1'h1)])));
          reg90 <= (+reg77[(4'hd):(4'hc)]);
        end
    end
  assign wire91 = ((&$unsigned(reg85[(3'h4):(1'h1)])) ?
                      $signed((~&reg79)) : (((&{reg74, (8'hb4)}) ?
                              reg90 : reg90[(4'hf):(4'hd)]) ?
                          reg77 : wire71));
  assign wire92 = (($signed((~$unsigned(reg76))) ^ ($signed(reg88[(4'h8):(3'h6)]) <<< ((|reg84) ?
                          $unsigned(reg79) : wire67[(1'h1):(1'h1)]))) ?
                      {(($unsigned(wire91) >= $signed(reg89)) ?
                              (^reg89[(4'hc):(1'h0)]) : wire71),
                          $unsigned((~^((7'h41) ?
                              reg86 : (8'hbb))))} : $unsigned($signed(reg76)));
  assign wire93 = (wire91 ?
                      (wire69[(3'h6):(1'h0)] == (reg78 == {$signed(wire68),
                          wire66})) : reg86[(5'h12):(4'hb)]);
  assign wire94 = {{(($unsigned(reg83) - (~&reg88)) <= $signed(((8'ha6) ?
                              reg89 : reg90)))}};
  assign wire95 = (^~(-reg80));
endmodule

module module21
#(parameter param60 = (((^((-(8'hab)) | ((8'ha8) ? (8'hb1) : (8'ha6)))) ? (~&((^(8'hbe)) <= {(8'hbc)})) : ((((8'hbf) << (8'hbc)) & ((8'ha0) && (8'h9e))) ? (((8'ha8) ? (8'hbd) : (8'hb1)) ? (8'ha7) : ((8'ha8) ? (8'ha1) : (8'ha2))) : (((8'h9e) ? (8'hb8) : (8'ha8)) - ((8'hbd) || (8'hab))))) * ({(-((8'hb6) ? (8'hb9) : (8'hbb))), (((8'ha7) ? (8'hb1) : (7'h44)) ? (^(7'h40)) : ((8'hbf) <= (8'ha2)))} * {(!((8'hba) ? (8'h9f) : (8'had)))})))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire26;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  input wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire27;
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire28,
                 wire27,
                 reg54,
                 reg50,
                 reg49,
                 reg48,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire27 = $unsigned(({(wire24[(4'hd):(4'ha)] <<< (^wire24)),
                      $signed($signed((8'ha2)))} | (-$signed(wire23[(5'h10):(4'h8)]))));
  assign wire28 = $unsigned(($signed($signed((8'hb6))) ?
                      (((wire25 <= wire26) != {wire22, wire24}) ?
                          wire24[(1'h1):(1'h1)] : $signed((wire25 ?
                              wire27 : wire22))) : {((wire22 ?
                              (8'ha3) : wire27) ~^ (!wire26)),
                          (!$unsigned(wire27))}));
  always
    @(posedge clk) begin
      if (((|({$signed(wire25), wire28} <<< (&wire25))) >> {$unsigned(wire24)}))
        begin
          reg29 <= (wire22 >>> wire24);
          reg30 <= $signed(wire23[(4'hf):(4'ha)]);
          reg31 <= reg30[(4'hd):(1'h1)];
        end
      else
        begin
          if (reg29)
            begin
              reg29 <= (wire22[(4'h9):(3'h4)] ?
                  wire22 : $signed(((&(~wire22)) ?
                      (wire27[(1'h0):(1'h0)] ?
                          wire24 : $unsigned((8'hac))) : (~$unsigned(wire27)))));
              reg30 <= $unsigned($unsigned(((reg29[(2'h3):(1'h1)] && $signed((8'ha3))) ?
                  (+$signed(wire25)) : $signed($unsigned(reg31)))));
            end
          else
            begin
              reg29 <= {wire25};
              reg30 <= {wire28[(1'h1):(1'h1)]};
            end
          reg31 <= ($signed((^~{$signed(wire27)})) ?
              (+(((-reg30) != (wire27 >= wire25)) ?
                  (~^wire24[(4'h8):(3'h6)]) : ((wire22 ?
                      wire26 : reg31) & ((8'ha8) | wire22)))) : $unsigned(((^~(~|wire27)) ?
                  $unsigned((wire26 ?
                      wire28 : wire26)) : (!wire26[(1'h1):(1'h1)]))));
          reg32 <= $unsigned((wire23[(2'h2):(2'h2)] <= (($unsigned(reg29) && (8'hae)) ?
              reg31[(2'h3):(1'h1)] : $unsigned(reg31))));
        end
    end
  always
    @(posedge clk) begin
      reg33 <= (~^wire28[(2'h2):(1'h0)]);
      reg34 <= wire25[(3'h6):(3'h5)];
    end
  assign wire35 = (-(~^wire25));
  assign wire36 = (|(((~$unsigned(reg33)) && {$signed(reg32)}) ?
                      ($signed(((8'ha9) ?
                          (8'hb9) : wire26)) - (+(wire24 ^ reg29))) : wire23));
  assign wire37 = $signed($signed((($signed((8'hab)) ?
                          reg32[(2'h3):(2'h2)] : reg32[(2'h3):(1'h1)]) ?
                      reg30[(3'h7):(1'h1)] : (!(!reg33)))));
  assign wire38 = (8'had);
  assign wire39 = $unsigned(((|((reg33 > wire25) ?
                          {wire22} : (wire25 <= reg34))) ?
                      (wire24[(4'h8):(3'h7)] >>> $unsigned({wire35})) : $signed(reg34)));
  assign wire40 = $unsigned((~wire36[(4'ha):(4'h8)]));
  always
    @(posedge clk) begin
      reg41 <= (($signed(((wire23 ? wire27 : wire22) <= ((8'hb6) >>> reg33))) ?
          wire36[(3'h7):(3'h6)] : wire35[(3'h6):(3'h4)]) <<< wire25);
      if (((wire26[(1'h0):(1'h0)] ? (-wire40) : $signed($unsigned(wire24))) ?
          $unsigned((reg29 ?
              $unsigned((!wire28)) : (~&(wire40 != reg29)))) : wire40))
        begin
          reg42 <= (~&(-(reg41[(3'h6):(2'h2)] ?
              $unsigned(((8'hba) == wire39)) : (~|$signed(wire24)))));
          reg43 <= ((($unsigned((wire28 ?
                      wire22 : reg32)) <= wire24[(3'h4):(3'h4)]) ?
                  {(~^reg33), reg41} : wire27) ?
              ((($unsigned(reg42) ^ reg34[(5'h10):(4'hb)]) || {(wire24 && wire35),
                  $unsigned(wire23)}) ^ wire35[(3'h6):(1'h0)]) : wire38);
        end
      else
        begin
          reg42 <= $unsigned(($unsigned((^$signed((8'hb9)))) ~^ {$signed(wire40),
              (!(wire40 ? wire25 : reg41))}));
          reg43 <= (^wire39[(4'hc):(4'hb)]);
          reg44 <= ($signed(({wire35, $signed((8'h9f))} ?
                  wire27[(2'h2):(1'h1)] : wire27)) ?
              (reg32 <= ($signed((wire23 <= reg42)) || {reg31})) : ($signed(($signed(wire28) ?
                      {wire25} : {wire36, wire23})) ?
                  ($signed($unsigned(reg30)) ?
                      ({reg29, wire23} ?
                          wire27[(2'h3):(1'h0)] : (reg34 * wire27)) : (wire24[(4'hc):(3'h4)] ?
                          $unsigned(reg34) : wire37[(1'h0):(1'h0)])) : reg32));
          reg45 <= $unsigned($signed(((-wire26) & ((~|wire36) ^~ reg34))));
        end
      reg46 <= $unsigned(wire37);
    end
  assign wire47 = wire28;
  always
    @(posedge clk) begin
      reg48 <= $signed(wire23);
    end
  always
    @(posedge clk) begin
      reg49 <= wire47[(4'ha):(4'h8)];
      reg50 <= $signed($unsigned(reg29));
    end
  assign wire51 = $unsigned($signed($unsigned(($signed((8'hbf)) ~^ $signed(wire22)))));
  assign wire52 = wire24;
  assign wire53 = wire47[(4'ha):(1'h0)];
  always
    @(posedge clk) begin
      reg54 <= {(~&$signed($unsigned({wire26, reg34}))),
          ((~|$signed((wire22 & (8'hae)))) ?
              $signed(wire23) : (({wire52, reg30} >>> wire51[(3'h5):(3'h4)]) ?
                  $unsigned((&wire25)) : $unsigned(reg42)))};
    end
  assign wire55 = $signed(reg54[(3'h5):(2'h2)]);
  assign wire56 = $unsigned(reg50[(3'h5):(3'h4)]);
  assign wire57 = {$signed(({$signed(wire26)} && wire24))};
  assign wire58 = (wire25[(3'h4):(1'h0)] | wire38);
  assign wire59 = (~^wire25[(3'h4):(3'h4)]);
endmodule
