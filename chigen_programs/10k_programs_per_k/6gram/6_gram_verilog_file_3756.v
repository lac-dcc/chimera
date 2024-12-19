// Seed: 2546673942
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input supply0 id_0
    , id_4,
    input tri0 id_1,
    input wand id_2
);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
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
  output wire id_1;
  wire id_5;
  assign id_1[1'b0-1] = 1;
  id_6(
      .id_0(), .id_1(id_5), .id_2(1), .id_3(1'b0)
  );
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3
  );
  always @(*) begin : LABEL_0
    wait (id_2);
  end
endmodule
