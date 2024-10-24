module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire216;
  wire signed [(5'h15):(1'h0)] wire215;
  wire [(5'h13):(1'h0)] wire214;
  wire signed [(4'hd):(1'h0)] wire213;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire211;
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire41,
                 wire6,
                 wire5,
                 wire4,
                 wire132,
                 wire134,
                 wire135,
                 wire211,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $unsigned((wire2 ?
                     ($unsigned((~|wire3)) ^ {wire2,
                         (~&wire1)}) : wire4[(4'ha):(3'h7)]));
  assign wire6 = {$unsigned((~^$unsigned((wire2 != wire3))))};
  module7 #() modinst42 (.wire12(wire5), .wire10(wire4), .y(wire41), .wire11(wire3), .wire8(wire0), .clk(clk), .wire9(wire6));
  module43 #() modinst133 (.y(wire132), .wire45(wire41), .clk(clk), .wire46(wire4), .wire44(wire5), .wire47(wire3));
  assign wire134 = ((($signed(wire0[(3'h6):(2'h2)]) >= (~&{(8'hb3), wire132})) ?
                           ($unsigned($unsigned(wire6)) ?
                               (~|(wire4 ?
                                   wire41 : wire132)) : (7'h41)) : (~&({wire5} ?
                               (+wire1) : wire6))) ?
                       (wire6 ?
                           (+wire5) : (wire0 ?
                               (-{(8'ha8),
                                   wire6}) : {(wire2 || wire2)})) : (~|($signed(wire5) ?
                           ((~|wire0) ^~ (wire3 ?
                               wire0 : wire4)) : ($signed(wire1) ?
                               (^~(8'hbc)) : wire3[(4'hc):(4'hb)]))));
  assign wire135 = ({$signed({(~^wire5)}),
                           (~|(wire2 ?
                               wire4[(1'h0):(1'h0)] : ((8'ha1) ?
                                   wire5 : (8'hbd))))} ?
                       $unsigned(((wire6 ?
                           wire5[(5'h15):(5'h10)] : (wire6 ?
                               wire4 : wire6)) == wire132)) : wire4[(4'hf):(3'h5)]);
  module136 #() modinst212 (.clk(clk), .wire141(wire3), .wire139(wire5), .y(wire211), .wire138(wire135), .wire137(wire4), .wire140(wire134));
  assign wire213 = ($signed(wire211) ?
                       $signed($signed((8'hb5))) : $signed({$signed($signed(wire3))}));
  assign wire214 = $signed(wire41[(4'ha):(3'h4)]);
  assign wire215 = (wire3[(4'ha):(4'h8)] ?
                       $signed($signed({(&wire211)})) : wire211[(1'h0):(1'h0)]);
  assign wire216 = (^~wire135[(3'h6):(2'h3)]);
endmodule

module module136  (y, clk, wire137, wire138, wire139, wire140, wire141);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire137;
  input wire [(5'h14):(1'h0)] wire138;
  input wire signed [(5'h12):(1'h0)] wire139;
  input wire [(5'h14):(1'h0)] wire140;
  input wire [(5'h12):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire210;
  wire signed [(4'h8):(1'h0)] wire197;
  wire [(5'h12):(1'h0)] wire196;
  wire [(3'h7):(1'h0)] wire142;
  wire signed [(5'h13):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire144;
  wire [(3'h7):(1'h0)] wire145;
  wire [(3'h7):(1'h0)] wire146;
  wire signed [(3'h7):(1'h0)] wire147;
  wire signed [(4'h8):(1'h0)] wire148;
  wire signed [(5'h15):(1'h0)] wire149;
  wire [(4'hf):(1'h0)] wire194;
  reg signed [(4'h8):(1'h0)] reg209 = (1'h0);
  reg [(4'hb):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg206 = (1'h0);
  reg [(4'hb):(1'h0)] reg205 = (1'h0);
  reg [(5'h13):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg203 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg [(5'h10):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg162 = (1'h0);
  assign y = {wire210,
                 wire197,
                 wire196,
                 wire142,
                 wire143,
                 wire144,
                 wire145,
                 wire146,
                 wire147,
                 wire148,
                 wire149,
                 wire194,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 (1'h0)};
  assign wire142 = $unsigned((8'ha4));
  assign wire143 = wire141;
  assign wire144 = {{(~^$signed((^wire139))), wire137}};
  assign wire145 = wire142[(2'h3):(1'h0)];
  assign wire146 = wire141[(4'he):(4'h9)];
  assign wire147 = (-wire143[(4'h9):(1'h0)]);
  assign wire148 = wire145;
  assign wire149 = (|{$unsigned(wire145[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      if ((8'hb4))
        begin
          reg150 <= wire141[(3'h5):(3'h4)];
          reg151 <= wire147;
        end
      else
        begin
          reg150 <= (8'hb9);
          if (((wire145[(3'h5):(2'h2)] ?
                  (~^($signed(wire146) <= {wire139,
                      (8'h9f)})) : $signed((&{reg151, wire141}))) ?
              wire143 : (-$signed(wire147[(1'h1):(1'h1)]))))
            begin
              reg151 <= $unsigned($signed((!wire142)));
            end
          else
            begin
              reg151 <= reg150;
            end
        end
      reg152 <= $unsigned((~((~$signed(wire145)) <<< wire141[(4'h9):(1'h1)])));
      reg153 <= (((^(~^$signed((8'hbe)))) + reg151[(3'h5):(2'h3)]) >= $unsigned(wire138[(2'h2):(1'h0)]));
      reg154 <= ((^{wire140[(5'h12):(5'h10)]}) ?
          wire145 : $unsigned($unsigned((~&$unsigned((8'ha3))))));
      if ({wire146, $signed(reg154)})
        begin
          reg155 <= reg154;
          reg156 <= {{$unsigned((|(^wire137))), wire147[(1'h1):(1'h1)]},
              $signed(($signed($signed(wire147)) ?
                  $unsigned((~&reg152)) : $unsigned((wire145 ?
                      wire144 : wire149))))};
          if ($unsigned($unsigned($signed($signed($unsigned(wire138))))))
            begin
              reg157 <= wire138[(2'h2):(1'h0)];
              reg158 <= (8'hbe);
              reg159 <= (+(wire140[(1'h0):(1'h0)] <= ($signed((reg154 ?
                      wire142 : wire148)) ?
                  {(reg154 && (8'hab))} : (8'haa))));
              reg160 <= wire140;
            end
          else
            begin
              reg157 <= (^~$signed(reg158));
              reg158 <= (8'hbe);
            end
          reg161 <= $signed($unsigned((wire147[(3'h6):(3'h4)] >> $unsigned((reg155 ^ wire146)))));
          reg162 <= wire139;
        end
      else
        begin
          reg155 <= $signed($unsigned(wire147));
          reg156 <= $unsigned(reg158[(2'h3):(1'h0)]);
          if ((reg155 ?
              (wire137[(5'h11):(5'h10)] ?
                  (~&$unsigned($signed(reg153))) : reg156) : (&wire148[(1'h0):(1'h0)])))
            begin
              reg157 <= ($unsigned(({(~wire148), {(8'had), reg162}} ?
                      $unsigned($signed(reg153)) : wire148)) ?
                  ($unsigned((reg150[(3'h4):(2'h2)] ?
                          (wire144 ? wire137 : reg160) : $unsigned(reg162))) ?
                      ({$signed(reg158)} ~^ ({(8'ha6),
                          wire143} << $unsigned((8'h9c)))) : (($signed(reg159) > wire148[(3'h7):(1'h1)]) ?
                          ($unsigned((7'h42)) ^ {reg160,
                              wire149}) : reg156[(2'h2):(2'h2)])) : wire148);
            end
          else
            begin
              reg157 <= wire140[(3'h7):(1'h1)];
              reg158 <= $unsigned(((~^$signed({wire146})) <<< ((8'haa) < (!(reg150 ?
                  (8'hb3) : wire142)))));
            end
        end
    end
  module163 #() modinst195 (wire194, clk, reg152, reg155, wire138, reg151);
  assign wire196 = {($signed((~reg154)) ?
                           $signed(((wire139 ? wire146 : wire148) ?
                               (reg154 ?
                                   wire137 : wire144) : $signed(wire144))) : $unsigned(wire142))};
  assign wire197 = $signed((~^(8'hbf)));
  always
    @(posedge clk) begin
      if ($signed(reg152[(4'h9):(3'h5)]))
        begin
          reg198 <= wire138[(4'hf):(4'hf)];
          if ({wire139[(4'he):(3'h4)],
              $signed(($signed(wire145) * reg151[(4'h8):(3'h7)]))})
            begin
              reg199 <= {(+wire138[(1'h0):(1'h0)]), reg153};
              reg200 <= wire197[(3'h4):(1'h1)];
              reg201 <= $unsigned(wire139[(3'h4):(1'h0)]);
              reg202 <= $unsigned(reg160);
              reg203 <= (wire148[(3'h6):(1'h0)] >>> reg198);
            end
          else
            begin
              reg199 <= ((&((+reg156[(4'ha):(4'ha)]) >= reg199[(1'h1):(1'h0)])) ?
                  reg150[(1'h1):(1'h0)] : ($unsigned(reg198[(3'h5):(1'h0)]) ?
                      reg153[(4'hc):(2'h2)] : $signed($unsigned((reg152 ?
                          (7'h44) : reg151)))));
              reg200 <= $signed((wire146 < wire141[(3'h5):(1'h0)]));
              reg201 <= reg160;
            end
          reg204 <= {$unsigned((wire144 ^~ wire143)), wire139};
          reg205 <= ((~^$signed($signed(reg201[(2'h2):(2'h2)]))) ~^ wire147);
        end
      else
        begin
          reg198 <= ((^{($unsigned(wire149) ?
                      ((7'h41) * wire146) : (reg150 >> reg161))}) ?
              (+(8'hbe)) : reg201[(3'h4):(2'h2)]);
          reg199 <= $signed($signed(wire147[(3'h5):(1'h1)]));
          reg200 <= (~|wire138[(4'ha):(1'h0)]);
          reg201 <= wire143;
        end
      reg206 <= $signed($unsigned($unsigned(($signed((8'ha4)) <<< $unsigned(wire196)))));
      reg207 <= ($unsigned(reg206) ?
          {(wire141[(5'h10):(4'h9)] ^~ $signed(reg201)),
              {((!reg204) ? (reg199 & reg156) : $unsigned(reg159))}} : reg153);
      reg208 <= reg153[(4'hd):(1'h0)];
      reg209 <= $unsigned($signed(reg151[(4'hc):(4'hb)]));
    end
  assign wire210 = (~|reg206[(4'he):(3'h4)]);
endmodule

module module43
#(parameter param131 = (^~(((((8'hbc) ? (7'h43) : (8'ha3)) + ((8'hbe) >>> (8'hbb))) ? (((8'hb8) ? (7'h43) : (7'h40)) >>> ((8'ha4) ? (7'h40) : (8'hab))) : (((8'hbc) | (8'h9c)) ? (!(7'h42)) : (~&(8'ha1)))) == (((~^(8'hb9)) || ((8'hab) ? (8'ha7) : (8'had))) ? (((8'haf) >>> (8'hba)) ? ((7'h40) ? (8'hb3) : (8'hac)) : ((8'ha3) >> (7'h44))) : (((8'ha5) >>> (7'h41)) * ((8'hb3) ? (8'hb4) : (8'hae)))))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire signed [(4'hc):(1'h0)] wire46;
  input wire signed [(5'h15):(1'h0)] wire45;
  input wire [(4'hf):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire125;
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire94,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire125,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= $unsigned((($unsigned($unsigned((8'hb5))) + {(~|wire44)}) ~^ (^((-wire47) ?
          (wire44 << (8'hbc)) : (wire47 > (8'haf))))));
    end
  always
    @(posedge clk) begin
      if ($signed({$unsigned(({(8'ha2)} & (~|(7'h40))))}))
        begin
          if ({($signed({$signed(wire47)}) || $signed(wire46))})
            begin
              reg49 <= ((8'hb2) ?
                  ({((!reg48) ? (wire44 <= wire44) : reg48),
                          $unsigned((^wire47))} ?
                      (^~$unsigned((7'h41))) : $signed((+(wire46 ?
                          (8'hb0) : wire45)))) : (-(|{(wire44 ? reg48 : wire46),
                      reg48[(4'ha):(3'h5)]})));
              reg50 <= reg49[(1'h1):(1'h0)];
              reg51 <= wire45[(1'h0):(1'h0)];
              reg52 <= $unsigned(($signed($signed($unsigned(wire47))) ?
                  $unsigned(($unsigned(wire44) ?
                      wire46 : $signed(wire46))) : $signed(reg51)));
            end
          else
            begin
              reg49 <= reg51;
              reg50 <= ((wire46[(3'h5):(3'h4)] ?
                      (wire44[(4'hf):(1'h1)] << $unsigned({(8'hb9),
                          reg51})) : (!$unsigned((wire46 < (8'hb7))))) ?
                  ($unsigned(wire44) ?
                      wire47[(3'h5):(2'h3)] : $unsigned({(wire46 ?
                              wire44 : reg51)})) : $signed($unsigned((reg50[(3'h6):(3'h6)] ?
                      {wire44} : (!(8'ha4))))));
              reg51 <= (wire46[(3'h5):(2'h2)] ?
                  reg52[(1'h0):(1'h0)] : (reg49 ?
                      $unsigned(((reg50 ?
                          wire45 : reg49) << reg48)) : $unsigned(wire46[(1'h1):(1'h0)])));
              reg52 <= reg48;
              reg53 <= (8'hb2);
            end
          reg54 <= $signed(((wire46 ?
              wire44[(1'h1):(1'h0)] : {$unsigned(reg48),
                  $signed(reg51)}) && ($unsigned((wire46 ?
              reg53 : wire45)) || ($signed((8'ha9)) ?
              $signed(reg50) : $unsigned(reg49)))));
        end
      else
        begin
          if (($unsigned($unsigned((8'haf))) ?
              {$unsigned(((reg53 || (8'hb3)) + wire47))} : $unsigned(reg53[(4'h8):(2'h2)])))
            begin
              reg49 <= reg49[(4'hb):(4'h8)];
              reg50 <= reg51[(3'h5):(1'h0)];
              reg51 <= reg53[(3'h7):(2'h2)];
            end
          else
            begin
              reg49 <= $unsigned((~^$signed((^(~|wire46)))));
              reg50 <= ((($unsigned((~^reg53)) ?
                  wire46 : (^$signed(reg52))) ~^ ((+(^~(8'hb3))) & $signed((|(8'h9d))))) >>> ($signed((wire44[(4'hf):(4'hf)] & $signed(reg52))) && $signed((~wire46[(2'h2):(1'h1)]))));
              reg51 <= reg51[(2'h2):(2'h2)];
              reg52 <= reg51;
            end
        end
      reg55 <= wire44[(4'hb):(2'h2)];
      reg56 <= reg53[(2'h2):(1'h1)];
    end
  module57 #() modinst95 (wire94, clk, reg54, wire47, reg51, reg56, reg53);
  assign wire96 = $unsigned(reg50);
  assign wire97 = reg56;
  assign wire98 = (($signed((~^(reg52 ?
                          reg53 : wire45))) * $unsigned($unsigned(reg55[(3'h4):(1'h0)]))) ?
                      {$signed({(reg52 - wire96),
                              $signed(reg49)})} : (^$unsigned(wire47[(1'h1):(1'h0)])));
  assign wire99 = wire47[(2'h3):(2'h3)];
  module100 #() modinst126 (wire125, clk, reg53, reg50, reg49, wire46, reg54);
  assign wire127 = reg51[(4'h9):(3'h7)];
  assign wire128 = (reg53 * $unsigned($signed((~^(8'had)))));
  assign wire129 = wire127;
  assign wire130 = (^$unsigned($unsigned($signed(wire44[(4'hb):(3'h6)]))));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire13 = wire11[(1'h0):(1'h0)];
  assign wire14 = (wire12 ^~ $signed($unsigned(wire9)));
  assign wire15 = (-(8'ha7));
  assign wire16 = wire8;
  assign wire17 = (+(!wire9));
  assign wire18 = (wire9[(4'hd):(4'h9)] != $unsigned(wire15));
  always
    @(posedge clk) begin
      if ($signed(wire10))
        begin
          if (wire17)
            begin
              reg19 <= wire18;
              reg20 <= ((&wire10[(1'h1):(1'h1)]) ^~ {wire8[(4'h8):(3'h5)]});
            end
          else
            begin
              reg19 <= reg20[(3'h7):(2'h3)];
              reg20 <= wire12;
              reg21 <= (wire13[(4'hc):(3'h7)] >>> (~^wire11[(3'h4):(2'h2)]));
            end
          if ((~^(&$unsigned(($unsigned(wire17) <= reg20[(4'hc):(3'h5)])))))
            begin
              reg22 <= wire15[(1'h1):(1'h1)];
              reg23 <= (|((({reg20} ? {reg20, (8'ha5)} : {reg19}) ?
                  (|(7'h40)) : wire15) + ($signed((~|(8'hbc))) ?
                  ($signed(wire18) ?
                      $unsigned((8'had)) : (-wire9)) : ($unsigned(wire9) & (reg21 ?
                      (8'h9c) : wire8)))));
              reg24 <= wire9[(4'hd):(4'ha)];
              reg25 <= (-($unsigned((-((7'h44) - reg22))) ?
                  wire9 : ((wire14[(2'h2):(1'h1)] >>> (reg23 ?
                          wire12 : wire15)) ?
                      (reg19 < (8'h9d)) : ((wire14 ? reg23 : reg21) & (wire13 ?
                          wire12 : wire16)))));
              reg26 <= wire11;
            end
          else
            begin
              reg22 <= wire11;
              reg23 <= (($unsigned(((wire8 ? reg26 : wire9) ?
                          (reg25 ? reg22 : wire12) : wire12)) ?
                      $unsigned(wire11[(1'h0):(1'h0)]) : wire16) ?
                  wire8[(4'hb):(4'hb)] : wire15[(2'h3):(2'h2)]);
              reg24 <= (($signed(($signed(wire15) + $signed((8'ha6)))) ?
                      wire14[(2'h2):(1'h1)] : (~|{(wire12 ? reg25 : reg21)})) ?
                  {$unsigned({{(7'h40), wire17},
                          reg24[(1'h0):(1'h0)]})} : wire16);
              reg25 <= ((!{(!$signed((8'ha5)))}) ^~ {$signed(reg23)});
              reg26 <= $signed(wire13[(1'h1):(1'h1)]);
            end
          reg27 <= (^~reg26[(3'h7):(3'h7)]);
          reg28 <= wire15[(1'h0):(1'h0)];
        end
      else
        begin
          reg19 <= ($unsigned(reg21[(1'h0):(1'h0)]) ? wire11 : reg20);
          if ($unsigned(({reg22[(3'h5):(3'h4)]} || reg20)))
            begin
              reg20 <= $signed((!wire8[(2'h2):(2'h2)]));
              reg21 <= (|(((reg20 ?
                          {wire8, (7'h40)} : (wire15 ? wire14 : reg26)) ?
                      $signed((&(8'hb5))) : (reg23 ?
                          (reg25 ? reg21 : reg20) : wire13[(1'h1):(1'h1)])) ?
                  reg21 : $signed($unsigned($signed(wire14)))));
            end
          else
            begin
              reg20 <= $signed({({reg24} ?
                      (((8'haa) ?
                          wire12 : reg28) ~^ (wire18 >>> reg21)) : reg25),
                  $unsigned((^wire18[(3'h6):(3'h6)]))});
            end
          reg22 <= (((8'hba) <<< wire13) ?
              ($signed(reg21) ?
                  ($unsigned($unsigned(reg24)) << {$unsigned(wire16),
                      $unsigned(reg24)}) : wire12[(5'h11):(4'hf)]) : {(8'ha7),
                  $unsigned(((reg23 == wire12) | (wire15 ^ reg24)))});
        end
      reg29 <= $signed($unsigned($signed({$unsigned(wire17), (^~wire14)})));
      reg30 <= (^reg24);
      reg31 <= ((&($signed((!reg21)) ?
              $unsigned($unsigned(reg25)) : {reg27[(2'h2):(2'h2)]})) ?
          wire15 : ($unsigned(reg29[(3'h7):(3'h5)]) ?
              (~&reg22[(3'h4):(2'h2)]) : $signed($signed($signed((8'ha7))))));
    end
  assign wire32 = (reg20 ? $signed((!(~$signed(wire12)))) : reg30);
  assign wire33 = reg30[(1'h1):(1'h0)];
  assign wire34 = reg24;
  always
    @(posedge clk) begin
      reg35 <= (wire34 ?
          wire16 : (($unsigned((reg31 <= reg28)) <= reg31) ?
              wire15[(2'h3):(2'h2)] : ((reg20 ?
                      reg24 : (wire33 ? reg28 : reg19)) ?
                  (|{reg25, reg31}) : (&$unsigned(wire18)))));
      if (wire34[(1'h1):(1'h0)])
        begin
          reg36 <= reg19[(3'h5):(3'h5)];
        end
      else
        begin
          if ($signed(reg24))
            begin
              reg36 <= reg26;
              reg37 <= $signed((reg36 ?
                  reg26[(4'h8):(3'h6)] : (|($unsigned(wire10) <= (!reg19)))));
              reg38 <= $signed(reg19);
              reg39 <= reg31[(2'h3):(1'h1)];
              reg40 <= $unsigned($unsigned((&{(~&(8'hac))})));
            end
          else
            begin
              reg36 <= (^reg36[(3'h4):(3'h4)]);
              reg37 <= ($signed($signed(($signed(reg21) ?
                      wire34[(2'h2):(1'h0)] : reg29[(4'h9):(3'h5)]))) ?
                  {$unsigned($signed((+(7'h40))))} : reg19);
              reg38 <= $unsigned((&$signed((((8'hbc) & reg39) & {reg39}))));
            end
        end
    end
endmodule

module module100  (y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire105;
  input wire signed [(4'ha):(1'h0)] wire104;
  input wire [(4'hb):(1'h0)] wire103;
  input wire signed [(4'hc):(1'h0)] wire102;
  input wire [(4'hd):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire signed [(4'h9):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire117,
                 wire116,
                 wire115,
                 wire107,
                 wire106,
                 reg121,
                 reg119,
                 reg118,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire106 = (($signed((~^$unsigned(wire103))) ?
                           wire104[(2'h3):(2'h2)] : wire103) ?
                       wire103 : wire104[(2'h3):(2'h3)]);
  assign wire107 = ((|$signed(wire103[(4'hb):(2'h2)])) ?
                       (+$unsigned((^(wire102 && wire106)))) : {(wire105[(3'h5):(1'h1)] ?
                               (+(wire102 ? wire106 : wire104)) : (8'hae))});
  always
    @(posedge clk) begin
      if (wire105)
        begin
          reg108 <= $unsigned($signed($signed(wire107)));
          reg109 <= $unsigned(((~|((!wire103) - $signed(wire106))) ?
              {wire103,
                  (reg108[(4'he):(4'hc)] ?
                      wire103 : {wire104})} : $signed(((wire101 * (8'ha3)) >> $unsigned(reg108)))));
          if ((($signed(($unsigned(wire106) ?
                      {wire107} : ((8'ha8) != (8'had)))) ?
                  (wire103[(3'h6):(3'h5)] ?
                      wire102[(3'h5):(2'h2)] : wire107[(3'h6):(3'h5)]) : wire102) ?
              ($signed($unsigned(wire107[(3'h4):(2'h2)])) - {(8'ha5),
                  $unsigned($signed(wire101))}) : $signed(wire105[(3'h7):(3'h4)])))
            begin
              reg110 <= (((~(wire106[(1'h0):(1'h0)] ^~ (reg109 << wire106))) <<< {$signed(wire104[(3'h7):(3'h5)]),
                      (~$signed(wire101))}) ?
                  (|wire103) : ((-$signed(((8'hb9) << wire104))) >>> $unsigned($signed($unsigned(wire106)))));
              reg111 <= {$signed($signed((wire104 ?
                      $signed(wire104) : $signed(wire103)))),
                  (wire101 ?
                      wire101 : ((~$unsigned(reg109)) ? wire106 : reg108))};
              reg112 <= wire106;
            end
          else
            begin
              reg110 <= $signed({reg111[(3'h4):(1'h1)]});
              reg111 <= {{(~&((~|wire107) ?
                          ((7'h40) | wire105) : $signed(reg109)))},
                  wire101[(3'h6):(2'h3)]};
              reg112 <= $signed(($signed(((reg109 + reg112) <<< reg111)) > (reg112[(3'h4):(3'h4)] ?
                  (~|(wire101 <= reg110)) : wire106[(3'h4):(2'h2)])));
            end
          reg113 <= (+$unsigned($unsigned((+$signed(wire104)))));
        end
      else
        begin
          if ((-$signed((7'h41))))
            begin
              reg108 <= $signed(((($signed(wire104) ~^ $unsigned((8'hb5))) - ($unsigned(wire105) > {wire106})) ?
                  (({reg111} > $signed(wire106)) && $unsigned((reg113 ~^ (8'hbc)))) : $signed(wire105[(1'h1):(1'h1)])));
              reg109 <= (~|wire105);
              reg110 <= (^((~|((reg109 ? (8'h9e) : wire103) ?
                      $signed(reg113) : {wire107})) ?
                  $unsigned(reg109) : ($signed($signed(reg111)) ?
                      wire104[(3'h4):(1'h0)] : (8'hb1))));
              reg111 <= ($unsigned(wire104) >> (~&(($unsigned(reg111) < wire107[(3'h5):(2'h2)]) ^ (&(~|(8'hab))))));
              reg112 <= wire103[(3'h7):(3'h4)];
            end
          else
            begin
              reg108 <= ((^~(wire101[(4'h8):(3'h5)] < {$unsigned(reg113),
                  (!(8'hb1))})) << $signed($signed(($signed(wire106) == (&wire104)))));
              reg109 <= wire105[(4'hb):(4'ha)];
              reg110 <= (^($signed((~wire106)) ?
                  reg109 : $unsigned($unsigned((+reg110)))));
              reg111 <= $unsigned($signed($signed($unsigned($unsigned(wire107)))));
              reg112 <= ((!$unsigned($signed((reg112 ?
                  reg110 : (8'had))))) - ($unsigned(reg108) && (($unsigned(reg108) || (wire106 <= reg112)) > {wire101,
                  $signed(wire106)})));
            end
          reg113 <= reg113[(1'h0):(1'h0)];
        end
      reg114 <= $signed($signed($unsigned((~&reg110))));
    end
  assign wire115 = wire103[(1'h1):(1'h0)];
  assign wire116 = {reg113, wire107};
  assign wire117 = (+wire104[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      reg118 <= ((!($signed({wire101, reg109}) ?
              wire102[(3'h5):(2'h2)] : reg113)) ?
          (($unsigned(reg109) ? $unsigned((~&(8'ha7))) : (^~$signed(wire107))) ?
              (-((wire116 << (8'hb1)) ?
                  (wire105 ?
                      (8'ha6) : wire106) : $signed(wire102))) : (reg112 << wire102)) : (~^$signed((-(wire116 + reg113)))));
      reg119 <= $unsigned(reg111);
    end
  assign wire120 = reg119;
  always
    @(posedge clk) begin
      reg121 <= {reg109};
    end
  assign wire122 = $unsigned($signed(($unsigned($unsigned(reg108)) ^~ (reg121 ?
                       (wire116 ? wire102 : wire107) : reg114))));
  assign wire123 = ($signed($signed($unsigned((~&reg110)))) + ($unsigned(((!reg110) ?
                       (wire103 ~^ wire104) : (8'ha5))) <<< reg108));
  assign wire124 = (&$signed($signed((^(wire107 ? wire101 : (8'hb7))))));
endmodule

module module57  (y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire62;
  input wire signed [(2'h2):(1'h0)] wire61;
  input wire [(2'h3):(1'h0)] wire60;
  input wire [(4'hb):(1'h0)] wire59;
  input wire [(3'h7):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire83,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg82,
                 reg81,
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
                 (1'h0)};
  assign wire63 = $unsigned((^~(8'hab)));
  assign wire64 = wire58[(3'h6):(2'h2)];
  assign wire65 = ((~&$signed(((~^wire62) == (wire62 ?
                      wire62 : wire58)))) - ($signed({{wire60, (8'ha7)},
                      (wire59 ^~ wire63)}) >= $signed($signed((wire64 | (8'ha8))))));
  assign wire66 = $unsigned($unsigned((|wire61)));
  always
    @(posedge clk) begin
      reg67 <= (~|wire66);
      if ($unsigned(reg67))
        begin
          reg68 <= ($signed(wire60[(2'h2):(1'h0)]) ?
              $unsigned(($signed((wire61 || wire65)) > $signed((~|wire60)))) : (~($unsigned($signed(wire65)) - ($signed(wire63) ^ (wire64 | wire61)))));
          if (($signed((8'had)) ?
              wire60[(2'h3):(2'h3)] : ($unsigned((~^wire61)) ?
                  wire63[(3'h4):(1'h1)] : (^~(~&wire65[(3'h7):(1'h1)])))))
            begin
              reg69 <= reg67[(2'h2):(1'h0)];
              reg70 <= $signed((wire60 <<< {$unsigned((reg69 || (8'hac)))}));
              reg71 <= (reg67 ?
                  (-($unsigned($signed((8'ha4))) >>> (&(~&wire59)))) : wire61);
              reg72 <= {(!$unsigned({wire58[(2'h3):(2'h3)]})),
                  (wire58[(3'h7):(2'h2)] ? wire59 : wire60)};
              reg73 <= (^reg70);
            end
          else
            begin
              reg69 <= $unsigned(wire58);
              reg70 <= wire60;
              reg71 <= $unsigned(reg67[(1'h1):(1'h1)]);
            end
          if ($signed(((wire65 <= $unsigned((8'ha9))) ? reg67 : wire64)))
            begin
              reg74 <= wire63[(4'hf):(4'ha)];
              reg75 <= $signed((^wire61[(1'h0):(1'h0)]));
              reg76 <= {((&$signed((wire61 ? reg70 : (7'h44)))) ?
                      $signed((^~wire62[(1'h0):(1'h0)])) : (^~reg75))};
              reg77 <= wire65[(3'h6):(1'h0)];
            end
          else
            begin
              reg74 <= (reg76 >>> ((&({reg74, (8'ha7)} ~^ wire61)) >> (7'h42)));
              reg75 <= (((&reg71[(3'h4):(2'h2)]) ?
                  reg71[(4'h9):(4'h9)] : ({$signed(wire66), (|(8'ha1))} ?
                      wire65 : ($signed(reg68) ?
                          reg77 : reg72[(2'h2):(1'h1)]))) != (8'hae));
              reg76 <= {wire66};
              reg77 <= $unsigned({reg77[(4'h9):(4'h8)]});
            end
          reg78 <= {wire63[(3'h4):(2'h2)]};
          reg79 <= $signed($signed(wire63));
        end
      else
        begin
          reg68 <= {reg74};
          if ({$unsigned(reg67[(1'h1):(1'h1)]),
              (wire64[(1'h1):(1'h1)] ?
                  ({$signed(wire63)} >= $signed($unsigned(reg67))) : $signed(reg76))})
            begin
              reg69 <= $unsigned(((~{reg79[(4'hc):(3'h7)]}) - wire64));
              reg70 <= reg67[(2'h3):(2'h2)];
            end
          else
            begin
              reg69 <= (+(~|($unsigned(((8'ha2) != reg73)) ^~ $signed($signed(reg69)))));
              reg70 <= (^(($unsigned((~reg68)) || $signed({reg67})) != (reg67 >> $signed((reg78 * (8'hae))))));
              reg71 <= wire65;
              reg72 <= $signed(reg69[(1'h1):(1'h1)]);
              reg73 <= ((8'ha2) == $signed(($unsigned(reg77[(4'h8):(3'h7)]) ?
                  wire64[(2'h3):(1'h0)] : (^(wire62 ? wire62 : wire62)))));
            end
        end
      reg80 <= (!(wire66 ? $unsigned((!reg67)) : $signed(reg78)));
      reg81 <= reg77;
      reg82 <= ((wire63 + (~|(&(reg77 ?
          reg80 : wire66)))) ~^ (&(|((|wire60) + reg78))));
    end
  assign wire83 = (((($unsigned(wire61) ? (8'ha4) : $unsigned(reg67)) ?
                          ((wire62 * reg81) ?
                              $unsigned(wire65) : $unsigned((7'h43))) : {$unsigned(wire60),
                              wire66[(4'hc):(4'h9)]}) ?
                      (($signed(reg72) ?
                          (reg78 ?
                              wire66 : wire58) : ((8'ha3) << wire62)) ~^ wire65[(4'hc):(1'h0)]) : $signed({$signed(reg77),
                          wire63[(3'h5):(1'h1)]})) <= (+({((8'haf) & reg70),
                          $signed(reg69)} ?
                      (&{reg76, wire66}) : $unsigned(wire64))));
  always
    @(posedge clk) begin
      if (({$unsigned($signed((reg80 == wire65))),
          (((^~(7'h42)) ? (^reg78) : (reg77 ? (8'hb0) : reg81)) * (~(wire64 ?
              wire65 : reg72)))} - reg82[(2'h3):(2'h2)]))
        begin
          reg84 <= (reg78[(5'h12):(5'h10)] >= {($signed((reg76 ?
                  reg67 : wire83)) + $unsigned($unsigned(reg69))),
              reg76[(3'h6):(3'h4)]});
          reg85 <= $signed((reg75[(4'ha):(2'h2)] >> reg74));
          reg86 <= (&wire66);
        end
      else
        begin
          reg84 <= reg85;
          reg85 <= $signed(((reg73 ?
                  (reg80 << $unsigned(reg71)) : $unsigned($signed(wire61))) ?
              ($unsigned((reg69 >> reg82)) << (wire65[(2'h3):(1'h1)] ?
                  $signed(wire59) : reg74)) : $unsigned((reg77 - $signed(reg75)))));
          reg86 <= (reg72[(3'h5):(1'h0)] ?
              reg73[(4'h9):(4'h9)] : (^$unsigned($signed(wire64))));
        end
      reg87 <= (~^(wire63[(4'h9):(4'h8)] == (-reg68[(2'h3):(1'h0)])));
      reg88 <= $unsigned(($signed(((reg87 - reg78) ?
              reg79[(4'h9):(3'h7)] : (wire63 > reg84))) ?
          $signed($unsigned(wire65)) : ({$signed(reg81)} ?
              $unsigned(wire83[(2'h3):(1'h1)]) : reg76[(4'hb):(3'h6)])));
      reg89 <= $signed((reg69 || (((&wire58) ^ wire65) ?
          {reg79[(1'h0):(1'h0)], reg67[(1'h0):(1'h0)]} : wire64)));
      reg90 <= {$unsigned((((wire61 & reg76) ?
              reg77[(4'h9):(1'h0)] : (~^wire59)) & $signed({wire61, reg74}))),
          ($signed($unsigned($unsigned(reg67))) * reg82)};
    end
  assign wire91 = reg85;
  assign wire92 = (~&wire59);
  assign wire93 = (wire60 ?
                      ($unsigned(reg70[(3'h6):(3'h6)]) ?
                          wire64 : (-{(reg73 ? reg73 : wire61),
                              (wire66 ? reg89 : reg77)})) : $signed(reg74));
endmodule

module module163
#(parameter param192 = {(~({((8'ha7) & (8'had)), (^~(7'h44))} ? (8'ha4) : (^~((8'hb5) || (8'hb3))))), ((8'h9d) ? ((((7'h40) ~^ (8'ha8)) ? {(8'ha1), (8'ha4)} : (!(8'haa))) ? (~&((8'ha2) ? (8'hb3) : (8'hb6))) : ({(8'h9c)} ? (~|(8'hb2)) : ((8'hab) ? (8'hb3) : (8'ha2)))) : ((((8'h9e) ? (8'ha6) : (7'h41)) + {(8'ha4)}) ? {(&(8'had)), {(8'hbb)}} : ((|(8'h9d)) ? {(8'hb5), (8'h9d)} : ((8'ha7) ? (8'hb9) : (7'h40)))))}, 
parameter param193 = ((~^({(param192 <<< param192)} ? param192 : {(~param192), (8'haf)})) < (((~|(param192 ? (8'hb7) : param192)) ? {(^(7'h40)), (param192 <= param192)} : (&(param192 << param192))) ? param192 : ((8'hb5) - param192))))
(y, clk, wire167, wire166, wire165, wire164);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire167;
  input wire signed [(5'h13):(1'h0)] wire166;
  input wire [(5'h14):(1'h0)] wire165;
  input wire signed [(4'h8):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire191;
  wire signed [(5'h13):(1'h0)] wire190;
  wire signed [(2'h3):(1'h0)] wire189;
  wire signed [(3'h5):(1'h0)] wire188;
  wire [(4'hb):(1'h0)] wire187;
  wire [(3'h6):(1'h0)] wire186;
  wire [(4'hf):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire183;
  wire signed [(2'h2):(1'h0)] wire182;
  wire signed [(3'h5):(1'h0)] wire181;
  wire [(5'h14):(1'h0)] wire180;
  wire [(3'h4):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire173;
  wire [(5'h15):(1'h0)] wire172;
  wire signed [(5'h10):(1'h0)] wire171;
  wire signed [(4'h8):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire168;
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(3'h7):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg170 = (1'h0);
  assign y = {wire191,
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
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire169,
                 wire168,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg170,
                 (1'h0)};
  assign wire168 = $signed((wire164 ? wire167 : $unsigned((8'had))));
  assign wire169 = (~&wire168);
  always
    @(posedge clk) begin
      reg170 <= wire169;
    end
  assign wire171 = (wire166[(5'h10):(4'h8)] ?
                       (|$signed((~^$unsigned(reg170)))) : wire166);
  assign wire172 = $signed((($signed($unsigned(reg170)) ?
                       (+((8'hb6) << wire171)) : wire166) & wire166[(5'h11):(5'h10)]));
  assign wire173 = (($unsigned(((reg170 ? wire165 : wire168) ?
                           $signed(reg170) : (~(8'h9d)))) ?
                       wire169 : wire171) <= ($unsigned((((8'hab) != (8'ha1)) ?
                       {reg170} : $signed(wire166))) == $unsigned((^$signed(wire165)))));
  assign wire174 = (~^($unsigned($signed((8'haf))) ?
                       $signed($signed((-wire172))) : (wire168[(3'h7):(2'h3)] ?
                           $unsigned((wire166 - wire171)) : wire166)));
  always
    @(posedge clk) begin
      reg175 <= $signed($signed((($unsigned(wire171) < wire171) ?
          (wire174[(4'hc):(2'h3)] * (reg170 ~^ wire168)) : (wire168[(1'h1):(1'h1)] ?
              (+reg170) : (wire165 * wire168)))));
      reg176 <= (~(~(^{(8'hbc), $signed((8'hae))})));
      reg177 <= wire168[(5'h13):(3'h7)];
      reg178 <= {$signed((~(8'ha9)))};
    end
  assign wire179 = wire168;
  assign wire180 = (~reg170[(5'h13):(4'hd)]);
  assign wire181 = $signed(((({wire174} ? (wire164 == (7'h40)) : {wire173}) ?
                           $unsigned({reg177, wire168}) : {$signed(wire180)}) ?
                       ((&$signed(wire165)) ?
                           $unsigned(reg176[(4'hb):(2'h2)]) : (~reg177[(1'h1):(1'h1)])) : $unsigned(wire169)));
  assign wire182 = reg175;
  assign wire183 = $signed(wire166[(3'h4):(1'h0)]);
  assign wire184 = ((wire180[(5'h11):(2'h3)] ?
                           wire169[(3'h4):(2'h2)] : ($signed(wire174[(4'h9):(3'h4)]) ~^ $signed($unsigned((8'ha8))))) ?
                       reg177[(3'h7):(2'h3)] : wire169);
  assign wire185 = (wire168[(5'h11):(1'h1)] ?
                       wire174[(2'h3):(1'h0)] : $unsigned(wire169[(2'h2):(2'h2)]));
  assign wire186 = $unsigned((^(wire166[(4'h9):(3'h7)] ?
                       (~$unsigned(wire164)) : ($signed(wire179) ?
                           ((8'h9f) >>> reg176) : wire171[(3'h7):(1'h1)]))));
  assign wire187 = (+$signed($unsigned((~|wire174[(4'hc):(4'h8)]))));
  assign wire188 = (~|$unsigned($unsigned((^~$unsigned((8'hb0))))));
  assign wire189 = wire181;
  assign wire190 = reg170[(1'h0):(1'h0)];
  assign wire191 = (^($unsigned($signed($signed(wire180))) ?
                       $signed({wire190, wire186}) : ({wire185[(3'h7):(1'h1)],
                           (reg175 ? wire168 : reg170)} == wire172)));
endmodule
