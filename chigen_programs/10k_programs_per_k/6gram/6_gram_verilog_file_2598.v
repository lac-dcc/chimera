// Seed: 124927179
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
  integer id_5 (
      .id_0(id_3),
      .id_1(1),
      .id_2(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  or (id_4, id_3, id_6, id_7);
  wire id_9;
  module_0(
      id_1, id_2, id_1, id_9
  );
  always @(id_7 or posedge 1) begin
    #1 #1;
  end
endmodule
