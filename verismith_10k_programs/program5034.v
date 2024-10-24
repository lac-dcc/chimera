module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h22f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire199;
  wire signed [(4'hc):(1'h0)] wire194;
  wire signed [(4'h9):(1'h0)] wire193;
  wire [(4'hc):(1'h0)] wire174;
  wire [(3'h5):(1'h0)] wire172;
  wire [(3'h4):(1'h0)] wire171;
  wire [(3'h5):(1'h0)] wire166;
  wire [(4'hc):(1'h0)] wire165;
  wire signed [(4'ha):(1'h0)] wire164;
  wire signed [(5'h14):(1'h0)] wire163;
  wire [(4'hd):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire159;
  wire signed [(4'he):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire101;
  reg [(5'h11):(1'h0)] reg201 = (1'h0);
  reg [(2'h3):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg196 = (1'h0);
  reg [(4'h8):(1'h0)] reg195 = (1'h0);
  reg [(5'h10):(1'h0)] reg192 = (1'h0);
  reg [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg189 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(5'h11):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg180 = (1'h0);
  reg [(4'hb):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg170 = (1'h0);
  reg [(5'h14):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg167 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire194,
                 wire193,
                 wire174,
                 wire172,
                 wire171,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire104,
                 wire103,
                 wire101,
                 reg201,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
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
                 reg175,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  module4 #() modinst102 (wire101, clk, wire0, wire3, wire1, wire2, (8'haf));
  assign wire103 = $unsigned($unsigned(wire101[(4'ha):(3'h7)]));
  assign wire104 = wire3;
  module105 #() modinst158 (.wire108(wire104), .y(wire157), .wire106(wire2), .wire107(wire0), .clk(clk), .wire109(wire101));
  assign wire159 = $signed(wire104);
  assign wire160 = $unsigned((wire104 * (($unsigned(wire1) ?
                       (8'hb6) : (+wire1)) ^ (7'h41))));
  module11 #() modinst162 (.wire14(wire0), .wire12(wire1), .y(wire161), .wire13(wire101), .clk(clk), .wire15(wire3));
  assign wire163 = $signed((^(wire104[(3'h7):(1'h1)] * wire3[(2'h3):(2'h2)])));
  assign wire164 = ({$signed(wire3), $signed(wire0)} ?
                       wire103 : wire160[(3'h4):(1'h0)]);
  assign wire165 = wire2[(4'ha):(2'h3)];
  assign wire166 = $signed(wire3);
  always
    @(posedge clk) begin
      if (((~wire164) ~^ (|{wire164[(3'h4):(2'h3)],
          {(wire166 <= wire2), (~&wire103)}})))
        begin
          reg167 <= (($unsigned({$signed(wire160),
              wire163}) >> wire159) ^~ (~$signed({(+wire159), wire157})));
          reg168 <= {$signed({$signed((wire103 << (8'hba)))})};
        end
      else
        begin
          reg167 <= $signed(wire159[(3'h4):(1'h1)]);
        end
      reg169 <= (~^(wire1[(4'h8):(4'h8)] ?
          wire104[(4'ha):(4'h9)] : wire157[(4'h9):(1'h1)]));
      reg170 <= wire103[(2'h2):(1'h1)];
    end
  assign wire171 = $unsigned(wire166[(3'h4):(3'h4)]);
  module105 #() modinst173 (.y(wire172), .wire109(wire163), .wire106(wire104), .clk(clk), .wire107(wire3), .wire108(wire157));
  assign wire174 = (~^wire3);
  always
    @(posedge clk) begin
      if ({{reg169[(3'h5):(3'h4)]},
          $unsigned((((wire160 + wire160) ?
              reg167[(2'h2):(2'h2)] : wire157[(3'h7):(3'h7)]) <<< wire3))})
        begin
          reg175 <= {wire160[(1'h1):(1'h1)]};
        end
      else
        begin
          reg175 <= (-$unsigned(((((8'hbe) + reg175) == $unsigned(reg175)) ?
              (!$signed((8'hba))) : $unsigned(((8'h9d) - wire101)))));
          reg176 <= reg168;
          reg177 <= (~^wire171[(3'h4):(2'h2)]);
          reg178 <= (($unsigned((~(|(8'haf)))) ?
              (-((reg168 ? reg170 : (8'ha8)) ?
                  $unsigned(wire101) : (reg167 ?
                      wire159 : wire159))) : wire166) << ($signed(($signed(wire161) ?
                  $signed((8'ha8)) : (&wire160))) ?
              (^~$signed({wire164, reg169})) : $unsigned(((wire164 & reg170) ?
                  wire103[(1'h1):(1'h0)] : $unsigned(wire171)))));
        end
      if (reg170[(3'h5):(2'h2)])
        begin
          reg179 <= wire3[(3'h5):(3'h5)];
          reg180 <= wire2;
          reg181 <= wire164;
          reg182 <= (+($signed((^~reg181)) > $unsigned($signed((reg170 ?
              (8'hb0) : wire157)))));
        end
      else
        begin
          if (wire161)
            begin
              reg179 <= wire159;
              reg180 <= $signed(((~|{$unsigned(wire3)}) ?
                  $unsigned($unsigned((reg180 ?
                      reg168 : (8'hb1)))) : $unsigned((reg179[(4'hb):(1'h1)] && $signed((7'h41))))));
              reg181 <= (reg169 ?
                  {wire0[(4'hd):(2'h3)],
                      ($signed((7'h42)) < wire159[(4'he):(2'h2)])} : reg176);
              reg182 <= $signed((7'h40));
              reg183 <= $signed(wire163[(4'hb):(1'h1)]);
            end
          else
            begin
              reg179 <= {wire2};
              reg180 <= ($unsigned({reg168, wire161}) ?
                  reg181 : (!(~$signed((wire165 <= (8'ha3))))));
              reg181 <= (!reg180[(4'h9):(3'h7)]);
              reg182 <= {$unsigned($signed({wire157})),
                  $signed(($unsigned(wire103) & (^reg182[(2'h2):(1'h1)])))};
              reg183 <= (($unsigned(reg180[(2'h3):(1'h1)]) <= $unsigned(($unsigned(wire101) * $signed(wire1)))) ?
                  wire172[(3'h5):(2'h3)] : $unsigned(($unsigned($signed(reg179)) - $signed(wire172[(2'h2):(1'h0)]))));
            end
        end
      if ($unsigned(($signed($signed(reg182)) <<< (+(wire174 ?
          wire3[(3'h6):(2'h3)] : (wire164 & wire0))))))
        begin
          if (wire160)
            begin
              reg184 <= $signed(reg179[(3'h4):(3'h4)]);
              reg185 <= ({((((8'hb2) < reg168) ?
                          $unsigned(reg167) : $unsigned(wire172)) ?
                      $unsigned((8'ha8)) : wire166[(1'h0):(1'h0)])} ^ $unsigned(reg181[(3'h7):(2'h2)]));
              reg186 <= (wire2[(3'h6):(3'h6)] != $unsigned(reg184));
            end
          else
            begin
              reg184 <= (8'haf);
              reg185 <= (^~$unsigned(wire157));
              reg186 <= wire166[(1'h0):(1'h0)];
              reg187 <= (wire161 ?
                  $unsigned((!$signed(reg167[(1'h1):(1'h1)]))) : wire1[(2'h3):(1'h0)]);
            end
          reg188 <= wire0[(4'hc):(4'h9)];
          reg189 <= {$signed(wire159[(1'h1):(1'h1)]),
              $unsigned($signed($signed((wire171 >= reg179))))};
          reg190 <= wire172[(2'h2):(1'h0)];
        end
      else
        begin
          reg184 <= reg187;
          reg185 <= (8'hba);
          reg186 <= wire163[(5'h10):(3'h6)];
          if (((~&$unsigned(((^reg175) >> $unsigned(reg178)))) ?
              {wire165} : reg179[(2'h3):(1'h1)]))
            begin
              reg187 <= reg175;
              reg188 <= {wire171[(2'h3):(2'h2)]};
            end
          else
            begin
              reg187 <= ((~|$unsigned($signed((reg180 ?
                  reg186 : (8'hb8))))) & $signed(reg179));
              reg188 <= {(-((wire160[(4'hb):(2'h2)] ?
                      $signed((8'ha9)) : reg175) > ((^reg182) || $signed(wire103)))),
                  (reg186[(3'h6):(3'h5)] ?
                      wire104[(3'h7):(3'h5)] : ($signed($signed(reg190)) ^ (|{(8'haf),
                          (8'h9f)})))};
              reg189 <= ($unsigned((~((wire2 ? reg189 : wire163) & (reg181 ?
                      wire171 : (8'hb9))))) ?
                  $signed(((reg182[(3'h5):(1'h0)] & (reg170 ?
                      wire2 : reg169)) <<< wire2[(2'h2):(1'h1)])) : wire164);
            end
        end
      reg191 <= $signed($signed(reg175[(2'h3):(1'h0)]));
      reg192 <= {$signed((8'hbc))};
    end
  assign wire193 = reg181;
  assign wire194 = (~&(|reg192));
  always
    @(posedge clk) begin
      reg195 <= ($signed({{$unsigned(wire163)}}) & $signed(((~$unsigned(wire157)) == wire101)));
      reg196 <= wire163[(1'h1):(1'h0)];
      reg197 <= reg195[(3'h4):(2'h2)];
      reg198 <= ($unsigned((wire0 ~^ reg177)) ?
          reg180[(3'h4):(1'h1)] : ($unsigned(((+reg167) ?
                  (~|wire171) : wire157[(4'h8):(2'h3)])) ?
              {((reg179 ? wire103 : wire104) ?
                      (reg186 * reg186) : (wire101 ?
                          wire174 : wire164))} : (~^($unsigned(reg168) ?
                  (wire193 ? reg168 : wire160) : {reg167, reg169}))));
    end
  assign wire199 = (((^~reg191) & reg179[(4'h9):(3'h4)]) ?
                       {(~($unsigned(reg191) ?
                               $unsigned((8'hba)) : (wire163 >= (8'ha9)))),
                           (~|$signed(reg189))} : $signed(wire159[(4'h9):(2'h2)]));
  assign wire200 = $unsigned($signed(($unsigned((~&(8'hae))) ^~ {$unsigned(wire199)})));
  always
    @(posedge clk) begin
      reg201 <= (&(wire101 ?
          reg186 : $unsigned($unsigned(wire104[(1'h0):(1'h0)]))));
    end
endmodule

module module105
#(parameter param155 = (((~|(((8'hbc) >>> (7'h40)) < (8'ha9))) <= (^~({(8'hb7), (7'h44)} ? (!(8'hb5)) : ((8'hab) ? (7'h44) : (8'h9f))))) ? ((-(^~{(8'hac), (8'ha4)})) + (^{((8'hb0) ~^ (8'hb1))})) : ((~(((8'hb6) - (8'hb5)) && ((8'hb2) ? (8'ha2) : (8'hb7)))) ? ({(+(8'h9d))} >= ({(8'hb7), (8'haf)} ^~ ((8'ha8) * (8'hb9)))) : (((|(8'hb8)) && (-(8'had))) * {((8'hb0) * (8'hb7)), ((8'hab) || (8'h9e))}))), 
parameter param156 = param155)
(y, clk, wire106, wire107, wire108, wire109);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire106;
  input wire signed [(4'hc):(1'h0)] wire107;
  input wire [(4'hd):(1'h0)] wire108;
  input wire [(5'h14):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire151;
  reg signed [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(5'h15):(1'h0)] reg153 = (1'h0);
  assign y = {wire110, wire111, wire151, reg154, reg153, (1'h0)};
  assign wire110 = wire106;
  assign wire111 = $unsigned({wire107, wire108});
  module112 #() modinst152 (wire151, clk, wire106, wire109, wire111, wire107, wire110);
  always
    @(posedge clk) begin
      reg153 <= ((|($unsigned($unsigned(wire106)) >= wire109)) ?
          wire110 : wire110[(1'h1):(1'h1)]);
      reg154 <= $unsigned($signed(($signed(((8'hb4) - wire109)) >= wire151)));
    end
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire10;
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire66,
                 wire10,
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
                 reg85,
                 (1'h0)};
  assign wire10 = (wire6 ?
                      (8'hbf) : ((8'ha3) ?
                          wire5[(5'h12):(4'hd)] : wire5[(4'hf):(4'hd)]));
  module11 #() modinst67 (.wire13(wire10), .clk(clk), .wire12(wire8), .wire14(wire7), .y(wire66), .wire15(wire5));
  module68 #() modinst81 (wire80, clk, wire8, wire10, wire9, wire66);
  assign wire82 = ($unsigned((wire80 ?
                      $unsigned($signed(wire5)) : wire80)) ^~ wire6[(2'h3):(2'h3)]);
  assign wire83 = wire9;
  assign wire84 = {{(&wire82)},
                      (~(wire7[(3'h5):(2'h2)] ?
                          $unsigned(wire5[(4'hf):(3'h7)]) : ((^~wire82) ?
                              (wire6 != wire66) : (~wire80))))};
  always
    @(posedge clk) begin
      reg85 <= $unsigned({$signed(wire83[(4'ha):(4'h9)]),
          $signed((|wire7[(4'hd):(1'h0)]))});
      if ((&(((&$signed(wire5)) <= $unsigned(wire5[(5'h14):(4'hd)])) ?
          ((|$unsigned(wire10)) ?
              (^$unsigned((7'h41))) : (|$signed((8'ha0)))) : ($signed({wire82,
              wire8}) || (8'hb0)))))
        begin
          reg86 <= $unsigned(wire7);
          reg87 <= ($signed(wire6) ?
              {wire66[(4'hb):(3'h4)],
                  $signed(reg85[(2'h3):(2'h2)])} : wire82[(4'ha):(4'h9)]);
        end
      else
        begin
          reg86 <= wire9[(4'ha):(2'h3)];
          if ($unsigned($unsigned(wire7[(3'h4):(3'h4)])))
            begin
              reg87 <= {wire9, {(~^(~&(!wire83))), wire9[(2'h3):(1'h1)]}};
              reg88 <= (wire10 << {$unsigned($signed((8'hbd))),
                  $signed($unsigned((reg86 != wire10)))});
            end
          else
            begin
              reg87 <= (8'ha2);
              reg88 <= (^(!$signed(($unsigned(wire82) ~^ (reg87 ?
                  wire82 : wire84)))));
              reg89 <= ($unsigned((wire66[(4'h9):(2'h3)] ?
                  (~|((8'h9f) & wire7)) : (~&reg86[(1'h0):(1'h0)]))) * $signed((wire83[(3'h7):(1'h0)] || (!$signed(reg86)))));
            end
          reg90 <= ((($signed(wire10[(5'h14):(4'he)]) - wire80) << wire84[(3'h6):(2'h3)]) ?
              wire84 : wire80[(4'h9):(1'h1)]);
          reg91 <= $signed(reg88[(4'ha):(3'h7)]);
          reg92 <= ($unsigned({$signed(wire6)}) ?
              $unsigned(wire6[(4'ha):(3'h4)]) : wire84);
        end
      reg93 <= ((((wire84[(3'h4):(1'h1)] ? $unsigned(reg90) : reg89) ?
          wire10 : (+(^(8'hbd)))) && $unsigned((~$signed(reg86)))) && reg87[(4'h9):(2'h2)]);
      reg94 <= (~$signed(($signed(wire84) - {reg92[(3'h4):(1'h0)]})));
      if ($unsigned(reg86[(1'h0):(1'h0)]))
        begin
          reg95 <= ($unsigned({{$unsigned(reg90), (&reg94)}}) ?
              wire66[(2'h3):(1'h0)] : (~&$signed(wire80[(4'hb):(4'h9)])));
          reg96 <= wire82[(2'h3):(2'h3)];
        end
      else
        begin
          reg95 <= $signed($signed($unsigned((8'ha4))));
          reg96 <= (^~wire8);
          reg97 <= {($unsigned((((8'hb4) > reg96) ?
                  reg92 : (reg86 << wire7))) >= $unsigned($unsigned(wire83[(3'h5):(2'h3)])))};
          reg98 <= $signed(reg96);
        end
    end
  assign wire99 = $signed((wire6[(2'h2):(2'h2)] == (&$unsigned((reg96 ?
                      (8'ha5) : reg88)))));
  assign wire100 = (-((~|(wire84[(2'h3):(1'h0)] ?
                           ((7'h40) ? reg92 : wire7) : {wire82})) ?
                       $signed($unsigned(reg86)) : (8'ha1)));
endmodule

module module68
#(parameter param78 = ((((((8'hbd) ? (8'hb5) : (8'hb2)) ? ((7'h40) ? (8'h9f) : (8'had)) : {(8'hba), (8'ha1)}) != {((8'hbd) ? (8'haf) : (8'ha4))}) ^ {(~&((7'h40) ? (8'hb0) : (8'hb4)))}) ^~ {{((~^(7'h40)) ? ((7'h40) != (8'h9f)) : ((7'h40) ? (8'ha3) : (7'h40))), (((8'ha6) ? (8'hb7) : (8'h9e)) ~^ (!(8'hae)))}, (({(8'hb0), (8'haf)} <<< {(8'hae), (8'ha5)}) ? ({(8'hb5), (8'ha5)} ? ((8'hb1) <= (8'hbc)) : ((8'hbf) ? (8'haf) : (8'h9c))) : (((8'hba) ? (7'h40) : (8'ha4)) ? ((8'hb9) ? (8'haa) : (8'hb4)) : ((8'hbc) ? (8'hb4) : (8'hb9))))}), 
parameter param79 = (((^~(~&(param78 * param78))) << ((~^(param78 & param78)) ? (param78 ? (param78 || param78) : param78) : param78)) >> ((|((param78 != (8'h9e)) == (param78 ? param78 : param78))) ^ (((param78 ? param78 : param78) ? param78 : (param78 || param78)) ? ((-param78) >> (param78 <<< (8'hbf))) : param78))))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire72;
  input wire [(5'h14):(1'h0)] wire71;
  input wire [(4'h8):(1'h0)] wire70;
  input wire [(5'h15):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  assign y = {wire77, wire76, wire75, wire74, wire73, (1'h0)};
  assign wire73 = $signed(wire69);
  assign wire74 = (+$unsigned($signed(wire72[(2'h2):(1'h1)])));
  assign wire75 = (^~$signed(wire71));
  assign wire76 = wire69[(5'h10):(4'hb)];
  assign wire77 = (wire70 <<< wire76[(4'h9):(4'h9)]);
endmodule

module module11
#(parameter param65 = ((7'h40) & {((8'hac) || (~&(8'ha9))), (((&(8'h9c)) ? (8'hb4) : ((8'haa) ? (8'ha7) : (8'hb3))) ? (|(~|(8'hbf))) : {((8'ha8) ? (8'hb9) : (8'hb1)), ((8'hb7) ? (8'hb1) : (8'hae))})}))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h26b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire16;
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire55,
                 wire44,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire25,
                 wire24,
                 wire16,
                 reg58,
                 reg57,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire16 = $signed(wire14);
  always
    @(posedge clk) begin
      reg17 <= (^(!{($unsigned(wire16) != (wire15 <= wire12))}));
      if (wire16[(3'h7):(3'h6)])
        begin
          reg18 <= wire16;
          reg19 <= ($signed(($unsigned($unsigned(wire12)) ?
                  ($unsigned((8'hb5)) * (wire14 ?
                      wire13 : wire16)) : ((wire15 | reg17) || (wire12 ?
                      wire15 : wire15)))) ?
              ($unsigned((~&$unsigned(reg17))) >>> $signed($unsigned((+wire14)))) : (&wire12[(3'h4):(1'h1)]));
          if ($signed($signed(wire16)))
            begin
              reg20 <= wire15[(3'h6):(1'h0)];
            end
          else
            begin
              reg20 <= {(^($signed(wire16) << wire14[(3'h6):(2'h2)]))};
            end
        end
      else
        begin
          reg18 <= $unsigned(reg20);
          reg19 <= reg17[(2'h2):(1'h0)];
          reg20 <= ($unsigned($signed(wire13)) ?
              (reg17[(2'h2):(1'h1)] ?
                  (!($unsigned(wire14) ?
                      $unsigned(reg20) : ((8'hbb) ?
                          wire14 : (8'haf)))) : {$signed({reg17})}) : {(&(^~(reg20 ^ (8'hac))))});
          reg21 <= (wire12 ? (|(8'hb2)) : (|(|(~&wire14[(3'h4):(1'h0)]))));
        end
      reg22 <= ((^~wire14) ?
          ({(^((8'hac) ?
                  wire15 : wire16))} ^ wire15) : $unsigned((({reg20} | (wire12 ^ reg18)) >> {wire13})));
      reg23 <= (wire12 <<< {$signed(wire16),
          $unsigned($signed($unsigned((8'ha8))))});
    end
  assign wire24 = reg20[(2'h2):(1'h1)];
  assign wire25 = ((~|$unsigned(reg18[(2'h2):(1'h0)])) + reg19[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg26 <= ((wire25 ~^ (($unsigned(reg21) & wire12) != $signed((reg19 ?
              reg22 : wire14)))) ?
          wire16[(3'h6):(2'h2)] : reg17[(1'h0):(1'h0)]);
      reg27 <= (|$unsigned($unsigned(reg22)));
      reg28 <= $unsigned(wire15);
      reg29 <= ((reg23[(4'hc):(4'ha)] != $unsigned(reg19)) <= ($unsigned($unsigned(reg27)) >> reg22));
    end
  assign wire30 = $signed(wire24[(3'h5):(3'h4)]);
  assign wire31 = (8'ha1);
  assign wire32 = ($signed(reg19[(4'ha):(2'h2)]) ?
                      (reg28[(3'h6):(1'h1)] != reg20) : $unsigned(wire30[(3'h6):(3'h5)]));
  assign wire33 = ($unsigned(wire25) >> wire15[(4'h9):(4'h9)]);
  assign wire34 = $unsigned((!$signed(((reg20 <<< (8'ha6)) ?
                      wire25 : $signed(reg20)))));
  always
    @(posedge clk) begin
      reg35 <= (((~|($unsigned(reg28) ^~ reg19[(3'h7):(1'h1)])) & {$signed($unsigned(reg19)),
          wire24[(2'h2):(1'h0)]}) + $signed(wire25));
      reg36 <= (^$unsigned({((&reg21) >> $unsigned(wire25)), $signed(reg18)}));
      reg37 <= reg36;
      if (($signed($unsigned(wire12[(3'h4):(1'h0)])) ?
          (~|$unsigned($signed((~(8'hb9))))) : reg23))
        begin
          reg38 <= $unsigned(reg18);
          reg39 <= reg18[(4'h9):(1'h0)];
        end
      else
        begin
          reg38 <= (reg22[(2'h3):(2'h2)] ?
              ((wire31 ?
                  $unsigned((reg37 ?
                      (7'h42) : reg26)) : $unsigned((wire24 < reg19))) | $unsigned({(reg19 <<< wire25),
                  $signed((7'h42))})) : ((+(~^((8'hb8) ?
                  wire25 : reg28))) <<< (^~(~(wire30 ^~ reg35)))));
        end
      reg40 <= (~(~^(reg38[(4'he):(3'h5)] ?
          ((wire14 << (8'hbd)) | (8'ha6)) : reg29)));
    end
  always
    @(posedge clk) begin
      reg41 <= $unsigned($unsigned({($signed(reg40) >>> wire12[(1'h1):(1'h0)])}));
      reg42 <= ($unsigned($unsigned(($unsigned((8'ha6)) ?
              $unsigned(reg20) : wire32))) ?
          (~$signed((~&(wire33 || reg17)))) : (|wire25));
      reg43 <= wire14[(4'hb):(4'ha)];
    end
  assign wire44 = {reg23[(3'h7):(3'h4)]};
  always
    @(posedge clk) begin
      reg45 <= $signed($unsigned(({(reg42 ?
              reg38 : (8'hae))} && reg38[(3'h7):(3'h5)])));
      if ((!$signed($unsigned(reg43[(4'hb):(4'h8)]))))
        begin
          reg46 <= reg40;
          reg47 <= $unsigned(($unsigned((!wire25)) ? (|reg20) : (^~reg45)));
        end
      else
        begin
          reg46 <= (&reg20[(1'h0):(1'h0)]);
          reg47 <= wire24;
          if (wire12)
            begin
              reg48 <= $unsigned($unsigned($signed(((8'ha1) || wire44))));
              reg49 <= (~|reg29[(2'h3):(1'h0)]);
              reg50 <= $unsigned($unsigned(($signed((&reg37)) ?
                  wire16[(2'h3):(2'h3)] : reg39)));
              reg51 <= (^(~reg17[(1'h1):(1'h0)]));
              reg52 <= $signed($unsigned($signed((~$signed(reg21)))));
            end
          else
            begin
              reg48 <= {$signed(({(~^reg52)} ^ wire31[(3'h7):(3'h4)]))};
              reg49 <= reg23[(3'h4):(2'h2)];
              reg50 <= (^$unsigned($signed((-(!wire16)))));
            end
          reg53 <= wire25[(4'hc):(4'hb)];
        end
      reg54 <= reg28[(1'h0):(1'h0)];
    end
  assign wire55 = (^(($signed((!reg38)) ?
                      $unsigned({wire31,
                          reg21}) : reg45) && (reg38[(4'he):(4'he)] < reg21[(3'h6):(1'h1)])));
  assign wire56 = (8'hbb);
  always
    @(posedge clk) begin
      reg57 <= {reg36};
      reg58 <= (({wire15[(1'h0):(1'h0)]} * $signed((~^(!wire31)))) ?
          $unsigned($signed((reg43 ?
              reg20[(1'h1):(1'h0)] : wire14))) : (^reg46[(2'h2):(2'h2)]));
    end
  assign wire59 = {reg45};
  assign wire60 = wire13;
  assign wire61 = (~^((~^wire44[(3'h5):(1'h0)]) < $unsigned(($unsigned((8'hb7)) <= {wire15}))));
  assign wire62 = reg52[(3'h4):(3'h4)];
  assign wire63 = (+$signed($unsigned($unsigned({reg51}))));
  assign wire64 = (8'hb4);
endmodule

module module112
#(parameter param149 = (({(^(8'ha2)), (~&((8'ha9) ? (8'hbb) : (8'hba)))} && ((|((8'ha6) <= (8'hb0))) == {(~|(8'hbe)), (^(8'h9c))})) + (((^~((8'h9d) == (8'ha0))) || ({(8'ha4)} ? ((8'hb8) > (8'hb7)) : ((8'ha7) ^~ (8'hb9)))) ? (~&(((7'h44) ? (8'ha8) : (8'ha3)) ? ((8'ha1) ? (8'had) : (8'hb9)) : {(8'ha5), (8'hb4)})) : ((~^{(8'hbb), (8'hac)}) >>> (((8'haa) - (8'ha2)) ? (~|(8'hb0)) : (~|(8'haf)))))), 
parameter param150 = {{param149}})
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire117;
  input wire [(4'he):(1'h0)] wire116;
  input wire [(5'h12):(1'h0)] wire115;
  input wire signed [(4'hc):(1'h0)] wire114;
  input wire [(5'h15):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire148;
  wire [(5'h14):(1'h0)] wire147;
  wire [(5'h13):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire118;
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire120,
                 wire119,
                 wire118,
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
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire118 = ($signed(((((7'h41) ? (8'hbd) : (8'had)) ?
                       wire116[(2'h3):(2'h3)] : ((8'h9e) ?
                           wire117 : wire117)) >= $unsigned($signed((8'hbb))))) > (wire115 >> (wire116 ?
                       wire116 : $unsigned((&wire117)))));
  assign wire119 = $signed(wire115);
  assign wire120 = (+$signed(wire115[(4'ha):(4'ha)]));
  always
    @(posedge clk) begin
      if ($unsigned(($signed(($signed(wire119) ?
          wire113 : (!wire116))) ^~ wire116[(2'h3):(1'h0)])))
        begin
          reg121 <= wire120;
          reg122 <= ($unsigned(wire116) ? wire120[(4'hd):(3'h7)] : reg121);
          reg123 <= wire119;
        end
      else
        begin
          if ($signed((&(^(wire116 >= $signed((7'h40)))))))
            begin
              reg121 <= (reg122 > $signed($signed((~|(wire118 ?
                  wire119 : wire113)))));
              reg122 <= {{$signed({wire119, (reg122 ? wire113 : wire115)})}};
              reg123 <= wire119;
              reg124 <= {wire113[(4'hd):(3'h5)]};
              reg125 <= $unsigned((^~(+($signed(wire115) ?
                  wire114 : wire119[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg121 <= ((+wire114[(4'hc):(4'hc)]) ^~ reg121);
              reg122 <= ($unsigned((wire115 >> $signed(reg122))) == $unsigned($unsigned($signed((wire120 < reg122)))));
              reg123 <= reg125;
              reg124 <= (~^reg123[(1'h0):(1'h0)]);
              reg125 <= ($unsigned(($unsigned((7'h42)) * wire116)) ^~ $signed({$unsigned(reg121[(4'he):(4'h9)])}));
            end
          if ({(|($unsigned($unsigned(reg122)) ?
                  $unsigned(((8'hbc) && wire119)) : {wire120, (~^wire114)})),
              ((($signed(wire117) || (reg123 ?
                      wire118 : wire113)) <= (-reg122[(1'h1):(1'h0)])) ?
                  $unsigned({wire116[(3'h7):(1'h0)],
                      (wire113 == reg122)}) : (reg123[(2'h3):(1'h1)] >> (^~(~^reg125))))})
            begin
              reg126 <= ($unsigned((~|wire115)) ?
                  (wire116[(4'hc):(1'h0)] ~^ $unsigned($unsigned((~|wire113)))) : reg124[(2'h3):(2'h2)]);
              reg127 <= wire113[(5'h10):(3'h4)];
            end
          else
            begin
              reg126 <= $unsigned({{reg124}});
              reg127 <= (wire114 ?
                  ({$signed($unsigned(reg126))} <<< (~wire114[(3'h4):(1'h0)])) : $signed((wire117[(4'ha):(4'ha)] ?
                      reg121 : $unsigned($signed(wire113)))));
              reg128 <= ($signed(wire116[(3'h5):(2'h2)]) ?
                  (~^({reg124} == {reg121[(4'ha):(1'h1)],
                      reg122})) : ($unsigned((^reg124)) ?
                      $signed((-reg121)) : $unsigned(wire116[(3'h4):(2'h3)])));
              reg129 <= (wire120 != (^$signed(reg123[(1'h1):(1'h1)])));
              reg130 <= $unsigned(((reg127 ?
                      wire118[(4'he):(3'h7)] : ($signed(wire114) ?
                          ((8'hbe) ?
                              reg124 : (8'hb9)) : reg121[(3'h7):(1'h1)])) ?
                  wire119[(1'h0):(1'h0)] : ($signed($signed(reg122)) ?
                      wire115 : (^(8'ha8)))));
            end
          reg131 <= ((reg125[(2'h2):(1'h0)] ?
              reg130 : ($signed({(8'h9d), (8'hb3)}) ?
                  wire115 : (wire119[(3'h6):(1'h0)] >= wire113))) * (wire117 ?
              $unsigned((wire115 ?
                  ((8'h9f) & (7'h44)) : (~wire119))) : reg128[(4'h8):(1'h0)]));
        end
      reg132 <= reg123[(1'h1):(1'h0)];
      if (reg121)
        begin
          if ($unsigned($signed(wire119)))
            begin
              reg133 <= wire118[(4'hf):(4'hc)];
            end
          else
            begin
              reg133 <= $signed(($unsigned($unsigned({reg131})) == {$unsigned($unsigned(wire113)),
                  (~^(!reg131))}));
            end
          reg134 <= wire117;
          reg135 <= reg123[(2'h2):(2'h2)];
          if ($signed((($signed($unsigned(reg130)) ?
              ($unsigned(wire119) >> (reg125 << reg130)) : ($signed(reg127) ?
                  (-reg129) : (wire116 ?
                      reg129 : (8'ha3)))) >= reg129[(3'h4):(3'h4)])))
            begin
              reg136 <= reg128[(1'h0):(1'h0)];
              reg137 <= {reg128[(3'h5):(2'h3)]};
            end
          else
            begin
              reg136 <= $unsigned(reg124[(3'h4):(2'h3)]);
              reg137 <= wire113[(4'hf):(3'h4)];
              reg138 <= $unsigned((|$unsigned((reg125[(4'hb):(4'hb)] ?
                  (-(7'h42)) : (reg132 | wire116)))));
              reg139 <= {(($unsigned((|reg131)) ?
                          wire115[(3'h6):(2'h3)] : ($signed((8'hbb)) ?
                              wire113[(1'h0):(1'h0)] : (8'h9d))) ?
                      reg127[(2'h2):(1'h0)] : (^((~^(8'ha7)) ?
                          wire120[(3'h5):(2'h2)] : {(7'h42), (8'hb5)})))};
              reg140 <= {$signed((^wire118[(4'hc):(2'h3)])),
                  $unsigned(((~^wire118) ?
                      $signed({wire119,
                          wire116}) : $unsigned($signed(reg134))))};
            end
          reg141 <= $unsigned($signed(wire116));
        end
      else
        begin
          if ((($unsigned($signed({wire113})) <<< (^~((reg134 ?
              reg122 : reg124) * (^reg121)))) ^ reg130))
            begin
              reg133 <= wire119[(1'h1):(1'h1)];
              reg134 <= wire115;
              reg135 <= reg139[(1'h0):(1'h0)];
              reg136 <= (8'hac);
            end
          else
            begin
              reg133 <= {reg130[(2'h2):(1'h0)]};
              reg134 <= $unsigned(($signed(reg137[(5'h11):(3'h6)]) + $unsigned((~(8'h9d)))));
              reg135 <= {$unsigned((reg122[(1'h0):(1'h0)] > $signed($signed(reg140)))),
                  ((+$unsigned((8'haf))) ?
                      (reg126 * ($signed(wire114) ?
                          (+(8'hb1)) : (~&wire118))) : {((reg124 ?
                              reg125 : reg130) > reg135[(3'h4):(3'h4)]),
                          $signed((reg137 ? reg133 : reg137))})};
              reg136 <= $signed(reg139);
            end
          reg137 <= (+{$unsigned(($unsigned(wire119) ^~ $unsigned(reg127)))});
          if ($signed($signed((reg135 == (wire116[(4'h9):(3'h4)] ?
              $unsigned(reg130) : reg137)))))
            begin
              reg138 <= reg131[(2'h3):(1'h1)];
              reg139 <= (|$unsigned(reg127));
              reg140 <= reg122[(2'h2):(1'h1)];
              reg141 <= $unsigned((|((&{(8'hb1)}) ?
                  $unsigned((wire115 | reg134)) : $signed(reg124[(1'h0):(1'h0)]))));
              reg142 <= (((&$unsigned($signed(wire118))) ?
                      reg129[(3'h4):(1'h0)] : $signed($signed(reg121[(3'h5):(3'h4)]))) ?
                  wire117 : $signed(reg129[(2'h3):(2'h3)]));
            end
          else
            begin
              reg138 <= (reg125[(3'h4):(3'h4)] ^ (&($unsigned(((8'hab) < wire113)) ?
                  {$signed(wire114)} : reg122[(1'h1):(1'h0)])));
            end
        end
      reg143 <= reg127;
      reg144 <= $unsigned(wire115);
    end
  always
    @(posedge clk) begin
      reg145 <= reg123;
    end
  assign wire146 = wire118;
  assign wire147 = $signed($unsigned({{(~|wire114),
                           (reg127 ? (8'ha1) : reg127)}}));
  assign wire148 = (&($signed({(reg143 ? reg143 : reg129)}) ?
                       ($unsigned($signed(reg126)) * $unsigned((!(8'ha5)))) : $unsigned(reg129)));
endmodule
