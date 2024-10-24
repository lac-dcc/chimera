module top
#(parameter param42 = (((^({(8'ha3)} ? ((8'had) ? (8'hab) : (8'h9c)) : {(8'hae), (8'hae)})) ? (|(~^((8'ha5) | (8'hba)))) : {(8'hab)}) ? (((((8'hac) ? (8'haf) : (8'ha6)) ^~ (-(8'hbc))) > ((8'hb0) ? ((8'h9c) ? (8'h9c) : (8'hac)) : {(7'h40)})) && (^(&{(8'hb3)}))) : (&(!(((8'ha2) ? (8'hb0) : (8'had)) && (~|(8'h9e)))))), 
parameter param43 = param42)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  assign y = {wire39,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg41,
                 reg40,
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
                 reg13,
                 (1'h0)};
  assign wire4 = wire1[(1'h1):(1'h0)];
  assign wire5 = (~$signed((^(~(wire1 ? wire3 : wire2)))));
  assign wire6 = ($signed((~^((wire0 ? wire1 : wire0) ?
                     wire0[(4'hb):(3'h7)] : (wire4 >= (8'ha6))))) << wire3[(3'h4):(1'h1)]);
  assign wire7 = ($unsigned($signed((8'ha9))) >> $unsigned(wire0));
  assign wire8 = $unsigned(wire4);
  assign wire9 = ($signed($unsigned($unsigned(wire6))) >> $signed($unsigned(wire1)));
  assign wire10 = (8'hb5);
  assign wire11 = (&wire0);
  assign wire12 = $unsigned($unsigned((!wire4[(4'ha):(3'h7)])));
  always
    @(posedge clk) begin
      if (($signed((((wire1 <= wire0) >>> (^~wire1)) ^ (((8'hbd) & wire12) ?
          (~^wire12) : $signed((8'hb3))))) >= (^$signed($unsigned({wire10,
          wire3})))))
        begin
          reg13 <= (8'haf);
          if ((+reg13))
            begin
              reg14 <= wire9[(4'hf):(1'h0)];
              reg15 <= (8'hb2);
              reg16 <= ($unsigned($unsigned((~|(|wire0)))) ?
                  reg15[(3'h4):(1'h0)] : ($unsigned((8'had)) ?
                      ((wire0[(1'h1):(1'h0)] <<< (8'hb9)) ?
                          {(wire11 >>> wire3),
                              (&wire8)} : (7'h40)) : {wire1[(4'h8):(2'h3)],
                          wire2}));
              reg17 <= $signed(wire11);
              reg18 <= wire9;
            end
          else
            begin
              reg14 <= (wire3[(1'h1):(1'h1)] ? wire5[(4'hc):(4'ha)] : wire11);
              reg15 <= ($signed({$unsigned($signed(reg16))}) ?
                  wire9[(1'h1):(1'h0)] : (^{((^wire11) ?
                          ((8'hbb) | reg16) : (&(8'hb3))),
                      $signed(wire5)}));
              reg16 <= (((wire5[(3'h7):(2'h3)] ?
                      (~&wire6) : ($unsigned(wire5) && $signed(wire4))) ?
                  wire11 : (^~$unsigned($unsigned(wire12)))) - (~^wire7[(2'h2):(1'h0)]));
            end
          reg19 <= wire4[(4'hc):(4'h8)];
          reg20 <= wire8[(4'ha):(4'h9)];
          if ((+(^$unsigned({(&wire7), (wire0 - reg16)}))))
            begin
              reg21 <= wire12;
              reg22 <= reg14;
              reg23 <= reg17[(5'h14):(5'h10)];
              reg24 <= reg23;
              reg25 <= wire6;
            end
          else
            begin
              reg21 <= wire11;
              reg22 <= reg18;
              reg23 <= $unsigned((reg18[(3'h6):(1'h0)] | ((~&$unsigned(wire9)) * (wire4[(1'h1):(1'h1)] >>> wire7))));
            end
        end
      else
        begin
          reg13 <= {((^((reg25 ?
                  wire7 : reg14) <<< (&reg17))) != $signed((((8'hb0) ?
                      reg25 : wire6) ?
                  reg25 : wire5[(4'ha):(3'h5)])))};
          reg14 <= {(8'h9e), (^~reg25)};
          if ((($signed((~(wire3 ^ wire5))) ^ (reg14[(4'hc):(4'hb)] ?
              ((reg20 ? (8'hb4) : reg19) ?
                  (^reg16) : wire10[(4'hd):(4'h9)]) : wire6)) <= ($unsigned(((~|reg15) ^~ $signed(reg17))) < $unsigned($unsigned((reg21 >= reg14))))))
            begin
              reg15 <= ((((+$signed((8'hb3))) ?
                  {(~|wire8)} : ($unsigned(reg24) ?
                      {(8'ha7), wire9} : ((8'hac) ?
                          reg19 : wire12))) >> (((reg21 ^ (7'h40)) ^~ reg15) ?
                  $signed({wire3}) : (&(8'hbf)))) <<< ($unsigned((((8'ha7) ?
                      wire9 : wire12) < {(8'hbb), reg24})) ?
                  wire12 : $signed(reg24)));
              reg16 <= (8'hbe);
              reg17 <= $unsigned($unsigned(reg15));
              reg18 <= (^~$signed(reg21));
            end
          else
            begin
              reg15 <= (($signed((+(reg22 ? wire4 : reg24))) ?
                      reg16 : $unsigned(reg15[(3'h4):(2'h3)])) ?
                  wire12 : ((wire8 == wire7[(1'h0):(1'h0)]) > $unsigned($signed(wire10[(2'h3):(2'h3)]))));
            end
        end
      reg26 <= ({$signed(reg15),
          {{((8'ha6) ? wire2 : wire12)}, $unsigned((8'hbb))}} & ((&(8'hb3)) ?
          (7'h40) : (^wire9[(3'h6):(3'h4)])));
      reg27 <= (8'had);
      reg28 <= {reg24,
          $signed($unsigned(((+wire4) ?
              (reg22 ? wire8 : reg18) : $signed(reg23))))};
      if (reg13[(1'h0):(1'h0)])
        begin
          if (((-(wire5[(4'ha):(2'h2)] != wire7)) ^ (~^wire0[(1'h1):(1'h1)])))
            begin
              reg29 <= reg22[(4'hc):(4'hb)];
            end
          else
            begin
              reg29 <= $unsigned((reg21 >= reg13[(3'h7):(3'h5)]));
              reg30 <= (|reg24);
              reg31 <= ((reg14[(3'h5):(2'h3)] >> reg28) * (8'hbe));
              reg32 <= reg18;
              reg33 <= (reg17 < ($signed($signed($signed(reg23))) ?
                  ($unsigned(wire1[(3'h7):(2'h2)]) >= (reg19 ?
                      (reg23 << wire1) : {wire0})) : wire7));
            end
        end
      else
        begin
          if ({($signed($unsigned(wire8[(1'h0):(1'h0)])) < reg14[(1'h0):(1'h0)]),
              ((8'had) | $signed(wire6))})
            begin
              reg29 <= $signed(wire6[(1'h1):(1'h0)]);
              reg30 <= ((reg14 << reg26[(3'h6):(2'h3)]) ?
                  (~&($signed((wire11 ^~ reg13)) ^~ ((reg14 ?
                      (8'haf) : reg29) != (reg32 ?
                      reg33 : reg25)))) : (~&reg33));
              reg31 <= (&reg21[(1'h1):(1'h1)]);
              reg32 <= ($signed(reg33) ^ reg25[(3'h4):(2'h2)]);
            end
          else
            begin
              reg29 <= $unsigned(reg33);
              reg30 <= (^~$signed((((~&reg13) * wire11[(2'h2):(2'h2)]) || ((reg28 ?
                  wire3 : reg28) & $signed(reg26)))));
              reg31 <= reg15;
              reg32 <= $unsigned($unsigned(reg23[(3'h7):(1'h1)]));
              reg33 <= wire11[(3'h6):(3'h4)];
            end
          if (reg33)
            begin
              reg34 <= ($signed((((reg15 ?
                      wire5 : reg32) * $unsigned(reg27)) < (reg27[(1'h0):(1'h0)] ?
                      {(8'hb7), (8'haa)} : wire11[(5'h10):(4'he)]))) ?
                  ((-reg33[(5'h10):(2'h2)]) ?
                      reg15[(2'h2):(1'h0)] : $signed(((7'h41) + {reg18}))) : wire5);
              reg35 <= (~|reg15[(1'h1):(1'h0)]);
              reg36 <= (8'hb9);
              reg37 <= wire8;
              reg38 <= reg27[(4'h8):(4'h8)];
            end
          else
            begin
              reg34 <= (wire1 ?
                  $signed(reg33[(1'h1):(1'h0)]) : ({reg21,
                          reg29[(3'h6):(3'h4)]} ?
                      (~^((wire8 ? reg14 : wire6) ?
                          reg37[(1'h0):(1'h0)] : wire3[(2'h2):(1'h0)])) : ($signed((reg33 >= reg37)) ?
                          ((wire3 ? wire8 : wire2) & {reg30,
                              (8'hbb)}) : reg22)));
              reg35 <= reg36;
              reg36 <= wire1;
              reg37 <= $unsigned($unsigned(($unsigned(reg14[(4'he):(3'h6)]) ?
                  reg14[(4'hf):(3'h5)] : ((wire1 ? reg14 : (8'hb2)) ?
                      $unsigned(reg28) : $signed(reg20)))));
              reg38 <= $signed(wire8);
            end
        end
    end
  assign wire39 = reg24;
  always
    @(posedge clk) begin
      reg40 <= ({$unsigned(wire11[(4'hb):(1'h1)])} ?
          reg24[(4'hf):(4'h8)] : ($signed($unsigned((^reg23))) ?
              reg27[(3'h6):(1'h1)] : ({$unsigned(reg35), reg21} ?
                  reg30[(4'ha):(1'h0)] : reg34[(1'h0):(1'h0)])));
      reg41 <= (((~|$unsigned(reg18[(2'h3):(2'h3)])) == (!((^reg26) ?
              wire3 : (reg36 ? reg28 : (8'hae))))) ?
          reg37 : reg32[(3'h4):(3'h4)]);
    end
endmodule
