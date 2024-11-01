// Seed: 3436846772
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_18;
  wire id_19;
  assign id_14 = id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_1 ? 1 : 1;
  wire id_5;
  id_6(
      .id_0({id_2{1}}),
      .id_1(1),
      .id_2(id_3),
      .id_3(id_1),
      .id_4(1'h0),
      .id_5(id_3),
      .id_6(1),
      .id_7(1),
      .id_8(1 & id_3)
  ); module_0(
      id_3,
      id_1,
      id_1,
      id_4,
      id_3,
      id_4,
      id_5,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_1
  );
  reg id_7;
  supply1 id_8;
  wire id_9;
  always @(*) begin
    id_8 = 1;
    id_2 <= id_7;
    fork
      #1;
      #id_10 id_3 = 1;
    join
  end
endmodule
