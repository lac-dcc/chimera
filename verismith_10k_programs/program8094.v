module top
#(parameter param63 = (&(&((((8'hbb) ? (8'ha9) : (8'hb5)) >>> ((8'hbe) ? (8'hb0) : (8'h9d))) <<< {{(8'hba), (8'ha3)}, ((8'hb9) ? (8'ha8) : (8'hb7))}))), 
parameter param64 = (7'h43))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  assign y = {wire59,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire4 = (($unsigned($signed(wire0[(2'h2):(2'h2)])) ?
                         wire0[(3'h5):(2'h3)] : ($signed((wire1 == wire2)) - ((|wire2) ?
                             wire1 : (~^wire2)))) ?
                     (wire3[(1'h1):(1'h0)] & wire1[(3'h6):(2'h2)]) : wire3[(2'h2):(1'h0)]);
  assign wire5 = wire0;
  assign wire6 = (+(wire3[(3'h7):(1'h0)] >>> $unsigned(((^wire1) & (~&wire0)))));
  assign wire7 = $unsigned((8'hac));
  assign wire8 = (!(wire3 ?
                     wire0 : ($signed($unsigned(wire3)) ?
                         $unsigned({wire1}) : (wire6[(4'hf):(3'h6)] ?
                             $unsigned(wire6) : wire4[(4'he):(3'h6)]))));
  assign wire9 = wire0[(2'h3):(2'h3)];
  assign wire10 = $signed(wire6);
  module11 #() modinst60 (wire59, clk, wire5, wire9, wire0, wire10);
  always
    @(posedge clk) begin
      reg61 <= $unsigned($signed(wire1[(3'h5):(3'h4)]));
      reg62 <= {(^$unsigned(wire5[(1'h1):(1'h0)]))};
    end
endmodule

module module11
#(parameter param58 = (~^{(~((-(8'hb1)) & {(8'hbb), (8'hb3)})), (!(((8'h9c) >= (8'hb5)) ? ((8'hb5) * (8'hb1)) : ((7'h43) ? (8'hb1) : (8'hb7))))}))
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire51;
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire16,
                 wire17,
                 wire18,
                 wire51,
                 (1'h0)};
  assign wire16 = (($unsigned((8'ha4)) ?
                      ($signed(wire15) || wire15[(3'h6):(3'h4)]) : $signed(wire14[(3'h5):(3'h4)])) + wire12);
  assign wire17 = $unsigned(wire12);
  assign wire18 = {(^~wire17[(4'hd):(4'h9)]),
                      (^~($unsigned($signed(wire12)) ~^ $unsigned((wire17 >>> wire17))))};
  module19 #() modinst52 (wire51, clk, wire14, wire16, wire13, wire17, wire18);
  assign wire53 = $signed($signed($signed($signed({wire16, wire17}))));
  assign wire54 = $signed(wire16[(2'h3):(2'h2)]);
  assign wire55 = wire16;
  assign wire56 = (wire12[(3'h4):(2'h2)] ?
                      $unsigned(wire12[(3'h6):(1'h0)]) : {wire53[(3'h7):(3'h6)]});
  assign wire57 = (~|{({(8'hb8), $unsigned((7'h42))} ?
                          (&wire16[(3'h5):(3'h4)]) : $signed((wire51 ?
                              wire15 : wire17))),
                      $signed({{wire12}, wire18[(1'h1):(1'h1)]})});
endmodule

module module19
#(parameter param50 = ({(^~((!(7'h40)) ? (|(8'hb5)) : (|(8'hb1))))} - (8'h9d)))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(4'he):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire25;
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  assign y = {wire49,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire25 = (!$unsigned({{$signed(wire20)}}));
  assign wire26 = $unsigned(wire22[(1'h1):(1'h0)]);
  assign wire27 = (~^$signed($unsigned((&$unsigned((8'ha1))))));
  assign wire28 = $unsigned($unsigned($unsigned(wire27)));
  assign wire29 = wire23[(4'hf):(1'h1)];
  assign wire30 = (~^wire28);
  assign wire31 = $unsigned($signed(($signed($signed(wire28)) ?
                      wire23 : $signed($unsigned(wire28)))));
  assign wire32 = (-$unsigned(wire25[(2'h3):(2'h3)]));
  assign wire33 = wire21[(3'h7):(1'h0)];
  assign wire34 = $signed((7'h44));
  always
    @(posedge clk) begin
      if ((wire27[(2'h2):(1'h0)] ?
          $unsigned($signed(wire26)) : ((^~(8'hb8)) >> (((wire21 >> wire31) << (+wire20)) ?
              $unsigned(wire22) : wire31))))
        begin
          reg35 <= (8'had);
          reg36 <= wire31[(4'hd):(3'h4)];
          if (wire22)
            begin
              reg37 <= ({wire32, (-(|wire30))} ?
                  ($signed(((wire33 ? wire34 : wire32) ?
                      (~wire24) : wire32[(1'h0):(1'h0)])) ^ $signed((^~(wire20 <<< wire23)))) : {reg36,
                      ((^wire25[(2'h2):(1'h0)]) ?
                          (^~(~^wire34)) : $unsigned((reg35 >> wire23)))});
              reg38 <= (-wire30);
            end
          else
            begin
              reg37 <= (wire20 ? wire20[(2'h3):(1'h1)] : wire27[(2'h2):(1'h0)]);
              reg38 <= $signed((((~(&wire21)) <= (|wire30[(4'ha):(2'h2)])) ?
                  (wire23[(4'hf):(4'hb)] ?
                      $unsigned($signed(wire27)) : (((7'h42) ?
                          reg35 : wire34) * {wire29})) : {wire26}));
              reg39 <= {(wire27 ?
                      reg36[(2'h3):(1'h1)] : (~((!wire29) - {wire22})))};
            end
          reg40 <= ({$signed(reg36[(4'hc):(2'h2)])} >>> $signed($unsigned(reg35[(3'h6):(2'h2)])));
        end
      else
        begin
          if ({$signed($unsigned($signed(wire33))),
              $unsigned({(~(~reg37)), (^~{wire22, wire30})})})
            begin
              reg35 <= (8'haa);
              reg36 <= wire31;
              reg37 <= (((|(-$signed(wire28))) ?
                  $signed($unsigned((+reg37))) : ((~&(^~reg39)) ?
                      (^(!wire23)) : $signed((~^wire28)))) - {(($signed(reg35) >> (wire24 ?
                          wire30 : reg37)) ?
                      ((reg40 >>> wire22) * wire25[(2'h3):(2'h3)]) : ((reg36 ?
                          (8'haf) : wire34) ~^ (wire30 + wire21))),
                  $signed((~wire34))});
              reg38 <= ((($unsigned($unsigned(wire32)) ?
                          $unsigned($unsigned((8'hb1))) : wire33) ?
                      (&(wire33[(1'h0):(1'h0)] ?
                          $unsigned((8'hb7)) : (wire28 >= wire32))) : {$unsigned((^wire21))}) ?
                  {($unsigned((wire33 ? (8'ha1) : (8'h9d))) << ({wire32,
                              wire23} ?
                          $signed((8'hb6)) : (~&wire26))),
                      (wire23[(3'h4):(2'h2)] ?
                          wire26 : ((!(8'hbd)) <<< $signed(wire24)))} : $signed(($unsigned({wire34}) != $signed($unsigned((8'hb9))))));
              reg39 <= $signed((wire28[(1'h0):(1'h0)] ?
                  reg38[(4'hc):(2'h3)] : $unsigned((8'hb9))));
            end
          else
            begin
              reg35 <= (((wire25[(3'h4):(2'h2)] ?
                          $signed(reg36) : wire29[(2'h2):(2'h2)]) ?
                      $unsigned($signed(((8'hb7) ?
                          wire24 : reg39))) : ($unsigned(reg36) ?
                          $signed(wire28[(3'h4):(1'h1)]) : ($unsigned((8'hb7)) ?
                              ((8'ha6) >= (8'haf)) : wire30[(1'h1):(1'h0)]))) ?
                  {(wire30 ?
                          ($unsigned(wire21) ?
                              $unsigned(wire33) : reg37) : (wire22 & wire32[(3'h5):(3'h5)]))} : reg39[(1'h1):(1'h1)]);
              reg36 <= $unsigned(wire29[(2'h2):(2'h2)]);
              reg37 <= reg37[(1'h0):(1'h0)];
              reg38 <= {($unsigned($unsigned(((8'ha2) << wire31))) ?
                      wire26 : wire26[(1'h0):(1'h0)]),
                  $signed((&reg40[(1'h1):(1'h1)]))};
            end
          reg40 <= (~^(~|({(reg37 ?
                  (8'hb6) : reg38)} + ($signed(wire31) > ((7'h44) < wire34)))));
          if ($unsigned(reg40[(4'h9):(3'h6)]))
            begin
              reg41 <= ($unsigned((7'h41)) ^~ ({reg37[(2'h2):(1'h1)],
                      (^$signed(wire28))} ?
                  (~|(wire22 >>> {(8'ha9)})) : $signed(wire28[(2'h3):(2'h2)])));
              reg42 <= (wire33 ?
                  (&(($unsigned(wire27) ~^ $signed(wire34)) ?
                      $unsigned(wire30[(3'h5):(1'h0)]) : ($signed(wire27) ?
                          $unsigned(reg35) : (reg36 ?
                              (8'hb5) : reg35)))) : ({wire30} >>> $unsigned((~(reg36 ?
                      reg35 : (8'hb5))))));
              reg43 <= $unsigned(wire34);
              reg44 <= wire22;
            end
          else
            begin
              reg41 <= $unsigned(((~|(reg36 && wire20[(4'h9):(1'h1)])) ?
                  ({wire27[(1'h1):(1'h0)]} ?
                      (~&wire32[(2'h3):(2'h2)]) : (&$signed(reg38))) : wire23[(4'hd):(2'h3)]));
              reg42 <= reg36;
              reg43 <= {reg36[(1'h0):(1'h0)]};
              reg44 <= $signed(wire31);
              reg45 <= wire34;
            end
        end
      reg46 <= wire23;
    end
  always
    @(posedge clk) begin
      reg47 <= $signed((~&reg40));
      reg48 <= (($signed((8'ha9)) ?
              (8'had) : (~|$signed((wire32 ? wire28 : wire21)))) ?
          ((((~|reg43) ?
              wire27 : reg35) >>> $signed({reg35})) ~^ (wire28[(2'h2):(1'h1)] ?
              wire24[(2'h3):(2'h2)] : (|(wire28 | (8'ha8))))) : ((reg36 ?
              ((wire33 >> wire25) || {reg36,
                  wire34}) : reg36) ^~ $signed({((8'hba) & reg46),
              {reg38, wire26}})));
    end
  assign wire49 = ((reg38[(2'h3):(2'h3)] ?
                      (wire31[(4'ha):(2'h3)] < {reg41}) : $unsigned(((8'haf) - wire30))) <<< $unsigned((reg46[(3'h4):(2'h2)] ?
                      reg47 : ($unsigned(wire26) - $signed(reg43)))));
endmodule
