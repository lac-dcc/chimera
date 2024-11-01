module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire167;
  wire [(4'h9):(1'h0)] wire165;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  assign y = {wire168, wire167, wire165, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned((8'ha0));
  assign wire6 = $signed(({wire5[(4'hb):(4'h8)]} == (~(~^$signed(wire2)))));
  assign wire7 = ($signed((wire2 <<< wire0)) <<< {(8'hae),
                     (wire3[(4'hb):(3'h4)] > $signed((~&(8'ha8))))});
  module8 #() modinst166 (.wire9(wire1), .wire10(wire5), .y(wire165), .wire11(wire0), .clk(clk), .wire12(wire4));
  assign wire167 = (&wire0[(3'h5):(3'h5)]);
  assign wire168 = (~^(~|wire167));
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h2a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire163;
  wire signed [(3'h4):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  assign y = {wire163,
                 wire131,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire71,
                 wire69,
                 wire26,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
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
                 reg132,
                 reg133,
                 (1'h0)};
  assign wire13 = $signed((wire10[(1'h1):(1'h1)] ^ ((^~{(8'hae)}) ^ (^wire12))));
  assign wire14 = (8'ha5);
  assign wire15 = wire12[(2'h3):(1'h1)];
  assign wire16 = $unsigned(wire15);
  always
    @(posedge clk) begin
      reg17 <= {$unsigned((wire13 ~^ {(8'hb0)})), wire9};
      reg18 <= (((({wire9, wire11} ?
                      (wire11 ? (8'hbc) : wire11) : (wire14 ^~ wire14)) ?
                  wire13[(4'hc):(3'h7)] : {$signed(wire12), wire9}) ?
              (!{wire9}) : ($signed($unsigned(wire10)) ?
                  $unsigned((wire15 ? wire9 : (8'hbd))) : wire9)) ?
          (|$unsigned(wire11)) : (wire12 >= wire11[(2'h2):(2'h2)]));
      reg19 <= ((|(8'hbd)) ?
          wire16[(2'h2):(1'h1)] : ((wire12 ?
              (wire13[(3'h4):(2'h2)] ~^ wire11) : (~&wire10[(2'h2):(1'h1)])) ~^ $unsigned($unsigned(wire10[(1'h0):(1'h0)]))));
      reg20 <= ((^((wire9 | wire15[(3'h4):(1'h1)]) >> (!((8'hab) ?
              reg18 : wire12)))) ?
          {(wire9 >= ($unsigned(wire11) <<< $signed(wire15))),
              ($unsigned($signed((8'ha3))) ?
                  $unsigned((wire10 ?
                      wire13 : wire16)) : {(&wire12)})} : ($unsigned(({wire15,
                  wire9} >> (~wire16))) ?
              (^~((~reg17) != (wire16 | reg18))) : ($unsigned((!reg17)) ^ ({wire14} ^~ (&reg17)))));
      if ($signed((($unsigned((reg18 ^~ (8'haf))) || (^~$signed(wire10))) ?
          wire12[(2'h2):(2'h2)] : $unsigned(reg19))))
        begin
          reg21 <= ($unsigned(($signed($unsigned(wire11)) ?
              $signed(wire13[(3'h6):(3'h5)]) : (8'ha7))) <= {$unsigned($signed({wire14,
                  reg19})),
              $signed($signed(((8'ha2) - reg17)))});
        end
      else
        begin
          reg21 <= (8'hb3);
          reg22 <= (((~|((wire9 ?
              reg21 : (8'hbc)) != reg17[(2'h3):(1'h1)])) || (+(8'haf))) | ((8'ha6) ?
              wire12[(3'h4):(3'h4)] : wire10));
          reg23 <= $signed(reg19[(3'h7):(3'h6)]);
          reg24 <= reg23;
          reg25 <= reg22[(2'h2):(2'h2)];
        end
    end
  assign wire26 = (^~$unsigned((-{(reg21 + reg18)})));
  module27 #() modinst70 (wire69, clk, reg18, reg17, reg20, wire15, wire26);
  assign wire71 = $signed(((~&(!(~^wire13))) ?
                      $signed($unsigned((wire16 << reg18))) : (~^$unsigned(reg24))));
  module72 #() modinst99 (.wire73(reg24), .clk(clk), .y(wire98), .wire74(wire71), .wire75(reg25), .wire76(wire10));
  assign wire100 = reg21;
  assign wire101 = $signed($signed({$unsigned(((8'hbe) ? wire9 : wire71)),
                       ($unsigned(wire13) ?
                           $signed(reg17) : $unsigned((8'hb2)))}));
  assign wire102 = {{$unsigned(($signed(wire101) ?
                               {wire101, wire16} : (-wire11))),
                           (~&$unsigned($unsigned((8'hb8))))}};
  assign wire103 = $unsigned(($unsigned((+(8'ha8))) && (+((8'hae) ?
                       $unsigned(wire13) : $unsigned(wire98)))));
  assign wire104 = $signed(reg19[(4'hc):(3'h4)]);
  assign wire105 = ({wire71[(1'h0):(1'h0)],
                       $signed(((wire14 ? wire15 : (8'hb6)) > {wire98,
                           wire102}))} >= wire15[(3'h4):(1'h0)]);
  assign wire106 = $signed($unsigned($signed(wire104)));
  always
    @(posedge clk) begin
      if ((^~$signed((8'ha7))))
        begin
          if ((!$unsigned($unsigned($signed((+(8'ha6)))))))
            begin
              reg107 <= (!wire98);
              reg108 <= reg107[(1'h1):(1'h1)];
              reg109 <= (-(+$unsigned((reg20[(4'hb):(2'h2)] ?
                  $unsigned(wire14) : (wire105 < wire13)))));
            end
          else
            begin
              reg107 <= wire101[(2'h3):(1'h0)];
              reg108 <= $signed((~|reg19[(4'hc):(1'h0)]));
            end
        end
      else
        begin
          reg107 <= ($signed(wire12) ? $signed(wire16) : reg107);
          reg108 <= ($unsigned((wire69 ?
              $unsigned($unsigned(wire69)) : $signed(((8'ha5) <<< reg18)))) || $unsigned(reg17[(4'h9):(3'h6)]));
          reg109 <= (~|$unsigned(((|wire13) + reg19)));
          if ($signed($signed(((&$unsigned(wire105)) ?
              reg19 : ((^wire9) ?
                  (wire14 > reg17) : (wire26 ? (8'hbb) : wire105))))))
            begin
              reg110 <= wire101[(3'h5):(3'h4)];
              reg111 <= $signed({(wire71 ?
                      (wire12 ? (wire11 ^~ reg24) : (&wire101)) : {{reg22,
                              wire71}}),
                  (&(|{reg107}))});
            end
          else
            begin
              reg110 <= ((-((^reg18) && ((wire103 ? reg19 : reg23) ?
                      reg22[(1'h0):(1'h0)] : (wire26 * reg110)))) ?
                  ((($signed(reg22) <<< reg24[(5'h13):(4'he)]) ?
                      wire106 : (~&$signed((8'haa)))) ~^ (~^wire69)) : ($unsigned(wire13[(1'h1):(1'h1)]) ?
                      (wire10[(3'h5):(1'h0)] + (|$unsigned((8'h9e)))) : $signed(reg110[(4'hd):(4'hb)])));
              reg111 <= wire106;
              reg112 <= $unsigned(reg19);
              reg113 <= (|$signed($unsigned(($signed(wire12) ?
                  (reg107 ? wire14 : reg17) : {(8'hb7), reg18}))));
            end
          reg114 <= $signed((^~{(+$signed(reg108))}));
        end
      if ($signed(wire10[(5'h12):(4'hf)]))
        begin
          reg115 <= $signed(wire13);
          reg116 <= (~|reg108);
          reg117 <= (&(-($unsigned($signed((8'h9f))) ?
              {$unsigned(wire102)} : $unsigned(((8'ha4) * reg18)))));
          reg118 <= $signed(($unsigned(wire13[(4'hb):(3'h4)]) || ((~|reg117[(4'hb):(2'h3)]) ?
              $unsigned(reg110[(4'h8):(3'h4)]) : $unsigned((wire26 ^ reg107)))));
          if ($unsigned(reg118[(4'hb):(4'h9)]))
            begin
              reg119 <= ((~|({(reg18 ?
                      wire14 : reg17)} + reg113[(4'ha):(4'h8)])) & wire13);
              reg120 <= reg17;
              reg121 <= (&wire105[(1'h1):(1'h1)]);
              reg122 <= reg113[(1'h0):(1'h0)];
              reg123 <= $unsigned($signed((&reg24)));
            end
          else
            begin
              reg119 <= (reg22[(2'h2):(1'h0)] ?
                  $signed($unsigned($signed($unsigned(reg109)))) : $unsigned($unsigned((wire69[(2'h3):(1'h1)] >>> (reg121 ?
                      (7'h41) : (8'hb3))))));
              reg120 <= (reg111 ?
                  $unsigned(($signed($signed(reg24)) ^~ $unsigned({(8'hb1)}))) : ($unsigned((!reg116[(4'hc):(3'h4)])) ^~ (((reg113 ~^ reg120) ?
                      (&wire9) : reg122[(4'hc):(3'h5)]) ^~ reg117)));
              reg121 <= (($unsigned((^(~^reg109))) ?
                  (^~$unsigned(reg123)) : (reg17[(2'h3):(1'h1)] << reg25[(1'h0):(1'h0)])) != (+wire10[(4'ha):(3'h5)]));
              reg122 <= reg115[(4'h9):(4'h8)];
            end
        end
      else
        begin
          if (reg20)
            begin
              reg115 <= (wire12[(2'h2):(2'h2)] ?
                  $unsigned($signed((reg17[(1'h1):(1'h1)] ?
                      wire26 : reg117))) : wire103[(3'h5):(1'h0)]);
              reg116 <= ((~&reg110) - (wire98 ?
                  reg109 : (wire10[(4'h9):(3'h5)] >> ((reg119 ?
                      wire71 : reg23) | (reg123 ? reg23 : wire10)))));
              reg117 <= reg109[(2'h3):(1'h1)];
            end
          else
            begin
              reg115 <= wire71[(4'hd):(2'h2)];
              reg116 <= {reg115[(4'h9):(3'h6)],
                  $unsigned((reg119[(2'h2):(1'h1)] ? reg107 : {(&reg111)}))};
            end
          if ($unsigned($unsigned(wire102)))
            begin
              reg118 <= reg114[(2'h2):(1'h0)];
              reg119 <= (+$signed($signed($signed($signed(reg20)))));
              reg120 <= ((-$unsigned(((^reg111) ?
                      (reg109 ? wire12 : reg22) : ((7'h43) ?
                          reg119 : reg25)))) ?
                  ((wire71[(5'h10):(3'h6)] + $unsigned(wire106)) >= reg121[(4'hb):(3'h4)]) : reg23[(1'h0):(1'h0)]);
              reg121 <= (8'h9c);
            end
          else
            begin
              reg118 <= (~(($unsigned(((8'hb1) > reg17)) ?
                  $unsigned((wire12 && wire105)) : $signed((~^(7'h40)))) ^ wire103));
              reg119 <= $signed(reg123);
              reg120 <= {$signed((reg122[(4'hf):(4'h9)] ?
                      (^~reg111) : wire101)),
                  reg116[(4'hd):(3'h7)]};
              reg121 <= ((|$unsigned((7'h44))) ?
                  ((-$signed($signed(wire16))) != (((!reg113) ^~ $signed(reg23)) ?
                      reg120[(4'h9):(1'h1)] : {(reg107 ?
                              (8'hb8) : wire98)})) : {reg110[(4'hf):(2'h3)]});
            end
          reg122 <= $unsigned(($signed(wire106[(1'h0):(1'h0)]) && reg117[(3'h5):(1'h0)]));
          reg123 <= $signed((((|((8'hab) ?
              wire69 : (8'hbc))) | wire13[(4'hb):(3'h4)]) ^~ {reg20}));
          reg124 <= (((reg120 ? reg122 : wire69) ?
                  $unsigned($unsigned((+(8'h9f)))) : $unsigned((8'hb2))) ?
              (reg107 >> (|$unsigned((7'h43)))) : wire104[(1'h1):(1'h1)]);
        end
      reg125 <= (&reg113[(2'h2):(2'h2)]);
      reg126 <= ((reg109[(4'h9):(3'h5)] ?
              $unsigned($signed((wire9 >= (8'hbf)))) : $unsigned((|(-reg18)))) ?
          wire9 : $unsigned($unsigned({wire69, $unsigned(reg20)})));
      if ($unsigned(wire105))
        begin
          reg127 <= ($unsigned($signed($signed((wire71 * wire11)))) < wire71);
          reg128 <= (&{$unsigned($unsigned($unsigned(wire16)))});
          reg129 <= $signed({(~^($unsigned(reg123) >= reg24[(5'h12):(5'h10)])),
              ((~wire101[(2'h3):(1'h1)]) ?
                  reg110 : $signed(wire14[(3'h4):(2'h2)]))});
          reg130 <= $unsigned({wire104[(3'h6):(3'h5)], $unsigned((8'ha2))});
        end
      else
        begin
          reg127 <= $unsigned({(&($signed(wire11) ^ (reg119 ?
                  wire98 : reg114)))});
          if (reg125[(5'h11):(4'h8)])
            begin
              reg128 <= $signed(($signed($unsigned(wire12[(1'h1):(1'h1)])) ?
                  $signed((~(wire100 & reg108))) : ({(8'hac),
                      ((8'h9d) ? wire26 : wire101)} | reg128)));
              reg129 <= wire100;
            end
          else
            begin
              reg128 <= (8'ha4);
            end
          reg130 <= {$unsigned((reg124 ^~ reg122[(4'hc):(3'h6)]))};
        end
    end
  assign wire131 = (8'hb6);
  always
    @(posedge clk) begin
      reg132 <= (8'hb2);
      reg133 <= wire105;
    end
  module134 #() modinst164 (wire163, clk, wire69, wire13, wire102, wire100, reg25);
endmodule

module module134
#(parameter param162 = (+(((8'hac) ? {(+(8'h9f))} : (((8'h9f) - (8'hac)) ? (^~(8'ha0)) : (-(8'haa)))) <= ((|{(8'ha7), (8'hb9)}) ? (((8'hb8) < (8'h9d)) ? ((8'hb0) ? (8'hac) : (8'had)) : (^~(8'hac))) : (|((8'hbc) ? (8'ha6) : (8'h9e)))))))
(y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire139;
  input wire [(3'h7):(1'h0)] wire138;
  input wire signed [(4'h9):(1'h0)] wire137;
  input wire signed [(5'h11):(1'h0)] wire136;
  input wire [(4'he):(1'h0)] wire135;
  wire signed [(5'h10):(1'h0)] wire161;
  wire signed [(4'h9):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire signed [(4'h8):(1'h0)] wire144;
  wire signed [(2'h3):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire140;
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 reg158,
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
  assign wire140 = {$unsigned((((wire138 ? wire135 : (8'had)) ?
                           $signed((8'ha3)) : {wire135, wire135}) << wire135))};
  assign wire141 = (-$unsigned((($signed(wire138) > $unsigned(wire139)) - wire137[(4'h8):(2'h3)])));
  assign wire142 = (&wire140);
  assign wire143 = wire137;
  assign wire144 = wire142[(1'h1):(1'h1)];
  assign wire145 = $signed({{{wire135[(4'hb):(2'h2)]}, wire143}});
  assign wire146 = $signed($unsigned($signed((8'hae))));
  always
    @(posedge clk) begin
      if ($signed($unsigned($signed($signed((wire137 ? wire144 : wire136))))))
        begin
          reg147 <= ((~^wire135) ?
              (!$unsigned({(wire143 ?
                      wire145 : wire138)})) : (^~$signed($unsigned(wire137[(2'h3):(2'h3)]))));
        end
      else
        begin
          reg147 <= (~wire141);
        end
      if ((~&wire139[(2'h2):(2'h2)]))
        begin
          reg148 <= ($signed({{(wire136 ~^ wire145)}}) & (^~wire135));
          reg149 <= wire145[(1'h0):(1'h0)];
          if (wire137[(1'h1):(1'h1)])
            begin
              reg150 <= ((|(-((|wire145) ? (-reg148) : $signed((8'ha8))))) ?
                  reg147[(1'h0):(1'h0)] : (~&{wire140[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg150 <= $signed($signed(wire140));
              reg151 <= wire143[(2'h3):(2'h2)];
              reg152 <= $unsigned(wire140);
            end
        end
      else
        begin
          if ($unsigned($unsigned(wire145[(4'h8):(4'h8)])))
            begin
              reg148 <= wire144;
              reg149 <= {$signed($signed($unsigned($signed(reg151))))};
              reg150 <= (&(^~$signed(wire140[(1'h0):(1'h0)])));
              reg151 <= {$signed({{((8'ha4) ^~ wire136)}}), wire139};
              reg152 <= $signed(wire142[(3'h6):(3'h6)]);
            end
          else
            begin
              reg148 <= ($signed(reg151) << $signed(wire142));
              reg149 <= $unsigned($signed((^(wire144[(2'h2):(1'h0)] ?
                  (wire138 ^~ reg149) : (wire143 ^~ wire137)))));
              reg150 <= (^(wire135[(2'h3):(1'h0)] ?
                  {(8'ha8)} : $unsigned((8'ha1))));
              reg151 <= reg149;
              reg152 <= reg148[(3'h4):(2'h3)];
            end
          reg153 <= wire141;
          reg154 <= $signed((~((~&$unsigned(reg147)) ?
              (wire146 ? (|reg147) : {reg149, reg151}) : $unsigned((wire136 ?
                  reg149 : (8'ha5))))));
        end
      reg155 <= (~&wire144);
      reg156 <= $unsigned(((($unsigned(wire144) ?
              $unsigned(reg154) : $unsigned(wire136)) ?
          ((wire145 == reg154) ?
              wire139 : $signed(reg150)) : $unsigned($signed(wire146))) != {reg147[(3'h7):(3'h7)]}));
    end
  assign wire157 = wire139;
  always
    @(posedge clk) begin
      reg158 <= wire144[(4'h8):(3'h5)];
    end
  assign wire159 = (wire138[(3'h5):(3'h5)] ?
                       {((reg151 >= {reg153, reg152}) ?
                               (~wire137[(4'h8):(2'h3)]) : (|$signed(reg155)))} : ($signed(({reg150,
                                   reg147} ?
                               ((8'hbc) ? reg154 : reg155) : (reg151 ?
                                   wire139 : wire140))) ?
                           $unsigned(($unsigned((8'ha5)) ?
                               (reg151 ?
                                   (8'had) : reg148) : (wire142 - wire136))) : reg148[(4'hc):(4'ha)]));
  assign wire160 = wire157;
  assign wire161 = {{$signed(wire139[(1'h0):(1'h0)]),
                           ($signed(reg152) & ($signed(wire137) ?
                               (wire146 && wire141) : {reg151}))},
                       ((^~$unsigned((^~(7'h40)))) ? reg153 : (-wire160))};
endmodule

module module72  (y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire76;
  input wire signed [(4'hb):(1'h0)] wire75;
  input wire signed [(4'hf):(1'h0)] wire74;
  input wire [(5'h14):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
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
                 reg81,
                 (1'h0)};
  assign wire77 = ($signed(($signed(wire75[(4'h9):(3'h7)]) ?
                          $signed((|wire75)) : (8'h9e))) ?
                      (~(wire74[(1'h0):(1'h0)] + (+(!(8'hbc))))) : (&$signed($signed((+wire73)))));
  assign wire78 = (&$signed({$unsigned((wire73 ? wire77 : wire75))}));
  assign wire79 = ($unsigned($signed($unsigned(wire76))) - $unsigned($signed(($signed(wire76) ?
                      wire77 : (wire78 ? wire73 : wire77)))));
  assign wire80 = $unsigned({(+((^~wire75) >= (wire78 ? wire75 : wire79)))});
  always
    @(posedge clk) begin
      if ($unsigned(($signed($signed({wire74, wire77})) ~^ (-(~(wire77 ?
          wire76 : (8'hbe)))))))
        begin
          if (($unsigned((wire75 <= $unsigned((wire76 ^~ wire77)))) ^ (+wire74[(3'h4):(2'h2)])))
            begin
              reg81 <= wire77;
              reg82 <= (~|$unsigned((&$signed((+wire77)))));
              reg83 <= $signed(reg81);
            end
          else
            begin
              reg81 <= $unsigned($signed(wire79));
              reg82 <= $signed({(|reg81[(4'hc):(3'h6)]),
                  wire75[(4'h8):(1'h1)]});
              reg83 <= ($signed($signed(wire74[(4'hb):(1'h0)])) ?
                  wire74[(4'hf):(1'h0)] : wire79);
              reg84 <= (~&(^~{wire73[(4'hd):(3'h5)],
                  ((~wire73) ? (8'hbd) : $unsigned(wire79))}));
            end
          if ((($signed($unsigned(wire76)) >= ($unsigned((wire80 ?
                  wire76 : reg83)) || (~^$signed(wire79)))) ?
              (({$unsigned(wire73), $unsigned(wire76)} ?
                      (wire76[(3'h4):(2'h2)] ?
                          $unsigned(wire80) : $unsigned(reg81)) : (reg82[(1'h1):(1'h0)] ^ wire76)) ?
                  $signed($unsigned((reg82 << (8'ha9)))) : (|$signed((wire73 ^~ wire76)))) : $signed((+wire78[(3'h7):(3'h5)]))))
            begin
              reg85 <= ($unsigned(reg84) || (reg83 ?
                  ((8'hae) ?
                      reg82[(4'hb):(3'h5)] : (^~wire80)) : $unsigned({(wire78 ?
                          wire78 : (8'hb6)),
                      $unsigned(reg84)})));
              reg86 <= ($unsigned(((8'hb5) ?
                  $unsigned((~&wire73)) : $signed(((8'ha6) >> wire75)))) * (wire77[(5'h12):(4'hd)] ?
                  {(8'hbb),
                      reg84[(1'h0):(1'h0)]} : (wire75 + reg81[(3'h7):(1'h0)])));
            end
          else
            begin
              reg85 <= {wire80[(3'h6):(3'h4)]};
              reg86 <= (^~$signed($signed((+wire77))));
              reg87 <= $unsigned($unsigned(((8'hb2) ~^ ((wire79 && (8'ha3)) ?
                  ((8'ha3) ? reg82 : (8'ha4)) : $unsigned(reg83)))));
              reg88 <= wire75[(3'h4):(1'h1)];
              reg89 <= wire78[(4'hb):(1'h1)];
            end
          reg90 <= (reg86 ^~ reg87);
          reg91 <= wire79;
          reg92 <= $signed($signed(reg85));
        end
      else
        begin
          if (wire73[(3'h7):(3'h4)])
            begin
              reg81 <= $unsigned($unsigned($signed($signed(reg86))));
              reg82 <= reg82;
            end
          else
            begin
              reg81 <= $signed(wire77[(5'h10):(3'h7)]);
              reg82 <= ((($unsigned((wire77 ? reg81 : (8'hb8))) ?
                  (8'hac) : reg87[(1'h0):(1'h0)]) >> (+reg87[(1'h1):(1'h1)])) << reg86);
            end
          reg83 <= ($signed(wire75) ?
              reg84[(4'hc):(3'h6)] : ((reg92 ?
                      $signed({reg83}) : (^~$signed(wire76))) ?
                  $signed((+{wire78})) : ((!$unsigned(wire80)) ?
                      (~|(wire76 << reg89)) : ($unsigned(reg85) ?
                          (~wire76) : (reg85 ? reg82 : reg86)))));
        end
      reg93 <= ((reg86 & ((wire79[(4'hd):(4'ha)] ? $unsigned(reg85) : (8'ha6)) ?
          reg83 : wire79)) | $signed(reg86));
      reg94 <= wire75;
      reg95 <= $signed((reg82 ?
          (+$unsigned($unsigned(reg82))) : reg89[(1'h1):(1'h1)]));
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((~|(-((7'h41) ? reg85 : wire80))))))
        begin
          reg96 <= $unsigned((^~((reg87 ? reg86[(3'h5):(2'h2)] : (^(8'hab))) ?
              ((wire80 + (8'hb6)) ?
                  (reg95 - (8'hba)) : (reg94 * wire79)) : $unsigned($signed(wire76)))));
          reg97 <= $signed((reg90[(3'h5):(2'h3)] ?
              (wire77[(4'h9):(4'h9)] >>> {(wire74 ?
                      (8'ha8) : reg87)}) : reg95));
        end
      else
        begin
          reg96 <= (~&(((8'hae) ?
              reg95 : (wire79 && wire76[(1'h0):(1'h0)])) < {(^~$unsigned(wire80))}));
        end
    end
endmodule

module module27
#(parameter param68 = (((~|(~^((8'ha0) ? (8'ha2) : (8'hb6)))) ? ((~|((8'hb3) ^~ (8'ha8))) ? (((8'hb6) ^ (8'hb4)) ? (^~(8'ha1)) : ((8'ha5) != (8'ha7))) : ((8'hbc) ? {(8'hb0), (8'hb4)} : {(8'hac)})) : ((((8'ha4) ? (8'hb9) : (8'hb0)) ? ((8'haa) <<< (8'h9e)) : ((8'ha7) ? (8'hba) : (8'ha7))) >= (^~((8'hb4) << (8'ha7))))) ? ((((!(8'ha4)) ? ((8'ha4) ? (8'hba) : (8'hb7)) : ((8'h9f) ? (8'hac) : (8'h9d))) ? ({(8'ha3)} ? ((8'hb9) ? (8'hb6) : (8'h9c)) : {(8'h9c)}) : ((+(8'hb9)) ? ((8'ha6) ? (7'h42) : (8'hac)) : (~&(8'h9c)))) ^ ((~{(7'h42), (7'h42)}) ? ((^~(8'h9d)) ? {(8'hb8)} : (~^(8'ha7))) : {((8'hbf) > (8'hbc))})) : ((7'h44) >> ({{(8'hbe)}, (-(8'ha0))} ^~ ({(8'hb6), (8'hb5)} ? ((8'hb4) ? (8'hb9) : (8'ha6)) : ((8'hb0) ? (8'hb7) : (8'hbe)))))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  input wire [(4'h8):(1'h0)] wire29;
  input wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire33 = {{(8'ha8), wire28}, $signed($signed($signed(wire32)))};
  assign wire34 = ({wire32[(1'h0):(1'h0)]} ?
                      (wire29 ? wire33 : wire32) : wire30);
  assign wire35 = wire31[(1'h0):(1'h0)];
  assign wire36 = $signed(wire32);
  assign wire37 = wire35;
  assign wire38 = wire35;
  assign wire39 = $unsigned((-(&(wire33[(3'h7):(3'h5)] << $unsigned(wire36)))));
  assign wire40 = $unsigned((wire35 << ({$signed(wire28), $unsigned(wire37)} ?
                      (&$signed(wire29)) : wire30)));
  assign wire41 = $unsigned((~|wire40[(4'ha):(4'h8)]));
  assign wire42 = wire28;
  assign wire43 = (~^wire35);
  assign wire44 = $signed((wire40[(4'ha):(3'h4)] ?
                      ((~&(^~(8'hb6))) ?
                          $unsigned($signed((8'haf))) : wire28) : $signed(($unsigned(wire35) < wire29[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg45 <= wire33[(3'h6):(1'h0)];
      reg46 <= wire44[(3'h4):(1'h0)];
      reg47 <= {{(wire36 ?
                  wire28[(4'h8):(3'h4)] : (((8'hbc) + wire41) || {wire37,
                      wire43}))}};
      reg48 <= ((($signed((wire44 ? wire29 : wire33)) ?
                  ($unsigned(wire35) ?
                      wire43 : wire30[(2'h2):(1'h0)]) : {wire28}) ?
              ((8'haa) <= (wire34 ?
                  wire42 : (wire30 <<< wire42))) : {(|(reg45 <<< wire40))}) ?
          (wire43[(3'h4):(3'h4)] | reg47) : ($unsigned(wire43) ?
              (+(wire44 ?
                  (wire40 ~^ reg46) : wire41[(5'h13):(3'h7)])) : wire42[(3'h7):(3'h7)]));
    end
  always
    @(posedge clk) begin
      reg49 <= $unsigned(wire29[(1'h0):(1'h0)]);
      reg50 <= {$signed(($signed($unsigned(wire36)) * $unsigned($signed(wire43)))),
          $unsigned((!$signed($unsigned(wire35))))};
      reg51 <= ($signed($unsigned((((8'ha3) ? reg48 : reg47) ?
              wire43 : (|wire30)))) ?
          wire29 : (8'h9f));
    end
  assign wire52 = $unsigned(((^~((wire30 ?
                          (8'hbb) : reg49) && wire28[(1'h1):(1'h0)])) ?
                      (((7'h42) & wire44) ?
                          $unsigned($unsigned(wire32)) : (wire38[(2'h2):(1'h1)] == $unsigned(wire32))) : (wire29[(3'h4):(1'h1)] ?
                          (reg49[(3'h6):(3'h5)] ?
                              wire35[(4'hd):(4'h8)] : (wire36 ?
                                  (8'haf) : wire40)) : (reg49 ?
                              (wire37 ? wire37 : wire32) : $signed(reg45)))));
  assign wire53 = {$unsigned((reg51[(3'h6):(3'h5)] ?
                          $signed($signed(reg47)) : $signed(wire41)))};
  assign wire54 = ((^reg49) ? wire44[(4'he):(4'h8)] : wire32);
  assign wire55 = $signed({$unsigned(wire32)});
  always
    @(posedge clk) begin
      reg56 <= wire40;
      if ((!reg48))
        begin
          reg57 <= wire41[(4'hd):(2'h3)];
        end
      else
        begin
          if ((((^~((+wire28) ?
                      ((7'h40) ~^ wire36) : ((7'h44) ? (8'hbd) : reg46))) ?
                  reg47[(3'h4):(3'h4)] : $unsigned(wire28)) ?
              ((wire42[(3'h4):(2'h3)] ?
                      ((reg57 ? wire30 : wire34) ?
                          wire36 : (wire52 >>> wire40)) : $unsigned($signed((7'h41)))) ?
                  ((-wire39) ?
                      $signed((|reg49)) : {(!wire55)}) : $signed($signed((wire36 + wire30)))) : wire55[(4'h9):(1'h0)]))
            begin
              reg57 <= (^(wire42[(4'ha):(4'h8)] != wire53));
            end
          else
            begin
              reg57 <= ((((8'hb5) || (^~(reg56 ? wire38 : reg57))) ?
                      $signed(wire53[(2'h2):(2'h2)]) : $signed(wire54[(2'h2):(1'h1)])) ?
                  $signed((((wire52 ? wire55 : wire55) != (reg56 ?
                          wire34 : reg47)) ?
                      $unsigned(((7'h43) ~^ reg47)) : {(+wire38),
                          {wire42, wire29}})) : {($signed((wire31 ?
                              wire30 : reg49)) ?
                          $signed((8'h9e)) : $signed($unsigned(wire54)))});
            end
          reg58 <= (wire30 ? reg46[(3'h7):(1'h0)] : $unsigned((~|wire38)));
          reg59 <= reg50;
          if (wire29)
            begin
              reg60 <= wire30[(3'h4):(2'h3)];
              reg61 <= reg56;
            end
          else
            begin
              reg60 <= reg49[(4'hb):(3'h5)];
              reg61 <= ($signed((~|($signed(reg50) ?
                      wire53[(3'h6):(2'h2)] : wire43[(2'h2):(1'h1)]))) ?
                  $signed(reg60) : wire30);
            end
        end
      reg62 <= (&(~|$unsigned(reg45[(1'h1):(1'h1)])));
      if ($signed(((&$unsigned((|(8'had)))) ?
          (reg61[(3'h6):(2'h2)] ?
              ((8'hbd) ?
                  (wire43 ? wire53 : reg58) : {wire36,
                      wire53}) : wire41) : ((^wire41) ?
              $signed($unsigned(wire38)) : reg45[(1'h0):(1'h0)]))))
        begin
          reg63 <= (|(wire37 ?
              $signed((((8'hb6) != reg48) ?
                  $unsigned(reg58) : {wire35})) : ((+wire28) >> wire35)));
          reg64 <= reg62;
        end
      else
        begin
          reg63 <= (^~reg58);
          reg64 <= ($unsigned(wire39) | ((8'hb4) ? wire39 : wire43));
        end
    end
  assign wire65 = reg48[(3'h4):(1'h0)];
  assign wire66 = {(wire53 * (reg48[(2'h3):(2'h3)] - wire55)),
                      $unsigned($unsigned($unsigned({wire34, wire52})))};
  assign wire67 = wire37;
endmodule
