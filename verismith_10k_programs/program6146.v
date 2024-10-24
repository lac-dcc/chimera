module top
#(parameter param21 = ((((((8'had) << (8'ha1)) ? {(8'hb8), (7'h44)} : (|(8'ha0))) < ((|(8'hb1)) && (!(8'hb6)))) ? ((8'hb3) && (-((8'h9c) < (8'hb7)))) : ((((7'h44) ? (8'ha7) : (8'haf)) ^ ((8'haa) ? (8'hab) : (8'ha7))) ? (^~(^~(8'ha0))) : (((7'h44) | (7'h44)) ? ((8'hbc) & (8'ha7)) : (~^(8'hbc))))) ~^ ((8'hb2) ? (^(8'hbe)) : (+(((7'h43) ^~ (7'h43)) ? (+(8'ha4)) : {(8'h9c), (8'hac)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire13,
                 wire5,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (~&$signed($signed((&((8'hb5) ? wire3 : wire3)))));
  always
    @(posedge clk) begin
      reg6 <= ((|wire5[(4'ha):(1'h1)]) <= wire1);
      reg7 <= wire0[(3'h4):(1'h0)];
      if (wire3)
        begin
          reg8 <= (!$unsigned($unsigned(wire2[(4'hc):(2'h3)])));
          if (($signed((+$unsigned($signed((7'h44))))) ?
              wire5[(4'h8):(3'h7)] : {(~&(8'hbb)),
                  $unsigned({$unsigned(wire0)})}))
            begin
              reg9 <= (wire3 ?
                  wire4[(1'h0):(1'h0)] : {$unsigned($signed(reg7[(3'h4):(1'h0)])),
                      $signed({(8'hb3)})});
              reg10 <= reg8[(3'h6):(3'h5)];
              reg11 <= $signed((|(-$unsigned(wire1[(2'h3):(2'h2)]))));
            end
          else
            begin
              reg9 <= $unsigned(((7'h44) & $unsigned(((reg6 > wire3) ?
                  (wire5 > reg7) : reg9))));
              reg10 <= (reg11[(2'h3):(1'h0)] <<< $signed($signed(wire5[(3'h5):(3'h5)])));
              reg11 <= $unsigned($signed($unsigned((8'hb7))));
            end
          reg12 <= $signed((($unsigned((+reg7)) ^~ (!$signed(reg10))) <<< $signed(({wire1} ?
              $unsigned(reg11) : ((8'hba) ? (8'ha3) : wire4)))));
        end
      else
        begin
          reg8 <= (reg8 == $signed((((reg8 ?
              wire2 : reg10) << (wire4 ^ reg12)) ^ (^wire2[(3'h4):(1'h0)]))));
        end
    end
  assign wire13 = (&reg8);
  always
    @(posedge clk) begin
      reg14 <= $unsigned(wire4[(1'h0):(1'h0)]);
      reg15 <= ($unsigned(({$unsigned(wire1)} ?
          $signed(reg11[(5'h11):(5'h11)]) : ((reg12 ?
              reg8 : reg10) << (!wire0)))) << wire2[(1'h0):(1'h0)]);
    end
  assign wire16 = (reg14 > (~^$unsigned((wire2 > $signed(reg6)))));
  assign wire17 = wire1;
  assign wire18 = (($unsigned((reg9 ?
                      $signed(reg7) : (8'ha3))) <= ($unsigned((reg14 + (8'ha0))) > $unsigned($signed(wire4)))) ^ (~^$signed({(reg12 ^~ wire5)})));
  assign wire19 = $signed(reg15);
  assign wire20 = ($unsigned({$unsigned((wire5 ? reg14 : wire2))}) ?
                      ((($unsigned(reg11) ? (-reg15) : (&reg15)) ?
                              wire17 : (&(~&reg6))) ?
                          (~(((8'hb9) * reg6) ?
                              {reg12, wire19} : $unsigned(wire2))) : ({wire3,
                                  (~|reg9)} ?
                              {reg12[(2'h3):(1'h1)]} : $signed($signed(reg15)))) : (-$signed($unsigned(reg6[(3'h6):(3'h5)]))));
endmodule
