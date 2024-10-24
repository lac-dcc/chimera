module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire41;
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  assign y = {wire59,
                 wire55,
                 wire54,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire41,
                 reg60,
                 reg58,
                 reg57,
                 reg56,
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
                 (1'h0)};
  assign wire5 = {$signed((^(+wire1))), wire0[(2'h3):(2'h2)]};
  assign wire6 = (^~$unsigned(wire5[(2'h2):(2'h2)]));
  assign wire7 = wire4[(3'h7):(1'h0)];
  assign wire8 = (!(|{$unsigned($unsigned(wire2)), $signed($signed(wire3))}));
  assign wire9 = $signed(({(~^(|wire6))} ?
                     (!$unsigned(wire2[(4'hf):(1'h0)])) : (|wire4[(4'h8):(3'h4)])));
  module10 #() modinst42 (.wire12(wire5), .clk(clk), .wire11(wire2), .y(wire41), .wire15(wire7), .wire13(wire0), .wire14(wire1));
  always
    @(posedge clk) begin
      reg43 <= $unsigned($signed((wire8 - {$signed(wire6), (wire7 ^~ wire5)})));
      reg44 <= (-{wire0});
      if ((+$unsigned((wire2 ?
          (wire0[(3'h5):(2'h3)] + ((8'h9f) ~^ wire0)) : {(~(8'hb4)),
              (reg43 ? wire3 : wire1)}))))
        begin
          reg45 <= (((8'had) ?
                  ($unsigned(wire3[(4'h9):(4'h9)]) + ($signed(wire9) ~^ (!wire8))) : (-$unsigned((wire9 >>> wire4)))) ?
              ($signed(reg43[(2'h2):(2'h2)]) != {wire5}) : $unsigned(wire6[(3'h4):(1'h1)]));
          reg46 <= ((wire41 ? reg44 : wire4) ?
              {$unsigned($unsigned(wire3[(1'h0):(1'h0)]))} : ($signed($signed((wire0 < wire7))) && (wire2[(4'hc):(3'h4)] ?
                  (wire3[(4'ha):(1'h1)] ?
                      $unsigned(reg43) : reg43[(4'hd):(3'h6)]) : (wire41 ?
                      (wire2 ? wire41 : wire5) : ((8'haa) ? wire6 : wire6)))));
          if ((8'ha4))
            begin
              reg47 <= wire41;
            end
          else
            begin
              reg47 <= wire0[(4'he):(3'h7)];
              reg48 <= ((8'hb7) ?
                  ($signed($signed($unsigned(wire1))) ?
                      ((wire3 >= (wire2 && wire1)) ?
                          (^$unsigned((8'haf))) : {wire6[(2'h3):(2'h2)],
                              wire3}) : ((~|reg46[(5'h10):(3'h7)]) | $unsigned(wire41))) : $signed($unsigned((~(wire8 || wire3)))));
              reg49 <= wire8;
              reg50 <= wire8[(2'h2):(1'h0)];
              reg51 <= wire9;
            end
          reg52 <= $signed($signed(reg50));
        end
      else
        begin
          reg45 <= $unsigned($signed((^((^~reg44) + (^reg48)))));
          reg46 <= (&wire4[(3'h6):(1'h0)]);
          reg47 <= ((&$signed($signed($signed((8'hab))))) ?
              (reg43 ?
                  $signed({(reg48 ? reg48 : wire1)}) : (reg47 ?
                      (&(8'ha9)) : $signed(wire5))) : (~((&{reg46}) ?
                  (~|(reg50 << reg51)) : (reg51[(4'h8):(1'h1)] ?
                      (wire5 - reg43) : (wire2 ? wire5 : (8'hb4))))));
        end
      reg53 <= $unsigned((reg43[(4'hc):(4'h9)] ?
          $signed({reg46[(2'h3):(1'h0)]}) : (&((reg49 ? reg51 : (8'ha7)) ?
              wire7 : (8'hbe)))));
    end
  assign wire54 = ({$signed((|(+wire4))),
                      (|$unsigned((wire5 ? reg52 : wire41)))} <= wire1);
  assign wire55 = reg51;
  always
    @(posedge clk) begin
      reg56 <= (reg49 ? wire0 : reg48[(1'h0):(1'h0)]);
      reg57 <= reg44;
      reg58 <= wire55;
    end
  assign wire59 = (wire55[(4'hb):(1'h1)] ?
                      $signed(($signed((reg58 ? wire8 : reg44)) ?
                          (-(!wire9)) : reg53)) : ((8'hb9) ?
                          $unsigned({$signed(wire8),
                              (+(8'hbd))}) : {$unsigned((wire6 ^ (8'hab))),
                              reg50[(1'h1):(1'h1)]}));
  always
    @(posedge clk) begin
      reg60 <= $signed(wire6[(2'h3):(2'h2)]);
    end
endmodule

module module10
#(parameter param40 = (^(8'hab)))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= wire12[(2'h2):(1'h0)];
      reg17 <= {reg16};
      reg18 <= {$unsigned(reg17[(3'h6):(2'h3)])};
      reg19 <= (wire14[(3'h4):(1'h0)] ?
          wire14 : $unsigned($signed((!wire13[(1'h1):(1'h0)]))));
      if (((wire11[(1'h1):(1'h1)] && ($signed(reg16[(5'h12):(3'h5)]) <<< ((reg16 ?
              reg16 : wire12) ?
          wire15 : reg16[(4'ha):(4'h9)]))) << wire13[(2'h2):(1'h1)]))
        begin
          reg20 <= reg18;
          reg21 <= (wire14 ? reg20 : reg18[(4'h8):(1'h1)]);
          if ((^(!wire11[(4'ha):(4'ha)])))
            begin
              reg22 <= reg16[(4'hb):(3'h7)];
              reg23 <= wire12;
              reg24 <= (~{reg16});
              reg25 <= reg17[(3'h6):(3'h6)];
            end
          else
            begin
              reg22 <= reg25;
            end
          reg26 <= {{(wire13 ? reg18[(4'hc):(1'h1)] : {(|reg20), (^reg17)}),
                  (^~(&(reg18 ~^ (7'h43))))},
              (reg20 > wire12)};
          if ({{$signed((~wire14))}, reg24[(4'hb):(4'h8)]})
            begin
              reg27 <= (reg16[(4'hb):(4'ha)] > (+reg24[(3'h5):(1'h1)]));
              reg28 <= (8'h9f);
            end
          else
            begin
              reg27 <= (-reg19);
              reg28 <= (~|(~&reg19[(3'h7):(2'h3)]));
              reg29 <= $signed(($unsigned((~&(wire14 ?
                  reg18 : (8'haf)))) ^ reg21));
              reg30 <= $unsigned($unsigned(($signed(reg23) * $signed($signed(wire15)))));
            end
        end
      else
        begin
          reg20 <= reg18;
          if ((^wire15[(1'h0):(1'h0)]))
            begin
              reg21 <= reg20;
              reg22 <= (((reg28[(3'h4):(1'h0)] & {(reg27 & (8'hbb))}) ?
                  {reg18[(3'h4):(1'h0)],
                      $unsigned(wire14[(3'h4):(1'h1)])} : reg30) <<< (+reg22[(3'h6):(3'h6)]));
              reg23 <= $signed(($unsigned(($signed(wire12) ^~ (reg30 ?
                      reg30 : reg21))) ?
                  wire15[(4'ha):(1'h1)] : ($unsigned((reg26 < (8'hb2))) & $signed($signed(reg22)))));
            end
          else
            begin
              reg21 <= reg24;
              reg22 <= (~^{(~&(|reg29))});
              reg23 <= $signed($signed((!(|reg30))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg31 <= $signed((&({(!(8'hbb))} ?
          $signed((&reg23)) : reg21[(2'h2):(2'h2)])));
      reg32 <= (|(reg18[(1'h0):(1'h0)] ?
          $unsigned((wire13[(1'h0):(1'h0)] >> (reg18 >= reg29))) : wire12[(3'h6):(3'h4)]));
      reg33 <= wire15;
      reg34 <= ((-(reg33 != $signed(reg33[(4'he):(4'hc)]))) << $signed($unsigned($signed(reg27[(3'h6):(3'h4)]))));
    end
  assign wire35 = $unsigned($signed(reg34));
  assign wire36 = $unsigned((8'h9f));
  assign wire37 = ($signed(wire12[(3'h5):(2'h2)]) * $unsigned(reg30));
  assign wire38 = ((-reg17) ?
                      ((-($signed(wire35) != $signed((8'hb7)))) <<< wire12[(5'h13):(4'hf)]) : reg29);
  assign wire39 = {$unsigned($signed((^$unsigned(reg30)))),
                      $unsigned(reg24[(2'h2):(2'h2)])};
endmodule
