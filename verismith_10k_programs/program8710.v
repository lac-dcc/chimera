module top
#(parameter param36 = ((^~(((-(8'haf)) == ((8'h9e) * (8'h9d))) > (((8'had) << (8'ha2)) ? (^(8'h9f)) : (~^(8'hae))))) ~^ ((^~(((8'hab) * (7'h42)) <= (^(8'ha8)))) ? ((((8'h9d) || (8'ha2)) ~^ {(8'hab)}) ? ((^~(8'hb6)) >>> (^(8'h9c))) : (~^(^(8'ha2)))) : (((&(8'hbb)) ? {(8'hb3), (8'hbc)} : ((8'hb8) ? (8'hb4) : (7'h44))) ? (~|((8'hbf) << (8'hb9))) : (((7'h40) << (8'hb6)) + ((8'h9d) ? (7'h43) : (7'h43)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = (~^wire0[(2'h2):(1'h1)]);
  assign wire6 = (($unsigned(wire3) <<< $unsigned((~|$unsigned(wire2)))) >> (wire4[(4'ha):(3'h7)] >= $signed(((wire0 << wire1) ?
                     (~&wire1) : $signed(wire1)))));
  assign wire7 = {($unsigned($unsigned((wire3 ? wire0 : wire3))) ?
                         $signed((~&{wire1})) : $unsigned((~$signed(wire1)))),
                     $signed(wire5[(4'h9):(3'h4)])};
  assign wire8 = ({$signed((!(wire7 | wire7))),
                         $signed((wire1 ? (^wire4) : (wire6 >>> wire2)))} ?
                     $signed(wire0) : $unsigned({$signed($signed(wire5)),
                         wire7}));
  assign wire9 = wire4[(2'h3):(1'h1)];
  assign wire10 = ((-($signed({wire2, wire8}) ?
                      wire8 : wire7[(3'h4):(2'h2)])) - (^(wire5[(4'h9):(3'h5)] | (wire7 + (-wire7)))));
  assign wire11 = ((($unsigned(wire9[(5'h11):(3'h6)]) == wire4[(5'h15):(5'h13)]) ?
                          (wire0 & ($signed(wire9) ?
                              (-wire7) : wire8)) : $unsigned(({(8'haf),
                                  wire10} ?
                              $signed(wire7) : (|wire5)))) ?
                      wire9[(5'h12):(5'h10)] : (|{wire6}));
  assign wire12 = $signed((^~$unsigned(wire9[(4'hb):(4'h9)])));
  assign wire13 = (wire9 ?
                      ((~&(7'h42)) ?
                          $unsigned((wire7 ?
                              (~&wire0) : $unsigned((8'ha7)))) : wire11) : $unsigned({$unsigned($signed(wire2)),
                          (wire0[(3'h4):(3'h4)] != $signed(wire4))}));
  assign wire14 = wire4[(4'h8):(1'h0)];
  assign wire15 = $unsigned(wire10);
  always
    @(posedge clk) begin
      reg16 <= $unsigned(({{$unsigned(wire2)}, $signed($unsigned((8'ha0)))} ?
          ($signed((8'ha2)) & {$unsigned(wire3), $signed(wire0)}) : wire4));
      reg17 <= ((-wire7) ?
          $unsigned($unsigned($unsigned(wire3[(3'h5):(3'h4)]))) : wire7[(1'h0):(1'h0)]);
      if ((^~(wire2[(2'h3):(2'h3)] >> (8'hac))))
        begin
          reg18 <= wire7;
          if (($signed(wire6) ?
              {wire8[(2'h2):(1'h1)], wire1[(4'h9):(3'h5)]} : $signed((|wire3))))
            begin
              reg19 <= $unsigned((wire6 ?
                  ($unsigned((wire6 ?
                      wire4 : reg17)) <<< ((~&wire0) <<< $signed(wire7))) : wire2[(1'h1):(1'h0)]));
              reg20 <= (wire2 ?
                  reg16 : (&$unsigned($signed((wire10 ? wire9 : wire4)))));
              reg21 <= wire7[(4'h8):(3'h6)];
              reg22 <= $unsigned(wire4);
            end
          else
            begin
              reg19 <= (~&$signed({$unsigned(reg16), reg17[(3'h6):(3'h6)]}));
              reg20 <= $signed(reg21[(3'h5):(2'h3)]);
            end
          if ($signed(reg20))
            begin
              reg23 <= $unsigned(wire7);
            end
          else
            begin
              reg23 <= ($unsigned(wire9) ?
                  $signed(reg18) : (wire3[(1'h0):(1'h0)] || ((wire4 & (wire0 << wire4)) ?
                      (~|$unsigned(wire10)) : (wire15 >>> (8'ha9)))));
              reg24 <= wire1;
              reg25 <= $unsigned((((wire8 ? (8'hb2) : $unsigned(wire10)) ?
                      ((8'h9e) ? $signed(reg24) : $unsigned(reg20)) : ({reg18,
                          reg19} || (reg22 ? wire4 : reg24))) ?
                  (!((reg21 ?
                      wire8 : (8'ha9)) || wire15)) : ($signed((|wire3)) ?
                      $unsigned($unsigned(reg20)) : (!{reg17}))));
              reg26 <= $unsigned(((^reg21) ?
                  (reg21[(3'h6):(2'h2)] >= wire1) : $signed(wire0[(1'h1):(1'h0)])));
              reg27 <= reg26[(2'h2):(2'h2)];
            end
          reg28 <= (reg24[(2'h2):(1'h1)] ?
              $signed((!(~&$signed(wire8)))) : $signed({reg16}));
          reg29 <= $signed((-($signed(wire10) <<< (reg17 & reg16[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg18 <= (($signed(((~&reg27) >> ((8'hbf) <= reg23))) ?
                  $unsigned(reg19[(4'hb):(4'h9)]) : (($unsigned(wire10) ?
                      $signed(reg22) : wire6) | (8'hbc))) ?
              ((($unsigned(reg27) ?
                  wire3[(2'h2):(1'h0)] : $signed(reg20)) == $signed({(8'hb7),
                  (8'hb4)})) >= (~|(wire7 < (&wire4)))) : $unsigned(({(wire10 <= reg27),
                  wire11} >= (8'h9c))));
          reg19 <= wire12[(1'h1):(1'h1)];
        end
      reg30 <= ((!$unsigned(wire11[(1'h0):(1'h0)])) ?
          $signed(($signed({wire10,
              reg24}) << reg16[(4'hc):(4'hb)])) : ($signed(($signed((8'hb7)) >> ((8'hb2) << reg28))) ?
              wire8 : wire2));
      reg31 <= $unsigned((&(~^$unsigned($signed(wire7)))));
    end
  assign wire32 = wire8;
  assign wire33 = wire32[(3'h4):(1'h0)];
  assign wire34 = reg16;
  assign wire35 = $signed($signed(((((8'hbc) ? wire4 : wire8) ?
                      $unsigned((8'h9e)) : $unsigned(reg21)) == $unsigned((reg17 || (8'haf))))));
endmodule
