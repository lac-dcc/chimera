module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire209;
  wire signed [(3'h7):(1'h0)] wire208;
  wire [(4'h9):(1'h0)] wire207;
  wire signed [(4'he):(1'h0)] wire205;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire207,
                 wire205,
                 wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = {wire4[(3'h6):(3'h6)]};
  assign wire6 = (((wire2[(2'h2):(1'h1)] ? (8'hb8) : (8'hae)) ?
                     {$unsigned(((8'ha5) ?
                             wire4 : wire3))} : wire5) & wire2[(1'h1):(1'h1)]);
  assign wire7 = $signed($unsigned($signed((~wire0[(4'hc):(4'h8)]))));
  assign wire8 = (wire6 ? wire6[(2'h3):(1'h1)] : $signed((~{(^~wire0)})));
  always
    @(posedge clk) begin
      if ((wire6 >> ((|{(8'h9c), wire6[(4'h9):(3'h5)]}) ?
          wire7[(2'h2):(1'h1)] : (((&wire0) ?
                  wire3[(4'h9):(3'h7)] : (wire8 ? (8'hb8) : wire3)) ?
              (8'hbe) : (-$unsigned(wire6))))))
        begin
          reg9 <= $signed((~$signed((~&{wire3}))));
          if (wire8)
            begin
              reg10 <= wire8[(4'h8):(3'h5)];
            end
          else
            begin
              reg10 <= (+wire8[(2'h3):(1'h0)]);
              reg11 <= $signed(((^wire4) ? wire3 : {wire4, wire3}));
              reg12 <= (~|($signed((^reg9)) ?
                  wire7 : $signed($signed($unsigned(wire0)))));
              reg13 <= {$unsigned(wire7[(1'h0):(1'h0)]), wire0[(4'ha):(2'h3)]};
              reg14 <= $signed(wire0);
            end
          reg15 <= $signed($unsigned(wire0));
          if ($signed((!((reg11[(3'h7):(3'h7)] ?
              (reg15 <= reg12) : $unsigned(wire8)) ^ (~&reg9)))))
            begin
              reg16 <= {(~&(|$signed(wire1[(4'hf):(4'hf)]))),
                  $signed($unsigned($signed($signed(reg14))))};
            end
          else
            begin
              reg16 <= reg15;
              reg17 <= (((^reg15[(2'h3):(2'h2)]) >>> ((reg9[(3'h5):(1'h0)] ?
                      wire2[(1'h1):(1'h0)] : $signed(reg10)) - $signed((^~wire1)))) ?
                  $unsigned(wire3[(4'hd):(4'ha)]) : $signed(wire4[(2'h2):(2'h2)]));
            end
          reg18 <= (+$signed(wire0));
        end
      else
        begin
          reg9 <= (!(+reg13[(3'h5):(2'h3)]));
        end
      reg19 <= wire3;
    end
  assign wire20 = reg12;
  always
    @(posedge clk) begin
      reg21 <= $signed((($unsigned(reg12[(3'h5):(3'h5)]) ?
          {(8'ha8), reg15} : $signed($unsigned((8'hbb)))) && reg9));
      reg22 <= (~$signed((8'ha6)));
      reg23 <= (wire20[(1'h1):(1'h1)] << (reg18 ?
          ((^$unsigned(reg16)) ?
              wire0 : $unsigned($unsigned((8'ha4)))) : reg18));
    end
  module24 #() modinst206 (.wire25(reg16), .wire27(reg9), .wire29(wire20), .wire26(wire3), .y(wire205), .wire28(reg13), .clk(clk));
  assign wire207 = reg16[(2'h2):(1'h1)];
  assign wire208 = (~&$unsigned(($signed((wire8 || wire207)) ?
                       ((wire20 != wire3) < (reg13 != wire205)) : ($unsigned(wire6) <<< reg18[(4'h8):(3'h6)]))));
  assign wire209 = ((^~($signed((~|wire4)) == $unsigned($unsigned(reg9)))) ?
                       (reg9 ?
                           reg17 : ($signed((reg10 ? reg23 : wire7)) ?
                               $unsigned((+wire1)) : ($signed((7'h41)) ?
                                   wire8 : (wire3 != reg16)))) : ((!wire5) < {wire2[(1'h0):(1'h0)],
                           $unsigned((wire0 ? wire208 : reg12))}));
endmodule

module module24
#(parameter param204 = {(((7'h44) != {((8'hb6) ? (8'h9f) : (8'hb5)), {(7'h40)}}) <<< ((~^((8'hb5) >>> (8'ha2))) ? (^~((7'h40) || (8'ha4))) : (~((8'hbe) ? (8'ha0) : (8'hbc))))), (({((8'ha7) ? (8'ha3) : (8'hac))} ? ({(8'h9d), (7'h44)} ? (-(8'hbd)) : ((8'hb6) ? (7'h41) : (8'ha3))) : (+((8'hbc) ? (8'ha1) : (8'ha7)))) ? ((((8'hb3) - (8'hba)) ? {(8'had), (7'h41)} : ((7'h40) != (8'ha5))) ? ((|(8'hac)) ? (~(8'hb5)) : ((8'ha8) - (8'ha0))) : ((&(8'hb3)) >= ((8'hbc) ? (8'hae) : (7'h40)))) : (&(-{(8'hae)})))})
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire signed [(3'h7):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire203;
  wire signed [(5'h14):(1'h0)] wire202;
  wire [(5'h11):(1'h0)] wire201;
  wire signed [(4'ha):(1'h0)] wire200;
  wire [(4'h8):(1'h0)] wire199;
  wire [(3'h4):(1'h0)] wire198;
  wire [(4'hf):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire132;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire195;
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire123,
                 wire86,
                 wire85,
                 wire83,
                 wire125,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire195,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  module30 #() modinst84 (wire83, clk, wire26, wire27, wire29, wire28);
  assign wire85 = wire28[(4'h9):(3'h5)];
  assign wire86 = ((~&(~wire28)) ?
                      (wire85 && $unsigned($signed((~&wire83)))) : ((~|wire83) & wire83));
  module87 #() modinst124 (.wire89(wire28), .wire92(wire25), .clk(clk), .wire90(wire85), .y(wire123), .wire91(wire86), .wire88(wire27));
  assign wire125 = (wire85 || wire86);
  assign wire126 = wire83[(3'h7):(1'h0)];
  assign wire127 = (!(wire25 ? wire123 : $unsigned(wire27)));
  assign wire128 = ($unsigned((wire126[(3'h4):(1'h1)] ^ wire83[(3'h5):(3'h4)])) - ($signed($unsigned((wire28 <<< (8'hb8)))) == wire25));
  assign wire129 = $unsigned(((|wire125[(4'he):(4'hd)]) ~^ (~^(^((8'ha4) ?
                       wire123 : wire25)))));
  assign wire130 = (~^($signed(wire25) >= $signed(({(8'hba),
                       wire126} >> (wire27 ~^ wire128)))));
  assign wire131 = (wire28 ?
                       wire85[(2'h3):(1'h1)] : ({wire27[(2'h3):(1'h0)]} ^~ $unsigned(((wire25 ?
                           wire129 : wire27) < $unsigned(wire129)))));
  assign wire132 = (-$unsigned(wire128));
  assign wire133 = ($signed(wire129[(2'h2):(2'h2)]) ~^ $signed({$unsigned((~^wire126)),
                       ((+(8'hac)) ? wire132 : ((8'haf) | wire26))}));
  always
    @(posedge clk) begin
      reg134 <= wire125[(4'h8):(2'h2)];
      if ({$signed((wire123 ? $unsigned((wire123 <= (8'hb7))) : {wire127}))})
        begin
          reg135 <= wire125;
          reg136 <= (+wire127);
          reg137 <= (wire128[(5'h15):(2'h3)] && ($unsigned($signed(wire126[(2'h2):(1'h1)])) ^~ (8'ha1)));
          reg138 <= $signed(($unsigned($signed((&(8'ha5)))) << ((reg134 ?
              {wire83} : $unsigned((8'hba))) << wire125[(4'h8):(3'h6)])));
          reg139 <= $signed(wire29[(3'h5):(1'h1)]);
        end
      else
        begin
          reg135 <= (wire29[(3'h4):(2'h2)] != (((^~(wire25 ?
                  reg136 : wire26)) | ((^(8'hb6)) ?
                  wire123[(4'he):(3'h6)] : $unsigned(reg134))) ?
              $signed($unsigned((wire26 ? wire130 : (8'hbe)))) : (^~wire83)));
          if (wire25)
            begin
              reg136 <= $signed((~&({$signed(wire29),
                  $signed(wire131)} * wire129[(2'h2):(1'h0)])));
            end
          else
            begin
              reg136 <= wire123;
              reg137 <= $unsigned(wire25);
              reg138 <= (!(8'haf));
              reg139 <= $signed($unsigned(((wire83[(3'h7):(3'h6)] ?
                      wire86 : (wire86 != wire129)) ?
                  (wire131[(2'h3):(2'h2)] ?
                      $signed(wire127) : $signed((8'hbe))) : ($unsigned(wire132) ?
                      (~&wire129) : ((8'hac) & wire129)))));
            end
          reg140 <= $signed((wire132 < (-($signed(wire133) ?
              wire131 : ((7'h43) >> wire27)))));
          reg141 <= wire129[(1'h1):(1'h1)];
        end
    end
  module142 #() modinst196 (.clk(clk), .wire146(wire25), .wire143(wire132), .wire147(reg139), .wire145(reg141), .y(wire195), .wire144(wire126));
  assign wire197 = ({{wire130[(4'ha):(3'h6)], (^~wire132[(2'h3):(1'h0)])},
                           (~$signed((reg137 ~^ wire126)))} ?
                       (|$signed((!$unsigned((7'h44))))) : wire26);
  assign wire198 = (^reg138[(3'h7):(3'h7)]);
  assign wire199 = ($unsigned(reg136) ?
                       ($unsigned(reg136[(2'h2):(2'h2)]) || reg135) : ((reg134 ?
                           {$signed(wire123)} : (!(8'h9c))) || (reg137 && (~{wire86}))));
  assign wire200 = (~wire26[(2'h3):(2'h3)]);
  assign wire201 = $signed($unsigned($signed((^$signed(wire132)))));
  assign wire202 = wire201[(1'h0):(1'h0)];
  assign wire203 = (+(~^(~|(7'h43))));
endmodule

module module142
#(parameter param194 = {((8'ha4) ? (~({(8'hb2), (8'ha2)} ? ((8'hb6) >> (8'haa)) : ((8'hb0) ? (8'h9f) : (8'ha7)))) : ((((7'h42) > (8'hb3)) * ((7'h42) << (8'hbf))) ? ((^(8'h9d)) ? ((8'hb5) > (8'hac)) : (8'ha5)) : {(8'hb8), (~&(8'ha0))})), (-{(8'hb4), (((8'ha8) ^~ (8'hae)) >= (&(7'h41)))})})
(y, clk, wire147, wire146, wire145, wire144, wire143);
  output wire [(32'h20e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire147;
  input wire signed [(4'h8):(1'h0)] wire146;
  input wire signed [(2'h3):(1'h0)] wire145;
  input wire signed [(5'h15):(1'h0)] wire144;
  input wire signed [(5'h12):(1'h0)] wire143;
  wire signed [(5'h13):(1'h0)] wire193;
  wire signed [(4'ha):(1'h0)] wire192;
  wire [(5'h11):(1'h0)] wire191;
  wire [(4'hc):(1'h0)] wire190;
  wire [(4'hd):(1'h0)] wire189;
  wire signed [(4'hd):(1'h0)] wire188;
  wire [(4'hd):(1'h0)] wire187;
  wire [(3'h6):(1'h0)] wire186;
  wire signed [(4'hd):(1'h0)] wire185;
  wire [(4'he):(1'h0)] wire184;
  wire [(5'h12):(1'h0)] wire183;
  wire [(3'h7):(1'h0)] wire182;
  wire signed [(3'h5):(1'h0)] wire181;
  wire signed [(4'h8):(1'h0)] wire180;
  wire signed [(4'hd):(1'h0)] wire179;
  wire signed [(2'h2):(1'h0)] wire154;
  wire [(5'h10):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire151;
  wire [(4'hd):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire149;
  wire [(4'hb):(1'h0)] wire148;
  reg [(2'h3):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg175 = (1'h0);
  reg [(4'h8):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(4'he):(1'h0)] reg172 = (1'h0);
  reg [(5'h15):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg169 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg [(4'ha):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 reg178,
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
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 (1'h0)};
  assign wire148 = wire145;
  assign wire149 = ({wire146[(2'h3):(1'h1)]} | (-(($signed((8'ha0)) ?
                           wire148 : ((7'h42) ? wire146 : wire145)) ?
                       ((8'hbb) ?
                           (wire148 < wire148) : $unsigned(wire148)) : (wire144[(2'h3):(2'h3)] ?
                           (wire145 >> wire146) : (wire145 + wire147)))));
  assign wire150 = $unsigned(($unsigned((&(wire145 ? wire145 : wire149))) ?
                       ($unsigned((!wire144)) > $signed({wire144,
                           wire143})) : $unsigned($unsigned($unsigned(wire143)))));
  assign wire151 = (wire145[(2'h3):(2'h3)] != {$signed($signed($unsigned((8'h9d))))});
  assign wire152 = (wire144 ? wire148 : wire145);
  assign wire153 = (&wire144);
  assign wire154 = ($signed({((8'ha3) <<< wire148)}) ?
                       wire145[(1'h1):(1'h0)] : wire145);
  always
    @(posedge clk) begin
      if ((($signed(($signed(wire143) ^ (wire143 ^ wire148))) ?
          (8'ha0) : (!wire150)) * $unsigned(wire150)))
        begin
          if ($unsigned(wire151[(4'h8):(1'h0)]))
            begin
              reg155 <= wire146;
              reg156 <= (|$signed(wire148[(1'h0):(1'h0)]));
              reg157 <= $signed($signed((|reg155)));
              reg158 <= ($unsigned(wire145) < wire144);
              reg159 <= $unsigned(($unsigned((wire147 << $unsigned(reg155))) ?
                  wire151[(4'h8):(2'h2)] : wire148));
            end
          else
            begin
              reg155 <= (^~wire153[(4'hf):(4'hf)]);
              reg156 <= $signed($signed(wire148[(1'h1):(1'h0)]));
              reg157 <= (wire145[(1'h0):(1'h0)] < wire144);
            end
          if ((($signed(((-(8'hbf)) ? (+wire147) : (~^reg157))) ?
              (($signed(wire144) > wire143) > (~|wire154[(1'h1):(1'h1)])) : wire150[(1'h0):(1'h0)]) <<< (wire151 ~^ $unsigned(wire147[(4'ha):(2'h3)]))))
            begin
              reg160 <= (8'haf);
              reg161 <= ($unsigned($unsigned((8'hb0))) <<< ((reg159[(1'h0):(1'h0)] != ((wire148 ?
                      wire145 : reg158) >>> (wire153 ~^ wire150))) ?
                  ($unsigned((^reg158)) | wire145[(2'h3):(2'h3)]) : (~^$signed(wire151))));
              reg162 <= {reg158};
              reg163 <= ($unsigned(wire147[(1'h1):(1'h1)]) ~^ ((8'hbb) ?
                  ((reg160 | (|(8'hac))) >> $signed((~^wire151))) : $signed(({wire151} ?
                      wire149[(4'hd):(3'h7)] : (wire146 ?
                          wire153 : wire145)))));
              reg164 <= wire147[(4'ha):(3'h5)];
            end
          else
            begin
              reg160 <= (reg163 ? wire154[(1'h0):(1'h0)] : $unsigned(wire154));
              reg161 <= wire152;
              reg162 <= reg164;
              reg163 <= wire147[(3'h7):(3'h7)];
              reg164 <= (wire145 ^~ reg162);
            end
          reg165 <= reg162;
        end
      else
        begin
          reg155 <= $signed({wire151[(4'hf):(4'h8)]});
          reg156 <= $signed((($unsigned($unsigned((8'ha3))) ?
                  wire144 : $signed((~|reg161))) ?
              ({wire145[(2'h2):(1'h1)],
                  (reg160 == reg160)} >= $unsigned($signed(reg165))) : {$signed($unsigned(reg163)),
                  (|(~&wire152))}));
          reg157 <= $signed(reg157);
        end
      reg166 <= (!{({(wire150 ? reg164 : (8'h9f)),
              reg157} - $signed((!reg164)))});
      if ((reg164 ?
          {(-($signed(reg164) ? reg157 : (reg160 ? reg159 : wire152))),
              $unsigned(wire150[(3'h6):(3'h6)])} : wire152[(4'hf):(3'h4)]))
        begin
          if (((~^($unsigned(wire152[(2'h2):(1'h0)]) + (&reg157))) ?
              (~^wire147) : reg165[(2'h2):(1'h0)]))
            begin
              reg167 <= (8'hb4);
              reg168 <= (-($signed($unsigned($signed(reg157))) >= {(wire147[(2'h3):(1'h0)] + $unsigned(reg157)),
                  $signed($signed(reg159))}));
            end
          else
            begin
              reg167 <= (reg156[(1'h0):(1'h0)] == ($unsigned(wire143[(3'h5):(2'h3)]) <= ((8'ha1) ?
                  wire149[(5'h10):(3'h7)] : $unsigned(reg160[(4'he):(3'h6)]))));
              reg168 <= (~&reg168[(1'h0):(1'h0)]);
              reg169 <= {$unsigned(((!$signed((8'hb0))) ~^ $signed((wire151 ~^ reg155))))};
            end
          reg170 <= reg162[(4'hf):(4'h9)];
          reg171 <= (reg170[(1'h0):(1'h0)] ?
              reg156 : {({(~|wire146),
                      (wire150 ? wire148 : (8'hbb))} > (~|(wire145 ?
                      reg166 : reg162)))});
          if ((8'hac))
            begin
              reg172 <= $unsigned(reg155);
              reg173 <= {(-wire144[(4'h8):(3'h7)]),
                  (~&($signed((-reg162)) >> (wire152 ?
                      (reg155 < reg161) : ((8'h9d) ? reg156 : (8'hb0)))))};
              reg174 <= (reg160 ?
                  (({(^~wire149)} ?
                      $signed(wire152) : (&(reg169 ?
                          (8'haa) : (8'ha3)))) << ({(8'hbe),
                      (reg157 >> reg161)} << (^$signed(wire144)))) : reg170);
              reg175 <= reg160;
            end
          else
            begin
              reg172 <= reg156;
              reg173 <= wire153;
              reg174 <= reg175[(4'ha):(3'h6)];
              reg175 <= reg168;
              reg176 <= reg169[(1'h1):(1'h1)];
            end
          reg177 <= (~$signed(wire152[(4'h8):(1'h1)]));
        end
      else
        begin
          if (($unsigned(wire148[(3'h7):(3'h7)]) >>> $unsigned(reg161)))
            begin
              reg167 <= $unsigned(wire143);
            end
          else
            begin
              reg167 <= reg173[(2'h2):(2'h2)];
              reg168 <= wire143[(4'h8):(3'h4)];
            end
          if ((-({(&(reg160 ? reg165 : reg156)), (7'h43)} ?
              reg164[(4'ha):(3'h5)] : $unsigned(($signed(reg168) <= $signed(wire143))))))
            begin
              reg169 <= (~wire147[(4'h8):(2'h3)]);
              reg170 <= reg166;
              reg171 <= reg168[(2'h3):(1'h0)];
              reg172 <= (($signed(wire146[(2'h2):(2'h2)]) ?
                  (-$unsigned((~reg177))) : ($signed($signed(reg162)) ?
                      $signed($unsigned(reg164)) : (reg165[(3'h7):(1'h0)] * (~^reg165)))) ^~ reg176);
            end
          else
            begin
              reg169 <= (({(reg171[(5'h15):(4'h8)] ?
                      $unsigned(reg162) : (reg171 ?
                          reg155 : reg160))} - {reg172[(2'h3):(2'h2)],
                  ((reg173 ?
                      wire149 : reg168) + $unsigned(reg164))}) <= wire150);
              reg170 <= ((~&$signed((wire153[(1'h1):(1'h0)] - (8'hb1)))) >>> (8'had));
              reg171 <= reg157;
            end
          reg173 <= (!reg155);
          reg174 <= reg168;
        end
      reg178 <= (((wire150 ? (~(~^reg167)) : reg158) ~^ (~^(wire150 ?
          ((8'hb1) >= reg175) : (reg177 ?
              (7'h42) : (8'ha2))))) >= $unsigned($unsigned((8'hb8))));
    end
  assign wire179 = wire153;
  assign wire180 = ((((-reg155[(2'h3):(2'h2)]) >>> ($signed(reg170) ?
                           ((8'hb9) >> wire146) : (wire150 * reg167))) ?
                       reg162 : (^reg171[(2'h2):(1'h1)])) * {$signed((wire147 ?
                           {reg156, wire149} : (reg163 ? wire151 : reg159)))});
  assign wire181 = reg160;
  assign wire182 = reg165[(3'h6):(1'h1)];
  assign wire183 = reg162[(4'h9):(1'h1)];
  assign wire184 = $unsigned((8'ha4));
  assign wire185 = $unsigned((wire151 << (-(^~$unsigned(wire152)))));
  assign wire186 = (8'hbb);
  assign wire187 = reg161;
  assign wire188 = $signed(((~(+reg161)) - (8'hb5)));
  assign wire189 = reg159;
  assign wire190 = reg174;
  assign wire191 = reg160;
  assign wire192 = ((reg174[(3'h4):(2'h3)] * $signed(((wire147 > reg176) ?
                       $unsigned((8'ha9)) : {wire148}))) ^~ (+$unsigned($signed((8'hae)))));
  assign wire193 = (~&(wire187[(4'hb):(4'hb)] ?
                       wire183[(1'h0):(1'h0)] : wire181));
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire92;
  input wire signed [(4'hd):(1'h0)] wire91;
  input wire signed [(2'h2):(1'h0)] wire90;
  input wire [(4'h9):(1'h0)] wire89;
  input wire signed [(4'hd):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire121;
  wire signed [(3'h7):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire93;
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire93,
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
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire93 = ($signed(($signed((wire89 ?
                          wire88 : wire90)) ~^ ((wire91 != wire90) ?
                          (-wire90) : (&wire89)))) ?
                      ({$signed((~|(8'hb3))),
                          wire88} + $signed((^wire88[(2'h3):(1'h0)]))) : wire90);
  always
    @(posedge clk) begin
      reg94 <= wire91[(3'h5):(2'h2)];
      reg95 <= ($signed(reg94) | wire90[(1'h1):(1'h1)]);
    end
  assign wire96 = ((^~((~(wire88 >> wire88)) ?
                          wire90 : (wire92[(2'h3):(2'h3)] ?
                              (reg95 < wire93) : wire92))) ?
                      (&wire92) : (wire88[(3'h5):(3'h5)] - reg94[(2'h3):(1'h1)]));
  assign wire97 = wire92;
  assign wire98 = reg95;
  assign wire99 = wire97[(1'h0):(1'h0)];
  assign wire100 = (wire93[(3'h4):(3'h4)] >>> $unsigned($signed(((reg94 ?
                           (8'hb8) : wire96) ?
                       ((8'haa) ? reg94 : wire98) : $signed(reg94)))));
  assign wire101 = $signed(wire89);
  always
    @(posedge clk) begin
      reg102 <= ((^(8'hb8)) >= wire90[(1'h1):(1'h0)]);
      reg103 <= (-$signed((({wire90} ?
              ((8'had) ? (8'h9f) : wire99) : (wire93 ? (8'hbf) : wire99)) ?
          $signed((reg102 ?
              wire91 : (8'hb3))) : ($unsigned(wire101) && reg94))));
      if (wire88[(3'h7):(1'h0)])
        begin
          reg104 <= (({(wire101 ? (wire97 | reg95) : $unsigned((8'haf))),
                  $unsigned((wire99 ? (8'had) : wire99))} ?
              ($signed($unsigned(reg94)) & $unsigned((wire98 ?
                  wire92 : wire90))) : (wire97 ^ (~^reg103))) << wire96);
          reg105 <= (^wire93[(4'hf):(3'h4)]);
          reg106 <= (~|(!wire92));
        end
      else
        begin
          if ((wire89 ?
              ({($unsigned(wire92) ?
                          (-reg106) : (wire89 ? (8'hb9) : (7'h41)))} ?
                  $signed($signed({(8'hbb),
                      wire97})) : {reg103}) : reg102[(3'h6):(1'h0)]))
            begin
              reg104 <= ($signed((wire101 ?
                  (~&(wire90 ?
                      wire88 : wire90)) : ($unsigned((7'h44)) < (wire101 ?
                      reg104 : reg103)))) > reg94[(4'hb):(1'h1)]);
              reg105 <= $signed(wire100[(1'h1):(1'h0)]);
            end
          else
            begin
              reg104 <= {wire97,
                  ((^((reg106 ?
                      wire101 : wire90) ^~ reg95[(1'h0):(1'h0)])) <<< reg104[(3'h6):(3'h6)])};
            end
          if ((~&wire93[(3'h4):(1'h0)]))
            begin
              reg106 <= wire97;
            end
          else
            begin
              reg106 <= $unsigned($unsigned($signed(wire96[(1'h1):(1'h1)])));
              reg107 <= (wire93 ?
                  (~^(^reg106)) : $signed($unsigned($signed(((8'hbf) < reg106)))));
              reg108 <= (wire91[(4'hd):(2'h2)] ?
                  wire100[(3'h4):(2'h2)] : {wire99, reg104});
              reg109 <= (wire99 ? wire91[(4'hc):(3'h6)] : reg102);
            end
        end
      reg110 <= wire99[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg111 <= $signed($unsigned((-{$signed(reg102)})));
      reg112 <= wire97[(2'h2):(1'h0)];
      reg113 <= $unsigned($unsigned($unsigned($signed((wire89 & reg112)))));
      reg114 <= $unsigned(reg106[(2'h3):(2'h3)]);
      reg115 <= (($signed(reg106[(1'h0):(1'h0)]) ?
              {$signed(wire97),
                  $signed((reg111 > reg111))} : (~&(-reg109[(3'h5):(2'h3)]))) ?
          $unsigned(reg107) : (^~{$unsigned($signed(reg102))}));
    end
  assign wire116 = ($unsigned(((-$signed(wire96)) ?
                           (~wire99[(3'h7):(2'h2)]) : reg115)) ?
                       reg108 : ($signed(wire92) ?
                           $unsigned((~$unsigned(wire90))) : ((&wire96) ?
                               wire101[(3'h5):(3'h4)] : ((8'haf) > (reg106 ?
                                   wire88 : reg94)))));
  assign wire117 = ((8'hbb) + ($unsigned((8'ha0)) ?
                       (8'hb1) : ({$signed(wire93), wire89} ?
                           $signed((wire97 ?
                               wire97 : reg95)) : $signed((^wire88)))));
  assign wire118 = $signed(((wire116[(4'h9):(3'h4)] ?
                           {$signed(reg112)} : $unsigned((~^reg112))) ?
                       (~^$unsigned({reg104,
                           wire91})) : $unsigned(reg108[(4'hc):(2'h2)])));
  assign wire119 = $unsigned(reg115);
  assign wire120 = (reg112[(5'h12):(4'h8)] >>> $signed((((wire117 >= wire118) ?
                           $signed(wire92) : $signed(reg113)) ?
                       $signed((reg112 ?
                           reg104 : reg114)) : (~reg111[(2'h3):(1'h1)]))));
  assign wire121 = wire93[(4'h9):(3'h7)];
  assign wire122 = ((!wire101[(3'h5):(2'h3)]) ^ $signed(wire96));
endmodule

module module30
#(parameter param81 = (((~((8'ha2) ? (^(8'hae)) : (^(8'hae)))) ? (((&(8'h9e)) <<< (-(8'hb1))) ^ {((8'hb7) ? (8'had) : (8'hb6)), ((7'h43) ? (8'hba) : (8'hac))}) : (+(((8'ha6) ? (8'h9f) : (8'hb3)) < ((8'hbe) ? (8'hbf) : (8'hb4))))) ? (((^(+(8'hac))) ? (8'hbb) : ((|(8'haf)) ? ((8'ha0) ? (8'h9d) : (8'hbf)) : ((8'ha9) ? (8'ha6) : (8'hb9)))) < (!((-(8'h9c)) ? (~(8'hb9)) : (|(8'hb6))))) : (((~|(~|(8'hb8))) && ((|(7'h44)) ? (!(8'hbd)) : (~|(7'h43)))) ? {{{(8'hb5)}}} : (!((^~(8'haf)) ? ((7'h43) ? (8'had) : (8'hb7)) : {(7'h41)})))), 
parameter param82 = param81)
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h23b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  input wire [(3'h4):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire74,
                 wire73,
                 wire61,
                 wire60,
                 wire59,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg76,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(((~wire34[(1'h1):(1'h1)]) != (+((~wire33) & wire34[(2'h3):(1'h1)])))))
        begin
          if (wire34)
            begin
              reg35 <= ($signed(($signed(wire32[(2'h3):(1'h0)]) ^~ wire34)) * wire34);
              reg36 <= (~|($unsigned(reg35[(4'hd):(4'hd)]) ?
                  $unsigned(((~wire31) ^ reg35[(2'h2):(2'h2)])) : $signed(wire33[(1'h0):(1'h0)])));
              reg37 <= $signed($unsigned(wire34[(3'h4):(2'h3)]));
            end
          else
            begin
              reg35 <= (wire31[(1'h0):(1'h0)] ^ wire32);
              reg36 <= $unsigned(wire31[(4'hc):(4'h9)]);
              reg37 <= ({$unsigned($unsigned((wire32 ?
                      reg35 : (8'ha9))))} | ((wire33[(2'h3):(1'h0)] ?
                  wire33 : ((wire31 << wire33) ?
                      (~&reg36) : (wire32 <<< (8'ha7)))) == wire33[(1'h0):(1'h0)]));
              reg38 <= (((wire31[(1'h0):(1'h0)] == reg35) ?
                      reg36 : $unsigned((8'ha1))) ?
                  (reg36 ?
                      $unsigned((wire33[(1'h1):(1'h1)] == $unsigned(wire34))) : $unsigned(wire31)) : (wire34 ?
                      $signed($signed(wire31)) : ((((8'h9d) ? (8'hac) : reg37) ?
                              (wire34 >>> wire33) : wire32[(1'h0):(1'h0)]) ?
                          $signed($signed((8'hbd))) : (wire33[(2'h3):(2'h3)] ?
                              $signed(wire33) : wire34))));
              reg39 <= ((-reg37) ?
                  (~&$unsigned((reg35 || reg37))) : $signed({$unsigned((reg37 ?
                          reg38 : wire33))}));
            end
          reg40 <= wire31;
          reg41 <= $unsigned(wire31);
        end
      else
        begin
          if ({$signed(wire31), (7'h43)})
            begin
              reg35 <= {reg38};
              reg36 <= (|$unsigned(wire33[(2'h3):(2'h2)]));
              reg37 <= reg41[(5'h12):(4'ha)];
            end
          else
            begin
              reg35 <= (($unsigned(wire31[(4'hb):(4'h9)]) || $unsigned($unsigned($signed((8'hab))))) == (reg38[(5'h11):(3'h7)] >= $unsigned((~^reg36))));
              reg36 <= {$unsigned(((((8'hb8) ? reg35 : reg38) ?
                          (~^wire32) : {wire32}) ?
                      reg35[(3'h6):(3'h5)] : ((wire32 ? reg41 : reg37) ?
                          {wire34} : $signed(reg41)))),
                  (8'ha8)};
              reg37 <= (^~($signed(reg40[(2'h2):(1'h0)]) ^ (reg40[(2'h2):(2'h2)] ?
                  $signed(wire34[(1'h0):(1'h0)]) : ((-(8'hbe)) && (8'h9f)))));
              reg38 <= $signed(reg36);
            end
        end
      reg42 <= reg36;
      reg43 <= $unsigned($unsigned($signed(((~|reg35) ?
          (^~reg38) : {wire31, (8'hbd)}))));
      reg44 <= reg36;
    end
  assign wire45 = (7'h43);
  assign wire46 = (($unsigned(reg43) ?
                      ((^~(reg38 ? (8'hbe) : (8'ha4))) ?
                          (reg40 | reg38) : ((+wire33) ?
                              (reg40 >>> wire45) : {(8'hb1),
                                  reg44})) : ((wire31[(4'h9):(4'h8)] ?
                              (~|(8'ha4)) : (reg40 ? reg42 : reg38)) ?
                          $unsigned($unsigned(reg44)) : wire32)) - {(reg43[(3'h5):(1'h0)] + $unsigned((reg43 ?
                          (7'h43) : wire33)))});
  assign wire47 = (8'hb3);
  assign wire48 = $signed(wire34);
  assign wire49 = (reg41[(2'h3):(2'h2)] ?
                      ($signed(($signed((8'ha5)) | $unsigned(reg40))) ?
                          {(reg42[(1'h1):(1'h1)] ?
                                  $unsigned(wire47) : reg36[(4'h8):(2'h2)]),
                              (8'hbf)} : ({(reg35 && wire46)} <<< $signed($signed(reg42)))) : reg35[(4'hc):(4'hb)]);
  assign wire50 = $unsigned(wire48);
  assign wire51 = wire47;
  assign wire52 = wire48[(1'h1):(1'h0)];
  assign wire53 = (wire49[(2'h2):(1'h1)] ?
                      {(reg35 ?
                              ((reg44 ? reg36 : (8'ha4)) - ((8'ha2) ?
                                  wire34 : wire45)) : $unsigned(reg36[(5'h10):(4'h9)]))} : (^($unsigned(wire33) ?
                          ((wire34 ?
                              wire52 : (8'ha8)) ^~ (!reg36)) : wire50[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg54 <= $unsigned(reg37[(3'h6):(2'h3)]);
      reg55 <= $unsigned((reg40[(1'h1):(1'h1)] ?
          wire45[(1'h1):(1'h0)] : (((wire50 ~^ reg37) == $signed(reg35)) ?
              reg36 : reg35[(4'he):(4'hd)])));
      reg56 <= ((($signed($unsigned((8'haf))) ?
                  ($unsigned(reg36) ?
                      wire46[(1'h1):(1'h0)] : $signed(reg43)) : reg54) ?
              $unsigned({$signed(wire49)}) : wire46) ?
          (~|(((wire48 ? wire51 : wire51) - (wire48 ?
              reg38 : reg43)) <= $signed((wire49 != wire32)))) : $signed(($signed($unsigned(reg36)) <= {reg40[(1'h1):(1'h0)],
              (wire50 < wire50)})));
      reg57 <= (!(reg35[(4'hc):(1'h1)] ?
          wire34 : ({{wire52}, wire31} ?
              reg55[(3'h5):(2'h3)] : (-wire46[(1'h0):(1'h0)]))));
      reg58 <= (($signed(reg54) ?
          (!reg54) : (~^$signed($unsigned(reg38)))) != (wire51[(3'h6):(2'h3)] ?
          $unsigned(($unsigned(reg56) ~^ $unsigned(reg42))) : ((wire50[(1'h1):(1'h0)] ?
              {wire31, reg38} : (8'hbe)) > {reg57[(2'h2):(1'h1)]})));
    end
  assign wire59 = {(8'hb4)};
  assign wire60 = $signed((wire47[(3'h4):(2'h2)] ?
                      ({(-reg55)} - (~&$signed(reg55))) : (~^reg37[(2'h3):(1'h0)])));
  assign wire61 = reg58[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if (({(~&({reg42, (7'h41)} & (reg40 >>> (8'h9f)))), $signed(reg36)} ?
          (reg42 ?
              wire45[(4'hd):(4'ha)] : {wire51[(5'h13):(4'hc)]}) : ((reg37 ^ ((8'hac) ^ $signed(reg41))) ?
              $signed((-wire49)) : reg43[(1'h0):(1'h0)])))
        begin
          reg62 <= ((&$unsigned(reg41[(5'h12):(4'ha)])) ?
              (!{{$unsigned(reg57),
                      (+reg54)}}) : (wire51 == $unsigned(wire46)));
          reg63 <= $signed($unsigned((wire31[(3'h7):(3'h6)] ?
              wire61 : (wire46[(1'h1):(1'h0)] ?
                  (reg55 || reg58) : (wire47 ? wire59 : wire45)))));
        end
      else
        begin
          reg62 <= reg56;
          if (wire34)
            begin
              reg63 <= wire32;
              reg64 <= (+(8'hb3));
            end
          else
            begin
              reg63 <= $unsigned((wire46 ? wire31 : $unsigned(reg56)));
              reg64 <= $signed($signed($signed($signed($unsigned(wire34)))));
              reg65 <= $unsigned(wire33[(2'h3):(2'h2)]);
            end
          reg66 <= $unsigned(wire52[(5'h14):(5'h10)]);
          reg67 <= $unsigned({$unsigned($unsigned($unsigned(wire59))),
              (~&$signed($signed(reg35)))});
          reg68 <= (wire46 < $unsigned((~^$signed($signed(wire45)))));
        end
      reg69 <= $signed(wire47);
      reg70 <= wire52;
      reg71 <= (reg36 ?
          {{$signed({wire45, wire47})}} : $unsigned($unsigned(reg57)));
      reg72 <= $unsigned(reg65[(4'ha):(3'h4)]);
    end
  assign wire73 = (reg43[(5'h13):(3'h4)] * ($signed(wire47[(1'h0):(1'h0)]) ^~ (!(8'h9e))));
  assign wire74 = (8'ha8);
  assign wire75 = (&$unsigned($signed((^~$signed(reg44)))));
  always
    @(posedge clk) begin
      reg76 <= (($signed((wire47 + $signed((8'hb9)))) != (!{$unsigned(reg70),
              reg42})) ?
          (!($unsigned(wire46) & $signed(reg43[(4'hf):(3'h4)]))) : (8'ha2));
    end
  assign wire77 = (+{($unsigned(((7'h42) ? reg76 : reg72)) ?
                          (reg57[(4'ha):(4'h8)] << $signed(wire53)) : {(~^wire73),
                              ((8'ha6) ? reg58 : reg55)})});
  assign wire78 = ((({reg64[(1'h0):(1'h0)],
                          $unsigned(reg58)} | ($signed(reg63) != $unsigned(reg35))) ?
                      ({reg42} & (-$unsigned(reg37))) : reg44) > {(((&wire52) ?
                          $signed((8'hb4)) : $signed(wire48)) == (!(reg76 <= wire53))),
                      (wire45 ?
                          $signed((8'hbe)) : (~^(reg65 ? wire73 : reg40)))});
  assign wire79 = (!reg40[(2'h3):(1'h0)]);
  assign wire80 = $unsigned({reg41[(4'hb):(3'h5)], wire60[(3'h7):(2'h3)]});
endmodule
