module top
#(parameter param68 = ({(~&(((8'hab) ? (8'hb3) : (8'hb7)) < ((7'h41) ^~ (8'hbd)))), (|(^((8'hbc) < (8'haa))))} >> ((((7'h42) ? {(8'ha1)} : ((8'ha1) ? (8'hb6) : (8'ha2))) | (~|(-(8'haa)))) - {(((7'h43) >= (8'ha0)) ? ((8'ha2) ^ (8'ha9)) : {(8'hb6)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire62;
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire62,
                 reg67,
                 reg66,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire1[(5'h12):(1'h1)])
        begin
          reg4 <= ({({wire0[(4'he):(3'h7)]} == ({wire2, (8'hb6)} ?
                  wire1 : (^wire2))),
              (!(^wire2))} && wire2);
          reg5 <= wire1;
          if (wire2[(1'h0):(1'h0)])
            begin
              reg6 <= $unsigned((wire0[(3'h7):(3'h5)] ?
                  $unsigned(wire3) : (~^(^~{(8'hb7), reg4}))));
              reg7 <= $signed(((|reg5) != $unsigned((~|(!wire0)))));
              reg8 <= ($unsigned($signed(wire2)) | {reg5});
              reg9 <= {reg7,
                  (!{((reg8 + reg8) && $unsigned(wire2)),
                      $unsigned($unsigned(wire3))})};
            end
          else
            begin
              reg6 <= wire2[(4'he):(3'h4)];
              reg7 <= $unsigned({wire0});
              reg8 <= reg9[(1'h0):(1'h0)];
              reg9 <= (^((~|(wire1 > (~wire1))) ^ wire2[(1'h1):(1'h1)]));
            end
          reg10 <= $unsigned(((reg5 >> $signed((reg6 ? wire0 : wire3))) ?
              ({$unsigned(reg9), (wire3 * reg7)} + $signed((&reg6))) : reg4));
        end
      else
        begin
          reg4 <= $signed((((!$signed(reg6)) < wire3[(2'h3):(2'h3)]) ?
              $unsigned((^$signed(reg9))) : reg7));
          if ($unsigned($unsigned(((wire1[(5'h14):(5'h14)] * $signed(wire1)) ?
              (&reg9) : $unsigned((8'hb4))))))
            begin
              reg5 <= (wire2 <= $unsigned(reg9[(3'h6):(2'h2)]));
            end
          else
            begin
              reg5 <= (~&($unsigned((8'h9d)) << ((reg8 >= wire1) ?
                  {(~|reg6), (reg7 ? reg5 : (8'hb8))} : wire0)));
              reg6 <= reg9;
              reg7 <= ($unsigned((&($unsigned(reg7) - (reg4 ?
                      (8'ha2) : reg9)))) ?
                  reg10 : reg10);
              reg8 <= ((~|$signed(reg6[(2'h3):(1'h0)])) ?
                  reg10 : {({wire0, wire0[(4'h8):(3'h4)]} ?
                          {(reg9 ? wire2 : wire0)} : ((~^reg8) - (&(8'ha4))))});
            end
          if (reg9[(2'h3):(1'h1)])
            begin
              reg9 <= (!((!$unsigned({reg8})) << (wire2 >> $unsigned((~reg9)))));
              reg10 <= reg6;
              reg11 <= reg8[(4'h8):(3'h4)];
              reg12 <= (-reg9[(3'h5):(3'h4)]);
              reg13 <= $signed((($unsigned(((8'hac) ? reg7 : wire2)) ?
                  (~&$unsigned(wire0)) : (!(&reg7))) & (((wire3 ?
                          reg9 : wire2) ?
                      {reg8} : (~reg9)) ?
                  ((8'hab) * wire2) : (8'h9d))));
            end
          else
            begin
              reg9 <= ((8'hb2) ?
                  $unsigned($signed(wire3)) : (reg6[(2'h3):(1'h1)] >> (&($unsigned((8'ha0)) ?
                      (|reg5) : (~&wire0)))));
              reg10 <= (+reg9[(3'h6):(2'h2)]);
              reg11 <= $unsigned(reg5);
              reg12 <= ((reg12[(1'h1):(1'h1)] ?
                  (+{reg12[(4'hf):(4'h9)], reg12}) : (8'hab)) > ({(|(|reg4))} ?
                  reg10 : (wire2[(2'h2):(1'h1)] >= wire0)));
              reg13 <= {(~&(({(8'h9c), (8'h9f)} ?
                      $signed(wire3) : $signed(reg6)) || $signed((reg13 ?
                      reg8 : reg4))))};
            end
        end
      reg14 <= ((reg6[(3'h5):(1'h1)] < {reg8[(3'h7):(2'h2)],
          (&$unsigned(wire3))}) ^~ (~reg9[(2'h3):(1'h1)]));
      reg15 <= (~&($unsigned($signed(reg5)) ?
          $signed(reg10[(3'h4):(1'h1)]) : (((8'hbe) & $signed(wire0)) ?
              (|(^wire3)) : $unsigned($signed(reg11)))));
      reg16 <= ({$unsigned((8'hb4))} ?
          reg10[(4'ha):(3'h6)] : (^(^~(reg13 | $unsigned(reg15)))));
      if (wire0)
        begin
          if ((reg5 ?
              wire3[(3'h4):(1'h1)] : $unsigned({$signed((reg15 ? reg5 : reg7)),
                  (reg14[(4'hc):(4'hb)] < $unsigned(reg10))})))
            begin
              reg17 <= reg14;
              reg18 <= $signed(($unsigned(reg16) >> reg13[(4'hd):(2'h3)]));
            end
          else
            begin
              reg17 <= reg4;
              reg18 <= {(reg16 & (reg12 <<< (+reg15))), reg7[(2'h3):(1'h0)]};
              reg19 <= ($signed((8'hbb)) - wire2[(2'h2):(1'h0)]);
              reg20 <= reg8[(2'h3):(2'h3)];
              reg21 <= {($signed(reg8) ?
                      (|(reg16 ?
                          reg17[(3'h4):(2'h2)] : $signed(reg5))) : reg15),
                  reg14[(4'h9):(4'h8)]};
            end
          reg22 <= reg18;
        end
      else
        begin
          reg17 <= reg13;
        end
    end
  module23 #() modinst63 (.clk(clk), .wire25(reg14), .wire26(reg21), .wire27(reg5), .wire24(reg12), .wire28(reg4), .y(wire62));
  assign wire64 = (^~reg8);
  assign wire65 = $unsigned(((reg19[(2'h2):(1'h0)] ^~ $unsigned(wire3[(1'h1):(1'h1)])) & (~^$signed($unsigned(reg19)))));
  always
    @(posedge clk) begin
      reg66 <= ($signed(((~&(~|wire0)) | (reg9[(2'h3):(2'h2)] ?
              $unsigned(reg4) : reg19))) ?
          (reg8 ?
              (!$signed((wire64 <<< reg16))) : reg10[(2'h2):(2'h2)]) : (&{$unsigned(reg21)}));
      reg67 <= reg66[(4'h9):(4'h8)];
    end
endmodule

module module23  (y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire26;
  input wire signed [(4'he):(1'h0)] wire27;
  input wire signed [(3'h7):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire59;
  assign y = {wire61, wire29, wire30, wire31, wire32, wire59, (1'h0)};
  assign wire29 = $unsigned(wire26[(3'h4):(1'h1)]);
  assign wire30 = wire25[(2'h2):(1'h1)];
  assign wire31 = ({wire30[(3'h4):(1'h0)]} ?
                      wire24[(3'h4):(2'h3)] : (wire28 ?
                          wire30[(2'h3):(1'h1)] : ((-(^wire28)) ^ wire24)));
  assign wire32 = ((((wire25[(1'h1):(1'h1)] | $signed(wire31)) && wire26) == ((-(wire26 == wire31)) ?
                      $signed({(8'h9e)}) : (8'ha8))) << $unsigned($signed((wire27[(4'hd):(1'h0)] ?
                      $unsigned(wire28) : (wire26 ? wire30 : wire27)))));
  module33 #() modinst60 (wire59, clk, wire30, wire32, wire31, wire26, wire24);
  assign wire61 = (wire24 << $unsigned(($signed((wire32 > wire32)) >= (wire30[(4'ha):(3'h6)] || $unsigned((8'ha7))))));
endmodule

module module33
#(parameter param57 = (~&(~|(-(8'ha8)))), 
parameter param58 = param57)
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire38;
  input wire signed [(4'h8):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(2'h3):(1'h0)] wire35;
  input wire signed [(4'ha):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg40,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= (wire36[(2'h3):(1'h1)] ^~ (~|($signed((~&wire35)) < $signed($signed(wire36)))));
      reg40 <= wire34[(3'h6):(3'h5)];
    end
  assign wire41 = $signed((-(wire36 <= reg39)));
  assign wire42 = {$unsigned($signed(((~|reg39) * (~wire37)))),
                      wire41[(3'h7):(2'h2)]};
  assign wire43 = {wire34[(2'h2):(1'h1)],
                      $unsigned($signed((~&$unsigned((8'hbf)))))};
  assign wire44 = wire42[(3'h4):(2'h3)];
  assign wire45 = ((&(8'ha1)) ?
                      $unsigned({$signed(((8'ha1) ? wire34 : wire37)),
                          ($signed(wire35) ?
                              $signed(wire42) : $signed(wire34))}) : wire44[(3'h5):(2'h3)]);
  assign wire46 = wire43[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg47 <= ((wire44 ?
          (|(~|(-(8'ha2)))) : (~&$unsigned((wire44 ?
              wire37 : wire37)))) ~^ $signed((~($signed((7'h40)) ?
          (wire41 <= wire38) : (-wire41)))));
      reg48 <= ($signed((8'hbd)) ?
          ({$unsigned((&wire36)), wire41} ?
              {wire38} : $unsigned((wire38[(2'h2):(1'h1)] >= wire36[(4'h8):(1'h0)]))) : $signed(wire37));
      reg49 <= reg48;
      reg50 <= wire46;
    end
  assign wire51 = $signed((^~(-(wire37 > (wire34 | wire46)))));
  assign wire52 = $unsigned((~&$signed(({wire43} ?
                      $unsigned(wire44) : (^~reg40)))));
  assign wire53 = $signed({(8'hb4)});
  assign wire54 = {$signed($signed($unsigned((^reg39)))),
                      $signed(($unsigned($unsigned(wire51)) ~^ (^~(|wire37))))};
  assign wire55 = wire42[(1'h1):(1'h1)];
  assign wire56 = $unsigned(($unsigned($signed((wire43 ? (8'h9f) : wire46))) ?
                      reg40 : wire55));
endmodule
