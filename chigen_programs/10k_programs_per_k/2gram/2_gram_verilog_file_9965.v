// Seed: 3403104531
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7#(
        .id_8(1),
        .id_9(1)
    ),
    id_10,
    id_11,
    id_12
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6 = id_6 - id_8;
  wire id_13 = id_3, id_14, id_15;
  wire id_16;
  if (id_8) begin
    assign id_6 = 1;
  end else begin
    assign id_4 = 1;
    id_17(
        id_11
    );
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  module_0(
      id_4, id_6, id_6, id_6, id_3, id_6, id_5, id_5, id_4, id_6
  );
endmodule
