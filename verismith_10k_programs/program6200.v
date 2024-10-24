module top
#(parameter param200 = (!((((8'hbd) ? (8'ha0) : ((8'ha6) ? (8'hae) : (7'h44))) ? (7'h41) : {((8'ha2) << (7'h42)), (^~(8'h9c))}) << {((~(8'hb3)) ~^ ((8'hb6) ? (7'h41) : (8'hbd))), (8'hab)})), 
parameter param201 = (param200 != param200))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h27f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire198;
  wire [(3'h4):(1'h0)] wire196;
  wire signed [(4'hc):(1'h0)] wire195;
  wire [(4'h8):(1'h0)] wire194;
  wire signed [(5'h14):(1'h0)] wire188;
  wire signed [(5'h10):(1'h0)] wire175;
  wire [(4'h8):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire154;
  wire [(4'he):(1'h0)] wire153;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire151;
  wire signed [(4'h8):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire192;
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  reg [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(4'h8):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg183 = (1'h0);
  reg [(3'h7):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg [(3'h5):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg187 = (1'h0);
  assign y = {wire198,
                 wire196,
                 wire195,
                 wire194,
                 wire188,
                 wire175,
                 wire174,
                 wire173,
                 wire154,
                 wire153,
                 wire59,
                 wire151,
                 wire190,
                 wire192,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 (1'h0)};
  module4 #() modinst60 (.wire5(wire1), .wire6(wire0), .y(wire59), .clk(clk), .wire8(wire2), .wire9((8'hb5)), .wire7(wire3));
  always
    @(posedge clk) begin
      reg61 <= ((((-(8'had)) ?
              $unsigned((wire3 ? wire2 : wire1)) : wire1) <<< (8'hb4)) ?
          {(~(~|wire59[(4'h8):(1'h1)])),
              $unsigned(((+(7'h40)) ?
                  wire2 : (!wire59)))} : wire1[(3'h6):(2'h3)]);
      if (wire2[(3'h7):(3'h5)])
        begin
          reg62 <= (($signed($signed((~|wire3))) ^ ({{wire1, wire59}} ?
              (wire59 <= $signed(reg61)) : reg61)) * ($signed(wire0[(4'hf):(3'h5)]) != $signed((^(!(8'h9f))))));
        end
      else
        begin
          reg62 <= (~|$signed(wire1[(4'he):(2'h3)]));
          reg63 <= wire1;
          reg64 <= reg62[(1'h0):(1'h0)];
          reg65 <= reg61;
          reg66 <= reg61;
        end
      reg67 <= reg64[(3'h4):(2'h2)];
    end
  module68 #() modinst152 (.wire72(wire3), .wire71(reg67), .clk(clk), .wire69(wire0), .y(wire151), .wire70(wire59));
  assign wire153 = (reg65 ?
                       reg64 : (((~^(&wire59)) - $signed((wire59 >> reg62))) ?
                           $signed(reg65) : (wire59 ~^ (|$unsigned(reg64)))));
  assign wire154 = {(&$unsigned((+(8'had)))),
                       (reg61[(5'h12):(5'h10)] == $unsigned(wire3))};
  always
    @(posedge clk) begin
      if ((((8'ha0) >= $signed(reg62)) ?
          $signed(wire2[(4'h8):(4'h8)]) : $signed(reg64[(3'h4):(3'h4)])))
        begin
          reg155 <= (^~$unsigned((($unsigned(reg61) < {wire151, reg61}) ?
              {((8'ha8) >= reg61)} : ((-reg61) ?
                  $unsigned(wire2) : $signed(reg63)))));
          reg156 <= wire151;
          reg157 <= (~^(~(wire3[(4'h9):(1'h1)] ?
              {(wire151 ? wire0 : wire151)} : wire154)));
          reg158 <= $signed(reg156[(3'h6):(3'h6)]);
          if ((~^($signed($signed((reg157 ? wire3 : reg155))) ?
              ((~&$signed(reg156)) ?
                  (^(wire154 ?
                      wire59 : wire59)) : $signed((^wire154))) : (!reg66[(3'h6):(3'h4)]))))
            begin
              reg159 <= $unsigned((!($unsigned(wire2[(4'hf):(2'h2)]) < {wire3})));
            end
          else
            begin
              reg159 <= reg159;
              reg160 <= $unsigned((7'h42));
              reg161 <= {reg156, reg160};
            end
        end
      else
        begin
          reg155 <= $signed((8'hbb));
          reg156 <= $unsigned($signed(wire154[(1'h0):(1'h0)]));
          reg157 <= (((!reg161[(3'h7):(2'h3)]) == (-reg64)) ?
              $unsigned(reg158) : (reg62[(3'h6):(3'h5)] ?
                  ($signed($signed(wire151)) >> {wire1,
                      $unsigned(reg62)}) : {({wire0} * (&wire154))}));
        end
      reg162 <= (~(+($unsigned({(8'hbe)}) ?
          ({wire154, (8'hb9)} & reg65[(1'h0):(1'h0)]) : ({wire0} << (reg62 ?
              wire151 : (8'ha6))))));
      reg163 <= $signed(wire153);
      if ((reg163 > (($unsigned((^reg161)) >= reg66[(4'h9):(1'h0)]) ?
          (reg66[(3'h4):(3'h4)] ?
              {{reg65, reg61}} : $signed((^~reg160))) : reg161)))
        begin
          reg164 <= $signed($unsigned((((wire1 == wire153) * reg159) >= $signed((|reg163)))));
          reg165 <= ($unsigned(({(reg164 ^ reg158)} ^~ $signed((reg161 ?
                  wire2 : reg161)))) ?
              wire3 : wire1[(3'h4):(2'h2)]);
          reg166 <= (reg162 ?
              ($unsigned(wire0[(4'ha):(3'h4)]) << reg65[(1'h0):(1'h0)]) : (((8'h9f) < $signed(reg61)) <= (((reg62 - reg62) * $unsigned(reg162)) || (7'h44))));
          reg167 <= $unsigned(reg63);
          reg168 <= wire3;
        end
      else
        begin
          reg164 <= $unsigned($signed($unsigned((8'ha5))));
          reg165 <= reg67;
          if ((^~(~reg160[(2'h3):(1'h1)])))
            begin
              reg166 <= wire154;
              reg167 <= $signed(reg161);
              reg168 <= (8'ha4);
              reg169 <= $signed($signed((reg163[(4'h8):(4'h8)] ?
                  reg159 : ($unsigned((8'hb3)) ?
                      (reg168 ? reg65 : wire153) : $unsigned(reg63)))));
            end
          else
            begin
              reg166 <= $signed($signed($signed(((reg156 >= reg168) ?
                  (~|reg169) : (reg167 ? wire154 : reg156)))));
              reg167 <= ($unsigned({$signed($signed(reg164))}) ~^ (reg169 ?
                  ({(~reg156), {reg63}} ?
                      wire59[(4'h9):(2'h3)] : $signed({reg169})) : (^~$signed(reg166))));
              reg168 <= ((&{(|$signed(wire3))}) ?
                  (+(((8'hb3) ? (reg66 ? wire2 : reg161) : (reg64 << reg155)) ?
                      $unsigned($unsigned(reg160)) : (((8'ha1) - (8'hb8)) << ((8'hac) || wire59)))) : $signed((wire151 ?
                      reg165[(3'h6):(2'h3)] : $unsigned((wire1 << reg163)))));
              reg169 <= reg64[(1'h1):(1'h1)];
              reg170 <= $unsigned(reg63);
            end
          reg171 <= $signed(reg63[(3'h5):(3'h4)]);
          reg172 <= reg66;
        end
    end
  assign wire173 = (reg167[(3'h4):(2'h2)] ?
                       $signed($unsigned((~|(reg61 <<< reg160)))) : $signed(reg159[(1'h0):(1'h0)]));
  assign wire174 = wire154[(2'h3):(1'h1)];
  assign wire175 = $signed(reg164);
  always
    @(posedge clk) begin
      reg176 <= $signed({wire174[(2'h2):(2'h2)]});
      reg177 <= $signed($signed($signed(reg160[(3'h6):(3'h6)])));
    end
  always
    @(posedge clk) begin
      reg178 <= wire174[(1'h0):(1'h0)];
      if ((reg176 > (+wire153[(4'hd):(3'h5)])))
        begin
          reg179 <= (wire151[(5'h10):(2'h3)] ?
              (+(~|(8'hb3))) : ($signed(wire174) ^ reg156[(3'h4):(1'h0)]));
          reg180 <= ((8'h9c) + wire151[(2'h2):(2'h2)]);
          reg181 <= $signed($unsigned({reg157[(3'h4):(1'h0)]}));
        end
      else
        begin
          reg179 <= $signed(reg167[(3'h6):(1'h0)]);
        end
      reg182 <= (&(reg158[(2'h2):(2'h2)] * $unsigned((~^wire153))));
      reg183 <= (~^reg164[(3'h5):(3'h5)]);
      reg184 <= $signed({reg171, wire59[(4'hc):(3'h7)]});
    end
  always
    @(posedge clk) begin
      reg185 <= reg165;
      reg186 <= $unsigned((~$signed($unsigned($unsigned(reg167)))));
      reg187 <= $unsigned($unsigned({((reg169 ? reg182 : (8'ha5)) ^~ reg165),
          wire2}));
    end
  module15 #() modinst189 (.wire16(wire151), .wire19(reg158), .clk(clk), .wire18(reg181), .y(wire188), .wire20(reg168), .wire17(reg66));
  module110 #() modinst191 (wire190, clk, reg176, reg183, reg181, reg158, reg169);
  module15 #() modinst193 (wire192, clk, reg177, reg162, reg165, reg184, wire188);
  assign wire194 = (reg65[(1'h1):(1'h0)] ?
                       ((((^reg158) ? (^wire1) : (reg176 || reg64)) ?
                           (&(reg61 + (8'ha9))) : ((reg177 ?
                               (7'h40) : (8'hba)) ^~ ((8'hb2) ~^ reg186))) * wire59[(3'h5):(2'h2)]) : wire2[(4'hc):(1'h0)]);
  assign wire195 = $unsigned(reg163);
  module4 #() modinst197 (.wire8(wire192), .y(wire196), .wire6(reg61), .wire9(wire188), .wire5(reg171), .clk(clk), .wire7(reg176));
  module110 #() modinst199 (.wire113(reg63), .wire115(wire154), .wire112(reg157), .wire114(reg161), .clk(clk), .y(wire198), .wire111(wire153));
endmodule

module module68
#(parameter param150 = (-{{(((7'h44) ? (7'h44) : (8'hac)) ? {(7'h42)} : ((8'ha9) ? (8'ha8) : (8'ha6)))}, ((&((8'hba) ? (8'hb3) : (8'ha3))) < (((8'hb5) == (8'hbe)) ? (&(7'h44)) : {(8'hb0), (8'hb3)}))}))
(y, clk, wire69, wire70, wire71, wire72);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire69;
  input wire [(4'he):(1'h0)] wire70;
  input wire [(5'h14):(1'h0)] wire71;
  input wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire98;
  wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire135;
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire93,
                 wire95,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire135,
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
                 (1'h0)};
  module73 #() modinst94 (.y(wire93), .wire77(wire70), .wire74(wire72), .wire75(wire69), .clk(clk), .wire76(wire71));
  assign wire95 = ((&{{$unsigned(wire71), wire70[(4'ha):(2'h2)]}}) ?
                      ((wire69[(3'h4):(1'h1)] ?
                          $unsigned((|wire70)) : $signed($signed(wire71))) || (((wire72 ?
                              wire72 : wire72) == wire69) ?
                          {wire69[(4'hd):(3'h4)]} : wire70[(1'h1):(1'h0)])) : {(((^~(8'ha8)) >= (-wire70)) <= (7'h41))});
  assign wire96 = wire93[(3'h7):(2'h3)];
  assign wire97 = ((|((wire71[(5'h14):(3'h7)] - {wire71}) == ($signed(wire93) >= wire70))) ?
                      (wire72[(3'h4):(3'h4)] ?
                          ((wire70[(4'hc):(4'h9)] != wire70) ?
                              $unsigned(((8'ha4) & wire96)) : wire71) : (^wire69)) : $unsigned(wire71));
  assign wire98 = ((8'hb4) ?
                      {wire97[(5'h13):(4'he)]} : {(({(8'hb7)} ?
                              wire69[(5'h13):(2'h2)] : (~^wire71)) & $unsigned(wire97))});
  assign wire99 = wire72;
  assign wire100 = {{wire93[(3'h7):(3'h6)]}, wire95[(4'hf):(4'hd)]};
  assign wire101 = wire98;
  assign wire102 = (+{wire100[(2'h2):(1'h1)]});
  assign wire103 = wire97[(4'hd):(4'hb)];
  assign wire104 = wire102;
  assign wire105 = {$unsigned($signed((!{wire70})))};
  assign wire106 = ((8'hb1) ?
                       (|$unsigned($unsigned((wire71 >>> wire104)))) : ($signed((&{wire70,
                           wire70})) + (7'h44)));
  assign wire107 = wire95;
  assign wire108 = (~^wire69);
  assign wire109 = wire107[(5'h12):(5'h11)];
  module110 #() modinst136 (wire135, clk, wire97, wire93, wire98, wire69, wire106);
  assign wire137 = $signed((wire71[(4'hf):(4'hc)] ?
                       {$signed((wire72 && (8'haa))), wire93} : wire93));
  assign wire138 = (&(~^$signed(wire93)));
  always
    @(posedge clk) begin
      if ((^(($signed(wire98[(4'h9):(3'h4)]) || $signed(wire72[(2'h2):(1'h0)])) * wire102[(3'h7):(2'h2)])))
        begin
          reg139 <= {$signed(wire108[(1'h1):(1'h1)]), wire106[(3'h4):(3'h4)]};
          reg140 <= wire105;
          if ((({$signed(wire101),
              ({wire107} < (wire93 ? wire107 : (8'ha8)))} <<< {((-wire107) ?
                  wire104 : wire135[(1'h0):(1'h0)])}) - ((((~wire137) < $signed((8'hb6))) ?
                  {(wire95 >> wire104)} : ((wire106 ?
                      wire97 : wire99) == (~&wire96))) ?
              (^~wire103) : {((wire109 >>> wire106) ?
                      $unsigned(wire98) : wire135[(1'h1):(1'h1)])})))
            begin
              reg141 <= (~&{wire108[(3'h7):(1'h0)]});
            end
          else
            begin
              reg141 <= wire70[(3'h7):(2'h2)];
              reg142 <= {wire104, $signed((~^$signed((reg141 ^~ wire108))))};
              reg143 <= {$unsigned((8'hab)), reg142};
              reg144 <= reg140[(4'hf):(3'h7)];
              reg145 <= (8'hb9);
            end
          if ($signed(wire97[(5'h12):(1'h1)]))
            begin
              reg146 <= wire138;
              reg147 <= wire101;
              reg148 <= wire71;
            end
          else
            begin
              reg146 <= (&($unsigned($signed((reg140 ? wire72 : reg141))) ?
                  $signed(wire137[(3'h4):(3'h4)]) : reg142));
              reg147 <= $signed($unsigned(reg144));
            end
          reg149 <= $unsigned(wire104[(3'h4):(2'h2)]);
        end
      else
        begin
          reg139 <= (((wire70[(3'h4):(2'h2)] < ($signed(wire137) ?
                  $signed(wire103) : (reg149 ?
                      (8'hab) : wire99))) ~^ $unsigned(({reg148} | (wire102 | (8'h9f))))) ?
              $unsigned((({reg139,
                  (8'ha1)} ~^ wire70[(3'h5):(1'h1)]) - ((wire108 ?
                      wire101 : (8'h9c)) ?
                  (wire105 ~^ wire107) : (wire93 ?
                      wire95 : wire99)))) : (|wire100[(2'h3):(2'h2)]));
          reg140 <= wire103[(3'h6):(1'h0)];
          if ($signed($unsigned((|{(wire69 < reg144), wire72[(1'h1):(1'h0)]}))))
            begin
              reg141 <= (~wire109);
              reg142 <= ($unsigned((wire69 | wire97)) ~^ $signed(($unsigned({reg141,
                  reg147}) <= {(wire99 - wire106)})));
              reg143 <= $signed($unsigned((($signed(wire97) ?
                      wire100[(5'h10):(3'h5)] : (!wire72)) ?
                  wire72 : ($unsigned(wire106) << reg147))));
              reg144 <= ((((~^(8'haa)) ?
                  (8'haf) : reg143) && reg146[(2'h2):(1'h0)]) > $signed($unsigned({$unsigned((8'hb8)),
                  wire108})));
              reg145 <= $unsigned($signed($signed(((wire69 ?
                  wire105 : wire70) << wire102[(3'h4):(1'h1)]))));
            end
          else
            begin
              reg141 <= $signed(reg146);
              reg142 <= (&reg147);
              reg143 <= (reg144 == {$signed((!(~wire100)))});
              reg144 <= ((((-(!wire93)) ?
                      (^~$signed(wire108)) : (((7'h43) << wire108) ?
                          $signed(wire107) : (reg141 ? wire103 : (8'hbc)))) ?
                  $signed((&wire96[(1'h1):(1'h1)])) : (((wire93 ?
                          (8'ha8) : reg146) && $signed(wire109)) ?
                      {$unsigned(wire137),
                          {wire105,
                              (8'ha6)}} : $signed((~|wire104)))) < (&((wire72[(3'h6):(1'h0)] << wire104[(1'h1):(1'h0)]) | (^~(~|wire104)))));
            end
        end
    end
endmodule

module module4
#(parameter param58 = ((((((8'hb1) ? (8'haf) : (8'had)) >>> ((8'ha3) ? (7'h42) : (8'ha3))) <= (8'hbb)) ? (((!(8'ha5)) || ((8'haf) <<< (8'hb6))) << ((~&(8'hb4)) <= (8'hac))) : (8'hb1)) == ((+(((8'ha5) == (8'ha4)) ? ((8'haf) << (8'hbc)) : ((8'h9c) ? (8'hbe) : (8'ha5)))) ? (~(~&(&(8'had)))) : ((-((7'h40) <= (8'hbd))) | (^((8'hb4) ? (8'haa) : (8'hb2)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire5;
  input wire [(3'h5):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire27;
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  assign y = {wire57,
                 wire49,
                 wire47,
                 wire46,
                 wire45,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire10,
                 wire14,
                 wire27,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg48,
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
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = wire7[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      reg11 <= $signed(wire10[(2'h2):(2'h2)]);
      reg12 <= (|{(8'haa), $unsigned((~(^wire5)))});
      reg13 <= $unsigned($unsigned($unsigned($unsigned(((8'hba) <= wire9)))));
    end
  assign wire14 = (&((&(wire9 == $signed(wire7))) + wire6));
  module15 #() modinst28 (wire27, clk, reg12, wire10, wire14, reg11, wire7);
  assign wire29 = {wire9[(1'h1):(1'h1)], $signed(wire9)};
  assign wire30 = {wire9};
  assign wire31 = (((((wire29 | reg11) ?
                          (wire10 ? wire9 : wire10) : (wire27 ?
                              reg12 : wire9)) ?
                      $signed($unsigned(reg13)) : wire14[(4'ha):(2'h3)]) && wire29[(1'h0):(1'h0)]) > ((wire9[(2'h3):(2'h2)] && (~^(8'hb6))) <<< ($unsigned($unsigned(reg13)) ?
                      ((wire9 <<< wire7) ?
                          {(7'h43),
                              wire8} : $unsigned(wire7)) : ((wire27 != wire29) * (wire10 << wire6)))));
  assign wire32 = $unsigned(((~&wire29[(4'hd):(4'hc)]) * wire9[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg33 <= $signed(wire8);
      reg34 <= ($unsigned($signed(wire6)) ?
          $signed((wire6[(3'h5):(1'h1)] | $signed($unsigned(wire5)))) : wire14[(4'ha):(3'h7)]);
    end
  always
    @(posedge clk) begin
      reg35 <= wire14[(1'h1):(1'h0)];
      if ((8'ha3))
        begin
          reg36 <= ((wire14 ?
                  (wire5 >= ((~^wire31) || {wire9})) : ((~^$signed((7'h40))) ?
                      ((wire5 ? (8'h9e) : wire29) ?
                          ((7'h42) & wire9) : wire30) : ((~^(8'ha2)) >> (&reg12)))) ?
              wire31 : $unsigned(reg12[(3'h6):(3'h5)]));
          if (wire7[(4'hf):(4'hd)])
            begin
              reg37 <= (!$signed((^($signed(wire29) >= {wire10}))));
              reg38 <= (wire32 < (~reg33));
            end
          else
            begin
              reg37 <= reg35;
              reg38 <= wire6;
            end
        end
      else
        begin
          reg36 <= (($signed({$unsigned(wire30), $unsigned((8'hb0))}) ?
              (~wire29) : {$unsigned((wire5 ?
                      wire8 : (8'hbd)))}) ~^ $signed($signed(reg11[(2'h2):(1'h0)])));
        end
      reg39 <= {$signed($unsigned($unsigned((wire27 != reg13))))};
      if ($signed((reg33[(4'hb):(4'h9)] >> reg12[(4'h9):(3'h7)])))
        begin
          reg40 <= (~&$unsigned({((reg11 ? wire10 : reg34) >= (~^wire10)),
              ((^~wire10) ? $unsigned(reg13) : reg36)}));
          reg41 <= $unsigned((!reg33[(3'h6):(2'h3)]));
          reg42 <= $unsigned(reg40[(4'h8):(4'h8)]);
          reg43 <= $signed($unsigned($unsigned((8'ha8))));
          reg44 <= (-$unsigned((~{$signed(wire27)})));
        end
      else
        begin
          reg40 <= ((-(~^{reg12, {reg37, reg35}})) ?
              $unsigned({(&$unsigned(reg36)),
                  reg42}) : $signed({$signed((!reg34))}));
          if (reg36)
            begin
              reg41 <= {(~^{((wire9 ?
                          reg44 : reg36) << reg39[(1'h1):(1'h0)])})};
              reg42 <= {((!$signed((reg36 ? reg41 : wire6))) ?
                      {(~|wire7), reg39[(1'h0):(1'h0)]} : {(~(8'hb4)),
                          ((~(8'hbb)) != $unsigned(reg39))}),
                  $signed(wire27)};
            end
          else
            begin
              reg41 <= (reg42 ? $unsigned({(^~wire6[(1'h0):(1'h0)])}) : reg36);
              reg42 <= ($unsigned(($signed((wire10 ?
                      wire31 : (8'hbb))) ^~ $unsigned($unsigned(reg44)))) ?
                  wire5 : reg34);
              reg43 <= (($signed($signed(((7'h40) ?
                      reg40 : wire9))) >= $unsigned((-$signed((7'h41))))) ?
                  reg34 : $unsigned(wire31[(3'h7):(3'h5)]));
              reg44 <= $unsigned(((+(-(reg33 ?
                  reg36 : wire10))) && ($unsigned($unsigned(wire7)) >> ((+wire6) >>> (wire29 << reg33)))));
            end
        end
    end
  assign wire45 = $unsigned($signed(reg41[(2'h2):(2'h2)]));
  assign wire46 = (8'ha2);
  assign wire47 = $signed(reg13);
  always
    @(posedge clk) begin
      reg48 <= {(~reg40)};
    end
  assign wire49 = ((reg39 ? reg39 : ((~|(&wire45)) ^~ (~|(~&reg41)))) ?
                      wire31 : reg34[(5'h13):(1'h1)]);
  always
    @(posedge clk) begin
      reg50 <= (reg35 ?
          $unsigned((8'hb2)) : {{($unsigned(wire7) ?
                      $signed(reg36) : $signed((8'hbd)))},
              ($signed((+reg36)) << ((wire8 <= wire46) * wire45[(1'h0):(1'h0)]))});
      if (($unsigned($signed(wire30[(3'h7):(1'h0)])) ?
          $signed(((reg13[(1'h1):(1'h1)] < (7'h44)) ?
              (^~wire14[(3'h7):(3'h7)]) : wire9[(2'h2):(1'h1)])) : (~&$unsigned((wire5 ^~ reg35)))))
        begin
          reg51 <= {$unsigned($signed(($unsigned(reg38) == reg42))), wire46};
          reg52 <= $unsigned((wire8[(3'h5):(2'h2)] ?
              ($signed({wire45}) ? (^reg11) : wire10[(1'h0):(1'h0)]) : wire31));
          reg53 <= $unsigned(($unsigned((reg52[(1'h0):(1'h0)] == $unsigned(wire45))) ?
              reg35 : wire5[(4'hd):(2'h2)]));
          reg54 <= (~^{wire46[(4'hb):(1'h1)]});
          reg55 <= $signed({($unsigned(reg37) > reg41)});
        end
      else
        begin
          reg51 <= ($signed($signed(((reg53 >> (8'hbe)) ?
              {wire45} : (^wire5)))) >> (~(reg11 ?
              ((8'haa) & $unsigned(wire46)) : (^(wire45 >>> reg50)))));
          if (($signed($unsigned(reg44[(4'h9):(2'h2)])) ?
              ((8'h9f) << reg48) : $signed(wire5)))
            begin
              reg52 <= $unsigned(reg54);
              reg53 <= $unsigned($unsigned(wire31[(4'h9):(2'h2)]));
              reg54 <= $unsigned((|$unsigned(reg43)));
            end
          else
            begin
              reg52 <= reg51[(3'h5):(1'h1)];
              reg53 <= $signed(wire31[(4'ha):(4'h8)]);
              reg54 <= ($signed((~&($signed(wire7) ~^ (reg37 >> reg39)))) ?
                  $signed($signed($unsigned((~&reg42)))) : reg55);
              reg55 <= (^~(~((~|(^(8'ha7))) ? reg12 : $unsigned((|(8'ha4))))));
            end
        end
      reg56 <= (reg53 ?
          $unsigned((^~$signed(((8'hb6) && reg51)))) : (+((wire6[(2'h3):(2'h2)] ?
                  (reg11 ? reg11 : reg34) : $unsigned(reg51)) ?
              ((wire8 <= wire47) << reg52) : (|(wire29 ? reg39 : wire9)))));
    end
  assign wire57 = reg39;
endmodule

module module15
#(parameter param25 = ((((8'hb5) ? {((8'h9e) ? (8'hb9) : (8'hab)), ((8'ha1) ? (8'hb7) : (8'ha8))} : (+(^~(8'hb2)))) * ((|((8'hbb) ? (8'ha9) : (8'ha2))) ? {{(8'hbc)}} : (8'hbe))) ? ((-((|(8'hbd)) ? ((8'h9f) ^~ (8'h9e)) : (~&(8'hb7)))) ? ((((8'hb5) ? (8'hbe) : (8'hbc)) == {(8'hae), (8'hbc)}) && (((8'hab) ? (8'hb5) : (8'hbc)) != ((8'hbb) ? (7'h40) : (8'ha6)))) : (-(((8'hbb) <= (7'h41)) ? ((7'h42) ? (8'ha6) : (8'hb1)) : (!(8'hb2))))) : (~((+((8'h9f) ? (8'hb5) : (8'hb6))) ? (-(~&(8'ha1))) : (|(+(8'ha2)))))), 
parameter param26 = {(((param25 * param25) != ((^~param25) * (^~param25))) < ((param25 > (param25 ? param25 : (8'ha3))) || ({param25} ? (!param25) : (^param25))))})
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  assign y = {wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = $unsigned(wire19);
  assign wire22 = (wire18 >> ($unsigned(wire17[(2'h2):(1'h1)]) ?
                      ($signed((wire18 >= (7'h41))) ?
                          wire19 : (((8'haa) + wire18) + {wire20})) : ({(^wire20)} == (8'hba))));
  assign wire23 = $signed(wire20[(4'ha):(3'h4)]);
  assign wire24 = (($signed($signed((!wire18))) ?
                          wire16 : $unsigned((-wire16))) ?
                      wire16[(5'h10):(4'h9)] : ($signed((&(^wire16))) ?
                          wire22[(2'h2):(1'h0)] : (&wire19)));
endmodule

module module110  (y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire115;
  input wire signed [(5'h14):(1'h0)] wire114;
  input wire signed [(5'h13):(1'h0)] wire113;
  input wire [(5'h10):(1'h0)] wire112;
  input wire signed [(3'h7):(1'h0)] wire111;
  wire [(4'hb):(1'h0)] wire134;
  wire [(4'hc):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire132;
  wire signed [(4'ha):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire116 = wire111[(3'h6):(1'h1)];
  assign wire117 = ((^($signed({(8'hb3)}) ?
                           $signed($signed(wire112)) : (~^wire114[(2'h2):(1'h1)]))) ?
                       wire111 : ($unsigned(wire115) ?
                           wire115[(3'h6):(3'h5)] : $signed(wire111)));
  assign wire118 = ((!((&wire116) + $unsigned(wire115))) >> wire111);
  assign wire119 = (+wire117[(2'h3):(2'h2)]);
  assign wire120 = (!$unsigned(wire113));
  assign wire121 = (^~(({(wire111 ?
                           wire120 : wire115)} << {$unsigned(wire119)}) == ($signed((wire117 > wire115)) == wire117)));
  assign wire122 = wire119;
  always
    @(posedge clk) begin
      if (wire117)
        begin
          reg123 <= wire116;
          if ({(reg123 <= (~|((|wire121) <= $signed(wire122))))})
            begin
              reg124 <= (&reg123[(3'h7):(1'h0)]);
              reg125 <= (^wire121[(3'h4):(2'h2)]);
              reg126 <= (^~{wire117[(1'h0):(1'h0)], (-wire120[(1'h0):(1'h0)])});
            end
          else
            begin
              reg124 <= wire118[(4'h8):(2'h2)];
            end
          reg127 <= wire121;
          reg128 <= (7'h42);
          reg129 <= wire113;
        end
      else
        begin
          if ($signed($signed((+{((8'ha9) ? wire119 : wire120), (+(8'hb0))}))))
            begin
              reg123 <= $signed($unsigned($unsigned(reg127)));
              reg124 <= (!$unsigned((({reg127} ?
                      (reg123 ? wire122 : wire115) : $unsigned(wire120)) ?
                  (-$unsigned(wire117)) : $signed($signed((7'h40))))));
              reg125 <= reg123[(4'hc):(2'h2)];
              reg126 <= {{($unsigned(wire122) ?
                          (wire122 ~^ $signed(reg127)) : (|{(8'hb5), wire116})),
                      ((^~(reg124 ? reg129 : wire121)) ?
                          wire117 : $signed(wire121[(1'h1):(1'h0)]))}};
              reg127 <= (7'h40);
            end
          else
            begin
              reg123 <= (-(wire122 <<< (wire121[(3'h7):(2'h3)] ?
                  (~wire112[(1'h0):(1'h0)]) : $signed($unsigned(wire111)))));
              reg124 <= {$signed(($signed(wire122[(3'h7):(3'h7)]) ?
                      wire111 : (~|(wire119 ? reg125 : reg125)))),
                  $signed((reg128[(4'h8):(3'h6)] ?
                      ((wire114 * wire112) <= reg126) : $unsigned($signed((8'hba)))))};
              reg125 <= (({$unsigned((reg124 ? (8'hab) : wire113)),
                      $signed($signed(wire116))} < (7'h43)) ?
                  wire116 : ((~^$unsigned((+wire122))) ~^ $unsigned((wire116 <<< reg129))));
            end
          if (($unsigned(reg126) ?
              reg127[(2'h3):(2'h3)] : (($signed($signed(wire122)) ?
                  $signed((wire121 ? wire119 : wire116)) : {$signed(wire111),
                      $unsigned((8'hb3))}) == (~reg123))))
            begin
              reg128 <= $signed(($unsigned(wire111[(1'h1):(1'h0)]) ?
                  {$signed(wire114[(1'h0):(1'h0)])} : $unsigned(wire120)));
              reg129 <= wire120[(1'h1):(1'h0)];
              reg130 <= $unsigned(wire117[(4'h8):(1'h0)]);
            end
          else
            begin
              reg128 <= {reg129[(3'h7):(1'h0)], $unsigned(wire112)};
              reg129 <= $unsigned((^~$unsigned(((wire113 ? (8'hab) : wire119) ?
                  ((8'hb8) > wire121) : wire122))));
            end
          reg131 <= $signed((8'ha4));
        end
    end
  assign wire132 = $unsigned(wire119);
  assign wire133 = $unsigned(((reg129 & {reg131}) ?
                       $unsigned((&wire115[(3'h5):(3'h5)])) : $unsigned($signed((reg125 ?
                           (8'hb3) : wire112)))));
  assign wire134 = reg125;
endmodule

module module73  (y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire77;
  input wire signed [(4'he):(1'h0)] wire76;
  input wire signed [(3'h7):(1'h0)] wire75;
  input wire [(3'h4):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  assign y = {wire92,
                 wire90,
                 wire89,
                 wire79,
                 wire78,
                 reg91,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire78 = (($unsigned(wire76[(4'ha):(1'h1)]) && (^wire74[(3'h4):(1'h0)])) || (-(|({(8'haf)} ?
                      $unsigned(wire75) : wire75))));
  assign wire79 = (wire75[(3'h6):(1'h1)] ?
                      (|((8'ha3) ?
                          {(wire78 ? wire75 : wire75),
                              wire74[(1'h0):(1'h0)]} : {$signed(wire77)})) : wire76[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg80 <= wire76;
      reg81 <= $unsigned(wire78);
      if (({wire79[(4'hd):(4'hb)],
          (~(reg80 ?
              wire76[(2'h2):(2'h2)] : $signed(wire79)))} * $unsigned($unsigned($signed($signed((8'h9d)))))))
        begin
          reg82 <= $signed($signed(wire75));
        end
      else
        begin
          reg82 <= (($unsigned({(wire77 + reg81), reg81[(4'hb):(4'h9)]}) ?
              (reg80[(4'h8):(1'h0)] ^ $signed(wire74[(1'h1):(1'h0)])) : wire78) <<< wire77);
          reg83 <= (reg82 & $unsigned(reg82[(3'h7):(2'h3)]));
          reg84 <= ({wire75,
              {$unsigned($signed(reg81)),
                  (&(~|wire75))}} * (~$signed($signed(((8'hbd) ?
              wire77 : (8'hba))))));
          reg85 <= (wire74[(2'h3):(2'h2)] <= ($unsigned(reg83) ?
              $unsigned(wire77[(2'h3):(1'h1)]) : ((wire78 ?
                      (wire78 ? reg81 : (8'haa)) : $signed(reg82)) ?
                  (wire77 & reg84[(1'h0):(1'h0)]) : (+(8'hb6)))));
          reg86 <= wire75;
        end
      reg87 <= $unsigned(wire75[(3'h5):(1'h1)]);
      reg88 <= $signed($unsigned(wire75[(3'h5):(1'h0)]));
    end
  assign wire89 = (((|((&wire78) && (^reg86))) <<< (($signed(wire77) << ((8'haa) ?
                          reg88 : (8'ha8))) ?
                      $signed(reg88[(2'h3):(2'h2)]) : {wire76[(4'hc):(3'h5)],
                          wire78})) <<< ((|(-$unsigned(reg84))) ~^ ($signed((^~reg82)) ?
                      wire74[(2'h2):(1'h1)] : ($signed(wire76) ?
                          (reg88 ? reg86 : wire77) : wire78[(3'h6):(3'h4)]))));
  assign wire90 = wire79[(5'h11):(5'h10)];
  always
    @(posedge clk) begin
      reg91 <= reg83[(2'h2):(2'h2)];
    end
  assign wire92 = $unsigned(reg83);
endmodule
