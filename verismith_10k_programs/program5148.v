module top
#(parameter param26 = {(-(((|(8'hb6)) != (!(8'hbc))) + (&((8'hbb) > (8'hbc)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire5,
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
                 (1'h0)};
  assign wire4 = wire3[(5'h11):(4'hd)];
  assign wire5 = (($unsigned(($signed((8'hbe)) ?
                             {wire0} : wire0[(3'h6):(2'h2)])) ?
                         {($signed(wire2) ?
                                 wire1[(1'h0):(1'h0)] : wire2[(2'h2):(1'h1)])} : wire0) ?
                     $unsigned((^((wire3 ? wire3 : wire3) ?
                         {wire0} : wire0))) : ({wire0} ?
                         wire2 : (wire3 ?
                             $signed(wire2) : ($unsigned(wire4) ?
                                 wire4 : $signed(wire3)))));
  always
    @(posedge clk) begin
      reg6 <= (!(wire5[(5'h10):(4'hc)] ?
          $signed(wire3) : $signed({$signed(wire1)})));
      reg7 <= wire2[(1'h1):(1'h1)];
      if ((^reg7[(3'h7):(3'h5)]))
        begin
          if ((($signed(wire2) ?
                  {(wire0 << (!wire4)),
                      (^~(reg6 + wire4))} : (~^$unsigned($signed((8'ha5))))) ?
              $unsigned(wire1) : (wire3[(3'h4):(2'h2)] <= $unsigned(reg7))))
            begin
              reg8 <= wire0[(2'h3):(1'h1)];
              reg9 <= $unsigned({$unsigned(reg8)});
              reg10 <= (8'had);
              reg11 <= ($signed((($unsigned((8'ha3)) ?
                          reg8[(4'h8):(1'h0)] : $signed((8'hb9))) ?
                      (+(reg10 < (8'h9e))) : wire5[(3'h6):(1'h1)])) ?
                  wire1[(1'h1):(1'h0)] : reg8);
              reg12 <= $signed({(|(reg7 ?
                      (~|(8'hb0)) : wire5[(3'h6):(2'h3)]))});
            end
          else
            begin
              reg8 <= $signed(wire1[(1'h1):(1'h0)]);
              reg9 <= (^(reg11[(4'hb):(3'h7)] ?
                  reg10[(5'h13):(4'h8)] : (8'ha6)));
              reg10 <= reg10[(3'h4):(2'h3)];
            end
          reg13 <= ((reg7 ?
              reg8 : ($unsigned({reg8, reg7}) ?
                  $unsigned(((8'ha2) ? wire1 : wire0)) : ((+(8'hba)) ?
                      reg10 : reg10))) >>> $signed($signed(reg11)));
          reg14 <= (8'ha1);
          reg15 <= $signed(($signed(((wire0 & reg11) ~^ (reg13 ^~ (8'h9e)))) << $unsigned($unsigned($unsigned(wire3)))));
          reg16 <= reg10;
        end
      else
        begin
          reg8 <= ($signed($signed((~^$signed(wire2)))) >> (|reg10[(4'hb):(1'h1)]));
          reg9 <= wire0;
          if ((!(!(|$unsigned((wire3 ? (8'ha0) : reg7))))))
            begin
              reg10 <= (~^($unsigned($signed((~wire3))) ?
                  reg6[(4'ha):(3'h6)] : $unsigned($signed({reg6}))));
              reg11 <= (reg10 >> $unsigned($unsigned(((wire5 ? wire1 : reg6) ?
                  {reg12, wire4} : (reg15 * wire3)))));
            end
          else
            begin
              reg10 <= reg9[(1'h1):(1'h1)];
              reg11 <= (^((reg7[(3'h5):(3'h4)] ?
                  ($signed(reg13) >> (wire5 - (7'h40))) : ($unsigned(reg14) ^ $signed(wire5))) >> ($signed((wire0 ?
                  wire3 : (8'hae))) << $signed($signed(wire2)))));
            end
          if ($unsigned($unsigned(reg15)))
            begin
              reg12 <= (8'hb6);
              reg13 <= ($unsigned(reg11[(2'h2):(2'h2)]) <= ((8'ha3) > wire4[(3'h7):(1'h1)]));
              reg14 <= ((~&(!($unsigned(wire1) ?
                  (^reg12) : $unsigned(reg8)))) < {wire5});
              reg15 <= $signed((($signed((wire4 > reg9)) ?
                      $signed({reg15, reg12}) : reg15[(3'h5):(3'h5)]) ?
                  $signed(reg15) : $signed((^~(reg13 ? reg15 : reg11)))));
            end
          else
            begin
              reg12 <= (wire5[(1'h0):(1'h0)] > reg13[(1'h1):(1'h1)]);
              reg13 <= reg8;
              reg14 <= $signed((^~{(8'hbc)}));
              reg15 <= (7'h42);
            end
          reg16 <= (&reg11[(5'h12):(4'hf)]);
        end
      if (((reg7[(3'h6):(2'h3)] + {reg15[(1'h1):(1'h0)]}) << (($signed((reg8 << (8'ha4))) ^ $signed((reg13 == wire1))) ?
          {$signed(reg6[(3'h4):(1'h1)])} : reg14)))
        begin
          reg17 <= $signed($unsigned(wire2[(2'h2):(2'h2)]));
          reg18 <= {reg13[(3'h4):(1'h0)]};
          reg19 <= (^~reg12[(4'h8):(3'h4)]);
        end
      else
        begin
          reg17 <= (((((reg14 << (8'hbb)) | {reg16,
                  reg17}) >= ($signed((7'h43)) ?
                  $unsigned((8'h9d)) : reg7[(3'h6):(1'h1)])) ?
              (reg9[(2'h2):(2'h2)] ?
                  (|(^~reg9)) : (|(reg15 ?
                      reg9 : (8'h9c)))) : reg7[(3'h6):(1'h1)]) << $unsigned(((&$signed(reg17)) >>> reg18[(4'hd):(2'h2)])));
          reg18 <= $unsigned($unsigned(wire4));
          reg19 <= $signed(($unsigned(($unsigned(reg15) <= (reg14 >> wire1))) > (reg14 ^ (&wire3[(5'h12):(3'h6)]))));
          reg20 <= {(~|reg17)};
          reg21 <= (reg14 ?
              (&reg7) : {$unsigned(reg7[(4'h9):(1'h0)]),
                  {$signed((&reg18)),
                      (reg8 ? $signed((8'had)) : $unsigned(wire4))}});
        end
      reg22 <= $unsigned(reg21[(3'h5):(3'h5)]);
    end
  assign wire23 = reg22;
  assign wire24 = (~^{$signed((^~$unsigned(wire2)))});
  assign wire25 = (~&{({reg11[(4'he):(4'hd)], wire1} ~^ $unsigned(reg21)),
                      reg14});
endmodule
