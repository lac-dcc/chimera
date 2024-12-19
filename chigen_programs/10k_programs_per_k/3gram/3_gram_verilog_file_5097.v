// Seed: 3467840128
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_3 = 0;
endmodule
module module_1;
  always_ff disable id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign id_1 = id_1;
endmodule
module module_2 (
    input tri0 id_0,
    output tri0 id_1,
    input wand id_2,
    input supply1 id_3,
    output wor id_4,
    input wire id_5,
    output wor id_6,
    output wire id_7,
    output uwire id_8,
    input wire id_9,
    input supply1 id_10
);
  assign module_3.id_19 = 0;
  id_12(
      .id_0(1), .id_1(1 - ~id_6)
  );
endmodule
module module_3 (
    input supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    inout supply0 id_3,
    input supply0 id_4,
    output wand id_5,
    output wand id_6,
    input uwire id_7,
    input tri id_8,
    input wor id_9,
    input supply1 id_10,
    output supply1 id_11,
    input wand id_12,
    input supply0 id_13,
    output supply0 id_14,
    output tri id_15,
    output wire id_16,
    input wand id_17
    , id_23,
    input tri0 id_18,
    input supply1 id_19,
    output supply0 id_20,
    input tri0 id_21
    , id_24
);
  assign id_23 = id_21;
  id_25(
      .id_0(id_1), .id_1(1'b0), .id_2(), .id_3({id_17{1}}), .id_4(id_9 << id_14), .id_5(1), .id_6(1)
  ); id_26 :
  assert property (@(negedge id_24) id_3)
  else begin : LABEL_0
    #0;
  end
  module_2 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_9,
      id_5,
      id_18,
      id_20,
      id_16,
      id_26,
      id_0,
      id_18
  );
  wire id_27;
  initial begin : LABEL_0
    id_11 = 1;
  end
  wire id_28;
endmodule
