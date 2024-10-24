module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire211;
  wire signed [(5'h12):(1'h0)] wire210;
  wire [(3'h4):(1'h0)] wire206;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire208;
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  assign y = {wire211,
                 wire210,
                 wire206,
                 wire55,
                 wire51,
                 wire49,
                 wire22,
                 wire21,
                 wire208,
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
                 reg52,
                 reg53,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed($signed($unsigned(($unsigned(wire1) << $unsigned((7'h41))))));
      reg6 <= ($unsigned($signed(wire4)) ^~ $signed($unsigned(((reg5 >= wire2) ?
          reg5 : (!wire2)))));
      if ({(~|$signed(wire3))})
        begin
          reg7 <= ((|(wire2 << wire1[(1'h0):(1'h0)])) ?
              ($signed(wire2[(3'h5):(3'h5)]) ?
                  wire4[(3'h6):(3'h4)] : $signed((~|(wire1 & reg5)))) : (&(reg5 <<< (!$unsigned(reg5)))));
          if (((!(((|wire1) ? ((8'hba) ^ (8'ha2)) : (^(8'hba))) ?
              (|((8'ha2) ? wire1 : wire3)) : ((|(8'ha5)) ?
                  reg7 : {wire0}))) != wire4[(4'he):(4'hb)]))
            begin
              reg8 <= $unsigned((~|$unsigned((|$signed(reg6)))));
              reg9 <= ($unsigned($signed(($signed(wire4) ?
                  wire4[(5'h13):(2'h3)] : {wire4}))) ^ wire4[(4'h9):(4'h8)]);
              reg10 <= reg7[(5'h10):(3'h6)];
              reg11 <= (-reg8[(3'h4):(3'h4)]);
              reg12 <= wire3[(2'h2):(1'h1)];
            end
          else
            begin
              reg8 <= (((($unsigned((8'ha7)) ?
                          $signed((8'h9d)) : {reg8, reg11}) ?
                      ((reg6 ?
                          wire0 : (8'hbe)) ~^ (wire3 | reg10)) : $unsigned({(8'haf),
                          reg9})) ?
                  ((^(~&reg7)) ?
                      (reg9 | $signed((7'h43))) : $unsigned(reg11[(4'h8):(1'h1)])) : reg12[(3'h5):(3'h5)]) <<< $unsigned((reg9[(2'h3):(1'h0)] ?
                  $signed($signed(reg9)) : $unsigned((+wire1)))));
              reg9 <= ((({$signed(reg11)} & wire3[(3'h6):(3'h6)]) ?
                  (({wire4} <= reg8[(1'h1):(1'h1)]) && $signed(reg10[(3'h4):(1'h1)])) : ($signed((reg5 ?
                      reg6 : reg11)) ^ wire3[(3'h7):(1'h0)])) || (7'h44));
              reg10 <= (wire3 ? reg6[(2'h3):(2'h2)] : $unsigned(wire1));
              reg11 <= wire0[(5'h11):(4'hf)];
            end
          if (wire0)
            begin
              reg13 <= (reg8[(2'h2):(1'h1)] > (~^(-$unsigned($signed(reg12)))));
              reg14 <= ((wire3[(1'h1):(1'h1)] > (-reg5)) ?
                  (+wire4[(1'h0):(1'h0)]) : (wire3 ~^ $unsigned(((+wire1) ?
                      (wire0 ? wire0 : reg6) : wire3))));
              reg15 <= reg5;
              reg16 <= $signed((7'h43));
            end
          else
            begin
              reg13 <= wire3[(4'h8):(3'h5)];
            end
        end
      else
        begin
          if (({(!(|(wire3 ? reg8 : wire4))),
              {wire4[(5'h12):(3'h6)]}} <<< wire0))
            begin
              reg7 <= reg13[(3'h6):(3'h4)];
              reg8 <= wire4;
            end
          else
            begin
              reg7 <= $signed({wire3[(4'ha):(3'h5)],
                  $signed(((reg13 - reg9) > wire0))});
              reg8 <= ((8'ha1) ?
                  ((reg5[(2'h3):(1'h1)] >= (~|(^~wire1))) ?
                      $signed($signed($unsigned(reg5))) : ($unsigned((reg10 ?
                          reg16 : reg9)) >= wire3[(4'ha):(1'h1)])) : (&(8'hb6)));
              reg9 <= reg7[(1'h0):(1'h0)];
            end
          if (reg12[(3'h7):(1'h1)])
            begin
              reg10 <= reg10[(4'ha):(2'h2)];
              reg11 <= $signed((8'ha3));
            end
          else
            begin
              reg10 <= $unsigned(($unsigned(((reg15 ? wire3 : reg10) ?
                  (reg16 ^ wire4) : (~^reg9))) + reg9));
              reg11 <= $unsigned($signed((((reg15 ^~ wire2) ~^ (reg11 ?
                  (8'hb8) : (8'h9e))) && reg11[(4'he):(1'h0)])));
              reg12 <= ($signed($signed(((reg13 - reg5) & $unsigned(reg5)))) == (~$signed(reg10)));
              reg13 <= ($unsigned((~|reg8[(1'h0):(1'h0)])) ?
                  reg12 : ((8'haf) << ((wire4[(4'hc):(4'ha)] | wire2[(2'h3):(1'h1)]) << reg12)));
            end
          if (($unsigned(wire3) <<< $unsigned((~|$unsigned((~reg14))))))
            begin
              reg14 <= wire1;
              reg15 <= (reg16 == (8'hba));
            end
          else
            begin
              reg14 <= (8'ha9);
            end
          if ((reg5 & reg14[(1'h1):(1'h0)]))
            begin
              reg16 <= reg13[(2'h3):(1'h1)];
              reg17 <= ({$signed($unsigned((wire2 ? reg9 : wire4))),
                      (&$signed(reg8[(3'h4):(1'h1)]))} ?
                  wire0[(2'h2):(1'h0)] : (|{$unsigned({wire0, (8'ha1)}),
                      $signed((wire3 ? reg8 : wire4))}));
              reg18 <= ((((&reg13) + $signed(reg6[(4'h9):(3'h4)])) <= reg13) << (+reg11));
              reg19 <= wire3;
            end
          else
            begin
              reg16 <= reg15[(2'h2):(1'h1)];
              reg17 <= (reg7 <= (reg19 ? wire4[(3'h7):(1'h0)] : reg11));
              reg18 <= (+({reg14[(3'h5):(3'h4)],
                  (((7'h42) ?
                      reg17 : reg16) <<< $signed(reg9))} - (((reg5 >> reg17) ?
                      reg15[(2'h2):(1'h1)] : (8'hb3)) ?
                  (&{reg19, (8'ha6)}) : reg13)));
            end
        end
      reg20 <= ($unsigned((($signed(reg11) << (8'h9c)) <<< (|(reg19 ?
              wire1 : reg5)))) ?
          wire1 : reg15);
    end
  assign wire21 = ((reg18[(1'h0):(1'h0)] ? reg16 : reg12[(4'h9):(4'h9)]) ?
                      reg5[(2'h2):(1'h1)] : ($signed(reg6[(2'h3):(1'h0)]) ?
                          (reg5[(1'h0):(1'h0)] ?
                              (8'ha7) : (~&$unsigned(wire1))) : $signed((-reg19[(4'hb):(4'ha)]))));
  assign wire22 = wire1;
  module23 #() modinst50 (.clk(clk), .wire24(reg13), .wire25(wire0), .wire26(wire2), .wire27(reg19), .y(wire49));
  assign wire51 = (&(^~(($unsigned((8'hb9)) ? (~|reg8) : (reg5 >> wire1)) ?
                      (reg14[(4'h9):(1'h1)] ?
                          {(8'haf), (8'hbc)} : {reg11, wire49}) : reg7)));
  always
    @(posedge clk) begin
      reg52 <= (reg12 ?
          {wire51, (!wire3[(4'ha):(1'h1)])} : reg13[(4'hb):(4'hb)]);
      reg53 <= (reg17 ?
          $signed(reg8) : {(reg11[(4'hd):(4'hc)] ^ $signed($signed((8'hbe))))});
      reg54 <= ((~&((&(wire4 ? wire51 : reg16)) ?
              (reg18 ^ $signed(reg7)) : reg18[(4'h9):(4'h8)])) ?
          reg12[(3'h7):(2'h3)] : wire4[(3'h5):(1'h1)]);
    end
  assign wire55 = (reg6 != {($unsigned($unsigned(reg54)) | ((reg10 << reg18) ?
                          (reg5 << reg19) : reg8[(1'h0):(1'h0)])),
                      $signed((8'ha3))});
  module56 #() modinst207 (.wire60(wire2), .wire59(reg14), .wire57(reg12), .clk(clk), .wire58(reg8), .y(wire206));
  module23 #() modinst209 (wire208, clk, reg14, reg13, reg16, wire3);
  assign wire210 = wire3;
  module169 #() modinst212 (wire211, clk, reg5, reg15, wire1, reg17, wire208);
endmodule

module module56
#(parameter param205 = (^~((&{((8'hbd) ? (8'haa) : (8'h9f)), (+(8'hab))}) ? {(~^((8'hbf) ? (8'ha2) : (7'h44))), ({(8'hbc), (8'h9f)} < (~&(8'ha2)))} : {(+((8'hbe) ? (8'ha5) : (8'hac))), (^~(^~(8'ha2)))})))
(y, clk, wire57, wire58, wire59, wire60);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire57;
  input wire signed [(5'h10):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire59;
  input wire signed [(4'hd):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire158;
  wire [(3'h7):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire168;
  wire signed [(4'he):(1'h0)] wire203;
  reg [(5'h10):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg165 = (1'h0);
  reg [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  assign y = {wire65,
                 wire66,
                 wire67,
                 wire99,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire107,
                 wire108,
                 wire155,
                 wire157,
                 wire158,
                 wire167,
                 wire168,
                 wire203,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg106,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg61 <= ({(($unsigned(wire58) >>> $signed(wire58)) ?
                  wire60[(4'hd):(1'h1)] : $unsigned(((7'h40) ?
                      wire57 : wire60))),
              $unsigned(($unsigned(wire58) ?
                  $signed(wire60) : ((8'hac) ? (8'haa) : wire60)))} ?
          wire58[(4'hd):(1'h0)] : $signed($unsigned(wire57[(1'h0):(1'h0)])));
      reg62 <= wire60[(1'h1):(1'h0)];
      reg63 <= reg61;
      reg64 <= wire57;
    end
  assign wire65 = (reg61 ? $signed(wire57[(4'h9):(4'h9)]) : (reg64 ^~ reg61));
  assign wire66 = (-reg62);
  assign wire67 = wire58;
  module68 #() modinst100 (wire99, clk, wire65, wire57, reg61, reg63);
  assign wire101 = {(-$signed((~|$unsigned(wire59)))),
                       $signed((wire99 >= wire58[(1'h1):(1'h1)]))};
  assign wire102 = {(8'hae)};
  assign wire103 = ((reg64[(1'h1):(1'h1)] >= wire67) ?
                       (~^$signed(wire101[(4'ha):(4'ha)])) : wire59);
  assign wire104 = (((wire102[(4'h8):(2'h2)] ?
                           (reg61 * (wire99 ? reg64 : wire66)) : wire58) ?
                       (wire58[(3'h4):(2'h2)] >= (|$unsigned((7'h44)))) : (($unsigned(reg64) ?
                               {wire102} : (~^(8'hae))) ?
                           $unsigned(wire65) : $signed((wire65 ?
                               wire65 : wire67)))) ~^ ((^$signed($unsigned(wire59))) ?
                       ($unsigned((~wire58)) ?
                           ({wire59} > wire58[(4'hc):(4'ha)]) : ($unsigned(wire60) << reg61[(2'h2):(1'h1)])) : ((reg64 >> $unsigned((8'hb7))) ~^ ((wire67 ?
                               reg62 : wire60) ?
                           wire59[(4'hd):(2'h3)] : (^reg64)))));
  assign wire105 = $signed($unsigned(wire59[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg106 <= $signed((wire65[(4'h9):(4'h8)] < wire66));
    end
  assign wire107 = ($signed($signed((~|wire103))) | (($signed((wire104 << wire65)) ?
                           $signed({reg106}) : ((wire59 ?
                               reg62 : wire101) ~^ $unsigned(wire57))) ?
                       reg106[(2'h2):(1'h0)] : reg106[(1'h1):(1'h1)]));
  assign wire108 = ($signed((~|(reg62 ?
                       (|wire99) : wire105))) <<< wire99[(4'hf):(3'h7)]);
  module109 #() modinst156 (.wire111(wire66), .wire112(wire57), .y(wire155), .wire114(wire101), .wire110(reg63), .clk(clk), .wire113(wire104));
  assign wire157 = (wire104[(4'he):(3'h4)] ?
                       (~|({(reg63 || wire103),
                           wire101} < (~|$signed(wire60)))) : (+{wire67[(4'hb):(2'h2)],
                           {$signed(reg63)}}));
  assign wire158 = {wire58[(4'hc):(3'h7)], wire66[(4'hb):(3'h4)]};
  always
    @(posedge clk) begin
      if ($unsigned((wire105[(4'hf):(1'h0)] ?
          wire103[(3'h4):(1'h0)] : $signed($unsigned((!reg61))))))
        begin
          reg159 <= $signed($unsigned($signed((~|$signed(wire103)))));
          reg160 <= reg61;
        end
      else
        begin
          reg159 <= reg64[(1'h1):(1'h1)];
          if ($unsigned($unsigned($signed(((wire104 ? wire103 : (8'hbc)) ?
              (wire58 ? reg64 : reg106) : (wire65 ? wire60 : wire158))))))
            begin
              reg160 <= reg106;
              reg161 <= (7'h41);
              reg162 <= reg161[(3'h7):(3'h6)];
            end
          else
            begin
              reg160 <= wire104;
              reg161 <= ($unsigned((!($unsigned(reg62) == wire57[(3'h7):(2'h3)]))) ?
                  $signed(reg159[(2'h2):(1'h0)]) : $signed(reg161[(4'h9):(3'h5)]));
              reg162 <= (-(8'hb6));
            end
        end
      reg163 <= wire104[(3'h7):(1'h1)];
      reg164 <= (reg63 & wire65);
      reg165 <= wire57[(3'h5):(1'h0)];
      reg166 <= $signed((&$signed(reg162)));
    end
  assign wire167 = {(reg163[(2'h2):(1'h1)] ? wire158[(4'h8):(3'h6)] : wire57)};
  assign wire168 = wire158[(2'h2):(1'h0)];
  module169 #() modinst204 (wire203, clk, wire59, reg63, wire102, reg163, wire58);
endmodule

module module23
#(parameter param47 = ((~&(({(8'hb4), (8'hbf)} ? ((8'had) ? (8'h9f) : (8'had)) : {(8'hab)}) | (~|((8'h9d) ? (8'hbc) : (8'hb3))))) && (((~^((8'ha7) <= (8'had))) + (((7'h43) ? (7'h42) : (8'h9c)) ? ((8'hbe) && (8'hb5)) : {(8'ha4)})) ? (((~|(8'hbd)) ? ((8'hb7) ^ (8'h9d)) : ((8'h9e) <= (7'h43))) ? (^(^(8'ha5))) : ((^(7'h41)) ? ((8'ha7) ? (8'hb9) : (8'ha5)) : ((8'h9e) ^ (8'hac)))) : (^(((7'h44) && (8'hbf)) & (~^(8'ha7)))))), 
parameter param48 = ({({param47} ^~ (|(param47 || param47))), (~|((param47 ? param47 : param47) ? (-param47) : (-param47)))} ? (-((~param47) != (param47 ? param47 : (param47 ? param47 : param47)))) : (|param47)))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire26;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire28;
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire28,
                 reg46,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire28 = wire27[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg29 <= $unsigned(({$unsigned(wire25[(2'h2):(1'h0)])} <<< (+$signed((wire27 >= wire26)))));
      reg30 <= ((-(((!wire25) ? wire26[(4'h8):(2'h3)] : $unsigned(wire25)) ?
              (^$unsigned(wire24)) : $signed((wire25 || wire25)))) ?
          (({(^wire25)} ?
              {(~&wire25)} : {(~wire24),
                  ((8'hbc) << reg29)}) - (+wire25)) : {wire26[(3'h4):(2'h3)],
              $unsigned($unsigned((8'hb5)))});
      reg31 <= {((((wire24 ? wire27 : wire27) ?
              $signed(wire25) : {reg29}) > {reg29}) <= ($unsigned((wire26 ?
                  wire24 : wire25)) ?
              wire26 : reg30[(1'h0):(1'h0)]))};
      reg32 <= $signed(reg30[(1'h1):(1'h1)]);
      if (($unsigned($signed((((8'hb4) == reg32) ?
          (reg30 * (8'hab)) : $unsigned(wire28)))) ^ $unsigned($unsigned(reg32[(2'h3):(1'h0)]))))
        begin
          reg33 <= ($signed((wire24[(4'hb):(3'h4)] >> {(~wire26)})) & reg29);
          reg34 <= (~$signed((+wire28[(4'h8):(1'h1)])));
          reg35 <= (^$unsigned((($unsigned(reg31) >> reg30[(2'h2):(2'h2)]) <<< reg33)));
        end
      else
        begin
          if ($unsigned($unsigned(((8'hb3) >>> reg29[(3'h7):(2'h2)]))))
            begin
              reg33 <= $unsigned((wire24 >>> (|(+wire28[(3'h6):(1'h1)]))));
              reg34 <= reg33;
              reg35 <= ((wire24 ? reg29[(4'h8):(2'h3)] : reg30) ?
                  (|reg35[(3'h6):(3'h5)]) : {reg29[(1'h1):(1'h1)], reg31});
              reg36 <= $unsigned($signed($unsigned((^~$unsigned(reg32)))));
              reg37 <= ($unsigned($unsigned($signed(wire24[(2'h3):(2'h2)]))) >> reg32);
            end
          else
            begin
              reg33 <= (~|$unsigned($signed((&$signed(wire24)))));
              reg34 <= ($signed(wire27) ^~ {$signed(wire27[(1'h0):(1'h0)])});
            end
        end
    end
  assign wire38 = reg36;
  assign wire39 = ({$signed(wire38),
                      (((~^wire26) && $signed(reg32)) ?
                          (^~reg31) : ((wire38 ? (8'hb7) : reg30) ?
                              $signed(reg33) : (wire38 < (8'ha9))))} - $unsigned($unsigned(wire28[(4'hb):(3'h4)])));
  assign wire40 = $signed({{(~reg33)}, $signed($signed($unsigned(reg33)))});
  assign wire41 = wire25;
  assign wire42 = reg34[(4'hd):(4'h9)];
  assign wire43 = (^{$signed($signed(wire40[(1'h0):(1'h0)])),
                      (wire38 ?
                          $unsigned($signed(wire24)) : ($signed(reg36) ~^ $unsigned(reg34)))});
  assign wire44 = (~&(wire39[(1'h0):(1'h0)] > $unsigned((wire43[(1'h0):(1'h0)] | (wire38 ^ reg36)))));
  assign wire45 = $unsigned(wire42);
  always
    @(posedge clk) begin
      reg46 <= reg32;
    end
endmodule

module module169  (y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire174;
  input wire [(4'ha):(1'h0)] wire173;
  input wire [(5'h14):(1'h0)] wire172;
  input wire [(5'h15):(1'h0)] wire171;
  input wire [(5'h10):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire202;
  wire [(4'h9):(1'h0)] wire201;
  wire [(4'hb):(1'h0)] wire200;
  wire signed [(3'h7):(1'h0)] wire199;
  wire signed [(2'h3):(1'h0)] wire191;
  wire signed [(4'he):(1'h0)] wire190;
  wire signed [(4'hc):(1'h0)] wire189;
  wire signed [(4'ha):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire187;
  wire signed [(4'hf):(1'h0)] wire186;
  wire [(3'h5):(1'h0)] wire185;
  wire signed [(4'hc):(1'h0)] wire184;
  wire [(4'he):(1'h0)] wire183;
  wire [(5'h13):(1'h0)] wire182;
  wire [(5'h11):(1'h0)] wire181;
  wire [(5'h12):(1'h0)] wire180;
  wire signed [(4'h8):(1'h0)] wire179;
  wire [(5'h15):(1'h0)] wire176;
  wire [(4'h9):(1'h0)] wire175;
  reg [(2'h3):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg197 = (1'h0);
  reg [(5'h13):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg195 = (1'h0);
  reg [(4'hd):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg [(4'hd):(1'h0)] reg192 = (1'h0);
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg177 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire200,
                 wire199,
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
                 wire181,
                 wire180,
                 wire179,
                 wire176,
                 wire175,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg178,
                 reg177,
                 (1'h0)};
  assign wire175 = $signed(wire172[(5'h11):(3'h7)]);
  assign wire176 = ((($signed((wire175 ? (8'ha7) : wire173)) ?
                       {(~&(8'hbe))} : $signed((wire171 ?
                           wire172 : wire174))) >> $signed((8'ha5))) & ({(~&{wire175}),
                           wire174[(1'h1):(1'h1)]} ?
                       (~&wire170[(2'h3):(1'h0)]) : wire170));
  always
    @(posedge clk) begin
      reg177 <= $unsigned($signed($signed(wire174)));
      reg178 <= wire176;
    end
  assign wire179 = ({$unsigned(reg177)} | (8'ha3));
  assign wire180 = $signed(wire174[(1'h1):(1'h1)]);
  assign wire181 = wire173;
  assign wire182 = {(+($unsigned((8'had)) <= ((reg178 ? wire172 : (8'hb2)) ?
                           $unsigned((7'h42)) : ((8'ha9) - wire181)))),
                       wire170};
  assign wire183 = $signed($unsigned(wire170[(1'h0):(1'h0)]));
  assign wire184 = $signed($signed(wire179));
  assign wire185 = {wire170,
                       (($unsigned((wire174 <<< wire179)) ?
                               (wire176 | wire181) : (~((8'hbc) >>> wire183))) ?
                           $unsigned(($unsigned((8'ha0)) ?
                               wire170[(5'h10):(4'hb)] : wire184[(3'h7):(3'h4)])) : wire176)};
  assign wire186 = wire170[(2'h3):(2'h2)];
  assign wire187 = (8'hb5);
  assign wire188 = $unsigned(wire186);
  assign wire189 = wire185;
  assign wire190 = wire173[(1'h0):(1'h0)];
  assign wire191 = wire179[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg192 <= ($signed(($signed($unsigned(wire172)) ?
              {(wire179 ? wire185 : wire190), {wire170}} : ((wire176 ?
                      reg178 : wire181) ?
                  (wire179 ^ wire184) : (~wire176)))) ?
          reg177[(2'h3):(2'h3)] : ($unsigned(wire189[(3'h4):(1'h1)]) ?
              $unsigned((&(wire173 > reg177))) : ($unsigned($signed(wire184)) < {$signed(wire176),
                  wire180[(1'h1):(1'h1)]})));
      if (wire180[(3'h4):(1'h0)])
        begin
          if ($signed((($unsigned((~wire183)) ?
              reg192 : wire174[(1'h1):(1'h1)]) >>> wire172)))
            begin
              reg193 <= reg177;
            end
          else
            begin
              reg193 <= {$signed($unsigned({(~&wire183)}))};
              reg194 <= (~&$unsigned(wire170[(3'h6):(3'h4)]));
            end
        end
      else
        begin
          reg193 <= reg178;
          reg194 <= (-(($signed((~(8'ha1))) ?
              reg178[(3'h6):(1'h1)] : $signed({wire190,
                  wire190})) <<< (!($signed(wire172) << (reg193 ?
              (8'hb3) : wire186)))));
          reg195 <= (wire182 ?
              (+wire172[(3'h7):(3'h4)]) : $signed((wire172[(5'h11):(3'h7)] ?
                  ($signed((8'h9f)) != $unsigned(reg178)) : {$unsigned((8'ha7))})));
          reg196 <= $signed((!((&(wire174 >= (8'hbb))) & (+(^wire187)))));
          reg197 <= (($signed((~|(wire172 <= wire182))) && (~&(~|$unsigned(reg193)))) ?
              $signed((reg194 | {wire190[(4'ha):(1'h0)]})) : (~|reg194[(1'h0):(1'h0)]));
        end
      reg198 <= $unsigned(($unsigned((wire170[(4'hc):(4'hc)] == $signed(wire174))) ?
          $unsigned(wire189[(2'h3):(2'h3)]) : $unsigned(((wire187 ^~ reg195) ?
              (!wire179) : wire190[(4'hc):(4'h9)]))));
    end
  assign wire199 = ($unsigned(reg193[(2'h2):(1'h0)]) << ((reg195[(4'he):(4'he)] >>> wire188[(1'h0):(1'h0)]) ?
                       reg196[(1'h0):(1'h0)] : ((~|wire173) ?
                           $unsigned(wire186[(4'he):(3'h7)]) : ((wire190 && wire175) ?
                               (&wire172) : (wire185 << wire172)))));
  assign wire200 = wire176;
  assign wire201 = ((($signed(wire175[(2'h3):(1'h0)]) & (^$unsigned(reg196))) <= {wire172[(5'h12):(4'hb)]}) ?
                       $signed($unsigned((~&(8'hb1)))) : ((($signed(wire185) & wire199) ?
                           {{wire173,
                                   (8'h9f)}} : ((reg178 >= wire190) | $signed(wire184))) & ($signed($unsigned((7'h43))) ?
                           (-(reg197 * wire184)) : $unsigned(wire181))));
  assign wire202 = wire172;
endmodule

module module109  (y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire114;
  input wire signed [(5'h12):(1'h0)] wire113;
  input wire [(4'he):(1'h0)] wire112;
  input wire [(3'h7):(1'h0)] wire111;
  input wire signed [(4'h8):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire154;
  wire [(3'h4):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire148;
  wire signed [(3'h7):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire146;
  wire [(3'h4):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire141;
  reg [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg145,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg115 <= {$signed(wire112)};
      if ($signed((~^((wire110[(1'h1):(1'h1)] ?
          wire112 : (wire111 ? wire112 : wire111)) << (wire111 ?
          wire111 : $unsigned(wire113))))))
        begin
          reg116 <= (~{$unsigned($unsigned($signed(wire111)))});
          if (wire111)
            begin
              reg117 <= $unsigned(wire114);
            end
          else
            begin
              reg117 <= $signed(((8'hae) ?
                  {(reg117[(1'h0):(1'h0)] ? wire113 : (~wire110)),
                      wire110[(3'h5):(2'h3)]} : (~|(reg117 ?
                      wire111[(3'h7):(3'h5)] : (reg115 ^~ wire111)))));
              reg118 <= (&wire113);
            end
          if ($unsigned(wire112[(2'h3):(2'h3)]))
            begin
              reg119 <= (8'hb3);
              reg120 <= (($unsigned(reg117) >> (8'hab)) - wire110);
              reg121 <= reg120[(1'h1):(1'h0)];
              reg122 <= wire111;
              reg123 <= ((((reg120 ?
                              (reg122 - wire110) : reg119[(3'h5):(3'h5)]) ?
                          {wire111[(3'h6):(2'h3)]} : $unsigned({reg118,
                              (8'h9f)})) ?
                      reg122[(4'hf):(3'h7)] : reg122) ?
                  ($unsigned((+wire112[(4'hd):(4'h9)])) ?
                      reg115[(4'hb):(1'h1)] : $signed((reg122[(4'hd):(3'h6)] ?
                          (8'had) : (wire113 - wire110)))) : wire111[(3'h4):(2'h3)]);
            end
          else
            begin
              reg119 <= wire113;
              reg120 <= (|(+(~|wire112)));
              reg121 <= $unsigned($unsigned(reg115));
              reg122 <= reg116[(1'h1):(1'h1)];
              reg123 <= reg122;
            end
          if ($unsigned((((~&wire112[(3'h6):(2'h3)]) ?
              ((~|reg120) && reg115[(3'h4):(3'h4)]) : {(wire110 || reg118),
                  reg123[(1'h0):(1'h0)]}) || ($unsigned(reg122[(4'ha):(3'h4)]) ?
              (wire112[(4'hc):(3'h7)] ?
                  wire114[(3'h6):(1'h1)] : $unsigned(reg115)) : wire112))))
            begin
              reg124 <= wire112;
              reg125 <= ($signed((reg115 ?
                      $signed($signed(reg118)) : reg117[(4'h8):(1'h1)])) ?
                  {$unsigned($unsigned((8'ha7)))} : ($unsigned((8'hb2)) ?
                      (^~{(reg119 ? wire113 : (8'hbd))}) : wire113));
            end
          else
            begin
              reg124 <= ((wire113 ~^ $unsigned(($unsigned(wire112) && reg116[(2'h2):(1'h1)]))) != $signed($unsigned(reg121)));
              reg125 <= $signed({(wire111 | (reg117 ^~ (reg120 ^ reg121)))});
              reg126 <= (reg115[(4'ha):(3'h5)] ?
                  $signed(reg125[(3'h6):(3'h4)]) : $signed(((+$unsigned((8'hb7))) == reg122)));
              reg127 <= $unsigned(wire111[(3'h4):(3'h4)]);
              reg128 <= {{$unsigned(wire110)}};
            end
        end
      else
        begin
          reg116 <= (reg127 ?
              $signed(((wire113 < (reg118 == (8'hbd))) & reg128)) : wire111[(1'h1):(1'h1)]);
          reg117 <= $signed(reg119[(2'h3):(1'h0)]);
          reg118 <= wire111;
          reg119 <= ($unsigned(((|$signed(reg121)) ?
              {reg123} : ((reg125 && reg118) ?
                  (wire114 ?
                      wire111 : reg118) : (^~(8'hb5))))) >> (~^(&{(~|reg127)})));
        end
      if (({(^wire110[(4'h8):(2'h2)])} < wire111))
        begin
          reg129 <= $signed(wire112);
          if (($unsigned((&reg122)) << reg121))
            begin
              reg130 <= $signed(wire114);
            end
          else
            begin
              reg130 <= $unsigned(reg127[(2'h2):(1'h0)]);
              reg131 <= (&((^~((&reg115) == wire110)) ^ reg128));
              reg132 <= reg124[(1'h0):(1'h0)];
              reg133 <= reg120[(2'h3):(2'h3)];
            end
          reg134 <= {wire112};
          reg135 <= wire113;
          if ((8'hbd))
            begin
              reg136 <= {$unsigned((reg135[(1'h1):(1'h1)] != reg123)),
                  $signed({reg127[(4'h8):(2'h3)]})};
              reg137 <= $signed(((&reg130[(3'h5):(1'h0)]) & $unsigned({$unsigned(reg134),
                  (reg134 || reg132)})));
              reg138 <= reg136;
              reg139 <= $signed(wire110[(1'h0):(1'h0)]);
              reg140 <= $signed($unsigned((~&wire114)));
            end
          else
            begin
              reg136 <= $signed(wire114);
              reg137 <= (^(((reg122[(1'h1):(1'h1)] > reg130[(1'h1):(1'h1)]) ?
                  $unsigned(reg115) : $unsigned((reg125 >>> reg135))) || (&((!reg116) ?
                  $unsigned(reg129) : reg123[(3'h5):(1'h0)]))));
              reg138 <= (~&((~^$unsigned(reg132)) ?
                  (wire111 | $signed($signed(wire113))) : (^~(^(reg124 ?
                      reg122 : (8'hab))))));
            end
        end
      else
        begin
          reg129 <= ({reg129[(1'h1):(1'h0)],
                  (wire113 < ((~reg139) < $unsigned(reg138)))} ?
              (~^reg123[(1'h0):(1'h0)]) : ($unsigned(($unsigned((8'h9d)) ?
                  reg131[(3'h6):(3'h6)] : $signed(reg139))) && wire114[(3'h4):(2'h3)]));
          reg130 <= ({(((reg133 || reg120) || reg133) <= {(reg135 == reg128),
                      reg125})} ?
              $signed($unsigned($signed(wire110))) : (~^reg140));
        end
    end
  assign wire141 = (reg138 ?
                       (reg120[(4'he):(3'h7)] << $signed($unsigned((reg136 * reg135)))) : $signed((($unsigned(reg134) && wire114[(4'hc):(4'h9)]) ?
                           reg140 : ((8'haa) == (+reg120)))));
  assign wire142 = $signed(reg124[(2'h2):(2'h2)]);
  assign wire143 = (($signed({reg128[(3'h6):(1'h0)]}) <= (((~|reg122) != (~reg140)) > $unsigned((~^reg133)))) & ($unsigned($signed($signed(reg123))) ^~ wire111));
  assign wire144 = reg119;
  always
    @(posedge clk) begin
      reg145 <= ((($unsigned(reg129) ?
          $unsigned(reg119) : $unsigned({(8'haf)})) >= ((~wire141) < wire111[(3'h7):(2'h2)])) & wire112);
    end
  assign wire146 = (&(((reg120[(2'h3):(1'h1)] ?
                       (wire144 ?
                           reg137 : reg125) : $unsigned(reg129)) + (&$signed(reg125))) << ((reg132 << {reg140}) ?
                       (~wire113[(2'h3):(1'h1)]) : reg115)));
  assign wire147 = wire144[(3'h4):(1'h0)];
  assign wire148 = ($signed(reg118) ?
                       $signed({(((8'hb5) ? (8'hb0) : reg138) ?
                               $unsigned(wire143) : $signed(reg127)),
                           ((reg133 >>> reg145) ^~ reg120)}) : reg116[(3'h4):(2'h2)]);
  assign wire149 = ($unsigned((reg119 & reg116[(4'hc):(4'h9)])) ?
                       (-(|$signed((reg118 ?
                           wire113 : reg126)))) : {$signed((reg134 ?
                               wire143 : (wire143 ? reg126 : (8'ha7)))),
                           wire113});
  assign wire150 = $signed((8'haa));
  assign wire151 = (+$signed(($unsigned((reg118 ?
                       wire144 : (8'hae))) >> (~|{reg139, reg134}))));
  assign wire152 = (&($unsigned(({reg117, wire142} ?
                           (reg122 ? reg137 : reg132) : (8'hbe))) ?
                       reg140[(1'h0):(1'h0)] : (&reg135)));
  assign wire153 = wire152;
  assign wire154 = reg133;
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire72;
  input wire signed [(4'h9):(1'h0)] wire71;
  input wire signed [(4'ha):(1'h0)] wire70;
  input wire [(3'h7):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire75,
                 wire74,
                 wire73,
                 reg96,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire73 = wire72[(2'h2):(1'h1)];
  assign wire74 = wire69[(1'h0):(1'h0)];
  assign wire75 = ($signed({$signed(wire69),
                      wire74[(2'h2):(1'h1)]}) == ($signed((wire70[(3'h4):(1'h1)] ?
                      $unsigned(wire74) : $signed(wire69))) && (8'hae)));
  always
    @(posedge clk) begin
      if ({$signed(($signed(wire72[(2'h2):(2'h2)]) ?
              $unsigned(wire71) : (8'hbf))),
          wire71[(3'h7):(2'h2)]})
        begin
          reg76 <= wire70[(1'h0):(1'h0)];
          reg77 <= $unsigned((~^wire71));
        end
      else
        begin
          reg76 <= wire73;
          if (wire74)
            begin
              reg77 <= $signed((8'ha7));
              reg78 <= (8'hb8);
              reg79 <= ((~&(-wire73)) ?
                  wire73[(4'h9):(4'h8)] : (~^$unsigned((^reg76))));
              reg80 <= (wire69 ?
                  (($signed(wire71[(3'h4):(1'h0)]) ?
                          $unsigned((~|wire72)) : ((^wire70) <<< (reg76 || (8'hac)))) ?
                      ($signed(((8'h9e) | wire70)) >> (-$unsigned(reg77))) : {wire74,
                          (^~(wire69 ?
                              reg77 : wire73))}) : ((|(wire71[(1'h0):(1'h0)] | $unsigned(reg78))) >>> (-reg77[(1'h0):(1'h0)])));
              reg81 <= ($unsigned(reg77) ?
                  ((&(reg79[(2'h2):(2'h2)] ?
                      wire72[(4'hc):(3'h6)] : (wire71 ?
                          reg76 : (8'hae)))) ^~ wire74) : wire71[(1'h1):(1'h0)]);
            end
          else
            begin
              reg77 <= wire74[(1'h0):(1'h0)];
            end
          reg82 <= (wire69 ?
              (!((wire70[(2'h3):(1'h1)] | (wire74 >> reg78)) ?
                  ($unsigned((8'h9d)) ?
                      (wire74 ~^ (7'h43)) : $unsigned(reg77)) : $unsigned($unsigned((8'hac))))) : $unsigned(($unsigned((reg77 ?
                      wire72 : wire75)) ?
                  ($unsigned(wire73) ? (reg76 | wire74) : wire70) : wire75)));
          reg83 <= (wire72[(1'h0):(1'h0)] ?
              ($unsigned(((reg78 ?
                  reg81 : wire69) || $unsigned(reg82))) || $signed((wire69[(3'h6):(2'h3)] ?
                  reg80 : (reg81 ? (8'hac) : reg78)))) : reg79);
        end
      if (wire73[(4'h9):(3'h7)])
        begin
          reg84 <= $signed($signed($signed($unsigned($unsigned(reg78)))));
        end
      else
        begin
          if ((reg78[(3'h5):(1'h0)] >> $signed({$signed({reg77})})))
            begin
              reg84 <= $unsigned((~^wire69[(1'h0):(1'h0)]));
              reg85 <= (|(($signed(reg77) ? {$unsigned(reg82)} : reg76) ?
                  {((reg76 ? reg79 : wire70) ?
                          {wire70, reg81} : wire69[(1'h0):(1'h0)])} : reg79));
              reg86 <= $unsigned((~|((((8'had) ?
                  reg76 : wire72) && (wire70 | wire75)) && wire74[(2'h2):(2'h2)])));
            end
          else
            begin
              reg84 <= (wire75 ?
                  $unsigned({{$unsigned(reg78), $unsigned(wire72)},
                      ($signed(wire74) ?
                          (~&wire70) : $signed(reg76))}) : {(($signed(reg76) ?
                              $signed((8'ha5)) : (+wire71)) ?
                          {$unsigned(wire71),
                              (wire75 ?
                                  reg82 : reg85)} : ((|reg77) == (+reg77)))});
              reg85 <= {$signed(reg84)};
            end
          if (((wire70[(3'h5):(3'h5)] & reg86) == (^reg80[(1'h0):(1'h0)])))
            begin
              reg87 <= wire74;
              reg88 <= {(~&{{{reg77}}}), reg87};
              reg89 <= $signed((!wire74));
              reg90 <= (($signed($signed($signed(reg78))) ? wire71 : (8'hbf)) ?
                  $signed($signed({$unsigned(reg86)})) : $signed((|$unsigned($unsigned(reg76)))));
              reg91 <= ((+(~|(^~(wire71 ?
                  reg86 : wire69)))) == ($signed({{reg78}}) ?
                  $signed((-(reg80 ^ reg86))) : reg86[(1'h1):(1'h1)]));
            end
          else
            begin
              reg87 <= $unsigned(($unsigned(({reg79,
                  reg80} - wire74)) || $signed((~^((8'ha5) ?
                  wire73 : reg87)))));
              reg88 <= (reg79[(1'h0):(1'h0)] <= reg88[(4'h8):(1'h0)]);
              reg89 <= reg82;
            end
        end
      reg92 <= (+reg78[(2'h3):(1'h0)]);
      reg93 <= wire73[(3'h4):(1'h0)];
      if (((8'h9d) ?
          $unsigned($signed((!(reg79 ?
              wire71 : reg92)))) : $unsigned((~^reg93[(4'ha):(4'h9)]))))
        begin
          reg94 <= ($signed((~|$unsigned((&(8'ha0))))) ?
              $unsigned(reg82) : $unsigned(reg82));
          reg95 <= reg87[(2'h3):(2'h3)];
          reg96 <= $unsigned(reg95);
        end
      else
        begin
          reg94 <= (~|reg93);
          reg95 <= $signed(({(reg83[(1'h1):(1'h1)] >>> (wire71 >= wire69))} ?
              $signed((+$signed(reg83))) : reg93));
        end
    end
  assign wire97 = (((7'h44) > (reg93[(1'h0):(1'h0)] ?
                      (8'hab) : (reg95[(3'h5):(3'h4)] << $unsigned(wire72)))) ^~ (($unsigned($signed(reg93)) + (^~(^reg82))) ?
                      wire74[(1'h1):(1'h1)] : $signed(((reg92 ?
                              reg82 : wire69) ?
                          wire75 : $unsigned(wire75)))));
  assign wire98 = $signed(reg85);
endmodule
