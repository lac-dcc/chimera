module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  assign y = {wire66, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (!$signed(wire2[(1'h0):(1'h0)]));
  assign wire5 = $unsigned($signed((+$unsigned((^~wire2)))));
  assign wire6 = (8'hb7);
  assign wire7 = (!($signed(($signed(wire4) ^ (wire3 ? wire3 : wire6))) ?
                     wire3 : ((~(wire4 ^ wire5)) ?
                         (+wire4[(4'h9):(1'h0)]) : (8'hb1))));
  assign wire8 = ((~|$unsigned(((wire5 ? wire3 : wire6) ?
                         (wire4 == wire5) : (wire7 <= wire3)))) ?
                     wire4[(4'ha):(3'h6)] : $signed($signed($signed((wire6 ?
                         wire6 : wire5)))));
  module9 #() modinst67 (.clk(clk), .y(wire66), .wire10(wire1), .wire13(wire7), .wire12(wire4), .wire11(wire2));
endmodule

module module9
#(parameter param64 = ((7'h44) >>> ({((8'hb2) ? (~(8'hae)) : (|(8'hb1)))} ? (((~&(8'hb7)) ? ((8'h9d) ? (8'hb2) : (8'hbf)) : (~(8'hb0))) ? (((8'ha2) && (8'hb2)) ? (&(8'haa)) : (|(8'h9f))) : (((8'h9e) ? (8'hab) : (7'h40)) ? {(8'hb9), (7'h40)} : ((8'hb0) ? (8'ha8) : (7'h43)))) : ((((8'hbd) ? (8'h9e) : (7'h40)) ? (^(7'h44)) : (8'hb5)) ? ({(8'ha3), (8'ha8)} ? {(8'ha0), (8'h9e)} : (+(8'hb7))) : (((7'h40) != (8'ha3)) ? (8'hae) : (~(8'hbb)))))), 
parameter param65 = (param64 < ((+((param64 ? param64 : (8'ha0)) || {param64, (7'h42)})) & (|((8'hb7) >> (+param64))))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire13;
  input wire [(4'h9):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire14;
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire58,
                 wire57,
                 wire55,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire20,
                 wire14,
                 reg60,
                 reg59,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  assign wire14 = (wire10[(3'h7):(1'h0)] >= wire12);
  always
    @(posedge clk) begin
      reg15 <= ((^$unsigned($unsigned((!wire13)))) ?
          (wire14[(4'ha):(3'h4)] || $unsigned(wire11[(4'ha):(3'h7)])) : ($unsigned($unsigned(((8'ha3) | wire12))) && $unsigned(wire12[(3'h7):(2'h3)])));
      reg16 <= {(7'h43)};
      reg17 <= wire12[(4'h8):(1'h0)];
      reg18 <= (~wire10);
      reg19 <= (~|{$signed(((&wire12) >= $signed(wire10))), reg17});
    end
  assign wire20 = ($signed((-($unsigned(reg17) < $unsigned(reg17)))) ?
                      wire11 : {reg17[(3'h5):(2'h3)],
                          ($unsigned(wire12[(3'h5):(3'h4)]) ~^ ((wire12 << reg18) ?
                              (-reg19) : (8'hb9)))});
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned({(!reg16), wire10[(3'h4):(1'h0)]}))))
        begin
          if ($unsigned(reg19))
            begin
              reg21 <= $unsigned(reg18[(3'h7):(3'h5)]);
              reg22 <= (^~$unsigned($signed(reg19[(4'hd):(1'h1)])));
            end
          else
            begin
              reg21 <= ($signed((-reg16)) << (reg22[(3'h5):(1'h1)] ?
                  wire20 : ($unsigned((^reg18)) ?
                      (!$unsigned(reg21)) : $unsigned((reg18 ?
                          reg19 : (8'h9f))))));
              reg22 <= wire14[(4'h8):(2'h3)];
            end
        end
      else
        begin
          if ((((&$unsigned((wire11 | wire20))) ?
                  $unsigned((~^$signed((8'hb6)))) : (+$signed(reg15))) ?
              (8'ha2) : (wire14[(1'h1):(1'h0)] >> ($unsigned({(8'ha1)}) ?
                  (8'hae) : (8'haf)))))
            begin
              reg21 <= wire10;
              reg22 <= $signed(wire20[(2'h2):(1'h1)]);
              reg23 <= wire13[(2'h2):(1'h0)];
            end
          else
            begin
              reg21 <= {(|(reg18 >= wire20))};
              reg22 <= $unsigned($signed(wire12));
              reg23 <= $signed((8'hb3));
              reg24 <= {$signed({wire13[(3'h5):(3'h4)]}),
                  (^{wire10[(4'hd):(3'h5)],
                      ((wire11 >> reg18) ? (^reg16) : $signed(wire11))})};
            end
          reg25 <= $unsigned({wire10, $signed({((8'h9c) ^~ reg23)})});
          reg26 <= $signed((-(~|reg24[(5'h11):(1'h0)])));
          if (reg24[(4'he):(4'hb)])
            begin
              reg27 <= reg24;
              reg28 <= reg22[(4'hb):(3'h6)];
              reg29 <= reg22;
            end
          else
            begin
              reg27 <= (^((reg16[(1'h0):(1'h0)] ^ wire10[(3'h4):(1'h0)]) ~^ wire12[(1'h0):(1'h0)]));
              reg28 <= ($unsigned(($signed(wire13[(2'h2):(1'h1)]) ?
                  reg18 : (~^(|(8'h9d))))) ^ ({$signed(reg15[(3'h6):(3'h4)])} >= $unsigned($signed(reg25))));
              reg29 <= (($unsigned((8'ha5)) >>> reg22) ?
                  ($unsigned((reg21[(4'h8):(3'h7)] <<< reg21[(3'h7):(3'h5)])) - $unsigned(({wire11,
                      (8'h9c)} ^~ reg19))) : (~$signed({((8'hbd) <<< reg25)})));
              reg30 <= (~^$unsigned($signed({$signed(wire12)})));
            end
          reg31 <= ($unsigned(reg23[(1'h0):(1'h0)]) ?
              {(8'hb7), reg19[(4'hc):(3'h7)]} : (((reg15 ?
                      $unsigned(reg16) : $unsigned((8'hbb))) ?
                  reg28 : reg23) <= $unsigned((((8'hac) && reg19) ?
                  (reg25 ? reg30 : reg25) : reg27[(1'h0):(1'h0)]))));
        end
      reg32 <= $signed(wire13[(3'h4):(2'h3)]);
      reg33 <= reg19[(4'hc):(4'h8)];
    end
  assign wire34 = reg22;
  assign wire35 = (-$unsigned(((~^reg26) ?
                      ((^wire14) ?
                          (~^reg21) : reg28) : ($signed(reg26) <<< (!reg30)))));
  assign wire36 = reg15[(1'h1):(1'h0)];
  assign wire37 = reg29;
  assign wire38 = (8'hae);
  assign wire39 = $unsigned(reg31);
  assign wire40 = {$unsigned(reg24[(3'h5):(2'h2)]), wire20};
  assign wire41 = {$signed(($signed(reg21) > reg23[(2'h3):(2'h3)]))};
  assign wire42 = $signed((^~($unsigned((reg15 ?
                      wire20 : wire36)) >> $unsigned(((8'ha3) ~^ reg32)))));
  module43 #() modinst56 (wire55, clk, reg30, wire14, reg28, wire20, reg23);
  assign wire57 = reg28[(4'hd):(4'hc)];
  assign wire58 = wire36[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg59 <= (8'h9e);
      reg60 <= ((~&(({(8'ha4), (8'ha3)} ?
              $signed(reg15) : wire41[(2'h3):(1'h0)]) ~^ $signed(((8'hae) >> reg21)))) ?
          $unsigned(reg19[(4'h8):(3'h4)]) : reg28[(4'hd):(3'h5)]);
    end
  assign wire61 = $unsigned(reg23[(3'h4):(3'h4)]);
  assign wire62 = reg24;
  assign wire63 = (^~wire37);
endmodule

module module43
#(parameter param53 = (((|(-{(8'hac)})) * {{(^~(8'ha1))}, (|((8'hbb) ? (8'hab) : (8'ha8)))}) >> (~&(^({(8'hb6)} >>> (-(8'hbb)))))), 
parameter param54 = (&(~|((param53 >> (param53 ? param53 : (7'h42))) ? ((-(8'h9e)) == {param53, (8'hb9)}) : {(param53 ? (8'hb8) : (8'h9d)), (&param53)}))))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire48;
  input wire [(5'h15):(1'h0)] wire47;
  input wire [(5'h10):(1'h0)] wire46;
  input wire [(4'ha):(1'h0)] wire45;
  input wire signed [(3'h7):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  assign y = {wire52, wire51, wire50, wire49, (1'h0)};
  assign wire49 = (-wire48);
  assign wire50 = {$signed($unsigned(wire48)),
                      $unsigned($signed(wire47[(2'h3):(1'h0)]))};
  assign wire51 = $signed(wire47[(3'h7):(2'h3)]);
  assign wire52 = {((|$signed(((8'hb5) ? wire51 : wire50))) ?
                          wire50[(4'hc):(3'h5)] : ($unsigned(wire45) < (7'h42)))};
endmodule
