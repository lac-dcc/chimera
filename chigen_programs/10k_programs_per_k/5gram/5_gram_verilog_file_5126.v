// Seed: 1457626006
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_1 = 1;
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
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  module_0(
      id_4, id_6
  );
  wire id_8;
endmodule
module module_2 #(
    parameter id_4 = 32'd60
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_5 = !id_5;
  initial begin
    $display(id_2);
    assign id_1 = 1'd0;
    release id_4[id_4];
    id_5 <= 1 & 1;
  end
  bufif0 (id_1, id_5, id_2);
  module_0(
      id_1, id_1
  );
endmodule
