module top
#(parameter param209 = (|(8'h9e)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h256):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire206;
  reg signed [(4'h9):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire13,
                 wire14,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire42,
                 wire43,
                 wire44,
                 wire206,
                 reg208,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire5 = wire4[(4'hc):(2'h2)];
  assign wire6 = wire5[(3'h4):(1'h1)];
  assign wire7 = $unsigned((~wire4));
  always
    @(posedge clk) begin
      reg8 <= wire6[(1'h1):(1'h1)];
      reg9 <= $signed((~&{wire6, ({(8'hb7), (8'hb2)} == (wire6 & wire1))}));
      reg10 <= (wire5[(4'hb):(1'h0)] | wire0);
      reg11 <= ((8'h9d) ?
          $unsigned((^~$unsigned((wire0 ?
              (8'ha3) : (8'hbc))))) : $unsigned((wire6[(1'h1):(1'h1)] ?
              (^((8'hbc) ? wire0 : wire1)) : reg8[(4'h8):(3'h4)])));
      reg12 <= ($unsigned(($signed($unsigned(reg10)) - wire5)) ^ (wire1 ?
          (({wire3} ? (~^wire2) : wire5) ?
              $signed({reg10, wire5}) : ($unsigned(reg11) ?
                  $unsigned(wire3) : wire2)) : (((reg10 >> wire2) || wire6) ?
              (~^$unsigned(wire0)) : $unsigned($signed(reg9)))));
    end
  assign wire13 = reg10[(2'h2):(1'h1)];
  assign wire14 = (8'hb4);
  always
    @(posedge clk) begin
      reg15 <= {$unsigned((|$unsigned(wire4[(3'h7):(1'h0)])))};
      if ({wire6[(5'h11):(4'hf)],
          ((wire3[(1'h0):(1'h0)] ?
              ((wire14 ?
                  reg15 : wire3) ~^ $signed((8'hb3))) : wire5[(1'h1):(1'h0)]) ~^ $signed(wire6[(4'hd):(1'h0)]))})
        begin
          reg16 <= {({(wire14 || {wire13, wire4}),
                  reg10[(4'h8):(3'h5)]} ^~ $unsigned($unsigned(reg8[(4'hc):(3'h6)])))};
          if ($unsigned(reg11[(3'h5):(1'h0)]))
            begin
              reg17 <= $unsigned($signed(($signed((wire0 ?
                  (8'hbb) : wire6)) > $unsigned($unsigned(wire3)))));
              reg18 <= ((~|{$unsigned($unsigned(reg15))}) ?
                  $unsigned({$signed(((8'ha8) ? reg11 : reg15)),
                      $signed($signed(wire4))}) : (^$unsigned({$signed((8'h9e))})));
            end
          else
            begin
              reg17 <= ($unsigned(((~|(reg11 == wire13)) * (wire6 ?
                  {wire1,
                      (8'ha3)} : reg15[(3'h6):(2'h3)]))) ^ (reg16 > wire2[(3'h6):(2'h3)]));
              reg18 <= wire13;
              reg19 <= ($unsigned((wire6 ?
                  (8'h9c) : $unsigned($signed((8'hab))))) + ($signed((-reg9)) ?
                  $signed(reg10) : reg12));
              reg20 <= $signed($unsigned($unsigned($unsigned($unsigned(wire3)))));
            end
        end
      else
        begin
          reg16 <= $unsigned((($unsigned((wire3 >>> (8'h9f))) <<< $unsigned(wire6[(4'hc):(3'h7)])) || ((^~$signed(reg20)) ?
              {wire4, $signed(reg18)} : reg10)));
        end
      reg21 <= ({(~reg12[(4'hb):(4'ha)])} >>> ($unsigned(($signed(wire14) <= wire5)) >>> $signed((~|wire5[(4'h8):(3'h6)]))));
      reg22 <= (~&$unsigned((($signed(wire3) <<< ((8'hb6) & wire0)) ?
          reg21[(1'h1):(1'h0)] : reg10)));
    end
  always
    @(posedge clk) begin
      reg23 <= $unsigned({$signed((8'hb7)), reg9});
      reg24 <= {(reg8 ^ $unsigned((wire4[(4'hd):(4'hd)] ?
              $unsigned(wire13) : $signed(reg19))))};
      reg25 <= reg19;
      reg26 <= ((reg19[(2'h3):(1'h0)] + (reg20[(1'h0):(1'h0)] ?
          reg18[(3'h4):(2'h3)] : ((reg9 > reg10) ?
              $signed(reg17) : $unsigned((7'h44))))) <<< wire7[(4'he):(3'h7)]);
    end
  assign wire27 = $unsigned($unsigned((((&wire14) ?
                      (reg20 * wire1) : {reg15}) ^ (|$unsigned(reg26)))));
  assign wire28 = {{$signed((wire14[(2'h3):(2'h3)] ?
                              ((8'ha5) * reg9) : (reg15 != wire27)))}};
  assign wire29 = $signed(reg25);
  assign wire30 = ($unsigned((((^(8'h9f)) - (reg23 ?
                      reg12 : reg21)) > (((8'hb7) >= reg22) ?
                      (wire4 ? wire13 : reg11) : (^~reg15)))) ^~ reg20);
  assign wire31 = (wire13 ?
                      {(^$unsigned($unsigned(reg10))),
                          (reg8[(4'hb):(4'ha)] >>> reg26[(3'h5):(3'h4)])} : {$signed(($unsigned(reg15) ?
                              (reg20 ? reg10 : reg16) : (wire29 ?
                                  wire5 : wire0)))});
  assign wire32 = ((|$unsigned(($unsigned(reg26) ~^ (~^reg21)))) & wire14);
  assign wire33 = $unsigned((^~reg23));
  always
    @(posedge clk) begin
      reg34 <= $signed($unsigned(wire5[(3'h6):(3'h5)]));
      reg35 <= $signed((($signed(((7'h42) ? reg22 : reg22)) ?
              $signed($signed(wire1)) : (wire13 << (reg23 ?
                  (8'haa) : (8'ha0)))) ?
          wire1 : $unsigned($unsigned(wire4))));
      reg36 <= $signed(((~^((reg16 ? reg35 : reg34) <= reg17[(4'hc):(1'h0)])) ?
          $unsigned(reg23) : wire14[(1'h1):(1'h0)]));
      if ({$signed($signed(($unsigned(wire28) >= (~(8'hbc)))))})
        begin
          reg37 <= (reg8[(1'h0):(1'h0)] ?
              $signed(reg23) : (~((reg23[(5'h12):(3'h4)] ^ (8'haa)) ?
                  (8'h9d) : $unsigned((wire2 > wire0)))));
          if ($unsigned($signed(($signed(((8'haa) == wire2)) ?
              $signed(((7'h40) ~^ reg11)) : (!{(8'hb0)})))))
            begin
              reg38 <= reg25[(4'hb):(3'h6)];
              reg39 <= (|wire31);
              reg40 <= wire2;
              reg41 <= $unsigned($unsigned(((!(!reg10)) ?
                  $unsigned(reg16) : ({reg8, wire3} ?
                      ((8'hae) ^ reg22) : wire14))));
            end
          else
            begin
              reg38 <= {wire33[(2'h3):(2'h2)],
                  $unsigned($unsigned($unsigned($unsigned(wire3))))};
              reg39 <= (-$unsigned(wire30));
              reg40 <= {reg21,
                  (($signed((wire1 << wire30)) - reg22[(2'h2):(2'h2)]) ?
                      (^(+(reg11 == reg17))) : reg41[(4'ha):(4'h9)])};
            end
        end
      else
        begin
          reg37 <= wire29;
          reg38 <= {$signed((((reg19 << reg18) ~^ (&reg9)) ^ ((reg24 ?
                  reg24 : reg40) <= wire3[(3'h6):(3'h4)])))};
          reg39 <= $signed((-$unsigned(($signed(reg15) ? {reg23} : reg21))));
          reg40 <= (reg41[(3'h6):(3'h6)] ?
              {((|reg17) ^~ reg26[(3'h5):(2'h2)]),
                  wire29} : ((^~wire13[(4'ha):(3'h6)]) && wire31));
          reg41 <= wire14;
        end
    end
  assign wire42 = $unsigned(reg40);
  assign wire43 = (^{wire2});
  assign wire44 = $signed((|((wire13 <= ((8'hbf) ? reg20 : wire27)) ?
                      (~^$unsigned(wire2)) : ($unsigned(reg21) ?
                          reg11[(4'he):(3'h5)] : wire13))));
  module45 #() modinst207 (.y(wire206), .wire47(reg38), .wire48(reg20), .clk(clk), .wire49(reg15), .wire46(wire7));
  always
    @(posedge clk) begin
      reg208 <= (~|reg24);
    end
endmodule

module module45
#(parameter param204 = ((({(^(8'ha5))} ? (((8'hb1) ? (8'hba) : (8'ha5)) << (+(7'h42))) : (~&((8'hb4) ? (8'hb4) : (8'ha0)))) - {(((8'hbd) ? (8'ha2) : (8'ha4)) ? ((7'h40) ? (8'h9c) : (8'hb0)) : ((8'haa) ? (8'hac) : (8'ha9))), {{(8'h9e), (7'h42)}}}) ? ((^(((8'hbd) ? (8'ha9) : (8'hab)) ~^ ((8'ha6) ? (8'ha0) : (8'ha6)))) ? ((((8'hb6) ? (8'ha5) : (7'h40)) ? ((8'hb1) >> (8'ha5)) : (^(8'haf))) <= ((8'had) >= ((8'ha3) ? (7'h41) : (8'h9c)))) : ((8'hbe) * (-{(8'hbd), (8'hbd)}))) : {{((-(8'h9f)) ? ((8'h9f) ? (8'h9d) : (8'hb0)) : ((8'ha2) ~^ (8'ha9)))}, ((((8'hb8) ? (8'ha2) : (8'hb6)) < ((8'h9f) ? (8'hb6) : (8'ha0))) ? (((8'h9e) * (7'h44)) ? ((8'hbd) && (8'hac)) : ((8'ha1) << (8'ha2))) : (((8'hac) || (7'h44)) == {(8'hbd)}))}), 
parameter param205 = (~((~^(|(param204 <<< (7'h44)))) ? param204 : (~^((~(8'h9e)) ? ((8'ha4) ? param204 : param204) : param204)))))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire49;
  input wire signed [(5'h15):(1'h0)] wire48;
  input wire signed [(4'h9):(1'h0)] wire47;
  input wire [(3'h6):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire203;
  wire [(4'h8):(1'h0)] wire202;
  wire signed [(4'h9):(1'h0)] wire201;
  wire signed [(5'h12):(1'h0)] wire200;
  wire signed [(3'h4):(1'h0)] wire199;
  wire signed [(5'h11):(1'h0)] wire197;
  wire signed [(4'hc):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire197,
                 wire128,
                 wire85,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire50 = (~&((8'hbc) != (wire49 ?
                      wire46[(2'h3):(2'h2)] : ((~|(8'hb4)) ?
                          $unsigned(wire48) : $unsigned(wire48)))));
  assign wire51 = $signed((!wire48));
  assign wire52 = (^~(^~(wire47[(3'h5):(1'h0)] - (~^$signed(wire49)))));
  assign wire53 = (8'hbd);
  assign wire54 = ((wire50[(4'hb):(4'h9)] ?
                          ({(~|wire48)} <<< $signed($signed(wire51))) : ((wire53[(4'h9):(2'h2)] <= (wire46 ?
                                  wire49 : wire49)) ?
                              ((wire48 ? wire47 : wire52) ?
                                  $signed((8'ha3)) : {(8'ha3)}) : ((+wire48) < wire46[(2'h2):(1'h1)]))) ?
                      (~|{(~|wire50), (8'ha4)}) : wire50[(5'h10):(3'h7)]);
  assign wire55 = $unsigned(wire47);
  assign wire56 = (wire53[(1'h1):(1'h0)] < (~$unsigned(($unsigned(wire51) ~^ (8'hae)))));
  assign wire57 = (+{(~&{((8'hb2) ? wire46 : wire55), (8'hb0)}),
                      wire56[(2'h2):(1'h0)]});
  assign wire58 = (~&wire53);
  assign wire59 = wire50;
  assign wire60 = (((|$unsigned(wire57[(4'hd):(3'h5)])) > wire58[(1'h1):(1'h0)]) >= (8'hbe));
  always
    @(posedge clk) begin
      reg61 <= (8'hbf);
      reg62 <= ({$signed($unsigned($signed((8'hbe)))), (8'hbf)} ?
          {($signed(wire53) ?
                  wire56[(2'h2):(1'h1)] : ($unsigned(wire58) ?
                      wire52 : (wire59 << wire57)))} : {wire56});
      reg63 <= wire55[(3'h5):(2'h3)];
      reg64 <= ({$signed($unsigned((^wire59)))} ?
          $unsigned({((reg62 ? wire58 : wire52) * {wire47, reg63}),
              (~|(|(8'ha1)))}) : wire56);
    end
  always
    @(posedge clk) begin
      if (($signed($unsigned((wire56 ?
          {wire56, reg63} : $unsigned(wire54)))) ^ (7'h43)))
        begin
          reg65 <= ($signed((~^$signed((wire54 ? wire52 : reg62)))) & (8'ha9));
        end
      else
        begin
          reg65 <= wire48;
          reg66 <= wire52;
        end
      reg67 <= (~^($signed($unsigned(wire58[(3'h4):(1'h1)])) != (+$signed($signed(wire51)))));
    end
  module68 #() modinst86 (wire85, clk, reg62, wire48, wire53, reg61);
  module87 #() modinst129 (.wire90(reg67), .y(wire128), .wire91(wire57), .clk(clk), .wire92(wire50), .wire88(wire52), .wire89(wire85));
  module130 #() modinst198 (wire197, clk, wire49, wire57, wire54, reg66, wire47);
  assign wire199 = wire48[(5'h11):(4'hc)];
  assign wire200 = reg62;
  assign wire201 = $unsigned(($signed((wire55[(4'he):(2'h3)] ?
                           {wire57} : reg64)) ?
                       wire57 : $unsigned((wire85 ?
                           $unsigned((8'ha7)) : (~^wire53)))));
  assign wire202 = {$signed($signed(wire201))};
  assign wire203 = $unsigned({$unsigned((8'hb1))});
endmodule

module module130
#(parameter param196 = (!(&({((8'hae) ? (8'h9d) : (7'h43))} >> (8'hbd)))))
(y, clk, wire135, wire134, wire133, wire132, wire131);
  output wire [(32'h2c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire135;
  input wire signed [(5'h14):(1'h0)] wire134;
  input wire signed [(4'h8):(1'h0)] wire133;
  input wire signed [(5'h14):(1'h0)] wire132;
  input wire signed [(4'h9):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire195;
  wire signed [(5'h10):(1'h0)] wire194;
  wire signed [(4'h9):(1'h0)] wire193;
  wire [(5'h13):(1'h0)] wire192;
  wire signed [(4'h9):(1'h0)] wire191;
  wire [(2'h3):(1'h0)] wire181;
  wire [(5'h10):(1'h0)] wire180;
  wire [(4'hd):(1'h0)] wire179;
  wire [(3'h6):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire138;
  wire signed [(5'h12):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire136;
  reg [(5'h13):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg187 = (1'h0);
  reg signed [(4'he):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg [(4'h8):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(3'h6):(1'h0)] reg175 = (1'h0);
  reg [(4'h8):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(2'h3):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg171 = (1'h0);
  reg [(4'ha):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg166 = (1'h0);
  reg [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg158 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire181,
                 wire180,
                 wire179,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
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
                 (1'h0)};
  assign wire136 = $signed(wire134[(1'h1):(1'h1)]);
  assign wire137 = (~^$unsigned(wire134));
  assign wire138 = wire135[(4'h9):(2'h2)];
  assign wire139 = (!{wire137[(4'hd):(4'h8)], (~&(+(-(8'hac))))});
  assign wire140 = $signed(((wire136 ?
                       $signed((8'hb0)) : wire133) + (^(~^$unsigned(wire132)))));
  always
    @(posedge clk) begin
      if ((!wire139[(3'h4):(2'h3)]))
        begin
          reg141 <= $signed($signed($signed(((&wire138) ?
              (wire139 ? wire140 : wire133) : wire132))));
        end
      else
        begin
          if ({{({wire135[(2'h2):(2'h2)], wire132} ?
                      (~^$signed((8'h9f))) : ((8'hb6) ~^ ((8'hb6) ?
                          wire139 : wire139))),
                  ($unsigned((^~wire139)) ?
                      $unsigned((wire136 | wire135)) : {(wire133 > wire138),
                          $unsigned(wire138)})},
              $unsigned(wire132)})
            begin
              reg141 <= wire131[(4'h9):(3'h4)];
              reg142 <= ($signed((~$signed({wire131}))) + $unsigned($unsigned((((7'h42) ?
                      wire136 : wire138) ?
                  (wire132 ^~ wire135) : $signed(reg141)))));
              reg143 <= (((8'hbf) >>> wire136) ? $unsigned(wire131) : (8'haf));
              reg144 <= $unsigned($unsigned((~^wire137)));
            end
          else
            begin
              reg141 <= $signed(reg141[(4'ha):(4'ha)]);
            end
          reg145 <= wire140[(3'h6):(3'h5)];
          reg146 <= wire137;
          reg147 <= reg141[(4'ha):(4'h9)];
        end
      reg148 <= ($unsigned((~&wire132[(4'h9):(2'h3)])) != (^~$unsigned(((8'ha5) ?
          $signed(wire136) : (reg145 != wire137)))));
      if (wire136)
        begin
          if ((wire137[(3'h7):(2'h3)] ?
              reg144[(4'h8):(2'h3)] : {(!((wire138 ?
                      reg146 : wire135) && (~|reg142))),
                  $unsigned(wire139)}))
            begin
              reg149 <= ($signed(($unsigned({reg144,
                      reg145}) ~^ ($unsigned(reg143) ?
                      wire136[(3'h4):(1'h1)] : (wire140 < reg146)))) ?
                  $signed((($unsigned(wire133) & (8'h9d)) <= ((reg143 ?
                          (8'ha7) : wire136) ?
                      $unsigned(wire132) : (wire137 && wire140)))) : ((wire136[(4'ha):(1'h0)] + (8'hbd)) > $signed($signed($unsigned(reg144)))));
              reg150 <= $unsigned($signed({$signed({wire133})}));
              reg151 <= (reg147 ? wire132 : reg146);
            end
          else
            begin
              reg149 <= ((|$unsigned(reg141[(2'h3):(1'h0)])) ^~ wire132[(4'hc):(3'h7)]);
              reg150 <= ($signed((!((&(8'hb9)) != {reg151,
                  reg150}))) - $unsigned($unsigned(((!wire135) ~^ $unsigned(wire135)))));
              reg151 <= {wire135[(4'h9):(1'h1)]};
              reg152 <= {(($signed(wire134[(4'h8):(2'h2)]) || {$unsigned(reg144),
                          {wire135}}) ?
                      $unsigned(((wire135 <= reg145) << (reg147 ?
                          wire136 : wire133))) : ({$signed(wire131)} || {(reg142 ?
                              reg151 : reg145),
                          $unsigned(wire135)})),
                  ($unsigned((!$signed(wire140))) >>> wire131[(1'h1):(1'h0)])};
            end
          reg153 <= $signed($signed(($unsigned($unsigned(wire136)) ?
              $signed({reg145, reg147}) : $unsigned(wire132[(4'he):(4'ha)]))));
          reg154 <= wire135;
        end
      else
        begin
          reg149 <= $signed($signed($signed((wire138 ?
              (reg150 || reg151) : reg141))));
          if (wire132[(4'h8):(2'h3)])
            begin
              reg150 <= $unsigned(($signed(reg144[(3'h4):(2'h3)]) >= (8'ha7)));
            end
          else
            begin
              reg150 <= $unsigned((wire132 ^~ $unsigned(reg141[(2'h3):(2'h2)])));
              reg151 <= ($signed($signed($unsigned((reg144 << (8'hbb))))) != {{$unsigned($unsigned(reg141)),
                      reg150},
                  ($signed({wire135, wire137}) && $unsigned((reg149 ?
                      reg145 : (8'ha2))))});
              reg152 <= reg153;
            end
          if ((8'hb2))
            begin
              reg153 <= (8'hbf);
            end
          else
            begin
              reg153 <= $signed(wire140[(1'h0):(1'h0)]);
              reg154 <= $signed(($signed({(reg143 >>> reg144)}) ?
                  {$unsigned($signed(reg149))} : ((!(8'ha1)) ?
                      reg153 : reg153[(1'h1):(1'h1)])));
              reg155 <= (&$signed((+($unsigned(reg153) ?
                  (~^reg153) : $unsigned(reg146)))));
              reg156 <= wire131;
              reg157 <= (reg145[(4'hb):(4'h9)] > reg154[(1'h0):(1'h0)]);
            end
          if ((reg146 ?
              reg156[(4'hc):(4'hb)] : ($unsigned($unsigned((reg153 && (8'h9e)))) ?
                  ($signed({wire137}) | ($unsigned(wire134) || wire140[(2'h2):(1'h0)])) : $signed($signed((reg142 || wire138))))))
            begin
              reg158 <= (8'ha8);
              reg159 <= reg141[(1'h0):(1'h0)];
              reg160 <= (8'hb7);
              reg161 <= {$signed(((|$signed(reg158)) ?
                      reg146 : (reg150 >> (^reg144)))),
                  (($signed(reg155[(4'ha):(1'h0)]) ?
                      (reg145 ?
                          {reg160, reg153} : (wire140 ?
                              reg159 : (8'hbe))) : reg159[(4'he):(2'h3)]) ^ (((reg144 ?
                      wire131 : reg157) | (8'ha1)) << reg146[(3'h4):(3'h4)]))};
              reg162 <= ((((~&(~&reg150)) ?
                          ((8'hac) ?
                              $signed(wire132) : {reg147,
                                  reg141}) : $signed(reg161)) ?
                      wire135 : (wire132 & ($signed(reg147) ?
                          (~^reg148) : (|reg155)))) ?
                  (~reg153) : reg149);
            end
          else
            begin
              reg158 <= $signed(reg157[(1'h0):(1'h0)]);
              reg159 <= (~^$signed({$unsigned((reg150 >>> (8'hb3)))}));
            end
        end
      reg163 <= $unsigned(({{((8'hb0) ? wire132 : reg160), (-reg146)},
              (|reg155)} ?
          reg143[(1'h1):(1'h0)] : $signed(reg150[(2'h3):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg164 <= (((~^wire136[(4'hc):(4'h8)]) ?
          {$unsigned(reg158)} : ((reg160[(4'hb):(4'h8)] | {(8'hb9),
              reg150}) ~^ $signed((reg160 * (8'hae))))) <= $unsigned((~wire138[(3'h6):(1'h1)])));
      reg165 <= $unsigned($unsigned(((wire140 ?
          {reg163, reg147} : $unsigned(wire133)) >>> (wire131 ?
          reg158[(3'h4):(2'h3)] : reg151))));
      reg166 <= wire140;
      if ($signed(reg165))
        begin
          if ((8'h9c))
            begin
              reg167 <= (-$signed((8'h9d)));
              reg168 <= $signed($unsigned(reg152));
              reg169 <= ({(^~(^~$unsigned(wire137)))} ?
                  (8'hab) : wire140[(2'h2):(1'h0)]);
              reg170 <= (^~$unsigned((^~$signed((reg157 & wire135)))));
            end
          else
            begin
              reg167 <= (~&((~|$signed($signed(reg168))) ?
                  (^((reg148 + reg153) ?
                      {reg147} : (reg166 & wire132))) : reg157[(4'h8):(3'h5)]));
              reg168 <= (-reg145[(1'h0):(1'h0)]);
              reg169 <= (((~&$signed((reg156 * reg158))) ?
                      (($signed(reg152) ?
                          $unsigned(reg149) : {wire134}) ^~ reg159[(4'ha):(4'ha)]) : $signed(($signed(wire136) | $unsigned(wire133)))) ?
                  reg168[(1'h0):(1'h0)] : $signed($signed(reg162[(5'h14):(4'h9)])));
              reg170 <= ((((!(~&reg152)) || (-((8'ha4) | reg146))) || wire140[(2'h3):(2'h2)]) <= $signed(reg165));
              reg171 <= $unsigned($signed($signed(reg141)));
            end
          reg172 <= (~&(^~$signed((~&$signed(reg166)))));
          reg173 <= $signed((($signed((reg148 ? reg160 : reg152)) ?
                  reg157 : $signed({reg141})) ?
              wire138[(4'h8):(4'h8)] : reg141));
          if (wire138)
            begin
              reg174 <= (reg157 ? reg141 : reg164);
              reg175 <= $unsigned(reg153[(4'h8):(1'h0)]);
              reg176 <= $unsigned((8'hbc));
              reg177 <= (~^reg145);
            end
          else
            begin
              reg174 <= (!(((^~wire134) >= (8'ha1)) || reg172));
              reg175 <= $signed($signed((&$signed({reg160}))));
              reg176 <= (|(&(&((reg175 - reg153) ~^ $unsigned(reg146)))));
              reg177 <= (reg143 | $signed(wire138[(3'h5):(2'h2)]));
            end
        end
      else
        begin
          if ((~((reg170 - (8'hb9)) ?
              (~&(|$signed(reg175))) : wire137[(2'h2):(1'h0)])))
            begin
              reg167 <= (!reg175);
              reg168 <= (~$unsigned(reg153[(3'h4):(1'h0)]));
            end
          else
            begin
              reg167 <= {$unsigned({$signed(reg157[(3'h7):(2'h2)])})};
            end
        end
      reg178 <= ($unsigned({reg160[(3'h6):(1'h0)],
          ({(8'ha4)} >= reg142[(1'h1):(1'h1)])}) != (~^(~|(^(wire139 ?
          (8'hb0) : reg159)))));
    end
  assign wire179 = reg171;
  assign wire180 = (-(&$unsigned(reg151[(4'hb):(4'ha)])));
  assign wire181 = $signed(({$unsigned((!wire131)),
                           $unsigned((reg161 ? reg165 : wire132))} ?
                       $signed((8'hbc)) : reg141));
  always
    @(posedge clk) begin
      if ($signed((((reg172[(2'h2):(2'h2)] ?
          (8'hb7) : reg144[(1'h1):(1'h0)]) == reg155) ^ reg148[(3'h4):(2'h2)])))
        begin
          reg182 <= reg154[(2'h2):(2'h2)];
          reg183 <= reg163;
          reg184 <= reg148;
        end
      else
        begin
          if (((~&($unsigned(reg163) ?
                  $unsigned(reg145[(1'h0):(1'h0)]) : $signed($unsigned(reg178)))) ?
              reg161[(2'h3):(2'h3)] : $unsigned((reg151[(4'ha):(1'h1)] ?
                  (reg159 ? $unsigned(reg168) : (^~(8'hb0))) : reg151))))
            begin
              reg182 <= $unsigned({{{$signed(wire131), reg184},
                      $signed(reg164[(4'ha):(3'h7)])},
                  ((!$unsigned(wire132)) >> reg178)});
              reg183 <= $unsigned($signed((($signed((8'ha1)) < $unsigned(reg143)) > $unsigned((wire133 ^ wire134)))));
            end
          else
            begin
              reg182 <= reg177;
              reg183 <= (~|$signed((wire180[(4'h8):(2'h2)] ?
                  ((~(8'hab)) ?
                      $unsigned(reg174) : reg158) : reg147[(2'h3):(2'h2)])));
            end
          if (($signed((~^$signed($signed(reg168)))) ?
              $unsigned(reg157[(4'h9):(2'h3)]) : $signed($unsigned(reg145))))
            begin
              reg184 <= reg159;
              reg185 <= (~wire134);
              reg186 <= reg184;
            end
          else
            begin
              reg184 <= (|((reg150[(2'h2):(2'h2)] ?
                  reg151 : (+(8'ha5))) < {$unsigned((-reg167))}));
              reg185 <= $signed((~&$signed(((reg146 ?
                  reg156 : wire139) << $unsigned((8'hbf))))));
              reg186 <= $signed(reg142[(1'h0):(1'h0)]);
              reg187 <= (((!$unsigned((reg169 ? reg162 : reg151))) ?
                      (~^$signed(wire135[(2'h3):(2'h3)])) : $unsigned({{reg149},
                          (wire140 & wire138)})) ?
                  $unsigned((^~($signed(reg184) ?
                      (|reg165) : $signed(reg177)))) : ((^reg142) ?
                      wire137[(4'hf):(3'h6)] : $unsigned($unsigned(reg185))));
            end
        end
      reg188 <= (((~$unsigned({reg170})) ?
              {($signed(reg145) | ((8'ha4) << reg153)),
                  (~$unsigned(wire139))} : wire134) ?
          {reg175} : {reg175[(2'h2):(1'h1)]});
      reg189 <= $signed((-(|{{wire139}, $signed((8'h9c))})));
      reg190 <= $unsigned($signed({reg177[(4'h9):(3'h7)]}));
    end
  assign wire191 = ((~&reg189) < ($signed((wire136 ?
                       {reg154,
                           reg154} : $unsigned(wire140))) ^ (^$unsigned($signed(reg166)))));
  assign wire192 = {$signed(reg189[(1'h1):(1'h0)]),
                       $signed($unsigned(($signed(reg146) ?
                           (reg155 ? wire131 : (8'ha1)) : (^~wire139))))};
  assign wire193 = reg144[(3'h4):(1'h0)];
  assign wire194 = $unsigned(reg156);
  assign wire195 = ((({(~|(8'h9c)),
                       $signed((8'ha8))} & reg174[(3'h4):(2'h3)]) << $signed($signed(reg168))) << $unsigned(($unsigned($unsigned(wire181)) ?
                       $signed((^wire191)) : (~reg164))));
endmodule

module module87
#(parameter param127 = (((&(!(~&(8'hba)))) ? (+(((8'ha9) ? (8'hb4) : (8'hbe)) ? (^(7'h42)) : {(8'ha9), (7'h43)})) : (|(!((8'hbc) ? (8'hbf) : (8'hb4))))) + (~|((((8'hb9) ? (8'hb3) : (8'h9c)) ? ((8'h9f) ? (8'hbc) : (8'hba)) : ((8'h9c) ? (8'hbd) : (8'hb7))) ? (((8'haa) ? (7'h44) : (8'hb6)) ? ((8'ha4) ^ (8'ha6)) : (8'ha5)) : {((8'hb0) ? (8'ha5) : (7'h44)), ((8'ha0) ? (8'ha0) : (8'h9c))}))))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire92;
  input wire signed [(4'hb):(1'h0)] wire91;
  input wire signed [(2'h2):(1'h0)] wire90;
  input wire [(5'h13):(1'h0)] wire89;
  input wire [(4'h9):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire93;
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire93,
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
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire93 = ((8'h9f) ?
                      (($signed($unsigned(wire88)) ?
                          ($signed(wire91) ~^ (wire92 >= wire92)) : {(wire90 || wire88),
                              wire92[(1'h0):(1'h0)]}) | $signed(wire90[(1'h0):(1'h0)])) : wire91);
  always
    @(posedge clk) begin
      reg94 <= {wire92, wire89};
    end
  always
    @(posedge clk) begin
      if ((wire93[(1'h0):(1'h0)] ? (~^wire92[(3'h7):(3'h6)]) : wire89))
        begin
          if (wire89)
            begin
              reg95 <= (wire88 ?
                  $signed($unsigned(((8'hb9) ?
                      $unsigned(wire91) : (~&wire90)))) : ({wire93[(1'h0):(1'h0)]} < $signed($unsigned(wire91))));
            end
          else
            begin
              reg95 <= (wire92[(2'h3):(1'h1)] == ($unsigned($signed((wire89 & wire91))) ?
                  ({{wire89, wire89}} ?
                      (reg95 + $unsigned(reg94)) : ((wire89 ?
                          wire88 : wire91) ^~ $unsigned(wire92))) : $unsigned($unsigned((wire93 ?
                      wire93 : reg94)))));
              reg96 <= (($unsigned($unsigned((wire91 ? wire89 : wire88))) ?
                  (^~(wire88 ?
                      {reg95,
                          wire92} : (8'ha9))) : reg94) >= reg95[(4'hc):(4'ha)]);
              reg97 <= $unsigned($signed($signed((wire93[(1'h1):(1'h0)] ?
                  (8'h9d) : wire91))));
            end
          reg98 <= (reg94 ?
              (wire90 ?
                  (^~wire90) : reg97[(2'h2):(2'h2)]) : reg94[(3'h4):(3'h4)]);
          reg99 <= (($signed({(wire88 ? wire93 : wire91)}) ?
              reg94 : $unsigned($unsigned((wire90 && reg96)))) - $signed($unsigned(((!(7'h40)) >= reg96[(2'h3):(1'h1)]))));
          if ((~^($signed((~{(8'hbd), reg96})) ?
              $unsigned($unsigned(wire93)) : wire93)))
            begin
              reg100 <= ((|(^~$unsigned($signed(wire89)))) ?
                  ((reg99 ?
                      $unsigned((reg97 ? wire93 : (7'h44))) : ($signed(reg96) ?
                          $signed(wire91) : (^wire89))) - $signed($unsigned((~|(8'hbf))))) : reg94);
              reg101 <= reg100;
              reg102 <= wire88;
            end
          else
            begin
              reg100 <= ($unsigned(reg98) ^ (($signed({reg98}) | (8'h9e)) <<< wire88));
              reg101 <= (|$signed((-reg98[(4'hc):(1'h0)])));
              reg102 <= {(~|(^$unsigned({(8'h9e), reg101})))};
              reg103 <= (~&$signed($signed(wire90)));
              reg104 <= {$signed($unsigned({reg95[(4'h8):(2'h3)],
                      $signed((8'hba))}))};
            end
        end
      else
        begin
          reg95 <= (reg97 >> $signed(reg96[(3'h4):(3'h4)]));
          if ($signed($unsigned($unsigned((-wire92[(3'h7):(3'h7)])))))
            begin
              reg96 <= (8'hba);
            end
          else
            begin
              reg96 <= (8'hb1);
              reg97 <= $signed(wire91);
              reg98 <= (wire89[(4'h9):(3'h7)] - (~($unsigned((reg103 ?
                      wire90 : reg102)) ?
                  wire90 : ($unsigned(reg97) ? reg94 : $unsigned(wire88)))));
            end
          reg99 <= $unsigned($signed($unsigned($unsigned({reg104, wire92}))));
        end
    end
  always
    @(posedge clk) begin
      if ($signed(({(~^(wire90 ? wire91 : reg98))} ?
          wire91[(4'h9):(3'h6)] : ($unsigned($unsigned(reg101)) + $unsigned((!reg96))))))
        begin
          reg105 <= reg103[(4'hc):(1'h0)];
        end
      else
        begin
          reg105 <= {$signed($signed(wire93))};
          if (reg94)
            begin
              reg106 <= ($unsigned(reg98[(4'h8):(2'h2)]) <<< $signed((wire90 ?
                  ($signed(reg95) + ((8'h9e) ?
                      (8'hbf) : wire88)) : $unsigned(reg97[(3'h4):(1'h1)]))));
              reg107 <= (wire90[(1'h0):(1'h0)] >>> (~&$unsigned(($unsigned(wire90) == $unsigned(reg101)))));
            end
          else
            begin
              reg106 <= (~(+(+(&reg101))));
              reg107 <= (^$signed(({(!reg103), $unsigned(reg107)} < reg104)));
              reg108 <= $signed($unsigned(wire90[(1'h1):(1'h0)]));
            end
          reg109 <= {(8'hab)};
          reg110 <= $signed(wire92[(2'h2):(1'h1)]);
          if ($signed(((~^wire92) * reg110[(1'h1):(1'h0)])))
            begin
              reg111 <= $unsigned({(-reg110), (^~{$signed(reg98), reg103})});
              reg112 <= ({$signed($signed({reg102, wire90})),
                      reg106[(1'h0):(1'h0)]} ?
                  (((reg104[(1'h0):(1'h0)] != (~|(7'h44))) & ({reg104,
                          reg108} ~^ $unsigned((8'ha8)))) ?
                      reg106[(3'h7):(2'h3)] : $unsigned(((~^reg99) == $signed(wire88)))) : ($unsigned(wire90) > wire91[(4'h8):(3'h5)]));
              reg113 <= {reg104[(3'h4):(1'h1)]};
              reg114 <= (((reg95 ?
                      (^~$signed(reg98)) : $signed((reg103 ?
                          reg95 : reg109))) - (!$signed((reg105 == reg98)))) ?
                  $unsigned($signed({$signed(reg107),
                      (~^reg98)})) : ((reg105 | {$unsigned(reg97)}) == wire91));
            end
          else
            begin
              reg111 <= $unsigned((~$signed(reg110)));
            end
        end
      reg115 <= $signed(reg102);
    end
  assign wire116 = (($unsigned((reg105 ?
                       reg106 : (~^reg101))) & ($signed(reg103) || $unsigned((reg95 ?
                       (8'hbe) : (8'hb1))))) < ($unsigned(wire93[(2'h2):(1'h1)]) ?
                       $signed({$signed(reg99),
                           (wire88 ? reg107 : reg111)}) : $unsigned((wire93 ?
                           $signed(reg99) : wire90))));
  assign wire117 = $signed($signed((^((reg101 && reg114) ?
                       reg114[(1'h1):(1'h1)] : $signed(reg111)))));
  assign wire118 = $unsigned($signed(($unsigned($unsigned(reg98)) ?
                       (wire116 ?
                           (reg96 ?
                               (8'hb7) : wire91) : $unsigned(reg115)) : (&(~|wire117)))));
  assign wire119 = reg98;
  assign wire120 = (|$signed($unsigned($unsigned($signed(wire118)))));
  assign wire121 = {($unsigned(($signed(reg97) || $unsigned(wire89))) ?
                           ((8'ha5) != (~&(~|(8'hb4)))) : wire90),
                       (!reg95)};
  assign wire122 = reg94[(1'h0):(1'h0)];
  assign wire123 = reg109[(4'hd):(4'hb)];
  assign wire124 = reg110[(3'h4):(3'h4)];
  assign wire125 = ({$unsigned((wire91[(3'h5):(1'h0)] ?
                               {reg110, wire116} : ((8'h9c) ?
                                   wire118 : reg96)))} ?
                       (~($unsigned(reg109) ?
                           ((~|wire119) ~^ (wire88 | wire117)) : ((~reg106) > $unsigned(wire124)))) : reg94[(2'h2):(1'h0)]);
  assign wire126 = wire120[(1'h0):(1'h0)];
endmodule

module module68
#(parameter param83 = (!(8'ha8)), 
parameter param84 = (((((-param83) & (param83 ? param83 : param83)) ^~ param83) ? (+((^~param83) ? (param83 ? param83 : param83) : (~^param83))) : (&(^~(+param83)))) ~^ param83))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire72;
  input wire [(5'h14):(1'h0)] wire71;
  input wire signed [(4'h8):(1'h0)] wire70;
  input wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 (1'h0)};
  assign wire73 = ((wire70[(3'h6):(1'h0)] - $unsigned(({wire69,
                          wire70} & wire71[(4'hd):(4'h9)]))) ?
                      $signed({(wire72 & wire69)}) : $unsigned((wire70 ?
                          $unsigned({(8'hae)}) : wire71)));
  assign wire74 = ((~^$signed(((wire72 ?
                      wire73 : (8'hac)) >> (wire71 >= wire69)))) > ($unsigned(wire69[(4'h8):(3'h7)]) ?
                      wire70 : ((~^wire71[(4'he):(3'h5)]) > wire71)));
  assign wire75 = wire71[(2'h2):(1'h0)];
  assign wire76 = wire72[(2'h3):(2'h3)];
  assign wire77 = $signed($unsigned($signed(($signed(wire75) - wire72[(3'h7):(3'h5)]))));
  assign wire78 = ({wire76[(4'hb):(2'h2)]} - $unsigned($signed($signed({wire77,
                      wire69}))));
  assign wire79 = $unsigned((&((~|((8'hab) & wire76)) >= (-(wire77 << wire76)))));
  assign wire80 = {$signed($signed(((~&wire73) ? {wire74} : $signed(wire70))))};
  assign wire81 = {wire80};
  assign wire82 = ($unsigned(wire71) || (-$signed(((wire80 << wire70) ?
                      $unsigned(wire71) : (wire76 ? wire77 : wire74)))));
endmodule
