module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire50;
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire5,
                 wire15,
                 wire16,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire50,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire5 = ({$unsigned((wire1 ?
                         wire2 : $signed(wire2)))} >>> (+wire0[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg6 <= ({(wire0 ? $signed((wire2 + wire0)) : ($signed(wire3) | wire5)),
          wire2} - (&(wire2[(1'h1):(1'h1)] >= (wire4 > wire5[(3'h4):(2'h3)]))));
    end
  always
    @(posedge clk) begin
      if ((+{((^wire3) ?
              ((wire2 <<< wire2) ? wire3 : (~^wire0)) : $unsigned({(8'hae)})),
          reg6[(4'ha):(3'h6)]}))
        begin
          reg7 <= {wire0,
              ($unsigned(((^~reg6) - wire5[(3'h6):(1'h1)])) << {{(wire0 ?
                          wire1 : wire1)},
                  {wire1}})};
          if ((^~{$unsigned((+$signed(reg6)))}))
            begin
              reg8 <= $signed(((((8'hb9) ? wire4 : $unsigned(reg6)) ?
                      (wire4[(3'h7):(3'h4)] ?
                          (8'hb6) : (wire3 ?
                              wire3 : reg7)) : $signed($unsigned(reg6))) ?
                  {reg6[(3'h6):(2'h3)],
                      (&$unsigned(wire5))} : (|$unsigned((wire1 << wire2)))));
            end
          else
            begin
              reg8 <= $unsigned(({wire1[(3'h6):(2'h3)]} ?
                  reg7 : reg7[(1'h0):(1'h0)]));
              reg9 <= $unsigned((wire4 >= ({(&(8'hbc)),
                  (|reg7)} <<< $unsigned(reg7[(1'h0):(1'h0)]))));
              reg10 <= $unsigned(wire5[(4'hb):(3'h7)]);
              reg11 <= $signed(($signed((7'h42)) ?
                  (+wire3[(2'h3):(1'h1)]) : (^~(|reg8[(3'h6):(3'h4)]))));
              reg12 <= reg7;
            end
          reg13 <= $unsigned({(~&wire3[(4'hb):(4'ha)]), reg11[(1'h0):(1'h0)]});
        end
      else
        begin
          reg7 <= (^(reg11[(1'h0):(1'h0)] ? (8'ha8) : $unsigned(reg10)));
          reg8 <= (reg9 ? (~&reg9) : $signed((8'haa)));
          if ({$signed(((wire4 ?
                  $signed(reg9) : reg13) + $signed($signed(wire4)))),
              ((8'ha2) != $unsigned($signed((+wire4))))})
            begin
              reg9 <= (-$signed($unsigned(($signed(reg13) ?
                  wire1 : $signed(reg9)))));
            end
          else
            begin
              reg9 <= $signed({wire4[(3'h4):(2'h2)],
                  (reg11[(1'h1):(1'h0)] ?
                      ({wire5, reg12} && wire0[(2'h3):(1'h0)]) : reg6)});
            end
          reg10 <= wire3;
        end
      reg14 <= wire5[(4'h9):(3'h7)];
    end
  assign wire15 = $unsigned((reg6 << (8'ha2)));
  assign wire16 = (~|(^~wire1));
  always
    @(posedge clk) begin
      reg17 <= wire16;
      reg18 <= reg17;
      reg19 <= wire15;
      if ($unsigned(wire16))
        begin
          if ($signed($unsigned($unsigned($signed(((7'h40) ?
              (8'ha5) : (8'hbd)))))))
            begin
              reg20 <= (reg12[(3'h4):(2'h2)] ?
                  (!(~|reg11)) : {{wire3[(4'ha):(3'h7)],
                          (~&reg8[(4'hf):(2'h2)])}});
              reg21 <= ((~{wire15[(2'h3):(1'h1)]}) ?
                  reg19 : wire2[(2'h2):(1'h0)]);
              reg22 <= {((!$signed({reg8})) ?
                      (8'ha4) : $unsigned((wire2 ? $signed(reg11) : {reg18})))};
            end
          else
            begin
              reg20 <= {{$signed(reg6),
                      (~(wire0[(3'h6):(3'h4)] ?
                          wire16[(1'h0):(1'h0)] : ((8'hbd) ?
                              (8'ha5) : wire0)))}};
              reg21 <= ((wire0 ?
                  reg17 : $signed(reg12[(2'h3):(2'h2)])) ~^ $unsigned((reg10 && ({reg6,
                  reg22} >> wire3))));
              reg22 <= wire3[(3'h6):(1'h1)];
              reg23 <= $unsigned((reg13 ?
                  wire1[(3'h7):(1'h0)] : (reg10 ?
                      (reg12[(1'h1):(1'h0)] ?
                          (-wire16) : wire5[(2'h2):(1'h0)]) : wire3)));
            end
        end
      else
        begin
          reg20 <= (wire4 ?
              ({($unsigned(wire4) ?
                      reg11[(2'h2):(1'h0)] : $signed(reg8))} ^~ wire16) : $unsigned((^~$signed($unsigned((8'hac))))));
          reg21 <= (($unsigned($unsigned((wire15 ? wire2 : reg18))) ?
                  (($unsigned(wire15) ?
                      (wire0 ? (8'hb7) : reg6) : (wire2 ?
                          wire16 : reg12)) ^ ($signed(reg19) ?
                      $signed((8'h9f)) : (reg10 - reg21))) : (~(~^reg7))) ?
              $signed(($unsigned((wire4 ? (8'hb4) : reg8)) ?
                  reg8 : reg8[(2'h2):(1'h0)])) : $signed(reg8[(5'h11):(4'hb)]));
        end
    end
  assign wire24 = $signed((((reg22 ? $signed(reg10) : (reg11 ? wire3 : reg10)) ?
                          wire5 : reg23[(3'h6):(2'h2)]) ?
                      (((8'hba) ?
                          reg23[(2'h2):(1'h0)] : (7'h40)) + (&wire0)) : $unsigned((reg6 ?
                          reg7 : (~reg23)))));
  assign wire25 = ($signed((!reg14[(1'h1):(1'h1)])) ?
                      (reg21 & {($unsigned(wire0) ? (8'hb4) : reg22),
                          wire16}) : (+({wire16[(3'h4):(2'h3)],
                              (reg21 ? wire5 : reg14)} ?
                          $signed($signed(reg20)) : (8'hb6))));
  assign wire26 = $signed((8'hb5));
  assign wire27 = {$signed(reg11[(1'h1):(1'h1)])};
  module28 #() modinst51 (.wire31(wire27), .wire29(reg21), .clk(clk), .wire32(reg13), .wire30(reg11), .y(wire50));
  assign wire52 = $unsigned((({(8'ha3)} ?
                      $unsigned($unsigned(reg6)) : reg14[(3'h5):(1'h1)]) ^ $signed($signed(wire3[(3'h7):(3'h5)]))));
  assign wire53 = ({$unsigned(wire15),
                      {(|(+wire27)),
                          $unsigned(wire15)}} + reg12[(2'h3):(2'h2)]);
endmodule

module module28
#(parameter param48 = (({(~|((8'hb7) * (8'ha5)))} & (((+(8'hb0)) != ((8'hbf) == (8'haf))) ? {((8'hb2) ? (8'hab) : (8'hbd)), ((8'hb1) ? (8'ha2) : (8'hb9))} : ((~|(8'hab)) ? (8'hb5) : {(8'hac)}))) ? {((((8'ha2) ? (8'haa) : (8'hbe)) >>> (&(8'hb9))) >>> (^~((8'hb1) ? (8'hb4) : (8'hb4)))), {(((8'haa) ? (8'hba) : (8'haf)) ? ((8'hb7) ? (8'ha5) : (7'h43)) : (^(8'h9d))), (((8'ha9) ? (8'hb0) : (8'ha3)) + (8'hb2))}} : (!{(((8'hb5) && (8'h9e)) >>> (~^(7'h40)))})), 
parameter param49 = param48)
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(4'hf):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
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
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire29[(2'h3):(1'h0)])
        begin
          reg33 <= (~&$signed(wire31));
          reg34 <= ($unsigned((($unsigned(reg33) ?
                  wire29[(2'h2):(1'h1)] : {wire32, wire29}) ?
              wire30 : (wire32 ^ (wire31 == wire32)))) << wire32);
          if (wire29[(3'h5):(2'h3)])
            begin
              reg35 <= $signed({wire32[(2'h2):(1'h1)]});
              reg36 <= $signed(reg34[(5'h14):(3'h4)]);
              reg37 <= ((wire30[(4'ha):(3'h4)] ?
                      $signed(reg34) : {$unsigned((^reg36))}) ?
                  {{(8'h9c)}} : wire31[(3'h4):(3'h4)]);
            end
          else
            begin
              reg35 <= (^~$unsigned($signed(($signed((8'h9c)) ?
                  (reg36 ? wire32 : (8'hb8)) : $signed(wire29)))));
            end
          if (reg37)
            begin
              reg38 <= $unsigned({(^((wire29 ? reg33 : (8'hbd)) >> (8'hae))),
                  wire32});
              reg39 <= ($signed({reg36[(3'h6):(2'h3)]}) + (8'ha4));
              reg40 <= (reg35[(4'hf):(3'h5)] ?
                  (8'hb3) : (|wire29[(4'hd):(3'h4)]));
            end
          else
            begin
              reg38 <= reg34[(3'h4):(1'h1)];
              reg39 <= $unsigned(((($signed(reg39) ?
                  (reg40 <<< (8'hab)) : reg39) >= (8'hab)) & wire32));
              reg40 <= reg39;
              reg41 <= wire29;
              reg42 <= $signed((($signed(reg36) ?
                      $signed((8'hbc)) : $unsigned(((8'hb3) ?
                          (7'h40) : reg38))) ?
                  wire31 : $unsigned((((8'hb2) - wire29) ^ (wire32 ?
                      reg41 : reg39)))));
            end
        end
      else
        begin
          reg33 <= $unsigned((wire29 ? reg42[(4'hc):(4'hb)] : (8'ha6)));
        end
      reg43 <= $unsigned(((($signed(wire30) >>> $unsigned(reg42)) >>> $signed($unsigned(reg37))) != $unsigned($signed((!(8'hb6))))));
      reg44 <= ({(reg40[(4'ha):(4'ha)] ?
              reg37[(1'h0):(1'h0)] : $unsigned(reg43[(1'h0):(1'h0)])),
          ((|(wire30 ^~ wire31)) + ((-wire32) <= ((8'hae) ?
              (8'hb5) : reg38)))} >> {(8'h9c), reg40});
    end
  assign wire45 = {reg36, {$signed((~^$unsigned(reg35)))}};
  assign wire46 = $signed((8'ha1));
  assign wire47 = {wire30};
endmodule
