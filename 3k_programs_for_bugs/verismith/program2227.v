module top
#(parameter param178 = (8'hab), 
parameter param179 = (param178 ? ({param178, {param178}} ? param178 : ((^param178) * {(~&param178)})) : ({((param178 <= param178) * {param178})} ? (param178 * param178) : ((param178 + (param178 >> (8'hb5))) || (param178 ^~ (param178 ^ param178))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire177;
  wire signed [(4'hc):(1'h0)] wire176;
  wire signed [(2'h2):(1'h0)] wire175;
  wire signed [(5'h15):(1'h0)] wire172;
  wire signed [(5'h12):(1'h0)] wire171;
  wire signed [(5'h10):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire168;
  reg [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire172,
                 wire171,
                 wire170,
                 wire5,
                 wire6,
                 wire7,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire38,
                 wire168,
                 reg174,
                 reg173,
                 reg8,
                 reg9,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = {wire2};
  assign wire7 = ({((wire5[(1'h1):(1'h0)] - (8'ha0)) + wire0),
                         (~^$unsigned((~&wire5)))} ?
                     $unsigned(wire6) : {wire2,
                         (($signed(wire0) * (|wire0)) << (7'h41))});
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire2[(1'h1):(1'h0)]);
      reg9 <= (($signed({(wire7 != reg8)}) + ((|$unsigned(wire7)) << reg8[(1'h1):(1'h1)])) >= $unsigned(wire6[(2'h2):(2'h2)]));
    end
  assign wire10 = ((({(wire0 == wire0), $signed(wire3)} ?
                              wire2 : {$unsigned((8'ha8)), (-wire1)}) ?
                          wire0 : $unsigned({wire6[(2'h2):(2'h2)],
                              (wire3 ? (8'hac) : wire6)})) ?
                      {wire2[(2'h2):(1'h1)],
                          (!$unsigned((wire5 & (7'h44))))} : wire7[(1'h1):(1'h0)]);
  assign wire11 = $signed(wire0);
  assign wire12 = wire10[(3'h4):(2'h2)];
  assign wire13 = wire0;
  assign wire14 = (!$signed((wire0 ?
                      (8'hbb) : ((wire7 <= wire6) ? wire3 : wire10))));
  assign wire15 = ($signed((({reg8} * (wire3 < wire14)) | {(~&reg8)})) ?
                      (wire7 < (((wire4 == wire5) << $signed((8'ha1))) ?
                          $unsigned($signed((8'ha3))) : $signed(wire1))) : $unsigned({wire4,
                          $unsigned((wire10 & wire2))}));
  assign wire16 = ((((wire10 ?
                      (wire7 ?
                          wire3 : wire0) : $signed(wire12)) >> ($signed(wire0) ?
                      $signed(wire0) : wire12)) & $signed(((wire13 ~^ wire5) >> $unsigned(wire15)))) << wire5);
  always
    @(posedge clk) begin
      reg17 <= $signed(($unsigned(((wire10 ? (8'hbd) : wire13) ?
              wire14 : (~&wire12))) ?
          (~((&(8'hba)) == (8'hbe))) : $signed(({reg9, (7'h42)} <= wire5))));
      if ($signed((^~(^~$unsigned($signed(wire16))))))
        begin
          reg18 <= wire11[(1'h0):(1'h0)];
          if (((~|((-(reg17 ?
              wire6 : wire14)) >>> $unsigned(wire0[(4'h9):(3'h5)]))) - {wire3[(4'he):(3'h4)],
              (({wire10, wire3} >>> wire0[(4'ha):(4'h9)]) ?
                  (~&(^~wire1)) : wire7[(1'h0):(1'h0)])}))
            begin
              reg19 <= wire10;
              reg20 <= wire14[(4'hf):(4'h8)];
            end
          else
            begin
              reg19 <= (+(|(wire3[(4'h9):(3'h5)] >> $signed(wire12))));
              reg20 <= {wire1,
                  ({$unsigned($signed(reg18)),
                          (reg9[(4'hb):(3'h6)] ? (8'hbd) : (wire16 << wire2))} ?
                      wire1[(3'h5):(1'h1)] : ((!$unsigned(wire15)) ?
                          ((wire0 ? wire0 : wire2) ?
                              wire0[(2'h3):(2'h3)] : (wire5 ?
                                  (8'ha5) : wire15)) : ({wire2} >>> $signed(wire16))))};
              reg21 <= ((~|wire7) ?
                  reg20 : ($unsigned(wire0) ?
                      reg17[(1'h1):(1'h0)] : wire6[(2'h2):(1'h1)]));
              reg22 <= $unsigned(reg17[(2'h2):(1'h1)]);
              reg23 <= {(wire11[(2'h2):(1'h1)] ?
                      $signed((~|reg21[(2'h2):(1'h0)])) : wire6),
                  (~&wire5)};
            end
        end
      else
        begin
          reg18 <= $unsigned(((|wire13) ?
              ((reg20[(5'h10):(1'h0)] ?
                  $unsigned((8'h9c)) : $unsigned(reg9)) == $unsigned($signed((8'hbc)))) : $signed(({wire5,
                  (8'ha4)} | {(7'h43), (8'hae)}))));
          reg19 <= (((^$unsigned((reg22 || reg23))) ?
              $unsigned($signed({reg9, (8'hb1)})) : $signed(((&(8'h9e)) ?
                  $signed((8'hac)) : $signed((8'ha0))))) == (~&reg21));
          reg20 <= $unsigned({(~|($signed(wire0) ?
                  wire1[(3'h7):(3'h6)] : (wire6 >>> wire15))),
              $signed((~&reg9))});
          if ((8'hb6))
            begin
              reg21 <= wire11;
              reg22 <= {(8'ha1),
                  (reg20[(5'h10):(3'h5)] ? $unsigned(reg20) : wire7)};
              reg23 <= {(($unsigned((reg17 != reg18)) & (wire5 ?
                          (+wire3) : (wire13 >> (8'hbb)))) ?
                      wire16[(1'h0):(1'h0)] : ($unsigned($signed(wire15)) ?
                          $unsigned((^~reg18)) : ((reg22 >> wire4) ?
                              {wire14, reg18} : (wire2 ? (8'hba) : reg18)))),
                  wire15};
            end
          else
            begin
              reg21 <= ((8'hac) || ({(wire6[(2'h2):(2'h2)] || {wire6})} ^ (^(8'hb2))));
            end
        end
      reg24 <= wire7[(1'h0):(1'h0)];
      reg25 <= reg23;
    end
  module26 #() modinst39 (.clk(clk), .wire28(reg9), .wire29(reg25), .wire30(reg24), .y(wire38), .wire27(reg19));
  module40 #() modinst169 (wire168, clk, wire1, wire38, reg18, wire13);
  assign wire170 = reg20[(3'h4):(1'h1)];
  assign wire171 = (8'h9c);
  assign wire172 = wire16;
  always
    @(posedge clk) begin
      reg173 <= (~&wire14[(2'h3):(1'h0)]);
      reg174 <= ((wire14[(4'hb):(2'h2)] ^~ ((~^((8'had) + reg20)) ?
          wire11[(1'h1):(1'h1)] : $signed((~wire170)))) >= wire14[(4'hf):(1'h1)]);
    end
  assign wire175 = ($unsigned((~&reg22[(4'ha):(2'h2)])) ?
                       ({$unsigned((wire4 ?
                               wire14 : wire170))} >> wire16[(1'h1):(1'h1)]) : $unsigned(($unsigned($unsigned(reg19)) ?
                           reg8 : wire1[(4'ha):(1'h1)])));
  assign wire176 = reg17[(2'h2):(2'h2)];
  assign wire177 = (&($unsigned(wire7) ?
                       ($unsigned((wire15 ?
                           wire12 : wire0)) * wire1) : $unsigned($signed(wire2[(2'h2):(1'h1)]))));
endmodule

module module40
#(parameter param166 = ((((!{(8'h9c)}) ? (|((8'h9e) == (8'haa))) : (~^((8'hb1) < (7'h40)))) - ((~&((8'hac) ? (8'hb5) : (8'hb4))) << (8'ha6))) ? ((((^(8'hb8)) ? {(8'hbe), (8'hbc)} : ((8'hba) ? (8'haf) : (7'h43))) ^~ (((7'h42) ? (8'h9d) : (8'ha1)) <= (~^(8'hab)))) | {{{(8'hb5), (7'h40)}}}) : ((&(((8'hae) ? (8'hb4) : (8'h9f)) <= ((7'h44) ? (7'h44) : (8'ha3)))) ? (8'hbe) : ((8'h9c) ? (~|((8'ha5) ? (8'hb2) : (8'hbe))) : (((8'ha7) ? (8'hb0) : (8'haf)) <= ((8'hbe) | (8'hb7)))))), 
parameter param167 = ((({(param166 ~^ param166)} ^~ (-(^param166))) ? ((~^(^param166)) | param166) : ({(8'hbb), (^param166)} ? param166 : (&((8'ha1) != param166)))) ? (({param166, param166} || ((8'hbf) ? (param166 ~^ param166) : (-param166))) ? (((~param166) || (~&param166)) ? {(8'ha7), ((8'had) ? param166 : param166)} : param166) : param166) : (^~{param166})))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire signed [(5'h13):(1'h0)] wire43;
  input wire [(5'h15):(1'h0)] wire42;
  input wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire161;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(4'h9):(1'h0)] wire159;
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  assign y = {wire165,
                 wire161,
                 wire82,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire57,
                 wire46,
                 wire45,
                 wire139,
                 wire159,
                 reg164,
                 reg163,
                 reg162,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg58,
                 reg59,
                 reg64,
                 reg65,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 (1'h0)};
  assign wire45 = (|wire44);
  assign wire46 = {$unsigned(wire43), {(^$signed($unsigned(wire45)))}};
  always
    @(posedge clk) begin
      if ($unsigned(wire42))
        begin
          reg47 <= (&((8'ha2) ? wire42[(5'h10):(4'h9)] : (7'h40)));
          reg48 <= ((((|$unsigned(reg47)) ?
                  (wire41 ?
                      (|wire43) : $unsigned(wire43)) : (wire41[(3'h7):(3'h6)] ?
                      ((8'hbd) ? wire43 : wire46) : {wire46})) ?
              $signed((|(wire44 ? wire43 : wire45))) : {reg47,
                  wire43}) <<< (&(~&(^{wire42}))));
          if ($signed(wire42[(4'h9):(3'h4)]))
            begin
              reg49 <= (&{(wire42[(5'h10):(2'h3)] ?
                      (~|reg48) : {(~&(8'ha5))})});
            end
          else
            begin
              reg49 <= reg49[(2'h2):(1'h0)];
              reg50 <= wire43;
              reg51 <= (~^{$unsigned(((^wire44) ^~ $unsigned((8'h9f))))});
              reg52 <= (($signed({$signed(reg50), $signed(reg49)}) ?
                  $signed(reg47) : {$signed(((8'ha6) ?
                          reg48 : wire41))}) || $unsigned($signed(($unsigned(wire42) + wire45))));
            end
          reg53 <= (((!(~$unsigned(wire44))) ?
                  ((-$unsigned(wire41)) >>> (8'hbe)) : ((wire46 ^~ (~^reg48)) ?
                      wire45[(4'h8):(3'h5)] : {$signed(reg50),
                          $signed(wire46)})) ?
              $signed(($signed(reg48) ?
                  reg47 : (wire44 && (reg50 ?
                      wire46 : (8'ha2))))) : (~$unsigned($signed($signed(reg49)))));
          reg54 <= $signed(wire41[(3'h6):(2'h3)]);
        end
      else
        begin
          reg47 <= $signed((~&wire43));
        end
      reg55 <= ((^~($signed(wire46[(4'h8):(3'h6)]) < reg51)) ?
          $signed(reg51) : (~^($unsigned($signed(wire45)) <<< {{wire46}})));
      reg56 <= $signed(reg54[(2'h3):(1'h0)]);
    end
  assign wire57 = reg48[(4'hd):(2'h2)];
  always
    @(posedge clk) begin
      reg58 <= (((reg50[(1'h1):(1'h0)] <= ((8'ha3) ?
              (reg48 ?
                  wire45 : wire46) : {reg48})) << $signed(({(8'h9c)} + (+reg55)))) ?
          $signed(($unsigned($unsigned(reg54)) ?
              $signed($unsigned(reg56)) : reg50)) : ($unsigned(reg47) ?
              (!(&{reg49, (8'hbb)})) : reg55[(1'h0):(1'h0)]));
      reg59 <= $signed(($unsigned(((wire57 ? reg58 : wire57) ?
              $unsigned(reg52) : $unsigned(reg50))) ?
          (((-wire45) ? ((8'ha1) <<< reg55) : {wire42, reg52}) ?
              (|$signed(reg48)) : ((reg52 < reg53) >> $signed(reg51))) : $unsigned(({reg51,
                  reg47} ?
              $unsigned(reg53) : $signed((8'h9c))))));
    end
  assign wire60 = (&(reg50 <<< (((~^wire44) - {(8'hbc), reg50}) ?
                      wire44 : (!reg56[(2'h2):(1'h1)]))));
  assign wire61 = ($unsigned(wire45[(2'h2):(1'h0)]) ?
                      (+$unsigned({reg48[(4'he):(1'h0)]})) : wire45);
  assign wire62 = (reg56[(2'h2):(2'h2)] < wire57[(4'ha):(3'h5)]);
  assign wire63 = wire61;
  always
    @(posedge clk) begin
      reg64 <= (reg54 ? wire42 : reg58);
      reg65 <= wire42;
    end
  assign wire66 = ($signed(((-reg55) ? $signed($unsigned(wire42)) : reg47)) ?
                      $unsigned((^($signed(reg51) ?
                          $unsigned(wire61) : reg49[(4'hd):(4'ha)]))) : $signed(reg55));
  assign wire67 = $signed(((~|(~^reg50[(3'h5):(2'h3)])) != reg54));
  assign wire68 = $unsigned(wire41);
  assign wire69 = (reg53 ? reg59 : $unsigned(reg64));
  assign wire70 = $signed($signed(((((8'ha4) ? reg54 : wire62) ?
                      reg65 : reg56[(1'h1):(1'h0)]) > (~$signed(reg50)))));
  module71 #() modinst83 (wire82, clk, wire62, reg50, wire70, wire46);
  module84 #() modinst140 (.wire85(wire63), .wire87(wire70), .wire88(wire62), .y(wire139), .clk(clk), .wire86(reg51), .wire89(wire69));
  always
    @(posedge clk) begin
      reg141 <= (7'h42);
      reg142 <= $unsigned($signed($signed(((8'ha7) ^~ (~reg51)))));
      reg143 <= $signed($unsigned($signed(reg56[(3'h5):(3'h5)])));
      reg144 <= (-$signed($unsigned((^~{wire62}))));
      reg145 <= ($signed({(wire60 >>> (reg144 && reg65))}) <= reg50[(4'h8):(3'h7)]);
    end
  module146 #() modinst160 (.wire148(reg55), .wire149(reg59), .wire147(reg48), .y(wire159), .wire150(wire139), .clk(clk));
  assign wire161 = (!((wire82[(1'h1):(1'h1)] ^ (+wire70[(2'h2):(1'h1)])) ?
                       $signed($unsigned(reg47[(1'h1):(1'h0)])) : (|wire60[(4'hb):(1'h0)])));
  always
    @(posedge clk) begin
      reg162 <= wire44;
      reg163 <= reg64;
      reg164 <= wire139;
    end
  assign wire165 = ($unsigned(($unsigned((reg163 ?
                           reg50 : reg143)) * (!$signed(wire139)))) ?
                       ($unsigned((~^$unsigned((8'ha9)))) ?
                           wire161[(3'h7):(3'h7)] : ($signed((^~(8'had))) ?
                               (wire62[(4'he):(1'h1)] ?
                                   $unsigned(wire61) : (reg141 ?
                                       reg141 : reg65)) : reg48)) : {wire44});
endmodule

module module26
#(parameter param37 = (&((~&(-(|(8'hba)))) & ((((8'hbd) <<< (7'h41)) ? {(7'h42), (8'hbb)} : {(8'hbd), (8'hb3)}) ? (!(~&(8'hbf))) : {{(8'hb1)}}))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire30;
  input wire signed [(3'h7):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  input wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  assign y = {wire36, wire35, wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = $signed(wire29);
  assign wire32 = wire27[(1'h1):(1'h1)];
  assign wire33 = $unsigned($unsigned($unsigned(wire29[(3'h6):(1'h0)])));
  assign wire34 = (($unsigned(($signed(wire30) >= ((8'hae) ?
                          wire31 : wire29))) + {((wire27 ?
                              wire31 : wire33) - (wire27 ^~ wire31))}) ?
                      ((+$signed((8'hbd))) == ((8'ha8) ?
                          $unsigned($signed((8'hb0))) : ((wire30 ?
                                  (8'ha2) : (8'hb5)) ?
                              (wire27 ?
                                  (8'hbd) : (8'h9f)) : (^wire30)))) : (wire31[(4'ha):(4'h8)] ?
                          wire27[(1'h0):(1'h0)] : ($signed((wire33 ?
                                  wire33 : (8'had))) ?
                              wire28[(3'h7):(1'h0)] : ($signed(wire33) ?
                                  wire27 : (wire27 > (8'h9e))))));
  assign wire35 = (wire27 ? wire32[(1'h0):(1'h0)] : wire34[(3'h5):(2'h3)]);
  assign wire36 = ((~|wire29[(2'h2):(2'h2)]) & (wire29[(2'h3):(1'h0)] ?
                      wire31[(2'h3):(2'h3)] : wire30));
endmodule

module module146
#(parameter param158 = ((^~(8'haf)) & (({((8'hbc) ? (8'hbe) : (8'hbd))} ? (~|((8'hb2) ? (8'hba) : (8'ha0))) : {{(8'ha5)}}) != (!(~^((7'h41) == (8'hba)))))))
(y, clk, wire150, wire149, wire148, wire147);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire150;
  input wire [(3'h7):(1'h0)] wire149;
  input wire signed [(4'hf):(1'h0)] wire148;
  input wire signed [(5'h15):(1'h0)] wire147;
  wire [(3'h4):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  assign y = {wire157,
                 wire152,
                 wire151,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 (1'h0)};
  assign wire151 = wire149[(1'h0):(1'h0)];
  assign wire152 = (wire150[(4'h9):(3'h7)] ?
                       ((|wire149[(2'h3):(2'h2)]) | ($signed({wire150}) != $unsigned((wire148 ?
                           wire151 : wire150)))) : (wire148 | $signed((8'had))));
  always
    @(posedge clk) begin
      reg153 <= {(-($signed((wire151 < wire151)) <<< wire148)),
          $signed({(~^(-wire151))})};
      reg154 <= (reg153[(4'h9):(3'h6)] || (wire148 != ($signed((wire149 ?
              wire150 : wire149)) ?
          {{wire147}} : $unsigned(reg153))));
      reg155 <= $unsigned((((wire147 != {reg154}) * $unsigned(((8'hab) ?
              (8'hbd) : wire149))) ?
          wire147[(5'h14):(2'h3)] : ($signed((wire149 ? wire150 : reg154)) ?
              wire149[(3'h4):(1'h0)] : wire150[(4'hd):(2'h2)])));
      reg156 <= $unsigned({wire152,
          (wire150 ?
              wire147 : (wire152[(1'h1):(1'h1)] ?
                  (~|reg153) : $signed(wire148)))});
    end
  assign wire157 = reg156;
endmodule

module module84
#(parameter param138 = ((&({(~&(7'h40))} ? (^{(8'hb7), (8'hbb)}) : (((8'ha7) >> (8'h9f)) ? ((8'hb5) ? (7'h42) : (8'ha9)) : ((8'ha2) ? (8'haf) : (8'hbf))))) ? ({(~^(&(8'hba))), (8'h9c)} >>> (!(((8'haa) ? (8'ha4) : (7'h42)) ? ((8'haa) > (8'h9d)) : {(8'ha7), (8'ha7)}))) : (~|((~&((8'h9d) ? (8'hb7) : (8'ha1))) ? (((8'hb1) ? (8'haf) : (8'hb5)) ? ((8'hb7) | (8'haa)) : {(8'ha7), (8'hb7)}) : {(+(8'haf)), (~^(8'ha4))}))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h22f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire89;
  input wire [(4'he):(1'h0)] wire88;
  input wire signed [(4'hb):(1'h0)] wire87;
  input wire signed [(3'h4):(1'h0)] wire86;
  input wire [(4'ha):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire104,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg131,
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
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire90 = (~|($unsigned($signed($unsigned(wire85))) ?
                      $signed((!$unsigned(wire88))) : ({(^~wire87),
                          {wire87}} & $signed(((8'hab) ? (8'haf) : wire85)))));
  assign wire91 = wire90;
  assign wire92 = wire85[(2'h3):(1'h0)];
  assign wire93 = $unsigned($unsigned((^~((+wire85) ?
                      (wire88 ? wire85 : wire86) : (wire91 ?
                          (8'hab) : (8'hbe))))));
  assign wire94 = (((({wire93, wire93} ?
                          wire92[(1'h1):(1'h0)] : wire92[(1'h0):(1'h0)]) ?
                      (wire93 ?
                          wire85 : (-wire90)) : wire93[(1'h1):(1'h0)]) <= $signed(((wire90 ~^ wire86) ?
                      wire91[(4'hc):(2'h2)] : $signed(wire88)))) ~^ wire85);
  assign wire95 = ($signed(wire89) ?
                      $signed($unsigned({$unsigned(wire86)})) : ($signed((!$signed(wire89))) >= (~|$unsigned(wire94[(4'h8):(1'h1)]))));
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed((~&(wire92 ? (8'hb7) : wire91))))))
        begin
          reg96 <= $signed(wire91[(4'h9):(2'h3)]);
          if ((8'ha2))
            begin
              reg97 <= $signed((wire94[(4'h9):(3'h5)] ?
                  (wire85 == wire94[(1'h0):(1'h0)]) : (wire91 ?
                      wire94[(4'hb):(2'h2)] : wire88[(4'he):(4'hc)])));
              reg98 <= wire89[(1'h1):(1'h1)];
              reg99 <= wire91;
            end
          else
            begin
              reg97 <= $signed($unsigned($unsigned($signed(wire87[(1'h1):(1'h1)]))));
              reg98 <= ($signed($unsigned({$signed(wire87),
                  wire90})) == {((((8'hbc) ?
                          wire95 : (7'h42)) <<< $unsigned(wire89)) ?
                      $unsigned((wire85 >> reg99)) : (^$signed(wire95)))});
            end
          reg100 <= ({wire88, wire95} + {{(8'hb2)}});
          reg101 <= wire85[(4'h8):(2'h2)];
          reg102 <= wire95;
        end
      else
        begin
          reg96 <= ($signed(wire91) ? {reg100, wire88} : reg100);
        end
      reg103 <= $unsigned((|wire86));
    end
  assign wire104 = {(reg98 ? wire95[(1'h0):(1'h0)] : $unsigned(reg99)),
                       (~&$unsigned(((-(8'hbc)) ?
                           {wire94} : $unsigned((7'h43)))))};
  always
    @(posedge clk) begin
      reg105 <= $signed(((8'hab) < $unsigned(wire91[(4'hf):(4'hf)])));
      if (wire90)
        begin
          reg106 <= (reg98[(3'h5):(1'h1)] ?
              $signed((reg102 ?
                  reg105[(3'h5):(2'h3)] : {{wire91, wire86},
                      wire88})) : $signed(wire93[(3'h4):(3'h4)]));
          reg107 <= reg97;
          reg108 <= (8'h9d);
          reg109 <= reg102[(1'h1):(1'h0)];
          reg110 <= ({((~&$signed(reg102)) ?
                  wire104[(2'h3):(1'h1)] : ((8'hb6) ?
                      {reg108,
                          wire87} : $unsigned(reg102)))} ^~ wire89[(2'h3):(2'h2)]);
        end
      else
        begin
          reg106 <= reg101;
          reg107 <= $unsigned($signed($signed(($signed(wire88) > {reg110}))));
          reg108 <= {(~&(8'hb5))};
          reg109 <= {$unsigned(wire86[(2'h2):(1'h0)]),
              $signed({$signed(wire90)})};
        end
      reg111 <= $unsigned((^((wire91[(3'h7):(2'h2)] ?
              (wire104 ? reg103 : reg101) : (~(8'ha3))) ?
          wire104[(1'h0):(1'h0)] : ((reg107 && reg98) != {wire86, reg98}))));
      reg112 <= $unsigned({($signed((^~reg107)) ?
              reg108[(3'h4):(2'h2)] : ((~reg110) ?
                  $signed(reg97) : (^reg101)))});
    end
  assign wire113 = ((((wire85[(3'h4):(2'h3)] ?
                               (wire93 ? reg101 : wire86) : reg100) ?
                           (^~(reg101 >> reg109)) : $unsigned({wire90,
                               reg102})) ?
                       $signed(reg100) : reg96[(1'h1):(1'h0)]) ~^ ($unsigned($unsigned((reg96 ?
                           reg112 : (8'haf)))) ?
                       $unsigned(reg109[(4'h8):(2'h2)]) : $signed((wire95[(3'h4):(1'h1)] ?
                           ((8'had) ? wire89 : wire91) : (~(8'ha7))))));
  assign wire114 = (reg103 ?
                       (~^((~|reg111[(5'h10):(4'hb)]) <<< $signed((reg99 ?
                           reg108 : (8'hac))))) : $signed($signed((~&$unsigned(reg98)))));
  assign wire115 = $signed(reg111);
  assign wire116 = $unsigned(wire88);
  always
    @(posedge clk) begin
      reg117 <= (-wire88);
      if (((reg96[(2'h2):(1'h1)] && ((8'hb7) ?
              $signed(reg100) : (^$signed(wire92)))) ?
          (|(wire92 ?
              $signed({reg97}) : ((~&wire87) ?
                  reg110[(1'h1):(1'h0)] : $signed(reg109)))) : wire91))
        begin
          reg118 <= ($unsigned(reg96) ?
              wire116[(3'h7):(1'h1)] : (wire94[(4'h9):(4'h8)] >> ($signed(wire116) ?
                  wire104 : ((wire116 ? reg109 : reg108) ?
                      $signed(reg103) : $signed(reg107)))));
          reg119 <= $signed((~&wire115[(3'h5):(1'h1)]));
          reg120 <= wire87;
        end
      else
        begin
          if (reg102[(4'h9):(2'h3)])
            begin
              reg118 <= (~^(~(wire88 ?
                  {wire90[(4'h8):(3'h4)], (+wire114)} : (8'hbe))));
              reg119 <= wire95[(1'h1):(1'h0)];
              reg120 <= ($signed(reg111) ? {reg111} : wire88);
            end
          else
            begin
              reg118 <= $signed(($unsigned(wire86[(2'h2):(2'h2)]) ?
                  reg117 : $signed((8'hbc))));
              reg119 <= (!$unsigned((((8'hb2) * $signed(reg111)) << ((reg98 ?
                  wire93 : (8'hb9)) != ((8'hab) >> reg117)))));
              reg120 <= {$unsigned($signed(wire114[(1'h1):(1'h0)]))};
              reg121 <= $signed(wire88);
              reg122 <= $unsigned(((wire114[(1'h0):(1'h0)] ^~ ((reg99 <= reg96) | reg103[(2'h3):(2'h3)])) != (reg119[(4'h9):(2'h2)] ?
                  $unsigned((reg118 & reg117)) : (~|reg101[(3'h5):(1'h0)]))));
            end
          if ($signed(reg100))
            begin
              reg123 <= (+reg107[(3'h4):(3'h4)]);
            end
          else
            begin
              reg123 <= (!$signed((^{(wire115 ? reg122 : reg123)})));
              reg124 <= ({reg96, wire114} >> $signed((8'hb8)));
              reg125 <= $signed($signed($signed(((+wire87) ?
                  $signed(reg111) : (&(8'ha6))))));
            end
        end
      reg126 <= reg108;
      reg127 <= (wire89[(4'h9):(2'h2)] ?
          (((~|{wire95, reg97}) ^~ $signed((wire95 ~^ reg96))) ?
              ((~$signed(wire114)) ?
                  (~|$unsigned(reg122)) : (~&{(8'h9f),
                      reg96})) : ($unsigned(((8'ha6) || wire93)) * $signed($unsigned((8'haa))))) : (+reg119));
    end
  always
    @(posedge clk) begin
      if ((($signed((~wire95)) >= reg101[(2'h2):(2'h2)]) ?
          $signed((reg110[(4'h8):(2'h2)] ?
              $unsigned(reg118) : $signed((&(8'hb1))))) : (|(^~$unsigned((reg122 ?
              reg124 : wire92))))))
        begin
          reg128 <= $signed(($unsigned({(reg108 <<< reg100),
                  $unsigned((8'hbc))}) ?
              $unsigned($unsigned((~^(8'ha5)))) : reg125[(1'h0):(1'h0)]));
        end
      else
        begin
          reg128 <= $signed((|(reg127 <<< {wire95[(4'hb):(3'h6)],
              $unsigned((8'hb7))})));
          reg129 <= ({$unsigned({wire104[(1'h0):(1'h0)]}),
              reg108[(2'h3):(2'h3)]} << $unsigned(reg109));
        end
      reg130 <= $signed(((($unsigned((8'h9e)) != (wire104 ^~ reg101)) && $signed($unsigned(wire93))) >>> reg96[(1'h1):(1'h0)]));
      reg131 <= (|(~((+((8'hb9) ?
          reg103 : reg103)) >>> $signed($unsigned(reg126)))));
    end
  assign wire132 = (($unsigned(wire114[(1'h0):(1'h0)]) ?
                           reg103[(3'h5):(1'h0)] : (($signed(reg118) ?
                               (wire90 ?
                                   wire86 : wire88) : $signed(reg129)) > (wire91[(4'hb):(3'h4)] ?
                               $unsigned(reg102) : (reg107 <= reg105)))) ?
                       $signed(($signed($unsigned(reg106)) ?
                           ((-reg125) ?
                               (reg96 * reg131) : {wire89,
                                   wire115}) : {(reg123 ? (8'hb1) : wire114),
                               {reg124}})) : wire116[(2'h3):(2'h3)]);
  assign wire133 = wire88;
  assign wire134 = (+(reg119[(1'h1):(1'h1)] ?
                       $unsigned($unsigned(wire91)) : reg129[(3'h4):(3'h4)]));
  assign wire135 = (((~((|reg111) || (7'h44))) ?
                           $signed((wire133[(1'h0):(1'h0)] ^~ (reg108 ?
                               reg117 : wire116))) : reg123[(5'h13):(4'ha)]) ?
                       reg123[(4'h9):(1'h1)] : $signed(reg107));
  assign wire136 = $signed($unsigned(reg131));
  assign wire137 = ($signed((reg107 ?
                       ((reg100 ~^ reg117) + $unsigned(reg121)) : $signed((^~reg130)))) << ($signed(wire85[(4'ha):(1'h1)]) * $signed(({wire95,
                           reg110} ?
                       ((8'hbf) ? wire114 : (8'hac)) : reg130))));
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire75;
  input wire signed [(4'hc):(1'h0)] wire74;
  input wire signed [(5'h14):(1'h0)] wire73;
  input wire [(4'h8):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  assign y = {wire81, wire80, wire79, wire78, wire77, wire76, (1'h0)};
  assign wire76 = wire75[(1'h1):(1'h0)];
  assign wire77 = wire75[(3'h4):(2'h3)];
  assign wire78 = {$signed($unsigned($signed($signed(wire76)))),
                      ({wire74} >> $unsigned($signed($unsigned((7'h40)))))};
  assign wire79 = wire77[(2'h3):(1'h0)];
  assign wire80 = ((|$unsigned({(~|wire78)})) * (~&$unsigned($signed($signed(wire79)))));
  assign wire81 = wire74[(2'h2):(1'h0)];
endmodule
