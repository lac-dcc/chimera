// Seed: 3902265412
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input wire id_2,
    output tri0 id_3,
    output tri id_4
);
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    output supply0 id_2,
    input uwire id_3,
    output wire id_4
);
  logic id_6 = -1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_4,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_8 = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7[id_8 : 1],
    _id_8
);
  input wire _id_8;
  inout logic [7:0] id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  localparam id_9 = 1;
endmodule
module module_3 #(
    parameter id_4 = 32'd81,
    parameter id_9 = 32'd46
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output uwire id_5;
  inout wire _id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = -1'b0;
  logic [7:0] id_7;
  ;
  localparam id_8 = -1, id_9 = 1'b0;
  module_2 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_8,
      id_8,
      id_6,
      id_7,
      id_9
  );
  assign id_5 = 1;
  assign id_7[id_9] = id_3;
  parameter id_10[-1 : !  id_4] = -1'b0;
  function void id_11;
    output [id_9 : -1] id_12;
    begin : LABEL_0
      id_12 <= id_6;
      id_12 <= id_7 * id_2;
    end
  endfunction
  localparam id_13 = id_10;
endmodule
