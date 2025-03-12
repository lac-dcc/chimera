// Seed: 2549015287
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wor id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_4;
  assign id_3 = 1 + id_5;
  logic id_10 = -1'b0;
  wire  id_11;
endmodule
module module_1 #(
    parameter id_15 = 32'd31
) (
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
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire _id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire  id_20;
  wire  id_21;
  wire  id_22;
  logic id_23;
  ;
  logic id_24 = 1 & -1, id_25;
  struct packed {logic [id_15  <  -1 'b0 : -1] id_26;} id_27;
  ;
  task id_28;
    begin : LABEL_0
      id_27 = -1;
    end
  endtask
  module_0 modCall_1 (
      id_22,
      id_4,
      id_11,
      id_24,
      id_28,
      id_20,
      id_18,
      id_3,
      id_11
  );
  always @(posedge -1) #(id_25);
  specify
    (negedge id_29 => (id_30 +: 1)) = (id_7  : -1  : -1, 1'd0);
    (id_31 => id_32) = (-1  : 1  : id_19, id_8  : 1'b0 : id_12);
    (id_33 => id_34) = (id_34);
  endspecify
endmodule
