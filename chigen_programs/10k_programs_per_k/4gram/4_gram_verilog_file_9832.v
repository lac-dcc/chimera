// Seed: 1617540281
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1 << id_2) id_3 = id_2;
endmodule
module module_1;
  assign id_1 = 1;
  module_0(
      id_1, id_1, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0(
      id_1, id_1, id_1
  );
  always @(posedge id_2[1]) begin
    id_4 = id_6;
  end
  wire id_7;
  assign id_4[1] = 1;
endmodule
