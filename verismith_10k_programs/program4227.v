module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((7'h42))
        begin
          reg4 <= ((wire3[(4'h9):(3'h7)] ?
              ((+wire3) ?
                  wire3 : $unsigned((wire2 ^~ (8'hb5)))) : $unsigned(wire0)) >= ((8'hae) & {$unsigned({wire3,
                  wire2}),
              ($unsigned(wire1) >>> (wire3 + wire3))}));
          if (($signed($signed((reg4 ^ {wire1, wire3}))) ?
              reg4 : $unsigned((~^wire3[(4'hc):(3'h4)]))))
            begin
              reg5 <= (((((8'ha2) ? (wire1 > (8'hb5)) : wire0) ?
                  wire2 : {(wire2 & wire1),
                      (wire2 != reg4)}) && $unsigned((-reg4[(1'h0):(1'h0)]))) >> ((wire2 - ((wire0 > wire2) <= wire0)) ?
                  $signed({{wire3},
                      wire0[(1'h1):(1'h0)]}) : (wire1[(1'h1):(1'h0)] + $unsigned($unsigned(wire0)))));
            end
          else
            begin
              reg5 <= $signed(wire3[(3'h6):(2'h2)]);
            end
          reg6 <= ($unsigned($signed((wire3 ? (wire1 ^ wire3) : wire3))) ?
              $unsigned($unsigned((~^reg4[(1'h0):(1'h0)]))) : {(|$unsigned((reg5 ?
                      wire3 : reg5))),
                  ($signed((wire2 ? wire1 : wire3)) ?
                      ((+reg4) ?
                          (reg5 ?
                              wire0 : wire2) : reg5[(1'h0):(1'h0)]) : wire0[(3'h4):(2'h2)])});
        end
      else
        begin
          if (wire1)
            begin
              reg4 <= ((+wire2[(3'h7):(3'h6)]) ?
                  $signed({(~|$signed((8'ha0))),
                      (&reg5[(4'hf):(4'hf)])}) : $signed($signed((wire1 ?
                      $signed(wire0) : $unsigned(wire0)))));
              reg5 <= wire2[(3'h6):(1'h1)];
              reg6 <= {$unsigned(((8'h9e) < $unsigned(((8'hae) ?
                      reg6 : wire2)))),
                  (~$unsigned((|(wire0 ? reg4 : wire2))))};
              reg7 <= wire2;
            end
          else
            begin
              reg4 <= ($signed(reg6[(1'h1):(1'h0)]) ?
                  reg5[(2'h3):(1'h1)] : (8'h9e));
              reg5 <= ((($signed(reg6) ?
                  wire1 : (reg5 ?
                      (reg5 ?
                          reg5 : reg4) : $unsigned(wire0))) >>> (&($unsigned((8'hb7)) - reg4))) - reg4);
              reg6 <= ($signed({reg4}) ?
                  (($signed((reg6 << wire1)) ^ (reg4 ?
                          ((8'hb1) ? (8'hbb) : (8'ha4)) : (~reg7))) ?
                      $unsigned(wire1) : wire2) : (wire1[(1'h1):(1'h1)] != (~^$signed((8'ha8)))));
            end
          reg8 <= $signed((~((~reg7[(1'h0):(1'h0)]) ?
              reg7[(3'h4):(1'h1)] : (^(wire2 ? wire3 : reg6)))));
          reg9 <= wire1;
          reg10 <= reg7[(1'h1):(1'h1)];
        end
    end
  assign wire11 = {$signed((~&$unsigned(reg6))), (~reg8)};
  assign wire12 = ({($unsigned($unsigned(reg7)) ?
                          (8'ha6) : ($unsigned(reg6) ~^ (reg4 ?
                              wire11 : wire1))),
                      (^~$signed({reg10, reg9}))} + ($signed({wire1,
                          $signed((8'ha7))}) ?
                      reg9[(1'h0):(1'h0)] : $signed(reg5[(4'h9):(3'h5)])));
  assign wire13 = $unsigned(reg7[(3'h6):(1'h1)]);
  assign wire14 = (wire3 ?
                      reg7[(1'h0):(1'h0)] : ($signed((&$unsigned((8'ha7)))) != $unsigned(reg8)));
  always
    @(posedge clk) begin
      if (wire11)
        begin
          reg15 <= reg4;
          reg16 <= reg9;
        end
      else
        begin
          reg15 <= $unsigned((~&(~|reg10[(1'h0):(1'h0)])));
          reg16 <= wire0[(3'h4):(1'h1)];
          if (wire1[(1'h0):(1'h0)])
            begin
              reg17 <= {$unsigned($signed(reg8[(4'h8):(3'h7)])),
                  $unsigned(reg9)};
              reg18 <= reg15[(3'h5):(1'h0)];
              reg19 <= ((|reg5) ?
                  wire11[(2'h2):(1'h0)] : ((~wire1) ?
                      (wire0[(1'h1):(1'h0)] ~^ $unsigned(wire12[(3'h6):(2'h3)])) : {wire0[(2'h3):(2'h3)]}));
              reg20 <= ((~&((reg6[(3'h6):(3'h5)] >= (reg10 ? reg18 : wire3)) ?
                  (~&$signed(wire3)) : ($unsigned(reg15) + {(7'h43),
                      (8'ha1)}))) ^~ reg15[(2'h2):(1'h0)]);
            end
          else
            begin
              reg17 <= $unsigned((wire14[(1'h1):(1'h0)] >>> (reg19[(4'he):(3'h7)] & (((8'ha3) - reg6) ?
                  (~(8'hab)) : (8'hb1)))));
              reg18 <= (reg7[(2'h2):(1'h0)] ?
                  (~$signed(((wire1 ?
                      reg19 : wire3) ^ wire2[(4'h8):(1'h1)]))) : (((~$unsigned(reg18)) << (+(reg20 - wire2))) ?
                      $signed((-(-wire11))) : (({(8'ha8),
                              wire3} & (reg19 * reg5)) ?
                          (wire0[(2'h3):(2'h2)] ?
                              $signed(wire13) : wire1) : reg15)));
            end
        end
      reg21 <= reg8;
      reg22 <= reg5;
    end
  assign wire23 = reg10;
  assign wire24 = wire1[(1'h0):(1'h0)];
endmodule
