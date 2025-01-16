// Seed: 223294547
module module_0 (
    output wand id_0,
    input wire id_1,
    output tri id_2,
    input tri1 id_3,
    input wand id_4,
    input supply0 id_5,
    input supply0 id_6,
    output tri1 id_7,
    input wire id_8,
    input tri0 id_9,
    output uwire id_10,
    output tri1 id_11,
    inout wire id_12,
    output supply0 id_13,
    input uwire id_14
);
  wire id_16;
  assign id_12 = id_3;
  wire id_17;
  assign id_10 = 1;
  id_18(
      id_10, id_5
  );
  assign id_2 = 1'b0;
  assign id_0 = 1'b0;
  assign id_2 = id_5;
  wire id_19, id_20, id_21;
endmodule
module module_1 (
    output wand void id_0,
    input tri1 id_1,
    output wor id_2,
    output supply1 id_3,
    input tri1 id_4,
    input tri1 id_5#(.id_8(1)),
    input tri id_6
);
  wire id_9;
  reg  \id_10 ;
  wand id_11, id_12;
  assign \id_10 = -1;
  reg id_13 = \id_10 ;
  id_14 :
  assert property (@(-1 or posedge id_5) id_12) begin : LABEL_0
    begin : LABEL_0
      begin : LABEL_0
        @(posedge (id_11 + id_13)) $display;
      end : SymbolIdentifier
    end
  end
  always \id_10 <= 1;
  wire id_15;
  wire id_16, id_17;
  integer id_18;
  wire id_19;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_12,
      id_4,
      id_6,
      id_5,
      id_6,
      id_14,
      id_4,
      id_4,
      id_14,
      id_12,
      id_14,
      id_3,
      id_11
  );
  supply1 id_20 = -1;
  assign id_2 = id_4;
  supply1 id_21 = id_20;
  assign id_0 = id_14;
  wire id_22, id_23;
endmodule
