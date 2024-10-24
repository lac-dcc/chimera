module top
#(parameter param50 = (({{{(8'haf)}, ((7'h44) * (8'ha7))}} ? (~^(~((7'h44) * (8'ha7)))) : {(((8'hb7) >= (8'hbe)) ? ((8'hb3) && (8'h9f)) : {(8'ha6), (8'haa)}), (^((8'h9e) ? (7'h42) : (8'h9f)))}) < {((((8'hb2) >>> (8'hbf)) <<< (!(8'ha3))) ? (((8'hb9) >> (8'hbb)) ^ ((8'ha8) ? (8'haf) : (8'had))) : (-{(8'h9c)}))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire42,
                 wire41,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire8,
                 wire7,
                 wire5,
                 reg44,
                 reg40,
                 reg39,
                 reg38,
                 reg6,
                 (1'h0)};
  assign wire5 = ({(((wire4 == wire3) ?
                                 (wire1 ? wire2 : wire4) : $signed(wire2)) ?
                             $unsigned((|wire4)) : (wire2[(3'h7):(1'h0)] ?
                                 wire4[(1'h1):(1'h0)] : (wire4 ?
                                     wire3 : (8'ha3)))),
                         (|$unsigned(wire2))} ?
                     (!wire1[(1'h0):(1'h0)]) : (($unsigned($unsigned(wire2)) & (8'hbb)) < $signed(($unsigned(wire4) ?
                         $unsigned(wire0) : (^~wire3)))));
  always
    @(posedge clk) begin
      reg6 <= {$unsigned((&wire5[(5'h11):(4'hd)]))};
    end
  assign wire7 = wire3;
  assign wire8 = wire7[(5'h11):(4'ha)];
  module9 #() modinst34 (wire33, clk, wire7, wire1, wire3, wire2);
  assign wire35 = $signed($signed($unsigned((reg6 ?
                      (^wire3) : $signed(wire0)))));
  assign wire36 = wire0[(4'hd):(2'h2)];
  assign wire37 = (!(^~$signed($signed($unsigned(wire7)))));
  always
    @(posedge clk) begin
      reg38 <= wire37;
      reg39 <= wire33[(4'h8):(1'h0)];
      reg40 <= $signed({($unsigned((wire4 >> wire8)) ?
              $unsigned(reg6) : $unsigned((^~wire35))),
          $signed($signed((-wire37)))});
    end
  assign wire41 = wire7[(3'h6):(1'h0)];
  assign wire42 = (wire5[(4'hd):(4'hc)] || $signed(reg6));
  assign wire43 = reg38[(5'h13):(4'he)];
  always
    @(posedge clk) begin
      reg44 <= (wire41 <<< reg6);
    end
  assign wire45 = $unsigned(($signed(wire8) ?
                      reg6 : $signed(((8'ha1) || (wire2 ? wire0 : wire3)))));
  assign wire46 = wire5;
  assign wire47 = $unsigned(reg6);
  assign wire48 = wire7;
  assign wire49 = wire48[(5'h11):(3'h5)];
endmodule

module module9
#(parameter param32 = (((+(8'ha9)) ? (^~((-(8'haa)) ? (~^(8'haa)) : ((7'h40) ? (8'hb1) : (8'hae)))) : (~(((8'hbb) < (8'hb5)) <<< ((8'h9f) >>> (7'h40))))) ? ({(((8'ha0) | (8'hb9)) <= ((7'h41) ? (8'hb3) : (8'hbe))), (!((8'hb4) ? (7'h42) : (8'h9c)))} ? (^(~((8'hab) ? (8'hb0) : (8'hbb)))) : ((((8'hb0) & (8'hab)) >= ((8'had) <<< (8'hb5))) ? ({(8'hbf)} ^~ ((8'h9d) ? (8'h9e) : (8'hbb))) : (((8'hb2) ? (7'h42) : (8'ha9)) <= ((8'haa) ? (8'ha2) : (8'hb2))))) : ({((8'had) ? ((8'h9f) & (8'ha1)) : (-(8'hbf)))} == (^~(+(^~(8'hb6)))))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
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
                 reg18,
                 (1'h0)};
  assign wire14 = wire13[(2'h3):(1'h0)];
  assign wire15 = ({($signed($signed(wire10)) ?
                          wire11 : $unsigned($unsigned(wire11))),
                      wire11[(2'h2):(1'h0)]} ~^ ({(-wire13[(2'h2):(1'h0)]),
                      wire12} & (wire12[(4'h9):(1'h1)] & $signed((wire11 ?
                      wire14 : wire10)))));
  assign wire16 = ($signed(($unsigned((wire13 ? wire13 : wire12)) & ((-wire11) ?
                      (wire13 ?
                          wire12 : (8'haa)) : wire12))) >= $unsigned((~(((8'hb8) ?
                      wire13 : wire15) >>> {wire15, wire13}))));
  assign wire17 = wire14;
  always
    @(posedge clk) begin
      if ((wire11 ^~ ($unsigned((wire13[(1'h0):(1'h0)] ?
          (wire10 - wire15) : wire14)) & $signed($unsigned($signed(wire16))))))
        begin
          if ((+((8'ha4) == wire10)))
            begin
              reg18 <= wire10;
              reg19 <= ((-((+(wire11 ? wire12 : wire13)) ?
                      $signed({wire16}) : $signed(wire16))) ?
                  {{$signed({wire17})}} : $unsigned(wire14[(4'he):(4'hb)]));
              reg20 <= wire14;
              reg21 <= wire15;
            end
          else
            begin
              reg18 <= reg21;
              reg19 <= {$unsigned((^$unsigned((+(7'h42)))))};
              reg20 <= {wire17};
              reg21 <= {(^~($signed((wire10 ?
                      reg19 : wire12)) <<< wire16[(1'h1):(1'h0)])),
                  wire13};
              reg22 <= wire14[(1'h0):(1'h0)];
            end
          reg23 <= (8'hb5);
          if ((^~$unsigned(wire15[(4'hc):(4'hb)])))
            begin
              reg24 <= (($signed(wire16[(2'h2):(1'h1)]) && ($unsigned((reg23 * reg18)) ?
                  ($unsigned(wire10) ?
                      wire11[(2'h3):(1'h1)] : $signed((8'ha7))) : (reg22[(2'h3):(2'h2)] ?
                      ((8'ha5) ^~ reg18) : {reg19}))) ^ $unsigned({wire11[(3'h6):(1'h1)]}));
              reg25 <= wire11;
              reg26 <= $unsigned((reg18 ? wire11 : reg22[(3'h7):(3'h5)]));
              reg27 <= reg20;
            end
          else
            begin
              reg24 <= (8'hb0);
              reg25 <= (reg20 >= wire16);
            end
          reg28 <= (~^((8'ha9) ?
              ((7'h43) ^~ {(&(7'h42)), (~&reg20)}) : {(8'had)}));
          reg29 <= $signed(wire14[(1'h1):(1'h1)]);
        end
      else
        begin
          reg18 <= ($unsigned($signed(((^~reg18) - reg23))) + wire11);
          reg19 <= (~&$unsigned($unsigned($unsigned(((8'ha5) <= reg26)))));
          reg20 <= (+$signed((^~($unsigned(wire10) >>> (reg29 ^ reg18)))));
          if ($unsigned({(((reg22 ? (8'hbc) : wire15) ?
                      reg21 : (reg24 ? reg20 : (7'h42))) ?
                  (((8'ha2) ? reg25 : reg26) ?
                      (8'haf) : $signed((8'hbc))) : (^~{reg24, reg25}))}))
            begin
              reg21 <= reg29[(3'h4):(1'h0)];
              reg22 <= $signed(reg26[(1'h0):(1'h0)]);
            end
          else
            begin
              reg21 <= reg21;
              reg22 <= $unsigned($signed(reg27));
              reg23 <= ({$unsigned((-(^~(8'hb7))))} ^ $signed(($unsigned($unsigned(reg24)) ?
                  (7'h44) : (+(wire12 ? reg27 : reg22)))));
            end
          reg24 <= ($signed(($unsigned({wire17, reg28}) ?
                  ($unsigned(wire13) < reg25[(3'h6):(1'h0)]) : ((wire13 << wire15) ?
                      wire15[(2'h2):(1'h1)] : (reg23 ? reg20 : reg29)))) ?
              $unsigned((~^wire16[(2'h3):(1'h0)])) : (&((8'h9d) ?
                  ({reg25} ?
                      (reg23 ? reg28 : wire15) : {reg24}) : ($signed(reg29) ?
                      $signed(wire10) : (reg20 ? reg24 : reg26)))));
        end
    end
  assign wire30 = reg21;
  assign wire31 = (~&reg18[(3'h5):(3'h4)]);
endmodule
