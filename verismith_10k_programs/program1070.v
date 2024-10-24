module top
#(parameter param19 = ((7'h40) ~^ (|((8'ha5) << (((8'hb8) ? (8'hbb) : (8'hb6)) ? ((8'ha4) > (8'hb8)) : (!(8'hb2)))))), 
parameter param20 = ((~(~^((param19 - param19) <<< param19))) && {(param19 | (~&((7'h40) >= param19))), (8'hbb)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = $signed(wire3);
  assign wire6 = ((($unsigned(wire1[(2'h3):(1'h1)]) <<< $unsigned((wire4 ?
                         wire3 : wire4))) ?
                     $signed($signed($signed((8'hbf)))) : wire5) != ($unsigned(($signed(wire5) ?
                     ((7'h40) ? (8'hbf) : wire3) : $signed(wire2))) << wire3));
  always
    @(posedge clk) begin
      if (((wire6[(4'hf):(3'h6)] ?
              $signed((~^(-(8'hb5)))) : $signed({(8'ha3)})) ?
          (+wire4) : wire4))
        begin
          reg7 <= (!wire4[(3'h5):(3'h5)]);
          if ($unsigned((wire1[(3'h6):(2'h2)] << (&$unsigned(wire4[(3'h6):(3'h4)])))))
            begin
              reg8 <= {{(~^$signed((~wire4)))}};
              reg9 <= ($unsigned($signed((8'ha0))) ^ wire1[(2'h2):(2'h2)]);
              reg10 <= ($unsigned(reg7) > (((wire6[(2'h3):(1'h1)] == reg8[(2'h3):(1'h0)]) ?
                      (wire3[(3'h6):(3'h6)] - wire6) : $unsigned({(8'h9c),
                          reg7})) ?
                  (wire1[(1'h1):(1'h1)] || (reg9[(4'h8):(3'h6)] && wire2)) : ((8'ha7) ?
                      (^~$unsigned(wire4)) : wire1[(2'h2):(1'h1)])));
            end
          else
            begin
              reg8 <= (wire2 >>> wire6);
            end
          if (wire4)
            begin
              reg11 <= {wire0};
              reg12 <= wire3;
            end
          else
            begin
              reg11 <= ($unsigned((!$unsigned((wire1 ^ wire5)))) ?
                  $unsigned(wire0[(2'h3):(2'h2)]) : ((($unsigned(reg10) ?
                          ((8'h9f) ? wire6 : reg11) : (7'h44)) ?
                      {reg12[(3'h5):(1'h0)],
                          (wire2 > wire5)} : ((8'h9c) == $unsigned(reg9))) >> ($signed({reg9}) ?
                      wire6 : {reg9})));
              reg12 <= $signed($signed(({(8'hae)} ?
                  $signed($unsigned(wire5)) : $unsigned($unsigned(wire3)))));
            end
          if (wire4[(3'h5):(3'h5)])
            begin
              reg13 <= $unsigned((wire4 >> $unsigned($unsigned((~|reg8)))));
              reg14 <= (~|($signed((8'hb9)) * ((8'hbe) ?
                  $signed(reg7[(2'h2):(1'h1)]) : reg12)));
            end
          else
            begin
              reg13 <= (($signed((((7'h41) ?
                      reg13 : reg10) - {reg9})) & $unsigned($unsigned((wire2 <= wire6)))) ?
                  reg7[(3'h4):(2'h3)] : wire0[(4'hc):(2'h3)]);
            end
          if ($signed($signed(reg14)))
            begin
              reg15 <= $signed($signed({((wire0 ? wire4 : (8'ha9)) || reg8)}));
            end
          else
            begin
              reg15 <= (8'hae);
              reg16 <= $unsigned((7'h40));
            end
        end
      else
        begin
          reg7 <= $unsigned((8'hb3));
          reg8 <= $signed($unsigned((($signed(reg16) ?
                  $unsigned((8'ha1)) : (^~reg10)) ?
              {(wire3 ? reg8 : reg16)} : ((|wire5) >> reg12[(2'h3):(2'h2)]))));
          reg9 <= ((~&reg8[(5'h11):(4'h8)]) ?
              ((wire0[(4'ha):(1'h0)] ?
                  ((wire3 ? reg12 : reg15) ?
                      $unsigned((8'hb4)) : (reg11 * reg13)) : (~&((8'hb9) ?
                      wire0 : wire6))) > ($unsigned((reg7 ?
                  reg9 : wire4)) ^ (reg7 ?
                  (reg11 >>> reg12) : (8'had)))) : (8'hbb));
        end
      reg17 <= reg10[(5'h10):(3'h4)];
      reg18 <= reg14[(1'h0):(1'h0)];
    end
endmodule
