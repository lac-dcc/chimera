module top
#(parameter param24 = {(((8'hab) ? (((8'h9e) != (8'h9f)) | (^~(8'ha1))) : (|((8'hbc) ? (8'ha0) : (8'h9c)))) ? ((((8'ha5) <<< (8'hb4)) != {(8'hb3), (8'ha3)}) & (((8'ha2) ? (8'hbf) : (8'hba)) ? (+(8'ha6)) : (&(8'h9e)))) : (((^(8'ha8)) > ((8'ha9) >> (8'ha2))) != (((8'ha8) || (8'hb5)) ^ ((8'ha1) != (8'hb5)))))}, 
parameter param25 = param24)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire5,
                 wire4,
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
  assign wire4 = (8'h9d);
  assign wire5 = ((&wire4[(3'h7):(1'h0)]) > (wire0[(2'h2):(1'h1)] >>> $signed($unsigned($signed(wire1)))));
  always
    @(posedge clk) begin
      if ($unsigned((({$signed(wire5)} >> {$unsigned(wire0),
              (wire4 << wire5)}) ?
          $signed(wire0) : $signed({wire1[(1'h0):(1'h0)]}))))
        begin
          if ((wire2[(3'h7):(3'h6)] ? wire0 : (~wire0[(3'h4):(1'h0)])))
            begin
              reg6 <= ($unsigned($unsigned((8'ha4))) ?
                  ((wire5 ? wire4 : wire3[(5'h10):(3'h6)]) ?
                      {(^~$signed((8'hb1)))} : $signed($unsigned((wire5 || wire1)))) : $signed($signed($unsigned(wire0[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg6 <= (~^($signed(($signed((8'ha6)) - reg6)) ?
                  {wire1} : $unsigned(wire3)));
            end
          reg7 <= $signed(wire1);
        end
      else
        begin
          reg6 <= (~|$unsigned((~^reg7[(3'h5):(2'h2)])));
          if ($unsigned({$unsigned(wire0[(2'h3):(1'h1)])}))
            begin
              reg7 <= wire1[(1'h0):(1'h0)];
              reg8 <= (&(^$signed(wire5)));
            end
          else
            begin
              reg7 <= reg7;
              reg8 <= wire5[(3'h7):(3'h5)];
              reg9 <= reg8;
              reg10 <= (^(~($unsigned((reg9 ? wire1 : wire0)) != (+(reg6 ?
                  reg7 : reg9)))));
              reg11 <= reg7;
            end
          reg12 <= (^{$unsigned(((wire4 >> (8'ha4)) >= wire5[(3'h7):(1'h1)])),
              $unsigned((reg7[(3'h7):(2'h2)] ^ $unsigned((8'hae))))});
          if (reg6)
            begin
              reg13 <= $signed((!(reg7 ?
                  $unsigned((|wire5)) : (((8'hbf) ?
                      reg12 : reg6) ^~ $signed(wire1)))));
            end
          else
            begin
              reg13 <= ($signed((!({(8'hab)} ?
                      ((8'hb6) ? reg7 : reg11) : (reg12 + wire4)))) ?
                  wire5 : (($unsigned((wire3 ? wire1 : wire1)) ?
                      (|$unsigned(reg8)) : reg13[(3'h6):(2'h2)]) == reg12));
              reg14 <= ((~|wire3) ?
                  $signed(reg12[(3'h4):(2'h3)]) : {(wire2 + $signed((-wire4)))});
              reg15 <= $unsigned($unsigned($unsigned($unsigned((wire0 << wire1)))));
              reg16 <= (reg7[(3'h6):(1'h1)] ?
                  ({(8'ha8),
                      wire2[(1'h1):(1'h1)]} - wire4[(3'h6):(3'h5)]) : $signed(wire3[(4'hb):(1'h1)]));
            end
          reg17 <= (&((~(8'hbf)) ?
              ((reg11[(3'h5):(1'h0)] ? $unsigned((8'ha2)) : reg11) ?
                  $signed({reg6}) : reg8[(2'h2):(1'h1)]) : (reg13 ?
                  $unsigned((~^reg16)) : {(-wire2), wire1[(4'h8):(2'h2)]})));
        end
      if (reg8)
        begin
          if ($unsigned(($signed(reg15[(2'h2):(1'h0)]) <<< (wire1 ?
              $unsigned(reg14) : $unsigned((reg17 & reg9))))))
            begin
              reg18 <= $signed(($signed(reg15) ?
                  $signed({wire4}) : {(!$signed(reg9))}));
              reg19 <= reg18;
              reg20 <= ((reg16 <= {$signed((wire4 - reg11)),
                  reg16}) << (!reg17[(4'h9):(4'h9)]));
              reg21 <= {$unsigned($unsigned(wire4))};
            end
          else
            begin
              reg18 <= ((~|(7'h44)) ^ reg16[(4'he):(4'hc)]);
              reg19 <= (~|{{wire3, (reg13 <<< (reg13 >> reg12))},
                  (+(((8'ha0) > reg9) ? (reg20 & (8'haf)) : $signed(reg16)))});
              reg20 <= (8'h9c);
            end
        end
      else
        begin
          reg18 <= reg20;
        end
    end
  assign wire22 = (8'hb9);
  assign wire23 = (^$signed(($unsigned((~reg17)) ?
                      $unsigned((^~reg11)) : reg10)));
endmodule
