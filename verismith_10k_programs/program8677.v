module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire29,
                 wire16,
                 wire15,
                 wire13,
                 wire12,
                 wire5,
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
                 reg14,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed(wire2);
  always
    @(posedge clk) begin
      if (($unsigned($signed((~wire2[(3'h5):(1'h0)]))) != (^$signed((((8'ha8) * wire4) <= $signed(wire0))))))
        begin
          reg6 <= wire2;
          reg7 <= (!$signed($signed((wire1 << $signed((8'hbb))))));
          reg8 <= $unsigned(((|(!(wire4 ? wire5 : wire4))) ?
              wire0[(2'h3):(2'h3)] : ((&$unsigned(wire1)) ?
                  wire1[(4'ha):(1'h1)] : wire1[(4'h9):(3'h5)])));
          reg9 <= (8'haa);
          reg10 <= $unsigned($signed((reg7 - ((wire0 ? wire5 : reg7) ?
              $signed(reg9) : wire3[(3'h6):(1'h0)]))));
        end
      else
        begin
          reg6 <= (wire1[(1'h1):(1'h0)] ?
              {($signed($signed((8'hbf))) || (^~$unsigned(reg10))),
                  wire2} : $unsigned(wire3));
          reg7 <= {$unsigned((wire4 << wire0)), $signed($unsigned(wire3))};
          reg8 <= {((-reg7[(4'ha):(3'h7)]) ?
                  {(~|(~&reg8))} : (~$signed((reg7 ? wire3 : wire0))))};
          reg9 <= $unsigned(($unsigned(($signed(wire5) ?
                  reg8[(4'hc):(2'h3)] : $signed(wire4))) ?
              wire3 : (+({(8'h9c)} - $signed(reg8)))));
        end
      reg11 <= (-reg7);
    end
  assign wire12 = $signed(($unsigned(wire1[(2'h2):(1'h0)]) & (~&wire3[(3'h4):(1'h0)])));
  assign wire13 = $signed(($unsigned(((reg7 + reg11) ?
                      wire2 : (~reg9))) >= $unsigned((reg6 ? reg6 : (+reg7)))));
  always
    @(posedge clk) begin
      reg14 <= (^({{(^~reg6), wire4}, (reg9 >>> ((8'hbe) ? reg7 : wire13))} ?
          $signed($unsigned((reg11 | reg10))) : wire3[(2'h3):(2'h2)]));
    end
  assign wire15 = reg10[(4'hb):(3'h6)];
  assign wire16 = $signed(((|wire3[(2'h3):(2'h3)]) ?
                      (((&reg11) ? wire2 : (8'hb1)) ?
                          reg9[(3'h5):(2'h3)] : ((|wire1) ?
                              wire12 : (~^(8'h9e)))) : ((~(reg11 == wire5)) ?
                          (~^wire0[(4'h9):(1'h0)]) : wire0)));
  always
    @(posedge clk) begin
      if ((((-$signed($signed(reg9))) ?
              wire13[(2'h2):(1'h1)] : $unsigned(($unsigned((8'haf)) <<< $signed(wire12)))) ?
          $unsigned(reg10) : wire16[(1'h1):(1'h0)]))
        begin
          reg17 <= $unsigned($unsigned(wire15[(2'h3):(2'h2)]));
          reg18 <= $signed(((!(~(~&reg9))) ?
              reg17 : (wire3[(3'h7):(3'h6)] ?
                  $unsigned((wire5 - reg9)) : (wire3[(4'h8):(4'h8)] * (!wire15)))));
          reg19 <= $signed((-$signed(($signed(wire1) ?
              reg7[(4'h9):(2'h2)] : wire13[(2'h2):(1'h1)]))));
          if ({wire3[(4'h9):(3'h5)], wire3[(3'h5):(3'h4)]})
            begin
              reg20 <= wire4;
              reg21 <= {(reg11 < (|$signed(wire0)))};
            end
          else
            begin
              reg20 <= reg9[(3'h5):(1'h0)];
            end
          reg22 <= (!wire13);
        end
      else
        begin
          reg17 <= ((($signed($unsigned((8'hbf))) == (wire15 == (reg8 ^~ reg8))) ?
              (~&($signed(wire15) && (-reg7))) : reg17) <<< {wire0});
          reg18 <= ((({$signed(reg9)} <= $signed(reg8)) ?
              $unsigned(((reg22 ? reg10 : wire13) ?
                  $unsigned(reg18) : reg18[(4'he):(4'he)])) : {$unsigned($unsigned(wire5)),
                  $unsigned((~&wire1))}) <<< reg19);
          if (wire16[(1'h1):(1'h1)])
            begin
              reg19 <= ((wire4[(2'h3):(1'h1)] && $signed({$signed(wire16),
                  {reg22}})) > (((reg7[(4'hb):(4'h9)] ?
                      (reg18 ?
                          wire1 : reg14) : {reg20}) >= (~|reg17[(3'h5):(1'h1)])) ?
                  ($unsigned((reg22 >= reg20)) ?
                      ((^~wire1) > $unsigned(reg7)) : (~|wire16[(2'h3):(2'h2)])) : {wire4[(3'h4):(2'h3)],
                      reg8}));
              reg20 <= (~&($unsigned(wire3) != reg8));
              reg21 <= ((wire4[(2'h3):(2'h3)] ?
                  ((((8'ha4) ? wire16 : wire12) ?
                          $unsigned(wire15) : $signed(wire16)) ?
                      $unsigned((~&wire12)) : $signed($signed(reg21))) : wire13) <= (wire3[(4'h9):(1'h0)] && reg20));
              reg22 <= wire2[(3'h7):(3'h5)];
              reg23 <= ($unsigned((~|$unsigned((wire5 ? reg18 : reg6)))) ?
                  ($signed($signed($signed(wire13))) ?
                      (reg18[(4'hf):(4'hb)] * ((wire13 ?
                          reg20 : reg6) >>> ((8'ha5) ?
                          wire2 : (8'hab)))) : ((reg10[(5'h11):(5'h11)] ?
                          (+reg8) : $unsigned((8'hba))) < $signed($unsigned(wire1)))) : $signed(wire15));
            end
          else
            begin
              reg19 <= {({wire13[(2'h2):(1'h1)],
                          (~|((8'hb3) ? reg20 : wire3))} ?
                      (&{(reg23 ?
                              reg9 : wire16)}) : $signed($unsigned((-reg8))))};
              reg20 <= wire3;
            end
          reg24 <= ({$unsigned($unsigned(wire12)),
              ({(^~reg17)} ? reg22 : wire12)} ^ ((wire0 ?
                  wire16 : $signed($unsigned(wire4))) ?
              reg22[(4'h9):(4'h8)] : reg23));
        end
      if (((~^(^~(8'h9c))) >= $signed(((~|(reg9 ? reg9 : reg20)) ?
          $signed(reg18) : reg20))))
        begin
          reg25 <= (~^$unsigned({((reg6 ? reg11 : wire16) >> {wire13}),
              ((reg23 ? (8'hb4) : wire1) << {(8'hb3), wire3})}));
          reg26 <= ((8'ha7) == $signed(wire2[(3'h6):(3'h5)]));
        end
      else
        begin
          reg25 <= $unsigned(reg18);
          reg26 <= (^~(~|($unsigned($signed(reg11)) == (~|$signed((8'hb1))))));
          reg27 <= ($unsigned($signed(((wire4 | wire0) < $unsigned((7'h41))))) ?
              wire1[(1'h1):(1'h0)] : (7'h44));
          reg28 <= {$unsigned((7'h44)),
              ((((^~reg20) ? (wire12 > reg20) : reg27) ?
                      reg9 : ($unsigned((8'had)) | (reg19 == reg19))) ?
                  (~&((reg27 | reg21) ?
                      wire3[(1'h1):(1'h0)] : (^reg17))) : $signed($signed($signed(reg19))))};
        end
    end
  assign wire29 = $signed($unsigned({$signed(wire0), $signed((^~reg10))}));
endmodule
