module top
#(parameter param41 = ({(^(7'h40)), (~&((&(8'ha9)) ? {(8'ha8), (8'ha8)} : ((8'hbd) ? (8'ha3) : (8'ha3))))} ^~ (~|(~&(~((8'ha4) ? (8'hbd) : (8'hb0)))))), 
parameter param42 = param41)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire9,
                 wire6,
                 wire5,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed({(($unsigned(wire2) ?
                         wire1 : $unsigned(wire4)) >> $signed((wire2 ?
                         wire2 : wire0)))});
  assign wire6 = $unsigned(wire1[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= ((8'hb1) != (($unsigned((wire2 ?
          wire0 : (8'ha2))) <<< (~|wire6)) > (((wire5 > wire6) ?
          (wire2 ~^ wire6) : (wire2 >>> wire5)) > wire5)));
      reg8 <= (!wire0[(3'h6):(1'h0)]);
    end
  assign wire9 = (~|wire5);
  always
    @(posedge clk) begin
      reg10 <= wire3[(3'h4):(2'h3)];
      reg11 <= wire5[(3'h4):(2'h2)];
      reg12 <= wire0;
      if ((8'ha3))
        begin
          reg13 <= $signed($signed({reg12}));
          if ($unsigned(($signed((~((7'h40) >>> reg10))) ?
              ($unsigned({(8'hb7), reg7}) ?
                  $signed((wire9 ? (8'ha7) : (7'h44))) : (((8'hb9) <<< wire3) ?
                      (wire3 ?
                          (8'ha0) : (8'ha5)) : (^reg8))) : $unsigned((8'hb0)))))
            begin
              reg14 <= ((!wire5[(2'h2):(1'h1)]) ?
                  (reg10[(3'h5):(1'h0)] << $signed(($unsigned(wire5) ?
                      $unsigned(reg11) : $unsigned(wire0)))) : $signed(wire5));
              reg15 <= wire9;
              reg16 <= wire0[(1'h0):(1'h0)];
            end
          else
            begin
              reg14 <= wire6[(4'ha):(3'h7)];
              reg15 <= $signed($unsigned((!$unsigned((&reg10)))));
              reg16 <= $signed(wire9);
              reg17 <= $unsigned(reg12[(1'h0):(1'h0)]);
            end
          reg18 <= $unsigned($unsigned($signed($signed((~&(8'haf))))));
        end
      else
        begin
          reg13 <= wire1[(1'h0):(1'h0)];
          reg14 <= ($signed((8'hbe)) ?
              $signed(((~$unsigned(reg13)) ?
                  (reg17[(2'h3):(2'h3)] ^~ (!reg12)) : (reg15 ?
                      (wire2 >> reg16) : reg10))) : {(!{(~^reg8)}),
                  (((reg12 * reg12) ?
                      (^~wire4) : $signed((8'hb2))) == ((wire9 >= wire6) >= $unsigned((8'hb8))))});
          if (wire0[(1'h1):(1'h0)])
            begin
              reg15 <= $unsigned(($signed($signed($signed(reg16))) ?
                  (~|$unsigned(reg16)) : (reg11[(3'h5):(2'h2)] - (-$signed((8'hbc))))));
              reg16 <= reg15;
            end
          else
            begin
              reg15 <= (wire0[(3'h7):(2'h2)] != (~|$signed($unsigned((wire2 <<< reg16)))));
              reg16 <= ((+$signed((!$signed(reg16)))) ?
                  ((reg11[(2'h2):(2'h2)] ?
                      ((^reg10) ?
                          reg12[(1'h1):(1'h1)] : wire6) : (~&(reg17 >>> (8'hbd)))) ~^ (8'ha9)) : $unsigned($unsigned($unsigned((wire2 >= wire6)))));
              reg17 <= $unsigned({$signed(((reg16 ^~ reg17) + wire1))});
              reg18 <= $unsigned(wire1);
            end
        end
    end
  always
    @(posedge clk) begin
      reg19 <= wire5[(3'h4):(2'h3)];
      if ($unsigned($signed(((reg16 ? reg15 : reg16[(3'h5):(2'h3)]) ?
          $unsigned((reg10 ? reg18 : reg7)) : ((+reg16) * {reg11, wire6})))))
        begin
          reg20 <= ((((~|$unsigned(reg7)) && (8'ha4)) - ($unsigned((reg13 ?
                  wire6 : reg8)) & wire9[(2'h3):(1'h1)])) ?
              {$unsigned(($unsigned(reg18) >>> $unsigned(reg8)))} : reg7[(3'h7):(1'h1)]);
          reg21 <= (+wire6[(1'h1):(1'h0)]);
          if ((reg12 >> $unsigned(wire3[(1'h0):(1'h0)])))
            begin
              reg22 <= ((|$unsigned(($signed(reg13) != wire5[(3'h4):(2'h2)]))) && $unsigned($signed(wire1[(4'h8):(2'h2)])));
            end
          else
            begin
              reg22 <= ($unsigned(reg14) > (8'ha4));
              reg23 <= reg10;
              reg24 <= reg15[(2'h2):(1'h0)];
            end
          reg25 <= wire1[(3'h7):(3'h4)];
          if ($signed(($signed($signed($signed(reg8))) ?
              $signed(reg17[(2'h3):(1'h0)]) : $signed({{wire9}, reg23}))))
            begin
              reg26 <= ($unsigned($unsigned($signed((reg10 - reg10)))) << {reg16[(4'ha):(2'h3)],
                  (&(wire6 != $unsigned((8'ha9))))});
            end
          else
            begin
              reg26 <= {wire3, (&wire2[(4'ha):(1'h1)])};
              reg27 <= (~&wire3);
              reg28 <= $signed((8'h9d));
              reg29 <= (^~{{$signed((~&reg26))},
                  $signed(($signed(reg15) - (wire2 - reg15)))});
            end
        end
      else
        begin
          reg20 <= ($unsigned({$signed($unsigned(wire4))}) ?
              $unsigned($unsigned(($unsigned(reg13) ?
                  $signed(wire5) : (reg18 - reg19)))) : $unsigned((wire1 | ((wire2 || wire6) ?
                  $signed(wire2) : (wire0 - reg17)))));
          reg21 <= wire6[(3'h5):(2'h3)];
          reg22 <= (^(8'h9e));
          reg23 <= (((^$signed($signed(reg19))) <= reg28[(4'he):(2'h3)]) && $unsigned(reg7));
        end
    end
  assign wire30 = ((+(reg11 ?
                          (!wire9[(4'h8):(3'h6)]) : {(+reg15),
                              $signed(reg26)})) ?
                      wire1[(3'h7):(3'h6)] : $signed(((|(wire2 ^ reg14)) - $signed(wire9))));
  assign wire31 = $unsigned($signed((~&((reg18 ? reg8 : (8'h9f)) ?
                      $signed(wire9) : $unsigned(reg19)))));
  assign wire32 = {$signed(reg20), (~|$unsigned((^~(wire6 ? reg21 : reg13))))};
  assign wire33 = $signed(reg18[(5'h11):(5'h11)]);
  assign wire34 = $signed((-reg17[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg35 <= $unsigned($signed(($signed((|reg11)) | (reg26[(4'ha):(3'h7)] ?
          (+reg21) : wire6))));
      if ((8'hb8))
        begin
          reg36 <= (^(-wire34));
          reg37 <= ((reg8 ?
                  ((8'had) | wire2) : ($unsigned(((8'h9d) >= reg11)) >= $signed((~|wire2)))) ?
              (~^(wire30[(4'h9):(3'h6)] > $signed((&wire9)))) : $signed(wire5[(1'h0):(1'h0)]));
          reg38 <= {($signed($signed($signed(reg27))) ?
                  $signed(wire2) : (reg23 ?
                      ($unsigned(reg15) ?
                          wire5 : $signed(reg13)) : $unsigned((wire30 ?
                          (8'hb9) : reg28))))};
          reg39 <= reg26;
        end
      else
        begin
          reg36 <= $signed($signed((~|$signed((~reg38)))));
        end
      reg40 <= $unsigned(($unsigned((^(wire1 ? wire0 : wire34))) ?
          (~&wire33) : ((~&(~^wire1)) <<< $unsigned((~|reg36)))));
    end
endmodule
