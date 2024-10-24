module top
#(parameter param40 = (~^(((!((8'hb5) & (8'hab))) ? (+{(8'ha2)}) : (^~(|(8'hb3)))) ? ({(^(8'hb6)), ((8'ha5) > (8'hb7))} < ({(8'ha1), (8'ha3)} ? ((8'hbf) ? (8'haa) : (7'h42)) : {(8'ha3), (8'hbe)})) : {{{(8'hb3), (8'hbd)}, ((8'hb4) << (8'ha5))}, (~^((8'hb2) * (8'h9d)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire32;
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire4,
                 wire5,
                 wire6,
                 wire32,
                 (1'h0)};
  assign wire4 = ($signed(wire2[(3'h7):(3'h7)]) ?
                     wire1[(3'h5):(3'h5)] : (!$unsigned($unsigned(wire0[(4'h9):(2'h2)]))));
  assign wire5 = $signed($unsigned((~^(wire3[(4'hd):(3'h4)] ~^ (^~wire0)))));
  assign wire6 = (~|(&(|(~|$unsigned(wire2)))));
  module7 #() modinst33 (wire32, clk, wire3, wire5, wire4, wire1, wire6);
  assign wire34 = {($unsigned(wire3) <<< wire2[(4'ha):(4'ha)]), wire6};
  assign wire35 = (~&$unsigned($signed($unsigned($signed(wire34)))));
  assign wire36 = {(wire6 == $unsigned(((wire3 ? wire34 : wire34) ?
                          ((8'h9f) ? wire4 : wire0) : wire5[(4'h8):(1'h0)])))};
  assign wire37 = (~|((^$unsigned($signed(wire6))) ?
                      {{$signed(wire35)}} : {(wire34 ? (-wire34) : (-wire0)),
                          (~^((7'h41) + (8'haf)))}));
  assign wire38 = ((((&wire2[(4'hb):(3'h5)]) ?
                      wire3 : $signed((8'hb3))) >= (wire6 ?
                      ((^~wire35) >>> $signed(wire37)) : ($unsigned(wire32) ?
                          (wire2 ?
                              wire6 : wire6) : wire3))) != $signed(($unsigned({wire4}) ?
                      wire0 : (~|{wire6}))));
  assign wire39 = ($signed((~($unsigned(wire2) << wire6[(2'h2):(2'h2)]))) - (wire36[(4'h8):(1'h1)] ^ wire34[(3'h4):(3'h4)]));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  assign y = {wire31,
                 wire20,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire13 = (~(~|($unsigned((&wire10)) ?
                      $signed((wire8 <<< wire10)) : ((8'hb1) >>> wire12[(2'h2):(1'h1)]))));
  assign wire14 = ($signed(($unsigned(wire12) * (wire8 != $signed((8'h9c))))) != wire11);
  assign wire15 = (wire14[(3'h4):(3'h4)] ?
                      (-wire13[(5'h11):(2'h2)]) : {(8'hba), wire14});
  assign wire16 = {$signed({(wire15 ? (+wire11) : (wire15 <<< wire15))})};
  assign wire17 = (wire11 ?
                      $signed($unsigned(wire14[(3'h7):(1'h0)])) : (wire11 || $unsigned($unsigned((&wire12)))));
  always
    @(posedge clk) begin
      reg18 <= wire17;
      reg19 <= $signed(wire12);
    end
  assign wire20 = $unsigned($unsigned(wire8[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire20[(2'h3):(2'h2)])
        begin
          reg21 <= (($unsigned($unsigned((wire9 ? wire9 : wire12))) ?
                  {$unsigned(wire14[(3'h6):(2'h2)]),
                      (wire17 ?
                          (wire17 ?
                              reg19 : reg19) : wire12[(3'h4):(3'h4)])} : reg18) ?
              $unsigned((+$signed($unsigned(reg18)))) : $signed(($signed((wire10 > wire8)) ^ ((wire13 ^~ wire20) ?
                  wire15 : wire16))));
        end
      else
        begin
          reg21 <= (^~wire20[(1'h0):(1'h0)]);
          reg22 <= ($unsigned(((~|{reg19}) ?
              $signed(wire8) : $unsigned($signed(reg18)))) & reg21);
        end
      if ((~|($unsigned($signed((reg21 > (8'hb3)))) ? wire13 : wire13)))
        begin
          if ($signed((wire13 | {wire8})))
            begin
              reg23 <= reg19[(1'h1):(1'h0)];
              reg24 <= (reg19[(1'h1):(1'h1)] ?
                  ($unsigned(wire16) <<< {($signed(reg21) ?
                          $signed((7'h42)) : (reg21 ~^ reg21)),
                      (^$signed(wire8))}) : (8'hbe));
              reg25 <= wire13[(1'h0):(1'h0)];
              reg26 <= wire11;
            end
          else
            begin
              reg23 <= ((8'haf) ? $signed(reg18) : (8'h9c));
              reg24 <= wire14[(3'h4):(1'h0)];
              reg25 <= ((8'ha2) ?
                  {reg26[(4'hf):(3'h4)]} : $unsigned({(((8'ha6) | (7'h42)) ?
                          wire9[(3'h4):(1'h0)] : (!(8'ha3)))}));
              reg26 <= $unsigned(wire8);
            end
        end
      else
        begin
          reg23 <= wire8;
          reg24 <= (~$unsigned($unsigned($unsigned((wire17 ?
              reg26 : wire17)))));
          reg25 <= ((wire13 >>> {{(wire13 < wire15)}, wire10[(2'h2):(1'h0)]}) ?
              reg24 : (reg21 && (~|$signed($signed(reg19)))));
          reg26 <= $signed(reg25[(1'h1):(1'h0)]);
        end
      reg27 <= ((~&reg25[(3'h4):(1'h0)]) ?
          {(-reg18[(1'h0):(1'h0)])} : (wire9[(4'hc):(2'h2)] ?
              wire15[(3'h5):(2'h3)] : ((((8'hac) ?
                  (8'ha9) : wire13) ^ $unsigned(wire8)) ^ ((reg23 ?
                      reg25 : reg24) ?
                  (~&wire11) : $signed(wire20)))));
      reg28 <= wire20[(1'h0):(1'h0)];
      reg29 <= $signed($unsigned((reg26 ^ (reg26 ?
          wire12[(1'h1):(1'h0)] : wire12))));
    end
  always
    @(posedge clk) begin
      reg30 <= reg23;
    end
  assign wire31 = ((((reg27[(2'h2):(2'h2)] && $unsigned(reg28)) << ({reg21} ?
                          (wire9 ?
                              reg19 : (8'ha2)) : (^reg21))) >= reg27[(2'h2):(1'h0)]) ?
                      reg28[(4'h9):(2'h2)] : wire13[(5'h11):(3'h4)]);
endmodule
