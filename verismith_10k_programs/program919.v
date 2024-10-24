module top
#(parameter param32 = (((((~&(8'h9f)) ? {(8'hb4)} : (!(7'h41))) ? {((8'ha8) >>> (8'ha1)), (~(8'hbb))} : (~|((8'hbe) ? (8'ha1) : (8'hbe)))) ? ((((8'ha7) ? (8'h9f) : (8'h9c)) == (~|(8'ha4))) < {(^~(7'h42))}) : ((+(8'hac)) ? (((8'hb0) ? (8'hbe) : (8'hab)) ? ((8'hb3) > (8'hb0)) : (|(8'hb8))) : (((8'ha4) ? (8'hba) : (8'hb9)) ~^ ((8'haa) ? (8'hb7) : (8'ha7))))) ? ((-{((8'h9f) >>> (8'hbe))}) && (((-(8'hb0)) ? ((7'h44) ? (8'ha7) : (8'h9e)) : (8'ha4)) ? (((8'had) >> (8'hba)) ? ((8'hb1) << (8'h9d)) : ((8'hb7) != (8'hbc))) : {{(8'hb4), (8'hb6)}, {(8'hb9)}})) : (^((&((7'h43) ? (8'ha7) : (8'ha3))) | {(^(8'ha6))}))), 
parameter param33 = param32)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire31,
                 wire12,
                 wire6,
                 wire5,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (wire1[(3'h5):(1'h1)] ? wire2[(1'h0):(1'h0)] : (8'ha4));
  assign wire6 = (($signed(wire1[(2'h3):(1'h1)]) < (($signed(wire0) <= ((8'hb8) >= wire2)) ?
                         (8'hbc) : ($unsigned(wire0) << (wire3 < wire0)))) ?
                     wire4[(5'h10):(3'h6)] : (~wire1[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg7 <= wire2;
      reg8 <= wire5[(1'h1):(1'h0)];
      reg9 <= wire2;
      reg10 <= (wire0 << (8'had));
      reg11 <= (&((~(wire2[(3'h5):(3'h5)] ?
          (reg8 | wire1) : wire1)) == $signed(($signed(wire4) ?
          reg10[(5'h10):(3'h5)] : {wire2, wire6}))));
    end
  assign wire12 = ($unsigned(({(+(8'hb3))} ?
                          (&$unsigned((8'ha7))) : ((wire2 | wire4) > (wire5 ?
                              wire1 : wire0)))) ?
                      $signed(reg11) : (($signed((reg10 * (8'hbd))) ?
                              $signed($signed(wire5)) : reg9) ?
                          $unsigned(($unsigned(reg8) ?
                              (~(8'haa)) : (~|wire1))) : {((reg8 ?
                                      wire2 : reg8) ?
                                  (reg8 ? wire3 : reg11) : $signed(reg9))}));
  always
    @(posedge clk) begin
      reg13 <= $unsigned(wire6);
      reg14 <= (~^($unsigned(($signed(reg9) ? reg9 : (reg7 < (8'hae)))) ?
          $signed(($unsigned(wire2) ?
              $signed(wire2) : {wire6, reg9})) : reg11));
      reg15 <= wire1[(2'h2):(2'h2)];
      if (($signed($signed({wire4, (wire6 ? reg14 : wire2)})) | (8'haf)))
        begin
          reg16 <= $signed({wire2});
        end
      else
        begin
          if ((reg13[(3'h6):(1'h1)] - (~^($signed((wire2 == wire12)) || wire3))))
            begin
              reg16 <= ((wire12[(2'h2):(1'h1)] >>> $signed(((wire2 < (8'hb0)) >>> wire2))) ?
                  ((~^((&(8'ha4)) << $unsigned((8'hb9)))) * reg8) : ($signed(reg15[(1'h1):(1'h1)]) ?
                      (wire6 ?
                          $unsigned((8'hb5)) : $signed({reg7,
                              (8'haa)})) : $unsigned((^~(~wire5)))));
              reg17 <= $unsigned((+(&wire1[(2'h3):(2'h2)])));
              reg18 <= (+wire6);
              reg19 <= (^((reg17 ?
                  {{reg8,
                          wire1}} : ((wire5 != wire4) ~^ (wire2 == reg15))) != ($signed($unsigned((8'ha7))) & reg10)));
              reg20 <= $signed($signed(($unsigned((wire1 << wire12)) != ((reg13 ?
                      reg8 : reg13) ?
                  $unsigned(wire6) : reg18[(5'h13):(2'h2)]))));
            end
          else
            begin
              reg16 <= $unsigned((^~{(reg20[(3'h4):(1'h1)] ?
                      $unsigned(reg13) : (!wire1)),
                  ($unsigned(reg19) ? wire2 : (wire12 ? wire5 : wire4))}));
              reg17 <= (($unsigned($unsigned($signed((8'ha6)))) ?
                  wire12[(3'h7):(3'h6)] : wire4) >= $signed(reg10));
            end
          if ({$unsigned($signed((8'hac)))})
            begin
              reg21 <= wire6[(4'h8):(3'h7)];
            end
          else
            begin
              reg21 <= reg21[(4'hd):(3'h7)];
            end
          if ($signed(reg10))
            begin
              reg22 <= (^$unsigned($signed({$signed(reg8)})));
              reg23 <= $unsigned((~$unsigned(((reg14 ? reg14 : reg19) ?
                  wire5[(1'h0):(1'h0)] : $signed(reg9)))));
              reg24 <= reg17[(3'h6):(1'h0)];
              reg25 <= wire4;
              reg26 <= (-$signed($unsigned((^reg23[(4'hb):(1'h0)]))));
            end
          else
            begin
              reg22 <= $unsigned($signed((((wire4 >= wire1) > reg17[(1'h0):(1'h0)]) ?
                  reg10[(3'h7):(2'h2)] : (~&(!reg19)))));
              reg23 <= reg22[(2'h2):(2'h2)];
              reg24 <= (($signed(($signed(wire3) >= (wire5 ?
                  reg7 : wire5))) << $signed((-reg20))) ^~ (8'hb9));
              reg25 <= reg18;
            end
          if ({(-reg21[(3'h5):(3'h4)]), $signed((~&(8'ha5)))})
            begin
              reg27 <= $unsigned((~^{(reg22[(3'h5):(1'h1)] ?
                      $signed(reg25) : $signed((8'ha7)))}));
              reg28 <= {(~^reg27)};
              reg29 <= $unsigned(reg14);
            end
          else
            begin
              reg27 <= $signed(reg10[(4'h9):(1'h1)]);
              reg28 <= reg25[(1'h0):(1'h0)];
            end
          reg30 <= (reg20 ? $signed((8'hb0)) : reg24);
        end
    end
  assign wire31 = reg7;
endmodule
