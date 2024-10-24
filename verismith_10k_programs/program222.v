module top
#(parameter param43 = (-((((^~(8'hb6)) & ((8'hbd) ? (8'hb8) : (7'h44))) >> (8'hbe)) ~^ ((((8'hac) && (7'h43)) ? {(8'ha7), (8'haa)} : {(8'h9e), (8'haf)}) ? ((8'had) ? ((8'ha9) ? (8'hb3) : (8'hbe)) : ((8'ha7) ? (8'ha5) : (7'h41))) : ((7'h42) ? ((7'h40) >>> (7'h43)) : (~^(8'hbf)))))), 
parameter param44 = (|(8'ha6)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire41, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {wire0, (7'h41)};
  assign wire5 = wire4[(4'ha):(1'h0)];
  assign wire6 = wire2;
  assign wire7 = wire3;
  module8 #() modinst42 (wire41, clk, wire4, wire0, wire6, wire5);
endmodule

module module8
#(parameter param39 = (~(~&((((8'h9d) ? (8'hac) : (8'hab)) ~^ ((8'hbb) + (8'hb5))) ? ({(7'h41), (8'hb6)} ^~ ((8'hac) ? (8'ha7) : (7'h42))) : (((8'hbc) ? (8'haf) : (8'ha1)) ? ((8'hb1) <<< (8'hb6)) : {(8'ha8)})))), 
parameter param40 = param39)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire38,
                 wire19,
                 wire14,
                 wire13,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = ($signed({wire9[(1'h0):(1'h0)]}) != (!{{(8'hae),
                          {wire12, wire10}}}));
  assign wire14 = {$unsigned((((wire10 ? wire13 : wire12) * (wire10 ^ wire13)) ?
                          ((wire9 ?
                              (8'hbf) : wire12) + (wire10 ^ wire9)) : wire10[(1'h0):(1'h0)])),
                      wire13};
  always
    @(posedge clk) begin
      reg15 <= ((~^$unsigned($unsigned(wire14))) ?
          (~|wire13) : ((((wire11 ? (8'ha8) : wire12) ?
              $unsigned(wire14) : (wire13 ?
                  wire13 : wire14)) > wire14) <= (8'ha4)));
      reg16 <= {wire12};
      reg17 <= (+(^wire10[(1'h1):(1'h0)]));
      reg18 <= $unsigned((($unsigned((wire12 ? wire12 : wire9)) ?
              {reg15} : $signed($unsigned(wire10))) ?
          (^~(7'h44)) : (~{(wire13 ? (7'h40) : wire9)})));
    end
  assign wire19 = {$unsigned((~&$unsigned(reg15))),
                      $unsigned({(|(8'hbb)), wire11})};
  always
    @(posedge clk) begin
      if (wire11[(2'h3):(2'h2)])
        begin
          reg20 <= (-reg17[(1'h0):(1'h0)]);
          reg21 <= ((&$unsigned($signed(((8'ha7) >>> wire13)))) ?
              ($unsigned($unsigned($unsigned(reg18))) > reg18[(2'h2):(2'h2)]) : $signed((+reg16[(4'h8):(2'h2)])));
          if (((-(~|reg15)) >>> (~&wire10[(1'h1):(1'h1)])))
            begin
              reg22 <= $unsigned($signed(wire14));
              reg23 <= reg20;
              reg24 <= {(wire11 ?
                      ((~|wire11) <<< reg21[(4'h8):(2'h3)]) : (^~{reg17}))};
              reg25 <= ((~^(^~$signed($unsigned(wire19)))) ?
                  ((!$unsigned($signed(reg23))) ?
                      reg22 : (reg22[(3'h6):(3'h5)] ?
                          wire13 : $signed({reg15}))) : ($unsigned(reg15) ?
                      reg21[(4'he):(3'h6)] : wire12[(2'h2):(1'h0)]));
            end
          else
            begin
              reg22 <= $signed(((((reg21 ? wire9 : reg24) ^ (~reg23)) ?
                  (wire19[(5'h11):(5'h10)] ^ reg16[(4'hb):(3'h5)]) : ((reg25 ?
                      wire19 : (8'hbb)) && reg25)) < (reg16 ^~ reg23[(1'h1):(1'h1)])));
              reg23 <= reg22[(1'h1):(1'h1)];
              reg24 <= (((8'hb4) ?
                      (wire19[(5'h11):(4'hb)] <<< reg22[(4'hb):(4'hb)]) : (~&($unsigned(reg21) >= $signed((8'ha6))))) ?
                  ((7'h43) > ($unsigned(reg17[(1'h0):(1'h0)]) ?
                      (^~(&wire9)) : $signed((reg24 ?
                          reg23 : reg18)))) : reg16);
              reg25 <= (reg23[(2'h2):(1'h0)] ?
                  (~$unsigned((+(reg16 ?
                      wire13 : reg25)))) : wire14[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg20 <= wire10[(1'h0):(1'h0)];
          reg21 <= $unsigned((+($unsigned($unsigned(wire9)) > reg21)));
          if ((reg15[(4'h8):(3'h7)] ?
              $signed($unsigned(wire11)) : (&$signed(($unsigned(wire12) ?
                  $unsigned(reg15) : $unsigned(reg16))))))
            begin
              reg22 <= {((~^$unsigned(wire19[(5'h12):(3'h5)])) || (reg21 - reg22))};
              reg23 <= $signed(reg17);
              reg24 <= {reg18, wire12[(2'h2):(1'h0)]};
              reg25 <= wire14;
            end
          else
            begin
              reg22 <= reg25[(5'h12):(1'h0)];
              reg23 <= reg20;
              reg24 <= wire12[(4'hc):(1'h0)];
              reg25 <= {$unsigned($signed(wire14[(2'h3):(1'h0)]))};
            end
          reg26 <= $signed((8'haa));
          if ($signed(($unsigned(reg18) ?
              reg24 : (($unsigned(wire9) ? ((8'hbe) ? wire11 : reg24) : reg16) ?
                  $signed((reg21 * wire13)) : (8'h9d)))))
            begin
              reg27 <= $unsigned((($unsigned((reg24 ? reg18 : (7'h41))) ?
                      (~^$signed(reg26)) : (wire13 - $signed(wire14))) ?
                  reg22 : (~^reg17[(3'h5):(1'h0)])));
            end
          else
            begin
              reg27 <= reg16[(3'h5):(2'h2)];
            end
        end
      reg28 <= {{reg22[(4'h8):(1'h0)]}};
      if ($unsigned(wire12))
        begin
          reg29 <= ($signed(($signed((8'ha6)) || wire14[(4'h9):(1'h1)])) || (8'hb4));
          reg30 <= $signed((~|((|reg20) >= wire10)));
          reg31 <= $unsigned(reg28[(3'h4):(1'h1)]);
        end
      else
        begin
          reg29 <= $unsigned(reg21[(5'h13):(2'h3)]);
          if (wire14[(3'h5):(3'h5)])
            begin
              reg30 <= {$unsigned({$unsigned((reg28 && reg25)),
                      ($unsigned(wire12) * reg20)})};
            end
          else
            begin
              reg30 <= (8'ha8);
            end
          reg31 <= reg25[(2'h3):(2'h3)];
        end
      reg32 <= (&wire9);
    end
  always
    @(posedge clk) begin
      reg33 <= wire12[(3'h7):(3'h6)];
      reg34 <= $unsigned((^~wire19));
      reg35 <= ((($signed($signed(reg22)) ? wire14[(3'h4):(1'h1)] : reg23) ?
              $signed(reg20[(1'h1):(1'h0)]) : reg20) ?
          ({reg26, ((^~(8'hae)) != $signed(reg34))} == (reg23[(3'h4):(1'h0)] ?
              $signed((reg24 * wire10)) : {$signed(reg18)})) : ($signed(wire10) >> ($unsigned((-reg23)) ?
              (~^reg33) : $signed($unsigned(wire14)))));
      reg36 <= $unsigned(({($unsigned(reg26) ? wire14[(4'hc):(1'h1)] : reg22),
          wire12} ^ (wire19 != ((wire19 ? (8'hb4) : reg18) ?
          (^~reg20) : ((8'h9f) ~^ (8'haa))))));
      reg37 <= reg18;
    end
  assign wire38 = (~$unsigned(reg16[(5'h15):(3'h5)]));
endmodule
