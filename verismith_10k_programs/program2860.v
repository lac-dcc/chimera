module top
#(parameter param235 = ((~^(((~(8'ha6)) | {(8'h9d)}) | (~^(~|(8'hbf))))) + ((~&(~((8'hb1) ? (8'hab) : (8'ha4)))) ? (((&(8'ha5)) >= {(8'ha0), (8'hba)}) && (&{(7'h44)})) : (8'hb8))), 
parameter param236 = (~|(~^((&(param235 ^~ param235)) >> (-(+param235))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire234;
  wire [(3'h6):(1'h0)] wire233;
  wire [(5'h14):(1'h0)] wire232;
  wire [(4'hc):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire230;
  assign y = {wire234,
                 wire233,
                 wire232,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire230,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (~(~{wire0[(4'hd):(1'h1)]}));
  assign wire6 = ($signed(wire3) & (wire0 | $signed({wire5[(2'h2):(1'h1)]})));
  assign wire7 = ((({(wire5 ? wire3 : (7'h44)),
                         (8'ha5)} ^~ (~|(~wire3))) ~^ wire5) ?
                     $signed(wire4[(3'h6):(3'h6)]) : ($signed({wire3,
                         (wire0 ? wire6 : wire1)}) << wire2[(4'hb):(3'h6)]));
  module8 #() modinst231 (wire230, clk, wire6, wire0, wire7, wire3, wire1);
  assign wire232 = (((^{(wire7 >= wire5)}) <= ({$signed(wire3)} ?
                           wire5[(1'h0):(1'h0)] : wire230)) ?
                       $signed(wire0) : (|(wire1[(4'ha):(4'h8)] || {(wire230 * (8'hb2))})));
  assign wire233 = {{(|$unsigned(wire0[(4'hd):(3'h6)]))}};
  assign wire234 = wire2;
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h31b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire229;
  wire [(5'h14):(1'h0)] wire225;
  wire [(3'h4):(1'h0)] wire214;
  wire [(2'h3):(1'h0)] wire212;
  wire [(5'h14):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire227;
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  assign y = {wire229,
                 wire225,
                 wire214,
                 wire212,
                 wire163,
                 wire14,
                 wire15,
                 wire16,
                 wire42,
                 wire80,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire161,
                 wire227,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  assign wire14 = wire13[(4'h9):(3'h6)];
  assign wire15 = {wire12, (|{{(wire12 >> (8'ha7))}})};
  assign wire16 = (|((~|wire11[(4'hf):(2'h2)]) ?
                      ({(wire15 <= wire11),
                          (wire9 ?
                              wire12 : (8'hba))} >>> (wire14[(4'h8):(1'h0)] < wire13[(4'hb):(3'h6)])) : (&wire10[(3'h7):(1'h0)])));
  module17 #() modinst43 (wire42, clk, wire16, wire11, wire13, wire12);
  always
    @(posedge clk) begin
      reg44 <= $unsigned(wire9[(2'h3):(2'h2)]);
      reg45 <= (~&wire14[(4'ha):(2'h2)]);
      reg46 <= $unsigned((8'hb6));
      reg47 <= (($signed({$signed((7'h44))}) ?
          $signed(reg45) : $unsigned(reg46[(1'h0):(1'h0)])) ^ {(+$signed((wire10 ?
              reg45 : wire10)))});
    end
  module48 #() modinst81 (.wire52(wire12), .wire50(wire14), .clk(clk), .wire53(wire42), .wire51(reg44), .wire49(wire13), .y(wire80));
  always
    @(posedge clk) begin
      if ((&(reg46[(2'h2):(1'h0)] ?
          $unsigned((^wire14[(3'h5):(3'h5)])) : wire11)))
        begin
          reg82 <= (~(wire42 ? $unsigned(wire13) : wire12));
          if ($unsigned((~^(^~reg44))))
            begin
              reg83 <= (+(&wire10));
              reg84 <= (8'hab);
              reg85 <= (wire11[(2'h3):(1'h1)] ?
                  $unsigned(reg46[(1'h1):(1'h1)]) : (~^reg46));
              reg86 <= wire80;
              reg87 <= (~$unsigned($signed($unsigned($signed(wire12)))));
            end
          else
            begin
              reg83 <= (((~&((wire16 ? wire16 : (8'ha9)) <= reg83)) ?
                      ((&reg45[(4'he):(4'he)]) ?
                          (^reg86) : wire42) : $signed(reg45)) ?
                  reg87[(2'h3):(1'h1)] : (reg85 >= wire10));
              reg84 <= ($signed(((~&reg83[(2'h3):(2'h3)]) ?
                      reg84[(4'hb):(2'h3)] : reg87[(1'h1):(1'h1)])) ?
                  (!$unsigned($signed($signed(wire80)))) : (^(reg46[(2'h2):(2'h2)] >>> $signed((8'hb1)))));
              reg85 <= reg47[(1'h0):(1'h0)];
              reg86 <= $signed(wire15[(3'h4):(1'h0)]);
            end
        end
      else
        begin
          reg82 <= $signed(reg87);
          reg83 <= $signed(((^{wire13,
              wire42[(5'h10):(4'ha)]}) << ($signed(wire42) > wire9)));
          reg84 <= $signed(reg45[(3'h6):(1'h1)]);
          reg85 <= $signed(wire16);
          reg86 <= ((~wire16[(4'ha):(3'h6)]) <<< (^(8'hbd)));
        end
    end
  always
    @(posedge clk) begin
      if (($signed((($unsigned(reg83) ?
              reg83[(1'h0):(1'h0)] : $unsigned(wire42)) ?
          $signed((reg83 ?
              wire42 : wire9)) : wire10[(4'ha):(4'h9)])) ^ (((+(^(7'h42))) ^ $unsigned((reg44 ?
              reg46 : reg86))) ?
          {wire10[(3'h5):(2'h2)]} : reg46[(1'h0):(1'h0)])))
        begin
          reg88 <= (8'hbd);
          reg89 <= (reg44[(2'h2):(1'h0)] > {reg86[(2'h2):(2'h2)],
              $signed(((wire12 ? reg83 : reg87) ? wire42 : $signed(wire14)))});
          reg90 <= reg85[(3'h5):(1'h1)];
          reg91 <= {reg83};
          reg92 <= reg46;
        end
      else
        begin
          if (reg90[(4'he):(3'h6)])
            begin
              reg88 <= (((~|$signed((reg89 < wire9))) ?
                      wire10[(3'h7):(1'h0)] : ($unsigned((wire9 ?
                              reg87 : reg86)) ?
                          ((reg87 ? reg92 : (8'hb0)) ?
                              (wire16 ?
                                  (8'ha7) : reg47) : $signed((8'hb4))) : (^~{(8'hbb),
                              reg84}))) ?
                  reg83[(2'h3):(1'h0)] : $signed((wire9[(3'h6):(3'h6)] ?
                      (~reg84[(4'hc):(4'hc)]) : $signed(wire10))));
            end
          else
            begin
              reg88 <= ($unsigned({reg89}) >>> wire16);
              reg89 <= ((reg87 < ($unsigned(wire15[(1'h0):(1'h0)]) ?
                  (((8'ha8) == wire16) < (reg45 > reg44)) : wire9[(3'h7):(3'h5)])) + {reg84[(3'h5):(3'h5)],
                  ({(8'h9d), {wire12, reg44}} ?
                      {(reg82 ? wire42 : reg44), (|wire15)} : wire80)});
              reg90 <= (~|reg44);
              reg91 <= $signed(((reg83 ? wire16[(4'hb):(1'h1)] : reg91) ?
                  reg88[(3'h5):(2'h2)] : (-(!$unsigned(reg46)))));
            end
          reg92 <= reg90[(4'hb):(4'h9)];
          if ({reg82, (8'hb4)})
            begin
              reg93 <= wire9[(2'h3):(1'h0)];
              reg94 <= {((wire10[(3'h6):(2'h2)] ?
                      (8'hbc) : wire10) >= $unsigned(reg91))};
              reg95 <= (8'hbd);
              reg96 <= wire12[(1'h0):(1'h0)];
              reg97 <= ($unsigned((~|reg91)) + $unsigned(($unsigned((reg95 - reg82)) ?
                  wire42 : reg46[(1'h0):(1'h0)])));
            end
          else
            begin
              reg93 <= $signed(reg91[(1'h1):(1'h1)]);
              reg94 <= (^~wire11);
              reg95 <= (($unsigned((wire10[(4'h9):(3'h5)] ?
                          $signed(wire9) : (reg92 ? reg88 : reg47))) ?
                      wire80[(3'h6):(3'h5)] : $signed(reg97)) ?
                  $unsigned(wire9) : (($signed((-wire42)) ?
                          (reg93[(2'h3):(1'h1)] & {reg44,
                              (8'hb2)}) : (~|$signed(wire80))) ?
                      (~&(~&(reg46 ?
                          reg83 : reg44))) : (^~$unsigned((!reg84)))));
              reg96 <= $unsigned($unsigned($signed((reg85 == (~|reg44)))));
            end
          if ((8'ha6))
            begin
              reg98 <= {({(wire12 ^ $signed(reg83)),
                      {(reg97 == (8'hbc))}} & wire9),
                  (8'hbc)};
              reg99 <= reg87[(1'h0):(1'h0)];
              reg100 <= (~|wire42[(3'h4):(2'h3)]);
              reg101 <= (reg97[(3'h5):(1'h0)] ?
                  reg100[(1'h1):(1'h1)] : ((8'ha4) * ($unsigned((!wire42)) ?
                      (8'hb7) : $unsigned((|wire14)))));
            end
          else
            begin
              reg98 <= (8'hb7);
              reg99 <= reg98[(3'h5):(3'h4)];
              reg100 <= $signed(wire42);
              reg101 <= reg89[(3'h4):(1'h0)];
            end
          reg102 <= ((^~wire42[(1'h0):(1'h0)]) ^~ reg45);
        end
      if (reg47)
        begin
          reg103 <= $unsigned($signed($unsigned($unsigned((wire14 ?
              reg86 : (8'had))))));
          reg104 <= {(&$signed(((~|wire13) << (reg89 ? (8'ha5) : (8'ha5)))))};
          reg105 <= reg97;
        end
      else
        begin
          if (($unsigned(reg100[(2'h3):(2'h3)]) >= reg100))
            begin
              reg103 <= (reg102[(3'h6):(3'h4)] ^~ (|$unsigned((8'ha7))));
            end
          else
            begin
              reg103 <= $unsigned(reg103);
              reg104 <= reg85;
              reg105 <= (&(&$unsigned((+((8'ha6) ? (8'had) : reg99)))));
              reg106 <= (reg95 < reg90[(4'hb):(3'h4)]);
              reg107 <= wire42;
            end
          if ($signed((&$signed((8'hb5)))))
            begin
              reg108 <= $signed(reg107[(3'h5):(2'h2)]);
            end
          else
            begin
              reg108 <= {(wire10[(1'h0):(1'h0)] ?
                      ((wire9[(3'h4):(2'h3)] ?
                              (reg91 <= reg96) : $unsigned(wire42)) ?
                          $signed((wire11 >> reg89)) : (!$signed(reg93))) : (reg88[(3'h5):(3'h4)] ?
                          reg87[(2'h2):(1'h1)] : ((&reg100) ?
                              (8'hab) : (-reg97)))),
                  reg98};
              reg109 <= ($unsigned(reg91[(2'h3):(2'h2)]) ?
                  $signed((!$signed({wire14, reg94}))) : (+(wire12 ?
                      wire80[(4'hd):(1'h1)] : reg87)));
            end
          reg110 <= (reg92 << {((reg85[(2'h2):(1'h1)] ?
                  reg101[(4'h9):(1'h1)] : {reg103}) || $unsigned($unsigned(reg99))),
              reg88});
          reg111 <= (reg99[(3'h4):(1'h0)] ^~ $signed($signed(wire16)));
        end
      if ((+{reg97, (~^wire12[(4'h9):(2'h2)])}))
        begin
          reg112 <= (~^(8'h9f));
          reg113 <= $unsigned($signed(wire15));
          if ($unsigned($unsigned(((reg108[(3'h4):(1'h0)] || $signed(reg44)) <<< $unsigned(reg47[(1'h1):(1'h1)])))))
            begin
              reg114 <= (|(~wire14[(4'ha):(1'h0)]));
              reg115 <= ($signed((~^$unsigned(((8'ha6) >> reg88)))) > ($unsigned(reg105[(1'h0):(1'h0)]) ?
                  ($signed((wire42 ? reg102 : reg85)) ?
                      $unsigned((wire80 != reg103)) : reg108[(3'h5):(3'h5)]) : {($signed(wire15) && reg89),
                      (~^reg106)}));
              reg116 <= (^~$signed(reg85[(1'h1):(1'h0)]));
              reg117 <= ((-((~^(!reg89)) ?
                  reg46[(1'h0):(1'h0)] : ($signed((8'hb6)) ?
                      reg112[(1'h0):(1'h0)] : (&reg104)))) || (&$signed({$signed(reg87)})));
            end
          else
            begin
              reg114 <= (8'hb5);
            end
          reg118 <= ({$unsigned(wire11)} ?
              (^~((+$signed(reg46)) > {$unsigned(reg117)})) : (^(!wire10[(2'h2):(1'h1)])));
        end
      else
        begin
          reg112 <= (reg118[(1'h1):(1'h0)] ?
              {(&((reg89 ? reg82 : (8'hb4)) ?
                      $signed(reg93) : (reg91 ? reg44 : reg114))),
                  $signed($signed({reg82, reg115}))} : reg100[(2'h3):(2'h2)]);
          reg113 <= $unsigned(reg46[(1'h1):(1'h1)]);
          if ({($unsigned(($unsigned(wire11) ?
                  ((8'hb7) <<< (8'ha7)) : wire16)) <<< (~&$unsigned((reg94 ?
                  reg107 : reg106)))),
              ((8'hb9) ?
                  (|wire14) : ({reg103, $signed(reg82)} ~^ ($unsigned((8'ha5)) ?
                      (reg116 ? reg44 : wire15) : (~^wire16))))})
            begin
              reg114 <= $signed((^wire12[(4'he):(1'h1)]));
              reg115 <= wire80;
              reg116 <= (~^($signed((^(reg46 ^ wire10))) ?
                  wire14[(5'h13):(5'h10)] : reg89[(1'h0):(1'h0)]));
              reg117 <= ($signed((reg115[(2'h3):(2'h2)] ?
                      $signed(reg109[(4'hc):(3'h4)]) : (^$unsigned(reg94)))) ?
                  wire9 : $signed($unsigned(reg46[(1'h1):(1'h1)])));
            end
          else
            begin
              reg114 <= reg103;
              reg115 <= ((reg103[(3'h6):(1'h1)] ?
                  reg111[(3'h5):(2'h3)] : $unsigned({$unsigned((8'ha8)),
                      (wire10 - wire14)})) * (!(wire11 ?
                  (reg106[(3'h7):(2'h3)] == (reg117 ?
                      reg84 : reg47)) : $signed((~|wire10)))));
              reg116 <= (reg110 ?
                  (~^reg115) : $signed(((reg96 <= $signed(reg98)) & $signed($signed(reg96)))));
              reg117 <= {reg85[(2'h2):(1'h1)], $unsigned(reg82)};
            end
        end
    end
  assign wire119 = (+(!reg94[(3'h5):(1'h0)]));
  assign wire120 = $unsigned({({reg46[(2'h2):(1'h0)],
                           $signed(reg94)} <<< $unsigned(reg112[(3'h6):(1'h1)]))});
  assign wire121 = ((-(8'hb5)) ?
                       ((wire11[(5'h10):(3'h4)] << $signed((8'h9e))) ?
                           {(~|{reg84, wire11})} : (&({reg46} ?
                               ((8'hb1) | wire42) : (8'hb6)))) : (&{(reg99[(3'h4):(1'h1)] ?
                               (reg100 ? reg98 : reg82) : (^reg84))}));
  assign wire122 = (reg85[(3'h7):(2'h2)] >= reg107[(3'h6):(2'h3)]);
  assign wire123 = $signed(reg101);
  assign wire124 = $signed($signed(($unsigned(reg83[(4'hf):(4'h9)]) ?
                       {$signed((8'h9e))} : $signed((wire16 ?
                           reg47 : reg96)))));
  module125 #() modinst162 (.y(wire161), .wire127(reg114), .wire126(reg96), .wire128(wire10), .wire130(reg47), .wire129(reg82), .clk(clk));
  assign wire163 = ($unsigned(wire80[(1'h1):(1'h0)]) ?
                       $unsigned($signed($unsigned(reg96))) : (reg109[(3'h7):(3'h4)] ?
                           (reg109 << $unsigned((wire13 > (8'hb6)))) : ((reg82[(4'ha):(3'h6)] ?
                               wire121[(5'h10):(3'h6)] : {reg87}) ^ (^$signed(wire42)))));
  module164 #() modinst213 (.wire165(reg91), .wire167(reg106), .clk(clk), .wire168(reg98), .wire166(reg44), .y(wire212));
  assign wire214 = reg111[(3'h7):(1'h1)];
  module215 #() modinst226 (wire225, clk, reg86, reg83, reg93, reg97, wire15);
  module48 #() modinst228 (wire227, clk, reg93, reg90, reg114, wire42, reg46);
  assign wire229 = $signed(((!($signed(reg109) - $unsigned(reg92))) <= reg87));
endmodule

module module215  (y, clk, wire220, wire219, wire218, wire217, wire216);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire220;
  input wire [(4'hb):(1'h0)] wire219;
  input wire signed [(3'h7):(1'h0)] wire218;
  input wire [(5'h10):(1'h0)] wire217;
  input wire [(4'he):(1'h0)] wire216;
  wire signed [(4'hc):(1'h0)] wire224;
  wire signed [(4'he):(1'h0)] wire223;
  wire signed [(4'he):(1'h0)] wire222;
  wire [(4'h9):(1'h0)] wire221;
  assign y = {wire224, wire223, wire222, wire221, (1'h0)};
  assign wire221 = wire220;
  assign wire222 = wire221[(4'h9):(3'h5)];
  assign wire223 = ((wire218[(2'h2):(1'h1)] ~^ wire217) & wire220[(3'h6):(3'h5)]);
  assign wire224 = $signed(wire220);
endmodule

module module164  (y, clk, wire168, wire167, wire166, wire165);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire168;
  input wire signed [(5'h12):(1'h0)] wire167;
  input wire signed [(5'h12):(1'h0)] wire166;
  input wire [(5'h13):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire211;
  wire signed [(3'h7):(1'h0)] wire208;
  wire [(3'h5):(1'h0)] wire207;
  wire signed [(2'h2):(1'h0)] wire206;
  wire [(4'hd):(1'h0)] wire205;
  wire [(2'h2):(1'h0)] wire204;
  wire [(3'h7):(1'h0)] wire192;
  wire [(4'he):(1'h0)] wire191;
  wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(5'h11):(1'h0)] wire170;
  wire signed [(4'hc):(1'h0)] wire169;
  reg signed [(5'h12):(1'h0)] reg210 = (1'h0);
  reg [(4'h8):(1'h0)] reg209 = (1'h0);
  reg [(5'h10):(1'h0)] reg203 = (1'h0);
  reg [(4'ha):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg201 = (1'h0);
  reg [(5'h14):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg199 = (1'h0);
  reg [(2'h2):(1'h0)] reg198 = (1'h0);
  reg signed [(4'he):(1'h0)] reg197 = (1'h0);
  reg [(4'hd):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg195 = (1'h0);
  reg [(4'hf):(1'h0)] reg194 = (1'h0);
  reg [(5'h11):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg189 = (1'h0);
  reg [(5'h15):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(4'hb):(1'h0)] reg186 = (1'h0);
  reg [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(4'h9):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(5'h13):(1'h0)] reg181 = (1'h0);
  reg [(3'h4):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  assign y = {wire211,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire192,
                 wire191,
                 wire174,
                 wire170,
                 wire169,
                 reg210,
                 reg209,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
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
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire169 = wire166[(5'h10):(3'h6)];
  assign wire170 = wire167;
  always
    @(posedge clk) begin
      reg171 <= wire168;
      reg172 <= ((-((((8'hb7) ? reg171 : wire165) ?
          $signed(reg171) : $signed(wire170)) > {(-(8'hb3)),
          $unsigned(reg171)})) > $unsigned((~&$unsigned((|wire168)))));
      reg173 <= $signed($unsigned(wire170[(4'he):(4'hd)]));
    end
  assign wire174 = ({reg173} ?
                       (wire167 ?
                           ((wire170[(4'hf):(3'h7)] ?
                               (reg171 != reg171) : $signed(reg172)) + wire168) : wire166[(4'hf):(3'h6)]) : $signed(($unsigned((wire166 ?
                               wire170 : (8'hab))) ?
                           wire169[(3'h7):(3'h5)] : $signed($unsigned(wire169)))));
  always
    @(posedge clk) begin
      if (($signed((((|reg171) != wire168[(1'h1):(1'h1)]) == (~^$unsigned(wire174)))) ?
          ((8'hb7) <= $signed($unsigned(reg171))) : ($signed((&$unsigned(wire169))) ?
              $unsigned(((|wire165) - (+wire169))) : $unsigned($signed(reg172[(1'h0):(1'h0)])))))
        begin
          reg175 <= $signed((($unsigned(wire165[(5'h11):(4'hc)]) | (|reg172[(2'h2):(2'h2)])) ?
              $unsigned(wire174) : (7'h43)));
          reg176 <= ((((-(-reg175)) ?
                  {(wire167 >>> reg173),
                      ((8'hbe) ?
                          (7'h44) : wire168)} : wire165[(5'h12):(4'h9)]) ?
              wire166 : ((-wire167) ~^ (&$signed(wire168)))) && ({wire167[(4'hc):(1'h0)],
                  {(+reg172), (~^wire168)}} ?
              wire170 : reg172[(2'h2):(2'h2)]));
          reg177 <= ((|wire174[(4'h9):(4'h9)]) ?
              $signed(reg173) : {(|{$signed((7'h41))})});
          reg178 <= wire165[(1'h1):(1'h0)];
          reg179 <= ($signed({$unsigned((-reg178))}) ?
              (~&(((wire174 >> wire166) ^ $signed(reg171)) ?
                  reg171[(2'h2):(2'h2)] : ((wire167 ?
                      reg177 : wire165) < wire170[(3'h5):(1'h0)]))) : {$unsigned(reg173[(2'h3):(1'h1)])});
        end
      else
        begin
          if ({(({wire169[(2'h2):(1'h0)]} ?
                  ((wire166 <= wire166) + (wire169 != wire168)) : (&$unsigned(reg179))) && (wire165[(4'h9):(2'h2)] >>> (reg175[(4'hf):(2'h3)] ?
                  {wire169, reg177} : wire165)))})
            begin
              reg175 <= wire165;
              reg176 <= wire170[(3'h4):(3'h4)];
              reg177 <= {reg171[(1'h1):(1'h1)]};
              reg178 <= ((wire165 ?
                  (wire168[(3'h5):(1'h1)] ~^ (8'h9e)) : reg171[(1'h1):(1'h1)]) ^~ ({$signed($unsigned(wire169)),
                      $signed((reg179 - reg172))} ?
                  wire165 : {(-{reg172}), reg177}));
              reg179 <= ($unsigned($unsigned(reg176[(1'h0):(1'h0)])) ?
                  {$signed(((+wire174) ?
                          wire165[(4'hf):(1'h1)] : $unsigned((8'hb1)))),
                      wire174} : wire174);
            end
          else
            begin
              reg175 <= ((!$signed((reg175 ?
                  (^~(8'h9e)) : $signed(reg179)))) <<< (((8'hbd) - reg179) ?
                  reg173[(4'h8):(3'h4)] : {wire167}));
              reg176 <= (((($signed(wire170) ? (wire174 ^ reg179) : wire170) ?
                      (reg172 ?
                          wire168 : $unsigned(reg176)) : ($unsigned(reg178) ^ (~&wire168))) ^ (((wire167 * wire169) >> ((8'hac) & reg178)) < ((wire167 < wire166) ~^ wire168[(4'h9):(4'h8)]))) ?
                  $unsigned(wire174) : wire174);
              reg177 <= wire169[(1'h0):(1'h0)];
            end
          reg180 <= $signed(reg178);
          if ($unsigned((reg176[(1'h0):(1'h0)] ? reg172 : (-wire165))))
            begin
              reg181 <= $signed(($signed((wire167[(4'hd):(4'ha)] ^~ ((8'hb5) < (8'hab)))) >> (^$unsigned((wire174 ?
                  reg179 : wire168)))));
              reg182 <= {(wire166 ?
                      {wire166[(4'hb):(4'h9)],
                          $signed({reg176,
                              reg178})} : $signed((wire166 <<< (reg179 ?
                          wire170 : wire166)))),
                  (7'h43)};
              reg183 <= ({reg182[(3'h4):(1'h1)]} - $unsigned(((+(~^reg176)) ?
                  (^wire174) : ($unsigned(wire174) ?
                      (~&wire167) : (wire174 ? reg172 : wire167)))));
              reg184 <= $unsigned($signed($signed((8'hb0))));
              reg185 <= (^~wire167[(3'h5):(3'h4)]);
            end
          else
            begin
              reg181 <= (reg183 & reg184);
              reg182 <= reg185[(1'h0):(1'h0)];
              reg183 <= reg173;
            end
          reg186 <= reg173;
        end
      reg187 <= reg176;
      reg188 <= (((wire168 > wire168) | ((|(wire170 ?
              (8'hb5) : (8'hbd))) >> (8'ha9))) ?
          $signed((&($signed((8'hbf)) ?
              $signed(reg186) : (+reg180)))) : (((reg182[(3'h5):(1'h1)] ?
                      {wire170, (8'haf)} : reg184[(5'h12):(5'h10)]) ?
                  $signed((~^reg179)) : (reg184[(4'hf):(1'h0)] ?
                      (8'hb9) : $unsigned((8'ha6)))) ?
              {reg182} : wire165[(4'hf):(4'hc)]));
      reg189 <= ((~wire165) ?
          (~|($signed(reg187) ? reg186[(1'h1):(1'h0)] : reg185)) : (8'hbb));
      reg190 <= wire167[(5'h11):(4'he)];
    end
  assign wire191 = ($unsigned(wire169[(4'hc):(4'hc)]) * (|(-$unsigned($signed(wire170)))));
  assign wire192 = {$signed(reg188), $unsigned(wire169)};
  always
    @(posedge clk) begin
      reg193 <= wire165;
      if ($unsigned((reg189[(1'h1):(1'h1)] || $signed(reg184))))
        begin
          reg194 <= reg178;
          reg195 <= (~&(~wire191[(4'h9):(3'h7)]));
        end
      else
        begin
          reg194 <= wire166;
          if ((~|$unsigned((+$signed((reg178 < reg195))))))
            begin
              reg195 <= ($signed(((8'hb8) ?
                      (^~(wire165 ^ wire191)) : $signed($signed(reg183)))) ?
                  (8'hb5) : (((&(reg179 ? reg184 : reg186)) ?
                          reg182[(1'h1):(1'h1)] : wire168) ?
                      (8'ha5) : wire168[(4'h8):(3'h7)]));
            end
          else
            begin
              reg195 <= (~^(!((-$signed(reg184)) - ((reg184 ?
                  wire170 : wire165) > $unsigned(wire191)))));
              reg196 <= wire174;
              reg197 <= ($unsigned($unsigned((~^(wire174 ?
                      (8'had) : reg181)))) ?
                  (~&$signed((~{wire167}))) : (wire166[(4'hf):(3'h4)] + (($unsigned((8'hb9)) <<< (&reg188)) ?
                      reg171[(1'h1):(1'h0)] : (wire168[(4'hc):(3'h4)] ?
                          (8'hae) : (+reg189)))));
              reg198 <= (~(!({reg197[(4'ha):(3'h6)]} ?
                  reg181 : ({reg194, reg183} < (reg172 + wire167)))));
              reg199 <= {((wire192[(1'h1):(1'h0)] + (((8'had) ?
                          reg195 : reg187) ~^ (wire170 >>> (8'hbf)))) ?
                      ((&{(8'hab)}) <<< (((8'hb7) ?
                          wire167 : reg188) >= wire170)) : $signed($signed(wire170[(4'ha):(2'h3)])))};
            end
          reg200 <= (~|(wire191[(4'h8):(3'h5)] || reg198));
          reg201 <= (($unsigned((|$signed(reg185))) ^~ (wire165 ?
                  $signed($unsigned((8'hbe))) : wire166)) ?
              reg175[(4'ha):(3'h4)] : $unsigned({reg187}));
        end
      reg202 <= $unsigned({(~&(reg198 <<< (+wire174))), $signed({reg189})});
      reg203 <= ((8'hb8) * (^reg184));
    end
  assign wire204 = ((&$signed(wire166)) ^~ reg184);
  assign wire205 = reg185[(4'h8):(3'h7)];
  assign wire206 = (((((wire168 ? (8'hbd) : reg178) ?
                               (wire166 ~^ reg194) : (!(7'h41))) || ((reg187 & reg183) ?
                               (-(8'ha4)) : (~reg194))) ?
                           $signed(wire174) : (&($unsigned(reg200) - $unsigned(reg199)))) ?
                       reg194[(4'he):(3'h7)] : $unsigned((^~(reg177 >>> {reg199}))));
  assign wire207 = (8'hb9);
  assign wire208 = wire204[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg209 <= (reg195 >> ($signed($signed((~&wire165))) ?
          (($signed(wire165) + $unsigned(reg201)) ?
              ($unsigned(reg176) ?
                  $signed((8'h9d)) : ((8'ha2) ?
                      reg180 : (7'h40))) : $signed(reg171)) : (-wire191[(3'h6):(1'h0)])));
      reg210 <= ((-reg179[(1'h1):(1'h1)]) ?
          (wire168[(4'ha):(2'h3)] ?
              reg186 : {($signed(wire205) << reg184)}) : (!reg175[(3'h7):(1'h1)]));
    end
  assign wire211 = (~^(8'ha7));
endmodule

module module125  (y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire130;
  input wire signed [(3'h4):(1'h0)] wire129;
  input wire [(4'hc):(1'h0)] wire128;
  input wire [(3'h5):(1'h0)] wire127;
  input wire signed [(5'h11):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire160;
  wire [(4'hb):(1'h0)] wire159;
  wire [(4'h8):(1'h0)] wire158;
  wire [(4'hc):(1'h0)] wire157;
  wire signed [(4'h8):(1'h0)] wire156;
  wire [(3'h7):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire140;
  wire signed [(5'h15):(1'h0)] wire139;
  wire signed [(5'h12):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire131;
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg134 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire133,
                 wire132,
                 wire131,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire131 = wire130;
  assign wire132 = (^((wire128 ?
                           (wire130 && ((8'hb6) ?
                               wire128 : wire127)) : ((8'h9f) ?
                               {wire129} : (wire128 ? wire128 : wire128))) ?
                       ((wire130 ?
                               wire130[(4'h9):(3'h6)] : wire130[(5'h15):(4'hd)]) ?
                           wire126 : wire126[(4'ha):(1'h0)]) : (-wire127)));
  assign wire133 = $unsigned(((!$unsigned(wire130)) ?
                       {wire128,
                           (&((8'ha9) ~^ wire128))} : $unsigned({$signed(wire126)})));
  always
    @(posedge clk) begin
      reg134 <= wire131[(3'h4):(2'h2)];
      reg135 <= {$unsigned(wire129)};
      reg136 <= (^(~|$signed(((wire133 ?
          wire131 : wire131) + $unsigned(reg134)))));
      reg137 <= ((|wire132[(4'hf):(3'h6)]) ?
          wire127[(3'h4):(1'h1)] : wire132[(5'h10):(4'h8)]);
    end
  assign wire138 = ($unsigned($signed((~|{(7'h41)}))) >= (&(((reg137 << wire131) ?
                           wire129[(2'h2):(2'h2)] : (wire133 ?
                               (8'hbc) : wire126)) ?
                       (~(8'hba)) : $unsigned($signed((8'ha4))))));
  assign wire139 = $signed(wire129[(1'h1):(1'h0)]);
  assign wire140 = $signed($signed((8'hb3)));
  assign wire141 = $unsigned($signed(((~^(wire133 ?
                       (8'h9d) : wire128)) ~^ (^~wire133))));
  always
    @(posedge clk) begin
      reg142 <= $signed(wire127[(1'h0):(1'h0)]);
      reg143 <= (({(((8'ha7) ?
                  reg137 : wire129) < reg137[(1'h1):(1'h1)])} & (-($signed(reg135) ?
              (wire133 || wire141) : {(8'h9f), wire132}))) ?
          $signed((wire128 || $unsigned((+wire131)))) : (wire126[(1'h0):(1'h0)] >>> ($unsigned((wire132 <<< (8'hbf))) ~^ $signed(wire140[(4'he):(3'h6)]))));
      reg144 <= wire138;
      if ($unsigned(wire132))
        begin
          reg145 <= (!$signed((&reg134[(3'h7):(3'h5)])));
          reg146 <= $signed($unsigned($unsigned($unsigned(reg145))));
        end
      else
        begin
          reg145 <= ($signed($unsigned($unsigned($unsigned(wire140)))) ?
              reg143 : ((-(wire126[(2'h3):(1'h1)] <<< $signed(wire126))) > $signed(reg144[(4'hc):(4'hc)])));
          reg146 <= ($unsigned(reg143) ?
              {(reg137 ?
                      $unsigned({wire141,
                          wire141}) : (^~wire128[(1'h0):(1'h0)])),
                  $unsigned((wire127 ^~ (&wire132)))} : reg135[(4'h8):(3'h7)]);
        end
      reg147 <= (((+($unsigned(wire129) ?
          $unsigned((8'hb6)) : {wire140,
              wire132})) + $signed(($signed(wire139) <= reg136))) >= (($signed((wire126 <= wire129)) ?
          ((wire138 ^~ wire128) >> (reg135 & (8'h9d))) : $signed((wire139 <= reg136))) >> $signed(($signed(wire127) <= $unsigned(reg134)))));
    end
  always
    @(posedge clk) begin
      reg148 <= {{(~^({wire130} ? $unsigned(wire129) : $signed((8'hbc))))},
          wire141[(3'h4):(2'h3)]};
      reg149 <= {{$unsigned($signed(wire132)), wire138[(5'h10):(5'h10)]},
          ($signed(((reg144 ? wire141 : wire127) <<< (reg142 ?
                  (8'hae) : reg142))) ?
              $signed(reg144) : $signed(($unsigned(reg145) ?
                  (reg147 * wire133) : (wire138 <= reg143))))};
    end
  assign wire150 = ($unsigned((((wire140 ? wire133 : wire133) ?
                               (~&reg137) : reg145) ?
                           (8'hb6) : reg136)) ?
                       (|{(^~wire130)}) : ({(&(wire131 > reg134))} ?
                           wire126 : ((!(^~reg135)) + ((reg142 ?
                               (8'hb2) : (8'hb2)) <= $signed(reg142)))));
  assign wire151 = $signed((reg148 || $signed($unsigned({(8'had), wire141}))));
  assign wire152 = (^{wire140[(4'ha):(4'h8)]});
  assign wire153 = (|$unsigned((8'hbb)));
  assign wire154 = $signed(wire150[(1'h1):(1'h0)]);
  assign wire155 = $signed(((^(reg145[(3'h6):(1'h1)] < (wire152 ?
                           wire129 : reg146))) ?
                       ($signed((8'had)) ?
                           reg145 : ({wire154,
                               reg149} - (wire128 ~^ (8'ha6)))) : $unsigned((^reg148))));
  assign wire156 = {{$unsigned((wire150 ? {(8'ha7), wire139} : (|wire150)))}};
  assign wire157 = ($signed((~^($unsigned(wire141) && $unsigned(wire127)))) ?
                       {$unsigned(($signed(wire155) ?
                               wire153[(3'h7):(3'h5)] : wire127)),
                           reg143[(4'h8):(3'h5)]} : wire151);
  assign wire158 = ((8'h9f) ?
                       $unsigned((^((^~wire128) ?
                           ((7'h41) ?
                               reg149 : reg136) : {reg148}))) : reg147[(3'h6):(2'h2)]);
  assign wire159 = $signed($signed($unsigned(wire132)));
  assign wire160 = ((^wire154[(5'h10):(4'hf)]) >= $unsigned(wire157));
endmodule

module module48
#(parameter param78 = ((((~&((8'hb4) ? (8'h9f) : (8'hb0))) ? (((8'hb5) ? (8'hb2) : (8'h9c)) && ((8'h9e) - (8'hae))) : {{(8'hb9)}, (^(8'h9f))}) > (!((|(7'h41)) ? (^~(8'hae)) : ((8'ha1) == (8'ha1))))) << (((~|(-(8'hb7))) ^ (((8'had) ? (7'h43) : (8'hb2)) ? ((8'haa) ? (8'h9c) : (8'hb6)) : ((8'hb4) ^ (8'ha8)))) == (((8'hb1) ? {(8'hb4), (8'hb8)} : (~|(8'h9f))) ? (~^((8'ha0) ? (8'hb9) : (8'ha0))) : (((8'ha5) >= (8'hab)) ? ((8'hba) ? (8'ha3) : (8'hb9)) : ((8'hb4) << (8'ha1)))))), 
parameter param79 = param78)
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire53;
  input wire signed [(4'hf):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire51;
  input wire signed [(5'h13):(1'h0)] wire50;
  input wire [(3'h6):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  assign y = {wire77,
                 wire73,
                 wire71,
                 wire68,
                 wire66,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg76,
                 reg75,
                 reg74,
                 reg72,
                 reg70,
                 reg69,
                 reg67,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire54 = (wire52 * (wire51[(4'h9):(3'h6)] | $signed(wire49[(1'h0):(1'h0)])));
  assign wire55 = (+(~&($signed($unsigned(wire49)) ?
                      wire51 : $unsigned(wire49[(1'h0):(1'h0)]))));
  assign wire56 = ((wire54[(1'h0):(1'h0)] ?
                      $signed(wire49) : (~wire49[(2'h3):(1'h0)])) ~^ $signed($unsigned({(wire52 >> wire50)})));
  assign wire57 = $unsigned(wire52);
  assign wire58 = ((($unsigned((8'hb2)) * $unsigned($signed(wire56))) >>> (~((8'h9d) ?
                          ((8'had) & wire57) : $signed(wire55)))) ?
                      (($unsigned(wire55) ? {$signed(wire49)} : wire56) ?
                          $signed(((^~wire53) >>> {(8'ha2)})) : (|((wire50 ?
                              (8'hb2) : (7'h44)) + (wire57 ?
                              wire54 : (8'hac))))) : (wire54[(1'h1):(1'h1)] ?
                          {(^(|wire51))} : (8'hae)));
  assign wire59 = wire50[(4'he):(4'h8)];
  assign wire60 = wire53;
  assign wire61 = wire49;
  assign wire62 = (($unsigned(wire55) >= wire59[(4'hb):(3'h5)]) ?
                      {($unsigned(wire56) ?
                              ((-(8'hb8)) ?
                                  wire58 : $signed(wire54)) : $unsigned({(8'ha9),
                                  wire54}))} : $unsigned(wire53[(3'h5):(2'h3)]));
  always
    @(posedge clk) begin
      reg63 <= wire56;
      reg64 <= wire50[(1'h1):(1'h0)];
      reg65 <= wire57[(3'h5):(1'h1)];
    end
  assign wire66 = reg63;
  always
    @(posedge clk) begin
      reg67 <= (($signed(wire61[(1'h1):(1'h0)]) * (((wire55 ?
              (8'hb0) : wire59) == (~|(8'hbd))) ?
          $signed((wire59 ? wire60 : (7'h40))) : {wire53})) ^ wire61);
    end
  assign wire68 = wire54[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg69 <= (+$unsigned(reg65));
      reg70 <= {wire54[(1'h1):(1'h0)]};
    end
  assign wire71 = $signed(((((~&wire61) ?
                          (reg67 ?
                              wire49 : (8'ha4)) : $signed(reg64)) << (wire61[(2'h2):(1'h1)] ?
                          (wire49 < wire66) : {reg64})) ?
                      wire62 : wire49[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg72 <= $signed({((|wire66[(4'hd):(3'h5)]) << ((~|wire54) != $signed((8'ha2)))),
          $unsigned(($unsigned(wire57) - (&reg64)))});
    end
  assign wire73 = ((((8'ha0) >= $signed((-reg70))) ?
                          (({reg72} ^~ (^(8'ha1))) ^ wire53[(1'h1):(1'h1)]) : {wire50,
                              $signed((reg70 > wire57))}) ?
                      (+wire56) : ($signed($unsigned((!wire49))) | wire61[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg74 <= $signed($unsigned($signed((!{reg70}))));
      reg75 <= wire49[(3'h5):(1'h0)];
      reg76 <= $signed(wire71[(3'h4):(2'h3)]);
    end
  assign wire77 = ((!$unsigned((^(wire53 ? wire71 : wire54)))) ?
                      ((^~wire57[(2'h3):(2'h2)]) ?
                          reg70[(1'h1):(1'h1)] : reg70) : $unsigned((^{(~|(7'h43))})));
endmodule

module module17
#(parameter param41 = ({(({(8'ha6)} ? ((8'hb4) == (8'h9c)) : ((8'hb5) ? (8'hb8) : (7'h41))) <= (~|((8'hbe) ~^ (8'ha1))))} | (~^((((8'hbd) ? (8'ha4) : (8'hb0)) ~^ ((7'h43) <= (7'h40))) ? (~^((7'h40) ? (8'hb5) : (8'hb6))) : {{(8'haa), (8'haf)}}))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire22 = (~|$signed($signed((^{wire19, wire18}))));
  assign wire23 = wire22[(3'h4):(1'h1)];
  assign wire24 = ((^~$unsigned($signed($unsigned((8'ha2))))) ^~ $unsigned($signed($signed(((8'ha3) ?
                      wire19 : wire23)))));
  assign wire25 = (wire22 ?
                      wire21 : ({wire23[(3'h4):(2'h3)]} ?
                          $unsigned(wire18[(2'h2):(1'h1)]) : {wire20[(2'h3):(1'h0)],
                              $unsigned($unsigned((8'h9f)))}));
  assign wire26 = wire20[(4'h9):(2'h3)];
  assign wire27 = $signed((~&wire21[(2'h3):(2'h3)]));
  assign wire28 = $unsigned($unsigned((((wire24 | wire27) + (wire22 ?
                          (8'h9c) : wire23)) ?
                      $unsigned($signed(wire20)) : $signed((wire23 ?
                          wire26 : wire20)))));
  assign wire29 = wire28[(3'h4):(1'h1)];
  assign wire30 = (({{wire28}, $unsigned((wire23 ? wire28 : (8'ha4)))} ?
                      (8'ha6) : ({(wire20 | wire29)} && ($signed(wire28) ?
                          $signed((8'hb3)) : (^~(8'haf))))) * {((~&(wire24 << wire18)) * wire20),
                      {wire18[(1'h1):(1'h0)]}});
  assign wire31 = (wire20 ^~ (wire26[(1'h0):(1'h0)] ?
                      $signed(((wire18 && wire30) ?
                          (wire25 + wire23) : (~|wire27))) : $unsigned($unsigned($signed(wire21)))));
  always
    @(posedge clk) begin
      reg32 <= ((wire24 ?
          wire31 : $unsigned(($signed(wire31) ?
              (~^wire26) : $unsigned(wire29)))) >= (-wire22));
      if ($signed($unsigned($signed(((wire29 ? (8'hb4) : wire25) ?
          reg32[(2'h2):(1'h1)] : (wire19 && (8'ha2)))))))
        begin
          reg33 <= ({wire19[(2'h2):(2'h2)]} ?
              ($signed($signed(reg32)) * wire22) : $unsigned(($signed(wire26) ?
                  ({wire22} ?
                      {(8'ha8),
                          wire26} : $signed(wire28)) : ($signed(wire27) != $signed(wire26)))));
          reg34 <= reg32;
        end
      else
        begin
          reg33 <= $unsigned((wire20 * (8'hb0)));
          if ($unsigned((wire30 ?
              $unsigned((^wire30[(3'h5):(1'h0)])) : $signed((^~reg34)))))
            begin
              reg34 <= (~&wire21[(4'hd):(4'h8)]);
              reg35 <= (wire27[(3'h4):(2'h3)] & (!(wire31[(3'h4):(1'h0)] ~^ $signed(wire18[(1'h0):(1'h0)]))));
              reg36 <= (8'hae);
              reg37 <= (wire25 ^ (~^$signed($signed($unsigned(reg34)))));
              reg38 <= $signed(wire28);
            end
          else
            begin
              reg34 <= (-reg32[(3'h5):(1'h1)]);
              reg35 <= (&(+((~|{wire25, reg35}) ?
                  ({reg32} ?
                      wire26 : $signed(reg32)) : ((~(8'ha3)) <<< ((8'ha9) * wire28)))));
              reg36 <= ((~&$signed(((wire25 + wire27) ?
                      (!reg32) : (wire22 ? (8'hbf) : reg38)))) ?
                  ((~^reg35) + $unsigned((wire29[(3'h6):(3'h5)] ^~ wire29))) : ($unsigned((^~(wire18 + wire29))) > $signed({{(8'hb2),
                          (8'hb8)}})));
              reg37 <= {$unsigned($signed(($signed(reg37) - $signed(wire29)))),
                  ((reg33[(3'h5):(2'h2)] == $signed(wire25[(1'h1):(1'h0)])) ?
                      $unsigned(reg32[(3'h4):(2'h2)]) : ((-wire28) | reg38))};
              reg38 <= ({{{(wire23 | reg38)}, wire19[(1'h1):(1'h1)]}, reg34} ?
                  $unsigned({(((8'hbe) ? wire18 : wire25) ?
                          $signed(wire25) : (wire24 ? reg35 : wire21)),
                      (|(reg33 ? wire29 : reg38))}) : $unsigned(reg32));
            end
        end
    end
  assign wire39 = (wire30 ?
                      wire28[(2'h3):(2'h3)] : (reg32 ?
                          $unsigned(reg35) : reg36[(3'h7):(3'h6)]));
  assign wire40 = ((~&((reg37 ?
                          (wire29 ?
                              wire28 : reg35) : $signed(reg36)) * (8'hb2))) ?
                      wire21 : (^~(wire23[(1'h1):(1'h0)] >> {$signed(wire19),
                          (wire24 ? wire22 : (8'hbe))})));
endmodule
