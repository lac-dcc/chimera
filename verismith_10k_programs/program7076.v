module top
#(parameter param19 = {{({((8'ha9) ? (8'hac) : (8'had))} ? {{(7'h41)}} : {(8'hb4), (!(8'ha6))})}}, 
parameter param20 = (8'ha2))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = $unsigned(((wire1 != wire1) >> wire1));
  assign wire5 = (|{(^$unsigned((wire4 ? wire0 : wire3))),
                     ($signed((wire4 | wire4)) ?
                         (^(^~wire2)) : $signed($unsigned(wire4)))});
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      reg7 <= wire1[(2'h2):(1'h1)];
      if (wire6)
        begin
          reg8 <= (!$unsigned((+$signed(wire4[(3'h7):(2'h3)]))));
          reg9 <= ($signed(((wire0[(1'h0):(1'h0)] ?
                  wire5[(1'h1):(1'h0)] : (wire0 ?
                      reg7 : reg8)) || ((~&(8'hae)) ?
                  wire1[(3'h6):(3'h6)] : ((8'hb7) >= reg7)))) ?
              $signed((({reg7, (8'ha2)} ? (~wire3) : $unsigned(wire1)) ?
                  wire2[(2'h3):(1'h0)] : {reg7})) : wire0[(1'h0):(1'h0)]);
          reg10 <= wire2[(3'h4):(2'h3)];
          reg11 <= ($signed($unsigned({reg7[(1'h0):(1'h0)]})) ?
              ((((wire3 > wire1) ?
                  wire4 : (-wire2)) >> $unsigned(wire1)) ^~ (&((|reg8) ?
                  wire2 : reg10))) : ((8'ha4) ^ $signed(wire0[(1'h0):(1'h0)])));
          if ((^~(^~reg7[(2'h2):(1'h0)])))
            begin
              reg12 <= wire4[(3'h6):(1'h1)];
              reg13 <= {((^~{(8'haa)}) ?
                      (($unsigned(wire1) ^ $signed((8'hb8))) ?
                          ($unsigned(wire5) ?
                              (reg11 * (8'haf)) : $unsigned((8'hae))) : $unsigned((wire3 ?
                              wire1 : wire4))) : reg10),
                  ($unsigned((~&{reg10})) * wire0)};
              reg14 <= $signed(($signed(reg12[(4'hd):(4'h8)]) && $unsigned(reg7)));
              reg15 <= ((^~($unsigned($unsigned(reg8)) ?
                  ((8'hb2) ? wire3 : reg10[(1'h0):(1'h0)]) : wire1)) | reg13);
            end
          else
            begin
              reg12 <= $signed((8'hac));
              reg13 <= (reg7 ^ (({(wire5 ? reg10 : reg9),
                      {(8'ha7), reg14}} * reg12[(1'h1):(1'h0)]) ?
                  $signed($signed($unsigned(wire3))) : ({(7'h42),
                          $signed(reg9)} ?
                      (8'hb6) : reg10)));
              reg14 <= $signed((~&reg9));
            end
        end
      else
        begin
          reg8 <= $unsigned($unsigned((^~(wire3[(1'h0):(1'h0)] ~^ $unsigned(reg8)))));
          if (reg11)
            begin
              reg9 <= reg15[(2'h2):(1'h0)];
              reg10 <= reg9;
              reg11 <= $unsigned(({(reg10[(2'h3):(1'h0)] ?
                          $signed(reg13) : wire0[(1'h1):(1'h1)])} ?
                  {{$signed(reg9), $signed(wire4)},
                      reg8} : reg10[(1'h0):(1'h0)]));
              reg12 <= ((~^{$unsigned($unsigned(reg13))}) ?
                  wire4[(4'ha):(1'h0)] : (~^($unsigned($signed((8'ha0))) <= ($signed(wire4) == (~&reg12)))));
            end
          else
            begin
              reg9 <= {$unsigned({((reg12 ?
                          reg12 : wire0) ~^ ((8'hbc) || wire4)),
                      (^~reg7[(2'h2):(1'h1)])}),
                  ($unsigned($unsigned((^reg7))) * (({reg15} << (!reg11)) < wire4))};
              reg10 <= reg9[(2'h3):(2'h3)];
            end
          reg13 <= wire0;
        end
      reg16 <= reg9[(1'h0):(1'h0)];
      reg17 <= (wire4[(3'h4):(3'h4)] ?
          $signed(reg12[(3'h6):(2'h3)]) : $signed((reg15 <= ($signed(wire6) ?
              (8'hba) : reg10))));
    end
  assign wire18 = $signed(($signed($signed((wire6 ?
                      wire6 : wire6))) <<< (!{$signed(wire2), reg9})));
endmodule
