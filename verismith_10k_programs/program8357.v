module top
#(parameter param68 = {(({(&(8'hb5)), (+(8'ha2))} ? ((~^(8'hbf)) ? (~(8'hb8)) : ((8'ha4) ? (8'ha9) : (8'ha6))) : (((8'hbd) << (8'hb0)) ? ((8'hb1) ? (8'hb0) : (8'hb7)) : ((8'hb4) ? (8'ha2) : (8'hab)))) <= ((|(~^(8'h9d))) >= (((8'h9f) != (8'hbe)) ^~ {(8'h9e), (8'h9c)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire8,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ({$unsigned(((^wire1) ? (8'hb0) : wire1)),
                     $signed(($unsigned(wire3) > (~|wire3)))} >= $unsigned((|(8'h9e))));
  always
    @(posedge clk) begin
      reg6 <= $signed(wire0[(3'h7):(3'h6)]);
      reg7 <= ($signed((wire0 ? wire0 : reg6[(2'h3):(2'h2)])) ?
          (&((wire3[(3'h4):(1'h0)] <<< (wire2 ?
              (8'ha2) : (8'hb5))) - wire0[(2'h3):(1'h0)])) : ($signed(($unsigned(wire1) >>> (wire4 ?
              wire2 : wire5))) >= {($signed(wire1) > {(8'hb1)}),
              $unsigned(wire3[(4'ha):(2'h2)])}));
    end
  assign wire8 = wire0;
  always
    @(posedge clk) begin
      reg9 <= (({$unsigned(reg6)} != wire1[(2'h3):(2'h3)]) ?
          $unsigned(((~$signed(wire0)) ?
              (wire4[(3'h6):(2'h3)] - $signed(wire3)) : wire2[(4'ha):(4'h9)])) : {(wire5[(4'hf):(4'hb)] ^~ $signed({wire0}))});
      reg10 <= (+(!(+reg9[(4'h9):(1'h1)])));
      reg11 <= ($unsigned(($unsigned((wire4 ? (7'h40) : (8'hb0))) != reg9)) ?
          $unsigned((!{(reg10 ^~ reg10), $unsigned(wire3)})) : reg7);
      reg12 <= (8'h9c);
      reg13 <= wire8;
    end
  module14 #() modinst63 (.clk(clk), .y(wire62), .wire15(wire2), .wire17(reg7), .wire16(reg6), .wire18(wire8));
  assign wire64 = $signed((wire5[(4'hb):(4'h8)] ?
                      (~&wire1[(3'h6):(3'h5)]) : wire8[(1'h0):(1'h0)]));
  assign wire65 = (!$unsigned(($unsigned((~|wire3)) >= $unsigned((8'hbe)))));
  assign wire66 = $signed($signed($signed($unsigned($signed((8'ha8))))));
  assign wire67 = ((~(+reg9)) ? $unsigned(wire2) : wire0[(3'h6):(3'h6)]);
endmodule

module module14
#(parameter param60 = {(^(8'hb6))}, 
parameter param61 = {{(param60 ? (-(param60 == (8'hb4))) : (^~((8'hac) > param60)))}, (~^((8'had) ? (+param60) : ({param60} ? (param60 > param60) : {param60})))})
(y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire [(4'hc):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire33;
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  assign y = {wire57,
                 wire47,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire19,
                 wire20,
                 wire33,
                 reg59,
                 reg58,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire19 = wire16[(2'h2):(2'h2)];
  assign wire20 = $unsigned($unsigned((!(^$unsigned(wire15)))));
  module21 #() modinst34 (wire33, clk, wire18, wire20, wire19, wire16, wire15);
  assign wire35 = $signed(({(~&wire20)} ? $signed(wire33) : wire16));
  assign wire36 = {wire18, $signed({wire19})};
  assign wire37 = (wire18[(4'hf):(4'hd)] ?
                      $unsigned($unsigned((^~wire33[(1'h0):(1'h0)]))) : $unsigned((wire17[(4'hc):(4'h8)] ~^ ((wire16 ?
                              wire20 : wire16) ?
                          {(8'hba)} : (wire18 ? wire20 : wire36)))));
  assign wire38 = (|wire37);
  assign wire39 = $signed(wire19);
  assign wire40 = $unsigned($unsigned($signed((((8'ha3) ?
                      wire35 : wire17) ~^ (wire15 ? (8'h9d) : wire17)))));
  always
    @(posedge clk) begin
      if (wire15[(4'ha):(4'ha)])
        begin
          if ($signed(wire15[(2'h3):(2'h3)]))
            begin
              reg41 <= ($unsigned($unsigned(((wire39 ?
                      wire39 : wire17) + $unsigned(wire35)))) ?
                  $signed(wire15) : ($signed(($signed(wire40) == (-wire37))) ?
                      (wire35 ?
                          $signed(wire40[(1'h0):(1'h0)]) : ((+(8'hbb)) << wire37)) : wire19));
              reg42 <= {((^(((8'ha2) ?
                      wire33 : wire18) ~^ $signed(wire17))) ^ wire20[(4'ha):(3'h6)])};
              reg43 <= ($unsigned($signed(wire40)) == ((^~(&{wire16})) ?
                  ((wire20[(3'h7):(2'h2)] & wire37[(4'hb):(4'hb)]) ?
                      ($signed(wire40) * $unsigned(wire15)) : wire37) : {$signed($signed(wire35)),
                      wire18[(4'hd):(4'ha)]}));
              reg44 <= (^~wire19);
              reg45 <= $signed((!$signed($signed((wire20 && wire33)))));
            end
          else
            begin
              reg41 <= (&$unsigned({wire38, $unsigned($signed(wire36))}));
            end
        end
      else
        begin
          if ((~^$signed((8'hb9))))
            begin
              reg41 <= wire18[(4'ha):(2'h2)];
              reg42 <= (({((wire18 ? wire40 : (8'hb1)) >>> {reg41})} ?
                      (($unsigned(wire15) + (wire16 ?
                          reg42 : wire15)) && {(wire36 | wire18)}) : wire17[(4'h9):(3'h7)]) ?
                  reg44 : (~(((wire16 ? wire37 : wire37) ?
                          (~&reg45) : reg44[(4'h8):(3'h4)]) ?
                      (^~$unsigned(reg43)) : wire35)));
              reg43 <= wire18;
            end
          else
            begin
              reg41 <= ($unsigned((($signed(reg41) ?
                      wire39 : (~wire37)) > reg41[(2'h3):(2'h2)])) ?
                  ((({wire19,
                          wire38} ^~ wire15[(3'h7):(3'h4)]) ^~ wire19[(5'h12):(4'hd)]) ?
                      (reg41 ?
                          wire37[(3'h5):(2'h3)] : $signed((~|wire36))) : (($unsigned((8'ha7)) ?
                          $unsigned(reg45) : $signed((8'haa))) ^ $unsigned($unsigned(wire39)))) : (!reg44[(4'h8):(4'h8)]));
            end
          reg44 <= (8'ha3);
          reg45 <= (wire38[(1'h0):(1'h0)] ?
              wire36[(1'h1):(1'h1)] : {($unsigned((+wire16)) >>> (wire20 != $unsigned(wire20))),
                  wire38[(2'h3):(2'h3)]});
        end
      reg46 <= ($unsigned($unsigned(wire38)) ?
          $signed(((~^(~^wire40)) ? reg42 : wire16)) : ((wire15 ?
              (~&wire36[(4'h9):(4'h9)]) : $signed((|wire35))) | ((~reg44[(4'hc):(1'h0)]) ?
              reg43[(4'h8):(3'h4)] : ($signed(wire40) || (wire35 ?
                  wire19 : wire33)))));
    end
  assign wire47 = ({$signed($signed((~wire18)))} != (|(~^(~(wire35 ?
                      reg42 : wire36)))));
  always
    @(posedge clk) begin
      reg48 <= ($signed((|wire37)) ?
          {$unsigned((~|((8'hbf) ^ (8'hbc))))} : (~reg42[(5'h13):(4'h9)]));
      if ((+(~|$signed(((wire36 ? wire33 : wire38) ? wire35 : (8'hb7))))))
        begin
          if ((^~reg42[(5'h12):(3'h5)]))
            begin
              reg49 <= wire33;
            end
          else
            begin
              reg49 <= ((&{(^~(wire37 ?
                      reg46 : wire17))}) * ((wire37 || (~&(wire40 ?
                  (8'ha4) : wire39))) * $signed((&reg49))));
              reg50 <= (&$unsigned($signed((+$signed(reg48)))));
            end
          reg51 <= (!({$signed((reg43 ? (8'hbd) : reg50)),
              ((wire47 > reg41) ?
                  {reg46,
                      reg44} : $signed(wire37))} & (((&wire47) >> $signed(wire16)) ?
              $signed($signed(wire37)) : (+(wire47 >= wire40)))));
          reg52 <= $signed(reg44[(4'hb):(4'h9)]);
          reg53 <= (wire18 > wire37);
        end
      else
        begin
          reg49 <= wire20;
          reg50 <= (((!wire20[(4'ha):(4'h8)]) ?
                  wire40 : ((^(reg43 ? reg48 : wire19)) ?
                      (wire38[(1'h0):(1'h0)] != reg42) : $unsigned((7'h40)))) ?
              (reg44 ?
                  reg51[(2'h2):(1'h1)] : $signed($signed((&wire38)))) : (8'ha9));
          reg51 <= $unsigned(wire47);
        end
      reg54 <= $unsigned(wire20[(4'hb):(3'h5)]);
      reg55 <= wire36[(1'h0):(1'h0)];
      reg56 <= reg45[(4'h9):(4'h9)];
    end
  assign wire57 = wire17;
  always
    @(posedge clk) begin
      reg58 <= $signed(wire40[(1'h1):(1'h1)]);
      reg59 <= $signed($signed((-$unsigned((wire47 ~^ wire37)))));
    end
endmodule

module module21
#(parameter param32 = ((!(({(8'hb1)} ? ((8'hb0) ? (8'hbf) : (8'ha6)) : (-(8'hb1))) >> (^~((8'hbb) ? (7'h42) : (8'hb3))))) ^ {((((8'had) ? (8'hbb) : (8'hbc)) >> (^~(8'h9f))) ? {((8'hb8) + (8'hbb)), ((8'hb0) ? (8'hb2) : (8'ha3))} : ((^(8'ha5)) ? ((8'ha2) ? (8'ha9) : (8'hb5)) : ((8'haf) + (8'hbe))))}))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire26;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  assign y = {wire31, wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = $unsigned($unsigned($unsigned(wire26[(4'hf):(3'h6)])));
  assign wire28 = wire22;
  assign wire29 = wire24;
  assign wire30 = wire22[(2'h2):(2'h2)];
  assign wire31 = (~^($unsigned((wire25[(1'h0):(1'h0)] << (wire25 ?
                      wire29 : wire30))) | $unsigned(wire30)));
endmodule
