// Seed: 380334419
module automatic module_0 (
    input uwire id_0,
    output tri0 id_1,
    output supply0 id_2,
    output tri1 id_3,
    output supply1 id_4,
    input uwire id_5
);
  generate
    begin : LABEL_0
      begin : LABEL_0
        id_7(
            .id_0(1)
        );
      end
    end
    assign id_2 = id_5;
  endgenerate
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    output supply1 id_2,
    input logic id_3,
    input uwire id_4,
    input wand id_5,
    input wand id_6,
    output wire id_7,
    output wor id_8,
    input tri0 id_9,
    input wand id_10,
    output uwire id_11,
    input uwire id_12,
    output logic id_13
);
  assign id_8 = 1;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_11,
      id_7,
      id_8,
      id_9
  );
  always id_13 <= id_3;
endmodule
