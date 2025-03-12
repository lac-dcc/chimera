// Seed: 2294608434
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd43
) (
    output supply0 id_0,
    input  supply0 _id_1,
    output supply1 id_2,
    input  supply0 id_3,
    output logic   id_4
);
  bit [id_1 : -1 'h0] id_6, id_7, id_8;
  localparam id_9 = -1'b0;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9
  );
  reg id_10;
  assign id_8 = -1;
  initial begin : LABEL_0
    $signed(25);
    ;
    begin : LABEL_1
      id_10 = -1'b0;
      id_4 <= #id_6 id_8;
    end
    @(-1);
    id_8 <= id_8;
  end
  wire id_11;
  wire id_12;
  parameter id_13 = id_9;
  struct packed {
    logic id_14;
    logic id_15;
  } id_16;
  ;
  wire id_17;
  integer id_18;
endmodule
