// Seed: 1049679550
module module_0 ();
  id_1(
      .id_0(-1), .id_1(id_2 && id_2), .id_2('d0), .id_3(1'd0 + 1), .id_4(id_2)
  );
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  assign id_1 = id_0;
  id_3(
      id_3, id_0, id_3
  );
  always id_1 <= "";
endmodule
macromodule module_2 (
    id_1
);
  output wire id_1;
  final @(negedge {1'h0, id_2 !== id_2, id_2 & -1, -1, 1, id_2} or posedge id_2) id_1 <= -1'd0;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
