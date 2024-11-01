// Seed: 578400965
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
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always
    if (id_6) id_1 = id_2;
    else begin : id_14
      $display;
    end
  wire id_15;
  wire id_16, id_17, id_18;
  wire id_19;
  wire id_20;
  integer id_21 (.id_0(~~1));
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output tri1 id_2,
    input tri id_3
);
  assign id_2 = id_1;
  wire id_5, id_6, id_7, id_8, id_9;
  module_0(
      id_5, id_9, id_5, id_9, id_6, id_6, id_7, id_7, id_8, id_5, id_9, id_6, id_6
  );
  integer id_10 = (id_10);
  logic [7:0][1 'b0] id_11 = id_11;
  id_12(
      .id_0(1), .id_1(1), .id_2(id_11), .id_3(), .id_4(!(id_10)), .id_5(id_8)
  ); id_13 :
  assert property (@(*) {1}) id_10 = id_6;
  wire id_14;
endmodule
