module top
#(parameter param54 = {(((~&(-(7'h43))) | (8'h9f)) || (~((7'h44) ? (~(8'hb9)) : ((8'ha4) << (8'h9f))))), (^((^~((8'hb0) ? (8'h9c) : (8'haf))) && (7'h41)))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h206):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire13,
                 wire12,
                 wire7,
                 wire6,
                 wire5,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
                 reg34,
                 reg28,
                 reg27,
                 reg26,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire2[(3'h7):(3'h5)];
  assign wire6 = wire5[(3'h7):(2'h3)];
  assign wire7 = ($signed({(~&wire4[(4'hc):(2'h3)])}) + ($unsigned({$unsigned(wire0),
                         (!wire6)}) ?
                     wire0 : $unsigned((+(&wire6)))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned((!wire3[(3'h5):(2'h2)]));
      reg9 <= wire5[(4'hd):(4'hc)];
      reg10 <= $unsigned((wire1[(4'hc):(1'h0)] ?
          (~^(((8'ha8) ? wire1 : reg9) & (wire1 ?
              wire7 : reg9))) : $signed($unsigned((wire7 >= wire2)))));
      if ((8'hbb))
        begin
          reg11 <= ((|(wire3 ?
              (((8'ha0) >> wire1) << wire5) : ($unsigned(wire1) ?
                  $signed(reg9) : wire6))) >= ($unsigned($signed((+wire0))) ?
              ((~(wire6 - reg10)) & (^~$unsigned(wire5))) : (^$unsigned(wire3))));
        end
      else
        begin
          reg11 <= (wire7[(3'h4):(1'h0)] >> $unsigned($unsigned((-reg8))));
        end
    end
  assign wire12 = $signed(reg8[(1'h0):(1'h0)]);
  assign wire13 = $signed(((wire6 >>> $signed(((8'hb9) - wire1))) ?
                      $unsigned(wire0[(1'h0):(1'h0)]) : wire6));
  always
    @(posedge clk) begin
      reg14 <= (wire5[(3'h5):(2'h2)] ?
          wire1[(4'h8):(2'h2)] : (wire6 != wire13));
      reg15 <= (($signed(($signed(wire6) << $signed(reg10))) << (^~reg8[(4'hb):(1'h0)])) << $signed($unsigned($signed((8'hbc)))));
      reg16 <= (&(wire5 || $signed(reg14)));
      if (wire5[(1'h0):(1'h0)])
        begin
          reg17 <= (&wire1[(4'hd):(4'hd)]);
        end
      else
        begin
          reg17 <= $signed({wire1[(3'h7):(3'h6)]});
          reg18 <= wire5;
          reg19 <= (($signed(($unsigned(reg18) + reg14)) ?
                  (8'h9c) : (($signed(reg10) ?
                          (wire5 | reg11) : {reg9, wire6}) ?
                      (~|(&wire13)) : {{reg10, wire0}})) ?
              reg8 : (~&(((!reg18) || reg10[(5'h11):(4'hc)]) ~^ wire6[(5'h10):(4'hc)])));
        end
      reg20 <= wire2[(3'h7):(1'h0)];
    end
  assign wire21 = (($signed(((reg18 ? (8'ha9) : reg9) ?
                          (reg17 || reg17) : (wire7 ? wire2 : (8'hb1)))) ?
                      $unsigned((wire5 <<< (^~reg20))) : (~&(~^{(7'h41)}))) >>> (~&$unsigned(reg20)));
  assign wire22 = ((($unsigned((reg14 ?
                          wire7 : reg18)) << $unsigned($unsigned(reg20))) ?
                      ((~^(&reg16)) & ((wire1 ?
                          wire12 : reg19) <<< ((8'hab) > (8'ha6)))) : ((|(8'hac)) ?
                          ($unsigned((8'haf)) == (+wire3)) : $signed((&reg16)))) >= wire6);
  assign wire23 = wire6[(4'h8):(1'h1)];
  assign wire24 = wire5[(3'h6):(1'h1)];
  assign wire25 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg26 <= ((^(8'hbc)) ?
          ((!$unsigned(((7'h40) ? (8'ha0) : wire21))) ?
              {$unsigned(wire5[(4'hd):(1'h1)]),
                  (((8'h9c) ? wire12 : reg20) ?
                      $signed(wire6) : (-wire2))} : wire24) : (+(!(-((8'hb4) | wire21)))));
      reg27 <= $unsigned($unsigned((reg17 ?
          {{(8'hb8)}, $signed(reg16)} : $signed({(8'ha4)}))));
      reg28 <= {wire4[(4'hd):(1'h0)]};
    end
  assign wire29 = (wire6 ~^ (~wire1));
  assign wire30 = ($unsigned((-($unsigned((8'hae)) == wire24[(5'h11):(3'h6)]))) - wire0);
  assign wire31 = {$signed((reg9[(2'h2):(1'h1)] ?
                          (reg10 <<< $signed((8'hbc))) : {{reg15, (8'h9e)},
                              $unsigned(wire0)}))};
  assign wire32 = $unsigned($signed(wire29));
  assign wire33 = wire23[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg34 <= $unsigned((+((~$unsigned(reg11)) ?
          reg17[(1'h0):(1'h0)] : (&$signed(reg11)))));
      if (((wire33[(5'h14):(5'h14)] < ((reg11[(1'h1):(1'h1)] ^ (~|wire25)) ?
          reg11 : $unsigned(wire23[(1'h1):(1'h0)]))) == ((reg9 || (((8'ha7) == reg34) ?
          reg15 : wire29[(1'h0):(1'h0)])) ^~ wire7[(2'h3):(2'h3)])))
        begin
          if (wire21[(3'h6):(1'h1)])
            begin
              reg35 <= (8'hb7);
              reg36 <= ((($signed($signed(reg19)) ?
                          $signed(wire22) : $signed(wire21[(3'h7):(2'h2)])) ?
                      (($signed((8'hae)) ? {wire22, reg26} : (|wire7)) ?
                          ((wire0 >= wire25) ?
                              (~&wire5) : $unsigned(reg10)) : reg26[(1'h1):(1'h0)]) : $unsigned(((reg9 >= wire33) + (reg27 | reg8)))) ?
                  wire23[(1'h0):(1'h0)] : (8'ha7));
            end
          else
            begin
              reg35 <= reg16[(1'h1):(1'h1)];
              reg36 <= $unsigned(reg10);
            end
          if ($unsigned({wire1[(4'hd):(2'h3)], $signed(reg27[(2'h2):(2'h2)])}))
            begin
              reg37 <= wire6[(5'h10):(4'hd)];
            end
          else
            begin
              reg37 <= wire6;
              reg38 <= (|(wire5 ?
                  $unsigned(((wire12 ? wire24 : reg36) ?
                      $signed(wire22) : (reg34 ^~ wire22))) : wire30[(2'h2):(1'h1)]));
            end
          if (reg37)
            begin
              reg39 <= $unsigned(((~^(8'hb8)) ?
                  reg34 : $unsigned(((reg16 >>> wire6) ?
                      (wire30 << reg27) : $unsigned(reg17)))));
            end
          else
            begin
              reg39 <= wire22[(4'h8):(4'h8)];
              reg40 <= reg27;
              reg41 <= $signed($signed({(wire30[(2'h3):(1'h0)] ?
                      (wire2 ? wire2 : wire29) : (reg11 >= reg40))}));
              reg42 <= (~&(~(reg35 ?
                  $unsigned($unsigned(reg40)) : ((8'hae) < (wire4 + wire4)))));
              reg43 <= reg35;
            end
          if (wire4[(4'hf):(4'h9)])
            begin
              reg44 <= reg18[(1'h1):(1'h0)];
              reg45 <= reg37;
              reg46 <= reg39[(1'h0):(1'h0)];
            end
          else
            begin
              reg44 <= {wire24[(4'hf):(4'hf)]};
              reg45 <= ({((reg27 ? {reg40} : (+reg46)) ?
                      ((reg15 || reg14) >> reg8) : $signed((~^reg18)))} == $signed($unsigned((~^reg18[(2'h3):(2'h3)]))));
              reg46 <= wire29[(4'ha):(2'h2)];
              reg47 <= wire0[(3'h5):(2'h3)];
              reg48 <= {({(wire21[(1'h1):(1'h1)] < $signed(wire2)),
                      reg36} <<< $signed((-(&reg8))))};
            end
          if ((~wire4[(4'h8):(3'h7)]))
            begin
              reg49 <= {$signed($unsigned(reg16)),
                  $signed(($unsigned(wire13[(2'h3):(2'h3)]) ?
                      {(8'hb3), (reg14 != reg39)} : ($unsigned(reg20) | (reg48 ?
                          wire7 : reg48))))};
              reg50 <= wire32[(5'h11):(5'h11)];
            end
          else
            begin
              reg49 <= $unsigned(reg17);
              reg50 <= (8'h9c);
            end
        end
      else
        begin
          reg35 <= reg19[(4'hf):(4'hb)];
          reg36 <= (($unsigned($unsigned(reg41[(3'h7):(2'h3)])) != reg44[(2'h3):(1'h0)]) ?
              wire12[(1'h1):(1'h0)] : (!($unsigned($unsigned(reg27)) > reg17[(2'h2):(2'h2)])));
          reg37 <= wire21[(1'h1):(1'h1)];
          reg38 <= {wire3};
        end
      reg51 <= wire25[(2'h2):(1'h0)];
      reg52 <= reg10[(5'h11):(2'h2)];
      reg53 <= $signed($unsigned($signed((wire2 ?
          $signed(reg20) : wire12[(2'h2):(2'h2)]))));
    end
endmodule
