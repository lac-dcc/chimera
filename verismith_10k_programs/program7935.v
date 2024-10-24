module top
#(parameter param167 = (^(((((8'hb6) | (8'hbb)) ~^ (~^(8'hab))) * (((8'had) & (7'h43)) << ((8'ha4) & (8'hb2)))) ? (|(((8'hb3) ? (8'hb1) : (8'hb9)) && ((8'hab) ? (8'hb8) : (8'hb2)))) : (-(~(8'h9e))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire166;
  wire signed [(5'h12):(1'h0)] wire165;
  wire signed [(5'h10):(1'h0)] wire164;
  wire signed [(3'h7):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire5;
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 wire59,
                 wire58,
                 wire56,
                 wire5,
                 (1'h0)};
  assign wire5 = ((8'hb7) > $signed((~^{$unsigned(wire3), $unsigned(wire0)})));
  module6 #() modinst57 (wire56, clk, wire3, wire0, wire1, wire5);
  assign wire58 = $unsigned($unsigned($signed({(wire3 ? (8'ha5) : wire1),
                      wire2[(1'h0):(1'h0)]})));
  assign wire59 = $signed((8'ha9));
  module60 #() modinst162 (.wire63(wire1), .wire62(wire5), .wire61(wire59), .y(wire161), .clk(clk), .wire64(wire58));
  assign wire163 = wire1[(5'h10):(4'hd)];
  assign wire164 = ((&(^wire4)) ?
                       $signed(wire161) : (wire1[(2'h2):(1'h1)] ?
                           wire163[(3'h5):(3'h5)] : $unsigned($unsigned((wire0 >> wire58)))));
  assign wire165 = {wire59[(3'h6):(1'h0)]};
  assign wire166 = (wire4 < (!wire164));
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire signed [(4'hf):(1'h0)] wire63;
  input wire [(4'hf):(1'h0)] wire62;
  input wire [(5'h13):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire160;
  wire [(5'h14):(1'h0)] wire157;
  wire [(4'hd):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire148;
  wire [(3'h5):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire145;
  wire signed [(4'h8):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire143;
  wire [(4'he):(1'h0)] wire142;
  wire [(4'hf):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire65;
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  assign y = {wire160,
                 wire157,
                 wire156,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire95,
                 wire65,
                 reg159,
                 reg158,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg146,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire65 = wire64[(3'h4):(2'h2)];
  module66 #() modinst96 (wire95, clk, wire62, wire65, wire63, wire61);
  always
    @(posedge clk) begin
      if (((wire64 ? (~&$unsigned($signed(wire63))) : (+{(8'h9c)})) ?
          (-$unsigned({$signed(wire62)})) : {(wire63 > wire62[(3'h4):(2'h3)])}))
        begin
          reg97 <= wire61;
        end
      else
        begin
          reg97 <= (~|$unsigned(wire63[(3'h6):(1'h1)]));
        end
      reg98 <= {((-wire62) >> $unsigned((8'ha6)))};
      reg99 <= (wire65[(5'h12):(5'h12)] ? (|wire62[(2'h3):(1'h1)]) : wire64);
      reg100 <= reg98;
      reg101 <= reg99;
    end
  module102 #() modinst141 (wire140, clk, wire64, reg101, reg97, wire62);
  assign wire142 = wire63[(1'h0):(1'h0)];
  assign wire143 = ((wire62[(4'hd):(1'h1)] ?
                       (~$unsigned(wire63)) : (&($unsigned(wire142) < (wire62 ?
                           (7'h43) : wire142)))) + $unsigned($signed((wire64 ?
                       wire65[(3'h7):(3'h7)] : (+reg101)))));
  assign wire144 = wire143;
  assign wire145 = reg100;
  always
    @(posedge clk) begin
      reg146 <= reg98[(1'h1):(1'h0)];
    end
  assign wire147 = wire143[(4'h9):(3'h6)];
  assign wire148 = (wire95 | (wire65 ?
                       (-reg97) : (reg101[(2'h2):(1'h0)] ?
                           wire63[(4'h8):(1'h0)] : $signed((reg146 ?
                               wire143 : reg98)))));
  assign wire149 = wire143[(1'h0):(1'h0)];
  assign wire150 = ($unsigned((|(reg99[(4'h9):(1'h1)] * (|reg99)))) << $unsigned(({wire149} <<< ((wire142 == reg146) ~^ wire140))));
  assign wire151 = ({(~&((wire64 ? reg100 : wire144) ?
                           wire142 : (wire150 ? wire62 : wire95)))} >> reg101);
  always
    @(posedge clk) begin
      reg152 <= (|{{reg101[(1'h1):(1'h0)]}, $signed((7'h44))});
      reg153 <= reg99[(4'h8):(3'h6)];
      reg154 <= (!wire95[(3'h5):(3'h4)]);
      reg155 <= $unsigned(wire151[(3'h6):(3'h4)]);
    end
  assign wire156 = $signed(wire144[(3'h6):(3'h5)]);
  assign wire157 = wire62;
  always
    @(posedge clk) begin
      reg158 <= wire156;
      reg159 <= $unsigned($unsigned($unsigned($signed(reg101[(1'h1):(1'h1)]))));
    end
  assign wire160 = wire143[(1'h0):(1'h0)];
endmodule

module module6
#(parameter param55 = {(((~(-(8'ha0))) ~^ (8'haa)) || ((((7'h41) && (8'hab)) > (^(8'h9f))) ? ((^~(8'hbb)) ? ((8'hbf) ? (8'ha2) : (8'ha8)) : {(8'hb7), (8'ha4)}) : ({(8'hb0)} | (-(8'ha2))))), ((!(((8'hb7) | (8'ha1)) ? ((8'hbf) * (8'h9c)) : {(8'ha2)})) ? ((((8'ha2) ~^ (8'ha3)) ? ((8'ha9) ? (8'h9c) : (8'hb5)) : (!(8'ha7))) ^ (((8'hab) - (8'ha9)) ? ((8'hbd) & (8'h9c)) : (~(8'h9f)))) : (+(+((8'hb4) ? (8'h9c) : (8'hb9)))))})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire11;
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire41,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire16,
                 wire11,
                 reg54,
                 reg53,
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
                 reg22,
                 reg18,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = $unsigned(wire9[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      if ((wire9 ~^ {((wire8 ? wire9[(3'h4):(2'h2)] : (^~wire8)) ?
              $unsigned(wire9[(3'h5):(3'h5)]) : (8'hbb))}))
        begin
          reg12 <= ($signed($unsigned(wire7[(3'h4):(1'h0)])) >= wire10[(1'h1):(1'h0)]);
          reg13 <= wire11;
          reg14 <= ((wire8[(2'h2):(2'h2)] == ($signed((~^(8'ha3))) - (~(^wire10)))) ?
              (((((8'hbb) ? wire8 : wire11) ?
                      wire7 : (reg12 ? wire9 : wire10)) ~^ (&wire8)) ?
                  $unsigned((8'ha1)) : (&reg13)) : ({(((8'hac) ?
                          (8'hb2) : wire7) || wire7)} ?
                  (^~reg13) : $unsigned(wire11)));
        end
      else
        begin
          reg12 <= wire10;
          reg13 <= (8'hb0);
          reg14 <= (!($unsigned((wire7 ^ (wire11 ?
              wire10 : wire8))) <= ($signed((reg12 ?
              wire8 : wire11)) >>> ((wire10 ? wire8 : wire11) << (8'ha4)))));
        end
      reg15 <= {((reg14 ^~ (reg12 ? $signed(reg14) : (reg12 ~^ (8'ha2)))) ?
              ((8'h9c) ? ((!reg12) <<< wire11) : wire11) : (8'hbc)),
          ($signed($unsigned((wire9 ?
              wire9 : wire7))) << $unsigned(($signed(wire7) ?
              (8'ha9) : wire7[(3'h6):(2'h3)])))};
    end
  assign wire16 = $signed((+wire9[(2'h3):(1'h0)]));
  assign wire17 = ($signed((reg14[(3'h6):(1'h0)] * ((wire8 <<< wire11) >= (reg15 ?
                          reg15 : wire16)))) ?
                      $unsigned((~&wire16[(3'h7):(1'h0)])) : $signed((^$signed($signed(wire16)))));
  always
    @(posedge clk) begin
      reg18 <= (^wire7[(4'h8):(2'h3)]);
    end
  assign wire19 = {(~{{(reg15 + reg12)}}),
                      {reg15[(3'h6):(3'h5)],
                          $signed((reg15[(3'h4):(2'h3)] ?
                              wire9 : $signed(wire9)))}};
  assign wire20 = (reg13[(4'h9):(2'h2)] >> $signed(wire16));
  assign wire21 = {($signed($signed((~^wire19))) < wire16[(2'h2):(2'h2)])};
  always
    @(posedge clk) begin
      reg22 <= reg13;
    end
  module23 #() modinst42 (.wire25(reg14), .wire27(wire7), .wire24(wire8), .wire26(reg15), .clk(clk), .y(wire41));
  always
    @(posedge clk) begin
      reg43 <= (8'ha9);
      reg44 <= (8'hba);
      if (reg44[(5'h11):(4'hc)])
        begin
          if ((wire16 ?
              ({wire21} ?
                  $signed((8'ha6)) : ($unsigned((reg43 << reg14)) * {{(8'ha6),
                          wire10}})) : $unsigned({($unsigned((8'ha5)) ?
                      $signed(reg22) : $signed(wire19))})))
            begin
              reg45 <= (|((reg12[(4'hd):(4'ha)] + ($unsigned(wire11) > (wire11 ?
                  reg15 : reg14))) > wire19));
              reg46 <= wire9[(2'h2):(1'h1)];
              reg47 <= reg18;
              reg48 <= wire8[(5'h10):(4'hf)];
              reg49 <= ({reg48, (8'hbe)} ?
                  reg48 : $signed(reg13[(5'h13):(4'hb)]));
            end
          else
            begin
              reg45 <= reg22[(1'h1):(1'h0)];
              reg46 <= $unsigned(($unsigned(wire10) << (($unsigned((8'hbf)) <<< {reg45}) ?
                  (^{(8'ha0)}) : (~|{reg14, reg13}))));
              reg47 <= (((!(((8'hbe) ? wire9 : (8'hae)) ?
                      (wire11 ? wire41 : (7'h42)) : (reg13 <= wire8))) ?
                  {((wire17 ? wire19 : reg14) ?
                          {reg14} : {wire21, reg14})} : (wire11[(4'hc):(2'h2)] ?
                      $unsigned(wire10[(3'h6):(2'h2)]) : ((reg13 && reg13) ?
                          $signed(wire16) : (^wire9)))) | {($signed($signed((8'hb0))) ?
                      $signed(reg47) : wire11[(1'h1):(1'h0)]),
                  (~|($signed(wire9) ? $signed(wire11) : $unsigned((8'ha1))))});
              reg48 <= $unsigned({(reg18 < reg45[(1'h0):(1'h0)]), wire19});
            end
          reg50 <= wire21;
          reg51 <= reg45[(1'h0):(1'h0)];
          if (($signed(($signed($unsigned(wire10)) ?
                  reg45 : ((reg48 ? reg12 : wire7) ?
                      $unsigned(reg45) : (-(8'ha3))))) ?
              reg46 : ($unsigned(reg22) + {$unsigned((^reg14))})))
            begin
              reg52 <= (-(($signed($signed(wire9)) || (reg46 && (&reg51))) | (~^((reg46 || reg44) ?
                  reg13 : reg48[(4'ha):(4'h9)]))));
              reg53 <= $unsigned($signed((~&(~^wire9))));
            end
          else
            begin
              reg52 <= (^~reg13[(4'hb):(4'hb)]);
            end
          reg54 <= {((($unsigned(wire11) ~^ (~wire16)) <= wire8) ?
                  reg13[(5'h12):(1'h0)] : reg49),
              ((wire11[(4'h8):(1'h0)] ?
                  ($signed(reg53) ?
                      reg22[(4'h9):(4'h9)] : $unsigned(wire20)) : reg50) ^~ reg12)};
        end
      else
        begin
          reg45 <= ({reg46[(1'h0):(1'h0)]} ?
              $signed($unsigned({wire10[(4'hb):(4'hb)]})) : wire19[(5'h13):(1'h0)]);
        end
    end
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = $unsigned(wire27[(3'h6):(1'h0)]);
  assign wire29 = ($signed($signed(wire24[(3'h5):(3'h4)])) - {$signed({wire25[(1'h1):(1'h0)]})});
  assign wire30 = (+((&{$unsigned(wire26)}) > (|$signed((+wire26)))));
  assign wire31 = wire26[(4'ha):(1'h0)];
  assign wire32 = wire31;
  assign wire33 = (wire27 ? {wire32, ((~wire29) > (8'h9c))} : wire27);
  assign wire34 = (|wire33[(4'ha):(4'h8)]);
  assign wire35 = (~|(^~$signed({(wire33 ? (8'ha3) : (8'ha4)), (^~wire30)})));
  assign wire36 = {wire24};
  assign wire37 = wire32;
  assign wire38 = $unsigned((((8'ha6) ?
                          ($unsigned(wire27) ?
                              (~wire36) : (~|wire31)) : (^(wire31 ?
                              (8'ha4) : wire37))) ?
                      $signed((wire24[(2'h3):(2'h3)] ?
                          $signed(wire26) : $signed((7'h40)))) : ($unsigned((wire31 ?
                          wire28 : wire32)) & $unsigned({wire33, wire37}))));
  assign wire39 = ($signed($signed((~^{wire35}))) < ($unsigned((wire36 ?
                          $signed(wire38) : $unsigned(wire24))) ?
                      $unsigned(wire38[(4'hf):(4'h8)]) : (wire31[(2'h3):(1'h0)] ?
                          (wire38 > wire36) : ((8'ha7) ?
                              $signed(wire38) : $unsigned((8'h9c))))));
  assign wire40 = wire36;
endmodule

module module102
#(parameter param138 = ((((((8'ha2) >>> (8'ha0)) >> ((8'hbd) ? (8'h9f) : (8'ha9))) >= (~|(~&(8'hb7)))) >> {(((8'h9c) == (8'ha1)) - ((8'ha3) || (8'hba))), ((~^(8'hbf)) ? {(7'h43), (8'h9d)} : {(8'h9f), (8'h9e)})}) < (~|((7'h40) << ({(8'haa), (8'h9d)} ^~ (&(7'h42)))))), 
parameter param139 = ((param138 ? {(~&{param138, param138})} : (((param138 ? param138 : param138) ? param138 : (param138 ~^ param138)) | {param138, (~^param138)})) >> (^~(-((param138 ? param138 : param138) ? (param138 ^ (8'ha2)) : (~&(8'ha8)))))))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire106;
  input wire signed [(2'h3):(1'h0)] wire105;
  input wire [(2'h2):(1'h0)] wire104;
  input wire signed [(4'hf):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire129;
  wire [(5'h15):(1'h0)] wire128;
  wire signed [(4'hf):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire107;
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire107,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
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
                 (1'h0)};
  assign wire107 = (^~(~|{wire103}));
  always
    @(posedge clk) begin
      reg108 <= $signed((-(+$unsigned($signed(wire106)))));
    end
  always
    @(posedge clk) begin
      reg109 <= ({reg108[(1'h1):(1'h0)]} ?
          $unsigned({({wire107} ? wire103 : wire107)}) : wire104);
      reg110 <= reg109[(5'h10):(3'h7)];
      reg111 <= wire103;
      if ($unsigned({((wire104 << $unsigned(reg108)) >= (~^{(8'haf)})),
          {reg110[(3'h7):(1'h1)]}}))
        begin
          if ((~^$signed(wire103[(4'he):(3'h6)])))
            begin
              reg112 <= (^~(wire106 ?
                  ($signed((!wire105)) <= ($unsigned(wire104) <= (wire103 ?
                      reg108 : wire107))) : reg109));
              reg113 <= $unsigned(wire107);
              reg114 <= (reg111 ?
                  (|(^~reg112)) : (!(reg112[(1'h1):(1'h1)] * ((-reg113) >= $unsigned(reg110)))));
              reg115 <= wire106[(4'hd):(3'h4)];
              reg116 <= (($signed($signed((wire106 > reg111))) ?
                  (({wire104, reg108} ?
                      reg113 : (reg115 * wire107)) >>> {wire103[(4'hb):(4'h8)],
                      (^wire103)}) : {(-(wire104 ?
                          reg113 : reg111))}) || (!(+reg110[(1'h0):(1'h0)])));
            end
          else
            begin
              reg112 <= reg108[(2'h2):(1'h0)];
              reg113 <= ((wire106[(3'h6):(1'h0)] ^ $unsigned((wire104[(2'h2):(1'h1)] & $signed((8'ha4))))) << (^~wire104[(1'h1):(1'h1)]));
              reg114 <= $unsigned($unsigned($unsigned((~|reg114))));
              reg115 <= (reg114 ? reg114[(1'h0):(1'h0)] : $signed(reg109));
            end
          reg117 <= reg109[(1'h1):(1'h1)];
        end
      else
        begin
          if ($signed($signed((~&reg109))))
            begin
              reg112 <= (~&$signed(reg117[(5'h11):(4'hd)]));
              reg113 <= (&((+(reg108 << (&reg114))) & $unsigned((8'hb7))));
            end
          else
            begin
              reg112 <= {$unsigned($unsigned($unsigned((&wire107)))),
                  ($signed(reg116[(3'h6):(3'h5)]) == (~&reg115))};
              reg113 <= ($unsigned((^{$signed((8'ha4))})) | ((^$unsigned((reg114 ^~ wire105))) ?
                  reg113 : reg116));
              reg114 <= (($unsigned(wire107) ~^ $signed(reg108[(1'h1):(1'h1)])) ?
                  (-(^$unsigned((wire103 ?
                      wire104 : wire104)))) : reg115[(4'h8):(3'h6)]);
              reg115 <= $unsigned(reg111[(4'hc):(3'h5)]);
            end
          reg116 <= $unsigned(wire104);
          reg117 <= (~reg115[(1'h0):(1'h0)]);
          reg118 <= $unsigned(((-reg109[(4'he):(4'he)]) ?
              (~|(!(~^wire107))) : (!reg117)));
          reg119 <= {$signed((reg115[(3'h6):(2'h3)] ?
                  ($unsigned(reg109) - {reg109}) : {(~|wire106)})),
              (^~(wire103[(4'hf):(3'h6)] + $signed((reg117 ?
                  reg108 : wire105))))};
        end
      reg120 <= $signed(($signed(wire103) ?
          ($unsigned($signed(wire107)) ?
              reg111[(1'h0):(1'h0)] : (~&(~&(8'hac)))) : ($unsigned(reg113) == (^$unsigned(reg109)))));
    end
  assign wire121 = reg117;
  assign wire122 = {(~&(reg110[(4'h8):(3'h4)] ?
                           $signed(wire103) : $unsigned($unsigned((8'hbc)))))};
  assign wire123 = reg110;
  assign wire124 = reg119[(4'he):(4'h9)];
  assign wire125 = (((($unsigned(reg114) ^~ $signed((8'ha8))) ?
                           wire124 : $unsigned($unsigned(reg108))) ?
                       wire121 : $unsigned((|$unsigned(reg118)))) || wire105);
  assign wire126 = ((^((~reg111[(3'h7):(1'h1)]) + (~^(^~wire106)))) | wire105[(2'h3):(1'h0)]);
  assign wire127 = wire123[(3'h5):(3'h4)];
  assign wire128 = wire125[(3'h6):(2'h2)];
  assign wire129 = $signed((~|(+((reg111 ? wire104 : reg109) ?
                       (~&wire122) : wire125))));
  always
    @(posedge clk) begin
      reg130 <= wire128[(5'h14):(5'h13)];
      if ($unsigned(reg114))
        begin
          reg131 <= $signed(reg130[(3'h6):(3'h4)]);
          reg132 <= {((!(8'hb6)) ?
                  $unsigned($signed((wire122 <<< (8'ha6)))) : $signed(({reg111,
                          reg131} ?
                      (wire123 ? reg117 : wire122) : (-wire128))))};
          reg133 <= (~|(&{reg132}));
          reg134 <= $signed(({$signed($signed(wire107))} ^~ reg109[(3'h5):(1'h0)]));
          reg135 <= reg109;
        end
      else
        begin
          reg131 <= wire121;
          reg132 <= (!(reg135 & (~^((~^wire125) >>> (wire123 ^~ (8'ha0))))));
          if ($signed($unsigned(reg118[(2'h3):(2'h2)])))
            begin
              reg133 <= $unsigned(($unsigned($signed(wire104[(1'h0):(1'h0)])) ^ (reg112 == wire104)));
              reg134 <= ((~(reg113[(1'h1):(1'h1)] ?
                      (wire107 <= {reg135}) : $signed(wire105[(1'h1):(1'h0)]))) ?
                  $signed(wire107) : ($signed($unsigned((-wire124))) != {$signed(reg109[(3'h6):(2'h3)])}));
              reg135 <= $unsigned((((8'ha2) ?
                  {(reg112 ? wire123 : wire122),
                      $signed((8'hb2))} : $signed((reg130 >= reg108))) || wire103[(2'h2):(1'h1)]));
            end
          else
            begin
              reg133 <= $unsigned(($unsigned((reg135 ?
                      $signed(reg131) : (~reg110))) ?
                  reg132[(4'ha):(4'h9)] : (8'h9d)));
              reg134 <= (((~^((~|wire127) ?
                      $unsigned((8'hbc)) : $signed(reg117))) > wire107[(4'hd):(4'hb)]) ?
                  (7'h42) : reg110);
              reg135 <= reg114[(2'h2):(2'h2)];
            end
          reg136 <= $unsigned($unsigned({{(~^reg109), $signed(reg114)}}));
        end
      reg137 <= $signed(wire107[(4'ha):(4'ha)]);
    end
endmodule

module module66
#(parameter param94 = (^({(8'ha8)} >> ((((8'ha8) >>> (8'hbc)) ? ((8'ha6) && (8'haf)) : ((8'haf) ? (8'ha2) : (8'hbc))) ? (((8'h9c) >>> (8'hbe)) <<< (8'hb4)) : (8'hbe)))))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire70;
  input wire [(5'h14):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  input wire signed [(5'h10):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg88,
                 reg87,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire71 = {$signed((((wire67 ?
                          wire68 : (8'h9d)) >> (8'hbe)) <<< $signed(wire68)))};
  assign wire72 = wire68;
  assign wire73 = ($unsigned(((~(8'h9c)) ?
                          $signed(((7'h44) ^ wire71)) : $signed(wire68))) ?
                      ($unsigned(($signed(wire69) ~^ {wire68,
                          (8'ha5)})) ^ $unsigned(({wire68,
                          (8'hbd)} >> $signed(wire70)))) : (|{(wire69 ?
                              (^wire71) : wire71),
                          wire68[(4'hc):(3'h7)]}));
  assign wire74 = {$unsigned($signed(wire69)),
                      (~^($signed((wire69 ?
                          wire72 : wire68)) && $unsigned(wire73[(1'h0):(1'h0)])))};
  assign wire75 = (~^wire74);
  assign wire76 = $unsigned((wire71 >> $signed($signed(wire75[(2'h2):(1'h1)]))));
  assign wire77 = $signed(((|(&wire68)) || {($signed((8'ha3)) < $unsigned(wire73)),
                      {wire68[(4'h9):(1'h1)], {wire69}}}));
  assign wire78 = $unsigned($signed($signed(wire68)));
  assign wire79 = $signed((!wire67));
  assign wire80 = ({(+wire79)} >= ((&((wire76 ?
                      wire78 : (8'h9f)) <= wire79[(4'h8):(3'h4)])) >> ((wire77[(4'hb):(4'hb)] ?
                      (^~wire75) : (8'hba)) ^ wire67)));
  always
    @(posedge clk) begin
      reg81 <= {($unsigned($signed($signed(wire74))) ?
              (($unsigned((8'hb2)) ?
                      wire71[(3'h5):(3'h4)] : (wire69 ? wire75 : wire74)) ?
                  {(~&wire75),
                      ((8'had) ?
                          wire67 : wire71)} : (!(wire80 || wire68))) : (~|wire75))};
      reg82 <= ({$signed(((wire74 ? wire79 : wire71) || (8'ha3))),
          ($signed((wire72 > wire77)) ?
              $signed((wire77 ?
                  wire79 : (8'ha4))) : wire77)} != {$unsigned((^~wire68)),
          wire79});
    end
  assign wire83 = $signed($signed(wire74));
  assign wire84 = (!{((wire67[(3'h4):(1'h1)] <<< (wire74 ^ wire75)) && {(~^wire69)})});
  assign wire85 = $unsigned(reg82[(2'h2):(1'h0)]);
  assign wire86 = $unsigned($unsigned($signed($signed($unsigned(wire83)))));
  always
    @(posedge clk) begin
      reg87 <= $signed(($signed({(wire76 < wire80)}) ?
          (wire74 ?
              $unsigned((+(8'hae))) : $unsigned((wire86 <<< wire77))) : ($signed($signed(wire71)) ?
              $unsigned($unsigned(wire85)) : $signed($signed((8'h9d))))));
      reg88 <= ($unsigned(reg82[(3'h5):(1'h1)]) ?
          $unsigned(((wire72 - (~reg87)) ?
              $unsigned($signed(wire67)) : ((wire72 <= wire69) ?
                  reg82 : (wire75 ?
                      wire69 : (8'ha1))))) : ($signed($unsigned((~|wire77))) + ({wire83,
              (wire73 ^~ wire72)} || wire84)));
    end
  assign wire89 = wire78;
  assign wire90 = (&reg81);
  assign wire91 = wire84;
  assign wire92 = ($signed(((reg81 ? {reg81} : (^wire77)) ?
                      {wire83} : (wire67[(4'ha):(4'h8)] <= (!wire79)))) > (~|(((~&wire76) ^~ $unsigned((8'hbc))) <= reg81)));
  assign wire93 = reg82;
endmodule
