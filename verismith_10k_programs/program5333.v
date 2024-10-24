module top
#(parameter param31 = {({(((8'haf) ? (8'hb7) : (8'h9e)) != ((8'ha3) ? (8'h9f) : (8'ha9))), (8'hb9)} ^ (~&(((7'h43) ? (8'hbd) : (8'ha0)) <= (8'hb0))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire30,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $signed((wire2[(3'h4):(3'h4)] ?
                     (^wire3[(2'h2):(1'h1)]) : wire0[(2'h3):(2'h2)]));
  assign wire6 = $unsigned(wire0[(4'h9):(3'h6)]);
  assign wire7 = ((~|wire4[(2'h3):(2'h2)]) < {wire2[(1'h1):(1'h0)],
                     $unsigned((wire6 >> ((8'hb1) ^ (8'hb4))))});
  assign wire8 = wire5[(3'h4):(1'h0)];
  assign wire9 = ($signed($signed(wire5)) ?
                     ((wire7 + $signed((wire7 ? wire3 : wire2))) | ((~(wire2 ?
                         wire3 : wire8)) <<< ($unsigned(wire6) ?
                         (wire8 & wire4) : $signed(wire0)))) : {(wire7[(3'h5):(1'h1)] ?
                             (^~(wire6 - wire8)) : wire6[(1'h1):(1'h1)])});
  assign wire10 = (8'h9f);
  assign wire11 = (~|(wire5 >= wire3));
  assign wire12 = wire4[(2'h2):(1'h1)];
  assign wire13 = {wire3, wire0[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      if ($unsigned(wire2[(2'h2):(2'h2)]))
        begin
          if (wire5)
            begin
              reg14 <= (~$unsigned({((!wire12) == wire11[(2'h3):(2'h2)])}));
              reg15 <= (~^(($unsigned($unsigned(wire3)) != (-wire1)) ?
                  $unsigned(wire12) : {((~wire1) ^ (wire11 == (8'ha4))),
                      $unsigned(wire0[(2'h3):(1'h1)])}));
              reg16 <= $unsigned({$unsigned((~^wire9[(4'ha):(3'h7)]))});
              reg17 <= ((+(((wire8 ~^ (7'h43)) ? (wire5 || reg14) : (8'ha6)) ?
                      {$unsigned(wire9), $signed((7'h41))} : ({wire4,
                          wire0} <<< wire3[(1'h1):(1'h1)]))) ?
                  ((wire9[(3'h7):(2'h2)] < wire9[(4'h8):(4'h8)]) >>> (-$signed((wire11 ?
                      wire6 : wire7)))) : $unsigned({((reg16 ^ reg14) ?
                          $unsigned(wire12) : (^wire0)),
                      wire2[(2'h2):(2'h2)]}));
              reg18 <= (((8'ha3) ?
                  $unsigned(wire7[(2'h3):(1'h1)]) : $signed(wire1)) || (^reg17));
            end
          else
            begin
              reg14 <= ((((wire10[(2'h2):(1'h0)] ?
                  $signed(wire8) : (reg18 ? wire2 : wire1)) >>> {(~reg18),
                  wire8}) >= {reg14,
                  ($signed((7'h43)) ^ reg17)}) == (~((&{wire7}) ?
                  wire0[(4'h9):(3'h5)] : $signed((&reg14)))));
              reg15 <= (~^(~({reg16, $signed((8'hb6))} ? wire10 : wire1)));
              reg16 <= wire7;
              reg17 <= $signed($signed($signed($signed(reg14[(3'h4):(2'h2)]))));
            end
          if ((|wire3[(1'h1):(1'h0)]))
            begin
              reg19 <= wire12[(1'h0):(1'h0)];
              reg20 <= $signed({{reg15[(5'h12):(3'h5)],
                      $unsigned(wire13[(4'he):(1'h1)])},
                  $signed(({wire6, wire12} ~^ (wire8 && wire8)))});
              reg21 <= $unsigned($signed(wire2));
              reg22 <= reg18;
              reg23 <= reg17;
            end
          else
            begin
              reg19 <= wire3[(1'h1):(1'h1)];
              reg20 <= $signed((reg22 ?
                  wire10[(1'h0):(1'h0)] : ((!reg19[(1'h0):(1'h0)]) ?
                      ($signed(reg23) ?
                          reg17[(2'h3):(2'h2)] : $unsigned(reg14)) : (~&wire1))));
            end
        end
      else
        begin
          if (((wire0[(3'h7):(2'h3)] <= $signed((wire10[(3'h4):(2'h3)] ?
                  $signed(reg17) : ((8'h9f) ? reg19 : wire11)))) ?
              {{({reg23, wire5} & wire6), (|(~^wire9))}} : reg17))
            begin
              reg14 <= reg19[(5'h12):(1'h1)];
              reg15 <= $signed(((8'hb7) * ((reg20[(2'h2):(2'h2)] ?
                  wire6[(1'h1):(1'h1)] : (~^wire13)) && $signed($unsigned(wire3)))));
            end
          else
            begin
              reg14 <= $signed($unsigned({(^(reg14 & reg17)), reg19}));
              reg15 <= ((($unsigned((|(8'hb2))) >> reg23) | (|(8'hb8))) ~^ reg14[(2'h2):(2'h2)]);
            end
        end
      reg24 <= {$unsigned(($unsigned($unsigned(reg21)) ?
              (wire12[(1'h1):(1'h1)] ?
                  (wire1 ?
                      wire10 : wire11) : (wire8 >= wire12)) : wire7[(3'h6):(2'h2)])),
          reg20[(3'h5):(1'h1)]};
      reg25 <= ((!(8'ha3)) + (reg16[(3'h4):(1'h1)] ?
          ($unsigned((!reg20)) ?
              $signed((reg18 ^ wire3)) : ((8'hbe) ?
                  $unsigned(reg20) : wire6)) : wire5));
    end
  always
    @(posedge clk) begin
      reg26 <= (($signed(reg18) ^~ (~|reg24[(2'h3):(1'h1)])) ?
          ((^~((-wire11) ? (&reg22) : {wire5, wire13})) ?
              wire0 : {(~&(|wire5)),
                  {wire3}}) : ($unsigned(($signed(wire10) != (wire6 ?
              reg25 : reg17))) > {$unsigned($signed(reg14))}));
      reg27 <= {wire13[(4'hb):(2'h2)],
          (reg17 ?
              (((wire12 ?
                  reg26 : wire7) >= $unsigned(wire10)) ^ (wire2[(2'h2):(1'h1)] ^ ((8'hb9) - wire6))) : ($signed((^~(8'hba))) ?
                  (wire3 > $signed(wire11)) : (|$unsigned(wire11))))};
      reg28 <= reg26;
      reg29 <= ((8'ha7) ?
          {reg16[(1'h1):(1'h1)],
              (|reg20)} : ($unsigned(reg23[(5'h10):(4'hd)]) <= $unsigned($unsigned((reg20 >>> wire9)))));
    end
  assign wire30 = (-(~(-((wire11 ~^ reg23) & (reg19 ? reg25 : wire8)))));
endmodule
