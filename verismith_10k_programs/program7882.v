module top
#(parameter param47 = (-(-(((&(8'ha2)) & {(8'ha1)}) <= (-{(8'hb4)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg46,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire4 = ((wire1[(3'h6):(3'h4)] ?
                     $unsigned((~|((8'h9c) < wire3))) : (wire3 ?
                         $signed((!wire1)) : $signed(wire3))) + $signed($unsigned((~(^wire2)))));
  assign wire5 = ((^~{{(~&wire0), $signed(wire0)},
                         ($unsigned(wire0) ? wire4 : $unsigned(wire0))}) ?
                     wire0 : wire3);
  assign wire6 = wire5[(3'h5):(2'h2)];
  assign wire7 = wire3[(4'he):(3'h7)];
  module8 #() modinst34 (wire33, clk, wire7, wire2, wire0, wire3);
  assign wire35 = $unsigned($signed(wire6));
  assign wire36 = wire2[(2'h2):(2'h2)];
  assign wire37 = $signed((!(((wire35 ? wire1 : (8'hb4)) << $unsigned(wire6)) ?
                      $signed($unsigned(wire35)) : (^(wire35 ?
                          (8'ha9) : wire7)))));
  assign wire38 = (wire2[(1'h0):(1'h0)] ?
                      (~&$unsigned({(wire2 - wire33)})) : {wire35[(1'h0):(1'h0)],
                          $unsigned(wire5[(4'h8):(3'h6)])});
  assign wire39 = ($signed(wire5[(5'h10):(5'h10)]) ? wire6 : (8'ha9));
  assign wire40 = ({$unsigned($signed((wire35 ~^ wire35)))} == (+wire5[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg41 <= $signed((&(!(7'h41))));
      reg42 <= $signed((~^($unsigned(wire35[(4'ha):(3'h7)]) & {$signed((8'hbe)),
          $unsigned(wire39)})));
    end
  assign wire43 = wire5;
  assign wire44 = (~|(wire2 ?
                      ($signed(wire1) ?
                          (reg42[(1'h1):(1'h0)] ?
                              (reg42 - wire37) : $signed(wire38)) : (((8'ha8) + wire2) | (wire4 | wire39))) : wire0));
  assign wire45 = {(wire6 ? (~&reg42) : wire39[(3'h4):(2'h2)])};
  always
    @(posedge clk) begin
      reg46 <= (|(!$signed((&$signed(wire35)))));
    end
endmodule

module module8
#(parameter param32 = {(((7'h42) ? (!{(8'hbe), (8'hb8)}) : (((8'h9e) ? (8'hab) : (8'hb7)) + ((8'hbe) ? (8'hb8) : (8'hb7)))) ? (&(((8'ha3) >= (8'hbb)) - ((8'haa) ? (8'ha2) : (8'ha9)))) : (({(8'ha1), (8'ha4)} ? ((8'hbe) | (8'hb3)) : (8'ha7)) ? (((8'ha7) < (7'h43)) & {(8'ha3), (8'haa)}) : ((&(8'ha4)) ? ((8'ha3) & (8'ha2)) : ((7'h40) ? (8'hb8) : (8'h9f)))))})
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  assign y = {wire31,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = $unsigned($unsigned((((wire9 ?
                          (8'ha6) : wire12) + (wire12 ^ (8'hb3))) ?
                      ($unsigned(wire9) && {wire12}) : wire10)));
  assign wire14 = {wire10[(2'h3):(1'h0)]};
  always
    @(posedge clk) begin
      reg15 <= $unsigned({$signed({wire12[(4'h8):(2'h2)], (wire14 > wire10)}),
          $unsigned(wire11)});
      reg16 <= reg15[(5'h12):(1'h0)];
      if (reg16)
        begin
          reg17 <= ((wire10 ~^ $signed(({(8'hba), wire9} ?
              (|wire14) : {reg15}))) < (+$unsigned($signed($unsigned(wire10)))));
        end
      else
        begin
          reg17 <= (&(((((7'h43) ~^ wire13) && (wire13 >= wire10)) ?
                  (8'h9c) : wire9[(1'h1):(1'h1)]) ?
              (!wire13) : $unsigned((wire10[(3'h7):(3'h6)] <<< (wire14 && (8'haf))))));
          reg18 <= $unsigned(wire11);
        end
      if (((($signed(wire14[(3'h7):(3'h5)]) + $signed(wire14[(3'h6):(3'h6)])) ?
              (($signed(reg15) ?
                  $signed(wire10) : ((8'had) ?
                      wire10 : reg18)) >= (~&wire13[(1'h0):(1'h0)])) : (-(reg18 > wire14))) ?
          (+$signed($signed(wire9))) : wire12))
        begin
          reg19 <= $unsigned((wire9[(4'hc):(4'h8)] ?
              wire12[(1'h1):(1'h1)] : wire10));
          reg20 <= reg17;
          reg21 <= wire13;
          reg22 <= wire9[(2'h2):(2'h2)];
          if ((-$signed((^~((wire12 * wire11) ? $signed(reg17) : wire13)))))
            begin
              reg23 <= (^~(~&(reg22[(4'h9):(2'h2)] << (-((7'h41) + wire9)))));
              reg24 <= $unsigned((&wire13));
              reg25 <= (((((&wire9) ?
                  $signed(wire12) : {reg23}) > reg24[(1'h0):(1'h0)]) >= (~|(~^(-wire12)))) + $signed(reg16));
            end
          else
            begin
              reg23 <= wire10[(3'h7):(3'h6)];
            end
        end
      else
        begin
          reg19 <= reg25[(3'h6):(3'h6)];
          if ((({($signed(reg23) ? (reg22 != reg21) : (8'ha2)),
              (8'ha7)} + $signed($unsigned($signed(reg25)))) <= $signed(wire11)))
            begin
              reg20 <= reg17;
              reg21 <= (~|wire14[(1'h0):(1'h0)]);
              reg22 <= (reg17[(1'h1):(1'h1)] ?
                  wire13[(4'h8):(3'h5)] : ((~|reg15[(3'h5):(2'h2)]) ?
                      (7'h43) : {$unsigned((reg21 > wire13)),
                          reg16[(4'ha):(4'h9)]}));
              reg23 <= $unsigned(((reg19[(3'h5):(3'h5)] * wire12) ?
                  (8'hb8) : reg16));
              reg24 <= (!$unsigned(reg16[(4'ha):(2'h2)]));
            end
          else
            begin
              reg20 <= $unsigned(reg17);
              reg21 <= $signed(reg25);
            end
          if ({(&{{$signed(reg22)}}), wire13[(3'h6):(2'h2)]})
            begin
              reg25 <= (((!(reg23[(2'h2):(2'h2)] ~^ $unsigned(reg16))) * $unsigned({$unsigned(wire10),
                      reg22})) ?
                  $unsigned(reg15) : $unsigned($signed((|(|reg21)))));
              reg26 <= reg20;
            end
          else
            begin
              reg25 <= (($signed(reg15) ?
                      ({wire14[(3'h6):(2'h3)], (|reg23)} - ((~^(8'hbd)) ?
                          (reg19 + reg16) : ((8'ha8) - wire13))) : (reg20 | wire12)) ?
                  (~^((^~(wire12 || reg26)) ?
                      (!{wire14,
                          wire9}) : $unsigned(wire13[(3'h4):(1'h1)]))) : reg20);
              reg26 <= ($signed(($unsigned($signed(reg16)) == wire14[(3'h7):(3'h6)])) ?
                  $signed((^$unsigned(reg19))) : wire10);
              reg27 <= ((((reg20[(1'h1):(1'h1)] & $unsigned(reg15)) ?
                      reg21[(2'h3):(2'h2)] : (wire13[(3'h4):(2'h2)] ?
                          {reg16} : reg25)) || reg26) ?
                  {(~^{{reg25, wire12}}),
                      $unsigned($signed({(8'hb4), wire10}))} : reg17);
            end
          reg28 <= (($signed(($signed(wire9) ? (~reg27) : (reg16 >= reg27))) ?
              ($unsigned((^~reg27)) ?
                  (-(!reg22)) : (reg24[(3'h7):(2'h3)] ?
                      wire12 : reg22[(4'hd):(4'h8)])) : (+($unsigned(wire13) ?
                  (-reg20) : wire12))) && {$signed((reg25 ?
                  (~|reg17) : wire11)),
              $signed(reg16)});
          reg29 <= wire9;
        end
      reg30 <= reg16[(2'h3):(2'h3)];
    end
  assign wire31 = $signed($signed(($signed((wire11 << reg29)) ?
                      (wire10 <= reg26) : reg25)));
endmodule
