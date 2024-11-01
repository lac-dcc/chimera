module top
#(parameter param196 = (((!({(8'hb1)} == (^~(8'haf)))) ? {(~|((7'h40) + (7'h41))), {{(8'ha6), (7'h43)}, (&(8'hac))}} : (^~({(8'ha7)} ? ((8'ha0) | (8'hab)) : ((8'hbc) ? (8'hbd) : (8'hbd))))) != (!(~&{((8'haa) ^~ (8'hba))}))), 
parameter param197 = (((((param196 > (8'ha1)) ? (&param196) : (param196 >>> param196)) ? (param196 ? {param196, param196} : (~&param196)) : (param196 ^~ (^param196))) ? {(((8'ha9) << param196) - param196)} : ((((8'hac) ? param196 : param196) <<< (param196 > param196)) ? ((^param196) != param196) : (~(param196 ? param196 : param196)))) < ((param196 ? ((~&param196) ? (^~(8'haa)) : {param196, param196}) : (8'hb4)) && {param196, param196})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire195;
  wire [(2'h3):(1'h0)] wire194;
  wire [(3'h7):(1'h0)] wire174;
  wire [(3'h7):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg193 = (1'h0);
  reg [(3'h7):(1'h0)] reg192 = (1'h0);
  reg [(2'h3):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg190 = (1'h0);
  reg [(5'h10):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(5'h10):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg [(4'h8):(1'h0)] reg181 = (1'h0);
  reg [(4'h9):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire174,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg6,
                 (1'h0)};
  assign wire5 = {$signed(((+(&wire1)) & wire0[(2'h2):(1'h1)])),
                     ($unsigned({(wire0 & wire3),
                         wire2[(3'h4):(2'h3)]}) && (-$unsigned(wire1[(3'h7):(2'h3)])))};
  always
    @(posedge clk) begin
      reg6 <= wire1[(4'hf):(4'hb)];
    end
  assign wire7 = ($unsigned((((8'hbb) <= $signed((8'hbf))) ?
                         $unsigned({wire1,
                             wire5}) : $signed($unsigned(wire3)))) ?
                     wire3[(2'h3):(1'h0)] : (~^(wire2 ~^ wire2[(2'h3):(1'h1)])));
  assign wire8 = (!reg6);
  assign wire9 = $unsigned(wire5);
  assign wire10 = (8'ha4);
  module11 #() modinst175 (.y(wire174), .wire12(wire5), .clk(clk), .wire15(wire8), .wire14(wire7), .wire13(wire10));
  always
    @(posedge clk) begin
      if ((-$signed((((wire3 ? wire7 : wire4) ?
              wire5[(4'ha):(4'h8)] : wire3[(1'h1):(1'h0)]) ?
          (wire8[(3'h7):(2'h2)] * {wire0, (8'ha1)}) : {(wire8 ^~ wire10)}))))
        begin
          reg176 <= $signed((({wire1} ?
              (-((8'haa) ^~ wire174)) : ((+wire5) ?
                  wire3[(2'h3):(1'h0)] : $unsigned(wire174))) >> {$signed($signed(wire174))}));
        end
      else
        begin
          if (((7'h40) >> {$signed($signed((8'h9d))), wire174[(1'h0):(1'h0)]}))
            begin
              reg176 <= wire174[(1'h1):(1'h1)];
              reg177 <= wire174;
              reg178 <= {(~^wire8[(2'h2):(1'h1)])};
              reg179 <= {$unsigned($unsigned((+$signed(wire2)))),
                  wire0[(3'h7):(1'h1)]};
            end
          else
            begin
              reg176 <= (8'hb7);
              reg177 <= reg178;
              reg178 <= $signed($unsigned(wire8));
              reg179 <= ($unsigned($signed(wire5[(1'h1):(1'h1)])) & (^(|reg178[(5'h10):(4'hc)])));
              reg180 <= wire4;
            end
          reg181 <= $signed({$signed({(&wire8)}), $unsigned(wire9)});
          if ((^reg177[(2'h3):(1'h0)]))
            begin
              reg182 <= (&(~|(wire9 | ((wire0 ?
                  reg179 : wire2) >>> (wire174 == wire4)))));
            end
          else
            begin
              reg182 <= (~^($signed((~reg177)) <= wire4[(1'h1):(1'h1)]));
              reg183 <= wire1[(3'h5):(1'h0)];
              reg184 <= reg179;
              reg185 <= $unsigned(({$unsigned((~wire4)),
                  {wire2[(2'h2):(1'h1)]}} < wire5));
            end
        end
      reg186 <= $unsigned((({$unsigned(reg177),
          (!reg185)} ^~ ($unsigned(wire0) ?
          (wire174 ^~ reg184) : wire10[(3'h5):(3'h5)])) >>> $unsigned($unsigned((wire7 ?
          wire9 : wire10)))));
      if ($signed((^($unsigned((wire2 < wire9)) >= $signed((|reg176))))))
        begin
          if ($unsigned(((((+wire2) * (reg178 >= wire2)) ?
                  (~^{wire0}) : wire3[(1'h0):(1'h0)]) ?
              reg176[(1'h0):(1'h0)] : (8'hb8))))
            begin
              reg187 <= (8'hae);
            end
          else
            begin
              reg187 <= {wire0[(3'h7):(3'h4)],
                  (~&$unsigned({{(8'hb8), reg187}, $signed(reg177)}))};
              reg188 <= $signed({($signed(reg176[(1'h1):(1'h0)]) ?
                      reg183 : wire4)});
            end
          if (reg181)
            begin
              reg189 <= $signed($unsigned((wire9 > reg185[(1'h0):(1'h0)])));
              reg190 <= (~|reg186);
              reg191 <= wire10[(1'h1):(1'h0)];
              reg192 <= (reg186[(1'h1):(1'h0)] ?
                  (~^wire174) : ($signed($signed($unsigned(reg187))) <<< ((&(~|reg184)) | reg189[(3'h7):(3'h7)])));
              reg193 <= ((wire5[(2'h3):(2'h3)] <<< reg181[(2'h3):(2'h3)]) ?
                  ({reg191} ?
                      reg188[(3'h4):(1'h0)] : reg191) : (reg191[(1'h1):(1'h0)] ?
                      reg183[(1'h0):(1'h0)] : reg190));
            end
          else
            begin
              reg189 <= ($unsigned(reg186) ?
                  $signed((($unsigned(wire3) ?
                      $signed(reg180) : $unsigned(reg180)) == ((reg179 * reg183) > $signed(reg176)))) : (8'haf));
              reg190 <= reg192;
              reg191 <= ($unsigned((((^(8'hb5)) << wire8[(4'hc):(4'h8)]) <= {reg176,
                  (wire174 + reg183)})) + (((reg186[(3'h6):(2'h2)] ?
                          (!reg178) : $signed(wire1)) ?
                      $unsigned(wire1) : (reg185 ? {wire0} : (8'hbc))) ?
                  (reg190[(5'h11):(3'h5)] ?
                      $unsigned(reg192) : (~^(reg182 && reg180))) : $unsigned($unsigned((reg178 ?
                      reg181 : wire174)))));
              reg192 <= ($unsigned(wire174[(2'h3):(2'h3)]) ?
                  (~wire2[(1'h1):(1'h1)]) : ((8'hba) ?
                      (~((~|reg189) == (wire1 && (8'hb9)))) : wire0[(4'h9):(2'h3)]));
            end
        end
      else
        begin
          reg187 <= {(wire9 ?
                  {$unsigned(reg183)} : $signed(((wire10 ?
                      reg189 : (8'hbe)) >> {wire7, wire0})))};
          reg188 <= $signed((reg188[(3'h7):(2'h2)] ?
              wire1[(4'h8):(3'h7)] : {wire3, {reg181, reg192}}));
        end
    end
  assign wire194 = wire9[(3'h4):(3'h4)];
  assign wire195 = wire3;
endmodule

module module11
#(parameter param172 = (&({(+((7'h43) >= (8'hbb)))} || ((((8'hae) != (8'had)) ? ((7'h42) >= (8'hbd)) : {(8'hbd)}) ? {((8'ha0) ? (8'ha1) : (8'ha4)), (~&(8'hab))} : ((7'h42) ? (~&(8'hb1)) : ((8'ha8) - (8'h9d)))))), 
parameter param173 = (~({(param172 ? (param172 - param172) : param172)} == (8'h9d))))
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h27b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire171;
  wire signed [(5'h14):(1'h0)] wire170;
  wire [(5'h12):(1'h0)] wire169;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire75;
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(3'h6):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(4'h9):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire158,
                 wire157,
                 wire155,
                 wire131,
                 wire113,
                 wire77,
                 wire41,
                 wire75,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
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
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 (1'h0)};
  module16 #() modinst42 (wire41, clk, wire14, wire12, wire15, wire13, (8'ha3));
  module43 #() modinst76 (wire75, clk, wire12, wire13, wire41, wire14, wire15);
  assign wire77 = $signed(($signed($signed((wire12 && wire12))) ?
                      wire14 : {$unsigned($signed(wire12)),
                          $unsigned($unsigned(wire14))}));
  always
    @(posedge clk) begin
      if ($signed((wire41[(3'h7):(3'h4)] - (~wire75))))
        begin
          reg78 <= ($signed($unsigned($unsigned((wire75 ? wire14 : wire12)))) ?
              ((~($unsigned((8'ha6)) ?
                  wire13 : wire15)) >= $unsigned(wire77[(4'hd):(4'h8)])) : wire77);
          reg79 <= {(wire41[(4'hd):(4'ha)] ?
                  (((&wire15) ? wire12 : wire75) ?
                      ((wire75 ? wire15 : (8'haf)) ?
                          {(8'h9f)} : reg78[(4'hb):(1'h0)]) : wire13) : wire12[(3'h4):(2'h2)]),
              $unsigned(($signed((reg78 ? wire12 : wire77)) ?
                  (|((8'hb5) ? wire75 : wire75)) : $signed((-wire75))))};
        end
      else
        begin
          reg78 <= $signed(wire12[(3'h7):(3'h4)]);
          if (((wire13 ?
              $unsigned(wire13) : wire41) << $signed($signed(((reg79 ~^ reg78) ?
              wire12[(4'ha):(2'h2)] : (-wire13))))))
            begin
              reg79 <= wire13[(3'h7):(1'h1)];
              reg80 <= wire41[(4'hd):(4'h8)];
              reg81 <= (wire13[(2'h3):(2'h3)] ?
                  (&$signed($unsigned($unsigned(wire14)))) : wire14);
              reg82 <= $unsigned($unsigned((-reg78)));
            end
          else
            begin
              reg79 <= reg81[(4'ha):(3'h7)];
              reg80 <= $unsigned({wire12});
            end
          if ($unsigned(reg81[(3'h7):(2'h3)]))
            begin
              reg83 <= (7'h42);
            end
          else
            begin
              reg83 <= $unsigned($signed($signed($signed(wire41[(2'h3):(2'h3)]))));
              reg84 <= $signed($unsigned(reg82[(1'h1):(1'h1)]));
              reg85 <= (-{{wire15[(3'h7):(3'h5)],
                      ((reg83 ? wire14 : wire75) ?
                          $signed(wire12) : $unsigned(wire15))}});
              reg86 <= (+$unsigned($signed((!{reg85}))));
              reg87 <= (~$unsigned(reg82[(3'h5):(1'h0)]));
            end
          reg88 <= $unsigned((~^(~({wire77} - (wire41 > reg79)))));
          reg89 <= $unsigned(reg88);
        end
    end
  always
    @(posedge clk) begin
      reg90 <= $unsigned(((($unsigned(wire12) >> (-reg83)) & reg82[(3'h7):(1'h0)]) <<< ((((8'hbc) ?
              (8'hb8) : reg83) != wire41) ?
          {$signed(reg81)} : (+wire75[(4'h8):(3'h4)]))));
    end
  module91 #() modinst114 (.wire95(reg84), .wire92(reg86), .wire93(reg82), .y(wire113), .wire94(reg79), .clk(clk), .wire96(reg88));
  always
    @(posedge clk) begin
      if ($signed({(({wire113} <= (reg82 << reg83)) - $unsigned({reg81})),
          ((+(~^wire75)) ? reg86[(2'h3):(1'h1)] : wire113[(2'h2):(1'h1)])}))
        begin
          reg115 <= (reg83[(3'h5):(3'h5)] || $unsigned(((&(wire75 ~^ reg78)) >>> wire41[(3'h7):(1'h1)])));
          reg116 <= wire12[(3'h4):(1'h0)];
          reg117 <= ($unsigned(((wire77[(1'h0):(1'h0)] >= ((7'h42) && reg115)) < {wire41,
                  $unsigned((8'hab))})) ?
              reg87[(4'h9):(3'h6)] : wire12);
          if (reg80[(2'h2):(1'h0)])
            begin
              reg118 <= $unsigned((reg83 ?
                  $unsigned($unsigned((&wire75))) : $unsigned({(!wire14)})));
              reg119 <= $unsigned(($signed(wire12[(4'hd):(1'h1)]) >>> ((reg118 == reg89) & {(reg117 ?
                      reg85 : reg116),
                  (|reg89)})));
              reg120 <= (($unsigned((!(~reg84))) ?
                  {$unsigned((~&reg88)),
                      reg82[(4'he):(1'h1)]} : (($unsigned(wire15) ?
                      wire14 : {reg87}) * (~&(^~(8'had))))) | ((($unsigned(wire15) ?
                      reg118[(1'h0):(1'h0)] : (+(8'hbd))) && reg80[(1'h0):(1'h0)]) ?
                  (((^reg81) ? reg119[(2'h2):(1'h0)] : {reg78}) ?
                      $signed(((8'ha2) ?
                          reg117 : reg88)) : $signed($signed(wire41))) : reg89[(1'h0):(1'h0)]));
              reg121 <= wire14[(3'h5):(2'h2)];
            end
          else
            begin
              reg118 <= (reg86 & reg118);
              reg119 <= $unsigned(wire12[(3'h4):(3'h4)]);
              reg120 <= $signed(($unsigned($signed((reg84 != reg116))) >> (|(|wire77))));
              reg121 <= $signed($signed((+reg117)));
              reg122 <= $unsigned(reg119);
            end
          if ((^({$unsigned($signed(reg86)),
              $unsigned(reg117)} != $unsigned($signed((-reg80))))))
            begin
              reg123 <= $signed(wire77[(4'hd):(4'h9)]);
              reg124 <= (|(&$unsigned(reg86)));
              reg125 <= ({$signed({(reg80 >>> reg79)})} ?
                  $signed((wire12[(4'hd):(4'ha)] ?
                      {(|reg122)} : $unsigned((|wire12)))) : reg88);
              reg126 <= reg80[(2'h2):(1'h0)];
              reg127 <= (((8'ha9) ?
                  ($signed((reg88 + reg84)) & $unsigned((&reg119))) : reg90) << {(-($signed((8'hb6)) ?
                      $unsigned(wire15) : $signed(reg124)))});
            end
          else
            begin
              reg123 <= (reg117[(2'h2):(2'h2)] <<< reg119);
              reg124 <= $unsigned(((reg126 | (!(8'hb3))) ?
                  (~(reg79 ?
                      $signed(reg124) : $signed((8'hb5)))) : ((~&((8'hb8) + reg79)) ?
                      $signed($signed(reg122)) : reg82)));
              reg125 <= (((({wire13} ?
                      (&(8'hab)) : (wire13 ? reg88 : reg120)) || (((8'hb8) ?
                          reg115 : reg125) ?
                      $signed(reg123) : (^~reg78))) ?
                  wire13[(3'h4):(2'h3)] : ($signed(reg119[(3'h7):(1'h1)]) ?
                      (+$unsigned(reg115)) : $unsigned(reg83[(2'h3):(2'h2)]))) ^~ ((((reg116 >= reg87) | reg85) != $signed(reg81)) ?
                  ({(reg85 ? reg120 : reg85),
                      (8'hb9)} & reg116[(3'h5):(1'h0)]) : ($signed($unsigned(reg80)) ?
                      $signed(((8'hbe) ?
                          reg115 : (8'hb2))) : reg120[(2'h3):(2'h2)])));
            end
        end
      else
        begin
          reg115 <= (reg86[(2'h2):(2'h2)] <= ((((~&reg122) ?
                  (wire41 * (8'haa)) : (reg84 <= wire113)) != $signed((reg89 > reg122))) ?
              $unsigned(reg121) : reg90));
          reg116 <= (8'ha7);
          reg117 <= (-($signed(wire12) || wire75));
        end
      reg128 <= $signed(reg90[(5'h10):(2'h2)]);
      reg129 <= (-((~^(+{reg85, reg128})) ?
          wire41 : ($unsigned((|reg126)) >= (8'haf))));
      reg130 <= (8'hba);
    end
  assign wire131 = ((reg128 << reg127) ?
                       (^{(~^(^~wire41)),
                           $signed((7'h43))}) : $unsigned($unsigned(reg130[(4'h8):(1'h1)])));
  module132 #() modinst156 (wire155, clk, wire131, reg121, wire41, reg123, reg122);
  assign wire157 = {reg117[(4'h8):(3'h4)],
                       $unsigned(((|(&reg80)) ?
                           $signed($unsigned(reg90)) : reg86[(4'hb):(2'h2)]))};
  assign wire158 = wire12;
  always
    @(posedge clk) begin
      if ((8'hbe))
        begin
          if (reg82[(4'hb):(3'h7)])
            begin
              reg159 <= (^~(reg86 & (~^(wire75 ?
                  {(8'hae), wire12} : reg82[(4'h8):(3'h7)]))));
              reg160 <= $signed(reg118);
              reg161 <= {$signed(($unsigned((reg128 << reg119)) >>> (&(~^reg78))))};
            end
          else
            begin
              reg159 <= (($unsigned((8'h9d)) <<< $unsigned((reg117 > $unsigned(reg129)))) << (8'hbd));
              reg160 <= reg124[(4'hb):(1'h0)];
              reg161 <= reg126;
              reg162 <= $unsigned((&(reg90 >> {$signed(reg83),
                  $unsigned(reg90)})));
            end
          reg163 <= reg117;
          reg164 <= $unsigned(reg83[(3'h4):(1'h0)]);
        end
      else
        begin
          reg159 <= (reg79 ?
              (^~(+$signed($unsigned((8'hb6))))) : ($signed({$unsigned(wire113),
                  (reg122 ? reg85 : reg90)}) <<< (~|$unsigned(reg78))));
          reg160 <= $signed(reg124[(4'h8):(4'h8)]);
        end
      if ((+reg160[(5'h12):(4'hf)]))
        begin
          reg165 <= ($unsigned(((reg130 ?
              wire13[(3'h6):(1'h0)] : (reg164 > reg120)) == {(reg78 ?
                  wire131 : reg161)})) < reg160);
          reg166 <= wire155;
          reg167 <= $signed((wire13[(2'h3):(2'h3)] ?
              (((~^reg127) <= reg125[(4'hf):(1'h0)]) || {reg120,
                  $unsigned(reg118)}) : $unsigned(reg84)));
          reg168 <= ((wire157[(5'h14):(1'h1)] || (reg119[(4'h9):(3'h4)] || wire157)) ?
              $unsigned(((7'h42) ?
                  (reg162[(2'h2):(2'h2)] ^~ ((8'hbc) ?
                      reg129 : (8'hbb))) : ($signed((8'hba)) > (reg129 ?
                      (8'hb6) : reg79)))) : $unsigned((8'haf)));
        end
      else
        begin
          reg165 <= (reg84[(4'hf):(1'h0)] | (|wire77[(2'h3):(1'h0)]));
        end
    end
  assign wire169 = ({reg127,
                           $signed(((reg119 << wire113) ?
                               (|reg124) : {reg160}))} ?
                       (-$unsigned($signed((|reg82)))) : wire157);
  assign wire170 = $signed((reg86 ?
                       (!((^reg80) ?
                           $signed(reg88) : reg81[(4'hd):(4'hc)])) : ((~^{reg81,
                               wire41}) ?
                           $unsigned($signed(reg85)) : reg164[(3'h6):(3'h6)])));
  assign wire171 = ({((|reg165) < (-(~^(8'ha1))))} ?
                       $signed($signed($signed($signed(reg129)))) : (^wire41));
endmodule

module module132
#(parameter param154 = (-(((+(+(8'hba))) ? (~&((8'hac) != (7'h43))) : (((8'h9f) || (8'had)) ? ((8'ha4) ? (8'hb0) : (8'hb7)) : ((7'h44) < (8'haf)))) ? ((((8'hbd) ? (8'ha1) : (8'hab)) <<< ((8'hb8) >= (8'h9f))) ? (^((8'hb8) * (8'hb9))) : {(+(8'h9c)), ((8'h9e) >= (8'had))}) : {((~(7'h41)) <<< ((8'ha0) ? (8'hbf) : (8'hb7)))})))
(y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire137;
  input wire signed [(4'ha):(1'h0)] wire136;
  input wire [(5'h10):(1'h0)] wire135;
  input wire signed [(4'hc):(1'h0)] wire134;
  input wire signed [(2'h3):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire153;
  wire [(5'h10):(1'h0)] wire152;
  wire [(5'h14):(1'h0)] wire151;
  wire signed [(3'h5):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire149;
  wire [(3'h6):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire146;
  wire [(4'hf):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire144;
  wire [(4'hf):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire [(2'h3):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire140;
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 reg139,
                 reg138,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg138 <= (8'hb5);
      reg139 <= wire135;
    end
  assign wire140 = (+($signed((~&(~^wire136))) ~^ wire136));
  assign wire141 = $signed(wire140[(2'h3):(2'h3)]);
  assign wire142 = ($signed(((wire134 >= (wire134 ? wire137 : wire133)) ?
                           $signed((~^wire134)) : (~wire135[(4'he):(3'h6)]))) ?
                       $signed(wire135[(4'hd):(1'h0)]) : {(reg139 ?
                               {$unsigned(wire134)} : {$unsigned(wire140)}),
                           (8'hb0)});
  assign wire143 = $signed(wire141[(2'h3):(2'h2)]);
  assign wire144 = ((8'ha5) ? wire141 : $unsigned({(!wire133), wire141}));
  assign wire145 = (~&$unsigned(wire141[(2'h2):(2'h2)]));
  assign wire146 = ($signed((~|($signed((8'hb5)) >= (wire135 <= wire141)))) & (wire145[(2'h2):(1'h1)] >= wire142[(3'h6):(3'h6)]));
  assign wire147 = $unsigned($unsigned(($unsigned(wire137[(3'h7):(1'h1)]) < ((reg138 - wire135) ?
                       $unsigned(reg139) : (wire144 <<< (8'ha5))))));
  assign wire148 = $unsigned(wire137[(2'h2):(1'h1)]);
  assign wire149 = (+$unsigned(((wire142 ? ((8'ha7) != wire142) : reg138) ?
                       wire147[(3'h4):(2'h3)] : wire145)));
  assign wire150 = ((8'ha9) ?
                       $unsigned((+(wire141 ?
                           {wire137} : (wire142 > (8'hb6))))) : $unsigned(wire147[(2'h3):(2'h3)]));
  assign wire151 = wire144;
  assign wire152 = (^~$signed(wire134[(3'h7):(2'h2)]));
  assign wire153 = ((~|(~^wire141)) ^ wire142);
endmodule

module module91
#(parameter param111 = ({{(-((7'h40) ? (8'haf) : (8'hb6)))}, ((((8'ha8) ? (8'h9d) : (8'ha4)) ? ((8'hae) ? (8'ha7) : (8'hbf)) : {(8'ha9), (8'hbc)}) != ((8'hb8) ? (|(7'h43)) : ((8'h9e) << (8'ha1))))} <= {{(((8'ha5) | (8'hb8)) << ((8'ha2) | (8'had)))}, (8'hb9)}), 
parameter param112 = {(((|param111) >>> ((param111 | param111) <<< {param111})) ? param111 : (-({param111, param111} >>> param111))), (((8'ha9) ? {(^~param111)} : (((8'hbb) + param111) && (^param111))) ? {param111, ((-param111) ^ (param111 == param111))} : (~|((param111 ^ param111) + param111)))})
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire96;
  input wire signed [(3'h6):(1'h0)] wire95;
  input wire [(4'hb):(1'h0)] wire94;
  input wire signed [(4'he):(1'h0)] wire93;
  input wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire108;
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire95)
        begin
          reg97 <= wire94;
          reg98 <= (~|wire96);
        end
      else
        begin
          reg97 <= ($unsigned((~&(wire92[(4'h9):(2'h3)] ?
              (wire92 <<< (8'hba)) : (reg97 ?
                  wire95 : wire94)))) < wire96[(1'h0):(1'h0)]);
          if ($unsigned(reg97))
            begin
              reg98 <= {(~^{$unsigned($unsigned(wire93)), (!$signed(reg98))})};
              reg99 <= (~($unsigned(((reg98 * wire95) ?
                  (wire93 || reg97) : $signed(wire92))) > $unsigned(((reg98 ?
                      wire93 : wire92) ?
                  (~reg98) : reg97[(3'h6):(1'h0)]))));
              reg100 <= wire96[(2'h3):(2'h3)];
            end
          else
            begin
              reg98 <= ($unsigned({wire96}) ?
                  reg98 : ((+(reg99 ?
                      {reg98,
                          wire92} : (reg97 <= wire94))) & $unsigned(wire92[(4'ha):(3'h4)])));
              reg99 <= $unsigned({(wire92[(3'h4):(2'h2)] || $signed($signed(wire96))),
                  wire93});
              reg100 <= (($signed(wire96[(3'h7):(2'h3)]) ?
                  (($signed((8'ha7)) ? (~&(8'hbf)) : wire92) ?
                      $signed($signed(wire95)) : $signed(wire94)) : (~(^wire96[(2'h2):(1'h0)]))) || $signed((8'hac)));
            end
        end
      reg101 <= reg97[(3'h7):(2'h3)];
      if ($unsigned({wire93[(1'h0):(1'h0)]}))
        begin
          reg102 <= {wire94[(2'h3):(2'h2)],
              (((~|$signed((8'hac))) > ($unsigned(wire95) & $signed(reg99))) ?
                  $signed($signed(reg98)) : {$signed((reg98 ^ wire92)),
                      (wire96 ? (wire93 > wire96) : (wire94 >= reg101))})};
          reg103 <= reg102[(3'h4):(1'h1)];
          reg104 <= $unsigned(reg100);
          reg105 <= $unsigned(wire95[(2'h3):(2'h3)]);
          reg106 <= $unsigned((wire96 ^~ reg101));
        end
      else
        begin
          reg102 <= $unsigned((~^(~|$signed({reg98}))));
          reg103 <= $signed($signed(reg99[(2'h3):(1'h1)]));
          reg104 <= (8'hbf);
          reg105 <= {({(reg106 > reg99)} ?
                  reg103 : (((reg99 ? wire92 : reg106) ?
                      (reg99 ?
                          reg104 : wire94) : (~&(8'hb0))) << ((~|(8'ha3)) & ((8'ha7) ?
                      reg102 : reg105)))),
              (&(8'ha1))};
        end
      reg107 <= reg97[(4'ha):(2'h3)];
    end
  assign wire108 = $signed($unsigned(({(reg100 ? reg98 : reg100),
                       ((8'ha4) ? wire94 : wire92)} >> reg99[(4'hb):(3'h6)])));
  assign wire109 = (reg99 + wire95[(1'h1):(1'h0)]);
  assign wire110 = $unsigned(wire109);
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire [(3'h7):(1'h0)] wire47;
  input wire signed [(4'hd):(1'h0)] wire46;
  input wire signed [(5'h14):(1'h0)] wire45;
  input wire [(4'hc):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire64,
                 wire63,
                 wire62,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg74,
                 reg67,
                 reg66,
                 reg65,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire49 = ($unsigned($signed(wire48[(1'h1):(1'h1)])) ^~ (|wire47));
  assign wire50 = ($signed($signed($signed($unsigned(wire49)))) >>> {wire44,
                      $unsigned((~(7'h40)))});
  assign wire51 = (wire48[(1'h1):(1'h1)] ?
                      $signed((~|$unsigned((wire45 ?
                          wire45 : wire49)))) : wire48);
  assign wire52 = {wire46,
                      $unsigned((~|($unsigned(wire46) * $signed(wire47))))};
  assign wire53 = $unsigned(((wire45[(4'hb):(3'h6)] ?
                      ((wire46 <= wire52) == ((8'ha5) ?
                          wire50 : wire51)) : wire45) >= $signed(wire51)));
  assign wire54 = {wire44};
  assign wire55 = wire53[(1'h0):(1'h0)];
  assign wire56 = ($unsigned($signed($signed(((8'ha9) ? wire49 : (7'h41))))) ?
                      (8'ha3) : {$unsigned($signed((wire46 ^~ wire47))),
                          ($signed($unsigned(wire50)) >> ($unsigned((7'h42)) ?
                              $unsigned(wire51) : $unsigned(wire55)))});
  always
    @(posedge clk) begin
      reg57 <= ((~|$unsigned((wire45[(2'h3):(2'h3)] ?
              $unsigned(wire46) : {wire51, wire45}))) ?
          $unsigned($unsigned((~^wire45))) : $signed((^~((&wire52) >> (wire55 >> wire47)))));
      reg58 <= ($unsigned((~&wire49[(2'h2):(2'h2)])) | wire56);
      reg59 <= $unsigned(reg58);
      reg60 <= ({(~^wire46[(2'h2):(1'h0)]),
              (&($unsigned(reg58) ? $unsigned(wire56) : wire48))} ?
          (+(($signed(wire51) & wire56) ? wire47 : (&wire53))) : wire45);
      reg61 <= wire45;
    end
  assign wire62 = ((reg60 & (^$unsigned($signed(reg61)))) ^~ wire54[(3'h6):(3'h4)]);
  assign wire63 = wire56;
  assign wire64 = (wire44[(2'h2):(1'h0)] ?
                      (~(+$signed(wire54[(3'h7):(3'h5)]))) : $unsigned((wire50[(4'h9):(3'h6)] | $unsigned(reg60[(4'hc):(3'h6)]))));
  always
    @(posedge clk) begin
      reg65 <= wire49[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ($unsigned((wire44[(4'hb):(3'h7)] >= ($signed((+wire55)) ?
          (&((8'h9c) ? wire53 : reg60)) : (&$signed(wire56))))))
        begin
          if ($signed(wire51[(3'h4):(1'h1)]))
            begin
              reg66 <= ((|wire48[(2'h2):(2'h2)]) << $unsigned($signed($signed((wire64 >>> wire64)))));
            end
          else
            begin
              reg66 <= ($unsigned({(-((8'haa) ? wire48 : wire50))}) ?
                  {$signed(wire50)} : (wire54[(2'h2):(1'h1)] ?
                      (reg59 ?
                          (reg60[(5'h10):(4'h9)] >> $unsigned(wire56)) : (8'ha3)) : ($unsigned(reg57[(3'h6):(3'h5)]) ?
                          $unsigned(((7'h44) >> wire47)) : $signed(wire53))));
            end
        end
      else
        begin
          reg66 <= wire51[(3'h6):(1'h0)];
        end
      reg67 <= ({$unsigned({((8'ha0) >= wire51), reg65[(4'h9):(4'h8)]}),
              $unsigned($unsigned({wire52}))} ?
          ($unsigned(({reg61, wire45} && $unsigned(wire50))) ?
              ({(+(8'ha7))} | wire52) : ((7'h44) * $unsigned($unsigned(reg65)))) : ((wire47[(3'h5):(3'h4)] ?
                  ($signed((8'ha0)) ?
                      reg65 : (^wire55)) : wire45[(1'h0):(1'h0)]) ?
              $unsigned((8'hb8)) : (wire48[(2'h2):(1'h0)] ?
                  ($unsigned(reg57) ?
                      $signed(wire53) : $unsigned((8'hb9))) : $unsigned($signed(wire49)))));
    end
  assign wire68 = $unsigned({$unsigned(wire49)});
  assign wire69 = ((~&$signed($unsigned(wire52[(2'h3):(2'h2)]))) ~^ $signed($unsigned(reg57[(3'h5):(3'h5)])));
  assign wire70 = (~{(wire53 ? (wire55 <= (&wire62)) : $unsigned(wire49)),
                      $signed((!{wire47, reg61}))});
  assign wire71 = $unsigned($unsigned((^~(reg61[(5'h10):(4'ha)] - $signed(wire45)))));
  assign wire72 = wire69[(4'hb):(4'ha)];
  assign wire73 = wire51;
  always
    @(posedge clk) begin
      reg74 <= $signed($signed((((wire68 ?
              wire69 : wire62) ^~ (wire52 <<< reg66)) ?
          reg61 : ((reg61 * reg59) ? (~&wire50) : (wire45 >= (7'h41))))));
    end
endmodule

module module16
#(parameter param39 = ((((^~{(8'hb3), (8'hb3)}) ? ({(7'h41), (7'h43)} ^ ((8'ha0) ~^ (8'hb6))) : (((8'hb4) ? (8'hb3) : (8'hb7)) ? ((8'hac) > (8'hbd)) : {(8'h9d), (8'hbb)})) | (~((8'hb7) > ((8'hbd) || (8'hb0))))) ? ({(((8'ha1) ? (7'h41) : (8'had)) && (-(8'ha0))), (((8'haa) != (8'ha5)) ? ((8'had) == (8'ha2)) : ((8'hb5) ^~ (8'hbe)))} ? {(((8'ha5) >= (8'hbc)) > ((8'ha3) ? (8'ha1) : (8'hb0)))} : ({(&(8'ha9)), (~^(8'hba))} == (|((7'h42) >>> (7'h40))))) : ((((-(8'hb8)) ^ ((8'ha6) * (8'hae))) ? (((8'hbe) ? (8'ha1) : (8'ha7)) ? ((8'hac) * (8'hb7)) : ((8'hb0) < (8'ha8))) : {{(8'h9e), (8'ha1)}, ((8'ha3) | (8'h9f))}) ? (({(8'h9c)} ? ((8'hb1) ? (8'ha8) : (8'haa)) : (~|(8'hae))) ^~ ((!(8'hb0)) > (^~(7'h41)))) : (8'h9c))), 
parameter param40 = (~|(8'h9f)))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire21;
  input wire [(2'h3):(1'h0)] wire20;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg33,
                 reg29,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= wire21[(1'h0):(1'h0)];
    end
  assign wire23 = reg22[(4'hd):(1'h1)];
  assign wire24 = ($unsigned(wire20[(2'h3):(2'h2)]) | $unsigned($signed(wire23[(3'h6):(3'h5)])));
  assign wire25 = wire24[(4'h9):(1'h0)];
  assign wire26 = $signed((wire20[(1'h1):(1'h1)] != (reg22 ~^ ((~|wire20) * $signed(reg22)))));
  assign wire27 = wire25[(1'h0):(1'h0)];
  assign wire28 = (wire17 ?
                      ((8'ha7) ?
                          ($signed($unsigned((8'hb2))) ?
                              (|(wire26 >> reg22)) : ((+wire25) ?
                                  (8'ha8) : wire18)) : $unsigned((~^(wire24 * wire23)))) : wire17[(5'h10):(4'hc)]);
  always
    @(posedge clk) begin
      reg29 <= (^~($unsigned(wire28) ^ $signed(wire24)));
    end
  assign wire30 = (~^$unsigned(wire19));
  assign wire31 = $unsigned($unsigned(wire30));
  assign wire32 = (reg22[(4'h8):(2'h3)] ?
                      (({wire30, $unsigned(wire26)} >>> (^~(wire24 ?
                              reg22 : reg22))) ?
                          ($signed((~wire17)) <= wire31) : $signed(wire25[(2'h3):(1'h0)])) : $unsigned((+$signed(wire28[(4'he):(4'hc)]))));
  always
    @(posedge clk) begin
      reg33 <= $unsigned(((wire23[(4'h8):(1'h0)] ?
              wire17[(3'h7):(2'h2)] : $signed({wire25})) ?
          (-$signed({(8'h9f), wire32})) : ({$signed(wire20)} ?
              ((wire23 <= wire30) ?
                  $signed(wire27) : (wire26 >= wire25)) : wire25[(2'h2):(1'h0)])));
    end
  assign wire34 = wire31;
  assign wire35 = $unsigned(($signed(($unsigned(wire23) ?
                      $unsigned(wire18) : (wire31 ?
                          wire34 : reg29))) < wire31[(3'h5):(3'h4)]));
  assign wire36 = ($unsigned(reg29) - wire28[(4'h9):(3'h7)]);
  assign wire37 = $unsigned(((&$signed(reg22[(3'h7):(1'h1)])) ?
                      $unsigned($unsigned((!wire24))) : (&(&{wire24,
                          wire20}))));
  assign wire38 = wire36;
endmodule
