module top
#(parameter param228 = ({{{(~^(8'haa)), ((8'haa) ? (7'h41) : (8'hb9))}}} ? (8'h9e) : (((~(~&(8'hbc))) * (((8'haf) | (8'ha7)) == (+(8'hbf)))) ? (~^(+(8'ha3))) : ((~^{(8'hb4)}) ? ((&(8'hb6)) ? {(8'ha0)} : (-(8'hb5))) : (!((8'h9c) ? (8'ha6) : (8'h9f)))))), 
parameter param229 = {(param228 ? (-((param228 - param228) ? (&param228) : {param228})) : {param228, (&(param228 <<< (7'h43)))})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire227;
  wire signed [(5'h10):(1'h0)] wire226;
  wire [(4'h8):(1'h0)] wire225;
  wire [(5'h12):(1'h0)] wire224;
  wire signed [(2'h3):(1'h0)] wire223;
  wire signed [(5'h13):(1'h0)] wire222;
  wire signed [(5'h12):(1'h0)] wire221;
  wire [(4'ha):(1'h0)] wire220;
  wire [(5'h12):(1'h0)] wire218;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire218,
                 wire26,
                 wire8,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
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
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h0)];
  assign wire5 = $unsigned($unsigned((~(+wire4[(3'h4):(1'h1)]))));
  assign wire6 = $signed(wire4[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg7 <= {$signed($unsigned($signed((8'ha5))))};
    end
  assign wire8 = (wire6 <<< wire6);
  always
    @(posedge clk) begin
      reg9 <= (|{$unsigned(wire6[(4'h9):(3'h7)])});
      if (($signed(((~&(-(8'hb3))) ?
              wire6[(3'h4):(1'h1)] : {{wire6}, (wire6 ? wire1 : wire5)})) ?
          ($signed((wire0 & (~^wire0))) ?
              wire6[(3'h7):(3'h4)] : (^$unsigned($signed(reg9)))) : wire4[(2'h2):(1'h1)]))
        begin
          if ($signed($signed($signed(($signed(reg7) ?
              $signed(wire4) : wire1)))))
            begin
              reg10 <= $signed(($unsigned($signed($unsigned(wire0))) <<< $signed(wire0[(2'h3):(1'h0)])));
              reg11 <= ((((^~$signed(wire2)) != wire5[(2'h3):(2'h2)]) ?
                  reg7[(1'h1):(1'h0)] : wire8[(2'h3):(1'h1)]) == (wire5[(3'h7):(3'h4)] && {((wire5 ?
                      reg7 : (8'ha6)) == $signed(reg7))}));
            end
          else
            begin
              reg10 <= (+{wire5[(1'h0):(1'h0)]});
              reg11 <= reg9[(4'h9):(2'h3)];
              reg12 <= ({reg9[(4'h8):(4'h8)], (^~$signed(wire4))} ?
                  $signed((&(8'ha4))) : (((+(wire4 <= reg7)) == (~&wire4)) ?
                      wire6[(3'h7):(3'h4)] : (~&$signed($signed(wire0)))));
              reg13 <= ((+$signed((&wire1[(4'h8):(1'h0)]))) < wire3);
            end
          reg14 <= (((wire4[(3'h5):(2'h3)] ?
                  (wire6 <<< reg7) : wire0[(3'h4):(1'h0)]) <<< $signed($unsigned($signed(wire4)))) ?
              wire3[(3'h4):(2'h2)] : reg11[(2'h3):(1'h0)]);
          reg15 <= wire3[(1'h1):(1'h0)];
          reg16 <= reg10[(3'h6):(3'h5)];
          reg17 <= reg16;
        end
      else
        begin
          reg10 <= ($unsigned((~$signed(wire6[(3'h5):(3'h5)]))) ?
              reg10 : ($unsigned(reg11[(1'h1):(1'h0)]) == $signed(((wire6 ?
                  reg10 : reg7) << (reg11 ^ reg9)))));
        end
      reg18 <= ($unsigned((((~reg9) || (^~reg7)) ?
          (^~(&reg13)) : {$unsigned(reg14),
              wire0[(3'h7):(2'h2)]})) | $signed((reg7 ?
          wire0[(4'hb):(4'h8)] : reg15[(2'h3):(2'h3)])));
      if (reg15[(5'h12):(4'hd)])
        begin
          if ($signed((8'ha7)))
            begin
              reg19 <= ({reg7} && wire4[(2'h2):(1'h1)]);
              reg20 <= ($unsigned(wire3[(2'h3):(2'h3)]) ? reg19 : reg14);
            end
          else
            begin
              reg19 <= {$unsigned((!($unsigned(reg17) <= reg7[(4'h8):(4'h8)]))),
                  $signed(reg19)};
              reg20 <= reg20;
              reg21 <= (($signed(reg15[(2'h2):(2'h2)]) < reg19[(3'h7):(3'h6)]) ?
                  $unsigned(($signed((reg15 ? reg9 : reg9)) ?
                      (wire6[(4'hc):(1'h0)] ?
                          reg7[(4'hf):(3'h6)] : ((8'hbf) > reg16)) : ($unsigned(reg15) <= (-reg12)))) : (^reg17[(1'h1):(1'h0)]));
              reg22 <= wire6[(4'ha):(2'h3)];
            end
          reg23 <= ((~&($unsigned($signed(reg7)) ?
                  reg16[(1'h0):(1'h0)] : wire2[(1'h0):(1'h0)])) ?
              (^($signed(wire3) != {(!(8'hab))})) : reg12[(2'h2):(1'h1)]);
          reg24 <= (+(wire6 == (8'hb0)));
          reg25 <= reg17[(2'h2):(2'h2)];
        end
      else
        begin
          reg19 <= (~|$signed((~&$unsigned(wire6[(4'hd):(4'hd)]))));
          reg20 <= reg25[(2'h3):(1'h1)];
          reg21 <= reg10[(4'ha):(3'h7)];
          reg22 <= {(&(8'h9d))};
          reg23 <= reg21;
        end
    end
  assign wire26 = (^~$signed(reg15));
  module27 #() modinst219 (wire218, clk, reg19, wire26, wire1, reg24, reg23);
  assign wire220 = ((~^$signed(($unsigned(wire0) ?
                       (~wire2) : $signed((8'hb9))))) < ($signed($signed(reg20)) >= $signed({reg11[(1'h0):(1'h0)]})));
  assign wire221 = ($unsigned($unsigned((^~{reg11, reg7}))) & ((~&wire220) ?
                       reg23[(3'h6):(3'h5)] : ($unsigned((reg14 == (7'h40))) < wire3[(2'h3):(1'h1)])));
  assign wire222 = {((~&{{(8'ha1), reg10},
                           (reg15 >>> reg23)}) >>> ($signed(wire6[(3'h4):(1'h1)]) ?
                           wire1 : reg15))};
  assign wire223 = reg14;
  assign wire224 = (8'ha9);
  assign wire225 = ((wire0[(4'hb):(3'h6)] ?
                       $unsigned(((~|wire221) ?
                           (+reg16) : $unsigned((8'hb1)))) : reg16[(3'h5):(1'h0)]) <= $unsigned(reg12[(3'h5):(2'h2)]));
  assign wire226 = {$signed($signed(((wire221 ? (7'h44) : wire224) ?
                           (wire3 ? wire4 : (8'hb3)) : (reg19 ?
                               reg23 : reg9)))),
                       $signed((wire218 > ((reg13 < wire26) <= {wire218,
                           reg18})))};
  assign wire227 = reg22[(2'h3):(1'h0)];
endmodule

module module27
#(parameter param216 = ((((-(^(8'ha8))) ? (8'hac) : ({(8'h9d)} ? (&(8'hb9)) : {(8'ha4)})) ? ({((8'ha1) == (8'had)), (~(8'hbc))} <<< (((8'h9c) ^ (8'ha2)) >>> ((8'h9f) >> (8'hb3)))) : (8'ha4)) + (((!{(8'had), (8'hb2)}) >= ((&(8'hba)) * (~&(8'ha7)))) ? ((((8'hb6) <<< (8'hb7)) || ((8'hab) ? (8'ha8) : (8'hb4))) ? (((8'hbf) ? (8'hae) : (8'hb7)) ^~ {(8'haa), (8'h9c)}) : (!((8'ha8) ? (8'ha2) : (8'had)))) : (((7'h44) ? {(8'haf), (7'h41)} : ((8'hb8) ? (8'ha0) : (8'hb6))) | {{(8'hb2)}, (|(8'hb2))}))), 
parameter param217 = param216)
(y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'h38f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire28;
  input wire [(3'h4):(1'h0)] wire29;
  input wire signed [(4'hb):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire215;
  wire [(5'h10):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire155;
  wire [(4'hb):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire162;
  wire signed [(4'hc):(1'h0)] wire193;
  reg [(4'hb):(1'h0)] reg214 = (1'h0);
  reg [(4'hf):(1'h0)] reg213 = (1'h0);
  reg [(2'h2):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg211 = (1'h0);
  reg [(5'h11):(1'h0)] reg210 = (1'h0);
  reg [(4'hf):(1'h0)] reg209 = (1'h0);
  reg [(5'h13):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg207 = (1'h0);
  reg [(4'hd):(1'h0)] reg206 = (1'h0);
  reg [(5'h13):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg204 = (1'h0);
  reg [(5'h11):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg201 = (1'h0);
  reg [(4'hf):(1'h0)] reg200 = (1'h0);
  reg [(5'h10):(1'h0)] reg199 = (1'h0);
  reg [(5'h10):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg197 = (1'h0);
  reg [(2'h3):(1'h0)] reg196 = (1'h0);
  reg [(4'he):(1'h0)] reg195 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  assign y = {wire215,
                 wire153,
                 wire33,
                 wire34,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire55,
                 wire75,
                 wire116,
                 wire155,
                 wire161,
                 wire162,
                 wire193,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
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
                 reg197,
                 reg196,
                 reg195,
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
                 reg58,
                 reg57,
                 reg56,
                 reg54,
                 reg53,
                 reg52,
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
                 reg36,
                 reg35,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 (1'h0)};
  assign wire33 = (&$unsigned((~|($signed((8'ha5)) ?
                      $unsigned(wire31) : (wire31 >= wire28)))));
  assign wire34 = (~wire29);
  always
    @(posedge clk) begin
      reg35 <= $unsigned($unsigned(wire33[(3'h4):(1'h0)]));
      reg36 <= (^$signed(wire32));
    end
  assign wire37 = $signed($signed((wire32 ? reg35 : (~wire30))));
  assign wire38 = $unsigned((wire29 <= (((!reg36) > {wire30,
                      reg35}) - wire37[(4'h8):(3'h4)])));
  assign wire39 = wire30[(4'h9):(4'h9)];
  assign wire40 = $signed($signed((~&{$unsigned(wire32), $unsigned(wire28)})));
  assign wire41 = (|(+{$unsigned(reg35),
                      ({(8'hb3)} ?
                          wire33[(1'h1):(1'h0)] : wire39[(1'h1):(1'h0)])}));
  always
    @(posedge clk) begin
      if ({(((wire30 ?
              $unsigned(wire38) : ((8'hb1) && wire40)) << (-reg35[(4'hf):(4'ha)])) != wire40)})
        begin
          reg42 <= reg35[(3'h6):(3'h4)];
          if (((~$unsigned($unsigned((wire28 ? wire32 : wire38)))) ?
              (wire39[(2'h3):(1'h1)] ? wire37 : reg36[(1'h1):(1'h1)]) : wire41))
            begin
              reg43 <= (~|((|$signed($signed(reg42))) ?
                  {$unsigned({wire31}), (8'ha6)} : wire32));
              reg44 <= {($signed(((wire29 ? wire31 : (8'hb5)) ?
                          (8'haf) : $signed(wire29))) ?
                      ((+$signed(wire40)) ?
                          wire38 : $unsigned({reg35, reg43})) : wire28),
                  {wire32[(3'h4):(1'h0)],
                      {wire31[(1'h0):(1'h0)], $signed((wire33 >>> reg42))}}};
              reg45 <= $signed(wire30);
              reg46 <= wire33;
            end
          else
            begin
              reg43 <= ((~(wire33[(1'h0):(1'h0)] ^ {(wire41 ? (8'hbb) : wire34),
                  reg46})) > {wire28[(4'h8):(3'h5)]});
              reg44 <= (wire34[(2'h3):(2'h2)] >= (-{reg42,
                  $unsigned((&reg42))}));
              reg45 <= wire41[(3'h6):(3'h4)];
            end
          if (($unsigned($signed(wire39[(2'h3):(1'h1)])) ?
              reg45[(3'h4):(2'h3)] : (((wire33[(1'h1):(1'h0)] ?
                  ((8'hb7) ?
                      wire29 : reg42) : wire28[(4'hc):(1'h1)]) * $signed($signed((8'hb1)))) || (~|wire41[(4'h8):(4'h8)]))))
            begin
              reg47 <= {$signed(wire41),
                  (!(($unsigned(wire30) ? (reg43 * wire29) : (~|wire34)) ?
                      reg35 : (|(wire40 ? wire40 : wire28))))};
              reg48 <= wire40;
            end
          else
            begin
              reg47 <= $signed((+(wire41[(4'hd):(4'hb)] && (^{reg46}))));
            end
          if ((|$unsigned($unsigned(reg44[(3'h4):(2'h2)]))))
            begin
              reg49 <= $unsigned({(^((wire38 ?
                      (8'h9e) : wire39) > $signed(reg46))),
                  reg48});
            end
          else
            begin
              reg49 <= {(!(8'h9e))};
              reg50 <= (reg48 ?
                  (reg43 >> {{wire34[(3'h6):(2'h2)], reg48}}) : (8'hb2));
              reg51 <= $signed($unsigned((wire32 ~^ (8'hae))));
              reg52 <= $signed((~^(reg51[(4'h9):(3'h6)] - {{wire33, reg36},
                  (+reg48)})));
            end
          reg53 <= reg45;
        end
      else
        begin
          if ((^~wire30))
            begin
              reg42 <= {(~$signed((^reg43))),
                  (~&$unsigned((reg45 ? (^wire39) : (reg52 ^~ reg43))))};
            end
          else
            begin
              reg42 <= reg45;
              reg43 <= ((|(^(!(wire41 ? reg49 : reg49)))) & $signed(reg45));
              reg44 <= (-reg49[(3'h6):(3'h4)]);
            end
          if ((~&reg51))
            begin
              reg45 <= $unsigned((-reg52[(4'hf):(3'h5)]));
              reg46 <= (-((+$unsigned((~|wire38))) ?
                  (reg35 ? reg42[(1'h1):(1'h0)] : reg53) : (~(~&wire39))));
              reg47 <= wire31;
              reg48 <= reg52;
            end
          else
            begin
              reg45 <= $signed($signed($signed(reg51)));
              reg46 <= wire39;
              reg47 <= ((&(8'hac)) > (($unsigned((~wire40)) ^ wire29) ?
                  {(~wire29[(3'h4):(2'h3)])} : ($signed((|wire28)) ~^ wire28)));
              reg48 <= (+wire34[(3'h4):(1'h0)]);
              reg49 <= $unsigned(wire41);
            end
          if ((!$signed($unsigned($unsigned((8'hb8))))))
            begin
              reg50 <= $signed(reg52);
            end
          else
            begin
              reg50 <= $unsigned(reg47);
              reg51 <= ($unsigned(reg53[(4'he):(4'ha)]) ?
                  ($signed((!$unsigned(reg47))) >> {reg52,
                      $signed($signed(reg42))}) : reg45);
              reg52 <= wire39;
              reg53 <= (reg44 ?
                  $signed(reg52) : ((((wire34 ^~ wire33) - {wire40,
                      reg42}) >> reg36[(1'h0):(1'h0)]) <<< reg48[(4'he):(4'hc)]));
            end
        end
      reg54 <= $unsigned(reg36[(3'h4):(2'h3)]);
    end
  assign wire55 = $unsigned($unsigned(wire41[(4'he):(1'h0)]));
  always
    @(posedge clk) begin
      reg56 <= (~&($unsigned((~reg50[(4'hd):(3'h4)])) ?
          wire33[(3'h4):(1'h0)] : $unsigned($unsigned(wire28))));
      if ($unsigned({{wire34}, $signed((-reg53[(4'hd):(2'h3)]))}))
        begin
          if ((|($unsigned($signed((^reg42))) ?
              wire29[(1'h0):(1'h0)] : ((~reg50[(4'hd):(3'h5)]) * ((~^wire34) ~^ reg56[(2'h3):(2'h3)])))))
            begin
              reg57 <= $signed(reg49);
              reg58 <= ($signed(($signed(wire30) ?
                      (reg50[(4'h9):(2'h2)] * (reg51 | reg44)) : ((reg54 ?
                              reg42 : reg56) ?
                          {wire55} : wire29[(2'h3):(2'h3)]))) ?
                  ({$unsigned((~|wire28)),
                      ($unsigned(wire37) >= {reg47,
                          wire32})} == $signed($unsigned(reg50))) : reg45[(4'hd):(3'h4)]);
              reg59 <= reg42;
            end
          else
            begin
              reg57 <= $signed(reg58[(3'h4):(1'h0)]);
              reg58 <= (~^wire29[(2'h2):(1'h1)]);
              reg59 <= reg57;
              reg60 <= wire41;
            end
          reg61 <= reg57[(4'h8):(4'h8)];
          reg62 <= (wire40[(4'hd):(3'h6)] >> $signed($signed({$signed(wire41)})));
        end
      else
        begin
          reg57 <= wire40;
          reg58 <= {wire55, wire38[(2'h2):(1'h0)]};
          reg59 <= (wire29 ?
              $signed((!$signed($unsigned((8'hb7))))) : {reg60[(1'h1):(1'h1)],
                  (!(+reg43))});
          reg60 <= ((~{$signed($signed(reg44))}) && $signed(reg58));
        end
      if ($signed({(8'hbc)}))
        begin
          if ($unsigned(reg50[(4'hd):(1'h1)]))
            begin
              reg63 <= $signed(((^~wire30[(4'h8):(2'h2)]) ?
                  $signed(reg45[(2'h2):(1'h1)]) : reg52[(2'h2):(1'h1)]));
              reg64 <= ($signed((~^($signed((8'h9f)) ? (~reg52) : (~|reg45)))) ?
                  (~&$unsigned(($unsigned((8'ha4)) ?
                      (&reg62) : $signed(wire40)))) : wire32[(4'h9):(2'h3)]);
            end
          else
            begin
              reg63 <= {$unsigned($unsigned(reg62[(3'h6):(2'h2)])), reg63};
              reg64 <= (^$unsigned(({(|reg53),
                  $signed(wire38)} || $unsigned((|reg61)))));
              reg65 <= ((^$signed(reg61[(2'h3):(2'h2)])) ~^ ((!((reg44 - reg35) ?
                  (reg53 ?
                      reg64 : reg57) : $signed(reg48))) || (^~((+(7'h43)) ^~ $signed(wire33)))));
            end
          if ($signed(reg45[(1'h0):(1'h0)]))
            begin
              reg66 <= reg45;
              reg67 <= (($signed((((8'ha2) <= reg44) + (reg59 >>> reg53))) ?
                      reg66 : (8'hac)) ?
                  wire55[(2'h2):(2'h2)] : reg63[(3'h6):(2'h3)]);
              reg68 <= $signed((8'hbe));
            end
          else
            begin
              reg66 <= (reg61 <= ((8'hb6) + (^reg42)));
              reg67 <= $signed($unsigned($signed($unsigned($signed(wire29)))));
              reg68 <= $signed((wire37[(2'h2):(1'h1)] ^ reg53));
              reg69 <= $unsigned((wire31 >= wire30[(4'hb):(3'h6)]));
            end
          reg70 <= $signed($unsigned(({(reg49 >>> reg36),
                  (reg56 ? wire32 : wire39)} ?
              ((+wire34) ? reg65[(3'h5):(1'h0)] : reg68) : reg47)));
        end
      else
        begin
          reg63 <= wire38;
          if (reg49[(3'h7):(1'h0)])
            begin
              reg64 <= $unsigned((reg65 * $unsigned(reg58)));
              reg65 <= $signed($unsigned(reg46));
              reg66 <= $unsigned(((($unsigned(wire37) ?
                  (wire55 ?
                      reg68 : wire29) : (reg60 != wire30)) ^~ reg48[(5'h10):(4'hc)]) || ($signed($signed(reg68)) & $signed((^wire34)))));
            end
          else
            begin
              reg64 <= $signed($unsigned((|(wire34 ?
                  (8'hb4) : (reg46 ? reg42 : wire40)))));
              reg65 <= wire29;
              reg66 <= $signed(($signed((wire39 > (reg57 ?
                  wire55 : reg42))) < $signed(((reg58 ?
                  wire55 : wire41) ^~ wire40[(2'h3):(2'h2)]))));
              reg67 <= (((reg45[(1'h1):(1'h0)] <= $unsigned($signed((8'ha6)))) ?
                      wire34 : $signed((+(wire40 ? reg46 : reg45)))) ?
                  {wire38, $unsigned({{reg61}})} : (~^(8'hb8)));
            end
          if ((~|reg59[(1'h0):(1'h0)]))
            begin
              reg68 <= $signed(wire37[(3'h7):(3'h6)]);
              reg69 <= $unsigned($signed($signed(wire30[(4'hb):(3'h7)])));
              reg70 <= ((8'hb0) > reg57[(3'h6):(2'h2)]);
              reg71 <= (($unsigned((~&wire28)) ?
                      reg43 : (~|(~&(reg51 ? reg57 : reg68)))) ?
                  ((-(8'ha2)) ?
                      (reg35 ?
                          $signed((reg66 ?
                              wire34 : reg56)) : $unsigned((~&reg42))) : (-$unsigned(reg43))) : reg53[(4'hf):(4'h8)]);
              reg72 <= $unsigned({reg69, reg45});
            end
          else
            begin
              reg68 <= $unsigned($signed((((8'ha0) ?
                      reg42 : reg36[(2'h2):(1'h0)]) ?
                  ({(8'ha0)} >= (|wire40)) : reg62)));
              reg69 <= $signed((^$unsigned($signed($unsigned(reg35)))));
            end
        end
      reg73 <= (8'hbf);
      reg74 <= reg51[(4'hd):(1'h1)];
    end
  assign wire75 = (8'ha9);
  module76 #() modinst117 (.wire79(reg57), .clk(clk), .y(wire116), .wire77(reg45), .wire80(wire40), .wire78(reg53));
  module118 #() modinst154 (.wire123(reg60), .wire119(reg73), .y(wire153), .wire121(wire30), .wire120(reg44), .clk(clk), .wire122(reg42));
  assign wire155 = $unsigned((($unsigned((^reg58)) <= (wire153[(3'h5):(2'h3)] ?
                       $unsigned(wire28) : reg54)) <= wire55[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg156 <= (^$signed($unsigned(($signed(reg65) <<< reg68[(1'h1):(1'h1)]))));
      reg157 <= (+$unsigned(reg46[(3'h5):(2'h2)]));
      reg158 <= wire39;
      reg159 <= reg68[(1'h1):(1'h0)];
      reg160 <= (reg62[(3'h5):(3'h5)] ~^ ($unsigned(((wire40 ?
              wire39 : wire41) & $unsigned(reg69))) ?
          $signed((+$unsigned(wire39))) : (!(8'h9e))));
    end
  assign wire161 = (-wire34);
  assign wire162 = reg61;
  module163 #() modinst194 (wire193, clk, reg43, reg58, reg60, wire55);
  always
    @(posedge clk) begin
      reg195 <= $unsigned(((reg65[(3'h5):(2'h3)] * $signed((reg74 ?
          wire75 : (8'hb1)))) <= (wire30 >= ($unsigned(reg52) ?
          wire37[(4'hb):(3'h6)] : ((8'hb7) >> reg157)))));
      if (($unsigned(reg45[(4'h9):(2'h3)]) > wire153[(1'h0):(1'h0)]))
        begin
          reg196 <= reg56[(1'h0):(1'h0)];
          reg197 <= ($signed($signed($unsigned((reg195 ^ wire153)))) - $signed((wire193[(4'ha):(2'h2)] & (^~(reg46 + wire38)))));
          reg198 <= wire162[(3'h7):(3'h5)];
          if ($unsigned((&$signed($unsigned({reg157, wire193})))))
            begin
              reg199 <= (-reg44);
            end
          else
            begin
              reg199 <= reg53[(2'h2):(1'h1)];
              reg200 <= reg71;
              reg201 <= (|(&({{reg48, reg49}, reg49[(1'h0):(1'h0)]} ?
                  reg74[(2'h3):(2'h3)] : $signed(reg54))));
              reg202 <= reg159[(1'h1):(1'h1)];
              reg203 <= reg42;
            end
          reg204 <= $signed($signed((|(|$signed(reg67)))));
        end
      else
        begin
          reg196 <= ($signed($signed(reg156[(2'h2):(1'h0)])) ?
              ($unsigned(wire33[(3'h5):(3'h4)]) > (^~($unsigned(reg58) ?
                  (wire162 ?
                      reg156 : reg43) : reg48))) : $signed((((8'ha9) << (reg204 < reg196)) ?
                  $signed(reg69[(2'h3):(2'h3)]) : $unsigned((reg54 ?
                      reg49 : reg53)))));
          reg197 <= $signed($signed((^~wire162[(4'ha):(3'h5)])));
          reg198 <= wire28;
          reg199 <= reg36[(1'h0):(1'h0)];
          reg200 <= (8'ha1);
        end
      reg205 <= ((((~^$unsigned(reg36)) ?
              (+reg201) : $unsigned(reg201)) | $signed(reg43[(3'h7):(3'h4)])) ?
          ($unsigned(reg50) <<< $signed((|(~^reg73)))) : ($signed(((reg36 ?
              wire30 : reg66) - $signed(wire37))) >>> $signed($unsigned((reg204 >> wire31)))));
      if ((8'hab))
        begin
          reg206 <= reg69[(1'h0):(1'h0)];
          reg207 <= (7'h44);
          if (reg67[(2'h3):(1'h0)])
            begin
              reg208 <= reg201[(1'h1):(1'h0)];
            end
          else
            begin
              reg208 <= $signed($unsigned($signed($signed(wire29))));
              reg209 <= reg69[(1'h0):(1'h0)];
              reg210 <= $unsigned((({(~|reg69), wire32[(4'h9):(3'h5)]} ?
                  reg42 : $unsigned((reg53 ? reg67 : reg51))) >>> (8'h9e)));
              reg211 <= reg56[(2'h2):(1'h0)];
              reg212 <= $signed(reg204[(1'h1):(1'h1)]);
            end
          reg213 <= (!{reg52[(3'h5):(2'h2)]});
        end
      else
        begin
          reg206 <= (({$unsigned(((8'h9d) ? wire75 : reg211)),
                      (reg202[(3'h7):(1'h1)] ?
                          $signed(reg205) : $unsigned(reg48))} ?
                  reg71[(4'h8):(1'h1)] : ($unsigned(reg202) ?
                      reg45[(4'ha):(3'h6)] : (|{wire193, reg160}))) ?
              (wire155[(4'h8):(2'h3)] ?
                  wire30[(3'h5):(1'h1)] : (!{wire31,
                      (reg205 ^ wire162)})) : reg197[(3'h5):(1'h1)]);
        end
      reg214 <= ((+({wire29,
          (reg201 < reg58)} << $signed(reg50[(5'h12):(5'h10)]))) & (8'hbe));
    end
  assign wire215 = (^((((wire75 ~^ reg199) >= (reg54 && reg42)) & reg35) ?
                       wire162 : reg67));
endmodule

module module163  (y, clk, wire167, wire166, wire165, wire164);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire167;
  input wire signed [(4'hd):(1'h0)] wire166;
  input wire [(3'h5):(1'h0)] wire165;
  input wire signed [(5'h10):(1'h0)] wire164;
  wire signed [(5'h10):(1'h0)] wire192;
  wire [(3'h7):(1'h0)] wire191;
  wire [(4'hd):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire185;
  wire signed [(4'he):(1'h0)] wire182;
  wire [(3'h6):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire [(4'hd):(1'h0)] wire179;
  wire [(4'hb):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire177;
  wire signed [(3'h5):(1'h0)] wire176;
  wire signed [(3'h7):(1'h0)] wire175;
  wire [(4'hb):(1'h0)] wire174;
  wire signed [(3'h6):(1'h0)] wire173;
  wire [(3'h6):(1'h0)] wire172;
  wire signed [(2'h2):(1'h0)] wire171;
  wire signed [(5'h11):(1'h0)] wire170;
  wire [(4'h8):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire168;
  reg signed [(4'hb):(1'h0)] reg190 = (1'h0);
  reg [(5'h13):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg188 = (1'h0);
  reg [(5'h13):(1'h0)] reg187 = (1'h0);
  reg [(5'h15):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire186,
                 wire185,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire168 = wire165[(2'h3):(2'h3)];
  assign wire169 = wire168;
  assign wire170 = (wire165[(1'h1):(1'h1)] ?
                       (~|wire164[(4'h8):(4'h8)]) : wire168);
  assign wire171 = $unsigned(((8'ha4) - ($signed((wire170 ^ wire169)) ?
                       (-wire168[(4'hc):(3'h7)]) : ($signed(wire166) ?
                           (!wire166) : $signed(wire169)))));
  assign wire172 = $signed((~&(wire166[(3'h4):(3'h4)] || {(wire169 ?
                           wire169 : wire168)})));
  assign wire173 = wire168[(3'h7):(1'h1)];
  assign wire174 = ((~&$signed($unsigned(((8'hbc) + wire168)))) ^ (wire165[(2'h3):(1'h1)] ?
                       {({(7'h43),
                               wire167} != $unsigned((8'h9d)))} : $signed((wire172 ?
                           $signed((8'hbe)) : (wire168 <= wire173)))));
  assign wire175 = $unsigned(wire170[(4'he):(1'h1)]);
  assign wire176 = $signed($unsigned($signed(wire172)));
  assign wire177 = {wire170};
  assign wire178 = (|((8'h9c) ?
                       (({wire170, wire164} ?
                               (wire177 ~^ wire172) : (wire169 ?
                                   wire167 : (8'had))) ?
                           ((7'h42) ?
                               ((8'ha2) ?
                                   wire164 : wire167) : wire171[(2'h2):(1'h0)]) : $unsigned($unsigned(wire170))) : (wire169[(3'h6):(1'h1)] ?
                           {wire170[(2'h3):(1'h0)],
                               $unsigned((8'h9c))} : wire172)));
  assign wire179 = (!((8'hb7) ?
                       ($signed(wire170) ?
                           wire168 : $signed((wire174 - wire178))) : (!$unsigned((wire177 ?
                           (8'haa) : wire177)))));
  assign wire180 = ($signed(($unsigned(wire174[(3'h7):(3'h6)]) ?
                           (-wire177) : wire178)) ?
                       wire175[(2'h2):(2'h2)] : wire172);
  assign wire181 = (+wire179);
  assign wire182 = wire181;
  always
    @(posedge clk) begin
      reg183 <= {wire177};
      reg184 <= wire164;
    end
  assign wire185 = ($unsigned((wire168[(4'hd):(4'h9)] >= $signed(((8'hbd) >= wire174)))) - ((wire178[(3'h7):(3'h7)] ?
                           reg184 : ($unsigned((8'haa)) ?
                               $unsigned(wire180) : wire165[(1'h1):(1'h0)])) ?
                       wire164[(4'ha):(3'h6)] : $unsigned((+$unsigned(wire181)))));
  assign wire186 = $unsigned(($unsigned($unsigned($unsigned(wire165))) ?
                       wire180[(5'h12):(3'h6)] : (wire178 != wire174[(4'hb):(3'h5)])));
  always
    @(posedge clk) begin
      reg187 <= wire168[(5'h14):(4'he)];
      reg188 <= reg183[(3'h4):(1'h1)];
      reg189 <= (($unsigned(wire169[(2'h2):(1'h1)]) > $unsigned((8'hbb))) >= (wire168[(4'hd):(3'h6)] ?
          reg187[(4'hf):(4'hd)] : (~(-(-(8'had))))));
      reg190 <= (reg189[(3'h4):(1'h1)] >> $signed(((|$unsigned(wire171)) << $unsigned((wire185 ?
          (8'h9d) : wire173)))));
    end
  assign wire191 = $unsigned(wire172);
  assign wire192 = ({(-$signed($signed(wire172))),
                           (wire179[(2'h3):(2'h2)] >> wire176)} ?
                       ((!wire164) ?
                           ((~|reg190) | ($unsigned(wire174) ?
                               wire173 : wire171)) : $unsigned(wire170)) : (wire177 ?
                           reg188 : $signed(((+(8'ha1)) ?
                               $signed(wire180) : $signed(wire173)))));
endmodule

module module118
#(parameter param152 = (((({(8'hac), (8'ha0)} ? ((8'hb8) ? (8'hbb) : (8'h9d)) : {(8'hb3)}) <= ({(8'haa)} > ((8'hb5) ? (8'ha7) : (8'hab)))) & ((|((8'h9f) ? (8'hba) : (8'hbf))) ? (((8'hab) ? (7'h41) : (7'h40)) | ((8'ha2) ? (8'hb6) : (8'h9d))) : (((8'h9d) ? (8'hbb) : (7'h41)) ? ((8'ha9) & (8'ha1)) : ((8'ha3) == (8'hbd))))) ^ (~^{{(^(7'h43)), {(8'hb4)}}})))
(y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire123;
  input wire signed [(5'h12):(1'h0)] wire122;
  input wire signed [(4'h8):(1'h0)] wire121;
  input wire [(4'he):(1'h0)] wire120;
  input wire [(4'hb):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire151;
  wire signed [(4'he):(1'h0)] wire150;
  wire [(4'hb):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire124;
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(4'h8):(1'h0)] reg141 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire125,
                 wire124,
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
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire124 = {$unsigned((((wire123 ?
                           wire119 : wire122) >> $unsigned(wire121)) * (wire119 >= wire121[(3'h6):(3'h5)])))};
  assign wire125 = $unsigned($unsigned($unsigned({$signed(wire121),
                       wire123[(1'h1):(1'h0)]})));
  always
    @(posedge clk) begin
      if ((|wire120[(4'hd):(1'h0)]))
        begin
          reg126 <= (((~|((wire125 * wire124) ?
                  (~(8'hb1)) : (wire123 ?
                      wire120 : wire119))) ^ wire122[(5'h12):(5'h12)]) ?
              (($unsigned((~|wire121)) ?
                  ((wire123 <= wire122) ?
                      wire120[(3'h5):(3'h4)] : wire119) : (wire125[(3'h4):(2'h2)] ?
                      $unsigned(wire125) : $signed(wire124))) || (wire119[(1'h1):(1'h0)] && wire125[(3'h6):(3'h4)])) : (8'hba));
          reg127 <= $signed((wire120 ?
              (^~wire122[(4'he):(4'hd)]) : $signed(($unsigned(wire125) ?
                  {wire122} : (~wire125)))));
        end
      else
        begin
          reg126 <= ($unsigned(wire125[(1'h1):(1'h1)]) << {$unsigned($signed((wire122 > wire119)))});
          reg127 <= wire119[(4'h8):(1'h0)];
        end
      reg128 <= wire125;
      reg129 <= ((reg127 + wire119[(3'h5):(3'h4)]) ?
          $signed(((+$signed(reg127)) ?
              (wire121[(3'h4):(1'h0)] ?
                  wire123 : $signed(wire120)) : wire123)) : ((((wire120 < wire120) ~^ (!reg127)) ?
              {(wire122 * wire121),
                  (wire125 ?
                      wire123 : reg127)} : $unsigned((~&wire123))) > ({{reg126,
                  wire124},
              reg128} & reg126[(2'h2):(1'h0)])));
      reg130 <= ((wire125 + $signed(reg127[(3'h6):(3'h4)])) ^~ (~&((-((8'hab) ?
              (8'ha4) : wire125)) ?
          (wire121 >>> (wire122 ?
              wire120 : wire119)) : (^~(wire124 || wire124)))));
      reg131 <= (~^reg129);
    end
  assign wire132 = $unsigned($signed((((|wire120) ?
                       reg128 : (wire123 ? reg128 : wire125)) << ((wire125 ?
                       reg131 : reg126) < $signed(reg130)))));
  assign wire133 = $unsigned(((&($signed(reg130) ?
                       reg127 : (&(8'ha8)))) >> wire123));
  assign wire134 = wire125;
  assign wire135 = wire123;
  assign wire136 = reg128;
  assign wire137 = ((wire124[(3'h6):(1'h1)] ? $signed((8'hb3)) : reg129) ?
                       ((wire135[(4'h8):(3'h4)] ?
                               ($unsigned(reg127) ?
                                   $unsigned(wire123) : wire120) : (~&reg129)) ?
                           ({(^reg127), (&(8'ha6))} ?
                               $signed((reg127 ?
                                   reg131 : wire124)) : wire119) : wire132[(5'h10):(4'hc)]) : (($unsigned((reg129 > wire119)) ^ ($signed(wire135) & $signed(reg128))) >>> {$unsigned(wire125[(3'h4):(1'h1)]),
                           $unsigned((reg131 ? reg129 : wire121))}));
  assign wire138 = (|reg126);
  assign wire139 = (~(($unsigned($unsigned(wire132)) * (reg126[(2'h3):(2'h2)] ?
                       (wire122 ^~ wire138) : reg130[(2'h3):(2'h2)])) ^~ {(8'hb2),
                       (^~{(8'ha0)})}));
  always
    @(posedge clk) begin
      reg140 <= wire123[(1'h0):(1'h0)];
      if ((wire120 * wire125[(1'h1):(1'h0)]))
        begin
          reg141 <= (~|wire119[(4'h9):(4'h9)]);
          if ((~($unsigned({(8'ha1), $unsigned(wire136)}) ?
              {{(-wire133), (8'hb3)}} : {($signed(wire122) > (wire134 ?
                      wire120 : wire124)),
                  $unsigned($signed(reg141))})))
            begin
              reg142 <= $unsigned((~^wire125[(3'h5):(1'h0)]));
            end
          else
            begin
              reg142 <= (((~($unsigned(wire120) & $signed((7'h44)))) ?
                      $unsigned({reg126[(1'h0):(1'h0)]}) : $unsigned($signed((reg131 * wire133)))) ?
                  (!$unsigned((reg142 ^ (!reg126)))) : ((~((8'hbf) + (!(8'hb3)))) == reg130));
              reg143 <= (reg142[(4'hc):(3'h7)] ?
                  (^{wire132[(2'h2):(1'h1)]}) : ((($unsigned(reg130) ?
                          $signed(reg130) : (wire133 ? wire138 : wire138)) ?
                      wire138 : reg140[(3'h5):(2'h3)]) - wire137[(3'h4):(1'h0)]));
              reg144 <= $signed((~^$unsigned(({(8'haf)} ?
                  (&reg141) : (reg127 ? wire121 : wire136)))));
              reg145 <= $unsigned($signed({$unsigned($unsigned(reg129)),
                  (wire133[(5'h14):(3'h7)] ?
                      (wire119 ~^ (8'ha1)) : $signed(reg128))}));
            end
        end
      else
        begin
          reg141 <= (reg126 < $unsigned($unsigned((&(~|wire137)))));
          if ($signed(wire122[(3'h6):(1'h1)]))
            begin
              reg142 <= $signed((~{(reg127 ?
                      $unsigned(wire139) : (-wire136))}));
              reg143 <= (($signed({wire133[(2'h2):(1'h0)]}) << (~&$unsigned(reg127[(4'hb):(4'h9)]))) ?
                  ($signed({{reg141, reg129}}) ?
                      $unsigned(($unsigned((8'ha6)) | (^~wire121))) : reg140[(3'h5):(1'h1)]) : wire123[(1'h1):(1'h0)]);
              reg144 <= wire134;
              reg145 <= {$unsigned((!$unsigned(reg129[(1'h0):(1'h0)])))};
            end
          else
            begin
              reg142 <= (+reg127[(5'h10):(1'h0)]);
              reg143 <= (8'ha5);
              reg144 <= $signed(($unsigned($signed((|reg141))) << {(^reg126),
                  reg142}));
              reg145 <= $signed(reg126[(4'hd):(4'hb)]);
              reg146 <= wire123;
            end
          reg147 <= reg143;
          reg148 <= {$signed(((!$signed(reg140)) & wire132)),
              wire120[(1'h1):(1'h0)]};
        end
      reg149 <= {{$signed($unsigned(reg128)), (8'h9f)}, reg126};
    end
  assign wire150 = (8'hb5);
  assign wire151 = reg149[(1'h1):(1'h1)];
endmodule

module module76
#(parameter param114 = (((8'h9d) ? ({((8'h9d) ? (8'ha8) : (8'hb7))} * (-((8'haa) ? (8'hbf) : (8'hb2)))) : ((((7'h42) * (8'had)) ? (+(8'hb3)) : {(8'hac)}) && ({(8'ha1)} ? ((8'ha6) ? (8'hb0) : (8'ha5)) : (&(8'haf))))) ? {{(((8'ha1) ? (8'haa) : (8'ha7)) ^ ((7'h40) || (8'hab))), (~|(|(8'hab)))}, {(((8'hb0) ? (8'h9d) : (7'h43)) >>> ((8'h9e) < (8'h9f))), (|(~&(8'ha0)))}} : (~^(|(+(8'hac))))), 
parameter param115 = (&param114))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire80;
  input wire signed [(2'h3):(1'h0)] wire79;
  input wire signed [(3'h6):(1'h0)] wire78;
  input wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire81;
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire81,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
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
                 (1'h0)};
  assign wire81 = $unsigned(({{(^wire77), (wire77 != (8'hb1))}} ?
                      wire78[(1'h1):(1'h1)] : wire79));
  always
    @(posedge clk) begin
      if (wire77)
        begin
          reg82 <= wire81[(2'h2):(1'h1)];
          if (wire78[(3'h5):(1'h1)])
            begin
              reg83 <= (|reg82);
              reg84 <= {wire81};
              reg85 <= (($signed((reg84[(3'h6):(2'h3)] ?
                      {reg83} : $unsigned(wire80))) | ((((7'h43) ?
                      reg82 : reg83) >> $unsigned(reg82)) < (&(~^reg82)))) ?
                  ($signed((wire79[(2'h2):(2'h2)] ?
                          (wire80 >> wire77) : ((8'hb6) ^ wire77))) ?
                      wire80[(5'h10):(1'h1)] : reg84[(3'h7):(3'h6)]) : {($signed((reg84 > wire78)) + wire78)});
              reg86 <= (wire80 == (+$signed(wire79[(1'h0):(1'h0)])));
            end
          else
            begin
              reg83 <= reg86;
            end
          reg87 <= (~^(-$signed((~^(~&wire78)))));
          if (((reg84 ?
              $unsigned(($unsigned(wire81) && wire79)) : $unsigned((8'hb4))) ^ (~&(^~$unsigned($signed(wire81))))))
            begin
              reg88 <= reg85;
              reg89 <= (!{(($unsigned(reg84) ? wire80 : $unsigned(reg84)) ?
                      reg83 : $unsigned(wire79[(2'h2):(1'h1)]))});
              reg90 <= $unsigned((~^(~|((~^reg88) ?
                  wire78[(2'h3):(2'h2)] : (~(8'ha8))))));
              reg91 <= reg83[(1'h1):(1'h0)];
            end
          else
            begin
              reg88 <= ($signed((($signed(reg86) ?
                  wire81 : {reg84}) & ((reg88 * reg90) ?
                  (&wire79) : reg90))) > (!(+$unsigned(wire80))));
              reg89 <= reg84;
            end
        end
      else
        begin
          reg82 <= $signed(((&(^~reg91[(2'h2):(1'h1)])) ?
              reg90 : ($signed((reg83 - reg88)) ?
                  $signed((~reg89)) : (~|(8'hb2)))));
          reg83 <= reg88[(5'h10):(5'h10)];
        end
    end
  assign wire92 = reg90[(4'h8):(3'h5)];
  assign wire93 = (reg89 >>> $signed((reg91 ?
                      reg91[(4'h9):(1'h1)] : (reg83 < $unsigned(reg88)))));
  assign wire94 = $signed(wire79[(1'h0):(1'h0)]);
  assign wire95 = (reg88 - (8'had));
  assign wire96 = $unsigned($unsigned((((wire93 ? (7'h41) : wire78) ?
                          wire92 : $unsigned(reg90)) ?
                      $signed($unsigned(wire81)) : $signed(reg83))));
  assign wire97 = $unsigned(reg90[(1'h1):(1'h0)]);
  assign wire98 = {$signed((($unsigned(reg89) ~^ (reg85 & reg90)) ?
                          $unsigned((&reg85)) : ($unsigned(wire95) ?
                              $signed(wire93) : $signed(wire94)))),
                      wire96[(4'ha):(2'h3)]};
  assign wire99 = reg85[(4'hb):(2'h3)];
  always
    @(posedge clk) begin
      if ((8'h9c))
        begin
          if (wire93)
            begin
              reg100 <= wire94;
              reg101 <= $signed(wire81);
              reg102 <= {(reg89[(1'h0):(1'h0)] ?
                      wire92[(2'h3):(1'h0)] : {wire80}),
                  $signed(({wire96} | wire99[(1'h0):(1'h0)]))};
              reg103 <= {$unsigned($signed(((wire94 ? reg82 : wire79) ?
                      {reg85} : (reg89 | reg86)))),
                  (!$signed($signed(((7'h40) == wire96))))};
              reg104 <= (&(~^wire94[(4'hb):(3'h4)]));
            end
          else
            begin
              reg100 <= ((wire80[(3'h6):(1'h1)] + ($unsigned((wire79 ~^ reg90)) ?
                  reg88 : (^reg82[(1'h1):(1'h0)]))) * reg91);
              reg101 <= (|$unsigned(wire80));
              reg102 <= ((wire78[(3'h6):(1'h0)] ?
                  $signed((-(^wire99))) : $unsigned((-{reg87,
                      wire99}))) + reg86);
              reg103 <= (reg102 ~^ $unsigned(wire80));
              reg104 <= wire97[(4'hc):(4'hb)];
            end
        end
      else
        begin
          reg100 <= {reg100,
              ({(wire78[(1'h1):(1'h0)] ?
                          (^~(8'h9d)) : (wire95 ? reg104 : wire79)),
                      (8'ha4)} ?
                  ($unsigned($unsigned(wire99)) <= ((~^reg88) & $signed((7'h43)))) : ((^~wire97[(4'hc):(1'h0)]) - (wire98[(2'h2):(1'h0)] ?
                      (reg87 ? wire79 : (8'hb5)) : $unsigned(reg87))))};
        end
      reg105 <= wire94[(4'ha):(4'ha)];
      reg106 <= {$unsigned((~&$unsigned(reg85)))};
    end
  assign wire107 = $unsigned((|(-((reg103 ? wire94 : reg102) ?
                       $signed((8'haa)) : reg86[(1'h0):(1'h0)]))));
  assign wire108 = (+(((wire77[(4'hf):(3'h5)] ?
                       (reg83 << (8'hbd)) : (reg106 > reg100)) <= {{reg104}}) >> $unsigned($signed({wire99}))));
  assign wire109 = ($unsigned($signed(reg82[(1'h1):(1'h0)])) >>> $unsigned(wire98[(1'h1):(1'h0)]));
  assign wire110 = $unsigned($unsigned({{$signed(reg100), (8'ha4)}}));
  assign wire111 = $signed(reg105[(3'h4):(3'h4)]);
  assign wire112 = (wire109 ?
                       $signed((-wire78[(1'h0):(1'h0)])) : $signed($unsigned((wire78 ?
                           {reg87, wire97} : $signed(wire108)))));
  assign wire113 = wire77;
endmodule
