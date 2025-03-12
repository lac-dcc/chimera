// Seed: 3585123985
module module_0 #(
    parameter id_8 = 32'd14
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  input wire _id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output supply0 id_1;
  assign #id_9 id_1 = -1'b0;
  wire id_10;
  logic id_11 = 1;
  wire [-1 : id_8] id_12;
  wire id_13;
endmodule
module module_1 #(
    parameter id_1 = 32'd22,
    parameter id_3 = 32'd92,
    parameter id_4 = 32'd51
) ();
  parameter id_1 = 1;
  specify
    if (1) (negedge id_2 => (_id_3 +: id_1)) = (1, -1);
  endspecify
  wire [id_1  ||  {  1  {  -1 'b0 -  id_3  }  } : -1] _id_4;
  wire [id_1 : -1] id_5;
  logic [-1 : id_4] id_6;
  parameter [id_3 : 1  !==  1] id_7 = (1 ? 1 : id_1);
  module_0 modCall_1 (
      id_6,
      id_6,
      id_7,
      id_6,
      id_6,
      id_2,
      id_5,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
