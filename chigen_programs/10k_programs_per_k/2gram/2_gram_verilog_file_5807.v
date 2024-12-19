// Seed: 3351259644
module module_0 (
    id_1
);
  inout wire id_1;
  always begin : LABEL_0
    id_1 = id_1;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd51,
    parameter id_6 = 32'd37
) (
    output tri id_0,
    output supply1 id_1,
    output tri0 id_2,
    output tri1 id_3
);
  generate
    defparam id_5.id_6 = id_5; id_7(
        .id_0(id_5)
    );
    wire id_8;
    genvar id_9;
  endgenerate
  wire id_10;
  module_0 modCall_1 (id_10);
endmodule
module module_2 (
    input wor id_0
);
  initial if (1'b0) id_2 = 1;
  assign id_2 = id_2;
  wire id_3;
  wire id_4;
  wire id_5;
  id_6(
      .id_0(1)
  );
  wire id_7;
  wire id_8;
  assign module_3.id_6 = 0;
endmodule
module module_3 (
    input  wire  id_0,
    input  tri   id_1,
    input  uwire id_2,
    output wand  id_3,
    input  logic id_4,
    output logic id_5,
    output wor   id_6
);
  always begin : LABEL_0
    if (id_2) $display(1);
    id_5 <= id_4;
    id_5 <= 1;
    wait (id_1);
  end
  id_8(
      .id_0(1), .id_1(""), .id_2(id_2), .id_3(1), .id_4(1), .id_5(id_3), .id_6(id_6)
  );
  module_2 modCall_1 (id_2);
endmodule
