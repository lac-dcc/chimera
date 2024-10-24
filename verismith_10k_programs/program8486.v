module top
#(parameter param31 = ({((((8'had) >= (8'hbb)) | (~&(8'hba))) == ((&(8'ha2)) ? (-(8'hb1)) : {(8'hae)}))} >>> (~&(({(8'ha8), (8'hbb)} >= ((8'ha8) ? (8'hbd) : (8'hac))) >> (~^((8'hb8) << (8'ha0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = wire3[(2'h2):(2'h2)];
  assign wire5 = wire4[(2'h2):(1'h0)];
  assign wire6 = ((-($unsigned((wire1 || wire2)) ?
                     wire0[(2'h3):(1'h0)] : ($unsigned(wire0) ?
                         {(8'ha6)} : $signed(wire3)))) > $signed(wire0));
  assign wire7 = wire3[(3'h6):(1'h0)];
  assign wire8 = ($unsigned(((~&$signed(wire5)) ?
                     $unsigned((wire2 ?
                         (8'hb5) : (8'hb8))) : wire5)) * $unsigned(wire5));
  assign wire9 = {wire5};
  always
    @(posedge clk) begin
      if (wire1)
        begin
          if ((~$unsigned(wire8)))
            begin
              reg10 <= ((($unsigned($unsigned(wire5)) ?
                      ((~&wire9) ?
                          (wire7 | wire7) : $signed((8'h9e))) : (8'ha8)) ?
                  (!$signed(wire5[(2'h2):(1'h1)])) : {wire6,
                      (wire0[(3'h7):(3'h4)] != (wire5 < (8'hbe)))}) + wire7);
              reg11 <= $signed((wire7 ?
                  wire5[(2'h2):(1'h0)] : (~{$unsigned(wire3),
                      $signed(wire7)})));
            end
          else
            begin
              reg10 <= $unsigned((wire1[(2'h2):(1'h0)] > wire5));
              reg11 <= $unsigned(wire1);
              reg12 <= (($signed((wire3 ^ (~&wire3))) < (-wire6[(4'hc):(1'h0)])) * $signed((^$unsigned({wire8,
                  wire1}))));
            end
          reg13 <= (((wire1[(3'h4):(1'h1)] ?
              $signed($unsigned((8'hb5))) : (~^{wire2,
                  (8'hb2)})) << ($unsigned(reg11[(3'h5):(1'h1)]) > {(|reg11)})) + ($unsigned($unsigned(reg11[(2'h3):(2'h3)])) ?
              (reg12[(2'h2):(1'h1)] ?
                  ((wire2 && wire8) ?
                      $signed(wire0) : wire0) : wire9[(1'h1):(1'h1)]) : $signed($unsigned($unsigned((8'hae))))));
          reg14 <= (!(({wire4[(4'hc):(4'hc)], wire1} ?
                  $signed(reg11[(2'h3):(2'h2)]) : $unsigned(wire6[(3'h4):(3'h4)])) ?
              ((wire5[(1'h1):(1'h1)] + reg12) ?
                  wire5[(2'h2):(2'h2)] : $signed(wire9[(3'h4):(1'h1)])) : $unsigned($signed((wire4 ^ wire8)))));
          reg15 <= wire9[(2'h2):(2'h2)];
        end
      else
        begin
          if (($signed(wire1) * (($signed($signed(reg11)) == ($signed(wire2) == (8'ha4))) >> wire6)))
            begin
              reg10 <= (^wire8);
              reg11 <= (!$signed(wire5[(1'h0):(1'h0)]));
            end
          else
            begin
              reg10 <= {(~^((&(8'hbf)) >> $unsigned($signed((8'hb4)))))};
              reg11 <= (|(~|{$unsigned({wire8}), wire5}));
              reg12 <= $signed(wire8[(1'h1):(1'h1)]);
              reg13 <= ($signed($unsigned((((7'h41) < wire0) ?
                      (wire6 <= (8'had)) : $signed(wire2)))) ?
                  $unsigned($unsigned($unsigned($signed(wire8)))) : $unsigned($signed($signed($signed(reg10)))));
              reg14 <= {{{wire0[(2'h2):(2'h2)]}},
                  (^(^$unsigned(wire3[(3'h5):(3'h5)])))};
            end
          reg15 <= ($signed((-$unsigned(reg10))) << wire9);
          reg16 <= $unsigned((~wire9));
          reg17 <= (((wire7 == (wire5 <= {wire3})) ?
              reg12 : ($unsigned($signed((7'h43))) ?
                  $signed(reg11) : $signed((wire9 || reg16)))) >= wire6[(3'h5):(2'h2)]);
          reg18 <= {reg10[(3'h4):(1'h0)],
              $unsigned($unsigned(reg13[(3'h5):(3'h5)]))};
        end
      reg19 <= reg18[(4'he):(4'h8)];
      if ((reg12[(1'h0):(1'h0)] ?
          $unsigned($signed((~^{reg11}))) : $unsigned(($unsigned(wire4) - ((wire4 ^~ reg14) && wire6)))))
        begin
          reg20 <= {wire6[(1'h0):(1'h0)], $unsigned((8'ha9))};
          reg21 <= (~|$signed($unsigned(((reg17 ?
              wire3 : wire0) <<< wire8[(3'h4):(2'h3)]))));
          reg22 <= reg17[(2'h2):(1'h1)];
          if (($unsigned(wire7[(4'hb):(1'h1)]) ?
              reg21 : ({wire9[(2'h3):(2'h3)]} ?
                  (((wire7 > (8'ha3)) ?
                      $unsigned(wire6) : (8'hb8)) >= reg14[(3'h7):(1'h1)]) : $signed($unsigned(reg12)))))
            begin
              reg23 <= ($unsigned($signed((((8'ha1) ? reg12 : wire6) ?
                      (8'h9e) : wire9[(1'h0):(1'h0)]))) ?
                  $signed(reg22[(1'h1):(1'h1)]) : $signed(((~^wire7) > ($signed(reg17) << reg10))));
              reg24 <= $unsigned((((^(reg11 ?
                  reg12 : wire7)) || ($signed(reg13) ?
                  ((8'hae) ? reg22 : reg12) : (reg23 ?
                      (8'hb8) : reg22))) || (reg16 ?
                  {$signed(reg10), reg13} : {$signed(reg18), (&reg10)})));
              reg25 <= (&(7'h41));
            end
          else
            begin
              reg23 <= $signed(reg21[(1'h1):(1'h0)]);
              reg24 <= (!$signed(reg13[(4'ha):(3'h6)]));
              reg25 <= $signed($unsigned(reg24));
              reg26 <= (8'h9c);
              reg27 <= (~(7'h40));
            end
        end
      else
        begin
          reg20 <= reg20;
          reg21 <= (~|$unsigned(((~&$signed(wire8)) != reg14)));
          reg22 <= (((reg14[(4'he):(2'h3)] >> ($unsigned(reg11) > $unsigned(reg19))) ?
              ((reg10[(3'h4):(3'h4)] | (-reg10)) - $signed({wire0})) : $unsigned(((~reg13) <<< (8'ha4)))) ^~ $unsigned(((^~$unsigned(reg24)) ?
              wire7 : (((8'hb3) >= reg11) ? (wire8 ? reg21 : wire5) : reg18))));
        end
      reg28 <= $unsigned($signed((~^reg10)));
    end
  assign wire29 = $unsigned($unsigned($unsigned($signed((reg13 || (8'ha3))))));
  assign wire30 = reg23[(4'h8):(3'h5)];
endmodule
