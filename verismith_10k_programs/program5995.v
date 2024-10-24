module top
#(parameter param34 = {(~(+(((7'h43) ? (8'hbd) : (8'hb4)) ? ((8'hbf) || (8'h9f)) : (&(7'h43))))), (((!(&(8'haf))) ^ (~|(~&(8'hb1)))) ^ (((~&(8'hb1)) & ((8'ha9) ? (7'h44) : (8'hb7))) >= (8'hbd)))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire33,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg32,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~$unsigned((wire2[(2'h2):(1'h1)] == (wire2 ? wire0 : wire2)))) ?
          wire0[(4'hf):(3'h6)] : (~|(~&wire3[(4'hc):(3'h6)]))))
        begin
          reg4 <= $unsigned(wire3);
          reg5 <= $signed(($unsigned({$signed(wire0)}) ?
              (~$signed({(8'ha3), wire3})) : (($signed(wire1) ?
                  wire3[(4'h9):(3'h7)] : $unsigned(wire0)) >> $unsigned($unsigned(wire0)))));
          reg6 <= ((((~^wire1[(3'h7):(1'h1)]) <= wire1) <<< $signed(({wire0,
                  reg4} ?
              {wire0, reg4} : reg4[(2'h3):(1'h1)]))) && (+reg4));
          reg7 <= ((~&reg4[(3'h4):(1'h1)]) || wire3);
          reg8 <= $signed(wire0);
        end
      else
        begin
          reg4 <= wire3;
          reg5 <= reg6[(1'h0):(1'h0)];
          reg6 <= reg8[(3'h6):(1'h0)];
          reg7 <= reg7[(2'h2):(1'h0)];
        end
    end
  assign wire9 = reg8[(4'hb):(2'h3)];
  assign wire10 = $unsigned({($signed(wire1) << reg8),
                      ($unsigned($signed(wire2)) - (~|$signed((8'ha7))))});
  assign wire11 = reg5;
  assign wire12 = wire0[(4'h9):(3'h5)];
  assign wire13 = {($signed((|reg8)) ?
                          ((reg8 == (reg4 || wire3)) ?
                              (^~$unsigned(reg4)) : reg7) : $signed((8'hbd))),
                      (wire11 ?
                          ((+$unsigned(reg4)) > ((^wire12) == (wire2 ?
                              reg4 : reg8))) : wire1[(4'h9):(2'h3)])};
  assign wire14 = $signed($unsigned(reg8[(1'h0):(1'h0)]));
  assign wire15 = (reg4[(1'h1):(1'h1)] > wire2[(2'h2):(2'h2)]);
  assign wire16 = wire12[(1'h0):(1'h0)];
  assign wire17 = $unsigned(((wire10[(1'h0):(1'h0)] ?
                      $signed(wire1[(5'h11):(4'hc)]) : wire1) || reg6[(1'h1):(1'h1)]));
  assign wire18 = ($signed(wire1[(5'h11):(3'h7)]) ?
                      ((wire1 ?
                          wire9[(3'h5):(2'h2)] : (~&$signed(wire15))) ^~ ($signed($signed(wire16)) ?
                          reg6[(1'h1):(1'h1)] : $unsigned({wire1}))) : $unsigned((((8'ha1) >> $signed(wire16)) ^ ($unsigned(wire9) > (wire15 ?
                          wire9 : wire9)))));
  always
    @(posedge clk) begin
      if ({(7'h42), wire17[(4'ha):(3'h4)]})
        begin
          if ($signed($unsigned((wire16[(3'h6):(3'h4)] ?
              $unsigned($signed(wire12)) : wire2))))
            begin
              reg19 <= wire9;
              reg20 <= (&(({{wire13}, wire13} ?
                  wire16[(4'hd):(2'h2)] : (|$unsigned(wire16))) <<< $signed((reg8 ?
                  (wire13 ? wire13 : reg5) : ((8'had) ? wire17 : wire1)))));
              reg21 <= wire10;
            end
          else
            begin
              reg19 <= $unsigned((($signed((^~reg5)) ?
                  $unsigned((wire18 <= reg4)) : wire18[(2'h2):(1'h0)]) * $signed($unsigned(reg21[(4'h9):(3'h5)]))));
            end
          reg22 <= ((-$signed((^~$signed(wire11)))) ?
              (wire11 ?
                  $signed((wire14 ?
                      (|wire9) : $signed(wire2))) : $unsigned(wire0)) : $unsigned($signed({$unsigned((8'ha8))})));
          if ((((!(reg4 ?
              $signed(wire13) : $unsigned(reg4))) > ($unsigned(wire18[(1'h0):(1'h0)]) ?
              $unsigned((8'hb9)) : $unsigned(wire10))) < {$signed((|reg19)),
              $unsigned(reg5)}))
            begin
              reg23 <= (($signed(($signed(reg7) ?
                      (reg21 ? reg22 : reg5) : wire10)) ?
                  (($signed(wire11) >= (wire11 ? reg19 : wire12)) ?
                      $unsigned((wire16 << wire16)) : (((8'h9e) ^ wire2) ?
                          reg20[(3'h7):(3'h4)] : (wire16 ?
                              reg5 : wire11))) : reg20[(1'h1):(1'h1)]) <= reg20);
              reg24 <= ($signed((((reg8 ? wire11 : wire14) ^ reg19) ?
                  ($unsigned(wire1) ?
                      $unsigned(reg5) : wire9) : reg21[(4'h8):(4'h8)])) ^~ {$signed((-wire11)),
                  reg23[(3'h7):(1'h1)]});
            end
          else
            begin
              reg23 <= reg19;
              reg24 <= $signed(((^(((8'hb9) & wire3) ^ wire2[(2'h2):(1'h1)])) || wire17));
              reg25 <= (~^{reg20[(4'ha):(2'h2)]});
            end
        end
      else
        begin
          reg19 <= (!wire14);
          reg20 <= $unsigned(wire3);
          reg21 <= $unsigned(wire14[(4'he):(1'h0)]);
          if ($signed($unsigned(wire14[(4'hb):(3'h6)])))
            begin
              reg22 <= ((wire0 ?
                  reg8 : $unsigned((~&$signed(wire16)))) ~^ ($unsigned(wire2) ?
                  ($signed($signed((8'hb1))) ?
                      wire16[(4'hd):(4'h9)] : reg7[(1'h0):(1'h0)]) : wire18));
              reg23 <= (~&wire1);
            end
          else
            begin
              reg22 <= (8'ha1);
              reg23 <= $signed(((($unsigned(reg24) ?
                      (+wire17) : wire18[(2'h2):(1'h0)]) ^ wire9) ?
                  (+(~&$unsigned(reg20))) : $signed(($signed(wire12) ?
                      $signed((7'h40)) : $unsigned(wire18)))));
              reg24 <= wire2;
            end
          reg25 <= (8'hb8);
        end
      if ((reg20 - reg21[(1'h0):(1'h0)]))
        begin
          reg26 <= (((($signed(reg21) > (reg24 ?
                  reg24 : wire3)) || (|(reg4 ~^ wire10))) ?
              $unsigned((|(wire0 ~^ reg25))) : $signed((~reg6[(2'h2):(2'h2)]))) <<< wire3);
          reg27 <= ($unsigned(wire10) ?
              wire15[(1'h0):(1'h0)] : ($signed(($unsigned(reg25) ^ $signed(wire0))) + {reg23}));
          reg28 <= $unsigned(((wire0[(5'h11):(3'h5)] ^~ (!$signed(wire18))) <= ({(wire9 | (8'ha4)),
                  wire2[(1'h0):(1'h0)]} ?
              ((wire14 ? wire9 : (8'ha3)) ?
                  (reg5 >>> reg24) : (^~reg27)) : ($unsigned(wire2) ?
                  $signed(wire15) : ((8'hb4) ^ wire11)))));
          reg29 <= (wire0 ?
              $signed($unsigned(($unsigned(wire10) ?
                  reg8[(3'h4):(2'h3)] : (wire9 ?
                      wire3 : wire10)))) : $unsigned(reg21));
          reg30 <= $signed($unsigned((reg19[(2'h2):(1'h0)] ?
              wire1[(3'h7):(1'h1)] : $signed((reg24 ? reg5 : reg26)))));
        end
      else
        begin
          reg26 <= $signed({$signed(((wire3 <= reg29) ?
                  (wire17 ^~ wire12) : reg27))});
          reg27 <= (~|reg28[(1'h0):(1'h0)]);
          reg28 <= (($unsigned(reg30) && $signed($unsigned((+wire0)))) ?
              ((~|({(8'hbe), (8'hb9)} ?
                  (+wire18) : wire12)) > (~reg19[(3'h5):(2'h3)])) : (8'ha3));
          reg29 <= $signed((({(^reg28)} ? wire13 : reg22) ^ ({(wire13 ?
                  wire13 : reg25)} <<< (^~$signed((8'ha5))))));
          reg30 <= (wire0[(4'ha):(3'h6)] ?
              $signed((wire9 ?
                  (wire1[(1'h0):(1'h0)] ~^ (wire2 == (8'hb4))) : (wire17 ?
                      (~reg29) : reg24))) : reg26);
        end
      reg31 <= (wire3[(3'h7):(3'h7)] ?
          $unsigned((!((^wire3) ?
              (wire9 ? reg30 : wire2) : wire2[(1'h1):(1'h1)]))) : ((7'h43) ?
              reg20 : ((~reg26[(2'h2):(1'h1)]) < wire2[(1'h1):(1'h0)])));
      reg32 <= (reg26[(5'h11):(4'ha)] >= $unsigned($signed(((~reg26) || (&reg19)))));
    end
  assign wire33 = {reg23};
endmodule
