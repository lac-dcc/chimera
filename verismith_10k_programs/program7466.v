module top
#(parameter param77 = {((8'hb5) ^~ ((((8'hb9) ? (8'hba) : (8'hb9)) ? ((8'ha6) ^ (8'ha2)) : (~(8'hb6))) | (8'hb4)))}, 
parameter param78 = ((({(param77 ? param77 : param77), {param77}} || ((8'hbe) ? (param77 && param77) : (param77 >>> param77))) ? (8'hbb) : {param77}) ? (((param77 ^~ (~|(8'hb0))) ? ((|param77) ? (~^param77) : (8'ha9)) : param77) ? ((8'hbf) ? param77 : (|(^param77))) : param77) : (param77 + (param77 ? ((param77 >>> param77) ~^ (param77 | param77)) : (!(+param77))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire5,
                 wire4,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (wire2[(4'he):(3'h5)] >>> $unsigned((wire0[(1'h1):(1'h1)] ^ $unsigned((wire0 ?
                     wire1 : (8'hbb))))));
  assign wire5 = $unsigned(wire1[(4'h9):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire4[(2'h3):(1'h0)])
        begin
          reg6 <= {wire1[(1'h0):(1'h0)]};
          if ((~$signed($unsigned(($unsigned(wire4) ?
              wire0[(1'h0):(1'h0)] : $signed(wire1))))))
            begin
              reg7 <= (&{wire3});
              reg8 <= wire2[(5'h10):(1'h1)];
            end
          else
            begin
              reg7 <= (~^(!wire5[(2'h2):(1'h0)]));
            end
          if ((wire1[(4'h8):(2'h2)] ?
              (~&(&$unsigned((8'ha9)))) : reg7[(3'h6):(1'h1)]))
            begin
              reg9 <= $signed(wire2[(3'h4):(2'h2)]);
            end
          else
            begin
              reg9 <= wire4[(2'h3):(1'h1)];
            end
          reg10 <= wire5;
        end
      else
        begin
          if (wire4[(3'h7):(3'h4)])
            begin
              reg6 <= (!(($unsigned((~^wire0)) & (8'hb3)) ?
                  (8'h9d) : ($signed(wire2) + (reg10[(2'h3):(1'h1)] + ((7'h44) < (8'ha8))))));
              reg7 <= ($signed((!reg6)) ? wire5 : (!(~&(+(|wire4)))));
            end
          else
            begin
              reg6 <= (wire1[(2'h2):(2'h2)] ? (wire0 ~^ (8'hb3)) : (~|(^reg9)));
              reg7 <= $unsigned((wire0 + $signed(reg9)));
              reg8 <= (8'h9d);
              reg9 <= ((~&wire4) ?
                  $signed($unsigned(((-(8'hb6)) >> (!reg10)))) : reg9[(2'h3):(2'h2)]);
            end
          reg10 <= (~^{(((wire5 >>> reg6) <= (~^wire0)) != $signed($unsigned((8'hbd)))),
              $signed($signed((wire4 > wire4)))});
          reg11 <= (wire5 ?
              $unsigned(wire0) : (~|$unsigned({reg6[(4'he):(4'ha)]})));
          reg12 <= ({($unsigned(wire0) ?
                      {(wire2 ?
                              wire5 : reg9)} : $signed(wire5[(4'ha):(2'h2)]))} ?
              $signed((8'h9f)) : (wire0[(4'he):(1'h0)] >> wire0[(1'h1):(1'h1)]));
        end
      reg13 <= (|(^$unsigned((&(reg6 && reg7)))));
    end
  module14 #() modinst53 (.wire18(wire1), .wire15(wire2), .y(wire52), .clk(clk), .wire17(reg13), .wire16(reg6));
  assign wire54 = ($signed(((-(reg11 * (7'h44))) ?
                          {{reg9}} : (~{wire4, reg6}))) ?
                      {(+((8'hab) ?
                              (8'ha6) : (reg8 >> reg7)))} : reg10[(1'h1):(1'h1)]);
  assign wire55 = $unsigned((|reg10));
  assign wire56 = $signed({(^wire0)});
  always
    @(posedge clk) begin
      if (wire52[(5'h10):(4'hb)])
        begin
          reg57 <= ($unsigned((^~(8'hb4))) >>> (~wire0[(1'h0):(1'h0)]));
          if ((reg10 ?
              ((~&((reg7 <<< wire1) || ((8'ha8) ? reg6 : wire55))) ?
                  $unsigned(reg9) : wire3[(2'h3):(2'h2)]) : wire2[(3'h7):(3'h5)]))
            begin
              reg58 <= $signed($unsigned(wire2[(1'h1):(1'h0)]));
              reg59 <= wire54;
              reg60 <= $unsigned(reg11[(3'h4):(2'h3)]);
              reg61 <= reg12;
              reg62 <= $signed((wire4[(3'h7):(1'h1)] << (reg59 == (^(reg58 ?
                  reg59 : wire2)))));
            end
          else
            begin
              reg58 <= $signed(((wire5 ?
                      $signed($signed((8'hbb))) : $signed({wire3, (8'hbf)})) ?
                  $signed((&$unsigned((8'hb7)))) : $unsigned(reg6[(4'h8):(3'h4)])));
              reg59 <= wire4;
              reg60 <= reg9;
              reg61 <= wire4;
            end
          reg63 <= (~&wire5[(4'hb):(4'h8)]);
        end
      else
        begin
          reg57 <= (reg60 ? {reg13} : reg63[(2'h3):(1'h0)]);
          if ((&($signed({$signed(reg57)}) ?
              $signed(((wire55 <= wire4) ?
                  $signed(reg11) : $unsigned(reg11))) : $signed($unsigned((reg11 ?
                  (8'hb6) : wire0))))))
            begin
              reg58 <= wire5[(1'h0):(1'h0)];
              reg59 <= ($unsigned(reg13) ?
                  $unsigned($signed((reg13 ?
                      wire55 : $signed(wire2)))) : (reg6[(5'h11):(3'h4)] ?
                      ({(wire56 ~^ wire1)} ?
                          (&$signed(reg11)) : (reg8 != (!reg11))) : (wire56[(4'hd):(4'h9)] ?
                          $unsigned((-(7'h41))) : ({reg6} == $unsigned(wire5)))));
              reg60 <= $unsigned($signed((~|reg59[(5'h11):(4'hc)])));
              reg61 <= (~|($unsigned(wire52[(3'h7):(3'h6)]) != $signed(wire54)));
              reg62 <= $signed(wire5);
            end
          else
            begin
              reg58 <= $signed({reg13[(3'h7):(3'h6)],
                  (($unsigned(reg8) ? (wire56 == wire52) : reg12) * wire54)});
              reg59 <= wire4;
              reg60 <= (wire3 + ($unsigned((!{reg61, wire55})) ?
                  {wire2[(2'h3):(2'h2)]} : (({reg10,
                          wire52} ^ reg60[(1'h0):(1'h0)]) ?
                      {{wire55, (8'ha0)}} : ((^wire2) >>> (wire52 ?
                          wire55 : reg59)))));
            end
        end
      if (((wire55[(4'ha):(3'h7)] < $signed(((^(8'hb2)) > (!(8'hb4))))) ?
          (wire52[(3'h5):(2'h2)] <= (^reg8[(4'hd):(4'hd)])) : reg8[(4'he):(4'hc)]))
        begin
          reg64 <= {(^{({(8'ha3), reg60} ?
                      (wire56 ? wire55 : (7'h40)) : $signed(reg59)),
                  wire0}),
              wire54};
          reg65 <= $unsigned($signed($unsigned($unsigned($unsigned(reg13)))));
        end
      else
        begin
          reg64 <= reg65[(1'h0):(1'h0)];
        end
      if ((~^$signed($unsigned((((8'hbc) >= reg57) ?
          $signed(reg6) : (|reg9))))))
        begin
          reg66 <= (wire2 != wire2[(4'hc):(4'hc)]);
          reg67 <= (!(reg10[(1'h0):(1'h0)] > $signed(reg63[(2'h3):(2'h2)])));
          reg68 <= $unsigned($unsigned(reg64));
        end
      else
        begin
          reg66 <= (reg68 ?
              wire52[(3'h6):(1'h1)] : {$unsigned($signed(((8'hb6) > reg11)))});
          reg67 <= wire56;
          if ((^reg57))
            begin
              reg68 <= $signed((8'hbe));
            end
          else
            begin
              reg68 <= (|wire55[(3'h6):(3'h5)]);
              reg69 <= reg63;
            end
          reg70 <= reg68;
          if ((!(((^(wire54 ? wire56 : wire5)) ?
                  (^~(reg60 <<< reg64)) : $unsigned($signed(wire0))) ?
              reg58 : $signed(((8'ha1) ~^ (reg13 ? wire4 : reg13))))))
            begin
              reg71 <= $unsigned((&((^~(8'ha2)) ?
                  {(reg66 == reg7)} : $unsigned((^(8'hb6))))));
              reg72 <= reg69;
              reg73 <= (^reg67);
              reg74 <= reg65[(1'h0):(1'h0)];
              reg75 <= ($unsigned($signed(reg63[(1'h0):(1'h0)])) ?
                  $signed($unsigned((~&$signed((8'h9f))))) : {(8'hb3)});
            end
          else
            begin
              reg71 <= (!$unsigned((wire54[(1'h1):(1'h1)] == $signed(wire0))));
              reg72 <= $signed((~^reg62));
              reg73 <= (((|((wire56 && (8'h9f)) != $unsigned(reg12))) ?
                      wire55 : (!({reg68} ?
                          $signed(reg8) : reg69[(4'hc):(4'ha)]))) ?
                  {wire56[(2'h3):(1'h1)]} : $unsigned((^~(((8'hbf) > reg58) >= (reg61 + wire1)))));
              reg74 <= (^(7'h43));
            end
        end
      reg76 <= wire52[(4'h8):(2'h2)];
    end
endmodule

module module14
#(parameter param51 = {(((|(~&(8'ha4))) ~^ (~&(8'ha9))) ? (({(8'hb5)} ? {(7'h43)} : ((8'ha8) ? (8'hab) : (8'ha1))) > (((8'h9f) ? (8'h9c) : (8'hb2)) >> (|(8'h9d)))) : ((|((8'ha1) && (8'hb6))) ? (((8'hbd) ? (8'hbf) : (8'haf)) ? ((8'hbb) ? (7'h43) : (8'ha0)) : (~^(8'hbc))) : (|(8'had))))})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire19;
  assign y = {wire50, wire49, wire47, wire19, (1'h0)};
  assign wire19 = wire18[(3'h4):(2'h3)];
  module20 #() modinst48 (.wire23(wire19), .wire24(wire15), .clk(clk), .wire22(wire16), .y(wire47), .wire21(wire17));
  assign wire49 = wire16[(4'hb):(3'h4)];
  assign wire50 = $signed($signed(($signed((-wire19)) ?
                      {$signed(wire17)} : ((wire18 + wire15) ?
                          (+(8'ha0)) : (&wire18)))));
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire25 = $signed($signed($signed(($signed((8'hb0)) * wire22[(1'h1):(1'h0)]))));
  assign wire26 = (8'hab);
  assign wire27 = ($signed(wire21[(5'h15):(2'h2)]) ?
                      (wire26[(3'h6):(1'h0)] ?
                          (wire24[(3'h7):(1'h0)] <= (8'hbc)) : ($unsigned((wire21 ?
                              wire21 : (8'haa))) || (wire25 | $unsigned(wire26)))) : wire23[(1'h1):(1'h0)]);
  assign wire28 = wire21;
  assign wire29 = (!($unsigned({(wire26 ?
                          wire25 : wire25)}) && (+$signed((8'hab)))));
  assign wire30 = (~^{$signed(wire29), (wire24 <<< wire28[(3'h7):(3'h4)])});
  assign wire31 = $signed(wire26[(3'h4):(3'h4)]);
  assign wire32 = (~((~|{$signed(wire21)}) > (~$signed(wire21))));
  assign wire33 = ((^~$signed($unsigned($signed(wire23)))) * $unsigned($signed({{wire32}})));
  assign wire34 = ((wire31[(3'h4):(1'h1)] != ($signed(wire30) ?
                      ((wire21 >> wire22) < (wire23 ?
                          wire26 : wire22)) : (8'ha6))) ^~ (wire33[(4'hc):(4'h9)] ?
                      ($unsigned((wire26 ? wire24 : wire21)) < (((8'ha1) ?
                          wire25 : (8'hbe)) >>> (^wire26))) : wire23));
  assign wire35 = (~^(wire31 <= $unsigned($unsigned((wire23 < wire25)))));
  assign wire36 = $unsigned($unsigned($unsigned((^wire31))));
  assign wire37 = {$signed((($unsigned((8'ha8)) | ((8'ha3) >> wire31)) >= $signed($signed(wire21))))};
  assign wire38 = $signed((&(wire23[(3'h4):(1'h0)] ?
                      wire26[(1'h1):(1'h0)] : $signed(((8'ha9) ?
                          wire25 : wire34)))));
  assign wire39 = {(~&wire22), $signed({(^(~^wire30))})};
  assign wire40 = {((((wire21 << (8'ha6)) | $signed(wire37)) ?
                          (wire21 + {wire35, wire23}) : (8'had)) * (^wire24)),
                      {(~|$signed(wire26))}};
  assign wire41 = ($signed(((wire28 & $unsigned((8'ha1))) ?
                          (~$signed(wire34)) : {{wire22, wire34},
                              wire25[(1'h0):(1'h0)]})) ?
                      wire27 : wire30[(4'he):(4'hd)]);
  always
    @(posedge clk) begin
      reg42 <= $signed(wire26);
      reg43 <= ($signed($signed($signed(wire35))) & wire38[(4'h9):(3'h5)]);
      reg44 <= (^$signed((reg42 ?
          wire40[(3'h6):(3'h4)] : $unsigned((^(7'h42))))));
      reg45 <= wire35;
      reg46 <= $unsigned($signed($unsigned(reg45[(3'h5):(2'h2)])));
    end
endmodule
