// Seed: 211217249
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input wor id_2
);
  tri id_4;
  wire [-1 : -1 'd0] id_5;
  assign id_4 = id_4 * id_2;
  localparam id_6 = -1'b0;
  wire id_7;
  ;
  wire id_8;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd31,
    parameter id_3 = 32'd81,
    parameter id_9 = 32'd30
) (
    input  wand  id_0,
    input  tri1  _id_1,
    output logic id_2,
    input  tri0  _id_3,
    input  wand  id_4
);
  logic id_6;
  ;
  logic [{  id_1  {  id_3  +  1  }  } : id_1] id_7;
  always id_2 <= -1;
  assign id_7 = (id_7) & {id_0, -1 + id_7};
  always begin : LABEL_0
    id_7 = id_0;
  end
  assign id_2 = -1;
  id_8 :
  assert property (@(negedge 1 or 1) id_3)
  else;
  initial if (1'd0) id_6 = id_0;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4
  );
  parameter id_9 = -1 ? -1 : 1 << 1;
  wire [-1 : -1 'b0] id_10;
  defparam id_9.id_9 = 1;
endmodule
