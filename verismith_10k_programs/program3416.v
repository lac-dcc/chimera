module top
#(parameter param29 = (^~(~|((+(^~(8'ha6))) ^ (((8'hb9) ~^ (8'ha8)) && ((8'hb4) ? (8'hae) : (8'haf)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire28;
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire28,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned((~(((wire0 ?
          wire4 : (8'hbd)) ^~ $signed(wire3)) > {wire1[(4'hf):(4'ha)],
          (8'haa)})));
      if (wire0[(2'h3):(1'h1)])
        begin
          reg6 <= $signed((~^($signed(wire4) ?
              $unsigned($unsigned(wire4)) : ((wire3 ?
                  wire4 : (8'ha2)) >>> $unsigned(wire2)))));
          reg7 <= ($signed((~^$unsigned((reg5 ?
              wire0 : (8'hb0))))) == $unsigned(wire3));
          reg8 <= $unsigned($signed($signed($unsigned((~^reg7)))));
          reg9 <= (((8'h9f) ?
              {(~|wire3),
                  (wire2 ?
                      wire1[(4'hb):(2'h3)] : $signed(reg5))} : (&(&$signed(wire2)))) - (($signed((reg6 ?
                      (8'ha9) : reg6)) ?
                  wire2[(2'h3):(1'h0)] : $signed($unsigned(reg8))) ?
              ((+(wire0 & wire1)) ?
                  wire1[(5'h13):(4'ha)] : $unsigned($signed(reg8))) : $unsigned($unsigned($unsigned(reg6)))));
        end
      else
        begin
          reg6 <= $unsigned($signed(reg6[(3'h7):(1'h0)]));
          if (($signed(wire4) ?
              {(wire3 >= $signed($unsigned((7'h42)))),
                  ($signed((~reg9)) ?
                      reg7 : ((reg8 ?
                          reg9 : wire2) << (-(7'h43))))} : reg9[(5'h10):(2'h3)]))
            begin
              reg7 <= (|{(8'ha5),
                  ((((7'h43) ? wire2 : reg6) ? wire4 : wire2) ?
                      wire0 : wire3[(2'h2):(1'h0)])});
              reg8 <= (($signed({(wire2 != (7'h41))}) ?
                  (8'hb7) : ({wire4} != {(wire0 ? reg9 : reg8),
                      (^(8'ha6))})) <<< (+reg8));
              reg9 <= $unsigned(((8'hb4) ?
                  reg9 : ((reg7[(1'h0):(1'h0)] ?
                          $unsigned(wire3) : (wire4 ? wire3 : (8'hae))) ?
                      (~|wire0) : ($unsigned(wire1) ?
                          $unsigned(reg5) : $signed(wire0)))));
              reg10 <= {wire4, (8'ha0)};
              reg11 <= ($unsigned((reg5 ?
                      ($unsigned(reg8) ^ $unsigned((8'ha5))) : {(wire4 ?
                              wire1 : wire1)})) ?
                  ($unsigned((8'ha0)) ?
                      $unsigned($signed($signed(reg7))) : $unsigned($signed((wire1 ?
                          reg7 : reg8)))) : {{($signed(reg8) == reg8[(4'h9):(3'h6)]),
                          reg10[(2'h2):(2'h2)]},
                      $signed(wire2[(1'h0):(1'h0)])});
            end
          else
            begin
              reg7 <= (($unsigned($signed(reg11)) || reg10[(2'h3):(2'h2)]) ?
                  $unsigned((!$unsigned(reg6[(4'ha):(2'h2)]))) : {wire1,
                      (^~(^~wire3[(1'h0):(1'h0)]))});
            end
          reg12 <= wire3;
        end
      reg13 <= $signed($signed($unsigned((reg5[(3'h4):(1'h0)] | $unsigned(reg5)))));
      reg14 <= (($signed((8'h9f)) == wire0) ?
          $unsigned((((reg11 - wire1) * $signed(reg9)) ?
              wire0[(2'h3):(1'h0)] : wire2[(1'h1):(1'h0)])) : reg10);
    end
  always
    @(posedge clk) begin
      reg15 <= ($unsigned(($signed(wire3[(2'h2):(2'h2)]) ?
          $signed($unsigned(wire2)) : $signed(reg7[(4'hd):(1'h0)]))) <<< (reg13 || (~(8'haa))));
      reg16 <= reg7[(2'h3):(1'h1)];
      reg17 <= reg16;
      reg18 <= (~$signed(reg8[(4'hf):(4'h8)]));
      reg19 <= $signed(($signed((reg18[(1'h0):(1'h0)] ^ $signed(reg18))) & ($signed((reg15 ^ (8'hb3))) << ($unsigned(reg7) ?
          $signed(wire3) : ((8'hb0) ? reg6 : reg8)))));
    end
  always
    @(posedge clk) begin
      reg20 <= {$unsigned(((8'haf) ?
              (wire3 ? (wire2 ? reg12 : reg14) : (~|wire0)) : (!(~^reg12))))};
      reg21 <= $unsigned(reg9[(3'h6):(2'h3)]);
      reg22 <= wire1[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg23 <= reg12[(1'h0):(1'h0)];
      reg24 <= (~|{$unsigned(reg22[(4'h8):(2'h2)]),
          ($unsigned($signed(reg14)) <<< (reg9[(5'h13):(1'h0)] >>> (reg13 >= reg7)))});
      reg25 <= (8'ha9);
      reg26 <= ((($signed($signed(reg11)) ?
          (!(&(8'hb9))) : $signed((wire3 ?
              reg14 : reg15))) + reg21[(1'h0):(1'h0)]) * ($unsigned(($signed(reg7) - (|wire3))) * reg6));
      reg27 <= {(^$unsigned($unsigned(reg20))),
          {(8'ha1), (^($signed(reg15) ? (~reg15) : $signed(reg17)))}};
    end
  assign wire28 = (reg22 ^ $signed($unsigned(reg10)));
endmodule
