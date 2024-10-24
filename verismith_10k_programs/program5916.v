module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire69;
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  assign y = {wire74, wire73, wire5, wire6, wire69, reg72, reg71, (1'h0)};
  assign wire5 = wire3[(3'h7):(1'h0)];
  assign wire6 = {$signed($signed(wire2))};
  module7 #() modinst70 (wire69, clk, wire2, wire0, wire6, wire4, wire3);
  always
    @(posedge clk) begin
      reg71 <= $unsigned(wire3);
      reg72 <= ($unsigned(wire3[(3'h4):(1'h1)]) ?
          ($unsigned(wire6) ?
              {(wire6 ?
                      (wire1 ? (8'hb1) : (8'h9d)) : ((8'ha3) ?
                          wire1 : wire0))} : $unsigned(wire69)) : (!{wire69}));
    end
  assign wire73 = (~&(($signed((wire3 ? wire3 : (8'ha9))) ?
                      $unsigned(wire4) : (!(wire4 ?
                          (8'had) : wire5))) + (~|((8'haa) ?
                      wire1 : (7'h43)))));
  assign wire74 = ((wire69 ?
                      ($unsigned(((8'ha3) ?
                          wire0 : wire69)) | (8'h9d)) : (~^(~|(wire4 >>> wire6)))) == reg72[(1'h0):(1'h0)]);
endmodule

module module7
#(parameter param67 = {((((~&(8'hac)) ? {(7'h40)} : ((8'haf) * (8'haa))) ? (((8'hb6) + (8'hbd)) >>> ((8'hab) ? (8'hb1) : (8'hbb))) : ((~(8'haf)) >>> (&(8'ha6)))) ? {(((8'ha1) & (7'h43)) ? (~(8'hbd)) : (|(8'hb5)))} : (((+(8'hbd)) >> ((8'h9e) ^~ (8'hbb))) + {((8'hbc) ? (8'hb0) : (8'hb0)), ((8'hb5) && (8'hbd))})), (((((8'hac) & (8'ha8)) + {(8'hab), (8'hbd)}) >>> (8'h9c)) ? (+(&(^(8'ha9)))) : ((((8'h9e) < (8'hb2)) ? ((8'hb1) ? (7'h43) : (8'ha8)) : ((8'ha3) ? (8'hb4) : (8'ha8))) ^ ((&(7'h44)) * (8'hb8))))}, 
parameter param68 = param67)
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire33,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 reg19,
                 (1'h0)};
  assign wire13 = (+{wire9[(1'h0):(1'h0)]});
  assign wire14 = $unsigned(wire10[(1'h0):(1'h0)]);
  assign wire15 = {((^$signed({wire14, (8'hb7)})) == wire14[(2'h2):(2'h2)]),
                      ((~wire10) > $unsigned(((^~wire13) ^ wire11[(4'hb):(4'ha)])))};
  assign wire16 = (wire15[(1'h0):(1'h0)] ?
                      wire10[(2'h3):(1'h0)] : (wire10 - wire15[(2'h2):(1'h1)]));
  assign wire17 = ($unsigned($unsigned({{wire16}})) ?
                      wire11[(1'h1):(1'h1)] : (wire8[(3'h7):(3'h4)] > $signed((7'h40))));
  assign wire18 = $signed(($signed((wire11 > {wire9,
                      wire10})) | wire15[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg19 <= wire17[(4'hb):(3'h6)];
      reg20 <= wire12;
      if ((wire14[(1'h0):(1'h0)] == wire11[(3'h4):(2'h3)]))
        begin
          if (wire13[(4'ha):(1'h0)])
            begin
              reg21 <= ((~^reg19[(1'h1):(1'h0)]) > $unsigned($signed($signed({wire9,
                  wire14}))));
              reg22 <= $signed(wire8);
              reg23 <= {reg22[(1'h0):(1'h0)], wire10[(4'hc):(1'h1)]};
              reg24 <= $unsigned($signed(($signed(wire9) ?
                  wire8 : (|wire9[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg21 <= (wire18 ? reg19[(3'h4):(2'h2)] : $unsigned(wire14));
            end
          reg25 <= wire10[(5'h10):(4'hf)];
          reg26 <= $unsigned((($signed(reg23) <= {(wire10 >= wire15),
              reg19}) * $signed(reg20)));
        end
      else
        begin
          reg21 <= (~|(wire18[(1'h1):(1'h1)] ?
              {(&wire16[(2'h2):(2'h2)])} : {wire15[(3'h5):(2'h2)]}));
          reg22 <= wire12;
          reg23 <= (($unsigned(reg26[(4'hb):(3'h6)]) + wire12[(3'h6):(3'h4)]) ?
              $signed(reg26) : ((!$signed((wire15 | (8'ha6)))) ^ (((wire17 * (8'hb2)) ?
                      reg20 : {reg26}) ?
                  $unsigned($unsigned((8'hb7))) : {$signed(wire15)})));
        end
      if (($signed($signed(wire18)) ?
          (wire16 && $signed($unsigned(((8'ha2) <= wire16)))) : ($signed($signed((|reg23))) <<< wire18)))
        begin
          reg27 <= $signed($unsigned($unsigned(((wire18 >= wire16) >= {wire16}))));
          reg28 <= $signed($unsigned($signed((reg23 || reg21))));
          reg29 <= (reg26[(3'h5):(3'h4)] <= (&$signed(({(8'hab),
              wire9} * (reg20 ^~ reg24)))));
          reg30 <= $signed(wire10[(4'ha):(1'h0)]);
          reg31 <= wire13;
        end
      else
        begin
          reg27 <= {$signed(wire13)};
        end
      reg32 <= (|$unsigned($signed((8'hb8))));
    end
  assign wire33 = ($unsigned(reg25[(4'h9):(3'h7)]) ?
                      wire14[(1'h1):(1'h1)] : reg28[(1'h0):(1'h0)]);
  module34 #() modinst61 (.clk(clk), .y(wire60), .wire37(reg23), .wire35(reg24), .wire38(reg31), .wire36(reg27));
  assign wire62 = ((|{(reg24 ? (wire10 ~^ reg22) : (8'hb4)),
                          (|$unsigned(wire17))}) ?
                      (wire12[(4'hc):(4'hb)] & reg28[(3'h4):(1'h0)]) : $unsigned((reg21[(4'h9):(4'h9)] ?
                          $unsigned((reg20 ? reg28 : reg31)) : {(~^reg23)})));
  assign wire63 = ((($signed($signed((8'h9d))) ?
                      (~^$unsigned(reg19)) : ({wire14, wire16} ?
                          (wire33 || reg25) : $unsigned(wire62))) != reg20) | {(reg32 ?
                          $signed((7'h42)) : $signed(wire14[(1'h0):(1'h0)]))});
  assign wire64 = reg28[(2'h3):(1'h1)];
  assign wire65 = wire15[(2'h2):(1'h0)];
  assign wire66 = {$signed((reg28[(3'h6):(3'h5)] * (~{wire65})))};
endmodule

module module34
#(parameter param59 = (({(((8'hb7) == (8'ha3)) - ((8'hba) ^ (8'hb0)))} == (({(8'hb4), (8'hbb)} ? (~|(8'hb2)) : (~(8'hb2))) && {(~&(8'ha2)), {(8'haa), (8'hb8)}})) <<< (^{(|((8'ha8) & (8'hba))), (((8'hb6) ? (8'hbc) : (8'hbe)) > (-(8'hbd)))})))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire [(4'hb):(1'h0)] wire36;
  input wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire39 = $unsigned((|wire37));
  assign wire40 = $unsigned((!$unsigned((8'h9c))));
  assign wire41 = ($unsigned((wire38[(4'ha):(3'h6)] ?
                          {wire37[(1'h0):(1'h0)],
                              $signed((8'h9e))} : $unsigned($signed(wire38)))) ?
                      ($signed((wire36[(4'h8):(4'h8)] ?
                          (wire38 >>> wire35) : ((8'h9f) >> wire36))) | wire40[(4'ha):(4'ha)]) : ({wire36[(2'h2):(2'h2)],
                          {$unsigned((8'hb8))}} != wire35));
  assign wire42 = (wire37 ?
                      (&(~$signed($signed(wire39)))) : ((+(~^(wire40 ?
                              wire38 : (8'hb0)))) ?
                          (wire38 > $unsigned($unsigned((8'hb6)))) : (!$unsigned($signed(wire37)))));
  assign wire43 = (8'ha4);
  assign wire44 = wire41;
  assign wire45 = $unsigned(((wire37 - ((wire39 | wire42) ?
                      $unsigned(wire44) : $unsigned((8'h9e)))) < wire38[(3'h4):(2'h2)]));
  assign wire46 = (8'hae);
  always
    @(posedge clk) begin
      reg47 <= $signed(($unsigned(wire35[(3'h6):(2'h3)]) ?
          (((^~wire42) ? wire44[(1'h1):(1'h0)] : wire42) ?
              $unsigned((&wire38)) : ((^~wire46) & (wire42 >> (8'hb9)))) : (~wire36)));
      reg48 <= wire35[(3'h7):(1'h0)];
      reg49 <= wire40[(4'he):(4'hc)];
      reg50 <= (^~(|(wire41[(3'h4):(2'h3)] ^~ wire40[(4'he):(4'ha)])));
      reg51 <= $signed(((reg47[(4'ha):(3'h6)] ?
              (wire37[(1'h1):(1'h0)] ?
                  reg49[(2'h2):(1'h1)] : (wire44 ?
                      wire35 : wire37)) : reg47[(3'h4):(2'h2)]) ?
          reg48[(2'h2):(1'h1)] : wire40[(1'h0):(1'h0)]));
    end
  assign wire52 = ({(wire41 >>> {wire38[(3'h6):(2'h2)], (wire39 >= (8'hb8))}),
                          wire38[(2'h2):(1'h0)]} ?
                      $signed(reg49[(3'h7):(3'h7)]) : (+(reg51[(4'h9):(1'h1)] & {wire36,
                          (reg51 ? reg47 : reg49)})));
  assign wire53 = wire45[(3'h7):(3'h4)];
  assign wire54 = (^~(-wire38[(2'h2):(1'h1)]));
  assign wire55 = (-(&(wire38[(4'hb):(4'h8)] == $signed((wire38 < wire38)))));
  assign wire56 = {$signed(($unsigned((wire40 ? wire38 : reg49)) ?
                          ((~|wire37) > wire39) : ($unsigned(wire55) <<< (reg51 ?
                              wire45 : (8'haa)))))};
  assign wire57 = (8'h9e);
  assign wire58 = wire43;
endmodule
