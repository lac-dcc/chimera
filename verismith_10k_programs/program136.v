module top
#(parameter param156 = (((~^(8'h9c)) ? (8'hb8) : (!(8'ha4))) ? ({{(8'hbc), (~|(8'hba))}, (8'hb2)} ^~ (&((~&(8'h9e)) ? ((8'hb3) <<< (8'hbf)) : ((8'h9d) <= (7'h42))))) : ({(((8'hb8) ? (8'haf) : (8'h9e)) <<< (^(8'hae)))} ? (|((+(7'h40)) ? ((8'hb0) + (8'had)) : ((8'ha5) ? (8'hb4) : (7'h42)))) : (((^~(8'hb0)) & (^(8'h9c))) && ({(8'had), (8'hbd)} ? ((8'hb6) ^ (8'ha6)) : (8'hb9))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire155;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire153;
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire155,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire22,
                 wire23,
                 wire24,
                 wire57,
                 wire153,
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
                 (1'h0)};
  assign wire5 = (wire1[(3'h4):(1'h1)] ?
                     wire4 : ($unsigned($signed((|wire3))) > {((-wire4) ?
                             (wire3 ? (8'hae) : wire1) : $signed(wire1))}));
  assign wire6 = $signed(wire1);
  assign wire7 = $unsigned(($unsigned(((wire4 ? (8'h9e) : wire4) + (wire6 ?
                         wire3 : wire6))) ?
                     wire4 : (!wire1)));
  assign wire8 = wire4[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg9 <= $unsigned($unsigned(wire2[(1'h1):(1'h1)]));
      if ((~|((((~|wire2) ^ reg9) ?
          ($unsigned(reg9) + wire4[(4'hb):(4'ha)]) : wire1[(1'h1):(1'h0)]) ^ reg9[(1'h1):(1'h0)])))
        begin
          if ({wire0, (~&wire4)})
            begin
              reg10 <= wire5;
              reg11 <= (^~wire3);
              reg12 <= wire1;
            end
          else
            begin
              reg10 <= $unsigned($signed($unsigned(wire3[(3'h7):(3'h6)])));
              reg11 <= ({(~^$signed((reg12 ? wire4 : (8'hb0)))),
                      (^((reg9 ? reg12 : wire5) ?
                          (8'hae) : (wire6 >>> wire0)))} ?
                  $unsigned(($signed((reg12 ? wire6 : (8'had))) ?
                      (wire1[(1'h1):(1'h1)] & (reg10 << (8'ha9))) : wire8[(2'h3):(1'h0)])) : ({(~^wire0),
                      {reg12,
                          (~^wire2)}} < $unsigned(((wire0 | reg9) > wire8))));
            end
          if ($unsigned((($signed(reg9) ?
              wire0 : $signed({wire6, wire2})) == wire7)))
            begin
              reg13 <= $unsigned($unsigned(wire8));
              reg14 <= {(reg13[(3'h6):(3'h6)] ?
                      {wire6, (-((8'haf) ? reg12 : reg11))} : $signed({reg12,
                          ((8'hbe) >> reg12)}))};
              reg15 <= $signed(wire7);
              reg16 <= wire6;
            end
          else
            begin
              reg13 <= wire8[(4'h8):(2'h2)];
              reg14 <= $signed((&wire7[(4'h8):(3'h7)]));
              reg15 <= ($signed((wire0 ?
                      wire8 : (wire7 ? (reg15 ? reg9 : reg11) : reg15))) ?
                  (((|$unsigned(reg15)) && reg15) ?
                      (~((~^reg10) ? $unsigned(reg9) : (^~reg9))) : {({wire5,
                                  reg14} ?
                              wire4[(3'h5):(3'h4)] : (reg16 ?
                                  wire6 : wire3))}) : reg12);
              reg16 <= (~|(!(^~($signed(reg15) ?
                  (reg12 ? wire2 : reg11) : (wire0 ? wire6 : (8'hba))))));
              reg17 <= wire8;
            end
        end
      else
        begin
          if (wire0)
            begin
              reg10 <= wire6[(1'h0):(1'h0)];
              reg11 <= {$signed(($signed($signed(wire3)) <<< ((~wire3) ?
                      $signed(reg16) : reg17[(4'h9):(3'h6)])))};
              reg12 <= (reg9 != $signed(($signed((8'hb6)) ?
                  ((7'h41) ?
                      $unsigned(wire7) : {reg15, reg16}) : ($unsigned(wire7) ?
                      $unsigned(reg13) : wire4[(4'hb):(1'h0)]))));
              reg13 <= (wire1[(2'h3):(2'h3)] ?
                  ((+(&wire2[(3'h4):(1'h1)])) == ((|(reg9 << (8'ha6))) ?
                      wire3[(4'h9):(1'h0)] : {$signed((8'ha7)),
                          $unsigned((8'hac))})) : $signed($signed($signed($unsigned(wire3)))));
            end
          else
            begin
              reg10 <= wire0;
              reg11 <= $signed(($unsigned(reg10[(4'h8):(1'h0)]) << wire7));
            end
          reg14 <= $unsigned({wire5[(1'h1):(1'h0)], reg13[(2'h2):(1'h1)]});
          if (({wire5[(2'h3):(2'h2)]} & ((^~($unsigned(wire3) ?
              $signed(reg15) : reg13[(2'h2):(1'h0)])) ^~ ((~|$signed(wire0)) ?
              reg11[(2'h3):(2'h3)] : $signed($unsigned((8'h9f)))))))
            begin
              reg15 <= wire1[(2'h2):(2'h2)];
              reg16 <= ($signed(wire6[(1'h0):(1'h0)]) ?
                  ($signed($unsigned((7'h44))) ?
                      (8'hb7) : $signed(($unsigned(wire5) ^ ((7'h41) <<< wire3)))) : ($signed($signed($signed((7'h43)))) & ($signed($unsigned(wire5)) ?
                      (8'ha1) : {reg14, (~(8'hbd))})));
            end
          else
            begin
              reg15 <= $unsigned({(~&((8'hb5) | (reg10 <= wire8)))});
              reg16 <= reg14[(3'h6):(1'h0)];
              reg17 <= (+reg14);
              reg18 <= reg17;
            end
          if (reg9[(2'h2):(1'h0)])
            begin
              reg19 <= ((!$unsigned($signed((+reg14)))) ?
                  {wire8[(2'h2):(2'h2)],
                      ($unsigned((~&reg17)) && $unsigned((|reg10)))} : ($signed(wire8[(4'ha):(1'h1)]) ?
                      reg12[(5'h13):(5'h11)] : reg15[(3'h6):(1'h0)]));
            end
          else
            begin
              reg19 <= wire8;
            end
          reg20 <= $signed((($signed($signed(reg17)) < ((reg13 ?
              reg12 : reg12) + reg16)) < (^{((8'hbc) ? reg14 : reg14),
              (reg13 ? wire7 : wire8)})));
        end
      reg21 <= ((reg17 ?
          $unsigned($signed($signed(reg13))) : $signed({(~^wire5),
              wire2[(2'h2):(1'h0)]})) | ((^reg11[(4'hd):(4'hb)]) <= ($unsigned($signed((8'had))) < (^wire1))));
    end
  assign wire22 = ({($signed(reg9) ?
                          (wire3[(3'h6):(1'h1)] >> (reg20 || reg19)) : reg9),
                      reg13} * ({($unsigned(wire3) ?
                              $signed(reg11) : $unsigned(reg12))} ?
                      ($unsigned((reg13 >> reg17)) <= ((reg13 ?
                          reg9 : wire3) <<< (+wire3))) : (-(^(wire0 <<< wire4)))));
  assign wire23 = (+(($unsigned((~|reg18)) >= ($unsigned(reg14) << $signed(wire8))) >= $unsigned(($signed(wire0) <= (reg16 & (8'h9c))))));
  assign wire24 = (((($unsigned(reg10) ? (wire8 != wire1) : {reg11}) - reg12) ?
                          ((~&{wire8, reg13}) ?
                              ((wire3 ?
                                  reg18 : wire8) <= reg9) : (|wire1[(1'h1):(1'h1)])) : ((wire2 & reg10) ?
                              $signed(reg17[(3'h7):(3'h5)]) : wire7[(4'hb):(2'h2)])) ?
                      wire3 : (~&$signed(reg13[(4'hd):(1'h0)])));
  module25 #() modinst58 (wire57, clk, wire22, reg13, reg12, reg11, wire4);
  module59 #() modinst154 (.wire62(reg21), .clk(clk), .wire61(wire6), .y(wire153), .wire60(reg9), .wire63(reg15));
  assign wire155 = ((!(($signed(reg19) << (!reg20)) && $unsigned((!reg14)))) + ((+{(&wire6),
                           (!wire24)}) ?
                       (reg20[(1'h0):(1'h0)] ?
                           ((~|reg18) ?
                               $unsigned(reg10) : ((8'hb2) ?
                                   wire3 : wire1)) : {$unsigned(reg21)}) : $unsigned(reg20[(4'hc):(3'h4)])));
endmodule

module module59
#(parameter param152 = ((~&{(((8'hb5) ^~ (8'h9f)) + {(8'hbd), (8'hb2)})}) <<< {({((7'h40) <= (7'h42))} ? ((^(7'h41)) ? (~|(8'h9d)) : ((8'hb8) ? (8'hb0) : (8'ha4))) : ((!(8'ha1)) ? (|(8'hbd)) : (8'hbf))), (8'hba)}))
(y, clk, wire60, wire61, wire62, wire63);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire60;
  input wire signed [(4'ha):(1'h0)] wire61;
  input wire [(5'h15):(1'h0)] wire62;
  input wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire143;
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  assign y = {wire92,
                 wire94,
                 wire95,
                 wire96,
                 wire143,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  module64 #() modinst93 (wire92, clk, wire63, wire62, wire61, wire60, (8'had));
  assign wire94 = ((~&($unsigned((wire61 ? wire62 : (7'h43))) ?
                          ($signed(wire61) <<< (^~wire63)) : $signed($signed(wire63)))) ?
                      wire62[(5'h11):(1'h0)] : {wire63[(4'h9):(4'h9)]});
  assign wire95 = ({$unsigned($unsigned((wire62 | wire94)))} ?
                      ((((-(8'ha3)) ?
                              $unsigned(wire60) : wire63[(4'he):(2'h2)]) + ($signed(wire63) ?
                              {wire60} : wire63[(5'h12):(5'h12)])) ?
                          $signed({(wire61 ?
                                  wire60 : wire94)}) : {$signed($signed(wire61)),
                              wire92[(2'h3):(2'h3)]}) : wire62[(1'h1):(1'h1)]);
  assign wire96 = ($unsigned(wire62) == $signed(wire62[(5'h12):(3'h6)]));
  module97 #() modinst144 (.wire101(wire95), .clk(clk), .wire102(wire60), .y(wire143), .wire99(wire61), .wire98(wire92), .wire100(wire94));
  always
    @(posedge clk) begin
      if (wire96[(3'h5):(1'h1)])
        begin
          reg145 <= wire62[(3'h4):(2'h3)];
        end
      else
        begin
          reg145 <= ((wire61[(2'h2):(2'h2)] ?
              wire95[(4'hc):(4'h9)] : ((wire96[(4'hb):(3'h6)] ?
                      $unsigned(wire61) : $signed(reg145)) ?
                  wire63[(5'h11):(3'h6)] : wire92[(2'h2):(2'h2)])) - $signed(wire143[(3'h7):(2'h2)]));
          reg146 <= ($signed({$unsigned($signed(wire96)),
              (wire61 ?
                  $unsigned(wire62) : ((8'hb8) ^ wire60))}) | {$signed($unsigned((wire61 * wire94))),
              (&$signed((+wire94)))});
          reg147 <= wire62;
          reg148 <= (wire60[(2'h3):(1'h0)] > reg146[(3'h5):(2'h3)]);
        end
      reg149 <= (^({reg148[(4'hf):(4'hb)]} ?
          $signed((+$unsigned(wire61))) : wire62));
      reg150 <= $unsigned(wire96);
      reg151 <= wire143;
    end
endmodule

module module25
#(parameter param55 = (({(+(&(8'ha5))), {(8'hac)}} > (~(((8'ha2) <= (8'hae)) ? (+(8'hba)) : ((8'hbf) >= (7'h43))))) ? ({(((8'hbf) >>> (8'ha9)) ^ ((7'h41) ? (8'haf) : (8'hae)))} + ((^(~&(8'ha8))) ? (8'ha7) : {((8'hb8) ? (8'ha4) : (8'ha5)), ((8'hb6) && (8'haa))})) : ({{{(8'ha5), (8'haa)}, {(8'ha7)}}} ? {(((8'hae) ? (8'hba) : (8'hab)) <= {(8'hae), (8'hb2)}), {((7'h40) ? (8'h9d) : (7'h43)), ((7'h42) >>> (8'h9c))}} : (^~((-(8'hb0)) || {(8'had)})))), 
parameter param56 = param55)
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire27;
  input wire [(4'hc):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire46;
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire46,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire31 = ((~^($unsigned(wire27[(4'h8):(4'h8)]) ?
                          ((wire28 ? wire29 : wire26) & {wire28,
                              wire28}) : $signed($unsigned((7'h41))))) ?
                      {($signed(((8'ha3) ? wire29 : wire26)) << (~(wire28 ?
                              wire27 : wire28)))} : $signed($unsigned((^wire27))));
  assign wire32 = ((&(wire31 <<< ((+wire30) ?
                          (wire30 + wire28) : $unsigned(wire29)))) ?
                      wire28[(3'h4):(1'h1)] : (~^(|(8'h9f))));
  assign wire33 = $signed(($signed(wire32[(4'hd):(4'hc)]) ?
                      ((-wire26) * wire31[(4'h9):(3'h4)]) : $signed((~|{wire29}))));
  assign wire34 = {wire26};
  module35 #() modinst47 (wire46, clk, wire29, wire31, wire34, wire30, wire28);
  assign wire48 = (!wire32[(5'h15):(5'h14)]);
  assign wire49 = {{($unsigned((wire34 != wire32)) ?
                              wire32 : $signed({(8'hbf)})),
                          (^~$unsigned($unsigned((8'ha0))))}};
  assign wire50 = wire29[(2'h2):(1'h1)];
  assign wire51 = (~&(wire29[(2'h2):(1'h0)] ? wire50 : wire27));
  always
    @(posedge clk) begin
      reg52 <= wire33;
      reg53 <= (($unsigned((((8'h9f) ?
              wire33 : wire46) ~^ reg52[(1'h0):(1'h0)])) ?
          ($signed(reg52) + ((wire46 ? wire32 : wire51) ?
              $signed(wire30) : wire48[(2'h3):(2'h2)])) : ((&(wire33 ?
              wire50 : wire26)) | $unsigned((wire27 ?
              wire32 : wire34)))) != ($unsigned((~wire50[(2'h2):(1'h0)])) < $signed((8'hb3))));
      reg54 <= reg52;
    end
endmodule

module module35
#(parameter param45 = (|(^~((((8'ha9) ^ (8'hbc)) <= {(8'hbc), (8'hb9)}) ^~ {((8'ha6) ? (7'h40) : (8'hb0))}))))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire signed [(2'h3):(1'h0)] wire39;
  input wire [(2'h2):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  input wire signed [(4'hc):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  assign y = {wire44, wire43, wire42, wire41, (1'h0)};
  assign wire41 = $signed((^~wire40[(2'h2):(1'h0)]));
  assign wire42 = ($unsigned(($unsigned(wire37) << wire40[(1'h0):(1'h0)])) ~^ $unsigned($unsigned(((wire36 ?
                      wire36 : wire41) >= (wire39 ? (8'h9c) : wire39)))));
  assign wire43 = wire38[(1'h0):(1'h0)];
  assign wire44 = (~^($unsigned((8'h9f)) ?
                      wire42 : {(~|$unsigned(wire43)), wire37[(4'hc):(4'ha)]}));
endmodule

module module97
#(parameter param142 = ((8'hb3) ? (|((~|(8'haf)) >= (((8'hbe) <= (8'hbc)) ? ((8'ha5) - (8'hb4)) : (-(8'ha5))))) : (((~^((7'h43) ? (8'hb6) : (8'ha4))) != (((8'hb9) & (7'h40)) ? ((8'haa) >>> (8'ha9)) : {(8'h9c)})) ^ ((-{(8'hae)}) < ((~(8'hac)) ? ((8'hb7) * (8'hb0)) : (8'ha7))))))
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire102;
  input wire [(4'hd):(1'h0)] wire101;
  input wire signed [(3'h6):(1'h0)] wire100;
  input wire signed [(3'h7):(1'h0)] wire99;
  input wire [(3'h5):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire103;
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  assign y = {wire103,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire103 = wire100;
  always
    @(posedge clk) begin
      if (wire101[(4'ha):(3'h6)])
        begin
          reg104 <= (8'hab);
          reg105 <= ((+$signed($signed(wire100[(1'h1):(1'h0)]))) ?
              $signed({(!{wire102}),
                  wire98[(3'h5):(1'h0)]}) : ((wire102[(2'h3):(2'h2)] ?
                      ((wire98 ?
                          (8'hb7) : wire103) || reg104) : ((8'ha8) <= $signed(wire99))) ?
                  wire101 : (8'hab)));
        end
      else
        begin
          if ((wire102 ~^ wire101[(3'h4):(1'h0)]))
            begin
              reg104 <= $signed($unsigned(($unsigned(wire100) ^ (+$unsigned(wire103)))));
            end
          else
            begin
              reg104 <= ((((&{wire99}) >= reg104[(2'h3):(1'h1)]) ?
                  (($signed((8'ha4)) ^~ (wire98 << reg105)) ?
                      ({wire103} - (reg104 + wire99)) : $signed(wire102)) : wire103[(1'h1):(1'h1)]) <<< $signed((((wire101 ?
                      (8'hb4) : (7'h42)) ?
                  $signed((8'hbc)) : (wire98 ? reg105 : wire99)) <= (-((8'ha5) ?
                  wire102 : wire99)))));
              reg105 <= $unsigned((~|wire102[(1'h1):(1'h0)]));
              reg106 <= $signed((((wire100[(2'h2):(1'h0)] | ((8'hab) ?
                          reg105 : (8'hb0))) ?
                      (~|$unsigned(wire98)) : (8'hb9)) ?
                  (&(reg104 ?
                      $signed(wire100) : $unsigned(wire98))) : ((~|(~wire103)) >>> $unsigned((reg105 ?
                      wire101 : (8'ha3))))));
              reg107 <= wire98;
            end
          reg108 <= {$signed($signed(($unsigned((8'hb7)) ^ $signed(wire100)))),
              $unsigned($unsigned(((~wire100) ~^ (wire103 ^ wire98))))};
          reg109 <= $unsigned($signed((8'hac)));
        end
      reg110 <= ((|((~|wire102) ?
          ((reg104 ? wire98 : wire99) < (!wire100)) : {reg105[(2'h3):(1'h0)],
              wire103[(1'h0):(1'h0)]})) || ((wire102[(1'h0):(1'h0)] ?
              wire101[(3'h6):(2'h2)] : wire98) ?
          $signed(((+(8'hb9)) + reg109[(3'h7):(3'h5)])) : ({(+(8'hb3)),
              $unsigned(wire102)} & reg105[(2'h2):(2'h2)])));
      reg111 <= {(~|$unsigned(wire98)), wire99[(3'h4):(3'h4)]};
      reg112 <= (reg111[(2'h3):(1'h0)] && $unsigned($signed(reg110[(2'h2):(2'h2)])));
      reg113 <= (((!(reg110 ?
              $unsigned(wire99) : wire103[(1'h1):(1'h0)])) <<< (+wire102)) ?
          (~|$signed(reg104)) : {$unsigned(reg110), wire102[(2'h2):(1'h0)]});
    end
  always
    @(posedge clk) begin
      reg114 <= (reg111[(2'h3):(1'h1)] << (~|$unsigned(wire101[(3'h5):(1'h1)])));
      if ({(^~wire101), reg111[(3'h5):(2'h2)]})
        begin
          reg115 <= $signed(($signed($unsigned(wire100[(3'h5):(1'h0)])) <<< ({{reg113},
                  {reg110}} ?
              ($signed(reg112) >= $signed(wire98)) : reg111)));
          if (($signed((((reg105 ?
              reg109 : (8'hbb)) || wire102[(2'h2):(2'h2)]) | ((wire100 ?
              reg105 : wire102) && $unsigned(reg111)))) >= ($signed((wire101[(3'h4):(2'h3)] == $unsigned((8'hbc)))) | {wire102[(2'h2):(1'h0)]})))
            begin
              reg116 <= ((8'h9e) ?
                  ($signed({$signed(wire98)}) ?
                      reg109 : (^$unsigned(((8'hbd) > reg112)))) : wire98[(2'h3):(2'h3)]);
              reg117 <= ($unsigned($unsigned((~|((8'hb7) >= wire99)))) + (reg105 ?
                  {$signed((^~reg114)),
                      ({(8'hb2), wire100} || ((8'hbc) ?
                          reg110 : wire101))} : $unsigned(wire100[(1'h0):(1'h0)])));
              reg118 <= (^~(((^reg108) ^~ (reg113 ?
                      ((8'ha8) ^~ wire98) : (reg112 <<< reg117))) ?
                  ((reg115[(2'h3):(2'h2)] * $signed(reg111)) ^~ (^~(^reg105))) : (!wire98[(2'h2):(1'h0)])));
              reg119 <= reg108[(3'h7):(1'h1)];
            end
          else
            begin
              reg116 <= {$signed(reg118)};
            end
        end
      else
        begin
          reg115 <= reg114[(1'h1):(1'h1)];
          reg116 <= $signed(($signed((!(reg118 >= reg112))) * (+{reg106,
              wire99[(2'h3):(1'h1)]})));
          if (wire103)
            begin
              reg117 <= reg116;
              reg118 <= (8'hb2);
            end
          else
            begin
              reg117 <= ((^~$unsigned($signed({reg110,
                  reg104}))) < (reg111[(2'h3):(1'h0)] & (^$unsigned($signed(wire100)))));
              reg118 <= $unsigned($signed($unsigned({reg118, {reg116}})));
              reg119 <= reg104[(4'hc):(3'h4)];
              reg120 <= wire98;
            end
          reg121 <= $unsigned($unsigned($unsigned((reg110 ?
              (wire99 ? reg119 : wire103) : $signed((8'ha3))))));
        end
      reg122 <= ($signed((reg119 ? $unsigned($signed((8'hbd))) : reg118)) ?
          (~$signed(((reg119 ?
              reg117 : reg111) <= $unsigned(wire99)))) : $unsigned(wire98));
      if ((^~((($unsigned(wire98) <= (reg114 ? reg113 : reg104)) ?
          (reg108 | (reg105 | reg105)) : $unsigned((~(7'h41)))) && ($signed($signed(reg109)) ~^ ((8'h9d) ?
          $unsigned((8'h9f)) : $unsigned(wire101))))))
        begin
          reg123 <= (&(wire101 < (~^reg106[(2'h2):(1'h0)])));
          reg124 <= (|$signed(({(7'h40), $signed(wire102)} | wire99)));
          if ((+{reg109[(1'h0):(1'h0)]}))
            begin
              reg125 <= $unsigned(reg122[(4'hb):(3'h7)]);
              reg126 <= $signed($unsigned((-($signed(reg119) ?
                  (!wire100) : ((8'hbd) > reg113)))));
              reg127 <= (^~(~^(8'ha5)));
              reg128 <= reg114;
              reg129 <= reg117;
            end
          else
            begin
              reg125 <= (~^$unsigned(reg124));
              reg126 <= wire102[(1'h1):(1'h0)];
              reg127 <= (~^{$unsigned({(reg112 || (8'hbf)), {reg108, (8'hbc)}}),
                  (|$unsigned({reg127}))});
            end
        end
      else
        begin
          reg123 <= reg108;
          if ((reg129 ?
              reg113[(2'h3):(1'h0)] : (-{({wire102, reg108} ?
                      $unsigned(reg104) : reg107),
                  ((~&reg129) ? $signed((8'hba)) : $signed(wire101))})))
            begin
              reg124 <= reg123[(4'he):(4'ha)];
              reg125 <= reg117;
              reg126 <= $signed(($signed(((reg107 ? reg128 : reg128) ?
                      reg104 : $unsigned(reg116))) ?
                  $signed(($signed(wire101) & reg124[(5'h11):(2'h3)])) : $unsigned($signed($signed(reg110)))));
              reg127 <= (~|wire99[(3'h5):(2'h3)]);
            end
          else
            begin
              reg124 <= $signed($unsigned(reg110));
            end
        end
    end
  always
    @(posedge clk) begin
      if ($signed(($unsigned((^~(8'haf))) > (|(wire99[(3'h4):(3'h4)] ?
          $unsigned(reg109) : (&wire100))))))
        begin
          reg130 <= {reg108};
          reg131 <= wire100;
          reg132 <= $signed({(((reg120 ? reg127 : (8'hb1)) == (!reg111)) ?
                  (wire98 ?
                      (8'hb2) : (reg124 < reg113)) : {wire101[(4'h8):(1'h1)]})});
          reg133 <= reg110[(1'h0):(1'h0)];
        end
      else
        begin
          reg130 <= ((reg116 ^ reg122) ?
              reg108[(3'h7):(3'h5)] : ($unsigned($signed($signed(wire102))) | (~&(wire102[(2'h2):(1'h1)] <<< $unsigned(reg122)))));
          reg131 <= reg132;
        end
      if (($signed(wire103[(1'h1):(1'h0)]) ?
          (^~($signed($unsigned(reg109)) == $unsigned($unsigned((8'ha3))))) : ((^reg110[(4'h9):(2'h2)]) ^ (-wire99))))
        begin
          reg134 <= ((reg109[(2'h2):(1'h1)] ?
                  reg113[(2'h3):(2'h2)] : wire100[(1'h0):(1'h0)]) ?
              $unsigned((($unsigned(reg108) < (reg110 ?
                  (8'ha0) : reg133)) > $signed($unsigned(reg129)))) : (reg106 ?
                  $signed(reg109) : reg114));
          reg135 <= ($signed(reg121[(4'hb):(4'ha)]) ?
              reg134[(3'h5):(3'h4)] : ((~&reg134) ? reg127 : wire103));
          reg136 <= wire99;
          reg137 <= reg118;
        end
      else
        begin
          if ((8'ha2))
            begin
              reg134 <= $signed(reg113[(1'h0):(1'h0)]);
              reg135 <= $signed($unsigned(($signed((-reg117)) << ({reg111,
                  reg122} - (reg128 ^~ (8'hb0))))));
              reg136 <= (!{reg114[(3'h4):(1'h0)]});
              reg137 <= $signed(((8'hb4) && (reg122 ?
                  $signed($unsigned(wire98)) : $signed(reg113))));
              reg138 <= $signed($unsigned($signed(({reg135} | {reg137}))));
            end
          else
            begin
              reg134 <= reg124;
              reg135 <= (|$unsigned($unsigned(reg135)));
              reg136 <= ({$signed(reg132),
                      $unsigned((reg105[(3'h4):(3'h4)] ?
                          (reg119 <= reg106) : (reg131 ? reg127 : wire100)))} ?
                  (({$unsigned(wire102)} ?
                      {reg112} : reg136[(1'h1):(1'h0)]) & $unsigned($unsigned(reg110))) : reg107[(2'h3):(1'h0)]);
            end
          reg139 <= reg135;
        end
      reg140 <= (|$signed(((~&$signed(reg127)) == (reg121[(4'he):(4'h8)] ?
          (reg108 ? reg137 : reg119) : (^~reg114)))));
      reg141 <= reg106[(2'h3):(1'h1)];
    end
endmodule

module module64  (y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire68;
  input wire signed [(4'ha):(1'h0)] wire67;
  input wire [(2'h2):(1'h0)] wire66;
  input wire [(4'hf):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  assign y = {wire91,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg90,
                 reg89,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire70 = ((~&({(wire68 ? wire66 : wire69),
                      $signed((8'hbc))} * (8'hb3))) + $signed(((8'hb4) >> wire69)));
  assign wire71 = (({((wire66 <<< wire70) ?
                              $signed(wire65) : (wire70 ? wire70 : wire66)),
                          wire66[(1'h1):(1'h0)]} || (!wire69[(4'hd):(2'h3)])) ?
                      (wire65 ?
                          $unsigned(($signed(wire68) ?
                              $unsigned(wire67) : (wire68 | wire65))) : (-(~|wire69))) : wire67[(3'h6):(3'h6)]);
  assign wire72 = {$unsigned(wire70), {wire68}};
  assign wire73 = $unsigned(wire67);
  always
    @(posedge clk) begin
      reg74 <= wire66;
      reg75 <= ((wire67[(2'h2):(1'h1)] > ((^~(~^wire66)) ?
          wire65 : $signed({wire72}))) << $unsigned(((wire65[(3'h4):(2'h2)] ?
              (wire66 ? (8'had) : reg74) : $unsigned((8'ha8))) ?
          {{reg74, wire65}, $unsigned((8'hb4))} : wire70[(3'h6):(2'h2)])));
      reg76 <= (({(wire65 ? {wire67} : reg74[(3'h7):(2'h2)]),
          wire67} == (reg75[(3'h4):(2'h2)] ?
          wire65 : $unsigned((~(8'haa))))) || ((({wire72} ?
          (wire72 ?
              wire71 : wire69) : $unsigned(wire69)) > $unsigned((8'h9d))) && reg74));
      reg77 <= reg74[(4'hf):(4'he)];
    end
  always
    @(posedge clk) begin
      if ($unsigned(((wire71[(2'h3):(1'h0)] >> (~^(-(7'h41)))) ^~ ($unsigned($signed(reg75)) ?
          $unsigned($unsigned(wire70)) : (~&wire68[(5'h15):(3'h7)])))))
        begin
          reg78 <= {wire66[(1'h1):(1'h0)]};
          reg79 <= {$signed((&($unsigned((8'hb8)) >>> reg75)))};
        end
      else
        begin
          reg78 <= $signed($signed({$unsigned({wire73}),
              $unsigned((^wire70))}));
          reg79 <= $signed((wire66 ? wire70 : $unsigned(wire66)));
        end
      reg80 <= ($unsigned(wire65) == (^~($unsigned($signed(wire70)) ?
          ($unsigned((8'hb3)) ? (wire71 ? wire72 : reg77) : reg76) : ((&reg74) ?
              {reg76} : (wire73 ? reg74 : wire72)))));
    end
  assign wire81 = ($unsigned(reg78[(4'h8):(3'h6)]) ?
                      (~&$signed((wire69 ?
                          (wire68 ?
                              reg75 : wire67) : (reg80 == reg75)))) : (reg77[(1'h0):(1'h0)] == (((wire68 ?
                                  reg80 : wire72) ?
                              $unsigned(wire72) : (reg77 - wire65)) ?
                          ($unsigned(reg78) ^~ (^wire69)) : $signed((8'ha8)))));
  assign wire82 = $unsigned($signed(wire72));
  assign wire83 = (~wire81[(1'h1):(1'h1)]);
  assign wire84 = wire81[(1'h1):(1'h1)];
  assign wire85 = (8'ha3);
  assign wire86 = $unsigned(((wire85[(5'h13):(4'hc)] <<< wire71) ?
                      ($signed($unsigned(wire70)) ?
                          reg78[(2'h3):(1'h0)] : wire85) : (reg75 == wire82[(2'h3):(2'h3)])));
  assign wire87 = reg75[(4'ha):(3'h5)];
  assign wire88 = (wire83 <= wire66);
  always
    @(posedge clk) begin
      reg89 <= (($signed(wire86) ~^ {((8'ha3) ?
              (+(8'hb5)) : (wire73 >= (8'hb4))),
          $signed((reg80 ? (8'hae) : wire66))}) ^ (+wire84[(3'h6):(3'h5)]));
      reg90 <= $signed($unsigned((((~&(8'haf)) ?
              (-reg77) : ((8'hb7) || (8'hb0))) ?
          ((~^wire86) & wire67) : wire82)));
    end
  assign wire91 = {wire87[(3'h6):(3'h5)]};
endmodule
