module top
#(parameter param210 = (^(-(({(8'haa)} < (+(8'ha7))) <<< (~(|(8'ha3)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire208;
  wire [(5'h12):(1'h0)] wire207;
  wire signed [(5'h13):(1'h0)] wire206;
  wire [(5'h13):(1'h0)] wire205;
  wire [(4'hb):(1'h0)] wire197;
  wire signed [(4'hf):(1'h0)] wire195;
  wire [(4'hf):(1'h0)] wire194;
  wire [(5'h13):(1'h0)] wire193;
  wire [(5'h12):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire190;
  reg signed [(5'h15):(1'h0)] reg204 = (1'h0);
  reg [(2'h3):(1'h0)] reg203 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg200 = (1'h0);
  reg [(5'h11):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg196 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire197,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire81,
                 wire83,
                 wire190,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg196,
                 (1'h0)};
  module4 #() modinst82 (wire81, clk, wire2, wire1, wire3, wire0);
  assign wire83 = ((~$signed(({wire0, wire81} < {wire2, wire3}))) ?
                      wire1[(2'h3):(1'h1)] : ((((wire2 ? wire2 : (8'ha9)) ?
                              (wire81 ? wire0 : wire2) : (wire1 ?
                                  (8'ha1) : (8'hb1))) <= (&wire2)) ?
                          ({(~&wire0),
                              wire0} >> {(wire1 < wire81)}) : (&(^~wire0))));
  module84 #() modinst191 (wire190, clk, wire3, wire0, wire2, wire1, wire81);
  assign wire192 = wire81[(4'ha):(3'h7)];
  assign wire193 = ((^~(wire1 != ((wire83 >>> wire190) ?
                           (~wire192) : {wire0}))) ?
                       $signed($signed($unsigned((~|wire0)))) : (((~&wire0[(4'hd):(1'h0)]) ?
                           $signed((!wire2)) : $signed(wire81[(1'h0):(1'h0)])) >>> (wire192 << wire3[(3'h7):(3'h5)])));
  assign wire194 = wire0[(4'hb):(2'h3)];
  assign wire195 = wire190[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg196 <= $unsigned($unsigned(wire193));
    end
  assign wire197 = wire192;
  always
    @(posedge clk) begin
      reg198 <= wire0[(4'hf):(3'h5)];
      reg199 <= (~^(($signed($unsigned(wire192)) ?
              $unsigned($unsigned(wire193)) : (^~(wire83 | wire194))) ?
          wire192 : (~^{$signed(wire190)})));
      reg200 <= $unsigned(((wire81 ?
              (~(~^wire193)) : ($unsigned(reg198) ?
                  (wire83 != reg199) : (reg199 ^~ wire197))) ?
          $unsigned(($signed(reg196) ?
              (^wire190) : {reg199})) : {wire2[(4'ha):(3'h6)],
              (reg198 - (wire190 ? reg198 : (7'h42)))}));
      reg201 <= (8'haf);
      reg202 <= $unsigned(({wire2[(3'h7):(3'h6)], (^~$signed(reg201))} ?
          $signed(wire81[(4'hd):(4'ha)]) : $unsigned((~^(-reg201)))));
    end
  always
    @(posedge clk) begin
      reg203 <= ({$unsigned(wire194[(4'h8):(1'h1)]),
              (wire0 ? reg196[(4'hf):(1'h1)] : (reg201 << (|wire2)))} ?
          wire83[(4'hc):(4'hc)] : ({$unsigned(reg196[(3'h7):(2'h3)])} ?
              (!$signed($unsigned((8'ha7)))) : ((wire81 && (reg196 ^ wire197)) & wire0)));
      reg204 <= reg196;
    end
  assign wire205 = (^~((wire190 == ({reg198} ? $signed(reg204) : reg203)) ?
                       (({wire193, wire197} | (wire192 ? wire83 : wire2)) ?
                           wire81[(1'h1):(1'h1)] : (8'ha1)) : $unsigned({wire195[(3'h4):(1'h0)]})));
  assign wire206 = ((|(~{(wire83 ? reg198 : (8'hb5)), (wire83 < wire81)})) ?
                       $signed($unsigned(($signed((8'hae)) ^~ wire193))) : $unsigned($signed($unsigned((~|(8'hae))))));
  assign wire207 = wire81;
  module21 #() modinst209 (wire208, clk, reg199, wire1, wire206, reg200);
endmodule

module module84  (y, clk, wire85, wire86, wire87, wire88, wire89);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire85;
  input wire [(5'h15):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire signed [(5'h14):(1'h0)] wire88;
  input wire [(4'hf):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire189;
  wire [(4'hb):(1'h0)] wire188;
  wire signed [(4'hb):(1'h0)] wire187;
  wire [(3'h6):(1'h0)] wire186;
  wire signed [(5'h12):(1'h0)] wire185;
  wire signed [(3'h6):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire182;
  wire [(4'hb):(1'h0)] wire116;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire114;
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire182,
                 wire116,
                 wire90,
                 wire91,
                 wire92,
                 wire114,
                 (1'h0)};
  assign wire90 = (8'ha8);
  assign wire91 = (~&wire85[(5'h10):(3'h7)]);
  assign wire92 = $signed((wire86[(3'h6):(1'h0)] ^ (~|{wire85, (+wire85)})));
  module93 #() modinst115 (wire114, clk, wire85, wire87, wire92, wire91, wire88);
  assign wire116 = $signed(({$signed((wire88 ? wire89 : wire89))} ?
                       (((wire85 ~^ wire86) ^ $unsigned(wire92)) ?
                           ({wire89,
                               (8'hb9)} ^~ wire114) : wire91[(3'h6):(3'h4)]) : $unsigned((&wire114[(3'h5):(3'h5)]))));
  module117 #() modinst183 (wire182, clk, wire89, wire87, wire90, wire86);
  assign wire184 = (-($unsigned({wire182, wire116[(4'h9):(2'h3)]}) ?
                       $unsigned({$unsigned((8'ha7)),
                           ((8'hab) & wire86)}) : (~^$signed(wire85))));
  assign wire185 = wire85[(4'hd):(3'h6)];
  assign wire186 = wire90;
  assign wire187 = wire182;
  assign wire188 = (^wire88[(4'he):(2'h2)]);
  assign wire189 = wire185[(4'hd):(4'hd)];
endmodule

module module4
#(parameter param79 = (^~((((&(8'h9d)) >= ((8'hb9) | (8'hac))) ? {((8'hae) ? (8'hbc) : (8'had)), (~^(8'h9f))} : (~&(~|(7'h42)))) >>> (~^(+{(8'hb4), (8'haa)})))), 
parameter param80 = (((param79 ? {param79, {(8'had)}} : ((&param79) ? (&(8'h9e)) : (param79 < (8'h9f)))) ? ((^~(8'ha8)) || ((param79 ? param79 : param79) & (param79 ? param79 : param79))) : ({(param79 ? param79 : param79), (param79 && param79)} ? ((&param79) ? (param79 == param79) : (~(7'h44))) : param79)) ^~ ((param79 || ({param79} ? {param79, (8'hae)} : (-(8'h9c)))) + (((param79 <<< param79) | (^param79)) ? (!param79) : param79))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire5;
  input wire [(4'h8):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(2'h2):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire76;
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire78,
                 wire9,
                 wire10,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire76,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire9 = (+$unsigned((8'h9d)));
  assign wire10 = wire5;
  always
    @(posedge clk) begin
      reg11 <= (($signed({wire9[(3'h5):(3'h4)], $unsigned((8'hb8))}) ?
          ((((8'h9d) ? wire10 : wire10) ?
                  (wire7 ? wire8 : wire10) : wire7[(4'hc):(2'h2)]) ?
              $unsigned((wire8 ^~ wire5)) : wire10[(5'h12):(2'h2)]) : $unsigned((((7'h43) ?
                  wire8 : wire8) ?
              (wire9 ?
                  (8'hac) : wire6) : {wire6}))) >>> $unsigned($unsigned(wire10[(5'h13):(4'hf)])));
    end
  always
    @(posedge clk) begin
      reg12 <= $unsigned((($signed($unsigned(wire5)) >> reg11[(1'h0):(1'h0)]) ?
          wire6 : (8'hae)));
      reg13 <= reg12;
    end
  assign wire14 = (reg11 - wire9[(2'h2):(1'h1)]);
  assign wire15 = $signed(($unsigned(reg11) ?
                      wire5[(3'h7):(3'h6)] : (~&{(wire9 != reg11),
                          $unsigned(wire8)})));
  assign wire16 = {reg11[(1'h0):(1'h0)]};
  assign wire17 = (((wire15 <<< $unsigned($signed(wire7))) ?
                          $unsigned((wire6[(1'h0):(1'h0)] > wire5[(4'h8):(4'h8)])) : (wire7 <<< wire10)) ?
                      wire14 : wire16);
  assign wire18 = $signed(wire14);
  assign wire19 = (wire7[(4'h9):(4'h8)] >>> $signed($unsigned($unsigned(wire16))));
  assign wire20 = ($signed(wire18) ?
                      (^(~(~&wire5))) : (($signed(wire15) <<< (reg12 ?
                          wire15 : (8'had))) > $unsigned({$unsigned((8'ha0)),
                          $signed(reg12)})));
  module21 #() modinst77 (.wire22(reg11), .clk(clk), .wire24(wire16), .wire25(wire9), .y(wire76), .wire23(wire10));
  assign wire78 = {$signed(wire10), wire7};
endmodule

module module21
#(parameter param74 = (8'hb2), 
parameter param75 = param74)
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg73,
                 reg72,
                 reg71,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire22[(2'h3):(2'h3)])
        begin
          reg26 <= (wire22 ?
              {$signed((~^(wire22 < wire23)))} : wire23[(1'h0):(1'h0)]);
          reg27 <= $signed(wire23);
          if ($signed(wire25[(3'h6):(1'h0)]))
            begin
              reg28 <= $signed({$signed((wire25 << {reg26, reg26})),
                  ($signed((wire25 * (8'ha5))) ?
                      $unsigned((~|wire24)) : {wire25[(4'h8):(4'h8)],
                          $signed(wire25)})});
              reg29 <= {$unsigned(wire23), (~|$signed($unsigned(wire23)))};
              reg30 <= (wire24 ?
                  {(|$signed({reg29, (8'hb7)})),
                      wire25[(3'h5):(1'h0)]} : wire24[(4'hb):(4'h8)]);
              reg31 <= reg29;
              reg32 <= (8'hb5);
            end
          else
            begin
              reg28 <= wire23;
              reg29 <= reg27[(1'h0):(1'h0)];
              reg30 <= reg27[(3'h7):(1'h0)];
            end
          reg33 <= (reg27 >> ((wire25[(3'h6):(3'h5)] ?
              $unsigned($signed(reg26)) : {(reg26 >>> wire23),
                  $unsigned(reg28)}) >>> ((-(reg30 == reg26)) || $signed({wire23}))));
        end
      else
        begin
          reg26 <= reg28[(3'h5):(3'h4)];
          reg27 <= (((+wire24) ?
              $signed(wire24[(5'h10):(4'hd)]) : wire24[(4'h8):(3'h5)]) == ((wire25 ?
                  $signed($signed(reg30)) : reg32) ?
              reg31 : reg30));
        end
      if (reg32)
        begin
          reg34 <= wire22;
          reg35 <= wire22;
        end
      else
        begin
          reg34 <= $signed(($signed(reg30[(1'h0):(1'h0)]) >> (~|$unsigned($signed(reg26)))));
        end
      if ($signed(reg26[(4'h9):(4'h8)]))
        begin
          reg36 <= (reg27[(2'h2):(2'h2)] ?
              ($signed({$unsigned(wire24), $signed(reg28)}) ?
                  (reg32 - ((^reg27) ?
                      (wire24 ^ reg26) : (reg29 ^~ reg33))) : $signed({$signed(reg31),
                      (reg30 || reg35)})) : $signed(wire22[(1'h0):(1'h0)]));
        end
      else
        begin
          reg36 <= reg27[(2'h3):(2'h2)];
          if (($signed($signed(reg28[(1'h1):(1'h1)])) & (!(|reg32))))
            begin
              reg37 <= $signed((($signed((reg30 <= reg33)) ?
                      reg34 : $signed($signed(wire23))) ?
                  $signed(((|reg32) && reg34[(3'h7):(3'h7)])) : (^(&reg33))));
              reg38 <= (~{(8'hbf)});
              reg39 <= {$signed(wire23[(4'hf):(4'ha)]),
                  (reg29[(1'h0):(1'h0)] && (^~($signed(wire22) == (^wire24))))};
              reg40 <= (-reg37);
            end
          else
            begin
              reg37 <= $unsigned({((-$signed((8'hbb))) << $unsigned($signed(wire23)))});
              reg38 <= reg33[(1'h1):(1'h0)];
            end
          reg41 <= ((reg40[(2'h2):(1'h0)] - {reg34, $unsigned(reg39)}) ?
              reg33 : ((8'hb2) ?
                  wire23[(2'h2):(2'h2)] : ((reg33[(5'h10):(4'ha)] ?
                      $unsigned((8'hbc)) : $signed(reg26)) ^~ (+wire24))));
        end
      reg42 <= reg39;
      if ((($unsigned(reg29) && reg41) | reg29))
        begin
          reg43 <= (reg42[(3'h6):(1'h1)] ? reg28 : reg37[(4'he):(4'he)]);
          reg44 <= (+{(^~((~wire24) ?
                  reg40[(2'h3):(2'h3)] : $unsigned(reg40)))});
          if (reg39)
            begin
              reg45 <= $signed({({(8'hbe)} <= (reg42[(2'h2):(2'h2)] ?
                      $unsigned((7'h44)) : reg41[(2'h3):(1'h0)])),
                  $signed((reg41[(1'h1):(1'h0)] ?
                      (reg30 >> reg42) : $unsigned(wire25)))});
              reg46 <= reg35;
              reg47 <= reg40;
              reg48 <= $unsigned(({(reg34 != $unsigned((8'ha1)))} != {wire25[(2'h2):(1'h0)]}));
              reg49 <= {(reg44 & $unsigned({(reg34 ^ reg29)}))};
            end
          else
            begin
              reg45 <= reg42[(1'h0):(1'h0)];
              reg46 <= {reg28[(3'h4):(1'h0)], $unsigned(wire22)};
              reg47 <= {{$signed((7'h43)),
                      (reg31[(2'h3):(1'h0)] ? reg41 : $unsigned(reg39))}};
              reg48 <= $signed(reg28[(2'h2):(1'h0)]);
            end
          reg50 <= $signed(($unsigned($signed((&reg34))) ?
              (reg49 ~^ $signed(reg46[(1'h1):(1'h1)])) : reg47));
        end
      else
        begin
          if (reg47[(3'h5):(2'h2)])
            begin
              reg43 <= wire23;
              reg44 <= (wire23[(3'h6):(1'h0)] ~^ (|((~^(reg32 < (8'haf))) ?
                  ($unsigned(reg28) ?
                      {reg46, wire24} : {reg47,
                          (7'h41)}) : $signed((wire22 + (7'h40))))));
            end
          else
            begin
              reg43 <= ($unsigned((((~|reg37) ? $unsigned(reg35) : reg37) ?
                      $unsigned((^~reg41)) : ((wire24 > reg46) ?
                          $signed(reg49) : $unsigned((8'haa))))) ?
                  (($unsigned({reg40,
                      reg38}) | (8'hbc)) >> reg36) : $unsigned(((~(reg49 ?
                          wire23 : reg44)) ?
                      reg27[(4'he):(4'h9)] : reg30[(4'ha):(1'h0)])));
              reg44 <= ((reg43 ? $signed(wire24[(2'h2):(1'h1)]) : (8'hbd)) ?
                  ({(|(|(7'h44))),
                      ((reg42 ? (8'ha8) : reg40) ?
                          (reg26 < reg46) : (reg49 ?
                              reg39 : reg41))} == $signed(reg38)) : (wire24[(5'h10):(3'h6)] ?
                      reg31[(2'h2):(1'h1)] : {($signed((8'hb0)) ?
                              reg47 : $signed(reg41)),
                          (+(reg38 > reg29))}));
            end
          if ((((wire24 ? wire22 : $signed($unsigned(reg35))) ?
              reg48[(2'h2):(1'h0)] : (|reg42)) <= (&wire24[(1'h0):(1'h0)])))
            begin
              reg45 <= {(~^(|reg39)),
                  (-(((wire25 ? reg35 : (8'ha2)) ?
                      wire23 : ((8'hac) ?
                          reg41 : reg46)) ^ ($unsigned((7'h43)) ?
                      ((8'hb0) ? (8'ha0) : wire22) : reg50[(2'h3):(2'h2)])))};
              reg46 <= ($signed(((^(|reg32)) ?
                      (&reg33[(2'h3):(2'h2)]) : $signed($unsigned(reg29)))) ?
                  $signed(reg40[(2'h3):(2'h3)]) : ($signed((reg35[(2'h2):(1'h1)] ?
                      (reg41 ? reg35 : (8'hbf)) : (reg37 ?
                          reg50 : reg37))) != $signed($signed((reg37 ~^ reg44)))));
            end
          else
            begin
              reg45 <= (reg27[(1'h1):(1'h0)] | $unsigned($signed({reg40})));
            end
          if ((-{$unsigned(reg50), (reg30 << (&(reg44 ~^ reg48)))}))
            begin
              reg47 <= (!$unsigned(((8'haf) ?
                  $unsigned(wire22) : reg41[(3'h4):(3'h4)])));
              reg48 <= (-$unsigned(reg27[(1'h0):(1'h0)]));
              reg49 <= $signed(wire22[(3'h7):(3'h4)]);
              reg50 <= $signed(reg50);
            end
          else
            begin
              reg47 <= $signed((~|reg30));
              reg48 <= $signed(($unsigned(reg28) >> ((+$unsigned(reg45)) ?
                  reg27 : wire23[(1'h0):(1'h0)])));
              reg49 <= reg27;
              reg50 <= $signed(((~|(8'hb4)) ? wire23 : reg34));
              reg51 <= $unsigned(((|$unsigned($unsigned(reg28))) >>> ((~$signed((7'h41))) ?
                  reg31 : ((+(8'ha0)) ? wire25[(1'h0):(1'h0)] : reg48))));
            end
        end
    end
  assign wire52 = reg38;
  assign wire53 = reg48[(4'ha):(1'h0)];
  assign wire54 = reg45;
  assign wire55 = (~^reg37);
  always
    @(posedge clk) begin
      if ((reg51 <= ((~&$unsigned($unsigned((8'ha4)))) <= reg38[(5'h11):(3'h7)])))
        begin
          reg56 <= (^$signed($signed($signed(((8'ha7) ? wire25 : wire53)))));
          reg57 <= (8'hb9);
          reg58 <= {(wire55[(3'h6):(2'h2)] ?
                  {(reg46[(4'h9):(4'h9)] + reg44[(4'h9):(3'h7)])} : (8'hba))};
        end
      else
        begin
          reg56 <= {(reg43 | (((reg46 ?
                      wire22 : (8'ha2)) ~^ $unsigned(wire25)) ?
                  $signed(wire22) : (&reg36[(3'h4):(1'h0)]))),
              reg50};
        end
    end
  always
    @(posedge clk) begin
      reg59 <= $signed($signed($signed($signed($unsigned(reg56)))));
    end
  assign wire60 = $unsigned(reg58);
  assign wire61 = ($signed({($signed((7'h44)) ^~ (wire60 >>> wire52))}) >> $unsigned({(8'haa),
                      wire24}));
  assign wire62 = (reg42[(1'h0):(1'h0)] ?
                      (~{{{reg38, reg56}, $signed(reg58)},
                          $signed(reg42[(1'h0):(1'h0)])}) : {reg59[(4'h8):(3'h5)]});
  assign wire63 = ((((8'hb2) ?
                              $unsigned(reg45[(4'hc):(3'h4)]) : reg58[(2'h3):(1'h0)]) ?
                          reg26 : (~reg59)) ?
                      $signed(reg48) : {($signed(reg39) ?
                              ($signed(wire22) ?
                                  ((7'h41) ?
                                      (8'hb4) : wire52) : $signed(reg59)) : reg39[(2'h3):(2'h2)])});
  assign wire64 = ($signed($signed(reg57)) | reg29[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg65 <= wire60;
      reg66 <= (($unsigned($signed((reg41 ? reg37 : wire54))) ?
          $unsigned(wire53) : {($unsigned(reg59) ?
                  $unsigned((8'ha6)) : (reg56 && wire64))}) & $signed(($signed(wire22) < reg43[(4'hb):(4'h9)])));
      reg67 <= $unsigned({(-$signed($unsigned(reg27))),
          $unsigned((|reg39[(2'h3):(1'h1)]))});
      reg68 <= (({reg49} || $signed($signed(reg42[(1'h1):(1'h1)]))) ?
          reg51[(3'h6):(2'h3)] : wire54);
    end
  assign wire69 = reg47[(3'h5):(3'h4)];
  assign wire70 = wire69;
  always
    @(posedge clk) begin
      reg71 <= reg32[(1'h0):(1'h0)];
      reg72 <= reg40;
      reg73 <= reg59;
    end
endmodule

module module117
#(parameter param180 = {((((~^(7'h43)) || ((8'ha2) ? (8'ha8) : (8'hb7))) ^~ ((+(8'hbc)) != ((8'hb7) ? (8'hbf) : (8'hb9)))) << ((((8'ha4) == (8'ha1)) <= ((7'h44) ? (7'h44) : (8'hb4))) ? (((8'h9f) <= (8'ha7)) ? {(8'hb2)} : (^(8'hab))) : ((-(7'h44)) | ((8'ha5) ? (8'hb1) : (8'hbc)))))}, 
parameter param181 = (param180 ? (^~(^~param180)) : (|param180)))
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h2c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire121;
  input wire [(4'ha):(1'h0)] wire120;
  input wire [(3'h7):(1'h0)] wire119;
  input wire signed [(5'h15):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire169;
  wire [(5'h11):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire148;
  wire [(2'h2):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire146;
  wire [(4'hd):(1'h0)] wire145;
  wire [(2'h3):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire137;
  wire [(5'h10):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire122;
  reg [(4'h8):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(2'h3):(1'h0)] reg173 = (1'h0);
  reg [(5'h13):(1'h0)] reg172 = (1'h0);
  reg [(5'h15):(1'h0)] reg171 = (1'h0);
  reg [(5'h12):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg162 = (1'h0);
  reg [(3'h4):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg [(4'hf):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  assign y = {wire169,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire142,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire122,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
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
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg143,
                 reg141,
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
                 (1'h0)};
  assign wire122 = (((!wire120) <= ((wire121 != $signed(wire119)) ?
                           (-$signed(wire118)) : (^(|wire120)))) ?
                       (~^$unsigned(wire119)) : $unsigned((~^(!$signed((8'hb3))))));
  always
    @(posedge clk) begin
      reg123 <= (^~((8'ha9) >> $signed(wire118[(4'ha):(3'h5)])));
      if ($signed(wire119))
        begin
          reg124 <= (((-$signed((|wire118))) ?
              wire118 : ((wire119 ?
                  $unsigned(reg123) : $unsigned(wire119)) < $signed(wire118[(4'h9):(4'h8)]))) > ($signed((^~(wire121 ^~ (8'hb8)))) ?
              wire118[(4'hb):(4'hb)] : (wire122[(5'h13):(4'hf)] != $signed(wire119))));
          reg125 <= (~^(^~wire122));
          reg126 <= (~^$signed((wire119 ?
              ((reg124 ^~ wire121) ? wire122 : (|wire118)) : {(wire119 ?
                      reg125 : reg123),
                  ((8'ha5) + reg125)})));
          if ((&wire120))
            begin
              reg127 <= reg123[(1'h1):(1'h1)];
              reg128 <= reg124;
              reg129 <= (($signed(wire120) ?
                  ({wire118[(2'h2):(1'h1)], (~&reg126)} ?
                      wire122[(5'h10):(4'h9)] : wire120) : reg123) * reg124[(3'h7):(2'h3)]);
              reg130 <= reg123[(2'h2):(1'h0)];
              reg131 <= (^wire119);
            end
          else
            begin
              reg127 <= $unsigned(((^$signed(reg128)) && ($signed((~|(8'hb2))) != reg128)));
              reg128 <= wire118;
              reg129 <= $signed(($signed($signed((wire120 ?
                  reg123 : wire122))) >= wire122));
              reg130 <= ($unsigned(wire118[(4'he):(1'h1)]) ?
                  $unsigned((-(~&(reg123 ? reg127 : reg128)))) : reg124);
              reg131 <= $signed(wire119[(3'h7):(3'h4)]);
            end
        end
      else
        begin
          reg124 <= ((!(&$unsigned(wire120))) == $signed($signed($signed(wire119))));
          reg125 <= $unsigned($unsigned($unsigned({(wire122 - wire121)})));
          reg126 <= ((wire119 + (&reg129)) && $unsigned((($unsigned((8'haa)) ^~ $unsigned(reg123)) ?
              reg131 : (wire119 || (~reg129)))));
          reg127 <= reg124;
        end
      reg132 <= reg128[(1'h1):(1'h0)];
    end
  assign wire133 = reg125;
  assign wire134 = (-(reg130 <<< {{(wire119 & (7'h40)), $signed(wire133)}}));
  assign wire135 = (8'ha0);
  assign wire136 = (+($signed($unsigned(wire118)) <<< ((~|$unsigned(wire119)) ?
                       (+$signed(wire118)) : ({wire134} == {wire122}))));
  assign wire137 = ((((reg132 ? (|wire135) : $unsigned(wire118)) ?
                               ({reg124, (7'h42)} ?
                                   wire133 : $unsigned((8'hac))) : $unsigned(wire119[(2'h3):(1'h1)])) ?
                           $unsigned($unsigned((reg123 ?
                               reg127 : reg129))) : {wire136,
                               (-reg130[(4'he):(4'hb)])}) ?
                       (+($unsigned(wire120) ?
                           (wire120 ?
                               reg127 : (wire119 ?
                                   wire121 : reg128)) : wire121[(4'hc):(4'hb)])) : reg127[(1'h1):(1'h0)]);
  assign wire138 = $signed(reg125[(1'h1):(1'h0)]);
  assign wire139 = {{wire120[(3'h5):(2'h2)], reg125[(1'h1):(1'h1)]}};
  assign wire140 = reg123;
  always
    @(posedge clk) begin
      reg141 <= wire140;
    end
  assign wire142 = $signed($signed((^~$signed((reg129 ? reg128 : reg131)))));
  always
    @(posedge clk) begin
      reg143 <= $unsigned(((~|(wire136 ?
              (reg123 ~^ wire135) : (reg125 ? reg141 : wire118))) ?
          wire133[(5'h10):(2'h3)] : reg131[(1'h1):(1'h0)]));
    end
  assign wire144 = $signed((^~({(wire139 - wire119), reg131[(2'h3):(1'h1)]} ?
                       (reg141 ?
                           (~reg129) : (wire142 ?
                               reg124 : wire121)) : reg131[(3'h4):(1'h1)])));
  assign wire145 = ((reg132[(3'h4):(2'h3)] ?
                       ({(reg123 ? reg143 : reg129), (^(8'hb8))} ?
                           (~(wire137 & wire121)) : (^~wire136)) : $signed(wire137[(1'h1):(1'h0)])) > {(($unsigned((8'ha5)) ~^ (^~(8'hb5))) ?
                           $unsigned((wire120 >= (7'h42))) : wire122)});
  assign wire146 = (({(8'haf)} >> $signed(wire118[(1'h1):(1'h0)])) ?
                       wire142 : ({($signed(wire122) > (wire118 >>> wire122)),
                           (^wire137)} && $signed(reg124[(5'h10):(3'h7)])));
  assign wire147 = ($signed($unsigned(wire142[(4'hc):(2'h2)])) ?
                       (+$signed($signed((-(8'hb4))))) : reg126);
  assign wire148 = (!($signed($signed(wire120[(4'ha):(4'ha)])) ?
                       $unsigned((|$unsigned((8'ha3)))) : ($signed((~&wire140)) ?
                           reg124[(4'ha):(3'h7)] : (~|(wire135 ~^ wire136)))));
  assign wire149 = (^$unsigned(((wire136 ? (+wire145) : (~&wire136)) ?
                       wire144[(2'h2):(1'h1)] : {((8'ha5) ? wire146 : (8'hb5)),
                           wire137[(2'h2):(1'h1)]})));
  always
    @(posedge clk) begin
      if ((!(|wire139[(2'h3):(2'h3)])))
        begin
          if (wire121[(4'h9):(1'h1)])
            begin
              reg150 <= (wire144 ?
                  wire144[(1'h0):(1'h0)] : (^((8'haa) > wire139[(4'hf):(4'hd)])));
              reg151 <= (({$unsigned((|wire144))} ?
                      (((~&reg127) ?
                          (wire147 ?
                              reg127 : reg131) : wire136[(5'h10):(3'h6)]) | ($unsigned(reg130) && (^~reg124))) : reg129[(3'h7):(2'h3)]) ?
                  (^$unsigned($unsigned((8'hbd)))) : (|$unsigned(reg130)));
              reg152 <= $signed((^~$unsigned({(wire148 >>> reg132)})));
              reg153 <= $signed($unsigned((reg129 && (((8'ha0) ?
                      reg123 : wire137) ?
                  wire133 : {reg126, (8'hb3)}))));
              reg154 <= ($signed($signed($signed($signed(reg151)))) > (wire136 ?
                  reg128[(1'h0):(1'h0)] : $signed(reg153)));
            end
          else
            begin
              reg150 <= $signed({reg129,
                  ((8'hae) ?
                      ((8'hb3) ?
                          (&wire135) : (|wire142)) : reg152[(1'h0):(1'h0)])});
              reg151 <= (^~wire122);
              reg152 <= reg125;
              reg153 <= wire135;
            end
          reg155 <= $signed(wire140[(1'h1):(1'h1)]);
        end
      else
        begin
          if (((reg150 * $signed(wire121[(3'h5):(2'h2)])) || wire121[(2'h2):(1'h1)]))
            begin
              reg150 <= {wire134[(2'h3):(1'h0)],
                  $unsigned(reg152[(1'h0):(1'h0)])};
            end
          else
            begin
              reg150 <= reg123;
              reg151 <= reg124[(4'hb):(2'h2)];
              reg152 <= $unsigned(((!$unsigned(reg143)) < (~&$unsigned(wire144))));
              reg153 <= reg132[(3'h4):(2'h3)];
              reg154 <= wire118;
            end
          reg155 <= (+wire140);
          reg156 <= wire136[(4'h8):(4'h8)];
          if ($unsigned((($signed(((8'hb6) ? wire121 : reg128)) ?
              (|$unsigned(reg156)) : wire134) <= reg154[(4'h9):(3'h4)])))
            begin
              reg157 <= $unsigned(reg129);
              reg158 <= (reg127 ?
                  $unsigned((&(reg141[(3'h6):(3'h5)] == (~&wire121)))) : $signed($unsigned(reg128[(2'h2):(1'h1)])));
              reg159 <= $signed((wire144[(1'h0):(1'h0)] ?
                  (((reg155 ? reg153 : wire137) ?
                      (^~reg141) : $signed(reg130)) >> $unsigned($unsigned(wire120))) : {((wire121 ?
                              reg154 : reg141) ?
                          wire118[(5'h11):(3'h5)] : (|(8'hb6)))}));
              reg160 <= ((-($signed((wire145 ? reg123 : reg155)) ?
                  reg155 : ($signed((8'hbf)) ?
                      (+wire146) : ((7'h40) ?
                          reg141 : reg151)))) < (^(~|reg129[(4'h8):(2'h3)])));
            end
          else
            begin
              reg157 <= $signed($signed({$unsigned({reg153, wire142})}));
              reg158 <= reg159[(3'h6):(3'h5)];
              reg159 <= $signed(((((wire137 ^~ wire146) >> wire146) ?
                      {$signed(wire119)} : wire140[(1'h0):(1'h0)]) ?
                  (+reg141) : reg160));
              reg160 <= (wire146 <<< (~&(+$unsigned((~|wire136)))));
            end
          reg161 <= ($unsigned(({reg124} ?
              ($signed(reg131) > (8'ha8)) : reg158[(1'h1):(1'h0)])) - wire144);
        end
      reg162 <= $unsigned(($signed($signed(reg127[(1'h0):(1'h0)])) <<< (!($unsigned(reg131) ?
          $signed(wire147) : $signed(reg158)))));
      reg163 <= (reg143[(1'h1):(1'h0)] + wire135[(3'h5):(1'h0)]);
      if ((({({wire144, reg126} < {reg159, wire118}),
              {$unsigned(reg157),
                  (wire120 >= reg161)}} || reg162[(3'h6):(2'h3)]) ?
          $unsigned((~(wire120[(1'h0):(1'h0)] ?
              reg143 : reg143[(3'h5):(3'h5)]))) : {wire121[(1'h0):(1'h0)],
              {(~|reg161[(2'h2):(2'h2)])}}))
        begin
          reg164 <= ((({$signed(reg143), $unsigned(wire136)} <= {(8'hbc)}) ?
              (7'h41) : reg154[(3'h7):(3'h7)]) ~^ $unsigned(reg157));
          if (((-(({wire133, wire138} ?
                      reg125[(1'h1):(1'h1)] : wire148[(3'h5):(1'h1)]) ?
                  (&{reg125}) : $unsigned((wire118 ? wire147 : wire138)))) ?
              $unsigned(reg131[(3'h5):(3'h4)]) : $unsigned(({$unsigned(reg157),
                  ((8'hb2) | reg130)} != ($unsigned(wire135) >> $unsigned(reg132))))))
            begin
              reg165 <= $unsigned(($unsigned(wire146[(2'h2):(2'h2)]) ?
                  {(8'ha4),
                      {reg152[(3'h7):(1'h1)]}} : {(reg154 | reg125[(2'h3):(2'h2)])}));
              reg166 <= reg165[(1'h1):(1'h1)];
              reg167 <= ($unsigned((reg123[(3'h6):(1'h0)] != $signed($unsigned(reg157)))) ?
                  ((((~^(8'ha1)) >> wire133) | (reg165[(5'h10):(4'hd)] & (wire119 > reg153))) <<< $signed($signed($signed(wire145)))) : ({$unsigned((wire122 ?
                          (8'ha4) : wire136)),
                      {wire134[(3'h5):(1'h1)],
                          {reg124}}} <= reg125[(3'h4):(2'h2)]));
            end
          else
            begin
              reg165 <= $signed($unsigned((~|reg166)));
              reg166 <= (((~&$unsigned((~&wire138))) & reg166[(5'h13):(5'h13)]) ?
                  ($unsigned(reg155) ?
                      (+$signed(((7'h40) - reg152))) : $signed(((8'ha5) | $unsigned(reg132)))) : $unsigned(((~|(^~wire118)) ?
                      reg152 : $unsigned(wire121[(4'hb):(3'h7)]))));
              reg167 <= reg132[(2'h3):(1'h1)];
              reg168 <= reg152;
            end
        end
      else
        begin
          reg164 <= $unsigned($signed({wire142[(5'h11):(2'h2)],
              reg128[(1'h1):(1'h0)]}));
        end
    end
  assign wire169 = (+({$signed($signed(reg157))} ?
                       (|$unsigned((+reg129))) : (((~reg160) >= $signed(reg150)) ?
                           reg153[(4'hc):(1'h1)] : ((~&(8'hba)) & (wire119 ?
                               reg141 : reg157)))));
  always
    @(posedge clk) begin
      reg170 <= $signed({(wire148 ?
              ($signed(reg162) ?
                  (wire137 ~^ reg150) : reg153[(4'he):(3'h7)]) : {(wire119 ?
                      reg163 : (8'hb7)),
                  (!wire138)})});
      reg171 <= (8'hb0);
      if (reg158[(1'h1):(1'h1)])
        begin
          reg172 <= reg150;
          if ({((|$signed($unsigned((7'h42)))) > reg151), $signed(reg172)})
            begin
              reg173 <= ((|{((reg163 ? reg123 : wire136) ?
                          (~&wire121) : reg167),
                      ($unsigned(reg128) ? reg164 : {(7'h41)})}) ?
                  wire148[(3'h7):(3'h6)] : $unsigned({(reg126 ~^ $unsigned(reg167)),
                      reg151}));
              reg174 <= ($unsigned((wire138 ?
                      ({reg168, reg164} ?
                          (reg165 > reg173) : wire120[(1'h1):(1'h0)]) : $signed($signed(wire133)))) ?
                  (((reg154 << $signed(reg151)) < reg157[(1'h1):(1'h0)]) ?
                      wire144 : wire122[(5'h14):(1'h1)]) : $signed({((&reg161) <<< (reg162 << reg151))}));
              reg175 <= reg124[(3'h5):(2'h3)];
              reg176 <= reg157;
              reg177 <= (($unsigned((!(~^reg130))) ?
                  reg130[(2'h3):(2'h2)] : $unsigned(reg129)) * $unsigned(reg160[(4'h9):(2'h2)]));
            end
          else
            begin
              reg173 <= (~^{((reg166 ?
                      (^~(8'hbb)) : reg168[(1'h0):(1'h0)]) >> $signed((reg173 ?
                      reg143 : wire145))),
                  wire147[(1'h0):(1'h0)]});
            end
          reg178 <= (&$signed((8'hab)));
        end
      else
        begin
          if ((!$signed($unsigned(((reg177 << reg168) <= (reg123 ?
              reg165 : wire137))))))
            begin
              reg172 <= $unsigned(wire142[(1'h1):(1'h0)]);
              reg173 <= (&(reg153 | wire140));
              reg174 <= (!$unsigned((^(^~$unsigned(wire138)))));
            end
          else
            begin
              reg172 <= (|(|$unsigned((reg123[(2'h3):(1'h1)] ?
                  (reg128 ? wire137 : reg126) : reg160[(5'h10):(2'h3)]))));
              reg173 <= $signed({(|({(8'ha3)} * (reg161 <<< reg178))),
                  $signed($signed($unsigned(wire121)))});
            end
          reg175 <= wire169[(3'h6):(1'h0)];
        end
      reg179 <= $unsigned((+wire142));
    end
endmodule

module module93
#(parameter param113 = ((-(({(8'hba), (8'ha1)} ? {(7'h43)} : (-(8'ha2))) ? (((8'h9c) > (8'ha1)) ? ((8'hbb) ? (8'hb8) : (8'hb4)) : ((8'hb1) && (8'ha1))) : (((8'ha1) ^ (8'hb3)) ? ((8'hb3) != (8'hb4)) : ((8'had) ? (8'hb3) : (8'hb9))))) ^ {(((&(8'hbb)) <<< (~(8'ha3))) ? (&((8'h9f) + (8'ha4))) : (((8'hac) && (8'h9c)) ? ((8'ha8) ? (8'hab) : (7'h40)) : (!(8'hb2))))}))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire98;
  input wire [(4'hc):(1'h0)] wire97;
  input wire signed [(3'h7):(1'h0)] wire96;
  input wire [(5'h12):(1'h0)] wire95;
  input wire [(5'h14):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  assign y = {wire112,
                 wire101,
                 wire100,
                 wire99,
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
                 (1'h0)};
  assign wire99 = $unsigned((-$signed((~^(wire95 == wire94)))));
  assign wire100 = (^({wire99[(5'h10):(4'he)]} ?
                       (wire99[(4'h9):(3'h4)] ^ $unsigned((^wire97))) : (8'h9f)));
  assign wire101 = $unsigned($signed((((wire97 ? wire99 : wire94) ?
                           $unsigned((8'hae)) : wire97[(3'h7):(3'h6)]) ?
                       {wire94[(5'h13):(5'h11)]} : (wire94 ?
                           wire94 : {wire96}))));
  always
    @(posedge clk) begin
      if (wire97)
        begin
          if (((|wire97) << wire94))
            begin
              reg102 <= (+(wire101 & $signed((wire97[(4'ha):(3'h4)] ?
                  $unsigned(wire98) : (~^wire96)))));
              reg103 <= $signed((($signed((~|reg102)) ?
                      ($signed(wire99) <<< $unsigned(wire97)) : {(wire95 ?
                              (8'hac) : (8'ha7))}) ?
                  wire97 : {{(wire94 - (8'hb1)), $signed(wire98)}}));
              reg104 <= $signed(({(8'ha7)} ^~ $signed(reg102[(3'h6):(2'h2)])));
              reg105 <= $signed((!{$unsigned((!wire101)), wire100}));
            end
          else
            begin
              reg102 <= (~$signed(wire98));
              reg103 <= $signed(reg105[(5'h13):(4'ha)]);
              reg104 <= ($unsigned(wire94[(5'h13):(5'h11)]) & reg102);
              reg105 <= $signed(((8'hab) ^~ ($unsigned(((8'ha0) + reg102)) ?
                  reg105 : ((8'hab) ? $unsigned(wire100) : (^wire94)))));
              reg106 <= $unsigned(((^wire94[(3'h6):(2'h3)]) ?
                  wire99 : $signed($unsigned(reg102[(3'h5):(3'h4)]))));
            end
          if ((((~|$unsigned((wire94 ?
              wire101 : wire97))) <<< $unsigned(wire96[(1'h1):(1'h1)])) == {$unsigned(reg105)}))
            begin
              reg107 <= ($unsigned({reg103}) && wire100[(4'h8):(3'h6)]);
              reg108 <= wire97[(4'h8):(1'h0)];
              reg109 <= $unsigned((-(&$unsigned($signed(wire99)))));
              reg110 <= {(~|(reg106[(1'h0):(1'h0)] * (+$unsigned(wire98)))),
                  reg107[(1'h1):(1'h1)]};
            end
          else
            begin
              reg107 <= $unsigned($signed(((-reg108) ?
                  $unsigned(reg105) : $signed(wire99[(3'h6):(3'h4)]))));
              reg108 <= (&{wire97[(1'h1):(1'h1)]});
              reg109 <= $unsigned(($unsigned(reg109) ?
                  {(^~wire95[(4'hf):(2'h3)]),
                      (wire101[(1'h1):(1'h0)] ^ $signed(reg106))} : {$unsigned((^reg107)),
                      ($unsigned(wire100) ~^ (reg103 ? wire98 : (8'hbc)))}));
              reg110 <= reg108;
              reg111 <= reg108;
            end
        end
      else
        begin
          reg102 <= (8'hae);
          reg103 <= reg111;
          reg104 <= $signed((8'hbd));
        end
    end
  assign wire112 = (wire97[(2'h3):(1'h0)] < (^reg108));
endmodule
