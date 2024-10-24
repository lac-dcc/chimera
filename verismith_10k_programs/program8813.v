module top
#(parameter param171 = {{((&((8'hbf) | (8'hbc))) ? (((7'h43) == (8'hac)) ? {(7'h42)} : {(7'h42)}) : (8'ha6))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire170;
  wire signed [(4'ha):(1'h0)] wire163;
  wire signed [(3'h7):(1'h0)] wire147;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire21;
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(5'h10):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  assign y = {wire170,
                 wire163,
                 wire147,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
                 wire21,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
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
                 (1'h0)};
  assign wire5 = ($signed((wire2 ? $unsigned({wire1, (8'ha9)}) : (|(!wire3)))) ?
                     $unsigned((((+wire3) ? (|(7'h41)) : {wire1, wire0}) ?
                         $signed(wire4) : {$signed(wire0),
                             $signed((8'h9e))})) : (($signed((wire0 ^ wire0)) - wire3) ?
                         wire4[(4'hf):(4'he)] : $unsigned($unsigned((~&wire3)))));
  module6 #() modinst22 (wire21, clk, wire5, wire3, wire4, wire1, wire2);
  assign wire23 = {$signed(wire5), wire1[(4'h9):(4'h9)]};
  assign wire24 = (({$unsigned(wire21[(4'hd):(3'h4)])} || ($unsigned({wire2,
                          wire4}) ?
                      (^{wire21,
                          wire2}) : (-wire5))) <= (wire23 && $unsigned(((8'hb2) || (wire4 || wire23)))));
  assign wire25 = wire5[(2'h3):(2'h3)];
  assign wire26 = ((+wire25[(3'h7):(3'h7)]) ?
                      $signed({$unsigned((8'hba))}) : {$unsigned((wire24 >> (|wire4))),
                          wire5});
  module27 #() modinst148 (.wire31(wire25), .wire28(wire23), .clk(clk), .y(wire147), .wire30(wire1), .wire29(wire2));
  always
    @(posedge clk) begin
      reg149 <= wire147[(3'h5):(2'h3)];
      reg150 <= {wire1[(2'h2):(1'h0)],
          ({($unsigned(wire5) >= $unsigned(wire24))} != {((wire3 ?
                  (8'h9c) : wire26) <<< {wire21}),
              wire24[(2'h2):(1'h1)]})};
      reg151 <= wire23[(4'hc):(4'ha)];
      reg152 <= $unsigned((reg151 > wire0));
    end
  always
    @(posedge clk) begin
      reg153 <= wire23;
      reg154 <= wire0;
      if (reg149)
        begin
          reg155 <= $unsigned((~$unsigned(wire5[(4'hb):(4'h8)])));
          if (((+({(~^wire147), ((8'ha5) == (8'h9c))} * (~|$signed((8'hb3))))) ?
              $signed(((!((8'hac) ?
                  reg154 : reg150)) << $signed($signed(wire23)))) : reg154[(4'hd):(3'h7)]))
            begin
              reg156 <= reg153;
            end
          else
            begin
              reg156 <= $unsigned((^(~&wire0)));
              reg157 <= ($unsigned((~|$unsigned($signed(wire26)))) >>> wire5);
              reg158 <= $signed((8'h9f));
              reg159 <= wire25[(5'h14):(4'hc)];
            end
          if ($unsigned(wire24))
            begin
              reg160 <= $unsigned($unsigned((8'hbc)));
              reg161 <= $unsigned({$unsigned((~&$signed(reg155))),
                  (-$unsigned(reg158))});
              reg162 <= reg154;
            end
          else
            begin
              reg160 <= (-{$signed(reg150)});
              reg161 <= {((!(reg158[(4'hf):(4'hc)] == $signed(reg154))) >>> reg159)};
            end
        end
      else
        begin
          reg155 <= reg157[(4'h9):(4'h9)];
          reg156 <= $signed(((8'hab) ?
              (((~&(8'hae)) ? reg150 : wire23) ?
                  reg159[(1'h0):(1'h0)] : reg149[(3'h6):(1'h0)]) : $unsigned($signed((-reg150)))));
        end
    end
  assign wire163 = (wire5[(2'h3):(2'h3)] ?
                       $unsigned($signed(((reg152 ?
                           reg160 : (7'h42)) >= wire25[(4'ha):(3'h4)]))) : wire3[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg164 <= reg156;
      reg165 <= $unsigned((({(wire5 ? (8'hab) : reg159)} - ((wire5 ?
          reg158 : wire147) != (8'ha4))) >= $unsigned(($unsigned((8'hb7)) ?
          reg159[(3'h5):(2'h3)] : (|wire26)))));
      reg166 <= $unsigned((8'hb8));
      if (((!$signed(wire0[(1'h0):(1'h0)])) ?
          (({$signed(reg164), (wire0 ? reg165 : wire4)} ?
                  ((reg154 >> wire21) >= reg160) : (wire21 && ((8'hac) <<< (8'hbe)))) ?
              $signed($signed(reg162[(4'h9):(2'h2)])) : $signed($signed((~|wire25)))) : wire24[(2'h2):(1'h1)]))
        begin
          if (((reg157[(4'h8):(1'h0)] ?
                  $unsigned((^~(reg161 >> reg161))) : (!$unsigned(wire21[(4'hd):(3'h5)]))) ?
              $unsigned((-reg151[(4'ha):(3'h5)])) : (7'h44)))
            begin
              reg167 <= (~^(wire147[(1'h1):(1'h1)] | (^($signed(wire24) > $unsigned((8'hac))))));
              reg168 <= wire4;
            end
          else
            begin
              reg167 <= {(wire4 != $unsigned(reg159[(2'h3):(1'h0)])),
                  (~^wire5[(5'h11):(1'h1)])};
              reg168 <= wire1[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg167 <= $unsigned(((|($unsigned(wire3) ?
              $signed((8'ha0)) : $unsigned(reg162))) || ({reg161} ?
              $signed($signed(wire5)) : $signed((^~reg167)))));
          reg168 <= (^$signed($signed((~^(wire5 >>> (8'hb8))))));
          reg169 <= $signed((((^((8'ha7) ^ reg157)) ?
                  $signed($signed(wire5)) : (~^reg162)) ?
              $unsigned($unsigned((wire24 ?
                  wire0 : (8'ha2)))) : reg162[(4'hf):(4'hd)]));
        end
    end
  assign wire170 = wire4;
endmodule

module module27
#(parameter param145 = {{(((!(8'haf)) ^ ((8'ha2) != (8'hb9))) >= (-{(8'ha9)})), (|((8'ha9) ? {(8'hb4)} : {(8'hae), (8'ha4)}))}}, 
parameter param146 = ((param145 ? (~(-{param145})) : ({(|param145)} ^~ (~param145))) ? (param145 ? (((8'hac) ? (param145 ? param145 : param145) : (param145 ? param145 : (8'hb1))) ? (~|(^param145)) : {{param145, param145}, (param145 ? param145 : param145)}) : (~|param145)) : ((~|(param145 ? param145 : ((8'haa) + param145))) ? (((param145 ? (8'hac) : param145) ? param145 : (param145 | param145)) < ((^~param145) - (param145 << param145))) : param145)))
(y, clk, wire28, wire29, wire30, wire31);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire131;
  wire [(3'h4):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire129;
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  assign y = {wire143,
                 wire131,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire62,
                 wire64,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire129,
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
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire32 = $signed(wire28);
  assign wire33 = $unsigned((&($unsigned(wire28[(4'ha):(3'h7)]) + $signed((wire30 & wire32)))));
  assign wire34 = (|wire33[(2'h2):(2'h2)]);
  assign wire35 = $signed($signed(wire33[(4'h9):(4'h9)]));
  assign wire36 = wire35[(1'h0):(1'h0)];
  module37 #() modinst63 (.wire41(wire28), .wire40(wire36), .wire39(wire30), .clk(clk), .wire38(wire34), .y(wire62));
  assign wire64 = $signed($signed(wire31));
  always
    @(posedge clk) begin
      if (((wire29[(1'h1):(1'h1)] ?
          wire35 : (+((wire35 ? (8'ha6) : wire31) >= (wire34 ?
              wire31 : wire62)))) >>> $signed(($unsigned({(8'hbe),
          wire28}) >>> $unsigned($unsigned(wire29))))))
        begin
          reg65 <= wire35[(2'h2):(2'h2)];
          reg66 <= (-wire64[(3'h5):(2'h3)]);
          reg67 <= (!(~^wire32[(2'h3):(2'h3)]));
          reg68 <= ((~$signed((^reg65[(4'hb):(4'h9)]))) ?
              $unsigned((reg66 ^ wire32[(1'h0):(1'h0)])) : (({(reg66 * (7'h44)),
                  (^~(8'hbb))} <= reg67[(4'h9):(1'h1)]) >>> wire33[(2'h3):(2'h3)]));
          if ($signed((-wire64[(1'h0):(1'h0)])))
            begin
              reg69 <= $unsigned($unsigned(($signed((wire30 - reg65)) * {$signed(wire33),
                  $unsigned((8'haf))})));
              reg70 <= (^wire35);
              reg71 <= {($unsigned(((reg70 ? (8'hae) : reg67) ?
                          $signed(wire35) : reg65[(4'h8):(3'h5)])) ?
                      $unsigned((wire32 << (~wire64))) : $signed($signed((^~(8'hac))))),
                  ((^wire64[(4'h9):(3'h6)]) ?
                      (^~wire35) : ((((8'hb5) ?
                              wire64 : wire29) && $signed(wire30)) ?
                          {(-wire29)} : (~&(8'h9c))))};
              reg72 <= ((((reg65 + wire29[(4'hc):(4'hb)]) ^ ($signed(reg66) < reg69)) ?
                      {wire35[(2'h3):(1'h1)]} : reg71) ?
                  ($unsigned(reg69) >= (~&{wire35})) : wire36[(3'h4):(3'h4)]);
              reg73 <= $signed($unsigned(reg72));
            end
          else
            begin
              reg69 <= ((({$unsigned(wire28)} ?
                      (^~(reg70 | wire64)) : ((reg72 ?
                          reg67 : wire33) <= ((8'ha8) ? wire35 : (8'hba)))) ?
                  (^$unsigned((reg65 != reg70))) : {(+(wire36 < wire34)),
                      (wire62 ?
                          wire30 : (~|wire36))}) <<< (wire29[(3'h6):(3'h6)] ?
                  wire64 : {wire64}));
              reg70 <= reg68;
              reg71 <= (((^reg65[(3'h6):(3'h4)]) && (-($signed(wire34) == $unsigned((8'ha7))))) && ($signed($signed((reg68 ~^ wire28))) - (reg65 * (+(&wire28)))));
              reg72 <= ($signed($unsigned(wire32)) >>> $signed({$unsigned(((8'h9d) <= reg66)),
                  $unsigned($unsigned((8'hb7)))}));
              reg73 <= wire28;
            end
        end
      else
        begin
          reg65 <= (~((~((8'ha7) >> $signed(wire29))) & reg71));
          reg66 <= wire35;
          reg67 <= $signed((~^($unsigned(reg65) ?
              wire36 : (reg70[(2'h3):(1'h0)] ?
                  (^wire31) : (reg70 ? reg73 : (7'h43))))));
          if (($unsigned(wire62[(4'hf):(4'hd)]) ?
              {{wire30}, $unsigned(wire33[(3'h4):(1'h0)])} : ((8'hbd) ?
                  $signed($unsigned((wire34 ? reg70 : reg67))) : wire31)))
            begin
              reg68 <= wire29;
              reg69 <= reg73[(3'h5):(3'h4)];
              reg70 <= ($unsigned(($signed(reg71) == wire30)) && (($signed((reg70 <<< wire32)) | $unsigned($unsigned(wire35))) * wire33[(4'ha):(3'h6)]));
              reg71 <= (~&$unsigned({reg72[(4'ha):(2'h2)]}));
              reg72 <= (wire35 ? wire31 : {(~&$signed($signed(reg71))), reg70});
            end
          else
            begin
              reg68 <= (reg67 ?
                  (reg66 ?
                      {reg66[(1'h1):(1'h0)],
                          wire35[(2'h2):(1'h1)]} : (((~&wire31) <<< (~reg73)) ?
                          (~$unsigned(reg72)) : (wire32[(1'h1):(1'h1)] ?
                              (wire34 || wire28) : $unsigned(reg68)))) : $unsigned(($unsigned(reg65[(5'h11):(1'h1)]) >>> reg68)));
              reg69 <= ($signed(reg66[(2'h2):(1'h1)]) || ($signed((&{reg68,
                      wire31})) ?
                  reg68[(2'h3):(1'h0)] : ($unsigned({reg73,
                      (8'hb1)}) ^~ $signed(wire32[(1'h1):(1'h1)]))));
              reg70 <= {(wire28[(3'h7):(3'h7)] != $signed(((reg68 ^ (8'ha1)) ?
                      $unsigned((8'hbe)) : $signed(reg72))))};
              reg71 <= wire34;
            end
        end
      if ({{(8'hbc)},
          (!((~wire64[(1'h1):(1'h0)]) ?
              ((~wire29) ?
                  (reg65 ? wire64 : (8'hbe)) : $signed(reg66)) : wire33))})
        begin
          reg74 <= (wire33 ?
              {reg65, wire34[(3'h4):(2'h2)]} : {(~|reg68),
                  $signed($signed($unsigned(wire28)))});
        end
      else
        begin
          if (reg68[(4'hc):(4'ha)])
            begin
              reg74 <= $signed(wire62);
              reg75 <= (($signed({$unsigned(reg67),
                          (wire33 ? wire28 : (7'h41))}) ?
                      $unsigned(($signed(reg65) ?
                          wire33 : $signed(reg69))) : $signed(((wire34 ?
                              wire64 : reg73) ?
                          (reg72 ? reg67 : wire29) : reg71))) ?
                  ((^wire29) ? reg71 : reg72[(4'h9):(4'h9)]) : reg68);
              reg76 <= (-(8'ha3));
            end
          else
            begin
              reg74 <= reg71[(3'h7):(3'h7)];
              reg75 <= reg70;
              reg76 <= ($signed($signed(($unsigned(reg66) << wire30))) ^~ $unsigned((|$unsigned(reg67[(3'h4):(2'h2)]))));
            end
        end
      reg77 <= wire32;
      reg78 <= (wire34[(4'h8):(2'h3)] ?
          reg76 : $signed((+(+reg74[(5'h13):(5'h11)]))));
    end
  assign wire79 = reg77;
  assign wire80 = ($unsigned(reg78) ?
                      (({$unsigned(wire28)} ?
                          wire33[(3'h5):(2'h2)] : $unsigned($signed(reg68))) - {reg76}) : $signed((!reg69[(4'hf):(1'h1)])));
  assign wire81 = (~^reg78);
  assign wire82 = ({(~|reg71[(3'h4):(2'h3)])} ?
                      (wire32[(1'h0):(1'h0)] <<< reg69) : (((8'h9e) ^ (~$unsigned((8'ha1)))) > reg69[(4'he):(4'hb)]));
  assign wire83 = $signed((^$unsigned(reg71[(2'h3):(1'h1)])));
  module84 #() modinst130 (.wire89(wire29), .wire87(wire62), .wire86(reg67), .clk(clk), .wire88(wire82), .wire85(reg77), .y(wire129));
  assign wire131 = $signed(wire31[(4'hb):(2'h2)]);
  module132 #() modinst144 (.clk(clk), .y(wire143), .wire135(reg66), .wire136(reg73), .wire133(wire32), .wire134(wire34));
endmodule

module module6
#(parameter param20 = (^(-{(^~((8'ha2) ? (7'h42) : (8'ha8))), (((8'ha0) * (8'had)) ? ((8'had) && (8'hbb)) : ((8'ha2) ? (8'hbf) : (8'hbc)))})))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire8))
        begin
          reg12 <= $unsigned({$signed((wire9 ? wire9 : wire9[(1'h1):(1'h1)])),
              wire7[(3'h5):(2'h2)]});
          reg13 <= wire7[(3'h7):(3'h7)];
          reg14 <= (8'hb1);
          reg15 <= (wire9[(1'h1):(1'h1)] ?
              (&reg14) : ((+($signed(reg13) < $signed((8'hba)))) >> (((reg14 <<< reg13) >> reg12[(4'hd):(3'h7)]) << reg13[(3'h7):(2'h2)])));
          reg16 <= (reg15 ?
              (~reg13) : $signed({($signed(reg12) ^ $unsigned(wire9)), reg14}));
        end
      else
        begin
          reg12 <= wire8;
        end
    end
  assign wire17 = ((8'haf) ? (reg12 ? wire11 : reg14) : wire10[(4'h8):(3'h7)]);
  assign wire18 = reg14[(4'h8):(2'h2)];
  assign wire19 = (((|(^~$signed(wire8))) & {(!(wire7 ? wire17 : wire18)),
                          ((~wire11) ?
                              (reg16 ? wire8 : wire10) : $signed(wire11))}) ?
                      reg14 : ((^wire9) ?
                          wire10[(4'he):(1'h1)] : ((&$signed(reg16)) ?
                              (~|{wire18}) : ((~(8'ha0)) ?
                                  (wire17 ? wire10 : wire18) : reg12))));
endmodule

module module132
#(parameter param142 = ((~&(~(((7'h41) >>> (8'hb1)) * (^(7'h40))))) ? (((((8'ha1) ? (8'ha7) : (8'hac)) | ((8'hba) & (8'hb8))) < ((8'hbd) ? ((8'h9e) + (8'hae)) : (!(8'ha1)))) ? ((|((8'ha3) - (8'ha2))) ? (((8'hae) ? (8'hac) : (8'hbd)) ? ((8'hb8) ? (7'h43) : (7'h40)) : ((8'hac) <= (7'h40))) : (|{(8'hbc), (8'hbb)})) : (^~((^~(7'h43)) ? {(8'ha8), (8'ha2)} : (8'hb5)))) : (8'hbb)))
(y, clk, wire136, wire135, wire134, wire133);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire136;
  input wire [(4'h8):(1'h0)] wire135;
  input wire signed [(4'hd):(1'h0)] wire134;
  input wire [(3'h4):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire137;
  assign y = {wire141, wire140, wire139, wire138, wire137, (1'h0)};
  assign wire137 = (~|(^{{$unsigned(wire133), (wire135 ? wire134 : wire136)},
                       $signed($signed(wire133))}));
  assign wire138 = wire135[(2'h2):(1'h1)];
  assign wire139 = wire136;
  assign wire140 = ((^wire136) ?
                       $unsigned($unsigned(wire135[(3'h7):(1'h0)])) : wire138);
  assign wire141 = (|wire140[(4'hd):(1'h1)]);
endmodule

module module84
#(parameter param128 = {({(^((8'had) ? (8'h9e) : (8'hbf)))} ? ((((8'hb5) <= (8'ha8)) ? {(8'ha4), (8'hb4)} : ((8'hb3) < (8'hac))) ? ((8'haf) < (8'h9c)) : ((~&(8'h9f)) ^ (|(8'ha8)))) : {(((8'ha3) >>> (8'ha4)) ? (^~(7'h43)) : ((8'h9f) == (8'hb7))), {((8'hb6) ? (8'ha9) : (8'haf)), ((8'ha4) ^~ (8'hb6))}})})
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire89;
  input wire signed [(4'hd):(1'h0)] wire88;
  input wire signed [(4'h8):(1'h0)] wire87;
  input wire [(5'h15):(1'h0)] wire86;
  input wire [(4'hb):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(5'h10):(1'h0)] wire124;
  wire [(4'hb):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire90;
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
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
                 wire90,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
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
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire90 = wire86[(5'h14):(1'h0)];
  always
    @(posedge clk) begin
      reg91 <= $unsigned((-$signed(($unsigned(wire86) <= wire90))));
      reg92 <= $unsigned(((reg91[(1'h1):(1'h1)] >> (&wire88)) ?
          (^~(^wire90)) : wire87[(3'h5):(2'h3)]));
      reg93 <= ((^(($unsigned(wire86) * (-(8'hb1))) && reg92)) * ((8'hb6) ?
          $signed((reg91[(1'h0):(1'h0)] + (reg92 ?
              wire89 : wire90))) : $unsigned((~|wire88[(3'h4):(1'h1)]))));
      reg94 <= $signed(reg91[(2'h3):(1'h0)]);
      if (({reg94, wire88} ~^ $unsigned({(^~(~^wire90)),
          reg91[(1'h0):(1'h0)]})))
        begin
          if (reg92)
            begin
              reg95 <= $unsigned({reg92[(4'h9):(4'h8)]});
              reg96 <= (~reg91[(1'h0):(1'h0)]);
            end
          else
            begin
              reg95 <= $signed({reg95});
              reg96 <= $signed((($signed((7'h42)) ? wire85 : wire85) ?
                  wire87 : ((wire87 > (+reg91)) ?
                      (wire89[(3'h7):(3'h6)] ?
                          $unsigned(reg96) : $signed(wire85)) : $unsigned((wire86 << reg94)))));
              reg97 <= (8'hbc);
              reg98 <= ({{($unsigned(wire86) ?
                              (reg91 ?
                                  wire86 : reg94) : wire87[(1'h0):(1'h0)])}} ?
                  $unsigned(reg95[(2'h2):(1'h1)]) : wire89);
            end
          if ($signed(((|$signed(reg98[(4'he):(4'h8)])) >> $signed(reg93))))
            begin
              reg99 <= reg98;
              reg100 <= reg93[(1'h1):(1'h1)];
            end
          else
            begin
              reg99 <= reg98[(4'h9):(3'h7)];
            end
          reg101 <= ($signed((wire85 * $unsigned((reg97 > reg95)))) || $signed($unsigned($unsigned($unsigned(reg93)))));
          reg102 <= $unsigned((-(+($signed((8'h9e)) ~^ $signed((8'hb3))))));
          reg103 <= reg93[(5'h11):(4'hc)];
        end
      else
        begin
          reg95 <= $signed(wire89);
        end
    end
  assign wire104 = wire90;
  assign wire105 = (reg95[(4'hc):(2'h3)] ?
                       ((~^(^~wire88[(4'h9):(3'h6)])) <<< (reg93[(4'h8):(1'h0)] ?
                           ($signed(wire85) ~^ (wire90 ?
                               wire89 : reg91)) : reg92[(4'hc):(3'h5)])) : ($signed((~^(reg95 ?
                           reg95 : (7'h43)))) ~^ ((+(+reg101)) ?
                           wire85 : (reg102 || (!reg98)))));
  assign wire106 = reg98[(4'he):(2'h3)];
  assign wire107 = (((reg98 ?
                           wire85[(3'h7):(3'h5)] : {$unsigned(reg102)}) && (($unsigned((8'hb6)) ?
                           {wire88, reg102} : ((8'hbf) <= reg93)) < ({wire86,
                               reg99} ?
                           reg93[(3'h7):(3'h6)] : $signed(wire104)))) ?
                       reg97 : reg95);
  assign wire108 = (({wire104[(4'hc):(4'h8)]} ?
                           $signed($unsigned(wire90)) : $signed((wire88 - reg103))) ?
                       (({(~&reg98)} ?
                           $unsigned(reg93) : ((reg95 ? reg99 : reg99) ?
                               (~|(8'had)) : $signed((8'ha8)))) == (~&($signed(reg101) != reg103[(2'h2):(1'h0)]))) : (reg103[(2'h2):(1'h1)] ?
                           (^reg93[(5'h12):(5'h12)]) : (reg93 <= reg99)));
  assign wire109 = reg91;
  assign wire110 = ($signed($signed($signed($signed(wire89)))) > wire86[(1'h1):(1'h1)]);
  assign wire111 = (reg92[(3'h4):(1'h0)] ?
                       $unsigned((8'hba)) : $unsigned(wire90[(1'h0):(1'h0)]));
  assign wire112 = (-wire86);
  assign wire113 = $unsigned(({(|reg98[(4'he):(2'h3)]),
                       ((reg100 <<< reg93) ?
                           (wire109 ? (8'h9f) : wire87) : {wire88,
                               reg93})} >>> wire112[(3'h4):(1'h1)]));
  assign wire114 = wire88[(4'ha):(3'h5)];
  assign wire115 = $signed((7'h44));
  always
    @(posedge clk) begin
      reg116 <= $unsigned(reg91[(2'h3):(1'h0)]);
      reg117 <= ((~{reg101, $signed($signed(wire114))}) ?
          reg98 : (~|$unsigned($signed((+(8'h9e))))));
      if ($unsigned({{((reg102 == wire85) & (reg98 > wire111))},
          wire89[(3'h5):(3'h4)]}))
        begin
          reg118 <= $signed($signed((((&wire113) ?
                  (reg93 << reg94) : (wire107 ? reg91 : reg102)) ?
              $unsigned((~|wire107)) : (|(^~reg102)))));
          if (reg93)
            begin
              reg119 <= {$signed(((reg93[(4'hb):(4'ha)] ?
                      wire114[(4'hf):(3'h5)] : (reg95 ?
                          (8'hbb) : reg102)) <= $unsigned((!(8'haa))))),
                  wire86};
              reg120 <= $signed((($signed(reg101[(1'h0):(1'h0)]) >= reg101) ?
                  {reg116[(3'h4):(1'h0)], wire87} : wire105[(3'h4):(2'h2)]));
            end
          else
            begin
              reg119 <= {$signed((((reg99 ? reg97 : wire111) == wire90) ?
                      (^(wire106 ?
                          reg101 : wire107)) : $unsigned((reg94 <<< reg118))))};
              reg120 <= wire110[(4'h9):(2'h3)];
              reg121 <= (+{reg99[(4'hf):(3'h6)]});
            end
          reg122 <= $unsigned((!wire110[(3'h4):(1'h0)]));
          reg123 <= $unsigned(reg95[(3'h5):(1'h1)]);
        end
      else
        begin
          reg118 <= $unsigned(reg94[(3'h6):(1'h0)]);
          reg119 <= ($signed(wire85) ?
              $signed({(8'hbe)}) : {$unsigned($signed($signed(reg116)))});
          reg120 <= $signed($signed(wire110[(2'h3):(1'h0)]));
        end
    end
  assign wire124 = (-(reg103 ?
                       ((^(~wire85)) ?
                           (!$signed(wire112)) : wire108) : reg103[(2'h2):(1'h1)]));
  assign wire125 = wire105[(1'h1):(1'h1)];
  assign wire126 = reg119;
  assign wire127 = {($unsigned(((wire126 * (8'h9d)) ?
                           (8'hb9) : (&reg121))) + $unsigned(reg96))};
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  input wire signed [(5'h14):(1'h0)] wire39;
  input wire [(4'hb):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  assign y = {wire61,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire53,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg60,
                 reg55,
                 reg54,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire42 = (+$signed(((^((8'hac) ? wire40 : wire38)) ?
                      wire38 : ({wire40} || $signed(wire41)))));
  assign wire43 = {wire42};
  assign wire44 = wire38;
  assign wire45 = wire42[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg46 <= wire41;
      reg47 <= wire42[(3'h6):(3'h4)];
      reg48 <= (wire44[(3'h6):(1'h1)] <<< (+$signed((8'hb8))));
      reg49 <= (&(~$signed($unsigned(wire44))));
    end
  always
    @(posedge clk) begin
      reg50 <= (^~$unsigned(({reg47[(3'h6):(2'h3)]} ^ $signed(wire38))));
      reg51 <= reg49[(5'h10):(4'hc)];
      reg52 <= wire43[(1'h1):(1'h1)];
    end
  assign wire53 = ($signed((($unsigned((8'hae)) ?
                      $signed(reg50) : $unsigned(reg47)) ^~ wire42[(3'h7):(2'h2)])) ^ (({(wire45 | (8'haa)),
                              $unsigned(reg48)} ?
                          $unsigned($unsigned(wire38)) : $unsigned(((8'hb6) ?
                              wire44 : (8'hb0)))) ?
                      ((!(reg52 - (8'hb1))) || $signed(wire45)) : wire40[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg54 <= (~&reg50);
      reg55 <= $signed($unsigned((reg50 ?
          (~&$signed(reg48)) : $unsigned(reg52[(4'h9):(3'h5)]))));
    end
  assign wire56 = $unsigned((~^(wire45 ^~ $signed((wire42 ^ wire38)))));
  assign wire57 = $unsigned((~({(reg54 ? reg50 : (8'ha8)), (reg51 ^~ wire43)} ?
                      {(wire38 << wire43), wire45} : $unsigned(reg51))));
  assign wire58 = {reg47};
  assign wire59 = {(~^{$signed((wire53 >>> reg52)),
                          (wire58[(2'h3):(2'h3)] ?
                              (wire41 ? reg48 : wire38) : $signed(wire45))})};
  always
    @(posedge clk) begin
      reg60 <= (wire41 << $unsigned(($unsigned(wire43) || $unsigned($unsigned((8'hba))))));
    end
  assign wire61 = $unsigned($unsigned((reg52 ?
                      wire42[(4'hd):(2'h2)] : {reg50})));
endmodule
