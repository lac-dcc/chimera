module top
#(parameter param19 = ((({{(8'ha6), (8'haa)}} ? ({(8'hbe)} << ((8'hb3) | (8'hae))) : (8'hb6)) <= ((8'hb8) + {((8'hb1) * (8'ha2)), ((8'hb5) ? (8'ha1) : (8'hbc))})) > (+(({(7'h41)} * (~|(8'haf))) > ((8'hbc) * ((8'hab) ? (8'ha3) : (8'ha2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire4,
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
  assign wire4 = $unsigned((wire0 ?
                     $unsigned(($signed(wire0) != $signed(wire2))) : wire3[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg5 <= (wire0 <= (((+(~wire0)) | $unsigned($unsigned(wire1))) & (wire1 != (wire0 ~^ {wire4,
          (8'haf)}))));
      reg6 <= wire3;
      if (wire4[(3'h6):(3'h6)])
        begin
          if ({reg6,
              (wire3[(1'h1):(1'h1)] ?
                  $signed((!(8'ha0))) : $signed(($unsigned(wire4) && $signed(wire2))))})
            begin
              reg7 <= $signed((($unsigned(wire0) ?
                  $unsigned((wire1 ?
                      wire2 : reg6)) : reg5) != $signed((8'hba))));
              reg8 <= $signed((~^$signed(((reg7 ?
                  wire3 : wire0) + reg6[(4'he):(1'h1)]))));
              reg9 <= reg6;
            end
          else
            begin
              reg7 <= (|reg8);
            end
          reg10 <= $unsigned((($unsigned($signed(wire1)) & $unsigned(reg6)) & $unsigned(reg5)));
          reg11 <= ($signed(({wire3[(2'h2):(1'h0)]} ? reg9 : reg9)) ?
              ((~(~^$unsigned(reg8))) ?
                  (wire3[(2'h3):(2'h2)] && (^{reg9})) : (^$signed((!reg8)))) : (!wire0));
          reg12 <= {$unsigned((($unsigned(wire3) ? (^wire2) : $signed(reg6)) ?
                  reg9 : $signed($unsigned(reg6))))};
        end
      else
        begin
          if (reg8[(3'h4):(2'h2)])
            begin
              reg7 <= $unsigned(reg9);
              reg8 <= {reg7[(2'h2):(1'h1)], (^reg9[(5'h13):(4'hc)])};
              reg9 <= wire2[(2'h2):(1'h1)];
              reg10 <= $signed($unsigned($signed((+wire3[(1'h0):(1'h0)]))));
              reg11 <= {$signed((-reg5[(1'h1):(1'h0)]))};
            end
          else
            begin
              reg7 <= (^$unsigned(reg9[(4'hd):(1'h0)]));
              reg8 <= $signed(reg9);
            end
        end
      if ((8'ha8))
        begin
          reg13 <= reg9[(5'h10):(4'he)];
          reg14 <= reg10[(2'h3):(2'h3)];
        end
      else
        begin
          reg13 <= ((-(&(7'h42))) ?
              (^wire1[(2'h2):(2'h2)]) : $signed(({$unsigned(reg5)} ?
                  (~reg13) : ($unsigned(reg5) ?
                      reg10 : reg10[(1'h1):(1'h1)]))));
          reg14 <= (wire0 * reg12);
          reg15 <= reg8;
        end
    end
  assign wire16 = $unsigned({(($signed(reg8) ?
                              (reg6 + (8'hb1)) : reg14[(2'h3):(2'h3)]) ?
                          ((-reg6) ? ((7'h41) ? wire3 : reg5) : wire2) : reg6),
                      wire2[(1'h0):(1'h0)]});
  assign wire17 = ($unsigned((~|($unsigned((8'ha4)) ?
                          (reg6 ? wire16 : (8'ha2)) : (reg6 ?
                              reg10 : wire16)))) ?
                      reg15 : ($signed(reg12) ?
                          {$signed(((8'hbb) | reg8))} : (~$signed(wire16))));
  assign wire18 = $unsigned(((~|$signed(reg12)) ? reg13 : reg12));
endmodule
