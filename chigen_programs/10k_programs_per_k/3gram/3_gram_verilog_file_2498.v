// Seed: 1446152941
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input tri id_2,
    output tri0 id_3,
    input supply1 id_4,
    output tri id_5,
    output tri0 id_6,
    output wand id_7,
    input tri1 id_8,
    input tri0 id_9,
    input wor id_10,
    input uwire id_11,
    input wand id_12,
    input tri1 id_13,
    input wire id_14,
    input tri0 id_15,
    input uwire id_16
    , id_34, id_35,
    input tri0 id_17,
    output wor id_18,
    output tri1 id_19,
    input tri0 id_20,
    output wire id_21,
    output tri0 id_22,
    output wire id_23,
    input wor id_24
    , id_36,
    input wire id_25,
    output tri1 id_26,
    output logic id_27,
    input supply0 id_28,
    input wand id_29,
    input wand id_30,
    output logic id_31,
    input supply1 id_32
);
  assign id_3 = id_25;
  id_37(
      .id_0(1), .id_1(id_0), .id_2({1, id_30}), .id_3(id_25)
  ); module_0(
      id_36, id_35, id_34, id_35, id_35
  );
  wire id_38;
  wire id_39;
  id_40 :
  assert property (@(posedge id_16) !1)
  else begin
    id_31 <= id_34++;
    id_27 <= (1);
  end
endmodule
