// Seed: 4149937696
module module_0 (
    input tri id_0,
    input wor id_1,
    input supply0 id_2,
    input uwire id_3,
    output supply1 id_4,
    input uwire id_5,
    output logic id_6,
    input wire id_7,
    output supply0 id_8,
    input tri0 id_9,
    output tri1 id_10,
    input tri0 id_11,
    input uwire id_12,
    input uwire id_13,
    output logic id_14,
    input supply0 id_15,
    input supply0 id_16
);
  initial begin : LABEL_0
    id_14 = 1;
  end
  assign module_1.id_24 = 0;
  logic id_18;
  always @(*) id_6 = -1;
  assign id_6 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd4,
    parameter id_17 = 32'd71,
    parameter id_2  = 32'd61,
    parameter id_23 = 32'd33
) (
    output wor id_0,
    output uwire id_1,
    output uwire _id_2,
    input wire id_3,
    output supply0 id_4,
    output tri0 id_5,
    output supply0 id_6,
    input wor id_7
    , id_27,
    output tri1 id_8,
    output logic id_9,
    output wor id_10,
    input supply0 id_11,
    input tri1 _id_12,
    input uwire id_13,
    output tri id_14,
    input supply1 id_15,
    input tri id_16,
    input tri0 _id_17,
    input tri id_18,
    input tri1 id_19,
    output wire id_20,
    input wire id_21
    , id_28,
    output tri id_22,
    input tri1 _id_23,
    input tri0 id_24,
    input supply1 id_25
);
  reg id_29;
  static logic id_30;
  wire [1 : id_23] id_31;
  parameter id_32 = -1;
  localparam id_33 = id_32[1 : id_17];
  wire id_34 = -1;
  wire [1 'd0 |  -1 : -1] id_35;
  assign id_14 = id_25 ? -1 ^ 1 - 'b0 : -1;
  module_0 modCall_1 (
      id_21,
      id_15,
      id_11,
      id_11,
      id_14,
      id_13,
      id_9,
      id_25,
      id_6,
      id_18,
      id_8,
      id_11,
      id_25,
      id_25,
      id_9,
      id_24,
      id_15
  );
  wire id_36;
  wire id_37;
  static logic [id_2 : id_12] id_38 = id_27;
  initial begin : LABEL_0
    id_9  <= (id_13);
    id_29 <= 1 * 1;
    disable id_39;
    id_28 = (1);
    ;
  end
  logic id_40;
  ;
  assign id_10 = {id_18, 1};
endmodule
