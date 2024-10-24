module top
#(parameter param82 = ({((!(~^(8'h9c))) << (|{(7'h43), (8'ha3)})), (8'hac)} ^ (^~((((8'hba) ? (7'h41) : (8'hb0)) ^ ((8'hb1) >= (8'hbb))) & (-((8'ha0) ? (8'hb7) : (7'h40)))))), 
parameter param83 = {((({param82} ? {param82} : (param82 ? (8'hb8) : param82)) ? param82 : (~&((8'hbb) ^~ (8'hb6)))) - ((^(~&(8'hb1))) ? ({param82, param82} > (param82 != param82)) : (^~param82))), (param82 != (~|(param82 ? (+param82) : (param82 ? param82 : param82))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire81,
                 wire79,
                 wire24,
                 wire23,
                 wire4,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ({wire1[(2'h2):(1'h1)]} <<< wire2);
  always
    @(posedge clk) begin
      if ((((&wire4[(2'h2):(1'h1)]) ?
          wire2[(4'h9):(2'h3)] : {($unsigned(wire1) != (7'h40))}) == {(|wire2)}))
        begin
          if (wire3)
            begin
              reg5 <= (8'hae);
              reg6 <= (^{$signed((wire1 ? $signed(wire0) : $signed(wire2)))});
              reg7 <= $unsigned((({wire2[(4'he):(4'hb)], $signed(reg6)} ?
                  ((8'ha1) && reg5[(3'h5):(2'h3)]) : $signed($unsigned((8'ha2)))) >>> wire1));
            end
          else
            begin
              reg5 <= $unsigned(($signed((8'hb0)) ?
                  reg7[(4'h9):(1'h1)] : $unsigned((^~(reg6 ?
                      (8'hb0) : reg5)))));
            end
          if ($unsigned(($signed((!(|(8'ha0)))) && $signed(wire0[(3'h6):(3'h5)]))))
            begin
              reg8 <= reg6[(1'h1):(1'h0)];
            end
          else
            begin
              reg8 <= (reg5[(3'h4):(1'h1)] * (&$unsigned($unsigned(((7'h40) ?
                  wire2 : reg8)))));
              reg9 <= (|$unsigned(wire4));
              reg10 <= {(~&$signed(reg9)), reg5[(2'h3):(1'h0)]};
            end
          reg11 <= $signed($unsigned($signed($unsigned((wire1 ?
              wire4 : reg5)))));
          if ($signed($signed($unsigned(wire1[(3'h4):(2'h2)]))))
            begin
              reg12 <= reg8;
              reg13 <= ($unsigned($unsigned((((8'h9e) ?
                      reg9 : (8'hba)) + (^~wire1)))) ?
                  ({$signed(reg11)} - ($unsigned((wire4 >>> (8'ha7))) ?
                      (|$signed((8'hb7))) : ((reg11 > reg8) ?
                          (|reg11) : reg8))) : $signed(wire4));
            end
          else
            begin
              reg12 <= wire0[(2'h3):(2'h3)];
              reg13 <= (reg12[(2'h2):(1'h0)] > (~|(({reg12} << ((8'hab) <<< wire1)) ?
                  (|(reg10 ^~ reg6)) : $unsigned($signed(wire2)))));
              reg14 <= (~$unsigned((($unsigned(reg12) ?
                      {wire1} : $unsigned((8'ha6))) ?
                  ((8'hb6) >> reg11) : (-(8'hb0)))));
              reg15 <= reg6;
            end
        end
      else
        begin
          reg5 <= (((wire1 && {wire3[(3'h7):(3'h7)]}) + $unsigned(reg10)) ?
              reg12 : {$unsigned((reg15 ? $unsigned(reg12) : wire3)),
                  (~|reg5)});
          reg6 <= $unsigned((8'hbb));
        end
      reg16 <= wire0[(3'h4):(1'h1)];
      if ($unsigned(($unsigned(($signed(reg11) + ((8'hae) ?
          reg15 : wire3))) ^ ((~&(!reg8)) ?
          (~^reg9) : $unsigned($signed(reg16))))))
        begin
          reg17 <= reg9[(2'h3):(1'h0)];
        end
      else
        begin
          reg17 <= reg8[(2'h3):(2'h3)];
          reg18 <= $unsigned($unsigned(($signed(((8'hb3) ~^ reg14)) ?
              $unsigned(reg6[(1'h1):(1'h0)]) : (reg7 + (^~reg11)))));
          reg19 <= ($unsigned($unsigned({reg15})) + {($unsigned(reg11) * (~|(~&reg16))),
              (reg18[(4'hb):(2'h2)] ?
                  (^(wire1 ? wire2 : wire2)) : $unsigned(reg8))});
          reg20 <= $signed($unsigned((wire4[(1'h1):(1'h0)] ?
              wire2[(3'h6):(1'h0)] : ($unsigned(wire3) ^~ {reg5}))));
          reg21 <= $unsigned(reg13[(3'h5):(2'h2)]);
        end
      reg22 <= $unsigned((8'hb3));
    end
  assign wire23 = (^~(8'hb9));
  assign wire24 = (8'ha1);
  module25 #() modinst80 (.wire28(reg18), .clk(clk), .wire29(reg17), .y(wire79), .wire27(wire2), .wire26(wire0));
  assign wire81 = ((!(+$unsigned(reg20[(3'h5):(3'h5)]))) ?
                      ((8'hb3) ?
                          wire24 : reg7) : (+$signed(wire0[(2'h3):(2'h3)])));
endmodule

module module25
#(parameter param77 = (!(^~((^~((8'hae) ? (8'ha6) : (8'ha9))) && ((+(8'hb4)) + (~&(7'h43)))))), 
parameter param78 = ((~((~&(param77 ? (7'h44) : param77)) ? param77 : param77)) ? (param77 ? (param77 ? (^(^param77)) : (!(param77 ? param77 : param77))) : ((~|param77) ? (~|{param77, param77}) : (param77 + (~(8'ha3))))) : (param77 >> param77)))
(y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire [(4'h8):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire51;
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  assign y = {wire76,
                 wire74,
                 wire55,
                 wire54,
                 wire53,
                 wire30,
                 wire31,
                 wire32,
                 wire34,
                 wire51,
                 reg75,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg33,
                 (1'h0)};
  assign wire30 = $signed({$unsigned($unsigned(wire29)),
                      $unsigned((|$signed(wire29)))});
  assign wire31 = (8'ha2);
  assign wire32 = $signed(wire27);
  always
    @(posedge clk) begin
      reg33 <= $signed((wire30[(1'h0):(1'h0)] - ($signed(wire30) ?
          wire31 : $unsigned($signed(wire32)))));
    end
  assign wire34 = {({($unsigned((8'ha1)) < $signed(wire32)),
                              (~$signed(wire30))} ?
                          (((wire32 ? (8'ha4) : (8'hb0)) ?
                              reg33[(1'h1):(1'h1)] : (7'h42)) + (^~(~wire30))) : wire26)};
  module35 #() modinst52 (wire51, clk, reg33, wire30, wire29, wire28);
  assign wire53 = $unsigned({wire34[(1'h0):(1'h0)]});
  assign wire54 = wire28;
  assign wire55 = wire34[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg56 <= wire31[(3'h4):(1'h0)];
      if ((($signed($unsigned((wire30 >= wire28))) ?
              $signed($signed(wire51)) : ({$signed((8'hbb)),
                  (+wire53)} > $signed((~&wire32)))) ?
          ($unsigned(({wire27} ^~ wire31[(2'h3):(2'h2)])) ?
              reg56 : wire29) : (wire30 >= wire28[(3'h7):(3'h4)])))
        begin
          reg57 <= {(~(+$unsigned($signed(reg56))))};
          reg58 <= ($unsigned(wire26) ?
              ($unsigned(reg57[(3'h5):(3'h4)]) ?
                  (+$unsigned(wire53)) : {(wire28[(3'h7):(2'h3)] ?
                          $unsigned(wire26) : wire34),
                      $unsigned(wire54[(1'h0):(1'h0)])}) : $unsigned(wire51[(1'h0):(1'h0)]));
          reg59 <= (reg57[(1'h1):(1'h0)] <<< ((!{wire32[(3'h5):(2'h2)]}) ?
              {$unsigned((reg33 >> wire30))} : $unsigned((wire30[(1'h1):(1'h1)] < reg56))));
        end
      else
        begin
          reg57 <= $unsigned(((reg57[(3'h5):(1'h1)] * (|$signed(wire29))) < {(8'hbe),
              ({wire34, reg33} > $unsigned(wire51))}));
          reg58 <= $unsigned($unsigned((wire30[(1'h1):(1'h0)] ?
              ($signed(reg57) ?
                  wire26[(3'h4):(1'h0)] : (-wire28)) : $unsigned((wire29 ?
                  wire55 : reg59)))));
        end
      if ({wire54})
        begin
          reg60 <= $signed((wire27[(3'h6):(3'h4)] >= (8'ha6)));
          reg61 <= wire32;
          reg62 <= ($unsigned($signed($signed((~|reg57)))) - (reg61 ?
              $unsigned(reg33[(1'h0):(1'h0)]) : {wire29, $signed((8'ha9))}));
          if ($unsigned($unsigned(((wire54[(1'h1):(1'h0)] + wire27[(3'h7):(3'h4)]) ?
              wire53 : (!(^~reg62))))))
            begin
              reg63 <= (^~wire32);
            end
          else
            begin
              reg63 <= $unsigned(reg56[(2'h2):(2'h2)]);
              reg64 <= ((!{($unsigned(reg60) ? wire29 : wire51)}) <= (7'h42));
            end
          reg65 <= wire29;
        end
      else
        begin
          reg60 <= ($signed(reg62[(3'h5):(1'h0)]) >>> $unsigned($signed((wire53[(2'h3):(2'h2)] ?
              (!wire28) : reg56))));
        end
      if ((~|({(reg59 ~^ reg58)} ^ wire32)))
        begin
          if ($unsigned(($signed(($signed((8'hb4)) ?
                  {(8'hb5), reg59} : (~^reg65))) ?
              reg65 : reg64[(2'h2):(2'h2)])))
            begin
              reg66 <= {wire34, (reg33 ? reg33 : reg60[(3'h6):(1'h0)])};
              reg67 <= reg33;
              reg68 <= (8'haa);
              reg69 <= (8'hba);
            end
          else
            begin
              reg66 <= (((((^reg63) || wire32) ?
                      (8'hb5) : {$unsigned(wire32)}) || ((^reg61) ?
                      reg66[(2'h3):(1'h0)] : reg33)) ?
                  wire51[(5'h10):(3'h4)] : (!wire30[(2'h3):(1'h1)]));
            end
          reg70 <= (+((+reg65) + wire28[(1'h0):(1'h0)]));
          reg71 <= reg65;
        end
      else
        begin
          reg66 <= reg63[(2'h2):(1'h1)];
          reg67 <= (wire51[(5'h11):(3'h4)] ? (8'ha8) : wire32);
          reg68 <= (8'hbf);
        end
    end
  always
    @(posedge clk) begin
      reg72 <= $unsigned($signed($signed((!(8'ha0)))));
      reg73 <= {{$signed(reg62[(3'h5):(2'h2)]), wire32[(3'h4):(2'h3)]}};
    end
  assign wire74 = wire30[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg75 <= ({{{(reg68 ? reg68 : reg73)},
              (wire51 >>> (wire32 <<< (8'hb6)))}} ^ $unsigned({$signed((8'ha3))}));
    end
  assign wire76 = $signed(($unsigned(reg63) ?
                      {$signed(wire30[(2'h2):(1'h0)]),
                          wire30} : (-$signed($signed(wire34)))));
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire39;
  input wire [(3'h4):(1'h0)] wire38;
  input wire signed [(3'h4):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire41,
                 wire40,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = $unsigned((~^(^~(wire37[(2'h3):(1'h0)] ?
                      (+wire39) : wire39))));
  assign wire41 = $signed((wire37 <= ({wire36[(3'h7):(2'h2)],
                      (wire37 ? wire40 : wire36)} >>> $signed({wire37}))));
  always
    @(posedge clk) begin
      reg42 <= wire40;
      reg43 <= (wire39[(2'h3):(1'h0)] > (({((8'hb7) ? wire41 : (8'ha9)),
              (wire41 ? wire39 : wire40)} ?
          reg42[(1'h1):(1'h1)] : wire39) ^ {wire40}));
      reg44 <= $unsigned({(+$signed($signed((8'hb4)))),
          ({$signed(wire41), reg42} != {(+wire41)})});
      reg45 <= ($signed($signed((8'ha8))) ?
          $signed($signed((&(wire41 >> wire37)))) : ((reg44[(4'ha):(3'h4)] > wire38[(1'h1):(1'h0)]) ?
              $signed((8'hab)) : ($unsigned({(8'hbb),
                  wire39}) <= $unsigned((~|reg42)))));
      reg46 <= ($signed(wire38) <= ((-reg44[(4'h8):(3'h4)]) ?
          $signed(((wire37 ? wire37 : (8'hb2)) ?
              $unsigned((8'ha5)) : reg45)) : reg42[(2'h3):(1'h1)]));
    end
  assign wire47 = $signed(reg42);
  assign wire48 = $unsigned(((reg45[(1'h0):(1'h0)] ?
                          $signed($unsigned(wire37)) : $signed((&wire36))) ?
                      reg42[(1'h0):(1'h0)] : (~|(8'hbb))));
  assign wire49 = ({$unsigned((wire47 < wire39[(3'h6):(3'h4)]))} > $unsigned({(~^(wire40 ?
                          wire38 : reg42))}));
  assign wire50 = wire38[(2'h2):(1'h1)];
endmodule
