module top
#(parameter param50 = ({((&{(8'ha7)}) ? (((8'ha3) <<< (8'hb1)) ? ((8'ha2) < (8'hb1)) : (!(8'hbf))) : (^~((8'hb2) <<< (8'ha8)))), ((8'hac) ? (((8'hb8) != (8'h9f)) ^~ {(8'ha0)}) : {{(7'h42), (8'hb2)}})} <<< (~^(&{{(8'had), (7'h43)}}))), 
parameter param51 = (8'ha2))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire45;
  assign y = {wire49, wire48, wire47, wire5, wire6, wire45, (1'h0)};
  assign wire5 = {wire0[(4'h8):(3'h6)]};
  assign wire6 = (wire5[(1'h1):(1'h1)] ~^ (^~wire3));
  module7 #() modinst46 (wire45, clk, wire1, wire4, wire2, wire5, wire6);
  assign wire47 = ((~$unsigned({$unsigned(wire6), (wire2 >>> wire4)})) ?
                      $signed(({wire6, wire0} ?
                          ((-wire0) ?
                              $unsigned(wire0) : {wire6,
                                  wire45}) : wire1)) : wire4[(4'hc):(2'h3)]);
  assign wire48 = ($signed($signed(wire6[(2'h2):(1'h1)])) ?
                      wire2[(3'h6):(1'h1)] : ($unsigned((8'ha1)) ~^ wire45[(4'h8):(2'h2)]));
  assign wire49 = ({(|$signed(wire47[(4'hf):(3'h6)])),
                      wire3[(3'h6):(3'h4)]} >> wire6[(5'h13):(3'h4)]);
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire21,
                 wire20,
                 wire15,
                 wire14,
                 wire13,
                 reg37,
                 reg35,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = ((+($signed((-wire12)) ?
                      $signed($signed(wire8)) : wire12)) * {$unsigned(wire9[(4'hf):(1'h0)])});
  assign wire14 = wire13;
  assign wire15 = wire14;
  always
    @(posedge clk) begin
      reg16 <= $signed(wire8[(4'hf):(3'h7)]);
      reg17 <= (7'h43);
      reg18 <= (!wire10[(1'h0):(1'h0)]);
      reg19 <= $signed((^~$signed(reg18)));
    end
  assign wire20 = wire12[(4'h9):(4'h9)];
  assign wire21 = $signed(wire11);
  always
    @(posedge clk) begin
      if ((($unsigned($signed($unsigned(wire12))) ?
          ($unsigned({wire8}) + ($signed(wire8) ?
              (wire12 ? wire12 : wire13) : (reg19 + wire20))) : {(8'hbc),
              (^(wire10 <= wire11))}) & (~|(reg18[(3'h4):(2'h2)] ?
          $signed((wire9 ? (8'ha8) : reg19)) : $unsigned((~|wire11))))))
        begin
          if (({(~^$signed({(8'hab), wire8})),
                  (wire21[(4'hf):(4'ha)] ?
                      ((wire10 || reg18) ~^ $unsigned(wire21)) : (7'h41))} ?
              (~$signed((wire20 && $unsigned((8'haa))))) : ((($signed(wire9) - $signed(wire8)) ?
                      ((~&wire13) & (wire21 ?
                          wire12 : wire21)) : wire11[(4'hc):(3'h5)]) ?
                  $unsigned(({reg17,
                      wire15} ~^ wire8[(1'h1):(1'h0)])) : reg17)))
            begin
              reg22 <= wire10;
            end
          else
            begin
              reg22 <= ($signed({(!wire14), $signed($unsigned(reg17))}) ?
                  wire10[(1'h1):(1'h1)] : (~reg22[(4'h9):(3'h4)]));
              reg23 <= $unsigned({{(reg22 ?
                          ((8'hb8) ? wire8 : wire11) : (wire21 ?
                              wire21 : reg17)),
                      (^~wire10[(1'h0):(1'h0)])}});
              reg24 <= ($unsigned({{(8'h9d)}, {(&(8'hb6)), $signed(wire8)}}) ?
                  (wire14 == (reg16[(3'h6):(1'h0)] <<< $unsigned((reg22 <= wire15)))) : ((wire9[(4'h9):(4'h9)] <= wire8) * wire10));
              reg25 <= ((^~$unsigned($signed(wire11))) < (((~|$unsigned(reg16)) && {(+reg19),
                  wire8}) && (+(&reg23))));
              reg26 <= $signed($signed((~&$unsigned((reg23 ? wire8 : reg18)))));
            end
          reg27 <= $unsigned(wire14);
          reg28 <= {(reg22 | ($unsigned(((8'ha6) ? (8'hb5) : (8'hb4))) ?
                  wire20 : wire20[(5'h12):(3'h6)])),
              $unsigned(reg22)};
        end
      else
        begin
          if ($signed(reg28))
            begin
              reg22 <= {(wire10[(1'h1):(1'h0)] ?
                      reg16[(3'h4):(2'h3)] : {$unsigned(wire14),
                          ($unsigned(wire15) << $unsigned(wire11))}),
                  {wire15[(3'h6):(1'h1)]}};
              reg23 <= (8'hac);
              reg24 <= ($signed((&$signed(wire14[(2'h2):(1'h1)]))) && (($unsigned($unsigned(reg28)) != (+wire12[(3'h5):(1'h1)])) <<< $signed((~&wire13))));
            end
          else
            begin
              reg22 <= (((wire11[(4'hf):(2'h2)] ?
                      wire20 : $unsigned($unsigned(reg28))) << (reg24[(1'h1):(1'h1)] ?
                      reg23 : {(&wire15)})) ?
                  $signed((wire13[(3'h6):(1'h0)] ?
                      $signed($unsigned((8'hb1))) : {$unsigned(wire9),
                          $signed(reg19)})) : reg24[(3'h7):(3'h7)]);
              reg23 <= ($unsigned((~|((reg22 >= reg17) ?
                      $signed(wire9) : reg28[(3'h6):(2'h2)]))) ?
                  wire8 : wire10);
              reg24 <= $signed($signed({(wire20[(5'h14):(4'hc)] | ((8'ha6) ?
                      (8'ha4) : (8'ha7))),
                  {(~|(8'hb2)), {(8'hbc), (7'h43)}}}));
              reg25 <= (wire8[(2'h3):(1'h0)] ?
                  (!({$unsigned(wire11)} ?
                      reg28[(1'h0):(1'h0)] : (^$signed(wire14)))) : reg27[(1'h0):(1'h0)]);
            end
          reg26 <= (8'hbb);
          if ((+((wire10[(1'h1):(1'h0)] >> reg17[(3'h6):(3'h5)]) >>> reg26[(2'h2):(1'h0)])))
            begin
              reg27 <= $signed(($signed(reg22) ?
                  $signed((~&$unsigned(reg17))) : ($signed((^wire8)) ?
                      (|$signed(reg22)) : $signed($unsigned(wire12)))));
            end
          else
            begin
              reg27 <= ((~&$signed(({wire14, wire10} == (wire13 ^~ reg26)))) ?
                  reg19[(2'h2):(1'h1)] : $signed(wire13));
              reg28 <= {((($signed(wire11) - wire11[(4'hb):(3'h4)]) ?
                          reg16 : $unsigned(wire20)) ?
                      (^(wire14 > (&wire9))) : (!(wire21 ?
                          {reg22, reg27} : (reg28 ? wire10 : reg28)))),
                  $unsigned(wire11)};
              reg29 <= (($unsigned({(wire10 ? wire10 : reg23),
                          (wire10 ? (8'hb9) : (8'hb6))}) ?
                      reg24 : (reg26 ?
                          (~(^wire21)) : ($signed(reg22) ~^ (reg28 ?
                              wire8 : reg18)))) ?
                  (~^wire20[(5'h14):(5'h14)]) : (~$unsigned(wire12)));
            end
          reg30 <= ((((reg17[(2'h3):(1'h0)] ? $signed(reg18) : {wire9, reg18}) ?
              {reg24} : {(reg23 ?
                      wire14 : wire21)}) >>> $unsigned(wire11)) >> $signed(wire10));
          if (($signed($signed($signed((!reg26)))) ?
              (&($unsigned((reg30 > (8'ha1))) ?
                  (reg25 ?
                      wire15[(2'h2):(2'h2)] : reg27[(2'h3):(1'h1)]) : (~^(8'ha2)))) : (~^(reg19 ?
                  reg26 : ($signed(reg26) ? {wire20} : {reg19, wire12})))))
            begin
              reg31 <= {$unsigned($signed((&wire13)))};
            end
          else
            begin
              reg31 <= {$signed($unsigned($signed((wire13 >>> wire10)))),
                  (^$unsigned((~^$signed(wire21))))};
              reg32 <= ((7'h44) ?
                  $unsigned(reg26[(2'h3):(1'h1)]) : $unsigned({$unsigned({reg22,
                          wire9})}));
              reg33 <= reg22;
              reg34 <= $unsigned(reg28);
              reg35 <= (-(|wire8[(4'he):(3'h6)]));
            end
        end
    end
  assign wire36 = reg16[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg37 <= $signed({wire8[(4'h9):(2'h2)],
          (wire12 ^~ (!((8'haa) > reg18)))});
    end
  assign wire38 = ($unsigned((reg25[(3'h6):(2'h3)] ~^ (reg18 ?
                      (+wire20) : $unsigned(reg22)))) > wire36[(1'h1):(1'h0)]);
  assign wire39 = (wire8[(5'h13):(4'hf)] >>> $unsigned($signed(wire12[(2'h2):(1'h0)])));
  assign wire40 = {reg27, wire36[(1'h0):(1'h0)]};
  assign wire41 = $unsigned(($signed({$signed(reg18)}) >> ((reg27[(3'h6):(1'h1)] ?
                      $unsigned(wire14) : reg30[(4'hb):(3'h5)]) | ((^~reg28) <<< (&(8'hac))))));
  assign wire42 = reg29[(4'ha):(2'h2)];
  assign wire43 = (~^reg16);
  assign wire44 = {(^(~^(reg17[(5'h10):(4'hf)] <<< (-reg32)))),
                      (+(reg23 >> (wire36 ?
                          $unsigned(wire9) : $unsigned(wire14))))};
endmodule
