// Seed: 4068538082
module module_0 (
    input wand id_0,
    output tri0 id_1,
    output tri0 id_2,
    input uwire id_3,
    output supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    output tri id_7
);
  assign id_7 = 1'b0;
  wire id_9;
  wire id_10;
endmodule
macromodule module_1 (
    inout supply1 id_0,
    output logic id_1,
    input logic id_2,
    input logic id_3,
    output logic id_4,
    input tri0 id_5,
    input wor id_6,
    input tri1 id_7
);
  assign id_4 = id_3;
  logic id_9;
  assign id_9 = id_3;
  reg id_10 = 1 === 1;
  always begin : LABEL_0
    @(posedge id_3) if (id_5) id_1 = id_2;
  end
  assign id_10 = 1;
  assign id_1  = id_3;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_0,
      id_6,
      id_0,
      id_5,
      id_6,
      id_0
  );
  assign modCall_1.type_3 = 0;
  always begin : LABEL_0
    id_10 <= id_3;
  end
endmodule
