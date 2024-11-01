// Seed: 1488484891
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
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_14;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8#(
        .id_9 (1),
        .id_10(id_11)
    ),
    id_12,
    id_13,
    id_14
);
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_15;
  initial
    #1 begin
      id_8 = 1;
    end
  id_16 :
  assert property (@(posedge 1 or posedge id_8 or id_3) ~1 - !id_9)
  else;
  module_0(
      id_8, id_13, id_13, id_15, id_9, id_4, id_7, id_4, id_13, id_14, id_9, id_12, id_12
  );
  wire id_17;
endmodule
