module top
#(parameter param180 = (({(-((8'hba) ? (8'h9f) : (8'hae)))} ? (-(~&(!(8'hb5)))) : ({((8'h9e) ? (8'hba) : (7'h44))} ? (((8'hbe) >= (8'hb3)) ? ((8'ha5) ~^ (8'hb9)) : ((8'haf) ? (8'hb4) : (8'h9e))) : ((!(8'hb2)) < ((8'ha1) ? (8'hb5) : (8'hb2))))) ~^ ({((~|(8'ha1)) ? ((8'hbf) != (8'hb0)) : ((8'ha9) ? (8'hbe) : (8'ha3)))} ? (+(^~((8'hab) + (8'hb1)))) : ({((8'hbf) ? (7'h41) : (7'h41)), (~^(8'ha4))} ? (~&(&(8'hb7))) : (~|((8'ha3) <= (8'ha3)))))), 
parameter param181 = (param180 ? ({((~|param180) + (param180 <= param180))} | {(((8'hbc) ? param180 : param180) * (param180 ? (8'haa) : param180)), {(8'haa)}}) : param180))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire178;
  wire [(5'h13):(1'h0)] wire175;
  reg signed [(4'he):(1'h0)] reg177 = (1'h0);
  assign y = {wire179, wire178, wire175, reg177, (1'h0)};
  module4 #() modinst176 (wire175, clk, wire1, wire3, wire2, wire0, (7'h41));
  always
    @(posedge clk) begin
      reg177 <= $unsigned($signed($unsigned(wire3)));
    end
  assign wire178 = $signed(wire175);
  assign wire179 = wire1;
endmodule

module module4
#(parameter param173 = (&({(8'hb4)} ? (&(~^((8'ha5) ? (8'hb8) : (8'ha4)))) : (&(7'h42)))), 
parameter param174 = ((8'hb6) ? (~&{(param173 ? param173 : param173)}) : (((((8'ha6) && param173) ? param173 : (+param173)) * (param173 - param173)) ? param173 : {((~^param173) ? param173 : (param173 ? param173 : param173)), (~&((8'hb0) ? param173 : param173))})))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h286):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire5;
  input wire [(5'h12):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire172;
  wire signed [(4'hb):(1'h0)] wire171;
  wire signed [(5'h13):(1'h0)] wire170;
  wire signed [(4'ha):(1'h0)] wire169;
  wire [(4'hb):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire signed [(4'hc):(1'h0)] wire147;
  wire signed [(4'hc):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire29;
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg167 = (1'h0);
  reg [(4'h9):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire150,
                 wire149,
                 wire147,
                 wire94,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire10,
                 wire29,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
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
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire10 = (wire5 ?
                      {(wire9 ? $unsigned((wire6 && wire9)) : $signed(wire8)),
                          $signed({(wire7 >>> wire5)})} : (+wire5));
  always
    @(posedge clk) begin
      reg11 <= (8'hac);
      reg12 <= ($signed(($signed({wire6}) >>> reg11[(1'h1):(1'h0)])) ?
          $unsigned($signed(($signed(reg11) * $signed(wire7)))) : ((8'hac) ?
              wire10[(4'ha):(1'h1)] : wire9));
    end
  module13 #() modinst30 (wire29, clk, wire5, reg12, wire9, wire6);
  always
    @(posedge clk) begin
      if ((8'hac))
        begin
          if ($unsigned($signed(wire5)))
            begin
              reg31 <= ({($unsigned($signed(reg11)) <= $signed(wire10[(3'h5):(3'h4)]))} ?
                  ((wire9[(3'h4):(2'h3)] >= $signed(wire6)) ?
                      $signed({$signed((8'ha4)),
                          wire6[(1'h1):(1'h1)]}) : wire5[(5'h12):(4'ha)]) : wire8[(2'h3):(2'h2)]);
              reg32 <= reg11[(3'h6):(2'h2)];
              reg33 <= $unsigned(reg32[(1'h0):(1'h0)]);
              reg34 <= $signed((($unsigned($unsigned(reg33)) ?
                      ($signed(wire6) ~^ $signed(reg32)) : ((wire10 ?
                          wire7 : reg12) - (reg11 ? reg31 : wire29))) ?
                  wire29 : {((wire7 ? (8'hb8) : wire6) ?
                          $unsigned(wire8) : (wire5 ? reg33 : reg32))}));
            end
          else
            begin
              reg31 <= (!$unsigned(wire6[(2'h2):(1'h0)]));
              reg32 <= $signed($unsigned($unsigned($signed(wire6))));
              reg33 <= ($signed(((~^(|wire7)) ?
                  (reg32[(2'h3):(1'h0)] ?
                      $unsigned(wire5) : $signed(wire9)) : (8'hab))) ~^ {wire29[(2'h3):(1'h1)],
                  wire8[(1'h0):(1'h0)]});
            end
          reg35 <= ($signed($signed(reg12[(3'h4):(1'h1)])) ?
              $unsigned($unsigned((~|(~&(8'hb0))))) : (+$signed(wire5)));
        end
      else
        begin
          if ($signed($unsigned(wire6[(1'h1):(1'h1)])))
            begin
              reg31 <= reg33[(3'h6):(1'h1)];
              reg32 <= wire9;
            end
          else
            begin
              reg31 <= $signed(($signed(($unsigned(reg34) ?
                      (reg35 | reg32) : $signed(wire10))) ?
                  $unsigned(((^reg34) ?
                      wire29 : {reg35})) : (($unsigned(reg11) <= (8'hbd)) ?
                      reg12[(2'h3):(1'h0)] : ({(8'haa), reg34} ?
                          wire9[(4'h8):(2'h3)] : wire9[(3'h4):(3'h4)]))));
              reg32 <= (&reg32);
              reg33 <= {{(8'hb0), reg35[(4'hb):(3'h6)]}};
              reg34 <= (wire8[(4'hd):(3'h7)] ? (~reg31) : wire6);
              reg35 <= ((^{reg35,
                  ({wire7,
                      reg31} ^~ (wire7 & (8'haf)))}) - (reg35 || {(8'ha4)}));
            end
          reg36 <= wire10;
          reg37 <= (^(~|reg32));
          if ({reg33[(4'h9):(1'h0)]})
            begin
              reg38 <= ($unsigned(((+(wire9 ?
                  reg11 : reg31)) > $unsigned((|(8'h9e))))) <= reg12[(1'h0):(1'h0)]);
              reg39 <= (reg32 ? reg31 : wire8);
            end
          else
            begin
              reg38 <= reg12;
              reg39 <= (($unsigned($unsigned($signed(reg32))) && (8'ha4)) - wire8);
              reg40 <= (8'hab);
            end
        end
    end
  always
    @(posedge clk) begin
      reg41 <= reg36[(1'h0):(1'h0)];
      reg42 <= {(!(($signed(wire6) ?
              $signed(reg36) : reg33) ^ (reg33[(3'h5):(3'h5)] == (+reg38))))};
      reg43 <= wire5;
      if ((wire7[(2'h2):(1'h0)] ?
          $unsigned($unsigned(($unsigned(reg35) >= $signed((7'h41))))) : $unsigned(reg12[(4'ha):(4'ha)])))
        begin
          reg44 <= reg11;
          reg45 <= ($signed((reg42 ? reg44 : reg35[(2'h3):(1'h0)])) ?
              $signed((((8'ha6) ? (wire29 * reg11) : $signed(wire8)) ?
                  (8'hb7) : ($signed(reg39) ^~ $signed(reg40)))) : reg43[(4'he):(4'ha)]);
          reg46 <= $signed((8'ha5));
          if ({$unsigned((+$unsigned((reg34 <= reg40))))})
            begin
              reg47 <= wire8;
              reg48 <= {(((&$signed(wire10)) & ((reg39 ? reg11 : reg31) ?
                          reg46[(1'h0):(1'h0)] : reg42)) ?
                      $unsigned(reg40) : {reg11[(3'h4):(2'h3)],
                          (-(~&(7'h41)))})};
              reg49 <= (!wire5[(5'h14):(4'h8)]);
            end
          else
            begin
              reg47 <= ((~reg42) ?
                  $signed(((&(8'hb1)) ?
                      ((|reg41) + (8'h9f)) : $signed((8'haf)))) : reg48[(2'h3):(1'h1)]);
            end
          reg50 <= (reg46 != (&((8'ha6) ?
              reg38[(2'h3):(2'h2)] : $signed((reg32 ? reg45 : (8'hb7))))));
        end
      else
        begin
          reg44 <= ({(8'haf),
              (($signed(reg49) ?
                  reg42 : (reg38 >>> (8'h9e))) | $signed(((7'h42) < (8'ha5))))} - reg42[(1'h1):(1'h1)]);
          reg45 <= $signed($signed((^~(~|(+wire10)))));
          reg46 <= wire5[(5'h15):(3'h5)];
          reg47 <= reg12;
          reg48 <= ({reg44[(1'h1):(1'h1)]} ?
              (!$signed((reg11 && (reg34 ? reg36 : reg38)))) : wire29);
        end
    end
  assign wire51 = (reg43 ? reg49 : $signed((reg38[(2'h3):(1'h1)] ~^ wire6)));
  assign wire52 = reg32[(2'h2):(2'h2)];
  assign wire53 = (~|reg40);
  assign wire54 = $unsigned($unsigned(((((8'ha2) || wire6) ?
                      (reg44 >> wire10) : (wire6 ?
                          reg49 : (8'ha3))) * {$unsigned((8'hb1)), {reg11}})));
  assign wire55 = $unsigned((($signed($signed(wire54)) | reg33[(2'h3):(2'h2)]) ~^ ($unsigned(wire52) ?
                      reg33[(4'h8):(2'h3)] : {((8'ha4) ^~ wire53), (8'hba)})));
  assign wire56 = (8'h9d);
  assign wire57 = (~|$signed((~^(+(wire53 ? reg31 : (8'ha5))))));
  assign wire58 = (^$signed(reg32));
  module59 #() modinst95 (.clk(clk), .wire60(wire51), .wire61(reg40), .y(wire94), .wire64(reg47), .wire63(reg37), .wire62(wire52));
  module96 #() modinst148 (wire147, clk, wire53, wire54, reg11, wire51, wire29);
  assign wire149 = ((~|wire53[(3'h5):(1'h0)]) ?
                       wire6[(4'hb):(4'h9)] : ((^$signed($unsigned(reg41))) ?
                           ({$unsigned(wire9),
                               $unsigned(wire10)} || reg44[(2'h2):(1'h1)]) : wire8));
  assign wire150 = (~reg12);
  always
    @(posedge clk) begin
      reg151 <= (wire29 <= wire54[(4'ha):(2'h3)]);
      reg152 <= (-((($signed(reg32) >> $signed(wire52)) ?
              $unsigned($unsigned(wire6)) : (wire5[(4'hf):(3'h7)] >> (reg32 + reg11))) ?
          reg39[(4'ha):(3'h5)] : reg44));
      if (((^(~^$unsigned((wire9 > reg44)))) << $unsigned(wire6[(4'hf):(4'h9)])))
        begin
          reg153 <= (7'h43);
          if (({(reg39 < ($unsigned(reg46) >>> (~^(8'hbe))))} + $unsigned((~|reg37))))
            begin
              reg154 <= wire8;
            end
          else
            begin
              reg154 <= $signed($unsigned((^~({reg35} ?
                  (wire56 > wire53) : wire57))));
            end
          reg155 <= (|((~$unsigned((wire6 << wire6))) > (reg47[(4'hb):(1'h0)] - {{wire58},
              wire55})));
          reg156 <= reg155[(2'h2):(1'h1)];
          if (reg46)
            begin
              reg157 <= (|$signed($signed((8'hac))));
              reg158 <= reg37;
            end
          else
            begin
              reg157 <= {$unsigned($signed(reg41)),
                  (|((~&{reg43}) ?
                      $unsigned((&reg35)) : $unsigned((reg43 ?
                          (8'hb7) : wire149))))};
            end
        end
      else
        begin
          if (wire7)
            begin
              reg153 <= $signed(((^~$unsigned(reg11[(3'h6):(2'h3)])) ?
                  reg11 : wire147[(3'h5):(3'h4)]));
              reg154 <= (&{(reg38 <<< (reg11 >> reg155)),
                  reg35[(3'h7):(3'h7)]});
            end
          else
            begin
              reg153 <= $unsigned((&reg46[(2'h3):(2'h2)]));
              reg154 <= (~|{(|reg44[(2'h3):(1'h0)])});
              reg155 <= (wire51 << $unsigned((reg44 ?
                  $signed($signed(reg46)) : ({(8'hb4), reg49} == (7'h42)))));
            end
          if ((+$unsigned(reg32[(1'h1):(1'h1)])))
            begin
              reg156 <= $signed(wire54);
              reg157 <= ($signed(($unsigned($signed(reg49)) && (~&reg12))) ?
                  (wire7 <= (-{(reg153 ? wire150 : wire55)})) : {((7'h44) ?
                          wire94[(3'h7):(2'h3)] : reg151)});
              reg158 <= reg151[(1'h0):(1'h0)];
              reg159 <= wire9;
            end
          else
            begin
              reg156 <= reg154;
              reg157 <= (($signed(({wire58, reg156} ^ (reg48 ?
                      wire9 : reg41))) >>> $unsigned($unsigned((reg50 == wire6)))) ?
                  (reg36 ?
                      (8'h9e) : $signed({(wire58 << wire149),
                          $unsigned((8'ha2))})) : $signed((reg50[(4'ha):(4'h9)] << (wire6[(5'h10):(3'h7)] ?
                      {wire29} : (-wire147)))));
              reg158 <= reg44[(1'h1):(1'h0)];
            end
          reg160 <= ((+$signed(((reg157 >> reg32) ?
              reg46 : (^reg33)))) || (-((~&(wire57 >>> reg36)) ?
              (|$unsigned(reg38)) : $signed($signed(reg39)))));
          reg161 <= ((((7'h44) && $signed(wire52)) ?
              reg160[(4'h9):(4'h9)] : (|reg152)) ^ reg36);
          reg162 <= (~^(({{reg45, reg47}, (wire10 ^ reg33)} ?
                  wire147[(3'h4):(2'h2)] : (|(&reg158))) ?
              $signed((wire149[(1'h1):(1'h0)] & $signed(wire8))) : reg161[(2'h2):(1'h0)]));
        end
      if ({((((reg154 ^~ reg155) ? (wire51 & reg48) : $signed(reg160)) ?
                  (+wire8) : $signed(((7'h42) ^ wire29))) ?
              {reg49, $unsigned($signed((8'h9f)))} : (|$signed(reg35))),
          $unsigned((reg156 ?
              $signed((^(7'h40))) : ((&wire58) ?
                  (wire94 || wire5) : {reg43, reg48})))})
        begin
          reg163 <= $unsigned($signed($signed((~^{wire29, (8'hb1)}))));
          reg164 <= $signed(wire150);
          reg165 <= $unsigned(reg31[(4'h8):(3'h7)]);
          if (((~&wire5[(5'h15):(5'h11)]) ? {wire10} : reg31))
            begin
              reg166 <= $signed(reg163[(2'h3):(2'h2)]);
              reg167 <= ((reg165 >> reg36) ?
                  wire147[(4'hc):(2'h3)] : (+$signed($unsigned(((8'ha9) ?
                      wire51 : reg35)))));
            end
          else
            begin
              reg166 <= reg157[(4'ha):(1'h0)];
              reg167 <= reg153;
            end
        end
      else
        begin
          reg163 <= reg33[(1'h1):(1'h1)];
          reg164 <= $signed((reg159[(3'h7):(1'h0)] ?
              reg151 : (($signed(reg159) & (!(8'ha7))) ^ reg49[(3'h4):(2'h3)])));
        end
      reg168 <= {(((~&{reg33}) ?
                  {(8'hbb), (wire8 - (7'h40))} : (+$signed((8'h9d)))) ?
              ($signed((reg163 ?
                  reg46 : reg46)) ^ $unsigned((reg163 * reg32))) : $signed(((~|wire10) ?
                  $signed((8'hb0)) : $signed(reg45))))};
    end
  assign wire169 = $unsigned((^(!($unsigned(reg158) < $unsigned((8'h9e))))));
  assign wire170 = ({{((reg37 - reg50) ?
                               ((8'ha7) <= reg36) : reg155[(1'h0):(1'h0)])},
                       (-(8'h9f))} | {($unsigned((~&reg45)) ?
                           $signed((~&reg38)) : ($unsigned(wire52) >= (8'hb9))),
                       ((8'ha8) ? reg48 : $signed(reg42[(3'h4):(3'h4)]))});
  assign wire171 = $unsigned($unsigned($signed(((~^reg39) ?
                       reg40[(2'h3):(1'h0)] : {reg156, reg151}))));
  assign wire172 = reg31;
endmodule

module module96
#(parameter param145 = {(!{(+{(8'hb5)}), (!((8'hbb) == (8'ha6)))}), {{(~|(8'hbc)), {((8'hba) ? (8'hb9) : (8'h9f))}}, (+((^(8'hbb)) ? {(8'hac), (8'hbf)} : {(8'hb3)}))}}, 
parameter param146 = ((|(param145 ? (-(param145 ? param145 : param145)) : (((8'hab) ? param145 : param145) ? (param145 ? param145 : param145) : (^~param145)))) & param145))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire101;
  input wire signed [(5'h12):(1'h0)] wire100;
  input wire [(3'h6):(1'h0)] wire99;
  input wire signed [(4'hc):(1'h0)] wire98;
  input wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(5'h11):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  reg [(5'h11):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire133,
                 wire132,
                 wire125,
                 wire124,
                 wire120,
                 wire114,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg121,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire102 = wire99;
  assign wire103 = $unsigned((!(wire101[(1'h0):(1'h0)] || (wire102[(3'h5):(2'h2)] ?
                       $signed((8'ha8)) : $unsigned(wire101)))));
  assign wire104 = ((8'h9c) ^ wire98);
  assign wire105 = wire104[(1'h1):(1'h0)];
  assign wire106 = (($signed(((wire104 ~^ wire105) == wire98[(4'h8):(3'h6)])) ?
                           wire98 : (+((wire97 + wire102) ?
                               (wire102 + wire97) : $unsigned(wire104)))) ?
                       wire97[(4'hc):(2'h3)] : (wire104[(1'h1):(1'h0)] ?
                           $signed($signed(wire99)) : wire100));
  assign wire107 = (~|(~^$unsigned($unsigned((~|wire101)))));
  always
    @(posedge clk) begin
      if ((~|($unsigned(wire105) <= (-wire100[(5'h11):(3'h4)]))))
        begin
          reg108 <= ((~|wire97) & ($signed(($unsigned(wire99) ?
              wire104[(2'h3):(1'h0)] : wire106)) && (+(wire100[(2'h3):(1'h0)] ?
              (^wire101) : (wire104 && wire105)))));
          reg109 <= wire105[(1'h1):(1'h0)];
          reg110 <= (+($unsigned(wire99[(3'h5):(1'h1)]) ?
              wire98 : $unsigned(wire105[(1'h0):(1'h0)])));
          reg111 <= $unsigned($signed({$unsigned(((7'h41) > wire99))}));
          reg112 <= (^wire99[(1'h1):(1'h0)]);
        end
      else
        begin
          reg108 <= (^~$unsigned(wire98));
          reg109 <= $unsigned((!(!((reg108 <<< wire98) ?
              $signed(reg108) : (+wire101)))));
        end
      reg113 <= ($signed(($unsigned($signed(wire102)) ?
              (wire99 ?
                  $signed(wire101) : (wire99 ?
                      (8'hb2) : wire100)) : $unsigned(wire107[(4'h9):(3'h4)]))) ?
          wire102 : $signed(((|((8'ha1) <<< (7'h40))) >>> (&(-wire107)))));
    end
  assign wire114 = (((|($signed(wire102) ?
                           (~^reg111) : wire107)) ~^ wire106[(3'h7):(2'h3)]) ?
                       wire103 : wire106);
  always
    @(posedge clk) begin
      reg115 <= wire98;
      if ($unsigned((wire98 ?
          (((wire107 & reg108) ? $unsigned(wire105) : $unsigned(wire102)) ?
              {wire107,
                  (^~(8'ha4))} : (~^$signed(wire98))) : ((~|(^~wire101)) << $unsigned(wire98)))))
        begin
          reg116 <= wire104;
          reg117 <= ($unsigned({reg108[(1'h1):(1'h0)]}) ?
              $signed(reg115) : $signed(reg111));
          reg118 <= $unsigned((-(reg110[(3'h7):(2'h2)] ?
              (~^((8'ha3) <= wire98)) : (reg109 ?
                  $unsigned((8'ha1)) : {wire105}))));
          reg119 <= $unsigned($signed((-{$signed((8'hb5)), (-wire104)})));
        end
      else
        begin
          reg116 <= $signed(($unsigned($unsigned((reg109 ?
                  wire101 : wire104))) ?
              wire106[(4'hc):(4'h9)] : wire98));
        end
    end
  assign wire120 = {{($unsigned({wire103}) ?
                               reg111[(2'h2):(1'h0)] : $unsigned(((8'h9e) || reg109)))},
                       (&wire114)};
  always
    @(posedge clk) begin
      reg121 <= ($unsigned($signed(($signed(reg117) ?
          $signed(wire114) : ((8'ha9) <= reg116)))) == ((8'ha9) + $signed((~^wire104))));
      reg122 <= {(8'hb4), reg113[(3'h4):(1'h1)]};
      reg123 <= (+wire107);
    end
  assign wire124 = ((&($signed($unsigned(wire102)) ?
                           ((^~(8'had)) ^~ reg123) : (+wire99))) ?
                       (^$unsigned({reg117[(1'h0):(1'h0)],
                           {wire100}})) : $unsigned(wire102));
  assign wire125 = wire101[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ({wire102,
          (-((^~$unsigned(wire106)) ?
              $unsigned((reg121 ? reg111 : reg118)) : reg108[(1'h1):(1'h1)]))})
        begin
          if ((~|(wire125 || (($unsigned((8'hab)) ?
                  $unsigned(reg108) : reg110) ?
              (^~wire102[(3'h7):(1'h1)]) : reg121))))
            begin
              reg126 <= wire103;
            end
          else
            begin
              reg126 <= $signed(reg123[(2'h3):(2'h2)]);
              reg127 <= wire99;
              reg128 <= (wire106[(3'h6):(1'h0)] != (8'hac));
            end
        end
      else
        begin
          reg126 <= (wire106[(4'ha):(1'h1)] ?
              {(8'ha7)} : $signed({(!(wire102 ? reg115 : wire104))}));
        end
      reg129 <= {wire105,
          $unsigned((wire124 <<< (reg127[(4'hf):(4'hf)] ?
              (~^(8'had)) : $unsigned(wire97))))};
      if ($unsigned($unsigned($signed(((wire100 ~^ reg129) || (~&(8'h9d)))))))
        begin
          reg130 <= (($signed(($signed(reg111) || $unsigned(wire101))) | $signed($unsigned($unsigned(reg109)))) > (|wire125));
          reg131 <= (!(8'ha7));
        end
      else
        begin
          reg130 <= $unsigned(wire125[(5'h11):(4'he)]);
        end
    end
  assign wire132 = ({(8'hb3), reg122[(4'hd):(2'h3)]} | $unsigned((7'h40)));
  assign wire133 = reg126[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg134 <= ((({(wire132 >> reg112), {reg110, reg110}} ?
                  reg115[(4'ha):(2'h3)] : ((reg126 + wire133) ?
                      wire132[(3'h6):(1'h0)] : wire105[(2'h2):(1'h0)])) ?
              (&((8'ha1) ?
                  $signed(reg112) : {reg111, reg121})) : (reg110 - (^(wire125 ?
                  reg129 : reg131)))) ?
          ($unsigned({(wire106 >>> (8'ha0)), $signed(wire97)}) || (&((wire102 ?
                  (7'h42) : wire102) ?
              wire107 : $signed(wire107)))) : $unsigned($signed(reg129[(2'h3):(2'h3)])));
      reg135 <= $signed((wire133 ?
          {wire114[(2'h3):(2'h2)]} : {wire133[(4'h8):(4'h8)],
              (!(reg121 ? (8'hbd) : (7'h44)))}));
      reg136 <= {reg127[(3'h7):(1'h1)]};
      reg137 <= {reg109};
    end
  assign wire138 = reg111;
  assign wire139 = ((~|(^~($unsigned(wire102) ?
                       {reg129, (8'hb3)} : wire106))) != $unsigned(wire100));
  always
    @(posedge clk) begin
      if ($signed((^((|(reg126 && reg115)) ?
          $unsigned((wire132 | reg128)) : (|(-wire120))))))
        begin
          reg140 <= $signed(($signed({(~&wire132),
              (reg115 ? wire125 : wire98)}) <<< wire105[(3'h5):(1'h0)]));
          reg141 <= reg122;
          reg142 <= ($unsigned((^~(~&$unsigned(wire100)))) ?
              $signed({$unsigned((wire114 < reg119)),
                  wire120[(2'h2):(2'h2)]}) : (reg134 ?
                  (~^$unsigned(wire101)) : wire106));
          reg143 <= $unsigned({$unsigned(((8'hbe) ?
                  $unsigned(reg119) : wire103)),
              {(8'hb1)}});
        end
      else
        begin
          reg140 <= reg131;
          if ($unsigned((reg113[(1'h0):(1'h0)] ?
              {(+(&(8'ha8)))} : ((wire114[(3'h5):(3'h5)] != (-wire98)) ?
                  (~^reg116[(4'ha):(3'h5)]) : $signed({wire104, (8'hb1)})))))
            begin
              reg141 <= wire98;
              reg142 <= $unsigned(reg142[(3'h4):(3'h4)]);
            end
          else
            begin
              reg141 <= $unsigned(($unsigned((&(wire125 <<< reg116))) ?
                  $signed({wire120[(3'h5):(3'h4)],
                      wire99[(3'h6):(2'h3)]}) : $signed(($unsigned(wire103) ?
                      {reg121, reg118} : wire98[(3'h5):(3'h5)]))));
            end
          reg143 <= $unsigned(reg121);
          reg144 <= (((((wire98 ? reg113 : (8'ha4)) ^ wire98) ?
                      (~|reg112[(2'h3):(1'h0)]) : reg135[(3'h4):(1'h0)]) ?
                  wire120[(2'h3):(1'h0)] : ({{reg113, reg119}} ?
                      (~&(wire133 ? (8'hb6) : reg135)) : (~^(wire125 ?
                          reg119 : wire132)))) ?
              $signed(wire139) : reg111);
        end
    end
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire64;
  input wire signed [(3'h6):(1'h0)] wire63;
  input wire signed [(4'hb):(1'h0)] wire62;
  input wire [(3'h7):(1'h0)] wire61;
  input wire [(5'h11):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  assign y = {wire93,
                 wire88,
                 wire87,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire66,
                 wire65,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg86,
                 reg85,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire65 = (~^($signed(wire64[(3'h6):(3'h5)]) ?
                      wire64 : wire64[(4'hb):(4'h9)]));
  assign wire66 = wire64[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg67 <= $signed(((wire62 ^ ($signed(wire62) * (+wire66))) <<< (((+wire66) ?
              (wire63 ? wire61 : wire62) : wire61) ?
          {((8'ha0) ? wire65 : (7'h40)), wire63} : wire60[(2'h2):(1'h0)])));
      if (reg67[(2'h2):(1'h0)])
        begin
          if ((((((wire66 >= wire62) ? wire61 : wire64[(4'hb):(1'h1)]) ?
                  ((wire61 ? wire65 : wire60) ?
                      $signed(wire64) : $unsigned(wire64)) : ($signed(wire65) > wire63)) ?
              wire65 : (wire60 ?
                  (8'hb5) : ((wire64 ^~ wire65) ?
                      (wire60 ^ reg67) : (~^reg67)))) == $signed((wire63[(1'h0):(1'h0)] ?
              ({wire64} >>> wire63) : (~wire62[(4'h8):(3'h4)])))))
            begin
              reg68 <= $unsigned((&wire63[(3'h6):(3'h5)]));
              reg69 <= $signed($unsigned({wire66}));
              reg70 <= ((^(-{(~^reg69), (reg69 >>> reg68)})) ?
                  ((wire64[(3'h5):(3'h5)] & (-{reg69,
                      wire61})) >= $signed((~&wire66))) : (reg67[(3'h4):(2'h2)] ?
                      ($signed((wire62 ^~ reg68)) ?
                          ((-(8'hbd)) > {(8'haf),
                              reg69}) : wire64) : wire61[(2'h3):(2'h3)]));
            end
          else
            begin
              reg68 <= (wire66[(2'h2):(1'h0)] > wire66[(3'h4):(1'h0)]);
              reg69 <= (wire61 ?
                  ({(((8'hb6) ? wire62 : wire60) ?
                          reg67 : {reg70,
                              wire64})} << {(+(~^reg69))}) : ($signed($signed({(8'hbc)})) & ((~^$signed(wire65)) ?
                      $signed((+wire66)) : {(+wire60), (~^(7'h44))})));
              reg70 <= ($unsigned((~^$unsigned(((8'ha3) ^ wire61)))) && $unsigned(wire60[(5'h10):(1'h1)]));
            end
        end
      else
        begin
          reg68 <= $unsigned(reg67[(1'h0):(1'h0)]);
          reg69 <= ({((wire62 > reg68[(2'h2):(1'h1)]) && wire64[(4'h8):(3'h7)]),
                  wire60[(3'h7):(1'h1)]} ?
              (|(|wire66)) : {{wire66[(1'h0):(1'h0)]}});
          if (($signed(reg68[(1'h1):(1'h1)]) - (|(8'hae))))
            begin
              reg70 <= (((~^reg68) ?
                  (($unsigned((8'ha2)) ?
                          wire66[(2'h3):(2'h3)] : {wire64, wire64}) ?
                      wire62 : $signed((~wire64))) : $signed(reg67)) ^ (~((8'ha4) ?
                  (~$signed(wire62)) : reg68)));
            end
          else
            begin
              reg70 <= (+reg68);
              reg71 <= {((reg68 - (~wire63)) - wire61[(1'h0):(1'h0)])};
              reg72 <= ((-$signed($unsigned((reg69 ? wire60 : (8'h9e))))) ?
                  wire65[(3'h7):(1'h1)] : $unsigned({(reg71 ?
                          $unsigned((8'haf)) : wire61[(3'h7):(1'h1)]),
                      $unsigned((8'ha0))}));
              reg73 <= $signed(({$unsigned((~(8'hbb)))} ^ ($signed(reg72) < reg67[(3'h5):(2'h2)])));
            end
        end
      reg74 <= (!reg72[(5'h10):(1'h1)]);
    end
  assign wire75 = reg69[(5'h14):(4'hf)];
  assign wire76 = wire75[(2'h2):(2'h2)];
  assign wire77 = wire60[(1'h0):(1'h0)];
  assign wire78 = $signed(reg73);
  assign wire79 = (^reg70[(3'h4):(3'h4)]);
  assign wire80 = $signed((8'hba));
  assign wire81 = (~|(!(-reg70)));
  assign wire82 = {(wire64[(2'h3):(2'h3)] ?
                          $unsigned(((wire79 && wire77) ?
                              {wire65, wire78} : $signed(reg67))) : {reg73,
                              $unsigned((~^wire80))}),
                      wire66[(2'h3):(1'h1)]};
  assign wire83 = (!(wire60 <= {{$signed(reg73), (wire66 ? (8'haf) : wire81)},
                      (^~$unsigned(wire81))}));
  assign wire84 = (wire66 ?
                      wire61[(3'h7):(2'h3)] : ((8'hbd) ?
                          (wire83 ?
                              wire60 : ($signed(reg69) - reg74)) : (+$signed(wire62[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      reg85 <= (^(wire84 * $signed($signed(wire60[(2'h3):(1'h0)]))));
      reg86 <= $signed($signed($unsigned($unsigned($signed(reg67)))));
    end
  assign wire87 = (((((wire80 ? wire61 : wire76) ? reg86 : $unsigned(wire66)) ?
                      $unsigned($signed(reg71)) : $signed($signed(wire60))) - (+{(^~wire82)})) ^ ((8'h9c) ?
                      $signed(wire83[(3'h6):(3'h6)]) : ((wire80 ?
                              (8'ha3) : reg74[(3'h5):(3'h5)]) ?
                          wire75[(3'h5):(3'h4)] : {wire81})));
  assign wire88 = (~&wire76[(4'ha):(4'h9)]);
  always
    @(posedge clk) begin
      reg89 <= wire79[(4'h8):(3'h6)];
      reg90 <= (~&wire78[(1'h0):(1'h0)]);
      reg91 <= (~|(~&((wire80[(4'hb):(1'h1)] & $unsigned(wire75)) ?
          $signed(wire82[(4'h8):(1'h0)]) : {(wire64 != reg68)})));
      reg92 <= {reg67[(4'h8):(3'h7)]};
    end
  assign wire93 = $signed($unsigned($unsigned($signed((-wire61)))));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire [(4'hc):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire18;
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire18,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = {(-(~|$signed(wire16)))};
  always
    @(posedge clk) begin
      if ($signed($signed({(((8'hb3) ? wire16 : wire17) ^~ (8'hb3))})))
        begin
          reg19 <= ($unsigned(wire16[(2'h2):(1'h1)]) ^~ {$signed(($unsigned(wire16) ~^ $signed(wire18))),
              (8'ha6)});
          reg20 <= wire15[(3'h5):(2'h2)];
          reg21 <= reg20[(3'h7):(3'h6)];
          reg22 <= reg19;
          if ($unsigned(((^~wire16[(3'h7):(3'h5)]) >>> $unsigned($signed(wire14[(3'h4):(2'h2)])))))
            begin
              reg23 <= ((!((wire16[(1'h0):(1'h0)] ?
                  (!wire14) : (reg21 ? wire15 : wire17)) ^ (8'ha8))) ^ reg19);
              reg24 <= (~|wire15);
            end
          else
            begin
              reg23 <= ((reg24 | $unsigned($signed($signed(reg21)))) ?
                  $unsigned($unsigned(reg23[(3'h7):(3'h6)])) : $unsigned((-(|$unsigned(reg20)))));
            end
        end
      else
        begin
          if (wire16)
            begin
              reg19 <= {{reg20, reg22},
                  (reg23[(3'h7):(3'h4)] ?
                      $unsigned({$unsigned(wire16)}) : reg19[(3'h5):(2'h2)])};
              reg20 <= (|(wire14 ?
                  $signed(reg21[(3'h5):(3'h4)]) : $signed({(~wire16),
                      {reg23}})));
              reg21 <= (+(~$signed(reg24)));
              reg22 <= reg21[(4'h9):(2'h3)];
            end
          else
            begin
              reg19 <= {reg23[(4'ha):(1'h1)]};
              reg20 <= $signed({$unsigned((!$signed(reg22))),
                  ($signed($signed(wire17)) ~^ $unsigned((~&reg21)))});
              reg21 <= $signed({($unsigned({reg23, (8'hb5)}) ?
                      ($unsigned(reg22) >> (reg23 && reg23)) : $signed((reg20 ?
                          wire16 : reg20))),
                  ((8'hb6) ?
                      $unsigned($unsigned(reg19)) : $unsigned((reg24 && wire14)))});
              reg22 <= $signed($unsigned((~&reg22)));
            end
          if ($unsigned((reg21[(2'h2):(1'h1)] ?
              (&$signed((wire18 ? wire15 : wire18))) : wire18)))
            begin
              reg23 <= ({{(~^(reg24 ? reg23 : reg19)),
                          $unsigned($signed(reg22))},
                      (($unsigned((7'h44)) >> (wire14 ? (8'had) : reg20)) ?
                          wire16 : wire17[(1'h1):(1'h0)])} ?
                  ((reg21 <= $unsigned((^reg20))) > ({reg23[(4'h9):(3'h7)]} ^ (~^$signed(reg24)))) : $unsigned(({reg20[(3'h6):(3'h6)],
                      ((8'ha6) ? wire15 : reg19)} > (-$signed(reg23)))));
            end
          else
            begin
              reg23 <= wire15;
              reg24 <= $unsigned($signed(((|(reg23 != wire17)) ?
                  (!reg21[(5'h10):(2'h3)]) : (!$unsigned(reg21)))));
              reg25 <= (~|($unsigned($signed(reg21)) ?
                  ((8'ha1) | (~^$unsigned(wire18))) : $unsigned($unsigned((wire14 | wire14)))));
              reg26 <= reg24;
            end
        end
    end
  assign wire27 = wire17;
  assign wire28 = wire15;
endmodule
