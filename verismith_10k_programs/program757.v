module top
#(parameter param21 = ((~^((^{(8'ha1), (8'ha5)}) <= (((7'h42) && (8'ha0)) ~^ ((7'h41) ? (8'ha3) : (8'haf))))) ? ({(((8'hb9) != (8'ha0)) < ((8'ha2) ? (8'ha8) : (8'hab)))} ? {(-((8'hba) ? (8'h9d) : (7'h42)))} : ((~^(~|(7'h40))) * ((^~(8'hae)) ? (~|(8'hb3)) : ((8'hb7) ^~ (8'hbd))))) : (((~{(8'hb9), (8'hac)}) ? (!((8'hb4) | (8'hb8))) : ({(8'ha1), (7'h42)} ? ((8'h9e) ? (8'hb5) : (8'ha8)) : (^~(8'h9d)))) & ((^((8'hb2) - (8'h9c))) ^~ (((8'ha2) || (8'ha1)) > ((8'ha1) >= (7'h43)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = wire0;
  assign wire5 = wire3[(1'h1):(1'h0)];
  assign wire6 = (wire3[(1'h1):(1'h0)] ^ {wire0[(4'h9):(3'h5)],
                     $signed(wire3[(1'h1):(1'h1)])});
  assign wire7 = (((-({wire4} ?
                         wire1[(4'hc):(1'h0)] : (-(8'hbf)))) < ((+(!wire5)) ?
                         wire0 : {{wire0, (8'ha2)}, wire6})) ?
                     $signed((wire2 ?
                         wire0 : ($signed(wire4) | (wire3 ?
                             wire2 : (7'h44))))) : wire5);
  assign wire8 = (~^(|(8'hba)));
  always
    @(posedge clk) begin
      reg9 <= $unsigned((~|$signed((wire4 > $signed(wire4)))));
      if (((~(reg9 <= $unsigned((^wire5)))) <= $unsigned(($unsigned(((8'hbf) <<< (8'h9d))) ?
          wire3[(3'h4):(3'h4)] : (wire3[(1'h1):(1'h1)] ?
              wire0[(5'h13):(5'h13)] : (wire4 ? wire6 : (8'ha9)))))))
        begin
          reg10 <= $signed((-(~$unsigned(wire8))));
          if ((reg9[(4'ha):(4'h8)] ^ wire0[(4'ha):(3'h5)]))
            begin
              reg11 <= reg9;
              reg12 <= $unsigned((~|{($signed(reg9) <= $unsigned(wire5)),
                  ((wire4 == wire7) ~^ {wire5})}));
              reg13 <= wire0[(3'h6):(3'h5)];
              reg14 <= wire7;
            end
          else
            begin
              reg11 <= $signed(($signed($unsigned((&(8'hac)))) ?
                  ({$unsigned((8'hba))} ?
                      ($unsigned(wire7) ?
                          (8'hb9) : reg9[(4'hf):(3'h7)]) : reg14[(4'hb):(3'h4)]) : reg12[(2'h2):(1'h1)]));
              reg12 <= (~|(!$signed((~|(~|wire0)))));
              reg13 <= $signed(reg13);
              reg14 <= wire7;
              reg15 <= ((^$signed(reg12[(2'h3):(1'h1)])) >= reg11);
            end
          if ($signed(((((reg10 <= reg9) <= (~&wire1)) ?
              $unsigned((~reg13)) : wire1[(3'h4):(2'h3)]) > wire3)))
            begin
              reg16 <= wire7;
              reg17 <= $unsigned((8'hb5));
              reg18 <= wire6;
              reg19 <= $unsigned((^~((reg10[(3'h4):(1'h1)] ?
                  (|wire0) : ((8'haa) > wire1)) >= $signed((reg16 >>> wire8)))));
            end
          else
            begin
              reg16 <= $unsigned({$unsigned(reg19[(1'h0):(1'h0)]), wire8});
              reg17 <= (({((reg12 & reg10) ?
                      $signed(wire2) : (8'hbc))} * $unsigned($unsigned({wire0}))) && ((reg18[(2'h2):(1'h0)] ?
                      ((+reg15) ? (^reg9) : {wire4}) : reg13[(2'h3):(2'h2)]) ?
                  $signed(wire1) : wire2));
            end
        end
      else
        begin
          reg10 <= $signed($unsigned((&wire5[(2'h3):(1'h0)])));
          reg11 <= wire5[(1'h0):(1'h0)];
          reg12 <= (~|reg15);
        end
      reg20 <= $unsigned((8'h9e));
    end
endmodule
