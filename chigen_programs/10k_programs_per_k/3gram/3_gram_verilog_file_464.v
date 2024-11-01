// Seed: 2915591303
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7 = id_3;
  id_8(
      .id_0(id_1), .id_1(1), .id_2(id_3), .id_3(1), .id_4(id_6)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0(
      id_3, id_3, id_1, id_1, id_3
  );
  always @(posedge 1) begin
    #1 id_2 <= 1;
  end
endmodule
