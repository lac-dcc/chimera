module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire175;
  wire signed [(5'h13):(1'h0)] wire174;
  wire [(4'h9):(1'h0)] wire173;
  wire [(4'h9):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire170;
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire89,
                 wire91,
                 wire92,
                 wire170,
                 (1'h0)};
  module4 #() modinst90 (wire89, clk, wire2, wire1, wire0, wire3);
  assign wire91 = $unsigned((~|(|(~$unsigned(wire1)))));
  assign wire92 = wire0[(4'h9):(2'h2)];
  module93 #() modinst171 (wire170, clk, wire89, wire0, wire3, wire2, wire92);
  assign wire172 = $unsigned($unsigned($unsigned({wire89[(4'hd):(4'h9)],
                       (~^wire2)})));
  assign wire173 = $signed(wire1);
  assign wire174 = $unsigned(wire2[(4'hd):(4'hd)]);
  assign wire175 = wire3;
endmodule

module module93  (y, clk, wire94, wire95, wire96, wire97, wire98);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire94;
  input wire signed [(3'h7):(1'h0)] wire95;
  input wire signed [(4'hd):(1'h0)] wire96;
  input wire [(4'ha):(1'h0)] wire97;
  input wire signed [(4'hd):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire169;
  wire [(4'ha):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire154;
  wire signed [(4'hd):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire149;
  wire signed [(2'h3):(1'h0)] wire148;
  wire [(5'h10):(1'h0)] wire147;
  wire signed [(3'h5):(1'h0)] wire146;
  wire signed [(4'hd):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire140;
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(4'h8):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg165 = (1'h0);
  reg [(3'h6):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire164,
                 wire159,
                 wire154,
                 wire153,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire99,
                 wire100,
                 wire140,
                 reg167,
                 reg166,
                 reg165,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg152,
                 reg151,
                 reg150,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire99 = wire98;
  assign wire100 = ((8'hac) >> $signed(((~&(wire94 ? wire94 : (8'h9d))) ?
                       $unsigned({wire97}) : wire95[(3'h6):(3'h6)])));
  module101 #() modinst141 (.wire103(wire98), .wire104(wire97), .wire105(wire94), .wire106(wire99), .wire102(wire96), .clk(clk), .y(wire140));
  always
    @(posedge clk) begin
      reg142 <= wire100;
      reg143 <= $signed(wire140);
    end
  assign wire144 = $unsigned(wire95);
  assign wire145 = $unsigned((!{$unsigned(wire98[(4'h9):(2'h2)]),
                       $signed((|wire98))}));
  assign wire146 = wire95;
  assign wire147 = wire98[(3'h4):(2'h2)];
  assign wire148 = ((~&$unsigned($unsigned($signed((8'hb2))))) > (wire98[(3'h5):(2'h3)] ?
                       $unsigned($signed({wire144,
                           wire96})) : ($unsigned($unsigned(wire96)) ?
                           wire94 : {{wire140, wire144},
                               (wire146 ? reg143 : wire94)})));
  assign wire149 = (~^wire94[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg150 <= (~($unsigned(wire100[(3'h7):(1'h0)]) ?
          $unsigned(((wire97 ? wire95 : (8'hb2)) ?
              (~wire144) : (wire145 * wire99))) : ($signed((wire144 ?
                  reg142 : wire98)) ?
              $signed($unsigned(reg142)) : wire100[(3'h5):(1'h0)])));
      reg151 <= ((wire148[(2'h2):(1'h0)] ^~ $unsigned((&(wire147 - (7'h44))))) ?
          wire94[(3'h7):(1'h1)] : $unsigned(reg143));
      reg152 <= $signed($signed(($unsigned(wire100) < $signed(wire95[(3'h4):(1'h0)]))));
    end
  assign wire153 = {$signed(wire144),
                       ($unsigned((~&wire97)) ~^ (^~(wire149 ?
                           wire149[(3'h5):(2'h3)] : $signed(reg150))))};
  assign wire154 = wire96[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg155 <= wire94[(3'h6):(1'h0)];
      reg156 <= ((^((^(|wire99)) << $signed($signed((8'ha1))))) ^ wire140[(5'h11):(4'hb)]);
      reg157 <= (+$signed((reg142[(2'h3):(1'h0)] >> (wire147 && reg155))));
      reg158 <= $unsigned((8'hbf));
    end
  assign wire159 = ({(wire144[(4'he):(4'he)] | $unsigned((wire94 > wire97)))} <<< wire144[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg160 <= reg151;
      reg161 <= ({(reg158[(5'h10):(2'h3)] <<< $unsigned((8'h9e)))} ?
          wire98 : $unsigned((((~wire100) ?
                  wire147[(4'hf):(4'ha)] : reg158[(1'h1):(1'h1)]) ?
              $unsigned($unsigned(wire148)) : {(~&(8'hbc)),
                  wire97[(1'h0):(1'h0)]})));
      reg162 <= $signed(((-$unsigned((-reg150))) ?
          ({$unsigned(wire148)} ?
              $unsigned({wire145,
                  wire146}) : (~|(wire154 || reg157))) : wire159));
      reg163 <= ((wire148[(1'h1):(1'h1)] != {reg162, (8'hb0)}) ?
          (reg160[(2'h3):(2'h2)] * wire148) : reg158);
    end
  assign wire164 = wire97[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg165 <= (wire95[(1'h0):(1'h0)] | reg150);
      reg166 <= wire146;
      reg167 <= ($unsigned($signed((8'ha0))) | wire159[(4'hc):(4'hb)]);
    end
  assign wire168 = (reg167[(4'hc):(4'ha)] != reg157);
  assign wire169 = ($signed(reg162) != $unsigned({((wire94 ? reg156 : wire140) ?
                           (wire95 >= wire148) : (wire94 ? reg160 : wire164)),
                       ((^wire97) ? ((7'h44) << reg165) : $signed(wire100))}));
endmodule

module module4
#(parameter param87 = (~(((+((7'h40) ? (7'h44) : (7'h41))) * (((7'h44) << (8'ha9)) ~^ ((7'h42) ? (8'ha9) : (8'ha6)))) ? (((^(7'h44)) || (+(8'h9c))) ? (+((8'hbb) <<< (8'hbd))) : ({(8'h9e)} ? ((8'hb0) ? (8'hab) : (7'h41)) : ((8'ha9) ? (8'ha7) : (8'hb3)))) : (8'hbf))), 
parameter param88 = param87)
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire85;
  assign y = {wire37,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire39,
                 wire40,
                 wire41,
                 wire85,
                 (1'h0)};
  assign wire9 = $unsigned($signed({wire6}));
  assign wire10 = {(^((wire5 || {wire5}) ~^ wire9[(4'h9):(3'h7)]))};
  assign wire11 = ((+$unsigned($signed(wire9))) ?
                      ($signed(((wire10 - wire9) * wire8[(3'h5):(1'h1)])) > wire8[(4'ha):(3'h5)]) : $unsigned({($signed(wire6) ?
                              (wire9 ? wire5 : wire8) : (wire10 ?
                                  wire5 : (8'had)))}));
  assign wire12 = (&((({wire7, wire9} ? (wire6 ? wire10 : wire6) : wire8) ?
                      $unsigned($unsigned(wire6)) : (8'hb6)) ^~ wire6[(4'hb):(3'h5)]));
  module13 #() modinst38 (.wire16(wire11), .wire14(wire7), .wire18(wire10), .y(wire37), .wire15(wire12), .clk(clk), .wire17(wire8));
  assign wire39 = ((^({$signed(wire8), {wire9, wire6}} ?
                      wire6[(5'h13):(4'hd)] : wire10)) < $unsigned({(!$unsigned(wire7)),
                      $unsigned(((8'hb3) ? (8'hb4) : wire6))}));
  assign wire40 = wire39;
  assign wire41 = (+$signed($unsigned(wire9[(3'h7):(2'h3)])));
  module42 #() modinst86 (.wire47(wire40), .wire45(wire8), .wire46(wire41), .wire43(wire39), .y(wire85), .clk(clk), .wire44(wire37));
endmodule

module module42
#(parameter param84 = {((((!(8'hab)) ? ((8'h9f) << (8'ha7)) : ((8'hb0) - (8'hb6))) ~^ (((8'hb5) ? (8'hb3) : (8'hae)) == (~^(8'hb5)))) != (-((~^(8'haa)) <<< ((7'h44) > (8'hb2)))))})
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  input wire signed [(4'h8):(1'h0)] wire44;
  input wire [(3'h7):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire69,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
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
                 (1'h0)};
  assign wire48 = (($unsigned(wire45[(4'h9):(1'h0)]) ?
                      (^~wire47[(5'h10):(1'h1)]) : wire47) | $unsigned((wire43 ?
                      wire43 : (+$unsigned(wire47)))));
  assign wire49 = (~&(($unsigned(((8'h9d) ?
                          wire44 : (8'hab))) >> wire47[(4'hf):(2'h2)]) ?
                      wire46 : $unsigned((+(wire44 * wire43)))));
  assign wire50 = (+(^$unsigned((^$unsigned(wire44)))));
  assign wire51 = ($signed($unsigned($signed((8'hba)))) ?
                      $unsigned((+($signed(wire46) ?
                          (wire49 ?
                              (8'h9f) : wire50) : $signed(wire49)))) : (($signed((wire46 ?
                                  wire45 : wire49)) ?
                              $unsigned(wire46) : (~|(wire44 ^ wire44))) ?
                          wire49 : (^~wire50[(2'h3):(1'h0)])));
  assign wire52 = {$unsigned(wire51[(1'h1):(1'h1)]),
                      {(^~$unsigned(wire51[(3'h5):(1'h0)]))}};
  assign wire53 = wire44[(3'h7):(1'h0)];
  assign wire54 = $unsigned(((wire45 ^ $unsigned((wire45 < wire53))) ?
                      (($unsigned(wire45) || ((8'h9c) ? wire53 : wire45)) ?
                          $signed((wire52 << (8'hba))) : wire48[(2'h3):(1'h1)]) : wire43));
  assign wire55 = ((wire46 > $signed(wire44[(1'h0):(1'h0)])) ?
                      (({((8'hb0) > wire51),
                          (wire44 ~^ (8'haa))} || (~^(wire49 ?
                          wire46 : wire52))) && {{((8'ha0) - wire44)}}) : $unsigned($signed($unsigned(((8'hb4) ?
                          wire54 : wire47)))));
  assign wire56 = $signed($unsigned(wire51[(1'h0):(1'h0)]));
  assign wire57 = (~^(($unsigned($unsigned(wire47)) == $signed((^wire50))) ?
                      wire50[(3'h4):(2'h3)] : ((8'ha0) ?
                          $unsigned((wire50 < wire52)) : (&$unsigned(wire53)))));
  assign wire58 = wire50;
  always
    @(posedge clk) begin
      reg59 <= wire57[(5'h12):(3'h6)];
      if ({$signed(wire46)})
        begin
          reg60 <= wire47[(4'ha):(1'h1)];
          reg61 <= (^$unsigned(wire44[(2'h2):(2'h2)]));
          if (($unsigned((wire48[(3'h4):(3'h4)] >>> ($unsigned(wire45) == wire52))) ?
              $signed((+((!wire49) <= {(8'h9f)}))) : ((wire45 - ((&wire54) || (&reg60))) ?
                  ((wire43 < $signed(wire48)) <<< reg60) : $signed({reg59}))))
            begin
              reg62 <= ({(($signed(wire44) ?
                              wire43[(3'h4):(1'h1)] : wire51[(3'h7):(3'h7)]) ?
                          (^~$unsigned(wire51)) : (&(reg59 >= reg59))),
                      reg59[(4'h9):(4'h9)]} ?
                  (wire54[(2'h3):(1'h0)] <<< {$signed(wire50),
                      wire56[(3'h7):(2'h3)]}) : ($unsigned($signed(((8'hb7) >= wire44))) == wire46));
              reg63 <= (!(8'hb4));
              reg64 <= ((~^$unsigned($signed((^wire57)))) >= reg61);
            end
          else
            begin
              reg62 <= $signed(wire46);
              reg63 <= (|(($signed((~|(8'hab))) >= $signed((wire45 ?
                      wire56 : wire43))) ?
                  $signed((+wire50)) : $signed(reg60)));
              reg64 <= $unsigned(((reg59[(1'h0):(1'h0)] ?
                  (reg61 ? (wire54 > (8'h9d)) : (-reg63)) : (+{wire47,
                      reg59})) ^~ reg63));
              reg65 <= $unsigned(wire57[(4'h9):(3'h4)]);
              reg66 <= wire57;
            end
          reg67 <= ((!{wire45[(1'h0):(1'h0)]}) >> reg64);
        end
      else
        begin
          if ((reg62[(4'ha):(4'ha)] + reg60[(4'h9):(3'h7)]))
            begin
              reg60 <= {reg63[(3'h4):(1'h1)]};
              reg61 <= {(~&$signed((~^(~|(7'h42)))))};
              reg62 <= reg66;
              reg63 <= wire57[(2'h3):(2'h2)];
            end
          else
            begin
              reg60 <= $signed(reg65);
              reg61 <= $signed(({$signed(wire55)} ?
                  (~&$unsigned((^~(8'had)))) : (~$signed({wire52, wire48}))));
            end
          reg64 <= ({(|reg64[(1'h0):(1'h0)]), (!reg64[(2'h2):(1'h1)])} ?
              reg66[(3'h5):(2'h2)] : (wire54 ?
                  {reg64[(1'h0):(1'h0)]} : $unsigned((wire50 >>> (wire58 >= reg61)))));
        end
      reg68 <= (^~$unsigned($signed((wire47[(5'h12):(3'h6)] ~^ ((8'hbd) ?
          reg61 : reg66)))));
    end
  assign wire69 = (8'hba);
  always
    @(posedge clk) begin
      reg70 <= {$signed((&$unsigned((!reg62)))), reg61[(2'h2):(2'h2)]};
      if (wire50[(1'h1):(1'h1)])
        begin
          if ((&(+{(reg70 ?
                  wire47[(4'hb):(2'h3)] : (wire53 ? wire58 : wire57))})))
            begin
              reg71 <= wire58;
            end
          else
            begin
              reg71 <= wire58;
              reg72 <= ((({{wire45, wire49}} ?
                      wire69[(1'h1):(1'h0)] : (|(reg59 <= reg68))) >= ((+{reg59,
                          reg66}) ?
                      wire53[(3'h7):(2'h3)] : $signed($unsigned(wire43)))) ?
                  wire48[(5'h10):(3'h5)] : reg68);
              reg73 <= $unsigned(reg67[(5'h13):(4'hb)]);
              reg74 <= reg61;
            end
          reg75 <= ((wire56[(2'h2):(1'h1)] + (~&$signed(wire48))) & reg73);
          reg76 <= $signed($signed({reg75}));
        end
      else
        begin
          reg71 <= (($unsigned($unsigned($signed(wire44))) ?
              (|(wire43[(3'h7):(3'h7)] ?
                  $signed(wire46) : (reg66 ?
                      reg67 : wire69))) : $signed(((reg66 ?
                  wire45 : reg68) <= ((8'ha3) && wire52)))) - ($unsigned((~&$signed(reg63))) << wire47[(2'h3):(2'h2)]));
        end
      reg77 <= wire58;
      reg78 <= (~&reg77[(3'h4):(2'h3)]);
    end
  assign wire79 = reg70[(3'h7):(3'h4)];
  assign wire80 = (-{{((wire58 <<< wire47) ?
                              $signed(wire45) : $signed((8'had))),
                          reg66},
                      ($unsigned((reg70 ?
                          wire50 : reg70)) << wire51[(3'h4):(3'h4)])});
  assign wire81 = reg70[(3'h5):(3'h4)];
  assign wire82 = $signed((wire79 ?
                      reg68 : (($unsigned(wire55) ~^ ((8'ha0) ?
                              wire79 : reg72)) ?
                          $unsigned((wire57 ^ reg62)) : $signed((reg66 ?
                              wire58 : wire48)))));
  assign wire83 = wire46[(4'hd):(3'h4)];
endmodule

module module13
#(parameter param35 = (({(+{(8'hac)})} ? {({(8'hbc)} ? ((8'ha1) ^ (8'hb1)) : (8'h9e)), (|(8'h9c))} : (((|(8'hbf)) <<< ((8'ha0) != (8'h9c))) * ({(8'h9c)} >= (8'ha8)))) && (({(~|(8'hab))} ? (+((8'ha6) == (8'hb6))) : ((-(8'ha6)) ? ((8'h9c) <<< (7'h42)) : (-(8'ha2)))) == (((~(8'hb3)) ? ((8'hbd) <= (8'hbf)) : ((8'hbe) < (8'hb4))) + {((8'ha2) != (8'hb6)), ((8'had) <<< (8'hbc))}))), 
parameter param36 = (!({(+(param35 >> param35)), (^(param35 ? param35 : (8'ha8)))} ? param35 : ({param35, ((8'ha3) ^ param35)} - (param35 <<< param35)))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(2'h2):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  assign y = {wire34,
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
                 wire19,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire19 = $signed(((8'ha1) ?
                      $unsigned($signed($signed((8'hb0)))) : $signed(((+wire17) >= wire15[(5'h13):(4'hc)]))));
  assign wire20 = (~&wire18);
  assign wire21 = ((8'ha1) ?
                      $signed({$unsigned((8'hb7)),
                          (~^$signed(wire15))}) : wire20);
  assign wire22 = (8'hae);
  assign wire23 = $signed($signed(($unsigned($unsigned(wire15)) ?
                      ({wire18} || $unsigned(wire19)) : $signed((!wire17)))));
  assign wire24 = wire23;
  assign wire25 = (~((|$unsigned($signed(wire17))) | wire19[(1'h0):(1'h0)]));
  assign wire26 = wire17;
  assign wire27 = $unsigned((wire22[(3'h4):(1'h0)] ?
                      (|(wire14[(1'h1):(1'h0)] ?
                          wire18[(4'h8):(3'h5)] : wire20[(3'h6):(1'h1)])) : (~|((wire14 ?
                              wire25 : (8'ha9)) ?
                          (~|wire18) : $unsigned((8'hb4))))));
  assign wire28 = (^~(|wire19));
  assign wire29 = (wire23[(2'h2):(1'h1)] << ($signed($unsigned(wire20)) >= wire20));
  always
    @(posedge clk) begin
      if ((+(wire25[(4'h8):(2'h3)] ?
          ($signed((wire18 <<< wire20)) ?
              ((!wire18) ?
                  (^~(8'hab)) : wire14[(4'h8):(1'h1)]) : ($unsigned((7'h40)) << (wire22 >>> wire18))) : wire27)))
        begin
          reg30 <= (^$unsigned($signed((~^(wire23 | wire29)))));
          reg31 <= (($signed((^~wire20)) > $unsigned($unsigned($signed((8'h9f))))) | (wire29 ?
              {$unsigned($signed(wire16))} : $signed(wire17)));
          reg32 <= $unsigned($unsigned((({(8'hbd), wire23} & wire28) ?
              $unsigned((wire29 ? wire23 : wire28)) : ((^~wire24) ?
                  {(8'ha6), wire15} : (wire28 ? reg31 : (8'hab))))));
          reg33 <= $unsigned((8'ha8));
        end
      else
        begin
          reg30 <= wire15[(4'he):(4'h9)];
        end
    end
  assign wire34 = $unsigned({(^(&(|wire21))),
                      $unsigned(((wire22 ?
                          (8'hb1) : wire18) + (wire23 && wire17)))});
endmodule

module module101
#(parameter param138 = (&{(8'ha8), (((~&(8'haf)) ? (-(8'hbe)) : (8'hb5)) ? (~&((7'h40) ? (8'hb6) : (8'hb2))) : (((8'ha0) ? (8'hab) : (8'ha6)) <= ((8'hb8) * (8'hb2))))}), 
parameter param139 = (((8'ha5) ? (((|param138) > (param138 << (7'h40))) && ({param138} | (param138 ? (8'haf) : param138))) : ((!param138) << (&{param138, (8'hbb)}))) >>> (({(param138 ? (8'ha2) : (8'hb4)), (param138 || param138)} ? {(param138 ? param138 : param138), ((7'h42) ? param138 : param138)} : ((~param138) ? (param138 || param138) : (param138 ? param138 : param138))) ? (((param138 ? param138 : param138) & param138) * (param138 & {param138, param138})) : ((&(param138 * param138)) | param138))))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire106;
  input wire [(2'h3):(1'h0)] wire105;
  input wire [(4'ha):(1'h0)] wire104;
  input wire signed [(4'hd):(1'h0)] wire103;
  input wire signed [(4'hd):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire137;
  wire signed [(4'h9):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire135;
  wire [(3'h7):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire108;
  wire [(5'h13):(1'h0)] wire107;
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire119,
                 wire118,
                 wire108,
                 wire107,
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
                 reg120,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire107 = wire105[(1'h0):(1'h0)];
  assign wire108 = wire105[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((wire105 && {(wire103 < wire107),
          $unsigned(wire105)}))))
        begin
          if ((($signed((&$signed((8'hbf)))) ? wire105 : $signed(wire104)) ?
              wire102 : (!$signed((8'ha3)))))
            begin
              reg109 <= $unsigned((wire103[(4'h9):(4'h8)] ?
                  ($unsigned($signed(wire108)) ?
                      $unsigned({wire103,
                          wire106}) : wire102[(4'h9):(4'h9)]) : $signed(wire108)));
              reg110 <= {wire105,
                  (($signed($unsigned(wire106)) ^~ {reg109[(1'h0):(1'h0)]}) ?
                      reg109[(3'h5):(1'h0)] : ({$signed(reg109), reg109} ?
                          (^~wire106[(3'h6):(2'h3)]) : wire106[(1'h1):(1'h1)]))};
              reg111 <= wire103[(3'h4):(1'h1)];
              reg112 <= (7'h40);
              reg113 <= reg111[(4'hb):(3'h4)];
            end
          else
            begin
              reg109 <= ({(~&$signed($unsigned(wire103)))} >= $unsigned(wire106[(2'h2):(1'h1)]));
              reg110 <= (~(^wire107[(4'hb):(4'h8)]));
              reg111 <= $signed($signed(wire102[(2'h2):(2'h2)]));
              reg112 <= (!((&{reg113[(5'h11):(1'h0)],
                  (!wire106)}) && $unsigned(wire104[(2'h3):(2'h2)])));
              reg113 <= reg113;
            end
          reg114 <= {$unsigned($unsigned((7'h42)))};
          reg115 <= $signed($unsigned(wire104[(2'h3):(1'h1)]));
          reg116 <= reg110;
        end
      else
        begin
          if ($unsigned((~|({(reg113 ? (8'hb8) : wire106),
              (wire103 ~^ wire105)} << reg111[(5'h13):(4'h9)]))))
            begin
              reg109 <= (8'h9d);
              reg110 <= (((~&$unsigned($unsigned(wire105))) ?
                  (&{(|wire108)}) : ((~wire105[(2'h3):(1'h0)]) ?
                      (~|$unsigned((8'h9d))) : ((reg114 | wire106) ?
                          reg112[(3'h7):(3'h4)] : $unsigned(reg109)))) & (|reg115[(3'h6):(3'h5)]));
            end
          else
            begin
              reg109 <= $signed({(wire104 ?
                      (~(&(8'hb6))) : reg115[(1'h0):(1'h0)])});
              reg110 <= wire107;
              reg111 <= (+((+wire103) * ((~((8'hb6) ? (8'hb9) : (8'hb0))) ?
                  ($signed((8'hb7)) || $unsigned(reg114)) : reg111[(4'h8):(3'h5)])));
            end
          reg112 <= $signed($unsigned((-(&reg109[(1'h1):(1'h1)]))));
          reg113 <= $signed($signed($unsigned(((~|(8'haf)) ?
              (^~wire108) : (~^reg111)))));
        end
      reg117 <= (({(+(wire108 ? wire103 : wire103))} ?
          (~&(&$unsigned((8'hbb)))) : reg116[(3'h7):(3'h6)]) != (+$unsigned((^reg114[(4'he):(2'h3)]))));
    end
  assign wire118 = $unsigned(((~&(reg114[(3'h6):(3'h6)] ?
                       (wire102 - reg115) : (~(8'h9f)))) * $unsigned((!$signed(wire103)))));
  assign wire119 = reg116;
  always
    @(posedge clk) begin
      if ($unsigned((-{{reg111[(3'h6):(1'h1)]},
          ({reg116} ? reg116[(2'h3):(1'h1)] : (^~wire107))})))
        begin
          reg120 <= {{({(8'h9d)} > ({reg113} ?
                      $unsigned(wire108) : reg112[(2'h2):(2'h2)]))},
              wire105};
          reg121 <= {((~|$signed((!reg116))) <<< $unsigned({(wire108 ?
                      reg111 : reg110),
                  wire102})),
              {reg116[(3'h5):(2'h3)],
                  ((reg116[(1'h1):(1'h1)] ?
                      {reg109,
                          wire118} : (!reg112)) <= ($unsigned(wire118) ~^ ((7'h41) ?
                      reg120 : reg110)))}};
          if ((!(+((~(reg116 ? reg117 : reg116)) ?
              reg114[(1'h0):(1'h0)] : (+(reg117 ? (8'hb2) : wire104))))))
            begin
              reg122 <= (-{(~|(^~(reg121 != wire119)))});
            end
          else
            begin
              reg122 <= reg120;
              reg123 <= ($unsigned((&$signed($unsigned(wire105)))) >= reg121[(3'h5):(3'h5)]);
              reg124 <= reg116;
            end
          reg125 <= $signed(wire105);
        end
      else
        begin
          if (reg115[(3'h6):(1'h0)])
            begin
              reg120 <= $unsigned(((reg122[(4'hb):(3'h5)] ?
                      $unsigned((reg122 ?
                          reg121 : reg112)) : reg112[(1'h0):(1'h0)]) ?
                  $unsigned(($signed((8'ha4)) ?
                      $unsigned(wire108) : wire119)) : $signed($signed(wire107))));
              reg121 <= (reg123 ^~ (~&(|(~^(reg112 ^~ wire103)))));
              reg122 <= $signed((!(~&(&(~wire105)))));
              reg123 <= (8'hab);
            end
          else
            begin
              reg120 <= (reg125 ? wire107 : $unsigned((8'hbb)));
              reg121 <= (+{$signed($unsigned($unsigned(wire119))),
                  (reg121[(1'h0):(1'h0)] ?
                      ($signed(wire119) ?
                          (reg109 ?
                              wire118 : reg117) : (^~wire104)) : $signed({reg112}))});
            end
          reg124 <= (~^((8'hb6) || $signed($unsigned((reg109 != reg113)))));
          if ($signed($unsigned((~|reg116))))
            begin
              reg125 <= $signed(($signed({(!wire102)}) <<< ($signed({reg114}) ?
                  ($signed((7'h43)) | ((8'haf) * reg122)) : $signed(wire102))));
              reg126 <= $unsigned($signed(wire102[(4'hb):(4'h9)]));
              reg127 <= (^({((wire107 ?
                          wire119 : reg116) >>> (reg112 && wire105))} ?
                  ((!$unsigned(wire106)) ?
                      reg126 : ((reg122 && wire118) && (|reg124))) : reg122));
            end
          else
            begin
              reg125 <= ({reg127[(4'hc):(3'h7)]} ?
                  $unsigned((!$unsigned({(7'h44), reg121}))) : reg112);
              reg126 <= $unsigned((reg109 >= ({(reg113 ^~ reg117)} ^~ (((7'h41) > reg110) != $signed(reg114)))));
              reg127 <= wire119[(3'h6):(3'h4)];
              reg128 <= ($signed(reg109[(4'h9):(1'h0)]) & (8'ha9));
              reg129 <= reg123[(1'h0):(1'h0)];
            end
        end
      reg130 <= reg129;
      reg131 <= $signed(reg125);
      reg132 <= (($signed((&(reg111 ? wire106 : (8'hb6)))) ?
              (!((!wire108) && reg130)) : reg109) ?
          {($signed(reg114[(4'hd):(4'hb)]) && {(wire104 ? (8'ha2) : (8'had)),
                  (~&wire104)}),
              (~^reg112)} : $unsigned(wire105));
      reg133 <= (~|($unsigned($signed((reg127 ? wire119 : reg130))) ?
          $unsigned(reg113[(1'h1):(1'h1)]) : (((!wire103) ?
                  (wire118 ? reg120 : wire105) : ((8'h9e) ? reg129 : (8'hb6))) ?
              reg123 : {reg123, wire106[(2'h3):(1'h1)]})));
    end
  assign wire134 = ((wire118 ?
                       wire108 : reg120[(3'h4):(2'h2)]) >>> (reg123[(3'h4):(1'h0)] ?
                       (~&(reg131[(3'h5):(3'h5)] ?
                           {(8'ha3), reg127} : (wire119 ?
                               wire104 : reg129))) : $unsigned(wire107)));
  assign wire135 = wire118;
  assign wire136 = $unsigned($signed(reg126[(2'h2):(1'h0)]));
  assign wire137 = reg124[(2'h2):(2'h2)];
endmodule
