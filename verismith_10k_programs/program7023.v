module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire11,
                 wire8,
                 wire5,
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
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned((($unsigned($signed(wire1)) ?
                     ((wire2 ? wire0 : wire3) ?
                         wire0[(1'h0):(1'h0)] : wire0[(1'h1):(1'h0)]) : ((wire4 ?
                             wire1 : wire0) ?
                         (wire4 ~^ wire4) : (wire4 ^~ wire1))) >>> ((+wire2) >> wire4)));
  always
    @(posedge clk) begin
      reg6 <= wire1;
      reg7 <= wire1;
    end
  assign wire8 = ({{(|wire3[(5'h11):(1'h1)])}} <<< wire3);
  always
    @(posedge clk) begin
      reg9 <= (^~($signed($unsigned(reg7[(1'h1):(1'h1)])) ?
          ({(wire4 ? wire1 : wire2), $signed(wire0)} ?
              wire3[(5'h14):(5'h13)] : wire5[(2'h3):(1'h1)]) : (~((wire2 ?
              wire3 : wire1) ~^ (wire1 ? reg6 : wire0)))));
      reg10 <= (~&reg7);
    end
  assign wire11 = $unsigned((($signed(reg10[(5'h10):(1'h0)]) ?
                      {wire3} : $unsigned((wire4 < (8'ha8)))) || reg10[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if (reg10)
        begin
          reg12 <= (wire4 ?
              $unsigned(wire2[(3'h7):(3'h4)]) : (wire2 <= ($unsigned({wire4,
                      reg10}) ?
                  wire5[(3'h4):(3'h4)] : $signed({reg6}))));
        end
      else
        begin
          reg12 <= ($signed($signed(wire11)) ?
              ({($unsigned(wire2) ?
                      ((7'h40) ?
                          wire4 : reg7) : reg9[(5'h11):(4'hf)])} >>> $unsigned((!reg12))) : wire2[(4'hc):(4'hb)]);
          reg13 <= reg10;
          if ($unsigned(wire8))
            begin
              reg14 <= (!reg6[(3'h6):(2'h3)]);
              reg15 <= {($signed((~^(reg6 ? reg12 : wire2))) >>> reg14)};
              reg16 <= wire11[(2'h3):(2'h3)];
              reg17 <= $unsigned((~({$signed(reg6)} ?
                  ((reg13 ? reg13 : wire3) ?
                      reg15 : reg12) : $unsigned($signed(reg16)))));
            end
          else
            begin
              reg14 <= $signed($signed(reg14[(1'h0):(1'h0)]));
              reg15 <= reg15;
              reg16 <= reg16;
              reg17 <= (~(reg7[(1'h0):(1'h0)] <<< (($signed((8'haa)) >= {reg15,
                  reg9}) ^ ((reg9 || wire5) ? $unsigned(reg15) : {reg14}))));
              reg18 <= ((~&wire4) ?
                  $signed($unsigned((wire1[(3'h7):(3'h5)] > (reg15 ?
                      reg6 : reg15)))) : wire11[(2'h3):(2'h3)]);
            end
        end
      reg19 <= (reg14 << reg12);
      if ((wire1[(2'h2):(1'h1)] ?
          {$unsigned(reg13), wire11} : reg12[(3'h7):(3'h6)]))
        begin
          reg20 <= reg10[(5'h13):(3'h4)];
          reg21 <= reg15;
        end
      else
        begin
          reg20 <= ((^~((wire5[(1'h1):(1'h0)] > reg12) ?
                  ((reg6 ? reg12 : (8'h9f)) >>> (reg16 & wire0)) : (-{(8'hae),
                      reg9}))) ?
              (^~{wire1, $signed((reg12 + wire8))}) : wire0);
          reg21 <= wire2;
        end
    end
  assign wire22 = $signed(($signed(wire11[(1'h0):(1'h0)]) ?
                      (~reg7[(1'h0):(1'h0)]) : $unsigned(((~^reg9) ?
                          $signed(wire0) : (reg18 ? wire5 : reg19)))));
  assign wire23 = $unsigned((reg10 ?
                      $unsigned($signed($unsigned(reg9))) : $unsigned(((~|reg17) >> $signed((8'hb8))))));
  assign wire24 = $unsigned((^((~&$signed(reg19)) ? (~{reg20}) : reg10)));
  assign wire25 = $signed($unsigned((&(8'hb5))));
  assign wire26 = reg20[(3'h4):(1'h1)];
  assign wire27 = $unsigned((~^(~&$unsigned((reg19 * reg18)))));
  assign wire28 = $unsigned(reg10);
  assign wire29 = $unsigned(wire24);
  assign wire30 = ($unsigned($signed(reg7[(3'h6):(3'h4)])) ?
                      (({{wire3}, $signed(wire28)} ?
                          reg12[(2'h2):(2'h2)] : $unsigned({reg13,
                              wire4})) + $unsigned(($unsigned(wire24) ?
                          $signed(reg15) : (reg10 ?
                              wire29 : reg20)))) : {(wire24[(4'hd):(4'h8)] << ((reg19 > (7'h40)) ?
                              reg13[(2'h3):(1'h0)] : wire4[(1'h0):(1'h0)]))});
  assign wire31 = (((wire4[(2'h3):(2'h3)] ^~ $unsigned((wire4 <<< reg19))) && $signed(reg16[(1'h0):(1'h0)])) || {(&$signed(wire3[(2'h3):(2'h2)])),
                      reg17[(1'h0):(1'h0)]});
  assign wire32 = (8'h9f);
endmodule
