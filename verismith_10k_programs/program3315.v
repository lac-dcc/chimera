module top
#(parameter param53 = {(((|(-(8'hbd))) <= (((8'hbb) ? (8'h9d) : (7'h41)) >> (-(7'h41)))) << (((+(8'ha1)) ^ (~|(8'h9f))) ? {(~(8'h9e))} : ((~&(8'hac)) <<< ((8'haf) ? (8'hb6) : (8'hb9)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire46;
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire5,
                 wire6,
                 wire46,
                 (1'h0)};
  assign wire5 = (~^{(((~|(8'ha2)) ? $signed(wire0) : wire4) ?
                         $unsigned(wire1[(4'h8):(2'h3)]) : (wire4[(3'h4):(2'h2)] > wire3[(4'h9):(4'h8)])),
                     (wire4 ? (~&((8'hb5) | wire1)) : wire3)});
  assign wire6 = (wire5 | (~^$signed(wire0)));
  module7 #() modinst47 (.wire12(wire5), .wire8(wire6), .y(wire46), .wire11(wire2), .clk(clk), .wire9(wire0), .wire10(wire3));
  assign wire48 = (~|wire3[(3'h5):(1'h1)]);
  assign wire49 = (wire3[(4'ha):(1'h1)] || wire2);
  assign wire50 = $unsigned({(wire0[(3'h6):(2'h3)] ? wire4 : wire48)});
  assign wire51 = $signed(($signed((|$signed(wire5))) < wire5));
  assign wire52 = ($signed(wire51[(2'h2):(1'h0)]) ?
                      wire48[(4'hb):(3'h6)] : (^($unsigned(((8'h9c) ^~ wire3)) == ($unsigned(wire49) || $signed((7'h40))))));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 wire14,
                 wire13,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire13 = $signed((^(-(8'hb2))));
  assign wire14 = wire8;
  module15 #() modinst36 (wire35, clk, wire13, wire8, wire10, wire14);
  assign wire37 = $unsigned((!$signed($unsigned(wire9))));
  assign wire38 = (wire35[(4'hd):(2'h2)] ?
                      ((8'hbf) ?
                          $signed(wire14) : (^~{(8'h9c)})) : $signed($unsigned(wire12)));
  assign wire39 = (wire10 ?
                      (-({(~(8'h9c)),
                          wire11} >> wire12[(3'h4):(3'h4)])) : ($signed(($unsigned(wire10) != (wire12 ?
                          (8'hbd) : wire38))) != $unsigned((~|(~wire12)))));
  assign wire40 = wire8;
  assign wire41 = wire12;
  assign wire42 = $signed((wire40 > wire13[(1'h0):(1'h0)]));
  assign wire43 = (((^~wire9) ?
                          ($signed(wire38) ?
                              ((~wire11) ?
                                  {wire41} : (wire35 ?
                                      (8'haf) : wire37)) : ((wire35 >>> wire40) != $unsigned(wire8))) : wire12[(1'h1):(1'h0)]) ?
                      ($signed(wire13[(2'h2):(1'h1)]) ?
                          $signed(wire38) : $unsigned(wire39)) : {($unsigned($signed(wire13)) ?
                              $signed($signed(wire13)) : {$signed(wire35)}),
                          (wire10[(3'h7):(2'h3)] ? wire13 : {wire41})});
  always
    @(posedge clk) begin
      reg44 <= (+wire42);
      reg45 <= $unsigned($unsigned(({$unsigned(reg44), {wire42, wire38}} ?
          {wire14, (wire14 ? wire37 : wire41)} : $unsigned((!wire39)))));
    end
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire21,
                 wire20,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = ({wire17[(4'h9):(3'h4)]} ?
                      $signed({{$signed((8'hb2)), $signed(wire17)},
                          wire17}) : ($signed(wire18[(4'he):(4'hb)]) && {(8'hb1)}));
  assign wire21 = (-{(((wire18 ? wire19 : wire20) ?
                              {wire18, wire19} : (wire18 * wire17)) ?
                          $unsigned($signed((7'h40))) : (~|{wire16})),
                      ($signed((wire19 ?
                          wire17 : wire19)) ^~ wire19[(3'h4):(1'h1)])});
  always
    @(posedge clk) begin
      reg22 <= wire21;
      reg23 <= wire17[(1'h0):(1'h0)];
      reg24 <= (!wire21[(2'h3):(1'h1)]);
      reg25 <= $signed(reg23);
      reg26 <= $unsigned(reg23[(1'h1):(1'h0)]);
    end
  assign wire27 = {((reg23[(1'h1):(1'h1)] ^~ ($unsigned(wire19) ^ $unsigned(reg25))) ?
                          ($signed((~|wire21)) << ($unsigned(wire21) ?
                              reg25 : (+reg25))) : (^(~$signed(wire21)))),
                      (~^wire19[(2'h2):(1'h1)])};
  assign wire28 = (((wire21 ?
                      $signed((~reg26)) : $signed($unsigned((8'ha8)))) - ($signed((8'ha2)) << $unsigned({wire21,
                      reg26}))) | ((((wire17 * reg26) ?
                      $unsigned(wire17) : wire19[(4'hf):(3'h5)]) <= $unsigned(reg25[(4'ha):(2'h3)])) <<< reg22));
  assign wire29 = (^$signed($unsigned($signed($unsigned((8'hbe))))));
  always
    @(posedge clk) begin
      if ((8'hbc))
        begin
          if ((((!$signed((wire28 ? wire21 : reg24))) ?
                  $unsigned(((wire20 ?
                      (8'h9e) : wire21) > $signed((8'ha5)))) : $unsigned($unsigned(reg22[(5'h11):(3'h4)]))) ?
              wire29[(4'hb):(3'h7)] : ((($signed((8'haf)) ~^ $signed(reg26)) >>> reg24[(2'h3):(2'h2)]) >> $signed((~|reg25)))))
            begin
              reg30 <= $unsigned(wire18[(4'h9):(4'h8)]);
            end
          else
            begin
              reg30 <= (!wire18);
              reg31 <= (($signed((&(wire28 ? wire28 : (8'hbe)))) ?
                      (|wire17[(2'h3):(2'h2)]) : $unsigned((^wire16))) ?
                  wire16[(4'h8):(3'h7)] : (wire28[(3'h5):(2'h2)] ?
                      ($signed((reg23 ? wire21 : reg24)) ?
                          wire16 : $signed(reg25[(3'h7):(2'h2)])) : $signed(((~^reg22) < $signed(reg30)))));
            end
          reg32 <= ({wire27} <<< $unsigned($unsigned(wire29[(4'hb):(3'h6)])));
          reg33 <= wire19[(5'h10):(1'h0)];
          reg34 <= {({reg23[(2'h2):(1'h0)], reg30} ?
                  (!(reg22[(5'h12):(4'hd)] ?
                      (|wire29) : ((8'ha4) ?
                          (8'ha6) : reg32))) : $signed($unsigned(reg25[(4'ha):(3'h5)])))};
        end
      else
        begin
          reg30 <= reg31[(5'h12):(1'h1)];
          reg31 <= (($signed((wire21[(2'h3):(2'h3)] ?
                  ((8'ha4) ? reg22 : (8'h9e)) : (~reg33))) ?
              wire21 : (reg24 >= wire21)) <= reg33);
        end
    end
endmodule
