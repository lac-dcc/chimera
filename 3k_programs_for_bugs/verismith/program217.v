module top
#(parameter param44 = ({(-(!((8'hbf) ? (8'ha2) : (8'hbc))))} ? ((~^(~^((8'ha3) ? (8'ha3) : (8'ha0)))) < ((~&((8'hb5) ? (8'hb3) : (8'ha2))) ? (((8'hae) | (8'h9c)) == {(7'h44)}) : (((8'hb5) <<< (8'hb6)) - ((8'haa) ~^ (8'hb6))))) : ((({(8'haf)} ? {(8'hb0), (8'hb8)} : ((7'h44) ? (8'h9e) : (7'h44))) ? (!{(8'hae), (8'hbf)}) : (|((8'ha0) ? (8'h9e) : (8'ha7)))) ^ ((((8'haf) ? (8'haa) : (8'ha3)) ? (~^(8'ha8)) : (~^(8'hb1))) ? ((7'h42) ? ((8'ha6) - (8'hb8)) : ((8'ha2) == (8'hb4))) : ({(8'hb9)} ? {(8'ha3), (8'h9c)} : ((8'hac) ? (8'hb6) : (8'hbd)))))), 
parameter param45 = ((~&param44) ? (param44 ? (+(|(param44 ? param44 : param44))) : (~&((param44 ? param44 : param44) ? param44 : ((8'haa) ~^ param44)))) : param44))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = $signed((!wire3[(2'h2):(1'h1)]));
  assign wire6 = (~wire0[(1'h0):(1'h0)]);
  assign wire7 = $unsigned(($signed($unsigned(((8'hae) - wire4))) ?
                     {wire6, $unsigned(wire3)} : $signed((~^(wire1 ?
                         (8'hb9) : wire6)))));
  assign wire8 = wire2[(1'h1):(1'h1)];
  assign wire9 = wire2[(3'h6):(2'h3)];
  assign wire10 = ($unsigned(wire2) - wire2[(3'h5):(2'h2)]);
  assign wire11 = $signed((7'h40));
  assign wire12 = $unsigned($signed(wire1));
  assign wire13 = wire7;
  always
    @(posedge clk) begin
      reg14 <= (~^wire1);
      reg15 <= reg14;
      reg16 <= (^$unsigned({wire1}));
      reg17 <= $signed((((|(|wire6)) ?
          ((wire12 ? wire9 : wire9) ?
              wire7 : ((8'hb7) ? wire5 : wire3)) : ((~wire1) >= ((8'hab) ?
              reg16 : wire12))) - reg16[(1'h1):(1'h1)]));
    end
  always
    @(posedge clk) begin
      if (wire10)
        begin
          reg18 <= {(wire1[(4'hc):(3'h5)] + {(~{wire3, reg14})}),
              (reg14[(4'h8):(1'h1)] || wire3)};
          if (wire12[(1'h1):(1'h1)])
            begin
              reg19 <= $signed((|$unsigned(wire4)));
              reg20 <= (((~$signed({wire1, (8'h9d)})) ?
                  {((wire12 || reg17) & $unsigned((8'h9e)))} : ((reg14[(4'hb):(1'h1)] - reg19) ^ {wire3})) >>> $unsigned(wire12));
            end
          else
            begin
              reg19 <= {wire1[(2'h2):(1'h1)]};
              reg20 <= $unsigned($signed({((wire5 - reg16) > $signed(wire6))}));
              reg21 <= ((wire2 ?
                      ($signed($unsigned(wire13)) | $unsigned((wire1 ?
                          wire1 : wire6))) : ((wire4[(1'h0):(1'h0)] ^ $signed(wire5)) ^ reg20[(3'h5):(1'h0)])) ?
                  $unsigned(reg18[(2'h2):(1'h1)]) : ((~|($unsigned((8'hb7)) ?
                          (~&(8'hab)) : (8'hb3))) ?
                      $unsigned($signed(reg19[(3'h6):(1'h0)])) : reg14[(4'hb):(1'h1)]));
              reg22 <= wire9;
            end
          reg23 <= (~^{wire0});
        end
      else
        begin
          reg18 <= $signed(reg20[(3'h6):(2'h3)]);
        end
      reg24 <= wire11[(2'h2):(1'h0)];
    end
  assign wire25 = (^(wire1[(4'hc):(3'h4)] ?
                      $signed(reg21) : (~|(wire12[(1'h1):(1'h1)] && wire3))));
  assign wire26 = (&(((((8'hb1) ^ reg21) || wire6[(3'h4):(2'h2)]) ?
                          ($unsigned((7'h40)) * $unsigned(wire9)) : $unsigned($signed(reg23))) ?
                      reg18 : wire12[(2'h3):(2'h3)]));
  assign wire27 = (((wire3[(1'h0):(1'h0)] ?
                      (~reg18[(2'h3):(1'h0)]) : wire11) <<< $signed($unsigned((reg15 ?
                      wire11 : wire8)))) & reg15[(4'hb):(2'h3)]);
  always
    @(posedge clk) begin
      reg28 <= $signed((^wire4));
      if ($signed((^($signed($signed(wire11)) - reg14))))
        begin
          if ($signed((^($signed($unsigned((8'hb4))) == {wire3[(3'h5):(3'h4)]}))))
            begin
              reg29 <= $unsigned($unsigned(reg24[(3'h4):(3'h4)]));
              reg30 <= ($unsigned($signed(reg15)) ?
                  $signed(wire13) : ({{((8'hb5) | reg29), $signed(wire11)},
                          ((wire8 > wire27) ?
                              $signed((8'hb6)) : $unsigned((8'hb7)))} ?
                      ((^$signed(wire2)) ?
                          ((~^wire7) ^~ (-wire26)) : (wire4[(1'h1):(1'h1)] == wire25[(2'h3):(2'h3)])) : {(~&wire8)}));
              reg31 <= $unsigned((^(~$unsigned(wire11[(2'h2):(2'h2)]))));
              reg32 <= (reg17 ?
                  $signed(reg22[(3'h7):(3'h4)]) : reg19[(4'hd):(4'hc)]);
              reg33 <= ((|$unsigned($unsigned((reg32 == wire7)))) > $unsigned(reg30));
            end
          else
            begin
              reg29 <= ((8'ha6) < (+(&$unsigned((&wire6)))));
              reg30 <= {wire27};
              reg31 <= ((reg23 == (^wire1[(4'hd):(2'h2)])) ?
                  {reg32,
                      (((^~reg31) >> ((7'h43) >= wire13)) >= (8'hab))} : $signed(($unsigned($signed((8'ha0))) ?
                      (|$unsigned(reg33)) : reg20[(1'h1):(1'h1)])));
              reg32 <= wire2;
            end
          if (((~|wire26) | reg32[(4'h8):(3'h6)]))
            begin
              reg34 <= wire2;
              reg35 <= (&{(wire12[(2'h3):(1'h0)] || reg21[(1'h1):(1'h1)]),
                  (8'haa)});
            end
          else
            begin
              reg34 <= $signed(reg15);
            end
          reg36 <= (~reg32);
          reg37 <= $signed((^(($signed(reg16) ? {reg32} : $unsigned(reg34)) ?
              wire1 : {reg34[(3'h4):(1'h1)], wire10})));
          if (((+wire8[(2'h3):(1'h0)]) ?
              reg35[(1'h1):(1'h0)] : wire3[(1'h0):(1'h0)]))
            begin
              reg38 <= $unsigned($signed((((~|wire7) | $signed((7'h42))) >> $signed((reg28 + wire10)))));
              reg39 <= (({reg35[(2'h3):(1'h1)],
                      ($unsigned(reg15) <= $signed(wire7))} != $signed($signed(reg19[(1'h0):(1'h0)]))) ?
                  $unsigned(({(-wire9),
                      wire7[(2'h3):(1'h1)]} - {$signed(reg19)})) : reg19[(4'hb):(4'h8)]);
              reg40 <= reg36;
            end
          else
            begin
              reg38 <= (8'hb1);
              reg39 <= (~(~|reg32));
              reg40 <= reg37;
              reg41 <= wire26;
            end
        end
      else
        begin
          reg29 <= (-(reg36 ?
              (((reg36 != reg33) >>> wire26[(2'h3):(2'h3)]) - reg24) : ((~reg24[(1'h1):(1'h0)]) >> wire1)));
        end
      reg42 <= wire8[(1'h1):(1'h0)];
      reg43 <= $unsigned($signed((7'h40)));
    end
endmodule
