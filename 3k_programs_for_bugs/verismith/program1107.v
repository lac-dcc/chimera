module top
#(parameter param22 = (((((~|(8'hb2)) & ((8'haa) + (8'ha1))) ? (^((8'hbc) ? (8'hb3) : (8'had))) : (!((8'ha4) ^ (8'hba)))) ? (({(8'ha7)} ? {(8'ha2), (8'h9c)} : (8'hb7)) ? {((8'hab) ? (8'hb1) : (7'h40))} : (((8'h9f) ^~ (8'h9d)) ? (~|(8'ha1)) : ((8'haa) <= (8'hbc)))) : ({((8'hb9) ? (8'hbd) : (8'ha1))} != (8'hb2))) ? (((~((7'h43) & (8'ha8))) ? {(~|(8'haa)), {(8'hb5), (7'h40)}} : (-{(8'hb0), (8'ha4)})) & {{((8'hb7) <<< (7'h40)), ((8'ha2) ? (7'h40) : (7'h44))}, (((7'h44) <<< (7'h41)) ? (8'ha0) : {(8'hbd)})}) : (|(~^{(~|(8'haa)), ((8'hbc) ? (8'hac) : (8'hb3))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire5,
                 wire4,
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
  assign wire4 = {$signed(($unsigned(wire3) * (~|(|wire3))))};
  assign wire5 = (wire1[(1'h0):(1'h0)] >>> (8'hb0));
  always
    @(posedge clk) begin
      if ((wire0 ? {wire2[(3'h4):(2'h3)]} : wire1))
        begin
          reg6 <= wire3;
          if (($signed($signed($unsigned(wire4))) ?
              $signed($unsigned($signed((8'ha1)))) : wire3))
            begin
              reg7 <= $signed(wire3);
              reg8 <= $signed((wire0 ?
                  {(^((8'haf) ?
                          wire1 : reg6))} : $unsigned(($unsigned((8'ha1)) >= (-wire3)))));
            end
          else
            begin
              reg7 <= wire2;
              reg8 <= $signed(wire5);
            end
          reg9 <= wire4;
        end
      else
        begin
          reg6 <= wire0;
          reg7 <= (&{(((reg9 * wire3) ? {wire5, wire4} : (reg9 ? reg8 : reg6)) ?
                  (7'h43) : {{wire5}, (wire4 ? reg9 : wire5)})});
          reg8 <= ($signed(wire2) ?
              $signed((~(-wire1[(1'h0):(1'h0)]))) : (7'h41));
        end
      reg10 <= $signed((^~$unsigned(wire0[(2'h2):(2'h2)])));
      reg11 <= ((({wire3,
          {reg6,
              (8'ha6)}} >>> wire5[(1'h1):(1'h1)]) && (-reg8[(5'h13):(5'h13)])) ~^ wire4[(2'h2):(1'h0)]);
      if (reg9[(3'h4):(3'h4)])
        begin
          reg12 <= ($unsigned({(reg6[(2'h2):(2'h2)] ?
                      {wire1, reg6} : $unsigned(reg7))}) ?
              {$signed(((wire2 ? wire4 : wire1) | (reg10 ?
                      reg6 : reg8)))} : ($unsigned(wire1[(2'h3):(1'h0)]) ^~ $signed({reg11[(3'h7):(3'h6)],
                  (wire2 ~^ wire2)})));
          reg13 <= (~&$signed($unsigned(((^(8'hbf)) >> reg7))));
          reg14 <= $unsigned(wire0[(4'h9):(3'h7)]);
        end
      else
        begin
          if (((((~&wire0[(4'hb):(1'h1)]) - ((wire2 <= (8'ha3)) ?
                      {wire0, reg10} : $unsigned(reg10))) ?
                  (~^(wire4 ?
                      {(7'h41),
                          reg13} : $unsigned(reg10))) : wire3[(4'hc):(1'h1)]) ?
              {({{(8'hbb)}, $signed(reg7)} ?
                      ({(8'hac), wire2} ?
                          {reg9} : (wire3 ?
                              (8'ha0) : (8'ha7))) : ($unsigned(wire2) << $signed(reg6))),
                  (reg11[(5'h10):(4'hc)] > {(&reg7),
                      $signed(reg9)})} : ((~^(&reg11)) || ($unsigned(reg14) * $unsigned(wire2[(2'h3):(1'h0)])))))
            begin
              reg12 <= $signed((($signed(reg7[(2'h2):(1'h0)]) == $unsigned((wire3 ?
                  reg14 : (8'ha9)))) ~^ ((^~(^~reg6)) ?
                  {(!wire0)} : ((8'hb1) + reg14[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg12 <= $unsigned(wire5[(3'h4):(1'h0)]);
              reg13 <= $unsigned(reg9);
            end
          if ($unsigned(reg9))
            begin
              reg14 <= $signed(wire2[(1'h0):(1'h0)]);
              reg15 <= (8'had);
              reg16 <= wire1[(2'h3):(2'h3)];
            end
          else
            begin
              reg14 <= ($signed((reg11[(4'hf):(1'h0)] < reg7)) ?
                  {$signed(($signed((8'ha0)) ?
                          $signed(reg14) : wire2[(2'h2):(2'h2)]))} : {(8'h9c)});
              reg15 <= {($signed(reg7) ?
                      ((^$unsigned(reg16)) | {$signed(wire1),
                          $unsigned(reg6)}) : reg15)};
              reg16 <= (reg10[(5'h13):(2'h3)] ? $signed(reg12) : reg15);
              reg17 <= (reg9 | $signed({((~(8'ha2)) == reg12[(3'h6):(3'h6)]),
                  ($unsigned(reg9) != (reg10 ? reg7 : wire0))}));
              reg18 <= reg15;
            end
          reg19 <= {$unsigned((8'ha5)), reg14[(3'h5):(3'h4)]};
        end
    end
  assign wire20 = wire0[(3'h5):(1'h0)];
  assign wire21 = ((^~(8'ha6)) ^ ((((wire2 ? wire5 : reg8) == $signed(reg13)) ?
                      (7'h41) : (((8'had) ? wire2 : reg19) ?
                          (~&(8'ha3)) : wire3[(2'h3):(1'h1)])) || (~&reg8[(1'h0):(1'h0)])));
endmodule
