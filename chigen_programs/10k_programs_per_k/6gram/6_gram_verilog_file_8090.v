// Seed: 4081989350
module module_0 (
    output logic id_0,
    output tri   id_1,
    input  wire  id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  uwire id_5
);
  assign id_1 = 1 ? 1 : (id_4);
  initial id_0 <= 1;
endmodule
module module_1 (
    input  wire  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output logic id_3,
    output tri0  id_4
);
  reg  id_6;
  reg  id_7;
  wire id_8;
  initial begin : LABEL_0
    id_6 <= 1;
    if (1) begin : LABEL_0
      wait (id_0);
    end else begin : LABEL_0
      id_3 <= id_7;
    end
  end
  wire id_9 = 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.type_2 = 0;
  wire id_10;
endmodule
