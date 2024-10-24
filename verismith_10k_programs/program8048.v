module top
#(parameter param48 = (({(((8'hb6) << (8'hb1)) ? ((7'h43) ? (8'had) : (7'h40)) : ((8'h9e) ^~ (8'hb9))), (~((7'h42) ? (8'hbe) : (8'ha8)))} | ({{(7'h42), (7'h42)}, ((8'ha2) ? (8'h9d) : (8'haa))} && {(~&(8'hbd)), ((8'ha0) << (8'hb1))})) ? (((((8'hb1) <<< (8'hb3)) * ((8'haf) + (7'h40))) | (((8'haa) & (8'ha7)) ? {(7'h41)} : ((8'hb5) ? (8'h9c) : (8'h9f)))) ? {(~|(^~(8'hb3)))} : (8'hb9)) : (((!{(8'hb6)}) ^ (((8'hae) ? (8'hac) : (7'h44)) ? (~&(8'hab)) : (!(7'h42)))) ? ({((8'hab) ^~ (8'ha9)), (8'ha2)} >>> (!(^(7'h41)))) : (&{((8'hb2) ? (8'ha7) : (8'hb0))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire19;
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire4,
                 wire5,
                 wire6,
                 wire19,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 (1'h0)};
  assign wire4 = wire2[(2'h3):(1'h1)];
  assign wire5 = $unsigned($signed((~^$unsigned((wire4 + wire0)))));
  assign wire6 = {((((!wire4) ?
                         (~|wire2) : wire2[(3'h6):(2'h3)]) <= {wire5}) * $unsigned((wire1 * wire1[(3'h6):(3'h6)])))};
  module7 #() modinst20 (wire19, clk, wire3, wire1, wire4, wire0, wire5);
  always
    @(posedge clk) begin
      if ((~|wire6[(3'h4):(1'h1)]))
        begin
          if ((wire0[(5'h13):(4'hc)] ?
              ($unsigned((wire6 ?
                  (wire5 || wire4) : $signed((8'hbe)))) + (+$unsigned(wire6))) : $signed((+$signed((wire0 == wire2))))))
            begin
              reg21 <= ($unsigned($unsigned((~^(wire1 >= wire19)))) >>> (($signed($signed((8'hbb))) < {(wire3 ~^ wire6)}) | ((|(^~(8'ha9))) ?
                  (^(wire19 ? wire6 : wire3)) : ((|wire2) ?
                      (wire6 ? wire1 : wire0) : {wire19}))));
              reg22 <= reg21[(4'h9):(1'h1)];
              reg23 <= ($signed(wire3[(4'h8):(1'h0)]) & ($signed(wire4) + $signed(wire5)));
              reg24 <= (-(!$unsigned(reg21)));
              reg25 <= wire19[(3'h5):(2'h2)];
            end
          else
            begin
              reg21 <= (&reg25[(4'hc):(3'h6)]);
              reg22 <= $signed($unsigned($unsigned(wire2[(4'h8):(1'h0)])));
              reg23 <= (^~($unsigned(($signed(wire1) && (~|(8'hbf)))) ?
                  ((|$unsigned(wire19)) >>> $signed((~|wire1))) : (~|reg24[(4'h8):(3'h4)])));
              reg24 <= $signed((|wire5));
            end
          reg26 <= (^({reg23[(5'h11):(4'hf)], $signed((~^wire1))} ?
              (reg25[(1'h1):(1'h0)] ^ ((wire1 << wire3) <<< (reg23 || (8'hbd)))) : (-(~reg25[(3'h6):(2'h3)]))));
          reg27 <= $unsigned({(8'ha9)});
          reg28 <= (({reg25[(4'h8):(4'h8)]} ^ (reg27[(3'h5):(1'h0)] << $unsigned($signed(wire6)))) ?
              wire3 : (wire0 ~^ ($unsigned($signed(wire0)) ?
                  wire6[(4'h8):(1'h0)] : (|(reg27 << wire4)))));
        end
      else
        begin
          reg21 <= (^~(8'hb0));
          reg22 <= wire1;
          reg23 <= wire1;
          if (wire5)
            begin
              reg24 <= ({reg22, reg28} ?
                  wire5 : (($signed($signed((8'hbf))) ?
                      reg23[(2'h3):(2'h3)] : (8'hb4)) >= reg22));
              reg25 <= wire5;
            end
          else
            begin
              reg24 <= ((8'haa) ?
                  $signed($signed(wire3)) : (reg25[(4'hd):(4'hb)] && ($signed((~wire2)) ?
                      $unsigned($unsigned(reg21)) : {(reg21 ^~ wire5),
                          wire3[(4'ha):(4'h9)]})));
              reg25 <= ($signed(reg22) | ((|(~^(wire1 <<< wire3))) && reg21));
              reg26 <= ($signed(($unsigned((|reg27)) && ($signed((7'h43)) ?
                  $signed(wire0) : $signed(wire4)))) > (reg27[(1'h1):(1'h1)] ?
                  $unsigned(wire0[(5'h14):(5'h10)]) : ((8'ha4) & (~|$signed(reg27)))));
              reg27 <= ($unsigned(((^~(~^reg22)) >> (!{reg22}))) ?
                  (reg22[(1'h0):(1'h0)] ?
                      {{(+(8'hb6))},
                          (!wire0)} : wire19) : $unsigned(($signed($unsigned(reg27)) | ((wire2 || wire1) ~^ wire6[(1'h1):(1'h1)]))));
              reg28 <= $signed(reg24[(3'h5):(1'h0)]);
            end
          reg29 <= (($unsigned(wire0[(4'hb):(2'h2)]) ?
              ($unsigned($unsigned((8'hb0))) ?
                  wire3 : {(reg26 ? wire4 : wire5),
                      ((8'hbc) ?
                          (8'hbb) : wire6)}) : reg27) > $unsigned($unsigned({reg25[(2'h2):(2'h2)],
              wire0})));
        end
      reg30 <= (!$unsigned((~&$unsigned((&reg29)))));
      reg31 <= {$unsigned($signed(($unsigned(wire5) ?
              $unsigned((8'h9c)) : {reg23, reg22}))),
          (+(wire19[(1'h1):(1'h0)] ^~ $unsigned($unsigned(reg28))))};
      reg32 <= ((8'ha8) ?
          ({wire5[(5'h15):(5'h12)]} == reg27) : ($unsigned(reg22[(1'h1):(1'h0)]) || ((8'h9f) ^ (8'ha1))));
    end
  assign wire33 = $unsigned(reg26);
  assign wire34 = $unsigned((~^reg28));
  assign wire35 = (((($unsigned(wire19) * (reg29 >> reg23)) <= $unsigned(reg31[(2'h3):(1'h0)])) <= $signed((^~(wire1 || reg25)))) ?
                      ($signed((((8'hac) + reg27) && (~^wire33))) > $signed({(wire34 ^ reg24)})) : wire6[(2'h3):(1'h0)]);
  assign wire36 = ($unsigned((-($signed(reg26) ?
                      (wire2 * wire2) : $signed(wire1)))) + wire4);
  assign wire37 = wire0;
  assign wire38 = $unsigned((wire0[(3'h6):(1'h1)] ?
                      (&(&(wire2 ? reg31 : reg22))) : $unsigned((8'ha0))));
  assign wire39 = (($signed($signed(((8'hbb) <<< reg28))) ?
                      {(8'hbf)} : reg28[(5'h12):(2'h3)]) != {$unsigned(wire35),
                      ({(wire5 ? reg28 : wire33)} != wire0)});
  always
    @(posedge clk) begin
      reg40 <= (reg24[(1'h1):(1'h1)] >= wire37[(2'h2):(2'h2)]);
      reg41 <= $signed($signed(((-(reg40 ? (8'hba) : reg21)) ?
          $signed($unsigned(wire37)) : {$signed(reg21),
              reg22[(2'h3):(1'h1)]})));
      reg42 <= wire0;
      reg43 <= ((~^$unsigned(reg40[(4'hd):(4'ha)])) || ($unsigned($signed((wire38 >= wire3))) ?
          wire38 : reg26));
    end
  assign wire44 = $unsigned((&$unsigned($signed(wire37))));
  assign wire45 = (&(reg32[(1'h1):(1'h0)] * (8'haf)));
  assign wire46 = wire3[(3'h5):(2'h3)];
  assign wire47 = (reg25 >>> ((~&(8'hb5)) >>> wire5[(3'h7):(2'h3)]));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  assign y = {wire18, wire17, wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = wire12[(4'hf):(3'h4)];
  assign wire14 = $unsigned($signed(((8'hb2) ?
                      {(wire11 ? wire13 : wire11)} : (8'hbd))));
  assign wire15 = (wire13[(1'h0):(1'h0)] << ($signed($unsigned((^wire14))) ^~ {(!{wire12,
                          wire9})}));
  assign wire16 = ($unsigned($unsigned($unsigned((wire11 ^~ wire11)))) | (8'hb7));
  assign wire17 = {(-(wire15[(3'h5):(2'h3)] ^ {$signed(wire16),
                          ((8'ha6) ? (8'h9c) : wire14)}))};
  assign wire18 = $unsigned((-wire13));
endmodule
