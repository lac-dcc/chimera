// Seed: 123584793
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    output wor id_2,
    input tri0 id_3,
    input wand id_4,
    output wire id_5,
    input wire id_6
);
  assign id_5 = 1;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output logic id_2,
    input supply1 id_3,
    input wand id_4,
    input wor id_5,
    input wand id_6,
    input tri id_7,
    input supply1 id_8,
    input wand id_9,
    input tri1 id_10,
    input uwire id_11,
    input tri0 id_12,
    output tri1 id_13,
    input wor id_14,
    output tri id_15,
    input tri1 id_16,
    input tri0 id_17,
    input tri0 id_18,
    input tri id_19,
    output tri0 id_20,
    output tri1 id_21,
    input supply0 id_22,
    input tri0 id_23,
    output tri1 id_24,
    input wire id_25
);
  assign id_20 = id_4;
  initial begin : LABEL_0
    @(id_23) begin : LABEL_1
      if (1) begin : LABEL_2
        $clog2(61);
        ;
        id_2 <= id_25;
        id_2 <= id_23;
      end
    end
  end
  module_0 modCall_1 (
      id_24,
      id_20,
      id_20,
      id_9,
      id_8,
      id_13,
      id_14
  );
endmodule
