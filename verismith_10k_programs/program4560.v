module top
#(parameter param25 = (!({((~&(8'ha0)) < {(8'hb8)}), ({(8'hb9), (8'hb8)} && ((8'hb7) ? (7'h43) : (8'ha6)))} ^ (7'h42))), 
parameter param26 = param25)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg9,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = ($unsigned({wire1[(5'h10):(3'h5)],
                     $unsigned($unsigned(wire4))}) && {($signed({wire3}) ?
                         (-wire4[(2'h3):(1'h1)]) : (((8'hb8) ? wire3 : wire0) ?
                             (~^wire1) : $signed(wire3))),
                     (~^((+wire1) == $signed(wire4)))});
  assign wire7 = {$unsigned($unsigned((~^wire3)))};
  assign wire8 = wire1[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      if (((8'ha6) ?
          {wire3[(1'h0):(1'h0)]} : (|{wire1, $unsigned({(8'ha4), (8'hbf)})})))
        begin
          reg9 <= wire5;
          if (wire5[(2'h2):(2'h2)])
            begin
              reg10 <= (8'hbc);
              reg11 <= ($signed(((~&$unsigned(wire2)) ?
                      (^{reg9}) : {(~&wire6)})) ?
                  (({wire5[(4'h9):(4'h8)], $signed(wire4)} > wire4) ?
                      ((~&{wire2}) ?
                          (~|(&reg9)) : (^~$signed(wire4))) : $signed((wire8[(3'h6):(3'h5)] - ((8'had) ^~ reg9)))) : (~wire5));
              reg12 <= {((reg11[(2'h2):(2'h2)] ?
                          wire2[(3'h7):(1'h1)] : (8'hab)) ?
                      wire8 : (reg10 || wire8)),
                  (reg9[(3'h6):(2'h3)] ?
                      wire7[(4'h8):(2'h3)] : $unsigned(({wire5, (8'hbf)} ?
                          {wire0} : {reg10})))};
            end
          else
            begin
              reg10 <= (reg12 ?
                  reg9[(5'h12):(4'h8)] : $unsigned((reg9[(3'h7):(3'h4)] ?
                      $signed($unsigned(reg12)) : ($unsigned(wire1) ?
                          {wire6, wire3} : $unsigned((7'h42))))));
              reg11 <= reg12[(4'hf):(4'h8)];
              reg12 <= reg11[(1'h1):(1'h0)];
              reg13 <= (wire6[(4'ha):(2'h2)] ?
                  ((reg10 && $signed((7'h41))) ?
                      {(~|$unsigned(wire5)),
                          ($signed(reg11) + (wire6 ?
                              reg10 : (8'ha8)))} : wire4[(2'h3):(1'h1)]) : (+$unsigned(wire5)));
            end
        end
      else
        begin
          reg9 <= ($unsigned(wire1[(3'h4):(2'h2)]) + (wire6 ^ ((reg9[(5'h12):(5'h11)] * wire3[(2'h2):(1'h0)]) ?
              wire5[(2'h3):(2'h2)] : wire7)));
          if ((!wire8))
            begin
              reg10 <= $signed({$signed(($unsigned((8'h9c)) == (!reg10))),
                  {(~wire6[(1'h1):(1'h1)]),
                      $signed(((7'h40) ? reg10 : reg12))}});
              reg11 <= $unsigned($unsigned($signed(($signed(wire0) ?
                  (reg11 || (8'ha4)) : wire5))));
              reg12 <= {$unsigned({{$unsigned(wire5)}, reg10})};
              reg13 <= (!$unsigned(($unsigned((^(8'hab))) ?
                  $unsigned((~wire2)) : (~&(~|(8'hb5))))));
              reg14 <= $signed(wire5);
            end
          else
            begin
              reg10 <= $unsigned(({(-(reg10 ? wire2 : (8'ha0))),
                  (~^$unsigned(wire5))} * wire7[(4'hc):(2'h2)]));
              reg11 <= wire0[(3'h5):(1'h0)];
            end
        end
      if ($unsigned((8'hb4)))
        begin
          if (($signed((-((wire8 ? wire5 : wire3) || $signed(reg9)))) ?
              {$unsigned($unsigned(((8'hb1) ? wire7 : wire7)))} : wire0))
            begin
              reg15 <= ($signed($signed($signed($signed(wire8)))) ?
                  $signed((^~$unsigned(wire2))) : reg11[(4'hd):(3'h5)]);
              reg16 <= (|{wire2[(3'h4):(2'h3)], $signed((^~{(8'hb4)}))});
              reg17 <= (-(!$unsigned(reg16[(1'h0):(1'h0)])));
              reg18 <= {$signed($signed(((~|(8'hbb)) << (~wire8)))),
                  $unsigned($unsigned(wire1[(3'h6):(3'h5)]))};
              reg19 <= wire3;
            end
          else
            begin
              reg15 <= {(!((reg11 ?
                      {wire8} : (7'h41)) >= (reg16[(2'h3):(1'h1)] - (~^reg14))))};
              reg16 <= (reg19[(3'h7):(3'h4)] ?
                  (wire1 ?
                      $signed(((wire3 != wire3) ~^ ((7'h42) < reg12))) : (8'hac)) : wire3[(2'h3):(2'h2)]);
              reg17 <= $signed(wire2);
            end
          reg20 <= $signed($unsigned(wire2[(4'ha):(3'h7)]));
          reg21 <= (&((&(&(~^wire2))) ~^ ({(reg17 >> reg16)} ?
              $signed(wire2) : (~&reg17[(3'h7):(2'h3)]))));
        end
      else
        begin
          if ((^~$signed((~&{reg18, $signed(reg15)}))))
            begin
              reg15 <= ($signed((-{$signed(wire2)})) ?
                  (({reg20, $signed(reg20)} <= $unsigned($unsigned(wire1))) ?
                      $signed($unsigned({wire0,
                          (8'haa)})) : $unsigned(((^~wire0) ^~ $signed(reg13)))) : ($unsigned((wire3 ^~ (~|reg10))) ?
                      ({$unsigned((8'hb6))} ^~ (8'hac)) : $unsigned(wire7)));
              reg16 <= ({(wire4 < reg15),
                  ((+$unsigned((8'hb0))) > ((8'h9c) >>> wire6))} >>> (^reg14[(1'h1):(1'h1)]));
              reg17 <= (~&{(wire3 | (~|(~|wire1))),
                  ($signed($signed(reg11)) << {$unsigned(reg18),
                      $signed(reg18)})});
              reg18 <= reg19;
            end
          else
            begin
              reg15 <= {wire1[(4'ha):(3'h5)],
                  (($signed(((8'hb3) ? wire8 : wire6)) ^~ ($signed(wire2) ?
                      (wire5 ?
                          (7'h41) : wire2) : reg20[(3'h4):(1'h1)])) >= reg14)};
            end
          if (wire1)
            begin
              reg19 <= (~^reg20);
              reg20 <= (8'ha8);
            end
          else
            begin
              reg19 <= (reg15 ?
                  {wire7[(3'h7):(3'h7)],
                      (~&(-reg14[(1'h1):(1'h0)]))} : (^$signed(reg20[(3'h5):(1'h1)])));
              reg20 <= (&reg12);
            end
        end
      reg22 <= ($signed(reg15[(5'h12):(4'ha)]) <<< (($unsigned((+wire3)) ?
              wire8[(4'ha):(2'h3)] : (^$signed((8'h9c)))) ?
          (~$unsigned((wire7 ? reg16 : reg10))) : ($signed((^~(7'h44))) ?
              $signed($unsigned((8'ha4))) : reg9)));
      reg23 <= $unsigned($signed(reg14));
      reg24 <= {((wire8 ? {(wire0 != wire1)} : wire1[(3'h5):(3'h5)]) ?
              wire3[(1'h1):(1'h0)] : ($signed($unsigned(wire8)) ?
                  ((|wire7) & $signed(wire0)) : reg20[(3'h5):(3'h5)])),
          (~&(~^((wire3 == reg11) ? (~&reg20) : (reg14 ? reg13 : reg17))))};
    end
endmodule
