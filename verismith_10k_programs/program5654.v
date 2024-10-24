module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {wire1, ((wire2 >>> (&wire4[(2'h2):(1'h0)])) << wire3)};
  assign wire6 = (({{wire0[(3'h5):(1'h1)]},
                     $unsigned((wire1 == wire0))} <= {({wire4} ?
                         wire3[(3'h4):(2'h3)] : $signed(wire5)),
                     wire3[(1'h1):(1'h1)]}) || (&$signed((-{wire5}))));
  assign wire7 = wire0[(3'h5):(2'h3)];
  assign wire8 = wire0;
  assign wire9 = ($signed($signed(wire4)) ~^ $unsigned(((wire3[(1'h1):(1'h0)] ?
                     (!wire0) : wire7[(5'h13):(4'hc)]) >> wire4)));
  assign wire10 = {wire7};
  always
    @(posedge clk) begin
      reg11 <= (wire8 ?
          (({{wire10}, wire1[(4'ha):(2'h2)]} >> wire6) ?
              $signed((wire9[(5'h11):(4'h9)] <= {(8'hbf)})) : (wire10 ?
                  ((^~wire6) || $unsigned(wire8)) : $unsigned((wire2 ?
                      wire5 : wire8)))) : (({(wire1 ? wire2 : wire0)} ?
                  wire0[(1'h1):(1'h1)] : $signed($unsigned(wire0))) ?
              $signed(($unsigned((7'h43)) ?
                  (~wire4) : ((8'hbd) ?
                      wire9 : wire3))) : $signed($unsigned(wire9[(4'hd):(3'h4)]))));
      if (wire0[(4'he):(3'h6)])
        begin
          reg12 <= wire7;
          reg13 <= {(wire4 ?
                  wire7 : ($unsigned($signed(reg11)) + ($unsigned(wire3) ?
                      $signed(wire9) : wire4))),
              {reg12}};
          if (($signed(((7'h44) << $signed(wire0[(1'h0):(1'h0)]))) & wire1[(3'h4):(3'h4)]))
            begin
              reg14 <= $signed((8'hbd));
              reg15 <= wire4[(3'h6):(3'h4)];
              reg16 <= wire1;
              reg17 <= $unsigned(($signed($unsigned(wire3)) == $unsigned(($unsigned(reg12) ?
                  wire1 : $unsigned(wire4)))));
            end
          else
            begin
              reg14 <= ($unsigned($signed((wire7[(5'h15):(2'h2)] ?
                      (wire1 | wire6) : (~wire0)))) ?
                  (~|wire0) : ($signed(wire4[(4'h9):(1'h1)]) || reg12));
              reg15 <= ({(|(~&(^reg12)))} ?
                  wire7[(4'ha):(3'h7)] : $unsigned({($signed((7'h44)) ?
                          $signed(wire8) : (wire2 ? reg13 : wire5)),
                      $unsigned($unsigned(wire9))}));
              reg16 <= wire9;
              reg17 <= $signed(wire2[(4'hf):(1'h1)]);
            end
          reg18 <= $signed(reg12);
          reg19 <= (8'h9d);
        end
      else
        begin
          reg12 <= $unsigned($unsigned(($signed((&reg12)) + (8'hb2))));
          reg13 <= $signed(reg11);
        end
      reg20 <= reg13;
      reg21 <= wire3;
      reg22 <= {$unsigned($signed(reg11[(1'h0):(1'h0)])),
          $unsigned($unsigned(wire8))};
    end
  always
    @(posedge clk) begin
      reg23 <= wire9;
      if (wire10)
        begin
          reg24 <= $signed(reg17[(3'h4):(1'h0)]);
        end
      else
        begin
          reg24 <= $signed(($unsigned(wire2) ?
              $unsigned($signed(((8'hb7) - (8'ha6)))) : (~reg15)));
          reg25 <= $unsigned($unsigned(wire3[(1'h0):(1'h0)]));
          reg26 <= wire2;
          reg27 <= reg15;
        end
      if ((reg17[(3'h5):(3'h4)] < (|((8'ha2) <<< reg25[(1'h1):(1'h0)]))))
        begin
          reg28 <= $signed({{reg27[(3'h5):(3'h4)], reg17}});
          reg29 <= $signed((({wire8[(4'ha):(2'h3)]} ?
              $signed($signed(wire9)) : ((reg17 ?
                  (8'hbd) : reg19) | wire6)) > (-$signed((wire8 ?
              (8'hb5) : (8'hbf))))));
        end
      else
        begin
          reg28 <= reg15[(3'h6):(3'h6)];
          reg29 <= $unsigned($unsigned($signed(wire7)));
          reg30 <= ($signed($signed((8'hbe))) < wire1);
          if ($signed((({wire2} & ((wire9 >= (8'hb0)) ? (~|reg17) : (+wire9))) ?
              ({reg15, $unsigned(wire4)} ?
                  reg16 : ((reg14 < (8'hb5)) + (wire9 ?
                      (7'h41) : reg29))) : wire5)))
            begin
              reg31 <= (~&$unsigned((8'hbb)));
            end
          else
            begin
              reg31 <= $unsigned(reg27);
              reg32 <= (!((reg26 | ((reg13 ? (8'ha8) : wire4) && wire4)) ?
                  (($signed(wire10) & wire6[(4'hf):(2'h2)]) | reg18) : $signed((8'ha8))));
              reg33 <= {(reg17[(2'h2):(1'h0)] ~^ $unsigned({(~reg15),
                      wire4[(4'hc):(4'ha)]})),
                  reg23[(3'h7):(3'h4)]};
            end
          reg34 <= $unsigned((~$signed(((wire8 ? wire7 : reg14) || {wire6,
              (8'ha8)}))));
        end
      reg35 <= reg23;
      if ((+$signed((($unsigned(reg12) <<< (^reg23)) && (|(wire5 ?
          reg22 : reg15))))))
        begin
          reg36 <= reg19;
          reg37 <= (|$unsigned((-wire5)));
          if ((~&$unsigned(wire6)))
            begin
              reg38 <= ($signed({((^~reg35) | wire2), (8'ha8)}) ?
                  (&(!reg23[(1'h0):(1'h0)])) : $signed((8'hb8)));
              reg39 <= $signed((($signed((reg29 - reg28)) & ((reg26 ?
                      (7'h42) : reg22) ?
                  (wire4 ? reg14 : reg19) : $signed(wire6))) + wire7));
              reg40 <= ({(+(((8'hab) * reg34) ?
                      ((8'haf) ? reg35 : reg29) : $unsigned(reg31))),
                  $unsigned($signed((wire9 ? reg33 : reg24)))} - {reg39});
              reg41 <= reg35;
              reg42 <= (8'ha5);
            end
          else
            begin
              reg38 <= (~&(~&reg40));
              reg39 <= (+reg23[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          if ($unsigned((8'hbf)))
            begin
              reg36 <= $unsigned($unsigned($unsigned((wire6[(3'h7):(3'h6)] ?
                  wire8 : reg27[(3'h5):(2'h2)]))));
              reg37 <= (-($unsigned(wire4) ?
                  (~|((wire8 != reg22) ?
                      (reg38 <<< reg20) : (wire2 && reg27))) : wire1));
            end
          else
            begin
              reg36 <= reg17;
              reg37 <= ($signed(reg28[(2'h3):(1'h1)]) ?
                  reg38[(1'h1):(1'h1)] : wire1[(3'h5):(3'h4)]);
              reg38 <= reg15;
              reg39 <= $signed((reg13[(1'h0):(1'h0)] ?
                  reg15[(3'h5):(1'h0)] : reg32));
            end
          if ($unsigned({wire6[(3'h6):(3'h6)], {reg17}}))
            begin
              reg40 <= $signed((8'hbe));
            end
          else
            begin
              reg40 <= reg27;
            end
        end
    end
endmodule
