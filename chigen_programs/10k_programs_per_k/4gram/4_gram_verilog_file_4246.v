// Seed: 2509660250
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3, id_4;
  module_2();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6[1] = 1;
  wire id_7;
  nor (id_6, id_2, id_5, id_1, id_4, id_7);
  module_0(
      id_7, id_2
  );
endmodule
module module_2;
  always @(id_1 - 1, negedge id_1) begin
    #1;
  end
endmodule
