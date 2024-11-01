// Seed: 4049329709
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  if (id_4) assign id_3 = 1;
  else begin : id_6
    assign id_2[1] = id_3;
    wire id_7;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_12;
  module_0(
      id_11, id_4, id_2, id_10, id_6
  );
  assign id_4[(1)-:1] = 1;
  initial begin
    $display(1);
  end
endmodule
