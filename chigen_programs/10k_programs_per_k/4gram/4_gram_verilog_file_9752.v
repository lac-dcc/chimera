// Seed: 2047415871
module module_0 ();
  wire id_1;
endmodule
module module_1 (
    output wand id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    input uwire id_4,
    input wire id_5,
    input wand id_6
);
  module_0 modCall_1 ();
endmodule
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31
);
  inout wire id_31;
  inout wire id_30;
  inout wire id_29;
  inout wire id_28;
  input wire id_27;
  inout wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  inout wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_2 id_32;
  module_0 modCall_1 ();
  task id_33(input integer id_34);
    begin : LABEL_0
      id_7  = id_26 >= 'b0;
      id_22 = {id_10 - {id_27, 1}, 1};
      if (id_19) begin : LABEL_0
        id_22 <= id_31;
      end else begin : LABEL_0
        fork
          id_18#(
              .id_19(1),
              .id_2 (1),
              .id_28(1),
              .id_4 (1),
              .id_33(1)
          ) <= 1;
          id_22 <= 1;
        join_any
        $display(id_22, 1'b0);
      end
    end
  endtask
endmodule
