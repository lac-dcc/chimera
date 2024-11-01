module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire216;
  wire signed [(4'hb):(1'h0)] wire215;
  wire [(5'h14):(1'h0)] wire187;
  wire signed [(4'hd):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire185;
  wire signed [(3'h6):(1'h0)] wire183;
  wire signed [(4'he):(1'h0)] wire189;
  wire [(4'hf):(1'h0)] wire190;
  wire [(4'h9):(1'h0)] wire191;
  wire [(5'h10):(1'h0)] wire192;
  wire signed [(5'h15):(1'h0)] wire193;
  wire [(3'h5):(1'h0)] wire194;
  wire [(3'h6):(1'h0)] wire213;
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg195 = (1'h0);
  reg [(4'hf):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg197 = (1'h0);
  reg [(4'hc):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg201 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg205 = (1'h0);
  reg [(5'h14):(1'h0)] reg206 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg207 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg208 = (1'h0);
  reg [(5'h12):(1'h0)] reg209 = (1'h0);
  reg [(5'h13):(1'h0)] reg210 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg211 = (1'h0);
  reg [(3'h5):(1'h0)] reg212 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire187,
                 wire186,
                 wire185,
                 wire183,
                 wire189,
                 wire190,
                 wire191,
                 wire192,
                 wire193,
                 wire194,
                 wire213,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 reg203,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed($signed(wire2[(1'h1):(1'h1)]));
      reg6 <= ({($signed((8'haa)) ?
                  $unsigned((wire3 ? (8'h9c) : reg5)) : $signed((reg5 ?
                      wire4 : (8'hb8))))} ?
          reg5[(1'h0):(1'h0)] : (~&wire0[(1'h1):(1'h1)]));
      reg7 <= ((((8'ha8) <= {(wire2 << reg5),
          $signed(reg5)}) > wire1[(3'h4):(2'h3)]) & (reg5[(3'h4):(2'h3)] ?
          ($unsigned((|wire4)) + reg6) : $signed(wire1[(3'h7):(1'h0)])));
      reg8 <= (($signed(wire4) ?
              $unsigned(wire0) : $unsigned($unsigned((wire4 ? reg7 : wire3)))) ?
          $unsigned((8'had)) : ({($unsigned(wire3) + (wire1 >> (8'hbf)))} ^~ (8'ha9)));
      reg9 <= reg5;
    end
  module10 #() modinst184 (.clk(clk), .wire13(wire2), .y(wire183), .wire12(reg7), .wire14(wire0), .wire11(wire4));
  assign wire185 = ((8'ha1) ?
                       $unsigned((~|(-$unsigned(reg7)))) : {$signed(reg6)});
  assign wire186 = reg9;
  module143 #() modinst188 (.clk(clk), .wire147(wire4), .wire146(reg6), .y(wire187), .wire144(wire2), .wire145(wire186));
  assign wire189 = wire186[(4'h8):(1'h1)];
  assign wire190 = ($signed(wire4[(4'hf):(4'hc)]) == $signed($signed({(8'ha1)})));
  assign wire191 = (~|($unsigned(wire185) ?
                       ((&$unsigned(wire190)) <<< wire187[(5'h11):(4'he)]) : $unsigned((((7'h40) ?
                           wire3 : wire187) >= reg6))));
  assign wire192 = $signed((~^wire2));
  assign wire193 = $unsigned(wire185[(4'h9):(3'h4)]);
  assign wire194 = {($unsigned((wire189[(2'h3):(1'h1)] ?
                           $signed(wire4) : $signed(wire192))) + $signed(reg8))};
  always
    @(posedge clk) begin
      reg195 <= reg7;
      reg196 <= (^~($unsigned($signed($unsigned(wire186))) ?
          ($signed((wire190 >= (8'hb2))) * $signed(reg195[(4'h9):(1'h1)])) : wire194[(1'h0):(1'h0)]));
      reg197 <= ((!(8'ha7)) ^~ ((wire189[(4'h8):(3'h4)] ?
              ($unsigned(reg7) && (!wire3)) : (~(wire192 ? wire0 : wire193))) ?
          reg9 : ($unsigned(reg8[(2'h2):(1'h0)]) ~^ reg196[(1'h0):(1'h0)])));
      reg198 <= $signed(wire189[(4'h9):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg199 <= {$signed((|wire194[(3'h5):(1'h0)])), reg198[(2'h2):(2'h2)]};
      if ((!$unsigned(wire183)))
        begin
          reg200 <= wire191[(2'h2):(1'h1)];
          reg201 <= (^$signed($signed((+{(8'ha4)}))));
        end
      else
        begin
          reg200 <= (reg196 ?
              (wire1[(4'ha):(2'h2)] ?
                  {wire4} : $unsigned(wire1[(4'h9):(3'h7)])) : (wire190[(4'h9):(3'h4)] ?
                  (~&(wire3[(3'h5):(3'h5)] ?
                      (!reg199) : $unsigned((8'hbd)))) : (|$signed(wire2))));
          reg201 <= reg200[(3'h6):(2'h2)];
        end
      reg202 <= $signed(wire0[(3'h7):(3'h6)]);
      reg203 <= (&$signed({wire191}));
      reg204 <= ((8'had) < wire2);
    end
  always
    @(posedge clk) begin
      if ({($unsigned(((reg8 ? wire2 : wire189) ?
                  wire185 : wire185[(2'h3):(2'h3)])) ?
              ($unsigned((!wire187)) ?
                  (8'hae) : (((8'ha6) ? (8'had) : wire187) ?
                      reg200 : (~^reg204))) : $signed($signed(((8'hae) ^~ reg195))))})
        begin
          if ((8'hb9))
            begin
              reg205 <= ($signed($signed({wire185,
                  wire192})) >>> (+({$signed(reg203),
                      (wire2 ? reg203 : wire3)} ?
                  {$unsigned(reg8), {wire194}} : (!{reg199, wire1}))));
              reg206 <= ($unsigned((~|$signed({reg203}))) ?
                  $unsigned((((reg195 ? (8'ha9) : wire183) ?
                      (reg199 << wire187) : ((8'hbe) > reg204)) << {(reg203 ?
                          wire189 : reg8),
                      reg6})) : $signed(wire193[(5'h15):(5'h13)]));
              reg207 <= {($signed(($signed(reg197) >>> wire3)) ?
                      $signed(reg198[(1'h0):(1'h0)]) : {$signed({reg206})})};
              reg208 <= reg8;
            end
          else
            begin
              reg205 <= (reg197 - ($signed((~|(!reg5))) || $unsigned({reg202[(2'h3):(2'h3)],
                  (&reg204)})));
              reg206 <= (~^((|$unsigned($unsigned((8'h9f)))) ~^ {(reg201 | reg6)}));
              reg207 <= $signed(($signed($unsigned($unsigned(reg196))) >= (+$unsigned($unsigned(reg197)))));
              reg208 <= ($signed(reg8) ?
                  $signed((~&$signed(wire4[(5'h11):(2'h3)]))) : {reg207});
            end
          reg209 <= wire189[(2'h2):(1'h1)];
        end
      else
        begin
          reg205 <= wire183[(1'h0):(1'h0)];
          reg206 <= wire4;
          reg207 <= (reg207 >= (|(reg202 ?
              wire189 : (reg205[(3'h7):(1'h1)] + {(7'h42), reg199}))));
          if (reg200[(3'h4):(1'h1)])
            begin
              reg208 <= (((wire194[(3'h5):(2'h3)] == ($signed((8'hb7)) > (wire186 > reg7))) ?
                      {wire191} : $signed(((reg202 ?
                          wire186 : reg201) <= $unsigned(reg9)))) ?
                  wire0[(4'hb):(1'h0)] : wire190);
              reg209 <= (~^$unsigned(((((8'ha9) ?
                  wire186 : (8'hb8)) >> (!(7'h42))) >>> {reg203[(2'h2):(2'h2)],
                  (8'hb2)})));
              reg210 <= $unsigned((!($signed((~^reg203)) | reg8)));
            end
          else
            begin
              reg208 <= ((~&(((~^wire192) || wire187) && (|reg206[(2'h2):(1'h0)]))) == ({((8'hbf) ?
                          wire186[(4'hd):(4'hd)] : ((8'hb7) ?
                              reg202 : wire1))} ?
                  (reg202[(1'h1):(1'h1)] * {reg5[(2'h3):(2'h3)]}) : $unsigned($signed($signed(wire183)))));
              reg209 <= $unsigned(reg210);
              reg210 <= reg203;
            end
        end
      reg211 <= ((+reg195) >>> ((wire193[(2'h3):(2'h2)] && ($signed(reg8) ?
              (^wire0) : reg209)) ?
          $unsigned(reg195[(3'h6):(1'h0)]) : reg200[(3'h6):(3'h4)]));
      reg212 <= ({wire2[(4'hc):(3'h4)]} ?
          reg202[(4'h9):(4'h9)] : $unsigned((reg209 ?
              wire186[(1'h0):(1'h0)] : (wire1[(3'h6):(2'h2)] + ((8'ha9) < reg203)))));
    end
  module88 #() modinst214 (wire213, clk, reg195, wire191, reg196, reg209);
  assign wire215 = reg199;
  assign wire216 = reg6;
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire140;
  wire [(4'hd):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  reg signed [(3'h6):(1'h0)] reg182 = (1'h0);
  assign y = {wire180,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire38,
                 wire16,
                 wire15,
                 reg182,
                 (1'h0)};
  assign wire15 = $unsigned($unsigned($unsigned((wire12[(2'h3):(1'h0)] ?
                      wire12 : (wire14 & (7'h41))))));
  assign wire16 = $signed(wire13[(3'h5):(2'h3)]);
  module17 #() modinst39 (.wire19(wire12), .clk(clk), .wire20(wire13), .wire21(wire14), .y(wire38), .wire18(wire16));
  module40 #() modinst84 (wire83, clk, wire11, wire14, wire16, wire13);
  assign wire85 = wire13[(5'h12):(2'h2)];
  assign wire86 = (8'hb0);
  assign wire87 = wire14[(4'hf):(3'h4)];
  module88 #() modinst137 (.clk(clk), .wire92(wire87), .wire91(wire12), .y(wire136), .wire90(wire38), .wire89(wire86));
  assign wire138 = $signed((^wire85));
  assign wire139 = wire14[(1'h0):(1'h0)];
  assign wire140 = (|$unsigned((~^(~wire38))));
  assign wire141 = wire38[(3'h6):(3'h5)];
  assign wire142 = (wire15 <= (^~$signed(wire15[(1'h0):(1'h0)])));
  module143 #() modinst181 (wire180, clk, wire138, wire86, wire139, wire141);
  always
    @(posedge clk) begin
      reg182 <= (!$unsigned(wire138));
    end
endmodule

module module143  (y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire147;
  input wire [(5'h12):(1'h0)] wire146;
  input wire signed [(4'hd):(1'h0)] wire145;
  input wire signed [(3'h7):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire179;
  wire [(4'he):(1'h0)] wire178;
  wire signed [(5'h15):(1'h0)] wire158;
  reg signed [(4'h8):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  reg [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg [(5'h12):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg signed [(4'he):(1'h0)] reg156 = (1'h0);
  reg [(4'hb):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire158,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
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
                 reg161,
                 reg160,
                 reg159,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg148 <= wire144[(3'h4):(2'h3)];
      reg149 <= $signed((8'ha9));
      if ($unsigned((8'ha6)))
        begin
          if (reg149)
            begin
              reg150 <= ($signed((((wire145 == (8'hb9)) > wire146) >> {(wire147 ?
                          reg148 : reg148),
                      wire147[(3'h7):(1'h1)]})) ?
                  (wire145[(4'hc):(4'hc)] ?
                      reg148 : $unsigned({reg148[(3'h5):(2'h3)]})) : ($unsigned(($signed(wire145) ?
                          $unsigned(wire146) : (+wire144))) ?
                      {$signed(wire144[(2'h3):(1'h1)]),
                          wire144} : $unsigned($unsigned((wire147 ?
                          reg148 : reg149)))));
              reg151 <= wire145[(3'h4):(3'h4)];
              reg152 <= $signed(reg151[(4'ha):(4'ha)]);
              reg153 <= {$unsigned($signed(((wire145 ^~ reg149) - (+reg151))))};
              reg154 <= (+{reg149[(1'h1):(1'h1)]});
            end
          else
            begin
              reg150 <= $signed(reg152);
              reg151 <= (reg152 ?
                  reg154[(5'h11):(2'h3)] : $signed((($unsigned(wire145) != $signed(reg154)) | reg153)));
              reg152 <= $signed(reg150[(4'h8):(2'h2)]);
              reg153 <= (({($signed(wire147) ?
                          $signed((8'hac)) : (~|wire146))} & (($unsigned(reg152) != (wire146 != reg149)) ?
                      (8'hac) : (~&(reg149 == (8'ha1))))) ?
                  ((($signed(wire146) ? $signed((8'haf)) : (reg149 << reg148)) ?
                      {$signed(reg151),
                          (8'hb3)} : (&(reg154 << wire144))) ^ reg152[(1'h1):(1'h0)]) : (!wire145[(3'h5):(2'h3)]));
              reg154 <= wire145;
            end
          reg155 <= reg152[(4'ha):(1'h1)];
          reg156 <= $unsigned($unsigned($unsigned(((reg153 ?
              (8'hb0) : reg149) <= (reg148 ~^ reg152)))));
          reg157 <= {((|wire144[(2'h2):(1'h0)]) * {(reg148 == {reg148,
                      wire147}),
                  (~^$unsigned(reg148))})};
        end
      else
        begin
          reg150 <= ((|{($unsigned(reg152) * reg153), $unsigned(reg157)}) ?
              ((&reg149[(4'h8):(3'h4)]) >>> (-$signed((reg153 ?
                  reg156 : wire146)))) : ($unsigned((8'ha6)) < reg156[(4'hc):(1'h0)]));
          reg151 <= (&reg157);
          reg152 <= reg153;
          reg153 <= (^~$signed((&$unsigned($unsigned(reg153)))));
        end
    end
  assign wire158 = $unsigned(reg151[(4'hf):(2'h3)]);
  always
    @(posedge clk) begin
      if ((!($signed($unsigned({reg155, reg151})) ?
          ({$unsigned(reg149)} ?
              {(~(8'haa))} : $unsigned(wire144[(2'h3):(2'h3)])) : {$signed(reg149),
              reg155[(3'h7):(1'h1)]})))
        begin
          if ((-(reg156[(4'ha):(3'h6)] ?
              (~$unsigned(wire145)) : $signed(((8'hb6) << (~&(8'hab)))))))
            begin
              reg159 <= (($signed(reg151[(4'h8):(1'h0)]) ?
                  ((8'hab) << (+{wire144,
                      (8'hb2)})) : $signed((~&wire147))) ^~ $signed((((^reg155) ?
                  reg151 : $signed(reg148)) << (~reg151))));
            end
          else
            begin
              reg159 <= (~^$unsigned({(^$signed((7'h43)))}));
              reg160 <= (-$signed($unsigned(((8'ha1) && $unsigned(reg157)))));
              reg161 <= reg149[(4'hd):(1'h1)];
              reg162 <= {($unsigned($unsigned($signed(reg152))) || (~^$unsigned((-reg156))))};
              reg163 <= $signed(($unsigned((+$signed(reg155))) ?
                  ((wire158[(4'hd):(1'h1)] ?
                          (wire147 ?
                              wire145 : reg157) : reg157[(3'h7):(3'h7)]) ?
                      ($signed(reg152) ?
                          reg148 : $unsigned(reg151)) : reg151[(3'h4):(1'h1)]) : $unsigned(((+reg150) <<< $signed(reg151)))));
            end
          reg164 <= reg157;
          reg165 <= (reg160[(2'h3):(1'h1)] ?
              reg154[(4'h9):(1'h1)] : wire145[(4'h9):(1'h1)]);
        end
      else
        begin
          if (($signed(wire158[(4'hc):(2'h2)]) ? (8'hae) : reg160))
            begin
              reg159 <= $signed($unsigned((-reg148[(3'h5):(3'h4)])));
              reg160 <= reg155[(2'h2):(2'h2)];
              reg161 <= reg152;
            end
          else
            begin
              reg159 <= reg155;
              reg160 <= wire158;
              reg161 <= (~(reg150 ?
                  (~|((wire158 <<< reg162) == (reg153 ^~ reg155))) : ((8'haa) << $unsigned($signed((8'ha8))))));
              reg162 <= wire158[(1'h0):(1'h0)];
              reg163 <= $signed($signed(reg153));
            end
          if ($signed(reg149))
            begin
              reg164 <= (+reg161[(3'h5):(1'h1)]);
              reg165 <= (($signed($signed($signed(reg159))) ?
                  ((~&reg151) ?
                      $signed((reg155 | reg160)) : wire158) : ($signed($unsigned(reg161)) ?
                      $signed($unsigned(reg152)) : $signed($unsigned(wire158)))) & ($unsigned((!(reg154 == reg159))) + $unsigned((~(reg159 ?
                  reg162 : (8'ha6))))));
            end
          else
            begin
              reg164 <= (reg164[(4'hf):(4'ha)] ?
                  $signed(reg161) : {($signed(wire145[(3'h7):(3'h6)]) ?
                          ((reg154 ~^ reg165) ?
                              (reg159 ?
                                  (8'hb1) : reg160) : reg148[(3'h5):(3'h5)]) : ($unsigned(wire147) | (&wire145)))});
              reg165 <= ($unsigned((8'hb3)) >> ($unsigned($unsigned((reg148 ?
                  reg153 : (7'h44)))) < $signed(reg148[(1'h1):(1'h0)])));
              reg166 <= (~^reg163[(3'h7):(1'h1)]);
              reg167 <= $unsigned(((~&wire146[(3'h7):(1'h0)]) ?
                  (^~$signed((reg165 ?
                      wire158 : reg164))) : $unsigned($unsigned(reg166))));
              reg168 <= ((~^(reg148 - wire146)) ?
                  reg159[(2'h2):(1'h0)] : {(&(8'hbb))});
            end
          reg169 <= ($signed(((^~$signed(wire158)) ?
              $signed(((8'hab) <= (8'hb2))) : $signed($unsigned(reg151)))) - ((reg157 ^ $signed({(8'hbc)})) ?
              $signed(((-reg156) ? (+(8'hba)) : (8'hae))) : (~&wire158)));
        end
      reg170 <= (wire146[(3'h6):(2'h2)] + ((&(7'h44)) && $unsigned((8'hb6))));
      if ($unsigned(reg155[(2'h3):(1'h1)]))
        begin
          reg171 <= reg149[(3'h5):(2'h3)];
          if ({$unsigned({reg161}),
              ((($unsigned(wire144) ? wire144 : {wire146}) ?
                  (reg170[(4'hd):(4'hb)] ~^ $unsigned(reg164)) : {$signed(reg151),
                      (reg168 ?
                          reg163 : reg164)}) != $signed($unsigned((!reg165))))})
            begin
              reg172 <= (~|((~&($signed(reg165) && reg168[(2'h2):(1'h1)])) ?
                  (^((+reg167) ~^ $signed((8'h9c)))) : $unsigned((+reg167))));
              reg173 <= (|(~^$signed($unsigned($unsigned(reg168)))));
              reg174 <= (((8'hab) <= ($unsigned($unsigned(reg163)) * $unsigned(reg150))) >>> (~|(reg155 != (-reg161))));
            end
          else
            begin
              reg172 <= (~(reg171[(1'h1):(1'h1)] << reg166[(1'h0):(1'h0)]));
              reg173 <= (8'hae);
            end
          reg175 <= (reg169 >> {$unsigned(((reg148 ^~ reg167) | (~(8'haf)))),
              ((reg168[(1'h1):(1'h1)] ? $signed(reg165) : $unsigned(reg149)) ?
                  reg160[(2'h2):(1'h1)] : (-reg172[(2'h2):(1'h0)]))});
        end
      else
        begin
          reg171 <= reg159;
          reg172 <= reg154;
          reg173 <= ((~(|reg170)) || (~^((~|((8'hae) > reg166)) ?
              ($signed(wire158) ?
                  (!wire146) : (8'hac)) : (reg162[(3'h5):(1'h0)] ?
                  (^reg174) : reg174))));
          reg174 <= reg149[(3'h7):(1'h1)];
          reg175 <= $unsigned((~&{$signed(reg160)}));
        end
      reg176 <= ($signed((8'ha9)) || (!reg149));
      reg177 <= reg169;
    end
  assign wire178 = (~&(^$unsigned($unsigned(wire145))));
  assign wire179 = reg163[(4'hd):(4'h9)];
endmodule

module module88
#(parameter param134 = {(((~^((7'h41) ? (8'hb7) : (8'hb6))) ~^ ((&(8'hb7)) ? ((8'hb7) > (7'h44)) : ((8'hb2) >>> (8'hb6)))) ? ((8'h9d) + {((8'hab) < (8'hbe))}) : {((8'haf) ? (8'hbb) : (^(8'ha1))), (((8'hbc) + (8'hbd)) != (-(8'ha1)))})}, 
parameter param135 = (((~&(-param134)) - {param134, {((8'hbe) * param134)}}) != ((!((!param134) < (param134 >> param134))) <= param134)))
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h1f9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire92;
  input wire signed [(4'h9):(1'h0)] wire91;
  input wire signed [(4'hf):(1'h0)] wire90;
  input wire signed [(4'hf):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  reg [(3'h4):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire94,
                 wire93,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg107,
                 reg106,
                 reg105,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire93 = $signed($unsigned(($signed(wire90[(1'h0):(1'h0)]) <<< wire89)));
  assign wire94 = $signed(wire93);
  always
    @(posedge clk) begin
      reg95 <= $signed(wire92);
    end
  always
    @(posedge clk) begin
      reg96 <= ((wire94 ?
          $signed(wire90) : ($signed(wire91) ~^ wire93)) < reg95[(3'h4):(3'h4)]);
      reg97 <= ((wire94 * wire92) <<< reg96[(4'ha):(4'h9)]);
      reg98 <= (!{(-(reg97 ? $signed(reg95) : (~^reg95))), wire92});
      reg99 <= ($unsigned({wire90}) ?
          (~&reg98) : (reg96[(2'h2):(1'h1)] > ($signed({wire94}) * reg96)));
      reg100 <= ({wire89} * $unsigned(((~&((8'hb1) ~^ (8'hab))) ?
          reg96 : wire91)));
    end
  assign wire101 = $unsigned(((^reg97[(3'h4):(3'h4)]) && (8'hac)));
  assign wire102 = ($unsigned($signed({((8'ha0) ? wire89 : wire94)})) ?
                       $unsigned((~|((wire101 ? reg97 : wire93) ?
                           (wire93 ?
                               (8'hb8) : wire94) : $unsigned(wire93)))) : (&{{(reg99 ?
                                   wire101 : reg95)}}));
  assign wire103 = (!$signed((((-reg97) ?
                       (8'ha7) : wire89[(4'hb):(4'ha)]) ^~ (8'hb0))));
  assign wire104 = wire93;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(reg98[(3'h4):(3'h4)])))
        begin
          reg105 <= (|(wire94[(5'h10):(1'h1)] ?
              ((8'ha6) ? $unsigned(reg95) : {reg97}) : reg96[(2'h3):(2'h3)]));
        end
      else
        begin
          reg105 <= $unsigned(wire92);
        end
      reg106 <= (~|(&((|$unsigned(wire101)) != $signed($unsigned(wire89)))));
      reg107 <= ((8'ha9) ? reg97[(2'h3):(1'h0)] : {wire90});
    end
  assign wire108 = wire91[(2'h3):(1'h0)];
  assign wire109 = reg97[(2'h2):(1'h0)];
  assign wire110 = (!{(~|{(reg95 ? (8'ha9) : reg98), {reg107}})});
  assign wire111 = wire102[(4'hb):(3'h7)];
  assign wire112 = wire108;
  always
    @(posedge clk) begin
      reg113 <= reg100[(3'h7):(3'h7)];
      reg114 <= (^~({(^~(|reg95)), reg106[(3'h5):(3'h4)]} ?
          {{(-reg99)}} : (|$signed(reg113[(4'h8):(2'h2)]))));
    end
  always
    @(posedge clk) begin
      reg115 <= ((~$signed($unsigned(wire89[(4'h8):(4'h8)]))) + $unsigned(reg107));
      reg116 <= wire112[(4'hf):(4'hc)];
      reg117 <= wire111[(3'h4):(3'h4)];
      if (($unsigned($signed(((wire94 ? wire109 : reg99) ?
          {reg99} : $unsigned((7'h41))))) + (+($signed((wire104 ?
          wire94 : wire93)) | $signed(reg97)))))
        begin
          if ((8'hac))
            begin
              reg118 <= (wire112 ?
                  (wire112[(4'hb):(1'h1)] != $signed(reg97[(4'hf):(4'hc)])) : $unsigned(((((8'ha9) ?
                              wire89 : wire104) ?
                          (wire110 ? (8'h9e) : reg115) : {(7'h44)}) ?
                      (reg107 - wire92[(2'h3):(1'h1)]) : reg100)));
              reg119 <= {{((8'ha4) > $unsigned((reg105 ? wire102 : wire89))),
                      (reg97[(3'h4):(1'h1)] ?
                          reg105[(4'hc):(3'h6)] : reg98[(2'h2):(1'h1)])}};
              reg120 <= (~|$unsigned($unsigned($unsigned((reg115 >= wire104)))));
              reg121 <= $signed({(&(!(-wire90)))});
              reg122 <= ((~^$unsigned(({wire101} ^~ ((8'hb8) <= (8'ha8))))) >= (reg106[(1'h0):(1'h0)] ?
                  (~&(|(wire111 ^ wire111))) : $unsigned($signed({reg118,
                      wire102}))));
            end
          else
            begin
              reg118 <= ((~^{($unsigned(reg115) ? $signed(reg99) : {reg116}),
                  {reg98[(1'h0):(1'h0)],
                      (wire91 ?
                          wire93 : reg121)}}) != ((~|reg116) != {reg106}));
              reg119 <= {$unsigned((~&((reg119 ? wire94 : wire94) << (8'ha9)))),
                  wire109};
              reg120 <= $unsigned(reg119[(4'h8):(4'h8)]);
              reg121 <= ((~{((~&reg105) >>> $signed(wire94))}) ?
                  $unsigned({reg106[(4'h8):(2'h2)]}) : reg116);
            end
          reg123 <= $unsigned($unsigned(reg106));
          if (((reg98[(1'h0):(1'h0)] || $signed($unsigned((reg105 ^ reg100)))) ^~ reg98[(3'h5):(2'h3)]))
            begin
              reg124 <= (~&$unsigned(($unsigned($unsigned((8'hb7))) ?
                  $unsigned(reg117) : ((!reg98) ~^ reg116[(3'h6):(3'h4)]))));
            end
          else
            begin
              reg124 <= $signed(wire92);
              reg125 <= reg96;
            end
          reg126 <= $unsigned(({$unsigned((reg117 ? reg124 : wire89)),
              (8'hb7)} * $signed($unsigned((-wire108)))));
          reg127 <= $unsigned($signed(({reg95, (reg118 ? (8'h9e) : (7'h44))} ?
              reg96[(1'h1):(1'h1)] : reg105)));
        end
      else
        begin
          reg118 <= (~|(-($unsigned($unsigned(wire90)) * reg100)));
          reg119 <= wire102;
          reg120 <= $unsigned((~($unsigned((|wire90)) - ({wire91} > $signed(reg119)))));
        end
      reg128 <= (~&(8'hb6));
    end
  assign wire129 = {$signed({{reg117[(3'h5):(2'h2)]}, $signed(wire94)}),
                       (^~((+(reg119 ?
                           wire91 : reg116)) <= $unsigned($signed(wire103))))};
  assign wire130 = {wire94, $signed(reg120[(1'h0):(1'h0)])};
  assign wire131 = (((reg115[(3'h7):(2'h2)] ?
                           wire104[(2'h2):(2'h2)] : $signed(reg119[(1'h1):(1'h1)])) ?
                       ((~|(wire111 << reg95)) <= $unsigned((wire91 * reg98))) : wire89) && ((((wire110 && wire94) - (8'hb5)) ?
                           ({wire108} << reg116[(3'h5):(3'h4)]) : ($unsigned(wire130) || (reg99 ?
                               reg114 : wire90))) ?
                       wire108 : wire129));
  assign wire132 = (-$unsigned(reg99));
  assign wire133 = (reg123[(3'h6):(3'h6)] ?
                       $signed(({(~&reg116)} ?
                           ($signed(reg113) ?
                               reg120 : (reg96 != wire131)) : $signed($unsigned((8'hb2))))) : wire112);
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire44;
  input wire signed [(3'h4):(1'h0)] wire43;
  input wire signed [(4'hf):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire53;
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= wire42[(4'h9):(2'h3)];
      reg46 <= (^{(wire42[(3'h5):(1'h1)] | reg45)});
      reg47 <= ($signed({$signed(reg45[(3'h5):(1'h0)])}) <= (~&$signed($signed((wire43 ?
          reg45 : (8'haf))))));
      reg48 <= $unsigned(reg46);
    end
  always
    @(posedge clk) begin
      reg49 <= reg47[(2'h3):(1'h1)];
      reg50 <= reg47;
      reg51 <= $unsigned((-((8'ha3) ~^ $unsigned((~|(8'hbe))))));
      reg52 <= $signed((&{(8'hbb)}));
    end
  assign wire53 = $unsigned(wire44[(3'h6):(1'h0)]);
  assign wire54 = $signed($unsigned((|wire42[(2'h2):(1'h1)])));
  assign wire55 = {$signed({reg48, $signed((+wire44))})};
  assign wire56 = $signed(wire41);
  assign wire57 = $signed(((wire53 ?
                      (reg52 == (wire43 || wire41)) : $unsigned((!reg50))) << (wire54 ?
                      $signed($unsigned(wire53)) : $signed((&(8'haf))))));
  assign wire58 = ((~&wire54[(2'h3):(1'h0)]) || ((!reg51[(2'h2):(1'h0)]) & $signed((~wire57[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($unsigned((8'hac)))
        begin
          reg59 <= wire58;
          if (reg48)
            begin
              reg60 <= (-$unsigned($signed(((reg47 << reg52) != $unsigned(wire58)))));
            end
          else
            begin
              reg60 <= $signed(reg52);
              reg61 <= ($signed(reg47) < $unsigned($signed(reg50[(1'h1):(1'h0)])));
              reg62 <= $unsigned({$signed(reg49[(2'h2):(1'h1)]),
                  (wire43[(3'h4):(2'h3)] ?
                      $unsigned((-wire41)) : (|(~reg51)))});
              reg63 <= $unsigned((8'h9f));
              reg64 <= wire55[(4'ha):(2'h3)];
            end
          reg65 <= ($unsigned(($unsigned((^(8'ha4))) ?
              (((8'hba) ? wire57 : (8'hb5)) ?
                  wire57[(1'h0):(1'h0)] : (wire42 && reg46)) : {((8'haa) * (8'ha6))})) ^~ (wire41[(3'h7):(3'h6)] < ($signed(((8'hbf) ?
              reg61 : (8'ha0))) <= $signed((8'ha0)))));
          reg66 <= ((reg49 ?
              (($signed(reg62) ?
                  {wire42} : (wire42 ?
                      reg61 : wire57)) + reg52[(2'h3):(2'h2)]) : $signed((~&(^~wire41)))) | (^(wire58 ?
              {(reg45 ? (8'hb4) : (8'hb0))} : wire43[(2'h3):(2'h3)])));
        end
      else
        begin
          reg59 <= $unsigned(($signed(((|wire56) || (~(8'hae)))) ?
              reg64[(3'h5):(1'h1)] : (($unsigned((8'hb8)) ?
                  $signed(reg60) : wire54[(2'h2):(1'h0)]) & (+wire54[(2'h2):(1'h0)]))));
          if ($unsigned(($unsigned(reg63) * wire54[(1'h1):(1'h0)])))
            begin
              reg60 <= ({reg45[(3'h7):(2'h3)]} || ($unsigned({$signed(reg46),
                  {reg52, reg66}}) > $signed((~|$signed(reg60)))));
              reg61 <= ({reg50} ?
                  (reg62 + (~^(~(~reg60)))) : reg50[(1'h0):(1'h0)]);
            end
          else
            begin
              reg60 <= (~|(8'h9c));
              reg61 <= (^(reg49 ? reg61[(1'h1):(1'h1)] : reg63));
              reg62 <= $signed($signed((reg51[(3'h6):(3'h5)] > ($signed(wire57) < reg60))));
              reg63 <= reg45[(3'h5):(2'h3)];
              reg64 <= $unsigned(wire43);
            end
          if (wire43[(1'h1):(1'h1)])
            begin
              reg65 <= reg60;
              reg66 <= $unsigned(wire58[(1'h0):(1'h0)]);
              reg67 <= reg50;
            end
          else
            begin
              reg65 <= wire41;
            end
          reg68 <= ($unsigned($signed($unsigned(reg52[(2'h2):(1'h1)]))) + wire55);
        end
      if ((reg64 ? (reg61 ? $unsigned(wire41) : reg64) : $unsigned((7'h42))))
        begin
          reg69 <= $unsigned(($unsigned({(&reg66)}) ^~ (&{(~|reg61)})));
          if ({(wire55[(4'h9):(1'h0)] ?
                  (((reg49 ? (8'ha9) : reg47) ? (reg45 | (8'hbf)) : (&wire55)) ?
                      wire54 : reg50[(1'h0):(1'h0)]) : ((wire42 + {reg66}) ?
                      reg66[(1'h1):(1'h1)] : (~{reg66, reg65}))),
              reg63})
            begin
              reg70 <= ($unsigned((((8'ha6) * $signed((8'hb9))) << reg45[(3'h4):(3'h4)])) >= $unsigned(reg48));
            end
          else
            begin
              reg70 <= {$unsigned(reg64[(2'h3):(2'h2)]),
                  ($signed((~&{reg66, wire56})) | wire41[(4'hd):(4'ha)])};
            end
          reg71 <= (&reg52[(4'h8):(3'h4)]);
          reg72 <= $unsigned((~&$signed(reg62[(4'hd):(4'hc)])));
          if ($signed($unsigned((((reg67 ? reg52 : (8'hbb)) ?
              $signed(wire53) : (8'ha7)) >> $signed($signed(reg61))))))
            begin
              reg73 <= {reg45[(2'h3):(2'h3)]};
            end
          else
            begin
              reg73 <= $signed(wire56);
              reg74 <= ($signed($unsigned($signed($unsigned(reg59)))) ?
                  $unsigned(wire43) : (^~(reg69 ?
                      ($signed(reg65) ?
                          $signed(wire42) : (reg45 ?
                              reg45 : reg63)) : $signed((wire55 + reg61)))));
              reg75 <= {$signed((wire54[(1'h0):(1'h0)] & {reg47[(2'h2):(1'h1)]})),
                  (8'ha9)};
              reg76 <= $signed(reg65[(3'h5):(3'h4)]);
              reg77 <= (|reg50[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg69 <= reg77;
          reg70 <= reg68[(3'h5):(2'h3)];
          reg71 <= $unsigned(reg69);
          reg72 <= $unsigned(($signed((8'ha1)) ?
              (reg71[(3'h6):(1'h0)] ?
                  (reg51 ?
                      (reg69 ?
                          reg60 : reg64) : (|reg67)) : reg70) : (&(!$signed(reg76)))));
        end
      reg78 <= (&(~|$unsigned(reg69)));
      reg79 <= {($unsigned(((wire43 ? (8'hbb) : wire58) ?
              $signed((8'hb9)) : (wire57 ?
                  reg71 : reg51))) & reg69[(4'ha):(4'h8)]),
          reg50};
      reg80 <= $signed($signed($signed(($signed(reg73) ?
          (!reg68) : (reg51 ? (8'hb7) : reg59)))));
    end
  assign wire81 = $unsigned({{(reg48 | (reg64 ? (8'ha5) : (8'hb4))),
                          (^~reg49[(4'hb):(4'h8)])}});
  assign wire82 = (8'ha3);
endmodule

module module17
#(parameter param36 = {(((-(~^(7'h41))) > {((8'had) ? (8'hbf) : (7'h43))}) <= ((^~(~|(8'haa))) ^ (!((8'hb4) - (7'h44))))), (({((8'ha7) ? (8'ha7) : (8'ha1)), {(8'had), (8'h9e)}} >>> ((!(8'ha4)) && ((8'had) ? (8'hb1) : (8'hba)))) < ((((8'hb1) >> (7'h43)) ? ((8'haa) ? (8'ha4) : (8'h9e)) : (8'hab)) ? (((8'hbb) * (8'ha0)) ? (^~(7'h44)) : ((8'hb9) ? (8'ha5) : (8'ha0))) : (8'hbc)))}, 
parameter param37 = ((param36 ^ {(param36 ? {param36} : {param36}), param36}) < ((~^{{param36, param36}}) ? (({param36} ? (-param36) : (param36 ? (8'h9d) : param36)) ? {((8'ha1) >> param36), param36} : {((8'hb8) ? param36 : param36)}) : (param36 < ((param36 || (8'hae)) ? (!param36) : (param36 ? (8'haf) : param36))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire35,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire22 = ((~|$signed($signed((wire21 ^ wire19)))) ?
                      wire18 : (wire19 ^ $signed((^~(wire18 && wire18)))));
  assign wire23 = wire22;
  assign wire24 = $signed($unsigned(($unsigned(wire22) ?
                      (wire20[(3'h7):(2'h3)] - $signed(wire21)) : (wire19[(4'h8):(3'h5)] && wire20))));
  assign wire25 = $signed({wire21[(4'ha):(2'h3)],
                      ((wire21 ?
                          (^~wire20) : $signed(wire19)) && wire21[(4'hd):(1'h0)])});
  assign wire26 = wire23;
  assign wire27 = (7'h41);
  assign wire28 = $signed(wire20[(4'h8):(3'h6)]);
  assign wire29 = wire26[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg30 <= {$unsigned(wire28)};
      reg31 <= $unsigned((wire24 | (^~((reg30 ? wire22 : (8'h9c)) ?
          (wire27 > wire29) : (wire22 >>> wire26)))));
      reg32 <= ($unsigned({$signed(wire20[(4'hb):(1'h0)]),
              (wire20 >> wire25)}) ?
          ((|((~^wire19) ? reg30[(1'h1):(1'h0)] : reg30)) ?
              (^~{((8'hb7) ? wire18 : wire29),
                  $unsigned(wire21)}) : $signed(((wire20 ^~ (8'ha1)) || {wire22}))) : {(wire25[(4'h8):(4'h8)] ?
                  (wire18[(4'h8):(1'h0)] ?
                      (wire27 != wire29) : wire18[(4'hb):(1'h0)]) : wire25[(4'h9):(2'h3)]),
              $signed(reg31)});
      reg33 <= ({{($unsigned(reg32) * wire19[(3'h6):(3'h5)]),
              $signed((wire20 ? wire23 : wire22))},
          ($signed($unsigned(wire29)) ?
              reg30[(1'h1):(1'h0)] : reg31)} * $signed(wire28));
    end
  always
    @(posedge clk) begin
      reg34 <= wire23[(3'h5):(1'h1)];
    end
  assign wire35 = $unsigned(((~&($signed(wire24) ?
                          (~|wire24) : wire21[(1'h0):(1'h0)])) ?
                      ($unsigned(reg30[(1'h0):(1'h0)]) <<< $signed(wire22[(1'h1):(1'h0)])) : {{$unsigned(wire25),
                              $unsigned(wire22)}}));
endmodule
