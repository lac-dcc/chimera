// Seed: 3387119449
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  always @(id_2 or posedge 1) begin
    if (id_2) begin
      id_1 <= id_2;
    end
  end
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    .id_25(id_23),
    id_24
);
  output wire id_24;
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
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
  always @(posedge 1 ==? 1 - id_19) id_3 <= id_19;
  reg id_26, id_27 = id_19;
  xnor (
      id_23,
      id_21,
      id_28,
      id_27,
      id_14,
      id_3,
      id_6,
      id_8,
      id_2,
      id_19,
      id_25,
      id_9,
      id_20,
      id_12,
      id_10,
      id_15,
      id_7,
      id_22
  );
  id_28(
      .id_0(id_5), .id_1(id_2)
  ); module_0(
      id_3, id_26
  );
  wire id_29;
  wire id_30;
  assign id_1 = id_11++;
endmodule
