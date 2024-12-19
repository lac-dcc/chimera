// Seed: 1789479521
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  function automatic id_19;
    input id_20;
    input id_21;
    begin : LABEL_0
      id_17 = 1 !=? id_3;
    end
  endfunction
  wire id_22;
  wire id_23;
  wire id_24;
  wire id_25 = id_24;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_4(
      1, id_2
  );
  or primCall (id_3, id_4, id_2);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3
  );
  logic [7:0] id_5;
  wire id_6 = id_5[1];
  wire id_7;
endmodule
