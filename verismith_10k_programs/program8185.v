module top
#(parameter param36 = ({(((-(8'haf)) <= (~&(8'hb8))) ? (((8'ha1) ~^ (8'hae)) && (^~(8'ha5))) : (^{(8'hac)}))} ~^ (((((8'hb1) ? (8'hb6) : (8'ha5)) ? (~&(8'haa)) : ((8'hb5) ^~ (8'hbe))) ? {((8'haa) < (7'h40))} : (((8'hbd) ? (8'ha0) : (8'hb3)) ? ((8'hb9) == (8'hb7)) : ((8'ha9) ? (7'h44) : (8'hb7)))) ~^ (!(((7'h42) <= (8'hb0)) ? ((8'h9d) - (8'h9c)) : ((8'h9c) ? (8'ha5) : (8'hb1)))))), 
parameter param37 = (~|(^{(|param36)})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire5 = wire4[(4'hf):(1'h1)];
  always
    @(posedge clk) begin
      if (($signed((8'hb4)) | ({wire5[(1'h0):(1'h0)],
          (wire5 ? wire3 : (-wire3))} + (-(8'ha7)))))
        begin
          reg6 <= {(8'hb9)};
          if ($unsigned((~^$signed($unsigned($unsigned(wire1))))))
            begin
              reg7 <= (wire0 ? wire2 : wire4[(4'h9):(3'h5)]);
            end
          else
            begin
              reg7 <= $unsigned(((^~wire5[(2'h2):(2'h2)]) ?
                  $unsigned($signed(wire4[(2'h3):(1'h1)])) : $signed(($signed(wire2) >= wire0[(4'ha):(3'h4)]))));
              reg8 <= $unsigned($unsigned($signed({(wire4 ? reg6 : wire4),
                  $signed(wire0)})));
              reg9 <= {((($unsigned(wire3) & reg8[(4'hb):(4'h8)]) ^ (!wire5)) ?
                      ((reg8 ^~ (8'ha6)) ?
                          (wire4[(3'h7):(2'h3)] & (reg6 | wire5)) : $signed((!wire4))) : $signed((~|(wire3 ?
                          (8'hb4) : reg8))))};
              reg10 <= $unsigned({$unsigned((!$signed((8'ha9))))});
              reg11 <= (|wire4[(3'h7):(3'h7)]);
            end
          reg12 <= ((^(($signed(wire0) < ((8'hb4) ? reg7 : (8'h9e))) ?
              {(~(8'haf)), $signed(reg9)} : $signed((wire3 ?
                  wire4 : reg9)))) & $signed((7'h42)));
        end
      else
        begin
          if (wire4)
            begin
              reg6 <= ($unsigned($unsigned((^~{reg11, reg10}))) ?
                  {$signed((((8'h9c) == wire2) ?
                          reg10 : $signed(wire5)))} : reg11);
              reg7 <= ({(~|(reg10[(4'ha):(1'h1)] & wire3))} | (!($unsigned(wire2[(4'hf):(4'he)]) ?
                  reg6[(4'h9):(3'h7)] : $unsigned((reg9 ~^ (8'hac))))));
            end
          else
            begin
              reg6 <= {$signed(reg9)};
            end
        end
      reg13 <= $signed($unsigned($signed($signed((~|wire0)))));
      if ((|(!(reg12 ? {reg11[(3'h5):(1'h1)]} : wire0))))
        begin
          if ($unsigned(reg7[(2'h3):(2'h2)]))
            begin
              reg14 <= (^~$unsigned($signed({(-(8'hb0))})));
              reg15 <= wire3[(3'h4):(2'h2)];
              reg16 <= $unsigned((($signed(wire3) ?
                      wire0 : $signed(reg8[(4'hb):(4'h9)])) ?
                  reg14 : ((!$unsigned(reg10)) ?
                      ((~^reg7) * wire2) : ($signed((8'haf)) ?
                          {reg7, (8'h9f)} : (wire4 ? (8'hb4) : reg10)))));
            end
          else
            begin
              reg14 <= $unsigned(wire1[(3'h5):(2'h3)]);
              reg15 <= ($unsigned((^$unsigned(wire3[(4'hc):(1'h1)]))) - $signed(((+(reg9 ?
                  (8'ha3) : reg10)) >>> reg13)));
              reg16 <= ($unsigned($unsigned((reg8[(4'ha):(3'h5)] - $unsigned(wire1)))) ?
                  wire4 : (^~((reg6 ? reg11[(5'h13):(5'h10)] : (-wire2)) ?
                      {$signed(wire2),
                          reg10[(3'h6):(3'h6)]} : $signed(wire2[(4'hc):(2'h3)]))));
              reg17 <= $unsigned(reg8[(2'h2):(1'h1)]);
            end
          reg18 <= (($unsigned($unsigned(reg12[(2'h3):(2'h3)])) ?
                  $signed(wire4) : (reg14 << wire2[(4'he):(1'h0)])) ?
              reg14 : reg17[(5'h10):(4'hb)]);
          reg19 <= {$unsigned(((reg11[(5'h11):(4'he)] < (~wire4)) ?
                  ($signed(reg12) ?
                      $signed(reg6) : $signed(reg18)) : {$unsigned((8'hac)),
                      (reg10 != reg13)})),
              wire1[(3'h6):(1'h1)]};
          reg20 <= (~^wire5);
          reg21 <= $signed({$unsigned($unsigned((+wire4)))});
        end
      else
        begin
          reg14 <= ((wire0[(3'h6):(2'h2)] ?
                  $signed({reg20}) : reg16[(4'h9):(3'h5)]) ?
              $unsigned((-reg19)) : {reg13[(4'ha):(3'h6)],
                  $signed(((reg14 ? wire4 : (8'hb2)) ?
                      $signed((7'h41)) : (reg20 ? reg7 : reg20)))});
          reg15 <= ((((((8'hbf) || wire4) ?
                  $unsigned(wire0) : reg8[(4'hb):(1'h0)]) ?
              (8'hb9) : reg7) >>> ({$signed(reg17)} ?
              $signed((8'hb3)) : $unsigned(wire2[(5'h11):(4'he)]))) && {$unsigned((8'hae)),
              wire1[(4'hb):(3'h4)]});
          reg16 <= wire4;
          reg17 <= reg12;
        end
    end
  always
    @(posedge clk) begin
      reg22 <= ($signed((wire4 ? $signed((&wire1)) : $signed(reg12))) ?
          {(~^(+(wire2 ? reg21 : (8'hbf))))} : $unsigned(($unsigned((reg9 ?
              wire1 : (8'ha2))) < (~&$unsigned(wire3)))));
    end
  assign wire23 = wire4[(4'hb):(1'h1)];
  assign wire24 = wire23[(4'hb):(3'h6)];
  assign wire25 = $unsigned((reg19 ? $unsigned(wire2) : wire5));
  always
    @(posedge clk) begin
      reg26 <= reg17;
      reg27 <= {(reg19 >= wire25)};
      reg28 <= reg11[(5'h14):(4'ha)];
      reg29 <= (~^((reg18[(2'h2):(1'h0)] ?
          ($unsigned(reg27) > $unsigned(reg26)) : $signed((&reg26))) + reg15));
      reg30 <= ($signed(((-reg29[(1'h0):(1'h0)]) ?
          reg28 : $signed($unsigned(reg13)))) * ({$signed($signed(reg14))} ?
          (({wire24} ? $signed((8'haf)) : wire4) ?
              ((reg9 <<< wire3) ?
                  $unsigned((8'ha1)) : reg9) : wire25) : reg29[(2'h2):(1'h1)]));
    end
  assign wire31 = ((((^~(wire3 ? wire23 : reg11)) ?
                          ({reg20} != reg6[(3'h5):(1'h1)]) : ((^reg11) ?
                              reg16 : reg17)) && $signed(((reg9 && reg9) ^ ((8'hb4) ?
                          reg22 : reg29)))) ?
                      reg13[(1'h1):(1'h0)] : wire24);
  assign wire32 = (~|$signed((((wire5 ~^ wire5) ^~ $unsigned(reg18)) | (^reg28[(4'hd):(4'hc)]))));
  assign wire33 = (~((~(wire31 ? {wire2} : {wire3})) ?
                      $signed((reg20 > reg27[(1'h1):(1'h0)])) : reg18[(2'h3):(1'h0)]));
  assign wire34 = reg29[(2'h2):(2'h2)];
  assign wire35 = reg20[(3'h6):(2'h2)];
endmodule
