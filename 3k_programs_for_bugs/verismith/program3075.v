module top
#(parameter param17 = {(+(&(~|((8'ha5) <= (8'had))))), (((((8'ha3) <<< (8'hbb)) & ((8'ha4) ? (8'ha1) : (8'hbc))) & ({(8'ha0)} ? ((8'hbf) & (7'h40)) : (~(8'hb4)))) ? {(((8'hb4) >= (8'hbe)) ? ((7'h41) | (8'ha5)) : (-(8'hb9))), (8'ha4)} : {(!((8'hbf) == (7'h43))), {((8'hbb) ? (8'ha0) : (8'hba))}})}, 
parameter param18 = (((^~param17) + ((param17 ? param17 : {param17}) ? param17 : ((param17 ? param17 : param17) == (param17 ? param17 : param17)))) == (param17 ? (8'hb0) : ((param17 && ((8'ha5) ? param17 : (8'haa))) & (((8'ha3) < param17) ~^ (param17 << param17))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $signed($signed(($unsigned((+wire3)) ^ wire3[(1'h0):(1'h0)])));
  assign wire6 = $unsigned($unsigned((8'hbb)));
  assign wire7 = wire0;
  always
    @(posedge clk) begin
      reg8 <= (&({$unsigned((wire0 ? wire1 : wire0))} ?
          $unsigned($signed($unsigned((8'ha6)))) : $unsigned((wire6 - (|wire5)))));
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire0))
        begin
          reg9 <= reg8[(2'h3):(2'h3)];
          reg10 <= ($unsigned({{((8'hb9) ? wire7 : wire2), (8'hb5)},
              $unsigned({wire6,
                  wire3})}) <<< $signed($signed({$signed(reg9)})));
          reg11 <= $signed(wire4[(4'h8):(1'h0)]);
          reg12 <= ((!$unsigned(((~|wire3) ?
              (wire7 ? wire6 : reg8) : wire2))) < (($signed($signed(wire3)) ?
                  ({wire4, wire5} ?
                      (^(8'ha5)) : wire5[(3'h6):(3'h4)]) : ((~|wire4) ?
                      $unsigned(reg8) : (wire7 > wire2))) ?
              ({((8'ha3) ?
                      reg9 : wire1)} == (!(~|reg10))) : $signed((reg11[(3'h7):(2'h2)] ^~ $signed(wire4)))));
          reg13 <= ({((+{wire6}) ?
                      ((wire1 ? reg11 : (8'ha4)) ?
                          $signed(wire2) : $unsigned(wire0)) : ($unsigned(wire5) ^ (wire6 - wire4)))} ?
              $signed($signed(($unsigned(reg8) & {reg9,
                  wire2}))) : $signed((&{(reg12 ? reg12 : reg11)})));
        end
      else
        begin
          if ((~^({$signed({reg8, reg13})} ?
              ($unsigned((reg8 ? wire7 : wire7)) ?
                  wire5 : {$signed((8'ha5)),
                      ((8'hb5) == reg9)}) : (~|(~&((8'ha7) ? wire2 : reg8))))))
            begin
              reg9 <= reg11;
              reg10 <= wire6[(3'h6):(2'h2)];
              reg11 <= $unsigned($signed(wire6[(3'h4):(1'h0)]));
              reg12 <= $unsigned($unsigned($signed(($signed(wire1) ?
                  $signed((8'hb4)) : (reg9 + wire7)))));
            end
          else
            begin
              reg9 <= reg12[(4'he):(3'h6)];
            end
          reg13 <= ($unsigned(($signed((reg10 ? reg11 : wire5)) ?
                  ($unsigned((8'h9f)) ?
                      {wire6} : (&wire3)) : $signed($signed(wire7)))) ?
              reg13 : ($unsigned(($signed(reg8) && wire2)) ?
                  $signed((wire2 ?
                      {wire1,
                          wire5} : $signed(reg9))) : $unsigned((wire4[(1'h0):(1'h0)] ?
                      $signed(reg9) : $unsigned((8'hb5))))));
        end
    end
  assign wire14 = {(wire1 ^ (~wire3[(4'hc):(4'h8)]))};
  assign wire15 = $unsigned({wire14[(1'h0):(1'h0)]});
  assign wire16 = ({wire15[(3'h5):(2'h3)],
                      $unsigned(wire6)} > $unsigned((((^~wire3) + wire3[(4'hc):(4'hc)]) ?
                      $unsigned($unsigned(wire14)) : $unsigned({reg8,
                          wire15}))));
endmodule
