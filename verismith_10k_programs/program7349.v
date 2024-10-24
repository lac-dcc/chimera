module top
#(parameter param75 = ((|(((~^(8'hab)) ? ((7'h43) <<< (8'h9f)) : (!(8'h9e))) ? ((+(8'hb0)) - ((8'hb7) ^ (8'ha8))) : (!{(8'haf), (8'ha6)}))) + {{{(&(8'hb7))}, (((7'h43) || (7'h40)) ? (^(8'hbd)) : ((7'h41) ? (8'ha9) : (8'hb2)))}}), 
parameter param76 = param75)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire57;
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  assign y = {wire74,
                 wire70,
                 wire69,
                 wire68,
                 wire60,
                 wire59,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire57,
                 reg73,
                 reg72,
                 reg71,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire4 = {($signed($signed($signed((8'h9f)))) ?
                         (wire1[(5'h11):(2'h2)] ?
                             ($signed(wire1) || $signed(wire0)) : (|(wire3 && wire1))) : wire2)};
  assign wire5 = wire4[(2'h2):(2'h2)];
  assign wire6 = $unsigned($signed($unsigned(wire0[(1'h0):(1'h0)])));
  assign wire7 = (&wire1);
  module8 #() modinst58 (wire57, clk, wire3, wire0, wire2, wire4, wire5);
  assign wire59 = $unsigned((&($unsigned($unsigned(wire4)) + wire5[(1'h1):(1'h1)])));
  assign wire60 = $signed((-($signed(wire2[(5'h13):(2'h2)]) ?
                      wire59[(3'h4):(1'h1)] : (^wire2[(5'h10):(2'h2)]))));
  always
    @(posedge clk) begin
      if (wire57[(3'h4):(2'h3)])
        begin
          reg61 <= wire3[(1'h0):(1'h0)];
          reg62 <= wire60[(1'h1):(1'h0)];
          if ((^(((wire2[(3'h7):(2'h3)] ?
                  {(8'hbe)} : $unsigned((8'hb1))) * ((^wire3) ^ $unsigned(wire2))) ?
              $signed({(+(8'h9c))}) : (-(8'hab)))))
            begin
              reg63 <= $unsigned((^($signed(wire60) ^ {wire4[(2'h2):(2'h2)]})));
              reg64 <= $signed(reg63[(1'h1):(1'h1)]);
            end
          else
            begin
              reg63 <= (&{(~reg63[(1'h1):(1'h1)])});
            end
          reg65 <= $signed((~&wire59[(3'h7):(3'h7)]));
        end
      else
        begin
          if (reg63[(2'h2):(2'h2)])
            begin
              reg61 <= wire60;
              reg62 <= (({((wire1 ~^ (8'hb5)) ^~ $unsigned(reg61)),
                          ($unsigned(reg64) ? reg64 : (~|wire5))} ?
                      $unsigned($unsigned(reg62)) : (&$signed(((8'hb0) ?
                          reg65 : reg64)))) ?
                  ((((^reg62) ? (~|reg64) : $signed(wire3)) ?
                      reg62[(1'h1):(1'h1)] : (8'had)) + $unsigned((^wire1[(2'h2):(1'h0)]))) : (+{(reg64[(3'h7):(2'h2)] ?
                          (wire59 ? (8'hb1) : wire59) : $signed(wire0))}));
              reg63 <= $unsigned((wire59 > reg65[(4'h9):(1'h0)]));
              reg64 <= (^$unsigned((-reg63[(2'h2):(1'h0)])));
            end
          else
            begin
              reg61 <= wire3[(2'h3):(1'h1)];
              reg62 <= {(($unsigned((reg65 >> wire5)) >= {wire6[(4'h8):(3'h4)]}) ?
                      $unsigned($signed(reg64[(4'h9):(4'h8)])) : $unsigned((8'h9f)))};
              reg63 <= $signed(($unsigned(($signed(wire4) - {reg62})) > {($unsigned(wire7) * $unsigned((8'hb9)))}));
              reg64 <= wire4[(3'h4):(2'h3)];
            end
          reg65 <= ({reg63} ~^ (~|(reg64 ?
              ($unsigned(reg65) - wire5[(3'h5):(2'h2)]) : wire57)));
          reg66 <= (((wire60[(1'h1):(1'h1)] ^ wire2[(1'h0):(1'h0)]) == reg63) ?
              ($unsigned($unsigned((reg65 ? reg61 : wire60))) == {((wire3 ?
                      (8'ha6) : wire3) == (reg62 ? (8'ha3) : wire3)),
                  wire59}) : ({$signed((wire57 ?
                      (8'ha1) : wire59))} <<< (7'h43)));
          reg67 <= (wire2[(1'h1):(1'h0)] - ((((wire2 != reg65) ?
                  $unsigned(wire4) : (wire0 > wire6)) | (&(wire0 + wire59))) ?
              ($signed($signed(reg66)) ?
                  wire59[(3'h6):(3'h4)] : wire60[(2'h2):(1'h0)]) : $signed({$signed(wire5),
                  reg66})));
        end
    end
  assign wire68 = ((-{(wire57[(5'h15):(4'h8)] > {wire57,
                          wire6})}) > ($signed((~&wire0[(3'h5):(3'h5)])) ~^ $signed(((reg63 ?
                      wire59 : wire57) == (wire5 ? reg64 : wire5)))));
  assign wire69 = (($signed({$unsigned((8'h9d))}) + ((^wire1[(4'hc):(2'h3)]) ?
                          ($unsigned(reg67) >= $unsigned(reg66)) : wire4[(3'h5):(2'h2)])) ?
                      {wire60[(2'h2):(1'h1)],
                          ((~|$signed(wire2)) != {$unsigned(wire68)})} : reg64[(1'h0):(1'h0)]);
  assign wire70 = $unsigned((~$unsigned(wire3)));
  always
    @(posedge clk) begin
      reg71 <= (~^reg66[(3'h6):(3'h4)]);
      reg72 <= wire70[(4'h8):(1'h1)];
      reg73 <= $signed((wire4 ? wire1[(3'h7):(2'h2)] : (|wire69)));
    end
  assign wire74 = $signed((reg63[(1'h0):(1'h0)] || (~&(!(wire0 ?
                      reg71 : wire3)))));
endmodule

module module8
#(parameter param55 = {(8'h9e)}, 
parameter param56 = (({((8'hb0) | (^param55))} <<< param55) & {(~|({param55, param55} << (^(8'hbb))))}))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire48;
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire50,
                 wire14,
                 wire48,
                 reg52,
                 reg51,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire14 = (wire9[(2'h3):(2'h3)] ?
                      (wire12[(1'h1):(1'h0)] ?
                          (~^$signed((+wire13))) : wire12[(2'h3):(1'h1)]) : $signed(wire13[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg15 <= wire12;
      reg16 <= ((8'ha2) ?
          $unsigned($signed((^~wire13))) : {(wire14[(1'h1):(1'h0)] ^ {$unsigned(wire12),
                  wire13}),
              (+$unsigned(wire12))});
    end
  module17 #() modinst49 (.wire19(wire14), .clk(clk), .wire21(wire11), .wire22(reg16), .wire18(reg15), .wire20(wire13), .y(wire48));
  assign wire50 = $unsigned($signed(wire12[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg51 <= (wire9 ?
          {wire10} : ($unsigned($unsigned(wire50)) ?
              $signed(wire12) : (~&$signed($signed(wire13)))));
      reg52 <= $unsigned((($signed((&wire48)) ?
          $unsigned(wire13[(2'h2):(1'h0)]) : ({wire13,
              wire12} * wire9[(3'h7):(3'h6)])) | ((^(^wire13)) ?
          $signed($unsigned(wire10)) : {(~^wire11), $signed(wire48)})));
    end
  assign wire53 = $signed((~|(|$unsigned(wire9))));
  assign wire54 = wire11;
endmodule

module module17
#(parameter param46 = ((((((8'hb9) <= (8'hac)) - {(8'hac)}) ? {{(8'ha1)}} : (^~((7'h43) - (8'h9e)))) || ((-((8'ha7) ? (8'had) : (8'haa))) > (((8'ha6) < (8'ha9)) <= {(8'ha8)}))) << {(((|(8'ha3)) == ((7'h40) ? (8'hb2) : (8'hbb))) ? (((8'ha0) && (8'hac)) ? ((8'hbc) < (8'hb9)) : (!(8'hba))) : (^~(8'hb7))), (~^(((8'ha7) ? (8'hb8) : (8'ha2)) ? {(7'h40)} : (~^(7'h42))))}), 
parameter param47 = (~|((^~{((8'hbf) ? param46 : (8'ha0))}) + param46)))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire [(3'h5):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire25,
                 wire24,
                 wire23,
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
                 (1'h0)};
  assign wire23 = (^~wire19[(1'h1):(1'h1)]);
  assign wire24 = (8'ha5);
  assign wire25 = wire23[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg26 <= (((~|$unsigned(wire25[(2'h2):(1'h0)])) ?
              {$unsigned((wire21 < wire25))} : ($unsigned((!wire22)) << wire20[(1'h0):(1'h0)])) ?
          $signed($unsigned(((wire18 <= wire25) & (wire25 ?
              wire18 : wire23)))) : $signed(($signed($signed(wire20)) && $unsigned((|wire18)))));
      if ($unsigned(($signed($unsigned((^wire25))) + (($signed((8'hb6)) ?
              {wire18} : ((8'ha3) < wire19)) ?
          wire20 : ((+wire20) * (~^wire19))))))
        begin
          reg27 <= $signed(wire24);
          reg28 <= wire23[(3'h4):(1'h0)];
          reg29 <= $unsigned(({$signed((reg26 > (8'hb4))),
                  $unsigned((wire24 ^~ (8'hb8)))} ?
              ((~|(+reg28)) ?
                  reg27[(4'hb):(4'h8)] : (~(wire19 > (8'hb9)))) : {$signed((~|reg28))}));
          if ((($unsigned(wire25) ? {$unsigned(reg27)} : reg28[(1'h1):(1'h0)]) ?
              (|wire23) : (wire18[(2'h2):(1'h0)] <= reg29[(1'h1):(1'h0)])))
            begin
              reg30 <= ($signed((|{(7'h44), reg28})) != wire23[(1'h0):(1'h0)]);
              reg31 <= $signed(wire18[(1'h0):(1'h0)]);
              reg32 <= (&$signed(wire24[(4'ha):(3'h6)]));
            end
          else
            begin
              reg30 <= reg27[(1'h1):(1'h0)];
              reg31 <= ($signed(($signed($signed((7'h42))) >= (wire21 ?
                      (wire20 && wire22) : (reg27 ? reg31 : reg32)))) ?
                  ($signed(wire21) & ({$unsigned(reg30), {(8'hbe), reg28}} ?
                      wire25 : (8'ha1))) : ((({reg32,
                          wire18} != (~&wire22)) ^~ $unsigned({wire19,
                          reg30})) ?
                      wire23 : {reg32}));
            end
        end
      else
        begin
          if ((-{$unsigned($signed((wire25 ~^ reg28)))}))
            begin
              reg27 <= (wire25[(2'h2):(1'h0)] + reg26);
              reg28 <= (~^($signed({$signed(reg28), reg27}) ?
                  reg32[(2'h2):(1'h1)] : $unsigned({(reg27 > reg30)})));
            end
          else
            begin
              reg27 <= ($signed({$signed({wire18, wire22}),
                      ({wire19} ? wire22[(2'h2):(2'h2)] : $unsigned(wire19))}) ?
                  {{((7'h43) <<< {(8'ha5)})},
                      reg26[(4'hf):(2'h2)]} : ($unsigned($signed($signed(reg31))) ?
                      ((^~wire21) ?
                          reg31[(3'h5):(1'h0)] : wire21) : wire18[(2'h2):(1'h1)]));
              reg28 <= reg30;
              reg29 <= (wire24[(4'hd):(1'h1)] ?
                  {($signed($unsigned(reg27)) ~^ (reg26[(1'h1):(1'h1)] + (wire22 ?
                          wire20 : wire25)))} : (|reg30[(1'h0):(1'h0)]));
            end
          if ((8'haa))
            begin
              reg30 <= wire25[(1'h1):(1'h0)];
              reg31 <= (((|reg29[(1'h0):(1'h0)]) ?
                  reg26[(4'hd):(2'h2)] : reg26[(4'hf):(4'hb)]) * {(wire18[(2'h3):(1'h1)] ?
                      $unsigned($signed(wire25)) : (|$unsigned(wire18))),
                  ((8'haf) ?
                      $unsigned($unsigned(wire24)) : $signed((~wire21)))});
            end
          else
            begin
              reg30 <= (8'ha9);
              reg31 <= wire23;
              reg32 <= {$unsigned($signed((wire19[(4'ha):(4'h8)] <= (wire18 | reg31))))};
              reg33 <= (~^wire21);
              reg34 <= (($unsigned(reg32[(3'h6):(2'h3)]) ^~ wire19) ?
                  {(($signed(wire23) + reg26) ?
                          reg26[(4'ha):(1'h1)] : ((reg27 >= (7'h41)) ^ (^~wire24)))} : (wire24 < wire25[(1'h1):(1'h0)]));
            end
          reg35 <= (wire19 ?
              (^$signed(reg32[(3'h5):(2'h2)])) : ((8'hbd) ?
                  wire24[(4'h9):(3'h7)] : $signed((&(~reg31)))));
          reg36 <= {$unsigned(wire24[(3'h7):(3'h6)]),
              $signed(wire23[(3'h4):(3'h4)])};
          reg37 <= (8'ha8);
        end
    end
  assign wire38 = $unsigned($signed(({$signed(reg37), (wire21 >> reg32)} ?
                      ($unsigned(reg32) ?
                          wire24 : $unsigned(reg33)) : ((~reg31) ?
                          $signed(reg35) : ((8'h9d) >> reg28)))));
  assign wire39 = reg27[(4'hd):(1'h1)];
  assign wire40 = (&(~&$signed($unsigned((reg35 ? wire19 : wire18)))));
  assign wire41 = ({reg33[(2'h3):(2'h2)]} <= ($signed(({(8'ha3), wire19} ?
                          {reg32} : {wire18, (8'ha7)})) ?
                      reg26[(2'h2):(1'h0)] : ((-(!reg27)) ?
                          $signed(((7'h41) >> wire22)) : wire19)));
  assign wire42 = wire25[(1'h1):(1'h1)];
  assign wire43 = reg33[(2'h2):(2'h2)];
  assign wire44 = ($unsigned($signed(wire21[(1'h1):(1'h0)])) ?
                      (~|($signed((reg29 >= wire39)) & $unsigned((reg26 ?
                          (8'hba) : wire22)))) : reg27[(3'h5):(2'h3)]);
  assign wire45 = $signed({reg36[(3'h7):(2'h3)], {$signed(reg36)}});
endmodule
