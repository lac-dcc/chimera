module top
#(parameter param93 = {(((((8'hb8) ^ (8'ha1)) > (8'haf)) << (~((7'h44) ? (7'h44) : (8'h9c)))) ? (8'ha6) : ((|((8'had) >> (8'hab))) ? (!(~|(8'hb6))) : (-(8'hab))))}, 
parameter param94 = (((((-param93) >> ((8'hb5) ? (7'h43) : (8'haf))) ~^ (param93 | param93)) ? ((((8'ha1) ? param93 : (8'hac)) >> param93) ? (param93 <<< param93) : ((param93 | param93) ? {param93, (8'hae)} : (param93 ? param93 : (8'ha3)))) : (^((param93 ? param93 : param93) != (param93 > (8'hb8))))) ? ((((param93 || param93) ? (param93 ? param93 : param93) : (param93 >> param93)) || ((param93 ? param93 : (8'hbf)) ? (param93 == param93) : param93)) ? (((param93 ? param93 : param93) ? {param93, param93} : (~|param93)) ? (^~(param93 ? (7'h41) : (8'hb5))) : param93) : {{(param93 >= param93), (param93 << param93)}}) : ((^~(&{param93, param93})) ? (((^~param93) ? param93 : (param93 ? param93 : param93)) < param93) : param93)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire53;
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire4,
                 wire5,
                 wire53,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg59,
                 (1'h0)};
  assign wire4 = (^((~{wire0[(1'h1):(1'h1)]}) ~^ $signed($signed(wire0[(3'h6):(1'h0)]))));
  assign wire5 = wire2[(3'h4):(2'h3)];
  module6 #() modinst54 (wire53, clk, wire3, wire0, wire5, wire1, wire2);
  assign wire55 = wire0;
  assign wire56 = wire4[(4'h9):(3'h6)];
  assign wire57 = wire56;
  assign wire58 = wire5[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg59 <= wire3[(2'h3):(1'h0)];
    end
  assign wire60 = (-$unsigned((+(^(wire57 * wire4)))));
  assign wire61 = $unsigned($signed($unsigned(wire0)));
  assign wire62 = (wire55[(1'h0):(1'h0)] ?
                      wire2 : (wire3[(2'h3):(2'h2)] ?
                          ($unsigned((wire53 ? wire1 : reg59)) >> (wire2 ?
                              wire0 : $unsigned(wire1))) : wire3[(4'ha):(3'h5)]));
  always
    @(posedge clk) begin
      reg63 <= ($signed($unsigned(wire56[(4'hc):(3'h4)])) ?
          ((((~wire3) ^ wire53) ? (|wire57) : wire3) ^~ wire58) : wire58);
      reg64 <= $signed(((-($signed(wire4) ?
              (reg59 ? reg63 : wire4) : {wire55})) ?
          wire1 : $unsigned(wire0)));
      if ($signed(($signed((|(|wire57))) ^ $signed(((wire62 > wire55) < wire62[(1'h0):(1'h0)])))))
        begin
          reg65 <= reg64[(3'h5):(1'h0)];
          reg66 <= $signed(wire53);
          reg67 <= ((8'ha5) ^~ wire60[(4'hc):(2'h2)]);
          if ($signed($signed($unsigned(wire55))))
            begin
              reg68 <= wire4;
              reg69 <= $signed(wire2);
              reg70 <= (8'hbc);
              reg71 <= {($signed((~wire57[(3'h4):(3'h4)])) ?
                      (wire53 * wire56) : (($signed(wire62) >= (~&wire57)) ?
                          {wire2,
                              wire56[(3'h4):(2'h2)]} : ((~&reg68) <<< {wire1})))};
              reg72 <= (wire58[(1'h0):(1'h0)] ?
                  $unsigned($signed(($unsigned(wire56) | $signed(wire58)))) : $unsigned($unsigned({(wire1 > wire61),
                      $signed(reg69)})));
            end
          else
            begin
              reg68 <= reg71[(4'ha):(4'h8)];
              reg69 <= wire61;
              reg70 <= $signed($signed(({$signed(reg69), $signed(reg69)} ?
                  ($signed(wire2) || $unsigned(reg67)) : {(reg70 >> wire57),
                      $unsigned(wire58)})));
              reg71 <= ($unsigned($unsigned((^{(8'hab), (7'h43)}))) ?
                  {(|($unsigned(wire55) ?
                          (-wire62) : (8'hb4)))} : {$signed((reg63[(3'h6):(2'h2)] ?
                          (~^reg72) : $unsigned(wire55)))});
            end
          if (reg72[(4'h8):(3'h7)])
            begin
              reg73 <= reg72[(3'h7):(3'h5)];
              reg74 <= (-reg70);
            end
          else
            begin
              reg73 <= wire0;
              reg74 <= reg63[(4'h8):(3'h6)];
              reg75 <= reg59[(4'h9):(3'h4)];
              reg76 <= wire57;
            end
        end
      else
        begin
          reg65 <= $signed((&(!$unsigned(wire53[(4'he):(1'h0)]))));
        end
      if ($signed(reg59))
        begin
          reg77 <= ({(~|((reg59 && (8'haa)) ? $unsigned(wire55) : reg65)),
                  (($signed(reg72) ?
                      $unsigned((8'ha6)) : ((7'h40) * reg71)) > (reg68[(2'h3):(1'h1)] - reg59[(2'h2):(1'h0)]))} ?
              $signed((8'hb9)) : reg72[(3'h7):(1'h1)]);
        end
      else
        begin
          if (({($unsigned($unsigned(wire61)) < wire55[(2'h2):(1'h1)]),
              reg64} | {(reg77[(2'h3):(1'h1)] ? reg72[(4'hd):(4'hb)] : wire5),
              $signed(reg64)}))
            begin
              reg77 <= $signed((((-((7'h43) ? wire1 : wire53)) ?
                  ((^~wire57) >> (reg69 && wire0)) : (-wire5[(4'h9):(3'h7)])) & reg59[(4'hb):(4'h8)]));
              reg78 <= $signed($signed($unsigned({(wire57 & reg70), {wire1}})));
              reg79 <= $signed($unsigned($signed(((wire4 <= reg71) > (reg63 && wire58)))));
              reg80 <= $signed(wire57);
              reg81 <= (!reg70);
            end
          else
            begin
              reg77 <= $signed(((wire55[(2'h3):(1'h1)] * (wire0 - $unsigned(reg69))) >> ({(wire58 - wire57)} & (reg66[(1'h1):(1'h1)] ?
                  reg68 : (!reg66)))));
            end
          if ($unsigned($signed($signed((+(~^wire55))))))
            begin
              reg82 <= (wire0[(3'h6):(3'h6)] ?
                  reg75[(2'h2):(1'h0)] : $unsigned($signed(reg71)));
              reg83 <= wire4;
            end
          else
            begin
              reg82 <= wire61;
              reg83 <= ($signed(wire4[(2'h3):(2'h3)]) <= ($unsigned($unsigned(((8'hbd) <<< reg74))) ?
                  wire57[(3'h5):(3'h5)] : {reg72[(4'hd):(1'h0)]}));
              reg84 <= (($signed(wire58[(1'h0):(1'h0)]) >>> (reg82 <= (reg74[(4'hb):(4'ha)] == reg63[(3'h4):(3'h4)]))) ?
                  (($unsigned($unsigned(reg68)) != {wire3[(4'ha):(3'h4)],
                          reg63[(3'h4):(3'h4)]}) ?
                      (reg81[(2'h3):(2'h3)] && $unsigned((~&wire2))) : {((!reg83) >>> (reg78 ?
                              (8'hb0) : reg76)),
                          reg81[(3'h7):(3'h4)]}) : {wire3,
                      $unsigned(wire3[(3'h6):(2'h2)])});
            end
          reg85 <= wire0[(4'h9):(2'h3)];
          reg86 <= $unsigned((~^({(7'h43)} != ((reg68 ? reg82 : wire0) ?
              $unsigned((8'hbb)) : $unsigned((8'h9e))))));
          reg87 <= (-((-(^~$unsigned(reg63))) <= $signed(reg78)));
        end
      reg88 <= $signed(reg63[(3'h6):(1'h1)]);
    end
  assign wire89 = reg69[(4'he):(1'h0)];
  assign wire90 = $signed($signed(reg83[(4'he):(4'hc)]));
  assign wire91 = $signed(reg79[(1'h0):(1'h0)]);
  assign wire92 = (wire62[(2'h2):(2'h2)] ?
                      {$signed(($signed(reg76) ?
                              $signed(reg70) : reg67))} : wire89[(2'h2):(1'h1)]);
endmodule

module module6
#(parameter param51 = (~^(~|((|{(8'ha5)}) | (|((7'h43) - (7'h44)))))), 
parameter param52 = ((({(param51 ? param51 : param51)} > {(&param51)}) ? param51 : (^~param51)) ? ((~&((!param51) >>> (!param51))) ? param51 : ({param51} ~^ param51)) : param51))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire46;
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire12,
                 wire13,
                 wire14,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire46,
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
                 reg26,
                 reg27,
                 (1'h0)};
  assign wire12 = ($unsigned($unsigned((~&(wire11 & wire7)))) ^ $unsigned((((wire8 > wire11) ?
                      $unsigned(wire8) : (wire11 == wire7)) >>> (+wire9[(3'h5):(1'h0)]))));
  assign wire13 = $unsigned($unsigned({(8'hb1), $unsigned((8'haa))}));
  assign wire14 = (8'h9d);
  always
    @(posedge clk) begin
      if ($unsigned(wire11))
        begin
          reg15 <= (-(~&wire13[(5'h12):(5'h11)]));
          if ((+(($unsigned((wire8 || wire9)) ?
              $signed({wire12, wire7}) : (-wire10)) >>> (((~|wire11) ?
              {wire11, wire8} : (wire7 ?
                  wire14 : (8'h9f))) || wire14[(1'h1):(1'h0)]))))
            begin
              reg16 <= $signed(((+$signed(wire10[(2'h3):(1'h1)])) << wire8[(5'h10):(1'h1)]));
              reg17 <= wire8[(5'h11):(5'h11)];
              reg18 <= (reg17 ?
                  (~&$unsigned($unsigned((wire11 <<< (7'h44))))) : wire11[(3'h6):(1'h0)]);
              reg19 <= $signed($unsigned(((^~wire9) >= reg18[(5'h10):(1'h0)])));
            end
          else
            begin
              reg16 <= reg16;
              reg17 <= wire11[(5'h12):(3'h4)];
              reg18 <= $signed(wire12);
            end
          reg20 <= reg17[(4'h8):(3'h4)];
        end
      else
        begin
          reg15 <= reg15;
          reg16 <= (($unsigned(reg18[(5'h12):(1'h0)]) < $signed(reg19[(2'h2):(1'h0)])) >>> (((^~(reg17 ~^ wire10)) ?
              $signed((reg19 < wire13)) : ((wire10 >>> (8'hb1)) < wire11)) ^~ (wire7[(4'h8):(3'h4)] ?
              $unsigned($signed(wire11)) : (wire13[(3'h7):(1'h1)] <= $signed(wire9)))));
          reg17 <= ($signed((($unsigned(reg15) << wire9) | $signed((reg17 ?
              reg15 : (8'hbe))))) <= (8'hb4));
        end
      if (reg16[(4'hd):(1'h0)])
        begin
          reg21 <= (~^(reg16[(3'h6):(2'h2)] ?
              wire11 : {(reg18 + $unsigned(wire10)), wire9[(4'h8):(3'h6)]}));
          reg22 <= $signed((wire7 >= ((~&(wire9 < reg15)) ?
              reg16[(2'h2):(2'h2)] : $unsigned((wire14 ? wire12 : wire10)))));
          if (($signed((~(^~$signed(wire13)))) >= ((reg17[(1'h0):(1'h0)] ~^ $unsigned((reg18 && wire14))) << $unsigned(wire10))))
            begin
              reg23 <= wire12[(4'hb):(1'h0)];
              reg24 <= $signed(wire11);
              reg25 <= (~($signed(wire12) ^~ wire14));
              reg26 <= reg20;
            end
          else
            begin
              reg23 <= ($signed((|(+(wire8 ? (8'hbf) : reg16)))) ?
                  ((~(8'hbb)) ?
                      (8'had) : (wire13 ?
                          (-(!wire13)) : ((reg16 + wire7) > (reg18 ?
                              reg18 : wire10)))) : wire12[(3'h7):(1'h1)]);
              reg24 <= reg18;
            end
        end
      else
        begin
          reg21 <= (reg18[(3'h5):(2'h3)] ^~ (8'ha7));
        end
      reg27 <= $unsigned(reg21);
    end
  assign wire28 = (-reg20[(3'h5):(2'h3)]);
  assign wire29 = wire12;
  assign wire30 = $signed($signed($unsigned(reg27)));
  assign wire31 = (({reg26[(3'h7):(3'h5)]} ~^ reg24[(2'h2):(1'h1)]) != $unsigned($unsigned({reg26[(2'h3):(1'h0)],
                      ((8'h9d) ? reg22 : reg24)})));
  module32 #() modinst47 (.wire35(reg18), .wire33(wire30), .wire36(wire8), .clk(clk), .y(wire46), .wire34(wire28));
  assign wire48 = ($unsigned(reg19) >= (reg19[(3'h5):(1'h0)] ?
                      (((~^reg22) == (wire13 ? (8'hb5) : wire29)) ?
                          (~&(reg24 ^ wire29)) : (+(reg25 > (8'hb0)))) : wire46));
  assign wire49 = (~($unsigned($signed((wire48 < wire12))) | wire46[(1'h1):(1'h1)]));
  assign wire50 = {{wire7[(4'h8):(1'h1)]}, wire12[(4'h8):(3'h6)]};
endmodule

module module32
#(parameter param45 = (({(((8'ha7) - (8'ha5)) << (8'hb5))} ? (8'h9e) : (((&(8'hbf)) ? (~&(8'h9c)) : ((8'ha1) << (8'h9e))) < ((&(8'hb1)) <= (~(8'hbc))))) ? (^(8'haf)) : ({(((8'hbc) && (8'haf)) << ((8'hbf) ? (8'haf) : (8'hb8)))} ? ((((8'hba) != (8'hb8)) ? ((8'hb0) ? (8'hae) : (8'ha0)) : ((8'hb1) < (8'hba))) != {((8'hab) ^~ (7'h41))}) : {{(|(8'hb3)), ((7'h41) ? (7'h42) : (8'ha7))}, (~&(!(8'ha6)))})))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire36;
  input wire [(3'h4):(1'h0)] wire35;
  input wire signed [(3'h6):(1'h0)] wire34;
  input wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 reg40,
                 (1'h0)};
  assign wire37 = (8'h9c);
  assign wire38 = wire35[(2'h2):(1'h1)];
  assign wire39 = wire33;
  always
    @(posedge clk) begin
      reg40 <= wire36;
    end
  assign wire41 = wire36;
  assign wire42 = $unsigned(wire33[(3'h4):(2'h2)]);
  assign wire43 = wire34;
  assign wire44 = {(wire37[(3'h6):(2'h3)] <<< ($unsigned((wire33 ?
                          wire42 : (7'h43))) | ((wire36 ? (8'hb9) : wire38) ?
                          (wire38 ? wire33 : wire34) : {wire38}))),
                      wire34[(1'h1):(1'h0)]};
endmodule
