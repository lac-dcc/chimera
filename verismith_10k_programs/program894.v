module top
#(parameter param27 = ({((&{(7'h40), (8'h9f)}) ? (8'haf) : (~&(-(8'hae))))} << ((-(-((8'hae) > (8'ha3)))) != ({(~(8'ha1))} >= {(~&(8'ha8)), ((8'hb6) | (8'hb5))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $signed(((&$signed(wire0[(4'h8):(3'h5)])) - $signed($unsigned((8'hb6)))));
  assign wire5 = (wire1 ?
                     $signed(($signed($signed((8'ha6))) ?
                         wire4 : wire3[(3'h7):(3'h4)])) : $signed($signed((-((7'h43) != (8'ha2))))));
  assign wire6 = wire2;
  assign wire7 = $signed((&$signed(wire1)));
  always
    @(posedge clk) begin
      reg8 <= $unsigned((($signed($unsigned(wire7)) * $signed((wire5 + wire4))) ?
          (&$signed(wire7)) : $signed(wire0)));
      reg9 <= wire0;
      reg10 <= ($signed((~^(-(wire5 ? wire5 : wire5)))) == {wire1});
    end
  assign wire11 = ((!wire5) && (~|{(reg8 + (^~wire1)),
                      $unsigned((reg10 ? wire0 : wire1))}));
  assign wire12 = $signed(({reg10[(1'h0):(1'h0)]} < $signed($unsigned((reg8 ?
                      reg10 : wire5)))));
  assign wire13 = {$unsigned($unsigned(wire12)), {$signed(wire1)}};
  assign wire14 = $signed((~$unsigned({(wire3 < wire5), $unsigned((8'hbf))})));
  assign wire15 = wire7;
  assign wire16 = $unsigned($unsigned((((-wire7) ? (reg10 <= wire15) : wire13) ?
                      $unsigned((wire14 >> wire0)) : {$signed(wire0)})));
  always
    @(posedge clk) begin
      if (wire12)
        begin
          reg17 <= $signed(reg8);
          reg18 <= (wire11 ?
              {{($unsigned(wire11) ? (~&(8'ha9)) : ((8'hb7) && wire5)),
                      wire3[(2'h2):(1'h1)]}} : ((&$signed((reg8 ?
                      reg9 : wire4))) ?
                  $signed(wire15[(2'h3):(1'h0)]) : $unsigned({wire16})));
          reg19 <= (~^wire11);
        end
      else
        begin
          reg17 <= $signed($unsigned(wire2));
          reg18 <= ($signed(({wire12[(2'h3):(2'h3)]} ?
              reg9[(3'h6):(2'h2)] : ((wire11 ~^ wire0) ?
                  (^reg8) : ((8'h9d) << (8'h9e))))) ~^ ({$unsigned(wire7)} ?
              $signed($signed(wire13)) : wire6));
          reg19 <= $unsigned((wire4[(3'h7):(2'h3)] ?
              reg19[(4'h8):(3'h6)] : {{$unsigned((8'ha0))},
                  $signed((+wire7))}));
          reg20 <= $unsigned(wire16);
        end
      if (((((wire5[(1'h1):(1'h1)] ?
                  (wire3 > reg17) : (wire5 <= wire13)) ~^ {((8'ha1) ?
                      wire2 : wire3),
                  $unsigned(wire2)}) ?
              (~&(8'hbf)) : (!wire14)) ?
          ({$unsigned((reg19 >> wire13))} ?
              {$signed({wire5})} : ($unsigned(wire7) ~^ ($signed(wire11) * $signed(wire13)))) : ($unsigned(wire16[(3'h4):(2'h3)]) ?
              (($signed(wire0) ? (|wire15) : $unsigned(wire15)) ?
                  wire0 : (wire12 == (reg20 <= wire5))) : wire3)))
        begin
          if ($unsigned(reg18))
            begin
              reg21 <= (reg17[(1'h1):(1'h1)] ?
                  $unsigned((wire15 ?
                      reg18[(1'h0):(1'h0)] : $signed((~|wire15)))) : $signed((7'h43)));
              reg22 <= (($signed(wire12) ~^ (wire14[(3'h4):(2'h2)] ?
                  wire12 : reg20)) - wire7);
              reg23 <= wire15;
            end
          else
            begin
              reg21 <= $unsigned((8'hb1));
            end
          reg24 <= ({((~&$signed((8'ha8))) ?
                  $unsigned($signed(reg21)) : wire13[(4'hb):(2'h2)]),
              {reg18}} >= (wire15[(2'h3):(1'h1)] && wire2[(4'he):(4'hc)]));
        end
      else
        begin
          reg21 <= (~&wire14);
          reg22 <= (!$signed(((^$signed(wire16)) ?
              {reg20, $signed(reg24)} : (^reg20))));
          reg23 <= ($unsigned(({reg8} ?
                  $unsigned(reg20[(4'h8):(4'h8)]) : (8'hb7))) ?
              $unsigned($signed($unsigned($unsigned((8'h9f))))) : (~($signed((wire7 >= wire6)) ~^ $unsigned($unsigned(wire14)))));
        end
      reg25 <= reg9;
      reg26 <= (wire7[(2'h3):(2'h2)] && (~&((&reg23) ?
          reg10 : {$unsigned((8'ha7)), (!reg23)})));
    end
endmodule
