module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $unsigned(wire4);
  assign wire6 = (|(wire2[(4'hd):(3'h5)] | wire0));
  assign wire7 = (wire3[(1'h0):(1'h0)] ?
                     (($signed((wire2 ? wire5 : (8'hb9))) ?
                         $signed(wire1[(4'ha):(3'h6)]) : wire5) >>> $signed({$signed(wire3),
                         wire3})) : $unsigned({((!wire6) & wire3),
                         $signed((wire6 - wire5))}));
  assign wire8 = (8'hbd);
  assign wire9 = $unsigned((|wire8[(2'h2):(1'h0)]));
  assign wire10 = (-$signed($signed(wire3)));
  assign wire11 = wire2[(4'he):(4'h8)];
  assign wire12 = wire8;
  assign wire13 = $signed($signed(wire9));
  always
    @(posedge clk) begin
      if ((8'ha2))
        begin
          reg14 <= ($signed(wire2[(4'h9):(3'h6)]) * {(+{((8'hb5) ?
                      wire3 : (8'hba)),
                  wire12[(4'he):(2'h3)]}),
              ((wire4 + {(7'h44), wire8}) ?
                  ($unsigned((8'had)) == (+wire11)) : (!(8'hbb)))});
          reg15 <= wire13;
          reg16 <= (wire5 ? $unsigned(wire5) : wire13);
          reg17 <= {$signed(($signed((wire7 ? wire1 : wire12)) ?
                  $unsigned((|wire6)) : wire8[(4'h8):(2'h3)]))};
        end
      else
        begin
          reg14 <= (wire13 ? reg17 : $signed((+$signed({wire7, reg16}))));
          if (wire0)
            begin
              reg15 <= $unsigned(wire6[(4'hb):(2'h3)]);
              reg16 <= {({($signed(wire10) <<< (wire7 > wire10))} * $unsigned(($signed(wire13) ?
                      (wire3 ? (8'h9f) : wire4) : wire0[(3'h4):(3'h4)])))};
              reg17 <= wire9;
            end
          else
            begin
              reg15 <= (($signed($signed($signed(reg14))) <= wire5) <= (^wire11[(2'h2):(1'h0)]));
              reg16 <= {($signed($signed($signed(wire10))) ^ $unsigned(({wire7,
                          wire1} ?
                      (wire8 ? wire9 : (8'haf)) : $unsigned(wire3)))),
                  {(((wire0 | wire7) >= $signed(wire0)) ^ $unsigned(wire0[(3'h4):(2'h2)]))}};
              reg17 <= wire9;
              reg18 <= $signed(wire10[(2'h2):(1'h0)]);
            end
          reg19 <= wire11[(4'hd):(4'h9)];
          reg20 <= ($unsigned((reg14[(4'h9):(4'h9)] > ((|reg15) ?
              (~^reg17) : wire3[(4'h9):(3'h5)]))) ^~ (wire5[(3'h7):(2'h2)] ^~ reg19[(4'hb):(4'h8)]));
          reg21 <= (^$signed($unsigned((wire2 ? (~&wire12) : (+wire13)))));
        end
      if ($signed(wire0))
        begin
          if (wire12)
            begin
              reg22 <= $signed(reg14);
              reg23 <= ($signed({wire0,
                      ($unsigned((8'hb8)) ~^ (wire2 ? wire6 : wire8))}) ?
                  $signed(((reg16[(4'hd):(3'h4)] ?
                      $signed(wire1) : (wire4 && wire13)) + wire11[(5'h14):(3'h6)])) : {(|(8'hb8))});
            end
          else
            begin
              reg22 <= wire8;
            end
          reg24 <= (^(wire3 || (~|(wire3 >> reg23[(2'h2):(1'h1)]))));
          if ({$signed($signed($signed(reg17[(2'h2):(1'h0)]))),
              ((8'ha0) != reg15[(4'hd):(4'hb)])})
            begin
              reg25 <= (7'h44);
              reg26 <= ($signed(((^~{wire5}) ?
                  ($unsigned(wire7) ?
                      $unsigned(wire5) : $signed(wire6)) : ((-reg17) ?
                      (wire5 ?
                          wire5 : wire9) : reg21))) == $signed($unsigned($signed($unsigned(wire2)))));
              reg27 <= ((reg21[(3'h6):(3'h4)] ?
                      ($unsigned((reg16 ? reg21 : reg16)) | ((wire0 && reg14) ?
                          {reg23} : $signed((8'ha8)))) : (!(+wire7[(3'h7):(3'h4)]))) ?
                  reg23[(2'h2):(1'h1)] : reg25);
              reg28 <= ($signed($unsigned(reg17[(2'h3):(1'h0)])) >>> (wire5[(1'h1):(1'h0)] ?
                  reg20 : ($signed((reg24 <<< wire7)) ?
                      ($signed(wire13) >> (reg21 + wire6)) : (&(^~reg26)))));
            end
          else
            begin
              reg25 <= $unsigned(((wire11 ?
                  ((wire8 * wire3) ? (~&reg20) : (wire13 | reg14)) : ((wire9 ?
                          reg28 : (8'haf)) ?
                      (~^reg15) : $unsigned(reg17))) || (8'hbf)));
              reg26 <= reg20;
              reg27 <= reg18;
              reg28 <= ($signed($signed({$unsigned(reg15)})) <<< $unsigned((8'ha9)));
              reg29 <= reg21;
            end
          reg30 <= $signed(((wire5[(4'hc):(3'h5)] * reg29) ?
              wire9[(4'hc):(3'h6)] : $signed((8'hbf))));
          reg31 <= wire11;
        end
      else
        begin
          reg22 <= (((&(^(reg29 >>> wire6))) ?
                  (^((-reg16) ?
                      (~^reg27) : (wire12 ?
                          reg18 : wire10))) : $signed({reg20})) ?
              ({($signed(reg28) ? reg31 : (wire13 ? (8'h9c) : reg17)),
                  {(!(8'hb2))}} || (^wire8)) : $unsigned($signed((!(wire1 ?
                  wire13 : reg23)))));
        end
    end
endmodule
