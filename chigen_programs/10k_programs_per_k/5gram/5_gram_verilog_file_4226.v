// Seed: 1356646705
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  genvar id_4;
  task automatic id_5;
    begin : LABEL_0
      assert (id_2[-1]);
      $signed(19);
      ;
      SystemTFIdentifier(1);
    end
  endtask
  wire id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_10 = 32'd95,
    parameter id_4  = 32'd29,
    parameter id_8  = 32'd37
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    id_11
);
  input wire id_11;
  output wire _id_10;
  output tri1 id_9;
  output wire _id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire _id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic [{  -1  } : -1] id_12;
  ;
  parameter id_13 = 1;
  logic [-1 : 1 'b0] id_14[id_4 : id_8];
  ;
  module_0 modCall_1 (
      id_13,
      id_14,
      id_11
  );
  logic [-1  <  id_8 : id_10] id_15 = id_14[-1];
  assign id_9 = -1;
endmodule
