module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire161;
  wire [(3'h6):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire159;
  wire [(5'h10):(1'h0)] wire158;
  wire signed [(5'h11):(1'h0)] wire157;
  wire [(3'h4):(1'h0)] wire149;
  wire [(4'ha):(1'h0)] wire148;
  wire [(4'hb):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire140;
  wire [(5'h13):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire146;
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire149,
                 wire148,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire136,
                 wire112,
                 wire146,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg114,
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
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg138,
                 reg139,
                 (1'h0)};
  module4 #() modinst113 (.clk(clk), .y(wire112), .wire6(wire3), .wire8(wire1), .wire9((8'hbb)), .wire7(wire0), .wire5(wire2));
  always
    @(posedge clk) begin
      reg114 <= wire2;
      if ({(wire2[(4'hf):(2'h3)] >= wire3[(4'he):(4'ha)])})
        begin
          reg115 <= reg114;
          reg116 <= {((wire1[(5'h12):(1'h1)] ?
                      wire3[(3'h7):(1'h1)] : (!wire1[(1'h1):(1'h1)])) ?
                  {{(wire0 & wire3)}} : wire1[(5'h14):(4'he)])};
          if (($signed($signed($unsigned((&wire3)))) == (wire0[(4'h9):(3'h7)] ?
              {((~wire1) > $unsigned(reg114))} : $signed({(-wire0)}))))
            begin
              reg117 <= {wire2[(4'h8):(1'h1)], wire112[(4'hd):(4'hb)]};
            end
          else
            begin
              reg117 <= ({({wire3[(1'h0):(1'h0)]} ?
                          {reg115[(4'hb):(4'h8)]} : wire2),
                      (wire2[(3'h5):(1'h0)] >= $unsigned((8'ha5)))} ?
                  (^{(reg116 + reg117)}) : (8'had));
              reg118 <= (^~((wire2[(4'he):(4'he)] <= reg114[(3'h4):(3'h4)]) ?
                  ($signed($unsigned((7'h42))) ?
                      {(wire1 + (8'hbb)),
                          (wire112 ?
                              wire0 : reg116)} : $signed(reg116)) : {$signed($unsigned(reg116)),
                      (reg114 ?
                          reg114[(2'h2):(1'h1)] : reg114[(3'h4):(3'h4)])}));
              reg119 <= ($signed((({wire112,
                      reg116} ^ (7'h43)) & $signed(((8'haf) ?
                      wire3 : (8'hba))))) ?
                  $unsigned(reg115) : (&reg115[(4'hd):(3'h4)]));
            end
          reg120 <= reg115;
        end
      else
        begin
          reg115 <= (|({(reg117 ? reg119 : (reg118 - reg118))} ?
              (8'ha0) : reg118[(2'h2):(1'h0)]));
          reg116 <= ((8'ha8) ?
              ($unsigned($unsigned((^~reg118))) == $unsigned((^~reg120[(2'h2):(2'h2)]))) : {reg118[(4'h9):(3'h7)]});
        end
      if (reg117)
        begin
          if ((|reg119[(4'hf):(3'h4)]))
            begin
              reg121 <= reg120[(2'h2):(2'h2)];
              reg122 <= reg117;
              reg123 <= (+(reg117 ^ reg115));
              reg124 <= (~&reg119);
              reg125 <= (+reg120);
            end
          else
            begin
              reg121 <= {(8'haf),
                  ((8'haf) ?
                      {((^reg121) ?
                              reg116 : (+reg122))} : $signed({wire112[(4'hc):(2'h2)],
                          wire0}))};
            end
          reg126 <= $signed((((+reg120[(3'h7):(3'h4)]) | reg115[(3'h6):(1'h1)]) * ((8'hba) && reg120[(4'h8):(3'h7)])));
        end
      else
        begin
          reg121 <= ($unsigned((reg123[(2'h3):(1'h0)] != ($signed(wire0) ^~ (8'ha8)))) ?
              reg123[(3'h4):(2'h2)] : wire1);
          if (reg122[(1'h0):(1'h0)])
            begin
              reg122 <= $signed(((((reg124 ?
                  (8'hb2) : (7'h43)) == $signed(reg117)) >>> ($unsigned((8'hb1)) ?
                  (8'hba) : (7'h41))) != ($unsigned(wire0) ?
                  $signed((reg126 & reg114)) : wire2)));
              reg123 <= (~^(!reg115[(5'h14):(4'hf)]));
              reg124 <= (^$unsigned($signed($unsigned(reg114[(4'h9):(1'h1)]))));
            end
          else
            begin
              reg122 <= (8'hb4);
            end
          reg125 <= (wire1[(1'h0):(1'h0)] ?
              (reg120 ?
                  $unsigned(($signed(wire112) && reg114[(3'h5):(1'h0)])) : (($unsigned(reg115) && $unsigned((8'ha3))) <<< $signed(reg115[(4'ha):(3'h5)]))) : (|$signed(((reg117 > (8'h9f)) ?
                  (reg126 ? reg118 : wire1) : {reg119}))));
          reg126 <= ($unsigned(reg118) * (^~(^$unsigned(wire2[(1'h1):(1'h1)]))));
          reg127 <= (~reg126);
        end
      if ($signed((^~reg124[(4'he):(2'h2)])))
        begin
          reg128 <= $signed({((7'h40) ?
                  reg127 : $unsigned(((8'hb4) < wire112)))});
          reg129 <= wire0[(4'he):(2'h2)];
          if (wire1)
            begin
              reg130 <= (8'hbf);
              reg131 <= $unsigned($signed($signed($unsigned($signed(reg127)))));
            end
          else
            begin
              reg130 <= reg116;
              reg131 <= (($unsigned(wire1[(4'hf):(3'h4)]) >> (~|($unsigned((7'h40)) ?
                  reg117 : $signed(reg114)))) <= $signed((^(~^(reg131 ?
                  reg120 : reg118)))));
              reg132 <= $signed(reg120[(1'h1):(1'h0)]);
              reg133 <= $unsigned($signed((^($unsigned(reg115) ?
                  ((8'hb7) ? (8'h9f) : reg121) : reg130[(1'h0):(1'h0)]))));
              reg134 <= reg127[(4'he):(4'hc)];
            end
          reg135 <= {reg117[(4'hd):(1'h0)],
              ((reg115 ? $unsigned((^~reg123)) : (reg123 == reg123)) ?
                  (((wire0 == wire112) ?
                          (reg130 <<< reg121) : $signed(reg121)) ?
                      {reg134,
                          (reg115 == reg118)} : {(~reg133)}) : wire2[(4'hb):(3'h6)])};
        end
      else
        begin
          reg128 <= reg116;
          reg129 <= ({reg135,
                  ($signed(reg133) ? reg132 : $signed(reg124[(3'h6):(1'h1)]))} ?
              ({$unsigned((!(8'ha1)))} ?
                  reg121 : (8'h9d)) : {$unsigned((7'h42)),
                  {$signed({(8'hb9), (8'ha9)})}});
        end
    end
  module60 #() modinst137 (wire136, clk, reg131, reg130, reg118, reg121);
  always
    @(posedge clk) begin
      reg138 <= wire3[(4'hb):(3'h4)];
      reg139 <= $unsigned((~^(^~$unsigned(reg114[(3'h7):(3'h4)]))));
    end
  assign wire140 = $signed(wire2);
  assign wire141 = ({wire112[(3'h6):(1'h1)],
                       $unsigned((~&reg130[(1'h1):(1'h1)]))} & reg132[(4'h9):(3'h7)]);
  assign wire142 = $unsigned(reg125[(3'h5):(3'h4)]);
  assign wire143 = $signed($unsigned(reg117[(4'h8):(1'h0)]));
  module4 #() modinst145 (.wire5(reg125), .clk(clk), .wire7(reg122), .wire6(reg134), .wire9(reg135), .wire8(wire141), .y(wire144));
  module11 #() modinst147 (.wire13(wire142), .wire14(reg124), .wire15(reg114), .clk(clk), .wire12(reg129), .y(wire146));
  assign wire148 = reg114;
  assign wire149 = wire140;
  always
    @(posedge clk) begin
      if (((+$signed((wire1 ?
          reg114[(3'h6):(2'h2)] : reg133[(4'hc):(3'h4)]))) + {(wire149[(1'h0):(1'h0)] ?
              reg128 : $signed({reg138})),
          $unsigned(reg114)}))
        begin
          reg150 <= $signed({reg115[(4'ha):(2'h3)],
              $unsigned((~|(wire144 ? reg120 : reg115)))});
          reg151 <= $signed(($unsigned($signed((reg130 ? wire1 : wire2))) ?
              wire0[(5'h11):(2'h2)] : (7'h44)));
          reg152 <= $unsigned(wire146[(5'h10):(4'ha)]);
          reg153 <= (8'hb3);
        end
      else
        begin
          if ($signed(reg121[(2'h3):(2'h2)]))
            begin
              reg150 <= ($unsigned(((((8'hb9) ? reg152 : (7'h41)) ?
                          (~&reg133) : reg118) ?
                      wire144[(3'h7):(3'h5)] : {(^~reg139)})) ?
                  reg120[(4'hc):(4'h9)] : ((~(-{reg121,
                      wire140})) << reg118[(1'h0):(1'h0)]));
              reg151 <= wire0;
              reg152 <= $signed((((~(reg135 <= reg123)) ?
                  wire142 : (+(wire0 && wire143))) ^~ $unsigned($signed({reg152}))));
              reg153 <= $signed($unsigned(($signed((wire2 ? (8'ha7) : reg114)) ?
                  $signed((&reg121)) : {(-wire142), (reg131 << (8'h9e))})));
              reg154 <= $unsigned(wire2[(4'h9):(1'h1)]);
            end
          else
            begin
              reg150 <= (({((+reg130) == (reg139 ~^ wire136)),
                      (wire136[(5'h11):(4'h8)] ? {(8'ha5), reg129} : reg125)} ?
                  $signed(reg121) : $unsigned(((reg124 ?
                      (8'hb7) : reg124) - (reg120 ?
                      reg134 : reg128)))) || reg118);
              reg151 <= $unsigned(($signed(reg130) ?
                  (!(&(reg127 | reg126))) : $unsigned($unsigned({wire146}))));
              reg152 <= (+reg127);
            end
          reg155 <= (^~((-($signed(wire149) & {wire0})) ^ $signed((~|wire148))));
          reg156 <= $signed((($signed($signed((8'hb5))) & (^$signed(reg130))) ?
              (+reg139[(3'h4):(1'h1)]) : (|$unsigned($unsigned((8'hb8))))));
        end
    end
  assign wire157 = $signed((!reg155));
  assign wire158 = $unsigned(({wire144[(2'h2):(2'h2)],
                           (reg125[(4'hf):(4'h8)] ? {reg119} : reg119)} ?
                       $signed(wire157[(4'h9):(2'h3)]) : $signed((reg129 ?
                           wire157[(3'h7):(3'h7)] : wire157))));
  assign wire159 = (reg114[(4'hd):(4'ha)] || reg126[(3'h5):(2'h2)]);
  assign wire160 = $signed((reg138[(2'h3):(2'h3)] == $signed(reg154[(1'h1):(1'h0)])));
  assign wire161 = {(reg150 ? (8'h9e) : (wire0 & $unsigned($signed(reg134)))),
                       (reg127 ^~ reg114[(4'ha):(1'h1)])};
endmodule

module module4
#(parameter param110 = {({(~|{(8'ha0), (8'hb2)})} + ({((8'hb2) ? (8'had) : (8'hb9)), ((8'h9e) ? (8'hb4) : (8'hbc))} ? ((+(7'h41)) ? (^~(8'had)) : (~|(8'ha3))) : (((8'ha6) ? (7'h42) : (8'ha4)) ^~ {(8'ha3)}))), {{(((8'ha1) >> (8'ha0)) * ((8'hae) ? (8'ha9) : (8'hb7)))}}}, 
parameter param111 = param110)
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire41;
  assign y = {wire109,
                 wire107,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire44,
                 wire43,
                 wire10,
                 wire25,
                 wire27,
                 wire41,
                 (1'h0)};
  assign wire10 = (-(8'ha3));
  module11 #() modinst26 (.wire13(wire7), .clk(clk), .wire12(wire8), .y(wire25), .wire15(wire10), .wire14(wire9));
  assign wire27 = wire9;
  module28 #() modinst42 (wire41, clk, wire5, wire27, wire25, wire9, wire7);
  assign wire43 = (!(^~(^{$signed((8'h9d))})));
  assign wire44 = $signed(((((!(7'h43)) && wire5) || (|{wire43,
                      wire10})) + wire8));
  module45 #() modinst56 (.wire49(wire43), .clk(clk), .wire46(wire41), .y(wire55), .wire47(wire5), .wire48(wire7));
  assign wire57 = (wire44 ? wire8[(4'h8):(4'h8)] : {{wire9[(2'h3):(1'h1)]}});
  assign wire58 = wire9[(2'h3):(1'h1)];
  assign wire59 = (wire58 >= ($unsigned($unsigned(wire58[(4'hb):(3'h6)])) ?
                      $signed((^~$signed(wire55))) : (wire58 == $signed((wire55 && wire10)))));
  module60 #() modinst108 (.wire64(wire59), .wire63(wire41), .clk(clk), .wire62(wire6), .y(wire107), .wire61(wire7));
  assign wire109 = {(wire10 + $unsigned($unsigned(wire7[(4'hb):(4'h8)]))),
                       (~&$unsigned({$signed(wire107)}))};
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire64;
  input wire [(4'hc):(1'h0)] wire63;
  input wire [(4'hd):(1'h0)] wire62;
  input wire [(5'h12):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire65;
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire85,
                 wire84,
                 wire83,
                 wire65,
                 reg104,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
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
                 (1'h0)};
  assign wire65 = wire63;
  always
    @(posedge clk) begin
      if (wire65)
        begin
          if ($signed($unsigned(wire64)))
            begin
              reg66 <= wire62;
            end
          else
            begin
              reg66 <= $signed(wire63[(4'hb):(3'h7)]);
              reg67 <= (wire63 ?
                  wire61 : {(8'hb7),
                      (({wire65, reg66} - (wire65 << wire63)) ?
                          wire62 : (wire62[(4'hb):(3'h4)] || ((8'haa) ?
                              wire65 : wire62)))});
              reg68 <= {($signed(wire63[(2'h2):(1'h0)]) ^~ {(^~(wire65 ?
                          (8'hb7) : reg66)),
                      ($unsigned(wire64) <<< $unsigned(wire64))})};
              reg69 <= wire65;
            end
          reg70 <= ((~^($signed(wire65) ?
              reg68[(4'hf):(3'h5)] : $signed((wire62 ?
                  wire62 : wire64)))) ~^ $signed(wire63));
          reg71 <= reg69;
          if ($signed(reg67[(5'h12):(4'h9)]))
            begin
              reg72 <= $unsigned((+wire64));
              reg73 <= (wire63[(1'h0):(1'h0)] ?
                  (-((wire61[(2'h3):(2'h3)] ~^ $unsigned(wire63)) ?
                      $unsigned(wire63[(1'h0):(1'h0)]) : (+(~&reg72)))) : $signed((^~$signed($signed(reg68)))));
              reg74 <= (^$unsigned(($signed((wire61 >> reg68)) ^ {reg71[(1'h1):(1'h1)],
                  $unsigned(wire61)})));
            end
          else
            begin
              reg72 <= $unsigned((~($unsigned(reg70) >>> wire64)));
              reg73 <= ({$unsigned((~|$signed(reg74))),
                  (wire65 ?
                      $unsigned((~|wire63)) : $signed((7'h44)))} - ($signed(reg73[(2'h3):(2'h2)]) >> {{wire65[(2'h2):(1'h0)],
                      {reg69}},
                  $unsigned(reg67[(2'h3):(1'h1)])}));
              reg74 <= reg69[(3'h7):(1'h1)];
              reg75 <= ((|$unsigned(wire63)) >> wire64);
              reg76 <= $unsigned((+(^(+reg71))));
            end
        end
      else
        begin
          reg66 <= (8'h9c);
        end
      if ($unsigned(reg75[(4'hb):(4'ha)]))
        begin
          if (reg68[(2'h2):(1'h0)])
            begin
              reg77 <= (+$signed((((reg73 | wire64) ?
                      (reg67 == reg74) : $unsigned(reg72)) ?
                  wire63[(3'h4):(2'h3)] : $signed({reg66}))));
            end
          else
            begin
              reg77 <= $signed(reg67[(4'ha):(1'h0)]);
              reg78 <= {reg69};
              reg79 <= $signed($unsigned(($signed((reg75 ?
                  reg69 : wire62)) & ($unsigned((8'h9c)) ?
                  (^~reg69) : $signed((8'hb6))))));
              reg80 <= (($unsigned($signed($signed((8'hac)))) ?
                      $unsigned($unsigned((wire61 ?
                          (8'ha6) : reg69))) : wire63) ?
                  (~wire62[(3'h5):(1'h0)]) : (8'hb6));
            end
          reg81 <= $unsigned(($unsigned(reg73[(3'h6):(2'h3)]) - reg76));
          reg82 <= reg70;
        end
      else
        begin
          reg77 <= (($unsigned((8'hac)) ?
                  $unsigned($signed(wire63[(3'h5):(2'h2)])) : ((^reg79[(4'hb):(1'h1)]) ?
                      (^$signed(reg81)) : wire65[(1'h0):(1'h0)])) ?
              (((reg81[(4'hc):(2'h3)] <= wire62) ?
                      (reg78 || (reg72 ? reg66 : reg75)) : wire63) ?
                  $signed({$signed(wire62),
                      {reg79, reg74}}) : {$unsigned($unsigned(reg81)),
                      (reg77[(3'h4):(1'h1)] ?
                          $signed(reg67) : {wire61,
                              reg76})}) : $signed({($unsigned(reg71) ^ (+reg80))}));
          reg78 <= (((reg74[(3'h4):(3'h4)] + reg75[(4'hb):(3'h7)]) ?
              reg69[(2'h2):(1'h1)] : (!wire61)) ^ $unsigned((~^$unsigned((8'hbb)))));
          reg79 <= (reg77[(1'h1):(1'h1)] <<< (-(((reg75 ?
              reg80 : reg81) | $unsigned(reg70)) ^ (reg76[(1'h1):(1'h0)] ^ $unsigned(reg75)))));
        end
    end
  assign wire83 = $signed(((($signed(reg80) + (reg75 <<< wire61)) <= $unsigned(reg72[(2'h3):(2'h2)])) || reg72));
  assign wire84 = (((-$signed({wire61,
                      reg69})) == wire64) <<< $unsigned($unsigned($signed((8'haa)))));
  assign wire85 = (8'hb5);
  always
    @(posedge clk) begin
      if (reg81[(2'h2):(1'h1)])
        begin
          if ((($unsigned(($unsigned(reg72) ?
              (reg82 ?
                  reg71 : wire61) : reg72[(3'h6):(1'h1)])) == (^(reg67[(3'h4):(2'h3)] ^ $signed(reg70)))) && reg72))
            begin
              reg86 <= reg71[(3'h7):(2'h2)];
              reg87 <= (wire64 == ((~$signed($unsigned(reg86))) ?
                  $signed(wire61[(4'hc):(3'h7)]) : wire64[(1'h1):(1'h1)]));
              reg88 <= wire64;
              reg89 <= (~|$signed({$unsigned(wire65[(2'h2):(2'h2)]),
                  ((~^reg81) <<< ((8'hb5) ? reg86 : reg86))}));
              reg90 <= ($signed((wire84 - reg82[(2'h2):(1'h1)])) * reg75);
            end
          else
            begin
              reg86 <= (wire62[(3'h7):(2'h2)] > $unsigned($unsigned((7'h42))));
              reg87 <= (!($unsigned((((8'ha4) >= reg74) ?
                  (~|wire85) : reg89[(4'hf):(4'h8)])) == reg77[(3'h4):(1'h0)]));
            end
          reg91 <= ($unsigned((reg90[(1'h1):(1'h0)] ?
              reg78[(1'h1):(1'h1)] : $unsigned($signed(wire84)))) >= ($unsigned({(7'h41)}) != {reg86}));
          if ((8'haa))
            begin
              reg92 <= ($signed((((reg80 * reg87) ?
                      (reg71 << reg67) : wire85) >> {reg80[(2'h3):(1'h0)]})) ?
                  ((|(8'ha4)) ?
                      reg89[(4'hb):(2'h2)] : reg90[(2'h3):(2'h3)]) : ($signed(($unsigned(wire65) * (!wire83))) ?
                      (($signed(reg71) ? $unsigned((7'h41)) : {reg66}) ?
                          reg68[(4'he):(3'h7)] : reg80[(4'ha):(4'h8)]) : (reg67 ?
                          ($unsigned(reg80) >> {reg79}) : {reg78,
                              {reg73, (8'haf)}})));
            end
          else
            begin
              reg92 <= (~$signed((wire83[(4'h9):(3'h5)] ?
                  (8'haf) : (^~$signed(wire63)))));
            end
          reg93 <= $signed($signed($unsigned(reg67[(1'h0):(1'h0)])));
        end
      else
        begin
          reg86 <= reg71[(3'h7):(2'h2)];
          reg87 <= $unsigned({$unsigned({((8'hbe) ? reg77 : reg93),
                  (+(8'h9d))}),
              $signed($unsigned((reg89 ? reg74 : reg78)))});
          reg88 <= (^~$unsigned(reg77[(3'h4):(3'h4)]));
        end
    end
  assign wire94 = (+reg66);
  assign wire95 = $signed((((reg78 ^ reg93[(4'hc):(3'h6)]) ?
                      reg76[(3'h4):(2'h3)] : ((reg86 ? (8'ha1) : reg68) ?
                          (reg90 + wire64) : (8'hbc))) < (reg93 & reg75)));
  assign wire96 = $signed($signed((!reg82)));
  assign wire97 = reg74;
  assign wire98 = $unsigned((reg80[(4'hc):(1'h1)] & {$unsigned(reg90), reg76}));
  assign wire99 = $signed((($unsigned((reg91 ? (8'haa) : reg79)) << reg79) ?
                      wire96[(3'h5):(2'h3)] : ($unsigned((reg90 ?
                              reg76 : reg93)) ?
                          (reg93[(4'h8):(2'h3)] ?
                              (^~reg90) : (reg69 != reg75)) : $unsigned(wire61[(4'he):(2'h2)]))));
  assign wire100 = {($signed((&(~(8'had)))) ?
                           $unsigned($signed(reg91[(2'h2):(1'h1)])) : $unsigned($unsigned(reg67[(4'h8):(1'h1)]))),
                       reg89};
  assign wire101 = $signed(((wire95[(2'h2):(1'h1)] != $unsigned(reg81[(2'h3):(2'h3)])) >>> (reg88 ?
                       ((reg79 ~^ wire94) != wire65[(1'h0):(1'h0)]) : $signed((|wire65)))));
  assign wire102 = $signed(reg70[(3'h6):(1'h0)]);
  assign wire103 = $unsigned({{$signed((wire84 ? reg79 : wire97)),
                           (+(wire62 ? wire64 : reg68))}});
  always
    @(posedge clk) begin
      reg104 <= $signed($signed($unsigned(wire96)));
    end
  assign wire105 = $unsigned(reg80);
  assign wire106 = (reg81[(4'hd):(4'ha)] << reg66[(2'h2):(1'h0)]);
endmodule

module module45
#(parameter param54 = ((-(((7'h40) & ((8'ha1) && (8'hac))) >> (~^(^~(8'hb6))))) && ((!(8'ha8)) * (+((+(8'hb4)) ? (|(8'hba)) : ((8'hbc) && (8'hbe)))))))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h13):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire49;
  input wire signed [(5'h11):(1'h0)] wire48;
  input wire [(3'h7):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  assign y = {wire53, wire52, wire51, wire50, (1'h0)};
  assign wire50 = wire47;
  assign wire51 = ((-(&($unsigned(wire46) >= wire50[(3'h4):(2'h3)]))) ?
                      $unsigned($signed(((8'had) ?
                          wire49 : (~|wire50)))) : $unsigned(wire47[(1'h1):(1'h0)]));
  assign wire52 = (~^$signed((($signed(wire51) < $signed((8'hb7))) ?
                      {(wire47 >= (8'h9e)),
                          {(8'hb1)}} : $signed($signed(wire49)))));
  assign wire53 = (~|$unsigned(wire47));
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  assign y = {wire40, wire39, wire38, wire37, wire36, wire35, wire34, (1'h0)};
  assign wire34 = ($signed($signed($unsigned((~&(8'hbc))))) + (~|(wire31[(5'h12):(4'ha)] ?
                      (wire33 && (wire30 << (8'hb0))) : ((!(8'ha4)) ?
                          (wire31 ? wire32 : wire32) : {wire33}))));
  assign wire35 = (~^{wire31, (wire29 >= $signed(wire30))});
  assign wire36 = wire34;
  assign wire37 = (wire36 ?
                      $unsigned((((wire34 ? wire30 : wire33) ?
                              $unsigned((8'ha3)) : $unsigned(wire35)) ?
                          wire34 : (^(~&(8'ha9))))) : ({($unsigned(wire30) ?
                                  (~(7'h44)) : $unsigned(wire31))} ?
                          (|(wire31 ?
                              wire35[(2'h2):(1'h1)] : (8'hbb))) : (!wire33)));
  assign wire38 = (wire29[(4'h9):(1'h0)] ?
                      $signed(wire36[(1'h1):(1'h0)]) : {($unsigned((^~wire29)) ?
                              wire33[(4'hb):(3'h6)] : wire31[(4'h9):(3'h4)])});
  assign wire39 = ($unsigned(wire32[(4'he):(1'h1)]) ?
                      ((-(^$signed(wire31))) ?
                          ((^~(~&wire29)) ?
                              (8'hb5) : wire37) : $unsigned($unsigned($signed((8'ha9))))) : (wire31 || $signed(wire32[(3'h6):(3'h4)])));
  assign wire40 = wire29[(4'hc):(3'h4)];
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg24,
                 (1'h0)};
  assign wire16 = wire14;
  assign wire17 = (wire16[(1'h1):(1'h0)] && $unsigned((-wire15[(3'h5):(2'h3)])));
  assign wire18 = wire16[(1'h0):(1'h0)];
  assign wire19 = (wire15 ?
                      {(~|(wire13[(1'h0):(1'h0)] ?
                              (wire13 - wire12) : {wire15, wire18})),
                          wire15[(2'h2):(2'h2)]} : $signed((^wire18[(3'h4):(1'h1)])));
  assign wire20 = ({wire16[(2'h2):(1'h0)],
                      $signed(wire15[(4'hd):(1'h0)])} & wire18[(3'h6):(2'h2)]);
  assign wire21 = wire17;
  assign wire22 = wire13[(4'ha):(3'h6)];
  assign wire23 = (~|$unsigned($unsigned(wire14)));
  always
    @(posedge clk) begin
      reg24 <= $unsigned(wire22);
    end
endmodule
