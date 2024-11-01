// Seed: 712022300
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_5(
      .id_0(id_3), .id_1(id_3), .id_2(1)
  ); id_6(
      .id_0(id_2)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  module_0(
      id_7, id_6, id_7, id_3
  ); id_8(
      .id_0(1), .id_1(1 == id_1)
  );
  generate
    always @(posedge 1)
      if (id_1) id_4 = 1;
      else begin
        id_4 <= (1);
      end
  endgenerate
endmodule
