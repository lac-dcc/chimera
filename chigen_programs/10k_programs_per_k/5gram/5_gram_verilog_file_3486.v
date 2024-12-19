// Seed: 2373288256
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    input wand id_3
    , id_24,
    output tri0 id_4,
    input uwire id_5,
    input uwire id_6,
    input wand id_7,
    input uwire id_8,
    output wand id_9,
    output wand id_10,
    input wire id_11,
    input tri id_12,
    input uwire id_13,
    output uwire id_14,
    input wire id_15,
    output uwire id_16,
    input wor id_17,
    input tri id_18,
    input wor id_19,
    input supply0 id_20,
    input tri id_21,
    input tri id_22
);
  assign id_10 = id_2;
  wire id_25;
  assign module_1.type_4 = 0;
  wire id_26;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input logic id_2,
    output logic id_3,
    output logic id_4,
    output wor id_5,
    output tri id_6,
    output wire id_7,
    output tri1 id_8,
    input supply0 id_9,
    input supply1 id_10
);
  initial begin : LABEL_0
    id_3 <= id_10 || id_0;
    if ({(id_0), id_2}) begin : LABEL_0
      if (1) begin : LABEL_0
        id_4 <= id_2;
      end
    end
  end
  module_0 modCall_1 (
      id_0,
      id_9,
      id_1,
      id_9,
      id_7,
      id_1,
      id_10,
      id_0,
      id_0,
      id_6,
      id_7,
      id_9,
      id_9,
      id_0,
      id_8,
      id_9,
      id_7,
      id_10,
      id_0,
      id_1,
      id_10,
      id_9,
      id_9
  );
endmodule
