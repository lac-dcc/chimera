module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire40;
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire40,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 (1'h0)};
  module4 #() modinst41 (.wire7(wire1), .wire9(wire2), .wire6(wire0), .y(wire40), .wire8(wire3), .clk(clk), .wire5((8'ha8)));
  always
    @(posedge clk) begin
      reg42 <= (^{$signed($unsigned((wire1 & (7'h41))))});
      reg43 <= (wire40[(4'h9):(3'h5)] < ($signed((~{wire0, wire3})) ?
          ((^~((8'hb9) ? wire3 : wire3)) ?
              $signed(((8'hb8) ? wire1 : wire0)) : ({wire0} ?
                  (wire1 || wire40) : ((8'ha5) == wire1))) : $signed(({(8'ha6)} ?
              wire0[(4'ha):(3'h5)] : $unsigned(wire2)))));
      reg44 <= wire2;
      if ({reg42, wire40[(2'h2):(2'h2)]})
        begin
          reg45 <= (wire40 && wire1[(1'h0):(1'h0)]);
          reg46 <= $signed(wire40);
        end
      else
        begin
          if ($signed(((~&(~&$signed(wire3))) || {{(^~wire1)}, wire1})))
            begin
              reg45 <= $unsigned(wire2[(2'h2):(1'h0)]);
              reg46 <= wire2[(4'hb):(2'h3)];
              reg47 <= (((((wire3 ? wire40 : reg42) >= $signed((8'ha3))) ?
                      wire3 : reg46) > (^~$signed($unsigned(wire40)))) ?
                  $unsigned({(^~(wire0 ?
                          reg46 : wire40))}) : {(~&$unsigned($unsigned(wire40)))});
              reg48 <= {reg43};
              reg49 <= reg44;
            end
          else
            begin
              reg45 <= reg44;
              reg46 <= $unsigned((reg44[(1'h1):(1'h1)] >>> reg47));
              reg47 <= reg43[(3'h4):(1'h0)];
            end
          if (reg42)
            begin
              reg50 <= ({(^~$signed($unsigned(wire40))),
                      (~reg42[(4'h8):(2'h2)])} ?
                  wire3 : (8'h9c));
              reg51 <= $signed($signed($signed(wire2[(5'h10):(3'h6)])));
              reg52 <= ((~^((&$unsigned(reg51)) ?
                  ((reg44 ?
                      wire2 : wire40) <<< $signed(wire2)) : $signed($unsigned(reg50)))) << $signed(reg42));
              reg53 <= wire0[(2'h2):(1'h0)];
              reg54 <= $signed($unsigned((reg53[(3'h5):(1'h1)] | ((8'hbe) >> (^(8'hba))))));
            end
          else
            begin
              reg50 <= $signed(reg50);
            end
        end
      reg55 <= ((~|{(~^(~|reg48))}) ?
          reg47[(2'h2):(2'h2)] : {(reg53[(3'h5):(3'h5)] | wire3[(3'h7):(1'h1)]),
              (wire2[(5'h14):(4'hf)] ?
                  (|reg50[(3'h5):(3'h4)]) : (wire1[(4'h9):(3'h6)] ?
                      wire2 : {reg47}))});
    end
  always
    @(posedge clk) begin
      reg56 <= $signed(({reg54,
          ((reg54 ? reg50 : wire1) ?
              (~^reg53) : (|reg48))} >> {(+(reg50 & reg55))}));
      reg57 <= $signed((reg48[(3'h6):(3'h4)] >>> {(((8'hb5) ? reg47 : reg45) ?
              (~|reg53) : (&reg42))}));
      reg58 <= (~^(reg47 ^ reg52));
      if (($signed(reg44) <<< $unsigned((((reg45 > (7'h41)) ~^ ((8'had) - reg57)) ?
          ((-reg45) ?
              ((8'haf) * wire2) : (reg58 + reg56)) : $unsigned(((8'hab) || reg53))))))
        begin
          reg59 <= $signed(reg42[(4'ha):(3'h5)]);
        end
      else
        begin
          reg59 <= reg44;
          reg60 <= ($signed($signed((~&reg45))) ?
              $unsigned($unsigned(($signed(reg56) ?
                  $signed((8'hbf)) : $unsigned(reg42)))) : ({(^reg42),
                      (8'hb0)} ?
                  {(|(8'hbe))} : reg48));
        end
    end
  assign wire61 = {$unsigned(((reg53[(3'h5):(3'h5)] ?
                          reg46 : {reg44, wire1}) != (8'hb5)))};
  assign wire62 = wire40;
  assign wire63 = reg52;
  assign wire64 = ($signed(((^~$signed(reg50)) >= ({wire62} || {reg56}))) ?
                      (~^$unsigned((~&(wire0 & wire3)))) : reg55);
  assign wire65 = (^~(~reg46));
  assign wire66 = (8'hb6);
  assign wire67 = {(~$signed($unsigned((reg59 ? reg48 : reg43)))),
                      wire2[(5'h11):(4'hf)]};
  assign wire68 = $signed(reg55);
  assign wire69 = (~^((8'ha3) & reg51[(1'h1):(1'h1)]));
  assign wire70 = (wire40[(2'h3):(2'h2)] ? reg46 : (!reg56[(2'h3):(1'h1)]));
  assign wire71 = ((8'hb8) ?
                      (reg46 ?
                          $unsigned(((reg53 << wire69) ?
                              (reg51 ?
                                  reg42 : reg48) : $unsigned(reg45))) : $unsigned(wire68)) : (~|{wire62,
                          {$unsigned(reg42)}}));
  always
    @(posedge clk) begin
      reg72 <= wire40;
      reg73 <= (^$signed($unsigned(($unsigned(reg56) < {reg55, reg57}))));
      reg74 <= ($unsigned((wire63[(2'h2):(1'h0)] & wire1)) ?
          $unsigned((!$unsigned(reg54))) : reg56);
      reg75 <= {{$signed((|$unsigned(wire63)))}, wire71};
    end
  assign wire76 = (~|wire71[(4'h8):(3'h4)]);
  assign wire77 = reg53[(1'h0):(1'h0)];
  assign wire78 = (+(~($unsigned($signed(wire63)) >= (((8'hb5) < reg46) ?
                      (wire0 == reg57) : {wire70}))));
endmodule

module module4
#(parameter param38 = (|({(((8'ha8) ? (8'ha0) : (8'hb0)) ? (^~(7'h41)) : ((8'hbd) ? (7'h44) : (8'haf)))} ^ ((^~(!(7'h43))) - (((8'ha1) ? (8'haa) : (8'hbe)) != (~(8'ha5)))))), 
parameter param39 = (~param38))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire signed [(2'h2):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire26,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg37,
                 reg31,
                 reg30,
                 reg27,
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
                 (1'h0)};
  assign wire10 = ($signed(wire8[(4'h9):(3'h6)]) ?
                      wire6[(3'h4):(2'h3)] : (~^$signed(((wire5 || wire5) ?
                          (wire7 ? wire9 : wire7) : (wire7 >= wire6)))));
  assign wire11 = ($unsigned(wire9) | (+(!wire5[(2'h2):(1'h1)])));
  assign wire12 = ((((8'hb7) ?
                      wire5[(2'h2):(2'h2)] : ((wire10 * wire8) >>> (wire6 ?
                          wire6 : wire11))) | wire11) >= $signed({$signed((wire6 ^ wire9))}));
  assign wire13 = $unsigned($unsigned((^(wire11 ?
                      (wire6 != wire10) : {wire5}))));
  assign wire14 = $unsigned((8'hb8));
  assign wire15 = (({(-{wire14}), {(wire9 <<< wire13)}} ?
                      (8'haf) : $unsigned($signed({wire10,
                          wire6}))) - ($unsigned((wire10[(4'ha):(4'h9)] >> $signed((8'ha5)))) ^~ (((wire6 ?
                              (7'h41) : (7'h40)) ?
                          $signed(wire6) : (^~wire9)) ?
                      (wire12[(4'h9):(4'h9)] ?
                          (8'hbe) : {wire7}) : wire5[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg16 <= (^~(wire14 ?
          (~$unsigned($signed(wire8))) : ((!{wire7}) ?
              (^((7'h42) ^ wire10)) : {wire12, $signed(wire12)})));
      reg17 <= (^{wire14[(2'h2):(2'h2)], wire10[(3'h7):(1'h0)]});
      if ((reg16 ?
          {(((wire8 ? reg16 : reg17) == (!(8'hae))) ? reg17 : (!wire5)),
              {$unsigned((^wire5))}} : $signed((-$signed(wire13[(4'ha):(4'ha)])))))
        begin
          reg18 <= (($unsigned({reg17}) ?
              $signed(reg16[(3'h4):(2'h3)]) : wire7[(4'h9):(2'h3)]) < $unsigned($unsigned(({reg16} * $signed(wire11)))));
          reg19 <= (~|wire5);
          if (wire14[(3'h4):(2'h3)])
            begin
              reg20 <= wire11[(2'h2):(1'h1)];
              reg21 <= reg16;
            end
          else
            begin
              reg20 <= $signed((8'hb3));
            end
          reg22 <= ((wire5[(1'h1):(1'h1)] || {((8'hbe) & $signed(wire11)),
              ((|wire6) ?
                  $unsigned(reg17) : $signed(reg16))}) >>> ($unsigned(wire15[(3'h5):(2'h3)]) ^ (~|$unsigned(wire14[(2'h3):(2'h2)]))));
          reg23 <= (($unsigned((&$signed(wire15))) | $unsigned(wire14[(1'h1):(1'h0)])) ?
              {reg21} : {reg20,
                  ($unsigned((wire9 == (8'hb1))) ?
                      wire10 : wire5[(2'h2):(1'h1)])});
        end
      else
        begin
          if ((+(($signed(wire11[(1'h1):(1'h1)]) & (wire14[(3'h5):(2'h2)] ?
                  wire8[(3'h4):(3'h4)] : (~^reg19))) ?
              (~{reg21}) : {((~^reg16) ?
                      wire5[(1'h1):(1'h1)] : (reg22 ? (8'ha6) : wire10)),
                  ((wire7 ? (8'ha0) : wire7) != $unsigned((8'hb2)))})))
            begin
              reg18 <= reg20;
            end
          else
            begin
              reg18 <= (8'ha9);
            end
          reg19 <= $signed($signed($unsigned((reg23 >>> $unsigned((8'hb7))))));
        end
    end
  always
    @(posedge clk) begin
      reg24 <= reg21[(3'h5):(1'h0)];
      reg25 <= reg21[(2'h2):(2'h2)];
    end
  assign wire26 = $signed($unsigned(wire5));
  always
    @(posedge clk) begin
      reg27 <= $signed(($signed($unsigned(wire15[(4'h9):(3'h7)])) <= (wire12[(4'h9):(2'h2)] >> $unsigned($unsigned((8'haf))))));
    end
  assign wire28 = $signed(wire13[(4'h8):(1'h0)]);
  assign wire29 = wire7;
  always
    @(posedge clk) begin
      reg30 <= (wire28 < $unsigned($unsigned(((~wire7) ?
          $unsigned(wire29) : wire10))));
      reg31 <= ((reg21 || reg21) ?
          wire12[(2'h3):(1'h0)] : {$signed($signed((~|wire11))),
              ($signed(reg18[(3'h6):(2'h3)]) * reg30)});
    end
  assign wire32 = $unsigned({$unsigned(((wire13 ?
                          reg31 : wire9) == $unsigned(reg30)))});
  assign wire33 = wire32;
  assign wire34 = $unsigned(reg17[(3'h4):(2'h3)]);
  assign wire35 = (8'ha1);
  assign wire36 = $signed($signed(wire34));
  always
    @(posedge clk) begin
      reg37 <= (wire15 >>> $signed((+reg22)));
    end
endmodule
