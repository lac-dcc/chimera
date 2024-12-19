// Seed: 2773061935
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    output supply0 id_4,
    input wire id_5,
    input uwire id_6,
    input tri id_7,
    output wor id_8,
    input tri1 id_9,
    output uwire id_10,
    output wand id_11
    , id_24,
    output tri1 id_12,
    input tri1 id_13,
    input wor id_14,
    output wor id_15,
    output tri id_16,
    input wire id_17,
    output wand id_18,
    input wire id_19,
    output wor id_20,
    output uwire id_21
    , id_25,
    output wire id_22
);
  wire id_26;
  wire id_27;
  assign id_24 = id_2;
  wire id_28;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output logic id_3,
    input  wand  id_4,
    input  tri1  id_5,
    input  tri1  id_6,
    input  wand  id_7
);
  reg id_9;
  reg id_10 = 1;
  initial id_9 <= 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_0,
      id_0,
      id_5,
      id_6,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_4,
      id_0,
      id_0,
      id_2,
      id_0,
      id_6,
      id_0,
      id_0,
      id_0
  );
  always @(posedge id_1 or posedge 1'b0 == 1'h0) begin : LABEL_0
    deassign id_0;
    id_3  <= 1'b0 < "";
    id_10 <= 1;
  end
endmodule
