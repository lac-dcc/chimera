// Seed: 2150155778
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout supply1 id_6;
  input wire id_5;
  assign module_1.id_10 = 0;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_6 = -1;
  parameter id_7 = 1;
  wire id_8, id_9;
endmodule
module module_1 #(
    parameter id_15 = 32'd57,
    parameter id_3  = 32'd29
) (
    input supply1 id_0,
    input uwire id_1,
    output wire id_2,
    input supply1 _id_3,
    output logic id_4,
    output tri id_5,
    input supply1 id_6,
    input wor id_7,
    input wor id_8,
    input uwire id_9,
    input wor void id_10,
    output logic id_11,
    output tri1 id_12,
    input wand id_13
);
  assign id_5 = (-1'd0);
  wire _id_15;
  ;
  task id_16(input id_17, [-1 'h0 : id_3] id_18);
    begin : LABEL_0
      id_11 <= id_16;
      if (1)
        @(negedge id_3) begin : LABEL_1
          if ({1{1}}) id_4 = id_6;
          $clog2(12);
          ;
          id_18 = 1;
        end
      if (1) id_4 <= !~id_17[""][-1].id_9;
    end
  endtask
  tri ["" : id_15] id_19 = {1 != -1, id_17};
  struct packed {
    logic   id_20;
    integer id_21;
    logic   id_22;
  } id_23;
  ;
  nor primCall (
      id_2,
      id_8,
      id_19,
      id_17,
      id_9,
      id_16,
      id_0,
      id_20,
      id_10,
      id_18,
      id_7,
      id_1,
      id_22,
      id_13,
      id_6,
      id_21
  );
  module_0 modCall_1 (
      id_22,
      id_20,
      id_16,
      id_20,
      id_23,
      id_23
  );
  time id_24;
  ;
endmodule
