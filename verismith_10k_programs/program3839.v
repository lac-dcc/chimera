module top
#(parameter param26 = (((((~(8'hb1)) ? ((8'h9d) || (8'h9e)) : ((8'h9f) + (8'h9f))) ? (!((8'hb3) ? (8'hb3) : (8'hb5))) : {{(8'hbb), (8'h9e)}, ((7'h41) <= (8'ha6))}) ? (((8'ha1) ? ((8'hb0) ? (8'hbb) : (7'h40)) : {(8'h9c), (8'hb8)}) >> (((7'h43) << (8'hbe)) & ((8'hb9) ? (8'hbe) : (7'h40)))) : (~^((8'h9e) ? (8'ha7) : {(8'hb3), (8'ha4)}))) ? {({((8'ha9) * (8'hb4)), ((8'ha6) >= (7'h44))} ? (8'hbd) : (((8'hb6) ? (8'h9d) : (8'hb0)) << ((8'h9e) << (8'hb9))))} : {{(((8'hbb) > (8'hb1)) ? ((8'ha8) != (8'ha7)) : {(7'h40)}), {((8'ha4) >>> (8'ha1)), (8'hb5)}}, (7'h42)}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = ({(wire2[(2'h3):(1'h1)] * wire3[(4'ha):(3'h6)])} ^~ (wire4[(3'h5):(3'h4)] ?
                     $unsigned((&(wire1 ? wire0 : (8'hba)))) : (|(!(wire4 ?
                         (8'h9c) : wire0)))));
  assign wire6 = {wire1[(3'h4):(1'h1)], wire4[(4'h8):(2'h3)]};
  assign wire7 = $unsigned($signed(({(wire6 ? wire1 : wire6)} ?
                     ((wire4 ? wire4 : wire1) ?
                         wire4 : (-wire1)) : ($signed(wire4) != $unsigned(wire0)))));
  assign wire8 = $unsigned($signed($unsigned(wire0)));
  always
    @(posedge clk) begin
      reg9 <= (~((wire6[(3'h4):(2'h2)] - wire8) != ((wire6[(4'hb):(1'h1)] ?
          (wire4 ? wire6 : wire3) : wire8[(3'h5):(3'h4)]) >= wire6)));
      reg10 <= (^~$signed($unsigned({wire6, wire0})));
      reg11 <= ({((((7'h42) ? wire1 : reg9) <<< $signed(wire6)) ?
              (-wire3[(1'h1):(1'h1)]) : ($unsigned(wire6) ?
                  $unsigned(wire5) : wire7[(1'h1):(1'h0)])),
          ($unsigned((wire5 ? reg10 : wire6)) ?
              $unsigned((^wire0)) : $signed(wire2))} && wire5[(2'h2):(1'h1)]);
      if (wire5)
        begin
          if ($signed(reg9))
            begin
              reg12 <= {wire3[(4'h9):(4'h8)]};
              reg13 <= reg9[(1'h1):(1'h1)];
              reg14 <= ($signed($unsigned((~&(!reg10)))) <= wire4);
              reg15 <= $unsigned(($unsigned(((wire3 < (8'ha5)) ?
                      (wire5 ? reg11 : reg12) : $signed(wire0))) ?
                  wire8 : reg12));
              reg16 <= $unsigned($signed((+wire4)));
            end
          else
            begin
              reg12 <= (~|(8'ha6));
            end
          if ($signed($unsigned(($signed({wire4, wire3}) || reg11))))
            begin
              reg17 <= (^~({(wire4 >= $unsigned(reg14))} == reg15));
              reg18 <= ({$signed(reg14),
                      ($signed(reg9[(3'h7):(3'h5)]) ?
                          reg15[(4'h8):(1'h0)] : ($signed(reg13) ?
                              wire2 : (wire4 ? wire2 : wire6)))} ?
                  reg15 : (&{wire5[(4'h8):(3'h7)]}));
              reg19 <= reg9;
              reg20 <= $signed(wire4);
            end
          else
            begin
              reg17 <= $unsigned(((8'haf) >>> reg20[(1'h1):(1'h1)]));
              reg18 <= $signed(reg15);
            end
          reg21 <= $signed(($unsigned(wire4) * $signed({(reg17 ^ wire8),
              $unsigned(reg18)})));
        end
      else
        begin
          reg12 <= $unsigned((~&$signed(wire6[(4'h9):(1'h0)])));
          reg13 <= reg19[(2'h3):(1'h0)];
          reg14 <= (wire8 && {$signed(({wire6} >>> wire1)),
              ((~|$unsigned(reg16)) ?
                  $unsigned((!reg14)) : reg14[(3'h4):(3'h4)])});
          reg15 <= (~&$unsigned($unsigned((8'hac))));
          if (wire1[(3'h6):(1'h0)])
            begin
              reg16 <= reg17;
              reg17 <= ($unsigned((((reg21 ? reg12 : wire0) ?
                      (wire4 + wire1) : (8'ha1)) ?
                  ($signed(reg20) ?
                      $signed((8'hbb)) : (reg17 ?
                          (8'hba) : reg11)) : {$signed(reg9),
                      (8'hbf)})) <<< (7'h40));
              reg18 <= wire5[(1'h1):(1'h1)];
            end
          else
            begin
              reg16 <= wire8[(3'h6):(3'h6)];
              reg17 <= wire1;
              reg18 <= $unsigned($signed($unsigned($unsigned((|wire1)))));
              reg19 <= $signed(((!wire3[(3'h7):(3'h7)]) * reg11));
              reg20 <= reg17[(1'h1):(1'h0)];
            end
        end
      reg22 <= (!reg16);
    end
  assign wire23 = ({({((8'ha9) ? (8'haf) : wire6)} ?
                          wire6 : $unsigned($unsigned(wire2)))} << (+reg22[(1'h0):(1'h0)]));
  assign wire24 = $signed(reg11[(3'h4):(1'h1)]);
  assign wire25 = $signed($unsigned({reg17}));
endmodule
