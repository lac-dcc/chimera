// Seed: 1442473645
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  logic [7:0] id_3;
  assign id_2 = ~id_3[1];
  assign id_3 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_13[1] = id_7;
  generate
    for (
        id_15 = 1;
        ~id_12#(
            .id_3 (id_1[""]),
            .id_12(1)
        );
        id_4 = 1
    ) begin : id_16
      always @(posedge 1'b0) begin
        id_8 <= 1 | 1;
      end
    end
  endgenerate
  module_0(
      id_6, id_15
  );
endmodule
