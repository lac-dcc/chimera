module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire213;
  wire [(4'hf):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire211;
  wire signed [(4'hb):(1'h0)] wire210;
  wire signed [(3'h4):(1'h0)] wire209;
  wire signed [(4'hb):(1'h0)] wire208;
  wire [(3'h7):(1'h0)] wire207;
  wire signed [(4'hd):(1'h0)] wire206;
  wire [(3'h4):(1'h0)] wire202;
  wire signed [(4'hb):(1'h0)] wire201;
  wire signed [(4'h9):(1'h0)] wire183;
  wire signed [(3'h5):(1'h0)] wire181;
  wire signed [(5'h14):(1'h0)] wire193;
  wire [(4'hf):(1'h0)] wire194;
  wire [(4'hb):(1'h0)] wire195;
  wire signed [(5'h14):(1'h0)] wire196;
  wire [(2'h2):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire198;
  wire [(4'he):(1'h0)] wire199;
  reg [(5'h11):(1'h0)] reg220 = (1'h0);
  reg [(5'h10):(1'h0)] reg219 = (1'h0);
  reg [(2'h3):(1'h0)] reg218 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg215 = (1'h0);
  reg [(4'h9):(1'h0)] reg214 = (1'h0);
  reg signed [(4'he):(1'h0)] reg205 = (1'h0);
  reg [(2'h2):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg [(4'hb):(1'h0)] reg190 = (1'h0);
  reg [(5'h11):(1'h0)] reg189 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg188 = (1'h0);
  reg [(5'h10):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire202,
                 wire201,
                 wire183,
                 wire181,
                 wire193,
                 wire194,
                 wire195,
                 wire196,
                 wire197,
                 wire198,
                 wire199,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg205,
                 reg204,
                 reg203,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 (1'h0)};
  module4 #() modinst182 (wire181, clk, wire1, wire3, wire2, wire0);
  module82 #() modinst184 (.clk(clk), .wire87(wire0), .wire83(wire1), .wire86(wire181), .wire84(wire2), .wire85(wire3), .y(wire183));
  always
    @(posedge clk) begin
      reg185 <= wire2;
      reg186 <= $signed(wire181[(2'h2):(1'h0)]);
      reg187 <= $unsigned(wire183);
      reg188 <= wire3[(2'h2):(2'h2)];
      if (wire3)
        begin
          reg189 <= $signed(($unsigned(wire2[(2'h2):(1'h0)]) ?
              $signed(((wire183 == wire0) - $signed(reg187))) : reg186[(3'h4):(3'h4)]));
          reg190 <= (^~wire1);
          reg191 <= $unsigned((~|(+wire1)));
          reg192 <= ((+$unsigned(reg186)) ? wire3 : reg186);
        end
      else
        begin
          reg189 <= (($signed(wire0) ?
                  wire181 : {($signed(wire0) ?
                          $signed(wire0) : $unsigned(wire0)),
                      wire183[(4'h8):(1'h1)]}) ?
              (!reg191) : {(8'had)});
        end
    end
  assign wire193 = wire1;
  assign wire194 = $signed(wire193);
  assign wire195 = reg190[(2'h3):(2'h3)];
  assign wire196 = (~&(~^$unsigned((!$unsigned(reg192)))));
  assign wire197 = reg190[(1'h0):(1'h0)];
  assign wire198 = (|(wire1[(5'h11):(4'hd)] > ($unsigned(reg188[(1'h1):(1'h0)]) || reg190[(3'h6):(1'h1)])));
  module25 #() modinst200 (wire199, clk, reg189, reg186, wire198, reg192, reg187);
  assign wire201 = wire198;
  assign wire202 = $signed((|$signed(wire201)));
  always
    @(posedge clk) begin
      reg203 <= wire201[(3'h6):(3'h6)];
      reg204 <= wire181[(1'h0):(1'h0)];
      reg205 <= reg203;
    end
  assign wire206 = $unsigned(reg203[(3'h4):(2'h2)]);
  assign wire207 = (^~(8'hb2));
  assign wire208 = $signed(reg190);
  assign wire209 = (wire0[(5'h11):(2'h3)] ?
                       $unsigned(reg190[(4'h8):(2'h3)]) : $signed(reg192));
  assign wire210 = wire199;
  assign wire211 = $unsigned(({reg190[(4'hb):(4'hb)], $signed(reg203)} ?
                       reg187 : ($signed($signed(wire181)) ?
                           (wire210[(4'h9):(2'h3)] > {wire194}) : (~^reg204))));
  assign wire212 = ($unsigned(wire207[(1'h0):(1'h0)]) ?
                       ($unsigned((wire1 ?
                           (8'hb8) : $signed(reg189))) >>> reg203) : ((($unsigned(wire194) ^ (wire198 ?
                               reg185 : reg187)) ?
                           wire3[(3'h5):(3'h4)] : ((wire195 ?
                               (8'hac) : wire211) != (|wire195))) ~^ wire198));
  assign wire213 = reg205[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      if (wire1[(3'h5):(1'h0)])
        begin
          reg214 <= (8'h9f);
        end
      else
        begin
          reg214 <= $signed((wire201 >>> (wire1[(4'h8):(2'h3)] ?
              (!$signed(reg205)) : (wire212[(1'h0):(1'h0)] || (&(8'hb8))))));
        end
      reg215 <= reg190;
      reg216 <= $unsigned(wire196[(4'hb):(3'h5)]);
      if ($unsigned((wire183 * {reg205[(3'h4):(1'h0)], $unsigned({reg205})})))
        begin
          reg217 <= ((wire208 <<< (7'h40)) != wire197);
          reg218 <= wire2[(3'h6):(3'h5)];
          reg219 <= reg192;
        end
      else
        begin
          reg217 <= $signed(((^wire198[(2'h3):(1'h0)]) & wire199[(1'h0):(1'h0)]));
          reg218 <= ($unsigned((wire201 ?
                  (reg189 || $unsigned(wire207)) : reg215[(2'h2):(2'h2)])) ?
              ($signed(reg185) ?
                  wire2 : {((~(8'hbe)) << (wire207 ?
                          reg205 : reg185))}) : (|wire181));
          reg219 <= reg188[(2'h3):(2'h2)];
          reg220 <= {wire3[(4'hc):(3'h5)]};
        end
    end
endmodule

module module4
#(parameter param180 = (((((8'hb8) ? ((8'ha7) ? (8'ha2) : (8'hac)) : ((8'hba) && (8'ha5))) ? (((8'h9f) ^~ (8'hbe)) * {(8'ha8), (8'hb1)}) : (~^((7'h42) | (8'hac)))) ? ({{(8'hbc), (8'hb1)}} & (|((8'hac) <= (8'haf)))) : (~|(((7'h44) ? (8'hbf) : (8'ha6)) <<< ((8'hb2) && (8'had))))) ? {((~|(+(8'hb7))) ? (((8'hb4) ? (8'ha5) : (8'h9e)) ? (!(8'h9d)) : (~^(8'hbc))) : ((|(8'ha5)) ? {(8'hab), (8'haa)} : (|(8'hb7)))), ((~((8'h9c) >>> (8'hab))) ? ((~|(8'hb5)) ? ((8'hb6) ? (8'hb3) : (7'h44)) : {(8'ha9)}) : (((8'hbe) ? (8'ha7) : (8'hba)) || ((8'hb7) ^~ (8'hb5))))} : ({(-((8'ha8) == (8'hbb)))} >>> ((((8'hab) > (8'haf)) >= (^~(8'hb2))) != (((8'hab) ? (8'hbc) : (7'h40)) >>> (-(8'ha1)))))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h1eb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire5;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire121;
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  assign y = {wire178,
                 wire125,
                 wire124,
                 wire123,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire39,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire79,
                 wire81,
                 wire121,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= $unsigned(wire6);
      reg10 <= wire6[(3'h6):(3'h4)];
      reg11 <= (^~$unsigned($signed({(wire6 ^ reg9), $signed(wire5)})));
    end
  always
    @(posedge clk) begin
      if (reg9)
        begin
          reg12 <= $signed($signed(reg10[(1'h1):(1'h1)]));
          reg13 <= $signed({(~|(wire7[(2'h3):(2'h2)] + $unsigned(wire5)))});
          reg14 <= wire8;
          reg15 <= ($signed((({reg11} ? $signed(reg11) : (^reg9)) ?
                  $unsigned(reg13[(2'h3):(1'h1)]) : $unsigned((reg11 * reg12)))) ?
              (~|((wire5 > reg13[(3'h6):(3'h4)]) ~^ reg11)) : (~wire6[(1'h1):(1'h0)]));
          reg16 <= $signed($unsigned((reg10[(2'h2):(1'h0)] ?
              ($unsigned(reg11) || reg9) : $unsigned((8'hbd)))));
        end
      else
        begin
          reg12 <= wire8[(4'hf):(3'h4)];
          reg13 <= (reg11[(3'h5):(2'h3)] < reg10);
          if ($unsigned(((({reg13} ?
                  {reg11, wire5} : (-(8'hb8))) ^~ $signed((^(7'h43)))) ?
              {(reg14[(5'h14):(4'hf)] ^~ (reg13 - reg15))} : $unsigned($signed((reg10 ?
                  reg9 : reg12))))))
            begin
              reg14 <= $signed(((wire6[(2'h2):(2'h2)] ?
                  {$unsigned(reg15)} : (~|reg11[(1'h0):(1'h0)])) | reg9));
              reg15 <= (^~wire5);
              reg16 <= (^reg13[(1'h0):(1'h0)]);
              reg17 <= $unsigned(reg11[(4'h9):(2'h3)]);
              reg18 <= $unsigned({wire8, reg17});
            end
          else
            begin
              reg14 <= ($unsigned(($unsigned($signed(reg14)) ?
                  (!{reg17}) : reg10)) <= $unsigned(reg15));
            end
        end
      reg19 <= ($signed((+$unsigned(wire7[(3'h4):(1'h1)]))) ^ wire7);
      reg20 <= $unsigned($unsigned(reg19));
    end
  assign wire21 = $unsigned(((|(8'hb2)) ?
                      $unsigned(wire7[(3'h4):(2'h3)]) : $signed($signed((^~reg12)))));
  assign wire22 = (reg14[(3'h5):(2'h3)] ?
                      {{$unsigned($unsigned(reg14)),
                              ({reg20, reg14} ?
                                  ((8'hbb) ? reg17 : wire5) : (wire7 ?
                                      (8'hb1) : reg9))}} : reg9);
  assign wire23 = $unsigned($signed(reg16[(1'h0):(1'h0)]));
  assign wire24 = wire8;
  module25 #() modinst40 (wire39, clk, wire21, wire7, reg13, reg14, reg16);
  always
    @(posedge clk) begin
      reg41 <= ({$signed(((8'hb0) > {(8'hac), wire8})), wire22} ?
          (~^$unsigned({reg20[(4'h9):(3'h7)],
              wire39[(3'h6):(3'h5)]})) : wire7[(4'h9):(1'h1)]);
      if (wire39)
        begin
          reg42 <= (((^reg20[(4'hb):(4'h9)]) ~^ reg41) && reg41);
          if ($unsigned($signed({($unsigned(wire39) != (wire7 == (8'ha0)))})))
            begin
              reg43 <= (~^(((^wire7) >>> (wire8[(4'h8):(2'h3)] <<< $unsigned(wire8))) != {(&reg14[(5'h12):(4'ha)])}));
              reg44 <= (reg18[(3'h5):(1'h0)] >>> (reg18 << (((&reg11) ?
                  (reg10 * reg13) : $signed((8'hb2))) || wire24)));
              reg45 <= $signed($unsigned((~&($unsigned(reg18) > (wire8 ?
                  reg17 : wire7)))));
            end
          else
            begin
              reg43 <= reg44[(4'h8):(2'h3)];
              reg44 <= reg10[(1'h1):(1'h0)];
              reg45 <= ($signed($signed((^wire22))) ?
                  $unsigned($unsigned(reg44)) : $signed($signed(((8'hb4) ?
                      (^reg20) : $signed(reg20)))));
              reg46 <= reg12[(4'h8):(1'h0)];
              reg47 <= wire22;
            end
        end
      else
        begin
          reg42 <= reg13;
        end
    end
  assign wire48 = reg42[(1'h1):(1'h1)];
  assign wire49 = {reg9};
  assign wire50 = $signed($unsigned($signed({(7'h40), reg43})));
  assign wire51 = $unsigned(reg20[(3'h4):(1'h1)]);
  assign wire52 = ((^~(8'ha6)) ?
                      {(~^(reg43 ~^ (-(7'h41))))} : $unsigned((($unsigned(reg43) >= $signed(reg18)) <<< (&wire23))));
  module53 #() modinst80 (wire79, clk, reg45, wire51, wire6, reg20, reg13);
  assign wire81 = (~($signed($signed($unsigned(reg9))) ?
                      $unsigned((+$unsigned(wire48))) : wire8));
  module82 #() modinst122 (wire121, clk, reg15, wire50, reg12, reg20, reg16);
  assign wire123 = (reg12 >>> reg43);
  assign wire124 = reg19[(3'h4):(1'h0)];
  assign wire125 = (~|((((~reg15) ?
                           (7'h44) : $signed((7'h40))) | ((wire21 > (8'hb4)) > {wire79,
                           reg14})) ?
                       reg10[(1'h1):(1'h0)] : wire79[(1'h1):(1'h0)]));
  module126 #() modinst179 (.clk(clk), .y(wire178), .wire129(reg13), .wire130(reg9), .wire128(wire6), .wire127(wire48), .wire131(reg43));
endmodule

module module126  (y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire131;
  input wire [(4'hf):(1'h0)] wire130;
  input wire signed [(2'h2):(1'h0)] wire129;
  input wire [(4'he):(1'h0)] wire128;
  input wire signed [(5'h14):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire177;
  wire signed [(3'h5):(1'h0)] wire176;
  wire [(3'h7):(1'h0)] wire175;
  wire [(3'h6):(1'h0)] wire174;
  wire [(5'h14):(1'h0)] wire173;
  wire [(3'h6):(1'h0)] wire172;
  wire [(4'hc):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire162;
  wire [(4'hc):(1'h0)] wire161;
  wire [(4'ha):(1'h0)] wire157;
  wire [(4'hb):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire146;
  wire signed [(4'h8):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire143;
  wire [(3'h7):(1'h0)] wire142;
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(2'h2):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire163,
                 wire162,
                 wire161,
                 wire157,
                 wire156,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg160,
                 reg159,
                 reg158,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg132 <= $unsigned($signed($signed($unsigned(((8'hb8) ?
          wire130 : wire129)))));
      reg133 <= $unsigned({((~&(wire130 ?
              wire131 : wire128)) >= wire129[(1'h0):(1'h0)]),
          $unsigned(reg132[(5'h14):(5'h13)])});
      if ($unsigned(wire128[(3'h7):(3'h7)]))
        begin
          reg134 <= $signed(((~|((!wire130) ? {reg133} : (|wire128))) ?
              $signed(reg132[(1'h1):(1'h0)]) : {((wire127 ? wire130 : reg133) ?
                      (-wire128) : wire129[(2'h2):(1'h1)])}));
          reg135 <= (((wire128[(2'h2):(1'h1)] ~^ $unsigned(wire129)) ?
              $unsigned(reg133[(4'h9):(3'h6)]) : wire129) >= {reg132[(4'hb):(3'h7)]});
          if (reg135)
            begin
              reg136 <= $signed($unsigned($signed(wire128[(3'h7):(3'h7)])));
              reg137 <= wire130;
            end
          else
            begin
              reg136 <= wire127[(3'h6):(1'h0)];
              reg137 <= wire131;
              reg138 <= reg135;
              reg139 <= $unsigned($signed((($unsigned(reg135) ?
                      reg138[(4'ha):(2'h3)] : (~reg132)) ?
                  reg134[(3'h6):(3'h5)] : reg138)));
            end
          reg140 <= $unsigned($unsigned({{$signed(reg139), (!reg132)},
              (wire130[(4'he):(4'hd)] ~^ wire130[(1'h1):(1'h1)])}));
          reg141 <= {(^(reg133[(4'h8):(3'h6)] << wire127)),
              $signed(reg132[(4'he):(3'h6)])};
        end
      else
        begin
          reg134 <= $unsigned(($signed(reg134) ?
              $signed(reg141[(2'h2):(2'h2)]) : wire131));
          reg135 <= $signed($unsigned($signed((8'ha3))));
          if (wire129)
            begin
              reg136 <= $unsigned({wire130,
                  ((((8'ha0) << (8'hb5)) ? (+wire129) : {reg137}) >= (7'h40))});
              reg137 <= ($signed(wire131[(4'hb):(4'h9)]) ?
                  (!(&($signed(reg132) ?
                      (&reg134) : $unsigned((8'ha0))))) : (((&(^wire129)) ?
                          ($signed((8'ha6)) ^~ (wire129 >= wire130)) : reg141[(1'h0):(1'h0)]) ?
                      ((~&reg137) * $signed(wire127)) : ((&(&wire128)) - (^(reg139 > reg141)))));
              reg138 <= $unsigned($unsigned((!$unsigned($signed(reg139)))));
              reg139 <= reg138[(3'h6):(2'h3)];
            end
          else
            begin
              reg136 <= reg136;
              reg137 <= $signed(($signed($unsigned({(8'ha2)})) ^ $signed(reg139[(3'h7):(3'h5)])));
              reg138 <= reg138[(4'h9):(1'h1)];
            end
          reg140 <= wire130;
          reg141 <= (((reg136[(4'h8):(2'h3)] ?
              $signed((8'hae)) : $signed((wire130 ?
                  reg141 : reg137))) <= $signed(reg141[(2'h2):(2'h2)])) - (reg140[(4'ha):(3'h6)] > $unsigned((reg135 ?
              $signed(reg137) : (wire131 >> reg138)))));
        end
    end
  assign wire142 = (wire130[(3'h7):(2'h2)] - (reg132[(4'ha):(3'h7)] ^~ $signed((&{reg139,
                       wire127}))));
  assign wire143 = $signed((~&(~|wire130[(4'hc):(1'h0)])));
  assign wire144 = ((~(reg139 ?
                       reg134[(2'h3):(2'h3)] : wire128[(3'h6):(1'h0)])) <= reg141);
  assign wire145 = reg132;
  assign wire146 = (wire130 ?
                       wire145 : $signed((~&$signed((reg135 ?
                           reg135 : reg132)))));
  always
    @(posedge clk) begin
      if ($signed($signed(reg133)))
        begin
          reg147 <= (~&(^$unsigned(wire145[(1'h0):(1'h0)])));
          if ((7'h42))
            begin
              reg148 <= $signed(reg135);
              reg149 <= reg136;
              reg150 <= {(+wire129), wire146[(2'h2):(2'h2)]};
              reg151 <= reg141;
            end
          else
            begin
              reg148 <= (~^$signed((~{$signed((8'hb0))})));
              reg149 <= $signed(($signed(($unsigned(wire146) ?
                  ((7'h40) ^~ (7'h41)) : {reg148})) <<< reg149[(2'h2):(2'h2)]));
              reg150 <= $unsigned(wire129);
              reg151 <= reg150;
              reg152 <= (^~$signed(($signed($signed(reg141)) ?
                  ((^wire129) ?
                      (reg149 ? reg135 : reg149) : wire144) : $signed(((8'ha8) ?
                      (8'hbc) : reg150)))));
            end
          reg153 <= (wire129[(1'h1):(1'h1)] != (($signed({wire131,
                  reg134}) + reg152[(2'h3):(1'h1)]) ?
              {(~(~^wire144))} : $signed(($signed(reg140) >> (reg147 >> wire145)))));
          reg154 <= reg153[(2'h2):(2'h2)];
          reg155 <= $signed((^wire143[(2'h2):(1'h0)]));
        end
      else
        begin
          if (reg155[(1'h1):(1'h1)])
            begin
              reg147 <= $unsigned($signed(((wire146[(2'h2):(1'h0)] ?
                      reg150 : reg154[(3'h5):(1'h0)]) ?
                  (^~$unsigned((8'haa))) : reg152)));
              reg148 <= reg140;
            end
          else
            begin
              reg147 <= reg149[(3'h4):(2'h2)];
              reg148 <= $signed(((8'hbc) >= (-{(-reg141)})));
              reg149 <= $signed($signed((&reg152)));
            end
          reg150 <= $unsigned((((8'ha1) ? (8'hb6) : $signed((8'ha0))) ?
              wire142[(1'h1):(1'h1)] : $signed($signed(wire130[(3'h7):(3'h6)]))));
          if (reg148[(1'h1):(1'h0)])
            begin
              reg151 <= reg135;
              reg152 <= $signed($signed(($signed(reg155) != (~&(8'hb0)))));
              reg153 <= {reg135};
            end
          else
            begin
              reg151 <= $unsigned((($signed(((7'h40) ? reg134 : wire145)) ?
                      {(reg151 <= reg135), (!reg135)} : $unsigned((+reg134))) ?
                  reg137[(3'h7):(1'h0)] : (reg136[(4'hc):(3'h5)] ?
                      (8'hae) : (-(reg154 ? wire143 : reg141)))));
            end
          reg154 <= $unsigned({$signed((^~(!wire143)))});
        end
    end
  assign wire156 = {wire130};
  assign wire157 = (7'h40);
  always
    @(posedge clk) begin
      reg158 <= $signed(wire131);
      reg159 <= $unsigned($unsigned(((8'h9d) ?
          $unsigned((reg140 ? wire144 : reg134)) : reg152)));
      reg160 <= (~reg154[(2'h3):(2'h3)]);
    end
  assign wire161 = ((~&reg155[(2'h2):(1'h0)]) ^ {(+(^~reg132)),
                       $signed(($signed(wire131) ?
                           (reg134 ^~ reg153) : wire142))});
  assign wire162 = (~^{{({reg150, reg159} > wire130),
                           $signed(reg149[(2'h3):(1'h1)])},
                       (!(8'hb0))});
  assign wire163 = wire131;
  always
    @(posedge clk) begin
      if ({(~^$unsigned(wire161[(4'hb):(3'h4)]))})
        begin
          reg164 <= reg134[(3'h4):(2'h2)];
          reg165 <= $signed($signed((~$signed($unsigned(reg132)))));
        end
      else
        begin
          reg164 <= reg152[(3'h4):(2'h3)];
          reg165 <= ({(~^wire127[(4'hf):(1'h0)])} ?
              $signed(reg154[(2'h3):(1'h0)]) : wire156[(4'h8):(3'h6)]);
          if (({$signed((~reg152[(2'h2):(1'h1)]))} ?
              reg154[(2'h3):(1'h1)] : ((&($signed(reg150) && (^~reg139))) || reg140[(2'h2):(1'h1)])))
            begin
              reg166 <= wire127;
              reg167 <= $unsigned(reg165[(1'h0):(1'h0)]);
            end
          else
            begin
              reg166 <= $unsigned((($unsigned($unsigned(reg152)) ?
                      $unsigned({reg158}) : {$signed((8'hba))}) ?
                  $signed((wire128[(4'h9):(2'h3)] ?
                      reg148[(4'hc):(4'h8)] : wire143)) : reg165));
            end
          reg168 <= $signed((wire163[(2'h2):(1'h0)] || (!$signed({reg139}))));
        end
      reg169 <= $signed((!(^({reg138, (8'hb6)} >>> wire157[(4'h8):(3'h7)]))));
      reg170 <= $signed(wire142[(3'h6):(1'h1)]);
      reg171 <= {(reg139[(3'h4):(2'h2)] ?
              ((reg164 ?
                  reg168[(2'h2):(1'h1)] : wire143) * $unsigned(wire131)) : wire162)};
    end
  assign wire172 = reg167;
  assign wire173 = ((wire129[(2'h2):(1'h1)] | (^$unsigned((wire162 < (8'hb9))))) >>> $signed((^~(!reg166[(3'h4):(1'h1)]))));
  assign wire174 = (-(~reg141[(2'h3):(2'h2)]));
  assign wire175 = $unsigned(($unsigned($signed((wire142 > wire128))) <<< (^(^(reg168 & wire145)))));
  assign wire176 = wire172;
  assign wire177 = wire173;
endmodule

module module82
#(parameter param119 = {((~{(+(8'hb8))}) ? (({(8'haf)} || ((7'h43) ? (8'hb7) : (8'haf))) <= ({(8'ha6)} + ((8'hbe) == (8'hbe)))) : (((+(8'hb9)) >= ((8'ha2) ? (8'ha1) : (8'ha2))) - {(~&(8'h9f))})), ((^~(~&(8'h9f))) >> (({(8'hbf)} << {(8'hab), (8'ha5)}) ? (~^((8'ha3) <<< (8'hbe))) : ((^(8'hbd)) ? ((8'h9e) ? (8'hbf) : (8'had)) : (|(8'hbc)))))}, 
parameter param120 = ((((~param119) ? ((8'h9d) ? (param119 >> param119) : {param119}) : param119) != param119) ? ((|(8'ha2)) & (+{(&param119), param119})) : (((!(|param119)) ? ({param119, param119} + {param119}) : {(!param119)}) ? (&(param119 ? ((8'hbc) || param119) : (param119 == param119))) : ((param119 ? (-param119) : (7'h41)) ? (8'hbd) : param119))))
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire87;
  input wire signed [(3'h4):(1'h0)] wire86;
  input wire signed [(3'h4):(1'h0)] wire85;
  input wire [(4'h9):(1'h0)] wire84;
  input wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire signed [(2'h3):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire100;
  wire [(4'hf):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire89,
                 wire88,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg94,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire88 = (((!((^wire83) < (wire86 > (8'ha7)))) ?
                      wire87 : wire86[(2'h2):(2'h2)]) <= wire87[(2'h2):(1'h1)]);
  assign wire89 = (^$unsigned((^$unsigned((wire83 ? wire84 : wire88)))));
  always
    @(posedge clk) begin
      reg90 <= wire89[(3'h6):(2'h3)];
      reg91 <= $unsigned((^reg90[(1'h1):(1'h0)]));
      reg92 <= wire84;
    end
  assign wire93 = $unsigned((!(reg90 ? $unsigned((-wire84)) : wire84)));
  always
    @(posedge clk) begin
      reg94 <= (~wire86[(1'h0):(1'h0)]);
    end
  assign wire95 = {$signed(wire88[(3'h6):(3'h6)]), wire89[(3'h5):(2'h3)]};
  assign wire96 = ((+((wire93[(2'h2):(1'h0)] ?
                      (wire83 ?
                          reg90 : wire85) : $unsigned(wire93)) > {$signed((8'hb9)),
                      (^(8'haf))})) && $signed((|((&reg92) | (^wire84)))));
  assign wire97 = reg91[(4'h8):(3'h4)];
  assign wire98 = $signed(($unsigned((~(8'hbf))) + $unsigned(wire97)));
  assign wire99 = ($unsigned(wire88) <= wire83[(2'h2):(1'h1)]);
  assign wire100 = ($signed($signed($unsigned(wire86[(1'h0):(1'h0)]))) << (|(~$signed($unsigned(reg94)))));
  assign wire101 = wire95[(4'hb):(1'h0)];
  assign wire102 = $signed($signed(wire100[(4'ha):(3'h5)]));
  assign wire103 = $unsigned(reg92[(5'h11):(4'h9)]);
  assign wire104 = wire95;
  assign wire105 = wire83;
  assign wire106 = $signed({(wire93[(3'h7):(1'h1)] ?
                           ($unsigned(wire100) <<< wire87[(1'h1):(1'h0)]) : ($signed(wire93) ?
                               (wire88 | wire101) : (|reg90)))});
  assign wire107 = wire103[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      if ((($unsigned(({wire102} ^ ((8'h9c) >> reg94))) ?
          wire97 : (&($signed(wire99) + (wire104 + wire104)))) & $unsigned((~|($unsigned(wire85) << wire98[(1'h0):(1'h0)])))))
        begin
          reg108 <= ($unsigned({reg90[(2'h2):(2'h2)],
              $unsigned(reg91[(3'h4):(1'h0)])}) != ((((^~wire98) < wire99) ?
              $unsigned((+wire105)) : $unsigned((+wire105))) ~^ {($signed(wire107) >= reg94[(2'h2):(2'h2)]),
              ($signed(wire101) ? (!wire105) : wire97[(3'h6):(1'h1)])}));
          reg109 <= wire99[(4'hb):(2'h3)];
          reg110 <= $signed((~&{$signed($signed(reg92)),
              (wire95[(4'hf):(4'ha)] ?
                  $unsigned(wire107) : (wire98 ? (8'ha7) : wire83))}));
          reg111 <= wire93;
        end
      else
        begin
          reg108 <= (8'hac);
          reg109 <= $signed($unsigned((!$unsigned($signed(wire105)))));
          reg110 <= $signed($unsigned((~|$unsigned((wire87 * reg90)))));
        end
      reg112 <= ((($unsigned(wire89[(4'h8):(1'h0)]) ?
              (!$signed(wire99)) : $unsigned(wire105)) * $unsigned(wire89)) ?
          $signed(((~wire103[(4'hb):(3'h6)]) ~^ $unsigned(wire83[(3'h5):(3'h4)]))) : wire106[(1'h0):(1'h0)]);
      reg113 <= $signed({(reg110 ?
              (~^wire104) : ((wire97 ? wire85 : (8'h9d)) < wire93))});
      reg114 <= wire101[(2'h3):(2'h2)];
    end
  assign wire115 = {((!$unsigned(wire89[(3'h6):(3'h6)])) ?
                           wire106 : ((wire95[(4'hd):(1'h1)] ?
                               (8'hb6) : (wire96 ?
                                   reg109 : wire98)) > (((8'ha3) ?
                               reg92 : wire84) >>> $unsigned((8'hb2)))))};
  assign wire116 = {wire86[(2'h2):(1'h0)], $unsigned($unsigned((8'hb2)))};
  assign wire117 = (wire87[(2'h3):(1'h1)] ?
                       $unsigned($signed((reg114[(5'h11):(5'h10)] ?
                           reg114 : (&wire83)))) : $signed($unsigned(($unsigned((8'hbe)) ?
                           $signed(reg92) : reg94[(3'h7):(1'h0)]))));
  assign wire118 = ($unsigned((reg91 ?
                           $unsigned((wire99 >>> wire115)) : ((wire105 ?
                               wire105 : wire115) - (wire97 ?
                               wire104 : reg91)))) ?
                       ({(|(wire100 - wire100))} >= ($signed($signed(wire105)) ?
                           wire102 : $signed((wire104 & wire103)))) : $signed((!(!$signed(wire117)))));
endmodule

module module53
#(parameter param77 = ((&(({(8'haf)} == {(8'hbd)}) <<< {(-(8'haa)), {(8'hba)}})) ? ((((&(7'h41)) ? ((8'hb4) >>> (8'hb4)) : (!(8'had))) ? {((8'hb7) ? (8'ha3) : (8'ha6))} : {((8'hb0) ? (8'hb8) : (7'h44)), ((7'h43) << (8'ha7))}) ? (~^(((8'haf) ? (8'ha1) : (7'h43)) ~^ ((8'hac) ~^ (8'hbb)))) : (({(8'hb2), (8'ha3)} == ((8'hb9) ? (8'h9f) : (8'hab))) ? (((8'h9f) || (8'hb4)) ? (~^(8'hb5)) : ((8'ha2) ? (8'hb5) : (8'hb0))) : ((-(8'hba)) == ((8'hb7) > (8'ha8))))) : (^(&(((7'h41) ? (7'h41) : (8'hb8)) ? (8'ha1) : (~(8'ha3)))))), 
parameter param78 = ((((+{param77, param77}) ? (~&((7'h41) ? (8'hb2) : param77)) : {((7'h43) || (7'h42))}) ? (param77 ? (((8'hb2) ? (8'ha5) : (7'h42)) ? (param77 - param77) : param77) : ((param77 - param77) >= (param77 ^~ param77))) : (^((param77 - param77) ? (~&param77) : param77))) ^~ ((({param77} ? (param77 ^ param77) : {param77, param77}) ? ({(8'ha4)} >>> param77) : {((8'hbe) <= param77)}) | param77)))
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire58;
  input wire signed [(4'he):(1'h0)] wire57;
  input wire signed [(3'h5):(1'h0)] wire56;
  input wire [(5'h10):(1'h0)] wire55;
  input wire signed [(4'hb):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire59;
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  assign y = {wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire59,
                 reg75,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire59 = wire54;
  always
    @(posedge clk) begin
      reg60 <= (8'ha1);
      if ({($signed(((wire56 ^ wire58) ? wire54 : $signed(wire58))) ?
              (~&(wire58[(4'h8):(3'h5)] >= $signed((8'haa)))) : wire59)})
        begin
          reg61 <= $unsigned(wire59[(1'h0):(1'h0)]);
          reg62 <= ($signed(wire56) > wire56[(2'h3):(1'h0)]);
          reg63 <= wire59;
          reg64 <= $unsigned(wire58);
        end
      else
        begin
          reg61 <= (((^~(^$signed(wire55))) ?
                  $signed(($unsigned(wire54) ?
                      reg60[(5'h10):(1'h0)] : reg60)) : {(wire59 < ((8'hba) ?
                          reg61 : reg60))}) ?
              $unsigned((^~wire56)) : wire55);
          reg62 <= $unsigned(reg63[(5'h12):(4'h9)]);
        end
    end
  assign wire65 = $unsigned((+(((^~reg63) ?
                      (reg63 <= reg64) : (~&reg60)) < ($unsigned(wire55) ?
                      wire57[(4'he):(4'he)] : (wire56 ? wire59 : (8'ha6))))));
  assign wire66 = (~|((wire58[(4'h9):(4'h9)] ?
                          ({wire65} ?
                              {reg63} : (8'h9e)) : ($unsigned(reg64) == wire56)) ?
                      (((wire55 ? wire65 : reg61) ^ $signed(wire57)) ?
                          reg64[(3'h4):(1'h0)] : $signed(((8'hb2) << (8'hab)))) : (8'ha0)));
  assign wire67 = reg60[(5'h10):(1'h1)];
  assign wire68 = reg63;
  assign wire69 = (~|(((((8'hb4) ? wire67 : wire67) ?
                          (wire58 ? wire56 : (8'hb6)) : wire55) ?
                      (~&$unsigned(wire55)) : {((8'hb0) ? wire65 : reg63),
                          $signed(wire68)}) <= $unsigned((^reg63))));
  assign wire70 = ($unsigned(wire65) ?
                      wire59 : (&$unsigned((~&$unsigned(reg63)))));
  assign wire71 = (((reg62 | (8'h9d)) ?
                          wire58[(1'h0):(1'h0)] : (!$signed((-wire58)))) ?
                      wire66 : wire68[(3'h6):(2'h3)]);
  assign wire72 = wire55[(4'hc):(3'h7)];
  assign wire73 = wire54[(4'h8):(2'h3)];
  assign wire74 = ({wire69, wire54[(1'h1):(1'h0)]} ?
                      wire70[(2'h2):(1'h0)] : (wire55[(4'hb):(3'h7)] * (($unsigned(reg61) ^ wire59[(3'h7):(3'h6)]) >> reg60[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg75 <= (wire73[(1'h1):(1'h0)] ? wire74[(4'h9):(2'h3)] : (8'ha5));
    end
  assign wire76 = {($signed(wire57[(2'h2):(1'h1)]) ?
                          $signed(reg62) : wire66[(4'h9):(3'h5)]),
                      (^$unsigned((8'hb9)))};
endmodule

module module25
#(parameter param37 = {({(((8'ha9) ? (7'h43) : (8'ha2)) | ((8'ha7) != (8'hbf)))} ? ({{(8'hae)}, ((8'hb5) ? (8'hb3) : (8'hb4))} ? (8'h9f) : ((&(7'h43)) ? (~&(8'hac)) : ((8'had) ? (8'h9e) : (8'hae)))) : ((8'ha6) ? ((~&(8'hbc)) || {(8'hbd)}) : {(~&(8'ha7)), ((8'h9d) <<< (8'hb6))})), ((+((^(8'hbf)) ? ((8'hb7) ? (8'ha0) : (7'h40)) : ((8'hae) ? (8'ha1) : (8'hb1)))) ? (((~|(7'h42)) ? (|(7'h43)) : ((8'ha3) ? (8'hbc) : (8'ha9))) >> ((8'ha8) ? ((8'hbb) * (8'ha3)) : ((8'ha2) ? (8'hb9) : (8'hbc)))) : (8'ha8))}, 
parameter param38 = param37)
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire30;
  input wire [(3'h6):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  assign y = {wire36, wire35, wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = ($signed(wire28[(1'h0):(1'h0)]) ?
                      ($signed(({wire27} | {wire27, wire27})) ?
                          (wire27[(1'h0):(1'h0)] ?
                              (wire27[(2'h2):(1'h1)] || $signed(wire30)) : ({wire26,
                                  wire26} != (^~wire28))) : $signed(((~wire27) ^~ wire28[(1'h0):(1'h0)]))) : (~|wire27));
  assign wire32 = {(((wire28[(3'h4):(3'h4)] ?
                          {wire30, wire28} : wire30) >= {$unsigned(wire30),
                          (wire31 >>> wire27)}) <= $signed(wire30[(2'h3):(2'h2)])),
                      (+((wire28[(3'h4):(2'h2)] << (wire28 ?
                          wire29 : wire28)) && $unsigned($unsigned(wire29))))};
  assign wire33 = {wire29,
                      (($signed((wire28 << wire27)) ?
                              $unsigned($signed(wire27)) : wire30[(3'h7):(3'h4)]) ?
                          wire30 : (~|wire31))};
  assign wire34 = wire29;
  assign wire35 = $unsigned((^~{($unsigned((7'h42)) <= $signed(wire30))}));
  assign wire36 = wire26[(4'he):(4'h8)];
endmodule
