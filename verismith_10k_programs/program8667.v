module top
#(parameter param27 = (^(((((8'hb5) == (8'hb7)) ^ {(8'haa)}) >> (8'hb2)) - {(((8'ha9) ? (8'hb6) : (8'hbb)) ^ (^(8'hab)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire26,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (7'h44);
  assign wire6 = wire2[(2'h2):(1'h0)];
  assign wire7 = (+{(|(wire1[(3'h6):(3'h4)] ?
                         $unsigned(wire5) : (wire3 ? (8'hbe) : wire2))),
                     (wire4[(2'h2):(1'h0)] * ($signed(wire3) ?
                         wire5[(3'h6):(1'h1)] : wire5))});
  assign wire8 = (~|$unsigned($signed(wire5[(3'h7):(1'h0)])));
  always
    @(posedge clk) begin
      reg9 <= $signed((8'hb1));
      if (($signed(reg9) + (^wire1[(3'h5):(1'h1)])))
        begin
          reg10 <= wire1;
          reg11 <= $signed((&{(^~(~^(8'ha3)))}));
          if ($signed({$signed(wire3[(4'hf):(4'hb)])}))
            begin
              reg12 <= ($signed((&(((8'hb0) ~^ wire2) ?
                  $unsigned(wire5) : wire6))) == wire8[(1'h0):(1'h0)]);
              reg13 <= (-($signed(reg11) ~^ $signed(reg12)));
            end
          else
            begin
              reg12 <= (|$signed(wire1));
              reg13 <= $unsigned(wire0);
              reg14 <= {($unsigned($unsigned(wire0)) ?
                      ($unsigned($signed(reg12)) >>> $signed(reg10[(4'h9):(1'h1)])) : wire7[(1'h1):(1'h0)]),
                  {{$unsigned(((8'ha5) <<< reg9))}, wire0}};
              reg15 <= wire5[(4'hd):(4'hd)];
            end
        end
      else
        begin
          if (((&($unsigned(reg14[(4'hf):(4'ha)]) ?
                  ((~&wire3) ?
                      reg11[(4'h9):(2'h3)] : (reg10 < reg10)) : reg9[(3'h4):(3'h4)])) ?
              (($signed(wire3[(1'h1):(1'h0)]) != wire8[(1'h1):(1'h1)]) ?
                  {$signed((|wire6))} : reg9) : reg10[(5'h14):(4'ha)]))
            begin
              reg10 <= reg9;
              reg11 <= {$unsigned($signed(reg9)), reg13[(4'hb):(4'hb)]};
            end
          else
            begin
              reg10 <= reg11[(1'h0):(1'h0)];
            end
        end
      reg16 <= wire4;
    end
  always
    @(posedge clk) begin
      if ($unsigned((~(^((reg9 ? (8'hb4) : wire0) ?
          {wire7, reg16} : (!reg15))))))
        begin
          if (wire7)
            begin
              reg17 <= (wire7 != {$signed(($unsigned(wire6) <= (wire6 ?
                      reg13 : wire0))),
                  $unsigned((wire3[(1'h1):(1'h0)] >> $signed(wire6)))});
              reg18 <= {(8'hb4)};
            end
          else
            begin
              reg17 <= {(8'hbf), wire4[(3'h6):(3'h6)]};
              reg18 <= {$unsigned(wire5[(5'h12):(4'hd)]),
                  $signed(wire1[(1'h0):(1'h0)])};
              reg19 <= ($unsigned($unsigned($unsigned(((8'hb5) ?
                      wire8 : reg13)))) ?
                  ($unsigned(((~^reg14) & (8'ha1))) ?
                      $unsigned({reg10[(4'h9):(2'h2)]}) : reg9[(1'h1):(1'h0)]) : ($signed($unsigned((wire7 <<< reg10))) > reg12));
              reg20 <= wire3;
            end
          reg21 <= {$unsigned($unsigned({(-reg18), wire4}))};
          reg22 <= reg16[(2'h3):(2'h2)];
        end
      else
        begin
          reg17 <= {(($signed((^~wire7)) ?
                  $unsigned((|reg11)) : reg15) * ((reg14[(4'ha):(3'h4)] ?
                      (reg10 >> reg20) : (reg21 ? wire5 : reg14)) ?
                  ((wire3 ? reg18 : wire7) ?
                      ((8'hb9) >> (8'hac)) : reg21[(2'h3):(2'h3)]) : $signed((reg17 + (8'hb8)))))};
        end
      reg23 <= ($unsigned(($signed((-wire7)) >= (+(~|wire4)))) ?
          $unsigned(wire7) : $unsigned((reg18 ?
              reg13 : ((^reg18) ? $signed((8'ha0)) : (reg19 ^~ wire4)))));
      reg24 <= (wire6[(4'h9):(1'h1)] ?
          {reg20,
              $signed({wire4, (reg9 ~^ wire3)})} : ($signed({$signed((7'h41)),
              (+reg18)}) ^ reg20));
      reg25 <= (~|(|$signed((~&((8'ha0) ? (8'hb0) : wire7)))));
    end
  assign wire26 = reg16;
endmodule
