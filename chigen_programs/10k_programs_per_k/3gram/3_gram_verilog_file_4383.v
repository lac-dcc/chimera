// Seed: 2920988422
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
    id_17,
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
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
  wire id_19;
  wire id_20 = id_8;
  wire id_21;
  wire id_22;
  wire id_23;
  always @(1 or id_2)
    if (id_7) id_13 <= id_12;
    else id_12 <= id_14;
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
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_7;
  always disable id_8;
  always @(1 or posedge id_3 == id_6) begin
    id_2 <= id_7;
  end
  task id_9;
    id_6 <= 1;
  endtask
  assign id_7 = 1;
  id_10(
      .id_0(id_4[1 : 1]),
      .id_1(id_9),
      .id_2(1 - id_2),
      .id_3(id_3),
      .id_4(id_7),
      .id_5(id_8),
      .id_6(1),
      .id_7(id_9),
      .id_8(id_5),
      .id_9(1 || 1'b0)
  ); module_0(
      id_8,
      id_8,
      id_5,
      id_9,
      id_5,
      id_8,
      id_3,
      id_5,
      id_8,
      id_9,
      id_8,
      id_7,
      id_6,
      id_2,
      id_9,
      id_8,
      id_8,
      id_8
  );
endmodule
