// Seed: 2146180199
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9;
endmodule
module module_1 (
    output tri1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    input uwire id_6,
    output supply1 id_7,
    input tri0 id_8
);
  assign id_7 = ~id_2;
  wire id_10;
  supply0 id_11, id_12, id_13, id_14, id_15, id_16, id_17;
  id_18(
      .id_0(id_2++), .id_1(id_2 - id_16)
  ); module_0(
      id_15, id_16, id_17, id_14, id_13, id_13, id_17, id_10
  );
  wire id_19;
  assign {id_19, 1'b0 & 1'b0, id_4 + id_6, id_15} = 1;
  assign id_7 = 1'd0;
  wire id_20;
  assign id_17 = 1;
endmodule
