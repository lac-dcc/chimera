// Seed: 2760968885
module module_2 #(
    parameter id_10 = 32'd35,
    parameter id_11 = 32'd77
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  assign id_4 = id_5;
  wire id_8;
  module_0 id_9;
  defparam id_10.id_11 = 1;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wire  id_1,
    input  logic id_2,
    input  tri   id_3,
    input  uwire id_4,
    output logic id_5,
    input  tri0  id_6
);
  assign id_5 = id_2;
  reg id_8;
  always #(id_1) begin
    if (id_1) id_5 <= 1;
    else id_8 <= 1'b0;
  end
  tri1 id_9, id_10, id_11;
  module_0(
      id_11, id_11, id_11, id_9, id_9
  );
  generate
    for (id_12 = 1'b0; id_0 - 1; id_5 = 1) begin
      id_13(
          .id_0(id_6 == id_9), .id_1(1), .id_2(1), .id_3(1)
      );
    end
  endgenerate
endmodule
