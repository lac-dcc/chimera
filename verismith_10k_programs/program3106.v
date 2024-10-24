module top
#(parameter param27 = {(((^~((8'ha5) == (8'hb9))) || (((8'ha8) >= (8'hbe)) ? (|(8'hb0)) : {(8'hbc)})) << (^~((~&(7'h41)) ~^ ((8'hb5) ^ (8'ha0))))), ((~|(~(^(8'h9e)))) * (+(((8'had) ? (8'hb4) : (8'hb6)) ? {(8'hbe)} : {(8'hbd), (8'hba)})))}, 
parameter param28 = ({(~param27), (~^((param27 >>> param27) ? param27 : (&param27)))} & (({(^(8'haf))} ? ((param27 ? param27 : param27) ? (param27 || param27) : (param27 ? (8'ha5) : param27)) : ((param27 ? param27 : param27) ? (!param27) : (param27 | param27))) ? (~^{param27}) : (((param27 || param27) > param27) ? (~&param27) : (~param27)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = ((~|($unsigned(wire1) - $signed($unsigned(wire0)))) ?
                     (~wire3) : (&((-wire4) ?
                         (^(wire4 <= (8'hbc))) : {$unsigned((8'haf))})));
  assign wire6 = ($unsigned($unsigned(wire5)) == (wire5[(2'h2):(2'h2)] || $unsigned((wire2 - (~wire4)))));
  assign wire7 = $signed((7'h44));
  assign wire8 = wire0;
  assign wire9 = $signed($unsigned({{wire0, wire8}}));
  assign wire10 = (8'hb8);
  assign wire11 = $signed(wire5[(5'h10):(4'h8)]);
  assign wire12 = $unsigned({wire6});
  always
    @(posedge clk) begin
      if ((~wire12))
        begin
          reg13 <= ((({(wire9 || wire12)} != ((wire4 ? wire10 : wire4) ?
                      wire7 : $unsigned(wire8))) ?
                  {wire1, (~|(~&wire1))} : $unsigned((8'hb3))) ?
              $unsigned(wire4) : wire1[(2'h3):(1'h1)]);
          reg14 <= (~&(($signed((8'h9d)) ?
              (!$unsigned(wire1)) : wire1[(2'h2):(1'h1)]) != wire7[(3'h7):(3'h5)]));
          reg15 <= (wire0 >> ($unsigned(($unsigned(wire7) < (~|wire9))) < wire1));
        end
      else
        begin
          reg13 <= ((7'h42) ?
              (|(((|wire5) ^ reg15[(3'h4):(3'h4)]) & $signed(reg15))) : $unsigned(wire2));
          reg14 <= wire2[(3'h7):(1'h0)];
          reg15 <= (~(wire9[(3'h5):(1'h1)] ^~ {((wire10 & reg15) ?
                  (reg15 > wire8) : ((8'ha6) ? wire0 : wire6)),
              ((wire8 ? wire1 : wire4) ? (-wire12) : $unsigned(reg14))}));
          reg16 <= {(^(wire10 + (8'ha3))),
              ($signed(reg15[(1'h1):(1'h0)]) ^~ wire4)};
        end
      reg17 <= (^{((&$unsigned(wire3)) ? reg13 : reg14[(1'h1):(1'h0)])});
    end
  assign wire18 = $signed(wire12);
  assign wire19 = $signed((reg16 << wire2[(5'h14):(3'h6)]));
  assign wire20 = (wire6 >> ((((wire11 ? reg14 : wire11) ?
                      (|wire0) : (!wire18)) && wire12) || $unsigned((+(8'hbb)))));
  assign wire21 = wire2;
  assign wire22 = (($signed(((8'ha5) ?
                          (~^wire20) : wire7)) << $unsigned(($signed(wire4) ?
                          (reg14 * wire5) : (reg13 ? (8'h9e) : reg16)))) ?
                      $signed((~(wire19 ?
                          (-wire5) : $unsigned(wire5)))) : (($unsigned(wire12[(1'h1):(1'h0)]) ?
                              $signed(wire5) : (8'ha1)) ?
                          {$signed((wire10 ^ reg17)),
                              wire21[(1'h0):(1'h0)]} : ((~(wire18 ?
                              wire4 : reg17)) * (~^wire1))));
  always
    @(posedge clk) begin
      reg23 <= (wire12 ?
          $signed(($signed((reg17 || wire6)) - reg15[(2'h2):(2'h2)])) : wire21[(4'h9):(3'h5)]);
      if ((({$unsigned((wire6 + wire0)),
          $signed({wire8,
              wire4})} ^ reg13[(4'h9):(2'h2)]) ~^ wire0[(5'h11):(4'h8)]))
        begin
          reg24 <= (wire5 ?
              $signed($unsigned(wire18[(4'hb):(1'h1)])) : (|(!reg14[(3'h6):(3'h6)])));
          reg25 <= reg14[(4'ha):(3'h7)];
        end
      else
        begin
          reg24 <= $unsigned(((($unsigned(wire3) ^ wire10[(1'h1):(1'h0)]) ~^ wire19) ?
              (({reg14} < {wire4}) ?
                  wire7 : wire19[(3'h7):(3'h7)]) : ((&((8'h9e) ?
                  wire1 : reg25)) - wire8)));
          reg25 <= ((($unsigned((wire18 + (8'hb4))) ?
                  ($signed(wire4) ?
                      reg25[(1'h0):(1'h0)] : (^~wire12)) : $signed((-(8'h9c)))) <<< reg14) ?
              (~wire11[(2'h3):(2'h3)]) : reg23);
        end
      reg26 <= (~{((reg17[(1'h1):(1'h0)] ?
              wire1[(4'h8):(2'h3)] : (!wire22)) - {(wire19 != wire7)})});
    end
endmodule
