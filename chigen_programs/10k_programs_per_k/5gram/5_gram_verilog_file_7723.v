// Seed: 29844214
module module_0 (
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
    id_11
);
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  tri1 id_12 = 1;
  generate
    assign id_12 = 1;
    for (id_13 = id_9 - id_1; 1; id_5 = 1) begin : id_14
      for (id_15 = 1'b0; id_9; id_14 = 1'b0) begin : id_16
        assign id_8[1] = id_7 ? 1'd0 : !(id_10);
        assign id_13   = 1;
        assign id_8[1] = (1'b0);
      end
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5[1-'b0] = id_1 - 1;
  module_0(
      id_1, id_6, id_7, id_3, id_6, id_4, id_6, id_5, id_1, id_6, id_4
  );
endmodule
