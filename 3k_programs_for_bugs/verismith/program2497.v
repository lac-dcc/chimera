module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire238;
  wire [(3'h7):(1'h0)] wire237;
  wire [(5'h10):(1'h0)] wire226;
  wire [(5'h14):(1'h0)] wire225;
  wire [(4'hc):(1'h0)] wire224;
  wire signed [(5'h13):(1'h0)] wire223;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire189;
  wire [(5'h15):(1'h0)] wire206;
  wire signed [(4'h9):(1'h0)] wire207;
  wire [(5'h13):(1'h0)] wire209;
  reg [(4'ha):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg235 = (1'h0);
  reg [(3'h7):(1'h0)] reg234 = (1'h0);
  reg [(4'he):(1'h0)] reg233 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg232 = (1'h0);
  reg [(3'h5):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg230 = (1'h0);
  reg [(2'h3):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg228 = (1'h0);
  reg [(4'hb):(1'h0)] reg227 = (1'h0);
  reg [(4'hd):(1'h0)] reg222 = (1'h0);
  reg [(3'h5):(1'h0)] reg221 = (1'h0);
  reg [(4'hc):(1'h0)] reg220 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg219 = (1'h0);
  reg [(5'h11):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg216 = (1'h0);
  reg [(3'h6):(1'h0)] reg215 = (1'h0);
  reg [(5'h14):(1'h0)] reg214 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg212 = (1'h0);
  reg [(5'h15):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg205 = (1'h0);
  reg [(3'h5):(1'h0)] reg204 = (1'h0);
  reg [(5'h10):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg202 = (1'h0);
  reg [(4'hf):(1'h0)] reg201 = (1'h0);
  reg [(4'hc):(1'h0)] reg200 = (1'h0);
  reg [(4'hf):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg198 = (1'h0);
  reg [(3'h7):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg195 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg194 = (1'h0);
  reg [(4'he):(1'h0)] reg193 = (1'h0);
  reg [(4'he):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg191 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire5,
                 wire6,
                 wire7,
                 wire189,
                 wire206,
                 wire207,
                 wire209,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg205,
                 reg204,
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
                 reg192,
                 reg191,
                 (1'h0)};
  assign wire5 = (wire1 ?
                     $unsigned($signed(wire0)) : ($unsigned(wire3[(3'h6):(1'h0)]) ?
                         (|$signed($signed(wire4))) : {$signed($signed(wire0)),
                             wire1[(1'h0):(1'h0)]}));
  assign wire6 = $unsigned(wire3);
  assign wire7 = wire6;
  module8 #() modinst190 (.y(wire189), .wire9(wire7), .wire11(wire5), .clk(clk), .wire12(wire3), .wire10(wire2));
  always
    @(posedge clk) begin
      if ((wire4[(4'hc):(2'h2)] >> (wire0 < wire189[(3'h5):(2'h3)])))
        begin
          reg191 <= wire2[(3'h5):(2'h3)];
        end
      else
        begin
          reg191 <= $unsigned(wire189);
          reg192 <= wire2;
          reg193 <= $signed(wire0);
          reg194 <= wire3;
        end
      reg195 <= $unsigned(wire2[(4'ha):(4'h8)]);
      if ($signed($unsigned($signed(reg195))))
        begin
          reg196 <= $unsigned(wire3);
          reg197 <= (($signed(((wire5 < wire6) * (wire3 != reg194))) ?
              wire0[(2'h3):(1'h1)] : reg192[(4'h8):(1'h1)]) && reg196[(4'he):(3'h6)]);
          reg198 <= (-wire6[(4'hf):(4'he)]);
          if ((wire4 >= ((reg192[(4'ha):(3'h4)] + {wire189, {wire2, wire0}}) ?
              (|$unsigned((reg191 ? reg196 : wire4))) : wire1)))
            begin
              reg199 <= (&$signed($unsigned(reg195)));
            end
          else
            begin
              reg199 <= wire6[(5'h12):(5'h11)];
              reg200 <= {$unsigned($unsigned($unsigned($signed((8'h9e))))),
                  $signed(wire4)};
              reg201 <= wire3;
              reg202 <= (+(!reg201));
              reg203 <= (((((^~wire5) ?
                          (wire6 ? wire5 : reg196) : reg197[(1'h1):(1'h0)]) ?
                      reg197 : $unsigned($unsigned(reg192))) ?
                  $signed(reg197) : {((~^wire3) ?
                          (+reg200) : reg201)}) >>> $signed(((wire7[(3'h7):(3'h6)] != ((8'hb3) >= wire4)) ?
                  wire7[(4'hf):(4'he)] : reg200)));
            end
        end
      else
        begin
          reg196 <= (-reg193[(2'h2):(1'h0)]);
          reg197 <= ((~&reg194) * reg194[(4'h8):(4'h8)]);
          reg198 <= wire3[(2'h2):(2'h2)];
        end
      reg204 <= wire7[(3'h6):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg205 <= $signed(wire3[(3'h4):(3'h4)]);
    end
  assign wire206 = $signed(((|$signed((reg196 | reg200))) ?
                       (~|(8'hab)) : (~^($unsigned(wire5) ?
                           (~reg203) : (+reg199)))));
  module8 #() modinst208 (wire207, clk, wire189, wire4, reg202, reg203);
  module122 #() modinst210 (.wire126(wire1), .clk(clk), .wire124(reg193), .wire123(wire6), .y(wire209), .wire127(reg197), .wire125(wire206));
  always
    @(posedge clk) begin
      if ($signed(($signed($unsigned(reg202[(3'h7):(2'h3)])) ?
          (~^((reg202 ?
              wire1 : wire4) | wire6[(3'h4):(2'h3)])) : ((^~$unsigned(wire2)) ?
              (&wire189[(4'hb):(1'h1)]) : {(~wire206)}))))
        begin
          reg211 <= reg191;
        end
      else
        begin
          reg211 <= wire206[(4'ha):(3'h4)];
          reg212 <= {reg201[(3'h6):(1'h0)]};
          reg213 <= $signed((wire4 & (((reg196 <= reg197) >> reg205[(4'h9):(3'h7)]) + reg196[(4'hf):(1'h0)])));
          if ((8'ha0))
            begin
              reg214 <= $unsigned(((($signed(wire0) < reg213[(4'ha):(4'ha)]) ?
                      (wire206[(3'h4):(2'h3)] ?
                          $signed(wire5) : wire3) : (wire3 << wire189)) ?
                  $unsigned((8'hbb)) : (wire7 >>> $signed(wire209[(3'h5):(1'h0)]))));
              reg215 <= ((|(!reg213)) * ((($unsigned(reg193) ?
                      {reg213, reg194} : (reg197 >>> wire6)) << reg203) ?
                  wire206[(3'h5):(3'h5)] : reg191));
              reg216 <= reg195;
              reg217 <= (~wire2[(4'h9):(4'h8)]);
              reg218 <= $unsigned((~&$signed($signed((wire2 - reg211)))));
            end
          else
            begin
              reg214 <= reg202;
              reg215 <= (($signed((8'h9c)) >= ((reg200 != {reg212, reg198}) ?
                  $signed((~reg193)) : wire1)) & (8'haa));
              reg216 <= {reg195[(4'he):(3'h5)]};
              reg217 <= wire206;
              reg218 <= ((~&{$unsigned(reg195)}) || wire189[(4'h8):(3'h7)]);
            end
        end
      reg219 <= (reg200[(2'h2):(1'h1)] | wire207);
      reg220 <= (!$unsigned(reg217[(2'h2):(1'h0)]));
      reg221 <= reg217;
      reg222 <= reg200[(4'h9):(3'h6)];
    end
  assign wire223 = $unsigned($signed((reg202[(3'h5):(2'h3)] <<< $signed($signed(reg203)))));
  assign wire224 = $signed(((($unsigned(reg191) ?
                           (reg202 ? wire6 : reg213) : (reg214 ?
                               reg200 : (8'ha7))) | (~^$signed((8'hb1)))) ?
                       $unsigned($unsigned({wire206,
                           reg212})) : $signed((^(reg192 >= reg193)))));
  assign wire225 = $unsigned(reg216);
  assign wire226 = {wire2,
                       $unsigned($signed((wire2[(4'hb):(2'h3)] ?
                           ((7'h42) ? reg202 : reg216) : ((8'ha5) ?
                               reg201 : wire7))))};
  always
    @(posedge clk) begin
      reg227 <= $unsigned((($signed($unsigned(wire207)) ^~ (~|(!wire0))) ?
          (wire2[(4'hb):(4'ha)] ?
              wire189[(4'he):(4'hd)] : wire6) : {$unsigned(reg217[(1'h1):(1'h1)]),
              $unsigned(wire6)}));
      if ((reg214 ?
          ($unsigned((~&(wire224 & wire1))) ?
              $signed(wire207) : wire207[(4'h9):(3'h4)]) : $unsigned(reg211)))
        begin
          reg228 <= ((reg203 << $signed($unsigned(wire2[(4'hf):(4'hc)]))) ?
              reg211 : (8'hb5));
          if (((&(|$signed(wire225[(5'h10):(2'h2)]))) ?
              (($signed(wire7) ?
                  $unsigned($signed(reg214)) : ({reg203} ?
                      wire6 : {reg191,
                          reg192})) | ((8'ha1) ~^ ($unsigned(wire0) >> reg200[(3'h6):(3'h6)]))) : {$signed(wire206),
                  $unsigned(reg222)}))
            begin
              reg229 <= $signed(((!reg201[(3'h5):(2'h2)]) * (reg216 > reg217[(5'h11):(4'h9)])));
              reg230 <= ((reg197[(1'h1):(1'h0)] && (^~reg199[(4'h9):(3'h7)])) >>> reg220[(4'hb):(2'h3)]);
              reg231 <= {wire223};
              reg232 <= (8'hb7);
            end
          else
            begin
              reg229 <= $unsigned($signed((~|{(&wire226)})));
              reg230 <= $unsigned((wire206 ?
                  (wire2[(4'h9):(2'h2)] ?
                      (!reg231[(1'h0):(1'h0)]) : $unsigned($unsigned(wire224))) : $signed(({(8'haf),
                          reg214} ?
                      $signed(reg219) : (reg197 > reg221)))));
            end
        end
      else
        begin
          reg228 <= wire223;
        end
      reg233 <= $signed($unsigned(reg191[(1'h0):(1'h0)]));
      reg234 <= $signed($unsigned(reg193[(3'h5):(3'h4)]));
      reg235 <= ((7'h40) ?
          (wire1 ?
              $unsigned((8'ha1)) : (~$signed((reg194 ?
                  reg201 : reg202)))) : $unsigned($signed(((reg213 ?
                  reg194 : reg194) ?
              (reg195 ? reg191 : wire0) : $unsigned(reg200)))));
    end
  always
    @(posedge clk) begin
      reg236 <= $signed(({($unsigned(reg214) ?
              (reg198 ? reg219 : reg197) : (reg233 ?
                  wire3 : reg219))} << $signed((reg211[(4'he):(4'h8)] > (~^reg201)))));
    end
  assign wire237 = ((~|(-($unsigned(reg230) ? (8'ha8) : $unsigned(reg199)))) ?
                       (|reg235[(3'h4):(2'h2)]) : reg216);
  assign wire238 = reg194[(3'h7):(3'h6)];
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h29b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire184;
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(2'h3):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire159,
                 wire104,
                 wire60,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire19,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire106,
                 wire107,
                 wire120,
                 wire184,
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
                 reg17,
                 reg18,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire13 = (wire10 ? wire12 : (^~wire9[(2'h2):(2'h2)]));
  assign wire14 = (wire11[(2'h3):(2'h3)] ~^ $signed((wire12[(3'h5):(3'h5)] != wire13[(4'hd):(4'ha)])));
  assign wire15 = (&wire13);
  assign wire16 = wire13;
  always
    @(posedge clk) begin
      reg17 <= (wire15[(1'h0):(1'h0)] ^~ $signed(wire12));
      reg18 <= wire10;
    end
  assign wire19 = wire16;
  always
    @(posedge clk) begin
      reg20 <= $signed(wire12[(1'h1):(1'h0)]);
      reg21 <= (~(~(wire19[(4'ha):(3'h5)] >= ($unsigned(wire9) == ((8'hab) ?
          wire19 : wire13)))));
      reg22 <= ({wire14[(2'h3):(1'h1)],
          wire9[(1'h0):(1'h0)]} + (wire13 < {wire19, $unsigned(reg21)}));
      if ((|wire16))
        begin
          if ((reg22 - wire10[(4'hf):(1'h1)]))
            begin
              reg23 <= $unsigned($signed(($signed(wire15) ?
                  $unsigned($signed(wire13)) : {(~wire9),
                      (wire13 ? wire16 : wire11)})));
            end
          else
            begin
              reg23 <= $signed($signed($unsigned(wire15)));
              reg24 <= {$unsigned(((~^(|wire16)) - $unsigned($unsigned((8'hbf)))))};
              reg25 <= (~&({wire10[(4'hb):(3'h5)]} ?
                  $unsigned((~^$unsigned(reg20))) : wire16[(1'h1):(1'h1)]));
              reg26 <= (wire11[(3'h6):(2'h2)] ^~ wire12);
            end
          reg27 <= wire15;
          reg28 <= reg25[(3'h7):(3'h6)];
          reg29 <= (!(wire19[(4'hc):(3'h7)] ?
              ($unsigned($signed(reg28)) ^~ $signed((!wire15))) : reg27[(3'h4):(1'h1)]));
        end
      else
        begin
          if (({{reg21, $signed($unsigned((8'had)))}} ^~ wire16[(3'h6):(2'h2)]))
            begin
              reg23 <= $signed(reg28[(2'h3):(2'h2)]);
              reg24 <= reg20;
              reg25 <= wire15[(2'h2):(2'h2)];
              reg26 <= ({reg27[(2'h3):(1'h0)]} ?
                  {($unsigned($signed(reg24)) ?
                          (~{reg29}) : $unsigned(reg29[(4'h8):(1'h0)]))} : {reg22});
              reg27 <= $signed(reg17);
            end
          else
            begin
              reg23 <= {(($unsigned($signed(wire11)) ?
                          $unsigned((!reg23)) : ((&wire16) ?
                              (|wire19) : $unsigned(wire14))) ?
                      {reg26[(2'h3):(1'h1)]} : (~$signed(reg21[(4'hb):(4'ha)])))};
              reg24 <= $signed(reg20[(3'h7):(2'h3)]);
            end
          reg28 <= ((~^reg21[(3'h4):(2'h3)]) ?
              (($signed(reg27[(3'h6):(3'h4)]) ?
                      ((reg20 ? wire12 : reg25) ?
                          ((7'h43) ?
                              wire15 : wire15) : (wire16 - reg27)) : (reg21[(3'h5):(1'h1)] & reg27[(3'h7):(3'h6)])) ?
                  wire14[(2'h3):(1'h1)] : (reg29[(2'h3):(2'h3)] ~^ reg22)) : reg20);
          reg29 <= ((($signed(reg28[(1'h1):(1'h1)]) ?
                  (!$unsigned(wire9)) : ($signed((8'hb7)) ?
                      {wire14} : (reg22 == (8'hb2)))) + reg23) ?
              $signed({reg27,
                  $signed((reg25 <= wire12))}) : $unsigned((&(!wire16[(4'ha):(2'h3)]))));
        end
    end
  assign wire30 = wire14;
  assign wire31 = {{$unsigned((~|(8'haf)))}};
  assign wire32 = $unsigned(wire19);
  assign wire33 = (~^((^~$signed((|wire16))) << wire9));
  always
    @(posedge clk) begin
      reg34 <= wire32[(3'h4):(3'h4)];
      if ((reg27 ?
          (((^wire13) <= (^~(^reg21))) << wire19) : (((~(wire31 >>> reg24)) | (8'hbc)) ?
              ((wire15[(4'ha):(1'h0)] < (reg24 - reg34)) && $unsigned((+reg22))) : (reg22 - reg18))))
        begin
          reg35 <= $signed($signed($signed((^(^wire12)))));
          reg36 <= $signed((reg18 ?
              reg20[(4'h8):(2'h3)] : reg26[(3'h4):(2'h3)]));
          reg37 <= reg20;
          reg38 <= $signed(($unsigned((&(reg35 ? reg34 : reg20))) ?
              (reg20 ?
                  $unsigned((wire31 * (8'haf))) : $unsigned(reg35[(5'h14):(4'ha)])) : {{$unsigned(reg25)}}));
          if (reg24)
            begin
              reg39 <= (+($unsigned(reg37) >>> $signed($signed(wire15[(2'h3):(2'h3)]))));
              reg40 <= (-wire30[(4'he):(3'h5)]);
            end
          else
            begin
              reg39 <= reg17[(1'h1):(1'h0)];
              reg40 <= {(reg29 ?
                      $unsigned($signed((reg29 >>> reg28))) : wire13[(1'h0):(1'h0)]),
                  reg18[(3'h6):(3'h5)]};
              reg41 <= ((^(~&(wire13 ? $signed(reg26) : (^wire11)))) ?
                  $signed((~|$unsigned(wire14))) : wire12[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg35 <= ((reg37[(2'h2):(1'h1)] * {(reg21 >> (reg25 ?
                      reg23 : (8'hb3))),
                  $unsigned((reg25 ? (8'hbf) : wire16))}) ?
              {$signed(((reg35 ^~ reg34) | wire13)),
                  $unsigned((&reg28[(3'h7):(3'h5)]))} : $signed((($unsigned(wire19) ?
                      $signed(reg22) : $unsigned(reg36)) ?
                  (reg40[(1'h0):(1'h0)] != (-reg41)) : (~|(~reg20)))));
        end
    end
  module42 #() modinst61 (wire60, clk, reg34, wire9, wire15, reg39, reg18);
  module62 #() modinst105 (wire104, clk, reg23, wire31, wire60, wire33);
  assign wire106 = $unsigned($unsigned({reg24[(4'ha):(2'h3)],
                       (((8'hab) || wire104) ^ (!reg18))}));
  assign wire107 = reg26[(1'h0):(1'h0)];
  module108 #() modinst121 (wire120, clk, reg36, reg21, reg17, wire10);
  module122 #() modinst160 (.y(wire159), .wire124(reg20), .wire127(wire15), .wire123(wire12), .clk(clk), .wire126(reg26), .wire125(wire13));
  always
    @(posedge clk) begin
      reg161 <= wire12;
      reg162 <= (((($signed((8'ha4)) ?
                  $unsigned((8'hb7)) : $unsigned(wire31)) || reg28[(3'h7):(3'h5)]) ?
              $unsigned(wire11) : wire15[(2'h3):(2'h3)]) ?
          $unsigned({$unsigned(reg22[(4'hb):(3'h5)])}) : wire159);
      reg163 <= reg162[(1'h0):(1'h0)];
      reg164 <= (~^($signed((8'h9d)) ?
          $signed((^~(~(7'h42)))) : $signed((+$unsigned(reg34)))));
      if (wire107[(5'h10):(4'ha)])
        begin
          reg165 <= (8'h9d);
          if (wire30[(3'h5):(1'h1)])
            begin
              reg166 <= reg22[(2'h3):(2'h3)];
              reg167 <= (reg17 >> ({(wire104[(4'he):(3'h7)] ? reg28 : wire107),
                  reg35} >> wire13));
            end
          else
            begin
              reg166 <= {$unsigned((wire104 >>> $unsigned((reg38 & wire107))))};
              reg167 <= (!reg20);
              reg168 <= ($signed((^$signed({reg23}))) & $unsigned({(~((8'hb6) ?
                      reg164 : wire19))}));
            end
          reg169 <= $unsigned($unsigned((($unsigned(reg164) >>> (reg17 || wire15)) <<< $signed($unsigned(reg162)))));
        end
      else
        begin
          reg165 <= {{$unsigned({(reg36 ? wire120 : (8'hab)),
                      (wire33 ? wire15 : wire104)})},
              $signed({$signed($unsigned(wire16))})};
          reg166 <= $unsigned((wire13 ? $unsigned(wire30) : (~$signed(reg22))));
          if ({($signed(((wire16 <= reg163) ?
                  $unsigned(reg162) : {wire30})) < ((~$unsigned(wire19)) | $unsigned((wire33 * reg22)))),
              wire30})
            begin
              reg167 <= {wire12, $unsigned(reg22[(4'h9):(3'h6)])};
              reg168 <= (reg24[(4'hd):(4'h8)] ~^ reg23[(3'h7):(3'h5)]);
            end
          else
            begin
              reg167 <= $unsigned(($signed(reg36) || $signed(((reg166 ?
                      reg38 : reg29) ?
                  (~|reg165) : reg28))));
              reg168 <= ((^reg26[(3'h5):(2'h2)]) ?
                  $signed(reg165[(1'h0):(1'h0)]) : reg23[(2'h3):(2'h3)]);
              reg169 <= (~|wire30[(5'h11):(3'h4)]);
              reg170 <= wire120[(1'h0):(1'h0)];
            end
          reg171 <= $unsigned($unsigned(((wire30 ? (reg23 | (8'ha1)) : reg23) ?
              reg38[(5'h14):(3'h6)] : ((reg24 <= reg20) ?
                  wire16[(4'ha):(3'h6)] : wire30))));
        end
    end
  module172 #() modinst185 (wire184, clk, reg164, wire14, reg37, reg27);
  assign wire186 = $signed({$signed(reg25)});
  module122 #() modinst188 (.wire125(reg161), .wire124(reg169), .wire127(reg20), .y(wire187), .wire126(wire106), .clk(clk), .wire123(wire184));
endmodule

module module172  (y, clk, wire176, wire175, wire174, wire173);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire176;
  input wire signed [(4'hf):(1'h0)] wire175;
  input wire signed [(4'he):(1'h0)] wire174;
  input wire [(3'h6):(1'h0)] wire173;
  wire signed [(4'h8):(1'h0)] wire183;
  wire [(5'h13):(1'h0)] wire182;
  wire signed [(3'h6):(1'h0)] wire181;
  wire signed [(4'hb):(1'h0)] wire180;
  wire signed [(5'h13):(1'h0)] wire177;
  reg [(4'hb):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg178 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire177,
                 reg179,
                 reg178,
                 (1'h0)};
  assign wire177 = wire174;
  always
    @(posedge clk) begin
      reg178 <= wire173[(3'h5):(1'h0)];
      reg179 <= wire176[(4'he):(3'h4)];
    end
  assign wire180 = {wire176,
                       (wire177 | (reg179[(2'h3):(1'h1)] >>> ($unsigned(reg179) ?
                           $signed(wire175) : $unsigned(wire177))))};
  assign wire181 = wire174;
  assign wire182 = {$unsigned(wire175[(3'h4):(2'h3)]), reg178[(3'h4):(1'h0)]};
  assign wire183 = wire175;
endmodule

module module122  (y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire127;
  input wire [(4'h8):(1'h0)] wire126;
  input wire [(3'h4):(1'h0)] wire125;
  input wire [(2'h2):(1'h0)] wire124;
  input wire signed [(3'h7):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire157;
  wire signed [(5'h10):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire145;
  wire [(2'h3):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire131;
  wire [(4'hd):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire146,
                 wire145,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 (1'h0)};
  assign wire128 = (^~($unsigned((7'h43)) <<< $signed(wire127)));
  assign wire129 = (~(wire127 ?
                       wire128 : (({wire127, wire126} * ((7'h42) ?
                           wire123 : wire123)) < $unsigned($unsigned((8'hb4))))));
  assign wire130 = $unsigned((wire129[(3'h7):(3'h5)] ?
                       ($signed($unsigned(wire124)) ?
                           wire123[(3'h5):(3'h4)] : $signed({wire126})) : wire124[(1'h1):(1'h0)]));
  assign wire131 = wire125[(2'h2):(1'h1)];
  assign wire132 = (-(~^wire128[(1'h0):(1'h0)]));
  assign wire133 = wire128;
  assign wire134 = ((8'hbb) ?
                       {$signed(wire133),
                           wire124} : $signed((wire124[(1'h0):(1'h0)] ?
                           wire129[(2'h3):(2'h2)] : wire123)));
  assign wire135 = {(8'hbc)};
  always
    @(posedge clk) begin
      if ($unsigned((($signed($unsigned(wire123)) ?
          $unsigned(wire123) : ((wire132 <= wire133) ~^ wire131)) == (((wire132 ?
              wire135 : wire124) + $signed((8'hbd))) ?
          ((~&wire134) - (wire125 <= wire133)) : $signed((7'h44))))))
        begin
          reg136 <= ({($unsigned((wire135 > (8'hb3))) ?
                  (wire128 ?
                      (wire132 >>> wire134) : $unsigned(wire124)) : $signed(wire130[(3'h5):(1'h1)]))} != wire124[(1'h0):(1'h0)]);
          reg137 <= $signed((((+wire128) <= $unsigned((wire124 << wire124))) - (~|($unsigned((8'hb9)) ?
              (reg136 > reg136) : $signed(reg136)))));
        end
      else
        begin
          reg136 <= $signed($unsigned({$signed((-reg136))}));
        end
      reg138 <= {$unsigned($unsigned(wire128[(2'h3):(2'h3)]))};
      reg139 <= $unsigned(wire126);
      if (reg139)
        begin
          reg140 <= (wire129 & ((!$signed(wire128)) ?
              wire132 : $unsigned({$signed((8'hb7))})));
          reg141 <= wire125[(1'h1):(1'h0)];
          reg142 <= $unsigned($unsigned($signed(reg140[(5'h13):(3'h6)])));
          reg143 <= wire125;
        end
      else
        begin
          if ($signed(reg140[(4'hc):(4'h8)]))
            begin
              reg140 <= reg139[(3'h6):(1'h0)];
              reg141 <= $unsigned(($unsigned($signed((|(8'haf)))) && $unsigned(($signed(reg136) ^ wire127[(3'h6):(2'h3)]))));
              reg142 <= ((8'ha0) >= ({$unsigned(reg138[(4'hb):(3'h6)])} + ((8'had) < wire131)));
            end
          else
            begin
              reg140 <= (((~|(reg140 ~^ (reg138 <<< reg137))) < wire124[(1'h1):(1'h1)]) <= (wire130 >> ((wire128[(3'h4):(2'h2)] ^ ((8'hbd) ?
                      wire130 : reg138)) ?
                  ((~^wire126) && (~^reg137)) : $unsigned($signed(wire129)))));
              reg141 <= {(!((reg142[(1'h1):(1'h1)] ?
                          wire124 : $unsigned(reg136)) ?
                      wire132[(3'h6):(2'h3)] : {{wire129, wire123},
                          $unsigned(wire132)})),
                  (reg137[(3'h6):(2'h3)] ?
                      (wire133[(3'h6):(1'h0)] >= $unsigned($signed(reg136))) : wire135)};
              reg142 <= (~&($signed(reg137) * reg142));
              reg143 <= $signed(wire123[(1'h1):(1'h0)]);
            end
        end
      reg144 <= ($signed(wire135) ?
          wire128[(2'h2):(1'h0)] : ($unsigned($signed($signed((8'hba)))) ^ $signed(({reg142,
                  reg143} ?
              (wire133 ? wire130 : (7'h40)) : reg138))));
    end
  assign wire145 = (~&$signed(({(wire130 ?
                           reg141 : reg142)} == $unsigned({(8'hab), reg143}))));
  assign wire146 = reg138;
  always
    @(posedge clk) begin
      if ($signed({$unsigned(reg141)}))
        begin
          reg147 <= wire124[(2'h2):(1'h0)];
          reg148 <= $signed({(reg142 ?
                  $unsigned((wire130 ~^ (8'had))) : $signed(wire131)),
              $unsigned({$unsigned((8'hb4))})});
          reg149 <= (~^(+$signed((wire125 ? (+wire127) : (-reg136)))));
          reg150 <= ($unsigned((8'hab)) <<< {(~|reg148[(4'h8):(3'h7)])});
        end
      else
        begin
          reg147 <= $signed($unsigned($unsigned(((wire128 == (8'hae)) ?
              (reg139 ^~ (8'hb9)) : (wire133 ? wire146 : wire146)))));
          reg148 <= $unsigned(wire126[(2'h2):(1'h0)]);
          reg149 <= $unsigned(((wire146 != ($unsigned(reg140) >>> wire134)) >= reg139));
        end
      reg151 <= $unsigned($signed($unsigned(reg142)));
      reg152 <= reg144;
      reg153 <= {$unsigned(reg141[(2'h2):(1'h0)]),
          (+(~&$signed($signed(reg142))))};
      if ((wire131[(3'h5):(3'h4)] * $unsigned(reg149[(1'h0):(1'h0)])))
        begin
          reg154 <= reg138;
          reg155 <= $unsigned($unsigned(reg141));
        end
      else
        begin
          reg154 <= (~&wire135);
        end
    end
  assign wire156 = (8'hbe);
  assign wire157 = wire133;
  assign wire158 = wire134;
endmodule

module module108  (y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire112;
  input wire [(4'hd):(1'h0)] wire111;
  input wire signed [(5'h10):(1'h0)] wire110;
  input wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire114,
                 wire113,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire113 = (^~($signed((~|(wire112 ^~ wire110))) | (((^wire112) ?
                       (wire111 ? wire109 : wire110) : (&wire112)) & ((wire110 ?
                       wire112 : wire110) >= {wire109, wire110}))));
  assign wire114 = (wire111[(2'h2):(1'h0)] ^~ wire111);
  always
    @(posedge clk) begin
      reg115 <= {((~&{(wire112 << wire109)}) ?
              $unsigned($unsigned(wire112)) : {((8'hac) ?
                      $unsigned(wire113) : $unsigned(wire114)),
                  (!wire113)}),
          $signed($signed(((wire113 ? wire111 : wire114) ?
              wire114[(3'h6):(1'h0)] : wire110[(2'h2):(1'h0)])))};
      reg116 <= (reg115 ^ $unsigned(wire113));
      reg117 <= (^$unsigned($unsigned($signed(reg115[(4'ha):(3'h5)]))));
    end
  assign wire118 = wire113;
  assign wire119 = {({($unsigned(reg115) ? (&(8'hb5)) : {(8'ha4)}),
                           wire112} == $unsigned((reg115 > $unsigned(wire110)))),
                       {wire109}};
endmodule

module module62  (y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire66;
  input wire signed [(5'h12):(1'h0)] wire65;
  input wire [(5'h12):(1'h0)] wire64;
  input wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire69,
                 wire68,
                 wire67,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire67 = $unsigned(wire66[(4'hb):(3'h4)]);
  assign wire68 = wire64;
  assign wire69 = $signed((wire67[(3'h5):(1'h1)] == $unsigned($signed({wire68,
                      (7'h42)}))));
  always
    @(posedge clk) begin
      reg70 <= (8'hb4);
      if (wire67[(4'h8):(3'h6)])
        begin
          reg71 <= $unsigned(($signed($unsigned(wire64[(4'hb):(1'h1)])) ?
              wire67[(3'h5):(1'h0)] : (^({(8'h9c)} ?
                  {wire65, wire63} : wire69))));
          reg72 <= wire65[(2'h2):(1'h1)];
          reg73 <= (((reg71 > reg70) ?
              (wire67[(4'h8):(3'h4)] ?
                  (~^wire63[(2'h3):(1'h0)]) : ((7'h41) ?
                      $unsigned(wire69) : wire64[(4'hb):(1'h1)])) : {reg72,
                  wire66[(5'h12):(4'hc)]}) * (^$unsigned((wire64[(4'ha):(3'h6)] ?
              (wire63 ? reg72 : wire69) : (wire69 << reg71)))));
        end
      else
        begin
          if (wire67)
            begin
              reg71 <= (~&wire64);
            end
          else
            begin
              reg71 <= $unsigned(wire63);
              reg72 <= $unsigned(reg73[(3'h4):(3'h4)]);
              reg73 <= $unsigned((wire64 ?
                  ($unsigned($unsigned((8'hae))) ?
                      ((&wire67) ? (-wire69) : (wire65 | reg73)) : {wire69,
                          wire67}) : reg70));
              reg74 <= $signed($unsigned((8'ha8)));
              reg75 <= reg74[(4'ha):(4'h9)];
            end
          reg76 <= reg75;
          reg77 <= (~&($signed((~reg75)) <= wire67[(1'h1):(1'h1)]));
        end
    end
  assign wire78 = (((~|reg75[(4'hb):(4'h9)]) == $signed($signed($signed(wire64)))) ?
                      (+wire67) : reg76[(2'h2):(1'h0)]);
  assign wire79 = ((&(~&(reg74[(3'h6):(1'h0)] ? (~^wire66) : wire65))) ?
                      (^reg77[(4'hb):(4'ha)]) : $signed($unsigned(wire68[(4'hf):(3'h6)])));
  assign wire80 = (~^(($unsigned(wire63) ?
                      $unsigned(wire66[(4'he):(4'he)]) : {(8'hbf)}) <<< wire78));
  assign wire81 = $unsigned(reg75);
  assign wire82 = $signed($unsigned(reg76));
  assign wire83 = $signed(reg72);
  always
    @(posedge clk) begin
      reg84 <= $unsigned({(wire80[(3'h7):(3'h6)] >= wire67[(2'h2):(1'h1)])});
      reg85 <= wire65;
      reg86 <= ({{((reg77 <<< reg73) ^~ (wire65 ? reg84 : wire79)),
                  $unsigned($unsigned(reg71))},
              ((reg74[(4'h9):(3'h6)] | $unsigned(wire66)) < (7'h43))} ?
          (8'had) : wire81);
      reg87 <= (&$signed($unsigned(reg85[(4'hb):(4'hb)])));
    end
  assign wire88 = wire81;
  assign wire89 = $unsigned($unsigned(($unsigned($signed(reg87)) ^ ((reg77 ?
                      wire83 : wire67) - {wire82}))));
  assign wire90 = (wire65[(4'hf):(3'h6)] == ((({wire83, wire79} ?
                          (+reg77) : $signed(reg74)) ?
                      reg85[(4'hb):(4'ha)] : $signed(wire80)) >> wire78));
  assign wire91 = (reg84 ?
                      (reg76 ?
                          wire82 : ((~wire89[(4'he):(2'h2)]) != wire63)) : ($signed(($signed((7'h43)) >= (wire67 * reg72))) ?
                          reg75[(4'hc):(3'h5)] : $signed($unsigned((wire88 ?
                              reg74 : reg87)))));
  assign wire92 = $unsigned((($signed($signed(wire89)) ?
                      $signed((+(8'h9f))) : {$unsigned((7'h41)),
                          reg74}) == $signed($signed({reg74}))));
  always
    @(posedge clk) begin
      reg93 <= wire90;
      if (wire65[(5'h10):(4'h9)])
        begin
          reg94 <= $unsigned($unsigned((($unsigned(wire82) || (wire67 ?
              reg77 : reg71)) < $signed(wire80[(4'he):(4'hb)]))));
          if (wire66)
            begin
              reg95 <= (wire68 ?
                  {(((~&wire92) ?
                          wire90[(4'hf):(3'h4)] : $signed(reg93)) ~^ ($unsigned(wire83) >>> (reg74 ?
                          wire63 : wire67)))} : wire88);
              reg96 <= reg94;
              reg97 <= $unsigned(reg76);
            end
          else
            begin
              reg95 <= (($unsigned(reg93) << (|wire91[(3'h5):(1'h0)])) ?
                  wire81[(2'h3):(2'h3)] : (($signed($signed(reg85)) ?
                          ({wire90,
                              reg96} <<< $unsigned(wire63)) : $signed((^~wire78))) ?
                      (($signed(wire65) <<< (~reg85)) ?
                          ((reg86 >>> (8'hb7)) >>> (wire90 << reg75)) : (reg85[(4'h8):(3'h6)] != (reg84 >= reg87))) : (reg97 * reg73[(5'h10):(4'h9)])));
              reg96 <= (&wire64[(1'h1):(1'h1)]);
              reg97 <= reg96;
              reg98 <= $signed(reg71);
            end
          reg99 <= wire82;
          reg100 <= wire79;
          reg101 <= $signed(((reg98 < reg95) ?
              ((+wire64) ?
                  reg70[(4'h8):(1'h0)] : $signed((|reg84))) : $signed(((~&wire89) ?
                  (wire65 * reg71) : $signed(wire79)))));
        end
      else
        begin
          if ((+reg99))
            begin
              reg94 <= ((wire65 ?
                  reg99[(1'h1):(1'h0)] : $unsigned(wire92)) != wire91[(1'h0):(1'h0)]);
              reg95 <= wire88[(1'h1):(1'h0)];
            end
          else
            begin
              reg94 <= $unsigned((+{({(8'ha1)} ?
                      (wire69 ^ wire80) : $signed(wire78))}));
              reg95 <= $signed(reg99[(1'h1):(1'h1)]);
              reg96 <= reg85;
            end
          if ($signed((&$unsigned((^~reg100[(3'h6):(3'h6)])))))
            begin
              reg97 <= $unsigned((-wire92[(4'ha):(2'h2)]));
              reg98 <= (~&(((reg87[(2'h3):(1'h0)] + ((7'h40) && wire63)) ?
                      {wire82[(4'hc):(4'hb)],
                          {wire65, reg86}} : $signed((|wire88))) ?
                  (8'ha0) : $signed(((reg84 ? reg74 : (8'ha4)) ?
                      (-wire79) : $unsigned((8'hae))))));
              reg99 <= {$unsigned((^($unsigned(reg99) && (reg97 <<< (8'ha3))))),
                  (~&$signed((~^(reg74 >= reg70))))};
              reg100 <= $signed((((8'hab) ?
                  $unsigned((&reg98)) : $unsigned((~&(8'h9e)))) | $unsigned($unsigned(reg85))));
              reg101 <= reg85[(1'h1):(1'h1)];
            end
          else
            begin
              reg97 <= ((wire91[(1'h0):(1'h0)] ?
                  reg74 : (~$signed((wire89 ~^ wire66)))) | (~&$signed(reg98[(1'h0):(1'h0)])));
            end
        end
    end
  assign wire102 = ({(~wire63[(2'h3):(2'h3)]),
                       (~^$unsigned((reg100 >>> (8'hac))))} ^~ $unsigned((^~(wire83[(1'h1):(1'h1)] ?
                       (wire91 > reg76) : (8'ha6)))));
  assign wire103 = wire83;
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire47;
  input wire signed [(5'h10):(1'h0)] wire46;
  input wire signed [(4'h9):(1'h0)] wire45;
  input wire signed [(4'hf):(1'h0)] wire44;
  input wire signed [(5'h10):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  assign y = {wire59,
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
                 (1'h0)};
  assign wire48 = wire44[(3'h6):(2'h3)];
  assign wire49 = {{(((~|wire47) ? $signed(wire45) : {(7'h40)}) ?
                              (^(wire45 > wire46)) : $unsigned((~&wire46)))}};
  assign wire50 = wire48[(5'h12):(3'h6)];
  assign wire51 = wire43;
  assign wire52 = (8'hb2);
  assign wire53 = (^~((wire50 ?
                      ((wire43 >= wire44) ?
                          {wire49} : $signed((8'had))) : $signed((!wire43))) ^ wire51[(1'h0):(1'h0)]));
  assign wire54 = $unsigned(wire44);
  assign wire55 = $signed({wire52[(4'h8):(3'h4)]});
  assign wire56 = $unsigned($signed($signed(((-wire48) >> wire55))));
  assign wire57 = (^~$signed((wire43 ? $unsigned($signed(wire49)) : wire44)));
  assign wire58 = $unsigned($signed($signed($unsigned($unsigned(wire53)))));
  assign wire59 = ((~^wire58) ?
                      wire56[(3'h7):(3'h4)] : (+$signed(wire53[(3'h4):(2'h3)])));
endmodule
