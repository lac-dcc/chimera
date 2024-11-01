module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire175;
  wire signed [(3'h5):(1'h0)] wire174;
  wire [(5'h14):(1'h0)] wire161;
  wire signed [(4'hf):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire157;
  wire signed [(2'h2):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg [(4'h8):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire4,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire4 = wire1[(4'hc):(4'hc)];
  module5 #() modinst156 (.wire9(wire3), .wire7(wire0), .clk(clk), .wire6(wire4), .wire8(wire1), .y(wire155));
  assign wire157 = $signed(((|{wire0[(4'hc):(1'h1)], (~|(8'hb0))}) ?
                       wire4[(3'h4):(1'h0)] : (~^((wire0 ? (8'ha0) : wire4) ?
                           wire4[(3'h6):(3'h6)] : (wire3 + wire0)))));
  assign wire158 = {$unsigned($unsigned(wire3[(4'h9):(1'h1)]))};
  assign wire159 = $unsigned((^~(($signed(wire3) << (&wire2)) ?
                       wire157[(1'h0):(1'h0)] : $unsigned($unsigned(wire158)))));
  assign wire160 = $unsigned($signed(wire0));
  assign wire161 = (wire2 ?
                       ($signed($unsigned($unsigned(wire0))) + wire4) : (($signed($signed(wire1)) ?
                               (((8'hae) ? wire0 : (8'h9e)) ?
                                   wire157[(1'h1):(1'h0)] : (-wire160)) : {$signed(wire155)}) ?
                           ($unsigned((~^wire1)) + wire3[(4'h9):(4'h8)]) : $signed(($unsigned(wire157) ?
                               {wire158} : (&wire160)))));
  always
    @(posedge clk) begin
      if (((wire0[(3'h4):(1'h0)] | $signed(((~|wire158) || $signed(wire159)))) ~^ $signed(($signed((wire157 | wire155)) ?
          {wire4, (8'hb0)} : $signed($unsigned(wire4))))))
        begin
          reg162 <= wire158[(1'h0):(1'h0)];
          if (($signed(wire155) ?
              wire0 : $signed(((~&wire155[(1'h0):(1'h0)]) + {(wire3 ?
                      wire158 : wire4),
                  (|reg162)}))))
            begin
              reg163 <= wire155[(2'h2):(1'h1)];
              reg164 <= wire159;
              reg165 <= $unsigned(((|$signed(reg163)) ?
                  ((wire159[(3'h4):(2'h2)] ?
                      $signed(wire3) : wire2) << {wire158}) : $unsigned((~|wire158))));
            end
          else
            begin
              reg163 <= (($unsigned((^{reg164})) ?
                  $signed(wire158) : wire161) + ((((!wire157) * reg163) == ((!wire3) ?
                      {wire3} : $unsigned(wire161))) ?
                  $signed(wire155[(1'h1):(1'h0)]) : ((wire2 ?
                      (^~wire160) : (~|wire160)) * ((~^wire157) ?
                      (wire158 ? (8'hb6) : wire4) : $unsigned(reg165)))));
              reg164 <= (($signed($unsigned({wire1,
                      wire159})) << $signed(wire4[(4'hb):(1'h1)])) ?
                  (^~wire157) : wire0[(3'h6):(1'h1)]);
              reg165 <= ($unsigned((~|(wire158 ?
                      (reg162 ? (8'hac) : reg163) : $signed(reg165)))) ?
                  $signed(((~|((8'hb5) << wire158)) ?
                      $signed(wire160) : wire158[(3'h6):(1'h1)])) : (~^reg164));
              reg166 <= (|(wire160 | wire161));
            end
        end
      else
        begin
          reg162 <= $signed(reg163[(4'h9):(3'h5)]);
          if (wire0[(4'hd):(2'h3)])
            begin
              reg163 <= (wire157[(1'h1):(1'h0)] >>> (reg164[(4'hc):(2'h2)] ?
                  ($unsigned((wire159 != wire1)) < wire157[(3'h6):(3'h5)]) : $signed((~^wire4))));
            end
          else
            begin
              reg163 <= $unsigned(wire3);
              reg164 <= wire155[(1'h1):(1'h1)];
              reg165 <= wire4;
              reg166 <= {reg162[(5'h13):(4'hc)],
                  ((({wire157, reg166} ~^ $signed((8'ha5))) ?
                          ((reg164 ? wire161 : (8'ha3)) ?
                              (|wire1) : (8'hb9)) : reg163[(4'ha):(3'h6)]) ?
                      (wire0[(1'h1):(1'h1)] ?
                          ((reg162 ?
                              wire155 : reg163) ~^ $signed(wire3)) : wire157[(1'h0):(1'h0)]) : (reg163[(4'ha):(4'ha)] ?
                          ((wire3 ?
                              wire159 : wire1) ^~ wire155) : wire160[(3'h7):(3'h4)]))};
              reg167 <= reg162[(5'h12):(4'ha)];
            end
          reg168 <= (((~^{$signed(reg167),
                  wire1[(4'h9):(1'h0)]}) << {$signed((reg163 ?
                      (7'h41) : wire0)),
                  $signed((reg164 < wire155))}) ?
              (((wire160[(4'hf):(4'ha)] ?
                  (~^(7'h43)) : {wire1}) && (wire155[(2'h2):(1'h1)] << (reg167 ?
                  reg165 : wire1))) * ($unsigned(wire159) ?
                  (&(&wire155)) : wire4)) : {{($unsigned(wire159) ?
                          (wire157 ? reg163 : wire2) : (reg166 != wire159)),
                      {(reg163 ? wire0 : wire3)}}});
          reg169 <= (-$signed(((wire157[(4'h8):(1'h1)] <<< (~^wire161)) * ((wire160 ?
              wire2 : wire160) || (~wire155)))));
          reg170 <= $signed((((^(wire155 >= wire161)) ?
              wire2 : (wire3[(1'h1):(1'h0)] ^~ $unsigned((8'ha3)))) ~^ ((8'hb8) ?
              $signed((wire160 >> reg168)) : $unsigned($unsigned(wire159)))));
        end
      reg171 <= wire155[(1'h1):(1'h1)];
      reg172 <= {reg169,
          $unsigned($unsigned(((wire1 + wire3) ?
              reg165[(2'h3):(1'h1)] : wire161[(1'h0):(1'h0)])))};
      reg173 <= $signed(wire2[(3'h5):(3'h5)]);
    end
  assign wire174 = {{$signed(((^~reg167) ?
                               (wire4 ? wire157 : reg169) : (!reg165)))}};
  assign wire175 = $signed(wire0[(3'h6):(1'h1)]);
  assign wire176 = ((8'hbb) ?
                       (8'hb4) : $signed($unsigned($signed({wire160,
                           (8'hb2)}))));
endmodule

module module5
#(parameter param153 = {(~((~((7'h42) ? (8'hb2) : (7'h42))) ^~ ({(8'h9d)} * (~&(8'h9f))))), (^~{{((8'h9d) < (8'hb6)), (!(8'hb3))}})}, 
parameter param154 = (((param153 ^~ ((param153 ? param153 : param153) ? (param153 ? (8'ha5) : param153) : (&param153))) ? (&(+(param153 << param153))) : {param153, param153}) ? param153 : {(!(-param153)), (^((+param153) <= {param153}))}))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h28d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire121;
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  assign y = {wire152,
                 wire150,
                 wire124,
                 wire123,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire51,
                 wire52,
                 wire105,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire121,
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
                 (1'h0)};
  assign wire10 = (~|(wire8 > $unsigned((&(wire8 ? wire7 : wire8)))));
  assign wire11 = $signed((^(wire6[(4'h8):(3'h6)] > (8'ha1))));
  assign wire12 = wire10;
  assign wire13 = (|{(-($unsigned(wire6) * {wire10}))});
  assign wire14 = (&$unsigned((!wire7[(1'h0):(1'h0)])));
  assign wire15 = ((&(wire14 ?
                      $signed((wire6 * wire13)) : $signed((wire12 <<< wire13)))) > (wire9 || wire7));
  assign wire16 = $unsigned((^$signed(wire15[(2'h3):(2'h2)])));
  assign wire17 = {(7'h40),
                      ($signed($unsigned($signed(wire8))) ?
                          wire6[(4'h8):(1'h1)] : $signed({$signed(wire16),
                              $unsigned(wire13)}))};
  always
    @(posedge clk) begin
      if ((($signed((~&{wire15})) == ($unsigned(wire15) ?
          (-$unsigned(wire17)) : $unsigned((~&wire14)))) ^~ (((~&{wire6}) < $unsigned(wire14)) >>> wire16)))
        begin
          reg18 <= wire8[(1'h0):(1'h0)];
        end
      else
        begin
          reg18 <= $unsigned(((7'h41) != wire7[(3'h7):(1'h1)]));
          reg19 <= $signed(($signed((((8'hb5) < (8'h9e)) | wire7[(2'h2):(1'h1)])) ?
              $signed((8'hbd)) : ({$signed(wire8),
                  $signed(wire6)} ~^ $signed(wire16))));
          reg20 <= $signed(($signed(($unsigned(wire14) + (!wire13))) <= $signed($signed((wire11 * wire9)))));
        end
      if (wire16)
        begin
          reg21 <= (wire8 != wire13);
        end
      else
        begin
          if ($signed((($signed($signed(reg18)) ?
                  $unsigned((wire17 ?
                      wire8 : wire12)) : $signed($signed(wire8))) ?
              wire10[(3'h4):(2'h2)] : (&$unsigned((reg18 ? wire17 : wire13))))))
            begin
              reg21 <= (|{reg20});
              reg22 <= reg18[(2'h3):(2'h3)];
              reg23 <= (wire11 > ((+wire15[(1'h1):(1'h0)]) ?
                  {$signed((wire9 ? wire11 : (7'h42))),
                      wire17} : ($unsigned((wire13 || wire7)) ?
                      (wire8 ? (&wire15) : (!reg21)) : $unsigned((~wire16)))));
            end
          else
            begin
              reg21 <= $signed((~|$unsigned({(-wire15)})));
              reg22 <= {((~{(wire13 ? wire16 : (8'hba)),
                          ((8'hbb) ? wire6 : reg23)}) ?
                      (((8'h9e) ? (reg22 >>> wire14) : $signed(wire17)) ?
                          (((8'h9f) ? reg19 : wire15) ?
                              (wire14 - wire7) : (wire9 ?
                                  (8'hac) : reg23)) : ($signed(reg22) ?
                              $signed((8'hbe)) : wire6)) : {reg19,
                          ($unsigned(wire14) ?
                              (reg20 == wire12) : wire6[(4'hc):(2'h2)])}),
                  (wire13 ~^ {((reg22 ? reg23 : reg23) ^~ wire6[(2'h3):(2'h3)]),
                      reg20[(5'h14):(3'h4)]})};
              reg23 <= (reg20 * (wire7 >> $unsigned((((7'h41) ? reg22 : reg21) ?
                  (^wire11) : wire14[(2'h2):(2'h2)]))));
              reg24 <= (((-reg22) ?
                      {$signed(((8'hb4) >>> reg23)),
                          $unsigned($signed(wire6))} : wire10) ?
                  (7'h44) : (~$unsigned($signed((wire6 | wire15)))));
            end
          if ({wire8})
            begin
              reg25 <= $unsigned(wire16[(3'h5):(1'h0)]);
              reg26 <= $signed((~((^(reg22 ? wire15 : (8'hbf))) ?
                  (~^{reg22, reg23}) : $unsigned($signed(wire14)))));
              reg27 <= (wire15[(4'h8):(3'h6)] ?
                  ((&(+$unsigned(wire11))) ?
                      $unsigned(reg18) : (^~wire10[(3'h5):(1'h0)])) : $unsigned(reg24));
              reg28 <= wire15;
            end
          else
            begin
              reg25 <= $unsigned($signed($signed(((reg22 ? reg22 : wire8) ?
                  reg28 : (wire15 ? wire6 : reg22)))));
              reg26 <= ((8'ha7) ?
                  $unsigned(wire17) : (^(+(reg23[(4'hb):(4'ha)] ?
                      ((8'haf) ? wire7 : reg18) : (reg25 ? (8'hbd) : reg19)))));
              reg27 <= $signed((7'h42));
              reg28 <= ((~|reg23) > ($signed(reg26) & (|(+wire16))));
            end
          reg29 <= reg20;
          reg30 <= $unsigned($signed(($unsigned((wire17 ?
              wire6 : wire13)) - {$unsigned((8'hae))})));
        end
      if ({wire17})
        begin
          reg31 <= (reg29[(3'h4):(2'h3)] ?
              {$signed(((-reg25) ?
                      {reg19, (7'h44)} : (wire8 ? reg20 : (8'hb0))))} : reg18);
          reg32 <= {{$signed({(~&wire11)})}, wire12[(4'hd):(3'h5)]};
          reg33 <= (($unsigned($unsigned((wire15 | wire12))) <<< ((|$unsigned(wire17)) ?
                  ((reg31 <= wire15) << $signed(wire13)) : wire9)) ?
              reg24 : $signed($unsigned((~$unsigned((8'hae))))));
        end
      else
        begin
          reg31 <= wire6[(1'h1):(1'h0)];
          reg32 <= {((8'haf) ? reg28[(4'h8):(1'h1)] : $unsigned(wire15)),
              (|(~&$signed($unsigned(reg27))))};
          if (reg20[(5'h14):(4'he)])
            begin
              reg33 <= {$unsigned((+$signed($unsigned(reg19)))), reg21};
              reg34 <= $signed($unsigned((reg26 ?
                  reg20[(1'h1):(1'h1)] : $signed((reg25 << wire6)))));
            end
          else
            begin
              reg33 <= reg20;
              reg34 <= wire15;
              reg35 <= (($signed((reg21[(1'h1):(1'h0)] ?
                  (wire11 != reg30) : (~reg21))) >= reg29[(3'h4):(1'h1)]) > (^{$unsigned({wire14})}));
              reg36 <= reg30[(2'h2):(2'h2)];
              reg37 <= ($signed((wire12[(1'h1):(1'h1)] ?
                  {reg29} : ($unsigned(wire14) ?
                      (reg33 >>> reg27) : (wire11 < wire15)))) >= $signed(reg32[(3'h5):(3'h4)]));
            end
        end
      reg38 <= (&($signed((^wire17)) != reg21[(2'h2):(1'h1)]));
      reg39 <= reg36[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg40 <= $unsigned(reg25);
      if (((7'h42) ?
          {((reg27[(3'h6):(3'h5)] >> reg21) ^~ ((^reg25) * $unsigned(reg29))),
              (~reg30[(2'h3):(1'h1)])} : $signed(wire17)))
        begin
          reg41 <= ((reg25[(3'h7):(1'h1)] < reg40) >= $unsigned($signed({reg36[(4'ha):(4'h9)]})));
          if ((reg28 ? (^(8'hac)) : (wire13 ^~ wire17[(3'h4):(1'h0)])))
            begin
              reg42 <= (8'h9d);
            end
          else
            begin
              reg42 <= $unsigned(wire15[(4'h8):(2'h2)]);
            end
          reg43 <= reg37;
        end
      else
        begin
          if (wire17[(2'h2):(1'h0)])
            begin
              reg41 <= reg23[(4'hf):(4'he)];
            end
          else
            begin
              reg41 <= (7'h44);
              reg42 <= $signed(reg18[(2'h2):(2'h2)]);
              reg43 <= ((-((~&$signed(reg32)) - (^~(reg39 ?
                  reg29 : wire9)))) & $unsigned(reg23[(4'hf):(4'h8)]));
              reg44 <= $signed((wire17[(3'h7):(3'h6)] ?
                  (reg18[(4'h9):(1'h1)] >= wire15[(2'h3):(2'h3)]) : (~&(reg32 * wire13[(5'h12):(4'h9)]))));
            end
          reg45 <= reg29;
          reg46 <= reg44;
          reg47 <= $signed(reg23[(4'hf):(3'h6)]);
        end
      reg48 <= reg36[(4'hb):(4'h8)];
      reg49 <= ($unsigned((^~reg18)) << $signed(((wire11[(3'h4):(1'h1)] == $unsigned(wire13)) != ($unsigned((8'hb8)) ?
          $signed(reg19) : $signed(reg28)))));
      reg50 <= reg33[(3'h4):(1'h0)];
    end
  assign wire51 = reg37;
  assign wire52 = reg23[(4'he):(2'h3)];
  module53 #() modinst106 (wire105, clk, wire11, reg48, wire14, reg38, reg34);
  assign wire107 = (~|reg31);
  assign wire108 = (reg49 != (reg49[(3'h7):(1'h1)] <<< $signed($signed((&wire12)))));
  assign wire109 = wire108[(4'he):(3'h6)];
  assign wire110 = reg42[(2'h3):(2'h2)];
  module111 #() modinst122 (.wire114(reg20), .wire113(reg36), .y(wire121), .clk(clk), .wire112(reg42), .wire115(wire52));
  assign wire123 = $signed(reg50);
  assign wire124 = {(wire12[(3'h6):(3'h5)] && $unsigned(({(8'ha7), (8'hb1)} ?
                           reg37 : (reg18 + reg18))))};
  module125 #() modinst151 (.wire127(reg37), .wire128(wire105), .wire129(wire121), .wire126(reg23), .y(wire150), .clk(clk));
  assign wire152 = $signed(reg20[(3'h7):(2'h2)]);
endmodule

module module125
#(parameter param148 = (((8'ha6) ? ((((8'ha5) ? (8'hb5) : (8'hae)) ? (~(8'hbf)) : ((8'h9c) ? (8'hac) : (8'hb6))) ? ((^~(8'hab)) || (-(8'ha8))) : (((8'ha9) <= (7'h42)) ? ((8'ha9) ? (8'haf) : (8'ha2)) : (~|(8'hab)))) : ((~&((8'h9f) >> (7'h44))) ^~ (-((8'hb1) - (8'hb6))))) << (((~&((8'hbd) ^~ (8'had))) << (((8'h9f) ? (8'ha7) : (8'h9d)) ? ((8'haf) ^~ (7'h41)) : ((8'had) ? (8'h9c) : (8'hb3)))) ~^ {(~^((8'ha9) ? (8'hb8) : (8'ha8))), {((8'hac) + (8'h9f)), ((8'hb4) ? (8'hb4) : (8'hbb))}})), 
parameter param149 = param148)
(y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire129;
  input wire [(3'h6):(1'h0)] wire128;
  input wire signed [(5'h15):(1'h0)] wire127;
  input wire signed [(4'hc):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire142;
  wire [(4'ha):(1'h0)] wire141;
  wire signed [(2'h2):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire134;
  wire signed [(4'hd):(1'h0)] wire130;
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire130,
                 reg147,
                 reg146,
                 reg139,
                 reg138,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire130 = $signed($signed(wire128[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg131 <= wire129;
      reg132 <= $signed($unsigned({(wire128 ? wire129 : $signed(wire128)),
          $signed($signed(reg131))}));
      reg133 <= ($signed(reg132) - $signed((((~^wire127) ? wire126 : reg131) ?
          wire128[(3'h4):(2'h2)] : (&wire127[(3'h4):(1'h0)]))));
    end
  assign wire134 = $signed(($unsigned((|(^~wire126))) ^~ $unsigned(((wire126 >> wire128) ?
                       $signed(wire130) : (|(8'ha3))))));
  assign wire135 = $signed((!wire130[(2'h2):(1'h0)]));
  assign wire136 = (($signed((reg131 == $unsigned(reg133))) ?
                           {{(!wire128)}, (&$signed(wire126))} : wire129) ?
                       reg131[(2'h3):(1'h1)] : wire128);
  assign wire137 = reg132[(4'h9):(4'h9)];
  always
    @(posedge clk) begin
      reg138 <= (!((^~((-wire126) >>> (wire136 ?
          wire135 : reg133))) || $signed((|((8'hbb) ? wire135 : wire136)))));
      reg139 <= $unsigned(reg131[(2'h3):(2'h2)]);
    end
  assign wire140 = ($signed(($unsigned((~|wire128)) >= ($unsigned(reg138) ?
                       wire130[(2'h2):(2'h2)] : (wire135 ?
                           wire130 : reg139)))) + wire128[(3'h4):(2'h2)]);
  assign wire141 = $unsigned({reg132});
  assign wire142 = $signed($unsigned($signed($unsigned((wire134 ?
                       wire130 : wire135)))));
  assign wire143 = (wire130 ?
                       (~($unsigned($signed(wire142)) ?
                           $unsigned(wire128) : ((~&reg138) == {wire134,
                               (8'h9d)}))) : ($unsigned((&$unsigned(reg138))) * wire127[(5'h11):(1'h0)]));
  assign wire144 = $signed(wire130);
  assign wire145 = wire136;
  always
    @(posedge clk) begin
      reg146 <= $unsigned(reg131);
      reg147 <= $signed((-((((8'hb4) < reg132) ?
          $unsigned((8'had)) : $unsigned(wire126)) + $unsigned($unsigned(wire126)))));
    end
endmodule

module module111
#(parameter param120 = (-{(~({(8'ha6)} ? ((8'hbf) ? (8'h9c) : (8'hbb)) : {(8'hbd), (7'h42)})), {(&{(7'h42), (8'h9c)}), (((8'hbf) ? (8'hb6) : (7'h40)) < (^(8'h9e)))}}))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire115;
  input wire [(5'h10):(1'h0)] wire114;
  input wire signed [(3'h7):(1'h0)] wire113;
  input wire [(4'he):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire116;
  assign y = {wire119, wire118, wire117, wire116, (1'h0)};
  assign wire116 = ((wire114[(4'hc):(3'h6)] ?
                           $signed((wire115[(2'h2):(1'h0)] ?
                               (wire112 > wire114) : $unsigned(wire115))) : (wire114[(4'hc):(3'h5)] ?
                               (~&(wire112 >= (8'ha5))) : wire112)) ?
                       (~^$signed(wire113[(1'h0):(1'h0)])) : wire112);
  assign wire117 = wire116;
  assign wire118 = $signed((8'ha5));
  assign wire119 = $signed((~^($signed((&wire118)) ?
                       $unsigned((wire118 ?
                           wire116 : wire117)) : $signed(((8'hbb) ?
                           wire118 : wire113)))));
endmodule

module module53
#(parameter param103 = ((^((8'hba) ^ (~^((8'hbe) ~^ (8'hb0))))) | ((((~^(8'hb8)) ? (+(8'hb1)) : (^(8'ha8))) >>> ((&(8'ha4)) ? (&(8'hbd)) : ((7'h41) + (8'hac)))) ^~ (!{((8'hb9) ? (8'hb4) : (8'hb6))}))), 
parameter param104 = {(param103 <= ((8'ha5) <= ((param103 ? param103 : param103) ? (!param103) : (!(8'h9c))))), (({(param103 ? param103 : param103)} ? ((param103 ^~ param103) ? (~&param103) : ((8'hb2) ? (8'ha3) : (8'ha3))) : ((8'hb0) && (param103 - param103))) < (-(+(param103 ^ param103))))})
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire58;
  input wire signed [(4'hd):(1'h0)] wire57;
  input wire signed [(4'ha):(1'h0)] wire56;
  input wire [(5'h14):(1'h0)] wire55;
  input wire [(4'hc):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire59;
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire70,
                 wire69,
                 wire68,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg67,
                 reg66,
                 reg65,
                 reg60,
                 (1'h0)};
  assign wire59 = (((((~^wire56) ? (wire55 - wire57) : $signed((7'h40))) ?
                          $signed((wire57 | wire54)) : $signed((wire56 ?
                              wire55 : (8'ha4)))) ?
                      $signed(wire58[(2'h2):(1'h1)]) : {$unsigned(wire58[(4'ha):(4'ha)])}) <= (~&(^~$unsigned((wire57 | wire58)))));
  always
    @(posedge clk) begin
      reg60 <= wire59;
    end
  assign wire61 = (8'ha3);
  assign wire62 = wire57[(3'h5):(3'h5)];
  assign wire63 = wire56[(4'h8):(1'h0)];
  assign wire64 = $unsigned(($unsigned($signed((&wire57))) > wire59[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      if ($unsigned((^~(8'ha1))))
        begin
          reg65 <= wire54[(1'h0):(1'h0)];
          reg66 <= wire55[(1'h0):(1'h0)];
        end
      else
        begin
          reg65 <= (($signed(({(7'h41)} ?
              $unsigned(wire59) : reg66)) * (&(-wire59[(1'h0):(1'h0)]))) >> (~^(~wire56[(1'h1):(1'h1)])));
          reg66 <= ((8'ha8) && (+(wire59 ^~ {(wire64 ? (8'hae) : wire64)})));
          reg67 <= $signed({(^~$unsigned(wire58))});
        end
    end
  assign wire68 = $unsigned(((^((reg65 || wire63) ?
                          reg60 : $unsigned(wire59))) ?
                      $unsigned(reg66[(4'hd):(4'ha)]) : $signed({$signed(wire56)})));
  assign wire69 = $signed((&$unsigned((wire68 ?
                      wire62[(2'h2):(1'h1)] : (wire64 ? wire68 : wire61)))));
  assign wire70 = (+{(!{(wire69 || wire57), (+wire63)})});
  always
    @(posedge clk) begin
      reg71 <= $signed(($unsigned(wire68) ?
          (({wire63} + (wire70 == (8'hb0))) >> $signed(wire57[(2'h3):(1'h1)])) : wire54));
      if (({((+$unsigned(wire57)) ?
              {{reg71},
                  reg67[(4'h9):(3'h4)]} : wire69[(3'h6):(2'h3)])} << wire55[(3'h5):(3'h4)]))
        begin
          if (reg67[(4'hf):(1'h1)])
            begin
              reg72 <= (~|($signed($signed(wire57)) > (7'h41)));
              reg73 <= {$signed($signed(wire56[(2'h2):(1'h0)]))};
              reg74 <= $signed((!({{wire61}} ?
                  ((~^wire55) ?
                      reg60[(2'h3):(1'h1)] : (reg60 ?
                          wire64 : wire56)) : (~^(wire57 < wire70)))));
            end
          else
            begin
              reg72 <= (wire69[(4'ha):(2'h2)] ?
                  {$signed($signed((reg74 ? reg71 : (8'hbe)))),
                      ($signed(reg65[(3'h6):(3'h4)]) ?
                          ($unsigned(reg72) ?
                              wire57 : (reg66 | (8'hbc))) : ($unsigned(wire69) ?
                              (wire70 ?
                                  wire57 : reg66) : (~&wire57)))} : {reg71[(5'h11):(3'h6)]});
              reg73 <= ((((reg67[(1'h0):(1'h0)] <= reg71[(3'h7):(2'h3)]) ?
                      (-wire56) : wire64) ?
                  (($signed(wire64) ^~ wire58) ^ wire61) : $unsigned($unsigned((reg66 ?
                      (8'hb3) : reg60)))) * ($unsigned(($unsigned(reg65) ?
                  (reg71 > reg74) : (reg65 * reg74))) || (!{reg67[(5'h13):(4'hc)]})));
              reg74 <= (8'ha7);
            end
          reg75 <= $unsigned($unsigned(((^~$unsigned(wire70)) ?
              ($unsigned(wire61) ?
                  $signed(wire58) : (wire62 ?
                      (8'hb5) : reg60)) : $signed(wire59))));
          reg76 <= $signed(reg60);
          if ((^~(!reg67)))
            begin
              reg77 <= (((~|(|(~&wire68))) ~^ $unsigned(($unsigned(reg72) == $unsigned(reg74)))) ?
                  (!wire59[(2'h3):(1'h1)]) : (wire70 ?
                      ((~|$unsigned(wire54)) >> $unsigned((reg60 || reg75))) : (~&({(8'h9c)} ?
                          {wire55} : (wire54 > wire62)))));
              reg78 <= (^reg71[(4'hf):(1'h0)]);
              reg79 <= ((wire69 ^~ wire54) >= ($unsigned({(reg66 + (8'ha8)),
                  reg73[(4'he):(3'h7)]}) * reg73));
            end
          else
            begin
              reg77 <= ($signed((!$signed(((8'ha7) ? reg75 : (8'hb6))))) ?
                  (~|$unsigned((|$signed((8'hbb))))) : ($signed($signed({reg78,
                      wire68})) & ($signed((reg67 ^~ wire57)) && (+(wire55 ?
                      reg76 : reg77)))));
              reg78 <= $signed(reg78[(3'h6):(2'h3)]);
              reg79 <= $unsigned((-wire58));
              reg80 <= $unsigned(reg71);
            end
          if (wire69)
            begin
              reg81 <= ($unsigned({($unsigned(wire54) ?
                          $unsigned((8'hac)) : $unsigned(wire55)),
                      wire62}) ?
                  $unsigned($unsigned($signed($unsigned(wire64)))) : wire62);
              reg82 <= $unsigned(($unsigned($unsigned({(8'hb0), reg81})) ?
                  wire70 : (~($signed(reg75) <<< (reg74 ? wire57 : (8'hae))))));
              reg83 <= $unsigned($unsigned(wire56[(3'h7):(3'h5)]));
            end
          else
            begin
              reg81 <= ((8'haa) == (&$unsigned(wire56)));
              reg82 <= reg73;
              reg83 <= ((((&(wire56 ? wire70 : wire55)) + wire69) ?
                      reg66[(4'h8):(2'h3)] : $unsigned($unsigned((wire68 ?
                          wire69 : wire54)))) ?
                  (((~(reg60 <<< wire56)) ?
                      {wire69[(1'h0):(1'h0)], {(8'hb5)}} : ($signed(wire56) ?
                          $unsigned((8'hb9)) : (|wire68))) ~^ {(wire61 * $unsigned(wire70))}) : {$signed($unsigned({(8'hb2)}))});
              reg84 <= (8'ha3);
            end
        end
      else
        begin
          reg72 <= (~&reg84);
          reg73 <= reg78;
          if ((8'ha9))
            begin
              reg74 <= {$unsigned($signed((-(wire69 * (8'hbf))))),
                  reg80[(1'h1):(1'h0)]};
              reg75 <= ((wire59[(1'h1):(1'h0)] ?
                      (~reg72[(2'h3):(1'h0)]) : wire68) ?
                  wire58 : ((+reg75[(2'h3):(2'h2)]) ? reg77 : reg78));
            end
          else
            begin
              reg74 <= (-wire70[(4'ha):(1'h1)]);
            end
        end
      if ($signed((reg67[(5'h11):(3'h7)] | $unsigned({$unsigned(wire64),
          (~^wire57)}))))
        begin
          reg85 <= $unsigned($signed((((^~wire68) ?
              $unsigned((8'hb6)) : (wire59 ?
                  reg77 : reg66)) >> reg83[(2'h2):(1'h0)])));
          reg86 <= (8'ha2);
        end
      else
        begin
          reg85 <= $unsigned((~|$signed(($unsigned(reg71) ?
              (reg79 - (8'hbe)) : (&wire56)))));
          reg86 <= (((($unsigned(reg86) ?
                  (reg77 ? reg65 : reg79) : (reg84 + reg67)) ?
              (reg83[(1'h0):(1'h0)] * reg81) : $signed((wire57 ?
                  reg78 : (8'ha6)))) >>> {$unsigned((8'ha2))}) || wire70[(4'ha):(3'h4)]);
          reg87 <= wire59[(3'h5):(2'h3)];
        end
      reg88 <= (8'ha7);
      if ($unsigned($signed(($signed($unsigned(wire58)) <<< ((reg74 ?
          (8'ha2) : reg65) + reg88[(2'h3):(1'h0)])))))
        begin
          reg89 <= $unsigned(reg85);
          reg90 <= (-($signed({$signed(wire57)}) ?
              wire58[(4'hc):(4'h9)] : ($unsigned($unsigned(reg89)) ?
                  $signed($signed(wire69)) : reg79[(4'he):(4'hd)])));
          reg91 <= $signed(reg60[(3'h4):(1'h0)]);
          reg92 <= (+(8'ha6));
        end
      else
        begin
          reg89 <= ((~^$signed(($signed(wire69) - (reg88 < reg90)))) * {((((8'ha6) ?
                  reg71 : wire54) && $unsigned((7'h41))) > {wire57}),
              reg84});
          reg90 <= $unsigned($unsigned($unsigned(($unsigned(reg80) < (reg92 ^ reg71)))));
          reg91 <= $signed($signed((reg92 < (!reg84))));
          if (reg78[(5'h15):(5'h14)])
            begin
              reg92 <= ((reg72 ^~ reg74) || $signed(($signed((8'hae)) ?
                  (~^{reg76}) : reg80[(4'hb):(4'h8)])));
              reg93 <= (~$signed($signed($signed($signed(reg82)))));
              reg94 <= (~&$unsigned({reg92[(3'h5):(2'h3)]}));
            end
          else
            begin
              reg92 <= $unsigned(reg65);
              reg93 <= {reg94[(3'h6):(3'h4)],
                  $unsigned((((wire69 ? wire70 : (8'haa)) | (|wire64)) ?
                      ((wire69 ? wire59 : wire59) && (reg85 ?
                          wire64 : wire68)) : (wire55[(3'h7):(1'h0)] ?
                          (reg76 ? reg81 : reg90) : (wire63 ?
                              wire61 : reg73))))};
            end
        end
    end
  assign wire95 = (~|($unsigned(reg85) + $unsigned(((&reg71) << reg81[(2'h2):(2'h2)]))));
  assign wire96 = (^~$signed(reg92[(4'hc):(1'h0)]));
  assign wire97 = $signed((~(-(7'h44))));
  assign wire98 = $signed(reg77);
  assign wire99 = $signed($unsigned((~^{(wire54 ? (8'ha3) : wire54)})));
  assign wire100 = reg82[(4'hc):(3'h6)];
  assign wire101 = ($signed(wire70[(4'h8):(3'h7)]) <<< wire56);
  assign wire102 = reg82[(2'h2):(2'h2)];
endmodule
