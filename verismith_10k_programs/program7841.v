module top
#(parameter param245 = ((+((((8'hb3) && (8'hb6)) ? {(8'hb5)} : (8'hb7)) ? ((|(8'haa)) << ((8'hb7) ? (8'had) : (8'had))) : (^~((8'hbb) ? (8'h9c) : (8'hb4))))) ^~ ({(&{(8'hb4)})} >> ((((7'h42) >>> (8'ha6)) <= ((8'ha9) ? (8'ha3) : (8'ha9))) << ((|(8'h9f)) ^~ ((8'hb5) ? (8'ha8) : (8'h9c)))))), 
parameter param246 = {(((8'hb4) + ((7'h44) >> (^~param245))) ? param245 : ((|(|param245)) >= param245)), (param245 << (-((param245 - param245) ? (param245 ? (8'hae) : param245) : {param245})))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h285):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire244;
  wire signed [(3'h5):(1'h0)] wire243;
  wire [(3'h7):(1'h0)] wire242;
  wire [(4'he):(1'h0)] wire241;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire239;
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  assign y = {wire244,
                 wire243,
                 wire242,
                 wire241,
                 wire23,
                 wire24,
                 wire35,
                 wire36,
                 wire58,
                 wire59,
                 wire60,
                 wire239,
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
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {wire0, wire1};
    end
  always
    @(posedge clk) begin
      reg5 <= (~|reg4);
      reg6 <= {wire0};
      if ($signed((-wire1)))
        begin
          reg7 <= (-wire3[(3'h4):(1'h0)]);
          reg8 <= reg5[(2'h2):(1'h1)];
        end
      else
        begin
          if ((&((&{$unsigned(reg6), reg4[(4'ha):(4'ha)]}) ?
              reg7[(1'h0):(1'h0)] : ((wire1[(1'h1):(1'h0)] > ((8'hae) ?
                  (8'h9c) : reg8)) ~^ (reg7 ? wire3 : {wire2})))))
            begin
              reg7 <= ({$unsigned({wire2[(1'h0):(1'h0)],
                      reg6[(5'h15):(3'h7)]})} << $signed($unsigned(wire2)));
              reg8 <= $signed(wire2[(4'hd):(2'h2)]);
              reg9 <= $signed($unsigned(((wire1 ?
                  $unsigned(wire2) : reg5) + $unsigned($signed(wire2)))));
              reg10 <= $unsigned(wire2);
            end
          else
            begin
              reg7 <= wire3[(4'h9):(3'h7)];
              reg8 <= wire3[(4'h9):(1'h0)];
            end
          if (reg5[(2'h2):(1'h1)])
            begin
              reg11 <= $signed({{(~reg8[(2'h3):(2'h2)])},
                  $unsigned(reg7[(2'h3):(2'h2)])});
            end
          else
            begin
              reg11 <= $signed($signed(reg8[(1'h1):(1'h0)]));
              reg12 <= (+reg4);
              reg13 <= reg9[(2'h3):(1'h0)];
              reg14 <= $signed($unsigned(reg5));
            end
          if (reg7)
            begin
              reg15 <= (reg6[(4'h8):(2'h2)] ?
                  ((wire1 ?
                          (wire0[(2'h3):(2'h3)] ?
                              ((8'hab) ?
                                  wire1 : reg4) : $unsigned(wire2)) : reg14[(1'h1):(1'h1)]) ?
                      {reg5[(1'h1):(1'h0)],
                          (~^$unsigned(wire0))} : {(+$signed(wire2)),
                          $signed(wire2)}) : (reg12[(3'h4):(1'h0)] | ((8'hae) << ($signed(reg14) ?
                      {wire3} : reg7))));
              reg16 <= (8'hb2);
              reg17 <= wire1[(1'h0):(1'h0)];
              reg18 <= reg8[(2'h2):(2'h2)];
              reg19 <= (~&wire0[(1'h1):(1'h1)]);
            end
          else
            begin
              reg15 <= (!$unsigned($signed($signed((reg8 ? reg5 : reg11)))));
              reg16 <= $unsigned($unsigned($signed(((&wire0) ?
                  $signed(wire2) : (reg6 ~^ reg12)))));
              reg17 <= reg11;
              reg18 <= reg4;
            end
          reg20 <= $unsigned(reg10[(4'h8):(2'h2)]);
          reg21 <= reg6[(5'h15):(4'hf)];
        end
      reg22 <= $signed(($unsigned($unsigned((reg8 && reg5))) ?
          (($unsigned(wire1) ? reg10[(3'h7):(3'h5)] : reg17) ?
              ({reg4, reg13} ^ (reg17 ?
                  reg7 : (8'hae))) : (^$unsigned(reg12))) : (!((reg8 <= (8'ha2)) ?
              (^~reg10) : (^(8'hac))))));
    end
  assign wire23 = reg18;
  assign wire24 = ($unsigned($signed(wire0[(1'h0):(1'h0)])) & ((^reg13) <= {reg18[(1'h1):(1'h0)],
                      (~|{wire3})}));
  always
    @(posedge clk) begin
      reg25 <= (8'hb4);
    end
  always
    @(posedge clk) begin
      reg26 <= {(~($signed($signed(reg8)) <= {(reg5 ^~ reg19)})), wire3};
      reg27 <= {reg25};
      if ({(((+$unsigned(wire1)) == wire0[(2'h2):(1'h1)]) & $signed((&$signed(reg4))))})
        begin
          reg28 <= $unsigned(reg6[(3'h5):(1'h0)]);
          reg29 <= (wire1 * wire1[(1'h0):(1'h0)]);
          reg30 <= reg27;
        end
      else
        begin
          reg28 <= reg10[(3'h4):(1'h1)];
          reg29 <= (&(~^$signed((^reg8))));
          reg30 <= reg9;
          if ($signed((~|{((&reg16) ? reg12 : wire24[(5'h10):(4'hb)])})))
            begin
              reg31 <= (&$unsigned($unsigned(reg8)));
              reg32 <= reg6[(4'h9):(1'h0)];
              reg33 <= ((-wire24[(4'hc):(3'h6)]) != reg32[(3'h6):(1'h0)]);
            end
          else
            begin
              reg31 <= (^$unsigned((&($signed((8'hb6)) >= reg32[(3'h5):(1'h0)]))));
              reg32 <= ((^$unsigned((wire3[(4'ha):(4'h9)] > (~^(8'hba))))) >> ($unsigned(((~|(8'hb1)) <= $signed(reg20))) & $unsigned(reg29[(1'h1):(1'h1)])));
              reg33 <= (reg19[(1'h0):(1'h0)] + (7'h41));
              reg34 <= wire0;
            end
        end
    end
  assign wire35 = wire0[(2'h2):(1'h1)];
  assign wire36 = $unsigned($signed({($unsigned(reg31) ?
                          reg4[(4'hc):(4'ha)] : (^~reg15))}));
  always
    @(posedge clk) begin
      if (reg5[(1'h0):(1'h0)])
        begin
          reg37 <= $signed((^$signed(reg20)));
          reg38 <= $unsigned($unsigned((~$unsigned($unsigned((8'hba))))));
          if (wire24)
            begin
              reg39 <= reg8[(2'h3):(2'h2)];
            end
          else
            begin
              reg39 <= ($signed((8'hbd)) ?
                  ({(-(^~reg17))} || (($unsigned(reg10) >>> (8'had)) ^~ ({(8'ha3),
                          wire0} ?
                      (wire23 <= reg38) : ((7'h40) ?
                          reg6 : reg8)))) : ((~|{$signed(wire3)}) ?
                      (($signed(reg33) ?
                          (reg31 ?
                              wire0 : wire2) : reg6[(5'h15):(4'hd)]) | reg22[(5'h10):(3'h7)]) : ((reg39[(3'h7):(3'h4)] ?
                              (reg17 > reg12) : reg9) ?
                          $unsigned({reg4, wire23}) : ((wire2 >> reg15) ?
                              (reg8 != reg27) : $signed(wire36)))));
            end
        end
      else
        begin
          if ({(^~reg37),
              $signed(($signed(reg22[(2'h2):(1'h1)]) | $signed((reg27 == reg25))))})
            begin
              reg37 <= $unsigned((8'ha7));
              reg38 <= (8'hb8);
            end
          else
            begin
              reg37 <= reg18[(2'h3):(1'h0)];
              reg38 <= $signed(reg28);
              reg39 <= {(!$signed($signed($signed(reg14)))),
                  reg29[(1'h0):(1'h0)]};
              reg40 <= wire35[(4'hb):(3'h7)];
            end
          reg41 <= (((8'hae) & $signed(reg27)) && $unsigned((&$unsigned(reg12))));
          reg42 <= $signed((reg26[(3'h6):(2'h3)] ?
              ((8'ha1) != (|reg34)) : reg31[(3'h5):(3'h4)]));
          if ((reg4[(4'hb):(2'h3)] ?
              $signed((~reg33[(1'h0):(1'h0)])) : $unsigned((($signed(reg37) ?
                  (8'haf) : reg29) >= $unsigned($unsigned(reg42))))))
            begin
              reg43 <= ($unsigned($signed(($signed(reg11) ?
                  reg7 : (~reg27)))) >> (!((wire24 ?
                      wire35[(4'hf):(2'h3)] : (reg39 ? reg30 : wire0)) ?
                  (wire23[(3'h4):(1'h0)] > (reg31 + reg41)) : reg37[(3'h6):(3'h6)])));
              reg44 <= ($unsigned($unsigned((!$unsigned(reg43)))) - ((((7'h44) ?
                          reg21[(3'h7):(1'h0)] : reg25[(1'h1):(1'h0)]) ?
                      (reg22[(5'h10):(4'hb)] ?
                          $unsigned(reg18) : {reg18, reg28}) : $signed({wire3,
                          reg15})) ?
                  (+$signed($unsigned(reg10))) : wire24));
              reg45 <= ((^(reg43[(4'he):(2'h2)] | $signed(reg20))) - $signed(wire24));
            end
          else
            begin
              reg43 <= $signed((8'ha7));
              reg44 <= $signed(reg27[(3'h6):(1'h1)]);
              reg45 <= (!($signed((reg29 ?
                  (wire35 ^~ reg39) : $signed(reg31))) <<< {{reg21},
                  (!$signed(wire1))}));
              reg46 <= $unsigned((!reg28[(4'h9):(1'h1)]));
              reg47 <= reg39[(3'h6):(2'h3)];
            end
          reg48 <= (reg18 + reg20[(4'hc):(1'h0)]);
        end
      if ($signed($signed(((^$unsigned(reg34)) > ((reg41 ? reg15 : reg4) ?
          (reg40 ? (8'hbb) : wire1) : $unsigned(reg38))))))
        begin
          if (reg6)
            begin
              reg49 <= (~$unsigned({(|wire36),
                  {{reg47, reg41}, (reg37 ? reg17 : reg43)}}));
              reg50 <= {$unsigned(reg38)};
            end
          else
            begin
              reg49 <= (reg40 > $unsigned($unsigned(({reg21} ?
                  wire23 : $signed(wire1)))));
              reg50 <= (({(reg20[(4'h9):(4'h8)] ?
                              $signed(reg39) : $signed(reg41))} ?
                      (^~$unsigned((|reg9))) : $signed($unsigned(reg26[(3'h7):(3'h6)]))) ?
                  ((&((reg22 ?
                      (8'ha6) : (8'ha0)) <<< $unsigned(reg45))) > ($signed($signed(reg5)) << (reg42 ?
                      (wire2 ?
                          reg5 : (8'hb3)) : reg50[(3'h4):(3'h4)]))) : wire3);
            end
        end
      else
        begin
          reg49 <= (-{reg18[(3'h4):(2'h3)], reg46[(1'h1):(1'h0)]});
          reg50 <= (8'hb0);
          reg51 <= $unsigned((~&(($unsigned(wire36) ?
                  (reg49 ? reg43 : (8'ha2)) : reg30) ?
              (~reg48[(2'h2):(1'h0)]) : $signed(reg45[(3'h7):(2'h2)]))));
          reg52 <= $unsigned(reg26);
          if ($signed((^(8'h9d))))
            begin
              reg53 <= (&((~&wire0[(2'h3):(1'h0)]) && $unsigned({wire0,
                  reg33[(2'h3):(2'h3)]})));
              reg54 <= $unsigned(reg19[(3'h5):(1'h1)]);
              reg55 <= (reg50 * {reg19[(3'h4):(1'h0)],
                  ((&(8'hbd)) ? reg13 : wire36)});
              reg56 <= (|reg40);
              reg57 <= $unsigned({({$unsigned(reg40),
                      (reg46 >> reg49)} | ({reg39, reg34} ?
                      $signed(reg31) : reg7)),
                  reg53[(4'h9):(4'h9)]});
            end
          else
            begin
              reg53 <= wire3[(4'h9):(4'h9)];
              reg54 <= $signed((+(reg41[(3'h6):(3'h4)] ?
                  (~&$signed(wire23)) : $unsigned($signed(reg31)))));
              reg55 <= ((reg4 ?
                      (~^reg44[(1'h0):(1'h0)]) : reg19[(1'h1):(1'h0)]) ?
                  {(~^(reg20 ^~ $unsigned(reg4)))} : ((($unsigned((7'h41)) ?
                      (~^reg57) : (~|wire1)) ^ ({reg31} == $signed(reg29))) - $signed(((8'hb0) ^ $signed(wire23)))));
            end
        end
    end
  assign wire58 = (~|($unsigned({reg10[(3'h7):(3'h7)], reg22[(1'h0):(1'h0)]}) ?
                      {(~|{reg22})} : (~^$unsigned({reg39, reg40}))));
  assign wire59 = reg37[(3'h7):(2'h3)];
  assign wire60 = reg34;
  module61 #() modinst240 (.wire62(wire35), .y(wire239), .wire65(reg16), .clk(clk), .wire63(reg28), .wire64(reg9));
  assign wire241 = reg28;
  assign wire242 = $unsigned(wire36);
  assign wire243 = $signed($unsigned($signed(reg25)));
  assign wire244 = wire23[(3'h4):(2'h3)];
endmodule

module module61
#(parameter param237 = (((({(8'hb9)} + ((8'h9c) ? (8'hb3) : (8'ha5))) == (^(~|(8'ha3)))) ? ((((8'h9c) <= (8'ha3)) != {(8'ha9), (8'hb2)}) ? (~|(-(8'ha7))) : (8'hab)) : ((((8'hb8) >>> (8'hb6)) ? (8'hb9) : ((8'ha6) ? (8'hb6) : (8'hbc))) ? (8'hb9) : (~((8'haa) && (8'hb0))))) ? ((8'hab) && (((~&(8'hb1)) || ((8'ha8) || (8'hb2))) >>> (~^(^~(8'hb1))))) : {(|(~((8'ha1) < (8'ha5))))}), 
parameter param238 = ((7'h40) ? param237 : (8'ha6)))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire65;
  input wire signed [(4'hf):(1'h0)] wire64;
  input wire signed [(5'h12):(1'h0)] wire63;
  input wire [(5'h12):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire236;
  wire [(5'h14):(1'h0)] wire235;
  wire [(4'h8):(1'h0)] wire234;
  wire [(5'h11):(1'h0)] wire195;
  wire [(4'hd):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire160;
  wire [(4'h9):(1'h0)] wire198;
  wire [(4'h8):(1'h0)] wire232;
  reg signed [(4'hf):(1'h0)] reg197 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  assign y = {wire236,
                 wire235,
                 wire234,
                 wire195,
                 wire124,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire82,
                 wire66,
                 wire126,
                 wire160,
                 wire198,
                 wire232,
                 reg197,
                 reg84,
                 (1'h0)};
  assign wire66 = wire64;
  module67 #() modinst83 (.clk(clk), .wire69(wire64), .wire71(wire63), .y(wire82), .wire70(wire65), .wire68(wire66));
  always
    @(posedge clk) begin
      reg84 <= (8'haf);
    end
  assign wire85 = (~^reg84[(4'hf):(4'hd)]);
  assign wire86 = wire63;
  assign wire87 = wire66;
  assign wire88 = reg84[(4'hc):(2'h3)];
  assign wire89 = $unsigned(($unsigned((wire86 > wire88)) > (8'ha1)));
  module90 #() modinst125 (wire124, clk, wire64, wire82, wire66, wire89, wire87);
  assign wire126 = (wire87 ?
                       wire88[(1'h1):(1'h0)] : $signed((((wire64 > wire82) ?
                               ((8'ha9) > wire65) : wire86) ?
                           $signed($signed(wire87)) : $signed(wire82))));
  module127 #() modinst161 (.y(wire160), .wire128(wire89), .wire132(wire66), .wire130(wire62), .clk(clk), .wire131(wire65), .wire129(wire82));
  module162 #() modinst196 (wire195, clk, wire126, wire89, wire65, wire86, wire85);
  always
    @(posedge clk) begin
      reg197 <= wire82[(5'h14):(4'ha)];
    end
  assign wire198 = (($signed({(+(8'hbd)), (wire89 < wire85)}) ?
                           (~^$unsigned($signed((7'h40)))) : $unsigned(((|wire88) > wire65[(4'ha):(4'h9)]))) ?
                       wire87 : wire88[(2'h3):(1'h1)]);
  module199 #() modinst233 (wire232, clk, wire85, wire124, wire62, wire63, wire86);
  assign wire234 = wire85;
  assign wire235 = $unsigned((+({$unsigned(wire198)} == $unsigned((~^wire87)))));
  assign wire236 = wire235[(4'hb):(4'h9)];
endmodule

module module199
#(parameter param231 = ((~^((((8'hb4) ? (7'h42) : (8'hbf)) ? ((8'hb9) ? (8'ha3) : (8'ha2)) : (+(8'had))) | {((7'h42) ? (7'h41) : (8'hb6)), ((8'ha6) ? (8'ha8) : (8'hac))})) == (((|((8'ha4) <<< (8'ha6))) ? (!((7'h44) ? (7'h44) : (8'h9f))) : {((8'ha8) | (8'had))}) ? (&(~|((8'ha1) && (8'hbb)))) : ((8'hb6) || (7'h41)))))
(y, clk, wire204, wire203, wire202, wire201, wire200);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire204;
  input wire signed [(4'hb):(1'h0)] wire203;
  input wire signed [(5'h12):(1'h0)] wire202;
  input wire [(5'h12):(1'h0)] wire201;
  input wire [(4'ha):(1'h0)] wire200;
  wire signed [(2'h3):(1'h0)] wire230;
  wire signed [(3'h6):(1'h0)] wire218;
  wire signed [(5'h12):(1'h0)] wire217;
  wire [(3'h5):(1'h0)] wire216;
  wire signed [(3'h7):(1'h0)] wire215;
  wire [(4'hc):(1'h0)] wire211;
  wire signed [(3'h5):(1'h0)] wire209;
  wire [(2'h2):(1'h0)] wire208;
  wire signed [(5'h14):(1'h0)] wire207;
  wire [(3'h6):(1'h0)] wire206;
  wire signed [(3'h6):(1'h0)] wire205;
  reg signed [(3'h7):(1'h0)] reg229 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg228 = (1'h0);
  reg [(3'h4):(1'h0)] reg227 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg225 = (1'h0);
  reg [(3'h7):(1'h0)] reg224 = (1'h0);
  reg signed [(4'he):(1'h0)] reg223 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg222 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg220 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg214 = (1'h0);
  reg [(4'hc):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg210 = (1'h0);
  assign y = {wire230,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire211,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg214,
                 reg213,
                 reg212,
                 reg210,
                 (1'h0)};
  assign wire205 = (wire203[(4'h8):(2'h3)] ? wire204[(2'h2):(1'h0)] : wire203);
  assign wire206 = (8'haa);
  assign wire207 = wire202;
  assign wire208 = {wire206[(3'h6):(1'h0)],
                       $unsigned((wire207[(1'h1):(1'h1)] ?
                           {(~&wire204)} : wire206))};
  assign wire209 = {$signed($signed(((wire204 ? (8'hb4) : wire203) ?
                           ((8'ha1) ? wire203 : wire206) : (|wire203)))),
                       ($unsigned((&$signed((8'hb2)))) ?
                           wire206[(3'h6):(3'h5)] : {(~&wire205)})};
  always
    @(posedge clk) begin
      reg210 <= wire205[(3'h5):(1'h1)];
    end
  assign wire211 = ((wire206[(2'h2):(2'h2)] <<< (reg210 ?
                           (wire204[(1'h0):(1'h0)] ?
                               (wire206 ?
                                   wire207 : wire208) : (reg210 ~^ reg210)) : $signed($signed(wire206)))) ?
                       ((!((~wire205) ?
                           (^~wire206) : {wire203,
                               (8'hae)})) >= $unsigned(((wire201 > wire205) != (reg210 ?
                           (7'h40) : wire206)))) : (wire203[(3'h5):(3'h5)] <<< $signed(wire204)));
  always
    @(posedge clk) begin
      reg212 <= {(&$signed((wire202[(4'hf):(1'h0)] && wire209)))};
      reg213 <= (~^((~&(~|wire201)) ?
          (&($signed(wire200) ?
              $signed(wire203) : ((8'hbb) ? wire208 : wire205))) : (((reg210 ?
                  wire201 : wire200) ?
              {wire205} : wire202[(3'h5):(3'h5)]) && $signed($signed(reg210)))));
      reg214 <= (~|$signed(($unsigned(reg210[(4'h9):(2'h2)]) ?
          $unsigned((wire202 | wire208)) : $unsigned((wire206 ?
              reg210 : wire208)))));
    end
  assign wire215 = $signed({wire209[(3'h4):(1'h1)], wire208});
  assign wire216 = {$unsigned($unsigned($unsigned($unsigned(wire202))))};
  assign wire217 = (+(+(~|reg213[(4'hb):(3'h6)])));
  assign wire218 = wire202[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg219 <= {{(+(^{reg212, wire200}))}};
      if ($unsigned(($unsigned((8'had)) ?
          wire217[(4'hb):(4'ha)] : (^~wire204[(2'h2):(1'h1)]))))
        begin
          reg220 <= wire208[(1'h1):(1'h1)];
          reg221 <= $signed(({wire205} ?
              $unsigned(reg213[(3'h6):(1'h1)]) : (^wire207[(4'hf):(4'hb)])));
          reg222 <= ($unsigned($signed(($signed(wire218) - (&wire216)))) != ({$unsigned((+reg220))} == $unsigned((^~$unsigned(wire216)))));
        end
      else
        begin
          if (($signed(reg213) ?
              $signed($signed($signed($signed(reg210)))) : $unsigned({((wire205 ?
                      reg210 : reg221) - {wire211, wire216})})))
            begin
              reg220 <= reg212[(4'ha):(4'h9)];
              reg221 <= wire205;
              reg222 <= $unsigned($unsigned({(|reg222[(3'h5):(2'h2)]),
                  reg214[(4'hb):(3'h7)]}));
              reg223 <= (($signed((!wire204[(1'h1):(1'h1)])) & {reg222[(3'h5):(1'h0)],
                      $signed(((7'h44) ? wire202 : (8'hb7)))}) ?
                  $unsigned(reg219[(3'h6):(3'h6)]) : (8'hba));
            end
          else
            begin
              reg220 <= $signed((-$unsigned(wire205[(1'h1):(1'h0)])));
              reg221 <= $signed($signed(((^$signed(wire207)) ^ wire200)));
              reg222 <= {(wire211[(1'h1):(1'h1)] ?
                      $unsigned(reg220[(2'h3):(2'h2)]) : $signed($unsigned((wire204 & wire216)))),
                  reg219};
              reg223 <= $unsigned((({reg220[(4'he):(2'h2)], $signed(wire208)} ?
                      ((reg223 ? wire202 : wire201) ?
                          reg214[(4'h9):(3'h6)] : wire216) : $unsigned((reg222 ?
                          wire207 : reg222))) ?
                  wire215 : ((((8'hbd) ? (7'h41) : (8'ha7)) ?
                      (wire205 ^~ wire205) : $unsigned((8'ha8))) <= (8'ha7))));
            end
          if ((wire217 ? (8'hb1) : $signed(wire200)))
            begin
              reg224 <= wire215;
              reg225 <= reg224[(3'h5):(2'h3)];
              reg226 <= $signed(((wire207[(4'hd):(4'ha)] ?
                  $signed(wire218) : ((|reg212) ^~ reg223[(3'h7):(2'h2)])) >> reg219[(3'h6):(2'h2)]));
            end
          else
            begin
              reg224 <= $unsigned(wire216);
              reg225 <= (wire216[(3'h4):(2'h2)] ?
                  (8'had) : wire209[(2'h2):(1'h0)]);
              reg226 <= ({$unsigned((~&{(8'hb5), reg226})),
                  ($unsigned((wire205 ?
                      wire208 : wire204)) ^ (reg224[(1'h1):(1'h1)] && $unsigned((8'hbc))))} <<< $unsigned($signed($signed((reg213 & reg219)))));
              reg227 <= reg222;
              reg228 <= {reg221,
                  $signed(($unsigned({wire206, (8'hbf)}) ?
                      ((wire205 <<< wire201) ?
                          wire217 : (~wire204)) : $signed((wire217 ?
                          wire204 : reg213))))};
            end
          reg229 <= (wire216[(1'h0):(1'h0)] <= (^~reg212[(3'h6):(3'h5)]));
        end
    end
  assign wire230 = ($unsigned((reg210[(3'h7):(1'h0)] ^ $signed((reg223 >>> wire211)))) ?
                       (reg224 ^ reg227) : $unsigned(reg224));
endmodule

module module162
#(parameter param194 = ((~{({(8'hab)} ? (7'h44) : ((8'h9e) * (8'hba))), (((8'hb0) >>> (8'ha9)) ? ((8'hb9) ? (8'hb7) : (7'h42)) : ((8'ha8) ^~ (8'hb9)))}) ? ((&(|(^~(8'ha6)))) ? (+(((8'haf) && (8'ha9)) - ((7'h41) ? (8'hbe) : (7'h42)))) : (-((~(8'hba)) ^ ((8'hba) >>> (8'hae))))) : (8'hb0)))
(y, clk, wire167, wire166, wire165, wire164, wire163);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire167;
  input wire [(3'h5):(1'h0)] wire166;
  input wire [(2'h3):(1'h0)] wire165;
  input wire signed [(5'h14):(1'h0)] wire164;
  input wire [(5'h14):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire193;
  wire [(4'h9):(1'h0)] wire192;
  wire signed [(4'hd):(1'h0)] wire191;
  wire signed [(2'h3):(1'h0)] wire190;
  wire [(3'h6):(1'h0)] wire189;
  wire signed [(5'h12):(1'h0)] wire188;
  wire [(5'h13):(1'h0)] wire187;
  wire [(4'he):(1'h0)] wire186;
  wire signed [(3'h6):(1'h0)] wire185;
  wire signed [(5'h14):(1'h0)] wire184;
  wire [(5'h10):(1'h0)] wire183;
  wire signed [(5'h13):(1'h0)] wire182;
  wire [(4'hc):(1'h0)] wire168;
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg178 = (1'h0);
  reg [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(5'h14):(1'h0)] reg173 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(4'he):(1'h0)] reg169 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire168,
                 reg181,
                 reg180,
                 reg179,
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
                 (1'h0)};
  assign wire168 = $unsigned($signed($signed((wire167[(5'h12):(3'h7)] ?
                       (7'h40) : wire163[(4'hf):(1'h1)]))));
  always
    @(posedge clk) begin
      if (($unsigned((((wire163 ?
              wire164 : wire165) << (^wire168)) || (wire166 < $unsigned(wire165)))) ?
          ((wire168[(1'h0):(1'h0)] ?
              {$signed(wire168)} : (~&wire165)) * (8'haa)) : $unsigned(wire167[(4'he):(1'h1)])))
        begin
          reg169 <= {{wire164,
                  (($signed(wire164) ?
                      $unsigned(wire168) : (wire166 ?
                          wire168 : (7'h41))) < $unsigned(wire165))},
              wire166[(3'h4):(2'h2)]};
          reg170 <= ($signed(wire168[(1'h0):(1'h0)]) >= $signed({$unsigned((~|wire164)),
              wire167}));
          reg171 <= (8'haf);
        end
      else
        begin
          reg169 <= $unsigned(wire168);
          reg170 <= ($signed(((~|wire163[(3'h7):(2'h2)]) || (8'hbe))) ?
              (^~(((wire168 ? wire168 : wire167) ?
                  $signed(wire163) : reg171[(3'h7):(1'h0)]) >= ($unsigned((8'hb6)) ?
                  reg170 : wire164[(3'h6):(1'h1)]))) : $unsigned(((!reg171[(4'ha):(3'h6)]) ^ $unsigned((^wire164)))));
        end
      if (((+(~&{wire168[(3'h7):(2'h2)], wire167})) | wire165[(1'h0):(1'h0)]))
        begin
          reg172 <= {($unsigned(wire168[(2'h2):(1'h0)]) ?
                  ({wire168,
                      wire166[(1'h0):(1'h0)]} | wire166[(1'h0):(1'h0)]) : (reg169[(1'h0):(1'h0)] ?
                      $signed($unsigned((7'h43))) : $signed(((8'had) ?
                          reg171 : wire166)))),
              (((~reg171) ?
                  wire168[(4'ha):(1'h1)] : $unsigned((reg169 ?
                      wire166 : wire166))) >> reg170[(1'h1):(1'h0)])};
          reg173 <= (($signed(wire163) & (($unsigned(reg170) ^~ (^~wire167)) <= {$unsigned(reg172)})) + $unsigned(reg172));
        end
      else
        begin
          if (({(($unsigned(wire165) && (wire163 ? (8'hba) : wire166)) ?
                      wire166 : (((8'hb4) ?
                          reg173 : wire164) ^~ $signed(reg172)))} ?
              $unsigned(($unsigned((reg170 ? wire168 : wire163)) ?
                  ($signed(wire164) ?
                      $signed((8'hba)) : (~^wire164)) : $signed($signed(wire166)))) : wire166[(3'h5):(3'h5)]))
            begin
              reg172 <= reg172[(4'h8):(3'h5)];
              reg173 <= {(reg171 <<< $signed((~&(reg173 <<< wire164)))),
                  $signed($unsigned(({reg169} ?
                      (wire165 ? reg171 : reg171) : (reg172 ?
                          wire163 : (8'hab)))))};
              reg174 <= $unsigned((~^$unsigned(wire163[(5'h12):(4'he)])));
              reg175 <= {$unsigned((&$signed($signed(wire166))))};
            end
          else
            begin
              reg172 <= reg172;
            end
          reg176 <= $unsigned((^~$signed((|{wire166, (7'h42)}))));
          if ((reg176 || reg173[(2'h3):(1'h1)]))
            begin
              reg177 <= (&reg173);
            end
          else
            begin
              reg177 <= reg176;
            end
          reg178 <= {{(-reg170)},
              (($unsigned($signed(wire165)) & $unsigned((-wire164))) ?
                  wire165 : $unsigned((reg169[(4'he):(4'hb)] ^~ reg172[(3'h5):(3'h5)])))};
        end
      reg179 <= ((~(($unsigned(reg171) * {reg171,
          wire164}) == wire164[(4'he):(3'h7)])) <<< ((+{(reg174 ?
                  reg178 : (8'ha1))}) ?
          (wire168 ?
              wire167[(4'hb):(3'h4)] : reg177[(5'h12):(4'ha)]) : ({$unsigned(reg173),
              (8'hbf)} < $unsigned($signed(reg170)))));
      if ((8'had))
        begin
          reg180 <= $unsigned((({((8'hbf) >= wire164)} | (reg178 ?
              $signed((8'hb0)) : $signed(wire167))) * reg169[(1'h0):(1'h0)]));
          reg181 <= {{$unsigned((wire164 >> {reg177, reg177})),
                  reg171[(3'h6):(1'h1)]},
              ($unsigned({$signed((8'hbb)), {reg169}}) ?
                  reg176 : reg174[(5'h10):(4'h8)])};
        end
      else
        begin
          reg180 <= (^~$unsigned((~&$signed((wire167 < (8'hb6))))));
        end
    end
  assign wire182 = (reg175[(2'h2):(1'h1)] >= (wire166 ? wire165 : (8'ha7)));
  assign wire183 = reg169[(4'h9):(3'h6)];
  assign wire184 = ((~&(8'haa)) ^ (8'ha1));
  assign wire185 = $signed($unsigned(reg173));
  assign wire186 = ($unsigned(($signed((reg176 ? wire168 : wire184)) ?
                       ({(8'hb1)} ?
                           wire182 : (wire185 ?
                               (8'h9d) : wire168)) : $unsigned(reg169[(4'hd):(2'h2)]))) >= $signed(reg171));
  assign wire187 = reg177[(4'h8):(3'h4)];
  assign wire188 = (-wire165);
  assign wire189 = ({(&reg177),
                       (|((reg181 >> (8'ha0)) <<< ((7'h41) ?
                           reg173 : reg178)))} >> $signed((^wire165[(1'h1):(1'h1)])));
  assign wire190 = wire163[(5'h12):(4'ha)];
  assign wire191 = reg179;
  assign wire192 = wire186[(4'he):(4'ha)];
  assign wire193 = ($unsigned(((~^{wire165}) <<< (reg178 & {wire166}))) | (wire190 <= reg172));
endmodule

module module127  (y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire132;
  input wire signed [(3'h5):(1'h0)] wire131;
  input wire signed [(3'h5):(1'h0)] wire130;
  input wire [(4'hb):(1'h0)] wire129;
  input wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(4'hc):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire155;
  wire signed [(4'h8):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire136;
  wire signed [(3'h7):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire133;
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire154,
                 wire153,
                 wire149,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg156,
                 reg152,
                 reg151,
                 reg150,
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
                 (1'h0)};
  assign wire133 = (({(-$unsigned(wire128))} >= wire130[(3'h4):(3'h4)]) >= $signed(($unsigned($signed(wire128)) <<< ($signed(wire131) <<< $unsigned(wire130)))));
  assign wire134 = ((((wire131 & (7'h40)) ^ ((wire130 ^ wire129) != wire130[(2'h2):(1'h1)])) ?
                           (wire129 >> $signed(wire129)) : {$signed(wire131)}) ?
                       $unsigned({$signed(wire130)}) : wire129[(2'h2):(1'h0)]);
  assign wire135 = $signed($signed((!wire131[(1'h0):(1'h0)])));
  assign wire136 = wire135;
  always
    @(posedge clk) begin
      reg137 <= {{{(~^{wire135, wire135}),
                  ((wire133 ? wire133 : wire133) - (wire134 ?
                      wire135 : wire135))}},
          ((~^(~^wire135)) & {$signed((~^wire130))})};
      if (wire135)
        begin
          reg138 <= wire133[(3'h7):(3'h5)];
        end
      else
        begin
          reg138 <= (wire131[(1'h0):(1'h0)] || {(~|($signed(wire132) ?
                  $unsigned(wire132) : $unsigned(wire134)))});
        end
      reg139 <= reg138[(2'h3):(1'h0)];
      reg140 <= $signed($signed((^~{(^wire135)})));
      if (($signed($signed(($unsigned(wire133) ?
              $unsigned((8'hb2)) : (wire132 + (8'ha0))))) ?
          wire130 : (8'hb1)))
        begin
          if ($signed($signed((wire133[(4'hc):(4'h9)] ?
              ((wire135 <<< (8'hbc)) ^ wire128) : {(wire128 >= wire130),
                  wire135}))))
            begin
              reg141 <= ({(|reg140[(3'h7):(3'h7)]),
                  (wire131[(1'h0):(1'h0)] ?
                      ((reg139 <= (8'hbd)) >>> wire128[(4'h8):(2'h3)]) : reg138[(2'h2):(2'h2)])} >= ($unsigned({wire136}) ?
                  $signed($signed((wire128 && wire135))) : (!(wire134[(3'h4):(1'h0)] == reg139))));
              reg142 <= {((&wire135) >>> reg139[(3'h6):(3'h5)]),
                  $signed($unsigned(($unsigned((8'hbe)) ? reg141 : wire128)))};
            end
          else
            begin
              reg141 <= ((reg138[(2'h2):(2'h2)] << {(~|(wire135 <<< (8'ha7))),
                  $signed(wire136)}) << $signed((8'hb3)));
              reg142 <= $signed((reg138 <<< $signed($signed((+wire128)))));
              reg143 <= (^~wire132);
              reg144 <= wire131[(1'h0):(1'h0)];
              reg145 <= {wire135[(3'h5):(1'h0)], (|wire129[(3'h4):(3'h4)])};
            end
          if ($unsigned(($unsigned($signed((wire130 * wire134))) ?
              ((reg140[(3'h7):(3'h5)] ?
                      reg144[(2'h3):(1'h0)] : ((8'hac) ? wire132 : reg138)) ?
                  $signed($unsigned((8'ha7))) : $signed((reg138 ^ reg141))) : $signed($signed((reg144 ^~ wire130))))))
            begin
              reg146 <= ($signed($signed($unsigned(wire136))) || (~&$signed(wire132[(4'h9):(1'h1)])));
              reg147 <= reg144;
              reg148 <= $unsigned({wire132[(1'h0):(1'h0)],
                  {wire134[(1'h0):(1'h0)], wire132}});
            end
          else
            begin
              reg146 <= ($unsigned({reg143[(4'hd):(3'h6)]}) ?
                  (((reg146[(4'he):(4'ha)] ?
                              $signed((7'h40)) : reg139[(3'h5):(2'h3)]) ?
                          $signed(reg140[(2'h2):(1'h1)]) : $signed($unsigned((8'hbc)))) ?
                      (+wire132) : $signed(reg140[(3'h5):(2'h2)])) : $unsigned($unsigned($unsigned($unsigned(reg139)))));
            end
        end
      else
        begin
          reg141 <= (wire134[(4'hb):(2'h2)] >>> $unsigned($unsigned(($unsigned(wire134) ?
              $signed((8'haa)) : reg141))));
          reg142 <= reg138[(1'h0):(1'h0)];
          if (wire136[(3'h5):(1'h1)])
            begin
              reg143 <= $unsigned($unsigned((~^wire134)));
            end
          else
            begin
              reg143 <= $unsigned((reg148[(4'h9):(3'h5)] != (-{reg140,
                  {reg145}})));
              reg144 <= $signed(reg139);
            end
        end
    end
  assign wire149 = reg142[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg150 <= (~(reg148[(1'h1):(1'h1)] ?
          {(wire136[(1'h0):(1'h0)] == (wire134 >> reg137)),
              wire135[(1'h0):(1'h0)]} : wire128[(4'h8):(1'h1)]));
      reg151 <= $unsigned(wire134[(4'h9):(3'h5)]);
      reg152 <= (reg139[(3'h5):(2'h3)] ?
          (reg148[(3'h6):(3'h4)] ?
              (&{$signed(reg145),
                  $signed(reg147)}) : {wire128[(1'h0):(1'h0)]}) : reg140);
    end
  assign wire153 = reg144;
  assign wire154 = (reg151 ?
                       $unsigned({$signed((reg143 ? (8'ha2) : (8'hb4))),
                           reg150}) : wire134[(4'h8):(3'h5)]);
  assign wire155 = wire135[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg156 <= (wire153 & wire130);
    end
  assign wire157 = {wire135[(1'h0):(1'h0)]};
  assign wire158 = wire131;
  assign wire159 = wire133;
endmodule

module module90
#(parameter param122 = ((&(~|(7'h42))) || ((8'h9e) ? {((~&(7'h42)) ~^ (&(8'hb7)))} : (|{(|(8'had)), ((8'hb8) ? (8'ha7) : (8'hb6))}))), 
parameter param123 = (8'hbb))
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire95;
  input wire signed [(5'h14):(1'h0)] wire94;
  input wire [(4'he):(1'h0)] wire93;
  input wire signed [(2'h2):(1'h0)] wire92;
  input wire signed [(4'h9):(1'h0)] wire91;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire108,
                 wire107,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg96 <= {wire92[(1'h0):(1'h0)]};
      if ((+$unsigned($unsigned(wire92))))
        begin
          reg97 <= wire92;
          if ((~|$signed(wire91[(3'h5):(3'h5)])))
            begin
              reg98 <= $unsigned(($signed(wire94) ?
                  reg97 : $signed({$signed((8'ha1)), reg97[(2'h3):(1'h1)]})));
              reg99 <= wire92;
            end
          else
            begin
              reg98 <= (~wire92[(1'h0):(1'h0)]);
            end
          reg100 <= (($signed((8'haa)) ?
              $unsigned({reg97}) : wire95) == $signed(wire94[(3'h4):(1'h1)]));
        end
      else
        begin
          if ($signed((reg100 ? (~&$signed((wire93 || wire93))) : wire94)))
            begin
              reg97 <= reg99;
              reg98 <= $signed(reg97[(4'h8):(1'h1)]);
            end
          else
            begin
              reg97 <= wire94[(3'h7):(3'h7)];
              reg98 <= {$unsigned($unsigned($signed((wire91 ?
                      reg97 : wire92)))),
                  reg97[(3'h7):(3'h4)]};
              reg99 <= (({$unsigned({reg97, reg96}),
                      $signed(wire91[(4'h8):(3'h5)])} <= (wire93[(4'h9):(3'h5)] ?
                      (reg99 ^~ {wire95}) : $unsigned((!wire91)))) ?
                  $unsigned(((-(-reg97)) ?
                      wire95 : $signed((&wire95)))) : ($signed(reg100[(1'h0):(1'h0)]) ?
                      wire93 : (8'ha8)));
              reg100 <= (&(($unsigned((~&reg99)) << $unsigned((+reg100))) < reg99));
            end
          if ({$signed($signed(reg99)),
              $signed((wire91[(2'h2):(1'h0)] == ({reg98} ?
                  ((8'hac) ? (8'ha1) : (8'ha9)) : (~wire91))))})
            begin
              reg101 <= $signed(wire92[(1'h1):(1'h0)]);
              reg102 <= wire91;
              reg103 <= (reg96 | (~($signed((~&(8'haa))) + (wire94[(4'hb):(3'h6)] ?
                  (reg102 ? (8'hae) : reg97) : reg99))));
              reg104 <= wire91;
            end
          else
            begin
              reg101 <= wire92[(1'h1):(1'h1)];
              reg102 <= $unsigned($unsigned(wire95));
              reg103 <= (reg102 ?
                  (&$signed((~|$signed(wire91)))) : {wire92,
                      ($unsigned($signed(reg99)) << $unsigned(reg100))});
              reg104 <= (|(^~reg97));
              reg105 <= (-reg101);
            end
          if ({((reg101[(4'h8):(3'h7)] ?
                      ((reg100 ^~ wire94) >> $signed(wire93)) : $signed((&reg97))) ?
                  reg98 : {((+reg102) ?
                          wire95[(2'h2):(1'h0)] : (wire94 >> wire93))}),
              (wire94[(5'h13):(4'hb)] ?
                  {$unsigned((8'ha2))} : (&wire94[(5'h11):(3'h6)]))})
            begin
              reg106 <= (^~(8'hb0));
            end
          else
            begin
              reg106 <= {(^$unsigned((~|(^reg101)))), wire92[(1'h0):(1'h0)]};
            end
        end
    end
  assign wire107 = reg104;
  assign wire108 = {{((&(~reg97)) ? {{reg99, reg100}} : reg104),
                           $signed(reg105)}};
  always
    @(posedge clk) begin
      if (reg98[(4'hb):(4'h9)])
        begin
          if (reg100)
            begin
              reg109 <= $signed($unsigned(((!((8'h9c) ?
                  wire95 : reg106)) || ($signed(wire91) ?
                  (-(8'hb4)) : $unsigned(reg106)))));
              reg110 <= wire92[(1'h1):(1'h0)];
              reg111 <= {$unsigned($signed($signed(reg98))),
                  $unsigned($signed($signed((reg102 <<< (8'hae)))))};
              reg112 <= reg100[(2'h3):(1'h0)];
              reg113 <= ((wire93[(4'hc):(3'h7)] & wire108) >> (!reg101[(4'hd):(4'hb)]));
            end
          else
            begin
              reg109 <= (reg97[(4'h8):(1'h0)] ?
                  ($unsigned($unsigned((|reg96))) | wire91[(4'h9):(3'h6)]) : $signed($unsigned($signed({reg97,
                      wire92}))));
              reg110 <= (reg105 == $signed(wire92[(1'h0):(1'h0)]));
            end
          reg114 <= ((+reg101[(3'h5):(1'h1)]) != (+({$signed(wire107)} ?
              $unsigned($unsigned(reg96)) : $unsigned((reg103 >>> wire92)))));
        end
      else
        begin
          if ((~^(8'hb4)))
            begin
              reg109 <= {((-reg106[(4'hb):(4'ha)]) ?
                      ((8'ha4) + $unsigned($signed(wire93))) : $unsigned({$signed(wire108)}))};
              reg110 <= {$signed($signed(((+wire93) ?
                      wire95 : (wire94 ? reg104 : wire108))))};
              reg111 <= (({$signed($unsigned(wire94)), reg106} ?
                      reg106 : $signed((reg113[(4'h8):(3'h7)] ?
                          (&(8'haa)) : reg114[(2'h2):(2'h2)]))) ?
                  (~|(~&$unsigned((wire93 ?
                      reg113 : reg112)))) : $signed(reg112[(3'h6):(2'h2)]));
              reg112 <= ((reg114 ? wire91[(2'h2):(1'h1)] : $signed(reg96)) ?
                  {({reg100} ?
                          reg109[(3'h7):(3'h6)] : (~|(reg100 ?
                              (7'h43) : reg114))),
                      (reg110[(4'hd):(4'ha)] < $unsigned($signed(reg109)))} : (~|reg109));
              reg113 <= ($signed($unsigned(reg112[(1'h0):(1'h0)])) ?
                  $signed((|(+(wire94 ? reg102 : wire108)))) : {((reg105 ?
                          $unsigned(reg114) : reg114) & $signed({(8'hae),
                          reg100}))});
            end
          else
            begin
              reg109 <= (wire95 ?
                  $signed({$signed(reg111),
                      reg100[(1'h1):(1'h1)]}) : ({(8'ha5)} ?
                      (~$signed((wire92 ? (8'ha3) : reg102))) : (~(&reg97))));
            end
          reg114 <= ((reg109[(2'h2):(1'h0)] ^~ $unsigned($signed(reg99))) ?
              $signed($unsigned((wire91[(3'h7):(3'h6)] >> {reg97}))) : ($signed($unsigned((+(8'hb4)))) ?
                  reg111 : $unsigned((8'ha2))));
        end
      reg115 <= $unsigned((wire92 ? $signed(reg111[(2'h2):(2'h2)]) : reg101));
      reg116 <= (+(-wire93[(4'h8):(3'h6)]));
    end
  assign wire117 = $signed($unsigned({reg111,
                       $signed((wire94 ? (8'hba) : wire107))}));
  assign wire118 = reg116;
  assign wire119 = $unsigned((-$unsigned(reg98)));
  assign wire120 = (($unsigned($unsigned(reg109[(1'h0):(1'h0)])) ?
                       (~^wire119[(3'h5):(3'h4)]) : wire117) <<< (~wire119[(2'h3):(1'h0)]));
  assign wire121 = $signed({reg102[(4'ha):(2'h2)],
                       (reg103[(4'hd):(3'h4)] >> (~reg103[(2'h3):(1'h0)]))});
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire71;
  input wire [(4'hf):(1'h0)] wire70;
  input wire [(4'hb):(1'h0)] wire69;
  input wire [(4'ha):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 (1'h0)};
  assign wire72 = $signed($signed($unsigned($unsigned((wire70 ?
                      (8'hbf) : wire71)))));
  assign wire73 = (!($signed((!(^wire72))) >= wire71[(3'h4):(1'h1)]));
  assign wire74 = (wire71 ^~ $unsigned($unsigned($unsigned($signed(wire70)))));
  assign wire75 = $signed($signed(wire72[(3'h6):(3'h4)]));
  assign wire76 = $signed(wire70);
  assign wire77 = wire74[(4'h9):(3'h6)];
  assign wire78 = wire68;
  assign wire79 = (|(wire74[(2'h3):(1'h1)] > {{(^~wire77),
                          wire70[(4'ha):(3'h6)]}}));
  assign wire80 = ({$unsigned($unsigned(wire79[(3'h7):(1'h0)])),
                          $signed($unsigned($signed(wire69)))} ?
                      (8'hb8) : $unsigned(($signed((wire77 ?
                          wire76 : wire70)) >> (wire79 >>> $unsigned(wire79)))));
  assign wire81 = $signed($signed(((~wire70) <<< ($unsigned((8'ha6)) ?
                      (wire73 <= wire73) : (wire77 ? wire74 : wire72)))));
endmodule
