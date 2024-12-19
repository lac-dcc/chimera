// Seed: 546902824
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output wire id_3,
    input uwire id_4,
    output supply0 id_5,
    output wand id_6,
    input tri0 id_7,
    input wire id_8,
    input wor id_9,
    input supply0 id_10
);
  genvar id_12;
endmodule
module module_1 (
    input supply1 id_0,
    input logic id_1,
    input tri id_2,
    input tri id_3,
    output logic id_4,
    output supply1 id_5,
    input supply0 id_6,
    output wire id_7
);
  always begin : LABEL_0$display
    ;
  end
  if (1) begin : LABEL_0
    id_9(
        .id_0(1 & (id_7)), .id_1(id_5)
    );
  end else begin : LABEL_0
    wire id_10;
  end
  always begin : LABEL_0
    id_4 <= id_1;
  end
  always begin : LABEL_0
    id_7 = 1;
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_5,
      id_3,
      id_5,
      id_7,
      id_0,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.type_17 = 0;
endmodule
