// Seed: 2185188732
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_6
  );
  always id_5 <= id_2;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  if (id_2[1'd0]) begin : LABEL_0
    id_5(
        1
    );
  end else begin : LABEL_0
    assign id_3 = id_3;
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_1
  );
endmodule
