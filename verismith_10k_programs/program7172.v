module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire32,
                 wire16,
                 wire13,
                 wire12,
                 wire11,
                 wire9,
                 wire8,
                 reg31,
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
                 reg15,
                 reg14,
                 reg10,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((|(((&wire1) ?
          (wire2 ?
              wire2 : wire1) : wire0[(1'h0):(1'h0)]) - wire1[(2'h2):(1'h1)])));
      reg5 <= {$unsigned(wire2), (~|wire3[(2'h2):(1'h1)])};
      reg6 <= $signed(((~wire1[(1'h0):(1'h0)]) ?
          (($signed(reg5) ? (reg4 == wire0) : (!reg5)) ?
              ((wire1 ? reg5 : wire2) ?
                  wire3[(1'h1):(1'h1)] : wire2[(1'h0):(1'h0)]) : $signed((wire0 >>> wire3))) : $signed(reg4[(3'h4):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg7 <= (-wire0);
    end
  assign wire8 = (reg6[(3'h4):(2'h2)] != reg6[(4'ha):(4'h8)]);
  assign wire9 = reg7;
  always
    @(posedge clk) begin
      reg10 <= {$signed(wire0[(3'h5):(2'h2)])};
    end
  assign wire11 = ((~|wire9) >= {$signed(reg10[(1'h1):(1'h0)])});
  assign wire12 = ({$unsigned($unsigned((8'hba)))} <<< wire11);
  assign wire13 = $signed((~|{(reg4[(3'h4):(1'h1)] ?
                          wire2 : ((8'hb4) ? wire12 : (8'ha8))),
                      $unsigned($unsigned(reg6))}));
  always
    @(posedge clk) begin
      reg14 <= $signed(wire3[(1'h0):(1'h0)]);
      reg15 <= $signed(wire8);
    end
  assign wire16 = (~^(wire11[(4'hf):(3'h5)] ?
                      ($signed((reg10 ? wire9 : reg10)) ?
                          $signed({wire9,
                              reg6}) : (wire9 | $signed(wire2))) : (($signed(reg7) >> $unsigned(wire13)) ~^ (wire13[(4'hd):(4'ha)] != $unsigned((7'h42))))));
  always
    @(posedge clk) begin
      if ((-($signed({$signed(reg4)}) ?
          wire2[(3'h7):(3'h4)] : (~&($signed(reg7) ? wire13 : (reg6 - reg4))))))
        begin
          reg17 <= $unsigned((wire0 ?
              (wire3 ?
                  (~$signed(wire13)) : ($signed(reg6) <<< $signed((8'hb5)))) : $signed({(8'hb7)})));
          reg18 <= reg14;
          if ((wire0[(3'h7):(3'h4)] ?
              (wire0[(2'h3):(1'h0)] ?
                  reg17[(5'h12):(4'h9)] : reg6[(5'h11):(4'hd)]) : reg15[(1'h0):(1'h0)]))
            begin
              reg19 <= {((+reg7) ~^ wire0[(4'hb):(1'h0)])};
              reg20 <= (~&(~$unsigned(({reg7, wire11} ?
                  $unsigned(wire9) : (reg4 >= wire1)))));
              reg21 <= ((~reg10[(2'h2):(2'h2)]) ?
                  reg4[(1'h1):(1'h0)] : reg17[(5'h10):(4'hd)]);
              reg22 <= ($unsigned((~&(reg4 ?
                  reg18 : (wire3 ? wire8 : wire11)))) <= reg21);
            end
          else
            begin
              reg19 <= ((reg15[(3'h4):(1'h0)] ?
                      (wire13[(3'h5):(3'h4)] ?
                          $signed(wire12) : (reg17[(3'h5):(2'h2)] & $signed((8'hae)))) : (wire2[(1'h0):(1'h0)] > ({reg14,
                              reg15} ?
                          wire8[(3'h7):(3'h5)] : (~reg17)))) ?
                  reg7 : {reg20[(4'h8):(3'h5)]});
              reg20 <= $signed({reg22});
              reg21 <= reg20[(4'h8):(3'h7)];
              reg22 <= {reg17};
            end
        end
      else
        begin
          if (reg14)
            begin
              reg17 <= $unsigned(($signed(reg21[(4'h9):(3'h5)]) ?
                  (reg14[(1'h1):(1'h0)] ~^ $signed($unsigned(reg6))) : (^~(~reg10[(1'h1):(1'h0)]))));
              reg18 <= {(^~$unsigned(reg15[(1'h1):(1'h0)])),
                  {reg10[(2'h2):(1'h0)]}};
              reg19 <= $signed($unsigned(reg19));
              reg20 <= reg22[(3'h6):(3'h5)];
              reg21 <= (!$signed(reg22));
            end
          else
            begin
              reg17 <= (({reg18[(2'h2):(2'h2)]} + (((reg7 ?
                          reg10 : wire0) <<< ((7'h43) ? wire1 : wire9)) ?
                      ({reg5} != $unsigned((7'h40))) : wire3)) ?
                  (!$signed(wire13)) : ({$signed($unsigned(reg5)),
                          (|reg7[(3'h6):(3'h4)])} ?
                      {wire8[(4'hb):(3'h7)],
                          wire16} : $unsigned((~|$unsigned((8'hb8))))));
              reg18 <= reg10;
            end
          reg22 <= reg21;
          reg23 <= $unsigned($signed(reg7));
          reg24 <= ((wire12 ?
              wire16[(1'h0):(1'h0)] : (|$unsigned(reg23[(1'h0):(1'h0)]))) >> (8'hae));
        end
      if (reg14[(1'h0):(1'h0)])
        begin
          reg25 <= (~^$unsigned(({wire13} ?
              $unsigned((~|reg10)) : ({reg18} == (wire9 ^ reg6)))));
          if ({$signed((wire12 || (^$signed(reg7)))),
              $signed($signed($signed(reg18)))})
            begin
              reg26 <= $unsigned(reg20[(4'ha):(3'h5)]);
              reg27 <= $unsigned(($unsigned($signed(wire1)) <= (~&$unsigned((wire9 >> reg5)))));
              reg28 <= {$unsigned((|reg4[(1'h1):(1'h1)])),
                  (~&$unsigned($signed($unsigned(reg23))))};
              reg29 <= reg4[(3'h4):(2'h2)];
              reg30 <= $unsigned($signed((({wire11} ?
                  $signed((8'hb9)) : (wire16 ^~ reg22)) & wire8[(4'ha):(1'h1)])));
            end
          else
            begin
              reg26 <= ((($unsigned(reg25[(3'h4):(1'h0)]) - {(reg30 > reg27)}) | (+$unsigned(reg21))) ?
                  $unsigned((^((reg30 ?
                      reg25 : wire16) && wire9))) : ($unsigned($unsigned({(8'hb6)})) > $unsigned(((reg30 != (8'had)) ?
                      (8'hb9) : reg5[(1'h0):(1'h0)]))));
              reg27 <= (~(8'hab));
              reg28 <= $signed(reg27);
            end
          reg31 <= (!reg17[(4'hb):(1'h0)]);
        end
      else
        begin
          reg25 <= (^(~&$unsigned($signed((wire16 >> reg14)))));
          reg26 <= (+(|(8'hb5)));
        end
    end
  assign wire32 = ((!((8'ha1) <= wire1[(2'h2):(2'h2)])) ?
                      {wire8,
                          $signed($unsigned((~^wire2)))} : reg5[(2'h2):(2'h2)]);
endmodule
