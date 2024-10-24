module top
#(parameter param62 = (+(((((8'h9c) >> (8'hbc)) * (^(8'hbf))) < (((8'h9d) >= (8'hb6)) ^~ ((8'hb8) >>> (8'hb9)))) ? ((((8'hb3) ? (8'hb0) : (7'h44)) ? ((8'ha1) == (8'ha5)) : ((8'hac) & (8'ha2))) == {((8'hb3) ^ (8'ha5)), (-(8'h9d))}) : (^~((8'h9f) ? {(8'hb3)} : {(8'ha5), (8'hb6)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire55;
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  assign y = {wire61, wire60, wire58, wire57, wire55, reg59, (1'h0)};
  module4 #() modinst56 (wire55, clk, wire0, wire1, wire3, wire2, (8'h9f));
  assign wire57 = $signed(((($signed(wire3) != (wire3 ? wire0 : wire3)) ?
                          ($unsigned(wire0) <= $signed(wire55)) : wire3[(4'hf):(4'ha)]) ?
                      $signed(wire0[(1'h1):(1'h1)]) : (|(wire55[(4'he):(4'hd)] ?
                          wire1 : wire0))));
  assign wire58 = ($unsigned($signed($unsigned((^wire2)))) && $signed((($unsigned((8'hba)) >= $unsigned(wire1)) ?
                      $signed(wire3) : ((wire2 << wire1) && $signed(wire2)))));
  always
    @(posedge clk) begin
      reg59 <= (&((!$signed($signed(wire0))) ?
          ($signed((8'ha7)) <<< $unsigned({wire3,
              wire3})) : $signed((~^wire58[(4'ha):(3'h6)]))));
    end
  assign wire60 = $signed($signed(reg59));
  assign wire61 = $unsigned($signed($signed($signed({wire55}))));
endmodule

module module4
#(parameter param53 = (~|((|(((7'h41) && (8'hae)) ? (^(8'hac)) : (+(8'h9e)))) ? ((^~(^~(7'h43))) >> ((~^(7'h42)) ? ((8'hb0) - (8'h9e)) : ((8'hb6) && (8'hb0)))) : ((((8'hbb) ^~ (8'hb5)) ? ((8'hae) != (8'hb6)) : {(8'haa), (8'haf)}) ? (((8'hb4) ^~ (8'hb4)) ? ((8'hb6) ? (8'hab) : (8'hb6)) : ((8'h9c) ^ (8'hb6))) : (^~(-(8'hb0)))))), 
parameter param54 = (((((param53 != param53) ? param53 : param53) > param53) ? {((param53 ? param53 : param53) ? (param53 * param53) : (^~param53)), ({param53} >= (param53 == param53))} : (~^param53)) ? ((^((param53 < param53) ? (param53 ? (8'hbb) : (8'ha9)) : ((8'hb9) ? param53 : param53))) ? ({(8'hb4)} | (param53 && {param53})) : (8'hb0)) : (+(~|(8'ha6)))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(3'h5):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  assign wire10 = ($unsigned(wire9) ? (8'hbd) : $signed(wire8[(1'h1):(1'h0)]));
  assign wire11 = $unsigned(wire8);
  assign wire12 = (8'hb6);
  assign wire13 = ((wire11[(1'h0):(1'h0)] ?
                      (8'h9d) : $unsigned($signed((wire9 > wire10)))) == (($unsigned((wire6 ?
                          wire5 : wire9)) ^ $unsigned({wire8})) ?
                      $signed(wire9) : (wire10 ?
                          wire9 : wire12[(2'h3):(2'h3)])));
  assign wire14 = $unsigned($signed({wire8[(5'h10):(5'h10)]}));
  always
    @(posedge clk) begin
      reg15 <= (~|wire13[(4'hb):(3'h5)]);
      reg16 <= {((+{$unsigned(wire6), $signed(wire11)}) ?
              {wire6,
                  $signed($signed(wire9))} : (((8'ha6) + wire9) - $signed((wire9 ?
                  (8'h9f) : wire10)))),
          $unsigned($unsigned(wire9[(2'h2):(2'h2)]))};
      reg17 <= $signed((-wire8));
      if (((wire14 ~^ ($unsigned($signed(wire14)) ?
          $signed({wire8}) : wire5[(3'h5):(3'h5)])) - wire11))
        begin
          reg18 <= (+(!wire12[(2'h3):(1'h1)]));
          reg19 <= ({$signed($unsigned(wire12[(4'he):(2'h3)]))} != $unsigned(wire9[(1'h1):(1'h1)]));
          if (wire14[(1'h0):(1'h0)])
            begin
              reg20 <= (((+reg15[(1'h0):(1'h0)]) << reg15[(2'h2):(2'h2)]) ?
                  ((8'ha0) <= (({reg17,
                      wire11} < $signed(reg18)) & (|wire13[(4'hb):(3'h4)]))) : wire5[(1'h1):(1'h1)]);
            end
          else
            begin
              reg20 <= ($signed({$signed((+wire5))}) ?
                  wire13[(4'hb):(2'h3)] : ($signed($signed((wire14 ?
                      (7'h40) : wire11))) + $signed((~|(reg20 ?
                      reg15 : (8'hbd))))));
              reg21 <= ($unsigned($unsigned((^~wire9[(2'h3):(2'h2)]))) ^~ (^wire11));
              reg22 <= $unsigned((($unsigned((reg18 <<< wire14)) ?
                  reg18 : (+{wire6, wire8})) <<< reg18[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg18 <= ((8'ha9) <<< $signed((~((!wire14) ?
              (8'h9c) : $signed(reg20)))));
          if ({(reg17[(4'h8):(2'h3)] ?
                  $unsigned(reg21) : reg21[(1'h0):(1'h0)])})
            begin
              reg19 <= ({reg15[(3'h7):(1'h0)],
                      (wire13 << ($unsigned(wire9) | {reg16, wire7}))} ?
                  $unsigned($signed({wire8, $signed(reg16)})) : wire12);
              reg20 <= $signed(wire6[(4'h8):(1'h1)]);
            end
          else
            begin
              reg19 <= reg17;
              reg20 <= wire6[(1'h1):(1'h1)];
            end
        end
      reg23 <= (wire6 ? $unsigned($unsigned((8'ha3))) : wire11);
    end
  always
    @(posedge clk) begin
      reg24 <= reg22;
    end
  assign wire25 = ((!$unsigned((-reg24))) <<< wire7);
  assign wire26 = (((($unsigned(wire25) <<< (7'h44)) ?
                              (8'hb0) : $signed($signed(reg24))) ?
                          {(wire13[(4'hc):(3'h5)] ?
                                  (|(8'ha1)) : (reg19 <= wire5)),
                              (~reg19)} : ($unsigned((reg23 ?
                              wire12 : reg15)) * ($unsigned(reg15) ?
                              {wire7} : (wire14 ? wire12 : reg16)))) ?
                      ($unsigned($unsigned({(8'hbf), reg19})) ?
                          (((+reg15) << reg20[(3'h7):(3'h6)]) ?
                              $unsigned(wire12) : (~^(wire8 && reg15))) : {(&reg18),
                              ({reg18, reg22} ?
                                  (-wire25) : wire9)}) : (-$signed($unsigned(wire8))));
  always
    @(posedge clk) begin
      if ($unsigned(reg23[(1'h0):(1'h0)]))
        begin
          reg27 <= (^(~wire25[(4'hf):(3'h7)]));
          reg28 <= $unsigned($unsigned(wire8));
          reg29 <= $unsigned(wire25);
          reg30 <= (wire9[(1'h1):(1'h0)] & (&{(wire11[(1'h1):(1'h1)] && reg29),
              $signed($signed(reg16))}));
        end
      else
        begin
          reg27 <= wire14[(4'hf):(4'hb)];
          reg28 <= ($unsigned($unsigned($signed($unsigned((8'hab))))) ?
              $unsigned(reg21) : $unsigned({(reg20 <= $signed(reg22))}));
          if ((7'h43))
            begin
              reg29 <= reg15;
              reg30 <= $signed(reg20);
              reg31 <= (reg19 ?
                  reg30 : (($unsigned((wire7 == wire11)) ^ wire11[(2'h2):(1'h1)]) ?
                      (|reg28[(1'h1):(1'h1)]) : (&$unsigned(wire8[(3'h5):(2'h2)]))));
              reg32 <= reg19[(1'h1):(1'h1)];
            end
          else
            begin
              reg29 <= wire9;
              reg30 <= (reg24 - reg29[(1'h0):(1'h0)]);
              reg31 <= $signed({$unsigned((((8'hb4) ? wire11 : wire5) ?
                      reg22[(1'h1):(1'h1)] : $signed(reg18))),
                  wire14});
            end
        end
      if ((((reg16[(3'h4):(2'h3)] ?
              ((^~reg15) >= reg16[(3'h4):(1'h0)]) : {wire5, $unsigned(reg23)}) ?
          reg15[(1'h0):(1'h0)] : (($signed(reg17) - (wire5 ?
              reg19 : wire10)) | wire6)) == $unsigned(($signed($unsigned((7'h40))) | $unsigned(reg20[(2'h2):(2'h2)])))))
        begin
          reg33 <= (reg18 | $unsigned(((!$unsigned((7'h42))) + (reg24[(1'h0):(1'h0)] ?
              ((8'hb1) ? reg21 : reg20) : (^wire13)))));
        end
      else
        begin
          reg33 <= $signed((~(~&$unsigned($signed(wire25)))));
          reg34 <= reg21[(2'h3):(1'h0)];
          reg35 <= (~|reg27[(2'h3):(2'h2)]);
          if ($unsigned(reg35))
            begin
              reg36 <= ((^~$unsigned(((wire9 & (8'hb5)) ?
                  reg31 : (^wire5)))) * {(reg23 ?
                      {(!(8'had)), {reg32, reg19}} : ((8'hb7) != (reg16 ?
                          reg17 : (8'hb3))))});
              reg37 <= {wire26[(2'h2):(1'h1)],
                  $signed((wire26 >>> ((reg24 >= reg29) || wire9)))};
              reg38 <= reg23;
            end
          else
            begin
              reg36 <= ((+wire12[(4'he):(4'he)]) || (reg34[(3'h4):(3'h4)] ?
                  $signed($signed((wire6 ^~ reg19))) : (8'h9f)));
              reg37 <= $unsigned(($unsigned({$signed(wire9),
                  reg31[(4'hf):(4'hd)]}) ~^ $unsigned({reg24[(2'h2):(2'h2)]})));
              reg38 <= ($signed(($signed({reg35}) >>> (+$signed(reg35)))) ?
                  (~|reg24[(2'h2):(2'h2)]) : (^~((reg38 ?
                          reg24[(1'h0):(1'h0)] : wire7[(2'h2):(1'h0)]) ?
                      reg21 : $signed($signed(reg33)))));
            end
          reg39 <= $signed(($unsigned((^(^~reg23))) ?
              {reg28[(1'h1):(1'h1)]} : ($signed({reg24, reg36}) ?
                  {reg20, {reg16}} : ((reg22 > (8'ha8)) >> ((8'hac) ?
                      (8'hb0) : reg38)))));
        end
    end
  always
    @(posedge clk) begin
      if (wire5[(3'h4):(2'h2)])
        begin
          reg40 <= (~|$signed((+$unsigned((-reg36)))));
          reg41 <= wire14;
        end
      else
        begin
          reg40 <= $signed($signed($signed({(reg30 ? (8'ha2) : reg37)})));
          if (reg32[(2'h3):(2'h3)])
            begin
              reg41 <= reg16;
              reg42 <= (^~(&wire10));
            end
          else
            begin
              reg41 <= $signed(((-wire25[(5'h12):(4'hb)]) ?
                  $unsigned(({wire12} ?
                      reg30[(2'h3):(1'h1)] : (~^(8'hb0)))) : $unsigned($unsigned((-reg19)))));
              reg42 <= $unsigned($signed($unsigned(reg42[(2'h3):(2'h2)])));
              reg43 <= ((reg41 ?
                      $signed((reg27 >> wire6[(4'hd):(2'h2)])) : (+(~reg32))) ?
                  {$unsigned($signed((reg20 ^ wire13))),
                      reg31[(3'h4):(2'h3)]} : ({(^~(reg28 ?
                          reg38 : wire7))} ^ reg28));
            end
          if ({reg40, (&reg34[(3'h4):(1'h0)])})
            begin
              reg44 <= {{$unsigned((8'h9d)), wire14[(4'he):(2'h3)]},
                  ({((wire14 & reg23) <<< (reg34 ~^ reg39)),
                      ((~|(8'ha0)) ?
                          $unsigned(reg27) : (+reg16))} < wire14[(4'hb):(4'hb)])};
              reg45 <= (8'ha0);
              reg46 <= reg42;
              reg47 <= ((($unsigned({reg36, (8'ha6)}) ?
                  (^~(&reg43)) : (8'ha0)) == $signed($signed((8'ha3)))) > $signed((^$unsigned($unsigned(reg41)))));
              reg48 <= reg43;
            end
          else
            begin
              reg44 <= wire5[(2'h3):(1'h1)];
            end
        end
      reg49 <= {$signed(($unsigned((reg42 != reg45)) >= reg27[(3'h4):(2'h3)])),
          $signed(reg19)};
      if ((~{wire25, $unsigned(reg29)}))
        begin
          reg50 <= reg16[(2'h3):(2'h2)];
          reg51 <= wire6;
          reg52 <= ((8'ha7) <<< $unsigned(($unsigned(reg22[(3'h6):(2'h3)]) ?
              (^(~|reg34)) : {$unsigned((8'ha0)), reg20[(3'h5):(2'h2)]})));
        end
      else
        begin
          reg50 <= (^$signed($signed(reg49)));
          reg51 <= (~|reg16);
        end
    end
endmodule
