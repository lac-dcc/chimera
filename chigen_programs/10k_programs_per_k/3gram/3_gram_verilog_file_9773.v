// Seed: 666659565
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  assign module_1.id_0 = 0;
  inout wire id_1;
  assign id_1 = -1;
endmodule
module module_1 (
    inout wire id_0
);
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2
  );
  static logic id_3;
endmodule
module module_2 #(
    parameter id_3 = 32'd11,
    parameter id_9 = 32'd41
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  input wire _id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_2 = id_1[1!=id_3];
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_2
  );
  tri1 id_8 = -1;
  _id_9 :
  assert property (@(posedge id_5[-1 :-1'b0&&id_9]) 'b0)
  else {id_5, id_8 & 1, id_1} += 1;
endmodule
