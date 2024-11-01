// Seed: 1801463642
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_1(id_2);
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
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7 = id_7, id_8;
  module_0(
      id_8, id_7, id_6
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    if (1) begin
      genvar id_4;
      always @(posedge id_2) id_1 = id_3;
    end
  endgenerate
  always @(negedge 1 ** id_3) begin
    id_2 <= 1;
    id_3 = $display;
  end
  module_0(
      id_3, id_3, id_1
  );
endmodule
