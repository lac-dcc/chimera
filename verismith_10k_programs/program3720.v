module top
#(parameter param26 = {((((&(8'hbd)) ^~ ((8'hb7) ^ (8'h9c))) - (&((8'haf) ? (8'hb3) : (8'hbc)))) - ((~((8'hb8) <<< (8'hbb))) << (((7'h43) <= (8'h9f)) | (+(8'haf))))), (&((^~(&(8'hbc))) << (((8'hb6) ? (7'h40) : (8'hab)) ~^ ((8'hb7) + (8'ha8)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
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
                 (1'h0)};
  assign wire5 = {(wire0[(4'ha):(4'h9)] ?
                         wire3 : ($signed(wire1[(3'h4):(2'h3)]) << (~|wire4[(2'h2):(1'h1)])))};
  assign wire6 = ((({(^~wire2)} ?
                         ($unsigned(wire5) == wire0) : wire0[(4'hb):(1'h0)]) == wire3) ?
                     $signed((-($signed(wire2) >>> wire3[(4'hf):(4'he)]))) : $signed(wire1));
  assign wire7 = ({($signed((wire1 + wire0)) + wire3)} ?
                     (8'ha3) : {$unsigned(((wire2 ? (8'had) : (8'ha8)) ?
                             $unsigned((8'h9f)) : wire6[(4'h8):(1'h0)])),
                         ($signed((~|wire6)) <<< $unsigned({wire6, wire3}))});
  assign wire8 = ($unsigned({wire3[(4'hb):(4'ha)]}) ?
                     wire6[(1'h1):(1'h0)] : wire7[(3'h4):(2'h2)]);
  assign wire9 = $unsigned(wire8[(4'hd):(3'h4)]);
  assign wire10 = ((&$unsigned(({wire3} ?
                      $signed(wire1) : wire6[(4'h8):(3'h5)]))) > {wire1});
  assign wire11 = $unsigned((((wire7[(4'hc):(4'ha)] && (wire10 ?
                              (8'hb8) : wire8)) ?
                          wire10 : wire1[(1'h1):(1'h0)]) ?
                      wire2 : wire3));
  assign wire12 = (wire9 ?
                      (|({$unsigned((8'had))} ?
                          $unsigned(wire5) : $unsigned(wire5[(1'h1):(1'h1)]))) : (~|($unsigned($unsigned(wire3)) ?
                          (((7'h44) ? wire8 : (7'h40)) ?
                              wire8[(4'hf):(3'h6)] : $signed(wire5)) : (+(wire10 && wire4)))));
  always
    @(posedge clk) begin
      if (((!$unsigned(($unsigned(wire1) ? wire5 : (wire6 ^ wire6)))) ?
          wire2[(4'hb):(3'h5)] : (^~(!$signed(wire9)))))
        begin
          reg13 <= wire7[(1'h1):(1'h0)];
          reg14 <= $unsigned({wire1, (^~wire6)});
          if ($unsigned((^~$signed($signed(wire5[(3'h6):(2'h3)])))))
            begin
              reg15 <= ((($unsigned($unsigned(wire7)) ?
                          $unsigned((wire8 ?
                              wire10 : wire12)) : $signed((reg14 & reg14))) ?
                      (~^wire8[(5'h11):(3'h7)]) : {($signed(wire10) || wire2[(4'ha):(3'h4)])}) ?
                  (reg13 ?
                      $signed(($unsigned(wire4) ?
                          $signed(wire10) : reg13)) : $unsigned($unsigned($unsigned(wire10)))) : $unsigned((&{wire2,
                      wire0[(5'h12):(4'h8)]})));
              reg16 <= wire4[(2'h2):(1'h1)];
              reg17 <= wire0[(4'hd):(1'h1)];
            end
          else
            begin
              reg15 <= {wire4};
              reg16 <= $unsigned((~$unsigned(wire0)));
            end
          reg18 <= (-(reg17[(3'h4):(1'h0)] >> (wire3[(5'h10):(3'h4)] ?
              {wire7, (wire6 + wire10)} : ($signed(wire4) | $signed(wire3)))));
        end
      else
        begin
          reg13 <= reg15;
          if (reg14)
            begin
              reg14 <= {(^~(wire8[(1'h0):(1'h0)] ? (8'hb9) : reg15)),
                  (reg13[(1'h1):(1'h0)] ?
                      wire5[(3'h4):(3'h4)] : ((reg18[(4'he):(3'h7)] == (~^reg17)) ?
                          {(reg14 ? wire10 : (8'ha8)),
                              $signed(wire8)} : (~|(wire4 ? wire4 : reg17))))};
            end
          else
            begin
              reg14 <= wire10[(2'h2):(2'h2)];
            end
        end
      reg19 <= ({$unsigned((|$signed(reg13)))} >> wire12[(3'h5):(1'h0)]);
      reg20 <= {{($unsigned((wire11 && (8'h9c))) == (~^$unsigned(wire6))),
              (^~$unsigned({reg18}))},
          $unsigned($unsigned($signed(wire10[(1'h0):(1'h0)])))};
      reg21 <= $signed(wire1);
      reg22 <= reg15;
    end
  assign wire23 = reg22[(3'h7):(3'h7)];
  assign wire24 = $unsigned(((^$signed({wire7})) < ($unsigned((~|reg15)) & $unsigned((reg17 ?
                      wire1 : (8'h9f))))));
  assign wire25 = (8'ha0);
endmodule
