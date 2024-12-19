// Seed: 1217105181
module module_0 (
    input wor  id_0,
    input tri0 id_1,
    input tri1 id_2
);
  assign id_4 = 1;
  assign module_2.type_2 = 0;
  tri0 id_5 = id_0;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  logic id_4;
  assign id_0 = id_4;
  always_latch @(id_1 == "" or 1) begin : LABEL_0
    id_4 <= 1'b0;
  end
endmodule
module module_2 (
    input supply1 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input uwire id_3,
    output wire id_4,
    input supply0 id_5,
    output wire id_6
);
  always @(posedge 1) id_4 = id_0;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5
  );
endmodule
