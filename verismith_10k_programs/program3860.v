module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire71,
                 wire19,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = wire1[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= wire5[(4'hd):(3'h6)];
      reg8 <= ((8'hb4) <= (wire4 <<< (8'ha1)));
      reg9 <= (^$signed((wire1 == (^~$unsigned(wire3)))));
      reg10 <= wire3[(4'h8):(2'h2)];
      if ((reg9[(4'hd):(3'h5)] ? $unsigned(reg9[(2'h2):(1'h1)]) : reg8))
        begin
          if (reg9[(1'h0):(1'h0)])
            begin
              reg11 <= $unsigned($unsigned({($signed(reg8) ?
                      (wire6 ? wire5 : reg7) : reg8),
                  $unsigned((+reg9))}));
              reg12 <= wire1[(2'h2):(1'h1)];
              reg13 <= ($signed((^~((~^wire5) & $unsigned(reg9)))) ?
                  wire3[(3'h6):(3'h4)] : (7'h40));
              reg14 <= ({(~&reg9[(3'h6):(3'h6)])} <= (|$signed(((wire0 ?
                      wire2 : (8'hbb)) ?
                  (wire4 != reg12) : (reg13 ? (8'ha3) : (8'ha9))))));
            end
          else
            begin
              reg11 <= $signed(wire1);
              reg12 <= $signed(($signed($signed((wire2 <= wire0))) ?
                  ((((8'ha5) ~^ reg13) && (reg14 ?
                      reg11 : reg11)) ^~ wire1[(1'h0):(1'h0)]) : $unsigned($unsigned((wire2 & reg12)))));
            end
          reg15 <= wire2[(2'h3):(2'h3)];
          reg16 <= (^~wire5);
          reg17 <= wire3;
          reg18 <= reg9;
        end
      else
        begin
          reg11 <= $signed($unsigned($unsigned((|$signed(reg10)))));
        end
    end
  assign wire19 = wire1;
  module20 #() modinst72 (wire71, clk, reg14, reg17, reg15, reg8);
endmodule

module module20
#(parameter param69 = {(^~(((8'hb2) ? ((7'h40) ? (8'hbc) : (8'h9f)) : (|(8'hae))) ? (((8'haa) * (8'hae)) ? ((8'hb5) - (8'hb8)) : (~(8'hbe))) : (((8'hb5) ? (8'h9e) : (8'ha3)) - (!(8'hb1))))), (~^(((~&(8'hb7)) && ((8'hb5) ? (8'h9f) : (8'hb5))) << (((8'hac) >> (8'hae)) <= ((8'h9d) < (8'hba)))))}, 
parameter param70 = (param69 ? (-(param69 < param69)) : ((((param69 << param69) ? (param69 ? (8'hb9) : param69) : (param69 && param69)) ^ param69) ? ((param69 ? {(8'ha2)} : param69) ~^ param69) : (-param69))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire [(4'h9):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire [(3'h4):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire26,
                 wire25,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
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
                 (1'h0)};
  assign wire25 = $unsigned((8'hac));
  assign wire26 = wire23;
  always
    @(posedge clk) begin
      reg27 <= {{$signed($unsigned(wire23))}};
      reg28 <= (wire21 ? (-(-wire22)) : wire25);
    end
  always
    @(posedge clk) begin
      reg29 <= $unsigned($unsigned((+$signed($signed((8'haa))))));
      reg30 <= $signed($unsigned(($signed(reg29) ^~ $unsigned($unsigned(wire23)))));
      reg31 <= wire24[(2'h3):(2'h2)];
      if (((((!{reg31,
              wire24}) + $unsigned($signed((8'h9c)))) >= {{$unsigned(wire22)}}) ?
          (+$unsigned(((^(8'hbf)) | (!(7'h42))))) : $unsigned(wire25)))
        begin
          reg32 <= $signed((((reg29[(5'h13):(4'hc)] <= (wire24 * reg31)) ~^ {(8'haf)}) ?
              $unsigned(wire22) : $unsigned(((&wire25) ?
                  wire25[(2'h3):(1'h0)] : $unsigned(wire26)))));
          if (wire22)
            begin
              reg33 <= reg31[(4'h9):(2'h3)];
            end
          else
            begin
              reg33 <= $unsigned($unsigned(((7'h40) ?
                  ($unsigned((7'h42)) + reg28[(2'h3):(1'h1)]) : $unsigned($unsigned(reg29)))));
            end
          reg34 <= $signed(reg29);
          reg35 <= reg32[(2'h3):(1'h0)];
        end
      else
        begin
          reg32 <= wire23;
          reg33 <= $signed((7'h43));
          reg34 <= wire26;
        end
      reg36 <= reg28;
    end
  assign wire37 = (wire24 ^ (reg31 ?
                      ((^reg28) ^~ $signed({wire25})) : reg29[(3'h4):(1'h0)]));
  assign wire38 = wire22[(4'h9):(4'h8)];
  assign wire39 = (reg30 ? (8'hbf) : reg28[(1'h1):(1'h0)]);
  assign wire40 = $unsigned($signed($signed($signed((reg27 ? reg29 : reg29)))));
  assign wire41 = (~^reg28[(2'h3):(1'h1)]);
  assign wire42 = reg33;
  always
    @(posedge clk) begin
      reg43 <= (8'hae);
      reg44 <= ((wire40[(4'h8):(4'h8)] ? (8'haf) : reg27[(4'h9):(3'h5)]) ?
          reg34[(3'h5):(1'h1)] : reg33);
      reg45 <= (reg43[(3'h4):(2'h2)] ?
          reg31[(1'h1):(1'h1)] : reg27[(2'h3):(2'h3)]);
      reg46 <= (reg35 ?
          $signed((8'h9f)) : (-(wire22 ~^ ((-wire41) & {wire37}))));
    end
  assign wire47 = (!(reg33[(5'h10):(3'h4)] ? wire42[(4'ha):(4'h8)] : reg30));
  assign wire48 = ((wire26[(1'h1):(1'h0)] != (-wire47)) << wire21);
  always
    @(posedge clk) begin
      reg49 <= ((($unsigned({reg28}) > ($signed(wire24) ?
              wire47 : $unsigned(wire47))) & wire21) ?
          wire37[(5'h10):(3'h7)] : wire26[(3'h5):(2'h2)]);
      if ({reg31})
        begin
          reg50 <= {(~((^(8'ha1)) <= ((-reg29) ?
                  $unsigned((8'ha3)) : $unsigned(reg49)))),
              wire47[(2'h3):(1'h0)]};
        end
      else
        begin
          reg50 <= (~reg32[(2'h2):(1'h0)]);
          reg51 <= {wire23};
          reg52 <= {((|((wire38 ? wire41 : reg35) ?
                      reg28[(1'h0):(1'h0)] : $unsigned(reg50))) ?
                  reg49 : ((reg28 && $signed(wire48)) ?
                      wire21 : $unsigned({reg35})))};
          reg53 <= $signed($unsigned($unsigned($signed(wire25))));
          if ((^~$unsigned($unsigned({$unsigned(wire47)}))))
            begin
              reg54 <= $signed((|($signed((-reg49)) ?
                  $signed(wire41) : wire37[(3'h6):(2'h2)])));
              reg55 <= $signed((-$signed((reg50[(3'h6):(1'h1)] == $signed(reg32)))));
              reg56 <= wire47;
              reg57 <= reg27;
              reg58 <= ($unsigned($unsigned($unsigned(reg46))) ^~ ($unsigned(wire21) || $unsigned($signed(reg57))));
            end
          else
            begin
              reg54 <= wire48;
            end
        end
      reg59 <= (~^{$unsigned(reg58)});
      reg60 <= ($signed($signed(({reg28} ?
              {reg44, reg31} : (wire22 ? wire38 : (8'h9f))))) ?
          $unsigned((reg58 + wire21)) : ($unsigned({(wire37 ? (8'hb9) : wire38),
              (reg33 ? (8'had) : wire39)}) >> $unsigned(reg36)));
      if ({$unsigned($signed((reg29[(3'h6):(3'h4)] | reg30[(3'h4):(1'h1)])))})
        begin
          reg61 <= {($signed(wire38[(2'h3):(1'h1)]) << (($unsigned((8'ha7)) ?
                      $signed(wire39) : ((8'hb6) ^ reg34)) ?
                  (7'h42) : (wire41[(4'ha):(1'h1)] ^~ (^~reg50))))};
          reg62 <= (8'ha9);
          reg63 <= {reg52[(3'h6):(3'h6)], wire47};
        end
      else
        begin
          reg61 <= reg57;
          reg62 <= ((^reg29) << $signed($unsigned((reg56 + $signed(reg53)))));
          if ($signed((&$signed(($unsigned(wire48) >= wire38)))))
            begin
              reg63 <= $signed(wire38[(2'h2):(1'h1)]);
              reg64 <= ((wire23[(1'h1):(1'h1)] ?
                      reg60[(4'h9):(4'h9)] : (($unsigned(reg60) * ((8'ha0) ?
                              reg30 : reg56)) ?
                          {$signed(wire47)} : $unsigned((~^(8'hbb))))) ?
                  $unsigned(reg43) : $unsigned((^$unsigned(wire42[(4'hc):(2'h3)]))));
              reg65 <= (wire23[(3'h6):(3'h6)] | (~^(~{$unsigned(wire26)})));
              reg66 <= reg58[(1'h0):(1'h0)];
            end
          else
            begin
              reg63 <= wire21[(2'h3):(1'h0)];
              reg64 <= $unsigned((($unsigned(reg49[(5'h10):(2'h2)]) ?
                  $signed((8'hab)) : ($signed((8'h9d)) ^ ((7'h42) + reg36))) >> (~^(~(wire38 ?
                  reg43 : reg50)))));
              reg65 <= ($unsigned(((wire40[(3'h4):(3'h4)] ?
                      (!reg45) : (reg59 * reg51)) ?
                  (~$signed(wire25)) : (reg62[(3'h7):(2'h3)] << (reg31 ?
                      reg51 : reg52)))) - ({reg51} ?
                  $signed((~^((8'hab) ~^ wire39))) : $unsigned(($unsigned(reg36) ?
                      (reg57 | (8'ha9)) : (^reg29)))));
            end
          if ($signed(($signed((~|wire22)) ?
              reg31 : (|{(reg62 ? reg36 : reg59)}))))
            begin
              reg67 <= reg44;
            end
          else
            begin
              reg67 <= (8'haf);
              reg68 <= $signed(reg54[(4'hf):(1'h0)]);
            end
        end
    end
endmodule
