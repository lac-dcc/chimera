module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire210;
  wire signed [(5'h10):(1'h0)] wire203;
  wire [(5'h14):(1'h0)] wire202;
  wire signed [(5'h14):(1'h0)] wire201;
  wire [(5'h12):(1'h0)] wire199;
  wire signed [(5'h12):(1'h0)] wire133;
  wire [(3'h5):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire205;
  wire [(4'h9):(1'h0)] wire206;
  wire [(3'h6):(1'h0)] wire207;
  wire [(4'hb):(1'h0)] wire208;
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire210,
                 wire203,
                 wire202,
                 wire201,
                 wire199,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire124,
                 wire205,
                 wire206,
                 wire207,
                 wire208,
                 reg126,
                 reg4,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (+(~^wire2[(3'h6):(2'h2)]));
      reg5 <= wire2[(3'h5):(1'h1)];
    end
  assign wire6 = (~(+$unsigned(($unsigned((8'hba)) == $unsigned((8'hbb))))));
  assign wire7 = $signed($unsigned((&$signed((-wire6)))));
  assign wire8 = $unsigned(wire6);
  assign wire9 = wire3;
  module10 #() modinst125 (.y(wire124), .wire13(wire0), .wire14(wire9), .clk(clk), .wire12(reg5), .wire11(wire7));
  always
    @(posedge clk) begin
      reg126 <= (^(wire8 ?
          wire0[(3'h4):(1'h0)] : $unsigned({$signed(wire124), wire9})));
    end
  assign wire127 = $unsigned($unsigned((^$signed(wire7[(3'h7):(2'h3)]))));
  assign wire128 = wire9[(5'h11):(4'hd)];
  assign wire129 = $signed((({{wire8,
                           reg126}} > (^~(wire6 ^ (8'ha4)))) < wire1));
  assign wire130 = $unsigned(wire129[(2'h2):(1'h0)]);
  assign wire131 = ($signed($signed($unsigned(wire129))) | wire0[(2'h2):(1'h0)]);
  assign wire132 = wire6[(1'h0):(1'h0)];
  assign wire133 = ((~^wire7[(4'ha):(3'h5)]) ? reg4 : (wire130 && reg5));
  module134 #() modinst200 (wire199, clk, wire6, wire128, reg4, wire7, wire130);
  assign wire201 = $signed($unsigned(wire1));
  assign wire202 = wire1;
  module10 #() modinst204 (.clk(clk), .wire12(wire129), .wire13(wire2), .y(wire203), .wire11(wire6), .wire14(reg5));
  assign wire205 = (((8'hbd) != ((~^$unsigned(reg4)) ?
                       ($signed(wire128) ?
                           (&wire202) : wire132[(1'h0):(1'h0)]) : $signed(wire8[(1'h0):(1'h0)]))) && (wire0 ?
                       (wire0 ?
                           (^~$signed(wire2)) : (8'ha1)) : $signed($unsigned((wire6 <<< wire8)))));
  assign wire206 = (wire130[(4'ha):(4'h8)] ?
                       (!wire9) : (^$unsigned($unsigned($signed(wire132)))));
  assign wire207 = ((wire1 ?
                       reg4[(1'h1):(1'h1)] : reg126[(3'h5):(1'h0)]) || ((-$unsigned($signed(wire2))) <= ($unsigned((wire1 ^ (8'ha7))) ?
                       (wire203 == (reg126 || wire127)) : ((wire199 - wire128) == (!wire0)))));
  module134 #() modinst209 (wire208, clk, wire127, wire201, wire7, wire203, wire202);
  assign wire210 = $signed($signed((-wire132)));
endmodule

module module134
#(parameter param197 = (7'h40), 
parameter param198 = (param197 & (&({(param197 < param197), param197} || ((|param197) ? ((8'ha4) ? param197 : param197) : param197)))))
(y, clk, wire135, wire136, wire137, wire138, wire139);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire135;
  input wire [(5'h14):(1'h0)] wire136;
  input wire signed [(5'h13):(1'h0)] wire137;
  input wire signed [(4'ha):(1'h0)] wire138;
  input wire [(5'h12):(1'h0)] wire139;
  wire signed [(4'hb):(1'h0)] wire196;
  wire [(3'h6):(1'h0)] wire190;
  wire signed [(4'hc):(1'h0)] wire189;
  wire signed [(5'h13):(1'h0)] wire188;
  wire signed [(5'h14):(1'h0)] wire187;
  wire [(2'h3):(1'h0)] wire186;
  wire [(5'h13):(1'h0)] wire179;
  wire [(5'h11):(1'h0)] wire140;
  wire signed [(5'h13):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire174;
  reg signed [(5'h13):(1'h0)] reg195 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg193 = (1'h0);
  reg [(4'ha):(1'h0)] reg192 = (1'h0);
  reg [(3'h7):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg185 = (1'h0);
  reg [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  assign y = {wire196,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire179,
                 wire140,
                 wire143,
                 wire144,
                 wire174,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg178,
                 reg177,
                 reg176,
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire140 = (~^wire136);
  always
    @(posedge clk) begin
      reg141 <= ($unsigned((+(((8'ha6) ? wire137 : (7'h41)) ?
          $signed(wire135) : $unsigned(wire137)))) ^~ wire138);
      reg142 <= ($signed((8'h9c)) ^~ wire139);
    end
  assign wire143 = (wire137 ?
                       $unsigned({wire136[(4'ha):(2'h3)]}) : $unsigned($signed($signed(wire136[(3'h5):(2'h3)]))));
  assign wire144 = ($signed((((~^(8'ha9)) ?
                       (reg141 ?
                           wire137 : (8'ha4)) : $unsigned(wire140)) > (8'hab))) ^~ wire137[(4'h8):(3'h7)]);
  module145 #() modinst175 (.wire146(reg141), .clk(clk), .wire147(reg142), .wire149(wire140), .wire150(wire138), .y(wire174), .wire148(wire139));
  always
    @(posedge clk) begin
      if ((&($unsigned((((8'had) && wire143) ?
              {reg142} : reg141[(3'h5):(3'h4)])) ?
          (+wire174) : $signed(((7'h43) ? wire136 : wire137[(4'hc):(2'h2)])))))
        begin
          reg176 <= {$signed(wire143), wire137};
          reg177 <= ((~|$unsigned(((reg142 ? reg142 : wire137) ?
              (~wire137) : $unsigned(wire174)))) != $unsigned($signed((~&(wire139 ?
              wire138 : wire139)))));
        end
      else
        begin
          reg176 <= $signed((!$signed(reg141)));
          reg177 <= (~|{($unsigned(wire140[(5'h11):(3'h7)]) ?
                  reg141[(2'h2):(1'h0)] : $unsigned($signed(wire136)))});
        end
      reg178 <= ($unsigned({wire137}) ?
          wire136[(1'h0):(1'h0)] : $signed((wire174 ?
              $unsigned((8'ha0)) : (~(wire139 ? wire136 : wire138)))));
    end
  assign wire179 = reg142;
  always
    @(posedge clk) begin
      reg180 <= wire140;
      reg181 <= wire143[(4'he):(4'hc)];
      if (($unsigned(($signed(wire137) <<< {$unsigned(reg180),
              (wire179 ? wire136 : wire143)})) ?
          {reg142} : {$unsigned(((wire144 >> (8'hbf)) ?
                  (wire135 && (8'ha2)) : (!reg176)))}))
        begin
          reg182 <= reg142[(5'h11):(4'hd)];
          reg183 <= (reg177[(1'h0):(1'h0)] ? wire174 : reg176[(2'h2):(1'h1)]);
        end
      else
        begin
          reg182 <= {reg181};
          reg183 <= $unsigned((|reg182));
          reg184 <= (~&$signed(({(8'hb9)} ?
              ((&reg182) ? $signed(reg177) : wire174) : wire138)));
          reg185 <= wire140[(3'h5):(2'h3)];
        end
    end
  assign wire186 = wire136[(5'h14):(4'hb)];
  assign wire187 = wire138[(4'ha):(4'h9)];
  assign wire188 = $unsigned($signed(reg141));
  assign wire189 = $unsigned(($unsigned($unsigned((wire135 ?
                           reg142 : wire138))) ?
                       (8'hac) : reg183));
  assign wire190 = ($unsigned($unsigned((&(wire139 >>> wire139)))) < $unsigned(wire174[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg191 <= {(~^$unsigned($unsigned((-wire137))))};
      reg192 <= reg182[(4'hc):(3'h5)];
      reg193 <= (~|$unsigned(reg191));
      reg194 <= $signed($signed(wire140));
      reg195 <= $signed(wire137);
    end
  assign wire196 = reg181[(2'h2):(2'h2)];
endmodule

module module10
#(parameter param122 = {{(^~(((8'haa) || (7'h44)) ? ((8'ha5) <= (8'hba)) : (^~(8'h9e)))), {((8'hbb) ^ ((7'h43) ? (8'hb5) : (7'h42)))}}, {(^~(((8'hb7) ? (8'hac) : (8'hbf)) ~^ ((8'h9f) + (8'hb7)))), {(-((7'h40) - (8'hb9))), {(8'hbe), ((8'hb6) >> (8'ha1))}}}}, 
parameter param123 = param122)
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h1e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire105,
                 wire103,
                 wire53,
                 wire52,
                 wire40,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg119,
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
                 reg24,
                 (1'h0)};
  assign wire15 = (^(^(8'haf)));
  assign wire16 = $unsigned(wire11);
  assign wire17 = ((wire11[(4'h9):(1'h0)] ?
                      ($signed(wire13) & wire11[(4'ha):(3'h4)]) : $signed(wire14[(5'h14):(3'h5)])) && {$unsigned(wire11[(3'h6):(3'h5)]),
                      $unsigned(({wire14, wire16} || $signed(wire16)))});
  assign wire18 = wire16[(3'h5):(1'h1)];
  assign wire19 = $unsigned($signed({{$signed((8'hb4))},
                      wire17[(1'h1):(1'h0)]}));
  assign wire20 = wire16;
  assign wire21 = wire20;
  assign wire22 = (~$signed((~^($unsigned(wire20) - $unsigned(wire17)))));
  assign wire23 = $signed(wire13[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      reg24 <= ($unsigned({((^wire21) && $unsigned(wire13))}) ?
          wire18[(3'h7):(3'h7)] : wire21[(3'h4):(3'h4)]);
    end
  assign wire25 = (+(wire17 >= $unsigned((~^wire13[(3'h7):(2'h2)]))));
  module26 #() modinst41 (wire40, clk, reg24, wire23, wire20, wire11, wire14);
  always
    @(posedge clk) begin
      reg42 <= $unsigned(wire18[(1'h0):(1'h0)]);
      if (reg42[(2'h3):(1'h1)])
        begin
          reg43 <= $unsigned((-(^(&(wire12 <<< wire25)))));
          reg44 <= wire20;
          reg45 <= (&((wire12 ?
              $unsigned((reg43 + wire19)) : (wire17[(1'h0):(1'h0)] ?
                  $unsigned((8'ha6)) : $signed(reg24))) && wire12[(5'h10):(1'h1)]));
        end
      else
        begin
          reg43 <= wire13[(3'h6):(3'h5)];
          if ({reg44, $unsigned((^wire22))})
            begin
              reg44 <= reg43[(4'h9):(3'h6)];
              reg45 <= {wire16[(5'h14):(3'h7)]};
              reg46 <= (({(reg24[(4'he):(4'he)] - (8'hb3))} | {wire18[(4'hb):(4'h9)]}) ?
                  (reg45 ?
                      wire15 : (wire25[(1'h0):(1'h0)] <= wire19)) : ($signed(wire12) << {$unsigned((~^(8'ha1))),
                      wire14[(1'h1):(1'h0)]}));
              reg47 <= (~|wire15);
            end
          else
            begin
              reg44 <= $signed(wire14[(4'he):(4'h9)]);
              reg45 <= wire18[(4'h8):(3'h6)];
              reg46 <= $unsigned($unsigned(wire25));
            end
          reg48 <= $unsigned(wire19[(4'he):(2'h3)]);
        end
      if ((-((~&{(reg47 >> (8'ha4))}) ?
          $signed($unsigned({reg46, wire12})) : $unsigned(wire14))))
        begin
          reg49 <= reg48;
          reg50 <= wire21;
          reg51 <= wire23[(1'h0):(1'h0)];
        end
      else
        begin
          reg49 <= $unsigned({{((+reg24) && (wire20 ? reg44 : wire15)),
                  (wire16 + {reg43, wire13})},
              (wire20 ?
                  $unsigned(wire22[(4'hc):(4'hb)]) : (wire14[(4'h9):(1'h1)] ^ {reg47}))});
          reg50 <= {wire23};
          reg51 <= wire14[(4'h8):(3'h5)];
        end
    end
  assign wire52 = reg49;
  assign wire53 = {($unsigned($unsigned((8'haa))) > $unsigned(wire17[(1'h0):(1'h0)])),
                      (8'ha3)};
  module54 #() modinst104 (wire103, clk, reg51, wire15, wire23, reg48);
  assign wire105 = $unsigned({$signed(wire25), wire15[(4'ha):(2'h3)]});
  always
    @(posedge clk) begin
      if (wire13[(4'ha):(3'h4)])
        begin
          reg106 <= $unsigned(($signed(reg24[(3'h6):(3'h5)]) ?
              $signed($unsigned(reg49)) : $unsigned({reg46[(1'h1):(1'h0)]})));
          if ($signed(wire15))
            begin
              reg107 <= (wire12 - $unsigned(((8'haf) ?
                  (!reg49[(3'h7):(3'h5)]) : reg24)));
              reg108 <= wire21[(1'h0):(1'h0)];
              reg109 <= $unsigned((wire22 ?
                  {$unsigned((~wire40)),
                      (^~((8'ha4) > (8'hb7)))} : ((~|$unsigned(wire25)) ?
                      ($unsigned(reg51) ? (-wire21) : reg44) : (+(-(8'h9f))))));
              reg110 <= $signed({{(!$unsigned(wire18)), wire20}});
              reg111 <= reg47[(4'h9):(3'h4)];
            end
          else
            begin
              reg107 <= (reg46[(3'h5):(3'h5)] * reg51[(2'h3):(1'h1)]);
              reg108 <= ($unsigned(reg44[(2'h2):(2'h2)]) - (~|reg43));
              reg109 <= (reg48 ?
                  $unsigned(($signed((reg43 == wire22)) ?
                      $unsigned((~reg47)) : wire105[(1'h0):(1'h0)])) : (-wire11));
              reg110 <= ((|(+(~^reg43))) + (&reg49));
            end
        end
      else
        begin
          reg106 <= (($unsigned(((wire25 > wire105) || (wire18 && reg50))) >> $unsigned($signed({wire40}))) - {$unsigned(wire23[(2'h3):(2'h3)])});
          if (((~^$signed(($signed(wire11) ?
              {wire12} : (wire18 ?
                  reg108 : wire16)))) >= ((((wire17 == (8'hbe)) <= $signed(wire15)) >> (^reg24)) <= wire25)))
            begin
              reg107 <= wire16[(5'h14):(4'hd)];
              reg108 <= reg46[(2'h2):(1'h0)];
              reg109 <= $signed((!$unsigned(wire15)));
            end
          else
            begin
              reg107 <= {(~|({(wire21 ? wire52 : (8'h9d))} ?
                      (wire23 ^ reg111[(1'h1):(1'h1)]) : ({wire19} && {reg107,
                          wire22}))),
                  $unsigned({(reg49[(1'h1):(1'h1)] ?
                          (reg50 ? wire103 : wire53) : (wire11 - reg48)),
                      (wire25 ? (+(7'h42)) : ((8'ha9) ? reg50 : wire52))})};
            end
          reg110 <= $signed({{wire21[(3'h6):(3'h5)]}, $signed(reg49)});
          if (((!($signed($unsigned((8'h9d))) ?
              (wire12 && ((8'hbf) ?
                  (8'hb4) : wire16)) : wire25[(1'h0):(1'h0)])) <= ($signed($signed($signed(wire53))) ?
              $signed((reg46[(3'h6):(2'h3)] ?
                  $signed((7'h43)) : $signed((8'h9c)))) : (reg48 >>> $unsigned((reg111 ?
                  reg48 : wire12))))))
            begin
              reg111 <= (~^(|reg24[(4'ha):(1'h1)]));
              reg112 <= wire11;
              reg113 <= wire15[(3'h5):(3'h4)];
              reg114 <= ({(($unsigned(wire14) <= wire52[(4'h9):(4'h9)]) ?
                      reg45 : {(|reg48)})} << $unsigned(wire18[(2'h3):(2'h3)]));
            end
          else
            begin
              reg111 <= $signed(wire21);
              reg112 <= $signed(((-(~|(reg114 ?
                  reg108 : reg51))) ^ reg111[(4'h8):(2'h3)]));
              reg113 <= wire23[(5'h11):(4'he)];
              reg114 <= ((~&(&((reg44 ? reg45 : reg112) != wire103))) ?
                  (~(~&$unsigned($unsigned(wire18)))) : ((^~$signed($signed(reg47))) & $unsigned(wire22)));
              reg115 <= reg46;
            end
          reg116 <= (reg115 || $signed(((+(wire53 ?
              reg49 : wire105)) > {{wire19}, ((8'hb4) << wire11)})));
        end
      reg117 <= ($signed($unsigned($signed(reg115[(3'h5):(1'h1)]))) ?
          wire21 : {($unsigned((reg48 ? reg110 : (8'hab))) ?
                  {$unsigned(wire15)} : (^~{reg113, wire20}))});
      reg118 <= (~&wire53[(5'h10):(3'h7)]);
      reg119 <= reg109;
    end
  assign wire120 = (((~^({reg47} ?
                           (|wire21) : reg118[(5'h12):(2'h2)])) | wire105) ?
                       wire20[(1'h0):(1'h0)] : $signed({$unsigned({wire25,
                               reg109})}));
  assign wire121 = (&reg116);
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire58;
  input wire [(4'hf):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire56;
  input wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire79,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
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
                 reg80,
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
                 reg65,
                 (1'h0)};
  assign wire59 = $signed($signed($unsigned($signed((wire56 ?
                      wire57 : wire55)))));
  assign wire60 = $signed(wire56[(4'hd):(3'h5)]);
  assign wire61 = $signed(($signed(wire57) == $unsigned((~(wire56 ?
                      (7'h43) : wire60)))));
  assign wire62 = $unsigned((wire55 ?
                      {wire61,
                          (((8'ha4) ? wire56 : wire56) ?
                              $unsigned(wire58) : (wire61 ?
                                  (8'ha8) : (7'h41)))} : $unsigned({(wire59 ^~ (8'hb8))})));
  assign wire63 = (wire61[(4'h8):(1'h0)] ?
                      wire61 : $signed($unsigned($unsigned($signed(wire58)))));
  assign wire64 = wire63;
  always
    @(posedge clk) begin
      reg65 <= (wire56[(1'h1):(1'h0)] ^ $signed($unsigned(wire63[(3'h5):(3'h4)])));
      reg66 <= (-($signed($unsigned($signed(wire64))) ^~ wire64));
      if ((7'h42))
        begin
          reg67 <= (((8'hb4) ?
              ((reg65[(3'h6):(1'h1)] | (wire59 ? wire61 : wire64)) ?
                  ((wire56 ? (8'haf) : wire59) ?
                      wire64[(2'h3):(1'h0)] : wire58) : $signed(reg65[(3'h4):(3'h4)])) : reg65[(1'h1):(1'h0)]) & (+wire56[(1'h0):(1'h0)]));
        end
      else
        begin
          reg67 <= wire64[(1'h1):(1'h0)];
          reg68 <= $signed($unsigned($signed({(wire55 | wire58),
              (wire59 ? reg67 : reg65)})));
          reg69 <= wire64[(1'h1):(1'h1)];
          reg70 <= $unsigned($signed($signed($unsigned($unsigned(wire63)))));
          reg71 <= (+wire57[(4'hf):(3'h6)]);
        end
      reg72 <= $unsigned(((^wire59[(4'hd):(3'h5)]) ?
          (~&wire64) : ($signed(wire58) >>> ((&(8'hb5)) ?
              (~|reg69) : $signed(wire55)))));
      if ((($unsigned((+(reg70 ~^ wire64))) ?
              (~|$unsigned(reg68)) : $signed($signed(((8'ha0) >= wire56)))) ?
          (!$unsigned({(wire61 | (8'hb0))})) : ($signed($unsigned($unsigned(wire58))) ?
              ($unsigned((wire61 ^ wire59)) ?
                  (((8'hb8) ? (8'hb7) : wire56) - {wire56, reg70}) : ((reg66 ?
                          wire60 : wire58) ?
                      (~reg68) : $signed(wire62))) : {(|(reg65 || wire63))})))
        begin
          if (reg68)
            begin
              reg73 <= wire55;
              reg74 <= wire57[(4'h8):(3'h6)];
            end
          else
            begin
              reg73 <= (~|reg68);
              reg74 <= (((($unsigned(reg71) + ((8'ha7) ?
                          (8'h9c) : wire60)) ^~ reg69) ?
                      $signed(wire55[(2'h2):(1'h1)]) : reg74[(1'h0):(1'h0)]) ?
                  wire60 : (reg74[(1'h0):(1'h0)] ? reg71 : reg73));
              reg75 <= (($unsigned($signed(reg67)) != (|(~$unsigned((8'ha2))))) <= $unsigned(({(reg65 <= wire64),
                      $unsigned((8'hac))} ?
                  $unsigned(wire57[(4'h9):(3'h6)]) : ($unsigned(reg74) ?
                      (wire64 ? wire59 : wire57) : (&wire55)))));
              reg76 <= ({(|$signed(((8'hab) && wire55)))} <= wire61[(4'ha):(3'h5)]);
              reg77 <= $unsigned(wire60[(4'h9):(2'h2)]);
            end
          reg78 <= wire61[(3'h5):(1'h0)];
        end
      else
        begin
          reg73 <= $signed($signed(reg66));
          reg74 <= reg77;
          reg75 <= $unsigned(wire57[(3'h4):(1'h1)]);
          reg76 <= (((reg71 && $signed(reg73[(1'h0):(1'h0)])) - (reg75[(4'h8):(1'h0)] >= ((~^wire63) && (reg65 ?
                  (8'hb9) : (8'hba))))) ?
              (|reg74) : ($unsigned((~$unsigned((8'hab)))) ?
                  $unsigned(((reg69 << reg68) >>> (~^wire58))) : ($signed(reg70) ?
                      reg67 : $unsigned(wire59[(3'h5):(1'h1)]))));
          reg77 <= ({(((wire59 ? wire62 : reg76) ? (wire60 < wire61) : reg74) ?
                      $signed($unsigned(reg76)) : wire55),
                  reg76} ?
              $unsigned($signed((&$unsigned(reg71)))) : (^~$signed((+{reg78,
                  reg77}))));
        end
    end
  assign wire79 = ($unsigned((!(8'haa))) & $unsigned((reg71 ?
                      ((8'hb0) <<< reg74) : (reg72 ?
                          $unsigned(reg70) : (reg78 ? reg74 : reg70)))));
  always
    @(posedge clk) begin
      if (reg74)
        begin
          reg80 <= (8'ha2);
          reg81 <= ((((~&(reg65 <= reg71)) ?
                      reg69 : ((wire59 ~^ (8'hbc)) ?
                          (wire60 ^~ wire79) : $signed(reg69))) ?
                  $unsigned($signed($unsigned(reg67))) : $unsigned((~^(wire61 ~^ wire58)))) ?
              wire59[(5'h10):(3'h7)] : (&wire59[(4'hb):(3'h5)]));
          reg82 <= ((($signed(reg67[(5'h12):(3'h5)]) ?
              $signed($signed(reg66)) : (~&$unsigned(wire59))) >= ({(reg65 != wire79),
              (wire59 ?
                  wire60 : (8'hbe))} && wire59[(3'h6):(2'h2)])) <<< $unsigned(($signed((~|wire58)) - (^~$signed(wire58)))));
          reg83 <= ($signed(reg71[(3'h5):(3'h5)]) & reg65);
          reg84 <= wire64;
        end
      else
        begin
          reg80 <= ((((!reg78) * (^~$unsigned(reg81))) ?
                  reg76 : $unsigned($unsigned(reg73[(3'h4):(1'h1)]))) ?
              $signed(reg69[(1'h1):(1'h0)]) : reg66[(2'h3):(1'h1)]);
          reg81 <= ($signed($unsigned(reg77)) ? (-(~^(+(8'hbc)))) : reg83);
          reg82 <= reg71;
          reg83 <= reg80[(4'hc):(4'h8)];
          reg84 <= (((reg78[(2'h3):(1'h0)] ?
                  ({(8'hb1)} >= ((8'hbd) ?
                      wire55 : wire63)) : $unsigned((8'hb8))) ?
              reg82[(4'h9):(1'h0)] : reg72) << (8'hb3));
        end
      reg85 <= ($unsigned(wire56) > (!$signed(reg71[(2'h3):(1'h0)])));
      reg86 <= reg83[(3'h5):(3'h4)];
      if (($unsigned(reg85[(1'h0):(1'h0)]) ?
          {$unsigned(($unsigned(reg78) ?
                  $signed((8'hb6)) : (reg69 != (8'hbf))))} : reg70[(4'hd):(2'h3)]))
        begin
          if ((^{($signed((^~(8'hb5))) >> ((8'hb5) ^~ reg78[(3'h5):(1'h1)])),
              (($signed(reg77) ?
                  $unsigned(wire55) : (reg66 ? reg72 : reg72)) | ((reg80 ?
                      reg72 : reg85) ?
                  (reg75 << wire55) : $signed(reg76)))}))
            begin
              reg87 <= $unsigned($signed($signed(reg71)));
              reg88 <= (^~(~reg86));
              reg89 <= $unsigned({reg82[(2'h3):(1'h1)], reg84[(4'ha):(3'h4)]});
              reg90 <= $signed($signed(wire60));
              reg91 <= $signed($unsigned(wire64[(1'h1):(1'h0)]));
            end
          else
            begin
              reg87 <= $signed($unsigned({{((8'hba) ? reg69 : reg85)}}));
              reg88 <= ((^~(-$signed((wire58 * wire57)))) ^~ (wire55 <= $unsigned(wire79[(4'hd):(2'h2)])));
            end
          reg92 <= $signed(((-wire57) + $signed((~wire57[(4'ha):(4'ha)]))));
          if ($unsigned((7'h43)))
            begin
              reg93 <= (^(8'hbc));
              reg94 <= $unsigned((&({$unsigned(wire63)} >> $signed(wire56[(3'h4):(3'h4)]))));
              reg95 <= $signed((reg71[(4'h8):(2'h3)] >>> (|wire63[(1'h1):(1'h0)])));
              reg96 <= (~^reg73[(3'h7):(3'h7)]);
            end
          else
            begin
              reg93 <= (-wire56[(4'he):(4'he)]);
              reg94 <= reg96[(1'h0):(1'h0)];
              reg95 <= ($signed(($signed((reg95 && wire60)) ~^ ({reg83} ?
                      (7'h43) : reg66[(2'h2):(1'h1)]))) ?
                  $signed($unsigned({wire60})) : (-{((~^(8'hb9)) == reg71),
                      reg76}));
              reg96 <= ((reg77[(3'h4):(2'h3)] ?
                  $signed((&$unsigned(wire60))) : reg92) <<< (({(reg66 >> reg81)} ^ $unsigned((wire58 ?
                      reg86 : reg72))) ?
                  ((^~((8'ha2) ?
                      wire62 : reg88)) || wire62) : (^(reg71[(3'h6):(3'h4)] ?
                      $unsigned(reg84) : (~&reg89)))));
            end
        end
      else
        begin
          reg87 <= {reg94};
          reg88 <= ($signed($unsigned(((wire62 ? reg89 : wire62) ?
              (wire59 || (8'hb7)) : wire58))) <<< reg85);
        end
      reg97 <= $signed((($unsigned((~|reg82)) ?
              ((8'h9f) ~^ $unsigned(wire64)) : $signed(reg76[(3'h5):(2'h2)])) ?
          (((~|reg76) ?
              ((8'hac) ?
                  wire58 : reg81) : (^(7'h42))) && $signed(wire63)) : reg84));
    end
  assign wire98 = (((reg68[(1'h0):(1'h0)] > ({reg90, wire55} ?
                          (reg71 ? (7'h40) : reg76) : (reg65 == reg89))) ?
                      wire56[(5'h11):(4'hf)] : wire56) ^ (8'had));
  assign wire99 = $unsigned($unsigned((reg75 ?
                      $unsigned(wire63[(2'h3):(2'h3)]) : $signed((reg95 > (8'hae))))));
  assign wire100 = reg73;
  assign wire101 = (($signed((|(reg71 ? reg72 : reg90))) ?
                           $signed(wire60) : $signed({(^~reg82)})) ?
                       {$signed({$unsigned(wire59)}),
                           ((8'hb1) > ($signed(reg69) && $unsigned(wire62)))} : (reg80[(4'hd):(1'h1)] ^ {($signed(reg75) ?
                               (+(8'hb5)) : (reg66 ~^ reg66)),
                           $unsigned(reg73[(4'h9):(3'h7)])}));
  assign wire102 = $unsigned($signed($signed({{reg73, reg91}})));
endmodule

module module26
#(parameter param39 = (((^((+(8'haa)) & ((8'ha6) <<< (8'hb2)))) > ((~&((8'hbb) && (8'ha1))) <= ((|(8'h9d)) << ((8'hab) ^~ (8'ha1))))) >= (!((((8'h9c) | (8'h9d)) >>> (|(8'hab))) | ((&(8'hb4)) ? ((8'h9d) ? (8'hb0) : (7'h40)) : ((8'ha5) != (8'haa)))))))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire [(2'h2):(1'h0)] wire30;
  input wire signed [(4'ha):(1'h0)] wire29;
  input wire [(3'h5):(1'h0)] wire28;
  input wire signed [(4'he):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  assign y = {wire38, wire37, wire36, wire35, wire34, wire33, wire32, (1'h0)};
  assign wire32 = wire29;
  assign wire33 = $signed((wire32[(3'h5):(3'h5)] >> $unsigned($unsigned((wire32 ~^ wire27)))));
  assign wire34 = (+$unsigned($signed($signed(wire29[(3'h4):(3'h4)]))));
  assign wire35 = (~(($unsigned((~|wire31)) << (-wire32[(3'h7):(1'h0)])) ?
                      $signed({(~|wire34),
                          $signed(wire32)}) : $unsigned((wire27 ?
                          (wire32 <<< wire33) : {wire28}))));
  assign wire36 = ((~&wire35) < ((wire32 && wire35) ?
                      ($signed($unsigned(wire29)) << (|$unsigned(wire29))) : $signed(wire29)));
  assign wire37 = $signed((wire29[(1'h1):(1'h0)] == $unsigned($unsigned((wire35 != wire34)))));
  assign wire38 = $unsigned((~|wire37[(4'h8):(3'h7)]));
endmodule

module module145
#(parameter param173 = ((+(8'ha2)) ? (^{(((8'ha3) >>> (8'ha7)) ? ((8'hbd) ? (8'ha0) : (8'hbf)) : ((8'hba) || (8'h9d))), (8'ha1)}) : {(~(~^((8'ha6) > (8'had))))}))
(y, clk, wire150, wire149, wire148, wire147, wire146);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire150;
  input wire signed [(5'h11):(1'h0)] wire149;
  input wire signed [(5'h12):(1'h0)] wire148;
  input wire [(3'h5):(1'h0)] wire147;
  input wire [(4'hf):(1'h0)] wire146;
  wire signed [(4'hd):(1'h0)] wire172;
  wire signed [(4'hc):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire168;
  wire [(4'ha):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire151;
  reg [(4'hf):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg163 = (1'h0);
  reg [(5'h12):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg159 = (1'h0);
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire152,
                 wire151,
                 reg170,
                 reg169,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 (1'h0)};
  assign wire151 = wire149;
  assign wire152 = {wire147[(1'h0):(1'h0)],
                       $signed((~({wire151} >>> (wire150 ?
                           (8'h9c) : (7'h42)))))};
  always
    @(posedge clk) begin
      reg153 <= {$unsigned(((^~wire151[(2'h2):(1'h0)]) ^ $signed(wire150)))};
      reg154 <= (~&$signed(wire146[(2'h2):(1'h0)]));
      reg155 <= $signed($signed($signed(((wire151 & wire152) ?
          $unsigned(wire149) : (reg154 ? wire149 : wire147)))));
      reg156 <= $unsigned((&(|$signed((~^wire148)))));
      if ({{wire151[(2'h3):(2'h3)]}, reg153})
        begin
          reg157 <= $signed($unsigned(wire149));
          reg158 <= $unsigned($unsigned({wire152,
              ($unsigned((8'ha2)) ? wire149 : wire150[(4'h8):(2'h3)])}));
        end
      else
        begin
          reg157 <= {reg158,
              ($signed((&$unsigned(wire148))) ?
                  ({(wire151 ?
                          (8'hbd) : (8'ha0))} - $unsigned(reg157[(3'h4):(1'h0)])) : (wire146 >> ({reg156} ?
                      wire152 : (wire151 >>> wire146))))};
          if (reg155)
            begin
              reg158 <= ($signed((+({wire150} & (~reg153)))) >= (&((~(~wire147)) + wire152)));
              reg159 <= $unsigned(reg154[(5'h11):(3'h6)]);
              reg160 <= ($unsigned(wire148[(3'h5):(3'h5)]) ?
                  ({$signed((reg159 ? reg159 : reg156)),
                          {reg156, $signed(reg156)}} ?
                      (($signed(wire150) ?
                          (-(8'ha7)) : (~reg154)) << ($signed(reg155) ?
                          reg159[(4'hb):(1'h0)] : $signed((8'ha9)))) : {(8'ha7),
                          (reg153 > reg157[(1'h0):(1'h0)])}) : $signed($signed({$unsigned(reg158)})));
            end
          else
            begin
              reg158 <= ((((^~(~&wire150)) == (!(reg154 ? reg160 : (8'hb1)))) ?
                      $signed((reg154 ?
                          (!wire152) : $unsigned(reg157))) : {$unsigned(wire149),
                          ($signed(reg155) ?
                              (^~reg160) : (reg160 ? reg156 : wire150))}) ?
                  reg154 : (8'ha9));
              reg159 <= wire149;
              reg160 <= (($signed(reg155) ?
                  $unsigned($signed(wire149[(4'hf):(3'h6)])) : $signed($unsigned((~|reg158)))) <<< ((wire146[(4'ha):(4'ha)] <<< $signed((|wire146))) ?
                  ($signed({wire149}) ?
                      reg155[(4'h8):(1'h0)] : {$unsigned(reg160)}) : $signed(((reg154 || reg155) ?
                      (reg154 != reg155) : wire148[(5'h11):(4'hc)]))));
              reg161 <= $signed($unsigned((8'hb2)));
            end
          reg162 <= (reg159[(4'h9):(3'h4)] < (^~wire146[(3'h5):(3'h4)]));
          reg163 <= ($unsigned(wire152) >>> reg155);
          reg164 <= $signed(wire150);
        end
    end
  assign wire165 = {$signed($unsigned((^~(wire147 - wire150)))),
                       (|(($unsigned(wire148) ?
                           $unsigned(wire150) : (~&wire146)) ^ (~&reg158)))};
  assign wire166 = ((-$signed((7'h43))) < $signed(wire149));
  assign wire167 = wire147;
  assign wire168 = reg163[(4'hd):(1'h0)];
  always
    @(posedge clk) begin
      reg169 <= (reg158[(1'h1):(1'h0)] + {$unsigned($signed(wire148)),
          $unsigned(reg155[(3'h7):(1'h1)])});
      reg170 <= ((reg155[(1'h0):(1'h0)] ?
              reg161[(3'h5):(1'h0)] : (wire151 ?
                  ((wire149 ?
                      reg155 : wire146) > $unsigned(reg157)) : $unsigned(reg153[(4'h8):(3'h5)]))) ?
          $signed($signed((^{reg161}))) : $unsigned(((+$unsigned(reg162)) ?
              $unsigned((&wire149)) : $signed($unsigned(wire151)))));
    end
  assign wire171 = (({$unsigned((^~(8'h9c))),
                       wire166[(1'h1):(1'h1)]} < $signed((reg159 | $signed((8'ha0))))) | ($unsigned(reg156) ?
                       ((^$unsigned(reg170)) <<< $unsigned($unsigned(reg153))) : wire168));
  assign wire172 = reg156;
endmodule
