// Seed: 3238231804
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input uwire id_2,
    input wor id_3
);
  wire id_5, id_6;
  id_7(
      .id_0(1), .id_1("")
  );
endmodule
module module_1 (
    input tri1 id_0
    , id_9,
    input tri0 id_1,
    output supply1 id_2,
    input wand id_3,
    input uwire id_4,
    input wand id_5,
    output uwire id_6,
    input tri id_7
);
  wire id_10;
  module_0(
      id_6, id_2, id_4, id_1
  );
endmodule
module module_2;
  wire id_2;
endmodule
module module_3 (
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_12 = id_1;
  wire id_23;
  module_2(); id_24 :
  assert property (@(posedge 'b0) ~id_12)
  else begin
    id_21 <= 1;
  end
  always @(id_11);
  nor (id_10, id_11, id_12, id_13, id_14, id_15, id_20, id_21, id_22, id_23, id_7, id_8, id_9);
  wire id_25;
endmodule
