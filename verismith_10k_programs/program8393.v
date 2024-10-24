module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire277;
  wire signed [(5'h13):(1'h0)] wire276;
  wire signed [(4'h9):(1'h0)] wire275;
  wire [(3'h7):(1'h0)] wire273;
  wire signed [(5'h15):(1'h0)] wire272;
  wire [(2'h2):(1'h0)] wire271;
  wire [(4'hc):(1'h0)] wire270;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire268;
  assign y = {wire277,
                 wire276,
                 wire275,
                 wire273,
                 wire272,
                 wire271,
                 wire270,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire268,
                 (1'h0)};
  assign wire5 = (((($unsigned(wire2) && (8'hb2)) <= ($signed((8'hb2)) == (8'h9f))) ?
                     wire1 : ($signed(((7'h42) ^~ wire0)) ^~ $unsigned({wire2,
                         (8'ha3)}))) << wire1);
  assign wire6 = {(~|$signed(wire5))};
  assign wire7 = wire5;
  assign wire8 = wire2[(3'h7):(2'h3)];
  module9 #() modinst269 (wire268, clk, wire0, wire4, wire1, wire3, wire8);
  assign wire270 = $unsigned(((~&(!(|wire0))) + $unsigned(wire3)));
  assign wire271 = (wire268[(3'h7):(3'h6)] ?
                       $unsigned(wire8[(2'h3):(2'h3)]) : {$signed((wire8[(3'h4):(1'h0)] ?
                               (&wire4) : wire270[(4'h8):(3'h5)]))});
  assign wire272 = (wire0[(1'h1):(1'h0)] ?
                       ({(wire2 >>> $unsigned(wire271)),
                               $unsigned(wire270[(1'h0):(1'h0)])} ?
                           {((wire0 || wire8) <<< {wire1})} : (wire7 ^ $unsigned({(8'hb8),
                               wire5}))) : ({wire6} ?
                           (~|(^~$signed(wire3))) : {wire6,
                               $unsigned(wire271[(1'h0):(1'h0)])}));
  module15 #() modinst274 (.clk(clk), .wire19(wire6), .wire17(wire5), .wire16(wire270), .wire18(wire272), .y(wire273));
  assign wire275 = (({$signed($unsigned(wire7)), $signed(wire268)} ?
                           ((&wire270[(3'h5):(1'h0)]) ^~ (~&(wire268 ?
                               wire5 : (8'h9d)))) : {wire8}) ?
                       ({(~|$unsigned(wire2))} - wire268[(1'h1):(1'h1)]) : ((($unsigned(wire273) ?
                           wire272 : (wire1 ?
                               (8'hb8) : wire7)) >>> $unsigned(wire1)) && wire5[(3'h4):(3'h4)]));
  assign wire276 = ($signed(wire6[(3'h4):(2'h3)]) ^~ wire270[(2'h3):(2'h3)]);
  assign wire277 = (!$unsigned(wire275[(3'h5):(1'h1)]));
endmodule

module module9
#(parameter param266 = (((({(8'hb9)} - {(8'ha2)}) <= ((-(8'hb7)) ? ((7'h43) * (8'hae)) : {(8'ha4)})) ? ({(&(8'h9e)), ((8'hb3) - (8'hbe))} ? (8'hb2) : (((8'hb9) ? (8'hae) : (7'h43)) ? (|(8'hbe)) : (8'had))) : ((-((8'hb5) ? (8'hbe) : (7'h40))) ? (~^(~|(8'ha3))) : ((~^(8'ha0)) + (~&(8'hb1))))) & (~((^~{(8'ha8)}) ? ((~&(8'hbd)) ? ((8'hbf) ? (8'ha6) : (7'h42)) : ((7'h41) < (8'hb4))) : {{(8'ha3), (8'hb0)}, (!(8'hab))}))), 
parameter param267 = ({((param266 <<< (param266 <= (7'h40))) ? (^(!(8'hbe))) : ((8'ha6) << (&param266))), (param266 <= (((8'hb4) ? param266 : param266) ? (!param266) : (8'hb3)))} ? (~&(({param266, param266} * (param266 >> param266)) ^ ((!param266) << ((8'haf) ~^ (8'h9f))))) : (~(~^(-{param266})))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h2da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire216;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire171;
  wire [(3'h4):(1'h0)] wire218;
  wire [(5'h11):(1'h0)] wire264;
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  assign y = {wire216,
                 wire124,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire67,
                 wire66,
                 wire65,
                 wire37,
                 wire36,
                 wire34,
                 wire171,
                 wire218,
                 wire264,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  module15 #() modinst35 (wire34, clk, wire13, wire11, wire10, wire14);
  assign wire36 = wire34[(1'h0):(1'h0)];
  assign wire37 = $signed($signed(wire11));
  always
    @(posedge clk) begin
      if (wire34[(4'hc):(3'h7)])
        begin
          reg38 <= $unsigned(wire36);
          reg39 <= $signed((wire37 != (+wire13[(3'h5):(1'h1)])));
          if ($signed(((({wire12} != $unsigned(wire10)) <= wire34) ?
              (7'h40) : reg38[(4'h9):(4'h8)])))
            begin
              reg40 <= ($unsigned($unsigned(wire12[(3'h7):(1'h0)])) < ((reg38[(4'h8):(3'h4)] ?
                      (^~$unsigned((8'ha1))) : $signed((wire37 ?
                          reg39 : wire11))) ?
                  $unsigned(wire10) : (wire37[(3'h7):(2'h2)] ^ (!wire10[(4'he):(1'h0)]))));
              reg41 <= wire36[(1'h0):(1'h0)];
              reg42 <= $unsigned($unsigned((($signed(wire10) ?
                      (reg41 & wire34) : {(8'hb2)}) ?
                  {{wire12, wire14}, $signed(wire37)} : wire34)));
              reg43 <= reg42;
            end
          else
            begin
              reg40 <= (wire36[(1'h1):(1'h0)] << wire34);
            end
          reg44 <= {{(^~($unsigned((8'hb9)) ?
                      (reg40 || (8'hb2)) : (wire14 ? wire34 : reg40)))}};
          if ($unsigned($signed($signed(wire14[(1'h0):(1'h0)]))))
            begin
              reg45 <= $signed(reg38);
              reg46 <= $unsigned({(((^~(8'ha3)) ? {reg39} : (wire11 < wire14)) ?
                      $unsigned({(8'hb0), reg39}) : {(&wire11)})});
              reg47 <= $signed(((reg39[(4'hc):(2'h3)] + $unsigned($unsigned(wire13))) != (wire12 ?
                  $signed($signed(wire13)) : ((!wire34) ?
                      wire10[(5'h11):(4'h9)] : (~|reg38)))));
              reg48 <= (($signed((-$signed(wire36))) >> {((^(8'hb4)) + (reg42 == wire14))}) ?
                  $unsigned(reg45[(3'h7):(3'h6)]) : (+({reg42[(3'h7):(2'h2)]} && reg47[(4'h9):(3'h4)])));
            end
          else
            begin
              reg45 <= reg48;
            end
        end
      else
        begin
          reg38 <= ((wire12 ~^ (reg41[(5'h10):(4'h8)] != wire13)) || ((reg40[(2'h3):(2'h3)] < {(reg42 | reg47)}) < (((^~reg47) ?
              reg40[(2'h3):(1'h0)] : reg46) ~^ reg45[(1'h0):(1'h0)])));
          reg39 <= (^~wire34[(3'h6):(3'h6)]);
        end
      if ($signed($unsigned(((reg46 >= (wire14 ?
          (8'hbd) : reg44)) >> $signed((wire34 ~^ reg48))))))
        begin
          reg49 <= wire14;
          reg50 <= ($signed($signed(($unsigned(reg41) >>> $signed(reg47)))) ?
              (|reg44) : (-($unsigned((reg38 >= reg45)) ?
                  $signed(reg46[(4'hc):(3'h6)]) : (reg42[(3'h5):(3'h5)] || $unsigned(wire36)))));
          if ($signed($signed($signed(reg40[(4'hf):(2'h2)]))))
            begin
              reg51 <= $signed(wire14);
              reg52 <= ((^($signed((reg49 ? wire14 : reg42)) ?
                      ((!wire36) ?
                          $unsigned(reg47) : $signed(reg51)) : (^(reg50 ?
                          (7'h44) : wire34)))) ?
                  (((reg46[(4'h9):(2'h3)] - $signed(reg49)) <= reg48[(5'h14):(2'h3)]) ?
                      reg50[(1'h1):(1'h0)] : $unsigned(reg50[(2'h2):(1'h1)])) : $signed(({wire11[(5'h14):(5'h11)],
                      wire13[(1'h0):(1'h0)]} >> wire37)));
              reg53 <= {reg39[(1'h0):(1'h0)]};
              reg54 <= $signed($signed(wire37));
              reg55 <= reg41;
            end
          else
            begin
              reg51 <= $unsigned({{{(|wire36), {reg49, (8'hbe)}},
                      $signed($signed(wire12))}});
              reg52 <= reg45;
              reg53 <= reg55[(4'hc):(4'ha)];
              reg54 <= ((^~$unsigned(reg44[(2'h3):(2'h2)])) ?
                  reg39[(4'he):(2'h2)] : ($unsigned(reg43) >= ($signed(reg50) ?
                      (~|(8'h9f)) : ((reg52 <<< reg45) ?
                          (wire34 ? reg49 : wire14) : reg40))));
              reg55 <= $signed(reg40[(2'h2):(1'h0)]);
            end
          reg56 <= reg41[(3'h5):(2'h2)];
        end
      else
        begin
          if (reg48[(4'hf):(4'hf)])
            begin
              reg49 <= ($unsigned((-$unsigned(wire14))) ?
                  (8'hbd) : $unsigned((reg48[(2'h2):(2'h2)] < ($unsigned(reg45) ?
                      (wire37 * wire11) : wire36[(1'h1):(1'h0)]))));
              reg50 <= wire37;
              reg51 <= (+$signed(((((8'ha2) >> wire34) <<< reg46) ?
                  $signed((^~reg39)) : reg43[(2'h3):(1'h0)])));
            end
          else
            begin
              reg49 <= ($signed(wire13) * wire37[(2'h2):(1'h0)]);
            end
          reg52 <= ((((wire14 - $unsigned((8'had))) >> reg38) ?
                  (~^(|$unsigned(reg45))) : {reg46}) ?
              $signed($signed(reg42)) : (-reg45));
        end
      reg57 <= ($unsigned((($unsigned(reg41) ? reg47[(4'hd):(2'h2)] : reg48) ?
          wire10 : $unsigned(wire13))) < reg53);
      if (((!($signed($signed(wire36)) >>> wire34[(4'h8):(2'h3)])) ?
          {$unsigned((8'haf))} : ((($unsigned(reg55) ?
                  $unsigned(reg52) : (reg53 < reg39)) ?
              reg46[(4'ha):(3'h4)] : (8'hbb)) ^~ reg49)))
        begin
          if ($unsigned((wire37 ?
              ((&((8'had) ?
                  reg43 : wire10)) - (reg38 << $unsigned(reg55))) : reg53[(3'h4):(3'h4)])))
            begin
              reg58 <= wire14[(3'h4):(2'h2)];
            end
          else
            begin
              reg58 <= $signed((~wire11));
              reg59 <= reg56[(3'h7):(2'h3)];
            end
          reg60 <= ({(7'h40)} ^~ (7'h44));
          reg61 <= $unsigned(reg49);
          reg62 <= ($unsigned(wire37[(3'h7):(1'h1)]) ?
              $unsigned((~^((wire11 * wire34) ?
                  ((8'h9d) >>> reg48) : $unsigned((8'hb1))))) : (reg41[(5'h10):(1'h0)] | (((+reg56) << (reg48 <<< reg57)) ?
                  (8'ha9) : wire11)));
          reg63 <= $signed(((((reg48 ?
                  (8'hb1) : reg52) ^~ {wire12}) <= $unsigned((reg41 && reg53))) ?
              $unsigned($unsigned(reg48[(4'hc):(3'h5)])) : ({(reg53 ?
                      reg58 : reg46),
                  reg48} >> $unsigned(reg47[(4'h8):(2'h3)]))));
        end
      else
        begin
          reg58 <= {(~|({$unsigned(reg49)} || $unsigned((reg54 * reg55))))};
        end
      reg64 <= ({reg41[(3'h6):(3'h6)]} ^~ (wire11 || $signed(((wire34 || reg56) > (reg60 == reg58)))));
    end
  assign wire65 = reg53[(3'h6):(3'h5)];
  assign wire66 = wire14;
  assign wire67 = {wire10, $unsigned({reg47})};
  always
    @(posedge clk) begin
      if (reg61)
        begin
          if (reg49[(4'h9):(3'h6)])
            begin
              reg68 <= $unsigned((($signed({wire10}) ?
                  reg50 : (!(reg56 ?
                      reg40 : wire12))) && {((~|reg63) ^ $signed(reg56))}));
              reg69 <= (reg48[(5'h11):(3'h6)] == reg51[(3'h4):(1'h0)]);
              reg70 <= ($signed(reg38[(1'h0):(1'h0)]) || $signed((reg58 ?
                  (+wire65) : wire14[(1'h1):(1'h0)])));
            end
          else
            begin
              reg68 <= $unsigned(wire65[(3'h5):(2'h2)]);
              reg69 <= (reg38[(1'h1):(1'h1)] << {$unsigned($signed(wire36[(1'h0):(1'h0)])),
                  wire66[(4'hb):(4'h9)]});
              reg70 <= $signed($signed(wire67));
            end
        end
      else
        begin
          reg68 <= reg48[(3'h7):(3'h6)];
          reg69 <= wire13[(4'hb):(3'h5)];
          reg70 <= $signed($unsigned($unsigned($signed($unsigned(reg61)))));
        end
      reg71 <= reg58;
      reg72 <= (^$signed((+reg46[(3'h5):(1'h0)])));
      reg73 <= reg44;
      if ((reg54[(3'h4):(2'h2)] ?
          ($unsigned(reg68[(4'h9):(1'h1)]) <= $signed((~^((8'hb1) ?
              reg54 : reg56)))) : reg54[(3'h5):(1'h0)]))
        begin
          reg74 <= wire34;
          reg75 <= (8'hbe);
          reg76 <= $signed(reg70[(4'hc):(4'hc)]);
          reg77 <= $unsigned(reg61[(2'h3):(2'h3)]);
          reg78 <= (wire10 ? {reg50[(2'h3):(2'h2)]} : wire37);
        end
      else
        begin
          reg74 <= $signed(((((reg63 | reg47) ?
                  (reg40 ? reg74 : reg53) : $signed(wire10)) ?
              (|(~wire37)) : ($unsigned(reg50) >> reg60[(2'h2):(1'h0)])) > reg77));
          if ((~|((|(~{wire37, (8'haf)})) >> reg68)))
            begin
              reg75 <= ($unsigned(reg41[(4'he):(4'h8)]) + reg42[(2'h2):(1'h1)]);
              reg76 <= (~{reg68, $signed($signed($unsigned(reg45)))});
            end
          else
            begin
              reg75 <= $unsigned($signed((&wire34)));
            end
          if ($unsigned((reg58[(4'hc):(1'h0)] >>> {reg45})))
            begin
              reg77 <= reg50;
              reg78 <= {$signed($signed(((&wire37) ?
                      (reg78 ? (8'ha7) : reg53) : $unsigned((8'ha7))))),
                  (~^reg69[(2'h3):(1'h1)])};
              reg79 <= wire36[(1'h1):(1'h1)];
              reg80 <= $signed(reg63);
            end
          else
            begin
              reg77 <= $unsigned(reg49);
              reg78 <= $unsigned($unsigned(($unsigned(((8'ha5) | reg54)) ?
                  wire10[(4'hb):(4'hb)] : reg54)));
            end
          reg81 <= (reg69[(2'h2):(1'h0)] ?
              ((-$signed((reg62 * reg78))) | (-$signed(reg50))) : (&reg72));
          reg82 <= {reg44[(2'h3):(2'h3)]};
        end
    end
  assign wire83 = $unsigned(reg44[(3'h6):(2'h2)]);
  assign wire84 = ({(8'hb0), reg45} <<< reg48[(1'h1):(1'h1)]);
  assign wire85 = ((~|reg69) <= reg40[(2'h3):(1'h0)]);
  assign wire86 = ((+$unsigned({(^wire14), (|reg38)})) ?
                      (|$signed((((8'h9f) ?
                          reg69 : wire66) * (reg60 >>> (8'hb4))))) : (^~wire67));
  module87 #() modinst125 (.clk(clk), .y(wire124), .wire89(wire12), .wire91(reg44), .wire92(reg50), .wire90(wire84), .wire88(wire14));
  module126 #() modinst172 (wire171, clk, reg40, reg41, reg68, wire11);
  module173 #() modinst217 (.wire177(wire66), .y(wire216), .wire174(reg39), .clk(clk), .wire176(reg48), .wire175(reg47));
  assign wire218 = $unsigned({wire37});
  module219 #() modinst265 (.wire222(reg53), .wire221(reg42), .wire223(wire171), .clk(clk), .wire220(reg78), .wire224(reg73), .y(wire264));
endmodule

module module219
#(parameter param262 = ((((!((8'hb3) ? (7'h40) : (7'h41))) ? {(|(8'ha1))} : (((8'hbd) == (8'ha5)) <<< ((8'hbb) ? (8'hbf) : (8'hb9)))) ? ({{(8'hb5)}} ? {(&(8'h9e))} : (~^(~&(8'ha5)))) : (~|((8'hb7) ? (~^(8'hbd)) : ((7'h40) && (8'h9d))))) ? (+((~|((8'h9d) + (8'ha6))) << ((~^(8'hb9)) ? (~(8'ha8)) : ((8'haf) ? (8'hba) : (8'hab))))) : ((7'h44) ? ((~&((8'haf) ? (8'hab) : (8'ha5))) >= ((~&(7'h42)) ? ((8'hb7) ? (8'hb7) : (7'h40)) : {(8'hb3)})) : {((|(8'hbc)) >> ((8'hbd) ? (8'ha6) : (8'had)))})), 
parameter param263 = ((~&(((param262 >>> param262) ? (param262 * (8'ha8)) : (-param262)) ? param262 : ({param262, (8'hac)} ? param262 : {param262}))) ? ((((param262 << param262) ? (param262 < (8'haf)) : (param262 - param262)) ? {param262} : ((param262 ? param262 : param262) >>> (8'hac))) * (((+param262) ? ((8'ha4) ? param262 : param262) : (param262 ? param262 : (8'ha6))) ~^ (8'ha7))) : (((&((8'haf) ? param262 : (7'h44))) >> param262) ? (param262 ? (param262 - param262) : (^(~|param262))) : (((^~param262) > (^~param262)) ? (((8'hab) ? param262 : param262) ? (param262 ? param262 : param262) : (param262 ? param262 : param262)) : ((param262 ? param262 : param262) ? (param262 - param262) : ((8'hb5) ? param262 : param262))))))
(y, clk, wire224, wire223, wire222, wire221, wire220);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire224;
  input wire [(5'h10):(1'h0)] wire223;
  input wire signed [(5'h10):(1'h0)] wire222;
  input wire [(3'h7):(1'h0)] wire221;
  input wire signed [(4'hc):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire261;
  wire signed [(2'h3):(1'h0)] wire260;
  wire [(3'h5):(1'h0)] wire259;
  wire [(4'ha):(1'h0)] wire258;
  wire signed [(5'h14):(1'h0)] wire257;
  wire [(5'h15):(1'h0)] wire256;
  wire [(4'h9):(1'h0)] wire239;
  wire signed [(4'hf):(1'h0)] wire238;
  wire signed [(4'he):(1'h0)] wire226;
  wire signed [(5'h14):(1'h0)] wire225;
  reg [(4'hb):(1'h0)] reg255 = (1'h0);
  reg [(5'h10):(1'h0)] reg254 = (1'h0);
  reg [(3'h7):(1'h0)] reg253 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg250 = (1'h0);
  reg [(3'h6):(1'h0)] reg249 = (1'h0);
  reg signed [(4'he):(1'h0)] reg248 = (1'h0);
  reg [(3'h4):(1'h0)] reg247 = (1'h0);
  reg [(5'h13):(1'h0)] reg246 = (1'h0);
  reg [(3'h4):(1'h0)] reg245 = (1'h0);
  reg [(4'h9):(1'h0)] reg244 = (1'h0);
  reg [(3'h5):(1'h0)] reg243 = (1'h0);
  reg [(5'h12):(1'h0)] reg242 = (1'h0);
  reg [(4'hc):(1'h0)] reg241 = (1'h0);
  reg [(3'h4):(1'h0)] reg240 = (1'h0);
  reg [(5'h14):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg236 = (1'h0);
  reg [(3'h5):(1'h0)] reg235 = (1'h0);
  reg [(5'h10):(1'h0)] reg234 = (1'h0);
  reg [(4'ha):(1'h0)] reg233 = (1'h0);
  reg [(5'h11):(1'h0)] reg232 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg231 = (1'h0);
  reg [(3'h6):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg229 = (1'h0);
  reg [(4'h8):(1'h0)] reg228 = (1'h0);
  reg [(4'hc):(1'h0)] reg227 = (1'h0);
  assign y = {wire261,
                 wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire256,
                 wire239,
                 wire238,
                 wire226,
                 wire225,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg237,
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
                 (1'h0)};
  assign wire225 = $signed($unsigned($signed($signed((wire221 && wire223)))));
  assign wire226 = wire225[(4'he):(4'h8)];
  always
    @(posedge clk) begin
      reg227 <= (7'h44);
    end
  always
    @(posedge clk) begin
      reg228 <= $unsigned(((-($unsigned(wire220) < wire223)) < wire223[(3'h6):(3'h5)]));
      if (((~^(~wire225[(3'h6):(3'h5)])) | $signed(((^$signed(wire224)) >= $unsigned($unsigned(wire221))))))
        begin
          if ($unsigned($unsigned(wire223[(1'h0):(1'h0)])))
            begin
              reg229 <= reg228;
              reg230 <= (^(~&wire223[(3'h6):(2'h3)]));
              reg231 <= ((|wire222) ? reg229 : wire225[(5'h11):(2'h2)]);
              reg232 <= reg228;
            end
          else
            begin
              reg229 <= reg228;
            end
          reg233 <= (~^$unsigned(((8'ha3) || (^(reg227 ? wire223 : reg228)))));
          reg234 <= $signed($signed({$signed((wire222 ? (8'hb6) : wire223)),
              $unsigned((reg230 + wire225))}));
          reg235 <= wire222[(3'h4):(1'h0)];
        end
      else
        begin
          reg229 <= wire224[(4'hb):(1'h1)];
          reg230 <= reg234[(4'hf):(3'h5)];
          if (((8'ha6) - {$unsigned((-{wire226, wire225})), reg228}))
            begin
              reg231 <= ($signed($signed({((8'had) ?
                      wire220 : reg227)})) ^~ {(~^((reg227 ?
                      reg227 : (8'h9c)) >>> (^wire225))),
                  wire221[(1'h1):(1'h1)]});
            end
          else
            begin
              reg231 <= reg227[(4'ha):(4'h9)];
              reg232 <= (-(reg228 * $signed({(reg229 && (8'hac))})));
              reg233 <= ((wire226 ?
                      $unsigned($unsigned({reg229})) : {($signed(wire224) != $unsigned(wire224))}) ?
                  $unsigned(((8'h9d) ^~ wire220)) : (^~$unsigned(($unsigned(reg235) ?
                      {wire220} : $unsigned(wire222)))));
              reg234 <= ($signed({$unsigned(wire224),
                  $unsigned($signed(wire225))}) ^ (~|(!(7'h42))));
            end
          reg235 <= reg231[(3'h4):(1'h0)];
          reg236 <= reg231;
        end
      reg237 <= $signed(wire223[(3'h4):(1'h1)]);
    end
  assign wire238 = (reg232[(1'h1):(1'h0)] ?
                       wire221[(3'h7):(1'h1)] : {wire221[(1'h0):(1'h0)],
                           $signed({(^wire225)})});
  assign wire239 = (reg234[(5'h10):(4'hc)] ?
                       reg237[(4'hd):(4'ha)] : (~$signed(((8'h9f) ?
                           (&wire221) : reg236[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned($signed(reg228)) | (+(~&reg228)))) | reg237[(2'h2):(1'h0)]))
        begin
          if (($unsigned((-$signed(reg229))) ?
              reg234[(4'hf):(4'he)] : (((~^wire222[(4'he):(4'hb)]) ?
                  {reg237} : {(^(8'ha8)),
                      ((8'hab) ?
                          (8'hb9) : wire239)}) > wire220[(4'hc):(4'hc)])))
            begin
              reg240 <= wire221;
              reg241 <= ((&($signed($unsigned((8'h9d))) | wire220[(3'h6):(3'h4)])) ?
                  ((reg234[(4'hd):(4'ha)] ? $signed((|reg229)) : wire238) ?
                      reg229 : wire220) : ((&wire221[(3'h6):(3'h5)]) ?
                      $unsigned(reg228) : reg240[(3'h4):(2'h3)]));
              reg242 <= $signed($unsigned(((&((7'h41) ? reg231 : reg234)) ?
                  $unsigned($signed(wire238)) : (^~reg233[(2'h2):(1'h1)]))));
              reg243 <= $signed(({wire220[(2'h3):(1'h0)],
                      ({reg229} ?
                          (wire220 - reg228) : wire239[(4'h8):(1'h1)])} ?
                  $signed($signed((reg227 >> reg242))) : ((((8'haa) >>> reg232) ^ (-reg227)) ?
                      {(~^wire225)} : ($signed((8'ha2)) ? reg236 : reg241))));
            end
          else
            begin
              reg240 <= reg241;
              reg241 <= reg229;
              reg242 <= (reg243 || {($signed($signed((8'hb7))) ?
                      {$unsigned(reg232),
                          $signed(reg243)} : ($unsigned(wire223) > reg242[(4'he):(3'h6)])),
                  (~^($signed(reg233) == ((8'ha9) ~^ reg232)))});
              reg243 <= ((|wire224) ?
                  ((reg237 ? $unsigned((!reg229)) : wire238) >>> ((reg234 ?
                          (wire220 ? wire221 : reg237) : $signed((8'hb1))) ?
                      reg227 : ($signed((8'haa)) | reg242[(5'h10):(2'h2)]))) : ({(~^$unsigned(reg234))} ?
                      $signed(reg242[(4'ha):(3'h7)]) : reg227[(3'h4):(1'h0)]));
            end
          reg244 <= ($signed(reg227[(2'h3):(2'h2)]) ?
              reg229[(4'h8):(3'h7)] : $unsigned(reg229[(4'he):(1'h1)]));
          reg245 <= ((7'h41) ?
              $signed(reg229) : $unsigned({reg242[(1'h0):(1'h0)]}));
        end
      else
        begin
          reg240 <= ({(+(wire239 << reg241[(1'h0):(1'h0)]))} <= reg235[(1'h0):(1'h0)]);
          reg241 <= reg227[(2'h3):(1'h0)];
          reg242 <= {(8'hb2),
              $unsigned(((~wire226[(4'hd):(4'h9)]) ?
                  $unsigned({reg236, (7'h40)}) : ((~(8'hbf)) ?
                      (reg245 ? reg242 : reg237) : {reg237})))};
          reg243 <= ((reg227 << reg233[(3'h5):(2'h2)]) ?
              ((wire226 ?
                  $signed((~wire220)) : (-(reg243 & reg241))) + (wire220[(4'hc):(3'h4)] - reg230)) : (~|(~|({reg227} ?
                  reg241 : $signed(reg243)))));
        end
      reg246 <= ($unsigned(($unsigned($signed(reg230)) ~^ $signed(reg234))) ?
          ((reg236[(3'h6):(1'h0)] && ((wire220 || reg229) ?
              (8'ha7) : reg236)) ^~ $unsigned($signed(reg230[(2'h2):(1'h1)]))) : (reg245[(3'h4):(1'h1)] ?
              (reg228[(2'h2):(1'h1)] ?
                  ((wire226 ?
                      (8'ha4) : reg228) | (wire239 - (8'hb8))) : (reg243 ?
                      wire226[(4'ha):(4'h8)] : (wire221 ?
                          (7'h41) : reg241))) : (({wire238, wire238} ?
                      $unsigned(reg235) : (reg229 ? reg232 : reg230)) ?
                  reg232[(5'h10):(4'hc)] : ({wire224, reg228} ?
                      (^reg243) : $signed(wire238)))));
      reg247 <= wire225;
      if (((reg240 ?
              ((|reg227[(1'h1):(1'h1)]) ~^ $unsigned((reg245 - wire225))) : $signed(((&reg234) ?
                  reg246 : $signed(reg229)))) ?
          {(~&$signed((&wire223)))} : $signed($unsigned({$unsigned(reg228),
              ((8'ha8) | (8'hba))}))))
        begin
          reg248 <= $signed((&(($unsigned(reg231) >> (reg236 >>> reg236)) <<< $unsigned({wire224}))));
          reg249 <= $signed($unsigned(reg231));
          if ($signed((($unsigned((~^wire223)) ^ $signed({wire221})) >> reg234)))
            begin
              reg250 <= wire224;
              reg251 <= ((reg240[(3'h4):(2'h3)] < ($signed(((8'h9f) >= reg233)) ?
                      $unsigned((reg229 ^ (7'h43))) : $unsigned((reg230 ?
                          reg246 : wire222)))) ?
                  $unsigned(reg227[(4'ha):(1'h1)]) : wire221[(2'h3):(1'h1)]);
            end
          else
            begin
              reg250 <= $unsigned($unsigned($signed($unsigned((&wire239)))));
              reg251 <= $unsigned($unsigned(wire225));
              reg252 <= reg249;
              reg253 <= ((~^({{reg230},
                      (reg252 * wire220)} && $signed(((8'hba) ?
                      wire223 : wire239)))) ?
                  reg235[(2'h2):(2'h2)] : $signed(reg249[(2'h3):(1'h0)]));
            end
          reg254 <= reg229[(4'ha):(4'ha)];
          reg255 <= (+{wire222[(2'h3):(1'h1)]});
        end
      else
        begin
          reg248 <= (($signed((!reg254)) << $signed($signed((~^reg252)))) * $signed($unsigned($signed(reg243[(3'h4):(1'h1)]))));
          reg249 <= reg233[(4'ha):(3'h5)];
          reg250 <= (reg240 ? (^{reg255}) : (8'ha1));
        end
    end
  assign wire256 = {$unsigned(((^(reg245 == (8'hb0))) < $signed(reg235))),
                       (reg231[(3'h5):(1'h1)] ?
                           reg228[(1'h0):(1'h0)] : ($signed((reg250 && reg227)) || $unsigned((reg236 ?
                               (8'hbc) : reg234))))};
  assign wire257 = (~&$unsigned({$signed((~|reg245)), $unsigned((|reg245))}));
  assign wire258 = ({{$unsigned(reg251)},
                           (($signed(reg246) ? $signed((8'hb7)) : (|reg227)) ?
                               reg237[(1'h1):(1'h0)] : reg230[(3'h4):(3'h4)])} ?
                       {(&wire224[(4'ha):(3'h4)])} : (-$signed(((reg242 != reg233) ?
                           (~|(8'hab)) : $signed(reg232)))));
  assign wire259 = ($signed(($unsigned(reg229) ^ reg248)) ?
                       $signed(($unsigned((reg229 ? wire225 : reg247)) ?
                           reg229 : $signed((~wire258)))) : $unsigned((reg255[(2'h2):(1'h1)] ^~ reg228)));
  assign wire260 = reg230;
  assign wire261 = $signed($signed(wire259));
endmodule

module module173
#(parameter param215 = (&(+((-(7'h44)) ? (~&{(8'hae)}) : ((~|(8'hbc)) << {(8'hab), (8'haa)})))))
(y, clk, wire177, wire176, wire175, wire174);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire177;
  input wire signed [(3'h4):(1'h0)] wire176;
  input wire [(3'h5):(1'h0)] wire175;
  input wire [(4'h8):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire214;
  wire [(5'h13):(1'h0)] wire213;
  wire [(4'hf):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire211;
  wire [(5'h12):(1'h0)] wire210;
  wire [(4'h9):(1'h0)] wire209;
  wire [(5'h15):(1'h0)] wire208;
  wire [(4'ha):(1'h0)] wire204;
  wire signed [(2'h3):(1'h0)] wire203;
  wire signed [(4'he):(1'h0)] wire202;
  wire [(4'h9):(1'h0)] wire201;
  wire [(3'h4):(1'h0)] wire200;
  wire [(5'h14):(1'h0)] wire180;
  reg signed [(5'h12):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg206 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg205 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg199 = (1'h0);
  reg [(4'ha):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg196 = (1'h0);
  reg [(3'h7):(1'h0)] reg195 = (1'h0);
  reg [(4'ha):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg192 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg188 = (1'h0);
  reg [(5'h12):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg183 = (1'h0);
  reg [(5'h11):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg179 = (1'h0);
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire180,
                 reg207,
                 reg206,
                 reg205,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg179,
                 reg178,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg178 <= $unsigned((~{(wire175[(2'h2):(2'h2)] | wire174)}));
      reg179 <= {((((wire174 > reg178) ?
                  $signed(wire177) : $unsigned(wire176)) >= $signed(((8'hac) != reg178))) ?
              wire176[(1'h0):(1'h0)] : $unsigned($unsigned((reg178 ?
                  wire177 : reg178))))};
    end
  assign wire180 = $unsigned((!$signed($signed(reg179[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($unsigned(($signed({(~|reg178)}) ?
          (~($unsigned(reg179) + $signed(wire174))) : wire176)))
        begin
          reg181 <= $unsigned((({$signed((8'ha6))} ?
              $signed($unsigned(reg179)) : {$unsigned((8'h9d)),
                  wire176[(1'h1):(1'h0)]}) <<< ((reg179 & ((7'h43) < (7'h40))) + $unsigned(wire180))));
          reg182 <= (^~reg179);
          reg183 <= reg182[(3'h7):(2'h2)];
          reg184 <= ($signed((((reg179 << wire180) ?
                      reg183[(1'h1):(1'h0)] : (reg178 << wire175)) ?
                  ($signed(wire180) <<< $signed(wire176)) : (8'ha9))) ?
              wire177 : ({{$unsigned(wire180), (~^reg179)}, (7'h43)} ?
                  $unsigned($unsigned((wire177 ^ wire176))) : ($signed((+wire176)) * reg179[(1'h1):(1'h0)])));
          reg185 <= $signed((-($signed((!reg184)) ^ wire177[(4'hb):(3'h7)])));
        end
      else
        begin
          reg181 <= ($signed((^~$signed((reg185 && reg183)))) ?
              wire175[(1'h1):(1'h0)] : ({{wire180[(4'h8):(2'h2)]},
                  $signed(reg182)} & (+$unsigned((reg184 ^ (8'haf))))));
          reg182 <= wire176;
        end
      reg186 <= wire175;
      if ($unsigned(reg179))
        begin
          reg187 <= $unsigned(wire174[(3'h6):(1'h0)]);
          reg188 <= $signed((8'hba));
        end
      else
        begin
          reg187 <= reg185[(1'h1):(1'h0)];
          reg188 <= $unsigned({reg188, (8'ha0)});
          reg189 <= $signed((^reg182[(3'h7):(3'h5)]));
          if (wire180[(2'h2):(1'h0)])
            begin
              reg190 <= (|(reg184[(1'h0):(1'h0)] > (8'hb6)));
              reg191 <= $unsigned((reg178 > $signed(((!reg182) ?
                  (reg181 ? reg181 : wire175) : reg183[(1'h0):(1'h0)]))));
              reg192 <= $unsigned($unsigned({reg191[(1'h0):(1'h0)]}));
              reg193 <= (wire180 == $signed(reg187));
              reg194 <= reg189[(4'hf):(2'h2)];
            end
          else
            begin
              reg190 <= (7'h42);
              reg191 <= {reg187};
              reg192 <= {$unsigned((reg184[(2'h3):(1'h0)] && $signed((wire177 | reg188)))),
                  reg189[(4'he):(2'h2)]};
            end
        end
      reg195 <= (reg193 ?
          ((&(~^$signed(reg188))) | {reg191,
              ((reg194 | reg179) ?
                  (reg187 ?
                      reg179 : reg183) : (7'h42))}) : ((&{$unsigned(reg192),
              (wire175 ?
                  reg194 : reg185)}) > (!((wire176 * reg184) | reg183))));
      reg196 <= $signed($signed($signed($unsigned(wire174))));
    end
  always
    @(posedge clk) begin
      reg197 <= (((($signed((7'h42)) ?
                      $signed(reg188) : (wire180 ? (7'h44) : (8'hbc))) ?
                  ((wire174 ?
                      reg190 : reg181) ^ (wire174 - reg178)) : ((reg186 ^ wire176) ?
                      ((8'ha5) ? reg190 : (8'hab)) : $unsigned(reg182))) ?
              reg189 : $signed(reg183)) ?
          (~&($signed((~^(8'hab))) == {(&wire174)})) : reg191);
      reg198 <= $signed((8'hae));
      reg199 <= reg190;
    end
  assign wire200 = (reg185[(4'h9):(3'h4)] >>> reg179[(1'h1):(1'h1)]);
  assign wire201 = ((-$signed($signed($unsigned(reg193)))) ?
                       ((-(reg178[(4'h8):(3'h4)] ^~ $signed(reg178))) ~^ reg199) : ((~$unsigned(reg194[(3'h5):(1'h1)])) ?
                           ((~|((8'hb4) << reg195)) ?
                               {reg191} : ($unsigned(wire180) | {reg182})) : $unsigned({reg189[(3'h6):(1'h0)]})));
  assign wire202 = $unsigned((!{$signed(reg184[(2'h3):(1'h1)]), reg199}));
  assign wire203 = wire180[(4'ha):(3'h7)];
  assign wire204 = (^((~wire201[(2'h2):(1'h0)]) ?
                       {(8'ha4)} : ((reg191[(1'h1):(1'h0)] ?
                           wire174 : (~&reg187)) << reg195)));
  always
    @(posedge clk) begin
      reg205 <= (8'haa);
      reg206 <= ($unsigned((8'hb2)) >>> {{$unsigned((reg184 ?
                  (8'hb2) : reg187))},
          $signed(reg191)});
      reg207 <= ($signed($unsigned($signed($unsigned(reg192)))) != {((reg184 ?
              ((7'h44) ?
                  reg190 : reg205) : reg178[(4'h8):(3'h6)]) ^ reg183[(3'h4):(2'h2)]),
          $signed({(reg206 ? wire204 : reg188)})});
    end
  assign wire208 = $unsigned($unsigned({{reg182, (reg186 - wire200)}, reg178}));
  assign wire209 = reg178[(4'h8):(1'h0)];
  assign wire210 = (($signed($unsigned((wire208 >= (8'hbd)))) ?
                           $unsigned(reg198) : $unsigned(($signed(reg206) ?
                               ((8'hb7) ?
                                   reg189 : wire203) : wire175[(2'h2):(1'h0)]))) ?
                       $signed((reg181[(2'h2):(1'h0)] ?
                           (!(wire175 ^ wire175)) : reg192[(2'h2):(1'h0)])) : wire203);
  assign wire211 = (($unsigned(wire209[(3'h4):(1'h0)]) ?
                           (~^{$signed((8'ha8)),
                               reg185[(3'h6):(3'h6)]}) : $signed((wire174 < $signed(wire176)))) ?
                       ((^$unsigned((~&wire201))) ?
                           (^~((wire174 * reg206) == wire175[(3'h5):(1'h1)])) : ($unsigned($unsigned(wire175)) ^~ wire204)) : $unsigned((wire174 ?
                           wire200[(2'h2):(1'h0)] : (reg198 != reg189))));
  assign wire212 = (8'hb2);
  assign wire213 = ((|($signed(wire200) ?
                       ($unsigned(reg178) ?
                           reg206[(5'h11):(3'h6)] : (reg206 > (8'haf))) : $signed((reg189 ?
                           reg188 : reg182)))) > reg190[(1'h1):(1'h1)]);
  assign wire214 = wire176;
endmodule

module module126
#(parameter param170 = {((8'hba) ? (^(((8'hb7) ? (8'hab) : (8'hb5)) <<< (8'ha8))) : ((((8'hab) ? (8'hbf) : (8'ha3)) >= ((8'hac) ? (8'hb5) : (8'hb5))) ? ({(8'ha7), (8'had)} >>> {(8'h9f), (8'hba)}) : {((8'hbc) << (8'ha9))})), (((8'hbd) ? (~((8'ha4) ~^ (8'ha5))) : (((8'hac) == (8'hbc)) ? ((8'ha7) == (8'hb3)) : (8'hbb))) >> {((+(8'hb3)) | ((8'ha5) ? (8'hb7) : (8'hb9)))})})
(y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire130;
  input wire signed [(4'hb):(1'h0)] wire129;
  input wire [(4'hf):(1'h0)] wire128;
  input wire signed [(2'h3):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire169;
  wire [(4'h9):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire155;
  wire [(3'h4):(1'h0)] wire154;
  wire signed [(5'h15):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  reg [(2'h3):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(4'hf):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(3'h5):(1'h0)] reg141 = (1'h0);
  reg [(2'h2):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire149,
                 wire133,
                 wire132,
                 wire131,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
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
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire131 = (|wire127[(1'h0):(1'h0)]);
  assign wire132 = wire127[(2'h2):(1'h0)];
  assign wire133 = (((!$signed((wire127 && wire128))) && wire127) ?
                       wire130 : wire131);
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire130)))
        begin
          reg134 <= (($unsigned((~^(wire129 ? wire132 : wire131))) ?
              wire133 : (wire129 | $signed((8'ha2)))) > ({wire127} >>> $unsigned((((8'h9e) ?
              wire132 : wire132) && $unsigned(wire132)))));
          reg135 <= $unsigned(reg134);
          reg136 <= (-wire133);
        end
      else
        begin
          if ($signed((~&wire127[(1'h0):(1'h0)])))
            begin
              reg134 <= wire132[(2'h2):(1'h1)];
              reg135 <= $signed((~^wire129[(3'h4):(2'h2)]));
              reg136 <= $signed(wire127[(1'h1):(1'h0)]);
              reg137 <= reg134[(1'h1):(1'h0)];
              reg138 <= (~|reg137);
            end
          else
            begin
              reg134 <= (((-(-(reg134 && wire128))) > $signed((~^reg134[(2'h2):(1'h0)]))) ?
                  $signed($signed(reg136)) : wire129);
              reg135 <= ($unsigned(wire131) - (~wire128));
              reg136 <= ((~&{(~|(^wire127))}) ? wire128 : {reg137});
            end
        end
      if (((8'had) | (({$unsigned(reg135)} ?
          $unsigned((reg138 ?
              wire132 : wire131)) : (^~(wire131 != reg136))) == $unsigned(($signed((8'hbf)) * $signed(reg137))))))
        begin
          reg139 <= wire129;
          reg140 <= (wire130[(1'h0):(1'h0)] ?
              ($unsigned(wire131[(4'h9):(3'h6)]) ?
                  reg135 : (~&{{wire132},
                      (wire132 != reg134)})) : (($unsigned((reg135 ?
                      wire131 : reg136)) ?
                  $signed({wire128,
                      reg135}) : wire131) <= $signed({reg137[(4'ha):(3'h4)],
                  wire133})));
          reg141 <= (~(^$signed((~reg135))));
          if (($signed((-$signed($unsigned((8'hbd))))) == ($unsigned((+(7'h41))) ?
              reg140[(2'h2):(1'h1)] : (-$unsigned($unsigned(reg134))))))
            begin
              reg142 <= wire131[(1'h1):(1'h0)];
              reg143 <= $unsigned(($unsigned(reg135[(4'hb):(2'h2)]) ?
                  wire130 : wire129[(3'h6):(2'h3)]));
            end
          else
            begin
              reg142 <= (((~|{(reg143 ? reg143 : wire130), (!wire132)}) ?
                  reg139 : (reg142[(2'h2):(1'h0)] - (&(wire128 ?
                      reg137 : (8'ha1))))) < (((reg138[(1'h1):(1'h0)] ?
                          (reg143 ? reg142 : reg136) : $signed((8'ha9))) ?
                      wire131[(3'h6):(3'h4)] : $signed($unsigned(wire131))) ?
                  $unsigned(($signed(wire131) * reg137[(4'h8):(4'h8)])) : $signed(reg142[(3'h5):(1'h1)])));
              reg143 <= (wire130 ?
                  ((wire128[(2'h3):(1'h1)] && ($unsigned(reg138) ?
                          reg138[(2'h2):(1'h1)] : (wire128 ?
                              reg137 : wire132))) ?
                      wire128 : (+$signed(wire127))) : ($signed($signed(reg134)) ?
                      $signed($unsigned((reg135 ?
                          reg137 : wire130))) : (8'hb8)));
              reg144 <= ((^~(8'had)) ?
                  (|$unsigned(($unsigned((8'haf)) ?
                      (~reg135) : (reg137 ^~ wire128)))) : ($signed(reg142[(2'h3):(1'h0)]) << $signed($unsigned(reg135))));
              reg145 <= (~wire128);
            end
        end
      else
        begin
          reg139 <= {((((reg135 < reg143) ?
                          ((8'had) ? wire129 : (8'ha4)) : {reg142}) ?
                      (|reg134[(1'h0):(1'h0)]) : ((^wire132) << $unsigned(wire128))) ?
                  wire128[(2'h2):(1'h1)] : (wire131 ?
                      wire127 : $unsigned($signed(wire133)))),
              ((&reg143) ?
                  (reg138 ?
                      (8'h9d) : {(~^wire128),
                          ((8'hbc) ?
                              reg138 : (8'hbc))}) : $signed($signed(wire131[(4'hb):(4'h8)])))};
          if (wire128[(1'h0):(1'h0)])
            begin
              reg140 <= $signed($signed(reg145[(1'h1):(1'h0)]));
            end
          else
            begin
              reg140 <= reg145;
              reg141 <= $signed(((($signed(wire130) >>> {reg141,
                  wire133}) || reg136[(1'h0):(1'h0)]) <= wire128));
              reg142 <= wire129[(2'h2):(1'h0)];
              reg143 <= reg143[(2'h3):(2'h3)];
              reg144 <= reg139[(3'h4):(1'h1)];
            end
        end
      reg146 <= (((~((+wire133) ?
              (reg138 ?
                  reg137 : reg134) : (reg139 - reg144))) >> (+$unsigned(reg144[(1'h1):(1'h0)]))) ?
          (reg139 >> {{{reg137, (8'ha3)}}}) : (~|(reg139[(4'hc):(1'h0)] ?
              (reg134 != (reg143 ? (7'h42) : reg145)) : ((wire128 ?
                      wire130 : reg143) ?
                  (wire132 << reg134) : $unsigned(reg144)))));
      reg147 <= $signed($signed(reg144));
      reg148 <= ((~(|((reg139 ? reg146 : (8'had)) ?
          (8'hbb) : reg137))) >>> (~wire129));
    end
  assign wire149 = (8'hba);
  always
    @(posedge clk) begin
      reg150 <= wire133[(2'h2):(2'h2)];
      reg151 <= $unsigned(reg145);
      reg152 <= $signed($unsigned(reg147[(4'hc):(3'h5)]));
      reg153 <= (^(~&({$unsigned(reg147)} ^ (wire132 ?
          reg151[(2'h3):(1'h0)] : $unsigned(reg142)))));
    end
  assign wire154 = wire149;
  assign wire155 = (reg136[(3'h5):(1'h1)] && {($signed((-reg148)) ?
                           wire133 : (reg147 ?
                               $unsigned((8'ha8)) : ((8'hb4) ?
                                   reg146 : wire129)))});
  assign wire156 = (~&($signed($unsigned((reg152 + reg134))) * $signed($signed((wire155 ~^ wire154)))));
  assign wire157 = (8'h9d);
  always
    @(posedge clk) begin
      if (wire131[(5'h10):(5'h10)])
        begin
          reg158 <= $signed($signed((-(~^(~^reg145)))));
          reg159 <= $unsigned(($signed(reg137) >= reg138[(1'h0):(1'h0)]));
        end
      else
        begin
          reg158 <= $unsigned($unsigned((((reg146 ^ wire154) ^~ {(8'hbf),
              wire155}) + (!$signed((8'ha6))))));
        end
      reg160 <= reg138[(1'h1):(1'h0)];
      if (((reg160[(2'h3):(2'h2)] ?
              $signed($signed($signed(reg135))) : ({$unsigned(wire132),
                  (~reg141)} << reg134[(3'h6):(3'h5)])) ?
          wire155[(3'h7):(1'h0)] : ((wire129[(2'h3):(1'h0)] >>> ({reg151} ?
              wire128 : $signed((7'h42)))) != $signed(wire132[(1'h0):(1'h0)]))))
        begin
          reg161 <= ((reg147[(2'h3):(1'h1)] >= (reg136[(4'h8):(2'h2)] ?
                  ($signed(reg143) >= (wire157 ?
                      wire129 : (8'hb0))) : $unsigned(reg135))) ?
              (($signed((reg158 ?
                  reg159 : (8'ha2))) ~^ wire129[(3'h7):(1'h0)]) >>> (&((reg147 >> wire133) ?
                  $unsigned(reg138) : $unsigned((7'h40))))) : ($signed(reg141) ?
                  reg151 : ({$signed(wire149),
                      wire133[(4'h9):(1'h0)]} + {{(8'hb3)}})));
          reg162 <= wire154;
          reg163 <= $unsigned(wire157);
          reg164 <= (!((&(&$unsigned(reg141))) ?
              reg139 : ((~|{reg141, reg151}) >>> $unsigned((!reg146)))));
          reg165 <= (^~(8'haa));
        end
      else
        begin
          reg161 <= ({$signed(wire131), (^reg150)} ?
              $signed($signed((~|(reg142 <<< reg144)))) : (reg165 ?
                  (|(reg141[(2'h2):(1'h0)] - (reg153 * (8'h9f)))) : reg140));
        end
      reg166 <= ($signed(reg151[(2'h2):(1'h0)]) ?
          $signed((8'hb8)) : $signed(($unsigned($signed(reg140)) < (&{(8'ha3),
              reg135}))));
    end
  assign wire167 = $unsigned(wire127[(1'h1):(1'h1)]);
  assign wire168 = {$signed((~&reg138))};
  assign wire169 = (reg161 ? $unsigned(reg158) : reg145[(3'h5):(2'h3)]);
endmodule

module module87
#(parameter param122 = ((!{(~&{(8'hbe), (8'hb4)}), {((8'hbc) ? (7'h40) : (8'ha6)), (+(8'ha1))}}) ~^ {({((8'hb7) <= (8'h9f))} ? (8'hbb) : (|(-(7'h42))))}), 
parameter param123 = ((!param122) ? (param122 <<< ((~^{param122}) && (+(param122 ? param122 : param122)))) : param122))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire92;
  input wire signed [(3'h4):(1'h0)] wire91;
  input wire [(4'hf):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire89;
  input wire signed [(4'ha):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire112,
                 wire99,
                 wire98,
                 wire94,
                 wire93,
                 reg118,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
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
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire93 = $signed($unsigned((8'hac)));
  assign wire94 = $unsigned(((8'hb6) ?
                      ((&$signed(wire91)) ?
                          $signed($unsigned(wire92)) : (~&(wire90 >> wire89))) : $unsigned({$unsigned(wire91),
                          $unsigned(wire91)})));
  always
    @(posedge clk) begin
      reg95 <= $unsigned($unsigned(wire93[(4'hd):(4'ha)]));
      reg96 <= (~wire93[(1'h1):(1'h1)]);
      reg97 <= (wire92 * wire93[(4'ha):(4'ha)]);
    end
  assign wire98 = $unsigned(((wire91 ?
                      $signed({wire94,
                          reg97}) : (~$unsigned(wire91))) != (-(~|(~^wire93)))));
  assign wire99 = reg97[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg100 <= (!$signed((8'ha9)));
      reg101 <= wire99[(3'h7):(3'h6)];
      if ((+(({$unsigned(wire91)} ?
          reg100 : {$signed(reg96), (wire99 <= (8'hbc))}) ~^ (8'hb1))))
        begin
          reg102 <= reg96[(3'h5):(3'h5)];
        end
      else
        begin
          if ($signed(wire94[(1'h1):(1'h0)]))
            begin
              reg102 <= $signed(({$signed(((8'hbb) ?
                      wire91 : wire92))} & ((~$signed(wire89)) ?
                  {((8'hb0) & wire90),
                      $signed(reg96)} : wire98[(2'h2):(1'h0)])));
            end
          else
            begin
              reg102 <= (reg100 ? wire88 : (~&$signed(wire90[(3'h4):(2'h2)])));
              reg103 <= ({$signed($signed((wire89 ? wire93 : (7'h43)))),
                  ({(8'ha8)} ?
                      ((reg97 ? reg102 : reg101) ?
                          (reg97 ?
                              reg97 : wire91) : $unsigned(wire89)) : wire99)} + $signed($signed($unsigned(((8'hab) ?
                  wire94 : wire88)))));
            end
          reg104 <= (~^(((((8'hb4) ?
                  wire88 : wire90) >= (wire93 < wire88)) && $signed(reg101)) ?
              wire99 : $unsigned($unsigned((wire89 ? wire94 : wire98)))));
          reg105 <= ({((wire94 ? $signed(reg96) : ((7'h43) ? reg97 : wire88)) ?
                  ($signed(reg97) * ((8'hbb) ?
                      wire88 : (8'had))) : $unsigned((wire98 ~^ wire89)))} & reg102);
          reg106 <= ({(|(wire90 ?
                  wire93[(2'h3):(2'h3)] : (reg102 <<< reg102)))} < (~|(~^$signed((&reg97)))));
        end
      if (reg96[(2'h3):(1'h0)])
        begin
          reg107 <= {(wire93[(4'h8):(1'h0)] ?
                  ((7'h40) ^ ((reg101 << wire93) << $signed(reg105))) : wire93)};
          reg108 <= ((^$unsigned($unsigned($unsigned(wire89)))) | reg103);
          reg109 <= ((~|{reg101[(5'h15):(4'h9)]}) != ($signed((wire99 ?
                  (wire98 ? wire93 : reg105) : {reg97})) ?
              (~|wire90) : wire91[(2'h2):(1'h1)]));
          reg110 <= reg96;
        end
      else
        begin
          reg107 <= wire93;
          reg108 <= (~^(wire92 >= (wire98[(3'h7):(2'h3)] ?
              ((reg103 ? reg106 : wire89) < (!wire88)) : $unsigned((reg97 ?
                  wire91 : (8'ha7))))));
        end
      reg111 <= {($unsigned(($unsigned(wire93) == (reg102 ?
              reg105 : wire99))) <= $signed(($unsigned(reg105) ?
              reg105 : $signed(wire93)))),
          ($unsigned(reg102[(2'h2):(1'h1)]) ?
              ($signed($signed(reg109)) * $unsigned(reg96[(1'h0):(1'h0)])) : $signed({$unsigned((8'hac)),
                  $signed(reg104)}))};
    end
  assign wire112 = $unsigned(reg97);
  always
    @(posedge clk) begin
      reg113 <= ($signed(wire90[(1'h1):(1'h1)]) * ((|$unsigned(wire90[(4'h8):(1'h1)])) ?
          reg110[(4'ha):(3'h5)] : wire89));
      reg114 <= reg106[(2'h3):(1'h1)];
      reg115 <= reg95;
      reg116 <= ({reg96[(3'h5):(2'h2)],
          $unsigned((~|$signed(reg111)))} ^~ reg96);
    end
  assign wire117 = wire98[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg118 <= ($unsigned($signed(((~&(8'h9e)) ?
          $unsigned(wire90) : (wire91 << wire117)))) != ((wire112 ?
              ({reg111} ?
                  (reg106 ? reg102 : (8'ha3)) : (reg102 ?
                      wire89 : reg104)) : $signed((+wire90))) ?
          reg110[(4'hc):(3'h5)] : (&((~^reg103) >> (reg114 ?
              reg111 : wire117)))));
    end
  assign wire119 = $unsigned(reg109[(4'hd):(4'hb)]);
  assign wire120 = (^~$unsigned((^~wire93)));
  assign wire121 = (|$unsigned((((reg102 ? wire88 : reg100) ?
                           reg109 : wire117) ?
                       (reg107[(2'h3):(1'h0)] >> reg107[(4'h8):(2'h2)]) : ((reg108 >= wire117) ?
                           $signed((8'hb2)) : $unsigned(wire112)))));
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire22,
                 wire21,
                 wire20,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire20 = wire19[(2'h3):(1'h1)];
  assign wire21 = ((({(wire17 <= wire16), (~^wire18)} ?
                          wire20[(2'h2):(1'h0)] : $unsigned($unsigned(wire17))) < (+(~|wire19[(2'h2):(2'h2)]))) ?
                      $unsigned((~|(!$signed(wire16)))) : ((~$signed((wire18 ?
                          wire18 : wire18))) >= $signed(wire16[(3'h4):(3'h4)])));
  assign wire22 = (~|(wire18 ?
                      (wire20 ?
                          $unsigned($signed(wire18)) : wire20) : {(^(^wire21)),
                          wire17}));
  always
    @(posedge clk) begin
      reg23 <= wire20[(2'h3):(1'h0)];
      reg24 <= ((wire19[(2'h3):(2'h3)] ?
          (~&((wire18 ^ wire21) ?
              $signed((8'hb3)) : wire22)) : $unsigned({wire20,
              (-(8'h9d))})) + wire22[(4'hd):(4'hc)]);
      reg25 <= ((+(wire16[(3'h5):(1'h0)] >= $signed($signed(wire22)))) ?
          ($signed(((^wire19) << $unsigned(wire19))) ?
              wire19[(1'h1):(1'h1)] : wire16[(4'ha):(2'h3)]) : (((~|{reg23}) ?
                  (~&reg23) : $signed($unsigned((8'h9c)))) ?
              wire22 : wire19));
      reg26 <= (wire18 ?
          reg25[(4'hf):(3'h7)] : $unsigned($unsigned(($unsigned((8'hba)) ?
              (wire17 ? wire21 : wire19) : reg24[(3'h4):(1'h1)]))));
    end
  assign wire27 = (+wire21);
  assign wire28 = $unsigned($signed($signed(wire20)));
  always
    @(posedge clk) begin
      reg29 <= $unsigned((reg24 ? wire27 : $unsigned(reg26[(3'h4):(1'h0)])));
      reg30 <= $unsigned((|($unsigned(wire19) >>> (8'ha7))));
    end
  assign wire31 = {$signed(({$signed(wire18),
                          $signed(reg29)} * $signed($unsigned(wire17))))};
  assign wire32 = {($signed(((wire19 ? (8'hb8) : (8'hbc)) ?
                              (reg24 ? wire31 : (8'hb2)) : (~^wire21))) ?
                          {wire20} : {((wire16 ? wire19 : wire27) ?
                                  (reg30 == wire31) : {reg30, wire21}),
                              wire20[(3'h6):(3'h4)]})};
  assign wire33 = $signed($unsigned((~|($signed(wire16) ?
                      $signed((8'h9c)) : wire19[(2'h2):(1'h1)]))));
endmodule
