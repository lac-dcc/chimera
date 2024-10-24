module top
#(parameter param32 = (8'hbf))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  assign y = {wire31,
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
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire3[(4'ha):(4'h8)];
  assign wire6 = $signed((~$unsigned((~&$unsigned(wire3)))));
  assign wire7 = $unsigned(wire0);
  assign wire8 = ($unsigned(wire2) <= $signed($signed((+(wire5 != (8'ha7))))));
  assign wire9 = (((~&$unsigned((~wire7))) >>> (~&(!$signed((8'hbb))))) ~^ wire4[(2'h2):(1'h0)]);
  assign wire10 = wire1[(5'h10):(3'h6)];
  assign wire11 = $unsigned({wire10[(3'h4):(3'h4)]});
  assign wire12 = $unsigned(wire8);
  assign wire13 = {(($unsigned(wire5[(3'h4):(1'h1)]) ?
                          wire10[(1'h1):(1'h1)] : (wire6[(4'hc):(4'h9)] ?
                              wire9 : wire12)) > wire10),
                      (wire10[(4'h9):(3'h5)] ?
                          $unsigned(wire2[(3'h7):(1'h0)]) : ($signed($signed(wire0)) <<< ($signed((8'hbb)) ^ {wire1,
                              (8'haf)})))};
  assign wire14 = wire12;
  assign wire15 = (~($signed($signed({wire11})) ?
                      (~&{(~|wire6)}) : wire13[(2'h3):(2'h2)]));
  assign wire16 = $unsigned(wire4[(2'h2):(2'h2)]);
  assign wire17 = $signed(($unsigned({$unsigned(wire5), wire1[(1'h1):(1'h0)]}) ?
                      $signed($unsigned((wire0 ?
                          wire8 : wire9))) : $unsigned((+{wire4}))));
  assign wire18 = (|(((^(wire5 ? wire7 : wire1)) ?
                      $unsigned($unsigned(wire4)) : $signed(wire12[(2'h2):(1'h0)])) > $unsigned({(^~wire3)})));
  always
    @(posedge clk) begin
      reg19 <= {$signed({$unsigned(wire17), wire17[(2'h3):(2'h2)]}),
          ($unsigned(($signed(wire3) ?
              $signed(wire14) : $unsigned((7'h42)))) <= (((&wire0) <= {wire6}) >>> wire13))};
      if ((((~&wire0[(1'h1):(1'h0)]) ?
              $signed((&reg19[(3'h5):(2'h3)])) : ((^~{wire6, (8'hba)}) ?
                  (&wire4[(4'ha):(4'h8)]) : $unsigned($unsigned(reg19)))) ?
          wire8 : $signed((~^($unsigned(wire18) != {wire11, wire13})))))
        begin
          if (wire4[(4'ha):(4'h9)])
            begin
              reg20 <= wire1;
              reg21 <= $signed(((($unsigned(wire7) == (wire14 ?
                      wire12 : wire12)) ?
                  (wire16 == $unsigned(wire2)) : ((~wire10) ?
                      (wire6 ?
                          wire8 : wire11) : wire13[(2'h2):(2'h2)])) >= wire0[(1'h1):(1'h1)]));
              reg22 <= (((~^($unsigned(wire10) | (&wire14))) + wire9[(3'h7):(3'h6)]) ?
                  (8'hb7) : $unsigned($signed(reg19)));
              reg23 <= wire12;
            end
          else
            begin
              reg20 <= (((8'hab) >= (|{$unsigned(wire6)})) & {$signed($unsigned($unsigned(wire8)))});
              reg21 <= (($unsigned(((^~wire11) ?
                      wire12[(4'ha):(2'h2)] : $signed(wire1))) == reg23[(2'h2):(1'h0)]) ?
                  {wire2,
                      (!((wire7 ?
                          wire13 : wire12) ~^ (wire5 || (8'ha9))))} : ($unsigned(wire1[(4'hc):(3'h4)]) ?
                      wire11[(1'h0):(1'h0)] : (|(((8'ha4) ? wire1 : wire2) ?
                          $unsigned(reg20) : (wire3 ? (8'h9c) : wire2)))));
              reg22 <= ((reg22[(4'ha):(1'h1)] ?
                  $unsigned($signed((reg22 ^ wire1))) : (wire6 ?
                      $signed(reg19) : (~(reg22 ?
                          wire14 : wire9)))) ^ wire2[(3'h6):(1'h1)]);
            end
          if ((~&(+{((wire4 ^~ wire7) ? wire5[(4'h9):(2'h3)] : wire14),
              $unsigned((reg23 == wire5))})))
            begin
              reg24 <= $unsigned(reg23[(3'h5):(3'h4)]);
              reg25 <= $signed((+reg20[(2'h2):(2'h2)]));
              reg26 <= {$unsigned((8'hb2)),
                  (($signed(reg19) >= $signed(wire5)) ^~ ($unsigned(wire1) ^~ $signed(reg22[(4'hc):(2'h3)])))};
              reg27 <= wire2[(1'h0):(1'h0)];
            end
          else
            begin
              reg24 <= $unsigned($signed((((wire0 ?
                  wire4 : wire1) && (8'hb3)) > $signed(wire15[(3'h5):(1'h0)]))));
            end
        end
      else
        begin
          if (wire3[(5'h11):(5'h11)])
            begin
              reg20 <= $unsigned((reg23 ? $unsigned((-(|reg19))) : reg26));
              reg21 <= $unsigned((($unsigned((^reg19)) ?
                  $signed(wire2[(2'h2):(1'h1)]) : $signed((~|(7'h44)))) < ($signed($signed(wire9)) ?
                  $signed((wire12 <= wire18)) : (8'h9c))));
              reg22 <= (wire12 <<< (!$unsigned((8'ha5))));
              reg23 <= $unsigned(wire16[(2'h2):(2'h2)]);
            end
          else
            begin
              reg20 <= (reg27 ?
                  $unsigned(wire9) : $unsigned((reg21[(2'h2):(1'h0)] ?
                      $unsigned($signed(wire11)) : (8'h9c))));
            end
          reg24 <= (^~(8'hb6));
          if ((wire7 ?
              ($unsigned($unsigned((wire9 <<< wire0))) ?
                  reg25[(3'h6):(1'h1)] : $unsigned(wire11[(1'h0):(1'h0)])) : ($signed($unsigned(((8'ha3) ?
                  wire12 : (8'ha9)))) > (~^(~&wire13)))))
            begin
              reg25 <= (~reg20);
              reg26 <= $unsigned($unsigned((~$unsigned((-reg21)))));
              reg27 <= $unsigned((!(wire11[(2'h2):(1'h1)] ?
                  (~^((8'ha8) * wire2)) : wire17)));
            end
          else
            begin
              reg25 <= ((((wire15[(4'h8):(3'h5)] != $unsigned(wire1)) ?
                      (reg19[(3'h4):(2'h3)] ?
                          wire18 : wire1[(1'h1):(1'h1)]) : {$signed(reg20)}) || ($signed((wire18 && wire9)) || (wire18 && $signed(wire7)))) ?
                  (8'haf) : (^~$signed(wire15[(3'h4):(2'h2)])));
              reg26 <= ((wire12[(4'hb):(4'h8)] >>> ((((8'hac) ? reg23 : reg19) ?
                          (|wire16) : (reg21 ? wire13 : reg25)) ?
                      wire1 : ($unsigned(wire4) ?
                          $unsigned(wire1) : (wire10 || wire4)))) ?
                  $signed((((wire7 << reg20) << wire7) ^ ((|(7'h41)) ?
                      (8'hab) : {(7'h43)}))) : $unsigned($unsigned(wire15)));
              reg27 <= ($unsigned($signed($unsigned((wire14 ?
                      reg22 : (8'haf))))) ?
                  $unsigned((($signed((8'haa)) ^~ wire1[(4'h9):(3'h4)]) - ($unsigned(wire16) << ((8'hbc) <= wire0)))) : ((^~(wire11 ?
                          (wire2 << wire16) : (wire1 ? wire17 : (7'h41)))) ?
                      $unsigned($unsigned(wire14)) : reg24[(2'h2):(1'h1)]));
              reg28 <= $signed((|$signed(wire3[(4'ha):(3'h4)])));
              reg29 <= wire2[(1'h0):(1'h0)];
            end
        end
      reg30 <= (reg28 < $signed($signed(((&wire11) ?
          (wire16 ? reg27 : wire10) : $signed((8'ha7))))));
    end
  assign wire31 = wire4;
endmodule
