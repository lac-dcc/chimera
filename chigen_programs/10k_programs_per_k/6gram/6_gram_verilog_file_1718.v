// Seed: 4045765759
module module_0 (
    input wor id_0
    , id_20,
    output tri id_1,
    output wire id_2,
    output wire id_3,
    input wire id_4,
    input wand id_5
    , id_21,
    input wor id_6,
    input uwire id_7,
    input supply1 id_8,
    output tri1 id_9,
    output uwire id_10,
    input uwire id_11,
    input tri0 id_12,
    input wand id_13,
    input wire id_14,
    output wor id_15,
    output tri id_16,
    input tri1 id_17,
    input wand id_18
);
  logic id_22 = "";
  assign id_20[1] = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1
    , id_8,
    input wire id_2,
    input tri id_3,
    output uwire id_4,
    output logic id_5,
    output wor id_6
);
  always @(1 or 1) begin : LABEL_0
    casex (id_3)
      -1: begin : LABEL_1
        force id_6 = 1;
      end
      1: id_5 = id_8;
      ~id_2: begin : LABEL_2
        id_5 = -1;
      end
    endcase
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_6,
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_6,
      id_4,
      id_0,
      id_3,
      id_3,
      id_2,
      id_6,
      id_6,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
