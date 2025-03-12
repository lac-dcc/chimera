// Seed: 2468222400
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    output wor id_2,
    output tri1 id_3,
    inout tri id_4,
    output wor id_5,
    output tri0 id_6,
    output supply0 id_7,
    output tri1 id_8,
    input wire id_9,
    output tri0 id_10,
    output tri id_11,
    input supply1 id_12,
    output uwire id_13,
    input wand id_14,
    input supply0 id_15,
    output wand id_16,
    input wire id_17,
    output wire id_18,
    input wand id_19,
    input uwire id_20,
    input tri0 id_21,
    input wor id_22,
    output wire id_23,
    output tri0 id_24
    , id_31,
    output tri1 id_25,
    output tri0 id_26,
    input tri1 id_27,
    output wand id_28,
    input wand id_29
    , id_32
);
  logic id_33;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd70,
    parameter id_15 = 32'd96
) (
    input tri id_0,
    output tri id_1,
    output supply0 id_2,
    input wor id_3,
    input supply1 id_4,
    input tri1 id_5,
    input tri id_6,
    input supply1 id_7,
    input wand id_8,
    output uwire id_9,
    input wor _id_10,
    input wire id_11,
    input wand id_12,
    input wand id_13,
    inout supply0 id_14,
    input wire _id_15,
    input supply0 id_16,
    input wor id_17,
    input supply1 id_18,
    input supply0 id_19
);
  struct packed {logic id_21;} id_22;
  id_23(
      1
  );
  supply1 id_24;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_1,
      id_2,
      id_14,
      id_14,
      id_24,
      id_2,
      id_2,
      id_14,
      id_9,
      id_1,
      id_24,
      id_24,
      id_8,
      id_17,
      id_24,
      id_11,
      id_1,
      id_6,
      id_4,
      id_18,
      id_14,
      id_2,
      id_9,
      id_1,
      id_1,
      id_18,
      id_1,
      id_0
  );
  logic id_25;
  localparam id_26 = -1'b0 - -1;
  union packed {
    union packed {
      logic id_27;
      logic id_28;
      logic id_29;
      logic id_30;
      struct packed {
        logic id_31;
        logic id_32;
        logic id_33;
        logic id_34;
      } id_35;
    } id_36;
    logic id_37;
  } id_38;
  ;
  wire id_39;
  parameter id_40 = id_26;
  always @(-1) if (id_26) id_25 = 1;
  logic id_41;
  wire id_42, id_43, id_44;
  wire id_45;
  wire [1 'h0 : -1 'b0] id_46;
  wire [~  1 : 1] id_47[id_15 : id_10];
endmodule
