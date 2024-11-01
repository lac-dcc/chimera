// Seed: 1356288060
module module_0 (
    output uwire id_0,
    input tri id_1,
    input uwire id_2,
    input supply1 id_3,
    output tri id_4
);
  assign id_4 = 1'b0;
  always disable id_6;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wire id_3,
    output wire id_4
);
  id_6(
      .id_0(1), .id_1(1), .id_2(id_4)
  ); module_0(
      id_4, id_2, id_2, id_1, id_4
  );
  generate
    always id_0 = #1 1;
  endgenerate
endmodule
