// Seed: 4210172928
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
    id_12
);
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_13;
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    input  wand  id_2,
    input  logic id_3,
    input  logic id_4,
    output logic id_5
    , id_7
);
  assign id_5 = 1;
  reg id_8;
  always_latch @*
    if (id_7) begin : LABEL_0
      id_5 <= id_4;
      fork
        id_8 <= 1;
        #1 begin : LABEL_0
          if (1)
            if (id_0) id_7 <= 1;
            else begin : LABEL_0
              id_7 <= id_3;
            end
        end
      join
      @(negedge id_5++);
      id_8 <= id_1;
      id_7 <= 1 == id_8 && id_8;
    end
  wire id_9;
  assign id_7 = id_0;
  always @(*)
    if (1) begin : LABEL_0
      assign id_8 = 1'b0;
    end
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9
  );
endmodule
