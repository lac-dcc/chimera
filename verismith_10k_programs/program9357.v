module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire26;
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire126,
                 wire43,
                 wire42,
                 wire41,
                 wire26,
                 reg44,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(($signed((wire1 && (8'hb3))) <= ((+wire0) | (wire1 ?
              wire2 : wire1)))) ?
          wire1[(3'h4):(1'h1)] : wire0[(1'h0):(1'h0)]))
        begin
          reg4 <= (((wire2 && (~{wire0, wire2})) ^ wire3) ?
              {((wire0 < wire2[(3'h5):(1'h1)]) ?
                      ($signed(wire1) >>> $unsigned(wire0)) : wire3),
                  wire3} : (~(({wire3} >= (wire2 >> (8'hb3))) < wire3)));
          reg5 <= (^{(wire2[(3'h7):(1'h0)] >= $signed($signed(wire0))),
              ((8'hb0) <<< reg4[(3'h4):(1'h1)])});
          reg6 <= $unsigned($unsigned(wire2[(1'h1):(1'h1)]));
          reg7 <= ($unsigned(((~^$signed(wire0)) >> reg5)) == {wire2[(3'h5):(3'h4)]});
          reg8 <= (8'h9e);
        end
      else
        begin
          reg4 <= (|reg6);
          if ((reg8 ?
              {$unsigned(($unsigned(reg8) ? $unsigned(reg7) : $unsigned(reg7))),
                  ($signed($signed(wire0)) ?
                      reg7 : {$signed(wire2)})} : wire2[(3'h7):(2'h3)]))
            begin
              reg5 <= $unsigned((($signed((7'h44)) != $unsigned(wire2)) != reg5[(3'h5):(1'h1)]));
              reg6 <= wire0[(3'h4):(2'h2)];
              reg7 <= ($unsigned(wire0) ?
                  $signed($unsigned($signed(wire3))) : wire2[(2'h2):(2'h2)]);
              reg8 <= reg7[(2'h3):(1'h0)];
              reg9 <= (($unsigned(((8'ha2) ?
                      reg7[(2'h2):(1'h1)] : {reg7, (7'h44)})) ?
                  reg8[(2'h3):(1'h1)] : (((8'hb4) ?
                      $unsigned(reg8) : (^reg7)) && (-{(8'hbc)}))) < $signed($signed($signed((7'h44)))));
            end
          else
            begin
              reg5 <= ($unsigned($signed(((^reg7) ?
                  (reg4 ?
                      reg8 : reg6) : $signed(reg8)))) ^ {(~&($unsigned(reg8) ?
                      reg6 : (wire1 <<< (8'h9c)))),
                  ($signed(reg9) & ({reg7, wire0} ?
                      $signed((8'ha9)) : $unsigned(reg5)))});
              reg6 <= $signed($signed(reg7[(2'h2):(1'h1)]));
            end
          reg10 <= $unsigned((^wire3));
        end
      if (($signed($signed($unsigned((7'h40)))) ^ {$unsigned($signed(reg6)),
          reg5}))
        begin
          reg11 <= ((reg10 ?
              {$signed($signed(reg5))} : (7'h43)) && $unsigned((reg6[(1'h0):(1'h0)] ?
              reg5 : ({reg7, reg4} ? reg4 : reg8))));
          reg12 <= (8'hb0);
          reg13 <= ((+reg7) ? reg10 : reg10[(3'h6):(3'h5)]);
          if ((({reg9, ({reg12, wire2} ^ $unsigned((8'hb4)))} ?
              $signed({$signed(wire1),
                  reg9[(2'h2):(2'h2)]}) : (reg4 ^~ $signed($unsigned(reg7)))) ~^ reg7))
            begin
              reg14 <= wire0[(1'h1):(1'h1)];
              reg15 <= (^~($signed(({(8'hbe), (8'h9e)} ~^ {(7'h44)})) ?
                  ((((7'h43) ? wire2 : reg5) >>> (wire1 ? wire1 : reg11)) ?
                      reg13 : $signed(reg12[(1'h0):(1'h0)])) : ($unsigned(reg13) + wire1[(2'h3):(1'h1)])));
              reg16 <= ($signed(((reg12 ?
                  reg4 : $unsigned(reg15)) == ($unsigned(wire3) ?
                  reg14[(3'h7):(1'h1)] : (reg15 ? reg7 : reg5)))) + (^reg14));
            end
          else
            begin
              reg14 <= (~(((~&(^reg13)) >= (reg9[(4'ha):(3'h4)] && (~|reg13))) ?
                  (^~((reg4 <<< reg13) == (reg15 && reg7))) : {reg12[(4'hb):(4'hb)],
                      (^(-(8'haf)))}));
              reg15 <= reg15;
            end
          reg17 <= (&reg13);
        end
      else
        begin
          reg11 <= (+reg14);
          reg12 <= {reg16};
          reg13 <= reg13[(4'h8):(2'h2)];
        end
      reg18 <= (~|$unsigned($signed((~|{wire0}))));
      reg19 <= $unsigned({(reg15 ?
              (reg6[(3'h4):(1'h1)] == (wire1 * (8'hbe))) : reg13[(3'h5):(1'h1)])});
      if ($unsigned(($unsigned((~|$signed(reg18))) ?
          reg12[(4'ha):(1'h0)] : ((!(~^reg12)) << reg17[(3'h7):(3'h7)]))))
        begin
          reg20 <= {$unsigned(reg15)};
          if ($signed(reg16[(2'h2):(1'h0)]))
            begin
              reg21 <= reg18[(2'h3):(1'h1)];
              reg22 <= wire3;
              reg23 <= (({((wire2 + wire1) << {(8'ha0)}),
                          (|(reg19 ? wire2 : reg5))} ?
                      (reg4[(3'h5):(2'h2)] ?
                          {wire1, reg4[(4'ha):(3'h4)]} : $unsigned((wire3 ?
                              reg22 : reg12))) : ((~((8'hbd) ?
                          reg13 : (8'hb3))) >> $unsigned(wire0))) ?
                  (+wire3) : $signed(wire3[(2'h3):(2'h2)]));
            end
          else
            begin
              reg21 <= $unsigned(({$unsigned($signed(wire3)), reg19} ?
                  reg15 : $unsigned(wire1[(5'h13):(3'h7)])));
            end
          reg24 <= (&$unsigned(((^$unsigned(wire2)) ?
              (8'hbc) : (~$signed(wire0)))));
          reg25 <= (reg16[(3'h6):(3'h4)] ?
              ($signed(reg8) ?
                  wire1[(5'h10):(2'h3)] : {reg4,
                      (|(wire0 && reg24))}) : (~&(~^$unsigned(wire3))));
        end
      else
        begin
          reg20 <= $unsigned(reg10[(3'h7):(3'h6)]);
          reg21 <= $unsigned($unsigned(reg4));
        end
    end
  assign wire26 = ($signed({((reg11 < reg13) | $signed(reg7))}) ?
                      $signed(($unsigned((~reg16)) ?
                          {(reg4 ? reg17 : (8'hb2))} : (~&(reg17 ?
                              reg15 : reg11)))) : {reg18[(4'ha):(4'ha)],
                          $signed({reg9[(3'h4):(1'h1)],
                              reg20[(4'ha):(2'h2)]})});
  always
    @(posedge clk) begin
      reg27 <= $signed({(|{$signed(reg22)}),
          (^($signed(wire2) ? $signed((8'hb0)) : reg21))});
      reg28 <= $unsigned((reg19 ?
          (&(reg23[(4'ha):(2'h3)] ?
              (reg25 & (8'hbd)) : (^wire1))) : $unsigned(((8'ha5) + reg19))));
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned((-$unsigned($signed(reg27))))))
        begin
          reg29 <= ((~&$unsigned($signed(((8'h9c) ?
              reg21 : reg18)))) != ((((8'hb1) != $unsigned(reg9)) ?
                  reg17 : reg9) ?
              (&((reg19 ? reg23 : reg5) ?
                  (+reg14) : (reg6 >= reg5))) : {$unsigned((reg19 ?
                      (7'h40) : (8'hbf)))}));
          if (($unsigned((~|(((8'ha9) ? reg11 : reg17) == $unsigned(reg27)))) ?
              (+{(reg14 != $signed(reg27))}) : ((^~{reg15[(1'h1):(1'h0)]}) ?
                  reg11[(2'h3):(2'h2)] : {$unsigned($unsigned(wire2))})))
            begin
              reg30 <= reg12;
              reg31 <= reg28;
              reg32 <= reg27[(4'he):(4'he)];
            end
          else
            begin
              reg30 <= reg5;
              reg31 <= {{reg4[(1'h0):(1'h0)]}};
              reg32 <= {$signed(reg21[(1'h1):(1'h1)]),
                  {(^~($signed(reg9) ? reg5 : $signed(reg17)))}};
            end
          if ({$signed(($unsigned($signed(reg32)) < reg31[(4'h8):(3'h4)]))})
            begin
              reg33 <= (!reg30);
              reg34 <= (($unsigned($signed((reg31 ? reg33 : reg5))) ?
                      reg16[(2'h3):(1'h1)] : (($signed(reg18) - reg4) >> {(reg4 ?
                              (8'hbc) : reg4)})) ?
                  {$unsigned((~$unsigned(reg29))),
                      (reg33[(2'h2):(1'h1)] || ($unsigned(reg22) ~^ $signed(reg32)))} : wire1);
            end
          else
            begin
              reg33 <= ($unsigned((wire3 ? ((~&reg33) == reg13) : (8'had))) ?
                  wire1[(4'hc):(3'h4)] : (|$signed((~&(~&reg5)))));
              reg34 <= ((~|reg19[(3'h4):(1'h1)]) ?
                  ((8'h9d) >= (^reg5[(3'h4):(1'h0)])) : ({reg28} ?
                      reg28[(3'h6):(1'h1)] : ($unsigned(reg15[(4'hc):(4'hb)]) ?
                          ((+reg7) ?
                              (!wire26) : reg10) : reg17[(3'h7):(3'h7)])));
              reg35 <= $unsigned({(&{reg18})});
              reg36 <= reg9;
            end
          reg37 <= $unsigned($signed(wire1[(4'hd):(3'h4)]));
          if (($unsigned(wire3[(5'h12):(4'he)]) ?
              (reg19 ?
                  (reg37[(1'h0):(1'h0)] ?
                      ((reg15 ?
                          reg22 : wire0) * (reg4 | wire1)) : reg17[(3'h6):(3'h6)]) : reg13) : $signed((({reg17,
                      reg4} * {reg14, reg11}) ?
                  $signed((^wire2)) : reg5))))
            begin
              reg38 <= $unsigned(reg25[(1'h0):(1'h0)]);
              reg39 <= (&(~&(8'hab)));
              reg40 <= $signed((($unsigned($unsigned(reg7)) >>> reg39) ?
                  $signed($signed($unsigned(reg16))) : reg5));
            end
          else
            begin
              reg38 <= $signed((&$unsigned((reg16[(4'h8):(3'h6)] > reg15))));
            end
        end
      else
        begin
          reg29 <= $signed(((+({reg33} ?
              ((8'hb9) ?
                  wire3 : reg19) : $signed(reg31))) ^~ $unsigned($unsigned(reg17[(2'h2):(1'h0)]))));
        end
    end
  assign wire41 = (reg21[(1'h0):(1'h0)] ? reg7 : reg35);
  assign wire42 = reg11[(2'h2):(2'h2)];
  assign wire43 = reg15;
  always
    @(posedge clk) begin
      reg44 <= $unsigned({reg18});
    end
  module45 #() modinst127 (.wire48(reg29), .clk(clk), .wire49(reg14), .wire46(reg7), .y(wire126), .wire47(reg20));
endmodule

module module45
#(parameter param125 = {(({(~^(8'hbb)), (8'ha0)} <<< (((8'hb2) ? (8'hbc) : (8'ha0)) - (^~(8'hb9)))) | ((~&((8'hb8) >> (8'hbe))) ? (((8'ha0) + (8'hba)) | (~^(8'ha1))) : ((~(8'h9c)) ? ((8'ha3) ? (8'hab) : (8'ha7)) : ((8'ha7) ? (7'h41) : (8'h9e)))))})
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire49;
  input wire [(5'h10):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire120;
  wire [(5'h15):(1'h0)] wire119;
  wire signed [(5'h11):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire116,
                 wire87,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire50 = (wire47[(2'h3):(1'h0)] >>> $signed((8'hab)));
  assign wire51 = ((wire50[(1'h1):(1'h0)] >>> (+(&$unsigned(wire47)))) * (wire50[(2'h3):(2'h3)] ?
                      wire46 : $signed(wire50[(1'h0):(1'h0)])));
  assign wire52 = $unsigned($signed(wire49[(4'hd):(3'h6)]));
  assign wire53 = wire52[(2'h3):(2'h2)];
  module54 #() modinst88 (.wire56(wire46), .wire57(wire50), .wire55(wire53), .y(wire87), .clk(clk), .wire58(wire48));
  always
    @(posedge clk) begin
      reg89 <= wire46;
      reg90 <= (^~$signed(($unsigned((-wire46)) ?
          ($signed(wire87) ? {(8'hb6)} : (^(8'ha8))) : ((wire87 ?
              (8'hb3) : wire50) << (7'h41)))));
      reg91 <= reg90[(4'hd):(4'ha)];
      if ({((($signed(wire50) << (+wire52)) ? wire50[(4'hb):(2'h3)] : wire52) ?
              $signed((reg89[(4'hc):(4'hb)] ?
                  (|wire49) : (+(8'hb4)))) : $unsigned(((wire53 >= (8'hae)) ?
                  $signed(wire51) : (wire52 ? wire49 : wire51))))})
        begin
          reg92 <= wire49;
          if ($signed($unsigned((((+(8'ha6)) ? wire47[(4'ha):(1'h0)] : wire52) ?
              {$signed(wire52)} : $signed($unsigned(reg92))))))
            begin
              reg93 <= (($signed($signed({wire51, (8'ha4)})) ?
                  ($signed($unsigned(wire53)) ^~ (~&$signed(wire50))) : {{(~&reg91),
                          ((8'ha0) ^~ reg90)}}) ~^ (wire51 ?
                  (wire50[(4'h9):(2'h2)] ?
                      $signed($signed((8'ha2))) : $signed({wire87,
                          wire46})) : $signed(wire49)));
              reg94 <= $unsigned((~((wire50[(4'h9):(3'h4)] > (wire52 ?
                  (8'hbc) : wire49)) ^ {reg92[(2'h2):(1'h0)]})));
              reg95 <= reg89[(3'h5):(1'h1)];
              reg96 <= (8'hb4);
            end
          else
            begin
              reg93 <= (((8'h9f) ?
                  reg92[(4'h8):(1'h1)] : $unsigned(wire53[(4'he):(2'h2)])) > (8'haa));
              reg94 <= wire53[(1'h0):(1'h0)];
            end
          if ($unsigned(reg93[(3'h7):(3'h4)]))
            begin
              reg97 <= wire46;
            end
          else
            begin
              reg97 <= (reg95 ? $signed($signed(reg92[(3'h4):(1'h1)])) : reg93);
              reg98 <= reg97[(3'h5):(1'h1)];
              reg99 <= (|($unsigned($unsigned((wire52 ? wire48 : reg91))) ?
                  (wire46 ?
                      ({reg97} ?
                          reg98 : (wire48 ?
                              wire51 : reg90)) : $signed($signed(wire49))) : ((!wire47) ?
                      wire47 : ((~wire48) ?
                          $signed(wire50) : reg90[(3'h7):(2'h3)]))));
            end
        end
      else
        begin
          reg92 <= (8'haa);
          reg93 <= {({$signed($unsigned(reg91)),
                  wire50[(1'h0):(1'h0)]} != {{(reg92 == wire87),
                      $signed(reg95)}}),
              ((&reg94) ?
                  (wire50[(3'h4):(2'h2)] ?
                      (&(reg95 >= wire53)) : reg90[(5'h14):(2'h2)]) : {reg98,
                      ($signed(wire52) || $signed(wire51))})};
          if ($unsigned(reg95))
            begin
              reg94 <= (((reg93 ?
                  $signed({(8'hb9)}) : (^~wire52)) ~^ $unsigned($signed((reg92 >= reg98)))) || (~|wire46));
              reg95 <= $unsigned($unsigned($unsigned((&$unsigned(wire47)))));
              reg96 <= $signed(wire46[(3'h5):(1'h1)]);
              reg97 <= $signed((wire46[(4'hd):(3'h4)] < reg93[(3'h5):(3'h5)]));
              reg98 <= wire47;
            end
          else
            begin
              reg94 <= {($unsigned(($unsigned(wire46) ?
                          $signed(reg92) : (^~reg94))) ?
                      ($signed($signed(wire47)) ?
                          $signed((^~(8'h9e))) : ($signed((7'h44)) ?
                              (reg90 == (8'hb0)) : (reg99 && reg91))) : reg91[(4'ha):(3'h6)])};
            end
        end
    end
  module100 #() modinst117 (.clk(clk), .wire103(wire48), .wire104(wire87), .wire101(wire53), .y(wire116), .wire102(wire52));
  assign wire118 = reg91;
  assign wire119 = (|$signed($signed(((reg99 ?
                       reg94 : reg99) <<< (wire116 ^ wire47)))));
  assign wire120 = $signed($unsigned(reg90[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg121 <= (((wire51 ?
                  $unsigned({reg95, reg93}) : ((+wire118) | wire118)) ?
              (-(|(wire118 + reg95))) : $signed(reg91[(5'h10):(3'h6)])) ?
          $unsigned({(-(~&(8'hb3)))}) : (~$unsigned({reg96[(3'h5):(2'h3)]})));
      reg122 <= reg92[(3'h6):(3'h6)];
      reg123 <= wire53[(4'ha):(4'h9)];
      reg124 <= wire49;
    end
endmodule

module module100
#(parameter param114 = (({((+(8'ha6)) ? {(8'h9c)} : ((8'hac) ? (8'ha7) : (8'haf)))} ? (((~(8'ha2)) >> (8'hb3)) && ((!(8'hbd)) * {(8'ha8)})) : (~^(((8'haf) << (8'hae)) ? {(8'ha9)} : (7'h44)))) & ((|({(8'hb0), (8'ha8)} != ((8'ha8) ^~ (8'hba)))) ? ((^~(+(8'haf))) ? ((8'hbb) ? (~(8'hbb)) : ((8'hbc) - (8'h9c))) : (8'hac)) : (((-(8'ha6)) ? ((8'ha9) || (8'hbd)) : ((8'hbd) ? (7'h43) : (8'hb3))) ? ({(8'ha7)} >= (^(8'hbd))) : (((8'hb0) + (8'hb1)) == ((8'h9d) <<< (8'hac)))))), 
parameter param115 = ((-param114) ? param114 : (~|(~|{(param114 ? param114 : param114)}))))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire104;
  input wire [(4'hf):(1'h0)] wire103;
  input wire signed [(4'he):(1'h0)] wire102;
  input wire signed [(3'h5):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire105;
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire106,
                 wire105,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire105 = $signed({(8'hb2)});
  assign wire106 = {(~|$signed(((~^wire102) - ((8'ha0) ? wire101 : wire104))))};
  always
    @(posedge clk) begin
      reg107 <= wire103;
      reg108 <= (|((((wire101 ? reg107 : wire102) + wire105) ?
              $signed((wire101 ^ wire104)) : wire102) ?
          {(+(^wire106)),
              ($signed(wire104) ?
                  $unsigned((8'hbb)) : $unsigned((8'haa)))} : (~|wire105)));
    end
  assign wire109 = $unsigned($signed(({wire103} == (^~$signed(wire105)))));
  assign wire110 = $unsigned(((reg107 ?
                           {(~|wire102)} : $unsigned($signed(wire101))) ?
                       $signed((8'hb7)) : $signed((~|(reg107 ?
                           wire109 : wire106)))));
  assign wire111 = wire101;
  assign wire112 = (~$unsigned($signed({wire109[(4'hc):(4'ha)], (~^wire110)})));
  assign wire113 = (&reg107[(4'hd):(4'hb)]);
endmodule

module module54
#(parameter param86 = {(8'hb2), {{((~|(7'h43)) * ((7'h40) & (8'h9f))), (((8'ha9) ? (8'ha0) : (8'haf)) ? {(7'h40)} : (^~(7'h42)))}, {(|((8'ha5) ? (8'ha0) : (8'hbe)))}}})
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire58;
  input wire [(4'hc):(1'h0)] wire57;
  input wire [(3'h5):(1'h0)] wire56;
  input wire [(5'h10):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire60,
                 wire59,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg62,
                 (1'h0)};
  assign wire59 = (~$unsigned(wire58[(3'h6):(3'h4)]));
  assign wire60 = $signed({$unsigned(($signed(wire59) ~^ {wire56}))});
  assign wire61 = (~|(~|(($unsigned((7'h44)) >>> wire55) ?
                      $signed(wire58) : ({wire57} ?
                          (wire57 <= wire56) : (~&wire60)))));
  always
    @(posedge clk) begin
      reg62 <= (|$signed((~&(8'ha9))));
    end
  assign wire63 = (((wire59 ~^ wire56[(1'h1):(1'h1)]) ?
                      (-wire58[(4'ha):(1'h1)]) : wire56) <<< wire58[(2'h3):(2'h3)]);
  assign wire64 = (~^(-$unsigned($signed(((8'h9d) ? (8'ha1) : wire56)))));
  assign wire65 = (~|wire60);
  assign wire66 = $unsigned(wire55[(4'hb):(1'h1)]);
  assign wire67 = wire61;
  assign wire68 = (|$signed($unsigned((wire57[(4'h9):(3'h6)] ^~ (+wire60)))));
  assign wire69 = wire66[(3'h5):(1'h1)];
  assign wire70 = wire69;
  assign wire71 = $unsigned((&(~^({wire69, wire59} ?
                      (wire67 ^ wire63) : $unsigned(wire70)))));
  assign wire72 = ($signed(wire67) >> $signed($unsigned(wire58[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg73 <= {wire55};
      reg74 <= $unsigned(($unsigned($unsigned((wire66 <<< wire70))) ?
          (^~$unsigned($signed(wire70))) : {wire65[(1'h0):(1'h0)]}));
      reg75 <= ((($unsigned($signed(wire72)) && ($signed(reg74) <<< {wire61,
          reg62})) * wire58) + ((~&(((7'h41) ? wire71 : wire71) ?
          $signed(wire57) : wire57[(2'h3):(1'h1)])) || ((~&(wire63 | reg74)) ?
          $unsigned($unsigned(reg62)) : {$unsigned(wire68),
              wire65[(2'h2):(1'h0)]})));
      if (reg75[(2'h3):(2'h2)])
        begin
          reg76 <= wire58[(3'h7):(3'h7)];
          reg77 <= (wire72 || (wire70 != wire70));
          reg78 <= (!(((^~(~^wire59)) ?
              {$signed(reg73)} : $unsigned(wire67)) - $signed($signed(((8'hbd) ?
              wire67 : wire58)))));
        end
      else
        begin
          reg76 <= ($signed(({reg73} ? wire67[(3'h5):(3'h5)] : (&(8'hb6)))) ?
              reg78[(3'h4):(2'h2)] : ((~&reg73) >= $unsigned((|$unsigned((8'hb7))))));
          if ($signed((wire72[(2'h2):(2'h2)] ?
              (~($signed(wire72) ? wire60 : $signed(wire57))) : reg78)))
            begin
              reg77 <= $unsigned(((~&((wire61 >> wire57) ?
                      $unsigned((8'hae)) : $signed(wire68))) ?
                  wire64 : (reg62 ?
                      $signed(wire72[(2'h3):(2'h2)]) : reg76[(1'h0):(1'h0)])));
              reg78 <= ($unsigned(({reg75,
                  (reg74 <<< wire59)} ~^ (&(^wire60)))) <<< reg75[(3'h4):(2'h2)]);
              reg79 <= ((!(~^$signed(wire65))) == (($signed($unsigned((8'ha8))) ?
                      $signed($signed(wire64)) : wire57[(4'ha):(3'h6)]) ?
                  {(wire60[(4'h8):(3'h5)] | (wire63 ?
                          wire69 : (8'ha7)))} : $unsigned(reg77[(3'h4):(3'h4)])));
              reg80 <= {{(((&wire69) >> $unsigned((8'hb3))) ?
                          reg79[(1'h0):(1'h0)] : wire58)},
                  (8'hae)};
            end
          else
            begin
              reg77 <= $signed($signed(reg75));
              reg78 <= {reg73[(1'h1):(1'h0)]};
            end
        end
      reg81 <= (~|(($unsigned($unsigned(wire69)) ?
              {$signed(reg77), wire55[(4'hb):(4'h8)]} : $signed((!wire65))) ?
          (wire67[(4'hc):(3'h4)] ?
              $signed($unsigned(wire57)) : wire58[(3'h6):(2'h2)]) : {$unsigned((reg79 ?
                  wire65 : wire60)),
              $signed($signed(reg77))}));
    end
  assign wire82 = (7'h42);
  assign wire83 = $unsigned(reg62[(5'h12):(4'hc)]);
  assign wire84 = (7'h41);
  assign wire85 = wire59[(2'h3):(1'h1)];
endmodule
