// Seed: 3054505138
module module_0 #(
    parameter id_4 = 32'd39
) (
    output logic id_0,
    input  tri0  id_1
);
  assign id_0 = -1;
  assign id_0 = -1;
  bit id_3;
  assign id_0 = id_1;
  parameter id_4 = 1;
  reg id_5;
  initial begin : LABEL_0
    id_5 = id_1 - id_3;
    id_0 = id_5 <-> -1;
  end
  initial begin : LABEL_1
    id_3 <= -1;
  end
  assign id_0 = id_3;
  generate
    defparam id_4.id_4 = id_4;
  endgenerate
  assign id_3 = id_3;
endmodule
module module_1 #(
    parameter id_10 = 32'd46,
    parameter id_2  = 32'd39,
    parameter id_3  = 32'd11,
    parameter id_7  = 32'd83
) (
    input uwire id_0,
    input tri id_1,
    input supply1 _id_2,
    input wire _id_3,
    input tri id_4,
    output uwire id_5,
    input wand id_6,
    input wand _id_7,
    input tri id_8,
    input wor id_9,
    input wand _id_10,
    output tri id_11,
    output logic id_12,
    input supply1 id_13
);
  logic [-1 : id_3] id_15;
  id_16 :
  assert property (@(posedge id_0) id_13)
  else begin : LABEL_0
    id_12 = 1;
  end
  assign id_16[1] = "";
  wire [(  id_10  ) : id_2] id_17;
  wire [id_7 : -1] id_18;
  wire id_19;
  parameter id_20 = 1;
  localparam id_21 = id_20;
  module_0 modCall_1 (
      id_12,
      id_4
  );
endmodule
