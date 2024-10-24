module top
#(parameter param164 = (-((8'hab) | (((-(8'ha7)) ? {(8'hac)} : {(8'hb7)}) + (~^((8'hbf) ? (8'hb6) : (7'h44)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire161;
  wire signed [(4'h8):(1'h0)] wire159;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  assign y = {wire161,
                 wire159,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire4 = $unsigned((!{wire3}));
  assign wire5 = (|($unsigned(($unsigned(wire1) + wire2)) ?
                     $unsigned({{wire3}}) : wire3[(3'h7):(1'h1)]));
  assign wire6 = $signed({(7'h44)});
  assign wire7 = wire3;
  module8 #() modinst47 (wire46, clk, wire5, wire6, wire3, wire4);
  assign wire48 = $unsigned((wire3 || wire2[(3'h7):(3'h4)]));
  assign wire49 = (($signed($unsigned(wire0[(3'h7):(1'h1)])) ?
                          $unsigned($signed((wire4 ?
                              wire2 : wire2))) : $signed((wire0 >>> wire5[(1'h0):(1'h0)]))) ?
                      $unsigned((((wire4 ? wire1 : wire6) >= {wire1}) ?
                          $unsigned((wire0 || wire6)) : ($signed(wire46) >>> wire4))) : (~^(^~wire1[(3'h6):(2'h3)])));
  assign wire50 = ((((|(|wire49)) | {(wire1 ? (8'ha0) : wire0),
                          $signed(wire3)}) ^~ (^{$signed(wire3),
                          wire5[(3'h5):(2'h3)]})) ?
                      wire6 : wire4[(5'h12):(4'hf)]);
  assign wire51 = (~&(~|(~|wire3)));
  assign wire52 = wire3;
  assign wire53 = (wire4 ?
                      ($unsigned((!wire1)) ?
                          wire4 : wire0[(3'h4):(1'h1)]) : $unsigned(wire0[(2'h3):(1'h1)]));
  assign wire54 = $signed(wire4[(4'h9):(4'h8)]);
  assign wire55 = {(~^$signed($signed(wire49)))};
  module56 #() modinst160 (wire159, clk, wire46, wire53, wire55, wire54);
  assign wire161 = wire50;
  always
    @(posedge clk) begin
      reg162 <= $unsigned($unsigned($unsigned(((wire48 ? wire159 : wire3) ?
          wire48 : (^~wire51)))));
      reg163 <= wire6;
    end
endmodule

module module56
#(parameter param157 = (!{({{(8'ha6), (8'hac)}, ((8'hb8) >= (7'h43))} ? {(~&(8'ha9)), {(7'h42), (8'ha8)}} : (^((8'hbf) ? (8'hb8) : (8'hb9))))}), 
parameter param158 = param157)
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire60;
  input wire [(2'h3):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire156;
  wire [(5'h13):(1'h0)] wire154;
  wire [(4'he):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire122;
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  assign y = {wire156,
                 wire154,
                 wire96,
                 wire67,
                 wire66,
                 wire61,
                 wire122,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  assign wire61 = ((($signed(wire60) <<< (-wire57)) ^ ($unsigned(wire59) ?
                          wire58[(1'h1):(1'h0)] : wire58[(2'h3):(2'h2)])) ?
                      {$unsigned(($unsigned(wire59) ?
                              (8'haa) : $unsigned(wire60))),
                          (wire59 != (wire60 >>> (~|wire60)))} : $signed((~^wire57[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg62 <= (~|wire59);
      reg63 <= ((+reg62[(1'h1):(1'h0)]) ?
          reg62[(3'h5):(2'h2)] : $unsigned(wire59[(2'h2):(2'h2)]));
      reg64 <= ({$unsigned((~|(reg63 ?
              (8'hb2) : reg63)))} >>> $signed((|wire58)));
      reg65 <= ((&reg62) < wire58);
    end
  assign wire66 = (reg62 ? reg64[(3'h5):(2'h3)] : (+$signed(reg65)));
  assign wire67 = ($unsigned($signed($unsigned((reg64 ? reg63 : wire57)))) ?
                      (8'hb5) : $signed(reg64[(4'h8):(1'h1)]));
  module68 #() modinst97 (.wire72(reg62), .y(wire96), .wire69(wire60), .wire70(wire58), .wire71(wire57), .clk(clk));
  module98 #() modinst123 (.wire103(reg65), .wire99(wire57), .wire100(wire67), .wire101(wire61), .clk(clk), .y(wire122), .wire102(reg62));
  module124 #() modinst155 (.y(wire154), .wire127(wire66), .clk(clk), .wire128(wire58), .wire126(wire122), .wire125(wire67));
  assign wire156 = $signed($unsigned($unsigned(((+wire154) ?
                       $unsigned(wire67) : (wire61 >>> reg63)))));
endmodule

module module8
#(parameter param44 = ({(({(8'ha3)} ? ((8'had) ? (8'ha1) : (8'hb9)) : ((8'hb5) ? (8'hb7) : (8'hb8))) - ((^~(8'hab)) + ((8'ha7) >> (8'ha9))))} ? ((~^({(7'h42), (7'h43)} > ((8'hb5) ? (8'h9e) : (8'ha4)))) ? (~^(~|{(8'hbb), (8'hab)})) : ((+(&(8'hb2))) && ({(8'hb0), (8'haa)} * ((8'h9e) ? (8'haf) : (8'ha9))))) : ({(-{(8'hb7)}), ({(8'ha9)} < (-(8'hb2)))} ^~ ((|(8'hac)) && (((8'had) < (8'haf)) + ((8'hbb) < (8'hb2)))))), 
parameter param45 = ((({{param44}, (param44 != param44)} ? param44 : ((-param44) < (|param44))) ? {{(!param44), param44}, (&param44)} : ({(~param44), (param44 | param44)} ? ((param44 >> param44) ? (param44 ? param44 : param44) : (param44 << param44)) : (~&(param44 ? param44 : param44)))) ? (({(param44 << param44), (param44 + (8'hb2))} ? (param44 ? (~&param44) : (|param44)) : param44) ? param44 : param44) : {param44}))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire13;
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  assign y = {wire43,
                 wire28,
                 wire27,
                 wire13,
                 reg42,
                 reg41,
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
                 reg14,
                 (1'h0)};
  assign wire13 = (($unsigned(wire10) ?
                      {wire9[(1'h0):(1'h0)]} : wire9) >>> ({wire11[(2'h3):(1'h1)]} ?
                      wire9 : $unsigned($unsigned((wire9 > wire10)))));
  always
    @(posedge clk) begin
      reg14 <= $unsigned((+wire10));
      reg15 <= ($signed((($signed((8'hb1)) <= wire11) ?
              wire13[(4'h8):(3'h4)] : wire11[(1'h1):(1'h1)])) ?
          (wire12[(2'h2):(1'h0)] != (wire9[(3'h6):(3'h6)] - reg14)) : $signed(($signed((wire13 >= wire10)) ?
              ($unsigned(reg14) ?
                  $unsigned((8'ha4)) : (&wire11)) : ($signed(wire11) ?
                  $signed(wire12) : (wire12 ? (8'hbc) : wire12)))));
      if (($unsigned((wire12 | $unsigned(reg15[(1'h0):(1'h0)]))) + ((((wire12 ^~ (7'h41)) ?
                  {reg15, reg15} : (wire9 ? wire11 : wire11)) ?
              ($signed(wire9) || (~^wire13)) : $signed(wire12)) ?
          ($unsigned((reg15 < wire12)) ?
              wire9 : wire11) : $signed($unsigned((reg15 ~^ (8'ha8)))))))
        begin
          reg16 <= reg14;
          if (((~&($signed($unsigned((8'hb7))) ?
              wire13[(1'h0):(1'h0)] : ((wire12 ? wire11 : reg15) ?
                  wire10 : wire12))) < $unsigned($unsigned((8'hb9)))))
            begin
              reg17 <= reg15[(1'h0):(1'h0)];
            end
          else
            begin
              reg17 <= (+reg15[(2'h2):(2'h2)]);
              reg18 <= reg14;
            end
          reg19 <= {$unsigned({((^~reg17) ^~ reg14[(4'ha):(2'h2)])})};
          if ((wire12[(3'h5):(2'h2)] ?
              {$signed(((reg16 & wire12) ?
                      $unsigned(reg19) : reg17[(3'h7):(1'h1)]))} : ((~^wire10[(2'h2):(1'h1)]) ?
                  $unsigned(wire12) : ((reg16[(1'h1):(1'h1)] ?
                          $unsigned((8'h9e)) : $unsigned(wire9)) ?
                      $signed((~&wire13)) : $signed(reg19)))))
            begin
              reg20 <= ((^~$unsigned({reg16, reg15[(2'h3):(2'h2)]})) ?
                  reg17 : $unsigned((~$unsigned($signed((7'h41))))));
            end
          else
            begin
              reg20 <= {$unsigned($signed(wire13)), wire10[(1'h0):(1'h0)]};
              reg21 <= (^~wire10[(5'h12):(3'h5)]);
              reg22 <= (~|((!reg19[(3'h4):(2'h2)]) | {$signed($unsigned(wire11))}));
            end
          if (reg22[(4'hb):(3'h5)])
            begin
              reg23 <= (^~$unsigned(((reg15 | reg21[(1'h1):(1'h1)]) >= (|reg15))));
              reg24 <= (!reg16);
              reg25 <= reg16[(3'h7):(3'h7)];
            end
          else
            begin
              reg23 <= reg21;
            end
        end
      else
        begin
          reg16 <= reg17;
          reg17 <= reg21[(2'h2):(1'h0)];
          reg18 <= ({$unsigned($signed(reg20[(4'ha):(4'ha)])),
                  (~^reg24[(1'h0):(1'h0)])} ?
              $unsigned(($unsigned((8'ha5)) ?
                  (reg22[(4'hd):(1'h0)] + wire12[(1'h1):(1'h0)]) : reg20)) : (8'ha7));
          if ({(^~$signed((reg17 ? {(8'ha3)} : reg22)))})
            begin
              reg19 <= {(-$unsigned(reg18)),
                  {($signed((reg24 >> reg17)) == $signed($unsigned(wire9)))}};
            end
          else
            begin
              reg19 <= $signed({reg15[(2'h2):(2'h2)], reg16});
              reg20 <= (($unsigned($unsigned({wire13})) <<< wire11[(2'h3):(1'h1)]) <= ($unsigned(((reg15 ?
                      reg19 : reg25) ?
                  $unsigned((8'ha1)) : {reg18,
                      reg14})) && (~|(+(reg22 >> reg20)))));
              reg21 <= (|{($unsigned((reg19 & reg19)) ?
                      (wire11 >> (reg23 ?
                          wire10 : reg17)) : (~&$unsigned(reg25))),
                  (($unsigned(reg18) * $unsigned(reg19)) ^ reg23[(4'h8):(3'h6)])});
            end
          reg22 <= reg20;
        end
      reg26 <= (7'h40);
    end
  assign wire27 = (reg16 + (wire9[(2'h2):(1'h0)] ^~ $signed(reg23[(3'h6):(3'h6)])));
  assign wire28 = $signed({wire12, (-$unsigned($signed((8'ha7))))});
  always
    @(posedge clk) begin
      reg29 <= wire13[(4'h8):(2'h3)];
      reg30 <= reg23[(2'h3):(2'h3)];
      if (reg19[(3'h7):(3'h4)])
        begin
          reg31 <= reg16;
        end
      else
        begin
          reg31 <= wire10[(4'h9):(1'h1)];
          if (reg19[(2'h2):(2'h2)])
            begin
              reg32 <= {reg20};
              reg33 <= wire10;
              reg34 <= (($unsigned({(^reg24), (~|reg29)}) ?
                  $unsigned($unsigned($signed(reg15))) : reg14) - wire10);
              reg35 <= reg23[(2'h3):(2'h2)];
              reg36 <= reg32;
            end
          else
            begin
              reg32 <= (~$unsigned($unsigned(reg36[(3'h7):(2'h2)])));
            end
          reg37 <= (~^$unsigned($signed($signed(((8'ha7) >= reg15)))));
        end
    end
  always
    @(posedge clk) begin
      reg38 <= $unsigned(wire12);
      reg39 <= $unsigned(reg36[(4'hc):(4'h8)]);
      reg40 <= ({(|$unsigned(((8'ha6) <<< (7'h43)))), reg39[(2'h3):(2'h3)]} ?
          reg36[(2'h3):(2'h3)] : (~&(reg20[(4'ha):(4'ha)] ?
              ((-reg25) ?
                  (reg26 && wire10) : $signed(reg16)) : wire9[(1'h1):(1'h0)])));
      reg41 <= $unsigned((~^($signed(wire27) ?
          (reg21[(2'h3):(1'h1)] && (+wire27)) : ((reg22 <<< reg30) ?
              (~|(8'ha0)) : (reg19 != reg31)))));
      reg42 <= {$signed($signed(wire9[(3'h4):(3'h4)]))};
    end
  assign wire43 = $unsigned((reg40 <<< (8'hb5)));
endmodule

module module124  (y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire128;
  input wire [(4'hf):(1'h0)] wire127;
  input wire [(3'h4):(1'h0)] wire126;
  input wire signed [(4'h9):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire129;
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg signed [(4'he):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  assign y = {wire130,
                 wire129,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
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
                 (1'h0)};
  assign wire129 = $unsigned((^~$signed((!wire128))));
  assign wire130 = {(wire125 && (^$unsigned((!(8'h9d)))))};
  always
    @(posedge clk) begin
      reg131 <= (!wire130[(2'h2):(2'h2)]);
      reg132 <= wire126;
    end
  always
    @(posedge clk) begin
      reg133 <= reg131;
      if (({{$unsigned($signed(wire125)),
                  ((reg132 ? wire130 : reg131) * (~^wire127))},
              $unsigned(((wire128 >>> wire129) | wire128))} ?
          $unsigned((reg131[(3'h5):(1'h1)] - $unsigned($signed(wire130)))) : ((((~^wire129) != wire129) < (reg132[(2'h3):(1'h1)] ?
              (reg131 ? wire126 : reg132) : reg132)) - reg132)))
        begin
          reg134 <= $signed((8'hb7));
          reg135 <= (+({wire130} >> $unsigned((wire125[(1'h1):(1'h1)] <= (|reg131)))));
          if (wire128[(2'h2):(2'h2)])
            begin
              reg136 <= wire127;
              reg137 <= wire125;
              reg138 <= (8'hb6);
              reg139 <= {$signed(reg131)};
              reg140 <= wire127[(1'h0):(1'h0)];
            end
          else
            begin
              reg136 <= $signed(($signed({(~reg139)}) ?
                  {((wire127 ? reg132 : reg136) + (wire127 ? wire129 : reg136)),
                      {(wire127 ? reg132 : wire130)}} : wire127));
            end
          if ((wire129[(3'h6):(1'h0)] ?
              $unsigned((wire126 ?
                  $unsigned((wire126 ?
                      wire126 : (7'h42))) : reg137)) : $unsigned((|(^~$unsigned(reg135))))))
            begin
              reg141 <= reg140[(4'h9):(3'h5)];
              reg142 <= $unsigned((^(($signed(reg134) ?
                  wire125[(3'h4):(3'h4)] : (reg141 > wire127)) <<< (~(|reg133)))));
              reg143 <= {(^$unsigned(reg137))};
              reg144 <= $unsigned((wire130[(3'h7):(3'h7)] ?
                  reg137 : $unsigned((^((8'h9f) || (8'hb5))))));
              reg145 <= $unsigned((+{$unsigned((reg139 ? reg143 : reg137)),
                  ((wire130 >> reg142) != reg135[(4'hf):(4'h8)])}));
            end
          else
            begin
              reg141 <= reg143[(2'h2):(1'h1)];
              reg142 <= {$signed($unsigned(wire126[(3'h4):(2'h2)]))};
            end
        end
      else
        begin
          if ((((|reg143) - ((7'h42) >= $unsigned(reg131[(1'h0):(1'h0)]))) ?
              $unsigned($unsigned(($unsigned(reg138) ?
                  reg131[(1'h0):(1'h0)] : wire127[(4'h8):(3'h6)]))) : reg134[(4'hb):(4'h8)]))
            begin
              reg134 <= (wire130[(2'h2):(1'h0)] ?
                  (8'h9c) : (^~{$unsigned($unsigned(reg138))}));
            end
          else
            begin
              reg134 <= {$signed((((~^reg132) << $signed((8'hb9))) || $unsigned($unsigned((8'ha1))))),
                  reg145};
              reg135 <= reg133;
              reg136 <= (~|reg142[(1'h0):(1'h0)]);
              reg137 <= $signed((^$signed($unsigned((~|reg139)))));
            end
          reg138 <= $unsigned(wire125[(4'h8):(3'h4)]);
          reg139 <= reg136;
          reg140 <= $signed((^((-reg141[(1'h1):(1'h0)]) ?
              $signed(reg142) : ((wire129 ? (8'ha4) : wire130) ?
                  {reg144, reg131} : (reg132 && reg138)))));
          reg141 <= (~|{$signed(reg131)});
        end
      reg146 <= wire129;
      reg147 <= reg135;
      if ($unsigned(((-(reg146 && (8'had))) ?
          $unsigned($signed((reg134 ? reg143 : reg143))) : {{(&reg131)}})))
        begin
          reg148 <= ($unsigned((wire127 ?
              reg144[(1'h0):(1'h0)] : reg139)) ^~ reg134);
        end
      else
        begin
          if ((~^($unsigned((((8'hb9) ?
              (8'h9c) : reg148) >>> $unsigned(reg137))) >> (-reg142))))
            begin
              reg148 <= reg145;
              reg149 <= {reg132[(1'h0):(1'h0)],
                  ((8'ha1) ^~ $unsigned(($signed((8'hb8)) ? reg140 : reg139)))};
              reg150 <= {$signed(wire125),
                  ($signed($signed((reg140 ? reg140 : (8'ha5)))) ?
                      ($signed((reg131 ? reg138 : reg143)) ?
                          {wire129[(1'h1):(1'h1)],
                              $unsigned(wire129)} : (reg135 * (reg147 ?
                              reg132 : reg133))) : wire128[(4'h8):(2'h3)])};
              reg151 <= wire130;
              reg152 <= (&$signed((!$unsigned(wire125[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg148 <= {(reg138[(4'h9):(1'h0)] ?
                      {{(reg136 ~^ reg148), reg141[(1'h1):(1'h0)]},
                          $unsigned($unsigned(reg136))} : wire125[(1'h0):(1'h0)])};
              reg149 <= (|{reg141,
                  (reg145 ^ ($signed(reg151) ? (~reg142) : reg138))});
              reg150 <= reg147[(2'h2):(2'h2)];
              reg151 <= reg147[(4'ha):(2'h2)];
            end
          reg153 <= reg134;
        end
    end
endmodule

module module98  (y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire103;
  input wire [(5'h12):(1'h0)] wire102;
  input wire [(4'ha):(1'h0)] wire101;
  input wire signed [(2'h2):(1'h0)] wire100;
  input wire signed [(4'hd):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire signed [(4'h8):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire104;
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 (1'h0)};
  assign wire104 = {$unsigned({$signed((^~wire101)),
                           $signed($unsigned(wire101))}),
                       (^~(8'hb9))};
  assign wire105 = wire101;
  assign wire106 = (wire100[(2'h2):(1'h0)] ?
                       $signed({wire100[(1'h1):(1'h1)]}) : wire105);
  assign wire107 = wire101;
  assign wire108 = $unsigned((({{wire104, wire106}} ?
                           wire106 : wire106[(2'h3):(1'h1)]) ?
                       wire100[(1'h0):(1'h0)] : ((8'had) >= ((wire105 ?
                           wire104 : wire99) >>> ((8'hb9) ?
                           wire102 : wire101)))));
  assign wire109 = wire108;
  assign wire110 = {$unsigned(wire100), $signed(wire107)};
  assign wire111 = $signed((-{wire99[(3'h5):(1'h0)], ((|wire105) != wire100)}));
  assign wire112 = (~&wire109);
  assign wire113 = wire111[(4'hb):(4'h9)];
  assign wire114 = wire110;
  assign wire115 = ($unsigned($unsigned($unsigned((8'haa)))) + wire101);
  assign wire116 = wire114;
  assign wire117 = {{{($signed(wire103) ?
                                   (!wire116) : (wire104 ? wire103 : wire114)),
                               $unsigned(wire102)}},
                       (({$signed(wire114)} != $signed((!(8'hb2)))) && wire109)};
  assign wire118 = ($unsigned(wire117[(3'h4):(1'h0)]) ^ ((($unsigned(wire115) * $unsigned(wire106)) + $unsigned(wire103[(4'hf):(4'h8)])) ?
                       ((^~$unsigned(wire114)) ?
                           wire108[(3'h5):(3'h5)] : wire106) : ({wire104[(4'ha):(2'h2)],
                           wire112} <<< (~|$unsigned(wire106)))));
  assign wire119 = $unsigned((|$unsigned($unsigned((wire111 ?
                       wire104 : wire99)))));
  assign wire120 = wire110[(1'h0):(1'h0)];
  assign wire121 = wire100;
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire71;
  input wire [(3'h4):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire73 = ((((~wire70) ?
                          wire72 : (~$signed(wire71))) || {wire70[(1'h1):(1'h0)],
                          $signed((wire70 || wire71))}) ?
                      (8'hbd) : $signed($unsigned(wire72[(2'h2):(1'h1)])));
  assign wire74 = ((!(8'hb7)) ?
                      wire69[(2'h3):(1'h0)] : $unsigned((((wire69 > wire73) ^ $unsigned((8'hba))) ?
                          $signed(wire73) : $signed((+wire73)))));
  assign wire75 = ({wire74, (8'hb7)} ? wire74[(2'h2):(2'h2)] : wire74);
  assign wire76 = wire74;
  assign wire77 = $signed({wire69[(4'hb):(4'h9)],
                      (wire71[(3'h6):(3'h5)] ? wire71 : $unsigned(wire69))});
  assign wire78 = wire74[(1'h1):(1'h1)];
  assign wire79 = wire71[(5'h14):(5'h11)];
  assign wire80 = $unsigned($unsigned($signed({$unsigned(wire76)})));
  always
    @(posedge clk) begin
      if ({wire73, wire70})
        begin
          reg81 <= {{((wire76 >= (wire77 + wire74)) ?
                      wire76 : {(wire74 | wire69)})},
              (8'h9e)};
          reg82 <= {(&($signed((reg81 ? (8'ha7) : wire73)) ?
                  (!(!wire70)) : (~|(^~wire74)))),
              $signed(wire72)};
          reg83 <= ((wire73[(3'h4):(2'h3)] < ($signed($signed(wire69)) - {$unsigned(reg82),
                  wire71[(5'h14):(3'h4)]})) ?
              ($unsigned({(wire79 < wire74)}) == wire76[(4'hc):(4'h9)]) : $signed(wire77[(4'h9):(4'h9)]));
          reg84 <= $unsigned(wire73[(1'h0):(1'h0)]);
          reg85 <= (&wire69);
        end
      else
        begin
          if ($signed((!(|$unsigned(((8'ha6) ? wire78 : wire69))))))
            begin
              reg81 <= {reg85[(1'h1):(1'h1)], $unsigned(reg85)};
              reg82 <= wire75[(4'hc):(1'h1)];
            end
          else
            begin
              reg81 <= ($signed(wire77[(5'h10):(3'h7)]) ?
                  reg85[(3'h4):(1'h1)] : (wire74[(1'h0):(1'h0)] ?
                      {(wire74 < $signed(reg85)),
                          (^~wire77)} : (($unsigned(wire70) && wire71) ?
                          (!reg82[(5'h15):(5'h13)]) : (!wire76))));
              reg82 <= $unsigned((8'haf));
              reg83 <= $signed((wire75[(2'h2):(2'h2)] ?
                  wire79[(4'he):(3'h7)] : (+($signed(wire78) >>> reg83))));
              reg84 <= wire69[(4'h9):(2'h2)];
              reg85 <= wire78[(3'h5):(2'h2)];
            end
          reg86 <= reg85[(3'h5):(1'h0)];
        end
      reg87 <= {(wire69[(3'h5):(2'h3)] ?
              wire80 : ((~&$unsigned(reg83)) ^ {(wire71 - wire72)}))};
      reg88 <= $unsigned({(~^wire80), (^~(8'haf))});
      if ($unsigned((~&reg81[(4'hb):(3'h7)])))
        begin
          reg89 <= (wire76[(1'h1):(1'h0)] ~^ {reg85[(2'h2):(1'h1)]});
          reg90 <= $unsigned(($unsigned(wire70) ?
              ((wire74 ? {reg89} : (~reg89)) + ((~^wire76) ?
                  $unsigned(reg88) : reg88)) : $signed(((wire78 ?
                      reg82 : wire75) ?
                  wire77[(5'h11):(4'hc)] : (+reg87)))));
          reg91 <= ((|($signed($unsigned(reg82)) & (wire76[(4'h9):(4'h8)] ?
                  wire77[(3'h4):(1'h0)] : wire69[(4'h9):(2'h2)]))) ?
              reg82 : (-{(~|(~|reg82)), $signed((+reg83))}));
          reg92 <= wire70[(1'h0):(1'h0)];
        end
      else
        begin
          reg89 <= (reg83 ?
              $unsigned((&($signed(wire79) ^ $signed(wire75)))) : $unsigned(wire76));
          if (reg85[(1'h0):(1'h0)])
            begin
              reg90 <= (~^((reg84 ?
                  ((reg89 >> wire75) ?
                      (reg90 ?
                          (8'ha7) : reg86) : {wire73}) : (+$unsigned(reg91))) >= (&$signed(reg82))));
              reg91 <= ({($signed((reg86 ~^ reg87)) ^ (-$signed((8'haa))))} >= reg82[(4'hc):(3'h4)]);
              reg92 <= $signed(reg89);
            end
          else
            begin
              reg90 <= ((8'hb8) * ($unsigned(((&wire77) ?
                      reg86[(2'h3):(2'h2)] : (wire78 >= reg81))) ?
                  ((!(wire73 ?
                      reg87 : (8'ha4))) << wire73[(1'h1):(1'h0)]) : (~&($unsigned(wire70) ?
                      (8'hbe) : $unsigned(reg86)))));
            end
          reg93 <= (wire71[(4'h9):(2'h2)] * $unsigned(wire75[(1'h0):(1'h0)]));
          reg94 <= {(|(8'ha0))};
          reg95 <= ($unsigned((~$signed((reg88 == wire74)))) ?
              $unsigned($signed(reg85)) : (~(~|reg83[(3'h5):(3'h5)])));
        end
    end
endmodule
