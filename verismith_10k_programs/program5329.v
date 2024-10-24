module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire176;
  wire [(5'h11):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg175 = (1'h0);
  assign y = {wire176, wire174, wire172, wire45, wire4, reg175, (1'h0)};
  assign wire4 = ((wire1[(1'h1):(1'h1)] << {wire3}) ?
                     $unsigned((+wire3[(1'h0):(1'h0)])) : wire0);
  module5 #() modinst46 (wire45, clk, wire4, wire1, wire2, wire0);
  module47 #() modinst173 (.wire48(wire4), .wire50(wire2), .clk(clk), .y(wire172), .wire49(wire0), .wire51(wire1));
  assign wire174 = (($signed(wire3[(3'h5):(2'h3)]) < {$signed(wire45),
                           (|(8'hbc))}) ?
                       $unsigned($unsigned(((wire45 ?
                           wire45 : wire172) != wire172))) : ((wire45[(4'ha):(2'h2)] ?
                           (|$unsigned(wire3)) : ((wire2 * wire4) ?
                               (|wire1) : wire1)) <= wire0[(5'h11):(4'hb)]));
  always
    @(posedge clk) begin
      reg175 <= $unsigned((~(-$unsigned((wire45 == wire0)))));
    end
  module47 #() modinst177 (wire176, clk, wire172, wire2, wire3, wire1);
endmodule

module module47
#(parameter param171 = ((^(((^(8'hbd)) ? {(8'ha0)} : ((8'hb4) ? (8'ha0) : (8'hb8))) >>> (&{(8'hb8), (8'hb7)}))) <= {((^((7'h42) ? (8'ha4) : (8'hb3))) >>> ((!(8'ha3)) < ((8'ha7) > (8'hb1))))}))
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire51;
  input wire [(4'hc):(1'h0)] wire50;
  input wire signed [(5'h11):(1'h0)] wire49;
  input wire [(3'h6):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire168;
  wire [(5'h12):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  assign y = {wire170,
                 wire168,
                 wire130,
                 wire112,
                 wire110,
                 wire108,
                 wire60,
                 wire59,
                 wire53,
                 wire52,
                 reg133,
                 reg132,
                 reg111,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire52 = (wire50 ? wire50 : $signed({$signed(wire48)}));
  assign wire53 = wire50[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg54 <= wire53[(2'h2):(2'h2)];
      reg55 <= (8'haa);
      reg56 <= $signed((^~(wire51[(3'h4):(2'h3)] >> (~^((8'hae) ?
          reg54 : (8'ha1))))));
      reg57 <= wire49[(3'h6):(3'h6)];
      reg58 <= (wire48 ? $signed(wire49[(3'h5):(3'h4)]) : reg54);
    end
  assign wire59 = reg57[(3'h6):(3'h4)];
  assign wire60 = ((($unsigned($signed((8'h9c))) ?
                      $signed({reg57}) : $unsigned((reg57 ?
                          wire49 : wire52))) > (reg56[(1'h1):(1'h1)] & wire48[(3'h4):(1'h1)])) ^~ wire48[(3'h6):(3'h6)]);
  module61 #() modinst109 (wire108, clk, wire53, wire60, wire49, wire50);
  assign wire110 = (reg54 > $signed((wire108[(1'h0):(1'h0)] < wire50[(4'ha):(3'h7)])));
  always
    @(posedge clk) begin
      reg111 <= (~^$unsigned(wire108));
    end
  assign wire112 = (&(8'hb5));
  module113 #() modinst131 (wire130, clk, wire52, wire51, reg57, reg55);
  always
    @(posedge clk) begin
      reg132 <= (~&($signed((wire130[(4'hd):(2'h2)] ?
              (wire52 * (8'haa)) : (wire50 ? reg57 : (8'ha9)))) ?
          (+wire112[(3'h4):(2'h3)]) : $signed({((8'had) >>> reg56), wire60})));
      reg133 <= wire50;
    end
  module134 #() modinst169 (wire168, clk, wire59, wire110, wire112, wire52);
  assign wire170 = wire52[(2'h2):(1'h0)];
endmodule

module module5
#(parameter param43 = {({((8'hbe) + (!(8'ha2))), (((8'ha1) == (8'hb4)) ? ((7'h41) ? (8'ha0) : (8'haa)) : ((8'ha4) >>> (8'ha6)))} ? (|(((8'h9c) ? (8'ha5) : (8'h9c)) ? ((8'had) != (8'hb9)) : ((8'hb3) ^ (8'hac)))) : ({{(8'hbe), (8'h9d)}} ? (^((8'h9e) - (8'h9e))) : (~&(8'hb5)))), {({((8'hb3) < (7'h40))} ? {((8'h9c) < (8'hbf)), (^(8'hb6))} : ((^~(8'had)) + (+(8'hb3))))}}, 
parameter param44 = (param43 ? (param43 >>> (param43 & param43)) : (8'ha8)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire10;
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire24,
                 wire23,
                 wire10,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg22,
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
                 (1'h0)};
  assign wire10 = $signed(wire7[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg11 <= {(~|wire6[(4'h9):(3'h6)]), (+$unsigned($unsigned({wire10})))};
      reg12 <= wire10;
      reg13 <= (({$signed({(8'h9c)})} <= $signed((~&reg11[(1'h0):(1'h0)]))) >> (~(8'ha0)));
      if (wire6)
        begin
          reg14 <= reg13[(2'h3):(1'h0)];
          reg15 <= (wire10[(4'ha):(3'h5)] ~^ $signed((wire6 ~^ (|$signed(wire7)))));
          reg16 <= ((reg14 ^ $signed((8'hbd))) ?
              wire8 : ((8'ha4) > (!(|$unsigned(wire7)))));
          if ($signed($signed(wire8[(3'h7):(2'h2)])))
            begin
              reg17 <= wire8[(1'h1):(1'h0)];
              reg18 <= (|reg17);
              reg19 <= (~&(~|(^~$unsigned(((8'hb2) ~^ reg18)))));
            end
          else
            begin
              reg17 <= reg18;
              reg18 <= $signed($signed((+$signed((reg17 ? (8'hbf) : reg17)))));
              reg19 <= reg19;
              reg20 <= reg12;
              reg21 <= (^wire9);
            end
        end
      else
        begin
          reg14 <= (~&($unsigned({(8'haa)}) >>> $signed($signed(reg14))));
          reg15 <= ($signed((reg16[(3'h4):(1'h0)] ?
                  ((^~reg14) - $signed(wire9)) : (~&reg17))) ?
              ($signed({(&reg14)}) ?
                  $signed(wire9) : wire6[(4'h9):(2'h2)]) : {(-reg13),
                  (((reg20 ? reg12 : (8'hbf)) ?
                      $unsigned(wire7) : (reg19 != (7'h40))) ~^ $signed($signed(reg11)))});
          if ((reg21 ?
              (-$unsigned(($unsigned(wire6) + ((8'ha9) ?
                  (8'hb2) : (8'ha1))))) : reg15[(1'h1):(1'h0)]))
            begin
              reg16 <= reg16[(3'h5):(3'h5)];
            end
          else
            begin
              reg16 <= (+$signed(($signed({reg15, reg14}) | ($signed(reg15) ?
                  $unsigned(reg12) : (reg11 && (8'hac))))));
              reg17 <= $unsigned($signed($signed((reg14[(1'h1):(1'h1)] != $unsigned(reg17)))));
              reg18 <= wire10;
            end
          reg19 <= wire7;
        end
      reg22 <= reg16;
    end
  assign wire23 = (~^$unsigned(reg19));
  assign wire24 = wire7[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg25 <= reg21;
      if (wire7[(3'h6):(3'h4)])
        begin
          reg26 <= $unsigned(reg19[(2'h3):(2'h3)]);
          reg27 <= (&(($unsigned(reg21[(2'h3):(2'h2)]) ?
                  reg22[(1'h1):(1'h0)] : $unsigned($unsigned(wire9))) ?
              wire9[(4'hc):(1'h0)] : $signed(wire10[(4'hd):(4'h9)])));
          if (reg12[(5'h13):(2'h3)])
            begin
              reg28 <= (((wire23 ?
                  $unsigned(wire6) : $unsigned(reg25[(2'h2):(1'h1)])) & $signed($signed(reg11[(2'h3):(1'h0)]))) > ((|((reg16 ?
                          reg12 : (8'hb3)) ?
                      ((8'ha2) ? (8'hab) : reg17) : (~wire23))) ?
                  reg18[(3'h6):(2'h2)] : (&wire8[(3'h4):(1'h0)])));
              reg29 <= {$unsigned(reg17[(1'h0):(1'h0)]),
                  (((~|wire6) == (!(|reg16))) ?
                      wire23 : (^{(reg27 ? reg20 : wire6),
                          wire23[(3'h6):(3'h6)]}))};
              reg30 <= ((&$unsigned($signed($unsigned(reg21)))) ?
                  (8'hb6) : ($unsigned(wire10[(4'hc):(3'h6)]) & (~($unsigned(wire10) > reg21[(3'h6):(3'h5)]))));
            end
          else
            begin
              reg28 <= wire8[(2'h2):(2'h2)];
              reg29 <= ((-{$signed((reg11 || reg16)),
                  (~^(wire8 ? reg19 : (8'hb7)))}) > (8'h9d));
            end
          reg31 <= reg11;
          reg32 <= wire9[(3'h4):(3'h4)];
        end
      else
        begin
          if ((~$signed(reg28[(4'ha):(3'h5)])))
            begin
              reg26 <= wire9;
              reg27 <= {((reg16 ? $unsigned((wire8 ^ (8'hac))) : reg13) ?
                      wire23[(4'hd):(3'h5)] : (((~reg15) - (reg21 ?
                              reg27 : reg30)) ?
                          $signed({reg31}) : reg30[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg26 <= $unsigned((reg15 && $signed((!reg30))));
              reg27 <= (8'hb8);
              reg28 <= (|$unsigned((8'ha3)));
            end
          if (reg28)
            begin
              reg29 <= {(reg32 <= reg30)};
              reg30 <= reg32[(3'h7):(1'h1)];
              reg31 <= ((-$unsigned($signed(reg18))) ? reg21 : reg32);
            end
          else
            begin
              reg29 <= reg20;
              reg30 <= ((&(8'ha7)) ? reg12[(5'h10):(3'h6)] : reg20);
              reg31 <= $signed((7'h43));
            end
        end
    end
  assign wire33 = $unsigned($unsigned($unsigned(((-wire8) ?
                      $unsigned((8'ha6)) : (reg27 ^ (8'hbd))))));
  assign wire34 = (($signed($signed(reg15)) ?
                      $unsigned({(reg18 ? (8'ha5) : reg29),
                          (reg30 ?
                              reg20 : (8'had))}) : $signed($unsigned((reg15 <<< reg25)))) >= ((reg11 | $signed((reg21 > wire33))) ?
                      {$unsigned($signed(reg29)),
                          $unsigned($signed(reg28))} : (|reg21)));
  assign wire35 = reg28[(4'h8):(2'h2)];
  assign wire36 = {{(reg20[(1'h0):(1'h0)] + wire9),
                          $unsigned($signed((-(8'hba))))},
                      $unsigned(wire9)};
  assign wire37 = wire33[(4'h8):(1'h1)];
  assign wire38 = ($signed({($signed(reg11) ^~ wire8)}) - (^(+$unsigned((reg26 ?
                      (8'haf) : wire36)))));
  assign wire39 = $unsigned($unsigned(reg30));
  assign wire40 = wire34;
  assign wire41 = ({$signed(wire10[(5'h10):(1'h0)])} | wire35);
  assign wire42 = reg22;
endmodule

module module134
#(parameter param167 = ({{(-((8'hb3) ? (8'ha6) : (8'hbb))), (~((8'hba) < (8'hb4)))}, (((~(8'hbd)) ? ((8'had) - (8'hb2)) : (8'ha2)) ? (^((8'hbc) ? (8'h9e) : (8'h9c))) : (((8'h9d) <= (8'hab)) <<< (^(8'hb1))))} ? ((((|(8'ha8)) ? {(7'h42)} : {(8'hbb)}) ? (((8'hb6) ? (8'ha9) : (8'ha2)) ? ((8'hbc) || (8'ha0)) : {(8'ha2), (8'ha2)}) : (~^((8'hb5) ? (8'hbb) : (8'hb3)))) ? ({((8'ha1) ? (8'hab) : (8'hac)), ((8'h9e) ? (8'hb2) : (8'hbb))} ? (+(+(8'hb4))) : ({(7'h40)} + ((8'h9f) ? (8'ha0) : (8'ha8)))) : ((((8'hb9) ? (7'h42) : (8'hb4)) ? ((8'hbc) ^ (8'hba)) : (!(8'hb5))) * (~{(8'hb5), (8'hbd)}))) : {(({(8'hb0), (7'h40)} * (+(8'hbf))) ^ (((8'hb5) ? (8'hba) : (8'hb2)) && ((8'hac) ? (8'hb4) : (8'hb9)))), {(((8'haf) ? (7'h44) : (8'hab)) ~^ ((8'hba) ? (8'hb5) : (8'ha9)))}}))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire138;
  input wire [(5'h15):(1'h0)] wire137;
  input wire [(3'h7):(1'h0)] wire136;
  input wire [(5'h10):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire166;
  wire [(4'hc):(1'h0)] wire165;
  wire signed [(3'h5):(1'h0)] wire164;
  wire signed [(3'h4):(1'h0)] wire163;
  wire signed [(3'h7):(1'h0)] wire162;
  wire signed [(4'h8):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire143;
  wire [(5'h12):(1'h0)] wire142;
  wire signed [(4'hd):(1'h0)] wire141;
  wire [(4'h8):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  reg signed [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire150,
                 wire147,
                 wire146,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
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
                 reg149,
                 reg148,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire139 = (wire138 ? wire138 : wire137);
  assign wire140 = wire137[(4'he):(2'h3)];
  assign wire141 = (wire136[(3'h7):(1'h0)] != {wire139});
  assign wire142 = wire138;
  assign wire143 = wire140;
  always
    @(posedge clk) begin
      reg144 <= $unsigned({(((wire135 ? wire140 : wire137) ?
              (wire142 >>> wire142) : (&wire135)) ^ $unsigned((wire142 ?
              wire143 : wire135)))});
      reg145 <= ((~&(^wire140)) ?
          (((8'hba) | $signed(reg144)) >> wire135[(5'h10):(4'ha)]) : wire139[(2'h2):(2'h2)]);
    end
  assign wire146 = (~|(reg144[(3'h4):(3'h4)] ?
                       wire142[(4'h9):(1'h0)] : (~((8'hb3) ?
                           (wire137 ? reg144 : wire140) : {reg145, wire139}))));
  assign wire147 = $signed({$signed(wire140),
                       $unsigned($unsigned((&wire143)))});
  always
    @(posedge clk) begin
      reg148 <= $signed({$unsigned((|((8'hbc) <<< wire143)))});
      reg149 <= wire143;
    end
  assign wire150 = {reg149, wire142[(4'ha):(3'h5)]};
  always
    @(posedge clk) begin
      reg151 <= (((8'hac) - (-($signed(wire142) - wire146[(4'h9):(3'h6)]))) > $unsigned((^($signed(wire147) ?
          wire147 : wire143))));
      reg152 <= wire139[(4'ha):(3'h6)];
      if ({(wire141 ?
              {{(wire137 ?
                          wire146 : wire139)}} : $unsigned($unsigned((8'h9c))))})
        begin
          reg153 <= (8'hb3);
          reg154 <= {((~^((!wire137) >>> wire139)) | ($signed({wire146}) ?
                  ($unsigned(reg152) <= $unsigned(wire143)) : wire147[(1'h1):(1'h0)]))};
          reg155 <= ($unsigned({((reg144 || reg154) ?
                      reg152[(4'hf):(3'h6)] : $signed(reg152))}) ?
              ((-reg152[(3'h7):(3'h6)]) ?
                  ($signed($signed(wire143)) ?
                      $signed((~&reg153)) : {reg154}) : (wire137[(2'h3):(2'h3)] ?
                      (~|(wire142 ?
                          wire137 : reg152)) : $signed(reg152))) : (8'ha2));
        end
      else
        begin
          reg153 <= (-wire139);
          if ($signed($signed((^(8'ha3)))))
            begin
              reg154 <= $signed(reg144[(4'ha):(1'h1)]);
              reg155 <= reg152[(4'ha):(4'h8)];
              reg156 <= $unsigned(($signed(({wire137, wire140} ?
                      reg154 : $unsigned(reg149))) ?
                  wire136[(3'h5):(3'h5)] : $signed(reg145[(3'h5):(1'h1)])));
              reg157 <= $signed(((~&{$unsigned(wire150), (-reg149)}) ?
                  (($signed(wire139) ? $unsigned(reg155) : $signed((8'hb0))) ?
                      wire139[(4'h8):(2'h2)] : reg154) : $signed($signed((reg155 ?
                      wire138 : wire141)))));
              reg158 <= $signed($signed(({wire146[(4'h8):(1'h0)],
                  (reg148 >> (8'ha7))} & ({wire139} && {wire138, wire138}))));
            end
          else
            begin
              reg154 <= wire136;
              reg155 <= $unsigned(wire147);
              reg156 <= $signed($unsigned(wire137[(3'h5):(1'h0)]));
            end
          if (wire140)
            begin
              reg159 <= ($unsigned((~&$signed((wire142 ? wire138 : reg149)))) ?
                  wire140 : ((~$unsigned({wire142, reg144})) ?
                      $unsigned(((~&wire141) ?
                          $signed(wire141) : $unsigned(wire136))) : ((reg158[(3'h7):(3'h7)] ?
                              (wire136 ?
                                  (8'had) : (8'hab)) : reg151[(1'h0):(1'h0)]) ?
                          $unsigned($unsigned(reg145)) : wire143[(5'h12):(5'h10)])));
            end
          else
            begin
              reg159 <= ($signed((reg155 == $unsigned($signed(wire140)))) ?
                  $signed(reg154[(1'h1):(1'h1)]) : (&wire142));
              reg160 <= ($signed({wire135}) <= $signed(({$signed(wire143),
                      (8'h9d)} ?
                  $unsigned($unsigned(wire150)) : reg152[(3'h7):(1'h0)])));
            end
          reg161 <= (~&$unsigned({reg156[(3'h4):(1'h1)],
              (^reg145[(1'h1):(1'h0)])}));
        end
    end
  assign wire162 = $unsigned(wire142);
  assign wire163 = $unsigned(wire150);
  assign wire164 = wire143[(4'hf):(1'h0)];
  assign wire165 = (wire146 ?
                       ({wire150, $signed(reg160)} && $unsigned({{reg154,
                               reg161}})) : $signed(wire140[(2'h2):(2'h2)]));
  assign wire166 = ({{reg159,
                           ((^~wire136) ?
                               $unsigned(wire138) : reg152[(4'ha):(3'h7)])}} ~^ wire146[(4'hc):(2'h3)]);
endmodule

module module113
#(parameter param128 = {(^(((~&(8'hb3)) >> ((8'hb4) ? (7'h40) : (8'ha7))) << ((~(7'h40)) ? (~(8'hbf)) : ((7'h40) ? (8'hbf) : (8'hb3)))))}, 
parameter param129 = (((((param128 && param128) ? param128 : (param128 ? param128 : param128)) + ({param128, param128} > {param128})) ? (({(8'haa), (8'ha1)} <= (~&param128)) - ((param128 - param128) ? {param128} : param128)) : (((~^param128) | (&param128)) * {(param128 ? param128 : param128)})) >= {((^(param128 ~^ param128)) ? {param128, (param128 ^~ param128)} : param128), ((&(param128 | param128)) ? (^(param128 && (8'h9f))) : param128)}))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire117;
  input wire [(4'h8):(1'h0)] wire116;
  input wire signed [(4'hc):(1'h0)] wire115;
  input wire [(4'h8):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire118;
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire118,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire118 = {wire114};
  always
    @(posedge clk) begin
      reg119 <= $signed((wire117 && ((wire116[(1'h1):(1'h1)] ?
          {wire117, (8'hbd)} : $unsigned(wire115)) >= wire115[(2'h2):(1'h0)])));
      if ((!wire116))
        begin
          reg120 <= $signed($unsigned($signed(($signed(wire117) ?
              wire114[(2'h3):(2'h2)] : $unsigned(wire117)))));
          if (wire115)
            begin
              reg121 <= (&(wire115 ^~ (($signed(reg120) >>> (reg120 ?
                      wire114 : wire117)) ?
                  wire116[(3'h6):(3'h6)] : wire116[(3'h7):(1'h0)])));
              reg122 <= ((^($signed($signed(reg121)) ?
                  (~|(wire117 ?
                      (8'hb7) : wire114)) : wire117[(4'he):(4'he)])) ~^ $signed((+(~^{wire115}))));
            end
          else
            begin
              reg121 <= ({$signed((!{wire115, wire117}))} ?
                  (7'h43) : ((^~wire115) ?
                      $unsigned(($signed(wire114) == $signed(wire115))) : (~|$unsigned((reg122 - wire116)))));
              reg122 <= (({($unsigned(wire115) ?
                          (reg122 ? (8'hae) : wire116) : wire118)} ?
                  (({wire115} - $signed(wire116)) ^~ $unsigned(((7'h41) * wire118))) : wire114) ^~ {$signed(((reg121 > reg120) ?
                      {reg121, wire116} : (reg122 ? wire118 : wire118)))});
            end
          reg123 <= (reg121[(4'hd):(2'h3)] >> (reg120[(2'h2):(1'h1)] ^~ ($signed((wire117 > reg120)) >> (wire114[(3'h7):(3'h5)] ?
              ((8'hb9) >>> reg120) : (8'h9e)))));
        end
      else
        begin
          reg120 <= ((&(reg119[(4'hb):(3'h4)] ? wire117 : wire117)) ?
              reg120[(3'h4):(3'h4)] : $unsigned($unsigned(((reg122 < wire115) - $signed(reg120)))));
          reg121 <= reg119;
          reg122 <= $signed(($signed($unsigned((wire116 * (8'hac)))) < (8'hb2)));
          reg123 <= $unsigned($signed(reg121));
        end
    end
  assign wire124 = ((reg122[(4'hc):(3'h5)] ^~ (^(((8'hac) ?
                           reg122 : reg122) >> $signed(wire116)))) ?
                       $signed($unsigned(reg121[(4'hf):(4'hd)])) : reg119[(2'h2):(1'h0)]);
  assign wire125 = reg119;
  assign wire126 = $signed({wire114});
  assign wire127 = (wire117[(5'h15):(4'ha)] << ({(((8'hb4) ? reg119 : reg122) ?
                           (~|wire126) : (wire126 || (8'hbf)))} * $signed(wire114[(1'h1):(1'h0)])));
endmodule

module module61
#(parameter param107 = (^~{(~{{(8'hae)}, (8'ha4)})}))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h1d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire65;
  input wire [(3'h5):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire63;
  input wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire86,
                 wire85,
                 wire67,
                 wire66,
                 reg97,
                 reg96,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
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
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire66 = ({(wire64[(3'h4):(2'h2)] ? $signed($signed(wire62)) : wire62),
                      ($signed(wire65) ?
                          $unsigned(wire63[(4'he):(4'he)]) : $signed((~wire65)))} ~^ wire62[(2'h2):(1'h1)]);
  assign wire67 = (wire63 ? (^$unsigned((^wire66))) : $signed(wire62));
  always
    @(posedge clk) begin
      reg68 <= (-((~wire65[(4'hb):(3'h7)]) << $unsigned($unsigned(wire62[(3'h4):(1'h0)]))));
      reg69 <= {$signed((!(~(wire63 ? wire62 : wire66))))};
      reg70 <= wire63;
      if (wire62)
        begin
          if (reg68)
            begin
              reg71 <= wire65;
              reg72 <= $unsigned($signed(((!(reg71 >= reg68)) != (!wire64))));
              reg73 <= {reg69};
            end
          else
            begin
              reg71 <= $signed((+$unsigned((-{reg72, reg71}))));
            end
          reg74 <= $unsigned((($unsigned({reg73}) ?
              $unsigned({reg72}) : (^(reg68 >> (8'hb7)))) >> {({wire65,
                      wire63} ?
                  $unsigned(wire62) : wire67)}));
          if (((!(|reg71[(4'hd):(4'ha)])) * {(^~wire67[(3'h5):(2'h2)])}))
            begin
              reg75 <= ({(((~|(8'hb1)) ?
                      wire62 : ((8'hb1) != reg71)) ~^ $unsigned((|(8'h9c)))),
                  (+(wire63 ?
                      $signed(wire66) : $signed(reg68)))} < $unsigned((reg72 ?
                  $unsigned((wire66 ?
                      reg68 : wire66)) : $signed($unsigned(reg69)))));
              reg76 <= wire64[(2'h2):(1'h0)];
              reg77 <= $signed(($unsigned(wire65[(4'h9):(2'h2)]) ^~ {(wire66 >= wire66),
                  $signed($unsigned(reg72))}));
            end
          else
            begin
              reg75 <= reg77;
              reg76 <= $signed($unsigned(({(&reg77)} ?
                  {wire63[(1'h1):(1'h1)], {reg73}} : reg72)));
              reg77 <= (~^($signed($signed(wire64)) ?
                  $signed($signed(reg75)) : reg72));
              reg78 <= {wire64,
                  ((wire67[(1'h1):(1'h0)] ?
                      ((wire66 >> reg69) ?
                          reg69[(3'h6):(1'h0)] : (8'ha4)) : (^$signed(reg74))) <= wire65)};
              reg79 <= $signed((wire65[(3'h5):(3'h4)] >>> ($signed($unsigned(wire66)) ?
                  (^~reg75[(1'h1):(1'h0)]) : ($signed(wire66) | (reg78 ?
                      reg72 : (8'hb0))))));
            end
          if (reg69)
            begin
              reg80 <= (8'ha6);
              reg81 <= wire63;
              reg82 <= ({$signed(wire63), (reg72[(1'h1):(1'h1)] * (~^reg71))} ?
                  (reg78 || (~&((~&reg81) ?
                      $unsigned(reg77) : {reg76, reg78}))) : wire67);
              reg83 <= (reg80[(4'h9):(3'h4)] >= $unsigned($unsigned($unsigned({(7'h40),
                  reg68}))));
              reg84 <= $unsigned(reg72);
            end
          else
            begin
              reg80 <= (($signed((((8'hb7) - wire62) ?
                          $signed(reg71) : ((8'h9d) ? reg75 : reg79))) ?
                      $unsigned(reg72) : reg79) ?
                  (reg72[(4'hd):(1'h1)] == {reg70[(4'ha):(4'h9)]}) : $signed((-$signed((reg80 == reg82)))));
              reg81 <= ($unsigned(((^(reg80 != reg75)) << {(wire63 - reg72),
                      $signed(reg72)})) ?
                  ((wire64 != (((8'haf) == reg77) ?
                      reg69[(3'h6):(2'h2)] : reg70[(4'hf):(1'h0)])) + $signed((reg75[(2'h2):(1'h1)] ?
                      (~&(8'hbe)) : $signed(reg82)))) : (^~{$unsigned($unsigned(reg83)),
                      $signed({reg70})}));
              reg82 <= ($unsigned(reg78[(4'he):(4'hd)]) == $signed({reg84}));
              reg83 <= (~$unsigned(($unsigned(reg74[(1'h0):(1'h0)]) ?
                  reg76 : (&(reg75 ? reg69 : (8'hbb))))));
            end
        end
      else
        begin
          reg71 <= wire64[(2'h2):(2'h2)];
        end
    end
  assign wire85 = (reg77[(2'h3):(1'h0)] ?
                      $unsigned($signed(($signed(reg83) ?
                          $unsigned((7'h40)) : {(8'had)}))) : reg79[(4'he):(3'h7)]);
  assign wire86 = reg68;
  always
    @(posedge clk) begin
      reg87 <= $signed($signed($unsigned((~&(+(8'hbe))))));
      reg88 <= (reg81 ?
          $signed({reg68[(3'h6):(2'h3)]}) : $unsigned((reg73[(4'h8):(4'h8)] ?
              reg77[(2'h3):(2'h2)] : reg75)));
      reg89 <= (~reg70);
      reg90 <= ((^~(reg78 ~^ $signed($signed(wire65)))) >> reg68[(4'ha):(3'h5)]);
    end
  assign wire91 = $signed($unsigned($unsigned(($signed(reg80) != wire62[(3'h7):(2'h3)]))));
  assign wire92 = ($signed($signed($unsigned(reg83))) != reg89);
  assign wire93 = {((8'hb5) + {(+{reg76, wire66})})};
  assign wire94 = {reg88[(2'h2):(1'h1)]};
  assign wire95 = wire91;
  always
    @(posedge clk) begin
      reg96 <= $unsigned(($signed(({reg70, wire94} ?
          wire95 : (~|(7'h44)))) * wire92[(2'h2):(1'h0)]));
      reg97 <= reg89[(3'h7):(3'h4)];
    end
  assign wire98 = {(~&reg97[(1'h1):(1'h1)]), (+(8'ha6))};
  assign wire99 = $signed((reg73 < ($unsigned(wire92[(3'h4):(2'h2)]) >>> $unsigned((8'ha4)))));
  assign wire100 = $unsigned((reg87[(3'h4):(1'h1)] ?
                       (~$unsigned((wire86 + reg71))) : (8'hb5)));
  assign wire101 = ($signed(($unsigned({(8'ha2), reg89}) | wire99)) ?
                       ($signed($unsigned((wire67 ?
                           reg83 : wire85))) >> (($unsigned(wire95) == (reg79 <<< (8'hb5))) < $signed((wire100 - wire93)))) : $unsigned(reg82));
  assign wire102 = $unsigned(((reg90[(4'h9):(4'h9)] ?
                           ({reg82, reg77} ?
                               (wire62 != wire93) : (!reg76)) : reg78) ?
                       $signed($signed(wire100)) : $signed(reg96)));
  assign wire103 = {$unsigned(reg72),
                       (!$signed((wire92 ?
                           $unsigned(wire65) : $signed(reg73))))};
  assign wire104 = $unsigned($unsigned(reg72[(4'h9):(3'h5)]));
  assign wire105 = $unsigned(reg80);
  assign wire106 = wire91;
endmodule
