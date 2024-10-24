module top
#(parameter param24 = ((~^(((&(8'haa)) ? ((8'hb1) == (8'hbf)) : ((8'ha6) || (8'h9f))) ? (((7'h41) ^ (8'ha4)) || (8'ha6)) : (-{(8'ha9), (8'hb5)}))) <= {(~|(~^((8'ha6) | (8'hbe)))), {({(8'ha2), (7'h41)} ^ (-(8'ha7))), ((&(8'ha0)) ? (+(8'hb0)) : ((8'hbc) ? (8'hb7) : (7'h42)))}}), 
parameter param25 = ({(8'hb2)} ? ((8'ha2) ? (((param24 < param24) ? (~|(8'hb9)) : param24) ? (param24 >> {param24}) : param24) : {(8'hbb)}) : (!(~(^~param24)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg23,
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
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire2[(3'h5):(3'h5)];
  assign wire6 = $unsigned(($signed((^wire0)) | $signed($signed((8'ha1)))));
  assign wire7 = $signed((~(((wire3 ^~ wire1) ?
                         {wire6, wire1} : ((8'ha5) ? (8'hac) : wire2)) ?
                     (~|wire3) : {(wire4 ? wire3 : wire3), (^~(8'hb8))})));
  assign wire8 = (~&(($signed((^~wire7)) <<< {$signed(wire1), (8'hbb)}) ?
                     {wire5[(2'h3):(1'h0)],
                         ($unsigned(wire0) ~^ $unsigned((8'hba)))} : {(!$signed(wire3))}));
  always
    @(posedge clk) begin
      reg9 <= $unsigned((wire6[(4'hc):(3'h4)] ?
          wire4 : (wire2[(4'hf):(4'h9)] ?
              $signed((^~wire6)) : $signed($unsigned(wire1)))));
      reg10 <= wire3;
      if ($signed((wire7[(1'h0):(1'h0)] ?
          $signed((reg9[(4'h9):(3'h4)] ?
              $unsigned(wire2) : {wire1, wire5})) : reg10[(1'h0):(1'h0)])))
        begin
          reg11 <= $signed((($unsigned($signed(wire4)) | wire0) < ($signed((wire7 < reg9)) == reg9[(2'h3):(1'h1)])));
          if (({($signed((wire5 <= reg9)) ? wire5 : $signed(wire6))} ?
              (reg10[(4'ha):(3'h4)] || ({$unsigned(reg11)} << reg11[(2'h2):(1'h1)])) : $unsigned((($unsigned(wire3) | (8'hbe)) ?
                  reg10[(4'h9):(3'h4)] : $signed(wire2[(3'h4):(3'h4)])))))
            begin
              reg12 <= {$unsigned(($signed($unsigned(wire5)) ~^ (~^((8'hac) - wire7))))};
              reg13 <= (+$unsigned(wire7));
              reg14 <= $signed((!$signed($signed($signed(reg9)))));
              reg15 <= (~&((($unsigned(wire5) ?
                  reg9 : {(8'hbc),
                      reg9}) == reg13) && $signed($signed((reg12 - wire5)))));
              reg16 <= (($unsigned({(wire8 - wire8),
                      ((8'hb9) ? reg9 : wire7)}) - wire0) ?
                  ((((reg9 && wire8) ?
                      $unsigned(reg15) : {(8'ha8)}) ~^ ($signed(reg15) <<< reg11)) >>> reg10) : (~^reg9[(4'h9):(2'h3)]));
            end
          else
            begin
              reg12 <= (($unsigned(((~&wire3) >> (reg14 ? reg9 : wire5))) ?
                      ((|$signed(wire2)) ?
                          $unsigned(wire1) : $signed((~|wire4))) : wire8[(2'h3):(2'h3)]) ?
                  {reg13[(3'h7):(2'h3)]} : ($unsigned($unsigned($signed(reg13))) < (!$unsigned((wire3 ?
                      wire1 : (8'ha6))))));
              reg13 <= ($signed(($signed($unsigned((8'h9c))) ?
                      wire2[(3'h4):(1'h1)] : (^~wire7[(2'h2):(1'h0)]))) ?
                  $unsigned((reg10 ^~ (~&{reg14}))) : (!{$signed((wire2 ?
                          reg10 : reg12)),
                      ($unsigned(wire4) | (wire1 ~^ wire3))}));
              reg14 <= (~|(^($signed(wire5) ?
                  wire4[(3'h7):(3'h7)] : $unsigned($signed(wire1)))));
            end
          if (((8'ha4) - reg12))
            begin
              reg17 <= (((!reg16) ?
                      $signed((|reg15[(2'h3):(2'h3)])) : wire0[(4'hf):(4'hf)]) ?
                  $unsigned($unsigned({reg12[(2'h2):(1'h1)]})) : $signed(($unsigned($signed(reg9)) ^ (reg9[(1'h0):(1'h0)] ?
                      $unsigned(wire5) : wire6))));
              reg18 <= (wire7[(1'h1):(1'h0)] <= (&{{$unsigned(reg9),
                      ((8'ha1) != wire7)},
                  {wire5}}));
            end
          else
            begin
              reg17 <= wire2;
              reg18 <= wire7;
              reg19 <= ($signed($signed({reg14[(2'h2):(1'h0)]})) * $signed($unsigned((8'h9d))));
            end
          reg20 <= $unsigned({reg16[(3'h7):(3'h4)]});
          if (($signed(reg16) << reg12[(1'h1):(1'h1)]))
            begin
              reg21 <= {(&(8'hac)), $unsigned($unsigned((~|(wire0 & reg18))))};
            end
          else
            begin
              reg21 <= (~$signed((((wire4 - reg18) == $signed(reg10)) ?
                  $signed($unsigned(wire1)) : $signed(wire6))));
              reg22 <= $unsigned((wire4[(4'h8):(3'h4)] << (8'hb8)));
            end
        end
      else
        begin
          reg11 <= (~^$signed(reg11));
          reg12 <= {wire0[(2'h3):(2'h2)], reg18};
          reg13 <= reg13;
          reg14 <= ((reg15[(2'h3):(1'h0)] ?
                  (reg14[(4'hc):(4'hc)] ?
                      ((~|reg19) | $unsigned((8'ha7))) : wire3[(2'h3):(1'h1)]) : (8'hb9)) ?
              $unsigned(wire4[(5'h10):(2'h2)]) : ($signed($signed((^~wire7))) >= (!reg9)));
          reg15 <= (($signed(($unsigned(reg17) == (reg13 ? wire8 : reg18))) ?
              reg20[(3'h6):(2'h3)] : ($signed({wire3}) < {(|reg17)})) << $unsigned({$signed($signed(reg18)),
              (~|$signed(wire2))}));
        end
      reg23 <= reg20;
    end
endmodule
