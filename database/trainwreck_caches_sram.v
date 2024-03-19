module sram_readafter #(parameter WIDTH=1, parameter LG_DEPTH=1, parameter BYTESIZE=WIDTH)
(
  input  wire [LG_DEPTH-1:0]        A1,
  input  wire [WIDTH/BYTESIZE-1:0]  BM1,
  input  wire                       CE1,
  input  wire                       WEB1,
  input  wire                       OEB1,
  input  wire                       CSB1,
  input  wire [WIDTH-1:0]           I1,
  output wire [WIDTH-1:0]           O1
);

  logic [WIDTH-1:0] dout;
  (* syn_ramstyle = "block_ram" *) logic [BYTESIZE-1:0] ram [2**LG_DEPTH-1:0][WIDTH/BYTESIZE-1:0];

  logic [LG_DEPTH-1:0] reg_addr;

  always_ff @(posedge CE1)
  begin
    reg_addr <= A1; 
  end

  generate
    genvar i;
    for(i = 0; i < WIDTH/BYTESIZE; i++) begin
      always_ff @(posedge CE1) begin
        if(!WEB1 && !CSB1 && BM1[i])
            ram[A1][i] <= I1[BYTESIZE*(i+1)-1:BYTESIZE*i];
      end
      assign dout[BYTESIZE*(i+1)-1:BYTESIZE*i] = ram[reg_addr][i];
    end
  endgenerate

//  assign O1 = OEB1 ? 'z : dout;
  assign O1 = dout;

endmodule

module sram #(parameter WIDTH=1, parameter LG_DEPTH=1, parameter BYTESIZE=WIDTH)
(
  input  wire [LG_DEPTH-1:0]        A1,
  input  wire [WIDTH/BYTESIZE-1:0]  BM1,
  input  wire                       CE1,
  input  wire                       WEB1,
  input  wire                       OEB1,
  input  wire                       CSB1,
  input  wire [WIDTH-1:0]           I1,
  output wire [WIDTH-1:0]           O1
);

  logic [WIDTH-1:0] dout;
  (* syn_ramstyle = "block_ram" *) logic [BYTESIZE-1:0] ram [2**LG_DEPTH-1:0][WIDTH/BYTESIZE-1:0];

  generate
    genvar i;
    for(i = 0; i < WIDTH/BYTESIZE; i++) begin
      always_ff @(posedge CE1) begin
        if(!WEB1 && !CSB1 && BM1[i])
            ram[A1][i] <= I1[BYTESIZE*(i+1)-1:BYTESIZE*i];
        dout[BYTESIZE*(i+1)-1:BYTESIZE*i] <= ram[A1][i];
      end
    end
  endgenerate

//  assign O1 = OEB1 ? 'z : dout;
  assign O1 = dout;

endmodule

module sram_1r1w #(parameter WIDTH=1, parameter LG_DEPTH=1, parameter BYTESIZE=WIDTH)
(
  input  wire                       CE1,
  input  wire                       OEB1,
  input  wire                       CSB1,
  input  wire [LG_DEPTH-1:0]        A1,
  output wire [WIDTH-1:0]           O1,
  input  wire                       CE2,
  input  wire                       WEB2,
  input  wire                       CSB2,
  input  wire [LG_DEPTH-1:0]        A2,
  input  wire [WIDTH/BYTESIZE-1:0]  BM2,
  input  wire [WIDTH-1:0]           I2
);

  logic [WIDTH-1:0] dout;
  (* syn_ramstyle = "block_ram" *) logic [BYTESIZE-1:0] ram [2**LG_DEPTH-1:0][WIDTH/BYTESIZE-1:0];

  logic [LG_DEPTH-1:0] reg_addr;

  always_ff @(posedge CE1)
  begin
    reg_addr <= A1; 
  end

  generate
    genvar i;
    for(i = 0; i < WIDTH/BYTESIZE; i++) begin
      assign dout[BYTESIZE*(i+1)-1:BYTESIZE*i] = ram[reg_addr][i];
      always_ff @(posedge CE2) begin
        if(!WEB2 && !CSB2 && BM2[i])
            ram[A2][i] <= I2[BYTESIZE*(i+1)-1:BYTESIZE*i];
      end
    end
  endgenerate

//  assign O1 = !CSB1 && OEB1 ? 'z : dout;
  assign O1 = dout;

endmodule
