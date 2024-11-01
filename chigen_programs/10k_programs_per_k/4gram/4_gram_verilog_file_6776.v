// Seed: 3269026358
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  output wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  integer id_24;
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    input uwire id_3,
    input supply1 id_4
    , id_16,
    input uwire id_5,
    input tri id_6,
    input supply1 id_7,
    input supply0 id_8,
    output uwire id_9,
    output tri0 id_10,
    output logic id_11,
    input supply1 id_12,
    input tri0 id_13,
    input supply1 id_14
);
  reg id_17;
  module_0(
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16
  );
  always @* begin
    if (id_3) begin
      if (id_4) id_17 += 1;
    end
  end
  wire id_18;
  assign id_10 = 1;
  initial begin
    id_11 = #1 id_17;
  end
  id_19(
      .id_0(id_11), .id_1(id_18)
  ); id_20(
      .id_0(id_6), .id_1(1'b0), .id_2(id_7), .id_3(id_1), .id_4(1), .id_5(id_13), .id_6(1)
  );
endmodule
