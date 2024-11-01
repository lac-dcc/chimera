module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  assign y = {wire65, wire64, wire61, wire6, wire5, reg63, (1'h0)};
  assign wire5 = ($unsigned((~^((+wire3) < wire1[(2'h3):(2'h3)]))) ?
                     ((wire3[(1'h1):(1'h0)] ?
                             wire2[(3'h4):(2'h3)] : (~^$signed((8'ha5)))) ?
                         (wire1[(3'h6):(3'h4)] != (8'hb0)) : wire0[(4'hb):(2'h2)]) : $signed((|wire1[(3'h4):(2'h2)])));
  assign wire6 = wire3;
  module7 #() modinst62 (.wire9(wire5), .wire8(wire4), .clk(clk), .wire11(wire6), .wire10(wire0), .y(wire61));
  always
    @(posedge clk) begin
      reg63 <= $unsigned($signed(wire5));
    end
  assign wire64 = ($unsigned(wire4) ?
                      wire5[(5'h11):(4'hc)] : wire4[(4'he):(3'h4)]);
  assign wire65 = ((~|(8'hae)) ?
                      $signed((wire64[(3'h7):(3'h6)] ?
                          $signed((8'ha2)) : $signed(((8'hab) ?
                              wire6 : wire2)))) : $signed((wire4 ?
                          ((wire1 ? wire0 : wire5) ?
                              (+wire2) : $signed(wire3)) : reg63)));
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire58;
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire60, wire13, wire58, reg12, (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= ($unsigned((~$signed(wire8[(3'h4):(3'h4)]))) ?
          wire11 : (~^((^~(wire10 ^ wire8)) != wire10[(4'hb):(3'h7)])));
    end
  assign wire13 = reg12;
  module14 #() modinst59 (wire58, clk, wire9, wire8, reg12, wire11);
  assign wire60 = (~&wire13);
endmodule

module module14
#(parameter param56 = {(&((&(+(7'h44))) ? {((8'ha5) == (8'ha8)), (-(8'had))} : (+((8'h9e) >> (8'ha4))))), (((~&((7'h43) ? (8'hb7) : (8'ha9))) ? ({(8'ha7)} >= ((8'hbc) ? (8'ha0) : (8'hba))) : (((8'hb7) || (8'hab)) >= {(7'h41)})) - ((^{(8'ha6)}) ~^ ({(8'hb9)} >> ((8'h9d) ? (8'h9c) : (8'ha8)))))}, 
parameter param57 = (+param56))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire48,
                 wire47,
                 wire32,
                 wire31,
                 wire30,
                 reg50,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= (^$unsigned(wire18));
      reg20 <= wire17[(3'h7):(1'h0)];
      reg21 <= wire16[(1'h0):(1'h0)];
      if ((~|$signed(reg21)))
        begin
          reg22 <= reg21;
          reg23 <= wire15;
          reg24 <= $unsigned(wire16);
          if ($unsigned(reg24))
            begin
              reg25 <= (~&$unsigned($signed(((wire18 & reg22) ~^ {(8'hb1),
                  reg21}))));
              reg26 <= (~&{reg24[(3'h4):(2'h2)],
                  ($signed($unsigned(reg24)) ?
                      ($signed(wire16) ?
                          $unsigned(reg20) : reg24[(1'h1):(1'h1)]) : (reg24[(3'h4):(1'h0)] != reg21[(1'h0):(1'h0)]))});
              reg27 <= reg20[(2'h2):(2'h2)];
              reg28 <= reg20[(1'h1):(1'h0)];
              reg29 <= (reg22[(4'h8):(1'h0)] ?
                  $unsigned((&($signed((8'hae)) ?
                      (reg26 ? wire17 : wire17) : {reg23,
                          reg24}))) : reg27[(1'h0):(1'h0)]);
            end
          else
            begin
              reg25 <= ($signed($signed($signed(reg28))) ?
                  reg27 : (!(((8'hae) ^~ reg20) <<< (-$unsigned(reg27)))));
              reg26 <= reg20;
              reg27 <= (|({$signed((~reg20))} == (!{((8'hb1) ?
                      (8'h9e) : wire17)})));
            end
        end
      else
        begin
          reg22 <= ((($signed(reg27[(2'h3):(1'h1)]) ?
              $signed((-reg19)) : reg25) == ((~^$unsigned((8'ha7))) ?
              $signed((reg28 ? reg19 : reg26)) : (((8'hac) | reg24) ?
                  $unsigned(reg23) : (^~wire17)))) | $unsigned((((wire18 == reg27) ?
                  ((8'ha0) <= (8'ha9)) : (reg28 > reg26)) ?
              (wire17[(2'h2):(2'h2)] ?
                  $unsigned((8'hbe)) : $signed(wire15)) : $unsigned($signed(wire16)))));
        end
    end
  assign wire30 = $signed({({$unsigned(reg25), (reg26 ? reg26 : (7'h44))} ?
                          {{reg22, reg20}, $signed(reg26)} : ({wire15} ?
                              reg20[(5'h11):(3'h6)] : $unsigned((8'haa)))),
                      $signed((~^wire18[(2'h2):(1'h1)]))});
  assign wire31 = (($unsigned((~&reg20[(3'h5):(1'h0)])) >= $signed(reg28[(2'h2):(2'h2)])) != (+wire17));
  assign wire32 = wire16;
  always
    @(posedge clk) begin
      if (reg23)
        begin
          reg33 <= {((-reg28) || ((8'haa) * (-reg27))), reg23[(1'h1):(1'h0)]};
        end
      else
        begin
          reg33 <= reg25[(5'h10):(4'h8)];
          if (reg21)
            begin
              reg34 <= (wire15[(3'h5):(2'h3)] ?
                  wire31[(3'h6):(2'h2)] : ((&$signed((&wire31))) > ($signed(wire31) >= (reg33 >= (!reg25)))));
              reg35 <= (-reg23);
              reg36 <= $signed(((-reg24) | wire16));
              reg37 <= (|$unsigned($unsigned($signed((reg33 ~^ reg26)))));
              reg38 <= (wire31 ?
                  reg29[(1'h0):(1'h0)] : ({reg25} ?
                      $signed((reg19[(2'h2):(1'h1)] ?
                          (^~wire16) : (reg19 + reg19))) : (((reg22 ?
                              reg24 : (8'hae)) ?
                          (wire15 ~^ wire16) : (^~wire18)) <= ((reg20 >= reg25) ?
                          (reg22 | reg20) : (wire31 > reg34)))));
            end
          else
            begin
              reg34 <= {(wire16 ~^ $unsigned(reg23))};
              reg35 <= ((^~(~&$signed((!reg21)))) ?
                  {(reg33[(1'h1):(1'h1)] & (^~(~wire15))),
                      reg36[(3'h7):(2'h2)]} : {({(+reg29)} ?
                          reg20 : (^(reg27 ? wire30 : reg24))),
                      $unsigned((!$unsigned(wire31)))});
              reg36 <= (reg19 ?
                  ($unsigned({$signed(wire31), reg28}) <= {((wire18 & wire18) ?
                          {reg33, reg33} : (-wire15))}) : $unsigned(({{reg26}} ?
                      $signed(wire18) : $signed((~|wire15)))));
              reg37 <= reg38;
              reg38 <= $unsigned($signed((reg24[(1'h0):(1'h0)] != reg22)));
            end
          reg39 <= $signed($unsigned(({$unsigned(wire15),
              (8'hb3)} && (reg34[(3'h7):(2'h2)] ? (8'hab) : $signed(reg22)))));
          if ((reg33 ~^ (-(|reg20))))
            begin
              reg40 <= (($unsigned(($unsigned((7'h43)) < (^~reg22))) == reg39) ?
                  (reg35 ?
                      reg20 : $signed(wire15[(3'h4):(1'h0)])) : $signed((~|(~(8'haf)))));
            end
          else
            begin
              reg40 <= ($signed(reg21) ?
                  wire15 : {(wire16 ?
                          ($unsigned(wire32) >= (reg19 ?
                              (8'had) : reg29)) : (-{reg22, (8'ha7)})),
                      (~|((wire32 ? reg37 : wire16) ?
                          (wire18 ? reg29 : reg28) : $unsigned(wire15)))});
            end
        end
      if ($unsigned((reg23[(1'h1):(1'h0)] >>> ({reg19, (~|reg19)} ?
          ((wire30 ?
              reg37 : wire31) - $signed(reg34)) : $signed($unsigned(reg33))))))
        begin
          if (wire16[(3'h5):(2'h3)])
            begin
              reg41 <= (^reg36[(1'h0):(1'h0)]);
              reg42 <= reg41[(1'h1):(1'h1)];
            end
          else
            begin
              reg41 <= $unsigned({$signed((|(~|reg40)))});
              reg42 <= $signed($unsigned((7'h41)));
            end
        end
      else
        begin
          if (($unsigned(($signed(reg37) ?
              $signed((reg34 >> wire32)) : reg22[(2'h2):(1'h1)])) <= (reg37[(5'h11):(4'hd)] + ($signed($unsigned(reg41)) != ($signed(reg42) <<< (wire31 || wire32))))))
            begin
              reg41 <= $unsigned($signed(($signed($signed(reg41)) ?
                  reg26 : {(reg36 + wire15), $signed(reg36)})));
              reg42 <= (^{(~&$unsigned((^wire31)))});
              reg43 <= reg39;
              reg44 <= (($unsigned(($unsigned(reg19) ?
                      (~|(8'hb6)) : reg27)) >> reg26[(3'h4):(2'h3)]) ?
                  (^~reg29) : $unsigned(reg28[(1'h0):(1'h0)]));
              reg45 <= $signed((reg33 | (reg23 + (~|$unsigned(reg27)))));
            end
          else
            begin
              reg41 <= $unsigned((~^$unsigned($unsigned($signed(reg23)))));
              reg42 <= reg41[(3'h6):(3'h4)];
              reg43 <= $signed((~|wire32));
            end
        end
    end
  always
    @(posedge clk) begin
      reg46 <= reg33[(1'h0):(1'h0)];
    end
  assign wire47 = $unsigned((8'ha9));
  assign wire48 = (8'h9f);
  assign wire49 = (wire32[(2'h3):(1'h1)] && $signed(reg24));
  always
    @(posedge clk) begin
      reg50 <= (~|{$signed(wire15[(3'h7):(3'h5)]), reg39[(3'h5):(3'h5)]});
    end
  assign wire51 = ((+(reg46[(3'h6):(2'h3)] > {{(8'hb7), reg28},
                      reg27[(1'h0):(1'h0)]})) | ({((reg50 ? reg20 : reg42) ?
                              reg24[(1'h0):(1'h0)] : $signed(reg41)),
                          ((~|reg19) ? reg29[(1'h1):(1'h1)] : (|wire31))} ?
                      {wire47} : $signed((~^$unsigned(reg19)))));
  assign wire52 = (reg27[(3'h4):(1'h0)] * {$signed($unsigned((~|wire18)))});
  assign wire53 = wire48;
  assign wire54 = reg20[(4'he):(4'hd)];
  assign wire55 = wire30[(2'h2):(2'h2)];
endmodule
