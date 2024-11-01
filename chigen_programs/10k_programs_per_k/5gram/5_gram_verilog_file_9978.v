// Seed: 3907937834
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_4++ == id_1;
  always @(0) begin
    #1;
  end
  uwire id_6 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  initial begin
    id_3 <= 1 && id_2;
  end
  module_0(
      id_2, id_1, id_2, id_1, id_2
  );
endmodule
