module top
#(parameter param215 = ((({((8'h9d) ? (8'h9e) : (8'ha2))} ? ((!(8'hbd)) >>> {(8'h9c), (8'hb4)}) : (~|(8'haf))) != ((((7'h41) ? (8'hbb) : (8'ha8)) != ((8'hb3) ? (8'ha0) : (8'hbb))) ? (8'h9e) : ((&(8'ha7)) < ((8'hba) ? (8'ha7) : (8'hab))))) * ({(((8'ha5) ? (8'ha2) : (8'hbf)) < (8'hb9))} ~^ {{(|(8'hb7)), (~&(8'hb1))}})), 
parameter param216 = (({((param215 ? param215 : param215) ? {param215} : param215), (((8'hb9) ? (8'hb2) : (8'hbe)) | (param215 <<< param215))} ? ((param215 >>> (^~(8'ha9))) > (~^{param215, (8'hb7)})) : (~|(^((8'hb8) ? param215 : param215)))) ? ((&(8'hb8)) < ({(~&param215)} ? ((param215 ? param215 : param215) && param215) : (7'h43))) : ((~|((!(8'ha1)) ^ (param215 || param215))) + (((~^param215) <<< ((8'h9d) ? param215 : (8'hae))) ? param215 : param215))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h30f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire214;
  wire signed [(5'h11):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire153;
  wire [(2'h3):(1'h0)] wire186;
  wire [(3'h4):(1'h0)] wire187;
  wire [(4'hf):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire199;
  wire signed [(5'h13):(1'h0)] wire203;
  wire signed [(4'hd):(1'h0)] wire204;
  wire signed [(5'h13):(1'h0)] wire205;
  wire [(4'hc):(1'h0)] wire206;
  wire signed [(4'hf):(1'h0)] wire207;
  wire [(2'h3):(1'h0)] wire209;
  wire [(4'hf):(1'h0)] wire210;
  wire signed [(4'he):(1'h0)] wire211;
  wire signed [(5'h13):(1'h0)] wire212;
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg160 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg163 = (1'h0);
  reg [(5'h12):(1'h0)] reg164 = (1'h0);
  reg [(5'h15):(1'h0)] reg165 = (1'h0);
  reg [(4'h8):(1'h0)] reg166 = (1'h0);
  reg signed [(4'he):(1'h0)] reg167 = (1'h0);
  reg [(4'h8):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg174 = (1'h0);
  reg [(5'h11):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg178 = (1'h0);
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg185 = (1'h0);
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg [(2'h2):(1'h0)] reg190 = (1'h0);
  reg [(4'he):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg193 = (1'h0);
  reg [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg198 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg200 = (1'h0);
  reg [(5'h11):(1'h0)] reg201 = (1'h0);
  reg [(5'h12):(1'h0)] reg202 = (1'h0);
  assign y = {wire214,
                 wire151,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire153,
                 wire186,
                 wire187,
                 wire188,
                 wire199,
                 wire203,
                 wire204,
                 wire205,
                 wire206,
                 wire207,
                 wire209,
                 wire210,
                 wire211,
                 wire212,
                 reg154,
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
                 reg173,
                 reg174,
                 reg175,
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
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg200,
                 reg201,
                 reg202,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = $signed(((&wire1[(1'h0):(1'h0)]) ?
                     ({$signed(wire1)} == $signed($signed(wire3))) : ((~wire2[(2'h3):(2'h3)]) ?
                         ($unsigned(wire4) ?
                             (~wire0) : (wire1 ?
                                 wire0 : wire3)) : {wire4[(3'h7):(2'h2)],
                             $signed((8'h9c))})));
  assign wire6 = $signed((wire5[(5'h13):(3'h5)] ?
                     (~wire1[(4'ha):(2'h3)]) : ((~((8'h9d) <<< wire3)) && {(wire1 || wire5),
                         (8'h9e)})));
  assign wire7 = wire2[(3'h5):(3'h5)];
  module8 #() modinst152 (.wire11(wire3), .wire9(wire0), .y(wire151), .wire12(wire6), .wire13(wire2), .wire10(wire4), .clk(clk));
  assign wire153 = {wire7, (^(-wire3))};
  always
    @(posedge clk) begin
      if ($unsigned((-(~wire151))))
        begin
          if ($signed({wire3[(5'h11):(4'hf)]}))
            begin
              reg154 <= wire2;
              reg155 <= wire2;
              reg156 <= (((8'hab) ?
                  $signed($unsigned($signed(wire153))) : $unsigned(($unsigned((7'h41)) >>> $unsigned(wire153)))) != (({$signed((8'haa)),
                      (|(8'ha7))} != $signed((wire3 & wire7))) ?
                  $unsigned($signed($unsigned(wire0))) : $unsigned($signed((~wire0)))));
              reg157 <= (+wire1);
            end
          else
            begin
              reg154 <= $signed(((wire151[(4'hc):(4'h8)] ?
                  (8'hb7) : wire153) <<< ((&reg157[(3'h7):(1'h1)]) && $unsigned($signed(wire7)))));
              reg155 <= $signed(reg154[(4'hf):(3'h4)]);
              reg156 <= (wire151 <<< wire4[(4'h9):(3'h6)]);
            end
          if ($signed($signed({wire153,
              (wire153[(2'h2):(1'h1)] ?
                  $unsigned((8'ha9)) : $signed(wire153))})))
            begin
              reg158 <= ($signed(wire5[(5'h10):(4'hd)]) * ((-(~wire4)) ?
                  $unsigned(reg156) : $signed((wire151[(1'h0):(1'h0)] ?
                      wire1[(4'h8):(3'h6)] : (wire2 <<< wire7)))));
              reg159 <= $signed(wire2);
              reg160 <= $signed({{reg156},
                  $unsigned((^~((7'h42) ? (8'hb7) : wire4)))});
              reg161 <= $unsigned($signed($unsigned(wire153)));
              reg162 <= ((|(&($unsigned(reg155) ^~ (8'hbe)))) | reg158);
            end
          else
            begin
              reg158 <= ({((((8'hb2) ? wire3 : wire3) ?
                              $signed((8'hb6)) : {reg161}) ?
                          reg157 : ($unsigned(reg162) >>> {wire151, reg159})),
                      ((|wire6) ? (!wire7) : (wire6 & ((8'ha4) | (8'hb1))))} ?
                  reg161[(1'h0):(1'h0)] : $unsigned(wire3));
              reg159 <= (~|$signed((reg162[(1'h1):(1'h1)] ?
                  reg154 : (|$unsigned(reg154)))));
              reg160 <= wire0[(1'h1):(1'h0)];
              reg161 <= $signed({({{(8'had), wire5}, (~|wire0)} ?
                      $signed(wire151) : $unsigned($signed(reg159)))});
              reg162 <= wire0;
            end
          reg163 <= $signed(reg162[(1'h1):(1'h1)]);
          reg164 <= $unsigned($unsigned((8'hb7)));
        end
      else
        begin
          reg154 <= reg160[(3'h6):(1'h1)];
          if (wire3[(4'hf):(1'h0)])
            begin
              reg155 <= wire6;
            end
          else
            begin
              reg155 <= reg159[(2'h3):(2'h2)];
            end
          reg156 <= $unsigned(reg162);
          reg157 <= $unsigned((wire3 || $signed((!$unsigned((8'hb8))))));
          if (reg158[(4'h9):(4'h9)])
            begin
              reg158 <= (wire3 ?
                  $unsigned($signed((~^(reg155 ?
                      wire153 : (7'h40))))) : {(wire151 ^ $signed((reg157 ?
                          wire153 : reg159)))});
              reg159 <= ({(~&reg163)} ?
                  (($signed(wire0[(3'h5):(3'h5)]) ?
                          $unsigned((reg160 ?
                              (8'h9f) : wire3)) : reg155[(2'h2):(1'h0)]) ?
                      wire5 : wire1[(4'h9):(4'h9)]) : reg161);
              reg160 <= (!(reg163[(1'h0):(1'h0)] * (reg154[(4'hf):(4'ha)] > {$unsigned(reg162),
                  $unsigned(wire6)})));
              reg161 <= $unsigned((wire4[(4'hd):(1'h0)] | ((^(reg155 >= (8'hab))) <<< $signed($signed(reg162)))));
              reg162 <= $signed(((^~$signed((wire2 ? wire151 : reg161))) ?
                  $signed((wire5[(3'h5):(1'h1)] ?
                      $unsigned(wire5) : reg159)) : {{$unsigned(reg164)},
                      reg157[(3'h5):(2'h2)]}));
            end
          else
            begin
              reg158 <= (reg164 ?
                  wire2 : (~(!$unsigned(wire4[(4'hd):(4'hc)]))));
            end
        end
      if (($unsigned($unsigned($signed((wire4 ? wire151 : reg160)))) ?
          (~({reg163} * $unsigned($unsigned(wire4)))) : $unsigned($unsigned($signed($unsigned(wire5))))))
        begin
          reg165 <= ($signed($signed($unsigned(reg159[(2'h3):(2'h2)]))) == wire2);
          reg166 <= ((~&(reg159[(3'h7):(3'h5)] ?
                  $signed((reg155 & (7'h40))) : ({reg158} <= reg155))) ?
              {(((reg157 ? wire2 : reg164) ^ $signed(reg162)) ?
                      (wire0[(2'h3):(2'h2)] ?
                          (~|reg157) : (reg161 ^~ (8'hae))) : {reg160[(2'h2):(1'h0)],
                          $unsigned((7'h41))}),
                  ($unsigned($unsigned(wire3)) ?
                      reg156 : $unsigned(reg154[(1'h0):(1'h0)]))} : (+wire4[(1'h1):(1'h1)]));
        end
      else
        begin
          if (reg154[(4'hc):(1'h1)])
            begin
              reg165 <= wire1;
              reg166 <= $unsigned(((^~(~|$unsigned((8'hba)))) ?
                  $signed(wire6[(2'h2):(1'h0)]) : $unsigned(($signed(wire2) ?
                      $signed(wire4) : $unsigned(reg166)))));
              reg167 <= $signed($signed($signed(($signed(reg164) ?
                  reg158 : (-reg155)))));
              reg168 <= (&$signed((!((reg163 ? (8'ha4) : (8'hb2)) ?
                  (reg160 <= reg164) : $signed((8'ha1))))));
              reg169 <= $unsigned(reg161);
            end
          else
            begin
              reg165 <= wire5[(3'h6):(1'h1)];
              reg166 <= (($unsigned($unsigned($unsigned(reg168))) || ($unsigned(((8'hbe) != reg159)) ?
                  wire5[(2'h3):(1'h1)] : (!(^~reg157)))) > wire4);
              reg167 <= ({(($unsigned(reg165) ^ $unsigned(reg163)) ?
                          reg169[(4'h8):(3'h5)] : $signed(wire1[(4'h9):(3'h7)]))} ?
                  (|(^wire4)) : $signed($unsigned({(reg161 + wire5)})));
            end
          if ($unsigned((-reg158[(1'h1):(1'h0)])))
            begin
              reg170 <= ((reg168 ^ wire4[(4'hd):(4'hb)]) ?
                  ($signed((^wire2[(4'h8):(2'h2)])) ?
                      $unsigned(reg169) : (^wire4)) : ((~^reg165[(5'h12):(4'h9)]) ~^ {(|$signed(wire4)),
                      {(reg168 ? reg167 : wire5)}}));
              reg171 <= $signed({wire1});
              reg172 <= ({{(~&wire2),
                      (~&(|reg158))}} - {$signed($signed($signed(reg166))),
                  (~|(^~(reg171 > wire3)))});
              reg173 <= {wire4};
              reg174 <= (~$signed((wire1 ^ reg165)));
            end
          else
            begin
              reg170 <= ($unsigned($signed(($signed(reg173) <<< $unsigned(wire4)))) ?
                  (+$unsigned($unsigned($unsigned((8'ha3))))) : reg156);
            end
          reg175 <= $unsigned((reg158 ?
              reg160[(5'h11):(2'h3)] : $signed((&$unsigned(reg166)))));
          reg176 <= $signed((~&{$unsigned($signed(reg155)),
              $unsigned({(8'hbb)})}));
        end
      reg177 <= (8'hab);
      if (((!(wire151[(4'h9):(3'h6)] | reg173[(5'h12):(5'h11)])) < $signed($signed(reg169[(5'h12):(2'h2)]))))
        begin
          reg178 <= (({$signed((reg157 ? reg163 : reg171))} ?
              ($unsigned($signed((8'ha7))) ?
                  $unsigned($signed(wire6)) : ((8'ha6) >= wire6[(4'hc):(3'h4)])) : (8'hac)) >= reg154);
          if (((|reg174[(4'he):(4'h8)]) + (-((reg173[(4'h8):(3'h6)] <<< reg169) >> $unsigned($signed(wire151))))))
            begin
              reg179 <= $unsigned($signed((reg157[(3'h7):(3'h6)] ?
                  $unsigned(reg165) : ({reg176,
                      wire2} & reg167[(1'h0):(1'h0)]))));
              reg180 <= (&((&(wire2[(4'hb):(3'h7)] ?
                  (|wire6) : (wire0 ?
                      reg174 : reg158))) == $signed(wire3[(5'h11):(4'hc)])));
              reg181 <= $unsigned($unsigned((reg170[(2'h2):(1'h0)] - $unsigned($unsigned((8'hbd))))));
            end
          else
            begin
              reg179 <= $signed(reg160);
              reg180 <= $unsigned(reg156);
              reg181 <= {((reg157 ?
                          ({reg176} ?
                              $signed(reg176) : $unsigned((8'ha5))) : (reg167 & ((7'h43) <= reg169))) ?
                      $unsigned({(reg156 >>> reg166),
                          reg170}) : {{$unsigned(reg165), $unsigned(reg156)},
                          (reg158[(4'hc):(3'h5)] ? reg155 : {wire6, wire0})})};
              reg182 <= reg175[(4'hb):(3'h6)];
            end
          reg183 <= reg154[(1'h1):(1'h1)];
          reg184 <= $unsigned(($unsigned(($signed(reg163) != (reg155 && reg176))) <= ({{reg181},
                  wire7[(1'h1):(1'h1)]} ?
              $unsigned($unsigned(reg154)) : ($signed(reg167) ?
                  $signed(reg156) : $signed((8'hbe))))));
        end
      else
        begin
          reg178 <= {reg155};
          if ((({$signed($signed((8'hb1)))} & wire151) ?
              $signed($unsigned($signed($unsigned(reg160)))) : $unsigned((($unsigned(reg181) & (8'hb7)) | (^~((8'haa) ?
                  wire151 : reg177))))))
            begin
              reg179 <= {$signed($unsigned(reg179[(4'h9):(4'h9)]))};
              reg180 <= $unsigned(wire4[(4'h9):(4'h9)]);
              reg181 <= wire151;
              reg182 <= (wire0 ?
                  $signed((&($unsigned(reg172) && {reg180,
                      wire3}))) : $signed($signed(((wire153 ?
                      wire153 : reg183) ~^ $signed((8'haa))))));
              reg183 <= (&(~$signed(wire4[(4'hd):(4'hc)])));
            end
          else
            begin
              reg179 <= (^(reg160 << {((reg184 ? reg166 : reg173) ?
                      reg155 : (wire6 != reg180))}));
              reg180 <= (~|(reg169 > $signed($unsigned((^(8'hbd))))));
            end
          reg184 <= ($signed($signed($unsigned((reg166 <= reg177)))) >= $unsigned(reg157));
        end
      reg185 <= (~&(+(^$unsigned($signed(reg165)))));
    end
  assign wire186 = (|reg176);
  assign wire187 = {$signed((~|($unsigned(reg179) > (reg172 - (8'hb3))))),
                       (|{$signed($unsigned(wire7))})};
  assign wire188 = (!{{reg185[(4'hb):(3'h4)]},
                       $signed($signed($unsigned(reg177)))});
  always
    @(posedge clk) begin
      if ($signed((7'h44)))
        begin
          reg189 <= $signed($signed(reg178[(4'h8):(2'h3)]));
          reg190 <= $signed((^~(-$unsigned((reg165 ? reg182 : reg167)))));
          reg191 <= (((~&$unsigned(reg177)) <<< ((^~(reg170 ?
                  reg156 : reg158)) ?
              $unsigned($signed(reg167)) : reg168)) >>> $unsigned(reg178));
          if (reg156[(1'h1):(1'h1)])
            begin
              reg192 <= wire6[(3'h6):(3'h4)];
              reg193 <= ((|$unsigned($unsigned((reg178 >>> reg169)))) == $unsigned({reg163[(4'hf):(4'hc)]}));
            end
          else
            begin
              reg192 <= $unsigned(wire153[(1'h0):(1'h0)]);
              reg193 <= reg184[(4'h8):(2'h2)];
            end
        end
      else
        begin
          reg189 <= ($unsigned({$signed((reg170 < reg179)),
              {$signed((8'h9e)), (~&reg172)}}) >> (~|(+{(reg189 ^~ (7'h44))})));
          reg190 <= {reg173[(4'hc):(1'h1)]};
          reg191 <= (|reg175);
          reg192 <= {$signed((^~$signed(reg172[(3'h4):(1'h1)])))};
          reg193 <= reg160;
        end
      if ((~|$unsigned((reg191[(1'h1):(1'h0)] ?
          ($signed(wire151) < (^~reg181)) : $unsigned((|(8'hb2)))))))
        begin
          reg194 <= (~|(&reg162));
          if (($signed($signed($unsigned((wire153 ? reg158 : (8'ha2))))) ?
              $unsigned({$signed((reg183 ? reg170 : reg168)),
                  $unsigned((reg167 <= reg171))}) : wire151))
            begin
              reg195 <= reg192;
              reg196 <= (8'ha5);
            end
          else
            begin
              reg195 <= $unsigned(reg192);
              reg196 <= $unsigned($unsigned((^(!$unsigned(wire188)))));
              reg197 <= (-$signed(((wire4[(4'ha):(4'h9)] || $signed(reg164)) >= (wire188[(4'hc):(1'h0)] != (reg175 ?
                  reg190 : (8'ha7))))));
            end
          reg198 <= ((reg159 ?
                  wire187[(1'h0):(1'h0)] : (!({reg165, reg195} ?
                      reg180 : {(8'hbd)}))) ?
              $unsigned($unsigned($signed(((8'hb0) > reg178)))) : reg194);
        end
      else
        begin
          reg194 <= ($signed(reg156) ? (|wire6) : reg183);
        end
    end
  assign wire199 = $unsigned(reg179[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg200 <= ((($unsigned({wire5, reg156}) ?
                  (~$signed(wire1)) : (~|$unsigned(reg195))) ?
              $signed((|$unsigned((8'had)))) : reg167) ?
          (^~$unsigned(({wire153, reg166} ?
              reg190[(1'h0):(1'h0)] : (!wire153)))) : {wire7,
              $unsigned((8'ha8))});
      reg201 <= wire199[(1'h0):(1'h0)];
      reg202 <= $signed((|$unsigned({(^wire199)})));
    end
  assign wire203 = reg180;
  assign wire204 = reg169[(4'he):(2'h3)];
  assign wire205 = $unsigned(reg196[(4'h8):(3'h6)]);
  assign wire206 = $unsigned($unsigned((8'haa)));
  module15 #() modinst208 (.wire17(reg178), .wire18(wire204), .clk(clk), .wire19(reg196), .y(wire207), .wire20(reg163), .wire16(wire203));
  assign wire209 = reg164[(5'h11):(3'h6)];
  assign wire210 = reg167[(4'ha):(3'h7)];
  assign wire211 = (reg191[(4'he):(3'h4)] ^ {$signed($signed((wire199 + (8'hbb)))),
                       (+$unsigned({wire206}))});
  module15 #() modinst213 (wire212, clk, reg193, reg177, reg181, reg195, wire4);
  assign wire214 = $unsigned(reg162[(1'h0):(1'h0)]);
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire149;
  wire [(2'h2):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire147;
  wire signed [(4'ha):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire145;
  wire signed [(4'hb):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire138;
  wire [(5'h13):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire136;
  wire [(5'h10):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire43;
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire120,
                 wire61,
                 wire60,
                 wire58,
                 wire14,
                 wire43,
                 reg139,
                 (1'h0)};
  assign wire14 = (8'ha5);
  module15 #() modinst44 (.wire17(wire9), .wire16(wire12), .y(wire43), .wire20(wire10), .wire19(wire14), .wire18(wire13), .clk(clk));
  module45 #() modinst59 (.y(wire58), .wire46(wire12), .clk(clk), .wire49(wire43), .wire47(wire11), .wire48(wire14));
  assign wire60 = (|(((8'h9c) ?
                          ((-wire58) && wire13) : {(^wire12),
                              ((8'h9e) ? wire43 : wire12)}) ?
                      ((wire14[(1'h1):(1'h1)] | wire10[(1'h1):(1'h0)]) + wire11[(4'hb):(4'hb)]) : (~&($unsigned(wire14) ?
                          wire12[(1'h0):(1'h0)] : {wire10, wire12}))));
  assign wire61 = (~&wire43[(1'h0):(1'h0)]);
  module62 #() modinst121 (wire120, clk, wire43, wire13, wire60, wire61);
  module122 #() modinst134 (.y(wire133), .wire126(wire120), .wire124(wire14), .wire123(wire61), .wire125(wire10), .clk(clk));
  assign wire135 = ((|(wire12[(4'h8):(3'h7)] ?
                           wire133 : ({wire14} > $unsigned(wire12)))) ?
                       {((wire13[(4'h8):(3'h5)] ?
                                   (~^wire60) : $unsigned((8'ha0))) ?
                               $signed(wire13[(4'h8):(3'h4)]) : ($unsigned(wire9) >= $signed(wire11))),
                           (wire9 ?
                               ((wire43 + wire9) ?
                                   $signed(wire13) : wire133) : (wire133 ?
                                   wire60[(1'h0):(1'h0)] : (wire120 ?
                                       (8'hb8) : wire9)))} : (wire60[(1'h0):(1'h0)] > $signed((wire12 ?
                           (~wire13) : $signed((8'hbd))))));
  assign wire136 = (^(wire9[(2'h2):(1'h0)] ?
                       (8'hb2) : (~&$unsigned((~^wire10)))));
  assign wire137 = $signed(wire135);
  assign wire138 = wire13[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg139 <= wire120[(4'hc):(2'h3)];
    end
  assign wire140 = (~$signed((wire61 ^~ $signed((wire138 ? reg139 : wire10)))));
  assign wire141 = {(!$signed((-{wire133, (8'hb2)}))), (8'h9c)};
  assign wire142 = $signed(wire140);
  assign wire143 = (wire61[(3'h5):(2'h2)] ?
                       $unsigned({{(8'ha0)}}) : ($unsigned({(wire12 ?
                               wire120 : wire142)}) || $unsigned((wire141[(4'h8):(3'h6)] >= wire14))));
  assign wire144 = $unsigned($unsigned(wire138));
  assign wire145 = wire136[(2'h3):(1'h1)];
  assign wire146 = ((wire135 ^~ (!(~|(wire60 != wire58)))) ?
                       (&wire144) : ((~|wire140[(2'h3):(2'h3)]) | $unsigned(($signed(wire120) ?
                           (8'hbb) : $signed(wire60)))));
  assign wire147 = ($signed($unsigned(wire12)) * wire13[(3'h7):(3'h5)]);
  assign wire148 = $unsigned((&{(wire141[(3'h7):(3'h6)] || wire61[(3'h6):(1'h1)]),
                       {wire137[(4'hc):(4'h8)]}}));
  assign wire149 = (-$signed((8'ha3)));
  assign wire150 = (~wire146);
endmodule

module module122
#(parameter param131 = (~(~(-(-(8'hae))))), 
parameter param132 = (({((8'ha8) + ((8'hbc) ? param131 : param131))} << param131) ? ({((~^param131) + (param131 ? param131 : param131)), ((|param131) ^~ (param131 & param131))} ~^ param131) : (((8'hba) + param131) || param131)))
(y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire126;
  input wire [(2'h3):(1'h0)] wire125;
  input wire signed [(4'ha):(1'h0)] wire124;
  input wire signed [(3'h5):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  assign y = {wire130, wire129, wire128, wire127, (1'h0)};
  assign wire127 = wire125;
  assign wire128 = wire125;
  assign wire129 = wire128;
  assign wire130 = ($unsigned($signed($unsigned((&wire124)))) << (~wire129));
endmodule

module module62
#(parameter param118 = ({{(-(^~(8'ha3)))}, ((!{(8'hae), (7'h44)}) <<< {(!(8'ha3))})} ? {{(8'ha9), (!((8'hb6) ? (8'hbf) : (7'h43)))}, {(-((8'ha4) & (8'hb9)))}} : {(~|{{(8'hbf)}, (!(8'hbb))}), (~|{((8'had) ? (8'had) : (8'haf)), {(8'hb8)}})}), 
parameter param119 = ((~^(+((param118 | param118) >>> (param118 >>> (8'ha7))))) ? ((|{(param118 != (8'ha8)), (param118 ^~ param118)}) | ((~|{(8'hb4), (8'ha5)}) ? (~|(8'h9c)) : (!(param118 ^ param118)))) : ({(&(param118 ? param118 : param118)), ((param118 || param118) || (^param118))} ? {(7'h40), ((!(8'ha5)) < (param118 * param118))} : ((^~(param118 <<< param118)) ? param118 : (8'haa)))))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h25a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire66;
  input wire signed [(2'h3):(1'h0)] wire65;
  input wire signed [(5'h14):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  assign y = {wire117,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire80,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
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
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire67 = $unsigned((8'hb8));
  assign wire68 = $unsigned((!($signed(wire65) ?
                      wire64[(4'hc):(2'h3)] : (-(|(8'hb2))))));
  assign wire69 = (~|{{($unsigned(wire63) ? $signed(wire64) : wire68)}});
  assign wire70 = ($signed($signed($signed((wire68 >>> wire65)))) - wire67[(3'h6):(3'h5)]);
  assign wire71 = (^wire66);
  assign wire72 = (wire65 ^ wire67[(4'he):(4'ha)]);
  assign wire73 = (((wire68 ?
                          {{wire68, wire69},
                              (wire65 || wire72)} : wire71[(5'h11):(4'h8)]) ?
                      $signed((wire63 ^ (wire68 * wire68))) : wire63) * ((+$signed((wire72 + (8'hb5)))) ?
                      (((-wire67) ?
                          (!wire65) : (wire72 ?
                              wire67 : (8'hba))) - $signed(wire66[(2'h2):(2'h2)])) : (8'hb8)));
  assign wire74 = ($signed({($signed(wire69) + (wire63 ? (8'hba) : wire64))}) ?
                      (8'hae) : (8'ha2));
  always
    @(posedge clk) begin
      reg75 <= wire73[(4'hd):(4'ha)];
      reg76 <= (wire63 > $signed($unsigned(wire70[(5'h14):(1'h1)])));
      reg77 <= {$unsigned($signed((reg75 != wire66[(2'h2):(1'h0)])))};
      reg78 <= (wire72[(3'h6):(3'h6)] ?
          (7'h44) : ((~&(^$signed((8'hb8)))) ?
              wire66[(4'he):(4'hc)] : wire73[(2'h3):(1'h1)]));
      reg79 <= (~|(((reg75 && $unsigned(reg75)) ?
              $signed((wire74 > wire71)) : (wire69[(3'h6):(3'h4)] == (^(8'hb7)))) ?
          wire69 : $signed($signed(wire68))));
    end
  assign wire80 = $signed(({$unsigned(wire71[(2'h2):(1'h0)])} == {($signed(reg77) ~^ (reg75 ?
                          wire63 : reg76))}));
  always
    @(posedge clk) begin
      if ((8'ha4))
        begin
          if (reg75)
            begin
              reg81 <= {reg79};
              reg82 <= wire70[(5'h12):(3'h6)];
              reg83 <= $unsigned(reg81);
              reg84 <= (~&(^(((reg82 != (8'h9f)) != (~^reg83)) ?
                  (!((8'hb7) ? reg78 : reg78)) : $signed(wire64))));
            end
          else
            begin
              reg81 <= $signed((reg79[(3'h4):(1'h0)] <<< ($unsigned((8'h9f)) > $signed($unsigned(wire69)))));
              reg82 <= $unsigned((8'ha1));
            end
          reg85 <= (-reg79[(3'h6):(2'h3)]);
        end
      else
        begin
          reg81 <= $signed(wire68[(2'h2):(1'h1)]);
        end
      reg86 <= $signed(($signed((+(wire68 <= (8'ha6)))) ?
          $unsigned(((reg78 + reg78) ?
              (wire67 ? wire70 : wire80) : {(7'h40),
                  (8'hb3)})) : $signed({$unsigned((8'hba)),
              wire67[(4'hb):(3'h7)]})));
      reg87 <= reg81;
      reg88 <= (reg87 == ({reg86[(3'h7):(3'h4)]} >= (8'ha0)));
    end
  assign wire89 = ((reg77 ?
                          (wire68 ?
                              (((8'hb5) ?
                                  wire68 : reg75) >>> (~(8'hbd))) : (^~wire66[(4'he):(4'ha)])) : $unsigned($signed($signed(reg82)))) ?
                      ((^{$signed((8'hb4))}) ?
                          (reg76[(3'h5):(1'h0)] && ($unsigned(reg76) ^~ ((8'hbc) > wire65))) : $signed(((^~reg79) ?
                              wire71[(4'ha):(3'h5)] : (8'hbe)))) : $unsigned(($signed($signed(reg82)) ~^ (!{wire63}))));
  assign wire90 = (wire67[(3'h7):(1'h0)] | reg84);
  assign wire91 = $unsigned($unsigned(wire69[(3'h4):(1'h1)]));
  assign wire92 = $unsigned(reg87[(1'h0):(1'h0)]);
  assign wire93 = $unsigned($signed(((wire90 ? wire89[(4'hb):(3'h4)] : reg78) ?
                      wire69 : {(reg81 ~^ reg87), $signed(reg88)})));
  assign wire94 = wire92[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg95 <= (((!(8'hb6)) <<< $signed($unsigned(wire67[(3'h5):(3'h5)]))) ?
          (~|{reg88[(3'h7):(1'h0)], $signed($signed((8'ha9)))}) : (8'ha4));
      reg96 <= wire93;
      if (reg79[(2'h2):(2'h2)])
        begin
          reg97 <= {(wire72 ?
                  $signed(reg81[(3'h5):(2'h2)]) : {wire74[(1'h0):(1'h0)]})};
          reg98 <= (^reg86);
          if (reg82[(1'h1):(1'h0)])
            begin
              reg99 <= ({(wire93 >>> (8'hbd)),
                      ({$unsigned(wire66)} || $unsigned(reg97))} ?
                  wire72 : $unsigned(wire73));
              reg100 <= wire91;
            end
          else
            begin
              reg99 <= $signed($unsigned(wire69));
              reg100 <= wire89;
            end
          reg101 <= $signed(reg79[(2'h2):(2'h2)]);
        end
      else
        begin
          reg97 <= ({$signed(($unsigned(reg96) <= $signed(wire72)))} ?
              {(-$signed({reg75, wire94}))} : $unsigned((({(7'h41)} ?
                  $unsigned(reg82) : (reg82 >> wire74)) >= $unsigned(reg88))));
          reg98 <= (wire72[(4'h8):(1'h1)] ? $signed(reg84) : (8'h9e));
          reg99 <= $unsigned(wire90[(4'ha):(2'h3)]);
          if (wire74[(3'h5):(2'h3)])
            begin
              reg100 <= ($signed({$signed((wire65 + wire64))}) ?
                  reg81 : wire89[(2'h3):(1'h1)]);
              reg101 <= wire67[(4'ha):(3'h5)];
            end
          else
            begin
              reg100 <= (!wire65);
              reg101 <= ((^~$signed({$unsigned(reg85)})) && $signed($signed((~|(wire92 != wire80)))));
            end
          reg102 <= $unsigned($unsigned(wire71));
        end
      if ((wire68 ?
          wire92 : ($signed(($unsigned(reg87) ^~ $signed(reg82))) ?
              ((^(reg102 ?
                  wire89 : (8'hb1))) + reg85[(5'h10):(3'h5)]) : wire89[(4'h8):(2'h2)])))
        begin
          if ((~&{$signed($unsigned(reg85[(1'h1):(1'h0)]))}))
            begin
              reg103 <= ({(reg98 || {$signed((8'ha4))})} ?
                  wire74 : (|(~^((|reg84) | $unsigned(wire90)))));
              reg104 <= reg84;
              reg105 <= (wire73 ^ ($signed((^wire67)) && wire69[(3'h4):(2'h2)]));
              reg106 <= wire80[(3'h6):(1'h1)];
              reg107 <= wire63;
            end
          else
            begin
              reg103 <= ($signed(($signed($signed(reg84)) ?
                      reg76 : (wire72 ^~ reg97[(3'h5):(1'h1)]))) ?
                  $unsigned(reg101[(3'h5):(3'h5)]) : {(8'hb2)});
              reg104 <= (~&reg106[(4'he):(4'ha)]);
              reg105 <= (reg106 ?
                  {$signed((+{wire74, reg104})),
                      ({wire65[(1'h0):(1'h0)]} | reg101[(5'h11):(5'h11)])} : (8'ha0));
              reg106 <= $signed(reg102);
            end
          if ((reg78[(3'h5):(3'h5)] && reg81))
            begin
              reg108 <= reg76;
              reg109 <= ($unsigned($signed($signed(wire90[(3'h5):(1'h0)]))) ?
                  $signed({{$unsigned(reg105)}}) : {$signed(((wire91 - reg98) ?
                          (wire91 * (8'ha3)) : reg105[(3'h4):(2'h2)]))});
              reg110 <= ((~(&(-$unsigned(reg84)))) & reg105);
              reg111 <= $unsigned(((wire89[(3'h4):(1'h1)] ?
                  wire67[(4'he):(3'h6)] : reg75) + reg105));
            end
          else
            begin
              reg108 <= $unsigned(wire66[(4'hc):(3'h5)]);
              reg109 <= (^((reg110 ^~ (~&(~&wire73))) != ($unsigned($unsigned(reg78)) >= (^~(|reg101)))));
            end
          reg112 <= ((~reg86[(1'h0):(1'h0)]) == reg104[(1'h1):(1'h1)]);
        end
      else
        begin
          if ($signed(((~$signed((reg84 >>> wire71))) ?
              $signed($unsigned($signed(wire65))) : wire71[(4'hb):(4'hb)])))
            begin
              reg103 <= {wire65[(1'h1):(1'h1)], reg86[(2'h2):(1'h1)]};
              reg104 <= (reg111 >= $unsigned($unsigned((~|(|reg75)))));
            end
          else
            begin
              reg103 <= (((reg111 ?
                  reg97 : ($unsigned(wire73) ?
                      $unsigned(reg102) : reg85[(3'h4):(3'h4)])) < $unsigned($unsigned($unsigned(reg100)))) <<< (&reg75[(2'h2):(2'h2)]));
              reg104 <= $signed(reg98[(1'h0):(1'h0)]);
              reg105 <= (^wire72);
            end
        end
    end
  always
    @(posedge clk) begin
      if ((reg86 ?
          wire91 : $unsigned({$unsigned((reg75 - (8'hb7))),
              ((~|reg76) * ((8'hb8) && reg87))})))
        begin
          if (reg76[(1'h1):(1'h1)])
            begin
              reg113 <= reg104[(3'h6):(1'h1)];
            end
          else
            begin
              reg113 <= {(|$signed(wire64[(2'h3):(1'h0)])),
                  wire92[(1'h0):(1'h0)]};
              reg114 <= reg99[(2'h2):(1'h1)];
              reg115 <= (|$signed($unsigned(reg85[(4'he):(3'h7)])));
            end
          reg116 <= reg100;
        end
      else
        begin
          reg113 <= ((^~(^~$unsigned((reg95 >>> reg75)))) < $unsigned({reg107}));
          reg114 <= (wire94[(2'h2):(1'h1)] ?
              wire92[(2'h2):(1'h1)] : wire68[(3'h5):(3'h5)]);
          if ({(($unsigned(((8'ha5) >>> reg85)) ?
                      ((reg84 ? reg114 : reg84) & {wire63,
                          wire80}) : wire66[(5'h10):(3'h5)]) ?
                  {reg76, wire93} : (|$signed(wire90))),
              (wire67[(3'h6):(3'h5)] >>> $unsigned($signed((reg103 >= (8'hb7)))))})
            begin
              reg115 <= $unsigned((wire69 ^ (8'ha2)));
              reg116 <= $signed(reg111[(1'h1):(1'h0)]);
            end
          else
            begin
              reg115 <= reg104[(4'hc):(3'h4)];
            end
        end
    end
  assign wire117 = (^~reg116[(2'h3):(2'h3)]);
endmodule

module module45
#(parameter param57 = ((7'h40) ? ((8'h9c) < (((~&(8'ha5)) >>> (|(8'hba))) << (8'hac))) : {{(((8'ha7) & (8'h9f)) ? {(7'h43), (8'ha7)} : ((7'h41) <<< (7'h42)))}, ((((8'ha5) ? (8'hb1) : (8'hbb)) ? ((8'haa) ? (8'hbb) : (8'hb0)) : (|(8'haf))) + ({(8'hb5)} < {(8'hb8)}))}))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire49;
  input wire signed [(4'h9):(1'h0)] wire48;
  input wire [(3'h7):(1'h0)] wire47;
  input wire signed [(4'hb):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire56, wire51, wire50, reg55, reg54, reg53, reg52, (1'h0)};
  assign wire50 = wire48[(2'h3):(1'h0)];
  assign wire51 = wire47;
  always
    @(posedge clk) begin
      reg52 <= $signed(($signed((wire49 || wire50)) == {$signed($unsigned(wire50)),
          ((wire49 ? wire51 : (8'hac)) - $signed(wire49))}));
      reg53 <= wire49[(1'h1):(1'h1)];
      reg54 <= $signed((((^{wire47}) & $unsigned(wire49)) || wire50));
      reg55 <= {$signed($unsigned((|{wire46}))),
          {{$signed(wire50)}, {$unsigned((~|(8'h9e)))}}};
    end
  assign wire56 = {wire50[(3'h4):(1'h1)],
                      ((((wire50 ~^ wire50) ?
                              (^~reg52) : $signed(reg54)) ^ ({reg54} ~^ reg52)) ?
                          reg53 : reg53[(3'h7):(3'h4)])};
endmodule

module module15
#(parameter param41 = (({(&((8'hb4) >= (7'h44))), (~^(8'hbf))} * (((&(8'hb7)) > ((8'ha3) == (8'ha0))) + {(-(8'haf))})) ? (~^((8'h9d) ? (((8'hb2) < (8'hb0)) >= (8'haf)) : (((8'ha5) ? (8'h9d) : (7'h44)) ? ((8'hae) | (8'hb2)) : ((8'haf) ? (8'ha9) : (8'hbe))))) : (~&(^~((~&(8'hbc)) && (&(8'hab)))))), 
parameter param42 = param41)
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 wire21,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg23,
                 (1'h0)};
  assign wire21 = (wire19 ? wire19 : wire17[(2'h2):(1'h1)]);
  assign wire22 = wire18[(4'ha):(2'h2)];
  always
    @(posedge clk) begin
      reg23 <= wire20;
    end
  assign wire24 = ((wire22[(3'h7):(1'h0)] | wire19) ?
                      {$unsigned((^(wire21 ?
                              wire16 : wire20)))} : (((~^(wire17 ^ reg23)) | (8'ha4)) ?
                          $signed(((wire18 ? wire20 : wire16) ?
                              (wire17 ?
                                  wire16 : wire19) : (wire19 && wire17))) : $signed((&$unsigned(wire21)))));
  assign wire25 = $signed((&$unsigned(wire21)));
  assign wire26 = $signed($signed(wire24));
  assign wire27 = (($signed(($signed((7'h41)) ?
                              reg23[(4'h8):(3'h5)] : ((8'hb3) ?
                                  wire20 : wire22))) ?
                          $unsigned(((wire22 > wire24) << wire19)) : (!((wire20 ?
                              wire19 : (7'h43)) > wire22[(2'h3):(2'h3)]))) ?
                      wire22 : (wire18[(4'ha):(3'h5)] && $signed((wire24[(2'h2):(1'h1)] ?
                          (wire25 & wire21) : (wire26 ? wire17 : (8'hb6))))));
  assign wire28 = $signed(($signed({(~^(8'haa))}) == {$unsigned($unsigned(wire16))}));
  assign wire29 = ((wire21[(4'hb):(4'h9)] ~^ wire17[(1'h0):(1'h0)]) ?
                      $signed($unsigned(((wire20 ? wire26 : wire27) ?
                          $signed(reg23) : (wire28 < wire27)))) : ((7'h43) ?
                          $signed((|$signed(wire17))) : ((((8'ha1) ?
                              (8'hba) : (8'hb5)) == (wire22 >> wire28)) != $signed({wire16}))));
  always
    @(posedge clk) begin
      reg30 <= $unsigned($signed(wire25[(3'h5):(1'h1)]));
      reg31 <= {(!$signed((((8'ha9) - wire21) >> {wire25})))};
      reg32 <= (reg30 ? (!wire19[(2'h3):(2'h2)]) : $signed((~wire25)));
      reg33 <= {$unsigned($unsigned(wire22)), wire21[(5'h13):(4'h8)]};
      reg34 <= $unsigned(wire26);
    end
  assign wire35 = (~|wire22[(3'h7):(3'h4)]);
  assign wire36 = $unsigned((((!reg30) == wire22) || $signed((8'hb3))));
  assign wire37 = (7'h42);
  assign wire38 = $unsigned({$unsigned((wire20[(2'h3):(2'h3)] ?
                          wire19 : (^~(8'hb0)))),
                      $unsigned((+$signed(wire24)))});
  assign wire39 = $signed((+(|$unsigned($unsigned(reg23)))));
  assign wire40 = ($signed(reg23[(4'hf):(4'h9)]) ?
                      (wire27[(5'h10):(4'he)] ?
                          $unsigned($signed($unsigned(wire24))) : (~^{(&wire28),
                              wire19})) : ((|($signed((8'hbb)) ?
                              (reg33 && wire26) : (wire27 ? wire18 : wire24))) ?
                          $unsigned((wire29[(2'h2):(1'h0)] ?
                              reg30[(4'hd):(2'h3)] : $signed(wire24))) : wire36));
endmodule
