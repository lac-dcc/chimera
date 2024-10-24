module top
#(parameter param97 = ((~{{(^(8'hbb))}, {((8'hb4) << (8'h9d))}}) ? ({((~^(8'h9e)) ? ((8'hb7) ? (8'hb9) : (8'hbb)) : ((8'ha8) ^~ (8'ha8)))} ^~ (((|(8'h9d)) + (~(8'hb8))) >> ((~&(8'hb2)) ^~ ((8'ha3) <= (8'h9e))))) : (~|({(~|(8'hbf))} << ((^~(8'h9f)) ? ((8'hab) & (8'h9d)) : ((8'ha1) >>> (7'h43)))))), 
parameter param98 = ((((&param97) - (param97 <= param97)) | ({{param97}, param97} ? param97 : (~&param97))) ~^ param97))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h237):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire92;
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire51,
                 wire5,
                 wire17,
                 wire18,
                 wire35,
                 wire53,
                 wire54,
                 wire58,
                 wire59,
                 wire67,
                 wire92,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg57,
                 reg56,
                 reg55,
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
                 (1'h0)};
  assign wire5 = $unsigned($signed({(~|(wire3 ? wire3 : (8'hb4)))}));
  always
    @(posedge clk) begin
      reg6 <= ((&wire2[(4'h9):(1'h0)]) + (((wire0 >> (wire2 ? wire0 : wire5)) ?
              ((wire3 ?
                  wire5 : wire5) ~^ (~wire3)) : $unsigned($signed(wire1))) ?
          wire1[(4'hd):(2'h3)] : {wire5, (^~(wire4 ^~ wire3))}));
      reg7 <= wire2[(2'h2):(2'h2)];
      if (wire4)
        begin
          reg8 <= {(wire1 ? wire0[(2'h2):(2'h2)] : $signed(wire0)), wire1};
          reg9 <= ((+reg7[(1'h1):(1'h0)]) ?
              $signed({$signed($signed(wire3)),
                  (wire5 ? wire0 : wire0)}) : ({(reg6 << reg8[(3'h4):(2'h2)])} ?
                  wire1[(4'ha):(2'h2)] : wire0));
        end
      else
        begin
          reg8 <= ($signed((^reg6[(3'h6):(1'h0)])) != ($unsigned(reg7) ?
              wire0 : wire5[(3'h7):(2'h2)]));
          if ((8'hbd))
            begin
              reg9 <= $signed($unsigned(({$unsigned(reg6)} & $unsigned({wire1,
                  (8'h9f)}))));
              reg10 <= $unsigned(wire5[(3'h5):(1'h0)]);
              reg11 <= reg8;
            end
          else
            begin
              reg9 <= ((~^{(wire3 && ((8'hab) || reg6))}) ?
                  ((wire3 - {(reg9 ? reg6 : (8'haa))}) ?
                      $unsigned((^~wire3)) : (($signed(reg8) ?
                              (reg8 ? wire1 : wire5) : reg10[(3'h7):(3'h6)]) ?
                          (~(wire1 <<< wire4)) : reg11[(2'h2):(1'h0)])) : ((~{(wire4 ?
                              reg10 : (8'hb2))}) ?
                      ((+(reg11 ? wire2 : wire0)) ?
                          $unsigned((~reg9)) : wire3[(4'h8):(1'h0)]) : $signed($signed($signed(wire4)))));
              reg10 <= ((^$unsigned(wire5[(4'h9):(3'h6)])) ?
                  wire2[(3'h7):(2'h2)] : reg10[(4'h8):(3'h6)]);
              reg11 <= $signed((!(|($unsigned((7'h43)) | (^~wire3)))));
              reg12 <= ((^~(wire2 ?
                  $unsigned({wire2,
                      wire0}) : ($signed(wire2) && $unsigned(reg9)))) <<< (reg10[(3'h6):(2'h2)] || (+(|$unsigned(reg9)))));
              reg13 <= (8'ha5);
            end
          reg14 <= ({(^~wire4),
              $unsigned({(reg7 ? wire4 : reg9),
                  $unsigned(reg13)})} & $unsigned($unsigned(($unsigned(reg6) ?
              wire4[(1'h0):(1'h0)] : reg12[(4'hf):(4'he)]))));
          reg15 <= reg13[(1'h1):(1'h1)];
          reg16 <= (($unsigned(reg15) ?
              ($signed($unsigned(reg12)) >>> ((wire5 >>> wire3) ?
                  $unsigned(reg11) : (!(8'ha6)))) : reg14[(1'h1):(1'h0)]) >>> (+{$unsigned($signed(wire3)),
              (&wire5)}));
        end
    end
  assign wire17 = (~^$signed($unsigned((wire3[(4'ha):(4'h9)] ~^ $unsigned(reg6)))));
  assign wire18 = {reg6};
  module19 #() modinst36 (wire35, clk, reg11, reg14, reg12, wire5);
  module37 #() modinst52 (wire51, clk, reg10, reg6, wire17, wire18, wire1);
  assign wire53 = (&$signed(wire3));
  assign wire54 = ({reg8[(2'h3):(1'h0)],
                          {$signed({reg15, (8'ha2)}), reg6[(4'h8):(3'h6)]}} ?
                      reg8[(3'h6):(2'h2)] : (^~(($signed(wire17) | reg6[(4'hd):(3'h7)]) ?
                          ({(8'ha3),
                              (8'haf)} <<< wire1) : ((reg16 + wire4) - $signed(wire1)))));
  always
    @(posedge clk) begin
      reg55 <= wire5[(4'hb):(1'h1)];
      reg56 <= $signed((~($unsigned($signed(reg15)) >= {(|wire54)})));
      reg57 <= $unsigned(($unsigned(reg11) ?
          (wire3 ?
              reg8[(2'h2):(2'h2)] : $signed((!reg8))) : ({$signed(reg13)} == {(8'haf)})));
    end
  assign wire58 = wire18[(4'h9):(2'h2)];
  assign wire59 = $signed((reg16[(3'h7):(1'h0)] | ((&(-(8'haf))) | $signed((-(8'ha1))))));
  always
    @(posedge clk) begin
      reg60 <= (8'haf);
      if (((($unsigned($unsigned((8'hb1))) > (~^wire2[(3'h5):(1'h1)])) ?
          ($signed((|reg56)) ?
              $signed(reg16) : reg7) : (+$signed((8'hbb)))) ~^ $signed((~^$unsigned($unsigned(reg6))))))
        begin
          if ($signed($unsigned((~|$unsigned(wire3[(4'hb):(2'h2)])))))
            begin
              reg61 <= (!{$signed($signed(reg6))});
              reg62 <= $signed(($signed(({wire51, reg11} < (+wire17))) ?
                  (wire35 | wire1[(2'h3):(1'h1)]) : $signed($signed((wire54 ?
                      (8'h9f) : reg6)))));
              reg63 <= wire51[(3'h7):(2'h3)];
            end
          else
            begin
              reg61 <= wire18;
              reg62 <= (wire35 ?
                  $signed(reg10) : $unsigned($signed($unsigned((+wire0)))));
              reg63 <= (~&$unsigned(($signed(reg12[(4'he):(2'h3)]) ?
                  reg9 : (wire0[(1'h1):(1'h1)] ?
                      $unsigned((8'hb5)) : ((8'ha7) ? reg9 : wire0)))));
            end
          reg64 <= ($unsigned(wire0[(4'h8):(3'h4)]) == reg56);
          reg65 <= (~&(7'h40));
        end
      else
        begin
          reg61 <= (~^(~^wire3));
        end
      reg66 <= reg10[(3'h7):(3'h7)];
    end
  assign wire67 = (-(8'ha2));
  always
    @(posedge clk) begin
      reg68 <= reg15;
      reg69 <= $unsigned((8'hb8));
      if (($signed((($signed((8'hb1)) ? reg8 : (reg7 ? reg16 : reg8)) ?
          ((reg63 ?
              reg56 : reg65) >> wire35) : $signed($signed(reg64)))) && (reg15 ?
          reg56 : reg8[(2'h3):(2'h3)])))
        begin
          reg70 <= (&{(reg64 | ((reg16 + reg63) ?
                  $signed(wire67) : $signed(reg11))),
              wire4[(1'h0):(1'h0)]});
          reg71 <= {$signed($signed(reg15[(3'h4):(1'h0)])),
              {{(~&$signed(wire53))}}};
        end
      else
        begin
          reg70 <= wire1[(1'h0):(1'h0)];
          if (reg57[(3'h7):(3'h6)])
            begin
              reg71 <= reg64;
              reg72 <= wire4[(3'h4):(3'h4)];
              reg73 <= $signed((^reg13));
              reg74 <= $signed(reg13);
            end
          else
            begin
              reg71 <= wire18;
              reg72 <= ($signed($unsigned((reg72 ?
                  $unsigned(reg69) : $signed(reg62)))) || $unsigned($signed($signed(((8'ha3) & reg70)))));
              reg73 <= ($signed(wire58) <= ($signed($signed(wire1[(4'hb):(3'h5)])) ?
                  ({wire58,
                      wire2[(3'h5):(3'h4)]} < $signed(reg71[(4'h9):(1'h0)])) : (((wire59 <<< reg61) <<< wire3[(4'hb):(3'h6)]) ?
                      ($signed((8'hab)) ?
                          (reg60 >= reg6) : (^~wire2)) : {$unsigned(reg62),
                          (reg15 ? reg13 : wire54)})));
              reg74 <= {$unsigned((!$unsigned(reg15)))};
              reg75 <= reg14;
            end
          reg76 <= (reg69 >>> reg7[(4'hf):(4'he)]);
          reg77 <= ({(~reg66),
              (wire67 ?
                  (-reg15) : (wire51[(4'h8):(3'h7)] << (wire67 ?
                      reg70 : wire51)))} != reg65[(1'h1):(1'h0)]);
        end
      reg78 <= $signed((^~($unsigned($signed(wire58)) ^ {(wire17 >> wire1),
          (wire5 - reg68)})));
      reg79 <= (7'h40);
    end
  module80 #() modinst93 (.wire81(wire18), .wire83(reg62), .clk(clk), .wire85(wire1), .wire84(wire51), .wire82(reg77), .y(wire92));
  assign wire94 = wire54;
  assign wire95 = (|{(((reg63 ?
                          reg65 : wire94) == reg16) > ($unsigned(reg10) <= (~^wire53))),
                      $unsigned(reg62)});
  assign wire96 = reg78;
endmodule

module module80  (y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire85;
  input wire [(5'h15):(1'h0)] wire84;
  input wire [(4'ha):(1'h0)] wire83;
  input wire signed [(3'h5):(1'h0)] wire82;
  input wire [(5'h14):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  assign y = {wire91, wire90, wire89, wire88, wire87, wire86, (1'h0)};
  assign wire86 = ({$unsigned($signed({wire84, (8'ha0)}))} ?
                      wire82 : $unsigned({$unsigned($unsigned(wire83))}));
  assign wire87 = ($signed(wire86[(2'h2):(1'h0)]) ?
                      $signed($unsigned({((7'h41) | wire83)})) : $unsigned(($signed(wire81[(5'h14):(4'hd)]) | ($signed((7'h43)) ?
                          (8'hab) : (wire85 ? wire82 : wire83)))));
  assign wire88 = (8'hab);
  assign wire89 = $signed({(wire88[(1'h0):(1'h0)] >> $signed((+(8'hb6)))),
                      $unsigned({$signed((8'hb0)), $unsigned(wire87)})});
  assign wire90 = wire82[(3'h5):(1'h0)];
  assign wire91 = $signed(($signed($unsigned((~wire82))) ?
                      wire84[(5'h11):(3'h6)] : $unsigned((wire87[(4'hc):(1'h0)] | $unsigned(wire90)))));
endmodule

module module37
#(parameter param49 = (({(~(~&(8'h9c))), (((8'hb2) ? (8'ha9) : (7'h44)) ? ((8'hb7) ? (8'hbc) : (8'ha9)) : (~(8'hae)))} ? (&(((8'hb0) ? (8'hae) : (8'ha0)) ? ((8'ha4) ? (8'hba) : (8'ha4)) : (~(8'hbf)))) : ((((8'h9f) ? (8'ha5) : (8'hbe)) ^ ((8'ha0) ? (8'ha8) : (8'hb8))) || (((8'h9e) >> (8'hbf)) ? {(7'h40), (8'hb6)} : (~|(7'h41))))) ? (|(8'hb6)) : (~|(^{{(8'hbd)}, (&(8'ha3))}))), 
parameter param50 = param49)
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire42;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire [(4'hb):(1'h0)] wire39;
  input wire [(4'h8):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  assign y = {wire48, wire47, wire46, wire45, wire44, wire43, (1'h0)};
  assign wire43 = $unsigned(wire40[(3'h4):(1'h0)]);
  assign wire44 = (($signed((8'haa)) ?
                          $unsigned(({(8'hbf)} == $unsigned(wire39))) : (&(~|(+wire42)))) ?
                      (((8'hb8) ?
                          $signed($signed(wire39)) : (8'ha2)) > $signed($unsigned(wire39[(4'hb):(2'h2)]))) : (-wire42[(1'h1):(1'h0)]));
  assign wire45 = $unsigned((|$signed((^wire40))));
  assign wire46 = (~^wire42[(1'h1):(1'h1)]);
  assign wire47 = (-(~(|wire41[(1'h0):(1'h0)])));
  assign wire48 = wire43[(3'h7):(2'h2)];
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire23;
  input wire signed [(3'h6):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire25,
                 wire24,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire24 = {$unsigned(($unsigned({wire21}) - ((-wire23) ?
                          $signed(wire22) : (wire23 ? wire22 : wire22)))),
                      $unsigned(wire21)};
  assign wire25 = ($signed({((~&(8'hb3)) ? wire20 : $unsigned(wire22)),
                          {{(7'h41), (8'ha1)}, $unsigned(wire20)}}) ?
                      wire20[(3'h5):(1'h1)] : wire23);
  always
    @(posedge clk) begin
      reg26 <= $signed(wire21);
      reg27 <= ((wire24[(3'h4):(3'h4)] ?
          ($unsigned($signed((8'hbe))) >> (wire21 ?
              $signed(wire23) : (wire25 <= wire22))) : wire25) >= reg26);
      reg28 <= $signed((~((((8'hba) + wire24) ? wire20 : (!reg26)) ?
          (~^(reg26 ? wire24 : wire20)) : ({reg27, reg27} ?
              $signed(wire25) : $unsigned(wire20)))));
      reg29 <= (^{$signed(wire25[(4'h8):(3'h5)])});
    end
  always
    @(posedge clk) begin
      if ($signed(({wire24[(3'h7):(2'h2)], wire24} ?
          wire21 : $unsigned((~|wire20[(4'h9):(3'h5)])))))
        begin
          reg30 <= ((~^$unsigned($unsigned((8'h9e)))) && reg28);
          reg31 <= wire20;
        end
      else
        begin
          reg30 <= (reg31 ? (!(~reg27)) : (^wire22));
          reg31 <= wire22;
        end
    end
  assign wire32 = $signed((reg26 ^~ wire21));
  assign wire33 = wire21;
  assign wire34 = {(8'h9e)};
endmodule
