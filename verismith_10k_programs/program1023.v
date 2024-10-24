module top
#(parameter param57 = {(+(((^~(8'h9d)) >> ((8'ha3) ? (7'h41) : (8'hba))) ? {(8'hac)} : (+(!(8'h9e)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire55;
  assign y = {wire30, wire32, wire33, wire55, (1'h0)};
  module4 #() modinst31 (wire30, clk, wire2, wire1, wire0, wire3, (8'hb0));
  assign wire32 = wire1;
  assign wire33 = wire0;
  module34 #() modinst56 (wire55, clk, wire33, wire0, wire30, wire2, wire32);
endmodule

module module34
#(parameter param54 = ((~^{((~(8'had)) ^~ ((8'hb3) ? (8'ha5) : (8'hb4)))}) >>> (({(!(8'h9c)), {(8'ha3)}} >= ((-(8'ha5)) && (8'hb7))) ? ({(~|(8'haf))} <<< ({(8'ha5)} ? (~|(8'ha1)) : (~^(8'haa)))) : ((((8'hb3) >> (8'hb6)) ~^ ((8'hba) ? (8'hb3) : (8'h9e))) + (((7'h43) ? (8'hbf) : (8'haf)) >= (+(8'hb0)))))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire39;
  input wire signed [(5'h11):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  input wire [(4'hb):(1'h0)] wire36;
  input wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 (1'h0)};
  assign wire40 = (wire36[(4'h8):(3'h4)] ?
                      (^~wire38) : {{{$signed(wire38)}, $signed(wire36)},
                          (~|wire37)});
  assign wire41 = $signed($signed(wire38[(4'he):(3'h4)]));
  assign wire42 = (8'haa);
  assign wire43 = wire41[(4'hb):(3'h5)];
  assign wire44 = wire42;
  assign wire45 = ({(wire41 ?
                          $unsigned(wire40[(4'hd):(1'h1)]) : $unsigned(((8'hb7) ?
                              wire41 : wire38))),
                      ($unsigned(wire43[(3'h6):(1'h1)]) <<< wire39)} * $signed($signed((^~(8'ha4)))));
  assign wire46 = $signed(wire43);
  assign wire47 = wire35;
  assign wire48 = (($signed(({wire47,
                          wire45} >>> wire38)) + (|(wire39[(5'h10):(5'h10)] ?
                          $signed(wire45) : (wire39 << wire36)))) ?
                      $unsigned($signed(wire42)) : {$unsigned((~|(wire36 ?
                              wire44 : wire47)))});
  assign wire49 = (&$unsigned((((&wire41) << (wire44 | wire35)) | $signed(wire37[(3'h4):(3'h4)]))));
  assign wire50 = wire38[(4'hd):(3'h4)];
  assign wire51 = (8'hbd);
  assign wire52 = ($signed(wire41[(5'h15):(5'h15)]) ?
                      (wire38 + (8'ha0)) : (8'hb1));
  assign wire53 = $signed($signed($signed(wire42[(1'h1):(1'h0)])));
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  assign y = {wire29,
                 wire12,
                 wire11,
                 wire10,
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
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire10 = wire6;
  assign wire11 = $signed(((|wire8) ? (|(~&(wire10 | wire8))) : wire6));
  assign wire12 = (~^$unsigned($signed(wire10)));
  always
    @(posedge clk) begin
      reg13 <= (($unsigned($signed((&wire5))) << (($signed(wire7) == wire7) || {wire5[(5'h13):(4'he)],
          wire10[(1'h1):(1'h1)]})) - wire5[(3'h7):(2'h3)]);
      if (($unsigned((^($unsigned(wire11) ? wire6 : $signed(wire7)))) ?
          ((+$signed((wire5 < wire10))) ?
              wire12 : wire5[(4'he):(4'hd)]) : wire7[(5'h12):(5'h12)]))
        begin
          reg14 <= $signed(((^$signed(wire9[(5'h13):(4'hd)])) && ($signed(wire6[(2'h2):(1'h0)]) ?
              $unsigned($signed(wire5)) : $signed(wire10))));
          if ($signed((~$signed(({wire10, wire5} >> {wire12})))))
            begin
              reg15 <= $unsigned($signed({$signed((7'h40))}));
              reg16 <= (({{wire10, reg15}, (~&wire5)} ?
                      $signed(reg13[(2'h3):(1'h1)]) : (wire11 ?
                          wire8 : wire12)) ?
                  $unsigned($unsigned((wire10[(1'h0):(1'h0)] ?
                      (reg15 ?
                          wire8 : reg13) : (^~wire7)))) : $unsigned($unsigned(($signed(wire10) > (~^reg14)))));
              reg17 <= (~^wire8[(3'h7):(1'h1)]);
              reg18 <= reg17[(4'hd):(1'h0)];
              reg19 <= (reg13 ~^ (({((8'ha0) ? wire9 : reg16),
                  ((7'h44) ^ wire7)} > wire8) ^ wire5[(5'h12):(4'he)]));
            end
          else
            begin
              reg15 <= $unsigned(((($unsigned(wire7) > (reg14 ?
                  (7'h42) : (8'h9e))) + ({reg14, reg17} ?
                  reg13 : (~&reg13))) - wire7));
              reg16 <= ((8'hb9) & (wire5 << (((reg18 << reg18) ?
                      $unsigned(wire9) : $unsigned((8'hbd))) ?
                  $unsigned((&reg13)) : $signed((wire12 >>> (8'hae))))));
              reg17 <= {$unsigned(({(reg17 <= wire10), (-(8'hb2))} ?
                      ($unsigned(reg13) >> (reg16 || wire6)) : $signed($signed(reg16)))),
                  reg18};
              reg18 <= $signed(reg18);
            end
          reg20 <= {reg13[(3'h5):(3'h5)]};
          reg21 <= $signed((!reg19[(4'hf):(4'ha)]));
          if (($unsigned($signed(((~&wire7) ^~ (reg14 ?
              reg19 : wire8)))) == {reg17, $unsigned({(wire8 < reg16)})}))
            begin
              reg22 <= (~reg19[(3'h7):(1'h1)]);
              reg23 <= (reg17[(2'h2):(1'h1)] >= ((+(~&((8'hb9) - wire9))) ?
                  ((~^((8'hbb) + (8'hbc))) ?
                      {{wire6}, reg18[(4'hd):(4'hb)]} : ($unsigned(reg21) ?
                          (reg13 ~^ reg18) : ((8'hb6) ?
                              wire9 : wire10))) : (^reg13)));
            end
          else
            begin
              reg22 <= (reg19[(5'h13):(1'h1)] ~^ ((($unsigned(wire6) ?
                          (^~wire12) : reg19) ?
                      ($unsigned((8'ha5)) <= $unsigned(reg15)) : (~&$unsigned(reg21))) ?
                  ({(~wire11)} ?
                      $signed(((8'hb2) ? reg23 : wire5)) : ({reg14,
                          (8'hb1)} >> reg13)) : (reg14 * ((reg15 & reg19) ?
                      (reg21 ? (8'ha4) : reg21) : (~reg16)))));
            end
        end
      else
        begin
          if (reg13[(3'h4):(1'h1)])
            begin
              reg14 <= $signed((~^$unsigned(reg20[(2'h2):(1'h1)])));
              reg15 <= reg21[(1'h1):(1'h1)];
              reg16 <= (reg18 ?
                  {(~^(reg15[(2'h3):(2'h3)] ^ (reg13 > reg18)))} : reg22);
              reg17 <= (7'h42);
              reg18 <= {reg13};
            end
          else
            begin
              reg14 <= (wire7 ?
                  (|(wire9[(5'h12):(4'h8)] ?
                      reg15[(2'h2):(2'h2)] : reg20)) : (8'haa));
            end
          reg19 <= $unsigned(reg20);
          if ({$signed($unsigned({(reg21 ? reg23 : reg21), {reg14, wire11}})),
              $unsigned((!((~|reg14) ? $unsigned(wire6) : (wire7 + wire7))))})
            begin
              reg20 <= wire12[(5'h10):(2'h2)];
              reg21 <= $unsigned(reg23[(1'h0):(1'h0)]);
              reg22 <= reg16[(4'he):(3'h7)];
            end
          else
            begin
              reg20 <= wire6[(3'h5):(1'h0)];
              reg21 <= (|(reg14 | reg16[(4'hc):(2'h3)]));
              reg22 <= (8'haa);
              reg23 <= (~&{{$unsigned(wire5[(4'hb):(4'h9)]),
                      $signed($signed(reg21))}});
            end
          reg24 <= (((reg17[(2'h3):(2'h3)] ? {$signed(reg22), reg14} : reg17) ?
                  {wire11} : $signed((reg23[(3'h5):(1'h0)] ?
                      (wire6 > reg16) : $signed(reg16)))) ?
              $unsigned($unsigned({{reg20}, reg20[(2'h3):(2'h2)]})) : {reg14});
          reg25 <= reg22;
        end
      reg26 <= ($signed(wire9[(3'h4):(2'h2)]) <= wire10);
      reg27 <= reg15;
      reg28 <= (~(|$signed((+(wire8 > reg25)))));
    end
  assign wire29 = (wire12[(3'h4):(2'h2)] == (|$unsigned(reg18)));
endmodule
