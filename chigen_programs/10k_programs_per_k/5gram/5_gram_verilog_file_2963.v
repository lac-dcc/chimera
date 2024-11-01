// Seed: 1738805411
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    for (id_5 = 1; id_2; id_4++) begin : id_6
      initial begin
        id_4 <= {$display(id_5, 1) {1'd0}};
      end
    end
  endgenerate
  module_0(
      id_5, id_3, id_5, id_5, id_1, id_2
  );
endmodule
