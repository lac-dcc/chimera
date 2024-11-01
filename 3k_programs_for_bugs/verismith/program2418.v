module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire245;
  wire [(2'h3):(1'h0)] wire244;
  wire [(4'h8):(1'h0)] wire233;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire231;
  reg [(4'h8):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg240 = (1'h0);
  reg [(2'h3):(1'h0)] reg239 = (1'h0);
  reg [(2'h2):(1'h0)] reg238 = (1'h0);
  reg [(4'hb):(1'h0)] reg237 = (1'h0);
  reg [(5'h12):(1'h0)] reg236 = (1'h0);
  reg [(3'h6):(1'h0)] reg235 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg234 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire245,
                 wire244,
                 wire233,
                 wire5,
                 wire120,
                 wire122,
                 wire123,
                 wire231,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1[(1'h0):(1'h0)];
    end
  assign wire5 = wire3;
  module6 #() modinst121 (.wire8(wire0), .wire10(wire3), .wire9(wire1), .wire7(wire5), .y(wire120), .clk(clk));
  assign wire122 = (($unsigned((|((8'ha0) && wire5))) != wire2[(1'h0):(1'h0)]) > ($unsigned((^~wire0)) - $unsigned($signed($unsigned(reg4)))));
  assign wire123 = $signed($unsigned((((wire1 ^~ wire120) <<< (~^reg4)) << ((^wire2) ^ $unsigned(wire1)))));
  always
    @(posedge clk) begin
      reg124 <= ((~|{$unsigned(wire120[(3'h7):(3'h7)])}) != (((~(wire1 ?
              wire123 : wire1)) ?
          {{wire0, reg4}} : {wire123, wire120}) ^~ wire2[(1'h0):(1'h0)]));
      if ($signed({reg124[(3'h4):(2'h2)]}))
        begin
          if (((-(wire5[(2'h3):(2'h2)] <<< (((8'h9e) ?
                  wire122 : wire2) - (wire1 ? wire2 : wire1)))) ?
              {wire5} : wire3[(5'h10):(4'h9)]))
            begin
              reg125 <= wire122[(3'h4):(2'h3)];
              reg126 <= wire122;
              reg127 <= {wire123,
                  ((|$unsigned((wire0 ? wire2 : wire120))) * (($signed(reg126) ?
                      (wire3 ? reg4 : wire0) : {wire5, reg124}) ^~ wire0))};
            end
          else
            begin
              reg125 <= ((~|$signed(wire120[(4'hb):(1'h1)])) >= (reg124 ?
                  {$unsigned(wire0)} : (^~$unsigned((~^wire1)))));
              reg126 <= reg125;
              reg127 <= (wire1[(3'h6):(1'h0)] ?
                  {$signed(((&wire3) ?
                          (reg127 ? wire0 : reg127) : {reg125, reg4})),
                      (($unsigned(reg4) ?
                          (reg124 ~^ (8'ha5)) : $unsigned(wire0)) << $unsigned((wire2 | reg4)))} : reg127);
              reg128 <= $signed(reg126[(2'h3):(2'h3)]);
            end
          reg129 <= reg125;
          reg130 <= $unsigned(($unsigned((|reg124)) ?
              (((wire2 >= reg128) < (|reg124)) << $unsigned((reg129 * reg128))) : (reg4[(2'h3):(2'h3)] ^ $unsigned((reg4 ?
                  (8'h9f) : reg125)))));
          reg131 <= wire123[(4'ha):(2'h2)];
          reg132 <= (reg127 ?
              (((8'hab) > ((8'hbe) && (reg124 <<< reg127))) - ($unsigned($unsigned(reg4)) ~^ wire3[(4'h9):(4'h8)])) : wire120);
        end
      else
        begin
          reg125 <= $signed(((|$signed(wire1)) ?
              reg4[(2'h3):(1'h0)] : ($signed(reg132) ?
                  reg124[(1'h0):(1'h0)] : (~&(reg131 ? wire3 : wire5)))));
        end
    end
  module133 #() modinst232 (.wire135(wire3), .y(wire231), .clk(clk), .wire137(reg132), .wire136(reg131), .wire138(reg4), .wire134(reg125));
  assign wire233 = (($unsigned(wire122) ^ {((~reg127) ? (^~(7'h40)) : {reg126}),
                           (wire231[(2'h2):(2'h2)] >> $unsigned((8'hb3)))}) ?
                       ((!wire120) ?
                           (((8'ha8) && ((8'ha9) ?
                               reg124 : (8'hbc))) | reg130[(2'h2):(1'h0)]) : wire3[(3'h4):(1'h0)]) : ($signed($unsigned((reg4 ?
                           wire123 : wire3))) > (~|reg125)));
  always
    @(posedge clk) begin
      reg234 <= wire233;
      if ((8'hb9))
        begin
          reg235 <= wire0;
          reg236 <= reg132[(3'h5):(1'h1)];
          reg237 <= ($signed(reg128) ?
              ($unsigned((reg131 ? (|wire3) : $unsigned(wire0))) ?
                  ($unsigned((reg127 & wire1)) ?
                      ((wire120 ?
                          (7'h44) : reg129) ^~ reg126[(1'h1):(1'h0)]) : $unsigned(reg124[(2'h2):(1'h1)])) : {(reg4[(2'h3):(1'h0)] || ((8'hb7) <<< reg130))}) : reg128[(3'h7):(3'h7)]);
          reg238 <= ((^~wire122[(3'h6):(1'h0)]) ? {reg237} : wire1);
        end
      else
        begin
          if (wire123[(3'h6):(2'h3)])
            begin
              reg235 <= (~&((^~$signed(reg126)) ?
                  {(8'hb1)} : (~^((+reg126) > (reg235 | wire1)))));
            end
          else
            begin
              reg235 <= reg125[(4'hb):(3'h6)];
              reg236 <= $unsigned(((($unsigned((8'h9e)) != reg237) ?
                      $signed((reg234 ?
                          reg129 : wire122)) : $unsigned((8'hb3))) ?
                  ($signed($unsigned((8'hbb))) <<< reg127[(4'h8):(1'h1)]) : ((reg237 ^ (!reg235)) >>> (|$signed(wire233)))));
            end
          reg237 <= reg131[(4'hc):(1'h0)];
          if ($unsigned((reg238[(1'h1):(1'h0)] ?
              $unsigned(reg237[(3'h7):(3'h5)]) : reg131[(3'h7):(3'h5)])))
            begin
              reg238 <= $signed(wire233);
              reg239 <= (&reg238[(1'h0):(1'h0)]);
              reg240 <= ($signed($unsigned(($signed(reg124) >> (!wire231)))) >>> (reg237 ?
                  (((reg125 ? (8'hb5) : wire123) & $unsigned(reg234)) ?
                      (reg129 == (!reg235)) : (reg128[(1'h0):(1'h0)] <= $signed(reg124))) : (reg129 * wire122[(3'h5):(1'h0)])));
            end
          else
            begin
              reg238 <= {$unsigned(($unsigned((!wire2)) < wire3[(4'hf):(4'ha)]))};
              reg239 <= reg4[(3'h6):(3'h6)];
              reg240 <= (8'h9e);
              reg241 <= (|{reg125[(4'he):(1'h1)], reg237[(3'h7):(2'h3)]});
            end
        end
      reg242 <= ((!(&$unsigned($unsigned(reg124)))) ?
          reg235 : (($unsigned((reg237 && wire231)) && $signed((-(7'h44)))) - reg126[(2'h2):(2'h2)]));
      reg243 <= (~reg125[(3'h4):(2'h3)]);
    end
  assign wire244 = $signed((reg132 ?
                       wire5 : ((8'hbd) + (-(reg243 ? (8'hac) : (8'ha3))))));
  assign wire245 = (reg242[(4'ha):(3'h7)] ?
                       $unsigned((+$unsigned($signed(reg132)))) : reg242[(2'h3):(1'h1)]);
endmodule

module module133  (y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire138;
  input wire [(2'h3):(1'h0)] wire137;
  input wire [(4'hd):(1'h0)] wire136;
  input wire [(4'ha):(1'h0)] wire135;
  input wire signed [(5'h13):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire230;
  wire [(4'ha):(1'h0)] wire229;
  wire [(5'h10):(1'h0)] wire221;
  wire signed [(4'he):(1'h0)] wire220;
  wire signed [(5'h15):(1'h0)] wire176;
  wire [(4'hd):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire218;
  reg signed [(4'hb):(1'h0)] reg228 = (1'h0);
  reg [(4'h9):(1'h0)] reg227 = (1'h0);
  reg [(5'h14):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg224 = (1'h0);
  reg [(5'h15):(1'h0)] reg223 = (1'h0);
  reg [(5'h10):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  assign y = {wire230,
                 wire229,
                 wire221,
                 wire220,
                 wire176,
                 wire141,
                 wire140,
                 wire139,
                 wire218,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 (1'h0)};
  assign wire139 = wire135[(2'h3):(2'h3)];
  assign wire140 = (&$unsigned((((wire138 ^ wire137) ?
                       $signed(wire136) : {wire138}) * ((-wire135) ~^ (wire135 ?
                       (8'h9c) : wire134)))));
  assign wire141 = $signed($signed((~&$signed((wire140 ? wire136 : wire136)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire139[(2'h2):(1'h0)]))
        begin
          reg142 <= $signed(wire138);
          reg143 <= (-reg142[(4'h8):(4'h8)]);
          if ($signed(wire139))
            begin
              reg144 <= (~^$signed($unsigned((wire136[(2'h2):(2'h2)] ?
                  ((8'ha9) ? wire134 : wire137) : (7'h44)))));
              reg145 <= (~^{$unsigned((wire136[(3'h4):(1'h0)] ?
                      (wire141 ? reg143 : wire138) : (reg143 - wire137))),
                  reg144});
              reg146 <= (&($signed({$signed(reg143)}) ?
                  wire138 : ({$signed(wire135)} ? reg142 : (!(~&wire138)))));
              reg147 <= (((wire134[(1'h1):(1'h1)] ?
                      wire137 : (|((8'hbc) ? wire137 : wire138))) ?
                  wire141 : wire139[(2'h3):(1'h1)]) | (|$signed((reg142[(3'h5):(3'h4)] ^ reg146))));
            end
          else
            begin
              reg144 <= reg146;
              reg145 <= $unsigned((-$unsigned((-wire137[(1'h1):(1'h0)]))));
              reg146 <= (8'h9c);
              reg147 <= ({((|(wire136 == wire140)) ?
                      (~|wire138[(2'h2):(1'h0)]) : $signed($unsigned(reg146))),
                  (~((reg147 ? (8'hb9) : wire135) ?
                      {(8'hab), wire139} : reg146))} && reg147);
            end
          reg148 <= (-$signed((($unsigned(wire138) ?
                  (wire138 ? reg146 : reg144) : wire135[(4'ha):(4'h8)]) ?
              ((^(8'hb9)) ? {reg146} : (^~wire137)) : (~(wire136 * reg143)))));
          reg149 <= reg146[(2'h2):(2'h2)];
        end
      else
        begin
          reg142 <= (&reg149[(1'h1):(1'h1)]);
          reg143 <= (|wire141[(4'ha):(3'h7)]);
        end
      reg150 <= reg146;
      reg151 <= $signed((~^($unsigned($unsigned(reg146)) < (wire135 ?
          wire137 : $unsigned(reg148)))));
      reg152 <= (~&((reg151 ?
          $unsigned(wire141) : ((^~wire136) ?
              (|reg145) : ((8'had) || (7'h42)))) ^~ ((+(wire135 ?
              wire139 : reg142)) ?
          ((~|(8'hab)) ?
              $unsigned(reg148) : (wire141 ?
                  wire135 : reg148)) : reg151[(3'h6):(3'h5)])));
    end
  module153 #() modinst177 (wire176, clk, wire135, reg143, reg151, reg142);
  module178 #() modinst219 (wire218, clk, wire139, wire138, wire140, reg146, reg147);
  assign wire220 = wire135;
  assign wire221 = wire220;
  always
    @(posedge clk) begin
      if ($unsigned(((~^$signed((wire137 | wire139))) && wire139[(3'h5):(1'h1)])))
        begin
          reg222 <= ((~&reg150) > $unsigned($signed($signed(wire176))));
        end
      else
        begin
          if ($unsigned((reg143 ^~ {(^~wire141[(3'h7):(1'h0)])})))
            begin
              reg222 <= (^wire218);
              reg223 <= $unsigned((reg148[(3'h6):(2'h3)] ?
                  {((~^reg147) ? reg145 : ((8'hb9) ? wire135 : wire135)),
                      $signed($signed(wire138))} : $unsigned($unsigned(reg147[(3'h5):(3'h5)]))));
            end
          else
            begin
              reg222 <= (reg223[(3'h4):(2'h2)] >>> {{$signed((&(8'hae))),
                      reg151},
                  $unsigned((|(reg150 ? reg152 : wire220)))});
              reg223 <= (!wire176);
              reg224 <= ($unsigned((8'h9f)) >>> wire221);
              reg225 <= (wire140 ? reg149 : $unsigned(wire136));
            end
          reg226 <= {wire139};
          reg227 <= (8'hbc);
        end
    end
  always
    @(posedge clk) begin
      reg228 <= (({{{reg144}},
              reg150[(3'h5):(1'h1)]} < $unsigned($signed(reg147))) ?
          reg225[(1'h1):(1'h0)] : $unsigned(((reg145 ^~ (wire220 && reg223)) ^ reg149)));
    end
  assign wire229 = wire138[(3'h7):(2'h3)];
  assign wire230 = ((($unsigned(((8'haf) ? reg152 : wire221)) ^ (&wire220)) ?
                       (~reg222[(4'ha):(3'h7)]) : {$unsigned(reg149)}) & (reg148 ?
                       ((~|(reg144 * reg227)) ?
                           (|$signed(reg225)) : (reg225 == wire141)) : (wire141 ?
                           $signed($unsigned(reg144)) : ((+wire176) - wire141[(2'h2):(1'h0)]))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire76;
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire116,
                 wire86,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire76,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg79,
                 reg83,
                 reg84,
                 reg85,
                 (1'h0)};
  assign wire11 = (wire8 >= ($signed(wire10) >= (wire7 ?
                      $signed($signed(wire7)) : $signed((wire7 ^~ (8'hb4))))));
  assign wire12 = {{(&((wire7 ? wire11 : (8'hbd)) + (wire11 > wire9))),
                          (-((^(8'h9f)) << {wire11}))}};
  assign wire13 = wire12[(4'h8):(3'h7)];
  assign wire14 = (!$unsigned($unsigned($signed((7'h44)))));
  assign wire15 = (~^(~^((~wire11) << (~^wire10[(1'h1):(1'h0)]))));
  assign wire16 = wire13[(3'h6):(2'h2)];
  assign wire17 = $signed($signed((((wire9 ? wire13 : wire14) <= (wire12 ?
                          wire11 : wire10)) ?
                      (wire9[(1'h1):(1'h0)] ?
                          $unsigned(wire11) : {wire14,
                              wire12}) : (wire15[(2'h2):(2'h2)] ?
                          wire16 : wire15))));
  assign wire18 = (^{$signed(((!(8'ha5)) << wire10)),
                      $signed($signed({wire15, wire16}))});
  assign wire19 = $signed((wire10[(2'h3):(1'h0)] ^ $signed((+{wire12}))));
  always
    @(posedge clk) begin
      if (wire10[(3'h4):(2'h2)])
        begin
          if ($signed($unsigned($signed(wire16))))
            begin
              reg20 <= (($signed($signed($signed(wire18))) ?
                  wire16 : ($unsigned($signed(wire17)) != (~|wire8[(2'h3):(1'h1)]))) <= ($signed(wire19[(3'h4):(2'h3)]) ^ wire19[(3'h6):(3'h4)]));
              reg21 <= (({{(wire7 ? (8'hb9) : wire8)}} ^ (wire9 << (8'hbc))) ?
                  ($signed((wire11[(3'h4):(1'h1)] ?
                          $unsigned(wire18) : (wire12 ? wire16 : wire8))) ?
                      (wire18[(4'h9):(3'h5)] != {wire15,
                          (wire9 != (8'hbf))}) : wire17) : {wire18[(3'h4):(1'h0)]});
            end
          else
            begin
              reg20 <= $unsigned($signed(($unsigned($signed(wire7)) ?
                  $signed(wire12[(3'h4):(1'h1)]) : wire16[(4'h9):(3'h6)])));
            end
        end
      else
        begin
          if ((wire12[(4'hc):(4'h9)] <<< (^~$signed({wire10,
              wire8[(2'h2):(1'h1)]}))))
            begin
              reg20 <= wire13;
            end
          else
            begin
              reg20 <= wire14;
            end
          reg21 <= reg21;
          reg22 <= reg21;
          reg23 <= ($unsigned((~^(wire17[(2'h3):(1'h1)] * (reg22 ?
                  wire12 : wire10)))) ?
              ($unsigned(((wire17 >= (8'ha4)) ?
                  reg21[(3'h4):(2'h2)] : $unsigned(wire18))) == {($unsigned((8'ha1)) ?
                      wire9[(2'h2):(2'h2)] : reg22[(1'h1):(1'h1)])}) : reg22);
        end
      reg24 <= $unsigned({wire14[(1'h1):(1'h0)],
          (wire8 && ((wire16 >> (8'ha4)) ? $unsigned((8'hbe)) : (!wire11)))});
    end
  module25 #() modinst77 (wire76, clk, wire11, reg20, wire13, wire16);
  assign wire78 = wire76[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg79 <= wire9;
    end
  assign wire80 = (($unsigned({wire19}) ?
                      reg20 : {reg21[(4'hc):(3'h7)],
                          $signed((-wire8))}) == wire76);
  assign wire81 = $signed($unsigned((+($signed(wire78) < wire10))));
  assign wire82 = $unsigned(wire8);
  always
    @(posedge clk) begin
      reg83 <= wire82;
      reg84 <= $unsigned($unsigned({(~|$unsigned(reg23))}));
      reg85 <= $signed($signed(wire13[(4'ha):(3'h6)]));
    end
  assign wire86 = wire9[(3'h6):(3'h4)];
  module87 #() modinst117 (.wire88(reg23), .y(wire116), .wire90(wire81), .wire91(wire19), .clk(clk), .wire92(wire82), .wire89(wire12));
  assign wire118 = {((^({reg24, wire16} ?
                           reg24[(1'h0):(1'h0)] : reg79[(3'h6):(3'h6)])) <<< (wire18[(3'h4):(2'h3)] ?
                           ((-reg79) ?
                               wire8[(1'h1):(1'h0)] : wire7[(1'h1):(1'h1)]) : ({(8'ha0),
                                   (8'h9c)} ?
                               {wire14} : (wire81 - wire116))))};
  assign wire119 = (~(reg24 + $signed($unsigned({reg79}))));
endmodule

module module87
#(parameter param115 = (!(((((8'hb6) ? (8'haa) : (8'ha5)) ? ((7'h40) ? (8'hbc) : (8'ha0)) : {(8'ha9), (8'ha8)}) ? (^(8'hbe)) : (((8'ha3) && (8'hbc)) ? {(8'h9e)} : (~(7'h41)))) < ({(&(8'hac))} ? (|{(7'h41), (8'hb8)}) : (((8'hba) ? (8'haf) : (7'h42)) ~^ ((8'ha9) ? (8'ha2) : (8'hbb)))))))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire92;
  input wire signed [(4'hf):(1'h0)] wire91;
  input wire [(2'h2):(1'h0)] wire90;
  input wire signed [(5'h13):(1'h0)] wire89;
  input wire signed [(4'ha):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire93;
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire96,
                 wire95,
                 wire93,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg94,
                 (1'h0)};
  assign wire93 = wire88;
  always
    @(posedge clk) begin
      reg94 <= wire92;
    end
  assign wire95 = $unsigned($unsigned(({$signed(reg94),
                      {reg94}} && (~^$unsigned(wire93)))));
  assign wire96 = reg94[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg97 <= wire93;
      if ($unsigned(((($unsigned((8'hb0)) ?
          $signed(wire89) : wire91[(1'h1):(1'h0)]) >= $unsigned(wire93[(2'h2):(2'h2)])) << $unsigned($signed($unsigned(wire96))))))
        begin
          reg98 <= (wire93 ?
              ((&(8'hbf)) ?
                  {wire96, wire95[(2'h2):(1'h1)]} : (~&((wire95 ?
                          wire91 : wire93) ?
                      (reg94 ?
                          reg97 : wire93) : (reg97 != wire91)))) : {$unsigned($unsigned(reg97[(1'h0):(1'h0)])),
                  ((wire95 >> {wire91}) ?
                      (~|wire96) : {$unsigned(wire89), wire96})});
        end
      else
        begin
          reg98 <= $signed(wire91[(2'h3):(1'h1)]);
          if (wire96[(2'h2):(1'h1)])
            begin
              reg99 <= ($signed(reg98[(4'hb):(1'h1)]) <<< wire90);
              reg100 <= (~wire96);
            end
          else
            begin
              reg99 <= reg94;
              reg100 <= wire91;
            end
          if ($signed($signed({wire89[(2'h3):(2'h3)]})))
            begin
              reg101 <= reg100;
              reg102 <= wire89[(4'h8):(3'h5)];
              reg103 <= (~^(!{$signed(wire91)}));
            end
          else
            begin
              reg101 <= reg100;
              reg102 <= (wire95[(3'h5):(1'h1)] << (|wire90[(1'h1):(1'h1)]));
              reg103 <= ($signed((((8'hb0) >> $signed(wire93)) ?
                  $unsigned((wire89 ? reg94 : reg100)) : reg94)) != (8'ha6));
            end
        end
      reg104 <= (&(7'h40));
      reg105 <= reg99[(2'h3):(2'h2)];
    end
  assign wire106 = ((wire89 == ((!reg99[(1'h0):(1'h0)]) ?
                       ((wire91 ? (8'h9d) : reg105) ?
                           {(8'hae)} : $signed(reg105)) : ((wire92 ?
                               wire92 : reg98) ?
                           {reg98} : {reg94}))) <= {((^reg99) || ({reg103,
                           reg105} && (wire93 ? reg98 : wire95))),
                       ((((8'ha3) ~^ reg103) ?
                           $unsigned((8'hb1)) : $signed(reg97)) && (reg94[(2'h3):(2'h3)] ^~ reg105))});
  assign wire107 = (!wire106);
  assign wire108 = $signed(wire88[(3'h5):(2'h2)]);
  assign wire109 = (((8'hb3) ?
                           $unsigned(wire93[(2'h3):(1'h1)]) : $signed(wire88[(3'h7):(3'h7)])) ?
                       ((reg99 ? (^reg102) : wire106) ?
                           (($signed(wire95) ?
                               {wire96} : reg105) == (reg94 ^~ $unsigned(reg105))) : reg94[(3'h5):(2'h3)]) : wire106[(5'h14):(5'h14)]);
  assign wire110 = {(&reg105[(1'h0):(1'h0)]),
                       (wire107[(2'h3):(1'h1)] ?
                           reg97[(1'h1):(1'h1)] : (wire90[(1'h1):(1'h0)] ?
                               $unsigned((reg99 + reg97)) : reg104))};
  assign wire111 = $signed(wire92);
  assign wire112 = $unsigned($unsigned($signed(((reg104 ?
                       reg100 : wire106) <<< (reg101 ^~ reg105)))));
  assign wire113 = reg103;
  assign wire114 = (8'hac);
endmodule

module module25
#(parameter param74 = {((({(7'h44)} ? {(8'h9e)} : ((8'hbe) <= (8'hb0))) ? {{(8'hb8), (8'hb4)}} : (+{(8'hab), (8'hbb)})) ? (((^(8'hb5)) ? ((8'haa) ? (8'hac) : (8'ha2)) : {(8'h9c), (8'hb4)}) & (+{(7'h40), (8'hb4)})) : ((~&{(8'ha2), (8'hb2)}) ? (((8'ha1) * (8'ha1)) ? ((8'haa) - (8'ha8)) : (-(8'hb2))) : (~&((8'h9f) > (8'hb7))))), ((({(8'hbd)} - ((7'h40) ? (8'hbb) : (8'hb9))) ? ((^(8'hb9)) >>> ((8'ha9) < (8'ha1))) : (~^(~|(8'hbf)))) ? (!{((8'hb7) ? (7'h42) : (8'hb9))}) : (({(8'h9e), (8'ha3)} ? ((8'ha5) & (8'had)) : ((8'ha0) ? (8'h9d) : (8'hba))) == (~^(~(8'ha5)))))}, 
parameter param75 = param74)
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire29;
  input wire signed [(2'h2):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
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
  always
    @(posedge clk) begin
      reg30 <= (((^~$signed($unsigned((8'hb8)))) ?
              ((wire29[(2'h2):(1'h1)] ?
                  (wire26 << wire29) : (8'hb1)) || (^~$unsigned(wire29))) : wire26[(4'h8):(2'h3)]) ?
          (|wire27[(2'h3):(1'h1)]) : $unsigned(($signed((wire28 >>> wire28)) || ((&wire26) ?
              $signed(wire29) : (~&wire26)))));
      reg31 <= reg30[(1'h1):(1'h1)];
      if (reg30[(1'h0):(1'h0)])
        begin
          if (wire26)
            begin
              reg32 <= wire26[(4'hb):(4'ha)];
            end
          else
            begin
              reg32 <= ($unsigned(wire27[(4'hc):(1'h1)]) ?
                  wire29[(4'ha):(1'h0)] : (!(wire28 ?
                      ($unsigned(reg32) ?
                          (reg31 ~^ reg32) : reg32) : (wire28 ~^ $unsigned(reg32)))));
              reg33 <= (-($unsigned({$signed(wire26)}) ?
                  {{$unsigned((8'hb5))}} : reg31));
            end
          reg34 <= $signed($unsigned($signed(wire28[(2'h2):(1'h0)])));
          if ((~&reg31[(2'h3):(1'h0)]))
            begin
              reg35 <= (~$signed($signed((~^(8'hae)))));
            end
          else
            begin
              reg35 <= $signed($unsigned((reg30[(3'h5):(1'h1)] | $signed((~(8'ha8))))));
              reg36 <= reg34;
            end
          reg37 <= (!((-(|(reg34 >> reg35))) ?
              $unsigned(((8'hb9) ?
                  wire29[(3'h6):(3'h5)] : (^reg35))) : {$unsigned(reg30)}));
        end
      else
        begin
          reg32 <= ((wire29[(4'he):(4'he)] ?
                  $unsigned($unsigned({wire28})) : ({$unsigned(wire28)} & $signed(wire28))) ?
              wire26 : (reg36 ?
                  wire29[(4'h9):(1'h1)] : (~wire27[(4'ha):(1'h1)])));
          if (reg34)
            begin
              reg33 <= (^$signed(wire29));
              reg34 <= (~$signed({reg36}));
            end
          else
            begin
              reg33 <= $unsigned($unsigned((reg30 ?
                  wire29 : {(&wire27), reg32[(2'h3):(2'h2)]})));
              reg34 <= ((^~(reg31 ?
                      {reg36[(4'h8):(3'h5)],
                          $signed(reg33)} : reg31[(4'ha):(1'h0)])) ?
                  $unsigned($unsigned($unsigned($unsigned(wire29)))) : (wire28[(1'h0):(1'h0)] != $unsigned($unsigned(((7'h40) ?
                      wire29 : reg36)))));
              reg35 <= wire26;
              reg36 <= ((!((wire28 ? (reg32 ^ wire28) : {reg34, reg36}) ?
                  (^$unsigned(reg32)) : (((8'had) ?
                      (8'ha2) : reg33) >> wire26[(3'h5):(2'h3)]))) * wire28);
              reg37 <= reg34;
            end
          reg38 <= ($unsigned((reg33 ?
              $unsigned(wire29[(2'h2):(1'h1)]) : reg33)) | {$unsigned(reg31),
              reg34});
          if ($signed((^(^~((~|reg35) >= reg36)))))
            begin
              reg39 <= reg35[(4'h9):(1'h0)];
              reg40 <= reg32[(2'h2):(1'h1)];
              reg41 <= (~^reg31);
            end
          else
            begin
              reg39 <= (reg35 ?
                  reg32[(2'h3):(1'h1)] : (&(reg32 ?
                      (~^$signed(wire28)) : {(wire29 ? reg34 : reg32),
                          $signed(reg30)})));
              reg40 <= reg31;
              reg41 <= wire26[(5'h14):(4'he)];
            end
        end
    end
  assign wire42 = (($signed({((8'hbf) << reg40),
                      (~&(8'ha3))}) <<< $signed((&(reg36 ?
                      reg33 : reg35)))) ^~ $unsigned((wire27 < $signed($signed((7'h44))))));
  assign wire43 = ((^reg35[(4'hd):(3'h7)]) ?
                      ($unsigned((reg33[(4'he):(4'hb)] >= reg30)) ?
                          $signed({((8'hba) ? reg41 : reg36),
                              $unsigned(reg37)}) : ((reg39 ?
                              reg35[(3'h6):(1'h1)] : (~(8'hac))) < reg41)) : (&($signed((wire29 <<< wire26)) <= ($signed(wire29) ?
                          $signed(reg37) : $unsigned(wire26)))));
  assign wire44 = ((8'hb2) ~^ {({(wire43 <= wire28), wire43[(1'h0):(1'h0)]} ?
                          ((reg39 ? wire42 : wire29) ?
                              reg32[(3'h4):(1'h1)] : (reg38 ?
                                  (8'haa) : (8'hbb))) : reg34[(3'h4):(2'h3)]),
                      ((reg31[(2'h3):(2'h2)] <<< (reg35 ~^ (8'ha0))) && (reg40[(3'h4):(3'h4)] ?
                          (^~wire42) : $signed((8'haa))))});
  assign wire45 = $unsigned(reg38);
  assign wire46 = $unsigned((7'h40));
  assign wire47 = $unsigned($signed({(reg39 ?
                          $unsigned(wire44) : $unsigned((8'ha3)))}));
  assign wire48 = $signed($unsigned((8'ha2)));
  assign wire49 = $unsigned($unsigned(((8'hbd) ^~ $unsigned((-reg40)))));
  assign wire50 = (-$unsigned(reg37));
  assign wire51 = $unsigned((wire48 & reg39[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg52 <= ((8'hb4) || (|((~|wire42[(3'h4):(2'h3)]) * {$unsigned(wire51)})));
      reg53 <= wire48;
      if (((reg37[(4'h8):(1'h0)] ? (7'h43) : reg36) ^ (($signed((8'ha8)) ?
          $unsigned(reg31[(3'h7):(3'h5)]) : {$signed(reg40)}) + (+((|reg30) ?
          {(7'h40)} : (8'hbc))))))
        begin
          reg54 <= (7'h44);
        end
      else
        begin
          if ((wire48[(4'h9):(4'h9)] ?
              {$unsigned((~|wire28))} : $signed(reg37[(4'h9):(4'h8)])))
            begin
              reg54 <= $unsigned({(^~(~&reg54))});
              reg55 <= $unsigned((~|$signed((reg54[(4'hd):(4'hb)] ?
                  reg33 : (wire45 ? reg35 : reg37)))));
              reg56 <= ($signed(reg32) ?
                  $signed(({(8'h9c)} ? {(~&reg52)} : {(+(8'hb9))})) : wire42);
              reg57 <= wire46;
            end
          else
            begin
              reg54 <= ((reg39 ?
                  (reg31[(4'ha):(4'ha)] < $signed({reg57,
                      reg34})) : reg38) - $signed(wire49[(4'hc):(4'hb)]));
              reg55 <= (reg38[(3'h5):(1'h1)] ? (8'ha9) : reg34[(3'h5):(3'h5)]);
              reg56 <= wire42;
              reg57 <= $unsigned(reg34);
              reg58 <= {$signed(wire27[(3'h6):(3'h6)]), reg54[(5'h10):(1'h1)]};
            end
          reg59 <= (~($unsigned(reg41) ?
              $signed((reg35 ?
                  $unsigned(reg53) : (reg41 ? (7'h40) : wire43))) : wire47));
          reg60 <= (reg58 * (~|(8'hbc)));
          reg61 <= reg40;
        end
    end
  always
    @(posedge clk) begin
      reg62 <= reg59;
      reg63 <= reg41;
      reg64 <= (reg57[(4'hb):(3'h4)] >= reg36[(1'h0):(1'h0)]);
    end
  assign wire65 = (8'ha0);
  assign wire66 = $unsigned(((($signed(reg62) >>> {reg33,
                      reg53}) >> ($unsigned(reg58) >> wire27[(3'h4):(2'h3)])) <<< reg60));
  assign wire67 = $unsigned({(($signed(reg58) >>> $signed(wire43)) ?
                          wire28 : $unsigned(wire45)),
                      {((^wire65) ? $signed(reg64) : wire42), reg55}});
  assign wire68 = (($unsigned($unsigned(reg33)) != $signed((^~reg41[(5'h10):(3'h5)]))) == (8'ha8));
  assign wire69 = ($unsigned(wire42) ? reg39 : reg56[(3'h4):(1'h0)]);
  assign wire70 = (!((reg55[(4'hf):(3'h7)] ~^ $signed((~reg64))) ?
                      $signed((~(+wire66))) : {(((8'ha6) ? (8'ha0) : reg52) ?
                              $unsigned(wire66) : {wire68})}));
  assign wire71 = $unsigned(wire45[(2'h2):(1'h1)]);
  assign wire72 = ($signed((reg60[(2'h2):(1'h1)] <= (&(~^reg31)))) - (reg40 ?
                      $signed(reg54) : (&({(8'ha6), wire42} ?
                          $unsigned(wire48) : {(8'ha3)}))));
  assign wire73 = ((&((|(reg32 ? (8'h9d) : reg40)) ?
                      $signed((|(8'ha9))) : $unsigned(wire71))) - wire43);
endmodule

module module178
#(parameter param217 = ((~(-((+(8'hb9)) ? (&(8'hb9)) : ((8'h9e) < (8'ha4))))) <= {((((8'hbc) & (8'ha0)) ^ (|(8'hb8))) + {(-(8'ha6))}), {(-((8'ha1) || (8'hb9)))}}))
(y, clk, wire183, wire182, wire181, wire180, wire179);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire183;
  input wire [(4'h8):(1'h0)] wire182;
  input wire signed [(2'h3):(1'h0)] wire181;
  input wire [(4'h8):(1'h0)] wire180;
  input wire [(4'hb):(1'h0)] wire179;
  wire signed [(2'h2):(1'h0)] wire201;
  wire signed [(4'h8):(1'h0)] wire200;
  wire signed [(4'hf):(1'h0)] wire199;
  wire signed [(4'hb):(1'h0)] wire198;
  wire [(5'h12):(1'h0)] wire186;
  wire signed [(4'hb):(1'h0)] wire185;
  wire signed [(5'h14):(1'h0)] wire184;
  reg signed [(5'h10):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg215 = (1'h0);
  reg [(5'h12):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg213 = (1'h0);
  reg [(4'ha):(1'h0)] reg212 = (1'h0);
  reg [(4'he):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg207 = (1'h0);
  reg [(4'hb):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg205 = (1'h0);
  reg [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg203 = (1'h0);
  reg [(4'he):(1'h0)] reg202 = (1'h0);
  reg [(4'hf):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg196 = (1'h0);
  reg [(3'h7):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg [(5'h14):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg190 = (1'h0);
  reg [(4'h9):(1'h0)] reg189 = (1'h0);
  reg [(4'he):(1'h0)] reg188 = (1'h0);
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire186,
                 wire185,
                 wire184,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 (1'h0)};
  assign wire184 = $unsigned((((~^(-wire181)) ?
                           $unsigned(wire181) : ((wire182 ~^ (8'ha3)) ?
                               (+wire182) : (wire181 < wire183))) ?
                       wire181 : {$signed(wire180), wire183}));
  assign wire185 = ((~|wire183) == ($unsigned((~$signed(wire184))) ?
                       $unsigned((8'hbd)) : {{wire181[(1'h1):(1'h0)],
                               (wire180 ? (8'ha2) : wire181)}}));
  assign wire186 = $signed((&$unsigned($unsigned((&wire185)))));
  always
    @(posedge clk) begin
      if (wire183)
        begin
          reg187 <= {wire186[(1'h0):(1'h0)], wire186[(5'h10):(3'h4)]};
          reg188 <= wire184;
          reg189 <= wire185;
          reg190 <= ({$unsigned((~|{wire180, wire181})),
              wire184} >>> $signed({wire180[(3'h6):(3'h4)],
              reg188[(4'hb):(4'h9)]}));
          if ($signed(wire181))
            begin
              reg191 <= {wire186[(3'h7):(3'h5)]};
              reg192 <= $signed($unsigned(($signed($unsigned(wire184)) ?
                  (reg189 ? ((8'ha2) + reg187) : wire181) : $unsigned((reg187 ?
                      wire182 : wire179)))));
            end
          else
            begin
              reg191 <= wire184;
              reg192 <= (^($unsigned(reg189) ?
                  ($unsigned((wire184 + wire180)) ?
                      $unsigned($signed(wire184)) : $unsigned((wire185 ^ wire185))) : {wire186,
                      wire186}));
              reg193 <= wire179[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg187 <= $unsigned({wire180});
          reg188 <= $signed($unsigned(((!reg191[(3'h6):(1'h1)]) ?
              wire180[(3'h7):(2'h3)] : ((reg187 ? reg191 : wire184) ?
                  $signed(wire186) : wire182[(2'h3):(2'h3)]))));
          if (reg188[(4'hd):(4'hd)])
            begin
              reg189 <= (wire185 * $signed($unsigned(wire186)));
              reg190 <= reg188;
              reg191 <= $unsigned(wire183);
              reg192 <= reg187;
            end
          else
            begin
              reg189 <= ($signed($signed($signed((&reg190)))) <= ((~^wire185) ?
                  (reg188 >> (-{wire185})) : $unsigned(reg190)));
              reg190 <= $signed({{(!$signed(wire184)), (-$signed(wire186))},
                  wire179[(2'h2):(2'h2)]});
              reg191 <= ($unsigned($signed(((reg190 >>> wire179) ?
                      (reg191 ? (7'h43) : reg188) : (8'h9c)))) ?
                  (((-reg192[(3'h4):(1'h1)]) != ((wire179 & (8'ha5)) <<< reg193[(2'h2):(1'h0)])) ?
                      (!$unsigned({wire182})) : $unsigned(reg187[(1'h0):(1'h0)])) : (~&((8'hbf) ?
                      reg193 : ($signed((7'h40)) - {wire184, (8'h9c)}))));
              reg192 <= ($signed($signed((((8'ha9) ? wire186 : reg188) ?
                  ((8'ha0) >>> wire182) : reg188[(1'h1):(1'h1)]))) >> (^{$unsigned({(8'hbd),
                      reg187}),
                  reg191[(4'ha):(1'h1)]}));
              reg193 <= ({wire184[(4'h9):(2'h2)],
                      (($unsigned(wire186) ?
                              (8'hbe) : ((8'h9f) ? reg191 : wire184)) ?
                          (8'ha3) : $unsigned(reg192))} ?
                  $signed((wire182[(3'h7):(3'h4)] ?
                      ({wire180,
                          wire182} ~^ {wire185}) : ((^wire179) == (^reg188)))) : ((8'hbe) ?
                      (($unsigned(reg188) ? (~&wire185) : reg187) ?
                          reg188 : ($unsigned(wire181) >= reg191)) : ($unsigned((wire179 ?
                          reg189 : (8'hbc))) * (-(+reg190)))));
            end
          reg194 <= $unsigned(wire181);
          reg195 <= ($unsigned($signed($unsigned(reg193))) ?
              (reg187[(1'h1):(1'h0)] > $signed($signed((&wire184)))) : $unsigned(wire180[(1'h0):(1'h0)]));
        end
      reg196 <= (reg187[(1'h1):(1'h1)] ? wire180[(3'h7):(3'h6)] : reg187);
      reg197 <= (wire181[(2'h3):(1'h0)] ?
          (wire181 >> reg192[(2'h2):(1'h0)]) : ((~|reg194) ?
              $signed((^{(8'haf), wire179})) : wire184));
    end
  assign wire198 = $signed({wire180[(1'h1):(1'h1)]});
  assign wire199 = (~^reg194[(1'h0):(1'h0)]);
  assign wire200 = wire185;
  assign wire201 = (^wire184);
  always
    @(posedge clk) begin
      reg202 <= $unsigned(reg189[(2'h3):(2'h2)]);
      if (($unsigned(({reg197} <= (7'h43))) ^~ ($unsigned($signed(reg196)) ?
          $signed(wire180) : (reg190 ~^ reg192))))
        begin
          reg203 <= (wire201 ?
              reg189[(2'h2):(1'h1)] : {$unsigned(($unsigned(wire182) + $unsigned(wire199))),
                  $unsigned((|(wire185 > (8'ha9))))});
        end
      else
        begin
          if ({$unsigned((wire184[(5'h13):(4'ha)] ?
                  (((8'hb5) >> (8'hb8)) != reg203[(3'h6):(1'h1)]) : (wire184[(5'h14):(1'h0)] - wire183)))})
            begin
              reg203 <= $signed($unsigned((^~wire183[(3'h4):(2'h3)])));
              reg204 <= reg191[(2'h3):(2'h3)];
              reg205 <= ($unsigned(wire180[(1'h0):(1'h0)]) & (-((|(-wire200)) ?
                  reg204 : ((reg203 ? reg197 : reg204) < (|reg190)))));
              reg206 <= {(8'ha4)};
            end
          else
            begin
              reg203 <= $signed(((reg191 ?
                  ($unsigned(wire200) ^~ reg205[(2'h3):(1'h0)]) : ({reg202,
                      (8'hab)} ^~ (reg204 ~^ reg187))) > (wire180[(2'h2):(2'h2)] >>> $unsigned((~|wire198)))));
              reg204 <= $signed($unsigned(wire182[(1'h1):(1'h0)]));
            end
          if ({{{reg189}, (8'hb1)},
              ((~|(reg194 ? $unsigned(reg188) : $unsigned(wire184))) ?
                  wire201 : $signed(reg191[(5'h10):(4'he)]))})
            begin
              reg207 <= (((+$signed(reg205)) ?
                      (~reg206) : (({(8'ha3)} || wire180[(3'h7):(3'h5)]) ?
                          ($unsigned(wire185) & reg196) : ((!wire199) ?
                              $unsigned(reg190) : (~&reg196)))) ?
                  ($signed((reg197[(3'h4):(1'h0)] <= (wire186 ?
                          (8'hbc) : reg190))) ?
                      (~^wire183) : ((~(8'hab)) >= (~&(8'hbb)))) : (~^$unsigned($unsigned((reg190 ?
                      wire185 : reg196)))));
              reg208 <= ($unsigned(((~&$unsigned(reg194)) >= wire181)) ?
                  reg187[(2'h2):(2'h2)] : wire198[(2'h2):(1'h0)]);
              reg209 <= ({(&$signed(reg204[(3'h4):(2'h2)]))} ?
                  wire179 : (-(((&reg208) ?
                      $signed(reg208) : $unsigned((7'h40))) ^~ reg195[(2'h3):(1'h0)])));
              reg210 <= {(reg193 ? wire180[(3'h6):(3'h5)] : reg187)};
              reg211 <= wire186[(4'he):(4'ha)];
            end
          else
            begin
              reg207 <= (~&reg207[(1'h1):(1'h1)]);
              reg208 <= ($unsigned((!(8'hb2))) != (^~($unsigned($unsigned(wire184)) ?
                  $signed($unsigned((8'ha2))) : ((wire179 << reg204) ?
                      wire184 : (reg211 >>> reg190)))));
              reg209 <= {($signed((reg194 ~^ (8'hbc))) | wire185),
                  ((8'hb6) ? (8'hb2) : reg196)};
            end
          reg212 <= (^~(({(~&(8'ha3)), $signed((8'hbd))} ?
              reg192[(4'hc):(3'h7)] : $signed(reg191)) || wire184));
        end
      reg213 <= $unsigned(((-$unsigned(reg191[(4'hd):(3'h6)])) <<< reg207));
      reg214 <= reg208;
    end
  always
    @(posedge clk) begin
      if (wire184)
        begin
          reg215 <= ($unsigned((~|wire183)) ?
              reg211[(3'h4):(2'h3)] : ($unsigned(wire186[(5'h11):(3'h7)]) ?
                  reg204[(1'h1):(1'h1)] : (~^{reg193[(2'h3):(1'h0)], reg202})));
        end
      else
        begin
          reg215 <= reg209[(4'hf):(2'h2)];
        end
      reg216 <= (($signed($signed({(8'had), reg193})) ?
          wire186 : $signed(((wire184 ^~ reg195) ?
              (wire186 < wire182) : (~wire201)))) >>> $signed($unsigned({(reg209 ?
              wire199 : reg191),
          reg208})));
    end
endmodule

module module153  (y, clk, wire157, wire156, wire155, wire154);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire157;
  input wire [(5'h13):(1'h0)] wire156;
  input wire [(3'h6):(1'h0)] wire155;
  input wire signed [(5'h11):(1'h0)] wire154;
  wire signed [(4'hb):(1'h0)] wire175;
  wire signed [(2'h3):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire170;
  wire signed [(5'h11):(1'h0)] wire169;
  wire signed [(4'he):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  wire signed [(4'hf):(1'h0)] wire166;
  reg [(4'ha):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(5'h14):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 reg171,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg158 <= (wire155 >>> $signed(({(^wire154),
          wire155} | ($unsigned(wire155) << $unsigned((8'hb9))))));
      reg159 <= ((wire155[(3'h6):(2'h3)] ?
              (($signed(wire155) < (wire154 ? wire155 : wire157)) ?
                  $signed((^~wire157)) : $unsigned($signed(wire156))) : reg158) ?
          (8'hb4) : $signed({({reg158, (8'ha3)} ?
                  (reg158 ? wire154 : wire154) : $signed(wire155)),
              $unsigned($unsigned(wire157))}));
      reg160 <= ($signed((((&wire157) <= (^(8'hbd))) ?
          (wire157 - (!reg159)) : ((reg158 ? (8'hae) : reg159) > (wire155 ?
              reg159 : (8'hac))))) ~^ wire154[(4'h8):(3'h7)]);
      if (wire154[(4'h8):(2'h3)])
        begin
          reg161 <= (($unsigned(wire156) ~^ reg160) ?
              (wire154 ?
                  $signed(({(8'haf), wire154} ?
                      (wire156 <<< reg158) : wire154)) : $unsigned($signed((reg160 ?
                      (8'h9f) : (8'ha9))))) : {((|(reg159 ?
                      wire156 : reg160)) - $signed((~^reg158))),
                  $unsigned(((7'h40) != $unsigned(wire155)))});
          reg162 <= $signed(reg158[(2'h3):(1'h0)]);
          reg163 <= reg161;
        end
      else
        begin
          reg161 <= $signed(reg158);
          reg162 <= $signed((^((~&(reg161 + wire156)) ?
              wire155 : ($signed(reg159) << (-reg160)))));
          reg163 <= $unsigned((~|reg163[(3'h4):(1'h1)]));
          reg164 <= (wire154[(4'ha):(3'h7)] ~^ {reg160,
              $unsigned({{wire155}, $unsigned((8'ha0))})});
        end
      reg165 <= (&$unsigned($signed($unsigned({reg163}))));
    end
  assign wire166 = {(wire155 ?
                           $signed(((reg164 && reg159) ?
                               $unsigned(reg165) : $unsigned((8'hb5)))) : (+reg163[(4'hb):(3'h4)]))};
  assign wire167 = (wire157[(3'h7):(1'h1)] ?
                       $unsigned($signed(wire157)) : reg165);
  assign wire168 = ({(~&$unsigned(wire156)), reg160} ?
                       $unsigned($unsigned($unsigned(wire157[(3'h4):(2'h3)]))) : $signed((+(reg159[(4'hf):(3'h6)] ?
                           $signed(reg163) : {wire157}))));
  assign wire169 = {(($signed($unsigned(reg165)) << $signed($unsigned(reg161))) >>> (reg163[(2'h2):(2'h2)] & $unsigned((!reg161)))),
                       wire154};
  assign wire170 = (((+$signed((reg163 && (7'h43)))) <= $unsigned(reg161)) ?
                       wire169 : $unsigned((reg158 << $signed($signed(reg164)))));
  always
    @(posedge clk) begin
      reg171 <= (8'ha9);
    end
  assign wire172 = (reg164 ?
                       $signed({$signed(reg171[(3'h6):(3'h5)]),
                           {(wire170 ?
                                   reg163 : wire157)}}) : wire156[(5'h13):(3'h5)]);
  assign wire173 = {((^wire168) <<< (($unsigned(reg162) ?
                           wire166[(2'h2):(1'h0)] : (reg160 ~^ wire154)) > reg165))};
  assign wire174 = $unsigned(((~^($signed(reg162) ?
                           (|wire166) : (wire169 ? wire157 : wire167))) ?
                       (~|(-(reg164 ?
                           wire154 : (8'h9d)))) : wire169[(1'h0):(1'h0)]));
  assign wire175 = (~&(reg159[(5'h15):(4'hd)] ^ wire172[(3'h7):(3'h6)]));
endmodule
