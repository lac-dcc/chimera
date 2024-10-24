module top
#(parameter param33 = (({(~&(|(8'ha5)))} ? ((((8'ha3) == (8'hb7)) ~^ (~|(8'hb0))) >>> (8'h9c)) : ({{(8'ha9)}} ? (((8'ha0) - (8'hb9)) ? (!(8'hbd)) : {(8'ha5), (8'hbc)}) : (~(-(7'h41))))) ? ((^(((8'ha5) ? (7'h44) : (8'h9d)) ? ((8'hab) ? (8'h9c) : (8'hb3)) : (-(8'hbe)))) ? (~(&{(8'ha4)})) : ((~((8'ha0) ? (8'ha4) : (8'hab))) != (((8'ha7) ? (8'hb0) : (8'ha0)) | ((8'hb1) >> (8'hba))))) : (({(~(8'hac))} * (~((8'h9c) ^ (7'h40)))) ? ((~^((7'h41) || (8'hb0))) ? (^~((8'hbc) * (8'hb6))) : (((8'h9c) == (8'ha7)) || ((8'ha1) <<< (8'ha1)))) : ((((7'h43) ? (8'ha3) : (8'hbc)) << {(8'hb9)}) != (|((8'hb3) & (8'ha3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire23,
                 wire22,
                 wire5,
                 wire4,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
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
                 (1'h0)};
  assign wire4 = (~^(~&$unsigned((8'haa))));
  assign wire5 = ($signed($unsigned($unsigned(wire2[(1'h1):(1'h0)]))) ?
                     ((~{(wire1 ? wire4 : wire2)}) ?
                         $signed($signed($unsigned((8'h9d)))) : (&($unsigned(wire1) ?
                             wire1[(4'hc):(4'ha)] : (wire4 ?
                                 wire3 : (8'ha8))))) : $unsigned(wire3));
  always
    @(posedge clk) begin
      reg6 <= $signed($unsigned(wire1));
      reg7 <= (|(reg6 || wire0[(4'h8):(3'h5)]));
      if ($signed(wire1))
        begin
          reg8 <= (wire1[(4'hf):(4'h8)] ?
              wire1[(2'h2):(1'h0)] : $signed((8'hae)));
          reg9 <= $unsigned(reg8);
          if ({(reg6[(1'h1):(1'h1)] ?
                  ($unsigned((wire2 - wire3)) + reg9[(1'h0):(1'h0)]) : $unsigned(($signed(reg9) | (8'hb2))))})
            begin
              reg10 <= ($unsigned($unsigned(wire0[(1'h1):(1'h0)])) ?
                  ((!$signed((wire3 ? reg7 : wire3))) ?
                      {$signed(((8'h9e) ^ reg9)),
                          (~(reg9 ?
                              reg9 : wire2))} : (~^{(wire5 & wire0)})) : reg8[(1'h0):(1'h0)]);
              reg11 <= reg6;
              reg12 <= (^$unsigned((8'hbd)));
            end
          else
            begin
              reg10 <= $unsigned({{$unsigned(reg6), wire2[(2'h3):(2'h3)]},
                  ($unsigned($unsigned(reg6)) || $unsigned(wire4))});
              reg11 <= reg7[(1'h0):(1'h0)];
              reg12 <= {({(!((8'hb3) ? wire0 : wire4)),
                      $signed($unsigned((7'h44)))} && ($unsigned((wire4 ^~ wire2)) || $unsigned($signed(reg11))))};
              reg13 <= (($signed(((reg10 ^ wire3) ? (reg9 != wire0) : reg11)) ?
                  wire1[(4'hc):(3'h4)] : (~^($unsigned(reg10) + $unsigned(reg10)))) - ((($signed(reg11) ?
                      reg9 : (reg9 + reg7)) >> $unsigned($unsigned(reg8))) ?
                  (reg7 <<< (8'hb3)) : $unsigned($unsigned((reg8 < reg12)))));
              reg14 <= ($signed(reg7[(2'h2):(1'h1)]) ?
                  ($unsigned($unsigned(reg8)) ? reg11 : wire1) : reg12);
            end
        end
      else
        begin
          if ((($signed(((reg7 ? (8'h9e) : wire1) ?
              $signed(reg6) : (wire1 ?
                  reg12 : reg13))) && (8'ha0)) - ((!((~reg9) ?
              reg9[(1'h0):(1'h0)] : $unsigned(reg8))) >= (((wire1 ?
                  reg12 : reg6) ?
              $signed(reg9) : wire0[(3'h4):(1'h1)]) < {$signed(wire0),
              wire4}))))
            begin
              reg8 <= $unsigned((8'ha5));
              reg9 <= (~|($signed(reg8[(2'h3):(1'h1)]) ^ (~$signed((reg6 ?
                  reg12 : wire1)))));
            end
          else
            begin
              reg8 <= wire4[(1'h1):(1'h1)];
              reg9 <= ((!$signed(reg14[(3'h4):(2'h3)])) ?
                  $signed($signed(((~^reg12) ?
                      (reg6 < wire1) : (reg6 ?
                          (8'h9f) : reg10)))) : $unsigned($unsigned({wire3[(1'h0):(1'h0)]})));
              reg10 <= $unsigned((~^($unsigned({wire5, reg8}) ?
                  reg12[(1'h0):(1'h0)] : $signed((~^wire0)))));
              reg11 <= (reg14[(5'h14):(4'he)] - $unsigned({$signed((reg11 ?
                      (8'hbc) : wire0)),
                  wire4[(1'h0):(1'h0)]}));
              reg12 <= reg11;
            end
          reg13 <= wire0[(4'h8):(4'h8)];
          reg14 <= $unsigned(($signed((|(reg14 ? wire3 : wire2))) ?
              ((-reg14) ?
                  ((^~reg11) ?
                      ((8'ha8) ^~ reg11) : $signed(reg6)) : reg9[(2'h2):(2'h2)]) : {($signed(wire5) ?
                      (reg12 || reg8) : reg11[(4'hb):(3'h4)]),
                  $unsigned($unsigned((7'h40)))}));
          reg15 <= reg7;
          if (reg7[(1'h1):(1'h1)])
            begin
              reg16 <= $signed($signed($unsigned($unsigned((reg12 + reg13)))));
              reg17 <= reg11[(4'hc):(1'h1)];
              reg18 <= (~($unsigned($unsigned(((8'ha0) ^~ wire1))) || (((reg6 ?
                      reg10 : (8'ha7)) << (~^reg9)) ?
                  reg16 : $signed(wire0))));
              reg19 <= (7'h42);
              reg20 <= {(!$unsigned($unsigned(reg14[(3'h4):(3'h4)])))};
            end
          else
            begin
              reg16 <= {(|$unsigned($signed($signed(wire0)))),
                  wire4[(1'h1):(1'h0)]};
              reg17 <= ({reg16[(4'hf):(4'h8)],
                      ($unsigned(reg10) ?
                          $signed((reg9 << reg13)) : $signed((&reg13)))} ?
                  $unsigned($signed({$unsigned(reg12)})) : (^((-wire0) >= reg18)));
            end
        end
      reg21 <= (($signed(reg7[(2'h2):(2'h2)]) ?
          (reg6 ? $signed($signed(reg13)) : reg17) : {reg16,
              $unsigned((wire1 | wire5))}) ~^ reg8[(2'h3):(1'h0)]);
    end
  assign wire22 = {(~|wire5[(2'h2):(1'h1)]), {reg21[(1'h0):(1'h0)]}};
  assign wire23 = wire22[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg24 <= $unsigned(reg14);
      reg25 <= (($signed(wire5[(2'h3):(1'h1)]) ?
          $signed($signed($signed((8'ha9)))) : {$unsigned(reg12),
              (|reg11)}) && reg12);
      reg26 <= ({(|($signed(wire22) > (~&reg7)))} ?
          (^~$unsigned(reg10)) : (!{reg6}));
    end
  assign wire27 = {wire4};
  assign wire28 = (+wire5);
  always
    @(posedge clk) begin
      reg29 <= $signed($signed(reg6[(2'h2):(2'h2)]));
      reg30 <= (wire1 ?
          (wire1[(4'h9):(4'h9)] ^ $unsigned({$signed(wire1)})) : reg25[(3'h4):(1'h0)]);
    end
  assign wire31 = reg6;
  assign wire32 = ($unsigned(($signed({(8'ha5), reg26}) >>> {$signed(reg13)})) ?
                      $unsigned((~reg20)) : (^reg16));
endmodule
