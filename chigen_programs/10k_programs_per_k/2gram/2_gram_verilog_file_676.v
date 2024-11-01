// Seed: 1239344624
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    output wand id_2,
    input wand id_3,
    input wire id_4,
    output wire id_5,
    output tri id_6,
    inout wand id_7,
    input wand id_8,
    output tri id_9,
    input tri id_10,
    output wand id_11,
    input supply0 id_12,
    input wor id_13,
    input tri id_14,
    output wor id_15,
    output tri id_16,
    output tri0 id_17,
    input tri1 id_18,
    output tri1 id_19,
    output tri0 id_20,
    output wand id_21
);
  assign id_7 = 1;
  supply1 id_23;
  assign id_9 = id_8;
  wire id_24;
  assign id_21 = 1;
  wire id_25;
  wire id_26;
  assign id_11 = 1;
  id_27 :
  assert property (@(negedge id_14 or posedge id_4) id_27)
  else;
  assign id_23 = 1;
  wire id_28;
endmodule
module module_1 (
    output logic id_0,
    inout wand id_1,
    supply0 id_6,
    input wor id_2,
    input wor id_3,
    input wor id_4
);
  always begin
    id_0 <= 1 - id_2;
  end
  assign id_1 = 1;
  id_7(
      1, id_1, 1, id_6, 1
  ); id_8(
      .id_0(id_6), .id_1(id_1), .id_2(1), .id_3(1'b0), .id_4(1), .id_5(1)
  ); module_0(
      id_1,
      id_6,
      id_6,
      id_1,
      id_3,
      id_1,
      id_6,
      id_6,
      id_3,
      id_6,
      id_3,
      id_6,
      id_6,
      id_3,
      id_2,
      id_6,
      id_6,
      id_1,
      id_3,
      id_6,
      id_6,
      id_6
  );
  wire id_9;
endmodule
