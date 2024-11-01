// Seed: 4134157488
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    if (1) begin
      assign id_1 = id_4 < 1;
    end else begin : id_5
      id_6(
          1, id_1, 1
      );
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0(
      id_1, id_1, id_1, id_1
  );
  wire id_5 = id_2;
  wire id_6;
  assign id_6 = !{1, 1};
endmodule
