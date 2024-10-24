module top
#(parameter param53 = (({(^~(&(8'hb8)))} ? (8'hbe) : ((((8'ha8) * (8'ha9)) ? ((8'hac) ? (8'h9d) : (8'hb6)) : (!(8'hae))) ? (((8'h9c) * (8'hbe)) != ((7'h41) << (8'hab))) : (((8'ha2) ? (8'ha0) : (8'hb5)) > {(8'h9c), (8'ha0)}))) ? ({(-((8'h9d) + (8'hb0))), (((7'h40) ? (8'ha1) : (8'hb0)) <<< ((8'ha1) ? (8'hbc) : (7'h40)))} ? (^(((7'h42) ? (8'hab) : (8'ha9)) ? ((8'hbb) & (8'haf)) : ((8'ha8) ? (8'ha9) : (8'hbe)))) : {(8'ha8), (^((8'ha3) >>> (8'hb7)))}) : {{((~&(8'hae)) ? ((8'hb6) ? (8'hab) : (8'hb3)) : (8'hb7)), ((~(8'hbe)) ? ((8'ha9) ? (8'ha5) : (8'ha9)) : ((8'hb3) ? (8'ha0) : (8'ha9)))}, (8'haf)}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire42;
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire5,
                 wire42,
                 (1'h0)};
  assign wire5 = (&wire2);
  module6 #() modinst43 (wire42, clk, wire2, wire1, wire5, wire3, wire4);
  assign wire44 = ($unsigned((wire1 * wire42[(1'h0):(1'h0)])) ?
                      {wire5[(2'h3):(2'h2)], (8'had)} : (wire0 && wire0));
  assign wire45 = (wire2 - $signed((((wire4 && wire2) <<< wire2) * (8'h9d))));
  assign wire46 = ({($unsigned($unsigned((8'h9c))) ?
                              (+(wire44 ?
                                  wire2 : wire44)) : (wire2 << (^wire0)))} ?
                      (-wire45) : $signed($unsigned((wire42[(3'h6):(3'h6)] ?
                          (+wire44) : (&wire42)))));
  assign wire47 = ($unsigned($unsigned((wire0[(2'h3):(1'h1)] - ((8'hbe) ^ wire5)))) ?
                      $signed($signed(((wire42 ? wire3 : (8'hb3)) | (wire1 ?
                          wire3 : wire0)))) : wire42[(2'h2):(2'h2)]);
  assign wire48 = (((((wire47 ? wire47 : wire47) ~^ {wire46,
                      wire0}) <= {$signed(wire5),
                      wire0}) >> $unsigned($unsigned((^~wire0)))) < (+(wire42[(1'h1):(1'h0)] && ($signed(wire5) ?
                      $signed((8'hae)) : {wire3}))));
  assign wire49 = ($signed(wire45[(3'h4):(1'h0)]) ?
                      $signed(wire1) : $signed($signed($unsigned($signed(wire44)))));
  assign wire50 = ($unsigned((8'ha9)) ?
                      (wire42 >> (wire44[(2'h2):(2'h2)] ~^ (((7'h41) || wire1) ?
                          {wire46,
                              (8'ha8)} : wire46[(3'h4):(2'h2)]))) : {(((!(8'ha0)) >>> {wire1}) * wire46),
                          ((wire0[(4'h8):(3'h6)] <<< $unsigned(wire47)) ?
                              wire4[(4'hf):(3'h5)] : $unsigned((8'ha5)))});
  assign wire51 = (((wire44[(1'h1):(1'h1)] ?
                      ($signed(wire46) ?
                          (&wire0) : wire0[(4'ha):(4'h8)]) : (!(wire48 ?
                          wire2 : wire42))) < (wire46 ?
                      (~&{wire3}) : {wire0[(4'h8):(1'h0)]})) > $signed((~{(+wire49)})));
  assign wire52 = $signed({wire49[(2'h3):(2'h2)],
                      $unsigned({wire5[(4'he):(4'h9)], (wire2 && wire1)})});
endmodule

module module6
#(parameter param40 = {(((|{(8'hb4), (8'hab)}) ? ({(8'hb6)} != ((8'had) ? (8'hbb) : (8'h9d))) : (((8'hb6) ? (8'hb8) : (8'had)) >> {(7'h43)})) ? ((|((8'ha1) >> (8'hb2))) ^~ (((8'hb7) ? (8'ha3) : (8'h9c)) <<< ((7'h40) || (7'h42)))) : (&(((8'ha8) ? (8'hb7) : (8'hb1)) ? ((8'hbf) ? (8'hac) : (7'h42)) : ((8'hbd) > (8'hba)))))}, 
parameter param41 = (({(~^(8'had)), (~^(param40 + param40))} ^~ (^{param40, (!(8'hbd))})) * {((param40 == (param40 ? param40 : param40)) || ((param40 ? (8'hbe) : param40) != (param40 ? param40 : param40)))}))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire27,
                 wire13,
                 wire12,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire12 = wire11;
  assign wire13 = wire9;
  always
    @(posedge clk) begin
      reg14 <= $signed(((wire10 ^~ $unsigned(wire12)) ?
          (((wire13 <= wire8) > (&wire13)) <<< wire13) : (~&($signed((8'hbd)) ?
              wire11 : (~|(7'h42))))));
    end
  always
    @(posedge clk) begin
      reg15 <= wire9[(1'h1):(1'h1)];
      if ({(^~(&$unsigned(wire11[(1'h0):(1'h0)])))})
        begin
          reg16 <= {(wire12 << $unsigned((~^(!wire7))))};
          reg17 <= wire7[(2'h3):(2'h3)];
          reg18 <= (((($unsigned(wire7) ?
                  reg14[(4'hb):(4'h8)] : $signed((8'hab))) >>> (wire10[(1'h1):(1'h0)] ?
                  $signed((8'hbd)) : ((8'hbd) ? wire7 : reg14))) ?
              (reg15[(1'h1):(1'h1)] != (reg14 < $signed(wire7))) : reg15) - $signed((|$unsigned($signed(wire12)))));
          reg19 <= $signed(((~^{(8'hae),
              wire13[(2'h3):(1'h1)]}) > (($unsigned(wire13) >>> (reg18 ?
                  (8'h9e) : wire8)) ?
              {reg16} : (wire12 ? {wire12} : (^wire12)))));
        end
      else
        begin
          reg16 <= wire13[(2'h3):(2'h2)];
          reg17 <= $signed({reg15, $signed($unsigned($unsigned(reg14)))});
          reg18 <= {(8'ha8), (+reg15)};
          reg19 <= (~|wire8[(3'h6):(1'h1)]);
        end
      if (reg14[(5'h10):(4'he)])
        begin
          reg20 <= reg19[(3'h5):(1'h0)];
        end
      else
        begin
          if ((wire10[(2'h3):(1'h1)] ?
              $unsigned(({(wire7 ? wire12 : (8'h9f)),
                  ((8'h9d) - wire12)} ^ $unsigned((wire8 <= reg16)))) : $unsigned(wire7[(4'hd):(4'ha)])))
            begin
              reg20 <= ($unsigned((wire10[(3'h6):(1'h1)] ?
                  (!(reg16 >> wire7)) : {(~&reg20)})) == reg15);
            end
          else
            begin
              reg20 <= (((+$unsigned($signed(reg18))) <= wire13) ?
                  $signed($unsigned(wire7[(5'h10):(3'h7)])) : wire12[(1'h1):(1'h1)]);
              reg21 <= ($unsigned($unsigned(wire7)) ?
                  $unsigned($signed({reg19})) : $unsigned(reg14));
              reg22 <= ($unsigned(({((7'h43) ?
                          wire11 : reg18)} | ($unsigned(wire9) ?
                      (reg20 & wire10) : {wire7}))) ?
                  {(($unsigned(wire8) ^ $signed(reg19)) ?
                          (-(+wire10)) : {(&reg18), reg15[(4'ha):(1'h0)]}),
                      (~(wire11[(1'h0):(1'h0)] < (8'ha0)))} : (~&(((wire13 == reg15) ^ {reg14,
                      reg15}) & $signed($unsigned(reg14)))));
              reg23 <= (&wire13[(3'h7):(1'h1)]);
            end
          reg24 <= wire8[(1'h1):(1'h1)];
          reg25 <= {(~&(wire10[(1'h0):(1'h0)] <= $unsigned($signed(wire7))))};
        end
      reg26 <= (~&$unsigned((&(^reg20))));
    end
  assign wire27 = $signed(((+(wire10[(1'h1):(1'h0)] && $signed(wire7))) ?
                      (~&$signed(wire9[(3'h4):(2'h2)])) : (~|((reg14 ?
                          wire11 : reg26) * (8'h9d)))));
  always
    @(posedge clk) begin
      reg28 <= ($unsigned(((&(wire13 + reg20)) - (reg22[(3'h7):(3'h6)] ?
          (reg14 ? reg23 : reg23) : {reg16}))) + ((reg17 <= reg25) ?
          ($signed(reg26[(4'he):(4'hb)]) >= $unsigned($signed(reg14))) : ($unsigned($signed(reg16)) ?
              (wire12 ?
                  wire12 : ((8'hab) ?
                      reg14 : reg16)) : $unsigned(reg24[(5'h11):(3'h7)]))));
      if (wire11[(1'h1):(1'h0)])
        begin
          reg29 <= reg23[(2'h2):(1'h0)];
          reg30 <= reg25[(2'h3):(1'h0)];
          reg31 <= ((+$signed(reg23[(2'h2):(2'h2)])) ^ reg15);
          reg32 <= $signed(reg30);
        end
      else
        begin
          reg29 <= wire10[(4'ha):(1'h0)];
        end
      reg33 <= reg19[(3'h4):(2'h2)];
      reg34 <= reg23[(1'h0):(1'h0)];
      reg35 <= $unsigned((wire9[(2'h3):(1'h0)] ^~ reg18[(4'h9):(3'h7)]));
    end
  assign wire36 = {$unsigned(reg33[(4'h9):(3'h4)]), {reg33[(4'hd):(4'hc)]}};
  assign wire37 = $signed(((reg30[(1'h0):(1'h0)] <= ($signed(reg25) >> {reg33})) ~^ ($signed((&reg31)) - wire7[(1'h1):(1'h0)])));
  assign wire38 = (((^~($signed(reg22) > {reg17})) || $unsigned(reg24)) != $unsigned(reg20));
  assign wire39 = (-($unsigned((reg32 >= (~&(8'hb9)))) ?
                      $unsigned($unsigned(wire36)) : (((wire13 ?
                          reg18 : wire27) ^ reg25[(3'h4):(2'h2)]) >>> {{reg25},
                          (~^reg14)})));
endmodule
