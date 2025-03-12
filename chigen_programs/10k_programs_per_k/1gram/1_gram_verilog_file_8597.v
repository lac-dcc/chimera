// Seed: 3090308302
module module_0 (
    input wand id_0,
    input wire id_1,
    output uwire id_2,
    output supply1 id_3
    , id_18,
    input wor id_4,
    output wire id_5,
    input supply1 id_6,
    output supply1 id_7,
    output tri0 id_8,
    output tri0 id_9,
    output supply1 id_10,
    input wor id_11,
    input wire id_12,
    input wand id_13,
    output wand id_14,
    output tri id_15,
    input wand id_16
);
  assign id_7 = id_0;
  logic id_19;
endmodule
module module_1 #(
    parameter id_16 = 32'd91,
    parameter id_19 = 32'd53,
    parameter id_28 = 32'd43,
    parameter id_30 = 32'd73,
    parameter id_34 = 32'd28,
    parameter id_8  = 32'd25
) (
    input wor id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri0 id_3,
    output wire id_4,
    output tri0 id_5,
    input wire id_6,
    input wand id_7,
    input wire _id_8,
    output tri0 id_9
    , _id_34 = 1,
    input supply1 id_10,
    input wor id_11,
    output tri1 id_12[SystemTFIdentifier : 1],
    input tri1 id_13,
    input supply0 id_14,
    input tri1 id_15,
    input wor _id_16,
    input supply0 id_17,
    output tri0 id_18[id_16 : ""],
    input supply0 _id_19,
    output wor id_20,
    input uwire id_21,
    input wor id_22,
    input uwire id_23
    , id_35,
    output wire id_24,
    output uwire id_25,
    input tri id_26,
    input supply1 id_27,
    input tri _id_28,
    input tri0 id_29,
    input tri _id_30,
    output tri1 id_31,
    input wand id_32
);
  wire [id_30 : id_19  &  (  id_19  )  &&  id_34] id_36, id_37;
  assign id_4 = 1;
  wire id_38;
  assign id_9 = -1;
  logic id_39;
  assign id_20 = -1;
  logic [id_28 : 1] id_40;
  assign id_12 = -1;
  id_41 :
  assert property (@(posedge id_28) id_7) begin : LABEL_0
    id_41 = 1;
  end
  wire [id_8 : 1] id_42;
  or primCall (
      id_4,
      id_2,
      id_13,
      id_7,
      id_44,
      id_1,
      id_3,
      id_40,
      id_15,
      id_11,
      id_10,
      id_26,
      id_41,
      id_14,
      id_0,
      id_32,
      id_39,
      id_35,
      id_21,
      id_42,
      id_22,
      id_27,
      id_36,
      id_38,
      id_23,
      id_17,
      id_43,
      id_6
  );
  wire id_43;
  assign id_36 = id_1;
  logic id_44;
  module_0 modCall_1 (
      id_14,
      id_21,
      id_18,
      id_31,
      id_10,
      id_31,
      id_2,
      id_9,
      id_12,
      id_9,
      id_9,
      id_15,
      id_32,
      id_1,
      id_25,
      id_25,
      id_29
  );
endmodule
