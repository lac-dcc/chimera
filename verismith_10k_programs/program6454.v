module top
#(parameter param51 = (((&{((8'ha0) ? (8'hb2) : (8'hb1)), ((8'ha1) ? (8'ha1) : (8'ha8))}) ? (((^~(8'haa)) << {(7'h44), (8'hb0)}) ? (((8'h9c) ? (8'hbe) : (7'h40)) ^ (~^(8'hb3))) : {(^(8'h9d)), (&(8'hac))}) : (^(((8'had) ? (8'hb5) : (8'hb3)) + ((8'hb4) ? (8'ha5) : (8'hb6))))) == (~|{(~^((8'ha6) ? (8'ha9) : (8'ha4))), (((8'hbb) >> (8'hb1)) | {(8'hb9), (8'hb2)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  assign y = {wire50,
                 wire48,
                 wire21,
                 wire20,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = $unsigned(($signed(((~wire1) ?
                     $signed(wire1) : (wire2 && (8'hba)))) <<< wire3[(5'h11):(4'hf)]));
  assign wire6 = (8'h9e);
  assign wire7 = (~|(((wire2[(4'h9):(3'h5)] ?
                         $unsigned((8'ha0)) : ((8'hb1) & wire6)) >> (^$signed(wire1))) ?
                     (~&wire0[(1'h1):(1'h0)]) : wire1[(4'h9):(1'h1)]));
  assign wire8 = (^wire1);
  assign wire9 = (8'ha1);
  assign wire10 = wire7;
  assign wire11 = $unsigned(wire6[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg12 <= (7'h42);
      reg13 <= $unsigned((reg12 ?
          $unsigned($signed($signed(wire8))) : (((&(8'hbf)) ?
              {wire1, (8'hbf)} : (wire0 > wire9)) == wire4)));
      if ((((|(wire6[(3'h7):(2'h3)] ?
          (wire5 || reg12) : (wire3 <= wire3))) <<< (~|(^wire4[(2'h2):(1'h1)]))) != wire2[(1'h1):(1'h1)]))
        begin
          reg14 <= wire5;
          reg15 <= ($unsigned(wire0[(3'h6):(1'h1)]) ~^ wire3[(1'h0):(1'h0)]);
          if ($signed(($signed((~&$signed((8'haa)))) ^~ wire3)))
            begin
              reg16 <= ((~|(~^((~(8'ha5)) >= (wire7 << reg13)))) ?
                  $unsigned($unsigned(((&wire7) ?
                      (wire9 ?
                          wire10 : wire11) : {wire7}))) : (wire4[(1'h1):(1'h1)] ?
                      (wire3[(4'hb):(4'h9)] * (wire6[(3'h6):(1'h1)] ?
                          (wire0 ?
                              (8'hb6) : wire6) : $unsigned(reg13))) : (|(^wire2[(1'h0):(1'h0)]))));
              reg17 <= (-{(($signed(wire4) || (wire10 < reg16)) ?
                      ((~&(8'ha7)) ?
                          {(8'hbb),
                              (8'hac)} : $signed((8'hb6))) : ($unsigned(reg13) ?
                          (wire11 ? reg14 : wire3) : (wire2 ? wire5 : wire10))),
                  $unsigned((wire9[(1'h1):(1'h1)] ?
                      $unsigned(wire7) : $signed(wire8)))});
              reg18 <= wire7;
            end
          else
            begin
              reg16 <= (((~(wire2 ?
                      ((8'h9e) < (8'hba)) : $unsigned(reg12))) << ((wire7 >= (~&reg14)) ?
                      (8'hbd) : $unsigned((+reg17)))) ?
                  wire10 : $signed((^~($signed((8'h9e)) ?
                      (wire11 >= reg14) : (wire6 == wire0)))));
              reg17 <= ($signed(wire3) ?
                  (^~wire11[(2'h2):(1'h1)]) : $unsigned(wire1[(4'h9):(4'h8)]));
              reg18 <= (({(~^(8'hba)),
                  (reg15 ?
                      (reg18 ? (8'ha3) : wire1) : ((7'h41) ?
                          wire9 : reg18))} < $signed(((~(8'ha8)) ?
                  (~&wire5) : (^wire10)))) <= ((((wire1 == wire7) ?
                      (reg14 & (8'ha5)) : reg16[(1'h0):(1'h0)]) <<< $signed(wire9[(4'hd):(1'h1)])) ?
                  {(wire6 >= wire0),
                      (8'hab)} : ((!wire1) != $unsigned(reg16[(2'h2):(1'h1)]))));
              reg19 <= (~$unsigned(wire4[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg14 <= $unsigned(wire2);
          reg15 <= wire5;
          reg16 <= $unsigned($signed(({wire4} <<< (wire1 ?
              (reg15 ? reg17 : wire5) : reg12[(2'h2):(2'h2)]))));
        end
    end
  assign wire20 = $unsigned(wire6);
  assign wire21 = $unsigned(wire9[(3'h5):(1'h1)]);
  module22 #() modinst49 (wire48, clk, wire21, wire6, wire2, wire20);
  assign wire50 = reg16[(2'h2):(1'h1)];
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire27;
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire27,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire27 = $signed(wire25);
  always
    @(posedge clk) begin
      if ({(|(((~wire24) ? (!(8'ha2)) : wire25[(1'h1):(1'h0)]) <= ((wire27 ?
              wire27 : wire27) & wire26[(3'h7):(2'h2)])))})
        begin
          reg28 <= (wire26 <<< $signed(wire26[(3'h5):(2'h2)]));
          reg29 <= (~|$signed((wire27[(4'h9):(3'h4)] ?
              wire26 : $unsigned(wire26[(2'h3):(1'h1)]))));
        end
      else
        begin
          if (wire25)
            begin
              reg28 <= (wire27[(1'h1):(1'h1)] >= $unsigned($unsigned((&$unsigned(reg28)))));
              reg29 <= $signed((wire26 != {(^wire25)}));
              reg30 <= $signed(reg28[(5'h12):(3'h7)]);
              reg31 <= reg30;
            end
          else
            begin
              reg28 <= $unsigned((8'hbe));
              reg29 <= reg30;
              reg30 <= $signed((-$unsigned((8'hbf))));
            end
          reg32 <= $signed((^(&(+(wire23 > (8'ha8))))));
          if ((-wire25))
            begin
              reg33 <= (~^{$unsigned($unsigned(((8'ha8) ? wire26 : wire25)))});
            end
          else
            begin
              reg33 <= $signed(wire26[(3'h5):(3'h4)]);
            end
          reg34 <= (wire23[(4'he):(1'h0)] ?
              $signed($signed(((reg32 ?
                  reg31 : wire27) | $unsigned((8'hab))))) : $unsigned($signed({$signed(reg30),
                  (!reg30)})));
        end
      reg35 <= wire24;
      if (({reg33} != {(~&$unsigned({wire24, wire23})),
          (~&(((8'hac) & reg33) ? reg34[(2'h3):(1'h0)] : (-reg29)))}))
        begin
          if (wire23)
            begin
              reg36 <= $unsigned({((8'hb5) ^~ ({wire25,
                      reg31} ~^ $signed(reg29))),
                  (^~wire24)});
            end
          else
            begin
              reg36 <= $unsigned($unsigned(reg30[(4'ha):(3'h5)]));
            end
          reg37 <= reg30;
        end
      else
        begin
          if ((($unsigned(wire24) | wire27) && wire23[(4'ha):(3'h4)]))
            begin
              reg36 <= reg32;
            end
          else
            begin
              reg36 <= {$unsigned(wire23)};
              reg37 <= (reg29 >>> (reg31[(4'he):(3'h5)] + $signed(reg33[(5'h13):(4'hf)])));
              reg38 <= (((reg28 | (|(~&wire26))) ?
                      $signed(((reg36 >= (8'hbf)) ?
                          $signed((8'hb3)) : (^~reg34))) : ($unsigned($signed((8'hba))) ?
                          wire25 : wire26)) ?
                  ((($unsigned(reg35) ?
                      (^~reg34) : $signed((8'hbd))) ^ $unsigned(wire26[(3'h4):(1'h1)])) & reg28) : $unsigned(reg34[(4'h8):(3'h6)]));
              reg39 <= ($unsigned((reg28[(4'hc):(4'h9)] ?
                  $signed((wire25 ?
                      reg31 : reg28)) : $unsigned($unsigned(wire23)))) >= {$signed({$signed(reg37)}),
                  reg37});
              reg40 <= (&reg30);
            end
          if ({(~&$signed(((!wire23) != reg38))),
              $signed($signed($unsigned((!reg28))))})
            begin
              reg41 <= (|$unsigned(((~|{reg37}) * reg29[(1'h1):(1'h1)])));
              reg42 <= reg40[(1'h0):(1'h0)];
            end
          else
            begin
              reg41 <= reg32;
            end
          reg43 <= (reg32[(3'h7):(2'h3)] ?
              (reg42[(4'hc):(4'ha)] ?
                  (~wire24) : ((-$signed(wire25)) <= ((~^reg40) >> $signed(reg28)))) : wire25[(3'h7):(3'h4)]);
        end
      reg44 <= reg33;
    end
  assign wire45 = ((($unsigned(reg30) ?
                          (8'hb2) : ($unsigned(reg32) ?
                              (reg35 ?
                                  (8'hac) : reg40) : $signed(wire27))) - (((8'hb8) | reg38) == reg44[(3'h4):(2'h3)])) ?
                      $signed($signed(reg35)) : wire24[(3'h5):(3'h5)]);
  assign wire46 = reg36[(1'h1):(1'h1)];
  assign wire47 = $unsigned(($signed(((wire24 <= reg43) ?
                          (+(8'ha5)) : reg42[(5'h11):(4'hb)])) ?
                      ((~|{reg36,
                          (8'hbd)}) != $unsigned($unsigned(reg38))) : $signed({((8'hab) ?
                              wire27 : reg32),
                          (reg38 >>> (8'h9e))})));
endmodule
