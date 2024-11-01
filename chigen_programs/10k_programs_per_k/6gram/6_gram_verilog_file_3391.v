// Seed: 3942173006
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_3;
  wire id_4;
  assign id_2 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0(
      id_2, id_1, id_1
  );
  assign id_1 = 1;
  tri0 id_7 = 1;
  always @(posedge 1'b0) begin
    id_6 <= id_4 != id_1;
  end
endmodule
