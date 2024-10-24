module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
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
                 reg7,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = $signed(wire1[(4'ha):(4'h9)]);
  always
    @(posedge clk) begin
      reg7 <= ((!((wire6[(4'h9):(2'h2)] <= (7'h41)) | ($signed(wire4) != wire4))) << wire4);
    end
  assign wire8 = ($unsigned($signed(((8'h9e) ?
                     wire2 : (wire2 ? (8'ha5) : wire4)))) ^ (reg7 ?
                     (((8'hb2) > ((8'haf) ? wire4 : (8'hab))) ?
                         ({wire5, wire0} ?
                             wire1 : ((8'ha8) ?
                                 wire2 : wire2)) : ($signed(wire4) ?
                             wire4[(3'h7):(3'h5)] : $signed(wire0))) : wire4));
  assign wire9 = (wire6 ?
                     wire8 : (wire8[(1'h1):(1'h0)] ^ wire2[(5'h12):(4'hd)]));
  assign wire10 = $signed(($unsigned((^~(wire5 ? wire3 : wire6))) ?
                      {$unsigned($unsigned(wire3)),
                          ($signed(wire4) ?
                              (8'ha9) : $signed(wire2))} : (~^wire0)));
  assign wire11 = (wire3 >>> wire4[(4'h9):(1'h1)]);
  assign wire12 = (((wire8[(2'h2):(2'h2)] || wire3[(4'he):(4'h9)]) > $unsigned(wire8)) ?
                      wire2[(5'h10):(4'hd)] : {wire3});
  assign wire13 = $unsigned({(+$signed((8'hbd))), wire1[(2'h3):(1'h1)]});
  assign wire14 = ((~^{$unsigned((wire9 <= wire0)),
                          $unsigned($unsigned(reg7))}) ?
                      wire6[(1'h1):(1'h0)] : (wire10 ?
                          $unsigned(((wire1 ?
                              wire10 : wire6) <<< $unsigned(reg7))) : {wire5,
                              wire6[(4'h9):(2'h3)]}));
  always
    @(posedge clk) begin
      reg15 <= $signed(($unsigned($signed({wire11, reg7})) ?
          $signed({wire4[(3'h7):(3'h6)]}) : (($unsigned(wire0) ?
              (&wire4) : $unsigned(wire12)) | $signed($signed(wire14)))));
      reg16 <= ((-$signed((-(!wire5)))) ?
          wire8[(2'h2):(2'h2)] : {$signed((^(wire14 < wire3))),
              (wire5[(4'he):(4'hb)] ?
                  ($unsigned(wire13) << (wire10 ? wire6 : wire5)) : reg15)});
    end
  always
    @(posedge clk) begin
      if ((~&$unsigned(wire12[(1'h0):(1'h0)])))
        begin
          if ((wire13 ?
              ($signed(($signed(wire9) ?
                  (reg15 ? wire1 : reg16) : (&wire8))) | (-((+wire12) ?
                  $signed(wire3) : (wire8 | wire5)))) : wire1))
            begin
              reg17 <= (reg7[(4'h8):(3'h7)] >> ((8'hab) ?
                  $signed((8'ha2)) : $signed((((8'hb8) >> wire13) ?
                      (reg15 ? wire13 : wire13) : {wire0}))));
              reg18 <= {{$unsigned($signed($unsigned(wire4))),
                      $signed({$signed(wire6), reg17[(1'h0):(1'h0)]})}};
              reg19 <= wire9;
            end
          else
            begin
              reg17 <= wire4[(4'h8):(3'h6)];
              reg18 <= ($signed(wire11) ?
                  wire12[(1'h0):(1'h0)] : {(((^~wire8) ~^ (wire4 ?
                          reg19 : (8'hac))) ^ reg15[(1'h1):(1'h1)]),
                      $signed(($signed((8'h9c)) == (wire0 & wire9)))});
              reg19 <= (({wire0[(3'h6):(1'h1)],
                      $signed(reg17)} >>> $unsigned(($signed((8'hae)) ?
                      (wire14 ? wire3 : wire2) : {wire5}))) ?
                  $unsigned(wire11[(1'h0):(1'h0)]) : ((!{$signed(reg7)}) ?
                      {$signed((^~wire0))} : (((wire6 ? wire2 : reg7) ?
                              $unsigned(wire13) : (wire6 >>> reg19)) ?
                          wire8[(1'h1):(1'h1)] : $unsigned((&wire10)))));
              reg20 <= $signed($unsigned($unsigned($unsigned(reg17))));
            end
          reg21 <= $signed(wire0);
          reg22 <= ($unsigned(wire10) ?
              $signed((+wire0)) : reg19[(5'h12):(1'h1)]);
          reg23 <= $unsigned($signed({{wire3[(2'h3):(1'h1)]}}));
          reg24 <= ({(|reg15[(2'h2):(2'h2)])} >> $unsigned(reg22));
        end
      else
        begin
          if ((^~(-$unsigned(reg15[(1'h1):(1'h0)]))))
            begin
              reg17 <= $unsigned($unsigned(wire12));
              reg18 <= wire10;
              reg19 <= $signed(({((reg24 ?
                          reg18 : reg20) ^ reg22[(1'h1):(1'h1)]),
                      ((reg17 ? reg16 : reg17) == $unsigned(wire0))} ?
                  $unsigned(wire8) : ($unsigned(reg21[(4'hf):(2'h2)]) ?
                      ((reg17 ?
                          reg15 : reg24) ^~ $signed(reg21)) : $signed(reg7))));
              reg20 <= $signed(((((wire4 ? wire11 : wire5) ?
                      ((8'haf) >= (7'h40)) : wire1[(1'h0):(1'h0)]) | $signed(wire13)) ?
                  wire3[(3'h4):(1'h1)] : reg17));
            end
          else
            begin
              reg17 <= wire8[(2'h2):(1'h1)];
            end
          reg21 <= $unsigned((wire3[(4'hf):(2'h2)] & ((+$unsigned(wire14)) | wire5[(2'h3):(2'h3)])));
        end
    end
  assign wire25 = $unsigned(($signed($signed($signed(wire13))) ?
                      (wire13 ?
                          ((8'hba) == (&wire1)) : $unsigned((reg21 <= wire9))) : $signed($unsigned(reg16))));
  assign wire26 = reg24;
endmodule
