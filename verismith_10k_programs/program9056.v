module top
#(parameter param30 = (({((^~(8'hbe)) >= {(8'hb8)})} || (({(8'hae), (8'hba)} >> ((8'ha2) <<< (8'ha9))) & ({(8'haf), (8'ha6)} ? (8'ha4) : {(8'h9c)}))) || (~&(((~&(8'hbe)) >> (~|(7'h41))) ? (^~{(8'ha9), (8'ha7)}) : (&(&(8'h9c)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire12;
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  assign y = {wire29,
                 wire27,
                 wire12,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(wire1);
      if (wire4[(2'h3):(2'h2)])
        begin
          reg6 <= ((^~wire1[(4'hc):(4'ha)]) ?
              $signed(((8'hac) ?
                  wire2 : {$unsigned(wire1)})) : {($unsigned({wire3, wire1}) ?
                      $signed(reg5[(5'h10):(4'hc)]) : ({wire1,
                          wire4} + wire2[(4'h9):(1'h0)]))});
          if (reg5[(5'h10):(4'he)])
            begin
              reg7 <= {($signed(wire4[(3'h6):(3'h5)]) || $unsigned(((wire3 ?
                      reg5 : wire1) || $unsigned(wire4)))),
                  (~^reg6)};
              reg8 <= reg6;
            end
          else
            begin
              reg7 <= $unsigned(wire3);
            end
          reg9 <= (|((reg7[(3'h6):(1'h1)] & $unsigned(wire3)) ?
              $unsigned(($unsigned(wire3) ?
                  (-wire0) : wire3)) : (wire2[(3'h7):(3'h7)] ?
                  ((^wire3) ? (wire0 > reg6) : $signed(reg5)) : ((wire1 ?
                      wire3 : reg7) >= {reg5, reg7}))));
          reg10 <= $unsigned($unsigned(wire3[(1'h0):(1'h0)]));
          reg11 <= (($signed($unsigned((~(8'haf)))) ?
              reg10 : ((|wire2[(4'hb):(3'h7)]) != reg5)) ~^ ($unsigned(($unsigned(wire0) ?
                  (~^(8'hba)) : $unsigned(reg10))) ?
              $unsigned($unsigned(reg9)) : $unsigned($unsigned($unsigned(reg10)))));
        end
      else
        begin
          reg6 <= reg5;
          reg7 <= (8'ha8);
          reg8 <= (^~(($unsigned({(8'hb9), reg6}) ?
              {(wire4 + wire3)} : {$unsigned(reg10),
                  $signed(wire2)}) & ({(!reg6), reg6} ~^ (~^wire0))));
        end
    end
  assign wire12 = (reg5[(1'h0):(1'h0)] ?
                      $unsigned((&(~^$signed(reg5)))) : (reg10[(1'h0):(1'h0)] >> reg5));
  module13 #() modinst28 (wire27, clk, wire12, reg8, reg9, wire3, reg11);
  assign wire29 = $unsigned({$signed({(wire3 < reg7), $signed((8'h9f))}),
                      wire27});
endmodule

module module13
#(parameter param25 = {((~&(8'h9d)) ? ({((8'ha1) != (8'hba)), ((7'h42) ? (8'ha4) : (8'h9f))} | (((7'h40) ? (8'hac) : (8'had)) > ((7'h44) > (8'hac)))) : ((+{(8'hac), (8'hbc)}) ? ((8'hbb) ? (-(8'ha7)) : ((8'hbd) ? (8'hbf) : (8'hb8))) : (~|{(8'haf)})))}, 
parameter param26 = ((-(|param25)) ? (|{param25}) : (((~(param25 * param25)) ? param25 : (((8'hb8) ? param25 : param25) <<< ((8'hb9) >= param25))) ? (((param25 << param25) ? (param25 <<< param25) : (param25 ? param25 : (7'h43))) ? ((8'hb5) ? (-param25) : param25) : (((8'haf) << param25) ? ((8'hb3) ? param25 : param25) : param25)) : (((+param25) <= {param25}) ? ({(8'hab)} ? param25 : (param25 ? param25 : param25)) : param25))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  assign y = {wire24, wire23, wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = $signed((+($unsigned(wire14[(3'h4):(1'h1)]) - $unsigned(wire15))));
  assign wire20 = (8'h9e);
  assign wire21 = (|(wire16 ?
                      wire20[(4'hc):(2'h2)] : $signed((^~wire14[(1'h1):(1'h1)]))));
  assign wire22 = ((wire18[(4'h8):(4'h8)] ?
                      (((-wire21) || (wire16 ^ wire16)) ?
                          ((wire19 ? wire21 : wire18) ?
                              $unsigned(wire21) : wire14[(3'h5):(3'h5)]) : (~&{wire15,
                              wire15})) : wire17[(4'ha):(2'h2)]) < ($unsigned($unsigned((wire19 | wire17))) ?
                      $signed({wire17,
                          wire16[(1'h0):(1'h0)]}) : {{$unsigned(wire18)},
                          $signed((wire14 >> wire15))}));
  assign wire23 = (~(((wire16 <<< {wire21, wire16}) ?
                      wire21[(3'h7):(3'h5)] : $signed((wire16 ?
                          wire16 : wire14))) <= {($signed(wire19) + (~wire14)),
                      (!$unsigned(wire17))}));
  assign wire24 = (^~$signed($signed({(|wire16)})));
endmodule
