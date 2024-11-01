module top
#(parameter param26 = {(-(({(8'hac)} ? ((7'h42) ? (8'ha3) : (8'hbb)) : {(8'ha2), (8'haa)}) ? {((8'haf) ? (8'hb6) : (8'h9f)), {(8'hb3)}} : ((!(8'hb5)) | ((8'ha7) ? (7'h41) : (8'ha9)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire5,
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
  assign wire5 = (~&(-(8'ha4)));
  always
    @(posedge clk) begin
      if ((((^~$unsigned((~^(8'had)))) ? wire2[(5'h13):(5'h12)] : (8'hbe)) ?
          ($unsigned((~^$signed(wire0))) | wire3) : wire1))
        begin
          reg6 <= {{{(^~wire4[(3'h6):(3'h4)]), wire4[(3'h6):(2'h2)]}}};
          reg7 <= ($unsigned(wire5) ?
              ((8'haf) ?
                  ({(reg6 ^ (8'hbe)), $signed(reg6)} ?
                      (^~{(7'h42)}) : $signed((~|wire0))) : (|wire5[(4'he):(4'h8)])) : wire2);
        end
      else
        begin
          if ((wire5 * wire5))
            begin
              reg6 <= wire3;
              reg7 <= wire5;
              reg8 <= reg6;
              reg9 <= ($unsigned($signed(({reg6, (8'had)} ? {wire1} : reg7))) ?
                  $signed(reg7) : (((~reg8) ?
                      (|reg6[(2'h2):(1'h0)]) : reg6) <= ($signed($unsigned(wire0)) ?
                      $signed($signed(reg8)) : wire5[(3'h5):(3'h5)])));
            end
          else
            begin
              reg6 <= $signed((!wire1));
              reg7 <= wire4[(2'h3):(1'h0)];
              reg8 <= wire2;
            end
          reg10 <= {($signed($signed({(8'hbd),
                  wire5})) > wire1[(2'h2):(1'h1)])};
          reg11 <= (((+($unsigned(wire5) ?
              wire1[(1'h0):(1'h0)] : (wire0 <<< wire2))) ~^ {$unsigned({reg6}),
              $unsigned($signed(reg6))}) | ($unsigned(($signed(reg7) ?
                  (wire1 ? (8'h9c) : reg6) : wire4[(1'h0):(1'h0)])) ?
              {$unsigned(((8'ha5) ? reg6 : reg7)),
                  (wire1 ? (-(8'hbb)) : wire5[(4'hb):(3'h7)])} : (8'ha4)));
          reg12 <= wire3;
        end
      reg13 <= reg11[(3'h6):(2'h3)];
      reg14 <= (((wire1[(1'h0):(1'h0)] ?
              ($signed(wire1) ?
                  wire5[(4'h8):(2'h3)] : (reg8 ?
                      (8'hb8) : wire5)) : {(reg11 & reg11),
                  {wire4, wire4}}) != reg13) ?
          (8'hac) : ($unsigned($unsigned(reg11)) ?
              wire3[(5'h12):(4'h9)] : (^$signed((~&wire2)))));
      reg15 <= reg9;
      if (((|$unsigned(($signed(reg6) || {reg15,
          reg10}))) || reg9[(1'h0):(1'h0)]))
        begin
          reg16 <= (($signed(reg8) ^ reg13[(4'h9):(3'h5)]) ^~ $signed($unsigned(wire4)));
          reg17 <= (~&$unsigned($signed($unsigned((reg15 < (8'ha1))))));
          reg18 <= ((-((+$unsigned((8'ha7))) ?
              (~^{reg10,
                  reg7}) : ((~^(8'ha7)) <= wire1[(2'h3):(2'h3)]))) * reg12[(3'h7):(2'h2)]);
          reg19 <= (!reg8);
        end
      else
        begin
          reg16 <= $unsigned({reg14[(4'h8):(3'h5)],
              ((^reg11) == $signed((reg14 == reg15)))});
          if ((reg11 >> reg11[(3'h4):(2'h2)]))
            begin
              reg17 <= (reg15[(3'h4):(1'h1)] ~^ reg15[(1'h1):(1'h0)]);
            end
          else
            begin
              reg17 <= ((-reg17[(1'h0):(1'h0)]) ?
                  (&(((reg14 && reg17) == (^~(8'hba))) <<< reg13)) : {{((wire0 + wire0) ?
                              (~^reg16) : $unsigned((8'hba))),
                          (8'ha4)},
                      $signed($unsigned(reg19))});
            end
          reg18 <= ((~^$signed((-$unsigned(reg6)))) != $unsigned($unsigned({$signed(reg9)})));
        end
    end
  assign wire20 = {reg11};
  assign wire21 = $signed((~&reg8));
  assign wire22 = wire5;
  assign wire23 = ((&wire4) ?
                      wire2[(1'h0):(1'h0)] : (({$unsigned(reg14)} != $signed(wire2)) >>> (~&(^~{reg18}))));
  assign wire24 = $unsigned(reg13[(3'h5):(1'h1)]);
  assign wire25 = $unsigned((~&wire1[(3'h4):(2'h2)]));
endmodule
