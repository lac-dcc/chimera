// Seed: 2456565666
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
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_13, id_14;
  wire id_15;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3#(
        .id_4(1),
        .id_5(1),
        .id_6(id_7)
    ),
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14#(.id_15(1)),
    id_16
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  if (1) begin
    begin
      assign id_13 = id_14 && {id_6};
      assign id_11 = id_9;
    end
  end else wire id_17;
  wand id_18 = 1;
  module_0(
      id_5, id_12, id_2, id_4, id_10, id_3, id_14, id_13, id_17, id_6, id_17, id_18
  );
  assign id_12 = 1;
endmodule
