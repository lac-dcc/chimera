module top
#(parameter param206 = ((~^{(|((7'h41) ? (8'ha4) : (8'hb9)))}) ? (((-((8'hb0) >> (8'hb1))) <<< ({(8'hbb), (8'ha7)} ? ((8'ha8) - (8'ha0)) : ((8'ha4) ? (8'ha6) : (8'hbf)))) ? (^{{(8'hb0), (8'hbb)}}) : ((((8'h9c) ? (8'ha7) : (8'h9c)) ? (!(8'hbb)) : ((8'hbf) && (8'hb0))) == (&((8'ha7) && (8'hae))))) : ((({(8'had), (7'h42)} ? (^(8'hba)) : (~&(8'hb2))) ? ((~^(8'h9e)) ? (~(8'ha6)) : ((8'hbe) ? (7'h42) : (8'hae))) : ({(8'h9c), (8'had)} >= ((8'h9c) * (8'ha0)))) ? ((((8'ha1) >>> (8'h9f)) ? ((8'had) ? (8'ha5) : (8'hb0)) : (~|(8'hab))) >>> ((~&(8'h9e)) ? ((7'h41) << (8'hb6)) : ((8'hbd) > (7'h40)))) : (^({(8'hbd)} ? ((8'hb5) ~^ (8'hba)) : {(8'ha6)})))), 
parameter param207 = ((((^~(param206 ? param206 : param206)) ? param206 : (~^(param206 || param206))) != (((+(8'ha4)) * (param206 ? param206 : param206)) < ((param206 <= param206) << (param206 - param206)))) ^ (|(^~param206))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire205;
  wire signed [(5'h12):(1'h0)] wire192;
  wire signed [(4'hd):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire188;
  wire [(4'hb):(1'h0)] wire176;
  wire [(5'h10):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire27;
  reg signed [(5'h11):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg203 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg201 = (1'h0);
  reg [(4'h9):(1'h0)] reg200 = (1'h0);
  reg [(4'hb):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg197 = (1'h0);
  reg [(4'h9):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg193 = (1'h0);
  reg [(3'h6):(1'h0)] reg191 = (1'h0);
  reg signed [(4'he):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg186 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg [(3'h6):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire205,
                 wire192,
                 wire189,
                 wire188,
                 wire176,
                 wire30,
                 wire29,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire14,
                 wire15,
                 wire16,
                 wire27,
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
                 reg191,
                 reg190,
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
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = $signed($unsigned(wire0));
  assign wire5 = $signed({(^$signed($signed(wire1))), wire0});
  assign wire6 = wire0[(4'hd):(3'h5)];
  assign wire7 = (({wire0[(4'hf):(4'h9)],
                         $unsigned($unsigned(wire1))} <= wire2) ?
                     ((~|wire0) ?
                         $signed({wire6, {wire0, wire1}}) : $unsigned(({wire6,
                                 wire5} ?
                             {(8'hb8)} : wire3[(1'h1):(1'h0)]))) : $signed((wire4 >> ($unsigned(wire6) && $unsigned(wire2)))));
  always
    @(posedge clk) begin
      reg8 <= (^(^(8'hbc)));
      if ((!$unsigned($unsigned(reg8))))
        begin
          reg9 <= ($signed((!$unsigned((wire3 || wire1)))) ?
              wire1[(2'h3):(1'h1)] : wire0[(3'h5):(1'h1)]);
          reg10 <= {{$signed(wire0), (wire3 - wire3[(4'h9):(3'h7)])}};
        end
      else
        begin
          reg9 <= (wire3 > reg9);
        end
      reg11 <= (($signed($signed((wire0 ? wire4 : (7'h44)))) != wire4) > reg10);
      reg12 <= reg10;
      reg13 <= $signed(reg10[(1'h1):(1'h1)]);
    end
  assign wire14 = $signed($signed(($unsigned($signed(wire1)) << $signed((reg8 <<< reg8)))));
  assign wire15 = ((~&wire0[(5'h11):(1'h1)]) ?
                      (^~$unsigned(reg9[(1'h1):(1'h1)])) : ({$unsigned($unsigned(reg13))} & reg11));
  assign wire16 = $unsigned((8'hbb));
  module17 #() modinst28 (.wire20(wire15), .wire19(wire0), .wire18(wire14), .y(wire27), .wire21(reg11), .clk(clk));
  assign wire29 = $signed($unsigned($unsigned(((^~reg11) > wire1[(2'h2):(2'h2)]))));
  assign wire30 = (~^(($unsigned($unsigned(wire27)) ?
                          reg11 : ($signed(wire0) != $unsigned(wire1))) ?
                      $unsigned($unsigned(wire3[(4'h8):(3'h5)])) : $unsigned(((~|wire7) ?
                          reg8 : (8'haa)))));
  module31 #() modinst177 (.wire32(reg9), .wire34(reg13), .clk(clk), .y(wire176), .wire35(wire6), .wire33(wire1));
  always
    @(posedge clk) begin
      reg178 <= ($signed((!$signed((~^wire27)))) | ((wire3[(4'ha):(1'h0)] < (wire30 ?
          (wire15 ? wire4 : wire14) : $signed(wire3))) + ((!reg11) ?
          $unsigned(wire29[(5'h12):(3'h7)]) : wire16)));
      if (reg13[(3'h4):(1'h1)])
        begin
          if ($signed($unsigned(((wire176 ? reg12 : (wire1 ? (8'ha6) : wire0)) ?
              $signed((8'hab)) : wire14[(5'h11):(1'h1)]))))
            begin
              reg179 <= {wire16[(1'h0):(1'h0)]};
            end
          else
            begin
              reg179 <= (wire6 ~^ (($unsigned($signed(wire14)) && (~(wire7 - (8'hbe)))) ?
                  $signed(((reg13 == wire27) ?
                      (wire1 ^ wire176) : reg178)) : ($unsigned(wire30) | ((+wire176) ?
                      (reg179 - wire1) : $unsigned(wire16)))));
              reg180 <= {$unsigned($signed(((+reg8) ? (+reg10) : (~&reg178))))};
              reg181 <= (8'ha6);
              reg182 <= $signed(reg180);
              reg183 <= wire30;
            end
          reg184 <= reg13;
          reg185 <= reg182[(4'hc):(3'h4)];
          reg186 <= $unsigned({(reg185[(4'hf):(2'h3)] << wire29[(2'h2):(1'h1)])});
        end
      else
        begin
          reg179 <= wire14;
          if ({$signed(reg180[(3'h4):(2'h2)])})
            begin
              reg180 <= $signed(reg10[(1'h0):(1'h0)]);
            end
          else
            begin
              reg180 <= wire0[(1'h0):(1'h0)];
            end
          reg181 <= $signed((reg12 >>> (wire29[(5'h10):(3'h6)] >>> wire2[(1'h0):(1'h0)])));
          reg182 <= $signed(wire176[(3'h5):(1'h0)]);
          reg183 <= ((wire16[(2'h3):(1'h1)] >> (wire5 & wire1)) >> $signed(($unsigned((~^reg12)) ?
              (reg8 ~^ (^reg182)) : $signed(wire29))));
        end
      reg187 <= (~&wire14);
    end
  assign wire188 = reg11[(4'h9):(1'h1)];
  assign wire189 = reg183[(4'hc):(4'ha)];
  always
    @(posedge clk) begin
      reg190 <= (8'ha0);
      reg191 <= wire27;
    end
  assign wire192 = reg182;
  always
    @(posedge clk) begin
      reg193 <= {((~$signed((~^wire189))) ?
              (&($signed(reg181) ?
                  (wire192 + (7'h44)) : (7'h44))) : ($unsigned(reg187) != ({reg183} ?
                  {wire0, (8'hb1)} : (wire5 >= wire192)))),
          wire192};
      reg194 <= (wire6 ? $signed((|{wire4[(4'hc):(3'h6)]})) : (8'ha2));
      reg195 <= wire27;
      reg196 <= reg193[(3'h7):(2'h3)];
      reg197 <= (~|(~&$signed(($unsigned(reg184) < (^reg187)))));
    end
  always
    @(posedge clk) begin
      reg198 <= $unsigned(wire14[(4'ha):(4'ha)]);
      if (reg194)
        begin
          reg199 <= wire1[(2'h3):(2'h2)];
          reg200 <= (&$unsigned($unsigned((^~$signed(wire192)))));
          reg201 <= $unsigned((|($signed((wire4 ? wire189 : reg185)) ?
              {$signed(reg10)} : wire189)));
          reg202 <= (^{(((reg185 ?
                  wire0 : reg12) < (reg179 >>> (8'hb6))) ~^ ({reg11, wire29} ?
                  $signed(reg185) : {reg193}))});
        end
      else
        begin
          reg199 <= (~|$unsigned($signed($signed((^wire0)))));
        end
      reg203 <= (!$signed($signed((~|$unsigned((8'hb4))))));
      reg204 <= wire176[(3'h4):(1'h0)];
    end
  assign wire205 = $signed({((((8'ha0) >>> reg179) ^ (reg8 ?
                           wire1 : reg201)) != reg194[(2'h2):(2'h2)]),
                       reg187});
endmodule

module module31
#(parameter param175 = ((((8'hb3) ? {(8'hb7)} : (~^((8'hbc) >= (8'hbf)))) != ((((8'hbb) ? (7'h40) : (8'hb0)) == ((8'h9c) && (8'hb0))) ? {(^~(7'h44)), (~^(8'hb9))} : {(8'ha7), ((8'hba) ? (8'hba) : (8'hb2))})) ^~ ((~&(&((8'h9d) ? (8'hb8) : (8'hb9)))) ? (^~{(^(8'ha7)), ((8'hab) ? (8'ha5) : (8'hb5))}) : (~^{{(8'h9e), (8'ha3)}}))))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h23b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire [(2'h2):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire174;
  wire signed [(4'hc):(1'h0)] wire173;
  wire signed [(3'h6):(1'h0)] wire172;
  wire signed [(5'h13):(1'h0)] wire171;
  wire signed [(4'hc):(1'h0)] wire170;
  wire [(4'hf):(1'h0)] wire168;
  wire [(3'h5):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire36;
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire168,
                 wire95,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg56,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 (1'h0)};
  assign wire36 = ((^~(+$signed((wire35 ^~ (7'h43))))) <= ($signed(wire33) ?
                      wire32 : $unsigned($unsigned((wire33 ?
                          wire35 : wire34)))));
  always
    @(posedge clk) begin
      if ($signed($signed($signed((+wire32)))))
        begin
          reg37 <= (~|((($unsigned((8'h9c)) ?
                      {(7'h44), wire36} : (wire33 * wire35)) ?
                  wire32[(1'h0):(1'h0)] : (&{wire35, wire33})) ?
              wire36[(4'hc):(2'h3)] : $signed(wire36[(4'h8):(2'h3)])));
          reg38 <= wire36[(3'h7):(3'h6)];
          if ((8'ha7))
            begin
              reg39 <= ($signed($signed((reg37[(3'h5):(2'h2)] < reg38[(3'h4):(3'h4)]))) ^ (7'h44));
              reg40 <= $unsigned((^~wire33[(1'h1):(1'h1)]));
              reg41 <= wire32[(3'h4):(3'h4)];
              reg42 <= reg38;
            end
          else
            begin
              reg39 <= wire35[(4'hd):(1'h0)];
            end
          reg43 <= (^~$signed(reg38));
          if (reg38)
            begin
              reg44 <= wire32[(4'h9):(3'h4)];
              reg45 <= (~&reg38);
              reg46 <= ($unsigned((((&wire33) ?
                      $unsigned(reg40) : $signed(wire35)) ?
                  reg45[(2'h3):(1'h0)] : (8'hb4))) | (~(^(reg39 ?
                  (reg45 ? wire34 : reg38) : reg45))));
              reg47 <= reg38;
            end
          else
            begin
              reg44 <= $signed($unsigned(($unsigned((~^reg43)) <<< $unsigned({reg43}))));
            end
        end
      else
        begin
          reg37 <= ((^reg44[(2'h3):(2'h3)]) ?
              {((&wire34[(4'hf):(1'h0)]) != (7'h41)),
                  $signed(reg38)} : $signed(wire33[(1'h0):(1'h0)]));
        end
      reg48 <= reg46[(4'hc):(2'h2)];
      reg49 <= reg45;
      reg50 <= {wire32};
    end
  assign wire51 = (wire32 ? reg40 : reg38);
  assign wire52 = $signed((+wire32));
  assign wire53 = reg45;
  assign wire54 = {$signed({{{(8'hae)}}}), wire53};
  assign wire55 = (reg38 - (~($unsigned($signed(wire32)) == reg37[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      reg56 <= (&{$unsigned(reg40[(4'hb):(4'hb)]), reg48});
    end
  assign wire57 = {wire36[(2'h2):(2'h2)], reg45[(3'h6):(2'h2)]};
  always
    @(posedge clk) begin
      if ((&wire52))
        begin
          reg58 <= reg46;
          if (wire34)
            begin
              reg59 <= ($unsigned((((wire34 ?
                  (7'h42) : wire36) - $unsigned(reg49)) | (-$signed(wire36)))) || (reg43[(3'h6):(2'h2)] ?
                  (wire35 ^ (~^$unsigned(wire51))) : ((-wire36[(3'h5):(3'h4)]) ?
                      wire51 : ((~|reg45) ? {reg46} : (!reg44)))));
            end
          else
            begin
              reg59 <= $signed({$signed({(^~reg38)}),
                  $unsigned(($signed(wire57) ?
                      (reg38 ? reg49 : wire54) : reg40[(3'h7):(3'h5)]))});
              reg60 <= reg40;
              reg61 <= $signed($unsigned($signed($signed($signed(wire34)))));
              reg62 <= (((($unsigned(wire33) ? $unsigned(reg59) : (|(8'hac))) ?
                          $signed((-wire53)) : (reg37 <= wire34[(1'h0):(1'h0)])) ?
                      $signed((^~$signed((8'ha7)))) : {$signed({reg41})}) ?
                  reg44[(4'h9):(2'h3)] : $unsigned(reg48[(4'h8):(3'h4)]));
              reg63 <= {reg48[(5'h13):(4'hf)], $unsigned(reg50)};
            end
          reg64 <= $unsigned((8'hb1));
          reg65 <= (8'ha0);
          if ((~&$unsigned($unsigned((wire34[(3'h4):(1'h1)] ^~ (~(8'hb2)))))))
            begin
              reg66 <= (reg60[(1'h1):(1'h1)] ? (8'ha9) : wire57);
              reg67 <= (($signed(reg58) <<< {({reg44, reg59} ?
                          wire34[(4'hb):(4'hb)] : reg49),
                      ((wire36 << reg63) ?
                          reg66[(1'h0):(1'h0)] : $signed(reg64))}) ?
                  $unsigned((-(+reg38[(1'h1):(1'h1)]))) : wire51[(3'h5):(1'h1)]);
              reg68 <= (~&(~|{$unsigned((wire36 + reg60)), ((8'hb8) < reg59)}));
              reg69 <= $signed({($signed((wire53 <<< reg47)) ?
                      $signed((reg59 ? reg43 : reg46)) : $unsigned((reg60 ?
                          reg65 : (8'hb1))))});
              reg70 <= (!$unsigned(((reg49 & reg66[(1'h0):(1'h0)]) | reg38)));
            end
          else
            begin
              reg66 <= $signed((^(((8'hb4) ?
                      $unsigned(wire53) : wire33[(1'h1):(1'h0)]) ?
                  (reg40 ? reg68 : wire53[(3'h6):(3'h6)]) : reg44)));
              reg67 <= reg48[(5'h12):(3'h5)];
              reg68 <= reg44;
              reg69 <= (~|((-wire36) * (^~reg47[(4'h9):(2'h3)])));
              reg70 <= wire54[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg58 <= $signed({$signed((|(^~(8'hab)))),
              (reg58[(1'h1):(1'h1)] | $unsigned((~^wire54)))});
          reg59 <= {$unsigned(reg64[(1'h1):(1'h0)]),
              (((wire36[(4'he):(4'hd)] ?
                      ((8'h9d) <= (8'hbb)) : (wire32 ? reg43 : wire55)) ?
                  ((reg65 << reg65) ?
                      wire57[(3'h5):(2'h3)] : (reg49 ?
                          reg44 : reg41)) : (~reg50[(1'h0):(1'h0)])) == reg42)};
          reg60 <= {reg39,
              (($unsigned((&reg62)) ?
                      $signed((wire35 < reg50)) : $unsigned((8'hb9))) ?
                  reg59 : $signed(wire53))};
          reg61 <= (~&$unsigned({({reg61, (8'hb3)} >= $signed(reg60)),
              reg67[(3'h5):(1'h1)]}));
        end
      reg71 <= ($signed($signed((((8'hab) ?
          reg40 : reg39) + wire57[(5'h13):(4'hd)]))) > reg37);
      if ($unsigned(reg70[(1'h1):(1'h1)]))
        begin
          reg72 <= (reg47 << (($signed((|(8'ha7))) ? reg60 : $unsigned(reg65)) ?
              $signed((|((8'hb9) ? reg37 : wire35))) : wire54[(4'hb):(1'h1)]));
          if (reg64[(4'h9):(4'h8)])
            begin
              reg73 <= (reg72 ?
                  ($unsigned((8'ha2)) ?
                      $unsigned(reg65[(5'h12):(4'hc)]) : reg48) : wire53);
              reg74 <= $unsigned(($unsigned($unsigned($signed(reg68))) ^~ $signed($signed($signed(reg69)))));
              reg75 <= (wire57 ?
                  reg72[(4'hb):(2'h3)] : (~^(((^~reg41) ^ {wire52}) == $signed({wire53}))));
              reg76 <= reg68;
            end
          else
            begin
              reg73 <= reg56[(1'h0):(1'h0)];
              reg74 <= (-(reg69[(2'h2):(1'h1)] ?
                  reg76[(4'h9):(1'h1)] : reg70[(3'h5):(2'h2)]));
            end
        end
      else
        begin
          reg72 <= $signed(reg42[(1'h1):(1'h0)]);
          reg73 <= $signed({reg41[(4'ha):(2'h2)],
              (reg74 < (-$signed((8'hab))))});
          reg74 <= $signed((($signed(((8'ha0) ?
                  reg71 : (8'ha5))) ^~ reg69[(4'hc):(3'h5)]) ?
              ($unsigned({reg68, reg38}) < (8'hb2)) : reg47));
          if (reg48[(4'h9):(3'h4)])
            begin
              reg75 <= (wire35[(4'h8):(1'h0)] ?
                  reg69[(1'h1):(1'h0)] : (((((8'ha8) ?
                      reg62 : reg40) >> (~&(8'hb2))) >> ($unsigned(reg49) & $unsigned(reg71))) + ({(reg56 ?
                              reg71 : reg64),
                          wire33[(1'h1):(1'h1)]} ?
                      ((8'hb1) ?
                          (reg40 ?
                              reg65 : reg46) : (~reg71)) : $unsigned($unsigned(reg74)))));
              reg76 <= (~|(reg44[(1'h1):(1'h0)] ?
                  reg42[(4'ha):(1'h1)] : ($signed((reg61 ? reg62 : reg60)) ?
                      ({wire54} ?
                          {reg40} : reg41[(3'h7):(3'h5)]) : (+reg44[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg75 <= ($unsigned($signed($signed(reg39[(1'h1):(1'h0)]))) ?
                  (^wire32) : {(($unsigned(wire36) ? reg42 : (reg37 & wire32)) ?
                          ($unsigned(wire52) ^~ (!(8'h9e))) : {reg65})});
            end
        end
      reg77 <= $signed($unsigned((~&((reg44 <<< wire55) ?
          $unsigned(wire32) : $signed(reg50)))));
    end
  module78 #() modinst96 (.wire79(reg58), .y(wire95), .wire81(reg73), .clk(clk), .wire80(reg45), .wire82(reg63));
  module97 #() modinst169 (.wire101(reg38), .wire100(wire52), .y(wire168), .clk(clk), .wire98(reg46), .wire102(reg45), .wire99(wire36));
  assign wire170 = $signed(reg71);
  assign wire171 = ((^~(8'ha8)) + ($signed(($signed(reg63) ?
                       (reg56 ?
                           reg69 : wire33) : (wire95 ~^ reg68))) | $unsigned(reg76[(3'h6):(1'h0)])));
  assign wire172 = wire51[(2'h2):(1'h1)];
  assign wire173 = (reg72 << reg45[(4'ha):(3'h4)]);
  assign wire174 = {$signed((($signed(reg39) != (wire170 ~^ (8'ha0))) + reg59))};
endmodule

module module17
#(parameter param26 = (~^(((((8'ha4) >> (8'ha9)) > ((8'h9c) < (8'ha1))) ? (((8'hab) ? (8'hbd) : (8'h9f)) || (-(8'hab))) : ((~^(8'haa)) << ((8'hb8) >>> (8'hb3)))) ? (8'haf) : ((|{(8'hbf)}) > (((8'hb4) != (8'hb8)) ? ((8'hac) ? (8'hbe) : (8'hbd)) : ((7'h41) ? (8'h9e) : (8'hb7)))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  assign y = {wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = wire20;
  assign wire23 = wire21[(4'hb):(1'h1)];
  assign wire24 = ((^~wire22[(4'hb):(4'h9)]) >= $unsigned({(^~$unsigned((8'ha6))),
                      {{(8'hae), wire22}}}));
  assign wire25 = $unsigned(wire20[(3'h5):(1'h0)]);
endmodule

module module97
#(parameter param166 = (^{({((8'hbc) * (7'h43))} && (((8'hb5) ? (8'hb0) : (8'ha0)) ? (8'haf) : {(8'h9e), (8'ha7)}))}), 
parameter param167 = ((~|(!param166)) ? (((~&(8'hb0)) ? param166 : (+(param166 ^~ (8'hab)))) ? {(~|(~param166)), (((8'ha1) ~^ param166) ? param166 : (~(8'hb9)))} : (^~(param166 >> param166))) : (+(-((param166 ^ param166) == (param166 ? param166 : param166))))))
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h2a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire102;
  input wire signed [(3'h6):(1'h0)] wire101;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire signed [(4'he):(1'h0)] wire99;
  input wire [(3'h5):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire162;
  wire signed [(4'h8):(1'h0)] wire161;
  wire signed [(3'h4):(1'h0)] wire146;
  wire [(5'h13):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire134;
  wire signed [(4'ha):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire signed [(4'he):(1'h0)] wire106;
  wire signed [(4'h9):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire103;
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire146,
                 wire145,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
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
                 reg135,
                 reg130,
                 reg129,
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
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire103 = wire98;
  assign wire104 = (&wire102);
  assign wire105 = $unsigned(wire101[(1'h1):(1'h1)]);
  assign wire106 = {(8'ha9)};
  always
    @(posedge clk) begin
      if (($unsigned((((wire104 | wire99) ?
                  (wire101 ? wire102 : wire105) : $signed((8'hb0))) ?
              {(wire99 * wire98), wire100} : wire98)) ?
          (+$signed(((8'ha9) ?
              (wire101 ? (8'h9f) : wire101) : $unsigned(wire106)))) : wire98))
        begin
          reg107 <= wire100;
          if ($unsigned((($signed($signed((8'ha9))) ?
              $signed({(8'hb6)}) : (~wire102)) > $unsigned($signed(wire102)))))
            begin
              reg108 <= wire101;
              reg109 <= reg108[(3'h6):(2'h2)];
              reg110 <= (|(({$signed(wire101),
                  (wire104 ? wire104 : reg108)} - (wire100[(4'h9):(1'h1)] ?
                  $signed(wire104) : (wire103 ? wire98 : wire103))) | wire105));
              reg111 <= {wire106};
              reg112 <= ((wire102 | {((~|(8'hbf)) ?
                      reg110[(2'h2):(1'h0)] : $signed(wire104)),
                  wire104}) >> $unsigned((wire102 ?
                  $unsigned($unsigned(wire103)) : {$signed(wire105), reg108})));
            end
          else
            begin
              reg108 <= wire101;
              reg109 <= (reg107[(4'he):(1'h0)] ? (8'hbe) : (&reg110));
              reg110 <= (~(8'hba));
              reg111 <= (+$signed((-$signed(wire101[(3'h5):(2'h3)]))));
              reg112 <= (wire99 ^~ ($unsigned((~(reg111 | reg109))) ?
                  (reg108 ?
                      reg112[(2'h2):(1'h0)] : $unsigned(reg112)) : (8'hbe)));
            end
          if ((8'h9d))
            begin
              reg113 <= $signed((7'h42));
            end
          else
            begin
              reg113 <= (!reg110[(4'h8):(2'h2)]);
            end
          if (wire103[(4'h8):(2'h2)])
            begin
              reg114 <= $signed({{(+$unsigned((8'hb3)))}});
              reg115 <= ($signed((!wire100[(3'h4):(1'h0)])) > $signed((8'ha7)));
              reg116 <= $unsigned(reg115[(2'h2):(1'h0)]);
              reg117 <= (wire104[(3'h5):(3'h5)] ?
                  (+(($signed(reg114) ?
                          (wire99 && reg116) : (reg116 ^~ reg115)) ?
                      wire106[(4'ha):(4'h9)] : reg114)) : ((7'h44) ?
                      (^reg116) : wire99));
              reg118 <= $signed(reg115[(3'h4):(3'h4)]);
            end
          else
            begin
              reg114 <= reg117;
              reg115 <= (reg112[(1'h0):(1'h0)] << $signed((~&(reg110[(4'h8):(1'h1)] ^~ $unsigned(wire101)))));
              reg116 <= $signed(reg110[(3'h7):(1'h0)]);
              reg117 <= (wire98[(1'h1):(1'h0)] ^~ ({(&(wire105 ?
                          reg118 : reg109))} ?
                  ($signed((reg110 ? reg108 : wire99)) ?
                      ((wire103 ^~ reg108) >= reg109[(2'h3):(1'h0)]) : wire98) : $unsigned((wire99[(1'h0):(1'h0)] <= ((8'hb2) ?
                      wire98 : wire106)))));
              reg118 <= wire98;
            end
          reg119 <= $signed($unsigned((($signed((8'hbd)) ?
              (reg107 ?
                  wire101 : reg107) : $signed(wire105)) > $unsigned(reg107))));
        end
      else
        begin
          reg107 <= $unsigned($signed($signed($unsigned({reg116}))));
          reg108 <= $signed((^$unsigned(((reg118 > (8'hb0)) >>> (wire100 ^~ reg109)))));
          reg109 <= {$unsigned($unsigned(wire99))};
          reg110 <= $signed(((|((wire101 ? wire102 : wire105) || (wire103 ?
              reg112 : wire106))) & reg119));
        end
      reg120 <= (((~|(^(wire102 ?
          reg110 : wire105))) != (&reg117)) || (wire105[(3'h5):(1'h1)] ^ (((reg118 && reg117) ^ $signed((8'h9e))) >>> (~^reg119[(2'h3):(1'h0)]))));
      if ($unsigned(reg119[(5'h10):(1'h1)]))
        begin
          if (($unsigned(((8'h9d) >>> reg117)) > {(wire105 >>> reg112)}))
            begin
              reg121 <= wire100;
            end
          else
            begin
              reg121 <= (~(reg118 | $unsigned($unsigned(reg109[(4'hc):(1'h1)]))));
              reg122 <= (reg112 ^~ ({({wire106} ^ $unsigned((8'hbd))),
                      (reg111[(2'h2):(1'h1)] ?
                          (wire106 || reg109) : (^reg118))} ?
                  ($unsigned(reg113[(2'h3):(1'h1)]) ?
                      (8'hae) : (~&wire100[(3'h5):(3'h5)])) : wire99[(3'h6):(1'h0)]));
              reg123 <= (+$signed($unsigned((+(-(8'h9f))))));
              reg124 <= $signed($unsigned((7'h40)));
              reg125 <= $signed($unsigned((((reg122 >>> wire105) == (wire101 >> reg118)) ?
                  {(!reg113)} : $signed($signed(reg124)))));
            end
          reg126 <= (&$unsigned(reg117[(3'h7):(3'h6)]));
          reg127 <= $signed($unsigned(reg118[(2'h2):(1'h0)]));
          reg128 <= ((7'h41) >>> $unsigned((((8'hb5) ?
                  reg124 : $unsigned((7'h41))) ?
              reg110 : (~|$signed(reg111)))));
          reg129 <= $signed(reg123[(1'h0):(1'h0)]);
        end
      else
        begin
          reg121 <= reg127[(3'h5):(2'h2)];
        end
    end
  always
    @(posedge clk) begin
      reg130 <= $unsigned($unsigned($unsigned($unsigned($unsigned((8'h9f))))));
    end
  assign wire131 = ((!($unsigned((reg127 ?
                           reg118 : wire99)) <<< {$unsigned(reg117),
                           wire102[(3'h5):(2'h2)]})) ?
                       reg129[(2'h3):(2'h2)] : ($unsigned(reg122) ?
                           (8'h9d) : reg118));
  assign wire132 = (|({{reg126[(4'h9):(4'h8)]}} ?
                       $signed({reg112[(1'h0):(1'h0)],
                           (wire105 ? reg128 : reg112)}) : $signed((8'ha2))));
  assign wire133 = reg115[(1'h1):(1'h0)];
  assign wire134 = reg116[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg135 <= {wire106, $signed($signed($signed((reg111 * reg115))))};
      reg136 <= reg119[(4'hd):(1'h0)];
      if ((|{(8'ha3), $signed($unsigned(((8'hb7) ? reg130 : (8'ha2))))}))
        begin
          reg137 <= ($signed($signed((!$signed(reg125)))) ?
              $signed($signed($unsigned((wire102 | wire100)))) : $unsigned((|reg128)));
          if ($signed(($signed(reg137) ?
              ($signed((reg122 < reg119)) >= $signed((reg137 - (8'hb3)))) : {(reg135 >>> (!reg122)),
                  (-(!reg115))})))
            begin
              reg138 <= wire133;
            end
          else
            begin
              reg138 <= $signed($signed(({(reg135 ? reg125 : (8'hab))} ?
                  (reg138 || wire132) : $signed((reg119 ? reg112 : reg120)))));
            end
          reg139 <= $unsigned($signed($unsigned($signed(reg121[(1'h0):(1'h0)]))));
          reg140 <= $signed($unsigned($signed(((8'hbc) * (&reg125)))));
          reg141 <= (($signed(((8'h9c) || (reg114 >>> reg113))) & $signed(($signed(wire134) ?
                  (8'ha5) : (reg135 ? reg125 : reg112)))) ?
              reg115[(2'h2):(1'h0)] : wire98[(1'h1):(1'h0)]);
        end
      else
        begin
          reg137 <= (|(reg123[(1'h0):(1'h0)] ?
              ((8'hb4) ?
                  $signed((reg140 - (7'h41))) : reg117[(1'h0):(1'h0)]) : $signed((-(reg138 ?
                  (8'ha1) : reg119)))));
          reg138 <= (($signed(($unsigned(reg115) == (wire99 ~^ wire105))) * (8'hbf)) << wire106[(3'h7):(2'h2)]);
          if ((($signed(wire103) * reg135[(4'ha):(4'h8)]) + ($signed(((reg117 ?
                  reg113 : reg126) ?
              reg136 : $signed(wire98))) <= (-$signed(((8'hb6) >= reg141))))))
            begin
              reg139 <= (8'hba);
              reg140 <= $unsigned((~|{reg137, wire103}));
              reg141 <= ((reg117 * ($signed((8'haa)) <<< reg116[(3'h5):(2'h2)])) ?
                  (((reg141 ?
                      (reg118 <<< reg112) : $signed(reg141)) ^~ $unsigned((wire132 < reg113))) <<< $signed((reg115 ?
                      reg122[(1'h0):(1'h0)] : (~|reg110)))) : reg116);
              reg142 <= reg111[(3'h6):(1'h1)];
              reg143 <= reg142;
            end
          else
            begin
              reg139 <= (~^((~^$unsigned(reg110[(2'h2):(1'h1)])) == $unsigned(reg124[(3'h6):(3'h4)])));
              reg140 <= (~{$unsigned(((reg120 ? reg123 : reg110) ?
                      reg130[(2'h2):(1'h1)] : reg125[(2'h3):(1'h0)]))});
            end
          reg144 <= (reg130[(1'h0):(1'h0)] ?
              ((((~&reg112) ?
                      (reg136 ?
                          wire105 : reg126) : $unsigned(wire132)) ^ ($signed(reg119) ?
                      (reg112 && (8'hbc)) : (8'ha9))) ?
                  $signed($signed($signed(wire133))) : {$unsigned((reg116 >>> reg110)),
                      $signed((reg139 ?
                          reg137 : reg117))}) : reg136[(4'h8):(3'h6)]);
        end
    end
  assign wire145 = (reg109 ?
                       wire105 : ((wire133 ?
                               {{(8'ha2), reg121},
                                   $unsigned(wire98)} : $signed(reg115[(1'h0):(1'h0)])) ?
                           wire133[(4'h9):(3'h5)] : (8'haa)));
  assign wire146 = (~|(^(wire99 ^ ((wire131 << wire134) ?
                       (~^(8'hb9)) : (~^wire133)))));
  always
    @(posedge clk) begin
      if ((+(~&(8'h9e))))
        begin
          reg147 <= wire99[(3'h5):(3'h5)];
          reg148 <= $unsigned(wire104[(2'h3):(2'h2)]);
          reg149 <= {(|({reg110} != ({wire105} - reg144))),
              (^$unsigned((8'h9e)))};
          reg150 <= ($signed((-(-wire133[(2'h2):(1'h0)]))) ?
              ((wire99 * $signed($unsigned(wire131))) > (~&(reg122[(1'h0):(1'h0)] ?
                  reg129 : {reg135,
                      wire105}))) : ({(+(wire106 < wire134))} ~^ $signed(wire102[(1'h0):(1'h0)])));
          reg151 <= $unsigned(($unsigned(wire105[(1'h1):(1'h1)]) | (wire132[(3'h6):(3'h4)] ?
              (~$signed(reg144)) : $unsigned((reg118 || reg123)))));
        end
      else
        begin
          reg147 <= (~|reg118);
          if ($signed(reg112[(2'h2):(1'h0)]))
            begin
              reg148 <= $signed(wire98);
              reg149 <= $signed(($unsigned(wire145) ?
                  wire101 : ((!(+wire98)) ?
                      ($signed(reg143) ?
                          (reg123 ?
                              reg116 : reg135) : reg139) : ($signed(reg117) > (wire100 + reg121)))));
              reg150 <= $unsigned($unsigned({(+(reg121 ? (8'hb0) : reg148)),
                  (^~((8'ha4) ? reg144 : wire132))}));
            end
          else
            begin
              reg148 <= ($signed(reg149) << reg125);
              reg149 <= (-wire134[(2'h3):(1'h1)]);
              reg150 <= (!wire104);
            end
        end
      if (({$unsigned((^~(-reg135))),
          $unsigned({reg107})} || reg125[(4'h8):(3'h6)]))
        begin
          reg152 <= wire134;
        end
      else
        begin
          if ($unsigned(reg123[(3'h5):(3'h4)]))
            begin
              reg152 <= (|(7'h40));
              reg153 <= {reg118, $signed((8'ha8))};
            end
          else
            begin
              reg152 <= wire145[(1'h0):(1'h0)];
              reg153 <= reg120;
              reg154 <= $signed($signed(wire106[(4'ha):(4'h8)]));
              reg155 <= ((reg149 | $signed(reg127)) < (!(&reg151)));
              reg156 <= (^~$signed(($signed({reg149}) & wire104[(2'h3):(1'h0)])));
            end
          reg157 <= $signed((((!(reg122 ? reg153 : reg122)) ?
              ((reg111 ?
                  reg151 : wire100) ^~ $unsigned(wire132)) : reg120) << (~(&{reg152}))));
        end
      reg158 <= reg142;
      reg159 <= reg136;
      reg160 <= (~^$signed(reg125));
    end
  assign wire161 = $signed(wire104[(2'h2):(2'h2)]);
  assign wire162 = (wire98 < wire106);
  assign wire163 = reg128;
  assign wire164 = (~|reg148);
  assign wire165 = {wire99, $signed({$unsigned($unsigned(reg121))})};
endmodule

module module78
#(parameter param93 = ({(|(((8'h9c) < (8'hb8)) - (~(7'h43))))} != (~(~^(&{(8'hae)})))), 
parameter param94 = (!(&{(^~((8'ha1) <<< param93)), param93})))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire82;
  input wire [(4'hf):(1'h0)] wire81;
  input wire signed [(2'h2):(1'h0)] wire80;
  input wire [(5'h15):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg83 <= {wire79};
      reg84 <= $signed(($unsigned((&{wire79, wire81})) ?
          (-($unsigned(wire81) ?
              $signed(wire82) : $unsigned(reg83))) : (wire79 ?
              (|reg83) : (wire82 ?
                  wire79[(3'h7):(1'h0)] : wire79[(5'h10):(3'h7)]))));
      reg85 <= reg83[(3'h4):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg86 <= wire79[(4'hb):(4'hb)];
      reg87 <= $signed(({wire80, $signed((8'h9f))} ?
          (wire82[(2'h2):(1'h1)] < $unsigned(((8'haf) ~^ wire81))) : wire80[(1'h1):(1'h0)]));
      reg88 <= {(~wire82), reg83[(1'h1):(1'h1)]};
      reg89 <= wire82[(1'h1):(1'h1)];
    end
  assign wire90 = $unsigned(({$unsigned((reg88 ?
                          reg88 : (8'hb1)))} << wire79[(1'h0):(1'h0)]));
  assign wire91 = $unsigned($signed((reg85[(4'he):(4'h8)] ?
                      (8'hba) : (~|(reg85 ? reg86 : wire81)))));
  assign wire92 = reg86;
endmodule
