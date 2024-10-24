module top
#(parameter param30 = ((^((((8'h9c) >>> (8'ha8)) ? ((8'h9e) << (8'h9f)) : ((8'hac) ? (8'ha5) : (8'hb7))) ? (!(!(8'ha0))) : (((8'hac) * (8'ha1)) ? (~&(8'h9c)) : ((8'hab) ? (8'hb4) : (8'hb0))))) - ((-(-((7'h40) ? (7'h41) : (8'ha5)))) ? ((&((8'h9c) ? (8'had) : (8'hb3))) > (~|(+(8'ha7)))) : (((!(8'ha5)) >= ((8'hb5) >= (8'hb1))) ? (~&((8'hae) ? (7'h40) : (8'hbe))) : ((~^(8'hba)) == ((8'h9f) ? (8'hb0) : (8'hb7)))))), 
parameter param31 = param30)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = wire2[(4'hd):(4'hc)];
  assign wire5 = ((($signed(wire3[(2'h3):(2'h3)]) <= {wire0}) + ($unsigned(wire3[(5'h13):(5'h11)]) ?
                     wire3[(5'h15):(5'h11)] : ((wire0 >> wire0) ?
                         ((8'hb6) && wire2) : wire1))) * (^~$unsigned($unsigned((wire2 ^~ wire0)))));
  assign wire6 = wire4;
  assign wire7 = $signed((({{wire0, wire3}} ?
                         ($signed(wire0) > (wire4 * wire2)) : wire4) ?
                     (~^wire2[(4'hb):(3'h5)]) : wire4));
  assign wire8 = (-(!{$signed(((7'h40) ? wire6 : wire2)),
                     $signed($unsigned(wire1))}));
  assign wire9 = wire7;
  always
    @(posedge clk) begin
      if (wire3[(2'h2):(1'h1)])
        begin
          reg10 <= wire9;
          if ($signed(wire3[(4'hf):(2'h2)]))
            begin
              reg11 <= wire2[(5'h11):(4'h8)];
            end
          else
            begin
              reg11 <= $signed((|(($signed(wire8) != ((8'ha4) ?
                  wire9 : wire0)) != wire8[(1'h0):(1'h0)])));
            end
          reg12 <= (-{wire0[(2'h3):(2'h2)]});
          if (wire3)
            begin
              reg13 <= wire2;
              reg14 <= $unsigned(wire3[(5'h12):(3'h5)]);
              reg15 <= wire1[(2'h3):(2'h3)];
            end
          else
            begin
              reg13 <= wire1[(3'h4):(1'h1)];
              reg14 <= {wire5, reg13};
              reg15 <= ((8'ha9) * ($unsigned(($signed(reg11) ~^ (reg12 ?
                      wire3 : reg15))) ?
                  {wire0[(1'h1):(1'h0)],
                      ((wire2 ? wire0 : wire0) ?
                          (~|wire6) : $unsigned(reg13))} : $unsigned(($unsigned(wire2) ?
                      $signed(reg15) : (~|wire0)))));
              reg16 <= ({(!wire5[(5'h12):(5'h12)]),
                  (wire5 ?
                      (wire1[(3'h4):(1'h0)] ?
                          $signed(wire1) : (wire6 == wire3)) : (^~(~|wire7)))} <= (|{(8'hb4),
                  $signed((|wire4))}));
            end
          reg17 <= $signed($unsigned(reg10));
        end
      else
        begin
          reg10 <= $unsigned({$unsigned({wire0}),
              $signed($signed((wire6 == wire0)))});
        end
      reg18 <= ($signed((8'hac)) ?
          $signed((^reg17)) : ((((reg16 <<< wire3) ?
              (wire9 + (8'hbf)) : $unsigned(reg17)) != $signed(wire3)) ^~ (wire2[(5'h11):(4'he)] ?
              wire0[(2'h3):(2'h3)] : $unsigned((wire4 ? (8'h9e) : reg14)))));
      if ($unsigned($signed(reg14)))
        begin
          reg19 <= ({($unsigned((-reg13)) ?
                  ((reg18 ? wire4 : wire1) & reg16) : (+{wire8, (8'ha4)})),
              ((-(wire7 ?
                  wire6 : reg18)) && $unsigned({reg10}))} * $unsigned(((~^reg10) << wire4)));
          if ($unsigned($unsigned($unsigned(({wire2, reg17} < wire2)))))
            begin
              reg20 <= {((wire9[(3'h4):(1'h1)] ~^ $unsigned((reg17 != wire0))) ?
                      $signed({{wire8, reg18},
                          reg11[(4'he):(3'h4)]}) : $signed($signed($signed(wire1)))),
                  wire1[(2'h3):(2'h3)]};
            end
          else
            begin
              reg20 <= reg19[(5'h13):(4'hb)];
              reg21 <= $unsigned($unsigned($signed((wire6 | wire4))));
              reg22 <= wire2;
            end
          if (wire5)
            begin
              reg23 <= $unsigned((&$unsigned(reg22[(3'h7):(3'h4)])));
            end
          else
            begin
              reg23 <= $signed(((&wire7) ^~ (reg15 ?
                  ((^wire2) ?
                      (reg11 >> wire0) : $signed(reg15)) : (^wire6[(3'h7):(1'h0)]))));
            end
        end
      else
        begin
          reg19 <= $signed($signed((8'hbe)));
          reg20 <= reg20;
        end
      if ($unsigned(({{reg20[(1'h1):(1'h0)]}} <= (wire9[(2'h2):(1'h0)] >> $unsigned((reg21 ?
          reg17 : wire7))))))
        begin
          reg24 <= reg20[(3'h7):(1'h0)];
        end
      else
        begin
          if (($unsigned((((reg14 ? reg23 : reg10) ?
                  {reg18} : reg10[(4'ha):(3'h4)]) << $unsigned((|wire5)))) ?
              reg23[(3'h7):(3'h4)] : (+({(~&wire2)} <= wire5))))
            begin
              reg24 <= {((wire0 <= $unsigned((8'hb8))) >= wire5[(2'h3):(1'h1)]),
                  ((-(7'h41)) ?
                      (|reg14) : $signed(((+reg10) ?
                          $unsigned(reg15) : reg24)))};
              reg25 <= (reg18 > reg13[(5'h13):(5'h10)]);
              reg26 <= ($unsigned($signed((reg21[(1'h1):(1'h0)] ?
                      $signed(reg15) : (reg16 || reg19)))) ?
                  wire0[(2'h3):(2'h2)] : ($signed(wire6) == {reg16[(3'h6):(1'h0)],
                      ((reg18 + reg10) ?
                          ((8'h9d) || reg23) : $unsigned(reg19))}));
              reg27 <= reg17;
              reg28 <= reg17;
            end
          else
            begin
              reg24 <= (~^(&$unsigned((~|(reg13 == reg27)))));
              reg25 <= (wire1 ~^ (~|(!$unsigned(wire5))));
              reg26 <= {wire8, $signed(reg14)};
              reg27 <= $signed(wire9[(3'h4):(2'h2)]);
            end
        end
      reg29 <= (({$unsigned((~^reg22)),
              (reg15[(1'h0):(1'h0)] ^~ $unsigned(reg25))} <= (^~((8'hac) ^ {wire8,
              reg13}))) ?
          wire0 : reg24);
    end
endmodule
