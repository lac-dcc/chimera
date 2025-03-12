// Seed: 2768653564
module module_0 ();
  struct packed {
    union packed {
      logic id_1  = 1 - 1;
      time  id_2;
      logic id_3;
    } id_4;
    logic id_5 = 1;
  } id_6;
  logic id_7;
  assign id_6.id_4 = id_7;
  assign id_6.id_4[-1][-1] = 1;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wand id_4,
    input wire id_5,
    inout uwire id_6,
    output supply0 id_7,
    input tri0 id_8,
    output tri1 id_9,
    input wand id_10
    , id_14,
    output uwire id_11,
    input wand id_12
);
  assign id_9 = id_5;
  union packed {
    logic   id_15;
    integer id_16;
    logic   id_17;
    logic   id_18;
    logic   id_19;
    logic   id_20;
    logic   id_21;
  } id_22 = id_8;
  xor primCall (
      id_1,
      id_10,
      id_12,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_2,
      id_20,
      id_21,
      id_22,
      id_4,
      id_5,
      id_6,
      id_8
  );
  module_0 modCall_1 ();
  always begin : LABEL_0
    id_22.id_18 = -1;
  end
  wire [-1 'h0 : 1] id_23, id_24;
  assign id_22 = id_22.id_20;
  logic id_25[-1 'b0 : -1 'b0];
  id_26 :
  assert property (@(posedge id_26 !== id_26) id_6)
  else @(posedge -1) if (1);
endmodule
