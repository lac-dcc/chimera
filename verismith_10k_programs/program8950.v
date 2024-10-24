module top
#(parameter param178 = {({(^~((8'hae) < (8'hb8)))} ? ((((8'hbb) ? (8'hbb) : (8'had)) ? ((8'ha3) ? (7'h41) : (8'hb5)) : ((8'hbc) ? (7'h43) : (8'hb0))) ^~ {((8'had) <<< (8'hb2))}) : (({(8'hb6), (8'ha3)} >> (-(8'hb7))) <= (!((8'ha4) ? (8'ha5) : (8'hbe)))))}, 
parameter param179 = (~(^((-param178) ? param178 : ({(8'hb0), param178} * (param178 ? param178 : (8'hb7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire177;
  wire [(2'h2):(1'h0)] wire174;
  wire signed [(3'h6):(1'h0)] wire173;
  wire [(3'h7):(1'h0)] wire161;
  wire signed [(3'h5):(1'h0)] wire160;
  wire signed [(5'h15):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire158;
  wire signed [(5'h12):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire156;
  wire signed [(4'ha):(1'h0)] wire154;
  wire signed [(5'h15):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg175 = (1'h0);
  reg [(4'hb):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg168 = (1'h0);
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg166 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg165 = (1'h0);
  reg [(4'hf):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  assign y = {wire177,
                 wire174,
                 wire173,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire154,
                 wire152,
                 wire6,
                 wire5,
                 reg176,
                 reg175,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg155,
                 (1'h0)};
  assign wire5 = (wire3[(4'h9):(3'h4)] == (wire3 ?
                     ((wire4[(2'h2):(1'h1)] < $unsigned(wire2)) ?
                         (wire0 > {wire0}) : $signed($signed(wire2))) : wire0[(4'h9):(4'h9)]));
  assign wire6 = wire5;
  module7 #() modinst153 (wire152, clk, wire1, wire4, wire6, wire0);
  assign wire154 = (~|$signed((8'hb2)));
  always
    @(posedge clk) begin
      reg155 <= (^((-((wire1 ? wire6 : wire2) & wire5)) ?
          ({wire6,
              wire6[(3'h7):(2'h2)]} & {(wire1 && wire6)}) : $signed({(!wire0),
              $signed(wire2)})));
    end
  assign wire156 = wire152;
  assign wire157 = $unsigned((($signed(wire152) >>> wire0) ^ (wire2 ?
                       (-(wire152 * wire6)) : wire152[(1'h1):(1'h1)])));
  assign wire158 = wire0[(3'h6):(1'h1)];
  assign wire159 = (($signed((+$signed(wire6))) ~^ (~|((wire157 <= (8'hbd)) != $signed(wire2)))) >= $unsigned(wire1[(2'h3):(1'h0)]));
  assign wire160 = (~&$unsigned(reg155));
  assign wire161 = (wire1[(4'h8):(3'h6)] ?
                       (^~wire152) : (wire4 && $unsigned({wire156, wire159})));
  always
    @(posedge clk) begin
      if (wire158)
        begin
          reg162 <= $unsigned(wire160);
          reg163 <= wire158[(4'h8):(2'h3)];
          reg164 <= wire1[(3'h5):(3'h4)];
        end
      else
        begin
          reg162 <= ((^($unsigned((wire4 ? wire4 : wire157)) ?
              reg162 : {(&wire5)})) * {$signed(($signed(wire156) > (&wire1)))});
          if (wire152[(5'h13):(3'h7)])
            begin
              reg163 <= (!$signed((|(((8'hbf) ^~ wire3) + $unsigned(reg155)))));
              reg164 <= (+{$unsigned((~&wire2)), (~&reg162)});
              reg165 <= wire161;
              reg166 <= $signed((+(wire159[(4'hc):(1'h0)] || $signed($signed(wire152)))));
              reg167 <= ((!(wire4 + wire0[(2'h3):(1'h1)])) && wire2[(2'h2):(1'h0)]);
            end
          else
            begin
              reg163 <= wire157;
            end
          reg168 <= ({$signed((~(wire159 ? wire1 : wire154))), (&wire160)} ?
              reg162 : $unsigned($signed({wire154[(3'h5):(3'h4)],
                  ((8'ha4) | wire160)})));
          reg169 <= ($signed((wire161 ?
              wire159[(5'h14):(3'h4)] : {$signed((8'ha0)),
                  (wire2 < reg163)})) <<< $signed(wire6));
          if ($unsigned((8'haa)))
            begin
              reg170 <= ((^~(-(&reg165))) >> $signed(({(wire160 ?
                          (8'hb2) : wire154),
                      wire156} ?
                  (~|(wire161 ? reg164 : reg167)) : (~&(^wire6)))));
            end
          else
            begin
              reg170 <= $unsigned((((+$unsigned(reg163)) == (wire158 ^ ((8'hb2) ?
                      wire158 : wire1))) ?
                  (7'h44) : {reg170[(1'h1):(1'h1)]}));
            end
        end
      reg171 <= (($signed(reg164[(4'h8):(1'h0)]) ^ reg165[(1'h1):(1'h0)]) ?
          $unsigned(wire0[(2'h3):(1'h1)]) : $signed((reg164 * wire3)));
      reg172 <= reg167;
    end
  assign wire173 = ($signed($signed({(~wire4)})) ~^ ((-(^$signed(reg170))) ^~ {wire158[(2'h3):(2'h3)],
                       (&$signed(wire158))}));
  assign wire174 = $signed(((8'hb4) ?
                       {((~^wire156) ^ $signed(reg172)),
                           ($unsigned(wire154) >= (reg163 <= wire161))} : ($unsigned({reg166}) ?
                           ($unsigned((8'hba)) && $signed(wire1)) : ((~|reg163) ?
                               (~&(8'hbf)) : (8'hab)))));
  always
    @(posedge clk) begin
      reg175 <= wire3[(1'h0):(1'h0)];
      reg176 <= (8'had);
    end
  assign wire177 = reg163[(4'hb):(2'h2)];
endmodule

module module7
#(parameter param150 = (((8'hb0) <= ((^~((8'hb6) ? (8'hb1) : (7'h41))) | (((8'hba) & (8'hb5)) && (~&(8'hab))))) ? ((|(~&((8'hab) ? (8'had) : (8'hb0)))) + {(-{(7'h43), (8'hab)}), ({(8'hbd)} ? ((8'h9d) << (8'hb4)) : ((8'ha2) ? (8'ha0) : (8'hb1)))}) : {(~&(!(8'hbb))), (^~(((8'hae) ? (8'hbb) : (8'hb7)) ? (+(8'hb0)) : (~|(8'h9f))))}), 
parameter param151 = (~&param150))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire137;
  reg signed [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire12,
                 wire13,
                 wire14,
                 wire57,
                 wire64,
                 wire75,
                 wire137,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg77,
                 reg76,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire12 = $unsigned((^~(((8'hb4) ?
                      (wire11 == wire9) : wire8[(4'h9):(1'h0)]) ^~ {(wire11 || wire11),
                      wire9[(2'h2):(1'h0)]})));
  assign wire13 = $signed($unsigned((~&(~^$unsigned(wire10)))));
  assign wire14 = (wire8[(1'h1):(1'h0)] && (8'haa));
  module15 #() modinst58 (wire57, clk, wire13, wire14, wire9, wire8);
  always
    @(posedge clk) begin
      reg59 <= (wire14 ~^ wire8);
      reg60 <= $unsigned(({$unsigned($signed(wire8)),
              ($signed(wire11) ^~ ((8'ha0) ? wire8 : wire9))} ?
          $unsigned({wire8, $unsigned(wire9)}) : wire57[(4'hb):(2'h2)]));
      reg61 <= ((8'had) && {wire9[(3'h5):(3'h4)]});
      reg62 <= wire8[(2'h2):(1'h1)];
      reg63 <= wire13[(3'h7):(1'h0)];
    end
  assign wire64 = {$unsigned((!$signed($unsigned(reg61)))),
                      (!reg59[(4'h8):(3'h4)])};
  always
    @(posedge clk) begin
      reg65 <= wire8;
      reg66 <= ($unsigned((~^(-{wire14, (8'ha0)}))) ?
          reg62[(2'h3):(1'h1)] : {reg60[(2'h3):(1'h1)]});
      if ($signed(wire14))
        begin
          if ($unsigned(($unsigned(wire10) ?
              ($unsigned((~|reg61)) - (^~((8'h9e) ?
                  (8'ha4) : reg60))) : (wire8 ?
                  (wire10 <= wire12) : ($signed(reg66) >> (wire8 ?
                      wire13 : wire57))))))
            begin
              reg67 <= {$signed(({{reg66, wire14}} >= (8'ha6)))};
              reg68 <= (wire8[(1'h1):(1'h1)] && (wire64 ?
                  (reg62[(2'h2):(1'h0)] ? wire10 : {$signed(wire9)}) : wire13));
            end
          else
            begin
              reg67 <= {{(reg59[(1'h0):(1'h0)] ?
                          ((reg59 ? wire14 : (8'haf)) ?
                              (!reg66) : $signed((8'hb6))) : $signed($unsigned(wire57))),
                      (|wire10)},
                  ($unsigned(((~reg67) ? (reg62 ? reg63 : reg67) : (~wire12))) ?
                      reg65 : (((wire8 ?
                          (8'hb3) : reg61) ~^ (+reg65)) + $signed({(8'hb7),
                          wire11})))};
              reg68 <= (reg65[(4'h8):(2'h2)] ?
                  reg65[(1'h0):(1'h0)] : reg63[(1'h1):(1'h0)]);
              reg69 <= wire10[(3'h4):(3'h4)];
            end
          if (reg59)
            begin
              reg70 <= $unsigned($unsigned($unsigned($unsigned((~reg60)))));
              reg71 <= ($signed(($unsigned((wire11 ? reg62 : (8'hac))) ?
                      ($signed((8'hbe)) ?
                          (reg67 ? wire10 : reg59) : (reg68 ?
                              (7'h43) : wire8)) : reg59)) ?
                  wire10 : $signed($signed($unsigned($unsigned(reg68)))));
            end
          else
            begin
              reg70 <= wire64[(1'h1):(1'h1)];
              reg71 <= ($signed((wire64 ?
                  {(reg65 ^~ reg67)} : wire11[(1'h1):(1'h0)])) & $unsigned($unsigned(reg70[(3'h4):(1'h1)])));
            end
          if (($unsigned(reg63[(1'h1):(1'h0)]) ? reg71 : reg69[(4'hc):(4'hb)]))
            begin
              reg72 <= ($signed($signed($signed(reg65))) ?
                  ($signed(reg60) ?
                      reg62 : ({reg60[(5'h10):(4'he)],
                          (wire13 ? wire64 : reg69)} >= ((reg59 ?
                              reg69 : reg61) ?
                          ((8'hac) <= wire11) : $signed(wire12)))) : ((~reg68) ?
                      (|(7'h40)) : reg62));
              reg73 <= $signed(($unsigned($unsigned(reg70)) | reg63[(4'he):(4'he)]));
            end
          else
            begin
              reg72 <= $unsigned((reg66 <= (!$unsigned(reg60))));
            end
          reg74 <= (!reg72);
        end
      else
        begin
          reg67 <= $unsigned((+$signed((&(|reg69)))));
        end
    end
  assign wire75 = $unsigned(reg59[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg76 <= (reg66 ? {$unsigned($signed((^~(8'hb7))))} : wire13);
      reg77 <= {(($unsigned(((8'hbc) != wire8)) ?
              (reg66 ?
                  wire12[(3'h6):(2'h2)] : (8'ha9)) : wire9[(4'hf):(2'h2)]) != reg73[(3'h6):(2'h2)]),
          (-$signed($unsigned((reg72 * reg60))))};
    end
  module78 #() modinst138 (wire137, clk, reg61, wire10, wire13, wire14, reg65);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned(wire64))))
        begin
          reg139 <= $unsigned(reg61);
          reg140 <= $unsigned((((&reg61[(4'hb):(3'h5)]) >= (+(reg72 && wire64))) ?
              ((~&(reg72 ? wire64 : (8'ha8))) ?
                  wire8 : (~&(wire75 && reg61))) : reg66[(4'ha):(2'h2)]));
          reg141 <= ($signed(reg77) < reg61);
          if (((+$unsigned((wire75[(3'h4):(1'h1)] ^ (reg73 ?
                  reg60 : reg139)))) ?
              (((wire9 ? (reg140 > reg66) : $unsigned(reg66)) ?
                  (wire11[(2'h3):(1'h0)] ?
                      (^reg139) : {wire14,
                          wire12}) : $signed((&(8'haf)))) * reg66) : {(&$signed(reg139)),
                  {(((8'ha1) ? reg77 : reg73) ~^ (reg63 ? wire8 : wire12)),
                      $signed($unsigned(wire137))}}))
            begin
              reg142 <= {(^($unsigned(((7'h44) ?
                      wire13 : wire64)) * wire10[(1'h1):(1'h0)])),
                  wire64[(3'h4):(1'h0)]};
              reg143 <= wire11;
              reg144 <= ((wire12 << ($signed($unsigned((8'hbc))) ?
                  (~$unsigned(wire9)) : wire57[(5'h10):(4'hc)])) || wire11[(2'h3):(2'h3)]);
              reg145 <= (!wire10[(4'h9):(3'h6)]);
              reg146 <= {(reg144[(3'h4):(3'h4)] * ((8'hbd) == $signed({reg73})))};
            end
          else
            begin
              reg142 <= (reg76 * reg73[(3'h7):(1'h1)]);
              reg143 <= wire8;
              reg144 <= reg66[(3'h5):(2'h3)];
              reg145 <= reg146[(3'h6):(2'h2)];
            end
          reg147 <= $signed(reg142);
        end
      else
        begin
          reg139 <= $unsigned((reg59 ?
              $signed($unsigned($unsigned(reg145))) : reg145[(2'h3):(1'h0)]));
          reg140 <= (($signed($unsigned($unsigned(reg61))) ~^ (reg144[(4'hf):(4'hd)] >> $signed({(7'h44),
                  (8'hb4)}))) ?
              $signed(wire8[(3'h5):(3'h5)]) : $unsigned((~&reg139[(3'h6):(2'h2)])));
          reg141 <= ($unsigned($signed(((reg147 ?
                  (8'ha3) : reg140) == wire13))) ?
              $unsigned($signed(wire10[(5'h13):(5'h11)])) : (~^{(~(reg147 & (8'hbb)))}));
        end
    end
  assign wire148 = (~&wire10[(5'h12):(1'h0)]);
  assign wire149 = $unsigned($signed(($unsigned($signed(reg67)) ?
                       (wire75[(1'h0):(1'h0)] ?
                           $signed((8'hb1)) : $signed(reg142)) : $unsigned($unsigned(wire75)))));
endmodule

module module78  (y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire83;
  input wire signed [(3'h5):(1'h0)] wire82;
  input wire signed [(5'h10):(1'h0)] wire81;
  input wire [(5'h14):(1'h0)] wire80;
  input wire [(5'h15):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire136;
  wire [(3'h5):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire133;
  wire [(3'h4):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  reg [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire111,
                 wire110,
                 wire85,
                 wire84,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg109,
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
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire84 = {$unsigned((~^(-(wire79 ? wire82 : wire82)))), wire83};
  assign wire85 = ({wire79[(4'he):(3'h4)], $signed(wire84[(3'h7):(1'h1)])} ?
                      (^~($signed(wire81[(4'hc):(3'h7)]) < ((wire81 ?
                          wire81 : wire83) >>> (wire79 | (8'ha6))))) : $unsigned({wire82[(1'h0):(1'h0)],
                          wire84[(3'h7):(3'h7)]}));
  always
    @(posedge clk) begin
      reg86 <= (wire82[(3'h4):(3'h4)] ? (-wire82) : (8'haa));
      reg87 <= $signed(wire84);
      reg88 <= ({{(^$signed(wire79)), $unsigned($unsigned(wire79))}} ?
          $signed(wire80[(1'h1):(1'h1)]) : wire84[(3'h7):(3'h7)]);
      if ((^~($signed(wire80) ? wire82[(2'h2):(1'h1)] : wire79[(1'h0):(1'h0)])))
        begin
          reg89 <= {((wire79[(1'h0):(1'h0)] - wire85) + wire80[(3'h4):(1'h1)])};
          reg90 <= (((reg89[(4'hc):(3'h4)] + wire79) ?
                  wire81[(4'hb):(4'hb)] : {$signed((wire82 ?
                          wire83 : reg87))}) ?
              ((reg87[(3'h4):(2'h3)] - reg88[(4'he):(4'h8)]) ?
                  wire82[(3'h4):(3'h4)] : wire79[(2'h3):(1'h1)]) : wire82[(3'h5):(3'h5)]);
          reg91 <= (|($unsigned($unsigned($signed((8'had)))) ^ $signed($signed($unsigned((8'hba))))));
        end
      else
        begin
          reg89 <= ((wire81 != $unsigned(($signed(wire79) != $signed((8'hbb))))) ?
              $unsigned(reg88) : ((($unsigned(reg91) << (reg88 ?
                      wire84 : reg91)) & $signed((|(8'ha6)))) ?
                  (wire83 ?
                      $signed((wire85 ~^ reg86)) : $unsigned($signed((7'h44)))) : $signed(reg89)));
          if ($unsigned((^(reg89[(4'ha):(4'ha)] >>> $signed((+reg91))))))
            begin
              reg90 <= reg91;
              reg91 <= wire82[(2'h3):(2'h3)];
              reg92 <= $signed(({(~^(^(8'ha8)))} <<< wire82));
              reg93 <= $unsigned($unsigned($unsigned($unsigned(reg90[(3'h6):(1'h1)]))));
            end
          else
            begin
              reg90 <= ((wire81[(4'hf):(3'h4)] <<< wire81[(1'h0):(1'h0)]) ~^ (-(~&(~&reg86))));
              reg91 <= $unsigned($signed($unsigned(reg87)));
              reg92 <= ($signed($signed($unsigned({(8'hb6),
                  reg91}))) < wire85[(2'h3):(1'h0)]);
            end
          if (((reg87 <<< $unsigned((^(~|wire79)))) ?
              (wire82[(1'h1):(1'h1)] ?
                  reg91[(4'ha):(4'ha)] : reg86[(3'h6):(3'h4)]) : (7'h40)))
            begin
              reg94 <= reg93;
              reg95 <= $signed($signed($unsigned(reg89)));
              reg96 <= (8'hba);
              reg97 <= reg93[(2'h3):(1'h1)];
              reg98 <= {$unsigned($signed(((!wire80) < $unsigned(reg94))))};
            end
          else
            begin
              reg94 <= ($unsigned($unsigned((((8'hb5) ? wire80 : reg97) ?
                  (+(8'haf)) : reg98))) < $signed($unsigned((8'h9e))));
            end
          if ($unsigned(reg96[(2'h3):(1'h0)]))
            begin
              reg99 <= reg97[(3'h4):(2'h2)];
              reg100 <= {(8'hbb)};
              reg101 <= (reg95[(4'hc):(3'h6)] ?
                  wire81 : {(({reg89} ?
                              reg88[(3'h5):(1'h1)] : (reg86 <<< (8'hb9))) ?
                          (~(reg99 == reg92)) : $unsigned((|reg86))),
                      (reg94 * $signed(wire84[(2'h2):(1'h0)]))});
              reg102 <= $unsigned({wire85,
                  ((8'hb6) ?
                      ((&(8'hbf)) ?
                          $unsigned(reg86) : $signed(wire81)) : ($unsigned(wire79) > (&reg94)))});
            end
          else
            begin
              reg99 <= $unsigned(wire83);
              reg100 <= reg102[(4'ha):(4'h8)];
              reg101 <= ({reg100, $signed(reg94[(1'h1):(1'h1)])} ?
                  reg95 : wire80[(2'h2):(1'h0)]);
            end
        end
      if ($unsigned({$signed(($unsigned(wire84) && wire85[(3'h6):(2'h2)]))}))
        begin
          reg103 <= $unsigned((&$signed(((wire85 | reg102) ? wire82 : reg89))));
          if ({reg97})
            begin
              reg104 <= $unsigned((reg102 <<< {reg88[(4'h8):(1'h1)], {reg91}}));
              reg105 <= $signed((reg100[(5'h10):(3'h6)] != ((reg89[(4'h8):(3'h6)] ?
                  (~reg86) : $unsigned((8'haa))) * reg94)));
              reg106 <= (reg103 << (|$signed(wire83[(3'h6):(1'h1)])));
              reg107 <= ($unsigned((+reg99)) ?
                  reg96[(1'h0):(1'h0)] : (+(+$unsigned((^(8'ha0))))));
              reg108 <= ($unsigned((+reg86[(2'h3):(2'h2)])) ?
                  $signed($signed(reg90)) : $signed((^reg98)));
            end
          else
            begin
              reg104 <= $unsigned(wire82[(2'h3):(2'h2)]);
              reg105 <= (($unsigned((wire85[(2'h2):(1'h1)] ?
                          {reg94} : $unsigned(reg98))) ?
                      {reg98[(1'h1):(1'h0)],
                          ((wire79 & reg106) < reg108[(3'h7):(2'h3)])} : ($signed(((8'hb5) << reg101)) && (^~(wire84 ?
                          (8'ha9) : reg108)))) ?
                  reg89 : $signed(wire80));
            end
          reg109 <= ($signed(((!(reg86 ? reg93 : reg101)) << ({reg104} ?
              (wire81 && reg102) : $signed(reg102)))) && $unsigned((reg102[(4'h8):(4'h8)] ?
              $unsigned((8'h9f)) : $signed(((8'hb6) == reg94)))));
        end
      else
        begin
          reg103 <= ((~^reg106) | (reg100 * (reg87[(4'hb):(4'h9)] ?
              ($signed(reg92) + (wire83 + (8'had))) : (((8'hbc) ?
                  reg90 : reg103) ~^ (reg86 != wire82)))));
          reg104 <= $unsigned((8'hb3));
          reg105 <= ((wire83[(1'h1):(1'h1)] >>> ($unsigned((reg98 ?
                      reg105 : reg100)) ?
                  {(8'ha6), $signed(reg88)} : wire84[(3'h6):(3'h6)])) ?
              (!(&($unsigned(reg86) + {reg106}))) : ({$unsigned((reg105 + reg107)),
                      (+$unsigned((8'ha2)))} ?
                  wire83 : (reg91[(4'h9):(3'h4)] ?
                      $signed((reg107 <<< reg95)) : {reg100[(3'h6):(3'h6)]})));
          reg106 <= reg107;
          reg107 <= reg106[(3'h7):(3'h5)];
        end
    end
  assign wire110 = wire81[(2'h3):(1'h0)];
  assign wire111 = $unsigned(reg103);
  always
    @(posedge clk) begin
      reg112 <= (wire83 ? $unsigned(reg95) : $unsigned(wire84[(3'h7):(3'h7)]));
      reg113 <= ((~(+((reg89 - reg102) ?
          (reg106 && reg93) : reg86))) * wire110);
      reg114 <= (((7'h42) == reg109) ?
          $unsigned(((|(^reg100)) ?
              $signed((8'hbb)) : ($unsigned(reg90) ?
                  reg96 : {wire85}))) : reg95);
      reg115 <= reg86;
    end
  assign wire116 = {{reg92[(2'h2):(1'h1)],
                           $unsigned($signed($unsigned(reg115)))},
                       wire81[(3'h4):(3'h4)]};
  assign wire117 = reg89[(4'h9):(4'h8)];
  assign wire118 = ((wire85[(2'h2):(1'h1)] ?
                       (^$signed((~reg93))) : (|reg103)) <<< wire84);
  assign wire119 = reg104[(5'h13):(1'h0)];
  always
    @(posedge clk) begin
      reg120 <= ((~reg86) <<< $signed((+reg113[(4'hb):(2'h2)])));
      reg121 <= reg87;
      reg122 <= ($unsigned(((^(^reg112)) ?
          reg96[(1'h0):(1'h0)] : (-$unsigned(wire118)))) <<< $signed($signed($signed((&reg93)))));
      reg123 <= reg96[(1'h0):(1'h0)];
      reg124 <= ({(wire83[(2'h2):(2'h2)] ?
              (reg121 > $unsigned(reg95)) : (~(reg109 ? reg89 : reg101))),
          (reg92 ?
              $signed((wire118 & wire118)) : reg98)} > (reg89 != (wire119[(3'h7):(1'h0)] ?
          $unsigned((~&reg96)) : (+wire116[(1'h1):(1'h0)]))));
    end
  assign wire125 = reg90;
  assign wire126 = $unsigned((~reg109[(1'h0):(1'h0)]));
  assign wire127 = reg90;
  assign wire128 = reg97[(1'h1):(1'h1)];
  assign wire129 = (|((reg91[(2'h3):(1'h0)] ?
                           (!{wire117, reg123}) : (((8'haa) ?
                                   reg104 : (8'ha8)) ?
                               $signed(reg112) : $signed((8'hbf)))) ?
                       wire110[(4'h9):(4'h8)] : $signed(wire119[(2'h2):(1'h0)])));
  assign wire130 = (8'hb2);
  assign wire131 = $unsigned($unsigned((wire117 * reg122)));
  assign wire132 = ({((~|{reg108, reg97}) - reg122[(1'h1):(1'h0)])} ?
                       $signed($unsigned($signed(reg113[(4'h8):(2'h2)]))) : (~($unsigned(wire110[(3'h6):(1'h0)]) & reg105[(3'h7):(1'h0)])));
  assign wire133 = {wire130, wire116};
  assign wire134 = $signed((wire126 && reg108));
  assign wire135 = $unsigned(reg115);
  assign wire136 = ($signed(reg98) ? (8'hb9) : (&(8'hbd)));
endmodule

module module15
#(parameter param55 = (8'ha6), 
parameter param56 = param55)
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  assign y = {wire54,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
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
                 (1'h0)};
  assign wire20 = wire17;
  assign wire21 = ($unsigned({$signed(((8'haf) ?
                          wire17 : wire20))}) | $unsigned((&(wire16 ^ wire18[(3'h7):(2'h3)]))));
  assign wire22 = $signed({($signed(wire19) ?
                          $signed(wire18[(4'hd):(3'h7)]) : $signed($signed(wire19))),
                      wire16});
  assign wire23 = wire22;
  assign wire24 = {(-(wire16 ?
                          ($signed(wire21) - wire21) : $signed(((8'hb7) ?
                              wire20 : wire21))))};
  assign wire25 = $signed(wire21);
  assign wire26 = $signed($signed($signed(wire20)));
  assign wire27 = wire19[(4'ha):(3'h7)];
  assign wire28 = (wire20[(2'h3):(1'h0)] ?
                      {(wire18[(4'h8):(3'h4)] ?
                              $signed((wire18 + wire16)) : wire19[(4'h8):(4'h8)]),
                          wire23} : (wire23 >= ((~^wire18[(4'hc):(4'h9)]) ?
                          {wire16[(2'h2):(1'h0)],
                              wire21[(3'h5):(1'h1)]} : {$signed(wire22),
                              $signed(wire20)})));
  assign wire29 = (8'hbc);
  always
    @(posedge clk) begin
      if ({((~&(~&(~|wire26))) | wire26), (-wire17[(2'h3):(2'h2)])})
        begin
          reg30 <= ({$signed((((8'hb2) * wire27) ?
                  $signed(wire28) : ((8'hb1) ? (7'h40) : wire26))),
              $signed(wire26[(2'h2):(1'h1)])} >>> $unsigned(wire17[(1'h1):(1'h0)]));
          reg31 <= $signed($signed(((8'hbd) <<< wire27[(4'hc):(4'ha)])));
          reg32 <= (|wire28);
          if ($unsigned(wire16))
            begin
              reg33 <= (wire17 >> ((((~|wire29) < wire17) >>> {wire27}) ?
                  ((8'hb5) ?
                      $unsigned((wire29 == (8'hb9))) : $signed(wire17[(2'h3):(2'h2)])) : {(~$signed((8'h9c))),
                      ((|reg32) ?
                          $unsigned(wire27) : (wire18 ? wire25 : wire24))}));
              reg34 <= {{$signed($signed(wire21)), wire25}};
              reg35 <= ({wire26, $signed(wire26[(2'h2):(1'h0)])} ?
                  $signed(wire23) : (wire21 | ($signed($unsigned(wire23)) ~^ ($signed(reg33) ^~ $unsigned((8'ha0))))));
            end
          else
            begin
              reg33 <= ((!$signed((&$unsigned(reg34)))) ?
                  {$unsigned(reg35[(1'h1):(1'h1)]),
                      $unsigned($signed($unsigned(reg34)))} : $unsigned($unsigned(wire21[(3'h6):(1'h1)])));
              reg34 <= wire21[(4'ha):(1'h1)];
              reg35 <= ($signed(reg35) <= (|wire17[(1'h0):(1'h0)]));
              reg36 <= wire20[(2'h2):(1'h0)];
            end
          reg37 <= reg35[(5'h11):(3'h6)];
        end
      else
        begin
          reg30 <= ($signed($unsigned(wire19)) ?
              (!reg37[(1'h1):(1'h1)]) : ({((reg37 - (7'h42)) ?
                      $signed(wire20) : wire21),
                  $signed(wire24)} * $unsigned(reg37[(2'h3):(1'h0)])));
          if ((^(7'h41)))
            begin
              reg31 <= $unsigned((($signed((wire28 | reg31)) ?
                  ($signed(reg37) ?
                      wire20[(2'h3):(1'h0)] : (^wire29)) : $signed(reg34)) ~^ wire19));
              reg32 <= wire26[(2'h2):(2'h2)];
              reg33 <= wire18[(2'h3):(2'h2)];
              reg34 <= (wire22[(4'ha):(2'h3)] ?
                  $signed($signed((reg34[(1'h1):(1'h1)] ?
                      $signed((8'haf)) : reg32[(2'h2):(1'h0)]))) : $signed((~&(wire23[(1'h1):(1'h0)] ?
                      (wire18 ? wire22 : wire22) : (^~wire19)))));
            end
          else
            begin
              reg31 <= reg34[(4'hc):(3'h4)];
              reg32 <= (reg31[(3'h7):(3'h6)] ?
                  $signed(($unsigned($signed(wire19)) >> wire17[(1'h1):(1'h0)])) : (($signed({reg32}) & $unsigned($signed((8'ha3)))) ^~ wire17));
              reg33 <= ((((wire28[(5'h10):(4'he)] ?
                              (wire24 << wire23) : $unsigned(reg34)) ?
                          $unsigned(wire23) : (^(^~(8'ha3)))) ?
                      ((((8'hb4) ? reg34 : (8'hac)) ? reg31 : (8'ha3)) ?
                          $unsigned((wire26 < wire20)) : wire23[(1'h0):(1'h0)]) : $unsigned((~^(wire25 ?
                          reg35 : wire21)))) ?
                  (wire19 > $unsigned(((~^wire20) ?
                      {wire22} : (^~reg33)))) : $signed($unsigned(wire18)));
              reg34 <= (|$signed($signed(reg34)));
              reg35 <= $unsigned((($signed($unsigned(reg32)) > wire26) + (-{(8'h9d)})));
            end
          if ($signed($signed(((reg36[(3'h5):(3'h4)] | $unsigned(reg31)) ^~ $signed(wire24[(4'h8):(3'h6)])))))
            begin
              reg36 <= wire29[(1'h0):(1'h0)];
            end
          else
            begin
              reg36 <= reg36;
              reg37 <= (-$unsigned((8'ha2)));
            end
        end
      if ($signed((&(&(&(~&(8'hbe)))))))
        begin
          reg38 <= $signed(wire28);
          reg39 <= wire16;
          reg40 <= ($unsigned(wire24) ?
              (({(reg39 <<< reg38)} != (~&((8'ha8) ?
                  reg35 : reg39))) <= $unsigned(wire28[(3'h6):(2'h3)])) : {($unsigned(wire29[(1'h1):(1'h1)]) ?
                      wire18 : $unsigned($signed(wire25))),
                  reg39});
          reg41 <= $unsigned($unsigned(reg38));
          if (($unsigned(wire24) ?
              $unsigned(reg40[(4'hd):(4'hd)]) : reg35[(1'h1):(1'h0)]))
            begin
              reg42 <= ($signed($unsigned(((reg35 ? wire28 : reg38) ?
                  {reg33} : (&wire18)))) != reg30[(3'h7):(3'h5)]);
              reg43 <= wire22[(4'he):(3'h5)];
              reg44 <= $unsigned(reg34[(1'h1):(1'h0)]);
              reg45 <= ($signed((((reg37 ? reg30 : (8'hae)) ?
                      (reg38 & reg38) : (wire19 < reg37)) > reg43)) ?
                  ($signed((+(reg31 != reg39))) ^~ {reg42[(3'h6):(1'h1)]}) : wire21[(5'h12):(5'h11)]);
              reg46 <= reg44;
            end
          else
            begin
              reg42 <= (({reg44,
                          ((wire25 ? reg42 : wire18) ?
                              wire28[(1'h1):(1'h0)] : wire24)} ?
                      ($unsigned((wire28 ? wire20 : (8'ha6))) ?
                          wire16[(4'h8):(3'h4)] : wire24[(3'h7):(3'h6)]) : (!wire27)) ?
                  (~&$unsigned((-reg35))) : ($signed((~&reg39)) ?
                      $signed(reg42) : $signed(wire16[(3'h7):(2'h2)])));
            end
        end
      else
        begin
          reg38 <= $unsigned(wire24);
          reg39 <= (~|$signed((^$unsigned((wire16 <<< wire23)))));
          reg40 <= ($signed({reg46[(2'h3):(1'h1)],
              {reg41, (reg44 ^~ (8'ha8))}}) & (~reg32[(1'h0):(1'h0)]));
        end
      if ((reg45[(3'h7):(2'h2)] ? $unsigned(wire17) : reg39))
        begin
          if ({reg30})
            begin
              reg47 <= $signed({($signed($unsigned(reg33)) ?
                      (8'hb2) : (reg38[(3'h4):(2'h2)] ?
                          $unsigned(reg34) : $signed((8'hbd)))),
                  $unsigned($unsigned((~(8'haa))))});
              reg48 <= $signed($unsigned(((reg34 ? (!reg47) : reg35) ?
                  wire18 : reg33)));
              reg49 <= reg48;
            end
          else
            begin
              reg47 <= reg42[(2'h3):(2'h3)];
              reg48 <= (wire25[(5'h10):(2'h3)] > reg36);
              reg49 <= (^(&{({wire24} ? (~|reg31) : (reg36 ? reg46 : reg33)),
                  ($signed((8'ha7)) >> $signed(wire21))}));
              reg50 <= (~^wire18[(4'ha):(3'h6)]);
              reg51 <= (-$signed(wire18));
            end
          reg52 <= $signed(((reg51[(4'hb):(1'h1)] ?
              ($signed(wire16) == $signed((8'ha0))) : reg41) ^~ $signed(reg49)));
          reg53 <= $signed(($signed(wire24[(3'h6):(1'h1)]) >>> $unsigned($signed((~|reg40)))));
        end
      else
        begin
          reg47 <= ((reg45[(2'h2):(1'h1)] ?
              $unsigned(wire18[(4'h9):(3'h5)]) : (~$signed((~reg37)))) > (&$unsigned(reg36[(2'h2):(1'h1)])));
          reg48 <= (8'ha7);
        end
    end
  assign wire54 = $signed(((~^reg51[(4'h8):(3'h5)]) ?
                      (-(+(reg30 ? (7'h44) : wire21))) : reg41[(2'h3):(1'h0)]));
endmodule
