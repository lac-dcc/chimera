module top
#(parameter param41 = (8'hb3), 
parameter param42 = (~|{{param41, param41}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire40,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned((^~{{wire2, (8'hac)},
                     wire4[(3'h4):(1'h1)]})));
  assign wire6 = ($unsigned((((~wire1) & $signed(wire2)) ?
                     wire1 : (-$unsigned(wire3)))) & $unsigned($signed($signed((wire5 < wire2)))));
  assign wire7 = ($unsigned($signed($signed(wire1))) ^~ (~^(wire5[(5'h13):(4'hc)] ?
                     wire5[(4'hc):(3'h4)] : ((^~wire6) >= (wire1 ?
                         wire1 : wire4)))));
  assign wire8 = (wire2[(2'h3):(2'h2)] ?
                     (8'hb0) : {($unsigned((~&wire5)) <<< (wire2 << (^~wire1))),
                         {($signed(wire0) ? wire2 : (wire0 ? wire2 : wire1))}});
  always
    @(posedge clk) begin
      reg9 <= (~|$unsigned($signed(wire2[(3'h4):(2'h3)])));
      reg10 <= wire6;
    end
  assign wire11 = $signed(wire5[(5'h11):(4'hc)]);
  assign wire12 = (wire8[(2'h2):(1'h1)] ?
                      wire5[(4'hb):(4'h9)] : $unsigned((wire5 ?
                          (8'ha8) : wire8[(1'h1):(1'h1)])));
  assign wire13 = $unsigned($signed(reg10[(4'hd):(4'hc)]));
  always
    @(posedge clk) begin
      if ((+((|$unsigned((wire0 ? wire8 : wire11))) ^~ (({wire13} ?
          wire5[(5'h12):(5'h11)] : {(8'hb6)}) - $unsigned($unsigned(wire13))))))
        begin
          reg14 <= (+wire8[(1'h0):(1'h0)]);
          if ((^wire6[(4'h9):(1'h1)]))
            begin
              reg15 <= $unsigned(wire13);
              reg16 <= $signed($signed(($unsigned($unsigned((8'ha5))) ?
                  $signed((wire1 == reg14)) : $unsigned((wire5 ?
                      wire13 : wire4)))));
            end
          else
            begin
              reg15 <= (-$signed({$signed(wire8[(1'h0):(1'h0)]), wire13}));
            end
          reg17 <= reg15;
          reg18 <= $signed(wire7);
        end
      else
        begin
          reg14 <= wire1;
        end
      reg19 <= $unsigned({(reg17 * (^(~|reg16))),
          {$unsigned($unsigned(wire0))}});
      reg20 <= (^~reg10);
      if ((reg9[(3'h4):(3'h4)] + (!$signed($signed({reg18})))))
        begin
          if (wire1[(2'h3):(2'h3)])
            begin
              reg21 <= (~|$unsigned(wire1));
            end
          else
            begin
              reg21 <= (^~(((~&(reg10 ? reg18 : wire2)) ~^ ((reg16 ?
                  wire7 : reg17) - reg19[(2'h3):(1'h1)])) ^ (-$signed($unsigned(wire0)))));
              reg22 <= $signed($signed($unsigned($unsigned(wire6))));
              reg23 <= $unsigned(reg22[(1'h1):(1'h0)]);
              reg24 <= $signed($signed((|(8'hb0))));
              reg25 <= ($unsigned(wire5[(5'h12):(4'hb)]) ?
                  {(&((~|reg17) ?
                          (!reg21) : (wire3 ?
                              reg14 : wire0)))} : (!$signed(((&reg10) ?
                      ((8'hbf) - (8'h9e)) : wire11))));
            end
        end
      else
        begin
          reg21 <= (wire7[(4'hf):(2'h2)] ?
              reg18[(4'hd):(3'h7)] : reg24[(1'h0):(1'h0)]);
          if (wire3[(2'h3):(2'h3)])
            begin
              reg22 <= (~^wire5[(1'h1):(1'h1)]);
              reg23 <= reg21;
            end
          else
            begin
              reg22 <= $unsigned(wire6);
              reg23 <= ($unsigned(((8'ha1) ? wire5 : (^~$unsigned(reg16)))) ?
                  (reg17[(5'h13):(5'h10)] < reg14[(3'h6):(1'h1)]) : reg20[(3'h4):(3'h4)]);
              reg24 <= $signed(($signed((~^(~|(8'ha0)))) ?
                  ($unsigned(reg16) <= wire4[(3'h6):(2'h2)]) : $unsigned(((reg9 ?
                      (8'hb8) : wire11) << wire2[(1'h0):(1'h0)]))));
            end
          reg25 <= (~&(wire8[(1'h0):(1'h0)] ?
              {reg19} : (reg21[(1'h0):(1'h0)] * (+(reg22 ? (8'ha7) : wire7)))));
        end
      reg26 <= ((~(8'hb2)) - $signed(reg25[(4'hc):(3'h7)]));
    end
  always
    @(posedge clk) begin
      if (reg14)
        begin
          if ((|wire0[(5'h12):(4'hc)]))
            begin
              reg27 <= $signed((|($unsigned($unsigned(wire12)) - (reg21 ?
                  $unsigned(wire4) : $unsigned(reg19)))));
              reg28 <= reg21[(4'h8):(3'h5)];
              reg29 <= reg20;
            end
          else
            begin
              reg27 <= $unsigned(({wire3[(3'h6):(3'h6)]} <<< $unsigned(reg19)));
              reg28 <= $signed((-wire11));
              reg29 <= reg19[(3'h4):(2'h3)];
              reg30 <= $signed((~((~&(reg24 ?
                  reg29 : wire7)) && $signed(((8'hb4) ^ (8'hac))))));
            end
          reg31 <= {reg20};
        end
      else
        begin
          reg27 <= (~&$signed((~((~|wire8) ^~ (reg9 <= reg27)))));
          if (((reg17 ?
              $unsigned($signed({wire3})) : (~&wire4[(1'h1):(1'h1)])) >> (~^$unsigned((~&((8'hb1) ?
              wire4 : wire11))))))
            begin
              reg28 <= ((({$signed(reg28)} ?
                  reg31 : $unsigned(wire0)) || ((-reg17[(4'hd):(3'h5)]) ?
                  $unsigned((~wire12)) : $unsigned($signed(reg18)))) ~^ (reg23 || (|(+reg24[(1'h0):(1'h0)]))));
              reg29 <= $unsigned({$signed((~&$signed(reg25)))});
              reg30 <= ($signed((wire7 || ((~&reg9) <= ((8'hac) | wire1)))) ?
                  (~|wire7) : (^~$unsigned(wire6)));
              reg31 <= (wire12[(4'hf):(3'h5)] & (~(+wire7[(4'h8):(4'h8)])));
            end
          else
            begin
              reg28 <= (~&($signed(reg18) + wire11));
              reg29 <= $unsigned($signed($unsigned(reg30[(5'h12):(5'h11)])));
            end
          reg32 <= ($unsigned(reg15) ?
              wire12[(3'h5):(2'h3)] : $unsigned((+((wire0 | (8'ha7)) != reg17[(5'h10):(4'hf)]))));
          reg33 <= wire5;
        end
      reg34 <= wire4[(3'h6):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ($signed(((reg26[(3'h6):(3'h5)] | ({wire1} ^ reg20[(3'h4):(2'h2)])) - wire2[(1'h1):(1'h1)])))
        begin
          reg35 <= ($unsigned(wire11) ?
              $signed($signed((|{wire13, wire1}))) : (((~&$unsigned((8'hb5))) ?
                  (reg28[(3'h4):(2'h3)] <<< $signed(wire12)) : $signed({reg30})) > reg18));
          reg36 <= ((($unsigned((^reg30)) <<< reg9) ?
              reg29 : (^~$signed({(8'hb0), reg9}))) && ((|{{reg30}}) + reg23));
          reg37 <= $signed($unsigned((-reg30[(4'hc):(4'h9)])));
        end
      else
        begin
          reg35 <= (reg20 ? reg16 : ((|wire4) >> (8'ha5)));
          reg36 <= (^~$signed((reg36 ?
              $signed($signed(wire4)) : reg34[(2'h3):(2'h3)])));
          reg37 <= reg22;
        end
    end
  always
    @(posedge clk) begin
      reg38 <= ($unsigned({$unsigned({wire2, reg20})}) ?
          (~&(wire12 ?
              reg32[(4'h8):(3'h4)] : ($signed(wire7) ^ wire3))) : reg10[(3'h6):(2'h3)]);
      reg39 <= reg16[(3'h6):(2'h3)];
    end
  assign wire40 = (!$unsigned($unsigned($unsigned((reg27 ? reg38 : wire2)))));
endmodule
