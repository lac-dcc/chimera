module top
#(parameter param30 = (((!((!(7'h44)) ? ((8'hbb) ? (8'ha2) : (7'h40)) : (|(8'hb6)))) ? (((~|(7'h43)) ? ((8'ha5) ? (8'hbd) : (8'haf)) : ((8'hbc) ? (8'hbb) : (7'h42))) ? ({(8'ha1), (8'hb1)} == (8'hb3)) : (!(8'hb8))) : ((((8'ha0) ? (8'hbc) : (8'ha4)) ? (^(8'hb6)) : ((8'hae) ? (8'had) : (8'h9c))) ~^ ((^(8'h9f)) ? (+(8'ha8)) : ((8'hb5) ? (8'hae) : (8'hae))))) ? (|(((~&(7'h41)) < (&(8'h9d))) ? (((7'h42) + (7'h42)) || ((8'hb4) + (8'hbf))) : (~^((8'ha9) << (8'hb8))))) : ((~^(~((8'h9f) >>> (8'hb0)))) || ((~^(-(8'ha5))) ? {((7'h42) ^ (8'h9c)), (8'hb5)} : (((8'ha2) ? (7'h43) : (8'ha1)) ? {(8'ha7)} : ((8'ha6) ? (8'haf) : (7'h44)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg12,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ({((~^$unsigned(wire3)) < wire0),
                     wire2} >>> wire1[(3'h6):(1'h1)]);
  assign wire5 = wire1;
  assign wire6 = (wire3 + (8'haf));
  assign wire7 = ((~$unsigned($signed({(7'h44),
                     wire2}))) ^ (+(wire3 && $signed((+(8'h9f))))));
  assign wire8 = {((^~($signed(wire0) ?
                         (wire5 ?
                             wire7 : wire1) : wire4)) < $unsigned(wire2[(2'h2):(2'h2)]))};
  always
    @(posedge clk) begin
      reg9 <= (~|$signed($signed(wire4[(4'hc):(3'h7)])));
      reg10 <= ($signed(($unsigned((|wire3)) ?
              $unsigned((~wire6)) : $unsigned(((8'ha7) & wire3)))) ?
          {wire4} : {(wire8[(4'h9):(4'h8)] != reg9)});
    end
  assign wire11 = (wire8 ? wire5 : (wire7 + $unsigned(reg9[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg12 <= $unsigned({$unsigned((+(-wire8))),
          $unsigned(wire5[(3'h4):(1'h0)])});
      reg13 <= $signed(({wire4[(2'h2):(1'h0)]} - $signed(wire5)));
      reg14 <= ($signed($unsigned((((7'h43) ? wire5 : reg10) ?
          reg10[(3'h5):(3'h5)] : (reg13 ? reg9 : wire7)))) << {(((!wire0) ?
              wire1[(2'h2):(1'h0)] : $signed((8'ha6))) << (reg10[(3'h7):(3'h5)] ?
              wire7 : $signed(reg12))),
          $signed(reg12[(1'h0):(1'h0)])});
    end
  always
    @(posedge clk) begin
      if ((~&(^~(^~(~^$unsigned(reg12))))))
        begin
          reg15 <= wire6;
          reg16 <= (~|$unsigned(wire7));
          reg17 <= $unsigned({wire0[(3'h6):(2'h3)], reg13});
          reg18 <= $signed(((!$signed($unsigned(wire4))) ?
              (wire7[(4'hb):(1'h1)] > ($unsigned(wire1) << $unsigned(reg12))) : $unsigned($unsigned((reg17 > (8'hbb))))));
        end
      else
        begin
          reg15 <= ((wire11 ? reg16 : {$unsigned((reg10 && wire11))}) ?
              {(((!wire2) ? (reg18 ? wire3 : (8'h9f)) : $unsigned(reg9)) ?
                      ((reg10 | wire6) ?
                          ((8'h9e) ?
                              reg9 : (8'hac)) : reg9[(1'h0):(1'h0)]) : reg15[(3'h5):(3'h5)]),
                  $signed({$signed((8'hb3)),
                      (|reg18)})} : (&$signed(reg10[(3'h7):(1'h1)])));
          reg16 <= $signed((wire4 < (~^((reg18 ?
              (7'h41) : wire3) | reg14[(4'hb):(4'h9)]))));
          if (((($signed(wire0) ?
              (7'h41) : (reg9[(1'h0):(1'h0)] ?
                  $unsigned(reg15) : reg12)) >> (wire0 ?
              $unsigned($signed(reg12)) : (8'ha5))) > wire3[(1'h0):(1'h0)]))
            begin
              reg17 <= ((wire0[(4'hd):(2'h3)] + reg14[(2'h2):(2'h2)]) * ($signed(reg13[(1'h0):(1'h0)]) == ((wire2 ?
                      (^~wire4) : (^(8'ha2))) ?
                  (~&(wire0 ? reg16 : (8'hb8))) : (8'had))));
              reg18 <= (~^$unsigned((({wire5,
                  reg10} < $unsigned(wire2)) ~^ $unsigned(reg15[(3'h5):(2'h3)]))));
            end
          else
            begin
              reg17 <= $unsigned(((reg18 ^ wire6) ?
                  (wire7 | reg16[(3'h5):(2'h2)]) : wire0));
              reg18 <= reg9;
              reg19 <= $signed($unsigned(($unsigned($unsigned(wire5)) ?
                  $unsigned((|reg17)) : ((wire0 ? wire7 : (8'haa)) ?
                      (reg9 ? wire11 : (8'hb0)) : (~&wire0)))));
            end
          reg20 <= ($unsigned(reg18) <<< $signed((wire0 * $signed((reg18 ?
              (8'hac) : wire7)))));
          if (reg19)
            begin
              reg21 <= ($signed((reg10 ? reg19 : reg15)) <= ({{{wire4},
                          ((8'ha8) ? reg19 : reg18)}} ?
                  {{{reg9}}} : wire5));
              reg22 <= $signed((+($signed(reg12[(2'h3):(1'h1)]) >> reg20)));
              reg23 <= (reg14 ?
                  ($unsigned(wire0) * wire4) : reg21[(3'h7):(1'h0)]);
              reg24 <= wire5[(2'h3):(1'h0)];
              reg25 <= wire3;
            end
          else
            begin
              reg21 <= (&(&(($signed(reg15) > (wire0 ? reg21 : reg25)) ?
                  reg18[(3'h7):(3'h4)] : ((wire1 + reg23) ?
                      $signed(reg14) : (wire3 == reg23)))));
              reg22 <= reg18[(3'h6):(2'h3)];
              reg23 <= {$signed((^~($signed((8'ha7)) ^ {reg15, wire8})))};
              reg24 <= reg17[(3'h7):(1'h1)];
              reg25 <= ({$unsigned(($unsigned((8'ha9)) <<< {reg17})),
                  $unsigned($signed({wire0,
                      (8'h9d)}))} ^~ ($unsigned(((reg17 <= wire3) ^ $signed(reg10))) <<< {{wire1,
                      (reg18 | wire11)}}));
            end
        end
      reg26 <= ($signed(reg10) * wire8[(2'h3):(1'h1)]);
      reg27 <= (($unsigned((((8'hb8) ? reg25 : reg26) >>> (reg26 ?
                  reg15 : reg23))) ?
              (&wire8[(1'h0):(1'h0)]) : reg25[(1'h0):(1'h0)]) ?
          $signed((!(~|(reg24 ^~ reg13)))) : ((+reg17) ?
              (^$signed((~|wire5))) : (^({wire6, reg12} ?
                  (wire3 | reg15) : (reg9 ? wire0 : reg20)))));
    end
  assign wire28 = ($unsigned((8'hbe)) ?
                      $signed($signed(reg20)) : reg15[(1'h0):(1'h0)]);
  assign wire29 = ($signed(reg16[(3'h5):(3'h5)]) + wire1);
endmodule
