// Seed: 634276905
module module_0 #(
    parameter id_25 = 32'd30,
    parameter id_26 = 32'd84
) (
    output tri0 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output wand id_3,
    output tri0 id_4,
    input wand id_5,
    input tri0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    output uwire id_9,
    input tri1 id_10,
    input wire id_11,
    output tri id_12,
    input tri1 id_13,
    output supply1 id_14,
    input tri id_15,
    input supply1 id_16,
    output wire id_17,
    input supply0 id_18,
    output uwire id_19,
    input uwire id_20
    , id_24,
    output wire id_21,
    output wand id_22
);
  defparam id_25.id_26 = 1;
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1,
    output wire id_2,
    output wand id_3,
    input supply0 id_4,
    output supply0 id_5,
    output supply1 id_6
);
  uwire id_8;
  initial begin : LABEL_0
    id_2 = id_1;
    id_0#(
        .id_4(1),
        .id_4(1 << 1)
    ) = new(
        1, 0
    );
    $display(id_4, id_8, id_4, 1);
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_6,
      id_4,
      id_1,
      id_4,
      id_8,
      id_3,
      id_4,
      id_8,
      id_5,
      id_8,
      id_2,
      id_8,
      id_8,
      id_8,
      id_8,
      id_6,
      id_4,
      id_3,
      id_8
  );
endmodule
