// Seed: 148368223
module module_0;
  wire id_2;
  assign module_1.id_4 = 0;
endmodule
program module_1 (
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
    id_16
);
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_2 or posedge "")
    if (id_7) deassign id_11.id_3;
    else if (1 ? {id_8, 1'b0} : id_3) id_1 = id_7;
    else begin : LABEL_0
      id_4 <= #1 id_15;
    end
  always_ff @(1 or posedge 1) id_1 <= id_15;
  module_0 modCall_1 ();
endprogram
