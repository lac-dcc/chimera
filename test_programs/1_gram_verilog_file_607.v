// Seed: 1821322194
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  localparam id_11 = 1;
  wire id_12;
  parameter id_13 = -1;
  assign id_1 = 1;
  function id_14;
    output id_15;
    begin : LABEL_0
      id_1  = id_14;
      id_14 = id_11;
      id_1  <= -1;
      id_14 <= -1;
    end
  endfunction
  always $display(id_3, -1);
  always id_7 = id_11;
  wire id_16;
  assign (pull1, strong0) id_6 = id_10;
  supply0 id_17 = id_5, id_18;
  wire id_19;
  wire id_20;
  parameter id_21 = 1;
  assign id_7 = id_14;
  logic [7:0] id_22, id_23;
  logic [7:0] id_24;
  wire id_25;
  final id_22[-1] = id_11;
  wire id_26, \id_27 ;
  always id_14 <= id_2;
  wire id_28;
  wire id_29, id_30;
  assign id_1 = id_24[!1'b0];
  wire id_31;
  wire id_32;
  assign id_17 = id_4;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input tri   id_2
);
  assign id_4.id_4 = 1;
  bit id_5, id_6;
  always id_5 <= -1;
  wire id_7;
  tri  id_8;
  wire id_9;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_8,
      id_9,
      id_4,
      id_4,
      id_6,
      id_5,
      id_6,
      id_7
  );
  wire id_10;
  assign id_4 = id_1 ? id_0 || id_2 : id_8;
endmodule
